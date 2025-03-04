/* ************************************************************************
 * Copyright (C) 2025 Advanced Micro Devices, Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 * ************************************************************************ */
#include "instruction/branch.hpp"
#include "instruction/instruction.hpp"
#include "instruction/mem.hpp"
#include "instruction/mfma.hpp"
#include "pass.hpp"

#include <iostream>
#include <memory>
#include <string>
#include <vector>
#include <queue>

namespace rocisa
{
    // Helper function to populate instructions from a module
    void _popInst(std::shared_ptr<Module> mod, std::vector<std::shared_ptr<Item>>& moduleInst)
    {
        for(auto& item : mod->items())
        {
            if(auto subModule = std::dynamic_pointer_cast<Module>(item))
            {
                _popInst(subModule, moduleInst);
            }
            else if(auto instruction = std::dynamic_pointer_cast<Instruction>(item))
            {
                moduleInst.push_back(instruction);
            }
        }
    }

    int _checkLocalReadFIFOFull(int currentCycle, std::queue<int>& fifo, std::shared_ptr<DSLoadInstruction> lrItem, int numWaves) {
        int finalCycle = currentCycle;
        int lrStallLatencyBuffer;

        if (auto lr128 = std::dynamic_pointer_cast<DSLoadB128>(lrItem)) {
            lrStallLatencyBuffer = 10;
        } else if (auto lr64 = std::dynamic_pointer_cast<DSLoadB64>(lrItem)) {
            lrStallLatencyBuffer = 5;
        } else {
            lrStallLatencyBuffer = 2;
        }

        if (fifo.size() < (16 / numWaves)) {
            fifo.push(currentCycle);
        } else {
            int oldCycle = fifo.front();
            if ((currentCycle - oldCycle) >= lrStallLatencyBuffer) {
                fifo.pop();
                fifo.push(currentCycle);
            } else {
                finalCycle = oldCycle + lrStallLatencyBuffer;
                fifo.pop();
                fifo.push(finalCycle);
            }
        }

        return finalCycle;
    }

    // Helper function to count cycles
    int _countCycles(std::shared_ptr<Module> item, int numWaves)
    {
        std::vector<std::shared_ptr<Item>> moduleInst;
        _popInst(item, moduleInst);

        int cycles = 0;
        int hwMFMA = -99;
        int jumpOverhead = 6;
        std::queue<int> hwLRFIFO;
        // Latency Table:
        // 40 quad-cycle for b128
        // 20 quad-cycle for b64
        // 10 quad-cycle for b32
        bool isEndOfLoop = false;

        for(auto& item : moduleInst)
        {
            if(auto subModule = std::dynamic_pointer_cast<Module>(item))
            {
                throw std::runtime_error("Module should be instructions here.");
            }
            else if(auto mfmaInst = std::dynamic_pointer_cast<MFMAInstruction>(item))
            {
                auto mfmaLatency = mfmaInst->getIssueLatency();
                if(cycles - hwMFMA >= (mfmaLatency - 1))
                {
                    cycles += 1;
                }
                else
                {
                    cycles = hwMFMA + mfmaLatency;
                }
                hwMFMA = cycles;
            }
            else if(auto dsReadInst = std::dynamic_pointer_cast<DSLoadInstruction>(item))
            {
                //heck LR fifo
                cycles = _checkLocalReadFIFOFull(cycles + dsReadInst->issueLatency(), hwLRFIFO, dsReadInst, numWaves);
            }
            else if(auto rwInst = std::dynamic_pointer_cast<ReadWriteInstruction>(item))
            {
                cycles += rwInst->issueLatency();
            }
            else if(auto branchInst = std::dynamic_pointer_cast<BranchInstruction>(item))
            {
                cycles = std::max(cycles + jumpOverhead, hwMFMA + 4);
                // End of loop
                if(branchInst->labelName == "label_LoopBeginL")
                {
                    isEndOfLoop = true;
                    break;
                }
            }
            else if(auto instruction = std::dynamic_pointer_cast<Instruction>(item))
            {
                cycles += 1;
            }
            if(auto instruction = std::dynamic_pointer_cast<Instruction>(item))
            {
                instruction->comment = "This is " + std::to_string(cycles) + "-cycle"; // for debug
            }
        }
        if(!isEndOfLoop)
        {
            // Loop end without label_LoopBeginL label.
            // Add jump overhead here
            cycles += jumpOverhead + 1;
        }
        return cycles * 4; // 4 for gfx9
    }

    // Function to calculate math clocks in an unrolled loop
    int _calculateMathClocksInUnrolledLoop(std::shared_ptr<Module> module, int numWaves)
    {
        // Kernel: openLoop->loopBody->noLoadLoop
        int  cycles     = -1;
        bool isOpenLoop = false;

        for(auto& item : module->items())
        {
            // Find loopBody
            if(auto subModule = std::dynamic_pointer_cast<Module>(item))
            {
                if(subModule->name == "loopBody")
                {
                    cycles = _countCycles(subModule, numWaves);
                    return cycles;
                }
            }
        }
        return -1;
    }

    // Main function to get cycles
    int getCycles(std::shared_ptr<Module> module, int numWaves)
    {
        return _calculateMathClocksInUnrolledLoop(module, numWaves);
    }
} // namespace rocisa
