// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sparc_ifu.v
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
//  Description:
//    The instruction fetch unit (IFU) contains the icache, ifq and
//    fetch dp.
*/

////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include "sys.h"
`include "iop.h"
`include "ifu.tmp.h"
`include "lsu.tmp.h"

`include "define.tmp.h"

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module sparc_ifu (/*AUTOARG*/
   // Outputs
   `ifndef NO_RTL_CSM
   ifu_lsu_pcxcsm_e,
   `endif


   // sram wrapper interface
   rtap_srams_bist_command,
   rtap_srams_bist_data,
   srams_rtap_data,
   
   // mbist_icache_fail, mbist_done,
   // mbist_dcache_write, mbist_dcache_word, mbist_dcache_way,
   // mbist_dcache_read, mbist_dcache_index, mbist_dcache_fail,


   ifu_tlu_ttype_m, ifu_tlu_trap_m, ifu_tlu_thrid_e, ifu_tlu_thrid_d,
   ifu_tlu_sraddr_d_v2, ifu_tlu_sraddr_d, ifu_tlu_sir_inst_m,
   ifu_tlu_sftint_m, ifu_tlu_rstint_m, ifu_tlu_rsr_inst_d,
   ifu_tlu_retry_inst_d, ifu_tlu_priv_violtn_m, ifu_tlu_pc_oor_e,
   ifu_tlu_pc_m, ifu_tlu_npc_m, ifu_tlu_mb_inst_e, ifu_tlu_l2imiss,
   ifu_tlu_itlb_done, ifu_tlu_inst_vld_m, ifu_tlu_immu_miss_m,
   ifu_tlu_imm_asi_d, ifu_tlu_icmiss_e, ifu_tlu_hwint_m,
   ifu_tlu_flush_m, ifu_tlu_flsh_inst_e, ifu_tlu_done_inst_d,
   ifu_tlu_alt_space_d, ifu_spu_trap_ack, ifu_spu_nceen,
   ifu_spu_inst_vld_w, ifu_mmu_trap_m, ifu_lsu_wsr_inst_d,
   ifu_lsu_swap_e, ifu_lsu_st_inst_e, ifu_lsu_sign_ext_e,
   ifu_lsu_rd_e, ifu_lsu_pref_inst_e, ifu_lsu_pcxreq_d,
   ifu_lsu_pcxpkt_e, ifu_lsu_nceen, ifu_lsu_memref_d,
   ifu_lsu_ldxa_tid_w2, ifu_lsu_ldxa_illgl_va_w2,
   ifu_lsu_ldxa_data_w2, ifu_lsu_ldxa_data_vld_w2, ifu_lsu_ldstub_e,
   ifu_lsu_ldst_size_e, ifu_lsu_ldst_fp_e, ifu_lsu_ldst_dbl_e,
   ifu_lsu_ld_inst_e, ifu_lsu_inv_clear, ifu_lsu_imm_asi_vld_d,
   ifu_lsu_imm_asi_d, ifu_lsu_ibuf_busy, ifu_lsu_fwd_wr_ack,
   ifu_lsu_fwd_data_vld, ifu_lsu_error_inj, ifu_lsu_destid_s,
   ifu_lsu_casa_e, ifu_lsu_asi_rd_unc, ifu_lsu_asi_ack,
   ifu_lsu_alt_space_d, ifu_ffu_visop_d, ifu_ffu_stfsr_d,
   ifu_ffu_quad_op_e, ifu_ffu_mvcnd_m, ifu_ffu_ldxfsr_d,
   ifu_ffu_ldst_size_d, ifu_ffu_ldfsr_d, ifu_ffu_inj_frferr,
   ifu_ffu_fst_d, ifu_ffu_frs2_d, ifu_ffu_frs1_d, ifu_ffu_frd_d,
   ifu_ffu_fpopcode_d, ifu_ffu_fpop2_d, ifu_ffu_fpop1_d,
   ifu_ffu_fld_d, ifu_ffu_fcc_num_d, ifu_exu_wsr_inst_d,
   ifu_exu_wen_d, ifu_exu_useimm_d, ifu_exu_usecin_d,
   ifu_exu_use_rsr_e_l, ifu_exu_tv_d, ifu_exu_ttype_vld_m,
   ifu_exu_tid_s2, ifu_exu_tcc_e, ifu_exu_tagop_d, ifu_exu_shiftop_d,
   ifu_exu_sethi_inst_d, ifu_exu_setcc_d, ifu_exu_saved_e,
   ifu_exu_save_d, ifu_exu_rs3o_vld_d, ifu_exu_rs3e_vld_d,
   ifu_exu_rs3_s, ifu_exu_rs2_vld_d, ifu_exu_rs2_s,
   ifu_exu_rs1_vld_d, ifu_exu_rs1_s, ifu_exu_return_d,
   ifu_exu_restored_e, ifu_exu_restore_d, ifu_exu_ren3_s,
   ifu_exu_ren2_s, ifu_exu_ren1_s, ifu_exu_rd_ifusr_e,
   ifu_exu_rd_ffusr_e, ifu_exu_rd_exusr_e, ifu_exu_rd_d,
   ifu_exu_range_check_other_d, ifu_exu_range_check_jlret_d,
   ifu_exu_pcver_e, ifu_exu_pc_d, ifu_exu_nceen_e, ifu_exu_muls_d,
   ifu_exu_kill_e, ifu_exu_invert_d, ifu_exu_inst_vld_w,
   ifu_exu_inst_vld_e, ifu_exu_inj_irferr, ifu_exu_imm_data_d,
   ifu_exu_ialign_d, ifu_exu_flushw_e, ifu_exu_enshift_d,
   ifu_exu_ecc_mask, ifu_exu_dontmv_regz1_e, ifu_exu_dontmv_regz0_e,
   ifu_exu_disable_ce_e, ifu_exu_dbrinst_d, ifu_exu_casa_d,
   ifu_exu_aluop_d, ifu_exu_addr_mask_d,
   // so0, short_so0, short_so1,
   ifu_tlu_inst_vld_w, ifu_tlu_flush_w, ifu_lsu_alt_space_e,
   ifu_tlu_ttype_vld_m, ifu_exu_muldivop_d, ifu_lsu_thrid_s,
   // mbist_write_data,
   // Inputs
   `ifndef NO_RTL_CSM
   tlu_itlb_csm_rd_g, tlu_itlb_tte_csm_w2,
   tlu_itlb_wr_csm_sel_g,

   cfg_ifu_csm_itlb_state, cfg_ifu_csm_itlb_chipid,cfg_ifu_csm_itlb_x,
   cfg_ifu_csm_itlb_y, cfg_ifu_csm_itlb_hdid,cfg_ifu_csm_itlb_hd_size,
   cfg_ifu_csm_itlb_sdid,cfg_ifu_csm_itlb_lsid,

   `endif

   tlu_lsu_redmode, tlu_lsu_pstate_priv, tlu_lsu_pstate_am,
   tlu_itlb_wr_vld_g, tlu_itlb_tag_rd_g, tlu_itlb_invalidate_all_g,
   tlu_itlb_dmp_vld_g, tlu_itlb_dmp_nctxt_g, tlu_itlb_dmp_actxt_g,
   tlu_itlb_data_rd_g, tlu_ifu_trappc_w2, tlu_ifu_trappc_vld_w1,
   tlu_ifu_trapnpc_w2, tlu_ifu_trapnpc_vld_w1, tlu_ifu_trap_tid_w1,
   tlu_ifu_sftint_vld, tlu_ifu_rstthr_i2, tlu_ifu_rstint_i2,
   tlu_ifu_resumint_i2, tlu_ifu_rerr_vld, tlu_ifu_pstate_pef,
   tlu_ifu_pstate_ie, tlu_ifu_nukeint_i2, tlu_ifu_hwint_i3,
   tlu_ifu_hintp_vld, tlu_ifu_flush_pipe_w, tlu_idtlb_dmp_thrid_g,
   tlu_hpstate_priv, tlu_hpstate_ibe, tlu_hpstate_enb, 
   // testmode_l,
   spu_ifu_unc_err_w1, spu_ifu_ttype_w2, spu_ifu_ttype_vld_w2,
   spu_ifu_ttype_tid_w2, spu_ifu_mamem_err_w1, spu_ifu_int_w2,
   spu_ifu_err_addr_w2, spu_ifu_corr_err_w2, sehold, se, rclk,

   // mbist_userdata_mode, mbist_stop_on_next_fail, mbist_stop_on_fail,
   // mbist_start, mbist_loop_on_address, mbist_loop_mode,
   // mbist_dcache_data_in, mbist_bisi_mode, 

   lsu_t3_pctxt_state, lsu_t2_pctxt_state, lsu_t1_pctxt_state, lsu_t0_pctxt_state,
   lsu_pid_state3, lsu_pid_state2, lsu_pid_state1, lsu_pid_state0,
   lsu_ifu_t3_tlz, lsu_ifu_t2_tlz, lsu_ifu_t1_tlz, lsu_ifu_t0_tlz,
   lsu_ifu_stxa_data, lsu_ifu_stbcnt3, lsu_ifu_stbcnt2,
   lsu_ifu_stbcnt1, lsu_ifu_stbcnt0, lsu_ifu_stallreq,
   lsu_ifu_quad_asi_e, lsu_ifu_pcxpkt_ack_d,
   lsu_ifu_ldsta_internal_e, lsu_ifu_ldst_miss_g, lsu_ifu_ldst_cmplt,
   lsu_ifu_ld_pcxpkt_vld, lsu_ifu_ld_pcxpkt_tid,
   lsu_ifu_ld_icache_index, lsu_ifu_l2_unc_error,
   lsu_ifu_l2_corr_error, lsu_ifu_io_error, lsu_ifu_inj_ack,
   lsu_ifu_icache_en, lsu_ifu_error_tid, lsu_ifu_err_addr,
   lsu_ifu_dtlb_tag_ue, lsu_ifu_dtlb_data_ue, lsu_ifu_dtlb_data_su,
   lsu_ifu_direct_map_l1, lsu_ifu_dcache_tag_perror,
   lsu_ifu_dcache_data_perror, lsu_ifu_dc_parity_error_w2,
   lsu_ifu_cpxpkt_i1, lsu_ifu_asi_vld, lsu_ifu_asi_thrid,
   lsu_ifu_asi_state, lsu_ifu_asi_load, lsu_ifu_asi_addr,
   lsu_ifu_addr_real_l, grst_l, gdbginit_l, ffu_ifu_tid_w2,
   ffu_ifu_stallreq, ffu_ifu_inj_ack, ffu_ifu_fst_ce_w,
   ffu_ifu_fpop_done_w2, ffu_ifu_err_synd_w2, ffu_ifu_err_reg_w2,
   ffu_ifu_ecc_ue_w2, ffu_ifu_ecc_ce_w2, ffu_ifu_cc_w2,
   ffu_ifu_cc_vld_w2, exu_ifu_va_oor_m, exu_ifu_spill_e,
   exu_ifu_regz_e, exu_ifu_regn_e, exu_ifu_oddwin_s,
   exu_ifu_longop_done_g, exu_ifu_inj_ack, exu_ifu_err_synd_m,
   exu_ifu_err_reg_m, exu_ifu_ecc_ue_m, exu_ifu_ecc_ce_m,
   exu_ifu_cc_d, exu_ifu_brpc_e, 
   // efc_spc_ifuse_dshift,
   // efc_spc_ifuse_data, efc_spc_ifuse_ashift, efc_spc_fuse_clk2,
   // efc_spc_fuse_clk1,
   const_maskid, const_cpuid, arst_l,
   mem_write_disable, mux_drive_disable, exu_tlu_wsr_data_m,
   lsu_ictag_mrgn, lsu_idtlb_mrgn, 
   // si0, short_si0, short_si1,
   tlu_itlb_tte_tag_w2, tlu_itlb_tte_data_w2,
   tlu_itlb_rw_index_vld_g, tlu_itlb_rw_index_g, tlu_idtlb_dmp_key_g,
   tlu_itlb_dmp_all_g, lsu_sscan_data, tlu_sscan_data,
   config_dtu_esl_en, config_dtu_esl_sync_method,
   config_esl_lfsr_seed, config_esl_lfsr_ld, config_esl_pc_diff_thresh,
   config_esl_counter_timeout,

   // trin
   core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data


   );


   input [2:0] 	  exu_tlu_wsr_data_m;
   input [3:0]    lsu_ictag_mrgn;
   input [7:0]    lsu_idtlb_mrgn;

   // eco 5362
   output         ifu_exu_addr_mask_d;


   // scan ports

   // trin: removing scan ports
   // input                si0, short_si0,short_si1;
   // output               so0,short_so0,short_so1;
   wire si0 = 1'b0;
   wire short_si0 = 1'b0;
   wire short_si1 = 1'b0;
   wire so0,short_so0,short_so1;

   output         ifu_tlu_inst_vld_w;	// From fcl of sparc_ifu_fcl.v
   output         ifu_tlu_flush_w;	  // From fcl of sparc_ifu_fcl.v
   output         ifu_lsu_alt_space_e;    // From dec of sparc_ifu_dec.v
   output         ifu_tlu_ttype_vld_m;// From fcl of sparc_ifu_fcl.v
   output [4:0]   ifu_exu_muldivop_d;
   output [1:0]   ifu_lsu_thrid_s;

   // itlb inputs
   input [58:0]   tlu_itlb_tte_tag_w2;
   input [42:0]   tlu_itlb_tte_data_w2;
   input          tlu_itlb_rw_index_vld_g;
   input [5:0]    tlu_itlb_rw_index_g;
   input [40:0]   tlu_idtlb_dmp_key_g;
   input          tlu_itlb_dmp_all_g;

   // sscan rename
   input [15:0]   lsu_sscan_data;
   input [62:0]   tlu_sscan_data;

   // output [7:0]   mbist_write_data;     // From mbist of sparc_ifu_mbist.v

   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input                arst_l;                 // To swl of sparc_ifu_swl.v, ...
   input [3:0]          const_cpuid;            // To swl of sparc_ifu_swl.v, ...
   input [7:0]          const_maskid;           // To fdp of sparc_ifu_fdp.v
   // input                rtap_sscan_se;           // To sscan of sparc_ifu_sscan.v
   // input                ctu_tck;                // To sscan of sparc_ifu_sscan.v

   input [47:0]         exu_ifu_brpc_e;         // To fdp of sparc_ifu_fdp.v
   input [7:0]          exu_ifu_cc_d;           // To dcl of sparc_ifu_dcl.v
   input                exu_ifu_ecc_ce_m;       // To fcl of sparc_ifu_fcl.v, ...
   input                exu_ifu_ecc_ue_m;       // To errctl of sparc_ifu_errctl.v
   input [7:0]          exu_ifu_err_reg_m;      // To errdp of sparc_ifu_errdp.v
   input [7:0]          exu_ifu_err_synd_m;     // To errdp of sparc_ifu_errdp.v
   input                exu_ifu_inj_ack;        // To errctl of sparc_ifu_errctl.v
   input [3:0]          exu_ifu_longop_done_g;  // To swl of sparc_ifu_swl.v
   input [3:0]          exu_ifu_oddwin_s;       // To fcl of sparc_ifu_fcl.v
   input                exu_ifu_regn_e;         // To dcl of sparc_ifu_dcl.v
   input                exu_ifu_regz_e;         // To fcl of sparc_ifu_fcl.v
   input                exu_ifu_spill_e;        // To swl of sparc_ifu_swl.v
   input                exu_ifu_va_oor_m;       // To fcl of sparc_ifu_fcl.v
   input [3:0]          ffu_ifu_cc_vld_w2;      // To dcl of sparc_ifu_dcl.v
   input [7:0]          ffu_ifu_cc_w2;          // To dcl of sparc_ifu_dcl.v
   input                ffu_ifu_ecc_ce_w2;      // To errctl of sparc_ifu_errctl.v
   input                ffu_ifu_ecc_ue_w2;      // To errctl of sparc_ifu_errctl.v
   input [5:0]          ffu_ifu_err_reg_w2;     // To errdp of sparc_ifu_errdp.v
   input [13:0]         ffu_ifu_err_synd_w2;    // To errdp of sparc_ifu_errdp.v
   input                ffu_ifu_fpop_done_w2;   // To swl of sparc_ifu_swl.v
   input                ffu_ifu_fst_ce_w;       // To swl of sparc_ifu_swl.v, ...
   input                ffu_ifu_inj_ack;        // To errctl of sparc_ifu_errctl.v
   input                ffu_ifu_stallreq;       // To fcl of sparc_ifu_fcl.v
   input [1:0]          ffu_ifu_tid_w2;         // To swl of sparc_ifu_swl.v, ...
   input                gdbginit_l;             // To swl of sparc_ifu_swl.v, ...
   input                grst_l;                 // To swl of sparc_ifu_swl.v, ...
   input [3:0]          lsu_ifu_addr_real_l;    // To fcl of sparc_ifu_fcl.v
   input [17:0]         lsu_ifu_asi_addr;       // To ifqdp of sparc_ifu_ifqdp.v
   input                lsu_ifu_asi_load;       // To ifqctl of sparc_ifu_ifqctl.v
   input [7:0]          lsu_ifu_asi_state;      // To ifqctl of sparc_ifu_ifqctl.v
   input [1:0]          lsu_ifu_asi_thrid;      // To ifqctl of sparc_ifu_ifqctl.v
   input                lsu_ifu_asi_vld;        // To ifqctl of sparc_ifu_ifqctl.v
   input [`CPX_WIDTH-1:0]lsu_ifu_cpxpkt_i1;     // To ifqdp of sparc_ifu_ifqdp.v
   input                lsu_ifu_dc_parity_error_w2;// To swl of sparc_ifu_swl.v, ...
   input                lsu_ifu_dcache_data_perror;// To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_dcache_tag_perror;// To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_direct_map_l1;  // To ifqctl of sparc_ifu_ifqctl.v
   input                lsu_ifu_dtlb_data_su;   // To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_dtlb_data_ue;   // To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_dtlb_tag_ue;    // To errctl of sparc_ifu_errctl.v
   input [47:4]         lsu_ifu_err_addr;       // To errdp of sparc_ifu_errdp.v
   input [1:0]          lsu_ifu_error_tid;      // To errctl of sparc_ifu_errctl.v
   input [3:0]          lsu_ifu_icache_en;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          lsu_ifu_inj_ack;        // To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_io_error;       // To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_l2_corr_error;  // To errctl of sparc_ifu_errctl.v
   input                lsu_ifu_l2_unc_error;   // To errctl of sparc_ifu_errctl.v
   input [`IC_IDX_HI:5] lsu_ifu_ld_icache_index;// To invctl of sparc_ifu_invctl.v
   input [1:0]          lsu_ifu_ld_pcxpkt_tid;  // To invctl of sparc_ifu_invctl.v
   input                lsu_ifu_ld_pcxpkt_vld;  // To invctl of sparc_ifu_invctl.v
   input [3:0]          lsu_ifu_ldst_cmplt;     // To swl of sparc_ifu_swl.v
   input                lsu_ifu_ldst_miss_g;    // To swl of sparc_ifu_swl.v
   input                lsu_ifu_ldsta_internal_e;// To dec of sparc_ifu_dec.v, ...
   input                lsu_ifu_pcxpkt_ack_d;   // To ifqctl of sparc_ifu_ifqctl.v
   input                lsu_ifu_quad_asi_e;     // To swl of sparc_ifu_swl.v
   input                lsu_ifu_stallreq;       // To fcl of sparc_ifu_fcl.v
   input [3:0]          lsu_ifu_stbcnt0;        // To swl of sparc_ifu_swl.v
   input [3:0]          lsu_ifu_stbcnt1;        // To swl of sparc_ifu_swl.v
   input [3:0]          lsu_ifu_stbcnt2;        // To swl of sparc_ifu_swl.v
   input [3:0]          lsu_ifu_stbcnt3;        // To swl of sparc_ifu_swl.v
   input [47:0]         lsu_ifu_stxa_data;      // To ifqdp of sparc_ifu_ifqdp.v
   input                lsu_ifu_t0_tlz;         // To fcl of sparc_ifu_fcl.v
   input                lsu_ifu_t1_tlz;         // To fcl of sparc_ifu_fcl.v
   input                lsu_ifu_t2_tlz;         // To fcl of sparc_ifu_fcl.v
   input                lsu_ifu_t3_tlz;         // To fcl of sparc_ifu_fcl.v
   input [2:0]          lsu_pid_state0;         // To fcl of sparc_ifu_fcl.v
   input [2:0]          lsu_pid_state1;         // To fcl of sparc_ifu_fcl.v
   input [2:0]          lsu_pid_state2;         // To fcl of sparc_ifu_fcl.v
   input [2:0]          lsu_pid_state3;         // To fcl of sparc_ifu_fcl.v
   input [12:0]         lsu_t0_pctxt_state;     // To fdp of sparc_ifu_fdp.v
   input [12:0]         lsu_t1_pctxt_state;     // To fdp of sparc_ifu_fdp.v
   input [12:0]         lsu_t2_pctxt_state;     // To fdp of sparc_ifu_fdp.v
   input [12:0]         lsu_t3_pctxt_state;     // To fdp of sparc_ifu_fdp.v
   // input                mbist_bisi_mode;        // To mbist of sparc_ifu_mbist.v
   // input [71:0]         mbist_dcache_data_in;   // To mbist of sparc_ifu_mbist.v
   // input                mbist_loop_mode;        // To mbist of sparc_ifu_mbist.v
   // input                mbist_loop_on_address;  // To mbist of sparc_ifu_mbist.v
   // input                mbist_start;            // To mbist of sparc_ifu_mbist.v
   // input                mbist_stop_on_fail;     // To mbist of sparc_ifu_mbist.v
   // input                mbist_stop_on_next_fail;// To mbist of sparc_ifu_mbist.v
   // input                mbist_userdata_mode;    // To mbist of sparc_ifu_mbist.v
   input                rclk;                   // To dec of sparc_ifu_dec.v, ...
   input                se;                     // To dec of sparc_ifu_dec.v, ...
   input                sehold;                 // To fcl of sparc_ifu_fcl.v, ...
   input                spu_ifu_corr_err_w2;    // To errctl of sparc_ifu_errctl.v
   input [39:4]         spu_ifu_err_addr_w2;    // To errdp of sparc_ifu_errdp.v
   input                spu_ifu_int_w2;         // To errctl of sparc_ifu_errctl.v
   input                spu_ifu_mamem_err_w1;   // To errctl of sparc_ifu_errctl.v
   input [1:0]          spu_ifu_ttype_tid_w2;   // To fcl of sparc_ifu_fcl.v, ...
   input                spu_ifu_ttype_vld_w2;   // To fcl of sparc_ifu_fcl.v
   input                spu_ifu_ttype_w2;       // To fcl of sparc_ifu_fcl.v
   input                spu_ifu_unc_err_w1;     // To errctl of sparc_ifu_errctl.v
   input [3:0]          tlu_hpstate_enb;        // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_hpstate_ibe;        // To swl of sparc_ifu_swl.v
   input [3:0]          tlu_hpstate_priv;       // To fcl of sparc_ifu_fcl.v
   input [1:0]          tlu_idtlb_dmp_thrid_g;  // To fcl of sparc_ifu_fcl.v
   input                tlu_ifu_flush_pipe_w;   // To swl of sparc_ifu_swl.v, ...
   input [3:0]          tlu_ifu_hintp_vld;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_ifu_hwint_i3;       // To fcl of sparc_ifu_fcl.v
   input                tlu_ifu_nukeint_i2;     // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_ifu_pstate_ie;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_ifu_pstate_pef;     // To swl of sparc_ifu_swl.v
   input [3:0]          tlu_ifu_rerr_vld;       // To fcl of sparc_ifu_fcl.v
   input                tlu_ifu_resumint_i2;    // To fcl of sparc_ifu_fcl.v
   input                tlu_ifu_rstint_i2;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_ifu_rstthr_i2;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_ifu_sftint_vld;     // To fcl of sparc_ifu_fcl.v
   input [1:0]          tlu_ifu_trap_tid_w1;    // To swl of sparc_ifu_swl.v, ...
   input                tlu_ifu_trapnpc_vld_w1; // To fcl of sparc_ifu_fcl.v
   input [48:0]         tlu_ifu_trapnpc_w2;     // To fdp of sparc_ifu_fdp.v
   input                tlu_ifu_trappc_vld_w1;  // To swl of sparc_ifu_swl.v, ...
   input [48:0]         tlu_ifu_trappc_w2;      // To fdp of sparc_ifu_fdp.v
   input                tlu_itlb_data_rd_g;     // To fcl of sparc_ifu_fcl.v
   input                tlu_itlb_dmp_actxt_g;   // To fdp of sparc_ifu_fdp.v
   input                tlu_itlb_dmp_nctxt_g;   // To fdp of sparc_ifu_fdp.v
   input                tlu_itlb_dmp_vld_g;     // To fcl of sparc_ifu_fcl.v
   input                tlu_itlb_invalidate_all_g;// To fcl of sparc_ifu_fcl.v
   input                tlu_itlb_tag_rd_g;      // To fcl of sparc_ifu_fcl.v
   input                tlu_itlb_wr_vld_g;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_lsu_pstate_am;      // To fcl of sparc_ifu_fcl.v
   input [3:0]          tlu_lsu_pstate_priv;    // To fcl of sparc_ifu_fcl.v, ...
   input [3:0]          tlu_lsu_redmode;        // To fcl of sparc_ifu_fcl.v
   // End of automatics
   `ifndef NO_RTL_CSM
   input                tlu_itlb_csm_rd_g;
   input [`TLB_CSM]     tlu_itlb_tte_csm_w2;
   input                tlu_itlb_wr_csm_sel_g;

   input [`CFG_CSM_STATE_WIDTH-1:0]   cfg_ifu_csm_itlb_state;
   input [`NOC_CHIPID_WIDTH-1:0]      cfg_ifu_csm_itlb_chipid;
   input [`NOC_X_WIDTH-1:0]           cfg_ifu_csm_itlb_x;
   input [`NOC_Y_WIDTH-1:0]           cfg_ifu_csm_itlb_y;
   input [`MSG_HDID_WIDTH-1:0]        cfg_ifu_csm_itlb_hdid;
   input [`MSG_LHID_WIDTH-1:0]        cfg_ifu_csm_itlb_hd_size;
   input [`MSG_SDID_WIDTH-1:0]        cfg_ifu_csm_itlb_sdid;
   input [`MSG_LSID_WIDTH-1:0]        cfg_ifu_csm_itlb_lsid;

   `endif


   input                config_dtu_esl_en;
   input [1:0]          config_dtu_esl_sync_method;
   input [15:0]         config_esl_lfsr_seed;
   input                config_esl_lfsr_ld;
   input [49:0]         config_esl_pc_diff_thresh;
   input [15:0]         config_esl_counter_timeout;


   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [2:0]         ifu_exu_aluop_d;        // From dec of sparc_ifu_dec.v
   output               ifu_exu_casa_d;         // From dec of sparc_ifu_dec.v
   output               ifu_exu_dbrinst_d;      // From dcl of sparc_ifu_dcl.v
   output               ifu_exu_disable_ce_e;   // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_dontmv_regz0_e; // From dcl of sparc_ifu_dcl.v
   output               ifu_exu_dontmv_regz1_e; // From dcl of sparc_ifu_dcl.v
   output [7:0]         ifu_exu_ecc_mask;       // From errctl of sparc_ifu_errctl.v
   output               ifu_exu_enshift_d;      // From dec of sparc_ifu_dec.v
   output               ifu_exu_flushw_e;       // From dec of sparc_ifu_dec.v
   output               ifu_exu_ialign_d;       // From dec of sparc_ifu_dec.v
   output [31:0]        ifu_exu_imm_data_d;     // From imd of sparc_ifu_imd.v
   output               ifu_exu_inj_irferr;     // From errctl of sparc_ifu_errctl.v
   output               ifu_exu_inst_vld_e;     // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_inst_vld_w;     // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_invert_d;       // From dec of sparc_ifu_dec.v
   output               ifu_exu_kill_e;         // From dcl of sparc_ifu_dcl.v
   output               ifu_exu_muls_d;         // From dec of sparc_ifu_dec.v
   output               ifu_exu_nceen_e;        // From errctl of sparc_ifu_errctl.v
   output [47:0]        ifu_exu_pc_d;           // From fdp of sparc_ifu_fdp.v
   output [63:0]        ifu_exu_pcver_e;        // From fdp of sparc_ifu_fdp.v
   output               ifu_exu_range_check_jlret_d;// From dec of sparc_ifu_dec.v
   output               ifu_exu_range_check_other_d;// From dec of sparc_ifu_dec.v
   output [4:0]         ifu_exu_rd_d;           // From imd of sparc_ifu_imd.v
   output               ifu_exu_rd_exusr_e;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_rd_ffusr_e;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_rd_ifusr_e;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_ren1_s;         // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_ren2_s;         // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_ren3_s;         // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_restore_d;      // From dec of sparc_ifu_dec.v
   output               ifu_exu_restored_e;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_return_d;       // From dec of sparc_ifu_dec.v
   output [4:0]         ifu_exu_rs1_s;          // From fdp of sparc_ifu_fdp.v
   output               ifu_exu_rs1_vld_d;      // From dec of sparc_ifu_dec.v
   output [4:0]         ifu_exu_rs2_s;          // From fdp of sparc_ifu_fdp.v
   output               ifu_exu_rs2_vld_d;      // From dec of sparc_ifu_dec.v
   output [4:0]         ifu_exu_rs3_s;          // From fdp of sparc_ifu_fdp.v
   output               ifu_exu_rs3e_vld_d;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_rs3o_vld_d;     // From dec of sparc_ifu_dec.v
   output               ifu_exu_save_d;         // From dec of sparc_ifu_dec.v
   output               ifu_exu_saved_e;        // From dec of sparc_ifu_dec.v
   output               ifu_exu_setcc_d;        // From dec of sparc_ifu_dec.v
   output               ifu_exu_sethi_inst_d;   // From dec of sparc_ifu_dec.v
   output [2:0]         ifu_exu_shiftop_d;      // From dec of sparc_ifu_dec.v
   output               ifu_exu_tagop_d;        // From dec of sparc_ifu_dec.v
   output               ifu_exu_tcc_e;          // From dcl of sparc_ifu_dcl.v
   output [1:0]         ifu_exu_tid_s2;         // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_ttype_vld_m;    // From fcl of sparc_ifu_fcl.v
   output               ifu_exu_tv_d;           // From dec of sparc_ifu_dec.v
   output               ifu_exu_use_rsr_e_l;    // From dec of sparc_ifu_dec.v
   output               ifu_exu_usecin_d;       // From dec of sparc_ifu_dec.v
   output               ifu_exu_useimm_d;       // From dec of sparc_ifu_dec.v
   output               ifu_exu_wen_d;          // From dec of sparc_ifu_dec.v
   output               ifu_exu_wsr_inst_d;     // From dec of sparc_ifu_dec.v
   output [1:0]         ifu_ffu_fcc_num_d;      // From imd of sparc_ifu_imd.v
   output               ifu_ffu_fld_d;          // From dec of sparc_ifu_dec.v
   output               ifu_ffu_fpop1_d;        // From dec of sparc_ifu_dec.v
   output               ifu_ffu_fpop2_d;        // From dec of sparc_ifu_dec.v
   output [8:0]         ifu_ffu_fpopcode_d;     // From imd of sparc_ifu_imd.v
   output [4:0]         ifu_ffu_frd_d;          // From imd of sparc_ifu_imd.v
   output [4:0]         ifu_ffu_frs1_d;         // From imd of sparc_ifu_imd.v
   output [4:0]         ifu_ffu_frs2_d;         // From imd of sparc_ifu_imd.v
   output               ifu_ffu_fst_d;          // From dec of sparc_ifu_dec.v
   output               ifu_ffu_inj_frferr;     // From errctl of sparc_ifu_errctl.v
   output               ifu_ffu_ldfsr_d;        // From dec of sparc_ifu_dec.v
   output               ifu_ffu_ldst_size_d;    // From dec of sparc_ifu_dec.v
   output               ifu_ffu_ldxfsr_d;       // From dec of sparc_ifu_dec.v
   output               ifu_ffu_mvcnd_m;        // From dcl of sparc_ifu_dcl.v
   output               ifu_ffu_quad_op_e;      // From dec of sparc_ifu_dec.v
   output               ifu_ffu_stfsr_d;        // From dec of sparc_ifu_dec.v
   output               ifu_ffu_visop_d;        // From dec of sparc_ifu_dec.v
   output               ifu_lsu_alt_space_d;    // From dec of sparc_ifu_dec.v
   output               ifu_lsu_asi_ack;        // From ifqctl of sparc_ifu_ifqctl.v
   output               ifu_lsu_asi_rd_unc;     // From errctl of sparc_ifu_errctl.v
   output               ifu_lsu_casa_e;         // From dec of sparc_ifu_dec.v
   output [2:0]         ifu_lsu_destid_s;       // From ifqctl of sparc_ifu_ifqctl.v
   output [3:0]         ifu_lsu_error_inj;      // From errctl of sparc_ifu_errctl.v
   output               ifu_lsu_fwd_data_vld;   // From errctl of sparc_ifu_errctl.v
   output               ifu_lsu_fwd_wr_ack;     // From ifqctl of sparc_ifu_ifqctl.v
   output               ifu_lsu_ibuf_busy;      // From ifqctl of sparc_ifu_ifqctl.v
   output [7:0]         ifu_lsu_imm_asi_d;      // From imd of sparc_ifu_imd.v
   output               ifu_lsu_imm_asi_vld_d;  // From imd of sparc_ifu_imd.v
   output               ifu_lsu_inv_clear;      // From ifqctl of sparc_ifu_ifqctl.v
   output               ifu_lsu_ld_inst_e;      // From dec of sparc_ifu_dec.v
   output               ifu_lsu_ldst_dbl_e;     // From dec of sparc_ifu_dec.v
   output               ifu_lsu_ldst_fp_e;      // From dec of sparc_ifu_dec.v
   output [1:0]         ifu_lsu_ldst_size_e;    // From dec of sparc_ifu_dec.v
   output               ifu_lsu_ldstub_e;       // From dec of sparc_ifu_dec.v
   output               ifu_lsu_ldxa_data_vld_w2;// From errctl of sparc_ifu_errctl.v
   output [63:0]        ifu_lsu_ldxa_data_w2;   // From errdp of sparc_ifu_errdp.v
   output               ifu_lsu_ldxa_illgl_va_w2;// From ifqctl of sparc_ifu_ifqctl.v
   output [1:0]         ifu_lsu_ldxa_tid_w2;    // From errctl of sparc_ifu_errctl.v
   output               ifu_lsu_memref_d;       // From dec of sparc_ifu_dec.v
   output [3:0]         ifu_lsu_nceen;          // From errctl of sparc_ifu_errctl.v
   output [51:0]        ifu_lsu_pcxpkt_e;       // From ifqdp of sparc_ifu_ifqdp.v
   output               ifu_lsu_pcxreq_d;       // From ifqctl of sparc_ifu_ifqctl.v
   output               ifu_lsu_pref_inst_e;    // From dec of sparc_ifu_dec.v
   output [4:0]         ifu_lsu_rd_e;           // From imd of sparc_ifu_imd.v
   output               ifu_lsu_sign_ext_e;     // From dec of sparc_ifu_dec.v
   output               ifu_lsu_st_inst_e;      // From dec of sparc_ifu_dec.v
   output               ifu_lsu_swap_e;         // From dec of sparc_ifu_dec.v
   output               ifu_lsu_wsr_inst_d;     // From dec of sparc_ifu_dec.v
   output               ifu_mmu_trap_m;         // From fcl of sparc_ifu_fcl.v
   output               ifu_spu_inst_vld_w;     // From fcl of sparc_ifu_fcl.v
   output [3:0]         ifu_spu_nceen;          // From errctl of sparc_ifu_errctl.v
   output               ifu_spu_trap_ack;       // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_alt_space_d;    // From dec of sparc_ifu_dec.v
   output               ifu_tlu_done_inst_d;    // From dec of sparc_ifu_dec.v
   output               ifu_tlu_flsh_inst_e;    // From dec of sparc_ifu_dec.v
   output               ifu_tlu_flush_m;        // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_hwint_m;        // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_icmiss_e;       // From fcl of sparc_ifu_fcl.v
   output [8:0]         ifu_tlu_imm_asi_d;      // From imd of sparc_ifu_imd.v
   output               ifu_tlu_immu_miss_m;    // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_inst_vld_m;     // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_itlb_done;      // From fcl of sparc_ifu_fcl.v
   output [3:0]         ifu_tlu_l2imiss;        // From ifqctl of sparc_ifu_ifqctl.v
   output               ifu_tlu_mb_inst_e;      // From dec of sparc_ifu_dec.v
   output [48:0]        ifu_tlu_npc_m;          // From fdp of sparc_ifu_fdp.v
   output [48:0]        ifu_tlu_pc_m;           // From fdp of sparc_ifu_fdp.v
   output               ifu_tlu_pc_oor_e;       // From fdp of sparc_ifu_fdp.v
   output               ifu_tlu_priv_violtn_m;  // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_retry_inst_d;   // From dec of sparc_ifu_dec.v
   output               ifu_tlu_rsr_inst_d;     // From dec of sparc_ifu_dec.v
   output               ifu_tlu_rstint_m;       // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_sftint_m;       // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_sir_inst_m;     // From dec of sparc_ifu_dec.v
   output [6:0]         ifu_tlu_sraddr_d;       // From imd of sparc_ifu_imd.v
   output [6:0]         ifu_tlu_sraddr_d_v2;    // From imd of sparc_ifu_imd.v
   output [1:0]         ifu_tlu_thrid_d;        // From fcl of sparc_ifu_fcl.v
   output [1:0]         ifu_tlu_thrid_e;        // From fcl of sparc_ifu_fcl.v
   output               ifu_tlu_trap_m;         // From fcl of sparc_ifu_fcl.v
   output [8:0]         ifu_tlu_ttype_m;        // From fcl of sparc_ifu_fcl.v
   // End of automatics
   `ifndef NO_RTL_CSM
   output [`TLB_CSM]     ifu_lsu_pcxcsm_e;       // From ifqdp of sparc_ifu_ifqdp.v
   `endif

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire                 dcl_fcl_bcregz0_e;      // From dcl of sparc_ifu_dcl.v
   wire                 dcl_fcl_bcregz1_e;      // From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_broff_sel_bcc_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_broff_sel_bpcc_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_broff_sel_br_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_broff_sel_call_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_immbr_sel_br_d; // From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_immdata_sel_movcc_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_immdata_sel_movr_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_immdata_sel_sethi_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_imd_immdata_sel_simm13_d_l;// From dcl of sparc_ifu_dcl.v
   wire                 dcl_swl_tcc_done_m;     // From dcl of sparc_ifu_dcl.v
   wire                 dcl_esl_br_inst_d;
   wire                 dcl_esl_br_inst_e;
   wire [2:0]           dec_dcl_cctype_d;       // From dec of sparc_ifu_dec.v
   wire                 dec_fcl_rdsr_sel_pc_d;  // From dec of sparc_ifu_dec.v
   wire                 dec_fcl_rdsr_sel_thr_d; // From dec of sparc_ifu_dec.v
   wire                 dec_imd_call_inst_d;    // From dec of sparc_ifu_dec.v
   wire                 dec_swl_allfp_d;        // From dec of sparc_ifu_dec.v
   wire                 dec_swl_br_done_d;      // From dec of sparc_ifu_dec.v
   wire                 dec_swl_div_inst_d;     // From dec of sparc_ifu_dec.v
   wire                 dec_swl_fpop_d;         // From dec of sparc_ifu_dec.v
   wire                 dec_swl_frf_lower_d;    // From dec of sparc_ifu_dec.v
   wire                 dec_swl_frf_upper_d;    // From dec of sparc_ifu_dec.v
   wire                 dec_swl_ld_inst_d;      // From dec of sparc_ifu_dec.v
   wire                 dec_swl_ll_done_d;      // From dec of sparc_ifu_dec.v
   wire                 dec_swl_mul_inst_d;     // From dec of sparc_ifu_dec.v
   wire                 dec_swl_rdsr_sel_thr_d; // From dec of sparc_ifu_dec.v
   wire                 dec_swl_st_inst_d;      // From dec of sparc_ifu_dec.v
   wire                 dec_swl_sta_inst_e;     // From dec of sparc_ifu_dec.v
   wire                 dec_swl_std_inst_d;     // From dec of sparc_ifu_dec.v
   wire                 dec_swl_wrt_tcr_w;      // From dec of sparc_ifu_dec.v
   wire                 dec_swl_wrtfprs_w;      // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_br_inst_d;      // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_flush_sonly_e;  // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_fpdis_e;        // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_illinst_e;      // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_imask_hit_e;    // From dec of sparc_ifu_dec.v
   wire [3:0]           dtu_fcl_nextthr_bf;     // From swl of sparc_ifu_swl.v
   wire                 dtu_fcl_ntr_s;          // From swl of sparc_ifu_swl.v
   wire                 dtu_fcl_privop_e;       // From dec of sparc_ifu_dec.v
   wire                 dtu_fcl_retract_d;      // From swl of sparc_ifu_swl.v
   wire                 dtu_fcl_rollback_g;     // From swl of sparc_ifu_swl.v
   wire                 dtu_fcl_running_s;      // From swl of sparc_ifu_swl.v
   wire                 dtu_fcl_sir_inst_e;     // From dec of sparc_ifu_dec.v
   wire [3:0]           dtu_fcl_thr_active;     // From swl of sparc_ifu_swl.v
   wire [40:0]          dtu_fdp_thrconf_e;      // From swl of sparc_ifu_swl.v
   wire                 dtu_ifq_kill_latest_d;  // From dec of sparc_ifu_dec.v
   wire                 dtu_inst_anull_e;       // From dcl of sparc_ifu_dcl.v
   wire [31:0]          dtu_inst_d;             // From imd of sparc_ifu_imd.v
   wire                 dtu_reset;              // From swl of sparc_ifu_swl.v
   wire                 esl_fcl_stall_bf;       // From swl (esl) of sparc_ifu_swl.v
   wire                 esl_fcl_switch_bf;      // From swl (esl) of sparc_ifu_swl.v
   wire                 esl_fdp_sync_pcs_bf;    // From swl (esl) of sparc_ifu_swl.v
   wire                 esl_fcl_ntr_s;          // From swl (esl) of sparc_ifu_swl.v
   wire                 esl_fdp_issue_prev_inst_s; // From swl (esl) of sparc_ifu_swl.v
   wire                 esl_fcl_force_running_s;
   wire                 erb_dtu_ifeterr_d1;     // From errctl of sparc_ifu_errctl.v
   wire [38:0]          erb_dtu_imask;          // From errdp of sparc_ifu_errdp.v
   wire [3:0]           erb_fcl_ce_trapvec;     // From errctl of sparc_ifu_errctl.v
   wire [3:0]           erb_fcl_ifet_uevec_d1;  // From errctl of sparc_ifu_errctl.v
   wire                 erb_fcl_itlb_ce_d1;     // From errctl of sparc_ifu_errctl.v
   wire [3:0]           erb_fcl_spu_uetrap;     // From errctl of sparc_ifu_errctl.v
   wire [3:0]           erb_fcl_ue_trapvec;     // From errctl of sparc_ifu_errctl.v
   wire                 erb_ifq_ifeterr_d1;     // From errctl of sparc_ifu_errctl.v
   wire                 erb_ifq_itlberr_s1;     // From errctl of sparc_ifu_errctl.v
   wire                 erb_reset;              // From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_asi_thr_l;      // From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_asisrc_sel_err_s_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_asisrc_sel_icd_s_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_asisrc_sel_itlb_s_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_asisrc_sel_misc_s_l;// From errctl of sparc_ifu_errctl.v
   wire [`IC_WAY_ARRAY_MASK]           erc_erd_asiway_s1_l;    // From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr0_sel_frf_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr0_sel_irf_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr0_sel_itlb_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr0_sel_lsu_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr1_sel_l1pa_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr1_sel_l2pa_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr1_sel_other_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr1_sel_pcd1_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr2_sel_mx0_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr2_sel_mx1_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr2_sel_old_l;// From errctl of sparc_ifu_errctl.v
   wire [3:0]           erc_erd_eadr2_sel_wrt_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_errasi_sel_addr_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_errasi_sel_en_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_errasi_sel_inj_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_errasi_sel_stat_l;// From errctl of sparc_ifu_errctl.v
   wire [1:0]           erc_erd_erren_asidata;  // From errctl of sparc_ifu_errctl.v
   wire [31:0]          erc_erd_errinj_asidata; // From errctl of sparc_ifu_errctl.v
   wire [22:0]          erc_erd_errstat_asidata;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_ld_imask;       // From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_miscasi_sel_ict_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_miscasi_sel_imask_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_miscasi_sel_other_l;// From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_pgsz_b0;        // From errctl of sparc_ifu_errctl.v
   wire                 erc_erd_pgsz_b1;        // From errctl of sparc_ifu_errctl.v
   wire                 erd_erc_fetpe_s1;       // From errdp of sparc_ifu_errdp.v
   wire                 erd_erc_nirpe_s1;       // From errdp of sparc_ifu_errdp.v
   wire [3:0]           erd_erc_tagpe_s1;       // From errdp of sparc_ifu_errdp.v
   wire [1:0]           erd_erc_tlbd_pe_s1;     // From errdp of sparc_ifu_errdp.v
   wire [1:0]           erd_erc_tlbt_pe_s1;     // From errdp of sparc_ifu_errdp.v
   wire [2:0]           erd_erc_tte_pgsz;       // From errdp of sparc_ifu_errdp.v
   wire                 fcl_dcl_regz_e;         // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dec_dslot_s;        // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dec_intr_vld_d;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_ely_inst_vld_d; // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_hprivmode_d;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_hprivmode_w2;   // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_inst_vld_d;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_inst_vld_e;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_intr_vld_e;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_nuke_thr_w;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_privmode_d;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_resum_thr_w;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_rst_thr_w;      // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_stall_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_sync_intr_d;    // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_dtu_thr_f;          // From fcl of sparc_ifu_fcl.v
   wire                 fcl_dtu_tlzero_d;       // From fcl of sparc_ifu_fcl.v
   wire [1:0]           fcl_erb_asi_tid_f;      // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_erb_clear_iferr;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_ievld_s1;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_immuevld_s1;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_inst_issue_d;   // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_inst_vld_d1;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_itlbrd_data_s;  // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_itlbrd_vld_s;   // From fcl of sparc_ifu_fcl.v
   wire                 fcl_erb_tevld_s1;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_ctxt_sel_curr_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_ctxt_sel_dmp_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_ctxt_sel_sw_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_dmpthr_l;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_inst_sel_curr_s_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_inst_sel_nir_s_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_inst_sel_nop_s_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_inst_sel_switch_s_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_mask32b_f;      // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_next_ctxt_bf_l; // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_next_thr_bf_l;  // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_nextpcs_sel_pcd_f_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_nextpcs_sel_pce_f_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_nextpcs_sel_pcf_f_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_nextpcs_sel_pcs_f_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_nirthr_s1_l;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_noswpc_sel_inc_l_bf;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_noswpc_sel_old_l_bf;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_noswpc_sel_tnpc_l_bf;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_oddwin_s;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_pcbf_sel_br_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_pcbf_sel_nosw_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_pcbf_sel_swpc_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_pcoor_f;        // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_pcoor_vec_f;    // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_rbinst_sel_inste_s;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_rdsr_sel_pc_e_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_rdsr_sel_thr_e_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_rdsr_sel_ver_e_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tctxt_sel_prim; // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thr_s1_l;       // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thr_s2_l;       // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thrtnpc_sel_npcw_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thrtnpc_sel_old_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thrtnpc_sel_pcf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_thrtnpc_sel_tnpc_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tinst_sel_curr_s_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tinst_sel_ifq_s_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tinst_sel_old_s_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tinst_sel_rb_s_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tpcbf_sel_brpc_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tpcbf_sel_old_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tpcbf_sel_pcp4_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_tpcbf_sel_trap_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_trrbpc_sel_err_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_trrbpc_sel_pcs_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_trrbpc_sel_rb_bf_l;// From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_fdp_trrbpc_sel_trap_bf_l;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_usenir_sel_nir_s1;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_icd_index_sel_ifq_bf;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_icd_rdreq_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_icd_wrreq_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_ict_wrreq_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_icv_rdreq_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_icv_wrreq_bf;       // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_ifq_canthr;         // From fcl of sparc_ifu_fcl.v
   wire                 fcl_ifq_grant_bf;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_ifq_icache_en_s_l;  // From fcl of sparc_ifu_fcl.v
   wire                 fcl_ifq_icmiss_s1;      // From fcl of sparc_ifu_fcl.v
   wire                 fcl_ifq_rdreq_s1;       // From fcl of sparc_ifu_fcl.v
   wire [1:0]           fcl_ifq_thr_s1;         // From fcl of sparc_ifu_fcl.v
   wire                 fcl_imd_oddwin_d;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_swl_flush_w;        // From fcl of sparc_ifu_fcl.v
   wire                 fcl_swl_flush_wake_w;   // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_swl_int_activate_i3;// From fcl of sparc_ifu_fcl.v
   wire                 fcl_swl_swcvld_s;       // From fcl of sparc_ifu_fcl.v
   wire                 fcl_swl_swout_f;        // From fcl of sparc_ifu_fcl.v
   wire                 fcl_fdp_tlbmiss_s1;     // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_esl_tinst_vld_next_s; // From fcl of sparc_ifu_fcl.v
   wire                 fcl_esl_brtaken_e;      // From fcl of sparc_ifu_fcl.v
   wire                 fcl_esl_brtaken_m;      // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_esl_thr_e;          // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_esl_thr_m;          // From fcl of sparc_ifu_fcl.v
   wire                 fcl_esl_inst_vld_d;
   wire                 fcl_esl_inst_vld_e;     // From fcl of sparc_ifu_fcl.v
   wire                 fcl_esl_inst_vld_m;     // From fcl of sparc_ifu_fcl.v
   wire [3:0]           fcl_esl_thr_trap_bf;    // From fcl of sparc_ifu_fcl.v
   wire                 fcl_esl_rb_stg_s;  // From fcl of sparc_ifu_fcl.v
   wire [31:0]          fdp_dtu_inst_s;         // From fdp of sparc_ifu_fdp.v
   wire [47:0]          fdp_erb_pc_f;           // From fdp of sparc_ifu_fdp.v
   wire                 fdp_fcl_ibit_s;         // From fdp of sparc_ifu_fdp.v
   wire [5:2]           fdp_fcl_op3_s;          // From fdp of sparc_ifu_fdp.v
   wire [1:0]           fdp_fcl_op_s;           // From fdp of sparc_ifu_fdp.v
   wire                 fdp_fcl_pc_oor_e;       // From fdp of sparc_ifu_fdp.v
   wire [3:0]           fdp_fcl_pc_oor_vec_f;   // From fdp of sparc_ifu_fdp.v
   wire                 fdp_fcl_swc_s2;         // From fdp of sparc_ifu_fdp.v
   wire [32:0]          fdp_esl_t0inst_next_s2; // From fdp of sparc_ifu_fdp.v
`ifndef CONFIG_NUM_THREADS
   wire [32:0]          fdp_esl_t1inst_next_s2; // From fdp of sparc_ifu_fdp.v
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   wire [32:0]          fdp_esl_t1inst_next_s2; // From fdp of sparc_ifu_fdp.v
`elsif THREADS_3
   wire [32:0]          fdp_esl_t1inst_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [32:0]          fdp_esl_t2inst_next_s2; // From fdp of sparc_ifu_fdp.v
`else
   wire [32:0]          fdp_esl_t1inst_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [32:0]          fdp_esl_t2inst_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [32:0]          fdp_esl_t3inst_next_s2; // From fdp of sparc_ifu_fdp.v
`endif
`endif
   wire [39:2]          fdp_esl_t0inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
`ifndef CONFIG_NUM_THREADS
   wire [39:2]          fdp_esl_t1inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   wire [39:2]          fdp_esl_t1inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
`elsif THREADS_3
   wire [39:2]          fdp_esl_t1inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [39:2]          fdp_esl_t2inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
`else
   wire [39:2]          fdp_esl_t1inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [39:2]          fdp_esl_t2inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
   wire [39:2]          fdp_esl_t3inst_paddr_next_s2; // From fdp of sparc_ifu_fdp.v
`endif
`endif
   wire [48:0]          fdp_esl_t0pc_next_s2;   // From fdp of sparc_ifu_fdp.v
`ifndef CONFIG_NUM_THREADS
   wire [48:0]          fdp_esl_t1pc_next_s2;   // From fdp of sparc_ifu_fdp.v
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   wire [48:0]          fdp_esl_t1pc_next_s2;   // From fdp of sparc_ifu_fdp.v
`elsif THREADS_3
   wire [48:0]          fdp_esl_t1pc_next_s2;   // From fdp of sparc_ifu_fdp.v
   wire [48:0]          fdp_esl_t2pc_next_s2;   // From fdp of sparc_ifu_fdp.v
`else
   wire [48:0]          fdp_esl_t1pc_next_s2;   // From fdp of sparc_ifu_fdp.v
   wire [48:0]          fdp_esl_t2pc_next_s2;   // From fdp of sparc_ifu_fdp.v
   wire [48:0]          fdp_esl_t3pc_next_s2;   // From fdp of sparc_ifu_fdp.v
`endif
`endif
   wire [3:0]           fdp_esl_brtrp_target_pc_bf_f;
   wire [`IC_IDX_HI:5]          fdp_icv_index_bf;       // From fdp of sparc_ifu_fdp.v

   wire [1:0]           icd_fuse_repair_en;     // From icd of bw_r_icd.v
   assign icd_fuse_repair_en = 2'b0;
   wire [7:0]           icd_fuse_repair_value;  // From icd of bw_r_icd.v
   assign icd_fuse_repair_value = 8'bx;
   wire                 fdp_fcl_jtag_breakpoint_hit;

   wire [135:0]         icd_wsel_fetdata_s1;    // From icd of bw_r_icd.v
   wire [135:0]         icd_wsel_topdata_s1;    // From icd of bw_r_icd.v
   wire [3:0]           icv_itlb_valid_f;       // From icv of sram_l1i_val.v
   wire                 ifc_ifd_addr_sel_asi_i2_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_addr_sel_bist_i2_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_addr_sel_fill_i2_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_addr_sel_old_i2_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_errinv_e;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_filladdr4_i2;   // From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifc_ifd_finst_sel_l;    // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_idx_sel_fwd_i2; // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ifqbyp_en_l;    // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ifqbyp_sel_asi_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ifqbyp_sel_fwd_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ifqbyp_sel_inq_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ifqbyp_sel_lsu_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_ld_inq_i1;      // From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifc_ifd_ldmil_sel_new;  // From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifc_ifd_milfill_sel_i2_l;// From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifc_ifd_milreq_sel_d_l; // From ifqctl of sparc_ifu_ifqctl.v
   wire [4:2]           ifc_ifd_pcxline_adj_d;  // From ifqctl of sparc_ifu_ifqctl.v
   wire [`IC_WAY_MASK]           ifc_ifd_repway_s;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_reqvalid_e;     // From ifqctl of sparc_ifu_ifqctl.v
   wire [1:0]           ifc_ifd_thrid_e;        // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_ifd_uncached_e;     // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_inv_asireq_i2;      // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifc_inv_ifqadv_i2;      // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifd_ifc_4bpkt_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_asi_vachklo_i2; // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:2]           ifd_ifc_asiaddr_i2;     // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_cpxce_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_cpxms_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_cpxnc_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [`CPX_RQ_SIZE:0]ifd_ifc_cpxreq_i1;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:0]           ifd_ifc_cpxreq_nxt;     // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifd_ifc_cpxthr_nxt;     // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_cpxue_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_cpxvld_i2;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [2:0]           ifd_ifc_destid0;        // From ifqdp of sparc_ifu_ifqdp.v
   wire [2:0]           ifd_ifc_destid1;        // From ifqdp of sparc_ifu_ifqdp.v
   wire [2:0]           ifd_ifc_destid2;        // From ifqdp of sparc_ifu_ifqdp.v
   wire [2:0]           ifd_ifc_destid3;        // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_fwd2ic_i2;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifd_ifc_instoffset0;    // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifd_ifc_instoffset1;    // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifd_ifc_instoffset2;    // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifd_ifc_instoffset3;    // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifd_ifc_iobpkt_i2;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:0]           ifd_ifc_miladdr4_i2;    // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:0]           ifd_ifc_milhit_s;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [2:0]           ifd_ifc_newdestid_s;    // From ifqdp of sparc_ifu_ifqdp.v
   wire [4:2]           ifd_ifc_pcxline_d;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [`CPX_WIDTH-1:0]ifd_inv_ifqop_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [`IC_WAY_MASK]           ifd_inv_wrway_i2;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [39:2]          ifq_fdp_fill_paddr;     // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:0]           ifq_dtu_pred_rdy;       // From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifq_dtu_thrrdy;         // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_asi_erraddr_i2; // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_asi_erren_i2;   // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_asi_errinj_i2;  // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_asi_errstat_i2; // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_asi_imask_i2;   // From ifqctl of sparc_ifu_ifqctl.v
   wire [47:0]          ifq_erb_asidata_i2;     // From ifqdp of sparc_ifu_ifqdp.v
   wire [`IC_WAY_MASK]           ifq_erb_asiway_f;       // From invctl of sparc_ifu_invctl.v
   wire                 ifq_erb_asiwr_i2;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_ce_rep;         // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_fwdrd_bf;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_ifet_ce;        // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_io_ue;          // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_l2_ue;          // From ifqctl of sparc_ifu_ifqctl.v
   wire [1:0]           ifq_erb_l2err_tid;      // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_rdinst_f;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_rdtag_f;        // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_erb_ue_rep;         // From ifqctl of sparc_ifu_ifqctl.v
   wire [`IC_IDX_HI:4]  ifq_erb_wrindex_f;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [1:0]           ifq_fcl_asi_tid_bf;     // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_asird_bf;       // From ifqctl of sparc_ifu_ifqctl.v
   wire [3:0]           ifq_fcl_fill_thr;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_flush_sonly_e;  // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_icd_wrreq_bf;   // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_ictv_wrreq_bf;  // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_invreq_bf;      // From invctl of sparc_ifu_invctl.v
   wire                 ifq_fcl_rdreq_bf;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_stallreq;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_fcl_wrreq_bf;       // From ifqctl of sparc_ifu_ifqctl.v
   wire [32:0]          ifq_fdp_fill_inst;      // From ifqdp of sparc_ifu_ifqdp.v
   wire                 ifq_icd_data_sel_bist_i2;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_icd_data_sel_fill_i2;// From ifqctl of sparc_ifu_ifqctl.v
   wire                 ifq_icd_data_sel_old_i2;// From ifqctl of sparc_ifu_ifqctl.v
   wire [`IC_IDX_HI:2]  ifq_icd_index_bf;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [3:0]           ifq_icd_worden_bf;      // From ifqctl of sparc_ifu_ifqctl.v
   wire [135:0]         ifq_icd_wrdata_i2;      // From ifqdp of sparc_ifu_ifqdp.v
   wire [`IC_WAY_MASK]           ifq_icd_wrway_bf;       // From ifqdp of sparc_ifu_ifqdp.v
   wire [`IC_WAY_ARRAY_MASK]           ifq_ict_dec_wrway_bf;   // From invctl of sparc_ifu_invctl.v
   wire                 ifq_icv_wrdata_bf;      // From ifqctl of sparc_ifu_ifqctl.v
   wire [15:0]          ifq_icv_wren_bf;        // From invctl of sparc_ifu_invctl.v
   wire [`IC_IDX_HI:5]  ifq_icv_wrindex_bf;     // From invctl of sparc_ifu_invctl.v
   wire                 ifq_swl_stallreq;       // From ifqctl of sparc_ifu_ifqctl.v
   wire                 imd_dcl_abit_d;         // From imd of sparc_ifu_imd.v
   wire [3:0]           imd_dcl_brcond_d;       // From imd of sparc_ifu_imd.v
   wire [7:0]           imd_dcl_mvcond_d;       // From imd of sparc_ifu_imd.v
   wire                 inv_ifc_inv_pending;    // From invctl of sparc_ifu_invctl.v
   // wire [7:0]           mbist_icache_index;     // From mbist of sparc_ifu_mbist.v
   // wire                 mbist_icache_read;      // From mbist of sparc_ifu_mbist.v
   // wire [1:0]           mbist_icache_way;       // From mbist of sparc_ifu_mbist.v
   // wire                 mbist_icache_word;      // From mbist of sparc_ifu_mbist.v
   // wire                 mbist_icache_write;     // From mbist of sparc_ifu_mbist.v
   // wire                 mbist_ifq_run_bist;     // From mbist of sparc_ifu_mbist.v
   wire [3:0]           swl_dcl_thr_d;          // From swl of sparc_ifu_swl.v
   wire [3:0]           swl_dcl_thr_w2;         // From swl of sparc_ifu_swl.v
   wire                 swl_dec_divbusy_e;      // From swl of sparc_ifu_swl.v
   wire                 swl_dec_fp_enable_d;    // From swl of sparc_ifu_swl.v
   wire                 swl_dec_fpbusy_e;       // From swl of sparc_ifu_swl.v
   wire                 swl_dec_ibe_e;          // From swl of sparc_ifu_swl.v
   wire                 swl_dec_mulbusy_e;      // From swl of sparc_ifu_swl.v
   wire [10:0]          swl_sscan_thrstate;     // From swl of sparc_ifu_swl.v
   wire [33:0]          wsel_fdp_fetdata_s1;    // From wseldp of sparc_ifu_wseldp.v
   wire [33:0]          wsel_fdp_topdata_s1;    // From wseldp of sparc_ifu_wseldp.v
   wire                 wsr_fixed_inst_w;       // From dec of sparc_ifu_dec.v
   // End of automatics

   `ifndef NO_RTL_CSM
   wire [`TLB_CSM]      itlb_ifq_csm_s;
   wire                 fcl_itlb_csm_rd_vld_bf;
   `endif

   // tlb not auto instantiated
   wire           fcl_itlb_invall_f_l;	// From fcl of sparc_ifu_fcl.v

   wire           itlb_fcl_imiss_s_l;     // To fcl of sparc_ifu_fcl.v
   wire           itlb_fcl_tlbmiss_f_l;   // To fcl of sparc_ifu_fcl.v
   wire [`IC_WAY_ARRAY_MASK]     itlb_wsel_waysel_s1;     // To icd of sparc_ifu_icd.v
   wire [39:10]   itlb_ifq_paddr_s;       // To ifqdp of sparc_ifu_ifqdp.v, ...
   wire [42:0]    itlb_rd_tte_data;       // To errdp of sparc_ifu_errdp.v
   wire [58:0]    itlb_rd_tte_tag;        // To errdp of sparc_ifu_errdp.v

   wire           fcl_itlb_addr_mask_l;   // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_cam_bypass_bf; // From fcl of sparc_ifu_fcl.v
   wire [2:0]     fcl_itlb_cam_pid_bf;    // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_cam_real_bf;   // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_cam_vld_bf;    // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_data_rd_vld_bf;// From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_dmp_vld_bf;    // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_dmp_all_bf;    // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_tag_rd_vld_bf; // From fcl of sparc_ifu_fcl.v
   wire           fcl_itlb_wr_vld_bf;     // From fcl of sparc_ifu_fcl.v
   wire [47:2]    fdp_icd_vaddr_bf;       // From fdp of sparc_ifu_fdp.v
   wire [12:0]    fdp_itlb_ctxt_bf;       // From fdp of sparc_ifu_fdp.v
   wire [`IC_TLB_TAG_MASK_ALL]    ict_itlb_tags_f;        // From ict of bw_r_ict.v

   // sscan rename
   wire [3:0]       ifq_sscan_data;         // From ifqctl of sparc_ifu_ifqctl.v
   // bist rename
   // wire [7:0]       mbist_icache_wdata;


   // rptr bus for bist read of icache
   wire [67:0]      wsel_mbist_icache_data;

   // bus width mismatch
   wire [`IC_TAG_SZ:0] ifq_ict_wrtag_f;        // From ifqdp of sparc_ifu_ifqdp.v
   wire [`IC_TAG_SZ:0] ifq_ict_wrtag_bf;        // Tri: earlier signal for ibm srams

   // scan wires
   wire                scan0_1;
   wire                scan0_2;
   wire                scan0_3;
   wire                scan0_4;
   wire                scan0_5;
   wire                scan0_6;
   wire                scan0_7;
   wire                scan0_8;
   wire                scan0_9;
   wire                scan0_10;
   wire                scan0_11;
   wire                scan0_12;
   wire                scan0_13;

   wire                short_scan1_1;
   wire                short_scan0_1;
   wire                short_scan0_2;
//----------------------------------------------------------------------
// Code start here
//----------------------------------------------------------------------
   // sram wrapper interface
   // output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w10_rtap_data;
   // output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_itag_rtap_data;
   // output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w32_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w10_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_itag_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_icache_w32_rtap_data;
   wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] icv_rtap_data;
   input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
   input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;
   output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;

   assign srams_rtap_data = sram_itag_rtap_data
                                 | sram_icache_w10_rtap_data
                                 | sram_icache_w32_rtap_data;
                                 // | icv_rtap_data;

   // jtag interface
   output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;
   // assign core_rtap_data = `CORE_JTAG_BUS_WIDTH'd0;

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

   // sloppy implementation of overriding icache enable
   reg [3:0] lsu_ifu_icache_en_muxed;
   reg [3:0] lsu_ifu_icache_en_jtag;
   reg [3:0] lsu_ifu_icache_en_jtag_next;
   reg lsu_ifu_icache_en_locked;
   reg lsu_ifu_icache_en_locked_next;
   always @ *
   begin
      lsu_ifu_icache_en_locked_next = lsu_ifu_icache_en_locked;
      lsu_ifu_icache_en_jtag_next = lsu_ifu_icache_en_jtag;
      if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_ICACHE_EN)
      begin
         lsu_ifu_icache_en_locked_next = rtap_core_data[4];
         lsu_ifu_icache_en_jtag_next = rtap_core_data[3:0];
      end

      lsu_ifu_icache_en_muxed = lsu_ifu_icache_en;
      if (lsu_ifu_icache_en_locked)
         lsu_ifu_icache_en_muxed = lsu_ifu_icache_en_jtag;
   end
   always @ (posedge rclk)
   begin
      if (!arst_l)
      begin
         lsu_ifu_icache_en_locked = 1'b0;
         lsu_ifu_icache_en_jtag = 0;
      end
      else
      begin
         lsu_ifu_icache_en_locked = lsu_ifu_icache_en_locked_next;
         lsu_ifu_icache_en_jtag = lsu_ifu_icache_en_jtag_next;
      end
   end

   input          mem_write_disable;
   input          mux_drive_disable;


//   sparc_ifu_dtu dtu(
//		     .thr_config_in_w (exu_tlu_wsr_data_w[2:0]),
//		      /*AUTOINST*/);

   // decode
   sparc_ifu_dec dec(
                     .so                (scan0_1),
                     .si                (si0),
			/*AUTOINST*/
                     // Outputs
                     .ifu_exu_aluop_d   (ifu_exu_aluop_d[2:0]),
                     .ifu_exu_invert_d  (ifu_exu_invert_d),
                     .ifu_exu_useimm_d  (ifu_exu_useimm_d),
                     .ifu_exu_usecin_d  (ifu_exu_usecin_d),
                     .ifu_exu_enshift_d (ifu_exu_enshift_d),
                     .ifu_exu_tagop_d   (ifu_exu_tagop_d),
                     .ifu_exu_tv_d      (ifu_exu_tv_d),
                     .ifu_exu_muls_d    (ifu_exu_muls_d),
                     .ifu_exu_ialign_d  (ifu_exu_ialign_d),
                     .ifu_exu_range_check_jlret_d(ifu_exu_range_check_jlret_d),
                     .ifu_exu_range_check_other_d(ifu_exu_range_check_other_d),
                     .ifu_exu_shiftop_d (ifu_exu_shiftop_d[2:0]),
                     .ifu_exu_muldivop_d(ifu_exu_muldivop_d[4:0]),
                     .ifu_exu_wen_d     (ifu_exu_wen_d),
                     .ifu_exu_setcc_d   (ifu_exu_setcc_d),
                     .ifu_exu_rd_ifusr_e(ifu_exu_rd_ifusr_e),
                     .ifu_exu_rd_exusr_e(ifu_exu_rd_exusr_e),
                     .ifu_exu_rd_ffusr_e(ifu_exu_rd_ffusr_e),
                     .ifu_exu_rs1_vld_d (ifu_exu_rs1_vld_d),
                     .ifu_exu_rs2_vld_d (ifu_exu_rs2_vld_d),
                     .ifu_exu_rs3e_vld_d(ifu_exu_rs3e_vld_d),
                     .ifu_exu_rs3o_vld_d(ifu_exu_rs3o_vld_d),
                     .ifu_exu_use_rsr_e_l(ifu_exu_use_rsr_e_l),
                     .ifu_exu_save_d    (ifu_exu_save_d),
                     .ifu_exu_restore_d (ifu_exu_restore_d),
                     .ifu_exu_return_d  (ifu_exu_return_d),
                     .ifu_exu_flushw_e  (ifu_exu_flushw_e),
                     .ifu_exu_saved_e   (ifu_exu_saved_e),
                     .ifu_exu_restored_e(ifu_exu_restored_e),
                     .ifu_tlu_rsr_inst_d(ifu_tlu_rsr_inst_d),
                     .ifu_lsu_wsr_inst_d(ifu_lsu_wsr_inst_d),
                     .ifu_exu_wsr_inst_d(ifu_exu_wsr_inst_d),
                     .ifu_tlu_done_inst_d(ifu_tlu_done_inst_d),
                     .ifu_tlu_retry_inst_d(ifu_tlu_retry_inst_d),
                     .ifu_lsu_ld_inst_e (ifu_lsu_ld_inst_e),
                     .ifu_lsu_st_inst_e (ifu_lsu_st_inst_e),
                     .ifu_lsu_pref_inst_e(ifu_lsu_pref_inst_e),
                     .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                     .ifu_lsu_alt_space_d(ifu_lsu_alt_space_d),
                     .ifu_tlu_alt_space_d(ifu_tlu_alt_space_d),
                     .ifu_lsu_memref_d  (ifu_lsu_memref_d),
                     .ifu_lsu_sign_ext_e(ifu_lsu_sign_ext_e),
                     .ifu_lsu_ldstub_e  (ifu_lsu_ldstub_e),
                     .ifu_lsu_casa_e    (ifu_lsu_casa_e),
                     .ifu_exu_casa_d    (ifu_exu_casa_d),
                     .ifu_lsu_swap_e    (ifu_lsu_swap_e),
                     .ifu_tlu_mb_inst_e (ifu_tlu_mb_inst_e),
                     .ifu_tlu_sir_inst_m(ifu_tlu_sir_inst_m),
                     .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                     .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                     .ifu_lsu_ldst_fp_e (ifu_lsu_ldst_fp_e),
                     .ifu_lsu_ldst_size_e(ifu_lsu_ldst_size_e[1:0]),
                     .ifu_ffu_fpop1_d   (ifu_ffu_fpop1_d),
                     .ifu_ffu_visop_d   (ifu_ffu_visop_d),
                     .ifu_ffu_fpop2_d   (ifu_ffu_fpop2_d),
                     .ifu_ffu_fld_d     (ifu_ffu_fld_d),
                     .ifu_ffu_fst_d     (ifu_ffu_fst_d),
                     .ifu_ffu_ldst_size_d(ifu_ffu_ldst_size_d),
                     .ifu_ffu_ldfsr_d   (ifu_ffu_ldfsr_d),
                     .ifu_ffu_ldxfsr_d  (ifu_ffu_ldxfsr_d),
                     .ifu_ffu_stfsr_d   (ifu_ffu_stfsr_d),
                     .ifu_ffu_quad_op_e (ifu_ffu_quad_op_e),
                     .dec_fcl_rdsr_sel_pc_d(dec_fcl_rdsr_sel_pc_d),
                     .dec_fcl_rdsr_sel_thr_d(dec_fcl_rdsr_sel_thr_d),
                     .dec_imd_call_inst_d(dec_imd_call_inst_d),
                     .dtu_fcl_flush_sonly_e(dtu_fcl_flush_sonly_e),
                     .dtu_fcl_illinst_e (dtu_fcl_illinst_e),
                     .dtu_fcl_fpdis_e   (dtu_fcl_fpdis_e),
                     .dtu_fcl_privop_e  (dtu_fcl_privop_e),
                     .dtu_fcl_imask_hit_e(dtu_fcl_imask_hit_e),
                     .dtu_fcl_br_inst_d (dtu_fcl_br_inst_d),
                     .dtu_fcl_sir_inst_e(dtu_fcl_sir_inst_e),
                     .dtu_ifq_kill_latest_d(dtu_ifq_kill_latest_d),
                     .dec_swl_wrt_tcr_w (dec_swl_wrt_tcr_w),
                     .dec_swl_wrtfprs_w (dec_swl_wrtfprs_w),
                     .dec_swl_ll_done_d (dec_swl_ll_done_d),
                     .dec_swl_br_done_d (dec_swl_br_done_d),
                     .dec_swl_rdsr_sel_thr_d(dec_swl_rdsr_sel_thr_d),
                     .dec_swl_ld_inst_d (dec_swl_ld_inst_d),
                     .dec_swl_sta_inst_e(dec_swl_sta_inst_e),
                     .dec_swl_std_inst_d(dec_swl_std_inst_d),
                     .dec_swl_st_inst_d (dec_swl_st_inst_d),
                     .dec_swl_fpop_d    (dec_swl_fpop_d),
                     .dec_swl_allfp_d   (dec_swl_allfp_d),
                     .dec_swl_frf_upper_d(dec_swl_frf_upper_d),
                     .dec_swl_frf_lower_d(dec_swl_frf_lower_d),
                     .dec_swl_div_inst_d(dec_swl_div_inst_d),
                     .dec_swl_mul_inst_d(dec_swl_mul_inst_d),
                     .wsr_fixed_inst_w  (wsr_fixed_inst_w),
                     .ifu_exu_sethi_inst_d(ifu_exu_sethi_inst_d),
                     .dec_dcl_cctype_d  (dec_dcl_cctype_d[2:0]),
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),
                     .dtu_inst_d        (dtu_inst_d[31:0]),
                     .erb_dtu_imask     (erb_dtu_imask[38:0]),
                     .swl_dec_ibe_e     (swl_dec_ibe_e),
                     .dtu_inst_anull_e  (dtu_inst_anull_e),
                     .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
                     .fcl_dtu_tlzero_d  (fcl_dtu_tlzero_d),
                     .fcl_dtu_privmode_d(fcl_dtu_privmode_d),
                     .fcl_dtu_hprivmode_d(fcl_dtu_hprivmode_d),
                     .fcl_dtu_inst_vld_d(fcl_dtu_inst_vld_d),
                     .fcl_dtu_ely_inst_vld_d(fcl_dtu_ely_inst_vld_d),
                     .fcl_dec_intr_vld_d(fcl_dec_intr_vld_d),
                     .fcl_dtu_inst_vld_e(fcl_dtu_inst_vld_e),
                     .fcl_dec_dslot_s   (fcl_dec_dslot_s),
                     .swl_dec_mulbusy_e (swl_dec_mulbusy_e),
                     .swl_dec_fpbusy_e  (swl_dec_fpbusy_e),
                     .swl_dec_divbusy_e (swl_dec_divbusy_e),
                     .swl_dec_fp_enable_d(swl_dec_fp_enable_d));


   // Pipeline Control and Switch Logic
   sparc_ifu_swl swl(
                     .so                (scan0_2),
                     .si                (scan0_1),
		                 .thr_config_in_m	(exu_tlu_wsr_data_m[2:0]),
                     .extra_longlat_compl(4'b0),

		                 /*AUTOINST*/
                     // Outputs
                     .swl_sscan_thrstate(swl_sscan_thrstate[10:0]),
                     .dtu_reset         (dtu_reset),
                     .swl_dec_mulbusy_e (swl_dec_mulbusy_e),
                     .swl_dec_divbusy_e (swl_dec_divbusy_e),
                     .swl_dec_fpbusy_e  (swl_dec_fpbusy_e),
                     .swl_dec_fp_enable_d(swl_dec_fp_enable_d),
                     .swl_dec_ibe_e     (swl_dec_ibe_e),
                     .dtu_fcl_ntr_s     (dtu_fcl_ntr_s),
                     .dtu_fcl_running_s (dtu_fcl_running_s),
                     .dtu_fcl_rollback_g(dtu_fcl_rollback_g),
                     .dtu_fcl_retract_d (dtu_fcl_retract_d),
                     .dtu_fcl_thr_active(dtu_fcl_thr_active[3:0]),
                     .dtu_fcl_nextthr_bf(dtu_fcl_nextthr_bf[3:0]),
                     .swl_dcl_thr_d     (swl_dcl_thr_d[3:0]),
                     .swl_dcl_thr_w2    (swl_dcl_thr_w2[3:0]),
                     .esl_fcl_stall_bf  (esl_fcl_stall_bf),
                     .esl_fcl_switch_bf (esl_fcl_switch_bf),
                     .esl_fdp_sync_pcs_bf (esl_fdp_sync_pcs_bf),
                     .esl_fcl_ntr_s     (esl_fcl_ntr_s),
                     .esl_fdp_issue_prev_inst_s (esl_fdp_issue_prev_inst_s),
                     .esl_fcl_force_running_s (esl_fcl_force_running_s),
                     .dtu_fdp_thrconf_e (dtu_fdp_thrconf_e[40:0]),
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),
                     .gdbginit_l        (gdbginit_l),
                     .arst_l            (arst_l),
                     .grst_l            (grst_l),
                     .ctu_sscan_tid     (ctu_sscan_tid[3:0]),
                     .ifq_dtu_thrrdy    (ifq_dtu_thrrdy[3:0]),
                     .ifq_dtu_pred_rdy  (ifq_dtu_pred_rdy[3:0]),
                     .ifu_tlu_inst_vld_w(ifu_tlu_inst_vld_w),
                     .ifu_tlu_ttype_vld_m(ifu_tlu_ttype_vld_m),
                     .fcl_dtu_hprivmode_d(fcl_dtu_hprivmode_d),
                     .fcl_dtu_hprivmode_w2(fcl_dtu_hprivmode_w2),
                     .tlu_ifu_flush_pipe_w(tlu_ifu_flush_pipe_w),
                     .fcl_swl_flush_w   (fcl_swl_flush_w),
                     .fcl_dtu_sync_intr_d(fcl_dtu_sync_intr_d),
                     .fcl_dtu_nuke_thr_w(fcl_dtu_nuke_thr_w),
                     .fcl_dtu_rst_thr_w (fcl_dtu_rst_thr_w),
                     .fcl_dtu_resum_thr_w(fcl_dtu_resum_thr_w),
                     .fcl_dtu_thr_f     (fcl_dtu_thr_f[3:0]),
                     .tlu_hpstate_ibe   (tlu_hpstate_ibe[3:0]),
                     .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
                     .tlu_ifu_trappc_vld_w1(tlu_ifu_trappc_vld_w1),
                     .dec_swl_ll_done_d (dec_swl_ll_done_d),
                     .dec_swl_br_done_d (dec_swl_br_done_d),
                     .dec_swl_rdsr_sel_thr_d(dec_swl_rdsr_sel_thr_d),
                     .dec_swl_std_inst_d(dec_swl_std_inst_d),
                     .dec_swl_sta_inst_e(dec_swl_sta_inst_e),
                     .wsr_fixed_inst_w  (wsr_fixed_inst_w),
                     .dec_swl_ld_inst_d (dec_swl_ld_inst_d),
                     .dec_swl_mul_inst_d(dec_swl_mul_inst_d),
                     .dec_swl_div_inst_d(dec_swl_div_inst_d),
                     .dec_swl_fpop_d    (dec_swl_fpop_d),
                     .dec_swl_allfp_d   (dec_swl_allfp_d),
                     .dec_swl_frf_upper_d(dec_swl_frf_upper_d),
                     .dec_swl_frf_lower_d(dec_swl_frf_lower_d),
                     .dec_swl_wrtfprs_w (dec_swl_wrtfprs_w),
                     .dcl_swl_tcc_done_m(dcl_swl_tcc_done_m),
                     .exu_ifu_longop_done_g(exu_ifu_longop_done_g[3:0]),
                     .exu_ifu_spill_e   (exu_ifu_spill_e),
                     .lsu_ifu_ldst_cmplt(lsu_ifu_ldst_cmplt[3:0]),
                     .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
                     .lsu_ifu_stbcnt0   (lsu_ifu_stbcnt0[3:0]),
                     .lsu_ifu_stbcnt1   (lsu_ifu_stbcnt1[3:0]),
                     .lsu_ifu_stbcnt2   (lsu_ifu_stbcnt2[3:0]),
                     .lsu_ifu_stbcnt3   (lsu_ifu_stbcnt3[3:0]),
                     .lsu_ifu_quad_asi_e(lsu_ifu_quad_asi_e),
                     .ffu_ifu_fpop_done_w2(ffu_ifu_fpop_done_w2),
                     .ffu_ifu_tid_w2    (ffu_ifu_tid_w2[1:0]),
                     .ffu_ifu_fst_ce_w  (ffu_ifu_fst_ce_w),
                     .tlu_ifu_trap_tid_w1(tlu_ifu_trap_tid_w1[1:0]),
                     .tlu_ifu_pstate_pef(tlu_ifu_pstate_pef[3:0]),
                     .lsu_ifu_ldst_miss_g(lsu_ifu_ldst_miss_g),
                     .fcl_swl_int_activate_i3(fcl_swl_int_activate_i3[3:0]),
                     .fcl_swl_flush_wake_w(fcl_swl_flush_wake_w),
                     .ifq_swl_stallreq  (ifq_swl_stallreq),
                     .fcl_dtu_stall_bf  (fcl_dtu_stall_bf),
                     .fcl_swl_swout_f   (fcl_swl_swout_f),
                     .fcl_swl_swcvld_s  (fcl_swl_swcvld_s),
                     .fdp_fcl_swc_s2    (fdp_fcl_swc_s2),
                     .fcl_ifq_icmiss_s1 (fcl_ifq_icmiss_s1),
                     .fcl_dtu_inst_vld_e(fcl_dtu_inst_vld_e),
                     .fcl_dtu_intr_vld_e(fcl_dtu_intr_vld_e),
                     .fcl_dtu_inst_vld_d(fcl_dtu_inst_vld_d),
                     .erb_dtu_ifeterr_d1(erb_dtu_ifeterr_d1),
                     .dtu_inst_anull_e  (dtu_inst_anull_e),
                     .const_cpuid       (const_cpuid[3:0]),
                     .dec_swl_wrt_tcr_w (dec_swl_wrt_tcr_w),
                     .dec_swl_st_inst_d (dec_swl_st_inst_d),
                     .config_dtu_esl_en (config_dtu_esl_en),
                     .config_dtu_esl_sync_method (config_dtu_esl_sync_method),
                     .config_esl_lfsr_seed (config_esl_lfsr_seed),
                     .config_esl_lfsr_ld (config_esl_lfsr_ld),
                     .config_esl_pc_diff_thresh (config_esl_pc_diff_thresh),
                     .config_esl_counter_timeout (config_esl_counter_timeout),
                     .fdp_esl_t0inst_next_s2 (fdp_esl_t0inst_next_s2),
`ifndef CONFIG_NUM_THREADS
                     .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                     .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`elsif THREADS_3
                     .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
                     .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
`else
                     .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
                     .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
                     .fdp_esl_t3inst_next_s2 (fdp_esl_t3inst_next_s2),
`endif
`endif
                     .fdp_esl_t0inst_paddr_next_s2 (fdp_esl_t0inst_paddr_next_s2),
`ifndef CONFIG_NUM_THREADS
                     .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                     .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`elsif THREADS_3
                     .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
                     .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
`else
                     .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
                     .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
                     .fdp_esl_t3inst_paddr_next_s2 (fdp_esl_t3inst_paddr_next_s2),
`endif
`endif
                     .fdp_esl_t0pc_next_s2 (fdp_esl_t0pc_next_s2),
`ifndef CONFIG_NUM_THREADS
                     .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                     .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`elsif THREADS_3
                     .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
                     .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
`else
                     .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
                     .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
                     .fdp_esl_t3pc_next_s2 (fdp_esl_t3pc_next_s2),
`endif
`endif
                     .fcl_esl_tinst_vld_next_s (fcl_esl_tinst_vld_next_s),
                     .fcl_esl_brtaken_e (fcl_esl_brtaken_e),
                     .fcl_esl_brtaken_m (fcl_esl_brtaken_m),
                     .fcl_esl_thr_e (fcl_esl_thr_e),
                     .fcl_esl_thr_m (fcl_esl_thr_m),
                     .fcl_esl_inst_vld_d (fcl_esl_inst_vld_d),
                     .fcl_esl_inst_vld_e (fcl_esl_inst_vld_e),
                     .fcl_esl_inst_vld_m (fcl_esl_inst_vld_m),
                     .fcl_esl_thr_trap_bf (fcl_esl_thr_trap_bf),
                     .fcl_esl_rb_stg_s (fcl_esl_rb_stg_s),
                     .dcl_esl_br_inst_d (dcl_esl_br_inst_d),
                     .dcl_esl_br_inst_e (dcl_esl_br_inst_e),
                     .fdp_esl_brtrp_target_pc_bf_f (fdp_esl_brtrp_target_pc_bf_f),


                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                     );

   // Branch Logic
   sparc_ifu_dcl  dcl(
                      .so               (scan0_3),
                      .si               (scan0_2),
		                  .dtu_dcl_opf2_d	(dtu_inst_d[7]),
                      .fdp_dcl_op_s     (fdp_dtu_inst_s[31:30]),
                      .fdp_dcl_op3_s    (fdp_dtu_inst_s[24:19]),

		                  /*AUTOINST*/
                      // Outputs
                      .ifu_exu_kill_e   (ifu_exu_kill_e),
                      .ifu_exu_dontmv_regz0_e(ifu_exu_dontmv_regz0_e),
                      .ifu_exu_dontmv_regz1_e(ifu_exu_dontmv_regz1_e),
                      .ifu_exu_tcc_e    (ifu_exu_tcc_e),
                      .ifu_exu_dbrinst_d(ifu_exu_dbrinst_d),
                      .ifu_ffu_mvcnd_m  (ifu_ffu_mvcnd_m),
                      .dcl_fcl_bcregz0_e(dcl_fcl_bcregz0_e),
                      .dcl_fcl_bcregz1_e(dcl_fcl_bcregz1_e),
                      .dtu_inst_anull_e (dtu_inst_anull_e),
                      .dcl_swl_tcc_done_m(dcl_swl_tcc_done_m),
                      .dcl_imd_immdata_sel_simm13_d_l(dcl_imd_immdata_sel_simm13_d_l),
                      .dcl_imd_immdata_sel_movcc_d_l(dcl_imd_immdata_sel_movcc_d_l),
                      .dcl_imd_immdata_sel_sethi_d_l(dcl_imd_immdata_sel_sethi_d_l),
                      .dcl_imd_immdata_sel_movr_d_l(dcl_imd_immdata_sel_movr_d_l),
                      .dcl_imd_broff_sel_call_d_l(dcl_imd_broff_sel_call_d_l),
                      .dcl_imd_broff_sel_br_d_l(dcl_imd_broff_sel_br_d_l),
                      .dcl_imd_broff_sel_bcc_d_l(dcl_imd_broff_sel_bcc_d_l),
                      .dcl_imd_broff_sel_bpcc_d_l(dcl_imd_broff_sel_bpcc_d_l),
                      .dcl_imd_immbr_sel_br_d(dcl_imd_immbr_sel_br_d),
                      .dcl_esl_br_inst_d (dcl_esl_br_inst_d),
                      .dcl_esl_br_inst_e (dcl_esl_br_inst_e),
                      // Inputs
                      .rclk             (rclk),
                      .se               (se),
                      .dtu_reset        (dtu_reset),
                      .exu_ifu_cc_d     (exu_ifu_cc_d[7:0]),
                      .fcl_dcl_regz_e   (fcl_dcl_regz_e),
                      .exu_ifu_regn_e   (exu_ifu_regn_e),
                      .ffu_ifu_cc_w2    (ffu_ifu_cc_w2[7:0]),
                      .ffu_ifu_cc_vld_w2(ffu_ifu_cc_vld_w2[3:0]),
                      .tlu_ifu_flush_pipe_w(tlu_ifu_flush_pipe_w),
                      .swl_dcl_thr_d    (swl_dcl_thr_d[3:0]),
                      .swl_dcl_thr_w2   (swl_dcl_thr_w2[3:0]),
                      .imd_dcl_brcond_d (imd_dcl_brcond_d[3:0]),
                      .imd_dcl_mvcond_d (imd_dcl_mvcond_d[7:0]),
                      .imd_dcl_abit_d   (imd_dcl_abit_d),
                      .dec_dcl_cctype_d (dec_dcl_cctype_d[2:0]),
                      .fcl_dtu_inst_vld_e(fcl_dtu_inst_vld_e),
                      .fcl_dtu_intr_vld_e(fcl_dtu_intr_vld_e),
                      .ifu_tlu_flush_w  (ifu_tlu_flush_w));

/*   sparc_ifu_imd AUTO_TEMPLATE(
                         .dcl_imd_call_inst_d (dec_imd_call_inst_d),
                         );

*/
   sparc_ifu_imd  imd(
                      .so               (scan0_4),
                      .si               (scan0_3),

                      /*AUTOINST*/
                      // Outputs
                      .ifu_exu_imm_data_d(ifu_exu_imm_data_d[31:0]),
                      .dtu_inst_d       (dtu_inst_d[31:0]),
                      .ifu_exu_rd_d     (ifu_exu_rd_d[4:0]),
                      .ifu_lsu_rd_e     (ifu_lsu_rd_e[4:0]),
                      .ifu_lsu_imm_asi_d(ifu_lsu_imm_asi_d[7:0]),
                      .ifu_tlu_imm_asi_d(ifu_tlu_imm_asi_d[8:0]),
                      .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                      .ifu_tlu_sraddr_d (ifu_tlu_sraddr_d[6:0]),
                      .ifu_tlu_sraddr_d_v2(ifu_tlu_sraddr_d_v2[6:0]),
                      .imd_dcl_brcond_d (imd_dcl_brcond_d[3:0]),
                      .imd_dcl_mvcond_d (imd_dcl_mvcond_d[7:0]),
                      .imd_dcl_abit_d   (imd_dcl_abit_d),
                      .ifu_ffu_frs1_d   (ifu_ffu_frs1_d[4:0]),
                      .ifu_ffu_frs2_d   (ifu_ffu_frs2_d[4:0]),
                      .ifu_ffu_frd_d    (ifu_ffu_frd_d[4:0]),
                      .ifu_ffu_fpopcode_d(ifu_ffu_fpopcode_d[8:0]),
                      .ifu_ffu_fcc_num_d(ifu_ffu_fcc_num_d[1:0]),
                      // Inputs
                      .rclk             (rclk),
                      .se               (se),
                      .fdp_dtu_inst_s   (fdp_dtu_inst_s[31:0]),
                      .fcl_imd_oddwin_d (fcl_imd_oddwin_d),
                      .dcl_imd_immdata_sel_simm13_d_l(dcl_imd_immdata_sel_simm13_d_l),
                      .dcl_imd_immdata_sel_movcc_d_l(dcl_imd_immdata_sel_movcc_d_l),
                      .dcl_imd_immdata_sel_sethi_d_l(dcl_imd_immdata_sel_sethi_d_l),
                      .dcl_imd_immdata_sel_movr_d_l(dcl_imd_immdata_sel_movr_d_l),
                      .dcl_imd_broff_sel_call_d_l(dcl_imd_broff_sel_call_d_l),
                      .dcl_imd_broff_sel_br_d_l(dcl_imd_broff_sel_br_d_l),
                      .dcl_imd_broff_sel_bcc_d_l(dcl_imd_broff_sel_bcc_d_l),
                      .dcl_imd_broff_sel_bpcc_d_l(dcl_imd_broff_sel_bpcc_d_l),
                      .dcl_imd_immbr_sel_br_d(dcl_imd_immbr_sel_br_d),
                      .dcl_imd_call_inst_d(dec_imd_call_inst_d)); // Templated

   sparc_ifu_fdp  fdp(
                      .so               (scan0_5),
                      .si               (scan0_4),
                     .fdp_itlb_ctxt_bf (fdp_itlb_ctxt_bf[12:0]),
                      .fdp_icd_vaddr_bf (fdp_icd_vaddr_bf[47:2]),
                      .icd_fdp_fetdata_s1(wsel_fdp_fetdata_s1[32:0]),
                      .icd_fdp_topdata_s1(wsel_fdp_topdata_s1[32:0]),
                      // eco 5362
                      .fcl_fdp_addr_mask_d(ifu_exu_addr_mask_d),
                      /*AUTOINST*/
                      // Outputs
                      .fdp_icv_index_bf (fdp_icv_index_bf[`IC_IDX_HI:5]),
                      .fdp_erb_pc_f     (fdp_erb_pc_f[47:0]),
                      .fdp_dtu_inst_s   (fdp_dtu_inst_s[31:0]),
                      .ifu_exu_pc_d     (ifu_exu_pc_d[47:0]),
                      .ifu_exu_rs1_s    (ifu_exu_rs1_s[4:0]),
                      .ifu_exu_rs2_s    (ifu_exu_rs2_s[4:0]),
                      .ifu_exu_rs3_s    (ifu_exu_rs3_s[4:0]),
                      .ifu_tlu_pc_m     (ifu_tlu_pc_m[48:0]),
                      .ifu_tlu_npc_m    (ifu_tlu_npc_m[48:0]),
                      .ifu_tlu_pc_oor_e (ifu_tlu_pc_oor_e),
                      .ifu_exu_pcver_e  (ifu_exu_pcver_e[63:0]),
                      .fdp_fcl_swc_s2   (fdp_fcl_swc_s2),
                      .fdp_fcl_pc_oor_vec_f(fdp_fcl_pc_oor_vec_f[3:0]),
                      .fdp_fcl_pc_oor_e (fdp_fcl_pc_oor_e),
                      .fdp_fcl_op_s     (fdp_fcl_op_s[1:0]),
                      .fdp_fcl_op3_s    (fdp_fcl_op3_s[5:2]),
                      .fdp_fcl_ibit_s   (fdp_fcl_ibit_s),
                      .fdp_esl_t0inst_next_s2 (fdp_esl_t0inst_next_s2),
`ifndef CONFIG_NUM_THREADS
                      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
`elsif THREADS_3
                      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
                      .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
`else
                      .fdp_esl_t1inst_next_s2 (fdp_esl_t1inst_next_s2),
                      .fdp_esl_t2inst_next_s2 (fdp_esl_t2inst_next_s2),
                      .fdp_esl_t3inst_next_s2 (fdp_esl_t3inst_next_s2),
`endif
`endif
                      .fdp_esl_t0inst_paddr_next_s2 (fdp_esl_t0inst_paddr_next_s2),
`ifndef CONFIG_NUM_THREADS
                      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
`elsif THREADS_3
                      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
                      .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
`else
                      .fdp_esl_t1inst_paddr_next_s2 (fdp_esl_t1inst_paddr_next_s2),
                      .fdp_esl_t2inst_paddr_next_s2 (fdp_esl_t2inst_paddr_next_s2),
                      .fdp_esl_t3inst_paddr_next_s2 (fdp_esl_t3inst_paddr_next_s2),
`endif
`endif
                      .fdp_esl_t0pc_next_s2 (fdp_esl_t0pc_next_s2),
`ifndef CONFIG_NUM_THREADS
                      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
                      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
`elsif THREADS_3
                      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
                      .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
`else
                      .fdp_esl_t1pc_next_s2 (fdp_esl_t1pc_next_s2),
                      .fdp_esl_t2pc_next_s2 (fdp_esl_t2pc_next_s2),
                      .fdp_esl_t3pc_next_s2 (fdp_esl_t3pc_next_s2),
`endif
`endif
                      .fdp_esl_brtrp_target_pc_bf_f (fdp_esl_brtrp_target_pc_bf_f),
                      // Inputs
                      .rclk             (rclk),
                      .se               (se),
                      .const_maskid     (const_maskid[7:0]),
                      .lsu_t0_pctxt_state(lsu_t0_pctxt_state[12:0]),
                      .lsu_t1_pctxt_state(lsu_t1_pctxt_state[12:0]),
                      .lsu_t2_pctxt_state(lsu_t2_pctxt_state[12:0]),
                      .lsu_t3_pctxt_state(lsu_t3_pctxt_state[12:0]),
                      .exu_ifu_brpc_e   (exu_ifu_brpc_e[47:0]),
                      .tlu_ifu_trappc_w2(tlu_ifu_trappc_w2[48:0]),
                      .tlu_ifu_trapnpc_w2(tlu_ifu_trapnpc_w2[48:0]),
                      .tlu_itlb_dmp_nctxt_g(tlu_itlb_dmp_nctxt_g),
                      .tlu_itlb_dmp_actxt_g(tlu_itlb_dmp_actxt_g),
                      .tlu_itlb_tte_tag_w2(tlu_itlb_tte_tag_w2[12:0]),
                      .dtu_fdp_thrconf_e(dtu_fdp_thrconf_e[40:0]),
                      .ifq_fdp_fill_inst(ifq_fdp_fill_inst[32:0]),
                      .fcl_fdp_oddwin_s (fcl_fdp_oddwin_s),
                      .fcl_fdp_pcoor_vec_f(fcl_fdp_pcoor_vec_f[3:0]),
                      .fcl_fdp_pcoor_f  (fcl_fdp_pcoor_f),
                      .fcl_fdp_mask32b_f(fcl_fdp_mask32b_f),
                      .fcl_fdp_tctxt_sel_prim(fcl_fdp_tctxt_sel_prim[3:0]),
                      .fcl_fdp_usenir_sel_nir_s1(fcl_fdp_usenir_sel_nir_s1),
                      .fcl_fdp_rbinst_sel_inste_s(fcl_fdp_rbinst_sel_inste_s[3:0]),
                      .fcl_fdp_thrtnpc_sel_tnpc_l(fcl_fdp_thrtnpc_sel_tnpc_l[3:0]),
                      .fcl_fdp_thrtnpc_sel_npcw_l(fcl_fdp_thrtnpc_sel_npcw_l[3:0]),
                      .fcl_fdp_thrtnpc_sel_pcf_l(fcl_fdp_thrtnpc_sel_pcf_l[3:0]),
                      .fcl_fdp_thrtnpc_sel_old_l(fcl_fdp_thrtnpc_sel_old_l[3:0]),
                      .fcl_fdp_thr_s1_l (fcl_fdp_thr_s1_l[3:0]),
                      .fcl_fdp_next_thr_bf_l(fcl_fdp_next_thr_bf_l[3:0]),
                      .fcl_fdp_next_ctxt_bf_l(fcl_fdp_next_ctxt_bf_l[3:0]),
                      .fcl_fdp_thr_s2_l (fcl_fdp_thr_s2_l[3:0]),
                      .fcl_fdp_nirthr_s1_l(fcl_fdp_nirthr_s1_l[3:0]),
                      .fcl_fdp_tpcbf_sel_pcp4_bf_l(fcl_fdp_tpcbf_sel_pcp4_bf_l[3:0]),
                      .fcl_fdp_tpcbf_sel_brpc_bf_l(fcl_fdp_tpcbf_sel_brpc_bf_l[3:0]),
                      .fcl_fdp_tpcbf_sel_trap_bf_l(fcl_fdp_tpcbf_sel_trap_bf_l[3:0]),
                      .fcl_fdp_tpcbf_sel_old_bf_l(fcl_fdp_tpcbf_sel_old_bf_l[3:0]),
                      .fcl_fdp_pcbf_sel_swpc_bf_l(fcl_fdp_pcbf_sel_swpc_bf_l),
                      .fcl_fdp_pcbf_sel_nosw_bf_l(fcl_fdp_pcbf_sel_nosw_bf_l),
                      .fcl_fdp_pcbf_sel_br_bf_l(fcl_fdp_pcbf_sel_br_bf_l),
                      .fcl_fdp_trrbpc_sel_trap_bf_l(fcl_fdp_trrbpc_sel_trap_bf_l[3:0]),
                      .fcl_fdp_trrbpc_sel_rb_bf_l(fcl_fdp_trrbpc_sel_rb_bf_l[3:0]),
                      .fcl_fdp_trrbpc_sel_err_bf_l(fcl_fdp_trrbpc_sel_err_bf_l[3:0]),
                      .fcl_fdp_trrbpc_sel_pcs_bf_l(fcl_fdp_trrbpc_sel_pcs_bf_l[3:0]),
                      .fcl_fdp_noswpc_sel_tnpc_l_bf(fcl_fdp_noswpc_sel_tnpc_l_bf),
                      .fcl_fdp_noswpc_sel_old_l_bf(fcl_fdp_noswpc_sel_old_l_bf),
                      .fcl_fdp_noswpc_sel_inc_l_bf(fcl_fdp_noswpc_sel_inc_l_bf),
                      .fcl_fdp_nextpcs_sel_pce_f_l(fcl_fdp_nextpcs_sel_pce_f_l[3:0]),
                      .fcl_fdp_nextpcs_sel_pcd_f_l(fcl_fdp_nextpcs_sel_pcd_f_l[3:0]),
                      .fcl_fdp_nextpcs_sel_pcs_f_l(fcl_fdp_nextpcs_sel_pcs_f_l[3:0]),
                      .fcl_fdp_nextpcs_sel_pcf_f_l(fcl_fdp_nextpcs_sel_pcf_f_l[3:0]),
                      .fcl_fdp_rdsr_sel_pc_e_l(fcl_fdp_rdsr_sel_pc_e_l),
                      .fcl_fdp_rdsr_sel_ver_e_l(fcl_fdp_rdsr_sel_ver_e_l),
                      .fcl_fdp_rdsr_sel_thr_e_l(fcl_fdp_rdsr_sel_thr_e_l),
                      .fcl_fdp_inst_sel_curr_s_l(fcl_fdp_inst_sel_curr_s_l),
                      .fcl_fdp_inst_sel_switch_s_l(fcl_fdp_inst_sel_switch_s_l),
                      .fcl_fdp_inst_sel_nir_s_l(fcl_fdp_inst_sel_nir_s_l),
                      .fcl_fdp_inst_sel_nop_s_l(fcl_fdp_inst_sel_nop_s_l),
                      .fcl_fdp_tinst_sel_curr_s_l(fcl_fdp_tinst_sel_curr_s_l[3:0]),
                      .fcl_fdp_tinst_sel_rb_s_l(fcl_fdp_tinst_sel_rb_s_l[3:0]),
                      .fcl_fdp_tinst_sel_old_s_l(fcl_fdp_tinst_sel_old_s_l[3:0]),
                      .fcl_fdp_tinst_sel_ifq_s_l(fcl_fdp_tinst_sel_ifq_s_l[3:0]),
                      .fcl_fdp_dmpthr_l (fcl_fdp_dmpthr_l[3:0]),
                      .fcl_fdp_ctxt_sel_dmp_bf_l(fcl_fdp_ctxt_sel_dmp_bf_l),
                      .fcl_fdp_ctxt_sel_sw_bf_l(fcl_fdp_ctxt_sel_sw_bf_l),
                      .fcl_fdp_ctxt_sel_curr_bf_l(fcl_fdp_ctxt_sel_curr_bf_l),
                      .itlb_fdp_paddr_s(itlb_ifq_paddr_s[39:10]),
                      .fcl_fdp_tlbmiss_s1 (fcl_fdp_tlbmiss_s1),
                      .ifq_fdp_fill_paddr(ifq_fdp_fill_paddr[39:2]),
                      .config_dtu_esl_en (config_dtu_esl_en),
                      .esl_fdp_sync_pcs_bf (esl_fdp_sync_pcs_bf),
                      .esl_fdp_issue_prev_inst_s (esl_fdp_issue_prev_inst_s),

                     .fdp_fcl_jtag_breakpoint_hit(fdp_fcl_jtag_breakpoint_hit),

                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                      );

   sparc_ifu_fcl fcl(
                     .so                (short_scan1_1),
                     .si                (short_si1),
                     .rst_tri_en        (mux_drive_disable),

                     // keep around in case we need it later
                     .ifu_reset_l       (),

		                 .fdp_fcl_va2_bf    (fdp_icd_vaddr_bf[2]),
                     .itlb_fcl_priv_s1  (itlb_rd_tte_data[`STLB_DATA_P]),
                     .tlu_fcl_dmp_pid_bf (tlu_itlb_tte_tag_w2[58:56]),
                     .tlu_fcl_dmp_real_bf (tlu_itlb_tte_tag_w2[55]),
                     .itlb_fcl_cp_s1    (itlb_rd_tte_data[`STLB_DATA_CP]),
                     // need these here since itlb is not auto inst'ed
		                 .fcl_itlb_invall_f_l(fcl_itlb_invall_f_l),
                     .fcl_itlb_cam_vld_bf(fcl_itlb_cam_vld_bf),
                     .fcl_itlb_cam_bypass_bf(fcl_itlb_cam_bypass_bf),
                     .fcl_itlb_addr_mask_l(fcl_itlb_addr_mask_l),
                     .fcl_itlb_cam_real_bf(fcl_itlb_cam_real_bf),
                     .fcl_itlb_cam_pid_bf(fcl_itlb_cam_pid_bf[2:0]),
                     .fcl_itlb_wr_vld_bf(fcl_itlb_wr_vld_bf),
                     .fcl_itlb_dmp_vld_bf(fcl_itlb_dmp_vld_bf),
                     .fcl_itlb_dmp_all_bf(fcl_itlb_dmp_all_bf),
                     .fcl_itlb_tag_rd_vld_bf(fcl_itlb_tag_rd_vld_bf),
                     .fcl_itlb_data_rd_vld_bf(fcl_itlb_data_rd_vld_bf),

                     // eco 5362
                     .fcl_fdp_addr_mask_d(ifu_exu_addr_mask_d),

		      /*AUTOINST*/
                     // Outputs

                     `ifndef NO_RTL_CSM
                     .fcl_itlb_csm_rd_vld_bf(fcl_itlb_csm_rd_vld_bf),
                     `endif
                     .fcl_icd_rdreq_bf  (fcl_icd_rdreq_bf),
                     .fcl_icv_rdreq_bf  (fcl_icv_rdreq_bf),
                     .fcl_icd_wrreq_bf  (fcl_icd_wrreq_bf),
                     .fcl_ict_wrreq_bf  (fcl_ict_wrreq_bf),
                     .fcl_icv_wrreq_bf  (fcl_icv_wrreq_bf),
                     .fcl_icd_index_sel_ifq_bf(fcl_icd_index_sel_ifq_bf),
                     .fcl_ifq_grant_bf  (fcl_ifq_grant_bf),
                     .fcl_ifq_icmiss_s1 (fcl_ifq_icmiss_s1),
                     .fcl_ifq_rdreq_s1  (fcl_ifq_rdreq_s1),
                     .fcl_ifq_icache_en_s_l(fcl_ifq_icache_en_s_l),
                     .fcl_ifq_thr_s1    (fcl_ifq_thr_s1[1:0]),
                     .fcl_ifq_canthr    (fcl_ifq_canthr[3:0]),
                     .fcl_erb_ievld_s1  (fcl_erb_ievld_s1),
                     .fcl_erb_tevld_s1  (fcl_erb_tevld_s1),
                     .fcl_erb_immuevld_s1(fcl_erb_immuevld_s1),
                     .ifu_lsu_thrid_s   (ifu_lsu_thrid_s[1:0]),
                     .fcl_erb_asi_tid_f (fcl_erb_asi_tid_f[1:0]),
                     .fcl_erb_clear_iferr(fcl_erb_clear_iferr[3:0]),
                     .fcl_erb_itlbrd_vld_s(fcl_erb_itlbrd_vld_s),
                     .fcl_erb_itlbrd_data_s(fcl_erb_itlbrd_data_s),
                     .fcl_dec_dslot_s   (fcl_dec_dslot_s),
                     .fcl_dtu_inst_vld_e(fcl_dtu_inst_vld_e),
                     .fcl_dtu_intr_vld_e(fcl_dtu_intr_vld_e),
                     .fcl_dtu_inst_vld_d(fcl_dtu_inst_vld_d),
                     .fcl_dtu_ely_inst_vld_d(fcl_dtu_ely_inst_vld_d),
                     .fcl_dec_intr_vld_d(fcl_dec_intr_vld_d),
                     .fcl_erb_inst_issue_d(fcl_erb_inst_issue_d),
                     .fcl_erb_inst_vld_d1(fcl_erb_inst_vld_d1),
                     .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                     .ifu_exu_inst_vld_e(ifu_exu_inst_vld_e),
                     .ifu_exu_inst_vld_w(ifu_exu_inst_vld_w),
                     .ifu_spu_inst_vld_w(ifu_spu_inst_vld_w),
                     .ifu_tlu_inst_vld_w(ifu_tlu_inst_vld_w),
                     .ifu_tlu_flush_w   (ifu_tlu_flush_w),
                     .ifu_tlu_flush_m   (ifu_tlu_flush_m),
                     .fcl_swl_int_activate_i3(fcl_swl_int_activate_i3[3:0]),
                     .fcl_swl_flush_wake_w(fcl_swl_flush_wake_w),
                     .fcl_swl_flush_w   (fcl_swl_flush_w),
                     .fcl_dcl_regz_e    (fcl_dcl_regz_e),
                     .ifu_tlu_thrid_e   (ifu_tlu_thrid_e[1:0]),
                     .ifu_tlu_thrid_d   (ifu_tlu_thrid_d[1:0]),
                     .ifu_tlu_immu_miss_m(ifu_tlu_immu_miss_m),
                     .ifu_tlu_priv_violtn_m(ifu_tlu_priv_violtn_m),
                     .ifu_tlu_icmiss_e  (ifu_tlu_icmiss_e),
                     .ifu_tlu_ttype_vld_m(ifu_tlu_ttype_vld_m),
                     .ifu_exu_ttype_vld_m(ifu_exu_ttype_vld_m),
                     .ifu_mmu_trap_m    (ifu_mmu_trap_m),
                     .ifu_tlu_trap_m    (ifu_tlu_trap_m),
                     .ifu_tlu_ttype_m   (ifu_tlu_ttype_m[8:0]),
                     .ifu_tlu_hwint_m   (ifu_tlu_hwint_m),
                     .ifu_tlu_sftint_m  (ifu_tlu_sftint_m),
                     .ifu_tlu_rstint_m  (ifu_tlu_rstint_m),
                     .fcl_dtu_rst_thr_w (fcl_dtu_rst_thr_w),
                     .fcl_dtu_resum_thr_w(fcl_dtu_resum_thr_w),
                     .ifu_tlu_itlb_done (ifu_tlu_itlb_done),
                     .ifu_spu_trap_ack  (ifu_spu_trap_ack),
                     .ifu_exu_tid_s2    (ifu_exu_tid_s2[1:0]),
                     .ifu_exu_ren1_s    (ifu_exu_ren1_s),
                     .ifu_exu_ren2_s    (ifu_exu_ren2_s),
                     .ifu_exu_ren3_s    (ifu_exu_ren3_s),
                     .ifu_exu_disable_ce_e(ifu_exu_disable_ce_e),
                     .fcl_dtu_sync_intr_d(fcl_dtu_sync_intr_d),
                     .fcl_dtu_tlzero_d  (fcl_dtu_tlzero_d),
                     .fcl_dtu_privmode_d(fcl_dtu_privmode_d),
                     .fcl_dtu_hprivmode_d(fcl_dtu_hprivmode_d),
                     .fcl_dtu_hprivmode_w2(fcl_dtu_hprivmode_w2),
                     .fcl_dtu_nuke_thr_w(fcl_dtu_nuke_thr_w),
                     .fcl_swl_swout_f   (fcl_swl_swout_f),
                     .fcl_dtu_stall_bf  (fcl_dtu_stall_bf),
                     .fcl_swl_swcvld_s  (fcl_swl_swcvld_s),
                     .fcl_dtu_thr_f     (fcl_dtu_thr_f[3:0]),
                     .fcl_imd_oddwin_d  (fcl_imd_oddwin_d),
                     .fcl_fdp_oddwin_s  (fcl_fdp_oddwin_s),
                     .fcl_fdp_pcoor_vec_f(fcl_fdp_pcoor_vec_f[3:0]),
                     .fcl_fdp_pcoor_f   (fcl_fdp_pcoor_f),
                     .fcl_fdp_mask32b_f (fcl_fdp_mask32b_f),
                     .fcl_fdp_tctxt_sel_prim(fcl_fdp_tctxt_sel_prim[3:0]),
                     .fcl_fdp_usenir_sel_nir_s1(fcl_fdp_usenir_sel_nir_s1),
                     .fcl_fdp_rbinst_sel_inste_s(fcl_fdp_rbinst_sel_inste_s[3:0]),
                     .fcl_fdp_thrtnpc_sel_tnpc_l(fcl_fdp_thrtnpc_sel_tnpc_l[3:0]),
                     .fcl_fdp_thrtnpc_sel_npcw_l(fcl_fdp_thrtnpc_sel_npcw_l[3:0]),
                     .fcl_fdp_thrtnpc_sel_pcf_l(fcl_fdp_thrtnpc_sel_pcf_l[3:0]),
                     .fcl_fdp_thrtnpc_sel_old_l(fcl_fdp_thrtnpc_sel_old_l[3:0]),
                     .fcl_fdp_thr_s1_l  (fcl_fdp_thr_s1_l[3:0]),
                     .fcl_fdp_next_thr_bf_l(fcl_fdp_next_thr_bf_l[3:0]),
                     .fcl_fdp_next_ctxt_bf_l(fcl_fdp_next_ctxt_bf_l[3:0]),
                     .fcl_fdp_nirthr_s1_l(fcl_fdp_nirthr_s1_l[3:0]),
                     .fcl_fdp_thr_s2_l  (fcl_fdp_thr_s2_l[3:0]),
                     .fcl_fdp_tpcbf_sel_pcp4_bf_l(fcl_fdp_tpcbf_sel_pcp4_bf_l[3:0]),
                     .fcl_fdp_tpcbf_sel_brpc_bf_l(fcl_fdp_tpcbf_sel_brpc_bf_l[3:0]),
                     .fcl_fdp_tpcbf_sel_trap_bf_l(fcl_fdp_tpcbf_sel_trap_bf_l[3:0]),
                     .fcl_fdp_tpcbf_sel_old_bf_l(fcl_fdp_tpcbf_sel_old_bf_l[3:0]),
                     .fcl_fdp_pcbf_sel_nosw_bf_l(fcl_fdp_pcbf_sel_nosw_bf_l),
                     .fcl_fdp_pcbf_sel_swpc_bf_l(fcl_fdp_pcbf_sel_swpc_bf_l),
                     .fcl_fdp_pcbf_sel_br_bf_l(fcl_fdp_pcbf_sel_br_bf_l),
                     .fcl_fdp_trrbpc_sel_trap_bf_l(fcl_fdp_trrbpc_sel_trap_bf_l[3:0]),
                     .fcl_fdp_trrbpc_sel_rb_bf_l(fcl_fdp_trrbpc_sel_rb_bf_l[3:0]),
                     .fcl_fdp_trrbpc_sel_err_bf_l(fcl_fdp_trrbpc_sel_err_bf_l[3:0]),
                     .fcl_fdp_trrbpc_sel_pcs_bf_l(fcl_fdp_trrbpc_sel_pcs_bf_l[3:0]),
                     .fcl_fdp_noswpc_sel_tnpc_l_bf(fcl_fdp_noswpc_sel_tnpc_l_bf),
                     .fcl_fdp_noswpc_sel_old_l_bf(fcl_fdp_noswpc_sel_old_l_bf),
                     .fcl_fdp_noswpc_sel_inc_l_bf(fcl_fdp_noswpc_sel_inc_l_bf),
                     .fcl_fdp_nextpcs_sel_pce_f_l(fcl_fdp_nextpcs_sel_pce_f_l[3:0]),
                     .fcl_fdp_nextpcs_sel_pcd_f_l(fcl_fdp_nextpcs_sel_pcd_f_l[3:0]),
                     .fcl_fdp_nextpcs_sel_pcs_f_l(fcl_fdp_nextpcs_sel_pcs_f_l[3:0]),
                     .fcl_fdp_nextpcs_sel_pcf_f_l(fcl_fdp_nextpcs_sel_pcf_f_l[3:0]),
                     .fcl_fdp_inst_sel_curr_s_l(fcl_fdp_inst_sel_curr_s_l),
                     .fcl_fdp_inst_sel_switch_s_l(fcl_fdp_inst_sel_switch_s_l),
                     .fcl_fdp_inst_sel_nir_s_l(fcl_fdp_inst_sel_nir_s_l),
                     .fcl_fdp_inst_sel_nop_s_l(fcl_fdp_inst_sel_nop_s_l),
                     .fcl_fdp_tinst_sel_curr_s_l(fcl_fdp_tinst_sel_curr_s_l[3:0]),
                     .fcl_fdp_tinst_sel_rb_s_l(fcl_fdp_tinst_sel_rb_s_l[3:0]),
                     .fcl_fdp_tinst_sel_old_s_l(fcl_fdp_tinst_sel_old_s_l[3:0]),
                     .fcl_fdp_tinst_sel_ifq_s_l(fcl_fdp_tinst_sel_ifq_s_l[3:0]),
                     .fcl_fdp_dmpthr_l  (fcl_fdp_dmpthr_l[3:0]),
                     .fcl_fdp_ctxt_sel_dmp_bf_l(fcl_fdp_ctxt_sel_dmp_bf_l),
                     .fcl_fdp_ctxt_sel_sw_bf_l(fcl_fdp_ctxt_sel_sw_bf_l),
                     .fcl_fdp_ctxt_sel_curr_bf_l(fcl_fdp_ctxt_sel_curr_bf_l),
                     .fcl_fdp_rdsr_sel_pc_e_l(fcl_fdp_rdsr_sel_pc_e_l),
                     .fcl_fdp_rdsr_sel_thr_e_l(fcl_fdp_rdsr_sel_thr_e_l),
                     .fcl_fdp_rdsr_sel_ver_e_l(fcl_fdp_rdsr_sel_ver_e_l),
                     .fcl_fdp_tlbmiss_s1 (fcl_fdp_tlbmiss_s1),
                     .fcl_esl_tinst_vld_next_s (fcl_esl_tinst_vld_next_s),
                     .fcl_esl_brtaken_e (fcl_esl_brtaken_e),
                     .fcl_esl_brtaken_m (fcl_esl_brtaken_m),
                     .fcl_esl_thr_e (fcl_esl_thr_e),
                     .fcl_esl_thr_m (fcl_esl_thr_m),
                     .fcl_esl_inst_vld_d (fcl_esl_inst_vld_d),
                     .fcl_esl_inst_vld_e (fcl_esl_inst_vld_e),
                     .fcl_esl_inst_vld_m (fcl_esl_inst_vld_m),
                     .fcl_esl_thr_trap_bf (fcl_esl_thr_trap_bf),
                     .fcl_esl_rb_stg_s (fcl_esl_rb_stg_s),
                     // Inputs
                     `ifndef NO_RTL_CSM
                     .tlu_itlb_csm_rd_g (tlu_itlb_csm_rd_g),
                     `endif
                     .rclk              (rclk),
                     .grst_l            (grst_l),
                     .arst_l            (arst_l),
                     .se                (se),
                     .sehold            (sehold),
                     .tlu_ifu_flush_pipe_w(tlu_ifu_flush_pipe_w),
                     .exu_ifu_va_oor_m  (exu_ifu_va_oor_m),
                     .exu_ifu_oddwin_s  (exu_ifu_oddwin_s[3:0]),
                     .spu_ifu_ttype_tid_w2(spu_ifu_ttype_tid_w2[1:0]),
                     .spu_ifu_ttype_vld_w2(spu_ifu_ttype_vld_w2),
                     .spu_ifu_ttype_w2  (spu_ifu_ttype_w2),
                     .erb_fcl_spu_uetrap(erb_fcl_spu_uetrap[3:0]),
                     .exu_ifu_regz_e    (exu_ifu_regz_e),
                     .dcl_fcl_bcregz0_e (dcl_fcl_bcregz0_e),
                     .dcl_fcl_bcregz1_e (dcl_fcl_bcregz1_e),
                     .dtu_fcl_rollback_g(dtu_fcl_rollback_g),
                     .dtu_fcl_retract_d (dtu_fcl_retract_d),
                     .dtu_fcl_br_inst_d (dtu_fcl_br_inst_d),
                     .dtu_fcl_sir_inst_e(dtu_fcl_sir_inst_e),
                     .dtu_fcl_privop_e  (dtu_fcl_privop_e),
                     .dtu_fcl_fpdis_e   (dtu_fcl_fpdis_e),
                     .dtu_fcl_imask_hit_e(dtu_fcl_imask_hit_e),
                     .dtu_fcl_illinst_e (dtu_fcl_illinst_e),
                     .dtu_fcl_thr_active(dtu_fcl_thr_active[3:0]),
                     .dec_fcl_rdsr_sel_pc_d(dec_fcl_rdsr_sel_pc_d),
                     .dec_fcl_rdsr_sel_thr_d(dec_fcl_rdsr_sel_thr_d),
                     .ifq_fcl_wrreq_bf  (ifq_fcl_wrreq_bf),
                     .ifq_fcl_icd_wrreq_bf(ifq_fcl_icd_wrreq_bf),
                     .ifq_fcl_ictv_wrreq_bf(ifq_fcl_ictv_wrreq_bf),
                     .ifq_fcl_rdreq_bf  (ifq_fcl_rdreq_bf),
                     .ifq_fcl_asi_tid_bf(ifq_fcl_asi_tid_bf[1:0]),
                     .ifq_fcl_asird_bf  (ifq_fcl_asird_bf),
                     .ifq_fcl_invreq_bf (ifq_fcl_invreq_bf),
                     .erb_fcl_itlb_ce_d1(erb_fcl_itlb_ce_d1),
                     .erb_dtu_ifeterr_d1(erb_dtu_ifeterr_d1),
                     .erb_fcl_ifet_uevec_d1(erb_fcl_ifet_uevec_d1[3:0]),
                     .erb_fcl_ue_trapvec(erb_fcl_ue_trapvec[3:0]),
                     .erb_fcl_ce_trapvec(erb_fcl_ce_trapvec[3:0]),
                     .dtu_fcl_nextthr_bf(dtu_fcl_nextthr_bf[3:0]),
                     .dtu_fcl_ntr_s     (dtu_fcl_ntr_s),
                     .dtu_fcl_running_s (dtu_fcl_running_s),
                     .dtu_fcl_flush_sonly_e(dtu_fcl_flush_sonly_e),
                     .fdp_fcl_swc_s2    (fdp_fcl_swc_s2),
                     .itlb_fcl_tlbmiss_f_l(itlb_fcl_tlbmiss_f_l),
                     .itlb_fcl_imiss_s_l(itlb_fcl_imiss_s_l),
                     .fdp_fcl_pc_oor_vec_f(fdp_fcl_pc_oor_vec_f[3:0]),
                     .fdp_fcl_pc_oor_e  (fdp_fcl_pc_oor_e),
                     .fdp_fcl_op_s      (fdp_fcl_op_s[1:0]),
                     .fdp_fcl_op3_s     (fdp_fcl_op3_s[5:2]),
                     .fdp_fcl_ibit_s    (fdp_fcl_ibit_s),
                     .lsu_ifu_stallreq  (lsu_ifu_stallreq),
                     .ffu_ifu_stallreq  (ffu_ifu_stallreq),
                     .ifq_fcl_stallreq  (ifq_fcl_stallreq),
                     .dtu_inst_anull_e  (dtu_inst_anull_e),
                     .ifq_fcl_fill_thr  (ifq_fcl_fill_thr[3:0]),
                     .ifq_fcl_flush_sonly_e(ifq_fcl_flush_sonly_e),
                     .tlu_ifu_trap_tid_w1(tlu_ifu_trap_tid_w1[1:0]),
                     .tlu_ifu_trappc_vld_w1(tlu_ifu_trappc_vld_w1),
                     .tlu_ifu_trapnpc_vld_w1(tlu_ifu_trapnpc_vld_w1),
                     .tlu_lsu_pstate_priv(tlu_lsu_pstate_priv[3:0]),
                     .tlu_lsu_pstate_am (tlu_lsu_pstate_am[3:0]),
                     .tlu_hpstate_priv  (tlu_hpstate_priv[3:0]),
                     .tlu_lsu_redmode   (tlu_lsu_redmode[3:0]),
                     .tlu_hpstate_enb   (tlu_hpstate_enb[3:0]),
                     .lsu_ifu_addr_real_l(lsu_ifu_addr_real_l[3:0]),
                     .lsu_pid_state0    (lsu_pid_state0[2:0]),
                     .lsu_pid_state1    (lsu_pid_state1[2:0]),
                     .lsu_pid_state2    (lsu_pid_state2[2:0]),
                     .lsu_pid_state3    (lsu_pid_state3[2:0]),
                     .lsu_ifu_icache_en (lsu_ifu_icache_en_muxed[3:0]),
                     .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
                     .lsu_ifu_t0_tlz    (lsu_ifu_t0_tlz),
                     .lsu_ifu_t1_tlz    (lsu_ifu_t1_tlz),
                     .lsu_ifu_t2_tlz    (lsu_ifu_t2_tlz),
                     .lsu_ifu_t3_tlz    (lsu_ifu_t3_tlz),
                     .tlu_ifu_hwint_i3  (tlu_ifu_hwint_i3[3:0]),
                     .tlu_ifu_pstate_ie (tlu_ifu_pstate_ie[3:0]),
                     .tlu_ifu_sftint_vld(tlu_ifu_sftint_vld[3:0]),
                     .tlu_ifu_hintp_vld (tlu_ifu_hintp_vld[3:0]),
                     .tlu_ifu_rerr_vld  (tlu_ifu_rerr_vld[3:0]),
                     .tlu_ifu_rstthr_i2 (tlu_ifu_rstthr_i2[3:0]),
                     .tlu_ifu_rstint_i2 (tlu_ifu_rstint_i2),
                     .tlu_ifu_resumint_i2(tlu_ifu_resumint_i2),
                     .tlu_ifu_nukeint_i2(tlu_ifu_nukeint_i2),
                     .tlu_itlb_wr_vld_g (tlu_itlb_wr_vld_g),
                     .tlu_itlb_dmp_vld_g(tlu_itlb_dmp_vld_g),
                     .tlu_itlb_dmp_all_g(tlu_itlb_dmp_all_g),
                     .tlu_itlb_data_rd_g(tlu_itlb_data_rd_g),
                     .tlu_itlb_tag_rd_g (tlu_itlb_tag_rd_g),
                     .tlu_itlb_invalidate_all_g(tlu_itlb_invalidate_all_g),
                     .tlu_idtlb_dmp_thrid_g(tlu_idtlb_dmp_thrid_g[1:0]),
                     .exu_ifu_ecc_ce_m  (exu_ifu_ecc_ce_m),
                     .ffu_ifu_fst_ce_w  (ffu_ifu_fst_ce_w),
                     .config_dtu_esl_en (config_dtu_esl_en),
                     .esl_fcl_stall_bf  (esl_fcl_stall_bf),
                     .esl_fcl_switch_bf (esl_fcl_switch_bf),
                     .esl_fcl_ntr_s (esl_fcl_ntr_s),
                     .esl_fdp_issue_prev_inst_s (esl_fdp_issue_prev_inst_s),
                     .esl_fcl_force_running_s (esl_fcl_force_running_s),

                     .fdp_fcl_jtag_breakpoint_hit(fdp_fcl_jtag_breakpoint_hit),

                     // .core_rtap_data          (core_rtap_data),
                     .rtap_core_val         (rtap_core_val),
                     .rtap_core_threadid         (rtap_core_threadid),
                     .rtap_core_id         (rtap_core_id),
                     .rtap_core_data         (rtap_core_data)
                     );

//   sparc_ifu_itlb itlb(
//                        .adj    (lsu_idtlb_mrgn[7:0]),
//			                  .reset  (fcl_itlb_invall_bf),
//                        .tlu_itlb_dmp_actxt_g(tlu_itlb_dmp_actxt_g),
//                        .itlb_vaddr_offset_f (fdp_erb_pc_f[`IC_IDX_HI:(`IC_IDX_HI-1)]),
//			                  /*AUTOINST*/
//                        // Outputs
//                        .ifu_lsu_tlb_writeable(ifu_lsu_tlb_writeable),
//                        .itlb_ifq_paddr_s(itlb_ifq_paddr_s[39:10]),
//                        .itlb_icd_waysel_s1(itlb_icd_waysel_s1[`IC_WAY_ARRAY_MASK]),
//                        .itlb_fcl_imiss_s_l(itlb_fcl_imiss_s_l),
//                        .itlb_fcl_tlbmiss_f_l(itlb_fcl_tlbmiss_f_l),
//                        .itlb_fcl_priv_s1(itlb_fcl_priv_s1),
//                        .itlb_rd_tte_data(itlb_rd_tte_data[42:0]),
//                        .itlb_rd_tte_tag(itlb_rd_tte_tag[58:0]),
//                        .so             (so),
                        // Inputs
//                        .clk            (clk),
//                        .se             (se),
//                        .si             (si),
//                        .fdp_icd_vaddr_bf(fdp_icd_vaddr_bf[47:10]),
//                        .fdp_itlb_ctxt_bf(fdp_itlb_ctxt_bf[12:0]),
//                        .ict_itlb_tags_f(ict_itlb_tags_f[`IC_TAG_ALL_HI:0]),
//                        .icv_itlb_valid_f(icv_itlb_valid_f[3:0]),
//                        .fcl_itlb_cam_vld_bf(fcl_itlb_cam_vld_bf),
//                        .fcl_itlb_wr_vld_bf(fcl_itlb_wr_vld_bf),
//                        .fcl_itlb_addr_mask_l(fcl_itlb_addr_mask_l),
//                        .fcl_itlb_dmp_vld_bf(fcl_itlb_dmp_vld_bf),
//                        .fcl_itlb_tag_rd_vld_bf(fcl_itlb_tag_rd_vld_bf),
//                        .fcl_itlb_data_rd_vld_bf(fcl_itlb_data_rd_vld_bf),
//                        .fcl_itlb_cam_real_bf(fcl_itlb_cam_real_bf),
//                        .fcl_itlb_cam_pid_bf(fcl_itlb_cam_pid_bf[2:0]),
//                        .tlu_itlb_tte_tag_w2(tlu_itlb_tte_tag_w2[58:0]),
//                        .tlu_itlb_tte_data_w2(tlu_itlb_tte_data_w2[42:0]),
//                        .tlu_itlb_rw_index_vld_g(tlu_itlb_rw_index_vld_g),
//                        .tlu_itlb_rw_index_g(tlu_itlb_rw_index_g[5:0]),
//                        .tlu_idtlb_dmp_key_g(tlu_idtlb_dmp_key_g[40:0]),
//                        .tlu_itlb_dmp_by_ctxt_g(tlu_itlb_dmp_by_ctxt_g),
//                        .tlu_itlb_dmp_all_g(tlu_itlb_dmp_all_g));

   bw_r_itlb itlb(
		              .tlb_pgnum_crit	(),
		              // Outputs
                       `ifndef NO_RTL_CSM
                       .tlb_rd_tte_csm         (itlb_ifq_csm_s),
                       .tlb_rd_tte_csm_crit    (),
                       `endif

		              .tlb_rd_tte_tag	 (itlb_rd_tte_tag[58:0]),  // 2
		              .tlb_rd_tte_data (itlb_rd_tte_data[42:0]), // 2
		              .tlb_pgnum	     (itlb_ifq_paddr_s[`IC_TAG_HI:10]), // 2
		              .tlb_cam_hit	   (itlb_fcl_tlbmiss_f_l),    // 1
		              .cache_way_hit   (itlb_wsel_waysel_s1[`IC_WAY_ARRAY_MASK]), // 2
		              .cache_hit       (itlb_fcl_imiss_s_l),      // 2
		              .so		(short_scan0_1),

		                  // Inputs
                  `ifndef NO_RTL_CSM
                  .tlb_wr_tte_csm_thrid   (tlu_idtlb_dmp_thrid_g[1:0]),
                  .tlb_wr_tte_csm         (tlu_itlb_tte_csm_w2),
                  .tlb_rd_csm_vld         (fcl_itlb_csm_rd_vld_bf),
                  .tlb_wr_csm_sel         (tlu_itlb_wr_csm_sel_g),

                  .cfg_csm_tlb_state      (cfg_ifu_csm_itlb_state),
                  .cfg_csm_tlb_chipid     (cfg_ifu_csm_itlb_chipid),
                  .cfg_csm_tlb_x          (cfg_ifu_csm_itlb_x),
                  .cfg_csm_tlb_y          (cfg_ifu_csm_itlb_y),
                  .cfg_csm_tlb_hdid       (cfg_ifu_csm_itlb_hdid),
                  .cfg_csm_tlb_hd_size    (cfg_ifu_csm_itlb_hd_size),
                  .cfg_csm_tlb_sdid       (cfg_ifu_csm_itlb_sdid),
                  .cfg_csm_tlb_lsid       (cfg_ifu_csm_itlb_lsid),

                  `endif

                  .rclk          (rclk),
                  .rst_tri_en    (mem_write_disable),
		              .tlb_cam_vld	(fcl_itlb_cam_vld_bf),       // 0

//`ifdef SPARC_HPV_EN
                  .tlb_cam_key   ({fdp_icd_vaddr_bf[47:28],  // 0
                                   1'b1,
                                   fdp_icd_vaddr_bf[27:22],
                                   1'b1,
                                   fdp_icd_vaddr_bf[21:16],
                                   1'b1,
                                   fdp_icd_vaddr_bf[15:13],
                                   1'b1,
                                   fcl_itlb_cam_real_bf,  // g is the same as r
                                   fcl_itlb_cam_real_bf}),// this is the r bit

//`else // !`ifdef SPARC_HPV_EN
//                  .tlb_cam_key ({1'b0, // unused          // 0
//                                 fdp_icd_vaddr_bf[47:35],
//					                       1'b1, // v47_22
//					                       fdp_icd_vaddr_bf[34:22],
//					                       fdp_icd_vaddr_bf[21:20],
//					                       1'b1, // v21_19
//					                       fdp_icd_vaddr_bf[19],
//					                       fdp_icd_vaddr_bf[18:17],
//					                       1'b1, // v18_16
//					                       fdp_icd_vaddr_bf[16],
//					                       fdp_icd_vaddr_bf[15:14],
//					                       1'b1, // v15_13
//					                       fdp_icd_vaddr_bf[13], // global bit
//					                       1'b0}),  // all r's are zero
//
//                  .tlb_cam_real     (fcl_itlb_cam_real_bf),    // 0
//		              .tlb_demap_ctxt 	(tlu_itlb_dmp_by_ctxt_g),  // 0
//`endif

                  .tlb_cam_pid    (fcl_itlb_cam_pid_bf[2:0]),  // 0
		              .tlb_demap_key	(tlu_idtlb_dmp_key_g[40:0]), // 0

		              .tlb_addr_mask_l (fcl_itlb_addr_mask_l),      // 0
		              .tlb_ctxt		     (fdp_itlb_ctxt_bf[12:0]),    // 0

		              .tlb_wr_vld	    (fcl_itlb_wr_vld_bf),         // 0
		              .tlb_wr_tte_tag	(tlu_itlb_tte_tag_w2[58:0]),  // 1
		              .tlb_wr_tte_data(tlu_itlb_tte_data_w2[42:0]), // 1

		              .tlb_rd_tag_vld	 (fcl_itlb_tag_rd_vld_bf),    // 0
		              .tlb_rd_data_vld (fcl_itlb_data_rd_vld_bf),   // 0
		              .tlb_rw_index_vld(tlu_itlb_rw_index_vld_g),   // 0
		              .tlb_rw_index	   (tlu_itlb_rw_index_g[5:0]),  // 0

		              .tlb_demap	    (fcl_itlb_dmp_vld_bf),        // 0
		              .tlb_demap_all	(fcl_itlb_dmp_all_bf),        // 0
                  .tlb_demap_auto (tlu_itlb_dmp_actxt_g),

// trin: since the TLB is configured at fixed 30b per entry, this is the only way to do it
//    until TLB is also parameterized
                    .cache_ptag  (ict_itlb_tags_f),

		              .cache_set_vld	(icv_itlb_valid_f[3:0]),     // 1

		              .tlb_bypass	    (fcl_itlb_cam_bypass_bf),    // 0
		              .tlb_bypass_va	(fdp_icd_vaddr_bf[12:10]),   // 0

		              .si		(short_si0),
		              .se		(se),
                  .hold (sehold),
		              .adj		    (lsu_idtlb_mrgn[7:0]),
                 // tlb expects this to be asynchronous reset!
                  .arst_l     (arst_l),
		              .rst_soft_l (fcl_itlb_invall_f_l));  // 1


   sparc_ifu_wseldp wseldp(
                           .so          (scan0_6),
                           .si          (scan0_5),
                           .wsel_mbist_icache_data(wsel_mbist_icache_data[67:0]),
                           // .wsel_mbist_icache_data(),
                         /*AUTOINST*/
                           // Outputs
                           .wsel_fdp_fetdata_s1(wsel_fdp_fetdata_s1[33:0]),
                           .wsel_fdp_topdata_s1(wsel_fdp_topdata_s1[33:0]),
                           // Inputs
                           .rclk        (rclk),
                           .se          (se),
                           .icd_wsel_fetdata_s1(icd_wsel_fetdata_s1[135:0]),
                           .icd_wsel_topdata_s1(icd_wsel_topdata_s1[135:0]),
                           .itlb_wsel_waysel_s1(itlb_wsel_waysel_s1[`IC_WAY_ARRAY_MASK]),
                           .ifq_erb_asiway_f(ifq_erb_asiway_f[`IC_WAY_MASK]));


//   sparc_ifu_icd icd
   bw_r_icd icd(
                .so                     (scan0_8),
                .si                     (scan0_7),
			           .fdp_icd_index_bf  (fdp_icd_vaddr_bf[`IC_IDX_HI:2]),
                 .ifq_icd_index_bf  ({ifq_icd_index_bf[`IC_IDX_HI:2]}),
                 .bist_ic_data      (8'b0),
                 // .bist_ic_data      (mbist_icache_wdata[7:0]),
                 .rst_tri_en        (mem_write_disable),
                 .reset_l           (arst_l),
			           /*AUTOINST*/
                // Outputs
                .icd_wsel_fetdata_s1    (icd_wsel_fetdata_s1[135:0]),
                .icd_wsel_topdata_s1    (icd_wsel_topdata_s1[135:0]),
                .icd_fuse_repair_value  (icd_fuse_repair_value[7:0]),
                .icd_fuse_repair_en     (icd_fuse_repair_en[1:0]),
                // Inputs
                .rclk                   (rclk),
                .se                     (se),
                .sehold                 (sehold),
                .fcl_icd_index_sel_ifq_bf(fcl_icd_index_sel_ifq_bf),
                .ifq_icd_wrway_bf       (ifq_icd_wrway_bf[`IC_WAY_MASK]),
                .ifq_icd_worden_bf      (ifq_icd_worden_bf[3:0]),
                .ifq_icd_wrdata_i2      (ifq_icd_wrdata_i2[135:0]),
                .fcl_icd_rdreq_bf       (fcl_icd_rdreq_bf),
                .fcl_icd_wrreq_bf       (fcl_icd_wrreq_bf),
                .ifq_icd_data_sel_old_i2(ifq_icd_data_sel_old_i2),
                .ifq_icd_data_sel_fill_i2(ifq_icd_data_sel_fill_i2),
                .ifq_icd_data_sel_bist_i2(ifq_icd_data_sel_bist_i2),
                .fuse_icd_wren          (1'b0),
                .fuse_icd_rid           (4'b0),
                .fuse_icd_repair_value  (8'b0),
                .fuse_icd_repair_en     (2'b0),
                .efc_spc_fuse_clk1      (1'b0),
                // .efc_spc_fuse_clk1      (efc_spc_fuse_clk1),

                // interface to srams
                .sram_icache_w10_rtap_data (sram_icache_w10_rtap_data),
                .sram_icache_w32_rtap_data (sram_icache_w32_rtap_data),
                .rtap_srams_bist_command (rtap_srams_bist_command),
                .rtap_srams_bist_data (rtap_srams_bist_data)
                );

/*   bw_r_ict AUTO_TEMPLATE(
                     // Inputs
                     .adj          (lsu_ictag_mrgn[3:0]),
                     .reset_l      (arst_l),
		                 .index0_x     (fdp_icd_vaddr_bf[`IC_IDX_HI:5]),
                     .index1_x     (ifq_icd_index_bf[`IC_IDX_HI:5]),
                     .index_sel_x  (fcl_icd_index_sel_ifq_bf),
                     .dec_wrway_x  (ifq_ict_dec_wrway_bf[`IC_WAY_ARRAY_MASK]),
                     .wrtag_w0_y   ({4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}),
                     .wrtag_w1_y   ({4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}),
                     .wrtag_w2_y   ({4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}),
                     .wrtag_w3_y   ({4'b0, ifq_ict_wrtag_f[`IC_TAG_SZ:0]}),
                     .rdreq_x      (fcl_icd_rdreq_bf),
                     .wrreq_x      (fcl_ict_wrreq_bf));
 */

   bw_r_ict ict(
                 .so                    (short_scan0_2),
                 .si                    (short_scan0_1),
                 .rdtag_y    (ict_itlb_tags_f),
                 .rst_tri_en        (mem_write_disable),

                     /*AUTOINST*/
                 // Inputs
                 .rclk                  (rclk),
                 .se                    (se),
                 .reset_l               (arst_l),                // Templated
                 .sehold                (sehold),
                 .index0_x              (fdp_icd_vaddr_bf[`IC_IDX_HI:5]), // Templated
                 .index1_x              (ifq_icd_index_bf[`IC_IDX_HI:5]), // Templated
                 .index_sel_x           (fcl_icd_index_sel_ifq_bf), // Templated
                 .dec_wrway_x           (ifq_ict_dec_wrway_bf[`IC_WAY_ARRAY_MASK]), // Templated
                 .rdreq_x               (fcl_icd_rdreq_bf),      // Templated
                 .wrreq_x               (fcl_ict_wrreq_bf),      // Templated
                 .wrtag_y            (ifq_ict_wrtag_f),// Templated
                 .wrtag_x            (ifq_ict_wrtag_bf),// Templated
                 .adj                   (lsu_ictag_mrgn[3:0]),

                 // debug interface
                 .sramid   (`BIST_ID_L1_ITAG),
                 .srams_rtap_data   (sram_itag_rtap_data),
                 .rtap_srams_bist_command   (rtap_srams_bist_command),
                 .rtap_srams_bist_data   (rtap_srams_bist_data)
                 );
//     sparc_ifu_icv icv
/*   sram_l1i_val AUTO_TEMPLATE(
                    // Outputs
                    .dout          (icv_itlb_valid_f[3:0]),
                    .so            (short_so0),
                    // Inputs
                    .clk           (clk),
                    .se            (se),
                    .sehold        (sehold),
                    .si            (short_scan0_2),
                    .rst_tri_en        (mem_write_disable),
                    .reset_l       (arst_l),
		                .rd_adr2       (fdp_icv_index_bf[`IC_IDX_HI:5]),
                    .rd_adr1       (ifq_icv_wrindex_bf[`IC_IDX_HI:5]),
                    .wr_adr        (ifq_icv_wrindex_bf[`IC_IDX_HI:7]),
                    .rd_adr1_sel   (fcl_ifq_grant_bf),
                    .din           (ifq_icv_wrdata_bf),
                    .bit_wen       (ifq_icv_wren_bf[15:0]),
                    .rd_en         (fcl_icv_rdreq_bf),
                    .wr_en         (fcl_icv_wrreq_bf));
 */
   sram_l1i_val  icv(/*AUTOINST*/
                     // Outputs
                     .dout              (icv_itlb_valid_f[3:0]), // Templated
                     .so                (short_so0),             // Templated
                     // Inputs
                     .rclk              (rclk),
                     .se                (se),                    // Templated
                     .si                (short_scan0_2),         // Templated
                     .reset_l           (arst_l),                // Templated
                     .sehold            (sehold),                // Templated
                     .rst_tri_en        (mem_write_disable),     // Templated
                     .rd_adr1           (ifq_icv_wrindex_bf[`IC_IDX_HI:5]), // Templated
                     .rd_adr2           (fdp_icv_index_bf[`IC_IDX_HI:5]), // Templated
                     .rd_adr1_sel       (fcl_ifq_grant_bf),      // Templated
                     .rd_en             (fcl_icv_rdreq_bf),      // Templated
                     .wr_adr            (ifq_icv_wrindex_bf[`IC_IDX_HI:7]), // Templated
                     .wr_en             (fcl_icv_wrreq_bf),      // Templated
                     .bit_wen           (ifq_icv_wren_bf[15:0]), // Templated
                     .din               (ifq_icv_wrdata_bf),

                     // debug interface
                     .sramid            (`BIST_ID_L1_ICV),
                     .rtap_srams_bist_command   (rtap_srams_bist_command),
                     .rtap_srams_bist_data      (rtap_srams_bist_data),
                     .srams_rtap_data           (icv_rtap_data)
                     );     // Templated
   sparc_ifu_ifqdp ifqdp(
                         .so            (short_so1),
                         .si            (short_scan1_1),
                        .ifq_ict_wrtag_f(ifq_ict_wrtag_f[`IC_TAG_SZ:0]),
                        .ifq_ict_wrtag_bf(ifq_ict_wrtag_bf[`IC_TAG_SZ:0]),
                         .fdp_ifq_paddr_f(fdp_erb_pc_f[9:2]),
                         /*AUTOINST*/
                         // Outputs
                         `ifndef NO_RTL_CSM
                         .ifu_lsu_pcxcsm_e(ifu_lsu_pcxcsm_e),
                         `endif

                         .ifu_lsu_pcxpkt_e(ifu_lsu_pcxpkt_e[51:0]),
                         .ifq_fdp_fill_inst(ifq_fdp_fill_inst[32:0]),
                         .ifq_erb_asidata_i2(ifq_erb_asidata_i2[47:0]),
                         .ifd_inv_ifqop_i2(ifd_inv_ifqop_i2[`CPX_WIDTH-1:0]),
                         .ifq_icd_index_bf(ifq_icd_index_bf[`IC_IDX_HI:2]),
                         .ifq_icd_wrdata_i2(ifq_icd_wrdata_i2[135:0]),
                         .ifq_erb_wrindex_f(ifq_erb_wrindex_f[`IC_IDX_HI:4]),
                         .ifq_icd_wrway_bf(ifq_icd_wrway_bf[`IC_WAY_MASK]),
                         .ifd_ifc_milhit_s(ifd_ifc_milhit_s[3:0]),
                         .ifd_ifc_instoffset0(ifd_ifc_instoffset0[1:0]),
                         .ifd_ifc_instoffset1(ifd_ifc_instoffset1[1:0]),
                         .ifd_ifc_instoffset2(ifd_ifc_instoffset2[1:0]),
                         .ifd_ifc_instoffset3(ifd_ifc_instoffset3[1:0]),
                         .ifd_ifc_cpxthr_nxt(ifd_ifc_cpxthr_nxt[1:0]),
                         .ifd_ifc_cpxreq_nxt(ifd_ifc_cpxreq_nxt[3:0]),
                         .ifd_ifc_cpxreq_i1(ifd_ifc_cpxreq_i1[`CPX_RQ_SIZE:0]),
                         .ifd_ifc_destid0(ifd_ifc_destid0[2:0]),
                         .ifd_ifc_destid1(ifd_ifc_destid1[2:0]),
                         .ifd_ifc_destid2(ifd_ifc_destid2[2:0]),
                         .ifd_ifc_destid3(ifd_ifc_destid3[2:0]),
                         .ifd_ifc_newdestid_s(ifd_ifc_newdestid_s[2:0]),
                         .ifd_ifc_pcxline_d(ifd_ifc_pcxline_d[4:2]),
                         .ifd_ifc_asi_vachklo_i2(ifd_ifc_asi_vachklo_i2),
                         .ifd_ifc_cpxvld_i2(ifd_ifc_cpxvld_i2),
                         .ifd_ifc_asiaddr_i2(ifd_ifc_asiaddr_i2[3:2]),
                         .ifd_ifc_iobpkt_i2(ifd_ifc_iobpkt_i2),
                         .ifd_ifc_fwd2ic_i2(ifd_ifc_fwd2ic_i2),
                         .ifd_ifc_4bpkt_i2(ifd_ifc_4bpkt_i2),
                         .ifd_ifc_cpxnc_i2(ifd_ifc_cpxnc_i2),
                         .ifd_ifc_cpxce_i2(ifd_ifc_cpxce_i2),
                         .ifd_ifc_cpxue_i2(ifd_ifc_cpxue_i2),
                         .ifd_ifc_cpxms_i2(ifd_ifc_cpxms_i2),
                         .ifd_ifc_miladdr4_i2(ifd_ifc_miladdr4_i2[3:0]),
                         .ifd_inv_wrway_i2(ifd_inv_wrway_i2[`IC_WAY_MASK]),
                         .ifq_fdp_fill_paddr(ifq_fdp_fill_paddr[39:2]),
                         // Inputs
                         `ifndef NO_RTL_CSM
                         .itlb_ifq_csm_s (itlb_ifq_csm_s),
                         `endif
                         .rclk          (rclk),
                         .se            (se),
                         .lsu_ifu_cpxpkt_i1(lsu_ifu_cpxpkt_i1[`CPX_WIDTH-1:0]),
                         .lsu_ifu_asi_addr(lsu_ifu_asi_addr[17:0]),
                         .lsu_ifu_stxa_data(lsu_ifu_stxa_data[47:0]),
                         .itlb_ifq_paddr_s(itlb_ifq_paddr_s[39:10]),
                         .ifc_ifd_reqvalid_e(ifc_ifd_reqvalid_e),
                         .ifc_ifd_filladdr4_i2(ifc_ifd_filladdr4_i2),
                         .ifc_ifd_repway_s(ifc_ifd_repway_s[`IC_WAY_MASK]),
                         .ifc_ifd_uncached_e(ifc_ifd_uncached_e),
                         .ifc_ifd_thrid_e(ifc_ifd_thrid_e[1:0]),
                         .ifc_ifd_pcxline_adj_d(ifc_ifd_pcxline_adj_d[4:2]),
                         .ifc_ifd_errinv_e(ifc_ifd_errinv_e),
                         .ifc_ifd_ldmil_sel_new(ifc_ifd_ldmil_sel_new[3:0]),
                         .ifc_ifd_ld_inq_i1(ifc_ifd_ld_inq_i1),
                         .ifc_ifd_idx_sel_fwd_i2(ifc_ifd_idx_sel_fwd_i2),
                         .ifc_ifd_milreq_sel_d_l(ifc_ifd_milreq_sel_d_l[3:0]),
                         .ifc_ifd_milfill_sel_i2_l(ifc_ifd_milfill_sel_i2_l[3:0]),
                         .ifc_ifd_finst_sel_l(ifc_ifd_finst_sel_l[3:0]),
                         .ifc_ifd_ifqbyp_sel_fwd_l(ifc_ifd_ifqbyp_sel_fwd_l),
                         .ifc_ifd_ifqbyp_sel_inq_l(ifc_ifd_ifqbyp_sel_inq_l),
                         .ifc_ifd_ifqbyp_sel_asi_l(ifc_ifd_ifqbyp_sel_asi_l),
                         .ifc_ifd_ifqbyp_sel_lsu_l(ifc_ifd_ifqbyp_sel_lsu_l),
                         .ifc_ifd_ifqbyp_en_l(ifc_ifd_ifqbyp_en_l),
                         .ifc_ifd_addr_sel_bist_i2_l(ifc_ifd_addr_sel_bist_i2_l),
                         .ifc_ifd_addr_sel_asi_i2_l(ifc_ifd_addr_sel_asi_i2_l),
                         .ifc_ifd_addr_sel_old_i2_l(ifc_ifd_addr_sel_old_i2_l),
                         .ifc_ifd_addr_sel_fill_i2_l(ifc_ifd_addr_sel_fill_i2_l),
                         .mbist_icache_way(2'b0),
                         .mbist_icache_word(1'b0),
                         .mbist_icache_index(8'b0)
                         );

   sparc_ifu_ifqctl ifqctl(
                           .so          (scan0_9),
                           .si          (scan0_8),
                           .ifd_ifc_cpxvalid_i1(lsu_ifu_cpxpkt_i1[`CPX_VLD]),
			   .lsu_ifu_cpxpkt_wayvld_i1 (lsu_ifu_cpxpkt_i1[`CPX_WYVLD]),
                           .ifq_sscan_data(ifq_sscan_data[3:0]),
                           .rst_tri_en  (mux_drive_disable),

                           /*AUTOINST*/
                           // Outputs
                           .ifu_lsu_inv_clear(ifu_lsu_inv_clear),
                           .ifu_lsu_ibuf_busy(ifu_lsu_ibuf_busy),
                           .ifu_lsu_asi_ack(ifu_lsu_asi_ack),
                           .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
                           .ifu_lsu_fwd_wr_ack(ifu_lsu_fwd_wr_ack),
                           .ifu_lsu_pcxreq_d(ifu_lsu_pcxreq_d),
                           .ifu_lsu_destid_s(ifu_lsu_destid_s[2:0]),
                           .ifu_tlu_l2imiss(ifu_tlu_l2imiss[3:0]),
                           .ifq_fcl_stallreq(ifq_fcl_stallreq),
                           .ifq_swl_stallreq(ifq_swl_stallreq),
                           .ifq_fcl_flush_sonly_e(ifq_fcl_flush_sonly_e),
                           .ifq_fcl_wrreq_bf(ifq_fcl_wrreq_bf),
                           .ifq_fcl_rdreq_bf(ifq_fcl_rdreq_bf),
                           .ifq_fcl_icd_wrreq_bf(ifq_fcl_icd_wrreq_bf),
                           .ifq_fcl_ictv_wrreq_bf(ifq_fcl_ictv_wrreq_bf),
                           .ifq_erb_fwdrd_bf(ifq_erb_fwdrd_bf),
                           .ifq_erb_rdtag_f(ifq_erb_rdtag_f),
                           .ifq_erb_rdinst_f(ifq_erb_rdinst_f),
                           .ifq_erb_asi_erren_i2(ifq_erb_asi_erren_i2),
                           .ifq_erb_asi_errstat_i2(ifq_erb_asi_errstat_i2),
                           .ifq_erb_asi_errinj_i2(ifq_erb_asi_errinj_i2),
                           .ifq_erb_asi_erraddr_i2(ifq_erb_asi_erraddr_i2),
                           .ifq_erb_asi_imask_i2(ifq_erb_asi_imask_i2),
                           .ifq_erb_asiwr_i2(ifq_erb_asiwr_i2),
                           .ifq_fcl_asird_bf(ifq_fcl_asird_bf),
                           .ifq_fcl_asi_tid_bf(ifq_fcl_asi_tid_bf[1:0]),
                           .ifq_erb_ue_rep(ifq_erb_ue_rep),
                           .ifq_erb_ce_rep(ifq_erb_ce_rep),
                           .ifq_erb_l2_ue(ifq_erb_l2_ue),
                           .ifq_erb_io_ue(ifq_erb_io_ue),
                           .ifq_erb_ifet_ce(ifq_erb_ifet_ce),
                           .ifq_erb_l2err_tid(ifq_erb_l2err_tid[1:0]),
                           .ifq_icv_wrdata_bf(ifq_icv_wrdata_bf),
                           .ifq_icd_worden_bf(ifq_icd_worden_bf[3:0]),
                           .ifq_fcl_fill_thr(ifq_fcl_fill_thr[3:0]),
                           .ifq_dtu_thrrdy(ifq_dtu_thrrdy[3:0]),
                           .ifq_dtu_pred_rdy(ifq_dtu_pred_rdy[3:0]),
                           .ifc_ifd_filladdr4_i2(ifc_ifd_filladdr4_i2),
                           .ifc_ifd_reqvalid_e(ifc_ifd_reqvalid_e),
                           .ifc_ifd_idx_sel_fwd_i2(ifc_ifd_idx_sel_fwd_i2),
                           .ifc_ifd_errinv_e(ifc_ifd_errinv_e),
                           .ifc_ifd_uncached_e(ifc_ifd_uncached_e),
                           .ifc_ifd_thrid_e(ifc_ifd_thrid_e[1:0]),
                           .ifc_ifd_pcxline_adj_d(ifc_ifd_pcxline_adj_d[4:2]),
                           .ifc_inv_asireq_i2(ifc_inv_asireq_i2),
                           .ifc_ifd_repway_s(ifc_ifd_repway_s[`IC_WAY_MASK]),
                           .ifc_ifd_milfill_sel_i2_l(ifc_ifd_milfill_sel_i2_l[3:0]),
                           .ifc_ifd_finst_sel_l(ifc_ifd_finst_sel_l[3:0]),
                           .ifc_ifd_milreq_sel_d_l(ifc_ifd_milreq_sel_d_l[3:0]),
                           .ifc_ifd_ifqbyp_sel_fwd_l(ifc_ifd_ifqbyp_sel_fwd_l),
                           .ifc_ifd_ifqbyp_sel_inq_l(ifc_ifd_ifqbyp_sel_inq_l),
                           .ifc_ifd_ifqbyp_sel_asi_l(ifc_ifd_ifqbyp_sel_asi_l),
                           .ifc_ifd_ifqbyp_sel_lsu_l(ifc_ifd_ifqbyp_sel_lsu_l),
                           .ifc_ifd_ifqbyp_en_l(ifc_ifd_ifqbyp_en_l),
                           .ifc_ifd_addr_sel_bist_i2_l(ifc_ifd_addr_sel_bist_i2_l),
                           .ifc_ifd_addr_sel_asi_i2_l(ifc_ifd_addr_sel_asi_i2_l),
                           .ifc_ifd_addr_sel_old_i2_l(ifc_ifd_addr_sel_old_i2_l),
                           .ifc_ifd_addr_sel_fill_i2_l(ifc_ifd_addr_sel_fill_i2_l),
                           .ifq_icd_data_sel_bist_i2(ifq_icd_data_sel_bist_i2),
                           .ifq_icd_data_sel_fill_i2(ifq_icd_data_sel_fill_i2),
                           .ifq_icd_data_sel_old_i2(ifq_icd_data_sel_old_i2),
                           .ifc_ifd_ldmil_sel_new(ifc_ifd_ldmil_sel_new[3:0]),
                           .ifc_ifd_ld_inq_i1(ifc_ifd_ld_inq_i1),
                           .ifc_inv_ifqadv_i2(ifc_inv_ifqadv_i2),
                           // Inputs
                           .ifd_ifc_milhit_s(ifd_ifc_milhit_s[3:0]),
                           .ifd_ifc_instoffset0(ifd_ifc_instoffset0[1:0]),
                           .ifd_ifc_instoffset1(ifd_ifc_instoffset1[1:0]),
                           .ifd_ifc_instoffset2(ifd_ifc_instoffset2[1:0]),
                           .ifd_ifc_instoffset3(ifd_ifc_instoffset3[1:0]),
                           .ifd_ifc_cpxreq_i1(ifd_ifc_cpxreq_i1[`CPX_RQ_SIZE:0]),
                           .ifd_ifc_cpxreq_nxt(ifd_ifc_cpxreq_nxt[3:0]),
                           .ifd_ifc_cpxthr_nxt(ifd_ifc_cpxthr_nxt[1:0]),
                           .ifd_ifc_cpxvld_i2(ifd_ifc_cpxvld_i2),
                           .ifd_ifc_iobpkt_i2(ifd_ifc_iobpkt_i2),
                           .ifd_ifc_4bpkt_i2(ifd_ifc_4bpkt_i2),
                           .ifd_ifc_cpxnc_i2(ifd_ifc_cpxnc_i2),
                           .ifd_ifc_fwd2ic_i2(ifd_ifc_fwd2ic_i2),
                           .ifd_ifc_cpxce_i2(ifd_ifc_cpxce_i2),
                           .ifd_ifc_cpxue_i2(ifd_ifc_cpxue_i2),
                           .ifd_ifc_cpxms_i2(ifd_ifc_cpxms_i2),
                           .ifd_ifc_miladdr4_i2(ifd_ifc_miladdr4_i2[3:0]),
                           .ifd_ifc_asiaddr_i2(ifd_ifc_asiaddr_i2[3:2]),
                           .ifd_ifc_asi_vachklo_i2(ifd_ifc_asi_vachklo_i2),
                           .ifd_ifc_destid0(ifd_ifc_destid0[2:0]),
                           .ifd_ifc_destid1(ifd_ifc_destid1[2:0]),
                           .ifd_ifc_destid2(ifd_ifc_destid2[2:0]),
                           .ifd_ifc_destid3(ifd_ifc_destid3[2:0]),
                           .ifd_ifc_newdestid_s(ifd_ifc_newdestid_s[2:0]),
                           .ifd_ifc_pcxline_d(ifd_ifc_pcxline_d[4:2]),
                           .inv_ifc_inv_pending(inv_ifc_inv_pending),
                           .fcl_ifq_icmiss_s1(fcl_ifq_icmiss_s1),
                           .fcl_ifq_rdreq_s1(fcl_ifq_rdreq_s1),
                           .fcl_ifq_thr_s1(fcl_ifq_thr_s1[1:0]),
                           .fcl_ifq_canthr(fcl_ifq_canthr[3:0]),
                           .fcl_ifq_grant_bf(fcl_ifq_grant_bf),
                           .dtu_ifq_kill_latest_d(dtu_ifq_kill_latest_d),
                           .erb_ifq_ifeterr_d1(erb_ifq_ifeterr_d1),
                           .erb_ifq_itlberr_s1(erb_ifq_itlberr_s1),
                           .lsu_ifu_pcxpkt_ack_d(lsu_ifu_pcxpkt_ack_d),
                           .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                           .lsu_ifu_asi_vld(lsu_ifu_asi_vld),
                           .lsu_ifu_asi_state(lsu_ifu_asi_state[7:0]),
                           .lsu_ifu_asi_load(lsu_ifu_asi_load),
                           .lsu_ifu_asi_thrid(lsu_ifu_asi_thrid[1:0]),
                           .fcl_ifq_icache_en_s_l(fcl_ifq_icache_en_s_l),
                           .mbist_ifq_run_bist(1'b0),
                           .mbist_icache_write(1'b0),
                           .mbist_icache_read(1'b0),
                           .ctu_sscan_tid(ctu_sscan_tid[3:0]),
                           .rclk        (rclk),
                           .se          (se),
                           .gdbginit_l  (gdbginit_l),
                           .arst_l      (arst_l),
                           .grst_l      (grst_l),
                           .sehold      (sehold));

   sparc_ifu_invctl invctl(
                           .so          (scan0_10),
                           .si          (scan0_9),
                           /*AUTOINST*/
                           // Outputs
                           .inv_ifc_inv_pending(inv_ifc_inv_pending),
                           .ifq_icv_wrindex_bf(ifq_icv_wrindex_bf[`IC_IDX_HI:5]),
                           .ifq_icv_wren_bf(ifq_icv_wren_bf[15:0]),
                           .ifq_ict_dec_wrway_bf(ifq_ict_dec_wrway_bf[`IC_WAY_ARRAY_MASK]),
                           .ifq_fcl_invreq_bf(ifq_fcl_invreq_bf),
                           .ifq_erb_asiway_f(ifq_erb_asiway_f[`IC_WAY_MASK]),
                           // Inputs
                           .rclk        (rclk),
                           .se          (se),
                           .const_cpuid (const_cpuid[2:0]),
                           .mbist_icache_write(1'b0),
                           // .mbist_icache_write(mbist_icache_write),
                           .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                           .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                           .lsu_ifu_ld_pcxpkt_tid(lsu_ifu_ld_pcxpkt_tid[1:0]),
                           .ifc_inv_ifqadv_i2(ifc_inv_ifqadv_i2),
                           .ifc_inv_asireq_i2(ifc_inv_asireq_i2),
                           .ifq_icd_index_bf(ifq_icd_index_bf[`IC_IDX_HI:5]),
                           .ifd_inv_ifqop_i2(ifd_inv_ifqop_i2[`CPX_WIDTH-1:0]),
                           .ifd_inv_wrway_i2(ifd_inv_wrway_i2[`IC_WAY_MASK]));


   sparc_ifu_errdp  errdp(
                          .so           (scan0_11),
                          .si           (scan0_10),
                         .ifq_erb_wrtag_f(ifq_ict_wrtag_f[`IC_TAG_SZ-1:0]),
                          .ict_itlb_tags_f(ict_itlb_tags_f),
                          .wsel_erb_asidata_s({wsel_mbist_icache_data[65:64],
                                               wsel_mbist_icache_data[31:0]}),
                          // .wsel_erb_asidata_s(34'b0),

			                    /*AUTOINST*/
                          // Outputs
                          .ifu_lsu_ldxa_data_w2(ifu_lsu_ldxa_data_w2[63:0]),
                          .erb_dtu_imask(erb_dtu_imask[38:0]),
                          .erd_erc_tlbt_pe_s1(erd_erc_tlbt_pe_s1[1:0]),
                          .erd_erc_tlbd_pe_s1(erd_erc_tlbd_pe_s1[1:0]),
                          .erd_erc_tagpe_s1(erd_erc_tagpe_s1[3:0]),
                          .erd_erc_nirpe_s1(erd_erc_nirpe_s1),
                          .erd_erc_fetpe_s1(erd_erc_fetpe_s1),
                          .erd_erc_tte_pgsz(erd_erc_tte_pgsz[2:0]),
                          // Inputs
                          .rclk         (rclk),
                          .se           (se),
                          .erb_reset    (erb_reset),
                          .itlb_rd_tte_data(itlb_rd_tte_data[42:0]),
                          .itlb_rd_tte_tag(itlb_rd_tte_tag[58:0]),
                          .itlb_ifq_paddr_s(itlb_ifq_paddr_s[39:10]),
                          .wsel_fdp_fetdata_s1(wsel_fdp_fetdata_s1[33:0]),
                          .wsel_fdp_topdata_s1(wsel_fdp_topdata_s1[33:0]),
                          .icv_itlb_valid_f(icv_itlb_valid_f[3:0]),
                          .lsu_ifu_err_addr(lsu_ifu_err_addr[47:4]),
                          .spu_ifu_err_addr_w2(spu_ifu_err_addr_w2[39:4]),
                          .fdp_erb_pc_f (fdp_erb_pc_f[47:0]),
                          .exu_ifu_err_reg_m(exu_ifu_err_reg_m[7:0]),
                          .exu_ifu_err_synd_m(exu_ifu_err_synd_m[7:0]),
                          .ffu_ifu_err_reg_w2(ffu_ifu_err_reg_w2[5:0]),
                          .ffu_ifu_err_synd_w2(ffu_ifu_err_synd_w2[13:0]),
                          .tlu_itlb_rw_index_g(tlu_itlb_rw_index_g[5:0]),
                          .erc_erd_pgsz_b0(erc_erd_pgsz_b0),
                          .erc_erd_pgsz_b1(erc_erd_pgsz_b1),
                          .erc_erd_erren_asidata(erc_erd_erren_asidata[1:0]),
                          .erc_erd_errstat_asidata(erc_erd_errstat_asidata[22:0]),
                          .erc_erd_errinj_asidata(erc_erd_errinj_asidata[31:0]),
                          .ifq_erb_asidata_i2(ifq_erb_asidata_i2[47:0]),
                          .ifq_erb_wrindex_f(ifq_erb_wrindex_f[`IC_IDX_HI:4]),
                          .erc_erd_asiway_s1_l(erc_erd_asiway_s1_l[`IC_WAY_ARRAY_MASK]),
                          .fcl_erb_itlbrd_data_s(fcl_erb_itlbrd_data_s),
                          .erc_erd_ld_imask(erc_erd_ld_imask),
                          .erc_erd_asisrc_sel_icd_s_l(erc_erd_asisrc_sel_icd_s_l),
                          .erc_erd_asisrc_sel_misc_s_l(erc_erd_asisrc_sel_misc_s_l),
                          .erc_erd_asisrc_sel_err_s_l(erc_erd_asisrc_sel_err_s_l),
                          .erc_erd_asisrc_sel_itlb_s_l(erc_erd_asisrc_sel_itlb_s_l),
                          .erc_erd_errasi_sel_en_l(erc_erd_errasi_sel_en_l),
                          .erc_erd_errasi_sel_stat_l(erc_erd_errasi_sel_stat_l),
                          .erc_erd_errasi_sel_inj_l(erc_erd_errasi_sel_inj_l),
                          .erc_erd_errasi_sel_addr_l(erc_erd_errasi_sel_addr_l),
                          .erc_erd_miscasi_sel_ict_l(erc_erd_miscasi_sel_ict_l),
                          .erc_erd_miscasi_sel_imask_l(erc_erd_miscasi_sel_imask_l),
                          .erc_erd_miscasi_sel_other_l(erc_erd_miscasi_sel_other_l),
                          .erc_erd_asi_thr_l(erc_erd_asi_thr_l[3:0]),
                          .erc_erd_eadr0_sel_irf_l(erc_erd_eadr0_sel_irf_l[3:0]),
                          .erc_erd_eadr0_sel_itlb_l(erc_erd_eadr0_sel_itlb_l[3:0]),
                          .erc_erd_eadr0_sel_frf_l(erc_erd_eadr0_sel_frf_l[3:0]),
                          .erc_erd_eadr0_sel_lsu_l(erc_erd_eadr0_sel_lsu_l[3:0]),
                          .erc_erd_eadr1_sel_pcd1_l(erc_erd_eadr1_sel_pcd1_l[3:0]),
                          .erc_erd_eadr1_sel_l1pa_l(erc_erd_eadr1_sel_l1pa_l[3:0]),
                          .erc_erd_eadr1_sel_l2pa_l(erc_erd_eadr1_sel_l2pa_l[3:0]),
                          .erc_erd_eadr1_sel_other_l(erc_erd_eadr1_sel_other_l[3:0]),
                          .erc_erd_eadr2_sel_mx1_l(erc_erd_eadr2_sel_mx1_l[3:0]),
                          .erc_erd_eadr2_sel_wrt_l(erc_erd_eadr2_sel_wrt_l[3:0]),
                          .erc_erd_eadr2_sel_mx0_l(erc_erd_eadr2_sel_mx0_l[3:0]),
                          .erc_erd_eadr2_sel_old_l(erc_erd_eadr2_sel_old_l[3:0]));

   sparc_ifu_errctl errctl(
                           .so          (scan0_12),
                           .si          (scan0_11),
                          .ifu_tlu_inst_vld_w(ifu_spu_inst_vld_w),

                           /*AUTOINST*/
                           // Outputs
                           .erc_erd_pgsz_b0(erc_erd_pgsz_b0),
                           .erc_erd_pgsz_b1(erc_erd_pgsz_b1),
                           .ifu_lsu_asi_rd_unc(ifu_lsu_asi_rd_unc),
                           .ifu_lsu_ldxa_tid_w2(ifu_lsu_ldxa_tid_w2[1:0]),
                           .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
                           .ifu_lsu_fwd_data_vld(ifu_lsu_fwd_data_vld),
                           .ifu_lsu_error_inj(ifu_lsu_error_inj[3:0]),
                           .ifu_exu_ecc_mask(ifu_exu_ecc_mask[7:0]),
                           .ifu_exu_inj_irferr(ifu_exu_inj_irferr),
                           .ifu_ffu_inj_frferr(ifu_ffu_inj_frferr),
                           .ifu_exu_nceen_e(ifu_exu_nceen_e),
                           .ifu_lsu_nceen(ifu_lsu_nceen[3:0]),
                           .ifu_spu_nceen(ifu_spu_nceen[3:0]),
                           .erb_fcl_spu_uetrap(erb_fcl_spu_uetrap[3:0]),
                           .erb_ifq_itlberr_s1(erb_ifq_itlberr_s1),
                           .erb_ifq_ifeterr_d1(erb_ifq_ifeterr_d1),
                           .erb_dtu_ifeterr_d1(erb_dtu_ifeterr_d1),
                           .erb_fcl_itlb_ce_d1(erb_fcl_itlb_ce_d1),
                           .erb_fcl_ce_trapvec(erb_fcl_ce_trapvec[3:0]),
                           .erb_fcl_ue_trapvec(erb_fcl_ue_trapvec[3:0]),
                           .erb_fcl_ifet_uevec_d1(erb_fcl_ifet_uevec_d1[3:0]),
                           .erc_erd_errstat_asidata(erc_erd_errstat_asidata[22:0]),
                           .erc_erd_errinj_asidata(erc_erd_errinj_asidata[31:0]),
                           .erc_erd_erren_asidata(erc_erd_erren_asidata[1:0]),
                           .erc_erd_eadr0_sel_irf_l(erc_erd_eadr0_sel_irf_l[3:0]),
                           .erc_erd_eadr0_sel_itlb_l(erc_erd_eadr0_sel_itlb_l[3:0]),
                           .erc_erd_eadr0_sel_frf_l(erc_erd_eadr0_sel_frf_l[3:0]),
                           .erc_erd_eadr0_sel_lsu_l(erc_erd_eadr0_sel_lsu_l[3:0]),
                           .erc_erd_asiway_s1_l(erc_erd_asiway_s1_l[`IC_WAY_ARRAY_MASK]),
                           .erc_erd_eadr1_sel_pcd1_l(erc_erd_eadr1_sel_pcd1_l[3:0]),
                           .erc_erd_eadr1_sel_l1pa_l(erc_erd_eadr1_sel_l1pa_l[3:0]),
                           .erc_erd_eadr1_sel_l2pa_l(erc_erd_eadr1_sel_l2pa_l[3:0]),
                           .erc_erd_eadr1_sel_other_l(erc_erd_eadr1_sel_other_l[3:0]),
                           .erc_erd_eadr2_sel_mx1_l(erc_erd_eadr2_sel_mx1_l[3:0]),
                           .erc_erd_eadr2_sel_wrt_l(erc_erd_eadr2_sel_wrt_l[3:0]),
                           .erc_erd_eadr2_sel_mx0_l(erc_erd_eadr2_sel_mx0_l[3:0]),
                           .erc_erd_eadr2_sel_old_l(erc_erd_eadr2_sel_old_l[3:0]),
                           .erc_erd_asi_thr_l(erc_erd_asi_thr_l[3:0]),
                           .erc_erd_asisrc_sel_icd_s_l(erc_erd_asisrc_sel_icd_s_l),
                           .erc_erd_asisrc_sel_misc_s_l(erc_erd_asisrc_sel_misc_s_l),
                           .erc_erd_asisrc_sel_err_s_l(erc_erd_asisrc_sel_err_s_l),
                           .erc_erd_asisrc_sel_itlb_s_l(erc_erd_asisrc_sel_itlb_s_l),
                           .erc_erd_errasi_sel_en_l(erc_erd_errasi_sel_en_l),
                           .erc_erd_errasi_sel_stat_l(erc_erd_errasi_sel_stat_l),
                           .erc_erd_errasi_sel_inj_l(erc_erd_errasi_sel_inj_l),
                           .erc_erd_errasi_sel_addr_l(erc_erd_errasi_sel_addr_l),
                           .erc_erd_miscasi_sel_ict_l(erc_erd_miscasi_sel_ict_l),
                           .erc_erd_miscasi_sel_imask_l(erc_erd_miscasi_sel_imask_l),
                           .erc_erd_miscasi_sel_other_l(erc_erd_miscasi_sel_other_l),
                           .erc_erd_ld_imask(erc_erd_ld_imask),
                           .erb_reset   (erb_reset),
                           // Inputs
                           .rclk        (rclk),
                           .se          (se),
                           .arst_l      (arst_l),
                           .grst_l      (grst_l),
                           .erd_erc_tte_pgsz(erd_erc_tte_pgsz[2:0]),
                           .icv_itlb_valid_f(icv_itlb_valid_f[3:0]),
                           .fcl_erb_ievld_s1(fcl_erb_ievld_s1),
                           .fcl_erb_tevld_s1(fcl_erb_tevld_s1),
                           .fcl_erb_immuevld_s1(fcl_erb_immuevld_s1),
                           .fcl_erb_inst_issue_d(fcl_erb_inst_issue_d),
                           .fcl_erb_inst_vld_d1(fcl_erb_inst_vld_d1),
                           .ifu_lsu_thrid_s(ifu_lsu_thrid_s[1:0]),
                           .fcl_erb_asi_tid_f(fcl_erb_asi_tid_f[1:0]),
                           .ifq_fcl_asi_tid_bf(ifq_fcl_asi_tid_bf[1:0]),
                           .fcl_erb_clear_iferr(fcl_erb_clear_iferr[3:0]),
                           .fcl_erb_itlbrd_vld_s(fcl_erb_itlbrd_vld_s),
                           .fcl_erb_itlbrd_data_s(fcl_erb_itlbrd_data_s),
                           .erd_erc_tagpe_s1(erd_erc_tagpe_s1[3:0]),
                           .erd_erc_nirpe_s1(erd_erc_nirpe_s1),
                           .erd_erc_fetpe_s1(erd_erc_fetpe_s1),
                           .erd_erc_tlbt_pe_s1(erd_erc_tlbt_pe_s1[1:0]),
                           .erd_erc_tlbd_pe_s1(erd_erc_tlbd_pe_s1[1:0]),
                           .tlu_lsu_pstate_priv(tlu_lsu_pstate_priv[3:0]),
			   .tlu_hpstate_priv  (tlu_hpstate_priv[3:0]),
                           .lsu_ifu_dtlb_data_su(lsu_ifu_dtlb_data_su),
                           .lsu_ifu_dtlb_data_ue(lsu_ifu_dtlb_data_ue),
                           .lsu_ifu_dtlb_tag_ue(lsu_ifu_dtlb_tag_ue),
                           .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
                           .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
                           .lsu_ifu_l2_unc_error(lsu_ifu_l2_unc_error),
                           .lsu_ifu_l2_corr_error(lsu_ifu_l2_corr_error),
                           .lsu_ifu_io_error(lsu_ifu_io_error),
                           .lsu_ifu_error_tid(lsu_ifu_error_tid[1:0]),
                           .spu_ifu_unc_err_w1(spu_ifu_unc_err_w1),
                           .spu_ifu_mamem_err_w1(spu_ifu_mamem_err_w1),
                           .spu_ifu_corr_err_w2(spu_ifu_corr_err_w2),
                           .spu_ifu_int_w2(spu_ifu_int_w2),
                           .spu_ifu_ttype_tid_w2(spu_ifu_ttype_tid_w2[1:0]),
                           .lsu_ifu_inj_ack(lsu_ifu_inj_ack[3:0]),
                           .ffu_ifu_ecc_ce_w2(ffu_ifu_ecc_ce_w2),
                           .ffu_ifu_ecc_ue_w2(ffu_ifu_ecc_ue_w2),
                           .ffu_ifu_inj_ack(ffu_ifu_inj_ack),
                           .ffu_ifu_tid_w2(ffu_ifu_tid_w2[1:0]),
                           .exu_ifu_ecc_ce_m(exu_ifu_ecc_ce_m),
                           .exu_ifu_ecc_ue_m(exu_ifu_ecc_ue_m),
                           .exu_ifu_inj_ack(exu_ifu_inj_ack),
                           .ifq_erb_ue_rep(ifq_erb_ue_rep),
                           .ifq_erb_ce_rep(ifq_erb_ce_rep),
                           .ifq_erb_l2_ue(ifq_erb_l2_ue),
                           .ifq_erb_io_ue(ifq_erb_io_ue),
                           .ifq_erb_ifet_ce(ifq_erb_ifet_ce),
                           .ifq_erb_l2err_tid(ifq_erb_l2err_tid[1:0]),
                           .ifq_erb_rdtag_f(ifq_erb_rdtag_f),
                           .ifq_erb_rdinst_f(ifq_erb_rdinst_f),
                           .ifq_erb_asi_erren_i2(ifq_erb_asi_erren_i2),
                           .ifq_erb_asi_errstat_i2(ifq_erb_asi_errstat_i2),
                           .ifq_erb_asi_errinj_i2(ifq_erb_asi_errinj_i2),
                           .ifq_erb_asi_erraddr_i2(ifq_erb_asi_erraddr_i2),
                           .ifq_erb_asi_imask_i2(ifq_erb_asi_imask_i2),
                           .ifq_erb_asiwr_i2(ifq_erb_asiwr_i2),
                           .ifq_fcl_asird_bf(ifq_fcl_asird_bf),
                           .ifq_erb_fwdrd_bf(ifq_erb_fwdrd_bf),
                           .ifq_erb_asidata_i2(ifq_erb_asidata_i2[31:0]),
                           .ifq_erb_asiway_f(ifq_erb_asiway_f[`IC_WAY_MASK]));

   // BIST Controller
//   sparc_ifu_icd_arr_bist bist(// Outputs
//			       .Test_fdp_icd_index_bf_0 (bist_ic_index[8:0]),
//			       .Test_ifq_icd_wrway_bf_0 (bist_ic_way),
//			       .Test_ifq_icd_wrdata_f_0 ({null_data[135:2],
//							  bist_ic_data[1:0]}),
//			       .Test_fcl_icd_rdreq_bf_0 (bist_ic_read),
//			       .Test_fcl_icd_wrreq_bf_0 (bist_ic_write),
//			       .Test_ifq_icd_worden_bf_0 (bist_ic_worden),
//			       .tselect (),
//			       .tst_done (),
//			       .fail_h (),
//			       .scan_out (),
//			       // Inputs
//			       .clk (clk),
//			       .diag_clk(1'b0),
//			       .rst_l (rst_l),
//			       .test_h (1'b0),
//			       .debugz (1'b0),
//			       .hold_l (1'b1),
//			       .Test_icd_fdp_topdata_s1_0 (icd_fdp_topdata_s1),
//			       .Test_icd_fdp_fetdata_s1_0 (icd_fdp_fetdata_s1));

   // sparc_ifu_mbist mbist(
   //                       .mbist_icache_data_in(wsel_mbist_icache_data[67:0]),
   //                       .mbist_si      (scan0_12),
   //                       .mbist_se      (se),

   //                       .mbist_icache_wdata(mbist_icache_wdata[7:0]),
   //                       .mbist_dcache_wdata(mbist_write_data[7:0]),

   //                       .mbist_so      (scan0_13),
   //                       .rclk           (rclk),

   //                       /*AUTOINST*/
   //                       // Outputs
   //                       .mbist_dcache_read(mbist_dcache_read),
   //                       .mbist_dcache_write(mbist_dcache_write),
   //                       .mbist_dcache_word(mbist_dcache_word),
   //                       .mbist_dcache_index(mbist_dcache_index[6:0]),
   //                       .mbist_dcache_way(mbist_dcache_way[1:0]),
   //                       .mbist_icache_read(mbist_icache_read),
   //                       .mbist_icache_write(mbist_icache_write),
   //                       .mbist_icache_index(mbist_icache_index[7:0]),
   //                       .mbist_icache_word(mbist_icache_word),
   //                       .mbist_icache_way(mbist_icache_way[1:0]),
   //                       .mbist_ifq_run_bist(mbist_ifq_run_bist),
   //                       .mbist_done    (mbist_done),
   //                       .mbist_dcache_fail(mbist_dcache_fail),
   //                       .mbist_icache_fail(mbist_icache_fail),
   //                       // Inputs
   //                       .grst_l        (grst_l),
   //                       .arst_l        (arst_l),
   //                       .mbist_start   (mbist_start),
   //                       .mbist_userdata_mode(mbist_userdata_mode),
   //                       .mbist_bisi_mode(mbist_bisi_mode),
   //                       .mbist_loop_mode(mbist_loop_mode),
   //                       .mbist_loop_on_address(mbist_loop_on_address),
   //                       .mbist_stop_on_fail(mbist_stop_on_fail),
   //                       .mbist_stop_on_next_fail(mbist_stop_on_next_fail),
   //                       .mbist_dcache_data_in(mbist_dcache_data_in[71:0]));


   // sparc_ifu_sscan sscan(
   //                       .so            (so0),
   //                       .si            (scan0_13),
   //                       .ifq_sscan_test_data(ifq_sscan_data[3:0]),
   //                       .lsu_sscan_test_data(lsu_sscan_data[15:0]),
   //                       .tlu_sscan_test_data(tlu_sscan_data[62:0]),
   //                       /*AUTOINST*/
   //                       // Outputs
   //                       .sparc_sscan(sparc_sscan),
   //                       // Inputs
   //                       .rtap_sscan_snap(rtap_sscan_snap),
   //                       .rtap_sscan_se  (rtap_sscan_se),
   //                       .ctu_tck       (ctu_tck),
   //                       .se            (se),
   //                       .swl_sscan_thrstate(swl_sscan_thrstate[10:0]),
   //                       .rclk          (rclk));

// trin: we need this module to read out shadow scan; scan chain is removed though.
// `ifdef NO_SCAN
// `else
sparc_ifu_sscan sscan(
   .ifq_sscan_test_data(ifq_sscan_data[3:0]),
   .lsu_sscan_test_data(lsu_sscan_data[15:0]),
   .tlu_sscan_test_data(tlu_sscan_data[62:0]),
   // Inputs
   .swl_sscan_thrstate(swl_sscan_thrstate[10:0]),
   .rclk          (rclk),

   .core_rtap_data          (core_rtap_data),
   .rtap_core_val         (rtap_core_val),
   .rtap_core_threadid         (rtap_core_threadid),
   .rtap_core_id         (rtap_core_id),
   .rtap_core_data         (rtap_core_data)
   );
// `endif   

   // floating outputs
   // sink #(`IC_TAG_UNUSED_SZ) s0(.in (ict_itlb_tags_f[`IC_PHYS_TAG_SZ-1:(`IC_TAG_SZ+1)]));
   // sink #(`IC_TAG_UNUSED_SZ) s1(.in (ict_itlb_tag1_f[`IC_PHYS_TAG_SZ-1:(`IC_TAG_SZ+1)]));
   // sink #(`IC_TAG_UNUSED_SZ) s2(.in (ict_itlb_tag2_f[`IC_PHYS_TAG_SZ-1:(`IC_TAG_SZ+1)]));
   // sink #(`IC_TAG_UNUSED_SZ) s3(.in (ict_itlb_tag3_f[`IC_PHYS_TAG_SZ-1:(`IC_TAG_SZ+1)]));
   // sink #(2) s4(.in (fuse_icd_rid[5:4]));

endmodule
// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl" "../../../common/rtl")
// End:
