// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sas_tasks.v
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
`ifdef FPGA_SYN
`define FPGA_SYN_16x160
`endif

`ifdef USE_IBM_SRAMS
`define FPGA_SYN_16x160
`endif

//
//define special register
//define special register
`define MONITOR_SIGNAL                    155
`define FLOAT_X                           154
`define FLOAT_I                           153
`define REG_WRITE_BACK                    152

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
`define     RESET_COMMAND           500
`define     PLI_INST_TTE           17    /* %1 th id, %2-%9 I-TTE value */
`define     PLI_DATA_TTE           18    /* %1 th id, %2-%9 D-TTE value */
`define  TIMESTAMP              19    /* %1-%8 RTL timestamp value */
module sas_tasks (/*AUTOARG*/
           // Inputs
           clk, rst_l
       );
//inputs
input   clk;
input   rst_l;
reg [7:0] in_used;
reg [2:0] cpu_num;
reg        kill_fsr;
reg       dead_socket;
reg       inst_checker_off;
reg       fprs_on;

`ifdef SAS_DISABLE
reg  sas_def;
initial begin
    if($test$plusargs("use_sas_tasks"))sas_def = 1;
    else sas_def = 0;
end // initial
`else
initial begin
    in_used = 0;
    if($value$plusargs("cpu_num=%d", cpu_num))
        $display("Info:Number of cpu = %d", cpu_num);
    else cpu_num = 0;
    if($test$plusargs("kill_fsr"))kill_fsr = 1;
    else kill_fsr = 0;
    dead_socket      = 0;
    inst_checker_off = 0;
    if($value$plusargs("inst_check_off=%d", inst_checker_off))begin
        $display("Info:instruction checker is on", inst_checker_off);
        inst_checker_off =1;
    end
end // initial begin
initial begin
    fprs_on = 0;
    if($value$plusargs("fprs_comp_on=%d", fprs_on))fprs_on = 1;
end
/*
sas_task AUTO_TEMPLATE (
// Outputs

// Inputs
.clk      (clk),
.rst_l               (rst_l),
.tlu_pich_wrap_flg_m(`TLUPATH@.tcl.tlu_pich_wrap_flg_m),
.tlu_pic_cnt_en_m(`TLUPATH@.tcl.tlu_pic_cnt_en_m),
.final_ttype_sel_g(`TLUPATH@.tcl.final_ttype_sel_g),
.rst_ttype_w2(`TLUPATH@.tcl.rst_ttype_w2),
.pib_picl_wrap(`TLUPATH@.pib_picl_wrap),
.pib_pich_wrap(`TLUPATH@.pib_pich_wrap),
.pib_pich_wrap_m(`TLUPATH@.tcl.pib_pich_wrap_m),
.pib_wrap_trap_m(`TLUPATH@.tcl.pib_wrap_trap_m),
.sync_trap_taken_m(`TLUPATH@.tcl.sync_trap_taken_m),
.pic_wrap_trap_g(`TLUPATH@.tcl.pib_wrap_trap_g),
.pcr_rw_e(`TLUPATH@.tlu_pib.pcr_rw_e),
.tlu_rsr_inst_e(`TLUPATH@.tlu_pib.tlu_rsr_inst_e),
.pcr0(`TLUPATH@.tlu_pib.pcr0),
.pcr1(`TLUPATH@.tlu_pib.pcr1),
.pcr2(`TLUPATH@.tlu_pib.pcr2),
.pcr3(`TLUPATH@.tlu_pib.pcr3),
.wsr_pcr_sel(`TLUPATH@.tlu_pib.wsr_pcr_sel),
.pich_cnt0(`TLUPATH@.tlu_pib.pich_cnt0),
.pich_cnt1(`TLUPATH@.tlu_pib.pich_cnt1),
.pich_cnt2(`TLUPATH@.tlu_pib.pich_cnt2),
.pich_cnt3(`TLUPATH@.tlu_pib.pich_cnt3),
.picl_cnt0(`TLUPATH@.tlu_pib.picl_cnt0),
.picl_cnt1(`TLUPATH@.tlu_pib.picl_cnt1),
.picl_cnt2(`TLUPATH@.tlu_pib.picl_cnt2),
.picl_cnt3(`TLUPATH@.tlu_pib.picl_cnt3),
.update_pich_sel(`TLUPATH@.tlu_pib.update_pich_sel),
.update_picl_sel(`TLUPATH@.tlu_pib.update_picl_sel),
.const_maskid(`PCXPATH@.ifu.fdp.const_maskid),
.fprs_sel_wrt(`PCXPATH@.ifu.swl.fprs_sel_wrt),
.fprs_sel_set(`PCXPATH@.ifu.swl.fprs_sel_set),
.fprs_wrt_data(`PCXPATH@.ifu.swl.fprs_wrt_data),
.new_fprs(`PCXPATH@.ifu.swl.new_fprs),
.ifu_lsu_pref_inst_e(`PCXPATH@.ifu_lsu_pref_inst_e),
.formatted_tte_data(`PCXPATH@.ifu.errdp.formatted_tte_data),
.dformatted_tte_data(`PCXPATH@.lsu.tlbdp.formatted_tte_data),
.dtlb_tte_vld_g(`PCXPATH@.lsu.excpctl.tlb_tte_vld_g),
.dtlb_cam_vld(`PCXPATH@.lsu.dtlb.tlb_cam_vld),
.tlu_hpstate_enb(`PCXPATH@.tlu_hpstate_enb),
.tlu_hpstate_priv(`PCXPATH@.tlu_hpstate_priv),
.fcl_dtu_inst_vld_d(`PCXPATH@.ifu.fcl_dtu_inst_vld_d),
.icache_hit(`PCXPATH@.ifu.itlb.cache_hit),
.xlate_en(`PCXPATH@.ifu.fcl.xlate_en),
.ifu_lsu_thrid_s(`PCXPATH@.ifu_lsu_thrid_s),
.spu_tlu_rsrv_illgl_m(`PCXPATH@.tlu.spu_tlu_rsrv_illgl_m),
.tlu_exu_early_flush_pipe_w(`PCXPATH@.tlu_exu_early_flush_pipe_w),
.rst_hwint_ttype_g(`TLUPATH@.tcl.rst_hwint_ttype_g),
.trap_taken_g(`TLUPATH@.tcl.trap_taken_g),
.spu_lsu_ldxa_illgl_va_w2(`PCXPATH@.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2),
.spu_lsu_ldxa_data_vld_w2(`PCXPATH@.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2),
.spu_lsu_ldxa_tid_w2(`PCXPATH@.spu.spu_ctl.spu_lsu_ldxa_tid_w2),
.mra_field1_en(`TLUPATH@.mmu_ctl.mra_field1_en),
.mra_field2_en(`TLUPATH@.mmu_ctl.mra_field2_en),
.mra_field3_en(`TLUPATH@.mmu_ctl.mra_field3_en),
.mra_field4_en(`TLUPATH@.mmu_ctl.mra_field4_en),
.pmem_unc_error_g(`PCXPATH@.lsu.dctl.pmem_unc_error_g),
.pc_f(`PCXPATH@.ifu.fdp.pc_f),
.cam_vld_f(`PCXPATH@.ifu.fcl.cam_vld_f),
.cam_vld(`PCXPATH@.lsu.dtlb.cam_vld),
.defr_trp_taken_m_din(`PCXPATH@.lsu.excpctl.defr_trp_taken_m_din),
.fpdis_trap_e(`IFUPATH@.dec.fpdis_trap_e),
.illgl_va_vld_or_drop_ldxa2masync(`SPUPATH@.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync),
.ceen(`IFUPATH@.errctl.ceen),
.nceen(`IFUPATH@.errctl.nceen),
//mmu new rgisters
.mra_wr_vld(`TLUPATH@.mra_wr_vld),
.mra_wr_ptr(`TLUPATH@.mra_wr_ptr),
.ifu_tlu_flush_m(`TLUPATH@.ifu_tlu_flush_m),
//.mra_wdata(`TLUPATH@.mra_wdata),
.lsu_tlu_ttype_m2(`TLUPATH@.lsu_tlu_ttype_m2),
.lsu_tlu_ttype_vld_m2(`TLUPATH@.lsu_tlu_ttype_vld_m2),
.lsu_pid_state0(`PCXPATH@.lsu.lsu_pid_state0),
.lsu_pid_state1(`PCXPATH@.lsu.lsu_pid_state1),
.lsu_pid_state2(`PCXPATH@.lsu.lsu_pid_state2),
.lsu_pid_state3(`PCXPATH@.lsu.lsu_pid_state3),
.pid_state_wr_en(`PCXPATH@.lsu.pid_state_wr_en),
.tlu_final_ttype_w2(`TLUPATH@.tlu_final_ttype_w2),
.tlu_ifu_trappc_vld_w1(`TLUPATH@.tlu_ifu_trappc_vld_w1),
.lsu_t0_pctxt_state(`PCXPATH@.lsu.lsu_t0_pctxt_state),
.lsu_t1_pctxt_state(`PCXPATH@.lsu.lsu_t1_pctxt_state),
.lsu_t2_pctxt_state(`PCXPATH@.lsu.lsu_t2_pctxt_state),
.lsu_t3_pctxt_state(`PCXPATH@.lsu.lsu_t3_pctxt_state),
.pctxt_state_wr_thrd(`PCXPATH@.lsu.pctxt_state_wr_thrd),
.sctxt_state0(`PCXPATH@.lsu.dctldp.sctxt_state0),
.sctxt_state1(`PCXPATH@.lsu.dctldp.sctxt_state1),
.sctxt_state2(`PCXPATH@.lsu.dctldp.sctxt_state2),
.sctxt_state3(`PCXPATH@.lsu.dctldp.sctxt_state3),
.sctxt_state_wr_thrd(`PCXPATH@.lsu.dctldp.sctxt_state_wr_thrd),
// .lsu_va_wtchpt_addr(`PCXPATH@.lsu.lsu_va_wtchpt_addr),
.va_wtchpt0_addr(`PCXPATH@.lsu.qdp1.va_wtchpt0_addr),
.va_wtchpt1_addr(`PCXPATH@.lsu.qdp1.va_wtchpt1_addr),
.va_wtchpt2_addr(`PCXPATH@.lsu.qdp1.va_wtchpt2_addr),
.va_wtchpt3_addr(`PCXPATH@.lsu.qdp1.va_wtchpt3_addr),
.lsu_va_wtchpt0_wr_en_l(`PCXPATH@.lsu.lsu_va_wtchpt0_wr_en_l),
.lsu_va_wtchpt1_wr_en_l(`PCXPATH@.lsu.lsu_va_wtchpt1_wr_en_l),
.lsu_va_wtchpt2_wr_en_l(`PCXPATH@.lsu.lsu_va_wtchpt2_wr_en_l),
.lsu_va_wtchpt3_wr_en_l(`PCXPATH@.lsu.lsu_va_wtchpt3_wr_en_l),
.ifu_rstint_m(`TLPATH@.ifu_rstint_m),
.cam_vld_s1(`IFUPATH@.fcl.cam_vld_s1),
.val_thr_s1(`IFUPATH@.fcl.val_thr_s1),
.pc_s(`IFUPATH@.fdp.pc_s),
.rs2_fst_ue_w3(`PCXPATH@.ffu.ctl.rs2_fst_ue_w3),
.rs2_fst_ce_w3(`PCXPATH@.ffu.ctl.rs2_fst_ce_w3),
//tlb signals
.icam_hit(`PCXPATH@.ifu.itlb.cam_hit),
.fcl_ifq_icmiss_s1(`IFUPATH@.fcl.fcl_ifq_icmiss_s1),
.itlb_rw_index(`PCXPATH@.ifu.itlb.tlb_rw_index),
.itlb_rw_index_vld(`PCXPATH@.ifu.itlb.tlb_rw_index_vld),
.itlb_rd_tte_tag(`PCXPATH@.ifu.itlb.tlb_rd_tte_tag),
//.itlb_rd_tte_data(`PCXPATH@.ifu.itlb.tlb_rd_tte_data),
.itlb_rd_tte_data(`PCXPATH@.ifu.itlb.rd_tte_data),
//dtlb
.dcam_hit(`PCXPATH@.lsu.dtlb.cam_hit),
.dtlb_rw_index(`PCXPATH@.lsu.dtlb.tlb_rw_index),
.dtlb_rw_index_vld(`PCXPATH@.lsu.dtlb.tlb_rw_index_vld),
.dtlb_rd_tte_tag(`PCXPATH@.lsu.dtlb.tlb_rd_tte_tag),
.dtlb_rd_tte_data(`PCXPATH@.lsu.dtlb.rd_tte_data),
// .dtlb_rd_tte_data(`PCXPATH@.lsu.dtlb.tlb_rd_tte_data),
.lsu_tlu_async_ttype_vld_w2(`PCXPATH@.lsu_tlu_async_ttype_vld_w2),
.lsu_tlu_defr_trp_taken_g(`PCXPATH@.lsu_tlu_defr_trp_taken_g),
.lsu_tlu_async_ttype_w2(`PCXPATH@.lsu_tlu_async_ttype_w2),
.lsu_tlu_async_tid_w2(`PCXPATH@.lsu_tlu_async_tid_w2),
.wrt_spec_w(`IFUPATH@.swl.wrt_spec_w),
//pcx packet
.spc_pcx_data_pa(`TOP_DESIGN.pcx_iob_data_px2),
//mmu tlb signals
.dmmu_async_illgl_va_g(`TLUPATH@.mmu_ctl.dmmu_async_illgl_va_g),
.immu_async_illgl_va_g(`TLUPATH@.mmu_ctl.immu_async_illgl_va_g),
.lsu_tlu_tlb_st_inst_m(`TLUPATH@.mmu_ctl.lsu_tlu_tlb_st_inst_m),
.lsu_tlu_tlb_ld_inst_m(`TLUPATH@.mmu_ctl.lsu_tlu_tlb_ld_inst_m),
.lsu_mmu_flush_pipe_w(`TLUPATH@.lsu_mmu_flush_pipe_w),
.lsu_ifu_ldsta_internal_e(`IFUPATH@.lsu_ifu_ldsta_internal_e),
.dtlb_wr_vld(`DTLBPATH@.tlb_wr_vld),
.dtlb_demap(`DTLBPATH@.tlb_demap),
.dtlb_rd_tag_vld(`DTLBPATH@.tlb_rd_tag_vld),
.dtlb_rd_data_vld(`DTLBPATH@.tlb_rd_data_vld),
.dtlb_entry_vld(`DTLBPATH@.tlb_entry_vld),
.itlb_wr_vld(`ITLBPATH@.tlb_wr_vld),
.itlb_demap(`ITLBPATH@.tlb_demap),
.itlb_rd_tag_vld(`ITLBPATH@.tlb_rd_tag_vld),
.itlb_rd_data_vld(`ITLBPATH@.tlb_rd_data_vld),
.itlb_entry_vld(`ITLBPATH@.tlb_entry_vld),
.tlb_access_tid_g(`TLUPATH@.mmu_ctl.tlb_access_tid_g),

.dsfar0_clk(`TLUPATH@.mmu_dp.dsfar0_clk),
.dsfar1_clk(`TLUPATH@.mmu_dp.dsfar1_clk),
.dsfar2_clk(`TLUPATH@.mmu_dp.dsfar2_clk),
.dsfar3_clk(`TLUPATH@.mmu_dp.dsfar3_clk),
.immu_sfsr_wr_en_l(`TLUPATH@.immu_sfsr_wr_en_l),
.dmmu_sfsr_wr_en_l(`TLUPATH@.dmmu_sfsr_wr_en_l),
.dmmu_sfar_wr_en_l(`TLUPATH@.dmmu_sfar_wr_en_l),

.dsfar_din(`TLUPATH@.mmu_dp.dsfar_din),
.fcl_fdp_inst_sel_nop_s_l(`IFUPATH@.fdp.fcl_fdp_inst_sel_nop_s_l),
.retract_iferr_d(`IFUPATH@.swl.retract_iferr_d),
.dtu_inst_d(`IFUPATH@.dec.dtu_inst_d),
.local_rdpr_mx1_sel(`TLPATH@.local_rdpr_mx1_sel),
.tlu_rdpr_mx5_sel(`TLPATH@.tlu_rdpr_mx5_sel),
.tlu_rdpr_mx7_sel(`TLPATH@.tlu_rdpr_mx7_sel),
.true_tick(`TDPPATH@.true_tick),
.dsfsr_din(`TLUPATH@.mmu_dp.dsfsr_din),
.dsfsr0_clk(`TLUPATH@.mmu_dp.dsfsr0_clk),
.dsfsr1_clk(`TLUPATH@.mmu_dp.dsfsr1_clk),
.dsfsr2_clk(`TLUPATH@.mmu_dp.dsfsr2_clk),
.dsfsr3_clk(`TLUPATH@.mmu_dp.dsfsr3_clk),
.isfsr_din(`TLUPATH@.mmu_dp.isfsr_din),
.isfsr0_clk(`TLUPATH@.mmu_dp.isfsr0_clk),
.isfsr1_clk(`TLUPATH@.mmu_dp.isfsr1_clk),
.isfsr2_clk(`TLUPATH@.mmu_dp.isfsr2_clk),
.isfsr3_clk(`TLUPATH@.mmu_dp.isfsr3_clk),
//error handle
//.irf_ce_w(`INSTPATH@.irf_ce_w),
.ecl_byp_sel_ecc_w(`IFUPATH@.errctl.irf_ce_unq),
.ifu_exu_inst_w(`INSTPATH@.ifu_exu_inst_vld_w),
.inst_vld_w(`INSTPATH@.inst_vld_w),
.ctl_dp_fp_thr(`FLOATPATH@.ctl_dp_fp_thr),
//  .ifu_ffu_frd_d(`FLOATPATH@.ifu_ffu_frd_d),
.ifu_ffu_fst_d(`FLOATPATH@.ifu_ffu_fst_d),
.tick_match(`TDPPATH@.tick_match),
.tlu_wr_sftint_l_g(`TLUPATH@.tlu_wr_sftint_l_g),
//invalid itlb
.pc_e(`DTUPATH@.pc_e),
.exu_lsu_rs3_data_e(`PCXPATH@.exu_lsu_rs3_data_e),
.fcl_dtu_inst_vld_e(`INSTPATH@.fcl_dtu_inst_vld_e),
.ffu_ifu_ecc_ue_w2(`PCXPATH@.ffu.ffu_ifu_ecc_ue_w2),
.ffu_ifu_ecc_ce_w2(`PCXPATH@.ffu.ffu_ifu_ecc_ce_w2),
.ffu_ifu_fst_ce_w(`PCXPATH@.ffu_ifu_fst_ce_w),
.ecc_wen(`PCXPATH@.ffu.ctl.ecc_wen),
.any_err_vld(`IFUPATH@.errctl.any_err_vld),
.any_ue_vld(`IFUPATH@.errctl.any_ue_vld),

//rerr trap
.ifu_tlu_ttype_m(`PCXPATH@.ifu_tlu_ttype_m),
.tlu_rerr_vld(`PCXPATH@.tlu_rerr_vld),
//bloc load
.ifu_lsu_alt_space_e(`PCXPATH@.ifu_lsu_alt_space_e),
.ifu_lsu_ldst_fp_e(`PCXPATH@.ifu_lsu_ldst_fp_e),
.ifu_lsu_ldst_dbl_e(`PCXPATH@.ifu_lsu_ldst_dbl_e),
.lsu_ffu_blk_asi_e(`PCXPATH@.lsu_ffu_blk_asi_e),
.ifu_tlu_inst_vld_m(`PCXPATH@.ifu_tlu_inst_vld_m),
.lsu_quad_asi_e(`SPCPATH@.lsu.lsu_quad_asi_e),
//soft interrupt
.sftint0(`TDPPATH@.sftint0),
.sftint1(`TDPPATH@.sftint1),
.sftint2(`TDPPATH@.sftint2),
.sftint3(`TDPPATH@.sftint3),
.sftint0_clk(`TDPPATH@.sftint0_clk),
.sftint1_clk(`TDPPATH@.sftint1_clk),
.sftint2_clk(`TDPPATH@.sftint2_clk),
.sftint3_clk(`TDPPATH@.sftint3_clk),

// .tick_int_din(`TLPATH@.tick_int_din),
// .tick_int_en(`TLPATH@.tick_int_en),
.sftint_b0_en(`TDPPATH@.sftint_b0_en),
.sftint_b15_en(`TDPPATH@.sftint_b15_en),
.sftint_b16_en(`TDPPATH@.sftint_b16_en),
.tlu_rst_l(`TLPATH@.tlu_rst_l),
//interrupt
.cpx_spc_data_cx2(`PCXPATH@.cpx_spc_data_cx2),
.ifu_tlu_swint_m(`TLUPATH@.ifu_tlu_swint_m),
.ifu_tlu_rstint_m(`TLUPATH@.ifu_tlu_rstint_m),
.tlu_ifu_hwint_i3(`TLUPATH@.tlu_ifu_hwint_i3),
.ifu_tlu_flush_w(`PCXPATH@.ifu_tlu_flush_w),
.tlu_ifu_flush_pipe_w(`TLPATH@.tlu_ifu_flush_pipe_w),
.ifu_exu_save_d(`PCXPATH@.ifu_exu_save_d),
.ifu_exu_restore_d(`PCXPATH@.ifu_exu_restore_d),
.ifu_tlu_thrid_d(`PCXPATH@.ifu_tlu_thrid_d),
//hyperviser
//  .tlu_stickcmp_en_l(`TDPPATH@.tlu_stickcmp_en_l),

.stickcmp_intdis_en(`TDPPATH@.stickcmp_intdis_en),
.true_stickcmp0(`TDPPATH@.true_stickcmp0),
.true_stickcmp1(`TDPPATH@.true_stickcmp1),
.true_stickcmp2(`TDPPATH@.true_stickcmp2),
.true_stickcmp3(`TDPPATH@.true_stickcmp3),
// .tlu_htickcmp_en_l(`TDPPATH@.tlu_htickcmp_en_l),
.htickcmp_intdis_en(`TLU_HYPER@.htickcmp_intdis_en),
.true_htickcmp0(`TDPPATH@.true_htickcmp0),
.true_htickcmp1(`TDPPATH@.true_htickcmp1),
.true_htickcmp2(`TDPPATH@.true_htickcmp2),
.true_htickcmp3(`TDPPATH@.true_htickcmp3),
.htick_intdis0(`TLU_HYPER@.htick_intdis0),
.htick_intdis1(`TLU_HYPER@.htick_intdis1),
.htick_intdis2(`TLU_HYPER@.htick_intdis2),
.htick_intdis3(`TLU_HYPER@.htick_intdis3),
.tlu_hintp_en_l_g(`TDPPATH@.tlu_hintp_en_l_g),
.tlu_hintp(`TDPPATH@.tlu_hintp),
.tlu_htba_en_l(`TDPPATH@.tlu_htba_en_l),
.true_htba0(`TDPPATH@.true_htba0),
.true_htba1(`TDPPATH@.true_htba1),
.true_htba2(`TDPPATH@.true_htba2),
.true_htba3(`TDPPATH@.true_htba3),

//.tlu_hpstate_enb(`TDPPATH@.tlu_hpstate_enb),
.update_hpstate_l_w2 (`TDPPATH@.tlu_update_hpstate_l_w2[3:0]),
.restore_hpstate0(`TDPPATH@.restore_hpstate0),
.restore_hpstate1(`TDPPATH@.restore_hpstate1),
.restore_hpstate2(`TDPPATH@.restore_hpstate2),
.restore_hpstate3(`TDPPATH@.restore_hpstate3),
//
// modified to work with the official memory macro
// .tsa_htstate_en(`TSPATH@.tsa_htstate_en),
.tsa_htstate_en(`TLPATH@.tsa_htstate_en),

.gl0_en(`TLU_HYPER@.gl0_en),
.gl1_en(`TLU_HYPER@.gl1_en),
.gl2_en(`TLU_HYPER@.gl2_en),
.gl3_en(`TLU_HYPER@.gl3_en),
.gl_lvl0_new(`TLU_HYPER@.gl_lvl0_new),
.gl_lvl1_new(`TLU_HYPER@.gl_lvl1_new),
.gl_lvl2_new(`TLU_HYPER@.gl_lvl2_new),
.gl_lvl3_new(`TLU_HYPER@.gl_lvl3_new),
//graphic status register
//thread 0
.t0_gsr_nxt(`FFUPATH@.dp.t0_gsr_nxt),
.t0_gsr_rnd_next(`FFUPATH@.ctl.visctl.t0_gsr_rnd_next),
.t0_gsr_align_next(`FFUPATH@.ctl.visctl.t0_gsr_align_next),
.t0_gsr_wsr_w(`FFUPATH@.ctl.visctl.t0_gsr_wsr_w2),
.t0_siam_w(`FFUPATH@.ctl.visctl.t0_siam_w2),
.t0_alignaddr_w(`FFUPATH@.ctl.visctl.t0_alignaddr_w2),
//thread 1
.t1_gsr_nxt(`FFUPATH@.dp.t1_gsr_nxt),
.t1_gsr_rnd_next(`FFUPATH@.ctl.visctl.t1_gsr_rnd_next),
.t1_gsr_align_next(`FFUPATH@.ctl.visctl.t1_gsr_align_next),
.t1_gsr_wsr_w(`FFUPATH@.ctl.visctl.t1_gsr_wsr_w2),
.t1_siam_w(`FFUPATH@.ctl.visctl.t1_siam_w2),
.t1_alignaddr_w(`FFUPATH@.ctl.visctl.t1_alignaddr_w2),
//thread 2
.t2_gsr_nxt(`FFUPATH@.dp.t2_gsr_nxt),
.t2_gsr_rnd_next(`FFUPATH@.ctl.visctl.t2_gsr_rnd_next),
.t2_gsr_align_next(`FFUPATH@.ctl.visctl.t2_gsr_align_next),
.t2_gsr_wsr_w(`FFUPATH@.ctl.visctl.t2_gsr_wsr_w2),
.t2_siam_w(`FFUPATH@.ctl.visctl.t2_siam_w2),
.t2_alignaddr_w(`FFUPATH@.ctl.visctl.t2_alignaddr_w2),
//thread 3
.t3_gsr_nxt(`FFUPATH@.dp.t3_gsr_nxt),
.t3_gsr_rnd_next(`FFUPATH@.ctl.visctl.t3_gsr_rnd_next),
.t3_gsr_align_next(`FFUPATH@.ctl.visctl.t3_gsr_align_next),
.t3_gsr_wsr_w(`FFUPATH@.ctl.visctl.t3_gsr_wsr_w2),
.t3_siam_w(`FFUPATH@.ctl.visctl.t3_siam_w2),
.t3_alignaddr_w(`FFUPATH@.ctl.visctl.t3_alignaddr_w2),
//interrupt signals
.t0_inrr_i2(`TLUPATH@.intdp.t0_inrr_i2[63:0]),
.t1_inrr_i2(`TLUPATH@.intdp.t1_inrr_i2[63:0]),
.t2_inrr_i2(`TLUPATH@.intdp.t2_inrr_i2[63:0]),
.t3_inrr_i2(`TLUPATH@.intdp.t3_inrr_i2[63:0]),
.t0_indr(`TLUPATH@.intdp.t0_indr[10:0]),
.t1_indr(`TLUPATH@.intdp.t1_indr[10:0]),
.t2_indr(`TLUPATH@.intdp.t2_indr[10:0]),
.t3_indr(`TLUPATH@.intdp.t3_indr[10:0]),
.dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH@.fcl_fdp_rdsr_sel_thr_e_l),
.ifu_exu_rd_ifusr_e (`EXUPATH@.ifu_exu_rd_ifusr_e),
.ifu_exu_use_rsr_e_l (`EXUPATH@.ifu_exu_use_rsr_e_l),
.ecl_irf_wen_w  (`REGPATH@.ecl_irf_wen_w),
.ecl_irf_wen_w2 (`REGPATH@.ecl_irf_wen_w2),
.thr_rd_w   (`REGPATH@.thr_rd_w[4:0]),
//   .rml_irf_thr_m       (`REGPATH@.rml_irf_thr_m[1:0]),
.rml_irf_thr_m       (`EXUPATH@.irf.cwpswap_tid_m[1:0]),
//   .rml_irf_restore_local_m(`REGPATH@.rml_irf_restore_local_m),
.rml_irf_restore_local_m(`EXUPATH@.irf.swap_local_w),
//   .rml_irf_save_local_m(`REGPATH@.rml_irf_save_local_m),
.rml_irf_save_local_m(`EXUPATH@.irf.swap_local_m),
//   .rml_irf_cwp_m       (`REGPATH@.rml_irf_cwp_m[2:0]),
.rml_irf_cwp_m       (`EXUPATH@.irf.old_lo_cwp_m[2:0]),
.exu_tlu_spill_e     (`EXUPATH@.rml.exu_tlu_spill_e),
//   .ifu_exu_save_e      (`EXUPATH@.ifu_exu_save_e),
.ifu_exu_save_e      (`EXUPATH@.rml.save_e),
.thr_rd_w2    (`REGPATH@.thr_rd_w2[4:0]),
.byp_irf_rd_data_w   (`REGPATH@.byp_irf_rd_data_w[71:0]),
.byp_irf_rd_data_w2  (`REGPATH@.byp_irf_rd_data_w2[71:0]),
.ecl_irf_tid_w  (`REGPATH@.ecl_irf_tid_w[1:0]),
.ecl_irf_tid_w2 (`REGPATH@.ecl_irf_tid_w2[1:0]),
.ifu_tlu_thrid_w  (`SPCPATH@.ifu.fcl.sas_thrid_w[1:0]),
.wen_thr0_l   (`CCRPATH@.wen_thr0_l),
.wen_thr1_l   (`CCRPATH@.wen_thr1_l),
.wen_thr2_l   (`CCRPATH@.wen_thr2_l),
.wen_thr3_l   (`CCRPATH@.wen_thr3_l),
.ccrin_thr0   (`CCRPATH@.ccrin_thr0[7:0]),
.ccrin_thr1   (`CCRPATH@.ccrin_thr1[7:0]),
.ccrin_thr2   (`CCRPATH@.ccrin_thr2[7:0]),
.ccrin_thr3   (`CCRPATH@.ccrin_thr3[7:0]),
.cwp_thr0_next       (`EXUPATH@.rml.cwp.cwp_thr0_next),
.cwp_thr1_next       (`EXUPATH@.rml.cwp.cwp_thr1_next),
.cwp_thr2_next       (`EXUPATH@.rml.cwp.cwp_thr2_next),
.cwp_thr3_next       (`EXUPATH@.rml.cwp.cwp_thr3_next),
.cwp_wen_l           (`EXUPATH@.rml.cwp.cwp_wen_l[3:0]),
.next_cansave_w (`EXUPATH@.rml.next_cansave_w[2:0]),
.cansave_wen_w  (`EXUPATH@.rml.cansave_wen_w),
.next_canrestore_w  (`EXUPATH@.rml.next_canrestore_w[2:0]),
.canrestore_wen_w (`EXUPATH@.rml.canrestore_wen_w),
.next_otherwin_w  (`EXUPATH@.rml.next_otherwin_w[2:0]),
.otherwin_wen_w (`EXUPATH@.rml.otherwin_wen_w),
.tl_exu_tlu_wsr_data_w(`EXUPATH@.rml.exu_tlu_wsr_data_w[5:0]),
//.ecl_rml_wstate_wen_w(`EXUPATH@.ecl_rml_wstate_wen_w),//rml.wstate_wen_w
.ecl_rml_wstate_wen_w(`EXUPATH@.rml.wstate_wen_w),
.next_cleanwin_w  (`EXUPATH@.rml.next_cleanwin_w[2:0]),
.cleanwin_wen_w (`EXUPATH@.rml.cleanwin_wen_w),
.next_yreg_thr0 (`EXUPATH@.div.yreg.next_yreg_thr0[31:0]),
.next_yreg_thr1 (`EXUPATH@.div.yreg.next_yreg_thr1[31:0]),
.next_yreg_thr2 (`EXUPATH@.div.yreg.next_yreg_thr2[31:0]),
.next_yreg_thr3 (`EXUPATH@.div.yreg.next_yreg_thr3[31:0]),
.ecl_div_yreg_wen_l (`EXUPATH@.ecl_div_yreg_wen_l[3:0]),
.ifu_tlu_wsr_inst_d (`EXUPATH@.ifu_tlu_wsr_inst_d),
.ifu_tlu_sraddr_d (`EXUPATH@.ifu_tlu_sraddr_d[3:0]),
//.inst_done_w_for_sas  (`PC_CMP.`INSTPATH@.inst_done_w_for_sas),
.inst_done_w_for_sas  (`PC_CMP.spc@_inst_done),
//thread id
.inst_vld_qual_e     (`INSTPATH@.inst_vld_qual_e),
.ifu_tlu_pc_w (`SPCPATH@.ifu.fdp.pc_w[47:0]),
.ifu_tlu_npc_w  (`SPCPATH@.ifu.fdp.npc_w[47:0]),
.tl0_en   (`TLPATH@.tl0_en),
.tl1_en   (`TLPATH@.tl1_en),
.tl2_en   (`TLPATH@.tl2_en),
.tl3_en   (`TLPATH@.tl3_en),
.trp_lvl0_new (`TLPATH@.trp_lvl0_new[2:0]),
.trp_lvl1_new (`TLPATH@.trp_lvl1_new[2:0]),
.trp_lvl2_new (`TLPATH@.trp_lvl2_new[2:0]),
.trp_lvl3_new (`TLPATH@.trp_lvl3_new[2:0]),
.update_pstate0_w2  (`TLPATH@.update_pstate_w2[0]),
.update_pstate1_w2  (`TLPATH@.update_pstate_w2[1]),
.update_pstate2_w2  (`TLPATH@.update_pstate_w2[2]),
.update_pstate3_w2  (`TLPATH@.update_pstate_w2[3]),
.pstate_priv_update_w2(`TDPPATH@.pstate_priv_update_w2),
.hpstate_priv_update_w2(`TDPPATH@.hpstate_priv_update_w2),
.restore_pstate0  (`TDPPATH@.restore_pstate0),
.restore_pstate1  (`TDPPATH@.restore_pstate1),
.restore_pstate2  (`TDPPATH@.restore_pstate2),
.restore_pstate3  (`TDPPATH@.restore_pstate3),
.tick_npt0           (`TLPATH@.tick_npt0),
.tick_npt1           (`TLPATH@.tick_npt1),
.tick_npt2           (`TLPATH@.tick_npt2),
.tick_npt3           (`TLPATH@.tick_npt3),
.tick_ctl_din        (`TLPATH@.tick_ctl_din),
.tick0_en   (`TLPATH@.tick_en[0]),
.tick1_en   (`TLPATH@.tick_en[1]),
.tick2_en   (`TLPATH@.tick_en[2]),
.tick3_en   (`TLPATH@.tick_en[3]),
.exu_tlu_wsr_data_w (`TDPPATH@.tlu_wsr_data_w[63:0]),
.tba0_en    (`TLPATH@.tlu_tba_en_l[0]),
.tba1_en    (`TLPATH@.tlu_tba_en_l[1]),
.tba2_en    (`TLPATH@.tlu_tba_en_l[2]),
.tba3_en    (`TLPATH@.tlu_tba_en_l[3]),
.tsa_wr_vld   (`TLPATH@.tsa_wr_vld[1:0]),
.tsa_pc_en    (`TLPATH@.tsa_pc_en),
.tsa_npc_en   (`TLPATH@.tsa_npc_en),
.tsa_tstate_en  (`TLPATH@.tsa_tstate_en),
.tsa_ttype_en (`TLPATH@.tsa_ttype_en),
.tsa_wr_tid   (`TLPATH@.tsa_wr_tid[1:0]),
// modified due to tsa memory macro swap
// .tsa_wr_tpl    (`TLPATH@.tsa_wr_tpl[2:0]),
// .temp_tlvl   (`TSPATH@.temp_tlvl),
// .tsa_wdata   (`TSPATH@.din),
// .write_mask    (`TSPATH@.write_mask),
.tsa_wr_tpl          (`TLPATH@.tsa_wr_tpl[2:0]),
.temp_tlvl0   (`TS0PATH@.temp_tlvl),
.tsa0_wdata   (`TS0PATH@.din),
.write_mask0    (`TS0PATH@.write_mask),
.temp_tlvl1   (`TS1PATH@.temp_tlvl),
.tsa1_wdata   (`TS1PATH@.din),
.write_mask1    (`TS1PATH@.write_mask),
.ifu_lsu_st_inst_e   (`SPCPATH@.ifu_lsu_st_inst_e),
.ifu_lsu_ld_inst_e   (`SPCPATH@.ifu_lsu_ld_inst_e),
.ifu_lsu_swap_e      (`SPCPATH@.ifu_lsu_swap_e),
.ifu_tlu_thrid_e     (`SPCPATH@.ifu_tlu_thrid_e[1:0]),
//new siganl for tlb
.ifu_lsu_imm_asi_d   (`SPCPATH@.ifu_lsu_imm_asi_d[7:0]),
.ifu_lsu_imm_asi_vld_d(`SPCPATH@.ifu_lsu_imm_asi_vld_d),
.ifu_tlu_itlb_done   (`SPCPATH@.ifu_tlu_itlb_done),
.lsu_tlu_dtlb_done   (`SPCPATH@.lsu_tlu_dtlb_done),
.tlu_itlb_wr_vld_g   (`SPCPATH@.tlu_itlb_wr_vld_g),
.tlu_itlb_dmp_vld_g  (`SPCPATH@.tlu_itlb_dmp_vld_g),
//.tlu_dtlb_wr_vld_g   (`SPCPATH@.tlu_dtlb_wr_vld_g), //old signal
.tlu_dtlb_wr_vld_g   (`TLUPATH@.mmu_ctl.pre_dtlb_wr_vld_g),//new signal
.tlu_dtlb_dmp_vld_g  (`SPCPATH@.tlu_dtlb_dmp_vld_g),
.tlu_idtlb_dmp_thrid_g (`SPCPATH@.tlu_idtlb_dmp_thrid_g[1:0]),
.inc_ind_ld_int_i1   (`INTPATH@.inc_ind_ld_int_i1[3:0]),
.next_t0_inrr_i1     (`INTPATH@.next_t0_inrr_i1[63:0]),
.next_t1_inrr_i1     (`INTPATH@.next_t1_inrr_i1[63:0]),
.next_t2_inrr_i1     (`INTPATH@.next_t2_inrr_i1[63:0]),
.next_t3_inrr_i1     (`INTPATH@.next_t3_inrr_i1[63:0]),
.asi_wr_din          (`ASIDPPATH@.asi_wr_din),
.asi_state_wr_thrd   (`ASIDPPATH@.asi_state_wr_thrd[3:0]),
.pil                 (`TLPATH@.tlu_wsr_data_w[3:0]),
.pil0_en             (`TLPATH@.pil0_en),
.pil1_en             (`TLPATH@.pil1_en),
.pil2_en             (`TLPATH@.pil2_en),
.pil3_en             (`TLPATH@.pil3_en),
.dp_frf_data         (`FLOATPATH@.dp_frf_data[70:0]),
.ctl_frf_addr        (`FLOATPATH@.ctl_frf_addr[6:0]),
.ctl_frf_wen         (`FLOATPATH@.ctl_frf_wen[1:0]),
.regfile_index       (`FLOATPATH@.frf.regfile_index[7:0]),
// .rml_irf_save_global (`EXUPATH@.irf.rml_irf_save_global),
// .rml_irf_restore_global (`EXUPATH@.irf.rml_irf_restore_global),
//.rml_irf_agp            (`EXUPATH@.irf.rml_irf_agp[1:0]),
.rml_irf_global_tid     (`EXUPATH@.irf.rml_irf_global_tid[1:0]),
//.tlu_exu_agp_dec        (`EXUPATH@.rml.tlu_exu_agp_dec[1:0]),
.ifu_tlu_hwint_m        (`TLUPATH@.ifu_tlu_hwint_m),
.ttype_sel_hstk_cmp_e    (`INSTPATH@.ttype_sel_hstk_cmp_e),
.ifu_tlu_ttype_vld_m     (`INSTPATH@.ifu_tlu_ttype_vld_m),
//trap
.ifu_spu_trap_ack       (`SPCPATH@.ifu_spu_trap_ack[1:0]),
//mulscc
.ifu_exu_muls_d        (`SPCPATH@.ifu_exu_muls_d),
.ifu_exu_tid_s2        (`EXUPATH@.ifu_exu_tid_s2[1:0]),
//fsr
.t0_fsr_nxt            (`FLOATPATH@.dp.t0_fsr_nxt[27:0]),
.t1_fsr_nxt            (`FLOATPATH@.dp.t1_fsr_nxt[27:0]),
.t2_fsr_nxt            (`FLOATPATH@.dp.t2_fsr_nxt[27:0]),
.t3_fsr_nxt            (`FLOATPATH@.dp.t3_fsr_nxt[27:0]),
.ctl_dp_fsr_sel_old    (`FLOATPATH@.ctl_dp_fsr_sel_old[3:0]),
//soft int
// .tlu_sftint_en_l_g      (`TLUPATH@.tlu_sftint_en_l_g[3:0]),
// .tlu_tickcmp_en_l       (`TLUPATH@.tlu_tickcmp_en_l[3:0]),
.tlu_sftint_en_l_g      (`TLUPATH@.tlu_sftint_en_l_g[3:0]),
.tickcmp_intdis_en       (`TDPPATH@.tickcmp_intdis_en[3:0]),
.true_tickcmp0           (`TDPPATH@.true_tickcmp0),
.true_tickcmp1           (`TDPPATH@.true_tickcmp1),
.true_tickcmp2           (`TDPPATH@.true_tickcmp2),
.true_tickcmp3           (`TDPPATH@.true_tickcmp3),
//read regs
.ifu_exu_rs1_s          (`EXUPATH@.ifu_exu_rs1_s[4:0]),
.ifu_exu_rs2_s          (`EXUPATH@.ifu_exu_rs2_s[4:0]),
.byp_alu_rs1_data_e     (`EXUPATH@.byp_alu_rs1_data_e[63:0]),
.byp_alu_rs2_data_e     (`EXUPATH@.byp_alu_rs2_data_e[63:0]),
.lda_internal_e         (`ASIPATH@.lda_internal_e),
.sta_internal_e         (`ASIPATH@.sta_internal_e),
.asi_state_e            (`ASIDPPATH@.asi_state_e[7:0]),
.exu_lsu_ldst_va_e      (`ASIDPPATH@.exu_lsu_ldst_va_e[47:0]),
//   .mask                   (`PC_CMP.finish_mask[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
.good                   (`PC_CMP.good[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
.active                 (`PC_CMP.active_thread[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
.back                   (`PC_CMP.back_thread[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
//   .active                 (`PC_CMP.active_thread[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
.finish                 (`PC_CMP.finish_mask[@"(+ 3 (* 4 @))":@"(* 4 @)"]),
.cpu_num                (cpu_num),
.mra_wdata(mra_wdata@),
.cpu_id                 (@),
);
reg [159:0] mra_wdata0, mra_wdata1, mra_wdata2, mra_wdata3,
mra_wdata4, mra_wdata5, mra_wdata6, mra_wdata7;
*/



`ifdef SAS_DISABLE
`else
 `ifdef RTL_SPARC0
sas_task task0 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH0.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH0.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH0.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH0.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH0.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH0.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH0.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH0.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH0.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH0.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH0.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH0.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH0.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH0.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH0.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH0.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH0.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH0.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH0.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH0.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH0.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH0.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH0.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH0.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH0.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH0.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH0.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH0.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH0.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH0.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH0.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH0.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH0.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH0.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH0.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH0.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH0.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH0.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH0.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH0.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH0.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH0.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH0.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH0.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH0.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH0.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH0.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH0.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH0.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH0.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH0.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH0.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH0.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH0.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH0.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH0.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH0.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH0.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH0.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH0.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH0.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH0.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH0.errctl.ceen), // Templated
             .nceen   (`IFUPATH0.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH0.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH0.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH0.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH0.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH0.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH0.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH0.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH0.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH0.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH0.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH0.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH0.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH0.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH0.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH0.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH0.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH0.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH0.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH0.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH0.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH0.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH0.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH0.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH0.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH0.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH0.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH0.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH0.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH0.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH0.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH0.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH0.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH0.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH0.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH0.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH0.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH0.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH0.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH0.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH0.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH0.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH0.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH0.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH0.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH0.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH0.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH0.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH0.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH0.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH0.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH0.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH0.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH0.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH0.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH0.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH0.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH0.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH0.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH0.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH0.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH0.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH0.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH0.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[3:0]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH0.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH0.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH0.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH0.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH0.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH0.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH0.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH0.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH0.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH0.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH0.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH0.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH0.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH0.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH0.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH0.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH0.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH0.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH0.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH0.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH0.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH0.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH0.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH0.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH0.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH0.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH0.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH0.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH0.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH0.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH0.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH0.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH0.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH0.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH0.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH0.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH0.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH0.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH0.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH0.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH0.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH0.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH0.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH0.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH0.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH0.sftint0),   // Templated
             .sftint1   (`TDPPATH0.sftint1),   // Templated
             .sftint2   (`TDPPATH0.sftint2),   // Templated
             .sftint3   (`TDPPATH0.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH0.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH0.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH0.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH0.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH0.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH0.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH0.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH0.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH0.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH0.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH0.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH0.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH0.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH0.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH0.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH0.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH0.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH0.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH0.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH0.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH0.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH0.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH0.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH0.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH0.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH0.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH0.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH0.tick_npt3),  // Templated
             .true_tick   (`TDPPATH0.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER0.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER0.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER0.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER0.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH0.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH0.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH0.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH0.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH0.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH0.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH0.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH0.true_htba0),  // Templated
             .true_htba1    (`TDPPATH0.true_htba1),  // Templated
             .true_htba2    (`TDPPATH0.true_htba2),  // Templated
             .true_htba3    (`TDPPATH0.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH0.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH0.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH0.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH0.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH0.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER0.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH0.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH0.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH0.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH0.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER0.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER0.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER0.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER0.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER0.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER0.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER0.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER0.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH0.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH0.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH0.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH0.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH0.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH0.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH0.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH0.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH0.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH0.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH0.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH0.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH0.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH0.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH0.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH0.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH0.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH0.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH0.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH0.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH0.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH0.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH0.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH0.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH0.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH0.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[3:0]),   // Templated
             .active    (`PC_CMP.active_thread[3:0]), // Templated
             .finish    (`PC_CMP.finish_mask[3:0]), // Templated
             .lda_internal_e  (`ASIPATH0.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH0.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH0.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH0.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH0.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH0.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH0.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH0.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH0.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH0.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH0.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH0.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH0.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH0.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH0.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH0.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH0.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH0.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH0.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH0.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH0.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH0.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH0.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH0.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH0.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH0.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH0.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH0.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH0.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH0.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH0.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH0.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH0.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH0.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH0.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH0.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH0.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH0.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH0.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH0.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH0.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH0.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH0.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH0.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH0.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH0.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH0.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH0.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH0.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH0.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH0.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH0.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH0.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH0.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH0.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH0.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH0.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH0.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH0.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH0.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH0.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH0.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH0.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH0.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH0.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc0_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH0.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH0.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH0.tl0_en),   // Templated
             .tl1_en    (`TLPATH0.tl1_en),   // Templated
             .tl2_en    (`TLPATH0.tl2_en),   // Templated
             .tl3_en    (`TLPATH0.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH0.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH0.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH0.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH0.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH0.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH0.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH0.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH0.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH0.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH0.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH0.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH0.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH0.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH0.restore_pstate3), // Templated
             .tick0_en    (`TLPATH0.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH0.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH0.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH0.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH0.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH0.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH0.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH0.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH0.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH0.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH0.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH0.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH0.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH0.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH0.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH0.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH0.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH0.din),   // Templated
             .write_mask0   (`TS0PATH0.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH0.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH0.din),   // Templated
             .write_mask1   (`TS1PATH0.write_mask),  // Templated
             .cpu_id    (0),       // Templated
             .next_t0_inrr_i1 (`INTPATH0.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH0.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH0.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH0.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH0.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH0.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH0.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH0.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH0.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH0.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH0.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH0.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH0.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH0.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH0.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH0.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH0.pil0_en),  // Templated
             .pil1_en   (`TLPATH0.pil1_en),  // Templated
             .pil2_en   (`TLPATH0.pil2_en),  // Templated
             .pil3_en   (`TLPATH0.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH0.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH0.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH0.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH0.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH0.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH0.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH0.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH0.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH0.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH0.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH0.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH0.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH0.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH0.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH0.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH0.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH0.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH0.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH0.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH0.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH0.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH0.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH0.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH0.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH0.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH0.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH0.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH0.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC0
`ifdef RTL_SPARC1
sas_task task1 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH1.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH1.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH1.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH1.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH1.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH1.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH1.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH1.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH1.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH1.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH1.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH1.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH1.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH1.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH1.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH1.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH1.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH1.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH1.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH1.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH1.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH1.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH1.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH1.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH1.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH1.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH1.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH1.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH1.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH1.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH1.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH1.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH1.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH1.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH1.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH1.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH1.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH1.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH1.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH1.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH1.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH1.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH1.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH1.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH1.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH1.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH1.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH1.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH1.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH1.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH1.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH1.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH1.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH1.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH1.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH1.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH1.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH1.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH1.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH1.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH1.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH1.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH1.errctl.ceen), // Templated
             .nceen   (`IFUPATH1.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH1.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH1.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH1.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH1.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH1.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH1.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH1.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH1.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH1.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH1.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH1.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH1.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH1.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH1.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH1.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH1.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH1.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH1.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH1.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH1.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH1.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH1.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH1.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH1.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH1.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH1.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH1.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH1.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH1.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH1.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH1.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH1.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH1.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH1.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH1.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH1.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH1.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH1.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH1.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH1.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH1.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH1.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH1.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH1.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH1.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH1.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH1.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH1.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH1.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH1.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH1.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH1.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH1.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH1.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH1.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH1.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH1.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH1.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH1.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH1.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH1.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH1.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH1.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[7:4]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH1.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH1.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH1.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH1.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH1.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH1.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH1.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH1.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH1.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH1.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH1.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH1.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH1.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH1.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH1.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH1.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH1.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH1.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH1.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH1.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH1.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH1.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH1.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH1.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH1.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH1.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH1.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH1.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH1.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH1.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH1.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH1.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH1.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH1.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH1.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH1.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH1.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH1.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH1.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH1.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH1.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH1.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH1.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH1.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH1.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH1.sftint0),   // Templated
             .sftint1   (`TDPPATH1.sftint1),   // Templated
             .sftint2   (`TDPPATH1.sftint2),   // Templated
             .sftint3   (`TDPPATH1.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH1.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH1.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH1.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH1.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH1.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH1.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH1.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH1.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH1.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH1.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH1.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH1.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH1.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH1.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH1.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH1.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH1.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH1.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH1.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH1.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH1.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH1.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH1.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH1.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH1.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH1.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH1.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH1.tick_npt3),  // Templated
             .true_tick   (`TDPPATH1.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER1.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER1.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER1.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER1.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH1.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH1.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH1.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH1.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH1.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH1.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH1.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH1.true_htba0),  // Templated
             .true_htba1    (`TDPPATH1.true_htba1),  // Templated
             .true_htba2    (`TDPPATH1.true_htba2),  // Templated
             .true_htba3    (`TDPPATH1.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH1.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH1.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH1.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH1.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH1.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER1.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH1.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH1.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH1.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH1.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER1.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER1.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER1.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER1.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER1.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER1.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER1.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER1.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH1.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH1.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH1.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH1.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH1.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH1.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH1.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH1.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH1.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH1.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH1.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH1.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH1.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH1.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH1.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH1.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH1.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH1.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH1.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH1.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH1.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH1.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH1.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH1.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH1.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH1.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[7:4]),   // Templated
             .active    (`PC_CMP.active_thread[7:4]), // Templated
             .finish    (`PC_CMP.finish_mask[7:4]), // Templated
             .lda_internal_e  (`ASIPATH1.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH1.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH1.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH1.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH1.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH1.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH1.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH1.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH1.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH1.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH1.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH1.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH1.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH1.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH1.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH1.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH1.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH1.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH1.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH1.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH1.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH1.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH1.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH1.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH1.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH1.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH1.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH1.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH1.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH1.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH1.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH1.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH1.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH1.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH1.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH1.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH1.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH1.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH1.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH1.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH1.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH1.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH1.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH1.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH1.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH1.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH1.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH1.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH1.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH1.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH1.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH1.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH1.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH1.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH1.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH1.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH1.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH1.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH1.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH1.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH1.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH1.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH1.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH1.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH1.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc1_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH1.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH1.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH1.tl0_en),   // Templated
             .tl1_en    (`TLPATH1.tl1_en),   // Templated
             .tl2_en    (`TLPATH1.tl2_en),   // Templated
             .tl3_en    (`TLPATH1.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH1.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH1.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH1.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH1.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH1.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH1.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH1.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH1.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH1.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH1.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH1.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH1.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH1.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH1.restore_pstate3), // Templated
             .tick0_en    (`TLPATH1.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH1.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH1.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH1.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH1.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH1.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH1.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH1.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH1.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH1.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH1.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH1.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH1.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH1.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH1.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH1.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH1.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH1.din),   // Templated
             .write_mask0   (`TS0PATH1.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH1.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH1.din),   // Templated
             .write_mask1   (`TS1PATH1.write_mask),  // Templated
             .cpu_id    (1),       // Templated
             .next_t0_inrr_i1 (`INTPATH1.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH1.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH1.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH1.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH1.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH1.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH1.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH1.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH1.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH1.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH1.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH1.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH1.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH1.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH1.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH1.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH1.pil0_en),  // Templated
             .pil1_en   (`TLPATH1.pil1_en),  // Templated
             .pil2_en   (`TLPATH1.pil2_en),  // Templated
             .pil3_en   (`TLPATH1.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH1.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH1.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH1.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH1.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH1.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH1.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH1.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH1.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH1.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH1.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH1.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH1.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH1.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH1.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH1.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH1.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH1.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH1.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH1.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH1.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH1.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH1.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH1.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH1.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH1.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH1.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH1.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH1.ifu_tlu_ttype_vld_m)); // Templated
`endif // !ifdef SP1
`ifdef RTL_SPARC2
sas_task task2 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH2.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH2.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH2.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH2.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH2.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH2.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH2.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH2.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH2.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH2.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH2.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH2.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH2.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH2.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH2.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH2.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH2.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH2.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH2.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH2.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH2.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH2.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH2.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH2.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH2.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH2.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH2.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH2.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH2.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH2.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH2.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH2.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH2.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH2.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH2.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH2.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH2.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH2.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH2.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH2.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH2.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH2.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH2.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH2.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH2.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH2.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH2.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH2.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH2.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH2.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH2.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH2.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH2.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH2.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH2.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH2.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH2.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH2.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH2.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH2.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH2.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH2.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH2.errctl.ceen), // Templated
             .nceen   (`IFUPATH2.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH2.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH2.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH2.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH2.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH2.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH2.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH2.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH2.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH2.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH2.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH2.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH2.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH2.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH2.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH2.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH2.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH2.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH2.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH2.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH2.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH2.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH2.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH2.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH2.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH2.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH2.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH2.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH2.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH2.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH2.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH2.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH2.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH2.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH2.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH2.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH2.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH2.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH2.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH2.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH2.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH2.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH2.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH2.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH2.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH2.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH2.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH2.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH2.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH2.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH2.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH2.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH2.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH2.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH2.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH2.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH2.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH2.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH2.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH2.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH2.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH2.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH2.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH2.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[11:8]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH2.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH2.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH2.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH2.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH2.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH2.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH2.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH2.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH2.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH2.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH2.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH2.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH2.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH2.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH2.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH2.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH2.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH2.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH2.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH2.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH2.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH2.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH2.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH2.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH2.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH2.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH2.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH2.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH2.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH2.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH2.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH2.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH2.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH2.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH2.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH2.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH2.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH2.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH2.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH2.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH2.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH2.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH2.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH2.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH2.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH2.sftint0),   // Templated
             .sftint1   (`TDPPATH2.sftint1),   // Templated
             .sftint2   (`TDPPATH2.sftint2),   // Templated
             .sftint3   (`TDPPATH2.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH2.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH2.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH2.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH2.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH2.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH2.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH2.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH2.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH2.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH2.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH2.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH2.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH2.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH2.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH2.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH2.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH2.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH2.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH2.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH2.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH2.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH2.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH2.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH2.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH2.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH2.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH2.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH2.tick_npt3),  // Templated
             .true_tick   (`TDPPATH2.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER2.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER2.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER2.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER2.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH2.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH2.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH2.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH2.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH2.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH2.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH2.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH2.true_htba0),  // Templated
             .true_htba1    (`TDPPATH2.true_htba1),  // Templated
             .true_htba2    (`TDPPATH2.true_htba2),  // Templated
             .true_htba3    (`TDPPATH2.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH2.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH2.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH2.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH2.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH2.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER2.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH2.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH2.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH2.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH2.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER2.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER2.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER2.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER2.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER2.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER2.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER2.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER2.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH2.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH2.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH2.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH2.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH2.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH2.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH2.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH2.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH2.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH2.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH2.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH2.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH2.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH2.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH2.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH2.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH2.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH2.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH2.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH2.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH2.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH2.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH2.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH2.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH2.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH2.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[11:8]),  // Templated
             .active    (`PC_CMP.active_thread[11:8]), // Templated
             .finish    (`PC_CMP.finish_mask[11:8]), // Templated
             .lda_internal_e  (`ASIPATH2.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH2.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH2.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH2.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH2.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH2.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH2.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH2.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH2.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH2.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH2.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH2.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH2.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH2.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH2.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH2.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH2.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH2.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH2.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH2.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH2.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH2.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH2.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH2.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH2.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH2.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH2.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH2.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH2.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH2.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH2.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH2.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH2.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH2.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH2.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH2.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH2.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH2.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH2.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH2.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH2.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH2.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH2.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH2.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH2.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH2.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH2.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH2.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH2.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH2.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH2.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH2.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH2.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH2.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH2.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH2.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH2.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH2.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH2.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH2.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH2.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH2.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH2.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH2.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH2.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc2_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH2.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH2.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH2.tl0_en),   // Templated
             .tl1_en    (`TLPATH2.tl1_en),   // Templated
             .tl2_en    (`TLPATH2.tl2_en),   // Templated
             .tl3_en    (`TLPATH2.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH2.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH2.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH2.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH2.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH2.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH2.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH2.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH2.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH2.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH2.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH2.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH2.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH2.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH2.restore_pstate3), // Templated
             .tick0_en    (`TLPATH2.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH2.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH2.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH2.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH2.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH2.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH2.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH2.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH2.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH2.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH2.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH2.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH2.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH2.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH2.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH2.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH2.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH2.din),   // Templated
             .write_mask0   (`TS0PATH2.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH2.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH2.din),   // Templated
             .write_mask1   (`TS1PATH2.write_mask),  // Templated
             .cpu_id    (2),       // Templated
             .next_t0_inrr_i1 (`INTPATH2.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH2.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH2.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH2.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH2.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH2.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH2.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH2.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH2.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH2.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH2.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH2.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH2.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH2.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH2.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH2.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH2.pil0_en),  // Templated
             .pil1_en   (`TLPATH2.pil1_en),  // Templated
             .pil2_en   (`TLPATH2.pil2_en),  // Templated
             .pil3_en   (`TLPATH2.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH2.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH2.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH2.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH2.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH2.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH2.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH2.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH2.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH2.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH2.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH2.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH2.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH2.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH2.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH2.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH2.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH2.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH2.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH2.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH2.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH2.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH2.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH2.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH2.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH2.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH2.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH2.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH2.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC2
`ifdef RTL_SPARC3
sas_task task3 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH3.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH3.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH3.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH3.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH3.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH3.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH3.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH3.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH3.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH3.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH3.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH3.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH3.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH3.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH3.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH3.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH3.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH3.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH3.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH3.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH3.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH3.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH3.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH3.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH3.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH3.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH3.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH3.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH3.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH3.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH3.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH3.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH3.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH3.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH3.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH3.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH3.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH3.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH3.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH3.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH3.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH3.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH3.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH3.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH3.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH3.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH3.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH3.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH3.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH3.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH3.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH3.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH3.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH3.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH3.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH3.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH3.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH3.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH3.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH3.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH3.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH3.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH3.errctl.ceen), // Templated
             .nceen   (`IFUPATH3.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH3.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH3.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH3.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH3.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH3.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH3.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH3.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH3.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH3.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH3.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH3.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH3.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH3.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH3.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH3.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH3.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH3.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH3.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH3.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH3.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH3.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH3.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH3.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH3.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH3.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH3.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH3.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH3.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH3.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH3.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH3.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH3.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH3.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH3.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH3.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH3.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH3.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH3.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH3.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH3.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH3.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH3.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH3.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH3.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH3.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH3.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH3.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH3.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH3.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH3.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH3.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH3.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH3.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH3.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH3.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH3.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH3.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH3.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH3.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH3.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH3.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH3.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH3.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[15:12]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH3.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH3.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH3.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH3.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH3.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH3.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH3.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH3.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH3.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH3.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH3.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH3.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH3.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH3.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH3.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH3.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH3.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH3.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH3.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH3.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH3.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH3.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH3.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH3.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH3.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH3.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH3.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH3.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH3.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH3.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH3.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH3.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH3.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH3.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH3.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH3.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH3.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH3.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH3.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH3.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH3.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH3.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH3.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH3.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH3.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH3.sftint0),   // Templated
             .sftint1   (`TDPPATH3.sftint1),   // Templated
             .sftint2   (`TDPPATH3.sftint2),   // Templated
             .sftint3   (`TDPPATH3.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH3.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH3.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH3.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH3.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH3.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH3.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH3.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH3.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH3.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH3.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH3.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH3.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH3.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH3.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH3.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH3.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH3.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH3.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH3.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH3.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH3.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH3.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH3.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH3.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH3.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH3.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH3.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH3.tick_npt3),  // Templated
             .true_tick   (`TDPPATH3.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER3.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER3.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER3.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER3.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH3.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH3.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH3.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH3.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH3.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH3.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH3.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH3.true_htba0),  // Templated
             .true_htba1    (`TDPPATH3.true_htba1),  // Templated
             .true_htba2    (`TDPPATH3.true_htba2),  // Templated
             .true_htba3    (`TDPPATH3.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH3.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH3.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH3.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH3.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH3.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER3.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH3.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH3.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH3.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH3.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER3.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER3.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER3.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER3.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER3.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER3.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER3.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER3.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH3.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH3.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH3.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH3.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH3.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH3.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH3.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH3.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH3.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH3.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH3.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH3.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH3.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH3.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH3.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH3.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH3.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH3.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH3.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH3.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH3.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH3.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH3.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH3.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH3.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH3.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[15:12]),   // Templated
             .active    (`PC_CMP.active_thread[15:12]), // Templated
             .finish    (`PC_CMP.finish_mask[15:12]), // Templated
             .lda_internal_e  (`ASIPATH3.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH3.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH3.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH3.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH3.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH3.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH3.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH3.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH3.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH3.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH3.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH3.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH3.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH3.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH3.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH3.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH3.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH3.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH3.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH3.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH3.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH3.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH3.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH3.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH3.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH3.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH3.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH3.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH3.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH3.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH3.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH3.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH3.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH3.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH3.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH3.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH3.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH3.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH3.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH3.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH3.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH3.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH3.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH3.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH3.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH3.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH3.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH3.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH3.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH3.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH3.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH3.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH3.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH3.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH3.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH3.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH3.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH3.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH3.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH3.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH3.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH3.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH3.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH3.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH3.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc3_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH3.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH3.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH3.tl0_en),   // Templated
             .tl1_en    (`TLPATH3.tl1_en),   // Templated
             .tl2_en    (`TLPATH3.tl2_en),   // Templated
             .tl3_en    (`TLPATH3.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH3.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH3.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH3.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH3.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH3.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH3.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH3.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH3.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH3.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH3.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH3.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH3.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH3.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH3.restore_pstate3), // Templated
             .tick0_en    (`TLPATH3.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH3.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH3.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH3.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH3.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH3.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH3.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH3.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH3.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH3.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH3.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH3.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH3.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH3.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH3.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH3.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH3.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH3.din),   // Templated
             .write_mask0   (`TS0PATH3.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH3.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH3.din),   // Templated
             .write_mask1   (`TS1PATH3.write_mask),  // Templated
             .cpu_id    (3),       // Templated
             .next_t0_inrr_i1 (`INTPATH3.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH3.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH3.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH3.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH3.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH3.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH3.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH3.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH3.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH3.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH3.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH3.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH3.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH3.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH3.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH3.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH3.pil0_en),  // Templated
             .pil1_en   (`TLPATH3.pil1_en),  // Templated
             .pil2_en   (`TLPATH3.pil2_en),  // Templated
             .pil3_en   (`TLPATH3.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH3.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH3.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH3.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH3.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH3.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH3.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH3.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH3.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH3.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH3.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH3.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH3.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH3.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH3.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH3.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH3.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH3.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH3.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH3.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH3.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH3.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH3.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH3.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH3.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH3.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH3.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH3.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH3.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC3
`ifdef RTL_SPARC4
sas_task task4 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH4.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH4.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH4.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH4.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH4.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH4.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH4.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH4.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH4.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH4.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH4.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH4.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH4.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH4.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH4.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH4.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH4.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH4.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH4.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH4.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH4.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH4.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH4.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH4.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH4.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH4.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH4.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH4.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH4.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH4.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH4.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH4.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH4.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH4.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH4.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH4.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH4.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH4.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH4.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH4.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH4.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH4.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH4.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH4.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH4.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH4.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH4.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH4.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH4.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH4.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH4.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH4.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH4.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH4.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH4.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH4.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH4.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH4.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH4.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH4.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH4.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH4.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH4.errctl.ceen), // Templated
             .nceen   (`IFUPATH4.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH4.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH4.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH4.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH4.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH4.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH4.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH4.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH4.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH4.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH4.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH4.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH4.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH4.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH4.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH4.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH4.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH4.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH4.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH4.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH4.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH4.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH4.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH4.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH4.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH4.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH4.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH4.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH4.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH4.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH4.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH4.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH4.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH4.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH4.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH4.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH4.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH4.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH4.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH4.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH4.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH4.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH4.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH4.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH4.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH4.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH4.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH4.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH4.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH4.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH4.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH4.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH4.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH4.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH4.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH4.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH4.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH4.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH4.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH4.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH4.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH4.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH4.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH4.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[19:16]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH4.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH4.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH4.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH4.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH4.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH4.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH4.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH4.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH4.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH4.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH4.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH4.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH4.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH4.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH4.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH4.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH4.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH4.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH4.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH4.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH4.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH4.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH4.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH4.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH4.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH4.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH4.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH4.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH4.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH4.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH4.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH4.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH4.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH4.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH4.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH4.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH4.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH4.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH4.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH4.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH4.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH4.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH4.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH4.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH4.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH4.sftint0),   // Templated
             .sftint1   (`TDPPATH4.sftint1),   // Templated
             .sftint2   (`TDPPATH4.sftint2),   // Templated
             .sftint3   (`TDPPATH4.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH4.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH4.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH4.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH4.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH4.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH4.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH4.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH4.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH4.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH4.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH4.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH4.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH4.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH4.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH4.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH4.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH4.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH4.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH4.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH4.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH4.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH4.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH4.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH4.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH4.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH4.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH4.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH4.tick_npt3),  // Templated
             .true_tick   (`TDPPATH4.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER4.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER4.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER4.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER4.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH4.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH4.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH4.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH4.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH4.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH4.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH4.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH4.true_htba0),  // Templated
             .true_htba1    (`TDPPATH4.true_htba1),  // Templated
             .true_htba2    (`TDPPATH4.true_htba2),  // Templated
             .true_htba3    (`TDPPATH4.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH4.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH4.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH4.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH4.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH4.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER4.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH4.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH4.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH4.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH4.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER4.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER4.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER4.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER4.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER4.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER4.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER4.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER4.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH4.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH4.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH4.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH4.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH4.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH4.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH4.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH4.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH4.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH4.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH4.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH4.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH4.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH4.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH4.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH4.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH4.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH4.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH4.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH4.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH4.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH4.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH4.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH4.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH4.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH4.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[19:16]),   // Templated
             .active    (`PC_CMP.active_thread[19:16]), // Templated
             .finish    (`PC_CMP.finish_mask[19:16]), // Templated
             .lda_internal_e  (`ASIPATH4.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH4.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH4.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH4.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH4.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH4.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH4.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH4.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH4.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH4.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH4.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH4.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH4.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH4.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH4.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH4.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH4.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH4.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH4.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH4.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH4.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH4.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH4.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH4.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH4.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH4.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH4.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH4.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH4.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH4.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH4.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH4.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH4.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH4.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH4.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH4.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH4.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH4.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH4.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH4.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH4.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH4.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH4.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH4.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH4.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH4.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH4.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH4.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH4.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH4.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH4.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH4.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH4.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH4.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH4.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH4.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH4.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH4.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH4.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH4.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH4.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH4.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH4.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH4.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH4.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc4_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH4.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH4.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH4.tl0_en),   // Templated
             .tl1_en    (`TLPATH4.tl1_en),   // Templated
             .tl2_en    (`TLPATH4.tl2_en),   // Templated
             .tl3_en    (`TLPATH4.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH4.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH4.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH4.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH4.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH4.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH4.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH4.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH4.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH4.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH4.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH4.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH4.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH4.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH4.restore_pstate3), // Templated
             .tick0_en    (`TLPATH4.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH4.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH4.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH4.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH4.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH4.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH4.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH4.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH4.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH4.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH4.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH4.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH4.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH4.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH4.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH4.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH4.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH4.din),   // Templated
             .write_mask0   (`TS0PATH4.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH4.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH4.din),   // Templated
             .write_mask1   (`TS1PATH4.write_mask),  // Templated
             .cpu_id    (4),       // Templated
             .next_t0_inrr_i1 (`INTPATH4.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH4.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH4.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH4.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH4.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH4.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH4.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH4.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH4.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH4.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH4.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH4.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH4.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH4.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH4.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH4.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH4.pil0_en),  // Templated
             .pil1_en   (`TLPATH4.pil1_en),  // Templated
             .pil2_en   (`TLPATH4.pil2_en),  // Templated
             .pil3_en   (`TLPATH4.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH4.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH4.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH4.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH4.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH4.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH4.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH4.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH4.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH4.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH4.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH4.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH4.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH4.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH4.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH4.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH4.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH4.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH4.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH4.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH4.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH4.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH4.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH4.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH4.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH4.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH4.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH4.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH4.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC4
`ifdef RTL_SPARC5
sas_task task5 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH5.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH5.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH5.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH5.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH5.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH5.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH5.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH5.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH5.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH5.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH5.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH5.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH5.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH5.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH5.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH5.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH5.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH5.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH5.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH5.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH5.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH5.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH5.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH5.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH5.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH5.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH5.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH5.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH5.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH5.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH5.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH5.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH5.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH5.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH5.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH5.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH5.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH5.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH5.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH5.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH5.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH5.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH5.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH5.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH5.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH5.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH5.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH5.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH5.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH5.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH5.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH5.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH5.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH5.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH5.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH5.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH5.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH5.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH5.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH5.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH5.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH5.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH5.errctl.ceen), // Templated
             .nceen   (`IFUPATH5.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH5.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH5.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH5.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH5.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH5.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH5.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH5.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH5.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH5.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH5.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH5.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH5.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH5.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH5.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH5.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH5.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH5.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH5.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH5.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH5.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH5.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH5.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH5.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH5.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH5.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH5.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH5.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH5.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH5.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH5.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH5.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH5.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH5.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH5.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH5.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH5.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH5.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH5.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH5.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH5.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH5.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH5.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH5.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH5.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH5.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH5.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH5.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH5.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH5.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH5.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH5.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH5.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH5.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH5.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH5.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH5.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH5.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH5.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH5.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH5.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH5.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH5.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH5.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[23:20]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH5.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH5.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH5.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH5.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH5.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH5.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH5.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH5.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH5.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH5.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH5.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH5.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH5.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH5.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH5.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH5.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH5.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH5.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH5.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH5.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH5.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH5.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH5.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH5.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH5.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH5.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH5.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH5.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH5.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH5.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH5.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH5.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH5.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH5.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH5.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH5.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH5.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH5.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH5.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH5.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH5.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH5.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH5.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH5.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH5.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH5.sftint0),   // Templated
             .sftint1   (`TDPPATH5.sftint1),   // Templated
             .sftint2   (`TDPPATH5.sftint2),   // Templated
             .sftint3   (`TDPPATH5.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH5.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH5.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH5.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH5.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH5.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH5.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH5.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH5.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH5.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH5.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH5.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH5.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH5.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH5.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH5.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH5.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH5.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH5.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH5.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH5.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH5.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH5.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH5.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH5.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH5.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH5.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH5.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH5.tick_npt3),  // Templated
             .true_tick   (`TDPPATH5.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER5.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER5.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER5.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER5.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH5.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH5.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH5.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH5.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH5.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH5.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH5.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH5.true_htba0),  // Templated
             .true_htba1    (`TDPPATH5.true_htba1),  // Templated
             .true_htba2    (`TDPPATH5.true_htba2),  // Templated
             .true_htba3    (`TDPPATH5.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH5.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH5.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH5.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH5.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH5.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER5.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH5.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH5.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH5.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH5.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER5.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER5.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER5.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER5.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER5.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER5.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER5.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER5.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH5.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH5.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH5.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH5.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH5.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH5.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH5.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH5.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH5.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH5.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH5.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH5.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH5.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH5.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH5.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH5.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH5.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH5.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH5.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH5.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH5.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH5.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH5.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH5.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH5.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH5.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[23:20]),   // Templated
             .active    (`PC_CMP.active_thread[23:20]), // Templated
             .finish    (`PC_CMP.finish_mask[23:20]), // Templated
             .lda_internal_e  (`ASIPATH5.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH5.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH5.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH5.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH5.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH5.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH5.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH5.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH5.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH5.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH5.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH5.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH5.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH5.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH5.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH5.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH5.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH5.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH5.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH5.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH5.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH5.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH5.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH5.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH5.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH5.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH5.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH5.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH5.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH5.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH5.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH5.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH5.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH5.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH5.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH5.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH5.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH5.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH5.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH5.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH5.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH5.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH5.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH5.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH5.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH5.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH5.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH5.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH5.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH5.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH5.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH5.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH5.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH5.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH5.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH5.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH5.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH5.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH5.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH5.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH5.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH5.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH5.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH5.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH5.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc5_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH5.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH5.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH5.tl0_en),   // Templated
             .tl1_en    (`TLPATH5.tl1_en),   // Templated
             .tl2_en    (`TLPATH5.tl2_en),   // Templated
             .tl3_en    (`TLPATH5.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH5.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH5.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH5.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH5.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH5.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH5.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH5.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH5.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH5.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH5.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH5.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH5.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH5.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH5.restore_pstate3), // Templated
             .tick0_en    (`TLPATH5.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH5.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH5.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH5.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH5.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH5.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH5.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH5.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH5.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH5.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH5.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH5.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH5.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH5.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH5.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH5.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH5.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH5.din),   // Templated
             .write_mask0   (`TS0PATH5.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH5.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH5.din),   // Templated
             .write_mask1   (`TS1PATH5.write_mask),  // Templated
             .cpu_id    (5),       // Templated
             .next_t0_inrr_i1 (`INTPATH5.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH5.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH5.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH5.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH5.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH5.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH5.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH5.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH5.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH5.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH5.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH5.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH5.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH5.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH5.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH5.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH5.pil0_en),  // Templated
             .pil1_en   (`TLPATH5.pil1_en),  // Templated
             .pil2_en   (`TLPATH5.pil2_en),  // Templated
             .pil3_en   (`TLPATH5.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH5.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH5.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH5.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH5.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH5.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH5.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH5.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH5.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH5.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH5.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH5.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH5.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH5.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH5.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH5.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH5.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH5.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH5.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH5.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH5.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH5.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH5.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH5.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH5.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH5.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH5.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH5.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH5.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC5
`ifdef RTL_SPARC6
sas_task task6 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH6.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH6.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH6.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH6.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH6.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH6.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH6.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH6.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH6.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH6.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH6.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH6.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH6.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH6.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH6.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH6.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH6.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH6.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH6.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH6.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH6.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH6.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH6.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH6.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH6.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH6.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH6.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH6.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH6.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH6.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH6.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH6.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH6.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH6.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH6.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH6.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH6.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH6.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH6.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH6.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH6.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH6.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH6.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH6.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH6.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH6.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH6.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH6.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH6.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH6.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH6.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH6.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH6.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH6.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH6.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH6.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH6.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH6.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH6.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH6.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH6.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH6.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH6.errctl.ceen), // Templated
             .nceen   (`IFUPATH6.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH6.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH6.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH6.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH6.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH6.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH6.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH6.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH6.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH6.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH6.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH6.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH6.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH6.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH6.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH6.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH6.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH6.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH6.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH6.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH6.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH6.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH6.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH6.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH6.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH6.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH6.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH6.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH6.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH6.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH6.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH6.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH6.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH6.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH6.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH6.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH6.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH6.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH6.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH6.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH6.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH6.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH6.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH6.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH6.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH6.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH6.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH6.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH6.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH6.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH6.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH6.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH6.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH6.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH6.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH6.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH6.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH6.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH6.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH6.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH6.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH6.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH6.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH6.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[27:24]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH6.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH6.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH6.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH6.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH6.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH6.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH6.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH6.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH6.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH6.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH6.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH6.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH6.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH6.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH6.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH6.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH6.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH6.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH6.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH6.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH6.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH6.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH6.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH6.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH6.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH6.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH6.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH6.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH6.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH6.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH6.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH6.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH6.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH6.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH6.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH6.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH6.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH6.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH6.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH6.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH6.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH6.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH6.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH6.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH6.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH6.sftint0),   // Templated
             .sftint1   (`TDPPATH6.sftint1),   // Templated
             .sftint2   (`TDPPATH6.sftint2),   // Templated
             .sftint3   (`TDPPATH6.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH6.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH6.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH6.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH6.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH6.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH6.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH6.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH6.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH6.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH6.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH6.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH6.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH6.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH6.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH6.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH6.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH6.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH6.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH6.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH6.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH6.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH6.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH6.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH6.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH6.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH6.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH6.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH6.tick_npt3),  // Templated
             .true_tick   (`TDPPATH6.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER6.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER6.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER6.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER6.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH6.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH6.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH6.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH6.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH6.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH6.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH6.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH6.true_htba0),  // Templated
             .true_htba1    (`TDPPATH6.true_htba1),  // Templated
             .true_htba2    (`TDPPATH6.true_htba2),  // Templated
             .true_htba3    (`TDPPATH6.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH6.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH6.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH6.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH6.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH6.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER6.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH6.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH6.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH6.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH6.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER6.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER6.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER6.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER6.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER6.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER6.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER6.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER6.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH6.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH6.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH6.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH6.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH6.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH6.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH6.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH6.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH6.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH6.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH6.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH6.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH6.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH6.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH6.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH6.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH6.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH6.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH6.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH6.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH6.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH6.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH6.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH6.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH6.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH6.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[27:24]),   // Templated
             .active    (`PC_CMP.active_thread[27:24]), // Templated
             .finish    (`PC_CMP.finish_mask[27:24]), // Templated
             .lda_internal_e  (`ASIPATH6.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH6.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH6.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH6.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH6.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH6.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH6.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH6.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH6.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH6.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH6.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH6.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH6.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH6.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH6.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH6.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH6.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH6.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH6.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH6.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH6.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH6.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH6.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH6.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH6.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH6.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH6.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH6.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH6.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH6.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH6.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH6.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH6.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH6.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH6.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH6.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH6.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH6.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH6.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH6.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH6.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH6.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH6.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH6.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH6.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH6.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH6.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH6.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH6.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH6.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH6.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH6.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH6.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH6.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH6.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH6.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH6.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH6.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH6.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH6.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH6.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH6.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH6.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH6.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH6.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc6_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH6.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH6.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH6.tl0_en),   // Templated
             .tl1_en    (`TLPATH6.tl1_en),   // Templated
             .tl2_en    (`TLPATH6.tl2_en),   // Templated
             .tl3_en    (`TLPATH6.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH6.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH6.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH6.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH6.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH6.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH6.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH6.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH6.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH6.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH6.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH6.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH6.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH6.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH6.restore_pstate3), // Templated
             .tick0_en    (`TLPATH6.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH6.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH6.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH6.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH6.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH6.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH6.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH6.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH6.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH6.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH6.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH6.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH6.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH6.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH6.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH6.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH6.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH6.din),   // Templated
             .write_mask0   (`TS0PATH6.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH6.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH6.din),   // Templated
             .write_mask1   (`TS1PATH6.write_mask),  // Templated
             .cpu_id    (6),       // Templated
             .next_t0_inrr_i1 (`INTPATH6.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH6.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH6.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH6.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH6.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH6.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH6.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH6.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH6.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH6.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH6.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH6.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH6.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH6.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH6.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH6.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH6.pil0_en),  // Templated
             .pil1_en   (`TLPATH6.pil1_en),  // Templated
             .pil2_en   (`TLPATH6.pil2_en),  // Templated
             .pil3_en   (`TLPATH6.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH6.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH6.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH6.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH6.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH6.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH6.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH6.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH6.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH6.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH6.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH6.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH6.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH6.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH6.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH6.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH6.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH6.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH6.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH6.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH6.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH6.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH6.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH6.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH6.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH6.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH6.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH6.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH6.ifu_tlu_ttype_vld_m)); // Templated
`endif // ifdef RTL_SPARC6
`ifdef RTL_SPARC7
sas_task task7 (/*AUTOINST*/
             // Inputs
             .tlu_pich_wrap_flg_m (`TLUPATH7.tcl.tlu_pich_wrap_flg_m), // Templated
             .tlu_pic_cnt_en_m  (`TLUPATH7.tcl.tlu_pic_cnt_en_m), // Templated
             .final_ttype_sel_g (`TLUPATH7.tcl.final_ttype_sel_g), // Templated
             .rst_ttype_w2  (`TLUPATH7.tcl.rst_ttype_w2), // Templated
             .sync_trap_taken_m (`TLUPATH7.tcl.sync_trap_taken_m), // Templated
             .pib_picl_wrap (`TLUPATH7.pib_picl_wrap), // Templated
             .pib_pich_wrap_m (`TLUPATH7.tcl.pib_pich_wrap_m), // Templated
             .pib_pich_wrap (`TLUPATH7.pib_pich_wrap), // Templated
             .pic_wrap_trap_g (`TLUPATH7.tcl.pib_wrap_trap_g), // Templated
             .pib_wrap_trap_m (`TLUPATH7.tcl.pib_wrap_trap_m), // Templated
             .pcr_rw_e    (`TLUPATH7.tlu_pib.pcr_rw_e), // Templated
             .tlu_rsr_inst_e  (`TLUPATH7.tlu_pib.tlu_rsr_inst_e), // Templated
             .pcr0    (`TLUPATH7.tlu_pib.pcr0), // Templated
             .pcr1    (`TLUPATH7.tlu_pib.pcr1), // Templated
             .pcr2    (`TLUPATH7.tlu_pib.pcr2), // Templated
             .pcr3    (`TLUPATH7.tlu_pib.pcr3), // Templated
             .wsr_pcr_sel   (`TLUPATH7.tlu_pib.wsr_pcr_sel), // Templated
             .pich_cnt0   (`TLUPATH7.tlu_pib.pich_cnt0), // Templated
             .pich_cnt1   (`TLUPATH7.tlu_pib.pich_cnt1), // Templated
             .pich_cnt2   (`TLUPATH7.tlu_pib.pich_cnt2), // Templated
             .pich_cnt3   (`TLUPATH7.tlu_pib.pich_cnt3), // Templated
             .picl_cnt0   (`TLUPATH7.tlu_pib.picl_cnt0), // Templated
             .picl_cnt1   (`TLUPATH7.tlu_pib.picl_cnt1), // Templated
             .picl_cnt2   (`TLUPATH7.tlu_pib.picl_cnt2), // Templated
             .picl_cnt3   (`TLUPATH7.tlu_pib.picl_cnt3), // Templated
             .update_pich_sel (`TLUPATH7.tlu_pib.update_pich_sel), // Templated
             .update_picl_sel (`TLUPATH7.tlu_pib.update_picl_sel), // Templated
             .const_maskid  (`PCXPATH7.ifu.fdp.const_maskid), // Templated
             .fprs_sel_wrt  (`PCXPATH7.ifu.swl.fprs_sel_wrt), // Templated
             .fprs_sel_set  (`PCXPATH7.ifu.swl.fprs_sel_set), // Templated
             .fprs_wrt_data (`PCXPATH7.ifu.swl.fprs_wrt_data), // Templated
             .new_fprs    (`PCXPATH7.ifu.swl.new_fprs), // Templated
             .ifu_lsu_pref_inst_e (`PCXPATH7.ifu_lsu_pref_inst_e), // Templated
             .formatted_tte_data  (`PCXPATH7.ifu.errdp.formatted_tte_data), // Templated
             .dformatted_tte_data (`PCXPATH7.lsu.tlbdp.formatted_tte_data), // Templated
             .dtlb_cam_vld  (`PCXPATH7.lsu.dtlb.tlb_cam_vld), // Templated
             .dtlb_tte_vld_g  (`PCXPATH7.lsu.excpctl.tlb_tte_vld_g), // Templated
             .tlu_hpstate_priv  (`PCXPATH7.tlu_hpstate_priv), // Templated
             .tlu_hpstate_enb (`PCXPATH7.tlu_hpstate_enb), // Templated
             .fcl_dtu_inst_vld_d  (`PCXPATH7.ifu.fcl_dtu_inst_vld_d), // Templated
             .icache_hit    (`PCXPATH7.ifu.itlb.cache_hit), // Templated
             .xlate_en    (`PCXPATH7.ifu.fcl.xlate_en), // Templated
             .ifu_lsu_thrid_s (`PCXPATH7.ifu_lsu_thrid_s), // Templated
             .fcl_ifq_icmiss_s1 (`IFUPATH7.fcl.fcl_ifq_icmiss_s1), // Templated
             .tlu_exu_early_flush_pipe_w(`PCXPATH7.tlu_exu_early_flush_pipe_w), // Templated
             .rst_hwint_ttype_g (`TLUPATH7.tcl.rst_hwint_ttype_g), // Templated
             .trap_taken_g  (`TLUPATH7.tcl.trap_taken_g), // Templated
             .spu_lsu_ldxa_illgl_va_w2(`PCXPATH7.spu.spu_ctl.spu_lsu_ldxa_illgl_va_w2), // Templated
             .spu_lsu_ldxa_data_vld_w2(`PCXPATH7.spu.spu_ctl.spu_lsu_ldxa_data_vld_w2), // Templated
             .spu_lsu_ldxa_tid_w2 (`PCXPATH7.spu.spu_ctl.spu_lsu_ldxa_tid_w2), // Templated
             .mra_field1_en (`TLUPATH7.mmu_ctl.mra_field1_en), // Templated
             .mra_field2_en (`TLUPATH7.mmu_ctl.mra_field2_en), // Templated
             .mra_field3_en (`TLUPATH7.mmu_ctl.mra_field3_en), // Templated
             .mra_field4_en (`TLUPATH7.mmu_ctl.mra_field4_en), // Templated
             .pmem_unc_error_g  (`PCXPATH7.lsu.dctl.pmem_unc_error_g), // Templated
             .pc_f    (`PCXPATH7.ifu.fdp.pc_f), // Templated
             .cam_vld_f   (`PCXPATH7.ifu.fcl.cam_vld_f), // Templated
             .cam_vld   (`PCXPATH7.lsu.dtlb.cam_vld), // Templated
             .defr_trp_taken_m_din(`PCXPATH7.lsu.excpctl.defr_trp_taken_m_din), // Templated
             .illgl_va_vld_or_drop_ldxa2masync(`SPUPATH7.spu_ctl.spu_mactl.illgl_va_vld_or_drop_ldxa2masync), // Templated
             .ecc_wen   (`PCXPATH7.ffu.ctl.ecc_wen), // Templated
             .fpdis_trap_e  (`IFUPATH7.dec.fpdis_trap_e), // Templated
             .ceen    (`IFUPATH7.errctl.ceen), // Templated
             .nceen   (`IFUPATH7.errctl.nceen), // Templated
             .ifu_tlu_flush_m (`TLUPATH7.ifu_tlu_flush_m), // Templated
             .lsu_tlu_ttype_m2  (`TLUPATH7.lsu_tlu_ttype_m2), // Templated
             .lsu_tlu_ttype_vld_m2(`TLUPATH7.lsu_tlu_ttype_vld_m2), // Templated
             .tlu_final_ttype_w2  (`TLUPATH7.tlu_final_ttype_w2), // Templated
             .tlu_ifu_trappc_vld_w1(`TLUPATH7.tlu_ifu_trappc_vld_w1), // Templated
             .mra_wr_ptr    (`TLUPATH7.mra_wr_ptr),  // Templated
             .mra_wr_vld    (`TLUPATH7.mra_wr_vld),  // Templated
             .lsu_pid_state0  (`PCXPATH7.lsu.lsu_pid_state0), // Templated
             .lsu_pid_state1  (`PCXPATH7.lsu.lsu_pid_state1), // Templated
             .lsu_pid_state2  (`PCXPATH7.lsu.lsu_pid_state2), // Templated
             .lsu_pid_state3  (`PCXPATH7.lsu.lsu_pid_state3), // Templated
             .pid_state_wr_en (`PCXPATH7.lsu.pid_state_wr_en), // Templated
             .lsu_t0_pctxt_state  (`PCXPATH7.lsu.lsu_t0_pctxt_state), // Templated
             .lsu_t1_pctxt_state  (`PCXPATH7.lsu.lsu_t1_pctxt_state), // Templated
             .lsu_t2_pctxt_state  (`PCXPATH7.lsu.lsu_t2_pctxt_state), // Templated
             .lsu_t3_pctxt_state  (`PCXPATH7.lsu.lsu_t3_pctxt_state), // Templated
             .pctxt_state_wr_thrd (`PCXPATH7.lsu.pctxt_state_wr_thrd), // Templated
             .sctxt_state0  (`PCXPATH7.lsu.dctldp.sctxt_state0), // Templated
             .sctxt_state1  (`PCXPATH7.lsu.dctldp.sctxt_state1), // Templated
             .sctxt_state2  (`PCXPATH7.lsu.dctldp.sctxt_state2), // Templated
             .sctxt_state3  (`PCXPATH7.lsu.dctldp.sctxt_state3), // Templated
             .sctxt_state_wr_thrd (`PCXPATH7.lsu.dctldp.sctxt_state_wr_thrd), // Templated
             .va_wtchpt0_addr (`PCXPATH7.lsu.qdp1.va_wtchpt0_addr), // Templated
             .va_wtchpt1_addr (`PCXPATH7.lsu.qdp1.va_wtchpt1_addr), // Templated
             .va_wtchpt2_addr (`PCXPATH7.lsu.qdp1.va_wtchpt2_addr), // Templated
             .va_wtchpt3_addr (`PCXPATH7.lsu.qdp1.va_wtchpt3_addr), // Templated
             .lsu_va_wtchpt0_wr_en_l(`PCXPATH7.lsu.lsu_va_wtchpt0_wr_en_l), // Templated
             .lsu_va_wtchpt1_wr_en_l(`PCXPATH7.lsu.lsu_va_wtchpt1_wr_en_l), // Templated
             .lsu_va_wtchpt2_wr_en_l(`PCXPATH7.lsu.lsu_va_wtchpt2_wr_en_l), // Templated
             .lsu_va_wtchpt3_wr_en_l(`PCXPATH7.lsu.lsu_va_wtchpt3_wr_en_l), // Templated
             .ifu_rstint_m  (`TLPATH7.ifu_rstint_m), // Templated
             .spu_tlu_rsrv_illgl_m(`PCXPATH7.tlu.spu_tlu_rsrv_illgl_m), // Templated
             .cam_vld_s1    (`IFUPATH7.fcl.cam_vld_s1), // Templated
             .val_thr_s1    (`IFUPATH7.fcl.val_thr_s1), // Templated
             .pc_s    (`IFUPATH7.fdp.pc_s),  // Templated
             .rs2_fst_ue_w3 (`PCXPATH7.ffu.ctl.rs2_fst_ue_w3), // Templated
             .rs2_fst_ce_w3 (`PCXPATH7.ffu.ctl.rs2_fst_ce_w3), // Templated
             .lsu_tlu_async_ttype_vld_w2(`PCXPATH7.lsu_tlu_async_ttype_vld_w2), // Templated
             .lsu_tlu_defr_trp_taken_g(`PCXPATH7.lsu_tlu_defr_trp_taken_g), // Templated
             .lsu_tlu_async_ttype_w2(`PCXPATH7.lsu_tlu_async_ttype_w2), // Templated
             .lsu_tlu_async_tid_w2(`PCXPATH7.lsu_tlu_async_tid_w2), // Templated
             .itlb_rw_index (`PCXPATH7.ifu.itlb.tlb_rw_index), // Templated
             .itlb_rw_index_vld (`PCXPATH7.ifu.itlb.tlb_rw_index_vld), // Templated
             .itlb_rd_tte_tag (`PCXPATH7.ifu.itlb.tlb_rd_tte_tag), // Templated
             .itlb_rd_tte_data  (`PCXPATH7.ifu.itlb.rd_tte_data), // Templated
             .icam_hit    (`PCXPATH7.ifu.itlb.cam_hit), // Templated
             .dtlb_rw_index (`PCXPATH7.lsu.dtlb.tlb_rw_index), // Templated
             .dtlb_rw_index_vld (`PCXPATH7.lsu.dtlb.tlb_rw_index_vld), // Templated
             .dtlb_rd_tte_tag (`PCXPATH7.lsu.dtlb.tlb_rd_tte_tag), // Templated
             .dtlb_rd_tte_data  (`PCXPATH7.lsu.dtlb.rd_tte_data), // Templated
             .dcam_hit    (`PCXPATH7.lsu.dtlb.cam_hit), // Templated
             .wrt_spec_w    (`IFUPATH7.swl.wrt_spec_w), // Templated
             .spc_pcx_data_pa (`TOP_DESIGN.pcx_iob_data_px2), // Templated
             .fcl_fdp_inst_sel_nop_s_l(`IFUPATH7.fdp.fcl_fdp_inst_sel_nop_s_l), // Templated
             .retract_iferr_d (`IFUPATH7.swl.retract_iferr_d), // Templated
             .inst_vld_w    (`INSTPATH7.inst_vld_w), // Templated
             .dmmu_async_illgl_va_g(`TLUPATH7.mmu_ctl.dmmu_async_illgl_va_g), // Templated
             .immu_async_illgl_va_g(`TLUPATH7.mmu_ctl.immu_async_illgl_va_g), // Templated
             .lsu_tlu_tlb_ld_inst_m(`TLUPATH7.mmu_ctl.lsu_tlu_tlb_ld_inst_m), // Templated
             .lsu_tlu_tlb_st_inst_m(`TLUPATH7.mmu_ctl.lsu_tlu_tlb_st_inst_m), // Templated
             .immu_sfsr_wr_en_l (`TLUPATH7.immu_sfsr_wr_en_l), // Templated
             .dmmu_sfsr_wr_en_l (`TLUPATH7.dmmu_sfsr_wr_en_l), // Templated
             .dmmu_sfar_wr_en_l (`TLUPATH7.dmmu_sfar_wr_en_l), // Templated
             .lsu_quad_asi_e  (`SPCPATH7.lsu.lsu_quad_asi_e), // Templated
             .clk     (clk),       // Templated
             .rst_l   (rst_l),     // Templated
             .back    (`PC_CMP.back_thread[31:28]), // Templated
             .lsu_ifu_ldsta_internal_e(`IFUPATH7.lsu_ifu_ldsta_internal_e), // Templated
             .lsu_mmu_flush_pipe_w(`TLUPATH7.lsu_mmu_flush_pipe_w), // Templated
             .dtlb_wr_vld   (`DTLBPATH7.tlb_wr_vld), // Templated
             .dtlb_demap    (`DTLBPATH7.tlb_demap),  // Templated
             .dtlb_rd_tag_vld (`DTLBPATH7.tlb_rd_tag_vld), // Templated
             .dtlb_rd_data_vld  (`DTLBPATH7.tlb_rd_data_vld), // Templated
             .dtlb_entry_vld  (`DTLBPATH7.tlb_entry_vld), // Templated
             .itlb_wr_vld   (`ITLBPATH7.tlb_wr_vld), // Templated
             .itlb_demap    (`ITLBPATH7.tlb_demap),  // Templated
             .itlb_rd_tag_vld (`ITLBPATH7.tlb_rd_tag_vld), // Templated
             .itlb_rd_data_vld  (`ITLBPATH7.tlb_rd_data_vld), // Templated
             .itlb_entry_vld  (`ITLBPATH7.tlb_entry_vld), // Templated
             .tlb_access_tid_g  (`TLUPATH7.mmu_ctl.tlb_access_tid_g), // Templated
             .dsfar0_clk    (`TLUPATH7.mmu_dp.dsfar0_clk), // Templated
             .dsfar1_clk    (`TLUPATH7.mmu_dp.dsfar1_clk), // Templated
             .dsfar2_clk    (`TLUPATH7.mmu_dp.dsfar2_clk), // Templated
             .dsfar3_clk    (`TLUPATH7.mmu_dp.dsfar3_clk), // Templated
             .dsfar_din   (`TLUPATH7.mmu_dp.dsfar_din), // Templated
             .dtu_inst_d    (`IFUPATH7.dec.dtu_inst_d), // Templated
             .local_rdpr_mx1_sel  (`TLPATH7.local_rdpr_mx1_sel), // Templated
             .tlu_rdpr_mx5_sel  (`TLPATH7.tlu_rdpr_mx5_sel), // Templated
             .tlu_rdpr_mx7_sel  (`TLPATH7.tlu_rdpr_mx7_sel), // Templated
             .tlu_rst_l   (`TLPATH7.tlu_rst_l),  // Templated
             .tick_match    (`TDPPATH7.tick_match),  // Templated
             .tlu_wr_sftint_l_g (`TLUPATH7.tlu_wr_sftint_l_g), // Templated
             .dsfsr_din   (`TLUPATH7.mmu_dp.dsfsr_din), // Templated
             .dsfsr0_clk    (`TLUPATH7.mmu_dp.dsfsr0_clk), // Templated
             .dsfsr1_clk    (`TLUPATH7.mmu_dp.dsfsr1_clk), // Templated
             .dsfsr2_clk    (`TLUPATH7.mmu_dp.dsfsr2_clk), // Templated
             .dsfsr3_clk    (`TLUPATH7.mmu_dp.dsfsr3_clk), // Templated
             .isfsr_din   (`TLUPATH7.mmu_dp.isfsr_din), // Templated
             .isfsr0_clk    (`TLUPATH7.mmu_dp.isfsr0_clk), // Templated
             .isfsr1_clk    (`TLUPATH7.mmu_dp.isfsr1_clk), // Templated
             .isfsr2_clk    (`TLUPATH7.mmu_dp.isfsr2_clk), // Templated
             .isfsr3_clk    (`TLUPATH7.mmu_dp.isfsr3_clk), // Templated
             .ecl_byp_sel_ecc_w (`IFUPATH7.errctl.irf_ce_unq), // Templated
             .ifu_exu_inst_w  (`INSTPATH7.ifu_exu_inst_vld_w), // Templated
             .ctl_dp_fp_thr (`FLOATPATH7.ctl_dp_fp_thr), // Templated
             .ifu_ffu_fst_d (`FLOATPATH7.ifu_ffu_fst_d), // Templated
             .pc_e    (`DTUPATH7.pc_e),  // Templated
             .fcl_dtu_inst_vld_e  (`INSTPATH7.fcl_dtu_inst_vld_e), // Templated
             .exu_lsu_rs3_data_e  (`PCXPATH7.exu_lsu_rs3_data_e), // Templated
             .tick_ctl_din  (`TLPATH7.tick_ctl_din), // Templated
             .ifu_tlu_ttype_m (`PCXPATH7.ifu_tlu_ttype_m), // Templated
             .tlu_rerr_vld  (`PCXPATH7.tlu_rerr_vld), // Templated
             .sftint0   (`TDPPATH7.sftint0),   // Templated
             .sftint1   (`TDPPATH7.sftint1),   // Templated
             .sftint2   (`TDPPATH7.sftint2),   // Templated
             .sftint3   (`TDPPATH7.sftint3),   // Templated
             .sftint0_clk   (`TDPPATH7.sftint0_clk), // Templated
             .sftint1_clk   (`TDPPATH7.sftint1_clk), // Templated
             .sftint2_clk   (`TDPPATH7.sftint2_clk), // Templated
             .sftint3_clk   (`TDPPATH7.sftint3_clk), // Templated
             .sftint_b0_en  (`TDPPATH7.sftint_b0_en), // Templated
             .sftint_b15_en (`TDPPATH7.sftint_b15_en), // Templated
             .sftint_b16_en (`TDPPATH7.sftint_b16_en), // Templated
             .cpx_spc_data_cx2  (`PCXPATH7.cpx_spc_data_cx2), // Templated
             .ifu_exu_save_d  (`PCXPATH7.ifu_exu_save_d), // Templated
             .ifu_exu_restore_d (`PCXPATH7.ifu_exu_restore_d), // Templated
             .ifu_tlu_thrid_d (`PCXPATH7.ifu_tlu_thrid_d), // Templated
             .tlu_ifu_hwint_i3  (`TLUPATH7.tlu_ifu_hwint_i3), // Templated
             .ifu_tlu_hwint_m (`TLUPATH7.ifu_tlu_hwint_m), // Templated
             .ifu_tlu_rstint_m  (`TLUPATH7.ifu_tlu_rstint_m), // Templated
             .ifu_tlu_swint_m (`TLUPATH7.ifu_tlu_swint_m), // Templated
             .tlu_ifu_flush_pipe_w(`TLPATH7.tlu_ifu_flush_pipe_w), // Templated
             .ifu_tlu_flush_w (`PCXPATH7.ifu_tlu_flush_w), // Templated
             .ffu_ifu_fst_ce_w  (`PCXPATH7.ffu_ifu_fst_ce_w), // Templated
             .ffu_ifu_ecc_ue_w2 (`PCXPATH7.ffu.ffu_ifu_ecc_ue_w2), // Templated
             .ffu_ifu_ecc_ce_w2 (`PCXPATH7.ffu.ffu_ifu_ecc_ce_w2), // Templated
             .any_err_vld   (`IFUPATH7.errctl.any_err_vld), // Templated
             .any_ue_vld    (`IFUPATH7.errctl.any_ue_vld), // Templated
             .tsa_htstate_en  (`TLPATH7.tsa_htstate_en), // Templated
             .stickcmp_intdis_en  (`TDPPATH7.stickcmp_intdis_en), // Templated
             .tick_npt0   (`TLPATH7.tick_npt0),  // Templated
             .tick_npt1   (`TLPATH7.tick_npt1),  // Templated
             .tick_npt2   (`TLPATH7.tick_npt2),  // Templated
             .tick_npt3   (`TLPATH7.tick_npt3),  // Templated
             .true_tick   (`TDPPATH7.true_tick),   // Templated
             .htick_intdis0 (`TLU_HYPER7.htick_intdis0), // Templated
             .htick_intdis1 (`TLU_HYPER7.htick_intdis1), // Templated
             .htick_intdis2 (`TLU_HYPER7.htick_intdis2), // Templated
             .htick_intdis3 (`TLU_HYPER7.htick_intdis3), // Templated
             .true_stickcmp0  (`TDPPATH7.true_stickcmp0), // Templated
             .true_stickcmp1  (`TDPPATH7.true_stickcmp1), // Templated
             .true_stickcmp2  (`TDPPATH7.true_stickcmp2), // Templated
             .true_stickcmp3  (`TDPPATH7.true_stickcmp3), // Templated
             .tlu_hintp_en_l_g  (`TDPPATH7.tlu_hintp_en_l_g), // Templated
             .tlu_hintp   (`TDPPATH7.tlu_hintp),   // Templated
             .tlu_htba_en_l (`TDPPATH7.tlu_htba_en_l), // Templated
             .true_htba0    (`TDPPATH7.true_htba0),  // Templated
             .true_htba1    (`TDPPATH7.true_htba1),  // Templated
             .true_htba2    (`TDPPATH7.true_htba2),  // Templated
             .true_htba3    (`TDPPATH7.true_htba3),  // Templated
             .update_hpstate_l_w2 (`TDPPATH7.tlu_update_hpstate_l_w2[3:0]), // Templated
             .restore_hpstate0  (`TDPPATH7.restore_hpstate0), // Templated
             .restore_hpstate1  (`TDPPATH7.restore_hpstate1), // Templated
             .restore_hpstate2  (`TDPPATH7.restore_hpstate2), // Templated
             .restore_hpstate3  (`TDPPATH7.restore_hpstate3), // Templated
             .htickcmp_intdis_en  (`TLU_HYPER7.htickcmp_intdis_en), // Templated
             .true_htickcmp0  (`TDPPATH7.true_htickcmp0), // Templated
             .true_htickcmp1  (`TDPPATH7.true_htickcmp1), // Templated
             .true_htickcmp2  (`TDPPATH7.true_htickcmp2), // Templated
             .true_htickcmp3  (`TDPPATH7.true_htickcmp3), // Templated
             .gl0_en    (`TLU_HYPER7.gl0_en),  // Templated
             .gl1_en    (`TLU_HYPER7.gl1_en),  // Templated
             .gl2_en    (`TLU_HYPER7.gl2_en),  // Templated
             .gl3_en    (`TLU_HYPER7.gl3_en),  // Templated
             .gl_lvl0_new   (`TLU_HYPER7.gl_lvl0_new), // Templated
             .gl_lvl1_new   (`TLU_HYPER7.gl_lvl1_new), // Templated
             .gl_lvl2_new   (`TLU_HYPER7.gl_lvl2_new), // Templated
             .gl_lvl3_new   (`TLU_HYPER7.gl_lvl3_new), // Templated
             .t0_gsr_nxt    (`FFUPATH7.dp.t0_gsr_nxt), // Templated
             .t0_gsr_rnd_next (`FFUPATH7.ctl.visctl.t0_gsr_rnd_next), // Templated
             .t0_gsr_align_next (`FFUPATH7.ctl.visctl.t0_gsr_align_next), // Templated
             .t0_gsr_wsr_w  (`FFUPATH7.ctl.visctl.t0_gsr_wsr_w2), // Templated
             .t0_siam_w   (`FFUPATH7.ctl.visctl.t0_siam_w2), // Templated
             .t0_alignaddr_w  (`FFUPATH7.ctl.visctl.t0_alignaddr_w2), // Templated
             .t1_gsr_nxt    (`FFUPATH7.dp.t1_gsr_nxt), // Templated
             .t1_gsr_rnd_next (`FFUPATH7.ctl.visctl.t1_gsr_rnd_next), // Templated
             .t1_gsr_align_next (`FFUPATH7.ctl.visctl.t1_gsr_align_next), // Templated
             .t1_gsr_wsr_w  (`FFUPATH7.ctl.visctl.t1_gsr_wsr_w2), // Templated
             .t1_siam_w   (`FFUPATH7.ctl.visctl.t1_siam_w2), // Templated
             .t1_alignaddr_w  (`FFUPATH7.ctl.visctl.t1_alignaddr_w2), // Templated
             .t2_gsr_nxt    (`FFUPATH7.dp.t2_gsr_nxt), // Templated
             .t2_gsr_rnd_next (`FFUPATH7.ctl.visctl.t2_gsr_rnd_next), // Templated
             .t2_gsr_align_next (`FFUPATH7.ctl.visctl.t2_gsr_align_next), // Templated
             .t2_gsr_wsr_w  (`FFUPATH7.ctl.visctl.t2_gsr_wsr_w2), // Templated
             .t2_siam_w   (`FFUPATH7.ctl.visctl.t2_siam_w2), // Templated
             .t2_alignaddr_w  (`FFUPATH7.ctl.visctl.t2_alignaddr_w2), // Templated
             .t3_gsr_nxt    (`FFUPATH7.dp.t3_gsr_nxt), // Templated
             .t3_gsr_rnd_next (`FFUPATH7.ctl.visctl.t3_gsr_rnd_next), // Templated
             .t3_gsr_align_next (`FFUPATH7.ctl.visctl.t3_gsr_align_next), // Templated
             .t3_gsr_wsr_w  (`FFUPATH7.ctl.visctl.t3_gsr_wsr_w2), // Templated
             .t3_siam_w   (`FFUPATH7.ctl.visctl.t3_siam_w2), // Templated
             .t3_alignaddr_w  (`FFUPATH7.ctl.visctl.t3_alignaddr_w2), // Templated
             .exu_lsu_ldst_va_e (`ASIDPPATH7.exu_lsu_ldst_va_e[47:0]), // Templated
             .asi_state_e   (`ASIDPPATH7.asi_state_e[7:0]), // Templated
             .cpu_num   (cpu_num),     // Templated
             .good    (`PC_CMP.good[31:28]),   // Templated
             .active    (`PC_CMP.active_thread[31:28]), // Templated
             .finish    (`PC_CMP.finish_mask[31:28]), // Templated
             .lda_internal_e  (`ASIPATH7.lda_internal_e), // Templated
             .sta_internal_e  (`ASIPATH7.sta_internal_e), // Templated
             .ifu_spu_trap_ack  ({1'b0,`SPCPATH7.ifu_spu_trap_ack}), // Templated
             .ifu_exu_muls_d  (`SPCPATH7.ifu_exu_muls_d), // Templated
             .ifu_exu_tid_s2  (`EXUPATH7.ifu_exu_tid_s2[1:0]), // Templated
             .rml_irf_restore_local_m(`EXUPATH7.irf.swap_local_w), // Templated
             .rml_irf_cwp_m (`EXUPATH7.irf.old_lo_cwp_m[2:0]), // Templated
             .rml_irf_save_local_m(`EXUPATH7.irf.swap_local_m), // Templated
             .rml_irf_thr_m (`EXUPATH7.irf.cwpswap_tid_m[1:0]), // Templated
             .ifu_exu_save_e  (`EXUPATH7.rml.save_e),  // Templated
             .exu_tlu_spill_e (`EXUPATH7.rml.exu_tlu_spill_e), // Templated
             .t0_fsr_nxt    (`FLOATPATH7.dp.t0_fsr_nxt[27:0]), // Templated
             .t1_fsr_nxt    (`FLOATPATH7.dp.t1_fsr_nxt[27:0]), // Templated
             .t2_fsr_nxt    (`FLOATPATH7.dp.t2_fsr_nxt[27:0]), // Templated
             .t3_fsr_nxt    (`FLOATPATH7.dp.t3_fsr_nxt[27:0]), // Templated
             .ctl_dp_fsr_sel_old  (`FLOATPATH7.ctl_dp_fsr_sel_old[3:0]), // Templated
             .tlu_sftint_en_l_g (`TLUPATH7.tlu_sftint_en_l_g[3:0]), // Templated
             .true_tickcmp0 (`TDPPATH7.true_tickcmp0), // Templated
             .true_tickcmp1 (`TDPPATH7.true_tickcmp1), // Templated
             .true_tickcmp2 (`TDPPATH7.true_tickcmp2), // Templated
             .true_tickcmp3 (`TDPPATH7.true_tickcmp3), // Templated
             .tickcmp_intdis_en (`TDPPATH7.tickcmp_intdis_en[3:0]), // Templated
             .dtu_fdp_rdsr_sel_thr_e_l(`DTUPATH7.fcl_fdp_rdsr_sel_thr_e_l), // Templated
             .ifu_exu_rd_ifusr_e  (`EXUPATH7.ifu_exu_rd_ifusr_e), // Templated
             .ifu_exu_use_rsr_e_l (`EXUPATH7.ifu_exu_use_rsr_e_l), // Templated
             .rml_irf_global_tid  (`EXUPATH7.irf.rml_irf_global_tid[1:0]), // Templated
             .ecl_irf_wen_w (`REGPATH7.ecl_irf_wen_w), // Templated
             .ecl_irf_wen_w2  (`REGPATH7.ecl_irf_wen_w2), // Templated
             .byp_irf_rd_data_w (`REGPATH7.byp_irf_rd_data_w[71:0]), // Templated
             .byp_irf_rd_data_w2  (`REGPATH7.byp_irf_rd_data_w2[71:0]), // Templated
             .thr_rd_w    (`REGPATH7.thr_rd_w[4:0]), // Templated
             .thr_rd_w2   (`REGPATH7.thr_rd_w2[4:0]), // Templated
             .ecl_irf_tid_w (`REGPATH7.ecl_irf_tid_w[1:0]), // Templated
             .ecl_irf_tid_w2  (`REGPATH7.ecl_irf_tid_w2[1:0]), // Templated
             .ifu_tlu_thrid_w (`SPCPATH7.ifu.fcl.sas_thrid_w[1:0]), // Templated
             .wen_thr0_l    (`CCRPATH7.wen_thr0_l),  // Templated
             .wen_thr1_l    (`CCRPATH7.wen_thr1_l),  // Templated
             .wen_thr2_l    (`CCRPATH7.wen_thr2_l),  // Templated
             .wen_thr3_l    (`CCRPATH7.wen_thr3_l),  // Templated
             .ccrin_thr0    (`CCRPATH7.ccrin_thr0[7:0]), // Templated
             .ccrin_thr1    (`CCRPATH7.ccrin_thr1[7:0]), // Templated
             .ccrin_thr2    (`CCRPATH7.ccrin_thr2[7:0]), // Templated
             .ccrin_thr3    (`CCRPATH7.ccrin_thr3[7:0]), // Templated
             .cwp_thr0_next (`EXUPATH7.rml.cwp.cwp_thr0_next), // Templated
             .cwp_thr1_next (`EXUPATH7.rml.cwp.cwp_thr1_next), // Templated
             .cwp_thr2_next (`EXUPATH7.rml.cwp.cwp_thr2_next), // Templated
             .cwp_thr3_next (`EXUPATH7.rml.cwp.cwp_thr3_next), // Templated
             .cwp_wen_l   (`EXUPATH7.rml.cwp.cwp_wen_l[3:0]), // Templated
             .next_cansave_w  (`EXUPATH7.rml.next_cansave_w[2:0]), // Templated
             .cansave_wen_w (`EXUPATH7.rml.cansave_wen_w), // Templated
             .next_canrestore_w (`EXUPATH7.rml.next_canrestore_w[2:0]), // Templated
             .canrestore_wen_w  (`EXUPATH7.rml.canrestore_wen_w), // Templated
             .next_otherwin_w (`EXUPATH7.rml.next_otherwin_w[2:0]), // Templated
             .otherwin_wen_w  (`EXUPATH7.rml.otherwin_wen_w), // Templated
             .tl_exu_tlu_wsr_data_w(`EXUPATH7.rml.exu_tlu_wsr_data_w[5:0]), // Templated
             .ecl_rml_wstate_wen_w(`EXUPATH7.rml.wstate_wen_w), // Templated
             .next_cleanwin_w (`EXUPATH7.rml.next_cleanwin_w[2:0]), // Templated
             .cleanwin_wen_w  (`EXUPATH7.rml.cleanwin_wen_w), // Templated
             .next_yreg_thr0  (`EXUPATH7.div.yreg.next_yreg_thr0[31:0]), // Templated
             .next_yreg_thr1  (`EXUPATH7.div.yreg.next_yreg_thr1[31:0]), // Templated
             .next_yreg_thr2  (`EXUPATH7.div.yreg.next_yreg_thr2[31:0]), // Templated
             .next_yreg_thr3  (`EXUPATH7.div.yreg.next_yreg_thr3[31:0]), // Templated
             .ecl_div_yreg_wen_l  (`EXUPATH7.ecl_div_yreg_wen_l[3:0]), // Templated
             .ifu_tlu_wsr_inst_d  (`EXUPATH7.ifu_tlu_wsr_inst_d), // Templated
             .ifu_tlu_sraddr_d  (`EXUPATH7.ifu_tlu_sraddr_d[3:0]), // Templated
             .inst_done_w_for_sas (`PC_CMP.spc7_inst_done), // Templated
             .ifu_tlu_pc_w  (`SPCPATH7.ifu.fdp.pc_w[47:0]), // Templated
             .ifu_tlu_npc_w (`SPCPATH7.ifu.fdp.npc_w[47:0]), // Templated
             .tl0_en    (`TLPATH7.tl0_en),   // Templated
             .tl1_en    (`TLPATH7.tl1_en),   // Templated
             .tl2_en    (`TLPATH7.tl2_en),   // Templated
             .tl3_en    (`TLPATH7.tl3_en),   // Templated
             .trp_lvl0_new  (`TLPATH7.trp_lvl0_new[2:0]), // Templated
             .trp_lvl1_new  (`TLPATH7.trp_lvl1_new[2:0]), // Templated
             .trp_lvl2_new  (`TLPATH7.trp_lvl2_new[2:0]), // Templated
             .trp_lvl3_new  (`TLPATH7.trp_lvl3_new[2:0]), // Templated
             .update_pstate0_w2 (`TLPATH7.update_pstate_w2[0]), // Templated
             .update_pstate1_w2 (`TLPATH7.update_pstate_w2[1]), // Templated
             .update_pstate2_w2 (`TLPATH7.update_pstate_w2[2]), // Templated
             .update_pstate3_w2 (`TLPATH7.update_pstate_w2[3]), // Templated
             .pstate_priv_update_w2(`TDPPATH7.pstate_priv_update_w2), // Templated
             .hpstate_priv_update_w2(`TDPPATH7.hpstate_priv_update_w2), // Templated
             .restore_pstate0 (`TDPPATH7.restore_pstate0), // Templated
             .restore_pstate1 (`TDPPATH7.restore_pstate1), // Templated
             .restore_pstate2 (`TDPPATH7.restore_pstate2), // Templated
             .restore_pstate3 (`TDPPATH7.restore_pstate3), // Templated
             .tick0_en    (`TLPATH7.tick_en[0]),   // Templated
             .tick1_en    (`TLPATH7.tick_en[1]),   // Templated
             .tick2_en    (`TLPATH7.tick_en[2]),   // Templated
             .tick3_en    (`TLPATH7.tick_en[3]),   // Templated
             .exu_tlu_wsr_data_w  (`TDPPATH7.tlu_wsr_data_w[63:0]), // Templated
             .tba0_en   (`TLPATH7.tlu_tba_en_l[0]), // Templated
             .tba1_en   (`TLPATH7.tlu_tba_en_l[1]), // Templated
             .tba2_en   (`TLPATH7.tlu_tba_en_l[2]), // Templated
             .tba3_en   (`TLPATH7.tlu_tba_en_l[3]), // Templated
             .tsa_wr_vld    (`TLPATH7.tsa_wr_vld[1:0]), // Templated
             .tsa_pc_en   (`TLPATH7.tsa_pc_en),  // Templated
             .tsa_npc_en    (`TLPATH7.tsa_npc_en),   // Templated
             .tsa_tstate_en (`TLPATH7.tsa_tstate_en), // Templated
             .tsa_ttype_en  (`TLPATH7.tsa_ttype_en), // Templated
             .tsa_wr_tid    (`TLPATH7.tsa_wr_tid[1:0]), // Templated
             .tsa_wr_tpl    (`TLPATH7.tsa_wr_tpl[2:0]), // Templated
             .temp_tlvl0    (`TS0PATH7.temp_tlvl),   // Templated
             .tsa0_wdata    (`TS0PATH7.din),   // Templated
             .write_mask0   (`TS0PATH7.write_mask),  // Templated
             .temp_tlvl1    (`TS1PATH7.temp_tlvl),   // Templated
             .tsa1_wdata    (`TS1PATH7.din),   // Templated
             .write_mask1   (`TS1PATH7.write_mask),  // Templated
             .cpu_id    (7),       // Templated
             .next_t0_inrr_i1 (`INTPATH7.next_t0_inrr_i1[63:0]), // Templated
             .next_t1_inrr_i1 (`INTPATH7.next_t1_inrr_i1[63:0]), // Templated
             .next_t2_inrr_i1 (`INTPATH7.next_t2_inrr_i1[63:0]), // Templated
             .next_t3_inrr_i1 (`INTPATH7.next_t3_inrr_i1[63:0]), // Templated
             .ifu_lsu_st_inst_e (`SPCPATH7.ifu_lsu_st_inst_e), // Templated
             .ifu_lsu_ld_inst_e (`SPCPATH7.ifu_lsu_ld_inst_e), // Templated
             .ifu_lsu_alt_space_e (`PCXPATH7.ifu_lsu_alt_space_e), // Templated
             .ifu_lsu_ldst_fp_e (`PCXPATH7.ifu_lsu_ldst_fp_e), // Templated
             .ifu_lsu_ldst_dbl_e  (`PCXPATH7.ifu_lsu_ldst_dbl_e), // Templated
             .lsu_ffu_blk_asi_e (`PCXPATH7.lsu_ffu_blk_asi_e), // Templated
             .ifu_tlu_inst_vld_m  (`PCXPATH7.ifu_tlu_inst_vld_m), // Templated
             .ifu_lsu_swap_e  (`SPCPATH7.ifu_lsu_swap_e), // Templated
             .ifu_tlu_thrid_e (`SPCPATH7.ifu_tlu_thrid_e[1:0]), // Templated
             .asi_wr_din    (`ASIDPPATH7.asi_wr_din), // Templated
             .asi_state_wr_thrd (`ASIDPPATH7.asi_state_wr_thrd[3:0]), // Templated
             .pil     (`TLPATH7.tlu_wsr_data_w[3:0]), // Templated
             .pil0_en   (`TLPATH7.pil0_en),  // Templated
             .pil1_en   (`TLPATH7.pil1_en),  // Templated
             .pil2_en   (`TLPATH7.pil2_en),  // Templated
             .pil3_en   (`TLPATH7.pil3_en),  // Templated
             .dp_frf_data   (`FLOATPATH7.dp_frf_data[70:0]), // Templated
             .ctl_frf_addr  (`FLOATPATH7.ctl_frf_addr[6:0]), // Templated
             .ctl_frf_wen   (`FLOATPATH7.ctl_frf_wen[1:0]), // Templated
             .regfile_index (`FLOATPATH7.frf.regfile_index[7:0]), // Templated
             .ifu_exu_rs1_s (`EXUPATH7.ifu_exu_rs1_s[4:0]), // Templated
             .ifu_exu_rs2_s (`EXUPATH7.ifu_exu_rs2_s[4:0]), // Templated
             .byp_alu_rs1_data_e  (`EXUPATH7.byp_alu_rs1_data_e[63:0]), // Templated
             .byp_alu_rs2_data_e  (`EXUPATH7.byp_alu_rs2_data_e[63:0]), // Templated
             .ifu_lsu_imm_asi_d (`SPCPATH7.ifu_lsu_imm_asi_d[7:0]), // Templated
             .ifu_lsu_imm_asi_vld_d(`SPCPATH7.ifu_lsu_imm_asi_vld_d), // Templated
             .ifu_tlu_itlb_done (`SPCPATH7.ifu_tlu_itlb_done), // Templated
             .tlu_itlb_wr_vld_g (`SPCPATH7.tlu_itlb_wr_vld_g), // Templated
             .tlu_itlb_dmp_vld_g  (`SPCPATH7.tlu_itlb_dmp_vld_g), // Templated
             .lsu_tlu_dtlb_done (`SPCPATH7.lsu_tlu_dtlb_done), // Templated
             .tlu_dtlb_wr_vld_g (`TLUPATH7.mmu_ctl.pre_dtlb_wr_vld_g), // Templated
             .tlu_dtlb_dmp_vld_g  (`SPCPATH7.tlu_dtlb_dmp_vld_g), // Templated
             .tlu_idtlb_dmp_thrid_g(`SPCPATH7.tlu_idtlb_dmp_thrid_g[1:0]), // Templated
             .inst_vld_qual_e (`INSTPATH7.inst_vld_qual_e), // Templated
             .t0_inrr_i2    (`TLUPATH7.intdp.t0_inrr_i2[63:0]), // Templated
             .t1_inrr_i2    (`TLUPATH7.intdp.t1_inrr_i2[63:0]), // Templated
             .t2_inrr_i2    (`TLUPATH7.intdp.t2_inrr_i2[63:0]), // Templated
             .t3_inrr_i2    (`TLUPATH7.intdp.t3_inrr_i2[63:0]), // Templated
             .t0_indr   (`TLUPATH7.intdp.t0_indr[10:0]), // Templated
             .t1_indr   (`TLUPATH7.intdp.t1_indr[10:0]), // Templated
             .t2_indr   (`TLUPATH7.intdp.t2_indr[10:0]), // Templated
             .t3_indr   (`TLUPATH7.intdp.t3_indr[10:0]), // Templated
             .ttype_sel_hstk_cmp_e(`INSTPATH7.ttype_sel_hstk_cmp_e), // Templated
             .ifu_tlu_ttype_vld_m (`INSTPATH7.ifu_tlu_ttype_vld_m)); // Templated
 `endif // !ifdef SP7
`endif // SAS_DISABLE
reg         sas_def;
reg [71:0] active_window [127:0];
reg [71:0] locals        [255:0];
reg [71:0] evens         [255:0];
reg [71:0] odds          [255:0];
reg [71:0] globals       [255:0];
reg [38:0] regfile       [255:0];
//signals for fifo
time    sas_time;
reg [63:0] sas_timer;

reg [7:0]  sas_which;
reg [2:0]  sas_spc;
reg [1:0]  sas_thread;
reg [2:0]  sas_win;
reg [5:0]  sas_addr;
reg [4:0]  sas_cond;
reg [63:0] sas_reg;
reg [63:0] sas_val;
reg        dummy;
reg        sas_int;

integer    i, max;
reg         reset_status, expected_warm, swap;
reg       debug_sas;
initial begin
    reset_status = 0;
    expected_warm= 0;
    swap         = 0;
    if($test$plusargs("use_sas_tasks"))
    begin
        sas_def = 1;
        $display("ttt:sas_def = 1");
    end
    else
    begin
        sas_def = 0;
        $display("ttt:sas_def = 0");
    end
    if(sas_def)begin
        dummy = $bw_decoder(1);//create handle for this core.
        $bw_force_by_name(1);
    end
    if($test$plusargs("debug_sas")) debug_sas =1;
    else debug_sas = 0;
end // initial begin

//mra memory contets
task mra_val;
    input [2:0] cpu;
    input [3:0] idx;
    output [159:0] mra_wdata;
    reg [159:0] mra_wdata;

`ifdef FPGA_SYN_16x160
    reg [7:0] tmp;
`endif
    begin
        case(cpu)
`ifdef RTL_SPARC0
            0 : begin
`ifdef FPGA_SYN_16x160
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH0.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH0.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC1
            1 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH1.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH1.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC2
            2 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH2.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH2.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC3
            3 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH3.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH3.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC4
            4 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH4.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH4.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC5
            5:  begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH5.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH5.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC6
            6 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH6.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH6.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
`ifdef RTL_SPARC7
            7 : begin
`ifdef FPGA_SYN
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr0.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr0.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr0.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr0.inq_ary3, tmp[7:6]);
                mra_wdata[7:0] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr1.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr1.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr1.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr1.inq_ary3, tmp[7:6]);
                mra_wdata[15:8] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr2.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr2.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr2.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr2.inq_ary3, tmp[7:6]);
                mra_wdata[23:16] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr3.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr3.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr3.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr3.inq_ary3, tmp[7:6]);
                mra_wdata[31:24] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr4.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr4.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr4.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr4.inq_ary3, tmp[7:6]);
                mra_wdata[39:32] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr5.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr5.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr5.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr5.inq_ary3, tmp[7:6]);
                mra_wdata[47:40] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr6.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr6.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr6.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr6.inq_ary3, tmp[7:6]);
                mra_wdata[55:48] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr7.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr7.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr7.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr7.inq_ary3, tmp[7:6]);
                mra_wdata[63:56] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr8.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr8.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr8.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr8.inq_ary3, tmp[7:6]);
                mra_wdata[71:64] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr9.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr9.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr9.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr9.inq_ary3, tmp[7:6]);
                mra_wdata[79:72] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr10.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr10.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr10.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr10.inq_ary3, tmp[7:6]);
                mra_wdata[87:80] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr11.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr11.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr11.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr11.inq_ary3, tmp[7:6]);
                mra_wdata[95:88] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr12.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr12.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr12.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr12.inq_ary3, tmp[7:6]);
                mra_wdata[103:96] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr13.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr13.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr13.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr13.inq_ary3, tmp[7:6]);
                mra_wdata[111:104] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr14.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr14.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr14.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr14.inq_ary3, tmp[7:6]);
                mra_wdata[119:112] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr15.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr15.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr15.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr15.inq_ary3, tmp[7:6]);
                mra_wdata[127:120] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr16.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr16.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr16.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr16.inq_ary3, tmp[7:6]);
                mra_wdata[135:128] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr17.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr17.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr17.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr17.inq_ary3, tmp[7:6]);
                mra_wdata[143:136] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr18.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr18.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr18.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr18.inq_ary3, tmp[7:6]);
                mra_wdata[151:144] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr19.inq_ary0, tmp[1:0]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr19.inq_ary1, tmp[3:2]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr19.inq_ary2, tmp[5:4]);
                $bw_force_by_name(2, idx, `TLUPATH7.mra.arr19.inq_ary3, tmp[7:6]);
                mra_wdata[159:152] = {tmp[7],tmp[5],tmp[3],tmp[1],tmp[6],tmp[4],tmp[2],tmp[0]};
`else
$bw_force_by_name(2, idx, `TLUPATH7.mra.inq_ary, mra_wdata);
`endif // FPGA_SYN
            end
`endif
        endcase // case(cpu)
    end
endtask // mra_val
//do reset tlb valid bit.
task tlb_reset;
    input [2:0] core;
    input [5:0] idx;
    input [1:0] which_tlb;

    begin
        case(core)
`ifdef RTL_SPARC0
            3'b000 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH0.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH0.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC1
            3'b001 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH1.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH1.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC2
            3'b010 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH2.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH2.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC3
            3'b011 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH3.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH3.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC4
            3'b100 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH4.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH4.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC5
            3'b101 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH5.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH5.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC6
            3'b110 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH6.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH6.tlb_entry_vld, idx);
`endif
`ifdef RTL_SPARC7
            3'b111 : if(which_tlb == 1)$bw_force_by_name(3, `DTLBPATH7.tlb_entry_vld, idx);
                else $bw_force_by_name(3, `ITLBPATH7.tlb_entry_vld, idx);
`endif
        endcase // case(core)
    end
endtask // tlb_reset
reg timestamp, timest;
reg [63:0] time_stamp;
reg         pli_flag;

integer    rtl_counter;
initial begin
    timestamp = 1;
    timest = 1;
end
//send rtl cycle
always @(posedge clk)begin
    if(rst_l)begin
        sas_int      = 0;
        reset_status = 1;
        if(sas_def)begin
            if(timest)begin
                timest = 0;
                time_stamp = $time;
            end
            `SAS_INTER.send_model;
            rtl_counter = rtl_counter + 1;
            //if(pli_flag)$display("Info:Debug Time(%0t) rtl_cycle(%0d)", $time, rtl_counter);
        end
        sas_int      = 1;

        `ifdef SAS_DISABLE
        `else
         `ifdef RTL_SPARC0
        `SAS_TASKS.task0.process;
          `endif
          `ifdef RTL_SPARC1
        `SAS_TASKS.task1.process;
          `endif
          `ifdef RTL_SPARC2
        `SAS_TASKS.task2.process;
          `endif
          `ifdef RTL_SPARC3
        `SAS_TASKS.task3.process;
          `endif
          `ifdef RTL_SPARC4
        `SAS_TASKS.task4.process;
          `endif
          `ifdef RTL_SPARC5
        `SAS_TASKS.task5.process;
          `endif
          `ifdef RTL_SPARC6
        `SAS_TASKS.task6.process;
          `endif
          `ifdef RTL_SPARC7
        `SAS_TASKS.task7.process;
          `endif

        `endif // SAS_DISABLE
        if(sas_def)begin
            $display("ttt: sas_def");
            rdAndcmp;
            if(`TOP_MOD.diag_done)send_cmd(`PLI_RETRY, 0, 0, 0, 0, 0);
            if(expected_warm)begin
                if(`TOP_DESIGN.iob_cpx_data_ca[`CPX_VLD]                            &&
                        (`TOP_DESIGN.iob_cpx_data_ca[`CPX_RQ_HI:`CPX_RQ_LO] == `INT_RET) &&
                        `TOP_DESIGN.iob_cpx_data_ca[17:16] == 1)begin
                    expected_warm = 0;
                    //reset list and buffer
                    $bw_reset_buf();//always send C0T0
                    //dummy = $bw_list(`TOP_MOD.list_handle, `RESET_COMMAND);//clean instruction and register buffer
                    dummy = $bw_decoder(`RESET_COMMAND, `TOP_MOD.list_handle);
                    dummy = $bw_sas_send(`PLI_FORCE_TRAP_TYPE, 0, 8'b0000_0001);//trap type one
                    `ifdef RTL_SPARC0
                      `SAS_TASKS.task0.reset_clean;
                    `endif
                    `ifdef RTL_SPARC1
                      `SAS_TASKS.task1.reset_clean;
                    `endif
                    `ifdef RTL_SPARC2
                      `SAS_TASKS.task2.reset_clean;
                    `endif
                    `ifdef RTL_SPARC3
                      `SAS_TASKS.task3.reset_clean;
                    `endif
                    `ifdef RTL_SPARC4
                      `SAS_TASKS.task4.reset_clean;
                    `endif
                    `ifdef RTL_SPARC5
                      `SAS_TASKS.task5.reset_clean;
                    `endif
                    `ifdef RTL_SPARC6
                      `SAS_TASKS.task6.reset_clean;
                    `endif
                    `ifdef RTL_SPARC7
                      `SAS_TASKS.task7.reset_clean;
                    `endif
                    for(i = 0; i < 32;i = i + 1)begin
                        `TOP_MOD.monitor.pc_cmp.timeout[i]       = 0;
                        `TOP_MOD.monitor.pc_cmp.active_thread[i] = 0;
                    end
                    //set active thread.
                    `TOP_MOD.monitor.pc_cmp.active_thread[`TOP_DESIGN.iob_cpx_data_ca[12:8]] = 1;
                    max = `TOP_MOD.monitor.pc_cmp.max;
                    `TOP_MOD.monitor.pc_cmp.max = 4000000;//waiting for dram wake up.
                    swap = 1;
                end // if (`TOP_DESIGN.iob_cpx_data_ca[`CPX_VLD] &&...
            end // if (expected_warm)
        end // if (sas_def)
    end // if (rst_l)
    else if(reset_status)expected_warm = 1;
    if(swap &&
            `DCTLPATH0.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt == 5'h1c &&
            `DCTLPATH0.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt == 5'h1c &&
            `DCTLPATH1.dramctl0.dram_dctl.dram_que.que_bank_idle_cnt == 5'h1c &&
            `DCTLPATH1.dramctl1.dram_dctl.dram_que.que_bank_idle_cnt == 5'h1c)begin
        `TOP_MOD.monitor.pc_cmp.max = max;
        swap  = 0;
    end

end // always @ (posedge clk)

integer   sent;
/*-----------------------------------------------------------------
assign symbolic name.
----------------------------------------------------------------*/
//regs symbol.
reg [7:0] sym_tab[3:0];
reg [7:0] sym;
reg [240:0] str[`FLOAT_X:`PC];

initial begin

    sym_tab[0]                       = "g";
    sym_tab[1]                       = "o";
    sym_tab[2]                       = "l";
    sym_tab[3]                       = "i";
    sent                             = 0;
    str[`PC]                         = "PC";
    str[`NPC]                        = "NPC";
    str[`Y]                          = "Y";
    str[`CCR]                        = "CCR";
    str[`FPRS]                       = "FPRS";
    str[`FSR]                        = "FSR";
    str[`ASI]                        = "ASI";
    str[`TICK_SAS]                   = "TICK";
    str[`GSR]                        = "GSR";
    str[`TICK_CMPR]                  = "TICK_CMPR";
    str[`STICK]                      = "STICK";
    str[`STICK_CMPR]                 = "STICK_CMPR";
    str[`PSTATE_SAS]                 = "PSTATE";
    str[`TL_SAS]                     = "TL";
    str[`PIL_SAS]                    = "PIL";
    str[`TPC1]                       = "TPC1";
    str[`TPC2]                       = "TPC2";
    str[`TPC3]                       = "TPC3";
    str[`TPC4]                       = "TPC4";
    str[`TPC5]                       = "TPC5";
    str[`TPC6]                       = "TPC6";
    str[`TNPC1]                      = "TNPC1";
    str[`TNPC2]                      = "TNPC2";
    str[`TNPC3]                      = "TNPC3";
    str[`TNPC4]                      = "TNPC4";
    str[`TNPC5]                      = "TNPC5";
    str[`TNPC6]                      = "TNPC6";
    str[`TSTATE1]                    = "TSTATE1";
    str[`TSTATE2]                    = "TSTATE2";
    str[`TSTATE3]                    = "TSTATE3";
    str[`TSTATE4]                    = "TSTATE4";
    str[`TSTATE5]                    = "TSTATE5";
    str[`TSTATE6]                    = "TSTATE6";
    str[`TT1]                        = "TT1";
    str[`TT2]                        = "TT2";
    str[`TT3]                        = "TT3";
    str[`TT4]                        = "TT4";
    str[`TT5]                        = "TT5";
    str[`TT6]                        = "TT6";
    str[`TBA_SAS]                    = "TBA";
    str[`VER]                        = "VER";
    str[`CWP]                        = "CWP";
    str[`CANSAVE]                    = "CANSAVE";
    str[`CANRESTORE]                 = "CANRESTORE";
    str[`OTHERWIN]                   = "OTHERWIN";
    str[`WSTATE]                     = "WSTATE";
    str[`CLEANWIN]                   = "CLEANWIN";
    str[`SOFTINT]                    = "SOFTINT";
    str[`ECACHE_ERROR_ENABLE]        = "ECACHE_ERROR_ENABLE";
    str[`ASYNCHRONOUS_FAULT_STATUS]  = "ASYNCHRONOUS_FAULT_STATUS";
    str[`ASYNCHRONOUS_FAULT_ADDRESS] = "ASYNCHRONOUS_FAULT_ADDRESS";
    str[`OUT_INTR_DATA0]             = "OUT_INTR_DATA0";
    str[`OUT_INTR_DATA1]             = "OUT_INTR_DATA1";
    str[`OUT_INTR_DATA2]             = "OUT_INTR_DATA2";
    str[`INTR_DISPATCH_STATUS]       = "INTR_DISPATCH_STATUS";
    str[`IN_INTR_DATA0]              = "IN_INTR_DATA0";
    str[`IN_INTR_DATA1]              = "IN_INTR_DATA1";
    str[`IN_INTR_DATA2]              = "IN_INTR_DATA2";
    str[`INTR_RECEIVE]               = "INTR_RECEIVE";
    str[`GL]                         = "GL";
    str[`HPSTATE_SAS]                = "HPSTATE";
    str[`HTSTATE1]                   = "HTSTATE1";
    str[`HTSTATE2]                   = "HTSTATE2";
    str[`HTSTATE3]                   = "HTSTATE3";
    str[`HTSTATE4]                   = "HTSTATE4";
    str[`HTSTATE5]                   = "HTSTATE5";
    str[`HTSTATE6]                   = "HTSTATE6";
    str[`HTSTATE7]                   = "HTSTATE7";
    str[`HTSTATE8]                   = "HTSTATE8";
    str[`HTSTATE9]                   = "HTSTATE9";
    str[`HTSTATE10]                  = "HTSTATE10";
    str[`HTBA_SAS]                   = "HTBA";
    str[`HINTP_SAS]                  = "HINTP";
    str[`HSTICK_CMPR]                = "HSTICK_CMPR";
    str[`MID]                        = "MID";
    str[`ISFSR]                      = "ISFSR";
    str[`DSFSR]                      = "DSFSR";
    str[`SFAR]                       = "SFAR";
    str[`I_TAG_ACCESS]               = "I_TAG_ACCESS";
    str[`D_TAG_ACCESS]               = "D_TAG_ACCESS";
    str[`CTXT_PRIM]                  = "CTXT_PRIM";
    str[`CTXT_SEC]                   = "CTXT_SEC";
    str[`SFP_REG]                    = "SFP_REG";
    str[`I_CTXT_ZERO_PS0]            = "I_CTXT_ZERO_PS0";
    str[`D_CTXT_ZERO_PS0]            = "D_CTXT_ZERO_PS0";
    str[`I_CTXT_ZERO_PS1]            = "I_CTXT_ZERO_PS1";
    str[`D_CTXT_ZERO_PS1]            = "D_CTXT_ZERO_PS1";
    str[`I_CTXT_ZERO_CONFIG]         = "I_CTXT_ZERO_CONFIG";
    str[`D_CTXT_ZERO_CONFIG]         = "D_CTXT_ZERO_CONFIG";
    str[`I_CTXT_NONZERO_PS0]         = "I_CTXT_NONZERO_PS0";
    str[`D_CTXT_NONZERO_PS0]         = "D_CTXT_NONZERO_PS0";
    str[`I_CTXT_NONZERO_PS1]         = "I_CTXT_NONZERO_PS1";
    str[`D_CTXT_NONZERO_PS1]         = "D_CTXT_NONZERO_PS1";
    str[`I_CTXT_NONZERO_CONFIG]      = "I_CTXT_NONZERO_CONFIG";
    str[`D_CTXT_NONZERO_CONFIG]      = "D_CTXT_NONZERO_CONFIG";
    str[`I_TAG_TARGET]               = "I_TAG_TARGET";
    str[`D_TAG_TARGET]               = "D_TAG_TARGET";
    str[`I_TSB_PTR_PS0]              = "I_TSB_PTR_PS0";
    str[`D_TSB_PTR_PS0]              = "D_TSB_PTR_PS0";
    str[`I_TSB_PTR_PS1]              = "I_TSB_PTR_PS1";
    str[`D_TSB_PTR_PS1]              = "D_TSB_PTR_PS1";
    str[`D_TSB_DIR_PTR]              = "D_TSB_DIR_PTR";
    str[`VA_WP_ADDR]                 = "VA_WP_ADDR";
    str[`PID]                        = "PID";
    str[`REG_WRITE_BACK]             = "general register";
    str[`FLOAT_I]                    = "floating point";
    str[`FLOAT_X]                    = "floating point";
end // initial begin

/*-----------------------------------------------------------------
read data from socket and do comparsion.
----------------------------------------------------------------*/
reg [4:0]   next_thread;
reg [3:0]   recv_status;
reg [3:0]   ready;
reg [240:0] t_str;
reg [7:0]   which;
reg [9:0]   next_which;
reg [63:0]  rtl_val;
integer     good_timeout;
//keep the drop invr data
reg [31:0]  drop_vld;
reg [63:0]  drop_val[31:0];
reg [2:0]   drop_win[31:0];
reg [3:0]   drop_cond[31:0];

reg [31:0]  mul_vld;
reg [63:0]  mul_val[31:0];
reg [4:0]   mul_reg[31:0];
reg [4:0]   mul_win[31:0];

reg [31:0]  smul_vld;
reg [63:0]  smul_val[31:0];
reg [4:0]   smul_reg[31:0];
reg [4:0]   smul_win[31:0];

reg [3:0]   tmp_val;
reg [63:0]  mulv;
reg [4:0]   mulr;
reg          mul, inst_cond;
reg [4:0]   mulw;
//use for instruction checker.
reg [4:0]   inst_thread;
reg          wasthere, once_try;
reg [7:0]   ccr_req;

integer          idx;
reg            less;

initial begin
    good_timeout = 0;
    drop_vld     = 0;
    mul_vld      = 0;
    wasthere     = 1;
    once_try     = 1;
    smul_vld     = 0;
end

always @(posedge clk)begin
    if(`TOP_MOD.diag_done)good_timeout = good_timeout + 1;
    if(good_timeout > 2000)begin
        less = 1;
        for(idx = 0; idx < 32;idx = idx + 1)begin
            if(`PC_CMP.finish_mask[idx])begin
                if(`PC_CMP.active_thread[idx] == 0)begin
                    less = 0;
                    $display("%0t:Info->you turn on less thread than finish_mask. finish_mask(%x) active_thread(%x)",
                             $time, `PC_CMP.finish_mask, `PC_CMP.active_thread);
                    `MONITOR_PATH.fail("you turn on less thread than finish_mask");
                    idx = 32;
                end
            end
        end
        if(less)begin
            if(which == `INTR_RECEIVE || which == `HINTP_SAS)begin
                dummy = $bw_list(`TOP_MOD.list_handle, 2,sas_which, sas_spc,  sas_thread,
                                 sas_win, sas_addr,      sas_reg,   sas_cond, sas_timer);
                sas_time = sas_timer;

                if (debug_sas)
                    $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) win(%d) reg_num(%d) val(%0x)",$time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
            end
            else begin
                if(wasthere)begin
                    dummy = $bw_list(`TOP_MOD.list_handle, 1,  next_thread,
                                     sas_win, sas_addr, which, ready, rtl_val, sas_timer);
                    sas_time = sas_timer;
                    wasthere = 0;
                    if(!dummy)begin
                        $display("%0t:Info-> empty list", $time);
                        `MONITOR_PATH.fail("No empty list(sas_task)");
                    end
                    else begin
                        if(once_try && $bw_empty())begin
                            dummy = $bw_list(`TOP_MOD.list_handle, 11);
                            once_try = 0;

                        end
                        else begin
                            $display("%0t:Info->No response from simics", $time);
                            $display("Info:debug for no response thread(%d) command(%s) type(%d)", next_thread, str[which], ready);
                            `MONITOR_PATH.fail("No response from bas");
                        end
                    end

                end
            end
        end
    end // if (good_timeout > 2000)
end
//compare instruction
task check_inst;
    begin
        dummy = $bw_sas_recv(sas_val, inst_thread, sas_win, sas_addr, 200, ready,
                             sas_timer, next_which, mul, mulv, mulr, mulw);//got phyical address
        if(sas_def && dummy)begin
            dummy = $bw_list(`TOP_MOD.list_handle, 21, sas_reg,  sas_timer, inst_cond);
            sas_time = sas_timer;
            //      if(mul_vld[inst_thread])mul_vld[inst_thread]  = 0;
            if(inst_cond)begin
                if(sas_val[31:0] == sas_reg[31:0])begin
                    $display("%0t:instruction-MATCH -> spc(%d) thread(%d) physical_pc(%x) instruction(%x)",
                             sas_time, inst_thread[4:2], inst_thread[1:0], mulv, sas_val[31:0]);
                end
                else begin
                    if(inst_checker_off)begin
                        $display("%0t:(Warning)-instruction -> spc(%d) thread(%d)  physical_pc(%x) rtl_inst_reg = %x, sas_inst_reg =%x",
                                 sas_time, inst_thread[4:2], inst_thread[1:0], mulv, sas_reg[31:0], sas_val[31:0]);
                        recv_status  = 0;
                    end
                    else if(mulv)begin
                        $display("%0t:MISMATCH-instruction -> spc(%d) thread(%d)  physical_pc(%x) rtl_inst_reg = %x, sas_inst_reg =%x",
                                 sas_time, inst_thread[4:2], inst_thread[1:0], mulv, sas_reg[31:0], sas_val[31:0]);
                        recv_status  = 0;
                        `MONITOR_PATH.fail("instruction-MISMATCH");
                    end
                end
            end // if (mulv)
        end // if (sas_def && dummy)
    end
endtask // check_inst
//we want to compare the instruction after virtual pc match.
reg [7:0] save_which;

task rdAndcmp;
    begin
        if(sas_def)begin
            recv_status = 1;
            while($bw_list(`TOP_MOD.list_handle, 1,  next_thread,
                           sas_win, sas_addr, which, ready, rtl_val, sas_timer) && recv_status && (`TOP_MOD.fail_flag == 0))begin
                sas_time = sas_timer;
                if(which == `HINTP_SAS && ready)begin
                    dummy = $bw_list(`TOP_MOD.list_handle, 2, sas_which, sas_spc,  sas_thread,
                                     sas_win, sas_addr,  sas_reg,   sas_cond, sas_timer);
                    if (debug_sas)
                        $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) win(%d) reg_num(%d) val(%0x)",$time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                    sas_time = sas_timer;
                    register_cmp(sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg,
                                 sas_reg, sas_reg, 0, 0, 0, 0, sas_cond);
                end
                else begin
                    save_which = which;
                    //if((which == `PC) && $bw_list(`TOP_MOD.list_handle, 22, inst_thread))check_inst;
                    //process the core registers.
                    mul  = mul_vld[next_thread];
                    mulv = mul_val[next_thread];
                    mulr = mul_reg[next_thread];
                    mulw = mul_win[next_thread];

                    if(which == `REG_WRITE_BACK         &&
                            smul_vld[next_thread]            &&
                            smul_val[next_thread] == rtl_val &&
                            // ready < 2                        &&
                            smul_reg[next_thread] == sas_addr)begin
                        sas_val = smul_val[next_thread];
                        dummy = $bw_list(`TOP_MOD.list_handle, 2, sas_which, sas_spc,  sas_thread,
                                         sas_win, sas_addr,  sas_reg,   sas_cond, sas_timer);
                        if (debug_sas)
                            $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) win(%d) reg_num(%d) val(%0x)",$time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                        sas_time = sas_timer;
                        if(ready < 2)
                            register_cmp(sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg,
                                         sas_val, sas_val, 0, 0, 0, 0, sas_cond);
                        smul_vld[next_thread] = 0;
                        recv_status           = 0;
                        dummy = $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, which, ready, sas_timer, next_which,
                                             mul, mulv, mulr, mulw);
                    end
                    else begin
                        if(which == `REG_WRITE_BACK)smul_vld[next_thread] = 0;
                        case($bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, which, ready, sas_timer, next_which,
                                              mul, mulv, mulr, mulw))
                            0 : begin
                                recv_status                   = 0;
                                if(!mulv)mul_vld[next_thread] = mulv;
                            end
                            1 : begin
                                // if(!((which == `PC || which == `NPC) && !sas_val))begin
                                if((which == `INTR_RECEIVE) &&
                                        drop_vld[next_thread]    &&
                                        (sas_val == drop_val[next_thread]))begin
                                    sas_val   = drop_val[next_thread];
                                    sas_which = which;
                                    sas_spc   = next_thread[4:2];
                                    sas_win   = drop_win[next_thread];
                                    sas_cond  = drop_cond[next_thread];

                                    if(sas_val != sas_reg)begin
                                        dummy = $bw_list(`TOP_MOD.list_handle, 2, sas_which, sas_spc,  sas_thread,
                                                         sas_win, sas_addr,       sas_reg,   sas_cond, sas_timer);
                                        if (debug_sas)
                                            $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) win(%d) reg_num(%d) val(%0x)",$time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                                        sas_time = sas_timer;
                                    end

                                    else
                                        register_cmp(sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg,
                                                     sas_val, sas_val, 0, 0, 0, 0, sas_cond);
                                    drop_vld[next_thread] = 0;
                                end
                                else begin
                                    if(mul_vld[next_thread]               &&
                                            (mul_val[next_thread] == sas_val)  &&
                                            (sas_win == mul_win[next_thread])  &&
                                            (mul_reg[next_thread] == sas_addr) &&
                                            (sas_val != rtl_val) &&
                                            (ready != 1))begin
                                        mul_vld[next_thread] = 0;
                                        $display("Info:Mulcc data thread(%d) reg(%d) val(%x)", next_thread, sas_addr, sas_val);
                                    end
                                    else begin
                                        dummy = $bw_list(`TOP_MOD.list_handle, 2,sas_which, sas_spc,  sas_thread,
                                                         sas_win, sas_addr,      sas_reg,   sas_cond, sas_timer);
                                        if (debug_sas)
                                            $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) window(%d) reg(%d) val(%0x)\n", $time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                                        sas_time = sas_timer;
                                        if((which == `REG_WRITE_BACK) &&
                                                mul_vld[next_thread])begin
                                            if(mul_reg[next_thread] == sas_addr)mul_vld[next_thread] = 0;
                                        end
                                        if(ready >= 2 || (which == `INTR_RECEIVE))begin//dummy compare
                                            if(sas_reg != sas_val)begin
                                                if(which == `INTR_RECEIVE)
                                                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, 9, sas_timer);
                                                else
                                                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, ready, sas_timer);
                                            end
                                            else if(which == `INTR_RECEIVE && ready == 1)begin
                                                $display("(%0t):drop intr_receive = %x thread(%d)", sas_time, sas_val, next_thread);
                                            end
                                            if(ready >= 2)begin
                                                if(mul_vld[sas_thread])begin
                                                    smul_vld[sas_thread] = 1;
                                                    $display("Info: dummy mulcc data thread(%d) reg(%d) value(%x)",
                                                             sas_thread, sas_addr, sas_val);
                                                end
                                                mul_vld[sas_thread] = 0;
                                                //smul_vld[sas_thread] = 1;
                                                smul_val[sas_thread] = sas_val;
                                                smul_reg[sas_thread] = sas_addr;
                                                smul_win[sas_thread] = sas_win;
                                            end
                                        end
                                        else begin
                                            register_cmp(sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg,
                                                         sas_val, sas_val, 0, 0, 0, 0, sas_cond);
                                        end // else: !if(ready >= 2 || (which == `INTR_RECEIVE))

                                        if(which == `INTR_RECEIVE)drop_vld[next_thread] = 0;
                                    end // else: !if(mul_vld[next_thread])
                                end // else: !if((which == `INTR_RECEIVE) &&...
                                //end // if (!((which == `PC || which == `NPC) && !sas_val))

                                good_timeout = 0;
                            end
                            2 : begin
                                recv_status = 0;
                                dead_socket = 1;
                                $display("Info:type(%0s) thread(%x) rtl-expected(%x)", str[which], next_thread, sas_reg);
                                `MONITOR_PATH.fail("missed_trigger");
                            end
                            3 : begin
                                dummy = $bw_list(`TOP_MOD.list_handle, 2,         sas_which, sas_spc, sas_thread,
                                                 sas_win, sas_addr,     sas_reg,  sas_cond, sas_timer);
                                if (debug_sas)
                                    $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) window(%d) reg(%d) val(%0x)\n", $time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                                sas_time = sas_timer;
                                if(!(ready >= 2))begin
                                    if(which == `REG_WRITE_BACK)begin
                                        if(sas_addr < 8)
                                            $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(global) reg(%d) rtl-expected(%x)",
                                                     sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                        else if(sas_addr < 16)
                                            $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(out) reg(%d) rtl-expected(%x)",
                                                     sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                        else if(sas_addr < 24)
                                            $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(local) reg(%d) rtl-expected(%x)",
                                                     sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                        else
                                            $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(in) reg(%d) rtl-expected(%x)",
                                                     sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                    end // if (which == `REG_WRITE_BACK)
                                    else $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(%0s) reg(%d) rtl-expected(%x)",
                                                      sas_time, sas_spc, sas_thread, sas_win, str[which], sas_addr, sas_reg);
                                    dead_socket = 1;
                                    `MONITOR_PATH.fail("Wrong_trigger");
                                end // if (ready != 2)
                                else begin //drop data.
                                    $display("Info: pop thread(%x) addr(%d) val(%x)", next_thread, sas_addr, sas_reg);
                                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, 10, sas_which, sas_reg);
                                end // else: !if(!(ready >= 2))
                                recv_status = 0;
                            end
                            4 : begin
                                recv_status = 0;
                                dead_socket = 1;
                                $display("%0t:Info->Cannot send data to simics", $time);
                                `MONITOR_PATH.fail("simics socket dead");
                            end
                            5 : begin//interrupt receiver register

                                tmp_val = $bw_list(`TOP_MOD.list_handle, 4, sas_val, sas_win, sas_cond, next_thread);
                                if(tmp_val == 1)begin
                                    drop_vld[next_thread]  = 1;
                                    drop_val[next_thread]  = sas_val;
                                    drop_win[next_thread]  = sas_win;
                                    drop_cond[next_thread] = sas_cond;
                                end
                                else if(tmp_val == 2)begin
                                    mul_vld[next_thread]   = 1;
                                    mul_val[next_thread]   = sas_val;
                                    mul_reg[next_thread]   = sas_cond;
                                    mul_win[next_thread]   = sas_win;
                                end
                                recv_status = 0;
                            end
                            7 : begin//shift by one
                                dummy       = $bw_list(`TOP_MOD.list_handle, 5);
                                recv_status = 0;
                            end
                            8: begin
                                recv_status = 0;
                                dead_socket = 1;
                                $display("%0t:Info->Maybe simics in infinite loop.", $time);
                                `MONITOR_PATH.fail("simics doesn't send data to RTL.");
                            end
                            9 : begin//search for the potential matching value.
                                if($bw_list(`TOP_MOD.list_handle, 6, next_which))begin
                                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, 11, sas_which);
                                    if(!(ready >= 2))begin
                                        dummy = $bw_list(`TOP_MOD.list_handle, 2, sas_which, sas_spc, sas_thread,
                                                         sas_win, sas_addr, sas_reg,  sas_cond, sas_timer);
                                        if (debug_sas)
                                            $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) window(%d) reg(%d) val(%0x)\n", $time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                                        sas_time = sas_timer;
                                        if(which == `REG_WRITE_BACK)begin
                                            if(sas_addr < 8)
                                                $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(global) reg(%d) rtl-expected(%x)",
                                                         sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                            else if(sas_addr < 16)
                                                $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(out) reg(%d) rtl-expected(%x)",
                                                         sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                            else if(sas_addr < 24)
                                                $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(local) reg(%d) rtl-expected(%x)",
                                                         sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                            else
                                                $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(in) reg(%d) rtl-expected(%x)",
                                                         sas_time, sas_spc, sas_thread, sas_win,  sas_addr[2:0], sas_reg);
                                        end
                                        else $display("%0t:wrong_trigger->spc(%x) thread(%x) window(%x) type(%0s) reg(%d) rtl-expected(%x)",
                                                          sas_time, sas_spc, sas_thread, sas_win, str[which], sas_addr, sas_reg);
                                        dead_socket = 1;
                                        `MONITOR_PATH.fail("Wrong_trigger");
                                    end
                                end // if ($bw_list(`TOP_MOD.list_handle, 6, next_which))
                                else begin
                                    recv_status = 0;
                                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, 12, next_which);
                                end // else: !if($bw_list(`TOP_MOD.list_handle, 6, next_which))

                            end // case: 9
                            10 : //hit good trap
                            begin
                                dummy = $bw_list(`TOP_MOD.list_handle, 2,sas_which, sas_spc,  sas_thread,
                                                 sas_win, sas_addr,      sas_reg,   sas_cond, sas_timer);
                                if (debug_sas)
                                    $display("%0t BW_LIST: Pop data type(%d) core(%d) thread(%d) window(%d) reg(%d) val(%0x)\n", $time, sas_which, sas_spc, sas_thread, sas_win, sas_addr, sas_reg);
                                sas_time = sas_timer;
                                recv_status = 0;
                            end
                        endcase // case($bw_sas_recv(sas_val, next_thread, sas_win, sas_addr))
                    end // else: !if(which == `REG_WRITE_BACK &&...

                    if((which == `PC) && $bw_list(`TOP_MOD.list_handle, 22, inst_thread))check_inst;

                end
            end // if (sas_def)
        end // if (sas_def)
    end
endtask // endtask

//integrate all socket send request to prevent the deadlock case.
/*   task send_cmd;
input [7:0]    cmd;
input [7:0]    thr;
input [7:0]    win;
input [7:0]    addr;
input [10:0]   counter;
input [4287:0] data;//4288


begin
case(cmd)
`PLI_QUIT             : sent = sent + 1;
`PLI_SSTEP            : sent = sent + 2;
`PLI_READ_TH_REG      : sent = sent + 4;
`PLI_READ_TH_CTL_REG  : sent = sent + 3;
`PLI_READ_TH_FP_REG_I : sent = sent + 3;
`PLI_READ_TH_FP_REG_X : sent = sent + 3;
`PLI_RTL_CYCLE        : sent = sent + counter ;
`PLI_RTL_DATA         : sent = sent + 536;
`PLI_WRITE_TH_XCC_REG : sent = sent + 3;
endcase // case(cmd)
if((sent >=  `CMD_BUFSIZE) && (cmd != `PLI_QUIT))begin
while(sent != 0)begin
sent = $bw_sas_send(`PLI_RETRY);
rdAndcmp;
if(dead_socket)begin
sent = `CMD_BUFSIZE;
@ (posedge clk);
end
end
end
case(cmd)
`PLI_QUIT             : sent = $bw_sas_send(`PLI_QUIT);
`PLI_SSTEP            : sent = $bw_sas_send(`PLI_SSTEP, thr);
`PLI_READ_TH_REG      : sent = $bw_sas_send(`PLI_READ_TH_REG, thr, win, addr);
`PLI_READ_TH_CTL_REG  : sent = $bw_sas_send(`PLI_READ_TH_CTL_REG, thr, win);
`PLI_READ_TH_FP_REG_I : sent = $bw_sas_send(`PLI_READ_TH_FP_REG_I, thr, addr);
`PLI_READ_TH_FP_REG_X : sent = $bw_sas_send(`PLI_READ_TH_FP_REG_X, thr, addr);
`PLI_RTL_CYCLE        : sent = $bw_sas_send(`PLI_RTL_CYCLE, counter);
`PLI_RTL_DATA         : sent = $bw_sas_send(`PLI_RTL_DATA, data);
`PLI_WRITE_TH_XCC_REG : sent = $bw_sas_send(`PLI_WRITE_TH_XCC_REG, thr, win);
`PLI_RETRY            : sent = $bw_sas_send(`PLI_RETRY);
endcase // case(cmd)
end
endtask // send_cmd
*/
// reg timestamp;
// reg [63:0] time_stamp;

reg [31:0] max_32;

initial
begin
    timestamp   = 1;
    rtl_counter = 0;
    pli_flag    = 0;
    if($test$plusargs("debug_cycle"))pli_flag = 1;
end



task send_cmd;
    input [7:0]    cmd;
    input [7:0]    thr;
    input [7:0]    win;
    input [7:0]    addr;
    input [10:0]   counter;
    input [4287:0] data;//4288

    begin //send rtl cycle before sending any request to simics.
        if(sas_int && `SAS_INTER.counter)begin
            sent = $bw_sas_send(`PLI_RTL_CYCLE, `SAS_INTER.counter);
            `SAS_INTER.counter = 0;
        end
        case(cmd)
            `PLI_QUIT             : sent = $bw_sas_send(`PLI_QUIT);
            `PLI_SSTEP            : sent = $bw_sas_send(`PLI_SSTEP, thr);
            `PLI_READ_TH_REG      : sent = $bw_sas_send(`PLI_READ_TH_REG, thr, win, addr);
            `PLI_READ_TH_CTL_REG  : sent = $bw_sas_send(`PLI_READ_TH_CTL_REG, thr, win);
            `PLI_READ_TH_FP_REG_I : sent = $bw_sas_send(`PLI_READ_TH_FP_REG_I, thr, addr);
            `PLI_READ_TH_FP_REG_X : sent = $bw_sas_send(`PLI_READ_TH_FP_REG_X, thr, addr);
            `PLI_RTL_CYCLE        : begin
                if(timestamp)begin
                    timestamp  = 0;
                    sent = $bw_sas_send(`TIMESTAMP, time_stamp[63:56], time_stamp[55:48],  time_stamp[47:40], time_stamp[39:32],
                                        time_stamp[31:24], time_stamp[23:16],  time_stamp[15:8],  time_stamp[7:0]);

                end
                sent = $bw_sas_send(`PLI_RTL_CYCLE, counter);

            end

            `PLI_RTL_DATA         : begin
                sent = $bw_sas_send(`PLI_RTL_DATA, data);
            end

            `PLI_WRITE_TH_XCC_REG : sent = $bw_sas_send(`PLI_WRITE_TH_XCC_REG, thr, win);
            `PLI_WRITE_TH_REG_HI  : sent = $bw_sas_send(`PLI_WRITE_TH_REG_HI, thr, win, addr,
                        data[31:24], data[23:16],  data[15:8], data[7:0]);
            `PLI_WRITE_TH_REG     : sent = $bw_sas_send(`PLI_WRITE_TH_REG, thr, win, addr,
                        data[63:56], data[55:48],  data[47:40], data[39:32],
                        data[31:24], data[23:16],  data[15:8], data[7:0]);
            `PLI_WRITE_TH_CTL_REG : sent = $bw_sas_send(`PLI_WRITE_TH_CTL_REG, thr, addr,
                        data[63:56], data[55:48],  data[47:40], data[39:32],
                        data[31:24], data[23:16],  data[15:8],  data[7:0]);
            `PLI_RETRY            : sent = $bw_sas_send(`PLI_RETRY);
            `PLI_FORCE_TRAP_TYPE  : sent = $bw_sas_send(`PLI_FORCE_TRAP_TYPE, thr, data[7:0]);
            `PLI_RESET_TLB_ENTRY  : sent = $bw_sas_send(`PLI_RESET_TLB_ENTRY, thr, win, addr);
            `PLI_INST_TTE         : sent = $bw_sas_send(`PLI_INST_TTE, thr,
                        data[63:56], data[55:48],  data[47:40], data[39:32],
                        data[31:24], data[23:16],  data[15:8],  data[7:0]);
            `PLI_DATA_TTE         : sent = $bw_sas_send(`PLI_DATA_TTE, thr,
                        data[63:56], data[55:48],  data[47:40], data[39:32],
                        data[31:24], data[23:16],  data[15:8],  data[7:0]);
        endcase // case(cmd)
    end
endtask // send_cmd
task register_cmp;
    input [7:0]  type;
    input [2:0]  spc;
    input [1:0]  thread;
    input [2:0]  window;
    input [5:0]  rtl_reg_addr;
    input [63:0] rtl_reg_val;
    input [63:0] sas_reg_val;
    input [63:0] sas_sps_val;
    input [4:0]  rs1;
    input [63:0] val1;
    input [4:0]  rs2;
    input [63:0] val2;
    input [3:0]  cond;
    reg   [63:0] sas_temp;

    begin
        case(type)
            `REG_WRITE_BACK : begin
                sym = sym_tab[rtl_reg_addr[5:3]];
                if(sas_def == 0)begin
                    $display("%0t:reg_updated -> spc(%x) thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) val = %x",
                             $time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val);
                end

                else if(rtl_reg_addr == 6'b00_0000)begin
                    /*$display("%0d:Warning : reg-MISMATCH -> spc(%d) thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) rtl_reg_val = %x, sas_reg_val =%x",
                    $time, spc, thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val, sas_reg_val);*/
                end // if (rtl_reg_addr == 6'b00_0000)
                else if(cond)begin
                    if(cond[2])begin
                        if(rtl_reg_val[7:0] == sas_reg_val[7:0])begin
                            $display("%0t:reg-MATCH -> spc(%d)  thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) val = %x",
                                     sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val[7:0]);
                        end
                        else begin
                            $display("%0t:reg-MISMATCH -> spc(%d) thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) rtl_reg_val = %x, sas_reg_val =%x",
                                     sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val[15:0], sas_reg_val[15:0]);
                            `MONITOR_PATH.fail("reg-MISMATCH");
                        end
                    end
                    else if(rtl_reg_val[31:0] == sas_reg_val[31:0])begin
                        $display("%0t:reg-MATCH -> spc(%d)  thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) val = %x",
                                 sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val[31:0]);
                    end
                    else begin
                        $display("%0t:reg-MISMATCH -> spc(%d) thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) rtl_reg_val = %x, sas_reg_val =%x",
                                 sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val[31:0], sas_reg_val[31:0]);
                        `MONITOR_PATH.fail("reg-MISMATCH");
                    end
                end
                else  if(rtl_reg_val == sas_reg_val)begin
                    $display("%0t:reg-MATCH -> spc(%d)  thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) val = %x",
                             sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val);
                end
                else begin
                    dummy =  $bw_sas_recv(sas_val, next_thread, sas_win, sas_addr, 254, 77, sas_which, sas_temp);
                    //  $display("MISM %x %x %x\n", dummy, sas_temp, sas_reg_val);

                    if(dummy && (sas_temp == sas_reg_val) )begin
                        dummy  = $bw_list(`TOP_MOD.list_handle, 7);//push back
                    end
                    else begin
                        $display("%0t:reg-MISMATCH -> spc(%d) thread(%d) window(%d) rs1(%x)->%x rs2(%x)->%x reg#(%s%0x) rtl_reg_val = %x, sas_reg_val =%x",
                                 sas_time, spc,  thread, window, rs1, val1, rs2, val2, sym, rtl_reg_addr[2:0], rtl_reg_val, sas_reg_val);
                        `MONITOR_PATH.fail("reg-MISMATCH");
                    end
                end
            end
            `PC             : begin
                if(sas_def == 0)begin
                    $display("%0t:pc-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(cond[3])begin//AM bit set
                    if(rtl_reg_val[31:0] == sas_sps_val[31:0])begin
                        $display("%0t:pc-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[31:0]);
                    end
                    else begin
                        $display("%0t:pc-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_pc_reg = %x, sas_pc_reg =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[31:0], sas_sps_val[31:0]);
                        `MONITOR_PATH.fail("pc-MISMATCH");
                    end
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:pc-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:pc-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_pc_reg = %x, sas_pc_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("pc-MISMATCH");
                end
            end
            `NPC             : begin
                if(sas_def == 0)begin
                    $display("%0t:npc-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(cond[3])begin//PSTATE.AM=1
                    if(rtl_reg_val[31:0] == sas_sps_val[31:0])begin
                        $display("%0t:npc-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[31:0]);
                    end
                    else begin
                        $display("%0t:npc-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_npc_reg = %x, sas_npc_reg =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[31:0], sas_sps_val[31:0]);
                        `MONITOR_PATH.fail("npc-MISMATCH");
                    end
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:npc-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end

                else begin
                    $display("%0t:npc-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_npc_reg = %x, sas_npc_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("npc-MISMATCH");
                end
            end
            `Y              : begin
                if(sas_def == 0)begin
                    $display("%0t:y_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[31:0]);
                end
                else if(rtl_reg_val[31:0] == sas_sps_val[31:0])begin
                    $display("%0t:y_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[31:0]);

                end
                else begin
                    $display("%0t:y_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_y_reg = %x, sas_y_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[31:0], sas_sps_val[31:0]);
                    `MONITOR_PATH.fail("Y_reg-MISMATCH");
                end
            end
            `CCR            : begin
                if(sas_def == 0)begin
                    $display("%0t:ccr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[7:0]);
                end
                else if(cond)begin
                    if(rtl_reg_val[7:0] == sas_sps_val[7:0])begin

                        $display("%0t:ccr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[7:0]);


                    end
                    else begin
                        dummy =  $bw_sas_recv(ccr_req, thread, sas_win, sas_addr, 254, 35, sas_timer, sas_sps_val[7:0]);
                        //$display("MISMATC CCR", ccr_req);

                        if(rtl_reg_val[7:0] == ccr_req[7:0])begin
                            $display("%0t:ccr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                     sas_time, spc, thread, window, rtl_reg_val[7:0]);
                        end
                        else begin
                            $display("%0t:ccr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_ccr_reg = %x, sas_ccr_reg =%x",
                                     sas_time, spc, thread, window, rtl_reg_val[7:0], sas_sps_val[7:0]);
                            `MONITOR_PATH.fail("ccr_reg-MISMATCH");
                        end

                    end
                end
                else if(rtl_reg_val[7:0] == sas_sps_val[7:0])begin
                    $display("%0t:ccr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[7:0]);

                end
                else begin
                    dummy =  $bw_sas_recv(ccr_req, thread, sas_win, sas_addr, 254, 35, sas_timer, sas_sps_val[7:0]);
                    //$display("MISMATC CCR", ccr_req);
                    if(rtl_reg_val[7:0] == ccr_req[7:0])begin
                        $display("%0t:ccr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[7:0]);
                    end
                    else begin
                        $display("%0t:ccr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_ccr_reg = %x, sas_ccr_reg =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[7:0], sas_sps_val[7:0]);
                        `MONITOR_PATH.fail("ccr_reg-MISMATCH");
                    end
                end
            end
            `FPRS            : begin
                if(sas_def == 0)begin
                    $display("%0t:fprs_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, cond ? rtl_reg_val[2:0] : rtl_reg_val[1:0] );
                end
                else if(fprs_on)begin
                    if(cond)begin
                        if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                            $display("%0t:fprs_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                     sas_time, spc, thread, window, rtl_reg_val[2:0]);
                        end
                        else begin
                            $display("%0t:fprs_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_fprs_reg = %x, sas_fprs_reg =%x",
                                     sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                            `MONITOR_PATH.fail("fprs_reg-MISMATCH");
                        end
                    end // if (cond)
                    else begin
                        if(rtl_reg_val[1:0] == sas_sps_val[1:0])begin
                            $display("%0t:fprs_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                     sas_time, spc, thread, window, rtl_reg_val[1:0]);
                        end
                        else begin
                            if((sas_sps_val[0] == 0) && rtl_reg_val[0] || (sas_sps_val[1] == 0) && rtl_reg_val[1])begin
                                $display("%0t:fprs_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                         sas_time, spc, thread, window, rtl_reg_val[1:0]);
                            end
                            else begin
                                $display("%0t:fprs_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_fprs_reg = %x, sas_fprs_reg =%x",
                                         sas_time, spc, thread, window, rtl_reg_val[1:0], sas_sps_val[1:0]);
                                `MONITOR_PATH.fail("fprs_reg-MISMATCH");
                            end
                        end
                    end // else: !if(cond)
                end // if (fprs_on)
            end // case: `FPRS
            `FSR            : begin
                rtl_reg_val[22] = 0;//mask ns
                sas_sps_val[22] = 0;
                rtl_reg_val[13] = 0;//mask gne
                sas_sps_val[13] = 0;
                if(sas_def == 0)begin
                    $display("%0t:fsr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[37:0]);
                end
                else if(rtl_reg_val[37:0] == sas_sps_val[37:0])begin//temp.
                    $display("%0t:fsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[37:0]);
                end
                /* else if(rtl_reg_val[0] == 0)begin
                $display("%0t:WARNING fsr_reg -> spc(%d) thread(%d)  window(%d)  rtl_fsr_reg = %x, sas_fsr_reg =%x",
                $time, spc, thread, window, rtl_reg_val[37:0], sas_sps_val[37:0]);
                end*/
                else begin
                    $display("%0t:fsr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_fsr_reg = %x, sas_fsr_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[37:0], sas_sps_val[37:0]);
                    `MONITOR_PATH.fail("fsr_reg-MISMATCH");
                end
            end
            `ASI            : begin
                if(sas_def == 0)begin
                    $display("%0t:asi_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[7:0]);
                end
                else if(rtl_reg_val[7:0] == sas_sps_val[7:0])begin
                    $display("%0t:asi_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[7:0]);
                end
                else begin
                    $display("%0t:asi_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_asi_reg = %x, sas_asi_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[7:0], sas_sps_val[7:0]);
                    `MONITOR_PATH.fail("ccr_reg-MISMATCH");
                end
            end // case: `CCR
            `TICK_SAS           : begin
                sas_temp = sas_sps_val - 1;

                if(sas_def == 0)begin
                    $display("%0t:tick_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else if(rtl_reg_val[63:4] == sas_temp[63:4])begin
                    $display("%0t:tick_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    $display("%0t:tick_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tick_reg = %x, sas_tick_reg =%x",
                             $time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    // `MONITOR_PATH.fail("tick_reg-MISMATCH");
                end
            end
            `TICK_CMPR           : begin
                if(sas_def == 0)begin
                    $display("%0t:tick_cmpr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[63:0]);
                end

                else if((cond == 7) && (rtl_reg_val[63] == sas_sps_val[63]))begin
                    $display("%0t:tick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63]);
                end
                else if((cond == 0) && (rtl_reg_val[63:0] == sas_sps_val[63:0]))begin
                    $display("%0t:tick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    if(cond == 7)
                        $display("%0t:tick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tick_cmpr_reg[63] = %x, sas_tick_cmpr_reg[63] =%x",
                                 $time, spc, thread, window, rtl_reg_val[63], sas_sps_val[63]);
                    else $display("%0t:tick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tick_cmpr_reg = %x, sas_tick_cmpr_reg =%x",
                                      $time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    `MONITOR_PATH.fail("tick_cmpr_reg-MISMATCH");
                end
            end
            `STICK_CMPR           : begin
                if(sas_def == 0)begin
                    $display("%0t:stick_cmpr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else if((cond == 7) && (rtl_reg_val[63] == sas_sps_val[63]))begin
                    $display("%0t:stick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63]);
                end
                else if((cond == 0) && (rtl_reg_val[63:0] == sas_sps_val[63:0]))begin
                    $display("%0t:stick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    if(cond == 7)
                        $display("%0t:stick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_stick_cmpr_reg[63] = %x, sas_stick_cmpr_reg[63] =%x",
                                 $time, spc, thread, window, rtl_reg_val[63], sas_sps_val[63]);
                    else $display("%0t:stick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_stick_cmpr_reg = %x, sas_stick_cmpr_reg =%x",
                                      $time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    `MONITOR_PATH.fail("stick_cmpr_reg-MISMATCH");
                end
            end
            `GSR            : begin
                if(sas_def == 0)begin
                    $display("%0t:gsr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[63:0]);
                end

                else if(rtl_reg_val[63:0] == sas_sps_val[63:0])begin
                    $display("%0t:gsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    $display("%0t:gsr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_gsr_reg = %x, sas_gsr_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    `MONITOR_PATH.fail("gsr_reg-MISMATCH");
                end
            end // case: `TICK_CMPR
            `PSTATE_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:pstate_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[11:0]);
                end
                else if(rtl_reg_val[11:0] == sas_sps_val[11:0])begin
                    $display("%0t:pstate_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[11:0]);
                end
                else begin
                    $display("%0t:pstate_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_pstate_reg = %x, sas_pstate_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[11:0], sas_sps_val[11:0]);
                    `MONITOR_PATH.fail("pstate_reg MISMATCH");
                end
            end
            `TL_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:tl_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:tl_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:tl_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tl_reg = %x, sas_tl_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("tl_reg-MISMATCH");
                end
            end
            `PIL_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:pil_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[3:0]);
                end
                else if(rtl_reg_val[3:0] == sas_sps_val[3:0])begin
                    $display("%0t:pil_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[3:0]);
                end
                else begin
                    $display("%0t:pil_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_pil_reg = %x, sas_pil_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[3:0], sas_sps_val[3:0]);
                    `MONITOR_PATH.fail("pil_reg-MISMATCH");
                end
            end
            `TPC1, `TPC2, `TPC3, `TPC4, `TPC5, `TPC6 : begin
                if(sas_def == 0)begin
                    $display("%0t:tpc%0d_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, type - `PIL_SAS, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(!cond[2])begin
                    if(cond[3])//pstaet.am bit
                    begin
                        if(rtl_reg_val[31:0] == sas_sps_val[31:0])begin
                            $display("%0t:tpc%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                     sas_time, type - `PIL_SAS, spc, thread, window, rtl_reg_val[31:0]);
                        end // if (rtl_reg_val[31:0] == sas_sps_val[31:0])
                        else begin
                            $display("%0t:tpc%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tpc_reg = %x, sas_tpc_reg =%x",
                                     sas_time, type - `PIL_SAS, spc, thread, window, rtl_reg_val[31:0], sas_sps_val[31:0]);
                            `MONITOR_PATH.fail("tpc_reg-MISMATCH");
                        end
                    end
                    else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                        $display("%0t:tpc%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, type - `PIL_SAS, spc, thread, window, rtl_reg_val[47:0]);
                    end
                    else begin
                        $display("%0t:tpc%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tpc_reg = %x, sas_tpc_reg =%x",
                                 sas_time, type - `PIL_SAS, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                        `MONITOR_PATH.fail("tpc_reg-MISMATCH");
                    end
                end
            end
            `TNPC1, `TNPC2, `TNPC3, `TNPC4, `TNPC5, `TNPC6 : begin
                if(sas_def == 0)begin
                    $display("%0t:tnpc%0d_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, type - 56, spc, thread, window, rtl_reg_val[47:0]);
                end

                else if(!cond[2])begin
                    if(cond[3])begin
                        if(rtl_reg_val[31:0] == sas_sps_val[31:0])begin
                            $display("%0t:tnpc%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                     sas_time, type - 56, spc, thread, window, rtl_reg_val[31:0]);
                        end
                        else begin
                            $display("%0t:tnpc%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tnpc_reg = %x, sas_tnpc_reg =%x",
                                     sas_time, type - 56, spc, thread, window, rtl_reg_val[31:0], sas_sps_val[31:0]);
                            `MONITOR_PATH.fail("tnpc_reg-MISMATCH");
                        end
                    end
                    else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                        $display("%0t:tnpc%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, type - 56, spc, thread, window, rtl_reg_val[47:0]);
                    end
                    else begin
                        $display("%0t:tnpc%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tnpc_reg = %x, sas_tnpc_reg =%x",
                                 sas_time, type - 56, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                        `MONITOR_PATH.fail("tnpc_reg-MISMATCH");
                    end
                end
            end
            `TSTATE1, `TSTATE2, `TSTATE3, `TSTATE4, `TSTATE5, `TSTATE6 : begin
                if(sas_def == 0)begin
                    $display("%0t:tstate%0d_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, type - 66, spc, thread, window, rtl_reg_val[39:0]);
                end
                else if(!cond[2])begin
                    if(rtl_reg_val[39:0] == sas_sps_val[39:0])begin
                        $display("%0t:tstate%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, type - 66, spc, thread, window, rtl_reg_val[39:0]);
                    end
                    else begin
                        $display("%0t:tstate%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tstate_reg = %x, sas_tstate_reg =%x",
                                 sas_time, type - 66, spc, thread, window, rtl_reg_val[39:0], sas_sps_val[39:0]);
                        `MONITOR_PATH.fail("tstate_reg-MISMATCH");
                    end
                end
            end
            `TT1, `TT2, `TT3, `TT4, `TT5, `TT6 : begin
                if(sas_def == 0)begin
                    $display("%0t:ttype%0d_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, type - 76, spc, thread, window, rtl_reg_val[8:0]);
                end
                else if(rtl_reg_val[8:0] == sas_sps_val[8:0])begin
                    $display("%0t:ttype%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, type - 76, spc, thread, window, rtl_reg_val[8:0]);
                end
                else begin
                    $display("%0t:ttype%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_ttype_reg = %x, sas_ttype_reg =%x",
                             sas_time, type - 76, spc, thread, window, rtl_reg_val[8:0], sas_sps_val[8:0]);
                    `MONITOR_PATH.fail("ttype_reg-MISMATCH");
                end
            end // case: `TT1, `TT2, `TT3, `TT4, `TT5, `TT6

            `TBA_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:tba_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:15] == sas_sps_val[47:15])begin
                    $display("%0t:tba_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:15]);
                end
                else begin
                    $display("%0t:tba_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tba_reg = %x, sas_tba_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:15], sas_sps_val[47:15]);
                    `MONITOR_PATH.fail("tba_reg-MISMATCH");
                end
            end // case: `TBA
            `VER            : begin
                if(sas_def == 0)begin
                    $display("%0t:ver_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[32:0]);
                end
                else if(rtl_reg_val[32:0] == sas_sps_val[32:0])begin
                    $display("%0t:ver_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[32:0]);
                end
                else begin
                    $display("%0t:ver_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_tba_reg = %x, sas_tba_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[32:0], sas_sps_val[47:15]);
                    `MONITOR_PATH.fail("ver_reg-MISMATCH");
                end
            end // case: `TBA
            `CWP            : begin
                if(sas_def == 0)begin
                    $display("%0t:cwp_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:cwp_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:cwp_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cwp_reg = %x, sas_cwp_reg =%x",
                             $time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("cwp_reg-MISMATCH");
                end
            end
            `CANSAVE            : begin
                if(sas_def == 0)begin
                    $display("%0t:cansave_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:cansave_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:cansave_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cansave_reg = %x, sas_cansave_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("cansave_reg-MISMATCH");
                end
            end
            `CANRESTORE           : begin
                if(sas_def == 0)begin
                    $display("%0t:canrestore_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:canrestore_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:canrestore_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_restore_reg = %x, sas_restore_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("canrestore_reg-MISMATCH");
                end
            end
            `OTHERWIN           : begin
                if(sas_def == 0)begin
                    $display("%0t:otherwin_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:otherwin_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:otherwin_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_otherwin_reg = %x, sas_otherwin_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("otherwin_reg-MISMATCH");
                end
            end
            `WSTATE           : begin
                if(sas_def == 0)begin
                    $display("%0t:wstate_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[5:0]);

                end
                else if(rtl_reg_val[5:0] == sas_sps_val[5:0])begin
                    $display("%0t:wstate_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else begin
                    $display("%0t:wstate_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_wstate_reg = %x, sas_wstate_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0], sas_sps_val[5:0]);
                    `MONITOR_PATH.fail("wstate_reg-MISMATCH");
                end
            end
            `CLEANWIN           : begin
                if(sas_def == 0)begin
                    $display("%0t:cleanwin_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end

                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:cleanwin_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:cleanwin_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cleanwin_reg = %x, sas_cleanwin_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("cleanwin_reg-MISMATCH");
                end
            end // case: `CLEANWIN
            `SOFTINT           : begin
                if(sas_def == 0)begin
                    $display("%0t:softint_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, 1'b1);
                end

                else if(rtl_reg_val[16:0] == sas_sps_val[16:0])begin
                    $display("%0t:softint_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[16:0]);
                end
                else begin
                    $display("%0t:softint_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_soft_reg = %x, sas_soft_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[16:0], sas_sps_val[16:0]);
                    `MONITOR_PATH.fail("softint_reg-MISMATCH");
                end
            end
            `ECACHE_ERROR_ENABLE           : begin
                if(sas_def == 0)begin
                    $display("%0t:ecache_error_enable_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:ecache_error_enable_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:ecache_error_enable_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cleanwin_reg = %x, sas_cleanwin_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("ecache_error_enable_reg-MISMATCH");
                end
            end // case: `UPAD_CONFIG
            `ASYNCHRONOUS_FAULT_STATUS           : begin
                if(sas_def == 0)begin
                    $display("%0t:asynchronous_fault_status_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:asynchronous_fault_status_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:asynchronous_fault_status_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cleanwin_reg = %x, sas_cleanwin_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("asynchronous_fault_status_reg-MISMATCH");
                end
            end // case: `UPAD_CONFIG
            `ASYNCHRONOUS_FAULT_ADDRESS           : begin
                if(sas_def == 0)begin
                    $display("%0t:asynchronous_fault_address_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:asynchronous_fault_address_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:asynchronous_fault_address_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_cleanwin_reg = %x, sas_cleanwin_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("asynchronous_fault_status_reg-MISMATCH");
                end
            end
            `INTR_DISPATCH_STATUS           : begin
                if(sas_def == 0)begin
                    $display("%0t:intr_dispatch_status_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[10:0]);
                end
                else if(rtl_reg_val[10:0] == sas_sps_val[10:0])begin
                    $display("%0t:intr_dispatch_status_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[10:0]);
                end
                else begin
                    $display("%0t:intr_dispatch_status_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_intr_dispatch_status_reg = %x, sas_intr_dispatch_status_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[10:0], sas_sps_val[10:0]);
                    `MONITOR_PATH.fail("intr_dispatch_status_reg-MISMATCH");
                end
            end
            `INTR_RECEIVE          : begin
                if(sas_def == 0)begin
                    $display("%0t:intr_receive_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[63:0] == sas_sps_val[63:0])begin
                    $display("%0t:intr_receive_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    $display("%0t:intr_receive_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_intr_receive_reg = %x, sas_intr_receive_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    `MONITOR_PATH.fail("intr_receive_reg-MISMATCH");
                end
            end // case: `IN_INTR_DATA2
            `FLOAT_I           : begin
                if((rtl_reg_addr > 31) && rtl_reg_addr[1])sas_reg_val[31:0] = sas_reg_val[63:32];
                if(sas_def == 0)begin
                    $display("%0t:float_reg-updated -> spc(%d) thread(%d) reg#(%0d) val = %x",
                             $time, spc, thread, rtl_reg_addr, rtl_reg_val[31:0]);
                end
                else if(rtl_reg_val[31:0] == sas_reg_val[31:0])begin
                    $display("%0t:float_reg-MATCH -> spc(%d) thread(%d) reg#(f%0d) val = %x",
                             sas_time, spc, thread, rtl_reg_addr, rtl_reg_val[31:0]);
                end
                else begin
                    $display("%0t:float_reg-MISMATCH -> spc(%d) thread(%d)  reg#(f%0d) rtl_float_reg = %x, sas_float_reg =%x",
                             sas_time, spc, thread, rtl_reg_addr, rtl_reg_val[31:0], sas_reg_val[31:0]);
                    `MONITOR_PATH.fail("float_reg-MISMATCH");
                end
            end // case: `FLOAT_I
            `FLOAT_X           : begin
                if(sas_def == 0)begin
                    $display("%0t:float_reg-updated -> spc(%d) thread(%d) reg#(f%0d) val = %x",
                             $time, spc, thread, rtl_reg_addr, rtl_reg_val[63:0]);
                end
                else if(rtl_reg_val[63:0] == sas_reg_val[63:0])begin
                    $display("%0t:float_reg-MATCH -> spc(%d) thread(%d) reg#(f%0d) val = %x",
                             sas_time, spc, thread, rtl_reg_addr, rtl_reg_val[63:0]);
                end
                else begin
                    $display("%0t:float_reg-MISMATCH -> spc(%d) thread(%d)  reg#(f%0d) rtl_float_reg = %x, sas_float_reg =%x",
                             sas_time, spc, thread, rtl_reg_addr, rtl_reg_val[63:0], sas_reg_val[63:0]);
                    `MONITOR_PATH.fail("float_reg-MISMATCH");
                end
            end // case: `FLOAT_I
            `HTBA_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:htba_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[33:0]);
                end
                else if(rtl_reg_val[33:0] == sas_sps_val[33:0])begin
                    $display("%0t:htba_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[33:0]);
                end
                else begin
                    $display("%0t:htba_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_htba_reg = %x, sas_htba_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[33:0], sas_sps_val[33:0]);
                    `MONITOR_PATH.fail("htba_reg-MISMATCH");
                end
            end // case: `TBA
            `HINTP_SAS            : begin
                if(sas_def == 0)begin
                    $display("%0t:hintp_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[3:0]);
                end
                else if(rtl_reg_val[3:0] == sas_sps_val[3:0])begin
                    $display("%0t:hintp_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[3:0]);
                end
                else begin
                    $display("%0t:hintp_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_hintp_reg = %x, sas_hintp_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[3:0], sas_sps_val[3:0]);
                    `MONITOR_PATH.fail("hintp_reg-MISMATCH");
                end
            end // case: `HINTP
            `HSTICK_CMPR            : begin
                if(sas_def == 0)begin
                    $display("%0t:hstick_cmpr_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else if((cond == 7) && (rtl_reg_val[63] == sas_sps_val[63]))begin
                    $display("%0t:hstick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63]);
                end
                else if((cond == 0) && (rtl_reg_val[63:0] == sas_sps_val[63:0]))begin
                    $display("%0t:hstick_cmpr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[63:0]);
                end
                else begin
                    if(cond == 7)
                        $display("%0t:hstick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_stick_cmpr_reg[63] = %x, sas_hstick_cmpr_reg[63] =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[63], sas_sps_val[63]);
                    else  $display("%0t:hstick_cmpr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_stick_cmpr_reg = %x, sas_hstick_cmpr_reg =%x",
                                       sas_time, spc, thread, window, rtl_reg_val[63:0], sas_sps_val[63:0]);
                    `MONITOR_PATH.fail("hstick_cmpr_reg-MISMATCH");
                end
            end // case: `HINTP
            `HPSTATE_SAS            : begin
                sas_sps_val[4:0] = {sas_sps_val[10], sas_sps_val[11], sas_sps_val[5], sas_sps_val[2], sas_sps_val[0]};

                if(sas_def == 0)begin
                    $display("%0t:hpstate_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[3:0]);
                end
                else if(rtl_reg_val[4:0] == sas_sps_val[4:0])begin
                    $display("%0t:hpstate_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[4:0]);
                end
                else begin
                    $display("%0t:hpstate_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_hpstate_reg = %x, sas_hpstate_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[4:0], sas_sps_val[4:0]);
                    `MONITOR_PATH.fail("hpstate_reg MISMATCH");
                end
            end // case: `HPSTATE
            `GL            : begin
                if(sas_def == 0)begin
                    $display("%0t:gl_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[1:0]);
                end
                else if(rtl_reg_val[1:0] == sas_sps_val[1:0])begin
                    $display("%0t:gl_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[1:0]);
                end
                else begin
                    $display("%0t:gl_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_gl_reg = %x, sas_gl_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[1:0], sas_sps_val[1:0]);
                    `MONITOR_PATH.fail("gl_reg MISMATCH");
                end
            end // case: `HPSTATE
            `HTSTATE1, `HTSTATE2, `HTSTATE3, `HTSTATE4, `HTSTATE5, `HTSTATE6 : begin
                if(sas_def == 0)begin
                    $display("%0t:htstate%0d_reg-updated -> spc(%d) thread(%d) window(%d) val = %x",
                             $time, type - 108, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(!cond[2])begin
                    if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                        $display("%0t:htstate%0d_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, type - 108, spc, thread, window, rtl_reg_val[2:0]);
                    end
                    else begin
                        $display("%0t:htstate%0d_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_htstate_reg = %x, sas_htstate_reg =%x",
                                 sas_time, type - 108, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                        `MONITOR_PATH.fail("htstate_reg-MISMATCH");
                    end
                end // if (!cond[2])

            end // case: `HTSTATE1, `HTSTATE2, `HTSTATE3, `HTSTATE4, `HTSTATE5, `HTSTATE6
            `ISFSR            : begin
                if(sas_def == 0)begin
                    $display("%0t:isfsr_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[23:0]);
                end
                else if(rtl_reg_val[23:0] == sas_sps_val[23:0])begin
                    $display("%0t:isfsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[23:0]);
                end
                else begin
                    rtl_reg_val[4:3] = 2'b00;
                    sas_sps_val[4:3] = 2'b00;
                    if(rtl_reg_val[23:0] == sas_sps_val[23:0])begin
                        $display("%0t:isfsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[23:0]);
                    end
                    else begin
                        $display("%0t:isfsr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_isfsr_reg = %x, sas_isfsr_reg =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[23:0], sas_sps_val[23:0]);
                        `MONITOR_PATH.fail("isfsr_reg MISMATCH");
                    end
                end
            end // case: `HPSTATE
            `DSFSR            : begin
                if(sas_def == 0)begin
                    $display("%0t:dsfsr_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[23:0]);
                end
                else if(rtl_reg_val[23:0] == sas_sps_val[23:0])begin
                    $display("%0t:dsfsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[23:0]);
                end
                else begin
                    // modified for bug 3323
                    //assign  tlu_isfsr_din_g[23:0] =
                    //{isfsr_asi_g[7:0],2'b0,isfsr_ftype_g[6:0],1'b0, isfsr_ctxt_g[1:0], 2'b0,isfsr_flt_vld_g, 1'b1};
                    rtl_reg_val[4:3] = 2'b00;
                    sas_sps_val[4:3] = 2'b00;
                    rtl_reg_val[7]   = 0;
                    rtl_reg_val[11:10] = 2'b00;
                    rtl_reg_val[5:4]   = 2'b00;
                    sas_sps_val[7]     = 0;
                    sas_sps_val[11:10] = 2'b00;
                    sas_sps_val[5:4]   = 2'b00;
                    if(rtl_reg_val[23:0] == sas_sps_val[23:0])
                        $display("%0t:dsfsr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                                 sas_time, spc, thread, window, rtl_reg_val[23:0]);
                    else begin
                        $display("%0t:dsfsr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_dsfsr_reg = %x, sas_dsfsr_reg =%x",
                                 sas_time, spc, thread, window, rtl_reg_val[23:0], sas_sps_val[23:0]);
                        `MONITOR_PATH.fail("dsfsr_reg MISMATCH");
                    end
                end
            end // case: `HPSTATE
            `SFAR           : begin
                if(sas_def == 0)begin
                    $display("%0t:sfar_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:sfar_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:sfar_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_sfar_reg = %x, sas_sfar_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("sfar_reg MISMATCH");
                end
            end // case: `HPSTATE
            `I_TAG_ACCESS          : begin
                if(sas_def == 0)begin
                    $display("%0t:itag_access_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:itag_access_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:itag_access_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_itag_access_reg = %x, sas_itag_access_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("itag_access_reg MISMATCH");
                end
            end // case: `I_TAG_ACCESS
            `D_TAG_ACCESS          : begin
                if(sas_def == 0)begin
                    $display("%0t:dtag_access_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:dtag_access_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:dtag_access_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_dtag_access_reg = %x, sas_dtag_access_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("dtag_access_reg MISMATCH");
                end
            end // case: `D_TAG_ACCESS
            `CTXT_PRIM   : begin
                if(sas_def == 0)begin
                    $display("%0t:ctxt_prim_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[12:0]);
                end
                else if(rtl_reg_val[12:0] == sas_sps_val[12:0])begin
                    $display("%0t:ctxt_prim_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[12:0]);
                end
                else begin
                    $display("%0t:ctxt_prim_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_ctxt_prim_reg = %x, sas_ctxt_prim_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[12:0], sas_sps_val[12:0]);
                    `MONITOR_PATH.fail("ctxt_prim_reg MISMATCH");
                end
            end // case: `CTXT_PRIM
            `CTXT_SEC   : begin
                if(sas_def == 0)begin
                    $display("%0t:ctxt_sec_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[12:0]);
                end
                else if(rtl_reg_val[12:0] == sas_sps_val[12:0])begin
                    $display("%0t:ctxt_sec_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[12:0]);
                end
                else begin
                    $display("%0t:ctxt_sec_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_ctxt_sec_reg = %x, sas_ctxt_sec_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[12:0], sas_sps_val[12:0]);
                    `MONITOR_PATH.fail("ctxt_sec_reg MISMATCH");
                end
            end // case: `CTXT_SEC
            `I_CTXT_ZERO_PS0   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_zero_ps0_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:i_ctxt_zero_ps0_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:i_ctxt_zero_ps0_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_zero_ps0_reg = %x, sas_i_ctxt_zero_ps0_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("i_ctxt_zero_ps0_reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_PS0
            `D_CTXT_ZERO_PS0   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_zero_ps0_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:d_ctxt_zero_ps0_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:d_ctxt_zero_ps0_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_zero_ps0_reg = %x, sas_d_ctxt_zero_ps0_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("d_ctxt_zero_ps0_reg MISMATCH");
                end
            end // case: `D_CTXT_ZERO_PS0
            `I_CTXT_ZERO_PS1   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_zero_ps1_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:i_ctxt_zero_ps1_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:i_ctxt_zero_ps1_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_zero_ps1_reg = %x, sas_i_ctxt_zero_ps1_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("i_ctxt_zero_ps1_reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_PS1
            `D_CTXT_ZERO_PS1   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_zero_ps1_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:d_ctxt_zero_ps1_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:d_ctxt_zero_ps1_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_zero_ps1_reg = %x, sas_d_ctxt_zero_ps1_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("d_ctxt_zero_ps1_reg MISMATCH");
                end
            end // case: `D_CTXT_ZERO_PS0
            `I_CTXT_ZERO_CONFIG   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_zero_config_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else if(rtl_reg_val[5:0] == sas_sps_val[5:0])begin
                    $display("%0t:i_ctxt_zero_config_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else begin
                    $display("%0t:i_ctxt_zero_config_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_zero_config_reg = %x, sas_i_ctxt_zero_config_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0], sas_sps_val[5:0]);
                    `MONITOR_PATH.fail("i_ctxt_zero_config_reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_CONFIG
            `D_CTXT_ZERO_CONFIG   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_zero_config_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else if(rtl_reg_val[5:0] == sas_sps_val[5:0])begin
                    $display("%0t:d_ctxt_zero_config_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else begin
                    $display("%0t:d_ctxt_zero_config_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_zero_config_reg = %x, sas_d_ctxt_zero_config_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0], sas_sps_val[5:0]);
                    `MONITOR_PATH.fail("d_ctxt_zero_config_reg MISMATCH");
                end
            end // case: `D_CTXT_ZERO_CONFIG
            `I_CTXT_NONZERO_PS0   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_nonzero_ps0_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:i_ctxt_nonzero_ps0_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:i_ctxt_nonzero_ps0_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_nonzero_ps0_reg = %x, sas_i_ctxt_nonzero_ps0__reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("i_ctxt_nonzero_ps0__reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_PS0
            `D_CTXT_NONZERO_PS0   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_nonzero_ps0_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:d_ctxt_nonzero_ps0_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:d_ctxt_nonzero_ps0_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_nonzero_ps0_reg = %x, sasd_ctxt_nonzero_ps0_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("d_ctxt_nonzero_ps0_reg MISMATCH");
                end
            end // case: `D_CTXT_ZERO_PS0
            `I_CTXT_NONZERO_PS1   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_nonzero_ps1_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:i_ctxt_nonzero_ps1_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:i_ctxt_nonzero_ps1_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_nonzero_ps1_reg = %x, sasi_ctxt_nonzero_ps1_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("i_ctxt_nonzero_ps1_reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_PS1
            `D_CTXT_NONZERO_PS1   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_nonzero_ps1_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else if(rtl_reg_val[47:0] == sas_sps_val[47:0])begin
                    $display("%0t:d_ctxt_nonzero_ps1_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0]);
                end
                else begin
                    $display("%0t:d_ctxt_nonzero_ps1_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_nonzero_ps1_reg = %x, sasd_ctxt_nonzero_ps1_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[47:0], sas_sps_val[47:0]);
                    `MONITOR_PATH.fail("d_ctxt_nonzero_ps1__reg MISMATCH");
                end
            end // case: `D_CTXT_ZERO_PS0
            `I_CTXT_NONZERO_CONFIG   : begin
                if(sas_def == 0)begin
                    $display("%0t:i_ctxt_nonzero_config_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else if(rtl_reg_val[5:0] == sas_sps_val[5:0])begin
                    $display("%0t:i_ctxt_nonzero_config_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else begin
                    $display("%0t:i_ctxt_nonzero_config_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_i_ctxt_nonzero_config_reg = %x, sas_i_ctxt_nonzero_config_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0], sas_sps_val[5:0]);
                    `MONITOR_PATH.fail("i_ctxt_nonzero_config_reg MISMATCH");
                end
            end // case: `I_CTXT_ZERO_CONFIG
            `D_CTXT_NONZERO_CONFIG   : begin
                if(sas_def == 0)begin
                    $display("%0t:d_ctxt_nonzero_config_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else if(rtl_reg_val[5:0] == sas_sps_val[5:0])begin
                    $display("%0t:d_ctxt_nonzero_config_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0]);
                end
                else begin
                    $display("%0t:d_ctxt_nonzero_config_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_d_ctxt_nonzero_configreg = %x, sas_d_ctxt_nonzero_config_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[5:0], sas_sps_val[5:0]);
                    `MONITOR_PATH.fail("d_ctxt_nonzero_config_reg MISMATCH");
                end
            end // case: `D_CTXT_NONZERO_CONFIG
            `VA_WP_ADDR  : begin
                if(sas_def == 0)begin
                    $display("%0t:va_wp_addr_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[44:0]);
                end
                else if(rtl_reg_val[44:0] == sas_sps_val[44:0])begin
                    $display("%0t:va_wp_addr_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[44:0]);
                end
                else begin
                    $display("%0t:va_wp_addr_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_va_wp_addr_reg = %x, sas_va_wp_addr_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[44:0], sas_sps_val[44:0]);
                    `MONITOR_PATH.fail("va_wp_addr_reg MISMATCH");
                end
            end // case: `VA_WP_ADDR
            `PID  : begin
                if(sas_def == 0)begin
                    $display("%0t:pid_reg-updated-> spc(%d) thread(%d) window(%d) val = %x",
                             $time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else if(rtl_reg_val[2:0] == sas_sps_val[2:0])begin
                    $display("%0t:pid_reg-MATCH -> spc(%d) thread(%d) window(%d) val = %x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0]);
                end
                else begin
                    $display("%0t:pid_reg-MISMATCH -> spc(%d) thread(%d)  window(%d)  rtl_pid_reg = %x, sas_pid_reg =%x",
                             sas_time, spc, thread, window, rtl_reg_val[2:0], sas_sps_val[2:0]);
                    `MONITOR_PATH.fail("pid_reg MISMATCH");
                end
            end // case: `VA_WP_ADDR
        endcase
    end
endtask
`endif // SAS_DISABLE

endmodule // sas_tasks
          // Local Variables:
          // verilog-library-directories:("." "../../../design/rtl")
          // verilog-library-extensions:(".v" ".h")
          // End:

