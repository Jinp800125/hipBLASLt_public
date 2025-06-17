/*******************************************************************************
 *
 * MIT License
 *
 * Copyright (C) 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
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
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 *******************************************************************************/

#include <Tensile/ContractionSolution.hpp>

#include <Tensile/hip/HipUtils.hpp>

#include <Tensile/AMDGPU.hpp>
#include <Tensile/ContractionProblem.hpp>
#include <Tensile/Task.hpp>
#include <Tensile/Utils.hpp>
#include <Tensile/hip/HipHardware.hpp>

#include <Tensile/analytical/StreamK.hpp>
#include <Tensile/analytical/Utils.hpp>

#include <algorithm>
#include <cmath>
#include <cstddef>
#include <cstdlib>
#include <random>

#ifdef ENABLE_ROCTX
#include <roctracer/roctx.h>
#endif

namespace TensileLite
{
    enum class KERNELARGTYPE
    {
        NORMAL   = 0,
        HBM      = 1,
        USERARGS = 2
    };

    void setVariantToBuffer(ConstantVariant const& value,
                            void*                  buffer,
                            size_t                 bufferLength,
                            rocisa::DataType       type)
    {
        switch(type)
        {
        case rocisa::DataType::Float:
        {
            float* f_buffer = (float*)buffer;
            *f_buffer       = *std::get_if<float>(&value);
        }
        break;
        case rocisa::DataType::Double:
        {
            double* d_buffer = (double*)buffer;
            *d_buffer        = *std::get_if<double>(&value);
        }
        break;
        case rocisa::DataType::Half:
        {
            Half* fp16_buffer = (Half*)buffer;
            *fp16_buffer      = *std::get_if<Half>(&value);
        }
        break;
        case rocisa::DataType::Int32:
        {
            int32_t* i32_buffer = (int32_t*)buffer;
            *i32_buffer         = *std::get_if<int32_t>(&value);
        }
        break;
        case rocisa::DataType::BFloat16:
        {
            BFloat16* bf16_buffer = (BFloat16*)buffer;
            *bf16_buffer          = *std::get_if<BFloat16>(&value);
        }
        break;
        case rocisa::DataType::Int8:
        {
            int8_t* i8_buffer = (int8_t*)buffer;
            *i8_buffer        = *std::get_if<int8_t>(&value);
        }
        break;
        default:
        {
            if(bufferLength >= 16) // For complex
            {
                if(type == rocisa::DataType::ComplexFloat)
                {
                    std::complex<float>* c_buffer = (std::complex<float>*)buffer;
                    *c_buffer                     = *std::get_if<std::complex<float>>(&value);
                    return;
                }
                else if(type == rocisa::DataType::ComplexDouble)
                {
                    std::complex<double>* z_buffer = (std::complex<double>*)buffer;
                    *z_buffer                      = *std::get_if<std::complex<double>>(&value);
                    return;
                }
            }
            throw std::runtime_error("Unsupported ConstantVariant append type.");
        }
        }
    }

    class PrintBufferValueClass
    {
    public:
        explicit PrintBufferValueClass(void* buffer, size_t bufferLength, rocisa::DataType type)
            : m_buffer(buffer)
            , m_bufferLength(bufferLength)
            , m_type(type)
        {
        }

        friend std::ostream& operator<<(std::ostream& os, const PrintBufferValueClass& buf)
        {
            buf.printBufferValue(os);
            return os;
        }

    private:
        void printBufferValue(std::ostream& os) const
        {
            switch(m_type)
            {
            case rocisa::DataType::Float:
            {
                float* f_buffer = (float*)m_buffer;
                os << *f_buffer;
            }
            break;
            case rocisa::DataType::Double:
            {
                double* d_buffer = (double*)m_buffer;
                os << *d_buffer;
            }
            break;
            case rocisa::DataType::Half:
            {
                Half* fp16_buffer = (Half*)m_buffer;
                os << *fp16_buffer;
            }
            break;
            case rocisa::DataType::Int32:
            {
                int32_t* i32_buffer = (int32_t*)m_buffer;
                os << *i32_buffer;
            }
            break;
            case rocisa::DataType::BFloat16:
            {
                BFloat16* bf16_buffer = (BFloat16*)m_buffer;
                os << *bf16_buffer;
            }
            break;
            case rocisa::DataType::Int8:
            {
                int8_t* i8_buffer = (int8_t*)m_buffer;
                os << *i8_buffer;
            }
            break;
            default:
            {
                if(m_bufferLength >= 16) // For complex
                {
                    if(m_type == rocisa::DataType::ComplexFloat)
                    {
                        std::complex<float>* c_buffer = (std::complex<float>*)m_buffer;
                        os << *c_buffer;
                    }
                    else if(m_type == rocisa::DataType::ComplexDouble)
                    {
                        std::complex<double>* z_buffer = (std::complex<double>*)m_buffer;
                        os << *z_buffer;
                    }
                }
                throw std::runtime_error("Unsupported ConstantVariant append type.");
            }
            }
        }
        void*            m_buffer;
        size_t           m_bufferLength;
        rocisa::DataType m_type;
    };

    template <typename TAct>
    void setDeviceUserArgs(std::vector<ContractionSolution::Problem> const& problems,
                           ContractionSolution::GroupedInputs const&        inputs,
                           DeviceUserArguments<TAct>*                       args)
    {
        for(int i = 0; i < problems.size(); i++)
        {
            const TensorDescriptor& e = problems[i].tensor(ContractionProblemGemm::TENSOR::E);
            const TensorDescriptor& d = problems[i].d();
            const TensorDescriptor& c = problems[i].c();
            const TensorDescriptor& b = problems[i].b();
            const TensorDescriptor& a = problems[i].a();

            size_t startStrideCD = 1; // FIXME: Magic number
            size_t startStrideAB = 1; // FIXME: Magic number

            auto& arg    = args[i];
            arg.m        = problems[i].problemSizes()[0];
            arg.n        = problems[i].problemSizes()[1];
            arg.batch    = problems[i].problemSizes()[2];
            arg.k        = problems[i].problemSizes()[3];
            arg.d        = const_cast<void*>(inputs.grouped[i].d);
            arg.c        = const_cast<void*>(inputs.grouped[i].c);
            arg.b        = const_cast<void*>(inputs.grouped[i].b);
            arg.a        = const_cast<void*>(inputs.grouped[i].a);
            arg.strideD1 = d.strides()[startStrideCD];
            arg.strideD2 = d.strides()[startStrideCD + 1];
            arg.strideC1 = c.strides()[startStrideCD];
            arg.strideC2 = c.strides()[startStrideCD + 1];
            arg.strideA1 = a.strides()[startStrideAB];
            arg.strideA2 = a.strides()[startStrideAB + 1];
            arg.strideB1 = b.strides()[startStrideAB];
            arg.strideB2 = b.strides()[startStrideAB + 1];
            setVariantToBuffer(
                inputs.grouped[i].alpha, arg.alpha, sizeof(arg.alpha), problems[i].alphaType());
            setVariantToBuffer(
                inputs.grouped[i].beta, arg.beta, sizeof(arg.beta), problems[i].betaType());
            arg.scaleA        = const_cast<void*>(inputs.grouped[i].scaleA);
            arg.scaleB        = const_cast<void*>(inputs.grouped[i].scaleB);
            arg.scaleC        = const_cast<void*>(inputs.grouped[i].scaleC);
            arg.scaleD        = const_cast<void*>(inputs.grouped[i].scaleD);
            arg.bias          = const_cast<void*>(inputs.grouped[i].bias);
            arg.scaleAlphaVec = const_cast<void*>(inputs.grouped[i].scaleAlphaVec);
            arg.e             = const_cast<void*>(inputs.grouped[i].e);
            arg.biasType      = (uint32_t)problems[i].bias().dataType();
            if(problems[i].useE())
            {
                arg.strideE1 = e.strides()[startStrideCD];
                arg.strideE2 = e.strides()[startStrideCD + 1];
            }
            else
            {
                arg.strideE1 = 0;
                arg.strideE2 = 0;
            }
            arg.act0           = (*std::get_if<TAct>(&inputs.grouped[i].activationArgs[0]));
            arg.act1           = (*std::get_if<TAct>(&inputs.grouped[i].activationArgs[1]));
            arg.activationType = (uint32_t)problems[i].getParams().activationEnum();
        }

        bool debug = Debug::Instance().printKernelArguments();
        if(debug)
        {
            std::cout << "Grouped gemm argsPtr kernels: " << std::endl;
            for(size_t i = 0; i < problems.size(); i++)
            {
                PrintBufferValueClass alphaPrint(
                    (void*)args[i].alpha, sizeof(args[i].alpha), problems[i].alphaType());
                PrintBufferValueClass betaPrint(
                    (void*)args[i].beta, sizeof(args[i].beta), problems[i].betaType());
                std::cout << "Gemm " << i << ":" << std::endl;
                std::cout << "   "
                          << "m: " << args[i].m << std::endl;
                std::cout << "   "
                          << "n: " << args[i].n << std::endl;
                std::cout << "   "
                          << "batch: " << args[i].batch << std::endl;
                std::cout << "   "
                          << "k: " << args[i].k << std::endl;
                std::cout << "   "
                          << "D: " << args[i].d << std::endl;
                std::cout << "   "
                          << "C: " << args[i].c << std::endl;
                std::cout << "   "
                          << "A: " << args[i].a << std::endl;
                std::cout << "   "
                          << "B: " << args[i].b << std::endl;
                std::cout << "   "
                          << "strideD1: " << args[i].strideD1 << std::endl;
                std::cout << "   "
                          << "strideD2: " << args[i].strideD2 << std::endl;
                std::cout << "   "
                          << "strideC1: " << args[i].strideC1 << std::endl;
                std::cout << "   "
                          << "strideC2: " << args[i].strideC2 << std::endl;
                std::cout << "   "
                          << "strideA1: " << args[i].strideA1 << std::endl;
                std::cout << "   "
                          << "strideA2: " << args[i].strideA2 << std::endl;
                std::cout << "   "
                          << "strideB1: " << args[i].strideB1 << std::endl;
                std::cout << "   "
                          << "strideB2: " << args[i].strideB2 << std::endl;
                std::cout << "   "
                          << "Alpha: " << alphaPrint << std::endl;
                std::cout << "   "
                          << "Beta: " << betaPrint << std::endl;
                std::cout << "   "
                          << "scaleAlphaVec: " << args[i].scaleAlphaVec << std::endl;
                std::cout << "   "
                          << "bias: " << args[i].bias << std::endl;
                std::cout << "   "
                          << "e: " << args[i].e << std::endl;
                std::cout << "   "
                          << "strideE1: " << args[i].strideE1 << std::endl;
                std::cout << "   "
                          << "strideE2: " << args[i].strideE2 << std::endl;
                std::cout << "   "
                          << "act0: " << args[i].act0 << std::endl;
                std::cout << "   "
                          << "act1: " << args[i].act1 << std::endl;
                std::cout << "   "
                          << "activationType: " << args[i].activationType << std::endl;
            }
        }
    }

    template void
        setDeviceUserArgs<float>(std::vector<ContractionSolution::Problem> const& problems,
                                 ContractionSolution::GroupedInputs const&        inputs,
                                 DeviceUserArguments<float>*                      args);

    PerfModel perf;

    // check if this solution is a CU-Fallback solution for current hardware
    bool ContractionSolution::isFallbackForHW(Hardware const& hardware) const
    {
        using std::static_pointer_cast;

        // return the result if we already tested it.
        if(isFallbackCUSol != -1)
            return (isFallbackCUSol == 1);

        auto hw_pred
            = static_pointer_cast<Predicates::IsSubclass<Hardware, AMDGPU>>(hardwarePredicate);
        auto amdGPU = static_cast<AMDGPU const*>(&hardware);
        // if solution is from a standard cu lib, but current HW is not, then this is a Fallback sol.
        isFallbackCUSol
            = (hw_pred->value->type() == "Processor" && !(amdGPU->isStandardCU())) ? 1 : 0;

        return (isFallbackCUSol == 1);
    }

    // Return magic number.  If magicShift is 0, compute and return it.
    uint32_t ContractionSolution::magicNumberAlg1(uint32_t x, uint32_t* magicShift) const
    {
        uint64_t magicNum;
        *magicShift = 33;
        magicNum    = (1L << *magicShift) / x + 1;
        if((magicNum >> 32) != 0)
        {
            *magicShift = 31;
            magicNum    = (1L << *magicShift) / x + 1;
        }

        assert(magicNum >> 32 == 0); // ensure magic number fits

        return static_cast<uint32_t>(magicNum);
    }

    uint32_t ContractionSolution::magicNumberAlg2(uint32_t d, uint32_t* magicShift) const
    {
        struct mu
        {
            unsigned M; // Magic number,
            int      a; // "add" indicator,
            int      s;
        }; // and shift amount.

        struct mu magu;
        if(d == 0)
        {
            // Make dividend of 0 return 0
            magu.M = 0;
            magu.a = 0;
            magu.s = 0;
        }
        else
        {
            // Must have 1 <= d <= 2**32-1.
            int      p;
            unsigned nc, delta, q1, r1, q2, r2;
            magu.a = 0; // Initialize "add" indicator.
            nc     = -1 - (-d) % d; // Unsigned arithmetic here.
            p      = 31; // Init. p.
            q1     = 0x80000000 / nc; // Init. q1 = 2**p/nc.
            r1     = 0x80000000 - q1 * nc; // Init. r1 = rem(2**p, nc).
            q2     = 0x7FFFFFFF / d; // Init. q2 = (2**p - 1)/d.
            r2     = 0x7FFFFFFF - q2 * d; // Init. r2 = rem(2**p - 1, d).
            do
            {
                p = p + 1;
                if(r1 >= nc - r1)
                {
                    q1 = 2 * q1 + 1; // Update q1.
                    r1 = 2 * r1 - nc;
                } // Update r1.
                else
                {
                    q1 = 2 * q1;
                    r1 = 2 * r1;
                }
                if(r2 + 1 >= d - r2)
                {
                    if(q2 >= 0x7FFFFFFF)
                        magu.a = 1;
                    q2 = 2 * q2 + 1; // Update q2.
                    r2 = 2 * r2 + 1 - d;
                } // Update r2.
                else
                {
                    if(q2 >= 0x80000000)
                        magu.a = 1;
                    q2 = 2 * q2;
                    r2 = 2 * r2 + 1;
                }
                delta = d - 1 - r2;
            } while(p < 64 && (q1 < delta || (q1 == delta && r1 == 0)));

            magu.M = q2 + 1; // Magic number
            magu.s = p - 32; // and shift amount to return
        }

        *magicShift         = magu.s;
        const uint32_t abit = 0x80000000;
        if(magu.a)
            *magicShift |= abit;

        // std::cout << " d=" << d << " M=" << magu.M << " a=" << magu.a << " s=" <<
        // magu.s << "\n";

        return magu.M;
    }

    uint32_t
        ContractionSolution::magicNumber(int magicDivAlg, uint32_t x, uint32_t* magicShift) const
    {
        if(magicDivAlg == 1)
            return magicNumberAlg1(x, magicShift);
        else if(magicDivAlg == 2)
            return magicNumberAlg2(x, magicShift);
        else
            throw std::runtime_error("bad magicDivAlg");
    }

    uint32_t ContractionSolution::smallMagicNumber(uint32_t x) const
    {
        uint64_t  magicNum;
        const int smallMagicShift = 31;
        magicNum                  = (1L << smallMagicShift) / x + 1;
        assert(magicNum >> 32 == 0); // ensure magic number fits
        return static_cast<uint32_t>(magicNum);
    }

    std::vector<size_t> generatePackedIndicesA(ContractionSolution::Problem const& problem,
                                               size_t                              packBatchDims)
    {
        std::vector<size_t> packedIndices;

        // TODO -move packedIndices calc to problem decode.
        for(auto idx = 0; idx < problem.a().dimensions(); idx++)
        {
            bool isSum = problem.boundIndices().end()
                         != std::find_if(problem.boundIndices().begin(),
                                         problem.boundIndices().end(),
                                         [idx](const ContractionProblemGemm::BoundIndex& bi) {
                                             return bi.a == idx;
                                         });

            bool nonPackableBatch = false;
            // TODO - base this check on if the batch is SetConstStrideA=0 - if so,
            // don't pack
            if(!(packBatchDims & 0x1))
            {
                nonPackableBatch
                    = problem.batchIndices().end()
                      != std::find_if(problem.batchIndices().begin(),
                                      problem.batchIndices().end(),
                                      [idx](const ContractionProblemGemm::BatchIndex& bi) {
                                          return bi.a == idx;
                                      });
            }

            if(!isSum && !nonPackableBatch)
                packedIndices.push_back(idx);
        }

        return packedIndices;
    }

    std::vector<size_t> generatePackedIndicesB(ContractionSolution::Problem const& problem,
                                               size_t                              packBatchDims)
    {
        std::vector<size_t> packedIndices;

        // Pack in all non-summation indices, except don't need magic number for the
        // last one
        for(auto idx = 0; idx < problem.b().dimensions(); idx++)
        {
            bool isSum = problem.boundIndices().end()
                         != std::find_if(problem.boundIndices().begin(),
                                         problem.boundIndices().end(),
                                         [idx](const ContractionProblemGemm::BoundIndex& bi) {
                                             return bi.b == idx;
                                         });

            bool nonPackableBatch = false;
            // TODO - base this check on if the batch is SetConstStrideB=0 - if so,
            // don't pack
            if(!(packBatchDims & 0x2))
            {
                nonPackableBatch
                    = problem.batchIndices().end()
                      != std::find_if(problem.batchIndices().begin(),
                                      problem.batchIndices().end(),
                                      [idx](const ContractionProblemGemm::BatchIndex& bi) {
                                          return bi.b == idx;
                                      });
            }

            if(!isSum && !nonPackableBatch)
                packedIndices.push_back(idx);
        }

        return packedIndices;
    }

    template <bool T_Debug, bool insertKernelArgs, typename KA>
    void ContractionSolution::singleCallArgs(ContractionSolution::Problem const& problem,
                                             ContractionInputs const&            inputs,
                                             uint32_t const& workspaceOffsetInByte,
                                             Hardware const* hardware,
                                             dim3 const&     problemNumGroupTiles,
                                             dim3 const&     numWorkGroups,
                                             KA&             args) const
    {
        if(debugKernel)
        {
            args.template appendUnbound<unsigned int*>("debugBuffer");
        }

        TensorDescriptor const& a          = problem.a();
        TensorDescriptor const& b          = problem.b();
        TensorDescriptor const& c          = problem.c();
        TensorDescriptor const& d          = problem.d();
        TensorDescriptor const& e          = problem.tensor(ContractionProblemGemm::TENSOR::E);
        TensorDescriptor const& bias       = problem.tensor(ContractionProblemGemm::TENSOR::BIAS);
        TensorDescriptor const& compressed = problem.compressed();
        TensorDescriptor const& metadata   = problem.metadata();

        uint32_t gsu = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU;

        {
            int idx = 0;
            for(auto size : problem.problemSizes())
            {
                args.template append<uint32_t>(concatenate_if<T_Debug>("size_", idx), size);
                idx++;
            }
        }
        bool singleWSD = false;
        if(sizeMapping.globalAccumulation == 1
           && (problemType.computeType != problemType.dType
               || problemType.activationType != ActivationType::None))
            singleWSD = true;
        if(gsu > 1 && sizeMapping.streamK == 0
           && ((singleWSD || sizeMapping.globalAccumulation == 2)
               || (sizeMapping.globalAccumulation == 3)))
        {
            args.template append<void const*>("ws_d", (uint8_t*)inputs.ws + workspaceOffsetInByte);
            if(sizeMapping.globalAccumulation == 3)
            {
                args.template append<void const*>("c", inputs.c);
            }
            else
            {
                args.template append<void const*>("ws_c",
                                                  (uint8_t*)inputs.ws + workspaceOffsetInByte);
            }
        }
        else if(problemType.stridedBatched)
        {
            args.template append<void const*>("d", inputs.d);
            args.template append<void const*>("c", inputs.c);
        }
        else
        {
            args.template append<void const* const*>("batchD", inputs.batchD);
            args.template append<void const* const*>("batchC", inputs.batchC);
        }

        if(problemType.stridedBatched)
        {
            args.template append<void const*>(
                "a", problemType.sparse == 1 ? inputs.compressed : inputs.a);
            args.template append<void const*>(
                "b", problemType.sparse == 2 ? inputs.compressed : inputs.b);
        }
        else
        {
            args.template append<void const* const*>("batchA", inputs.batchA);
            args.template append<void const* const*>("batchB", inputs.batchB);
        }

        if(problemType.sparse)
            args.template append<unsigned char const*>("metadata", inputs.metadata);

        if(sizeMapping.streamK > 0 && sizeMapping.streamKAtomic == 0)
        {
            // Assert hardware is not null
            // For now grouped gemm is not supported and passes nullptr
            TENSILE_ASSERT_EXC(hardware != nullptr);

            // StreamK workspace + flags
            args.template append<void const*>("ws", inputs.ws);
            args.template append<void*>("Flags", inputs.Synchronizer);
        }

        size_t startStrideCD = problemType.useInitialStridesCD ? 0 : 1;
        size_t startStrideAB = problemType.useInitialStridesAB ? 0 : 1;

        if(gsu > 1 && sizeMapping.globalAccumulation && sizeMapping.streamK == 0)
        {
            size_t wsStride = startStrideCD ? d.sizes()[0] : 1;
            for(size_t i = startStrideCD; i < d.dimensions(); i++)
            {
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideW_D", i), wsStride);
                wsStride *= d.sizes()[i];
            }

            wsStride = startStrideCD ? d.sizes()[0] : 1;
            for(size_t i = startStrideCD; i < c.dimensions(); i++)
            {
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideW_C", i), wsStride);
                wsStride *= d.sizes()[i];
            }
        }
        else
        {
            for(size_t i = startStrideCD; i < d.dimensions(); i++)
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideD", i),
                                               d.strides()[i]);

            for(size_t i = startStrideCD; i < c.dimensions(); i++)
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideC", i),
                                               c.strides()[i]);
        }

        for(size_t i = startStrideAB; i < a.dimensions(); i++)
        {
            auto stride_a = problemType.sparse == 1 ? compressed.strides()[i] : a.strides()[i];
            args.template append<uint32_t>(concatenate_if<T_Debug>("strideA", i), stride_a);
        }

        for(size_t i = startStrideAB; i < b.dimensions(); i++)
        {
            auto stride_b = problemType.sparse == 2 ? compressed.strides()[i] : b.strides()[i];
            args.template append<uint32_t>(concatenate_if<T_Debug>("strideB", i), stride_b);
        }

        if(problemType.sparse)
        {
            for(size_t i = startStrideAB; i < a.dimensions(); i++)
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideMetadata", i),
                                               metadata.strides()[i]);
        }

        args.append("alpha", inputs.alpha, problem.alphaType());
        if(problem.alphaType() == rocisa::DataType::Half)
            args.append("alpha_2", inputs.alpha, problem.alphaType());

        if(problemType.useBeta)
        {
            args.append("beta", inputs.beta, problem.betaType());
            if(problem.betaType() == rocisa::DataType::Half)
                args.append("beta_2", inputs.beta, problem.betaType());
        }

        if(sizeMapping.persistentKernel != 0 || sizeMapping.streamK != 0)
        {
            uint32_t magicShift;
            args.template append<uint32_t>("magicNumberProblemNumGroupTiles0",
                                           magicNumber(2, problemNumGroupTiles.x, &magicShift));
            args.template append<uint32_t>("magicShiftProblemNumGroupTiles0", magicShift);
        }

        if(sizeMapping.streamK != 0)
        {
            // SK doesn't care gsu
            if(gsu > 1)
            {
                std::cerr << "Warning: Stream-K Data Parallel does not support GSU > 1, "
                          << "setting GSU to 1." << std::endl;
                gsu = 1;
            }

            auto tiles = problem.getNumTiles(sizeMapping, gsu);

            // Clamp minimum iters per tile to 1 to allow stream-k index calculation to work in case K==0
            // In this case no actual iterations will be run, but workgroups will be mapped correctly for beta*C
            auto     itersPerTile = max(1, problem.getItersPerTile(sizeMapping));
            auto     totalIters   = tiles * itersPerTile;
            uint32_t magicNumberItersPerTile;
            uint32_t magicShiftItersPerTile;
            magicNumberItersPerTile = magicNumber(2, itersPerTile, &magicShiftItersPerTile);

            args.template append<uint32_t>("itersPerTile", itersPerTile);
            args.template append<uint32_t>("magicNumberItersPerTile", magicNumberItersPerTile);
            args.template append<uint32_t>("magicShiftItersPerTile", magicShiftItersPerTile);

            uint32_t numGroupTiles0x1 = problemNumGroupTiles.x * problemNumGroupTiles.y;
            uint32_t magicNumProblemNumGroupTiles0By1;
            uint32_t magicShiftProblemNumGroupTiles0By1;
            magicNumProblemNumGroupTiles0By1
                = magicNumber(2, numGroupTiles0x1, &magicShiftProblemNumGroupTiles0By1);
            args.template append<uint32_t>("magicNumProblemNumGroupTiles0By1",
                                           magicNumProblemNumGroupTiles0By1);
            args.template append<uint32_t>("magicShiftProblemNumGroupTiles0By1",
                                           magicShiftProblemNumGroupTiles0By1);

            args.template append<uint32_t>("totalIters", totalIters);
            if(sizeMapping.streamK == 1) // Basic SK
            {
                uint32_t itersPerWave = CeilDivide(totalIters, numWorkGroups.x);
                args.template append<uint32_t>("SKItersPerWG", itersPerWave);
            }
            else if(sizeMapping.streamK >= 2) // Two-tile SK
            {
                size_t skGrid = numWorkGroups.x;

                AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(hardware);
                assert(pAMDGPU != nullptr && pAMDGPU->computeUnitCount != 0);
                int fullTiles = pAMDGPU->skFullTiles;

                bool bigEnough = tiles > skGrid;
                // skTiles is number of Stream-K tiles to complete
                // Two-tile algorithm causes each WG to run an even number of Stream-K iterations,
                // followed by an even number of data-parllel tiles.
                // If total tiles is evenly divisble by grid size,
                // then no Stream-K tiles are needed, all data-parallel
                uint32_t skTiles = skGrid;
                // If not evenly divisible, determine number of Stream-K tiles
                if(tiles % skGrid != 0)
                {
                    // Number of data-parallel tiles on each workgroup would be:
                    // dpTilesPerWG = bigEnough ? (tiles - skTiles) / skGrid : 0;
                    skTiles = bigEnough ? skGrid * fullTiles + tiles % skGrid : tiles;
                    // Cap Stream-K tiles at total number of tiles in case of large multiplier
                    skTiles = min(skTiles, tiles);
                }

                uint32_t skItersPerWG = skTiles * itersPerTile / skGrid;
                uint32_t skExtraIters = skTiles * itersPerTile % (skGrid);

                args.template append<uint32_t>("SKItersPerWG", skItersPerWG);
                args.template append<uint32_t>("skGrid", skGrid);
                args.template append<uint32_t>("skTiles", skTiles);
                args.template append<uint32_t>("skExtraIters", skExtraIters);
            }
        }

        if constexpr(insertKernelArgs)
            if(!internalArgsSupport.useUniversalArgs)
                kernelArgs<T_Debug, true>(0,
                                          (uint32_t)KERNELARGTYPE::NORMAL,
                                          args,
                                          0,
                                          hardware,
                                          problem.getParams(),
                                          sizeMapping.workGroupMapping);

        if(!problemType.useScaleAB.empty()) //kernel input data
        {
            args.template append<void const*>("scaleA", inputs.scaleA);
            args.template append<void const*>("scaleB", inputs.scaleB);
        }
        if(problemType.useScaleCD) //kernel input data
        {
            args.template append<void const*>("scaleC", inputs.scaleC);
            args.template append<void const*>("scaleD", inputs.scaleD);
        }

        if(problemType.useScaleAlphaVec) //kernel input data
        {
            args.template append<void const*>("scaleAlphaVec", inputs.scaleAlphaVec);
        }

        bool runActivation = false;
        if((problemType.activationType != ActivationType::None) && sizeMapping.activationFused)
            runActivation = true;
        if(problemType.useBias)
        {
            // We save the bias data in ws_d
            if(problemType.useGradient && problem.biasSrc() == ContractionProblemGemm::TENSOR::D
               && inputs.bias != nullptr)
                args.template append<void const*>("ws_bias",
                                                  (uint8_t*)inputs.ws + workspaceOffsetInByte);
            else
            {
                if(problemType.stridedBatched)
                {
                    args.template append<void const*>("bias", inputs.bias);
                }
                else
                {
                    args.template append<void const* const*>("batchBias", inputs.batchBias);
                }
            }

            if(!problemType.useGradient
               || (problemType.useGradient
                   && (problem.biasSrc() == ContractionProblemGemm::TENSOR::A
                       || problem.biasSrc() == ContractionProblemGemm::TENSOR::B)))
            {
                args.template append<uint32_t>("bias_type",
                                               static_cast<uint32_t>(problem.bias().dataType()));
                if(problemType.useBias)
                    args.template append<uint32_t>(
                        "strideBias",
                        static_cast<uint32_t>(problem.useBias() && bias.dimensions()
                                                  ? bias.strides()[bias.dimensions() - 1]
                                                  : 0)); // reserved
            }
        }

        if(problemType.useScaleAlphaVec == 3 || problemType.useBias == 3)
        {
            args.template append<uint32_t>("factorDim",
                                           static_cast<uint32_t>(problem.getParams().factorDim()));
        }

        if(problemType.useE)
        {
            args.template append<void*>("e", inputs.e);
            for(size_t i = startStrideCD; i < e.dimensions(); i++)
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideE", i),
                                               e.strides()[i]);
        }

        if(runActivation)
        {
            for(int i = 0; i < problemType.activationArgLength; i++)
            {
                std::string name = "activation_" + std::to_string(i);
                if(inputs.activationArgs.size() < problemType.activationArgLength)
                {
                    if(problemType.activationComputeDataType == rocisa::DataType::BFloat16)
                    {
                        args.template append<float>(name.c_str(), 0.f);
                    }
                    else
                    {
                        args.append(name.c_str(), 0, problemType.activationComputeDataType);
                    }
                }
                else
                {
                    if(problemType.activationComputeDataType == rocisa::DataType::BFloat16)
                    {
                        args.template append<float>(name.c_str(),
                                                    static_cast<float>((*std::get_if<BFloat16>(
                                                        &inputs.activationArgs[i]))));
                    }
                    else
                    {
                        args.append(name.c_str(),
                                    inputs.activationArgs[i],
                                    problemType.activationComputeDataType);
                    }
                }
            }
            if(problemType.activationType == ActivationType::All
               || problemType.activationType == ActivationType::Hipblaslt_all)
            {
                args.template append<uint32_t>(
                    "activationType", static_cast<uint32_t>(problem.getParams().activationEnum()));
            }
        }

        if(problemType.outputAmaxD)
        {
            args.template append<const void*>("AddrAmaxOut", inputs.amaxD);
            args.template append<const void*>("AmaxWS",
                                              (uint8_t*)inputs.ws + workspaceOffsetInByte);
            args.template append<const void*>("AmaxSync", inputs.Synchronizer);
        }
    }

    inline uint32_t getNumWorkGroups(const KernelInvocation& rv)
    {
        return rv.numWorkItems.x / rv.workGroupSize.x / rv.workGroupSize.y / rv.workGroupSize.z;
    }

    inline uint32_t getNumWorkGroups(ContractionSolution::Problem const& problem,
                                     const SizeMapping&                  sizeMapping)
    {
        size_t numWorkGroupsX = 1;
        size_t numWorkGroupsY = 1;
        size_t numWorkGroupsZ = 1;

        for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
        {
            numWorkGroupsX *= problem.freeSizeA(i);
        }
        for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
        {
            numWorkGroupsY *= problem.freeSizeB(i);
        }

        for(size_t i = 0; i < problem.batchIndices().size(); i++)
        {
            if(sizeMapping.packBatchDims & 0x1)
                numWorkGroupsX *= problem.batchSize(i);
            if(sizeMapping.packBatchDims & 0x2)
                numWorkGroupsY *= problem.batchSize(i);
            if(!sizeMapping.packBatchDims)
                numWorkGroupsZ *= problem.batchSize(i);
        }

        if(problem.transposeC01())
            std::swap(numWorkGroupsX, numWorkGroupsY);

        numWorkGroupsX = CeilDivide(numWorkGroupsX, sizeMapping.macroTile.x);
        numWorkGroupsY = CeilDivide(numWorkGroupsY, sizeMapping.macroTile.y);

        return numWorkGroupsX * numWorkGroupsY * numWorkGroupsZ;
    }

    inline double calculateGranularity(
        uint32_t m, uint32_t n, uint32_t mt0, uint32_t mt1, uint32_t gsu, uint32_t cuCount)
    {
        return (double)(std::ceil(m / mt0) * std::ceil(n / mt1) * gsu / cuCount)
               / std::ceil(std::ceil(m / mt0) * std::ceil(n / mt1) * gsu / cuCount);
    }

    inline void ContractionSolution::calculateAutoGSU(Problem const&  problem,
                                                      Hardware const* hardware) const
    {
        // autoGSU is already calculated
        if(autoGSU != 0)
        {
            return;
        }

        // original GSU is not -1
        if(sizeMapping.globalSplitU != -1)
        {
            autoGSU = sizeMapping.globalSplitU;
            return;
        }

        AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(hardware);
        assert(pAMDGPU);
        uint32_t numCUs       = pAMDGPU->computeUnitCount;
        uint32_t numWGs       = getNumWorkGroups(problem, sizeMapping);
        uint32_t MT0          = sizeMapping.macroTile.x;
        uint32_t MT1          = sizeMapping.macroTile.y;
        uint32_t MT2          = sizeMapping.depthU;
        uint32_t M            = problem.freeSizeA(0);
        uint32_t N            = problem.freeSizeB(0);
        uint32_t B            = problem.batchSize(0);
        uint32_t K            = problem.boundSize(0);
        uint32_t GSULimit1    = max(1, (uint32_t)std::floor(numCUs / numWGs));
        uint32_t GSULimit2    = max(1, (uint32_t)std::floor((float)K / (float)MT2 / 3.0));
        autoGSU               = min(GSULimit2, max(1, GSULimit1));

        // WorkspaceCheck
        if(autoGSU > 1)
        {
#define MAX_GSU_WORKSPACE_SIZE 128 * 1024 * 1024
            int    elemC    = sizeMapping.workspaceSizePerElemC * autoGSU;
            int    elemBias = sizeMapping.workspaceSizePerElemBias * autoGSU;
            size_t rs       = 0;
            // 2d reduction
            if(problem.useGradient() && problem.useBias()
               && problem.getParams().biasEnum() != rocisa::DataType::None)
            {
                if(problem.biasSrc() == ContractionProblemGemm::TENSOR::D && (elemC == 0))
                    rs += problem.d().totalLogicalElements() * problem.computeTypeElementSize();
                else if(problem.biasSrc() == ContractionProblemGemm::TENSOR::A)
                {
                    rs += M * elemBias;
                }
                else if(problem.biasSrc() == ContractionProblemGemm::TENSOR::B)
                {
                    rs += N * elemBias;
                }
            }

            size_t tiles = problem.getNumTiles(sizeMapping, 1);
            size_t tileSize = sizeMapping.macroTile.x * sizeMapping.macroTile.y * sizeMapping.workspaceSizePerElemC;
            size_t bufSize = tiles * tileSize;

            autoGSU = min(autoGSU,
                          (MAX_GSU_WORKSPACE_SIZE - rs) / bufSize);
            if(problem.groupedGemm())
            {
                assert(problem.workspaceSizeGroupedGemm() <= problem.workspaceSize());
                autoGSU = min(autoGSU,
                              (problem.workspaceSizeGroupedGemm() - rs)
                                  / bufSize);
            }
            else
                autoGSU = min(autoGSU,
                              (problem.workspaceSize() - rs) / bufSize);
        }

        // WorkgroupNumberCheck
#define MAX_WORKGROUP_NUMBER 16777216
        autoGSU = min(autoGSU,
                      MAX_WORKGROUP_NUMBER / std::ceil(static_cast<float>(M) / MT0)
                          / std::ceil(static_cast<float>(N) / MT1) / B);

        // GlobalSplitUCheckMinK
        if(autoGSU > 1)
        {
            autoGSU = min(autoGSU, (uint32_t)std::ceil(K / MT2));
        }

        // avoid gsu < 1
        autoGSU = max(autoGSU, 1);

        static const char* envStr = std::getenv("TENSILE_AUTO_GSU_ALGO");
        if(envStr != NULL)
            std::cout << "autoGSU is calculated: " << autoGSU << std::endl;

        return;
    }

    template <bool T_Debug, bool Legacy, typename KA>
    void ContractionSolution::kernelArgs(uint32_t                            gemmCount,
                                         uint32_t                            argType,
                                         KA&                                 args,
                                         uint32_t                            numWorkGroups,
                                         Hardware const*                     hardware,
                                         const ContractionProblemParameters& param,
                                         int32_t                             defaultWGM) const
    {
        if constexpr(!Legacy)
        {
            gemmCount = gemmCount & 0x3FFFFFFF;
            // Currently 0 for kernel args, 1 for args located in HBM. This is a temporary slot.
            gemmCount = gemmCount | (argType << 30);
            args.template append<uint32_t>("gemm_count", gemmCount);
        }

        uint32_t       gsu          = param.gsu() > 0 ? param.gsu() : autoGSU;
        bool           gsuc         = false; // initialized false
        bool           gsuwgmrr     = false; // initialized false
        int32_t        wgm          = param.wgm() != 0 ? param.wgm() : defaultWGM;
        uint32_t       wgmxcc       = 1;
        int32_t        wgmxccg      = -1;
        const uint32_t mask16       = 0xFFFF;
        const uint32_t mask14       = 0x3FFF;
        const uint32_t mask8        = 0xFF;
        uint32_t       internalArg0 = 0;
        uint32_t       internalArg1 = 0;

        if(internalArgsSupport.wgm && internalArgsSupport.version == 0)
        {
            if(wgm > 255)
                wgm = 255;
            if(gsu > 255)
                gsu = 255;
            uint32_t wgShift8 = (mask8 & (uint32_t)wgm) << 8;
            internalArg0      = internalArg0 | wgShift8;
        }

        if(internalArgsSupport.wgm && internalArgsSupport.version >= 1)
        {
            if(internalArgsSupport.version == 1)
            {
                internalArg1 = wgm;
            }
            else if(internalArgsSupport.version == 2)
            {
                // NB: get value from param= set in runtime / vs value from sizeMapping: from logic yaml.
                //     param: default values: [xcc = 0, xccg = 0]. So when we never set xcc/xccg in runtime: we always get from sizeMapping.
                //     From sizeMapping = from logic yaml. If not set in Config-Yaml, use default value [1, -1]
                wgmxcc = param.wgmxcc() > 0 ? param.wgmxcc() : sizeMapping.workGroupMappingXCC;
                wgmxccg
                    = param.wgmxccg() != 0 ? param.wgmxccg() : sizeMapping.workGroupMappingXCCGroup;
                if(wgmxcc >= 1 && wgmxccg == -1)
                {
                    AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(hardware);
                    assert(pAMDGPU != nullptr && pAMDGPU->computeUnitCount != 0);
                    wgmxccg = pAMDGPU->computeUnitCount;
                }
                internalArg1 = internalArg1 | (wgmxccg << 22) | (wgmxcc << 16) | (mask16 & wgm);
            }
        }

        // support gsuc and gsuwgmrr after version 2
        if(internalArgsSupport.version >= 2)
        {
            gsuc     = param.gsuc() > 0 ? param.gsuc() : sizeMapping.globalSplitUCoalesced;
            gsuwgmrr = param.gsuwgmrr() > 0 ? param.gsuwgmrr()
                                            : sizeMapping.globalSplitUWorkGroupMappingRoundRobin;
        }

        internalArg0
            = internalArg0 | ((uint32_t)gsuc << 15) | ((uint32_t)gsuwgmrr << 14) | (mask14 & gsu);

        // StaggerU
        if(internalArgsSupport.staggerU)
        {
            const uint32_t staggerMask1    = 0x1F00;
            uint32_t       staggerUMapping = (sizeMapping.staggerUMapping << 13);
            uint32_t       staggerUShift   = staggerMask1 & ((sizeMapping.staggerStrideShift) << 8);
            uint32_t       staggerU        = mask8 & sizeMapping.staggerU;
            staggerU                       = staggerU | staggerUShift;
            staggerU                       = staggerU | staggerUMapping;
            internalArg0                   = internalArg0 | (staggerU << 16);
        }

        args.template append<uint32_t>("internalArgs", internalArg0);

        if(internalArgsSupport.version >= 1)
        {
            args.template append<int32_t>("internalArgs1", internalArg1);
            args.template append<uint32_t>("numWorkGroups", numWorkGroups);
        }
    }

    template <bool T_Debug>
    KernelInvocation
        ContractionSolution::generateSingleCall(ContractionSolution::Problem const& problem,
                                                ContractionInputs const&            inputs,
                                                Hardware const&                     hardware) const
    {
        KernelInvocation rv;

        rv.isSingleCall = true;

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(1024, 128);

        rv.kernelName = kernelName;

        rv.workGroupSize.x = sizeMapping.workGroupSize.x * sizeMapping.workGroupSize.y
                             * sizeMapping.workGroupSize.z;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        rv.numWorkGroups.x = 1;
        rv.numWorkGroups.y = 1;

        for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
        {
            rv.numWorkGroups.x *= problem.freeSizeA(i);
        }
        for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
        {
            rv.numWorkGroups.y *= problem.freeSizeB(i);
        }

        rv.numWorkGroups.z = 1;
        for(size_t i = 0; i < problem.batchIndices().size(); i++)
        {
            if(sizeMapping.packBatchDims & 0x1)
                rv.numWorkGroups.x *= problem.batchSize(i);
            if(sizeMapping.packBatchDims & 0x2)
                rv.numWorkGroups.y *= problem.batchSize(i);
            if(!sizeMapping.packBatchDims)
                rv.numWorkGroups.z *= problem.batchSize(i);
        }

        if(problem.transposeC01())
            std::swap(rv.numWorkGroups.x, rv.numWorkGroups.y);

        rv.numWorkGroups.x = CeilDivide(rv.numWorkGroups.x, sizeMapping.macroTile.x);
        rv.numWorkGroups.y = CeilDivide(rv.numWorkGroups.y, sizeMapping.macroTile.y);

        dim3 problemNumGroupTiles = rv.numWorkGroups;

        uint32_t gsu = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU;
        if(gsu > 0)
            rv.numWorkGroups.y *= gsu;

        size_t skGrid = 0;
        auto   tiles  = problem.getNumTiles(sizeMapping, gsu);
        if(sizeMapping.streamK != 0 || sizeMapping.persistentKernel != 0)
        {
            AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(&hardware);
            assert(pAMDGPU != nullptr && pAMDGPU->computeUnitCount != 0);
            if(sizeMapping.streamK != 0)
            {
                skGrid             = getSKGrid(problem, hardware, tiles);
                rv.numWorkGroups.x = skGrid;
                rv.numWorkGroups.y = 1;
                rv.numWorkGroups.z = 1;
            }
        }

        //short-term workaround
        int             deviceId;
        hipDeviceProp_t deviceProperties;

        auto removePrefix = [](const std::string& s) {
            size_t pos = s.find("gfx");
            if(pos != std::string::npos)
            {
                return s.substr(pos + 3);
            }
            return s;
        };

        static_cast<void>(hipGetDevice(&deviceId));
        static_cast<void>(hipGetDeviceProperties(&deviceProperties, deviceId));
        auto gpu_arch_no_prefix = removePrefix(deviceProperties.gcnArchName);
        if(stoi(gpu_arch_no_prefix) / 100 != 12)
        {
            if(internalArgsSupport.version >= 1)
            {
                rv.numWorkGroups.x *= (rv.numWorkGroups.y * rv.numWorkGroups.z);
                rv.numWorkGroups.y = 1;
                rv.numWorkGroups.z = 1;
            }
        }

        rv.numWorkItems.x = rv.workGroupSize.x * rv.numWorkGroups.x;
        rv.numWorkItems.y = rv.workGroupSize.y * rv.numWorkGroups.y;
        rv.numWorkItems.z = rv.workGroupSize.z * rv.numWorkGroups.z;

        rv.sharedMemBytes = 0;

        if(internalArgsSupport.useUniversalArgs)
        {
            auto defaultWGM = sizeMapping.workGroupMapping;
            if(sizeMapping.streamK != 0)
            {
                AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(&hardware);
                if(pAMDGPU->skDynamicWGM == 1)
                {
                    hip::HipAMDGPU const* hipAMDGPU
                        = dynamic_cast<hip::HipAMDGPU const*>(&hardware);
                    auto sizes = problem.problemSizes();
                    if(sizes.size() >= 4)
                    {
                        std::vector<size_t> wgmList
                            = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
                        size_t elementSize = GetElementSize(problemType.aType);
                        double H_L2        = 0.0; // TODO
                        auto   bestWGM     = analytical::select_best_wgm(sizes[0],
                                                                   sizes[1],
                                                                   sizes[3],
                                                                   sizes[2],
                                                                   *(hipAMDGPU->analyticalHardware),
                                                                   sizeMapping.macroTile.x,
                                                                   sizeMapping.macroTile.y,
                                                                   sizeMapping.depthU,
                                                                   sizeMapping.matrixInstruction[0],
                                                                   sizeMapping.matrixInstruction[1],
                                                                   sizeMapping.matrixInstruction[2],
                                                                   wgmList,
                                                                   elementSize,
                                                                   H_L2,
                                                                   false,
                                                                   false);
                        defaultWGM         = bestWGM.second;
                        if(T_Debug)
                            std::cout << "Predicted WGM: " << defaultWGM << std::endl;
                    }
                }
            }

            kernelArgs<T_Debug, false>(
                1, 0, rv.args, getNumWorkGroups(rv), &hardware, problem.getParams(), defaultWGM);
        }
        singleCallArgs<T_Debug, true>(
            problem, inputs, 0, &hardware, problemNumGroupTiles, rv.numWorkGroups, rv.args);

        if(sizeMapping.globalAccumulation == 3)
        {
            rv.args.append<void const*>("dstD", inputs.d);
            rv.args.append<void const*>("Synchronizer", inputs.Synchronizer);
            rv.args.append<uint32_t>("GSUSync", 0);
        }

        if(problemType.stochasticRounding)
        {
            // generate seed from random generator
            std::random_device                      rd;
            std::mt19937                            gen(rd());
            std::uniform_int_distribution<uint32_t> distribution(0, 0xFFFFFFFF);
            uint32_t                                seed = distribution(gen);
            rv.args.append<uint32_t>("RNDSeed", seed);
        }
        rv.codeObjectFile = codeObjectFilename.load();
        return rv;
    }

    template <typename KA>
    void ContractionSolution::calculateSingleCallWorkGroupItems(
        std::vector<Problem> const& problems,
        const TensileLite::dim3&    workGroupSize,
        TensileLite::dim3&          numWorkGroups,
        TensileLite::dim3&          numWorkItems,
        KA&                         h_args) const
    {

        uint32_t wgLeft  = 0;
        uint32_t wgRight = 0;

        for(int idx = 0; idx < problems.size(); idx++)
        {
            if constexpr(!std::is_same<KA, KernelArgumentsCounter>::value)
            {
                auto problem = problems[idx];

                numWorkGroups.x = 1;
                numWorkGroups.y = 1;
                numWorkGroups.z = 1;

                for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
                {
                    numWorkGroups.x *= problem.freeSizeA(i);
                }

                for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
                {
                    numWorkGroups.y *= problem.freeSizeB(i);
                }

                for(size_t i = 0; i < problem.batchIndices().size(); i++)
                {
                    if(sizeMapping.packBatchDims & 0x1)
                        numWorkGroups.x *= problem.batchSize(i);
                    if(sizeMapping.packBatchDims & 0x2)
                        numWorkGroups.y *= problem.batchSize(i);
                    if(!sizeMapping.packBatchDims)
                        numWorkGroups.z *= problem.batchSize(i);
                }

                if(problem.transposeC01())
                    std::swap(numWorkGroups.x, numWorkGroups.y);

                numWorkGroups.x = CeilDivide(numWorkGroups.x, sizeMapping.macroTile.x);
                numWorkGroups.y = CeilDivide(numWorkGroups.y, sizeMapping.macroTile.y);

                uint32_t gsu = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU;
                if(gsu > 0)
                    numWorkGroups.y *= gsu;

                numWorkItems.x += (workGroupSize.x * numWorkGroups.x * workGroupSize.y
                                   * numWorkGroups.y * workGroupSize.z * numWorkGroups.z);

                if constexpr(std::is_same<KA, KernelArguments>::value)
                {
                    wgRight = numWorkItems.x / workGroupSize.x / workGroupSize.y / workGroupSize.z;
                    h_args.template append<uint32_t>("wgTable", wgLeft);
                    wgLeft = wgRight;
                }
            }
            else
            {
                if constexpr(!std::is_same<KA, int>::value)
                    h_args.template append<uint32_t>("wgTable", 0);
            }
        }
    }

    template <bool T_Debug, typename KA>
    KernelInvocation ContractionSolution::generateSingleCallGroupedGemm(
        std::vector<ContractionSolution::Problem> const& problems,
        ContractionSolution::GroupedInputs const&        inputs,
        Hardware const&                                  hardware,
        KA&                                              h_args,
        void const*                                      userArgs) const
    {
        KernelInvocation rv;
        rv.isSingleCall = true;

        if constexpr(!std::is_same<KA, KernelArgumentsCounter>::value)
        {
            rv.kernelName = kernelName;

            rv.args = KernelArguments(T_Debug);

            rv.workGroupSize.x = sizeMapping.workGroupSize.x * sizeMapping.workGroupSize.y
                                 * sizeMapping.workGroupSize.z;
            rv.workGroupSize.y = 1;
            rv.workGroupSize.z = 1;

            rv.numWorkItems.x = 0;
            rv.numWorkItems.y = 1;
            rv.numWorkItems.z = 1;

            rv.sharedMemBytes = 0;
        }
        calculateSingleCallWorkGroupItems(
            problems, rv.workGroupSize, rv.numWorkGroups, rv.numWorkItems, h_args);

        uint32_t workspaceOffsetInByte
            = this->requiredHostWorkspaceSizePerProblem * problems.size();
        if constexpr(!std::is_same<KA, int>::value)
        {
            for(int idx = 0; idx < problems.size(); idx++)
            {
                auto problem = problems[idx];
                singleCallArgs<T_Debug, false>(problem,
                                               inputs.grouped[idx],
                                               workspaceOffsetInByte,
                                               nullptr,
                                               rv.numWorkGroups,
                                               rv.numWorkGroups,
                                               h_args);

                if(sizeMapping.globalAccumulation == 3)
                {
                    h_args.template append<void const*>("dstD", inputs.grouped[idx].d);
                    h_args.template append<void const*>("Synchronizer",
                                                        inputs.grouped[idx].Synchronizer);
                    h_args.template append<uint32_t>("GSUSync", 0);
                }

                if constexpr(std::is_same<KA, KernelArguments>::value)
                    workspaceOffsetInByte += requiredWorkspaceSize(problem, hardware);
            }
        }

        if constexpr(!std::is_same<KA, KernelArgumentsCounter>::value)
        {
            if(internalArgsSupport.useUniversalArgs)
            {
                KERNELARGTYPE argType = KERNELARGTYPE::HBM;
                if(userArgs != nullptr)
                {
                    argType = KERNELARGTYPE::USERARGS;
                }
                kernelArgs<T_Debug, false>(problems.size(),
                                           (uint32_t)argType,
                                           rv.args,
                                           getNumWorkGroups(rv),
                                           &hardware,
                                           problems[0].getParams(),
                                           sizeMapping.workGroupMapping);
                // For user input
                if(argType == KERNELARGTYPE::USERARGS)
                {
                    rv.args.append<void const*>("DeviceUserArguments", userArgs);
                }
                else
                {
                    rv.args.append<void const*>("argsPtr", (void*)inputs.ws);
                }
            }
            else
            {
                rv.args.append<uint32_t>("gemm_count", problems.size());
                // For user input
                rv.args.append<void const*>("DeviceUserArguments", userArgs);
                rv.args.append<void const*>("argsPtr", (void*)inputs.ws);
                rv.args.append<uint32_t>("numWorkGroups",
                                         rv.numWorkItems.x / rv.workGroupSize.x / rv.workGroupSize.y
                                             / rv.workGroupSize.z);
                kernelArgs<T_Debug, true>(0,
                                          (uint32_t)KERNELARGTYPE::NORMAL,
                                          rv.args,
                                          0,
                                          &hardware,
                                          problems[0].getParams(),
                                          sizeMapping.workGroupMapping);
            }

            rv.args.append<void const*>("Synchronizer", (void*)inputs.grouped[0].Synchronizer);
            rv.args.append<void const*>(
                "Workspace",
                (uint8_t*)inputs.ws + this->requiredHostWorkspaceSizePerProblem * problems.size());
            rv.codeObjectFile = codeObjectFilename.load();
        }

        return rv;
    }

    template <bool T_Debug>
    KernelInvocation
        ContractionSolution::generateBetaOnlyCall(Problem const&           problem,
                                                  ContractionInputs const& inputs) const
    {
        TensorDescriptor const& c               = problem.c();
        TensorDescriptor const& d               = problem.d();
        bool                    enableFactorDim = false;

        KernelInvocation rv;

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(512, 64);

        rv.kernelName = betaOnlyKernelName(problem);

        rv.workGroupSize.x = 256;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        size_t wiX = 1;
        size_t wiY = 1;
        size_t wiZ = 1;
        for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
            wiX *= problem.freeSizeA(i);
        for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
            wiY *= problem.freeSizeB(i);
        for(size_t i = 0; i < problem.batchIndices().size(); i++)
            wiZ *= problem.batchSize(i);

        rv.numWorkGroups.x = CeilDivide(wiX * wiY * wiZ, rv.workGroupSize.x);
        rv.numWorkGroups.y = 1;
        rv.numWorkGroups.z = 1;

        rv.numWorkItems.x = rv.workGroupSize.x * rv.numWorkGroups.x;
        rv.numWorkItems.y = rv.workGroupSize.y * rv.numWorkGroups.y;
        rv.numWorkItems.z = rv.workGroupSize.z * rv.numWorkGroups.z;

        if(sizeMapping.globalAccumulation)
            rv.args.append<void*>("WS", inputs.ws);
        else if(problemType.stridedBatched)
            rv.args.append<void*>("D", inputs.d);
        else
            rv.args.append<void const* const*>("batchD", inputs.batchD);

        if(problemType.stridedBatched)
            rv.args.append<void const*>("C", inputs.c);
        else
            rv.args.append<void const* const*>("batchC", inputs.batchC);

        if(problemType.useBias && sizeMapping.globalAccumulation == 0 && (!problemType.useGradient))
        {
            if(problemType.stridedBatched)
                rv.args.append<void const*>("bias", inputs.bias);
            else
                rv.args.append<void const* const*>("batchBias", inputs.batchBias);
            if(problemType.useBias == 3)
                enableFactorDim = true;
        }
        if((!problemType.useScaleAB.empty()) && sizeMapping.globalAccumulation == 0)
        {
            rv.args.append<void const*>("scaleA", inputs.scaleA);
            rv.args.append<void const*>("scaleB", inputs.scaleB);
        }
        if(problemType.useScaleCD && sizeMapping.globalAccumulation == 0)
        {
            rv.args.append<void const*>("scaleC", inputs.scaleC);
            rv.args.append<void const*>("scaleD", inputs.scaleD);
        }
        if(problemType.useScaleAlphaVec && sizeMapping.globalAccumulation == 0)
        {
            rv.args.append<void const*>("scaleAlphaVec", inputs.scaleAlphaVec);
            if(problemType.useScaleAlphaVec == 3)
                enableFactorDim = true;
        }

        if(sizeMapping.globalAccumulation)
        {
            size_t stride = d.sizes()[0];
            for(size_t i = 1; i < d.dimensions(); i++)
            {
                rv.args.append<uint32_t>(concatenate_if<T_Debug>("strideW", i),
                                         d.sizes()[i] == 1 ? 0 : stride);
                stride *= d.sizes()[i];
            }
        }
        else
        {
            for(size_t i = 1; i < d.dimensions(); i++)
                rv.args.append<uint32_t>(concatenate_if<T_Debug>("strideD", i),
                                         d.sizes()[i] == 1 ? 0 : d.strides()[i]);
        }

        for(size_t i = 1; i < c.dimensions(); i++)
            rv.args.append<uint32_t>(concatenate_if<T_Debug>("strideC", i),
                                     c.sizes()[i] == 1 ? 0 : c.strides()[i]);

        if(problemType.useBias && sizeMapping.globalAccumulation == 0 && (!problemType.useGradient))
        {
            TensorDescriptor const& bias = problem.tensor(ContractionProblemGemm::TENSOR::BIAS);
            rv.args.append<uint32_t>(
                "strideBias",
                problem.useBias() && bias.dimensions() ? bias.strides()[bias.dimensions() - 1] : 0);
        }

        if(enableFactorDim)
            rv.args.template append<uint32_t>("factorDim",
                                              (uint32_t)problem.getParams().factorDim());

        int idx = 0;
        for(auto size : problem.d().sizes())
        {
            rv.args.append<uint32_t>(concatenate_if<T_Debug>("size_", idx), size);
            idx++;
        }

        rv.args.append("beta", inputs.beta, problem.betaType());

        //Pass along code object dependency
        rv.codeObjectFile = codeObjectFilename.load();

        return rv;
    }

    template <bool T_Debug>
    KernelInvocation ContractionSolution::generateBetaOnlyCallGroupedGemm(
        std::vector<ContractionSolution::Problem> const& problems,
        ContractionSolution::GroupedInputs const&        inputs) const
    {
        KernelInvocation rv;

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(512, 64);

        rv.kernelName = betaOnlyKernelName(problems[0]);

        rv.workGroupSize.x = 256;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        rv.codeObjectFile = codeObjectFilename.load();

        return rv;
    }

    std::string ContractionSolution::betaOnlyKernelName(Problem const& problem) const
    {
        std::string name = concatenate(
            "C", problem.cNames(), "_", DataTypeInfo::Get(problem.d().dataType()).abbrev);

        if(problemType.groupedGemm)
        {
            name += "_GG";
        }
        else if(!problemType.stridedBatched)
        {
            name += "_GB";
        }

        int factorDim = 0;
        if(sizeMapping.globalAccumulation == 0)
        {
            if(!problemType.useGradient)
                factorDim = problemType.useScaleAlphaVec | problemType.useBias;
            else
                factorDim = problemType.useScaleAlphaVec;
        }
        if(problemType.useBias && sizeMapping.globalAccumulation == 0 && (!problemType.useGradient))
        {
            auto s = rocisa::TypeAbbrev(problem.bias().dataType());
            name += ("_Bias" + s);
        }
        if(factorDim == 2)
            name += "_FDN";
        else if(factorDim == 3)
            name += "_FDMN";

        if(sizeMapping.globalAccumulation)
        {
            name += "_GA";
        }

        return name;
    }

    template <bool T_Debug, typename KA>
    void ContractionSolution::outputConversionCallArgs(ContractionSolution::Problem const& problem,
                                                       ContractionInputs const&            inputs,
                                                       uint32_t const& workspaceOffsetInByte,
                                                       KA&             args) const
    {
        TensorDescriptor const& c = problem.c();
        TensorDescriptor const& d = problem.d();
        TensorDescriptor const& e = problem.tensor(ContractionProblemGemm::TENSOR::E);

        if(problemType.useE)
        {
            if(problemType.stridedBatched)
                args.template append<void*>("E", inputs.e);
            else
                args.template append<void const* const*>("batchE", 0);
        }

        if(problemType.stridedBatched)
            args.template append<void*>("D", inputs.d);
        else
            args.template append<void const* const*>("batchD", inputs.batchD);

        args.template append<void*>("WS", (uint8_t*)inputs.ws + workspaceOffsetInByte);

        if(problemType.stridedBatched)
            args.template append<void const*>("C", inputs.c);
        else
            args.template append<void const* const*>("batchC", inputs.batchC);

        bool useBias = false;
        if(problemType.useBias)
        {
            if(!problemType.useGradient)
            {
                if(problemType.stridedBatched)
                    args.template append<void const*>("bias", inputs.bias);
                else
                    args.template append<void const* const*>("batchBias", inputs.batchBias);
                useBias = true;
            }
            else
            {
                for(auto it : problemType.biasSrcWhiteList)
                {
                    if(it == ContractionProblemGemm::TENSOR::A
                       || it == ContractionProblemGemm::TENSOR::B)
                    {
                        if(problemType.stridedBatched)
                            args.template append<void*>("bias", const_cast<void*>(inputs.bias));
                        else
                            args.template append<void**>("batchBias",
                                                         const_cast<void**>(inputs.batchBias));
                        useBias = true;
                        break;
                    }
                }
            }
        }

        if(!problemType.useScaleAB.empty()) // GSU dep
        {
            args.template append<void const*>("scaleA", inputs.scaleA);
            args.template append<void const*>("scaleB", inputs.scaleB);
        }
        if(problemType.useScaleCD) // GSU dep
        {
            args.template append<void const*>("scaleC", inputs.scaleC);
            args.template append<void const*>("scaleD", inputs.scaleD);
        }
        if(problemType.useScaleAlphaVec) // GSU dep
        {
            args.template append<void const*>("scaleAlphaVec", inputs.scaleAlphaVec);
        }

        if(sizeMapping.globalAccumulation == 2)
            args.append("alpha", inputs.alpha, problem.alphaType());
        else
            args.append("alpha", 1.0f, problem.betaType());

        if(sizeMapping.globalAccumulation == 2 and problemType.useBeta)
            args.append("beta", inputs.beta, problem.betaType());
        else
            args.append("beta", 0.0f, problem.betaType());

        if((problemType.activationType != ActivationType::None) && sizeMapping.activationFused)
        {
            for(int i = 0; i < problemType.activationArgLength; i++)
            {
                std::string name = "activation_" + std::to_string(i);
                if(inputs.activationArgs.size() < problemType.activationArgLength)
                {
                    if(problemType.activationComputeDataType == rocisa::DataType::BFloat16)
                    {
                        args.template append<float>(name.c_str(), 0.f);
                    }
                    else
                    {
                        args.append(name.c_str(), 0, problemType.activationComputeDataType);
                    }
                }
                else
                {
                    if(problemType.activationComputeDataType == rocisa::DataType::BFloat16)
                    {
                        args.template append<float>(name.c_str(),
                                                    static_cast<float>((*std::get_if<BFloat16>(
                                                        &inputs.activationArgs[i]))));
                    }
                    else
                    {
                        args.append(name.c_str(),
                                    inputs.activationArgs[i],
                                    problemType.activationComputeDataType);
                    }
                }
            }
            if(problemType.activationType == ActivationType::All
               || problemType.activationType == ActivationType::Hipblaslt_all)
            {
                args.template append<uint32_t>(
                    "activationType", static_cast<uint32_t>(problem.getParams().activationEnum()));
            }
        }

        if(problemType.useE)
            for(size_t i = 1; i < e.dimensions(); i++)
                args.template append<uint32_t>(concatenate_if<T_Debug>("strideE", i),
                                               e.strides()[i]);

        for(size_t i = 1; i < d.dimensions(); i++)
            args.template append<uint32_t>(concatenate_if<T_Debug>("strideD", i), d.strides()[i]);

        uint32_t wsStride = d.sizes()[0];
        for(size_t i = 1; i < d.dimensions(); i++)
        {
            args.template append<uint32_t>(concatenate_if<T_Debug>("strideW", i), wsStride);
            wsStride *= d.sizes()[i];
        }

        for(size_t i = 1; i < c.dimensions(); i++)
            args.template append<uint32_t>(concatenate_if<T_Debug>("strideC", i), c.strides()[i]);

        if(useBias)
        {
            TensorDescriptor const& bias = problem.tensor(ContractionProblemGemm::TENSOR::BIAS);
            args.template append<uint32_t>(
                "strideBias",
                problem.useBias() && bias.dimensions() ? bias.strides()[bias.dimensions() - 1] : 0);
        }

        int i = 0;
        for(auto size : problem.d().sizes())
        {
            args.template append<uint32_t>(concatenate_if<T_Debug>("size_", i), size);
            i++;
        }
        uint32_t gsu = sizeMapping.globalAccumulation == 1
                           ? 1
                           : (problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU);
        args.template append<uint32_t>(concatenate_if<T_Debug>("gsu"), gsu);
        if((useBias && problemType.useBias == 3) || problemType.useScaleAlphaVec)
        {
            args.template append<uint32_t>("factorDim", (uint32_t)problem.getParams().factorDim());
        }
    }

    template <bool T_Debug>
    KernelInvocation
        ContractionSolution::generateOutputConversionCall(Problem const&           problem,
                                                          ContractionInputs const& inputs) const
    {
        KernelInvocation rv;

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(512, 64);

        rv.workGroupSize.x = 256;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        size_t wiX = 1;
        size_t wiY = 1;
        size_t wiZ = 1;
        for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
            wiX *= problem.freeSizeA(i);
        for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
            wiY *= problem.freeSizeB(i);
        for(size_t i = 0; i < problem.batchIndices().size(); i++)
            wiZ *= problem.batchSize(i);

        size_t vw = 1;
        if(wiX * wiY * wiZ > 2048)
        {
            //reach threashhold to trigger wider load
            if(problem.freeSizeA(0) % 4 == 0
               && DataTypeInfo::Get(problemType.aType).elementSize
                      < DataTypeInfo::Get(rocisa::DataType::Double).elementSize)
                vw = 4;
            else if(problem.freeSizeA(0) % 2 == 0)
                vw = 2;
        }

        uint32_t gsu = sizeMapping.globalAccumulation == 1
                           ? 1
                           : (problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU);

        rv.kernelName = outputConversionKernelName(problem, inputs, vw, gsu);

        rv.numWorkGroups.x = CeilDivide(wiX * wiY * wiZ, rv.workGroupSize.x * vw);
        rv.numWorkGroups.y = 1;
        rv.numWorkGroups.z = 1;

        rv.numWorkItems.x = rv.workGroupSize.x * rv.numWorkGroups.x;
        rv.numWorkItems.y = rv.workGroupSize.y * rv.numWorkGroups.y;
        rv.numWorkItems.z = rv.workGroupSize.z * rv.numWorkGroups.z;

        outputConversionCallArgs<T_Debug>(problem, inputs, 0, rv.args);

        //@TODO determine if this is needed, may not end up in the same code object file
        rv.codeObjectFile = codeObjectFilename.load();

        if(problemType.stochasticRounding)
        {
            // generate seed from random generator
            std::random_device                      rd;
            std::mt19937                            gen(rd());
            std::uniform_int_distribution<uint32_t> distribution(0, 0xFFFFFFFF);
            uint32_t                                seed = distribution(gen);
            rv.args.append<uint32_t>("RNDSeed", seed);
        }
        return rv;
    }

    template <typename KA>
    void ContractionSolution::calculateConversionCallWorkGroupItems(
        std::vector<ContractionSolution::Problem> const& problems,
        size_t&                                          vw,
        const TensileLite::dim3&                         workGroupSize,
        TensileLite::dim3&                               numWorkGroups,
        TensileLite::dim3&                               numWorkItems,
        KA&                                              h_args) const
    {
        if constexpr(std::is_same<KA, KernelArguments>::value)
        {
            size_t wi_count = 0;
            for(int idx = 0; idx < problems.size(); idx++)
            {
                auto problem = problems[idx];

                size_t wiX = 1;
                size_t wiY = 1;
                size_t wiZ = 1;
                for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
                    wiX *= problem.freeSizeA(i);
                for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
                    wiY *= problem.freeSizeB(i);
                for(size_t i = 0; i < problem.batchIndices().size(); i++)
                    wiZ *= problem.batchSize(i);

                wi_count += (wiX * wiY * wiZ);
            }

            //reach threashhold to trigger wider load
            if(wi_count > 2048)
            {
                bool not4 = false;
                bool not2 = false;
                for(int idx = 0; idx < problems.size(); idx++)
                {
                    auto problem = problems[idx];
                    if(problem.freeSizeA(0) % 4 != 0
                       && DataTypeInfo::Get(problemType.aType).elementSize
                              < DataTypeInfo::Get(rocisa::DataType::Double).elementSize)
                        not4 = true;
                    if(problem.freeSizeA(0) % 2 != 0)
                        not2 = true;
                }

                if(!not4)
                    vw = 4;
                else if(!not2)
                    vw = 2;
            }
        }

        int32_t  wiLeft  = 0;
        uint32_t wiRight = 0;
        for(int idx = 0; idx < problems.size(); idx++)
        {
            if constexpr(!std::is_same<KA, KernelArgumentsCounter>::value)
            {
                auto problem = problems[idx];

                size_t wiX = 1;
                size_t wiY = 1;
                size_t wiZ = 1;
                for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
                    wiX *= problem.freeSizeA(i);
                for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
                    wiY *= problem.freeSizeB(i);
                for(size_t i = 0; i < problem.batchIndices().size(); i++)
                    wiZ *= problem.batchSize(i);

                numWorkGroups.x = CeilDivide(wiX * wiY * wiZ, workGroupSize.x * vw);

                numWorkItems.x += workGroupSize.x * numWorkGroups.x;

                if constexpr(std::is_same<KA, KernelArguments>::value)
                {
                    wiRight = numWorkItems.x;
                    h_args.template append<uint32_t>("wiTable", wiLeft);
                    wiLeft = wiRight;
                }
            }
            else
            {
                h_args.template append<uint32_t>("wiTable", wiLeft);
            }
        }

        if constexpr(std::is_same<KA, KernelArguments>::value)
        {
            numWorkGroups.y = 1;
            numWorkGroups.z = 1;
            numWorkItems.y  = workGroupSize.y * numWorkGroups.y;
            numWorkItems.z  = workGroupSize.z * numWorkGroups.z;
        }
    }

    template <bool T_Debug, typename KA>
    KernelInvocation ContractionSolution::generateOutputConversionCallGroupedGemm(
        std::vector<ContractionSolution::Problem> const& problems,
        ContractionSolution::GroupedInputs const&        inputs,
        Hardware const&                                  hardware,
        KA&                                              h_args) const
    {
        KernelInvocation rv;
        uint32_t         previousArgsSpaceOffsetInByte = 0;

        size_t vw = 1;
        if constexpr(std::is_same<KA, KernelArguments>::value)
        {
            previousArgsSpaceOffsetInByte = h_args.size();

            rv.args = KernelArguments(T_Debug);

            rv.args.reserve(512, 64);

            rv.workGroupSize.x = 256;
            rv.workGroupSize.y = 1;
            rv.workGroupSize.z = 1;

            rv.numWorkItems.x = 0;
        }

        calculateConversionCallWorkGroupItems(
            problems, vw, rv.workGroupSize, rv.numWorkGroups, rv.numWorkItems, h_args);

        uint32_t gsu
            = sizeMapping.globalAccumulation == 1
                  ? 1
                  : (problems[0].getParams().gsu() > 0 ? problems[0].getParams().gsu() : autoGSU);

        if constexpr(std::is_same<KA, KernelArguments>::value)
        {
            rv.kernelName = outputConversionKernelName(problems[0], inputs.grouped[0], vw, gsu);
        }

        uint32_t workspaceOffsetInByte
            = this->requiredHostWorkspaceSizePerProblem * problems.size();
        for(int idx = 0; idx < problems.size(); idx++)
        {
            auto problem = problems[idx];
            outputConversionCallArgs<T_Debug>(
                problem, inputs.grouped[idx], workspaceOffsetInByte, h_args);
            if constexpr(std::is_same<KA, KernelArguments>::value)
                workspaceOffsetInByte += requiredWorkspaceSize(problem, hardware);
        }

        if constexpr(std::is_same<KA, KernelArguments>::value)
        {
            uint8_t* d_args = (uint8_t*)(inputs.ws) + previousArgsSpaceOffsetInByte;
            rv.args.append<uint8_t*>("wiTablePtr", d_args);
            // For user input
            rv.args.append<void const*>("DeviceUserArguments", nullptr);
            rv.args.append<uint8_t*>("argsPtr", d_args + problems.size() * sizeof(uint32_t));
            rv.args.append<uint32_t>("gemm_count", problems.size());
            rv.codeObjectFile = codeObjectFilename.load();
        }

        return rv;
    }

    template <bool T_Debug>
    KernelInvocation ContractionSolution::updateUserArgsOutputConversionCallGroupedGemm(
        std::vector<ContractionSolution::Problem> const& problems,
        const void*                                      userArgs,
        const void*                                      workspace) const
    {
        KernelInvocation rv;
        uint32_t         previousArgsSpaceOffsetInByte = 0;
        // FIXME: Need to find a way to offset the arg spaces

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(512, 64);

        size_t vw = 1;

        rv.workGroupSize.x = 256;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        rv.numWorkItems.x = 0;

        int h_args = 0; // Dummy value
        calculateConversionCallWorkGroupItems(
            problems, vw, rv.workGroupSize, rv.numWorkGroups, rv.numWorkItems, h_args);

        // FIXME: No problem and input for kernel name
        // rv.kernelName = outputConversionKernelName(
        //     problems[0], inputs.grouped[0], vw, sizeMapping.globalSplitU);

        uint8_t* d_args = (uint8_t*)workspace + previousArgsSpaceOffsetInByte;
        rv.args.append<uint8_t*>("wiTablePtr", d_args);
        // For user input
        rv.args.append<void const*>("DeviceUserArguments", nullptr);
        rv.args.append<uint8_t*>("argsPtr", d_args + problems.size() * sizeof(uint32_t));
        rv.args.append<uint32_t>("gemm_count", problems.size());
        rv.codeObjectFile = codeObjectFilename.load();

        return rv;
    }

    std::string ContractionSolution::outputConversionKernelName(Problem const&           problem,
                                                                ContractionInputs const& inputs,
                                                                size_t                   vw,
                                                                size_t                   gsu) const
    {
        auto inputTypeStr = (problem.a().dataType() == rocisa::DataType::Int8
                             || problem.a().dataType() == rocisa::DataType::Int32)
                                ? DataTypeInfo::Get(rocisa::DataType::Int32).abbrev
                            : problem.a().dataType() == rocisa::DataType::Double
                                ? DataTypeInfo::Get(rocisa::DataType::Double).abbrev
                                : DataTypeInfo::Get(rocisa::DataType::Float).abbrev;

        std::string name = concatenate("C",
                                       problem.cNames(),
                                       "_",
                                       inputTypeStr,
                                       DataTypeInfo::Get(problem.d().dataType()).abbrev);

        if(problemType.groupedGemm)
        {
            name += "_GG";
        }
        else if(!problemType.stridedBatched)
        {
            name += "_GB";
        }

        if(problemType.useBias)
        {
            auto s = rocisa::TypeAbbrev(problem.bias().dataType());
            if(problemType.useGradient)
            {
                if(problem.biasSrc() == ContractionProblemGemm::TENSOR::D)
                    s = rocisa::TypeAbbrev(problem.computeType());
                if(inputs.bias != nullptr)
                {
                    const char* alpha[5] = {"A", "B", "C", "D", "E"};
                    std::string ss;
                    for(auto it : problemType.biasSrcWhiteList)
                    {
                        if(it < 5)
                        {
                            ss += alpha[it];
                        }
                    }
                    name += ("_DBias" + s + "_BiasSrc" + ss);
                }
            }
            else
            {
                name += ("_Bias" + s);
            }
        }

        int factorDim
            = max(problemType.useGradient ? 0 : problemType.useBias, problemType.useScaleAlphaVec);
        if(factorDim)
        {
            if(factorDim == 2)
                name += ("_FDN");
            else if(factorDim == 3)
                name += ("_FDMN");
        }

        if(problemType.useE)
        {
            auto s = rocisa::TypeAbbrev(
                problem.tensors()[ContractionProblemGemm::TENSOR::E].dataType());
            if(problemType.useGradient)
            {
                name += ("_Grad" + s);
            }
            else
            {
                name += ("_Aux" + s);
            }
        }

        if(problemType.activationType != ActivationType::None)
        {
            if(problemType.activationType == ActivationType::All)
            {
                name += "_A";
            }
            else if(problemType.activationType == ActivationType::Hipblaslt_all)
            {
                name += "_HA";
            }
            else
            {
                std::string actName = ToString(problemType.activationType);
                std::transform(actName.begin(), actName.end(), actName.begin(), ::toupper);
                name += actName;
            }

            name += rocisa::TypeAbbrev(problemType.activationComputeDataType);

            if(problemType.activationNoGuard)
            {
                name += "ng";
            }
        }

        if(problemType.useScaleAB == "Scalar")
        {
            name += ("_ScaleAB");
        }
        else if(problemType.useScaleAB == "Vector")
        {
            name += ("_ScaleABVec");
        }
        if(problemType.useScaleCD)
        {
            name += ("_ScaleCD");
        }

        if(problemType.useScaleAlphaVec)
        {
            name += ("_ScaleAlphaVec");
        }

        uint32_t gsuTemp = gsu - 1;
        gsuTemp |= gsuTemp >> 1;
        gsuTemp |= gsuTemp >> 2;
        gsuTemp |= gsuTemp >> 4;
        gsuTemp |= gsuTemp >> 8;
        gsuTemp |= gsuTemp >> 16;
        gsuTemp++;

        name += "_PostGSU"
                + std::to_string(
                    std::min(static_cast<decltype(sizeMapping.globalSplitUPGR)>(gsuTemp),
                             sizeMapping.globalSplitUPGR));

        name += "_VW" + std::to_string(vw);

        return name;
    }

    template <bool T_Debug>
    KernelInvocation
        ContractionSolution::generateReductionCall(Problem const&           problem,
                                                   ContractionInputs const& inputs) const
    {
        TensorDescriptor const& c = problem.c();
        TensorDescriptor const& d = problem.d();
        TensorDescriptor const& e = problem.tensor(ContractionProblemGemm::TENSOR::E);

        KernelInvocation rv;

        rv.args = KernelArguments(T_Debug);

        rv.args.reserve(512, 64);

        size_t threads = 256;
        size_t mt0     = 256;
        size_t mt1     = 1;
        size_t vw      = 1;
        // TODO: Currently only support bias reduction
        if(problem.d().sizes()[1] >= 8192)
        {
            threads = 1024;
            mt1     = 32;
            vw      = 4;
        }
        else if(problem.d().sizes()[1] >= 32)
        {
            mt1 = 32;
        }
        else
        {
            mt1 = int(problem.d().sizes()[1] / 2) * 2;
            if(mt1 == 0)
                mt1 = 1;
        }
        mt0 = threads / mt1;

        rv.kernelName = outputReductionKernelName(problem, inputs, mt0, mt1, vw);

        rv.workGroupSize.x = threads;
        rv.workGroupSize.y = 1;
        rv.workGroupSize.z = 1;

        // TODO: Currently only support bias reduction
        rv.numWorkGroups.x = CeilDivide(problem.d().sizes()[0], (mt0 * vw));
        rv.numWorkGroups.y = 1;
        rv.numWorkGroups.z = 1;

        rv.numWorkItems.x = rv.workGroupSize.x * rv.numWorkGroups.x;
        rv.numWorkItems.y = rv.workGroupSize.y * rv.numWorkGroups.y;
        rv.numWorkItems.z = rv.workGroupSize.z * rv.numWorkGroups.z;

        // FIXME: Need to check the formula for batch > 1
        rv.args.append<void*>("WS", inputs.ws);
        rv.args.append<void const*>("bias", inputs.bias);
        for(size_t i = 0; i < 2; i++)
        {
            rv.args.append<uint32_t>(concatenate_if<T_Debug>("size_", i), problem.d().sizes()[i]);
        }
        rv.args.append<uint32_t>("strideDJ", d.sizes()[0]);

        //@TODO determine if this is needed, may not end up in the same code object file
        rv.codeObjectFile = codeObjectFilename.load();

        return rv;
    }

    std::string ContractionSolution::outputReductionKernelName(Problem const&           problem,
                                                               ContractionInputs const& inputs,
                                                               size_t                   mt0,
                                                               size_t                   mt1,
                                                               size_t                   vw) const
    {
        auto&       biasTensor = problem.tensor(ContractionProblemGemm::TENSOR::BIAS);
        std::string name       = concatenate("D",
                                       problem.dNames(),
                                       "_",
                                       DataTypeInfo::Get(biasTensor.dataType()).abbrev,
                                       DataTypeInfo::Get(problem.betaType()).abbrev);
        name += concatenate("_MT", mt0, "x", mt1);
        name += concatenate("_VW", vw);
        name += "_Reduction";

        return name;
    }

    std::vector<KernelInvocation> ContractionSolution::solve(ContractionProblem const& problem,
                                                             ProblemInputs const&      inputs,
                                                             Hardware const&           hardware,
                                                             void*       hipHostMemory,
                                                             size_t      hipHostMemorySize,
                                                             hipStream_t stream) const
    {
        if(auto gemmProblem = dynamic_cast<ContractionProblemGemm const*>(&problem))
        {
            auto gemmInputs = dynamic_cast<ContractionInputs const*>(&inputs);
            return solve((*gemmProblem), (*gemmInputs), hardware);
        }
        else if(auto groupedProblem = dynamic_cast<ContractionProblemGroupedGemm const*>(&problem))
        {
            auto& gemms         = groupedProblem->gemms;
            auto  groupedInputs = dynamic_cast<ContractionGroupedInputs const*>(&inputs);
            return solveGroupedGemm(
                gemms, (*groupedInputs), hardware, hipHostMemory, hipHostMemorySize, stream);
        }
        else
        {
            throw std::runtime_error("Failed to cast problem type.");
        }
    }

    // For Tensile debugging, will allocate and initialize DeviceUserArguments with the problems and inputs.
    std::vector<KernelInvocation>
        ContractionSolution::solveTensileGPU(ContractionProblem const& problem,
                                             ProblemInputs const&      inputs,
                                             Hardware const&           hardware,
                                             void**                    dUA,
                                             void**                    dUAHost,
                                             void*                     hipHostMemory,
                                             size_t                    hipHostMemorySize,
                                             hipStream_t               stream) const
    {
        // Since we now use universal args, we block globalSplitU here if using UserArgs
        if((sizeMapping.globalSplitU > 1 || sizeMapping.globalSplitU == -1)
           && sizeMapping.globalAccumulation != 3)
        {
            KernelInvocation dummyrv;
            dummyrv.kernelName = "";

            dummyrv.args = KernelArguments(false);

            dummyrv.workGroupSize.x = 1;
            dummyrv.workGroupSize.y = 1;
            dummyrv.workGroupSize.z = 1;

            dummyrv.numWorkItems.x = 1;
            dummyrv.numWorkItems.y = 1;
            dummyrv.numWorkItems.z = 1;

            dummyrv.sharedMemBytes = 0;
            return {dummyrv};
        }
        if(auto groupedProblem = dynamic_cast<ContractionProblemGroupedGemm const*>(&problem))
        {
            auto& gemms         = groupedProblem->gemms;
            auto  groupedInputs = dynamic_cast<ContractionGroupedInputs const*>(&inputs);
            return solveTensileGroupedGemmGPU(gemms,
                                              (*groupedInputs),
                                              hardware,
                                              dUA,
                                              dUAHost,
                                              hipHostMemory,
                                              hipHostMemorySize,
                                              stream);
        }
        else
        {
            throw std::runtime_error("Failed to cast problem type.");
        }
    }

    std::vector<KernelInvocation>
        ContractionSolution::solve(ContractionSolution::Problem const& problem,
                                   ContractionSolution::Inputs const&  inputs,
                                   Hardware const&                     hardware) const
    {
        calculateAutoGSU(problem, &hardware);
        if(Debug::Instance().printWinningKernelName())
            std::cout << "Running kernel: " << this->KernelName() << std::endl;

        // retreive alpha/beta type set via setAlpha/BetaType()
        auto alphaType = problem.alphaType();
        auto betaType  = problem.betaType();

        // TODO: Some gtests are passing the "problem" without actually defining the
        // alpha/beta type (alphaType and betaType remain None).
        // Until we fix those gtests, we need to keep this condition to adjust the missing
        // alpha/beta data types.
        if(alphaType == rocisa::DataType::None)
        {
            alphaType = problemType.aType == rocisa::DataType::BFloat16 ? rocisa::DataType::Float
                                                                        : problemType.dType;
        }
        if(betaType == rocisa::DataType::None)
        {
            betaType = alphaType;
        }

        bool debug = Debug::Instance().printKernelArguments() || this->kernelArgsLog;

        int boundSize = 1;
        for(size_t i = 0; i < problem.boundIndices().size(); i++)
            boundSize *= problem.boundSize(i);

        // Check for nullptrs if alpha is non-zero.
        if((!CompareValue(inputs.alpha, (double)0) && (boundSize != 0))
           && ((problem.stridedBatched() && (inputs.a == nullptr || inputs.b == nullptr))
               || (!problem.stridedBatched()
                   && (inputs.batchA == nullptr || inputs.batchB == nullptr))))
        {
            std::string matrixID = inputs.a == nullptr ? "A" : "B";
            std::string msg      = std::string("Unsupported nullptr for ") + matrixID
                              + std::string(" when (Alpha !=0) && (K != 0)\n");
            throw std::runtime_error(msg.c_str());
        }

        // Check if alpha matches problem definition
        if(problem.alphaRestriction() != ScalarValue::Any
           && problem.alphaRestriction() != toScalarValueEnum(inputs.alpha))
        {
            std::stringstream inputValue;
            inputValue << ToString(inputs.alpha);
            std::string msg = std::string("Alpha value ") + inputValue.str()
                              + std::string(" doesn't match that set in problem: ")
                              + ToString(problem.alphaRestriction());
            throw std::runtime_error(msg.c_str());
        }

        // Check if beta matches problem definition
        if(problem.betaRestriction() != ScalarValue::Any
           && problem.betaRestriction() != toScalarValueEnum(inputs.beta))
        {
            std::stringstream inputValue;
            inputValue << ToString(inputs.beta);
            std::string msg = std::string("Beta value ") + inputValue.str()
                              + std::string(" doesn't match that set in problem: ")
                              + ToString(problem.betaRestriction());
            throw std::runtime_error(msg.c_str());
        }

        if(problem.cEqualsD() && inputs.c != inputs.d)
            throw std::runtime_error(
                "ContractionProblemGemm has cEqualsD set, but pointers for c and d are not equal");

        std::vector<KernelInvocation> rv;

        auto gsu = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU;
        if(gsu > 1 && sizeMapping.globalAccumulation != 2 && sizeMapping.globalAccumulation != 3)
        {
            if(debug)
                rv.push_back(generateBetaOnlyCall<true>(problem, inputs));
            else
                rv.push_back(generateBetaOnlyCall<false>(problem, inputs));
        }

        if(debug)
            rv.push_back(generateSingleCall<true>(problem, inputs, hardware));
        else
            rv.push_back(generateSingleCall<false>(problem, inputs, hardware));

        if((sizeMapping.globalAccumulation != 3) && gsu > 1 && sizeMapping.globalAccumulation)
        {
            if(debug)
                rv.push_back(generateOutputConversionCall<true>(problem, inputs));
            else
                rv.push_back(generateOutputConversionCall<false>(problem, inputs));
        }

        // The reduction of A is done in ConversionKernel when GSU > 1 in MultipleBuffer mode
        if(problemType.useBias && problemType.useGradient
           && (problem.biasSrc() == ContractionProblemGemm::TENSOR::D))
        {
            if(problem.d().dimensions() != 3)
            {
                throw std::runtime_error("Currently only supports bias reduction (m x n x batch)");
            }
            // Skip if output is null
            if(inputs.bias != nullptr)
            {
                if(debug)
                    rv.push_back(generateReductionCall<true>(problem, inputs));
                else
                    rv.push_back(generateReductionCall<false>(problem, inputs));
            }
        }

        return rv;
    }

    std::vector<KernelInvocation> ContractionSolution::solveGroupedGemm(
        std::vector<ContractionSolution::Problem> const& problems,
        ContractionSolution::GroupedInputs const&        inputs,
        Hardware const&                                  hardware,
        void*                                            hipHostMemory,
        size_t                                           hipHostMemorySize,
        hipStream_t                                      stream) const
    {
        calculateAutoGSU(problems[0], &hardware);
        if(Debug::Instance().printWinningKernelName())
            std::cout << "Running kernel: " << this->KernelName() << std::endl;

        // retreive alpha/beta type set via setAlpha/BetaType()
        auto alphaType = problems[0].alphaType();
        auto betaType  = problems[0].betaType();

        // TODO: Some gtests are passing the "problem" without actually defining the
        // alpha/beta type (alphaType and betaType remain None).
        // Until we fix those gtests, we need to keep this condition to adjust the missing
        // alpha/beta data types.
        if(alphaType == rocisa::DataType::None)
        {
            alphaType = problemType.aType == rocisa::DataType::BFloat16 ? rocisa::DataType::Float
                                                                        : problemType.dType;
        }
        if(betaType == rocisa::DataType::None)
        {
            betaType = alphaType;
        }

        bool debug = Debug::Instance().printKernelArguments() || this->kernelArgsLog;

        // Check for nullptrs if alpha is non-zero.
        for(int idx = 0; idx < problems.size(); idx++)
        {
            int boundSize = 1;
            for(size_t i = 0; i < problems[idx].boundIndices().size(); i++)
                boundSize *= problems[idx].boundSize(i);

            const auto n = problems[idx].freeSizeB(0);

            if(n && ((!CompareValue(inputs.grouped[idx].alpha, (double)0)) && (boundSize != 0))
               && ((problems[idx].stridedBatched()
                    && (inputs.grouped[idx].a == nullptr || inputs.grouped[idx].b == nullptr))))
            {
                std::string matrixID = inputs.grouped[idx].a == nullptr ? "A" : "B";
                std::string msg      = std::string("Unsupported nullptr for ") + matrixID
                                  + std::string(" when (Alpha !=0) && (K != 0)\n");
                throw std::runtime_error(msg.c_str());
            }

            // Check if alpha matches problem definition
            if(problems[idx].alphaRestriction() != ScalarValue::Any
               && problems[idx].alphaRestriction() != toScalarValueEnum(inputs.grouped[idx].alpha))
            {
                std::stringstream inputValue;
                inputValue << ToString(inputs.grouped[idx].alpha);
                std::string msg = std::string("Alpha value ") + inputValue.str()
                                  + std::string(" doesn't match that set in problem: ")
                                  + ToString(problems[idx].alphaRestriction());
                throw std::runtime_error(msg.c_str());
            }

            // Check if beta matches problem definition
            if(problems[idx].betaRestriction() != ScalarValue::Any
               && problems[idx].betaRestriction() != toScalarValueEnum(inputs.grouped[idx].beta))
            {
                std::stringstream inputValue;
                inputValue << ToString(inputs.grouped[idx].beta);
                std::string msg = std::string("Beta value ") + inputValue.str()
                                  + std::string(" doesn't match that set in problem: ")
                                  + ToString(problems[idx].betaRestriction());
                throw std::runtime_error(msg.c_str());
            }

            if(problems[idx].cEqualsD() && inputs.grouped[idx].c != inputs.grouped[idx].d)
                throw std::runtime_error(
                    "ContractionProblem has cEqualsD set, but pointers for c and d are not equal");
        }

        std::vector<KernelInvocation> rv;
        auto                          h_args = KernelArguments(debug);
        if(hipHostMemory)
        {
            h_args.useExternalPointer(hipHostMemory, hipHostMemorySize);
        }
        h_args.reserve(32768, 8192);

        auto gsu = problems[0].getParams().gsu() > 0 ? problems[0].getParams().gsu() : autoGSU;

        // if((sizeMapping.globalSplitU > 1 || sizeMapping.globalSplitU == -1) && sizeMapping.globalAccumulation != 2)
        // {
        //     if(debug)
        //         rv.push_back(generateBetaOnlyCallGroupedGemm<true>(problems, inputs));
        //     else
        //         rv.push_back(generateBetaOnlyCallGroupedGemm<false>(problems, inputs));
        // }

        if(debug)
            rv.push_back(generateSingleCallGroupedGemm<true>(problems, inputs, hardware, h_args));
        else
            rv.push_back(generateSingleCallGroupedGemm<false>(problems, inputs, hardware, h_args));

        if(sizeMapping.globalAccumulation == 2 && gsu > 1)
        {
            if(debug)
                rv.push_back(generateOutputConversionCallGroupedGemm<true>(
                    problems, inputs, hardware, h_args));
            else
                rv.push_back(generateOutputConversionCallGroupedGemm<false>(
                    problems, inputs, hardware, h_args));
        }

        if(debug)
        {
            std::cout << "Grouped gemm argsPtr kernels: " << std::endl;
            for(auto& kernel : rv)
            {
                std::cout << kernel.kernelName << std::endl;
            }
            std::cout << h_args;
        }

        if(hipHostMemory && hipHostMemorySize < h_args.size())
            throw std::runtime_error("Insufficient host memory size.");

        uint8_t*    d_args = (uint8_t*)inputs.ws;
        const void* tmpMem = hipHostMemory ? hipHostMemory : h_args.data();

        HIP_CHECK_EXC(hipMemcpyAsync(
            d_args, tmpMem, h_args.size() * sizeof(uint8_t), hipMemcpyHostToDevice, stream));

        return rv;
    }

    std::vector<KernelInvocation>
        ContractionSolution::solveGroupedGemmGPU(std::vector<Problem> const& problems,
                                                 GroupedInputs const&        inputs,
                                                 Hardware const&             hardware,
                                                 const void*                 dUA,
                                                 const void*                 workspace,
                                                 hipStream_t                 stream) const
    {
        calculateAutoGSU(problems[0], &hardware);
        if(!problemType.supportDeviceUserArguments)
        {
            throw std::runtime_error("Currently this solution does not support user args.");
        }
        std::vector<KernelInvocation> rv;

        bool debug = Debug::Instance().printKernelArguments() || this->kernelArgsLog;

        // Here we only update the pointer
        int h_args = 1; // Dummy
        if(debug)
            rv.push_back(
                generateSingleCallGroupedGemm<true>(problems, inputs, hardware, h_args, dUA));
        else
            rv.push_back(
                generateSingleCallGroupedGemm<false>(problems, inputs, hardware, h_args, dUA));

        auto gsu = problems[0].getParams().gsu() > 0 ? problems[0].getParams().gsu() : autoGSU;

        if((sizeMapping.globalAccumulation && gsu > 1) && (sizeMapping.globalAccumulation != 3))
        {
            if(debug)
                rv.push_back(
                    updateUserArgsOutputConversionCallGroupedGemm<true>(problems, dUA, workspace));
            else
                rv.push_back(
                    updateUserArgsOutputConversionCallGroupedGemm<false>(problems, dUA, workspace));
        }

        return rv;
    }

    // For Tensile debugging, will allocate and initialize DeviceUserArguments with the problems and inputs.
    std::vector<KernelInvocation>
        ContractionSolution::solveTensileGroupedGemmGPU(std::vector<Problem> const& problems,
                                                        GroupedInputs const&        inputs,
                                                        Hardware const&             hardware,
                                                        void**                      dUA,
                                                        void**                      dUAHost,
                                                        void*                       hipHostMemory,
                                                        size_t      hipHostMemorySize,
                                                        hipStream_t stream) const
    {
        calculateAutoGSU(problems[0], &hardware);
        // Allocate and copy data to dUA
        if(problems[0].activationType() == ActivationType::None
           || (problems[0].activationType() != ActivationType::None
               && problems[0].activationComputeType() == rocisa::DataType::Float))
        {
            auto requiredSize = sizeof(DeviceUserArguments<float>) * problems.size();
            static_cast<void>(hipHostMalloc(dUAHost, requiredSize, 0));
            setDeviceUserArgs(problems, inputs, (DeviceUserArguments<float>*)(*dUAHost));
            static_cast<void>(hipMalloc(dUA, requiredSize));
            static_cast<void>(hipMemcpy(*dUA, *dUAHost, requiredSize, hipMemcpyHostToDevice));
            static_cast<void>(hipDeviceSynchronize());
        }
        else
        {
            throw std::runtime_error("Unsupported Device memory type.");
        }

        return solveGroupedGemmGPU(problems, inputs, hardware, *dUA, inputs.ws, stream);
    }

    void ContractionSolution::relaseDeviceUserArgs(void* dUA, void* dUAHost)
    {
        static_cast<void>(hipFree(dUA));
        static_cast<void>(hipFree(dUAHost));
    }

    ContractionSolution::StaticPerformanceModel
        ContractionSolution::staticPerformanceModel(double M,
                                                    double N,
                                                    double K,
                                                    double NumBatches,
                                                    double MT0,
                                                    double MT1,
                                                    double NumCUs,
                                                    double TotalGranularity,
                                                    int    GlobalSplitU) const
    {
        StaticPerformanceModel spm;

        int beta      = (int)problemType.useBeta;
        int betaReads = 0, betaWrites = 0;
        if(GlobalSplitU == 1)
        {
            if(beta != 0.0)
                betaReads = 1.0;
        }
        else
        {
            if(beta == 0)
                betaWrites = 1; // zero output
            else if(beta != 1.0) // if 1.0, just atomic update output
            {
                // if not 1.0, read, scale, write, then atomic update in kernel
                betaReads  = 1; // initial read for scale
                betaWrites = 1; // writeback after scale
            }
        }

        auto aInfo = DataTypeInfo::Get(problemType.aType);
        auto bInfo = DataTypeInfo::Get(problemType.bType);
        auto cInfo = DataTypeInfo::Get(problemType.cType);
        auto dInfo = DataTypeInfo::Get(problemType.dType);

        spm.memReadBytesA = (NumBatches * M * N * K) / MT1 * aInfo.elementSize;
        spm.memReadBytesB = (NumBatches * M * N * K) / MT0 * bInfo.elementSize;
        spm.memReadBytesC = (NumBatches * M * N) * betaReads * cInfo.elementSize;

        if(GlobalSplitU == 1)
            spm.memWriteBytesD = (NumBatches * M * N) * (1 + betaWrites) * dInfo.elementSize;
        else
        {
            bool   hardwareAtomic   = false; // TODO-model
            double atomicOperations = hardwareAtomic ? 2 : 3; // read-mod-write or cas  //TODO-model
            double atomicCollisions = 1.0; // TODO-could be based on K, GSU
            spm.memWriteBytesD      = (NumBatches * M * N)
                                 * (betaWrites + atomicOperations * atomicCollisions)
                                 * dInfo.elementSize;
        }
        spm.memReadBytes   = spm.memReadBytesA + spm.memReadBytesB + spm.memReadBytesC;
        spm.memGlobalReads = spm.memReadBytesA / aInfo.elementSize
                             + spm.memReadBytesB / bInfo.elementSize
                             + spm.memReadBytesC / cInfo.elementSize;
        spm.memGlobalWrites = spm.memWriteBytesD / dInfo.elementSize;

        return spm;
    }

    bool ContractionSolution::checkInternalArgumentsSupport(ContractionProblem const& problem,
                                                            std::ostream&             stream,
                                                            bool                      debug) const
    {
        bool pass = true;

        if(auto gemmProblem = dynamic_cast<ContractionProblemGemm const*>(&problem))
        {
            if(!internalArgsSupport.gsu && gemmProblem->getParams().gsu() != 0)
            {
                if(debug)
                {
                    stream << "This solution does not support custom gsu." << std::endl;
                }
                pass = false;
            }
            if(!internalArgsSupport.wgm && gemmProblem->getParams().wgm() != 0)
            {
                if(debug)
                {
                    stream << "This solution does not support custom wgm." << std::endl;
                }
                pass = false;
            }
        }
        else if(auto groupedProblem = dynamic_cast<ContractionProblemGroupedGemm const*>(&problem))
        {
            if(gemmProblem->getParams().gsu() != 0)
            {
                if(debug)
                {
                    stream << "Currently grouped gemm does not support custom arguments tuning."
                           << std::endl;
                }
                pass = false;
            }
            if(!internalArgsSupport.wgm && gemmProblem->getParams().wgm() != 0)
            {
                if(debug)
                {
                    stream << "This solution does not support custom wgm." << std::endl;
                }
                pass = false;
            }
        }
        else
        {
            pass = false;
            throw std::runtime_error("Failed to cast problem type.");
        }
        return pass;
    }

    size_t ContractionSolution::requiredWorkspaceSize(Problem const&  problem,
                                                      Hardware const& hardware) const
    {
        size_t size = 0;
        // TODO: Pass GSU from problem and change value[2] to gsu if gsu != default value
        size_t gsu
            = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : sizeMapping.globalSplitU;

        if(sizeMapping.streamK > 0 && sizeMapping.streamKAtomic == 0)
        {
            // SK doesn't care gsu
            if(gsu > 1)
            {
                std::cerr << "Warning: Stream-K Data Parallel does not support GSU > 1, "
                          << "setting GSU to 1." << std::endl;
                gsu = 1;
            }
            const bool streamKDP = Debug::Instance().useStreamKDataParrallel();
            auto       tiles     = problem.getNumTiles(sizeMapping, gsu);
            size_t     skGrid    = getSKGrid(problem, hardware, tiles);
            // Get space required for partial tiles
            if(tiles % skGrid != 0 && !streamKDP)
                size += partialTileSize(skGrid);
        }
        else
        {
            // TODO: Pass GSU from problem and change value[2] to gsu if gsu != default value
            calculateAutoGSU(problem, &hardware);
            size_t gsu = problem.getParams().gsu() > 0 ? problem.getParams().gsu() : autoGSU;
            size_t gsuMultiplier = gsu > 1 ? gsu : 0;
            size_t batch         = problem.d().sizes()[2];
            size_t tiles         = problem.getNumTiles(sizeMapping, gsu) * batch;
            size_t tileSize      = sizeMapping.macroTile.x * sizeMapping.macroTile.y
                              * sizeMapping.workspaceSizePerElemC;
            size_t bufSize = gsu > 1 ? tiles * tileSize : 0;
            size += bufSize;

            if(problemType.useGradient && problemType.useBias
               && problem.getParams().biasEnum() != rocisa::DataType::None)
            {
                if(problem.biasSrc() == ContractionProblemGemm::TENSOR::A)
                {
                    size += problem.freeSizeA(0) * sizeMapping.workspaceSizePerElemBias
                            * gsuMultiplier;
                }
                else if(problem.biasSrc() == ContractionProblemGemm::TENSOR::B)
                {
                    size += problem.freeSizeB(0) * sizeMapping.workspaceSizePerElemBias
                            * gsuMultiplier;
                }
                else if(problem.biasSrc() == ContractionProblemGemm::TENSOR::D
                        && (gsuMultiplier == 0))
                {
                    size += problem.d().totalLogicalElements() * problem.computeTypeElementSize()
                            * gsu;
                }
            }

            // workspace for amaxD
            if(problemType.outputAmaxD)
            {
                auto numWGS = getNumWorkGroups(problem, sizeMapping);
                size += problem.amaxd().elementBytes() * numWGS;
            }
        }

        return size;
    }

    size_t
        ContractionSolution::requiredWorkspaceSizeGroupedGemm(std::vector<Problem> const& problems,
                                                              Hardware const& hardware) const
    {
        size_t sizeInByte = 0;

        for(int i = 0; i < problems.size(); i++)
        {
            auto problem = problems[i];
            sizeInByte += requiredWorkspaceSize(problem, hardware);
        }
        ContractionGroupedInputs inputs;
        for(int i = 0; i < problems.size(); i++)
        {
            ContractionInputs unit;
            inputs.grouped.push_back(unit);
        }
        auto h_args = KernelArgumentsCounter();
        generateSingleCallGroupedGemm<false>(problems, inputs, hardware, h_args);
        if(sizeMapping.globalAccumulation)
            generateOutputConversionCallGroupedGemm<false>(problems, inputs, hardware, h_args);
        sizeInByte += h_args.size();
        return sizeInByte;
    }

    size_t ContractionSolution::requiredHostSizeGroupedGemmSingle(Problem const&  problem,
                                                                  Hardware const& hardware) const
    {
        if(!problemType.groupedGemm)
            return 0;

        std::vector<Problem> tmpProblem;
        tmpProblem.emplace_back(problem);
        ContractionGroupedInputs inputs;
        for(int i = 0; i < tmpProblem.size(); i++)
        {
            ContractionInputs unit;
            inputs.grouped.push_back(unit);
        }
        auto h_args = KernelArgumentsCounter();
        generateSingleCallGroupedGemm<false>(tmpProblem, inputs, hardware, h_args);
        if(sizeMapping.globalAccumulation)
            generateOutputConversionCallGroupedGemm<false>(tmpProblem, inputs, hardware, h_args);
        return h_args.size();
    }

    size_t ContractionSolution::requiredSynchronizerSize(Problem const& problem, Hardware const& hardware) const
    {
        if(sizeMapping.globalAccumulation == 3)
        {
            size_t batch = problem.d().sizes()[2];
            size_t tiles = problem.getNumTiles(sizeMapping, 1) * batch;
            return tiles * sizeMapping.synchronizerSizePerWG;
        }
        return 0;
    }

    size_t ContractionSolution::getSKGrid(Problem const&  problem,
                                          Hardware const& hardware,
                                          size_t          tiles) const
    {
        const bool streamKDP = Debug::Instance().useStreamKDataParrallel();
        if(streamKDP)
            return tiles;

        // If K==0, run kernel as DP with Alpha=0 to skip main loop and apply beta*c
        size_t z = 1;
        for(size_t i = 0; i < problem.boundIndices().size(); ++i)
        {
            z *= problem.boundSize(i);
        }
        if(z == 0)
            return tiles;

        AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(&hardware);

        assert(pAMDGPU != nullptr && pAMDGPU->computeUnitCount != 0);
        size_t cuCount = pAMDGPU->computeUnitCount;

        // User-specified grid size for Stream-K kernel.
        if(pAMDGPU->skFixedGrid > 0)
        {
            return pAMDGPU->skFixedGrid;
        }

        // Dynamically pick the minimum between the cuCount or number of tiles.
        else if(pAMDGPU->skDynamicGrid == 1)
        {
            return min(cuCount, tiles);
        }

        // Dynamically pick the minimum between the cuCount or number of tiles,
        // and scale down really large sizes to use fewer CUs for power/energy savings.
        else if(pAMDGPU->skDynamicGrid == 2)
        {
            size_t skGrid = cuCount;
            if(tiles > skGrid)
            {
                for(size_t i = 1; i <= 32; i *= 2)
                {
                    size_t tilesPerCU  = CeilDivide(i * tiles, cuCount);
                    size_t reducedGrid = CeilDivide(i * tiles, tilesPerCU);
                    float  utilization = ((float)reducedGrid) / ((float)cuCount);
                    if(utilization > 0.75f)
                    {
                        if(utilization < 1.0f)
                            skGrid = reducedGrid;
                        break;
                    }
                }
            }

            return min(skGrid, tiles);
        }

        // Dynamically predict the best grid-size by weighing the cost of the fix-up
        // step and the cost of processing MAC-loop instructions. When the cost of fix-up
        // is the bottleneck, use smaller grid size.
        // Architecture dependent.
        else if(pAMDGPU->skDynamicGrid == 3)
        {
            size_t x     = 1;
            size_t y     = 1;
            size_t batch = 1;
            for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
            {
                x *= problem.freeSizeA(i);
            }
            for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
            {
                y *= problem.freeSizeB(i);
            }
            for(size_t i = 0; i < problem.batchIndices().size(); ++i)
            {
                batch *= problem.batchSize(i);
            }

            return analytical::streamk::best_predicted_grid_size(sizeMapping.macroTile.x,
                                                                 sizeMapping.macroTile.y,
                                                                 sizeMapping.depthU,
                                                                 x,
                                                                 y,
                                                                 z,
                                                                 batch,
                                                                 1,
                                                                 cuCount);
        }
        // Fix Stream-K algorithm to function like a Data-parallel schedule
        // where grid size is equal to the number of output tiles.
        else if(pAMDGPU->skDynamicGrid == 4)
        {
            size_t x     = 1;
            size_t y     = 1;
            size_t batch = 1;
            for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
            {
                x *= problem.freeSizeA(i);
            }
            for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
            {
                y *= problem.freeSizeB(i);
            }
            for(size_t i = 0; i < problem.batchIndices().size(); ++i)
            {
                batch *= problem.batchSize(i);
            }

            return analytical::streamk::number_of_output_tiles(
                sizeMapping.macroTile.x, sizeMapping.macroTile.y, x, y, batch);
        }
        else if(pAMDGPU->skDynamicGrid == 5)
        {
            hip::HipAMDGPU const* hipAMDGPU = dynamic_cast<hip::HipAMDGPU const*>(&hardware);
            size_t                x         = 1;

            size_t y     = 1;
            size_t batch = 1;
            for(size_t i = 0; i < problem.freeIndicesA().size(); i++)
            {
                x *= problem.freeSizeA(i);
            }
            for(size_t i = 0; i < problem.freeIndicesB().size(); i++)
            {
                y *= problem.freeSizeB(i);
            }
            for(size_t i = 0; i < problem.batchIndices().size(); ++i)
            {
                batch *= problem.batchSize(i);
            }
            size_t elementSizeA_bits
                = problem.a().elementBytes() * 8; // TODO update for A/B different types
            size_t elementSizeB_bits
                = problem.b().elementBytes() * 8; // TODO update for A/B different types
            size_t elementSizeC_bits
                = problem.c().elementBytes() * 8; // TODO update for A/B different types
            return analytical::select_best_grid_size(x,
                                                     y,
                                                     z,
                                                     batch,
                                                     problem.transA(),
                                                     problem.transB(),
                                                     *(hipAMDGPU->analyticalHardware),
                                                     sizeMapping.macroTile.x,
                                                     sizeMapping.macroTile.y,
                                                     sizeMapping.depthU,
                                                     sizeMapping.matrixInstruction[0],
                                                     sizeMapping.matrixInstruction[1],
                                                     sizeMapping.matrixInstruction[2],
                                                     elementSizeA_bits,
                                                     elementSizeB_bits,
                                                     elementSizeC_bits,
                                                     0,
                                                     0.0,
                                                     false,
                                                     sizeMapping.workGroupMapping,
                                                     10);
        }
        // Limit the CUs Stream-K is launched on either max or the specified,
        // whichever is minimum.
        else if(pAMDGPU->skMaxCUs > 0)
        {
            return min(cuCount, pAMDGPU->skMaxCUs);
        }

        // Multiply the cuCount with a constant factor (c), and launch
        // c * cuCount number of workgroups for Stream-K.
        else if(pAMDGPU->skGridMultiplier > 1)
        {
            return cuCount * pAMDGPU->skGridMultiplier;
        }

        // If no option is specified, launch exactly cuCount worth of workgroups.
        else
        {
            return cuCount;
        }
    }

    size_t ContractionSolution::partialTileSize(size_t skGrid) const
    {
        size_t size = 0;

        size_t tileSize
            = sizeMapping.macroTile.x * sizeMapping.macroTile.y * sizeMapping.workspaceSizePerElemC;
        size += tileSize * skGrid; // Partials tile per WG
        // TODO batches
        // TODO round up for alignment?

        return size;
    }

    float ContractionSolution::computeGranularity(float x)
    {
        return x / ceil(x);
    }

    ContractionSolution::Granularities ContractionSolution::computeGranularities(
        Hardware const& hardware, double M, double N, double K, double NumBatches) const
    {
        ContractionSolution::Granularities granularities;

        double MT0 = sizeMapping.macroTile.x;
        double MT1 = sizeMapping.macroTile.y;

        AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(&hardware);
        assert(pAMDGPU);

        double NumCUs        = pAMDGPU->computeUnitCount;
        double wavefrontSize = pAMDGPU->wavefrontSize;
        double simdPerCu     = pAMDGPU->simdPerCu;

        double GlobalSplitU = autoGSU;
        double LocalSplitU  = sizeMapping.workGroupSize.z;

        granularities.MT0 = MT0;
        granularities.MT1 = MT1;
        granularities.GSU = GlobalSplitU;
        granularities.LSU = LocalSplitU;
        granularities.CUs = NumCUs;

        granularities.numTiles0 = M / MT0;
        granularities.numTiles1 = N / MT1;

        granularities.tile0Granularity = computeGranularity(granularities.numTiles0);
        granularities.tile1Granularity = computeGranularity(granularities.numTiles1);

        granularities.tilesPerCu
            = (NumBatches * ceil(granularities.numTiles0) * ceil(granularities.numTiles1))
              / (NumCUs / GlobalSplitU / LocalSplitU);

        granularities.totalTiles    = ceil(granularities.numTiles0) * ceil(granularities.numTiles1);
        granularities.natTilesPerCu = NumBatches * granularities.totalTiles / NumCUs;
        granularities.suTilesPerCu  = (granularities.totalTiles * GlobalSplitU) / NumCUs;
        granularities.suCuGranularity = computeGranularity(granularities.suTilesPerCu);

        granularities.waveGranularity = std::min(
            1.00,
            static_cast<double>(floor(granularities.tilesPerCu + 1.0) * sizeMapping.workGroupSize.x
                                * sizeMapping.workGroupSize.y * sizeMapping.workGroupSize.z)
                / pAMDGPU->wavefrontSize / pAMDGPU->simdPerCu);

        granularities.waves
            = ceil((sizeMapping.workGroupSize.x * sizeMapping.workGroupSize.y) / wavefrontSize);

        granularities.suWavesPerSimdx2
            = (granularities.suTilesPerCu * granularities.waves) / (2 * simdPerCu);
        granularities.suWaveGranularity
            = granularities.suWavesPerSimdx2 * ceil(granularities.suWavesPerSimdx2);

        double nat_tiles_per_cu
            = NumBatches * ceil(granularities.numTiles0) * ceil(granularities.numTiles1) / NumCUs;
        granularities.natCuGranularity = ceil(nat_tiles_per_cu) * ceil(nat_tiles_per_cu) / NumCUs;

        granularities.cuGranularity = computeGranularity(granularities.tilesPerCu);

        granularities.totalGranularity
            = granularities.tile0Granularity * granularities.tile1Granularity
              * granularities.cuGranularity * granularities.waveGranularity;

        granularities.totalTileAwareGranularity
            = granularities.tile0Granularity * granularities.tile1Granularity
              * granularities.suCuGranularity * granularities.suWaveGranularity;

        return granularities;
    }

    static double getPrefetchPerformance(int pgr, int grvwa, int grvwb, int bpeA, int bpeB, uint32_t depthU, int waveNum, double MT0, double MT1, double math_frequency, double mem_latency, int numAccPerWave)
    {
        const double others = 220 + numAccPerWave * 4;
        int stallA = 4;
        int lwA = 8;
        switch(grvwa * bpeA)
        {
        case 16:
            stallA = 25;
            lwA = 20;
            break;
        case 8:
            stallA = 18;
            lwA = 12;
            break;
        case 4:
            stallA = 8;
            lwA = 8;
            break;
        default:
            stallA = 4;
            lwA = 8;
        }
        int stallB = 4;
        int lwB = 1;
        switch(grvwb * bpeB)
        {
        case 16:
            stallB = 25;
            lwB = 20;
            break;
        case 8:
            stallB = 18;
            lwB = 12;
            break;
        case 4:
            stallB = 8;
            lwB = 8;
            break;
        default:
            stallB = 4;
            lwB = 8;
        }

        int numGRA = MT0 * depthU * bpeA / (waveNum * 64) / grvwa;
        int numGRB = MT1 * depthU * bpeB / (waveNum * 64) / grvwb;

        //issue 2nd prefetch
        double grCycles2 = numGRA * 4 / waveNum;
        grCycles2       += numGRB * 4 / waveNum;

        if(pgr >= 2)
        {
            double grCycles = 0.0;
            if(numGRA + numGRB > 16)
            {
                grCycles = 16 * 4;
                auto extraGR = numGRA + numGRB - 16;
                if(numGRA > 16)
                {
                    //issue GRA
                    grCycles += stallA * (numGRA - 16);
                }
                //issue GRB
                if(numGRB <= 16)
                {
                    grCycles += stallA * numGRB;
                }
                else
                {
                    grCycles += stallA * 16;
                    grCycles += stallB * (16 - numGRB);
                }
            }
            else
            {
                grCycles = (numGRA + numGRB) * 4 * (waveNum / 2);
            }

            //issue local write
            double lrCycles = numGRA * lwA / waveNum;
            lrCycles       += numGRB * lwB / waveNum;

            double perf = std::max((grCycles + others) / math_frequency, mem_latency) + (lrCycles + grCycles2) / math_frequency;
            //std::cout<<"grCycles, others, math_frequency="<<grCycles<<","<<others<<","<<math_frequency<<""<<std::endl;

        }
        return (grCycles2 + others) / math_frequency;
    }

    static double ceiling_math(double value, double significance = 1) {
        return std::ceil(value / significance) * significance;
    }

    static double calculateStoreL3Request(double M, double N, double MT0, double MT1, double &non_edge_req, double &edge_req) {
        double result = 0.0;

        double C115 = M;
        double F115 = MT0;
        double D115 = N;

        double edge_size = std::fmod(C115, F115);
        double numWGsNonEdge = std::floor(C115 / F115);
        result = D115 * (
            (numWGsNonEdge * ceiling_math(F115 / 32)) +
            ceiling_math(edge_size / 32)
        );

        double maxMT1 = std::min(N, MT1);
        double nonEdgeRequestPerMT = maxMT1 * (ceiling_math(F115 / 32));
        double edgeRequestPerMT = maxMT1 * ceiling_math(edge_size / 32);
        if(numWGsNonEdge > 0.0)
            non_edge_req = nonEdgeRequestPerMT;
        else
            non_edge_req = 0;
        edge_req     = edgeRequestPerMT;

        return result;
    }

    static double calculateStoreL2Request(double M, double N, double MT0, double MT1, double SVW, double &non_edge_req, double &edge_req) {
        double result = 0.0;

        double D115 = N;
        double C115 = M;
        double F115 = MT0;
        double G115 = SVW;

        double edge_size = std::fmod(C115, F115);
        double numWGsNonEdge = std::floor(C115 / F115);
        double M_MOD_16SVW = std::fmod(C115, 16 * G115);

        double non_edge_0 = F115 * 2 / 64 * ceiling_math(64 / (16 * 2 * G115));
        double edge_0 = (ceiling_math(std::floor(edge_size / (16 * G115)) * (16 * G115) * 2 / 64 * ceiling_math(64 / (16 * 2 * G115))) * G115);
        double edge_1 = (std::floor(M_MOD_16SVW * 2 / 64 * ceiling_math(64 / (16 * 2 * G115))) * std::min(M_MOD_16SVW, G115));
        double edge_2 = (std::min(std::fmod(C115, std::min(16 * G115, 32.0)), G115));

        result = D115 * (
            (numWGsNonEdge * non_edge_0) +
            (edge_0) +
            (edge_1) +
            (edge_2)
        );

        double maxMT1 = std::min(N, MT1);
        double nonEdgeRequestPerMT = maxMT1 * (non_edge_0);
        double edgeRequestPerMT = maxMT1 * (edge_0 + edge_1 + edge_2);
        if(numWGsNonEdge > 0.0)
            non_edge_req = nonEdgeRequestPerMT;
        else
            non_edge_req = 0;
        edge_req     = edgeRequestPerMT;

        return result;
    }

    static double calculateStoreL1Request(double M, double N, double MT0, double MT1, double SVW, double &non_edge_req, double &edge_req) {
        double result = 0.0;
        double D115 = N;
        double C115 = M;
        double F115 = MT0;
        double G115 = SVW;

        double edge_size = std::fmod(C115, F115);
        double numWGsNonEdge = std::floor(C115 / F115);

        double non_edge_0 = F115 / 16 * (-1) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 4) == 2 ? 1 : 0);
        double non_edge_1 = F115 / 16 * (-4) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 16) == 8 ? 1 : 0);
        double non_edge_2 = F115 / 16 * (-3) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 4) == 0 ? 1 : 0);
        double non_edge_3 = F115 / 16 * (-12) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 16) == 0 ? 1 : 0);
        double edge_0 = (std::floor(edge_size / (16 * G115)) * 3 * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 2) == 1 ? 1 : 0));
        double edge_1 = (std::floor(edge_size / (16 * G115)) * 2 * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 4) == 2 ? 1 : 0));
        double edge_2 = (std::floor(edge_size / (16 * G115)) * (-4) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 8) == 0 ? 1 : 0));
        double edge_3 = (std::floor(edge_size / (16 * G115)) * 4 * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 16) == 0 ? 1 : 0));
        double edge_4 = (std::floor(edge_size / (16 * G115)) * (-12 * G115 * G115) * (G115 == 1 ? 1 : 0) * (std::fmod(C115, 16) == 0 ? 1 : 0));

        result += D115 / 64 * (
            (numWGsNonEdge * non_edge_0) +
            (numWGsNonEdge * non_edge_1) +
            (numWGsNonEdge * non_edge_2) +
            (numWGsNonEdge * non_edge_3) +
            (edge_0) +
            (edge_1) +
            (edge_2) +
            (edge_3) +
            (edge_4)
        );

        double non_edge_4 = F115 / 32 * (G115 == 2 || G115 == 8 ? 139 : (G115 == 4 ? 82 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 2) == 1 ? 1 : 0);
        double non_edge_5 = F115 / 16 * (G115 == 2 || G115 == 8 ? 3 : (G115 == 4 ? 2 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 4) == 2 ? 1 : 0);
        double non_edge_6 = F115 / 16 * (G115 == 2 || G115 == 8 ? 2 : (G115 == 4 ? 0 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 8) == 4 ? 1 : 0);
        double non_edge_7 = F115 / 16 * (G115 == 2 || G115 == 8 ? 4 : (G115 == 4 ? 0 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 16) == 8 ? 1 : 0);
        double non_edge_8 = F115 / 16 * (-4) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 8) == 0 ? 1 : 0);
        double non_edge_9 = F115 / 16 * (G115 == 4 || G115 == 8 ? 0 : (G115 == 2 ? -8 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 16 * G115) == 0 ? 1 : 0);
        double non_edge_10 =  F115 / 16 * (G115 == 4 || G115 == 8 ? -8 : (G115 == 2 ? 0 : 0)) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 4 * G115) == 0 ? 1 : 0);
        double edge_5 = (std::floor(edge_size / (16 * G115)) * (-16 * G115 * G115) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 16 * G115) == 8 * G115 ? 1 : 0));
        double edge_6 = (std::floor(edge_size / (16 * G115)) * (-48 * G115 * G115) * (G115 == 1 ? 0 : 1) * (std::fmod(C115, 16 * G115) == 0 ? 1 : 0));

        result += D115 / 64 * (
            (numWGsNonEdge * non_edge_4) +
            (numWGsNonEdge * non_edge_5) +
            (numWGsNonEdge * non_edge_6) +
            (numWGsNonEdge * non_edge_7) +
            (numWGsNonEdge * non_edge_8) +
            (numWGsNonEdge * non_edge_9) +
            (numWGsNonEdge * non_edge_10) +
            (edge_5) +
            (edge_6)
        );

        double M_MOD_16SVW = std::fmod(C115, 16 * G115);
        double M_MOD_8VW   = std::fmod(C115, 8 * G115);
        double M_MOD_4SVW  = std::fmod(C115, 4 * G115);
        double M_MOD_4     = std::fmod(C115, 4);

        double non_edge_11 = F115 / 16 * (16 - (G115 == 1 ? 1 : 4));
        double edge_7 = (std::floor(edge_size / (16 * G115)) * (12 * G115 * G115) * (G115 == 1 ? 1 : 4));
        double edge_8 = ((M_MOD_16SVW >= 4 * G115 ? (M_MOD_16SVW - 4 * G115) * G115 * (G115 == 1 && M_MOD_4 == 0 ? 1 : 4) * (M_MOD_8VW == 0 ? 0 : 1) : 0));

        result += D115 / 64 * (
            (numWGsNonEdge * non_edge_11) +
            (edge_7) +
            (edge_8)
        );

        double non_edge_12 = ((F115 * 2) / 64) * (G115 == 1 || G115 == 4 ? 2 : 1);
        double edge_9 = (std::floor(edge_size / (16 * G115)) * (G115 == 1 ? 1 : 4 * G115));
        double edge_10 = (M_MOD_16SVW < 4 * G115 ? M_MOD_4SVW : 0);
        double edge_11 = (M_MOD_16SVW >= 4 * G115 ? (G115 == 1 && M_MOD_4 == 0 ? 1 : 4 * G115) : 0);

        result += D115 * (
            (numWGsNonEdge * non_edge_12) +
            (edge_9) +
            (edge_10) +
            (edge_11)
        );

        double maxMT1 = std::min(N, MT1);
        double nonEdgeRequestPerMT = maxMT1 / 64 * (non_edge_0 + non_edge_1 + non_edge_2 + non_edge_3 + non_edge_4 + non_edge_5 + non_edge_6 + non_edge_7 +
                                                    non_edge_8 + non_edge_9 + non_edge_10 + non_edge_11) +
                                     (maxMT1 * non_edge_12);
        double edgeRequestPerMT = maxMT1 / 64 * (edge_0 + edge_1 + edge_2 + edge_3 + edge_4 + edge_5 + edge_6 + edge_7 + edge_8) +
                                  maxMT1 * (edge_9 + edge_10 + edge_11);

        if(numWGsNonEdge > 0.0)
            non_edge_req = nonEdgeRequestPerMT;
        else
            non_edge_req = 0;
        edge_req     = edgeRequestPerMT;

        return result;
    }

    static double getLoadRequest(double MTX, double DU, double L1CacheLineSize, uint32_t grvw, uint32_t bpe, int dtv, double &tcc_ea0_coalscedA)
    {
        double L1_req = 0.0;
        tcc_ea0_coalscedA = 1;
        if(dtv == 0)
        {
            L1_req = MTX * DU * bpe / 64;
            if(DU * bpe < L1CacheLineSize)
            {
                // for DU32
                //std::cout<<"DU32 : L1_req *= "<<L1CacheLineSize / (DU * bpe)<<std::endl;
                L1_req *= L1CacheLineSize / (DU * bpe);
                tcc_ea0_coalscedA = 2;
            }
            if(grvw * bpe == 8 || grvw * bpe <= 2)
            {
                //std::cout<<"dwordx2 : L1_req *= 2"<<std::endl;
                // for dwordx2 and short
                L1_req *= 2;
            }
        }
        else
        {
            // dtv
            L1_req = MTX * DU * bpe / 64 * (DU / grvw);
            if(DU > 32)
                L1_req /= 2;
        }
        return L1_req;
    }

    static double getTCPEfficiency(double DU, double K, double bpe, double L1HteRate)
    {
        double TCPEff = 1.0;
        double TCP_tagrams_width = 512;
        double K_byte = K * bpe;
        double K_mod_512 = std::fmod(K_byte, TCP_tagrams_width); // 4 bank. 128B per bank.
        double DU_byte = DU * bpe;
        if(K_mod_512 == 0)
        {
            // 512 bytes aligned
            if(DU_byte < 512)
            {
                TCPEff = std::max(0.25, DU_byte / 512);
            }
        }
        else if(K_mod_512 == 256)
        {
            // 256 bytes aligned
            if(DU_byte < 256)
            {
                TCPEff = std::max(0.5, DU_byte / 256);
            }
        }
        //std::cout<<"TCPEff = "<<TCPEff<<std::endl;
        double TCPDowngradeByHitRate = 1; //std::max(0.0, std::min(0.8, 0.8 - L1HteRate * 2));
        double TCPFormula = (1+(1-TCPDowngradeByHitRate)*(TCPEff-1)-TCPDowngradeByHitRate*(TCPEff-1)*(TCPEff-1));
        return TCPFormula;
    }

    ContractionSolution::ProjectedPerformance
        ContractionSolution::predictedPerformance(Problem const&  problem,
                                                  Hardware const& hardware) const
    {
        ProjectedPerformance pp;
        double M = 1.0, N = 1.0;
        if(problem.freeIndicesA().size() > 1 || sizeMapping.packBatchDims & 0x1)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesA(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                M *= problem.a().sizes()[*pi];
        }
        else
            M = problem.freeSizeA(0);

        if(problem.freeIndicesB().size() > 1 || sizeMapping.packBatchDims & 0x2)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesB(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                N *= problem.b().sizes()[*pi];
        }
        else
            N = problem.freeSizeB(0);

        double NumBatches = 1;
        if(sizeMapping.packBatchDims == 0)
        {
            for(size_t i = 0; i < problem.batchIndices().size(); i++)
                NumBatches *= problem.batchSize(i);
        }
        double K = problem.boundSize(0); // TODO - fix for multiple summations

        AMDGPU const* pAMDGPU = dynamic_cast<AMDGPU const*>(&hardware);
        assert(pAMDGPU);
        //std::cout<<"=======sizeMapping=========="<<std::endl;

        double NumCUs = pAMDGPU->computeUnitCount;
        double wavefrontSize = pAMDGPU->wavefrontSize;
        double MT0    = sizeMapping.macroTile.x;
        double MT1    = sizeMapping.macroTile.y;
        calculateAutoGSU(problem, &hardware);
        double   GlobalSplitU    = autoGSU;
        double   math_clk        = sizeMapping.MathClocksUnrolledLoop; //MT0 * MT1 * 2 * depthU / flopsPerClk;
        int      WGM             = sizeMapping.workGroupMapping != 0 ? sizeMapping.workGroupMapping : 1;
        int      CUOccupancy     = sizeMapping.CUOccupancy;
        int      PGR             = sizeMapping.PrefetchGlobalRead;
        uint32_t depthU          = sizeMapping.depthU;
        bool     isGSUWGMRR      = sizeMapping.globalSplitUWorkGroupMappingRoundRobin;
#define ENABLE_NON_TEMPORAL
#ifdef ENABLE_NON_TEMPORAL
        int      NTA             = sizeMapping.NonTemporalA;
        int      NTB             = sizeMapping.NonTemporalB;
        int      NTD             = sizeMapping.NonTemporalD;
#else
        int      NTA             = 0;
        int      NTB             = 0;
        int      NTD             = 0;
#endif
        int      WSGRA           = sizeMapping.WaveSeparateGlobalReadA;
        int      WSGRB           = sizeMapping.WaveSeparateGlobalReadB;
        int      ULSGRO          = sizeMapping.UnrollLoopSwapGlobalReadOrder;
        uint32_t GRVWA           = sizeMapping.grvwA;
        uint32_t GRVWB           = sizeMapping.grvwB;
        uint32_t GWVWD           = sizeMapping.gwvwD;
        uint32_t waveNum         = sizeMapping.waveNum;
        int      miSize          = sizeMapping.matrixInstruction[0];
        bool     DTVA            = sizeMapping.DirectToVgprA;
        bool     DTVB            = sizeMapping.DirectToVgprB;

        //std::cout<<"DTVA         =          "<<DTVA<<std::endl;
        //std::cout<<"DTVB         =          "<<DTVB<<std::endl;
        //std::cout<<"MT0          =          "<<MT0<<std::endl;
        //std::cout<<"MT1          =          "<<MT1<<std::endl;
        //std::cout<<"GlobalSplitU =          "<<GlobalSplitU<<std::endl;
        //std::cout<<"math_clk     =          "<<math_clk<<std::endl;
        //std::cout<<"WGM          =          "<<WGM<<std::endl;
        //std::cout<<"CUOccupancy  =          "<<CUOccupancy<<std::endl;
        //std::cout<<"depthU       =          "<<depthU<<std::endl;
        //std::cout<<"PGR          =          "<<PGR<<std::endl;
        //std::cout<<"NTA          =          "<<NTA<<std::endl;
        //std::cout<<"NTB          =          "<<NTB<<std::endl;
        //std::cout<<"NTD          =          "<<NTD<<std::endl;
        //std::cout<<"WSGRA        =          "<<WSGRA<<std::endl;
        //std::cout<<"WSGRB        =          "<<WSGRB<<std::endl;
        //std::cout<<"ULSGRO       =          "<<ULSGRO<<std::endl;
        //std::cout<<"GWVWD        =          "<<GWVWD<<std::endl;
        //std::cout<<"miSize       =          "<<miSize<<std::endl;

        // double IdealGranularityPerf = closestKPerformance;

        // pp.staticModel = staticPerformanceModel(
        //     M, N, K, NumBatches, MT0, MT1, NumCUs, pp.granularities.totalGranularity, GlobalSplitU);

        // pp.speedGFlops = IdealGranularityPerf * pp.granularities.totalGranularity;
        // pp.CUs         = NumCUs;

        // test only code
        double L1CacheCapacity   = 32 * 1024; //bytes/clk
        double L1CacheLineSize   = 128; //bytes/clk
        double L2CacheLineSize   = 128;
        double L1BusWidthPerCU  = 64; //bytes/clk
        double L2BusWidthPerCU  = 128; //bytes/clk
        double L1WriteBusWidthPerCU = 64; //bytes/clk
        double L2WriteBusWidthPerCU = 64; //bytes/clk
        double maxBandWidthHBM   = 3.0; //TB/s
        double mem_frequency     = 1300; //1300;//MHz
        double hbmBandWidth      = maxBandWidthHBM * 1000000 / mem_frequency;
        double L3BandWidth       = 6.0 * 1000000 / mem_frequency;
        double math_frequency    = 1100; //1100; //MHz
        double initialCost       = 4.0; //us
        double flopsPerClk       = 2048;
        math_clk = std::max(math_clk, (double)MT0 * MT1 * 2 * depthU / flopsPerClk);

        uint32_t NumXCDs         = 8;
        uint32_t bpeA            = problem.a().elementBytes();
        uint32_t bpeB            = problem.b().elementBytes();
        uint32_t bpeD            = problem.d().elementBytes();

        if(bpeA == 1 && bpeB == 1)
        {
            // F8 cases
            flopsPerClk = 4096;
        }

        double totalOps = M * N * NumBatches * K * 2 / 1000000;

        double K_AfterGSU = CeilDivide(K, GlobalSplitU);

        int M_WGs_total = CeilDivide(M, MT0);
        int N_WGs_total = CeilDivide(N, MT1);

        int N_WGs_per_tile_XCD = std::min(WGM,N_WGs_total);
        int M_WGs_per_tile_XCD = std::min(M_WGs_total,CeilDivide(int(NumCUs/8), N_WGs_per_tile_XCD));
        int M_WGs_per_tile = std::min(M_WGs_total,CeilDivide(int(NumCUs), N_WGs_per_tile_XCD));
        int N_WGs_per_tile = std::min(N_WGs_total, N_WGs_per_tile_XCD * CeilDivide(M_WGs_per_tile, M_WGs_total));

        double A_L1_hit = 0.0;
        double B_L1_hit = 0.0;
        double A_L2_hit = 0.0;
        double B_L2_hit = 0.0;
        double A_L3_hit = 0.0;
        double B_L3_hit = 0.0;
        double best_L2_hit = 0.5;
        uint32_t loopCnt = K_AfterGSU / depthU;
        uint32_t K_loop = loopCnt * depthU;
        uint32_t K_tail = K_AfterGSU - K_loop;
        uint32_t numberWGs = M_WGs_total * N_WGs_total * NumBatches * GlobalSplitU;
        uint32_t WGs_per_tile = std::min(uint32_t(NumCUs), numberWGs);
        uint32_t WGs_per_tile_XCD = WGs_per_tile / NumXCDs;
        uint32_t num_tiles = CeilDivide(numberWGs, uint32_t(NumCUs));
        //double store = M * N * NumBatches * bpeD / maxBandWidthHBM / 1000000 / num_tiles;

        double D_L1_req = 0.0;
        double D_L2_req = 0.0;
        double D_L3_req = 0.0;
        double D_L1_edge_req, D_L2_edge_req, D_L3_edge_req;
        double total_store_req1 = calculateStoreL1Request(M, N, MT0, MT1, GWVWD, D_L1_req, D_L1_edge_req);
        double total_store_req2 = calculateStoreL2Request(M, N, MT0, MT1, GWVWD, D_L2_req, D_L2_edge_req);
        double total_store_req3 = calculateStoreL3Request(M, N, MT0, MT1, D_L3_req, D_L3_edge_req);

        // std::cout<<"store L1 non-edge= "<<D_L1_req<<std::endl;
        // std::cout<<"store L1 edge    = "<<D_L1_edge_req<<std::endl;
        // std::cout<<"store L2 non-edge= "<<D_L2_req<<std::endl;
        // std::cout<<"store L2 edge    = "<<D_L2_edge_req<<std::endl;
        // std::cout<<"store L3 non-edge= "<<D_L3_req<<std::endl;
        // std::cout<<"store L3 edge    = "<<D_L3_edge_req<<std::endl;
        // std::cout<<"store L1 request = "<<total_store_req1<<std::endl;
        // std::cout<<"store L2 request = "<<total_store_req2<<std::endl;
        // std::cout<<"store L3 request = "<<total_store_req3<<std::endl;

        double L2WriteBandWidthPerCU = 0.58 * 128 * 16 / WGs_per_tile_XCD; //58% eff
        double L2BandWidthPerCU = 0.9 * 128 * 16 / WGs_per_tile_XCD; //90% eff
        double L3BandWidthPerCU = L3BandWidth / WGs_per_tile;
        double HBMBandWidthPerCU = hbmBandWidth / WGs_per_tile;
        double D_L1_clk = D_L1_req * 64 / L1WriteBusWidthPerCU;
        double D_L2_clk = D_L2_req * 64 / std::min(L2WriteBusWidthPerCU, L2WriteBandWidthPerCU);
        double D_L3_clk = D_L3_req* 64 / L3BandWidthPerCU;
        // TODO: D_hbm_clk use D_L3_req.
        double D_hbm_clk = 0 * 64 / HBMBandWidthPerCU;
        double D_L1_clk_edge = D_L1_edge_req * 64 / L1WriteBusWidthPerCU;
        double D_L2_clk_edge = D_L2_edge_req * 64 / std::min(L2WriteBusWidthPerCU, L2WriteBandWidthPerCU);
        double D_L3_clk_edge = D_L3_edge_req * 64 / L3BandWidthPerCU;
        double D_hbm_clk_edge = 0 * 64 / HBMBandWidthPerCU;
        double D_L1_clk_total = total_store_req1 * 64 / L1WriteBusWidthPerCU;
        double D_L2_clk_total = total_store_req2 * 64 / std::min(L2WriteBusWidthPerCU, L2WriteBandWidthPerCU);
        double D_L3_clk_total = total_store_req3 * 64 / L3BandWidthPerCU;
        double D_hbm_clk_total = 0 * 64 / HBMBandWidthPerCU;

        double store_edge_overall = ((D_L1_clk_edge + D_L2_clk_edge) / math_frequency) + ((D_L3_clk_edge + D_hbm_clk_edge) / mem_frequency);
        double store_non_edge_overall = ((D_L1_clk + D_L2_clk) / math_frequency) + ((D_L3_clk + D_hbm_clk) / mem_frequency);
        double store_total = ((D_L1_clk_total + D_L2_clk_total) / math_frequency) + ((D_L3_clk_total + D_hbm_clk_total) / mem_frequency);
        // Use the max of edge/non-edge store
        double store = std::max(store_edge_overall, store_non_edge_overall);
        // Use the average store
        //double store = store_total / numberWGs;
        // std::cout<<"store_edge_overall = "<<store_edge_overall<<std::endl;
        // std::cout<<"store_non_edge_overall = "<<store_non_edge_overall<<std::endl;
        // std::cout<<"D_L1_clk = "<<D_L1_clk<<std::endl;
        // std::cout<<"D_L2_clk = "<<D_L2_clk<<std::endl;
        // std::cout<<"D_L3_clk = "<<D_L3_clk<<std::endl;
        // std::cout<<"D_hbm_clk= "<<D_hbm_clk<<std::endl;

        uint32_t gsuMethod = sizeMapping.globalAccumulation;
        double gsu_overall = 0.0;
        if(GlobalSplitU > 1) //MB
        {
            double GSU_load = (GlobalSplitU * M * N * 4 * NumBatches) / hbmBandWidth / NumCUs;
            double GSU_store = (GlobalSplitU * M * N * bpeD * NumBatches) / hbmBandWidth / NumCUs;
            gsu_overall = GSU_load + GSU_store;
        }
        else if(gsuMethod == 3 && GlobalSplitU > 1) //MBSK
        {
            // FIXME: Modify with the MBSK changes.
            // FIXME: add sync overhead.
            double atomic_overhead = GlobalSplitU * 0.15;
            double GSU_L1_req = ((GlobalSplitU - 1) * MT0 * MT1 * 4) / 64;
            double GSU_L1_clk = GSU_L1_req * 64 / L1BusWidthPerCU;
            double GSU_L2_clk = GSU_L1_req/2 * 128 / std::min(L2BandWidthPerCU, L2BusWidthPerCU);
            gsu_overall = atomic_overhead + (GlobalSplitU * store) + std::min(store_edge_overall, store_non_edge_overall);
        }
        
        // Calculate L1 hit rate, assume bpeA==bpeB, TN only
        bool isL1BypassA = (NTA >= 2);
        bool isL1BypassB = (NTB >= 2);
        if(depthU * bpeA < L1CacheLineSize)
        {
            uint32_t dataToL1A = isL1BypassA ? 0 : MT0 * L1CacheLineSize;
            uint32_t dataToL1B = isL1BypassB ? 0 : MT1 * L1CacheLineSize;
            if((dataToL1A + dataToL1B) <= L1CacheCapacity)
            {
                A_L1_hit = isL1BypassA ? 0 : (1 - (depthU * bpeA / L1CacheLineSize));
                B_L1_hit = isL1BypassB ? 0 : (1 - (depthU * bpeB / L1CacheLineSize));
            }
            else
            {
                A_L1_hit = isL1BypassA ? 0 : (1 - (depthU * bpeA / L1CacheLineSize)) * (L1CacheCapacity / (dataToL1A + dataToL1B));
                B_L1_hit = isL1BypassB ? 0 : (1 - (depthU * bpeB / L1CacheLineSize)) * (L1CacheCapacity / (dataToL1A + dataToL1B));
            }
        }

        L2CacheHitRate L2_hit_rate = computeL2CacheHitRate(M, N, K_AfterGSU, NumCUs, NumXCDs, GlobalSplitU, WGM, NumBatches, bpeA, bpeB, NTA, NTB, isGSUWGMRR);

        A_L2_hit = L2_hit_rate.tile0HitRate;
        B_L2_hit = L2_hit_rate.tile1HitRate;

        double A_L2_hit_henry = 0.0;
        double B_L2_hit_henry = 0.0;

        bool isL3BypassA = (NTA > 3) || (NTA == 1);
        if (!isL3BypassA)
        {
            if ((M * K * bpeA) + (N * K * bpeB) < 256 * 1024 * 1024)
            {
                A_L3_hit = 1 - double(1.0 / N_WGs_total);
            }
            else
            {
                A_L3_hit = 1 - double(M_WGs_per_tile / NumCUs);
            }
        }
        bool isL3BypassB = (NTB > 3) || (NTB == 1);
        if (!isL3BypassB)
        {
            if ((M * K * bpeA) + (N * K * bpeB) < 256 * 1024 * 1024)
            {
                B_L3_hit = 1 - double(1.0 / M_WGs_total);
            }
            else
            {
                B_L3_hit = 1 - double(N_WGs_per_tile / NumCUs);
            }
        }

        double tcc_ea0_coalscedA;
        double tcc_ea0_coalscedB;
        double A_L1_req = getLoadRequest(MT0, depthU, L1CacheLineSize, GRVWA, bpeA, DTVA, tcc_ea0_coalscedA);
        double B_L1_req = getLoadRequest(MT1, depthU, L1CacheLineSize, GRVWB, bpeB, DTVB, tcc_ea0_coalscedB);

        double A_L1_clk = A_L1_req * 64 / L1BusWidthPerCU;
        double A_L2_clk = A_L1_req/2 * 128 * (1 - A_L1_hit) / std::min(L2BandWidthPerCU, L2BusWidthPerCU);
        double A_L3_clk = A_L1_req/2 / tcc_ea0_coalscedA * 128 * (1 - A_L1_hit) * (1 - A_L2_hit) / L3BandWidthPerCU;
        double A_hbm_clk = A_L1_req/2 * 128 * (1 - A_L1_hit) * (1 - A_L2_hit) * (1 - A_L3_hit) / HBMBandWidthPerCU;

        double B_L1_clk = B_L1_req * 64 / L1BusWidthPerCU;
        double B_L2_clk = B_L1_req/2 * 128 * (1 - B_L1_hit) / std::min(L2BandWidthPerCU, L2BusWidthPerCU);
        double B_L3_clk = B_L1_req/2 / tcc_ea0_coalscedB * 128 * (1 - B_L1_hit) * (1 - B_L2_hit) / L3BandWidthPerCU;
        double B_hbm_clk = B_L1_req/2 * 128 * (1 - B_L1_hit) * (1 - B_L2_hit) * (1 - B_L3_hit) / HBMBandWidthPerCU;

        double L1_overall = (A_L1_clk + B_L1_clk) / math_frequency;
        double L2_overall = (A_L2_clk + B_L2_clk) / math_frequency;
        double L3_overall = (A_L3_clk + B_L3_clk) / mem_frequency;
        double hbm_overall = (A_hbm_clk + B_hbm_clk) / mem_frequency;
        double math_overall = math_clk / math_frequency;

        double L1_hit = (A_L1_hit * MT0 + B_L1_hit * MT1) / (MT0 + MT1);
        double TCP_efficiency = getTCPEfficiency(depthU, K, bpeA, L1_hit); //assume bpeA=bpeB.
        //double mem_overall = L1_overall + L2_overall + L3_overall + hbm_overall; //old method
        double mem_overall = (L1_overall * (1 - L1_hit) / TCP_efficiency) +
                             (L2_overall * 0.3) +
                             (L3_overall * (1 - L2_hit_rate.totalHitRate)) +
                             (hbm_overall * 0.1);

        double loop_overall = 0.0;
        if(PGR > 1 && loopCnt > 0)
            loop_overall = std::max(math_overall, mem_overall) * (loopCnt - 1) + (math_overall);
        else
            loop_overall = std::max(math_overall, mem_overall) * loopCnt;

        double prefetch_mem = mem_overall;
        int numAccPerWave   = MT0 * MT1 / waveNum / wavefrontSize;
        double prefetch     = getPrefetchPerformance(PGR, GRVWA, GRVWB, bpeA, bpeB, depthU, waveNum, MT0, MT1, math_frequency, prefetch_mem, numAccPerWave);
        initialCost        += prefetch;

        double perf = (initialCost + loop_overall + store);

        // tail loop
        double tail_overall = 0.0;
        if(K_tail > 0)
        {
            // FIXME: need to add GR + LR + MAC.
            tail_overall = (mem_overall + math_overall);
            perf += tail_overall;
        }

        //apply num_tiles
        if(num_tiles > 1 && CUOccupancy >= 2)
        {
            perf = (initialCost + loop_overall + tail_overall + std::max(loop_overall + tail_overall, store)) * (num_tiles - 1) + store;
        }
        else if(num_tiles > 1)
        {
            perf *= num_tiles;
        }

        // GSU reduction part
        perf += gsu_overall;

        //remove unsupported kernels.
        if(sizeMapping.workGroupMappingXCC != 8 ||
           NTA > 0 ||
           NTB > 0)
           perf = 9999999; //std::numeric_limits<double>::max();

        pp.microSeconds = perf;
        //This is debug code
        double L2_hit_henry = (A_L2_hit_henry * MT0 + B_L2_hit_henry * MT1) / (double)(MT0 + MT1);
        //std::cout<<"Henry_Name("<<kernelName<<".kd),L2CacheHitRate("<<L2_hit_henry*100<<")"<<std::endl;
        //std::cout<<"Menghung_Name("<<kernelName<<".kd),L2CacheHitRate("<<L2_hit_rate.totalHitRate*100<<")"<<std::endl;
        //std::cout<<"Kernel_Name("<<kernelName<<".kd),MathClocks("<<math_clk<<")"<<"MFMA("<<MT0 * MT1 * 2 * depthU / flopsPerClk<<")"<<std::endl;

        pp.hitRate = L2_hit_rate.totalHitRate*100; //L2_hit_rate.totalHitRate*100;
#if 0
        std::cout<<"MT0               =          "<<MT0<<std::endl;
        std::cout<<"MT1               =          "<<MT1<<std::endl;
        std::cout<<"depthU            =          "<<depthU<<std::endl;
        std::cout<<"NumCUs            =          "<<NumCUs<<std::endl;
        std::cout<<"WorkGroupMapping  =          "<<WGM<<std::endl;
        std::cout<<"CUOccupancy       =          "<<CUOccupancy<<std::endl;
        std::cout<<"loopCnt           =          "<<loopCnt<<std::endl;
        std::cout<<"flopsPerClk       =          "<<flopsPerClk<<std::endl;
        std::cout<<"Total L1_req      =          "<<(A_L1_req+B_L1_req)<<std::endl;
        std::cout<<"TCP_efficiency    =          "<<TCP_efficiency<<std::endl;
        std::cout<<"A_L1_hit          =          "<<A_L1_hit<<std::endl;
        std::cout<<"B_L1_hit          =          "<<B_L1_hit<<std::endl;
        std::cout<<"A_L2_hit          =          "<<A_L2_hit<<std::endl;
        std::cout<<"B_L2_hit          =          "<<B_L2_hit<<std::endl;
        std::cout<<"overall L2 Hit    =          "<<L2_hit_rate.totalHitRate<<std::endl;
        std::cout<<"A_L3_hit          =          "<<A_L3_hit<<std::endl;
        std::cout<<"B_L3_hit          =          "<<B_L3_hit<<std::endl;
        std::cout<<"math_clk          =          "<<math_clk<<std::endl;
        std::cout<<"L1_overall        =          "<<L1_overall<<std::endl;
        std::cout<<"L2_overall        =          "<<L2_overall<<std::endl;
        std::cout<<"L3_overall        =          "<<L3_overall<<std::endl;
        std::cout<<"hbm_overall       =          "<<hbm_overall<<std::endl;
        std::cout<<"mem_overall       =          "<<mem_overall<<std::endl;
        std::cout<<"math_overall      =          "<<math_overall<<std::endl;
        std::cout<<"tail_overall      =          "<<tail_overall<<std::endl;
        std::cout<<"M_WGs_total       =          "<<M_WGs_total<<std::endl;
        std::cout<<"N_WGs_total       =          "<<N_WGs_total<<std::endl;
        std::cout<<"K_loop            =          "<<K_loop<<std::endl;
        std::cout<<"K_tail            =          "<<K_tail<<std::endl;
        std::cout<<"loop_overall      =          "<<loop_overall<<std::endl;
        std::cout<<"initialCost       =          "<<initialCost<<std::endl;
        std::cout<<"prefetch          =          "<<prefetch<<std::endl;
        std::cout<<"store             =          "<<store<<std::endl;
        std::cout<<"gsu_overall       =          "<<gsu_overall<<std::endl;
        std::cout<<"num_tiles         =          "<<num_tiles<<std::endl;
        std::cout<<"=================="<<perf<<" us"<<std::endl;
#endif
        return pp;
    }

    ContractionSolution::ProjectedPerformance
        ContractionSolution::projectedPerformance(Problem const&  problem,
                                                  Hardware const& hardware) const
    {
        ProjectedPerformance pp;

        double M = 1.0, N = 1.0;
        if(problem.freeIndicesA().size() > 1 || sizeMapping.packBatchDims & 0x1)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesA(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                M *= problem.a().sizes()[*pi];
        }
        else
            M = problem.freeSizeA(0);

        if(problem.freeIndicesB().size() > 1 || sizeMapping.packBatchDims & 0x2)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesB(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                N *= problem.b().sizes()[*pi];
        }
        else
            N = problem.freeSizeB(0);

        double NumBatches = 1;
        if(sizeMapping.packBatchDims == 0)
        {
            for(size_t i = 0; i < problem.batchIndices().size(); i++)
                NumBatches *= problem.batchSize(i);
        }
        double K = problem.boundSize(0); // TODO - fix for multiple summations

        pp.granularities = ContractionSolution::computeGranularities(hardware, M, N, K, NumBatches);

        auto it = ideals.begin();

        int    closestKMeasure     = std::numeric_limits<int>::max();
        double closestKPerformance = 0.0;

        while(it != ideals.end())
        {
            int myK       = it->first;
            int myMeasure = std::abs(myK - K);
            if(myMeasure < closestKMeasure)
            {
                closestKMeasure     = myMeasure;
                closestKPerformance = it->second;
            }
            it++;
        }

        double MT0    = pp.granularities.MT0;
        double MT1    = pp.granularities.MT1;
        double NumCUs = pp.granularities.CUs;

        double GlobalSplitU         = pp.granularities.GSU;
        double IdealGranularityPerf = closestKPerformance;

        pp.staticModel = staticPerformanceModel(
            M, N, K, NumBatches, MT0, MT1, NumCUs, pp.granularities.totalGranularity, GlobalSplitU);

        pp.speedGFlops = IdealGranularityPerf * pp.granularities.totalGranularity;
        pp.CUs         = NumCUs;

        return pp;
    }

    ContractionSolution::L2CacheHitRate ContractionSolution::computeL2CacheHitRate(uint32_t M,
                                                                                   uint32_t N,
                                                                                   uint32_t K,
                                                                                   uint32_t NumCUs,
                                                                                   uint32_t NumXCDs,
                                                                                   uint32_t gsu,
                                                                                   int32_t  wgm,
                                                                                   uint32_t batches,
                                                                                   uint32_t bpeA,
                                                                                   uint32_t bpeB,
                                                                                   int32_t  NTA,
                                                                                   int32_t  NTB,
                                                                                   bool     isGSUWGMRR) const
    {
        ContractionSolution::L2CacheHitRate hitRate;

        uint32_t MT0 = sizeMapping.macroTile.x;
        uint32_t MT1 = sizeMapping.macroTile.y;

        uint32_t wg0 = CeilDivide(M, MT0);
        uint32_t wg1 = CeilDivide(N, MT1);

        uint32_t MT0_Edge = MT0 - ((wg0 * MT0) - M);
        uint32_t MT1_Edge = MT1 - ((wg1 * MT1) - N);
        if(MT0_Edge == 0)
            MT0_Edge = MT0;
        if(MT1_Edge == 0)
            MT1_Edge = MT1;

        //std::cout<<"wgm="<<wgm<<",wg0="<<wg0<<", wg1 = "<<wg1<<", MT0 = "<<MT0<<", MT1 = "<<MT1<<", MT0_edge = "<<MT0_Edge<<", MT1_edge = "<<MT1_Edge<<std::endl;

        // other info
        uint32_t L2CacheLineSize = 128; //Bytes
        uint32_t L2Capacity      = 4 * 1024 * 1024;   //MBs
        uint32_t depthU          = sizeMapping.depthU;
        uint32_t gsuMulBatch     = gsu * batches;

        std::vector<uint32_t> arrA(gsuMulBatch*wg0, 0);
        std::vector<uint32_t> arrB(gsuMulBatch*wg1, 0);
        std::vector<uint32_t> arrA_2(gsuMulBatch*wg0, 0);
        std::vector<uint32_t> arrB_2(gsuMulBatch*wg1, 0);

        uint32_t WGMXCC  = NumXCDs;
        uint32_t WGMXCCG = NumCUs;
        assert((WGMXCCG % WGMXCC) == 0);

        uint32_t xccIdx      = 0;
        uint32_t score       = 0;
        uint32_t totalWGNum  = gsuMulBatch * wg0 * wg1;
        uint32_t totalWG0WG1 = wg0 * wg1;
        uint32_t xccgdiv     = totalWGNum / WGMXCCG;
        uint32_t xccgres     = totalWGNum % WGMXCCG;

        // wgm list
        //std::vector<int32_t> wgmList = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}; //,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16};
        //int32_t wgm = wgmList[0];

        double hitRateA     = 0;
        double hitRateB     = 0;
        double totalHitRate = 0;
        int32_t finalwgm    = 0;

        double aRatio   = float(MT0) / float(MT0 + MT1);
        double bRatio   = float(MT1) / float(MT0 + MT1);

        uint64_t aHitElements  = 0;
        uint64_t aMissElements = 0;
        uint64_t bHitElements  = 0;
        uint64_t bMissElements = 0;

        bool isL2BypassA = (NTA & 0x6) > 0;
        bool isL2BypassB = (NTB & 0x6) > 0;

        //std::cout<<"GSU="<<gsu<<", batch="<<batches<<", isL2BypassA = "<<isL2BypassA<<", isL2BypassB = "<<isL2BypassB<<std::endl;

        uint32_t hitA    = 0;
        uint32_t hitB    = 0;
        uint32_t missA   = 0;
        uint32_t missB   = 0;

        for(uint32_t wg = 0; wg < totalWGNum; wg++)
        {
            //clean cache
            if((wg % WGMXCCG) == 0)
            {
                //loop every XCDs
                for(uint32_t xcd = 0; xcd < NumXCDs && wg > 0; xcd++)
                {
                    uint32_t MT0_A = 0;
                    for(uint32_t g = 0; g < gsuMulBatch; g++)
                    {
                        for(uint32_t i = 0; i < wg0; i++)
                        {
                            if(arrA[g*wg0 + i] & (1<<xcd))
                            {
                                if(i == (wg0 - 1)) //Edge
                                    MT0_A += (MT0_Edge * (K/gsu)) * bpeA;
                                else
                                    MT0_A += (MT0 * (K/gsu)) * bpeA;
                            }
                        }
                    }

                    uint32_t MT1_B = 0;
                    for(uint32_t g = 0; g < gsuMulBatch; g++)
                    {
                        for(uint32_t i = 0; i < wg1; i++)
                        {
                            if(arrB[g*wg1 + i] & (1<<xcd))
                            {
                                if(i == (wg1 - 1)) //Edge
                                    MT1_B += (MT1_Edge * (K/gsu)) * bpeB;
                                else
                                    MT1_B += (MT1 * (K/gsu)) * bpeB;
                                //std::cout<<"i,g,MT1_B:"<<i<<","<<g<<","<<MT1_B<<std::endl;
                            }
                        }
                    }
                    //std::cout<<"XCD:"<<xcd<<", next round("<<wg<<"): L2Capacity="<<L2Capacity<<", A:"<<MT0_A<<", B:"<<MT1_B<<std::endl;
                    if(MT0_A + MT1_B <= L2Capacity)
                    {
                        //keep in cache
                        //std::cout<<"keep in cache"<<std::endl;
                        for(uint32_t g = 0; g < gsuMulBatch; g++)
                            for(uint32_t i = 0; i < wg0; i++)
                                arrA_2[g*wg0 + i] |= arrA[g*wg0 + i] & (1<<xcd);
                        for(uint32_t g = 0; g < gsuMulBatch; g++)
                            for(uint32_t i = 0; i < wg1; i++)
                                arrB_2[g*wg1 + i] |= arrB[g*wg1 + i] & (1<<xcd);
                    }
                    else
                    {
                        //clean cache
                        //std::cout<<"clean cache"<<std::endl;
                        arrA_2.assign(wg0*gsuMulBatch, 0);
                        arrB_2.assign(wg1*gsuMulBatch, 0);
                    }
                }

                arrA.assign(wg0*gsuMulBatch, 0);
                arrB.assign(wg1*gsuMulBatch, 0);
            }

            // go xccgroup
            //std::cout<<"go xccgroup";
            uint32_t xccgIdx  = wg / WGMXCCG;
            uint32_t realWGId = xccgIdx * WGMXCCG;

            // get xccgroup wgNum
            //std::cout<<"get xccgroup wgNum";
            uint32_t xccgWgNum = min(WGMXCCG, totalWGNum - realWGId);
            // how many wg per xcc in this xccgroup
            uint32_t xccunit = xccgWgNum / WGMXCC;
            uint32_t xccres  = xccgWgNum % WGMXCC;
            // starting wgId
            uint32_t resWGId = (wg - realWGId) % xccgWgNum;

            // go xcc
            //std::cout<<"go xcc";
            uint32_t xccIdx = resWGId % WGMXCC;
            // skip previous xcc
            uint32_t skip = 0;
            for(int i = 0; i < xccIdx; i++)
            {
                // skip i
                skip += xccunit;
                if (i < xccres)
                {
                    // this xcc has extra 1 wg
                    skip += 1;
                }
            }
            realWGId += skip;

            // go inner xccid
            // in XCCN, we get the idx of the wg in XCCN.
            uint32_t innerXccId = resWGId / WGMXCC;
            realWGId           += innerXccId;

            int32_t sgprWGM            = wgm;
            uint32_t sgprNumWorkGroups0 = wg0;
            uint32_t sgprNumWorkGroups1 = wg1;
            uint32_t wg2                = realWGId / (sgprNumWorkGroups0 * sgprNumWorkGroups1 * gsu); //batch
            uint32_t idxWG01            = realWGId - (wg2 * sgprNumWorkGroups0 * sgprNumWorkGroups1 * gsu);
            uint32_t sgprWorkGroup1     = idxWG01 / wg0;
            uint32_t sgprWorkGroup0     = idxWG01 - (sgprWorkGroup1 * wg0);

            //go GSUWGMRR
            //std::cout<<"realWGId = "<<realWGId<<" , sgprWorkGroup0 = "<<sgprWorkGroup0<<" , sgprWorkGroup1 = "<<sgprWorkGroup1<<std::endl;
            uint32_t gsuSumIdx = 0;
            if(isGSUWGMRR)
            {
                gsuSumIdx      = sgprWorkGroup1 / sgprNumWorkGroups1;
                sgprWorkGroup1 = sgprWorkGroup1 % sgprNumWorkGroups1;
            }
            else
            {
                gsuSumIdx      = sgprWorkGroup1 % gsu;
                sgprWorkGroup1 = sgprWorkGroup1 / gsu;
            }
            //std::cout<<"gsuSumIdx = "<<gsuSumIdx<<" , sgprWorkGroup0 = "<<sgprWorkGroup0<<" , sgprWorkGroup1 = "<<sgprWorkGroup1<<std::endl;
            uint32_t finalwg1, finalwg0;
            if(wgm > 0)
            {
                uint32_t v6 = sgprWorkGroup1 / sgprWGM;
                uint32_t s84 = v6 * sgprWGM;
                s84 = sgprWorkGroup1 - s84;
                s84 *= sgprNumWorkGroups0;
                s84 += sgprWorkGroup0;
                uint32_t s81 = v6;

                v6 = sgprNumWorkGroups1 / sgprWGM;
                uint32_t s82 = v6;
                uint32_t s83 = sgprWGM * s82;
                s83 = sgprNumWorkGroups1 - s83;
                if(s83 == 0)
                    s83 = sgprWGM;
                if(s81 >= s82)
                    s82 = s83;
                else
                    s82 = sgprWGM;

                v6 = s84 / s82;
                uint32_t v7 = v6 * s82;
                v7 = s84 - v7;
                sgprWorkGroup0 = v6;
                sgprWorkGroup1 = v7;
                sgprWorkGroup1 = sgprWorkGroup0 * s82;
                sgprWorkGroup1 = s84 - sgprWorkGroup1;
                s81 *= sgprWGM;
                sgprWorkGroup1 += s81;

                finalwg1    = sgprWorkGroup1;
                finalwg0    = sgprWorkGroup0;
            }
            else
            {
                sgprWGM = 0 - sgprWGM;

                uint32_t v12 = sgprWorkGroup0 / sgprWGM;
                uint32_t s85 = v12;

                uint32_t s88 = s85 * sgprWGM;
                s88 = sgprWorkGroup0 - s88;
                s88 *= sgprNumWorkGroups1;
                s88 += sgprWorkGroup1;

                v12 = sgprNumWorkGroups0 / sgprWGM;
                uint32_t s86 = v12;
                uint32_t s87 = sgprWGM * s86;
                s87 = sgprNumWorkGroups0 - s87;
                if(s87 == 0)
                    s87 = sgprWGM;
                if(s85 >= s86)
                    s86 = s87;
                else
                    s86 = sgprWGM;

                v12 = s88 / s86;
                uint32_t v13 = v12 * s86;
                v13 = s88 - v13;

                sgprWorkGroup1 = v12;
                sgprWorkGroup0 = v13;
                sgprWorkGroup0 = sgprWorkGroup1 * s86;
                sgprWorkGroup0 = s88 - sgprWorkGroup0;
                s85 *= sgprWGM;
                sgprWorkGroup0 += s85;

                finalwg0    = sgprWorkGroup0;
                finalwg1    = sgprWorkGroup1;
            }
            //std::cout<<"xccIdx = "<<xccIdx<<" ,batch, gsuSumIdx, finalwg0, finalwg1 = "<<wg2<<","<<gsuSumIdx<<","<<finalwg0<<","<<finalwg1<<std::endl;
            uint32_t idxA = (wg2*gsu+gsuSumIdx)*wg0 + finalwg0;
            if(isL2BypassA)
            {
                missA++;
                if(finalwg0 == wg0 - 1) //Edge
                    aMissElements += (MT0_Edge * depthU);
                else
                    aMissElements += (MT0 * depthU);
            }
            else if((arrA[idxA] & (1<<xccIdx)) || (arrA_2[idxA] & (1<<xccIdx)))
            {
                hitA++;
                if(finalwg0 == (wg0 - 1)) //Edge
                    aHitElements += (MT0_Edge * depthU);
                else
                    aHitElements += (MT0 * depthU);
                //std::cout<<"hitA "<<aHitElements<<std::endl;
                arrA[idxA] |= (1<<xccIdx);
            }
            else
            {
                missA++;
                if(finalwg0 == wg0 - 1) //Edge
                    aMissElements += (MT0_Edge * depthU);
                else
                    aMissElements += (MT0 * depthU);
                //std::cout<<"missA "<<aMissElements<<std::endl;
                arrA[idxA] |= (1<<xccIdx);
            }
            uint32_t idxB = (wg2*gsu+gsuSumIdx)*wg1+finalwg1;
            if(isL2BypassB)
            {
                missB++;
                if(finalwg1 == (wg1 - 1)) //Edge
                    bMissElements += (MT1_Edge * depthU);
                else
                    bMissElements += (MT1 * depthU);
            }
            else if((arrB[idxB] & (1<<xccIdx)) || (arrB_2[idxB] & (1<<xccIdx)))
            {
                hitB++;
                if(finalwg1 == (wg1 - 1)) //Edge
                    bHitElements += (MT1_Edge * depthU);
                else
                    bHitElements += (MT1 * depthU);
                //std::cout<<"hitB"<<std::endl;
                arrB[idxB] |= (1<<xccIdx);
            }
            else
            {
                missB++;
                if(finalwg1 == (wg1 - 1)) //Edge
                    bMissElements += (MT1_Edge * depthU);
                else
                    bMissElements += (MT1 * depthU);
                //std::cout<<"missB"<<std::endl;
                arrB[idxB] |= (1<<xccIdx);
            }
        }

        double hitRateA_old = float(hitA) / float(hitA + missA);
        double hitRateB_old = float(hitB) / float(hitB + missB);
        double totalHitRate_old = double(aRatio * hitRateA_old) + double(bRatio * hitRateB_old);

        if(aHitElements > 0)
            hitRateA = double(aHitElements) / double(aHitElements + aMissElements);
        if(bHitElements > 0)
            hitRateB = double(bHitElements) / double(bHitElements + bMissElements);
        if(aHitElements + bHitElements > 0)
            totalHitRate = double(aHitElements + bHitElements) / double(aHitElements + aMissElements + bHitElements + bMissElements);

        //std::cout<<"Old HR is "<<hitRateA_old<<","<<hitRateB_old<<","<<totalHitRate_old<<std::endl;
        //std::cout<<"New HR is "<<hitRateA<<","<<hitRateB<<","<<totalHitRate<<std::endl;
        //std::cout<<"A Hit is "<<aHitElements<<", miss is"<<aMissElements<<std::endl;
        //std::cout<<"B Hit is "<<bHitElements<<", miss is"<<bMissElements<<std::endl;
        hitRate.totalHitRate = totalHitRate;
        hitRate.tile0HitRate = hitRateA;
        hitRate.tile1HitRate = hitRateB;

        return hitRate;
    }

    ContractionSolution::TAMetricProblemScore ContractionSolution::computeProblemScore(
        Hardware const& hardware, double M, double N, double K, double NumBatches) const
    {
        ContractionSolution::TAMetricProblemScore pp;
        pp.granularites = ContractionSolution::computeGranularities(hardware, M, N, K, NumBatches);

        pp.M = M;
        pp.N = N;
        pp.K = K;

        double slope     = linearModel.slope;
        double intercept = linearModel.intercept;
        double perf_max  = linearModel.max;

        double sum_value        = K;
        double sum_perf0        = sum_value / (intercept + (slope * sum_value));
        pp.summationPerformance = 1000.0 * sum_perf0 / perf_max;

        return pp;
    }

    double ContractionSolution::computeTileAwareMetric(
        ContractionSolution::TAMetricProblemScore pp,
        ContractionSolution::TAMetricProblemScore ppReference) const
    {
        double tile0GranularityDim = abs(log(ppReference.granularites.tile0Granularity)
                                         - log(pp.granularites.tile0Granularity));
        double metric              = tile0GranularityDim;

        double tile1GranularityDim = abs(log(ppReference.granularites.tile1Granularity)
                                         - log(pp.granularites.tile1Granularity));
        metric += tile1GranularityDim;

        double natCuGranularityDim = abs(log(ppReference.granularites.natCuGranularity)
                                         - log(pp.granularites.natCuGranularity));
        metric += natCuGranularityDim;

        double suCuGranularityDim = abs(log(ppReference.granularites.suCuGranularity)
                                        - log(pp.granularites.suCuGranularity));
        metric += suCuGranularityDim;

        double suWaveGranularityDim = abs(log(ppReference.granularites.suWaveGranularity)
                                          - log(pp.granularites.suWaveGranularity));
        metric += suWaveGranularityDim;

        double natTilesPerCuDim
            = abs(log(ppReference.granularites.natTilesPerCu) - log(pp.granularites.natTilesPerCu));
        metric += natTilesPerCuDim;

        double suTilesPerCuDim
            = abs(log(ppReference.granularites.suTilesPerCu) - log(pp.granularites.suTilesPerCu));
        metric += suTilesPerCuDim;

        double summationPerformanceDim
            = abs(ppReference.summationPerformance - pp.summationPerformance);
        metric += summationPerformanceDim;

        return metric;
    }

    double ContractionSolution::computeTAMScore(Problem const&  problem,
                                                Hardware const& hardware,
                                                double          model_M,
                                                double          model_N,
                                                double          model_K,
                                                double          model_NumBatches) const
    {
        double M = 1.0, N = 1.0;
        if(problem.freeIndicesA().size() > 1 || sizeMapping.packBatchDims & 0x1)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesA(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                M *= problem.a().sizes()[*pi];
        }
        else
            M = problem.freeSizeA(0);

        if(problem.freeIndicesB().size() > 1 || sizeMapping.packBatchDims & 0x2)
        {
            std::vector<size_t> packedIndices
                = generatePackedIndicesB(problem, sizeMapping.packBatchDims);
            for(auto pi = packedIndices.begin(); pi != packedIndices.end(); pi++)
                N *= problem.b().sizes()[*pi];
        }
        else
            N = problem.freeSizeB(0);

        double NumBatches = 1;
        if(sizeMapping.packBatchDims == 0)
        {
            for(size_t i = 0; i < problem.batchIndices().size(); i++)
                NumBatches *= problem.batchSize(i);
        }
        double K = problem.boundSize(0); // TODO - fix for multiple summations

        ContractionSolution::TAMetricProblemScore pp
            = computeProblemScore(hardware, M, N, K, NumBatches);

        ContractionSolution::TAMetricProblemScore ppReference
            = computeProblemScore(hardware, model_M, model_N, model_K, model_NumBatches);

        double distance = computeTileAwareMetric(pp, ppReference);

        return distance;
    }

    std::ostream& operator<<(std::ostream&                                      stream,
                             ContractionSolution::StaticPerformanceModel const& spm)
    {
        return stream << " memReadBytesA=" << spm.memReadBytesA
                      << " memReadBytesB=" << spm.memReadBytesB
                      << " memReadBytesC=" << spm.memReadBytesC
                      << " memWriteBytesD=" << spm.memWriteBytesD;
    }

    std::ostream& operator<<(std::ostream&                                    stream,
                             ContractionSolution::ProjectedPerformance const& pp)
    {
        return stream << " numTiles0=" << pp.granularities.numTiles0
                      << " numTiles1=" << pp.granularities.numTiles1
                      << " tilesPerCu=" << pp.granularities.tilesPerCu

                      << " totalGranularity=" << pp.granularities.totalGranularity
                      << " tile0Granularity=" << pp.granularities.tile0Granularity
                      << " tile1Granularity=" << pp.granularities.tile1Granularity
                      << " cuGranularity=" << pp.granularities.cuGranularity
                      << " waveGranularity=" << pp.granularities.waveGranularity

                      << " speedGFlops=" << pp.speedGFlops
                      << " microSeconds=" << pp.microSeconds

                      << " staticModel=[ " << pp.staticModel << " ]";
    }

    std::ostream& operator<<(std::ostream& stream, BufferLoadCheckPacket const& st)
    {
        return stream << " shiftPtrElemA=" << st.shiftPtrElemA
                      << " shiftPtrElemB=" << st.shiftPtrElemB << " depthUorMT0=" << st.depthUorMT0
                      << " depthUorMT1=" << st.depthUorMT1;
    }
} // namespace TensileLite
