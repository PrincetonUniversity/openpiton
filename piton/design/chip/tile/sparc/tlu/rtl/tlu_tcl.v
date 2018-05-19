// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_tcl.v
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
////////////////////////////////////////////////////////////////////
/*
//	Description:	Trap Control Logic
*/

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////
`include "tlu.h"

module tlu_tcl (/*AUTOARG*/
   // Outputs
   tlu_ifu_trappc_vld_w1, tlu_ifu_trapnpc_vld_w1, tlu_ifu_trap_tid_w1, 
   tlu_trap_hpstate_enb, tsa_wr_tpl, tsa_rd_tid, tsa_rd_tpl, tsa_rd_en, 
   tsa_wr_tid, tsa_wr_vld, tsa_rd_vld_e, tlu_lsu_tl_zero, tlu_restore_pc_sel_w1, 
   tlu_early_flush_pipe_w, tlu_early_flush_pipe2_w, tlu_exu_early_flush_pipe_w, 
   tlu_agp_tid_w2, tsa_tstate_en, tsa_ttype_en, tlu_tl_gt_0_w2, 
   tlu_exu_agp_tid, tlu_true_pc_sel_w, // tlu_retry_inst_m, tlu_done_inst_m, 
   tlu_tick_en_l, tlu_tickcmp_en_l, tlu_stickcmp_en_l, tlu_local_flush_w, 
   tlu_tba_en_l, tlu_thrd_wsel_w2, tlu_thread_wsel_g, tlu_final_ttype_w2,
   tlu_thread_inst_vld_g, tlu_update_pc_l_w, tlu_htickcmp_en_l,
   tsa_pc_en, tsa_npc_en, tlu_hyperv_rdpr_sel, tlu_wsr_inst_nq_g,
   tlu_exu_priv_trap_m, tlu_ibrkpt_trap_w2, tlu_full_flush_pipe_w2,  
   tlu_pstate_din_sel0, tlu_pstate_din_sel1, tlu_pstate_din_sel2, 
   tlu_pstate_din_sel3, tlu_update_pstate_l_w2, tlu_trp_lvl, 
   tlu_pil, tlu_wr_tsa_inst_w2, tlu_trap_cwp_en, // tlu_lsu_priv_trap_w,
   tlu_exu_cwp_retry_m, tlu_exu_cwpccr_update_m, tlu_lsu_priv_trap_m,
   tlu_lsu_asi_update_m, tlu_lsu_tid_m, tlu_pc_mxsel_w2, // tlu_lsu_asi_m,
   tlu_select_tba_w2, tdp_select_tba_w2, tlu_set_sftint_l_g, 
   tlu_clr_sftint_l_g, tlu_wr_sftint_l_g, tlu_sftint_mx_sel, tlu_itag_acc_sel_g, 
   tlu_sftint_en_l_g, tlu_sftint_penc_sel, tlu_sftint_vld, tlu_int_tid_m, 
   tlu_tickcmp_sel, tlu_incr_tick, immu_sfsr_trp_wr, tlu_select_redmode,
   tlu_isfsr_din_g, // tlu_dsfsr_din_g, tlu_tag_access_ctxt_sel_m, 
   tlu_tick_npt, tlu_thrd_rsel_e, tlu_inst_vld_nq_m, tlu_pic_cnt_en_m,  
   tlu_rdpr_mx1_sel, tlu_rdpr_mx2_sel, tlu_rdpr_mx3_sel, tlu_rdpr_mx4_sel, 
   tlu_rdpr_mx5_sel, tlu_rdpr_mx6_sel, tlu_rdpr_mx7_sel, tlu_lsu_pstate_am,
   tlu_lsu_redmode_rst_d1, lsu_tlu_rsr_data_mod_e, tlu_addr_msk_g, 
   // added for hypervisor support
   tlu_dnrtry0_inst_g, tlu_dnrtry1_inst_g, tlu_dnrtry2_inst_g, tlu_dnrtry3_inst_g,
   tlu_thrd_traps_w2, tlu_tick_ctl_din, tsa_htstate_en, tlu_por_rstint_g,
   tlu_hintp_vld, tlu_rerr_vld, tlu_final_offset_w1, // tlu_ifu_trapnpc_w2, 
   so, tlu_sscan_tcl_data, tlu_rst, // tlu_ifu_trappc_w2, tlu_rst_l, 
   // Inputs
   ifu_tlu_sraddr_d, ifu_tlu_rsr_inst_d, lsu_tlu_early_flush_w, ifu_tlu_pc_oor_e,
   tlu_wsr_data_b63_w, tlu_wsr_data_w, lsu_tlu_ttype_m2, ifu_tlu_flush_fd_w, 
   lsu_tlu_ttype_vld_m2, ifu_tlu_done_inst_d, ifu_tlu_retry_inst_d, ifu_tlu_ttype_m, 
   ifu_tlu_ttype_vld_m, exu_tlu_ttype_m, exu_tlu_ttype_vld_m, exu_tlu_spill, 
   exu_tlu_spill_other, exu_tlu_spill_wtype, exu_tlu_va_oor_m, exu_tlu_spill_tid,
   ifu_tlu_sir_inst_m, ifu_tlu_inst_vld_m, ifu_tlu_thrid_d, tlu_tckctr_in, 
   ifu_tlu_immu_miss_m, exu_tlu_va_oor_jl_ret_m, ifu_tlu_trap_m, lsu_tlu_wsr_inst_e,  
   exu_tlu_cwp_cmplt, exu_tlu_cwp_retry, exu_tlu_cwp_cmplt_tid, exu_tlu_ue_trap_m, 
   ifu_tlu_rstint_m, ifu_tlu_hwint_m, ifu_tlu_swint_m, pich_wrap_flg, tlu_pic_wrap_e, 
   pich_onebelow_flg, pich_twobelow_flg, pib_picl_wrap, pib_pich_wrap, tlu_tcc_inst_w, 
   int_tlu_rstid_m, tlu_int_pstate_ie, tlu_int_redmode, ifu_npc_w, tlu_pcr_ut, 
   tlu_sftint_id, lsu_tlu_async_ttype_vld_g, lsu_tlu_defr_trp_taken_g, tlu_pcr_st,
   lsu_tlu_misalign_addr_ldst_atm_m, exu_tlu_misalign_addr_jmpl_rtn_m, 
   lsu_tlu_async_tid_g, lsu_tlu_priv_action_g, lsu_tlu_async_ttype_g, lsu_tlu_wtchpt_trp_g, 
   ifu_tlu_priv_violtn_m, ifu_lsu_memref_d, tlu_pstate_priv, tlu_isfsr_flt_vld, 
   tlu_pstate_am, ffu_tlu_trap_ieee754, ffu_tlu_trap_other, ffu_tlu_trap_ue,
   ffu_ifu_tid_w2, ffu_tlu_ill_inst_m, ifu_tlu_npc_m,  // ifu_tlu_pc_m, 
   lsu_tlu_rsr_data_e, lsu_tlu_squash_va_oor_m, // tlu_restore_npc_w1,
   spu_tlu_rsrv_illgl_m, // exu_tlu_cwp0, exu_tlu_cwp1, exu_tlu_cwp2, exu_tlu_cwp3, 
   //
   // added for hypervisor support
   tlu_hpstate_priv, tlu_htstate_rw_d, tlu_htstate_rw_g, tlu_cwp_no_change_m, 
   tlu_hscpd_dacc_excpt_m, tlu_htickcmp_rw_e, tlu_gl_rw_m, // tlu_gl_rw_g, 
   tlu_hpstate_enb, tlu_cpu_mondo_cmp, tlu_dev_mondo_cmp,
   tlu_resum_err_cmp, tlu_hintp, tlu_hpstate_tlz, tlu_qtail_dacc_excpt_m, 
   pib_priv_act_trap_m, rclk, arst_l, grst_l, si, se, rst_tri_en, ctu_sscan_tid
   );	

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
// End of automatics
input [`TLU_ASR_ADDR_WIDTH-1:0] ifu_tlu_sraddr_d;      // addr of sr(st/pr)
input       ifu_tlu_rsr_inst_d;    // valid rd sr(st/pr)
// input       ifu_tlu_wsr_inst_d;    // valid wr sr(st/pr)
input       lsu_tlu_wsr_inst_e;    // valid wr sr(st/pr)
input   	tlu_wsr_data_b63_w;    // b63 of wsr data
// input   	tlu_wsr_data_b16_w;    // b16 of wsr data
input [3:0] tlu_wsr_data_w;    // pr/st data to irf.
input [8:0]	lsu_tlu_ttype_m2;	// trap type in m2.
input		lsu_tlu_ttype_vld_m2;	// trap is signaled.
// added asynchronize trap to handle correctable dmmu parity errors
input       lsu_tlu_defr_trp_taken_g; // lsu asynchronous trap valid
input       lsu_tlu_async_ttype_vld_g; // lsu asynchronous trap valid
input [6:0] lsu_tlu_async_ttype_g;  // lsu asynchronous trap type 
input [1:0] lsu_tlu_async_tid_g; // asynchronous trap - thread
// Removed unused bits 
// input	[1:0]	lsu_tlu_ttype_tid_m2;	// trapping thread
input		ifu_tlu_done_inst_d;  	// done is valid
input		ifu_tlu_retry_inst_d;  // retry is valid

input [8:0]	ifu_tlu_ttype_m;	// trap type in m2.
input		ifu_tlu_ttype_vld_m;	// trap is signaled.
input		ifu_tlu_trap_m;	    // trap is signaled.
// modified for timing
input	    ifu_tlu_flush_fd_w;	    // instruction flush signal 
// input		ifu_tlu_flush_m;	    // instruction flush signal 
input		lsu_tlu_early_flush_w;	// early flush with tlb from LSU 

input [8:0]	exu_tlu_ttype_m;	// exu src ttype
input		exu_tlu_ttype_vld_m;	// exu src ttype vld
input		exu_tlu_ue_trap_m;	// exu ue ecc trap indicator 
//
// added for timing
/*
input [2:0]  exu_tlu_cwp0;  // cwp - thread0
input [2:0]  exu_tlu_cwp1;  // cwp - thread1
input [2:0]  exu_tlu_cwp2;  // cwp - thread2
input [2:0]  exu_tlu_cwp3;  // cwp - thread3
*/
//
input		exu_tlu_spill;		// spill trap
input [1:0]	exu_tlu_spill_tid;	// spill trap - thrid
input       exu_tlu_spill_other;    // From exu of sparc_exu.v
input [2:0] exu_tlu_spill_wtype;    // From exu of sparc_exu.v
input		exu_tlu_va_oor_m;	// ??? - to be used in sfsr
input		exu_tlu_va_oor_jl_ret_m; // ??? - to be used in sfsr
input		ifu_tlu_sir_inst_m; 	// sir instruction executed

input       ifu_tlu_inst_vld_m;    // inst in w-stage of pipe.
input       ifu_tlu_pc_oor_e;    // inst in w-stage of pipe.
input [1:0] ifu_tlu_thrid_d;   	// Thread id.
// input       lsu_tlu_dmmu_miss_g;   // ld/st misses in dtlb.
//
// modified the stage for timing 
//input     ifu_tlu_immu_miss_e;   // i-side page fault
input       ifu_tlu_immu_miss_m;   // i-side page fault

input       exu_tlu_cwp_cmplt;
input       exu_tlu_cwp_retry;
input [1:0] exu_tlu_cwp_cmplt_tid;
input       tlu_cwp_no_change_m;
// input       exu_tlu_cwp_fastcmplt_w;
// input moved to tlu_misctl
// input [2:0]	tsa_rdata_cwp;
// input [`TSA_TTYPE_WIDTH-1:0]	tsa_rdata_ttype;
// input [7:0]	tsa_rdata_ccr;
// input [7:0]	tsa_rdata_asi;

input		ifu_tlu_rstint_m;	// reset interrupt
input		ifu_tlu_hwint_m;	// hw interrupt
input		ifu_tlu_swint_m;	// sw interrupt
input [5:0]	int_tlu_rstid_m;	// reset type
input [`TLU_THRD_NUM-1:0] tlu_int_pstate_ie;      // interrupt enable
input [`TLU_THRD_NUM-1:0] tlu_int_redmode;        // redmode
// input  [`TLU_THRD_NUM-1:0]	const_cpuid;

input [`TLU_THRD_NUM-1:0] tlu_sftint_id;
input [`TLU_THRD_NUM-1:0] pich_wrap_flg;
input [`TLU_THRD_NUM-1:0] pich_onebelow_flg;
input [`TLU_THRD_NUM-1:0] pich_twobelow_flg;
input [`TLU_THRD_NUM-1:0] pib_picl_wrap;
// modified for bug 5436: Niagara 2.0
input [`TLU_THRD_NUM-1:0] tlu_pcr_ut;
input [`TLU_THRD_NUM-1:0] tlu_pcr_st;
// input tlu_pic_wrap_e, tlu_pcr_ut_e, tlu_pcr_st_e;
input tlu_pic_wrap_e;

// input		tlu_tick_match;	// match between tick and tick-cmp 
// input		tlu_stick_match;	// match between tick and stick-cmp 
// input  [`TLU_THRD_NUM-1:0] pib_pic_wrap; // overflow for the pic registers - lvl15 int 
// modified for timing support
// input  [`TLU_THRD_NUM-1:0] pib_priv_act_trap; // access priv violation of the pics 
input  [`TLU_THRD_NUM-1:0] pib_priv_act_trap_m; // access priv violation of the pics 

input		lsu_tlu_misalign_addr_ldst_atm_m;// misaligned addr - ld,st,atomic 
input		exu_tlu_misalign_addr_jmpl_rtn_m;// misaligned addr - jmpl or return addr
// input		lsu_tlu_priv_violtn_g;		// privileged violation trap
input		lsu_tlu_priv_action_g;		// privileged action trap
input		lsu_tlu_wtchpt_trp_g;		// watchpt trap has occurred.

input		ifu_tlu_priv_violtn_m;
input		ifu_lsu_memref_d;
input [3:0] tlu_pstate_priv;
input [3:0] tlu_pstate_am;
input [3:0]	tlu_isfsr_flt_vld;
input		ffu_tlu_trap_ieee754;
input		ffu_tlu_trap_other;
input		ffu_tlu_trap_ue;
input		ffu_tlu_ill_inst_m; // illegal instruction trap from ffu		
input [1:0]	ffu_ifu_tid_w2;
input [7:0]	lsu_tlu_rsr_data_e;
input       lsu_tlu_squash_va_oor_m;  // squash va_oor for mem-op.
input       spu_tlu_rsrv_illgl_m;    // illegal instruction trap from spu 
input       tlu_htstate_rw_d;
input       tlu_htstate_rw_g;
input       tlu_htickcmp_rw_e;
// input       tlu_gl_rw_g;
input       tlu_gl_rw_m;
input [`TLU_THRD_NUM-1:0] tlu_hpstate_priv;
input [`TLU_THRD_NUM-1:0] tlu_hpstate_enb;
input [`TLU_THRD_NUM-1:0] tlu_hpstate_tlz;
input [`TLU_THRD_NUM-1:0] tlu_cpu_mondo_cmp;
input [`TLU_THRD_NUM-1:0] tlu_dev_mondo_cmp;
input [`TLU_THRD_NUM-1:0] tlu_resum_err_cmp;
input [`TLU_THRD_NUM-1:0] tlu_hintp;
// input [48:0] ifu_tlu_pc_m;
input [48:0] ifu_tlu_npc_m;
// input [33:0] tlu_partial_trap_pc_w1;
// modified for bug 3017
// logic moved to tlu_misctl
input tlu_hscpd_dacc_excpt_m;
input tlu_qtail_dacc_excpt_m;
// added for timing
input [4:0] tlu_hyperv_rdpr_sel;
input [1:0]	tlu_tckctr_in;
input		rclk; // clock
// sscan tid
input [`TLU_THRD_NUM-1:0] ctu_sscan_tid;
//
// modified to abide to the niagara reset methodology
input		grst_l;				// global reset - active log
input		arst_l;				// global reset - active log
input		rst_tri_en;			// global reset - active log
input		si;				    // global scan-in 
input		se;				    // global scan-out 

/*autooutput*/
// beginning of automatic outputs (from unused autoinst outputs)
// end of automatics
output	  	 tlu_ifu_trappc_vld_w1;	// trap pc or pc on retry.
output	  	 tlu_ifu_trapnpc_vld_w1;// trap pc or pc on retry.
output [1:0] tlu_ifu_trap_tid_w1;	// thread id.
output	     tlu_trap_hpstate_enb;	
output	     tlu_restore_pc_sel_w1;	
output [`TLU_THRD_NUM-1:0] pib_pich_wrap;
output tlu_tcc_inst_w;

output [2:0] tsa_wr_tpl;		// trap level for wr.
output [1:0] tsa_rd_tid;		// thread id for wr.
output [2:0] tsa_rd_tpl;		// trap level for rd.
output [1:0] tsa_wr_tid;		// thread id for rd.
output [1:0] tsa_wr_vld;		// write pointer vld
// modified for timing
output 		 tsa_rd_vld_e;		// read pointer
output 		 tsa_rd_en;		    // read pointer
output [3:0] tlu_lsu_tl_zero;	// trap level is zero.
// output		 tlu_ifu_flush_pipe_w;  // exception related flush
// output		 tlu_flush_pipe_w;  	// exception related flush - local copy
// added for timing 
// output		 tlu_flush_all_w2;  	// exception related flush - local copy
// output		 tlu_flush_all_w;  	// exception related flush - local copy
output		 tlu_local_flush_w;  	// exception related flush - local copy
output		 tlu_early_flush_pipe_w;  	// exception related flush - local copy
output		 tlu_early_flush_pipe2_w;  	// exception related flush - local copy
output		 tlu_exu_early_flush_pipe_w;  	// exception related flush - to exu
output		 tlu_full_flush_pipe_w2;  	    // exception related flush - to exu
// output  [2:0]   tlu_exu_agp;            // alternate global pointer
// output          tlu_exu_agp_swap;       // switch globals
// modified due to timing
// output [1:0] tlu_agp_tid_g;        // thread that agp refers to
output [1:0] tlu_agp_tid_w2;        // thread that agp refers to
output [1:0] tlu_exu_agp_tid;        // thread that agp refers to
output		 tsa_pc_en;		// enable write of pc in tsa.
output	     tsa_npc_en;		// enable write of npc in tsa.
output	     tsa_tstate_en;		// enable write of tstate in tsa.
output	     tsa_htstate_en;	// enable write of htstate in tsa.
output	     tsa_ttype_en;		// enable write of ttype in tsa.
// modified due to timing
// output       tlu_tl_gt_0_g;     // trp lvl gt then 0
output       tlu_tl_gt_0_w2;     // trp lvl gt then 0
// modified for timing
output [2:0] tlu_true_pc_sel_w;
// output       tlu_retry_inst_m;  // valid retry inst
// output       tlu_done_inst_m;   // valid done inst
// output       tlu_dnrtry_inst_m_l; // valid done/retry inst - g
output       tlu_tick_en_l;     // tick reg write enable
output [`TLU_THRD_NUM-1:0]  tlu_tickcmp_en_l;  // tick compare reg write enable
output [`TLU_THRD_NUM-1:0]  tlu_stickcmp_en_l; // stick compare reg write enable
output [`TLU_THRD_NUM-1:0]  tlu_htickcmp_en_l; // update htickcmp register 
output [`TLU_THRD_NUM-1:0]  tlu_tba_en_l;      // tba reg write enable
output [`TLU_THRD_NUM-1:0]  tlu_thrd_wsel_w2;   // thread requiring tsa write.
output [`TLU_THRD_NUM-1:0]  tlu_thread_wsel_g; // thread for instruction fetched 
output [`TSA_TTYPE_WIDTH-1:0] tlu_final_ttype_w2;  // selected ttype - w2
// output   tlu_async_trap_taken_g; // async trap taken
output [`TLU_THRD_NUM-1:0]  tlu_thread_inst_vld_g; // valid inst for a thread
// output [`TLU_THRD_NUM-1:0]  tlu_thread_inst_vld_w2; // valid inst for a thread
// output [`TLU_THRD_NUM-1:0]  tlu_update_pc_l_m; // update pc or npc for a thread
output [`TLU_THRD_NUM-1:0]  tlu_update_pc_l_w; // update pc or npc for a thread
// output [`TLU_THRD_NUM-1:0]  tlu_thrd_rsel_g; // thread requiring tsa read
// modified for bug 1767
// output         	tlu_select_tle;	// tle/cle value on trap 
// output [1:0]   tlu_select_mmodel;	// mem. model on trap
output 	  	tlu_select_redmode;	// redmode setting on trap
// Modified for bug 1575
//
// output   [2:0]  tlu_pstate_din_sel;    // sel source of tsa wdata
output [1:0] tlu_pstate_din_sel0;    // sel source of tsa wdata
output [1:0] tlu_pstate_din_sel1;    // sel source of tsa wdata
output [1:0] tlu_pstate_din_sel2;    // sel source of tsa wdata
output [1:0] tlu_pstate_din_sel3;    // sel source of tsa wdata
//
// modified due to timing
// output [3:0] tlu_update_pstate_l_g; // pstate write enable
output [3:0] tlu_update_pstate_l_w2; // pstate write enable
output [2:0] tlu_trp_lvl;    // trp lvl - mx'ed
output [3:0] tlu_pil;		  // pil - mx'ed
// output       tlu_wsr_inst_g; // write state inst
// 
// added for timing
output       tlu_wsr_inst_nq_g; // write state inst
// output       tlu_wr_tsa_inst_g; // write state inst
output       tlu_wr_tsa_inst_w2; // write state inst
output       tlu_exu_priv_trap_m; // local traps send to exu 
output       tlu_lsu_priv_trap_m; // local traps send to lsu 
// output       tlu_lsu_priv_trap_w; // local traps send to lsu 
// experiment
output       tlu_pic_cnt_en_m; // local traps send to exu 
// output       tlu_exu_pic_onebelow_m; // local traps send to exu 
// output       tlu_exu_pic_twobelow_m; // local traps send to exu 
output       tlu_exu_cwp_retry_m;
output       tlu_exu_cwpccr_update_m;
// output moved to tlu_misctl
// output [2:0] tlu_exu_cwp_m;
// output [7:0] tlu_exu_ccr_m;
// output [7:0] tlu_lsu_asi_m;		// asi from stack
// added for bug3499
output [`TLU_THRD_NUM-1:0] tlu_trap_cwp_en;

output       tlu_lsu_asi_update_m; // update asi
output [1:0] tlu_lsu_tid_m;		// thread for asi update

// output	 tlu_assist_boot_rst_g; // use rstvaddr all zeroes
// modified due to timing
// output		 tlu_self_boot_rst_g;	// use rstvaddr all ones
// output		 tlu_select_tba_g;	// use tba
// output		 tlu_select_htba_g;	// use htba
// modified for one-hot mux problem
// output		 tlu_self_boot_rst_w2;	// use rstvaddr all ones
// output		 tlu_select_htba_w2;	// use htba
output [2:0] tlu_pc_mxsel_w2;
output		 tlu_select_tba_w2;	// use tba
output		 tdp_select_tba_w2;	// use tba
//
output		 tlu_set_sftint_l_g;	// set sftint
output		 tlu_clr_sftint_l_g;	// clr sftint
output		 tlu_wr_sftint_l_g;	// wr to sftin (asr 16)
output [`TLU_THRD_NUM-1:0] tlu_sftint_en_l_g; // wr en sftint regs.
output [`TLU_THRD_NUM-1:0] tlu_sftint_mx_sel; // mux sel sftint regs.
//
// removed due to sftint recode
// output	[3:0]	tlu_sftint_lvl14_int;	// level 14 sft interrupt

output [3:0] tlu_sftint_penc_sel;	// select appr. thread for pr. encd.
output [3:0] tlu_sftint_vld;	// a sftint is valid for a thread	
output [1:0] tlu_int_tid_m;		// thread id
output [1:0] tlu_incr_tick;         // increment tick reg
output [3:0] tlu_tickcmp_sel;       // select src for tickcmp

output [3:0]  immu_sfsr_trp_wr;
output tlu_itag_acc_sel_g;

output [23:0] tlu_isfsr_din_g;
//
// removed due to sftint code cleanup
output		 tlu_tick_npt;		// npt bit of tick
output [3:0] tlu_thrd_rsel_e;	// read select for threaded regs

output		 tlu_inst_vld_nq_m;	// not qualified inst vld

output [3:0] tlu_lsu_pstate_am;	// ship to lsu

output [2:0] tlu_rdpr_mx1_sel;
output [2:0] tlu_rdpr_mx2_sel;
output [1:0] tlu_rdpr_mx3_sel;
output [1:0] tlu_rdpr_mx4_sel; 
output [2:0] tlu_rdpr_mx5_sel; 
output [2:0] tlu_rdpr_mx6_sel;
output [3:0] tlu_rdpr_mx7_sel;
//
output [`TSA_TTYPE_WIDTH-1:0] tlu_final_offset_w1;
// output   [3:0]   tlu_lsu_redmode;       	// redmode
// output [3:0] tlu_lsu_redmode_rst;
// output [`TLU_THRD_NUM-1:0] tlu_lsu_async_ack_w2;
output [3:0] tlu_lsu_redmode_rst_d1;
output [7:0] lsu_tlu_rsr_data_mod_e;
output       tlu_addr_msk_g;        // address masking active for thread in pipe.
//
// added for hypervisor support
// modified for timing
// output tlu_thrd0_traps, tlu_thrd1_traps;
// output tlu_thrd2_traps, tlu_thrd3_traps;
output [`TLU_THRD_NUM-1:0] tlu_thrd_traps_w2; 
output tlu_dnrtry0_inst_g, tlu_dnrtry1_inst_g;
output tlu_dnrtry2_inst_g, tlu_dnrtry3_inst_g;
// output tlu_ibrkpt_trap_g; 
output tlu_ibrkpt_trap_w2; 
output tlu_tick_ctl_din;
output [`TLU_THRD_NUM-1:0] tlu_por_rstint_g;
output [`TLU_THRD_NUM-1:0] tlu_hintp_vld;  // From tcl of tlu_tcl.v
output [`TLU_THRD_NUM-1:0] tlu_rerr_vld;  // From tcl of tlu_tcl.v
// modified for bug 3017
// moved to tlu_misctl
output [48:0] ifu_npc_w; //ifu_pc_w, 
// 
// shadow scan data from tcl tl and ttype
output [`TCL_SSCAN_WIDTH-1:0] tlu_sscan_tcl_data;

//
// added to abide to the niagara reset methodology
output tlu_rst;     // local unit reset - active high
// output tlu_rst_l;	// local unit reset - active low
output so;			// global scan-out 

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics

// this signal were added to abide to the niagara reset methodology
wire local_rst;
wire local_rst_l;
wire tlu_rst_l;	// local unit reset - active low

wire [1:0]  tlu_exu_tid_m;
wire [3:0]	pstate_rmode;

// wire select_tba_g;	// use tba
wire local_select_tba_w2;	// use tba
wire [1:0] select_tba_element_w2;	// use tba
// wire select_htba_g;	// use htba
//
// added for early flush timing fix
// wire tlu_early_flush_pipe_m; 
wire local_early_flush_pipe_w; 
wire local_early_flush_pipe2_w; 
wire local_early_flush_pipe3_w; 
wire local_early_flush_pipe4_w; 
wire lsu_ttype_vld_w, lsu_ttype_vld_w2; 
wire tlu_flush_all_w; 
wire tlu_ifu_flush_pipe_w;  // exception related flush
wire tlu_flush_pipe_w;  // exception related flush
wire tlu_flush_all_w2; 
// wire tlu_wr_tsa_inst_g; // write state inst
wire tlu_self_boot_rst_g, tlu_self_boot_rst_w2;	
wire dnrtry_inst_g; 
wire dnrtry0_inst_g, dnrtry1_inst_g;
wire dnrtry2_inst_g, dnrtry3_inst_g;
wire [`TLU_THRD_NUM-1:0] dnrtry_inst_w2; 
wire thrd0_traps,thrd1_traps;
wire thrd2_traps,thrd3_traps;
// wire [`TLU_THRD_NUM-1:0] async_trap_ack_g;
// wire [`TLU_THRD_NUM-1:0] async_trap_ack_w2;
wire [2:0]	trp_lvl0,trp_lvl0_new;
wire [2:0]	trp_lvl1,trp_lvl1_new;
wire [2:0]	trp_lvl2,trp_lvl2_new;
wire [2:0]	trp_lvl3,trp_lvl3_new;
wire tl0_en, tl0_gt_0;
wire tl1_en, tl1_gt_0;
wire tl2_en, tl2_gt_0;
wire tl3_en, tl3_gt_0;
wire [1:0] agp_tid_g, agp_tid_w2, agp_tid_w3; // thread that agp refers to
// wire tlu_pic_onebelow_e, tlu_pic_twobelow_e; 
// experiment
wire pich_wrap_flg_m, tlu_pich_wrap_flg_m; // pich_wrap_flg_e, 
wire tlu_picl_wrap_flg_m; // pich_wrap_flg_e, 
// modified for bug 5436 - Niagara 2.0
wire [`TLU_THRD_NUM-1:0] pic_cnt_en;
wire pic_cnt_en_e, pic_cnt_en_m, pic_cnt_en_w, pic_cnt_en_w2; 
// wire pic_trap_en_e; 
//wire pcr_ut_e, pcr_st_e; 
// wire [`TLU_THRD_NUM-1:0] pich_exu_wrap_e;
// wire pic_hpstate_enb_e, pic_hpstate_priv_e, pic_pstate_priv_e; 
//
wire [`TLU_THRD_NUM-1:0] tlz_thread_set, tlz_thread_data;
wire [`TLU_THRD_NUM-1:0] tlz_thread;
wire [`TLU_THRD_NUM-1:0] tlz_trap_m, tlz_exu_trap_m;
wire [`TLU_THRD_NUM-1:0] tlz_trap_nq_g, tlz_trap_g; 
wire [`TLU_THRD_NUM-1:0] ifu_thrd_flush_w; 
wire [`TLU_THRD_NUM-1:0] tlu_none_priv; 
wire cpu_mondo_trap_g, dev_mondo_trap_g; 
wire cpu_mondo_trap_w2, dev_mondo_trap_w2; 
wire [`TLU_THRD_NUM-1:0] tlu_cpu_mondo_trap; 
wire [`TLU_THRD_NUM-1:0] tlu_dev_mondo_trap; 
wire [`TLU_THRD_NUM-1:0] tlu_resum_err_trap; 
wire [`TLU_THRD_NUM-1:0] tlu_hyper_lite;
wire [3:0] local_rdpr_mx6_sel; 
wire [3:0] local_rdpr_mx5_sel; 
wire [2:0] local_rdpr_mx4_sel; 
wire [2:0] local_rdpr_mx3_sel;
wire [3:0] local_rdpr_mx2_sel;
wire [3:0] local_rdpr_mx1_sel;
wire tlu_none_priv_m;
wire ibrkpt_trap_m, ibrkpt_trap_g, ibrkpt_trap_w2;
wire va_oor_jl_ret_g;
wire done_inst_m_tmp;
wire retry_inst_m_tmp;
wire done_inst_w2;
wire retry_inst_w2;
wire [2:0] true_pc_sel_m, true_pc_sel_w; 
// wire dsfsr_flt_vld_g;
wire done_inst_e, retry_inst_e;
wire done_inst_m, retry_inst_m;
wire exu_done_inst_m, exu_retry_inst_m;
// logic moved to misctl
// wire cwp_no_change_m;
// wire [2:0] cwp_xor_m, trap_old_cwp_m; 
wire done_inst_g, retry_inst_g;
wire [1:0] thrid_d, thrid_e, thrid_m, thrid_g;
wire [1:0] thrid_w2; 
//
// added for tsa_wr_tid bug
//
// wire thread0_wtrp_g, thread1_wtrp_g, thread2_wtrp_g, thread3_wtrp_g;
wire thread0_wtrp_w2, thread1_wtrp_w2, thread2_wtrp_w2, thread3_wtrp_w2;
wire thread0_wsel_g, thread1_wsel_g, thread2_wsel_g, thread3_wsel_g;
wire thread0_wsel_w2, thread1_wsel_w2, thread2_wsel_w2, thread3_wsel_w2;
wire thread0_rsel_dec_g,thread1_rsel_dec_g;
wire thread2_rsel_dec_g,thread3_rsel_dec_g;
wire thread0_rsel_d, thread1_rsel_d, thread2_rsel_d, thread3_rsel_d;
wire thread0_rsel_m, thread1_rsel_m, thread2_rsel_m, thread3_rsel_m;
wire thread0_stg_m, thread1_stg_m, thread2_stg_m, thread3_stg_m; 
wire thread0_stg_m_buf, thread1_stg_m_buf, thread2_stg_m_buf, thread3_stg_m_buf; 
wire thread0_rsel_g, thread1_rsel_g, thread2_rsel_g, thread3_rsel_g;
wire thread0_rsel_e, thread1_rsel_e, thread2_rsel_e, thread3_rsel_e;
wire inst_vld_w2, inst_vld_g, inst_vld_m, inst_vld_nf_g;
wire [`TLU_THRD_NUM-1:0] thread_inst_vld_g; 
wire [`TLU_THRD_NUM-1:0] thread_inst_vld_w2; 
// wire tlu_inst_vld_m;	// qualified inst vld
wire exu_ttype_vld_g, ifu_ttype_vld_g, exu_ue_trap_g;
wire [8:0]	exu_ttype_g, ifu_ttype_tmp_g, ifu_ttype_g;
wire [8:0]	exu_spill_ttype; 
// added for timing fix
wire    spu_ill_inst_m ;      // illegal instruction trap from spu 
wire    spu_ill_inst_uf_g ;      // illegal instruction trap from spu 
wire    spu_ill_inst_g ;      // illegal instruction trap from spu 
wire    pib_priv_act_trap_g ;   // privilege action trap from pib 
wire    pib_priv_act_trap_uf_g ;   // privilege action trap from pib 
wire    pib_priv_act_early_trap_m ; // privilege action trap from pib 
wire    ffu_ill_inst_uf_g ;   // illegal instruction trap from ffu - unflushed 
wire    ffu_ill_inst_g ;      // illegal instruction trap from ffu 
wire    ffu_higher_pri_g ;      // illegal instruction trap from ffu 
wire    exu_higher_pri_g ;      // UE ECC trap from exu 
// wire    lsu_ill_inst_uf_g ;   // illegal instruction trap from lsu - unflushed
// wire    lsu_ill_inst_g ;      // illegal instruction trap from lsu 
// wire [`TLU_THRD_NUM-1:0] lsu_defr_thrd_g; 
wire    lsu_defr_trap_g, lsu_defr_trap_w2 ;     // deferred trap from lsu 
wire    local_lsu_async_ttype_vld_w; // deferred trap from lsu 
// wire    local_lsu_defr_trp_taken_g; // deferred trap from lsu 
wire [`TLU_THRD_NUM-1:0] lsu_defr_trp_taken_w2; 
// wire    lsu_tlu_defr_trp_taken_w2 ;  // deferred trap from lsu - signled in g for w2
                                     // trap need to sync up with lsu_tlu_async_ttype_vld_g  
wire    htrap_ill_inst_m ;      // illegal instruction trap from htrap 
wire    htrap_ill_inst_uf_g ;   // illegal instruction trap from htrap - unflushed
wire    htrap_ill_inst_g ;      // illegal instruction trap from htrap 

wire	[`TLU_ASR_ADDR_WIDTH-1:0] sraddr;
wire	[`TLU_ASR_ADDR_WIDTH-1:0] sraddr2;
// modified due to timing
// wire		wsr_inst_d;
wire        asr_hyperp, asr_priv;
wire		tpc_rw_d, tnpc_rw_d, tstate_rw_d, ttype_rw_d;
wire		tick_rw_d, tickcmp_rw_d, tick_npriv_r_d;
wire	    pcr_rsr_d, pic_rsr_d;	
wire	    pcr_rsr_e, pic_rsr_e;	
wire        tlu_gl_rw_g;
//
// added for hypervisor support
wire maxtl_wr_sel;
wire [3:0] maxstl_wr_sel;
wire [2:0] wsr_trp_lvl0_data_w, wsr_trp_lvl1_data_w;
wire [2:0] wsr_trp_lvl2_data_w, wsr_trp_lvl3_data_w;
wire [2:0] wsr_trp_lvl0_data_w2, wsr_trp_lvl1_data_w2;
wire [2:0] wsr_trp_lvl2_data_w2, wsr_trp_lvl3_data_w2;
wire	   stick_rw_d, stickcmp_rw_d, stickcmp_rw_e; 
wire	   stickcmp_rw_m, stickcmp_rw_g; 
// wire [3:0] stickcmp_int;       // interrupt caused by stick_ticktmp 
// wire [3:0] stick_intclr;  // use to clear the stick_int bit

wire tba_rw_d, pstate_rw_d, pil_rw_d, tl_rw_d; 
wire tsa_wr_tid_sel_g, tsa_wr_tid_sel_tim_g, tsa_wr_tid_sel_w2;
wire immu_miss_g;
wire trap_taken_g, trap_taken_w2;
wire [1:0] trap_tid_g;
// wire [1:0] tsa_wr_tid_g;
wire [1:0] pend_trap_tid_g, pend_trap_tid_w2;
wire [`TSA_TTYPE_WIDTH-1:0] final_ttype_w2; 
wire [`TSA_TTYPE_WIDTH-1:0] tba_ttype_w1;
wire [`TSA_TTYPE_WIDTH-1:0] final_offset_w1; 
wire tsa_rd_vld;
// modified for bug 3017
// logic moved to tlu_misctl
// wire [48:0] normal_trap_pc_w1, normal_trap_npc_w1; 
// wire [48:0] trap_pc_w1, trap_npc_w1; 
// wire [48:0] trap_pc_w2, trap_npc_w2; 
// wire tsa_rd_vld_e, tsa_rd_vld_m;
wire [`TLU_THRD_NUM-1:0] sscan_tid_sel; 
// logic moved to tlu_misctl
/*
wire [`TLU_THRD_NUM-1:0] sscan_ttype_en;
wire [`TLU_THRD_NUM-1:0] sscan_tt_rd_sel;
wire [`TLU_THRD_NUM-1:0] sscan_tt_wr_sel;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt0_data;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt1_data;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt2_data;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt3_data;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt0_din;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt1_din;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt2_din;
wire [`TSA_TTYPE_WIDTH-1:0] sscan_tt3_din;
wire [`TSA_TTYPE_WIDTH-1:0] tsa_rdata_ttype_m;
*/
wire [`TCL_SSCAN_WIDTH-1:0] tcl_sscan_test_data;
wire tba_ttype_sel_w2;
wire [3:0] final_ttype_sel_g, final_ttype_sel_w2;
// modified due to one-hot mux bug
wire [1:0] final_offset_en_g, final_offset_en_w1; 
wire [2:0] final_offset_sel_w1; 
wire restore_pc_sel_g, restore_pc_sel_w1;
// removed for timing
// wire [`TSA_TTYPE_WIDTH-1:0] sync_ttype_g;
// added to support lsu dferred traps
wire		priority_trap_sel0, priority_trap_sel1, priority_trap_sel2;
wire		sync_trap_taken_g, sync_trap_taken_w2;
// added for timing fix
wire		sync_trap_taken_m ;
wire		ifu_ttype_early_vld_m ;
// wire  [3:0]   tickcmp_int;       // interrupt caused by tick_ticktmp 
wire	   fp_trap_thrd0,fp_trap_thrd1,fp_trap_thrd2,fp_trap_thrd3;
wire [`TSA_TTYPE_WIDTH-1:0] ffu_async_ttype;
wire	   spill_thrd0,spill_thrd1,spill_thrd2,spill_thrd3;
wire [`TLU_THRD_NUM-1:0] trap_cwp_enb; 
wire [`TLU_THRD_NUM-1:0] lsu_async_vld_en_g, lsu_async_vld_en_w2; 
wire	   dmmu_async_thrd0, dmmu_async_thrd1; 
wire       dmmu_async_thrd2, dmmu_async_thrd3;
wire [`TSA_TTYPE_WIDTH-1:0] dmmu_async_ttype;
wire	   pend_to_thrd0_en, pend_to_thrd1_en;
wire	   pend_to_thrd2_en, pend_to_thrd3_en;
wire	   pend_to_thrd0_reset, pend_to_thrd1_reset;
wire	   pend_to_thrd2_reset, pend_to_thrd3_reset;
wire tlu_pich_cnt_hld;
wire [`TLU_THRD_NUM-1:0] pich_cnt_hld_rst_g;
wire [`TLU_THRD_NUM-1:0] pich_cnt_hld_rst_w2;
wire [`TLU_THRD_NUM-1:0] pend_pich_cnt_hld;
wire [`TLU_THRD_NUM-1:0] pend_pich_cnt_hld_q;
wire [`TLU_THRD_NUM-1:0] pend_pich_cnt_hld_noqual;
wire [`TLU_THRD_NUM-1:0] pend_pich_cnt_hld_early;
wire [`TLU_THRD_NUM-1:0] pend_pich_cnt_adj;
wire [`TLU_THRD_NUM-1:0] cwp_en_thrd_reset; 
// wire	   pend_to_thrd0_taken, pend_to_thrd1_taken;
// wire	   pend_to_thrd2_taken, pend_to_thrd3_taken;
wire [`TSA_TTYPE_WIDTH-1:0] pend_ttype0,pend_ttype1,pend_ttype2,pend_ttype3;
wire	   pending_trap0,pending_trap1,pending_trap2,pending_trap3;
wire [`TSA_TTYPE_WIDTH-1:0] pending_ttype0,pending_ttype1,pending_ttype2,pending_ttype3;
wire [`TSA_TTYPE_WIDTH-1:0] pending_ttype, pending_ttype_w2;
//
// Added for bug 1575
wire agp_tid_sel;	
// modified due to timing
// wire update_pstate0_g,update_pstate1_g;
// wire update_pstate2_g,update_pstate3_g;
// wire [`TLU_THRD_NUM-1:0] update_pstate_g;,
wire [`TLU_THRD_NUM-1:0] update_pstate_w2;
wire thrd0_traps_w2, thrd1_traps_w2;
wire thrd2_traps_w2, thrd3_traps_w2;
wire ifu_ttype_vld_tmp_g;
//
// added for timing, move qualification from ifu to tlu
wire	   ifu_ttype_vld_m;
wire	   cwp_cmplt0,cwp_cmplt1,cwp_cmplt2,cwp_cmplt3;
wire	   cwp_cmplt_w2, cwp_cmplt_g;
wire	   cwp_cmplt_rtry_w2, cwp_cmplt_rtry_g;
wire	   cwp_fastcmplt_w2;
wire	   cwp_cmplt0_pending, cwp_cmplt1_pending;
wire	   cwp_cmplt2_pending, cwp_cmplt3_pending;
wire	   cwp_retry0,cwp_retry1,cwp_retry2,cwp_retry3;
wire	   pending_thrd0_event_taken, pending_thrd1_event_taken;
wire	   pending_thrd2_event_taken, pending_thrd3_event_taken;
// wire	   pending_thrd0_event_taken_w2, pending_thrd1_event_taken_w2;
// wire	   pending_thrd2_event_taken_w2, pending_thrd3_event_taken_w2;
wire	   cwp_fastcmplt_m, cwp_fastcmplt_uq_g, cwp_fastcmplt_g;
wire	   pending_dntry0_taken, pending_dntry1_taken; 
wire	   pending_dntry2_taken, pending_dntry3_taken;
wire	   rstint_g,hwint_g,swint_g;
wire [2:0] early_ttype_sel;
// wire [2:0] rst_ttype_sel;
wire [1:0] rst_ttype_sel;
wire rst_hwint_sel_w2;
// modified for timing
// wire [3:0] rst_hwdr_ttype_sel;
wire rst_hwdr_ttype_sel_w2;
wire	   onehot_pending_ttype_sel;
wire	   early_priv_traps_g, exu_hyper_traps_g; 
wire	   exu_pib_priv_act_trap_m; 
wire [`TLU_THRD_NUM-1:0] pib_wrap_m; 
wire [`TLU_THRD_NUM-1:0] pib_pich_wrap_m; 
wire pib_wrap_trap_nq_g, pib_wrap_trap_g, pib_wrap_trap_m;
wire [`TLU_THRD_NUM-1:0] pib_trap_en;
wire [`TLU_THRD_NUM-1:0] picl_wrap_pend;
//
// added for timing; moved qualification from IFU to TLU
wire	   ifu_rstint_m,ifu_hwint_m,ifu_swint_m; // swint_nq_g;
wire	   sftint_penc_update; 
wire	   sftint_user_update_g, sftint_user_update_w2; 
wire	   penc_sel_user_update; 
wire [5:0] rstid_g;
wire	   trp_lvl0_incr_w2, trp_lvl1_incr_w2;
wire	   trp_lvl2_incr_w2, trp_lvl3_incr_w2;
wire	rstint_taken,hwint_taken,swint_taken;
// wire	swint_thrd0_taken, swint_thrd1_taken;
// wire	swint_thrd2_taken, swint_thrd3_taken;
wire    sirint_taken;
// wire [`TLU_THRD_NUM-2:0] swint_thrd_g;
wire [`TLU_THRD_NUM-2:0] sftint_penc_thrd;
wire	por_rstint_g, xir_rstint_g; 
wire	por_rstint0_g, por_rstint1_g;
wire	por_rstint2_g, por_rstint3_g;
wire    por_rstint_w2; 
wire	por_rstint0_w2, por_rstint1_w2;
wire	por_rstint2_w2, por_rstint3_w2;
wire	trp_lvl0_at_maxtl,trp_lvl1_at_maxtl;
wire	trp_lvl2_at_maxtl,trp_lvl3_at_maxtl;
wire	internal_wdr;
wire [`TLU_THRD_NUM-1:0] internal_wdr_trap;
// added for hypervispor support
wire [`TLU_THRD_NUM-1:0] pil_cmp_en;
wire [`TLU_THRD_NUM-1:0] sftint_only_vld;
wire [`TLU_THRD_NUM-1:0] tlu_int_sftint_pend;
wire [`TLU_THRD_NUM-1:0] sftint_pend_wait;
wire [`TLU_THRD_NUM-1:0] sftint_wait_rst;
//
wire [3:0] true_pil0, true_pil1;
wire [3:0] true_pil2, true_pil3;
wire pil0_en,pil1_en,pil2_en,pil3_en;
wire set_sftint_d, clr_sftint_d, sftint_rg_rw_d;
// modified for timing and bug 5117 
wire [6:0] final_swint_id_w2;
// wire [6:0] final_swint_id;
// wire [6:0] final_swint0_id, final_swint1_id;
// wire [6:0] final_swint2_id, final_swint3_id;
// modified for bug 3705
// wire [6:0] tlz_swint_ttype;
// wire [6:0] hwint_swint_ttype;
wire [6:0] wrap_tlz_ttype;
wire [3:0] sftint0_id,sftint1_id,sftint2_id,sftint3_id;
wire [3:0] sftint_id_w2;
// wire [6:0] sftint_ttype; 
wire done_inst_g_tmp, retry_inst_g_tmp;
wire immu_va_oor_brnchetc_m;
wire pstate_am;// pstate_priv pstate_priv_g;
wire memref_e, memref_m;
wire [2:0] isfsr_ftype_sel;
wire [6:0] isfsr_ftype_m,isfsr_ftype_g;
wire	   isfsr_flt_vld_m,isfsr_flt_vld_g;
wire	   isfsr_trp_wr_m,isfsr_trp_wr_g;
wire	   itag_acc_sel_g;
// wire	   flsh_inst_m, flsh_inst_g;
// wire	   pstate_cle;
// wire [2:0] dsfsr_asi_sel_m, dsfsr_asi_sel_g;
// wire [1:0] dsfsr_asi_sel_m, // dsfsr_asi_sel_g;
wire dmmu_va_oor_m, dmmu_va_oor_g;
// wire ldst_xslate_g;
// wire [2:0]	dsfsr_ctxt_sel;
// wire dsfsr_wr_op_g;
// wire dsfsr_flt_vld_m;
//
// logic moved to lsu_expctl due to timing
/*
wire dsfsr_ftype_zero;
wire [1:0]	dsfsr_ctxt_g, 
wire [7:0]	dsfsr_asi_g;
// wire [6:0]	dsfsr_ftype_g, dsfsr_pe_ftype_g;
wire dsfsr_side_effect_g;
wire dsfsr_trp_wr_g;
*/
wire [1:0] isfsr_ctxt_g;
wire [`TLU_THRD_NUM-1:0] tick_en;
wire local_sync_trap_m, local_sync_trap_g;
wire dside_sync_trap_g, early_dside_trap_g;
wire true_hscpd_dacc_excpt_m;
wire true_qtail_dacc_excpt_m;
// wire lsu_higher_priority;
// wire dside_higher_priority;
wire [`TSA_TTYPE_WIDTH-1:0] local_sync_ttype_g;
wire local_higher_ttype_flg;
// wire [`TSA_TTYPE_WIDTH-1:0]	dside_sync_ttype_pre_g;
// wire [`TSA_TTYPE_WIDTH-1:0]	dside_sync_ttype_g;
wire [`TSA_TTYPE_WIDTH-1:0]	early_sync_ttype_g, early_sync_ttype_w2;
wire [`TSA_TTYPE_WIDTH-1:0]	adj_lsu_ttype_w2;
wire [`TSA_TTYPE_WIDTH-1:0]	lsu_tlu_ttype_w2;
// wire [`TSA_TTYPE_WIDTH-3:0]	lsu_tlu_async_ttype_w2;
// wire [`TSA_TTYPE_WIDTH-3:0]	rst_ttype_g; 
wire [`TSA_TTYPE_WIDTH-3:0]	rst_hwint_ttype_g, rst_hwint_ttype_w2; 
wire [`TSA_TTYPE_WIDTH-3:0]	rst_ttype_w2, rst_hwdr_ttype_w2;
wire [`TSA_TTYPE_WIDTH-1:0]	early_ttype_g;
wire trp_lvl0_at_maxtlless1,trp_lvl1_at_maxtlless1;
wire trp_lvl2_at_maxtlless1,trp_lvl3_at_maxtlless1;
wire trp_lvl_at_maxtlless1;
wire [`TLU_THRD_NUM-1:0] tpl_maxless1;
wire redmode_insertion, redmode_insertion_w2;
wire [`TLU_THRD_NUM-1:0] tlu_lsu_redmode_rst;
wire trap_to_redmode;
wire pending_thrd_event_taken;
// added or modified for timing
wire [`TLU_THRD_NUM-2:0]  thrd_rsel_g;
wire [`TLU_THRD_NUM-2:0]  thrd_rsel_w2;
wire va_oor_inst_acc_excp_g; // qualified va_oor_jl_ret trap 
wire va_oor_data_acc_excp_g, va_oor_data_acc_excp_w2; // qualified exu_tlu_va_oor_m trap 
wire sir_inst_g;
wire [`TLU_THRD_NUM-1:0]	pending_trap_sel;
//
// modified to support lsu_deferred traps; modified for timing
wire reset_sel_g, reset_sel_w2;
wire [2:0] reset_id_g;
wire tick_npt0,tick_npt1,tick_npt2,tick_npt3;
wire tick_ctl_din;
// modified due to early_flush_pipe timing fix
// wire tlu_tick_npt_priv_act;
wire	tick_npt_priv_act_g;
wire	tick_npt_priv_act_m;
wire	exu_tick_npt_priv_act_m;
//
// moved the tick_indis and stick_intdis logic to tlu_tdp
// wire tick_intdis0,tick_intdis1,tick_intdis2,tick_intdis3;
// wire stick_intdis0,stick_intdis1,stick_intdis2,stick_intdis3;
// wire [`TLU_THRD_NUM-1:0]	tick_intrpt;
// wire [`TLU_THRD_NUM-1:0]	tick_intclr;  // use to clear the tick_int bit
// wire wsr_tick_intclr_g;  // clear the tick_int through asr write
// wire wsr_tick_intset_g;  // set the tick_int through asr write 
// add and/or modified for hypervisor support
// wire [1:0] cwp_cmplt_tid_w2, cwp_cmplt_tid_g;
// wire	wsr_illeg_globals_g;  // mutual exclusiveness of the pstate globals 
// wire wsr_stick_intclr_g;  // clear the stick_int through asr write
// wire wsr_stick_intset_g;  // set the stick_int through asr write 
// wire [`TLU_THRD_NUM-1:0] stick_intrpt;
// wire [`TLU_THRD_NUM-1:0] stick_int_en, stick_int_din;
// wire [`TLU_THRD_NUM-1:0] tick_int_en, tick_int_din;
// 
// wire [1:0] cwp_cmplt_tid_g;
wire [1:0] true_trap_tid_g;
wire [1:0] early_trap_tid_g;
wire [1:0] true_trap_tid_w2;
wire trp_lvl_zero;
wire misalign_addr_jmpl_rtn_g,misalign_addr_ldst_atm_g;
wire tt_init_en;
wire [`TLU_THRD_NUM-1:0] tt_init_rst;
wire [`TLU_THRD_NUM-1:0] tt_unwritten;
wire ttype_written;
wire ttype_unwritten_sel;
wire reset_d1;
wire thread_tl_zero;
// wire iside_trap;
wire [7:0] isfsr_asi_g;
wire thread_tl_zero_m,thread_tl_zero_g;
wire tlu_trap_to_hyper_g, tlu_trap_to_hyper_w2;
// wire hyper_wdr_trap;
wire hyper_wdr_early_trap_g, hyper_wdr_early_trap_w2, hyper_wdr_trap_w2;
wire tlu_priv_traps_w2;
wire [2:0] tlu_early_priv_element_g;
wire [2:0] tlu_early_priv_element_w2; 
wire [`TLU_THRD_NUM-1:0] trp_lvl_gte_maxstl;
wire [`TLU_THRD_NUM-1:0] trp_lvl_at_maxstl;

// This section was modified to abide to the Niagara synthesis methodology
//
//reg	tpc_rw_e, tpc_rw_m, tpc_rw_g;
//reg	tnpc_rw_e, tnpc_rw_m, tnpc_rw_g;
//reg	tstate_rw_e, tstate_rw_m, tstate_rw_g, tstate_rw_w2;
//reg	ttype_rw_e, ttype_rw_m, ttype_rw_g, ttype_rw_w2;
//reg	tick_rw_e, tick_rw_m, tick_rw_g;
//reg	tick_npriv_r_e, tick_npriv_r_m, tick_npriv_r_g;
//reg	tickcmp_rw_e, tickcmp_rw_m, tickcmp_rw_g;
//reg	tba_rw_e, tba_rw_m, tba_rw_g;
//reg	pstate_rw_e, pstate_rw_m, pstate_rw_g;
//reg	pil_rw_e, pil_rw_m, pil_rw_g;
//reg	tl_rw_e, tl_rw_m, tl_rw_g;
//reg	wsr_inst_e, wsr_inst_m, wsr_inst_g_unflushed; 
//reg	set_sftint_e, clr_sftint_e, sftint_rg_rw_e;
//reg	set_sftint_m, clr_sftint_m, sftint_rg_rw_m;
//reg	set_sftint_g, clr_sftint_g, sftint_rg_rw_g;
//
wire	tpc_rw_e, tpc_rw_m, tpc_rw_g, tpc_rw_w2;
wire	tnpc_rw_e, tnpc_rw_m, tnpc_rw_g, tnpc_rw_w2;
wire	tstate_rw_e, tstate_rw_m, tstate_rw_g, tstate_rw_w2;
wire	ttype_rw_e, ttype_rw_m, ttype_rw_g, ttype_rw_w2;
wire	htstate_rw_w2;  
wire	tick_rw_e, tick_rw_m, tick_rw_g;
wire	tick_npriv_r_e, tick_npriv_r_m, tick_npriv_r_g;
wire	tickcmp_rw_e, tickcmp_rw_m, tickcmp_rw_g;
wire	tba_rw_e, tba_rw_m, tba_rw_g;
wire	pstate_rw_e, pstate_rw_m, pstate_rw_g, pstate_rw_w2;
wire	pil_rw_e, pil_rw_m, pil_rw_g;
wire	tl_rw_e, tl_rw_m, tl_rw_g, tl_rw_w2;
wire	htickcmp_rw_m, htickcmp_rw_g;
wire	wsr_inst_e, wsr_inst_m, wsr_inst_g_unflushed; 
wire	set_sftint_e, clr_sftint_e, sftint_rg_rw_e;
wire	set_sftint_m, clr_sftint_m, sftint_rg_rw_m;
wire	set_sftint_g, clr_sftint_g, sftint_rg_rw_g;
//
wire wsr_inst_g, wsr_inst_w2; 
wire inst_ifu_flush_w;
wire inst_ifu_flush2_w;
wire clk;

//=========================================================================================
//=========================================================================================
//=========================================================================================

wire [3:0] tlu_pstate_priv_buf;

assign tlu_pstate_priv_buf[3:0] = tlu_pstate_priv[3:0];

//=========================================================================================
//=========================================================================================
//=========================================================================================
//	reset
//=========================================================================================

dffrl_async dffrl_local_rst_l(
    .din  (grst_l),
    .clk  (clk),
    .rst_l(arst_l),
    .q    (local_rst_l),
    .se   (se),
    .si   (),
    .so   ()
); 

assign tlu_rst = ~tlu_rst_l;
assign local_rst = ~tlu_rst_l;
assign tlu_rst_l = local_rst_l;

//=========================================================================================
//	Rename
//=========================================================================================

// assign	tlu_lsu_redmode[3:0] = tlu_int_redmode[3:0];
assign clk = rclk;

//=========================================================================================
//	Misc. TDP Control
//=========================================================================================
//
// modified for bug 5436: Niagara 2.0
/*
assign pcr_ut_e = 
           (tlu_thrd_rsel_e[0]) ? tlu_pcr_ut[0]: 
           (tlu_thrd_rsel_e[1]) ? tlu_pcr_ut[1]: 
           (tlu_thrd_rsel_e[2]) ? tlu_pcr_ut[2]:
            tlu_pcr_ut[3]; 

assign pcr_st_e = 
           (tlu_thrd_rsel_e[0]) ? tlu_pcr_st[0]:
           (tlu_thrd_rsel_e[1]) ? tlu_pcr_st[1]:
           (tlu_thrd_rsel_e[2]) ? tlu_pcr_st[2]:
            tlu_pcr_st[3];
*/

assign	tlu_thread_inst_vld_g[0] = 
            inst_vld_g & thread0_rsel_g & ~pend_pich_cnt_hld[0];
assign	tlu_thread_inst_vld_g[1] = 
            inst_vld_g & thread1_rsel_g & ~pend_pich_cnt_hld[1];
assign	tlu_thread_inst_vld_g[2] = 
            inst_vld_g & thread2_rsel_g & ~pend_pich_cnt_hld[2];
assign	tlu_thread_inst_vld_g[3] = 
            inst_vld_g & thread3_rsel_g & ~pend_pich_cnt_hld[3];

assign	thread_inst_vld_w2[0] = inst_vld_w2 & thread0_wsel_w2;
assign	thread_inst_vld_w2[1] = inst_vld_w2 & thread1_wsel_w2;
assign	thread_inst_vld_w2[2] = inst_vld_w2 & thread2_wsel_w2;
assign	thread_inst_vld_w2[3] = inst_vld_w2 & thread3_wsel_w2;

assign	thread_inst_vld_g[0] = inst_vld_g & thread0_rsel_g;
assign	thread_inst_vld_g[1] = inst_vld_g & thread1_rsel_g;
assign	thread_inst_vld_g[2] = inst_vld_g & thread2_rsel_g;
assign	thread_inst_vld_g[3] = inst_vld_g & thread3_rsel_g;

// added for timing
//
assign	tlu_trp_lvl[2:0] =
		thread0_rsel_e ? trp_lvl0[2:0] :
			thread1_rsel_e ? trp_lvl1[2:0] :
				thread2_rsel_e ? trp_lvl2[2:0] :
					thread3_rsel_e ? trp_lvl3[2:0] : 3'bxxx;

assign	tlu_pil[3:0] =
		thread0_rsel_e ? true_pil0[3:0] :
			thread1_rsel_e ? true_pil1[3:0] :
				thread2_rsel_e ? true_pil2[3:0] :
					thread3_rsel_e ? true_pil3[3:0] : 4'bxxx;

assign tlu_tba_en_l[0] = ~(tba_rw_g & wsr_inst_g & thread0_wsel_g);
assign tlu_tba_en_l[1] = ~(tba_rw_g & wsr_inst_g & thread1_wsel_g);
assign tlu_tba_en_l[2] = ~(tba_rw_g & wsr_inst_g & thread2_wsel_g);
assign tlu_tba_en_l[3] = ~(tba_rw_g & wsr_inst_g & thread3_wsel_g);


assign	tlu_tick_en_l	=	~(tick_rw_g & wsr_inst_g);
// the logic equations can be made common (grape)
// reset may not have to be factored in !!!
assign	tick_en[0] = (tick_rw_g & wsr_inst_g & thread0_wsel_g) | local_rst | por_rstint0_g;
assign	tick_en[1] = (tick_rw_g & wsr_inst_g & thread1_wsel_g) | local_rst | por_rstint1_g;
assign	tick_en[2] = (tick_rw_g & wsr_inst_g & thread2_wsel_g) | local_rst | por_rstint2_g;
assign	tick_en[3] = (tick_rw_g & wsr_inst_g & thread3_wsel_g) | local_rst | por_rstint3_g;

// modified for bug 4763
assign	tlu_tickcmp_en_l[0] =	~((tickcmp_rw_g & wsr_inst_g & thread0_wsel_g)); 
assign	tlu_tickcmp_en_l[1] =	~((tickcmp_rw_g & wsr_inst_g & thread1_wsel_g));
assign	tlu_tickcmp_en_l[2] =	~((tickcmp_rw_g & wsr_inst_g & thread2_wsel_g));
assign	tlu_tickcmp_en_l[3] =	~((tickcmp_rw_g & wsr_inst_g & thread3_wsel_g));
//
// modified for bug 4763
assign	tlu_stickcmp_en_l[0] =	~((stickcmp_rw_g & wsr_inst_g & thread0_wsel_g));
assign	tlu_stickcmp_en_l[1] =	~((stickcmp_rw_g & wsr_inst_g & thread1_wsel_g));
assign	tlu_stickcmp_en_l[2] =	~((stickcmp_rw_g & wsr_inst_g & thread2_wsel_g));
assign	tlu_stickcmp_en_l[3] =	~((stickcmp_rw_g & wsr_inst_g & thread3_wsel_g));
//
// modified for bug 4763
assign	tlu_htickcmp_en_l[0] =	~((htickcmp_rw_g & wsr_inst_g & thread0_wsel_g));
assign	tlu_htickcmp_en_l[1] =	~((htickcmp_rw_g & wsr_inst_g & thread1_wsel_g));
assign	tlu_htickcmp_en_l[2] =	~((htickcmp_rw_g & wsr_inst_g & thread2_wsel_g));
assign	tlu_htickcmp_en_l[3] =	~((htickcmp_rw_g & wsr_inst_g & thread3_wsel_g));

// modified for bug 1266 and 1264
dff_s dff_stgg_va_oor_jl_ret_g (
    .din (exu_tlu_va_oor_jl_ret_m), 
	.q   (va_oor_jl_ret_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// This may have to be changed as all lsu traps may not use mmu globals 
// ffu traps may have to be factored in once round-robin selection in place.
// factor in ldst related mem-address exceptions. 
//
// modified for bug 1264 and 1266
// prioritize the exu_tlu_va_oor_jl_ret_m trap; if no higher traps are happening initiate the trap
//
assign va_oor_inst_acc_excp_g = 
      va_oor_jl_ret_g & inst_vld_g & 
     ~(exu_ttype_vld_g | ifu_ttype_vld_g | lsu_tlu_priv_action_g | local_sync_trap_g);
//
// added for bug 1316 
// prioritize the exu_tlu_va_oor_jl_ret_m trap; if no higher traps are happening initiate the trap
// modified for bug 3464 and bug 4873 
assign va_oor_data_acc_excp_g = 
       (dmmu_va_oor_g & inst_vld_g) & ~(exu_ttype_vld_g | ifu_ttype_vld_g | 
        lsu_tlu_priv_action_g | misalign_addr_ldst_atm_g | lsu_tlu_wtchpt_trp_g); 
//
// added for timing 
dffr_s dffr_va_oor_data_acc_excp_w2 (
    .din (va_oor_data_acc_excp_g),
    .q   (va_oor_data_acc_excp_w2),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// exu should qualify with priv bit. Assume ttype vld is asserted.
dff_s #(1) dff_stgg_sir_g (
    .din (ifu_tlu_sir_inst_m), 
	.q   (sir_inst_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	pstate_rmode[3:0] = tlu_int_redmode[3:0];

wire	intrpt_taken;
// recoded for bug 2644
// assign	intrpt_taken = rstint_taken | hwint_taken | swint_taken;  
assign	intrpt_taken = 
            rstint_taken | hwint_taken | sirint_taken;  
//
// modified for bug 4906
assign trp_lvl_at_maxtlless1 = 
           tpl_maxless1[0] | tpl_maxless1[1] | tpl_maxless1[2] | tpl_maxless1[3];
assign tpl_maxless1[0] =
           (trp_lvl0_at_maxtlless1 | pstate_rmode[0]) & thrd0_traps;
assign tpl_maxless1[1] =
           (trp_lvl1_at_maxtlless1 | pstate_rmode[1]) & thrd1_traps;
assign tpl_maxless1[2] =
           (trp_lvl2_at_maxtlless1 | pstate_rmode[2]) & thrd2_traps;
assign tpl_maxless1[3] =
           (trp_lvl3_at_maxtlless1 | pstate_rmode[3]) & thrd3_traps;

// thread enters redstate
// modified for bug 3919
// assign	trap_to_redmode = trp_lvl_at_maxtlless1 & ~intrpt_taken; 
assign	trap_to_redmode = trp_lvl_at_maxtlless1 & ~(rstint_taken | sirint_taken); 

assign	tlu_lsu_redmode_rst[0]	= 
	        ((rstint_taken |  sirint_taken) & thread0_rsel_g) | 
              tpl_maxless1[0] | internal_wdr_trap[0] | local_rst ;
assign	tlu_lsu_redmode_rst[1]	= 
	        ((rstint_taken |  sirint_taken) & thread1_rsel_g) | 
              tpl_maxless1[1] | internal_wdr_trap[1] | local_rst ;
assign	tlu_lsu_redmode_rst[2]	= 
	        ((rstint_taken |  sirint_taken) & thread2_rsel_g) | 
              tpl_maxless1[2] | internal_wdr_trap[2] | local_rst ;
assign	tlu_lsu_redmode_rst[3]	= 
	        ((rstint_taken |  sirint_taken) & thread3_rsel_g) | 
              tpl_maxless1[3] | internal_wdr_trap[3] | local_rst ;

dff_s #(`TLU_THRD_NUM) dff_tlu_lsu_redmode_rst_d1 (
    .din (tlu_lsu_redmode_rst[`TLU_THRD_NUM-1:0]),
	.q   (tlu_lsu_redmode_rst_d1[`TLU_THRD_NUM-1:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign	redmode_insertion =
	local_rst | rstint_taken | trap_to_redmode | internal_wdr | sirint_taken;
//	sir_inst_g;					// sigm inst in priv mode
//
// added for timing
dff_s dff_redmode_insertion_w2 (
    .din (redmode_insertion),
	.q   (redmode_insertion_w2),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign	tlu_select_redmode =  redmode_insertion_w2;

// added for bug 2808
assign ibrkpt_trap_m = 
           (ifu_tlu_ttype_m[8:0]== 9'h076) & ifu_tlu_ttype_vld_m;  

dffr_s dffr_ibrkpt_trap_g (
   .din (ibrkpt_trap_m),
   .q   (ibrkpt_trap_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

dffr_s dffr_ibrkpt_trap_w2 (
   .din (ibrkpt_trap_g),
   .q   (ibrkpt_trap_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

// assign tlu_ibrkpt_trap_g = ibrkpt_trap_g;
assign tlu_ibrkpt_trap_w2 = ibrkpt_trap_w2;

// modified for bug 1575
// assign	tlu_pstate_din_sel[2]	= ~(tlu_pstate_din_sel[0] | tlu_pstate_din_sel[1]);

// the selection pstate by thread
// modified for the hypervisory support

assign	tlu_pstate_din_sel0[0]	= dnrtry_inst_w2[0] & ~rst_tri_en; 
assign	tlu_pstate_din_sel0[1]	= (pstate_rw_w2 & wsr_inst_w2) & ~rst_tri_en & 
                                 ~tlu_pstate_din_sel0[0] & thread0_wsel_w2;

assign	tlu_pstate_din_sel1[0]	= dnrtry_inst_w2[1] & ~rst_tri_en;
assign	tlu_pstate_din_sel1[1]	= (pstate_rw_w2 & wsr_inst_w2) & ~rst_tri_en & 
                                 ~tlu_pstate_din_sel1[0] & thread1_wsel_w2;

assign	tlu_pstate_din_sel2[0]	= dnrtry_inst_w2[2] & ~rst_tri_en; 
assign	tlu_pstate_din_sel2[1]	= (pstate_rw_w2 & wsr_inst_w2) & ~rst_tri_en & 
                                 ~tlu_pstate_din_sel2[0] & thread2_wsel_w2;

assign	tlu_pstate_din_sel3[0]	= dnrtry_inst_w2[3] & ~rst_tri_en;
assign	tlu_pstate_din_sel3[1]	= (pstate_rw_w2 & wsr_inst_w2) & ~rst_tri_en & 
                                 ~tlu_pstate_din_sel3[0] & thread3_wsel_w2;

assign	restore_pc_sel_g = (dnrtry_inst_g & cwp_fastcmplt_g) | cwp_cmplt_g; 
//
dffr_s dffr_restore_pc_sel_w1 (
   .din (restore_pc_sel_g),
   .q   (restore_pc_sel_w1),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign	tlu_restore_pc_sel_w1 = restore_pc_sel_w1; 
//
// modified for the hypervisor support and timing

assign	update_pstate_w2[0] = 
		thrd0_traps_w2 | dnrtry_inst_w2[0] | 
		((pstate_rw_w2 & wsr_inst_w2) & thread0_wsel_w2);
assign	update_pstate_w2[1] = 
		thrd1_traps_w2 | dnrtry_inst_w2[1] | 
		((pstate_rw_w2 & wsr_inst_w2) & thread1_wsel_w2);
assign	update_pstate_w2[2] = 
		thrd2_traps_w2 | dnrtry_inst_w2[2] | 
		((pstate_rw_w2 & wsr_inst_w2) & thread2_wsel_w2);
assign	update_pstate_w2[3] = 
		thrd3_traps_w2 | dnrtry_inst_w2[3] | 
		((pstate_rw_w2 & wsr_inst_w2) & thread3_wsel_w2);

// recoded for timing
// modified for bug 4284
assign	tlu_update_pc_l_w[0] = 	~(inst_vld_g & thread0_rsel_g);
assign	tlu_update_pc_l_w[1] = 	~(inst_vld_g & thread1_rsel_g);
assign	tlu_update_pc_l_w[2] = 	~(inst_vld_g & thread2_rsel_g);
assign	tlu_update_pc_l_w[3] = 	~(inst_vld_g & thread3_rsel_g);
//
// modified for timing 
assign tlu_thrd_wsel_w2[`TLU_THRD_NUM-1:0] = 
           {thread3_wtrp_w2, thread2_wtrp_w2, thread1_wtrp_w2, thread0_wtrp_w2};

//wire	pending_thrd_event_taken_w2;
assign	pending_thrd_event_taken = 
	pending_thrd0_event_taken | pending_thrd1_event_taken |
	pending_thrd2_event_taken | pending_thrd3_event_taken;
//
// modified due to timing
assign	tlu_tl_gt_0_w2 =
		thrd_rsel_w2[0] ? tl0_gt_0 :
			(thrd_rsel_w2[1] ? tl1_gt_0 :
				(thrd_rsel_w2[2] ? tl2_gt_0 : tl3_gt_0)); 

assign	thrd_rsel_g[0] = 	(thread0_rsel_g & ~pending_thrd_event_taken) | pending_thrd0_event_taken;
assign	thrd_rsel_g[1] = 	(thread1_rsel_g & ~pending_thrd_event_taken) | pending_thrd1_event_taken;
assign	thrd_rsel_g[2] = 	(thread2_rsel_g & ~pending_thrd_event_taken) | pending_thrd2_event_taken;

dff_s #(`TLU_THRD_NUM-1) dff_thrd_rsel_w2 (
    .din (thrd_rsel_g[`TLU_THRD_NUM-2:0]),
    .q   (thrd_rsel_w2[`TLU_THRD_NUM-2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// modified for the tsa_wdata bug (tlu_tdp)
//
// assign tlu_wr_tsa_inst_g = tsa_wr_tid_sel_g;
//
// added for timing
assign tlu_wr_tsa_inst_w2 = 
           (wsr_inst_w2 & (tstate_rw_w2 | tpc_rw_w2 | tnpc_rw_w2  | 
            ttype_rw_w2 | htstate_rw_w2)) & ~sync_trap_taken_w2; 

// assign tlu_wsr_inst_g = wsr_inst_g;
// 
// modified for timing
/*
assign tlu_update_pstate_l_g[0] = ~(update_pstate_g[0] | local_rst);
assign tlu_update_pstate_l_g[1] = ~(update_pstate_g[1] | local_rst);
assign tlu_update_pstate_l_g[2] = ~(update_pstate_g[2] | local_rst);
assign tlu_update_pstate_l_g[3] = ~(update_pstate_g[3] | local_rst);
*/
assign tlu_update_pstate_l_w2[0] = ~(update_pstate_w2[0] | local_rst);
assign tlu_update_pstate_l_w2[1] = ~(update_pstate_w2[1] | local_rst);
assign tlu_update_pstate_l_w2[2] = ~(update_pstate_w2[2] | local_rst);
assign tlu_update_pstate_l_w2[3] = ~(update_pstate_w2[3] | local_rst);

//=========================================================================================
// rdpr mux selects - recoded due to timing
//=========================================================================================
// modified for bug 1352 - added the non-privedged term in the read select
//
// modified for bug 1859
// assign	tlu_rdpr_mx1_sel[0] = tpc_rw_e; 
// assign	tlu_rdpr_mx1_sel[1] = tnpc_rw_e;
// assign	tlu_rdpr_mx1_sel[2] = tick_rw_e | tick_npriv_r_e;
// assign	tlu_rdpr_mx1_sel[3] = tickcmp_rw_e;
// assign	tlu_rdpr_mx2_sel[0] = tstate_rw_e; 
// assign	tlu_rdpr_mx2_sel[1] = tba_rw_e;
// assign	tlu_rdpr_mx2_sel[2] = sftint_rg_rw_e;
// assign	tlu_rdpr_mx3_sel[0] = ttype_rw_e; 
// assign	tlu_rdpr_mx3_sel[2] = tl_rw_e;
// assign	tlu_rdpr_mx3_sel[3] = pil_rw_e;
// assign	tlu_rdpr_mx4_sel[0] = (|tlu_rdpr_mx2_sel[`RDPR_MX2_SEL_WIDTH-1:0]) | tlu_htba_mx2_sel; 
// assign	tlu_rdpr_mx4_sel[1] = (ttype_rw_e & ttype_written) | pstate_rw_e | tl_rw_e | pil_rw_e;
// assign	tlu_rdpr_mx4_sel[2] =  tlu_rdpr_mx5_active;  
// assign	tlu_rdpr_mx6_sel[0] = (|tlu_rdpr_mx1_sel[3:0]); 
// assign	tlu_rdpr_mx6_sel[1] =  stickcmp_rw_e;  
// assign	tlu_rdpr_mx6_sel[2] =  tlu_htickcmp_rw_e; 
// assign	tlu_rdpr_mx7_sel[0] = |(tlu_rdpr_mx4_sel[2:0]);
// assign	tlu_rdpr_mx7_sel[1] = |(tlu_rdpr_mx6_sel[2:0]); 
// assign	tlu_rdpr_mx7_sel[2] = ttype_unwritten_sel;

assign	local_rdpr_mx1_sel[0] = tick_rw_e | tick_npriv_r_e;
assign	local_rdpr_mx1_sel[1] = tickcmp_rw_e;
assign	local_rdpr_mx1_sel[2] = stickcmp_rw_e;  
assign	local_rdpr_mx1_sel[3] = tlu_htickcmp_rw_e; 
//
assign	tlu_rdpr_mx1_sel[0] = local_rdpr_mx1_sel[1] & ~rst_tri_en; 
assign	tlu_rdpr_mx1_sel[1] = local_rdpr_mx1_sel[2] & ~rst_tri_en;
assign	tlu_rdpr_mx1_sel[2] = local_rdpr_mx1_sel[3] & ~rst_tri_en; 
//
assign	local_rdpr_mx2_sel[0] = tlu_hyperv_rdpr_sel[0];
assign	local_rdpr_mx2_sel[1] = tlu_hyperv_rdpr_sel[1];
assign	local_rdpr_mx2_sel[2] = tl_rw_e;
assign	local_rdpr_mx2_sel[3] = pil_rw_e;
//
assign	tlu_rdpr_mx2_sel[0] = local_rdpr_mx2_sel[1] & ~rst_tri_en;
assign	tlu_rdpr_mx2_sel[1] = local_rdpr_mx2_sel[2] & ~rst_tri_en;
assign	tlu_rdpr_mx2_sel[2] = local_rdpr_mx2_sel[3] & ~rst_tri_en; 
//
assign	local_rdpr_mx3_sel[0] = sftint_rg_rw_e;
assign	local_rdpr_mx3_sel[1] = pstate_rw_e;
assign	local_rdpr_mx3_sel[2] = tlu_hyperv_rdpr_sel[2];
//
assign	tlu_rdpr_mx3_sel[0] = local_rdpr_mx3_sel[1] & ~rst_tri_en; 
assign	tlu_rdpr_mx3_sel[1] = local_rdpr_mx3_sel[2] & ~rst_tri_en; 
//
assign	local_rdpr_mx4_sel[0] = tpc_rw_e; 
assign	local_rdpr_mx4_sel[1] = tnpc_rw_e;
assign	local_rdpr_mx4_sel[2] = tstate_rw_e; 
//
assign	tlu_rdpr_mx4_sel[0] = local_rdpr_mx4_sel[1] & ~rst_tri_en;
assign	tlu_rdpr_mx4_sel[1] = local_rdpr_mx4_sel[2] & ~rst_tri_en;
//
// modified for rte failures
assign  local_rdpr_mx5_sel[0] = tba_rw_e;
assign	local_rdpr_mx5_sel[1] = tlu_hyperv_rdpr_sel[4] & ~rst_tri_en;
assign	local_rdpr_mx5_sel[2] = (|local_rdpr_mx1_sel[3:0]) & ~rst_tri_en;
assign	local_rdpr_mx5_sel[3] = (pcr_rsr_e | pic_rsr_e) & ~rst_tri_en;
//
assign  tlu_rdpr_mx5_sel[0] = local_rdpr_mx5_sel[1];
assign	tlu_rdpr_mx5_sel[1] = local_rdpr_mx5_sel[2];
assign	tlu_rdpr_mx5_sel[2] = local_rdpr_mx5_sel[3]; 
//
assign	tlu_rdpr_mx6_sel[0] = local_rdpr_mx6_sel[1]; 
assign	tlu_rdpr_mx6_sel[1] = local_rdpr_mx6_sel[2];
assign	tlu_rdpr_mx6_sel[2] = local_rdpr_mx6_sel[3];
// 
assign	local_rdpr_mx6_sel[0] = ttype_rw_e; 
assign	local_rdpr_mx6_sel[1] = tlu_hyperv_rdpr_sel[3] & ~rst_tri_en;
assign	local_rdpr_mx6_sel[2] = (|local_rdpr_mx2_sel[3:0]) & ~rst_tri_en;
assign	local_rdpr_mx6_sel[3] = (|local_rdpr_mx3_sel[2:0]) & ~rst_tri_en;
//
assign	tlu_rdpr_mx7_sel[0] = (|local_rdpr_mx4_sel[2:0]) & ~rst_tri_en; 
assign	tlu_rdpr_mx7_sel[1] = (|local_rdpr_mx5_sel[3:0]) & ~rst_tri_en; 
assign	tlu_rdpr_mx7_sel[2] = (|local_rdpr_mx6_sel[3:0]) & ~rst_tri_en; 
assign	tlu_rdpr_mx7_sel[3] = ~(|tlu_rdpr_mx7_sel[2:0]); 

//=========================================================================================

assign	ttype_written = (thread0_rsel_e & ~tt_unwritten[0]) |
			(thread1_rsel_e & ~tt_unwritten[1]) |
			(thread2_rsel_e & ~tt_unwritten[2]) |
			(thread3_rsel_e & ~tt_unwritten[3]);

assign	ttype_unwritten_sel = ttype_rw_e & ~ttype_written;

//
// constructing the mux select for rdpr 7 in tdp
//

//=========================================================================================

dff_s #(2) dff_stgdntry_m (
    .din ({done_inst_e,retry_inst_e}), 
	.q   ({done_inst_m_tmp,retry_inst_m_tmp}),
    .clk (clk),
    .se  (se),       
    .si  (),
    .so  ()
);

wire	trap_on_dnrtry_m; 
// priv opcode, illegal inst trap on done/retry.
assign	trap_on_dnrtry_m =  ifu_ttype_vld_m ;

// qualification done with previous instruction's flush pipe 
// the inst_vld may have to be sent earlier to avoid the critical path.
// modified for bug 4074 and 4561
assign	done_inst_m  = 
            done_inst_m_tmp  & ~(((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
            tlu_ifu_flush_pipe_w) | trap_on_dnrtry_m);
/*
            done_inst_m_tmp  & ~(((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
            tlu_ifu_flush_pipe_w) | ((thrid_w2[1:0] == tlu_exu_tid_m[1:0]) &
            lsu_defr_trap_g) | trap_on_dnrtry_m);
*/
assign	retry_inst_m = 
            retry_inst_m_tmp & ~(((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
            tlu_ifu_flush_pipe_w) | trap_on_dnrtry_m);
/*
            retry_inst_m_tmp & ~(((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
            tlu_ifu_flush_pipe_w) | ((thrid_w2[1:0] == tlu_exu_tid_m[1:0]) &
            lsu_defr_trap_g) | trap_on_dnrtry_m);
*/
/*
// logic moved to tlu_misctl
// modified/added for timing violations
// moved the logic from exu to tlu due to timing violations

mux4ds #(3) mux_trap_old_cwp_m(
    .in0(exu_tlu_cwp0[2:0]),
    .in1(exu_tlu_cwp1[2:0]), 
    .in2(exu_tlu_cwp2[2:0]),
    .in3(exu_tlu_cwp3[2:0]),
    .sel0(thread0_rsel_m),
    .sel1(thread1_rsel_m),
    .sel2(thread2_rsel_m),
    .sel3(thread3_rsel_m),
    .dout(trap_old_cwp_m[2:0])
);

assign cwp_xor_m[2:0] = trap_old_cwp_m[2:0] ^ tlu_exu_cwp_m[2:0];

assign cwp_no_change_m = ~|(cwp_xor_m[2:0]); 
*/
assign cwp_fastcmplt_m = 
           tlu_exu_cwpccr_update_m & tlu_cwp_no_change_m;

dffr_s dffr_cwp_fastcmplt_uq_g (
    .din (cwp_fastcmplt_m),
	.q   (cwp_fastcmplt_uq_g),
    .clk (clk),
    .rst (local_rst),
    .se  (se),
    .si  (),
    .so  ()
);

// assign	tlu_exu_cwpccr_update_m = done_inst_m | retry_inst_m;
assign	tlu_exu_cwpccr_update_m = exu_done_inst_m | exu_retry_inst_m;

assign exu_done_inst_m  = 
           done_inst_m_tmp; // & ~(ifu_tlu_ttype_vld_m & ifu_tlu_inst_vld_m); 
assign exu_retry_inst_m = 
           retry_inst_m_tmp;// & ~(ifu_tlu_ttype_vld_m & ifu_tlu_inst_vld_m);

//
// modified due timing problems 
// assign	tlu_exu_cwp_retry_m = retry_inst_m; 
assign	tlu_exu_cwp_retry_m = exu_retry_inst_m; 

// qualify with flush ?
// modified for timing and bug4658 
// modified for timing and added the omitted tlz trap qualification

assign	true_pc_sel_m[0] =  
            retry_inst_m_tmp & ~ifu_tlu_trap_m & ifu_tlu_inst_vld_m &
            ~(pib_wrap_trap_m | (|tlz_trap_m[`TLU_THRD_NUM-1:0])); 
assign	true_pc_sel_m[1]  = 
            done_inst_m_tmp  & ~ifu_tlu_trap_m & ifu_tlu_inst_vld_m &
            ~(pib_wrap_trap_m | (|tlz_trap_m[`TLU_THRD_NUM-1:0])) ; 

assign	true_pc_sel_m[2]  = ~(|true_pc_sel_m[1:0]);

dffr_s #(3) dff_true_pc_sel_w (
    .din (true_pc_sel_m[2:0]), 	
    .q   (true_pc_sel_w[2:0]),
    .clk (clk),
    .rst (local_rst),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s #(49) dff_ifu_npc_w (
    .din (ifu_tlu_npc_m[48:0]), 	
    .q   (ifu_npc_w[48:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_true_pc_sel_w[2:0] = true_pc_sel_w[2:0];

dff_s #(2) dff_stgdntry_g (
    .din ({done_inst_m,retry_inst_m}),
	.q   ({done_inst_g_tmp,retry_inst_g_tmp}),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	done_inst_g = done_inst_g_tmp & inst_vld_g;
assign	retry_inst_g = retry_inst_g_tmp & inst_vld_g;

//assign	tlu_retry_inst_g = retry_inst_g;
//assign	tlu_done_inst_g  = done_inst_g;
// 
// threaded dnrtry_inst_g signal
// modified for timing 
//
assign	dnrtry0_inst_g = (done_inst_g | retry_inst_g) & 
                        ~(inst_ifu_flush2_w | local_early_flush_pipe_w) & 
                          thread0_rsel_g;

assign	dnrtry1_inst_g = (done_inst_g | retry_inst_g) & 
                        ~(inst_ifu_flush2_w | local_early_flush_pipe_w) & 
                          thread1_rsel_g;

assign	dnrtry2_inst_g = (done_inst_g | retry_inst_g) & 
                        ~(inst_ifu_flush2_w | local_early_flush_pipe_w) & 
                          thread2_rsel_g;

assign	dnrtry3_inst_g = (done_inst_g | retry_inst_g) & 
                        ~(inst_ifu_flush2_w | local_early_flush_pipe_w) & 
                          thread3_rsel_g;
//
// added for timing
dffr_s #(`TLU_THRD_NUM) dffr_dnrtry_inst_w2 (
    .din ({dnrtry3_inst_g,dnrtry2_inst_g,dnrtry1_inst_g,dnrtry0_inst_g}),
    .q   (dnrtry_inst_w2[`TLU_THRD_NUM-1:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign  tlu_dnrtry0_inst_g = dnrtry0_inst_g;
assign  tlu_dnrtry1_inst_g = dnrtry1_inst_g;
assign  tlu_dnrtry2_inst_g = dnrtry2_inst_g;
assign  tlu_dnrtry3_inst_g = dnrtry3_inst_g;

// flush needed for done/retry with tl=0
// modified for timing
// assign	dnrtry_inst_g = (done_inst_g | retry_inst_g) & ~tlu_flush_pipe_w;
// 
assign	dnrtry_inst_g = (done_inst_g | retry_inst_g) & 
                       ~(inst_ifu_flush_w | local_early_flush_pipe_w);
dff_s #(2) dff_stgdntry_e (
    .din ({ifu_tlu_done_inst_d,ifu_tlu_retry_inst_d}), 
	.q   ({done_inst_e,retry_inst_e}),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	thrid_d[1:0] = ifu_tlu_thrid_d[1:0];

assign	thread0_rsel_d = ~thrid_d[1] & ~thrid_d[0];
assign	thread1_rsel_d = ~thrid_d[1] &  thrid_d[0];
assign	thread2_rsel_d =  thrid_d[1] & ~thrid_d[0];
assign	thread3_rsel_d =  thrid_d[1] &  thrid_d[0];

//
// modified due to rte failure 
dff_s #(2) dff_thrid_e (
    .din (thrid_d[1:0]),
	.q   (thrid_e[1:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s #(2) dff_thrid_m (
    .din (thrid_e[1:0]),
    .q   (thrid_m[1:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s #(2) dff_thrid_g (
    .din (thrid_m[1:0]),
    .q   (thrid_g[1:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	thread0_rsel_e = ~(|thrid_e[1:0]); 
assign	thread1_rsel_e = ~thrid_e[1] &  thrid_e[0]; 
assign	thread2_rsel_e =  thrid_e[1] & ~thrid_e[0]; 
assign	thread3_rsel_e =  (&thrid_e[1:0]);

assign	tlu_thrd_rsel_e[0] = thread0_rsel_e; 
assign	tlu_thrd_rsel_e[1] = thread1_rsel_e;
assign	tlu_thrd_rsel_e[2] = thread2_rsel_e;
assign	tlu_thrd_rsel_e[3] = thread3_rsel_e;
//
// added for timing
dff_s #(`TLU_THRD_NUM) dff_thread_stg_m (
    .din ({thread3_rsel_e, thread2_rsel_e, thread1_rsel_e, thread0_rsel_e}),
    .q   ({thread3_stg_m, thread2_stg_m, thread1_stg_m, thread0_stg_m}),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign thread0_stg_m_buf = thread0_stg_m;
assign thread1_stg_m_buf = thread1_stg_m;
assign thread2_stg_m_buf = thread2_stg_m;
assign thread3_stg_m_buf = thread3_stg_m;

assign	thread0_rsel_m = ~(|thrid_m[1:0]); 
assign	thread1_rsel_m = ~thrid_m[1] &  thrid_m[0]; 
assign	thread2_rsel_m =  thrid_m[1] & ~thrid_m[0]; 
assign	thread3_rsel_m =  (&thrid_m[1:0]);

assign	thread0_rsel_dec_g = ~(|thrid_g[1:0]); 
assign	thread1_rsel_dec_g = ~thrid_g[1] &  thrid_g[0]; 
assign	thread2_rsel_dec_g =  thrid_g[1] & ~thrid_g[0]; 
assign	thread3_rsel_dec_g =  (&thrid_g[1:0]);

dff_s #(`TLU_THRD_NUM) dff_thread_rsel_g (
    .din ({thread3_rsel_m, thread2_rsel_m, thread1_rsel_m, thread0_rsel_m}),
    .q   ({thread3_rsel_g, thread2_rsel_g, thread1_rsel_g, thread0_rsel_g}),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s #(`TLU_THRD_NUM) dff_thread_wsel_g (
    .din ({thread3_rsel_m, thread2_rsel_m, thread1_rsel_m, thread0_rsel_m}),
    .q   ({thread3_wsel_g, thread2_wsel_g, thread1_wsel_g, thread0_wsel_g}),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// timing -fix: load redistribution
/*
assign	thread0_rsel_g = thread0_rsel_dec_g; 
assign	thread1_rsel_g = thread1_rsel_dec_g; 
assign	thread2_rsel_g = thread2_rsel_dec_g; 
assign	thread3_rsel_g = thread3_rsel_dec_g; 
*/
// 

dff_s #(2) dff_stgdntry_w2 (
    .din ({done_inst_g,retry_inst_g}),
	.q   ({done_inst_w2,retry_inst_w2}),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// modified for bug 4561
assign inst_vld_m = 
           ifu_tlu_inst_vld_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
           (tlu_flush_pipe_w | inst_ifu_flush_w)); 
/*
assign inst_vld_m = 
           ifu_tlu_inst_vld_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
           (tlu_flush_pipe_w | inst_ifu_flush_w)) & ~((thrid_w2[1:0] == tlu_exu_tid_m[1:0]) & 
            lsu_defr_trap_g);
*/
//

assign tlu_inst_vld_nq_m = 
           ifu_tlu_inst_vld_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
           tlu_flush_all_w);

dff_s dff_stgivld_g (
    .din (inst_vld_m),
    .q   (inst_vld_nf_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// modified for timing
/*
dffr_s dffr_inst_ifu_flush_w (
    .din (ifu_tlu_flush_m),
	.q   (inst_ifu_flush_w),
    .clk (clk),
    .rst (local_rst), 
    .se  (se),       
    .si  (),          
    .so  ()
);
*/
assign inst_ifu_flush_w  = ifu_tlu_flush_fd_w;
assign inst_ifu_flush2_w = ifu_tlu_flush_fd_w;

// added for bug 2133
assign inst_vld_g = 
       inst_vld_nf_g & ~(inst_ifu_flush_w | lsu_tlu_defr_trp_taken_g);
       // modified for bug 4561
       // inst_vld_nf_g & ~(inst_ifu_flush_w | lsu_tlu_defr_trp_taken_g | 
       // ((thrid_w2[1:0] == thrid_g[1:0]) & lsu_defr_trap_g));

dff_s dff_stgivld_w2 (
    .din (inst_vld_g),
	.q   (inst_vld_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// modified due to timing
// assign	cwp_fastcmplt_g = cwp_fastcmplt_w & inst_vld_g;
assign	cwp_fastcmplt_g = cwp_fastcmplt_uq_g & inst_vld_g;

dff_s dff_stgfcmplt_w2 (
    .din (cwp_fastcmplt_g),
	.q   (cwp_fastcmplt_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// The stage name assignment may have to be changed !!
// done/retry qualified with inst_vld as it could be flushed.
assign	tlu_ifu_trappc_vld_w1 	=	((retry_inst_w2 | done_inst_w2) & inst_vld_w2 & cwp_fastcmplt_w2) | 
					thrd0_traps_w2 | thrd1_traps_w2 |
					thrd2_traps_w2 | thrd3_traps_w2 | cwp_cmplt_w2;	   
					//thrd2_traps_w2 | thrd3_traps_w2) & inst_vld_w2 | cwp_cmplt_w2;	   
assign	tlu_ifu_trapnpc_vld_w1 	= 	(retry_inst_w2 & inst_vld_w2 & cwp_fastcmplt_w2) |
					thrd0_traps_w2 | thrd1_traps_w2 |
					thrd2_traps_w2 | thrd3_traps_w2 | cwp_cmplt_rtry_w2;
					//) & inst_vld_w2 | cwp_cmplt_w2;	   
//
// modified for hypervisor support
// assign	tlu_ifu_trap_tid_w1[1:0]=	cwp_cmplt_w2 ? cwp_cmplt_tid_w2[1:0] : trap_tid_w2[1:0];
//
// recoded for timing
// assign	true_trap_tid_g[1:0] = cwp_cmplt_g ? cwp_cmplt_tid_g[1:0] : trap_tid_g[1:0];
// modified for bug 4091 and 4491
/*
assign early_trap_tid_g[1:0] = 
	       (((hwint_g | pib_wrap_trap_g| local_early_flush_pipe_w) & 
              ~(ifu_tlu_flush_fd_w | local_lsu_defr_trp_taken_g)) | 
           (dnrtry_inst_g & cwp_fastcmplt_g) | rstint_g) ? thrid_g[1:0] : pend_trap_tid_g[1:0]; 
*/
assign early_trap_tid_g[1:0] = 
	       (((hwint_g | pib_wrap_trap_g| local_early_flush_pipe_w) & ~ifu_tlu_flush_fd_w) | 
           (dnrtry_inst_g & cwp_fastcmplt_g) | rstint_g) ? thrid_g[1:0] : pend_trap_tid_g[1:0]; 
//
// modified for bug 4561
assign	true_trap_tid_g[1:0] = 
             // (lsu_defr_trap_g) ? thrid_w2[1:0]  : 
             (dside_sync_trap_g | lsu_defr_trap_g) ? thrid_g[1:0] :
              early_trap_tid_g[1:0];

dff_s #(2) dff_true_trap_tid_w2 (
    .din (true_trap_tid_g[1:0]),
    .q   (true_trap_tid_w2[1:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
assign tlu_ifu_trap_tid_w1[1:0] = true_trap_tid_w2[1:0];

// determine the mode of operation for the trapped thread
// modified for timing 
/*
assign tlu_trap_hpstate_enb = 
           (~(|true_trap_tid_g[1:0]))? tlu_hpstate_enb[0]:
               ((~true_trap_tid_g[1] & true_trap_tid_g[0])? tlu_hpstate_enb[1]:
                   ((true_trap_tid_g[1] & ~true_trap_tid_g[0])? tlu_hpstate_enb[2]: 
                       tlu_hpstate_enb[3]));
*/
assign tlu_trap_hpstate_enb = 
           (~(|true_trap_tid_w2[1:0]))? tlu_hpstate_enb[0]:
               ((~true_trap_tid_w2[1] & true_trap_tid_w2[0])? tlu_hpstate_enb[1]:
                   ((true_trap_tid_w2[1] & ~true_trap_tid_w2[0])? tlu_hpstate_enb[2]: 
                       tlu_hpstate_enb[3]));

//=========================================================================================
//	Local Exceptions within TLU/MMU
//=========================================================================================

// These are to be merged with lsu reported exceptions.
// 
// modified due to early_flush timing fix
// assign	local_sync_trap_g = tlu_mmu_sync_data_excp_g;
// 
// modified for hypervisor support
// modified for timing 
assign	local_sync_trap_m =  
               (true_hscpd_dacc_excpt_m | true_qtail_dacc_excpt_m) & inst_vld_m;
// 
// added for dsfsr bug
assign	tlu_lsu_priv_trap_m =  
               (true_hscpd_dacc_excpt_m | true_qtail_dacc_excpt_m); 
//
/*
// added for timing
dffr_s dffr_tlu_lsu_priv_trap_w  (
    .din (tlu_lsu_priv_trap_m),
    .q   (tlu_lsu_priv_trap_w),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
*/
// added for timing 
// modified for bug 3618
assign true_hscpd_dacc_excpt_m = 
           tlu_hscpd_dacc_excpt_m &
           ((thread0_stg_m_buf & ~tlu_hyper_lite[0]) |
            (thread1_stg_m_buf & ~tlu_hyper_lite[1]) |
            (thread2_stg_m_buf & ~tlu_hyper_lite[2]) |
            (thread3_stg_m_buf & ~tlu_hyper_lite[3])); 

assign true_qtail_dacc_excpt_m = 
           ((thread0_stg_m_buf & tlu_hpstate_enb[0] &  ~tlu_hpstate_priv[0] & 
             tlu_pstate_priv_buf[0])  |
            (thread1_stg_m_buf & tlu_hpstate_enb[1] &  ~tlu_hpstate_priv[1] & 
             tlu_pstate_priv_buf[1])  |
            (thread2_stg_m_buf & tlu_hpstate_enb[2] &  ~tlu_hpstate_priv[2] & 
             tlu_pstate_priv_buf[2])  |
            (thread3_stg_m_buf & tlu_hpstate_enb[3] &  ~tlu_hpstate_priv[3] & 
             tlu_pstate_priv_buf[3])) & tlu_qtail_dacc_excpt_m;

dffr_s dffr_local_sync_trap_g  (
    .din (local_sync_trap_m),
    .q   (local_sync_trap_g),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
//	Queuing traps
//=========================================================================================

// For current instr, prioritize traps across pipe. There are 3 synchronous sources :
// ifu,exu,lsu. Assume ifu traps have highest priority so compare has to be done
// only between exu and lsu traps.

// added for timing; moved qualification from IFU to TLU
assign	ifu_rstint_m = 
        ifu_tlu_rstint_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
        tlu_flush_all_w) & inst_vld_m;
assign	ifu_hwint_m = 
        ifu_tlu_hwint_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
        tlu_flush_all_w) & inst_vld_m;
assign	ifu_swint_m = 
        ifu_tlu_swint_m & ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & 
        tlu_flush_all_w) & inst_vld_m;

// generate the thread specific ifu flush signal - added for bug 2133
assign ifu_thrd_flush_w[0] = inst_ifu_flush2_w & thread0_rsel_dec_g;  
assign ifu_thrd_flush_w[1] = inst_ifu_flush2_w & thread1_rsel_dec_g;  
assign ifu_thrd_flush_w[2] = inst_ifu_flush2_w & thread2_rsel_dec_g;  
assign ifu_thrd_flush_w[3] = inst_ifu_flush2_w & thread3_rsel_dec_g;  


// INTERRUPT
dff_s #(9) dff_stgint_g (
   .din ({ifu_rstint_m,ifu_hwint_m,ifu_swint_m,int_tlu_rstid_m[5:0]}),
   .q   ({rstint_g,hwint_g,swint_g,rstid_g[5:0]}),
   .clk	(clk),
   .se  (se),
   .si  (),
   .so  ()
);

// Determine type of reset. Type of reset determines what state gets updated.
// This is the same as wrm reset !!! Can we then turn off writes to TNPC, TPC ???
assign	por_rstint_g = ((rstid_g[5:0] == 6'h01) & rstint_g);
assign	por_rstint0_g = por_rstint_g & thread0_rsel_g;
assign	por_rstint1_g = por_rstint_g & thread1_rsel_g;
assign	por_rstint2_g = por_rstint_g & thread2_rsel_g;
assign	por_rstint3_g = por_rstint_g & thread3_rsel_g;
// 
// added for bug 4749 
assign	xir_rstint_g = ((rstid_g[5:0] == 6'h03) & rstint_g);

dff_s dff_por_rstint_w2 (
    .din (por_rstint_g),
	.q   (por_rstint_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	por_rstint0_w2 = por_rstint_w2 & thread0_wsel_w2;
assign	por_rstint1_w2 = por_rstint_w2 & thread1_wsel_w2;
assign	por_rstint2_w2 = por_rstint_w2 & thread2_wsel_w2;
assign	por_rstint3_w2 = por_rstint_w2 & thread3_wsel_w2;

assign	tlu_por_rstint_g[0]  = por_rstint0_g;
assign	tlu_por_rstint_g[1]  = por_rstint1_g;
assign	tlu_por_rstint_g[2]  = por_rstint2_g;
assign	tlu_por_rstint_g[3]  = por_rstint3_g;

assign 	rstint_taken = rstint_g & inst_vld_g; 

// hwint needs to be requalified with pstate.ie. IFU will replay hwint in
// case dropped. IFU needs to source thread id in the form of ifu_tlu_thrid_d.
assign 	hwint_taken = hwint_g & inst_vld_g; 
//
// modified for bug 5127
// assign 	sirint_taken = sir_inst_g & inst_vld_g; 
assign 	sirint_taken = 
            sir_inst_g & inst_vld_g  & ~(pib_wrap_trap_nq_g | 
            lsu_tlu_defr_trp_taken_g | (|tlz_trap_g[`TLU_THRD_NUM-1:0])); 

assign 	swint_taken = swint_g & inst_vld_g; 

/*
assign	swint_thrd0_taken = swint_taken & thread0_rsel_g & tlu_int_pstate_ie[0];
assign	swint_thrd1_taken = swint_taken & thread1_rsel_g & tlu_int_pstate_ie[1];
assign	swint_thrd2_taken = swint_taken & thread2_rsel_g & tlu_int_pstate_ie[2];
assign	swint_thrd3_taken = swint_taken & thread3_rsel_g & tlu_int_pstate_ie[3];
//
//modified for hypervisor support
assign	swint_id[3:0]	=
	swint_thrd0_taken ? sftint0_id[3:0] :
		swint_thrd1_taken ? sftint1_id[3:0] :
			swint_thrd2_taken ? sftint2_id[3:0] :
				swint_thrd3_taken ? sftint3_id[3:0] :
					4'bxxxx;
*/
//
//added for timing 
dffr_s #(`TLU_THRD_NUM) dffr_tlu_cpu_mondo_trap (
    .din (tlu_cpu_mondo_cmp[`TLU_THRD_NUM-1:0]),
    .q   (tlu_cpu_mondo_trap[`TLU_THRD_NUM-1:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
dffr_s #(`TLU_THRD_NUM) dffr_tlu_dev_mondo_trap (
    .din (tlu_dev_mondo_cmp[`TLU_THRD_NUM-1:0]),
    .q   (tlu_dev_mondo_trap[`TLU_THRD_NUM-1:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffr_s #(`TLU_THRD_NUM) dffr_tlu_resum_err_trap (
    .din (tlu_resum_err_cmp[`TLU_THRD_NUM-1:0]),
    .q   (tlu_resum_err_trap[`TLU_THRD_NUM-1:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
assign cpu_mondo_trap_g =
       (thread0_wsel_g)? tlu_cpu_mondo_trap[0]:
       (thread1_wsel_g)? tlu_cpu_mondo_trap[1]:
       (thread2_wsel_g)? tlu_cpu_mondo_trap[2]:
       tlu_cpu_mondo_trap[3];

assign dev_mondo_trap_g =
       (thread0_wsel_g)? tlu_dev_mondo_trap[0]:
       (thread1_wsel_g)? tlu_dev_mondo_trap[1]:
       (thread2_wsel_g)? tlu_dev_mondo_trap[2]:
       tlu_dev_mondo_trap[3];

assign sftint_id_w2[3:0] =
       (thread0_wsel_w2)? sftint0_id[3:0]:
       (thread1_wsel_w2)? sftint1_id[3:0]: 
       (thread2_wsel_w2)? sftint2_id[3:0]:
        sftint3_id[3:0];

dffr_s dffr_cpu_mondo_trap_w2 (
    .din (cpu_mondo_trap_g),
    .q   (cpu_mondo_trap_w2),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffr_s dffr_dev_mondo_trap_w2 (
    .din (dev_mondo_trap_g),
    .q   (dev_mondo_trap_w2),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign final_swint_id_w2[6:0] =
       (cpu_mondo_trap_w2)? `CPU_MONDO_TRAP :
       (dev_mondo_trap_w2)? `DEV_MONDO_TRAP :
        {3'b100, sftint_id_w2[3:0]};

// recoded for timing for bug 5117
/*
assign final_swint0_id[6:0] =
	tlu_cpu_mondo_trap[0] ? `CPU_MONDO_TRAP : 
		((tlu_dev_mondo_trap[0] & ~tlu_cpu_mondo_trap[0]) ? `DEV_MONDO_TRAP :
		      {3'b100, sftint0_id[3:0]});	

assign final_swint1_id[6:0] =
	tlu_cpu_mondo_trap[1] ? `CPU_MONDO_TRAP : 
		((tlu_dev_mondo_trap[1] & ~tlu_cpu_mondo_trap[1]) ? `DEV_MONDO_TRAP :
		      {3'b100, sftint1_id[3:0]});	

assign final_swint2_id[6:0] =
	tlu_cpu_mondo_trap[2] ? `CPU_MONDO_TRAP : 
		((tlu_dev_mondo_trap[2] & ~tlu_cpu_mondo_trap[2]) ? `DEV_MONDO_TRAP :
		      {3'b100, sftint2_id[3:0]});	

assign final_swint3_id[6:0] =
	tlu_cpu_mondo_trap[3] ? `CPU_MONDO_TRAP : 
		((tlu_dev_mondo_trap[3] & ~tlu_cpu_mondo_trap[3]) ? `DEV_MONDO_TRAP :
		      {3'b100, sftint3_id[3:0]});	

assign final_swint_id[6:0]	=
	swint_thrd0_taken ? final_swint0_id[6:0] :
		swint_thrd1_taken ? final_swint1_id[6:0] :
			swint_thrd2_taken ? final_swint2_id[6:0] :
				swint_thrd3_taken ? final_swint3_id[6:0] :
					7'bxxxxxxx;
*/

// Assume rstid(interrupt/reset vector) is the same as trap type.
// Need to confirm !!!!
// sftware sir is generated by ifu decode.
// ttype for internal wdr is tt of trap itself.

// sir inst at maxtl can result entry to error state and thus wdr
// modified for bug 4749 and 4906
assign internal_wdr_trap[0] = 
           (thrd0_traps & trp_lvl0_at_maxtl) & 
          ~((por_rstint_g | xir_rstint_g) & thread0_rsel_g);
assign internal_wdr_trap[1] = 
           (thrd1_traps & trp_lvl1_at_maxtl) & 
          ~((por_rstint_g | xir_rstint_g) & thread1_rsel_g);
assign internal_wdr_trap[2] = 
           (thrd2_traps & trp_lvl2_at_maxtl) & 
          ~((por_rstint_g | xir_rstint_g) & thread2_rsel_g);
assign internal_wdr_trap[3] = 
           (thrd3_traps & trp_lvl3_at_maxtl) & 
          ~((por_rstint_g | xir_rstint_g) & thread3_rsel_g);

assign internal_wdr = 
           internal_wdr_trap[0] | internal_wdr_trap[1] |
           internal_wdr_trap[2] | internal_wdr_trap[3];
/*
assign	internal_wdr = 
		((thrd0_traps & trp_lvl0_at_maxtl) |
		(thrd1_traps & trp_lvl1_at_maxtl) |
		(thrd2_traps & trp_lvl2_at_maxtl) |
		(thrd3_traps & trp_lvl3_at_maxtl)) & 
       ~(por_rstint_g | xir_rstint_g);
*/
//
// modified for bug 4640 and bug5127 
assign 	tlu_self_boot_rst_g = 
              rstint_g | internal_wdr | (sir_inst_g & 
              ~(lsu_defr_trap_g | pib_wrap_trap_g | 
               (|tlz_trap_g[`TLU_THRD_NUM-1:0]))) | trap_to_redmode;
              // (rstint_g | internal_wdr | (sir_inst_g & ~lsu_defr_trap_g) |
               
//
// added for timing; moved qualification from IFU to TLU
// modified for bug 4561
assign	ifu_ttype_vld_m = 
            ifu_tlu_ttype_vld_m & 
            ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & tlu_flush_pipe_w);
/*
assign	ifu_ttype_vld_m = 
            ifu_tlu_ttype_vld_m & 
            ~((thrid_g[1:0] == tlu_exu_tid_m[1:0]) & tlu_flush_pipe_w) & 
            ~((thrid_w2[1:0] == tlu_exu_tid_m[1:0]) & lsu_defr_trap_g);
*/

// REGULAR TRAP
dff_s #(20) dff_stgeftt_g (
    .din ({exu_tlu_ttype_m[8:0],exu_tlu_ttype_vld_m,ifu_tlu_ttype_m[8:0],ifu_ttype_vld_m}), 
    .q   ({exu_ttype_g[8:0],exu_ttype_vld_g,ifu_ttype_tmp_g[8:0],ifu_ttype_vld_tmp_g}), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// added for bug 1293
// added spu_tlu_rsrv_illgl_m2 to account for the new illeg_instr from spu
//
// modified for the hypervisor support - wsr_illeg_globals_g is no longer necessary
// modified for pib support and timing fixes 
/*
assign ifu_ttype_g[8:0] = //((wsr_illeg_globals_g | spu_tlu_rsrv_illgl_m2) & 
                          (spu_tlu_rsrv_illgl_m2 & 
                         ~(ifu_ttype_tmp_g & (ifu_ttype_tmp_g < 9'h012)) &
                         ~immu_miss_g) ? 
                           9'h010 :
                          ((tlu_tick_npt_priv_act) ? 9'h037 : 
                          ifu_ttype_tmp_g); 
*/
//
// determine whether the processor is in user mode
assign tlu_none_priv[0] = ~(tlu_hpstate_priv[0] | tlu_pstate_priv_buf[0]);
assign tlu_none_priv[1] = ~(tlu_hpstate_priv[1] | tlu_pstate_priv_buf[1]);
assign tlu_none_priv[2] = ~(tlu_hpstate_priv[2] | tlu_pstate_priv_buf[2]);
assign tlu_none_priv[3] = ~(tlu_hpstate_priv[3] | tlu_pstate_priv_buf[3]);

assign tlu_hyper_lite[0] = 
           tlu_hpstate_priv[0]| (~tlu_hpstate_enb[0] & tlu_pstate_priv_buf[0]); 
assign tlu_hyper_lite[1] = 
           tlu_hpstate_priv[1]| (~tlu_hpstate_enb[1] & tlu_pstate_priv_buf[1]); 
assign tlu_hyper_lite[2] = 
           tlu_hpstate_priv[2]| (~tlu_hpstate_enb[2] & tlu_pstate_priv_buf[2]); 
assign tlu_hyper_lite[3] = 
           tlu_hpstate_priv[3]| (~tlu_hpstate_enb[3] & tlu_pstate_priv_buf[3]); 
//
// htrap instruction illegal instruction trap  
// this trap is taken only in hypervisor mode and not in hyper-lite
// mode
assign tlu_none_priv_m = 
          (tlu_none_priv[0] & tlu_hpstate_enb[0] & thread0_rsel_m) |
          (tlu_none_priv[1] & tlu_hpstate_enb[1] & thread1_rsel_m) |
          (tlu_none_priv[2] & tlu_hpstate_enb[2] & thread2_rsel_m) |
          (tlu_none_priv[3] & tlu_hpstate_enb[3] & thread3_rsel_m);

assign htrap_ill_inst_m = 
    (exu_tlu_ttype_vld_m &  exu_tlu_ttype_m[8] & 
     exu_tlu_ttype_m[7]) &  tlu_none_priv_m;

dffr_s dffr_htrap_ill_inst_uf_g (
   .din (htrap_ill_inst_m),
   .q   (htrap_ill_inst_uf_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign htrap_ill_inst_g = htrap_ill_inst_uf_g & ~inst_ifu_flush_w;
// 
// added for timing fix
assign spu_ill_inst_m = spu_tlu_rsrv_illgl_m & inst_vld_m;

dffr_s dffr_spu_ill_inst_uf_g (
   .din (spu_ill_inst_m),
   // modified for bug 2133
   // .q   (spu_ill_inst_g),
   .q   (spu_ill_inst_uf_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);


// 
// added for bug 2133
// modified at Farnad's request for bug 3599
// modified back to the old behavior (pre bug 3599) due to bug 4698
assign spu_ill_inst_g = 
//             spu_ill_inst_uf_g & ~(inst_ifu_flush_w); 
// fix for bug 5863. Only a stxa to asi=40 with opcode-rsvd should cause an illgl_va
           spu_ill_inst_uf_g & ~(inst_ifu_flush_w | lsu_tlu_early_flush_w);

assign ffu_higher_pri_g = 
           ffu_ill_inst_g & (ifu_ttype_vld_tmp_g & (ifu_ttype_tmp_g == 9'h020));

//
assign ifu_ttype_g[8:0] = (((spu_ill_inst_g  | ffu_ill_inst_g | htrap_ill_inst_g) & 
                         ~(ifu_ttype_vld_tmp_g   & (ifu_ttype_tmp_g < 9'h012)) &
                         ~immu_miss_g) | ffu_higher_pri_g) ? 
                           9'h010 :
                          ((tick_npt_priv_act_g | 
                           (pib_priv_act_trap_g & ~ifu_ttype_vld_tmp_g)) ? 9'h037 : 
                           ifu_ttype_tmp_g); 
//
// added for timing fix
assign pib_priv_act_early_trap_m = 
           ((pib_priv_act_trap_m[0] & inst_vld_m & thread0_rsel_m) & 
             ~(tlu_pstate_priv_buf[0] | tlu_hpstate_priv[0])) |
           ((pib_priv_act_trap_m[1] & inst_vld_m & thread1_rsel_m) & 
             ~(tlu_pstate_priv_buf[1] | tlu_hpstate_priv[1])) |
           ((pib_priv_act_trap_m[2] & inst_vld_m & thread2_rsel_m) & 
             ~(tlu_pstate_priv_buf[2] | tlu_hpstate_priv[2])) |
           ((pib_priv_act_trap_m[3] & inst_vld_m & thread3_rsel_m) & 
             ~(tlu_pstate_priv_buf[3] | tlu_hpstate_priv[3]));
//


// recoded the following for timing:
/*
assign exu_pib_priv_act_trap_m = 
           ((pib_priv_act_trap_m[0] & thread0_rsel_m) & 
             ~(tlu_pstate_priv[0] | tlu_hpstate_priv[0])) |
           ((pib_priv_act_trap_m[1] & thread1_rsel_m) & 
             ~(tlu_pstate_priv[1] | tlu_hpstate_priv[1])) |
           ((pib_priv_act_trap_m[2] & thread2_rsel_m) & 
             ~(tlu_pstate_priv[2] | tlu_hpstate_priv[2])) |
           ((pib_priv_act_trap_m[3] & thread3_rsel_m) & 
             ~(tlu_pstate_priv[3] | tlu_hpstate_priv[3]));
*/

wire [3:0] pib_priv_act_trap_thrd_qual_m;
wire [3:0] pib_priv_act_trap_thrd_hpstatepriv_qual_m;
wire [3:0] pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m;

assign  pib_priv_act_trap_thrd_qual_m[0] = pib_priv_act_trap_m[0] & thread0_rsel_m ;
assign  pib_priv_act_trap_thrd_qual_m[1] = pib_priv_act_trap_m[1] & thread1_rsel_m ;
assign  pib_priv_act_trap_thrd_qual_m[2] = pib_priv_act_trap_m[2] & thread2_rsel_m ;
assign  pib_priv_act_trap_thrd_qual_m[3] = pib_priv_act_trap_m[3] & thread3_rsel_m ;

assign pib_priv_act_trap_thrd_hpstatepriv_qual_m[0] = pib_priv_act_trap_thrd_qual_m[0] & ~tlu_hpstate_priv[0];
assign pib_priv_act_trap_thrd_hpstatepriv_qual_m[1] = pib_priv_act_trap_thrd_qual_m[1] & ~tlu_hpstate_priv[1];
assign pib_priv_act_trap_thrd_hpstatepriv_qual_m[2] = pib_priv_act_trap_thrd_qual_m[2] & ~tlu_hpstate_priv[2];
assign pib_priv_act_trap_thrd_hpstatepriv_qual_m[3] = pib_priv_act_trap_thrd_qual_m[3] & ~tlu_hpstate_priv[3];

assign pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m[0] = pib_priv_act_trap_thrd_hpstatepriv_qual_m[0] &
								~tlu_pstate_priv[0];
assign pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m[1] = pib_priv_act_trap_thrd_hpstatepriv_qual_m[1] &
								~tlu_pstate_priv[1];
assign pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m[2] = pib_priv_act_trap_thrd_hpstatepriv_qual_m[2] &
								~tlu_pstate_priv[2];
assign pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m[3] = pib_priv_act_trap_thrd_hpstatepriv_qual_m[3] &
								~tlu_pstate_priv[3];

assign exu_pib_priv_act_trap_m = (|pib_priv_act_trap_thrd_hpstatepriv_pstatepriv_m[3:0]);


// 
// added for make pib overflow trap precise
assign pib_trap_en[0] = tlu_int_pstate_ie[0] & (true_pil0[3:0] < 4'hf);
assign pib_trap_en[1] = tlu_int_pstate_ie[1] & (true_pil1[3:0] < 4'hf);
assign pib_trap_en[2] = tlu_int_pstate_ie[2] & (true_pil2[3:0] < 4'hf);
assign pib_trap_en[3] = tlu_int_pstate_ie[3] & (true_pil3[3:0] < 4'hf);
//
// added for bug 5017
dffr_s dffr_picl_wrap_pend_0 (
    .din (pib_picl_wrap[0]),
    .q   (picl_wrap_pend[0]),
    .rst (local_rst | (thread_inst_vld_w2[0] & ~pib_picl_wrap[0] & ~tlu_full_flush_pipe_w2)), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffr_s dffr_picl_wrap_pend_1 (
    .din (pib_picl_wrap[1]),
    .q   (picl_wrap_pend[1]),
    .rst (local_rst | (thread_inst_vld_w2[1] & ~pib_picl_wrap[1] & ~tlu_full_flush_pipe_w2)), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffr_s dffr_picl_wrap_pend_2 (
    .din (pib_picl_wrap[2]),
    .q   (picl_wrap_pend[2]),
    .rst (local_rst | (thread_inst_vld_w2[2] & ~pib_picl_wrap[2] & ~tlu_full_flush_pipe_w2)), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffr_s dffr_picl_wrap_pend_3 (
    .din (pib_picl_wrap[3]),
    .q   (picl_wrap_pend[3]),
    .rst (local_rst | (thread_inst_vld_w2[3] & ~pib_picl_wrap[3] & ~tlu_full_flush_pipe_w2)), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_picl_wrap_flg_m = 
       (picl_wrap_pend[0] & thread0_stg_m_buf) | 
       (picl_wrap_pend[1] & thread1_stg_m_buf) | 
       (picl_wrap_pend[2] & thread2_stg_m_buf) | 
       (picl_wrap_pend[3] & thread3_stg_m_buf);

// modified for bug 4086, 4206, 4246 and 4314
// modified for bug 5033, 5083 and 5017
// modified for bug 5436 - Niagara 2.0

// changed pend_pich_cnt_hld to pend_pich_cnt_hld_noqual as per bug5436(reopened 9/17/04).
assign pib_wrap_m[0] = 
           // (pib_picl_wrap[0] |
           ((picl_wrap_pend[0] & thread0_rsel_m) |
           (pich_wrap_flg[0] & inst_vld_m & thread0_rsel_m) |
           (pich_onebelow_flg[0] & (inst_vld_m & thread0_rsel_m) & 
           ((inst_vld_g & thread0_rsel_g) | (inst_vld_w2 & thread0_wsel_w2))) |
           (pich_twobelow_flg[0] & (inst_vld_m & thread0_rsel_m) & 
           (inst_vld_g & thread0_rsel_g) & (inst_vld_w2 & thread0_wsel_w2))) &
            pib_trap_en[0] & ~(tlu_flush_pipe_w & thread0_rsel_g) & ~pend_pich_cnt_hld_noqual[0];
assign pib_wrap_m[1] = 
           // (pib_picl_wrap[1] |
           ((picl_wrap_pend[1] & thread1_rsel_m) |
           (pich_wrap_flg[1] & inst_vld_m & thread1_rsel_m) |
           (pich_onebelow_flg[1] & (inst_vld_m & thread1_rsel_m) & 
           ((inst_vld_g & thread1_rsel_g) | (inst_vld_w2 & thread1_wsel_w2))) |
           (pich_twobelow_flg[1] & (inst_vld_m & thread1_rsel_m) & 
           (inst_vld_g & thread1_rsel_g) & (inst_vld_w2 & thread1_wsel_w2))) &   
            pib_trap_en[1] & ~(tlu_flush_pipe_w & thread1_rsel_g) & ~pend_pich_cnt_hld_noqual[1];
assign pib_wrap_m[2] = 
           // (pib_picl_wrap[2] |
           ((picl_wrap_pend[2] & thread2_rsel_m) |
           (pich_wrap_flg[2] & inst_vld_m & thread2_rsel_m) |
           (pich_onebelow_flg[2] & (inst_vld_m & thread2_rsel_m) & 
           ((inst_vld_g & thread2_rsel_g) | (inst_vld_w2 & thread2_wsel_w2))) |
           (pich_twobelow_flg[2] & (inst_vld_m & thread2_rsel_m) & 
           (inst_vld_g & thread2_rsel_g) & (inst_vld_w2 & thread2_wsel_w2))) &   
            pib_trap_en[2] & ~(tlu_flush_pipe_w & thread2_rsel_g) & ~pend_pich_cnt_hld_noqual[2];
assign pib_wrap_m[3] = 
           // (pib_picl_wrap[3] |
           ((picl_wrap_pend[3] & thread3_rsel_m) |
           (pich_wrap_flg[3] & inst_vld_m & thread3_rsel_m) |
           (pich_onebelow_flg[3] & (inst_vld_m & thread3_rsel_m) & 
           ((inst_vld_g & thread3_rsel_g) | (inst_vld_w2 & thread3_wsel_w2))) |
           (pich_twobelow_flg[3] & (inst_vld_m & thread3_rsel_m) & 
           (inst_vld_g & thread3_rsel_g) & (inst_vld_w2 & thread3_wsel_w2))) &   
            pib_trap_en[3] & ~(tlu_flush_pipe_w & thread3_rsel_g) & ~pend_pich_cnt_hld_noqual[3];

// modified for timing and bug 4314 and 5017
// added for bug 5436 - Niagara 2.0

// removed qualification with ~pend_pich_cnt_hld from the following logics and pushed
// the qulaification to G stage only for software interupt bit15 setting. The above 
// logic stay the same and no precise trap will be taken in the case of b2b valid
// instruction as indicated in bug5436(reopened 9/16/04) 
assign pib_pich_wrap_m[0] = 
           // (pib_picl_wrap[0] |
           ((picl_wrap_pend[0] & thread0_rsel_m) |
           (pich_wrap_flg[0] & inst_vld_m & thread0_rsel_m) |
           (pich_onebelow_flg[0] & (inst_vld_m & thread0_rsel_m) & 
           ((inst_vld_g & thread0_rsel_g) | (inst_vld_w2 & thread0_wsel_w2))) |
           (pich_twobelow_flg[0] & (inst_vld_m & thread0_rsel_m) & 
           (inst_vld_g & thread0_rsel_g) & (inst_vld_w2 & thread0_wsel_w2))) &
           ~(tlu_flush_pipe_w & thread0_rsel_g) ;
assign pib_pich_wrap_m[1] = 
           // (pib_picl_wrap[1] |
           ((picl_wrap_pend[1] & thread1_rsel_m) |
           (pich_wrap_flg[1] & inst_vld_m & thread1_rsel_m) |
           (pich_onebelow_flg[1] & (inst_vld_m & thread1_rsel_m) & 
           ((inst_vld_g & thread1_rsel_g) | (inst_vld_w2 & thread1_wsel_w2))) |
           (pich_twobelow_flg[1] & (inst_vld_m & thread1_rsel_m) & 
           (inst_vld_g & thread1_rsel_g) & (inst_vld_w2 & thread1_wsel_w2))) &   
           ~(tlu_flush_pipe_w & thread1_rsel_g) ;
assign pib_pich_wrap_m[2] = 
           // (pib_picl_wrap[2] |
           ((picl_wrap_pend[2] & thread2_rsel_m) |
           (pich_wrap_flg[2] & inst_vld_m & thread2_rsel_m) |
           (pich_onebelow_flg[2] & (inst_vld_m & thread2_rsel_m) & 
           ((inst_vld_g & thread2_rsel_g) | (inst_vld_w2 & thread2_wsel_w2))) |
           (pich_twobelow_flg[2] & (inst_vld_m & thread2_rsel_m) & 
           (inst_vld_g & thread2_rsel_g) & (inst_vld_w2 & thread2_wsel_w2))) &   
           ~(tlu_flush_pipe_w & thread2_rsel_g) ;
assign pib_pich_wrap_m[3] = 
           // (pib_picl_wrap[3] |
           ((picl_wrap_pend[3] & thread3_rsel_m) |
           (pich_wrap_flg[3] & inst_vld_m & thread3_rsel_m) |
           (pich_onebelow_flg[3] & (inst_vld_m & thread3_rsel_m) & 
           ((inst_vld_g & thread3_rsel_g) | (inst_vld_w2 & thread3_wsel_w2))) |
           (pich_twobelow_flg[3] & (inst_vld_m & thread3_rsel_m) & 
           (inst_vld_g & thread3_rsel_g) & (inst_vld_w2 & thread3_wsel_w2))) &   
           ~(tlu_flush_pipe_w & thread3_rsel_g) ;
/*
assign pib_wrap_m[0] = 
           (pib_picl_wrap[0] |
           (pich_wrap_flg[0] & inst_vld_m & thread0_rsel_m) |
           (pich_onebelow_flg[0] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread0_rsel_m & (thread0_wsel_w2 | thread0_rsel_g)) | 
           (pich_twobelow_flg[0] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread0_rsel_g & thread0_rsel_m & thread0_wsel_w2)) & pib_trap_en[0] & 
            ~(tlu_flush_pipe_w & thread0_rsel_g);
assign pib_wrap_m[1] = 
           (pib_picl_wrap[1] |
           (pich_wrap_flg[1] & inst_vld_m & thread1_rsel_m) |
           (pich_onebelow_flg[1] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread1_rsel_m & (thread1_wsel_w2 | thread1_rsel_g)) | 
           (pich_twobelow_flg[1] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread1_rsel_g & thread1_rsel_m & thread1_wsel_w2)) & pib_trap_en[1] &
            ~(tlu_flush_pipe_w & thread1_rsel_g);
assign pib_wrap_m[2] = 
           (pib_picl_wrap[2] |
           (pich_wrap_flg[2] & inst_vld_m & thread2_rsel_m) |
           (pich_onebelow_flg[2] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread2_rsel_m & (thread2_wsel_w2 | thread2_rsel_g)) | 
           (pich_twobelow_flg[2] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread2_rsel_g & thread2_rsel_m & thread2_wsel_w2)) & pib_trap_en[2] &
            ~(tlu_flush_pipe_w & thread2_rsel_g);
assign pib_wrap_m[3] = 
           (pib_picl_wrap[3] |
           (pich_wrap_flg[3] & inst_vld_m & thread3_rsel_m) |
           (pich_onebelow_flg[3] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread3_rsel_m & (thread3_wsel_w2 | thread3_rsel_g)) | 
           (pich_twobelow_flg[3] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread3_rsel_g & thread3_rsel_m & thread3_wsel_w2)) & pib_trap_en[3] &
            ~(tlu_flush_pipe_w & thread3_rsel_g);

// modified for timing and bug 4314 
assign pib_pich_wrap_m[0] = 
           (pib_picl_wrap[0] |
           (pich_wrap_flg[0] & inst_vld_m & thread0_rsel_m) |
           (pich_onebelow_flg[0] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread0_rsel_m & (thread0_wsel_w2 | thread0_rsel_g)) | 
           (pich_twobelow_flg[0] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread0_rsel_g & thread0_rsel_m & thread0_wsel_w2)) & 
            ~(tlu_flush_pipe_w & thread0_rsel_g);
assign pib_pich_wrap_m[1] = 
           (pib_picl_wrap[1] |
           (pich_wrap_flg[1] & inst_vld_m & thread1_rsel_m) |
           (pich_onebelow_flg[1] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread1_rsel_m & (thread1_wsel_w2 | thread1_rsel_g)) | 
           (pich_twobelow_flg[1] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread1_rsel_g & thread1_rsel_m & thread1_wsel_w2)) & 
            ~(tlu_flush_pipe_w & thread1_rsel_g);
assign pib_pich_wrap_m[2] = 
           (pib_picl_wrap[2] |
           (pich_wrap_flg[2] & inst_vld_m & thread2_rsel_m) |
           (pich_onebelow_flg[2] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread2_rsel_m & (thread2_wsel_w2 | thread2_rsel_g)) | 
           (pich_twobelow_flg[2] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread2_rsel_g & thread2_rsel_m & thread2_wsel_w2)) & 
            ~(tlu_flush_pipe_w & thread2_rsel_g);
assign pib_pich_wrap_m[3] = 
           (pib_picl_wrap[3] |
           (pich_wrap_flg[3] & inst_vld_m & thread3_rsel_m) |
           (pich_onebelow_flg[3] & inst_vld_m & (inst_vld_g | inst_vld_w2) & 
           thread3_rsel_m & (thread3_wsel_w2 | thread3_rsel_g)) | 
           (pich_twobelow_flg[3] & inst_vld_m & inst_vld_g  & inst_vld_w2 & 
            thread3_rsel_g & thread3_rsel_m & thread3_wsel_w2)) & 
            ~(tlu_flush_pipe_w & thread3_rsel_g);
//
*/


wire [3:0] pib_pich_wrap_q;

dffr_s #(`TLU_THRD_NUM) dffr_pib_pich_wrap (
   .din (pib_pich_wrap_m[`TLU_THRD_NUM-1:0]),
   .q   (pib_pich_wrap_q[`TLU_THRD_NUM-1:0]),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

// added for the bug 5436 reopened on 9/16/2004 by Samy. The following pushes
// the qualification by hold signal to G stage.So sofint bit15 is set for signaling
// software a overflow has occurred. But the preciese trap will not be taken.
assign pib_pich_wrap[3:0] = pib_pich_wrap_q[3:0] & {4{~pend_pich_cnt_hld}};


// 
// experiment
/*
assign pich_exu_wrap_e[0] = 
       tlu_thread_inst_vld_w2[0]? pich_onebelow_flg[0]: pich_wrap_flg[0]; 
assign pich_exu_wrap_e[1] = 
       tlu_thread_inst_vld_w2[1]? pich_onebelow_flg[1]: pich_wrap_flg[1];
assign pich_exu_wrap_e[2] = 
       tlu_thread_inst_vld_w2[2]? pich_onebelow_flg[2]: pich_wrap_flg[2];
assign pich_exu_wrap_e[3] = 
       tlu_thread_inst_vld_w2[3]? pich_onebelow_flg[3]: pich_wrap_flg[3]; 

assign pich_wrap_flg_e = 
           (tlu_thrd_rsel_e[0]) ? pich_exu_wrap_e[0]:
           (tlu_thrd_rsel_e[1]) ? pich_exu_wrap_e[1]:
           (tlu_thrd_rsel_e[2]) ? pich_exu_wrap_e[2]:
            pich_exu_wrap_e[3];
*/

dffr_s dffr_pich_wrap_flg_m (
   .din (tlu_pic_wrap_e),
   .q   (pich_wrap_flg_m),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
//
// modified for bug 5436 - Niagara 2.0
assign tlu_pich_wrap_flg_m = 
           pich_wrap_flg_m & tlu_pic_cnt_en_m; 
/*
assign pic_hpstate_priv_e = 
           (tlu_thrd_rsel_e[0]) ? tlu_hpstate_priv[0]:
           (tlu_thrd_rsel_e[1]) ? tlu_hpstate_priv[1]:
           (tlu_thrd_rsel_e[2]) ? tlu_hpstate_priv[2]:
            tlu_hpstate_priv[3];

assign pic_pstate_priv_e = 
           (tlu_thrd_rsel_e[0]) ? tlu_pstate_priv_buf[0]:
           (tlu_thrd_rsel_e[1]) ? tlu_pstate_priv_buf[1]:
           (tlu_thrd_rsel_e[2]) ? tlu_pstate_priv_buf[2]:
            tlu_pstate_priv_buf[3];

assign pic_hpstate_enb_e = 
           (tlu_thrd_rsel_e[0]) ? tlu_hpstate_enb[0]:
           (tlu_thrd_rsel_e[1]) ? tlu_hpstate_enb[1]:
           (tlu_thrd_rsel_e[2]) ? tlu_hpstate_enb[2]:
            tlu_hpstate_enb[3];

assign pic_trap_en_e = 
           (tlu_thrd_rsel_e[0]) ? pib_trap_en[0]:
           (tlu_thrd_rsel_e[1]) ? pib_trap_en[1]:
           (tlu_thrd_rsel_e[2]) ? pib_trap_en[2]:
            pib_trap_en[3];
*/

// modified for bug 5436 - Niagara 2.0

assign pic_cnt_en[0] = 
            ((~tlu_hpstate_priv[0] & ~tlu_pstate_priv_buf[0] & tlu_pcr_ut[0]) | 
             (~tlu_hpstate_enb[0]  & tlu_hpstate_priv[0] & tlu_pcr_st[0]) |
             (tlu_hpstate_enb[0]   & tlu_pstate_priv_buf[0]  & ~tlu_hpstate_priv[0] & 
 //tlu_pcr_st[0])) & pib_trap_en[0]; 
              tlu_pcr_st[0])) ; 
assign pic_cnt_en[1] = 
            ((~tlu_hpstate_priv[1] & ~tlu_pstate_priv_buf[1] & tlu_pcr_ut[1]) | 
             (~tlu_hpstate_enb[1]  & tlu_hpstate_priv[1] & tlu_pcr_st[1]) |
             (tlu_hpstate_enb[1]   & tlu_pstate_priv_buf[1]  & ~tlu_hpstate_priv[1] & 
 //tlu_pcr_st[1])) & pib_trap_en[1]; 
              tlu_pcr_st[1])) ; 
assign pic_cnt_en[2] = 
            ((~tlu_hpstate_priv[2] & ~tlu_pstate_priv_buf[2] & tlu_pcr_ut[2]) | 
             (~tlu_hpstate_enb[2]  & tlu_hpstate_priv[2] & tlu_pcr_st[2]) |
             (tlu_hpstate_enb[2]   & tlu_pstate_priv_buf[2]  & ~tlu_hpstate_priv[2] & 
 //tlu_pcr_st[2])) & pib_trap_en[2]; 
              tlu_pcr_st[2])) ; 
assign pic_cnt_en[3] = 
            ((~tlu_hpstate_priv[3] & ~tlu_pstate_priv_buf[3] & tlu_pcr_ut[3]) | 
             (~tlu_hpstate_enb[3]  & tlu_hpstate_priv[3] & tlu_pcr_st[3]) |
             (tlu_hpstate_enb[3]   & tlu_pstate_priv_buf[3]  & ~tlu_hpstate_priv[3] & 
 //tlu_pcr_st[3])) & pib_trap_en[3]; 
              tlu_pcr_st[3])) ; 

assign pic_cnt_en_e = 
           (tlu_thrd_rsel_e[0]) ? pic_cnt_en[0]:
           (tlu_thrd_rsel_e[1]) ? pic_cnt_en[1]:
           (tlu_thrd_rsel_e[2]) ? pic_cnt_en[2]:
            pic_cnt_en[3];


/*
assign pic_cnt_en_e = 
            ((~pic_hpstate_priv_e & ~pic_pstate_priv_e & pcr_ut_e) | 
             (~pic_hpstate_enb_e  & pic_hpstate_priv_e & pcr_st_e) |
             (pic_hpstate_enb_e   & pic_pstate_priv_e  & ~pic_hpstate_priv_e & 
              pcr_st_e)) & pic_trap_en_e; 
*/

dffr_s dffr_tlu_pic_cnt_en_m (
   .din (pic_cnt_en_e),
   .q   (pic_cnt_en_m),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

/**** replaced the following with and-or for better synthesis interms of timing 
assign tlu_pich_cnt_hld =
       (thread0_rsel_m) ? pend_pich_cnt_hld[0]: 
       (thread1_rsel_m) ? pend_pich_cnt_hld[1]:
       (thread2_rsel_m) ? pend_pich_cnt_hld[2]:
        pend_pich_cnt_hld[3]; 
************/


assign tlu_pich_cnt_hld = (thread0_stg_m & pend_pich_cnt_hld_early[0]) |
			  (thread1_stg_m & pend_pich_cnt_hld_early[1]) |
			  (thread2_stg_m & pend_pich_cnt_hld_early[2]) |
			  (thread3_stg_m & pend_pich_cnt_hld_early[3]) ;


// added the follwoing since we still want to qualify with pib_trap_en for the trap signal going
// to exu, i.e. tlu_pic_cnt_en_m is used to generate tlu_exu_pic_onebelow_m in tlu_misctl.v 
wire pic_trap_en_e =
           (tlu_thrd_rsel_e[0]) ? pib_trap_en[0]:
           (tlu_thrd_rsel_e[1]) ? pib_trap_en[1]:
           (tlu_thrd_rsel_e[2]) ? pib_trap_en[2]:
            pib_trap_en[3];

wire pic_trap_en_m;

dffr_s dffr_pic_trap_en_m (
   .din (pic_trap_en_e),
   .q   (pic_trap_en_m),
   .rst (local_rst), .clk (clk), .se  (se), .si  (), .so  ());

wire tlu_pic_cnt_en_m_prequal = pic_cnt_en_m & pic_trap_en_m;

assign tlu_pic_cnt_en_m = tlu_pic_cnt_en_m_prequal & ~tlu_pich_cnt_hld;

//
// added for bug 5436 - Niagara 2.0
dffr_s dffr_pic_cnt_en_w (
   .din (pic_cnt_en_m),
   .q   (pic_cnt_en_w),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

dffr_s dffr_pic_cnt_en_w2 (
   .din (pic_cnt_en_w),
   .q   (pic_cnt_en_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

/*
// added for bug 4785
assign tlu_pic_onebelow_e = 
           (thread0_rsel_e) ? pich_onebelow_flg[0] :
           (thread1_rsel_e) ? pich_onebelow_flg[1] :
           (thread2_rsel_e) ? pich_onebelow_flg[2] :
           pich_onebelow_flg[3];

dffr_s dffr_tlu_exu_pic_onebelow_m (
   .din (tlu_pic_onebelow_e),
   .q   (tlu_exu_pic_onebelow_m),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign tlu_pic_twobelow_e = 
           (thread0_rsel_e) ? pich_twobelow_flg[0] :
           (thread1_rsel_e) ? pich_twobelow_flg[1] :
           (thread2_rsel_e) ? pich_twobelow_flg[2] :
           pich_twobelow_flg[3];

dffr_s dffr_tlu_exu_pic_twobelow_m (
   .din (tlu_pic_twobelow_e),
   .q   (tlu_exu_pic_twobelow_m),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
*/
//
// added for bug 4395
dffr_s dffr_tlu_tcc_inst_w (
    .din (exu_tlu_ttype_m[8]),
    .q   (tlu_tcc_inst_w),
    .clk (clk),
    .rst (local_rst), 
    .se  (se),       
    .si  (),          
    .so  ()
);
//
assign pib_wrap_trap_m = (|pib_wrap_m[`TLU_THRD_NUM-1:0]);
//
// modified for bug 4342
// pib wrap precise trap 
dffr_s dffr_pib_wrap_trap_nq_g (
   .din (pib_wrap_trap_m),
   .q   (pib_wrap_trap_nq_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

// modified for bug 4916
assign pib_wrap_trap_g = 
           pib_wrap_trap_nq_g & ~lsu_tlu_defr_trp_taken_g; 
//
// modified for bug 2955
assign tlu_exu_priv_trap_m = 
           exu_pib_priv_act_trap_m | exu_tick_npt_priv_act_m |
           (|tlz_exu_trap_m[`TLU_THRD_NUM-1:0]) | tlu_pich_wrap_flg_m |
           tlu_picl_wrap_flg_m;
// 
// illegal instruction from ffu
dffr_s dffr_ffu_ill_inst_uf_g (
   .din (ffu_tlu_ill_inst_m),
   .q   (ffu_ill_inst_uf_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign ffu_ill_inst_g = ffu_ill_inst_uf_g & ~inst_ifu_flush_w;
/*
dffr_s dffr_lsu_ill_inst_uf_g (
   .din (lsu_tlu_ill_inst_m),
   .q   (lsu_ill_inst_uf_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign lsu_ill_inst_g = lsu_ill_inst_uf_g & ~inst_ifu_flush_w;
//
*/
// added for bug 4074 and modified for bug 4715
/*
dffr_s dffr_lsu_tlu_defr_trp_taken_w2 (
   .din (lsu_tlu_defr_trp_taken_g),
   .q   (lsu_tlu_defr_trp_taken_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
*/

assign lsu_defr_trp_taken_w2[0] = lsu_defr_trap_w2 & thread0_wsel_w2; 
assign lsu_defr_trp_taken_w2[1] = lsu_defr_trap_w2 & thread1_wsel_w2; 
assign lsu_defr_trp_taken_w2[2] = lsu_defr_trap_w2 & thread2_wsel_w2; 
assign lsu_defr_trp_taken_w2[3] = lsu_defr_trap_w2 & thread3_wsel_w2; 


// added for the lsu deferred trap - bug 3060
// modified for bug 4074, 4561 and 4916
assign lsu_defr_trap_g = lsu_tlu_defr_trp_taken_g & ~ifu_tlu_flush_fd_w; 
// assign lsu_defr_trap_g = lsu_tlu_defr_trp_taken_g; 

assign local_lsu_async_ttype_vld_w = lsu_tlu_async_ttype_vld_g; 
//
// modified for bug 4443 and 4561
// added for timing
dffr_s dffr_lsu_defr_trap_w2 (
   .din (lsu_defr_trap_g),
   .q   (lsu_defr_trap_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
//
// privilege action trap of the PIB registers
dffr_s dffr_pib_priv_act_trap_g (
   .din (pib_priv_act_early_trap_m),
   .q   (pib_priv_act_trap_uf_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
//
// added for bug 2133
assign pib_priv_act_trap_g = pib_priv_act_trap_uf_g & ~inst_ifu_flush_w;
//
assign	ifu_ttype_vld_g = ifu_ttype_vld_tmp_g | spu_ill_inst_g | immu_miss_g    | 
                          tick_npt_priv_act_g | ffu_ill_inst_g | pib_priv_act_trap_g | 
                          htrap_ill_inst_g;
// 
// added and modified for timing fix
assign ifu_ttype_early_vld_m = 
             (ifu_ttype_vld_m  | pib_priv_act_early_trap_m |
              spu_ill_inst_m   | tick_npt_priv_act_m | ffu_tlu_ill_inst_m |
              htrap_ill_inst_m); 

assign	early_dside_trap_g = 
            (local_sync_trap_g & ~inst_ifu_flush2_w) | 
             va_oor_inst_acc_excp_g | va_oor_data_acc_excp_g; 
//
assign	dside_sync_trap_g = 
            lsu_ttype_vld_w | early_dside_trap_g; 
//
// The sync ttype is being recoded for timing
// Merge with lsu traps.
//
mux2ds #(`TSA_TTYPE_WIDTH) mx_local_sync_ttype (
    .in0  (`INST_ACC_EXC),
	.in1  (`DATA_ACC_EXC),
    .sel0 (va_oor_inst_acc_excp_g),
    .sel1 (~va_oor_inst_acc_excp_g),
    .dout (local_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0])
);

// Need 9b comparator.
// assign dside_higher_priority = (dside_sync_ttype_g[8:0] > exu_ttype_g[8:0]);
assign local_higher_ttype_flg = 
           (local_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0] > 
            exu_ttype_g[`TSA_TTYPE_WIDTH-1:0]);

// added for bug 3977
dffr_s dffr_exu_ue_trap_g (
   .din (exu_tlu_ue_trap_m),
   .q   (exu_ue_trap_g),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
assign exu_higher_pri_g = 
           exu_ue_trap_g & exu_ttype_vld_g & ~immu_miss_g;  

// Is the prioritization needed or is this handled among the units themselves ?
// modified for bug 3977
assign	priority_trap_sel0 = 
            ifu_ttype_vld_g & ~((|tlz_trap_g[`TLU_THRD_NUM-1:0]) | 
            lsu_defr_trap_g | exu_higher_pri_g);
//
// modified for support to lsu deferred traps
// modified for bug 3977
assign	priority_trap_sel1 = 
            ~((|tlz_trap_g[`TLU_THRD_NUM-1:0]) | lsu_defr_trap_g) & 
            ~(ifu_ttype_vld_g & ~exu_higher_pri_g) &
             ((exu_ttype_vld_g & ~early_dside_trap_g) | 
			 ((exu_ttype_vld_g &  early_dside_trap_g) & ~local_higher_ttype_flg));
// 
// modified for bug 3634
assign	priority_trap_sel2 = ~(priority_trap_sel0 | priority_trap_sel1);
//
// recoded for timing
// Prioritized ttype for thread available.
/*
mux4ds #(9) finaltt_sel (
    .in0    ({2'b00,`TLZ_TRAP}),
    .in1    (ifu_ttype_g[8:0]), 	
	.in2    (exu_ttype_g[8:0]),
	.in3    (dside_sync_ttype_g[8:0]),
    .sel0   (|tlz_trap_g[`TLU_THRD_NUM-1:0]),
    .sel1   (priority_trap_sel0),  	
	.sel2   (priority_trap_sel1),
	.sel3   (priority_trap_sel2),
    .dout   (sync_ttype_g[8:0])
); 
*/
//
// modified for bug 3634
// modified for bug 3977
mux3ds #(`TSA_TTYPE_WIDTH) mx_early_sync_ttype (
//     .in0    ({2'b00,`TLZ_TRAP}),
    .in0    (ifu_ttype_g[8:0]), 	
	.in1    (exu_ttype_g[8:0]),
	.in2    (local_sync_ttype_g[8:0]),
    .sel0   (priority_trap_sel0),  	
	.sel1   (priority_trap_sel1),
	.sel2   (priority_trap_sel2),
    .dout   (early_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0])
); 
//
// added for timing 
dff_s #(`TSA_TTYPE_WIDTH) dff_early_sync_ttype_w2 (
    .din (early_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (early_sync_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
//
// Now pend Div and Spill/Fill traps if necessary. These traps are always pended
// even if there is no concurrent synchronous trap. They are pended by thread.
// Include fp traps
// modified for bug 4857
assign	sync_trap_taken_g = 
	((ifu_ttype_vld_g | exu_ttype_vld_g | lsu_tlu_ttype_vld_m2 | early_dside_trap_g | 
     (|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g) & inst_vld_g) | 
      intrpt_taken | swint_taken | lsu_defr_trap_g;
     // (|tlz_trap_g[`TLU_THRD_NUM-1:0])) & inst_vld_g) | intrpt_taken | swint_taken |
     //  lsu_defr_trap_g | pib_wrap_trap_g; 
// 
// added for timing
dff_s dff_sync_trap_taken_w2 (
    .din (sync_trap_taken_g), 
	.q   (sync_trap_taken_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// added for timing fix 
// modified for bug 3653, bug 4758 and bug 5169
assign	sync_trap_taken_m = 
	 (exu_tlu_va_oor_jl_ret_m | exu_tlu_ttype_vld_m | 
      ifu_ttype_early_vld_m | (|tlz_trap_m[`TLU_THRD_NUM-1:0]) | true_hscpd_dacc_excpt_m | 
      true_qtail_dacc_excpt_m | dmmu_va_oor_m | exu_tlu_va_oor_jl_ret_m |
      pib_wrap_trap_m | ifu_swint_m | ifu_hwint_m | ifu_rstint_m) & inst_vld_m; 
/*
assign	sync_trap_taken_m = 
	((exu_tlu_va_oor_jl_ret_m | exu_tlu_ttype_vld_m | 
      ifu_ttype_early_vld_m | (|tlz_trap_m[`TLU_THRD_NUM-1:0]) | true_hscpd_dacc_excpt_m | 
      true_qtail_dacc_excpt_m | dmmu_va_oor_m | exu_tlu_va_oor_jl_ret_m) & 
      inst_vld_m) | pib_wrap_trap_m | ifu_swint_m | ifu_hwint_m | ifu_rstint_m; 
*/

assign fp_trap_thrd0 = ~ffu_ifu_tid_w2[1] & ~ffu_ifu_tid_w2[0];
assign fp_trap_thrd1 = ~ffu_ifu_tid_w2[1] &  ffu_ifu_tid_w2[0];
assign fp_trap_thrd2 =  ffu_ifu_tid_w2[1] & ~ffu_ifu_tid_w2[0];
assign fp_trap_thrd3 =  ffu_ifu_tid_w2[1] &  ffu_ifu_tid_w2[0];

// assign div_zero_thrd0 = ~exu_tlu_div_tid[1] & ~exu_tlu_div_tid[0];
// assign div_zero_thrd1 = ~exu_tlu_div_tid[1] &  exu_tlu_div_tid[0];
// assign div_zero_thrd2 =  exu_tlu_div_tid[1] & ~exu_tlu_div_tid[0];
// assign div_zero_thrd3 =  exu_tlu_div_tid[1] &  exu_tlu_div_tid[0];

assign spill_thrd0 = ~exu_tlu_spill_tid[1] & ~exu_tlu_spill_tid[0];
assign spill_thrd1 = ~exu_tlu_spill_tid[1] &  exu_tlu_spill_tid[0];
assign spill_thrd2 =  exu_tlu_spill_tid[1] & ~exu_tlu_spill_tid[0];
assign spill_thrd3 =  exu_tlu_spill_tid[1] &  exu_tlu_spill_tid[0];
// 
// added for bug 3499
dff_s #(`TLU_THRD_NUM) dff_cwp_en_thrd_reset (
    .din ({pend_to_thrd3_reset, pend_to_thrd2_reset,
           pend_to_thrd1_reset, pend_to_thrd0_reset}),
    .q   (cwp_en_thrd_reset[`TLU_THRD_NUM-1:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffre_s dffre_trap_cwp0_enb (
    .din (spill_thrd0),
    .q   (trap_cwp_enb[0]),
    .rst (cwp_en_thrd_reset[0]), 
    .en  (exu_tlu_spill & spill_thrd0),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffre_s dffre_trap_cwp1_enb (
    .din (spill_thrd1),
    .q   (trap_cwp_enb[1]),
    .rst (cwp_en_thrd_reset[1]), 
    .en  (exu_tlu_spill & spill_thrd1),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffre_s dffre_trap_cwp2_enb (
    .din (spill_thrd2),
    .q   (trap_cwp_enb[2]),
    .rst (cwp_en_thrd_reset[2]), 
    .en  (exu_tlu_spill & spill_thrd2),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffre_s dffre_trap_cwp3_enb (
    .din (spill_thrd3),
    .q   (trap_cwp_enb[3]),
    .rst (cwp_en_thrd_reset[3]), 
    .en  (exu_tlu_spill & spill_thrd3),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_trap_cwp_en[`TLU_THRD_NUM-1:0] = ~(trap_cwp_enb[`TLU_THRD_NUM-1:0]);

//
// added for asynchronize dmmu traps (correctable parity error)
assign dmmu_async_thrd0 = ~lsu_tlu_async_tid_g[1] & ~lsu_tlu_async_tid_g[0];
assign dmmu_async_thrd1 = ~lsu_tlu_async_tid_g[1] &  lsu_tlu_async_tid_g[0];
assign dmmu_async_thrd2 =  lsu_tlu_async_tid_g[1] & ~lsu_tlu_async_tid_g[0];
assign dmmu_async_thrd3 =  lsu_tlu_async_tid_g[1] &  lsu_tlu_async_tid_g[0];
//
// modified for bug 4074
assign lsu_async_vld_en_g[0] = 
//            local_lsu_async_ttype_vld_w & dmmu_async_thrd0 & ~lsu_tlu_defr_trp_taken_g;
            local_lsu_async_ttype_vld_w & dmmu_async_thrd0 & ~lsu_defr_trp_taken_w2[0];
assign lsu_async_vld_en_g[1] = 
//            local_lsu_async_ttype_vld_w & dmmu_async_thrd1 & ~lsu_tlu_defr_trp_taken_g;
           local_lsu_async_ttype_vld_w & dmmu_async_thrd1 & ~lsu_defr_trp_taken_w2[1];
assign lsu_async_vld_en_g[2] = 
//            local_lsu_async_ttype_vld_w & dmmu_async_thrd2 & ~lsu_tlu_defr_trp_taken_g;
           local_lsu_async_ttype_vld_w & dmmu_async_thrd2 & ~lsu_defr_trp_taken_w2[2];
assign lsu_async_vld_en_g[3] = 
//           local_lsu_async_ttype_vld_w & dmmu_async_thrd3 & ~lsu_tlu_defr_trp_taken_g;
           local_lsu_async_ttype_vld_w & dmmu_async_thrd3 & ~lsu_defr_trp_taken_w2[3];
//
dffre_s dffre_lsu_async_vld_en_w2_0 (
    .din (lsu_async_vld_en_g[0]),
    .q   (lsu_async_vld_en_w2[0]),
    .rst (pend_to_thrd0_reset),
    .en  (lsu_async_vld_en_g[0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffre_s dffre_lsu_async_vld_en_w2_1 (
    .din (lsu_async_vld_en_g[1]),
    .q   (lsu_async_vld_en_w2[1]),
    .rst (pend_to_thrd1_reset),
    .en  (lsu_async_vld_en_g[1]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffre_s dffre_lsu_async_vld_en_w2_2 (
    .din (lsu_async_vld_en_g[2]),
    .q   (lsu_async_vld_en_w2[2]),
    .rst (pend_to_thrd2_reset),
    .en  (lsu_async_vld_en_g[2]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
dffre_s dffre_lsu_async_vld_en_w2_3 (
    .din (lsu_async_vld_en_g[3]),
    .q   (lsu_async_vld_en_w2[3]),
    .rst (pend_to_thrd3_reset),
    .en  (lsu_async_vld_en_g[3]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// assign trap type base on information send
assign dmmu_async_ttype[`TSA_TTYPE_WIDTH-1:0] = 
           {2'b0, lsu_tlu_async_ttype_g[6:0]};
// 
// derived the spill ttype
assign exu_spill_ttype[`TSA_TTYPE_WIDTH-1:0] =
           {3'b010,exu_tlu_spill_other,exu_tlu_spill_wtype[2:0], 2'b00}; 
//
// derived ffu_asynchronous ttype
// modified for bug 4084 - new ffu asynchronous trap type: 0x29
assign ffu_async_ttype[`TSA_TTYPE_WIDTH-1:0] = 
           (ffu_tlu_trap_ue) ? 9'h029:
	       ({7'b0001000, ffu_tlu_trap_other, ffu_tlu_trap_ieee754});
//
//
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_ttype0[`TSA_TTYPE_WIDTH-1:0] = 
		(exu_tlu_spill & spill_thrd0) ? 
         exu_spill_ttype[`TSA_TTYPE_WIDTH-1:0] :
		(((ffu_tlu_trap_other | ffu_tlu_trap_ieee754 | ffu_tlu_trap_ue) & fp_trap_thrd0) ? 
           ffu_async_ttype[`TSA_TTYPE_WIDTH-1:0] :
           dmmu_async_ttype[`TSA_TTYPE_WIDTH-1:0]);

// always flop if selected for thread.
// THREAD0
// added support for dmmu_async_traps
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_to_thrd0_en =
	       (exu_tlu_spill & spill_thrd0) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd0) |
           (lsu_async_vld_en_g[0] & ~lsu_async_vld_en_w2[0]) |
			cwp_cmplt0;				// cwp completion always pended.
//
// added for bug 5436 - Niagara 2.0
assign pend_pich_cnt_adj[0] =
	      ((exu_tlu_spill & spill_thrd0) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd0) |
           (lsu_async_vld_en_g[0] & ~lsu_async_vld_en_w2[0])) & pic_cnt_en[0];

// If there is no sync trap in a cycle, then the pending trap is taken.
assign	pend_to_thrd0_reset =
	local_rst | pending_thrd0_event_taken;

// Choose pending traps in round-robin order.
tlu_rrobin_picker       ptrap_rrobin      (
                .events         ({pending_trap3,pending_trap2,pending_trap1,pending_trap0}),
                .pick_one_hot   (pending_trap_sel[3:0]),
        // 
        // this siganl was modified to abide to the Niagara reset methodology
		        .tlu_rst_l		(tlu_rst_l),
                .clk            (clk)
        );           

// modified to arbitrate between wsr instruction and asynchronous events
// due to there is only one write port to tsa
// also modified for bug 1672
// modified for bug 3827
assign pending_thrd0_event_taken = 
            pending_trap_sel[0] & ~(sync_trap_taken_g | dnrtry_inst_g | 
            tsa_wr_tid_sel_g | ifu_thrd_flush_w[0] | (tlu_gl_rw_g & wsr_inst_g)); 

dffre_s #(12) dffre_pendthrd0 (
    .din ({pend_to_thrd0_en,pend_ttype0[8:0],cwp_cmplt0,exu_tlu_cwp_retry}), 
	.q   ({pending_trap0,pending_ttype0[8:0],cwp_cmplt0_pending,cwp_retry0}),
    .rst (pend_to_thrd0_reset), 
    .en  (pend_to_thrd0_en), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
// THREAD1
// added support for dmmu_async_traps
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_to_thrd1_en = 
	       (exu_tlu_spill & spill_thrd1) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd1) |
           (lsu_async_vld_en_g[1] & ~lsu_async_vld_en_w2[1]) |
			cwp_cmplt1;				// cwp completion always pended.
//
// added for bug 5436 - Niagara 2.0
assign pend_pich_cnt_adj[1] =
	      ((exu_tlu_spill & spill_thrd1) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd1) |
           (lsu_async_vld_en_g[1] & ~lsu_async_vld_en_w2[1])) & pic_cnt_en[1];

assign	pend_to_thrd1_reset =
	local_rst | pending_thrd1_event_taken;

// modified to arbitrate between wsr instruction and asynchronous events
// due to there is only one write port to tsa
//
// modified for bug 3827
assign pending_thrd1_event_taken = 
            pending_trap_sel[1] & ~(sync_trap_taken_g | dnrtry_inst_g | 
            tsa_wr_tid_sel_g | ifu_thrd_flush_w[1] | (tlu_gl_rw_g & wsr_inst_g)); 

//
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_ttype1[`TSA_TTYPE_WIDTH-1:0] = 
		(exu_tlu_spill & spill_thrd1) ? 
         exu_spill_ttype[`TSA_TTYPE_WIDTH-1:0] :
		(((ffu_tlu_trap_other | ffu_tlu_trap_ieee754 | ffu_tlu_trap_ue) & fp_trap_thrd1) ? 
           ffu_async_ttype[`TSA_TTYPE_WIDTH-1:0] :
           dmmu_async_ttype[`TSA_TTYPE_WIDTH-1:0]);

dffre_s #(12) dffre_pendthrd1 (
    .din ({pend_to_thrd1_en,pend_ttype1[8:0],cwp_cmplt1,exu_tlu_cwp_retry}), 
	.q   ({pending_trap1,pending_ttype1[8:0],cwp_cmplt1_pending,cwp_retry1}),
    .rst (pend_to_thrd1_reset), 
    .en  (pend_to_thrd1_en), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// THREAD2
// added support for dmmu_async_traps
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_to_thrd2_en = 
	       (exu_tlu_spill & spill_thrd2) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd2) |
           (lsu_async_vld_en_g[2] & ~lsu_async_vld_en_w2[2]) |
			cwp_cmplt2;				// cwp completion always pended.
//
// added for bug 5436 - Niagara 2.0
assign pend_pich_cnt_adj[2] =
	      ((exu_tlu_spill & spill_thrd2) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd2) |
           (lsu_async_vld_en_g[2] & ~lsu_async_vld_en_w2[2])) & pic_cnt_en[2];

assign	pend_to_thrd2_reset =
	local_rst | pending_thrd2_event_taken;

// modified to arbitrate between wsr instruction and asynchronous events
// due to there is only one write port to tsa
//
// modified for bug 3827
assign pending_thrd2_event_taken = 
            pending_trap_sel[2] & ~(sync_trap_taken_g | dnrtry_inst_g | 
            tsa_wr_tid_sel_g | ifu_thrd_flush_w[2] | (tlu_gl_rw_g & wsr_inst_g)); 

//
// modified for bug 4084 - new ffu_tlu_trap_ue
assign pend_ttype2[`TSA_TTYPE_WIDTH-1:0] = 
		(exu_tlu_spill & spill_thrd2) ? 
         exu_spill_ttype[`TSA_TTYPE_WIDTH-1:0] :
		(((ffu_tlu_trap_other | ffu_tlu_trap_ieee754 | ffu_tlu_trap_ue) & fp_trap_thrd2) ? 
           ffu_async_ttype[`TSA_TTYPE_WIDTH-1:0] :
           dmmu_async_ttype[`TSA_TTYPE_WIDTH-1:0]);

dffre_s #(12) dffre_pendthrd2 (
    .din ({pend_to_thrd2_en,pend_ttype2[8:0],cwp_cmplt2,exu_tlu_cwp_retry}), 
	.q   ({pending_trap2,pending_ttype2[8:0],cwp_cmplt2_pending,cwp_retry2}),
    .rst (pend_to_thrd2_reset), 
    .en  (pend_to_thrd2_en), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// THREAD3
// added support for dmmu_async_traps
// modified for bug 4084 - new ffu_tlu_trap_ue 
assign pend_to_thrd3_en = 
		   (exu_tlu_spill & spill_thrd3) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd3) |
           (lsu_async_vld_en_g[3] & ~lsu_async_vld_en_w2[3]) |
			cwp_cmplt3;				// cwp completion always pended.
//
// added for bug 5436 - Niagara 2.0
assign pend_pich_cnt_adj[3] =
	      ((exu_tlu_spill & spill_thrd3) |
		  ((ffu_tlu_trap_ieee754 | ffu_tlu_trap_other | ffu_tlu_trap_ue) & fp_trap_thrd3) |
           (lsu_async_vld_en_g[3] & ~lsu_async_vld_en_w2[3])) & pic_cnt_en[3];

assign	pend_to_thrd3_reset =
	local_rst |	pending_thrd3_event_taken; 

// modified to arbitrate between wsr instruction and asynchronous events
// due to there is only one write port to tsa
// modified for bug 3827
assign pending_thrd3_event_taken = 
            pending_trap_sel[3] & ~(sync_trap_taken_g | dnrtry_inst_g | 
            tsa_wr_tid_sel_g | ifu_thrd_flush_w[3] | (tlu_gl_rw_g & wsr_inst_g)); 

//
assign pend_ttype3[`TSA_TTYPE_WIDTH-1:0] = 
		(exu_tlu_spill & spill_thrd3) ? 
         exu_spill_ttype[`TSA_TTYPE_WIDTH-1:0] :
		(((ffu_tlu_trap_other | ffu_tlu_trap_ieee754 | ffu_tlu_trap_ue) & fp_trap_thrd3) ? 
           ffu_async_ttype[`TSA_TTYPE_WIDTH-1:0] :
           dmmu_async_ttype[`TSA_TTYPE_WIDTH-1:0]);
//
dffre_s #(12) dffre_pendthrd3 (
    .din ({pend_to_thrd3_en,pend_ttype3[8:0],cwp_cmplt3,exu_tlu_cwp_retry}), 
	.q   ({pending_trap3,pending_ttype3[8:0],cwp_cmplt3_pending,cwp_retry3}),
    .rst (pend_to_thrd3_reset), 
    .en  (pend_to_thrd3_en), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// added for bug 5436 - Niagara 2.0
//assign pich_cnt_hld_rst[`TLU_THRD_NUM-1:0] = 
//           (thread_inst_vld_w2[`TLU_THRD_NUM-1:0] & {4{pic_cnt_en_w2}} |
//           {4{local_rst}});  

// fix for 5436 for reopend bugs(9/8/2004) related to flushed inst reseting the hold
// and b2b valid instruction; the 1st one reseting the hold, but the 2nd not incrementing
// since the hold was not reset early to allow the 2nd inst to incr_pich.

assign pich_cnt_hld_rst_g[3:0] = 
			(thread_inst_vld_g[3:0] & {4{pic_cnt_en_w}}) &
			{4{~(lsu_ttype_vld_w | tlu_flush_all_w)}};


dff_s #(4) dff_pich_cnt_hld_rst_g (
    .din (pich_cnt_hld_rst_g[3:0]),
    .q   (pich_cnt_hld_rst_w2[3:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);


assign pend_pich_cnt_hld_early[3:0] = pend_pich_cnt_hld_q[3:0] & ~pich_cnt_hld_rst_w2[3:0];

assign pend_pich_cnt_hld[3:0] = pend_pich_cnt_hld_early[3:0];

// following is used in pib_wrap_m logic as per bug5436(reopened 9/17/04).
assign pend_pich_cnt_hld_noqual[3:0] = pend_pich_cnt_hld_q[3:0];

dffre_s dffre_pend_pich_cnt_adj_0 (
    .din (pend_pich_cnt_adj[0]),
	.q   (pend_pich_cnt_hld_q[0]),
    .rst (local_rst | pich_cnt_hld_rst_w2[0]), 
    .en  (pend_pich_cnt_adj[0]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_pend_pich_cnt_adj_1 (
    .din (pend_pich_cnt_adj[1]),
	.q   (pend_pich_cnt_hld_q[1]),
    .rst (local_rst | pich_cnt_hld_rst_w2[1]), 
    .en  (pend_pich_cnt_adj[1]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_pend_pich_cnt_adj_2 (
    .din (pend_pich_cnt_adj[2]),
	.q   (pend_pich_cnt_hld_q[2]),
    .rst (local_rst | pich_cnt_hld_rst_w2[2]), 
    .en  (pend_pich_cnt_adj[2]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_pend_pich_cnt_adj_3 (
    .din (pend_pich_cnt_adj[3]),
	.q   (pend_pich_cnt_hld_q[3]),
    .rst (local_rst | pich_cnt_hld_rst_w2[3]), 
    .en  (pend_pich_cnt_adj[3]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);


assign	trap_taken_g = 	thrd0_traps | thrd1_traps | thrd2_traps | thrd3_traps;
// 
// added for timing 
dff_s dff_trap_taken_w2 (
    .din (trap_taken_g), 	
    .q   (trap_taken_w2),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// Selection of traps should be round-robin.
assign	trap_tid_g[1:0] = 
    // lsu_defr_trap_g ? thrid_w2[1:0] :
	((sync_trap_taken_g) | (dnrtry_inst_g & cwp_fastcmplt_g))  ? thrid_g[1:0] :
			(pending_trap_sel[0] ? 2'b00 : 
				(pending_trap_sel[1] ? 2'b01 : 
					(pending_trap_sel[2] ? 2'b10 : 2'b11))); 

assign pend_trap_tid_g[1:0] = 
	       pending_trap_sel[0] ? 2'b00 : 
		       (pending_trap_sel[1] ? 2'b01 : 
			       (pending_trap_sel[2] ? 2'b10 : 
                        2'b11)); 

dff_s #(2) dff_pend_trap_tid_w2 (
    .din (pend_trap_tid_g[1:0]),
    .q   (pend_trap_tid_w2[1:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);


// Assume fixed priority for now. Should change to round-robin selection !!!

// modified for bug 1806
// modified to support lsu deferred traps - modified for timing
// modified for bug 4640 and 5127
//
assign	reset_sel_g = 
            rstint_g | (sir_inst_g & ~(lsu_defr_trap_g | pib_wrap_trap_g |
            (|tlz_trap_g[`TLU_THRD_NUM-1:0]))) | rst_tri_en;
            // rstint_g | (sir_inst_g & ~lsu_defr_trap_g) | rst_tri_en;
//
// added for timing
dffr_s dffr_reset_sel_w2 (
   .din (reset_sel_g),
   .q   (reset_sel_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);
// 
// modified for timing
// assign	reset_defr_id_g[6:0] =
assign	reset_id_g[2:0] =
local_rst ? 3'b001 :	
	rstint_g ? rstid_g[2:0] :
		sir_inst_g ? 3'b100 :  
                3'bxxx;

// recoded for timing
//
// construct the tba_ttype to determine the tba 
// the trap is hypervisor or supervisor traps
// modified for bug 3634 and timing

assign tba_ttype_sel_w2 = 
           final_ttype_sel_w2[0] | (hyper_wdr_trap_w2 & ~lsu_defr_trap_w2);  

mux2ds #(`TSA_TTYPE_WIDTH) mx_tba_ttype_w2 (
    .sel0 (tba_ttype_sel_w2),
    .sel1 (~tba_ttype_sel_w2),
    .in0  ({2'b0,rst_hwdr_ttype_w2[`TSA_TTYPE_WIDTH-3:0]}),
    .in1  (final_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .dout (tba_ttype_w1[`TSA_TTYPE_WIDTH-1:0])
); 
/*
assign tba_ttype_sel_g[0] = 
               (rstint_g | rst_tri_en | ((hwint_g | swint_g | hyper_wdr_trap | 
               (|tlz_trap_g[`TLU_THRD_NUM-1:0] | sir_inst_g) | pib_wrap_trap_g) & 
                inst_vld_g & ~lsu_defr_trap_g); 
assign tba_ttype_sel_g[1] = 
           (((ifu_ttype_vld_g |  exu_ttype_vld_g | va_oor_inst_acc_excp_g) |  
            (local_sync_trap_g & ~(lsu_tlu_priv_action_g | misalign_addr_ldst_atm_g))) & 
           ~(reset_sel_g | hwint_g | swint_g | hyper_wdr_trap | (|tlz_trap_g[`TLU_THRD_NUM-1:0])) & 
             inst_vld_g) & ~lsu_defr_trap_g & ~pib_wrap_trap_g;
assign tba_ttype_sel_g[2] = 
           (((lsu_tlu_ttype_vld_m2 & inst_vld_g) | va_oor_data_acc_excp_g) & 
           ~(|tba_ttype_sel_g[1:0])) | (lsu_defr_trap_g & ~(rstint_g | rst_tri_en)); 
assign tba_ttype_sel_g[3] = 
           ~(|tba_ttype_sel_g[2:0]); 

// added for timing
dffr_s #(4) dffr_tba_ttype_sel_w2 (
    .din (tba_ttype_sel_g[3:0]),
    .q   (tba_ttype_sel_w2[3:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
mux4ds #(`TSA_TTYPE_WIDTH) mx_tba_ttype_w2 (
    .sel0 (tba_ttype_sel_w2[0]),
    .sel1 (tba_ttype_sel_w2[1]),
    .sel2 (tba_ttype_sel_w2[2]),
    .sel3 (tba_ttype_sel_w2[3]),
    .in0  ({2'b0,rst_hwdr_ttype_w2[`TSA_TTYPE_WIDTH-3:0]}),
    .in1  (early_sync_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .in2  (adj_lsu_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .in3  (pending_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .dout (tba_ttype_w1[`TSA_TTYPE_WIDTH-1:0])
); 

dff_s #(`TSA_TTYPE_WIDTH) dff_tba_ttype_w1 (
    .din (tba_ttype_g[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (tba_ttype_w1[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
*/
//
// construct the final_ttype to be written into the trap stack 
// modified for bug 3634, 4640 and timing  
assign final_ttype_sel_g[0] = 
            (rstint_g | rst_tri_en) | ((hwint_g | swint_g | sir_inst_g |
            (|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g) & inst_vld_g &
            ~lsu_defr_trap_g);
//             reset_sel_g | ((hwint_g | swint_g |
//             (|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g) & inst_vld_g &
//             ~lsu_defr_trap_g);

assign final_ttype_sel_g[1] = 
           (((ifu_ttype_vld_g | exu_ttype_vld_g | va_oor_inst_acc_excp_g) |  
            (local_sync_trap_g & ~(lsu_tlu_priv_action_g | misalign_addr_ldst_atm_g))) & 
           ~(rstint_g | sir_inst_g  | hwint_g | swint_g | rst_tri_en | (|tlz_trap_g[`TLU_THRD_NUM-1:0])) & 
             inst_vld_g) & ~lsu_defr_trap_g & ~pib_wrap_trap_g; 
assign final_ttype_sel_g[2] = 
           ((lsu_tlu_ttype_vld_m2 & inst_vld_g) | va_oor_data_acc_excp_g)  & 
           ~(|final_ttype_sel_g[1:0]) | (lsu_defr_trap_g & ~(rst_tri_en | rstint_g)); 
assign final_ttype_sel_g[3] = 
           ~(|final_ttype_sel_g[2:0]);
//
// added for timing
dffr_s #(4) dffr_final_ttype_sel_w2 (
    .din (final_ttype_sel_g[3:0]),
    .q   (final_ttype_sel_w2[3:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// 
// modified for timing
/*
mux3ds #(`TSA_TTYPE_WIDTH) mx_adj_lsu_ttype_m2 (
    .sel0 (lsu_defr_trap_g),
    .sel1 (va_oor_data_acc_excp_g & ~lsu_defr_trap_g),
    .sel2 (~(va_oor_data_acc_excp_g | lsu_defr_trap_g)),
    .in0  ({2'b0, lsu_tlu_async_ttype_g[6:0]}),
    .in1  (9'h030),
    .in2  (lsu_tlu_ttype_m2),
    .dout (adj_lsu_ttype_m2[`TSA_TTYPE_WIDTH-1:0])
); 
*/
// added for timing 
dff_s #(`TSA_TTYPE_WIDTH) dff_lsu_tlu_ttype_w2 (
    .din (lsu_tlu_ttype_m2[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (lsu_tlu_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
//
/*
dff_s #(`TSA_TTYPE_WIDTH-2) dff_lsu_tlu_async_ttype_w2 (
    .din (lsu_tlu_async_ttype_g[`TSA_TTYPE_WIDTH-3:0]), 
    .q   (lsu_tlu_async_ttype_w2[`TSA_TTYPE_WIDTH-3:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
*/ 
mux3ds #(`TSA_TTYPE_WIDTH) mx_adj_lsu_ttype_w2 (
    .sel0 (lsu_defr_trap_w2),
    .sel1 (va_oor_data_acc_excp_w2 & ~lsu_defr_trap_w2),
    .sel2 (~(va_oor_data_acc_excp_w2 | lsu_defr_trap_w2)),
    // modified for bug 4561
    // .in0  ({2'b0, lsu_tlu_async_ttype_w2[6:0]}),
    .in0  (9'h032),
    .in1  (9'h030),
    .in2  (lsu_tlu_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .dout (adj_lsu_ttype_w2[`TSA_TTYPE_WIDTH-1:0])
); 
//
// modified for timing 
mux4ds #(`TSA_TTYPE_WIDTH) mx_final_ttype_w2 (
    .sel0 (final_ttype_sel_w2[0]),
    .sel1 (final_ttype_sel_w2[1]),
    .sel2 (final_ttype_sel_w2[2]),
    .sel3 (final_ttype_sel_w2[3]),
    .in0  ({2'b0,rst_ttype_w2[`TSA_TTYPE_WIDTH-3:0]}),
    .in1  (early_sync_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .in2  (adj_lsu_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .in3  (pending_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .dout (final_ttype_w2[`TSA_TTYPE_WIDTH-1:0])
); 
//
// modified for timing
/*
dff_s #(`TSA_TTYPE_WIDTH) dff_tlu_final_ttype_w2 (
    .din (final_ttype_g[`TSA_TTYPE_WIDTH-1:0]),
    .q   (final_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),
    .si  (),          
    .so  ()
);
*/

assign tlu_final_ttype_w2[`TSA_TTYPE_WIDTH-1:0] =
           final_ttype_w2[`TSA_TTYPE_WIDTH-1:0];
//
// added for timing
// pending trap type 
assign onehot_pending_ttype_sel = ~(|pending_trap_sel[2:0]);
//
mux4ds #(`TSA_TTYPE_WIDTH) mx_pending_ttype (
    .sel0 (pending_trap_sel[0]),
    .sel1 (pending_trap_sel[1]),
	.sel2 (pending_trap_sel[2]),
	.sel3 (onehot_pending_ttype_sel),
    .in0  (pending_ttype0[`TSA_TTYPE_WIDTH-1:0]),
    .in1  (pending_ttype1[`TSA_TTYPE_WIDTH-1:0]),
    .in2  (pending_ttype2[`TSA_TTYPE_WIDTH-1:0]),
    .in3  (pending_ttype3[`TSA_TTYPE_WIDTH-1:0]),
    .dout (pending_ttype[`TSA_TTYPE_WIDTH-1:0])
); 
//
// added for timing 
dff_s #(`TSA_TTYPE_WIDTH) dff_pending_ttype_w2 (
    .din (pending_ttype[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (pending_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
//
// modified for timing and bug 5117
assign rst_ttype_sel[0] = reset_sel_g; 
// modified for bug 5127
assign rst_ttype_sel[1] = 
           ((|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g); 
           // ~(rstint_g | rst_tri_en); 
           // ((|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g) & ~reset_sel_g; 
// assign rst_ttype_sel[2] = ~(|rst_ttype_sel[1:0]); 

// reset ttype  
// modified for bug 3634 and bug 3705
// modified for timing and bug 5117
assign rst_hwint_ttype_g[`TSA_TTYPE_WIDTH-3:0] = 
           (rst_ttype_sel[0])? {4'b00,reset_id_g[2:0]}:
          ((rst_ttype_sel[1])? wrap_tlz_ttype[6:0]:
            `HWINT_INT);  

dff_s #(`TSA_TTYPE_WIDTH-2) dff_rst_hwint_ttype_w2 (
    .din (rst_hwint_ttype_g[`TSA_TTYPE_WIDTH-3:0]),
    .q   (rst_hwint_ttype_w2[`TSA_TTYPE_WIDTH-3:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);

dffr_s dffr_rst_hwint_sel_w2 (
    .din ((|rst_ttype_sel[1:0]) | hwint_g),
    .q   (rst_hwint_sel_w2),
    .clk (clk),
    .se  (se),  
    .rst (local_rst),
    .si  (), 
    .so  ()
);

assign rst_ttype_w2[`TSA_TTYPE_WIDTH-3:0] =
       (rst_hwint_sel_w2)? rst_hwint_ttype_w2[`TSA_TTYPE_WIDTH-3:0]:
        final_swint_id_w2[`TSA_TTYPE_WIDTH-3:0];  
       
/*
mux3ds #(`TSA_TTYPE_WIDTH-2) mx_rst_ttype_g (
    .sel0  (rst_ttype_sel[0]),
    .sel1  (rst_ttype_sel[1]),
	.sel2  (rst_ttype_sel[2]),
    .in0 ({4'b00,reset_id_g[2:0]}),
    .in1 (wrap_tlz_ttype[6:0]),
    .in2 (hwint_swint_ttype[6:0]),
    .dout (rst_ttype_g[`TSA_TTYPE_WIDTH-3:0])
); 
//
// added for timing 
dff_s #(`TSA_TTYPE_WIDTH-2) dff_rst_ttype_w2 (
    .din (rst_ttype_g[`TSA_TTYPE_WIDTH-3:0]),
    .q   (rst_ttype_w2[`TSA_TTYPE_WIDTH-3:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
// modified for timing

assign rst_hwdr_ttype_sel[0] = reset_sel_g; 
assign rst_hwdr_ttype_sel[1] = hyper_wdr_trap & ~reset_sel_g;
assign rst_hwdr_ttype_sel[2] = 
           ((|tlz_trap_g[`TLU_THRD_NUM-1:0]) | pib_wrap_trap_g) & 
           ~(|rst_hwdr_ttype_sel[1:0]); 
assign rst_hwdr_ttype_sel[3] = ~(|rst_hwdr_ttype_sel[2:0]);

mux2ds #(`TSA_TTYPE_WIDTH-2) mx_hwint_swint_ttype (
    .sel0 (hwint_g),
    .sel1 (~hwint_g),
    .in0  (`HWINT_INT),
    .in1  (final_swint_id[6:0]),
    .dout (hwint_swint_ttype[6:0])
); 
*/

mux2ds #(`TSA_TTYPE_WIDTH-2) mx_wrap_tlz_ttype (
    .sel0 (|tlz_trap_g[`TLU_THRD_NUM-1:0]),
    .sel1 (~(|tlz_trap_g[`TLU_THRD_NUM-1:0])),
    .in0  (`TLZ_TRAP),
    .in1  (`PIB_OVERFLOW_TTYPE),
    .dout (wrap_tlz_ttype[6:0])
); 
//
// modified for timing
assign rst_hwdr_ttype_sel_w2 = hyper_wdr_trap_w2 & ~reset_sel_w2;

mux2ds #(`TSA_TTYPE_WIDTH-2) mx_rst_hwdr_ttype_w2 (
    .sel0  (rst_hwdr_ttype_sel_w2),
    .sel1  (~rst_hwdr_ttype_sel_w2),
    .in0 ({7'b0000010}),
    .in1 (rst_ttype_w2[`TSA_TTYPE_WIDTH-3:0]),
    .dout (rst_hwdr_ttype_w2[`TSA_TTYPE_WIDTH-3:0])
); 
//
/*
mux4ds #(`TSA_TTYPE_WIDTH-2) mx_rst_hwdr_ttype (
    .sel0  (rst_hwdr_ttype_sel[0]),
    .sel1  (rst_hwdr_ttype_sel[1]),
	.sel2  (rst_hwdr_ttype_sel[2]),
	.sel3  (rst_hwdr_ttype_sel[3]),
    .in0 ({4'b00,reset_id_g[2:0]}),
    .in1 ({7'b0000010}),
    .in2 (wrap_tlz_ttype[6:0]),
    .in3 (hwint_swint_ttype[6:0]),
    .dout (rst_hwdr_ttype_g[`TSA_TTYPE_WIDTH-3:0])
); 
//
// added for timing
dff_s #(`TSA_TTYPE_WIDTH-2) dff_rst_hwdr_ttype_w2 (
    .din (rst_hwdr_ttype_g[`TSA_TTYPE_WIDTH-3:0]), 
    .q   (rst_hwdr_ttype_w2[`TSA_TTYPE_WIDTH-3:0]),
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);
*/
//
// construct the early_ttype_g for timing to determine whether
// the trap is hypervisor or supervisor traps
// modified for bug 3646, 5117 and timing
assign early_ttype_sel[0] = 
             reset_sel_g | hwint_g | (|tlz_trap_g[`TLU_THRD_NUM-1:0]);
             // reset_sel_g | hwint_g | swint_g | (|tlz_trap_g[`TLU_THRD_NUM-1:0]);
assign early_ttype_sel[1] = 
            local_early_flush_pipe_w;
            // local_early_flush_pipe_w & ~(reset_sel_g | hwint_g | swint_g | 
            // (|tlz_trap_g[`TLU_THRD_NUM-1:0])); 
assign early_ttype_sel[2] = 
            ~inst_vld_nf_g | inst_ifu_flush_w | ~(|early_ttype_sel[1:0]);

assign early_ttype_g[`TSA_TTYPE_WIDTH-1:0] =
           (early_ttype_sel[2])? pending_ttype[`TSA_TTYPE_WIDTH-1:0]:
           (early_ttype_sel[0])? {2'b0,rst_hwint_ttype_g[`TSA_TTYPE_WIDTH-3:0]}:
           // (early_ttype_sel[0])? {2'b0,rst_ttype_g[`TSA_TTYPE_WIDTH-3:0]}:
            early_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0]; 
/*
assign early_ttype_sel[0] = 
            reset_sel_g | ((hwint_g | swint_g | (|tlz_trap_g[`TLU_THRD_NUM-1:0])) & 
            inst_vld_g) ; 
assign early_ttype_sel[1] = 
            (local_early_flush_pipe_w & ~ifu_tlu_flush_fd_w) & ~rst_tri_en & 
           ~((reset_sel_g | hwint_g | swint_g | (|tlz_trap_g[`TLU_THRD_NUM-1:0])) & inst_vld_g);
assign early_ttype_sel[2] = 
            ~(|early_ttype_sel[1:0]);
//
mux3ds #(`TSA_TTYPE_WIDTH) mx_early_ttype (
    .sel0 (early_ttype_sel[0]),
    .sel1 (early_ttype_sel[1]),
    .sel2 (early_ttype_sel[2]),
    .in0  ({2'b0,rst_ttype_g[`TSA_TTYPE_WIDTH-3:0]}),
    .in1  (early_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0]),
    .in2  (pending_ttype[`TSA_TTYPE_WIDTH-1:0]),
    .dout (early_ttype_g[`TSA_TTYPE_WIDTH-1:0])
); 
*/
//
// recoded for timing
assign final_offset_en_g[0] = trap_to_redmode & ~(sir_inst_g | internal_wdr);
assign final_offset_en_g[1] = internal_wdr & ~final_offset_en_g[0]; 
// modified due to one-hot mux bug
// assign final_offset_en_g[2] = ~(|final_offset_en_g[1:0]); 

dffr_s #(2) dffr_final_offset_en_w1 (
    .din (final_offset_en_g[1:0]), 
    .q   (final_offset_en_w1[1:0]),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so  ()
);

assign final_offset_sel_w1[2] = 
           ~(|final_offset_sel_w1[1:0]);
assign final_offset_sel_w1[1] = 
           final_offset_en_w1[1] & ~rst_tri_en;
assign final_offset_sel_w1[0] = 
           final_offset_en_w1[0] & ~rst_tri_en;

mux3ds #(`TSA_TTYPE_WIDTH) mx_final_offset_w1 (
    .sel0 (final_offset_sel_w1[0]),
    .sel1 (final_offset_sel_w1[1]),
    .sel2 (final_offset_sel_w1[2]),
    .in0  (9'b000000101),
    .in1  (9'b000000010),
    .in2  (tba_ttype_w1[`TSA_TTYPE_WIDTH-1:0]),
    .dout (final_offset_w1[`TSA_TTYPE_WIDTH-1:0])
); 

assign tlu_final_offset_w1[`TSA_TTYPE_WIDTH-1:0] =
           final_offset_w1[`TSA_TTYPE_WIDTH-1:0];
// 
// generating the trap pc and trap npc
// This section has been modified due to bug 3017 
// pc and npc has been changed from 48 -> 49 bits
// added for one-hot mux problem
assign tlu_pc_mxsel_w2[0] = 
           tlu_self_boot_rst_w2 | rst_tri_en; 
// modified for bug 3710
assign tlu_pc_mxsel_w2[1] = 
           local_select_tba_w2 & ~(rst_tri_en | tlu_self_boot_rst_w2); 
assign tlu_pc_mxsel_w2[2] = 
           ~(|tlu_pc_mxsel_w2[1:0]); 
//
/* logic moved to tlu_misctl
assign	normal_trap_pc_w1 [48:0] = 
            {1'b0, tlu_partial_trap_pc_w1[33:0],final_offset_w1[`TSA_TTYPE_WIDTH-1:0],
             5'b00000};
assign	normal_trap_npc_w1[48:0] = 
            {1'b0, tlu_partial_trap_pc_w1[33:0],final_offset_w1[`TSA_TTYPE_WIDTH-1:0],
             5'b00100};
//
// code moved from tlu_tdp
mux2ds #(49) mx_trap_pc_w1 (
       .in0  (normal_trap_pc_w1[48:0]), 
       .in1  (tlu_restore_pc_w1[48:0]),
       .sel0 (~restore_pc_sel_w1),  
       .sel1 (restore_pc_sel_w1),
       .dout (trap_pc_w1[48:0])
);           
//
dff_s #(49) dff_trap_pc_w2 (
    .din (trap_pc_w1[48:0]), 	
    .q   (trap_pc_w2[48:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_ifu_trappc_w2[48:0] = trap_pc_w2[48:0];

mux2ds #(49) mx_trap_npc_w1 (
       .in0  (normal_trap_npc_w1[48:0]), 
       .in1  (tlu_restore_npc_w1[48:0]),
       .sel0 (~restore_pc_sel_w1),  
       .sel1 (restore_pc_sel_w1),
       .dout (trap_npc_w1[48:0])
);           
//
dff_s #(49) dff_trap_npc_w2 (
    .din (trap_npc_w1[48:0]), 	
    .q   (trap_npc_w2[48:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_ifu_trapnpc_w2[48:0] = trap_npc_w2[48:0];
*/

// determine whether to generate a watch-dog reset using htba as the 
// trap base address instead of the watch-dog reset vector
// added for bug 1894 and modified for bug 1964
// modified for timing 
assign hyper_wdr_early_trap_g = ((true_trap_tid_g[1:0] == 2'b00) ? 
               (tlu_hpstate_enb[0] & ~tlu_hpstate_priv[0] & trp_lvl_at_maxstl[0]):
              ((true_trap_tid_g[1:0] == 2'b01) ? 
                   (tlu_hpstate_enb[1] & ~tlu_hpstate_priv[1] & trp_lvl_at_maxstl[1]):
                  ((true_trap_tid_g[1:0] == 2'b10) ? 
                       (tlu_hpstate_enb[2] & ~tlu_hpstate_priv[2] & trp_lvl_at_maxstl[2]):
                       (tlu_hpstate_enb[3] & ~tlu_hpstate_priv[3] & trp_lvl_at_maxstl[3]))));

dffr_s dffr_hyper_wdr_early_trap_w2 (
   .din (hyper_wdr_early_trap_g),
   .q   (hyper_wdr_early_trap_w2),
   .rst (local_rst),
   .clk (clk),
   .se  (se),       
   .si  (),          
   .so  ()
);

assign hyper_wdr_trap_w2 = 
           hyper_wdr_early_trap_w2 & (tlu_priv_traps_w2 & ~lsu_defr_trap_w2);  
//
// detetermine whehter the trapping thread is in hyperlite mode or is at
// maxstl
// modified for timing and bug 4779
/*
assign tlu_trap_to_hyper_g =  
           (true_trap_tid_g[1:0] == 2'b00) ? 
               (~tlu_hpstate_enb[0] | tlu_hpstate_priv[0] | trp_lvl_gte_maxstl[0]):
              ((true_trap_tid_g[1:0] == 2'b01) ? 
                   (~tlu_hpstate_enb[1] | tlu_hpstate_priv[1] | trp_lvl_gte_maxstl[1]):
                  ((true_trap_tid_g[1:0] == 2'b10) ? 
                       (~tlu_hpstate_enb[2] | tlu_hpstate_priv[2] | trp_lvl_gte_maxstl[2]):
                       (~tlu_hpstate_enb[3] | tlu_hpstate_priv[3] | trp_lvl_gte_maxstl[3])));
*/
//
assign tlu_trap_to_hyper_g =  
           (true_trap_tid_g[1:0] == 2'b00) ? 
               (~tlu_hpstate_enb[0] | tlu_hpstate_priv[0] | 
                 trp_lvl_gte_maxstl[0] | (tlz_trap_g[0] & inst_vld_g)):
              ((true_trap_tid_g[1:0] == 2'b01) ? 
                   (~tlu_hpstate_enb[1] | tlu_hpstate_priv[1] | 
                     trp_lvl_gte_maxstl[1] | (tlz_trap_g[1] & inst_vld_g)):
                  ((true_trap_tid_g[1:0] == 2'b10) ? 
                       (~tlu_hpstate_enb[2] | tlu_hpstate_priv[2] | 
                         trp_lvl_gte_maxstl[2] | (tlz_trap_g[2] & inst_vld_g)):
                       (~tlu_hpstate_enb[3] | tlu_hpstate_priv[3] | 
                         trp_lvl_gte_maxstl[3] | (tlz_trap_g[3] & inst_vld_g))));
// added for timing
dffr_s dffr_tlu_tlu_trap_to_hyper_w2 (
    .din (tlu_trap_to_hyper_g),
    .q   (tlu_trap_to_hyper_w2),
    .clk (clk),
    .rst (local_rst),
    .se  (se),       
    .si  (),          
    .so  ()
);
                          
// recoded for timing
assign select_tba_element_w2[0] =
           ~(tlu_trap_to_hyper_w2 | lsu_defr_trap_w2) & tlu_early_priv_element_w2[0];
assign select_tba_element_w2[1] =
           ~tlu_trap_to_hyper_w2 & (|tlu_early_priv_element_w2[2:1]) & ~lsu_defr_trap_w2;
assign local_select_tba_w2 = 
           ~tlu_trap_to_hyper_w2 & (tlu_priv_traps_w2 & ~lsu_defr_trap_w2); 
assign tdp_select_tba_w2 = local_select_tba_w2;
assign tlu_select_tba_w2 = 
           select_tba_element_w2[1] | (select_tba_element_w2[0] & ~lsu_ttype_vld_w2);
           
/*
dffr_s dffr_tlu_select_tba_w2 (
    .din (select_tba_g),
    .q   (tlu_select_tba_w2),
    .clk (clk),
    .rst (local_rst),
    .se  (se),       
    .si  (),          
    .so  ()
);
*/
//
// added for bug 2064 and modified for bug 2165
// modified for bug3719
assign early_priv_traps_g = 
           ((early_ttype_g[8:4] == 5'b00001)    & (|early_ttype_g[3:0])) | 
           ((early_ttype_g[8:4] == 5'b00100)    & (|early_ttype_g[3:0])) | 
           ((early_ttype_g[8:4] == 5'b00010)    & ~(early_ttype_g[3] & early_ttype_g[0]))|  
           ((early_ttype_g[8:2] == 7'b0011000)  & (early_ttype_g[1] ^ early_ttype_g[0])) | 
           ((early_ttype_g[8:4] == 5'b00111)    & (early_ttype_g[3:2]== 2'b11))       | 
           (early_ttype_g[8] & ~early_ttype_g[7]) | (early_ttype_g[7] & ~early_ttype_g[8]) |
           (pib_wrap_trap_g & ~(|tlz_trap_g[`TLU_THRD_NUM-1:0]) & inst_vld_g) | 
           (swint_g & ~(|tlz_trap_g[`TLU_THRD_NUM-1:0]) & inst_vld_g); 

assign exu_hyper_traps_g = 
           exu_ttype_vld_g & ((early_ttype_g[8:0] == 9'h029) | (early_ttype_g[8:0] == 9'h034));

//
// modified for timing

assign tlu_early_priv_element_g[0] = 
          early_priv_traps_g & early_ttype_sel[2]; 
assign tlu_early_priv_element_g[1] = 
           early_priv_traps_g & ~early_ttype_sel[2];
// modified for bug 4431, 4443
assign tlu_early_priv_element_g[2] = 
          lsu_tlu_wtchpt_trp_g & ~(misalign_addr_jmpl_rtn_g | misalign_addr_ldst_atm_g | 
          ifu_ttype_vld_g | exu_hyper_traps_g | lsu_tlu_priv_action_g);
//          lsu_tlu_wtchpt_trp_g & ~(lsu_tlu_priv_violtn_g | misalign_addr_jmpl_rtn_g |
//
// modified for added for timing
dffr_s #(3) dffr_tlu_early_priv_element_w2 (
    .din (tlu_early_priv_element_g[2:0]),
	.q   (tlu_early_priv_element_w2[2:0]),
    .clk (clk),
    .rst (local_rst), 
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_priv_traps_w2 =
            tlu_early_priv_element_w2[0] & ~lsu_ttype_vld_w2 |
            tlu_early_priv_element_w2[1] |
            tlu_early_priv_element_w2[2]; 

dffr_s dffr_tlu_self_boot_rst_w2 (
    .din (tlu_self_boot_rst_g),
	.q   (tlu_self_boot_rst_w2),
    .clk (clk),
    .rst (local_rst), 
    .se  (se),       
    .si  (),          
    .so  ()
);

//=========================================================================================
//	Generate TSA Control and Data
//=========================================================================================

// MODIFY : keep 2b tid
// added for tsa_wr_tid bug
// modified for hypervisor support  and logic loop 
// modified for timing
//
assign tsa_wr_tid_sel_g = 
           wsr_inst_g_unflushed & inst_vld_g & (tstate_rw_g | tpc_rw_g | 
           tnpc_rw_g  | ttype_rw_g | tlu_htstate_rw_g); 

// added for timing

assign tsa_wr_tid_sel_tim_g = 
           (((wsr_inst_g & (tstate_rw_g | tpc_rw_g | 
            tnpc_rw_g  | ttype_rw_g | tlu_htstate_rw_g)) |
           ((retry_inst_g | done_inst_g) & cwp_fastcmplt_g)) &
            inst_vld_g) | sync_trap_taken_g ; 

dffr_s dffr_tsa_wr_tid_sel_w2 (
    .din (tsa_wr_tid_sel_tim_g),
	.q   (tsa_wr_tid_sel_w2),
    .clk (clk),
    .rst (local_rst),
    .se  (se),
    .si  (),
    .so  ()
);
/*
assign tsa_wr_tid_sel_w2 = 
           (((wsr_inst_w2 & (tstate_rw_w2 | tpc_rw_w2 | 
            tnpc_rw_w2  | ttype_rw_w2 | htstate_rw_w2)) |
           ((retry_inst_w2 | done_inst_w2) & cwp_fastcmplt_w2)) &
            inst_vld_w2) | sync_trap_taken_w2 ; 
*/
//
// added for timing
assign	thrid_w2[0] = thread1_wsel_w2 | thread3_wsel_w2;
assign	thrid_w2[1] = thread2_wsel_w2 | thread3_wsel_w2;
//
// 
// modified for bug 4403
/*
mux2ds #(2) mx_tsa_wr_tid (
    .in0  (pend_trap_tid_w2[1:0]),
	.in1  (thrid_w2[1:0]),
    .sel0 (~tsa_wr_tid_sel_w2),  		
    .sel1 (tsa_wr_tid_sel_w2),
    .dout (tsa_wr_tid[1:0])
);
*/
// modified for bug 4403 dn 4443
assign tsa_wr_tid[1:0] = 
           (tsa_wr_tid_sel_w2 & lsu_defr_trap_w2) ? true_trap_tid_w2[1:0]:
           ((tsa_wr_tid_sel_w2 & ~lsu_defr_trap_w2)? thrid_w2[1:0] :
             pend_trap_tid_w2[1:0]);

// tsa should not be written by certain resets. May have to extend to wrm etc. !!!
// modified due to the swap of memory from tlu_tsa -> bw_r_rf32x144 -> 2x bw_r_rf32x80
// modified for bug 3384
assign	tsa_wr_vld[0] = 	
             trap_taken_w2 | local_rst |               // a thread traps
			((tpc_rw_w2 | tstate_rw_w2) & wsr_inst_w2); // wrpr-tsa

assign	tsa_wr_vld[1] = 	
 			 trap_taken_w2 | local_rst   | 		        // a thread traps
			((tnpc_rw_w2   | ttype_rw_w2 | 
             htstate_rw_w2) & wsr_inst_w2); // wrpr-tsa
// 
// modified due to timing all w stage signals have been moved to w2	
assign	tsa_pc_en  	    = 	tpc_rw_w2  	 | trap_taken_w2;
assign	tsa_npc_en  	= 	tnpc_rw_w2 	 | trap_taken_w2;
assign	tsa_tstate_en  	= 	tstate_rw_w2 | trap_taken_w2;
assign	tsa_ttype_en  	= 	ttype_rw_w2  | trap_taken_w2 | local_rst;
//
// added for hypervisor support
assign	tsa_htstate_en  = 	htstate_rw_w2 | trap_taken_w2;

// Should all these regs enable a read of the tsa ?
assign	tsa_rd_vld = 	ifu_tlu_done_inst_d | ifu_tlu_retry_inst_d | // done/retry
			(tpc_rw_d | tnpc_rw_d | tstate_rw_d | ttype_rw_d |
			 // tick_rw_d | tba_rw_d | pstate_rw_d | tl_rw_d    |
             tlu_htstate_rw_d) & ifu_tlu_rsr_inst_d; // rdpr-tsa
//
// added for timing
dff_s dff_tsa_rd_vld_e ( 
    .din (tsa_rd_vld),
	.q   (tsa_rd_vld_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// added for timing
assign	tsa_rd_en = ifu_tlu_done_inst_d | ifu_tlu_retry_inst_d | // done/retry
                    (~(|sraddr2[4:2]) & ifu_tlu_rsr_inst_d); // rdpr-tsa
// 
dff_s #(`TLU_THRD_NUM) dff_thread_wsel_w2 (
    .din ({thread3_wsel_g, thread2_wsel_g, thread1_wsel_g, thread0_wsel_g}),
    .q   ({thread3_wsel_w2, thread2_wsel_w2, thread1_wsel_w2, thread0_wsel_w2}),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign	tlu_thread_wsel_g[0] = thread0_rsel_dec_g; 
assign	tlu_thread_wsel_g[1] = thread1_rsel_dec_g; 
assign	tlu_thread_wsel_g[2] = thread2_rsel_dec_g; 
assign	tlu_thread_wsel_g[3] = thread3_rsel_dec_g; 
//
// Added for tsa_wr_tid bug
//
assign	thread0_wtrp_w2 = ~tsa_wr_tid[1] & ~tsa_wr_tid[0];
assign	thread1_wtrp_w2 = ~tsa_wr_tid[1] &  tsa_wr_tid[0];
assign	thread2_wtrp_w2 =  tsa_wr_tid[1] & ~tsa_wr_tid[0];
assign	thread3_wtrp_w2 =  tsa_wr_tid[1] &  tsa_wr_tid[0];

// write uses trp-lvl after increment.
mux4ds #(3) tsawthrd (
   .in0  (trp_lvl0_new[2:0]),
   .in1  (trp_lvl1_new[2:0]),
   .in2  (trp_lvl2_new[2:0]),
   .in3  (trp_lvl3_new[2:0]),
   .sel0 (thread0_wtrp_w2),
   .sel1 (thread1_wtrp_w2),
   .sel2 (thread2_wtrp_w2),
   .sel3 (thread3_wtrp_w2),
   .dout (tsa_wr_tpl[2:0])
); 

// rd use trp-lvl prior to decrement.
mux4ds  #(3) tsarthrd (
        .in0    (trp_lvl0[2:0]),
        .in1    (trp_lvl1[2:0]),
        .in2    (trp_lvl2[2:0]),
        .in3    (trp_lvl3[2:0]),
        .sel0   (thread0_rsel_d),
        .sel1   (thread1_rsel_d),
        .sel2   (thread2_rsel_d),
        .sel3   (thread3_rsel_d),
        .dout   (tsa_rd_tpl[2:0])
); 

assign	tsa_rd_tid[1:0]  = thrid_d[1:0];

//=========================================================================================
//      TT initial state
//=========================================================================================

// The initial state of TT should be 1 on por. Since this is required for 4 thread,
// it will be difficult to do this thru a write to the tsa while reset is occuring.
// Instead a bit will be used to mark whether the tt for a thread has been written to.
// If it hasn't then a '1' has to be inserted into the 
dff_s dff_rst_d1 (
    .din (local_rst),
    .q   (reset_d1),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign  tt_init_en =  reset_d1 & tlu_rst_l;
//
// modified for timing all g stage signals have been move to w2
assign  tt_init_rst[0] =  
            local_rst | (tsa_ttype_en & (|tsa_wr_vld[1:0]) & thread0_wtrp_w2);
assign  tt_init_rst[1] =  
            local_rst | (tsa_ttype_en & (|tsa_wr_vld[1:0]) & thread1_wtrp_w2);
assign  tt_init_rst[2] =  
            local_rst | (tsa_ttype_en & (|tsa_wr_vld[1:0]) & thread2_wtrp_w2);
assign  tt_init_rst[3] =  
            local_rst | (tsa_ttype_en & (|tsa_wr_vld[1:0]) & thread3_wtrp_w2);

assign	lsu_tlu_rsr_data_mod_e[7:0] = ttype_unwritten_sel ? 8'b0000_0001 : lsu_tlu_rsr_data_e[7:0];

dffre_s dffre_tt_init0  (
    .din (tt_init_en), 
    .q   (tt_unwritten[0]),
    .rst (tt_init_rst[0]),
    .en  (tt_init_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_tt_init1  (
    .din (tt_init_en), 
    .q   (tt_unwritten[1]),
    .rst (tt_init_rst[1]),
    .en  (tt_init_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_tt_init2  (
    .din (tt_init_en), 
    .q   (tt_unwritten[2]),
    .rst (tt_init_rst[2]),
    .en  (tt_init_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffre_tt_init3  (
    .din (tt_init_en), 
    .q   (tt_unwritten[3]),
    .rst (tt_init_rst[3]),
    .en  (tt_init_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
//	Decode SR Addr
//=========================================================================================

// **Exceptions for Write/Reads of Privileged/State Register**
// WRPR:
// - Access to reserved rd fields will cause exception. Done by IFU.
// - A write to TPC, TNPC, TT or TSTATE when the trap level is zero
// (TL=0) causes an illegal_instruction exception.
// - privileged opcode. Use privilege bit in sraddr for exception.
// WRSR :
// - privileged opcode. wrasr only - implementation dependent.
// - illegal inst - done by IFU.
// RDPR :
// - A read from TPC, TNPC, TT or TSTATE when the trap level is zero
// (TL=0) causes an illegal_instruction exception.
// - Access to reserved rs1 fields causes an illegal_inst exception.
// - privileged opcode.
// RDSR :
// - privileged opcode. rdasr only - implementation dependent.
// - Access to reserved rs1 fields causes an illegal_inst exception.
assign	sraddr[`TLU_ASR_ADDR_WIDTH-1:0]	=	
            ifu_tlu_sraddr_d[`TLU_ASR_ADDR_WIDTH-1:0];
assign	sraddr2[`TLU_ASR_ADDR_WIDTH-1:0] =	
            sraddr[`TLU_ASR_ADDR_WIDTH-1:0];
//
// added for hypervisor support
assign  asr_hyperp  =   sraddr2[6];
assign  asr_priv    =   sraddr2[5]; 

assign	stickcmp_rw_d 	=  sraddr2[4] & sraddr2[3] &  ~sraddr2[2] &  ~sraddr2[1] &  sraddr2[0] &
			~asr_priv;	// 
assign	stick_rw_d = sraddr2[4] & sraddr2[3] &  ~sraddr2[2] & ~sraddr2[1] & ~sraddr2[0]; 

assign	tpc_rw_d 	= ~sraddr[4] & ~sraddr[3] & ~sraddr[2] & ~sraddr[1] & ~sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	tnpc_rw_d 	= ~sraddr[4] & ~sraddr[3] & ~sraddr[2] & ~sraddr[1] &  sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	tstate_rw_d 	= ~sraddr[4] & ~sraddr[3] & ~sraddr[2] &  sraddr[1] & ~sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	ttype_rw_d 	= ~sraddr[4] & ~sraddr[3] & ~sraddr[2] &  sraddr[1] &  sraddr[0] &
			asr_priv;	// =1 ; privileged.

// stick and tick are refering to the same register.  
// - privileged action - rdtick only.
assign	tick_rw_d 	= ((~sraddr2[4] & ~sraddr2[3] &  sraddr2[2] & ~sraddr2[1] & ~sraddr2[0]) | 
                        stick_rw_d) & ~asr_hyperp; // =1 ; privileged.
// 
// modified for bug 1293
// qualified with the rsr read
assign	tick_npriv_r_d = (~sraddr2[4] & ~sraddr2[3] &  sraddr2[2] & ~sraddr2[1] & ~sraddr2[0] |
                          stick_rw_d) & ~asr_priv & ifu_tlu_rsr_inst_d;	// =0; non-privileged.

assign	tickcmp_rw_d 	=  sraddr2[4] & ~sraddr2[3] &  sraddr2[2] &  sraddr2[1] &  sraddr2[0] &
			~asr_priv;	// 
assign	tba_rw_d 	= ~sraddr[4] & ~sraddr[3] &  sraddr[2] & ~sraddr[1] &  sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	pstate_rw_d 	= ~sraddr[4] & ~sraddr[3] &  sraddr[2] &  sraddr[1] & ~sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	tl_rw_d 	= ~sraddr[4] & ~sraddr[3] &  sraddr[2] &  sraddr[1] &  sraddr[0] &
			asr_priv;	// =1 ; privileged.
assign	pil_rw_d 	= ~sraddr2[4] &  sraddr2[3] & ~sraddr2[2] & ~sraddr2[1] & ~sraddr2[0] &
			asr_priv;	// =1 ; privileged.
assign	set_sftint_d 	=  sraddr2[4] &  ~sraddr2[3] & sraddr2[2] & ~sraddr2[1] & ~sraddr2[0] &
                           ~(asr_priv | asr_hyperp);
assign	clr_sftint_d 	=  sraddr2[4] &  ~sraddr2[3] & sraddr2[2] & ~sraddr2[1] &  sraddr2[0] & 
                           ~(asr_priv | asr_hyperp);
assign	sftint_rg_rw_d  =  sraddr2[4] &  ~sraddr2[3] & sraddr2[2] &  sraddr2[1] & ~sraddr2[0] &
                           ~(asr_priv | asr_hyperp);
//
// pib register decodes
assign pcr_rsr_d = 
           (sraddr[`TLU_ASR_ADDR_WIDTH-1:0] == `PCR_ASR_ADDR); 
assign pic_rsr_d = 
           ((sraddr[`TLU_ASR_ADDR_WIDTH-1:0] == `PIC_ASR_PRIV_ADDR) |
            (sraddr[`TLU_ASR_ADDR_WIDTH-1:0] == `PIC_ASR_NPRIV_ADDR));

// Bug 818 fix: The qualification to sraddr[5] is removed due to the sftint and tick_cmp registers
// are priveledged write state registers and not priveledged registers, therefore, the sraddr[5] is 
// not asserted for these
// modified due to timing
// assign	wsr_inst_d	= ifu_tlu_wsr_inst_d; 
//
// added for bug 1293
          
// Stage to E1.

dff_s dff_tpc_rw_e (
    .din (tpc_rw_d),
    .q   (tpc_rw_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tnpc_rw_e (
    .din (tnpc_rw_d),
    .q   (tnpc_rw_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tstate_rw_e (
    .din (tstate_rw_d),
    .q   (tstate_rw_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_ttype_rw_e (
    .din (ttype_rw_d),
    .q   (ttype_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tick_rw_e (
    .din (tick_rw_d),
    .q   (tick_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tick_npriv_r_e (
    .din (tick_npriv_r_d),
    .q   (tick_npriv_r_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tickcmp_rw_e (
    .din (tickcmp_rw_d),
    .q   (tickcmp_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tba_rw_e (
    .din (tba_rw_d),
    .q   (tba_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_pstate_rw_e (
    .din (pstate_rw_d),
    .q   (pstate_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tl_rw_d_e (
    .din (tl_rw_d),
    .q   (tl_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_pil_rw_d_e (
    .din (pil_rw_d),
    .q   (pil_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_set_sftint_e (
    .din (set_sftint_d),
    .q   (set_sftint_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_clr_sftint_e (
    .din (clr_sftint_d),
    .q   (clr_sftint_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_sftint_rg_rw_e (
    .din (sftint_rg_rw_d),
    .q   (sftint_rg_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s dff_pcr_rsr_e (
    .din (pcr_rsr_d),
    .q   (pcr_rsr_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s dff_pic_rsr_e (
    .din (pic_rsr_d),
    .q   (pic_rsr_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// modified due to timing
/*
dff_s dff_wsr_inst_d_e (
    .din (wsr_inst_d),
    .q   (wsr_inst_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
*/
assign	wsr_inst_e	= lsu_tlu_wsr_inst_e; 

dff_s dff_stickcmp_rw_e (
    .din (stickcmp_rw_d),
    .q   (stickcmp_rw_e),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
// Stage to E2.

dff_s dff_tpc_rw_m (
   .din (tpc_rw_e),
   .q   (tpc_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tnpc_rw_m (
   .din (tnpc_rw_e),
   .q   (tnpc_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tstate_rw_m (
    .din (tstate_rw_e),
    .q   (tstate_rw_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_ttype_rw_m (
   .din (ttype_rw_e),
   .q   (ttype_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tick_rw_m (
   .din (tick_rw_e),
   .q   (tick_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tick_npriv_r_m (
   .din (tick_npriv_r_e),
   .q   (tick_npriv_r_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tickcmp_rw_m (
   .din (tickcmp_rw_e),
   .q   (tickcmp_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
//
// added for timing - moved from hypervisor
dff_s dff_htickcmp_rw_m_m (
    .din (tlu_htickcmp_rw_e),
    .q   (htickcmp_rw_m),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tba_rw_m (
   .din (tba_rw_e),
   .q   (tba_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_pstate_rw_m (
   .din (pstate_rw_e),
   .q   (pstate_rw_m),
   .clk (clk),
   .se  (se),
   .si  (),
   .so  ()
);
						
dff_s dff_tl_rw_m (
    .din (tl_rw_e),
    .q   (tl_rw_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_pil_rw_m (
    .din (pil_rw_e),
    .q   (pil_rw_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_set_sftint_m (
    .din (set_sftint_e),
    .q   (set_sftint_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_clr_sftint_m (
    .din (clr_sftint_e),
    .q   (clr_sftint_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_sftint_rg_rw_m (
    .din (sftint_rg_rw_e),
    .q   (sftint_rg_rw_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_wsr_inst_m (
    .din (wsr_inst_e),
    .q   (wsr_inst_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// added for hypervisor support
dff_s dff_stickcmp_rw_m (
    .din (stickcmp_rw_e),
    .q   (stickcmp_rw_m),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s dff_tpc_rw_g (
    .din (tpc_rw_m),
    .q   (tpc_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tnpc_rw_g (
    .din (tnpc_rw_m),
    .q   (tnpc_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tstate_rw_g (
    .din (tstate_rw_m),
    .q   (tstate_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_ttype_rw_g (
    .din (ttype_rw_m),
    .q   (ttype_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tick_rw_g (
    .din (tick_rw_m),
    .q   (tick_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tick_npriv_r_g (
     .din (tick_npriv_r_m),
     .q   (tick_npriv_r_g),
     .clk (clk),
     .se  (se),
     .si  (),
     .so  ()
);
						
dff_s dff_tickcmp_rw_g (
     .din (tickcmp_rw_m),
     .q   (tickcmp_rw_g),
     .clk (clk),
     .se  (se),
     .si  (),
     .so  ()
);
//
// added for timing - moved form hyperv
dff_s dff_htickcmp_rw_m_g (
    .din (htickcmp_rw_m),
    .q   (htickcmp_rw_g),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
						
dff_s dff_tba_rw_g (
     .din (tba_rw_m),
     .q   (tba_rw_g),
     .clk (clk),
     .se  (se),
     .si  (),
     .so  ()
);
						
dff_s dff_pstate_rw_g (
    .din (pstate_rw_m),
    .q   (pstate_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_pstate_rw_w2 (
    .din (pstate_rw_g),
    .q   (pstate_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_tl_rw_g (
    .din (tl_rw_m),
    .q   (tl_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_tl_rw_w2 (
    .din (tl_rw_g),
    .q   (tl_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_pil_rw_g (
    .din (pil_rw_m),
    .q   (pil_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_tpc_rw_w2 (
    .din (tpc_rw_g),
    .q   (tpc_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tnpc_rw_w2 (
    .din (tnpc_rw_g),
    .q   (tnpc_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_tstate_rw_w2 (
    .din (tstate_rw_g),
    .q   (tstate_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_ttype_rw_w2 (
    .din (ttype_rw_g),
    .q   (ttype_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_htstate_rw_w2 (
    .din (tlu_htstate_rw_g),
    .q   (htstate_rw_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_set_sftint_g (
    .din (set_sftint_m),
    .q   (set_sftint_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_clr_sftint_g (
    .din (clr_sftint_m),
    .q   (clr_sftint_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_sftint_rg_rw_g (
    .din (sftint_rg_rw_m),
    .q   (sftint_rg_rw_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
						
dff_s dff_wsr_inst_g (
    .din (wsr_inst_m),
    .q   (wsr_inst_g_unflushed),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s dff_wsr_inst_w2 (
    .din (wsr_inst_g),
    .q   (wsr_inst_w2),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dff_s dff_tlu_gl_rw_g (
    .din (tlu_gl_rw_m),
    .q   (tlu_gl_rw_g),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

//
// added for hypervisor support
dff_s dff_stickcmp_rw_g (
    .din (stickcmp_rw_m),
    .q   (stickcmp_rw_g),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// modified due to timing violations						
// assign	wsr_inst_g = wsr_inst_g_unflushed & ~tlu_ifu_flush_pipe_w & inst_vld_g;
assign	wsr_inst_g = wsr_inst_g_unflushed & ~local_early_flush_pipe_w & inst_vld_g;
assign tlu_wsr_inst_nq_g = 
           wsr_inst_g_unflushed & ~local_early_flush_pipe_w & inst_vld_nf_g;


//=========================================================================================
//	TICK/TICK-CMP RELATED
//=========================================================================================

wire	[1:0]	tckctr;
wire	[1:0]	tckctr_in;

// modified due to swapping in the incr64 soft macro
// assign tckctr_incr = tckctr + 1;
assign tckctr_in[1:0] = tlu_tckctr_in[1:0]; 
assign tlu_incr_tick[1:0] = tckctr[1:0]; 

dffr_s #(2) dffr_tckctr_cnt (
    .din (tckctr_in[1:0]), 
    .q (tckctr[1:0]),
    .rst (local_rst | ~tlu_tick_en_l), 
    .clk (clk),
    .se  (se),  
    .si  (), 
    .so ()
);

// 3rd cycle, increment tick reg.
// assign	tlu_incr_tick = tckctr[1] & tckctr[0];

assign	tlu_tickcmp_sel[0] = ~tckctr[1] & ~tckctr[0];
assign	tlu_tickcmp_sel[1] = ~tckctr[1] &  tckctr[0];
assign	tlu_tickcmp_sel[2] =  tckctr[1] & ~tckctr[0];
assign	tlu_tickcmp_sel[3] =  tckctr[1] &  tckctr[0];

// TICK.NPT

// reset should not be needed in this equation !!!
assign	tick_ctl_din = tlu_wsr_data_b63_w | local_rst | por_rstint_g;
assign  tlu_tick_ctl_din = tick_ctl_din;

dffe_s dffe_npt0 (
    .din (tick_ctl_din), 
    .q   (tick_npt0),
    .en  (tick_en[0]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s dffe_npt1 (
    .din (tick_ctl_din), 
    .q   (tick_npt1),
    .en  (tick_en[1]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s dffe_npt2 (
    .din (tick_ctl_din), 
    .q   (tick_npt2),
    .en  (tick_en[2]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s dffe_npt3 (
    .din (tick_ctl_din), 
    .q   (tick_npt3),
    .en  (tick_en[3]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign	tlu_tick_npt =
	(thread0_rsel_e & tick_npt0) |
		(thread1_rsel_e & tick_npt1) |
			(thread2_rsel_e & tick_npt2) |
				(thread3_rsel_e & tick_npt3);

assign	tick_npt_priv_act_g = 
	(tick_npriv_r_g & ~ifu_ttype_vld_tmp_g) &
	   ((tick_npt0 & thread0_rsel_g & tlu_none_priv[0]) |
		(tick_npt1 & thread1_rsel_g & tlu_none_priv[1]) |
		(tick_npt2 & thread2_rsel_g & tlu_none_priv[2]) |
		(tick_npt3 & thread3_rsel_g & tlu_none_priv[3])); 
//
// added for timing fix
assign	tick_npt_priv_act_m = 
	 (tick_npriv_r_m & ~ifu_ttype_vld_m) &
	((tick_npt0 & thread0_rsel_m & tlu_none_priv[0]) |
	 (tick_npt1 & thread1_rsel_m & tlu_none_priv[1]) |
	 (tick_npt2 & thread2_rsel_m & tlu_none_priv[2]) |
	 (tick_npt3 & thread3_rsel_m & tlu_none_priv[3])); 

assign	exu_tick_npt_priv_act_m = 
	  tick_npriv_r_m &
	((tick_npt0 & thread0_stg_m_buf & tlu_none_priv[0]) |
	 (tick_npt1 & thread1_stg_m_buf & tlu_none_priv[1]) |
	 (tick_npt2 & thread2_stg_m_buf & tlu_none_priv[2]) |
	 (tick_npt3 & thread3_stg_m_buf & tlu_none_priv[3])); 

//=========================================================================================
//	Soft Interrupt Control
//=========================================================================================

wire	[1:0]	sftintctr;
wire	[1:0]	sftintctr_incr;

assign sftintctr_incr[1:0] = sftintctr[1:0] + 2'b01;

dffr_s #(2) dffr_sftint_cnt  (
   .din (sftintctr_incr[1:0]), 
   .q (sftintctr[1:0]),
   .rst (local_rst), 
   .clk (clk),
   .se  (se),
   .si  (),
   .so ()
);
// 
// modified for bug 4626 and 5117 
/*
assign swint_nq_g = swint_g; 
assign swint_thrd_g[0]= swint_nq_g & thread0_rsel_g & tlu_int_pstate_ie[0];
assign swint_thrd_g[1]= swint_nq_g & thread1_rsel_g & tlu_int_pstate_ie[1];
assign swint_thrd_g[2]= swint_nq_g & thread2_rsel_g & tlu_int_pstate_ie[2];
// assign swint_thrd_g[3]= swint_nq_g & thread3_rsel_g & tlu_int_pstate_ie[3];
*/

assign sftint_user_update_g = 
       clr_sftint_g | sftint_rg_rw_g;

dffr_s dffr_sftint_user_update_w2 (
    .din (sftint_user_update_g),
	.q   (sftint_user_update_w2),
    .clk (clk),
    .rst (local_rst), 
    .se  (se),       
    .si  (),          
    .so  ()
);

assign penc_sel_user_update = sftint_user_update_w2 & ~swint_g;

assign sftint_penc_update = sftint_user_update_w2 | swint_g; 

assign sftint_penc_thrd[0]= 
       (swint_g & thread0_rsel_g) | (penc_sel_user_update & thread0_wsel_w2);
assign sftint_penc_thrd[1]= 
       (swint_g & thread1_rsel_g) | (penc_sel_user_update & thread1_wsel_w2);
assign sftint_penc_thrd[2]= 
       (swint_g & thread2_rsel_g) | (penc_sel_user_update & thread2_wsel_w2);

assign	tlu_sftint_penc_sel[0] = 
            ((~sftintctr[1] & ~sftintctr[0] & ~sftint_penc_update) | 
             sftint_penc_thrd[0]) & ~rst_tri_en;
assign	tlu_sftint_penc_sel[1] = 
            ((~sftintctr[1] &  sftintctr[0] & ~sftint_penc_update) | 
             sftint_penc_thrd[1]) & ~rst_tri_en;
assign	tlu_sftint_penc_sel[2] = 
            (( sftintctr[1] & ~sftintctr[0] & ~sftint_penc_update) | 
             sftint_penc_thrd[2]) & ~rst_tri_en;
//
// added for bug 5117

assign sftint_wait_rst[0] = 
           sftint_pend_wait[0] & tlu_sftint_penc_sel[0]; 
assign sftint_wait_rst[1] = 
           sftint_pend_wait[1] & tlu_sftint_penc_sel[1]; 
assign sftint_wait_rst[2] = 
           sftint_pend_wait[2] & tlu_sftint_penc_sel[2]; 
assign sftint_wait_rst[3] = 
           sftint_pend_wait[3] & tlu_sftint_penc_sel[3]; 

dffr_s dffr_sftint_pend_wait_0 (
    .din (sftint_user_update_g & thread0_rsel_dec_g),
	.q   (sftint_pend_wait[0]),
    .clk (clk),
    .rst (local_rst | sftint_wait_rst[0]), 
    .se  (se),       
    .si  (),          
    .so  ()
);
dffr_s dffr_sftint_pend_wait_1 (
    .din (sftint_user_update_g & thread1_rsel_dec_g),
	.q   (sftint_pend_wait[1]),
    .clk (clk),
    .rst (local_rst | sftint_wait_rst[1]), 
    .se  (se),       
    .si  (),          
    .so  ()
);

dffr_s dffr_sftint_pend_wait_2 (
    .din (sftint_user_update_g & thread2_rsel_dec_g),
	.q   (sftint_pend_wait[2]),
    .clk (clk),
    .rst (local_rst | sftint_wait_rst[2]), 
    .se  (se),       
    .si  (),          
    .so  ()
);

dffr_s dffr_sftint_pend_wait_3 (
    .din (sftint_user_update_g & thread3_rsel_dec_g),
	.q   (sftint_pend_wait[3]),
    .clk (clk),
    .rst (local_rst | sftint_wait_rst[3]), 
    .se  (se),       
    .si  (),          
    .so  ()
);
/*
assign	tlu_sftint_penc_sel[0] = 
            (~sftintctr[1] & ~sftintctr[0] & ~swint_nq_g) | swint_thrd_g[0];
assign	tlu_sftint_penc_sel[1] = 
            (~sftintctr[1] &  sftintctr[0] & ~swint_nq_g) | swint_thrd_g[1];
assign	tlu_sftint_penc_sel[2] = 
            ( sftintctr[1] & ~sftintctr[0] & ~swint_nq_g) | swint_thrd_g[2];
//
*/
// 
// modified for one-hot problem
assign	tlu_sftint_penc_sel[3] =
            ~(|tlu_sftint_penc_sel[2:0]);
// assign	tlu_sftint_penc_sel[3] =
//             ( sftintctr[1] &  sftintctr[0] & ~swint_nq_g) | swint_thrd_g[3];
/*
assign	tlu_sftint_penc_sel[0] = ~sftintctr[1] & ~sftintctr[0];
assign	tlu_sftint_penc_sel[1] = ~sftintctr[1] &  sftintctr[0];
assign	tlu_sftint_penc_sel[2] =  sftintctr[1] & ~sftintctr[0];
assign	tlu_sftint_penc_sel[3] =  sftintctr[1] &  sftintctr[0];
*/

//  Flop sftint values on a per thread basis.
dffe_s #(4) dffe_sftint_id0  (
    .din (tlu_sftint_id[3:0]), 
    .q   (sftint0_id[3:0]),
    .en  (tlu_sftint_penc_sel[0]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffe_s #(4) dffe_sftint_id1  (
    .din (tlu_sftint_id[3:0]), 
    .q   (sftint1_id[3:0]),
    .en  (tlu_sftint_penc_sel[1]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffe_s #(4) dffe_sftint_id2  (
    .din (tlu_sftint_id[3:0]), 
    .q   (sftint2_id[3:0]),
    .en  (tlu_sftint_penc_sel[2]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

dffe_s #(4) dffe_sftint_id3  (
    .din (tlu_sftint_id[3:0]), 
    .q   (sftint3_id[3:0]),
    .en  (tlu_sftint_penc_sel[3]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

// Soft Int Control
// modified to fix one-hot problem
assign	tlu_set_sftint_l_g   =  ~(set_sftint_g) | rst_tri_en; 
assign	tlu_clr_sftint_l_g   =  ~(clr_sftint_g) | rst_tri_en;
assign	tlu_wr_sftint_l_g    =  ~(sftint_rg_rw_g) | rst_tri_en;
// modified for timing
/*
assign	tlu_set_sftint_l_g   =  ~(set_sftint_g & wsr_inst_g);
assign	tlu_clr_sftint_l_g   =  ~(clr_sftint_g & wsr_inst_g);
assign	tlu_wr_sftint_l_g    =  ~(sftint_rg_rw_g & wsr_inst_g);
*/

// modified for pib support
//
assign tlu_sftint_en_l_g[0] = 
           ~((set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
              wsr_inst_g & thread0_rsel_dec_g) & tlu_rst_l;
assign tlu_sftint_en_l_g[1] = 
           ~((set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
              wsr_inst_g & thread1_rsel_dec_g) & tlu_rst_l;
assign tlu_sftint_en_l_g[2] = 
           ~((set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
              wsr_inst_g & thread2_rsel_dec_g) & tlu_rst_l;
assign tlu_sftint_en_l_g[3] = 
           ~((set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
              wsr_inst_g & thread3_rsel_dec_g) & tlu_rst_l;

// added for one-hot mux bug
// modified for timing
assign tlu_sftint_mx_sel[0] = 
           ~(|tlu_sftint_mx_sel[3:1]); 
assign tlu_sftint_mx_sel[1] = 
           (set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
            thread1_rsel_dec_g & ~rst_tri_en; 
assign tlu_sftint_mx_sel[2] = 
           (set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
            thread2_rsel_dec_g & ~rst_tri_en; 
assign tlu_sftint_mx_sel[3] = 
           (set_sftint_g | clr_sftint_g | sftint_rg_rw_g) & 
            thread3_rsel_dec_g & ~rst_tri_en; 
//
// determine whether there is a pending sftint interrupt for each thread
//
assign tlu_int_sftint_pend[0] = |(sftint0_id[3:0]) & ~sftint_pend_wait[0];
assign tlu_int_sftint_pend[1] = |(sftint1_id[3:0]) & ~sftint_pend_wait[1];
assign tlu_int_sftint_pend[2] = |(sftint2_id[3:0]) & ~sftint_pend_wait[2];
assign tlu_int_sftint_pend[3] = |(sftint3_id[3:0]) & ~sftint_pend_wait[3];

// if there is no existing sft interrupt, then sftint_id = 0, and vld would never be asserted. 
// this is why a 15b vector has been encoded as a 16b vector.
// modified for hypervisor support

// fix for bug 7027
/*
assign sftint_only_vld[0] = (tlu_int_sftint_pend[0]) ? 
                            (sftint0_id[3:0] > true_pil0[3:0]) & pil_cmp_en[0] : 1'b0;
assign sftint_only_vld[1] = (tlu_int_sftint_pend[1]) ?
                            (sftint1_id[3:0] > true_pil1[3:0]) & pil_cmp_en[1] : 1'b0;
assign sftint_only_vld[2] = (tlu_int_sftint_pend[2]) ?
                            (sftint2_id[3:0] > true_pil2[3:0]) & pil_cmp_en[2] : 1'b0;
assign sftint_only_vld[3] = (tlu_int_sftint_pend[3]) ?
                            (sftint3_id[3:0] > true_pil3[3:0]) & pil_cmp_en[3] : 1'b0;
*/

assign sftint_only_vld[0] = (tlu_int_sftint_pend[0]) ?
                            (sftint0_id[3:0] > true_pil0[3:0]) : 1'b0;
assign sftint_only_vld[1] = (tlu_int_sftint_pend[1]) ?
                            (sftint1_id[3:0] > true_pil1[3:0]) : 1'b0;
assign sftint_only_vld[2] = (tlu_int_sftint_pend[2]) ?
                            (sftint2_id[3:0] > true_pil2[3:0]) : 1'b0;
assign sftint_only_vld[3] = (tlu_int_sftint_pend[3]) ?
                            (sftint3_id[3:0] > true_pil3[3:0]) : 1'b0;


// swint 
// removed the qualification of the tlu_int_pstate_ie - otherwise, IFU might never wakeup
// after the thread has been suspended.
// 
// modified for timing
assign tlu_sftint_vld[0] = 
           (tlu_cpu_mondo_trap[0] | tlu_dev_mondo_trap[0] | sftint_only_vld[0]); 
assign tlu_sftint_vld[1] = 
           (tlu_cpu_mondo_trap[1] | tlu_dev_mondo_trap[1] | sftint_only_vld[1]);
assign tlu_sftint_vld[2] = 
           (tlu_cpu_mondo_trap[2] | tlu_dev_mondo_trap[2] | sftint_only_vld[2]);
assign tlu_sftint_vld[3] = 
           (tlu_cpu_mondo_trap[3] | tlu_dev_mondo_trap[3] | sftint_only_vld[3]);
//
// added for hypervisor support
// htick_match traps 

// fix for bug 7027
/*
assign tlu_hintp_vld[0] = 
           tlu_hintp[0] & (~tlu_hpstate_priv[0] | 
          (tlu_hpstate_priv[0] & tlu_int_pstate_ie[0]));
assign tlu_hintp_vld[1] = 
           tlu_hintp[1] & (~tlu_hpstate_priv[1] | 
          (tlu_hpstate_priv[1] & tlu_int_pstate_ie[1]));
assign tlu_hintp_vld[2] = 
           tlu_hintp[2] & (~tlu_hpstate_priv[2] | 
          (tlu_hpstate_priv[2] & tlu_int_pstate_ie[2]));
assign tlu_hintp_vld[3] = 
           tlu_hintp[3] & (~tlu_hpstate_priv[3] | 
          (tlu_hpstate_priv[3] & tlu_int_pstate_ie[3]));
*/

assign tlu_hintp_vld[0] = tlu_hintp[0];
assign tlu_hintp_vld[1] = tlu_hintp[1];
assign tlu_hintp_vld[2] = tlu_hintp[2];
assign tlu_hintp_vld[3] = tlu_hintp[3];


//
// resum_err traps
// modified for timing

// fix for bug 7027
/*
assign tlu_rerr_vld[0] = tlu_resum_err_trap[0] & tlu_int_pstate_ie[0]; 
assign tlu_rerr_vld[1] = tlu_resum_err_trap[1] & tlu_int_pstate_ie[1]; 
assign tlu_rerr_vld[2] = tlu_resum_err_trap[2] & tlu_int_pstate_ie[2]; 
assign tlu_rerr_vld[3] = tlu_resum_err_trap[3] & tlu_int_pstate_ie[3]; 
*/
assign tlu_rerr_vld[0] = tlu_resum_err_trap[0];
assign tlu_rerr_vld[1] = tlu_resum_err_trap[1];
assign tlu_rerr_vld[2] = tlu_resum_err_trap[2];
assign tlu_rerr_vld[3] = tlu_resum_err_trap[3];


assign pil_cmp_en[0] = 
           ~(tlu_hpstate_priv[0] & tlu_hpstate_enb[0]);
assign pil_cmp_en[1] = 
           ~(tlu_hpstate_priv[1] & tlu_hpstate_enb[1]);
assign pil_cmp_en[2] = 
           ~(tlu_hpstate_priv[2] & tlu_hpstate_enb[2]);
assign pil_cmp_en[3] = 
           ~(tlu_hpstate_priv[3] & tlu_hpstate_enb[3]);

// TLU.TICK_INT - The tick and stick interrupt logic has been moved to tlu_tdp
// the interrupt will be report back to tlu_tcl via the softint settings
/*
assign wsr_tick_intclr_g =  (tlu_clr_sftint_l_g | ~tlu_wsr_data_w[0]) & (tlu_wr_sftint_l_g | tlu_wsr_data_w[0]);
assign wsr_tick_intset_g = ~(tlu_set_sftint_l_g & tlu_wr_sftint_l_g) & tlu_wsr_data_w[0];
//
// added for hypervisor suppor for tlu_stck_int
assign wsr_stick_intclr_g =  (tlu_clr_sftint_l_g | ~tlu_wsr_data_b16_w) & (tlu_wr_sftint_l_g | tlu_wsr_data_b16_w);
assign wsr_stick_intset_g = ~(tlu_set_sftint_l_g & tlu_wr_sftint_l_g) & tlu_wsr_data_b16_w;
*/
// The following code has been moved to tlu_tdp
/*
assign	tick_intclr[0] = tlu_tick_int[0] & wsr_tick_intclr_g;
assign	tick_intclr[1] = tlu_tick_int[1] & wsr_tick_intclr_g;
assign	tick_intclr[2] = tlu_tick_int[2] & wsr_tick_intclr_g;
assign	tick_intclr[3] = tlu_tick_int[3] & wsr_tick_intclr_g; 
//
assign	tickcmp_int[0] = tlu_tick_match & ~tick_intdis0 & tlu_tickcmp_sel[0];  
assign	tickcmp_int[1] = tlu_tick_match & ~tick_intdis1 & tlu_tickcmp_sel[1];   
assign	tickcmp_int[2] = tlu_tick_match & ~tick_intdis2 & tlu_tickcmp_sel[2]; 
assign	tickcmp_int[3] = tlu_tick_match & ~tick_intdis3 & tlu_tickcmp_sel[3]; 

assign	tick_intrpt[0] = tickcmp_int[0] | tick_intclr[0];
assign	tick_intrpt[1] = tickcmp_int[1] | tick_intclr[1];
assign	tick_intrpt[2] = tickcmp_int[2] | tick_intclr[2];
assign	tick_intrpt[3] = tickcmp_int[3] | tick_intclr[3];

// modified for bug 1022
// qualified tlu_set_sftint with wsr_data_w[0]
//
assign	tick_int_en[0] = ~tlu_sftint_en_l_g[0] | tick_intrpt[0];
assign	tick_int_din[0] = (tick_intrpt[0] | wsr_tick_intset_g) ? 1'b1 : 1'b0;

assign	tick_int_en[1] = ~tlu_sftint_en_l_g[1] | tick_intrpt[1];
assign	tick_int_din[1] = (tick_intrpt[1] | wsr_tick_intset_g) ? 1'b1 : 1'b0;

assign	tick_int_en[2] = ~tlu_sftint_en_l_g[2] | tick_intrpt[2];
assign	tick_int_din[2] = (tick_intrpt[2] | wsr_tick_intset_g) ? 1'b1 : 1'b0;

assign	tick_int_en[3] = ~tlu_sftint_en_l_g[3] | tick_intrpt[3];
assign	tick_int_din[3] = (tick_intrpt[3] | wsr_tick_intset_g) ? 1'b1 : 1'b0;
//
// recoded tlu_tick_int for bug 818
dffre_s dffre_tick_int0 (
    .din (tick_int_din[0]), 
    .q   (tlu_tick_int[0]),
    .rst (local_rst), 
    .en  (tick_int_en[0]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// recoded tlu_tick_int for bug 818
dffre_s dffre_tick_int1 (
    .din (tick_int_din[1]), 
    .q   (tlu_tick_int[1]),
    .rst (local_rst), 
    .en  (tick_int_en[1]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// recoded tlu_tick_int for bug 818
//
dffre_s dffre_tick_int2 (
    .din (tick_int_din[2]), 
    .q   (tlu_tick_int[2]),
    .rst (local_rst), 
    .en  (tick_int_en[2]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// recoded tlu_tick_int for bug 818
dffre_s dffre_tick_int3 (
    .din (tick_int_din[3]), 
    .q   (tlu_tick_int[3]),
    .rst (local_rst), 
    .en  (tick_int_en[3]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
*/
//
// added and/or modified for hypervisor support
// the following logic has been moved to tlu_tdp
/*
assign	stick_intclr[0] = tlu_stick_int[0] & wsr_stick_intclr_g;
assign	stick_intclr[1] = tlu_stick_int[1] & wsr_stick_intclr_g;
assign	stick_intclr[2] = tlu_stick_int[2] & wsr_stick_intclr_g;
assign	stick_intclr[3] = tlu_stick_int[3] & wsr_stick_intclr_g; 
//
assign	stickcmp_int[0] = tlu_stick_match & ~stick_intdis0 & tlu_tickcmp_sel[0];  
assign	stickcmp_int[1] = tlu_stick_match & ~stick_intdis1 & tlu_tickcmp_sel[1];   
assign	stickcmp_int[2] = tlu_stick_match & ~stick_intdis2 & tlu_tickcmp_sel[2]; 
assign	stickcmp_int[3] = tlu_stick_match & ~stick_intdis3 & tlu_tickcmp_sel[3]; 
//
assign	stick_intrpt[0] = stickcmp_int[0] | stick_intclr[0];
assign	stick_intrpt[1] = stickcmp_int[1] | stick_intclr[1];
assign	stick_intrpt[2] = stickcmp_int[2] | stick_intclr[2];
assign	stick_intrpt[3] = stickcmp_int[3] | stick_intclr[3];
//
// modified for bug 1022
// qualified tlu_set_sftint with wsr_data_w[16]
//
assign	stick_int_en[0] = ~tlu_sftint_en_l_g[0] | stick_intrpt[0];
assign	stick_int_din[0] = (stick_intrpt[0] | wsr_stick_intset_g) ? 1'b1 : 1'b0;

assign	stick_int_en[1] = ~tlu_sftint_en_l_g[1] | stick_intrpt[1];
assign	stick_int_din[1] = (stick_intrpt[1] | wsr_stick_intset_g) ? 1'b1 : 1'b0;

assign	stick_int_en[2] = ~tlu_sftint_en_l_g[2] | stick_intrpt[2];
assign	stick_int_din[2] = (stick_intrpt[2] | wsr_stick_intset_g) ? 1'b1 : 1'b0;

assign	stick_int_en[3] = ~tlu_sftint_en_l_g[3] | stick_intrpt[3];
assign	stick_int_din[3] = (stick_intrpt[3] | wsr_stick_intset_g) ? 1'b1 : 1'b0;

// recoded tlu_tick_int for bug 818
//
dffre_s dffre_stick_int0 (
    .din (stick_int_din[0]), 
    .q   (tlu_stick_int[0]),
    .rst (local_rst), 
    .en  (stick_int_en[0]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
dffre_s dffre_stick_int1 (
    .din (stick_int_din[1]), 
    .q   (tlu_stick_int[1]),
    .rst (local_rst), 
    .en  (stick_int_en[1]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
dffre_s dffre_stick_int2  (
    .din (stick_int_din[2]), 
    .q   (tlu_stick_int[2]),
    .rst (local_rst), 
    .en  (stick_int_en[2]), 
    .clk (clk),
    .se  (se),
    .si (),
    .so ()
);
//
dffre_s dffre_stick_int3 (
    .din (stick_int_din[3]), 
    .q   (tlu_stick_int[3]),
    .rst (local_rst), 
    .en  (stick_int_en[3]), 
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
// modified for hypervisor support
//
assign	tlu_sftint_lvl14_all[0] = 
            tlu_sftint_lvl14[0] | tlu_tick_int[0] | tlu_stick_int[0];
assign	tlu_sftint_lvl14_all[1] = 
            tlu_sftint_lvl14[1] | tlu_tick_int[1] | tlu_stick_int[1];
assign	tlu_sftint_lvl14_all[2] = 
            tlu_sftint_lvl14[2] | tlu_tick_int[2] | tlu_stick_int[2];
assign	tlu_sftint_lvl14_all[3] = 
            tlu_sftint_lvl14[3] | tlu_tick_int[3] | tlu_stick_int[3];
//
assign	tlu_sftint_lvl14_int[0] = tickcmp_int[0] | stickcmp_int[0];
assign	tlu_sftint_lvl14_int[1] = tickcmp_int[1] | stickcmp_int[1];
assign	tlu_sftint_lvl14_int[2] = tickcmp_int[2] | stickcmp_int[2];
assign	tlu_sftint_lvl14_int[3] = tickcmp_int[3] | stickcmp_int[3];
*/

//=========================================================================================
//	PIL for Threads
//=========================================================================================

assign	pil0_en	= pil_rw_g & wsr_inst_g & thread0_wsel_g; 
assign	pil1_en	= pil_rw_g & wsr_inst_g & thread1_wsel_g; 
assign	pil2_en	= pil_rw_g & wsr_inst_g & thread2_wsel_g; 
assign	pil3_en	= pil_rw_g & wsr_inst_g & thread3_wsel_g; 

// THREAD 0
dffe_s #(4) dffe_pil0 (
    .din (tlu_wsr_data_w[3:0]),
    .q   (true_pil0[3:0]),
    .en  (pil0_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
// 
// THREAD 1
dffe_s #(4) dffe_pil1 (
    .din (tlu_wsr_data_w[3:0]),
    .q   (true_pil1[3:0]),
    .en  (pil1_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
// 
// THREAD 2
dffe_s #(4) dffe_pil2 (
    .din (tlu_wsr_data_w[3:0]),
    .q   (true_pil2[3:0]),
    .en  (pil2_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// THREAD 3
dffe_s #(4) dffe_pil3 (
    .din (tlu_wsr_data_w[3:0]),
    .q   (true_pil3[3:0]),
    .en  (pil3_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
//	TL for Threads
//=========================================================================================
//
dff_s dff_stgim_g (
    .din (ifu_tlu_immu_miss_m), 
    .q  (immu_miss_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// wrpr supplies new value else increment on trap.
// wrpr %tl when tl=0 will cause a trap.
// trap in MAXTL-1 enters RED_MODE. 
// added for hypervisor support
// capped the tl value by supervisor write at MAXSTL 
//
assign maxstl_wr_sel[0] = 
           ~tlu_hyper_lite[0] & (tlu_wsr_data_w[2:0] > `MAXSTL);
assign maxstl_wr_sel[1] = 
           ~tlu_hyper_lite[1] & (tlu_wsr_data_w[2:0] > `MAXSTL); 
assign maxstl_wr_sel[2] = 
           ~tlu_hyper_lite[2] & (tlu_wsr_data_w[2:0] > `MAXSTL); 
assign maxstl_wr_sel[3] = 
           ~tlu_hyper_lite[3] & (tlu_wsr_data_w[2:0] > `MAXSTL); 

assign maxtl_wr_sel =  (tlu_wsr_data_w[2:0] == 3'b111); 

// THREAD0
// Use to signal page fault for now.
// sync_trap_taken_g already qualified with inst_vld_g.
// long-latency sparc traps have to be killed in own pipeline
// hwint interrupts are qualified elsewhere
// modified due to timing
// modified for bug 4561
assign thrd0_traps =
            (sync_trap_taken_g & thread0_rsel_g) | 
            (pending_trap_sel[0] & ~(dnrtry_inst_g | tsa_wr_tid_sel_g |
             ifu_thrd_flush_w[0] | cwp_cmplt0_pending | sync_trap_taken_g |
            (tlu_gl_rw_g & wsr_inst_g))); 
//
// trap level will get updated next cycle.
dff_s #(1) dff_stgw2_0 (
    .din (thrd0_traps), 
    .q   (thrd0_traps_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign tlu_thrd_traps_w2[0] = thrd0_traps_w2; 

assign	trp_lvl0_at_maxtl = (trp_lvl0[2:0] == `MAXTL);
assign	trp_lvl0_at_maxtlless1 = (trp_lvl0[2:0] == `MAXTL_LESSONE);
//
// added for modified for hypervisor support
assign trp_lvl_at_maxstl[0]   = (trp_lvl0[2:0] == `MAXSTL);
assign trp_lvl_gte_maxstl[0]  = (trp_lvl0[2:0] > `MAXSTL) | trp_lvl_at_maxstl[0];
assign wsr_trp_lvl0_data_w[2:0] = 
           (maxstl_wr_sel[0])? `MAXSTL_TL: 
           ((maxtl_wr_sel)? `MAXTL: tlu_wsr_data_w[2:0]);
//
// added for timing
dff_s #(3) dff_wsr_trp_lvl0_data_w2 (
    .din (wsr_trp_lvl0_data_w[2:0]),
    .q   (wsr_trp_lvl0_data_w2[2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
// The following section has been recoded due to timing
//=========================================================================================
// trap level to be incremented if thread not at MAXTL and not in redmode
assign	trp_lvl0_incr_w2 = thrd0_traps_w2 & ~trp_lvl0_at_maxtl;

assign trp_lvl0_new[2:0] = 
	   (tl_rw_w2 & wsr_inst_w2 & thread0_wsel_w2) ? 
			wsr_trp_lvl0_data_w2[2:0] : 
			(local_rst | por_rstint0_w2) ? `MAXTL :
			(dnrtry_inst_w2[0]) ? 
				trp_lvl0[2:0] - 3'b001:// done/retry decrements
				trp_lvl0[2:0] + {2'b00,trp_lvl0_incr_w2};// trap increments
assign tl0_en =
           (tl_rw_w2 & wsr_inst_w2 & thread0_wsel_w2) |  
			trp_lvl0_incr_w2| local_rst | por_rstint0_w2 | 
            dnrtry_inst_w2[0]; 

// Reset required as processor will start out at tl0 after reset.
// tl has to be correctly defined for all conditions !!!
dffe_s #(3) dffe_tl0 (
    .din (trp_lvl0_new[2:0]),
    .q   (trp_lvl0[2:0]),
    .en  (tl0_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
assign	tlu_lsu_tl_zero[0] = ~trp_lvl0[2] & ~trp_lvl0[1] & ~trp_lvl0[0];         
assign	tl0_gt_0 = trp_lvl0[2] | trp_lvl0[1] | trp_lvl0[0]; 	
//
// THREAD1
// Use to signal page fault for now.
// sync_trap_taken_g already qualified with inst_vld_g.
// long-latency sparc traps have to be killed in own pipeline
// hwint interrupts are qualified elsewhere
// modified due to timing
assign thrd1_traps =
            (sync_trap_taken_g & thread1_rsel_g ) | 
            (pending_trap_sel[1] & ~(dnrtry_inst_g | tsa_wr_tid_sel_g |
             ifu_thrd_flush_w[1] | cwp_cmplt1_pending | sync_trap_taken_g |
            (tlu_gl_rw_g & wsr_inst_g))); 
//
// trap level will get updated next cycle.
dff_s #(1) dff_stgw2_1 (
    .din (thrd1_traps),
    .q  (thrd1_traps_w2),
    .clk (clk),
    .se  (se),
    .si (),
    .so ()
);

assign tlu_thrd_traps_w2[1] = thrd1_traps_w2; 

assign	trp_lvl1_at_maxtl = (trp_lvl1[2:0] == `MAXTL);
assign	trp_lvl1_at_maxtlless1 = (trp_lvl1[2:0] == `MAXTL_LESSONE);
//
// added for modified for hypervisor support
assign trp_lvl_at_maxstl[1]   = (trp_lvl1[2:0] == `MAXSTL);
assign trp_lvl_gte_maxstl[1]  = (trp_lvl1[2:0] > `MAXSTL) | trp_lvl_at_maxstl[1];
assign wsr_trp_lvl1_data_w[2:0] = 
           (maxstl_wr_sel[1])? `MAXSTL_TL: 
           ((maxtl_wr_sel)? `MAXTL: tlu_wsr_data_w[2:0]);
//
// added for timing
dff_s #(3) dff_wsr_trp_lvl1_data_w2 (
    .din (wsr_trp_lvl1_data_w[2:0]),
    .q   (wsr_trp_lvl1_data_w2[2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
// The following section has been recoded due to timing
//=========================================================================================
// trap level to be incremented if thread not at MAXTL and not in redmode
assign	trp_lvl1_incr_w2 = thrd1_traps_w2 & ~trp_lvl1_at_maxtl;

assign trp_lvl1_new[2:0] = 
	   (tl_rw_w2 & wsr_inst_w2 & thread1_wsel_w2) ? 
			wsr_trp_lvl1_data_w2[2:0] : 
			(local_rst | por_rstint1_w2) ? `MAXTL :
			(dnrtry_inst_w2[1]) ? 
				trp_lvl1[2:0] - 3'b001:// done/retry decrements
				trp_lvl1[2:0] + {2'b00,trp_lvl1_incr_w2};// trap increments
assign tl1_en =
           (tl_rw_w2 & wsr_inst_w2 & thread1_wsel_w2) |  
			trp_lvl1_incr_w2| local_rst | por_rstint1_w2 | 
            dnrtry_inst_w2[1]; 

// Reset required as processor will start out at tl1 after reset.
// tl has to be correctly defined for all conditions !!!
dffe_s #(3) dffe_tl1 (
    .din (trp_lvl1_new[2:0]),
    .q   (trp_lvl1[2:0]),
    .en  (tl1_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
assign	tlu_lsu_tl_zero[1] = ~trp_lvl1[2] & ~trp_lvl1[1] & ~trp_lvl1[0];         
assign	tl1_gt_0 = trp_lvl1[2] | trp_lvl1[1] | trp_lvl1[0]; 	
//
// THREAD2
// Use to signal page fault for now.
// sync_trap_taken_g already qualified with inst_vld_g.
// long-latency sparc traps have to be killed in own pipeline
// hwint interrupts are qualified elsewhere
// modified due to timing
// modified for bug 3827
assign thrd2_traps =
            (sync_trap_taken_g & thread2_rsel_g) | 
            (pending_trap_sel[2] & ~(dnrtry_inst_g | tsa_wr_tid_sel_g |
             ifu_thrd_flush_w[2] | cwp_cmplt2_pending | sync_trap_taken_g | 
             (tlu_gl_rw_g & wsr_inst_g))); 

// trap level will get updated next cycle.
dff_s #(1) dff_stgw2_2 (
    .din (thrd2_traps), 
    .q   (thrd2_traps_w2),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign tlu_thrd_traps_w2[2] = thrd2_traps_w2;

assign	trp_lvl2_at_maxtl = (trp_lvl2[2:0] == `MAXTL);
assign	trp_lvl2_at_maxtlless1 = (trp_lvl2[2:0] == `MAXTL_LESSONE);
//
// added or modified for hypervisor support
assign trp_lvl_at_maxstl[2]   = (trp_lvl2[2:0] == `MAXSTL);
assign trp_lvl_gte_maxstl[2]  = (trp_lvl2[2:0] > `MAXSTL) | trp_lvl_at_maxstl[2];
assign wsr_trp_lvl2_data_w[2:0] = 
           (maxstl_wr_sel[2])? `MAXSTL_TL:
           ((maxtl_wr_sel)? `MAXTL: tlu_wsr_data_w[2:0]);
//
// added for timing
dff_s #(3) dff_wsr_trp_lvl2_data_w2 (
    .din (wsr_trp_lvl2_data_w[2:0]),
    .q   (wsr_trp_lvl2_data_w2[2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
// The following section has been recoded due to timing
//=========================================================================================
// trap level to be incremented if thread not at MAXTL and not in redmode
assign	trp_lvl2_incr_w2 = thrd2_traps_w2 & ~trp_lvl2_at_maxtl;

assign trp_lvl2_new[2:0] = 
	   (tl_rw_w2 & wsr_inst_w2 & thread2_wsel_w2) ? 
			wsr_trp_lvl2_data_w2[2:0] : 
			(local_rst | por_rstint2_w2) ? `MAXTL :
			(dnrtry_inst_w2[2]) ? 
				trp_lvl2[2:0] - 3'b001:// done/retry decrements
				trp_lvl2[2:0] + {2'b00,trp_lvl2_incr_w2};// trap increments
assign tl2_en =
           (tl_rw_w2 & wsr_inst_w2 & thread2_wsel_w2) |  
			trp_lvl2_incr_w2| local_rst | por_rstint2_w2 | 
            dnrtry_inst_w2[2]; 

// Reset required as processor will start out at tl1 after reset.
// tl has to be correctly defined for all conditions !!!
dffe_s #(3) dffe_tl2 (
    .din (trp_lvl2_new[2:0]),
    .q   (trp_lvl2[2:0]),
    .en  (tl2_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
assign	tlu_lsu_tl_zero[2] = ~trp_lvl2[2] & ~trp_lvl2[1] & ~trp_lvl2[0];         
assign	tl2_gt_0 = trp_lvl2[2] | trp_lvl2[1] | trp_lvl2[0]; 	
//
// THREAD3
// Use to signal page fault for now.
// sync_trap_taken_g already qualified with inst_vld_g.
// long-latency sparc traps have to be killed in own pipeline
// hwint interrupts are qualified elsewhere
// modified due to timing
assign thrd3_traps =
            (sync_trap_taken_g & thread3_rsel_g) | 
            (pending_trap_sel[3] & ~(dnrtry_inst_g | tsa_wr_tid_sel_g |
             ifu_thrd_flush_w[3] | cwp_cmplt3_pending | sync_trap_taken_g |
            (tlu_gl_rw_g & wsr_inst_g))); 

// trap level will get updated next cycle.
dff_s #(1) dff_stgw2_3 (
    .din (thrd3_traps), 
    .q   (thrd3_traps_w2),
    .clk (clk),
    .se  (se),
    .si (),
    .so ()
);

assign tlu_thrd_traps_w2[3] = thrd3_traps_w2;

assign	trp_lvl3_at_maxtl = (trp_lvl3[2:0] == `MAXTL);
assign	trp_lvl3_at_maxtlless1 = (trp_lvl3[2:0] == `MAXTL_LESSONE);
//
// added for modified for hypervisor support
assign trp_lvl_at_maxstl[3]   = (trp_lvl3[2:0] == `MAXSTL);
assign trp_lvl_gte_maxstl[3]  = (trp_lvl3[2:0] > `MAXSTL) | trp_lvl_at_maxstl[3];
assign wsr_trp_lvl3_data_w[2:0] = 
           (maxstl_wr_sel[3])? `MAXSTL_TL:
           ((maxtl_wr_sel)? `MAXTL: tlu_wsr_data_w[2:0]);
//
// added for timing
dff_s #(3) dff_wsr_trp_lvl3_data_w2 (
    .din (wsr_trp_lvl3_data_w[2:0]),
    .q   (wsr_trp_lvl3_data_w2[2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

//=========================================================================================
// The following section has been recoded due to timing
//=========================================================================================
// trap level to be incremented if thread not at MAXTL and not in redmode
assign	trp_lvl3_incr_w2 = thrd3_traps_w2 & ~trp_lvl3_at_maxtl;

assign trp_lvl3_new[2:0] = 
	   (tl_rw_w2 & wsr_inst_w2 & thread3_wsel_w2) ? 
			wsr_trp_lvl3_data_w2[2:0] : 
			(local_rst | por_rstint3_w2) ? `MAXTL :
			(dnrtry_inst_w2[3]) ? 
				trp_lvl3[2:0] - 3'b001:// done/retry decrements
				trp_lvl3[2:0] + {2'b00,trp_lvl3_incr_w2};// trap increments

assign tl3_en =
           (tl_rw_w2 & wsr_inst_w2 & thread3_wsel_w2) |  
			trp_lvl3_incr_w2| local_rst | por_rstint3_w2 | 
            dnrtry_inst_w2[3]; 

// Reset required as processor will start out at tl1 after reset.
dffe_s #(3) dffe_tl3 (
    .din (trp_lvl3_new[2:0]),
    .q   (trp_lvl3[2:0]),
    .en  (tl3_en),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
assign	tlu_lsu_tl_zero[3] = ~trp_lvl3[2] & ~trp_lvl3[1] & ~trp_lvl3[0];         
assign	tl3_gt_0 = trp_lvl3[2] | trp_lvl3[1] | trp_lvl3[0]; 	
//
// added for hypervisor support - TLZ trap
// detection of transition of trap-level from <> 0 to 0
// modified for bug 3192

assign tlz_thread_set[0] = ~(tlu_lsu_tl_zero[0] | (|(trp_lvl0_new[2:0]))) & tl0_en;
assign tlz_thread_set[1] = ~(tlu_lsu_tl_zero[1] | (|(trp_lvl1_new[2:0]))) & tl1_en;
assign tlz_thread_set[2] = ~(tlu_lsu_tl_zero[2] | (|(trp_lvl2_new[2:0]))) & tl2_en;
assign tlz_thread_set[3] = ~(tlu_lsu_tl_zero[3] | (|(trp_lvl3_new[2:0]))) & tl3_en;

dff_s #(`TLU_THRD_NUM) dff_tlz_thread_data (
    .din (tlz_thread_set[`TLU_THRD_NUM-1:0]),
	.q   (tlz_thread_data[`TLU_THRD_NUM-1:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

//
// storing the state of the tlz trap to take the trap on the next valid
// instruction 
// modified for bug 3646
dffre_s dffr_tlz_thread_0  (
    .din (tlz_thread_data[0]),
    .q   (tlz_thread[0]),
    .rst (local_rst | tlz_trap_g[0] | thread_inst_vld_g[0]),
    .en  (tlz_thread_data[0] & tlu_hpstate_tlz[0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffr_tlz_thread_1  (
    .din (tlz_thread_data[1]),
    .q   (tlz_thread[1]),
    .rst (local_rst | tlz_trap_g[1] | thread_inst_vld_g[1]), 
    .en  (tlz_thread_data[1] & tlu_hpstate_tlz[1]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffr_tlz_thread_2  (
    .din (tlz_thread_data[2]),
    .q   (tlz_thread[2]),
    .rst (local_rst | tlz_trap_g[2] | thread_inst_vld_g[2]),
    .en  (tlz_thread_data[2] & tlu_hpstate_tlz[2]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffre_s dffr_tlz_thread_3  (
    .din (tlz_thread_data[3]),
    .q   (tlz_thread[3]),
    .rst (local_rst | tlz_trap_g[3] | thread_inst_vld_g[3]),
    .en  (tlz_thread_data[3] & tlu_hpstate_tlz[3]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// initiate the trap for the appropriate thread
// modified for bug 4434 & 4758
assign tlz_trap_m[0] =
          ~ifu_rstint_m & 
          // ~(ifu_rstint_m | (ifu_hwint_m  & tlu_int_pstate_ie[0])) & 
            inst_vld_m & tlu_lsu_tl_zero[0] & thread0_rsel_m & tlz_thread[0] & 
          ~tlu_hpstate_priv[0] & tlu_hpstate_tlz[0];
assign tlz_trap_m[1] =
          ~ifu_rstint_m & 
          // ~(ifu_rstint_m | (ifu_hwint_m & tlu_int_pstate_ie[1])) & 
            inst_vld_m & tlu_lsu_tl_zero[1] & thread1_rsel_m & tlz_thread[1] &
          ~tlu_hpstate_priv[1] & tlu_hpstate_tlz[1];
assign tlz_trap_m[2] =
          ~ifu_rstint_m & 
          // ~(ifu_rstint_m | (ifu_hwint_m & tlu_int_pstate_ie[2])) & 
            inst_vld_m & tlu_lsu_tl_zero[2] & thread2_rsel_m & tlz_thread[2] & 
          ~tlu_hpstate_priv[2] & tlu_hpstate_tlz[2];
assign tlz_trap_m[3] =
          ~ifu_rstint_m & 
          // ~(ifu_rstint_m | (ifu_hwint_m & tlu_int_pstate_ie[3])) & 
            inst_vld_m & tlu_lsu_tl_zero[3] & thread3_rsel_m & tlz_thread[3] &
          ~tlu_hpstate_priv[3] & tlu_hpstate_tlz[3];
//
// added for timing - modifed to removed the qualification of the interrupts from
// IFU
assign tlz_exu_trap_m[0] =
            tlu_lsu_tl_zero[0] & thread0_rsel_m & tlz_thread[0] & ~tlu_hpstate_priv[0] & 
            tlu_hpstate_tlz[0];
assign tlz_exu_trap_m[1] =
            tlu_lsu_tl_zero[1] & thread1_rsel_m & tlz_thread[1] & ~tlu_hpstate_priv[1] & 
            tlu_hpstate_tlz[1];
assign tlz_exu_trap_m[2] =
            tlu_lsu_tl_zero[2] & thread2_rsel_m & tlz_thread[2] & ~tlu_hpstate_priv[2] & 
            tlu_hpstate_tlz[2];
assign tlz_exu_trap_m[3] =
            tlu_lsu_tl_zero[3] & thread3_rsel_m & tlz_thread[3] & ~tlu_hpstate_priv[3] & 
            tlu_hpstate_tlz[3];
//
// modified for bug 4862
// indicate that a TLZ trap needs to be taken
dffr_s #(`TLU_THRD_NUM) dffr_tlz_trap_g  (
    .din (tlz_trap_m[`TLU_THRD_NUM-1:0]), 
    .q   (tlz_trap_nq_g[`TLU_THRD_NUM-1:0]),
    .rst (local_rst),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign tlz_trap_g[0] = tlz_trap_nq_g[0] & ~inst_ifu_flush2_w;
assign tlz_trap_g[1] = tlz_trap_nq_g[1] & ~inst_ifu_flush2_w;
assign tlz_trap_g[2] = tlz_trap_nq_g[2] & ~inst_ifu_flush2_w;
assign tlz_trap_g[3] = tlz_trap_nq_g[3] & ~inst_ifu_flush2_w;

//=========================================================================================
//	EXCEPTION HANDLING
//=========================================================================================
// modified to test out timing - 
/*
assign	tlu_ifu_flush_pipe_w = 
 	(thrd0_traps_flush | thrd1_traps_flush | thrd2_traps_flush | thrd3_traps_flush) & 
     inst_vld_g; 
//
assign	tlu_ifu_flush_pipe_w = 
            (dside_sync_trap_g & inst_vld_g) | local_early_flush_pipe_w;  
*/
assign tlu_ifu_flush_pipe_w = 
           (early_dside_trap_g & inst_vld_g) | lsu_tlu_defr_trp_taken_g | 
            local_early_flush_pipe_w | lsu_ttype_vld_w;  
           // modified for bug 4561
           // (lsu_defr_trap_g & (thrid_g[1:0] == thrid_w2[1:0]))  |

//
// modified for timing fix
assign tlu_flush_all_w = 
           inst_ifu_flush_w | local_early_flush_pipe_w | 
           (lsu_tlu_early_flush_w & inst_vld_nf_g);


// staging the all flush signal 
dffr_s dffr_tlu_flush_all_w2 (
    .din (tlu_flush_all_w),
    .q   (tlu_flush_all_w2),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// added for timing
assign lsu_ttype_vld_w = 
           lsu_tlu_ttype_vld_m2 & inst_vld_g;
// 
// staging the flush-pipe signal 
dffr_s dffr_lsu_ttype_vld_w2 (
    .din (lsu_ttype_vld_w),
    .q   (lsu_ttype_vld_w2),
    .rst (local_rst),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign	tlu_flush_pipe_w = tlu_ifu_flush_pipe_w;
//
// added for timing 
assign	tlu_full_flush_pipe_w2 = 
            lsu_ttype_vld_w2 | tlu_flush_all_w2;

// added for early flush pipe timing fix
// assign tlu_early_flush_pipe_m = sync_trap_taken_m;  

assign tlu_local_flush_w          = local_early_flush_pipe_w;
assign tlu_early_flush_pipe2_w    = local_early_flush_pipe2_w; 
assign tlu_exu_early_flush_pipe_w = local_early_flush_pipe3_w;
assign tlu_early_flush_pipe_w     = local_early_flush_pipe4_w; 

// added local early flush pipe timing fix

dffr_s dffr_local_early_flush_pipe_w (
    .din (sync_trap_taken_m),
    .q   (local_early_flush_pipe_w),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so ()
);

dffr_s dffr_local_early_flush_pipe2_w (
    .din (sync_trap_taken_m),
    .q   (local_early_flush_pipe2_w),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so ()
);

dffr_s dffr_local_early_flush_pipe3_w (
    .din (sync_trap_taken_m),
    .q   (local_early_flush_pipe3_w),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so ()
);

dffr_s dffr_local_early_flush_pipe4_w (
    .din (sync_trap_taken_m),
    .q   (local_early_flush_pipe4_w),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so ()
);

//=========================================================================================
//	SFSR/SFAR HANDLING
//=========================================================================================

assign thread_tl_zero =
	thread0_rsel_e ? tlu_lsu_tl_zero[0] :
		thread1_rsel_e ? tlu_lsu_tl_zero[1] :
			thread2_rsel_e ? tlu_lsu_tl_zero[2] : tlu_lsu_tl_zero[3];

// Generate selects for ctxt to be written to tag_access
// iside trap meant to cover immu_miss and inst_access_excp
// modified for hypervisor support
// assign	iside_trap = exu_tlu_ttype_vld_m | immu_va_oor_brnchetc_m | exu_tlu_va_oor_jl_ret_m;
// removed for timing 
/*
assign	iside_trap =
            ifu_tlu_immu_miss_m | exu_tlu_ttype_vld_m | 
            immu_va_oor_brnchetc_m | exu_tlu_va_oor_jl_ret_m ;
  
assign	tlu_tag_access_ctxt_sel_m[0] = iside_trap &  thread_tl_zero_m;
assign	tlu_tag_access_ctxt_sel_m[1] = iside_trap & ~thread_tl_zero_m;
assign	tlu_tag_access_ctxt_sel_m[2] = ~iside_trap;
*/

// ISFSR

// voor reported for both ifetch and memref - need to distinguish.
// va-out-of-range for ldst,branch,call,sequential 
// modified for bug 4763
// assign	immu_va_oor_brnchetc_m
// 	= exu_tlu_va_oor_m & ~pstate_am & ~memref_m;

dffr_s dffr_immu_va_oor_brnchetc_m (
    .din (ifu_tlu_pc_oor_e),
    .q   (immu_va_oor_brnchetc_m),
    .rst (local_rst), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_memref_e (
    .din (ifu_lsu_memref_d),
    .q   (memref_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so ()
);


dff_s dff_memref_m (
    .din (memref_e),// ifu_tlu_flsh_inst_e
    .q   (memref_m),// flsh_inst_m
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign isfsr_flt_vld_m = 
	(thread0_rsel_m & tlu_isfsr_flt_vld[0]) |
	(thread1_rsel_m & tlu_isfsr_flt_vld[1]) |
	(thread2_rsel_m & tlu_isfsr_flt_vld[2]) |
	(thread3_rsel_m & tlu_isfsr_flt_vld[3]);

assign tlu_lsu_pstate_am[3:0] = tlu_pstate_am[3:0];

assign	pstate_am = 
	(thread0_rsel_m & tlu_pstate_am[0]) |
	(thread1_rsel_m & tlu_pstate_am[1]) |
	(thread2_rsel_m & tlu_pstate_am[2]) |
	(thread3_rsel_m & tlu_pstate_am[3]);

dff_s #(1) dff_am_stgg (
    .din (pstate_am),
    .q   (tlu_addr_msk_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// logic moved to lsu_expctl due to timing
/*
assign	pstate_priv = 
	(thread0_rsel_m & tlu_pstate_priv[0]) |
	(thread1_rsel_m & tlu_pstate_priv[1]) |
	(thread2_rsel_m & tlu_pstate_priv[2]) |
	(thread3_rsel_m & tlu_pstate_priv[3]);
*/


assign trp_lvl_zero = 
	(thread0_rsel_g & tlu_lsu_tl_zero[0]) |
	(thread1_rsel_g & tlu_lsu_tl_zero[1]) |
	(thread2_rsel_g & tlu_lsu_tl_zero[2]) |
	(thread3_rsel_g & tlu_lsu_tl_zero[3]);

assign	isfsr_ftype_sel[0] =  ifu_tlu_priv_violtn_m;
// The 2 out of range exceptions are mutex as they are based on inst type.
assign	isfsr_ftype_sel[1] = ~isfsr_ftype_sel[0] & immu_va_oor_brnchetc_m;
// modified for bug 4452
assign isfsr_ftype_sel[2] = 
           ~isfsr_ftype_sel[0] & exu_tlu_va_oor_jl_ret_m & 
           ~(exu_tlu_ttype_vld_m | ifu_tlu_ttype_vld_m) & ~pstate_am;

assign	isfsr_trp_wr_m = |isfsr_ftype_sel[2:0];

dff_s #(1) dff_isfsrw_stgg (
        .din (isfsr_trp_wr_m),
        .q   (isfsr_trp_wr_g),
        .clk (clk),
        .se  (se),
        .si  (),
        .so  ()
);

dff_s #(1) dff_itag_acc_sel_g (
        .din (isfsr_trp_wr_m | ifu_tlu_immu_miss_m),
        .q   (itag_acc_sel_g),
        .clk (clk),
        .se  (se),
        .si  (),
        .so ()
);

assign tlu_itag_acc_sel_g = itag_acc_sel_g;

// terms below can be made common. (grape)
// recoded for timing - flush qualification moved to mmu_ctl
assign	immu_sfsr_trp_wr[0] = 
            isfsr_trp_wr_g & inst_vld_nf_g & thread0_rsel_g;
assign	immu_sfsr_trp_wr[1] = 
            isfsr_trp_wr_g & inst_vld_nf_g & thread1_rsel_g;
assign	immu_sfsr_trp_wr[2] = 
            isfsr_trp_wr_g & inst_vld_nf_g & thread2_rsel_g;
assign	immu_sfsr_trp_wr[3] = 
            isfsr_trp_wr_g & inst_vld_nf_g & thread3_rsel_g;

assign	isfsr_ftype_m[6] = isfsr_ftype_sel[2];
assign	isfsr_ftype_m[5] = isfsr_ftype_sel[1];
assign	isfsr_ftype_m[4:1] = 4'b0000;
assign	isfsr_ftype_m[0] = isfsr_ftype_sel[0];
//
// modified due to timing
dff_s #(8) dff_isfsr_stgg (
    .din ({isfsr_ftype_m[6:0],isfsr_flt_vld_m}), // pstate_priv, 
	.q   ({isfsr_ftype_g[6:0],isfsr_flt_vld_g}), // pstate_priv_g,
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

// Can we remove the excessive bits in isfsr ?
// Do jmpl/rtrn define the asi in i or dsfsr ? seems only jmpl_rtrn mem_addr_not_aligned
// traps set the asi and that too in the dsfsr
// Need to add ctxt !!!

assign isfsr_ctxt_g[1:0] =
	       trp_lvl_zero ? 2'b00 : 2'b10;

dff_s #(1) dff_thread_tl_zero_m (
    .din (thread_tl_zero),
    .q   (thread_tl_zero_m),
    .clk (clk),
    .se  (se),
    .si (),
    .so ()
);

dff_s #(1) dff_thread_tl_zero_g (
    .din (thread_tl_zero_m),
    .q   (thread_tl_zero_g),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

assign isfsr_asi_g[7:0] = 
           thread_tl_zero_g ? 8'h80 : 8'h04; 
//
// modified for bug 3323
assign	tlu_isfsr_din_g[23:0] =
	{isfsr_asi_g[7:0],2'b0,isfsr_ftype_g[6:0],1'b0,isfsr_ctxt_g[1:0],2'b0,isfsr_flt_vld_g,1'b1};

assign	dmmu_va_oor_m = exu_tlu_va_oor_m & ~pstate_am & memref_m & ~lsu_tlu_squash_va_oor_m;

dff_s #(3) dff_dsfsr_stgg (
    .din ({dmmu_va_oor_m,// memref_m,
           exu_tlu_misalign_addr_jmpl_rtn_m,
	       lsu_tlu_misalign_addr_ldst_atm_m}),
    .q   ({dmmu_va_oor_g,
	       misalign_addr_jmpl_rtn_g,
           misalign_addr_ldst_atm_g}),
    .clk (clk),
    .se  (se),
    .si (),
    .so ()
);

//=========================================================================================
//	GLOBAL REGISTER SWITCHING
//=========================================================================================
// modified for bug 3827
//
assign agp_tid_sel = 
           (dnrtry_inst_g) | (tlu_gl_rw_g & wsr_inst_g); 
assign	agp_tid_g[1:0] = 
            agp_tid_sel ? thrid_g[1:0] : trap_tid_g[1:0]; 

dff_s #(2) dff_tlu_agp_tid_w2 (
    .din (agp_tid_g[1:0]),
    .q   (agp_tid_w2[1:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);
//
// added for timing
dff_s #(2) dff_agp_tid_w3 (
    .din (agp_tid_w2[1:0]),
    .q   (agp_tid_w3[1:0]),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

assign tlu_agp_tid_w2[1:0]  = agp_tid_w2[1:0];
assign tlu_exu_agp_tid[1:0] = agp_tid_w3[1:0];

//=========================================================================================
//	CWP/CCR restoration
//=========================================================================================
// code moved to tlu_misctl
/*
dff_s #(8) dff_ccr_stgm (
    .din (tsa_rdata_ccr[7:0]),
    .q   (tlu_exu_ccr_m[7:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s #(3) dff_cwp_stgm (
    .din (tsa_rdata_cwp[2:0]),
    .q   (tlu_exu_cwp_m[2:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s #(8) dff_lsu_asi_m (
    .din (tsa_rdata_asi[7:0]),
    .q   (tlu_lsu_asi_m[7:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
    );
*/
//

assign	tlu_exu_tid_m[1:0] = thrid_m[1:0];

assign	tlu_int_tid_m[1:0] = tlu_exu_tid_m[1:0];
assign	tlu_lsu_tid_m[1:0] = tlu_exu_tid_m[1:0];

// modified due to timing violations
assign	tlu_lsu_asi_update_m = tlu_exu_cwpccr_update_m;

// Assumption is that this will be transmitted in the equivalent
// of the w-stage from the exu.
assign	cwp_cmplt0 = ~exu_tlu_cwp_cmplt_tid[1] & ~exu_tlu_cwp_cmplt_tid[0] 
			& exu_tlu_cwp_cmplt;
assign	cwp_cmplt1 = ~exu_tlu_cwp_cmplt_tid[1] &  exu_tlu_cwp_cmplt_tid[0] 
			& exu_tlu_cwp_cmplt;
assign	cwp_cmplt2 =  exu_tlu_cwp_cmplt_tid[1] & ~exu_tlu_cwp_cmplt_tid[0] 
			& exu_tlu_cwp_cmplt;
assign	cwp_cmplt3 =  exu_tlu_cwp_cmplt_tid[1] &  exu_tlu_cwp_cmplt_tid[0] 
			& exu_tlu_cwp_cmplt;


assign	pending_dntry0_taken = cwp_cmplt0_pending & pending_thrd0_event_taken;
assign	pending_dntry1_taken = cwp_cmplt1_pending & pending_thrd1_event_taken;
assign	pending_dntry2_taken = cwp_cmplt2_pending & pending_thrd2_event_taken;
assign	pending_dntry3_taken = cwp_cmplt3_pending & pending_thrd3_event_taken; 

// Any pending cwp change completes.
// ** This equation can be optimized in terms of gate count **
assign	cwp_cmplt_g = 
		pending_dntry0_taken | pending_dntry1_taken |
		pending_dntry2_taken | pending_dntry3_taken;

// A cwp change related to retry completes.
assign	cwp_cmplt_rtry_g = 
		(cwp_cmplt0_pending & pending_thrd0_event_taken & cwp_retry0) | 
		(cwp_cmplt1_pending & pending_thrd1_event_taken & cwp_retry1) | 
		(cwp_cmplt2_pending & pending_thrd2_event_taken & cwp_retry2) | 
		(cwp_cmplt3_pending & pending_thrd3_event_taken & cwp_retry3); 
// 

dff_s #(2) dff_ccmplt_stgw2 (
    .din ({cwp_cmplt_g,cwp_cmplt_rtry_g}),
    .q   ({cwp_cmplt_w2,cwp_cmplt_rtry_w2}),
    .clk (clk),
    .se  (se),       
    .si  (),          
    .so  ()
);

//=========================================================================================
//	Generate SSCAN data 
//=========================================================================================
// 
assign sscan_tid_sel[`TLU_THRD_NUM-1:0] = ctu_sscan_tid[`TLU_THRD_NUM-1:0]; 
/* 
// logic moved to tlu_misctl
// generating write indicators of ttype to the tsa
assign sscan_tt_wr_sel[0] = 
           tsa_ttype_en & tsa_wr_vld[1] & thread0_wtrp_w2; 
assign sscan_tt_wr_sel[1] = 
           tsa_ttype_en & tsa_wr_vld[1] & thread1_wtrp_w2; 
assign sscan_tt_wr_sel[2] = 
           tsa_ttype_en & tsa_wr_vld[1] & thread2_wtrp_w2; 
assign sscan_tt_wr_sel[3] = 
           tsa_ttype_en & tsa_wr_vld[1] & thread3_wtrp_w2;
//
// generating read indicators of ttype from the tsa
assign sscan_tt_rd_sel[0] = 
           tsa_rd_vld_m & thread0_rsel_m; 
assign sscan_tt_rd_sel[1] = 
           tsa_rd_vld_m & thread1_rsel_m; 
assign sscan_tt_rd_sel[2] = 
           tsa_rd_vld_m & thread2_rsel_m; 
assign sscan_tt_rd_sel[3] = 
           tsa_rd_vld_m & thread3_rsel_m; 

assign sscan_ttype_en[0] = 
           sscan_tt_rd_sel[0] | sscan_tt_wr_sel[0]; 
assign sscan_ttype_en[1] = 
           sscan_tt_rd_sel[1] | sscan_tt_wr_sel[1]; 
assign sscan_ttype_en[2] = 
           sscan_tt_rd_sel[2] | sscan_tt_wr_sel[2]; 
assign sscan_ttype_en[3] = 
           sscan_tt_rd_sel[3] | sscan_tt_wr_sel[3]; 
//
assign sscan_tt0_din[`TSA_TTYPE_WIDTH-1:0] = 
           (sscan_tt_wr_sel[0]) ? 
            final_ttype_w2[`TSA_TTYPE_WIDTH-1:0] : tsa_rdata_ttype_m[`TSA_TTYPE_WIDTH-1:0];  
assign sscan_tt1_din[`TSA_TTYPE_WIDTH-1:0] = 
           (sscan_tt_wr_sel[1]) ? 
            final_ttype_w2[`TSA_TTYPE_WIDTH-1:0] : tsa_rdata_ttype_m[`TSA_TTYPE_WIDTH-1:0];  
assign sscan_tt2_din[`TSA_TTYPE_WIDTH-1:0] = 
           (sscan_tt_wr_sel[2]) ? 
            final_ttype_w2[`TSA_TTYPE_WIDTH-1:0] : tsa_rdata_ttype_m[`TSA_TTYPE_WIDTH-1:0];  
assign sscan_tt3_din[`TSA_TTYPE_WIDTH-1:0] = 
           (sscan_tt_wr_sel[3]) ? 
            final_ttype_w2[`TSA_TTYPE_WIDTH-1:0] : tsa_rdata_ttype_m[`TSA_TTYPE_WIDTH-1:0];  
//
dffe_s #(`TSA_TTYPE_WIDTH) dffe_sscan_tt0_data (
    .din (sscan_tt0_din[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (sscan_tt0_data[`TSA_TTYPE_WIDTH-1:0]),
    .en  (sscan_ttype_en[0]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s #(`TSA_TTYPE_WIDTH) dffe_sscan_tt1_data (
    .din (sscan_tt1_din[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (sscan_tt1_data[`TSA_TTYPE_WIDTH-1:0]),
    .en  (sscan_ttype_en[1]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s #(`TSA_TTYPE_WIDTH) dffe_sscan_tt2_data (
    .din (sscan_tt2_din[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (sscan_tt2_data[`TSA_TTYPE_WIDTH-1:0]),
    .en  (sscan_ttype_en[2]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dffe_s #(`TSA_TTYPE_WIDTH) dffe_sscan_tt3_data (
    .din (sscan_tt3_din[`TSA_TTYPE_WIDTH-1:0]), 
    .q   (sscan_tt3_data[`TSA_TTYPE_WIDTH-1:0]),
    .en  (sscan_ttype_en[3]), 
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s #(`TSA_TTYPE_WIDTH) dff_tsa_rdata_ttype_m (
    .din (tsa_rdata_ttype[`TSA_TTYPE_WIDTH-1:0]), 
	.q   (tsa_rdata_ttype_m[`TSA_TTYPE_WIDTH-1:0]),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_tsa_rd_vld_e ( 
    .din (tsa_rd_vld),
	.q   (tsa_rd_vld_e),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);

dff_s dff_tsa_rd_vld_m (
    .din (tsa_rd_vld_e),
	.q   (tsa_rd_vld_m),
    .clk (clk),
    .se  (se),
    .si  (),
    .so  ()
);
//
// modified - due to sscan_tt[0-3]_data moved to tlu_misctl
mux4ds #(`TCL_SSCAN_WIDTH) mx_sscan_test_data (
       .in0  ({trp_lvl0[2:0],sscan_tt0_data[`TSA_TTYPE_WIDTH-1:0]}),
       .in1  ({trp_lvl1[2:0],sscan_tt1_data[`TSA_TTYPE_WIDTH-1:0]}),
       .in2  ({trp_lvl2[2:0],sscan_tt2_data[`TSA_TTYPE_WIDTH-1:0]}),
       .in3  ({trp_lvl3[2:0],sscan_tt3_data[`TSA_TTYPE_WIDTH-1:0]}),
       .sel0 (sscan_tid_sel[0]),
       .sel1 (sscan_tid_sel[1]),
       .sel2 (sscan_tid_sel[2]),
       .sel3 (sscan_tid_sel[3]),
       .dout (tcl_sscan_test_data[`TCL_SSCAN_WIDTH-1:0])
); 
*/

mux4ds #(`TCL_SSCAN_WIDTH) mx_sscan_test_data (
       .in0  (trp_lvl0[2:0]),
       .in1  (trp_lvl1[2:0]),
       .in2  (trp_lvl2[2:0]),
       .in3  (trp_lvl3[2:0]),
       .sel0 (sscan_tid_sel[0]),
       .sel1 (sscan_tid_sel[1]),
       .sel2 (sscan_tid_sel[2]),
       .sel3 (sscan_tid_sel[3]),
       .dout (tcl_sscan_test_data[`TCL_SSCAN_WIDTH-1:0])
); 

assign tlu_sscan_tcl_data[`TCL_SSCAN_WIDTH-1:0] = 
           tcl_sscan_test_data[`TCL_SSCAN_WIDTH-1:0]; 

//=========================================================================================
//	Instrumentation signals created for sas 
//=========================================================================================
// 
// synopsys translate_off
wire [`TSA_TTYPE_WIDTH-1:0] sas_final_ttype_g;
wire [`TSA_TTYPE_WIDTH-1:0] sas_adj_lsu_ttype_m2;
wire [6:0] sas_hwint_swint_ttype;
wire [`TSA_TTYPE_WIDTH-3:0] sas_rst_ttype_g;

mux4ds #(`TSA_TTYPE_WIDTH) mx_sas_final_ttype_g (
    .sel0 (final_ttype_sel_g[0]),
    .sel1 (final_ttype_sel_g[1]),
    .sel2 (final_ttype_sel_g[2]),
    .sel3 (final_ttype_sel_g[3]),
    .in0  ({2'b0,sas_rst_ttype_g[`TSA_TTYPE_WIDTH-3:0]}),
    .in1  (early_sync_ttype_g[`TSA_TTYPE_WIDTH-1:0]),
    .in2  (sas_adj_lsu_ttype_m2[`TSA_TTYPE_WIDTH-1:0]),
    .in3  (pending_ttype[`TSA_TTYPE_WIDTH-1:0]),
    .dout (sas_final_ttype_g[`TSA_TTYPE_WIDTH-1:0])
); 

mux3ds #(`TSA_TTYPE_WIDTH) mx_sas_adj_lsu_ttype_m2 (
    .sel0 (lsu_defr_trap_g),
    .sel1 (va_oor_data_acc_excp_g & ~lsu_defr_trap_g),
    .sel2 (~(va_oor_data_acc_excp_g | lsu_defr_trap_g)),
    .in0  (9'h032),
    .in1  (9'h030),
    .in2  (lsu_tlu_ttype_m2),
    .dout (sas_adj_lsu_ttype_m2[`TSA_TTYPE_WIDTH-1:0])
); 

assign sas_hwint_swint_ttype[6:0] =
       (hwint_g)? `HWINT_INT:
       (cpu_mondo_trap_g)? `CPU_MONDO_TRAP:
       (dev_mondo_trap_g)? `DEV_MONDO_TRAP:
        {3'b100, tlu_sftint_id[3:0]};

assign sas_rst_ttype_g[`TSA_TTYPE_WIDTH-3:0] =
       (rst_ttype_sel[0])? {4'b00,reset_id_g[2:0]}:
       (rst_ttype_sel[1])? wrap_tlz_ttype[6:0]: 
        sas_hwint_swint_ttype[6:0];

// synopsys translate_on
endmodule
