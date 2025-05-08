################################################################################
#
# Copyright (C) 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
################################################################################

import yaml
import os
import sys
import shutil
import argparse
from copy import deepcopy
from enum import IntEnum
import re

verbosity = 1

def ensurePath(path):
  if not os.path.exists(path):
    os.makedirs(path)
  return path

def allFiles(startDir):
    current = os.listdir(startDir)
    files = []
    for filename in [_current for _current in current if os.path.splitext(_current)[-1].lower() == '.yaml']:
        fullPath = os.path.join(startDir,filename)
        if os.path.isdir(fullPath):
            files = files + allFiles(fullPath)
        else:
            files.append(fullPath)
    return files

def reindexSolutions(data):
    for i, _ in enumerate(data[5]):
        data[5][i]["SolutionIndex"] = i
    return data

def fixSizeInconsistencies(sizes, fileType):
    duplicates = list()
    for i in range(0,len(sizes)):
        currSize = sizes[i][0]
        # >= so size will be trimmed when a SolutionTag is included
        if len(currSize) >= 8:
            currSize = currSize[:-4]
            if currSize in (item for index in sizes for item in index):
                duplicates.append(i-len(duplicates))
            else:
                sizes[i][0] = currSize
    sizes_ = deepcopy(sizes)
    if len(duplicates) > 0:
        for i in duplicates:
            sizes_.pop(i)
        verbose(len(duplicates), "duplicate size(s) removed from", fileType, "logic file")
    return sizes_, len(sizes_)

# remove dict keys "SolutionIndex" and "SolutionNameMin" from dict
def cmpHelper(sol):
    return {k:v for k, v in sol.items() if k!="SolutionIndex" and k!="SolutionNameMin"}

def addKernel(solutionPool, solution):
    for item in solutionPool:
        if cmpHelper(item) == cmpHelper(solution):
            index = item["SolutionIndex"]
            debug("...Reuse previously existed kernel", end="")
            break
    else:
        index = len(solutionPool)
        _solution = deepcopy(solution) # if we don't we will see some subtle errors
        _solution["SolutionIndex"] = index
        solutionPool.append(_solution)
        debug("...A new kernel has been added", end="")
    debug("({}) {}".format(index, solutionPool[index]["SolutionNameMin"] if "SolutionNameMin" in solutionPool[index] else "(SolutionName N/A)"))
    return solutionPool, index

# update dependant parameters if StaggerU == 0
def sanitizeSolutions(solList):
    for sol in solList:
        if sol.get("StaggerU") == 0:
            sol["StaggerUMapping"] = 0
            sol["StaggerUStride"] = 0
            sol["_staggerStrideShift"] = 0

def removeUnusedKernels(oriData, prefix=""):
    origNumSolutions = len(oriData[5])

    kernelsInUse = [ index for _, [index, _] in oriData[7] ]
    for i, solution in enumerate(oriData[5]):
        solutionIndex = solution["SolutionIndex"]
        oriData[5][i]["__InUse__"] = True if solutionIndex in kernelsInUse else False

    # debug prints
    for o in [o for o in oriData[5] if o["__InUse__"]==False]:
        debug("{}Solution ({}) {} is unused".format(
            prefix,
            o["SolutionIndex"],
            o["SolutionNameMin"] if "SolutionNameMin" in o else "(SolutionName N/A)"))

    # filter out dangling kernels
    oriData[5] = [ {k: v for k, v in o.items() if k != "__InUse__"}
                    for o in oriData[5] if o["__InUse__"]==True ]

    # reindex solutions
    idMap = {} # new = idMap[old]
    for i, solution in enumerate(oriData[5]):
        idMap[solution["SolutionIndex"]] = i
        oriData[5][i]["SolutionIndex"] = i
    for i, [size, [oldSolIndex, eff]] in enumerate(oriData[7]):
        oriData[7][i] = [size, [idMap[oldSolIndex], eff]]

    numInvalidRemoved = origNumSolutions - len(oriData[5])
    return oriData, numInvalidRemoved

def loadData(filename):
    try:
        stream = open(filename, "r")
    except IOError:
        print("Cannot open file: ", filename)
        sys.stdout.flush()
        sys.exit(-1)
    data = yaml.load(stream, yaml.SafeLoader)
    return data

def compareDestFolderToYaml(originalDir, incFile, incData):
    checkFolders = ["Equality", "GridBased"]
    # Parsing destination folder and yaml attribute
    destFolder = originalDir.rstrip('/').split('/')[-1]
    incAttribute = incData[11] # the last item in yaml file
    if not incAttribute:
        sys.exit(f"[Error] Empty YAML attribute. Need to set Equality or GridBased in {incFile}.")
    # Check Equality and GradBased folders only
    if destFolder in checkFolders and destFolder != incAttribute:
        restuls = f"\t{incFile} must be {destFolder} tuning"
        sys.exit(f"[Error] Destination folder(={destFolder}) failed to match YAML attribute(={incAttribute}): \n{restuls}")

def compareProblemType(oriData, incData):
    # ProblemType defined in originalFiles and incrementalFiles
    oriProblemType = oriData[4] # header
    incProblemType = incData[4] # header
    # Delete waived ProblemType items in originalFiles
    waivedItems = [item for item in oriProblemType if item not in incProblemType]
    if waivedItems:
        # Header ProblemType
        for item in waivedItems:
            oriProblemType.pop(item)
        # Kernel ProblemType
        for i, _ in enumerate(oriData[5]):
            # TODO: delete this for loop if kernel ProblemType is removed in the future
            oriKernelProblemType = oriData[5][i]["ProblemType"]
            for item in waivedItems:
                try:
                    oriKernelProblemType.pop(item)
                except KeyError:
                    oriSolutionIndex = oriData[5][i]["SolutionIndex"]
                    print(f"[Warning] Popping '{item}' failed in oriData(idx={oriSolutionIndex})")

    results = ""
    solIdx = 0
    # Compare existing ProblemType items of originalFiles with incrementalFiles
    for i, _ in enumerate(incData[5]):
        # TODO: check header ProblemType if kernel ProblemType is removed in the future
        incKernelProblemType = incData[5][i]["ProblemType"]
        if oriProblemType !=  incKernelProblemType:
            for item in oriProblemType:
                if oriProblemType[item] != incKernelProblemType[item]:
                    results += f"\t{item}: {oriProblemType[item]} != {incKernelProblemType[item]}\n"
            solIdx = i
            break
    if (results):
        sys.exit(f"[Error] ProblemType in library logic doesn't match solution(idx={solIdx}): \n{results}")

# this is for complying the behavior of legacy merge script, where incremental logic
# file always replaces the base logic file even it's slower in performance -
# in the future we may let default force merge policy = False
def defaultForceMergePolicy(incFile):
    if "arcturus" in incFile:
        forceMerge = False
    else:
        forceMerge = True

    return forceMerge

def msg(*args, **kwargs):
    for i in args: print(i, end=" ")
    print(**kwargs)

def verbose(*args, **kwargs):
    if verbosity < 1: return
    msg(*args, **kwargs)

def debug(*args, **kwargs):
    if verbosity < 2: return
    msg(*args, **kwargs)

# Tags distinguishing solution types
# Can be added to size key to allow solutions of each type to be present
# in logic file for a given size
class MfmaTag(IntEnum):
    VALU = 0
    MFMA = 1

    def __str__(self):
        return ["VALU", "MFMA"][self]
    def __repr__(self):
        return str(self)

class AlphaValueTag(IntEnum):
    ANY    = 0
    ONE    = 1
    NEG_ONE = 2
    ZERO   = 3

    def __str__(self):
        return "Alpha="+["Any", "1", "-1", "0"][self]
    def __repr__(self):
        return str(self)

class BetaValueTag(IntEnum):
    ANY    = 0
    ONE    = 1
    NEG_ONE = 2
    ZERO   = 3

    def __str__(self):
        return "Beta="+["Any", "1", "-1", "0"][self]
    def __repr__(self):
        return str(self)

def strToScalarValueTag(Class, value):
    if value == "Any":
        return Class.ANY
    if value == 1:
        return Class.ONE
    if value == -1:
        return Class.NEG_ONE
    if value == 0:
        return Class.ZERO
    else:
        raise RuntimeError("Unsupported value for Alpha/Beta scalar value")

class CEqualsDTag(IntEnum):
    C_EQ_D  = 0
    C_NEQ_D = 1

    def __str__(self):
        return ["C=D", "C!=D"][self]
    def __repr__(self):
        return str(self)

# Tag of form (MFMATag, AlphaValueTag, BetaValueTag, CEqualsDTag)
def getSolutionTag(solution):
    tagTuple = ()
    if solution.get("EnableMatrixInstruction", False) or solution.get("MatrixInstruction", False):
        tagTuple = tagTuple + (MfmaTag.MFMA,)
    else:
        tagTuple = tagTuple + (MfmaTag.VALU,)

    return tagTuple

def findSolutionWithIndex(solutionData, solIndex):
    # Check solution at the index corresponding to solIndex first
    if solIndex < len(solutionData) and solutionData[solIndex]["SolutionIndex"] == solIndex:
        return solutionData[solIndex]
    else:
        debug("Searching for index...")
        solution = [s for s in solutionData if s["SolutionIndex"]==solIndex]
        assert(len(solution) == 1)
        return solution[0]

def addSolutionTagToKeys(solutionMap, solutionPool):
    return [[[getSolutionTag(findSolutionWithIndex(solutionPool, idx))] + keys, [idx, eff]]
            for [keys, [idx, eff]] in solutionMap]

def removeSolutionTagFromKeys(solutionMap):
    return [[keys[1:], [idx, incEff]] for keys, [idx, incEff] in solutionMap]

# To be used with add_solution_tags to allow faster general solutions to supercede slower specific ones
def findFastestCompatibleSolution(origDict, sizeMapping):
    tags = sizeMapping[0]
    # Tag of form (MFMATag, AlphaValueTag, BetaValueTag, CEqualsDTag)
    compatibleTagList = [tags]

    # Add all compatible tags to the list
    if tags[1] != AlphaValueTag.ANY:
        compatibleTagList = compatibleTagList + [(t[0], AlphaValueTag.ANY) + t[2:] for t in compatibleTagList]
    if tags[2] != BetaValueTag.ANY:
        compatibleTagList = compatibleTagList + [t[:2] + (BetaValueTag.ANY,) + t[3:] for t in compatibleTagList]
    if tags[3] != CEqualsDTag.C_NEQ_D:
        compatibleTagList = compatibleTagList + [t[:3] + (CEqualsDTag.C_NEQ_D,) + t[4:] for t in compatibleTagList]

    #Find the fastest efficiency of all compatible tags
    maxEfficiency = 0
    for tag in compatibleTagList:
        result = origDict.get((tag,) + sizeMapping[1:], None)
        if result:
            _, eff = origDict[(tag,) + sizeMapping[1:]]
            maxEfficiency = max(maxEfficiency, eff)

    return maxEfficiency


# returns merged logic data as list
def mergeLogic(oriData, incData, forceMerge, trimSize=True, addSolutionTags=False, noEff=False):
    origNumSizes = len(oriData[7])
    origNumSolutions = len(oriData[5])

    incData[7] = incData[7] or []
    incNumSizes = len(incData[7])
    incNumSolutions = len(incData[5])

    verbose(origNumSizes, "sizes and", origNumSolutions, "kernels in base logic file")
    verbose(incNumSizes, "sizes and", incNumSolutions, "kernels in incremental logic file")

    # Add SolutionTag to distinguish solutions with different requirements
    origTaggedSizes = addSolutionTagToKeys(oriData[7], oriData[5])
    incTaggedSizes  = addSolutionTagToKeys(incData[7],  incData[5])
    if addSolutionTags:
        oriData[7] = origTaggedSizes
        incData[7] = incTaggedSizes
    # Print warning if addSolutionTags=False results in removed sizes
    else:
        origSet       = {tuple(size) for size, [_, _] in oriData[7]}
        origTaggedSet = {tuple(size) for size, [_, _] in origTaggedSizes}
        incSet        = {tuple(size) for size, [_, _] in incData[7]}
        incTaggedSet  = {tuple(size) for size, [_, _] in incTaggedSizes}

        if len(origSet) != len(origTaggedSet):
            verbose("Warning:", len(origTaggedSet) - len(origSet), "duplicate sizes are present in base logic",
                    "that may not be handled correctly unless --add_solution_tags is used")
        if len(incSet) != len(incTaggedSet):
            verbose("Warning:", len(incTaggedSet) - len(incSet), "duplicate sizes are present in incremental logic",
                    "that may not be handled correctly unless --add_solution_tags is used")



    if trimSize:
        # trim 8-tuple gemm size format to 4-tuple [m, n, b, k]
        # TODO future gemm size could include dictionary format so need robust preprocessing
        [oriData[7], origNumSizes] = fixSizeInconsistencies(oriData[7], "base")
        [incData[7], incNumSizes] = fixSizeInconsistencies(incData[7], "incremental")

    sanitizeSolutions(oriData[5])
    sanitizeSolutions(incData[5])
    oriData, numOrigRemoved = removeUnusedKernels(oriData, "Base logic file: ")
    incData, numIncRemoved = removeUnusedKernels(incData, "Inc logic file: ")

    solutionPool = deepcopy(oriData[5])
    solutionMap = deepcopy(oriData[7])

    origDict = {tuple(origSize): [i, origEff] for i, [origSize, [origIndex, origEff]] in enumerate(oriData[7])}
    for incSize, [incIndex, incEff] in incData[7]:
        incSolution = findSolutionWithIndex(incData[5], incIndex)

        storeEff = incEff if noEff == False else 0.0
        try:
            j, origEff = origDict[tuple(incSize)]
            if incEff > origEff or forceMerge:
                if incEff > origEff:
                    verbose("[O]", incSize, "already exists and has improved in performance.", end="")
                elif forceMerge:
                    verbose("[!]", incSize, "already exists but does not improve in performance.", end="")
                verbose("Efficiency:", origEff, "->", incEff, "(force_merge=True)" if forceMerge else "")
                solutionPool, index = addKernel(solutionPool, incSolution)
                solutionMap[j][1] = [index, storeEff]
            else:
                verbose("[X]", incSize, "already exists but does not improve in performance.", end="")
                verbose("Efficiency:", origEff, "->", incEff)
        except KeyError:
            if addSolutionTags and findFastestCompatibleSolution(origDict, tuple(incSize)) > incEff:
                verbose("[X]", incSize, "has been rejected because a compatible solution already exists with higher performance")
            else:
                verbose("[-]", incSize, "has been added to solution table, Efficiency: N/A ->", incEff)
                solutionPool, index = addKernel(solutionPool, incSolution)
                solutionMap.append([incSize,[index, storeEff]])

    verbose(numOrigRemoved, "unused kernels removed from base logic file")
    verbose(numIncRemoved, "unused kernels removed from incremental logic file")

    # Remove SolutionTag for yaml output
    if addSolutionTags:
        solutionMap = removeSolutionTagFromKeys(solutionMap)

    mergedData = deepcopy(oriData)
    mergedData[5] = solutionPool
    mergedData[7] = solutionMap
    mergedData, numReplaced = removeUnusedKernels(mergedData, "Merged data: ")

    numSizesAdded = len(solutionMap)-len(oriData[7])
    numSolutionsAdded = len(solutionPool)-len(oriData[5])
    numSolutionsRemoved = numReplaced+numOrigRemoved # incremental file not counted

    return [mergedData, numSizesAdded, numSolutionsAdded, numSolutionsRemoved]

def ModifySpecificArg(originalDir, incrementalDir, outputPath, forceMerge, trimSize=True, addSolutionTags=False, noEff=False):
    # oriData = loadData(originalDir)
    # print(oriData[5][1])
    # print(oriData[5][1]["GlobalSplitU"])
    # print(oriData[5][1]["NonTemporalD"])
    # if oriData[5][1]["GlobalSplitU"] == 1:
    #     oriData[5][1]["NonTemporalD"] = 4
    # print(oriData[5][1]["NonTemporalD"])
    originalFiles = allFiles(originalDir)
    incrementalFiles = allFiles(incrementalDir)
    ensurePath(outputPath)

    incrementalFilesTemp = []
    originalFileNames = [os.path.split(o)[-1] for o in originalFiles]
    for file in incrementalFiles:
        if os.path.split(file)[-1] in originalFileNames:
            incrementalFilesTemp.append(file)
        else:
            outputFile = os.path.join(outputPath, os.path.split(file)[-1])
            shutil.copyfile(file, outputFile)
            msg("Copied", file, "to", outputFile)

    incrementalFiles = incrementalFilesTemp

    for incFile in incrementalFiles:
        basename = os.path.split(incFile)[-1]
        origFile = os.path.join(originalDir, basename)
        forceMerge = defaultForceMergePolicy(incFile) if forceMerge is None else forceMerge

        msg("Base logic file:", origFile, "| Incremental:", incFile, "| Merge policy: %s"%("Forced" if forceMerge else "Winner"), "| Trim size:", trimSize,
        "| Add solution tags:", addSolutionTags)
        mergedData = loadData(origFile)
        # incData = loadData(incFile)

        # # Terminate when the destination folder doesn't match Incremental logic yaml
        # # For example, merge Gridbased yaml to Equality folder or Equality yaml to GridBased folder
        # compareDestFolderToYaml(originalDir, incFile, incData)

        # # Terminate when ProblemType of originalFiles and incrementalFiles mismatch
        # compareProblemType(oriData, incData)

        # # So far "SolutionIndex" in logic yamls has zero impact on actual 1-1 size mapping (but the order of the Solution does)
        # # since mergeLogic() takes that value very seriously so we reindex them here so it doesn't choke on duplicated SolutionIndex
        # oriData = reindexSolutions(oriData)
        # incData = reindexSolutions(incData)

        # mergedData, *stats = mergeLogic(oriData, incData, forceMerge, trimSize, addSolutionTags, noEff)
        # msg(stats[0], "size(s) and", stats[1], "kernel(s) added,", stats[2], "kernel(s) removed")

        for i, _ in enumerate(mergedData[5]):
            if mergedData[5][i]["GlobalSplitU"] == 1:
                print("SolutionIndex: ", mergedData[5][i]["SolutionIndex"])
                print("SolutionNameMin: ", mergedData[5][i]["SolutionNameMin"])
                print("NonTemporalD: ", mergedData[5][i]["NonTemporalD"])
                mergedData[5][i]["NonTemporalD"] = 4
                print(mergedData[5][i]["NonTemporalD"])

        with open(os.path.join(outputPath, basename), "w") as outFile:
            yaml.safe_dump(mergedData,outFile,default_flow_style=None)
        msg("File written to", os.path.join(outputPath, basename))
        msg("------------------------------")

def avoidRegressions(originalDir, incrementalDir, outputPath, forceMerge, trimSize=True, addSolutionTags=False, noEff=False):
    originalFiles = allFiles(originalDir)
    incrementalFiles = allFiles(incrementalDir)
    ensurePath(outputPath)

    incrementalFilesTemp = []
    originalFileNames = [os.path.split(o)[-1] for o in originalFiles]
    for file in incrementalFiles:
        if os.path.split(file)[-1] in originalFileNames:
            incrementalFilesTemp.append(file)
        else:
            outputFile = os.path.join(outputPath, os.path.split(file)[-1])
            shutil.copyfile(file, outputFile)
            msg("Copied", file, "to", outputFile)

    incrementalFiles = incrementalFilesTemp

    for incFile in incrementalFiles:
        basename = os.path.split(incFile)[-1]
        origFile = os.path.join(originalDir, basename)
        forceMerge = defaultForceMergePolicy(incFile) if forceMerge is None else forceMerge

        msg("Base logic file:", origFile, "| Incremental:", incFile, "| Merge policy: %s"%("Forced" if forceMerge else "Winner"), "| Trim size:", trimSize,
        "| Add solution tags:", addSolutionTags)
        oriData = loadData(origFile)
        incData = loadData(incFile)

        # Terminate when the destination folder doesn't match Incremental logic yaml
        # For example, merge Gridbased yaml to Equality folder or Equality yaml to GridBased folder
        compareDestFolderToYaml(originalDir, incFile, incData)

        # Terminate when ProblemType of originalFiles and incrementalFiles mismatch
        compareProblemType(oriData, incData)

        # So far "SolutionIndex" in logic yamls has zero impact on actual 1-1 size mapping (but the order of the Solution does)
        # since mergeLogic() takes that value very seriously so we reindex them here so it doesn't choke on duplicated SolutionIndex
        oriData = reindexSolutions(oriData)
        incData = reindexSolutions(incData)

        mergedData, *stats = mergeLogic(oriData, incData, forceMerge, trimSize, addSolutionTags, noEff)
        msg(stats[0], "size(s) and", stats[1], "kernel(s) added,", stats[2], "kernel(s) removed")

        with open(os.path.join(outputPath, basename), "w") as outFile:
            yaml.safe_dump(mergedData,outFile,default_flow_style=None)
        msg("File written to", os.path.join(outputPath, basename))
        msg("------------------------------")

# partialLogicFilePaths: list of full paths to partial logic files
# outputDir: Directory to write the final result to
# forceMerge:
# trimSize:
# Expects: that all the partial logic files
# have the same base name, but are located
# in different folders.
# Provides: one final logic file that is the
# merged result of all partial files.
# This is useful for when a tuning task is
# shared between multiple machines who each
# will provide a partial result.
def mergePartialLogics(partialLogicFilePaths, outputDir, forceMerge, trimSize=True, addSolutionTags=False):
    logicFiles = deepcopy(partialLogicFilePaths)
    ensurePath(outputDir)

    baseLogicFile = logicFiles.pop(0)
    baseLogicData = loadData(baseLogicFile)
    msg("Base logic file:", baseLogicFile)
    for f in logicFiles:
        forceMerge = defaultForceMergePolicy(f) if forceMerge is None else forceMerge

        msg("Incremental file:", f, "| Merge policy: %s"%("Forced" if forceMerge else "Winner"), "| Trim size:", trimSize)
        incLogicData = loadData(f)

        # So far "SolutionIndex" in logic yamls has zero impact on actual 1-1 size mapping (but the order of the Solution does)
        # since mergeLogic() takes that value very seriously so we reindex them here so it doesn't choke on duplicated SolutionIndex
        baseLogicData = reindexSolutions(baseLogicData)
        incLogicData = reindexSolutions(incLogicData)

        mergedData, *stats = mergeLogic(baseLogicData, incLogicData, forceMerge, trimSize, addSolutionTags)
        msg(stats[0], "size(s) and", stats[1], "kernel(s) added,", stats[2], "kernel(s) removed")

        # Use the merged data as the base data for the next partial logic file
        baseLogicData = deepcopy(mergedData)


    baseFileName = os.path.basename(baseLogicFile)
    outputFilePath = os.path.join(outputDir, baseFileName)
    with open(outputFilePath, "w") as outFile:
        yaml.safe_dump(baseLogicData, outFile, default_flow_style=None)
    msg("File written to", outputFilePath)
    msg("------------------------------")

def direceCopyLogics(originalDir, incrementalDir, outputPath, forceMerge, trimSize=True, addSolutionTags=False, noEff=False):
    originalFiles = allFiles(originalDir)
    incrementalFiles = allFiles(incrementalDir)
    ensurePath(outputPath)

    incrementalFilesTemp = []
    originalFileNames = [os.path.split(o)[-1] for o in originalFiles]
    for file in incrementalFiles:
        if os.path.split(file)[-1] in originalFileNames:
            incrementalFilesTemp.append(file)
        # else:
        #     outputFile = os.path.join(outputPath, os.path.split(file)[-1])
        #     shutil.copyfile(file, outputFile)
        #     msg("Copied", file, "to", outputFile)

    incrementalFiles = incrementalFilesTemp

    basename = os.path.split(incrementalFiles[0])[-1]
    origFile = os.path.join(originalDir, basename)
    text=""
    print("ori logic file : ", origFile)
    with open(origFile, "r") as file:
        text = file.read()
    textInc=""
    print("inc logic file : ", incrementalFiles[0])
    with open(incrementalFiles[0], "r") as file:
        textInc = file.read()

    string = "SolutionIndex: "
    oriTotalIndex = text.count(string)
    incTotalIndex = textInc.count(string)
    print("ori.count(sub) : ", oriTotalIndex)
    print("inc.count(sub) : ", incTotalIndex)

    textInc = textInc.replace("- - 1LDSBuffer:", "  - 1LDSBuffer:")

    for reIncIndex in reversed(range(incTotalIndex)): #reindex
        print("    - [" + str(oriTotalIndex+reIncIndex) + ", ")
        print("    - [" + str(reIncIndex) + ", ")
        textInc = textInc.replace("SolutionIndex: " + str(reIncIndex) + "\n", "SolutionIndex: " + str(oriTotalIndex+reIncIndex) + "\n")
        textInc = textInc.replace("    - [" + str(reIncIndex) + ", ", "    - [" + str(oriTotalIndex+reIncIndex) + ", ")


    textMerge = text[:text.index("- - 1LDSBuffer:")] + \
                text[text.index("- - 1LDSBuffer:"):text.index("- [2, 3, 0, 1]")] + \
                textInc[textInc.index("  - 1LDSBuffer:"):textInc.index("- [2, 3, 0, 1]")] + \
                text[text.index("- [2, 3, 0, 1]"):-45] + " " + textInc[textInc.index("- [2, 3, 0, 1]")+16:]

    with open(os.path.join(outputPath, basename), "w") as outFile:
        outFile.write(textMerge)
    msg("File written to", os.path.join(outputPath, basename))
    msg("------------------------------")

def removeDuplicateLogics(originalDir, incrementalDir, outputPath, forceMerge, trimSize=True, addSolutionTags=False, noEff=False):

    basename = os.path.split(originalDir)[1]
    origFile = originalDir # os.path.join(originalDir, basename)
    
    with open(origFile, "r") as file:
        text = file.read()

    textReduce = text # after reduce

    pos = -1
    if text.find("- - 1LDSBuffer:") != -1:
        posPreStart = text.find("- - 1LDSBuffer:")
        pos = posPreStart + len("- - 1LDSBuffer:")
        pos = text.find("  - 1LDSBuffer:", pos) #結尾也是下個開頭

    bypassitem = ["KernelNameMin:.*\n", "SolutionNameMin:.*\n", "SolutionIndex:.*\n"]
    bypassstring = ["KernelNameMin:bypass\n", "SolutionNameMin:bypass\n", "SolutionIndex:bypass\n"]

    sol_unique = []
    sol_bypass = []
    index_count = 0

    while(pos != -1):
        # pos = text.find("  - 1LDSBuffer:", pos) #結尾也是下個開頭

        text_ori = text[posPreStart:pos]
        text_bypass = text[posPreStart:pos]

        for idx in range(len(bypassitem)):
            text_bypass = re.sub(bypassitem[idx], bypassstring[idx], text_bypass) # 將這些不重要的都換成一樣
        print(text_ori[text_ori.index("SolutionIndex"):text_ori.index("SolutionIndex")+len("SolutionIndex: ")+4]) # 將這些不重要的都換成一樣

        if (text_bypass not in sol_bypass):

            indInxe = text_ori.find("SolutionIndex")
            indInend = text_ori[indInxe:].find("\n") #get ori SolutionIndex position
            ori_SolutionIndex = text_ori[indInxe+15:indInxe+indInend]
            print("ori_SolutionIndex: ", ori_SolutionIndex, "count: ", textReduce.count("    - [" + ori_SolutionIndex + ","))
            # print("ori_SolutionIndex: ", textReduce.find("    - [" + ori_SolutionIndex + ","))

            # if textReduce.find("    - [" + ori_SolutionIndex + ",") != -1:
            #     sol_unique.append(text_ori.replace("SolutionIndex: " + ori_SolutionIndex + "\n", "SolutionIndex: "+ str(index_count) +"\n")) #REINDEX
            #     sol_bypass.append(text_bypass)

            #     indRexe = sol_unique[sol_bypass.index(text_bypass)].find("SolutionIndex")
            #     indReend = sol_unique[sol_bypass.index(text_bypass)][indRexe:].find("\n") #get reindex SolutionIndex position
            #     reindex_SolutionIndex = sol_unique[sol_bypass.index(text_bypass)][indRexe+15:indRexe+indReend] #str(index_count)

            #     if (str(index_count) != reindex_SolutionIndex):
            #         print("not match!!!!!!!!!!!!!!!!!!!")
            #     textReduce = textReduce.replace("SolutionIndex: " + ori_SolutionIndex + "\n", "SolutionIndex: "+ reindex_SolutionIndex +"\n") # 將沒重複的solution index 換成reindex
            #     textReduce = textReduce.replace("    - [" + ori_SolutionIndex + ",", "    - [" + reindex_SolutionIndex + ",") # 將index 換成換成reindex
            #     print(ori_SolutionIndex, " REINDEX-> ", reindex_SolutionIndex, " ", index_count)

            #     index_count = index_count + 1
            # else:
            #     textReduce = textReduce.replace(text_ori, "") # 將重複的solution 刪掉
        else:

            indInxe = sol_unique[sol_bypass.index(text_bypass)].find("SolutionIndex")
            indInend = sol_unique[sol_bypass.index(text_bypass)][indInxe:].find("\n")
            dup_SolutionIndex = sol_unique[sol_bypass.index(text_bypass)][indInxe+15:indInxe+indInend]

            indDupxe = text_ori.find("SolutionIndex")
            indDupend = text_ori[indDupxe:].find("\n")
            ori_SolutionIndex = text_ori[indDupxe+15:indDupxe+indDupend]

            print(ori_SolutionIndex, " Same As-> ", dup_SolutionIndex)
            textReduce = textReduce.replace(text_ori, "") # 將重複的solution 刪掉
            textReduce = textReduce.replace("    - [" + ori_SolutionIndex + ",", "    - [" + dup_SolutionIndex + ",") # 將重複的solution 換成一樣的

        posPreStart = pos
        pos = posPreStart + len("  - 1LDSBuffer:")
        # pos = text.find("  - 1LDSBuffer:", pos) #結尾也是下個開頭
        if (text.find("  - 1LDSBuffer:", pos) == -1):
            pos = text.find("- [2, 3, 0, 1]", pos) #結尾也是下個開頭
            # print(text_ori)
        else:
            pos = text.find("  - 1LDSBuffer:", pos)
        # print(pos)

    textMerge = textReduce

    with open(os.path.join(outputPath, basename), "w") as outFile:
        outFile.write(textMerge)
    msg("File written to", os.path.join(outputPath, basename))
    msg("------------------------------")


if __name__ == "__main__":
    argParser = argparse.ArgumentParser()
    argParser.add_argument("original_dir", help="The library logic directory without tuned sizes")
    argParser.add_argument("incremental_dir", help="The incremental logic directory")
    argParser.add_argument("output_dir", help="The output logic directory")
    argParser.add_argument("-v", "--verbosity", help="0: summary, 1: verbose, 2: debug", default=1, type=int)
    argParser.add_argument("--force_merge", help="Merge previously known sizes unconditionally. Default behavior if not arcturus", default="none")
    argParser.add_argument("--notrim", help="Do not trim long size format down to short format (m,n,b,k). Default is --trim", action="store_false")
    argParser.add_argument("--add_solution_tags", help="Add tags to the size key for solution properies, allowing for solutions with different requirements "
                           "to exist for the same size. Default doesn't add this tag.", action="store_true")
    argParser.add_argument("--no_eff", help="force set eff as 0.0.", action="store_true")

    args = argParser.parse_args(sys.argv[1:])
    originalDir = args.original_dir
    incrementalDir = args.incremental_dir
    outputPath = args.output_dir
    verbosity = args.verbosity
    forceMerge = args.force_merge.lower()
    trimSize = args.notrim
    add_solution_tags = args.add_solution_tags
    no_eff = args.no_eff

    if forceMerge in ["none"]: forceMerge=None
    elif forceMerge in ["true", "1"]: forceMerge=True
    elif forceMerge in ["false", "0"]: forceMerge=False

    print("Start")

    # avoidRegressions(originalDir, incrementalDir, outputPath, forceMerge, trimSize, add_solution_tags, no_eff)
    # mergePartialLogics(incrementalDir, outputPath, forceMerge)
    # direceCopyLogics(originalDir, incrementalDir, outputPath, forceMerge, trimSize, add_solution_tags, no_eff)
    removeDuplicateLogics(originalDir, incrementalDir, outputPath, forceMerge, trimSize, add_solution_tags, no_eff)
    # ModifySpecificArg(originalDir, incrementalDir, outputPath, forceMerge, trimSize, add_solution_tags, no_eff)
