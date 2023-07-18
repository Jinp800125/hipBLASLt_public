
/******************************************/
/* Begin Kernel                           */
/******************************************/
.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
.text
.protected Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0
.globl Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0
.p2align 8
.type Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0,@function
.section .rodata,#alloc
.p2align 6
.amdhsa_kernel Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0
  .amdhsa_user_sgpr_kernarg_segment_ptr 1
  .amdhsa_accum_offset 128 // accvgpr offset
  .amdhsa_next_free_vgpr 132 // vgprs
  .amdhsa_next_free_sgpr 96 // sgprs
  .amdhsa_group_segment_fixed_size 14592 // lds bytes
  .amdhsa_private_segment_fixed_size 0
  .amdhsa_system_sgpr_workgroup_id_x 1
  .amdhsa_system_sgpr_workgroup_id_y 1
  .amdhsa_system_sgpr_workgroup_id_z 1
  .amdhsa_system_vgpr_workitem_id 0
  .amdhsa_float_denorm_mode_32 3
  .amdhsa_float_denorm_mode_16_64 3
.end_amdhsa_kernel
.text
/* Num VGPR   =124 */
/* Num AccVGPR=4 */
/* Num SGPR   =96 */

/******************************************/
/* Optimizations and Config:              */
/******************************************/
/* ThreadTile= 4 x 1 */
/* SubGroup= 4 x 32 */
/* VectorWidth=2 */
/* GlobalLoadVectorWidthA=2, GlobalLoadVectorWidthB=2 */
/* DirectToLdsA=False */
/* DirectToLdsB=False */
/* UseSgprForGRO=1 */
.amdgpu_metadata
---
amdhsa.version:
  - 1
  - 0
amdhsa.kernels:
  - .name: Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0
    .symbol: 'Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0.kd'
    .language:                   OpenCL C
    .language_version:
      - 2
      - 0
    .args:
      - .name:            D
        .size:            8
        .offset:          0
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            C
        .size:            8
        .offset:          8
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            A
        .size:            8
        .offset:          16
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            B
        .size:            8
        .offset:          24
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            alpha
        .size:            4
        .offset:          32
        .value_kind:      by_value
        .value_type:      f32
      - .name:            beta
        .size:            4
        .offset:          36
        .value_kind:      by_value
        .value_type:      f32
      - .name:            AddressScaleDVec
        .size:            8
        .offset:          40
        .value_kind:      global_buffer
        .value_type:      f32
        .address_space:   generic
      - .name:            strideD0
        .size:            4
        .offset:          48
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideD1
        .size:            4
        .offset:          52
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC0
        .size:            4
        .offset:          56
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC1
        .size:            4
        .offset:          60
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA0
        .size:            4
        .offset:          64
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA1
        .size:            4
        .offset:          68
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB0
        .size:            4
        .offset:          72
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB1
        .size:            4
        .offset:          76
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree0
        .size:            4
        .offset:          80
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree1
        .size:            4
        .offset:          84
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree2
        .size:            4
        .offset:          88
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesSum0
        .size:            4
        .offset:          92
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OrigStaggerUIter
        .size:            4
        .offset:          96
        .value_kind:      by_value
        .value_type:      i32
      - .name:            NumWorkGroups0
        .size:            4
        .offset:          100
        .value_kind:      by_value
        .value_type:      u32
      - .name:            NumWorkGroups1
        .size:            4
        .offset:          104
        .value_kind:      by_value
        .value_type:      u32
      - .name:            GSUSync
        .size:            4
        .offset:          108
        .value_kind:      by_value
        .value_type:      u32
      - .name:            CT
        .size:            8
        .offset:          112
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            padding
        .size:            4
        .offset:          120
        .value_kind:      by_value
        .value_type:      u32
      - .name:            bias
        .size:            8
        .offset:          124
        .value_kind:      global_buffer
        .value_type:      void
        .address_space:   generic
      - .name:            biasType
        .size:            4
        .offset:          132
        .value_kind:      by_value
        .value_type:      u32
      - .name:            activationAlpha
        .size:            4
        .offset:          136
        .value_kind:      by_value
        .value_type:      f32
      - .name:            activationBeta
        .size:            4
        .offset:          140
        .value_kind:      by_value
        .value_type:      f32
      - .name:            activationType
        .size:            4
        .offset:          144
        .value_kind:      by_value
        .value_type:      u32
    .group_segment_fixed_size:   14592
    .kernarg_segment_align:      8
    .kernarg_segment_size:       152
    .max_flat_workgroup_size:    128
    .private_segment_fixed_size: 0
    .sgpr_count:                 96
    .sgpr_spill_count:           0
    .vgpr_count:                 124
    .vgpr_spill_count:           0
    .wavefront_size:             64
...
.end_amdgpu_metadata
Custom_Cijk_Ailk_Bljk_HHS_BH_Bias_AH_SDV_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPA0_LPB4_LRVW4_MIWT1_1_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM0:

/* Magic div and mod functions */
.macro V_MAGIC_DIV dstIdx:req dividend:req magicNumber:req magicShift:req magicA:req
    v_mul_hi_u32 v[\dstIdx+1] \dividend \magicNumber
    v_mul_lo_u32 v[\dstIdx+0] \dividend \magicA
    v_add_u32 v[\dstIdx+0] v[\dstIdx+0] v[\dstIdx+1]
    v_lshrrev_b32 v[\dstIdx+0] \magicShift v[\dstIdx+0]
.endm

/******************************************/
/* VGPR Assignments                       */
/******************************************/
/* ValuC range: [0-0), serializedStore enabled */
.set vgprValuC, 0
/* ValuA/B   Xn=PLR buffer idx,  In=InnerUnroll idx */
.set vgprValuA_X0_I0, 0
.set vgprValuA_X1_I0, 2
.set vgprValuA_X2_I0, 4
.set vgprValuA_X3_I0, 6
.set vgprG2LA, 20
.set vgprValuB_X0_I0, 8
.set vgprValuB_X1_I0, 10
.set vgprValuB_X2_I0, 12
.set vgprValuB_X3_I0, 14
.set vgprG2LB, 24
.set vgprLocalWriteAddrA, 16
.set vgprLocalWriteAddrB, 17
.set vgprGlobalReadOffsetA, 18
.set vgprGlobalReadOffsetB, 19
.set vgprLocalReadAddrA, 32
.set vgprLocalReadAddrB, 33
.set vgprSerial, 34

/******************************************/
/* SGPR Assignments                       */
/******************************************/
.set sgprKernArgAddress, 0
.set sgprWorkGroup0, 2
.set sgprWorkGroup1, 3
.set sgprWorkGroup2, 4
.set sgprGSUSumIdx, 5
.set sgprLoopCounterL, 7
.set sgprOrigLoopCounter, 8
.set sgprSrdD, 12
.set sgprSrdC, 16
.set sgprSrdScaleDVec, 20
.set sgprAddressD, 24
.set sgprAddressC, 26
.set sgprAddressA, 28
.set sgprAddressB, 30
.set sgprAlpha, 32
.set sgprBeta, 33
.set sgprAddressScaleDVec, 34
.set sgprStridesD, 36
.set sgprStridesC, 38
.set sgprStridesA, 40
.set sgprStridesB, 42
.set sgprSizesFree, 44
.set sgprSizesSum, 47
.set sgprOrigStaggerUIter, 48
.set sgprNumWorkGroups0, 49
.set sgprNumWorkGroups1, 50
.set sgprGSUSync, 51
.set sgprAddressTC, 52
.set sgprSrdA, 56
.set sgprSrdB, 60
.set sgprShadowLimitA, 10
.set sgprShadowLimitB, 54
.set sgprGlobalReadIncsA, 9
.set sgprGlobalReadIncsB, 48
.set sgprScalarGlobalReadOffsetA, 64
.set sgprScalarGlobalReadOffsetB, 67

//GSUFusion
.set sgprtmp0E, 80
.set sgprtmp1E, sgprtmp0E+1
.set sgprtmp2E, sgprtmp0E+2
.set sgprtmp3E, sgprtmp0E+3
.set sgprtmp4E, sgprtmp0E+4
.set sgprtmp5E, sgprtmp0E+5
.set sgprtmp6E, sgprtmp0E+6
.set sgprtmp7E, sgprtmp0E+7
.set sgprSrdDd, sgprtmp0E+8
.set sgprSrdtmp, sgprSrdDd+4 //sgprtmp0E+12(+4)
//GSUFusion

/* Size Assignments */
.set sgprSizeI, sgprSizesFree+0
.set sgprSizeJ, sgprSizesFree+1
.set sgprSizeK, sgprSizesFree+2
.set sgprSizeL, sgprSizesSum+0

/* Stride Assignments */
.set constStrideD0I, 1
.set sgprStrideD1J, sgprStridesD+0
.set sgprStrideDK, sgprStridesD+1
.set constStrideC0I, 1
.set sgprStrideC1J, sgprStridesC+0
.set sgprStrideCK, sgprStridesC+1
.set constStrideA0I, 1
.set sgprStrideAL, sgprStridesA+0
.set sgprStrideAK, sgprStridesA+1
.set constStrideBL, 1
.set sgprStrideB1J, sgprStridesB+0
.set sgprStrideBK, sgprStridesB+1

.set MT0, 16
.set MT1, 32
.set DepthU, 64
.set GSU, 5
.set BpeA, 2
.set BpeALog2, 1
.set BpeB, 2
.set BpeBLog2, 1
/* Number of elements to shift-left SRD */
.set SrdShiftLeftA, 2
.set SrdShiftLeftB, 2
/* 2GB limit - set offsets to -1 to exceed this and clamp */
.set BufferLimit, 0xffffffff
.set BufferOOB, 0x80000000

/******************************************/
/* Bits 127:96 of SRD.                    */
/* hex: 0x00020000                        */
/* dst_sel_x (3b): 0                      */
/* dst_sel_y (3b): 0                      */
/* dst_sel_z (3b): 0                      */
/* dst_sel_w (3b): 0                      */
/* num_format (3b): 0                     */
/* data_format (4b): 4                    */
/* user_vm_enable (1b): 0                 */
/* user_vm_mode (1b): 0                   */
/* index_stride (2b): 0                   */
/* add_tid_enable (1b): 0                 */
/* _unusedA (3b): 0                       */
/* nv (1b): 0                             */
/* _unusedB (2b): 0                       */
/* type (2b): 0                           */
/******************************************/
.set Srd127_96, 0x00020000

.macro GSUSYNC labelname labelendname vgprstart vgprstart2 vgproffset
    //Victor
    \labelname:
    s_mov_b32 s[sgprGSUSync], 0
    s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c glc
    s_waitcnt 0
    s_cmp_ge_u32 s[sgprGSUSync], MT1/MT0                    // Beta == 0
    s_cbranch_scc0 \labelname           // jump if XX required

    s_mov_b32 s[sgprGSUSync] 1

    s_mov_b32 s[sgprtmp0E], s[sgprGSUSumIdx]
    s_lshl_b32 s[sgprtmp0E], s[sgprtmp0E], 2

    s_mul_hi_u32 s[sgprtmp3E], s[sgprStrideCK], GSU            // ScaleC s62 by Stride
    s_mul_i32 s[sgprtmp2E], s[sgprStrideCK], GSU               // ScaleC s62 by Stride
    s_lshl_b64 s[sgprtmp2E:sgprtmp2E+1], s[sgprtmp2E:sgprtmp2E+1], 2                   // scale by bpe

    s_mov_b32 s[sgprSrdDd+2], 0x80000000
    s_mov_b32 s[sgprSrdDd+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

    s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp2E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp3E]   // add hi to SRD

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], 0   // add hi to SRD

    s_buffer_atomic_add s[sgprGSUSync], s[sgprSrdDd:sgprSrdDd+3], offset:0 glc
    s_waitcnt 0

    s_cmp_ge_u32 s[sgprGSUSync], GSU*MT1/MT0-1                // s[Alpha] == 0.0f ?
    s_cbranch_scc0 \labelendname //label_GW_End_1 //label_AFTERsummary_Edge
    //Victor

    //GSUFusion

    s_mov_b32 s[sgprGSUSumIdx] 1
    s_mul_i32 s[sgprtmp2E], MT1, s[sgprWorkGroup1]              // <- wg1*MT1
    s_mul_hi_u32 s[sgprtmp1E], s[sgprtmp2E], s[sgprStrideD1J]            // ScaleD s64 by Stride
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprStrideD1J]               // ScaleD s64 by Stride
    s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
    s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp0E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp1E]   // add hi to SRD

    s_mul_hi_u32 s[sgprtmp1E], s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
    s_mul_i32 s[sgprtmp0E], s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
    s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi to SRD

    // GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
    s_mul_hi_u32 s[sgprtmp1E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp0E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
    s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+1], 1               // Free1
    s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free1
    s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideC1J]            // Free1
    s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideC1J]               // Free1
    s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free1
    s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free1
    s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+2], 1               // Free2
    s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free2
    s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideCK]             // Free2
    s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideCK]                // Free2
    s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free2
    s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free2
    s_lshl_b64 s[sgprtmp2E:sgprtmp3E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe

    buffer_load_dwordx4 v[\vgprstart+4*0:\vgprstart+3+4*0], \vgproffset, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_mov_b32 s[sgprGSUSumIdx] 1
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*1:\vgprstart+3+4*1], \vgproffset, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*2:\vgprstart+3+4*2], \vgproffset, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*3:\vgprstart+3+4*3], \vgproffset, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*4:\vgprstart+3+4*4], \vgproffset, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_waitcnt vmcnt(3)

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*1+0:\vgprstart+4*1+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*1+2:\vgprstart+4*1+3]

    s_waitcnt vmcnt(2)

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*2+0:\vgprstart+4*2+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*2+2:\vgprstart+4*2+3]

    s_waitcnt vmcnt(1)

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*3+0:\vgprstart+4*3+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*3+2:\vgprstart+4*3+3]

    s_waitcnt vmcnt(0)

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*4+0:\vgprstart+4*4+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*4+2:\vgprstart+4*4+3]

    v_mov_b32 v[\vgprstart2+0], v[\vgprstart+0]
    v_mov_b32 v[\vgprstart2+1], v[\vgprstart+1]
    v_mov_b32 v[\vgprstart+0], v[\vgprstart+2]
    v_mov_b32 v[\vgprstart+1], v[\vgprstart+3]

.endm

.macro GSUSYNC2 vgprstart vgprstart2 vgproffset

    v_mov_b32 v[\vgprstart+2], v[\vgprstart+0]
    v_mov_b32 v[\vgprstart+3], v[\vgprstart+1]
    v_mov_b32 v[\vgprstart+0], v[\vgprstart2+0]
    v_mov_b32 v[\vgprstart+1], v[\vgprstart2+1]

    V_LSHRREV_B32 \vgproffset, 0x1, \vgproffset

    s_mov_b32 s[sgprSrdD+2], 0x80000000
    s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

    s_mul_i32 s62, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
    s_mul_hi_u32 s61, s62, s[sgprStrideC1J]            // ScaleC s62 by Stride
    s_mul_i32 s60, s62, s[sgprStrideC1J]               // ScaleC s62 by Stride
    s_lshl_b64 s[60:61], s[60:61], 1                   // scale by bpe
    s_add_u32 s[sgprSrdD+0], s[sgprAddressTC+0], s60    // add lo to SRD
    s_addc_u32 s[sgprSrdD+1], s[sgprAddressTC+1], s61   // add hi to SRD

    v_cvt_f16_f32 v[\vgprstart+0], v[\vgprstart+0]
    v_cvt_f16_f32 v[\vgprstart+1], v[\vgprstart+1]
    v_cvt_f16_f32 v[\vgprstart+2], v[\vgprstart+2]
    v_cvt_f16_f32 v[\vgprstart+3], v[\vgprstart+3]

    v_pack_b32_f16 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+1]
    v_pack_b32_f16 v[\vgprstart+1], v[\vgprstart+2], v[\vgprstart+3]

    //v_cvt_pkrtz_f16_f32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+1]
    //v_cvt_pkrtz_f16_f32 v[\vgprstart+1], v[\vgprstart+2], v[\vgprstart+3]

    buffer_store_dwordx2 v[\vgprstart:\vgprstart+1], \vgproffset, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    //GSUFusion

.endm

.macro GSUSYNC_2 labelname labelendname vgprstart1 vgprstart2 vgprAddrOffset1 vgprAddrOffset2
    //Victor
    //label_BUSYWAIT1_Edge:
    \labelname:
    s_mov_b32 s[sgprGSUSync], 0
    s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c glc
    s_waitcnt 0
    s_cmp_ge_u32 s[sgprGSUSync], MT1/MT0                    // Beta == 0
    //s_cbranch_scc0 label_BUSYWAIT1_Edge           // jump if XX required
    s_cbranch_scc0 \labelname           // jump if XX required

    s_mov_b32 s[sgprGSUSync] 1

    s_mov_b32 s[sgprtmp0E], s[sgprGSUSumIdx]
    s_lshl_b32 s[sgprtmp0E], s[sgprtmp0E], 2

    s_mul_hi_u32 s[sgprtmp3E], s[sgprStrideCK], GSU            // ScaleC s62 by Stride
    s_mul_i32 s[sgprtmp2E], s[sgprStrideCK], GSU               // ScaleC s62 by Stride
    s_lshl_b64 s[sgprtmp2E:sgprtmp2E+1], s[sgprtmp2E:sgprtmp2E+1], 2                   // scale by bpe

    s_mov_b32 s[sgprSrdDd+2], 0x80000000
    s_mov_b32 s[sgprSrdDd+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

    s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp2E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp3E]   // add hi to SRD

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], 0   // add hi to SRD

    s_buffer_atomic_add s[sgprGSUSync], s[sgprSrdDd:sgprSrdDd+3], offset:0 glc
    s_waitcnt 0

    s_cmp_ge_u32 s[sgprGSUSync], GSU*MT1/MT0-1                // s[Alpha] == 0.0f ?
    s_cbranch_scc0 \labelendname //label_GW_End_1 //label_AFTERsummary_Edge
    //Victor

    //GSUFusion

    s_mov_b32 s[sgprGSUSumIdx] 1
    s_mul_i32 s[sgprtmp2E], MT1, s[sgprWorkGroup1]              // <- wg1*MT1
    s_mul_hi_u32 s[sgprtmp1E], s[sgprtmp2E], s[sgprStrideD1J]            // ScaleD s64 by Stride
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprStrideD1J]               // ScaleD s64 by Stride
    s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
    s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp0E]    // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp1E]   // add hi to SRD

    s_mul_hi_u32 s[sgprtmp1E], s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
    s_mul_i32 s[sgprtmp0E], s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
    s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi to SRD

    s_mov_b32 s[sgprSrdD+0], s[sgprSrdDd+0]
    s_mov_b32 s[sgprSrdD+1], s[sgprSrdDd+1]

    // GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
    s_mul_hi_u32 s[sgprtmp1E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp0E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
    s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+1], 1               // Free1
    s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free1
    s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideC1J]            // Free1
    s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideC1J]               // Free1
    s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free1
    s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free1
    s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+2], 1               // Free2
    s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free2
    s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideCK]             // Free2
    s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideCK]                // Free2
    s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free2
    s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free2
    s_lshl_b64 s[sgprtmp2E:sgprtmp3E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe

    s_mov_b32 s[sgprGSUSumIdx] 0
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart2+4*0:\vgprstart2+3+4*0], v[\vgprAddrOffset1], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+0+4*0:\vgprstart+1+4*0], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+2+4*0:\vgprstart+3+4*0], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    s_mov_b32 s[sgprGSUSumIdx] 1
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart2+4*1:\vgprstart2+3+4*1], v[\vgprAddrOffset1], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+0+4*1:\vgprstart+1+4*1], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+2+4*1:\vgprstart+3+4*1], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 2
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart2+4*2:\vgprstart2+3+4*2], v[\vgprAddrOffset1], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+0+4*2:\vgprstart+1+4*2], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+2+4*2:\vgprstart+3+4*2], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 3
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart2+4*3:\vgprstart2+3+4*3], v[\vgprAddrOffset1], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+0+4*3:\vgprstart+1+4*3], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+2+4*3:\vgprstart+3+4*3], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 4
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart2+4*4:\vgprstart2+3+4*4], v[\vgprAddrOffset1], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+0+4*4:\vgprstart+1+4*4], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_load_dwordx2 v[\vgprstart+2+4*4:\vgprstart+3+4*4], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    s_waitcnt vmcnt(3)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*1]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*1]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*1]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*1]

    V_PK_ADD_F32 v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+4*1+0:\vgprstart2+4*1+1]
    V_PK_ADD_F32 v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+4*1+2:\vgprstart2+4*1+3]

    s_waitcnt vmcnt(2)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*2]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*2]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*2]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*2]

    V_PK_ADD_F32 v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+4*2+0:\vgprstart2+4*2+1]
    V_PK_ADD_F32 v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+4*2+2:\vgprstart2+4*2+3]

    s_waitcnt vmcnt(1)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*3]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*3]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*3]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*3]

    V_PK_ADD_F32 v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+4*3+0:\vgprstart2+4*3+1]
    V_PK_ADD_F32 v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+4*3+2:\vgprstart2+4*3+3]

    s_waitcnt vmcnt(0)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*4]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*4]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*4]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*4]

    V_PK_ADD_F32 v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+0:\vgprstart2+1], v[\vgprstart2+4*4+0:\vgprstart2+4*4+1]
    V_PK_ADD_F32 v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+2:\vgprstart2+3], v[\vgprstart2+4*4+2:\vgprstart2+4*4+3]

    v_mov_b32 v[\vgprstart1+0], v[\vgprstart2+0]
    v_mov_b32 v[\vgprstart1+1], v[\vgprstart2+1]
    v_mov_b32 v[\vgprstart2+0], v[\vgprstart2+2]
    v_mov_b32 v[\vgprstart2+1], v[\vgprstart2+3]
.endm

.macro GSUSYNC2_2 vgprstart1 vgprstart2 vgprAddrOffset1 vgprAddrOffset2
    V_LSHRREV_B32 v[\vgprAddrOffset1], 0x1, v[\vgprAddrOffset1]
    V_LSHRREV_B32 v[\vgprAddrOffset2], 0x1, v[\vgprAddrOffset2]
    //v_cvt_f16_f32 v[\vgprstart+0], v[\vgprstart+0]
    //v_cvt_f16_f32 v[\vgprstart+1], v[\vgprstart+1]
    //v_cvt_f16_f32 v[\vgprstart+2], v[\vgprstart+2]
    //v_cvt_f16_f32 v[\vgprstart+3], v[\vgprstart+3]

    //v_pack_b32_f16 v[\vgprstart1+0], v[\vgprstart1+0], v[\vgprstart1+1]
    //v_pack_b32_f16 v[\vgprstart2+0], v[\vgprstart2+0], v[\vgprstart2+1]

    v_cvt_pkrtz_f16_f32 v[\vgprstart1+0], v[\vgprstart1+0], v[\vgprstart1+1]
    v_cvt_pkrtz_f16_f32 v[\vgprstart1+1], v[\vgprstart2+0], v[\vgprstart2+1]

    //V_LSHRREV_B32 v6, 0x1, v6

    buffer_store_dwordx2 v[\vgprstart1:\vgprstart1+1], v[\vgprAddrOffset1], s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // store D
    //buffer_store_dword v[\vgprstart+0], v[\vgprAddrOffset1], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
    //buffer_store_dword v[\vgprstart+1], v[\vgprAddrOffset2], s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

    //s_branch \labelendname //label_GW_End_1 // label_Activation_End_Edge

    //label_AFTERsummary_Edge:
    //GSUFusion

.endm

/* Global Offset A */
.macro GLOBAL_OFFSET_A vgprAddr:req vgprOffset0I:req vgprOffsetL:req vgprTmp:req
    v_mul_lo_u32 v[\vgprTmp+0] s[sgprStrideAL] v[\vgprOffsetL] // mul d1 lower
    v_add_co_u32 v[\vgprAddr+0] vcc v[\vgprOffset0I] v[\vgprTmp+0] // accumulate K lower
    v_add_u32 v[\vgprAddr+0] 0x2 v[\vgprAddr+0]      // add prepad for pointer shift
    v_lshlrev_b32 v[\vgprAddr+0] 0x1 v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Global Offset B */
.macro GLOBAL_OFFSET_B vgprAddr:req vgprOffsetL:req vgprOffset1J:req vgprTmp:req
    v_mul_lo_u32 v[\vgprTmp+0] s[sgprStrideB1J] v[\vgprOffset1J] // mul d1 lower
    v_add_co_u32 v[\vgprAddr+0] vcc v[\vgprOffsetL] v[\vgprTmp+0] // accumulate K lower
    v_add_u32 v[\vgprAddr+0] 0x2 v[\vgprAddr+0]      // add prepad for pointer shift
    v_lshlrev_b32 v[\vgprAddr+0] 0x1 v[\vgprAddr+0]  // offset *= bytes/element
.endm

/* Dynamic Scalar Divide: vQuotient=vDividend/vDivisor; vRemainder=vDividend%vDivisor; */
.macro DYNAMIC_VECTOR_DIVIDE vQuotient vRemainder vDividend vDivisor vTmp0 vTmp1 sTmp
    v_cvt_f32_u32 v[\vQuotient] v[\vDivisor]
    v_rcp_f32 v[\vQuotient] v[\vQuotient]
    v_mul_f32 v[\vQuotient] 0x4f800000 v[\vQuotient]
    v_cvt_u32_f32 v[\vQuotient] v[\vQuotient]
    v_mul_lo_u32 v[\vRemainder] v[\vDivisor] v[\vQuotient]
    v_mul_hi_u32 v[\vTmp0] v[\vDivisor] v[\vQuotient]
    v_sub_co_u32 v[\vTmp1] vcc 0x0 v[\vRemainder]
    v_cmp_ne_i32 s[\sTmp:\sTmp+1] 0x0 v[\vTmp0]
    v_cndmask_b32 v[\vRemainder] v[\vTmp1] v[\vRemainder] s[\sTmp:\sTmp+1]
    v_mul_hi_u32 v[\vRemainder] v[\vRemainder] v[\vQuotient]
    v_sub_co_u32 v[\vTmp0] vcc v[\vQuotient] v[\vRemainder]
    v_add_co_u32 v[\vQuotient] vcc v[\vQuotient] v[\vRemainder]
    v_cndmask_b32 v[\vQuotient] v[\vQuotient] v[\vTmp0] s[\sTmp:\sTmp+1]
    v_mul_hi_u32 v[\vQuotient] v[\vQuotient] v[\vDividend]
    v_mul_lo_u32 v[\vRemainder] v[\vQuotient] v[\vDivisor]
    v_sub_co_u32 v[\vTmp0] vcc v[\vDividend] v[\vRemainder]
    v_cmp_ge_u32 s[\sTmp:\sTmp+1] v[\vDividend] v[\vRemainder]
    v_add_co_u32 v[\vRemainder] vcc 0x1 v[\vQuotient]
    v_add_co_u32 v[\vTmp1] vcc -1 v[\vQuotient]
    v_cmp_le_u32 vcc v[\vDivisor] v[\vTmp0]
    s_and_b64 vcc s[\sTmp:\sTmp+1] vcc
    v_cndmask_b32 v[\vQuotient] v[\vQuotient] v[\vRemainder] vcc
    v_cndmask_b32 v[\vQuotient] v[\vTmp1] v[\vQuotient] s[\sTmp:\sTmp+1]
    v_cmp_ne_i32 vcc 0x0 v[\vDivisor]
    v_cndmask_b32 v[\vQuotient] -1 v[\vQuotient] vcc // final result
    v_mul_lo_u32 v[\vRemainder] v[\vQuotient] v[\vDivisor]
    v_sub_co_u32 v[\vRemainder] vcc v[\vDividend] v[\vRemainder] // final result
.endm

/******************************************/
/* Allocate Resources                     */
/******************************************/
s_setprio 3                                        // optimization store
s_mov_b32 m0, 0x3900                               // LDS clamp at 14592 bytes
v_mov_b32 v[vgprSerial], v0                        // thread serial id

/* Load Kernel Args */
s_load_dwordx16 s[24:39], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0
s_load_dwordx8 s[40:47], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40
s_load_dwordx4 s[48:51], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60
s_load_dwordx2 s[52:53], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x70

/******************************************/
/* Local Read Addresses                   */
/******************************************/

/* local read addresses: tile assignments a/b */
/* lr0I */
v_and_b32 v2, 63, v[vgprSerial]                    // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v1, 15, v2                               // 1. N offset: nIdx = wtid % MI_N(16)
                                                   // 1. N offset: nOffset = nIdx * nStride(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v0, 4, v2                            // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v0, 0, v0                                // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v0, 0x4, v0                          // 2. block offset: bnOffset = bnIdx * strideBlock(16)
v_add_u32 v1, v0, v1                               // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v2, 4, v2                            // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v2, 0x6, v2                          // 4. K offset: lrKOffset = kIdx * mStride(64)
v_add_u32 v1, v2, v1                               // 5. offset in wave: lrOffset = bnOffset + lrKOffset
/* lr1J */
v_and_b32 v3, 63, v[vgprSerial]                    // 0. thread id in wave: wtid = tid % wavelength(64)
v_and_b32 v2, 15, v3                               // 1. N offset: nIdx = wtid % MI_N(16)
v_lshlrev_b32 v2, 0x6, v2                          // 1. N offset: nOffset = nIdx * nStride(64)
v_lshrrev_b32 v0, 4, v3                            // 2. block offset: bnIdx = wtid / dividedForBlkId(16)
v_and_b32 v0, 0, v0                                // 2. block offset: bnIdx = bnIdx % num1DBlocks(1)
v_lshlrev_b32 v0, 0xa, v0                          // 2. block offset: bnOffset = bnIdx * strideBlock(1024)
v_add_u32 v2, v0, v2                               // 3. add N and block offset: bnOffset = block and N offset
                                                   // 3. apply VectorWidth: bnOffset = bnOffset * vw(1) (multiplier is 1, do nothing)
v_lshrrev_b32 v3, 4, v3                            // 4. K offset: kIdx = wtid / (MIN(16) * MIBB(1))
v_lshlrev_b32 v3, 0x2, v3                          // 4. K offset: lrKOffset = kIdx * mStride(4)
v_add_u32 v2, v3, v2                               // 5. offset in wave: lrOffset = bnOffset + lrKOffset
v_lshrrev_b32 v0, 6, v[vgprSerial]                 // 6. wave offset in N dimen: wtid = tid / dividedForWaveId(64)
v_and_b32 v0, 1, v0                                // 6. wave offset in M dimen: wtid0 = wtid / num1DWaves(2)
v_lshlrev_b32 v0, 0xa, v0                          // 6. wave offset in M dimen: wOffset = wtid0 * W0Stride(1024)
v_add_u32 v2, v0, v2                               // 7. final local read offset: flrOffset = lrOffset + WOffset

/* local read addresses: final offsets a */
v_lshrrev_b32 v0, 7, v[vgprSerial]                 // LSU offset: sgid = Serial / subGroup(128)
s_mov_b32 s9, 16                                   // LSU offset: stride = MT0(16) + PAD0(0)
v_mul_lo_u32 v0, s9, v0                            // LSU offset: lsuoffset = sgid*(MT0+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrA], v0, v1, 0x1  // Final Offset: offset = (lro0*VW+lsuoffset)*bpe

/* local read addresses: final offsets b */
v_lshrrev_b32 v0, 7, v[vgprSerial]                 // LSU offset: sgid = Serial / subGroup(128)
s_mov_b32 s9, 32                                   // LSU offset: stride = MT1(32) + PAD1(0)
v_mul_lo_u32 v0, s9, v0                            // LSU offset: lsuoffset = sgid*(MT1+PAD)
v_add_lshl_u32 v[vgprLocalReadAddrB], v0, v2, 0x1  // Final Offset: offset = (lro1*VW+lsuoffset)*bpe
v_lshrrev_b32 v1, 7, v[vgprLocalReadAddrB]         // Final Offset: padding 4 per block 128
v_lshlrev_b32 v1, 0x3, v1                          // Final Offset: padding 4 per block 128
v_add_u32 v[vgprLocalReadAddrB], v1, v[vgprLocalReadAddrB] // Final Offset: add padding 4 per block 128

/* local read addresses: declare addresses a */
/* N/A */

/* local read addresses: declare addresses b */
v_add_co_u32 v[vgprLocalReadAddrB+0], vcc, 0x800, v[vgprLocalReadAddrB+0] //  += LdsOffsetB (lower)

/******************************************/
/* Local Write Addresses                  */
/******************************************/
/* LVCA = 8 */
/* v1 = A-unroll = serial/LVCA */
v_lshrrev_b32 v1, 3, v[vgprSerial]                 // v1 = v[vgprSerial] / 8
v_and_b32 v0, 7, v[vgprSerial]                     // v0 = v[vgprSerial] % 8
/* tile *= glvw */
v_lshlrev_b32 v0, 0x1, v0                          // v0 = v0 * 2
v_mov_b32 v4, v1                                   // copy for GlobalSplitU
/* LVCB = 32 */
/* v3 = B-unroll = serial%LVCB */
v_lshrrev_b32 v2, 5, v[vgprSerial]                 // v2 = v[vgprSerial] / 32
v_and_b32 v3, 31, v[vgprSerial]                    // v3 = v[vgprSerial] % 32
/* unroll *= glvw */
v_lshlrev_b32 v3, 0x1, v3                          // v3 = v3 * 2
v_mov_b32 v5, v3                                   // copy for GlobalSplitU
/* lwaUnrollAssignmentA = v4 */
/* lwaUnrollAssignmentB = v5 */

/* local write addresses: first offset a */
v_mul_u32_u24 v[vgprLocalWriteAddrA], 0x10, v4     // lwAL**(MTA + PAD)
v_add_lshl_u32 v[vgprLocalWriteAddrA], v0, v[vgprLocalWriteAddrA], 0x1 // lwFOA = (lwAA + lwAL*(MT0I+PAD))*bpe

/* local write addresses: first offset b */
v_mul_u32_u24 v[vgprLocalWriteAddrB], 0x40, v2     // lwBL**(DepthU_Compute + PAD)
v_add_lshl_u32 v[vgprLocalWriteAddrB], v5, v[vgprLocalWriteAddrB], 0x1 // lwFOB = (lwBB + lwBL*(DepthU+PAD))*bpe
v_lshrrev_b32 v6, 7, v[vgprLocalWriteAddrB]        // padding 4 per block 128
v_lshlrev_b32 v6, 0x3, v6                          // padding 4 per block 128
v_add_u32 v[vgprLocalWriteAddrB], v6, v[vgprLocalWriteAddrB] // add padding 4 per block 128
v_add_co_u32 v[vgprLocalWriteAddrB], vcc, 0x800, v[vgprLocalWriteAddrB] // lwFOB = lwB1J + lwBL*MT1J + LDS_OFFSET_B=1024*2
s_waitcnt lgkmcnt(0)                               // wait for 120 bytes of kern args
s_sub_u32 s[sgprAddressA+0], s[sgprAddressA+0], 4  // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprAddressA+1], s[sgprAddressA+1], 0 // pre-pad to make room for possible pointer shift
s_sub_u32 s[sgprAddressB+0], s[sgprAddressB+0], 4  // pre-pad to make room for possible pointer shift
s_subb_u32 s[sgprAddressB+1], s[sgprAddressB+1], 0 // pre-pad to make room for possible pointer shift

/* Short circuit condition if Alpha == 0, then sumDims=0 */
v_cmp_eq_f32 vcc, s[sgprAlpha], 0.0                // s[Alpha] == 0.0f ?
s_cbranch_vccz label_AlphaNonZero                  // branch if s[Alpha] != 0
s_mov_b32 s[sgprSizesSum+0], 0x0                   // Set summation dim=0 if Alpha == 0
label_AlphaNonZero:

/******************************************/
/* Begin setupNewTile                     */
/******************************************/

/* global read addresses: work-group */
/* graWorkGroup mapping */
// GSU-not-WGMapRR :nwg1 = (size1J + MT1J - 1) / MT1J;
s_mov_b32 s76, s[sgprWorkGroup1]                   // copying for divisor
s_mov_b32 s75, 0x0                                 // STATIC_DIV: divisior=5
s_mul_i32 s74, 0x6666, s76                         // tmp1 = dividend * magic hi
s_lshl_b64 s[74:75], s[74:75], 0x10                // left shift 16 bits
s_mul_i32 s[sgprWorkGroup1], s76, 0x6667           // tmp0 = dividend * magic lo
s_add_u32 s74, s[sgprWorkGroup1], s74              // add lo
s_addc_u32 s75, s75, 0x0                           // add hi
s_lshr_b64 s[74:75], s[74:75], 0x21                // tmp1 = (dividend * magic) << shift
s_mov_b32 s[sgprWorkGroup1], s74                   // quotient
s_mul_i32 s74, s[sgprWorkGroup1], 0x5              // quotient*divisor
s_sub_u32 s[sgprGSUSumIdx], s76, s74               // rReg = dividend - quotient*divisor

/* global read addresses: tile offset assignment a */
/* graTileAssignmentA = v0 */

/* global read addresses: tile offset assignment b */
/* graTileAssignmentB = v2 */

/* global read addresses: unroll assignment a */
/* v1 */

/* global read addresses: unroll assignment b */
/* v3 */

/* global read addresses: other free assignments */
/* s[sgprWorkGroup2] */

/* global read addresses: tile offsets a */

/* global read addresses: tile offsets b */

/* global read addresses: unroll offsets a */

/* global read addresses: unroll offsets b */

/* global read addresses: final offsets a */
GLOBAL_OFFSET_A vgprGlobalReadOffsetA+0,  0,  1, 6 // gROA_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetA+0], s[sgprStrideAL], 16 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+0], s[sgprScalarGlobalReadOffsetA+0], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+1], s[sgprStrideAL], 32 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+1], s[sgprScalarGlobalReadOffsetA+1], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetA+2], s[sgprStrideAL], 48 // compute offset diff (scaled unrollDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetA+2], s[sgprScalarGlobalReadOffsetA+2], 0x1 // scalar offset *= bytes/element

/* global read addresses: final offsets b */
GLOBAL_OFFSET_B vgprGlobalReadOffsetB+0,  3,  2, 6 // gROB_0_0_0_0
s_mul_i32 s[sgprScalarGlobalReadOffsetB+0], s[sgprStrideB1J], 4 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+0], s[sgprScalarGlobalReadOffsetB+0], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+1], s[sgprStrideB1J], 8 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+1], s[sgprScalarGlobalReadOffsetB+1], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+2], s[sgprStrideB1J], 12 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+2], s[sgprScalarGlobalReadOffsetB+2], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+3], s[sgprStrideB1J], 16 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+3], s[sgprScalarGlobalReadOffsetB+3], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+4], s[sgprStrideB1J], 20 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+4], s[sgprScalarGlobalReadOffsetB+4], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+5], s[sgprStrideB1J], 24 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+5], s[sgprScalarGlobalReadOffsetB+5], 0x1 // scalar offset *= bytes/element
s_mul_i32 s[sgprScalarGlobalReadOffsetB+6], s[sgprStrideB1J], 28 // compute offset diff (scaled tileDim)
s_lshl_b32 s[sgprScalarGlobalReadOffsetB+6], s[sgprScalarGlobalReadOffsetB+6], 0x1 // scalar offset *= bytes/element

/* global read addresses: addresses a */
/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup0], 16            // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup0], 16               // WorkGroup[01] * MT
s_mul_hi_u32 s75, 64, s[sgprGSUSumIdx]             // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_i32 s74, 64, s[sgprGSUSumIdx]                // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_hi_u32 s75, s74, s[sgprStrideAL]             // tlu=1, scaled unroll-offset by stride
s_mul_i32 s74, s74, s[sgprStrideAL]                // tlu=1, scaled unroll-offset by stride
s_add_u32 s76, s76, s74                            // accum GsuOffset term to tilestart
s_addc_u32 s77, s77, s75                           // accum GsuOffset term to tilestart
s_mov_b32 s78, 1                                   // Init tensor size
s_mov_b32 s79, 0                                   // init tensor size
s_sub_u32 s74, s[sgprSizeI], 1                     // (size-1)
s_mul_hi_u32 s75, constStrideA0I, s74              // stride x (size-1)
s_mul_i32 s74, constStrideA0I, s74                 // stride x (size-1)
s_add_u32 s78, s78, s74                            // sum tensor size
s_addc_u32 s79, s79, s75                           // sum tensor size
s_sub_u32 s74, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s75, s[sgprStrideAL], s74             // stride x (size-1)
s_mul_i32 s74, s[sgprStrideAL], s74                // stride x (size-1)
s_add_u32 s78, s78, s74                            // sum tensor size
s_addc_u32 s79, s79, s75                           // sum tensor size
s_sub_u32 s[sgprShadowLimitA+0], s78, s76          // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s79, s77         // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStrideAK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStrideAK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s77   // SRD base = Address+ tileStart1
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD

/* global read addresses: addresses b */
/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s77, s[sgprWorkGroup1], 32            // WorkGroup[01] * MT
s_mul_i32 s76, s[sgprWorkGroup1], 32               // WorkGroup[01] * MT
s_mul_hi_u32 s77, s76, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s76, s76, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_mul_hi_u32 s75, 64, s[sgprGSUSumIdx]             // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_i32 s74, 64, s[sgprGSUSumIdx]                // gsuOffset = DepthU*bpe*GSUSumIdx
s_add_u32 s76, s76, s74                            // accum GsuOffset term to tilestart
s_addc_u32 s77, s77, s75                           // accum GsuOffset term to tilestart
s_mov_b32 s78, 1                                   // Init tensor size
s_mov_b32 s79, 0                                   // init tensor size
s_sub_u32 s74, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s75, constStrideBL, s74               // stride x (size-1)
s_mul_i32 s74, constStrideBL, s74                  // stride x (size-1)
s_add_u32 s78, s78, s74                            // sum tensor size
s_addc_u32 s79, s79, s75                           // sum tensor size
s_sub_u32 s74, s[sgprSizeJ], 1                     // (size-1)
s_mul_hi_u32 s75, s[sgprStrideB1J], s74            // stride x (size-1)
s_mul_i32 s74, s[sgprStrideB1J], s74               // stride x (size-1)
s_add_u32 s78, s78, s74                            // sum tensor size
s_addc_u32 s79, s79, s75                           // sum tensor size
s_sub_u32 s[sgprShadowLimitB+0], s78, s76          // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s79, s77         // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s75, s[sgprStrideBK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s74, s[sgprStrideBK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s76, s76, s74                            // accum wg term to tilestart
s_addc_u32 s77, s77, s75                           // accum wg term to tilestart
s_lshl_b64 s[76:77], s[76:77], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s76    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s77   // SRD base = Address+ tileStart1
s_mov_b32 s[sgprSrdB+3], Srd127_96                 // Set bits 127_96 in SRD

/* global read addresses: increments a */
s_mul_i32 s[sgprGlobalReadIncsA+0], DepthU*BpeA*5, s[sgprStrideAL] // incrA unrollIdx)

/* global read addresses: increments b */
s_mov_b32 s[sgprGlobalReadIncsB+0], DepthU*BpeB*5  // incrB (unrollIdx)
/* declare loop num iterations */
s_lshr_b32 s[sgprLoopCounterL], s[sgprSizesSum+0], 6 // s[sgprLoopCounterL] = s[sgprSizesSum+0] / 64
v_mov_b32 v2, s[sgprLoopCounterL]                  // copy for divide IterGsu
v_mov_b32 v4, 0x66666667
v_mul_hi_u32 v5, v2, v4                            // v0 = v2 / 5
v_mul_lo_u32 v4, v2, v4                            // v0 = v2 / 5
v_lshrrev_b64 v[4:5], 0x21, v[4:5]                 // v0 = v2 / 5
v_mov_b32 v0, v4                                   // v0 = v2 / 5
v_mul_lo_u32 v4, v0, 0x5                           // v1 = v2 % 5
v_sub_u32 v1, v2, v4                               // v1 = v2 % 5
v_readfirstlane_b32 s[sgprLoopCounterL], v0
v_readfirstlane_b32 s[sgprGSUSumIdx+1], v1
s_add_u32 s74, 1, s[sgprLoopCounterL]              // tmp<-numIterMyWg+
s_cmp_lt_u32 s[sgprGSUSumIdx], s[sgprGSUSumIdx+1]  // gsuSumIdx < numIterPerWgRemainder
s_cmov_b32 s[sgprLoopCounterL], s74                // numIterMyWg++ if needed
s_mov_b32 s[sgprOrigLoopCounter], s[sgprLoopCounterL] // copy loop counter
/* local read addresses: init pointers a */

/* localReadInitPointers */
/* local read addresses: init pointers b */

/* localReadInitPointers */

/* prefetch: global -> local */
s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?
s_setprio 0                                        // optimization store
s_cbranch_scc1 label_ShadowInitStart               // skip to ShadowInitStart iter b/c numIter==0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0, slc // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0, slc // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1] offen offset:0, slc // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2] offen offset:0, slc // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LB+4], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+3] offen offset:0, slc // G -> Reg 0_0_4_0
buffer_load_dword v[vgprG2LB+5], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+4] offen offset:0, slc // G -> Reg 0_0_5_0
buffer_load_dword v[vgprG2LB+6], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+5] offen offset:0, slc // G -> Reg 0_0_6_0
buffer_load_dword v[vgprG2LB+7], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+6] offen offset:0, slc // G -> Reg 0_0_7_0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32

/******************************************/
/* End setupNewTile                       */
/******************************************/
label_ShadowInitStart:
s_mov_b32 s[sgprSrdD+0], s[sgprAddressD+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdD+1], s[sgprAddressD+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdD+2], 0x80000000
s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdC+0], s[sgprAddressC+0]         // init SRD base address (lower)
s_mov_b32 s[sgprSrdC+1], s[sgprAddressC+1]         // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdC+2], 0x80000000
s_mov_b32 s[sgprSrdC+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_mov_b32 s[sgprSrdScaleDVec+0], s[sgprAddressScaleDVec+0] // init SRD base address (lower)
s_mov_b32 s[sgprSrdScaleDVec+1], s[sgprAddressScaleDVec+1] // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdScaleDVec+3], Srd127_96         // Set bits 127_96 in post-loop SRD
s_cmp_eq_u64 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], 0 // s[AddressScaleDVec] == 0 ?
s_cbranch_scc0 label_ScaleDVecAddrValid            // branch if s[AddressScaleDVec] != 0
s_mov_b32 s[sgprSrdScaleDVec+2], 0
s_branch label_ScaleDVecAddrValid_End
label_ScaleDVecAddrValid:
s_mov_b32 s[sgprSrdScaleDVec+2], s[sgprSizeI]
label_ScaleDVecAddrValid_End:

s_mul_i32 s[sgprSrdScaleDVec+2], 0x4, s[sgprSrdScaleDVec+2] // ScaleDVec scaled by BPE

s_mul_i32 s76, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
s_mul_hi_u32 s75, s76, s[sgprStrideC1J]            // ScaleC s76 by Stride
s_mul_i32 s74, s76, s[sgprStrideC1J]               // ScaleC s76 by Stride
s_lshl_b64 s[74:75], s[74:75], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprAddressC+0], s74    // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprAddressC+1], s75   // add hi to SRD
s_mul_hi_u32 s75, s76, s[sgprStrideD1J]            // ScaleD s76 by Stride
s_mul_i32 s74, s76, s[sgprStrideD1J]               // ScaleD s76 by Stride
s_lshl_b64 s[74:75], s[74:75], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprAddressD+0], s74    // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprAddressD+1], s75   // add hi to SRD

s_mul_hi_u32 s75, s[sgprWorkGroup2], s[sgprStrideCK] // ScaleC s[sgprWorkGroup2] by Stride
s_mul_i32 s74, s[sgprWorkGroup2], s[sgprStrideCK]  // ScaleC s[sgprWorkGroup2] by Stride
s_lshl_b64 s[74:75], s[74:75], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s74        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s75       // add hi to SRD
s_mul_hi_u32 s75, s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
s_mul_i32 s74, s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
s_lshl_b64 s[74:75], s[74:75], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s74        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s75       // add hi to SRD

// GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
s_mul_hi_u32 s75, s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
s_mul_i32 s74, s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
s_sub_u32 s78, s[sgprSizesFree+1], 1               // Free1
s_mul_i32 s78, s78, s[sgprGSUSumIdx]               // Free1
s_mul_hi_u32 s77, s78, s[sgprStrideC1J]            // Free1
s_mul_i32 s76, s78, s[sgprStrideC1J]               // Free1
s_add_u32 s74, s74, s76                            // Free1
s_addc_u32 s75, s75, s77                           // Free1
s_sub_u32 s78, s[sgprSizesFree+2], 1               // Free2
s_mul_i32 s78, s78, s[sgprGSUSumIdx]               // Free2
s_mul_hi_u32 s77, s78, s[sgprStrideCK]             // Free2
s_mul_i32 s76, s78, s[sgprStrideCK]                // Free2
s_add_u32 s74, s74, s76                            // Free2
s_addc_u32 s75, s75, s77                           // Free2
s_lshl_b64 s[74:75], s[74:75], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s74        // add lo GSU offset to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s75       // add hi GSU offset to SRD
//Victor

v_mov_b32 v0, 0.0 //src
v_mov_b32 v1, 0.0 //cmp
v_mov_b32 v2, 0.0 
v_mov_b32 v3, 0.0 //cmp

S_OR_B32 s[sgprSrdDd], s[sgprWorkGroup0], s[sgprWorkGroup1]
s_cmp_eq_u32 s[sgprSrdDd], 0                // s[Alpha] == 0.0f ?
s_cbranch_scc0 label_AFTERINITZERO           // jump if XX required

s_cmp_eq_u32 s[sgprGSUSumIdx], 0                // s[Alpha] == 0.0f ?
s_cbranch_scc0 label_AFTERINITZERO           // jump if XX required

//s_mul_hi_u32 s67, s[sgprStrideCK], s[sgprStrideC1J]            // ScaleC s62 by Stride
//s_mul_i32 s66, s[sgprStrideCK], s[sgprStrideC1J]               // ScaleC s62 by Stride

//s_lshl_b64 s[66:67], s[66:67], 2                   // scale by bpe

s_mul_hi_u32 s[sgprtmp1E], s[sgprStrideCK], GSU            // ScaleC s62 by Stride
s_mul_i32 s[sgprtmp0E], s[sgprStrideCK], GSU               // ScaleC s62 by Stride
s_lshl_b64 s[sgprtmp0E:sgprtmp0E+1], s[sgprtmp0E:sgprtmp0E+1], 2                   // scale by bpe
//s_mul_i32 s[66], s[sgprStrideCK], 6
//s_lshl_b32 s[66], s[66], 2                   // scale by bpe

s_mov_b32 s[sgprSrdDd+2], 0x80000000
s_mov_b32 s[sgprSrdDd+3], Srd127_96                 // Set bits 127_96 in post-loop SRD

s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp0E]    // add lo to SRD
s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp1E]   // add hi to SRD

buffer_store_dwordx4 v[0:3], v0, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:128*0 // attempt write avi=0
buffer_store_dword v0, v0, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:4 // attempt write avi=0

s_mov_b32 s[sgprGSUSync] 1
s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x6c glc
s_waitcnt vmcnt(0)                                 // 8wait for global read

label_AFTERINITZERO:                              // jump to end
//Victor

/* initC: remove C-tile 0-0 from pool */

/* initC: remove AB-tile 0-16 from pool */
v_accvgpr_write acc0, 0x0                          // initC
v_accvgpr_write acc1, 0x0                          // initC
v_accvgpr_write acc2, 0x0                          // initC
v_accvgpr_write acc3, 0x0                          // initC
s_cmp_eq_u32 s[sgprLoopCounterL], 0                // at last iteration?

/* after InitC, skip to end of prefetch last iter if numIter==0 */
s_cbranch_scc0 label_NoBranch_3VFVW7WTC6WFNP2U_0   // Only branch on scc1
s_getpc_b64 s[74:75]                               // addr of next instr
s_add_i32 s76, label_PrefetchGlobalLastIterEnd, 0x4 // target branch offset
s_add_u32 s74, s74, s76                            // add target branch offset
s_addc_u32 s75, s75, 0                             // add high and carry
s_setpc_b64 s[74:75]                               // branch to label_PrefetchGlobalLastIterEnd
label_NoBranch_3VFVW7WTC6WFNP2U_0:
s_waitcnt vmcnt(0)                                 // 8wait for global read

/* local write a */
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:512 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 512
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:1024 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 1024
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:1536 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 1536

/* local write b */
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:544 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 544
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:1088 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 1088
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:1632 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 1632
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+4] offset:2176 // lwoB_0_0_4_0 = (0*LSCB)*(MT1J+PAD) + (4*LSPB) = 2176
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+5] offset:2720 // lwoB_0_0_5_0 = (0*LSCB)*(MT1J+PAD) + (5*LSPB) = 2720
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+6] offset:3264 // lwoB_0_0_6_0 = (0*LSCB)*(MT1J+PAD) + (6*LSPB) = 3264
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+7] offset:3808 // lwoB_0_0_7_0 = (0*LSCB)*(MT1J+PAD) + (7*LSPB) = 3808

/* local write swap a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x2000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x2000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_cmp_eq_u32 s[sgprLoopCounterL], 0x1              // PGR=2 but only 1 loop
s_cbranch_scc1 label_skipPGR2_0                    // PGR=2 but only 1 loop
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0, slc // G -> Reg 0_0_0_0
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0, slc // G -> Reg 0_0_1_0
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1] offen offset:0, slc // G -> Reg 0_0_2_0
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2] offen offset:0, slc // G -> Reg 0_0_3_0
buffer_load_dword v[vgprG2LB+4], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+3] offen offset:0, slc // G -> Reg 0_0_4_0
buffer_load_dword v[vgprG2LB+5], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+4] offen offset:0, slc // G -> Reg 0_0_5_0
buffer_load_dword v[vgprG2LB+6], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+5] offen offset:0, slc // G -> Reg 0_0_6_0
buffer_load_dword v[vgprG2LB+7], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+6] offen offset:0, slc // G -> Reg 0_0_7_0
label_skipPGR2_0:
s_waitcnt lgkmcnt(0)                               // 0prefetch wait for local write
// Skip force waitcnt0
s_barrier

/* local read prefetch a */
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:96 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0

/* local read prefetch b */
ds_read_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+1], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
/* N/A, lro->256 */
/* self.localReadDoCntA 1 self.localReadDoCntB 1 */

/* local read inc b */
/* N/A, lro->16 */
/* self.localReadDoCntA 1 self.localReadDoCntB 1 */

/******************************************/
/* Unrolled Loop(s) - Begin               */
/******************************************/
label_openLoopL:
s_cmp_eq_u32 s[sgprLoopCounterL], 0x1              // LoopCounterL < EndCounter
s_cbranch_scc1 label_toPGR1_0                      // PGR=2 but only 1 loop, toPGR1
s_cmp_le_u32 s[sgprLoopCounterL], 0x2              // LoopCounterL < EndCounter
s_cbranch_scc1 label_LoopEndL                      // do not enter LoopL
label_LoopBeginL:

/******************************************/
/* Unrolled Loop 1/1 - Begin              */
/******************************************/

/* Begin Each Unroll: Check VGPR.checkin for INT8 LW */

/* iter 0 (swap and reset local write pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:544 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:576 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:608 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b64 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=16 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_setprio 3                                        // store optimization
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
buffer_load_dword v[vgprG2LA+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // G -> Reg 0_0_0_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:512 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 512
buffer_load_dword v[vgprG2LA+1], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // G -> Reg 0_0_1_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:1024 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 1024
buffer_load_dword v[vgprG2LA+2], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // G -> Reg 0_0_2_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:1536 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 1536
buffer_load_dword v[vgprG2LA+3], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // G -> Reg 0_0_3_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
buffer_load_dword v[vgprG2LB+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0, slc // G -> Reg 0_0_0_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:544 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 544
buffer_load_dword v[vgprG2LB+1], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0, slc // G -> Reg 0_0_1_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:1088 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 1088
buffer_load_dword v[vgprG2LB+2], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1] offen offset:0, slc // G -> Reg 0_0_2_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:1632 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 1632
buffer_load_dword v[vgprG2LB+3], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2] offen offset:0, slc // G -> Reg 0_0_3_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+4] offset:2176 // lwoB_0_0_4_0 = (0*LSCB)*(MT1J+PAD) + (4*LSPB) = 2176
buffer_load_dword v[vgprG2LB+4], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+3] offen offset:0, slc // G -> Reg 0_0_4_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+5] offset:2720 // lwoB_0_0_5_0 = (0*LSCB)*(MT1J+PAD) + (5*LSPB) = 2720
buffer_load_dword v[vgprG2LB+5], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+4] offen offset:0, slc // G -> Reg 0_0_5_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+6] offset:3264 // lwoB_0_0_6_0 = (0*LSCB)*(MT1J+PAD) + (6*LSPB) = 3264
buffer_load_dword v[vgprG2LB+6], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+5] offen offset:0, slc // G -> Reg 0_0_6_0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+7] offset:3808 // lwoB_0_0_7_0 = (0*LSCB)*(MT1J+PAD) + (7*LSPB) = 3808
buffer_load_dword v[vgprG2LB+7], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+6] offen offset:0, slc // G -> Reg 0_0_7_0

/* local write swap offsets a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x2000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap offsets b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x2000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=17 newLW=12 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:1056 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:1088 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:1120 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
ds_read_b64 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=17 newLW=12 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X1_I0+0+0+0:vgprValuB_X1_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=2 skipReadsIterB=1 readsPerIterB=1 */

/* iter 2 (reset local read pointers iteration)  (swap local read pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:1536 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:1568 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:1600 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:1632 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
ds_read_b64 v[vgprValuB_X3_I0+0:vgprValuB_X3_I0+0+1], v[vgprLocalReadAddrB] offset:96 // L -> Reg lro=48 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0

/* local read swap offsets a */
v_xor_b32 v[vgprLocalReadAddrA], 0x2000, v[vgprLocalReadAddrA] // swap Red Blk

/* local read swap offsets b */
v_xor_b32 v[vgprLocalReadAddrB], 0x2000, v[vgprLocalReadAddrB] // swap Red Blk

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=1 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */

/* iter 3 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // 3wait for local write
// Skip force waitcnt0
s_barrier
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:96 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0
ds_read_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+1], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X3_I0+0+0+0:vgprValuB_X3_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=1 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=2 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */

/******************************************/
/* Unrolled Loop - End                    */
/******************************************/

/* closeLoop loopL finalLoop=1 tailLoop=0 */
s_sub_u32 s[sgprLoopCounterL], s[sgprLoopCounterL], 1 // dec counterL
s_cmp_eq_i32 s[sgprLoopCounterL], 0x2              // counterL==2
s_cbranch_scc0 label_LoopBeginL                    // restart LoopL
label_LoopEndL:

/* Before NLL: Check VGPR.checkin for INT8 LW */

/******************************************/
/* Ord. NoGlobalLoadLoop - Begin          */
/******************************************/

/* iter 0 (swap and reset local write pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:544 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:576 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:608 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b64 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=16 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0

/* global read inc A loopL */
s_add_u32 s[sgprSrdA+0], s[sgprSrdA+0], s[sgprGlobalReadIncsA+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdA+1], s[sgprSrdA+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], s[sgprGlobalReadIncsA+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0]    // Move shadow to real if we are within 2^32

/* global read inc B loopL */
s_add_u32 s[sgprSrdB+0], s[sgprSrdB+0], s[sgprGlobalReadIncsB+0] // gra SRD += inc(lower)
s_addc_u32 s[sgprSrdB+1], s[sgprSrdB+1], 0         // gra SRD += inc(upper)
s_sub_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], s[sgprGlobalReadIncsB+0] // limit -= inc)
s_subb_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // limit -= inc)
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cmov_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0]    // Move shadow to real if we are within 2^32
s_setprio 3                                        // store optimization
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(11)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(10)                                // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:512 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 512
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(9)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:1024 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 1024
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(8)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:1536 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 1536
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(7)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(6)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:544 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 544
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(5)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:1088 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 1088
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(4)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:1632 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 1632
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(3)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+4] offset:2176 // lwoB_0_0_4_0 = (0*LSCB)*(MT1J+PAD) + (4*LSPB) = 2176
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(2)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+5] offset:2720 // lwoB_0_0_5_0 = (0*LSCB)*(MT1J+PAD) + (5*LSPB) = 2720
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(1)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+6] offset:3264 // lwoB_0_0_6_0 = (0*LSCB)*(MT1J+PAD) + (6*LSPB) = 3264
/* sched write - iter 0 writesPerItem=1 */
s_waitcnt vmcnt(0)                                 // wait for global read before writing to local
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+7] offset:3808 // lwoB_0_0_7_0 = (0*LSCB)*(MT1J+PAD) + (7*LSPB) = 3808

/* local write swap offsets a */
v_xor_b32 v[vgprLocalWriteAddrA+0], 0x2000, v[vgprLocalWriteAddrA+0] // swap Red Blk

/* local write swap offsets b */
v_xor_b32 v[vgprLocalWriteAddrB+0], 0x2000, v[vgprLocalWriteAddrB+0] // swap Red Blk
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=17 newLW=12 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:1056 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:1088 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:1120 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
ds_read_b64 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(15)                              // wait for prior local read local write old=0, new=17 newLW=12 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X1_I0+0+0+0:vgprValuB_X1_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=2 skipReadsIterB=1 readsPerIterB=1 */

/* iter 2 (reset local read pointers iteration)  (swap local read pointers iteration)  */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:1536 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:1568 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:1600 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:1632 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
ds_read_b64 v[vgprValuB_X3_I0+0:vgprValuB_X3_I0+0+1], v[vgprLocalReadAddrB] offset:96 // L -> Reg lro=48 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0

/* local read swap offsets a */
v_xor_b32 v[vgprLocalReadAddrA], 0x2000, v[vgprLocalReadAddrA] // swap Red Blk

/* local read swap offsets b */
v_xor_b32 v[vgprLocalReadAddrB], 0x2000, v[vgprLocalReadAddrB] // swap Red Blk

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=1 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */

/* iter 3 */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // 3wait for local write
// Skip force waitcnt0
s_barrier
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:96 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0
ds_read_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+1], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X3_I0+0+0+0:vgprValuB_X3_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=1 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=2 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */
label_toPGR1_0:

/******************************************/
/* Opt. NoLoadLoop - Begin                */
/******************************************/
s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 label_OptNLL_End                    // Branch if Beta is not zero

s_cmp_eq_u32 s[sgprAlpha], 1.0                     // Alpha == 1.0 ?
s_cbranch_scc0 label_OptNLL_End                    // branch if alpha != 1

s_and_b32 s74, 15, s[sgprSizeI]                    // s74 = s[sgprSizeI] % 16
s_add_u32 s75, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s75                // wg0 >= nwg0-1 ?
s_cselect_b32 s74, s74, 0                          // set rMT0
s_cmpk_gt_u32 s74, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_OptNLL_End                    // jump if edges required
s_and_b32 s74, 31, s[sgprSizeJ]                    // s74 = s[sgprSizeJ] % 32
s_add_u32 s75, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s75                // wg1 >= nwg1-1
s_cselect_b32 s74, s74, 0                          // set rMT1
s_cmpk_gt_u32 s74, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_OptNLL_End                    // jump if edges required

s_and_b32 s75, 63, s[sgprSizesSum+0]               // s75 = s[sgprSizesSum+0] % 64
s_cmp_eq_u32 s75, 0x0                              // numIterL == 0
s_cbranch_scc0 label_OptNLL_End                    // skip if tail loop required

/* iter 0 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:544 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:576 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:608 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b64 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=16 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_setprio 3                                        // store optimization
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:1056 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:1088 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:1120 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
ds_read_b64 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X1_I0+0+0+0:vgprValuB_X1_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=2 skipReadsIterB=1 readsPerIterB=1 */

/* iter 2 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:1536 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:1568 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:1600 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:1632 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
ds_read_b64 v[vgprValuB_X3_I0+0:vgprValuB_X3_I0+0+1], v[vgprLocalReadAddrB] offset:96 // L -> Reg lro=48 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=1 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */

/* iter 3 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // wait for prior local read local write old=0, new=0 newLW=0 newLR=0
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X3_I0+0+0+0:vgprValuB_X3_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=0 readsPerIterA=4 */
/* dataAtIterB=2 numReadsIterB=3 skipReadsIterB=0 readsPerIterB=1 */
/* Stores for OptNLL */
label_Summation_End_OptNLL:
s_setprio 0                                        // optimization store
/* endSummation: add vgpr [0...32) to pool */
.set ShadowLimitB, UNDEF
.set SrdA, UNDEF
.set SrdB, UNDEF
.set ScalarGlobalReadOffsetA, UNDEF
.set ScalarGlobalReadOffsetB, UNDEF
/* load store sgprs */
.set sgprAddressBias, 56
.set sgprBiasType, 58
.set sgpractivationAlpha, 59
.set sgpractivationBeta, 60
.set sgprActivationType, 61
s_load_dwordx4 s[56:59], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x78
s_load_dwordx2 s[60:61], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x88
.set sgprSrdBias, 64

/* Mapping of Acc register -> C Vgpr register */
/* computeStoreVgprs */
v_lshrrev_b32 v4, 6, v[vgprSerial]                 // v4 = v[vgprSerial] / 64
v_lshrrev_b32 v1, 0, v4                            // v1 = v4 / 1
v_mul_lo_u32 v1, 0x10, v1                          // wave coordination offset 1
v_and_b32 v5, 15, v[vgprSerial]                    // v5 = v[vgprSerial] % 16
v_add_u32 v1, v5, v1                               // coordination 1 = wave_id1 + tid1
v_mul_lo_u32 v2, v1, s[sgprStrideC1J]              //  offset 1
v_mul_lo_u32 v3, v1, s[sgprStrideD1J]              //  offset 1
v_and_b32 v5, 0, v4                                // v5 = v4 % 1
v_mul_lo_u32 v5, 0x10, v5                          // wave coordination offset 0
v_and_b32 v0, 63, v[vgprSerial]                    // v0 = v[vgprSerial] % 64
v_lshrrev_b32 v0, 4, v0                            // v0 = v0 / 16
v_lshlrev_b32 v0, 0x2, v0                          // thread0 * continuous_output
v_add_u32 v0, v5, v0                               // coordination 0 = wave_id0 + tid0
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v0, s54, v0                              // coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0
s_mul_i32 s54, 32, s[sgprWorkGroup1]               // wgp1 * MT1
v_add_u32 v1, s54, v1                              // coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1

/******************************************/
/* Global Write Elements                  */
/******************************************/
s_waitcnt lgkmcnt(0)                               // wait for 24 bytes of kern args.
s_mov_b32 s[sgprSrdBias+0], s[sgprAddressBias+0]   // init SRD base address (lower)
s_mov_b32 s[sgprSrdBias+1], s[sgprAddressBias+1]   // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdBias+3], Srd127_96              // Set bits 127_96 in post-loop SRD
s_cmp_eq_u64 s[sgprAddressBias:sgprAddressBias+1], 0 // s[AddressBias] == 0 ?
s_cbranch_scc0 label_BiasAddrValid                 // branch if s[AddressBias] != 0
s_mov_b32 s[sgprSrdBias+2], 0
s_branch label_BiasAddrValid_End
label_BiasAddrValid:
s_mov_b32 s[sgprSrdBias+2], s[sgprSizeI]
label_BiasAddrValid_End:

label_Load_Biasf32:
s_cmpk_lg_u32 s[sgprBiasType], 0                   // BiasType != 0
s_cbranch_scc1 label_Load_Biasf16                  // Branch if true

/******************************************/
/* Read Bias to LDS                       */
/******************************************/
s_mul_i32 s[sgprSrdBias+2], 0x4, s[sgprSrdBias+2]  // scaled by BPE
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v8, s54, v[vgprSerial]                   // coord 0 = wgp0 * MT0 + thread offset
v_lshlrev_b32 v8, 0x2, v8                          // Global bias address scaled by BPE
buffer_load_dword v4, v8, s[sgprSrdBias:sgprSrdBias+3], 0 offen offset:0 // load bias
v_lshlrev_b32 v8, 0x2, v[vgprSerial]               // Local bias address scaled by BPE
s_waitcnt vmcnt(0)                                 // wait for bias load
s_barrier                                          // Wait for all wavefronts
ds_write_b32 v8, v4 offset:0                       // store bias
s_branch label_Load_Bias_End                       // Branch to load bias end
label_Load_Biasf16:
s_cmpk_lg_u32 s[sgprBiasType], 4                   // BiasType != 4
s_cbranch_scc1 label_Load_Bias_End                 // Branch if true

/******************************************/
/* Read Bias to LDS                       */
/******************************************/
s_mul_i32 s[sgprSrdBias+2], 0x2, s[sgprSrdBias+2]  // scaled by BPE
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v8, s54, v[vgprSerial]                   // coord 0 = wgp0 * MT0 + thread offset
v_lshlrev_b32 v8, 0x1, v8                          // Global bias address scaled by BPE
buffer_load_short_d16 v4, v8, s[sgprSrdBias:sgprSrdBias+3], 0 offen offset:0 // load bias
v_lshlrev_b32 v8, 0x2, v[vgprSerial]               // Local bias address scaled by BPE
s_waitcnt vmcnt(0)                                 // wait for bias load
s_barrier                                          // Wait for all wavefronts
v_cvt_f32_f16 v4, v4                               // convert to FP32
ds_write_b32 v8, v4 offset:0                       // store bias
s_branch label_Load_Bias_End                       // Branch to load bias end
label_Load_Bias_End:
label_GW_B0_E0:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=16 */
s_cmpk_eq_u32 s[sgprActivationType], 0             // activationType == 0
s_cbranch_scc1 label_Activation_None               // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 1             // activationType == 1
s_cbranch_scc1 label_Activation_Abs                // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 2             // activationType == 2
s_cbranch_scc1 label_Activation_Clippedrelu        // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 3             // activationType == 3
s_cbranch_scc1 label_Activation_Gelu               // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 4             // activationType == 4
s_cbranch_scc1 label_Activation_Leakyrelu          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 5             // activationType == 5
s_cbranch_scc1 label_Activation_Relu               // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 6             // activationType == 6
s_cbranch_scc1 label_Activation_Sigmoid            // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 7             // activationType == 7
s_cbranch_scc1 label_Activation_Tanh               // Branch if true
label_Activation_None:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC label_BUSYWAIT1 label_Activation_End 22 16 v7
//GSUSYNC_2 label_BUSYWAIT1 label_Activation_End 16 22 7 7

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
//buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
//buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
//s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC2 22 16 v7
//GSUSYNC2_2 16 22 7 7

s_branch label_Activation_End
label_Activation_Abs:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_and_b32 v[vgprValuC+16], 0x7fffffff, v[vgprValuC+16] // Remove sign bit
v_and_b32 v[vgprValuC+17], 0x7fffffff, v[vgprValuC+17] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_and_b32 v[vgprValuC+22], 0x7fffffff, v[vgprValuC+22] // Remove sign bit
v_and_b32 v[vgprValuC+23], 0x7fffffff, v[vgprValuC+23] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Clippedrelu:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+16], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // min(x, beta)
v_cndmask_b32 v[vgprValuC+16], 0.0, v[vgprValuC+16], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // min(x, beta)
v_cndmask_b32 v[vgprValuC+17], 0.0, v[vgprValuC+17], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+22], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+22], s[sgpractivationBeta], v[vgprValuC+22] // min(x, beta)
v_cndmask_b32 v[vgprValuC+22], 0.0, v[vgprValuC+22], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+23], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+23], s[sgpractivationBeta], v[vgprValuC+23] // min(x, beta)
v_cndmask_b32 v[vgprValuC+23], 0.0, v[vgprValuC+23], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Gelu:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+16]          // k1 * x
v_fma_f32 v4, v[vgprValuC+16], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+16], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+17]          // k1 * x
v_fma_f32 v4, v[vgprValuC+17], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+17], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+22]          // k1 * x
v_fma_f32 v4, v[vgprValuC+22], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+22], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+22], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+22], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+23]          // k1 * x
v_fma_f32 v4, v[vgprValuC+23], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+23], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+23], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+23], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Leakyrelu:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+16] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+16], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+16], v4, v[vgprValuC+16], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+17] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+17], v4, v[vgprValuC+17], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+22] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+22], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+22], v4, v[vgprValuC+22], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+23] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+23], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+23], v4, v[vgprValuC+23], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Relu:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_max_f32 v[vgprValuC+16], v[vgprValuC+16], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+17], v[vgprValuC+17], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_max_f32 v[vgprValuC+22], v[vgprValuC+22], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+23], v[vgprValuC+23], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Sigmoid:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], 0xbfb8aa3b, v[vgprValuC+16] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+17], 0xbfb8aa3b, v[vgprValuC+17] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v[vgprValuC+22], 0xbfb8aa3b, v[vgprValuC+22] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+22], v[vgprValuC+22]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+22], 1.0, v[vgprValuC+22]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+22], v[vgprValuC+22]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+23], 0xbfb8aa3b, v[vgprValuC+23] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+23], v[vgprValuC+23]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+23], 1.0, v[vgprValuC+23]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+23], v[vgprValuC+23]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End
label_Activation_Tanh:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], s[sgpractivationAlpha], v[vgprValuC+16] // x * alpha
v_mul_f32 v[vgprValuC+16], 0x4038aa3b, v[vgprValuC+16] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // e^2x + 1
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+16], -2.0, v[vgprValuC+16], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // beta * tanh(x)
v_mul_f32 v[vgprValuC+17], s[sgpractivationAlpha], v[vgprValuC+17] // x * alpha
v_mul_f32 v[vgprValuC+17], 0x4038aa3b, v[vgprValuC+17] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // e^2x + 1
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+17], -2.0, v[vgprValuC+17], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v[vgprValuC+22], s[sgpractivationAlpha], v[vgprValuC+22] // x * alpha
v_mul_f32 v[vgprValuC+22], 0x4038aa3b, v[vgprValuC+22] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+22], v[vgprValuC+22]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+22], 1.0, v[vgprValuC+22]    // e^2x + 1
v_rcp_f32 v[vgprValuC+22], v[vgprValuC+22]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+22], -2.0, v[vgprValuC+22], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+22], s[sgpractivationBeta], v[vgprValuC+22] // beta * tanh(x)
v_mul_f32 v[vgprValuC+23], s[sgpractivationAlpha], v[vgprValuC+23] // x * alpha
v_mul_f32 v[vgprValuC+23], 0x4038aa3b, v[vgprValuC+23] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+23], v[vgprValuC+23]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+23], 1.0, v[vgprValuC+23]    // e^2x + 1
v_rcp_f32 v[vgprValuC+23], v[vgprValuC+23]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+23], -2.0, v[vgprValuC+23], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+23], s[sgpractivationBeta], v[vgprValuC+23] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
label_Activation_End:
s_branch label_GW_End                              // jump to end
label_GW_End:

s_endpgm                                           // Kernel End
label_OptNLL_End:

/******************************************/
/* Ord. NoLoadLoop - Begin                */
/******************************************/

/* iter 0 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:0  */
ds_read_u16 v[vgprValuA_X1_I0+0], v[vgprLocalReadAddrA] offset:512 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:544 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=1 iui=0
ds_read_u16 v[vgprValuA_X1_I0+1], v[vgprLocalReadAddrA] offset:576 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=1 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:608 // L -> Reg lro=256 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=1 iui=0
ds_read_b64 v[vgprValuB_X1_I0+0:vgprValuB_X1_I0+0+1], v[vgprLocalReadAddrB] offset:32 // L -> Reg lro=16 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=1 iui=0
s_setprio 3                                        // store optimization
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=-1 numReadsIterA=1 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=-1 numReadsIterB=1 skipReadsIterB=1 readsPerIterB=1 */

/* iter 1 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:1  */
ds_read_u16 v[vgprValuA_X2_I0+0], v[vgprLocalReadAddrA] offset:1024 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:1056 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=2 iui=0
ds_read_u16 v[vgprValuA_X2_I0+1], v[vgprLocalReadAddrA] offset:1088 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=2 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:1120 // L -> Reg lro=512 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=2 iui=0
ds_read_b64 v[vgprValuB_X2_I0+0:vgprValuB_X2_I0+0+1], v[vgprLocalReadAddrB] offset:64 // L -> Reg lro=32 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=2 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X1_I0+0], v[vgprValuA_X1_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X1_I0+1], v[vgprValuA_X1_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X1_I0+0+0+0:vgprValuA_X1_I0+0+0+0+1], v[vgprValuB_X1_I0+0+0+0:vgprValuB_X1_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=0 numReadsIterA=2 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=0 numReadsIterB=2 skipReadsIterB=1 readsPerIterB=1 */

/* iter 2 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:2  */
ds_read_u16 v[vgprValuA_X3_I0+0], v[vgprLocalReadAddrA] offset:1536 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v37, v[vgprLocalReadAddrA] offset:1568 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=3 iui=0
ds_read_u16 v[vgprValuA_X3_I0+1], v[vgprLocalReadAddrA] offset:1600 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=3 iui=0
ds_read_u16_d16_hi v38, v[vgprLocalReadAddrA] offset:1632 // L -> Reg lro=768 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=3 iui=0
ds_read_b64 v[vgprValuB_X3_I0+0:vgprValuB_X3_I0+0+1], v[vgprLocalReadAddrB] offset:96 // L -> Reg lro=48 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=3 iui=0
s_waitcnt lgkmcnt(5)                               // wait for prior local read local write old=0, new=5 newLW=0 newLR=5
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X2_I0+0], v[vgprValuA_X2_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X2_I0+1], v[vgprValuA_X2_I0+1], v36 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X2_I0+0+0+0:vgprValuA_X2_I0+0+0+0+1], v[vgprValuB_X2_I0+0+0+0:vgprValuB_X2_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
s_setprio 0                                        // store optimization
/* numPrefetchIter=0 */
/* dataAtIterA=1 numReadsIterA=3 skipReadsIterA=1 readsPerIterA=4 */
/* dataAtIterB=1 numReadsIterB=3 skipReadsIterB=1 readsPerIterB=1 */

/* iter 3 (last unrolled loop) */
/*  grEndMfmaIndex:0, lwStartMfmaIndex:0, lwEndMfmaIndex:0  */
/*  numMfmaForLR:0, barrierMfmaIndex:3  */
/*  mfmaIndex:3  */
s_waitcnt lgkmcnt(0)                               // wait for prior local read local write old=0, new=0 newLW=0 newLR=0
/* pack scheduling: packAIdx:2, packBIdx:0 */
v_or_b32 v[vgprValuA_X3_I0+0], v[vgprValuA_X3_I0+0], v37 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X3_I0+1], v[vgprValuA_X3_I0+1], v38 // pack two half Vgpr to one Vgpr
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
s_nop 0                                            // VALU packing writes to be consumed by matrix instruction
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X3_I0+0+0+0:vgprValuA_X3_I0+0+0+0+1], v[vgprValuB_X3_I0+0+0+0:vgprValuB_X3_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]
/* numPrefetchIter=0 */
/* dataAtIterA=2 numReadsIterA=3 skipReadsIterA=0 readsPerIterA=4 */
/* dataAtIterB=2 numReadsIterB=3 skipReadsIterB=0 readsPerIterB=1 */
label_PrefetchGlobalLastIterEnd:

/******************************************/
/* Tail Loop                              */
/******************************************/

/* local write reset offsets a */
v_and_b32 v[vgprLocalWriteAddrA], 0xf01fff, v[vgprLocalWriteAddrA] // reset to Red

/* local write reset offsets b */
v_and_b32 v[vgprLocalWriteAddrB], 0xf01fff, v[vgprLocalWriteAddrB] // reset to Red

// numIterL = (((sizeL % LOCAL_DEPTHU) + LOCAL_SPLITU - 1) / LOCAL_SPLITU)
s_and_b32 s[sgprLoopCounterL], 63, s[sgprSizesSum+0] // s[sgprLoopCounterL] = s[sgprSizesSum+0] % 64
s_cmp_lg_u32 s[sgprGSUSumIdx], s[sgprGSUSumIdx+1]  // gsuSumIdx == numIterPerWgRemainder
s_cmov_b32 s[sgprLoopCounterL], 0x0                // numIter=0 if gsuSimIdx!=remainder
s_cmp_eq_u32 s[sgprLoopCounterL], 0x0              // numIterL == 0
s_mov_b32 s[sgprOrigLoopCounter], 0                // repurpose to count each localRead increment
s_cbranch_scc1 label_SkipTailLoopL                 // skip to end of tail loop b/c numIter==0

/* Update M0 for DTLDS */

/* global read a */
/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LA+0+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:0 // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], 0 offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+0+0], v[vgprG2LA+0+0], v35     // HasEccHalf: pack
/* g2l=1, load component 0 */
buffer_load_short_d16 v[vgprG2LA+1+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:0 // load one buffer value
/* g2l=1, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+0] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+1+0], v[vgprG2LA+1+0], v35     // HasEccHalf: pack
/* g2l=2, load component 0 */
buffer_load_short_d16 v[vgprG2LA+2+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:0 // load one buffer value
/* g2l=2, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+1] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+2+0], v[vgprG2LA+2+0], v35     // HasEccHalf: pack
/* g2l=3, load component 0 */
buffer_load_short_d16 v[vgprG2LA+3+0], v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:0 // load one buffer value
/* g2l=3, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetA+0], s[sgprSrdA:sgprSrdA+3], s[sgprScalarGlobalReadOffsetA+2] offen offset:2 // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LA+3+0], v[vgprG2LA+3+0], v35     // HasEccHalf: pack

/* Update M0 for DTLDS */

/* global read b */
/* g2l=0, load component 0 */
buffer_load_short_d16 v[vgprG2LB+0+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:0, slc // load one buffer value
/* g2l=0, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], 0 offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+0+0], v[vgprG2LB+0+0], v35     // HasEccHalf: pack
/* g2l=1, load component 0 */
buffer_load_short_d16 v[vgprG2LB+1+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:0, slc // load one buffer value
/* g2l=1, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+0] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+1+0], v[vgprG2LB+1+0], v35     // HasEccHalf: pack
/* g2l=2, load component 0 */
buffer_load_short_d16 v[vgprG2LB+2+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1] offen offset:0, slc // load one buffer value
/* g2l=2, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+1] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+2+0], v[vgprG2LB+2+0], v35     // HasEccHalf: pack
/* g2l=3, load component 0 */
buffer_load_short_d16 v[vgprG2LB+3+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2] offen offset:0, slc // load one buffer value
/* g2l=3, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+2] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+3+0], v[vgprG2LB+3+0], v35     // HasEccHalf: pack
/* g2l=4, load component 0 */
buffer_load_short_d16 v[vgprG2LB+4+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+3] offen offset:0, slc // load one buffer value
/* g2l=4, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+3] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+4+0], v[vgprG2LB+4+0], v35     // HasEccHalf: pack
/* g2l=5, load component 0 */
buffer_load_short_d16 v[vgprG2LB+5+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+4] offen offset:0, slc // load one buffer value
/* g2l=5, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+4] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+5+0], v[vgprG2LB+5+0], v35     // HasEccHalf: pack
/* g2l=6, load component 0 */
buffer_load_short_d16 v[vgprG2LB+6+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+5] offen offset:0, slc // load one buffer value
/* g2l=6, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+5] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+6+0], v[vgprG2LB+6+0], v35     // HasEccHalf: pack
/* g2l=7, load component 0 */
buffer_load_short_d16 v[vgprG2LB+7+0], v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+6] offen offset:0, slc // load one buffer value
/* g2l=7, load component 1 */
buffer_load_short_d16_hi v35, v[vgprGlobalReadOffsetB+0], s[sgprSrdB:sgprSrdB+3], s[sgprScalarGlobalReadOffsetB+6] offen offset:2, slc // load one buffer value
s_waitcnt vmcnt(0)
v_or_b32 v[vgprG2LB+7+0], v[vgprG2LB+7+0], v35     // HasEccHalf: pack
s_waitcnt vmcnt(0)                                 // 2wait for global read
// Skip force waitcnt0
s_barrier

/* local write a */
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+0] offset:0 // lwoA_0_0_0_0 = (0*LSCA) + (0*LSPA)(*MT0I+PAD) = 0
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+1] offset:512 // lwoA_0_0_1_0 = (0*LSCA) + (1*LSPA)(*MT0I+PAD) = 512
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+2] offset:1024 // lwoA_0_0_2_0 = (0*LSCA) + (2*LSPA)(*MT0I+PAD) = 1024
ds_write_b32 v[vgprLocalWriteAddrA], v[vgprG2LA+3] offset:1536 // lwoA_0_0_3_0 = (0*LSCA) + (3*LSPA)(*MT0I+PAD) = 1536

/* local write b */
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+0] offset:0 // lwoB_0_0_0_0 = (0*LSCB)*(MT1J+PAD) + (0*LSPB) = 0
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+1] offset:544 // lwoB_0_0_1_0 = (0*LSCB)*(MT1J+PAD) + (1*LSPB) = 544
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+2] offset:1088 // lwoB_0_0_2_0 = (0*LSCB)*(MT1J+PAD) + (2*LSPB) = 1088
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+3] offset:1632 // lwoB_0_0_3_0 = (0*LSCB)*(MT1J+PAD) + (3*LSPB) = 1632
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+4] offset:2176 // lwoB_0_0_4_0 = (0*LSCB)*(MT1J+PAD) + (4*LSPB) = 2176
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+5] offset:2720 // lwoB_0_0_5_0 = (0*LSCB)*(MT1J+PAD) + (5*LSPB) = 2720
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+6] offset:3264 // lwoB_0_0_6_0 = (0*LSCB)*(MT1J+PAD) + (6*LSPB) = 3264
ds_write_b32 v[vgprLocalWriteAddrB], v[vgprG2LB+7] offset:3808 // lwoB_0_0_7_0 = (0*LSCB)*(MT1J+PAD) + (7*LSPB) = 3808

/* Recalc local read offsets */
s_waitcnt lgkmcnt(0)                               // 5wait for local write
// Skip force waitcnt0
s_barrier

/* local read reset offsets a */

/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrA], 0x1fff, v[vgprLocalReadAddrA] // reset Red,Blk -> Red

/* local read reset offsets b */

/* localReadResetOffsets */
/* handled internally */
v_and_b32 v[vgprLocalReadAddrB], 0x1fff, v[vgprLocalReadAddrB] // reset Red,Blk -> Red

/* local read init pointers a */

/* localReadInitPointers */

/* local read init pointers b */

/* localReadInitPointers */

/* tail loop: macs */
label_TailLoopBeginL:

/* local read a */
ds_read_u16 v[vgprValuA_X0_I0+0], v[vgprLocalReadAddrA] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v35, v[vgprLocalReadAddrA] offset:32 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=1 oIdx=0 buffer=0 iui=0
ds_read_u16 v[vgprValuA_X0_I0+1], v[vgprLocalReadAddrA] offset:64 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=2 oIdx=0 buffer=0 iui=0
ds_read_u16_d16_hi v36, v[vgprLocalReadAddrA] offset:96 // L -> Reg lro=0 swapByteOffset=0 ti=16 vIdx=0 eIdx=0 rIdx=3 oIdx=0 buffer=0 iui=0

/* local read b */
ds_read_b64 v[vgprValuB_X0_I0+0:vgprValuB_X0_I0+0+1], v[vgprLocalReadAddrB] offset:0 // L -> Reg lro=0 swapByteOffset=0 ti=32 vIdx=0 eIdx=0 rIdx=0 oIdx=0 buffer=0 iui=0

/* local read inc a */
s_mov_b32 s74, 0x200                               // inc
v_add_co_u32 v[vgprLocalReadAddrA], vcc, s74, v[vgprLocalReadAddrA] // lrA += 512 (LSU*(MT+PAD)*bpe)

/* local read inc b */
s_mov_b32 s74, 0x20                                // inc
v_add_co_u32 v[vgprLocalReadAddrB], vcc, s74, v[vgprLocalReadAddrB] // lrB += 32 (LSU*bpe)
s_waitcnt lgkmcnt(0)                               // 4wait for local read
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
v_and_b32 v35, 63, v[vgprSerial]                   // v35 = v[vgprSerial] % 64
v_lshrrev_b32 v35, 4, v35                          // v35 = v35 / 16
v_lshlrev_b32 v35, 0x2, v35                        // v35 = v35 * 4
v_cmp_ge_i32 s[74:75], v35, s[sgprLoopCounterL]    // check K index >= Size L
v_cndmask_b32 v[vgprValuA_X0_I0+0+0], v[vgprValuA_X0_I0+0+0], 0x0, s[74:75] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+0], v[vgprValuB_X0_I0+0+0], 0x0, s[74:75] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuA_X0_I0+0+1], v[vgprValuA_X0_I0+0+1], 0x0, s[74:75] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+1], v[vgprValuB_X0_I0+0+1], 0x0, s[74:75] // set 0 if K_idx >= sizeL
v_sub_u32 v35, s[sgprLoopCounterL], v35            // get distance between size and k index
v_cmp_lt_i32 s[74:75], v35, 4                      // set partial 0 if distance less than input per thread
s_and_b32 s76, s[sgprLoopCounterL], 3              // get inputs for edge thread
s_sub_u32 s76, 4, s76                              // use shift to fill 0 for outside element
s_lshl_b32 s76, s76, 4                             // use shift to fill 0 for outside element
v_lshlrev_b64 v[36:37], s76, v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+0], v[vgprValuA_X0_I0+0+0+0+0], v36, s[74:75]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+1], v[vgprValuA_X0_I0+0+0+0+1], v37, s[74:75]
v_lshlrev_b64 v[36:37], s76, v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+0], v[vgprValuB_X0_I0+0+0+0+0], v36, s[74:75]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0+1], v37, s[74:75]
s_nop 1
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]

/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_i32 s[sgprLoopCounterL], s[sgprLoopCounterL], 0x10 // dec counterL (tailLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x10 // inc counterL
s_cmp_le_i32 s[sgprLoopCounterL], 0x0              // counterL<=0
s_cbranch_scc0 label_TailLoopBeginL                // restart LoopL
label_TailLoopEndL:
label_SkipTailLoopL:
label_Summation_End_ZQB4V9YB2NNV8LI6_0:
s_setprio 0                                        // optimization store
/* endSummation: add vgpr [0...32) to pool */
.set ShadowLimitB, UNDEF
.set SrdA, UNDEF
.set SrdB, UNDEF
.set ScalarGlobalReadOffsetA, UNDEF
.set ScalarGlobalReadOffsetB, UNDEF
/* load store sgprs */
.set sgprAddressBias, 56
.set sgprBiasType, 58
.set sgpractivationAlpha, 59
.set sgpractivationBeta, 60
.set sgprActivationType, 61
s_load_dwordx4 s[56:59], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x78
s_load_dwordx2 s[60:61], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x88
.set sgprSrdBias, 64

/* Mapping of Acc register -> C Vgpr register */

/* not-LocalSplitU: global write indices */
/* computeStoreVgprs */
v_lshrrev_b32 v4, 6, v[vgprSerial]                 // v4 = v[vgprSerial] / 64
v_lshrrev_b32 v1, 0, v4                            // v1 = v4 / 1
v_mul_lo_u32 v1, 0x10, v1                          // wave coordination offset 1
v_and_b32 v5, 15, v[vgprSerial]                    // v5 = v[vgprSerial] % 16
v_add_u32 v1, v5, v1                               // coordination 1 = wave_id1 + tid1
v_mul_lo_u32 v2, v1, s[sgprStrideC1J]              //  offset 1
v_mul_lo_u32 v3, v1, s[sgprStrideD1J]              //  offset 1
v_and_b32 v5, 0, v4                                // v5 = v4 % 1
v_mul_lo_u32 v5, 0x10, v5                          // wave coordination offset 0
v_and_b32 v0, 63, v[vgprSerial]                    // v0 = v[vgprSerial] % 64
v_lshrrev_b32 v0, 4, v0                            // v0 = v0 / 16
v_lshlrev_b32 v0, 0x2, v0                          // thread0 * continuous_output
v_add_u32 v0, v5, v0                               // coordination 0 = wave_id0 + tid0
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v0, s54, v0                              // coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0
s_mul_i32 s54, 32, s[sgprWorkGroup1]               // wgp1 * MT1
v_add_u32 v1, s54, v1                              // coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1

/* not-LocalSplitU: global write */

/******************************************/
/* Global Write Elements                  */
/******************************************/
s_waitcnt lgkmcnt(0)                               // wait for 24 bytes of kern args.
s_mov_b32 s[sgprSrdBias+0], s[sgprAddressBias+0]   // init SRD base address (lower)
s_mov_b32 s[sgprSrdBias+1], s[sgprAddressBias+1]   // init SRD base address (upper) + other fields
s_mov_b32 s[sgprSrdBias+3], Srd127_96              // Set bits 127_96 in post-loop SRD
s_cmp_eq_u64 s[sgprAddressBias:sgprAddressBias+1], 0 // s[AddressBias] == 0 ?
s_cbranch_scc0 label_Bias_1AddrValid               // branch if s[AddressBias] != 0
s_mov_b32 s[sgprSrdBias+2], 0
s_branch label_Bias_1AddrValid_End
label_Bias_1AddrValid:
s_mov_b32 s[sgprSrdBias+2], s[sgprSizeI]
label_Bias_1AddrValid_End:

label_Load_Biasf32_1:
s_cmpk_lg_u32 s[sgprBiasType], 0                   // BiasType != 0
s_cbranch_scc1 label_Load_Biasf16_1                // Branch if true

/******************************************/
/* Read Bias to LDS                       */
/******************************************/
s_mul_i32 s[sgprSrdBias+2], 0x4, s[sgprSrdBias+2]  // scaled by BPE
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v8, s54, v[vgprSerial]                   // coord 0 = wgp0 * MT0 + thread offset
v_lshlrev_b32 v8, 0x2, v8                          // Global bias address scaled by BPE
buffer_load_dword v4, v8, s[sgprSrdBias:sgprSrdBias+3], 0 offen offset:0 // load bias
v_lshlrev_b32 v8, 0x2, v[vgprSerial]               // Local bias address scaled by BPE
s_waitcnt vmcnt(0)                                 // wait for bias load
s_barrier                                          // Wait for all wavefronts
ds_write_b32 v8, v4 offset:0                       // store bias
s_branch label_Load_Bias_End_1                     // Branch to load bias end
label_Load_Biasf16_1:
s_cmpk_lg_u32 s[sgprBiasType], 4                   // BiasType != 4
s_cbranch_scc1 label_Load_Bias_End_1               // Branch if true

/******************************************/
/* Read Bias to LDS                       */
/******************************************/
s_mul_i32 s[sgprSrdBias+2], 0x2, s[sgprSrdBias+2]  // scaled by BPE
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v8, s54, v[vgprSerial]                   // coord 0 = wgp0 * MT0 + thread offset
v_lshlrev_b32 v8, 0x1, v8                          // Global bias address scaled by BPE
buffer_load_short_d16 v4, v8, s[sgprSrdBias:sgprSrdBias+3], 0 offen offset:0 // load bias
v_lshlrev_b32 v8, 0x2, v[vgprSerial]               // Local bias address scaled by BPE
s_waitcnt vmcnt(0)                                 // wait for bias load
s_barrier                                          // Wait for all wavefronts
v_cvt_f32_f16 v4, v4                               // convert to FP32
ds_write_b32 v8, v4 offset:0                       // store bias
s_branch label_Load_Bias_End_1                     // Branch to load bias end
label_Load_Bias_End_1:
s_cmpk_eq_u32 s[sgprBeta], 0x0                     // Beta == 0
s_cbranch_scc0 label_GW_Beta_3                     // Branch if Beta is not zero

s_and_b32 s68, 15, s[sgprSizeI]                    // s68 = s[sgprSizeI] % 16
s_add_u32 s69, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s69                // wg0 >= nwg0-1 ?
s_cselect_b32 s68, s68, 0                          // set rMT0
s_cmpk_gt_u32 s68, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
s_and_b32 s68, 31, s[sgprSizeJ]                    // s68 = s[sgprSizeJ] % 32
s_add_u32 s69, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s69                // wg1 >= nwg1-1
s_cselect_b32 s68, s68, 0                          // set rMT1
s_cmpk_gt_u32 s68, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
label_GW_B0_E0_1:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=16 */
s_cmpk_eq_u32 s[sgprActivationType], 0             // activationType == 0
s_cbranch_scc1 label_Activation_None_1             // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 1             // activationType == 1
s_cbranch_scc1 label_Activation_Abs_1              // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 2             // activationType == 2
s_cbranch_scc1 label_Activation_Clippedrelu_1      // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 3             // activationType == 3
s_cbranch_scc1 label_Activation_Gelu_1             // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 4             // activationType == 4
s_cbranch_scc1 label_Activation_Leakyrelu_1        // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 5             // activationType == 5
s_cbranch_scc1 label_Activation_Relu_1             // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 6             // activationType == 6
s_cbranch_scc1 label_Activation_Sigmoid_1          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 7             // activationType == 7
s_cbranch_scc1 label_Activation_Tanh_1             // Branch if true
label_Activation_None_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC label_BUSYWAIT1_1 label_Activation_End_1 22 16 v7
//GSUSYNC_2 label_BUSYWAIT1_1 label_Activation_End_1 16 22 7 7

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
//buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
//buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
//s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC2 22 16 v7
//GSUSYNC2_2 16 22 7 7

s_branch label_Activation_End_1
label_Activation_Abs_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_and_b32 v[vgprValuC+16], 0x7fffffff, v[vgprValuC+16] // Remove sign bit
v_and_b32 v[vgprValuC+17], 0x7fffffff, v[vgprValuC+17] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_and_b32 v[vgprValuC+22], 0x7fffffff, v[vgprValuC+22] // Remove sign bit
v_and_b32 v[vgprValuC+23], 0x7fffffff, v[vgprValuC+23] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Clippedrelu_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+16], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // min(x, beta)
v_cndmask_b32 v[vgprValuC+16], 0.0, v[vgprValuC+16], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // min(x, beta)
v_cndmask_b32 v[vgprValuC+17], 0.0, v[vgprValuC+17], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+22], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+22], s[sgpractivationBeta], v[vgprValuC+22] // min(x, beta)
v_cndmask_b32 v[vgprValuC+22], 0.0, v[vgprValuC+22], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+23], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+23], s[sgpractivationBeta], v[vgprValuC+23] // min(x, beta)
v_cndmask_b32 v[vgprValuC+23], 0.0, v[vgprValuC+23], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Gelu_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+16]          // k1 * x
v_fma_f32 v4, v[vgprValuC+16], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+16], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+17]          // k1 * x
v_fma_f32 v4, v[vgprValuC+17], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+17], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+22]          // k1 * x
v_fma_f32 v4, v[vgprValuC+22], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+22], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+22], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+22], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+23]          // k1 * x
v_fma_f32 v4, v[vgprValuC+23], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+23], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+23], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+23], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Leakyrelu_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+16] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+16], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+16], v4, v[vgprValuC+16], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+17] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+17], v4, v[vgprValuC+17], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+22] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+22], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+22], v4, v[vgprValuC+22], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+23] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+23], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+23], v4, v[vgprValuC+23], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Relu_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_max_f32 v[vgprValuC+16], v[vgprValuC+16], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+17], v[vgprValuC+17], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_max_f32 v[vgprValuC+22], v[vgprValuC+22], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+23], v[vgprValuC+23], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Sigmoid_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], 0xbfb8aa3b, v[vgprValuC+16] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+17], 0xbfb8aa3b, v[vgprValuC+17] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v[vgprValuC+22], 0xbfb8aa3b, v[vgprValuC+22] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+22], v[vgprValuC+22]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+22], 1.0, v[vgprValuC+22]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+22], v[vgprValuC+22]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+23], 0xbfb8aa3b, v[vgprValuC+23] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+23], v[vgprValuC+23]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+23], 1.0, v[vgprValuC+23]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+23], v[vgprValuC+23]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_1
label_Activation_Tanh_1:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
ds_read_b64 v[18:19], v9 offset:8                  // load bias
buffer_load_dwordx2 v[20:21], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+22], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+23], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+22], s[sgprAlpha], v[vgprValuC+22] // *= alpha
v_mul_f32 v[vgprValuC+23], s[sgprAlpha], v[vgprValuC+23] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(1)                     // vmcnt(1) = 2 - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], s[sgpractivationAlpha], v[vgprValuC+16] // x * alpha
v_mul_f32 v[vgprValuC+16], 0x4038aa3b, v[vgprValuC+16] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // e^2x + 1
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+16], -2.0, v[vgprValuC+16], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // beta * tanh(x)
v_mul_f32 v[vgprValuC+17], s[sgpractivationAlpha], v[vgprValuC+17] // x * alpha
v_mul_f32 v[vgprValuC+17], 0x4038aa3b, v[vgprValuC+17] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // e^2x + 1
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+17], -2.0, v[vgprValuC+17], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 2 - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_pk_add_f32 v[vgprValuC+22:vgprValuC+22+1], v[18:19], v[vgprValuC+22:vgprValuC+22+1] // C += bias
v_mul_f32 v[vgprValuC+22], s[sgpractivationAlpha], v[vgprValuC+22] // x * alpha
v_mul_f32 v[vgprValuC+22], 0x4038aa3b, v[vgprValuC+22] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+22], v[vgprValuC+22]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+22], 1.0, v[vgprValuC+22]    // e^2x + 1
v_rcp_f32 v[vgprValuC+22], v[vgprValuC+22]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+22], -2.0, v[vgprValuC+22], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+22], s[sgpractivationBeta], v[vgprValuC+22] // beta * tanh(x)
v_mul_f32 v[vgprValuC+23], s[sgpractivationAlpha], v[vgprValuC+23] // x * alpha
v_mul_f32 v[vgprValuC+23], 0x4038aa3b, v[vgprValuC+23] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+23], v[vgprValuC+23]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+23], 1.0, v[vgprValuC+23]    // e^2x + 1
v_rcp_f32 v[vgprValuC+23], v[vgprValuC+23]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+23], -2.0, v[vgprValuC+23], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+23], s[sgpractivationBeta], v[vgprValuC+23] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v20, 1.0, v20, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v21, 1.0, v21, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+22:vgprValuC+22+1], v[20:21], v[vgprValuC+22:vgprValuC+22+1] // *= scaleDVecVMulPK(20)(0)
buffer_store_dwordx2 v[22:23], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
label_Activation_End_1:
s_branch label_GW_End_1                            // jump to end
label_GW_B0_E1:

/* edge=1, allocate 6 sgpr. perBatchTmpS=4 perBatchMaskS=2 perElementMaskS=0 elementsPerBatch=10 */
s_cmpk_eq_u32 s[sgprActivationType], 0             // activationType == 0
s_cbranch_scc1 label_Activation_None_Edge          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 1             // activationType == 1
s_cbranch_scc1 label_Activation_Abs_Edge           // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 2             // activationType == 2
s_cbranch_scc1 label_Activation_Clippedrelu_Edge   // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 3             // activationType == 3
s_cbranch_scc1 label_Activation_Gelu_Edge          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 4             // activationType == 4
s_cbranch_scc1 label_Activation_Leakyrelu_Edge     // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 5             // activationType == 5
s_cbranch_scc1 label_Activation_Relu_Edge          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 6             // activationType == 6
s_cbranch_scc1 label_Activation_Sigmoid_Edge       // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 7             // activationType == 7
s_cbranch_scc1 label_Activation_Tanh_Edge          // Branch if true
label_Activation_None_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0 

GSUSYNC label_BUSYWAIT1_Edge label_Activation_End_Edge 24 14 v7
//GSUSYNC_2 label_BUSYWAIT1_Edge label_Activation_End_Edge 14 24 7 16

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
//buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
//buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
//s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC2 24 14 v7
//GSUSYNC2_2 14 24 7 16

s_branch label_Activation_End_Edge
label_Activation_Abs_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_and_b32 v[vgprValuC+14], 0x7fffffff, v[vgprValuC+14] // Remove sign bit
v_and_b32 v[vgprValuC+15], 0x7fffffff, v[vgprValuC+15] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_and_b32 v[vgprValuC+24], 0x7fffffff, v[vgprValuC+24] // Remove sign bit
v_and_b32 v[vgprValuC+25], 0x7fffffff, v[vgprValuC+25] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Clippedrelu_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+14], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+14], s[sgpractivationBeta], v[vgprValuC+14] // min(x, beta)
v_cndmask_b32 v[vgprValuC+14], 0.0, v[vgprValuC+14], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+15], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+15], s[sgpractivationBeta], v[vgprValuC+15] // min(x, beta)
v_cndmask_b32 v[vgprValuC+15], 0.0, v[vgprValuC+15], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+24], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+24], s[sgpractivationBeta], v[vgprValuC+24] // min(x, beta)
v_cndmask_b32 v[vgprValuC+24], 0.0, v[vgprValuC+24], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+25], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+25], s[sgpractivationBeta], v[vgprValuC+25] // min(x, beta)
v_cndmask_b32 v[vgprValuC+25], 0.0, v[vgprValuC+25], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Gelu_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+14]          // k1 * x
v_fma_f32 v4, v[vgprValuC+14], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+14], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+14], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+14], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+15]          // k1 * x
v_fma_f32 v4, v[vgprValuC+15], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+15], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+15], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+15], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+24]          // k1 * x
v_fma_f32 v4, v[vgprValuC+24], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+24], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+24], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+24], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+25]          // k1 * x
v_fma_f32 v4, v[vgprValuC+25], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+25], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+25], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+25], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Leakyrelu_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+14] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+14], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+14], v4, v[vgprValuC+14], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+15] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+15], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+15], v4, v[vgprValuC+15], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+24] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+24], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+24], v4, v[vgprValuC+24], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+25] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+25], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+25], v4, v[vgprValuC+25], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Relu_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_max_f32 v[vgprValuC+14], v[vgprValuC+14], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+15], v[vgprValuC+15], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_max_f32 v[vgprValuC+24], v[vgprValuC+24], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+25], v[vgprValuC+25], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Sigmoid_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_mul_f32 v[vgprValuC+14], 0xbfb8aa3b, v[vgprValuC+14] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+14], v[vgprValuC+14]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+14], 1.0, v[vgprValuC+14]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+14], v[vgprValuC+14]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+15], 0xbfb8aa3b, v[vgprValuC+15] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+15], v[vgprValuC+15]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+15], 1.0, v[vgprValuC+15]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+15], v[vgprValuC+15]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_mul_f32 v[vgprValuC+24], 0xbfb8aa3b, v[vgprValuC+24] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+24], v[vgprValuC+24]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+24], 1.0, v[vgprValuC+24]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+24], v[vgprValuC+24]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+25], 0xbfb8aa3b, v[vgprValuC+25] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+25], v[vgprValuC+25]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+25], 1.0, v[vgprValuC+25]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+25], v[vgprValuC+25]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Edge
label_Activation_Tanh_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[10:11], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[12:13], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v17, v4, s68
v_lshlrev_b32 v17, 0x2, v17                        // Bias address scaled by BPE
ds_read_b64 v[20:21], v17 offset:0                 // load bias
v_lshlrev_b32 v18, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[22:23], v18, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v16, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v16, -1, v16, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+14], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+15], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+24], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+25], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+14], s[sgprAlpha], v[vgprValuC+14] // *= alpha
v_mul_f32 v[vgprValuC+15], s[sgprAlpha], v[vgprValuC+15] // *= alpha
v_mul_f32 v[vgprValuC+24], s[sgprAlpha], v[vgprValuC+24] // *= alpha
v_mul_f32 v[vgprValuC+25], s[sgprAlpha], v[vgprValuC+25] // *= alpha
s_waitcnt 0                                        // wait for ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_pk_add_f32 v[vgprValuC+14:vgprValuC+14+1], v[10:11], v[vgprValuC+14:vgprValuC+14+1] // C += bias
v_mul_f32 v[vgprValuC+14], s[sgpractivationAlpha], v[vgprValuC+14] // x * alpha
v_mul_f32 v[vgprValuC+14], 0x4038aa3b, v[vgprValuC+14] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+14], v[vgprValuC+14]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+14], 1.0, v[vgprValuC+14]    // e^2x + 1
v_rcp_f32 v[vgprValuC+14], v[vgprValuC+14]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+14], -2.0, v[vgprValuC+14], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+14], s[sgpractivationBeta], v[vgprValuC+14] // beta * tanh(x)
v_mul_f32 v[vgprValuC+15], s[sgpractivationAlpha], v[vgprValuC+15] // x * alpha
v_mul_f32 v[vgprValuC+15], 0x4038aa3b, v[vgprValuC+15] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+15], v[vgprValuC+15]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+15], 1.0, v[vgprValuC+15]    // e^2x + 1
v_rcp_f32 v[vgprValuC+15], v[vgprValuC+15]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+15], -2.0, v[vgprValuC+15], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+15], s[sgpractivationBeta], v[vgprValuC+15] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v12, 1.0, v12, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v13, 1.0, v13, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+14:vgprValuC+14+1], v[12:13], v[vgprValuC+14:vgprValuC+14+1] // *= scaleDVecVMulPK(12)(0)
buffer_store_dwordx2 v[14:15], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_pk_add_f32 v[vgprValuC+24:vgprValuC+24+1], v[20:21], v[vgprValuC+24:vgprValuC+24+1] // C += bias
v_mul_f32 v[vgprValuC+24], s[sgpractivationAlpha], v[vgprValuC+24] // x * alpha
v_mul_f32 v[vgprValuC+24], 0x4038aa3b, v[vgprValuC+24] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+24], v[vgprValuC+24]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+24], 1.0, v[vgprValuC+24]    // e^2x + 1
v_rcp_f32 v[vgprValuC+24], v[vgprValuC+24]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+24], -2.0, v[vgprValuC+24], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+24], s[sgpractivationBeta], v[vgprValuC+24] // beta * tanh(x)
v_mul_f32 v[vgprValuC+25], s[sgpractivationAlpha], v[vgprValuC+25] // x * alpha
v_mul_f32 v[vgprValuC+25], 0x4038aa3b, v[vgprValuC+25] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+25], v[vgprValuC+25]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+25], 1.0, v[vgprValuC+25]    // e^2x + 1
v_rcp_f32 v[vgprValuC+25], v[vgprValuC+25]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+25], -2.0, v[vgprValuC+25], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+25], s[sgpractivationBeta], v[vgprValuC+25] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v22, 1.0, v22, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v23, 1.0, v23, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+24:vgprValuC+24+1], v[22:23], v[vgprValuC+24:vgprValuC+24+1] // *= scaleDVecVMulPK(22)(0)
buffer_store_dwordx2 v[24:25], v16, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
label_Activation_End_Edge:
s_branch label_GW_End_1                            // jump to end
label_GW_Beta_3:
s_and_b32 s68, 15, s[sgprSizeI]                    // s68 = s[sgprSizeI] % 16
s_add_u32 s69, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s69                // wg0 >= nwg0-1 ?
s_cselect_b32 s68, s68, 0                          // set rMT0
s_cmpk_gt_u32 s68, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_GW_B1_E1                      // jump if edges required
s_and_b32 s68, 31, s[sgprSizeJ]                    // s68 = s[sgprSizeJ] % 32
s_add_u32 s69, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s69                // wg1 >= nwg1-1
s_cselect_b32 s68, s68, 0                          // set rMT1
s_cmpk_gt_u32 s68, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_GW_B1_E1                      // jump if edges required
label_GW_B1_E0:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=12 */
s_cmpk_eq_u32 s[sgprActivationType], 0             // activationType == 0
s_cbranch_scc1 label_Activation_None_Beta          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 1             // activationType == 1
s_cbranch_scc1 label_Activation_Abs_Beta           // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 2             // activationType == 2
s_cbranch_scc1 label_Activation_Clippedrelu_Beta   // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 3             // activationType == 3
s_cbranch_scc1 label_Activation_Gelu_Beta          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 4             // activationType == 4
s_cbranch_scc1 label_Activation_Leakyrelu_Beta     // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 5             // activationType == 5
s_cbranch_scc1 label_Activation_Relu_Beta          // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 6             // activationType == 6
s_cbranch_scc1 label_Activation_Sigmoid_Beta       // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 7             // activationType == 7
s_cbranch_scc1 label_Activation_Tanh_Beta          // Branch if true
label_Activation_None_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Abs_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_and_b32 v[vgprValuC+18], 0x7fffffff, v[vgprValuC+18] // Remove sign bit
v_and_b32 v[vgprValuC+19], 0x7fffffff, v[vgprValuC+19] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_and_b32 v[vgprValuC+26], 0x7fffffff, v[vgprValuC+26] // Remove sign bit
v_and_b32 v[vgprValuC+27], 0x7fffffff, v[vgprValuC+27] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Clippedrelu_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+18], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+18], s[sgpractivationBeta], v[vgprValuC+18] // min(x, beta)
v_cndmask_b32 v[vgprValuC+18], 0.0, v[vgprValuC+18], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+19], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+19], s[sgpractivationBeta], v[vgprValuC+19] // min(x, beta)
v_cndmask_b32 v[vgprValuC+19], 0.0, v[vgprValuC+19], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+26], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+26], s[sgpractivationBeta], v[vgprValuC+26] // min(x, beta)
v_cndmask_b32 v[vgprValuC+26], 0.0, v[vgprValuC+26], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+27], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+27], s[sgpractivationBeta], v[vgprValuC+27] // min(x, beta)
v_cndmask_b32 v[vgprValuC+27], 0.0, v[vgprValuC+27], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Gelu_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+18]          // k1 * x
v_fma_f32 v4, v[vgprValuC+18], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+18], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+18], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+18], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+19]          // k1 * x
v_fma_f32 v4, v[vgprValuC+19], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+19], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+19], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+19], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+26]          // k1 * x
v_fma_f32 v4, v[vgprValuC+26], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+26], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+26], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+26], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+27]          // k1 * x
v_fma_f32 v4, v[vgprValuC+27], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+27], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+27], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+27], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Leakyrelu_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+18] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+18], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+18], v4, v[vgprValuC+18], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+19] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+19], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+19], v4, v[vgprValuC+19], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+26] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+26], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+26], v4, v[vgprValuC+26], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+27] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+27], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+27], v4, v[vgprValuC+27], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Relu_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_max_f32 v[vgprValuC+18], v[vgprValuC+18], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+19], v[vgprValuC+19], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_max_f32 v[vgprValuC+26], v[vgprValuC+26], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+27], v[vgprValuC+27], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Sigmoid_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_mul_f32 v[vgprValuC+18], 0xbfb8aa3b, v[vgprValuC+18] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+18], v[vgprValuC+18]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+18], 1.0, v[vgprValuC+18]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+18], v[vgprValuC+18]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+19], 0xbfb8aa3b, v[vgprValuC+19] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+19], v[vgprValuC+19]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+19], 1.0, v[vgprValuC+19]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+19], v[vgprValuC+19]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_mul_f32 v[vgprValuC+26], 0xbfb8aa3b, v[vgprValuC+26] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+26], v[vgprValuC+26]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+26], 1.0, v[vgprValuC+26]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+26], v[vgprValuC+26]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+27], 0xbfb8aa3b, v[vgprValuC+27] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+27], v[vgprValuC+27]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+27], 1.0, v[vgprValuC+27]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+27], v[vgprValuC+27]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta
label_Activation_Tanh_Beta:
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Beta Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_add_lshl_u32 v8, v2, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
buffer_load_dword v12, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s54, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v9, v0, s54
v_lshlrev_b32 v9, 0x2, v9                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[14:15], v9 offset:0                  // load bias
v_lshlrev_b32 v10, 0x2, v0                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[16:17], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
buffer_load_dword v20, v8, s[sgprSrdC:sgprSrdC+3], 0 offen offset:8 // load C
ds_read_b64 v[22:23], v9 offset:8                  // load bias
buffer_load_dwordx2 v[24:25], v10, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:8 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+18], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+19], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+26], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+27], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+18], s[sgprAlpha], v[vgprValuC+18] // *= alpha
v_mul_f32 v[vgprValuC+19], s[sgprAlpha], v[vgprValuC+19] // *= alpha
v_mul_f32 v[vgprValuC+26], s[sgprAlpha], v[vgprValuC+26] // *= alpha
v_mul_f32 v[vgprValuC+27], s[sgprAlpha], v[vgprValuC+27] // *= alpha

/* apply mask, calc new C and issue writes */

s_waitcnt lgkmcnt(1), vmcnt(2)                     // vmcnt(2) = 4 - 1 (beta) - 1 (scaleDVec) lgkmcnt(1) = 2 - 1 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+18], s[sgprBeta], v12, v[vgprValuC+18] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+19], s[sgprBeta], v12, v[vgprValuC+19] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+18:vgprValuC+18+1], v[14:15], v[vgprValuC+18:vgprValuC+18+1] // C += bias
v_mul_f32 v[vgprValuC+18], s[sgpractivationAlpha], v[vgprValuC+18] // x * alpha
v_mul_f32 v[vgprValuC+18], 0x4038aa3b, v[vgprValuC+18] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+18], v[vgprValuC+18]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+18], 1.0, v[vgprValuC+18]    // e^2x + 1
v_rcp_f32 v[vgprValuC+18], v[vgprValuC+18]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+18], -2.0, v[vgprValuC+18], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+18], s[sgpractivationBeta], v[vgprValuC+18] // beta * tanh(x)
v_mul_f32 v[vgprValuC+19], s[sgpractivationAlpha], v[vgprValuC+19] // x * alpha
v_mul_f32 v[vgprValuC+19], 0x4038aa3b, v[vgprValuC+19] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+19], v[vgprValuC+19]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+19], 1.0, v[vgprValuC+19]    // e^2x + 1
v_rcp_f32 v[vgprValuC+19], v[vgprValuC+19]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+19], -2.0, v[vgprValuC+19], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+19], s[sgpractivationBeta], v[vgprValuC+19] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v16, 1.0, v16, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v17, 1.0, v17, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+18:vgprValuC+18+1], v[16:17], v[vgprValuC+18:vgprValuC+18+1] // *= scaleDVecVMulPK(16)(0)
buffer_store_dwordx2 v[18:19], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D

s_waitcnt lgkmcnt(0), vmcnt(1)                     // vmcnt(0) = 4 - 2 (beta) - 2 (scaleDVec) lgkmcnt(0) = 2 - 2 (bias) (interleaved)
v_fma_mix_f32 v[vgprValuC+26], s[sgprBeta], v20, v[vgprValuC+26] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+27], s[sgprBeta], v20, v[vgprValuC+27] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+26:vgprValuC+26+1], v[22:23], v[vgprValuC+26:vgprValuC+26+1] // C += bias
v_mul_f32 v[vgprValuC+26], s[sgpractivationAlpha], v[vgprValuC+26] // x * alpha
v_mul_f32 v[vgprValuC+26], 0x4038aa3b, v[vgprValuC+26] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+26], v[vgprValuC+26]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+26], 1.0, v[vgprValuC+26]    // e^2x + 1
v_rcp_f32 v[vgprValuC+26], v[vgprValuC+26]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+26], -2.0, v[vgprValuC+26], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+26], s[sgpractivationBeta], v[vgprValuC+26] // beta * tanh(x)
v_mul_f32 v[vgprValuC+27], s[sgpractivationAlpha], v[vgprValuC+27] // x * alpha
v_mul_f32 v[vgprValuC+27], 0x4038aa3b, v[vgprValuC+27] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+27], v[vgprValuC+27]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+27], 1.0, v[vgprValuC+27]    // e^2x + 1
v_rcp_f32 v[vgprValuC+27], v[vgprValuC+27]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+27], -2.0, v[vgprValuC+27], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+27], s[sgpractivationBeta], v[vgprValuC+27] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v24, 1.0, v24, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v25, 1.0, v25, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+26:vgprValuC+26+1], v[24:25], v[vgprValuC+26:vgprValuC+26+1] // *= scaleDVecVMulPK(24)(0)
buffer_store_dwordx2 v[26:27], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
label_Activation_End_Beta:
s_branch label_GW_End_1                            // jump to end
label_GW_B1_E1:

/* edge=1, allocate 6 sgpr. perBatchTmpS=4 perBatchMaskS=2 perElementMaskS=0 elementsPerBatch=10 */
s_cmpk_eq_u32 s[sgprActivationType], 0             // activationType == 0
s_cbranch_scc1 label_Activation_None_Beta_Edge     // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 1             // activationType == 1
s_cbranch_scc1 label_Activation_Abs_Beta_Edge      // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 2             // activationType == 2
s_cbranch_scc1 label_Activation_Clippedrelu_Beta_Edge // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 3             // activationType == 3
s_cbranch_scc1 label_Activation_Gelu_Beta_Edge     // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 4             // activationType == 4
s_cbranch_scc1 label_Activation_Leakyrelu_Beta_Edge // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 5             // activationType == 5
s_cbranch_scc1 label_Activation_Relu_Beta_Edge     // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 6             // activationType == 6
s_cbranch_scc1 label_Activation_Sigmoid_Beta_Edge  // Branch if true
s_cmpk_eq_u32 s[sgprActivationType], 7             // activationType == 7
s_cbranch_scc1 label_Activation_Tanh_Beta_Edge     // Branch if true
label_Activation_None_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Abs_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_and_b32 v[vgprValuC+16], 0x7fffffff, v[vgprValuC+16] // Remove sign bit
v_and_b32 v[vgprValuC+17], 0x7fffffff, v[vgprValuC+17] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_and_b32 v[vgprValuC+28], 0x7fffffff, v[vgprValuC+28] // Remove sign bit
v_and_b32 v[vgprValuC+29], 0x7fffffff, v[vgprValuC+29] // Remove sign bit
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Clippedrelu_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+16], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // min(x, beta)
v_cndmask_b32 v[vgprValuC+16], 0.0, v[vgprValuC+16], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // min(x, beta)
v_cndmask_b32 v[vgprValuC+17], 0.0, v[vgprValuC+17], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_cmp_ge_f32 vcc, v[vgprValuC+28], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+28], s[sgpractivationBeta], v[vgprValuC+28] // min(x, beta)
v_cndmask_b32 v[vgprValuC+28], 0.0, v[vgprValuC+28], vcc // set x to 0 if < alpha
v_cmp_ge_f32 vcc, v[vgprValuC+29], s[sgpractivationAlpha] // x >= alpha ?
v_min_f32 v[vgprValuC+29], s[sgpractivationBeta], v[vgprValuC+29] // min(x, beta)
v_cndmask_b32 v[vgprValuC+29], 0.0, v[vgprValuC+29], vcc // set x to 0 if < alpha
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Gelu_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+16]          // k1 * x
v_fma_f32 v4, v[vgprValuC+16], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+16], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+16], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+17]          // k1 * x
v_fma_f32 v4, v[vgprValuC+17], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+17], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+17], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_mul_f32 v4, 0x3d372713, v[vgprValuC+28]          // k1 * x
v_fma_f32 v4, v[vgprValuC+28], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+28], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+28], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+28], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_mul_f32 v4, 0x3d372713, v[vgprValuC+29]          // k1 * x
v_fma_f32 v4, v[vgprValuC+29], v4, 1.0             // 1 + (k1 * x * x)
v_mul_f32 v4, v[vgprValuC+29], v4                  // x * (1 + k1 * x * x)
v_mul_f32 v4, 0x40135761, v4                       // k0 * x * (x^2 * k1 + 1) (fused 1.595769) (fused 2.302208)
v_exp_f32 v4, v4                                   // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v4, 1.0, v4                              // e^2x + 1
v_rcp_f32 v4, v4                                   // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v4, -2.0, v4, 2.0                        // (-2) * (1 / (e^2x + 1)) + 1 ( + 1 (fused))
v_mul_f32 v4, v[vgprValuC+29], v4                  // x * (1 + tanh(...))
v_mul_f32 v[vgprValuC+29], 0.5, v4                 // 0.5 * x * (1 + tanh(...))
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Leakyrelu_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+16] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+16], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+16], v4, v[vgprValuC+16], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+17] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+17], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+17], v4, v[vgprValuC+17], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+28] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+28], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+28], v4, v[vgprValuC+28], vcc // set x to tmp if < 0
v_mul_f32 v4, s[sgpractivationAlpha], v[vgprValuC+29] // tmp = x * alpha
v_cmp_ge_f32 vcc, v[vgprValuC+29], 0.0             // x >= 0 ?
v_cndmask_b32 v[vgprValuC+29], v4, v[vgprValuC+29], vcc // set x to tmp if < 0
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Relu_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_max_f32 v[vgprValuC+16], v[vgprValuC+16], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+17], v[vgprValuC+17], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_max_f32 v[vgprValuC+28], v[vgprValuC+28], 0      // x = max(0, x)
v_max_f32 v[vgprValuC+29], v[vgprValuC+29], 0      // x = max(0, x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Sigmoid_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], 0xbfb8aa3b, v[vgprValuC+16] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+17], 0xbfb8aa3b, v[vgprValuC+17] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_mul_f32 v[vgprValuC+28], 0xbfb8aa3b, v[vgprValuC+28] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+28], v[vgprValuC+28]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+28], 1.0, v[vgprValuC+28]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+28], v[vgprValuC+28]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_mul_f32 v[vgprValuC+29], 0xbfb8aa3b, v[vgprValuC+29] //  x = -x (fused -1.442695)
v_exp_f32 v[vgprValuC+29], v[vgprValuC+29]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+29], 1.0, v[vgprValuC+29]    // 1 + exp(-x)
v_rcp_f32 v[vgprValuC+29], v[vgprValuC+29]         // 1 / (1 + exp(-x))
s_nop 0                                            // 1 wait states
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
s_branch label_Activation_End_Beta_Edge
label_Activation_Tanh_Beta_Edge:
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Beta Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[68:69], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v7, v2, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDC clip if OOB. offset
buffer_load_dword v10, v7, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v8, v0, s68
v_lshlrev_b32 v8, 0x2, v8                          // Bias address scaled by BPE
s_waitcnt lgkmcnt(0)                               // Wait for Bias LDS write
s_barrier                                          // Bias LDS write barrier
ds_read_b64 v[12:13], v8 offset:0                  // load bias
v_lshlrev_b32 v9, 0x2, v0                          // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[14:15], v9, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v7, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[72:73]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[68:69], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[72:73], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[72:73], s[68:69], s[72:73]             // in0 && in1
v_add_lshl_u32 v18, v2, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDC clip if OOB. offset
buffer_load_dword v22, v18, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // load C
s_mul_i32 s68, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_sub_u32 v19, v4, s68
v_lshlrev_b32 v19, 0x2, v19                        // Bias address scaled by BPE
ds_read_b64 v[24:25], v19 offset:0                 // load bias
v_lshlrev_b32 v20, 0x2, v4                         // ScaleDVec address scaled by BPE
buffer_load_dwordx2 v[26:27], v20, s[sgprSrdScaleDVec:sgprSrdScaleDVec+3], 0 offen offset:0 // load scaleDVecI
v_add_lshl_u32 v18, v3, v4, 0x2                    // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v18, -1, v18, s[72:73]               // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+16], acc0           // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+17], acc1           // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+28], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+29], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */
v_mul_f32 v[vgprValuC+16], s[sgprAlpha], v[vgprValuC+16] // *= alpha
v_mul_f32 v[vgprValuC+17], s[sgprAlpha], v[vgprValuC+17] // *= alpha
v_mul_f32 v[vgprValuC+28], s[sgprAlpha], v[vgprValuC+28] // *= alpha
v_mul_f32 v[vgprValuC+29], s[sgprAlpha], v[vgprValuC+29] // *= alpha
s_waitcnt 0                                        // wait for Beta, ScaleDVec, Bias LDS

/* apply mask, calc new C and issue writes */
v_fma_mix_f32 v[vgprValuC+16], s[sgprBeta], v10, v[vgprValuC+16] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+17], s[sgprBeta], v10, v[vgprValuC+17] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+16:vgprValuC+16+1], v[12:13], v[vgprValuC+16:vgprValuC+16+1] // C += bias
v_mul_f32 v[vgprValuC+16], s[sgpractivationAlpha], v[vgprValuC+16] // x * alpha
v_mul_f32 v[vgprValuC+16], 0x4038aa3b, v[vgprValuC+16] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+16], v[vgprValuC+16]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+16], 1.0, v[vgprValuC+16]    // e^2x + 1
v_rcp_f32 v[vgprValuC+16], v[vgprValuC+16]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+16], -2.0, v[vgprValuC+16], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+16], s[sgpractivationBeta], v[vgprValuC+16] // beta * tanh(x)
v_mul_f32 v[vgprValuC+17], s[sgpractivationAlpha], v[vgprValuC+17] // x * alpha
v_mul_f32 v[vgprValuC+17], 0x4038aa3b, v[vgprValuC+17] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+17], v[vgprValuC+17]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+17], 1.0, v[vgprValuC+17]    // e^2x + 1
v_rcp_f32 v[vgprValuC+17], v[vgprValuC+17]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+17], -2.0, v[vgprValuC+17], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+17], s[sgpractivationBeta], v[vgprValuC+17] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v14, 1.0, v14, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v15, 1.0, v15, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+16:vgprValuC+16+1], v[14:15], v[vgprValuC+16:vgprValuC+16+1] // *= scaleDVecVMulPK(14)(0)
buffer_store_dwordx2 v[16:17], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
v_fma_mix_f32 v[vgprValuC+28], s[sgprBeta], v22, v[vgprValuC+28] op_sel:[0,0,0] op_sel_hi:[0,1,0] // //C*=beta
v_fma_mix_f32 v[vgprValuC+29], s[sgprBeta], v22, v[vgprValuC+29] op_sel:[0,1,0] op_sel_hi:[0,1,0] // //C*=beta
v_pk_add_f32 v[vgprValuC+28:vgprValuC+28+1], v[24:25], v[vgprValuC+28:vgprValuC+28+1] // C += bias
v_mul_f32 v[vgprValuC+28], s[sgpractivationAlpha], v[vgprValuC+28] // x * alpha
v_mul_f32 v[vgprValuC+28], 0x4038aa3b, v[vgprValuC+28] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+28], v[vgprValuC+28]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+28], 1.0, v[vgprValuC+28]    // e^2x + 1
v_rcp_f32 v[vgprValuC+28], v[vgprValuC+28]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+28], -2.0, v[vgprValuC+28], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+28], s[sgpractivationBeta], v[vgprValuC+28] // beta * tanh(x)
v_mul_f32 v[vgprValuC+29], s[sgpractivationAlpha], v[vgprValuC+29] // x * alpha
v_mul_f32 v[vgprValuC+29], 0x4038aa3b, v[vgprValuC+29] //  x = 2 * x (fused 2)
v_exp_f32 v[vgprValuC+29], v[vgprValuC+29]         // exp step 2
s_nop 0                                            // 1 wait states
v_add_f32 v[vgprValuC+29], 1.0, v[vgprValuC+29]    // e^2x + 1
v_rcp_f32 v[vgprValuC+29], v[vgprValuC+29]         // 1 / (e^2x + 1)
s_nop 0                                            // 1 wait states
v_fma_f32 v[vgprValuC+29], -2.0, v[vgprValuC+29], 1.0 // (-2) * (1 / (e^2x + 1)) + 1
v_mul_f32 v[vgprValuC+29], s[sgpractivationBeta], v[vgprValuC+29] // beta * tanh(x)
v_cmp_gt_u32 s[sgprAddressScaleDVec:sgprAddressScaleDVec+1], s[sgprSrdScaleDVec+2], 0 //  == 0 ?
v_cndmask_b32 v26, 1.0, v26, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_cndmask_b32 v27, 1.0, v27, s[sgprAddressScaleDVec:sgprAddressScaleDVec+1] // 1. mul 1 if 0
v_pk_mul_f32 v[vgprValuC+28:vgprValuC+28+1], v[26:27], v[vgprValuC+28:vgprValuC+28+1] // *= scaleDVecVMulPK(26)(0)
buffer_store_dwordx2 v[28:29], v18, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst
label_Activation_End_Beta_Edge:
s_branch label_GW_End_1                            // jump to end
label_GW_End_1:
label_KernelEnd:
s_endpgm                                           // Kernel End
