// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_fcl.v
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
//////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_ifu_fcl
//  Description:	
//  The FCL is the fetch control logic.  It controls the PC datapath
//  and the fetch/next instruction datapath.  It also manages access
//  to the icache data, tags, vbits and to the tlb.
//  The FCL starts fetching from the reset PC upon reset.  It is up to
//  the DTU to specify which thread to fetch from.  Only T0 is set to
//  the reset PC.  If the decode unit specifies any other thread, it
//  will fetch from an indeterminate address.
//  The fetch block automatically stalls the machine when an Imiss is
//  detected and there is no thread to switch to.  
// 
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

`include "ifu.tmp.h"


module sparc_ifu_fcl(/*AUTOARG*/
   // Outputs
   `ifndef NO_RTL_CSM
   fcl_itlb_csm_rd_vld_bf,
   `endif
   fcl_icd_rdreq_bf, fcl_icv_rdreq_bf, fcl_icd_wrreq_bf, 
   fcl_ict_wrreq_bf, fcl_icv_wrreq_bf, fcl_icd_index_sel_ifq_bf, 
   fcl_ifq_grant_bf, fcl_ifq_icmiss_s1, fcl_ifq_rdreq_s1, 
   fcl_ifq_icache_en_s_l, fcl_ifq_thr_s1, fcl_ifq_canthr, 
   fcl_itlb_cam_vld_bf, fcl_itlb_cam_bypass_bf, fcl_itlb_addr_mask_l, 
   fcl_itlb_cam_real_bf, fcl_itlb_cam_pid_bf, fcl_itlb_wr_vld_bf, 
   fcl_itlb_dmp_vld_bf, fcl_itlb_dmp_all_bf, fcl_itlb_tag_rd_vld_bf, 
   fcl_itlb_invall_f_l, fcl_itlb_data_rd_vld_bf, fcl_erb_ievld_s1, 
   fcl_erb_tevld_s1, fcl_erb_immuevld_s1, ifu_lsu_thrid_s, 
   fcl_erb_asi_tid_f, fcl_erb_clear_iferr, fcl_erb_itlbrd_vld_s, 
   fcl_erb_itlbrd_data_s, fcl_dec_dslot_s, fcl_dtu_inst_vld_e, 
   fcl_dtu_intr_vld_e, fcl_dtu_inst_vld_d, fcl_dtu_ely_inst_vld_d, 
   fcl_dec_intr_vld_d, fcl_erb_inst_issue_d, fcl_erb_inst_vld_d1, 
   ifu_tlu_inst_vld_m, ifu_exu_inst_vld_e, ifu_exu_inst_vld_w, 
   ifu_spu_inst_vld_w, ifu_tlu_inst_vld_w, ifu_tlu_flush_w, 
   ifu_tlu_flush_m, fcl_swl_int_activate_i3, fcl_swl_flush_wake_w, 
   fcl_swl_flush_w, fcl_dcl_regz_e, ifu_tlu_thrid_e, ifu_tlu_thrid_d, 
   ifu_tlu_immu_miss_m, ifu_tlu_priv_violtn_m, ifu_tlu_icmiss_e, 
   ifu_tlu_ttype_vld_m, ifu_exu_ttype_vld_m, ifu_mmu_trap_m, 
   ifu_tlu_trap_m, ifu_tlu_ttype_m, ifu_tlu_hwint_m, 
   ifu_tlu_sftint_m, ifu_tlu_rstint_m, fcl_dtu_rst_thr_w, 
   fcl_dtu_resum_thr_w, ifu_tlu_itlb_done, ifu_spu_trap_ack, 
   ifu_exu_tid_s2, ifu_exu_ren1_s, ifu_exu_ren2_s, ifu_exu_ren3_s, 
   ifu_exu_disable_ce_e, fcl_dtu_sync_intr_d, fcl_dtu_tlzero_d, 
   fcl_dtu_privmode_d, fcl_dtu_hprivmode_d, fcl_dtu_hprivmode_w2, 
   fcl_dtu_nuke_thr_w, fcl_swl_swout_f, fcl_dtu_stall_bf, 
   fcl_swl_swcvld_s, fcl_dtu_thr_f, fcl_imd_oddwin_d, 
   fcl_fdp_oddwin_s, fcl_fdp_pcoor_vec_f, fcl_fdp_pcoor_f, 
   fcl_fdp_mask32b_f, fcl_fdp_addr_mask_d, fcl_fdp_tctxt_sel_prim, 
   fcl_fdp_usenir_sel_nir_s1, fcl_fdp_rbinst_sel_inste_s, 
   fcl_fdp_thrtnpc_sel_tnpc_l, fcl_fdp_thrtnpc_sel_npcw_l, 
   fcl_fdp_thrtnpc_sel_pcf_l, fcl_fdp_thrtnpc_sel_old_l, 
   fcl_fdp_thr_s1_l, fcl_fdp_next_thr_bf_l, fcl_fdp_next_ctxt_bf_l, 
   fcl_fdp_nirthr_s1_l, fcl_fdp_thr_s2_l, 
   fcl_fdp_tpcbf_sel_pcp4_bf_l, fcl_fdp_tpcbf_sel_brpc_bf_l, 
   fcl_fdp_tpcbf_sel_trap_bf_l, fcl_fdp_tpcbf_sel_old_bf_l, 
   fcl_fdp_pcbf_sel_nosw_bf_l, fcl_fdp_pcbf_sel_swpc_bf_l, 
   fcl_fdp_pcbf_sel_br_bf_l, fcl_fdp_trrbpc_sel_trap_bf_l, 
   fcl_fdp_trrbpc_sel_rb_bf_l, fcl_fdp_trrbpc_sel_err_bf_l, 
   fcl_fdp_trrbpc_sel_pcs_bf_l, fcl_fdp_noswpc_sel_tnpc_l_bf, 
   fcl_fdp_noswpc_sel_old_l_bf, fcl_fdp_noswpc_sel_inc_l_bf, 
   fcl_fdp_nextpcs_sel_pce_f_l, fcl_fdp_nextpcs_sel_pcd_f_l, 
   fcl_fdp_nextpcs_sel_pcs_f_l, fcl_fdp_nextpcs_sel_pcf_f_l, 
   fcl_fdp_inst_sel_curr_s_l, fcl_fdp_inst_sel_switch_s_l, 
   fcl_fdp_inst_sel_nir_s_l, fcl_fdp_inst_sel_nop_s_l, 
   fcl_fdp_tinst_sel_curr_s_l, fcl_fdp_tinst_sel_rb_s_l, 
   fcl_fdp_tinst_sel_old_s_l, fcl_fdp_tinst_sel_ifq_s_l, 
   fcl_fdp_dmpthr_l, fcl_fdp_ctxt_sel_dmp_bf_l, 
   fcl_fdp_ctxt_sel_sw_bf_l, fcl_fdp_ctxt_sel_curr_bf_l, 
   fcl_fdp_rdsr_sel_pc_e_l, fcl_fdp_rdsr_sel_thr_e_l, 
   fcl_fdp_rdsr_sel_ver_e_l, so, ifu_reset_l, 
   fcl_fdp_tlbmiss_s1, fcl_esl_tinst_vld_next_s,
   fcl_esl_brtaken_e, fcl_esl_brtaken_m, fcl_esl_thr_e, fcl_esl_thr_m,
   fcl_esl_inst_vld_d, fcl_esl_inst_vld_e, fcl_esl_inst_vld_m, 
   fcl_esl_thr_trap_bf, fcl_esl_rb_stg_s,
   // Inputs
   `ifndef NO_RTL_CSM
   tlu_itlb_csm_rd_g,
   `endif
   rclk, grst_l, arst_l, se, sehold, si, rst_tri_en, 
   tlu_ifu_flush_pipe_w, exu_ifu_va_oor_m, exu_ifu_oddwin_s, 
   spu_ifu_ttype_tid_w2, spu_ifu_ttype_vld_w2, spu_ifu_ttype_w2, 
   erb_fcl_spu_uetrap, exu_ifu_regz_e, dcl_fcl_bcregz0_e, 
   dcl_fcl_bcregz1_e, dtu_fcl_rollback_g, dtu_fcl_retract_d, 
   dtu_fcl_br_inst_d, dtu_fcl_sir_inst_e, dtu_fcl_privop_e, 
   dtu_fcl_fpdis_e, dtu_fcl_imask_hit_e, dtu_fcl_illinst_e, 
   dtu_fcl_thr_active, dec_fcl_rdsr_sel_pc_d, dec_fcl_rdsr_sel_thr_d, 
   ifq_fcl_wrreq_bf, ifq_fcl_icd_wrreq_bf, ifq_fcl_ictv_wrreq_bf, 
   ifq_fcl_rdreq_bf, ifq_fcl_asi_tid_bf, ifq_fcl_asird_bf, 
   ifq_fcl_invreq_bf, erb_fcl_itlb_ce_d1, erb_dtu_ifeterr_d1, 
   erb_fcl_ifet_uevec_d1, erb_fcl_ue_trapvec, erb_fcl_ce_trapvec, 
   dtu_fcl_nextthr_bf, dtu_fcl_ntr_s, dtu_fcl_running_s, 
   dtu_fcl_flush_sonly_e, fdp_fcl_swc_s2, fdp_fcl_va2_bf, 
   itlb_fcl_tlbmiss_f_l, itlb_fcl_priv_s1, itlb_fcl_cp_s1, 
   itlb_fcl_imiss_s_l, fdp_fcl_pc_oor_vec_f, fdp_fcl_pc_oor_e, 
   fdp_fcl_op_s, fdp_fcl_op3_s, fdp_fcl_ibit_s, lsu_ifu_stallreq, 
   ffu_ifu_stallreq, ifq_fcl_stallreq, dtu_inst_anull_e, 
   ifq_fcl_fill_thr, ifq_fcl_flush_sonly_e, tlu_ifu_trap_tid_w1, 
   tlu_ifu_trappc_vld_w1, tlu_ifu_trapnpc_vld_w1, 
   tlu_lsu_pstate_priv, tlu_lsu_pstate_am, tlu_hpstate_priv, 
   tlu_lsu_redmode, tlu_hpstate_enb, lsu_ifu_addr_real_l, 
   lsu_pid_state0, lsu_pid_state1, lsu_pid_state2, lsu_pid_state3, 
   lsu_ifu_icache_en, lsu_ifu_dc_parity_error_w2, lsu_ifu_t0_tlz, 
   lsu_ifu_t1_tlz, lsu_ifu_t2_tlz, lsu_ifu_t3_tlz, tlu_ifu_hwint_i3, 
   tlu_ifu_pstate_ie, tlu_ifu_sftint_vld, tlu_ifu_hintp_vld, 
   tlu_ifu_rerr_vld, tlu_ifu_rstthr_i2, tlu_ifu_rstint_i2, 
   tlu_ifu_resumint_i2, tlu_ifu_nukeint_i2, tlu_itlb_wr_vld_g, 
   tlu_itlb_dmp_vld_g, tlu_itlb_dmp_all_g, tlu_itlb_data_rd_g, 
   tlu_itlb_tag_rd_g, tlu_itlb_invalidate_all_g, tlu_fcl_dmp_pid_bf, 
   tlu_fcl_dmp_real_bf, tlu_idtlb_dmp_thrid_g, exu_ifu_ecc_ce_m, 
   ffu_ifu_fst_ce_w, config_dtu_esl_en, esl_fcl_stall_bf, 
   esl_fcl_switch_bf, esl_fcl_ntr_s, esl_fdp_issue_prev_inst_s,
   esl_fcl_force_running_s,

   // trin
   // core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data,
   fdp_fcl_jtag_breakpoint_hit
   );

   input  rclk,
	        grst_l,
          arst_l,
	        se,
          sehold,
	        si;

   input  rst_tri_en;


   input  tlu_ifu_flush_pipe_w;	// flush pipe on a trap
   input  exu_ifu_va_oor_m;
   input [3:0] exu_ifu_oddwin_s;

   input [1:0] spu_ifu_ttype_tid_w2;
   input       spu_ifu_ttype_vld_w2;
   input       spu_ifu_ttype_w2;

   input [3:0] erb_fcl_spu_uetrap;  // use m3
   
//   input       dtu_fcl_brtaken_e;    // branch taken
   input       exu_ifu_regz_e;
   input       dcl_fcl_bcregz0_e,
               dcl_fcl_bcregz1_e;
   
   input       dtu_fcl_rollback_g;
   input       dtu_fcl_retract_d;
   input       dtu_fcl_br_inst_d;
   input       dtu_fcl_sir_inst_e;
   input       dtu_fcl_privop_e,
		           dtu_fcl_fpdis_e,
               dtu_fcl_imask_hit_e,
		           dtu_fcl_illinst_e;
   input [3:0] dtu_fcl_thr_active;

   input       dec_fcl_rdsr_sel_pc_d,
		           dec_fcl_rdsr_sel_thr_d;
   
   input       ifq_fcl_wrreq_bf;
   input       ifq_fcl_icd_wrreq_bf,
		           ifq_fcl_ictv_wrreq_bf,
		           ifq_fcl_rdreq_bf;

   input [1:0] ifq_fcl_asi_tid_bf;
   input       ifq_fcl_asird_bf;
   
   input       ifq_fcl_invreq_bf;

   input       erb_fcl_itlb_ce_d1;
   input       erb_dtu_ifeterr_d1;
   input [3:0] erb_fcl_ifet_uevec_d1,
		           erb_fcl_ue_trapvec,
		           erb_fcl_ce_trapvec;   
   
   input [3:0] dtu_fcl_nextthr_bf;   // thread to switch to
   input       dtu_fcl_ntr_s,        // next thread ready for ex
               dtu_fcl_running_s;

   input       dtu_fcl_flush_sonly_e;
//               dec_fcl_kill4sta_e;

   input       fdp_fcl_swc_s2,       // instruction switch condition
		           fdp_fcl_va2_bf,       // bit 2 of vaddr
		           itlb_fcl_tlbmiss_f_l,  // itlb miss
		           itlb_fcl_priv_s1,     // privileged access page
		           itlb_fcl_cp_s1,       // uncached access page
		           itlb_fcl_imiss_s_l;     // icache miss in s1

   input [3:0] fdp_fcl_pc_oor_vec_f;
   input       fdp_fcl_pc_oor_e;

   input [1:0] fdp_fcl_op_s;
   input [5:2] fdp_fcl_op3_s;
   input       fdp_fcl_ibit_s;

   input       lsu_ifu_stallreq,
	             ffu_ifu_stallreq,
               ifq_fcl_stallreq;
   
   input       dtu_inst_anull_e;

   input [3:0] ifq_fcl_fill_thr;     // fill inst goes to this
                                   	 // thread instruction register
   input       ifq_fcl_flush_sonly_e;

   input [1:0] tlu_ifu_trap_tid_w1;     // thr for which trappc is sent
   input       tlu_ifu_trappc_vld_w1,   // ld pc on trap or done/retry
		           tlu_ifu_trapnpc_vld_w1;  // ld Npc for a retry

   input [3:0] tlu_lsu_pstate_priv;     // may need to flop these three
   input [3:0] tlu_lsu_pstate_am;
   input [3:0] tlu_hpstate_priv;
   input [3:0] tlu_lsu_redmode;
   input [3:0] tlu_hpstate_enb;

   input [3:0] lsu_ifu_addr_real_l;
   input [2:0] lsu_pid_state0,
               lsu_pid_state1,
               lsu_pid_state2,
               lsu_pid_state3;
   input [3:0] lsu_ifu_icache_en;

   input       lsu_ifu_dc_parity_error_w2;
   

//   input       lsu_ifu_flush_ireg;  // not needed any more
   input       lsu_ifu_t0_tlz,
 		           lsu_ifu_t1_tlz,
 		           lsu_ifu_t2_tlz,
 		           lsu_ifu_t3_tlz;

   input [3:0] tlu_ifu_hwint_i3,        // normal interrupt
		           tlu_ifu_pstate_ie,
		           tlu_ifu_sftint_vld,
		           tlu_ifu_hintp_vld,
		           tlu_ifu_rerr_vld,
		           tlu_ifu_rstthr_i2;       // reset or idle interrupt

   input       tlu_ifu_rstint_i2,       // reset to a dead thread
		           tlu_ifu_resumint_i2,
		           tlu_ifu_nukeint_i2;

   input       tlu_itlb_wr_vld_g,
		           tlu_itlb_dmp_vld_g,
               tlu_itlb_dmp_all_g,
		           tlu_itlb_data_rd_g,
		           tlu_itlb_tag_rd_g;
   input       tlu_itlb_invalidate_all_g;

   input [2:0] tlu_fcl_dmp_pid_bf;
   input       tlu_fcl_dmp_real_bf;
   input [1:0] tlu_idtlb_dmp_thrid_g;

   input       exu_ifu_ecc_ce_m;
   input       ffu_ifu_fst_ce_w;
  
   input       config_dtu_esl_en;
   input       esl_fcl_stall_bf;
   input       esl_fcl_switch_bf;
   input       esl_fcl_ntr_s;
   input       esl_fdp_issue_prev_inst_s;
   input       esl_fcl_force_running_s;

   `ifndef NO_RTL_CSM
   input       tlu_itlb_csm_rd_g;
   `endif
   
   // jtag
   // output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data; 
   
   // to icd
   output      fcl_icd_rdreq_bf,
               fcl_icv_rdreq_bf,
		           fcl_icd_wrreq_bf,
		           fcl_ict_wrreq_bf,
		           fcl_icv_wrreq_bf;

   output      fcl_icd_index_sel_ifq_bf;
   output      fcl_ifq_grant_bf;
   
   // to ifq
   output      fcl_ifq_icmiss_s1;  // if icache turned off
   output      fcl_ifq_rdreq_s1;
   output      fcl_ifq_icache_en_s_l;
   
   output [1:0] fcl_ifq_thr_s1;
   output [3:0] fcl_ifq_canthr;     // cancel ifetch to this thread

   // to itlb
   output       fcl_itlb_cam_vld_bf,
                fcl_itlb_cam_bypass_bf,
		            fcl_itlb_addr_mask_l,
                fcl_itlb_cam_real_bf;

   output [2:0] fcl_itlb_cam_pid_bf;
   
   output       fcl_itlb_wr_vld_bf,
		            fcl_itlb_dmp_vld_bf,
                fcl_itlb_dmp_all_bf,
		            fcl_itlb_tag_rd_vld_bf,
		            fcl_itlb_invall_f_l,
		            fcl_itlb_data_rd_vld_bf;
  
   `ifndef NO_RTL_CSM
   output       fcl_itlb_csm_rd_vld_bf;
   `endif
   
   // to erb
   output       fcl_erb_ievld_s1,
		            fcl_erb_tevld_s1,
		            fcl_erb_immuevld_s1;

   output [1:0] ifu_lsu_thrid_s,
		            fcl_erb_asi_tid_f;

   output [3:0] fcl_erb_clear_iferr;
   

   output       fcl_erb_itlbrd_vld_s,
		            fcl_erb_itlbrd_data_s;

   output       fcl_dec_dslot_s;
   output       fcl_dtu_inst_vld_e,
                fcl_dtu_intr_vld_e,
		            fcl_dtu_inst_vld_d,
                fcl_dtu_ely_inst_vld_d,
                fcl_dec_intr_vld_d,
		            fcl_erb_inst_issue_d,
		            fcl_erb_inst_vld_d1,
		            ifu_tlu_inst_vld_m,
//		            ifu_lsu_inst_vld_m,
		            ifu_exu_inst_vld_e,
		            ifu_exu_inst_vld_w,
		            ifu_spu_inst_vld_w,
		            ifu_tlu_inst_vld_w;
   
   output       ifu_tlu_flush_w;
   output       ifu_tlu_flush_m;

   output [3:0] fcl_swl_int_activate_i3;
   output       fcl_swl_flush_wake_w;
   output       fcl_swl_flush_w;

   output       fcl_dcl_regz_e;
   
   // to tlu
   output [1:0] ifu_tlu_thrid_e;
   output [1:0] ifu_tlu_thrid_d;

   output       ifu_tlu_immu_miss_m,
		            ifu_tlu_priv_violtn_m;
	 
   output       ifu_tlu_icmiss_e;
   output       ifu_tlu_ttype_vld_m;
   output       ifu_exu_ttype_vld_m;
   output       ifu_mmu_trap_m;
   output       ifu_tlu_trap_m;
   output [8:0] ifu_tlu_ttype_m;
   
   output       ifu_tlu_hwint_m;
   output       ifu_tlu_sftint_m;
//   output       ifu_tlu_hintp_m;
//   output       ifu_tlu_rerr_m;
   output       ifu_tlu_rstint_m;
   output       fcl_dtu_rst_thr_w;
   output       fcl_dtu_resum_thr_w;

   output       ifu_tlu_itlb_done;

   output       ifu_spu_trap_ack;
   
   // to exu
   output [1:0] ifu_exu_tid_s2;
   output       ifu_exu_ren1_s,
		            ifu_exu_ren2_s,
		            ifu_exu_ren3_s;

   output       ifu_exu_disable_ce_e;  // to exu and ffu
   
   
   // to dtu
   output       fcl_dtu_sync_intr_d;
   output       fcl_dtu_tlzero_d;
   output       fcl_dtu_privmode_d;
   output       fcl_dtu_hprivmode_d;
   output       fcl_dtu_hprivmode_w2;
   output       fcl_dtu_nuke_thr_w;
   output       fcl_swl_swout_f;
   output       fcl_dtu_stall_bf;
//   output       fcl_dtu_switch_s;     // indicates to the DTU that a
                                      // switch took place to next_thr
   output       fcl_swl_swcvld_s;
   output [3:0] fcl_dtu_thr_f;
   output       fcl_imd_oddwin_d;
   
   // to fdp
   output       fcl_fdp_oddwin_s;
   output [3:0] fcl_fdp_pcoor_vec_f;
   output       fcl_fdp_pcoor_f;
   output       fcl_fdp_mask32b_f;
   output       fcl_fdp_addr_mask_d;

   output [3:0] fcl_fdp_tctxt_sel_prim;

   
   // 2:1 mux selects
   output       fcl_fdp_usenir_sel_nir_s1;   // same as usenir_d2
   output [3:0] fcl_fdp_rbinst_sel_inste_s;

   output [3:0] fcl_fdp_thrtnpc_sel_tnpc_l,  // load npc
		            fcl_fdp_thrtnpc_sel_npcw_l,
		            fcl_fdp_thrtnpc_sel_pcf_l,
		            fcl_fdp_thrtnpc_sel_old_l;
   
   output [3:0] fcl_fdp_thr_s1_l;            // s1 thr for thrNIR input mux
   
   // other mux selects   
   output [3:0] fcl_fdp_next_thr_bf_l,  // for thrpc output mux
                fcl_fdp_next_ctxt_bf_l, // for ctxt output mux
		            fcl_fdp_nirthr_s1_l,    // select NIR in s1 stage
		            fcl_fdp_thr_s2_l;       // s2 thr for thr_inst_reg

   output [3:0] fcl_fdp_tpcbf_sel_pcp4_bf_l, // selects for thread PC muxes
		            fcl_fdp_tpcbf_sel_brpc_bf_l,
		            fcl_fdp_tpcbf_sel_trap_bf_l,
		            fcl_fdp_tpcbf_sel_old_bf_l;

   output       fcl_fdp_pcbf_sel_nosw_bf_l,      // F stage pc mux selects
		            fcl_fdp_pcbf_sel_swpc_bf_l,
		            fcl_fdp_pcbf_sel_br_bf_l;

   output [3:0] fcl_fdp_trrbpc_sel_trap_bf_l, 
		            fcl_fdp_trrbpc_sel_rb_bf_l,
		            fcl_fdp_trrbpc_sel_err_bf_l,
		            fcl_fdp_trrbpc_sel_pcs_bf_l;

   output       fcl_fdp_noswpc_sel_tnpc_l_bf,    // next pc select,
		            fcl_fdp_noswpc_sel_old_l_bf,		 // dont need anymore
		            fcl_fdp_noswpc_sel_inc_l_bf;

   output [3:0] fcl_fdp_nextpcs_sel_pce_f_l,  
		            fcl_fdp_nextpcs_sel_pcd_f_l,
		            fcl_fdp_nextpcs_sel_pcs_f_l,  
		            fcl_fdp_nextpcs_sel_pcf_f_l;

   output       fcl_fdp_inst_sel_curr_s_l,   // selects for inst_s2
		            fcl_fdp_inst_sel_switch_s_l,
		            fcl_fdp_inst_sel_nir_s_l,
		            fcl_fdp_inst_sel_nop_s_l;

   output [3:0] fcl_fdp_tinst_sel_curr_s_l,  // selects for tinst regs
		            fcl_fdp_tinst_sel_rb_s_l,		
		            fcl_fdp_tinst_sel_old_s_l,
		            fcl_fdp_tinst_sel_ifq_s_l;

   output [3:0] fcl_fdp_dmpthr_l;

   output       fcl_fdp_ctxt_sel_dmp_bf_l,
		            fcl_fdp_ctxt_sel_sw_bf_l,
		            fcl_fdp_ctxt_sel_curr_bf_l;

   output       fcl_fdp_rdsr_sel_pc_e_l,
                fcl_fdp_rdsr_sel_thr_e_l,
                fcl_fdp_rdsr_sel_ver_e_l;
   
   output       so,
                ifu_reset_l;

   output       fcl_fdp_tlbmiss_s1;   
   output [3:0] fcl_esl_tinst_vld_next_s;
   output       fcl_esl_brtaken_e;
   output       fcl_esl_brtaken_m;
   output [3:0] fcl_esl_thr_e;
   output [3:0] fcl_esl_thr_m;
   output       fcl_esl_inst_vld_d;
   output       fcl_esl_inst_vld_e;
   output       fcl_esl_inst_vld_m;
   output [3:0] fcl_esl_thr_trap_bf;
   output       fcl_esl_rb_stg_s;

   // input       rtap_core_stallreq;
   input       fdp_fcl_jtag_breakpoint_hit;

   //----------------------------------------------------------------------
   // Declarations
   //----------------------------------------------------------------------
   reg [3:0]    fcl_fdp_tpcbf_sel_old_bf_l,
		            fcl_fdp_tpcbf_sel_pcp4_bf_l,
		            fcl_fdp_tpcbf_sel_trap_bf_l,
		            fcl_fdp_tpcbf_sel_brpc_bf_l;
   
   wire         fcl_fdp_inst_sel_nop_s_l,
                fcl_fdp_inst_sel_nir_s_l,
		            fcl_fdp_inst_sel_curr_s_l,
		            fcl_fdp_inst_sel_switch_s_l;
   

   // local signals
   wire         //sw_itlb_on,
                sw_itlb_real,
		            sw_itlb_am,
		            //this_itlb_on,
                this_itlb_real,
		            itlb_on;

   wire [3:0]   xlate_en,
                xlate_en_d1;
   
   wire [2:0]   sw_pid_bf,
                curr_pid_bf;

   wire         pid_sel_sw,
                pid_sel_curr,
                pid_sel_dmp;
   
   wire         itlb_access_gnt,
		            itlb_access_en,
                itlb_write_en,
                ctxt_sel_dmp,
		            itlb_access_done,
                itlb_write_done,
		            itlb_rd_access_done,
		            itlb_rd_access_done_d1,
		            itlb_rd_access_done_d2,
		            itlb_rd_req_bf,
		            itlb_rd_req_f,
		            itlb_data_rd_f,
                itlb_data_rd_s;
   
   wire [1:0]   asi_tid_bf;
   wire [1:0]   spu_tid_w2;
   
   wire         fetch_bf,	// fetch an instruction next cycle
                allow_ifq_access_icd_bf,
                inst_access_bf,
                ia1_bf,
                ia0_bf,
                no_instacc_bf;
   
   wire         cam_vld_bf,
                tlb_invall_bf,
                tlb_invall_f,
//                tlb_invall_req_bf,
                inst_vld_bf;
   
   wire         rdreq_bf,     // read from I$ next cycle
		            rdreq_f;
   
   wire         ic_wrreq_bf;
   
   wire         running_s2,
                valid_s,
		            running_s1,
                ely_running_s1,
		            running_d,
		            running_e,
		            running_m,
    		        inst_vld_f,
		            inst_vld_s,
                inst_vld_s_crit,
		            inst_vld_s1,
		            inst_vld_s2,    // valid bit of S stage
	 	                            // instruction.  If this is 0,
		                            // convert inst to no-op
                    inst_vld_s2_ed,
		            inst_vld_d,
                inst_vld_d_crit,
		            inst_vld_d1,
		            inst_vld_e,
		            inst_vld_qual_e,
		            inst_vld_m,
		            inst_vld_w;

   wire         inst_vld_w_crit;
   
   wire         no_iftrap_m,
                no_iftrap_w;

   wire         stall_f,
		            stall_s1,
		            stall_s1_nxt,
                ely_stall_thisthr_f,
                part_stall_thisthr_f,
		            stall_thisthr_f;
   wire         rdreq_s1;

   wire         usenir_bf,
		            usenir_f,
		            usenir_s1;
   
   wire [3:0]   tinst_vld_s,    // valid bit of thr instr register
		                            // in s stage
		            tinst_vld_nxt;

   wire [3:0]   val_thr_s1,
		            val_thr_f,
                thr_e_v2,
		            val_thr_e;
   
   wire         flush_sonly_qual_e,
                flush_sonly_all_m,
                flush_sonly_qual_m,
                ims_flush_sonly_m,
                ims_flush_sonly_w,
                ims_flush_coll_m,
                ims_flush_coll_w,
                flush_sonly_m;

   wire         flush_pipe_w;
   
   wire         kill_thread_d,
//		            kill_thread_e,
		            kill_thread_m,
                kill_local_m,
                ely_kill_thread_s2,
                ely_kill_thread_m,
		            kill_thread_s2;
   
   wire [3:0]   clear_s_d1,
                flush_thr_w,
                late_flush_w2;

   wire         utrap_flush_w,
                utrap_flush_m,
                flush_pipe_w2;
   
   wire         kill_curr_f,
                kill_curr_d,
                kill_curr_e,
                kill_curr_m;
   
   wire [3:0]   canthr_f,
                canthr_s_early,
		            canthr_s;
   wire         canthr_sw;
   wire         canthr_sm,
                canthr_sd;

   wire         forcemiss_f,   // force an icache miss (if icache is off)
		            forcemiss_s1,
                icmiss_for_perf,
//                ic_miss_sw_s1,
		            ic_miss_s1;    // icache miss (forced or not)

   wire [3:0]   icache_en_d1;

   wire         icache_on_bf,
		            icache_on_f,
		            icache_on_s1,
                uncached_page_s1;
//		            sw_icache_on,
//		            this_icache_on;
   
   wire         imsto_thisthr_s1,
                iferrto_thisthr_d1,
                retract_iferr_d1,
                retract_iferr_qual_d1,
                retract_inst_d,
                retract_iferr_e;
//   wire         intrto_thisthr_d;
//   wire         imsto_nextthr_s1;

   wire         mark4rb_w,
                mark4rb_m,
                mark4rb_e,
                mark4rb_d,
                mark4rb_s;
   
   wire [3:0]   tlbmiss_s2,
		            tlbmiss_d,
		            nir_tlbmiss_vec,
		            nir_tlbmiss_next;

   wire [3:0]   delay_slot_vec,
                delay_slot_vec_nxt;
   
   wire         tlb_cam_miss_f,
                tlb_cam_miss_s1,
                nir_tlbmiss_s1,
		            tlbmiss_s1_crit,
		            tlbmiss_s1;
   
   wire         cam_vld_f,
		            cam_vld_s1;
   
   wire         immu_fault_f,
		            immu_miss_d,
		            immu_miss_crit_d,
		            immu_miss_qual_d,
		            immu_miss_e,
//                immu_miss_qual_e,
                immu_miss_m,
                addr_real_e;
   wire [3:0]   itlb_addr_real_l,
                itlb_addr_real;
   wire [3:0]   pstate_am_d1;
   
   wire         pc_oor_s1,
                pc_oor_s2,
                pc_oor_s,
		            pc_oor_f;
   wire         set_oor_m;
   wire         addr_mask_32b_m;
   
   wire         priv_mode_s1,
                priv_mode_f,
                hpriv_mode_s1,
                hpriv_mode_w,
                hpriv_mode_w2,
                hpriv_mode_f;

   wire         inst_acc_exc_s1,
		            inst_acc_exc_d,
		            inst_acc_exc_e;
   wire [3:0]   inst_acc_vec_s2,
		            inst_acc_vec_d;
   
   wire         priv_violtn_e,
                priv_violtn_m;

   wire         trap_e,
		            trap_m;
   
   wire         ttype_sel_spuma_e,
 		            ttype_sel_spuenc_e,
		            ttype_sel_corr_err_e,
		            ttype_sel_unc_err_e,		
		            ttype_sel_res_err_e,		
		            ttype_sel_hstk_cmp_e,		
		            ttype_sel_pcoor_e,
		            ttype_sel_immu_miss_e, 
		            ttype_sel_real_trans_e, 
		            ttype_sel_icache_err_e,
		            ttype_sel_priv_viol_e, 
		            ttype_sel_privop_e,    
		            ttype_sel_illinst_e,
		            ttype_sel_ibe_e,
		            ttype_sel_sir_e,
		            ttype_sel_fpdis_e;
   
   wire [8:0]   ttype_e;
   
   wire [3:0]   next_nir_privvec,
		            nir_privvec;
   wire         nir_priv_s1,
		            priv_inst_s1;
   
   wire         tlzero_s2;
   wire [3:0]   tlzero_vec_d1;

   wire         nuke_thr_w,
                resum_thr_w,
                rst_thr_w;

   wire [3:0]   spu_thr;
//   wire [3:0]   rst_thr_bf;
   
   wire [3:0]   async_rst_i3,
                async_rst_i4,
		            next_rst_i2,
		            rstint_i2,
		            rstint_i3,
		            resumint_i2,
		            resumint_i3,
                next_resum_i2,
		            nuke_thr_i2,
		            next_nuke_i2,
		            nuke_thr_i3,
		            next_sftint_i2,
                next_hintp_i2,
                next_rerr_i2,
		            next_hwint_i3,
		            sftint_i3,
                hintp_i3,
                rerr_i3,
		            hwint_i4,
		            next_ceint_i2,
		            ceint_i3,
		            next_ueint_i2,
		            ueint_i3,
		            next_spuint0_i2,
		            spuint0_i3,
		            next_spuint1_i2,
		            spuint1_i3;

   wire [3:0]   intr_in_pipe;

   wire [3:0]   hypv_int_en,
                hypv_int_en_d1;
   wire [3:0]   supv_int_en,
                supv_int_en_d1;

   wire [3:0]   ifet_ue_vec_d1,
		            ifet_ue_vec_e;
   wire         ifet_ue_e;

   wire [3:0]   any_intr_vec_f,
                any_intr_vec_s,
                intr_pending_nxt,
                intr_pending_s,
                supv_masked_intr_s,
                hypv_masked_intr_s;

   wire         spuint0_m,
                spuint0_trap_m,
//                spuint0_qual_m,
		            spuint0_e,
		            spuint0_qual_e,
                spuint0_w,
                spuint0_trap_w,
 		            spuint1_m,
                spuint1_trap_m,
//                spuint1_qual_m,
		            spuint1_e,
		            spuint1_qual_e,
                spuint1_w,
                spuint1_trap_w,
                hwint_m,
                hwint_e,
                rstint_m,
//                rstint_qual_m,
                resumint_m,
                resumint_qual_m,
                sftint_m,
                sftint_e,
                sftint_qual_e,
                hintp_e,
                hintp_qual_e,
                hintp_m,
                rerr_e,
                rerr_qual_e,
                rerr_m,
                nuke_thr_m,
                nuke_thr_qual_m,
		            ceint_m,
                ceint_trap_m,
                ceint_trap_w,
//                ceint_qual_m,
                ceint_qual_w,
		            ceint_e,
		            ceint_qual_e,
		            ueint_m,
                ueint_trap_m,
                ueint_trap_w,
//                ueint_qual_m,
                ueint_qual_w,
                ueint_qual_e,
		            ueint_e;

   wire         disr_trap_m,
                rb_intr_m,
                rb_intr_w,
                any_intr_m;
   
   wire         force_intr_s;
   wire         intr_vld_s,
		            intr_vld_d,
		            intr_vld_e,
		            intr_vld_m,
		            intr_vld_w,
                intr_vld_qual_s,
		            intr_vld_qual_d,
		            intr_vld_qual_e,
		            intr_vld_qual_m;
   
   wire         kill_intr_f,
		            kill_intr_d,
		            kill_intr_e;
   
//	 wire         kill_intr_m;
   
   wire         rst_stallreq,
                rst_stallreq_l,
                all_stallreq,
                rst_itlb_stv_l,
                arst_vld_f,
                arst_vld_f_l,
                arst_vld_s,
                arst_vld_s_l,
                async_intr_vld_s,
                itlb_starv_alert,
                rst_sw_bf,
                rst_sw_bf_l,
                sw_for_real_rst_bf,
                rst_stallreq_d0,
		            rst_stallreq_d1,
		            rst_stallreq_d2;

   wire         lsu_stallreq_d1,
                ffu_stallreq_d1;
   
   wire [3:0]   rstint_penc;
   
   wire         usep_bf,
                set_usen_bf,
                usen_iso_bf,
		            usen_bf;
   wire         va2_f;
   wire         ntpc_thisthr;
   
   wire [3:0]   thr_usen_nxt,
 		            thr_usen_bf;
   
   wire         brto_nxtthr_bf_l,  // intermediate signal for icadr sel
//                brto_nxtthr_bf,
//                thr_match_ne_norst,
                sw_match_ne_norst,
                brtaken_buf_e,
                brtaken_unq_e,
                brtaken_e,
                brtaken_m;
   
   wire         switch_bf,   // switch in next cycle unless stall
                switch_qual_bf,
		            switch_s2;  // switch in this cycle
   
   wire         rstt,       // set thr_f to the reset pkt thread
		            swt,        // switch to nextthr_bf
		            samet;      // don't change thread

   wire [3:0]   thr_f_crit,
                thr_f_dec,
                thr_f_flop;

   wire [3:0]   thr_f,      // = thr_s2
		            thr_bf,
		            thr_s1,     // = thr_d
		            thr_s1_next,
                dec_thr_s1_l,
		            thr_d,
		            thr_e,
		            thr_m,
		            thr_w2,
		            thr_w;

   wire         tm_fd_l;
   
   wire         thr_match_fw,
		            thr_match_fw2,
		            thr_match_dw,
		            thr_match_dw2,
		            thr_match_em,
		            thr_match_ew,
		            thr_match_ew2,
		            same_thr_mw2,
		            thr_match_mw,
		            thr_match_fm,
		            thr_match_de,
		            thr_match_dm,
		            thr_match_fe,
		            thr_match_fd,
		            thr_match_fs1,
		            thr_match_nw,
		            thr_match_nd,
		            thr_match_ne;
//		            thr_match_ft;

   wire         rb2_inst_d,
		            rb2_inst_e,
		            rb1_inst_s,
		            rb1_inst_d,
		            rb0_inst_bf,
		            rb0_inst_s,
		            rt2_inst_e,
		            rt1_inst_s,
		            rt1_inst_d,
		            rt0_inst_bf,
		            rt0_inst_s;
   
   wire [3:0]   rb_w2,
                rb_for_iferr_e,
		            rb_froms,
		            rb_frome,
		            rb_fromd;
   
   wire         rb_stg_s,
		            rb_stg_d,
                rb_stg_d_crit,
		            rb_stg_e;
   
   wire         icadr_selbr_l,
//		            icadr_selsw,
//                icadr_selbr,
                icadr_selsw_l;

   wire         sw_or_async_stall;
   
   wire [3:0]   trap_thr;
   
   wire [3:0]   load_tpc,     // thread pc reg input select
		            load_bpc,     // these should be exclusive in normal mode
		            load_pcp4;    // but not during scan shift or reset
   
   wire         irf_ce_w,
		            irf_ce_m,
                any_ce_w,
		            rb_stg_w;

   wire [3:0]   ce_cnt0,
                ce_cnt0_nxt,
                ce_cnt1,
                ce_cnt1_nxt,
                ce_cnt_rst;
   
   wire         ce_val0_d,
                ce_val1_d,
                disable_ce_e,
                disable_ce_d;
   
   wire [3:0]   ntpc_vld,     // use thr_nextpc_f
		            ntpc_vld_nxt;
   
   wire [1:0]   sas_thrid_w;
   
   wire         rdsr_sel_pc_e,
		    		    rdsr_sel_thr_e;

   wire [1:0]   trap_tid_w2;
   wire         trappc_vld_w2, 
                trapnpc_vld_w2;

   wire         fcl_reset,
                fcl_reset_l;

   // some monitor is looking for this signal
//   wire         fcl_swl_flush_wait_w=1'b0;
   wire         clk;
   
   wire [3:0]   nextthr_bf_buf,
                nextthr_final_bf;


//
// Code start here 
//
   assign       clk = rclk;
   
//----------------------------------------------------------------------
// Fetch Unit Controls
//----------------------------------------------------------------------

   // reset buffer
   dffrl_async rstff(.din (grst_l),
                     .q   (fcl_reset_l),
                     .clk (clk), .se(se), .si(), .so(),
                     .rst_l (arst_l));

   assign   fcl_reset = ~fcl_reset_l;
   assign   ifu_reset_l = fcl_reset_l;
   

//-----------------------------------
// TLB Operations
//-----------------------------------

   dff_s #(4) real_reg(.din (lsu_ifu_addr_real_l),
                     .q   (itlb_addr_real_l),
                     .clk (clk), .se(se), .si(), .so());
   assign   itlb_addr_real = ~itlb_addr_real_l;

   // ITLB on signal

//`ifdef SPARC_HPV_EN   
   assign   xlate_en = (~tlu_hpstate_enb & lsu_ifu_addr_real_l |
                        tlu_hpstate_enb & ~tlu_hpstate_priv) & 
                         ~tlu_lsu_redmode;
   
//`else
//   assign   xlate_en = lsu_ifu_addr_real_l;
//`endif

   dff_s #(4) xlate_reg(.din (xlate_en),
                      .q   (xlate_en_d1),
                      .clk (clk), .se(se), .si(), .so());
   
//   assign sw_itlb_on = ((nextthr_bf_buf & xlate_en_d1) == 4'b0) ?
//		                     1'b0 : 1'b1;
//   assign this_itlb_on = ((thr_f & xlate_en_d1) == 4'b0) ?
//			                     1'b0 : 1'b1;
//   assign itlb_on = switch_bf ? sw_itlb_on : this_itlb_on;
   assign itlb_on = (nextthr_final_bf[0] & xlate_en_d1[0] |
                     nextthr_final_bf[1] & xlate_en_d1[1] |
                     nextthr_final_bf[2] & xlate_en_d1[2] |
                     nextthr_final_bf[3] & xlate_en_d1[3]);
   

   // flop xlate_en (done) addr_real and icache_en if timing is 
   // not cutting it

   // Hypervisor signals
   assign sw_itlb_real = ((nextthr_bf_buf & itlb_addr_real) == 4'b0) ?
		                     1'b0 : 1'b1;
   assign this_itlb_real = ((thr_f & itlb_addr_real) == 4'b0) ?
			                     1'b0 : 1'b1;

//   assign fcl_itlb_cam_real_bf = switch_bf ? sw_itlb_real : this_itlb_real;

   mux3ds  creal_mx(.dout (fcl_itlb_cam_real_bf),
                    .in0  (sw_itlb_real),
                    .in1  (this_itlb_real),
                    .in2  (tlu_fcl_dmp_real_bf),
                    .sel0 (pid_sel_sw),
                    .sel1 (pid_sel_curr),
                    .sel2 (pid_sel_dmp));

   // Partition ID
   mux4ds #(3) swpid_mux (.dout (sw_pid_bf[2:0]),
                          .in0  (lsu_pid_state0[2:0]),
                          .in1  (lsu_pid_state1[2:0]),
                          .in2  (lsu_pid_state2[2:0]),
                          .in3  (lsu_pid_state3[2:0]),
                          .sel0 (nextthr_bf_buf[0]),
                          .sel1 (nextthr_bf_buf[1]),
                          .sel2 (nextthr_bf_buf[2]),
                          .sel3 (nextthr_bf_buf[3]));

   mux4ds #(3) currpid_mux (.dout (curr_pid_bf[2:0]),
                            .in0  (lsu_pid_state0[2:0]),
                            .in1  (lsu_pid_state1[2:0]),
                            .in2  (lsu_pid_state2[2:0]),
                            .in3  (lsu_pid_state3[2:0]),
                            .sel0 (thr_f[0]),
                            .sel1 (thr_f[1]),
                            .sel2 (thr_f[2]),
                            .sel3 (thr_f[3]));

//   assign fcl_itlb_cam_pid_bf[2:0] = switch_bf ?  
//                                       sw_pid_bf[2:0] : 
//                                       curr_pid_bf[2:0];

//   assign pid_sel_dmp = tlu_itlb_dmp_actxt_g & ctxt_sel_dmp;
   assign pid_sel_dmp = ctxt_sel_dmp;   
   assign pid_sel_curr = ~pid_sel_dmp & ~switch_bf;
   assign pid_sel_sw = ~pid_sel_dmp & switch_bf;
   mux3ds #(3) ipid_mx(.dout (fcl_itlb_cam_pid_bf[2:0]),
                       .in0  (sw_pid_bf[2:0]),
                       .in1  (curr_pid_bf[2:0]),
                       .in2  (tlu_fcl_dmp_pid_bf[2:0]),
                       .sel0 (pid_sel_sw),
                       .sel1 (pid_sel_curr),
                       .sel2 (pid_sel_dmp));
   
   // ITLB address mask
   dff_s #(4) am_reg(.din (tlu_lsu_pstate_am),
                   .q   (pstate_am_d1),
                   .clk (clk), .se(se), .si(), .so());
   
   assign sw_itlb_am = ((nextthr_bf_buf & pstate_am_d1) == 4'b0) ?
		                     1'b0 : 1'b1;
   assign fcl_itlb_addr_mask_l = switch_bf ? 
                                 ~sw_itlb_am : ~fcl_fdp_mask32b_f;

   dff_s #(4) tlz_reg(.din ({lsu_ifu_t3_tlz,
                           lsu_ifu_t2_tlz,
                           lsu_ifu_t1_tlz,
                           lsu_ifu_t0_tlz}),
                    .q   (tlzero_vec_d1[3:0]),
                    .clk (clk), .se (se), .si(), .so());
                           

   // TLB context select
   assign fcl_fdp_tctxt_sel_prim = tlzero_vec_d1 & itlb_addr_real_l;
//   assign fcl_fdp_tctxt_sel_prim[1] = lsu_ifu_t1_tlz & itlb_addr_real_l[1];
//   assign fcl_fdp_tctxt_sel_prim[2] = lsu_ifu_t2_tlz & itlb_addr_real_l[2];
//   assign fcl_fdp_tctxt_sel_prim[3] = lsu_ifu_t3_tlz & itlb_addr_real_l[3];
   

   // Access to TLB
   // ITLB may be accessed even when icache is off
   assign cam_vld_bf = itlb_on & inst_access_bf;
                        
   assign fcl_itlb_cam_vld_bf = cam_vld_bf;
   assign fcl_itlb_cam_bypass_bf = ~cam_vld_bf;
   
   dff_s #(1) itlb_onf_ff(.din (cam_vld_bf),
		                    .q   (cam_vld_f),
		                    .clk (clk),
		                    .se  (se), .si(), .so());

   dff_s #(1) itlb_ons1_ff(.din (cam_vld_f),
		                     .q   (cam_vld_s1),
		                     .clk (clk),
		                     .se  (se), .si(), .so());

   // allow rd/wr/demap access to tlb
   // itlb access is granted only every other cycle
   // (not enough time to turn the request from mmu around)
//   assign itlb_access_en = ~cam_vld_bf & ~ifq_fcl_asird_bf & 
//                           ~itlb_access_done;
//
//   assign itlb_write_en = ~cam_vld_bf & ~ifq_fcl_asird_bf & 
//                           ~itlb_write_done & 
//                           (~tlu_itlb_dmp_vld_g | itlb_access_done);

// Save some timing   
//   assign itlb_write_en = (~itlb_on | no_instacc_bf) & ~ifq_fcl_asird_bf &
//                          ~itlb_write_done & 
//                          (~tlu_itlb_dmp_vld_g | itlb_access_done);

   assign itlb_write_en = no_instacc_bf & ~ifq_fcl_asird_bf & 
                          ~itlb_write_done &  
                          (~tlu_itlb_dmp_vld_g | itlb_access_done);
   assign itlb_access_en = no_instacc_bf & ~ifq_fcl_asird_bf &
                           ~itlb_access_done;

   // reset tlb
//   dff #(1) itlbrst_ff(.din (tlu_itlb_invalidate_all_g),
//		                   .q   (tlb_invall_req_bf),
//		                   .clk (clk), .se(se), .si(), .so());
//   assign tlb_invall_bf = tlb_invall_req_bf & ~itlb_access_done;
   assign tlb_invall_bf = sehold ? tlb_invall_f :
                           (tlu_itlb_invalidate_all_g & itlb_access_en);
   dff_s #(1) itlbrstf_ff(.din (tlb_invall_bf),
		                    .q   (tlb_invall_f),
		                    .clk (clk), .se(se), .si(), .so());

   assign fcl_itlb_wr_vld_bf = tlu_itlb_wr_vld_g & itlb_write_en;
   assign fcl_itlb_dmp_vld_bf = tlu_itlb_dmp_vld_g & itlb_access_en;
   assign fcl_itlb_dmp_all_bf = tlu_itlb_dmp_all_g & tlu_itlb_dmp_vld_g & 
                                itlb_access_en;

//   assign fcl_itlb_invall_bf = tlb_invall_bf & itlb_access_en | fcl_reset;
   assign fcl_itlb_invall_f_l = ~tlb_invall_f;

   assign fcl_itlb_data_rd_vld_bf = tlu_itlb_data_rd_g & itlb_access_en & 
	                                  ~itlb_rd_access_done_d2 &
                                    ~itlb_rd_access_done_d1;
 
   assign fcl_itlb_tag_rd_vld_bf = tlu_itlb_tag_rd_g & itlb_access_en &
	                                 ~itlb_rd_access_done_d2 &
                                   ~itlb_rd_access_done_d1;

   `ifndef NO_RTL_CSM
   assign fcl_itlb_csm_rd_vld_bf = tlu_itlb_csm_rd_g & itlb_access_en & 
	                                  ~itlb_rd_access_done_d2 &
                                    ~itlb_rd_access_done_d1;
   `endif

   assign rst_itlb_stv_l = ((tlu_itlb_invalidate_all_g |
                             tlu_itlb_dmp_vld_g |
                             tlu_itlb_data_rd_g |
                             `ifndef NO_RTL_CSM
                             tlu_itlb_csm_rd_g  | 
                             `endif
                             tlu_itlb_tag_rd_g) & ~itlb_access_done |
                            tlu_itlb_wr_vld_g & ~itlb_write_done) &
                             ~fcl_reset;

   sparc_ifu_ctr5 starv_ctr(
			                      // Outputs
			                      .limit	(itlb_starv_alert),
			                      .so	(so),
			                      // Inputs
			                      .clk	(clk),
			                      .se	(se),
			                      .si	(si),
			                      .rst_ctr_l (rst_itlb_stv_l));

`ifndef NO_RTL_CSM
   assign itlb_rd_req_bf = fcl_itlb_data_rd_vld_bf | fcl_itlb_tag_rd_vld_bf | fcl_itlb_csm_rd_vld_bf;

   // tlb access request
   assign itlb_access_gnt = (fcl_itlb_data_rd_vld_bf |
                             fcl_itlb_csm_rd_vld_bf  | 
			                       fcl_itlb_tag_rd_vld_bf  |
//                             tlb_invall_bf & itlb_access_en |
                             tlb_invall_bf |
                             fcl_itlb_dmp_vld_bf);

`else
   assign itlb_rd_req_bf = fcl_itlb_data_rd_vld_bf | fcl_itlb_tag_rd_vld_bf;

   // tlb access request
   assign itlb_access_gnt = (fcl_itlb_data_rd_vld_bf |
			                       fcl_itlb_tag_rd_vld_bf  |
//                             tlb_invall_bf & itlb_access_en |
                             tlb_invall_bf |
                             fcl_itlb_dmp_vld_bf);
`endif
   dff_s #(1) tlb_gnt1_ff(.din (itlb_access_gnt),
		                  .q   (itlb_access_done),
		                  .clk (clk), .se  (se), .si(), .so());

   dff_s #(1) tlb_rd_ff(.din (itlb_rd_req_bf),
		                .q   (itlb_rd_req_f),
		                .clk (clk), .se  (se), .si(), .so());

   dff_s #(1) tlb_wrt1_ff(.din (fcl_itlb_wr_vld_bf),
		                    .q   (itlb_write_done),
		                    .clk (clk), .se  (se), .si(), .so());
   

   // TBD:
   // reads need to wait one more cycle.  Others can ack without this
   // second delay.
   assign itlb_rd_access_done = itlb_rd_req_f & itlb_access_done;
   
   dff_s #(1) tlb_rd1_ff(.din (itlb_rd_access_done),
		                  .q   (itlb_rd_access_done_d1),
		                  .clk (clk), .se  (se), .si(), .so());
   dff_s #(1) tlb_rd2_ff(.din (itlb_rd_access_done_d1),
		                   .q   (itlb_rd_access_done_d2),
		                  .clk (clk), .se  (se), .si(), .so());
   assign ifu_tlu_itlb_done = ~itlb_rd_req_f & itlb_access_done |
                               itlb_write_done | 
	                             itlb_rd_access_done_d2;

   assign fcl_erb_itlbrd_vld_s = itlb_rd_access_done_d1;
   
   assign asi_tid_bf = ifq_fcl_asird_bf ? ifq_fcl_asi_tid_bf :
	                                        tlu_idtlb_dmp_thrid_g;
   
   dff_s #(2) asi_tid_reg(.din (asi_tid_bf),
		                  .q   (fcl_erb_asi_tid_f),
		                  .clk (clk), .se(se), .si(), .so());
   
		    
   // Remember if we read tag or data
   dff_s #(1) tlb_rddf_ff(.din (fcl_itlb_data_rd_vld_bf),
		                  .q   (itlb_data_rd_f),
		                  .clk (clk), .se  (se), .si(), .so());

   dff_s #(1) tlb_rdds_ff(.din (itlb_data_rd_f),
		                  .q   (itlb_data_rd_s),
		                  .clk (clk), .se  (se), .si(), .so());

   // pick itlb ldxa data
   assign fcl_erb_itlbrd_data_s =  itlb_data_rd_s;

   // Demap thread
   assign fcl_fdp_dmpthr_l[0] = ~(~tlu_idtlb_dmp_thrid_g[1] & ~tlu_idtlb_dmp_thrid_g[0]);
   assign fcl_fdp_dmpthr_l[1] = ~(~tlu_idtlb_dmp_thrid_g[1] & tlu_idtlb_dmp_thrid_g[0]);
   assign fcl_fdp_dmpthr_l[2] = ~(tlu_idtlb_dmp_thrid_g[1] & ~tlu_idtlb_dmp_thrid_g[0]);
   assign fcl_fdp_dmpthr_l[3] = ~(tlu_idtlb_dmp_thrid_g[1] & tlu_idtlb_dmp_thrid_g[0]);

   // Select appropriate context for TLB
   // ctxt_sel_dmp is itlb_access_en without the asird signal
   assign ctxt_sel_dmp = no_instacc_bf & ~itlb_access_done;
   assign fcl_fdp_ctxt_sel_dmp_bf_l = ~ctxt_sel_dmp;   
   assign fcl_fdp_ctxt_sel_sw_bf_l = ctxt_sel_dmp | ~switch_bf;
   assign fcl_fdp_ctxt_sel_curr_bf_l = ctxt_sel_dmp | switch_bf;
   
   
//--------------------------
// Fetch Request and Stall
//--------------------------
   
   // Determine if we need can continue fetching next cycle
//   assign fetch_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq) &
//                   (switch_bf |
//                    ~(part_stall_thisthr_f | fdp_fcl_swc_s2));
//                    ~(stall_thisthr_f | fdp_fcl_swc_s2 | immu_fault_f));

   // mmckeown: Added stall due to execution drafting here
   wire esl_stallreq = config_dtu_esl_en & esl_fcl_stall_bf;
   // trin: add stall signal from jtag (debuggin)
   //  going to flop it so the input doesn't affect the logic timing
   //  and the stall signal doesn't have to be precise anyway

// trin
// always @ *
// begin
//    rtap_lsu_ctlbits_wr_en = 0;
//    if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_LSU_CONTROL_BITS)
//    begin
//       if (rtap_core_threadid == 2'd0)
//          rtap_lsu_ctlbits_wr_en = 4'b0001;
//       else if (rtap_core_threadid == 2'd1)
//          rtap_lsu_ctlbits_wr_en = 4'b0010;
//       else if (rtap_core_threadid == 2'd2)
//          rtap_lsu_ctlbits_wr_en = 4'b0100;
//       else if (rtap_core_threadid == 2'd3)
//          rtap_lsu_ctlbits_wr_en = 4'b1000;
//    end
//    rtap_lsu_ctlbits_data = rtap_core_data[13:0];
// end

   // reg rtap_core_stallreq_f;
   // always @ (posedge rclk)
   // begin
   //    if (!grst_l)
   //       rtap_core_stallreq_f <= 1'b0;
   //    else
   //       rtap_core_stallreq_f <= rtap_core_stallreq;
   // end
   // assign fetch_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & ~esl_stallreq & ~rtap_core_stallreq_f) &
   //                     (switch_bf |  // replace with ntr_s?
   //                      ~(part_stall_thisthr_f  
   //                        | fdp_fcl_swc_s2
   //                        )
   //                      );
   // assign fetch_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & ~esl_stallreq) &
   //                     (switch_bf |  // replace with ntr_s?
   //                      ~(part_stall_thisthr_f  
   //                        | fdp_fcl_swc_s2
   //                        )
   //                      );
   // trin note: thankfully this signal is flopped so long latency of
   // other signals doesn't affect it too much

   reg jtag_breakpoint_stall_en;
   wire jtag_breakpoint_stall;

   always @ (posedge clk)
   begin
      if (!fcl_reset_l)
      begin
         jtag_breakpoint_stall_en <= 1'b0;
      end
      else
      begin
         if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_BREAKPOINT_PC)
            jtag_breakpoint_stall_en <= 1'b1;
      end
   end


   assign jtag_breakpoint_stall = fdp_fcl_jtag_breakpoint_hit & jtag_breakpoint_stall_en;

   assign fetch_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & ~esl_stallreq & ~jtag_breakpoint_stall) &
                       (switch_bf |  // replace with ntr_s?
                        ~(part_stall_thisthr_f  
                          | fdp_fcl_swc_s2
                          )
                        );

   // dtu_fcl_running_s should be a part of this eqn, since it is assumed
   // by the ifill completion prediction logic in the swl
//   assign inst_access_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & 
//                            (switch_bf & ~usen_iso_bf |
//                             ~switch_bf & ~ely_stall_thisthr_f &
//                             dtu_fcl_running_s & 
//                             ~ely_kill_thread_s2 &
//                             //~fdp_fcl_swc_s2 & // take out for tim reasons
//                             ~usep_bf));

   assign ia0_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & 
                    (switch_bf |
                     ~ely_stall_thisthr_f &
                     dtu_fcl_running_s & 
                     ~ely_kill_thread_s2 &
                     ~usep_bf));

   assign ia1_bf = (~all_stallreq & ~fcl_reset & ~rst_stallreq & 
                    (~switch_bf & ~ely_stall_thisthr_f &
                     dtu_fcl_running_s & 
                     ~ely_kill_thread_s2 &
                     ~usep_bf));
   

   assign inst_access_bf = usen_iso_bf ? ia1_bf : ia0_bf;
   // needs to work even if usen_iso_bf is X - not nec. 11/06/03
//   dp_mux2es #(1) ia_mx(.dout (inst_access_bf),
//                        .in0  (ia0_bf),
//                        .in1  (ia1_bf),
//                        .sel  (usen_iso_bf));
   
   

//   assign allow_ifq_access_icd_bf = (all_stallreq | rs
//                                     ~switch_bf & 
//                                     (usep_bf | stall_f) |
//                                     switch_bf & usen_bf);
   assign allow_ifq_access_icd_bf = ~inst_access_bf;
   
   // earlier version for critical stuff
   assign no_instacc_bf = all_stallreq | fcl_reset | rst_stallreq |
                          ~dtu_fcl_ntr_s & (ely_stall_thisthr_f | usep_bf);
   
   // check if icache is on
   dff_s #(4) ic_en_reg(.din (lsu_ifu_icache_en),
                      .q   (icache_en_d1),
                      .clk (clk), .se(se), .si(), .so());
   
//   assign sw_icache_on = (nextthr_bf_buf[0] & icache_en_d1[0] |
//                          nextthr_bf_buf[1] & icache_en_d1[1] |
//                          nextthr_bf_buf[2] & icache_en_d1[2] |
//                          nextthr_bf_buf[3] & icache_en_d1[3]);
//   assign this_icache_on = (thr_f[0] & icache_en_d1[0] |
//                            thr_f[1] & icache_en_d1[1] |
//                            thr_f[2] & icache_en_d1[2] |
//                            thr_f[3] & icache_en_d1[3]);
//   assign icache_on_bf = switch_bf ? sw_icache_on : this_icache_on;

   assign icache_on_bf = (nextthr_final_bf[0] & icache_en_d1[0] |
                          nextthr_final_bf[1] & icache_en_d1[1] |
                          nextthr_final_bf[2] & icache_en_d1[2] |
                          nextthr_final_bf[3] & icache_en_d1[3]);

   // remember if icache was turned on
   dff_s #(1) icef_ff(.din (icache_on_bf),
		              .q   (icache_on_f),
		              .clk (clk), .se(se), .si(), .so());
   dff_s #(1) ices_ff(.din (icache_on_f),
		              .q   (icache_on_s1),
		              .clk (clk), .se(se), .si(), .so());

   // check if cp is set
   assign uncached_page_s1 = ~itlb_fcl_cp_s1 & cam_vld_s1;
   assign fcl_ifq_icache_en_s_l = ~icache_on_s1 | uncached_page_s1;
   
   // Read from the icache only if 
   //   we need to fetch AND 
   //   the icache is on AND 
   //   we are not using the NIR 
   assign rdreq_bf = icache_on_bf & inst_access_bf;

   assign fcl_icd_rdreq_bf = rdreq_bf | ifq_fcl_rdreq_bf;

   // split off driver to icv to reduce load
   assign fcl_icv_rdreq_bf = rdreq_bf | ifq_fcl_rdreq_bf;
   
   // Read req pipe
   dffr_s #(1)  rdreq_ff(.din  (rdreq_bf),
		                 .clk  (clk),
		                 .rst  (fcl_reset),
		                 .q    (rdreq_f),
		                 .se   (se), .si(), .so());
   // Remember if we fetched in the last cycle
   dff_s #(1)  rdreqs1_ff (.din  (rdreq_f),
		                   .clk  (clk),
		                   .q    (rdreq_s1),
		                   .se   (se), .si(), .so());
   assign fcl_ifq_rdreq_s1 = ~stall_s1;

   // Use NIR pipe
   assign usenir_bf = switch_bf ? usen_bf : usep_bf;
   
   dffr_s #(1)  unf_ff(.din  (usenir_bf),
		                 .clk  (clk),
		                 .rst  (fcl_reset),
		                 .q    (usenir_f),
		                 .se   (se), .si(), .so());
   // Remember if we fetched in the last cycle
   dff_s #(1)  uns1_ff (.din  (usenir_f),
		                  .clk  (clk),
		                  .q    (usenir_s1),
		                  .se   (se), .si(), .so());


   // Write signal to icache if no access from pipe
   assign ic_wrreq_bf = allow_ifq_access_icd_bf & ifq_fcl_wrreq_bf;

   assign fcl_icd_wrreq_bf = ic_wrreq_bf | ifq_fcl_icd_wrreq_bf;
   assign fcl_ict_wrreq_bf = ic_wrreq_bf | ifq_fcl_ictv_wrreq_bf;
   assign fcl_icv_wrreq_bf = ic_wrreq_bf | ifq_fcl_ictv_wrreq_bf |
                             ifq_fcl_invreq_bf;

   // synopsys translate_off
   always @ (posedge clk)
   begin
	    if (fcl_icd_rdreq_bf & fcl_icd_wrreq_bf)
	      begin
		 // 0in <fire -message "ERROR: sparc_ifu_fcl: rd and wr req to I$ at the same time"
`ifdef DEFINE_0IN
`else           
			 $display( "CACHE_CONTENTION", "ERROR: sparc_ifu_fcl: rd and wr req to I$ at the same time");
             $finish();
`endif
	      end
   end
   // synopsys translate_on
   

   //-------------------------
   // Valid Instruction Pipe
   //-------------------------
   // F stage
   assign inst_vld_bf = fetch_bf;
   dff_s #(1) inst_vld_ff(.din (inst_vld_bf),
		                  .clk (clk),
		                  .q   (inst_vld_f),
		                  .se  (se), .si(), .so());

   assign stall_f = ~inst_vld_f | kill_curr_f;
   assign stall_thisthr_f = stall_f | imsto_thisthr_s1 | // intrto_thisthr_d |
	                          kill_thread_s2 | rb_stg_s | ~dtu_fcl_running_s | 
                            iferrto_thisthr_d1;

   // mmckeown: stall signal ignoring whether there is a valid instruction in F
   wire stall_ed_s2 = kill_curr_f | imsto_thisthr_s1 | kill_thread_s2 |
                      rb_stg_s | ~dtu_fcl_running_s | iferrto_thisthr_d1;

   assign part_stall_thisthr_f = stall_f | 
                                 imsto_thisthr_s1 |
                                 ~dtu_fcl_running_s | 
                                 ely_kill_thread_s2 |
	                               rb_stg_s;
   
   assign ely_stall_thisthr_f = stall_f | rb_stg_s;
   
   // mmckeown: pipe forward next thread ready in s stage to determine
   //           if thread is ready for ED in S2
   dff_s #(1) inst_vld_s2_ed_f (.din (esl_fcl_force_running_s),
                              .clk (clk),
                              .q (inst_vld_s2_ed),
                              .se (se), .si (), .so ());   

//   assign stall_s1_nxt = stall_thisthr_f | intr_vld_s | tmsto_thisthr_f;
   assign stall_s1_nxt = stall_thisthr_f; //| intr_vld_s;
   
   // S1 stage
   dff_s #(1) stalld_ff(.din (stall_s1_nxt),
		                  .clk (clk),
		                  .q   (stall_s1),
		                  .se  (se), .si(), .so());

   assign inst_vld_s1 = ~stall_s1 & ~ic_miss_s1 & ~kill_curr_d;
   assign val_thr_s1 = thr_s1 & {4{inst_vld_s1}}; // 4b

   // S2 stage
   assign val_thr_f = thr_f & {4{~stall_f & ~rb_stg_s & dtu_fcl_running_s}};
   // mmckeown: Need to add this signal to kill instructions in TIRs when
   //           converged so that they don't get executed when we fall
   //           out of being converged
   wire [3:0] val_thr_s2_ed = thr_f & {4{config_dtu_esl_en & esl_fdp_issue_prev_inst_s}};

   // Tag the S stage thr inst register as containing a valid inst or not
   assign tinst_vld_nxt = (ifq_fcl_fill_thr |  
                           (rb_w2 & ~rb_for_iferr_e) | // set
                                 // mmckeown: This will invalidate
                                 // instructions when drafting
			                     val_thr_s1 & ~(val_thr_f | val_thr_s2_ed) |
                           //			   val_thr_s1 |
			                     tinst_vld_s & ~(val_thr_f | val_thr_s2_ed)) &
			                      ~(clear_s_d1 |
                              {4{erb_dtu_ifeterr_d1 & inst_vld_d1 & 
                                 ~rb_stg_e}} & thr_e);   // reset

   dffr_s #(4) tinst_reg(.din  (tinst_vld_nxt),
		                 .clk  (clk),
		                 .rst  (fcl_reset),
		                 .q    (tinst_vld_s),
		                 .se   (se), .si(), .so());
   assign fcl_esl_tinst_vld_next_s = tinst_vld_nxt;

   // Does current thread have valid inst in s2
   // mmckeown: Valid instruction is s2 if we are drafting. This would
   //           not be high when we are drafting otherwise
   assign inst_vld_s2 = ((thr_f_crit & (tinst_vld_s | val_thr_s2_ed)) == 4'b0000) ?
			                    {1'b0} :  {1'b1};          

   assign inst_vld_s = ~switch_s2 & inst_vld_s1 | 
	                      switch_s2 & inst_vld_s2;
   // mmckeown: For instruction in S to be valid, we should have said
   //           so from execution drafting logic
   assign inst_vld_s_crit = ~switch_s2 & ~stall_s1 & ~kill_curr_d | 
	                      switch_s2 & inst_vld_s2;

   assign valid_s = inst_vld_s & ~stall_f &  // f and s2 have same thread
                       dtu_fcl_running_s &
	                     ~(ely_kill_thread_s2 | rb_stg_s);

   // mmckeown: S2 needs to be running if we are replaying something
   //           when converged
   // BUG FIX: Instruction in D needs to be valid when a immu fault (page
   // fault) occurs, so we have to add immu_fault_f into this signal
   assign running_s2 = (inst_vld_s & ~stall_thisthr_f) || 
                       (config_dtu_esl_en && (inst_vld_s2_ed || immu_fault_f) && ~stall_ed_s2);
   
   // D stage
   dff_s #(1) rund_ff(.din (running_s2),
		              .clk (clk),
		              .q   (inst_vld_d),
		              .se  (se), .si(), .so());
   dff_s #(1) eivd_ff(.din (running_s2),
		                .clk (clk),
		                .q   (inst_vld_d_crit),
		                .se  (se), .si(), .so());
   assign fcl_erb_inst_issue_d = inst_vld_d & ~intr_vld_d;
   assign running_d = inst_vld_d & ~kill_thread_d & ~rb_stg_d & 
	                    ~intr_vld_d;
   assign fcl_esl_inst_vld_d = running_d;

   // E stage
   dff_s #(1) rune_ff(.din (running_d),
		              .clk (clk),
		              .q   (inst_vld_e),
		              .se  (se), .si(), .so());

   assign running_e = inst_vld_e & ~dtu_inst_anull_e & 
	                    ~kill_curr_e & ~rb_stg_e &
                      ~(thr_match_em & ifu_tlu_flush_m);
   assign fcl_esl_inst_vld_e = running_e;                   
   assign inst_vld_qual_e = inst_vld_e & ~rb_stg_e;
   assign val_thr_e = thr_e_v2 & {4{inst_vld_qual_e}} & ~late_flush_w2 &
                      ~(thr_w & {4{utrap_flush_w}});
   
   
   // M stage
   dff_s #(1) runm_ff(.din (running_e),
		              .clk (clk),
		              .q   (inst_vld_m),
		              .se  (se), .si(), .so());
   assign running_m = (inst_vld_m | intr_vld_m) & ~kill_thread_m;
   assign fcl_esl_inst_vld_m = running_m;
   
   assign ifu_tlu_inst_vld_m = (inst_vld_m | intr_vld_m) & ~kill_curr_m;
   // less critical
   // assign ifu_lsu_inst_vld_m = ifu_tlu_inst_vld_m;
   
   // W stage
   dff_s #(1) runw_ff(.din (running_m),
		              .q   (inst_vld_w),
		              .clk (clk), .se  (se), .si(), .so());   

   dff_s #(1) iw_ff(.din (running_m),
		              .q   (inst_vld_w_crit),
		              .clk (clk), .se  (se), .si(), .so());   
   
   // synopsys translate_off
//   wire         sas_m,
//		            inst_done_w_for_sas;
   
//   assign sas_m = inst_vld_m & ~kill_thread_m & 
//	                ~(exu_ifu_ecc_ce_m & inst_vld_m & ~trap_m);

//   dff #(1) sasw_ff(.din (sas_m),
//		              .clk (clk),
//		              .q   (inst_done_w_for_sas),
//		              .se  (se), .si(), .so());   
   // synopsys translate_on

   // need to kill branch by E stage, so qual with rb_stg_X
   assign fcl_dtu_inst_vld_e = inst_vld_e & ~rb_stg_e & ~kill_curr_e;
   assign fcl_dtu_intr_vld_e = intr_vld_e & ~rb_stg_e & ~kill_curr_e;
   assign fcl_dtu_inst_vld_d = inst_vld_d & ~kill_curr_d &
	                             ~rb_stg_d_crit & ~immu_miss_crit_d;
   assign fcl_dtu_ely_inst_vld_d = inst_vld_d_crit;
   assign ifu_tlu_inst_vld_w = inst_vld_w;
   assign ifu_exu_inst_vld_w = inst_vld_w_crit;
   assign ifu_spu_inst_vld_w = inst_vld_w;
   assign ifu_exu_inst_vld_e = fcl_dtu_inst_vld_e;
   
   assign flush_sonly_qual_e = dtu_fcl_flush_sonly_e & inst_vld_e &
//                               ~dec_fcl_kill4sta_e &
                               ~rb_stg_e & ~dtu_inst_anull_e & ~kill_curr_e;
   

   dff_s #(1) flshm_ff(.din (flush_sonly_qual_e),
                     .q   (flush_sonly_m),
                     .clk (clk),
                     .se  (se), .si(), .so());

   dff_s #(1) imflshm_ff(.din (ifq_fcl_flush_sonly_e),
                       .q   (ims_flush_sonly_m),
                       .clk (clk),
                       .se  (se), .si(), .so());
   // detect collision between two different types of retractions
   assign ims_flush_coll_m = ims_flush_sonly_m & ~canthr_sm & 
                             retract_iferr_e;
   dff_s #(1) imflshw_ff(.din (ims_flush_coll_m),
                       .q   (ims_flush_sonly_w),
                       .clk (clk),
                       .se  (se), .si(), .so());
   assign ims_flush_coll_w = ims_flush_sonly_w & ~canthr_sw;
   assign flush_sonly_qual_m = (ims_flush_sonly_m & ~canthr_sm & 
                                ~retract_iferr_e |
                                flush_sonly_m & inst_vld_m & ~kill_local_m &
                                ~kill_curr_m);
   assign flush_sonly_all_m = (ims_flush_sonly_m & ~canthr_sm | 
                               flush_sonly_m & inst_vld_m);

//   assign flush_sonly_qual_m = flush_sonly_m & ~canthr_sm;
//   assign qtrap_flush_e = dtu_fcl_qtrap_e & inst_vld_e & ~dtu_inst_anull_e & 
//	                  ~rb_stg_e;
   
//------------------------------   
// Instruction Kill Logic
//------------------------------
   
   // kill_s2 is the same as kill_f
   assign kill_thread_s2 = thr_match_fw & rb_stg_w |
//	                         thr_match_ft & trappc_vld_w2 |
	                         thr_match_fm & (flush_sonly_all_m) |
                           kill_curr_f;
   
   assign ely_kill_thread_s2 = thr_match_fw & utrap_flush_w |
//	                             thr_match_ft & trappc_vld_w2 |
	                             thr_match_fm & (flush_sonly_all_m) |
                               kill_curr_f;
   
   assign kill_thread_d = thr_match_dw & rb_stg_w |
	                        thr_match_dm & (flush_sonly_all_m) |
                          kill_curr_d;

   // M and E still need full qualification with flush pipe   
//   assign kill_thread_e = thr_match_ew & utrap_flush_w | 
//                          thr_match_ew & tlu_ifu_flush_pipe_w | 
//                          kill_curr_e ;
   assign ely_kill_thread_m = thr_match_mw & utrap_flush_w |
//                              mark4rb_m |
                              kill_curr_m;
   assign kill_thread_m = ely_kill_thread_m | 
                          thr_match_mw & tlu_ifu_flush_pipe_w;
   
   assign kill_local_m = thr_match_mw & (utrap_flush_w | intr_vld_w);

   assign flush_pipe_w = rb_stg_w | tlu_ifu_flush_pipe_w;
//   assign part_flush_w = ifu_tlu_flush_w | tlu_ifu_flush_pipe_w;
//   assign kill_nextthr_w = thr_match_nw & flush_pipe_w;
   assign flush_thr_w = thr_w & {4{flush_pipe_w}};
   dff_s #(1) fp_ff(.din (flush_pipe_w),
                  .q   (flush_pipe_w2),
                  .clk (clk), .se(se), .si(), .so());

//   assign clear_s_stage =  thr_e & {4{flush_sonly_qual_e}};
//   assign clear_s_stage =  trap_thr & {4{trappc_vld_w2}} |
//	                         {4{dummy_flush_ireg}} | 
//	                         thr_e & {4{flush_sonly_qual_e}};
                           //  | flush_thr_w 

   assign canthr_f = thr_e & {4{flush_sonly_qual_e}} | 
                     (rb_w2 & ~rb_for_iferr_e) | rb_froms;

//   dff #(4) cls_reg(.din (clear_s_stage),
//		                .q   (clear_s_early),
//		                .clk (clk), .se(se), .si(), .so());

   // ***NOTE***
   // Don't use clear_s_d1 to generate fcl_ifq_canthr, since clear_s_d1 
   // includes ifeterr!
   // first term could be just flush_sonly_m & inst_vld_m & thr_m
   assign clear_s_d1 = thr_m & {4{flush_sonly_all_m}} |
                       late_flush_w2 | 
                       trap_thr & {4{trappc_vld_w2}};

   assign fcl_erb_clear_iferr = thr_m & {4{ims_flush_sonly_m | 
                                           flush_sonly_m}} |
                                late_flush_w2 | 
                                trap_thr & {4{trappc_vld_w2}};


   dff_s #(4) cm_reg(.din (canthr_f),
		               .q   (canthr_s_early),
		               .clk (clk),
		               .se  (se), .si(), .so());

   assign canthr_s = canthr_s_early | late_flush_w2 | 
                     trap_thr & {4{trappc_vld_w2}};          
   
//   assign fcl_ifq_canthr = clear_s_stage | rb_w2 | rb_froms | 
//	                         canthr_s;
   assign fcl_ifq_canthr = canthr_s;

   assign canthr_sm = (canthr_s[0] & thr_m[0] | 
                       canthr_s[1] & thr_m[1] | 
                       canthr_s[2] & thr_m[2] | 
                       canthr_s[3] & thr_m[3]);

   assign canthr_sw = (canthr_s[0] & thr_w[0] | 
                       canthr_s[1] & thr_w[1] | 
                       canthr_s[2] & thr_w[2] | 
                       canthr_s[3] & thr_w[3]);

   assign canthr_sd = (canthr_s[0] & thr_d[0] | 
                       canthr_s[1] & thr_d[1] | 
                       canthr_s[2] & thr_d[2] | 
                       canthr_s[3] & thr_d[3]) |
                        thr_match_dw & utrap_flush_w;

   dff_s #(4) fpw2_reg(.din (flush_thr_w),
                     .q   (late_flush_w2),
                     .clk (clk), .se(se), .si(), .so());

//   assign late_flush_w2 = thr_w2 & {4{flush_pipe_w2}};
   
   assign kill_curr_f = (thr_f_crit[0] & late_flush_w2[0] |
                         thr_f_crit[1] & late_flush_w2[1] |
                         thr_f_crit[2] & late_flush_w2[2] |
                         thr_f_crit[3] & late_flush_w2[3]);
   assign kill_curr_d = (thr_d[0] & late_flush_w2[0] |
                         thr_d[1] & late_flush_w2[1] |
                         thr_d[2] & late_flush_w2[2] |
                         thr_d[3] & late_flush_w2[3]);
   assign kill_curr_e = (thr_e_v2[0] & late_flush_w2[0] |
                         thr_e_v2[1] & late_flush_w2[1] |
                         thr_e_v2[2] & late_flush_w2[2] |
                         thr_e_v2[3] & late_flush_w2[3]) |
                          thr_match_ew & utrap_flush_w;
   
//   assign kill_curr_m = (thr_m[0] & late_flush_w2[0] |
//                         thr_m[1] & late_flush_w2[1] |
//                         thr_m[2] & late_flush_w2[2] |
//                         thr_m[3] & late_flush_w2[3]);
   assign kill_curr_m = same_thr_mw2 & flush_pipe_w2;
   
   //------------------------------
   // track I$ misses
   //------------------------------
   
   // force a miss if a fetch and icache is off
   // forcemiss triggers a fill vld_grequest to L2, so set to zero by default
   assign forcemiss_f = inst_vld_f & ~icache_on_f;
   dffr_s #(1)  miss_ff(.din (forcemiss_f),
		                  .clk (clk),
		                  .rst (fcl_reset),
		                  .q   (forcemiss_s1),
		                  .se  (se), .si(), .so());

   //ooooooooooooooooooooooooooooooooooooooooooooooooooooooo
   // removed imiss_s_l from this signal for timing fix  
   // Perf Hit: 0.2% TPCC, 0.4% JBB
//   assign ic_miss_sw_s1 = (~itlb_fcl_imiss_s_l & rdreq_s1 |
//                             tlb_cam_miss_s1 | 
//                             forcemiss_s1);
//   assign ic_miss_sw_s1 =   tlb_cam_miss_s1 | 
//                            forcemiss_s1;
   //ooooooooooooooooooooooooooooooooooooooooooooooooooooooo
   
   assign ic_miss_s1 =  (~itlb_fcl_imiss_s_l & rdreq_s1 |
			                   forcemiss_s1) & 
                        ~stall_s1 & ~tlbmiss_s1_crit & ~pc_oor_s1 & 
                        ~rb_stg_d_crit & ~canthr_sd;

   assign icmiss_for_perf =  (~itlb_fcl_imiss_s_l & rdreq_s1) & 
                        ~stall_s1 & ~tlbmiss_s1_crit & ~pc_oor_s1 & 
                        ~rb_stg_d & ~canthr_sd;

//   assign fcl_ifq_icmiss_s1 = ic_miss_s1 & ~ely_kill_thread_d;  // use buffer
   assign fcl_ifq_icmiss_s1 = ic_miss_s1;  // use buffer   

   // for perf counters (d1=e)
   dff_s #(1) icmd1_ff(.din (icmiss_for_perf),
                     .q   (ifu_tlu_icmiss_e),
                     .clk (clk), .se(se), .si(), .so());
   
   // I$ miss is always to thr_s1.  Below we check to see if this is
   // the same as thr_f (=thr_s2) which is the "current thread"
//   assign imsto_thisthr_s1 = thr_match_fd & ic_miss_s1;
//   assign imsto_nextthr_s1 = thr_match_nd & (ic_miss_s1 | tlbmiss_s1);

   assign imsto_thisthr_s1 = thr_match_fd & ic_miss_s1;
//   assign imsto_nextthr_s1 = thr_match_nd & (ic_miss_sw_s1);
//   assign intrto_thisthr_d = thr_match_fd & fcl_dtu_sync_intr_d;

   assign iferrto_thisthr_d1 = thr_match_fe & erb_dtu_ifeterr_d1 & 
                               inst_vld_d1;
   

//------------------------------
// track itlb misses
//------------------------------

   // default to hit when camming is turned off
   assign tlb_cam_miss_f = ~itlb_fcl_tlbmiss_f_l & cam_vld_f;
   dff_s #(1) tlbmsf_ff(.din (tlb_cam_miss_f),
		                  .clk (clk),
		                  .q   (tlb_cam_miss_s1),
		                  .se  (se), .si(), .so());
   
   // mmckeown: Need to draft the tlbmiss bit as well
   // when we repeat instruction for follower thread
   wire [3:0] tlbmiss_s2_bf_exec_draft;

   // tlb miss logic
   // va hole has higher priority than immu miss
   assign tlbmiss_s2_bf_exec_draft = (({4{tlbmiss_s1 & ~pc_oor_s1 & ~rb_stg_d}} & thr_s1) |
			                  ({4{erb_fcl_itlb_ce_d1 & inst_vld_d1 & 
                            ~rb_stg_e}} & thr_e &
			                   (~thr_d | {4{~inst_vld_d | ~thr_match_de}})) |
			                  ({4{immu_miss_e}} & rb_frome) |
			                  ({4{immu_miss_d}} & rb_fromd & ~rb_frome) |  // set
			                  tlbmiss_d & (~thr_d | {4{~inst_vld_d}}) & ~rb_w2) & 
			                 ~(clear_s_d1); // reset

   // always pass through thread 0
   assign tlbmiss_s2[0] = tlbmiss_s2_bf_exec_draft[0];

   // need to draft the tlbmiss bit in case thread0 had a tlb miss
   wire exec_draft_replay_tlbmiss_mux_sel = config_dtu_esl_en ? esl_fdp_issue_prev_inst_s : 1'b0;
   dp_mux2es  #(3)  exec_draft_replay_tlbmiss_mux (.dout (tlbmiss_s2[3:1]),
                                                   .in0 (tlbmiss_s2_bf_exec_draft[3:1]),
                                                   .in1 ({3{immu_miss_d}} & thr_f[3:1]),
                                                   .sel(exec_draft_replay_tlbmiss_mux_sel));

//   assign tlbmiss_s2 = (({4{tlbmiss_s1 & ~pc_oor_s1 & ~rb_stg_d}} & thr_s1) |
//			({4{erb_fcl_itlb_ce_d1 & inst_vld_qual_d1}} & thr_e |
//			 tlbmiss_d & (~thr_e | {4{~inst_vld_qual_e}}) & 
//			 ~rb_w2) & ~(clear_s_stage); // reset

   dffr_s #(4) tlbmiss_reg(.din (tlbmiss_s2),
		                     .q   (tlbmiss_d),
		                     .clk (clk),
		                     .rst (fcl_reset),
		                     .se  (se), .si(), .so());

   assign immu_fault_f = (thr_f_crit[0] & (tlbmiss_d[0] | inst_acc_vec_d[0]) |
			                    thr_f_crit[1] & (tlbmiss_d[1] | inst_acc_vec_d[1]) |
			                    thr_f_crit[2] & (tlbmiss_d[2] | inst_acc_vec_d[2]) |
			                    thr_f_crit[3] & (tlbmiss_d[3] | inst_acc_vec_d[3])) &
                           switch_s2|  
			                     // D stage miss
			                     (tlbmiss_s1 | pc_oor_s1) & thr_match_fs1;
	                         // S stage miss

   assign immu_miss_crit_d = (thr_d[0] & tlbmiss_d[0] |
			                        thr_d[1] & tlbmiss_d[1] |
			                        thr_d[2] & tlbmiss_d[2] |
			                        thr_d[3] & tlbmiss_d[3]);
   
   // TBD: move this to the E stage, post RB
   assign immu_miss_d = immu_miss_crit_d & inst_vld_d | 
			                  thr_match_de & erb_fcl_itlb_ce_d1 & inst_vld_d1;

   // don't need to do this, once everyone switches to immu_miss_m
   assign immu_miss_qual_d = immu_miss_d & ~kill_thread_d &
	                            ~(immu_miss_e & thr_match_de & 
                                inst_vld_e & ~dtu_inst_anull_e & ~rb_stg_e &
                                ~kill_curr_e);
   
   dff_s immu_misse_ff(.din (immu_miss_qual_d),
		                 .clk (clk),
		                 .q   (immu_miss_e),
		                 .se  (se), .si(), .so());

   
   // flop this and send in M
//   assign ifu_tlu_immu_miss_e = immu_miss_e & ~addr_real_e & 
//                                inst_vld_e & ~dtu_inst_anull_e & ~rb_stg_e;
//   assign ifu_tlu_immu_miss_e = 1'b0;
   
//   assign immu_miss_qual_e = immu_miss_e & //~addr_real_e & 
// //                             ~(immu_miss_m & thr_match_em) &
//                             inst_vld_e & ~dtu_inst_anull_e & ~rb_stg_e;

//   dff #(1) immu_msm_ff(.din (immu_miss_qual_e),
   dff_s #(1) immu_msm_ff(.din (immu_miss_e),
                        .q   (immu_miss_m),
                        .clk (clk), .se(se), .si(), .so());

   assign ifu_tlu_immu_miss_m = immu_miss_m & inst_vld_m & ~kill_curr_m;

   assign addr_real_e = (itlb_addr_real[0] & thr_e[0] |
                         itlb_addr_real[1] & thr_e[1] |
                         itlb_addr_real[2] & thr_e[2] |
                         itlb_addr_real[3] & thr_e[3]);

   // store tlbmiss state for NIR
   assign nir_tlbmiss_next = ({4{tlb_cam_miss_s1 & ~stall_s1}} & thr_s1 |
			                        nir_tlbmiss_vec & (~thr_s1 | {4{stall_s1}}));

   dffr_s #(4) nirtlbm_reg(.din (nir_tlbmiss_next),
		                   .clk (clk),
		                   .q   (nir_tlbmiss_vec),
		                   .rst (fcl_reset),
		                   .se  (se), .si(), .so());

   assign nir_tlbmiss_s1 = (nir_tlbmiss_vec[0] & thr_s1[0] |
			                      nir_tlbmiss_vec[1] & thr_s1[1] |
			                      nir_tlbmiss_vec[2] & thr_s1[2] |
			                      nir_tlbmiss_vec[3] & thr_s1[3]);

   assign tlbmiss_s1_crit = ~usenir_s1 ? tlb_cam_miss_s1 :
	                                       nir_tlbmiss_s1;

   assign tlbmiss_s1 = tlbmiss_s1_crit & ~stall_s1;
   
   assign fcl_fdp_tlbmiss_s1 = tlbmiss_s1;

//---------------------------------
//  Privilege Mode and VA Hole
//---------------------------------
   assign addr_mask_32b_m = (thr_m[0] & pstate_am_d1[0] |
			                       thr_m[1] & pstate_am_d1[1] |
			                       thr_m[2] & pstate_am_d1[2] |
			                       thr_m[3] & pstate_am_d1[3]);
   
   assign fcl_fdp_mask32b_f = (thr_f[0] & pstate_am_d1[0] |
			                         thr_f[1] & pstate_am_d1[1] |
			                         thr_f[2] & pstate_am_d1[2] |
			                         thr_f[3] & pstate_am_d1[3]);

   dff_s #(1) amd_ff(.din (fcl_fdp_mask32b_f),
		               .q   (fcl_fdp_addr_mask_d),
		               .clk (clk), .se(se), .si(), .so());

   // keep track of whether pc is outside va hole
   assign set_oor_m = exu_ifu_va_oor_m & brtaken_m & ~addr_mask_32b_m;
   assign fcl_fdp_pcoor_vec_f = fdp_fcl_pc_oor_vec_f | {4{set_oor_m}} & thr_m;
   
   assign fcl_fdp_pcoor_f =  (thr_f[0] & fcl_fdp_pcoor_vec_f[0] |
			                        thr_f[1] & fcl_fdp_pcoor_vec_f[1] |
			                        thr_f[2] & fcl_fdp_pcoor_vec_f[2] |
			                        thr_f[3] & fcl_fdp_pcoor_vec_f[3]);
   
   assign pc_oor_f = fcl_fdp_pcoor_f  & ~part_stall_thisthr_f;
   dff_s oors1_ff(.din (pc_oor_f),
		            .q   (pc_oor_s1),
		            .clk (clk), .se(se), .si(), .so());

   // track privilege mode of current page
   assign priv_mode_f = (thr_f[0] & tlu_lsu_pstate_priv[0] |
			                   thr_f[1] & tlu_lsu_pstate_priv[1] |
			                   thr_f[2] & tlu_lsu_pstate_priv[2] |
			                   thr_f[3] & tlu_lsu_pstate_priv[3]);

   dff_s #(1) priv_ff(.din (priv_mode_f),
                    .q   (priv_mode_s1),
                    .clk (clk), .se(se), .si(), .so());
   
   // s1 and d are the same thread
   assign fcl_dtu_privmode_d = priv_mode_s1;

   // hyper privilege
   assign hpriv_mode_f = (thr_f[0] & tlu_hpstate_priv[0] |
			                    thr_f[1] & tlu_hpstate_priv[1] |
			                    thr_f[2] & tlu_hpstate_priv[2] |
			                    thr_f[3] & tlu_hpstate_priv[3]);

   assign hpriv_mode_w = (thr_w[0] & tlu_hpstate_priv[0] |
			                    thr_w[1] & tlu_hpstate_priv[1] |
			                    thr_w[2] & tlu_hpstate_priv[2] |
			                    thr_w[3] & tlu_hpstate_priv[3]);
   
   dff_s #(1) hprivd_ff(.din (hpriv_mode_f),
                     .q   (hpriv_mode_s1),
                     .clk (clk), .se(se), .si(), .so());

   assign fcl_dtu_hprivmode_d = hpriv_mode_s1;

   dff_s #(1) hprivw2_ff(.din (hpriv_mode_w),
                     .q   (hpriv_mode_w2),
                     .clk (clk), .se(se), .si(), .so());
   assign fcl_dtu_hprivmode_w2 = hpriv_mode_w2;

   // determine if priv page has been accessed in non priv mode
   // or if we have fallen into the VA hole
   assign inst_acc_exc_s1 = (priv_inst_s1 & ~(priv_mode_s1 | hpriv_mode_s1) & 
			                       ~tlbmiss_s1_crit & cam_vld_s1 | 
			                       pc_oor_s1) & ~stall_s1 & ~rb_stg_d;
   assign pc_oor_s2 = (thr_f[0] & inst_acc_vec_d[0] |
                       thr_f[1] & inst_acc_vec_d[1] |
                       thr_f[2] & inst_acc_vec_d[2] |
                       thr_f[3] & inst_acc_vec_d[3]);
   assign pc_oor_s = (tm_fd_l) ? pc_oor_s2 : pc_oor_s1;
      
   assign inst_acc_vec_s2 = (({4{inst_acc_exc_s1}} & thr_s1) |
			                       ({4{inst_acc_exc_e}} & rb_frome) |
			                       ({4{inst_acc_exc_d}} & rb_fromd & ~rb_frome) |
	                           inst_acc_vec_d & (~thr_d | {4{~inst_vld_d}}) & 
			                       ~rb_w2) &
			                        ~(clear_s_d1);
	 
   dffr_s #(4) instaccd_reg(.din (inst_acc_vec_s2),
			                  .q   (inst_acc_vec_d),
			                  .rst (fcl_reset),
			                  .clk (clk), .se (se), .si(), .so());

   assign inst_acc_exc_d = (thr_d[0] & inst_acc_vec_d[0] |
			                      thr_d[1] & inst_acc_vec_d[1] |
			                      thr_d[2] & inst_acc_vec_d[2] |
			                      thr_d[3] & inst_acc_vec_d[3]);

   dff_s #(1) instacce_ff(.din (inst_acc_exc_d),
		                  .q   (inst_acc_exc_e),
		                  .clk (clk), .se(se), .si(), .so());

   // TLU needs to know if this is a priv violtn
   assign priv_violtn_e = inst_acc_exc_e & ~fdp_fcl_pc_oor_e;
   dff_s #(1) privm_ff(.din (priv_violtn_e),
		               .q   (priv_violtn_m),
		               .clk (clk),  .se  (se), .si(), .so());

   assign ifu_tlu_priv_violtn_m = priv_violtn_m & inst_vld_m & ~kill_curr_m;
   
   // NIR privilege bit
   assign next_nir_privvec = {4{itlb_fcl_priv_s1 & ~stall_s1 & 
                                cam_vld_s1}} & thr_s1 |
	                           nir_privvec & (~thr_s1 | {4{stall_s1}});

   dffr_s #(4) nir_priv_reg(.din (next_nir_privvec),
			                  .q   (nir_privvec),
			                  .rst (fcl_reset),
			                  .clk (clk), .se(se), .si(), .so());
   
   assign nir_priv_s1 = (nir_privvec[0] & thr_s1[0] |
			                   nir_privvec[1] & thr_s1[1] |
			                   nir_privvec[2] & thr_s1[2] |
			                   nir_privvec[3] & thr_s1[3]);
   
   assign priv_inst_s1 = ~usenir_s1 ? (itlb_fcl_priv_s1 & cam_vld_s1) : 
                                        nir_priv_s1;

//-------------------------
// Errors
//-------------------------

   // decide when the errors are valid
   assign running_s1 = ~stall_s1 & ~kill_thread_d & ~rb_stg_d & ~pc_oor_s1 &
	                     ~tlb_cam_miss_s1 & ~retract_inst_d;
//   assign ely_running_s1 = ~stall_s1 & ~rb_stg_d & ~pc_oor_s1 & 
//                           ~tlb_cam_miss_s1 & ~retract_inst_d & ~kill_curr_d;
   assign ely_running_s1 = ~stall_s1 & ~rb_stg_d_crit & ~pc_oor_s1 & 
                           ~tlb_cam_miss_s1 & ~kill_curr_d;
   assign fcl_erb_ievld_s1 = ely_running_s1 & rdreq_s1 & itlb_fcl_imiss_s_l;
   assign fcl_erb_tevld_s1 = ely_running_s1 & rdreq_s1;

   assign fcl_erb_immuevld_s1 = ely_running_s1 & cam_vld_s1;

//   assign fcl_erb_ttevld_s1 = asird_s & rdtag_s;
//   assign fcl_erb_tdevld_s1 = asird_s & ~rdtag_s;
   
   dff_s #(1) d1vld_ff(.din (running_s1),
		                 .q   (inst_vld_d1),
		                 .clk (clk), .se(se), .si(), .so());
//   assign inst_vld_qual_d1 = inst_vld_d1 & ~kill_thread_e & 
//	                           ~flush_sonly_qual_e & ~rb_stg_e;
   assign fcl_erb_inst_vld_d1 = inst_vld_d1;
   

   // ifetch unc. error
   assign ifet_ue_vec_d1 = (erb_fcl_ifet_uevec_d1 |
	                          ifet_ue_vec_e & ~val_thr_e) &   // reset
			                       ~(clear_s_d1);                 // wins

   dffr_s #(4) ifuerr_reg(.din (ifet_ue_vec_d1),
		                  .q   (ifet_ue_vec_e),
		                  .rst (fcl_reset),
		                  .clk (clk), .se(se), .si(), .so());

   assign ifet_ue_e = (ifet_ue_vec_e[0] & thr_e[0] | 
		                   ifet_ue_vec_e[1] & thr_e[1] | 
		                   ifet_ue_vec_e[2] & thr_e[2] | 
		                   ifet_ue_vec_e[3] & thr_e[3]);


//----------------------
// Other I side traps
//----------------------
   // Determine if we are in Trap Level 0
   assign tlzero_s2 = (thr_f[0] & tlzero_vec_d1[0] |
		                   thr_f[1] & tlzero_vec_d1[1] |
		                   thr_f[2] & tlzero_vec_d1[2] |
		                   thr_f[3] & tlzero_vec_d1[3]);
   dff_s #(1) tlzd_ff(.din (tlzero_s2),
		              .q   (fcl_dtu_tlzero_d),
		              .clk (clk), .se(se), .si(), .so());

   // Collect all IFU traps
   assign trap_e = (immu_miss_e | inst_acc_exc_e | dtu_fcl_illinst_e |
		                dtu_fcl_fpdis_e | dtu_fcl_privop_e | ifet_ue_e |
		                dtu_fcl_imask_hit_e | dtu_fcl_sir_inst_e) & 
                     inst_vld_e;

   dff_s trapm_ff(.din (trap_e),
		            .q   (trap_m),
		            .clk (clk),
		            .se  (se), .si(), .so());

   assign no_iftrap_m = ~ifu_tlu_ttype_vld_m;
   dff_s trapw_ff(.din (no_iftrap_m),
		            .q   (no_iftrap_w),
		            .clk (clk),
		            .se  (se), .si(), .so());
   
   // south is very critical
   assign ifu_tlu_ttype_vld_m = (trap_m & inst_vld_m | 
                                 disr_trap_m) & ~kill_curr_m & ~kill_local_m;
   // less critical going east
   assign ifu_exu_ttype_vld_m = trap_m & inst_vld_m;

   // less critical going southwest
   assign ifu_mmu_trap_m = trap_m;

   // less critical going south   
   assign ifu_tlu_trap_m = trap_m;
   
   // trap type priority encode
   // Decreasing priority is
   //   pc out of range           i_acc_exc
   //   immu parity error         i_acc_err
   //   immu miss                 i_acc_mmu_ms
   //   icache/tag parity error   i_acc_err
   //   privilege page            i_acc_exc
   //   privilege opcode          priv_opc
   //   illegal non-fp inst       ill_inst
   //   soft reset                sir
   //   fp disabled               fp_disabled
   //   illegal fp instruction    ill_inst

   // Clean this up!!
   assign ttype_sel_spuma_e = spuint1_qual_e;
   assign ttype_sel_spuenc_e = spuint0_qual_e;
   assign ttype_sel_corr_err_e = ceint_qual_e;
   assign ttype_sel_unc_err_e = ueint_qual_e;
   assign ttype_sel_res_err_e = rerr_qual_e;
   assign ttype_sel_hstk_cmp_e = hintp_qual_e;
   
   assign ttype_sel_pcoor_e = fdp_fcl_pc_oor_e & inst_acc_exc_e;
   assign ttype_sel_icache_err_e = ifet_ue_e; 
   assign ttype_sel_immu_miss_e = ~fdp_fcl_pc_oor_e & immu_miss_e & 
                                  ~addr_real_e;
   assign ttype_sel_real_trans_e = ~fdp_fcl_pc_oor_e & immu_miss_e & 
                                   addr_real_e;    
   assign ttype_sel_priv_viol_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                           inst_acc_exc_e;
   assign ttype_sel_ibe_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                        ~inst_acc_exc_e & dtu_fcl_imask_hit_e;
   assign ttype_sel_privop_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                       ~inst_acc_exc_e & dtu_fcl_privop_e;
   assign ttype_sel_illinst_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                        ~inst_acc_exc_e & dtu_fcl_illinst_e;
   assign ttype_sel_sir_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                    ~inst_acc_exc_e & ~dtu_fcl_illinst_e &
	                     dtu_fcl_sir_inst_e;
   
   assign ttype_sel_fpdis_e = ~fdp_fcl_pc_oor_e & ~immu_miss_e & 
	                      ~inst_acc_exc_e & ~dtu_fcl_illinst_e &
	                       dtu_fcl_fpdis_e;

   // mux in the trap type
   assign ttype_e[8:0] = ttype_sel_unc_err_e    ? `DATA_ERR  :
                   ttype_sel_hstk_cmp_e   ? `HSTICK_CMP    :
	                 ttype_sel_spuma_e      ? `SPU_MAINT     :
	                 ttype_sel_spuenc_e     ? `SPU_ENCINT    :
	                 ttype_sel_corr_err_e   ? `CORR_ECC_ERR  :
                   ttype_sel_res_err_e    ? `RESUMABLE_ERR :
          
	                 ttype_sel_pcoor_e      ? `INST_ACC_EXC  :
	                 ttype_sel_immu_miss_e  ? `FAST_MMU_MS   :
	                 ttype_sel_real_trans_e ? `REAL_TRANS_MS :
	                 ttype_sel_icache_err_e ? `INST_ACC_ERR  :
	                 ttype_sel_priv_viol_e  ? `INST_ACC_EXC  :
	                 ttype_sel_ibe_e        ? `INST_BRK_PT   :
	                 ttype_sel_privop_e     ? `PRIV_OPC :
	                 ttype_sel_illinst_e    ? `ILL_INST :
	                 ttype_sel_sir_e        ? `SIR      :
	                 ttype_sel_fpdis_e      ? `FP_DISABLED :
	                                           9'h1ff;

   dff_s #(9) ttype_reg(.din (ttype_e[8:0]),
		                .q   (ifu_tlu_ttype_m[8:0]),
		                .clk (clk), .se(se), .si(), .so());
	 
//------------------------------
// Interrupts and Resets
//------------------------------
   // Process resets to see if they are sync or async
   assign intr_in_pipe = ({4{intr_vld_d}} & thr_d |
                          {4{intr_vld_e}} & thr_e |
                          {4{intr_vld_m}} & thr_m |
                          {4{intr_vld_w}} & thr_w);

//   assign async_rst_i2 = tlu_ifu_rstthr_i2  & {4{tlu_ifu_rstint_i2}} &
   assign async_rst_i3 = (rstint_i3 | nuke_thr_i3 | resumint_i3) & 
                           ~dtu_fcl_thr_active & ~intr_in_pipe;

   dff_s #(4) asyrst4_reg(.din (async_rst_i3),
                        .q   (async_rst_i4),
                        .clk (clk), .se(se), .si(), .so());
   
   // stall pipe before switching in rst thread
   assign rst_stallreq_d0 = (|async_rst_i4[3:0]);
   assign rst_stallreq = rst_stallreq_d0 | rst_stallreq_d1 | rst_stallreq_d2;

   dff_s #(2) stlreq_reg(.din ({lsu_ifu_stallreq,
                              ffu_ifu_stallreq}),
                       .q   ({lsu_stallreq_d1,
                              ffu_stallreq_d1}),
                       .clk (clk), .se(se), .si(), .so());
   
   assign all_stallreq = ifq_fcl_stallreq | lsu_stallreq_d1 | 
                         ffu_stallreq_d1 | itlb_starv_alert;

   // leave out stall from ifq which goes directly to swl
   assign fcl_dtu_stall_bf = lsu_stallreq_d1 | ffu_stallreq_d1 | 
                             itlb_starv_alert | rst_stallreq;

   // priority encode rst interrupts
   // this could lead to obvious starvation of thr3, the assumption is that
   // idle/resume/reset interrupts do not occur very frequently
   assign rstint_penc[0] = async_rst_i4[0];
   assign rstint_penc[1] = ~async_rst_i4[0] & async_rst_i4[1];
   assign rstint_penc[2] = ~async_rst_i4[0] & ~async_rst_i4[1]  & 
	                          async_rst_i4[2];
   assign rstint_penc[3] = ~async_rst_i4[0] & ~async_rst_i4[1]  & 
	                         ~async_rst_i4[2];

   // BF - switch in rst thread
   dff_s #(1) asyncr1_ff(.din (rst_stallreq_d0),
		                   .q   (rst_stallreq_d1),
		                   .clk (clk), .se(se), .si(), .so());
   assign arst_vld_f_l = ~arst_vld_f;
   assign arst_vld_s_l = ~arst_vld_s;
   bw_u1_nand3_4x UZsize_rstsw_n3(.z (rst_sw_bf_l),
                                  .a (arst_vld_f_l),
                                  .b (arst_vld_s_l),
                                  .c (rst_stallreq_d1));
   assign rst_sw_bf = ~rst_sw_bf_l;

   // double check if asyn intrs are still valid
   assign sw_for_real_rst_bf = rst_sw_bf & rst_stallreq_d0;
   
   // F
   dff_s #(1) asyncr2_ff(.din (sw_for_real_rst_bf),
		                   .q   (rst_stallreq_d2),
		                   .clk (clk), .se(se), .si(), .so());
//   assign arst_vld_f = rst_stallreq_d2 & any_rstnuke_f;
   assign arst_vld_f = rst_stallreq_d2;   

   // hold thread till reset of curr thread is processed
//   assign rst_thr_bf = arst_vld_f ? thr_f : rstint_penc;
   
   // S issue to pipe
   dff_s #(1) rstvlds_ff(.din (arst_vld_f),
		                   .q   (arst_vld_s),
		                   .clk (clk), .se(se), .si(), .so());
   assign async_intr_vld_s = arst_vld_s & ~kill_intr_f; // & any_rstnuke_f 


   //
   // thread wise interrupts
   //
   assign rstint_i2 = {4{tlu_ifu_rstint_i2}} & tlu_ifu_rstthr_i2;
   assign resumint_i2 = {4{tlu_ifu_resumint_i2}} & tlu_ifu_rstthr_i2;
   assign nuke_thr_i2 =  {4{tlu_ifu_nukeint_i2}} & tlu_ifu_rstthr_i2;

   assign next_rst_i2 = rstint_i2 | 
	                      rstint_i3 & (~(thr_w & {4{fcl_dtu_rst_thr_w}}));
   assign next_resum_i2 = resumint_i2 | 
	                        resumint_i3 & (~(thr_w & {4{fcl_dtu_resum_thr_w}})) 
                          & ~rstint_i2;

   assign next_nuke_i2  = (nuke_thr_i2 | nuke_thr_i3) & 
                            (~(thr_w & {4{fcl_dtu_nuke_thr_w}})) & 
	                       ~(rstint_i2 | resumint_i2);

   assign next_sftint_i2 = tlu_ifu_sftint_vld;
   assign next_hwint_i3 = tlu_ifu_hwint_i3;
   assign next_hintp_i2 = tlu_ifu_hintp_vld;
   assign next_rerr_i2 = tlu_ifu_rerr_vld;
   
   assign next_ceint_i2 = erb_fcl_ce_trapvec |
	                        ceint_i3 & (~(thr_w & {4{ceint_qual_w}}));

   assign next_ueint_i2 = erb_fcl_ue_trapvec |
	                        ueint_i3 & (~(thr_w & {4{ueint_qual_w}}));

   // From Farnad: tid is ready several cycles before everything else
   // I will assume 1 cycle before in the ifu
   dff_s #(2) sptid_reg(.din (spu_ifu_ttype_tid_w2),
                      .q   (spu_tid_w2),
                      .clk (clk), .se(se), .so(), .si());
   
   assign spu_thr[0] = ~spu_tid_w2[1] & ~spu_tid_w2[0];
   assign spu_thr[1] = ~spu_tid_w2[1] &  spu_tid_w2[0];
   assign spu_thr[2] =  spu_tid_w2[1] & ~spu_tid_w2[0];
   assign spu_thr[3] =  spu_tid_w2[1] &  spu_tid_w2[0];

   assign next_spuint1_i2 = {4{spu_ifu_ttype_vld_w2 & spu_ifu_ttype_w2}} & 
	                          spu_thr & ~erb_fcl_spu_uetrap |
	                          spuint1_i3 & ~({4{spuint1_w}} & thr_w);

   assign next_spuint0_i2 = {4{spu_ifu_ttype_vld_w2 & ~spu_ifu_ttype_w2}} & 
	                          spu_thr & ~erb_fcl_spu_uetrap |
	                          spuint0_i3 & ~({4{spuint0_w}} & thr_w);


   dffr_s #(4) rst_reg(.din  (next_rst_i2),
		                 .q    (rstint_i3),
		                 .clk  (clk),
		                 .rst  (fcl_reset),
		                 .se   (se), .si(), .so());

   dffr_s #(4) resum_reg(.din  (next_resum_i2),
		                   .q    (resumint_i3),
		                   .clk  (clk),
		                   .rst  (fcl_reset),
		                   .se   (se), .si(), .so());

   dffr_s #(4) nuke_reg(.din  (next_nuke_i2),
		                  .q    (nuke_thr_i3),
		                  .rst  (fcl_reset),
		                  .clk  (clk),
		                  .se   (se), .si(), .so());

   dffr_s #(4) sfti_reg(.din  (next_sftint_i2),
		                  .q    (sftint_i3),
		                  .rst  (fcl_reset),
		                  .clk  (clk), .se   (se), .si(), .so());
   dffr_s #(4) hstki_reg(.din  (next_hintp_i2),
		                  .q    (hintp_i3),
		                  .rst  (fcl_reset),
		                  .clk  (clk), .se   (se), .si(), .so());
   dffr_s #(4) reri_reg(.din  (next_rerr_i2),
		                  .q    (rerr_i3),
		                  .rst  (fcl_reset),
		                  .clk  (clk), .se   (se), .si(), .so());
   dffr_s #(4) hwi_reg(.din  (next_hwint_i3),
		                 .q    (hwint_i4),
		                 .rst  (fcl_reset),
		                 .clk  (clk), .se   (se), .si(), .so());

   dffr_s #(4) spui0_reg(.din  (next_spuint0_i2),
		                   .q    (spuint0_i3),
		                   .rst  (fcl_reset),
		                   .clk  (clk), .se   (se), .si(), .so());
   
   dffr_s #(4) spui1_reg(.din  (next_spuint1_i2),
		                   .q    (spuint1_i3),
		                   .rst  (fcl_reset),
		                   .clk  (clk), .se   (se), .si(), .so());

   dffr_s #(4) cei_reg(.din  (next_ceint_i2),
		                 .q    (ceint_i3),
		                 .rst  (fcl_reset),
		                 .clk  (clk), .se   (se), .si(), .so());

   dffr_s #(4) uei_reg(.din  (next_ueint_i2),
		                 .q    (ueint_i3),
		                 .rst  (fcl_reset),
		                 .clk  (clk), .se   (se), .si(), .so());

   assign supv_int_en = (~tlu_hpstate_priv | ~tlu_hpstate_enb) & 
                         tlu_ifu_pstate_ie & dtu_fcl_thr_active;
   assign hypv_int_en = ~tlu_hpstate_priv & tlu_hpstate_enb | 
                        tlu_ifu_pstate_ie & dtu_fcl_thr_active;
   
   dff_s #(4) spvie_ff(.din (supv_int_en),
                     .q   (supv_int_en_d1),
                     .clk (clk), .se(se), .si(), .so());
   dff_s #(4) hpvie_ff(.din (hypv_int_en),
                     .q   (hypv_int_en_d1),
                     .clk (clk), .se(se), .si(), .so());

   // force an interrupt by putting nop on pipe
   // use this signal instead of hw_int_s to help with crit path
   assign supv_masked_intr_s = (sftint_i3        |
			                          rerr_i3);
   assign hypv_masked_intr_s = (hwint_i4         |
			                          hintp_i3         |
			                          ceint_i3         |
			                          ueint_i3         |
			                          spuint0_i3       |
			                          spuint1_i3);

   assign fcl_swl_int_activate_i3 = hypv_masked_intr_s |
                                    supv_masked_intr_s;

    // keep track of rolled back interrupts
   assign intr_pending_nxt =  (({4{intr_vld_e}} & rb_frome) |
                               ({4{intr_vld_d}} & rb_fromd & ~rb_frome) |
                                intr_pending_s) & ~clear_s_d1;
   
   dffr_s #(4) ipend_reg(.din (intr_pending_nxt),
                       .q   (intr_pending_s),
                       .rst (fcl_reset),
                       .clk (clk), .se(se), .si(), .so());

   assign any_intr_vec_f = (supv_masked_intr_s & supv_int_en_d1 |
                            hypv_masked_intr_s & hypv_int_en_d1 |
                            intr_pending_s    |
			                      rstint_i3         |
                            resumint_i3       |
			                      nuke_thr_i3);

   dff_s #(4) anyints_reg(.din (any_intr_vec_f),
                        .q   (any_intr_vec_s),
                        .clk (clk), .se(se), .si(), .so());
			
   assign force_intr_s = (thr_f_crit[0] & any_intr_vec_s[0] |
                          thr_f_crit[1] & any_intr_vec_s[1] |
                          thr_f_crit[2] & any_intr_vec_s[2] |
                          thr_f_crit[3] & any_intr_vec_s[3]) &
	                         ~kill_intr_f;

   // interrupt and reset signal pipe
   // VA hole trap has higher priority than interrupt
   //   - since the VA hole marker is lost once the intr is taken
   assign intr_vld_s = force_intr_s & (valid_s & ~pc_oor_s | 
                                       async_intr_vld_s);

   assign intr_vld_qual_s = intr_vld_s & ~iferrto_thisthr_d1;
   dff_s #(1) any_intrd_ff(.din (intr_vld_qual_s),
		                     .q   (intr_vld_d),	
		                     .clk (clk),	
		                     .se  (se), .so(), .si());
   assign fcl_dec_intr_vld_d = intr_vld_d;
   assign intr_vld_qual_d = intr_vld_d & ~kill_intr_d & ~kill_thread_d & 
	                           ~rb_stg_d;

   dff_s #(1) intr_vlde_ff(.din (intr_vld_qual_d),
		                   .q   (intr_vld_e),
		                   .clk (clk), .se  (se), .so(), .si());

   assign intr_vld_qual_e = intr_vld_e & ~kill_curr_e & ~rb_stg_e & 
	                    ~kill_intr_e & ~dtu_inst_anull_e &
                      ~(thr_match_em & ifu_tlu_flush_m);
   
   dff_s #(1) intr_vldm_ff(.din (intr_vld_qual_e),
		                   .q   (intr_vld_m),
		                   .clk (clk), .se  (se), .so(), .si());

   assign intr_vld_qual_m = intr_vld_m & ~kill_thread_m & ~mark4rb_m;

   dff_s #(1) intr_vldw_ff(.din (intr_vld_qual_m),
		                   .q   (intr_vld_w),
		                   .clk (clk), .se  (se), .so(), .si());

   // Reset and Idle are prioritized in M.  All others in E
   // reset interrupt
   assign rstint_m = (rstint_i3[0] & thr_m[0] |
			                rstint_i3[1] & thr_m[1] |
			                rstint_i3[2] & thr_m[2] |
			                rstint_i3[3] & thr_m[3]);

   assign ifu_tlu_rstint_m = rstint_m & intr_vld_m & ~kill_local_m & 
                             ~kill_curr_m;
//   assign rstint_qual_m = rstint_m & ~ely_kill_thread_m & intr_vld_m;
   dff_s #(1) rstw_ff(.din (rstint_m),
                    .q   (rst_thr_w),
                    .clk (clk), .se(se), .si(), .so());
   assign fcl_dtu_rst_thr_w = rst_thr_w & intr_vld_w;

   // resume interrupt
   assign resumint_m = (resumint_i3[0] & thr_m[0] |
			                  resumint_i3[1] & thr_m[1] |
			                  resumint_i3[2] & thr_m[2] |
			                  resumint_i3[3] & thr_m[3]);
   assign resumint_qual_m = resumint_m & ~rstint_m;
   
   dff_s #(1) resumw_ff(.din (resumint_qual_m),
                      .q   (resum_thr_w),
                      .clk (clk), .se(se), .si(), .so());
   assign fcl_dtu_resum_thr_w = resum_thr_w & intr_vld_w;

   // idle interrupt
   assign nuke_thr_m = (nuke_thr_i3[0] & thr_m[0] |
				                nuke_thr_i3[1] & thr_m[1] |
				                nuke_thr_i3[2] & thr_m[2] |
				                nuke_thr_i3[3] & thr_m[3]);

   assign nuke_thr_qual_m = nuke_thr_m & ~rstint_m & ~resumint_m;

   dff_s #(1) nukw_ff(.din (nuke_thr_qual_m),
                    .q   (nuke_thr_w),
                    .clk (clk),
                    .se  (se), .si(), .so());
   assign fcl_dtu_nuke_thr_w = nuke_thr_w & intr_vld_w;
   
   // uncorrected ecc
   assign ueint_e = (ueint_i3[0] & thr_e[0] & hypv_int_en_d1[0] |
		                 ueint_i3[1] & thr_e[1] & hypv_int_en_d1[1] |
		                 ueint_i3[2] & thr_e[2] & hypv_int_en_d1[2] |
		                 ueint_i3[3] & thr_e[3] & hypv_int_en_d1[3]);
   assign ueint_qual_e = ueint_e & intr_vld_e;

   dff_s #(1) uem_ff (.din (ueint_qual_e),
                    .q   (ueint_m),
                    .clk (clk), .se (se), .si(), .so());
                    
//   assign ueint_m = (ueint_i3[0] & thr_m[0] |
//		                 ueint_i3[1] & thr_m[1] |
//		                 ueint_i3[2] & thr_m[2] |
//		                 ueint_i3[3] & thr_m[3]);
   
   assign ueint_trap_m = ueint_m & intr_vld_m & 
                         ~(rstint_m | resumint_m | nuke_thr_m);
   
//   assign ueint_qual_m = ueint_trap_m & ~ely_kill_thread_m;
   dff_s #(1) ueintw_ff(.din (ueint_trap_m),
                      .q   (ueint_trap_w),
                      .clk (clk), .se(se), .si(), .so());
   assign ueint_qual_w = ueint_trap_w & intr_vld_w;

   // hstk match interrupt
   assign hintp_e = (hintp_i3[0] & thr_e[0] & hypv_int_en_d1[0] |
			               hintp_i3[1] & thr_e[1] & hypv_int_en_d1[1] |
			               hintp_i3[2] & thr_e[2] & hypv_int_en_d1[2] |
			               hintp_i3[3] & thr_e[3] & hypv_int_en_d1[3]);
   assign hintp_qual_e = hintp_e & intr_vld_e & ~ueint_e;

   dff_s #(1) hintpm_ff (.din (hintp_qual_e),
                       .q   (hintp_m),
                       .clk (clk), .se (se), .si(), .so());

//   assign ifu_tlu_hintp_m = hintp_m & ~kill_local_m & intr_vld_m & 
//	                    ~(rstint_m | nuke_thr_m | ueint_m);
   
   // hw int
   assign hwint_e = (hwint_i4[0] & thr_e[0] & hypv_int_en_d1[0] |
			               hwint_i4[1] & thr_e[1] & hypv_int_en_d1[1] |
			               hwint_i4[2] & thr_e[2] & hypv_int_en_d1[2] |
			               hwint_i4[3] & thr_e[3] & hypv_int_en_d1[3]);
   dff_s #(1) hwe_ff(.din (hwint_e),
                   .q   (hwint_m),
                   .clk (clk), .se(se), .si(), .so());

   assign ifu_tlu_hwint_m = hwint_m & intr_vld_m & ~kill_local_m &
                     ~kill_curr_m & 
	                   ~(rstint_m | resumint_m | nuke_thr_m | ueint_m | hintp_m);
   

   // spu interrupt
   assign spuint1_e = (spuint1_i3[0] & thr_e[0] & hypv_int_en_d1[0] |
		                   spuint1_i3[1] & thr_e[1] & hypv_int_en_d1[1] |
		                   spuint1_i3[2] & thr_e[2] & hypv_int_en_d1[2] |
		                   spuint1_i3[3] & thr_e[3] & hypv_int_en_d1[3]);
   assign spuint1_qual_e = spuint1_e & intr_vld_e & ~ueint_e & ~hintp_e;

//   assign spuint1_m = (spuint1_i3[0] & thr_m[0] |
//		                   spuint1_i3[1] & thr_m[1] |
//		                   spuint1_i3[2] & thr_m[2] |
//		                   spuint1_i3[3] & thr_m[3]);

   dff_s #(1) spu1m_ff(.din (spuint1_qual_e),
                     .q   (spuint1_m),
                     .clk (clk), .se(se), .si(), .so());

   assign spuint1_trap_m = spuint1_m & intr_vld_m & 
	                    ~(rstint_m | resumint_m | nuke_thr_m | hwint_m);

//   assign spuint1_qual_m = spuint1_trap_m & ~ely_kill_thread_m;
   
   dff_s #(1) spiw1_ff(.din (spuint1_trap_m),
		                 .q   (spuint1_trap_w),
		                 .clk (clk), .se(se), .si(), .so());
   assign spuint1_w = spuint1_trap_w & intr_vld_w;
   
   assign spuint0_e = (spuint0_i3[0] & thr_e[0] & hypv_int_en_d1[0] |
		                   spuint0_i3[1] & thr_e[1] & hypv_int_en_d1[1] |
		                   spuint0_i3[2] & thr_e[2] & hypv_int_en_d1[2] |
		                   spuint0_i3[3] & thr_e[3] & hypv_int_en_d1[3]);
   
   assign spuint0_qual_e = spuint0_e & intr_vld_e & ~ueint_e &
			                     ~spuint1_e & ~hintp_e;

//   assign spuint0_m = (spuint0_i3[0] & thr_m[0] |
//		                   spuint0_i3[1] & thr_m[1] |
//		                   spuint0_i3[2] & thr_m[2] |
//		                   spuint0_i3[3] & thr_m[3]);
   dff_s #(1) spu0m_ff(.din (spuint0_qual_e),
                     .q   (spuint0_m),
                     .clk (clk), .se(se), .si(), .so());

   assign spuint0_trap_m = spuint0_m & intr_vld_m &
             	        ~(rstint_m | nuke_thr_m | resumint_m |
		                    hwint_m);
   
//   assign spuint0_qual_m = spuint0_trap_m & ~kill_thread_m;

   dff_s #(1) spiw0_ff(.din (spuint0_trap_m),
		                 .q   (spuint0_trap_w),
		                 .clk (clk), .se(se), .si(), .so());
   assign spuint0_w = spuint0_trap_w & intr_vld_w;
   
//   assign ifu_spu_trap_ack = {spuint1_w, spuint0_w};
   assign ifu_spu_trap_ack = spuint1_w;   
   
   
   // software interrupts
   assign sftint_e = (sftint_i3[0] & thr_e[0] & supv_int_en_d1[0] |
			                sftint_i3[1] & thr_e[1] & supv_int_en_d1[1] |
			                sftint_i3[2] & thr_e[2] & supv_int_en_d1[2] |
			                sftint_i3[3] & thr_e[3] & supv_int_en_d1[3]);

   assign sftint_qual_e = sftint_e & ~spuint0_e & intr_vld_e & 
                          ~ueint_e & ~spuint1_e & ~hintp_e;
   
   dff_s #(1) swm_ff(.din (sftint_qual_e),
                   .q   (sftint_m),
                   .clk (clk), .se(se), .si(), .so());

   // if nothing else, signal sftint!
//   assign ifu_tlu_sftint_m = (sftint_m & 
//	                            ~(rstint_m | nuke_thr_m | hintp_m | resumint_m |
//				                        hwint_m | spuint1_m | spuint0_m | ueint_m) |
//                              ~(ceint_m | rerr_m)) & 
//                               ~kill_local_m & intr_vld_m;

   assign ifu_tlu_sftint_m = (sftint_m & 
	                            ~(rstint_m | nuke_thr_m | hintp_m | resumint_m |
				                        hwint_m | spuint1_m | spuint0_m | ueint_m)) & 
                               ~kill_local_m & ~kill_curr_m & intr_vld_m;
   

   // corrected ecc interrupt
   assign ceint_e = (ceint_i3[0] & thr_e[0] & hypv_int_en_d1[0] |
		                 ceint_i3[1] & thr_e[1] & hypv_int_en_d1[1] |
		                 ceint_i3[2] & thr_e[2] & hypv_int_en_d1[2] |
		                 ceint_i3[3] & thr_e[3] & hypv_int_en_d1[3]);
   assign ceint_qual_e = ceint_e & intr_vld_e & ~ueint_e & 
                          ~spuint1_e & ~spuint0_e & ~hintp_e;

//   assign ceint_m = (ceint_i3[0] & thr_m[0] |
//		                 ceint_i3[1] & thr_m[1] |
//		                 ceint_i3[2] & thr_m[2] |
//		                 ceint_i3[3] & thr_m[3]);
   dff_s #(1) cem_ff(.din (ceint_qual_e),
                   .q   (ceint_m),
                   .clk (clk), .se(se), .si(), .so());
   
   assign ceint_trap_m = ceint_m & intr_vld_m & 
	                 ~(rstint_m | nuke_thr_m | resumint_m |
		                 sftint_m | hwint_m);
   
//   assign ceint_qual_m = ceint_trap_m & ~ely_kill_thread_m;
   dff_s #(1) ceintw_ff(.din (ceint_trap_m),
                      .q   (ceint_trap_w),
                      .clk (clk), .se(se), .si(), .so());
   assign ceint_qual_w = ceint_trap_w & intr_vld_w;

   // resumable error interrupt
   assign rerr_e = (rerr_i3[0] & thr_e[0] & supv_int_en_d1[0] |
		                 rerr_i3[1] & thr_e[1] & supv_int_en_d1[1] |
		                 rerr_i3[2] & thr_e[2] & supv_int_en_d1[2] |
		                 rerr_i3[3] & thr_e[3] & supv_int_en_d1[3]);
   assign rerr_qual_e = rerr_e & intr_vld_e & ~ueint_e & ~ceint_e &
                        ~spuint1_e & ~spuint0_e & ~hintp_e;
   
   dff_s #(1) rem_ff(.din (rerr_qual_e),
                   .q   (rerr_m),
                   .clk (clk), .se(se), .si(), .so());
   
//   assign rerr_m = (rerr_i3[0] & thr_m[0] |
//			              rerr_i3[1] & thr_m[1] |
//			              rerr_i3[2] & thr_m[2] |
//			              rerr_i3[3] & thr_m[3]);

//   assign ifu_tlu_rerr_m = rerr_m & ~kill_local_m & intr_vld_m & 
//	                    ~(rstint_m | nuke_thr_m | ueint_m | ceint_m);

   assign disr_trap_m = (ueint_m | hintp_m | spuint0_m | spuint1_m |
                         ceint_m | rerr_m) & ~rstint_m & ~nuke_thr_m &
                          ~resumint_m & intr_vld_m;

   // check if a scheduled interrupt evaporated...
   assign any_intr_m = (ueint_m | ceint_m | spuint0_m | spuint1_m |
                        hintp_m | rerr_m | sftint_m | hwint_m | 
                        rstint_m | nuke_thr_m | resumint_m);
   
   // ..and rollback if that is the case
   assign rb_intr_m = ~any_intr_m & intr_vld_m;
   dff_s #(1) rbint_ff(.din (rb_intr_m),
                     .q   (rb_intr_w),
                     .clk (clk), .se(se), .si(), .so());

   // use synchronous interrupt signal to switch out thread in swl
//   assign fcl_dtu_sync_intr_d = (intr_vld_d | immu_miss_crit_d) & ~rb_stg_d;
   assign fcl_dtu_sync_intr_d = (intr_vld_d) & ~rb_stg_d_crit;   
   
   // kill the next three interrupts.  After that you are on your own.
//   assign kill_intr_m = ((thr_m & thr_w) == 4'b0) ?
//			                    1'b0 : (intr_vld_w);
   assign kill_intr_e = ((thr_e & thr_w) == 4'b0) ?
			                    1'b0 : (intr_vld_w);
   assign kill_intr_d = ((thr_d & thr_w) == 4'b0) ?
			                    1'b0 : (intr_vld_w);
   assign kill_intr_f = ((thr_f & thr_w) == 4'b0) ?
			                    1'b0 : (intr_vld_w);

//--------------------------------
// check if we are in a delay slot
//--------------------------------
   // remember if the current instruction is a delay slot
   assign delay_slot_vec_nxt = ({4{dtu_fcl_br_inst_d & inst_vld_d & 
                                   ~rb_stg_d}} & thr_d | // set
                                delay_slot_vec &
                                ~(thr_d & {4{inst_vld_d &
                                             ~rb_stg_d &
                                             ~intr_vld_d}})) &
                                 ~(trap_thr & {4{trappc_vld_w2}});
                                // & ~late_flush_w2;
   // Need to be a little pessimitic: can't clear the delay slot vec
   // after a utrap, since we may still be in the delay slot when we
   // re-execute

   dffr_s #(4) ds_reg(.din (delay_slot_vec_nxt),
                    .q   (delay_slot_vec),
                    .rst (fcl_reset),
                    .clk (clk), .se(se), .si(), .so());
   assign fcl_dec_dslot_s = (delay_slot_vec[0] & thr_f[0] |
                             delay_slot_vec[1] & thr_f[1] |
                             delay_slot_vec[2] & thr_f[2] |
                             delay_slot_vec[3] & thr_f[3]);
   

//------------------------------
// NIR control
//------------------------------
   // use nir if va[2] of previous fetch is a zero (i.e lower word)
   dff_s #(1) va2_ff(.din (fdp_fcl_va2_bf),
		               .clk (clk),
		               .q   (va2_f),
		               .se  (se), .si(), .so());
   
   assign usep_bf = rdreq_f & ~va2_f & ~ntpc_thisthr & ~stall_f;
   assign set_usen_bf = usep_bf & ~ely_stall_thisthr_f & dtu_fcl_running_s;
   
   // need to kill usen if trap or interrupt or flush
   assign thr_usen_nxt = ({4{set_usen_bf}} &  thr_f  |    // set usen
			                    thr_usen_bf  & ~val_thr_f) &    // keep old value
			                     ~((thr_d & {4{dtu_fcl_br_inst_d}})  |
		                         (thr_s1 & {4{ic_miss_s1}})  |
                             (thr_e & {4{erb_dtu_ifeterr_d1 & inst_vld_d1}}) |
			                       (clear_s_d1) |
			                       (ntpc_vld)  |
			                       (rb_w2 | rb_froms));     // reset usen (wins)
                         // & ~dtu_fcl_flush_nir
   
   dffr_s #(4) thr_usen_reg(.din  (thr_usen_nxt),
			                  .clk  (clk),
			                  .q    (thr_usen_bf),
			                  .rst  (fcl_reset),
			                  .se   (se), .si(), .so());
   
   /*
   // Use hand instantiated mux
   bw_u1_ao2222_4x UZsize_usn_mx(.z   (usen_iso_bf)
		                            .a2  (thr_usen_bf[0]),
		                            .b2  (thr_usen_bf[1]),
		                            .c2  (thr_usen_bf[2]),
		                            .d2  (thr_usen_bf[3]),
		                            .a1  (nextthr_bf_buf[0]),
		                            .b1  (nextthr_bf_buf[1]),
		                            .c1  (nextthr_bf_buf[2]),
		                            .d1  (nextthr_bf_buf[3]));

    // isolate from critical path
    bw_u1_buf_5x  UZsize_usn_iso(.z(usen_bf), .a(usen_iso_bf));
    */
                                
   assign usen_iso_bf = (thr_usen_bf[0] & nextthr_bf_buf[0] |
                         thr_usen_bf[1] & nextthr_bf_buf[1] |
                         thr_usen_bf[2] & nextthr_bf_buf[2] |
                         thr_usen_bf[3] & nextthr_bf_buf[3]);
   assign usen_bf = usen_iso_bf;

   
   
//------------------------------
// Switch Control
//------------------------------   
   // Switch IF
   //   1. Another thread is ready OR
   //   2. We hit a switch condition or Imiss and another thread is
   //      speculatively ready
   //   3. No thread is running and another thread is speculatively ready
   //   4. The DTU calls for a thread switch and another thread is ready
   //   (NOTE: if we hit a switch condition or Imiss and no thread is
   //    speculatively or otherwise ready we stall the pipe).
   //
   //   New plan:  switch if another thread is ready or spec ready.
   //

//   assign switch_bf = dtu_fcl_ntr_s;
   // mmckeown: when execution drafting is enabled, this is determined by
   // the switch_bf signal from ESL
   bw_u1_buf_20x UZsize_swbuf(.a (config_dtu_esl_en ? esl_fcl_switch_bf : dtu_fcl_ntr_s),
                              .z (switch_bf));
   
//   assign switch_bf = dtu_fcl_ntr_s & ~imsto_nextthr_s1;
//   assign switch_bf = dtu_fcl_ntr_s & ~(imsto_nextthr_s1 | kill_nextthr_w | 
//                                        intrto_nextthr_d);   
   
//   assign fcl_dtu_switch_s = switch_bf & ~all_stallreq & ~rst_stallreq;
//   assign fcl_dtu_switch_s = switch_bf & ~kill_nextthr_w;

   // TBD: No need to send this anymore, since switch_bf = ntr_s
//   assign fcl_dtu_switch_s = switch_bf;  // sw out curr and sw in next

   assign fcl_swl_swout_f = stall_f;     // sw out curr but don't sw in next
   // Note: need fcl_swl_swout_f and dtu_fcl_running_s to sync swl and
   // fcl at all times.  

   // mmckeown: when execution drafting is enabled, this is determined by
   //           ntr_s, not from the same thing as bf 
   assign switch_qual_bf = (config_dtu_esl_en ? esl_fcl_ntr_s : switch_bf) & ~rst_stallreq;
   dff_s #(1) sw_ff (.din  (switch_qual_bf),
		               .clk  (clk),
		               .q    (switch_s2),
		               .se   (se), .si(), .so());

   dff_s #(1) tmfn_ff (.din  (switch_bf),
		                 .clk  (clk),
		                 .q    (tm_fd_l),
		                 .se   (se), .si(), .so());

   // need to qual with immu_fault to avoid X's
//   assign fcl_dtu_swc_s = fdp_fcl_swc_s2 & inst_vld_s_crit & 
//                          ~immu_fault_f & ~part_stall_thisthr_f;
//   assign fcl_dtu_swc_s = fdp_fcl_swc_s2 & inst_vld_s_crit & 
//                          ~immu_fault_f & ~imsto_thisthr_s1 & ~rb_stg_s;
   assign fcl_swl_swcvld_s = inst_vld_s_crit & ~immu_fault_f & 
                             ~imsto_thisthr_s1 & ~rb_stg_s;
     

//------------------------------   
// Thread pipe
//------------------------------

//`ifdef VERPLEX
//   $constraint nthr_1h4 ($one_hot(dtu_fcl_nextthr_bf[3:0]));
//   $constraint thrf_1h4 ($one_hot(thr_f[3:0]));
//`endif
   
   // Keep track the thread in each pipe stage
   assign rstt = (~fcl_reset & (rst_stallreq_d1 & ~arst_vld_f)) | rst_tri_en;
   assign swt =  (~rst_stallreq_d1 & ~arst_vld_f & switch_bf | fcl_reset) & 
                   ~rst_tri_en;
   assign samet = (~rst_stallreq_d1 & ~switch_bf | arst_vld_f) & 
                    ~fcl_reset & ~rst_tri_en;
   
   mux3ds #(4)  nxttthr_mux(.dout  (thr_bf[3:0]),      
			                      .in0   (thr_f[3:0]),       
			                      .in1   (nextthr_bf_buf[3:0]),
			                      .in2   (rstint_penc[3:0]), 
			                      .sel0  (samet),
			                      .sel1  (swt),
			                      .sel2  (rstt));

   assign thr_match_nw = (thr_w[0] & nextthr_bf_buf[0] | 
			                    thr_w[1] & nextthr_bf_buf[1] | 
			                    thr_w[2] & nextthr_bf_buf[2] | 
			                    thr_w[3] & nextthr_bf_buf[3]);

   assign thr_match_nd = (thr_d[0] & nextthr_bf_buf[0] | 
			                    thr_d[1] & nextthr_bf_buf[1] | 
			                    thr_d[2] & nextthr_bf_buf[2] | 
			                    thr_d[3] & nextthr_bf_buf[3]);

//   assign thr_match_ne = (thr_e[0] & dtu_fcl_nextthr_bf[0] | 
//			                    thr_e[1] & dtu_fcl_nextthr_bf[1] | 
//			                    thr_e[2] & dtu_fcl_nextthr_bf[2] | 
//			                    thr_e[3] & dtu_fcl_nextthr_bf[3]);
   // qualify inst_vld_e in fcl itself

//   bw_u1_ao2222_4x UZsize_tmne(.z  (thr_match_ne),
//                               .a1 (val_thr_e[0]),
//                               .b1 (val_thr_e[1]),
//                               .c1 (val_thr_e[2]),
//                               .d1 (val_thr_e[3]),
//                               .a2 (dtu_fcl_nextthr_bf[0]),
//                               .b2 (dtu_fcl_nextthr_bf[1]),
//                               .c2 (dtu_fcl_nextthr_bf[2]),
//                               .d2 (dtu_fcl_nextthr_bf[3]));

   wire   tmne_10,
          tmne_32;
   bw_u1_aoi22_2x UZsize_tmne10(.z (tmne_10),
                                .a1 (dtu_fcl_nextthr_bf[0]),
                                .b1 (dtu_fcl_nextthr_bf[1]),
                                .a2 (val_thr_e[0]),
                                .b2 (val_thr_e[1]));
   bw_u1_aoi22_2x UZsize_tmne32(.z (tmne_32),
                                .a1 (dtu_fcl_nextthr_bf[2]),
                                .b1 (dtu_fcl_nextthr_bf[3]),
                                .a2 (val_thr_e[2]),
                                .b2 (val_thr_e[3]));
   bw_u1_nand2_4x UZsize_tmne30(.z (thr_match_ne),
                                .a (tmne_10),
                                .b (tmne_32));
   

   dff_s #(4) thrf_reg(.din   (thr_bf),     // thr_f may be 4'b0000 but it has 
		                 .clk   (clk),        // to reset to 4'b0001
		                 .q     (thr_f_flop),
		                 .se    (se),  .si(), .so());

   bw_u1_buf_10x UZsize_tfcrit0(.a (thr_f_flop[0]), .z(thr_f_crit[0]));
   bw_u1_buf_10x UZsize_tfcrit1(.a (thr_f_flop[1]), .z(thr_f_crit[1]));
   bw_u1_buf_10x UZsize_tfcrit2(.a (thr_f_flop[2]), .z(thr_f_crit[2]));
   bw_u1_buf_10x UZsize_tfcrit3(.a (thr_f_flop[3]), .z(thr_f_crit[3]));

   bw_u1_buf_10x UZsize_tfncr0(.a (thr_f_flop[0]), .z(thr_f[0]));
   bw_u1_buf_10x UZsize_tfncr1(.a (thr_f_flop[1]), .z(thr_f[1]));
   bw_u1_buf_10x UZsize_tfncr2(.a (thr_f_flop[2]), .z(thr_f[2]));
   bw_u1_buf_10x UZsize_tfncr3(.a (thr_f_flop[3]), .z(thr_f[3]));

   assign     ifu_exu_tid_s2[1] = thr_f[3] | thr_f[2];
   assign     ifu_exu_tid_s2[0] = thr_f[3] | thr_f[1];
   assign     ifu_lsu_thrid_s = ifu_exu_tid_s2;
   assign     fcl_dtu_thr_f = thr_f;
   
//   assign thr_s1_next = inst_vld_f ? thr_f : thr_s1;
   assign     thr_s1_next[0] = thr_f[0];
   assign     thr_s1_next[1] = ~thr_f[0] & thr_f[1];
   assign     thr_s1_next[2] = ~thr_f[0] & ~thr_f[1] & thr_f[2];
   assign     thr_s1_next[3] = ~thr_f[0] & ~thr_f[1] & ~thr_f[2];
   
//`ifdef VERPLEX
//   $constraint thr_s1_1h4 ($one_hot(thr_s1_next[3:0]));
//`endif
   
   dff_s #(4) thrs1_reg(.din   (thr_s1_next),
		    .clk   (clk),
		    .q     (thr_s1),
		    .se    (se), .si(), .so());
   
   dff_s #(4) thrd_reg(.din    (thr_s1_next), 
                    .clk   (clk),
                    .q     (thr_d),
                    .se    (se), .si(), .so());
   
   assign fcl_ifq_thr_s1[0] = thr_s1[3] | thr_s1[1];
   assign fcl_ifq_thr_s1[1] = thr_s1[3] | thr_s1[2];

   assign ifu_tlu_thrid_d[1] = thr_d[3] | thr_d[2];
   assign ifu_tlu_thrid_d[0] = thr_d[3] | thr_d[1];
   
   assign thr_match_fs1 = (thr_d[0] & thr_f_crit[0] | 
			                     thr_d[1] & thr_f_crit[1] | 
			                     thr_d[2] & thr_f_crit[2] | 
			                     thr_d[3] & thr_f_crit[3]);
   assign thr_match_fd = thr_match_fs1;
   assign thr_match_fe = (thr_e[0] & thr_f[0] | 
			                    thr_e[1] & thr_f[1] | 
			                    thr_e[2] & thr_f[2] | 
			                    thr_e[3] & thr_f[3]);
   assign thr_match_fm = (thr_m[0] & thr_f[0] | 
			                    thr_m[1] & thr_f[1] | 
			                    thr_m[2] & thr_f[2] | 
			                    thr_m[3] & thr_f[3]);
//   assign thr_match_ft = (trap_thr[0] & thr_f[0] | 
//			  trap_thr[1] & thr_f[1] | 
//			  trap_thr[2] & thr_f[2] | 
//			  trap_thr[3] & thr_f[3]);
   
   dffr_s #(4) thre_reg(.din   (thr_d),    
		    .clk   (clk),
		    .rst   (fcl_reset),
		    .q     (thr_e),
		    .se    (se), .si(), .so());
   assign fcl_esl_thr_e = thr_e;

   dffr_s #(4) thre2_reg(.din   (thr_d),    
		    .clk   (clk),
		    .rst   (fcl_reset),
		    .q     (thr_e_v2),
		    .se    (se), .si(), .so());

   assign     ifu_tlu_thrid_e[1] = thr_e[3] | thr_e[2];
   assign     ifu_tlu_thrid_e[0] = thr_e[3] | thr_e[1];

   assign thr_match_de = (thr_d[0] & thr_e[0] | 
			                    thr_d[1] & thr_e[1] | 
			                    thr_d[2] & thr_e[2] | 
			                    thr_d[3] & thr_e[3]);
			  
   assign thr_match_dm = (thr_d[0] & thr_m[0] | 
			                    thr_d[1] & thr_m[1] | 
			                    thr_d[2] & thr_m[2] | 
			                    thr_d[3] & thr_m[3]);

   dff_s #(4) thrm_reg(.din   (thr_e),    
		   .clk   (clk),
		   .q     (thr_m),
		   .se    (se), .si(), .so());
   assign fcl_esl_thr_m = thr_m;

   dff_s #(4) thrw_reg(.din   (thr_m),    
		   .clk   (clk),
		   .q     (thr_w),
		   .se    (se), .si(), .so());

   assign sas_thrid_w[1] = thr_w[3] | thr_w[2];
   assign sas_thrid_w[0] = thr_w[3] | thr_w[1];
   
   assign thr_match_fw = (thr_f[0] & thr_w[0] | 
			                    thr_f[1] & thr_w[1] | 
			                    thr_f[2] & thr_w[2] | 
			                    thr_f[3] & thr_w[3]);
	 
   assign thr_match_fw2 = (thr_f[0] & thr_w2[0] | 
			                     thr_f[1] & thr_w2[1] | 
			                     thr_f[2] & thr_w2[2] | 
			                     thr_f[3] & thr_w2[3]);

   assign thr_match_dw = (thr_d[0] & thr_w[0] | 
			                    thr_d[1] & thr_w[1] | 
			                    thr_d[2] & thr_w[2] | 
			                    thr_d[3] & thr_w[3]);

   assign thr_match_dw2 = (thr_d[0] & thr_w2[0] | 
			                     thr_d[1] & thr_w2[1] | 
			                     thr_d[2] & thr_w2[2] | 
			                     thr_d[3] & thr_w2[3]);
	 
   assign thr_match_em = (thr_e[0] & thr_m[0] | 
			                    thr_e[1] & thr_m[1] | 
			                    thr_e[2] & thr_m[2] | 
			                    thr_e[3] & thr_m[3]);

   assign thr_match_ew = (thr_e_v2[0] & thr_w[0] | 
			                    thr_e_v2[1] & thr_w[1] | 
			                    thr_e_v2[2] & thr_w[2] | 
			                    thr_e_v2[3] & thr_w[3]);

   dff_s #(1) stmw2_ff(.din (thr_match_ew),
                     .q   (same_thr_mw2),
                     .clk (clk), .se (se), .si(), .so());
   
   assign thr_match_ew2 = (thr_e[0] & thr_w2[0] | 
			                     thr_e[1] & thr_w2[1] | 
			                     thr_e[2] & thr_w2[2] | 
			                     thr_e[3] & thr_w2[3]);
	 
   assign thr_match_mw = (thr_m[0] & thr_w[0] | 
			                    thr_m[1] & thr_w[1] | 
			                    thr_m[2] & thr_w[2] | 
			                    thr_m[3] & thr_w[3]);
			  
   dff_s #(4) thrw2_reg(.din   (thr_w),    
		    .clk   (clk),
		    .q     (thr_w2),
		    .se    (se), .si(), .so());
   

//-------------------------
// Rollback
//-------------------------

   // 04/05/02
   // Looks like we made a mistake with rollback.  Should never
   // rollback to S.  In the event of a dmiss or mul contention, just
   // kill all the instructions and rollback to F.  This adds one
   // cycle to the dmiss penalty and to the mul latency if we have to
   // wait, both not a very high price to pay.  This would have saved
   // lots of hours of design and verif time.
   //    
   assign rb2_inst_d = thr_match_dw & inst_vld_d & dtu_fcl_rollback_g;
   assign rb1_inst_s = thr_match_fw & inst_vld_s & dtu_fcl_rollback_g;
   assign rb0_inst_bf = thr_match_nw & switch_bf & dtu_fcl_rollback_g;

//   assign rt1_inst_s = thr_match_fd & inst_vld_s & retract_inst_d;
//   assign rt0_inst_bf = thr_match_nd & dtu_fcl_ntr_s & retract_inst_d;

//   assign retract_iferr_d = thr_match_de & erb_dtu_ifeterr_d1 & inst_vld_d1 &
//                            ~kill_curr_e & fcl_dtu_inst_vld_d;
   assign retract_iferr_d1 = erb_dtu_ifeterr_d1 & inst_vld_d1;

   assign retract_inst_d = retract_iferr_d1 & thr_match_de & 
                           fcl_dtu_inst_vld_d |
                           mark4rb_d | 
                           dtu_fcl_retract_d;

   assign rt1_inst_s = thr_match_fd & inst_vld_s & dtu_fcl_retract_d | 
                       mark4rb_s;
//                     | thr_match_fe & inst_vld_s & retract_iferr_d1;

   // TBD:  This is not necessary since the thread will switch out and
   // stall whatever makes its way to the S stage.
   // NOTE: rb0_inst *is needed* however.
   assign rt0_inst_bf = thr_match_nd & switch_bf & dtu_fcl_retract_d;
//                      | thr_match_ne & dtu_fcl_ntr_s & retract_iferr_d1;

   assign retract_iferr_qual_d1 = retract_iferr_d1 & thr_match_de &
                                  fcl_dtu_inst_vld_d &
                                  ~(dtu_fcl_rollback_g & thr_match_ew);

   dff_s rbe_ff(.din (rb2_inst_d),
	      .q   (rb2_inst_e),
	      .clk (clk),
	      .se  (se), .si(), .so());

   dff_s rte_ff(.din (retract_inst_d),
	      .q   (rt2_inst_e),
	      .clk (clk),
	      .se  (se), .si(), .so());

   dff_s rbd_ff(.din (rb1_inst_s),
	      .q   (rb1_inst_d),
	      .clk (clk),
	      .se  (se), .si(), .so());

   dff_s rtd_ff(.din (rt1_inst_s),
	      .q   (rt1_inst_d),
	      .clk (clk),
	      .se  (se), .si(), .so());
   
   dff_s rbs_ff(.din (rb0_inst_bf),
	      .q   (rb0_inst_s),
	      .clk (clk),
	      .se  (se), .si(), .so());

   // TBD: is this necessary?
   dff_s rts_ff(.din (rt0_inst_bf),
	      .q   (rt0_inst_s),
	      .clk (clk),
	      .se  (se), .si(), .so());

   dff_s rtiferr_ff(.din (retract_iferr_qual_d1),
                  .q   (retract_iferr_e),
                  .clk (clk),
                  .se  (se), .si(), .so());
  
   // mmckeown: Adding this to know if there will be a roll
   // back on this stage, as we need to declare diverged
   // if so, we should reconverge very quickly after a 
   // rollback.
   assign fcl_esl_rb_stg_s = rb_stg_s;

   assign rb_stg_s = (rb0_inst_s | rt0_inst_s) & tm_fd_l |
	                   (rb1_inst_d | rt1_inst_d) & ~tm_fd_l;
   assign rb_stg_d_crit = rb1_inst_d | rt1_inst_d;
   assign rb_stg_e = rb2_inst_e | rt2_inst_e;

   bw_u1_buf_5x UZsize_rbd_buf(.a (rb_stg_d_crit),
                               .z (rb_stg_d));
   
   // determine rollback amount
   assign rb_frome = {4{(rb2_inst_e | rt2_inst_e) & 
                        (inst_vld_e | intr_vld_e)}} & thr_e;
   assign rb_fromd = {4{(rb1_inst_d | rt1_inst_d) & 
                        (inst_vld_d | intr_vld_d)}} & thr_d;
   assign rb_froms = {4{rb_stg_s & inst_vld_s_crit}} & thr_f;   
   assign rb_w2 = rb_frome | rb_fromd;
   assign rb_for_iferr_e = {4{retract_iferr_e}} & thr_e;

//------------------------------   
// Branch Control
//------------------------------
   // final portion of branch evaluation
   wire brtaken_e_l;   
   bw_u1_buf_20x UZsize_bcbf(.z(fcl_dcl_regz_e), 
                             .a(exu_ifu_regz_e));
      
   bw_u1_muxi21_6x UZsize_bcmux(.z(brtaken_e_l), 
                                .d0(dcl_fcl_bcregz0_e), 
                                .d1(dcl_fcl_bcregz1_e), 
                                .s(exu_ifu_regz_e));

   bw_u1_inv_15x UZsize_bcinv(.z(brtaken_e), 
                              .a(brtaken_e_l));

   // Branch is taken in the E stage to thr_e.  Below we check to see
   // if this is the same as the next thread we will switch to

   // isolate non critical section
   bw_u1_buf_5x UZsize_btbuf(.z (brtaken_unq_e),
                             .a (brtaken_e));
   assign brtaken_buf_e = brtaken_unq_e & inst_vld_qual_e & ~kill_curr_e;
   assign fcl_esl_brtaken_e = brtaken_buf_e;

//   assign thr_match_ne_norst = thr_match_ne & ~rst_sw_bf;
//   assign brto_nxtthr_bf  = thr_match_ne & brtaken_e;
   bw_u1_nand2_4x UZsize_btkn_ntl(.a (brtaken_e),
                                  .b (thr_match_ne),
                                  .z (brto_nxtthr_bf_l));

//   bw_u1_inv_8x UZsize_btkn_bf(.a (brto_nxtthr_bf_l),
//                               .z (brto_nxtthr_bf));

   dff_s #(1) br_ff(.din (brtaken_buf_e),
		              .q   (brtaken_m),
		              .clk (clk),
		              .se  (se), .si(), .so());
   assign fcl_esl_brtaken_m = brtaken_m;
   

//----------------------------------------------------------------------
// PC related control
//----------------------------------------------------------------------

   // Choose next IC address
   // IC address is chosen from
   //    1. Next PC assuming no switch 
   //    2. Branch PC if E stage branch is to next thread
   //    3. Saved F stage Thread PC if we switch threads

   assign fcl_icd_index_sel_ifq_bf = allow_ifq_access_icd_bf;
   assign fcl_ifq_grant_bf = allow_ifq_access_icd_bf;

   // Select branch PC
//   assign fcl_fdp_icaddr_sel_br_bf_l = ~(~all_stallreq &
//					                               brto_nxtthr_bf    &
//					                               switch_bf);
//
//   // Select the switch PC from thread PC register
//   assign fcl_fdp_icaddr_sel_swpc_bf_l = ~(~all_stallreq &
//					                                 ~usen_bf &
//					                                 ~brto_nxtthr_bf &
//					                                 switch_bf);
//
//   // Select current thread's next PC or IC write addr (PC/PC+4/I$ wraddr)
//   assign fcl_fdp_icaddr_sel_curr_bf_l = ~(~all_stallreq &
//					                                 ~(stall_f | usep_bf) & 
//					                                 ~switch_bf);
//   
//   assign fcl_fdp_icaddr_sel_ifq_bf_l = ~(all_stallreq |
//					                                (stall_f | usep_bf) & ~switch_bf |
//					                                ~brto_nxtthr_bf & usen_bf &
//					                                (switch_bf | stall_f | usep_bf));
   
   

//   assign sw_or_async_stall = (switch_bf & ~rst_stallreq | rst_sw_bf);
   wire   sw_or_async_stall_l;
   assign rst_stallreq_l = ~rst_stallreq;
   bw_u1_aoi21_4x UZsize_swstl_aoi(.z  (sw_or_async_stall_l),
                                   .a  (rst_sw_bf),
                                   .b1 (switch_bf),
                                   .b2 (rst_stallreq_l));
   assign sw_or_async_stall = ~sw_or_async_stall_l;

//   assign icadr_selbr = sw_or_async_stall & brto_nxtthr_bf;
   assign sw_match_ne_norst = sw_or_async_stall & thr_match_ne;
   bw_u1_nand2_10x UZfix_icad_br(.a (brtaken_e),
                                 .b (sw_match_ne_norst),
                                 .z (icadr_selbr_l));

//   assign icadr_selsw = sw_or_async_stall & ~brto_nxtthr_bf;
   bw_u1_nand2_15x UZfix_icad_sw(.a (brto_nxtthr_bf_l),
                                 .b (sw_or_async_stall),
                                 .z (icadr_selsw_l));
   

   // select next PC
   assign fcl_fdp_pcbf_sel_br_bf_l = icadr_selbr_l;
   assign fcl_fdp_pcbf_sel_swpc_bf_l = icadr_selsw_l ;
   assign fcl_fdp_pcbf_sel_nosw_bf_l = ~sw_or_async_stall_l;

   // Select PC to switch to in the event of a switch
   // No need to protect during scan
   // NOTE: SWL guarantees nextthr_bf is one hot
//   assign fcl_fdp_next_thr_bf_l = rst_stallreq_d1 ? ~rstint_penc :
//                                                    ~dtu_fcl_nextthr_bf;

   wire [3:0] next_thr_bf_l;
   wire       nt_sel_rst;
   assign     nt_sel_rst = rst_stallreq_d1 | rst_tri_en;
   
   bw_u1_muxi21_2x UZfix_nthr_mx0(.z (next_thr_bf_l[0]),
                                  .d0 (dtu_fcl_nextthr_bf[0]),
                                  .d1 (rstint_penc[0]),
                                  .s  (nt_sel_rst));
   bw_u1_muxi21_2x UZfix_nthr_mx1(.z (next_thr_bf_l[1]),
                                  .d0 (dtu_fcl_nextthr_bf[1]),
                                  .d1 (rstint_penc[1]),
                                  .s  (nt_sel_rst));
   bw_u1_muxi21_2x UZfix_nthr_mx2(.z (next_thr_bf_l[2]),
                                  .d0 (dtu_fcl_nextthr_bf[2]),
                                  .d1 (rstint_penc[2]),
                                  .s  (nt_sel_rst));
   bw_u1_muxi21_2x UZfix_nthr_mx3(.z (next_thr_bf_l[3]),
                                  .d0 (dtu_fcl_nextthr_bf[3]),
                                  .d1 (rstint_penc[3]),
                                  .s  (nt_sel_rst));
   assign     fcl_fdp_next_thr_bf_l = next_thr_bf_l;
   

//   assign nextthr_bf_buf = dtu_fcl_nextthr_bf;
   bw_u1_buf_20x UZsize_ntbf0(.a (dtu_fcl_nextthr_bf[0]),
                              .z (nextthr_bf_buf[0]));
   bw_u1_buf_20x UZsize_ntbf1(.a (dtu_fcl_nextthr_bf[1]),
                              .z (nextthr_bf_buf[1]));
   bw_u1_buf_20x UZsize_ntbf2(.a (dtu_fcl_nextthr_bf[2]),
                              .z (nextthr_bf_buf[2]));
   bw_u1_buf_20x UZsize_ntbf3(.a (dtu_fcl_nextthr_bf[3]),
                              .z (nextthr_bf_buf[3]));
   // use 6x
   assign fcl_fdp_next_ctxt_bf_l[2:0] = ~nextthr_bf_buf[2:0] | {3{rst_tri_en}};
   assign fcl_fdp_next_ctxt_bf_l[3] = ~nextthr_bf_buf[3] & ~rst_tri_en;

//   assign nextthr_final_bf = switch_bf ? dtu_fcl_nextthr_bf : thr_f;
   wire [3:0] nextthr_final_bf_l;
   bw_u1_muxi21_2x UZfix_ntfmux0(.z  (nextthr_final_bf_l[0]),
                                .d0 (thr_f[0]),
                                .d1 (dtu_fcl_nextthr_bf[0]),
                                .s  (switch_bf));
   bw_u1_inv_8x UZsize_ntfin_buf0(.z (nextthr_final_bf[0]),
                                 .a (nextthr_final_bf_l[0]));

   bw_u1_muxi21_2x UZfix_ntfmux1(.z  (nextthr_final_bf_l[1]),
                                .d0 (thr_f[1]),
                                .d1 (dtu_fcl_nextthr_bf[1]),
                                .s  (switch_bf));
   bw_u1_inv_8x UZsize_ntfin_buf1(.z (nextthr_final_bf[1]),
                                 .a (nextthr_final_bf_l[1]));

   bw_u1_muxi21_2x UZfix_ntfmux2(.z  (nextthr_final_bf_l[2]),
                                .d0 (thr_f[2]),
                                .d1 (dtu_fcl_nextthr_bf[2]),
                                .s  (switch_bf));
   bw_u1_inv_8x UZsize_ntfin_buf2(.z (nextthr_final_bf[2]),
                                 .a (nextthr_final_bf_l[2]));

   bw_u1_muxi21_2x UZfix_ntfmux3(.z  (nextthr_final_bf_l[3]),
                                .d0 (thr_f[3]),
                                .d1 (dtu_fcl_nextthr_bf[3]),
                                .s  (switch_bf));
   bw_u1_inv_8x UZsize_ntfin_buf3(.z (nextthr_final_bf[3]),
                                 .a (nextthr_final_bf_l[3]));
   
   
   // decode trap thread
   dff_s #(2) ld_trp_reg(.din ({tlu_ifu_trappc_vld_w1,
                              tlu_ifu_trapnpc_vld_w1}),
                       .q   ({trappc_vld_w2,
                              trapnpc_vld_w2}),
                       .clk (clk), .se(se), .si(), .so());

   dff_s #(2) trp_tid_reg(.din (tlu_ifu_trap_tid_w1[1:0]),
                        .q   (trap_tid_w2[1:0]),
                        .clk (clk), .se(se), .si(), .so());
   
   assign trap_thr[0] = ~trap_tid_w2[1] & ~trap_tid_w2[0];
   assign trap_thr[1] = ~trap_tid_w2[1] &  trap_tid_w2[0];
   assign trap_thr[2] =  trap_tid_w2[1] & ~trap_tid_w2[0];
   assign trap_thr[3] =  trap_tid_w2[1] &  trap_tid_w2[0];

   assign load_tpc[3:0] = {4{trappc_vld_w2}} & trap_thr |
	                   rb_w2 |
	                   {4{rb_stg_w | ims_flush_coll_w}} & thr_w |
//                     {4{dec_fcl_kill4sta_e}} & thr_e |
	                   {4{flush_sonly_qual_m}} & thr_m;
   // mmckeown: determine if trap this cycle
   assign fcl_esl_thr_trap_bf = load_tpc;

   assign load_bpc[3:0] = {4{brtaken_buf_e}} & thr_e;
   assign load_pcp4[3:0] = {4{~part_stall_thisthr_f &
                              ~iferrto_thisthr_d1 |
                              arst_vld_f |
                              async_intr_vld_s}}     & thr_f;

   always @ (/*AUTOSENSE*/load_bpc or load_pcp4 or load_tpc)
     begin
//	      if (fcl_reset)
//	        begin // RESET PC is loaded to T0
//	           fcl_fdp_tpcbf_sel_old_bf_l = 4'b0001;
//	           fcl_fdp_tpcbf_sel_pcp4_bf_l = 4'b1110;
//	           fcl_fdp_tpcbf_sel_trap_bf_l = 4'b1111;
//	           fcl_fdp_tpcbf_sel_brpc_bf_l = 4'b1111;
//	        end // if (reset)
//	      else 
//	        begin
	      fcl_fdp_tpcbf_sel_old_bf_l = (load_bpc | load_tpc | load_pcp4);
	      fcl_fdp_tpcbf_sel_brpc_bf_l = ~load_bpc | load_tpc | load_pcp4;
	      fcl_fdp_tpcbf_sel_pcp4_bf_l = ~load_pcp4 | load_tpc;
	      fcl_fdp_tpcbf_sel_trap_bf_l = ~load_tpc;
     end // always @ (...

   // Track correctible errors
   assign irf_ce_m = exu_ifu_ecc_ce_m & ~trap_m & inst_vld_m & ~kill_curr_m;
   dff_s #(1) irfcew_ff(.din (irf_ce_m),
		                .q   (irf_ce_w),
		                .clk (clk), .se(se), .si(), .so());

   // track if ldhit was actually a miss
   // D and S stage are rolled back through the normal D stage retract
   // process.  
   assign mark4rb_d = lsu_ifu_dc_parity_error_w2 & thr_match_dw2 & 
                      (inst_vld_d | intr_vld_d);
   assign mark4rb_s = lsu_ifu_dc_parity_error_w2 & thr_match_fw2 & 
                      (inst_vld_s | intr_vld_s);

   assign mark4rb_e = lsu_ifu_dc_parity_error_w2 & thr_match_ew2 & 
                      (inst_vld_e | intr_vld_e) & 
                        ~dtu_inst_anull_e & ~kill_curr_e;

   dff_s #(2) markrb_reg(.din ({mark4rb_m,
                              mark4rb_e}),
                       .q   ({mark4rb_w,
                              mark4rb_m}),
                       .clk (clk),
                       .se  (se), .si(), .so());
   
   // Rollback from W on irf/frf ce and on a dcache parity error
   assign rb_stg_w = irf_ce_w & inst_vld_w & no_iftrap_w | 
	                   ffu_ifu_fst_ce_w & inst_vld_w & no_iftrap_w |
                     rb_intr_w & intr_vld_w |
                     mark4rb_w |
                     fcl_dtu_resum_thr_w | 
		                 fcl_dtu_nuke_thr_w;

   // flush after hardware micro trap
//   assign ifu_tlu_flush_w = irf_ce_w | fcl_dtu_nuke_thr_w | mark4rb_w |
//                            fcl_dtu_resum_thr_w;
   // very critical
   assign ifu_tlu_flush_m = (exu_ifu_ecc_ce_m & inst_vld_m & ~trap_m |
                             (resumint_m | nuke_thr_m) & 
                             intr_vld_m & ~rstint_m |
                             rb_intr_m | 
                             mark4rb_m);
   assign utrap_flush_m =  ifu_tlu_flush_m & ~kill_local_m;
   dff_s #(1) flw_ff(.din (utrap_flush_m),
                   .q   (utrap_flush_w),
                   .clk (clk), .se(se), .si(), .so());
   assign ifu_tlu_flush_w = utrap_flush_w;
   assign fcl_swl_flush_w =  (irf_ce_w & inst_vld_w & no_iftrap_w | 
                              rb_intr_w & intr_vld_w |
                              mark4rb_w |
                              fcl_dtu_resum_thr_w | 
		                          fcl_dtu_nuke_thr_w);

   // tells swl to flush and then wake up
   assign fcl_swl_flush_wake_w = fcl_swl_flush_w & ~mark4rb_w;
   
   // if the same instruction keeps hitting ce's disable ce detection
   // count how many ce's occur to a given thread
   assign any_ce_w = ffu_ifu_fst_ce_w | irf_ce_w;
   
   assign ce_cnt1_nxt = (({4{any_ce_w & inst_vld_w}} & thr_w & 
                          ce_cnt0) ^ ce_cnt1) & ~ce_cnt_rst;
   assign ce_cnt0_nxt = (({4{any_ce_w & inst_vld_w}} & thr_w) ^ 
                         ce_cnt0) & ~ce_cnt_rst;

   assign ce_cnt_rst = thr_w & {4{inst_vld_w & ~any_ce_w}} | {4{fcl_reset}};

   dff_s #(8) cecnt_reg(.din ({ce_cnt1_nxt, ce_cnt0_nxt}),
                      .q   ({ce_cnt1, ce_cnt0}),
                      .clk (clk),
                      .se(se), .si(), .so());

   // find the count for the current d stage thread
   assign ce_val1_d = (thr_d[0] & ce_cnt1[0] | 
                       thr_d[1] & ce_cnt1[1] | 
                       thr_d[2] & ce_cnt1[2] | 
                       thr_d[3] & ce_cnt1[3]);

   assign ce_val0_d = (thr_d[0] & ce_cnt0[0] | 
                       thr_d[1] & ce_cnt0[1] | 
                       thr_d[2] & ce_cnt0[2] | 
                       thr_d[3] & ce_cnt0[3]);

   // if count hits 3 disable ce's
   assign disable_ce_d = ce_val1_d & ce_val0_d;

   dff_s #(1) disce_ff(.din (disable_ce_d),
                     .q   (disable_ce_e),
                     .clk (clk), .se(se), .si(), .so());
   assign ifu_exu_disable_ce_e = disable_ce_e;
   
   // select error/trap/utrap rollback PC
   assign fcl_fdp_trrbpc_sel_trap_bf_l = 
		                ~({4{trappc_vld_w2}} & trap_thr);

   assign fcl_fdp_trrbpc_sel_err_bf_l = 
                  ({4{trappc_vld_w2}} & trap_thr) |
	                 ~({4{rb_stg_w}} & thr_w);
   
   assign fcl_fdp_trrbpc_sel_rb_bf_l = 
                  ({4{trappc_vld_w2}} & trap_thr) |
		               ({4{rb_stg_w}} & thr_w) |		   
	                ~(rb_frome & rb_fromd);
   
   assign fcl_fdp_trrbpc_sel_pcs_bf_l = 
                 ({4{trappc_vld_w2}} & trap_thr) | 
		               ({4{rb_stg_w}} & thr_w) |		   
	                 (rb_frome & rb_fromd);
   
   // select next S stage Thr PC
   assign fcl_fdp_nextpcs_sel_pce_f_l = ~rb_frome;
   assign fcl_fdp_nextpcs_sel_pcd_f_l = rb_frome | ~rb_fromd;
   assign fcl_fdp_nextpcs_sel_pcf_f_l = rb_frome | rb_fromd |
	                                ~(thr_f & {4{~part_stall_thisthr_f &
                                               ~iferrto_thisthr_d1 |
                                               arst_vld_f |
                                               async_intr_vld_s}});
   assign fcl_fdp_nextpcs_sel_pcs_f_l = rb_frome | rb_fromd | 
	                                (thr_f & {4{~part_stall_thisthr_f &
                                              ~iferrto_thisthr_d1 |
                                              arst_vld_f |
                                              async_intr_vld_s}});
   
   // next S2 stage pc and npc select
   assign thr_f_dec[3:1] = thr_f_crit[3:1] & {3{~rst_tri_en}};
   assign thr_f_dec[0] = thr_f_crit[0] | rst_tri_en;
   assign fcl_fdp_thr_s2_l = ~thr_f_dec;     // thr_f = thr_s2


   // Select NextPC from
   //    1. Trap NextPC (if the tnpc is valid)
   //    2. reset PC
   //    3. incremented PC (PC+4)
   //    4. old PC (in the event of a stall)

   // Load the trap PC to the BF stage NPC.  (The BF stage NPC is used
   // only for storing the next PC from the TLU
   assign fcl_fdp_thrtnpc_sel_tnpc_l = ~({4{trapnpc_vld_w2}} & trap_thr);

   assign fcl_fdp_thrtnpc_sel_npcw_l = ({4{trapnpc_vld_w2}} & trap_thr) |
	                                       ~({4{rb_stg_w}} & thr_w);

   assign fcl_fdp_thrtnpc_sel_pcf_l = ({4{trapnpc_vld_w2}} & trap_thr) |
	                                      ({4{rb_stg_w}} & thr_w) |
	                                        (~({4{ims_flush_coll_w}} & thr_w) &
                                           ~({4{flush_sonly_qual_m}} & thr_m));
                                       //   {4{dec_fcl_kill4sta_e}} & thr_e);
   
   assign fcl_fdp_thrtnpc_sel_old_l = ({4{trapnpc_vld_w2}} & trap_thr) |
	                                      ({4{rb_stg_w}} & thr_w) |
	                                      ({4{ims_flush_coll_w}} & thr_w) |
                                        ({4{flush_sonly_qual_m}} & thr_m);
                                         // {4{dec_fcl_kill4sta_e}} & thr_e);
   
   assign ntpc_vld_nxt = fcl_fdp_thrtnpc_sel_old_l | 
	                       ntpc_vld & ({4{(part_stall_thisthr_f |
                                         iferrto_thisthr_d1) & 
                                        ~arst_vld_f &
                                        ~async_intr_vld_s}} | ~thr_f) &
                                  ~({4{trappc_vld_w2}} & trap_thr);
   
   dffr_s #(4) ntpcv_reg(.din  (ntpc_vld_nxt),
		     .clk  (clk),
		     .q    (ntpc_vld),
		     .rst  (fcl_reset),
		     .se   (se), .si(), .so());

   assign ntpc_thisthr = (thr_f[0] & ntpc_vld[0] |
			                    thr_f[1] & ntpc_vld[1] |
			                    thr_f[2] & ntpc_vld[2] |
			                    thr_f[3] & ntpc_vld[3]);

//   assign fcl_fdp_noswpc_sel_rst_l_bf = 1'b1; 
   assign fcl_fdp_noswpc_sel_tnpc_l_bf = ~ntpc_thisthr;
   assign fcl_fdp_noswpc_sel_old_l_bf = ntpc_thisthr | inst_vld_f | arst_vld_f;
   assign fcl_fdp_noswpc_sel_inc_l_bf = ntpc_thisthr | ~inst_vld_f & ~arst_vld_f;
   
   
   // Don't need noswpc_sel_old anymore (this is always 1)
//   always @(/*AUTOSENSE*/ntpc_vld or reset or thr_f)
//     begin
//	      if (reset)
//	        begin
//	           fcl_fdp_noswpc_sel_tnpc_l_bf = 1'b1;
//	           fcl_fdp_noswpc_sel_rst_l_bf = 1'b0;	
//	           fcl_fdp_noswpc_sel_inc_l_bf = 1'b1;
//	           fcl_fdp_noswpc_sel_old_l_bf = 1'b1;
//	        end
//	      else if ((ntpc_vld & thr_f) != 4'b0000)
//	        begin
//	           fcl_fdp_noswpc_sel_tnpc_l_bf = 1'b0;
//	           fcl_fdp_noswpc_sel_rst_l_bf = 1'b1;	
//	           fcl_fdp_noswpc_sel_inc_l_bf = 1'b1;
//	           fcl_fdp_noswpc_sel_old_l_bf = 1'b1;	
//	        end // if ((ntpc_vld & thr_f) != 4'b0000)
////	else if (ely_stall_thisthr_f)
////	  begin
////	     fcl_fdp_noswpc_sel_tnpc_l_bf = 1'b1;
////	     fcl_fdp_noswpc_sel_rst_l_bf = 1'b1;	
////	     fcl_fdp_noswpc_sel_inc_l_bf = 1'b1;
////	     fcl_fdp_noswpc_sel_old_l_bf = 1'b0;	     
////	  end // if (ely_stall_thisthr_f)
//	      else 
//	        begin
//	           fcl_fdp_noswpc_sel_tnpc_l_bf = 1'b1;
//	           fcl_fdp_noswpc_sel_rst_l_bf = 1'b1;	
//	           fcl_fdp_noswpc_sel_inc_l_bf = 1'b0;
//	           fcl_fdp_noswpc_sel_old_l_bf = 1'b1;	
//	        end // else: 
//	      
//     end // always @ (...

   // NOTE: direct branch vs indirect branch select goes from dtu to fdp

//----------------------------------------------------------------------
// Instruction Register Related Control
//----------------------------------------------------------------------

   // use NIR if no read previously
   assign fcl_fdp_usenir_sel_nir_s1 = usenir_s1;


   assign  fcl_fdp_inst_sel_nop_s_l = ~(ely_stall_thisthr_f | 
                                        ~inst_vld_s_crit | 
                                        force_intr_s | 
                                        immu_fault_f);
   
   assign  fcl_fdp_inst_sel_switch_s_l = ~switch_s2 |
                                        (ely_stall_thisthr_f | 
                                         ~inst_vld_s_crit | 
                                         force_intr_s | 
                                         immu_fault_f);

   assign  fcl_fdp_inst_sel_nir_s_l = ~usenir_s1 |
                                        (switch_s2 |
                                         ely_stall_thisthr_f | 
                                         ~inst_vld_s_crit | 
                                         force_intr_s | 
                                         immu_fault_f);
   
   assign  fcl_fdp_inst_sel_curr_s_l = (usenir_s1 |
                                        switch_s2 |
                                        ely_stall_thisthr_f | 
                                        ~inst_vld_s_crit | 
                                        force_intr_s | 
                                        immu_fault_f);
   
   
   // Instruction Output Mux
//   always @ (/*AUTOSENSE*/ely_stall_thisthr_f or force_intr_s
//             or immu_fault_f or inst_vld_s_crit or switch_s2
//             or usenir_s1)
//     begin
//	      if (ely_stall_thisthr_f | ~inst_vld_s_crit | force_intr_s | 
//            immu_fault_f) 
//	        begin // stalled or imiss
//	           fcl_fdp_inst_sel_nop_s_l = 1'b0;
//	           fcl_fdp_inst_sel_switch_s_l = 1'b1;
//	           fcl_fdp_inst_sel_nir_s_l = 1'b1;
//	           fcl_fdp_inst_sel_curr_s_l = 1'b1;
//	        end
//	      else if (switch_s2) 
//	        begin
//	           fcl_fdp_inst_sel_nop_s_l = 1'b1;
//	           fcl_fdp_inst_sel_switch_s_l = 1'b0;
//	           fcl_fdp_inst_sel_nir_s_l = 1'b1;
//	           fcl_fdp_inst_sel_curr_s_l = 1'b1;
//	        end
//	      else if (usenir_s1) 
//	        begin
//	           fcl_fdp_inst_sel_nop_s_l = 1'b1;
//	           fcl_fdp_inst_sel_switch_s_l = 1'b1;
//	           fcl_fdp_inst_sel_nir_s_l = 1'b0;
//	           fcl_fdp_inst_sel_curr_s_l = 1'b1;
//	        end
//	      else
//	        begin
//	           fcl_fdp_inst_sel_nop_s_l = 1'b1;
//	           fcl_fdp_inst_sel_switch_s_l = 1'b1;
//	           fcl_fdp_inst_sel_nir_s_l = 1'b1;
//	           fcl_fdp_inst_sel_curr_s_l = 1'b0;
//	        end // else: !if(switch_s2 | stall_s1)
//     end // always @ (...

   // thread IR input muxes
   assign fcl_fdp_tinst_sel_rb_s_l   = ~rb_w2;
   assign fcl_fdp_tinst_sel_ifq_s_l  = rb_w2 | ~ifq_fcl_fill_thr;
   assign fcl_fdp_tinst_sel_curr_s_l = ~val_thr_s1 | rb_w2 | ifq_fcl_fill_thr; 
   assign fcl_fdp_tinst_sel_old_s_l  = val_thr_s1 | rb_w2 | ifq_fcl_fill_thr; 

   // Select rollback instruction
   assign fcl_fdp_rbinst_sel_inste_s = {4{rb2_inst_e | rt2_inst_e}} & 
                                       thr_e;

   // thread NIR input muxes  (2:1 no need to protect)
   assign fcl_fdp_thr_s1_l = ~thr_s1 | {4{stall_s1}};

   // select appropriate NIR
   assign dec_thr_s1_l[0] = ~(thr_s1[0] | rst_tri_en);
   assign dec_thr_s1_l[3:1] = ~(thr_s1[3:1] & {3{~rst_tri_en}});
   
   assign fcl_fdp_nirthr_s1_l = dec_thr_s1_l; 
   

//--------------------
// rdsr data to exu
//--------------------   

   dff_s #(1) pcrsr_ff(.din  (dec_fcl_rdsr_sel_pc_d),
		               .clk  (clk),
		               .q    (rdsr_sel_pc_e),
		               .se   (se), .si(), .so());
   dff_s #(1) thrrsr_ff(.din  (dec_fcl_rdsr_sel_thr_d),
		                .clk  (clk),
		                .q    (rdsr_sel_thr_e),
		                .se   (se), .si(), .so());
   // make sure they are exclusive
   assign fcl_fdp_rdsr_sel_pc_e_l = ~rdsr_sel_pc_e;
   assign fcl_fdp_rdsr_sel_thr_e_l = ~(~rdsr_sel_pc_e & rdsr_sel_thr_e);
   assign fcl_fdp_rdsr_sel_ver_e_l = ~(~rdsr_sel_pc_e & ~rdsr_sel_thr_e);

//--------------------------------------------------------------
// Reg file control
//--------------------------------------------------------------

// Some decode is done here since these signals are in the crit path

   // Regfile enables are only power saving features.  So they don't
   // have to be exact, as long as they are on, a super set of when
   // they need to be on.

   // mmckeown: inst_vld_f not high when doing a replay, so we need
   //           to add this condition

   // Enable rs3 if store or atomic or mov
   assign ifu_exu_ren3_s =  (inst_vld_f | (config_dtu_esl_en & inst_vld_s2_ed))
                            & fdp_fcl_op_s[1] & fdp_fcl_op3_s[2] &
	                         (fdp_fcl_op_s[0] | fdp_fcl_op3_s[5]);

   // enable rs2 if i=0 and !branch or CAS
   // cas not fully decoded;  i=inst[13];
   assign ifu_exu_ren2_s = (inst_vld_f | (config_dtu_esl_en & inst_vld_s2_ed)) 
                           & fdp_fcl_op_s[1] &
			               (~fdp_fcl_ibit_s | fdp_fcl_op_s[0] & fdp_fcl_op3_s[5]);

   // rs1 is read if this is not (a branch on cc or no-op/sethi)
   assign ifu_exu_ren1_s = (inst_vld_f | (config_dtu_esl_en & inst_vld_s2_ed)) 
                           & (fdp_fcl_op_s[1] |     // not br/call
			               fdp_fcl_op3_s[4] & fdp_fcl_op3_s[3]);  // BPR

   //-------------------------------------
   // Generate oddwin signal for rs and rd
   //-------------------------------------
   assign fcl_fdp_oddwin_s = (exu_ifu_oddwin_s[0] & thr_f[0] |
                              exu_ifu_oddwin_s[1] & thr_f[1] |
                              exu_ifu_oddwin_s[2] & thr_f[2] |
                              exu_ifu_oddwin_s[3] & thr_f[3]);

   dff_s #(1) oddwin_ff(.din (fcl_fdp_oddwin_s),
		                  .clk (clk),
		                  .q   (fcl_imd_oddwin_d),
		                  .se  (se), .si(), .so());
   

   sink #(2) s0(.in (sas_thrid_w));
endmodule // sparc_ifu_fcl
