// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: tlu.v
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
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:
//	Description:	Trap Logic and Memory Management Unit (TLU) :
//			- Contains :
//				- Trap Stack Array (TSA)
//				- Trap Control Logic (TCL)
//				- Mmu internal Register Array (MRA)
//				- Mmu Control Logic (MCL)
//
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the
			// time scale definition

`include        "lsu.tmp.h"
`include        "tlu.h"

`include        "define.tmp.h"
////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module tlu (/*AUTOARG*/
            short_si0,short_si1,short_so0,short_so1,si0,si1,so0,so1,
   tlu_sftint_vld, tlu_hintp_vld, tlu_rerr_vld, tlu_lsu_tl_zero,
   tlu_lsu_stxa_ack, tlu_lsu_redmode_rst_d1, // tlu_lsu_async_ack_w2,
   tlu_lsu_pstate_priv, tlu_lsu_pstate_cle, tlu_lsu_pstate_am, tlu_lsu_tid_m,
   tlu_lsu_pcxpkt, tlu_lsu_ldxa_tid_w2, tlu_lsu_stxa_ack_tid, tlu_lsu_redmode,
   tlu_lsu_asi_update_m, tlu_lsu_asi_m,
   tlu_itlb_wr_vld_g, tlu_itlb_tte_tag_w2, tlu_itlb_tte_data_w2,
   tlu_itlb_tag_rd_g, tlu_itlb_rw_index_vld_g, tlu_itlb_rw_index_g,
   tlu_itlb_dmp_actxt_g, tlu_itlb_invalidate_all_g, tlu_itlb_dmp_vld_g,
   tlu_itlb_dmp_all_g, tlu_itlb_dmp_nctxt_g, tlu_ifu_trapnpc_w2,
   tlu_sscan_test_data, // tlu_sscan_pc,
   tlu_itlb_data_rd_g, tlu_ifu_trappc_vld_w1, tlu_ifu_trappc_w2,
   tlu_ifu_trapnpc_vld_w1, tlu_ifu_trap_tid_w1, tlu_ifu_rstthr_i2,
   tlu_ifu_rstint_i2, tlu_ifu_resumint_i2, tlu_ifu_pstate_pef,
   tlu_ifu_pstate_ie, tlu_ifu_nukeint_i2, // tlu_ifu_int_activate_i3,
   tlu_ifu_hwint_i3, tlu_idtlb_dmp_thrid_g, tlu_idtlb_dmp_key_g,
   tlu_exu_cwpccr_update_m, tlu_exu_cwp_retry_m,
   tlu_exu_cwp_m, tlu_exu_ccr_m, tlu_exu_agp_swap, tlu_exu_agp,
   tlu_dtlb_tte_tag_w2, tlu_dtlb_tte_data_w2,
   tlu_dtlb_tag_rd_g, tlu_dtlb_rw_index_vld_g, tlu_dtlb_rw_index_g,
   tlu_dtlb_invalidate_all_g, tlu_dtlb_dmp_vld_g, tlu_exu_rsr_data_m,
   tlu_dtlb_dmp_sctxt_g, tlu_dtlb_dmp_pctxt_g, tlu_dtlb_dmp_nctxt_g,
   tlu_dtlb_dmp_all_g, tlu_dtlb_dmp_actxt_g, tlu_dtlb_data_rd_g,
   tlu_lsu_int_ldxa_vld_w2, tlu_lsu_ldxa_async_data_vld, // tlu_ifu_flush_pipe_w,
   ifu_lsu_error_inj, tlu_exu_agp_tid, tlu_hpstate_priv, tlu_hpstate_ibe,
   tlu_hpstate_enb, tlu_early_flush_pipe_w, tlu_exu_early_flush_pipe_w,
   tlu_early_flush_pipe2_w, tlu_lsu_int_ldxa_data_w2, tlu_lsu_int_ld_ill_va_w2,
   tlu_exu_priv_trap_m, tlu_exu_pic_onebelow_m, tlu_exu_pic_twobelow_m,
   lsu_exu_ldxa_m, lsu_exu_ldxa_data_g, tlu_dsfsr_flt_vld, tlu_lsu_priv_trap_m,

   `ifndef NO_RTL_CSM
   tlu_dtlb_csm_rd_g, tlu_itlb_csm_rd_g, tlu_dtlb_tte_csm_w2, tlu_itlb_tte_csm_w2,
   tlu_itlb_wr_csm_sel_g, tlu_dtlb_wr_csm_sel_g,
   `endif
   // tlu_lsu_priv_trap_w,
   // Inputs
   se, arst_l, grst_l, sehold,
   // mem_write_disable, // rst_tri_en,
   // mux_drive_disable,
   lsu_tlu_wtchpt_trp_g, ifu_tlu_flush_fd3_w,
   lsu_tlu_ttype_vld_m2, ifu_tlu_flush_fd_w, ifu_tlu_flush_fd2_w,
   lsu_tlu_ttype_m2, lsu_tlu_tlb_st_inst_m, // lsu_tlu_tte_ebit_g,
   lsu_tlu_tlb_ldst_va_m, lsu_tlu_tlb_ld_inst_m, lsu_tlu_tlb_dmp_va_m,
   lsu_tlu_tlb_asi_state_m, lsu_tlu_tlb_access_tid_m, ifu_tlu_flush_m,
   lsu_tlu_st_rs3_data_g, lsu_tlu_early_flush_w, lsu_tlu_early_flush2_w,
   lsu_tlu_priv_action_g, lsu_tlu_pcxpkt_ack, // lsu_tlu_priv_violtn_g,
   lsu_tlu_pctxt_m, lsu_tlu_async_ttype_vld_g, // lsu_tlu_nonalt_ldst_m,
   lsu_tlu_misalign_addr_ldst_atm_m, lsu_tlu_intpkt,
   lsu_tlu_async_ttype_g, lsu_tlu_rs3_data_g, lsu_tlu_defr_trp_taken_g,
   lsu_tlu_dtlb_done, lsu_tlu_dside_ctxt_m, // lsu_tlu_flt_ld_nfo_pg_g,
   lsu_tlu_dmmu_miss_g, lsu_tlu_daccess_prot_g, // lsu_tlu_derr_tid_g,
   lsu_tlu_daccess_excptn_g, lsu_tlu_cpx_vld, ifu_tlu_pc_oor_e,
   lsu_tlu_cpx_req, ifu_tlu_inst_vld_m_bf1, ifu_mmu_trap_m, ifu_tlu_trap_m,
   lsu_asi_state, lsu_asi_reg3, lsu_asi_reg2, lsu_tlu_async_tid_g,
   lsu_asi_reg1, lsu_asi_reg0, ifu_tlu_ttype_vld_m, ifu_tlu_ttype_m,
   ifu_tlu_thrid_d, ifu_tlu_swint_m, ifu_tlu_sir_inst_m, ifu_tlu_l2imiss,
   ifu_tlu_rstint_m, ifu_tlu_retry_inst_d, ifu_tlu_priv_violtn_m, ifu_tlu_pc_m,
   ifu_tlu_npc_m, ifu_tlu_immu_miss_m, ifu_tlu_itlb_done,  ifu_tlu_inst_vld_m,
   ifu_tlu_hwint_m, ifu_lsu_imm_asi_d, ifu_lsu_imm_asi_vld_d, ifu_tlu_done_inst_d,
   ifu_lsu_st_inst_e, ifu_lsu_memref_d, ifu_lsu_ld_inst_e, ffu_tlu_trap_ue,
   ffu_tlu_trap_other, ffu_tlu_trap_ieee754, ffu_tlu_ill_inst_m, ffu_ifu_tid_w2,
   exu_tlu_va_oor_jl_ret_m, exu_tlu_ttype_vld_m, exu_tlu_ttype_m, exu_tlu_va_oor_m,
   exu_tlu_spill_tid, exu_tlu_spill, exu_tlu_spill_other, exu_tlu_spill_wtype,
   exu_tlu_misalign_addr_jmpl_rtn_m, exu_tlu_cwp_retry, exu_mmu_early_va_e,
   exu_tlu_cwp_cmplt_tid, // exu_tlu_spill_ttype,  exu_tlu_cwp_fastcmplt_w,
   exu_tlu_cwp_cmplt, exu_tlu_cwp3, exu_tlu_cwp2, exu_tlu_cwp1,
   exu_tlu_cwp0, exu_tlu_ccr3_w, exu_tlu_ccr2_w, lsu_tlu_ldst_va_m,
   exu_tlu_ccr1_w, exu_tlu_ccr0_w, exu_lsu_ldst_va_e, const_cpuid,
   rclk, ifu_tlu_sraddr_d, ifu_tlu_rsr_inst_d, // ifu_tlu_wsr_inst_d,
   exu_tlu_wsr_data_m,  lsu_tlu_rsr_data_e, ifu_tlu_sraddr_d_v2,
   ifu_lsu_alt_space_e, lsu_tlu_squash_va_oor_m, ifu_tlu_imiss_e,
   lsu_tlu_dcache_miss_w2, lsu_tlu_l2_dmiss, lsu_tlu_stb_full_w2,
   ffu_tlu_fpu_tid, ffu_tlu_fpu_cmplt, spu_tlu_rsrv_illgl_m,
   lsu_pid_state0, lsu_pid_state1, lsu_pid_state2, lsu_pid_state3,
   lsu_tlu_nucleus_ctxt_m,lsu_tlu_tte_pg_sz_g, exu_tlu_ue_trap_m,
   lsu_ifu_inj_ack, ifu_tlu_alt_space_d, // lsu_tlu_ill_inst_m,
   ifu_lsu_thrid_s,lsu_dsfsr_din_g,lsu_dmmu_sfsr_trp_wr,lsu_mmu_flush_pipe_w,
   exu_lsu_priority_trap_m, lsu_tlu_wsr_inst_e, lsu_mmu_defr_trp_taken_g,

   // trin
   core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data
   );

// trin
output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
input wire rtap_core_val;
input wire [1:0] rtap_core_threadid;
input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;
assign core_rtap_data = `CORE_JTAG_BUS_WIDTH'd0;

reg [3:0] ctu_sscan_tid;
always @ *
begin
   if (rtap_core_threadid == 2'd0)
      ctu_sscan_tid = 4'b0001;
   else if (rtap_core_threadid == 2'd1)
      ctu_sscan_tid = 4'b0010;
   else if (rtap_core_threadid == 2'd2)
      ctu_sscan_tid = 4'b0100;
   else if (rtap_core_threadid == 2'd3)
      ctu_sscan_tid = 4'b1000;
end

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
//
// input			clk;			// To tlu_int of sparc_tlu_int.v, ...
input			rclk;			// To tlu_int of sparc_tlu_int.v, ...
input [3:0]		const_cpuid;		// To tlu_int of sparc_tlu_int.v, ...
input [`ASI_VA_WIDTH-1:0] exu_lsu_ldst_va_e;	// To mmu_dp of tlu_mmu_dp.v
input [`TLU_ASI_VA_WIDTH-1:0] lsu_tlu_ldst_va_m;	// To mmu_dp of tlu_mmu_dp.v
input [7:0]     exu_mmu_early_va_e;     // From exu of sparc_exu.v
input [7:0]		exu_tlu_ccr0_w;		// To tdp of tlu_tdp.v
input [7:0]		exu_tlu_ccr1_w;		// To tdp of tlu_tdp.v
input [7:0]		exu_tlu_ccr2_w;		// To tdp of tlu_tdp.v
input [7:0]		exu_tlu_ccr3_w;		// To tdp of tlu_tdp.v
// modified due to timing
// input [2:0]		exu_tlu_cwp0_w;		// To tdp of tlu_tdp.v
// input [2:0]		exu_tlu_cwp1_w;		// To tdp of tlu_tdp.v
// input [2:0]		exu_tlu_cwp2_w;		// To tdp of tlu_tdp.v
// input [2:0]		exu_tlu_cwp3_w;		// To tdp of tlu_tdp.v
input [2:0]		exu_tlu_cwp0;		// To tdp of tlu_tdp.v
input [2:0]		exu_tlu_cwp1;		// To tdp of tlu_tdp.v
input [2:0]		exu_tlu_cwp2;		// To tdp of tlu_tdp.v
input [2:0]		exu_tlu_cwp3;		// To tdp of tlu_tdp.v
input			exu_tlu_cwp_cmplt;	// To tcl of tlu_tcl.v
input [1:0]		exu_tlu_cwp_cmplt_tid;	// To tcl of tlu_tcl.v
// input			exu_tlu_cwp_fastcmplt_w;// To tcl of tlu_tcl.v
input			exu_tlu_cwp_retry;	// To tcl of tlu_tcl.v
input			exu_tlu_misalign_addr_jmpl_rtn_m;// To tcl of tlu_tcl.v
input			exu_tlu_spill;		// To tcl of tlu_tcl.v
input [1:0]		exu_tlu_spill_tid;	// To tcl of tlu_tcl.v
// derive the spill_ttype from spill_other and spill_wtype
// input [8:0]		exu_tlu_spill_ttype;	// To tcl of tlu_tcl.v
input           exu_tlu_spill_other;    // From exu of sparc_exu.v
input [2:0]     exu_tlu_spill_wtype;    // From exu of sparc_exu.v
input [8:0]		exu_tlu_ttype_m;	// To tcl of tlu_tcl.v
input			exu_tlu_ttype_vld_m;	// To tcl of tlu_tcl.v
input			exu_tlu_ue_trap_m;// To tcl of tlu_tcl.v
input			exu_tlu_va_oor_jl_ret_m;// To tcl of tlu_tcl.v
input			exu_tlu_va_oor_m;	// To tcl of tlu_tcl.v
input			ffu_tlu_ill_inst_m;	// new trap from ffu
input [1:0]		ffu_ifu_tid_w2;		// To tcl of tlu_tcl.v
input			ffu_tlu_trap_ieee754;	// To tcl of tlu_tcl.v
input			ffu_tlu_trap_other;	// To tcl of tlu_tcl.v
input			ffu_tlu_trap_ue;	// To tcl of tlu_tcl.v
input			ifu_lsu_ld_inst_e;	// To mmu_ctl of tlu_mmu_ctl.v
input			ifu_lsu_memref_d;	// To tcl of tlu_tcl.v
input			ifu_lsu_st_inst_e;	// To mmu_ctl of tlu_mmu_ctl.v
input			ifu_tlu_done_inst_d;	// To tcl of tlu_tcl.v
// input			ifu_tlu_flsh_inst_e;	// To tcl of tlu_tcl.v
input			ifu_tlu_flush_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_flush_fd_w;	// To tcl of tlu_tcl.v
input			ifu_tlu_flush_fd2_w;	// To tcl of tlu_tcl.v
input			ifu_tlu_flush_fd3_w;	// To tcl of tlu_tcl.v
input			lsu_tlu_early_flush_w;	// To tcl of tlu_tcl.v
input			lsu_tlu_early_flush2_w;	// To tcl of tlu_tcl.v
input			ifu_tlu_hwint_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_immu_miss_m;	// To tcl of tlu_tcl.v, ...
input			ifu_tlu_pc_oor_e;	// To tcl of tlu_tcl.v
input [`TLU_THRD_NUM-1:0] ifu_tlu_l2imiss;	// To tcl of tlu_tcl.v, ...
input			ifu_tlu_inst_vld_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_inst_vld_m_bf1;	// To tcl of tlu_tcl.v
input			ifu_tlu_itlb_done;	// To mmu_ctl of tlu_mmu_ctl.v
// input [1:0]		ifu_tlu_ldst_size_e;	// To mmu_ctl of tlu_mmu_ctl.v
// modified for bug 3017
input [48:0]		ifu_tlu_npc_m;		// To tdp of tlu_tdp.v
input [48:0]		ifu_tlu_pc_m;		// To tdp of tlu_tdp.v
// input [47:0]		ifu_tlu_npc_m;		// To tdp of tlu_tdp.v
// input [47:0]		ifu_tlu_pc_m;		// To tdp of tlu_tdp.v
input			ifu_tlu_priv_violtn_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_retry_inst_d;	// To tcl of tlu_tcl.v
input			ifu_tlu_rstint_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_sir_inst_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_swint_m;	// To tcl of tlu_tcl.v
input [1:0]		ifu_tlu_thrid_d;	// To tcl of tlu_tcl.v
input [1:0]		ifu_lsu_thrid_s;	// To tcl of tlu_tcl.v
input [8:0]		ifu_tlu_ttype_m;	// To tcl of tlu_tcl.v
input			ifu_tlu_ttype_vld_m;	// To tcl of tlu_tcl.v
input			ifu_mmu_trap_m;	    // To tcl of tlu_tcl.v
input			ifu_tlu_trap_m;	    // To tcl of tlu_tcl.v
input [7:0]		lsu_asi_reg0;		// To tdp of tlu_tdp.v
input [7:0]		lsu_asi_reg1;		// To tdp of tlu_tdp.v
input [7:0]		lsu_asi_reg2;		// To tdp of tlu_tdp.v
input [7:0]		lsu_asi_reg3;		// To tdp of tlu_tdp.v
input [`TLU_ASI_STATE_WIDTH-1:0] lsu_asi_state;		// To tcl of tlu_tcl.v, ...
// added asynchronize trap to handle correctable dmmu parity error
input           lsu_tlu_async_ttype_vld_g; // lsu asynchronous trap valid
input           lsu_tlu_defr_trp_taken_g; // lsu asynchronous trap valid
input           lsu_mmu_defr_trp_taken_g; // lsu asynchronous trap valid
input [6:0]     lsu_tlu_async_ttype_g;  // lsu asynchronous trap type
input [1:0]     lsu_tlu_async_tid_g; // asynchronous trap - thread
input [3:0]		lsu_tlu_cpx_req;	// To tlu_int of sparc_tlu_int.v
input			lsu_tlu_cpx_vld;	// To tlu_int of sparc_tlu_int.v
// input [2:0]		lsu_tlu_ctxt_sel_m;	// To tcl of tlu_tcl.v
input			lsu_tlu_daccess_excptn_g;// To tcl of tlu_tcl.v, ...
input			lsu_tlu_daccess_prot_g;	// To tcl of tlu_tcl.v, ...
// input [1:0]		lsu_tlu_derr_tid_g;	// To tcl of tlu_tcl.v
input			lsu_tlu_dmmu_miss_g;	// To tcl of tlu_tcl.v, ...
input [12:0]	lsu_tlu_dside_ctxt_m;	// To mmu_dp of tlu_mmu_dp.v
input			lsu_tlu_dtlb_done;	// To mmu_ctl of tlu_mmu_ctl.v
// input			lsu_tlu_flt_ld_nfo_pg_g;// To tcl of tlu_tcl.v
// input			lsu_tlu_illegal_asi_action_g;// To tcl of tlu_tcl.v
input [17:0]	lsu_tlu_intpkt;		// To tlu_int of sparc_tlu_int.v
// modified for shadow scan
// input [3:0] lsu_tlu_iobrdge_pc_sel;
input			lsu_tlu_misalign_addr_ldst_atm_m;// To tcl of tlu_tcl.v
// input			lsu_tlu_nonalt_ldst_m;	// To tcl of tlu_tcl.v
input [12:0]	lsu_tlu_pctxt_m;	// To mmu_dp of tlu_mmu_dp.v
input			lsu_tlu_pcxpkt_ack;	// To tlu_int of sparc_tlu_int.v
input			lsu_tlu_priv_action_g;	// To tcl of tlu_tcl.v
// input			lsu_tlu_priv_violtn_g;	// To tcl of tlu_tcl.v
// input			lsu_tlu_spec_access_epage_g;// To tcl of tlu_tcl.v
input [63:0]	lsu_tlu_st_rs3_data_g;	// To tlu_int of sparc_tlu_int.v, ...
input [63:0]	lsu_tlu_rs3_data_g;	// To tlu_int of sparc_tlu_int.v, ...
// added for timing
input [1:0]		lsu_tlu_tlb_access_tid_m;// To mmu_ctl of tlu_mmu_ctl.v
input [7:0]		lsu_tlu_tlb_asi_state_m;// To mmu_ctl of tlu_mmu_ctl.v
input [47:13]	lsu_tlu_tlb_dmp_va_m;	// To mmu_dp of tlu_mmu_dp.v
input			lsu_tlu_tlb_ld_inst_m;	// To mmu_ctl of tlu_mmu_ctl.v
input [`L1D_ADDRESS_HI:0]	lsu_tlu_tlb_ldst_va_m;	// To mmu_ctl of tlu_mmu_ctl.v
input			lsu_tlu_tlb_st_inst_m;	// To mmu_ctl of tlu_mmu_ctl.v
// input			lsu_tlu_tte_ebit_g;	// To tcl of tlu_tcl.v
input [8:0]		lsu_tlu_ttype_m2;	// To tcl of tlu_tcl.v
// removed unused bits
// input [1:0]	lsu_tlu_ttype_tid_m2;	// To tcl of tlu_tcl.v
input			lsu_tlu_ttype_vld_m2;	// To tcl of tlu_tcl.v
// input			lsu_tlu_uncache_atomic_g;// To tcl of tlu_tcl.v
// input			lsu_tlu_write_op_m;	// To tcl of tlu_tcl.v
input			lsu_tlu_wtchpt_trp_g;	// To tcl of tlu_tcl.v
// input		lsu_tlu_xslating_ldst_m;// To tcl of tlu_tcl.v
// input		reset;			// To mmu_ctl of tlu_mmu_ctl.v
// input		rst_l;			// To tcl of tlu_tcl.v, ...
input			grst_l;			// To tcl of tlu_tcl.v, ...
input			arst_l;			// To tcl of tlu_tcl.v, ...
// input			rst_tri_en;	// To tcl of tlu_tcl.v, ...
// input			mem_write_disable;	// To tcl of tlu_tcl.v, ...
// input			mux_drive_disable;	// To tcl of tlu_tcl.v, ...
wire mux_drive_disable = ~grst_l;
wire mem_write_disable = ~grst_l;
// input			testmode_l;	// To tcl of tlu_tcl.v, ...
input			sehold;			// To tlu_int of sparc_tlu_int.v, ...
input			se;			// To tlu_int of sparc_tlu_int.v, ...
input			si0,si1,short_si0,short_si1;			// To tlu_int of sparc_tlu_int.v, ...
// End of automatics
// Read/Write Privileged State Register Access.
input  	[`TLU_ASR_ADDR_WIDTH-1:0] ifu_tlu_sraddr_d;      // addr of sr(st/pr)
input  	[`TLU_ASR_ADDR_WIDTH-1:0] ifu_tlu_sraddr_d_v2;   // addr of sr(st/pr)
input           ifu_tlu_rsr_inst_d ;	// valid rd sr(st/pr)
// modified for timing
// input           ifu_tlu_wsr_inst_d ;	// valid wr sr(st/pr)
input           lsu_tlu_wsr_inst_e ;	// valid wr sr(st/pr)
input  	[63:0]  exu_tlu_wsr_data_m ;    // pr/st data to irf.

// input   [1:0]   ifu_tlu_thrid_e ;   	// Thread id.
input	[7:0]	lsu_tlu_rsr_data_e ;	// sr/pr rd data from lsu.

input			ifu_lsu_alt_space_e;	// alt-space access
input		    ifu_tlu_alt_space_d;	// alt-space access - d stage
input           lsu_tlu_squash_va_oor_m;// squash va_oor for mem-op.
// input           lsu_tlu_ill_inst_m;     // new illegal instru from spu via lsu
//
// new interfaces to the pib
input			ifu_tlu_imiss_e;	    // icache misses -- New interface
input [3:0]		lsu_tlu_dcache_miss_w2;	// dcache miss -- new interface
input [3:0]		lsu_tlu_l2_dmiss;	    // l2 misses -- new interface
input [3:0]		lsu_tlu_stb_full_w2;	// store buffer full -- new interface
input [1:0]		ffu_tlu_fpu_tid;	    // ThrdID for the FF instr_cmplt -- new
input       	ffu_tlu_fpu_cmplt;	    // FF instru complete -- new
//
// New trap from SPU
// removed for timing fix
input       	spu_tlu_rsrv_illgl_m;	// illegal instruction from SPU
input  [2:0]   	lsu_pid_state0 ;        // pid thread0 ; global use
input  [2:0]   	lsu_pid_state1 ;        // pid thread1 ; global use
input  [2:0]   	lsu_pid_state2 ;        // pid thread2 ; global use
input  [2:0]   	lsu_pid_state3 ;        // pid thread3 ; global use
// input [48:0] ifu_tlu_pc_w;

input           lsu_tlu_nucleus_ctxt_m ;// access is nucleus context
input  [2:0]    lsu_tlu_tte_pg_sz_g ;   // page-size of tte
input	[3:0]	ifu_lsu_error_inj ;	// inject parity error into tlb
input   [8:0]   ifu_lsu_imm_asi_d;      // asi state value from imm
input           ifu_lsu_imm_asi_vld_d;  // valid asi state value from imm

input	[23:0]	lsu_dsfsr_din_g ;	// now from lsu instead of tlu_tcl
input	[3:0]	lsu_dmmu_sfsr_trp_wr ;	// now from lsu instead of tlu_tcl

input		lsu_mmu_flush_pipe_w ; // full trap

input		exu_lsu_priority_trap_m ;//fill,ue


// output [5:0] int_tlu_rstid_i2;	// From tlu_int of sparc_tlu_int.v
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [63:0]	tlu_lsu_int_ldxa_data_w2; // From tlu_int of sparc_tlu_int.v
output			tlu_lsu_int_ld_ill_va_w2; // From tlu_int of sparc_tlu_int.v
output			tlu_lsu_int_ldxa_vld_w2; // From tlu_int of sparc_tlu_int.v
output			so0,so1,short_so0,short_so1;			// From tlu_int of sparc_tlu_int.v, ...
output			tlu_dtlb_data_rd_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_actxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_all_g;	// From mmu_ctl of tlu_mmu_ctl.v
//output		tlu_dtlb_dmp_by_ctxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_nctxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_pctxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_sctxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_dmp_vld_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_invalidate_all_g;// From mmu_ctl of tlu_mmu_ctl.v
output [5:0]	tlu_dtlb_rw_index_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_rw_index_vld_g;// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_dtlb_tag_rd_g;	// From mmu_ctl of tlu_mmu_ctl.v
output [42:0]	tlu_dtlb_tte_data_w2;	// From mmu_dp of tlu_mmu_dp.v
output [58:0]	tlu_dtlb_tte_tag_w2;	// From mmu_dp of tlu_mmu_dp.v
output[3:0]		lsu_ifu_inj_ack ;	// ack for tlb error injection.
//
// width modified for hypervisor support
// output [2:0]	tlu_exu_agp;		// From tcl of tlu_tcl.v
output [`TSA_GLOBAL_WIDTH-1:0] tlu_exu_agp;		// From tcl of tlu_tcl.v
output			tlu_exu_agp_swap;	// From tcl of tlu_tcl.v
output [1:0]    tlu_exu_agp_tid;        // From tcl of tlu_tcl.v
output [7:0]	tlu_exu_ccr_m;		// From tcl of tlu_tcl.v
output [2:0]	tlu_exu_cwp_m;		// From tcl of tlu_tcl.v
output			tlu_exu_cwp_retry_m;	// From tcl of tlu_tcl.v
output			tlu_exu_cwpccr_update_m;// From tcl of tlu_tcl.v
// tlu_exu_rsr_data_e being replaced by tlu_exu_rsr_data_m
// the bus will become obsolete
// output [`TLU_ASR_DATA_WIDTH-1:0] tlu_exu_rsr_data_e;     // From tdp of tlu_tdp.v
output [`TLU_ASR_DATA_WIDTH-1:0] tlu_exu_rsr_data_m;     // From tdp of tlu_tdp.v
output [40:0]	tlu_idtlb_dmp_key_g;	// From mmu_dp of tlu_mmu_dp.v
output [1:0]	tlu_idtlb_dmp_thrid_g;	// From mmu_ctl of tlu_mmu_ctl.v
output [3:0]	tlu_ifu_hwint_i3;	// From tlu_int of sparc_tlu_int.v
// removed - ifu will derive the signal internally
// output [3:0]	tlu_ifu_int_activate_i3;// From tlu_int of sparc_tlu_int.v
output			tlu_ifu_nukeint_i2;	// From tlu_int of sparc_tlu_int.v
output [3:0]	tlu_ifu_pstate_ie;	// From tlu_int of sparc_tlu_int.v
output [3:0]	tlu_ifu_pstate_pef;	// From tdp of tlu_tdp.v
output			tlu_ifu_resumint_i2;	// From tlu_int of sparc_tlu_int.v
output			tlu_ifu_rstint_i2;	// From tlu_int of sparc_tlu_int.v
output [3:0]	tlu_ifu_rstthr_i2;	// From tlu_int of sparc_tlu_int.v
output [1:0]	tlu_ifu_trap_tid_w1;	// From tcl of tlu_tcl.v
output			tlu_ifu_trapnpc_vld_w1;	// From tdp of tlu_tdp.v
output [48:0]	tlu_ifu_trapnpc_w2;	// From tdp of tlu_tdp.v
output [48:0]	tlu_ifu_trappc_w2;	// From tdp of tlu_tdp.v
// output [47:0]	tlu_ifu_trapnpc_w2;	// From tdp of tlu_tdp.v
// output [47:0]	tlu_ifu_trappc_w2;	// From tdp of tlu_tdp.v
output			tlu_ifu_trappc_vld_w1;	// From tcl of tlu_tcl.v
output			tlu_itlb_data_rd_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_dmp_actxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_dmp_all_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_dmp_nctxt_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_dmp_vld_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_invalidate_all_g;// From mmu_ctl of tlu_mmu_ctl.v
output [5:0]	tlu_itlb_rw_index_g;	// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_rw_index_vld_g;// From mmu_ctl of tlu_mmu_ctl.v
output			tlu_itlb_tag_rd_g;	// From mmu_ctl of tlu_mmu_ctl.v
output [42:0]	tlu_itlb_tte_data_w2;	// From mmu_dp of tlu_mmu_dp.v
output [58:0]	tlu_itlb_tte_tag_w2;	// From mmu_dp of tlu_mmu_dp.v
output			tlu_itlb_wr_vld_g;	// From mmu_ctl of tlu_mmu_ctl.v
output [7:0]	tlu_lsu_asi_m;		// From tcl of tlu_tcl.v
output			tlu_lsu_asi_update_m;	// From tcl of tlu_tcl.v

`ifndef NO_RTL_CSM
output          tlu_dtlb_csm_rd_g;
output          tlu_itlb_csm_rd_g;
output [`TLB_CSM] tlu_dtlb_tte_csm_w2;
output [`TLB_CSM] tlu_itlb_tte_csm_w2;
output      	tlu_itlb_wr_csm_sel_g;
output      	tlu_dtlb_wr_csm_sel_g;
`endif

// replaced by shadow scan signals
output [62:0]	tlu_sscan_test_data;// From tdp of tlu_tdp.v
// output [47:0]	tlu_sscan_pc;// From tdp of tlu_tdp.v
// output [63:0]	tlu_lsu_ldxa_data_w2;	// From mmu_dp of tlu_mmu_dp.v
output [1:0]	tlu_lsu_ldxa_tid_w2;	// From mmu_ctl of tlu_mmu_ctl.v
output [25:0]	tlu_lsu_pcxpkt;		// From tlu_int of sparc_tlu_int.v
output [3:0]	tlu_lsu_pstate_am;	// From tcl of tlu_tcl.v
output [3:0]	tlu_lsu_pstate_cle;	// From tdp of tlu_tdp.v
output [3:0]	tlu_lsu_pstate_priv;	// From tdp of tlu_tdp.v
output [3:0]	tlu_lsu_redmode;	// From tcl of tlu_tcl.v
// output [3:0]	tlu_lsu_redmode_rst;	// From tcl of tlu_tcl.v
output [3:0]	tlu_lsu_redmode_rst_d1;	// From tcl of tlu_tcl.v
// output [`TLU_THRD_NUM-1:0] tlu_lsu_async_ack_w2;	// From tcl of tlu_tcl.v
output			tlu_lsu_stxa_ack;	// From mmu_ctl of tlu_mmu_ctl.v
output [1:0]	tlu_lsu_stxa_ack_tid;	// From mmu_ctl of tlu_mmu_ctl.v
output [1:0]	tlu_lsu_tid_m;		// From tcl of tlu_tcl.v
output [`TLU_THRD_NUM-1:0] tlu_lsu_tl_zero;	// From tcl of tlu_tcl.v
output [`TLU_THRD_NUM-1:0] tlu_sftint_vld; // From tcl of tlu_tcl.v
output [`TLU_THRD_NUM-1:0] tlu_hintp_vld;  // From tcl of tlu_tcl.v
output [`TLU_THRD_NUM-1:0] tlu_rerr_vld;  // From tcl of tlu_tcl.v
// End of automatics
   // Outputs
// End of automatics
// output tlu_ifu_flush_pipe_w;	// From tcl of tlu_tcl.v
output tlu_early_flush_pipe_w;	// From tcl of tlu_tcl.v
output tlu_early_flush_pipe2_w;	// From tcl of tlu_tcl.v
output tlu_exu_early_flush_pipe_w;	// From tcl of tlu_tcl.v
output tlu_lsu_ldxa_async_data_vld ; // tlu_lsu_ldxa_data_vld is for async op.
output [`TLU_THRD_NUM-1:0] tlu_hpstate_priv;
output [`TLU_THRD_NUM-1:0] tlu_hpstate_enb;
// added for hpstate.ibe ECO
output [`TLU_THRD_NUM-1:0] tlu_hpstate_ibe;
output tlu_exu_priv_trap_m; // local traps send to exu
output tlu_lsu_priv_trap_m; // local traps send to exu
// output tlu_lsu_priv_trap_w; // local traps send to exu
output tlu_exu_pic_onebelow_m; // local traps send to exu
output tlu_exu_pic_twobelow_m; // local traps send to exu
//
// added for MMU performance enhancement
output		lsu_exu_ldxa_m ;
output	[63:0]	lsu_exu_ldxa_data_g ;
// Added to shift dsfsr logic from tlu to lsu.
output	[3:0]	tlu_dsfsr_flt_vld;	// From mmu_dp of tlu_mmu_dp.v


//
// added to abide to the Niagara reset methodology
wire            tlu_rst;   // local active high reset - from tlu_tcl
wire            rclk;      // temprary clock name
wire [63:0]		tlu_pib_rsr_data_e;	// From tdp of tlu_tdp.v
// wire            tlu_rst_l; // local active high reset - from tlu_tcl
wire            int_rst_l; // local active high reset - from tlu_tcl
// wire            pib_rst_l; // local active high reset - from tlu_tcl
wire [1:0]		tlu_incr_tick;		// From tcl of tlu_tcl.v
wire [1:0]		tlu_tckctr_in;		// From tcl of tlu_tcl.v
// wire [60:0]		tlu_tick_incr_dout;	// To tdp of tlu_tdp.v
wire [61:0]		tlu_incr64_dout;	// To tdp of tlu_tdp.v
wire [61:0]		tlu_tick_incr_din;	// From tdp of tlu_tdp.v
wire			tlu_tick_ctl_din;		// To tlu_int of sparc_tlu_int.v
// modified for bug 3017
wire [48:0]		tlu_restore_pc_w1;
wire [48:0]		tlu_restore_npc_w1;
wire [48:0]		tlu_pc_new_w;
wire [48:0]		tlu_npc_new_w;
wire [33:0]		tlu_partial_trap_pc_w1;
wire [1:0]		tlu_int_tid_m;		// To tlu_int of sparc_tlu_int.v
//wire [3:0]		tlu_sftint_vld;		// From tcl of tlu_tcl.v
wire			tlu_asi_write_g;	// From hyperv of tlu_hyperv.v
wire			tlu_tte_real_g ;	// tte is real
wire [`TLU_THRD_NUM-1:0] tlu_hpstate_tlz;
wire [`TLU_ASI_STATE_WIDTH-1:0] tlu_asi_state_e;
// modified due to memory macro swap
//
// wire [`TSA_MEM_WIDTH-1:0]		tsa_dout;
wire [`TSA_MEM_WIDTH-1:0] tsa0_dout;
wire [`TSA_MEM_WIDTH-1:0] tsa1_dout;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [`TLU_ASR_DATA_WIDTH-1:0]		tlu_wsr_data_w;	// From tdp of tlu_tdp.v
wire			dmmu_any_sfsr_wr;	// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		dmmu_sfar_wr_en_l;	// From mmu_ctl of tlu_mmu_ctl.v
// wire [3:0]		dmmu_sfsr_trp_wr;	// From tcl of tlu_tcl.v
wire [3:0]		dmmu_sfsr_wr_en_l;	// From mmu_ctl of tlu_mmu_ctl.v
wire			immu_any_sfsr_wr;	// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		immu_sfsr_trp_wr;	// From tcl of tlu_tcl.v
wire [3:0]		immu_sfsr_wr_en_l;	// From mmu_ctl of tlu_mmu_ctl.v
wire [5:0]		int_tlu_rstid_m;	// From tlu_int of sparc_tlu_int.v
wire			itlb_wr_vld_g;		// From mmu_ctl of tlu_mmu_ctl.v
wire [7:0]		lsu_tlu_rsr_data_mod_e;	// From tcl of tlu_tcl.v
wire [19:0]		mra_byte_wen;		// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		mra_rd_ptr;		// From mmu_ctl of tlu_mmu_ctl.v
wire			mra_rd_vld;		// From mmu_ctl of tlu_mmu_ctl.v
wire [159:10]		mra_rdata;		// From mra of tlu_mra.v
wire [155:0]		mra_wdata;		// From mmu_dp of tlu_mmu_dp.v
wire [3:0]		mra_wr_ptr;		// From mmu_ctl of tlu_mmu_ctl.v
wire			mra_wr_vld;		// From mmu_ctl of tlu_mmu_ctl.v
wire [2:0]		tag_access_wdata_sel;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlb_access_rst_l;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlu_addr_msk_g;		// From tcl of tlu_tcl.v
wire			tlu_admp_key_sel;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlu_clr_sftint_l_g;	// From tcl of tlu_tcl.v
wire [4:0]		tlu_dmp_key_vld_g;	// From mmu_ctl of tlu_mmu_ctl.v
wire [2:0]      tlu_true_pc_sel_w;
wire [48:0]     ifu_npc_w;
wire [3:0]		tlu_dsfsr_flt_vld;	// From mmu_dp of tlu_mmu_dp.v
wire [47:13]	tlu_dtag_access_w2;	// From mmu_dp of tlu_mmu_dp.v
wire [3:0]		tlu_dtsb_size_w2;	// From mmu_dp of tlu_mmu_dp.v
wire			tlu_dtsb_split_w2;	// From mmu_dp of tlu_mmu_dp.v
wire [1:0]		tlu_agp_tid_w2;	    // From tcl of tlu_tcl.v
wire [`TSA_TTYPE_WIDTH-1:0] tlu_final_offset_w1;	// From tcl of tlu_tcl.v
wire [`TSA_TTYPE_WIDTH-1:0] tlu_final_ttype_w2;	// From tcl of tlu_tcl.v
wire			tlu_full_flush_pipe_w2;	// From tcl of tlu_tcl.v
wire            tlu_tcc_inst_w;	// From tcl of tlu_tcl.v
wire			tlu_local_flush_w;	// From tcl of tlu_tcl.v
wire [47:0]		tlu_idtsb_8k_ptr;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlu_asi_data_nf_vld_w2;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlu_inst_vld_nq_m;		// From tcl of tlu_tcl.v
wire			tlu_int_asi_load;	// From mmu_ctl of tlu_mmu_ctl.v
wire [1:0]		tlu_int_asi_thrid;	// From mmu_ctl of tlu_mmu_ctl.v
wire			tlu_int_asi_vld;	// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		tlu_int_pstate_ie;	// From tdp of tlu_tdp.v
wire [3:0]		tlu_int_redmode;	// From tdp of tlu_tdp.v
wire [23:0]		tlu_isfsr_din_g;	// From tcl of tlu_tcl.v
wire [3:0]		tlu_isfsr_flt_vld;	// From mmu_dp of tlu_mmu_dp.v
//wire [47:13]		tlu_itsb_base_w2;	// From mmu_dp of tlu_mmu_dp.v
wire [3:0]		tlu_itsb_size_w2;	// From mmu_dp of tlu_mmu_dp.v
wire			tlu_itsb_split_w2;	// From mmu_dp of tlu_mmu_dp.v
wire [3:0]		tlu_ldxa_l1mx1_sel;	// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		tlu_ldxa_l1mx2_sel;	// From mmu_ctl of tlu_mmu_ctl.v
wire [2:0]		tlu_ldxa_l2mx1_sel;	// From mmu_ctl of tlu_mmu_ctl.v
// wire			tlu_mmu_sync_data_excp_g;// From mmu_ctl of tlu_mmu_ctl.v
wire [3:0]		tlu_pil;		// From tcl of tlu_tcl.v
wire			tlu_tlb_tag_invrt_parity ;
wire			tlu_tlb_data_invrt_parity ;
wire                  tlu_sun4r_tte_g ;       // sun4r vs. sun4v tte
//
// modified for bug 1767
/*
wire [1:0]		tlu_pstate0_mmodel;	// From tdp of tlu_tdp.v
wire [1:0]		tlu_pstate1_mmodel;	// From tdp of tlu_tdp.v
wire [1:0]		tlu_pstate2_mmodel;	// From tdp of tlu_tdp.v
wire [1:0]		tlu_pstate3_mmodel;	// From tdp of tlu_tdp.v
wire [`TLU_THRD_NUM-1:0] tlu_pstate_tle;		// From tdp of tlu_tdp.v
wire [`TLU_THRD_NUM-1:0] tlu_pstate_cle;		// From tdp of tlu_tdp.v
*/
wire [`TLU_THRD_NUM-1:0] tlu_pstate_am;		// From tdp of tlu_tdp.v
wire [1:0]		tlu_pstate_din_sel0;	// From tcl of tlu_tcl.v
wire [1:0]		tlu_pstate_din_sel1;	// From tcl of tlu_tcl.v
wire [1:0]		tlu_pstate_din_sel2;	// From tcl of tlu_tcl.v
wire [1:0]		tlu_pstate_din_sel3;	// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_pstate_priv;	// From tdp of tlu_tdp.v
// wire			tlu_retry_inst_m;	// From tcl of tlu_tcl.v
//
// modified for hypervisor support and bug 1767
/*
wire			tlu_select_alt_global;	// From tcl of tlu_tcl.v
wire			tlu_select_int_global;	// From tcl of tlu_tcl.v
wire			tlu_select_mmu_global;	// From tcl of tlu_tcl.v
wire [1:0]		tlu_select_mmodel;	// From tcl of tlu_tcl.v
wire			tlu_select_tle;		// From tcl of tlu_tcl.v
*/
wire			tlu_select_redmode;	// From tcl of tlu_tcl.v
// wire			tlu_select_tba_g;	// From tcl of tlu_tcl.v
wire			tlu_select_tba_w2;	// From tcl of tlu_tcl.v
wire			tdp_select_tba_w2;	// From tcl of tlu_tcl.v
// wire			tlu_self_boot_rst_g;	// From tcl of tlu_tcl.v
// wire			tlu_self_boot_rst_w2;	// From tcl of tlu_tcl.v
wire			tlu_set_sftint_l_g;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_sftint_en_l_g;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_sftint_mx_sel;	// From tcl of tlu_tcl.v
wire [3:0]		tlu_sftint_id;		// From tdp of tlu_tdp.v
// wire [3:0]		tlu_sftint_lvl14_int;	// From tcl of tlu_tcl.v
wire [3:0]		tlu_sftint_penc_sel;	// From tcl of tlu_tcl.v
wire [3:0]		tlu_slxa_thrd_sel;	// From mmu_ctl of tlu_mmu_ctl.v
wire [2:0]		tlu_tag_access_ctxt_sel_m;// From tcl of tlu_tcl.v
//wire			tlu_tag_access_nctxt_g;	// From mmu_dp of tlu_mmu_dp.v
wire [`TLU_THRD_NUM-1:0] tlu_tba_en_l;		// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_thrd_rsel_e;	// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_thrd_rsel_g;	// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_thrd_wsel_g;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_thrd_wsel_w2;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_thread_wsel_g;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_thread_inst_vld_g;	// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_thread_inst_vld_w2;	// From tcl of tlu_tcl.v
wire			tlu_tick_en_l;		// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_tick_int;		// From tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] tlu_stick_int;		// From tcl of tlu_tcl.v
// wire			tlu_tick_match;		// From tdp of tlu_tdp.v
wire			tlu_tick_npt;		// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_tickcmp_en_l;	// From tcl of tlu_tcl.v
// wire			tlu_tickcmp_intdis;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_tickcmp_sel;	// From tcl of tlu_tcl.v
// wire			tlu_tl_gt_0_g;		// From tcl of tlu_tcl.v
wire			tlu_tl_gt_0_w2;		// From tcl of tlu_tcl.v
wire [2:0]		tlu_trp_lvl;		// From tcl of tlu_tcl.v
wire [2:0]		tlu_tte_tag_g;		// From mmu_ctl of tlu_mmu_ctl.v
wire [2:0]		tlu_tte_wr_pid_g;	// From mmu_ctl of tlu_mmu_ctl.v
// wire [`TLU_THRD_NUM-1:0] tlu_update_pc_l_m;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_update_pc_l_w;	// From tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_trap_cwp_en;	// From tcl of tlu_tcl.v
wire tlu_cwp_no_change_m;	// From tcl of tlu_tcl.v
// modified due to timing
// wire [3:0]		tlu_update_pstate_l_g;	// From tcl of tlu_tcl.v
wire [3:0]		tlu_update_pstate_l_w2;	// From tcl of tlu_tcl.v
wire			tlu_wr_sftint_l_g;	// From tcl of tlu_tcl.v
// wire			tlu_wsr_inst_g;		// From tcl of tlu_tcl.v
wire			tlu_wsr_inst_nq_g;		// From tcl of tlu_tcl.v
// wire			tlu_wr_tsa_inst_g;	// From tcl of tlu_tcl.v
wire			tlu_wr_tsa_inst_w2;	// From tcl of tlu_tcl.v
wire			tsa_npc_en;		// From tcl of tlu_tcl.v
wire			tsa_pc_en;		// From tcl of tlu_tcl.v
wire [1:0]		tsa_rd_tid;		// From tcl of tlu_tcl.v
wire [2:0]		tsa_rd_tpl;		// From tcl of tlu_tcl.v
wire			tsa_rd_vld_e;   // From tcl of tlu_tcl.v
wire			tsa_rd_en;		// From tcl of tlu_tcl.v
// wire [`TLU_TSA_WIDTH-1:0]		tsa_rdata;		// From tsa of tlu_tsa.v
wire			tsa_tstate_en;		// From tcl of tlu_tcl.v
wire			tsa_htstate_en;		// From tlu_hyperv of tlu_hyperv.v
wire			tsa_ttype_en;		// From tcl of tlu_tcl.v
wire [`TLU_TSA_WIDTH-1:0]		tsa_wdata;		// From tdp of tlu_tdp.v
wire [1:0]		tsa_wr_tid;		// From tcl of tlu_tcl.v
wire [2:0]		tsa_wr_tpl;		// From tcl of tlu_tcl.v
// modified due to tsa memory swap
wire [1:0]		tsa_wr_vld;		// From tcl of tlu_tcl.v
wire			tlu_htstate_rw_d;  // From tlu_hyperv of tlu_hyperv.v
wire			tlu_htstate_rw_g;  // From tlu_hyperv of tlu_hyperv.v
// modified due to rsr mux recode
// wire			tlu_htba_mx2_sel;  // From tlu_hyperv of tlu_hyperv.v
wire			tlu_htickcmp_rw_e; // From tlu_hyperv of tlu_hyperv.v
// End of automatics
wire [`TLU_ASI_QUE_WIDTH-1:0] tlu_asi_queue_rdata_g;
wire tlu_asi_queue_rd_vld_g;
wire tlu_ld_data_vld_g;
wire tlu_va_ill_g;
// wire tlu_va_all_zero_g;
//
// modified for timing fixes
// wire [3:0]		pib_priv_act_trap ;
wire [3:0]		pib_priv_act_trap_m ;
// wire [`QUE_TRAP_SEL_WIDTH-1:0] tlu_que_trap_sel_m;
wire [5:0] tlu_ctxt_cfg_w2;	// To mmu_ctl of tlu_mmu_ctl.v
wire [`TLU_THRD_NUM-1:0] pib_picl_wrap;		// To tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] pib_pich_wrap;		// To tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] pich_wrap_flg;		// To tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] pich_onebelow_flg;		// To tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] pich_twobelow_flg;		// To tcl of tlu_tcl.v
wire tlu_pic_onebelow_e;		// To tcl of tlu_tcl.v
wire tlu_pic_twobelow_e;		// To tcl of tlu_tcl.v
wire tlu_pic_wrap_e;		// To tcl of tlu_tcl.v
//
// modified for bug 5436: Niagara 2.0
wire [`TLU_THRD_NUM-1:0] tlu_pcr_ut;		// To tcl of tlu_tcl.v
wire [`TLU_THRD_NUM-1:0] tlu_pcr_st;		// To tcl of tlu_tcl.v
// wire tlu_pcr_ut_e;		// To tcl of tlu_tcl.v
// wire tlu_pcr_st_e;		// To tcl of tlu_tcl.v
wire tlu_pic_cnt_en_m;		// To tcl of tlu_tcl.v
// wire [`TLU_THRD_NUM-1:0] pich_threebelow_flg;	// To tcl of tlu_tcl.v
//
// added for hypervisor support
wire [`TSA_GLOBAL_WIDTH-1:0] tlu_dnrtry_global_g;
// wire tlu_htick_match;
// wire tlu_stick_match;
wire tlu_trap_hpstate_enb;
wire [`TLU_THRD_NUM-1:0] local_hpstate_priv;
wire [`TLU_THRD_NUM-1:0] tcl_hpstate_priv;
wire [`TLU_THRD_NUM-1:0] local_hpstate_enb;
wire [`TLU_THRD_NUM-1:0] tcl_hpstate_enb;
wire [`TLU_THRD_NUM-1:0] local_pstate_priv;
wire [`TLU_THRD_NUM-1:0] local_pstate_ie;

wire [`TSA_GLOBAL_WIDTH-1:0] tlu_gl_lvl0;
wire [`TSA_GLOBAL_WIDTH-1:0] tlu_gl_lvl1;
wire [`TSA_GLOBAL_WIDTH-1:0] tlu_gl_lvl2;
wire [`TSA_GLOBAL_WIDTH-1:0] tlu_gl_lvl3;
// wire [`TLU_THRD_NUM-1:0] tlu_hintp_en_l_g;
wire [`TLU_THRD_NUM-1:0] tlu_htba_en_l;
wire [`TLU_THRD_NUM-1:0] tlu_htickcmp_en_l;
// wire [`TLU_THRD_NUM-1:0] tlu_set_hintp_g;
wire [`TLU_THRD_NUM-1:0] tlu_set_hintp_sel_g;
wire [`TLU_THRD_NUM-1:0] tlu_stickcmp_en_l;
// modified for timing
// wire [`TLU_THRD_NUM-1:0] tlu_update_hpstate_l_g;
wire [`TLU_THRD_NUM-1:0] tlu_update_hpstate_l_w2;
wire [`TLU_THRD_NUM-1:0] tlu_wr_hintp_g;
wire [`TLU_THRD_NUM-1:0] tlu_cpu_mondo_cmp;
wire [`TLU_THRD_NUM-1:0] tlu_dev_mondo_cmp;
wire [`TLU_THRD_NUM-1:0] tlu_resum_err_cmp;
wire [`TLU_THRD_NUM-1:0] tlu_hintp;
wire [1:0] tlu_hpstate_din_sel0;
wire [1:0] tlu_hpstate_din_sel1;
wire [1:0] tlu_hpstate_din_sel2;
wire [1:0] tlu_hpstate_din_sel3;
wire [4:0] tlu_hyperv_rdpr_sel;
wire [2:0] tlu_rdpr_mx1_sel;
wire [2:0] tlu_rdpr_mx2_sel;
wire [1:0] tlu_rdpr_mx3_sel;
wire [1:0] tlu_rdpr_mx4_sel;
wire [2:0] tlu_rdpr_mx5_sel;
wire [2:0] tlu_rdpr_mx6_sel;
wire [3:0] tlu_rdpr_mx7_sel;
// modified for timing
// wire tlu_ibrkpt_trap_g;
wire tlu_ibrkpt_trap_w2;
// wire tlu_select_htba_g;
// wire tlu_select_htba_w2;
wire [2:0] tlu_pc_mxsel_w2;
// wire       tlu_stickcmp_intdis;
wire       tlu_htickcmp_intdis;
// wire       tlu_gl_rw_g;
wire       tlu_gl_rw_m;
wire [`TLU_THRD_NUM-1:0] tlu_por_rstint_g;
// modified due to timing
// wire tlu_thrd0_traps, tlu_thrd1_traps;
// wire tlu_thrd2_traps, tlu_thrd3_traps;
wire [`TLU_THRD_NUM-1:0] tlu_thrd_traps_w2;
wire tlu_dnrtry0_inst_g, tlu_dnrtry1_inst_g;
wire tlu_dnrtry2_inst_g, tlu_dnrtry3_inst_g;
wire tlu_scpd_rd_vld_m; // tlu_scpd_rd_vld_g;
wire tlu_scpd_wr_vld_g;
wire tlu_hscpd_dacc_excpt_m;
wire tlu_qtail_dacc_excpt_m;
wire [`SCPD_RW_ADDR_WIDTH-1:0]  tlu_scpd_rd_addr_m;
wire [`SCPD_RW_ADDR_WIDTH-1:0]  tlu_scpd_wr_addr_g;
wire [79:0] tlu_scpd_asi_rdata_g;
//
// added for the change of hierarchy to promote sparc_tlu_intdp and
// sparc_tlu_intctl onto the tlu level
// wire			inc_ind_asi_inrr;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		tlu_asi_rdata_mxsel_g;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_asi_rd_invr;	// From intctl of sparc_tlu_intctl.v
// wire [3:0]		inc_ind_asi_thr;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		tlu_local_thrid_g;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_asi_wr_indr;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_asi_wr_inrr;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_indr_grant;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_ld_int_i1;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_rstthr_i1;	// From intctl of sparc_tlu_intctl.v
wire [3:0]		inc_ind_thr_m;	// From intctl of sparc_tlu_intctl.v
wire [1:0]		inc_indr_req_thrid;	// From intctl of sparc_tlu_intctl.v
wire			inc_indr_req_valid;	// From intctl of sparc_tlu_intctl.v
wire [4:0]		ind_inc_thrid_i1;	// From intdp of sparc_tlu_intdp.v
wire [1:0]		ind_inc_type_i1;	// From intdp of sparc_tlu_intdp.v
// wire			indr_inc_rst_pkt;	// From intdp of sparc_tlu_intdp.v
wire [3:0]		int_pending_i2_l;	// From intdp of sparc_tlu_intdp.v
// hypervisor lite indicator
// wire [`TLU_THRD_NUM-1:0] tlu_hyper_lite;

wire [12:0]		tlu_tag_access_ctxt_g ;
wire			tlu_lng_ltncy_en_l ;
wire			tlu_tsb_rd_ps0_sel ;
wire [47:13]		tlu_tsb_base_w2_d1 ;

wire            tlu_restore_pc_sel_w1;
wire            tlu_itag_acc_sel_g;
wire            tlu_tlb_access_en_l_d1;

   // scan chain wires
   wire         scan1_1;
   wire         scan1_2;
   wire         scan1_3;
   wire         scan0_1;
   wire         short_scan0_1;
   wire         short_scan0_2;
   wire         short_scan0_3;
   wire         short_scan0_4;
   wire         short_scan0_5;
   wire         short_scan0_6;
//=====================================================================================
// DUMMY WIRES FOR VLINT. TO BE FILTERED OUT.
wire [9:0]		dummy_mra_rdata;

//=====================================================================================


/*
sparc_tlu_int  AUTO_TEMPLATE (
		       .tlu_int_asi_state(lsu_asi_state[`TLU_ASI_STATE_WIDTH-1:0]),
		       .lsu_tlu_pmode	(1'b1),

		       .int_tlu_longop_done());
*/
//
// modified the hierarchy to bring sparc_tlu_intdp and sparc_tlu_intctl
// to the tlu level - eliminating sparc_tlu_int
/*
sparc_tlu_int tlu_int (
		       .tlu_int_asi_state(lsu_asi_state[`TLU_ASI_STATE_WIDTH-1:0]),
		       .lsu_tlu_pmode	(1'b1),	// enable partition mode

		       .int_tlu_longop_done(),  // use to switch in thread
		       // .tlu_int_asi_store(tlu_int_asi_store),
		       // Outputs
		       .int_scpd_asi_data(int_scpd_asi_data[63:0]),
		       .int_scpd_asi_data_vld(int_scpd_asi_data_vld),
		       .int_tlu_rstid_m	(int_tlu_rstid_m[5:0]),
		       .so		(so),
		       .tlu_ifu_hwint_i3(tlu_ifu_hwint_i3[3:0]),
		       // .tlu_ifu_int_activate_i3(tlu_ifu_int_activate_i3[3:0]),
		       .tlu_ifu_nukeint_i2(tlu_ifu_nukeint_i2),
		       .tlu_ifu_pstate_ie(tlu_ifu_pstate_ie[3:0]),
		       .tlu_ifu_resumint_i2(tlu_ifu_resumint_i2),
		       .tlu_ifu_rstint_i2(tlu_ifu_rstint_i2),
		       .tlu_ifu_rstthr_i2(tlu_ifu_rstthr_i2[3:0]),
		       .tlu_lsu_pcxpkt	(tlu_lsu_pcxpkt[25:0]),
		       // Inputs
		       .lsu_tlu_st_rs3_data_g(lsu_tlu_rs3_data_g[63:0]),
		       .clk		(rclk),
		       .const_cpuid	(const_cpuid[3:0]),
		       .lsu_tlu_cpx_req	(lsu_tlu_cpx_req[3:0]),
		       .lsu_tlu_cpx_vld	(lsu_tlu_cpx_vld),
		       .lsu_tlu_intpkt	(lsu_tlu_intpkt[17:0]),
		       .lsu_tlu_pcxpkt_ack(lsu_tlu_pcxpkt_ack),
		       .tlu_rst_l	(tlu_rst_l),
		       .se		(se),
		       .si		(si),
		       .tlu_int_asi_load(tlu_int_asi_load),
		       .tlu_int_asi_thrid(tlu_int_asi_thrid[1:0]),
		       .tlu_int_asi_vld	(tlu_int_asi_vld),
		       .tlu_int_pstate_ie(tlu_int_pstate_ie[3:0]),
		       .tlu_int_redmode	(tlu_int_redmode[3:0]),
		       .tlu_int_sftint_pend(tlu_int_sftint_pend[3:0]),
		       .tlu_int_tid_m	(tlu_int_tid_m[1:0]));
*/
sparc_tlu_intdp  intdp(
			  .lsu_ind_intpkt_id(lsu_tlu_intpkt[`INT_VEC_HI:`INT_VEC_LO]),
			  .lsu_ind_intpkt_type(lsu_tlu_intpkt[`INT_TYPE_HI:`INT_TYPE_LO]),
			  .lsu_ind_intpkt_thr(lsu_tlu_intpkt[`INT_THR_HI:`INT_THR_LO]),
			  .so		(scan1_1),
			  .si		(si1),
              /*AUTOINST*/
			  // Outputs
			  .int_pending_i2_l(int_pending_i2_l[3:0]),
			  .ind_inc_thrid_i1(ind_inc_thrid_i1[4:0]),
			  .ind_inc_type_i1(ind_inc_type_i1[1:0]),
			  .int_tlu_rstid_m(int_tlu_rstid_m[5:0]),
			  .tlu_lsu_pcxpkt(tlu_lsu_pcxpkt[25:0]),
			  .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
			  // Inputs
			  .rclk		(rclk),
			  .se		(se),
			  .tlu_rst_l(int_rst_l),
			  .lsu_tlu_st_rs3_data_g(lsu_tlu_rs3_data_g[63:0]),
			  .tlu_asi_rdata_mxsel_g(tlu_asi_rdata_mxsel_g[3:0]),
              .tlu_scpd_asi_rdata_g(tlu_scpd_asi_rdata_g[`TLU_SCPD_DATA_WIDTH-1:0]),
              .tlu_asi_queue_rdata_g(tlu_asi_queue_rdata_g[`TLU_ASI_QUE_WIDTH-1:0]),
			  .inc_ind_ld_int_i1(inc_ind_ld_int_i1[3:0]),
			  .inc_ind_rstthr_i1(inc_ind_rstthr_i1[3:0]),
			  .inc_ind_asi_thr(tlu_local_thrid_g[`TLU_THRD_NUM-1:0]),
			  .inc_ind_asi_wr_indr(inc_ind_asi_wr_indr[3:0]),
			  .inc_ind_indr_grant(inc_ind_indr_grant[3:0]),
			  .inc_ind_thr_m(inc_ind_thr_m[3:0]),
			  .inc_ind_asi_wr_inrr(inc_ind_asi_wr_inrr[3:0]),
			  .inc_ind_asi_rd_invr(inc_ind_asi_rd_invr[3:0]),
			  .inc_indr_req_valid(inc_indr_req_valid),
			  .inc_indr_req_thrid(inc_indr_req_thrid[1:0]));

sparc_tlu_intctl  intctl(
			    .so		(scan0_1),
			    .si		(si0),
			    .tlu_int_asi_store(tlu_asi_write_g),
			    /*AUTOINST*/
			    // Outputs
			    .tlu_ifu_hwint_i3(tlu_ifu_hwint_i3[3:0]),
			    .tlu_ifu_rstthr_i2(tlu_ifu_rstthr_i2[3:0]),
			    .tlu_ifu_rstint_i2(tlu_ifu_rstint_i2),
			    .tlu_ifu_nukeint_i2(tlu_ifu_nukeint_i2),
			    .tlu_ifu_resumint_i2(tlu_ifu_resumint_i2),
			    .tlu_ifu_pstate_ie(tlu_ifu_pstate_ie[3:0]),
		        .int_tlu_longop_done(),
			    .inc_ind_ld_int_i1(inc_ind_ld_int_i1[3:0]),
			    .inc_ind_rstthr_i1(inc_ind_rstthr_i1[3:0]),
			    .inc_ind_indr_grant(inc_ind_indr_grant[3:0]),
			    .inc_ind_thr_m(inc_ind_thr_m[3:0]),
			    .inc_indr_req_valid(inc_indr_req_valid),
			    .inc_indr_req_thrid(inc_indr_req_thrid[1:0]),
			    .tlu_asi_data_nf_vld_w2(tlu_asi_data_nf_vld_w2),
			    .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
			    .tlu_asi_rdata_mxsel_g(tlu_asi_rdata_mxsel_g[3:0]),
			    .int_rst_l (int_rst_l),
			    // Inputs
			    .rclk	(rclk),
			    .se		(se),
			    .sehold	(sehold),
		        .grst_l	(grst_l),
		        .arst_l	(arst_l),
			    .rst_tri_en	(mux_drive_disable),
			    .const_cpuid(const_cpuid[3:0]),
			    .lsu_tlu_cpx_vld(lsu_tlu_cpx_vld),
			    .lsu_tlu_cpx_req(lsu_tlu_cpx_req[3:0]),
			    .lsu_tlu_pcxpkt_ack(lsu_tlu_pcxpkt_ack),
			    .ind_inc_thrid_i1(ind_inc_thrid_i1[4:0]),
			    .ind_inc_type_i1(ind_inc_type_i1[1:0]),
			    .tlu_int_asi_vld(tlu_int_asi_vld),
			    .tlu_int_asi_load(tlu_int_asi_load),
			    .tlu_int_asi_thrid(tlu_int_asi_thrid[1:0]),
		        .tlu_int_asi_state(lsu_asi_state[7:0]),
			    .tlu_int_tid_m(tlu_int_tid_m[1:0]),
			    .tlu_int_pstate_ie(tlu_int_pstate_ie[3:0]),
			    .tlu_asi_queue_rd_vld_g(tlu_asi_queue_rd_vld_g),
			    .tlu_ld_data_vld_g(tlu_ld_data_vld_g),
			    .tlu_va_ill_g(tlu_va_ill_g),
			    .int_pending_i2_l(int_pending_i2_l[3:0]));

tlu_misctl misctl (
         // output
         .tlu_exu_pic_onebelow_m  (tlu_exu_pic_onebelow_m),
         .tlu_exu_pic_twobelow_m  (tlu_exu_pic_twobelow_m),
	     .tlu_exu_cwp_m		  (tlu_exu_cwp_m[`TSA_CWP_WIDTH-1:0]),
	     .tlu_exu_ccr_m		  (tlu_exu_ccr_m[`TSA_CCR_WIDTH-1:0]),
	     .tlu_lsu_asi_m		  (tlu_lsu_asi_m[`TLU_ASI_STATE_WIDTH-1:0]),
         .tlu_cwp_no_change_m (tlu_cwp_no_change_m),
         .tlu_sscan_misctl_data  (tlu_sscan_test_data[`MISCTL_SSCAN_HI:`MISCTL_SSCAN_LO]),
         .tlu_ifu_trappc_w2     (tlu_ifu_trappc_w2[48:0]),
         .tlu_ifu_trapnpc_w2    (tlu_ifu_trapnpc_w2[48:0]),
         .tlu_pc_new_w          (tlu_pc_new_w[48:0]),
         .tlu_npc_new_w         (tlu_npc_new_w[48:0]),
         .so (short_so0),
         // inputs
	     .ctu_sscan_tid      (ctu_sscan_tid[`TLU_THRD_NUM-1:0]),
	     .ifu_tlu_pc_m		 (ifu_tlu_pc_m[48:0]),
	     // .ifu_tlu_npc_m		 (ifu_tlu_npc_m[48:0]),
	     .ifu_npc_w		     (ifu_npc_w[48:0]),
	     .exu_tlu_cwp0		 (exu_tlu_cwp0[`TSA_CWP_WIDTH-1:0]),
	     .exu_tlu_cwp1		 (exu_tlu_cwp1[`TSA_CWP_WIDTH-1:0]),
	     .exu_tlu_cwp2		 (exu_tlu_cwp2[`TSA_CWP_WIDTH-1:0]),
	     .exu_tlu_cwp3		 (exu_tlu_cwp3[`TSA_CWP_WIDTH-1:0]),
	     .tlu_partial_trap_pc_w1 (tlu_partial_trap_pc_w1[33:0]),
         .tlu_restore_pc_w1      (tlu_restore_pc_w1[48:0]),
         .tlu_restore_npc_w1     (tlu_restore_npc_w1[48:0]),
	     .tlu_final_ttype_w2     (tlu_final_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
	     .tlu_final_offset_w1    (tlu_final_offset_w1[`TSA_TTYPE_WIDTH-1:0]),
	     .tlu_restore_pc_sel_w1	 (tlu_restore_pc_sel_w1),
	     // .tlu_retry_inst_m	     (tlu_retry_inst_m),
	     // .tlu_done_inst_m	     (tlu_done_inst_m),
	     // .tlu_dnrtry_inst_m_l    (tlu_dnrtry_inst_m_l),
	     .tlu_true_pc_sel_w   (tlu_true_pc_sel_w[2:0]),
	     .tsa_wr_tid   (tsa_wr_tid[1:0]),
	     .tsa1_wr_vld  (tsa_wr_vld[1]),
	     .tsa_ttype_en (tsa_ttype_en),
	     .tsa_rd_vld_e (tsa_rd_vld_e),
	     // .tsa_rd_vld   (tsa_rd_vld),
	     .tsa0_rdata_cwp	 (tsa0_dout[`TSA0_MEM_CWP_HI:`TSA0_MEM_CWP_LO]),
	     .tsa0_rdata_pstate	 (tsa0_dout[`TSA0_MEM_PSTATE_HI:`TSA0_MEM_PSTATE_LO]),
	     .tsa0_rdata_asi	 (tsa0_dout[`TSA0_MEM_ASI_HI:`TSA0_MEM_ASI_LO]),
	     .tsa0_rdata_ccr	 (tsa0_dout[`TSA0_MEM_CCR_HI:`TSA0_MEM_CCR_LO]),
	     .tsa0_rdata_gl		 (tsa0_dout[`TSA0_MEM_GL_HI:`TSA0_MEM_GL_LO]),
	     .tsa0_rdata_pc		 (tsa0_dout[`TSA0_TPC_HI:`TSA0_TPC_LO]),
	     .tsa1_rdata_ttype	 (tsa1_dout[`TSA1_TTYPE_HI:`TSA1_TTYPE_LO]),
	     .tsa1_rdata_npc	 (tsa1_dout[`TSA1_TNPC_HI:`TSA1_TNPC_LO]),
	     .tsa1_rdata_htstate (tsa1_dout[`TSA1_HTSTATE_HI:`TSA1_HTSTATE_LO]),
	     .tlu_thrd_rsel_e	 (tlu_thrd_rsel_e[`TLU_THRD_NUM-1:0]),
         // experiement
         .tlu_pic_onebelow_e (tlu_pic_onebelow_e),
         .tlu_pic_twobelow_e (tlu_pic_twobelow_e),
         .tlu_pic_cnt_en_m   (tlu_pic_cnt_en_m),
         // .pich_onebelow_flg (pich_onebelow_flg[`TLU_THRD_NUM-1:0]),
         // .pich_twobelow_flg (pich_twobelow_flg[`TLU_THRD_NUM-1:0]),
         // .pich_threebelow_flg (pich_threebelow_flg[`TLU_THRD_NUM-1:0]),
	     // .tlu_thread_inst_vld_w2	(tlu_thread_inst_vld_w2[`TLU_THRD_NUM-1:0]),
         //
	     .tlu_rst			(tlu_rst),
         .se (se),
         .si (short_scan0_6),
	     .rclk      (rclk));

tlu_tcl tcl (
         .so (short_so1),
         .si (short_si1),
	     .tlu_wsr_data_b63_w	(tlu_wsr_data_w[`TLU_ASR_DATA_WIDTH-1]),
	 .tlu_itag_acc_sel_g (tlu_itag_acc_sel_g),
         .pib_priv_act_trap_m   (pib_priv_act_trap_m[3:0]),
         .spu_tlu_rsrv_illgl_m  (spu_tlu_rsrv_illgl_m),
         .tlu_cpu_mondo_cmp (tlu_cpu_mondo_cmp[`TLU_THRD_NUM-1:0]),
         .tlu_dev_mondo_cmp (tlu_dev_mondo_cmp[`TLU_THRD_NUM-1:0]),
         .tlu_resum_err_cmp (tlu_resum_err_cmp[`TLU_THRD_NUM-1:0]),
         .tlu_hintp         (tlu_hintp),
         .pich_wrap_flg     (pich_wrap_flg[`TLU_THRD_NUM-1:0]),
         .pich_onebelow_flg (pich_onebelow_flg[`TLU_THRD_NUM-1:0]),
         .pich_twobelow_flg (pich_twobelow_flg[`TLU_THRD_NUM-1:0]),
          // modified for bug 5436: Niagara 2.0
	     .tlu_pcr_ut	    (tlu_pcr_ut[`TLU_THRD_NUM-1:0]),
	     .tlu_pcr_st	    (tlu_pcr_st[`TLU_THRD_NUM-1:0]),
	     // .tlu_pcr_ut_e	    (tlu_pcr_ut_e),
	     // .tlu_pcr_st_e	    (tlu_pcr_st_e),
         .tlu_pic_cnt_en_m  (tlu_pic_cnt_en_m),
         .tlu_pic_wrap_e    (tlu_pic_wrap_e),
         // .pich_threebelow_flg (pich_threebelow_flg[`TLU_THRD_NUM-1:0]),
         .pib_picl_wrap (pib_picl_wrap[`TLU_THRD_NUM-1:0]),
	     .tlu_local_flush_w	(tlu_local_flush_w),
	     .tlu_restore_pc_sel_w1	(tlu_restore_pc_sel_w1),
	     .tlu_final_offset_w1 (tlu_final_offset_w1[`TSA_TTYPE_WIDTH-1:0]),
	     // Outputs
         .pib_pich_wrap (pib_pich_wrap[`TLU_THRD_NUM-1:0]),
         .tlu_ibrkpt_trap_w2     (tlu_ibrkpt_trap_w2),
	     .tlu_early_flush_pipe_w	(tlu_early_flush_pipe_w),
	     .tlu_early_flush_pipe2_w	(tlu_early_flush_pipe2_w),
	     .tlu_exu_early_flush_pipe_w	(tlu_exu_early_flush_pipe_w),
	     .tlu_ifu_trappc_vld_w1	(tlu_ifu_trappc_vld_w1),
	     .tlu_ifu_trapnpc_vld_w1	(tlu_ifu_trapnpc_vld_w1),
	     .tlu_ifu_trap_tid_w1	(tlu_ifu_trap_tid_w1[1:0]),
         .tlu_trap_hpstate_enb  (tlu_trap_hpstate_enb),
         .tlu_exu_priv_trap_m  (tlu_exu_priv_trap_m),
         .tlu_lsu_priv_trap_m  (tlu_lsu_priv_trap_m),
         // .tlu_lsu_priv_trap_w  (tlu_lsu_priv_trap_w),
         // .tlu_exu_pic_onebelow_m  (tlu_exu_pic_onebelow_m),
         // .tlu_exu_pic_twobelow_m  (tlu_exu_pic_twobelow_m),
	     .tsa_wr_tpl		(tsa_wr_tpl[2:0]),
	     .tsa_rd_tid		(tsa_rd_tid[1:0]),
	     .tsa_rd_tpl		(tsa_rd_tpl[2:0]),
	     .tsa_wr_tid		(tsa_wr_tid[1:0]),
	     .tsa_wr_vld		(tsa_wr_vld[1:0]),
	     .tsa_rd_vld_e		(tsa_rd_vld_e),
	     .tsa_rd_en		    (tsa_rd_en),
	     .tlu_lsu_tl_zero		(tlu_lsu_tl_zero[3:0]),
	     .tlu_full_flush_pipe_w2 (tlu_full_flush_pipe_w2),
		 .tlu_exu_agp_tid	(tlu_exu_agp_tid[1:0]),
	     .tlu_agp_tid_w2	(tlu_agp_tid_w2[1:0]),
	     .tlu_tcc_inst_w    (tlu_tcc_inst_w),
	     .tsa_pc_en			(tsa_pc_en),
	     .tsa_npc_en		(tsa_npc_en),
	     .tsa_tstate_en		(tsa_tstate_en),
	     .tsa_ttype_en		(tsa_ttype_en),
	     .tsa_htstate_en	(tsa_htstate_en),
	     .tlu_tl_gt_0_w2		(tlu_tl_gt_0_w2),
	     // .tlu_retry_inst_m		(tlu_retry_inst_m),
	     // .tlu_done_inst_m		(tlu_done_inst_m),
	     // .tlu_dnrtry_inst_m_l		(tlu_dnrtry_inst_m_l),
	     .tlu_true_pc_sel_w   (tlu_true_pc_sel_w[2:0]),
	     .tlu_tick_en_l		(tlu_tick_en_l),
	     .tlu_tickcmp_en_l		(tlu_tickcmp_en_l[`TLU_THRD_NUM-1:0]),
	     .tlu_tba_en_l		(tlu_tba_en_l[`TLU_THRD_NUM-1:0]),
	     .tlu_thrd_wsel_w2		(tlu_thrd_wsel_w2[`TLU_THRD_NUM-1:0]),
	     .tlu_thread_wsel_g		(tlu_thread_wsel_g[`TLU_THRD_NUM-1:0]),
	     .tlu_final_ttype_w2		(tlu_final_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
	     .tlu_thread_inst_vld_g	(tlu_thread_inst_vld_g[`TLU_THRD_NUM-1:0]),
	     // .tlu_thread_inst_vld_w2	(tlu_thread_inst_vld_w2[`TLU_THRD_NUM-1:0]),
	     .tlu_update_pc_l_w		(tlu_update_pc_l_w[`TLU_THRD_NUM-1:0]),
	     .tlu_select_redmode	(tlu_select_redmode),
	     .tlu_pstate_din_sel0	(tlu_pstate_din_sel0[1:0]),
	     .tlu_pstate_din_sel1	(tlu_pstate_din_sel1[1:0]),
	     .tlu_pstate_din_sel2	(tlu_pstate_din_sel2[1:0]),
	     .tlu_pstate_din_sel3	(tlu_pstate_din_sel3[1:0]),
	     .tlu_update_pstate_l_w2	(tlu_update_pstate_l_w2[3:0]),
	     .tlu_trp_lvl		(tlu_trp_lvl[2:0]),
	     .tlu_pil			(tlu_pil[3:0]),
	     .tlu_wsr_inst_nq_g		(tlu_wsr_inst_nq_g),
	     .tlu_wr_tsa_inst_w2		(tlu_wr_tsa_inst_w2),
	     .tlu_exu_cwp_retry_m	(tlu_exu_cwp_retry_m),
	     .tlu_exu_cwpccr_update_m	(tlu_exu_cwpccr_update_m),
	     .tlu_lsu_asi_update_m	(tlu_lsu_asi_update_m),
	     .tlu_lsu_tid_m		(tlu_lsu_tid_m[1:0]),
	     .tlu_select_tba_w2		(tlu_select_tba_w2),
	     .tdp_select_tba_w2		(tdp_select_tba_w2),
	     .tlu_set_sftint_l_g	(tlu_set_sftint_l_g),
	     .tlu_clr_sftint_l_g	(tlu_clr_sftint_l_g),
	     .tlu_wr_sftint_l_g		(tlu_wr_sftint_l_g),
	     .tlu_sftint_en_l_g		(tlu_sftint_en_l_g[`TLU_THRD_NUM-1:0]),
	     .tlu_sftint_mx_sel		(tlu_sftint_mx_sel[`TLU_THRD_NUM-1:0]),
	     .tlu_sftint_penc_sel	(tlu_sftint_penc_sel[`TLU_THRD_NUM-1:0]),
	     .tlu_sftint_vld		(tlu_sftint_vld[`TLU_THRD_NUM-1:0]),
	     .tlu_hintp_vld		    (tlu_hintp_vld[`TLU_THRD_NUM-1:0]),
	     .tlu_rerr_vld		    (tlu_rerr_vld[`TLU_THRD_NUM-1:0]),
	     .tlu_int_tid_m		    (tlu_int_tid_m[1:0]),
	     .tlu_incr_tick		    (tlu_incr_tick[1:0]),
	     .tlu_tckctr_in		    (tlu_tckctr_in[1:0]),
	     .tlu_tickcmp_sel		(tlu_tickcmp_sel[`TLU_THRD_NUM-1:0]),
	     .immu_sfsr_trp_wr		(immu_sfsr_trp_wr[3:0]),
	     .tlu_isfsr_din_g		(tlu_isfsr_din_g[23:0]),
	     .tlu_tick_npt		    (tlu_tick_npt),
	     .tlu_thrd_rsel_e		(tlu_thrd_rsel_e[3:0]),
	     .tlu_inst_vld_nq_m		(tlu_inst_vld_nq_m),
	     .tlu_lsu_pstate_am		(tlu_lsu_pstate_am[3:0]),
         .tlu_hyperv_rdpr_sel   (tlu_hyperv_rdpr_sel[4:0]),
	     .tlu_rdpr_mx1_sel		(tlu_rdpr_mx1_sel[2:0]),
	     .tlu_rdpr_mx2_sel		(tlu_rdpr_mx2_sel[2:0]),
	     .tlu_rdpr_mx3_sel		(tlu_rdpr_mx3_sel[1:0]),
	     .tlu_rdpr_mx4_sel		(tlu_rdpr_mx4_sel[1:0]),
	     .tlu_rdpr_mx5_sel		(tlu_rdpr_mx5_sel[2:0]),
	     .tlu_rdpr_mx6_sel		(tlu_rdpr_mx6_sel[2:0]),
	     .tlu_rdpr_mx7_sel		(tlu_rdpr_mx7_sel[3:0]),
	     .tlu_lsu_redmode_rst_d1 (tlu_lsu_redmode_rst_d1[3:0]),
	     .lsu_tlu_rsr_data_mod_e	(lsu_tlu_rsr_data_mod_e[7:0]),
	     .tlu_addr_msk_g		(tlu_addr_msk_g),
         .tlu_stickcmp_en_l (tlu_stickcmp_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_htickcmp_en_l (tlu_htickcmp_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_htstate_rw_d (tlu_htstate_rw_d),
         .tlu_htstate_rw_g (tlu_htstate_rw_g),
         .tlu_dnrtry0_inst_g (tlu_dnrtry0_inst_g),
         .tlu_dnrtry1_inst_g (tlu_dnrtry1_inst_g),
         .tlu_dnrtry2_inst_g (tlu_dnrtry2_inst_g),
         .tlu_dnrtry3_inst_g (tlu_dnrtry3_inst_g),
         .tlu_thrd_traps_w2 (tlu_thrd_traps_w2[`TLU_THRD_NUM-1:0]),
         .tlu_tick_ctl_din (tlu_tick_ctl_din),
         .tlu_por_rstint_g (tlu_por_rstint_g[`TLU_THRD_NUM-1:0]),
         .tlu_pc_mxsel_w2 (tlu_pc_mxsel_w2),
	     .ifu_npc_w		    (ifu_npc_w[48:0]),
	     .tlu_rst			(tlu_rst),
	     // .tlu_rst_l			(tlu_rst_l),
         .tlu_sscan_tcl_data (tlu_sscan_test_data[`TCL_SSCAN_HI:`TCL_SSCAN_LO]),
	     // Inputs
	     .ifu_tlu_npc_m		    (ifu_tlu_npc_m[48:0]),
	     .ifu_tlu_pc_oor_e		(ifu_tlu_pc_oor_e),
         .lsu_tlu_early_flush_w (lsu_tlu_early_flush_w),
         .ifu_tlu_flush_fd_w    (ifu_tlu_flush_fd2_w),
	     .ifu_tlu_sraddr_d		(ifu_tlu_sraddr_d[`TLU_ASR_ADDR_WIDTH-1:0]),
	     .ifu_tlu_rsr_inst_d	(ifu_tlu_rsr_inst_d),
	     .lsu_tlu_wsr_inst_e	(lsu_tlu_wsr_inst_e),
	     .tlu_wsr_data_w	    (tlu_wsr_data_w[3:0]),
	     .lsu_tlu_ttype_m2		(lsu_tlu_ttype_m2[8:0]),
	     .lsu_tlu_ttype_vld_m2	(lsu_tlu_ttype_vld_m2),
	     .ifu_tlu_done_inst_d	(ifu_tlu_done_inst_d),
	     .ifu_tlu_retry_inst_d	(ifu_tlu_retry_inst_d),
	     .ifu_tlu_ttype_m		(ifu_tlu_ttype_m[8:0]),
	     .ifu_tlu_ttype_vld_m	(ifu_tlu_ttype_vld_m),
	     .ifu_tlu_trap_m	    (ifu_tlu_trap_m),
	     .exu_tlu_ttype_m		(exu_tlu_ttype_m[8:0]),
	     .exu_tlu_ttype_vld_m	(exu_tlu_ttype_vld_m),
	     .exu_tlu_ue_trap_m	(exu_tlu_ue_trap_m),
	     .exu_tlu_spill		(exu_tlu_spill),
	     .exu_tlu_spill_tid		(exu_tlu_spill_tid[1:0]),
         .exu_tlu_spill_other   (exu_tlu_spill_other),
         .exu_tlu_spill_wtype   (exu_tlu_spill_wtype),
	     .exu_tlu_va_oor_m		(exu_tlu_va_oor_m),
	     .exu_tlu_va_oor_jl_ret_m	(exu_tlu_va_oor_jl_ret_m),
         .tlu_cwp_no_change_m   (tlu_cwp_no_change_m),
         .tlu_trap_cwp_en   (tlu_trap_cwp_en[`TLU_THRD_NUM-1:0]),
	     .ifu_tlu_sir_inst_m	(ifu_tlu_sir_inst_m),
	     .ifu_tlu_inst_vld_m	(ifu_tlu_inst_vld_m),
	     .ifu_tlu_thrid_d		(ifu_tlu_thrid_d[1:0]),
         .lsu_tlu_async_ttype_vld_g (lsu_tlu_async_ttype_vld_g),
         .lsu_tlu_defr_trp_taken_g (lsu_tlu_defr_trp_taken_g),
         .lsu_tlu_async_ttype_g (lsu_tlu_async_ttype_g),
         .lsu_tlu_async_tid_g (lsu_tlu_async_tid_g[1:0]),
	     .ifu_tlu_immu_miss_m	(ifu_tlu_immu_miss_m),
	     .exu_tlu_cwp_cmplt		(exu_tlu_cwp_cmplt),
	     .exu_tlu_cwp_retry		(exu_tlu_cwp_retry),
	     .exu_tlu_cwp_cmplt_tid	(exu_tlu_cwp_cmplt_tid[1:0]),
	     .ifu_tlu_rstint_m		(ifu_tlu_rstint_m),
	     .ifu_tlu_hwint_m		(ifu_tlu_hwint_m),
	     .ifu_tlu_swint_m		(ifu_tlu_swint_m),
	     .int_tlu_rstid_m		(int_tlu_rstid_m[5:0]),
	     .tlu_int_pstate_ie		(local_pstate_ie[3:0]),
	     .tlu_int_redmode		(tlu_int_redmode[3:0]),
	     .tlu_sftint_id		(tlu_sftint_id[3:0]),
	     .lsu_tlu_misalign_addr_ldst_atm_m(lsu_tlu_misalign_addr_ldst_atm_m),
	     .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
	     .lsu_tlu_priv_action_g	(lsu_tlu_priv_action_g),
	     .lsu_tlu_wtchpt_trp_g	(lsu_tlu_wtchpt_trp_g),
	     .ifu_tlu_priv_violtn_m	(ifu_tlu_priv_violtn_m),
	     .ifu_lsu_memref_d		(ifu_lsu_memref_d),
	     .tlu_pstate_priv		(local_pstate_priv[`TLU_THRD_NUM-1:0]),
	     .tlu_pstate_am		(tlu_pstate_am[3:0]),
	     .tlu_isfsr_flt_vld		(tlu_isfsr_flt_vld[3:0]),
	     .ffu_tlu_trap_ieee754	(ffu_tlu_trap_ieee754),
	     .ffu_tlu_trap_other	(ffu_tlu_trap_other),
	     .ffu_tlu_trap_ue	    (ffu_tlu_trap_ue),
	     .ffu_ifu_tid_w2		(ffu_ifu_tid_w2[1:0]),
	     .ffu_tlu_ill_inst_m		(ffu_tlu_ill_inst_m), // new trap from ffu
	     .lsu_tlu_rsr_data_e	(lsu_tlu_rsr_data_e[7:0]),
	     .lsu_tlu_squash_va_oor_m	(lsu_tlu_squash_va_oor_m),
	     .tlu_hpstate_priv (tcl_hpstate_priv[`TLU_THRD_NUM-1:0]),
         .tlu_hscpd_dacc_excpt_m(tlu_hscpd_dacc_excpt_m),
         .tlu_qtail_dacc_excpt_m(tlu_qtail_dacc_excpt_m),
         .tlu_htickcmp_rw_e (tlu_htickcmp_rw_e),
         // .tlu_gl_rw_g (tlu_gl_rw_g),
         .tlu_gl_rw_m (tlu_gl_rw_m),
         .tlu_hpstate_enb  (tcl_hpstate_enb[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_tlz  (tlu_hpstate_tlz[`TLU_THRD_NUM-1:0]),
	     .ctu_sscan_tid    (ctu_sscan_tid[`TLU_THRD_NUM-1:0]),
         .se         (se),
	     .rclk		 (rclk),
	     .grst_l	 (grst_l),
	     .arst_l	 (arst_l),
	     .rst_tri_en (mux_drive_disable));

tlu_tdp tdp (
	     .so			(scan1_2),
	     .si			(scan1_1),
	     .tsa_rdata	    ({tsa1_dout[`TSA1_HTSTATE_HI:`TSA1_HTSTATE_LO],
                         // tsa0_dout[`TSA0_TPC_HI:`TSA0_TPC_LO],
                         // tsa1_dout[`TSA1_TNPC_HI:`TSA1_TNPC_LO],
                         tsa0_dout[`TSA0_TPC_HI-1:`TSA0_TPC_LO],
                         tsa1_dout[`TSA1_TNPC_HI-1:`TSA1_TNPC_LO],
                         tsa0_dout[`TSA0_TSTATE_HI:`TSA0_TSTATE_LO],
                         tsa1_dout[`TSA1_TTYPE_HI:`TSA1_TTYPE_LO]}),
	     .lsu_tlu_rsr_data_e (lsu_tlu_rsr_data_mod_e[7:0]),
         .ifu_lsu_imm_asi_d           (ifu_lsu_imm_asi_d[7:0]),
         .ifu_lsu_imm_asi_vld_d       (ifu_lsu_imm_asi_vld_d),
	     .tlu_lsu_redmode		(tlu_lsu_redmode[3:0]),
         .tlu_exu_rsr_data_m    (tlu_exu_rsr_data_m[`TLU_ASR_DATA_WIDTH-1:0]),
         /*AUTOINST*/
	     // Outputs
         // modified for bug 3017
         .tlu_restore_pc_w1 (tlu_restore_pc_w1[48:0]),
         .tlu_restore_npc_w1 (tlu_restore_npc_w1[48:0]),
	     .tlu_partial_trap_pc_w1 (tlu_partial_trap_pc_w1[33:0]),
	     .tlu_pib_rsr_data_e	(tlu_pib_rsr_data_e[63:0]),
         .tlu_asi_state_e       (tlu_asi_state_e[`TLU_ASI_STATE_WIDTH-1:0]),
	     .tsa_wdata			    (tsa_wdata[`TLU_TSA_WIDTH-1:0]),
	     .tlu_int_pstate_ie		(tlu_int_pstate_ie[3:0]),
	     .local_pstate_ie	    (local_pstate_ie[3:0]),
	     .tlu_ifu_pstate_pef	(tlu_ifu_pstate_pef[3:0]),
	     .tlu_lsu_pstate_cle	(tlu_lsu_pstate_cle[3:0]),
	     .tlu_lsu_pstate_priv	(tlu_lsu_pstate_priv[3:0]),
	     .tlu_int_redmode		(tlu_int_redmode[3:0]),
	     .local_pstate_priv		(local_pstate_priv[`TLU_THRD_NUM-1:0]),
	     .tlu_pstate_am		(tlu_pstate_am[3:0]),
	     .tlu_sftint_id		(tlu_sftint_id[3:0]),
	     .tlu_tick_incr_din		(tlu_tick_incr_din[61:0]),
	     .tlu_sscan_test_data  (tlu_sscan_test_data[`TDP_SSCAN_WIDTH-1:0]),
         .tlu_dnrtry_global_g  (tlu_dnrtry_global_g[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_hpstate_enb  (tlu_hpstate_enb[`TLU_THRD_NUM-1:0]),
         .local_hpstate_enb  (local_hpstate_enb[`TLU_THRD_NUM-1:0]),
         .tcl_hpstate_enb  (tcl_hpstate_enb[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_tlz  (tlu_hpstate_tlz[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_priv  (tlu_hpstate_priv[`TLU_THRD_NUM-1:0]),
         .local_hpstate_priv  (local_hpstate_priv[`TLU_THRD_NUM-1:0]),
         .tcl_hpstate_priv  (tcl_hpstate_priv[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_ibe  (tlu_hpstate_ibe[`TLU_THRD_NUM-1:0]),
         .tlu_hintp        (tlu_hintp),
	     // Inputs
         .tlu_ibrkpt_trap_w2 (tlu_ibrkpt_trap_w2),
         .pib_picl_wrap      (pib_picl_wrap[`TLU_THRD_NUM-1:0]),
         .pib_pich_wrap      (pib_pich_wrap[`TLU_THRD_NUM-1:0]),
         .tlu_por_rstint_g  (tlu_por_rstint_g[`TLU_THRD_NUM-1:0]),
	     .rclk			    (rclk),
	     .tlu_rst			(tlu_rst),
         .tlu_trap_hpstate_enb  (tlu_trap_hpstate_enb),
	     .tlu_thrd_wsel_w2		(tlu_thrd_wsel_w2[`TLU_THRD_NUM-1:0]),
	     .tlu_final_ttype_w2		(tlu_final_ttype_w2[`TSA_TTYPE_WIDTH-1:0]),
	     .tlu_pstate_din_sel0	(tlu_pstate_din_sel0[1:0]),
	     .tlu_pstate_din_sel1	(tlu_pstate_din_sel1[1:0]),
	     .tlu_pstate_din_sel2	(tlu_pstate_din_sel2[1:0]),
	     .tlu_pstate_din_sel3	(tlu_pstate_din_sel3[1:0]),
	     .tlu_wr_tsa_inst_w2		(tlu_wr_tsa_inst_w2),
	     .lsu_asi_reg0		(lsu_asi_reg0[7:0]),
	     .lsu_asi_reg1		(lsu_asi_reg1[7:0]),
	     .lsu_asi_reg2		(lsu_asi_reg2[7:0]),
	     .lsu_asi_reg3		(lsu_asi_reg3[7:0]),
	     .tlu_tickcmp_sel		(tlu_tickcmp_sel[`TLU_THRD_NUM-1:0]),
	     .exu_tlu_ccr0_w		(exu_tlu_ccr0_w[7:0]),
	     .exu_tlu_ccr1_w		(exu_tlu_ccr1_w[7:0]),
	     .exu_tlu_ccr2_w		(exu_tlu_ccr2_w[7:0]),
	     .exu_tlu_ccr3_w		(exu_tlu_ccr3_w[7:0]),
	     .exu_tlu_cwp0		(exu_tlu_cwp0[2:0]),
	     .exu_tlu_cwp1		(exu_tlu_cwp1[2:0]),
	     .exu_tlu_cwp2		(exu_tlu_cwp2[2:0]),
	     .exu_tlu_cwp3		(exu_tlu_cwp3[2:0]),
         .tlu_trap_cwp_en   (tlu_trap_cwp_en[`TLU_THRD_NUM-1:0]),
         // modified for bug 3017
	     // .ifu_tlu_pc_m		(ifu_tlu_pc_m[48:0]),
	     // .ifu_tlu_npc_m		(ifu_tlu_npc_m[48:0]),
         .tlu_pc_new_w          (tlu_pc_new_w[48:0]),
         .tlu_npc_new_w         (tlu_npc_new_w[48:0]),
	     .tlu_sftint_en_l_g		(tlu_sftint_en_l_g[`TLU_THRD_NUM-1:0]),
	     .tlu_sftint_mx_sel		(tlu_sftint_mx_sel[`TLU_THRD_NUM-1:0]),
	     .tlu_set_sftint_l_g	(tlu_set_sftint_l_g),
	     .tlu_clr_sftint_l_g	(tlu_clr_sftint_l_g),
	     .tlu_wr_sftint_l_g		(tlu_wr_sftint_l_g),
	     .tlu_sftint_penc_sel	(tlu_sftint_penc_sel[3:0]),
	     .tlu_tba_en_l		(tlu_tba_en_l[3:0]),
	     .tlu_tick_en_l		(tlu_tick_en_l),
	     .tlu_tickcmp_en_l		(tlu_tickcmp_en_l[3:0]),
	     // .tlu_done_inst_m		(tlu_done_inst_m),
	     // .tlu_dnrtry_inst_m		(tlu_dnrtry_inst_m),
	     // .tlu_dnrtry_inst_m_l		(tlu_dnrtry_inst_m_l),
	     .tlu_update_pc_l_w		(tlu_update_pc_l_w[3:0]),
	     .tlu_tl_gt_0_w2		(tlu_tl_gt_0_w2),
	     .tlu_select_tba_w2		(tdp_select_tba_w2),
	     .tlu_select_redmode	(tlu_select_redmode),
	     .tlu_update_pstate_l_w2	(tlu_update_pstate_l_w2[3:0]),
	     .tlu_pil			(tlu_pil[3:0]),
	     .tlu_trp_lvl		(tlu_trp_lvl[2:0]),
	     .tlu_tick_npt		    (tlu_tick_npt),
	     .tlu_thrd_rsel_e		(tlu_thrd_rsel_e[3:0]),
	     .tlu_tick_incr_dout	(tlu_incr64_dout[60:0]),
	     .tlu_rdpr_mx1_sel		(tlu_rdpr_mx1_sel[2:0]),
	     .tlu_rdpr_mx2_sel		(tlu_rdpr_mx2_sel[2:0]),
	     .tlu_rdpr_mx3_sel		(tlu_rdpr_mx3_sel[1:0]),
	     .tlu_rdpr_mx4_sel		(tlu_rdpr_mx4_sel[1:0]),
	     .tlu_rdpr_mx5_sel		(tlu_rdpr_mx5_sel[2:0]),
	     .tlu_rdpr_mx6_sel		(tlu_rdpr_mx6_sel[2:0]),
	     .tlu_rdpr_mx7_sel		(tlu_rdpr_mx7_sel[3:0]),
	     .ctu_sscan_tid          (ctu_sscan_tid[`TLU_THRD_NUM-1:0]),
         .tlu_gl_lvl0  (tlu_gl_lvl0[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl1  (tlu_gl_lvl1[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl2  (tlu_gl_lvl2[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl3  (tlu_gl_lvl3[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_hpstate_din_sel0  (tlu_hpstate_din_sel0[1:0]),
         .tlu_hpstate_din_sel1  (tlu_hpstate_din_sel1[1:0]),
         .tlu_hpstate_din_sel2  (tlu_hpstate_din_sel2[1:0]),
         .tlu_hpstate_din_sel3  (tlu_hpstate_din_sel3[1:0]),
         .tlu_htba_en_l  (tlu_htba_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_htickcmp_en_l  (tlu_htickcmp_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_htickcmp_intdis  (tlu_htickcmp_intdis),
         .tlu_pc_mxsel_w2 (tlu_pc_mxsel_w2),
         .tlu_set_hintp_sel_g  (tlu_set_hintp_sel_g[`TLU_THRD_NUM-1:0]),
         .tlu_stickcmp_en_l  (tlu_stickcmp_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_update_hpstate_l_w2  (tlu_update_hpstate_l_w2[`TLU_THRD_NUM-1:0]),
         .tlu_wr_hintp_g  (tlu_wr_hintp_g[`TLU_THRD_NUM-1:0]),
         .tlu_wsr_data_w        (tlu_wsr_data_w[`TLU_ASR_DATA_WIDTH-1:0]),
	     .se			(se),

         // trin: setting reset vector from jtag
                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)

           );

// modified for Niagara SRAMs methodology

bw_r_rf32x80 tsa0 (
	     // Outputs
	     .dout 	     (tsa0_dout[`TSA_MEM_WIDTH-1:0]),
         .so         (short_scan0_1),
	     // Inputs
	     .wr_adr     ({tsa_wr_tid[1:0],tsa_wr_tpl[2:0]}),
	     .wr_en		 (tsa_wr_vld[0]),
	     .nib_wr_en	 ({{12{tsa_pc_en}},
                      { 8{tsa_tstate_en}}}),
	     .rd_adr	 ({tsa_rd_tid[1:0],tsa_rd_tpl[2:0]}),
	     .rd_en		 (tsa_rd_en),
	     .din		 ({1'b0, tsa_wdata[`TLU_PC_HI:`TLU_PC_LO],
                       3'b0, tsa_wdata[`TLU_GL_HI:`TLU_CWP_LO]}),
         .reset_l    (arst_l),
         .rst_tri_en (mem_write_disable),
         .sehold     (sehold),
         .se         (se),
         .si         (short_si0),
         .rclk	     (rclk));

bw_r_rf32x80 tsa1 (
	     // Outputs
	     .dout 	     (tsa1_dout[`TSA_MEM_WIDTH-1:0]),
         .so         (short_scan0_2),
	     // Inputs
	     .wr_adr     ({tsa_wr_tid[1:0],tsa_wr_tpl[2:0]}),
	     .wr_en		 (tsa_wr_vld[1]),
	     .nib_wr_en	 ({ 4'h0, // unused
                      { 1{tsa_htstate_en}},
                      {12{tsa_npc_en}},
                      { 3{tsa_ttype_en}}}),
	     .rd_adr	 ({tsa_rd_tid[1:0],tsa_rd_tpl[2:0]}),
	     .rd_en		 (tsa_rd_en),
	     .din		 ({16'h0000, // unused bits
                       tsa_wdata[`TLU_HTSTATE_HI:`TLU_HTSTATE_LO],
                       1'b0, tsa_wdata[`TLU_NPC_HI:`TLU_NPC_LO],
                       3'b0, tsa_wdata[`TLU_TT_HI:`TLU_TT_LO]}),
         .reset_l    (arst_l),
         .rst_tri_en (mem_write_disable),
         .sehold     (sehold),
         .se         (se),
         .si         (short_scan0_1),
         .rclk	     (rclk));

// replaced with softmacro from the library
tlu_incr64	tick_incr64 (
                  .out  ({tlu_incr64_dout[61:0], tlu_tckctr_in[1:0]}),
                  .in   ({tlu_tick_incr_din[61:0], tlu_incr_tick[1:0]})
);
/*
zzinc64 tick_incr64 (
                  .out  ({tlu_incr64_dout[61:0], tlu_tckctr_in[1:0]}),
                  .in   ({tlu_tick_incr_din[61:0], tlu_incr_tick[1:0]})
);
*/

tlu_mmu_ctl mmu_ctl (
		                 .so		(so0),
                     .si(scan0_1),
		     .lsu_tlu_st_rs3_data_b12t0_g(lsu_tlu_st_rs3_data_g[12:0]),
		     .lsu_tlu_st_rs3_data_b48_g(lsu_tlu_st_rs3_data_g[48]),
		     //.lsu_tlu_st_rs3_data_b10t8_g(lsu_tlu_st_rs3_data_g[10:8]),
	     	     .tlu_sun4r_tte_g	(tlu_sun4r_tte_g),
		     .ifu_tlu_flush_m	(ifu_tlu_flush_m),
		     .tlu_mmu_early_flush_pipe_w (tlu_exu_early_flush_pipe_w),
		     .lsu_mmu_early_flush_w (lsu_tlu_early_flush_w),
		     .lsu_mmu_flush_pipe_w (lsu_mmu_flush_pipe_w),
		     .dmmu_sfsr_trp_wr	(lsu_dmmu_sfsr_trp_wr[3:0]),
		     .rst_tri_en	(mux_drive_disable),
	     	     .ifu_tlu_priv_violtn_m	(ifu_tlu_priv_violtn_m),
		     // MMU_ASI_RD_CHANGE
		     .lsu_exu_ldxa_m	(lsu_exu_ldxa_m),
	     	     .ifu_lsu_memref_d	(ifu_lsu_memref_d),
		     .ifu_lsu_imm_asi_d	(ifu_lsu_imm_asi_d[8:0]),
		     .ifu_lsu_thrid_s	(ifu_lsu_thrid_s[1:0]),
	     	     .lsu_asi_reg0	(lsu_asi_reg0[7:0]),
	             .lsu_asi_reg1	(lsu_asi_reg1[7:0]),
	             .lsu_asi_reg2	(lsu_asi_reg2[7:0]),
	             .lsu_asi_reg3	(lsu_asi_reg3[7:0]),
		     .tlu_lng_ltncy_en_l(tlu_lng_ltncy_en_l),
		     .tlu_tsb_rd_ps0_sel (tlu_tsb_rd_ps0_sel),
		     .tlu_tsb_base_w2_d1 (tlu_tsb_base_w2_d1[47:13]),
	     	     .tlu_lsu_pstate_am	(tlu_lsu_pstate_am[3:0]),
	     	     .exu_tlu_va_oor_m	(exu_tlu_va_oor_m),
	     	     .exu_tlu_va_oor_jl_ret_m	(exu_tlu_va_oor_jl_ret_m),
	     	     .tlu_lsu_tl_zero	(tlu_lsu_tl_zero[3:0]),
         	     .lsu_mmu_defr_trp_taken_g (lsu_mmu_defr_trp_taken_g),
		     /*AUTOINST*/
		     // Outputs

             `ifndef NO_RTL_CSM
              .tlu_dtlb_csm_rd_g    (tlu_dtlb_csm_rd_g),
              .tlu_itlb_csm_rd_g    (tlu_itlb_csm_rd_g),
              .tlu_itlb_wr_csm_sel_g(tlu_itlb_wr_csm_sel_g),
              .tlu_dtlb_wr_csm_sel_g(tlu_dtlb_wr_csm_sel_g),
             `endif
		     .tlu_tlb_access_en_l_d1 (tlu_tlb_access_en_l_d1),
		     .mra_byte_wen	(mra_byte_wen[19:0]),
	     	     .tlu_tag_access_ctxt_sel_m	(tlu_tag_access_ctxt_sel_m[2:0]),
  		     .tlu_tlb_tag_invrt_parity(tlu_tlb_tag_invrt_parity),
  		     .tlu_tlb_data_invrt_parity(tlu_tlb_data_invrt_parity),
  		     .lsu_ifu_inj_ack	(lsu_ifu_inj_ack[3:0]),
		     .dmmu_any_sfsr_wr	(dmmu_any_sfsr_wr),
		     .dmmu_sfsr_wr_en_l	(dmmu_sfsr_wr_en_l[3:0]),
		     .dmmu_sfar_wr_en_l	(dmmu_sfar_wr_en_l[3:0]),
		     .immu_any_sfsr_wr	(immu_any_sfsr_wr),
		     .immu_sfsr_wr_en_l	(immu_sfsr_wr_en_l[3:0]),
		     .tlu_tte_tag_g	(tlu_tte_tag_g[2:0]),
		     .tlu_dtlb_rw_index_vld_g(tlu_dtlb_rw_index_vld_g),
		     .tlu_dtlb_rw_index_g(tlu_dtlb_rw_index_g[5:0]),
		     .tlu_dtlb_data_rd_g(tlu_dtlb_data_rd_g),
		     .tlu_dtlb_tag_rd_g	(tlu_dtlb_tag_rd_g),
		     .tlu_itlb_rw_index_vld_g(tlu_itlb_rw_index_vld_g),
		     .tlu_itlb_wr_vld_g	(tlu_itlb_wr_vld_g),
		     .itlb_wr_vld_g	(itlb_wr_vld_g),
		     .tlu_itlb_rw_index_g(tlu_itlb_rw_index_g[5:0]),
		     .tlu_itlb_data_rd_g(tlu_itlb_data_rd_g),
		     .tlu_itlb_tag_rd_g	(tlu_itlb_tag_rd_g),
		     .tlu_idtsb_8k_ptr	(tlu_idtsb_8k_ptr[47:0]),
		     .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
		     .tlu_itlb_invalidate_all_g(tlu_itlb_invalidate_all_g),
		     .tlu_slxa_thrd_sel	(tlu_slxa_thrd_sel[3:0]),
		     .tlu_lsu_ldxa_tid_w2(tlu_lsu_ldxa_tid_w2[1:0]),
		     .tlu_itlb_dmp_vld_g(tlu_itlb_dmp_vld_g),
		     .tlu_itlb_dmp_all_g(tlu_itlb_dmp_all_g),
		     .tlu_itlb_dmp_actxt_g(tlu_itlb_dmp_actxt_g),
		     .tlu_itlb_dmp_nctxt_g(tlu_itlb_dmp_nctxt_g),
		     .tlu_dtlb_dmp_vld_g(tlu_dtlb_dmp_vld_g),
		     //.tlu_dtlb_dmp_by_ctxt_g(tlu_dtlb_dmp_by_ctxt_g),
		     .tlu_dtlb_dmp_all_g(tlu_dtlb_dmp_all_g),
		     .tlu_dtlb_dmp_pctxt_g(tlu_dtlb_dmp_pctxt_g),
		     .tlu_dtlb_dmp_sctxt_g(tlu_dtlb_dmp_sctxt_g),
		     .tlu_dtlb_dmp_nctxt_g(tlu_dtlb_dmp_nctxt_g),
		     .tlu_dtlb_dmp_actxt_g(tlu_dtlb_dmp_actxt_g),
		     .tlu_idtlb_dmp_thrid_g(tlu_idtlb_dmp_thrid_g[1:0]),
		     .tlu_dmp_key_vld_g	(tlu_dmp_key_vld_g[4:0]),
		     .tlu_int_asi_load	(tlu_int_asi_load),
		     .tlu_int_asi_store	(), // Tri: seems to be not used
           // .tlu_int_asi_store (tlu_int_asi_store),
		     .tlu_int_asi_thrid	(tlu_int_asi_thrid[1:0]),
		     .tlu_int_asi_vld	(tlu_int_asi_vld),
		     .tlb_access_rst_l	(tlb_access_rst_l),
		     .tlu_lsu_stxa_ack	(tlu_lsu_stxa_ack),
		     .tlu_lsu_stxa_ack_tid(tlu_lsu_stxa_ack_tid[1:0]),
		     .mra_wr_ptr	(mra_wr_ptr[3:0]),
		     .mra_rd_ptr	(mra_rd_ptr[3:0]),
		     .mra_wr_vld	(mra_wr_vld),
		     .mra_rd_vld	(mra_rd_vld),
		     .tag_access_wdata_sel(tag_access_wdata_sel[2:0]),
		     .tlu_admp_key_sel	(tlu_admp_key_sel),
		     // .tlu_mmu_sync_data_excp_g(tlu_mmu_sync_data_excp_g),
		     .tlu_tte_wr_pid_g	(tlu_tte_wr_pid_g[2:0]),
		     .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
		     .tlu_tte_real_g	(tlu_tte_real_g),
		     .tlu_ldxa_l1mx1_sel(tlu_ldxa_l1mx1_sel[3:0]),
		     .tlu_ldxa_l1mx2_sel(tlu_ldxa_l1mx2_sel[3:0]),
		     .tlu_ldxa_l2mx1_sel(tlu_ldxa_l2mx1_sel[2:0]),
		     // Inputs
		     .tlu_itag_acc_sel_g (tlu_itag_acc_sel_g),
         	     .sehold     	(sehold),
         	     .spu_tlu_rsrv_illgl_m  (1'b0),
		     .ifu_mmu_trap_m	(ifu_mmu_trap_m),
		     .ffu_tlu_ill_inst_m(ffu_tlu_ill_inst_m),
	             .ifu_tlu_inst_vld_m (ifu_tlu_inst_vld_m_bf1),
		     .exu_lsu_priority_trap_m(exu_lsu_priority_trap_m),
		     .exu_mmu_early_va_e (exu_mmu_early_va_e[7:0]),
		     .tlu_tag_access_ctxt_g (tlu_tag_access_ctxt_g[12:0]),
  		     .ifu_lsu_error_inj	(ifu_lsu_error_inj[3:0]),
		     .lsu_tlu_nucleus_ctxt_m (lsu_tlu_nucleus_ctxt_m),
		     .lsu_tlu_tte_pg_sz_g (lsu_tlu_tte_pg_sz_g[2:0]),
		     .ifu_lsu_ld_inst_e	(ifu_lsu_ld_inst_e),
		     .ifu_lsu_st_inst_e	(ifu_lsu_st_inst_e),
		     .lsu_tlu_dmmu_miss_g(lsu_tlu_dmmu_miss_g),
		     .tlu_dtsb_split_w2	(tlu_dtsb_split_w2),
		     .tlu_dtsb_size_w2	(tlu_dtsb_size_w2[3:0]),
		     .tlu_dtag_access_w2(tlu_dtag_access_w2[47:13]),
		     .tlu_itsb_split_w2	(tlu_itsb_split_w2),
		     .tlu_itsb_size_w2	(tlu_itsb_size_w2[3:0]),
		     .tlu_ctxt_cfg_w2	(tlu_ctxt_cfg_w2[5:0]),
		     //.tlu_tag_access_nctxt_g(tlu_tag_access_nctxt_g),
		     .lsu_tlu_st_rs3_data_g(lsu_tlu_st_rs3_data_g[62:61]),
		     .ifu_tlu_immu_miss_m(ifu_tlu_immu_miss_m),
		     // .ifu_tlu_thrid_e	(ifu_tlu_thrid_e[1:0]),
		     .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
		     .ifu_tlu_alt_space_d(ifu_tlu_alt_space_d),
		     .lsu_tlu_dtlb_done	(lsu_tlu_dtlb_done),
		     .ifu_tlu_itlb_done	(ifu_tlu_itlb_done),
		     .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
		     .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
		     .lsu_tlu_tlb_ld_inst_m(lsu_tlu_tlb_ld_inst_m),
		     .lsu_tlu_tlb_st_inst_m(lsu_tlu_tlb_st_inst_m),
		     .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
		     .immu_sfsr_trp_wr	(immu_sfsr_trp_wr[3:0]),
		     .lsu_tlu_daccess_excptn_g(lsu_tlu_daccess_excptn_g),
		     .lsu_tlu_daccess_prot_g(lsu_tlu_daccess_prot_g),
		     .lsu_pid_state0	(lsu_pid_state0[2:0]),
		     .lsu_pid_state1	(lsu_pid_state1[2:0]),
		     .lsu_pid_state2	(lsu_pid_state2[2:0]),
		     .lsu_pid_state3	(lsu_pid_state3[2:0]),
		     .rclk		(rclk),
		     .se		(se),
		     .grst_l		(grst_l),
		     .arst_l		(arst_l),

           // Tri: adding dummy signal declaration to get rid of vcs warnings
           .immu_tsb_rd_en(), // unused output,
           .tlu_itlb_dmp_pctxt_g()
           );
/*
tlu_mmu_dp AUTO_TEMPLATE ();
*/


tlu_mmu_dp mmu_dp (
           .so (short_scan0_3),
           .si (short_scan0_2),
		   .ifu_tlu_pc_m	(ifu_tlu_pc_m[47:13]),
		   .lsu_exu_ldxa_data_g	(lsu_exu_ldxa_data_g[63:0]),
		   .tlu_dsfsr_din_g	(lsu_dsfsr_din_g[23:0]),
		   // MMU_ASI_RD_CHANGE
		   .tlu_lng_ltncy_en_l(tlu_lng_ltncy_en_l),
		   .tlu_tsb_rd_ps0_sel (tlu_tsb_rd_ps0_sel),
		   .tlu_tsb_base_w2_d1 (tlu_tsb_base_w2_d1[47:13]),
		   /*AUTOINST*/
		   // Outputs

            `ifndef NO_RTL_CSM
            .tlu_dtlb_tte_csm_w2    (tlu_dtlb_tte_csm_w2),
            .tlu_itlb_tte_csm_w2    (tlu_itlb_tte_csm_w2),
            `endif
		   .tlu_tag_access_ctxt_g (tlu_tag_access_ctxt_g[12:0]),
		   .tlu_ctxt_cfg_w2	(tlu_ctxt_cfg_w2[5:0]),
		   .tlu_dtsb_split_w2	(tlu_dtsb_split_w2),
		   .tlu_dtsb_size_w2	(tlu_dtsb_size_w2[3:0]),
		   .tlu_dtag_access_w2	(tlu_dtag_access_w2[47:13]),
		   .tlu_itsb_split_w2	(tlu_itsb_split_w2),
		   .tlu_itsb_size_w2	(tlu_itsb_size_w2[3:0]),
		   .tlu_itlb_tte_tag_w2	(tlu_itlb_tte_tag_w2[58:0]),
		   .tlu_itlb_tte_data_w2(tlu_itlb_tte_data_w2[42:0]),
		   .tlu_dtlb_tte_tag_w2	(tlu_dtlb_tte_tag_w2[58:0]),
		   .tlu_dtlb_tte_data_w2(tlu_dtlb_tte_data_w2[42:0]),
		   // .tlu_lsu_ldxa_data_w2(tlu_lsu_ldxa_data_w2[63:0]),
		   .tlu_idtlb_dmp_key_g	(tlu_idtlb_dmp_key_g[40:0]),
		   .tlu_dsfsr_flt_vld	(tlu_dsfsr_flt_vld[3:0]),
		   .tlu_isfsr_flt_vld	(tlu_isfsr_flt_vld[3:0]),
		   //.tlu_tag_access_nctxt_g(tlu_tag_access_nctxt_g),
		   .mra_wdata		(mra_wdata[155:0]),
		   // Inputs

            `ifndef NO_RTL_CSM
            .lsu_tlu_st_rs3_data_g  (lsu_tlu_st_rs3_data_g),
            `endif
		   .tlu_tlb_access_en_l_d1 (tlu_tlb_access_en_l_d1),
	           .tlu_sun4r_tte_g	(tlu_sun4r_tte_g),
  		   .tlu_tlb_tag_invrt_parity(tlu_tlb_tag_invrt_parity),
  		   .tlu_tlb_data_invrt_parity(tlu_tlb_data_invrt_parity),
		   .tlu_addr_msk_g	(tlu_addr_msk_g),
		   .dmmu_any_sfsr_wr	(dmmu_any_sfsr_wr),
		   .dmmu_sfsr_wr_en_l	(dmmu_sfsr_wr_en_l[3:0]),
		   .immu_any_sfsr_wr	(immu_any_sfsr_wr),
		   .immu_sfsr_wr_en_l	(immu_sfsr_wr_en_l[3:0]),
		   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
		   .lsu_tlu_pctxt_m	(lsu_tlu_pctxt_m[12:0]),
		   .tlu_tag_access_ctxt_sel_m(tlu_tag_access_ctxt_sel_m[2:0]),
		   .lsu_tlu_st_rs3_data_b63t59_g(lsu_tlu_st_rs3_data_g[63:59]),
		   .lsu_tlu_st_rs3_data_b47t0_g(lsu_tlu_st_rs3_data_g[47:0]),
		   .exu_lsu_ldst_va_e	(exu_lsu_ldst_va_e[`ASI_VA_WIDTH-1:0]),
		   .tlu_idtsb_8k_ptr	(tlu_idtsb_8k_ptr[47:0]),
		   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
		   .tlu_slxa_thrd_sel	(tlu_slxa_thrd_sel[3:0]),
		   .tlu_tte_tag_g	(tlu_tte_tag_g[2:0]),
		   .tlu_dmp_key_vld_g	(tlu_dmp_key_vld_g[4:0]),
		   .tlb_access_rst_l	(tlb_access_rst_l),
		   .tag_access_wdata_sel(tag_access_wdata_sel[2:0]),
		   .mra_rdata		(mra_rdata[159:10]),
		   .tlu_admp_key_sel	(tlu_admp_key_sel),
		   .tlu_isfsr_din_g	(tlu_isfsr_din_g[23:0]),
		   .tlu_tte_wr_pid_g	(tlu_tte_wr_pid_g[2:0]),
		   .tlu_tte_real_g	(tlu_tte_real_g),
		   .tlu_ldxa_l1mx1_sel	(tlu_ldxa_l1mx1_sel[3:0]),
		   .tlu_ldxa_l1mx2_sel	(tlu_ldxa_l1mx2_sel[3:0]),
		   .tlu_ldxa_l2mx1_sel	(tlu_ldxa_l2mx1_sel[2:0]),
		   .rclk		(rclk),
		   .arst_l		(arst_l),
		   .grst_l		(grst_l),
            .se (se),
		   .dmmu_sfar_wr_en_l	(dmmu_sfar_wr_en_l[3:0]));
        //   .rst_l		(tlu_rst_l));

tlu_hyperv tlu_hyperv (/*AUTOINST*/
         .so(scan1_3),
         .si(scan1_2),
	     .grst_l	 (grst_l),
	     .arst_l	 (arst_l),
	     .rst_tri_en (mux_drive_disable),
         // output
         // modified for timing
         // .tlu_gl_rw_g (tlu_gl_rw_g),
         .tlu_gl_rw_m (tlu_gl_rw_m),
         .tlu_gl_lvl0 (tlu_gl_lvl0[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl1 (tlu_gl_lvl1[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl2 (tlu_gl_lvl2[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_gl_lvl3 (tlu_gl_lvl3[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_hpstate_din_sel0 (tlu_hpstate_din_sel0[1:0]),
         .tlu_hpstate_din_sel1 (tlu_hpstate_din_sel1[1:0]),
         .tlu_hpstate_din_sel2 (tlu_hpstate_din_sel2[1:0]),
         .tlu_hpstate_din_sel3 (tlu_hpstate_din_sel3[1:0]),
         .tlu_htickcmp_rw_e (tlu_htickcmp_rw_e),
         // .tlu_update_hpstate_l_g (tlu_update_hpstate_l_g[`TLU_THRD_NUM-1:0]),
         .tlu_update_hpstate_l_w2 (tlu_update_hpstate_l_w2[`TLU_THRD_NUM-1:0]),
         // .tlu_htickcmp_en_l (tlu_htickcmp_en_l[`TLU_THRD_NUM-1:0]),
         .tlu_htickcmp_intdis (tlu_htickcmp_intdis),
         // .tlu_hintp_en_l_g (tlu_hintp_en_l_g[`TLU_THRD_NUM-1:0]),
         .tlu_wr_hintp_g (tlu_wr_hintp_g[`TLU_THRD_NUM-1:0]),
         // .tlu_set_hintp_g (tlu_set_hintp_g[`TLU_THRD_NUM-1:0]),
         .tlu_set_hintp_sel_g (tlu_set_hintp_sel_g[`TLU_THRD_NUM-1:0]),
         .tlu_htba_en_l (tlu_htba_en_l[`TLU_THRD_NUM-1:0]),
         // .tlu_hyper_lite (tlu_hyper_lite[`TLU_THRD_NUM-1:0]),
         .tlu_hscpd_dacc_excpt_m (tlu_hscpd_dacc_excpt_m),
         .tlu_qtail_dacc_excpt_m (tlu_qtail_dacc_excpt_m),
         .tlu_scpd_rd_vld_m (tlu_scpd_rd_vld_m),
         // .tlu_scpd_rd_vld_g (tlu_scpd_rd_vld_g),
         .tlu_scpd_wr_vld_g (tlu_scpd_wr_vld_g),
         .tlu_scpd_rd_addr_m (tlu_scpd_rd_addr_m[`SCPD_RW_ADDR_WIDTH-1:0]),
         .tlu_scpd_wr_addr_g (tlu_scpd_wr_addr_g[`SCPD_RW_ADDR_WIDTH-1:0]),
         .tlu_asi_queue_rdata_g(tlu_asi_queue_rdata_g[`TLU_ASI_QUE_WIDTH-1:0]),
         .tlu_ld_data_vld_g(tlu_ld_data_vld_g),
         .tlu_asi_queue_rd_vld_g(tlu_asi_queue_rd_vld_g),
		 // .tlu_va_all_zero_g(tlu_va_all_zero_g),
		 .tlu_va_ill_g(tlu_va_ill_g),
         .tlu_htstate_rw_d (tlu_htstate_rw_d),
         .tlu_htstate_rw_g (tlu_htstate_rw_g),
	     // .tlu_htba_mx2_sel (tlu_htba_mx2_sel),
         // .tlu_rdpr_mx5_sel (tlu_rdpr_mx5_sel[3:0]),
         .tlu_hyperv_rdpr_sel (tlu_hyperv_rdpr_sel[4:0]),
         // .tlu_rdpr_mx5_active (tlu_rdpr_mx5_active),
	     .tlu_exu_agp (tlu_exu_agp[`TSA_GLOBAL_WIDTH-1:0]),
	     .tlu_exu_agp_swap (tlu_exu_agp_swap),
         .tlu_cpu_mondo_cmp (tlu_cpu_mondo_cmp[`TLU_THRD_NUM-1:0]),
         .tlu_dev_mondo_cmp (tlu_dev_mondo_cmp[`TLU_THRD_NUM-1:0]),
         .tlu_resum_err_cmp (tlu_resum_err_cmp[`TLU_THRD_NUM-1:0]),
	     // .tlu_exu_agp_tid	(tlu_exu_agp_tid[1:0]),
		 .tlu_asi_write_g	(tlu_asi_write_g),
		.inc_ind_asi_wr_inrr(inc_ind_asi_wr_inrr[`TLU_THRD_NUM-1:0]),
		.inc_ind_asi_wr_indr(inc_ind_asi_wr_indr[`TLU_THRD_NUM-1:0]),
		.inc_ind_asi_rd_invr(inc_ind_asi_rd_invr[`TLU_THRD_NUM-1:0]),
		.tlu_local_thrid_g(tlu_local_thrid_g[`TLU_THRD_NUM-1:0]),
         // input
         .tlu_por_rstint_g (tlu_por_rstint_g[`TLU_THRD_NUM-1:0]),
         // .tlu_wsr_inst_g (tlu_wsr_inst_g),
         .tlu_wsr_inst_nq_g (tlu_wsr_inst_nq_g),
         // .ifu_tlu_thrid_e (ifu_tlu_thrid_e[1:0]),
         .ifu_tlu_thrid_d (ifu_tlu_thrid_d[1:0]),
         .ifu_tlu_sraddr_d (ifu_tlu_sraddr_d_v2[`TLU_ASR_ADDR_WIDTH-1:0]),
         .tlu_wsr_data_w_global (tlu_wsr_data_w[`TLU_GLOBAL_WIDTH-1:0]),
         .tlu_dnrtry_global_g (tlu_dnrtry_global_g[`TSA_GLOBAL_WIDTH-1:0]),
         .tlu_dnrtry0_inst_g (tlu_dnrtry0_inst_g),
         .tlu_dnrtry1_inst_g (tlu_dnrtry1_inst_g),
         .tlu_dnrtry2_inst_g (tlu_dnrtry2_inst_g),
         .tlu_dnrtry3_inst_g (tlu_dnrtry3_inst_g),
         // modified due to timing
         // .tlu_thrd0_traps (tlu_thrd0_traps),
         // .tlu_thrd1_traps (tlu_thrd1_traps),
         // .tlu_thrd2_traps (tlu_thrd2_traps),
         // .tlu_thrd3_traps (tlu_thrd3_traps),
         // .tlu_select_tba_g (tlu_select_tba_g),
         .tlu_thrd_traps_w2 (tlu_thrd_traps_w2[`TLU_THRD_NUM-1:0]),
         .tlu_select_tba_w2 (tlu_select_tba_w2),
         .tlu_tick_ctl_din (tlu_tick_ctl_din),
         // .tlu_htick_match (tlu_htick_match),
         .tlu_tickcmp_sel (tlu_tickcmp_sel[`TLU_THRD_NUM-1:0]),
         .tlu_pstate_priv (local_pstate_priv[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_priv (local_hpstate_priv[`TLU_THRD_NUM-1:0]),
         .tlu_hpstate_enb (local_hpstate_enb[`TLU_THRD_NUM-1:0]),
         .ifu_lsu_alt_space_e (ifu_lsu_alt_space_e),
         .ifu_lsu_ld_inst_e (ifu_lsu_ld_inst_e),
         .ifu_lsu_st_inst_e (ifu_lsu_st_inst_e),
         .tlu_asi_state_e (tlu_asi_state_e[`TLU_ASI_STATE_WIDTH-1:0]),
         // new signal to replace ifu_tlu_flush_w
         // .ifu_tlu_flush_w (ifu_tlu_flush_w),
		 // .tlu_flush_pipe_w (tlu_flush_pipe_w),
		 // .tlu_flush_all_w (tlu_flush_all_w),
         .lsu_tlu_early_flush_w (lsu_tlu_early_flush2_w),
	     .tlu_local_flush_w	(tlu_local_flush_w),
		 .tlu_lsu_int_ldxa_vld_w2(tlu_lsu_int_ldxa_vld_w2),
		 .tlu_asi_data_nf_vld_w2 (tlu_asi_data_nf_vld_w2),
         .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
		 .tlu_inst_vld_m  (tlu_inst_vld_nq_m),
         // .exu_lsu_ldst_va_e (exu_lsu_ldst_va_e[`TLU_ASI_VA_WIDTH-1:0]),
         .lsu_tlu_ldst_va_m (lsu_tlu_ldst_va_m[`TLU_ASI_VA_WIDTH-1:0]),
         .tlu_asi_queue_data_g (lsu_tlu_rs3_data_g[`TLU_ASI_QUE_HI:`TLU_ASI_QUE_LO]),
	     // .tlu_exu_agp_tid	   (tlu_exu_agp_tid[1:0]),
	     // .tlu_agp_tid_g	   (tlu_agp_tid_g[1:0]),
	     .tlu_agp_tid_w2	   (tlu_agp_tid_w2[1:0]),
         .se(se),
         // .tlu_rst_l (tlu_rst_l),
         // .clk (clk));
         .rclk (rclk));

/*
bw_r_rf16x160 AUTO_TEMPLATE (
		.word_wen	(4'b1111),
	        .rd_clk		(rclk),
	        .wr_clk		(rclk),
		.reset_l	(arst_l),
		.din		({mra_wdata[155:0],4'b0000}),
		//.si		(),
		.si_r		(),
		.si_w		(),
		.se		(se),
		.sehold		(sehold),
		//.so		());
		.so_r		(),
		.so_w		());
*/
bw_r_rf16x160 mra (/*AUTOINST*/
		// Outputs
		.dout		({mra_rdata[159:10],dummy_mra_rdata[9:0]}),
		//.so		(),
		.so_r		(short_scan0_4),
		.so_w		(short_scan0_5),
		// Inputs
	        .rd_clk		(rclk),
	        .wr_clk		(rclk),
		.din		({mra_wdata[155:0],4'b0000}),
		.rst_tri_en	(mem_write_disable),
		.word_wen	(4'b1111),
		.byte_wen	(mra_byte_wen[19:0]),
	     	.wr_adr 	(mra_wr_ptr[3:0]),
	     	.rd_adr		(mra_rd_ptr[3:0]),
	     	.wr_en		(mra_wr_vld),
	     	.read_en	(mra_rd_vld),
		.reset_l	(arst_l),
		.sehold		(sehold),
		//.si		(),
		.si_w		(short_scan0_4),
		.si_r		(short_scan0_3),
		.se		(se));


//tlu_mra mra (/*AUTOINST*/
//	     // Outputs
//	     .mra_rdata			(mra_rdata[155:0]),
//	     // Inputs
//	     .mra_wr_ptr		(mra_wr_ptr[3:0]),
//	     .mra_rd_ptr		(mra_rd_ptr[3:0]),
//	     .mra_wr_vld		(mra_wr_vld),
//	     .mra_rd_vld		(mra_rd_vld),
//	     .mra_field1_en		(mra_field1_en),
//	     .mra_field2_en		(mra_field2_en),
//	     .mra_field3_en		(mra_field3_en),
//	     .mra_field4_en		(mra_field4_en),
//	     .mra_wdata			(mra_wdata[155:0]),
//	     .clk			(rclk));

/*
tlu_pib AUTO_TEMPLATE (
		.ifu_tlu_imiss_m	    (ifu_tlu_imiss_m),
		.lsu_tlu_dcache_miss_w2	(lsu_tlu_dcache_miss_w2[3:0]),
		.lsu_tlu_l2_dmiss	    (lsu_tlu_l2_dmiss[3:0]),
		.lsu_tlu_stb_full_w2	(lsu_tlu_stb_full_w2[3:0]));
        .ffu_tlu_fpu_tid        (ffu_tlu_fpu_tid[1:0]),
        .ffu_tlu_fpu_cmplt      (ffu_tlu_fpu_cmplt),
        // .pib_pic_wrap           (pib_pic_wrap[3:0]),
        .pib_picl_wrap           (pib_picl_wrap[`TLU_THRD_NUM-1:0]),
        .pich_wrap_flg           (pich_wrap_flg[`TLU_THRD_NUM-1:0]),
        .pich_onebelow_flg       (pich_onebelow_flg[`TLU_THRD_NUM-1:0]),
        .pich_twobelow_flg       (pich_twobelow_flg[`TLU_THRD_NUM-1:0]),
        .tlu_pic_onebelow_e      (tlu_pic_onebelow_e),
        .tlu_pic_twobelow_e      (tlu_pic_twobelow_e),
        .tlu_pic_wrap_e          (tlu_pic_wrap_e),
        // modified for bug 5436: Niagara 2.0
	    .tlu_pcr_ut	    (tlu_pcr_ut[`TLU_THRD_NUM-1:0]),
	    .tlu_pcr_st	    (tlu_pcr_st[`TLU_THRD_NUM-1:0]),
        //.tlu_pcr_ut_e            (tlu_pcr_ut_e),
        //.tlu_pcr_st_e            (tlu_pcr_st_e),
        // .pich_threebelow_flg     (pich_threebelow_flg[`TLU_THRD_NUM-1:0]),
        // modified for timing fixes
        // .pib_priv_act_trap      (pib_priv_act_trap[3:0]),
        .pib_priv_act_trap_m    (pib_priv_act_trap_m[3:0]),
*/
tlu_pib tlu_pib (/*AUTOINST*/
                 .so (so1),
                 .si (scan1_3),
	             .grst_l	(grst_l),
	             .arst_l	(arst_l),
                 .ifu_tlu_imiss_e       (ifu_tlu_imiss_e),
                 .ifu_tlu_immu_miss_m   (ifu_tlu_immu_miss_m),
                 .tlu_hpstate_enb  (local_hpstate_enb[`TLU_THRD_NUM-1:0]),
                 .ifu_tlu_l2imiss       (ifu_tlu_l2imiss[`TLU_THRD_NUM-1:0]),
	             .tlu_thread_inst_vld_g	(tlu_thread_inst_vld_g[`TLU_THRD_NUM-1:0]),
                 .ifu_tlu_thrid_d       (ifu_tlu_thrid_d[1:0]),
                 .exu_tlu_wsr_data_m    (exu_tlu_wsr_data_m[`TLU_ASR_DATA_WIDTH-1:0]),
                 .tlu_full_flush_pipe_w2 (tlu_full_flush_pipe_w2),
                 .tlu_tcc_inst_w         (tlu_tcc_inst_w),
                 .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd3_w),
                 .ifu_tlu_sraddr_d      (ifu_tlu_sraddr_d_v2[`TLU_ASR_ADDR_WIDTH-1:0]),
                 .ifu_tlu_rsr_inst_d    (ifu_tlu_rsr_inst_d),
                 // .ifu_tlu_wsr_inst_d    (ifu_tlu_wsr_inst_d),
                 .lsu_tlu_wsr_inst_e    (lsu_tlu_wsr_inst_e),
	             .tlu_wsr_inst_nq_g		(tlu_wsr_inst_nq_g),
                 .tlu_pib_rsr_data_e    (tlu_pib_rsr_data_e[`TLU_ASR_DATA_WIDTH-1:0]),
                 .tlu_pstate_priv       (local_pstate_priv[`TLU_THRD_NUM-1:0]),
	             .tlu_hpstate_priv      (local_hpstate_priv[`TLU_THRD_NUM-1:0]),
	             .tlu_thread_wsel_g		(tlu_thread_wsel_g[`TLU_THRD_NUM-1:0]),
                 .ffu_tlu_fpu_tid       (ffu_tlu_fpu_tid[1:0]),
                 .ffu_tlu_fpu_cmplt     (ffu_tlu_fpu_cmplt),
                 .lsu_tlu_dmmu_miss_g   (lsu_tlu_dmmu_miss_g),
                 .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[`TLU_THRD_NUM-1:0]),
                 .lsu_tlu_l2_dmiss       (lsu_tlu_l2_dmiss[`TLU_THRD_NUM-1:0]),
                 .lsu_tlu_stb_full_w2   (lsu_tlu_stb_full_w2[`TLU_THRD_NUM-1:0]),
                 .tlu_wsr_data_w        (tlu_wsr_data_w[`TLU_ASR_DATA_WIDTH-1:0]),
                 // modified for timing fixes
        	     // .pib_priv_act_trap     (pib_priv_act_trap[`TLU_THRD_NUM-1:0]),
        	     .pib_priv_act_trap_m   (pib_priv_act_trap_m[`TLU_THRD_NUM-1:0]),
                 // .pib_pic_wrap        (pib_pic_wrap[`TLU_THRD_NUM-1:0]),
                 .pib_picl_wrap          (pib_picl_wrap[`TLU_THRD_NUM-1:0]),
                 .pich_wrap_flg          (pich_wrap_flg[`TLU_THRD_NUM-1:0]),
                 .pich_onebelow_flg      (pich_onebelow_flg[`TLU_THRD_NUM-1:0]),
                 .pich_twobelow_flg      (pich_twobelow_flg[`TLU_THRD_NUM-1:0]),
                 .tlu_pic_onebelow_e     (tlu_pic_onebelow_e),
                 .tlu_pic_twobelow_e     (tlu_pic_twobelow_e),
                 // modified for bug 5436: Niagara 2.0
	             .tlu_pcr_ut	    (tlu_pcr_ut[`TLU_THRD_NUM-1:0]),
	             .tlu_pcr_st	    (tlu_pcr_st[`TLU_THRD_NUM-1:0]),
                 //.tlu_pcr_ut_e            (tlu_pcr_ut_e),
                 //.tlu_pcr_st_e            (tlu_pcr_st_e),
                 .tlu_pic_wrap_e         (tlu_pic_wrap_e),
                 // .pich_threebelow_flg      (pich_threebelow_flg[`TLU_THRD_NUM-1:0]),
                 // .tlu_que_trap_sel_m  (tlu_que_trap_sel_m[`QUE_TRAP_SEL_WIDTH-1:0]),
                 // .tlu_exu_rsr_data_e  (tlu_exu_rsr_data_e[`TLU_ASR_DATA_WIDTH-1:0]),
//
// reset was removed to abide to the Niagara reset methodology
//               .reset (reset),
                 .se (se),
                 // .tlu_rst_l  			(tlu_rst_l),
                 // .rst_tri_en  			(mux_drive_disable),
                 .rclk					(rclk) );

// modified due to Niagara SRAM methodology
/*
tlu_scpd tlu_scpd (
                 .lsu_tlu_st_rs3_data_g (lsu_tlu_rs3_data_g[`TLU_SCPD_DATA_WIDTH-1:0]),
                 .tlu_scpd_rd_vld_m     (tlu_scpd_rd_vld_m),
                 .tlu_scpd_wr_vld_g     (tlu_scpd_wr_vld_g),
                 .tlu_scpd_rd_addr_m    (tlu_scpd_rd_addr_m[`SCPD_RW_ADDR_WIDTH-1:0]),
                 .tlu_scpd_wr_addr_g    (tlu_scpd_wr_addr_g[`SCPD_RW_ADDR_WIDTH-1:0]),
//
// reset was removed to abide to the Niagara reset methodology
//               .reset (reset),
                 .tlu_rst  				(tlu_rst),
                 .clk					(rclk),
                 .tlu_scpd_asi_rdata_g  (tlu_scpd_asi_rdata_g[`TLU_SCPD_DATA_WIDTH-1:0]));
//
*/
bw_r_rf32x80 tlu_scpd (
                 // output
                 .dout    (tlu_scpd_asi_rdata_g[79:0]),
                 .so      (short_scan0_6),
                 // intput
                 .din     ({{16{1'b0}}, // unused inputs
                            lsu_tlu_rs3_data_g[`TLU_SCPD_DATA_WIDTH-1:0]}),
                 .rd_en   (tlu_scpd_rd_vld_m),
                 .wr_en   (tlu_scpd_wr_vld_g),
                 .rd_adr  (tlu_scpd_rd_addr_m[`SCPD_RW_ADDR_WIDTH-1:0]),
                 .wr_adr  (tlu_scpd_wr_addr_g[`SCPD_RW_ADDR_WIDTH-1:0]),
                 .nib_wr_en (20'hfffff),
                 .reset_l (arst_l),
                 .rst_tri_en (mem_write_disable),
                 .sehold  (sehold),
                 .se      (se),
                 .si      (short_scan0_5),
                 //.clk	  (clk));
                 .rclk	  (rclk));
endmodule
// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl")
// End:
