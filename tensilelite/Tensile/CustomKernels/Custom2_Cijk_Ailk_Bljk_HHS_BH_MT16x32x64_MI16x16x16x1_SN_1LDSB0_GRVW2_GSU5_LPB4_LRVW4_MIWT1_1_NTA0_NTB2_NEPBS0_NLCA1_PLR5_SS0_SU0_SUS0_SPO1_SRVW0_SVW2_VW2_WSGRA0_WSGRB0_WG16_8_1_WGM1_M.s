
/******************************************/
/* Begin Kernel                           */
/******************************************/
.amdgcn_target "amdgcn-amd-amdhsa--gfx90a"
.text
.protected Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M
.globl Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M
.p2align 8
.type Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M,@function
.section .rodata,#alloc
.p2align 6
.amdhsa_kernel Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M
  .amdhsa_user_sgpr_kernarg_segment_ptr 1
  .amdhsa_accum_offset 128 // accvgpr offset
  .amdhsa_next_free_vgpr 132 // vgprs
  .amdhsa_next_free_sgpr 92 // sgprs
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
/* Num SGPR   =92 */

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
  - .name: Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M
    .symbol: 'Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M.kd'
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
      - .name:            strideD0
        .size:            4
        .offset:          40
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideD1
        .size:            4
        .offset:          44
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC0
        .size:            4
        .offset:          48
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideC1
        .size:            4
        .offset:          52
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA0
        .size:            4
        .offset:          56
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideA1
        .size:            4
        .offset:          60
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB0
        .size:            4
        .offset:          64
        .value_kind:      by_value
        .value_type:      u32
      - .name:            strideB1
        .size:            4
        .offset:          68
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree0
        .size:            4
        .offset:          72
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree1
        .size:            4
        .offset:          76
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesFree2
        .size:            4
        .offset:          80
        .value_kind:      by_value
        .value_type:      u32
      - .name:            SizesSum0
        .size:            4
        .offset:          84
        .value_kind:      by_value
        .value_type:      u32
      - .name:            OrigStaggerUIter
        .size:            4
        .offset:          88
        .value_kind:      by_value
        .value_type:      i32
      - .name:            NumWorkGroups0
        .size:            4
        .offset:          92
        .value_kind:      by_value
        .value_type:      u32
      - .name:            NumWorkGroups1
        .size:            4
        .offset:          96
        .value_kind:      by_value
        .value_type:      u32
      - .name:            GSUSync
        .size:            4
        .offset:          100
        .value_kind:      by_value
        .value_type:      u32
      - .name:            CT
        .size:            8
        .offset:          104
        .value_kind:      global_buffer
        .value_type:      f16
        .address_space:   generic
      - .name:            padding
        .size:            4
        .offset:          112
        .value_kind:      by_value
        .value_type:      u32
    .group_segment_fixed_size:   14592
    .kernarg_segment_align:      8
    .kernarg_segment_size:       120
    .max_flat_workgroup_size:    128
    .private_segment_fixed_size: 0
    .sgpr_count:                 92
    .sgpr_spill_count:           0
    .vgpr_count:                 124
    .vgpr_spill_count:           0
    .wavefront_size:             64
...
.end_amdgpu_metadata
Custom2_Cijk_Ailk_Bljk_HHS_BH_MT16x32x64_MI16x16x16x1_SN_1LDSB0_GRVW2_GSU5_LPB4_LRVW4_MIWT1_1_NTA0_NTB2_NEPBS0_NLCA1_PLR5_SS0_SU0_SUS0_SPO1_SRVW0_SVW2_VW2_WSGRA0_WSGRB0_WG16_8_1_WGM1_M:

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
.set sgprAddressD, 20
.set sgprAddressC, 22
.set sgprAddressA, 24
.set sgprAddressB, 26
.set sgprAlpha, 28
.set sgprBeta, 29
.set sgprStridesD, 30
.set sgprStridesC, 32
.set sgprStridesA, 34
.set sgprStridesB, 36
.set sgprSizesFree, 38
.set sgprSizesSum, 41
.set sgprOrigStaggerUIter, 42
.set sgprNumWorkGroups0, 43
.set sgprNumWorkGroups1, 44
.set sgprGSUSync, 45
.set sgprAddressTC, 46
.set sgprSrdA, 48
.set sgprSrdB, 52
.set sgprShadowLimitA, 10
.set sgprShadowLimitB, 56
.set sgprGlobalReadIncsA, 9
.set sgprGlobalReadIncsB, 42
.set sgprScalarGlobalReadOffsetA, 58
.set sgprScalarGlobalReadOffsetB, 61

//GSUFusion
.set sgprtmp0E, 76
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

.macro GSUSYNC labelname labelendname vgprstart vgprAddrOffset
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
    buffer_load_dwordx4 v[\vgprstart+4*0:\vgprstart+3+4*0], v[\vgprAddrOffset], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_mov_b32 s[sgprGSUSumIdx] 1
    s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*1:\vgprstart+3+4*1], v[\vgprAddrOffset], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 2
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*2:\vgprstart+3+4*2], v[\vgprAddrOffset], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 3
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*3:\vgprstart+3+4*3], v[\vgprAddrOffset], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    //s_mov_b32 s[sgprGSUSumIdx] 4
    //s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
    //s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
    //s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  

    s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo GSU offset to SRD
    s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi GSU offset to SRD
    buffer_load_dwordx4 v[\vgprstart+4*4:\vgprstart+3+4*4], v[\vgprAddrOffset], s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D

    s_waitcnt vmcnt(3)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*1]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*1]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*1]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*1]

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*1+0:\vgprstart+4*1+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*1+2:\vgprstart+4*1+3]

    s_waitcnt vmcnt(2)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*2]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*2]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*2]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*2]

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*2+0:\vgprstart+4*2+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*2+2:\vgprstart+4*2+3]

    s_waitcnt vmcnt(1)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*3]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*3]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*3]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*3]

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*3+0:\vgprstart+4*3+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*3+2:\vgprstart+4*3+3]

    s_waitcnt vmcnt(0)
    //v_add_F32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+0+4*4]
    //v_add_F32 v[\vgprstart+1], v[\vgprstart+1], v[\vgprstart+1+4*4]
    //v_add_F32 v[\vgprstart+2], v[\vgprstart+2], v[\vgprstart+2+4*4]
    //v_add_F32 v[\vgprstart+3], v[\vgprstart+3], v[\vgprstart+3+4*4]

    V_PK_ADD_F32 v[\vgprstart+0:\vgprstart+1], v[\vgprstart+0:\vgprstart+1], v[\vgprstart+4*4+0:\vgprstart+4*4+1]
    V_PK_ADD_F32 v[\vgprstart+2:\vgprstart+3], v[\vgprstart+2:\vgprstart+3], v[\vgprstart+4*4+2:\vgprstart+4*4+3]

.endm

.macro GSUSYNC2 vgprstart vgprAddrOffset
    V_LSHRREV_B32 v[\vgprAddrOffset], 0x1, v[\vgprAddrOffset]
    //v_cvt_f16_f32 v[\vgprstart+0], v[\vgprstart+0]
    //v_cvt_f16_f32 v[\vgprstart+1], v[\vgprstart+1]
    //v_cvt_f16_f32 v[\vgprstart+2], v[\vgprstart+2]
    //v_cvt_f16_f32 v[\vgprstart+3], v[\vgprstart+3]

    //v_pack_b32_f16 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+1]
    //v_pack_b32_f16 v[\vgprstart+1], v[\vgprstart+2], v[\vgprstart+3]

    v_cvt_pkrtz_f16_f32 v[\vgprstart+0], v[\vgprstart+0], v[\vgprstart+1]
    v_cvt_pkrtz_f16_f32 v[\vgprstart+1], v[\vgprstart+2], v[\vgprstart+3]

    //V_LSHRREV_B32 v6, 0x1, v6

    buffer_store_dwordx2 v[\vgprstart:\vgprstart+1], v[\vgprAddrOffset], s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // store D

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
s_load_dwordx16 s[20:35], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x0
s_load_dwordx8 s[36:43], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x40
s_load_dwordx4 s[44:47], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x60

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
s_waitcnt lgkmcnt(0)                               // wait for 112 bytes of kern args
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
s_mov_b32 s70, s[sgprWorkGroup1]                   // copying for divisor
s_mov_b32 s69, 0x0                                 // STATIC_DIV: divisior=5
s_mul_i32 s68, 0x6666, s70                         // tmp1 = dividend * magic hi
s_lshl_b64 s[68:69], s[68:69], 0x10                // left shift 16 bits
s_mul_i32 s[sgprWorkGroup1], s70, 0x6667           // tmp0 = dividend * magic lo
s_add_u32 s68, s[sgprWorkGroup1], s68              // add lo
s_addc_u32 s69, s69, 0x0                           // add hi
s_lshr_b64 s[68:69], s[68:69], 0x21                // tmp1 = (dividend * magic) << shift
s_mov_b32 s[sgprWorkGroup1], s68                   // quotient
s_mul_i32 s68, s[sgprWorkGroup1], 0x5              // quotient*divisor
s_sub_u32 s[sgprGSUSumIdx], s70, s68               // rReg = dividend - quotient*divisor

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
s_mul_hi_u32 s71, s[sgprWorkGroup0], 16            // WorkGroup[01] * MT
s_mul_i32 s70, s[sgprWorkGroup0], 16               // WorkGroup[01] * MT
s_mul_hi_u32 s69, 64, s[sgprGSUSumIdx]             // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_i32 s68, 64, s[sgprGSUSumIdx]                // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_hi_u32 s69, s68, s[sgprStrideAL]             // tlu=1, scaled unroll-offset by stride
s_mul_i32 s68, s68, s[sgprStrideAL]                // tlu=1, scaled unroll-offset by stride
s_add_u32 s70, s70, s68                            // accum GsuOffset term to tilestart
s_addc_u32 s71, s71, s69                           // accum GsuOffset term to tilestart
s_mov_b32 s72, 1                                   // Init tensor size
s_mov_b32 s73, 0                                   // init tensor size
s_sub_u32 s68, s[sgprSizeI], 1                     // (size-1)
s_mul_hi_u32 s69, constStrideA0I, s68              // stride x (size-1)
s_mul_i32 s68, constStrideA0I, s68                 // stride x (size-1)
s_add_u32 s72, s72, s68                            // sum tensor size
s_addc_u32 s73, s73, s69                           // sum tensor size
s_sub_u32 s68, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s69, s[sgprStrideAL], s68             // stride x (size-1)
s_mul_i32 s68, s[sgprStrideAL], s68                // stride x (size-1)
s_add_u32 s72, s72, s68                            // sum tensor size
s_addc_u32 s73, s73, s69                           // sum tensor size
s_sub_u32 s[sgprShadowLimitA+0], s72, s70          // sub tileStart
s_subb_u32 s[sgprShadowLimitA+1], s73, s71         // sub tileStart
s_lshl_b64 s[sgprShadowLimitA:sgprShadowLimitA+1], s[sgprShadowLimitA:sgprShadowLimitA+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitA+0], s[sgprShadowLimitA+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitA+1], s[sgprShadowLimitA+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitA+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdA+2], s[sgprShadowLimitA+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s69, s[sgprStrideAK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s68, s[sgprStrideAK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s70, s70, s68                            // accum wg term to tilestart
s_addc_u32 s71, s71, s69                           // accum wg term to tilestart
s_lshl_b64 s[70:71], s[70:71], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdA+0], s[sgprAddressA+0], s70    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdA+1], s[sgprAddressA+1], s71   // SRD base = Address+ tileStart1
s_mov_b32 s[sgprSrdA+3], Srd127_96                 // Set bits 127_96 in SRD

/* global read addresses: addresses b */
/* max read offset = size[n] * stride[n-1] */
s_mul_hi_u32 s71, s[sgprWorkGroup1], 32            // WorkGroup[01] * MT
s_mul_i32 s70, s[sgprWorkGroup1], 32               // WorkGroup[01] * MT
s_mul_hi_u32 s71, s70, s[sgprStrideB1J]            // tlu=0, scaled tile-offset by stride
s_mul_i32 s70, s70, s[sgprStrideB1J]               // tlu=0, scaled tile-offset by stride
s_mul_hi_u32 s69, 64, s[sgprGSUSumIdx]             // gsuOffset = DepthU*bpe*GSUSumIdx
s_mul_i32 s68, 64, s[sgprGSUSumIdx]                // gsuOffset = DepthU*bpe*GSUSumIdx
s_add_u32 s70, s70, s68                            // accum GsuOffset term to tilestart
s_addc_u32 s71, s71, s69                           // accum GsuOffset term to tilestart
s_mov_b32 s72, 1                                   // Init tensor size
s_mov_b32 s73, 0                                   // init tensor size
s_sub_u32 s68, s[sgprSizeL], 1                     // (size-1)
s_mul_hi_u32 s69, constStrideBL, s68               // stride x (size-1)
s_mul_i32 s68, constStrideBL, s68                  // stride x (size-1)
s_add_u32 s72, s72, s68                            // sum tensor size
s_addc_u32 s73, s73, s69                           // sum tensor size
s_sub_u32 s68, s[sgprSizeJ], 1                     // (size-1)
s_mul_hi_u32 s69, s[sgprStrideB1J], s68            // stride x (size-1)
s_mul_i32 s68, s[sgprStrideB1J], s68               // stride x (size-1)
s_add_u32 s72, s72, s68                            // sum tensor size
s_addc_u32 s73, s73, s69                           // sum tensor size
s_sub_u32 s[sgprShadowLimitB+0], s72, s70          // sub tileStart
s_subb_u32 s[sgprShadowLimitB+1], s73, s71         // sub tileStart
s_lshl_b64 s[sgprShadowLimitB:sgprShadowLimitB+1], s[sgprShadowLimitB:sgprShadowLimitB+1], 0x1 // Set limit to use bytes
s_add_u32 s[sgprShadowLimitB+0], s[sgprShadowLimitB+0], 4 // extend limit for pre-pad
s_addc_u32 s[sgprShadowLimitB+1], s[sgprShadowLimitB+1], 0 // extend limit for pre-pad
s_cmp_eq_u32 s[sgprShadowLimitB+1], 0              // are we within 2^32?
s_cselect_b32 s[sgprSrdB+2], s[sgprShadowLimitB+0], BufferLimit // Move shadow to real if we are within 2^32
s_mul_hi_u32 s69, s[sgprStrideBK], s[sgprWorkGroup2] // Stride*WG
s_mul_i32 s68, s[sgprStrideBK], s[sgprWorkGroup2]  // Stride*WG
s_add_u32 s70, s70, s68                            // accum wg term to tilestart
s_addc_u32 s71, s71, s69                           // accum wg term to tilestart
s_lshl_b64 s[70:71], s[70:71], 0x1                 // tileStart *= BPE
s_add_u32 s[sgprSrdB+0], s[sgprAddressB+0], s70    // SRD base = Address+ tileStart0
s_addc_u32 s[sgprSrdB+1], s[sgprAddressB+1], s71   // SRD base = Address+ tileStart1
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
s_add_u32 s68, 1, s[sgprLoopCounterL]              // tmp<-numIterMyWg+
s_cmp_lt_u32 s[sgprGSUSumIdx], s[sgprGSUSumIdx+1]  // gsuSumIdx < numIterPerWgRemainder
s_cmov_b32 s[sgprLoopCounterL], s68                // numIterMyWg++ if needed
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


s_mul_i32 s70, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
s_mul_hi_u32 s69, s70, s[sgprStrideC1J]            // ScaleC s70 by Stride
s_mul_i32 s68, s70, s[sgprStrideC1J]               // ScaleC s70 by Stride
s_lshl_b64 s[68:69], s[68:69], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprAddressC+0], s68    // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprAddressC+1], s69   // add hi to SRD
s_mul_hi_u32 s69, s70, s[sgprStrideD1J]            // ScaleD s70 by Stride
s_mul_i32 s68, s70, s[sgprStrideD1J]               // ScaleD s70 by Stride
s_lshl_b64 s[68:69], s[68:69], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprAddressD+0], s68    // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprAddressD+1], s69   // add hi to SRD

s_mul_hi_u32 s69, s[sgprWorkGroup2], s[sgprStrideCK] // ScaleC s[sgprWorkGroup2] by Stride
s_mul_i32 s68, s[sgprWorkGroup2], s[sgprStrideCK]  // ScaleC s[sgprWorkGroup2] by Stride
s_lshl_b64 s[68:69], s[68:69], 1                   // scale by bpe
s_add_u32 s[sgprSrdC+0], s[sgprSrdC+0], s68        // add lo to SRD
s_addc_u32 s[sgprSrdC+1], s[sgprSrdC+1], s69       // add hi to SRD
s_mul_hi_u32 s69, s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
s_mul_i32 s68, s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
s_lshl_b64 s[68:69], s[68:69], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s68        // add lo to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s69       // add hi to SRD

// GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
s_mul_hi_u32 s69, s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
s_mul_i32 s68, s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
s_sub_u32 s72, s[sgprSizesFree+1], 1               // Free1
s_mul_i32 s72, s72, s[sgprGSUSumIdx]               // Free1
s_mul_hi_u32 s71, s72, s[sgprStrideC1J]            // Free1
s_mul_i32 s70, s72, s[sgprStrideC1J]               // Free1
s_add_u32 s68, s68, s70                            // Free1
s_addc_u32 s69, s69, s71                           // Free1
s_sub_u32 s72, s[sgprSizesFree+2], 1               // Free2
s_mul_i32 s72, s72, s[sgprGSUSumIdx]               // Free2
s_mul_hi_u32 s71, s72, s[sgprStrideCK]             // Free2
s_mul_i32 s70, s72, s[sgprStrideCK]                // Free2
s_add_u32 s68, s68, s70                            // Free2
s_addc_u32 s69, s69, s71                           // Free2
s_lshl_b64 s[68:69], s[68:69], 2                   // scale by bpe
s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s68        // add lo GSU offset to SRD
s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s69       // add hi GSU offset to SRD

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
s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
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
s_cbranch_scc0 label_NoBranch_KWKAD3HR8P7QRPKT_0   // Only branch on scc1
s_getpc_b64 s[68:69]                               // addr of next instr
s_add_i32 s70, label_PrefetchGlobalLastIterEnd, 0x4 // target branch offset
s_add_u32 s68, s68, s70                            // add target branch offset
s_addc_u32 s69, s69, 0                             // add high and carry
s_setpc_b64 s[68:69]                               // branch to label_PrefetchGlobalLastIterEnd
label_NoBranch_KWKAD3HR8P7QRPKT_0:
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
s_mov_b32 s68, 0x200                               // inc
v_add_co_u32 v[vgprLocalReadAddrA], vcc, s68, v[vgprLocalReadAddrA] // lrA += 512 (LSU*(MT+PAD)*bpe)

/* local read inc b */
s_mov_b32 s68, 0x20                                // inc
v_add_co_u32 v[vgprLocalReadAddrB], vcc, s68, v[vgprLocalReadAddrB] // lrB += 32 (LSU*bpe)
s_waitcnt lgkmcnt(0)                               // 4wait for local read
v_or_b32 v[vgprValuA_X0_I0+0], v[vgprValuA_X0_I0+0], v35 // pack two half Vgpr to one Vgpr
v_or_b32 v[vgprValuA_X0_I0+1], v[vgprValuA_X0_I0+1], v36 // pack two half Vgpr to one Vgpr
v_and_b32 v35, 63, v[vgprSerial]                   // v35 = v[vgprSerial] % 64
v_lshrrev_b32 v35, 4, v35                          // v35 = v35 / 16
v_lshlrev_b32 v35, 0x2, v35                        // v35 = v35 * 4
v_cmp_ge_i32 s[68:69], v35, s[sgprLoopCounterL]    // check K index >= Size L
v_cndmask_b32 v[vgprValuA_X0_I0+0+0], v[vgprValuA_X0_I0+0+0], 0x0, s[68:69] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+0], v[vgprValuB_X0_I0+0+0], 0x0, s[68:69] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuA_X0_I0+0+1], v[vgprValuA_X0_I0+0+1], 0x0, s[68:69] // set 0 if K_idx >= sizeL
v_cndmask_b32 v[vgprValuB_X0_I0+0+1], v[vgprValuB_X0_I0+0+1], 0x0, s[68:69] // set 0 if K_idx >= sizeL
v_sub_u32 v35, s[sgprLoopCounterL], v35            // get distance between size and k index
v_cmp_lt_i32 s[68:69], v35, 4                      // set partial 0 if distance less than input per thread
s_and_b32 s70, s[sgprLoopCounterL], 3              // get inputs for edge thread
s_sub_u32 s70, 4, s70                              // use shift to fill 0 for outside element
s_lshl_b32 s70, s70, 4                             // use shift to fill 0 for outside element
v_lshlrev_b64 v[36:37], s70, v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+0], v[vgprValuA_X0_I0+0+0+0+0], v36, s[68:69]
v_cndmask_b32 v[vgprValuA_X0_I0+0+0+0+1], v[vgprValuA_X0_I0+0+0+0+1], v37, s[68:69]
v_lshlrev_b64 v[36:37], s70, v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+0], v[vgprValuB_X0_I0+0+0+0+0], v36, s[68:69]
v_cndmask_b32 v[vgprValuB_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0+1], v37, s[68:69]
s_nop 1
v_mfma_f32_16x16x16f16 acc[0:3], v[vgprValuA_X0_I0+0+0+0:vgprValuA_X0_I0+0+0+0+1], v[vgprValuB_X0_I0+0+0+0:vgprValuB_X0_I0+0+0+0+1], acc[0:3] // left value = acc[0+0:3+0]

/* closeLoop loopL finalLoop=1 tailLoop=1 */
s_sub_i32 s[sgprLoopCounterL], s[sgprLoopCounterL], 0x10 // dec counterL (tailLoop)
s_add_u32 s[sgprOrigLoopCounter], s[sgprOrigLoopCounter], 0x10 // inc counterL
s_cmp_le_i32 s[sgprLoopCounterL], 0x0              // counterL<=0
s_cbranch_scc0 label_TailLoopBeginL                // restart LoopL
label_TailLoopEndL:
label_SkipTailLoopL:
label_Summation_End_4JY0LG1LB5BQ6NUD_0:
s_setprio 0                                        // optimization store
/* endSummation: add vgpr [0...32) to pool */
.set SrdA, UNDEF
.set SrdB, UNDEF
.set ShadowLimitB, UNDEF
.set ScalarGlobalReadOffsetA, UNDEF
.set ScalarGlobalReadOffsetB, UNDEF
/* load store sgprs */

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
s_mul_i32 s48, 16, s[sgprWorkGroup0]               // wgp0 * MT0
v_add_u32 v0, s48, v0                              // coord 0 = (tid0/MI_m)*4 + waveG0*MIB_m + MT0*SG0
s_mul_i32 s48, 32, s[sgprWorkGroup1]               // wgp1 * MT1
v_add_u32 v1, s48, v1                              // coord 1 = (tid0%MI_m) + waveG1*MIB_n + MT1*SG1

/* not-LocalSplitU: global write */

/******************************************/
/* Global Write Elements                  */
/******************************************/
s_and_b32 s48, 15, s[sgprSizeI]                    // s48 = s[sgprSizeI] % 16
s_add_u32 s49, -0x1, s[sgprNumWorkGroups0]
s_cmp_ge_u32 s[sgprWorkGroup0], s49                // wg0 >= nwg0-1 ?
s_cselect_b32 s48, s48, 0                          // set rMT0
s_cmpk_gt_u32 s48, 0x0                             // rMT0 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
s_and_b32 s48, 31, s[sgprSizeJ]                    // s48 = s[sgprSizeJ] % 32
s_add_u32 s49, -0x1, s[sgprNumWorkGroups1]
s_cmp_ge_u32 s[sgprWorkGroup1], s49                // wg1 >= nwg1-1
s_cselect_b32 s48, s48, 0                          // set rMT1
s_cmpk_gt_u32 s48, 0x0                             // rMT1 > 0
s_cbranch_scc1 label_GW_B0_E1                      // jump if edges required
label_GW_B0_E0:

/* edge=0, allocate 2 sgpr. perBatchTmpS=2 perBatchMaskS=0 perElementMaskS=0 elementsPerBatch=56 */
/* optSingleColVgpr=1 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Mask optSrdIncForRow=1 */

/******************************************/
/* Global Write Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_lshl_u32 v6, v3, v0, 0x2                     // optSingleColVgpr scaleToBpe: sharedAddrVgpr <- cinRowPtr + coord0, scaled by BPE. BSHERE:coord0=0, coord0Vgpr=0
v_accvgpr_read_b32 v[vgprValuC+8], acc0            // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+9], acc1            // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+10], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+11], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */

/* apply mask, calc new C and issue writes */
buffer_store_dwordx2 v[8:9], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
buffer_store_dwordx2 v[10:11], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:8 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC label_BUSYWAIT1 label_GW_End 8 6

////Victor
//label_BUSYWAIT1:
//s_mov_b32 s[sgprGSUSync], 0
//s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//s_waitcnt 0
//s_cmp_ge_u32 s[sgprGSUSync], MT0/MT1                    // Beta == 0
//s_cbranch_scc0 label_BUSYWAIT1           // jump if XX required
//
//s_mov_b32 s[sgprGSUSync] 1
//
//s_mov_b32 s[sgprtmp0E], s[sgprGSUSumIdx]
//s_lshl_b32 s[sgprtmp0E], s[sgprtmp0E], 2
//
////s_mul_hi_u32 s[sgprtmp1E], s[sgprGSUSumIdx], 0x4            // ScaleC s62 by Stride
////s_mul_i32 s[sgprtmp0E], s[sgprGSUSumIdx], 0x4               // ScaleC s62 by Stride
//
////s_lshl_b64 s[sgprtmp0E:sgprtmp0E+1], s[sgprtmp0E:sgprtmp0E+1], 2                   // scale by bpe
//
//s_mul_hi_u32 s[sgprtmp3E], s[sgprStrideCK], GSU            // ScaleC s62 by Stride
//s_mul_i32 s[sgprtmp2E], s[sgprStrideCK], GSU               // ScaleC s62 by Stride
//s_lshl_b64 s[sgprtmp2E:sgprtmp2E+1], s[sgprtmp2E:sgprtmp2E+1], 2                   // scale by bpe
//
//s_mov_b32 s[sgprSrdDd+2], 0x80000000
//s_mov_b32 s[sgprSrdDd+3], Srd127_96                 // Set bits 127_96 in post-loop SRD
//
//s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp2E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp3E]   // add hi to SRD
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], 0   // add hi to SRD
//
//s_buffer_atomic_add s[sgprGSUSync], s[sgprSrdDd:sgprSrdDd+3], offset:0 glc
//s_waitcnt lgkmcnt(0)
//s_waitcnt 0
//
//s_cmp_ge_u32 s[sgprGSUSync], GSU*MT0/MT1-1                // s[Alpha] == 0.0f ?
//s_cbranch_scc0 label_AFTERsummary
////Victor
//
////GSUFusion
///*
//s_mov_b32 s[sgprtmp0E], 1
//s_atomic_add s[sgprtmp0E], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//
//label_BUSYWAIT:
//s_mov_b32 s[sgprtmp0E], 0
//s_atomic_add s[sgprtmp0E], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//
//s_cmp_eq_u32 s[sgprGSUSumIdx], GSU-1            // WG0
//s_cbranch_scc0 label_AFTERsummary           // jump if XX required
//
//s_waitcnt 0
//s_cmp_ge_u32 s[sgprtmp0E], 440                    // Beta == 0
//s_cbranch_scc0 label_BUSYWAIT           // jump if XX required
//*/
//s_mov_b32 s[sgprSrdDd+2], s[sgprSrdD+2]
//s_mov_b32 s[sgprSrdDd+3], s[sgprSrdD+3]
//
//s_mov_b32 s[sgprGSUSumIdx] 1
//s_mul_i32 s[sgprtmp2E], MT1, s[sgprWorkGroup1]              // <- wg1*MT1
//s_mul_hi_u32 s[sgprtmp1E], s[sgprtmp2E], s[sgprStrideD1J]            // ScaleD s64 by Stride
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprStrideD1J]               // ScaleD s64 by Stride
//s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp0E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp1E]   // add hi to SRD
//
//s_mul_hi_u32 s[sgprtmp1E], s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
//s_mul_i32 s[sgprtmp0E], s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
//s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi to SRD
//
//s_mov_b32 s[sgprSrdD+0], s[sgprSrdDd+0]
//s_mov_b32 s[sgprSrdD+1], s[sgprSrdDd+1]
//
//// GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
//s_mul_hi_u32 s[sgprtmp1E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp0E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
//s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+1], 1               // Free1
//s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free1
//s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideC1J]            // Free1
//s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideC1J]               // Free1
//s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free1
//s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free1
//s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+2], 1               // Free2
//s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free2
//s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideCK]             // Free2
//s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideCK]                // Free2
//s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free2
//s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free2
//s_lshl_b64 s[sgprtmp2E:sgprtmp3E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//
//s_mov_b32 s[sgprGSUSumIdx] 0
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[8:11], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 1
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[12:15], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 2
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[16:19], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 3
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[20:23], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 4
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[24:27], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_waitcnt vmcnt(3)
//v_add_F32 v8, v8, v12
//v_add_F32 v9, v9, v13
//v_add_F32 v10, v10, v14
//v_add_F32 v11, v11, v15
//
//s_waitcnt vmcnt(2)
//v_add_F32 v8, v8, v16
//v_add_F32 v9, v9, v17
//v_add_F32 v10, v10, v18
//v_add_F32 v11, v11, v19
//
//s_waitcnt vmcnt(1)
//v_add_F32 v8, v8, v20
//v_add_F32 v9, v9, v21
//v_add_F32 v10, v10, v22
//v_add_F32 v11, v11, v23
//
//s_waitcnt vmcnt(0)
//v_add_F32 v8, v8, v24
//v_add_F32 v9, v9, v25
//v_add_F32 v10, v10, v26
//v_add_F32 v11, v11, v27
//
v_mul_f32 v8 v8 s[sgprAlpha]
v_mul_f32 v9 v9 s[sgprAlpha]
v_mul_f32 v10 v10 s[sgprAlpha]
v_mul_f32 v11 v11 s[sgprAlpha]
//
//V_LSHRREV_B32 v6, 0x1, v6
//
//s_cmpk_eq_u32 s[sgprBeta], 0x0                // s[Alpha] == 0.0f ?
//s_cbranch_vccnz label_BetaZero                  // branch if s[Alpha] != 0
//
//s_mov_b32 s[sgprSrdD+0], s[sgprAddressTC+0]         // init SRD base address (lower)
//s_mov_b32 s[sgprSrdD+1], s[sgprAddressTC+1]         // init SRD base address (upper) + other fields
//s_mov_b32 s[sgprSrdD+2], 0x80000000
//s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD
//
//s_mul_i32 s62, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
//s_mul_hi_u32 s61, s62, s[sgprStrideC1J]            // ScaleC s62 by Stride
//s_mul_i32 s60, s62, s[sgprStrideC1J]               // ScaleC s62 by Stride
//s_lshl_b64 s[60:61], s[60:61], 1                   // scale by bpe
//s_add_u32 s[sgprSrdD+0], s[sgprAddressTC+0], s60    // add lo to SRD
//s_addc_u32 s[sgprSrdD+1], s[sgprAddressTC+1], s61   // add hi to SRD
//
//s_mul_hi_u32 s61, s[sgprWorkGroup2], s[sgprStrideCK] // ScaleC s[sgprWorkGroup2] by Stride
//s_mul_i32 s60, s[sgprWorkGroup2], s[sgprStrideCK]  // ScaleC s[sgprWorkGroup2] by Stride
//s_lshl_b64 s[60:61], s[60:61], 1                   // scale by bpe
//s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s60        // add lo to SRD
//s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s61       // add hi to SRD
//
////s_mov_b32 s[sgprSrdD+0], s[sgprAddressTC+0]         // init SRD base address (lower)
////s_mov_b32 s[sgprSrdD+1], s[sgprAddressTC+1]         // init SRD base address (upper) + other fields
////s_mov_b32 s[sgprSrdD+2], s[sgprSrdC+2]
////s_mov_b32 s[sgprSrdD+3], s[sgprSrdC+3]         // Set bits 127_96 in post-loop SRD
//
////V_LSHRREV_B32 v6, 0x1, v6
//
//buffer_load_sshort v[32], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
//buffer_load_sshort v[33], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:2 // store D
//buffer_load_sshort v[34], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:4 // store D
//buffer_load_sshort v[35], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:6 // store D
//
//s_waitcnt vmcnt(0)
//
//v_cvt_f32_f16 v32, v32
//v_cvt_f32_f16 v33, v33
//v_cvt_f32_f16 v34, v34
//v_cvt_f32_f16 v35, v35
//
//v_mul_f32 v32 v32 s[sgprBeta]
//v_mul_f32 v33 v33 s[sgprBeta]
//v_mul_f32 v34 v34 s[sgprBeta]
//v_mul_f32 v35 v35 s[sgprBeta]
//
//v_add_F32 v8, v8, v32
//v_add_F32 v9, v9, v33
//v_add_F32 v10, v10, v34
//v_add_F32 v11, v11, v35
//
//label_BetaZero:
//
//v_cvt_f16_f32 v8, v8
//v_cvt_f16_f32 v9, v9
//v_cvt_f16_f32 v10, v10
//v_cvt_f16_f32 v11, v11
//
//v_pack_b32_f16 v8, v8, v9
//v_pack_b32_f16 v9, v10, v11
////V_LSHRREV_B32 v6, 0x1, v6
//
//buffer_store_dwordx2 v[8:9], v6, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // store D
//
//s_branch label_GW_End
//
//label_AFTERsummary:
////GSUFusion

GSUSYNC2 8 6

s_branch label_GW_End                              // jump to end
label_GW_B0_E1:

/* edge=1, allocate 6 sgpr. perBatchTmpS=4 perBatchMaskS=2 perElementMaskS=0 elementsPerBatch=36 */
/* optSingleColVgpr=0 optSharedColVgpr=0 optSGPRUsage=BufferLoad_Edge_Mask optSrdIncForRow=0 */

/******************************************/
/* Global Write Edge Batch #0 (d1,d0,vc1,vc0) = */
/*    (0,0,0,0:vw2); (0,0,0,2:vw2)        */
/******************************************/

/* calc coords, apply mask, and issue loads (if necessary) */
/* (d1,vc1,d0,vc0)=(0,0,0,0) */
v_cmp_lt_u32 s[48:49], v0, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[52:53], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[52:53], s[48:49], s[52:53]             // in0 && in1
v_add_lshl_u32 v6, v3, v0, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v6, -1, v6, s[52:53]                 // LDD clip if OOB. offset
/* (d1,vc1,d0,vc0)=(0,0,0,2) */
v_add_co_u32 v4, vcc, v0, 2                        // coord0.1: coord0 += d0*sg0*VW + vc0
v_cmp_lt_u32 s[48:49], v4, s[sgprSizeI]            // coord0 < size0
v_cmp_lt_u32 s[52:53], v1, s[sgprSizeJ]            // coord1 < size1
s_and_b64 s[52:53], s[48:49], s[52:53]             // in0 && in1
v_add_lshl_u32 v7, v3, v4, 0x2                     // scaleToBpe: accumulate d0 lower and *= bpe into Cin addr
v_cndmask_b32 v7, -1, v7, s[52:53]                 // LDD clip if OOB. offset
v_accvgpr_read_b32 v[vgprValuC+8], acc0            // copy acc to vreg[0]
v_accvgpr_read_b32 v[vgprValuC+9], acc1            // copy acc to vreg[1]
v_accvgpr_read_b32 v[vgprValuC+10], acc2           // copy acc to vreg[2]
v_accvgpr_read_b32 v[vgprValuC+11], acc3           // copy acc to vreg[3]
s_nop 1                                            // 2 wait states required before reading vgpr

/* rC *= alpha batchElements=[(0, 0, 0, 0), (0, 0, 0, 2)] */

/* apply mask, calc new C and issue writes */
buffer_store_dwordx2 v[8:9], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
buffer_store_dwordx2 v[10:11], v7, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
s_nop 0                                            // 1 wait state required when next inst writes vgprs held by previous dwordx4 store inst

GSUSYNC label_BUSYWAIT1_EDGE label_GW_End 8 6

////Victor
//label_BUSYWAIT1_EDGE:
//s_mov_b32 s[sgprGSUSync], 0
//s_atomic_add s[sgprGSUSync], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//s_waitcnt 0
//s_cmp_ge_u32 s[sgprGSUSync], MT0/MT1                    // Beta == 0
//s_cbranch_scc0 label_BUSYWAIT1_EDGE           // jump if XX required
//
//s_mov_b32 s[sgprGSUSync] 1
//
//s_mov_b32 s[sgprtmp0E], s[sgprGSUSumIdx]
//s_lshl_b32 s[sgprtmp0E], s[sgprtmp0E], 2
//
////s_mul_hi_u32 s[sgprtmp1E], s[sgprGSUSumIdx], 0x4            // ScaleC s62 by Stride
////s_mul_i32 s[sgprtmp0E], s[sgprGSUSumIdx], 0x4               // ScaleC s62 by Stride
//
////s_lshl_b64 s[sgprtmp0E:sgprtmp0E+1], s[sgprtmp0E:sgprtmp0E+1], 2                   // scale by bpe
//
//s_mul_hi_u32 s[sgprtmp3E], s[sgprStrideCK], GSU            // ScaleC s62 by Stride
//s_mul_i32 s[sgprtmp2E], s[sgprStrideCK], GSU               // ScaleC s62 by Stride
//s_lshl_b64 s[sgprtmp2E:sgprtmp2E+1], s[sgprtmp2E:sgprtmp2E+1], 2                   // scale by bpe
//
//s_mov_b32 s[sgprSrdDd+2], 0x80000000
//s_mov_b32 s[sgprSrdDd+3], Srd127_96                 // Set bits 127_96 in post-loop SRD
//
//s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp2E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp3E]   // add hi to SRD
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], 0   // add hi to SRD
//
//s_buffer_atomic_add s[sgprGSUSync], s[sgprSrdDd:sgprSrdDd+3], offset:0 glc
//s_waitcnt lgkmcnt(0)
//s_waitcnt 0
//
//s_cmp_ge_u32 s[sgprGSUSync], GSU*MT0/MT1-1                // s[Alpha] == 0.0f ?
//s_cbranch_scc0 label_AFTERsummary_EDGE
////Victor
//
////GSUFusion
///*
//s_mov_b32 s[sgprtmp0E], 1
//s_atomic_add s[sgprtmp0E], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//
//label_BUSYWAIT_EDGE:
//s_mov_b32 s[sgprtmp0E], 0
//s_atomic_add s[sgprtmp0E], s[sgprKernArgAddress:sgprKernArgAddress+1], 0x64 glc
//
//s_cmp_eq_u32 s[sgprGSUSumIdx], GSU-1            // WG0
//s_cbranch_scc0 label_AFTERsummary_EDGE           // jump if XX required
//
//s_waitcnt 0
//s_cmp_ge_u32 s[sgprtmp0E], 440                    // Beta == 0
//s_cbranch_scc0 label_BUSYWAIT_EDGE           // jump if XX required
//*/
//s_mov_b32 s[sgprSrdDd+2], s[sgprSrdD+2]
//s_mov_b32 s[sgprSrdDd+3], s[sgprSrdD+3]
//
//s_mov_b32 s[sgprGSUSumIdx] 1
//s_mul_i32 s[sgprtmp2E], MT1, s[sgprWorkGroup1]              // <- wg1*MT1
//s_mul_hi_u32 s[sgprtmp1E], s[sgprtmp2E], s[sgprStrideD1J]            // ScaleD s64 by Stride
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprStrideD1J]               // ScaleD s64 by Stride
//s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//s_add_u32 s[sgprSrdDd+0], s[sgprAddressD+0], s[sgprtmp0E]    // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprAddressD+1], s[sgprtmp1E]   // add hi to SRD
//
//s_mul_hi_u32 s[sgprtmp1E], s[sgprWorkGroup2], s[sgprStrideDK] // ScaleD s[sgprWorkGroup2] by Stride
//s_mul_i32 s[sgprtmp0E], s[sgprWorkGroup2], s[sgprStrideDK]  // ScaleD s[sgprWorkGroup2] by Stride
//s_lshl_b64 s[sgprtmp0E:sgprtmp1E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdDd+0], s[sgprtmp0E]        // add lo to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdDd+1], s[sgprtmp1E]       // add hi to SRD
//
//s_mov_b32 s[sgprSrdD+0], s[sgprSrdDd+0]
//s_mov_b32 s[sgprSrdD+1], s[sgprSrdDd+1]
//
//// GSU Output Buffer offset: Free0 + (Free1-1)*StrideC1J + (Free2-1)*StrideCK * GSUIdx * bpe%s
//s_mul_hi_u32 s[sgprtmp1E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp0E], s[sgprSizesFree+0], s[sgprGSUSumIdx] // Free0
//s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+1], 1               // Free1
//s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free1
//s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideC1J]            // Free1
//s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideC1J]               // Free1
//s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free1
//s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free1
//s_sub_u32 s[sgprtmp5E], s[sgprSizesFree+2], 1               // Free2
//s_mul_i32 s[sgprtmp5E], s[sgprtmp5E], s[sgprGSUSumIdx]               // Free2
//s_mul_hi_u32 s[sgprtmp3E], s[sgprtmp5E], s[sgprStrideCK]             // Free2
//s_mul_i32 s[sgprtmp2E], s[sgprtmp5E], s[sgprStrideCK]                // Free2
//s_add_u32 s[sgprtmp0E], s[sgprtmp0E], s[sgprtmp2E]                            // Free2
//s_addc_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp3E]                           // Free2
//s_lshl_b64 s[sgprtmp2E:sgprtmp3E], s[sgprtmp0E:sgprtmp1E], 2                   // scale by bpe
//
//s_mov_b32 s[sgprGSUSumIdx] 0
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[8:11], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 1
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[12:15], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 2
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[16:19], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 3
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[20:23], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_mov_b32 s[sgprGSUSumIdx] 4
//s_mul_i32 s[sgprtmp0E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_hi_u32 s[sgprtmp5E], s[sgprtmp2E], s[sgprGSUSumIdx] // Free0
//s_mul_i32 s[sgprtmp1E], s[sgprtmp3E], s[sgprGSUSumIdx] // Free0
//s_add_u32 s[sgprtmp1E], s[sgprtmp1E], s[sgprtmp5E]  
//
//s_add_u32 s[sgprSrdDd+0], s[sgprSrdD+0], s[sgprtmp0E]        // add lo GSU offset to SRD
//s_addc_u32 s[sgprSrdDd+1], s[sgprSrdD+1], s[sgprtmp1E]       // add hi GSU offset to SRD
//buffer_load_dwordx4 v[24:27], v6, s[sgprSrdDd:sgprSrdDd+3], 0 offen offset:0 // store D
//
//s_waitcnt vmcnt(3)
//v_add_F32 v8, v8, v12
//v_add_F32 v9, v9, v13
//v_add_F32 v10, v10, v14
//v_add_F32 v11, v11, v15
//
//s_waitcnt vmcnt(2)
//v_add_F32 v8, v8, v16
//v_add_F32 v9, v9, v17
//v_add_F32 v10, v10, v18
//v_add_F32 v11, v11, v19
//
//s_waitcnt vmcnt(1)
//v_add_F32 v8, v8, v20
//v_add_F32 v9, v9, v21
//v_add_F32 v10, v10, v22
//v_add_F32 v11, v11, v23
//
//s_waitcnt vmcnt(0)
//v_add_F32 v8, v8, v24
//v_add_F32 v9, v9, v25
//v_add_F32 v10, v10, v26
//v_add_F32 v11, v11, v27
//
v_mul_f32 v8 v8 s[sgprAlpha]
v_mul_f32 v9 v9 s[sgprAlpha]
v_mul_f32 v10 v10 s[sgprAlpha]
v_mul_f32 v11 v11 s[sgprAlpha]
//
//V_LSHRREV_B32 v6, 0x1, v6
//
//s_cmpk_eq_u32 s[sgprBeta], 0x0                // s[Alpha] == 0.0f ?
//s_cbranch_vccnz label_BetaZero_EDGE                  // branch if s[Alpha] != 0
//
//s_mov_b32 s[sgprSrdD+0], s[sgprAddressTC+0]         // init SRD base address (lower)
//s_mov_b32 s[sgprSrdD+1], s[sgprAddressTC+1]         // init SRD base address (upper) + other fields
//s_mov_b32 s[sgprSrdD+2], 0x80000000
//s_mov_b32 s[sgprSrdD+3], Srd127_96                 // Set bits 127_96 in post-loop SRD
//
//s_mul_i32 s62, MT1, s[sgprWorkGroup1]              // <- wg1*MT1
//s_mul_hi_u32 s61, s62, s[sgprStrideC1J]            // ScaleC s62 by Stride
//s_mul_i32 s60, s62, s[sgprStrideC1J]               // ScaleC s62 by Stride
//s_lshl_b64 s[60:61], s[60:61], 1                   // scale by bpe
//s_add_u32 s[sgprSrdD+0], s[sgprAddressTC+0], s60    // add lo to SRD
//s_addc_u32 s[sgprSrdD+1], s[sgprAddressTC+1], s61   // add hi to SRD
//
//s_mul_hi_u32 s61, s[sgprWorkGroup2], s[sgprStrideCK] // ScaleC s[sgprWorkGroup2] by Stride
//s_mul_i32 s60, s[sgprWorkGroup2], s[sgprStrideCK]  // ScaleC s[sgprWorkGroup2] by Stride
//s_lshl_b64 s[60:61], s[60:61], 1                   // scale by bpe
//s_add_u32 s[sgprSrdD+0], s[sgprSrdD+0], s60        // add lo to SRD
//s_addc_u32 s[sgprSrdD+1], s[sgprSrdD+1], s61       // add hi to SRD
//
////s_mov_b32 s[sgprSrdD+0], s[sgprAddressTC+0]         // init SRD base address (lower)
////s_mov_b32 s[sgprSrdD+1], s[sgprAddressTC+1]         // init SRD base address (upper) + other fields
////s_mov_b32 s[sgprSrdD+2], s[sgprSrdC+2]
////s_mov_b32 s[sgprSrdD+3], s[sgprSrdC+3]         // Set bits 127_96 in post-loop SRD
//
////V_LSHRREV_B32 v6, 0x1, v6
//
//buffer_load_sshort v[32], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:0 // store D
//buffer_load_sshort v[33], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:2 // store D
//buffer_load_sshort v[34], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:4 // store D
//buffer_load_sshort v[35], v6, s[sgprSrdD:sgprSrdD+3], 0 offen offset:6 // store D
//
//s_waitcnt vmcnt(0)
//
//v_cvt_f32_f16 v32, v32
//v_cvt_f32_f16 v33, v33
//v_cvt_f32_f16 v34, v34
//v_cvt_f32_f16 v35, v35
//
//v_mul_f32 v32 v32 s[sgprBeta]
//v_mul_f32 v33 v33 s[sgprBeta]
//v_mul_f32 v34 v34 s[sgprBeta]
//v_mul_f32 v35 v35 s[sgprBeta]
//
//v_add_F32 v8, v8, v32
//v_add_F32 v9, v9, v33
//v_add_F32 v10, v10, v34
//v_add_F32 v11, v11, v35
//
//label_BetaZero_EDGE:
//
//v_cvt_f16_f32 v8, v8
//v_cvt_f16_f32 v9, v9
//v_cvt_f16_f32 v10, v10
//v_cvt_f16_f32 v11, v11
//
//v_pack_b32_f16 v8, v8, v9
//v_pack_b32_f16 v9, v10, v11
////V_LSHRREV_B32 v6, 0x1, v6
//
//buffer_store_dwordx2 v[8:9], v6, s[sgprSrdC:sgprSrdC+3], 0 offen offset:0 // store D
//
//s_branch label_GW_End
//
//label_AFTERsummary_EDGE:
////GSUFusion

GSUSYNC2 8 6

s_branch label_GW_End                              // jump to end
label_GW_End:
label_KernelEnd:
s_endpgm                                           // Kernel End
