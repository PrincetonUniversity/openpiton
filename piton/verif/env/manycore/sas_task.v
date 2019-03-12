// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sas_task.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
//
// ========== Copyright Header End ============================================
//
//define special register
`include "tlu.h"
`define MONITOR_SIGNAL                 155
`define FLOAT_X                        154
`define FLOAT_I                        153
`define REG_WRITE_BACK                 152
`define     PC                         32
`define     NPC                        33
`define     Y                          34
`define     CCR                        35
`define     FPRS                       36
`define     FSR                        37
`define     ASI                        38
`define     TICK_SAS                   39
`define     GSR                        40
`define     TICK_CMPR                  41
`define     STICK                      42
`define     STICK_CMPR                 43
`define     PSTATE_SAS                 44
`define     TL_SAS                     45
`define     PIL_SAS                    46

`define     TPC1                       47
`define     TPC2                       48
`define     TPC3                       49
`define     TPC4                       50
`define     TPC5                       51
`define     TPC6                       52

`define     TNPC1                      57
`define     TNPC2                      58
`define     TNPC3                      59
`define     TNPC4                      60
`define     TNPC5                      61
`define     TNPC6                      62

`define     TSTATE1                    67
`define     TSTATE2                    68
`define     TSTATE3                    69
`define     TSTATE4                    70
`define     TSTATE5                    71
`define     TSTATE6                    72

`define     TT1                        77
`define     TT2                        78
`define     TT3                        79
`define     TT4                        80
`define     TT5                        81
`define     TT6                        82
`define     TBA_SAS                    87
`define     VER                        88
`define     CWP                        89
`define     CANSAVE                    90
`define     CANRESTORE                 91
`define     OTHERWIN                   92
`define     WSTATE                     93
`define     CLEANWIN                   94
`define     SOFTINT                    95
`define     ECACHE_ERROR_ENABLE        96
`define     ASYNCHRONOUS_FAULT_STATUS  97
`define     ASYNCHRONOUS_FAULT_ADDRESS 98
`define     OUT_INTR_DATA0             99
`define     OUT_INTR_DATA1             100
`define     OUT_INTR_DATA2             101
`define     INTR_DISPATCH_STATUS       102
`define     IN_INTR_DATA0              103
`define     IN_INTR_DATA1              104
`define     IN_INTR_DATA2              105
`define     INTR_RECEIVE               106
`define     GL                         107
`define     HPSTATE_SAS                108
`define     HTSTATE1                   109
`define     HTSTATE2                   110
`define     HTSTATE3                   111
`define     HTSTATE4                   112
`define     HTSTATE5                   113
`define     HTSTATE6                   114
`define     HTSTATE7                   115
`define     HTSTATE8                   116
`define     HTSTATE9                   117
`define     HTSTATE10                  118
`define     HTBA_SAS                   119
`define     HINTP_SAS                  120
`define     HSTICK_CMPR                121
`define     MID                        122
`define     ISFSR                      123
`define     DSFSR                      124
`define     SFAR                       125
//new mmu registers
`define     I_TAG_ACCESS            126
`define     D_TAG_ACCESS            127
`define     CTXT_PRIM               128
`define     CTXT_SEC                129
`define     SFP_REG                 130
`define     I_CTXT_ZERO_PS0         131
`define     D_CTXT_ZERO_PS0         132
`define     I_CTXT_ZERO_PS1         133
`define     D_CTXT_ZERO_PS1         134
`define     I_CTXT_ZERO_CONFIG      135
`define     D_CTXT_ZERO_CONFIG      136
`define     I_CTXT_NONZERO_PS0      137
`define     D_CTXT_NONZERO_PS0      138
`define     I_CTXT_NONZERO_PS1      139
`define     D_CTXT_NONZERO_PS1      140
`define     I_CTXT_NONZERO_CONFIG   141
`define     D_CTXT_NONZERO_CONFIG   142
`define     I_TAG_TARGET            143
`define     D_TAG_TARGET            144
`define     I_TSB_PTR_PS0           145
`define     D_TSB_PTR_PS0           146
`define     I_TSB_PTR_PS1           147
`define     D_TSB_PTR_PS1           148
`define     D_TSB_DIR_PTR           149
`define     VA_WP_ADDR              150
`define     PID                     151

`define GLOBAL 75
`define LOCAL  107
`define ODDS   115
`define FLOAT  235
//define pli command
`define PLI_QUIT                1    /* None */
`define PLI_SSTEP               2    /* %1 th id */
`define PLI_READ_TH_REG         3    /* %1 th id, %2 win num, %3 reg num */
`define PLI_READ_TH_CTL_REG     4    /* %1 th id, %2 reg num */
`define PLI_READ_TH_FP_REG_I    5    /* %1 th id, %2 reg num */
`define PLI_READ_TH_FP_REG_X    6    /* %1 th id, %2 reg num */
//`define PLI_RTL_DATA          7    /* 472 bytes rtl data */

`define  PLI_WRITE_TH_REG_HI    10
`define  PLI_WRITE_TH_REG       11
`define  PLI_INST_TTE           17    /* %1 th id, %2-%9 I-TTE value */
`define  PLI_DATA_TTE           18    /* %1 th id, %2-%9 D-TTE value */
`define  TIMESTAMP              19    /* %1-%8 RTL timestamp value */
module sas_task (/*AUTOARG*/
           // Inputs
           tlu_pich_wrap_flg_m, tlu_pic_cnt_en_m, final_ttype_sel_g,
           rst_ttype_w2, sync_trap_taken_m, pib_picl_wrap, pib_pich_wrap_m,
           pib_pich_wrap, pic_wrap_trap_g, pib_wrap_trap_m, pcr_rw_e,
           tlu_rsr_inst_e, pcr0, pcr1, pcr2, pcr3, wsr_pcr_sel, pich_cnt0,
           pich_cnt1, pich_cnt2, pich_cnt3, picl_cnt0, picl_cnt1, picl_cnt2,
           picl_cnt3, update_pich_sel, update_picl_sel, const_maskid,
           fprs_sel_wrt, fprs_sel_set, fprs_wrt_data, new_fprs,
           ifu_lsu_pref_inst_e, formatted_tte_data, dformatted_tte_data,
           dtlb_cam_vld, dtlb_tte_vld_g, tlu_hpstate_priv, tlu_hpstate_enb,
           fcl_dtu_inst_vld_d, icache_hit, xlate_en, ifu_lsu_thrid_s,
           fcl_ifq_icmiss_s1, tlu_exu_early_flush_pipe_w, rst_hwint_ttype_g,
           trap_taken_g, spu_lsu_ldxa_illgl_va_w2, spu_lsu_ldxa_data_vld_w2,
           spu_lsu_ldxa_tid_w2, mra_field1_en, mra_field2_en, mra_field3_en,
           mra_field4_en, pmem_unc_error_g, pc_f, cam_vld_f, cam_vld,
           defr_trp_taken_m_din, illgl_va_vld_or_drop_ldxa2masync, ecc_wen,
           fpdis_trap_e, ceen, nceen, ifu_tlu_flush_m, lsu_tlu_ttype_m2,
           lsu_tlu_ttype_vld_m2, tlu_final_ttype_w2, tlu_ifu_trappc_vld_w1,
           mra_wr_ptr, mra_wr_vld, lsu_pid_state0, lsu_pid_state1,
           lsu_pid_state2, lsu_pid_state3, pid_state_wr_en,
           lsu_t0_pctxt_state, lsu_t1_pctxt_state, lsu_t2_pctxt_state,
           lsu_t3_pctxt_state, pctxt_state_wr_thrd, sctxt_state0,
           sctxt_state1, sctxt_state2, sctxt_state3, sctxt_state_wr_thrd,
           va_wtchpt0_addr, va_wtchpt1_addr, va_wtchpt2_addr,
           va_wtchpt3_addr, lsu_va_wtchpt0_wr_en_l, lsu_va_wtchpt1_wr_en_l,
           lsu_va_wtchpt2_wr_en_l, lsu_va_wtchpt3_wr_en_l, ifu_rstint_m,
           spu_tlu_rsrv_illgl_m, cam_vld_s1, val_thr_s1, pc_s, rs2_fst_ue_w3,
           rs2_fst_ce_w3, lsu_tlu_async_ttype_vld_w2,
           lsu_tlu_defr_trp_taken_g, lsu_tlu_async_ttype_w2,
           lsu_tlu_async_tid_w2, itlb_rw_index, itlb_rw_index_vld,
           itlb_rd_tte_tag, itlb_rd_tte_data, icam_hit, dtlb_rw_index,
           dtlb_rw_index_vld, dtlb_rd_tte_tag, dtlb_rd_tte_data, dcam_hit,
           wrt_spec_w, spc_pcx_data_pa, fcl_fdp_inst_sel_nop_s_l,
           retract_iferr_d, inst_vld_w, dmmu_async_illgl_va_g,
           immu_async_illgl_va_g, lsu_tlu_tlb_ld_inst_m,
           lsu_tlu_tlb_st_inst_m, immu_sfsr_wr_en_l, dmmu_sfsr_wr_en_l,
           dmmu_sfar_wr_en_l, lsu_quad_asi_e, clk, rst_l, back,
           lsu_ifu_ldsta_internal_e, lsu_mmu_flush_pipe_w, dtlb_wr_vld,
           dtlb_demap, dtlb_rd_tag_vld, dtlb_rd_data_vld, dtlb_entry_vld,
           itlb_wr_vld, itlb_demap, itlb_rd_tag_vld, itlb_rd_data_vld,
           itlb_entry_vld, tlb_access_tid_g, dsfar0_clk, dsfar1_clk,
           dsfar2_clk, dsfar3_clk, dsfar_din, dtu_inst_d, local_rdpr_mx1_sel,
           tlu_rdpr_mx5_sel, tlu_rdpr_mx7_sel, tlu_rst_l, tick_match,
           tlu_wr_sftint_l_g, dsfsr_din, dsfsr0_clk, dsfsr1_clk, dsfsr2_clk,
           dsfsr3_clk, isfsr_din, isfsr0_clk, isfsr1_clk, isfsr2_clk,
           isfsr3_clk, ecl_byp_sel_ecc_w, ifu_exu_inst_w, ctl_dp_fp_thr,
           ifu_ffu_fst_d, pc_e, fcl_dtu_inst_vld_e, exu_lsu_rs3_data_e,
           tick_ctl_din, ifu_tlu_ttype_m, tlu_rerr_vld, sftint0, sftint1,
           sftint2, sftint3, sftint0_clk, sftint1_clk, sftint2_clk,
           sftint3_clk, sftint_b0_en, sftint_b15_en, sftint_b16_en,
           cpx_spc_data_cx2, ifu_exu_save_d, ifu_exu_restore_d,
           ifu_tlu_thrid_d, tlu_ifu_hwint_i3, ifu_tlu_hwint_m,
           ifu_tlu_rstint_m, ifu_tlu_swint_m, tlu_ifu_flush_pipe_w,
           ifu_tlu_flush_w, ffu_ifu_fst_ce_w, ffu_ifu_ecc_ue_w2,
           ffu_ifu_ecc_ce_w2, any_err_vld, any_ue_vld, tsa_htstate_en,
           stickcmp_intdis_en, tick_npt0, tick_npt1, tick_npt2, tick_npt3,
           true_tick, htick_intdis0, htick_intdis1, htick_intdis2,
           htick_intdis3, true_stickcmp0, true_stickcmp1, true_stickcmp2,
           true_stickcmp3, tlu_hintp_en_l_g, tlu_hintp, tlu_htba_en_l,
           true_htba0, true_htba1, true_htba2, true_htba3,
           update_hpstate_l_w2, restore_hpstate0, restore_hpstate1,
           restore_hpstate2, restore_hpstate3, htickcmp_intdis_en,
           true_htickcmp0, true_htickcmp1, true_htickcmp2, true_htickcmp3,
           gl0_en, gl1_en, gl2_en, gl3_en, gl_lvl0_new, gl_lvl1_new,
           gl_lvl2_new, gl_lvl3_new, t0_gsr_nxt, t0_gsr_rnd_next,
           t0_gsr_align_next, t0_gsr_wsr_w, t0_siam_w, t0_alignaddr_w,
           t1_gsr_nxt, t1_gsr_rnd_next, t1_gsr_align_next, t1_gsr_wsr_w,
           t1_siam_w, t1_alignaddr_w, t2_gsr_nxt, t2_gsr_rnd_next,
           t2_gsr_align_next, t2_gsr_wsr_w, t2_siam_w, t2_alignaddr_w,
           t3_gsr_nxt, t3_gsr_rnd_next, t3_gsr_align_next, t3_gsr_wsr_w,
           t3_siam_w, t3_alignaddr_w, exu_lsu_ldst_va_e, asi_state_e,
           cpu_num, good, active, finish, lda_internal_e, sta_internal_e,
           ifu_spu_trap_ack, ifu_exu_muls_d, ifu_exu_tid_s2,
           rml_irf_restore_local_m, rml_irf_cwp_m, rml_irf_save_local_m,
           rml_irf_thr_m, ifu_exu_save_e, exu_tlu_spill_e, t0_fsr_nxt,
           t1_fsr_nxt, t2_fsr_nxt, t3_fsr_nxt, ctl_dp_fsr_sel_old,
           tlu_sftint_en_l_g, true_tickcmp0, true_tickcmp1, true_tickcmp2,
           true_tickcmp3, tickcmp_intdis_en, dtu_fdp_rdsr_sel_thr_e_l,
           ifu_exu_rd_ifusr_e, ifu_exu_use_rsr_e_l, rml_irf_global_tid,
           ecl_irf_wen_w, ecl_irf_wen_w2, byp_irf_rd_data_w,
           byp_irf_rd_data_w2, thr_rd_w, thr_rd_w2, ecl_irf_tid_w,
           ecl_irf_tid_w2, ifu_tlu_thrid_w, wen_thr0_l, wen_thr1_l,
           wen_thr2_l, wen_thr3_l, ccrin_thr0, ccrin_thr1, ccrin_thr2,
           ccrin_thr3, cwp_thr0_next, cwp_thr1_next, cwp_thr2_next,
           cwp_thr3_next, cwp_wen_l, next_cansave_w, cansave_wen_w,
           next_canrestore_w, canrestore_wen_w, next_otherwin_w,
           otherwin_wen_w, tl_exu_tlu_wsr_data_w, ecl_rml_wstate_wen_w,
           next_cleanwin_w, cleanwin_wen_w, next_yreg_thr0, next_yreg_thr1,
           next_yreg_thr2, next_yreg_thr3, ecl_div_yreg_wen_l,
           ifu_tlu_wsr_inst_d, ifu_tlu_sraddr_d, inst_done_w_for_sas,
           ifu_tlu_pc_w, ifu_tlu_npc_w, tl0_en, tl1_en, tl2_en, tl3_en,
           trp_lvl0_new, trp_lvl1_new, trp_lvl2_new, trp_lvl3_new,
           update_pstate0_w2, update_pstate1_w2, update_pstate2_w2,
           update_pstate3_w2, pstate_priv_update_w2, hpstate_priv_update_w2,
           restore_pstate0, restore_pstate1, restore_pstate2,
           restore_pstate3, tick0_en, tick1_en, tick2_en, tick3_en,
           exu_tlu_wsr_data_w, tba0_en, tba1_en, tba2_en, tba3_en,
           tsa_wr_vld, tsa_pc_en, tsa_npc_en, tsa_tstate_en, tsa_ttype_en,
           tsa_wr_tid, tsa_wr_tpl, temp_tlvl0, tsa0_wdata, write_mask0,
           temp_tlvl1, tsa1_wdata, write_mask1, cpu_id, next_t0_inrr_i1,
           next_t1_inrr_i1, next_t2_inrr_i1, next_t3_inrr_i1,
           ifu_lsu_st_inst_e, ifu_lsu_ld_inst_e, ifu_lsu_alt_space_e,
           ifu_lsu_ldst_fp_e, ifu_lsu_ldst_dbl_e, lsu_ffu_blk_asi_e,
           ifu_tlu_inst_vld_m, ifu_lsu_swap_e, ifu_tlu_thrid_e, asi_wr_din,
           asi_state_wr_thrd, pil, pil0_en, pil1_en, pil2_en, pil3_en,
           dp_frf_data, ctl_frf_addr, ctl_frf_wen, regfile_index,
           ifu_exu_rs1_s, ifu_exu_rs2_s, byp_alu_rs1_data_e,
           byp_alu_rs2_data_e, ifu_lsu_imm_asi_d, ifu_lsu_imm_asi_vld_d,
           ifu_tlu_itlb_done, tlu_itlb_wr_vld_g, tlu_itlb_dmp_vld_g,
           lsu_tlu_dtlb_done, tlu_dtlb_wr_vld_g, tlu_dtlb_dmp_vld_g,
           tlu_idtlb_dmp_thrid_g, inst_vld_qual_e, t0_inrr_i2, t1_inrr_i2,
           t2_inrr_i2, t3_inrr_i2, t0_indr, t1_indr, t2_indr, t3_indr,
           ttype_sel_hstk_cmp_e, ifu_tlu_ttype_vld_m
       );
input tlu_pich_wrap_flg_m;
input tlu_pic_cnt_en_m;

input [3:0] final_ttype_sel_g;
input [6:0] rst_ttype_w2;

input sync_trap_taken_m;
input [3:0] pib_picl_wrap;
input [3:0] pib_pich_wrap_m;
input [3:0] pib_pich_wrap;
input pic_wrap_trap_g;
input pib_wrap_trap_m;

input pcr_rw_e;
input tlu_rsr_inst_e;

input [7:0] pcr0;
input [7:0] pcr1;
input [7:0] pcr2;
input [7:0] pcr3;
input [3:0] wsr_pcr_sel;

input [32:0] pich_cnt0;
input [32:0] pich_cnt1;
input [32:0] pich_cnt2;
input [32:0] pich_cnt3;

input [32:0] picl_cnt0;
input [32:0] picl_cnt1;
input [32:0] picl_cnt2;
input [32:0] picl_cnt3;
input [3:0] update_pich_sel;
input [3:0] update_picl_sel;
input [7:0] const_maskid;

//fprs register
input [3:0] fprs_sel_wrt;
input [3:0] fprs_sel_set;
input [2:0] fprs_wrt_data;
input [1:0] new_fprs;


input ifu_lsu_pref_inst_e;
input [63:0] formatted_tte_data;
input [63:0] dformatted_tte_data;
input 	dtlb_cam_vld;
input 	dtlb_tte_vld_g;

input [3:0] tlu_hpstate_priv;
input [3:0] tlu_hpstate_enb;
input       fcl_dtu_inst_vld_d;

input icache_hit;

input [3:0] xlate_en;
input [1:0] ifu_lsu_thrid_s;
input       fcl_ifq_icmiss_s1;

input tlu_exu_early_flush_pipe_w;

input [6:0] rst_hwint_ttype_g;
input       trap_taken_g;

input spu_lsu_ldxa_illgl_va_w2;
input spu_lsu_ldxa_data_vld_w2;
input [1:0] spu_lsu_ldxa_tid_w2;

input mra_field1_en;
input mra_field2_en;
input mra_field3_en;
input mra_field4_en;
input pmem_unc_error_g;

input [47:0] pc_f;
input 	cam_vld_f;
input 	cam_vld;
input 	defr_trp_taken_m_din;

//mra signals
input illgl_va_vld_or_drop_ldxa2masync;
input [1:0] ecc_wen;

input fpdis_trap_e;

input [3:0] ceen;
input [3:0] nceen;

input ifu_tlu_flush_m;

input [8:0]   lsu_tlu_ttype_m2;
input         lsu_tlu_ttype_vld_m2;
input [8:0]	 tlu_final_ttype_w2;
input 	 tlu_ifu_trappc_vld_w1;

reg [159:0] mra_wdata;
input [3:0] 	 mra_wr_ptr;
input 	 mra_wr_vld;
//pid
input [2:0] 	 lsu_pid_state0;
input [2:0] 	 lsu_pid_state1;
input [2:0] 	 lsu_pid_state2;
input [2:0] 	 lsu_pid_state3;
input [3:0] 	 pid_state_wr_en;
//ctxt prim
input [12:0]  lsu_t0_pctxt_state;
input [12:0]  lsu_t1_pctxt_state;
input [12:0]  lsu_t2_pctxt_state;
input [12:0]  lsu_t3_pctxt_state;
input [3:0] 	 pctxt_state_wr_thrd;

//sctxt
input [12:0]  sctxt_state0;
input [12:0]  sctxt_state1;
input [12:0]  sctxt_state2;
input [12:0]  sctxt_state3;
input [3:0] 	 sctxt_state_wr_thrd;
//watch pointer
//input [47:3]  lsu_va_wtchpt_addr;
input [47:3]  va_wtchpt0_addr;
input [47:3]  va_wtchpt1_addr;
input [47:3]  va_wtchpt2_addr;
input [47:3]  va_wtchpt3_addr;
input 	 lsu_va_wtchpt0_wr_en_l;
input 	 lsu_va_wtchpt1_wr_en_l;
input 	 lsu_va_wtchpt2_wr_en_l;
input 	 lsu_va_wtchpt3_wr_en_l;

input ifu_rstint_m;
input spu_tlu_rsrv_illgl_m;

//itlb parity error
input cam_vld_s1;
input [3:0] val_thr_s1;
input [48:0] pc_s;

input rs2_fst_ue_w3;
input rs2_fst_ce_w3;
//tlb error
input lsu_tlu_async_ttype_vld_w2;
input lsu_tlu_defr_trp_taken_g;

input [6:0] lsu_tlu_async_ttype_w2;
input [1:0] lsu_tlu_async_tid_w2;
//itlb

input [5:0] itlb_rw_index;
input       itlb_rw_index_vld;
input [58:0] itlb_rd_tte_tag;
input [42:0] itlb_rd_tte_data;
input [63:0] icam_hit;

//dtlb

input [5:0] 	dtlb_rw_index;
input 	dtlb_rw_index_vld;
input [58:0] dtlb_rd_tte_tag;
input [42:0] dtlb_rd_tte_data;
input [63:0] dcam_hit;
//spec write
input wrt_spec_w;
input [`PCX_WIDTH-1:0] spc_pcx_data_pa;
input fcl_fdp_inst_sel_nop_s_l;
input retract_iferr_d;
input inst_vld_w;

//inputs
input dmmu_async_illgl_va_g;
input immu_async_illgl_va_g;
input lsu_tlu_tlb_ld_inst_m;
input lsu_tlu_tlb_st_inst_m;
//dsfar
input [3:0] immu_sfsr_wr_en_l;
input [3:0] dmmu_sfsr_wr_en_l;
input [3:0] dmmu_sfar_wr_en_l;
input       lsu_quad_asi_e;

input         clk;
input         rst_l;
input [3:0] 	 back;
input 	 lsu_ifu_ldsta_internal_e;
input 	 lsu_mmu_flush_pipe_w;

input 	 dtlb_wr_vld;
input 	 dtlb_demap;
input 	 dtlb_rd_tag_vld;
input 	 dtlb_rd_data_vld;
input [63:0]  dtlb_entry_vld;

input 	 itlb_wr_vld;
input 	 itlb_demap;
input 	 itlb_rd_tag_vld;
input 	 itlb_rd_data_vld;
input [63:0]  itlb_entry_vld;

input [1:0] 	 tlb_access_tid_g;

input 	 dsfar0_clk;
input 	 dsfar1_clk;
input 	 dsfar2_clk;
input 	 dsfar3_clk;
input [47:0]  dsfar_din;


//instrction
input [31:0]  dtu_inst_d;
//tick
input [3:0] 	 local_rdpr_mx1_sel;//e_stage signals
input [2:0] 	 tlu_rdpr_mx5_sel;
input [3:0] 	 tlu_rdpr_mx7_sel;

input         tlu_rst_l;
input 	 tick_match;
input 	 tlu_wr_sftint_l_g;
input [23:0]  dsfsr_din;
input 	 dsfsr0_clk;
input 	 dsfsr1_clk;
input 	 dsfsr2_clk;
input 	 dsfsr3_clk;

input [23:0]  isfsr_din;
input 	 isfsr0_clk;
input 	 isfsr1_clk;
input 	 isfsr2_clk;
input 	 isfsr3_clk;
//integer error
//input 	 irf_ce_w;
input 	 ecl_byp_sel_ecc_w;
input         ifu_exu_inst_w;

//error handle
input [3:0] 	 ctl_dp_fp_thr;
//   input [4:0] 	 ifu_ffu_frd_d;
input 	 ifu_ffu_fst_d;
//itlb invalidate signals
input [48:0]  pc_e;
input 	 fcl_dtu_inst_vld_e;
input [63:0]  exu_lsu_rs3_data_e;
input 	 tick_ctl_din;

//trap type
input [8:0]	 ifu_tlu_ttype_m;
input [3:0] 	 tlu_rerr_vld;

//soft int
// modified due to sftint recode in rtl
// input [15:0]        sftint0;
// input [15:0]        sftint1;
// input [15:0]        sftint2;
// input [15:0]        sftint3;
input [16:0]        sftint0;
input [16:0]        sftint1;
input [16:0]        sftint2;
input [16:0]        sftint3;
input 	       sftint0_clk;
input 	       sftint1_clk;
input 	       sftint2_clk;
input 	       sftint3_clk;
input [3:0] 	       sftint_b0_en;
input [3:0] 	       sftint_b15_en;
input [3:0] 	       sftint_b16_en;
//
// removed due to sftint recode in rtl
// input [3:0] 	       tick_int_din;
// input [3:0] 	       tick_int_en;

input [`CPX_WIDTH-1:0] cpx_spc_data_cx2;
input         ifu_exu_save_d;
input         ifu_exu_restore_d;
input [1:0] 	 ifu_tlu_thrid_d;
input [3:0] 	 tlu_ifu_hwint_i3;
input 	 ifu_tlu_hwint_m;
input 	 ifu_tlu_rstint_m;
input 	 ifu_tlu_swint_m;
input 	 tlu_ifu_flush_pipe_w;
input 	 ifu_tlu_flush_w;
//floating point error indicator.
input 	 ffu_ifu_fst_ce_w;
input 	 ffu_ifu_ecc_ue_w2;
input 	 ffu_ifu_ecc_ce_w2;
input [3:0] 	 any_err_vld;
input [3:0] 	 any_ue_vld;
//hypervisor
input tsa_htstate_en;
//
// modified due to sftint recode in rtl
//STICK_CMP
//input [3:0]    tlu_stickcmp_en_l;
input [3:0] stickcmp_intdis_en;

// input [62:0]   true_stickcmp0;
// input [62:0]   true_stickcmp1;
// input [62:0]   true_stickcmp2;
// input [62:0]   true_stickcmp3;
input 	  tick_npt0;
input 	  tick_npt1;
input 	  tick_npt2;
input 	  tick_npt3;
input [60:0]   true_tick;

input 	  htick_intdis0;
input 	  htick_intdis1;
input 	  htick_intdis2;
input 	  htick_intdis3;

input [63:0]   true_stickcmp0;
input [63:0]   true_stickcmp1;
input [63:0]   true_stickcmp2;
input [63:0]   true_stickcmp3;
//HINTP
input [3:0]    tlu_hintp_en_l_g;
input [3:0] 	  tlu_hintp;
//tba
input [3:0] 	  tlu_htba_en_l;
input [33:0]   true_htba0;
input [33:0]   true_htba1;
input [33:0]   true_htba2;
input [33:0]   true_htba3;
//hpstate
//input [3:0] 	  tlu_hpstate_enb;
//
// modified due to the addition of hpstate.ibe
// input [3:0] 	  restore_hpstate0;
// input [3:0] 	  restore_hpstate1;
// input [3:0] 	  restore_hpstate2;
// input [3:0] 	  restore_hpstate3;
// input 	  update_hpstate0_w2;
// input 	  update_hpstate1_w2;
// input 	  update_hpstate2_w2;
// input 	  update_hpstate3_w2;
input [3:0]	  update_hpstate_l_w2;
input [4:0] 	  restore_hpstate0;
input [4:0] 	  restore_hpstate1;
input [4:0] 	  restore_hpstate2;
input [4:0] 	  restore_hpstate3;
//HTICK_CMP
//input [3:0] 	  tlu_htickcmp_en_l;
input [3:0] 	  htickcmp_intdis_en;

input [62:0]   true_htickcmp0;
input [62:0]   true_htickcmp1;
input [62:0]   true_htickcmp2;
input [62:0]   true_htickcmp3;
//gl
input gl0_en;
input gl1_en;
input gl2_en;
input gl3_en;

input [1:0] gl_lvl0_new;
input [1:0] gl_lvl1_new;
input [1:0] gl_lvl2_new;
input [1:0] gl_lvl3_new;
//gsr
input [36:0]  t0_gsr_nxt;
input [2:0] 	 t0_gsr_rnd_next;
input [2:0] 	 t0_gsr_align_next;

input 	 t0_gsr_wsr_w;
input 	 t0_siam_w;
input 	 t0_alignaddr_w;
//thread 1
input [36:0]  t1_gsr_nxt;
input [2:0] 	 t1_gsr_rnd_next;
input [2:0] 	 t1_gsr_align_next;

input 	 t1_gsr_wsr_w;
input 	 t1_siam_w;
input 	 t1_alignaddr_w;
//thread 2
input [36:0]  t2_gsr_nxt;
input [2:0] 	 t2_gsr_rnd_next;
input [2:0] 	 t2_gsr_align_next;

input 	 t2_gsr_wsr_w;
input 	 t2_siam_w;
input 	 t2_alignaddr_w;
//thread 1
input [36:0]  t3_gsr_nxt;
input [2:0] 	 t3_gsr_rnd_next;
input [2:0] 	 t3_gsr_align_next;

input 	 t3_gsr_wsr_w;
input 	 t3_siam_w;
input 	 t3_alignaddr_w;
//fsr
input [47:0]  exu_lsu_ldst_va_e;
input [7:0]   asi_state_e;
input [2:0] 	 cpu_num;
input [3:0] 	 good;
input [3:0] 	 active;
input [3:0] 	 finish;

input 	 lda_internal_e;
input 	 sta_internal_e;
input [1:0]	 ifu_spu_trap_ack;
//muls
input 	 ifu_exu_muls_d;
input [1:0]	 ifu_exu_tid_s2;
//
input 	 rml_irf_restore_local_m;
input [2:0] 	 rml_irf_cwp_m;
input 	 rml_irf_save_local_m;
input [1:0] 	 rml_irf_thr_m;

input 	 ifu_exu_save_e;
input 	 exu_tlu_spill_e;

input [27:0]  t0_fsr_nxt;
input [27:0]  t1_fsr_nxt;
input [27:0]  t2_fsr_nxt;
input [27:0]  t3_fsr_nxt;
input [3:0] 	 ctl_dp_fsr_sel_old;
input [3:0] 	 tlu_sftint_en_l_g;
//
// modified due to sftint recode in rtl
// input [62:0]  true_tickcmp0;
// input [62:0]  true_tickcmp1;
// input [62:0]  true_tickcmp2;
// input [62:0]  true_tickcmp3;
input [63:0]  true_tickcmp0;
input [63:0]  true_tickcmp1;
input [63:0]  true_tickcmp2;
input [63:0]  true_tickcmp3;
// input [3:0] 	 tlu_tickcmp_en_l;
input [3:0]	 tickcmp_intdis_en;

input 	 dtu_fdp_rdsr_sel_thr_e_l;
input 	 ifu_exu_rd_ifusr_e;
input 	 ifu_exu_use_rsr_e_l;
input [1:0] 	 rml_irf_global_tid;
input 	 ecl_irf_wen_w;
input 	 ecl_irf_wen_w2;
input [71:0]  byp_irf_rd_data_w;
input [71:0]  byp_irf_rd_data_w2;
input [4:0] 	 thr_rd_w;
input [4:0] 	 thr_rd_w2;
input [1:0] 	 ecl_irf_tid_w;
input [1:0] 	 ecl_irf_tid_w2;
input [1:0] 	 ifu_tlu_thrid_w;

input 	 wen_thr0_l;
input 	 wen_thr1_l;
input 	 wen_thr2_l;
input 	 wen_thr3_l;

input [7:0]	 ccrin_thr0;
input [7:0]	 ccrin_thr1;
input [7:0]	 ccrin_thr2;
input [7:0]	 ccrin_thr3;

input [2:0] 	 cwp_thr0_next;
input [2:0] 	 cwp_thr1_next;
input [2:0] 	 cwp_thr2_next;
input [2:0] 	 cwp_thr3_next;
input [3:0] 	 cwp_wen_l;

input [2:0] 	 next_cansave_w;
input 	 cansave_wen_w;
input [2:0]	 next_canrestore_w;
input 	 canrestore_wen_w;

input [2:0]	 next_otherwin_w;
input 	 otherwin_wen_w;

input [5:0] 	 tl_exu_tlu_wsr_data_w;
input 	 ecl_rml_wstate_wen_w;

input [2:0]	 next_cleanwin_w;
input 	 cleanwin_wen_w;

input [31:0]  next_yreg_thr0;
input [31:0]  next_yreg_thr1;
input [31:0]  next_yreg_thr2;
input [31:0]  next_yreg_thr3;
input [3:0]	 ecl_div_yreg_wen_l;
input 	 ifu_tlu_wsr_inst_d;
input  [3:0]	 ifu_tlu_sraddr_d;
input 	 inst_done_w_for_sas;

input [47:0]	 ifu_tlu_pc_w;
input [47:0]	 ifu_tlu_npc_w;

input 	 tl0_en;
input 	 tl1_en;
input 	 tl2_en;
input 	 tl3_en;

input [2:0] 	 trp_lvl0_new;
input [2:0] 	 trp_lvl1_new;
input [2:0] 	 trp_lvl2_new;
input [2:0] 	 trp_lvl3_new;

input 	 update_pstate0_w2;
input 	 update_pstate1_w2;
input 	 update_pstate2_w2;
input 	 update_pstate3_w2;
input [3:0] 	 pstate_priv_update_w2;
input [3:0] 	 hpstate_priv_update_w2;
//
// modified due to width change in RTL
// input [11:0]	 restore_pstate0;
// input [11:0]  restore_pstate1;
// input [11:0]  restore_pstate2;
// input [11:0]  restore_pstate3;
input [5:0]	restore_pstate0;
input [5:0]  restore_pstate1;
input [5:0]  restore_pstate2;
input [5:0]  restore_pstate3;

input 	 tick0_en;
input 	 tick1_en;
input 	 tick2_en;
input 	 tick3_en;

input [63:0]  exu_tlu_wsr_data_w;
input 	 tba0_en;
input 	 tba1_en;
input 	 tba2_en;
input 	 tba3_en;

//
// modified due to tsa memory swap
input[1:0] tsa_wr_vld;
input 	 tsa_pc_en;
input 	 tsa_npc_en;
input 	 tsa_tstate_en;
input 	 tsa_ttype_en;

input [1:0] 	 tsa_wr_tid;
input [2:0] 	 tsa_wr_tpl;
// modified to work with the official memory
// input [143:0] temp_tlvl;
// input [143:0] tsa_wdata;
// input [143:0] write_mask;
input [79:0] temp_tlvl0;
input [79:0] tsa0_wdata;
input [79:0] write_mask0;
input [79:0] temp_tlvl1;
input [79:0] tsa1_wdata;
input [79:0] write_mask1;
//
input [9:0]  cpu_id; // when restricted to [1:0], seems to only affect Info-perm, but here changes are global
//interrupt
input [63:0]  next_t0_inrr_i1;
input [63:0]  next_t1_inrr_i1;
input [63:0]  next_t2_inrr_i1;
input [63:0]  next_t3_inrr_i1;
input 	 ifu_lsu_st_inst_e;

input 	 ifu_lsu_ld_inst_e;
input         ifu_lsu_alt_space_e;
input         ifu_lsu_ldst_fp_e;
input         ifu_lsu_ldst_dbl_e;
input         lsu_ffu_blk_asi_e;
input         ifu_tlu_inst_vld_m;

input 	 ifu_lsu_swap_e;
input [1:0] 	 ifu_tlu_thrid_e;
// asi

input [7:0] 	 asi_wr_din;
input [3:0] 	 asi_state_wr_thrd;
// pil
input [3:0] 	 pil;
input 	 pil0_en;
input 	 pil1_en;
input 	 pil2_en;
input 	 pil3_en;
//floating point
input [70:0]  dp_frf_data;
input [6:0] 	 ctl_frf_addr;
input [1:0] 	 ctl_frf_wen;
input [7:0] 	 regfile_index;

//regs
input [4:0] 	 ifu_exu_rs1_s;
input [4:0] 	 ifu_exu_rs2_s;
input [63:0]  byp_alu_rs1_data_e;
input [63:0]  byp_alu_rs2_data_e;
//new signal for tlb
input [7:0] 	 ifu_lsu_imm_asi_d;
input 	 ifu_lsu_imm_asi_vld_d;
input 	 ifu_tlu_itlb_done;
input 	 tlu_itlb_wr_vld_g;
input 	 tlu_itlb_dmp_vld_g;
input 	 lsu_tlu_dtlb_done;
input 	 tlu_dtlb_wr_vld_g;
input 	 tlu_dtlb_dmp_vld_g;
input [1:0] 	 tlu_idtlb_dmp_thrid_g;
//thread id
input 	 inst_vld_qual_e;
//interrupt signal and reg
input [63:0]  t0_inrr_i2;
input [63:0]  t1_inrr_i2;
input [63:0]  t2_inrr_i2;
input [63:0]  t3_inrr_i2;
input [10:0]  t0_indr;
input [10:0]  t1_indr;
input [10:0]  t2_indr;
input [10:0]  t3_indr;

//hyper interrupt
input 	 ttype_sel_hstk_cmp_e;
input         ifu_tlu_ttype_vld_m;

reg pcr_rw_m, pcr_rw_w;
reg tlu_rsr_inst_m, tlu_rsr_inst_w;
wire pcr_read_enable;
reg 	not_pcr;

//interrupt dispatcher
reg [63:0] 	 t0_invr,      t1_invr,      t2_invr,      t3_invr,
    t0_invr_val,  t1_invr_val,  t2_invr_val,  t3_invr_val ;
reg [10:0] 	 t0_indr_p,    t1_indr_p,    t2_indr_p,    t3_indr_p;
reg [3:0] 	 indr_reg, invr_cntl;
reg [63:0] 	 pc_m;

wire [3:0] 	 t_invr_cntl;

wire 	 t0_indr_cntl, t1_indr_cntl, t2_indr_cntl, t3_indr_cntl;
wire [3:0] 	 t_indr_cntl;
reg           spc_invr_cntl, spc_indr_cntl;
reg [3:0] 	 once_step;
//
// added for timing
wire update_hpstate0_w2;
wire update_hpstate1_w2;
wire update_hpstate2_w2;
wire update_hpstate3_w2;

// global registers
integer vsocket;
reg [2:0]     cwp[3:0];
reg [1:0]     on_spc;
reg [31:0] 	 thvec;       // thread vector
reg [63:0] 	 sas_sps_val; //use for all sparc
reg [63:0] 	 tstate;
reg [3:0] 	 set0_pc;

// define control register for each sparc
reg [63:0] 	 rtl_reg_val;
reg [63:0] 	 sas_reg_val;
reg  [4:0] 	 rtl_reg_addr;
reg [3:0] 	 b2b_flush;

//spc0
wire          spc0_rtl_wr_en;
wire [5:0]    spc0_rtl_reg_addr_w;      // {thread, reg(15..0)}
wire [5:0] 	 spc0_rtl_reg_addr_w2;      // {thread, reg(15..0)}

wire [63:0]   spc0_rtl_reg_val_w;
wire [63:0]   spc0_rtl_reg_val_w2;
wire [1:0]    spc0_thread_w;
wire [1:0]    spc0_thread_w2;
wire [1:0] 	 spc0_thread_pc;

wire 	 spc0_inst_done, spc0_flush_happen;

wire  [63:0]  spc0_rtl_pc;
wire  [63:0]  spc0_rtl_npc;
//trap level register
reg   [48:0]  spc0_tpc0_reg;
reg   [48:0]  spc0_tnpc0_reg;
reg   [48:0]  spc0_tpc1_reg;
reg   [48:0]  spc0_tnpc1_reg;
reg   [48:0]  spc0_tpc2_reg;
reg   [48:0]  spc0_tnpc2_reg;
reg   [48:0]  spc0_tpc3_reg;
reg   [48:0]  spc0_tnpc3_reg;
reg   [48:0]  spc0_tpc4_reg;
reg   [48:0]  spc0_tnpc4_reg;

wire  [63:0]  spc0_tick_reg;
wire 	 spc0_tick_cntl;
wire          spc0_stickcmp_cntl;
wire          spc0_stick_cntl;

// tba
wire [63:0] 	 spc0_tba_reg;
wire 	 spc0_tba_cntl;

wire [3:0]	 spc0_gsr_cntl;

wire [1:0] 	 spc0_trap_tid;
wire [2:0] 	 spc0_trap_tpl;
wire 	 spc0_trap_pc;
wire 	 spc0_trap_npc;
wire 	 spc0_trap_tstate;
wire 	 spc0_trap_htstate;
wire 	 spc0_trap_ttype;
wire 	 spc0_trap_write;
wire [134:0]  spc0_trap_data;
//ignore tnpc tpc during pwr
reg 	[4:0]	 pwr_tpc;
reg 	[4:0]	 pwr_tnpc;
reg 	[4:0]	 pwr_tstate;
reg 	[4:0]	 pwr_hstate;
// wire [143:0]  temp_trap_data;
// modified due to tsa memory macro swap
wire [79:0]  temp_trap_data0;
wire [79:0]  temp_trap_data1;
//fsar variable
/*  For the architected state, look up

 wire    [23:0]          dsfsr0,isfsr0 ;
 wire    [23:0]          dsfsr1,isfsr1 ;
 wire    [23:0]          dsfsr2,isfsr2 ;
 wire    [23:0]          dsfsr3,isfsr3 ;

 wire    [47:0]          dsfar0,dsfar1 ;
 wire    [47:0]          dsfar2,dsfar3 ;
*/
wire 	spc0_sfar_cntl;
reg          spc_sfar_cntl;

reg [47:0] 	sfar_val[3:0];
reg [3:0] 	sfar_cntl;

reg 		 spc0_tpc0_cntl,     spc0_tpc1_cntl,    spc0_tpc2_cntl,     spc0_tpc3_cntl,    spc0_tpc4_cntl;
reg 		 spc0_tnpc0_cntl,    spc0_tnpc1_cntl,   spc0_tnpc2_cntl,    spc0_tnpc3_cntl,   spc0_tnpc4_cntl;
reg 		 spc0_tstate0_cntl,  spc0_tstate1_cntl, spc0_tstate2_cntl,  spc0_tstate3_cntl, spc0_tstate4_cntl;
reg 		 spc0_ttype0_cntl,   spc0_ttype1_cntl,  spc0_ttype2_cntl,   spc0_ttype3_cntl,  spc0_ttype4_cntl;
reg 		 spc0_tpc5_cntl,     spc0_tnpc5_cntl,   spc0_tstate5_cntl,  spc0_ttype5_cntl;
reg 		 spc_hintp_cntl,     spc0_hstate5_cntl,  spc_htba_cntl,
       spc0_hstate4_cntl,  spc0_hstate3_cntl, spc0_hstate2_cntl,  spc0_hstate1_cntl, spc0_hstate0_cntl,
       spc_hpstate_cntl;
// ccr
wire 	 spc0_ccr_cntl;
wire          spc0_dsfsr_cntl;
wire          spc0_isfsr_cntl;
// WRSR control and regs.
wire [2:0] 	 spc0_cwp_reg;
wire 	 spc0_cwp_cntl;
wire [2:0] 	 spc0_cansave_reg;
wire 	 spc0_cansave_cntl;
wire [2:0] 	 spc0_canrestore_reg;
wire 	 spc0_canrestore_cntl;
wire [2:0] 	 spc0_otherwin_reg;
wire 	 spc0_otherwin_cntl;
wire [5:0] 	 spc0_wstate_reg;
wire          spc0_wstate_cntl;
wire [2:0] 	 spc0_cleanwin_reg;
wire 	 spc0_cleanwin_cntl;
wire 	 spc0_wrsr_cntl;
wire 	 spc0_y_cntl;
wire [3:0] 	 spc0_wrsr_addr;
wire 	 spc0_tl_cntl;
wire [2:0] 	 spc0_tl_reg;
wire 	 spc0_pstate_cntl;
wire [11:0]	 spc0_pstate_reg0, spc0_pstate_reg1, spc0_pstate_reg2, spc0_pstate_reg3 ;
// added due to width change in RTL
wire [5:0]	 tmp_pstate_reg;
wire 	 spc0_pil_cntl;
wire [3:0] 	 spc0_pil_reg;
//delay version of register.
reg  [3:0] 	 delay_cwp_cntl;
reg  [2:0] 	 delay_cwp_reg[3:0];
wire [1:0] 	 spc0_cwp_tid;
wire 	 spc0_float_cntl;
wire 	 spc0_fsr_cntl;
wire          spc0_gl_cntl;
wire          spc0_hpstate_cntl;
wire 	 spc0_htba_cntl;
wire          spc0_hintp_cntl;
wire          spc0_htick_cntl;
wire 	 spc0_flush_happen_m;
wire 	 spc0_inst_done_trap;
wire          spc0_fprs_cntl;
reg 		 spc_fprs_cntl;
wire [1:0] 	 float_tid;
//error trap
wire          tlu_rerr_vld_flush;
// thread_id
reg 		 thread_buf_d;
reg           thread_buf_e;
reg 		 sas_on;
reg [2:0] 	 th_vec[7:0];
reg [63:0] 	 delay_pc[3:0];
reg [63:0] 	 delay_npc[3:0];
reg [3:0]	 delay_done;
reg [1:0] 	 which;

reg [3:0]	 delay_st0;
reg [3:0]	 delay_st1;
reg [1:0] 	 tmp_thread;
reg [3:0] 	 thread_status;
wire 	 thread_id_cntl;
//asi
wire [7:0] 	 spc0_asi_state;
wire 	 spc0_asi_cntl;
wire [3:0] 	 spc0_asi_thrd;
wire [1:0] 	 cur_thread;
//soft int
wire 	 spc0_sft_cntl;
wire [3:0]	 spct_sft_cntl;
wire 	 spc0_tcmp_cntl;
wire          ifu_lsu_block_e;
wire [1:0] 	 next_sft_wr_id;
wire 	 tlu_parity_flush;

//asi 72
wire          is_int_in_bound;

reg 		 ifu_lsu_block_m, ifu_lsu_block_w;
reg [3:0] 	 block_load;
reg [3:0] 	 block_count [3:0];
reg 		 lsu_tlu_defr_trp_taken_w2;
integer 	 i;
reg [1:0] 	 ccr_tid, y_tid, tl_tid, pstate_tid, pil_tid, cwp_tid, invr_tid, indr_tid,tlu_tid,
    tick_tid, tba_tid, asi_tid, active_thread, fsr_tid, sft_tid, tcmp_tid, gsr_tid, gl_tid,
    hpstate_tid, htba_tid, hintp_tid, flush_tid, htick_tid, stickcmp_tid, stick_tid,
    tl_tid_c, pstate_tid_c, y_tid_w, y_tid_w2, sfar_tid, dsfsr_tid, isfsr_tid, itag_tid,
    dtag_tid, iztxt_ps0_tid, iztxt_ps1_tid, inztxt_ps0_tid, inztxt_ps1_tid,
    dztxt_ps0_tid, dztxt_ps1_tid, dnztxt_ps0_tid, dnztxt_ps1_tid,
    izcfg_tid, dzcfg_tid,inzcfg_tid, dnzcfg_tid ;


reg [1:0] 	 sft_thrid[2:0], hintp_thrid[2:0], dsfsr_thrid[2:0], isfsr_thrid[2:0], sfar_thrid[2:0] ;

reg [1:0] 	 which_y_tid;
reg [2:0] 	 which_y_cntl;
reg [2:0] 	 sft_tid_vld, hintp_tid_vld, dsfsr_tid_vld, isfsr_tid_vld, sfar_tid_vld;

reg [2:0] 	 qualifier;
// record the used register

reg [74:0] 	 special[ 3:0];

reg [255:0] 	 spc_reg;
reg 		 fsr_first;
//muls
reg [3:0] 	 muls;
reg [1:0] 	 mul_tid, mul_tid_m;
reg [3:0] 	 cond;
//load delay
reg [3:0] 	 is_load_e, is_load_m,  is_load, is_load_w;
reg 		 exu_tlu_spill_m,ifu_exu_save_m;
//save pstate register
reg [9:0] 	 pstate [3:0];
reg [1:0] 	 tlu_tid_m;
//isfsr status
reg [3:0] 	 isfsr;

//hypervisor register
reg [3:0] 	 gl_cntl;
reg 		 spc_gl_cntl;
reg [1:0] 	 gl_val [3:0];
//hpstate
reg [3:0] 	 hpstate_cntl;
//
// modified due to hpstate.ibe addition
// reg [3:0] 	 hpstate_val [3:0];
reg [4:0] 	 hpstate_val [3:0];
//htba
reg [3:0] 	 htba_cntl;

reg [33:0] 	 htba_val [3:0];
//hintp
reg [3:0] 	 hintp_cntl, hintp_cntl_2;
reg [3:0] 	 hintp_val [3:0], hintp_val_2[3:0];
reg [3:0] 	 htba_del, hintp_del;
reg [3:0] 	 save_happen;
reg [3:0] 	 restore_happen;
reg [71:0] 	 active_window [127:0];
reg [1:0]     spc0_thread_pc_del;
reg [3:0] 	 invr_hold, invr_hold0, invr_hold1, invr_hold2, invr_hold3, invr_hold4;
integer       invr_time [3:0];

reg 		 sftint0_clk_del, sftint1_clk_del, sftint2_clk_del,sftint3_clk_del,
       sftint0_clk_del0, sftint1_clk_del0, sftint2_clk_del0,sftint3_clk_del0;
reg [3:0] 	 tick_int_en_del, tick_int_en_del1;
reg [3:0] 	 is_fsr_m, is_fsr_w;
//remember interrupt staus
reg [3:0] 	 wake_int;
reg 		 used_thread;
reg [3:0] 	 muls_ccr;
reg [8:0] 	 ifu_tlu_ttype_w;
reg [3:0] 	 tlu_rerr_vld_w;
reg 		 ifu_tlu_ttype_vld_w;
reg [3:0]	 previous_flush_happen, precise_trap_step;
reg [1:0] 	 ifu_tlu_thrid_m;

//back up int_receive value
reg [63:0] 	 back_intr[3:0];
reg 		 dummy;
reg [1:0] 	 gl_lvl0, gl_lvl1, gl_lvl2, gl_lvl3,
    gl_lvl0_t, gl_lvl1_t, gl_lvl2_t, gl_lvl3_t;
reg 		 npt0, npt1, npt2, npt3;
reg 		 tick_match_del;

//correctible error
reg [4:0] 	 frd_e, frd_m, frd_w;
reg [3:0] 	 fcc_wr;
reg [4:0] 	 frd_ws [3:0];
//correctible error

reg [3:0] 	 icc_wr;
reg [4:0] 	 irs1_ws [3:0];
reg [4:0] 	 irs2_ws [3:0];

wire[1:0] 	 fcorrect_thrid;
//fprs
reg [3:0] 	 fprs_cntl;
reg [2:0] 	 fprs_val [3:0];
reg [3:0] 	 fprs_cntl2;
reg [2:0] 	 fprs_val2 [3:0];
reg           which_fprs;

//fsrs
reg [23:0] 	 dsfsr_val [3:0];
reg [23:0] 	 isfsr_val [3:0];
reg [3:0] 	 dsfsr_cntl;
reg [3:0] 	 isfsr_cntl;
reg 		 spc_dsfsr_cntl;
reg 		 spc_isfsr_cntl;
reg 		 ffu_ifu_ecc_ue_w;
reg           ffu_ifu_ecc_ce_w;
reg 		 lsu_va_wtchpt0_wr_en_l_del, lsu_va_wtchpt1_wr_en_l_del,
       lsu_va_wtchpt2_wr_en_l_del, lsu_va_wtchpt3_wr_en_l_del;
//keep ccr
reg [7:0] 	 prev_ccr[3:0];
reg [3:0] 	 muls_pvld;

//need to compare the delayed pc value.
reg [3:0] cancel_steppc;
reg 	     tlu_ifu_flush_pipe_w2;


`ifdef SAS_DISABLE
`else
assign fcorrect_thrid =  ctl_dp_fp_thr[0] ? 0 :
       (ctl_dp_fp_thr[1] ? 1 :
        (ctl_dp_fp_thr[2] ? 2 :
         (ctl_dp_fp_thr[3] ? 3 : 0)));

//--------------------------------------------------
// For all tick cmpr register, after rst, just compare
// only bit[63]. the rest of bits are ignored.
reg [3:0]	  htickcmp_rst, stickcmp_rst, tickcmp_rst,
    htickcmp_rst_after, stickcmp_rst_after, tickcmp_rst_after;
reg [3:0] 	  htickcmpi_rst, stickcmpi_rst, tickcmpi_rst;
reg [3:0] 	  cpx_rst;
reg [3:0] 	  sec_rst;
reg [3:0] 	  warm_rst;
reg 		  warm_pc;
reg [3:0] 	  is_spu_load;

initial begin
    htickcmp_rst  = 0;
    stickcmp_rst  = 0;
    tickcmp_rst   = 0;
    htickcmpi_rst = 0;
    stickcmpi_rst = 0;
    tickcmpi_rst  = 0;
    cpx_rst       = 0;//power or wram reset
    htickcmp_rst_after = 0;
    stickcmp_rst_after = 0;
    tickcmp_rst_after  = 0;
    cancel_steppc      = 0;
    sec_rst            = 0;
    b2b_flush          = 0;
    warm_rst           = 0;
    warm_pc            = 0;
    muls_pvld          = 0;
    is_spu_load        = 0;

end
reg ifu_rstint_w;

//grab warm and power reset.
`ifndef VERILATOR
always @(posedge rst_l or ifu_rstint_m)begin
`else // ifndef VERILATOR
always @(posedge rst_l or posedge ifu_rstint_m)begin
`endif // ifndef VERILATOR
    if(rst_l)begin
        htickcmp_rst = 4'hf;
        stickcmp_rst = 4'hf;
        tickcmp_rst  = 4'hf;


    end
    if(ifu_rstint_m && cpx_rst[ifu_tlu_thrid_m])begin
        htickcmpi_rst[ifu_tlu_thrid_m] = 1;
        stickcmpi_rst[ifu_tlu_thrid_m] = 1;
        tickcmpi_rst[ifu_tlu_thrid_m]  = 1;
        cpx_rst[ifu_tlu_thrid_m]       = 0;
        warm_rst[ifu_tlu_thrid_m]      = 1;
    end
end // always @ (posedge rst_l or ifu_rstint_m)
reg [2:0] thrid_ind;
reg [63:0] ver_val;

reg [3:0] float_delay ;
reg [23:0] dsfsr_din_del;
reg [23:0] isfsr_din_del;
//tlb variable
reg [3:0]  tlb_lock, tlb_lock_s;
reg [63:0] tlb_lock_pc[3:0];
reg [3:0]  tlb_cmd    [3:0];
reg [3:0]  ok_push;
reg [3:0]  unlock_thrid;
reg [3:0]  psft_flush, csft_flush;
reg [3:0]  is_it_load, wait_load;
//variable for quad load
reg 	      dbl_m, dbl_w;
reg [3:0]  quad_load;
reg [1:0]  quad_cnt [3:0];
reg [63:0] quad_val [3:0];
//pcx iob register
reg [3:0]  coreavl, reset_stat, ctu_stat;

reg [3:0]  pure_load;
reg [3:0]  spec_load;
reg [2:0]  wrt_counter [3:0];
//reg [8:0]  ifu_tlu_ttype_w;
//reg 	      ifu_tlu_ttype_vld_w;
reg 	      softint_off;
reg 	      no_mmu_reg_cmp;
wire [3:0]  throw_pc;
reg [3:0]   throw_pc_w;

reg [63:0] throw_pcv [3:0];
//force flush because
reg [3:0]  spc0_force_flush;
reg [3:0]  spc0_force_flush_t;

reg [3:0]  spc0_force_flush_w;
reg [3:0]  spc0_force_flush_w2;

//delay trap;
reg [3:0]  spu_illgl;
reg [3:0]  spu_step;
reg 	      ifu_tlu_inst_vld_w;
reg [3:0]  throw_pc_m;
reg [3:0]  dtlb_pending_wait;
reg 	      mmu_fiveregs_off;
//internal load, register commited late.
reg [3:0]  late_load_m, late_load_w, late_load;
reg 	      block_load_kill_off;
reg [3:0]  store_delay_flush;
reg [63:0] prev_pc[3:0];
reg [63:0] prev_npc[3:0];
reg [3:0]  wtchpt_before;

// initialize all the regs.
initial begin
    block_load_kill_off = 0;
    late_load        = 0;
    spu_step         = 0;
    spc0_force_flush_w = 0;
    spc0_force_flush_t = 0;
    precise_trap_step= 0;
    softint_off      = 0;
    no_mmu_reg_cmp   = 0;
    mmu_fiveregs_off = 0;
`ifndef VERILATOR
    if($value$plusargs("softint_off=%h", softint_off))$display ("Info: softint option  %h", softint_off);
    if($value$plusargs("no_mmu_reg_cmp=%h", no_mmu_reg_cmp))$display ("Info: no_mmu_reg_cmp option  %h", no_mmu_reg_cmp);
    if($value$plusargs("mmu_fiveregs_off=%h", mmu_fiveregs_off))$display ("Info: mmu_fiveregs_off  %h", mmu_fiveregs_off);
    if($value$plusargs("block_load_kill_off=%h", block_load_kill_off))$display ("Info: block_load_kill_off  %h", block_load_kill_off);
`endif // ifndef VERILATOR
    store_delay_flush = 0;
    spec_load      = 0;
    pure_load      = 0;
    coreavl        = 0;
    reset_stat     = 0;
    ctu_stat       = 0;
    quad_load      = 0;
    ok_push        = 4'hf;
    unlock_thrid   = 0;
    psft_flush     = 0;
    csft_flush     = 0;
    tlb_lock       = 0;
    sfar_cntl      = 0;
    float_delay    = 0;
    icc_wr         = 0;
    fcc_wr         = 0;
    which_y_cntl   = 0;
    block_load     = 0;
    used_thread    = 0;
    wake_int       = 0;
    invr_hold      = 0;
    save_happen    = 0;
    restore_happen = 0;
    once_step      = 0;
    on_spc         = 0;
    set0_pc        = 0;
    delay_done     = 0;
    thread_status  = 0;
    spc_reg        = 0;
    fsr_first      = 0;
    muls           = 0;
    is_load        = 0;
    invr_cntl      = 0;
    muls_ccr       = 0;
    isfsr          = 0;
    is_fsr_m       = 0;
    is_fsr_w       = 0;
    previous_flush_happen = 0;
    pwr_tpc        = 0;
    pwr_tnpc       = 0;
    pwr_tstate     = 0;
    pwr_hstate     = 0;
    fprs_cntl      = 0;
    fprs_cntl2     = 0;
    for(i = 0; i < 4;i = i+1)begin
        delay_pc[i]   = 0;
        delay_npc[i]  = 0;
        cwp[i]        = 0;
        special[i]    = 0;
        pstate[i]     = 'h014;
    end
    for(i = 0; i < 8; i = i + 1)begin
        th_vec[i] = 3'b101;
    end
    #5 `SAS_TASKS.in_used[cpu_id] = 1'b1;
end // initial begin
//define temp. regs
reg [7:0] ifu_lsu_imm_asi_e,     ifu_lsu_imm_asi_m,     ifu_lsu_imm_asi_w;
reg 	     ifu_lsu_imm_asi_vld_e, ifu_lsu_imm_asi_vld_m, ifu_lsu_imm_asi_vld_w;
reg 	     ifu_lsu_st_inst_m,     ifu_lsu_st_inst_w, ifu_lsu_st_inst_w2;
reg       is_tlb;
reg 	     save_e, save_m, save_w;
reg 	     restore_e, restore_m, restore_w;
reg [1:0] thrid_e, thrid_m, thrid_w, thrid_w2;
reg 	     ifu_tlu_hwint_w, ifu_tlu_swint_w, ifu_tlu_rstint_w;
reg [3:0] tlu_ifu_hwint_i3_w;
// reg [3:0] tlu_htickcmp_en_l_del, tlu_stickcmp_en_l_del, tlu_tickcmp_en_l_del;
reg [3:0] htickcmp_intdis_en_del, stickcmp_intdis_en_del, tickcmp_intdis_en_del;

reg 	     ttype_sel_hstk_cmp_m, ttype_sel_hstk_cmp_w;
reg 	     ifu_tlu_wsr_inst_e, ifu_tlu_wsr_inst_m, ifu_tlu_wsr_inst_w;
reg [63:0] wsr[3:0];
//instrction
reg [31:0]  dtu_inst_e, dtu_inst_m, dtu_inst_w;
reg 	       fcl_fdp_inst_sel_nop_d_l, fcl_fdp_inst_sel_nop_e_l,
            fcl_fdp_inst_sel_nop_m_l, fcl_fdp_inst_sel_nop_w_l;
reg 	       retract_iferr_e, retract_iferr_m, retract_iferr_w;
//variable for instruction comparsion.
reg [3:0]   delay_inst_vld;
reg [3:0]   delay_inst_vld_w;

reg [3:0]   delay_inst_retract;

reg 	       tick_read_m, tick_read_w;
reg [31:0]  delay_inst[3:0];
reg 	       fpdis_trap_m,fpdis_trap_w;

reg 	       ffu_ifu_ecc_ue_w_vld,  ffu_ifu_ecc_ce_w_vld;
reg 	       ifu_lsu_ldst_dbl_m, ifu_lsu_ldst_dbl_w;
reg [3:0]   stepping;
reg [3:0]   ld_dbl;
reg [3:0]   mul_vld, prev_vld;
wire      sftint_tmp0, sftint_tmp1, sftint_tmp2, sftint_tmp3;
//assign    spc0_sfar_cntl = dsfar0_clk || dsfar1_clk || dsfar2_clk || dsfar3_clk;

assign      spc0_sfar_cntl = ~(&dmmu_sfar_wr_en_l);

assign sftint_tmp0 = sftint0_clk ||  sftint_b15_en[0] || sftint_b16_en[0];
assign sftint_tmp1 = sftint1_clk ||  sftint_b15_en[1] || sftint_b16_en[1];
assign sftint_tmp2 = sftint2_clk ||  sftint_b15_en[2] || sftint_b16_en[2];
assign sftint_tmp3 = sftint3_clk ||  sftint_b15_en[3] || sftint_b16_en[3];

always @(posedge clk)//flop all the signals for updating tlb.
begin
    if(spc0_inst_done || spc0_flush_happen)begin
        ld_dbl[spc0_thread_pc]   = ifu_lsu_ldst_dbl_w;
        prev_vld[spc0_thread_pc] = 0;
    end
    if(spc0_flush_happen)b2b_flush[spc0_thread_pc] = 1;
    if(spc0_inst_done)b2b_flush[spc0_thread_pc] = 0;
    if(spc0_trap_write)b2b_flush[spc0_trap_tid] = 0;
    if(ecl_irf_wen_w)b2b_flush[ecl_irf_tid_w] = 0;
    if(ecl_irf_wen_w2)b2b_flush[ecl_irf_tid_w2] = 0;
    ifu_rstint_w <= ifu_rstint_m;
    if(`SAS_TASKS.expected_warm)sec_rst = 4'b1111;
    fpdis_trap_m <= fpdis_trap_e;
    fpdis_trap_w <= fpdis_trap_m;
    //handle qual load
    dbl_m <= ifu_lsu_ldst_dbl_e &&
          ifu_lsu_ld_inst_e  &&
          !lsu_ffu_blk_asi_e &&
          ifu_lsu_alt_space_e &&
          lsu_quad_asi_e;
    dbl_w <= dbl_m;

    ifu_tlu_inst_vld_w <= ifu_tlu_inst_vld_m;

    ifu_lsu_ldst_dbl_m <= ifu_lsu_ldst_dbl_e & ifu_lsu_ld_inst_e;
    ifu_lsu_ldst_dbl_w <= ifu_lsu_ldst_dbl_m;


    fcl_fdp_inst_sel_nop_d_l <= fcl_fdp_inst_sel_nop_s_l;
    fcl_fdp_inst_sel_nop_e_l <= fcl_fdp_inst_sel_nop_d_l;
    fcl_fdp_inst_sel_nop_m_l <= fcl_fdp_inst_sel_nop_e_l;
    fcl_fdp_inst_sel_nop_w_l <= fcl_fdp_inst_sel_nop_m_l;
    retract_iferr_e <= retract_iferr_d;
    retract_iferr_m <= retract_iferr_e;
    retract_iferr_w <= retract_iferr_m;
    dtu_inst_e <= dtu_inst_d;
    dtu_inst_m <= dtu_inst_e;
    dtu_inst_w <= dtu_inst_m;
    //decode tick register read.
    tick_read_m <= local_rdpr_mx1_sel[0] &&  tlu_rdpr_mx5_sel[1] && tlu_rdpr_mx7_sel[1];
    tick_read_w <= tick_read_m;

    ttype_sel_hstk_cmp_m  <= ttype_sel_hstk_cmp_e;
    ttype_sel_hstk_cmp_w  <= ttype_sel_hstk_cmp_m & ifu_tlu_ttype_vld_m;
    ifu_lsu_imm_asi_e     <= ifu_lsu_imm_asi_d;
    ifu_lsu_imm_asi_m     <= ifu_lsu_imm_asi_e;
    ifu_lsu_imm_asi_w     <= ifu_lsu_imm_asi_m;

    ifu_lsu_imm_asi_vld_e <= ifu_lsu_imm_asi_vld_d;
    ifu_lsu_imm_asi_vld_m <= ifu_lsu_imm_asi_vld_e;
    ifu_lsu_imm_asi_vld_w <= ifu_lsu_imm_asi_vld_m;
    if(ifu_tlu_wsr_inst_w)wsr[spc0_thread_pc] = exu_tlu_wsr_data_w;

    ifu_lsu_st_inst_m     <= ifu_lsu_st_inst_e;
    ifu_lsu_st_inst_w     <= ifu_lsu_st_inst_m;
    ifu_lsu_st_inst_w2    <= ifu_lsu_st_inst_w;

    ifu_tlu_hwint_w       <= ifu_tlu_hwint_m;
    ifu_tlu_swint_w       <= ifu_tlu_swint_m;
    ifu_tlu_rstint_w      <= ifu_tlu_rstint_m;
    tlu_ifu_hwint_i3_w    <= tlu_ifu_hwint_i3;
    ifu_tlu_wsr_inst_e    <= ifu_tlu_wsr_inst_d;
    ifu_tlu_wsr_inst_m    <= ifu_tlu_wsr_inst_e;
    ifu_tlu_wsr_inst_w    <= ifu_tlu_wsr_inst_m;

    sftint0_clk_del0      <= sftint_tmp0;
    sftint1_clk_del0      <= sftint_tmp1;//sftint1_clk ||  sftint_b15_en[1] || sftint_b16_en[1];
    sftint2_clk_del0      <= sftint_tmp2;//sftint2_clk ||  sftint_b15_en[2] || sftint_b16_en[2];
    sftint3_clk_del0      <= sftint_tmp3;//sftint3_clk ||  sftint_b15_en[3] || sftint_b16_en[3];'
    sftint0_clk_del       <= sftint0_clk_del0;
    sftint1_clk_del       <= sftint1_clk_del0;
    sftint2_clk_del       <= sftint2_clk_del0;
    sftint3_clk_del       <= sftint3_clk_del0;
    // tick_int_en_del       <= tick_int_en;
    tick_int_en_del[3:0]  <= sftint_b0_en[3:0];
    tick_int_en_del1      <= tick_int_en_del;
    ifu_lsu_block_m       <= ifu_lsu_block_e;
    ifu_lsu_block_w       <= ifu_lsu_block_m & ifu_tlu_inst_vld_m;
    is_fsr_m              <= 0;//isfsr;
    is_fsr_w              <= is_fsr_m;
    ifu_tlu_ttype_w       <= ifu_tlu_ttype_m;
    tlu_rerr_vld_w        <= tlu_rerr_vld;
    ifu_tlu_ttype_vld_w   <= ifu_tlu_ttype_vld_m;
    //save flush signal to understand which trap taken on the w2 statge.
    //if the precise trap is taken, send the stepping to simics.
    //if(spc0_flush_happen)previous_flush_happen[spc0_thread_pc] <= ~stepping[spc0_thread_pc];
    //if(spc0_inst_done && previous_flush_happen[spc0_thread_pc])previous_flush_happen[spc0_thread_pc] <= 0;
    ifu_tlu_thrid_m       <= ifu_tlu_thrid_e;
    if(gl0_en)gl_lvl0 <= gl_lvl0_new;
    if(gl1_en)gl_lvl1 <= gl_lvl1_new;
    if(gl2_en)gl_lvl2 <= gl_lvl2_new;
    if(gl3_en)gl_lvl3 <= gl_lvl3_new;
    npt0 <= tick_npt0;
    npt1 <= tick_npt1;
    npt2 <= tick_npt2;
    npt3 <= tick_npt3;
    tick_match_del <= tick_match;
    frd_e <= ctl_frf_addr;
    frd_m <= frd_e;
    frd_w <= frd_m;
    //dsfsr_din_del <=   dsfsr_din;
    //isfsr_din_del <=   isfsr_din;
    pc_m <= pc_e;
    //error correction
    ffu_ifu_ecc_ue_w     <= ffu_ifu_ecc_ue_w2;
    ffu_ifu_ecc_ce_w     <= ffu_ifu_ecc_ce_w2;
    ffu_ifu_ecc_ue_w_vld <= rs2_fst_ue_w3;
    ffu_ifu_ecc_ce_w_vld <= rs2_fst_ce_w3;
    //tlu trap signals
    ifu_tlu_ttype_w     <= ifu_tlu_ttype_m;
    ifu_tlu_ttype_vld_w <= ifu_tlu_ttype_vld_m;
    tlu_ifu_flush_pipe_w2 <= tlu_ifu_flush_pipe_w;

end

reg ifu_exu_muls_e, ifu_exu_muls_m, ifu_exu_muls_w;

reg [3:0] load_for_tlb_e, load_for_tlb_m, load_for_tlb_w;
reg [3:0] throw_not_st;



always @(posedge clk)begin

    thread_buf_d   <= thread_id_cntl;
    thread_buf_e   <= thread_buf_d;
    delay_st0[ifu_tlu_thrid_e]   <= ifu_lsu_st_inst_e  & (~ifu_lsu_ld_inst_e);
    delay_st1      <= delay_st0;

    //mulx instructions
    ifu_exu_muls_e <= ifu_exu_muls_d;
    // && !ifu_tlu_flush_w;
    ifu_exu_muls_m <= ifu_exu_muls_e;
    ifu_exu_muls_w <= ifu_exu_muls_m;

    mul_tid_m      <= ifu_tlu_thrid_e;
    mul_tid        <=  mul_tid_m;

    if(ifu_exu_muls_w && spc0_inst_done)muls[mul_tid] = 1'b1;
    is_load_e[ifu_tlu_thrid_e] <= ifu_lsu_ld_inst_e & (!lda_internal_e && fcl_dtu_inst_vld_e ||
             lda_internal_e && ( //mondo Qhead pointer
                 (asi_state_e   == 8'h25) && (exu_lsu_ldst_va_e == 'h3c8)));
    //incoming vector register read.
    late_load_m[ifu_tlu_thrid_e] <= lda_internal_e &&  (asi_state_e == 8'h74) && (exu_lsu_ldst_va_e == 'h000);
    late_load_w <= late_load_m;

    is_load_m                  <= is_load_e;
    is_load_w                  <= is_load_m;

    load_for_tlb_e[ifu_tlu_thrid_e] <= ifu_lsu_ld_inst_e;
    load_for_tlb_m <= load_for_tlb_e;
    load_for_tlb_w <= load_for_tlb_m;
    tlu_tid_m                  <= ifu_tlu_thrid_e;
    //flop interrupt reg
    if(rst_l)begin
        t0_invr   <= t0_inrr_i2;
        t1_invr   <= t1_inrr_i2;
        t2_invr   <= t2_inrr_i2;
        t3_invr   <= t3_inrr_i2;
        if(t_invr_cntl[0])t0_invr_val <= t0_inrr_i2;
        if(t_invr_cntl[1])t1_invr_val <= t1_inrr_i2;
        if(t_invr_cntl[2])t2_invr_val <= t2_inrr_i2;
        if(t_invr_cntl[3])t3_invr_val <= t3_inrr_i2;
        t0_indr_p <= t0_indr;
        t1_indr_p <= t1_indr;
        t2_indr_p <= t2_indr;
        t3_indr_p <= t3_indr;
        invr_hold0 <= t_invr_cntl;
        invr_hold  <= invr_hold0;
    end // if (rst_l)
    //flop save and restore
    save_e <= ifu_exu_save_d;
    save_m <= save_e;
    save_w <= save_m;
    restore_e <= ifu_exu_restore_d;
    restore_m <= restore_e;
    restore_w <= restore_m;
    thrid_e <= ifu_tlu_thrid_d;
    thrid_m <= thrid_e;
    thrid_w <= thrid_m;
    thrid_w2<= thrid_w;

    // tlu_htickcmp_en_l_del <= tlu_htickcmp_en_l;
    //tlu_stickcmp_en_l_del <= tlu_stickcmp_en_l;
    //tlu_tickcmp_en_l_del  <= tlu_tickcmp_en_l;
    htickcmp_intdis_en_del <= htickcmp_intdis_en;
    stickcmp_intdis_en_del <= stickcmp_intdis_en;
    tickcmp_intdis_en_del  <= tickcmp_intdis_en;
end // always @ (posedge clk)
// assign spc0_dsfsr_cntl = dsfsr0_clk || dsfsr1_clk || dsfsr2_clk || dsfsr3_clk;
assign spc0_dsfsr_cntl = ~(&dmmu_sfsr_wr_en_l);

// assign spc0_isfsr_cntl = isfsr0_clk || isfsr1_clk || isfsr2_clk || isfsr3_clk;
assign spc0_isfsr_cntl = ~(&immu_sfsr_wr_en_l);

assign next_sft_wr_id = !tlu_sftint_en_l_g[0] ? 2'b00 :
       (!tlu_sftint_en_l_g[1] ? 2'b01 :
        (!tlu_sftint_en_l_g[2] ? 2'b10 :
         (!tlu_sftint_en_l_g[3] ? 2'b11 : 2'b00)));
//generate precise traps needed to be stepped.
//trap type == 9'h10 :illegal instrcution
assign tlu_rerr_vld_flush    = ((ifu_tlu_ttype_w == 9'h7e  && tlu_rerr_vld_w[spc0_thread_pc]) && tlu_ifu_flush_pipe_w ||
                                (ifu_tlu_ttype_w == 9'h10) && tlu_ifu_flush_pipe_w && !delay_done[spc0_thread_pc]
                               )  &&
       ifu_tlu_ttype_vld_w && ~(ifu_tlu_hwint_w || ifu_tlu_swint_w || ifu_tlu_rstint_w);

assign tlu_parity_flush      = (ifu_tlu_ttype_w == 9'h0a && !lsu_tlu_defr_trp_taken_g && !ifu_tlu_flush_w ||
                                ifu_tlu_ttype_w == 9'h73) && tlu_ifu_flush_pipe_w && ifu_tlu_ttype_vld_w;

assign spc0_flush_happen     =  (tlu_ifu_flush_pipe_w &&
                                 !throw_pc[spc0_thread_pc] &&
                                 !spc0_inst_done && !ifu_tlu_flush_w &&
                                 !lsu_tlu_defr_trp_taken_g &&//handle rollback
                                 !dtlb_pending_wait[spc0_thread_pc] && !b2b_flush[spc0_thread_pc] &&
                                 (ifu_tlu_hwint_w       ||
                                  ifu_tlu_swint_w       ||
                                  ifu_tlu_rstint_w      ||
                                  ttype_sel_hstk_cmp_w  ||
                                  |ifu_spu_trap_ack     ||
                                  lsu_mmu_flush_pipe_w) ||
                                 tlu_parity_flush &&  !lsu_tlu_defr_trp_taken_g   ||
                                 //tlb error injection case.
                                 spc0_force_flush_w[spc0_thread_pc] &&
                                 inst_done_w_for_sas &&
                                 (!throw_pc[spc0_thread_pc]  && !lsu_tlu_defr_trp_taken_g ||
                                  throw_pc[spc0_thread_pc]  && ifu_lsu_st_inst_w  && ifu_lsu_st_inst_w2)&&
                                 !b2b_flush[spc0_thread_pc]  &&
                                 !(lsu_tlu_ttype_vld_m2 && (lsu_tlu_ttype_m2 == 8'h34 || lsu_tlu_ttype_m2 == 8'h6c) ||
                                   ifu_tlu_ttype_vld_w  && ifu_tlu_ttype_w == 8'h74)) && !store_delay_flush[spc0_thread_pc];
/* ||
!inst_done_w_for_sas && tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f && (pcr0[6] ||
pcr1[6] ||
pcr2[6] ||
pcr3[6]);*/



// && (tlu_ifu_flush_pipe_w ||
//									throw_pc_m[spc0_thread_pc] ||
//									throw_not_st[spc0_thread_pc]);

assign spc0_flush_happen_m  =  (ifu_tlu_hwint_m      ||
                                ifu_tlu_swint_m      ||
                                ifu_tlu_rstint_m);


//generate intrv

assign ifu_lsu_block_e       = ifu_lsu_ld_inst_e & ifu_lsu_alt_space_e &
       ifu_lsu_ldst_fp_e & ifu_lsu_ldst_dbl_e  & lsu_ffu_blk_asi_e;

assign spc0_gl_cntl          = |{gl3_en, gl2_en, gl1_en, gl0_en};

assign spc0_htba_cntl        = ~(&htba_del);
assign spc0_hintp_cntl       = ~(&hintp_del);
//assign spc0_htick_cntl       = ~(&tlu_htickcmp_en_l_del);
//assign spc0_stickcmp_cntl    = ~(&tlu_stickcmp_en_l_del);
assign spc0_htick_cntl       = (|htickcmp_intdis_en_del);
assign spc0_stickcmp_cntl    = (|stickcmp_intdis_en_del);
assign spc0_gsr_cntl[0]      = t0_gsr_wsr_w | t0_siam_w | t0_alignaddr_w;
assign spc0_gsr_cntl[1]      = t1_gsr_wsr_w | t1_siam_w | t1_alignaddr_w;
assign spc0_gsr_cntl[2]      = t2_gsr_wsr_w | t2_siam_w | t2_alignaddr_w;
assign spc0_gsr_cntl[3]      = t3_gsr_wsr_w | t3_siam_w | t3_alignaddr_w;
assign t_invr_cntl[0]        = rst_l & (t0_invr != t0_inrr_i2);
assign t_invr_cntl[1]        = rst_l & (t1_invr != t1_inrr_i2);
assign t_invr_cntl[2]        = rst_l & (t2_invr != t2_inrr_i2);
assign t_invr_cntl[3]        = rst_l & (t3_invr != t3_inrr_i2);

assign t0_indr_cntl          = rst_l & (t0_indr_p != t0_indr);
assign t1_indr_cntl          = rst_l & (t1_indr_p != t1_indr);
assign t2_indr_cntl          = rst_l & (t2_indr_p != t2_indr);
assign t3_indr_cntl          = rst_l & (t3_indr_p != t3_indr);
//added one more signal for thread id read.
assign  thread_id_cntl       = (~dtu_fdp_rdsr_sel_thr_e_l) &&
        ifu_exu_rd_ifusr_e         &&
        (~ifu_exu_use_rsr_e_l)      &&
        inst_vld_qual_e;

assign spc0_rtl_reg_val_w    = byp_irf_rd_data_w;
assign spc0_rtl_reg_val_w2   = byp_irf_rd_data_w2;

assign spc0_rtl_wr_en        = ecl_irf_wen_w | ecl_irf_wen_w2;
assign spc0_thread_w         = ecl_irf_tid_w;
assign spc0_thread_w2        = ecl_irf_tid_w2;

assign spc0_thread_pc        = ifu_tlu_thrid_w;
assign cur_thread            = spc0_rtl_wr_en ? spc0_thread_w : spc0_thread_pc;

assign spc0_ccr_cntl         = ~(wen_thr0_l &&  wen_thr1_l  && wen_thr2_l && wen_thr3_l);
assign spc0_cwp_cntl         = ~(&cwp_wen_l);
assign spc0_cansave_reg      = next_cansave_w;
assign spc0_cansave_cntl     = cansave_wen_w;
assign spc0_canrestore_reg   = next_canrestore_w;
assign spc0_canrestore_cntl  = canrestore_wen_w;
assign spc0_otherwin_reg     = next_otherwin_w;
assign spc0_otherwin_cntl    = otherwin_wen_w;
assign spc0_wstate_reg       = tl_exu_tlu_wsr_data_w[5:0];
assign spc0_wstate_cntl      = ecl_rml_wstate_wen_w;
assign spc0_cleanwin_reg     = next_cleanwin_w;
assign spc0_cleanwin_cntl    = cleanwin_wen_w;

assign spc0_y_cntl           =  ecl_div_yreg_wen_l == 4'b1111 ? 0 : 1;
assign spc0_wrsr_cntl        = ifu_tlu_wsr_inst_d;
assign spc0_wrsr_addr        = ifu_tlu_sraddr_d;

// instruction completion
assign spc0_inst_done_trap   = inst_done_w_for_sas &&
       !(ifu_tlu_flush_w)  &&
       !(ffu_ifu_fst_ce_w && !tlu_ifu_flush_pipe_w) ||
       tlu_rerr_vld_flush;

assign spc0_inst_done        = spc0_inst_done_trap && !throw_pc[spc0_thread_pc] && !store_delay_flush[spc0_thread_pc] &&
       !tlu_parity_flush &&
       !(pib_pich_wrap[spc0_thread_pc] && tlu_ifu_flush_pipe_w && (pcr0[7] && spc0_thread_pc == 0 ||
               pcr1[7] && spc0_thread_pc == 1 ||
               pcr2[7] && spc0_thread_pc == 2 ||
               pcr3[7] && spc0_thread_pc == 3 ))&&
       (!spc0_force_flush_w[spc0_thread_pc] ||
        // !tlu_ifu_flush_pipe_w &&
        spc0_force_flush_w[spc0_thread_pc] && lsu_tlu_ttype_m2 == 9'h68 && lsu_tlu_ttype_vld_m2) &&
       !(dtlb_pending_wait[spc0_thread_pc] && tlu_ifu_flush_pipe_w) ;
// && lsu_mmu_flush_pipe_w);

// program counter
assign spc0_rtl_pc           = ifu_tlu_pc_w;
assign spc0_rtl_npc          = ifu_tlu_npc_w;

assign spc0_tl_cntl          = tl0_en || tl1_en || tl2_en || tl3_en;

assign spc0_tl_reg           = (tl0_en ? trp_lvl0_new[2:0] :
                                (tl1_en ? trp_lvl1_new[2:0] :
                                 (tl2_en ? trp_lvl2_new[2:0] :
                                  (tl3_en ? trp_lvl3_new[2:0] :
                                   'hx))));
assign spc0_fprs_cntl       = fprs_sel_wrt || fprs_sel_set;

//
// added for timing fix in RTL
assign update_hpstate0_w2 = ~update_hpstate_l_w2[0];
assign update_hpstate1_w2 = ~update_hpstate_l_w2[1];
assign update_hpstate2_w2 = ~update_hpstate_l_w2[2];
assign update_hpstate3_w2 = ~update_hpstate_l_w2[3];

assign spc0_pstate_cntl      = update_pstate0_w2 || update_pstate1_w2 ||
       update_pstate2_w2 || update_pstate3_w2 || |pstate_priv_update_w2[3:0];
assign spc0_hpstate_cntl     = |{update_hpstate3_w2, update_hpstate2_w2, update_hpstate1_w2, update_hpstate0_w2} ||
       |hpstate_priv_update_w2[3:0];
// modified due to width change in RTL
assign tmp_pstate_reg[5:0] =
       ((update_pstate0_w2 | pstate_priv_update_w2[0]) ? restore_pstate0[5:0] :
        ((update_pstate1_w2 | pstate_priv_update_w2[1]) ? restore_pstate1[5:0] :
         ((update_pstate2_w2 | pstate_priv_update_w2[2]) ? restore_pstate2[5:0] :
          ((update_pstate3_w2 | pstate_priv_update_w2[3]) ? restore_pstate3[5:0] :
           'hx))));

assign spc0_pstate_reg0 = {2'b0, // old int, mmu global
                           restore_pstate0[5:4], // cle, tle
                           2'b0, // hardcoded mmodel
                           1'b0, // old redmode
                           restore_pstate0[3:0], // fp enable, AM, pstate priv, ie
                           1'b0}; // old alternate global
assign spc0_pstate_reg1 = {2'b0, // old int, mmu global
                           restore_pstate1[5:4], // cle, tle
                           2'b0, // hardcoded mmodel
                           1'b0, // old redmode
                           restore_pstate1[3:0], // fp enable, AM, pstate priv, ie
                           1'b0}; // old alternate global
assign spc0_pstate_reg2 = {2'b0, // old int, mmu global
                           restore_pstate2[5:4], // cle, tle
                           2'b0, // hardcoded mmodel
                           1'b0, // old redmode
                           restore_pstate2[3:0], // fp enable, AM, pstate priv, ie
                           1'b0}; // old alternate global
assign spc0_pstate_reg3 = {2'b0, // old int, mmu global
                           restore_pstate3[5:4], // cle, tle
                           2'b0, // hardcoded mmodel
                           1'b0, // old redmode
                           restore_pstate3[3:0], // fp enable, AM, pstate priv, ie
                           1'b0}; // old alternate global

/*
assign spc0_pstate_reg       =  ((update_pstate0_w2 | pstate_priv_update_w2[0]) ? restore_pstate0 :
((update_pstate1_w2 | pstate_priv_update_w2[1]) ? restore_pstate1 :
((update_pstate2_w2 | pstate_priv_update_w2[2]) ? restore_pstate2 :
((update_pstate3_w2 | pstate_priv_update_w2[3]) ? restore_pstate3 :
'hx))));
*/
//trap level
assign spc0_tick_reg         =  exu_tlu_wsr_data_w;
assign spc0_tick_cntl        =  tick0_en || tick1_en || tick2_en || tick3_en;


assign spc0_tba_reg          =  exu_tlu_wsr_data_w;
assign spc0_tba_cntl         =  ~tba0_en || ~tba1_en || ~tba2_en || ~tba3_en;


assign spc0_pil_cntl         =  pil0_en || pil1_en || pil2_en || pil3_en;
assign spc0_pil_reg          =  pil;
//
// modified due to tsa memory swap
// assign spc0_trap_write       =  tsa_wr_vld && tlu_rst_l;
// assign spc0_trap_pc          =  tsa_pc_en  & tsa_wr_vld;
// assign spc0_trap_npc         =  tsa_npc_en & tsa_wr_vld;
assign spc0_trap_write       =  (|tsa_wr_vld[1:0]) && tlu_rst_l;
assign spc0_trap_pc          =  tsa_pc_en  & tsa_wr_vld[0];
assign spc0_trap_npc         =  tsa_npc_en & tsa_wr_vld[1];

assign spc0_trap_tstate      =  tsa_tstate_en;
assign spc0_trap_htstate     =  tsa_htstate_en;
assign spc0_trap_ttype       =  tsa_ttype_en;
assign spc0_trap_tid         =  tsa_wr_tid[1:0];
assign spc0_trap_tpl         =  tsa_wr_tpl[2:0];
//
// modified to work with the official memory
// assign spc0_trap_data        = (temp_tlvl[134:0] & ~write_mask[134:0]) |
//                               (tsa_wdata[134:0] & write_mask[134:0]) ;
assign temp_trap_data0       = (temp_tlvl0[79:0] & ~write_mask0[79:0]) |
       (tsa0_wdata[79:0] &  write_mask0[79:0]) ;

assign temp_trap_data1       = (temp_tlvl1[79:0] & ~write_mask1[79:0]) |
       (tsa1_wdata[79:0] &  write_mask1[79:0]) ;

assign spc0_trap_data        = {temp_trap_data1[`TSA1_HTSTATE_HI:`TSA1_HTSTATE_LO],
                                temp_trap_data0[`TSA0_TPC_HI:`TSA0_TPC_LO],
                                temp_trap_data1[`TSA1_TNPC_HI:`TSA1_TNPC_LO],
                                temp_trap_data0[`TSA0_TSTATE_HI:`TSA0_TSTATE_LO],
                                temp_trap_data1[`TSA1_TTYPE_HI:`TSA1_TTYPE_LO]};
//
//asi register
assign spc0_asi_cntl         = |asi_state_wr_thrd;
assign spc0_asi_state        = asi_wr_din;
//int in bound
assign is_int_in_bound = ifu_lsu_st_inst_w && (ifu_lsu_imm_asi_w == 8'h72);

reg [4:0]  rs1_m,      rs1_w,      rs1_g,       rs1_w2, rs2_m, rs2_w, rs2_g, rs2_w2;
reg [63:0] alu_rs1_m,  alu_rs1_w2, alu_rs2_m,   alu_rs2_w2;
//mmu registers
wire       spc0_wtchpt_cntl;
wire       spc0_sctxt_cntl;
wire       spc0_pctxt_cntl;
wire       spc0_pid_cntl;
reg [2:0]  pid_val    [3:0];
reg [12:0] pctxt_val  [3:0],  sctxt_val [3:0];
reg [47:3] wtchpt_val [3:0];
reg [3:0]  pid_cntl, sctxt_cntl, pctxt_cntl, wtchpt_cntl;
reg 	      spc_wtchpt_cntl, spc_sctxt_cntl, spc_pctxt_cntl, spc_pid_cntl;
reg [1:0]  pctxt_tid, sctxt_tid,wtchpt_tid, pid_tid ;
reg [3:0]  pctxt_state_wr_thrd_del, sctxt_state_wr_thrd_del, pid_state_wr_en_del;

assign     spc0_wtchpt_cntl = !(lsu_va_wtchpt0_wr_en_l_del && lsu_va_wtchpt1_wr_en_l_del &&
                                lsu_va_wtchpt2_wr_en_l_del && lsu_va_wtchpt3_wr_en_l_del);
assign     spc0_sctxt_cntl = |sctxt_state_wr_thrd_del;
assign     spc0_pctxt_cntl = |pctxt_state_wr_thrd_del;
assign     spc0_pid_cntl   = |pid_state_wr_en_del;
//mmu new register
//=========================================================================================
//      WR DATA FOR MRA
//=========================================================================================
// Format for each entry of MRA on a per thread basis.
// Current :
//      |       dtsb(48b)       |       dtag_access(48b)        |       dsfar(48b)      |
//      |       itsb(48b)       |       itag_access(48b)        |                       |
// New(Hyp,Legacy) : 8 tsb per thread instead of 2. dsfar removed.
// -This allows tag-access to be lined up with simultaneous reads of tsb
// -zero-ctxt and non-zero-ctxt tag-access will have to be distinguished either
// by doing a zero-detect on the lower 13b of the write-data or using a disinct asi.
//      |       zcps0_dtsb(48b) |       zcps1_dtsb(48b) |       zctxt_dtag_acc(48b) | dzctxt_cfg(6b) |
//      |       zcps0_itsb(48b) |       zcps1_itsb(48b) |       zctxt_itag_acc(48b) | izctxt_cfg(6b) |
//      |       nzcps0_dtsb(48b)|       nzcps1_dtsb(48b)|       nzctxt_dtag_acc(48b)| dnzctxt_cfg(6b)|
//      |       nzcps0_itsb(48b)|       nzcps1_itsb(48b)|       nzctxt_itag_acc(48b)| inzctxt_cfg(6b)|
//assign  mra_wdata[155:0] =
//     {lsu_tlu_st_rs3_data_b47t0_g[47:12],8'd0,                          [155:112]
//      lsu_tlu_st_rs3_data_b47t0_g[3:0],       //ps0 zctxt,nzctxt tsb    [111:108]
//      lsu_tlu_st_rs3_data_b47t0_g[47:12],8'd0,                          [107:64]
//      lsu_tlu_st_rs3_data_b47t0_g[3:0],       //ps1 zctxt,nzctxt tsb    [63:60]
//      tag_access_wdata[47:0],                 //i/d tag-access          [59:12]
//      lsu_tlu_st_rs3_data_b47t0_g[10:8],      //ps1 page size           [11:9]
//      lsu_tlu_st_rs3_data_b47t0_g[2:0],       //ps0 page size           [8:6]
//      6'd0};                                  //                        [5:0] config
//assign  mra_wr_ptr[3:0] = {thrid_g[1:0], idside_nzctxt_access_wr, iside_mra_access_wr};

reg [47:0] dtag_access_val[3:0],   itag_access_val[3:0];
reg [3:0]  dtag_access_cntl,       itag_access_cntl;

reg [47:0] dctxt_ztxt_ps0_val[3:0], ictxt_ztxt_ps0_val[3:0];
reg [47:0] dctxt_ztxt_ps1_val[3:0], ictxt_ztxt_ps1_val[3:0];
reg [5:0]  dctxt_zcfg_val[3:0],     ictxt_zcfg_val[3:0];


reg [3:0]  dctxt_ztxt_ps0_cntl, ictxt_ztxt_ps0_cntl;
reg [3:0]  dctxt_ztxt_ps1_cntl, ictxt_ztxt_ps1_cntl;
reg [3:0]  dctxt_zcfg_cntl,     ictxt_zcfg_cntl;

reg [47:0] dctxt_nztxt_ps0_val[3:0], ictxt_nztxt_ps0_val[3:0];
reg [47:0] dctxt_nztxt_ps1_val[3:0], ictxt_nztxt_ps1_val[3:0];
reg [5:0]  dctxt_nzcfg_val[3:0],     ictxt_nzcfg_val[3:0];


reg [3:0]  dctxt_nztxt_ps0_cntl, ictxt_nztxt_ps0_cntl;
reg [3:0]  dctxt_nztxt_ps1_cntl, ictxt_nztxt_ps1_cntl;
reg [3:0]  dctxt_nzcfg_cntl,     ictxt_nzcfg_cntl;

reg [3:0]  mra_wr_ptr_d1, mra_wr_ptr_d2;
reg 	      mra_wr_vld_d1, mra_wr_vld_d2;

reg [7:0]  dmmu_asi_req [3:0];
reg [63:0] dmmu_asi_pc  [3:0];
reg [7:0]  immu_asi_req [3:0];
reg [63:0] immu_asi_pc  [3:0];

reg [3:0]  dmmu_idx, immu_idx;

reg        spc_inztxt_ps0_cntl,  spc_inztxt_ps1_cntl;
reg        spc_dnztxt_ps0_cntl,  spc_dnztxt_ps1_cntl;
reg        spc_iztxt_ps0_cntl,   spc_iztxt_ps1_cntl;
reg        spc_dztxt_ps0_cntl,   spc_dztxt_ps1_cntl;
reg        spc_ictxt_nzcfg_cntl, spc_dctxt_nzcfg_cntl;
reg        spc_ictxt_zcfg_cntl,  spc_dctxt_zcfg_cntl;
reg        spc_itag_access_cntl, spc_dtag_access_cntl;
reg [3:0]  immu_miss, dmmu_miss;
reg [3:0]  trap_write_d2;
reg [3:0] 		     next_mul;
reg [7:0] 		     next_val [3:0];
reg [3:0] 		     sent_4f_flag;
initial begin
    next_mul = 0;

    dctxt_nztxt_ps0_cntl = 0;
    ictxt_nztxt_ps0_cntl = 0;
    dctxt_nztxt_ps1_cntl = 0;
    ictxt_nztxt_ps1_cntl = 0;
    dctxt_nzcfg_cntl     = 0;
    ictxt_nzcfg_cntl     = 0;
    dctxt_ztxt_ps0_cntl  = 0;
    ictxt_ztxt_ps0_cntl  = 0;
    dctxt_ztxt_ps1_cntl  = 0;
    ictxt_ztxt_ps1_cntl  = 0;
    dctxt_zcfg_cntl      = 0;
    ictxt_zcfg_cntl      = 0;
    dtag_access_cntl     = 0;
    itag_access_cntl     = 0;
    dmmu_idx             = 0;
    immu_idx             = 0;
    immu_miss            = 0;
    dmmu_miss            = 0;
    trap_write_d2        = 0;
end // initial begin
/*--------------------------------------------------------------------------------
pcr register
overH, overL, SL, UT, ST, PRIV
bit   8     7    6-4  2    1   0
SL:000 Number of store buffer fullcycles
SL:001 Number of completed fp instructins
SL:010 IMISS
SL:011 DMISS
SL:100 ITLB
SL:101 DTLB
SL:110 L2IMISS
SL:111 L2DMISS

--------------------------------------------------------------------------------*/

reg 	     pic_on;

reg [3:0] pic_over;
reg [3:0] ignore_step, ignore_step_w2;

initial begin
    pic_over = 0;
    ignore_step = 0;
    ignore_step_w2 = 0;

end
reg pcr_def_enable_w;
reg [3:0] pcr_def_enable;
reg [3:0] pcr_on;
reg [3:0] pcr_int;
reg [3:0] not_4e;
reg [3:0] ok_4f;
reg [3:0] pic_m, pic_w, pic_w2;

always @(posedge clk)begin
    pic_w  <= pic_m;
    pic_w2 <= pic_w;
end

initial pcr_def_enable = 0;

wire pcr_def_enable_m = pib_picl_wrap;

//check mmu
task check_mmu_miss;
    reg [1:0]   mra_thrid;
    begin
        mra_thrid = mra_wr_ptr[3:2];

        if(ifu_tlu_ttype_vld_w &&
                (ifu_tlu_ttype_w[8:0] == 9'h64))begin
            immu_miss[ifu_tlu_thrid_w] = 1;
        end
        if(mra_field3_en && mra_wr_vld && mra_wr_ptr[0]) immu_miss[mra_thrid] = 1;
        if(mra_field3_en && mra_wr_vld && !mra_wr_ptr[0])dmmu_miss[mra_thrid] = 1;
        if(lsu_tlu_ttype_vld_m2 &&
                (lsu_tlu_ttype_m2[8:0] == 9'h68  ||
                 lsu_tlu_ttype_m2[8:0] == 9'h30) ||
                (lsu_tlu_ttype_m2[8:0] == 9'h30) && tlu_ifu_trappc_vld_w1)begin
            dmmu_miss[ifu_tlu_thrid_w] = 1;
        end

        if(tlu_ifu_trappc_vld_w1 && (tlu_final_ttype_w2 == 8'h08 ||
                                     tlu_final_ttype_w2 == 8'h09))immu_miss[thrid_w2] = 1;

        if(spc0_trap_write && (immu_miss[spc0_trap_tid] || dmmu_miss[spc0_trap_tid]))
            trap_write_d2[spc0_trap_tid] = 1;
    end
endtask

//smash mmu store asi when flush happen
task smash_mmu_asi;
    input [1:0] thrid;
    begin
        if(spc0_rtl_pc == immu_asi_pc[thrid])immu_idx[thrid] = 0;
        if(spc0_rtl_pc == dmmu_asi_pc[thrid])dmmu_idx[thrid] = 0;
    end
endtask // smash_mmu_asi

//save mmu command which is used to distinguish the request after instruction done.
task mmu_asi_operation;
    begin
        if(asi_state_e == 8'h35 || asi_state_e == 8'h36 || asi_state_e == 8'h37 || asi_state_e == 8'h3d       ||
                asi_state_e == 8'h3e || asi_state_e == 8'h3f || (asi_state_e == 8'h50) && (exu_lsu_ldst_va_e == 8'h30)
          )begin
            immu_asi_req[ifu_tlu_thrid_e] = asi_state_e;
            immu_asi_pc[ifu_tlu_thrid_e]  = pc_e;
            immu_idx[ifu_tlu_thrid_e]     = 1;
        end
        //define        HSCPD_ASI_VA_ADDR_LO   3'h4
        //`define        HSCPD_ASI_VA_ADDR_HI   3'h5
        if(asi_state_e == 8'h31 || asi_state_e == 8'h32 || asi_state_e == 8'h33 || asi_state_e == 8'h39       ||
                asi_state_e == 8'h3a || asi_state_e == 8'h3b || asi_state_e == 8'h58 && exu_lsu_ldst_va_e == 8'h30 ||
                asi_state_e == 8'h20 && (exu_lsu_ldst_va_e[`TLU_ASI_SCPD_VA_HI:`TLU_ASI_SCPD_VA_LO] == `HSCPD_ASI_VA_ADDR_LO ||
                                         exu_lsu_ldst_va_e[`TLU_ASI_SCPD_VA_HI:`TLU_ASI_SCPD_VA_LO] == `HSCPD_ASI_VA_ADDR_HI) )begin
            dmmu_asi_req[ifu_tlu_thrid_e] = asi_state_e;
            dmmu_asi_pc[ifu_tlu_thrid_e]  = pc_e;
            dmmu_idx[ifu_tlu_thrid_e]     = 1;
        end
    end
endtask // mmu_asi_operation

//return a mmu command asi.
function [7:0] get_mmu_asi;
    input immu;
    input [1:0] thrid;

    begin
        if(immu)begin
            if(immu_idx[thrid])begin
                get_mmu_asi     = immu_asi_req[thrid];
                immu_idx[thrid] = 0;
            end
        end
        else if(dmmu_idx[thrid])begin
            get_mmu_asi        = dmmu_asi_req[thrid];
            immu_idx[thrid]    = 0;
        end
    end
endfunction // get_mmu_asi

//layout of mra memory ({mra_wdata[155:0],4'b0000}),
task process_mra;
    reg [1:0]   mra_thrid;
    reg [7:0]   asi;
    reg all_update;

    begin
`ifndef NO_MRA_VAL
        `SAS_TASKS.mra_val(cpu_id[9:0], mra_wr_ptr_d2, mra_wdata);
`endif
        mra_thrid  = mra_wr_ptr_d2[3:2];
        all_update = 0;
        if(trap_write_d2[mra_thrid])begin
            trap_write_d2[mra_thrid] = 0;
            all_update               = 1;
            if(mra_wr_ptr_d2[0])immu_miss[mra_thrid] = 0;
            else dmmu_miss[mra_thrid] = 0;
        end
        else asi = get_mmu_asi(mra_wr_ptr_d2[0], mra_thrid);
        if(mra_wr_ptr_d2[0])begin//isite
            if(asi == 8'h50 || all_update)begin
                itag_access_val[mra_thrid]  = mra_wdata[63:16];
                itag_access_cntl[mra_thrid] = 1;
            end
            if(mra_wr_ptr_d2[1])begin//nzctxt
                if(asi == 8'h3d || all_update)begin
                    ictxt_nztxt_ps0_val[mra_thrid] = mra_wdata[159:112];
                    ictxt_nztxt_ps0_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h3e || all_update)begin
                    ictxt_nztxt_ps1_val[mra_thrid] = mra_wdata[111:64];
                    ictxt_nztxt_ps1_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h3f || all_update)begin
                    ictxt_nzcfg_val[mra_thrid]     = mra_wdata[12:10];// mra_wdata[15:10]
                    ictxt_nzcfg_cntl[mra_thrid]= 1;
                end
            end
            else begin
                if(asi == 8'h35 || all_update)begin
                    ictxt_ztxt_ps0_val[mra_thrid] = mra_wdata[159:112];
                    ictxt_ztxt_ps0_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h36 || all_update)begin
                    ictxt_ztxt_ps1_val[mra_thrid] = mra_wdata[111:64];
                    ictxt_ztxt_ps1_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h37 || all_update)begin
                    ictxt_zcfg_val[mra_thrid]     = mra_wdata[12:10];
                    ictxt_zcfg_cntl[mra_thrid]= 1;
                end
            end
        end
        else begin//dsite
            if(asi == 8'h58 || asi == 8'h20 || all_update)begin
                dtag_access_val[mra_thrid]  = mra_wdata[63:16];
                if(!sent_4f_flag[mra_thrid])dtag_access_cntl[mra_thrid] = 1;
            end
            if(mra_wr_ptr_d2[1])begin//nzctxt
                if(asi == 8'h39 || all_update)begin
                    dctxt_nztxt_ps0_val[mra_thrid] = mra_wdata[159:112];
                    dctxt_nztxt_ps0_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h3a || all_update)begin
                    dctxt_nztxt_ps1_val[mra_thrid] = mra_wdata[111:64];
                    dctxt_nztxt_ps1_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h3b || all_update)begin
                    dctxt_nzcfg_val[mra_thrid]     = mra_wdata[12:10];
                    dctxt_nzcfg_cntl[mra_thrid]= 1;
                end
            end
            else begin
                if(asi == 8'h31 || all_update)begin
                    dctxt_ztxt_ps0_val[mra_thrid] = mra_wdata[159:112];
                    dctxt_ztxt_ps0_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h32 || all_update)begin
                    dctxt_ztxt_ps1_val[mra_thrid] = mra_wdata[111:64];
                    dctxt_ztxt_ps1_cntl[mra_thrid]= 1;
                end
                if(asi == 8'h33 || all_update)begin
                    dctxt_zcfg_val[mra_thrid]     = mra_wdata[12:10];
                    dctxt_zcfg_cntl[mra_thrid]= 1;
                end
            end
        end
    end
endtask // process_mra

//delay version control signal.
always @(posedge clk)begin
    pid_state_wr_en_del        <= pid_state_wr_en;
    pctxt_state_wr_thrd_del    <= pctxt_state_wr_thrd;
    sctxt_state_wr_thrd_del    <= sctxt_state_wr_thrd;
    lsu_va_wtchpt0_wr_en_l_del <=  lsu_va_wtchpt0_wr_en_l;
    lsu_va_wtchpt1_wr_en_l_del <=  lsu_va_wtchpt1_wr_en_l;
    lsu_va_wtchpt2_wr_en_l_del <=  lsu_va_wtchpt2_wr_en_l;
    lsu_va_wtchpt3_wr_en_l_del <=  lsu_va_wtchpt3_wr_en_l;
    mra_wr_ptr_d1 <= mra_wr_ptr;
    mra_wr_ptr_d2 <= mra_wr_ptr_d1;
    mra_wr_vld_d1 <= mra_wr_vld;
    mra_wr_vld_d2 <= mra_wr_vld_d1;

    if(spc0_cwp_cntl)begin
        if(cwp_wen_l[0] == 0)cwp[0] <= cwp_thr0_next;
        if(cwp_wen_l[1] == 0)cwp[1] <= cwp_thr1_next;
        if(cwp_wen_l[2] == 0)cwp[2] <= cwp_thr2_next;
        if(cwp_wen_l[3] == 0)cwp[3] <= cwp_thr3_next;
    end // if (spc0_cwp_cntl)
    rs1_m      <= ifu_exu_rs1_s;
    rs1_w      <= rs1_m;
    rs1_g      <= rs1_w;
    rs1_w2     <= rs1_g;

    rs2_m      <= ifu_exu_rs2_s;
    rs2_w      <= rs2_m;
    rs2_g      <= rs2_w;
    rs2_w2     <= rs2_g;
    alu_rs1_m  <= byp_alu_rs1_data_e;
    alu_rs1_w2 <= alu_rs1_m;

    alu_rs2_m  <= byp_alu_rs2_data_e;
    alu_rs2_w2 <= alu_rs2_m;
    //sync up with simics
    pcr_rw_m <= pcr_rw_e;
    pcr_rw_w <= pcr_rw_m;
    tlu_rsr_inst_m <= tlu_rsr_inst_e;
    tlu_rsr_inst_w <= tlu_rsr_inst_m;

end // always @ (posedge clk)
assign pcr_read_enable = pcr_rw_w && tlu_rsr_inst_w;

//wait register comparsion until instruction done.
reg [63:0] 	 float_val[3:0];
reg [31:0] 	 float_uval[3:0];
reg [3:0] 	 float_cntl;
reg [1:0] 	 float_wen[3:0];
reg [5:0] 	 float_low[3:0];
reg [5:0] 	 float_up[3:0];
reg [7:0] 	 reg_index[3:0];

reg [63:0] 	 float_val_next[3:0];
reg [31:0] 	 float_uval_next[3:0];
reg [3:0] 	 float_cntl_next;
reg [1:0] 	 float_wen_next[3:0];
reg [5:0] 	 float_low_next[3:0];
reg [5:0] 	 float_up_next[3:0];
reg [7:0] 	 reg_index_next[3:0];

reg 		 spc_float_cntl;

//tl
reg 		 spc_tl_cntl;
reg [2:0] 	 tl_val[3:0];
reg [3:0] 	 tl_cntl;
//pstate
reg 		 spc_pstate_cntl;
reg [11:0] 	 pstate_val[3:0];
reg [3:0] 	 pstate_cntl;
// cwp
reg [2:0] 	 cwp_val [3:0];
reg [3:0] 	 cwp_cntl;
reg 		 spc_cwp_cntl;
// trap
reg 		 spc_trap_cntl;
reg [2:0] 	 trap_val [3:0];
reg [3:0] 	 trap_cntl;
// modified due to addition of hpstate.ibe
// reg [134:0] 	 trap_data[3:0];
reg [135:0] 	 trap_data[3:0];
reg [3:0] 	 tpc_cntl, tnpc_cntl, tstate_cntl, ttype_cntl, htstate_cntl;
//y reg
reg [31:0] 	 y_val   [3:0];
reg [3:0] 	 y_cntl;
reg 		 spc_y_cntl;
//ccr reg
reg [7:0] 	 ccr_val [3:0];
reg [3:0] 	 ccr_cntl;
reg 		 spc_ccr_cntl;
//asi reg
reg [7:0] 	 asi_val [3:0];
reg [3:0] 	 asi_cntl;
reg 		 spc_asi_cntl;
//tick
reg [63:0] 	 tick_val[3:0];
reg [3:0] 	 tick_cntl;
reg 		 spc_tick_cntl;
// pil
reg [3:0] 	 pil_val [3:0];
reg [3:0] 	 pil_cntl;
reg 		 spc_pil_cntl;
//tba
reg [63:0] 	 tba_val [3:0];
reg [3:0] 	 tba_cntl;
reg 		 spc_tba_cntl;
reg [7:0]	 gen_w   [3:0];
reg [7:0]	 gen_w2  [3:0];
//fsr register
reg [63:0] 	 fsr_val[3:0];
reg [3:0] 	 fsr_cntl;
reg 		 spc_fsr_cntl;
//soft int
reg [3:0] 	 sft_cntl;
reg 		 spc_sft_cntl;
reg [16:0] 	 sft_val[3:0];
reg [16:0] 	 sft_val0[3:0];
reg [16:0] 	 sft_val1[3:0];
reg [16:0] 	 sft_val2[3:0];
reg [16:0] 	 sft_val3[3:0];
reg [3:0] 	 sft_vld0, sft_vld1, sft_vld2, sft_vld3;
reg [3:0] 	 sft_match0, sft_match1, sft_match2, sft_match3, sft_match;


//tickcmp
reg [3:0] 	 tcmp_cntl;
reg [63:0] 	 tcmp_val[3:0];
reg 		 spc_tcmp_cntl;

// variable for reg comparsion
reg [7:0]  enable_spc;                        // enable spc vector
reg [`MONITOR_SIGNAL-1:0] spc0_mon_sign;      // keep control signal
reg [3:0] 		     delay_thread;
reg [3:0] 		     is_trap, is_hit;

//temporary regis
reg [63:0] 		     temp_val;
reg [1:0] 		     temp_id;
reg [5:0] 		     temp_addr;//use this for floating point register
//use for tlu_done
reg 			     tlu_done;
//gsr
reg [63:0] 		     gsr_val[3:0];
reg 			     spc_gsr_cntl;
reg [3:0] 		     gsr_cntl;
//hardware interrup
reg [3:0] 		     hint_wait;
reg [2:0] 		     hint_cwp[3:0];
reg [63:0] 		     hint_val[3:0];
reg [3:0] 		     hint_updated;
reg [7:0]                 cpx_int[3:0];
reg [4:0] 		     hint_cond[3:0];
//htick_cmpr
reg 			     spc_htick_cntl;
reg [63:0] 		     htick_val[3:0];
reg [3:0] 		     htick_cntl;

//htick_cmpr
reg 			     spc_stickcmp_cntl;
reg [63:0] 		     stickcmp_val[3:0];
reg [3:0] 		     stickcmp_cntl;
//stick register
reg 			     spc_stick_cntl;
reg [63:0] 		     stick_val[3:0];
reg [3:0] 		     stick_cntl;
reg [1:0] 		     y_tmp;
reg [3:0] 		     intr_next;
reg [63:0] 		     step_pc;
reg [3:0] 		     spu_ldxa_m, spu_ldxa_w, spu_stxa_m, spu_stxa_w;
reg [3:0] 		     delay_spu;
reg [39:0] 		     prev_tstate;
reg [7:0] 		     prev_tstate_cmd;



//pcx packet parser
task pcx_parser;
    reg [1:0] thrid;
    begin
        if(spc_pcx_data_pa[`PCX_VLD] &&
                spc_pcx_data_pa[`PCX_NC]  &&
                (spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == `LOAD_RQ) &&
                (spc_pcx_data_pa[`PCX_CP_HI:`PCX_CP_LO] == cpu_id[9:0]))begin
            thrid = spc_pcx_data_pa[`PCX_TH_HI:`PCX_TH_LO];
            if(spc_pcx_data_pa[`PCX_AD_HI:`PCX_AD_LO] == 64'h98_0000_0830)coreavl[thrid]    = 1'b1;
            if(spc_pcx_data_pa[`PCX_AD_HI:`PCX_AD_LO] == 64'h98_0000_0810)reset_stat[thrid] = 1'b1;
            if(spc_pcx_data_pa[`PCX_AD_HI:`PCX_AD_LO] == 64'h96_0000_0008)ctu_stat[thrid]   = 1'b1;
        end
        if(cpx_spc_data_cx2[`CPX_VLD] &&
                cpx_spc_data_cx2[`CPX_RQ_HI:`CPX_RQ_LO] == `INT_RET &&
                cpx_spc_data_cx2[17:16] == 1)begin
            thrid = cpx_spc_data_cx2[9:8];
            cpx_rst[thrid] = 1'b1;
        end
    end
endtask // pcx_parser

// get rtl value according to request.
task spc0_command;
    input [7:0] cmd;
    input [1:0] thread;

    // modified due to addition of hpstate.ibe
    // reg  [134:0] trap_tmp;
    reg  [135:0] trap_tmp;
    reg  [74:0]  tmp_spc;
    reg  [3:0]   tmp_ccr;
    reg  [31:0]  inst_w;
    reg  inst_vld, inst_retract, inst_rvld;

    begin
        tmp_spc                 = special[spc0_thread_pc];
        tmp_spc[cmd]            = 1'b1;
        special[spc0_thread_pc] = tmp_spc;
        cond                    = 1'b0;
        rtl_reg_val             = 0;

        case(cmd)
            `PC             : begin
                if(delay_done[thread]   ||
                        float_delay[thread]  ||
                        is_it_load[thread]   ||
                        cancel_steppc[thread] )begin
                    rtl_reg_val[63:0]  = delay_pc[thread];
                    inst_w             = delay_inst[thread];
                    inst_vld           = delay_inst_vld[thread];
                    inst_retract       = delay_inst_retract[thread];
                    inst_rvld          = delay_inst_vld_w[thread];
                end
                else begin
                    rtl_reg_val[63:0]  = spc0_rtl_pc;
                    inst_w             = dtu_inst_w;
                    inst_vld           = fcl_fdp_inst_sel_nop_w_l;
                    inst_retract       = retract_iferr_w;
                    inst_rvld          = inst_vld_w;
                end
                active_thread      = thread;
                cond               = pstate[thread];
                step_pc            = rtl_reg_val;
                warm_pc            = warm_rst[thread] && sec_rst[thread];
                //save instruction
                warm_rst[thread] = 0;
            end // case: `PC
            `NPC            : begin
                rtl_reg_val[63:0]  = delay_done[thread] ||
                float_delay[thread]||
                is_it_load[thread] ||
                cancel_steppc[thread] ? delay_npc[thread] : spc0_rtl_npc;
                active_thread      = thread;
                cond               = pstate[thread];
            end
            `Y              : begin
                if(which_y_tid == 0)y_tmp = y_tid;
                if(which_y_tid == 1)y_tmp = y_tid_w;
                if(which_y_tid == 2)y_tmp = y_tid_w2;
                rtl_reg_val[31:0]  = y_val[y_tmp];  active_thread = y_tmp;
            end
            `CCR            : begin
                ccr_tid            = used_thread ? thread  : spc0_thread_pc;
                rtl_reg_val[7:0]   = ccr_val[ccr_tid];
                active_thread      = ccr_tid;
                cond               = muls[ccr_tid];
                cond               = muls_ccr[ccr_tid];
                muls_pvld[ccr_tid]= muls_ccr[ccr_tid];
                /*if(cond && !spc0_inst_done)begin
                next_mul[ccr_tid] = 1;
                next_val[ccr_tid] = rtl_reg_val;
                end*/
                muls_ccr[ccr_tid] = 0;
            end // case: `CCR
        `FPRS           : begin rtl_reg_val[7:0]   = which_fprs ? fprs_val[spc0_thread_pc] : fprs_val2[spc0_thread_pc];  active_thread = spc0_thread_pc;end
        `ASI            : begin rtl_reg_val[7:0]   = asi_val[spc0_thread_pc];   active_thread = spc0_thread_pc;end
            `FSR            : begin
                tmp_spc           = fsr_val[fsr_tid];
                rtl_reg_val[37:0] = {tmp_spc[27:20], 2'b0, tmp_spc[19:15], 6'b0, tmp_spc[14:12], 2'b0, tmp_spc[11:0]};
                active_thread     = fsr_tid;
            end
            `TICK_SAS       : begin rtl_reg_val[63:0]  = tick_val[spc0_thread_pc];  active_thread = spc0_thread_pc;end
            `GSR            : begin rtl_reg_val[63:0]  = gsr_val[spc0_thread_pc];   active_thread = spc0_thread_pc;end
            `TICK_CMPR      : begin
                if(tickcmp_rst[spc0_thread_pc] ||
                        tickcmpi_rst[spc0_thread_pc])begin
                    tmp_spc     = tcmp_val[spc0_thread_pc];
                    rtl_reg_val = {tmp_spc[63], 63'h0};
                end
                else rtl_reg_val = tcmp_val[spc0_thread_pc];
                active_thread = spc0_thread_pc;
            end
            `STICK_CMPR     : begin
                if(stickcmp_rst[spc0_thread_pc] ||
                        stickcmpi_rst[spc0_thread_pc] )begin
                    tmp_spc     = stickcmp_val[spc0_thread_pc];
                    rtl_reg_val = {tmp_spc[63], 63'h0};
                end
                else rtl_reg_val = stickcmp_val[spc0_thread_pc];
                active_thread = spc0_thread_pc;
            end
        `PSTATE_SAS     : begin rtl_reg_val[11:0]  = pstate_val[pstate_tid];    active_thread = pstate_tid;end
            `TL_SAS         : begin rtl_reg_val[2:0]   = tl_val[tl_tid];            active_thread = tl_tid;end
            `PIL_SAS        : begin rtl_reg_val[3:0]   = pil_val[spc0_thread_pc];   active_thread = spc0_thread_pc;end
            `TPC1, `TPC2,
            `TPC3, `TPC4,
            `TPC5, `TPC6           : begin
                trap_tmp          = trap_data[spc0_thread_pc];
                rtl_reg_val[48:0] = {trap_tmp[`TLU_PC_HI:`TLU_PC_LO], 2'b00};
                active_thread     = spc0_thread_pc;
                cond              = pstate[spc0_thread_pc];

            end
            `TNPC1, `TNPC2,
            `TNPC3, `TNPC4,
            `TNPC5, `TNPC6          : begin
                trap_tmp          = trap_data[spc0_thread_pc];
                rtl_reg_val[48:0] = {trap_tmp[`TLU_NPC_HI:`TLU_NPC_LO],  2'b00};
                active_thread     = spc0_thread_pc;
                cond              = pstate[spc0_thread_pc];
            end
            `TSTATE1, `TSTATE2,
            `TSTATE3, `TSTATE4,
            `TSTATE5, `TSTATE6  : begin//ccr , asi, spc, pstate, spc, cwp
                trap_tmp          = trap_data[spc0_thread_pc];
                rtl_reg_val[39:0] = {trap_tmp[`TLU_CCR_HI:`TLU_CCR_LO], //35:28
                                     trap_tmp[`TLU_ASI_HI:`TLU_ASI_LO],//27:20
                                     4'b0, // 4 reserved tstate bits
                                     2'b0, // 2 reserved pstate bits
                                     trap_tmp[`TSA_PSTATE_VRANGE2_HI:`TSA_PSTATE_VRANGE2_LO-2],//19:18
                                     1'b0, // 1 reserved pstate bits
                                     trap_tmp[`TSA_PSTATE_VRANGE1_HI:`TSA_PSTATE_VRANGE1_LO],//15:12
                                     1'b0, // 1 reserved pstate bit
                                     3'b0, // 3 reserved tstate bits
                                     2'b0, // 2 reserved cwp bits
                                     trap_tmp[`TLU_CWP_HI:`TLU_CWP_LO]};//11:9
                active_thread     = spc0_thread_pc;
                prev_tstate_cmd   = 0;
                if(muls_pvld[active_thread])begin
                    prev_tstate        = rtl_reg_val;
                    rtl_reg_val[39:32] = prev_ccr[active_thread];
                    prev_tstate_cmd    = cmd;
                end
                muls_pvld[active_thread] = 0;
            end
            `TT1, `TT2,
            `TT3, `TT4,
            `TT5, `TT6      : begin
                trap_tmp          = trap_data[spc0_thread_pc];
                rtl_reg_val[48:0] = trap_tmp[`TLU_TT_HI:`TLU_TT_LO];//[8:0]
                active_thread     = spc0_thread_pc;
            end
            `TBA_SAS            : begin rtl_reg_val[63:0] = tba_val[spc0_thread_pc];    active_thread = spc0_thread_pc;end
            `CWP            : begin rtl_reg_val[2:0]  = cwp_val[cwp_tid];           active_thread = cwp_tid;end
            `CANSAVE        : begin rtl_reg_val[2:0]  = spc0_cansave_reg;           active_thread = spc0_thread_pc; end
            `CANRESTORE     : begin rtl_reg_val[2:0]  = spc0_canrestore_reg;        active_thread = spc0_thread_pc; end
            `OTHERWIN       : begin rtl_reg_val[2:0]  = spc0_otherwin_reg;          active_thread = spc0_thread_pc; end
            `CLEANWIN       : begin rtl_reg_val[2:0]  = spc0_cleanwin_reg;          active_thread = spc0_thread_pc; end
            `WSTATE         : begin rtl_reg_val[5:0]  = spc0_wstate_reg;            active_thread = spc0_thread_pc; end
            `SOFTINT        : begin rtl_reg_val[16:0] = sft_val[sft_tid];           active_thread = sft_tid;end

            `INTR_RECEIVE   : begin
                active_thread = invr_tid;
                case(invr_tid)
                    0 : rtl_reg_val[63:0] = t0_invr_val;
                    1 : rtl_reg_val[63:0] = t1_invr_val;
                    2 : rtl_reg_val[63:0] = t2_invr_val;
                    3 : rtl_reg_val[63:0] = t3_invr_val;
                endcase
            end
            `INTR_DISPATCH_STATUS :begin
                active_thread = indr_tid;
                case(indr_tid)
                    0 : rtl_reg_val[10:0] = t0_indr_p;
                    1 : rtl_reg_val[10:0] = t1_indr_p;
                    2 : rtl_reg_val[10:0] = t2_indr_p;
                    3 : rtl_reg_val[10:0] = t3_indr_p;
                endcase
            end
        `HTBA_SAS   :begin rtl_reg_val[33:0] = {htba_val[htba_tid], 14'h0};active_thread = htba_tid;end
            // modified due to the addition of hpstate.ibe
            // `HPSTATE:begin rtl_reg_val[3:0]  = hpstate_val[hpstate_tid];   active_thread = hpstate_tid;end
            `HPSTATE_SAS:begin rtl_reg_val[4:0]  = hpstate_val[hpstate_tid];   active_thread = hpstate_tid;end
            `HINTP_SAS  :begin rtl_reg_val[0]    = hintp_val[hintp_tid];       active_thread = hintp_tid;end
            `GL         :begin rtl_reg_val[1:0]  = gl_val[gl_tid];             active_thread = gl_tid;end
            `HTSTATE1, `HTSTATE2,
            `HTSTATE3, `HTSTATE4,
            `HTSTATE5, `HTSTATE6  : begin
                trap_tmp          = trap_data[spc0_thread_pc];
                rtl_reg_val[`WSR_HPSTATE_IBE]  = trap_tmp[`TLU_HTSTATE_LO+3];
                rtl_reg_val[`WSR_HPSTATE_RED]  = trap_tmp[`TLU_HTSTATE_LO+2];
                rtl_reg_val[`WSR_HPSTATE_PRIV] = trap_tmp[`TLU_HTSTATE_LO+1];
                rtl_reg_val[`WSR_HPSTATE_TLZ]  = trap_tmp[`TLU_HTSTATE_LO];
                active_thread                  = spc0_thread_pc;
            end
            `HSTICK_CMPR : begin
                if(htickcmp_rst[spc0_thread_pc] ||
                        htickcmpi_rst[spc0_thread_pc])begin
                    tmp_spc     = htick_val[spc0_thread_pc];
                    rtl_reg_val = {tmp_spc[63], 63'h0};
                end
                else rtl_reg_val   = htick_val[spc0_thread_pc];
                active_thread = spc0_thread_pc;
            end
            //dsfsr asi handler
            `ISFSR : begin
                rtl_reg_val   = isfsr_val[isfsr_tid];
                active_thread = isfsr_tid;
            end
            `DSFSR : begin
                rtl_reg_val   = dsfsr_val[dsfsr_tid];
                active_thread = dsfsr_tid;
            end
            `SFAR : begin
                rtl_reg_val   = sfar_val[sfar_tid];
                active_thread = sfar_tid;
            end
            //new mmu registers
            `CTXT_PRIM : begin
                rtl_reg_val   = pctxt_val[pctxt_tid];
                active_thread = pctxt_tid;
            end
            `CTXT_SEC : begin
                rtl_reg_val   = sctxt_val[sctxt_tid];
                active_thread = sctxt_tid;
            end
            `VA_WP_ADDR : begin
                rtl_reg_val   = wtchpt_val[wtchpt_tid];
                active_thread = wtchpt_tid;
            end
            `PID : begin
                rtl_reg_val   = pid_val[pid_tid];
                active_thread = pid_tid;
            end
            //mra register
            `I_TAG_ACCESS : begin
                rtl_reg_val   = itag_access_val[itag_tid];
                active_thread = itag_tid;
            end
            `D_TAG_ACCESS : begin
                rtl_reg_val   = dtag_access_val[dtag_tid];
                active_thread = dtag_tid;
            end
            `I_CTXT_ZERO_PS0 : begin
                rtl_reg_val   = ictxt_ztxt_ps0_val[iztxt_ps0_tid];
                active_thread = iztxt_ps0_tid;
            end
            `I_CTXT_ZERO_PS1 : begin
                rtl_reg_val   = ictxt_ztxt_ps1_val[iztxt_ps1_tid];
                active_thread = iztxt_ps1_tid;
            end
            `D_CTXT_ZERO_PS0 : begin
                rtl_reg_val   = dctxt_ztxt_ps0_val[dztxt_ps0_tid];
                active_thread = dztxt_ps0_tid;
            end
            `D_CTXT_ZERO_PS1 : begin
                rtl_reg_val   = dctxt_ztxt_ps1_val[dztxt_ps1_tid];
                active_thread = dztxt_ps1_tid;
            end
            `I_CTXT_ZERO_CONFIG : begin
                rtl_reg_val   = ictxt_zcfg_val[izcfg_tid];
                active_thread = izcfg_tid;
            end
            `D_CTXT_ZERO_CONFIG : begin
                rtl_reg_val   = dctxt_zcfg_val[dzcfg_tid];
                active_thread = dzcfg_tid;
            end
            `I_CTXT_NONZERO_CONFIG : begin
                rtl_reg_val   = ictxt_nzcfg_val[inzcfg_tid];
                active_thread = inzcfg_tid;
            end
            `D_CTXT_NONZERO_CONFIG : begin
                rtl_reg_val   = dctxt_nzcfg_val[dnzcfg_tid];
                active_thread = dnzcfg_tid;
            end
            `I_CTXT_NONZERO_PS0 : begin
                rtl_reg_val   = ictxt_nztxt_ps0_val[inztxt_ps0_tid];
                active_thread = inztxt_ps0_tid;
            end
            `I_CTXT_NONZERO_PS1 : begin
                rtl_reg_val   = ictxt_nztxt_ps1_val[inztxt_ps1_tid];
                active_thread = inztxt_ps1_tid;
            end
            `D_CTXT_NONZERO_PS0 : begin
                rtl_reg_val   = dctxt_nztxt_ps0_val[dnztxt_ps0_tid];
                active_thread = dnztxt_ps0_tid;
            end
            `D_CTXT_NONZERO_PS1 : begin
                rtl_reg_val   = dctxt_nztxt_ps1_val[dnztxt_ps1_tid];
                active_thread = dnztxt_ps1_tid;
            end
        endcase // case(cmd)
    end
endtask // command

integer 	 j;

assign  float_tid            = ctl_frf_addr[6:5];
assign  spc0_float_cntl      = |ctl_frf_wen;
assign  spc0_fsr_cntl        = ~(&ctl_dp_fsr_sel_old);
// assign  spc0_sft_cntl        = sftint0_clk_del || sftint1_clk_del || sftint2_clk_del || sftint3_clk_del;
assign  spc0_sft_cntl        = (sftint0_clk_del0 ||
                                sftint1_clk_del0 ||
                                sftint2_clk_del0 ||
                                sftint3_clk_del0) && !softint_off;
assign  spct_sft_cntl        = {!softint_off && (tick_int_en_del[3] ^ tick_int_en_del1[3]) && tick_int_en_del1[3] == 0,
                                !softint_off && (tick_int_en_del[2] ^ tick_int_en_del1[2]) && tick_int_en_del1[2] == 0,
                                !softint_off && (tick_int_en_del[1] ^ tick_int_en_del1[2]) && tick_int_en_del1[1] == 0,
                                !softint_off && (tick_int_en_del[0] ^ tick_int_en_del1[0]) && tick_int_en_del1[0] == 0};
//assign  spc0_tcmp_cntl       = ~(&tlu_tickcmp_en_l_del);
assign  spc0_tcmp_cntl       = (|tickcmp_intdis_en_del);

initial
begin
    throw_pc_w      = 0;
`ifndef VERILATOR
    delay_spu       = 0;
`endif // ifndef VERILATOR
    sft_vld0        = 0;
    sft_vld1        = 0;
    sft_vld2        = 0;
    sft_vld3        = 0;
    sft_match       = 0;
    sft_match0      = 0;
    sft_match1      = 0;
    sft_match2      = 0;
    sft_match3      = 0;
    stickcmp_cntl   = 0;
    stick_cntl      = 0;
    htick_cntl      = 0;
    hint_wait       = 0;
    float_cntl      = 0;
    float_cntl_next = 0;
    y_cntl          = 0;
    ccr_cntl        = 0;
    asi_cntl        = 0;
    tpc_cntl        = 0;
    tnpc_cntl       = 0;
    tstate_cntl     = 0;
    ttype_cntl      = 0;
    tick_cntl       = 0;
    fsr_cntl        = 0;
    sft_cntl        = 0;
    tcmp_cntl       = 0;
    gsr_cntl        = 0;
    gl_cntl         = 0;
    hpstate_cntl    = 0;
    htstate_cntl    = 0;
    trap_cntl       = 0;
    hintp_cntl      = 0;hintp_cntl_2 = 0;
    pstate_cntl     = 0;
    intr_next       = 0;
    dsfsr_cntl      = 0;
    isfsr_cntl      = 0;
    pid_cntl        = 0;
    sctxt_cntl      = 0;
    pctxt_cntl      = 0;
    wtchpt_cntl     = 0;
    pil_cntl        = 0;
    tba_cntl        = 0;
    htba_cntl       = 0;

    for(j = 0; j < 4; j = j + 1)begin
        gen_w[j]  = 0;
        gen_w2[j] = 0;
        cpx_int[j]= 0;
        pstate_val[j] = 'h014;
    end
end // initial begin
reg [1:0] 	restore [3:0];
//save reg address, window, thread for recording the committed regs.
reg [6:0] 	updated [3:0];
reg [2:0] 	window  [3:0];
reg 		inst_done1, inst_done2;
//all register cmp
reg [3:0] 	is_restore;
reg [1:0] 	rml_thr;
reg [2:0] 	rml_win;

reg  	annux_int;

initial begin
    restore[0]      = 1;
    restore[1]      = 1;
    restore[2]      = 1;
    restore[3]      = 1;
    is_restore      = 8;
    exu_tlu_spill_m = 0;
    ifu_exu_save_m  = 0;
    sent_4f_flag    = 0;

end
//save global register ptr.
always @(posedge clk)begin
    if(rml_irf_restore_local_m)is_restore <= rml_irf_cwp_m;
    if(rml_irf_save_local_m)is_restore    <= 8;
    inst_done1      <= spc0_inst_done;
    inst_done2      <= inst_done1;
    rml_win         <= rml_irf_cwp_m;
    rml_thr         <= rml_irf_thr_m;
    exu_tlu_spill_m <= exu_tlu_spill_e;
    ifu_exu_save_m  <= ifu_exu_save_e;
    htba_del        <= tlu_htba_en_l;
    hintp_del       <= tlu_hintp_en_l_g;
    spc0_thread_pc_del <= spc0_thread_pc;

    annux_int <= ifu_tlu_swint_w || ifu_tlu_hwint_w  || ifu_tlu_rstint_w;
    if(tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f)sent_4f_flag[thrid_w2] <= 1;

end // always @ (posedge clk)
/*--------------------------------------------------------
keep the register content which is commited.
--------------------------------------------------------*/
//special registers
reg [63:0]   thr0_spc [1023:0];
reg [1023:0] thr0_vld;

//local register
reg [31:0] 	lcl0_vld;
reg [31:0] 	lcl1_vld;
reg [31:0] 	lcl2_vld;
reg [31:0] 	lcl3_vld;

reg [63:0] 	lcl0_val [31:0];
reg [63:0] 	lcl1_val [31:0];
reg [63:0] 	lcl2_val [31:0];
reg [63:0] 	lcl3_val [31:0];

//windows
reg [63:0] 	thr0_reg [`MONITOR_SIGNAL-1:0];
reg [63:0] 	thr1_reg [`MONITOR_SIGNAL-1:0];
reg [63:0] 	thr2_reg [`MONITOR_SIGNAL-1:0];
reg [63:0] 	thr3_reg [`MONITOR_SIGNAL-1:0];

reg [`MONITOR_SIGNAL-1:0]  thr0_reg_vld;
reg [`MONITOR_SIGNAL-1:0]  thr1_reg_vld;
reg [`MONITOR_SIGNAL-1:0]  thr2_reg_vld;
reg [`MONITOR_SIGNAL-1:0]  thr3_reg_vld;

reg [`MONITOR_SIGNAL-1:0] 	lcl0_mul;
reg [`MONITOR_SIGNAL-1:0] 	lcl1_mul;
reg [`MONITOR_SIGNAL-1:0] 	lcl2_mul;
reg [`MONITOR_SIGNAL-1:0] 	lcl3_mul;
//global register
reg [31:0] 	gl0_vld;
reg [31:0] 	gl1_vld;
reg [31:0]   gl2_vld;
reg [31:0]   gl3_vld;
reg [63:0] 	gl0_reg [31:0];
reg [63:0] 	gl1_reg [31:0];
reg [63:0] 	gl2_reg [31:0];
reg [63:0] 	gl3_reg [31:0];
reg [31:0] 	gl0_mul;
reg [31:0] 	gl1_mul;
reg [31:0]   gl2_mul;
reg [31:0]   gl3_mul;
//float register
reg [31:0]   fp0_reg [63:0];
reg [31:0]   fp1_reg [63:0];
reg [31:0]   fp2_reg [63:0];
reg [31:0]   fp3_reg [63:0];
reg [63:0] 	fp0_vld;
reg [63:0] 	fp1_vld;
reg [63:0] 	fp2_vld;
reg [63:0] 	fp3_vld;
reg [3:0] 	ccr_early, gsr_early, y_early, hintp_early, hintp_early_2, pstate_early, tl_early, gl_early, hpstate_early;
//floating point
reg [63:0] 	delay_float0[6:0];
reg [5:0] 	delay_addr0[6:0];
reg [6:0] 	float_up0;
reg [63:0] 	delay_float1[6:0];
reg [5:0] 	delay_addr1[6:0];
reg [6:0] 	float_up1;
reg [63:0] 	delay_float2[6:0];
reg [5:0] 	delay_addr2[6:0];
reg [6:0] 	float_up2;
reg [63:0] 	delay_float3[6:0];
reg [5:0] 	delay_addr3[6:0];
reg [6:0] 	float_up3;
reg [3:0] 	block_enable;

//keep hardware int
reg [3:0]   hint_flag;
//save extra data
reg [63:0]  mul_val    [3:0];
reg [63:0]  prev_val   [3:0];
reg [2:0]   mul_win    [3:0];
reg [2:0]   prev_win   [3:0];
reg [1:0]  mul_thread  [3:0];
reg [5:0]  mul_addr    [3:0];
reg [5:0]  prev_addr   [3:0];

reg [3:0]  mul_cntl;

reg [3:0]  ignore_int_rec;
reg [3:0]  flush_after_intr;
reg [1:0]  tick_match_tid, tick_match_num;

reg [1:0]  holdup_id;
reg [3:0]  float_load;

reg [3:0]  update_by_sft;
reg [3:0]  sft_spct;
reg [3:0]  tlb_force_trap;

integer    decoder_handle;
//keep force mmu register value.
reg [3:0]  dsfsr_force_vld;
reg [23:0] dsfsr_force_val [3:0];
reg [3:0]  sfar_force_vld;
reg [47:0] sfar_force_val[3:0];
//set zero to valid variable.

initial
begin
    spu_illgl       = 0;
    tlb_force_trap  = 0;
    dsfsr_force_vld = 0;
    sfar_force_vld = 0;
    holdup_id    = 0;
    sft_spct     = 0;
    prev_vld     = 0;
    update_by_sft= 0;
    mul_vld      = 0;
    block_enable = 0;
    ccr_early    = 0;
    hintp_early  = 0;
    pstate_early = 0;
    gl_early     = 0;
    tl_early     = 0;
    hpstate_early= 0;
    ignore_int_rec = 0;
    flush_after_intr = 0;
    gsr_early    = 0;
    y_early      = 0;
    hint_flag    = 0;

    //float
    fp0_vld      = 0;
    fp1_vld      = 0;
    fp2_vld      = 0;
    fp3_vld      = 0;
    //global
    gl0_vld      = 0;
    gl1_vld      = 0;
    gl2_vld      = 0;
    gl3_vld      = 0;

    gl0_mul      = 0;
    gl1_mul      = 0;
    gl2_mul      = 0;
    gl3_mul      = 0;
    thr0_vld     = 0;

    thr0_reg_vld = 0;
    thr1_reg_vld = 0;
    thr2_reg_vld = 0;
    thr3_reg_vld = 0;
    //current
    lcl0_vld     = 0;
    lcl1_vld     = 0;
    lcl2_vld     = 0;
    lcl3_vld     = 0;
    lcl0_mul     = 0;
    lcl1_mul     = 0;
    lcl2_mul     = 0;
    lcl3_mul     = 0;
    for(i = 0; i < 1024; i = i + 1)thr0_spc[i] = 0;
    for(i = 0; i < 32; i = i + 1)begin
        lcl0_val[i] = 0;
        lcl1_val[i] = 0;
        lcl2_val[i] = 0;
        lcl3_val[i] = 0;
        gl0_reg[i]  = 0;
        gl1_reg[i]  = 0;
        gl2_reg[i]  = 0;
        gl3_reg[i]  = 0;
    end
    for(i = 0; i < 64; i = i + 1)begin
        fp0_reg[i] = 0;
        fp1_reg[i] = 0;
        fp2_reg[i] = 0;
        fp3_reg[i] = 0;
    end
    for(i = 0; i < `MONITOR_SIGNAL; i = i + 1)begin
        thr0_reg[i] = 0;
        thr1_reg[i] = 0;
        thr2_reg[i] = 0;
        thr3_reg[i] = 0;
    end
end // initial begin
//check intr_recv
function  check_intr_recv;
    input [1:0] thrid;

    begin
        check_intr_recv = 1;
        if((ifu_tlu_thrid_w == thrid) &&
                is_int_in_bound            &&
                (wsr[thrid] == back_intr[thrid]))begin
            check_intr_recv  = 0;
            case(thrid)
                2'b00 : thr0_reg[`INTR_RECEIVE] = back_intr[0];
                2'b01 : thr1_reg[`INTR_RECEIVE] = back_intr[1];
                2'b10 : thr2_reg[`INTR_RECEIVE] = back_intr[2];
                2'b11 : thr3_reg[`INTR_RECEIVE] = back_intr[3];
            endcase // case(thrid)
        end // if ((ifu_tlu_thrid_w == thrid) &&...
    end
endfunction // check_intr_recv
//up32 bit
reg  up32, check_only;
reg [63:0] full_val, up_temp;
initial check_only = 0;
reg updated_reg_list_reg ;

task  updated_reg_list;
    input [7:0]  type_i;
    input [2:0]  wind;
    input [1:0]  thread;
    input [5:0]  addr;
    input [63:0] val;
    input [3:0]  cond;
    //register for cwp

    reg [6:0]   windex;
    reg [2:0]   pcur, nwind;
    reg [6:0]   pindex;
    reg         dummy;
    reg [63:0]  tmp_val;
    reg [9:0]   tmp_keep0,tmp_keep2;
    reg [5:0]   t_addr;
    reg [2:0]   c_cwp;
    reg [2:0]   fprs_reg;

    reg don, invalid;
    /*------------------------------------------------------------
    process the special register here
    ------------------------------------------------------------*/
    begin
        updated_reg_list_reg = 1;
        if((type_i > 31) && (type_i < `REG_WRITE_BACK))begin //special register
            //special care need for the below registers.
            case(type_i)
                `PC, `NPC    : val     = cond[3] ? val[31:0] : val[47:0];
                `FSR         :
                begin
                    val[22] = 1'b0;
                    val[13] = 1'b0;
                end
                `TPC1, `TPC2, `TPC3, `TPC4, `TPC5, `TPC6,
                `TNPC1, `TNPC2, `TNPC3, `TNPC4, `TNPC5, `TNPC6 : val = val[47:0];//cond[3] ? val[31:0] : val[47:0];
                `TBA_SAS : val = val[47:15];
            endcase // case(type_i)
            //window is switched

            if(type_i == `CWP)begin
                pcur = cwp[thread];
                if(save_happen[thread])begin //local register
                    tmp_keep0 = 0;tmp_keep2 = 0;
                    if(ecl_irf_wen_w)begin
                        if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w])begin
                            t_addr   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp_val[spc0_thread_w]) , thr_rd_w[3:0]};
                            c_cwp  = cwp_val[spc0_thread_w];
                        end
                        else begin
                            t_addr   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp[spc0_thread_w]), thr_rd_w[3:0]};
                            c_cwp  = cwp[spc0_thread_w];
                        end
                        tmp_keep0 = spc0_thread_w == thread ? { 1'b1, c_cwp[2:0], t_addr[5:0]} : 0;
                    end // if (ecl_irf_wen_w)
                    if(ecl_irf_wen_w2)begin
                        if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w2])begin
                            t_addr   = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp_val[spc0_thread_w2]) , thr_rd_w2[3:0]};
                            c_cwp    = cwp_val[spc0_thread_w2];
                        end
                        else begin
                            t_addr  = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp[spc0_thread_w2]), thr_rd_w2[3:0]};
                            c_cwp   = cwp[spc0_thread_w2];
                        end
                        tmp_keep2 = spc0_thread_w2 == thread ? {1'b1, c_cwp[2:0], t_addr[5:0]} : 0;
                    end // if (ecl_irf_wen_w2)

                    for(windex = 16; windex < 24;windex = windex + 1)begin
                        don     = !(tmp_keep0[9] && (tmp_keep0[8:6] == wind) && (tmp_keep0[4:0] == windex[4:0]) ||
                                    tmp_keep2[9] && (tmp_keep2[8:6] == wind) && (tmp_keep2[4:0] == windex[4:0]));

                        invalid =  (thr0_vld [{thread, pcur, windex[4:0]}] == 0) &&
                                thr0_vld [{thread, wind, windex[4:0]}]       &&
                                (thr0_spc [{thread, wind, windex[4:0]}] != 0);

                        tmp_val= invalid  ? 0 : thr0_spc[{thread, pcur, windex[4:0]}];
                        //  $display("DATA %d val = %x val = %x pcur %x win=%x invalid=%x done=%x",$time, thr0_spc [{thread, pcur, windex[4:0]}],
                        //         thr0_spc[{thread, wind, windex[4:0]}], pcur, wind, invalid, don);

                        if(don)begin
                            thr0_vld[{thread, wind, windex[4:0]}] =  invalid ? 1 : thr0_vld [{thread, pcur, windex[4:0]}];
                            thr0_spc[{thread, wind, windex[4:0]}] =  tmp_val;
                        end
                    end // for (windex = 16; windex < 24;windex = windex + 1)

                    pindex = 8;
                    nwind  = wind + 1;
                    for(windex = 24; windex < 32;windex = windex + 1)begin
                        don = !(tmp_keep0[9] && (tmp_keep0[8:6] == wind) && (tmp_keep0[4:0] == pindex[4:0]) ||
                                tmp_keep2[9] && (tmp_keep2[8:6] == wind) && (tmp_keep2[4:0] == pindex[4:0]));
                        invalid = (thr0_vld[{thread, pcur, windex[4:0]}] == 0) &&
                                thr0_vld[{thread, wind, pindex[4:0]}]       &&
                                (thr0_spc[{thread, wind, pindex[4:0]}] != 0);
                        tmp_val= invalid ? 0 :thr0_spc[{thread, pcur, windex[4:0]}];
                        if(don)begin
                            thr0_vld[{thread, wind, pindex[4:0]}]  =  invalid ? 1 :thr0_vld[{thread, pcur, windex[4:0]}];
                            thr0_spc[{thread, wind, pindex[4:0]}]  =  tmp_val;
                            thr0_vld[{thread, nwind, windex[4:0]}] =  invalid ? 1 :thr0_vld[{thread, pcur, windex[4:0]}];
                            thr0_spc[{thread, nwind, windex[4:0]}] =  tmp_val;
                        end
                        pindex = pindex + 1;
                    end // for (windex = 24; windex < 32;windex = windex + 1)
                    save_happen[thread] = 0;
                end // if (save_happen[thread])
            end // if (type_i == `CWP)
            case(thread)
                2'b00 : begin
                    updated_reg_list_reg              = thr0_reg_vld[type_i]       &&  (thr0_reg[type_i] == val)   ||
                    (thr0_reg_vld[type_i] == 0) && !(//type_i  == `INTR_RECEIVE   ||
                        (type_i  == `SOFTINT) && val||
                        (type_i  == `GSR) && val);

                    if(type_i == `HINTP_SAS || type_i  == `INTR_RECEIVE)updated_reg_list_reg = type_i == 1;
                    if(type_i  == `INTR_RECEIVE)begin
                        back_intr[0] = thr0_reg[type_i];
                    end
                    if(check_only == 0 )begin//&& !((type_i == `FPRS) && !which_fprs))begin
                        thr0_reg[type_i]                = val;
                        thr0_reg_vld[type_i]            = 1'b1;
                    end
                end
                2'b01 : begin
                    updated_reg_list_reg              = thr1_reg_vld[type_i]      && (thr1_reg[type_i] == val) ||
                    (thr1_reg_vld[type_i] == 0)&& !(//type_i == `INTR_RECEIVE ||
                        (type_i == `SOFTINT) && val||
                        (type_i == `GSR) && val);
                    if(type_i == `HINTP_SAS|| type_i  == `INTR_RECEIVE)updated_reg_list_reg = type_i == 1;
                    if(type_i  == `INTR_RECEIVE)back_intr[1] = thr1_reg[type_i];
                    if(check_only == 0 )begin
                        thr1_reg[type_i]                = val;
                        thr1_reg_vld[type_i]            = 1'b1;
                    end
                end
                2'b10 : begin
                    updated_reg_list_reg              = thr2_reg_vld[type_i]      && (thr2_reg[type_i] == val) ||
                    (thr2_reg_vld[type_i] == 0)&& !(//type_i == `INTR_RECEIVE ||
                        (type_i == `SOFTINT) && val||
                        (type_i == `GSR) && val);
                    if(type_i == `HINTP_SAS|| type_i  == `INTR_RECEIVE)updated_reg_list_reg = type_i == 1;
                    if(type_i  == `INTR_RECEIVE)back_intr[2] = thr2_reg[type_i];
                    if(check_only == 0)begin
                        thr2_reg[type_i]                = val;
                        thr2_reg_vld[type_i]            = 1'b1;
                    end
                end
                2'b11 : begin
                    updated_reg_list_reg              = thr3_reg_vld[type_i]      && (thr3_reg[type_i] == val) ||
                    (thr3_reg_vld[type_i] == 0)&& !(//type_i == `INTR_RECEIVE ||
                        (type_i == `SOFTINT) && val||
                        (type_i == `GSR) && val);
                    if(type_i == `HINTP_SAS || type_i  == `INTR_RECEIVE)updated_reg_list_reg = type_i == 1;
                    if(type_i  == `INTR_RECEIVE)back_intr[3] = thr3_reg[type_i];
                    if(check_only == 0)begin
                        thr3_reg[type_i]                = val;
                        thr3_reg_vld[type_i]            = 1'b1;
                    end
                end
            endcase // case(thread)
            if(type_i == `TICK_SAS || type_i == `CCR || type_i == `FPRS)updated_reg_list_reg = 1'b1;
        end // if (type_i >= 32)
        /*------------------------------------------------------------
        floating point
        ------------------------------------------------------------*/
        else if(type_i > `REG_WRITE_BACK)begin
            case(thread)
                2'b00 : begin
                    if(type_i == `FLOAT_X)begin
                        updated_reg_list_reg  = fp0_vld[addr]            && (fp0_reg[addr]              == val[63:32])||
                        fp0_vld[{addr[5:1], 1'b1}]   && (fp0_reg[{addr[5:1], 1'b1}] == val[31:0]) ||
                        (fp0_vld[addr]              == 0) ||
                        (fp0_vld[{addr[5:1], 1'b1}] == 0);
                        fp0_reg[{addr[5:1], 1'b1}] = val[31:0];
                        fp0_reg[addr]              = val[63:32];
                        fp0_vld[addr]              = 1'b1;
                        fp0_vld[{addr[5:1], 1'b1}] = 1'b1;
                    end
                    else begin
                        updated_reg_list_reg  = fp0_vld[addr]  && (fp0_reg[addr] == val[31:0]) ||
                        fp0_vld[addr] == 0;
                        fp0_reg[addr]     = val[31:0];
                        fp0_vld[addr]     = 1'b1;
                    end // else: !if(type_i == `FLOAT_X)
                end // case: 2'b00
                2'b01 : begin
                    if(type_i == `FLOAT_X)begin
                        updated_reg_list_reg  = fp1_vld[addr]            && (fp1_reg[addr]              == val[63:32]) ||
                        fp1_vld[{addr[5:1], 1'b1}]   && (fp1_reg[{addr[5:1], 1'b1}] == val[31:0]) ||
                        (fp1_vld[addr]              == 0) ||
                        (fp1_vld[{addr[5:1], 1'b1}] == 0);
                        fp1_reg[{addr[5:1], 1'b1}] = val[31:0];
                        fp1_reg[addr]              = val[63:32];
                        fp1_vld[addr]              = 1'b1;
                        fp1_vld[{addr[5:1], 1'b1}] = 1'b1;
                    end
                    else begin
                        updated_reg_list_reg  = fp1_vld[addr]  && (fp1_reg[addr] == val[31:0]) ||
                        fp1_vld[addr] == 0;
                        fp1_reg[addr]     = val[31:0];
                        fp1_vld[addr]     = 1'b1;
                    end // else: !if(type_i == `FLOAT_X)
                end // case: 2'b00
                2'b10 : begin
                    if(type_i == `FLOAT_X)begin
                        updated_reg_list_reg  = fp2_vld[addr]            && (fp2_reg[addr]              == val[63:32]) ||
                        fp2_vld[{addr[5:1], 1'b1}]   && (fp2_reg[{addr[5:1], 1'b1}] == val[31:0]) ||
                        (fp2_vld[addr]              == 0) ||
                        (fp2_vld[{addr[5:1], 1'b1}] == 0);
                        fp2_reg[{addr[5:1], 1'b1}] = val[31:0];
                        fp2_reg[addr]              = val[63:32];
                        fp2_vld[addr]              = 1'b1;
                        fp2_vld[{addr[5:1], 1'b1}] = 1'b1;
                    end
                    else begin
                        updated_reg_list_reg  = fp2_vld[addr]  && (fp2_reg[addr] == val[31:0]) ||
                        fp2_vld[addr] == 0;
                        fp2_reg[addr]     = val[31:0];
                        fp2_vld[addr]     = 1'b1;
                    end // else: !if(type_i == `FLOAT_X)
                end // case: 2'b00
                2'b11 : begin
                    if(type_i == `FLOAT_X)begin
                        updated_reg_list_reg  = fp3_vld[addr]            && (fp3_reg[addr]              == val[63:32])||
                        fp3_vld[{addr[5:1], 1'b1}]   && (fp3_reg[{addr[5:1], 1'b1}] == val[31:0]) ||
                        (fp3_vld[addr]              == 0) ||
                        (fp3_vld[{addr[5:1], 1'b1}] == 0);

                        fp3_reg[{addr[5:1], 1'b1}] = val[31:0];
                        fp3_reg[addr]              = val[63:32];
                        fp3_vld[addr]              = 1'b1;
                        fp3_vld[{addr[5:1], 1'b1}] = 1'b1;
                    end
                    else begin
                        updated_reg_list_reg  = fp3_vld[addr]  && (fp3_reg[addr] == val[31:0]) ||
                        fp3_vld[addr] == 0;
                        fp3_reg[addr]     = val[31:0];
                        fp3_vld[addr]     = 1'b1;
                    end // else: !if(type_i == `FLOAT_X)
                end // case: 2'b00
            endcase // case(thread)
        end // if (type_i > 125)
        /*------------------------------------------------------------
        save global register.
        if cond, it contains the muls type_i instruction result
        and only the lowest 32 bit valid.
        ------------------------------------------------------------*/
        else if(addr < 8) begin//global register
            full_val = val;
            //if(cond)val = val[31:0];
            gl_lvl0_t = gl0_en ? gl_lvl0_new : gl_lvl0;
            gl_lvl1_t = gl1_en ? gl_lvl1_new : gl_lvl1;
            gl_lvl2_t = gl2_en ? gl_lvl2_new : gl_lvl2;
            gl_lvl3_t = gl3_en ? gl_lvl3_new : gl_lvl3;
            case(thread)
                2'b00 : begin
                    if(!(gl0_mul[{gl_lvl0_t, addr[2:0]}] && cond))
                        updated_reg_list_reg  = gl0_vld[{gl_lvl0_t, addr[2:0]}]      && (gl0_reg[{gl_lvl0_t, addr[2:0]}] == val) ||
                        gl0_vld[{gl_lvl0_t, addr[2:0]}] == 0;
                    else begin
                        tmp_val = gl0_reg[{gl_lvl0_t, addr[2:0]}];
                        updated_reg_list_reg  = gl0_vld[{gl_lvl0_t, addr[2:0]}]      && (tmp_val[31:0] == val[31:0]) ||
                        gl0_vld[{gl_lvl0_t, addr[2:0]}] == 0;
                    end

                    up_temp = gl0_reg[{gl_lvl0_t, addr[2:0]}];
                    if(cond && ((gl0_reg[{gl_lvl0_t, addr[2:0]}]  == 0) && (val[31:0] == 0) ||
                                (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])) )updated_reg_list_reg = 1;
                    gl0_vld[{gl_lvl0_t, addr[2:0]}]   = 1'b1;
                    gl0_reg[{gl_lvl0_t, addr[2:0]}]   = full_val;
                    gl0_mul[{gl_lvl0_t, addr[2:0]}]   = cond;

                end
                2'b01 : begin
                    if(!(gl1_mul[{gl_lvl1_t, addr[2:0]}] && cond))
                        updated_reg_list_reg  = gl1_vld[{gl_lvl1_t, addr[2:0]}] && (gl1_reg[{gl_lvl1_t, addr[2:0]}] == val) ||
                        gl1_vld[{gl_lvl1_t, addr[2:0]}] == 0;
                    else begin
                        tmp_val = gl1_reg[{gl_lvl1_t, addr[2:0]}];
                        updated_reg_list_reg  = gl1_vld[{gl_lvl1_t, addr[2:0]}]      && (tmp_val[31:0] == val[31:0]) ||
                        gl1_vld[{gl_lvl1_t, addr[2:0]}] == 0;
                    end
                    up_temp = gl1_reg[{gl_lvl1_t, addr[2:0]}];
                    if(cond && ((gl1_reg[{gl_lvl1_t, addr[2:0]}]  == 0) && (val[31:0] == 0) ||
                                (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])))updated_reg_list_reg = 1;
                    gl1_vld[{gl_lvl1_t, addr[2:0]}]   = 1'b1;
                    gl1_reg[{gl_lvl1_t, addr[2:0]}]   = full_val;
                    gl1_mul[{gl_lvl1_t, addr[2:0]}]   = cond;
                end
                2'b10 : begin
                    if(!(gl2_mul[{gl_lvl2_t, addr[2:0]}] && cond))
                        updated_reg_list_reg          = gl2_vld[{gl_lvl2_t, addr[2:0]}] && (gl2_reg[{gl_lvl2_t, addr[2:0]}] == val) ||
                        gl2_vld[{gl_lvl2_t, addr[2:0]}] == 0;
                    else begin
                        tmp_val = gl2_reg[{gl_lvl2_t, addr[2:0]}];
                        updated_reg_list_reg  = gl2_vld[{gl_lvl2_t, addr[2:0]}]      && (tmp_val[31:0] == val[31:0]) ||
                        gl2_vld[{gl_lvl2_t, addr[2:0]}] == 0;
                    end

                    up_temp = gl2_reg[{gl_lvl2_t, addr[2:0]}];
                    if(cond && ((gl2_reg[{gl_lvl2_t, addr[2:0]}]  == 0) && (val[31:0] == 0)||
                                (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])))updated_reg_list_reg = 1;
                    gl2_vld[{gl_lvl2_t, addr[2:0]}]   = 1'b1;
                    gl2_reg[{gl_lvl2_t, addr[2:0]}]   = full_val;
                    gl2_mul[{gl_lvl2_t, addr[2:0]}]   = cond;
                end
                2'b11 : begin
                    if(!(gl3_mul[{gl_lvl3_t, addr[2:0]}] && cond))
                        updated_reg_list_reg          = gl3_vld[{gl_lvl3_t, addr[2:0]}] && (gl3_reg[{gl_lvl3_t, addr[2:0]}] == val) ||
                        gl3_vld[{gl_lvl3_t, addr[2:0]}] == 0;
                    else begin
                        tmp_val = gl3_reg[{gl_lvl3_t, addr[2:0]}];
                        updated_reg_list_reg  = gl3_vld[{gl_lvl3_t, addr[2:0]}]      && (tmp_val[31:0] == val[31:0]) ||
                        gl3_vld[{gl_lvl3_t, addr[2:0]}] == 0;
                    end

                    up_temp = gl3_reg[{gl_lvl3_t, addr[2:0]}];
                    if(cond && ((gl3_reg[{gl_lvl3_t, addr[2:0]}]  == 0) && (val[31:0] == 0) ||
                                (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])))updated_reg_list_reg = 1;
                    gl3_vld[{gl_lvl3_t, addr[2:0]}]    = 1'b1;
                    gl3_reg[{gl_lvl3_t, addr[2:0]}]    = full_val;
                    gl3_mul[{gl_lvl3_t, addr[2:0]}]    = cond;
                end
            endcase // case(level)
        end // if (addr < 8)
        /*------------------------------------------------------------
        save the local register contents
        if cond, it contains the muls addr instruction result
        and only the lowest 32 bit valid.
        ------------------------------------------------------------*/

        else if( addr > 7 && addr < 32) begin // window  register
            full_val = val;
            //if(cond)val = val[31:0];
            if(addr > 23)begin
                if(!(lcl0_mul[{thread, wind, addr[4:0]}] && cond))
                    updated_reg_list_reg    = thr0_vld[{thread, wind, addr[4:0]}] && (thr0_spc[{thread, wind, addr[4:0]}] == val) ||
                                            thr0_vld[{thread, wind, addr[4:0]}] == 0;
                else begin
                    tmp_val = thr0_spc[{thread, wind, addr[4:0]}];
                    updated_reg_list_reg    = thr0_vld[{thread, wind, addr[4:0]}] && (tmp_val[31:0] == val[31:0]) ||
                                            thr0_vld[{thread, wind, addr[4:0]}] == 0;
                end
                // $display("UPDATEDVAL %d reg = %x thread = %x val = %x in = %x", $time, addr, thread, thr0_spc[{thread, wind, addr[4:0]}], val);

                up_temp = thr0_spc[{thread, wind, addr[4:0]}];
                if(cond && ((thr0_spc[{thread, wind, addr[4:0]}] == 0) && (val[31:0] == 0) ||
                            (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])) )updated_reg_list_reg = 1;
                thr0_vld[{thread, wind, addr[4:0]}]   = 1'b1;
                thr0_spc[{thread, wind, addr[4:0]}]   = full_val;
                pcur                          = wind == 0 ? 7  : wind - 1;
                windex                        = addr[4:0] - 16;
                thr0_vld[{thread, pcur, windex[4:0]}] = 1'b1;
                thr0_spc[{thread, pcur, windex[4:0]}] = full_val;
                lcl0_mul[{thread, wind, addr[4:0]}]   = cond;

            end
            else if(addr > 15)begin
                if(!(lcl0_mul[{thread, wind, addr[4:0]}] && cond))
                    updated_reg_list_reg  = thr0_vld[{thread, wind, addr[4:0]}] && (thr0_spc[{thread, wind, addr[4:0]}] == val) ||
                                          thr0_vld[{thread, wind, addr[4:0]}] == 0;
                else begin
                    tmp_val = thr0_spc[{thread, wind, addr[4:0]}];
                    updated_reg_list_reg    = thr0_vld[{thread, wind, addr[4:0]}] && (tmp_val[31:0] == val[31:0]) ||
                                            thr0_vld[{thread, wind, addr[4:0]}] == 0;
                end
                //	       $display("MULS %d thrid %d reg = %d val=%x val=%x", $time, thread, windex, tmp_val, val);
                up_temp = thr0_spc[{thread, wind, addr[4:0]}];
                if(cond && ((thr0_spc[{thread, wind, addr[4:0]}] == 0) && (val[31:0] == 0) ||
                            (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])))updated_reg_list_reg = 1;
                thr0_vld[{thread, wind, addr[4:0]}]   = 1'b1;
                thr0_spc[{thread, wind, addr[4:0]}]   = full_val;
                lcl0_mul[{thread, wind, addr[4:0]}]   = cond;
            end
            else begin //in
                pcur                          = wind + 1;
                windex                        = addr[4:0] + 16;
                if(!(lcl0_mul[{thread, wind, addr[4:0]}] && cond))
                    updated_reg_list_reg   = thr0_vld[{thread, pcur, windex[4:0]}] && (thr0_spc[{thread, pcur, windex[4:0]}] == val) ||
                                           thr0_vld[{thread, pcur, windex[4:0]}] == 0;
                else begin
                    tmp_val = thr0_spc[{thread, pcur, windex[4:0]}];
                    updated_reg_list_reg   = thr0_vld[{thread, pcur, windex[4:0]}] && (tmp_val[31:0] == val[31:0]) ||
                                           thr0_vld[{thread, pcur, windex[4:0]}] == 0;
                end
                // $display("MULS %d thrid %d reg = %d val=%x val=%x", $time, thread, windex, tmp_val, val);

                up_temp = thr0_spc[{thread, pcur, windex[4:0]}];
                if(cond && ((thr0_spc[{thread, pcur, windex[4:0]}] == 0) && (val[31:0] == 0) ||
                            (up_temp[63:32] == 0) && (val[31:0] == up_temp[31:0])))updated_reg_list_reg = 1;
                thr0_vld[{thread, pcur, windex[4:0]}] = 1'b1;
                thr0_spc[{thread, pcur, windex[4:0]}] = val;
                thr0_vld[{thread, wind, addr[4:0]}]   = 1'b1;
                thr0_spc[{thread, wind, addr[4:0]}]   = full_val;
                lcl0_mul[{thread, wind, addr[4:0]}]   = cond;
            end // else: !if(addr > 15)
        end // if ( addr > 7 && addr < 32)
        if(once_step[thread] == 1'b0)updated_reg_list_reg = 1;
    end
endtask // updated_reg_list

//get the previous register value
function [63:0] get_val;
    input [2:0] wind;
    input [1:0] thread;
    input [5:0] addr;
    begin
        if(addr < 8) begin
            gl_lvl0_t = gl0_en ? gl_lvl0_new : gl_lvl0;
            gl_lvl1_t = gl1_en ? gl_lvl1_new : gl_lvl1;
            gl_lvl2_t = gl2_en ? gl_lvl2_new : gl_lvl2;
            gl_lvl3_t = gl3_en ? gl_lvl3_new : gl_lvl3;
            case(thread)
                2'b00 : get_val = gl0_reg[{gl_lvl0_t, addr[2:0]}];
                2'b01 : get_val = gl1_reg[{gl_lvl1_t, addr[2:0]}];
                2'b10 : get_val = gl2_reg[{gl_lvl2_t, addr[2:0]}];
                2'b11 : get_val = gl3_reg[{gl_lvl3_t, addr[2:0]}];
            endcase // case(level)
        end // if (addr < 8)
        else get_val = thr0_spc[{thread, wind, addr[4:0]}];
    end
endfunction // get_val

reg [3:0] mul_cc;
reg 	     up_reset0, up_reset1;
initial begin
    mul_cc    = 0;
    up_reset0 = 0;
    up_reset1 = 0;

end
//keep register and window in one instruction boundary.
reg [5:0] force_reg [3:0];
reg [2:0] force_cwp [3:0];
reg [3:0] force_vld;
initial force_vld = 0;

// process the control signal

task process_signal;
    input [7:0]  which_signal;
    input [9:0]  spc; // this function seemed to be used for misc register updates and pc/npc
    input [1:0]  thread;
    reg [5:0]    rtl_reg_addr_w;
    reg [5:0]    rtl_reg_addr_w2;
    reg [2:0]    cur_cwp;
    reg [7:0]    reg_ptr;
    reg          updated, t_up;
    reg [63:0]   val;
    reg [2:0]    win;
    reg [3:0]    t_cond;
    reg [5:0]    f_tmp, force_read;

    integer      dummy, i;

    begin
        reg_ptr = 0;
        if(which_signal == `REG_WRITE_BACK)begin
            if(ecl_irf_wen_w && (!quad_load[spc0_thread_w] || quad_cnt[spc0_thread_w] == 2))begin
                cond                    = muls[spc0_thread_w];
                if(muls_ccr[spc0_thread_w] == 0)muls_ccr[spc0_thread_w] = muls[spc0_thread_w];
                muls[spc0_thread_w]     = 1'b0;
                if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w])begin
                    rtl_reg_addr_w   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp_val[spc0_thread_w]) , thr_rd_w[3:0]};
                    cur_cwp          = cwp_val[spc0_thread_w];
                end
                else begin
                    rtl_reg_addr_w   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp[spc0_thread_w]), thr_rd_w[3:0]};
                    cur_cwp          = cwp[spc0_thread_w];
                end
                rtl_reg_val         = thread_buf_e && (spc0_thread_w == ifu_tlu_thrid_w) ?
                                    {48'h0, spc0_rtl_reg_val_w[15:0]} : spc0_rtl_reg_val_w;
                if(rtl_reg_addr_w < 8)begin
                    case(spc0_thread_w)
                        0 : cur_cwp = gl0_en ? gl_lvl0_new : gl_lvl0;
                        1 : cur_cwp = gl1_en ? gl_lvl1_new : gl_lvl1;
                        2 : cur_cwp = gl2_en ? gl_lvl2_new : gl_lvl2;
                        3 : cur_cwp = gl3_en ? gl_lvl3_new : gl_lvl3;
                    endcase // case(spc0_thread_w)
                end
                if((good[spc0_thread_w] != active[spc0_thread_w]) &&
                        !icc_wr[spc0_thread_w])begin

                    if(is_fsr_w[spc0_thread_w] == 0)begin
                        // $display("ttt: 2");
                        `SAS_TASKS.register_cmp(which_signal, spc, spc0_thread_w, cur_cwp,
                                                rtl_reg_addr_w, rtl_reg_val, sas_reg_val, sas_sps_val,
                                                rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                    end

                    mul_cc[spc0_thread_w] = 0;
                    isfsr[spc0_thread_w] = 1'b0;
                end
                icc_wr[spc0_thread_w] = 0;
                if(gen_w[spc0_thread_w])gen_w[spc0_thread_w] = gen_w[spc0_thread_w] - 1;
            end
            if(ecl_irf_wen_w2 && (!quad_load[spc0_thread_w2] || quad_cnt[spc0_thread_w2] == 2))begin
                cond                     = muls[spc0_thread_w2];
                if(muls_ccr[spc0_thread_w2] == 0)muls_ccr[spc0_thread_w2] = muls[spc0_thread_w2];
                muls[spc0_thread_w2]     = 1'b0;
                if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w2])begin
                    rtl_reg_addr_w2  = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp_val[spc0_thread_w2]) , thr_rd_w2[3:0]};
                    cur_cwp          = cwp_val[spc0_thread_w2];
                end
                else begin
                    rtl_reg_addr_w2  = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp[spc0_thread_w2]), thr_rd_w2[3:0]};
                    cur_cwp          = cwp[spc0_thread_w2];
                end
                rtl_reg_val         = thread_buf_e && (spc0_thread_w2 == ifu_tlu_thrid_w) ?
                                    {48'h0, spc0_rtl_reg_val_w2[15:0]} : spc0_rtl_reg_val_w2;
                if(rtl_reg_addr_w2 < 8)begin
                    case(spc0_thread_w2)
                        0 : cur_cwp = gl0_en ? gl_lvl0_new : gl_lvl0;
                        1 : cur_cwp = gl1_en ? gl_lvl1_new : gl_lvl1;
                        2 : cur_cwp = gl2_en ? gl_lvl2_new : gl_lvl2;
                        3 : cur_cwp = gl3_en ? gl_lvl3_new : gl_lvl3;
                    endcase // case(spc0_thread_w)
                end

                if(good[spc0_thread_w2] != active[spc0_thread_w2] &&
                        !icc_wr[spc0_thread_w2])begin
                    if(is_fsr_w[spc0_thread_w2] == 0) begin
                            `SAS_TASKS.register_cmp(which_signal, spc, spc0_thread_w2, cur_cwp,
                                                    rtl_reg_addr_w2, rtl_reg_val, sas_reg_val, sas_sps_val,
                                                    rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                    end
                    isfsr[spc0_thread_w2] = 1'b0;

                end // if (good[spc0_thread_w2] != mask[spc0_thread_w2])
                if(gen_w2[spc0_thread_w2])gen_w2[spc0_thread_w2] = gen_w2[spc0_thread_w2] - 1;
                icc_wr[spc0_thread_w2] = 0;
                mul_cc[spc0_thread_w2] = 0;

            end // if (ecl_irf_wen_w2)

        end
        else if(which_signal == `FLOAT_I)begin
            if(!(ecl_irf_wen_w || ecl_irf_wen_w2))prev_vld[float_tid] = 0;
            if(float_wen[float_tid] == 2'b11)begin
                // $display("ttt: 5");
                `SAS_TASKS.register_cmp(`FLOAT_X, spc, float_tid, 0, float_low[float_tid],
                                        float_val[float_tid], sas_reg_val, sas_sps_val,
                                        rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                reg_ptr   = reg_index[float_tid];

            end
            else begin//process odd register
                if(float_wen[float_tid] == 2'b01)begin
                    // $display("ttt: 6");
                    `SAS_TASKS.register_cmp(which_signal, spc, float_tid , 0, float_up[float_tid],
                                            float_uval[float_tid], sas_reg_val, sas_sps_val,
                                            rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                    reg_ptr   = reg_index[float_tid];
                end
                if(float_wen[float_tid] == 2'b10)begin
                    // $display("ttt: 7");
                    `SAS_TASKS.register_cmp(which_signal, spc, float_tid, 0, float_low[float_tid],
                                            float_val[float_tid], sas_reg_val, sas_sps_val,
                                            rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                    reg_ptr                = reg_index[float_tid];
                end // if (ctl_frf_wen[1])
            end
        end
        else	//special registers
        begin
            spc0_command(which_signal, thread);
            if(which_signal == `FPRS)cond = which_fprs;
            // if(!(ecl_irf_wen_w2 || ecl_irf_wen_w))prev_vld[thread] = 0;
            cur_cwp = spc0_cwp_cntl && cwp_cntl[active_thread] ? cwp_val[active_thread] : cwp[spc0_thread_w2];
            if(good[active_thread] != active[active_thread])begin
                // $display("ttt: 8"); // Tri: this is where most of the misc registers are printed
                `SAS_TASKS.register_cmp(which_signal, spc, active_thread, cur_cwp, rtl_reg_addr,
                                        rtl_reg_val, sas_reg_val, sas_sps_val,
                                        rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
            end // if (good[active_thread] != active[active_thread])
        end // else: !if(which_signal == `FLOAT_I)
    end
endtask
//fpdisable signal
reg [3:0] fpdis, fpdis_first;
reg [16:0] tmp_val;
initial begin
    fpdis = 0;
    fpdis_first = 4'hf;
end
always @(posedge clk)
begin
    if(!rst_l)fpdis_first = 4'hf;
    if(ffu_ifu_fst_ce_w && !spc0_float_cntl)fpdis[spc0_thread_pc] = fpdis_trap_w && !(tlu_ifu_flush_pipe_w || ifu_tlu_flush_w);

    if(spc0_pstate_cntl)begin
        if(update_pstate0_w2 || pstate_priv_update_w2[0]) begin
            if(update_pstate0_w2)pstate[0] <= spc0_pstate_reg0;
            else
                pstate[0] <= ((pstate[0] & ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg0[`PSTATE_PRIV] << `PSTATE_PRIV));
        end
        if(update_pstate1_w2 || pstate_priv_update_w2[1]) begin
            if(update_pstate1_w2)pstate[1] <= spc0_pstate_reg1;
            else
                pstate[1] <= ((pstate[1] & ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg1[`PSTATE_PRIV] << `PSTATE_PRIV));
        end
        if(update_pstate2_w2 || pstate_priv_update_w2[2]) begin
            if(update_pstate2_w2)pstate[2] <= spc0_pstate_reg2;
            else
                pstate[2] <= ((pstate[2] & ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg2[`PSTATE_PRIV] << `PSTATE_PRIV));
        end
        if(update_pstate3_w2 || pstate_priv_update_w2[3]) begin
            if(update_pstate3_w2)pstate[3] <= spc0_pstate_reg3;
            else
                pstate[3] <= ((pstate[3] & ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg3[`PSTATE_PRIV] << `PSTATE_PRIV));
        end
    end
end // always @ (posedge clk)
//do special operations

task special_command;
    input [1:0] thread;
    input [7:0] cmd;
    input       updated;

    begin
        if(good[thread] != active[thread])begin
            used_thread = 1;
            spc0_command(`CCR, thread);
            used_thread = 0;
        end
    end
endtask // special_cmd
reg [2:0] current_cwp;
reg [5:0] reg_addr_w;
//get the current register number and window.

task get_current_win0;
    begin
        if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w])begin
            reg_addr_w   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp_val[spc0_thread_w]) , thr_rd_w[3:0]};
            current_cwp  = cwp_val[spc0_thread_w];
        end
        else begin
            reg_addr_w   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp[spc0_thread_w]), thr_rd_w[3:0]};
            current_cwp  = cwp[spc0_thread_w];
        end
        rtl_reg_val         = thread_buf_e && (spc0_thread_w == ifu_tlu_thrid_w) ?
                            {48'h0, spc0_rtl_reg_val_w[15:0]} : spc0_rtl_reg_val_w;
        if(reg_addr_w < 8)begin
            case(spc0_thread_w)
                0 : current_cwp = gl0_en ? gl_lvl0_new : gl_lvl0;
                1 : current_cwp = gl1_en ? gl_lvl1_new : gl_lvl1;
                2 : current_cwp = gl2_en ? gl_lvl2_new : gl_lvl2;
                3 : current_cwp = gl3_en ? gl_lvl3_new : gl_lvl3;
            endcase // case(spc0_thread_w)
        end
    end
endtask // get_current

task get_current_win2;
    begin
        if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w2])begin
            reg_addr_w   = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp_val[spc0_thread_w2]) , thr_rd_w2[3:0]};
            current_cwp  = cwp_val[spc0_thread_w2];
        end
        else begin
            reg_addr_w   = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp[spc0_thread_w2]), thr_rd_w2[3:0]};
            current_cwp  = cwp[spc0_thread_w2];
        end
        rtl_reg_val     = thread_buf_e && (spc0_thread_w2 == ifu_tlu_thrid_w) ?
                        {48'h0, spc0_rtl_reg_val_w2[15:0]} : spc0_rtl_reg_val_w2;
        if(reg_addr_w < 8)begin
            case(spc0_thread_w2)
                0 : current_cwp = gl0_en ? gl_lvl0_new : gl_lvl0;
                1 : current_cwp = gl1_en ? gl_lvl1_new : gl_lvl1;
                2 : current_cwp = gl2_en ? gl_lvl2_new : gl_lvl2;
                3 : current_cwp = gl3_en ? gl_lvl3_new : gl_lvl3;
            endcase // case(spc0_thread_w)
        end
    end
endtask // get_current

reg t_tmp;
reg [2:0] t_idx;
reg [3:0] p_is_load;
reg [3:0] data_exception;

task get_delay_control;
    reg [7:0] i;
    reg [1:0] tid;
    reg [7:0] t_int;

    begin
        //init. control signals.
        spc_float_cntl           = 0;
        spc_tl_cntl              = 0;
        spc_pstate_cntl          = 0;
        spc_cwp_cntl             = 0;
        spc_trap_cntl            = 0;
        spc_y_cntl               = 0;
        spc_ccr_cntl             = 0;
        spc_asi_cntl             = 0;
        spc_tick_cntl            = 0;
        spc_pil_cntl             = 0;
        spc_tba_cntl             = 0;
        spc_fprs_cntl            = 0;
        spc_fsr_cntl             = 0;
        spc_tcmp_cntl            = 0;
        spc_sft_cntl             = 0;
        spc_gsr_cntl             = 0;
        spc_gl_cntl              = 0;
        spc_hpstate_cntl         = 0;
        spc_htba_cntl            = 0;
        spc_hintp_cntl           = 0;
        spc_htick_cntl           = 0;
        spc_stick_cntl           = 0;
        spc_stickcmp_cntl        = 0;
        spc_dsfsr_cntl           = 0;
        spc_isfsr_cntl           = 0;
        spc_sfar_cntl            = 0;
        //mmu new registers
        spc_wtchpt_cntl = 0;
        spc_sctxt_cntl  = 0;
        spc_pctxt_cntl  = 0;
        spc_pid_cntl    = 0;
        //mra
        spc_inztxt_ps0_cntl = 0;
        spc_inztxt_ps1_cntl = 0;
        spc_dnztxt_ps0_cntl = 0;
        spc_dnztxt_ps1_cntl = 0;
        spc_iztxt_ps0_cntl  = 0;
        spc_iztxt_ps1_cntl  = 0;
        spc_dztxt_ps0_cntl  = 0;
        spc_dztxt_ps1_cntl  = 0;
        spc_ictxt_nzcfg_cntl= 0;
        spc_dctxt_nzcfg_cntl= 0;
        spc_ictxt_zcfg_cntl = 0;
        spc_dctxt_zcfg_cntl = 0;
        spc_itag_access_cntl= 0;
        spc_dtag_access_cntl= 0;

        //fprs register
        if(spc0_fprs_cntl)begin
            if(fprs_sel_wrt)begin
                case(fprs_sel_wrt)
                    4'b0001 : begin
                        fprs_cntl[0] = 1;
                        fprs_val[0]  = fprs_wrt_data;
                    end
                    4'b0010 : begin
                        fprs_cntl[1] = 1;
                        fprs_val[1]  = fprs_wrt_data;
                    end
                    4'b0100 : begin
                        fprs_cntl[2] = 1;
                        fprs_val[2]  = fprs_wrt_data;
                    end
                    4'b1000 : begin
                        fprs_cntl[3] = 1;
                        fprs_val[3]  = fprs_wrt_data;
                    end
                endcase // case(fprs_sel_wrt)
            end
            if(fprs_sel_set)begin
                case(fprs_sel_set)
                    4'b0001 : begin
                        fprs_cntl2[0] = 1;
                        fprs_val2[0]  = new_fprs;
                    end
                    4'b0010 : begin
                        fprs_cntl2[1] = 1;
                        fprs_val2[1]  = new_fprs;
                    end
                    4'b0100 : begin
                        fprs_cntl2[2] = 1;
                        fprs_val2[2]  = new_fprs;
                    end
                    4'b1000 : begin
                        fprs_cntl2[3] = 1;
                        fprs_val2[3]  = new_fprs;
                    end
                endcase // case(fprs_sel_set)
            end
        end // if (spc0_fprs_cltl)
        //it is the precise trap, so need to step.
        //list all the precise traps, here
        if(tlu_ifu_trappc_vld_w1           &&
                previous_flush_happen[thrid_w2])begin
            if(
                tlu_final_ttype_w2 == 8'h20  || //tlu_final_ttype_w2 == 8'h22 ||
                tlu_final_ttype_w2 == 8'h10  || tlu_final_ttype_w2 == 8'h11 ||
                tlu_final_ttype_w2 == 8'h30 && !spc0_force_flush_w2[thrid_w2]||
                tlu_final_ttype_w2 == 8'h31  ||
                //tlu_final_ttype_w2 == 8'h35  || tlu_final_ttype_w2 == 8'h3f  ||
                tlu_final_ttype_w2 >= 8'h33 &&  tlu_final_ttype_w2 <= 8'h40 ||
                //tlu_final_ttype_w2 == 8'h36  || //tlu_final_ttype_w2 == 8'h60  ||
                tlu_final_ttype_w2 == 8'h5f  || tlu_final_ttype_w2 == 8'h62  ||
                tlu_final_ttype_w2 == 8'h9c  || //tlu_final_ttype_w2 == 8'h7d  || tlu_final_ttype_w2 == 8'h7e ||
                tlu_final_ttype_w2 == 8'h64  || tlu_final_ttype_w2 == 9'h120 || tlu_final_ttype_w2 == 9'h180 ||
                tlu_final_ttype_w2 == 9'h196 || //tlu_final_ttype_w2 == 9'h4e ||
                tlu_final_ttype_w2 == 9'h12e
            )precise_trap_step[thrid_w2] = 1;
            previous_flush_happen[thrid_w2] = 0;
        end // if (tlu_ifu_trappc_vld_w1           &&...
        //mmu memory write is done.
        if(mra_wr_vld_d2)process_mra;
        //disable tick_cmpr comparsion after reset.
        if(!stickcmp_intdis_en_del[0])stickcmp_rst_after[0] = 0;
        if(!stickcmp_intdis_en_del[1])stickcmp_rst_after[1] = 0;
        if(!stickcmp_intdis_en_del[2])stickcmp_rst_after[2] = 0;
        if(!stickcmp_intdis_en_del[3])stickcmp_rst_after[3] = 0;

        if(!htickcmp_intdis_en_del[0])htickcmp_rst_after[0] = 0;
        if(!htickcmp_intdis_en_del[1])htickcmp_rst_after[1] = 0;
        if(!htickcmp_intdis_en_del[2])htickcmp_rst_after[2] = 0;
        if(!htickcmp_intdis_en_del[3])htickcmp_rst_after[3] = 0;

        if(!tickcmp_intdis_en_del[0])tickcmp_rst_after[0] = 0;
        if(!tickcmp_intdis_en_del[1])tickcmp_rst_after[1] = 0;
        if(!tickcmp_intdis_en_del[2])tickcmp_rst_after[2] = 0;
        if(!tickcmp_intdis_en_del[3])tickcmp_rst_after[3] = 0;

        //watch pointer register

        if(spc0_wtchpt_cntl)begin
            case({lsu_va_wtchpt3_wr_en_l_del,
                      lsu_va_wtchpt2_wr_en_l_del,
                      lsu_va_wtchpt1_wr_en_l_del,
                      lsu_va_wtchpt0_wr_en_l_del})
                4'b1110 : begin
                    wtchpt_val[0]  = {va_wtchpt0_addr, 3'b0};
                    wtchpt_cntl[0] = 1;
                end
                4'b1101 : begin
                    wtchpt_val[1]  = {va_wtchpt1_addr, 3'b0};
                    wtchpt_cntl[1] = 1;
                end
                4'b1011 : begin
                    wtchpt_val[2]  = {va_wtchpt2_addr, 3'b0};
                    wtchpt_cntl[2] = 1;
                end
                4'b0111 : begin
                    wtchpt_val[3]  = {va_wtchpt3_addr, 3'b0};
                    wtchpt_cntl[3] = 1;
                end
            endcase // case({lsu_va_wtchpt3_wr_en_l,...
        end // if (spc0_wtchpt_cntl)

        //primary context
        if(spc0_pctxt_cntl)begin
            if(pctxt_state_wr_thrd_del[0])begin
                pctxt_val[0]  = lsu_t0_pctxt_state;
                pctxt_cntl[0] = 1;
            end
            if(pctxt_state_wr_thrd_del[1])begin
                pctxt_val[1]  = lsu_t1_pctxt_state;
                pctxt_cntl[1] = 1;
            end
            if(pctxt_state_wr_thrd_del[2])begin
                pctxt_val[2]  = lsu_t2_pctxt_state;
                pctxt_cntl[2] = 1;
            end
            if(pctxt_state_wr_thrd_del[3])begin
                pctxt_val[3]  = lsu_t3_pctxt_state;
                pctxt_cntl[3] = 1;
            end
        end // if (spc0_pctxt_cntl)

        //secondary context
        if(spc0_sctxt_cntl)begin
            if(sctxt_state_wr_thrd_del[0])begin
                sctxt_val[0]  = sctxt_state0;
                sctxt_cntl[0] = 1;
            end
            if(sctxt_state_wr_thrd_del[1])begin
                sctxt_val[1]  = sctxt_state1;
                sctxt_cntl[1] = 1;
            end
            if(sctxt_state_wr_thrd_del[2])begin
                sctxt_val[2]  =  sctxt_state2;
                sctxt_cntl[2] = 1;
            end
            if(sctxt_state_wr_thrd_del[3])begin
                sctxt_val[3]  = sctxt_state3;
                sctxt_cntl[3] = 1;
            end
        end // if (spc0_sctxt_cntl)
        //pid
        if(spc0_pid_cntl)begin
            if(pid_state_wr_en_del[0])begin
                pid_val[0]  = lsu_pid_state0;
                pid_cntl[0] = 1;
            end
            if(pid_state_wr_en_del[1])begin
                pid_val[1]  = lsu_pid_state1;
                pid_cntl[1] = 1;
            end
            if(pid_state_wr_en_del[2])begin
                pid_val[2]  = lsu_pid_state2;
                pid_cntl[2] = 1;
            end
            if(pid_state_wr_en_del[3])begin
                pid_val[3]  = lsu_pid_state3;
                pid_cntl[3] = 1;
            end
        end

        //check the correctiable error.
        //These signals are not sync with clock.
        if(spc0_dsfsr_cntl)begin
            if(!data_exception[0])begin
                dsfsr_force_vld[0] = 1;
                dsfsr_force_val[0]  = dsfsr_din;
            end
            else if(~dmmu_sfsr_wr_en_l[0])begin
                dsfsr_val[0]  = dsfsr_din;
                dsfsr_cntl[0] = 1'b1;
            end

            if(!data_exception[1])begin
                dsfsr_force_vld[1]  = 1;
                dsfsr_force_val[1]  = dsfsr_din;
            end
            else if(~dmmu_sfsr_wr_en_l[1])begin
                dsfsr_val[1]  = dsfsr_din;
                dsfsr_cntl[1] = 1'b1;
            end

            if(!data_exception[2])begin
                dsfsr_force_vld[2]  = 1;
                dsfsr_force_val[2]  = dsfsr_din;
            end
            else if(~dmmu_sfsr_wr_en_l[2])begin
                dsfsr_val[2]  = dsfsr_din;
                dsfsr_cntl[2] = 1'b1;
            end

            if(!data_exception[3])begin
                dsfsr_force_vld[3]  = 1;
                dsfsr_force_val[3]  = dsfsr_din;
            end
            else if(~dmmu_sfsr_wr_en_l[3])begin
                dsfsr_val[3]  = dsfsr_din;
                dsfsr_cntl[3] = 1'b1;
            end
        end // if (spc0_dsfsr_cntl)

        if(spc0_isfsr_cntl)begin
            if(~immu_sfsr_wr_en_l[0] )begin
                isfsr_val[0]  = isfsr_din;
                isfsr_cntl[0] = 1'b1;
            end
            if(~immu_sfsr_wr_en_l[1])begin
                isfsr_val[1]  = isfsr_din;
                isfsr_cntl[1] = 1'b1;
            end
            if(~immu_sfsr_wr_en_l[2])begin
                isfsr_val[2]  = isfsr_din;
                isfsr_cntl[2] = 1'b1;
            end
            if(~immu_sfsr_wr_en_l[3])begin
                isfsr_val[3]  = isfsr_din;
                isfsr_cntl[3] = 1'b1;
            end
        end // if (spc0_isfsr_cntl)

        //sfar asi register.
        if(spc0_sfar_cntl)begin
            if(!data_exception[0])begin
                sfar_force_vld[0] = 1;
                sfar_force_val[0] = dsfar_din;
            end
            else if(~dmmu_sfar_wr_en_l[0])begin
                sfar_val[0]  = dsfar_din;
                sfar_cntl[0] = 1'b1;
            end

            if(!data_exception[1])begin
                sfar_force_vld[1] = 1;
                sfar_force_val[1] = dsfar_din;
            end
            else if(~dmmu_sfar_wr_en_l[1])begin
                sfar_val[1]  = dsfar_din;
                sfar_cntl[1] = 1'b1;
            end

            if(!data_exception[2])begin
                sfar_force_vld[2] = 1;
                sfar_force_val[2] = dsfar_din;
            end
            else if(~dmmu_sfar_wr_en_l[2])begin
                sfar_val[2]  = dsfar_din;
                sfar_cntl[2] = 1'b1;
            end

            if(!data_exception[3])begin
                sfar_force_vld[3] = 1;
                sfar_force_val[3] = dsfar_din;
            end
            else if(~dmmu_sfar_wr_en_l[3])begin
                sfar_val[3]  = dsfar_din;
                sfar_cntl[3] = 1'b1;
            end
        end // if (spc0_sfar_cntl)

        if((ffu_ifu_fst_ce_w ||
                (ffu_ifu_ecc_ue_w ||
                 ffu_ifu_ecc_ce_w ||
                 (ffu_ifu_ecc_ce_w2 ||
                  ffu_ifu_ecc_ue_w2) && ecc_wen)) && spc0_float_cntl )begin
            case(float_tid)
                2'b00 : begin
                    if(ffu_ifu_ecc_ue_w && (!any_ue_vld[0]  || ffu_ifu_ecc_ue_w_vld ) ||
                            ffu_ifu_ecc_ce_w && (!any_err_vld[0] || ffu_ifu_ecc_ce_w_vld ) ||
                            fpdis_trap_w || fpdis[0] ||
                            (ffu_ifu_ecc_ue_w2 || ffu_ifu_ecc_ce_w2) && ecc_wen )begin
                        fcc_wr[0] = 1;
                        frd_ws[0] = frd_w;
                        fpdis[0]  = 0;
                    end
                end
                2'b01 : begin
                    if(ffu_ifu_ecc_ue_w && (!any_ue_vld[1] || ffu_ifu_ecc_ue_w_vld ) ||
                            ffu_ifu_ecc_ce_w && (!any_err_vld[1]|| ffu_ifu_ecc_ce_w_vld ) ||
                            fpdis_trap_w || fpdis[1] ||
                            (ffu_ifu_ecc_ue_w2 || ffu_ifu_ecc_ce_w2) && ecc_wen )begin
                        fcc_wr[1]  = 1;
                        frd_ws[1]  = frd_w;
                        fpdis[1]   = 0;
                    end

                end
                2'b10 : begin
                    if(ffu_ifu_ecc_ue_w && (!any_ue_vld[2]  || ffu_ifu_ecc_ue_w_vld ) ||
                            ffu_ifu_ecc_ce_w && (!any_err_vld[2] || ffu_ifu_ecc_ce_w_vld ) ||
                            fpdis_trap_w || fpdis[2] ||
                            (ffu_ifu_ecc_ue_w2 || ffu_ifu_ecc_ce_w2) && ecc_wen )begin
                        fcc_wr[2]  = 1;
                        frd_ws[2]  = frd_w;
                        fpdis[2]   = 0;
                    end

                end
                2'b11 : begin
                    if(ffu_ifu_ecc_ue_w && (!any_ue_vld[3]  || ffu_ifu_ecc_ue_w_vld ) ||
                            ffu_ifu_ecc_ce_w && (!any_err_vld[3] || ffu_ifu_ecc_ce_w_vld ) ||
                            fpdis_trap_w || fpdis[3] || (ffu_ifu_ecc_ue_w2 || ffu_ifu_ecc_ce_w2) && ecc_wen )begin
                        fcc_wr[3] = 1;
                        frd_ws[3] = frd_w;
                        fpdis[3]  = 0;
                    end
                end
            endcase // case(fcorrect_thrid)
        end // if ((ffu_ifu_fst_ce_w ||...

        if(fpdis[float_tid] && spc0_float_cntl && fpdis_first[float_tid] )begin
            case(float_tid)
                2'b00 : begin
                    if(fpdis[0] && fpdis_first[0] )begin
                        fcc_wr[0] = 1;
                        frd_ws[0] = frd_w;
                        fpdis[0]  = 0;
                        fpdis_first[0] = 0;

                    end
                end
                2'b01 : begin
                    if( fpdis[1] && fpdis_first[1])begin
                        fcc_wr[1]  = 1;
                        frd_ws[1]  = frd_w;
                        fpdis[1]   = 0;
                        fpdis_first[1] = 0;
                    end
                end
                2'b10 : begin
                    if(fpdis[2] && fpdis_first[2])begin
                        fcc_wr[2] = 1;
                        frd_ws[2]  = frd_w;
                        fpdis[2]   = 0;
                        fpdis_first[2] = 0;
                    end
                end
                2'b11 : begin
                    if(fpdis[3] && fpdis_first[3])begin
                        fcc_wr[3] = 1;
                        frd_ws[3] = frd_w;
                        fpdis[3]  = 0;
                        fpdis_first[3] = 0;
                    end
                end
            endcase // case(fcorrect_thrid)
        end
        cwp_cntl = 0;
        if(spc0_cwp_cntl)begin
            if(cwp_wen_l[0] == 0)begin
                cwp_val[0]  =  cwp_thr0_next;
                cwp_cntl[0] = 1'b1;
            end
            if(cwp_wen_l[1] == 0)begin
                cwp_val[1]  =  cwp_thr1_next;
                cwp_cntl[1] = 1'b1;
            end
            if(cwp_wen_l[2] == 0)begin
                cwp_val[2]  =  cwp_thr2_next;
                cwp_cntl[2] = 1'b1;
            end
            if(cwp_wen_l[3] == 0)begin
                cwp_val[3]  =  cwp_thr3_next;
                cwp_cntl[3] = 1'b1;
            end
            save_happen[thrid_w]    =  save_w    && spc0_inst_done;//qualify with this.
            restore_happen[thrid_w] =  restore_w && spc0_inst_done;
        end
        if(ifu_exu_inst_w && ecl_byp_sel_ecc_w && inst_vld_w)begin
            case(thrid_w)
                2'b00 : begin
                    icc_wr[0]   = 1;
                    irs1_ws[0]  = rs1_w2;
                    irs2_ws[0]  = rs2_w2;
                end
                2'b01 : begin
                    icc_wr[1]   = 1;
                    irs1_ws[1]  = rs1_w2;
                    irs2_ws[1]  = rs2_w2;
                end
                2'b10 : begin
                    icc_wr[2]   = 1;
                    irs1_ws[2]  = rs1_w2;
                    irs2_ws[2]  = rs2_w2;
                end
                2'b11 : begin
                    icc_wr[3]   = 1;
                    irs1_ws[3]  = rs1_w2;
                    irs2_ws[3]  = rs2_w2;
                end
            endcase // case(fcorrect_thrid)
        end // if (ffu_ifu_fst_ce_w)
        //quad load
        //reset the pending quad-load
        if(spc0_inst_done && quad_load[spc0_thread_pc])quad_load[spc0_thread_pc] = 0;
        if(spc0_inst_done && dbl_w)begin
            quad_load[spc0_thread_pc] = 1;
            quad_cnt[spc0_thread_pc]  = 0;
        end
        //for trap
        p_is_load = is_load;
        if(ifu_lsu_block_w && spc0_inst_done)begin//block load
            block_load[spc0_thread_pc]    = 1'b1;
            block_count[spc0_thread_pc]   = 0;
        end
        else if(block_load[spc0_thread_pc] && spc0_inst_done && ~block_load_kill_off)begin
            block_load[spc0_thread_pc]    = 1'b0;
            if(block_count[spc0_thread_pc])begin
                $display("(%0t)Info:Not finished Block Load(%d) thread(%d)", $time,
                         block_count[spc0_thread_pc], spc0_thread_pc);
                `MONITOR_PATH.fail("Not finished Block Load!!");
            end
        end
        //is it isfsr register?
        if(ifu_lsu_ld_inst_e &&
                lda_internal_e    &&
                (asi_state_e == 8'h50 || asi_state_e == 8'h58) &&
                (exu_lsu_ldst_va_e[8:0] == 9'h018))isfsr[ifu_tlu_thrid_e] = 1'b1;
        //save load instuction
        delay_thread             = 0;
        //interrupt register updated?
        spc_indr_cntl            = t0_indr_cntl | t1_indr_cntl | t2_indr_cntl | t3_indr_cntl;
        is_it_load = 0;
        wait_load  = 0;

        //process the quad_load and general register whether it over run ot not.
        if(ecl_irf_wen_w && icc_wr[spc0_thread_w] == 0)begin
            if(quad_load[spc0_thread_w] && (quad_cnt[spc0_thread_w] == 0))begin
                quad_val[spc0_thread_w] = spc0_rtl_reg_val_w;
                quad_cnt[spc0_thread_w] = 1;
            end
            else begin
                //if(pure_load[spc0_thread_w])wait_load[spc0_thread_w] = 1;
                if(pure_load[spc0_thread_w])begin
                    wait_load[spc0_thread_w] = 1;
                end
                quad_cnt[spc0_thread_w]     = quad_cnt[spc0_thread_w] + 1;
                gen_w[spc0_thread_w]        = gen_w[spc0_thread_w] + 1;
                delay_thread[spc0_thread_w] = 1'b1;
                if(is_load[spc0_thread_w] && delay_done[spc0_thread_w] == 0)is_it_load[spc0_thread_w]  = 1'b1;
                if(gen_w[spc0_thread_w] > 1)begin
                    $display("%0t:Info: Wrong run happen thread(%x) num(%d) last_reg(%d)",
                             $time, spc0_thread_w, gen_w[spc0_thread_w], thr_rd_w);
                    `MONITOR_PATH.fail("general register-> wrong run happen!!");
                end
            end // else: !if(quad_load[spc0_thread_w])
        end // if (ecl_irf_wen_w)

        //the second port
        if(ecl_irf_wen_w2 && icc_wr[spc0_thread_w2] == 0)begin
            if(quad_load[spc0_thread_w2] && (quad_cnt[spc0_thread_w2] == 0))begin
                quad_val[spc0_thread_w2] = spc0_rtl_reg_val_w2;
                quad_cnt[spc0_thread_w2] = 1;
            end
            else begin
                //if(pure_load[spc0_thread_w2])wait_load[spc0_thread_w2] = 1;
                if(pure_load[spc0_thread_w2])begin
                    if((coreavl[spc0_thread_w2] || reset_stat[spc0_thread_w2] || ctu_stat[spc0_thread_w2]))begin
                        get_current_win2;
                        wait_load[spc0_thread_w2] = 1;
                    end
                end
                quad_cnt[spc0_thread_w2]     = quad_cnt[spc0_thread_w2] + 1;
                delay_thread[spc0_thread_w2] = 1'b1;
                gen_w2[spc0_thread_w2] = gen_w2[spc0_thread_w2] + 1;
                if(is_load[spc0_thread_w2] && delay_done[spc0_thread_w2] == 0)is_it_load[spc0_thread_w2] = 1'b1;
                if(gen_w2[spc0_thread_w2] > 1)begin
                    $display("%0t:Info: Wrong run happen thread(%x) num(%d) last_reg(%d)",
                             $time, spc0_thread_w2, gen_w2[spc0_thread_w2], thr_rd_w2);
                    `MONITOR_PATH.fail("general register-> wrong run happen!!");
                end
            end // else: !if(quad_load[spc0_thread_w2] && (quad_cnt[spc0_thread_w2] == 0))
        end // if (ecl_irf_wen_w2)
        //hypervisor
        if(spc0_hpstate_cntl)begin
            if(update_hpstate0_w2 || hpstate_priv_update_w2[0])
            begin
                hpstate_tid      = 0;
                if(update_hpstate0_w2) begin
                    hpstate_val[0]   = restore_hpstate0;
                end
                else begin
                    hpstate_val[0]   = ((hpstate_val[0] & ~(1'b1 << `HPSTATE_PRIV)) |
                                        (restore_hpstate0[`HPSTATE_PRIV] << `HPSTATE_PRIV));
                end
                hpstate_early[0] = thr0_reg_vld[`HPSTATE_SAS];
                hpstate_cntl[0]  = 1'b1;
            end
            if(update_hpstate1_w2|| hpstate_priv_update_w2[1])
            begin
                hpstate_tid      = 1;
                if(update_hpstate1_w2) begin
                    hpstate_val[1]   = restore_hpstate1;
                end
                else begin
                    hpstate_val[1]   = ((hpstate_val[1] & ~(1'b1 << `HPSTATE_PRIV)) |
                                        (restore_hpstate1[`HPSTATE_PRIV] << `HPSTATE_PRIV));
                end
                hpstate_early[1] = thr1_reg_vld[`HPSTATE_SAS];
                hpstate_cntl[1]  = 1'b1;
            end
            if(update_hpstate2_w2|| hpstate_priv_update_w2[2])
            begin
                hpstate_tid      = 2;
                if(update_hpstate2_w2) begin
                    hpstate_val[2]   = restore_hpstate2;
                end
                else begin
                    hpstate_val[2]   = ((hpstate_val[2] & ~(1'b1 << `HPSTATE_PRIV)) |
                                        (restore_hpstate2[`HPSTATE_PRIV] << `HPSTATE_PRIV));
                end
                hpstate_early[2] = thr2_reg_vld[`HPSTATE_SAS];
                hpstate_cntl[2]  = 1'b1;
            end
            if(update_hpstate3_w2|| hpstate_priv_update_w2[3])
            begin
                hpstate_tid      = 3;
                if(update_hpstate3_w2) begin
                    hpstate_val[3]   = restore_hpstate3;
                end
                else begin
                    hpstate_val[3]   = ((hpstate_val[3] & ~(1'b1 << `HPSTATE_PRIV)) |
                                        (restore_hpstate3[`HPSTATE_PRIV] << `HPSTATE_PRIV));
                end
                hpstate_early[3] = thr3_reg_vld[`HPSTATE_SAS];
                hpstate_cntl[3]  = 1'b1;
            end // if (update_hpstate3_w2|| hpstate_priv_update_w2[3])
            if(tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f)hpstate_cntl[thrid_w2] = 0;

        end // if (spc0_hpstate_cntl)
        if(spc0_htba_cntl)begin
            case(htba_del)
                4'b1110 : begin htba_tid = 0;htba_val[0] =true_htba0;end
                4'b1101 : begin htba_tid = 1;htba_val[1] =true_htba1;end
                4'b1011 : begin htba_tid = 2;htba_val[2] =true_htba2;end
                4'b0111 : begin htba_tid = 3;htba_val[3] =true_htba3;end
            endcase
            if(htba_cntl[htba_tid])begin
                $display("%0t:Info: Wrong run happen thread(%x)", $time, asi_tid);
                `MONITOR_PATH.fail("htba register-> wrong run happen!!");
            end
            htba_cntl[htba_tid] = 1'b1;
        end // if (spc0_htba_cntl)
        if(spc0_hintp_cntl)begin
            if(!hintp_del[0] && !hintp_cntl[0])begin
                hintp_early[0]  = thr0_reg_vld[`HINTP_SAS];
                hintp_cntl[0]   = 1'b1;
                hintp_val[0]    = tlu_hintp[0];
                hintp_tid = 0;
            end
            else if(!hintp_del[0] && hintp_cntl[0])begin
                hintp_cntl_2[0]   = 1'b1;
                hintp_val_2[0]    = tlu_hintp[0];
                hintp_early_2[0]  = thr0_reg_vld[`HINTP_SAS];
            end
            //thread 1
            if(!hintp_del[1] && !hintp_cntl[1])begin
                hintp_early[1]  = thr1_reg_vld[`HINTP_SAS];
                hintp_cntl[1]   = 1'b1;
                hintp_val[1]    = tlu_hintp[1];
                hintp_tid       = 1;
            end
            else if(!hintp_del[1] && hintp_cntl[1])begin
                hintp_cntl_2[1]   = 1'b1;
                hintp_val_2[1]    = tlu_hintp[1];
                hintp_early_2[1]  = thr1_reg_vld[`HINTP_SAS];
            end
            //thread2
            if(!hintp_del[2] && !hintp_cntl[2])begin
                hintp_early[2]  = thr2_reg_vld[`HINTP_SAS];
                hintp_cntl[2]   = 1'b1;
                hintp_val[2]    = tlu_hintp[2];
                hintp_tid       = 2;
            end
            else if(!hintp_del[2] && hintp_cntl[2])begin
                hintp_cntl_2[2]   = 1'b1;
                hintp_val_2[2]    = tlu_hintp[2];
                hintp_early_2[2]  = thr2_reg_vld[`HINTP_SAS];
            end

            if(!hintp_del[3] && !hintp_cntl[3])begin
                hintp_early[3]  = thr3_reg_vld[`HINTP_SAS];
                hintp_cntl[3]   = 1'b1;
                hintp_val[3]    = tlu_hintp[3];
                hintp_tid       = 3;
            end
            else if(!hintp_del[3] && hintp_cntl[3])begin
                hintp_cntl_2[3]   = 1'b1;
                hintp_val_2[3]    = tlu_hintp[3];
                hintp_early_2[3]  = thr3_reg_vld[`HINTP_SAS];
            end
        end // if (spc0_hintp_cntl)
        if(!hintp_cntl[0] && hintp_cntl_2[0])begin
            hintp_cntl[0]   = 1'b1;
            hintp_cntl_2[0] = 1'b0;
            hintp_val[0]    = hintp_val_2[0];
            hintp_tid       = 0;
            hintp_early[0]  = hintp_early_2[0];

        end
        if(!hintp_cntl[1] && hintp_cntl_2[1])begin
            hintp_cntl[1]   = 1'b1;
            hintp_cntl_2[1] = 1'b0;
            hintp_val[1]    = hintp_val_2[1];
            hintp_tid       = 1;
            hintp_early[1]  = hintp_early_2[1];
        end
        if(!hintp_cntl[2] && hintp_cntl_2[2])begin
            hintp_cntl[2]   = 1'b1;
            hintp_cntl_2[2] = 1'b0;
            hintp_val[2]    = hintp_val_2[2];
            hintp_tid       = 2;
            hintp_early[2]  = hintp_early_2[2];
        end
        if(!hintp_cntl[3] && hintp_cntl_2[3])begin
            hintp_cntl[3]   = 1'b1;
            hintp_cntl_2[3] = 1'b0;
            hintp_val[3]    = hintp_val_2[3];
            hintp_tid       = 3;
            hintp_early[3]  = hintp_early_2[3];
        end
        /*
        if(spc0_hintp_cntl)begin
        case(hintp_del)
        4'b1110 :  begin hintp_tid = 0; hintp_early[0] = thr0_reg_vld[`HINTP_SAS];end
        4'b1101 :  begin hintp_tid = 1; hintp_early[1] = thr1_reg_vld[`HINTP_SAS];end
        4'b1011 :  begin hintp_tid = 2; hintp_early[2] = thr2_reg_vld[`HINTP_SAS];end
        4'b0111 :  begin hintp_tid = 3; hintp_early[3] = thr3_reg_vld[`HINTP_SAS];end
        endcase
        if(hintp_cntl[hintp_tid])begin
        $display("%0d:Info: Wrong run happen thread(%x)", $time, asi_tid);
        `MONITOR_PATH.fail("hintp register-> wrong run happen!!");
        end
        hintp_val[hintp_tid]  = tlu_hintp[hintp_tid];
        hintp_cntl[hintp_tid] = 1'b1;
        end // if (spc0_htba_cntl)
        */
        if(spc0_htick_cntl)begin
            // if(tlu_htickcmp_en_l_del[0] == 0)begin
            if(htickcmp_intdis_en_del[0] && !htickcmp_rst_after[0])begin
                htick_tid     = 0;
                htick_val[0]  = {htick_intdis0, true_htickcmp0};
                htick_cntl[0] = 1'b1;
            end
            // if(tlu_htickcmp_en_l_del[1] == 0)begin
            if(htickcmp_intdis_en_del[1] && !htickcmp_rst_after[1])begin
                htick_tid     = 1;
                htick_val[1]  = {htick_intdis1, true_htickcmp1};
                htick_cntl[1] = 1'b1;
            end
            //if(tlu_htickcmp_en_l_del[2] == 0)begin
            if(htickcmp_intdis_en_del[2] && !htickcmp_rst_after[2])begin
                htick_tid     = 2;
                htick_val[2]  = {htick_intdis2, true_htickcmp2};
                htick_cntl[2] = 1'b1;
            end
            // if(tlu_htickcmp_en_l_del[3] == 0)begin
            if(htickcmp_intdis_en_del[3] && !htickcmp_rst_after[3])begin
                htick_tid    = 1;
                htick_val[3]  = {htick_intdis3, true_htickcmp3};
                htick_cntl[3] = 1'b1;
            end
        end
        if(spc0_stickcmp_cntl)begin
            // if(tlu_stickcmp_en_l_del[0] == 0)begin
            if(stickcmp_intdis_en_del[0] && !stickcmp_rst_after[0])begin
                stickcmp_tid     = 0;
                stickcmp_val[0]  = true_stickcmp0[63:0];
                stickcmp_cntl[0] = 1'b1;
            end
            // if(tlu_stickcmp_en_l_del[1] == 0)begin
            if(stickcmp_intdis_en_del[1]&& !stickcmp_rst_after[1])begin
                stickcmp_tid     = 1;
                stickcmp_val[1]  = true_stickcmp1[63:0];
                stickcmp_cntl[1] = 1'b1;
            end
            // if(tlu_stickcmp_en_l_del[2] == 0)begin
            if(stickcmp_intdis_en_del[2]&& !stickcmp_rst_after[2])begin
                stickcmp_tid     = 2;
                stickcmp_val[2]  = true_stickcmp2[63:0];
                stickcmp_cntl[2] = 1'b1;
            end
            //if(tlu_stickcmp_en_l_del[3] == 0)begin
            if(stickcmp_intdis_en_del[3]&& !stickcmp_rst_after[3])begin
                stickcmp_tid     = 3;
                stickcmp_val[3]  = true_stickcmp3[63:0];
                stickcmp_cntl[3] = 1'b1;
            end
        end
        if(spc0_gl_cntl)begin
            if(gl0_en)begin
                gl_val[0]   = gl_lvl0_new;
                gl_early[0] = thr0_reg_vld[`GL];
                gl_cntl[0]  = 1'b1;
                if(gl_early[0] == 0)gl_tid = 0;
            end
            if(gl1_en)begin
                gl_val[1]   = gl_lvl1_new;
                gl_early[1] = thr1_reg_vld[`GL];
                gl_cntl[1]  = 1'b1;
                if(gl_early[1] == 0)gl_tid = 1;
            end
            if(gl2_en)begin
                gl_val[2]   = gl_lvl2_new;
                gl_early[2] = thr2_reg_vld[`GL];
                gl_cntl[2]  = 1'b1;
                if(gl_early[2] == 0)gl_tid = 2;
            end
            if(gl3_en)begin
                gl_val[3]   = gl_lvl3_new;
                gl_early[3] = thr3_reg_vld[`GL];
                gl_cntl[3]  = 1'b1;
                if(gl_early[3] == 0)gl_tid = 3;
            end
        end
        //save control signals.
        // y_cntl = 0;
        if(spc0_y_cntl)begin
            if(ecl_div_yreg_wen_l[0] == 0)begin
                y_val[0]  =  next_yreg_thr0;
                y_cntl[0] = 1'b1;
                y_early[0] = spc0_inst_done && (spc0_thread_pc == 0);
            end
            if(ecl_div_yreg_wen_l[1] == 0)begin
                y_val[1]  =  next_yreg_thr1;
                y_cntl[1] = 1'b1;
                y_early[1] = spc0_inst_done && (spc0_thread_pc == 1);
            end
            if(ecl_div_yreg_wen_l[2] == 0)begin
                y_val[2]   =  next_yreg_thr2;
                y_cntl[2]  = 1'b1;
                y_early[2] = spc0_inst_done && (spc0_thread_pc == 2);
            end
            if(ecl_div_yreg_wen_l[3] == 0)begin
                y_val[3]   =  next_yreg_thr3;
                y_cntl[3]  = 1'b1;
                y_early[3] = spc0_inst_done && (spc0_thread_pc == 3);
            end
        end // if (spc0_y_cntl)
        if(spc0_ccr_cntl)begin
            if(wen_thr0_l == 0)begin
                if(ccr_cntl[0])special_command(0, `CCR, 1);
                ccr_val[0]   = ccrin_thr0;
                ccr_cntl[0]  = 1'b1;
                ccr_early[0] = spc0_inst_done && (spc0_thread_pc == 0);
            end
            if(wen_thr1_l == 0)begin
                if(ccr_cntl[1])special_command(1, `CCR, 1);
                ccr_val[1]   = ccrin_thr1;
                ccr_cntl[1]  = 1'b1;
                ccr_early[1] = spc0_inst_done && (spc0_thread_pc == 2'b01);
            end
            if(wen_thr2_l == 0)begin
                if(ccr_cntl[2])special_command(2, `CCR, 1);
                ccr_val[2]   = ccrin_thr2;
                ccr_cntl[2]  = 1'b1;
                ccr_early[2] = spc0_inst_done && (spc0_thread_pc == 2'b10);
            end
            if(wen_thr3_l == 0)begin
                if(ccr_cntl[3])special_command(3, `CCR, 1);
                ccr_val[3]   = ccrin_thr3;
                ccr_cntl[3]  = 1'b1;
                ccr_early[3] = spc0_inst_done && (spc0_thread_pc == 2'b11);
            end
        end // if (spc0_ccr_cntl)
        if(spc0_gsr_cntl[0])begin
            gsr_val[0]  = {t0_gsr_nxt[36:5], 4'b0, t0_gsr_rnd_next[2:0], 17'b0,
                           t0_gsr_nxt[4:0], t0_gsr_align_next[2:0]};
            gsr_cntl[0] = 1'b1;
            gsr_tid     = 0;
            gsr_early[0] = spc0_inst_done && (spc0_thread_pc == 0);

        end // if (spc0_ccr_cntl)
        if(spc0_gsr_cntl[1])begin
            gsr_val[1]  = {t1_gsr_nxt[36:5], 4'b0, t1_gsr_rnd_next[2:0], 17'b0,
                           t1_gsr_nxt[4:0], t1_gsr_align_next[2:0]};
            gsr_cntl[1] = 1'b1;
            gsr_tid     = 1;
            gsr_early[1] = spc0_inst_done && (spc0_thread_pc == 1);
        end
        if(spc0_gsr_cntl[2])begin
            gsr_val[2]  = {t2_gsr_nxt[36:5], 4'b0, t2_gsr_rnd_next[2:0], 17'b0,
                           t2_gsr_nxt[4:0], t2_gsr_align_next[2:0]};
            gsr_cntl[2] = 1'b1;
            gsr_tid     = 2;
            gsr_early[2] = spc0_inst_done && (spc0_thread_pc == 2);
        end // if (spc0_ccr_cntl)
        if(spc0_gsr_cntl[3])begin
            gsr_val[3]  = {t3_gsr_nxt[36:5], 4'b0, t3_gsr_rnd_next[2:0], 17'b0,
                           t3_gsr_nxt[4:0], t3_gsr_align_next[2:0]};
            gsr_cntl[3] = 1'b1;
            gsr_tid     = 3;
            gsr_early[3] = spc0_inst_done && (spc0_thread_pc == 3);
        end
        if(spc0_asi_cntl)begin
            case(asi_state_wr_thrd)
                4'b0001 : asi_tid = 0;
                4'b0010 : asi_tid = 1;
                4'b0100 : asi_tid = 2;
                4'b1000 : asi_tid = 3;
            endcase // case(1)
            asi_val[asi_tid]  = spc0_asi_state;
            if(asi_cntl[asi_tid])begin
                $display("%0t:Info: Wrong run happen thread(%x)", $time, asi_tid);
                `MONITOR_PATH.fail("asi register-> wrong run happen!!");
            end
            asi_cntl[asi_tid] = 1'b1;
        end
        if(spc0_tick_cntl)begin
            if(tick0_en)begin
                tick_tid     = 0;
                tick_cntl[0] = 1'b1;
                tick_val[0]  = {tick_ctl_din, spc0_tick_reg[62:0]};
            end
            if(tick1_en)begin
                tick_tid     = 1;
                tick_cntl[1] = 1'b1;
                tick_val[1]  = {tick_ctl_din, spc0_tick_reg[62:0]};
            end
            if(tick2_en)begin
                tick_tid     = 2;
                tick_cntl[2] = 1'b1;
                tick_val[2]  = {tick_ctl_din, spc0_tick_reg[62:0]};
            end
            if(tick3_en)begin
                tick_tid     = 1;
                tick_cntl[3] = 1'b1;
                tick_val[3]  = {tick_ctl_din, spc0_tick_reg[62:0]};
            end
        end
        if(spc0_pil_cntl)begin
            case({pil3_en, pil2_en,pil1_en, pil0_en})
                4'b0001 : pil_tid = 0;
                4'b0010 : pil_tid = 1;
                4'b0100 : pil_tid = 2;
                4'b1000 : pil_tid = 3;
            endcase // case(1)
            pil_val[pil_tid]  = spc0_pil_reg;
            if(pil_cntl[pil_tid])begin
                $display("%0t:Info: Wrong run happen thread(%x)", $time, pil_tid);
                `MONITOR_PATH.fail("pil register-> wrong run happen!!");
            end
            pil_cntl[pil_tid] = 1'b1;
        end
        if(spc0_tba_cntl)begin
            case({tba3_en, tba2_en, tba1_en, tba0_en})
                4'b1110 : tba_tid = 0;
                4'b1101 : tba_tid = 1;
                4'b1011 : tba_tid = 2;
                4'b0111 : tba_tid = 3;
            endcase // case(0)
            tba_val[tba_tid]  = spc0_tba_reg;
            if(tba_cntl[tba_tid])begin
                $display("%0t:Info: Wrong run happen thread(%x)", $time, tba_tid);
                `MONITOR_PATH.fail("tba register-> wrong run happen!!");
            end
            tba_cntl[tba_tid] = 1'b1;
        end // if (spc0_tba_cntl)
        //floating point
        if(spc0_float_cntl)begin
            case(ctl_frf_wen)
                2'b11 : begin
                    float_val[float_tid]  = {dp_frf_data[70:39], dp_frf_data[31:0]};
                    float_low[float_tid]  = {ctl_frf_addr[4:0], 1'b0};
                    float_up[float_tid]   = {ctl_frf_addr[4:0], 1'b1};
                    if(block_load[float_tid])begin//process the block load
                        t_idx                  = block_count[float_tid];
                        block_count[float_tid] = block_count[float_tid] + 1;
                        // $display("ttt: 9");
                        `SAS_TASKS.register_cmp(`FLOAT_X, cpu_id, float_tid, 0, float_low[float_tid],
                                                float_val[float_tid], sas_reg_val, sas_sps_val,
                                                rs1_w2, alu_rs1_w2, rs2_w2, alu_rs2_w2, cond);
                        if(t_idx == 7)begin
                            block_enable[float_tid] = 1'b1;
                            block_load[float_tid]   = 1'b0;
                        end
                        if(block_count[float_tid] != 1)float_cntl[float_tid] = 1'b0;
                    end
                end//odd register
                2'b01 : begin
                    float_uval[float_tid] = dp_frf_data[31:0];
                    float_up[float_tid]   = {ctl_frf_addr[4:0], 1'b1};
                end//even register
                2'b10 : begin
                    float_val[float_tid]  = {dp_frf_data[31:0], dp_frf_data[70:39]};
                    float_low[float_tid]  = {ctl_frf_addr[4:0], 1'b0};
                end
            endcase // case(ctl_frf_wen)
            if(float_cntl[float_tid])begin
                $display("%0t:Info: Wrong run happen thread(%x)", $time, float_tid);
                `MONITOR_PATH.fail("float_register-> wrong run happen!!");
            end
            if(block_load[float_tid] == 0)float_cntl[float_tid] = 1'b1;
            // $display("WENFLOAT %d %x", $time, fcc_wr[float_tid]);
            if(fcc_wr[float_tid])begin //&& (ctl_frf_addr[4:0] == frd_ws[float_tid]))begin
                fcc_wr[float_tid]    = 0;
                float_wen[float_tid] = 0;
            end
            else float_wen[float_tid]  = ctl_frf_wen;
            reg_index[float_tid]  = regfile_index;
        end // if (spc0_float_cntl)

        fsr_cntl = 0;
        if(spc0_fsr_cntl)begin
            if(ctl_dp_fsr_sel_old[0] == 0)begin
                fsr_cntl[0]= 1'b1;
                fsr_val[0] = t0_fsr_nxt;
            end
            if(ctl_dp_fsr_sel_old[1] == 0)begin
                fsr_cntl[1]= 1'b1;
                fsr_val[1] = t1_fsr_nxt;
            end // if (ctl_dp_fsr_sel_old[0] == 0)
            if(ctl_dp_fsr_sel_old[2] == 0)begin
                fsr_cntl[2]= 1'b1;
                fsr_val[2] = t2_fsr_nxt;
            end
            if(ctl_dp_fsr_sel_old[3] == 0)begin
                fsr_cntl[3]= 1'b1;
                fsr_val[3] = t3_fsr_nxt;
            end
        end // if (spc0_fsr_cntl)
        if(tl0_en)begin
            tl_val[0]   = trp_lvl0_new;
            tl_cntl[0]  = 1;
            tl_early[0] = thr0_reg_vld[`TL_SAS];
            if(tl_early[0] == 0)tl_tid = 0;
        end
        if(tl1_en)begin
            tl_val[1]   = trp_lvl1_new;
            tl_cntl[1]  = 1;
            tl_early[1] = thr1_reg_vld[`TL_SAS];
            if(tl_early[1] == 0)tl_tid = 1;
        end
        if(tl2_en)begin
            tl_val[2]   = trp_lvl2_new;
            tl_cntl[2]  = 1;
            tl_early[2] = thr2_reg_vld[`TL_SAS];
            if(tl_early[2] == 0)tl_tid = 2;
        end
        if(tl3_en)begin
            tl_val[3]   = trp_lvl3_new;
            tl_cntl[3]  = 1;
            tl_early[3] = thr3_reg_vld[`TL_SAS];
            if(tl_early[3] == 0)tl_tid = 3;
        end
        // modified due to width change in RTL
        if(spc0_pstate_cntl)begin
            if(update_pstate0_w2 || pstate_priv_update_w2[0])
            begin
                pstate_tid              = 0;
                pstate_early[0]         = thr0_reg_vld[`PSTATE_SAS];
                pstate_cntl[0]          = 1'b1;
                if(update_pstate0_w2)pstate_val[0] = spc0_pstate_reg0;
                else pstate_val[0] = ((pstate_val[0] &
                                           ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg0[`PSTATE_PRIV] << `PSTATE_PRIV));
            end
            if(update_pstate1_w2 || pstate_priv_update_w2[1])
            begin
                pstate_tid              = 1;
                pstate_early[1]         = thr1_reg_vld[`PSTATE_SAS];
                pstate_cntl[1]          = 1'b1;
                if(update_pstate1_w2)pstate_val[1] = spc0_pstate_reg1;
                else pstate_val[1] = ((pstate_val[1] &
                                           ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg1[`PSTATE_PRIV] << `PSTATE_PRIV));
            end
            if(update_pstate2_w2 || pstate_priv_update_w2[2])
            begin
                pstate_tid      = 2;
                pstate_early[2] = thr2_reg_vld[`PSTATE_SAS];
                pstate_cntl[2]  = 1'b1;
                if(update_pstate2_w2)pstate_val[2] = spc0_pstate_reg2;
                else pstate_val[2] = ((pstate_val[2] &
                                           ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg2[`PSTATE_PRIV] << `PSTATE_PRIV));
            end
            if(update_pstate3_w2 || pstate_priv_update_w2[3])
            begin
                pstate_tid              = 3;
                pstate_early[3]         = thr3_reg_vld[`PSTATE_SAS];
                pstate_cntl[3]          = 1'b1;
                if(update_pstate3_w2)pstate_val[3] = spc0_pstate_reg3;
                else pstate_val[3] = ((pstate_val[3] &
                                           ~(1'b1 << `PSTATE_PRIV)) | (spc0_pstate_reg3[`PSTATE_PRIV] << `PSTATE_PRIV));
            end
            //if(tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f)pstate_cntl[thrid_w2] = 0;
        end // if (spc0_pstate_cntl)

        /* cwp_cntl = 0;
        if(spc0_cwp_cntl)begin
        if(cwp_wen_l[0] == 0)begin
        cwp_val[0]  =  cwp_thr0_next;
        cwp_cntl[0] = 1'b1;
        end
        if(cwp_wen_l[1] == 0)begin
        cwp_val[1]  =  cwp_thr1_next;
        cwp_cntl[1] = 1'b1;
        end
        if(cwp_wen_l[2] == 0)begin
        cwp_val[2]  =  cwp_thr2_next;
        cwp_cntl[2] = 1'b1;
        end
        if(cwp_wen_l[3] == 0)begin
        cwp_val[3]  =  cwp_thr3_next;
        cwp_cntl[3] = 1'b1;
        end
        save_happen[thrid_w]    =  save_w    & spc0_inst_done;//quailify with this.
        restore_happen[thrid_w] =  restore_w & spc0_inst_done;
        end*/
        if(spc0_trap_write)begin
            trap_val[spc0_trap_tid]  = spc0_trap_tpl;
            trap_data[spc0_trap_tid] = spc0_trap_data;
            if(trap_cntl[spc0_trap_tid])begin
                $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                `MONITOR_PATH.fail("trap register-> wrong run happen!!");
            end
            trap_cntl[spc0_trap_tid] = 1;
            if(spc0_trap_pc)begin
                if(tpc_cntl[spc0_trap_tid])begin
                    $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                    `MONITOR_PATH.fail("tpc register-> wrong run happen!!");
                end
                tpc_cntl[spc0_trap_tid]        = 1'b1;
            end
            if(spc0_trap_npc)begin
                if(tnpc_cntl[spc0_trap_tid])begin
                    $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                    `MONITOR_PATH.fail("tnpc register-> wrong run happen!!");
                end
                tnpc_cntl[spc0_trap_tid]      = 1'b1;
            end
            if(spc0_trap_tstate)begin
                if(tstate_cntl[spc0_trap_tid])begin
                    $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                    `MONITOR_PATH.fail("tstate register-> wrong run happen!!");
                end
                tstate_cntl[spc0_trap_tid] = 1'b1;
            end
            if(spc0_trap_htstate)begin
                if(htstate_cntl[spc0_trap_tid])begin
                    $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                    `MONITOR_PATH.fail("htstate register-> wrong run happen!!");
                end
                htstate_cntl[spc0_trap_tid] = 1'b1;
            end
            if(spc0_trap_ttype)begin
                if(ttype_cntl[spc0_trap_tid])begin
                    $display("%0t:Info: Wrong run happen cpu(%x) thread(%x)", $time, cpu_id, spc0_trap_tid);
                    `MONITOR_PATH.fail("ttype register-> wrong run happen!!");
                end
                ttype_cntl[spc0_trap_tid]   = 1'b1;
            end
        end // if (spc0_trap_write)
        //soft can have more than one in one instruction boundary.
        if(tick_match_del)begin
            case(tick_match_tid)
                2'b00 : begin
                    if(sft_vld0)sft_val0[tick_match_num] = sftint0[16:0];
                    else sft_val[0] = sftint0[16:0];
                end
                2'b01 : begin
                    if(sft_vld1)sft_val1[tick_match_num] = sftint1[16:0];
                    else sft_val[1] = sftint1[16:0];
                end
                2'b10 : begin
                    if(sft_vld2)sft_val2[tick_match_num] = sftint2[16:0];
                    else sft_val[2] = sftint2[16:0];
                end
                2'b11 : begin
                    if(sft_vld3)sft_val3[tick_match_num] = sftint3[16:0];
                    else sft_val[3] = sftint3[16:0];
                end
            endcase
        end

        if(spc0_sft_cntl || spct_sft_cntl)begin
            if(sftint0_clk_del0 || spct_sft_cntl[0])begin
                sft_tid = 0;
                if(sft_cntl[0]           &&
                        sft_val[0] != sftint0 &&
                        (tick_match_del || sftint0_clk_del0) &&
                        update_by_sft[0] == 0)begin
                    for(i = 0; i < 1; i = i + 1)begin
                        if(sft_vld0[i] == 0)begin
                            sft_vld0[i]    = 1;
                            sft_val0[i]    = sftint0[16:0];
                            sft_match0[i]  = tick_match_del;
                            tick_match_num = i;
                            tick_match_tid = 0;
                            i              = 4;
                        end
                    end
                end
                else begin
                    sft_val[0]  = sftint0[16:0];
                    sft_cntl[0] = 1'b1;
                    sft_match[0]= tick_match_del;
                    if(tick_match)tick_match_tid = 0;
                    sft_spct[0] = spct_sft_cntl[0];
                    if(spct_sft_cntl[0] && ~sftint0_clk_del0)update_by_sft[0] = 1'b1;
                    else update_by_sft[0] = 1'b0;
                end // else: !if(sft_cntl[0])
            end
            if(sftint1_clk_del0 || spct_sft_cntl[1])begin
                sft_tid     = 1;
                //if(sft_cntl[1] && !spct_sft_cntl[1])begin
                if(sft_cntl[1]           &&
                        sft_val[1] != sftint1 &&
                        (tick_match_del || sftint1_clk_del0) &&
                        update_by_sft[1] == 0 )begin
                    for(i = 0; i < 1; i = i + 1)begin
                        if(sft_vld1[i] == 0)begin
                            sft_vld1[i]    = 1;
                            sft_val1[i]    = sftint1[16:0];
                            sft_match1[i]  = tick_match_del;
                            tick_match_num = i;
                            tick_match_tid = 1;
                            i              = 4;
                        end
                    end
                end
                else begin
                    sft_val[1]  = sftint1[16:0];
                    sft_cntl[1] = 1'b1;
                    sft_match[1]= tick_match_del;
                    if(tick_match)tick_match_tid = 1;
                    sft_spct[1] = spct_sft_cntl[1];
                    if(spct_sft_cntl[1] && ~sftint1_clk_del0) update_by_sft[1] = 1'b1;
                    else update_by_sft[1] = 1'b0;
                end // else: !if(sft_cntl[0])
            end
            if(sftint2_clk_del0 || spct_sft_cntl[2])begin
                sft_tid     = 2;
                if(sft_cntl[2]           &&
                        sft_val[2] != sftint2 &&
                        (tick_match_del || sftint2_clk_del0) &&
                        update_by_sft[2] == 0)begin
                    for(i = 0; i < 1; i = i + 1)begin
                        if(sft_vld2[i] == 0)begin
                            sft_vld2[i]    = 1;
                            sft_val2[i]    = sftint2[16:0];
                            sft_match2[i]  = tick_match_del;
                            tick_match_num = i;
                            tick_match_tid = 2;
                            i              = 4;
                        end
                    end
                end
                else begin
                    sft_val[2]  = sftint2[16:0];
                    sft_cntl[2] = 1'b1;
                    sft_match[2]= tick_match_del;
                    if(tick_match)tick_match_tid = 2;
                    sft_spct[2] = spct_sft_cntl[2];
                    if(spct_sft_cntl[2] && ~sftint2_clk_del0)update_by_sft[2] = 1'b1;
                    else update_by_sft[2] = 1'b0;
                end // else: !if(sft_cntl[1])
            end
            if(sftint3_clk_del0 || spct_sft_cntl[3])begin
                sft_tid     = 3;
                if(sft_cntl[3]           &&
                        sft_val[3] != sftint3 &&
                        (tick_match_del || sftint3_clk_del0) &&
                        update_by_sft[3] == 0)begin
                    for(i = 0; i < 1; i = i + 1)begin
                        if(sft_vld3[i] == 0)begin
                            sft_vld3[i]    = 1;
                            sft_val3[i]    = sftint3[16:0];
                            sft_match3[i]  = tick_match_del;
                            tick_match_num = i;
                            tick_match_tid = 3;
                            i              = 4;
                        end
                    end
                end
                else begin
                    sft_val[3]  = sftint3[16:0];
                    sft_cntl[3] = 1'b1;
                    sft_match[3]= tick_match_del;
                    if(tick_match)tick_match_tid = 3;
                    sft_spct[3] = spct_sft_cntl[3];
                    if(spct_sft_cntl[3] && ~sftint3_clk_del0)update_by_sft[3] = 1'b1;
                    else update_by_sft[3] = 1'b0;
                end // else: !if(sft_cntl[1])
            end
        end // if (spc0_sft_cntl)
        else begin
            //thread 0
            if(sft_vld0 && (sft_cntl[0] == 0))begin
                sft_val[0]  = sft_val0[0];
                sft_match[0]= sft_match0[0];
                sft_cntl[0] = 1;
                sft_tid     = 0;
                for(i = 0; i < 3; i = i + 1)begin
                    sft_val0[i] = sft_val0[i+1];
                    sft_vld0[i] = sft_vld0[i+1];
                    sft_match0[i]= sft_match0[i+1];
                end
                sft_vld0[3]   = 0;
                sft_match0[3] = 0;
            end // if (sft_vld0 && (sft_cntl[0] == 0))

            //thread 1
            if(sft_vld1 && (sft_cntl[1] == 0))begin
                sft_val[1]  = sft_val1[0];
                sft_match[1]= sft_match1[0];
                sft_cntl[1] = 1;
                sft_tid     = 1;
                for(i = 0; i < 3; i = i + 1)begin
                    sft_val1[i] = sft_val1[i+1];
                    sft_vld1[i] = sft_vld1[i+1];
                    sft_match1[i]= sft_match1[i+1];
                end
                sft_vld1[3]   = 0;
                sft_match1[3] = 0;
            end // if (sft_vld1 && (sft_cntl[1] == 0))

            //thread 2
            if(sft_vld2 && (sft_cntl[2] == 0))begin
                sft_val[2]  = sft_val2[0];
                sft_match[2]= sft_match2[0];
                sft_cntl[2] = 1;
                sft_tid     = 2;
                for(i = 0; i < 3; i = i + 1)begin
                    sft_val2[i] = sft_val2[i+1];
                    sft_vld2[i] = sft_vld2[i+1];
                    sft_match2[i]= sft_match2[i+1];
                end
                sft_vld2[3]   = 0;
                sft_match2[3] = 0;
            end // if (sft_vld2 && (sft_cntl[2] == 0))

            //thread 3
            if(sft_vld3 && (sft_cntl[3] == 0))begin
                sft_val[3]  = sft_val3[0];
                sft_match[3]= sft_match3[0];
                sft_cntl[3] = 1;
                sft_tid     = 3;
                for(i = 0; i < 3; i = i + 1)begin
                    sft_val3[i] = sft_val3[i+1];
                    sft_vld3[i] = sft_vld3[i+1];
                    sft_match3[i]= sft_match3[i+1];
                end
                sft_vld3[3]   = 0;
                sft_match3[3] = 0;
            end
        end // else: !if(spc0_sft_cntl || spct_sft_cntl)

        //tick_cmpr register control
        if(spc0_tcmp_cntl)begin
            if(tickcmp_intdis_en_del[0] && !tickcmp_rst_after[0])begin
                tcmp_val[0]         = true_tickcmp0[63:0];
                tcmp_cntl[0]        = 1'b1;
            end
            if(tickcmp_intdis_en_del[1]&& !tickcmp_rst_after[1])begin
                tcmp_val[1]         = true_tickcmp1[63:0];
                tcmp_cntl[1]        = 1'b1;
            end
            if(tickcmp_intdis_en_del[2]&& !tickcmp_rst_after[2])begin
                tcmp_val[2]         = true_tickcmp2[63:0];
                tcmp_cntl[2]        = 1'b1;
            end
            if(tickcmp_intdis_en_del[3]&& !tickcmp_rst_after[3])begin
                tcmp_val[3]         = true_tickcmp3[63:0];
                tcmp_cntl[3]        = 1'b1;
            end
        end // if (spc0_sft_cntl)
        if(spc0_inst_done   ||  spc0_flush_happen ||
                ecl_irf_wen_w  && (!quad_load[spc0_thread_w]  || quad_cnt[spc0_thread_w]  == 2)   ||
                ecl_irf_wen_w2 && (!quad_load[spc0_thread_w2] || quad_cnt[spc0_thread_w2] == 2)   ||
                spc0_fsr_cntl     ||
                (spc0_tl_cntl     &&  tl_early[tl_tid]          == 0)      ||
                (spc0_pstate_cntl &&  pstate_early[pstate_tid]  == 0)      ||
                (spc0_gl_cntl     &&  gl_early[gl_tid]          == 0)      ||
                (spc0_hpstate_cntl&&  hpstate_early[hpstate_tid]== 0)      ||
                spc0_cwp_cntl    ||  spc0_htba_cntl   ||
                spc0_float_cntl && (block_load[float_tid] == 0)
          )begin

            if(y_cntl[spc0_thread_pc] && spc0_inst_done)begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_y_cntl                   = 1'b1;
                y_cntl[spc0_thread_pc]       = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
                y_tid                        = spc0_thread_pc;
                which_y_cntl[0]              = 1'b1;
            end
            //mulscc instruction update regs asyn.
            if(y_cntl[spc0_thread_w] &&
                    ecl_irf_wen_w         &&
                    (spc0_thread_w != spc0_thread_pc))begin
                is_load[spc0_thread_w]       = 1'b0;
                spc_y_cntl                   = 1'b1;
                y_cntl[spc0_thread_w]        = 1'b0;
                delay_thread[spc0_thread_w]  = 1'b1;
                y_tid_w                      = spc0_thread_w;
                which_y_cntl[1]              = 1'b1;
            end
            if(y_cntl[spc0_thread_w2] &&
                    ecl_irf_wen_w2         &&
                    (spc0_thread_w2 != spc0_thread_pc))begin
                is_load[spc0_thread_w2]      = 1'b0;
                spc_y_cntl                   = 1'b1;
                y_cntl[spc0_thread_w2]       = 1'b0;
                delay_thread[spc0_thread_w2] = 1'b1;
                y_tid_w2                     = spc0_thread_w2;
                which_y_cntl[2]              = 1'b1;
            end
            if(ccr_cntl[spc0_thread_pc] && spc0_inst_done)begin
                is_load[spc0_thread_pc]  = 1'b0;
                spc_ccr_cntl             = 1'b1;
                ccr_cntl[spc0_thread_pc] = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
                ccr_tid = spc0_thread_pc;
            end
            //fprs
            if((fprs_cntl[spc0_thread_pc] || fprs_cntl2[spc0_thread_pc])&& spc0_inst_done)begin
                if(fprs_cntl[spc0_thread_pc])begin
                    fprs_cntl[spc0_thread_pc] = 1'b0;
                    which_fprs = 1;
                end
                if(fprs_cntl2[spc0_thread_pc])begin
                    fprs_cntl2[spc0_thread_pc] = 1'b0;
                    which_fprs = 0;
                end
                is_load[spc0_thread_pc]  = 1'b0;
                spc_fprs_cntl            = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            //------------------------------------------------------------
            // exception 1.: expect a softint value on the step after flush pipe
            // exception 2.: choose the last update value to comapre if no flush.
            // exception 3.: if the current instruction is load, delay the processing.
            //------------------------------------------------------------
            //if(!fsr_cntl[spc0_thread_pc] && !tlu_ifu_flush_pipe_w ||
            sft_tid_vld = 0;

            if(sft_cntl[spc0_thread_pc]   &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]  ||
                     tlu_ifu_flush_pipe_w)     &&
                    (spc0_inst_done || spc0_flush_happen))begin
                if(spc0_inst_done ||
                        spc0_flush_happen &&
                        ((spc0_thread_pc == 0) && sft_match0[0] && !sft_spct[0] ||
                         (spc0_thread_pc == 1) && sft_match1[0] && !sft_spct[1] ||
                         (spc0_thread_pc == 2) && sft_match2[0] && !sft_spct[2] ||
                         (spc0_thread_pc == 3) && sft_match3[0] && !sft_spct[3]))begin
                    case(spc0_thread_pc)
                        2'b00 :
                            if(sft_vld0[0])begin
                                sft_val[0]    = sft_val0[0];
                                sft_vld0[0]   = 1'b0;
                                sft_match0[0] = 0;

                            end
                        2'b01 :
                            if(sft_vld1[0])begin
                                sft_val[1]    = sft_val1[0];
                                sft_vld1[0]   = 1'b0;
                                sft_match1[0] = 0;
                            end
                        2'b10 :
                            if(sft_vld2[0])begin
                                sft_val[2]    = sft_val2[0];
                                sft_vld2[0]   = 1'b0;
                                sft_match2[0] = 0;
                            end
                        2'b11 :
                            if(sft_vld3[0])begin
                                sft_val[3]    = sft_val0[0];
                                sft_vld3[0]   = 1'b0;
                                sft_match3[0] = 0;
                            end
                    endcase
                end // if (spc0_inst_done)
                is_load[spc0_thread_pc]      = 1'b0;
                spc_sft_cntl                 = 1'b1;
                sft_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
                psft_flush                   = csft_flush;
                if(spc0_flush_happen)csft_flush[spc0_thread_pc] = 1;
                else csft_flush[spc0_thread_pc] = 0;
                sft_tid_vld[0]                  = 1;
                sft_thrid[0]                    = spc0_thread_pc;
                if(spc0_inst_done)psft_flush[spc0_thread_pc] = 1'b0;

            end // if (sft_cntl[spc0_thread_pc]  &&...
            //delay load
            if(ecl_irf_wen_w           &&
                    sft_cntl[ecl_irf_tid_w] &&
                    is_load[ecl_irf_tid_w])begin
                case(ecl_irf_tid_w)
                    2'b00 :
                        if(sft_vld0[0])begin
                            sft_val[0] = sft_val0[0];
                            sft_vld0[0] = 1'b0;
                        end
                    2'b01 :
                        if(sft_vld1[0])begin
                            sft_val[1] = sft_val1[0];
                            sft_vld1[0] = 1'b0;
                        end
                    2'b10 :
                        if(sft_vld2[0])begin
                            sft_val[2] = sft_val2[0];
                            sft_vld2[0] = 1'b0;
                        end
                    2'b11 :
                        if(sft_vld3[0])begin
                            sft_val[3] = sft_val0[0];
                            sft_vld3[0] = 1'b0;
                        end
                endcase
                spc_sft_cntl                = 1'b1;
                sft_cntl[ecl_irf_tid_w]     = 1'b0;
                delay_thread[ecl_irf_tid_w] = 1'b1;
                sft_thrid[1]                = ecl_irf_tid_w;
                sft_tid_vld[1]              = 1;
            end // if (sft_cntl[spc0_thread_pc]  &&...
            if(ecl_irf_wen_w2            &&
                    sft_cntl[ecl_irf_tid_w2]  &&
                    is_load[ecl_irf_tid_w2])begin
                case(ecl_irf_tid_w2)
                    2'b00 :
                        if(sft_vld0[0])begin
                            sft_val[0] = sft_val0[0];
                            sft_vld0[0] = 1'b0;
                        end
                    2'b01 :
                        if(sft_vld1[0])begin
                            sft_val[1] = sft_val1[0];
                            sft_vld1[0] = 1'b0;
                        end
                    2'b10 :
                        if(sft_vld2[0])begin
                            sft_val[2] = sft_val2[0];
                            sft_vld2[0] = 1'b0;
                        end
                    2'b11 :
                        if(sft_vld3[0])begin
                            sft_val[3] = sft_val0[0];
                            sft_vld3[0] = 1'b0;
                        end
                endcase
                spc_sft_cntl                 = 1'b1;
                sft_cntl[ecl_irf_tid_w2]     = 1'b0;
                delay_thread[ecl_irf_tid_w2] = 1'b1;
                sft_thrid[2]                 = ecl_irf_tid_w2;
                sft_tid_vld[2]               = 1;
            end // if (sft_cntl[spc0_thread_pc]  &&...

            if(spc0_inst_done)csft_flush[spc0_thread_pc] = 0;
            //handle the same as the softint.
            hintp_tid_vld = 0;
            if(hintp_cntl[spc0_thread_pc]  &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]   ||
                     tlu_ifu_flush_pipe_w) &&
                    (spc0_inst_done || spc0_flush_happen))begin

                is_load[spc0_thread_pc]      = 1'b0;
                hintp_cntl[spc0_thread_pc]   = 1'b0;
                spc_hintp_cntl               = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                hintp_thrid[0]               = spc0_thread_pc;
                hintp_tid_vld[0]             = 1;
                hintp_tid                    = spc0_thread_pc;
            end
            if(ecl_irf_wen_w                 &&
                    hintp_cntl[ecl_irf_tid_w]     &&
                    is_load[ecl_irf_tid_w])begin
                is_load[ecl_irf_tid_w]      = 1'b0;
                hintp_cntl[ecl_irf_tid_w]   = 1'b0;
                spc_hintp_cntl              = 1'b1;
                delay_thread[ecl_irf_tid_w] = 1'b1;
                hintp_thrid[1]              = ecl_irf_tid_w;
                hintp_tid_vld[1]            = 1;
                hintp_tid                   = ecl_irf_tid_w;
            end
            if(ecl_irf_wen_w2                &&
                    hintp_cntl[ecl_irf_tid_w2]    &&
                    is_load[ecl_irf_tid_w2])begin

                is_load[ecl_irf_tid_w2]      = 1'b0;
                hintp_cntl[ecl_irf_tid_w2]   = 1'b0;
                spc_hintp_cntl               = 1'b1;
                delay_thread[ecl_irf_tid_w2] = 1'b1;
                hintp_thrid[2]               = ecl_irf_tid_w2;
                hintp_tid_vld[2]             = 1;
                hintp_tid                    = ecl_irf_tid_w2;
            end // if (ecl_irf_wen_w2 &&...

            if(asi_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_asi_cntl                 = 1'b1;
                asi_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            //do tick_cmpr instruction
            if(tcmp_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_tcmp_cntl                = 1'b1;
                tcmp_cntl[spc0_thread_pc]    = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            if(tick_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_tick_cntl                = 1'b1;
                tick_cntl[spc0_thread_pc]    = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            if(gsr_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_gsr_cntl                 = 1'b1;
                gsr_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            if(pil_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_pil_cntl                 = 1'b1;
                pil_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            if(tba_cntl[spc0_thread_pc])begin
                is_load[spc0_thread_pc]      = 1'b0;
                spc_tba_cntl                 = 1'b1;
                tba_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
            end
            //block load signals generated
            if(spc0_float_cntl && (block_load[float_tid] == 0))begin
                if(is_load[float_tid]             &&
                        (block_enable[float_tid] == 0) &&
                        (spc0_flush_happen == 0))float_load[float_tid] = 1'b1;
                float_cntl[float_tid]   = 1'b0;
                spc_float_cntl          = 1'b1;
                is_load[float_tid]      = 1'b0;
                delay_thread[float_tid] = 1'b1;
            end
            if(spc0_fsr_cntl)begin
                for(i = 0; i < 4; i = i+1)if(fsr_cntl[i])begin
                        delay_thread[i] = 1'b1;
                        is_load[i]      = 1'b0;
                    end
                spc_fsr_cntl      = 1'b1;
            end
            if(tl_cntl[spc0_thread_pc] &
                    (spc0_inst_done|| spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                tl_cntl[spc0_thread_pc]      = 1'b0;
                spc_tl_cntl                  = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                tl_tid                       = spc0_thread_pc;
            end
            /* if(tl_cntl[tl_tid] &
            spc0_tl_cntl &
            (tl_early[tl_tid] == 0))begin
            is_load[tl_tid]      = 1'b0;
            tl_cntl[tl_tid]      = 1'b0;
            spc_tl_cntl          = 1'b1;
            delay_thread[tl_tid] = 1'b1;
            end*/
            if(gl_cntl[spc0_thread_pc] &
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                gl_cntl[spc0_thread_pc]      = 1'b0;
                spc_gl_cntl                  = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                gl_tid                       = spc0_thread_pc;
            end
            if(gl_cntl[gl_tid] &
                    spc0_gl_cntl    &
                    (gl_early[gl_tid] == 0))begin
                is_load[gl_tid]      = 1'b0;
                gl_cntl[gl_tid]      = 1'b0;
                spc_gl_cntl          = 1'b1;
                delay_thread[gl_tid] = 1'b1;
            end
            if(pstate_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                pstate_cntl[spc0_thread_pc]  = 1'b0;
                spc_pstate_cntl              = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                pstate_tid                   = spc0_thread_pc;

            end
            if(pstate_cntl[pstate_tid] &&
                    spc0_pstate_cntl        &&
                    (pstate_early[pstate_tid] == 0))begin
                is_load[pstate_tid]      = 1'b0;
                pstate_cntl[pstate_tid]  = 1'b0;
                spc_pstate_cntl          = 1'b1;
                delay_thread[pstate_tid] = 1'b1;
            end

            if(hpstate_cntl[spc0_thread_pc] &
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                hpstate_cntl[spc0_thread_pc] = 1'b0;
                spc_hpstate_cntl             = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                hpstate_tid                  = spc0_thread_pc;
            end
            if(hpstate_cntl[hpstate_tid] &
                    spc0_hpstate_cntl &
                    (hpstate_early[hpstate_tid] == 0))begin
                is_load[hpstate_tid]      = 1'b0;
                hpstate_cntl[hpstate_tid] = 1'b0;
                spc_hpstate_cntl          = 1'b1;
                delay_thread[hpstate_tid] = 1'b1;
            end

            if(cwp_cntl)begin
                for(i = 0; i < 4; i = i+1)if(cwp_cntl[i])begin
                        delay_thread[i] = 1'b1;
                        is_load[i]      = 1'b0;
                    end
                spc_cwp_cntl      = 1'b1;
            end
            if(trap_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                trap_cntl[spc0_thread_pc]    = 1'b0;
                spc_trap_cntl                = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
            end

            //hypervisor
            if(htba_cntl[spc0_thread_pc_del])begin
                is_load[spc0_thread_pc_del]      = 1'b0;
                htba_cntl[spc0_thread_pc_del]    = 1'b0;
                spc_htba_cntl                    = 1'b1;
                delay_thread[spc0_thread_pc_del] = 1'b1;
            end
            if(htick_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                htick_cntl[spc0_thread_pc]   = 1'b0;
                spc_htick_cntl               = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                htick_tid                    = spc0_thread_pc;

            end
            if(stickcmp_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                stickcmp_cntl[spc0_thread_pc]= 1'b0;
                spc_stickcmp_cntl            = 1'b1;
                delay_thread[spc0_thread_pc] = 1'b1;
                stickcmp_tid                 = spc0_thread_pc;
            end

            //new register
            dsfsr_tid_vld = 0;
            isfsr_tid_vld = 0;
            sfar_tid_vld  = 0;

            if(dsfsr_cntl[spc0_thread_pc]  &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc] ) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                dsfsr_cntl[spc0_thread_pc]   = 1'b0;
                spc_dsfsr_cntl               = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                dsfsr_thrid[0]               = spc0_thread_pc;
                dsfsr_tid_vld[0]             = 1;
            end
            if(ecl_irf_wen_w                 &&
                    dsfsr_cntl[ecl_irf_tid_w]     &&
                    is_load[ecl_irf_tid_w])begin
                is_load[ecl_irf_tid_w]      = 1'b0;
                dsfsr_cntl[ecl_irf_tid_w]   = 1'b0;
                spc_dsfsr_cntl              = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w] = 1'b1;
                dsfsr_thrid[1]              = ecl_irf_tid_w;
                dsfsr_tid_vld[1]            = 1;
            end
            if(ecl_irf_wen_w2                &&
                    dsfsr_cntl[ecl_irf_tid_w2]    &&
                    is_load[ecl_irf_tid_w2])begin
                is_load[ecl_irf_tid_w2]      = 1'b0;
                dsfsr_cntl[ecl_irf_tid_w2]   = 1'b0;
                spc_dsfsr_cntl               = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w2] = 1'b1;
                dsfsr_thrid[2]               = ecl_irf_tid_w2;
                dsfsr_tid_vld[2]             = 1;
            end // if (ecl_irf_wen_w2 &&...

            if(isfsr_cntl[spc0_thread_pc] &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]   ) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                isfsr_cntl[spc0_thread_pc]   = 1'b0;
                spc_isfsr_cntl               = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                isfsr_thrid[0]              = spc0_thread_pc;
                isfsr_tid_vld[0]            = 1;
            end // if (isfsr_cntl[spc0_thread_pc] &&...
            if(ecl_irf_wen_w                 &&
                    isfsr_cntl[ecl_irf_tid_w]     &&
                    is_load[ecl_irf_tid_w])begin
                is_load[ecl_irf_tid_w]      = 1'b0;
                isfsr_cntl[ecl_irf_tid_w]   = 1'b0;
                spc_isfsr_cntl              = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w] = 1'b1;
                isfsr_thrid[1]              = ecl_irf_tid_w;
                isfsr_tid_vld[1]            = 1;
            end
            if(ecl_irf_wen_w2                &&
                    isfsr_cntl[ecl_irf_tid_w2]    &&
                    is_load[ecl_irf_tid_w2])begin
                is_load[ecl_irf_tid_w2]      = 1'b0;
                isfsr_cntl[ecl_irf_tid_w2]   = 1'b0;
                spc_isfsr_cntl               = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w2] = 1'b1;
                isfsr_thrid[2]               = ecl_irf_tid_w2;
                isfsr_tid_vld[2]             = 1;
            end // if (ecl_irf_wen_w2 &&...

            if(sfar_cntl[spc0_thread_pc] &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                sfar_cntl[spc0_thread_pc]    = 1'b0;
                spc_sfar_cntl                = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                sfar_thrid[0]                = spc0_thread_pc;
                sfar_tid_vld[0]              = 1;
            end // if (sfar_cntl[spc0_thread_pc] &&...
            if(ecl_irf_wen_w                 &&
                    sfar_cntl[ecl_irf_tid_w]       &&
                    is_load[ecl_irf_tid_w])begin
                is_load[ecl_irf_tid_w]       = 1'b0;
                sfar_cntl[ecl_irf_tid_w]     = 1'b0;
                spc_sfar_cntl                = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w]  = 1'b1;
                sfar_thrid[1]                = ecl_irf_tid_w;
                sfar_tid_vld[1]              = 1;
            end
            if(ecl_irf_wen_w2               &&
                    sfar_cntl[ecl_irf_tid_w2]    &&
                    is_load[ecl_irf_tid_w2])begin
                is_load[ecl_irf_tid_w2]      = 1'b0;
                sfar_cntl[ecl_irf_tid_w2]    = 1'b0;
                spc_sfar_cntl                = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[ecl_irf_tid_w2] = 1'b1;
                sfar_thrid[2]                = ecl_irf_tid_w2;
                sfar_tid_vld[2]              = 1;
            end // if (ecl_irf_wen_w2 &&...
            //new mmu register
            if(pctxt_cntl[spc0_thread_pc] &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                pctxt_cntl[spc0_thread_pc]   = 1'b0;
                spc_pctxt_cntl               = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                pctxt_tid                    = spc0_thread_pc;
            end
            if(sctxt_cntl[spc0_thread_pc] &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                sctxt_cntl[spc0_thread_pc]   = 1'b0;
                spc_sctxt_cntl               = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                sctxt_tid                    = spc0_thread_pc;
            end
            if(pid_cntl[spc0_thread_pc] &&
                    (!is_load_m[spc0_thread_pc] ||
                     fsr_cntl[spc0_thread_pc]) &&
                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                pid_cntl[spc0_thread_pc]     = 1'b0;
                spc_pid_cntl                 = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                pid_tid                      = spc0_thread_pc;
            end
            if(wtchpt_cntl[spc0_thread_pc] &&
                    //(//!is_load_m[spc0_thread_pc] ||
                    //fsr_cntl[spc0_thread_pc]) &&

                    (spc0_inst_done || spc0_flush_happen))begin
                is_load[spc0_thread_pc]      = 1'b0;
                wtchpt_cntl[spc0_thread_pc]  = 1'b0;
                spc_wtchpt_cntl              = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc] = 1'b1;
                wtchpt_tid                   = spc0_thread_pc;
            end
            //mra register
            if(itag_access_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                itag_access_cntl[spc0_thread_pc] = 1'b0;
                spc_itag_access_cntl             = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[spc0_thread_pc]     = 1'b1;
                itag_tid                         = spc0_thread_pc;
            end
            /*if(ecl_irf_wen_w                   &&
            itag_access_cntl[ecl_irf_tid_w]  &&
            is_load[ecl_irf_tid_w])begin
            is_load[ecl_irf_tid_w]          = 1'b0;
            itag_access_cntl[ecl_irf_tid_w] = 1'b0;
            spc_itag_access_cntl            = ~no_mmu_reg_cmp;//turn off
            delay_thread[ecl_irf_tid_w]     = 1'b1;
            //itag_tid [1]                = ecl_irf_tid_w;
            end
            if(ecl_irf_wen_w2                   &&
            itag_access_cntl[ecl_irf_tid_w2] &&
            is_load[ecl_irf_tid_w2])begin
            is_load[ecl_irf_tid_w2]         = 1'b0;
            itag_access_cntl[ecl_irf_tid_w] = 1'b0;
            spc_itag_access_cntl            = ~no_mmu_reg_cmp;//turn off
            delay_thread[ecl_irf_tid_w2]    = 1'b1;
            //itag_tid [1]                = ecl_irf_tid_w;
            end // if (ecl_irf_wen_w2 &&...*/
            if(dtag_access_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dtag_access_cntl[spc0_thread_pc]      = 1'b0;
                spc_dtag_access_cntl                  = ~no_mmu_reg_cmp && ~mmu_fiveregs_off;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dtag_tid                              = spc0_thread_pc;
            end
            if(ictxt_nztxt_ps0_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_nztxt_ps0_cntl[spc0_thread_pc]  = 1'b0;
                spc_inztxt_ps0_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                inztxt_ps0_tid                        = spc0_thread_pc;
            end
            if(dctxt_nztxt_ps0_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_nztxt_ps0_cntl[spc0_thread_pc]  = 1'b0;
                spc_dnztxt_ps0_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dnztxt_ps0_tid                         = spc0_thread_pc;
            end

            if(ictxt_nztxt_ps1_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_nztxt_ps1_cntl[spc0_thread_pc]  = 1'b0;
                spc_inztxt_ps1_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                inztxt_ps1_tid                        = spc0_thread_pc;
            end
            if(dctxt_nztxt_ps1_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_nztxt_ps1_cntl[spc0_thread_pc]  = 1'b0;
                spc_dnztxt_ps1_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dnztxt_ps1_tid                        = spc0_thread_pc;
            end
            if(ictxt_ztxt_ps0_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_ztxt_ps0_cntl[spc0_thread_pc]   = 1'b0;
                spc_iztxt_ps0_cntl                    = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                iztxt_ps0_tid =  spc0_thread_pc;
            end
            if(dctxt_ztxt_ps0_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_ztxt_ps0_cntl[spc0_thread_pc]   = 1'b0;
                spc_dztxt_ps0_cntl                    = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dztxt_ps0_tid                         = spc0_thread_pc;
            end
            if(ictxt_ztxt_ps1_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_ztxt_ps1_cntl[spc0_thread_pc]   = 1'b0;
                spc_iztxt_ps1_cntl                    = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                iztxt_ps1_tid                         = spc0_thread_pc;
            end
            if(dctxt_ztxt_ps1_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_ztxt_ps1_cntl[spc0_thread_pc]  = 1'b0;
                spc_dztxt_ps1_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]         = 1'b1;
                dztxt_ps1_tid                        = spc0_thread_pc;
            end
            if(dctxt_nzcfg_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_nzcfg_cntl[spc0_thread_pc]      = 1'b0;
                spc_dctxt_nzcfg_cntl                  = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dnzcfg_tid                            = spc0_thread_pc;
            end
            if(ictxt_nzcfg_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_nzcfg_cntl[spc0_thread_pc]      = 1'b0;
                spc_ictxt_nzcfg_cntl                  = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                inzcfg_tid                            = spc0_thread_pc;
            end
            if(dctxt_zcfg_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                dctxt_zcfg_cntl[spc0_thread_pc]       = 1'b0;
                spc_dctxt_zcfg_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                dzcfg_tid                             = spc0_thread_pc;
            end
            if(ictxt_zcfg_cntl[spc0_thread_pc] &&
                    (spc0_inst_done || spc0_flush_happen))begin
                ictxt_zcfg_cntl[spc0_thread_pc]       = 1'b0;
                spc_ictxt_zcfg_cntl                   = ~no_mmu_reg_cmp;//turn off
                delay_thread[spc0_thread_pc]          = 1'b1;
                izcfg_tid                             = spc0_thread_pc;
            end


        end // if (spc0_inst_done || ecl_irf_wen_w     || ecl_irf_wen_w2 ||...
    end
endtask

task who_active;
    input [2:0] spc;

    begin
        get_delay_control;
        //create trap signals
        spc0_tpc0_cntl    = 0;spc0_tpc1_cntl    = 0; spc0_tpc2_cntl     = 0; spc0_tpc3_cntl    = 0;spc0_tpc4_cntl    = 0;
        spc0_tnpc0_cntl   = 0;spc0_tnpc1_cntl   = 0; spc0_tnpc2_cntl    = 0; spc0_tnpc3_cntl   = 0;spc0_tnpc4_cntl   = 0;
        spc0_tstate0_cntl = 0;spc0_tstate1_cntl = 0; spc0_tstate2_cntl  = 0; spc0_tstate3_cntl = 0;spc0_tstate4_cntl = 0;
        spc0_ttype0_cntl  = 0;spc0_ttype1_cntl  = 0; spc0_ttype2_cntl   = 0; spc0_ttype3_cntl  = 0;spc0_ttype4_cntl  = 0;
        spc0_tpc5_cntl    = 0;spc0_tnpc5_cntl   = 0; spc0_tstate5_cntl  = 0; spc0_ttype5_cntl  = 0;
        spc0_hstate5_cntl = 0;spc0_hstate4_cntl = 0; spc0_hstate3_cntl  = 0; spc0_hstate2_cntl = 0;
        spc0_hstate1_cntl = 0;spc0_hstate0_cntl = 0;

        if(spc_trap_cntl)begin
            case(trap_val[spc0_thread_pc] - 1)
                0 : begin
                    spc0_tpc0_cntl    = tpc_cntl[spc0_thread_pc];
                    spc0_tnpc0_cntl   = tnpc_cntl[spc0_thread_pc];
                    spc0_tstate0_cntl = tstate_cntl[spc0_thread_pc];
                    spc0_ttype0_cntl  = ttype_cntl[spc0_thread_pc];
                    spc0_hstate0_cntl = htstate_cntl[spc0_thread_pc];
                end
                1 : begin
                    spc0_tpc1_cntl    = tpc_cntl[spc0_thread_pc];
                    spc0_tnpc1_cntl   = tnpc_cntl[spc0_thread_pc];
                    spc0_tstate1_cntl = tstate_cntl[spc0_thread_pc];
                    spc0_ttype1_cntl  = ttype_cntl[spc0_thread_pc];
                    spc0_hstate1_cntl = htstate_cntl[spc0_thread_pc];
                end
                2 : begin
                    spc0_tpc2_cntl    = tpc_cntl[spc0_thread_pc];
                    spc0_tnpc2_cntl   = tnpc_cntl[spc0_thread_pc];
                    spc0_tstate2_cntl = tstate_cntl[spc0_thread_pc];
                    spc0_ttype2_cntl  = ttype_cntl[spc0_thread_pc];
                    spc0_hstate2_cntl = htstate_cntl[spc0_thread_pc];
                end
                3 : begin
                    spc0_tpc3_cntl    = tpc_cntl[spc0_thread_pc];
                    spc0_tnpc3_cntl   = tnpc_cntl[spc0_thread_pc];
                    spc0_tstate3_cntl = tstate_cntl[spc0_thread_pc];
                    spc0_ttype3_cntl  = ttype_cntl[spc0_thread_pc];
                    spc0_hstate3_cntl = htstate_cntl[spc0_thread_pc];
                end
                4 : begin
                    spc0_tpc4_cntl    = tpc_cntl[spc0_thread_pc];
                    spc0_tnpc4_cntl   = tnpc_cntl[spc0_thread_pc];
                    spc0_tstate4_cntl = tstate_cntl[spc0_thread_pc];
                    spc0_ttype4_cntl  = ttype_cntl[spc0_thread_pc];
                    spc0_hstate4_cntl = htstate_cntl[spc0_thread_pc];
                end
                5 : begin
                    if(pwr_tpc[spc0_thread_pc])spc0_tpc5_cntl       = tpc_cntl[spc0_thread_pc];
                    else if(tpc_cntl[spc0_thread_pc])pwr_tpc[spc0_thread_pc] = 1;
                    if(pwr_tnpc[spc0_thread_pc])spc0_tnpc5_cntl     = tnpc_cntl[spc0_thread_pc];
                    else if(tnpc_cntl[spc0_thread_pc])pwr_tnpc[spc0_thread_pc] = 1;
                    if(pwr_tstate[spc0_thread_pc])spc0_tstate5_cntl = tstate_cntl[spc0_thread_pc];
                    else if(tstate_cntl[spc0_thread_pc])pwr_tstate[spc0_thread_pc] = 1;
                    spc0_ttype5_cntl  = ttype_cntl[spc0_thread_pc];
                    if(pwr_hstate[spc0_thread_pc])spc0_hstate5_cntl = htstate_cntl[spc0_thread_pc];
                    else if(htstate_cntl[spc0_thread_pc])pwr_hstate[spc0_thread_pc] = 1;
                end
                default : begin
                    $display("%0t:Error wrong trap level(%x) thread_id(%x)\n", $time,
                             trap_val[spc0_thread_pc], spc0_thread_pc);
                    `MONITOR_PATH.fail("Wrong trap Level");
                    $finish;
                end

            endcase
            tpc_cntl[spc0_thread_pc]     = 1'b0;
            tnpc_cntl[spc0_thread_pc]    = 1'b0;
            tstate_cntl[spc0_thread_pc]  = 1'b0;
            htstate_cntl[spc0_thread_pc] = 1'b0;
            ttype_cntl[spc0_thread_pc]   = 1'b0;
        end // if (spc_trap_cntl)

        spc0_mon_sign[`MONITOR_SIGNAL-1:32]   =
                     {spc_float_cntl,     spc0_rtl_wr_en,   spc_pid_cntl,
                      spc_wtchpt_cntl,    7'b0,
                      spc_dctxt_nzcfg_cntl, spc_ictxt_nzcfg_cntl, spc_dnztxt_ps1_cntl, spc_inztxt_ps1_cntl,
                      spc_dnztxt_ps0_cntl,  spc_inztxt_ps0_cntl,  spc_dctxt_zcfg_cntl, spc_ictxt_zcfg_cntl,
                      spc_dztxt_ps1_cntl,   spc_iztxt_ps1_cntl,   spc_dztxt_ps0_cntl,  spc_iztxt_ps0_cntl,
                      1'b0,                 spc_sctxt_cntl,       spc_pctxt_cntl,      spc_dtag_access_cntl,
                      spc_itag_access_cntl, spc_sfar_cntl,
                      spc_dsfsr_cntl,     spc_isfsr_cntl, 1'b0,
                      spc_htick_cntl,     spc_hintp_cntl,     spc_htba_cntl,      4'b0, spc0_hstate5_cntl,
                      spc0_hstate4_cntl,  spc0_hstate3_cntl,  spc0_hstate2_cntl,  spc0_hstate1_cntl,
                      spc0_hstate0_cntl,  spc_hpstate_cntl,   spc_gl_cntl, 11'h0, spc_sft_cntl,
                      spc0_cleanwin_cntl, spc0_wstate_cntl,   spc0_otherwin_cntl, spc0_canrestore_cntl,
                      spc0_cansave_cntl,  spc_cwp_cntl,       1'b0,                spc_tba_cntl,
                      4'b0, spc0_ttype5_cntl,
                      spc0_ttype4_cntl,   spc0_ttype3_cntl,  spc0_ttype2_cntl,  spc0_ttype1_cntl,
                      spc0_ttype0_cntl,
                      4'b0, spc0_tstate5_cntl,
                      spc0_tstate4_cntl,  spc0_tstate3_cntl, spc0_tstate2_cntl, spc0_tstate1_cntl,
                      spc0_tstate0_cntl,
                      4'b0, spc0_tnpc5_cntl,
                      spc0_tnpc4_cntl,    spc0_tnpc3_cntl,   spc0_tnpc2_cntl,   spc0_tnpc1_cntl,
                      spc0_tnpc0_cntl,
                      4'b0, spc0_tpc5_cntl,
                      spc0_tpc4_cntl,     spc0_tpc3_cntl,    spc0_tpc2_cntl,    spc0_tpc1_cntl,
                      spc0_tpc0_cntl,
                      spc_pil_cntl,       spc_tl_cntl,
                      spc_pstate_cntl,    spc_stickcmp_cntl, 1'b0, spc_tcmp_cntl, spc_gsr_cntl,
                      spc_tick_cntl,      spc_asi_cntl, spc_fsr_cntl, spc_fprs_cntl,
                      spc_ccr_cntl,       spc_y_cntl,   2'b0};
    end
endtask
//signals for tlb
reg [3:0] iwait_tlb,  dwait_tlb;
reg [3:0] iswait_tlb, dswait_tlb;
reg [2:0] dtlb_stage[3:0], itlb_stage[3:0];

initial begin
    iwait_tlb = 0;
    dwait_tlb = 0;
    for(i = 0; i < 4;i = i + 1)begin
        dtlb_stage[i] = 0;
        itlb_stage[i] = 0;
        iswait_tlb[i] = 0;
        dswait_tlb[i] = 0;
    end
end

// gen control signals.
task  get_step_vector;
    integer i;

    begin
        on_spc             = 0;
        who_active(cpu_id);
        tlu_done           = 0;
        //tlb wait stage here
        for(i = 0; i < 4; i = i + 1)begin
            if((iwait_tlb[i] == 1'b1) && (tlu_idtlb_dmp_thrid_g == i))begin
                case(itlb_stage[i])
                    0 : if(tlu_itlb_dmp_vld_g)itlb_stage[i] = iswait_tlb[i] ? 1 : 3;
                    1 : if(ifu_tlu_itlb_done)itlb_stage[i]  = 2;
                    2 : if(tlu_itlb_wr_vld_g)itlb_stage[i]  = 3;
                    3 : if(ifu_tlu_itlb_done)begin
                            itlb_stage[i] = 1'b0;
                            iswait_tlb[i] = 1'b0;
                            iwait_tlb[i]  = 1'b0;
                            is_load[i]    = 1'b0;
                            tlu_done      = 1'b1;
                            tlu_tid       = i;
                            delay_thread[i] = 1'b1;
                        end
                endcase
            end // if ((iwait_tlb[i] == 1'b1) && (tlu_idtlb_dmp_thrid_g == i))
        end // for (i = 0; i < 4; i = i + 1)
        for(i = 0; i < 4; i = i + 1)begin
            if((dwait_tlb[i] == 1'b1) && (tlu_idtlb_dmp_thrid_g == i))begin
                case(dtlb_stage[i])
                    0 : if(tlu_dtlb_dmp_vld_g)dtlb_stage[i] = dswait_tlb[i] ? 1 : 3;
                    1 : if(lsu_tlu_dtlb_done)dtlb_stage[i]  = 2;
                    2 : if(tlu_dtlb_wr_vld_g)dtlb_stage[i]  = 3;
                    3 : if(lsu_tlu_dtlb_done)begin
                            dtlb_stage[i]   = 1'b0;
                            dswait_tlb[i]   = 1'b0;
                            dwait_tlb[i]    = 1'b0;
                            is_load[i]      = 1'b0;
                            tlu_done        = 1'b1;
                            tlu_tid         = i;
                            delay_thread[i] = 1'b1;
                        end
                endcase
            end // if ((iwait_tlb[i] == 1'b1) && (tlu_idtlb_dmp_thrid_g == i))
        end // for (i = 0; i < 4; i = i + 1)
        is_tlb = 0;
        if(ifu_lsu_imm_asi_vld_w &&
                ifu_lsu_st_inst_w     &&
                spc0_inst_done)begin
            case(ifu_lsu_imm_asi_w[7:0])
                8'h54, 8'h55 : begin
                    iwait_tlb[spc0_thread_pc]  = 1'b1;
                    iswait_tlb[spc0_thread_pc] = 1'b1;
                    //is_tlb                     = 1'b1;
                    itlb_stage[spc0_thread_pc] = 1'b0;
                end
                8'h5c, 8'h5d : begin
                    dwait_tlb[spc0_thread_pc]  = 1'b1;
                    dswait_tlb[spc0_thread_pc] = 1'b1;
                    //is_tlb                     = 1'b1;
                    dtlb_stage[spc0_thread_pc] = 1'b0;
                end
                8'h57 : begin
                    iwait_tlb[spc0_thread_pc]  = 1'b1;
                    iswait_tlb[spc0_thread_pc] = 1'b0;
                    itlb_stage[spc0_thread_pc] = 1'b0;
                    //is_tlb = 1'b1;
                end
                8'h5f : begin
                    dwait_tlb[spc0_thread_pc]    = 1'b1;
                    dswait_tlb[spc0_thread_pc]   = 1'b0;
                    dtlb_stage[spc0_thread_pc]   = 1'b0;
                    //is_tlb                       = 1'b1;
                end
                default : begin
                    is_tlb                     = 1'b0;
                end
            endcase // case(ifu_lsu_imm_asi_w)
        end // if (ifu_lsu_imm_asi_vld_w && ifu_lsu_st_inst_w && spc0_inst_done)
        thread_status        = 0;
        spc0_mon_sign[33:32] = 2'b0;
        on_spc[1]            = spc0_inst_done;
        on_spc[0]            = |spc0_mon_sign[`FLOAT_X:32];

        qualifier          = 3'b111;
        if(spc0_inst_done)begin
            thread_status[spc0_thread_pc] = 1'b1;
        end
        if(spc_float_cntl)thread_status[float_tid]      = 1'b1;
        if(tlu_done && delay_done[tlu_tid])thread_status[tlu_tid] = 1'b1;
        for(i = 0; i < 4; i = i +1)if(delay_done[i] && fsr_cntl[i])thread_status[i] = 1'b1;
        is_trap = 0;
        is_hit  = 0;
        if(ifu_tlu_hwint_m ||
                ifu_tlu_swint_m ||//bug5449
                //need steping before hard and sof int
                tlu_ifu_flush_pipe_w && !ifu_tlu_flush_w)begin
            if(is_load_m[spc0_thread_pc] &&
                    tlu_ifu_flush_pipe_w      &&
                    !spc0_inst_done           &&
                    !lsu_tlu_defr_trp_taken_g &&
                    !(lsu_tlu_ttype_vld_m2 && (
                          lsu_tlu_ttype_m2 == 9'h34 ||
                          lsu_tlu_ttype_m2 == 9'h30)) &&
                    !(ifu_tlu_ttype_vld_w && (ifu_tlu_ttype_w == 9'h0a && !lsu_tlu_defr_trp_taken_g && !ifu_tlu_flush_w||
                                              ifu_tlu_ttype_w == 9'h78 ||
                                              ifu_tlu_ttype_w == 9'h63 )))begin

                thread_status[spc0_thread_pc] = 1'b1;
                is_trap[spc0_thread_pc]       = 1'b1;
                delay_thread[spc0_thread_pc]  = 1'b1;
            end
            if(is_load_m[tlu_tid_m] && ifu_tlu_hwint_m )begin
                thread_status[tlu_tid_m] = 1'b1;
                is_hit[tlu_tid_m] = 1'b1;
            end
        end
        if(ecl_irf_wen_w &&
                !icc_wr[spc0_thread_w] &&
                (!quad_load[spc0_thread_w] || quad_cnt[spc0_thread_w] == 2)  //||
                //ecl_irf_wen_w                         && //error corection happen
                //icc_wr[spc0_thread_w]//                 &&
                //(irs1_ws[spc0_thread_w] != thr_rd_w)  &&
                //(irs2_ws[spc0_thread_w] != thr_rd_w)
          )begin
            is_load[spc0_thread_w]        = 1'b0;
            thread_status[spc0_thread_w]  = 1'b1;
            if(spc0_inst_done && (spc0_thread_pc == spc0_thread_w))qualifier = spc0_thread_pc;
        end

        if(ecl_irf_wen_w2          &&
                !icc_wr[spc0_thread_w2] &&
                (!quad_load[spc0_thread_w2] || quad_cnt[spc0_thread_w2] == 2)//||
                //ecl_irf_wen_w2                         && //error corection happen
                //icc_wr[spc0_thread_w2]//                 &&
                // (irs1_ws[spc0_thread_w2] != thr_rd_w2) &&
                //(irs2_ws[spc0_thread_w2] != thr_rd_w2)
          )begin
            is_load[spc0_thread_w2]       = 1'b0;
            thread_status[spc0_thread_w2] = 1'b1;
            if(spc0_inst_done && (spc0_thread_pc == spc0_thread_w2))qualifier = spc0_thread_pc;
        end
        if(|on_spc)begin
            if(spc0_inst_done)qualifier = spc0_thread_pc;
        end // if (|on_spc)

        //-----------------------------------------------------
        //Here, we will add the signals to be delayed.
        if(spc0_inst_done)begin
            pure_load[spc0_thread_pc] = 0;
            if(is_load_m[spc0_thread_pc] == 0)begin
                is_load[spc0_thread_pc]   = 1'b0;
            end
            else begin
                if(!fsr_cntl[spc0_thread_pc] && !tlu_ifu_flush_pipe_w          ||
                        load_for_tlb_m[spc0_thread_pc] && tlb_lock_s[spc0_thread_pc]||
                        spu_ldxa_w[spc0_thread_pc] && dmmu_sfsr_wr_en_l[spc0_thread_pc])begin
                    is_load[spc0_thread_pc]     = 1'b1;//added spu ldxa asi
                    is_spu_load[spc0_thread_pc] = 1'b1;
                end
                if(spu_ldxa_w[spc0_thread_pc] && dmmu_sfsr_wr_en_l[spc0_thread_pc])spu_illgl[spc0_thread_pc] = 1;
                pure_load[spc0_thread_pc] = 1;
            end
            //we want to delay the stepping for muls instrcutions.
            //if(muls[spc0_thread_pc])is_load[spc0_thread_pc] = 1'b1;
        end
        if((!spc0_trap_write) && is_tlb || (spc0_trap_tid != spc0_thread_pc) && is_tlb)begin
            if(!tlu_ifu_flush_pipe_w)is_load[spc0_thread_pc] = 1'b1;
        end
        //delay wr thread register
        if(spc0_inst_done && wrt_spec_w)begin
            is_load[spc0_thread_pc]     = 1'b1;
            spec_load[spc0_thread_pc]   = 1'b1;
            wrt_counter[spc0_thread_pc] = 4;
        end
        else if(spc0_inst_done && wrt_spec_w == 0)spec_load[spc0_thread_pc] = 1'b0;
    end
endtask // get_step_vector
//make ste
task make_step_vector;
    input [1:0] thread;

    begin
        th_vec[cpu_id]  = thread;
        thvec           = {5'b00000,  th_vec[7], th_vec[6], th_vec[5], th_vec[4],
                           th_vec[3], th_vec[2], th_vec[1], th_vec[0], cpu_num};
    end
endtask // make_step_vector
// prcocess each thread.
task sparc;
    input [`MONITOR_SIGNAL - 1 : 0] mon_signal;
    input [9:0]  spc;
    reg   [7:0]  i, j;
    begin

        // $display("ttt: sparc1");
        if(|mon_signal)begin
            if(|mon_signal[52:34])for(i = 34; i <= 52 ;i = i + 1)begin
                    if(mon_signal[i])begin
                        if(i == `FSR)begin
                            for(j = 0; j < 4;j = j+ 1)begin
                                if(fsr_cntl[j])begin
                                    fsr_tid = j;
                                    process_signal(i, spc, 0);
                                end
                            end
                        end
                        else begin
                            process_signal(i, spc, 0);
                        end
                    end
                end
            if(|mon_signal[82:57])for(i = 57; i <= 82 ;i = i + 1)if(mon_signal[i])process_signal(i, spc, 0);
            if(|mon_signal[105:87])for(i = 87; i <= 105 ;i = i + 1)begin
                    if(mon_signal[i])begin
                        if(i == `CWP)begin
                            for(j = 0; j < 4;j = j+ 1)begin
                                if(cwp_cntl[j])begin
                                    cwp_tid = j;
                                    process_signal(i, spc, 0);
                                end // if (ccr_tid[j])
                            end
                        end // if (i == `CWP)
                        else process_signal(i, spc, 0);
                    end
                end
            if(|mon_signal[`MONITOR_SIGNAL - 1:106])begin
                for(i = 106; i < `MONITOR_SIGNAL;i = i + 1)
                    if(mon_signal[i])begin
                        if(i == `HINTP_SAS)begin
                            for(j = 0; j < 3; j = j + 1)begin
                                if(hintp_tid_vld[j])begin
                                    hintp_tid        = hintp_thrid[j];
                                    process_signal(i, spc, hintp_tid);
                                end
                            end
                        end
                        else if(i == `DSFSR)begin
                            for(j = 0; j < 3; j = j + 1)begin
                                if(dsfsr_tid_vld[j])begin
                                    dsfsr_tid = dsfsr_thrid[j];
                                    process_signal(i, spc, 0);
                                end
                            end
                        end
                        else if(i == `ISFSR)begin
                            for(j = 0; j < 3; j = j + 1)begin
                                if(isfsr_tid_vld[j])begin
                                    isfsr_tid = isfsr_thrid[j];
                                    process_signal(i, spc, 0);
                                end
                            end
                        end
                        else if(i == `SFAR)begin
                            for(j = 0; j < 3; j = j + 1)begin
                                if(sfar_tid_vld[j])begin
                                    sfar_tid = sfar_thrid[j];
                                    process_signal(i, spc, 0);
                                end
                            end
                        end
                        else process_signal(i, spc, 0);
                    end // if (mon_signal[i])
            end // if (|mon_signal[`MONITOR_SIGNAL - 1:87])
        end // if (|mon_signal)
    end
endtask // sparc
wire spu_ldxa;
wire spu_stxa;

task spu_check_ldxa;
    begin
        if(illgl_va_vld_or_drop_ldxa2masync &&
                spu_illgl[thrid_w2] &&
                is_load[thrid_w2])begin
            is_load[thrid_w2]   = 0;
            spu_illgl[thrid_w2] = 0;
            spu_step[thrid_w2]  = 1;
        end

        if(spu_lsu_ldxa_illgl_va_w2 &&
                spu_lsu_ldxa_data_vld_w2)begin
            is_load[spu_lsu_ldxa_tid_w2] = 0;
            spu_illgl[spu_lsu_ldxa_tid_w2] = 0;
            spu_step[spu_lsu_ldxa_tid_w2] = 1;
        end
    end
endtask
//need to trace the spu registers.
reg [7:0] spu_ldxa_va [3:0];
reg [7:0] exu_lsu_ldst_va_m, exu_lsu_ldst_va_w;

assign spu_ldxa = ifu_lsu_ld_inst_e            &&
       lda_internal_e               &&
       (ifu_lsu_imm_asi_e == 8'h40 || asi_state_e == 8'h40);

// && (exu_lsu_ldst_va_e[7:0] == 8'ha0);
// &&
//	             ((exu_lsu_ldst_va_e[7:0] >= 8'h80) && (exu_lsu_ldst_va_e[7:0] <= 8'ha0));//ill va address

//delay by the next instruction.
assign spu_stxa =
       ifu_lsu_st_inst_e            &&
       sta_internal_e               &&
       (ifu_lsu_imm_asi_e == 8'h40 || asi_state_e == 8'h40);

reg 	  spu_lsu_ldxa_illgl_va_ww2,
       spu_lsu_ldxa_data_vld_ww2;
reg [1:0] spu_lsu_ldxa_tid_ww2;

//save
always @(posedge clk)begin
    if(spc0_inst_done)begin
        delay_pc[spc0_thread_pc]           <= spc0_rtl_pc;
        delay_npc[spc0_thread_pc]          <= spc0_rtl_npc;
        delay_inst[spc0_thread_pc]         <= dtu_inst_w;
        delay_inst_vld[spc0_thread_pc]     <= fcl_fdp_inst_sel_nop_w_l;
        delay_inst_retract[spc0_thread_pc] <= retract_iferr_w;
        delay_inst_vld_w[spc0_thread_pc]   <= inst_vld_w;
`ifndef VERILATOR
        delay_spu[spc0_thread_pc]          <= spu_ldxa_w[spc0_thread_pc];
`else // ifndef VERILATOR
        delay_spu[spc0_thread_pc]          <= 0;
`endif // ifndef VERILATOR
    end
    prev_pc[spc0_thread_pc]  <= spc0_rtl_pc;
    prev_npc[spc0_thread_pc] <= spc0_rtl_npc;
    //find ldxa for spu
    case(ifu_tlu_thrid_e)
        2'b00 : spu_ldxa_m <= {3'b0, spu_ldxa };
        2'b01 : spu_ldxa_m <= {2'b0, spu_ldxa, 1'b0};
        2'b10 : spu_ldxa_m <= {1'b0, spu_ldxa, 2'b0};
        2'b11 : spu_ldxa_m <= {spu_ldxa, 3'b0};
    endcase // case(ifu_tlu_thrid_e)
    //find ldxa for spu
    case(ifu_tlu_thrid_e)
        2'b00 : spu_stxa_m <= {3'b0, spu_stxa };
        2'b01 : spu_stxa_m <= {2'b0, spu_stxa, 1'b0};
        2'b10 : spu_stxa_m <= {1'b0, spu_stxa, 2'b0};
        2'b11 : spu_stxa_m <= {spu_stxa, 3'b0};
    endcase // case(ifu_tlu_thrid_e)

    if(spu_ldxa)spu_ldxa_va[ifu_tlu_thrid_e]<= exu_lsu_ldst_va_e;
    exu_lsu_ldst_va_m           <= exu_lsu_ldst_va_e;
    exu_lsu_ldst_va_w           <= exu_lsu_ldst_va_m;

    spu_ldxa_w                  <= spu_ldxa_m;
    spu_stxa_w                  <= spu_stxa_m;

    spu_lsu_ldxa_illgl_va_ww2   <= spu_lsu_ldxa_illgl_va_w2;
    spu_lsu_ldxa_data_vld_ww2   <= spu_lsu_ldxa_data_vld_w2;
    spu_lsu_ldxa_tid_ww2        <= spu_lsu_ldxa_tid_w2;

end // always @ (posedge clk)

reg 		  dup;
reg            dum;

function  send_mulx;
    input [5:0] prev;
    input [2:0] p_win;
    input [1:0] thrid;

    reg [5:0]  cur, addr;
    reg [2:0]  c_win;
    reg [63:0] t_val, val;

    begin
        send_mulx = 0;
        if(ecl_irf_wen_w)begin
            if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w])begin
                cur   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp_val[spc0_thread_w]) , thr_rd_w[3:0]};
                c_win = cwp_val[spc0_thread_w];
            end
            else begin
                cur   = {thr_rd_w[4]  ^ (thr_rd_w[3]  & cwp[spc0_thread_w]), thr_rd_w[3:0]};
                c_win = cwp[spc0_thread_w];
            end
            if(cur < 8)begin
                case(spc0_thread_w)
                    0 : c_win = gl0_en ? gl_lvl0_new : gl_lvl0;
                    1 : c_win = gl1_en ? gl_lvl1_new : gl_lvl1;
                    2 : c_win = gl2_en ? gl_lvl2_new : gl_lvl2;
                    3 : c_win = gl3_en ? gl_lvl3_new : gl_lvl3;
                endcase // case(spc0_thread_w)
            end
            send_mulx = (cur == prev) && (p_win == c_win) && (spc0_thread_w == thrid);
            val = spc0_rtl_reg_val_w;
            addr = thr_rd_w;
        end // if (ecl_irf_wen_w)
        if(ecl_irf_wen_w2 && (send_mulx == 0))begin
            if(spc0_cwp_cntl && cwp_cntl[spc0_thread_w2])begin
                cur  = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp_val[spc0_thread_w2]), thr_rd_w2[3:0]};
                c_win = cwp_val[spc0_thread_w2];
            end
            else begin
                cur  = {thr_rd_w2[4]  ^ (thr_rd_w2[3]  & cwp[spc0_thread_w2]), thr_rd_w2[3:0]};
                c_win = cwp[spc0_thread_w2];
            end
            if(cur < 8)begin
                case(spc0_thread_w2)
                    0 : c_win = gl0_en ? gl_lvl0_new : gl_lvl0;
                    1 : c_win = gl1_en ? gl_lvl1_new : gl_lvl1;
                    2 : c_win = gl2_en ? gl_lvl2_new : gl_lvl2;
                    3 : c_win = gl3_en ? gl_lvl3_new : gl_lvl3;
                endcase // case(spc0_thread_w2)
            end
            //send_mulx = cur ? cur : (cur == prev) && (p_win == c_win) && (spc0_thread_w2 == thrid);
            send_mulx = (cur == prev) && (p_win == c_win) && (spc0_thread_w2 == thrid);
            val = spc0_rtl_reg_val_w2;
            addr = thr_rd_w2;
        end // if (ecl_irf_wen_w2 && (send_mulx == 0))
        /*
        if(send_mulx && up_reset)begin
        t_val[63:32] = val[63:32];
        if(cur < 8) begin
        case(thrid)
        0 : begin
        t_val[31:0] = gl0_reg[{c_win, cur[2:0]}];
        gl0_reg[{c_win, cur[2:0]}] = t_val;
        end
        1 : begin
        t_val[31:0] = gl1_reg[{c_win, cur[2:0]}];
        gl1_reg[{c_win, cur[2:0]}] = t_val;
        end
        2 : begin
        t_val[31:0] = gl2_reg[{c_win, cur[2:0]}];
        gl2_reg[{c_win, cur[2:0]}] = t_val;
        end
        3 : begin
        t_val[31:0] = gl3_reg[{c_win, cur[2:0]}];
        gl3_reg[{c_win, cur[2:0]}] = t_val;
        end
        endcase // case(thrid)
        end // if (cur < 8)
        else begin
        t_val[31:0]                        = thr0_spc[{thrid, p_win, cur[4:0]}];
        thr0_spc[{thrid, p_win, cur[4:0]}] = t_val;
        $display("%d SENDM thread=%d win=%d reg=%d %x %x", $time, thrid, p_win, cur, val, t_val);
        end // else: !if(cur < 8)
        end // if (send_mulx)
        */
    end
endfunction // send_mulx

//--------------------------------------------
// There is a tlb read/write operaton. So,
// we need to wait for actual tlb operation.
//--------------------------------------------
reg lsu_tlu_tlb_st_inst_w, lsu_tlu_tlb_ld_inst_w;

//--------------------------------------------
// There are tlb read/write signals.
// tlb_wr_vld (write)
// tlb_demap (demap)
// tlb_rd_tag_vld | tlb_rd_data_vld (tag-rd,data-rd)
//--------------------------------------------
reg [1:0] tlb_thrid_delay;
reg 	     itlb_wr_vld_delay, dtlb_wr_vld_delay;

always @(posedge clk)begin
    itlb_wr_vld_delay <= itlb_wr_vld;
    dtlb_wr_vld_delay <= dtlb_wr_vld;
    tlb_thrid_delay   <= tlb_access_tid_g;
    lsu_tlu_tlb_st_inst_w <= lsu_tlu_tlb_st_inst_m;
    lsu_tlu_tlb_ld_inst_w <= lsu_tlu_tlb_ld_inst_m;
    spc0_force_flush_w2   <= spc0_force_flush_w;
end
//unlock mmu pending operation
reg tlb_unlock_m;

//delay tlb replayment operation.
task tlb_unlock_wr_operation;
    input [1:0] thrid;
    begin
        //itlb
        if(itlb_wr_vld_delay && tlb_lock[thrid] && (tlb_cmd[thrid] == 3))begin
            tlb_lock[thrid]      = 1'b0;
            unlock_thrid [thrid] = 1'b1;
        end
        //dtlb
        if(dtlb_wr_vld_delay && tlb_lock[thrid] && (tlb_cmd[thrid] == 4))begin
            tlb_lock[thrid]     = 1'b0;
            unlock_thrid[thrid] = 1'b1;
        end
    end
endtask // tlb_unlock_wr_operation

reg        tlb_id_vld;
reg [1:0]  tlb_thrid;
reg [63:0] tlb_rs3[3:0];
reg [63:0] ipc_m;
reg 	      cam_vld_m;

initial begin
    tlb_thrid = 0;
    tlb_id_vld= 0;
end

//check thread id for demap operations
wire   tlb_thrid_change;
assign tlb_thrid_change = tlb_thrid != tlb_access_tid_g;
always @(posedge clk)begin
    tlb_thrid <= tlb_access_tid_g;
    cam_vld_m <= cam_vld_f;
    ipc_m     <= pc_f;
end
task tlb_thrid_update;
    begin
        /* if(tlb_thrid_change         &&
        tlb_id_vld               &&
        (tlb_cmd[tlb_thrid] != 3) &&
        (tlb_cmd[tlb_thrid] != 4))begin
        if(tlb_lock[tlb_thrid])begin
        tlb_lock[tlb_thrid]     = 1'b0;
        unlock_thrid[tlb_thrid] = 1'b1;
        end
        end
        tlb_id_vld = 1;*/
        //anull the previous tlb operation
        if(fcl_dtu_inst_vld_e &&
                tlb_lock[ifu_tlu_thrid_e])begin
            tlb_lock[ifu_tlu_thrid_e]     = 1'b0;
            unlock_thrid[ifu_tlu_thrid_e] = 1'b1;
        end
    end
endtask // tlb_thrid_update

//send_tick register. we sample the m-cycle tick value.
reg [63:0] tick_delay[3:0];
reg [60:0] tick_del;
reg 	      tick_npt0_d, tick_npt1_d, tick_npt2_d, tick_npt3_d;

always @(posedge clk)begin
    tick_del    <= true_tick;
    tick_npt0_d <= tick_npt0;
    tick_npt1_d <= tick_npt1;
    tick_npt2_d <= tick_npt2;
    tick_npt3_d <= tick_npt3;
    case(thrid_m)
        2'b00 : tick_delay[0] <= {tick_npt0_d, tick_del, 2'b00};
        2'b01 : tick_delay[1] <= {tick_npt1_d, tick_del, 2'b00};
        2'b10 : tick_delay[2] <= {tick_npt2_d, tick_del, 2'b00};
        2'b11 : tick_delay[3] <= {tick_npt3_d, tick_del, 2'b00};
    endcase // case(thrid_m)
end
//------------------------------------------
// tlb error monitor.
// Here, check itlb and dtlb read operation  every cycle.
function calpar32;
    input [31:0] in;
    begin
        calpar32 = ^in;
    end
endfunction // calpar32
function calpar16;
    input [15:0] in;
    begin
        calpar16 = ^in;
    end
endfunction // calpar32
//tlb variable.

reg [1:0]  thread_tlb;
reg [58:0] tag_tlb;
integer    tlb_time;
reg [2:0]  t_ind;
reg [63:0] pc_trap, pc_traps;

reg [63:0] icam_hit_del;

reg [8:0]  itrap_type[3:0];
reg [8:0]  trap_type;

reg [5:0]  dtlb_idx[3:0], itlb_idx[3:0], dtlb_idx_pend[3:0], itlb_idx_pend[3:0];
reg [3:0]  dtlb_reset_vld, itlb_reset_vld;

reg [6:0]  rd_idx;
reg 	      ifu_lsu_ld_inst_m;
reg [3:0]  pending_dtlb;
reg [3:0]  pending_itlb;
reg [58:0] itlb_rd_tte_tag_del;
reg [42:0] itlb_rd_tte_data_del;
reg [3:0]  irf_err_vld;
reg [3:0]  idemap_is;
reg [3:0]  ddemap_is;
reg [63:0] target_pc;

reg 	      tlb_reset_on;
reg [3:0]  dtlb_parity_occur, throw_st;
reg 	      pmem_unc_error_w;
reg 	      dtlb_tte_vld_w2;
reg 	      ifu_lsu_pref_inst_m, ifu_lsu_pref_inst_w;

initial begin
    dtlb_pending_wait = 0;
    throw_pc_m        = 0;
    dtlb_reset_vld    = 0;
    itlb_reset_vld    = 0;
    pending_itlb      = 0;
    pending_dtlb      = 0;
    irf_err_vld       = 0;
    tlb_reset_on      = 1;
    dtlb_parity_occur = 0;
    throw_st     = 0;
    throw_not_st = 0;

    if($test$plusargs("tlb_invalid_off"))tlb_reset_on = 0;
end
//flop tlb signals
always @(posedge clk)begin
    icam_hit_del         <= icam_hit;
    ifu_lsu_ld_inst_m    <= ifu_lsu_ld_inst_e;
    itlb_rd_tte_tag_del  <= itlb_rd_tte_tag;
    itlb_rd_tte_data_del <= itlb_rd_tte_data;
    lsu_tlu_defr_trp_taken_w2 <= lsu_tlu_defr_trp_taken_g && !ifu_tlu_flush_w;
    pmem_unc_error_w     <= pmem_unc_error_g;
    dtlb_tte_vld_w2      <= dtlb_tte_vld_g;
    ifu_lsu_pref_inst_m  <= ifu_lsu_pref_inst_e;
    ifu_lsu_pref_inst_w  <= ifu_lsu_pref_inst_m;
end

//monitor itlb tag and data read operation to find the parity error
//
// don't include v(26) and u(24) bits in parity
//sparc_ifu_par32 tt_tag_par0(.in  ({itlb_rd_tte_tag[33:27],
//                                   itlb_rd_tte_tag[25],
//                                   itlb_rd_tte_tag[23:0]}),
//                                   .out (erd_erc_tlbt_pe_s1[0]));
//sparc_ifu_par32 tt_tag_par1(.in  ({7'b0, itlb_rd_tte_tag[58:34]}),
//                                   .out (erd_erc_tlbt_pe_s1[1]));
//sparc_ifu_par32 tt_data_par0(.in  (itlb_rd_tte_data[31:0]),
//                                                     .out (erd_erc_tlbd_pe_s1[0]));
//sparc_ifu_par16 tt_data_par1(.in  ({5'b0, itlb_rd_tte_data[42:32]}),
//                                                     .out (erd_erc_tlbd_pe_s1[1]));

//reset flag throw_pc for the next tlb operation.
reg [3:0]	  just_done, just_done_w;
initial just_done           = 0;

always @(posedge clk)just_done_w <= just_done;
task turn_off_throw;
    integer idx;
    reg [1:0] thrid;
    reg [47:0]  temp_pc;
    begin
        thrid = spc0_trap_write ? spc0_trap_tid : spc0_thread_pc;
        if((spc0_inst_done_trap  || tlu_ifu_flush_pipe_w || spc0_trap_write) &&
                throw_pc_w[thrid])begin
            if(spc0_trap_write || lsu_tlu_defr_trp_taken_w2)begin
                throw_pc_w[thrid] = 0;
            end
            else if(throw_pcv[thrid] ==  spc0_rtl_pc)throw_pc_w[thrid] = 0;
        end
        if(spc0_trap_write && store_delay_flush[thrid])store_delay_flush[thrid] = 0;
        if(throw_st)begin
            for(idx = 0;idx < 4; idx = idx + 1)begin
                if(throw_st[idx] && (thrid_e == idx))begin
                    throw_pcv[idx] = pc_e;
                    throw_st[idx]  = 0;
                end
            end
        end

        if(dtlb_pending_wait && spc0_trap_write)begin
            dtlb_pending_wait[thrid] = 0;
        end
    end
endtask // turn_off_throw
function [1:0] one_hot;
    input [3:0] hot;
    begin
        case(hot)
            4'b0001 : one_hot = 0;
            4'b0010 : one_hot = 1;
            4'b0100 : one_hot = 2;
            4'b1000 : one_hot = 3;
        endcase // case(val_thr_s1)
    end
endfunction // one_hot
reg [1:0] thr_id;

//trap request from ifu
//save itlb error to fluch b2b flush case.

reg [3:0] back2back_flush, temp_back;
initial begin
    back2back_flush = 0;
    temp_back = 0;
end

always @(posedge clk) begin
    case(thrid_w)
        0 : temp_back = 1;
        1 : temp_back = 2;
        2 : temp_back = 4;
        3 : temp_back = 8;
    endcase // case(thrid_w)
    if(ifu_tlu_ttype_vld_w && !lsu_tlu_defr_trp_taken_g && !ifu_tlu_flush_w &&
            ifu_tlu_ttype_w == 9'h0a)back2back_flush <= temp_back;
    else back2back_flush <= 0;

end // always @ (posedge clk)

//--------------------------------------------------
//monitor dtlb operations
//
// assign  lsu_rd_tte_data_parity = ^tlb_rd_tte_data_buf[41:0] ;
// assign  lsu_rd_tte_tag_parity  = ^{tlb_rd_tte_tag_buf[58:55],tlb_rd_tte_tag_buf[53:27],
//
//                                 tlb_rd_tte_tag_buf[25],   tlb_rd_tte_tag_buf[23:0]} ;
//smaple data at negedge whether there is parity error or not.
//Because of error injection happened at negedge.
assign throw_pc = throw_pc_w;


//got the correct pc.
function [63:0] which_pc;
    input [1:0] thrid;
    begin
        if(delay_done[thrid]   ||
                is_it_load[thrid])which_pc[63:0] = delay_pc[thrid];
        else which_pc[63:0] = spc0_rtl_pc;
    end
endfunction // which_pc

//mmu register compare
task mmu_register_cmp;
    begin
        if(spc0_mon_sign[`I_TAG_ACCESS])begin
            process_signal(`I_TAG_ACCESS, cpu_id, itag_tid);
            spc0_mon_sign[`I_TAG_ACCESS]  = 1'b0;
        end
        if(spc0_mon_sign[`D_TAG_ACCESS])begin
            process_signal(`D_TAG_ACCESS, cpu_id, dtag_tid);
            spc0_mon_sign[`D_TAG_ACCESS]  = 1'b0;
        end
    end
endtask // mmu_register_cmp
//tlb asi
function [3:0] tlb_asi;
    input [7:0] asi;
    input [9:0] va;
    input [63:0] ivld;
    input [63:0] dvld;
    begin
        tlb_asi = 0;
        if((asi == 8'h60) && (va == 0)&& ivld)tlb_asi = 1;
        else if((asi == 8'h60) && (va == 8)  && dvld)tlb_asi = 2;
        else if((asi == 8'h55) || (asi == 8'h56) || (asi == 8'h57))tlb_asi = 1;
        else if((asi == 8'h5d) || (asi == 8'h5e) || (asi == 8'h5f))tlb_asi = 2;
        else if(asi == 8'h54)tlb_asi = 3;
        else if(asi == 8'h5c)tlb_asi = 4;
    end
endfunction // tlb_asi

//--------------------------------------------------------------------------------------
//
//the TTE value for inst/data address translation
//send TTE value before steping.
// S, D, E, M, W
// ^
// |------------------- TLB operation
//itlb
reg [63:0] itte_data0[3:0], itte_pc0[3:0];
reg [63:0] itte_data1[3:0], itte_pc1[3:0];
reg [63:0] itte_data2[3:0], itte_pc2[3:0];
reg [63:0] itte_data3[3:0], itte_pc3[3:0];
reg [1:0]  tte_rd0, tte_wr0;
reg [1:0]  tte_rd1, tte_wr1;
reg [1:0]  tte_rd2, tte_wr2;
reg [1:0]  tte_rd3, tte_wr3;
//dtlb
reg [63:0] dtte_data0[3:0], dtte_pc0[3:0];
reg [63:0] dtte_data1[3:0], dtte_pc1[3:0];
reg [63:0] dtte_data2[3:0], dtte_pc2[3:0];
reg [63:0] dtte_data3[3:0], dtte_pc3[3:0];
reg [1:0]  dtte_rd0, dtte_wr0;
reg [1:0]  dtte_rd1, dtte_wr1;
reg [1:0]  dtte_rd2, dtte_wr2;
reg [1:0]  dtte_rd3, dtte_wr3;

reg [1:0]  ifu_lsu_thrid_d;
reg [3:0]  xlate_en_d;
reg [63:0] pc_d;
reg 	      cam_vld_d1;
reg [63:0] formatted_tte_data_del;
reg 	      dtlb_cam_vld_m, dtlb_cam_vld_w;
reg [63:0] dformatted_tte_data_w;
reg [63:0] dtte[3:0];
reg [3:0]  dtte_inst;
reg [3:0]  delay_dsfsr,delay_sfar ;
reg [23:0] delay_dsfsr_val [3:0];
reg [47:0] delay_sfar_val[3:0];
reg [3:0]  delay_mul_vld;
reg [63:0] delay_mul_val;
reg [2:0]  delay_mul_win    [3:0];
reg [5:0]  delay_mul_addr   [3:0];
reg [3:0]  delay_spu_done;

initial
begin
    delay_dsfsr = 0;
    delay_sfar  = 0;
    delay_mul_vld = 0;
    delay_spu_done= 0;
    tte_rd0 = 0;
    tte_wr0 = 0;
    tte_rd1 = 0;
    tte_wr1 = 0;
    tte_rd2 = 0;
    tte_wr2 = 0;
    tte_rd3 = 0;
    tte_wr3 = 0;

    dtte_rd0 = 0;
    dtte_wr0 = 0;
    dtte_rd1 = 0;
    dtte_wr1 = 0;
    dtte_rd2 = 0;
    dtte_wr2 = 0;
    dtte_rd3 = 0;
    dtte_wr3 = 0;

    for(i = 0; i < 4; i = i + 1)begin
        itte_data0[i] = 0;
        itte_data1[i] = 0;
        itte_data2[i] = 0;
        itte_data3[i] = 0;
        dtte_data0[i] = 0;
        dtte_data1[i] = 0;
        dtte_data2[i] = 0;
        dtte_data3[i] = 0;
    end
end // initial begin

//delayed version of tte related signals
always @(posedge clk)begin
    pc_d            <= pc_s;
    xlate_en_d      <= xlate_en;
    cam_vld_d1      <= cam_vld_s1;
    ifu_lsu_thrid_d <= ifu_lsu_thrid_s;
    formatted_tte_data_del <= formatted_tte_data;
    dtlb_cam_vld_m <= (ifu_lsu_ld_inst_e || ifu_lsu_st_inst_e) && dtlb_cam_vld;
    dtlb_cam_vld_w <= dtlb_cam_vld_m;
    dformatted_tte_data_w <= dformatted_tte_data;
    //keep tte data
    if(spc0_inst_done)begin
        dtte[spc0_thread_pc]      <= dformatted_tte_data;
        dtte_inst[spc0_thread_pc] <= dtlb_cam_vld_w;
    end
end

//----------------------------------------------------------------------------
//warm reset process
reg [3:0] after_rst;

reg [4:0]  c_reg;
reg [2:0]  c_cwp;
reg [63:0] c_val;
reg [1:0]  c_thrid;

task winAndreg;
    input [1:0] thrid;
    input [5:0] rd;
    input [63:0] val;
    begin
        if(spc0_cwp_cntl && cwp_cntl[thrid])begin
            c_reg   = {rd[4]  ^ (rd[3]  & cwp_val[thrid]) , rd[3:0]};
            c_cwp   = cwp_val[thrid];
        end
        else begin
            c_reg   = {rd[4]  ^ (rd[3]  & cwp[thrid]), rd[3:0]};
            c_cwp   = cwp[rd];
        end
        c_val = thread_buf_e && (thrid == ifu_tlu_thrid_w) ? {48'h0, val[15:0]} : val;
        if(c_reg < 8)begin
            case(thrid)
                0 : c_cwp = gl0_en ? gl_lvl0_new : gl_lvl0;
                1 : c_cwp = gl1_en ? gl_lvl1_new : gl_lvl1;
                2 : c_cwp = gl2_en ? gl_lvl2_new : gl_lvl2;
                3 : c_cwp = gl3_en ? gl_lvl3_new : gl_lvl3;
            endcase // case(spc0_thread_w)
        end
    end
endtask // winAndreg

task cleanup_ctls;
    begin
        if(tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f)begin
            if(spc0_pstate_cntl)pstate_cntl[thrid_w2] = 0;
            if(spc0_tl_cntl)tl_cntl[thrid_w2]     = 0;
            if(spc0_gl_cntl)gl_cntl[thrid_w2]     = 0;
            if(spc0_trap_htstate)htstate_cntl[thrid_w2]= 0;
            if(spc0_trap_tstate)tstate_cntl[thrid_w2]= 0;
            if(spc0_trap_ttype)ttype_cntl[thrid_w2]= 0;
            if(spc0_trap_pc)tpc_cntl[thrid_w2]= 0;
            if(spc0_trap_npc)tnpc_cntl[thrid_w2]= 0;
            if(spc0_trap_write)trap_cntl[thrid_w2]= 0;
        end // if (tlu_ifu_flush_pipe_w2 && tlu_final_ttype_w2 == 8'h4f)
    end
endtask // cleanup_ctls

//-----------------------------------------------
// main routine for REG comparsion.
//-----------------------------------------------
task process;
    reg [2:0] ind;
    reg [2:0] i;
    reg       not_load;
    reg [7:0] t_int;
    reg [3:0] float_done;
    reg [3:0] cmd;
    reg [63:0]tmp_pc;
    reg pending_tlb;
    reg [2:0] tmp_cwp;
    reg set_mul;
    reg [3:0] precise_step;
    integer   j;
    reg [1:0] thrid;


    begin
        // $display("ttt: process");
        //------------------------------------------------------
        // tlb pending checker.
        //------------------------------------------------------

        for(ind = 0;ind < 4; ind = ind + 1)begin
`ifndef VERILATOR
            if(delay_spu_done[ind])delay_spu[ind] = 0;
`endif // ifndef VERILATOR
            delay_spu_done[ind] = 0;

        end

        spu_check_ldxa;

        //prcoess the pending spec write
        stepping  = 0;

        pcx_parser;//pcx checker for core available

        float_load = 0;
        get_step_vector;
        float_done= 0;
        dup       = 1'b1;
        //adjust the instruction boundary.
        //Also process all flush instructions.
        if(spc0_flush_happen &&
                (active[spc0_thread_pc] != good[spc0_thread_pc]))begin

            if(sft_cntl[spc0_thread_pc] && ifu_tlu_swint_w)begin
                is_load[spc0_thread_pc]      = 1'b0;
                sft_cntl[spc0_thread_pc]     = 1'b0;
                delay_thread[spc0_thread_pc] = 1'b1;
                spc0_mon_sign[`SOFTINT]      = 1'b1;
                on_spc[0]                    = 1;
                sft_thrid[0]                 = spc0_thread_pc;
                sft_tid_vld[0]               = 1;
            end
            if(wake_int[spc0_thread_pc])ignore_int_rec[spc0_thread_pc] = 1;
            flush_tid = spc0_thread_pc;
            //exception. there is no the pending spec update.
            wake_int[flush_tid] = 1;
        end // if (spc0_flush_happen &&...
        //main check

        if((spc0_inst_done || spc0_flush_happen) && delay_done[spc0_thread_pc])begin
            delay_thread[spc0_thread_pc] = 1;
        end
        //do mmu register comparsion before stepping.
        //because these regs were committed by the previous instruction.
        /*
        if(spc0_mon_sign[`D_CTXT_NONZERO_CONFIG:`I_TAG_ACCESS])begin
        for(j = `I_TAG_ACCESS;j <= `D_CTXT_NONZERO_CONFIG;j = j + 1)begin
        if(spc0_mon_sign[j])begin
        process_signal(j, cpu_id, spc0_thread_pc);
        spc0_mon_sign[j] = 0;
        end
        end
        end*/
        if(spc0_mon_sign[`HINTP_SAS])begin
            for(i = 0; i < 3;i = i +1)begin
                if(hintp_tid_vld[i])begin
                    check_only = 1;
                    updated_reg_list(`HINTP_SAS, 0, hintp_thrid[i], 0, hintp_val[spc0_thread_pc], 0);
                    if((hintp_early[hintp_thrid[i]] ||
                            hintp_val[hintp_thrid[i]]   ||
                            updated_reg_list_reg))begin
                        hintp_tid  = hintp_thrid[i];
                        check_only = 0;
                        // $display("ttt: HINTP_SAS"); // indeed this is where the register gets updated
                        process_signal(`HINTP_SAS, cpu_id, hintp_tid);
                        hintp_tid_vld[i] = 0;
                    end
                end // if (hintp_tid_vld[i])
            end // for (i = 0; i < 3;i = i +1)
            if(hintp_tid_vld)spc0_mon_sign[`HINTP_SAS] = 1'b0;
        end // if (spc0_mon_sign[`HINTP_SAS])

        check_only = 0;
        if(spc0_mon_sign[`CCR]             &&
                (ccr_early[spc0_thread_pc] == 0))begin//early ccr
            process_signal(`CCR, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`CCR] = 1'b0;
        end

        if(spc0_mon_sign[`GSR] && (gsr_early[spc0_thread_pc] == 0))begin
            process_signal(`GSR, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`GSR] = 1'b0;
        end
        //choose the first y reg.
        if(which_y_cntl[0])begin
            which_y_tid     = 0;
            if(y_early[y_tid] == 0)begin
                process_signal(`Y, cpu_id, y_tid);
                spc0_mon_sign[`Y] = 1'b0;
                which_y_cntl[0]   = 0;
            end
        end
        if(which_y_cntl[1])begin
            which_y_tid     = 1;
            if(y_early[y_tid_w] == 0)begin
                process_signal(`Y, cpu_id, y_tid_w);
                spc0_mon_sign[`Y] = 1'b0;
                which_y_cntl[1]   = 0;
            end
        end
        if(which_y_cntl[2])begin
            which_y_tid     = 2;
            if(y_early[y_tid_w2] == 0)begin
                process_signal(`Y, cpu_id, y_tid_w2);
                spc0_mon_sign[`Y] = 1'b0;
                which_y_cntl[2]   = 0;
            end
        end

        //signals delayed one cycle.
        if(spc_trap_cntl              &&
                p_is_load[spc0_thread_pc]  && //trap and pending load
                delay_done[spc0_thread_pc] &&
                (ecl_irf_wen_w  && (spc0_thread_w  == spc0_thread_pc)  ||
                 ecl_irf_wen_w2 && (spc0_thread_w2 == spc0_thread_pc)) ||
                spu_lsu_ldxa_illgl_va_ww2 &&
                spu_lsu_ldxa_data_vld_ww2 &&
                delay_spu[spu_lsu_ldxa_tid_ww2])begin
            if(spu_lsu_ldxa_illgl_va_ww2 &&
                    spu_lsu_ldxa_data_vld_ww2 &&
                    delay_spu[spu_lsu_ldxa_tid_ww2])begin
                ind = spu_lsu_ldxa_tid_ww2;
                // $display("ttt: spc_trap_cntl");
                process_signal(`PC, cpu_id, ind);
                process_signal(`NPC, cpu_id, ind);
                stepping[ind]   = 1'b1;
                once_step[ind]  = 1'b1;
                delay_done[ind] = 1'b0;
`ifndef VERILATOR
                delay_spu[ind]  = 0;
`endif // ifndef VERILATOR
            end // if (spu_lsu_ldxa_illgl_va_w2 && spu_lsu_ldxa_data_vld_w2 && spu_delay)
            else begin
                // $display("ttt: spc_trap_cntl");
                process_signal(`PC, cpu_id, spc0_thread_pc);
                process_signal(`NPC, cpu_id, spc0_thread_pc);
                delay_done[spc0_thread_pc] = 1'b0;
                if(is_load_m[spc0_thread_pc] == 0)is_load[spc0_thread_pc] = 0;
            end // else: !if(spu_lsu_ldxa_illgl_va_w2 && spu_lsu_ldxa_data_vld_w2 && spu_delay)
        end // if (spc_trap_cntl              &&...

        //handle racing condition for spu ldxa and stxa
        //if there are pending ldxas, just stepping.
        if(delay_done &&
                //delay_spu[spc0_thread_pc] &&
                delay_spu &&
                spu_stxa_w[spc0_thread_pc] &&
                spc0_inst_done)begin
            for(ind = 0; ind < 4; ind = ind + 1)begin
                if(delay_spu[ind] && delay_done[ind] &&
                        (spu_ldxa_va[ind] == exu_lsu_ldst_va_w))begin
                    // $display("ttt: spc_trap_cntl");
                    process_signal(`PC, cpu_id, ind[1:0]);
                    process_signal(`NPC, cpu_id, ind[1:0]);
                    stepping[ind]   = 1'b1;
                    once_step[ind]  = 1'b1;
                    delay_done[ind] = 1'b0;
`ifndef VERILATOR
                    delay_spu[ind]  = 0;
`endif // ifndef VERILATOR
                    is_load[ind]    = 0;
                end
            end
        end
        if(spc0_mon_sign[`PSTATE_SAS]  &&
                pstate_early[spc0_thread_pc])begin
            process_signal(`PSTATE_SAS, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`PSTATE_SAS]  = 1'b0;
        end
        if(spc0_mon_sign[`TL_SAS] && tl_early[spc0_thread_pc])begin
            process_signal(`TL_SAS, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`TL_SAS] = 1'b0;
        end
        if(spc0_mon_sign[`GL] && gl_early[spc0_thread_pc])begin
            process_signal(`GL, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`GL] = 1'b0;
        end
        if(spc0_mon_sign[`HPSTATE_SAS] && hpstate_early[spc0_thread_pc])begin
          // $display("ttt: HPSTATE_SAS"); // no, stuff doesn't get printed here
          // $display("current cpuid is %1d", cpu_id);
          // $display("in other words, current cpuid is %1d", cpu_id[9:0]);
            process_signal(`HPSTATE_SAS, cpu_id, spc0_thread_pc);
            spc0_mon_sign[`HPSTATE_SAS] = 1'b0;

        end

        if(spc_trap_cntl)begin
        // $display("ttt: spc_trap_cntl");
            case(trap_val[spc0_thread_pc] - 1)
                3'b00 : begin
                    if(spc0_mon_sign[`TPC1])process_signal(`TPC1, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC1])process_signal(`TNPC1, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE1])process_signal(`TSTATE1, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT1])process_signal(`TT1, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE1])process_signal(`HTSTATE1, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC1]      = 0;
                    spc0_mon_sign[`TNPC1]     = 1'b0;
                    spc0_mon_sign[`TSTATE1]   = 1'b0;
                    spc0_mon_sign[`TT1]       = 1'b0;
                    spc0_mon_sign[`HTSTATE1]  = 1'b0;
                end
                3'b001 : begin
                    if(spc0_mon_sign[`TPC2])process_signal(`TPC2, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC2])process_signal(`TNPC2, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE2])process_signal(`TSTATE2, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT2])process_signal(`TT2, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE2])process_signal(`HTSTATE2, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC2]      = 0;
                    spc0_mon_sign[`TNPC2]     = 1'b0;
                    spc0_mon_sign[`TSTATE2]   = 1'b0;
                    spc0_mon_sign[`TT2]       = 1'b0;
                    spc0_mon_sign[`HTSTATE2]  = 1'b0;
                end
                3'b010 : begin
                    if(spc0_mon_sign[`TPC3])process_signal(`TPC3, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC3])process_signal(`TNPC3, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE3])process_signal(`TSTATE3, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT3])process_signal(`TT3, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE3])process_signal(`HTSTATE3, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC3]      = 0;
                    spc0_mon_sign[`TNPC3]     = 1'b0;
                    spc0_mon_sign[`TSTATE3]   = 1'b0;
                    spc0_mon_sign[`TT3]       = 1'b0;
                    spc0_mon_sign[`HTSTATE3]  = 1'b0;
                end
                3'b011 : begin
                    if(spc0_mon_sign[`TPC4])process_signal(`TPC4, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC4])process_signal(`TNPC4, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE4])process_signal(`TSTATE4, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT4])process_signal(`TT4, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE4])process_signal(`HTSTATE4, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC4] = 0;
                    spc0_mon_sign[`TNPC4]     = 1'b0;
                    spc0_mon_sign[`TSTATE4]   = 1'b0;
                    spc0_mon_sign[`TT4]       = 1'b0;
                    spc0_mon_sign[`HTSTATE4]  = 1'b0;
                end
                3'b100 : begin
                    if(spc0_mon_sign[`TPC5])process_signal(`TPC5, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC5])process_signal(`TNPC5, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE5])process_signal(`TSTATE5, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT5])process_signal(`TT5, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE5])process_signal(`HTSTATE5, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC5]      = 0;
                    spc0_mon_sign[`TNPC5]     = 1'b0;
                    spc0_mon_sign[`TSTATE5]   = 1'b0;
                    spc0_mon_sign[`TT5]       = 1'b0;
                    spc0_mon_sign[`HTSTATE5]  = 1'b0;
                end
                3'b101 : begin
                    if(spc0_mon_sign[`TPC6])process_signal(`TPC6, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TNPC6])process_signal(`TNPC6, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TSTATE6])process_signal(`TSTATE6, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`TT6])process_signal(`TT6, cpu_id, spc0_thread_pc);
                    if(spc0_mon_sign[`HTSTATE6])process_signal(`HTSTATE6, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`TPC6]      = 0;
                    spc0_mon_sign[`TNPC6]     = 1'b0;
                    spc0_mon_sign[`TSTATE6]   = 1'b0;
                    spc0_mon_sign[`TT6]       = 1'b0;
                    spc0_mon_sign[`HTSTATE6]  = 1'b0;
                end
            endcase
        end // if (spc_trap_cntl)

        if(spc0_mon_sign[`SOFTINT])begin//back-to-back soft int
            for(i = 0; i < 3;i = i+1)begin
                if(sft_tid_vld[i])begin
                    ind = 0;
                    if(sft_match[sft_thrid[i]] &&
                            !tlu_wr_sftint_l_g      &&
                            sft_thrid[i] == next_sft_wr_id)ind  = 1;
                    check_only = 1;
                    updated_reg_list(`SOFTINT, 0, i, 0, sft_val[i], 0);
                    if(ind || updated_reg_list_reg)begin
                        sft_tid    = sft_thrid[i];
                        check_only = 0;
                        // $display("ttt: SOFTINT");
                        process_signal(`SOFTINT, cpu_id, sft_thrid[i]);
                        sft_tid_vld[i] = 0;
                    end
                    check_only = 0;
                end // if (sft_tid_vld[i])
            end // for (i = 0; i < 3;i = i+1)
            if(sft_tid_vld == 0)spc0_mon_sign[`SOFTINT] = 1'b0;
        end // if (spc0_mon_sign[`SOFTINT])
        //send the stepping to the previous missing trap.
        precise_step = 0;
        float_delay = 0;
        if(mul_vld[spc0_thread_pc] &&
                on_spc[1]               &&
                //!mul_cntl[spc0_thread_pc]&&
                (active[spc0_thread_pc] != good[spc0_thread_pc]))
            set_mul = 0;//send_mul(spc0_thread_pc, mul_addr[spc0_thread_pc]);
        else set_mul = 0;

        if(spc0_inst_done && spu_ldxa_w[spc0_thread_pc] && dmmu_sfsr_wr_en_l[spc0_thread_pc])begin
            is_load[spc0_thread_pc]   = 1'b1;
            spu_illgl[spc0_thread_pc] = 1'b1;//it will be used when spu load is cancelled.
        end
        //process cancel step pc caused data_exception_error from l2.
        if(cancel_steppc)begin
            for(ind = 0; ind < 4; ind = ind + 1)begin
                if(cancel_steppc[ind])begin
                    // $display("ttt: cancel_steppc");
                    process_signal(`PC, cpu_id, ind);
                    process_signal(`NPC, cpu_id, ind);
                    cancel_steppc[ind] = 0;
                end
            end
        end

        //process mmu register before stepping.
        mmu_register_cmp;

        if(|on_spc || (tlu_ifu_flush_pipe_w && !ifu_tlu_flush_w && is_load_m[spc0_thread_pc] ||
                       ifu_tlu_hwint_m || tlu_done) && (|delay_done))begin
            for(ind = 0; ind < 4; ind = ind + 1)begin
                if(thread_status[ind] &&
                        (active[ind] != good[ind] || (active[ind] == good[ind])  &&  back[ind]) &&
                        !(tlu_ifu_flush_pipe_w && ifu_tlu_flush_w && (ind == spc0_thread_pc)))begin

                    if(delay_thread[ind] && set0_pc[ind] && (delay_done[ind] || is_trap[ind] || is_hit[ind]))begin
                        // $display("ttt: mmu_register_cmp");
                        process_signal(`PC, cpu_id, ind);
                        process_signal(`NPC, cpu_id, ind);
                        delay_done[ind] = 1'b0;
                        float_done[ind] = 1'b1;
                        if(spu_step[ind])spu_step[ind] = 0;

                        if(is_load[ind] && on_spc[0] || is_trap[ind] || is_hit[ind])dup = 0;
                    end // if (delay_thread[ind] && set0_pc[ind] && (delay_done[ind] || is_trap[ind] || is_hit[ind]))
                    if(set0_pc[ind] &&  ((ind == spc0_thread_pc) && on_spc[1]              ||
                                         (ind != spc0_thread_pc) && (block_enable[ind]     || float_load[ind]) &&
                                         (ind == float_tid)      && (float_done[ind] == 0) || spu_step[ind] ||
                                         is_it_load[ind] && (on_spc[1] == 0 || on_spc[1] && (ind != spc0_thread_pc))//pc mismatch.
                                        ) && (is_load[ind] == 1'b0))begin //delay_st1

                        if((ind != spc0_thread_pc) && (block_enable[ind] || float_load[ind]) &&
                                (ind == float_tid) &&
                                (float_done[ind] == 0) && !((ind == spc0_thread_pc) &&  on_spc[1]))float_delay[ind] = 1;
                        if(spu_step[ind])spu_step[ind] = 0;
                        // $display("ttt: spu_step");
                        process_signal(`PC, cpu_id, ind);
                        process_signal(`NPC, cpu_id, ind);
                    end // if (set0_pc[ind] &&  (ind == spc0_thread_pc) && (is_load[ind]   == 1'b0) && on_spc[1])
                    else if(on_spc[1] && is_load[ind] && set0_pc[ind] && dup)delay_done[ind] = 1'b1;
                    set0_pc[ind]    = 1'b1;
                end // if (thread_status[ind] && (active[ind] != good[ind]) && !(tlu_ifu_flush_pipe_w && ifu_tlu_flush_w &&...
            end // for (ind = 0; ind < 4; ind = ind + 1)
            if(spc0_mon_sign[`SOFTINT])begin
                for(i = 0; i < 3; i = i+ 1)begin
                    if(sft_tid_vld[i])begin
                        sft_tid = sft_thrid[i];
                        // $display("ttt: SOFTINT2");
                        process_signal(`SOFTINT, cpu_id, sft_thrid[i]);
                    end
                end
                spc0_mon_sign[`SOFTINT] = 1'b0;
            end
            //choose the first y reg
            if(which_y_cntl[0])begin
                which_y_tid     = 0;
                which_y_cntl[0] = 0;
            end
            else if(which_y_cntl[1])begin
                which_y_tid     = 1;
                which_y_cntl[1] = 0;
            end
            else if(which_y_cntl[2]) begin
                which_y_tid     = 2;
                which_y_cntl[2] = 0;
            end

            up_reset0 = 0;
            up_reset1 = 0;

            if(on_spc[0])begin

                if(mul_vld[spc0_thread_w]  && ecl_irf_wen_w)begin
                    up_reset0  = send_mulx(mul_addr[spc0_thread_w],  mul_win[spc0_thread_w],  mul_thread[spc0_thread_w]);
                end
                if(mul_vld[spc0_thread_w2] && ecl_irf_wen_w2)begin
                    up_reset1  = send_mulx(mul_addr[spc0_thread_w2], mul_win[spc0_thread_w2], mul_thread[spc0_thread_w2]);
                end
                if(spc0_mon_sign[`D_TSB_DIR_PTR:`ISFSR] && spc0_mon_sign[`VA_WP_ADDR])begin//process the delayed dsfsr
                    process_signal(`VA_WP_ADDR, cpu_id, dsfsr_tid);
                    spc0_mon_sign[`VA_WP_ADDR] = 0;
                end
                //process wht
                if(spc0_mon_sign[`ASI])begin
                    if(spc0_mon_sign[`VA_WP_ADDR])begin
                        process_signal(`VA_WP_ADDR, cpu_id, wtchpt_tid);
                        spc0_mon_sign[`VA_WP_ADDR] = 1'b0;
                    end
                    if(spc0_mon_sign[`I_CTXT_ZERO_PS0])begin
                        process_signal(`I_CTXT_ZERO_PS0, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_ZERO_PS0] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_ZERO_PS0])begin
                        process_signal(`D_CTXT_ZERO_PS0, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_ZERO_PS0] = 1'b0;
                    end
                    if(spc0_mon_sign[`I_CTXT_ZERO_PS1])begin
                        process_signal(`I_CTXT_ZERO_PS1, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_ZERO_PS1] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_ZERO_PS1])begin
                        process_signal(`D_CTXT_ZERO_PS1, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_ZERO_PS1] = 1'b0;
                    end

                    if(spc0_mon_sign[`I_CTXT_ZERO_CONFIG])begin
                        process_signal(`I_CTXT_ZERO_CONFIG, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_ZERO_CONFIG] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_ZERO_CONFIG])begin
                        process_signal(`D_CTXT_ZERO_CONFIG, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_ZERO_CONFIG] = 1'b0;
                    end
                    if(spc0_mon_sign[`I_CTXT_NONZERO_PS0])begin
                        process_signal(`I_CTXT_NONZERO_PS0, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_NONZERO_PS0] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_NONZERO_PS0])begin
                        process_signal(`D_CTXT_NONZERO_PS0, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_NONZERO_PS0] = 1'b0;
                    end
                    if(spc0_mon_sign[`I_CTXT_NONZERO_PS1])begin
                        process_signal(`I_CTXT_NONZERO_PS1, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_NONZERO_PS1] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_NONZERO_PS1])begin
                        process_signal(`D_CTXT_NONZERO_PS1, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_NONZERO_PS1] = 1'b0;
                    end

                    if(spc0_mon_sign[`I_CTXT_NONZERO_CONFIG])begin
                        process_signal(`I_CTXT_NONZERO_CONFIG, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`I_CTXT_NONZERO_CONFIG] = 1'b0;
                    end
                    if(spc0_mon_sign[`D_CTXT_NONZERO_CONFIG])begin
                        process_signal(`D_CTXT_NONZERO_CONFIG, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`D_CTXT_NONZERO_CONFIG] = 1'b0;
                    end
                    if(spc0_mon_sign[`CTXT_SEC])begin
                        process_signal(`CTXT_SEC, cpu_id, spc0_thread_pc);
                        spc0_mon_sign[`CTXT_SEC] = 1'b0;
                    end
                end

                if(spc0_mon_sign[`ASI] && spc0_mon_sign[`CTXT_PRIM])begin
                    process_signal(`CTXT_PRIM, cpu_id, spc0_thread_pc);
                    spc0_mon_sign[`CTXT_PRIM] = 0;
                end

                sparc(spc0_mon_sign, cpu_id);
            end
            if(which_y_cntl[1])begin
                which_y_tid = 1;
                process_signal(`Y, cpu_id, y_tid_w);
            end
            if(which_y_cntl[2])begin
                which_y_tid = 2;
                process_signal(`Y, cpu_id, y_tid_w2);
            end
            //process the mulcc instruction type to force the up 4bytes of simics register
            //by rtl value to sync with rtl value.

            if(mul_vld[spc0_thread_pc] &&
                    on_spc[1]               &&
                    //(!is_load[spc0_thread_pc] || is_load[spc0_thread_pc]
                    // !mul_cntl[spc0_thread_pc] &&//need skip one instruction to get mul instruction value.
                    (active[spc0_thread_pc] != good[spc0_thread_pc]))begin
                if(!send_mulx(mul_addr[spc0_thread_pc], mul_win[spc0_thread_pc], mul_thread[spc0_thread_pc]))//cansave, it will drop.
                begin
                    prev_addr[spc0_thread_pc] = mul_addr[spc0_thread_pc];
                    prev_val[spc0_thread_pc]  = mul_val[spc0_thread_pc];
                    prev_win[spc0_thread_pc]  = mul_win[spc0_thread_pc];
                    prev_vld[spc0_thread_pc]  = 1;

                end
                mul_vld[spc0_thread_pc] = 0;
            end // if (mul_vld[spc0_thread_pc] &&...
            if(on_spc[1])mul_cntl[spc0_thread_pc] = 0;

            //after merged all the pending interrupts and compare one time.
            if(spc0_inst_done && hint_wait[spc0_thread_pc])wake_int[spc0_thread_pc] = 1;
        end // if (|on_spc || ifu_tlu_hwint_m && (|delay_done))
        //async action do here.
        if(|invr_hold)begin //when INTR_RECEIVE updated, it will be checked.
            invr_tid = 0;
            if(invr_hold[0] && (active[0] != good[0]))begin
                process_signal(`INTR_RECEIVE, cpu_id, 0);//thread0
            end
            invr_tid = 1;
            if(invr_hold[1] && (active[1] != good[1]))begin
                process_signal(`INTR_RECEIVE, cpu_id, 1);//thread3
            end
            invr_tid = 2;
            if(invr_hold[2] && (active[2] != good[2]))begin
                process_signal(`INTR_RECEIVE, cpu_id, 2);//thread2
            end
            invr_tid = 3;
            if(invr_hold[3] && (active[3] != good[3]))begin
                process_signal(`INTR_RECEIVE, cpu_id, 3);//thread3
            end
        end // if (|invr_hold)
        if(spc0_inst_done || spc0_flush_happen)begin
            pic_on = 0;

            force_vld [spc0_thread_pc]    = 0;
            if(spc0_inst_done)begin
                trap_write_d2[spc0_thread_pc] = 0;
                sec_rst[spc0_thread_pc] = 0;
                if(late_load_w[spc0_thread_pc])late_load[spc0_thread_pc] = 1;
            end
        end

        if(spc0_inst_done && active[spc0_thread_pc] != good[spc0_thread_pc])begin
            $display("(%0t)Info-perm spc(%1d) thread(%d) pc(%x) npc(%x) opcode(%x)", $time, cpu_id[9:0], spc0_thread_pc, spc0_rtl_pc, spc0_rtl_npc, dtu_inst_w);
        end
        //------------------------------------------------
        //find the itlb & dtlb invalid instruction.
        //latch e-stage signals.
        //------------------------------------------------
        //if(spc0_inst_done && stepping[spc0_thread_pc])delay_spu_done[spc0_thread_pc] = 1;

        delay_spu_done = stepping;

        //if(stepping[spc0_thread_pc])delay_spu_done[spc0_thread_pc] = 1;
        turn_off_throw;
        //if the precise trap is taken, send the stepping to simics.
        if(spc0_flush_happen &&
                (tlu_exu_early_flush_pipe_w ||
                 tlu_ifu_flush_pipe_w))previous_flush_happen[spc0_thread_pc] = ~stepping[spc0_thread_pc];
        if(spc0_inst_done && previous_flush_happen[spc0_thread_pc])previous_flush_happen[spc0_thread_pc] = 0;
        if(spc_ccr_cntl)prev_ccr[ccr_tid] = ccr_val[ccr_tid];
    end
endtask // process
`endif // ifdef SAS_DISABLE
endmodule
