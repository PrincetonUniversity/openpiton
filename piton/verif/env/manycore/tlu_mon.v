// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: tlu_mon.v
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
///////////////////////////////////////////////////////////////////////
// tlu_mon.v
//
// Description:
// This file contains monitors required for the TLU (Trap Logic Unit)
// verification including the performance counters
//
///////////////////////////////////////////////////////////////////////

`include "cross_module.tmp.h"

`define	PIB_PCR_RSVD0_HI 	63
`define	PIB_PCR_RSVD0_LO 	10
`define	PIB_PCR_OVFH 		9
`define	PIB_PCR_OVFL 		8
`define	PIB_PCR_RSVD1 		7
`define	MON_PIB_PCR_SL_HI 	6
`define	MON_PIB_PCR_SL_LO 	4
`define	PIB_PCR_RSVD2 		3
`define	MON_PIB_PCR_UT 		2
`define	MON_PIB_PCR_ST 		1
`define	MON_PIB_PCR_PRIV 	0
`define	PIB_SB_FULL_CNT		3'b000
`define	PIB_FP_INST_CNT		3'b001
`define	PIB_IC_MISS_CNT		3'b010
`define	PIB_DC_MISS_CNT		3'b011
`define	PIB_ITLB_MISS_CNT	3'b100
`define	PIB_DTLB_MISS_CNT	3'b101
`define	PIB_L2_IMISS_CNT	3'b110
`define	PIB_L2_DMISS_CNT	3'b111

module tlu_mon(/*AUTOARG*/
	clk,
	grst_l,
	rst_l,
	lsu_ifu_flush_pipe_w,
	tlu_lsu_int_ldxa_vld_w2,
    tlu_lsu_int_ld_ill_va_w2,
	tlu_scpd_wr_vld_g,
	cpu_mondo_head_wr_g,
	cpu_mondo_tail_wr_g,
	dev_mondo_head_wr_g,
	dev_mondo_tail_wr_g,
	resum_err_head_wr_g,
	resum_err_tail_wr_g,
	nresum_err_head_wr_g,
	nresum_err_tail_wr_g,
	ifu_lsu_ld_inst_e,
	ifu_lsu_st_inst_e,
	ifu_lsu_alt_space_e,
	tlu_early_flush_pipe_w,
	tlu_asi_state_e,
	exu_lsu_ldst_va_e,
	por_rstint0_w2,
	por_rstint1_w2,
	por_rstint2_w2,
	por_rstint3_w2,
	tlu_gl_lvl0,
	tlu_gl_lvl1,
	tlu_gl_lvl2,
	tlu_gl_lvl3,
	exu_gl_lvl0,
	exu_gl_lvl1,
	exu_gl_lvl2,
	exu_gl_lvl3,
	ifu_tlu_thrid_d,
	ifu_tlu_inst_vld_m,
	ifu_tlu_imiss_e,
	ifu_tlu_immu_miss_m,
	ifu_tlu_flush_fd_w,
	tlu_thread_inst_vld_g,
	tlu_thread_wsel_g,
	ifu_tlu_l2imiss,
	ifu_tlu_sraddr_d,
	ifu_tlu_rsr_inst_d,
	lsu_tlu_wsr_inst_e,
	tlu_wsr_inst_nq_g,
	tlu_wsr_data_w,
	lsu_tlu_dcache_miss_w2,
	lsu_tlu_l2_dmiss,
	lsu_tlu_stb_full_w2,
	lsu_tlu_dmmu_miss_g,
	ffu_tlu_fpu_tid,
	ffu_tlu_fpu_cmplt,
	tlu_pstate_priv,
	tlu_hpstate_priv,
	tlu_hpstate_enb,
	tlu_pstate_ie,
	wsr_thread_inst_g,
	lsu_tlu_defr_trp_taken_g,
	lsu_tlu_async_ttype_vld_w1,
	lsu_tlu_ttype_vld_m2,
	tlu_ifu_flush_pipe_w,
	tlu_pib_rsr_data_e,
	tlu_pib_priv_act_trap_m,
	tlu_pib_picl_wrap,
	tlu_pib_pich_wrap,
	tlu_ifu_trappc_vld_w1,
	tlu_ifu_trappc_w2,
	tlu_final_ttype_w2,
	tlu_ifu_trap_tid_w1,
	tlu_full_flush_pipe_w2,
	rtl_pcr0,
	rtl_pcr1,
	rtl_pcr2,
	rtl_pcr3,
	rtl_lsu_tlu_stb_full_w2,
	rtl_fpu_cmplt_thread,
	rtl_imiss_thread_g,
	rtl_lsu_tlu_dcache_miss_w2,
	rtl_immu_miss_thread_g,
	rtl_dmmu_miss_thread_g,
	rtl_ifu_tlu_l2imiss,
	rtl_lsu_tlu_l2_dmiss,
	true_pil0,
	true_pil1,
	true_pil2,
	true_pil3,
	rtl_trp_lvl0,
	rtl_trp_lvl1,
	rtl_trp_lvl2,
	rtl_trp_lvl3,
	tcc_inst_w2,
        rtl_pich_cnt0,
	rtl_pich_cnt1,
	rtl_pich_cnt2,
	rtl_pich_cnt3,
        rtl_picl_cnt0,
	rtl_picl_cnt1,
	rtl_picl_cnt2,
	rtl_picl_cnt3,
	tlz_thread,
	th0_sftint_15,
	th1_sftint_15,
	th2_sftint_15,
	th3_sftint_15,
	ifu_swint_g,
	core_id,
	tlu_itlb_wr_vld_g,
	tlu_itlb_dmp_vld_g,
	tlu_itlb_tte_tag_w2,
	tlu_itlb_tte_data_w2,
	itlb_wr_vld,
	dtlb_wr_vld,
	tlu_tlb_access_en_l_d1,
	tlu_lng_ltncy_en_l
	);

  // Global signals
  input		clk;
  input		grst_l;
  input		rst_l;

  // Added bug7148 monitor
  input lsu_ifu_flush_pipe_w;
  input tlu_lsu_int_ldxa_vld_w2;
  input tlu_lsu_int_ld_ill_va_w2;
  input tlu_scpd_wr_vld_g;
  input [3:0]	cpu_mondo_head_wr_g;
  input [3:0]	cpu_mondo_tail_wr_g;
  input [3:0]	dev_mondo_head_wr_g;
  input [3:0]	dev_mondo_tail_wr_g;
  input [3:0]	resum_err_head_wr_g;
  input [3:0]	resum_err_tail_wr_g;
  input [3:0]	nresum_err_head_wr_g;
  input [3:0]	nresum_err_tail_wr_g;
  input			ifu_lsu_ld_inst_e;
  input			ifu_lsu_st_inst_e;
  input			ifu_lsu_alt_space_e;
  input			tlu_early_flush_pipe_w;
  input	[7:0]	tlu_asi_state_e;
  input	[47:0]	exu_lsu_ldst_va_e;
  //Added fot GL monitor
  input			por_rstint0_w2;
  input			por_rstint1_w2;
  input			por_rstint2_w2;
  input			por_rstint3_w2;
  input	[1:0]	tlu_gl_lvl0;
  input	[1:0]	tlu_gl_lvl1;
  input	[1:0]	tlu_gl_lvl2;
  input	[1:0]	tlu_gl_lvl3;
  input	[1:0]	exu_gl_lvl0;
  input	[1:0]	exu_gl_lvl1;
  input	[1:0]	exu_gl_lvl2;
  input	[1:0]	exu_gl_lvl3;
  // Events generated by IFU
  input [1:0]	ifu_tlu_thrid_d;
  input		ifu_tlu_inst_vld_m;
  input		ifu_tlu_imiss_e;
  input		ifu_tlu_immu_miss_m;
  input [3:0]	tlu_thread_inst_vld_g;
  input [3:0]	tlu_thread_wsel_g;
  input [3:0]	ifu_tlu_l2imiss;
  input		ifu_tlu_flush_fd_w;

  // ASR register read/write requests
  input [6:0]	ifu_tlu_sraddr_d;
  input		ifu_tlu_rsr_inst_d;
  input		lsu_tlu_wsr_inst_e;
  input		tlu_wsr_inst_nq_g;
  //input [63:0]	exu_tlu_wsr_data_m;
  input [63:0]	tlu_wsr_data_w;

  // LSU generated events - also include L2 miss
  input [3:0]	lsu_tlu_dcache_miss_w2;
  input [3:0]	lsu_tlu_l2_dmiss;
  input [3:0]	lsu_tlu_stb_full_w2;
  input		lsu_tlu_dmmu_miss_g;

  // FFU generated events - also include L2 miss
  input [1:0]	ffu_tlu_fpu_tid;
  input		ffu_tlu_fpu_cmplt;

  // TLU information for event filtering
  input [3:0]	tlu_pstate_priv;
  input [3:0]	tlu_hpstate_priv;
  input [3:0]	tlu_hpstate_enb;
  input [3:0]	tlu_pstate_ie;
  input [3:0]	wsr_thread_inst_g;
  input 	lsu_tlu_defr_trp_taken_g;
  input 	lsu_tlu_async_ttype_vld_w1;
  input 	lsu_tlu_ttype_vld_m2;
  input 	tlu_ifu_flush_pipe_w;
  input		tcc_inst_w2;

  // pib registersread data
  input [63:0]	tlu_pib_rsr_data_e;
  input [3:0]	tlu_pib_priv_act_trap_m;
  // counter overflow indicators
  input [3:0]	tlu_pib_picl_wrap;
  input [3:0]	tlu_pib_pich_wrap;

  // pic-overflow TrapPC
  input		tlu_ifu_trappc_vld_w1;
  input [48:0]	tlu_ifu_trappc_w2;
  input [8:0]	tlu_final_ttype_w2;
  input [1:0]	tlu_ifu_trap_tid_w1;
  input		tlu_full_flush_pipe_w2;

  /////////////////////////////////////////////////////////
  // All the following singnals the vera pib coverage logic
  input [7:0] rtl_pcr0;
  input [7:0] rtl_pcr1;
  input [7:0] rtl_pcr2;
  input [7:0] rtl_pcr3;
  input [32:0] rtl_pich_cnt0;
  input [32:0] rtl_pich_cnt1;
  input [32:0] rtl_pich_cnt2;
  input [32:0] rtl_pich_cnt3;
  input [32:0] rtl_picl_cnt0;
  input [32:0] rtl_picl_cnt1;
  input [32:0] rtl_picl_cnt2;
  input [32:0] rtl_picl_cnt3;

  input [3:0] rtl_lsu_tlu_stb_full_w2;
  input [3:0] rtl_fpu_cmplt_thread;
  input [3:0] rtl_imiss_thread_g;
  input [3:0] rtl_lsu_tlu_dcache_miss_w2;
  input [3:0] rtl_immu_miss_thread_g;
  input [3:0] rtl_dmmu_miss_thread_g;
  input [3:0] rtl_ifu_tlu_l2imiss;
  input [3:0] rtl_lsu_tlu_l2_dmiss;

  input [3:0] true_pil0;
  input [3:0] true_pil1;
  input [3:0] true_pil2;
  input [3:0] true_pil3;

  input	[2:0]	rtl_trp_lvl0;
  input	[2:0]	rtl_trp_lvl1;
  input	[2:0]	rtl_trp_lvl2;
  input	[2:0]	rtl_trp_lvl3;

  input [3:0] tlz_thread;
  input       th0_sftint_15;
  input       th1_sftint_15;
  input       th2_sftint_15;
  input       th3_sftint_15;
  input       ifu_swint_g;
  input [9:0] core_id;

  // to make sure tlu_itlb_tte_tag, tlu_itlb_tte_data held constant for at least two cycles
  input        tlu_itlb_wr_vld_g;
  input        tlu_itlb_dmp_vld_g;
  input [58:0] tlu_itlb_tte_tag_w2;
  input [42:0] tlu_itlb_tte_data_w2;

  // per Sanjay's request, adding these signals to make sure tag and data are multi-cycle for
  // tlb_wr
  input        itlb_wr_vld;
  input        dtlb_wr_vld;
  input        tlu_tlb_access_en_l_d1;
  input        tlu_lng_ltncy_en_l;

  //////////////
  // Local wires
  wire [3:0]	true_pil_g;
  wire [2:0]	rtl_trp_lvl_g;
  wire [3:0]	imiss_thread_g;
  wire [3:0]	immu_miss_thread_g;
  wire [3:0]	dmmu_miss_thread_g;
  wire [3:0]	fpu_cmplt_thread;

  wire [3:0]	thread_rsel_d;
  wire		pcr_rsel_d;
  wire		pcr_rw_e;
  wire		pic_priv_rw_e;
  wire		pic_npriv_rw_e;
  wire [3:0]	wsr_pcr_sel;
  wire [3:0]	wsr_pic_sel;
  wire [3:0]	pib_priv_act_trap_m;
  wire [1:0]	pic_update_sel_incr;
  wire [3:0]	upd_picl_sel;
  wire [3:0]	pic_cnt_en;
  wire [3:0]	incr_pich_sel;
  wire [32:0]	pich_cnt_sum0;
  wire [32:0]	pich_cnt_sum1;
  wire [32:0]	pich_cnt_sum2;
  wire [32:0]	pich_cnt_sum3;
  wire [7:0]	picl_mask0;
  wire [7:0]	picl_mask1;
  wire [7:0]	picl_mask2;
  wire [7:0]	picl_mask3;
  wire [7:0]	picl_event0;
  wire [7:0]	picl_event1;
  wire [7:0]	picl_event2;
  wire [7:0]	picl_event3;
  wire [3:0]	incr_evq_din;
  wire [3:0]    pib_picl_wrap;
  wire [3:0]    pib_pich_wrap;
  wire [3:0]    pich_twobelow_flg;

  wire [63:0]	pcr_rdata_e;
  wire [63:0]	pic_rdata_e;
  wire [63:0]   pib_rsr_data_e;
  wire [63:0]	pcr_w1;

  wire		pic_ovfl_trappc_vld_g;
  wire [13:0]	pic_ovfl_trappc_g;  // Note: need to change to 48 bits, anf generate at m-state
  wire [8:0]	pic_ovfl_ttype_w1 = 9'h4f;
  wire		defr_trap_taken;
  wire		flushed_thrd_w1;
  wire	[3:0]	thrd_sel_g;
  wire	[3:0]	thrd_sel_w1;

  wire	[7:0]	mon_pcr0;
  wire	[7:0]	mon_pcr1;
  wire	[7:0]	mon_pcr2;
  wire	[7:0]	mon_pcr3;

  wire		swint_15_g;

  // to make sure tlu_itlb_tte_tag, tlu_itlb_tte_data held constant for at least two cycles
  wire		tlu_itlb_wr_vld_rise;
  wire		tlu_itlb_dmp_vld_rise;
  wire		tlu_itlb_wr_dmp_error;

  wire		same_thrd_g_w1;
  wire		same_thrd_w1_w2;

  reg		tlu_itlb_wr_vld_g_d1;
  reg		tlu_itlb_dmp_vld_g_d1;
  reg		tlu_itlb_wr_vld_rise_d1;
  reg		tlu_itlb_dmp_vld_rise_d1;
  reg [58:0]	tlu_itlb_tte_tag_w2_d1;
  reg [42:0]	tlu_itlb_tte_data_w2_d1;

  reg		tlu_tlb_access_en_l_d1_delay;
  reg		tlu_lng_ltncy_en_l_delay;
  wire		tlu_idtlb_wr_error;

  // Local registers
  reg		enable;
  reg	[63:0]	pcr0;
  reg	[63:0]	pcr1;
  reg	[63:0]	pcr2;
  reg	[63:0]	pcr3;
  reg	[32:0]	picl_cnt0;
  reg	[32:0]	picl_cnt1;
  reg	[32:0]	picl_cnt2;
  reg	[32:0]	picl_cnt3;
  reg	[32:0]	pich_cnt0;
  reg	[32:0]	pich_cnt1;
  reg	[32:0]	pich_cnt2;
  reg	[32:0]	pich_cnt3;
  reg	[32:0]	picl_cnt_sum0;
  reg	[32:0]	picl_cnt_sum1;
  reg	[32:0]	picl_cnt_sum2;
  reg	[32:0]	picl_cnt_sum3;

  reg [1:0]	thrid_e;
  reg [1:0]	thrid_m;
  reg [1:0]	thrid_g;
  reg [1:0]	thrid_w1;
  reg [1:0]	thrid_w2;
  reg [1:0]	thrid_w2_dly;
  reg		inst_vld_g;
  reg		inst_vld_w1;
  reg [3:0]	thread_rsel_e, thread_rsel_m, thread_rsel_g, thread_rsel_w1;
  reg		pcr_rsel_e;
  reg [6:0]	ifu_tlu_sraddr_e;
  reg		ifu_tlu_rsr_inst_e;
  reg		pcr_rw_m;
  reg		pic_priv_rw_m;
  reg		pic_npriv_rw_m;
  reg		pcr_rw_g;
  reg		pic_priv_rw_g;
  reg		pic_npriv_rw_g;
  reg		imiss_m;
  reg		imiss_g;
  reg		immu_miss_g;
  reg [1:0]	pic_update_sel_ctr;
  reg [3:0]	pic_cnt_en_w2;
  reg [3:0]	inst_vld_w2;
  reg [3:0]	incr_evq;
  reg [3:0]     picl_cnt_wrap;
  reg [3:0]     pich_cnt_wrap;
  reg [3:0]     picl_wrap_pend;

  reg [8:0]	pic_ovfl_ttype_g;
  reg		pic_ovfl_trappc_vld_w1;
  reg		pic_ovfl_trappc_vld_w2;
  reg		pic_ovfl_trappc_vld_w2_dly;
  reg [13:0]	pic_ovfl_trappc_w1;
  reg [13:0]	pic_ovfl_trappc_w2; // Note: need to change to 48 bits, anf generate at m-state
  reg [13:0]	pic_ovfl_trappc_w2_dly;
  reg		delay_pic_ovfl_trappc;
  reg [3:0]	pic_ovfl_trap_pending;
  reg 		lsu_tlu_defr_trp_taken_w1;
  reg 		tlu_ifu_flush_pipe_w1;
  reg		swint_15_w1;

  reg		sim_fail;

  reg		lsu_ifu_flush_pipe_w1;
  reg		lsu_ifu_flush_pipe_w2;
//////////////////////////////////////////////////////////////////////
// GL Monitor to hunt for bug7084 ////////////////////////////////////
reg	por0_done;
reg	por1_done;
reg	por2_done;
reg	por3_done;
always @(posedge clk)
	if ( ~grst_l )				por0_done <= 1'b0;
	else if ( por_rstint0_w2 )	por0_done <= 1'b1;
	else						por0_done <= por0_done;

always @(posedge clk)
	if ( ~grst_l )				por1_done <= 1'b0;
	else if ( por_rstint1_w2 )	por1_done <= 1'b1;
	else						por1_done <= por1_done;

always @(posedge clk)
	if ( ~grst_l )				por2_done <= 1'b0;
	else if ( por_rstint2_w2 )	por2_done <= 1'b1;
	else						por2_done <= por2_done;

always @(posedge clk)
	if ( ~grst_l )				por3_done <= 1'b0;
	else if ( por_rstint3_w2 )	por3_done <= 1'b1;
	else						por3_done <= por3_done;

always @(posedge clk) begin
	if ((por0_done === 1'b1)  && (tlu_gl_lvl0 !== exu_gl_lvl0)) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: TLU's GL[%0x] != EXU's GL[%0x]", $time, core_id, tlu_gl_lvl0, exu_gl_lvl0);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7084 ");
	end
	if ((por1_done === 1'b1)  && (tlu_gl_lvl1 !== exu_gl_lvl1)) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: TLU's GL[%0x] != EXU's GL[%0x]", $time, core_id, tlu_gl_lvl1, exu_gl_lvl1);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7084 ");
	end
	if ((por2_done === 1'b1)  && (tlu_gl_lvl2 !== exu_gl_lvl2)) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: TLU's GL[%0x] != EXU's GL[%0x]", $time, core_id, tlu_gl_lvl2, exu_gl_lvl2);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7084 ");
	end
	if ((por3_done === 1'b1)  && (tlu_gl_lvl3 !== exu_gl_lvl3)) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: TLU's GL[%0x] != EXU's GL[%0x]", $time, core_id, tlu_gl_lvl3, exu_gl_lvl3);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7084 ");
	end
end

/////////// END of GL(bug7084) Monitor ////////////////////////
/////////// Start of bug77148 Monitor ////////////////////////
always @(posedge clk) begin
  lsu_ifu_flush_pipe_w1 <= lsu_ifu_flush_pipe_w;
  lsu_ifu_flush_pipe_w2 <= lsu_ifu_flush_pipe_w1;
end

assign same_thrd_g_w1 = (thrid_g === thrid_w1) ? 1'b1 : 1'b0;
assign same_thrd_w1_w2 = (thrid_w1 === thrid_w2) ? 1'b1 : 1'b0;

always @(posedge clk) begin
  if (lsu_ifu_flush_pipe_w2 & tlu_lsu_int_ldxa_vld_w2 & same_thrd_w1_w2 & ~tlu_lsu_int_ld_ill_va_w2) begin
		$display("*ERROR*: %0d : tlu_mon: C%0d: has hit bug7148 st/ldxa case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148  st/ldxa case");
  end
  if (lsu_ifu_flush_pipe_w1 & tlu_scpd_wr_vld_g & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0d: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_head_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_tail_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_head_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_tail_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_head_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_tail_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_head_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_tail_wr_g[0] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT0: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end

  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_head_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_tail_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_head_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_tail_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_head_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_tail_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_head_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_tail_wr_g[1] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT1: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end

  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_head_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_tail_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_head_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_tail_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_head_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_tail_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_head_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_tail_wr_g[2] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT2: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end

  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_head_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & cpu_mondo_tail_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_head_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & dev_mondo_tail_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_head_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & resum_err_tail_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_head_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
  if (lsu_ifu_flush_pipe_w1 & nresum_err_tail_wr_g[3] & same_thrd_g_w1) begin
		$display("*ERROR*: %0d : tlu_mon: C%0dT3: has hit bug7148 st/stxa[scratchpad] case", $time, core_id);
		`MONITOR_PATH.fail("tlu_mon: Hit bug7148 st/stxa[scratchpad] case");
  end
end
/////////// END of bug77148 Monitor ////////////////////////

///////////////////////////
// Bug7148 Coverage monitor

wire scpd_va_e = (~exu_lsu_ldst_va_e[5] | (exu_lsu_ldst_va_e[5] & exu_lsu_ldst_va_e[4])) & ~(|exu_lsu_ldst_va_e[2:0]);
wire q_va_e = (&exu_lsu_ldst_va_e[9:6]) & ~(|exu_lsu_ldst_va_e[2:0]);

wire scpd_rd_e =  ifu_lsu_ld_inst_e & ifu_lsu_alt_space_e & (tlu_asi_state_e[7:0]==8'h20) & scpd_va_e;
wire scpd_wr_e =  ifu_lsu_st_inst_e & ifu_lsu_alt_space_e & (tlu_asi_state_e[7:0]==8'h20) & scpd_va_e;
wire qhead_rd_e = ifu_lsu_ld_inst_e & ifu_lsu_alt_space_e & (tlu_asi_state_e[7:0]==8'h25) & q_va_e & ~exu_lsu_ldst_va_e[3];
wire qhead_wr_e = ifu_lsu_st_inst_e & ifu_lsu_alt_space_e & (tlu_asi_state_e[7:0]==8'h25) & q_va_e & ~exu_lsu_ldst_va_e[3];
wire qtail_rd_e = ifu_lsu_ld_inst_e & ifu_lsu_alt_space_e & (tlu_asi_state_e[7:0]==8'h25) & q_va_e & exu_lsu_ldst_va_e[3];
wire thrd_priv_e  = tlu_pstate_priv[thrid_e];

wire asi_rd_wr_e = (scpd_rd_e | scpd_wr_e | qhead_rd_e | qhead_wr_e | qtail_rd_e) & thrd_priv_e;
reg asi_rd_wr_m;
reg asi_rd_wr_g;
reg tlu_early_flush_pipe_w1;

always @(posedge clk) begin
	asi_rd_wr_m <= asi_rd_wr_e;
	asi_rd_wr_g <= asi_rd_wr_m;
	tlu_early_flush_pipe_w1 <= tlu_early_flush_pipe_w;
end

always @(posedge clk) begin
  if (inst_vld_g & asi_rd_wr_g & lsu_ifu_flush_pipe_w1 & ~tlu_early_flush_pipe_w1 & same_thrd_g_w1) begin
		$display("*INFO*: %0d : tlu_mon: C%0d: Condition for bug7148 is hit", $time, core_id);
  end
end

// End of Bug7148 Coverage monitor
//////////////////////////////////

  //===============================
  // extract the used bits os pcr's
  assign mon_pcr0 = { pcr0[`PIB_PCR_OVFH], pcr0[`PIB_PCR_OVFL],
                      pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO],
                      pcr0[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]};
  assign mon_pcr1 = { pcr1[`PIB_PCR_OVFH], pcr1[`PIB_PCR_OVFL],
                      pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO],
                      pcr1[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]};
  assign mon_pcr2 = { pcr2[`PIB_PCR_OVFH], pcr2[`PIB_PCR_OVFL],
                      pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO],
                      pcr2[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]};
  assign mon_pcr3 = { pcr3[`PIB_PCR_OVFH], pcr3[`PIB_PCR_OVFL],
                      pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO],
                      pcr3[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]};

  //==========================
  // decode thread information
  assign thread_rsel_d[0] = ~(|ifu_tlu_thrid_d[1:0]);
  assign thread_rsel_d[1] = ~ifu_tlu_thrid_d[1] &  ifu_tlu_thrid_d[0];
  assign thread_rsel_d[2] =  ifu_tlu_thrid_d[1] & ~ifu_tlu_thrid_d[0];
  assign thread_rsel_d[3] =  (&ifu_tlu_thrid_d[1:0]);

  assign thrd_sel_g[0] = ~thrid_g[1] & ~thrid_g[0];
  assign thrd_sel_g[1] = ~thrid_g[1] &  thrid_g[0];
  assign thrd_sel_g[2] =  thrid_g[1] & ~thrid_g[0];
  assign thrd_sel_g[3] =  thrid_g[1] &  thrid_g[0];
  assign thrd_sel_w1[0] = ~thrid_w1[1] & ~thrid_w1[0];
  assign thrd_sel_w1[1] = ~thrid_w1[1] &  thrid_w1[0];
  assign thrd_sel_w1[2] =  thrid_w1[1] & ~thrid_w1[0];
  assign thrd_sel_w1[3] =  thrid_w1[1] &  thrid_w1[0];

  //============================
  // Decode pcr, pic read-writes
  assign pcr_rsel_d = (ifu_tlu_sraddr_d[6:0] == 7'h10);

  assign pcr_rw_e =
	(ifu_tlu_sraddr_e[6:0] == 7'h10) & (ifu_tlu_rsr_inst_e | lsu_tlu_wsr_inst_e);

  assign pic_npriv_rw_e =
	(ifu_tlu_sraddr_e[6:0] == 7'h11) & (ifu_tlu_rsr_inst_e | lsu_tlu_wsr_inst_e);

  assign pic_priv_rw_e =
	(ifu_tlu_sraddr_e[6:0] == 7'h31) & (ifu_tlu_rsr_inst_e | lsu_tlu_wsr_inst_e);

  //=============================
  // detect privilege action trap
  assign pib_priv_act_trap_m[3:0] = {4{pic_npriv_rw_m}} & { pcr3[`MON_PIB_PCR_PRIV],
                                                            pcr2[`MON_PIB_PCR_PRIV],
                                                            pcr1[`MON_PIB_PCR_PRIV],
                                                            pcr0[`MON_PIB_PCR_PRIV]};

  //===========================
  // generate pcr write enables
  assign wsr_pcr_sel[3:0] = wsr_thread_inst_g[3:0] & {4{pcr_rw_g}};
  assign wsr_pic_sel[3:0] = wsr_thread_inst_g[3:0] & ({4{pic_npriv_rw_g}} | {4{pic_priv_rw_g}});

  //=========================
  // pcr & pic read data path
  assign pcr_rdata_e[63:0] = (thread_rsel_e[0]) ? pcr0[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                             (thread_rsel_e[1]) ? pcr1[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                             (thread_rsel_e[2]) ? pcr2[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                             (thread_rsel_e[3]) ? pcr3[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                             {64{1'b0}};

  assign pic_rdata_e[63:0] = (thread_rsel_e[0]) ? {pich_cnt0[31:0], picl_cnt0[31:0]} :
                             (thread_rsel_e[1]) ? {pich_cnt1[31:0], picl_cnt1[31:0]} :
                             (thread_rsel_e[2]) ? {pich_cnt2[31:0], picl_cnt2[31:0]} :
                             (thread_rsel_e[3]) ? {pich_cnt3[31:0], picl_cnt3[31:0]} :
                             {64{1'b0}};

  assign pib_rsr_data_e[63:0] = (pcr_rsel_e) ? pcr_rdata_e[63:0] : pic_rdata_e[63:0];

  assign pcr_w1[63:0] = (thread_rsel_w1[0]) ? pcr0[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                        (thread_rsel_w1[1]) ? pcr1[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                        (thread_rsel_w1[2]) ? pcr2[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                        (thread_rsel_w1[3]) ? pcr3[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] :
                        {64{1'b0}};

  //====================
  // threading of events
  //====================
  //
  // icache misses
  assign imiss_thread_g[3:0] = {4{imiss_g}} & tlu_thread_wsel_g[3:0];
  //
  // itlb misses
  assign immu_miss_thread_g[3:0] = {4{immu_miss_g}} & tlu_thread_wsel_g[3:0];
  //
  // dtlb misses
  assign dmmu_miss_thread_g[3:0] = {4{lsu_tlu_dmmu_miss_g}} & tlu_thread_wsel_g[3:0];
  //
  // fpu complete
  assign fpu_cmplt_thread[0] = ffu_tlu_fpu_cmplt & (~ffu_tlu_fpu_tid[1] & ~ffu_tlu_fpu_tid[0]);
  assign fpu_cmplt_thread[1] = ffu_tlu_fpu_cmplt & (~ffu_tlu_fpu_tid[1] &  ffu_tlu_fpu_tid[0]);
  assign fpu_cmplt_thread[2] = ffu_tlu_fpu_cmplt & ( ffu_tlu_fpu_tid[1] & ~ffu_tlu_fpu_tid[0]);
  assign fpu_cmplt_thread[3] = ffu_tlu_fpu_cmplt & ( ffu_tlu_fpu_tid[1] &  ffu_tlu_fpu_tid[0]);

  //==============================================
  // round-robin counter & pic update select logic
  assign pic_update_sel_incr[1:0] = pic_update_sel_ctr[1:0] + 2'b01;
  assign upd_picl_sel[0] = ~|(pic_update_sel_incr[1:0]);
  assign upd_picl_sel[1] = ~pic_update_sel_incr[1] &  pic_update_sel_incr[0];
  assign upd_picl_sel[2] = pic_update_sel_incr[1]  & ~pic_update_sel_incr[0];
  assign upd_picl_sel[3] = &(pic_update_sel_incr[1:0]);

  //=======================
  // generate count enables
  assign pic_cnt_en[0] =
            (~tlu_hpstate_priv[0] & ~tlu_pstate_priv[0] & pcr0[`MON_PIB_PCR_UT]) |
            (~tlu_hpstate_enb[0]  & (tlu_hpstate_priv[0] | tlu_pstate_priv[0]) & pcr0[`MON_PIB_PCR_ST]) |
            ( tlu_hpstate_enb[0]  & ~tlu_hpstate_priv[0] & tlu_pstate_priv[0]  & pcr0[`MON_PIB_PCR_ST]);
  assign pic_cnt_en[1] =
            (~tlu_hpstate_priv[1] & ~tlu_pstate_priv[1] & pcr1[`MON_PIB_PCR_UT]) |
            (~tlu_hpstate_enb[1]  & (tlu_hpstate_priv[1] | tlu_pstate_priv[1]) & pcr1[`MON_PIB_PCR_ST]) |
            ( tlu_hpstate_enb[1]  & ~tlu_hpstate_priv[1] & tlu_pstate_priv[1]  & pcr1[`MON_PIB_PCR_ST]);
  assign pic_cnt_en[2] =
            (~tlu_hpstate_priv[2] & ~tlu_pstate_priv[2] & pcr2[`MON_PIB_PCR_UT]) |
            (~tlu_hpstate_enb[2]  & (tlu_hpstate_priv[2] | tlu_pstate_priv[2]) & pcr2[`MON_PIB_PCR_ST]) |
            ( tlu_hpstate_enb[2]  & ~tlu_hpstate_priv[2] & tlu_pstate_priv[2]  & pcr2[`MON_PIB_PCR_ST]);
  assign pic_cnt_en[3] =
            (~tlu_hpstate_priv[3] & ~tlu_pstate_priv[3] & pcr3[`MON_PIB_PCR_UT]) |
            (~tlu_hpstate_enb[3]  & (tlu_hpstate_priv[3] | tlu_pstate_priv[3]) & pcr3[`MON_PIB_PCR_ST]) |
            ( tlu_hpstate_enb[3]  & ~tlu_hpstate_priv[3] & tlu_pstate_priv[3]  & pcr3[`MON_PIB_PCR_ST]);

  assign incr_pich_sel[3:0] = pic_cnt_en_w2[3:0] & inst_vld_w2[3:0] & ({4{~tlu_full_flush_pipe_w2 | tcc_inst_w2}});

  assign pich_cnt_sum0[32:0] = pich_cnt0[32:0] + incr_pich_sel[0];
  assign pich_cnt_sum1[32:0] = pich_cnt1[32:0] + incr_pich_sel[1];
  assign pich_cnt_sum2[32:0] = pich_cnt2[32:0] + incr_pich_sel[2];
  assign pich_cnt_sum3[32:0] = pich_cnt3[32:0] + incr_pich_sel[3];

  //===================
  // PICL mask decodes
  assign picl_mask0[7] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_SB_FULL_CNT) & pic_cnt_en[0]);
  assign picl_mask0[6] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_FP_INST_CNT) & pic_cnt_en[0]);
  assign picl_mask0[5] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_IC_MISS_CNT) & pic_cnt_en[0]);
  assign picl_mask0[4] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DC_MISS_CNT) & pic_cnt_en[0]);
  assign picl_mask0[3] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_ITLB_MISS_CNT) & pic_cnt_en[0]);
  assign picl_mask0[2] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DTLB_MISS_CNT) & pic_cnt_en[0]);
  assign picl_mask0[1] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_IMISS_CNT) & pic_cnt_en[0]);
  assign picl_mask0[0] = ((pcr0[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_DMISS_CNT) & pic_cnt_en[0]);

  assign picl_mask1[7] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_SB_FULL_CNT) & pic_cnt_en[1]);
  assign picl_mask1[6] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_FP_INST_CNT) & pic_cnt_en[1]);
  assign picl_mask1[5] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_IC_MISS_CNT) & pic_cnt_en[1]);
  assign picl_mask1[4] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DC_MISS_CNT) & pic_cnt_en[1]);
  assign picl_mask1[3] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_ITLB_MISS_CNT) & pic_cnt_en[1]);
  assign picl_mask1[2] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DTLB_MISS_CNT) & pic_cnt_en[1]);
  assign picl_mask1[1] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_IMISS_CNT) & pic_cnt_en[1]);
  assign picl_mask1[0] = ((pcr1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_DMISS_CNT) & pic_cnt_en[1]);

  assign picl_mask2[7] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_SB_FULL_CNT) & pic_cnt_en[2]);
  assign picl_mask2[6] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_FP_INST_CNT) & pic_cnt_en[2]);
  assign picl_mask2[5] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_IC_MISS_CNT) & pic_cnt_en[2]);
  assign picl_mask2[4] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DC_MISS_CNT) & pic_cnt_en[2]);
  assign picl_mask2[3] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_ITLB_MISS_CNT) & pic_cnt_en[2]);
  assign picl_mask2[2] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DTLB_MISS_CNT) & pic_cnt_en[2]);
  assign picl_mask2[1] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_IMISS_CNT) & pic_cnt_en[2]);
  assign picl_mask2[0] = ((pcr2[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_DMISS_CNT) & pic_cnt_en[2]);

  assign picl_mask3[7] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_SB_FULL_CNT) & pic_cnt_en[3]);
  assign picl_mask3[6] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_FP_INST_CNT) & pic_cnt_en[3]);
  assign picl_mask3[5] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_IC_MISS_CNT) & pic_cnt_en[3]);
  assign picl_mask3[4] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DC_MISS_CNT) & pic_cnt_en[3]);
  assign picl_mask3[3] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_ITLB_MISS_CNT) & pic_cnt_en[3]);
  assign picl_mask3[2] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_DTLB_MISS_CNT) & pic_cnt_en[3]);
  assign picl_mask3[1] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_IMISS_CNT) & pic_cnt_en[3]);
  assign picl_mask3[0] = ((pcr3[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO] == `PIB_L2_DMISS_CNT) & pic_cnt_en[3]);


  //============
  // PICL events
  assign picl_event0[7:0] = {lsu_tlu_stb_full_w2[0], fpu_cmplt_thread[0], imiss_thread_g[0], lsu_tlu_dcache_miss_w2[0],
	                     immu_miss_thread_g[0], dmmu_miss_thread_g[0], ifu_tlu_l2imiss[0], lsu_tlu_l2_dmiss[0]};
  assign picl_event1[7:0] = {lsu_tlu_stb_full_w2[1], fpu_cmplt_thread[1], imiss_thread_g[1], lsu_tlu_dcache_miss_w2[1],
                             immu_miss_thread_g[1], dmmu_miss_thread_g[1], ifu_tlu_l2imiss[1], lsu_tlu_l2_dmiss[1]};
  assign picl_event2[7:0] = {lsu_tlu_stb_full_w2[2], fpu_cmplt_thread[2], imiss_thread_g[2], lsu_tlu_dcache_miss_w2[2],
                             immu_miss_thread_g[2], dmmu_miss_thread_g[2], ifu_tlu_l2imiss[2], lsu_tlu_l2_dmiss[2]};
  assign picl_event3[7:0] = {lsu_tlu_stb_full_w2[3], fpu_cmplt_thread[3], imiss_thread_g[3], lsu_tlu_dcache_miss_w2[3],
                             immu_miss_thread_g[3], dmmu_miss_thread_g[3], ifu_tlu_l2imiss[3], lsu_tlu_l2_dmiss[3]};
  //=========================
  // PICL increment equations
  assign incr_evq_din[3:0] = { (|(picl_mask3[7:0] & picl_event3[7:0])), (|(picl_mask2[7:0] & picl_event2[7:0])),
                               (|(picl_mask1[7:0] & picl_event1[7:0])), (|(picl_mask0[7:0] & picl_event0[7:0])) };

  //=============================
  // pic[l,h] overflow indicators

  assign pib_pich_wrap[0] = ((pich_cnt_wrap[0] ^ pich_cnt0[32]) & pic_cnt_en[0]);
  assign pib_pich_wrap[1] = ((pich_cnt_wrap[1] ^ pich_cnt1[32]) & pic_cnt_en[1]);
  assign pib_pich_wrap[2] = ((pich_cnt_wrap[2] ^ pich_cnt2[32]) & pic_cnt_en[2]);
  assign pib_pich_wrap[3] = ((pich_cnt_wrap[3] ^ pich_cnt3[32]) & pic_cnt_en[3]);

  assign pib_picl_wrap[0] = ((picl_cnt_wrap[0] ^ picl_cnt0[32]) & incr_evq[0]);
  assign pib_picl_wrap[1] = ((picl_cnt_wrap[1] ^ picl_cnt1[32]) & incr_evq[1]);
  assign pib_picl_wrap[2] = ((picl_cnt_wrap[2] ^ picl_cnt2[32]) & incr_evq[2]);
  assign pib_picl_wrap[3] = ((picl_cnt_wrap[3] ^ picl_cnt3[32]) & incr_evq[3]);

  assign pich_twobelow_flg[0] = (&pich_cnt0[31:0]) & pic_cnt_en[0];
  assign pich_twobelow_flg[1] = (&pich_cnt1[31:0]) & pic_cnt_en[1];
  assign pich_twobelow_flg[2] = (&pich_cnt2[31:0]) & pic_cnt_en[2];
  assign pich_twobelow_flg[3] = (&pich_cnt3[31:0]) & pic_cnt_en[3];

  assign defr_trap_taken  = ( (lsu_tlu_defr_trp_taken_g) |
                              (lsu_tlu_defr_trp_taken_w1 & lsu_tlu_async_ttype_vld_w1 &
                               (thrid_g[1:0] === thrid_w1[1:0])) );

  assign flushed_thrd_w1 = tlu_ifu_flush_pipe_w1 & (thrid_g[1:0] === thrid_w1[1:0]);

  assign true_pil_g[3:0] = (thread_rsel_g[3]) ? true_pil3[3:0] :
                           (thread_rsel_g[2]) ? true_pil2[3:0] :
                           (thread_rsel_g[1]) ? true_pil1[3:0] :
                           (thread_rsel_g[0]) ? true_pil0[3:0] :
                           4'h0;
  assign rtl_trp_lvl_g[2:0] = (thread_rsel_g[3]) ? rtl_trp_lvl3[2:0] :
                              (thread_rsel_g[2]) ? rtl_trp_lvl2[2:0] :
                              (thread_rsel_g[1]) ? rtl_trp_lvl1[2:0] :
                              (thread_rsel_g[0]) ? rtl_trp_lvl0[2:0] :
                              3'h0;

  assign swint_15_g = ifu_swint_g & ( (thrd_sel_g[3]) ? th3_sftint_15 :
                                      (thrd_sel_g[2]) ? th2_sftint_15 :
                                      (thrd_sel_g[1]) ? th1_sftint_15 :
                                      (thrd_sel_g[0]) ? th0_sftint_15 : 1'b0 );

  //===============================
  // pic-overflow trap generation
  assign pic_ovfl_trappc_vld_g =
  	(|((pib_pich_wrap[3:0] | picl_wrap_pend[3:0] |
            (pich_twobelow_flg[3:0] & thrd_sel_g[3:0] & thrd_sel_w1[3:0] & inst_vld_w2[3:0])) &
	   (~tlz_thread[3:0] | tlu_hpstate_priv[3:0]) &
           (tlu_pstate_ie[3:0]) &
           (thread_rsel_g[3:0]))) &
        (inst_vld_g) & (true_pil_g[3:0] < 15) &
        (~(defr_trap_taken | flushed_thrd_w1 | ifu_tlu_flush_fd_w));
        //(~(defr_trap_taken | lsu_tlu_ttype_vld_m2 | flushed_thrd_w1 | ifu_tlu_flush_fd_w));
        //(~(defr_trap_taken | lsu_tlu_ttype_vld_m2 | flushed_thrd_w1));

  assign pic_ovfl_trappc_g = (pic_ovfl_trappc_vld_g & (rtl_trp_lvl_g[2:0] === 3'h2) & tlu_hpstate_enb[thrid_g]) ? 14'h040 : 14'h9e0;

  //============
  // initialize
  initial begin
    if ($test$plusargs("turn_off_tlu_monitor")) begin
      enable = 1'b0;
    end else begin
      enable = 1'b1;
    end
    //else if ($test$plusargs("turn_on_tlu_monitor")) enable = 1'b1;
    if (enable) $display("Info: ***** tlu_mon: Enabling the TLU Monitor *****");
    else        $display("Info: ***** tlu_mon: Disabling the TLU Monitor *****");
      delay_pic_ovfl_trappc <= 1'b0;
      pic_ovfl_trap_pending[3:0] <= 4'h0;

    // Initialize the rgisters
      sim_fail <= 1'b0;
      pcr_rsel_e = 1'b0;
      pcr_rw_m <= 1'b0;
      pic_priv_rw_m <= 1'b0;
      pic_npriv_rw_m <= 1'b0;
      pcr_rw_g <= 1'b0;
      pic_priv_rw_g <= 1'b0;
      pic_npriv_rw_g <= 1'b0;
      imiss_m <= 1'b0;
      imiss_g <= 1'b0;
      immu_miss_g <= 1'b0;
      pic_update_sel_ctr[1:0] <= 2'b00;
      pic_cnt_en_w2[3:0] <= 4'h0;
      inst_vld_w2[3:0] <= 4'h0;
      incr_evq[3:0] <= 4'h0;
      thread_rsel_e[3:0] <= 4'h0;
      thread_rsel_m[3:0] <= 4'h0;
      thread_rsel_g[3:0] <= 4'h0;
      thread_rsel_w1[3:0] <= 4'h0;
      pic_ovfl_trappc_vld_w1 <= 1'b0;
      pic_ovfl_trappc_vld_w2 <= 1'b0;
      pic_ovfl_trappc_vld_w2_dly <= 1'b0;
      thrid_e[1:0] <= 2'b00;
      thrid_m[1:0] <= 2'b00;
      thrid_g[1:0] <= 2'b00;
      thrid_w1[1:0] <= 2'b00;
      thrid_w2[1:0] <= 2'b00;
      thrid_w2_dly[1:0] <= 2'b00;
      inst_vld_g <= 1'b0;
      inst_vld_w1 <= 1'b0;
      lsu_tlu_defr_trp_taken_w1 <= 1'b0;
      tlu_ifu_flush_pipe_w1 <= 1'b0;
      ifu_tlu_sraddr_e <= 7'h00;
      ifu_tlu_rsr_inst_e <= 1'b0;
      swint_15_w1 <= 1'b0;
  end

  //=========================================
  // Stag the signals to match the rtl timing
  always @(posedge clk) begin
    if (~rst_l) begin
    /*
      sim_fail <= 1'b0;
      pcr_rsel_e = 1'b0;
      pcr_rw_m <= 1'b0;
      pic_priv_rw_m <= 1'b0;
      pic_npriv_rw_m <= 1'b0;
      pcr_rw_g <= 1'b0;
      pic_priv_rw_g <= 1'b0;
      pic_npriv_rw_g <= 1'b0;
      imiss_m <= 1'b0;
      imiss_g <= 1'b0;
      immu_miss_g <= 1'b0;
      pic_cnt_en_w2[3:0] <= 4'h0;
      inst_vld_w2[3:0] <= 4'h0;
      incr_evq[3:0] <= 4'h0;
      thread_rsel_e[3:0] <= 4'h0;
      thread_rsel_m[3:0] <= 4'h0;
      thread_rsel_g[3:0] <= 4'h0;
      pic_ovfl_trappc_vld_w1 <= 1'b0;
      pic_ovfl_trappc_vld_w2 <= 1'b0;
      pic_ovfl_trappc_vld_w2_dly <= 1'b0;
      thrid_e[1:0] <= 2'b00;
      thrid_m[1:0] <= 2'b00;
      thrid_g[1:0] <= 2'b00;
      thrid_w1[1:0] <= 2'b00;
      thrid_w2[1:0] <= 2'b00;
      thrid_w2_dly[1:0] <= 2'b00;
      inst_vld_g <= 1'b1;
      lsu_tlu_defr_trp_taken_w1 <= 1'b0;
      tlu_ifu_flush_pipe_w1 <= 1'b0;
      ifu_tlu_sraddr_e <= 7'h00;
      ifu_tlu_rsr_inst_e <= 1'b0;
    */
      pic_update_sel_ctr[1:0] <= 2'b00;
    end
    else begin
      pcr_rsel_e = pcr_rsel_d;
      pcr_rw_m <= pcr_rw_e;
      pic_priv_rw_m <= pic_priv_rw_e;
      pic_npriv_rw_m <= pic_npriv_rw_e;
      pcr_rw_g <= pcr_rw_m;
      pic_priv_rw_g <= pic_priv_rw_m;
      pic_npriv_rw_g <= pic_npriv_rw_m;
      imiss_m <= ifu_tlu_imiss_e;
      imiss_g <= imiss_m;
      immu_miss_g <= ifu_tlu_immu_miss_m;
      pic_update_sel_ctr[1:0] <= pic_update_sel_incr[1:0];
      pic_cnt_en_w2[3:0] <= pic_cnt_en[3:0];
      inst_vld_w2[3:0] <= tlu_thread_inst_vld_g[3:0];
      incr_evq[3:0] <= incr_evq_din[3:0];
      thread_rsel_e[3:0] <= thread_rsel_d[3:0];
      thread_rsel_m[3:0] <= thread_rsel_e[3:0];
      thread_rsel_g[3:0] <= thread_rsel_m[3:0];
      thread_rsel_w1[3:0] <= thread_rsel_g[3:0];
      pic_ovfl_trappc_vld_w1 <= pic_ovfl_trappc_vld_g;
      pic_ovfl_trappc_vld_w2 <= pic_ovfl_trappc_vld_w1;
      pic_ovfl_trappc_vld_w2_dly <= pic_ovfl_trappc_vld_w2;
      pic_ovfl_trappc_w1 <= pic_ovfl_trappc_g;
      pic_ovfl_trappc_w2 <= pic_ovfl_trappc_w1;
      pic_ovfl_trappc_w2_dly <= pic_ovfl_trappc_w2;
      thrid_e <= ifu_tlu_thrid_d;
      thrid_m <= thrid_e;
      thrid_g <= thrid_m;
      thrid_w1 <= thrid_g;
      thrid_w2 <= thrid_w1;
      thrid_w2_dly <= thrid_w2;
      inst_vld_g <= ifu_tlu_inst_vld_m;
      inst_vld_w1 <= inst_vld_g;
      lsu_tlu_defr_trp_taken_w1 <= lsu_tlu_defr_trp_taken_g;
      tlu_ifu_flush_pipe_w1 <= tlu_ifu_flush_pipe_w;
      ifu_tlu_sraddr_e <= ifu_tlu_sraddr_d;
      ifu_tlu_rsr_inst_e <= ifu_tlu_rsr_inst_d;
      swint_15_w1 <= swint_15_g;
    end
  end


  //=================
  //Count PICL Events
  // Thread0
  always @(negedge clk)
  //always @(rst_l or wsr_pic_sel[0] or incr_evq[0])
    if (~rst_l)               picl_cnt_sum0[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[0])  picl_cnt_sum0[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (incr_evq[0])     picl_cnt_sum0[32:0] <= picl_cnt_sum0[32:0] + incr_evq[0];
    else                      picl_cnt_sum0[32:0] <= picl_cnt_sum0[32:0];
  // Thread1
  always @(negedge clk)
  //always @(rst_l or wsr_pic_sel[1] or incr_evq[1])
    if (~rst_l)               picl_cnt_sum1[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[1])  picl_cnt_sum1[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (incr_evq[1])     picl_cnt_sum1[32:0] <= picl_cnt_sum1[32:0] + incr_evq[1];
    else                      picl_cnt_sum1[32:0] <= picl_cnt_sum1[32:0];
  // Thread2
  always @(negedge clk)
  //always @(rst_l or wsr_pic_sel[2] or incr_evq[2])
    if (~rst_l)               picl_cnt_sum2[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[2])  picl_cnt_sum2[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (incr_evq[2])     picl_cnt_sum2[32:0] <= picl_cnt_sum2[32:0] + incr_evq[2];
    else                      picl_cnt_sum2[32:0] <= picl_cnt_sum2[32:0];
  // Thread3
  always @(negedge clk)
  //always @(rst_l or wsr_pic_sel[3] or incr_evq[3])
    if (~rst_l)               picl_cnt_sum3[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[3])  picl_cnt_sum3[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (incr_evq[3])     picl_cnt_sum3[32:0] <= picl_cnt_sum3[32:0] + incr_evq[3];
    else                      picl_cnt_sum3[32:0] <= picl_cnt_sum3[32:0];
  //===========================
  // Control Registers
  // PCR0
  always @(posedge clk)
    if (~rst_l)
        pcr0[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= {64{1'b0}};
    else if (wsr_pcr_sel[0])
        pcr0[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= { {54{1'b0}},
                                                   tlu_wsr_data_w[`PIB_PCR_OVFH:`PIB_PCR_OVFL], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]
                                                 };
    else begin
      if (pich_cnt_wrap[0] ^ pich_cnt0[32])
        pcr0[`PIB_PCR_OVFH] <= pich_cnt_wrap[0] ^ pich_cnt0[32];
      else
        pcr0[`PIB_PCR_OVFH] <= pcr0[`PIB_PCR_OVFH];
      if (picl_cnt_wrap[0] ^ picl_cnt0[32])
        pcr0[`PIB_PCR_OVFL] <= picl_cnt_wrap[0] ^ picl_cnt0[32];
      else
        pcr0[`PIB_PCR_OVFL] <= pcr0[`PIB_PCR_OVFL];
        pcr0[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO] <= pcr0[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO];
        pcr0[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV]   <= pcr0[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV];
    end
    //else                    pcr0[63:0] <= pcr0[63:0];
  // PCR1
  always @(posedge clk)
    if (~rst_l)
        pcr1[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= {64{1'b0}};
    else if (wsr_pcr_sel[1])
        pcr1[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= { {54{1'b0}},
                                                   tlu_wsr_data_w[`PIB_PCR_OVFH:`PIB_PCR_OVFL], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]
                                                 };
    else begin
      if (pich_cnt_wrap[1] ^ pich_cnt1[32])
        pcr1[`PIB_PCR_OVFH] <= pich_cnt_wrap[1] ^ pich_cnt1[32];
      else                   pcr1[`PIB_PCR_OVFH] <= pcr1[`PIB_PCR_OVFH];
      if (picl_cnt_wrap[1] ^ picl_cnt1[32])
        pcr1[`PIB_PCR_OVFL] <= picl_cnt_wrap[1] ^ picl_cnt1[32];
      else                   pcr1[`PIB_PCR_OVFL] <= pcr1[`PIB_PCR_OVFL];
        pcr1[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO] <= pcr1[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO];
        pcr1[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV]   <= pcr1[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV];
    end
    //else                     pcr1[63:0] <= pcr1[63:0];
  // PCR2
  always @(posedge clk)
    if (~rst_l)
        pcr2[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= {64{1'b0}};
    else if (wsr_pcr_sel[2])
        pcr2[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= { {54{1'b0}},
                                                   tlu_wsr_data_w[`PIB_PCR_OVFH:`PIB_PCR_OVFL], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]
                                                 };
    else begin

      if (pich_cnt_wrap[2] ^ pich_cnt2[32])
        pcr2[`PIB_PCR_OVFH] <= pich_cnt_wrap[2] ^ pich_cnt2[32];
      else
        pcr2[`PIB_PCR_OVFH] <= pcr2[`PIB_PCR_OVFH];

      if (picl_cnt_wrap[2] ^ picl_cnt2[32])
        pcr2[`PIB_PCR_OVFL] <= picl_cnt_wrap[2] ^ picl_cnt2[32];
      else
        pcr2[`PIB_PCR_OVFL] <= pcr2[`PIB_PCR_OVFL];

        pcr2[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO] <= pcr2[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO];
        pcr2[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV] <= pcr2[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV];
    end
    //else                     pcr2[63:0] <= pcr2[63:0];
  // PCR3
  always @(posedge clk)
    if (~rst_l)
        pcr3[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= {64{1'b0}};
    else if (wsr_pcr_sel[3])
        pcr3[`PIB_PCR_RSVD0_HI:`MON_PIB_PCR_PRIV] <= { {54{1'b0}},
                                                   tlu_wsr_data_w[`PIB_PCR_OVFH:`PIB_PCR_OVFL], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_LO], 1'b0,
                                                   tlu_wsr_data_w[`MON_PIB_PCR_UT:`MON_PIB_PCR_PRIV]
                                                 };
    else begin

      if (pich_cnt_wrap[3] ^ pich_cnt3[32])
        pcr3[`PIB_PCR_OVFH] <= pich_cnt_wrap[3] ^ pich_cnt3[32];
      else
        pcr3[`PIB_PCR_OVFH] <= pcr3[`PIB_PCR_OVFH];

      if (picl_cnt_wrap[3] ^ picl_cnt3[32])
        pcr3[`PIB_PCR_OVFL] <= picl_cnt_wrap[3] ^ picl_cnt3[32];
      else
        pcr3[`PIB_PCR_OVFL] <= pcr3[`PIB_PCR_OVFL];

        pcr3[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO] <= pcr3[`PIB_PCR_RSVD0_HI:`PIB_PCR_RSVD0_LO];
        pcr3[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV]   <= pcr3[`PIB_PCR_RSVD1:`MON_PIB_PCR_PRIV];
    end
    //else                     pcr3[63:0] <= pcr3[31:0];

  //===========================
  // Count Registers
  // PICH0
  always @(posedge clk)
    if (~rst_l)                pich_cnt0[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[0])   pich_cnt0[32:0] <= {1'b0, tlu_wsr_data_w[63:32]};
    else if (incr_pich_sel[0]) pich_cnt0[32:0] <= pich_cnt_sum0[32:0];
    else                       pich_cnt0[32:0] <= pich_cnt0[32:0];
  // PICH1
  always @(posedge clk)
    if (~rst_l)                pich_cnt1[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[1])   pich_cnt1[32:0] <= {1'b0, tlu_wsr_data_w[63:32]};
    else if (incr_pich_sel[1]) pich_cnt1[32:0] <= pich_cnt_sum1[32:0];
    else                       pich_cnt1[32:0] <= pich_cnt1[32:0];
  // PICH2
  always @(posedge clk)
    if (~rst_l)                pich_cnt2[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[2])   pich_cnt2[32:0] <= {1'b0, tlu_wsr_data_w[63:32]};
    else if (incr_pich_sel[2]) pich_cnt2[32:0] <= pich_cnt_sum2[32:0];
    else                       pich_cnt2[32:0] <= pich_cnt2[32:0];
  // PICH3
  always @(posedge clk)
    if (~rst_l)                pich_cnt3[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[3])   pich_cnt3[32:0] <= {1'b0, tlu_wsr_data_w[63:32]};
    else if (incr_pich_sel[3]) pich_cnt3[32:0] <= pich_cnt_sum3[32:0];
    else                       pich_cnt3[32:0] <= pich_cnt3[32:0];
  // PICL0
  always @(posedge clk)
    if (~rst_l)               picl_cnt0[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[0])  picl_cnt0[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (upd_picl_sel[0]) picl_cnt0[32:0] <= picl_cnt_sum0[32:0];
    else                      picl_cnt0[32:0] <= picl_cnt0[32:0];
  // PICL1
  always @(posedge clk)
    if (~rst_l)               picl_cnt1[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[1])  picl_cnt1[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (upd_picl_sel[1]) picl_cnt1[32:0] <= picl_cnt_sum1[32:0];
    else                      picl_cnt1[32:0] <= picl_cnt1[32:0];
  // PICL2
  always @(posedge clk)
    if (~rst_l)               picl_cnt2[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[2])  picl_cnt2[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (upd_picl_sel[2]) picl_cnt2[32:0] <= picl_cnt_sum2[32:0];
    else                      picl_cnt2[32:0] <= picl_cnt2[32:0];
  // PICL3
  always @(posedge clk)
    if (~rst_l)               picl_cnt3[32:0] <= {33{1'b0}};
    else if (wsr_pic_sel[3])  picl_cnt3[32:0] <= {1'b0, tlu_wsr_data_w[31:0]};
    else if (upd_picl_sel[3]) picl_cnt3[32:0] <= picl_cnt_sum3[32:0];
    else                      picl_cnt3[32:0] <= picl_cnt3[32:0];
  //==============================
  // pich counter wrap around flag
  // PICH0
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[0]) pich_cnt_wrap[0] <= 1'b0;
    else if (wsr_pcr_sel[0])     pich_cnt_wrap[0] <= (pich_cnt0[32] ^ tlu_wsr_data_w[9]);
    else if (incr_pich_sel[0])   pich_cnt_wrap[0] <= pich_cnt0[32];
    else                         pich_cnt_wrap[0] <= pich_cnt_wrap[0];
  // PICH1
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[1]) pich_cnt_wrap[1] <= 1'b0;
    else if (wsr_pcr_sel[1])     pich_cnt_wrap[1] <= (pich_cnt1[32] ^ tlu_wsr_data_w[9]);
    else if (incr_pich_sel[1])   pich_cnt_wrap[1] <= pich_cnt1[32];
    else                         pich_cnt_wrap[1] <= pich_cnt_wrap[1];
  // PICH2
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[2]) pich_cnt_wrap[2] <= 1'b0;
    else if (wsr_pcr_sel[2])     pich_cnt_wrap[2] <= (pich_cnt2[32] ^ tlu_wsr_data_w[9]);
    else if (incr_pich_sel[2])   pich_cnt_wrap[2] <= pich_cnt2[32];
    else                         pich_cnt_wrap[2] <= pich_cnt_wrap[2];
  // PICH3
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[3]) pich_cnt_wrap[3] <= 1'b0;
    else if (wsr_pcr_sel[3])     pich_cnt_wrap[3] <= (pich_cnt3[32] ^ tlu_wsr_data_w[9]);
    else if (incr_pich_sel[3])   pich_cnt_wrap[3] <= pich_cnt3[32];
    else                         pich_cnt_wrap[3] <= pich_cnt_wrap[3];

  //==============================
  // picl counter wrap around flag
  // PICL0
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[0]) picl_cnt_wrap[0] <= 1'b0;
    else if (wsr_pcr_sel[0])     picl_cnt_wrap[0] <= (picl_cnt0[32] ^ tlu_wsr_data_w[8]);
    else if (upd_picl_sel[0])    picl_cnt_wrap[0] <= picl_cnt0[32];
    else                         picl_cnt_wrap[0] <= picl_cnt_wrap[0];
  // PICL1
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[1]) picl_cnt_wrap[1] <= 1'b0;
    else if (wsr_pcr_sel[1])     picl_cnt_wrap[1] <= (picl_cnt1[32] ^ tlu_wsr_data_w[8]);
    else if (upd_picl_sel[1])    picl_cnt_wrap[1] <= picl_cnt1[32];
    else                         picl_cnt_wrap[1] <= picl_cnt_wrap[1];
  // PICL2
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[2]) picl_cnt_wrap[2] <= 1'b0;
    else if (wsr_pcr_sel[2])     picl_cnt_wrap[2] <= (picl_cnt2[32] ^ tlu_wsr_data_w[8]);
    else if (upd_picl_sel[2])    picl_cnt_wrap[2] <= picl_cnt2[32];
    else                         picl_cnt_wrap[2] <= picl_cnt_wrap[2];
  // PICL3
  always @(posedge clk)
    if (~rst_l | wsr_pic_sel[3]) picl_cnt_wrap[3] <= 1'b0;
    else if (wsr_pcr_sel[3])     picl_cnt_wrap[3] <= (picl_cnt3[32] ^ tlu_wsr_data_w[8]);
    else if (upd_picl_sel[3])    picl_cnt_wrap[3] <= picl_cnt3[32];
    else                         picl_cnt_wrap[3] <= picl_cnt_wrap[3];
  //==============================
  // picl counter wrap pending flag
  // PICL0
  always @(posedge clk)
    if (~rst_l | (inst_vld_w2[0] & ~pib_picl_wrap[0])) picl_wrap_pend[0] <= 1'b0;
    else if (pib_picl_wrap[0])                         picl_wrap_pend[0] <= pib_picl_wrap[0];
  // PICL1
  always @(posedge clk)
    if (~rst_l | (inst_vld_w2[1] & ~pib_picl_wrap[1])) picl_wrap_pend[1] <= 1'b0;
    else if (pib_picl_wrap[1])                         picl_wrap_pend[1] <= pib_picl_wrap[1];
  // PICL2
  always @(posedge clk)
    if (~rst_l | (inst_vld_w2[2] & ~pib_picl_wrap[2])) picl_wrap_pend[2] <= 1'b0;
    else if (pib_picl_wrap[2])                         picl_wrap_pend[2] <= pib_picl_wrap[2];
  // PICL3
  always @(posedge clk)
    if (~rst_l | (inst_vld_w2[3] & ~pib_picl_wrap[3])) picl_wrap_pend[3] <= 1'b0;
    else if (pib_picl_wrap[3])                         picl_wrap_pend[3] <= pib_picl_wrap[3];
  //=============================
  // Performance Counter Checkers
  //=============================
  always @(posedge clk) begin
    if (rst_l === 1'b1) begin
      // Compare: PCR0
      if (mon_pcr0[7:0] !== rtl_pcr0[7:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PCR0 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr0[7:0], mon_pcr0[7:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PCR0 register mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PCR0 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr0[7:0], mon_pcr0[7:0]);
        end
      end
      // Compare: PCR1
      if (mon_pcr1[7:0] !== rtl_pcr1[7:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PCR1 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr1[7:0], mon_pcr1[7:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PCR1 register mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PCR1 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr1[7:0], mon_pcr1[7:0]);
        end
      end
      // Compare: PCR2
      if (mon_pcr2[7:0] !== rtl_pcr2[7:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PCR2 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr2[7:0], mon_pcr2[7:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PCR2 register mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PCR2 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr2[7:0], mon_pcr2[7:0]);
        end
      end
      // Compare: PCR3
      if (mon_pcr3[7:0] !== rtl_pcr3[7:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PCR3 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr3[7:0], mon_pcr3[7:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PCR3 register mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PCR3 register mismatch: RTL(8'h%x) Vs Expected(8'h%x)", $time, rtl_pcr3[7:0], mon_pcr3[7:0]);
        end
      end
      // Compare: PIC.H0
      if (pich_cnt0[31:0] !== rtl_pich_cnt0[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC0.H mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt0[31:0], pich_cnt0[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC0.H mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC0.H register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt0[31:0], pich_cnt0[31:0]);
        end
      end
      // Compare: PIC.H1
      if (pich_cnt1[31:0] !== rtl_pich_cnt1[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC0.H mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt1[31:0], pich_cnt1[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC1.H mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC1.H register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt1[31:0], pich_cnt1[31:0]);
        end
      end
      // Compare: PIC.H2
      if (pich_cnt2[31:0] !== rtl_pich_cnt2[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC2.H mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt2[31:0], pich_cnt2[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC2.H mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC2.H register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt2[31:0], pich_cnt2[31:0]);
        end
      end
      // Compare: PIC.H3
      if (pich_cnt3[31:0] !== rtl_pich_cnt3[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC3.H mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt3[31:0], pich_cnt3[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC3.H mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC3.H register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_pich_cnt3[31:0], pich_cnt3[31:0]);
        end
      end
      // Compare: PIC.L0
      if (picl_cnt0[31:0] !== rtl_picl_cnt0[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC0.L mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt0[31:0], picl_cnt0[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC0.L mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC0.L register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt0[31:0], picl_cnt0[31:0]);
        end
      end
      // Compare: PIC.L1
      if (picl_cnt1[31:0] !== rtl_picl_cnt1[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC1.L mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt1[31:0], picl_cnt1[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC1.L mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC1.L register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt1[31:0], picl_cnt1[31:0]);
        end
      end
      // Compare: PIC.L2
      if (picl_cnt2[31:0] !== rtl_picl_cnt2[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC2.L mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt2[31:0], picl_cnt2[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC2.L mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC2.L register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt2[31:0], picl_cnt2[31:0]);
        end
      end
      // Compare: PIC.L3
      if (picl_cnt3[31:0] !== rtl_picl_cnt3[31:0]) begin
	    if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB-PIC3.L mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt3[31:0], picl_cnt3[31:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB-PIC0.L mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB-PIC3.L register mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, rtl_picl_cnt3[31:0], picl_cnt3[31:0]);
        end
      end

      // pib registers read data
      /*
      if (tlu_pib_rsr_data_e !== pib_rsr_data_e) begin
	if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIB register read data mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, tlu_pib_rsr_data_e, pib_rsr_data_e);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIB register read data mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: PIB register read data mismatch: RTL(64'h%x) Vs Expected(64'h%x)", $time, tlu_pib_rsr_data_e, pib_rsr_data_e);
        end
      end
      */
      if (tlu_pib_priv_act_trap_m != pib_priv_act_trap_m) begin
	if(enable) begin
          $display("*ERROR*: %0d: tlu_mon: Privileged Action Trap signal mismatch: RTL(4'b%b) Vs Expected(4'b%b)", $time, tlu_pib_priv_act_trap_m, pib_priv_act_trap_m);
          $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	  `MONITOR_PATH.fail("tlu_mon: Privileged Action Trap signal mismatch");
        end
        else begin
          $display("*WARNING*: %0d: tlu_mon: Privileged Action Trap signal mismatch: RTL(4'b%b) Vs Expected(4'b%b)", $time, tlu_pib_priv_act_trap_m, pib_priv_act_trap_m);
        end
      end
      // Compare trappc_vld_w1
      if (pic_ovfl_trappc_vld_w1) begin
        if (~tlu_ifu_trappc_vld_w1) begin
          if (inst_vld_w1) begin
            if (pcr_w1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_HI] == `PIB_SB_FULL_CNT) begin
              pic_ovfl_trap_pending[thrid_w1] <= 1'b1;
            end
            else if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow trappc_vld mismatch: RTL(1'b0) Vs Expected(1'b1)", $time);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
              `MONITOR_PATH.fail("tlu_mon: PIC overflow trappc_vld mismatch");
            end
            else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow trappc_vld mismatch: RTL(1'b0) Vs Expected(1'b1)", $time);
	        end
          end
          else begin
            delay_pic_ovfl_trappc <= 1'b1;
          end
        end // if(~tlu_ifu_trappc_vld_w1)
        else begin // Compare TTYPE & thread_id
          if (tlu_final_ttype_w2 !== pic_ovfl_ttype_w1) begin
	        if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow TTYPE mismatch: RTL(9'h%x) Vs Expected(9'h%x)", $time, tlu_final_ttype_w2, pic_ovfl_ttype_w1);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	          `MONITOR_PATH.fail("tlu_mon: PIC overflow TTYPE mismatch");
            end
	        else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow TTYPE mismatch: RTL(9'h%x) Vs Expected(9'h%x)", $time, tlu_final_ttype_w2, pic_ovfl_ttype_w1);
            end
          end
          if (tlu_ifu_trap_tid_w1 !== thrid_w1) begin
	        if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow Trap_thrid mismatch: RTL(%0d) Vs Expected(%0d)", $time, tlu_ifu_trap_tid_w1, thrid_w1);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	          `MONITOR_PATH.fail("tlu_mon: PIC overflow Trap_thrid mismatch");
            end
            else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow Trap_thrid mismatch: RTL(%0d) Vs Expected(%0d)", $time, tlu_ifu_trap_tid_w1, thrid_w1);
            end
          end
        end //else(~tlu_ifu_trappc_vld_w1)
      end //pic_ovfl_trappc_vld_w1
      // Compare TrapPC
      if (pic_ovfl_trappc_vld_w2 & ~delay_pic_ovfl_trappc & ~pic_ovfl_trap_pending[thrid_w2]) begin
        if (tlu_ifu_trappc_w2[13:0] !== pic_ovfl_trappc_w2[13:0]) begin
	  if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIC overflow TrapPC mismatch: RTL(9'h%x) Vs Expected(14'h%x)", $time, tlu_ifu_trappc_w2[13:0], pic_ovfl_trappc_w2[13:0]);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	    `MONITOR_PATH.fail("tlu_mon: PIC overflow TrapPC mismatch");
          end
          else begin
            $display("*WARNING*: %0d: tlu_mon: PIC overflow TrapPC mismatch: RTL(9'h%x) Vs Expected(14'h%x)", $time, tlu_ifu_trappc_w2[13:0], pic_ovfl_trappc_w2[13:0]);
          end
        end
      end //if(trappc_vld
      ///////////////////////////////
      //One cycle delayed comparisons
      // Compare trappc_vld_w1_dly, ttype_dly, & thrdid_dly
      if (pic_ovfl_trappc_vld_w2 & delay_pic_ovfl_trappc) begin
        if (~tlu_ifu_trappc_vld_w1) begin
          if (pcr_w1[`MON_PIB_PCR_SL_HI:`MON_PIB_PCR_SL_HI] == `PIB_SB_FULL_CNT) begin
            pic_ovfl_trap_pending[thrid_w2] <= 1'b1;
          end
	      else if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: PIC overflow trappc_vld mismatch: RTL(1'b0) Vs Expected(1'b1)", $time);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
            `MONITOR_PATH.fail("tlu_mon: PIC overflow trappc_vld mismatch");
          end
          else begin
            $display("*WARNING*: %0d: tlu_mon: PIC overflow trappc_vld mismatch: RTL(1'b0) Vs Expected(1'b1)", $time);
	      end
        end //if(~tlu_ifu_trappc_vld_w1)
        else begin
          if (tlu_final_ttype_w2 !== pic_ovfl_ttype_w1) begin
	        if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow TTYPE mismatch: RTL(9'h%x) Vs Expected(9'h%x)", $time, tlu_final_ttype_w2, pic_ovfl_ttype_w1);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	          `MONITOR_PATH.fail("tlu_mon: PIC overflow TTYPE mismatch");
            end
	        else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow TTYPE mismatch: RTL(9'h%x) Vs Expected(9'h%x)", $time, tlu_final_ttype_w2, pic_ovfl_ttype_w1);
            end
          end
          if (tlu_ifu_trap_tid_w1 !== thrid_w2) begin
	        if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow Trap_thrid mismatch: RTL(%0d) Vs Expected(%0d)", $time, tlu_ifu_trap_tid_w1, thrid_w1);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	          `MONITOR_PATH.fail("tlu_mon: PIC overflow Trap_thrid mismatch");
            end
            else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow Trap_thrid mismatch: RTL(%0d) Vs Expected(%0d)", $time, tlu_ifu_trap_tid_w1, thrid_w1);
            end
          end
        end //else (~tlu_ifu_trappc_vld_w1)
      end //if(pic_ovfl_trappc_vld_w2)
      // Compare TrapPC
      if (pic_ovfl_trappc_vld_w2_dly & delay_pic_ovfl_trappc) begin
        delay_pic_ovfl_trappc <= 1'b0;
        if (~pic_ovfl_trap_pending[thrid_w2_dly]) begin
          if (tlu_ifu_trappc_w2[13:0] !== pic_ovfl_trappc_w2_dly[13:0]) begin
	        if(enable) begin
              $display("*ERROR*: %0d: tlu_mon: PIC overflow TrapPC mismatch: RTL(9'h%x) Vs Expected(14'h%x)", $time, tlu_ifu_trappc_w2[13:0], pic_ovfl_trappc_w2_dly[13:0]);
              $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	          `MONITOR_PATH.fail("tlu_mon: PIC overflow TrapPC mismatch");
            end
            else begin
              $display("*WARNING*: %0d: tlu_mon: PIC overflow TrapPC mismatch: RTL(9'h%x) Vs Expected(14'h%x)", $time, tlu_ifu_trappc_w2[13:0], pic_ovfl_trappc_w2_dly[13:0]);
            end
          end
        end //if~pic_ovfl_trap_pending[thrid_w2_dly])
      end //if(pic_ovfl_trappc_vld_w2_dly & delay_pic_ovfl_trappc)
      if ( ((tlu_ifu_trappc_vld_w1) && (tlu_final_ttype_w2 == pic_ovfl_ttype_w1)) &&
           (~pic_ovfl_trappc_vld_w1) ) begin
           //(~pic_ovfl_trappc_vld_w1)  && (~swint_15_w1) ) begin
        if (pic_ovfl_trap_pending[thrid_w1]) begin
          pic_ovfl_trap_pending[thrid_w1] <= 1'b0;
        end
        else if (~swint_15_w1) begin
	      if(enable) begin
            $display("*ERROR*: %0d: tlu_mon: Spurious PIC overflow Trap signaled by RTL", $time);
            $display("*Info*: tlu_mon: Use -sim_run_args=+turn_off_tlu_monitor to disable the tlu_mon");
	        `MONITOR_PATH.fail("tlu_mon: Spurious PIC overflow Trap");
          end
	      else begin
            $display("*WARNING*: %0d: tlu_mon: Spurious PIC overflow Trap signaled by RTL", $time);
          end
        end //if(~swint_15_w1)
      end //if(trappc_vld)
    end //if(rst_l)
  end //always @(posedge clk) begin
  //====================================================
  // Dump all the counter value at end of the Simulation
  always @(posedge `SIM_TOP.diag_done or posedge sim_fail) begin
    $display("*Info*: tlu_mon: Start of %m PIB dump>>>>>\n");
    $display("*Info*: tlu_mon: PCR0 = 64'h%16x, PIC0 = 64'h%16x", pcr0, {pich_cnt0[31:0], picl_cnt0[31:0]});
    $display("*Info*: tlu_mon: PCR1 = 64'h%16x, PIC1 = 64'h%16x", pcr1, {pich_cnt1[31:0], picl_cnt1[31:0]});
    $display("*Info*: tlu_mon: PCR2 = 64'h%16x, PIC2 = 64'h%16x", pcr2, {pich_cnt2[31:0], picl_cnt2[31:0]});
    $display("*Info*: tlu_mon: PCR3 = 64'h%16x, PIC3 = 64'h%16x", pcr3, {pich_cnt3[31:0], picl_cnt3[31:0]});
    $display("*Info*: tlu_mon: <<<<< End of %m PIB dump\n");
  end

  /////////////////////////////////////////////////////////////////////
  // All the following singnals and Logics are for the vera pib coverag
  // object
  /////////////////////////////////////////////////////////////////////
/*
  wire [7:0] rtl_pcr0 = `TOP_DESIGN.sparc0.tlu.tlu_pib.pcr0;
  wire [7:0] rtl_pcr1 = `TOP_DESIGN.sparc0.tlu.tlu_pib.pcr1;
  wire [7:0] rtl_pcr2 = `TOP_DESIGN.sparc0.tlu.tlu_pib.pcr2;
  wire [7:0] rtl_pcr3 = `TOP_DESIGN.sparc0.tlu.tlu_pib.pcr3;

  wire [3:0] rtl_lsu_tlu_stb_full_w2 	= `TOP_DESIGN.sparc0.tlu.tlu_pib.lsu_tlu_stb_full_w2;
  wire [3:0] rtl_fpu_cmplt_thread	= `TOP_DESIGN.sparc0.tlu.tlu_pib.fpu_cmplt_thread;
  wire [3:0] rtl_imiss_thread_g		= `TOP_DESIGN.sparc0.tlu.tlu_pib.imiss_thread_g;
  wire [3:0] rtl_lsu_tlu_dcache_miss_w2	= `TOP_DESIGN.sparc0.tlu.tlu_pib.lsu_tlu_dcache_miss_w2;
  wire [3:0] rtl_immu_miss_thread_g	= `TOP_DESIGN.sparc0.tlu.tlu_pib.immu_miss_thread_g;
  wire [3:0] rtl_dmmu_miss_thread_g	= `TOP_DESIGN.sparc0.tlu.tlu_pib.dmmu_miss_thread_g;
  wire [3:0] rtl_ifu_tlu_l2imiss	= `TOP_DESIGN.sparc0.tlu.tlu_pib.ifu_tlu_l2imiss;
  wire [3:0] rtl_lsu_tlu_l2_dmiss	= `TOP_DESIGN.sparc0.tlu.tlu_pib.lsu_tlu_l2_dmiss;
*/

  wire [3:0] pcr_ut = {rtl_pcr3[2], rtl_pcr2[2], rtl_pcr1[2], rtl_pcr0[2]};
  wire [3:0] pcr_st = {rtl_pcr3[1], rtl_pcr2[1], rtl_pcr1[1], rtl_pcr0[1]};
  wire [3:0] pcr_ut_n_st = {(rtl_pcr3[2] & rtl_pcr3[1]),
                            (rtl_pcr2[2] & rtl_pcr2[1]),
                            (rtl_pcr1[2] & rtl_pcr1[1]),
                            (rtl_pcr0[2] & rtl_pcr0[1])};
  wire [3:0] curr_priv_ut = ~(tlu_hpstate_priv[3:0] | tlu_pstate_priv[3:0]);
  wire [3:0] curr_priv_st = ( tlu_hpstate_enb[3:0] & (~tlu_hpstate_priv[3:0]) & tlu_pstate_priv[3:0])
                          | (~tlu_hpstate_enb[3:0] & tlu_pstate_priv[3:0]);

  wire [3:0] pcr_stb_full = {(rtl_pcr3[5:3] == `PIB_SB_FULL_CNT),
                             (rtl_pcr2[5:3] == `PIB_SB_FULL_CNT),
                             (rtl_pcr1[5:3] == `PIB_SB_FULL_CNT),
                             (rtl_pcr0[5:3] == `PIB_SB_FULL_CNT)};

  wire [3:0] pcr_fpu_inst = {(rtl_pcr3[5:3] == `PIB_FP_INST_CNT),
                             (rtl_pcr2[5:3] == `PIB_FP_INST_CNT),
                             (rtl_pcr1[5:3] == `PIB_FP_INST_CNT),
                             (rtl_pcr0[5:3] == `PIB_FP_INST_CNT)};

  wire [3:0] pcr_ica_miss = {(rtl_pcr3[5:3] == `PIB_IC_MISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_IC_MISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_IC_MISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_IC_MISS_CNT)};

  wire [3:0] pcr_dca_miss = {(rtl_pcr3[5:3] == `PIB_DC_MISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_DC_MISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_DC_MISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_DC_MISS_CNT)};

  wire [3:0] pcr_itlb_mis = {(rtl_pcr3[5:3] == `PIB_ITLB_MISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_ITLB_MISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_ITLB_MISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_ITLB_MISS_CNT)};

  wire [3:0] pcr_dtlb_mis = {(rtl_pcr3[5:3] == `PIB_DTLB_MISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_DTLB_MISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_DTLB_MISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_DTLB_MISS_CNT)};

  wire [3:0] pcr_l2_imiss = {(rtl_pcr3[5:3] == `PIB_L2_IMISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_L2_IMISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_L2_IMISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_L2_IMISS_CNT)};

  wire [3:0] pcr_l2_dmiss = {(rtl_pcr3[5:3] == `PIB_L2_DMISS_CNT),
                             (rtl_pcr2[5:3] == `PIB_L2_DMISS_CNT),
                             (rtl_pcr1[5:3] == `PIB_L2_DMISS_CNT),
                             (rtl_pcr0[5:3] == `PIB_L2_DMISS_CNT)};

  wire [3:0] picl_stb_full	= pcr_stb_full[3:0]	& rtl_lsu_tlu_stb_full_w2[3:0];
  wire [3:0] picl_fpu_inst	= pcr_fpu_inst[3:0]	& rtl_fpu_cmplt_thread[3:0];
  wire [3:0] picl_ica_miss	= pcr_ica_miss[3:0]	& rtl_imiss_thread_g[3:0];
  wire [3:0] picl_dca_miss	= pcr_dca_miss[3:0]	& rtl_lsu_tlu_dcache_miss_w2[3:0];
  wire [3:0] picl_itlb_mis	= pcr_itlb_mis[3:0]	& rtl_immu_miss_thread_g[3:0];
  wire [3:0] picl_dtlb_mis	= pcr_dtlb_mis[3:0]	& rtl_dmmu_miss_thread_g[3:0];
  wire [3:0] picl_l2_imiss	= pcr_l2_imiss[3:0]	& rtl_ifu_tlu_l2imiss[3:0];
  wire [3:0] picl_l2_dmiss	= pcr_l2_dmiss[3:0]	& rtl_lsu_tlu_l2_dmiss[3:0];

  // to make sure tlu_itlb_tte_tag, tlu_itlb_tte_data held constant for at least two cycles
  always @(posedge clk) begin
    tlu_itlb_wr_vld_g_d1  <= tlu_itlb_wr_vld_g;
    tlu_itlb_dmp_vld_g_d1 <= tlu_itlb_dmp_vld_g;
  end

  assign tlu_itlb_wr_vld_rise  = tlu_itlb_wr_vld_g  & ~tlu_itlb_wr_vld_g_d1;
  // we don't check for demap anymore, so comment it out
//  assign tlu_itlb_dmp_vld_rise = tlu_itlb_dmp_vld_g & ~tlu_itlb_dmp_vld_g_d1;
  assign tlu_itlb_dmp_vld_rise = 1'b0;

  always @(posedge clk) begin
    tlu_itlb_wr_vld_rise_d1  <= tlu_itlb_wr_vld_rise;
    tlu_itlb_dmp_vld_rise_d1 <= tlu_itlb_dmp_vld_rise;
  end

  always @(posedge clk) begin
    if (tlu_itlb_wr_vld_rise | tlu_itlb_dmp_vld_rise) begin
      tlu_itlb_tte_tag_w2_d1  <= tlu_itlb_tte_tag_w2;
      tlu_itlb_tte_data_w2_d1 <= tlu_itlb_tte_data_w2;
    end
  end

  assign tlu_itlb_wr_dmp_error = (tlu_itlb_wr_vld_rise_d1 | tlu_itlb_dmp_vld_rise_d1) &
                                 ((tlu_itlb_tte_tag_w2_d1  != tlu_itlb_tte_tag_w2) |
                                  (tlu_itlb_tte_data_w2_d1 != tlu_itlb_tte_data_w2));

  always @(posedge clk)
    if (rst_l === 1'b1) begin
      if (enable & (tlu_itlb_wr_dmp_error | (tlu_itlb_wr_vld_g & tlu_itlb_dmp_vld_g))) begin
        $display("*ERROR*: %0d : tlu_mon: tlu_itlb_tte_tag_w2 or tlu_itlb_tte_data_w2 changed during tlu_itlb_wr_vld_g or tlu_itlb_dmp_vld_g", $time);
        `MONITOR_PATH.fail("tlu_mon: tlu_itlb_tte_tag_w2 or tlu_itlb_tte_data_w2 changed during tlu_itlb_wr_vld_g or tlu_itlb_dmp_vld_g");
      end
    end

  // extra checking added per Sanjay's request
  always @(posedge clk) begin
    tlu_tlb_access_en_l_d1_delay <= tlu_tlb_access_en_l_d1;
    tlu_lng_ltncy_en_l_delay <= tlu_lng_ltncy_en_l;
  end

  assign tlu_idtlb_wr_error = (~tlu_tlb_access_en_l_d1_delay | ~tlu_lng_ltncy_en_l_delay | ~tlu_tlb_access_en_l_d1 | ~tlu_lng_ltncy_en_l) &
                              (itlb_wr_vld | dtlb_wr_vld);


  always @(posedge clk)
    if (rst_l === 1'b1) begin
      if (enable & tlu_idtlb_wr_error) begin
        $display("*ERROR*: %0d : tlu_mon: tlu_idtlb_wr_error", $time);
        `MONITOR_PATH.fail("tlu_mon: tlu_idtlb_wr_error");
      end
    end

////////////////////////// //T H E    E N D //////////////////////////
endmodule
