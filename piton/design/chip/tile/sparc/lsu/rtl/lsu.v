// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: lsu.v
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
//  Description:  Load/Store Unit for Sparc Core
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include  "sys.h" // system level definition file which contains the
          // time scale definition

`include        "iop.h"
`include        "lsu.tmp.h"
`include "ifu.tmp.h"

`include        "define.tmp.h"
////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu ( /*AUTOARG*/
   // Outputs
  `ifndef NO_RTL_CSM
  spc_pcx_csm_pa,
  `endif
   spc_pcx_req_pq, spc_pcx_data_pa, spc_pcx_atom_pq,
   // spc_efc_dfuse_data, 
   lsu_tlu_wsr_inst_e,
   lsu_tlu_ttype_vld_m2, lsu_tlu_ttype_m2, lsu_tlu_tlb_st_inst_m,
   lsu_tlu_tlb_ldst_va_m, lsu_tlu_tlb_ld_inst_m,
   lsu_tlu_tlb_dmp_va_m, lsu_tlu_tlb_asi_state_m,
   lsu_tlu_tlb_access_tid_m, lsu_tlu_thrid_d, lsu_tlu_stb_full_w2,
   lsu_tlu_rsr_data_e, lsu_tlu_rs3_data_g, lsu_tlu_pcxpkt_ack,
   lsu_tlu_pctxt_m, lsu_tlu_misalign_addr_ldst_atm_m,
   lsu_tlu_ldst_va_m, lsu_tlu_l2_dmiss, lsu_tlu_intpkt,
   lsu_tlu_early_flush_w, lsu_tlu_early_flush2_w, lsu_tlu_dtlb_done,
   lsu_tlu_dside_ctxt_m, lsu_tlu_dmmu_miss_g,
   lsu_tlu_defr_trp_taken_g, lsu_tlu_dcache_miss_w2,
   lsu_tlu_daccess_excptn_g, lsu_tlu_cpx_vld, lsu_tlu_cpx_req,
   lsu_tlu_async_ttype_w2, lsu_tlu_async_ttype_vld_w2,
   lsu_tlu_async_tid_w2, lsu_t3_pctxt_state, lsu_t2_pctxt_state,
   lsu_t1_pctxt_state, lsu_t0_pctxt_state, lsu_spu_strm_ack_cmplt,
   lsu_spu_stb_empty, lsu_spu_ldst_ack, lsu_spu_early_flush_g,
   lsu_spu_asi_state_e, lsu_pid_state3, lsu_pid_state2,
   lsu_pid_state1, lsu_pid_state0, lsu_mmu_rs3_data_g,
   lsu_mmu_flush_pipe_w, lsu_mmu_defr_trp_taken_g, lsu_mamem_mrgn,
   lsu_itlb_mrgn, lsu_ifu_tlb_tag_ue, lsu_ifu_tlb_data_ue,
   lsu_ifu_tlb_data_su, lsu_ifu_stxa_data, lsu_ifu_stbcnt3,
   lsu_ifu_stbcnt2, lsu_ifu_stbcnt1, lsu_ifu_stbcnt0,
   lsu_ifu_stallreq, lsu_ifu_pcxpkt_ack_d, lsu_ifu_ldsta_internal_e,
   lsu_ifu_ldst_miss_w, lsu_ifu_ldst_cmplt, lsu_ifu_ld_pcxpkt_vld,
   lsu_ifu_ld_pcxpkt_tid, lsu_ifu_ld_icache_index,
   lsu_ifu_l2_unc_error, lsu_ifu_l2_corr_error, lsu_ifu_itlb_en,
   lsu_ifu_io_error, lsu_ifu_icache_en, lsu_ifu_flush_pipe_w,
   lsu_ifu_error_tid, lsu_ifu_direct_map_l1,
   lsu_ifu_dcache_tag_perror, lsu_ifu_dcache_data_perror,
   lsu_ifu_dc_parity_error_w2, lsu_ifu_cpxpkt_vld_i1,
   lsu_ifu_cpxpkt_i1, lsu_ifu_asi_vld, lsu_ifu_asi_thrid,
   lsu_ifu_asi_state, lsu_ifu_asi_load, lsu_ifu_asi_addr,
   lsu_ictag_mrgn, lsu_ffu_stb_full3, lsu_ffu_stb_full2,
   lsu_ffu_stb_full1, lsu_ffu_stb_full0, lsu_ffu_st_dtlb_perr_g,
   lsu_ffu_ld_vld, lsu_ffu_ld_data, lsu_ffu_flush_pipe_w,
   lsu_ffu_blk_asi_e, lsu_ffu_ack, lsu_exu_thr_m,
   lsu_exu_st_dtlb_perr_g, lsu_exu_rd_m, lsu_exu_ldst_miss_w2,
   lsu_exu_flush_pipe_w, lsu_exu_dfill_vld_w2, lsu_exu_dfill_data_w2,
   lsu_dsfsr_din_g, lsu_dmmu_sfsr_trp_wr, lsu_asi_reg3, lsu_asi_reg2,
   lsu_asi_reg1, lsu_asi_reg0, ifu_tlu_flush_fd_w,
   ifu_tlu_flush_fd3_w, ifu_tlu_flush_fd2_w, 
   // bist_ctl_reg_wr_en,
   // bist_ctl_reg_in, 
   lsu_asi_state, lsu_ifu_err_addr, lsu_sscan_data,
   ifu_tlu_inst_vld_m_bf1,
   lsu_ffu_bld_cnt_w, so0, so1, short_so0,
   short_so1, lsu_tlu_nucleus_ctxt_m, lsu_tlu_tte_pg_sz_g,
   lsu_tlu_squash_va_oor_m, lsu_tlu_wtchpt_trp_g,
   lsu_tlu_daccess_prot_g, lsu_tlu_priv_action_g,
   // Inputs
   `ifndef NO_RTL_CSM
   tlu_dtlb_csm_rd_g, tlu_dtlb_tte_csm_w2, ifu_lsu_pcxcsm_e,
   tlu_dtlb_wr_csm_sel_g,

   cfg_lsu_csm_dtlb_state, cfg_lsu_csm_dtlb_chipid,cfg_lsu_csm_dtlb_x,
   cfg_lsu_csm_dtlb_y, cfg_lsu_csm_dtlb_hdid,cfg_lsu_csm_dtlb_hd_size,
   cfg_lsu_csm_dtlb_sdid,cfg_lsu_csm_dtlb_lsid,

   `endif

   tlu_lsu_tl_zero, tlu_lsu_tid_m, tlu_lsu_stxa_ack_tid,
   tlu_lsu_stxa_ack, tlu_lsu_redmode_rst_d1, tlu_lsu_redmode,
   tlu_lsu_pstate_priv, tlu_lsu_pstate_cle, tlu_lsu_pstate_am,
   tlu_lsu_priv_trap_m, tlu_lsu_pcxpkt, tlu_lsu_ldxa_tid_w2,
   tlu_lsu_ldxa_async_data_vld, tlu_lsu_int_ldxa_vld_w2,
   tlu_lsu_int_ldxa_data_w2, tlu_lsu_int_ld_ill_va_w2,
   tlu_lsu_hpv_priv, tlu_lsu_hpstate_en, tlu_lsu_asi_update_m,
   tlu_lsu_asi_m, tlu_idtlb_dmp_thrid_g, tlu_idtlb_dmp_key_g,
   tlu_exu_early_flush_pipe_w, tlu_early_flush_pipe_w,
   tlu_early_flush_pipe2_w, tlu_dtlb_tte_tag_w2,
   tlu_dtlb_tte_data_w2, tlu_dtlb_tag_rd_g, tlu_dtlb_rw_index_vld_g,
   tlu_dtlb_rw_index_g, tlu_dtlb_invalidate_all_g,
   tlu_dtlb_dmp_vld_g, tlu_dtlb_dmp_sctxt_g, tlu_dtlb_dmp_pctxt_g,
   tlu_dtlb_dmp_nctxt_g, tlu_dtlb_dmp_all_g, tlu_dtlb_dmp_actxt_g,
   tlu_dtlb_data_rd_g, tlu_dsfsr_flt_vld, 
   // testmode_l,
   spu_lsu_unc_error_w2, spu_lsu_stxa_ack_tid, spu_lsu_stxa_ack,
   spu_lsu_ldxa_tid_w2, spu_lsu_ldxa_illgl_va_w2,
   spu_lsu_ldxa_data_w2, spu_lsu_ldxa_data_vld_w2, spu_lsu_int_w2,
   sehold, se, pcx_spc_grant_px, 
   // mux_drive_disable,
   // mem_write_disable, 

   // mbist_write_data, mbist_dcache_write,
   // mbist_dcache_word, mbist_dcache_way, mbist_dcache_read,
   // mbist_dcache_index, 

   ifu_tlu_wsr_inst_d, ifu_tlu_thrid_e,
   ifu_tlu_sraddr_d, ifu_tlu_mb_inst_e, ifu_tlu_inst_vld_m,
   ifu_tlu_flush_m, ifu_tlu_flsh_inst_e, ifu_lsu_thrid_s,
   ifu_lsu_swap_e, ifu_lsu_st_inst_e, ifu_lsu_sign_ext_e,
   ifu_lsu_rd_e, ifu_lsu_pref_inst_e, ifu_lsu_pcxreq_d,
   ifu_lsu_pcxpkt_e, ifu_lsu_nceen, ifu_lsu_memref_d,
   ifu_lsu_ldxa_tid_w2, ifu_lsu_ldxa_illgl_va_w2,
   ifu_lsu_ldxa_data_w2, ifu_lsu_ldxa_data_vld_w2, ifu_lsu_ldstub_e,
   ifu_lsu_ldst_size_e, ifu_lsu_ldst_fp_e, ifu_lsu_ldst_dbl_e,
   ifu_lsu_ld_inst_e, ifu_lsu_inv_clear, ifu_lsu_imm_asi_vld_d,
   ifu_lsu_imm_asi_d, ifu_lsu_ibuf_busy, ifu_lsu_fwd_wr_ack,
   ifu_lsu_fwd_data_vld, ifu_lsu_destid_s, ifu_lsu_casa_e,
   ifu_lsu_asi_rd_unc, ifu_lsu_asi_ack, ifu_lsu_alt_space_e,
   ifu_lsu_alt_space_d, grst_l, gdbginit_l, ffu_lsu_kill_fst_w,
   ffu_lsu_fpop_rq_vld, ffu_lsu_blk_st_va_e, ffu_lsu_blk_st_e,
   exu_tlu_va_oor_m, exu_tlu_misalign_addr_jmpl_rtn_m,
   exu_lsu_rs3_data_e, exu_lsu_rs2_data_e, 

   // efc_spc_fuse_clk2,
   // efc_spc_fuse_clk1, efc_spc_dfuse_dshift, efc_spc_dfuse_data,
   // efc_spc_dfuse_ashift, 
   const_cpuid, clk,
   bist_ctl_reg_out, arst_l, cpx_spc_data_cx, spu_lsu_ldst_pckt,
   exu_lsu_ldst_va_e, exu_lsu_early_va_e, ffu_lsu_data, si0, si1,
   short_si1, short_si0, exu_tlu_wsr_data_m,
   cfg_asi_lsu_ldxa_vld_w2, cfg_asi_lsu_ldxa_tid_w2, cfg_asi_lsu_ldxa_data_w2,

   // sram wrapper interface
   srams_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data,

   core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data

   );

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input                   arst_l;                 // To qctl1 of lsu_qctl1.v, ...
input [`L1D_ADDRESS_HI:0]            bist_ctl_reg_out;       // To dctldp of lsu_dctldp.v
input                   clk;                    // To qctl1 of lsu_qctl1.v, ...
input [2:0]             const_cpuid;            // To qctl2 of lsu_qctl2.v, ...
input [63:0]            exu_lsu_rs2_data_e;     // To stb_rwdp of lsu_stb_rwdp.v
input [63:0]            exu_lsu_rs3_data_e;     // To excpctl of lsu_excpctl.v, ...
input                   exu_tlu_misalign_addr_jmpl_rtn_m;// To excpctl of lsu_excpctl.v
input                   exu_tlu_va_oor_m;       // To excpctl of lsu_excpctl.v
input                   ffu_lsu_blk_st_e;       // To dctl of lsu_dctl.v, ...
input [5:3]             ffu_lsu_blk_st_va_e;    // To stb_rwctl of lsu_stb_rwctl.v
input                   ffu_lsu_fpop_rq_vld;    // To qctl1 of lsu_qctl1.v
input                   ffu_lsu_kill_fst_w;     // To stb_rwctl of lsu_stb_rwctl.v
input                   gdbginit_l;             // To qctl1 of lsu_qctl1.v, ...
input                   grst_l;                 // To qctl2 of lsu_qctl2.v, ...
input                   ifu_lsu_alt_space_d;    // To dctl of lsu_dctl.v
input                   ifu_lsu_alt_space_e;    // To qctl1 of lsu_qctl1.v, ...
input                   ifu_lsu_asi_ack;        // To dctl of lsu_dctl.v
input                   ifu_lsu_asi_rd_unc;     // To dctl of lsu_dctl.v
input                   ifu_lsu_casa_e;         // To qctl1 of lsu_qctl1.v, ...
input [2:0]             ifu_lsu_destid_s;       // To qctl1 of lsu_qctl1.v
input                   ifu_lsu_fwd_data_vld;   // To qctl1 of lsu_qctl1.v, ...
input                   ifu_lsu_fwd_wr_ack;     // To qctl2 of lsu_qctl2.v
input                   ifu_lsu_ibuf_busy;      // To qctl2 of lsu_qctl2.v
input [7:0]             ifu_lsu_imm_asi_d;      // To dctldp of lsu_dctldp.v
input                   ifu_lsu_imm_asi_vld_d;  // To dctldp of lsu_dctldp.v
input                   ifu_lsu_inv_clear;      // To qctl2 of lsu_qctl2.v
input                   ifu_lsu_ld_inst_e;      // To qctl1 of lsu_qctl1.v, ...
input                   ifu_lsu_ldst_dbl_e;     // To qctl1 of lsu_qctl1.v, ...
input                   ifu_lsu_ldst_fp_e;      // To qctl1 of lsu_qctl1.v, ...
input [1:0]             ifu_lsu_ldst_size_e;    // To dctl of lsu_dctl.v, ...
input                   ifu_lsu_ldstub_e;       // To dctl of lsu_dctl.v, ...
input                   ifu_lsu_ldxa_data_vld_w2;// To dctl of lsu_dctl.v
input [63:0]            ifu_lsu_ldxa_data_w2;   // To qdp1 of lsu_qdp1.v
input                   ifu_lsu_ldxa_illgl_va_w2;// To dctl of lsu_dctl.v
input [1:0]             ifu_lsu_ldxa_tid_w2;    // To dctl of lsu_dctl.v
input                   ifu_lsu_memref_d;       // To qctl2 of lsu_qctl2.v, ...
input [3:0]             ifu_lsu_nceen;          // To excpctl of lsu_excpctl.v, ...
input [51:0]            ifu_lsu_pcxpkt_e;       // To qctl1 of lsu_qctl1.v, ...
input                   ifu_lsu_pcxreq_d;       // To qctl1 of lsu_qctl1.v
input                   ifu_lsu_pref_inst_e;    // To qctl1 of lsu_qctl1.v, ...
input [4:0]             ifu_lsu_rd_e;           // To qctl2 of lsu_qctl2.v, ...
input                   ifu_lsu_sign_ext_e;     // To dctl of lsu_dctl.v
input                   ifu_lsu_st_inst_e;      // To excpctl of lsu_excpctl.v, ...
input                   ifu_lsu_swap_e;         // To dctl of lsu_dctl.v, ...
input [1:0]             ifu_lsu_thrid_s;        // To dctl of lsu_dctl.v
input                   ifu_tlu_flsh_inst_e;    // To dctl of lsu_dctl.v, ...
input                   ifu_tlu_flush_m;        // To dctl of lsu_dctl.v
input                   ifu_tlu_inst_vld_m;     // To qctl1 of lsu_qctl1.v, ...
input                   ifu_tlu_mb_inst_e;      // To dctl of lsu_dctl.v
input [6:0]             ifu_tlu_sraddr_d;       // To dctl of lsu_dctl.v
input [1:0]             ifu_tlu_thrid_e;        // To qctl1 of lsu_qctl1.v, ...
input                   ifu_tlu_wsr_inst_d;     // To dctl of lsu_dctl.v
// input [6:0]             mbist_dcache_index;     // To dctl of lsu_dctl.v
// input                   mbist_dcache_read;      // To dctl of lsu_dctl.v
// input [1:0]             mbist_dcache_way;       // To dctl of lsu_dctl.v
// input                   mbist_dcache_word;      // To dctl of lsu_dctl.v
// input                   mbist_dcache_write;     // To dctl of lsu_dctl.v
// input [7:0]             mbist_write_data;       // To qdp2 of lsu_qdp2.v
input [4:0]             pcx_spc_grant_px;       // To qctl1 of lsu_qctl1.v
input                   se;                     // To qctl1 of lsu_qctl1.v, ...
input                   sehold;                 // To qctl1 of lsu_qctl1.v, ...
input                   spu_lsu_int_w2;         // To dctl of lsu_dctl.v
input                   spu_lsu_ldxa_data_vld_w2;// To dctl of lsu_dctl.v
input [63:0]            spu_lsu_ldxa_data_w2;   // To qdp1 of lsu_qdp1.v
input                   spu_lsu_ldxa_illgl_va_w2;// To dctl of lsu_dctl.v
input [1:0]             spu_lsu_ldxa_tid_w2;    // To dctl of lsu_dctl.v
input                   spu_lsu_stxa_ack;       // To dctl of lsu_dctl.v
input [1:0]             spu_lsu_stxa_ack_tid;   // To dctl of lsu_dctl.v
input                   spu_lsu_unc_error_w2;   // To dctl of lsu_dctl.v
// input                   testmode_l;             // To dcdhdr of cmp_sram_redhdr.v
input [3:0]             tlu_dsfsr_flt_vld;      // To excpctl of lsu_excpctl.v
input                   tlu_dtlb_data_rd_g;     // To dctl of lsu_dctl.v
input                   tlu_dtlb_dmp_actxt_g;   // To dctl of lsu_dctl.v, ...
input                   tlu_dtlb_dmp_all_g;     // To dctl of lsu_dctl.v
input                   tlu_dtlb_dmp_nctxt_g;   // To dctl of lsu_dctl.v
input                   tlu_dtlb_dmp_pctxt_g;   // To dctl of lsu_dctl.v
input                   tlu_dtlb_dmp_sctxt_g;   // To dctl of lsu_dctl.v
input                   tlu_dtlb_dmp_vld_g;     // To dctl of lsu_dctl.v
input                   tlu_dtlb_invalidate_all_g;// To dctl of lsu_dctl.v
input [5:0]             tlu_dtlb_rw_index_g;    // To dctl of lsu_dctl.v, ...
input                   tlu_dtlb_rw_index_vld_g;// To dctl of lsu_dctl.v
input                   tlu_dtlb_tag_rd_g;      // To dctl of lsu_dctl.v
input [42:0]            tlu_dtlb_tte_data_w2;   // To dtlb of bw_r_tlb.v
input [58:0]            tlu_dtlb_tte_tag_w2;    // To dctldp of lsu_dctldp.v, ...
input                   tlu_early_flush_pipe2_w;// To qctl1 of lsu_qctl1.v, ...
input                   tlu_early_flush_pipe_w; // To excpctl of lsu_excpctl.v
input                   tlu_exu_early_flush_pipe_w;// To stb_rwctl of lsu_stb_rwctl.v
input [40:0]            tlu_idtlb_dmp_key_g;    // To dtlb of bw_r_tlb.v
input [1:0]             tlu_idtlb_dmp_thrid_g;  // To dctl of lsu_dctl.v
input [7:0]             tlu_lsu_asi_m;          // To dctldp of lsu_dctldp.v
input                   tlu_lsu_asi_update_m;   // To dctl of lsu_dctl.v
input [3:0]             tlu_lsu_hpstate_en;     // To dctl of lsu_dctl.v
input [3:0]             tlu_lsu_hpv_priv;       // To dctl of lsu_dctl.v
input                   tlu_lsu_int_ld_ill_va_w2;// To dctl of lsu_dctl.v
input [63:0]            tlu_lsu_int_ldxa_data_w2;// To qdp1 of lsu_qdp1.v
input                   tlu_lsu_int_ldxa_vld_w2;// To dctl of lsu_dctl.v
input                   tlu_lsu_ldxa_async_data_vld;// To dctl of lsu_dctl.v
input [1:0]             tlu_lsu_ldxa_tid_w2;    // To dctl of lsu_dctl.v
input [25:0]            tlu_lsu_pcxpkt;         // To qctl1 of lsu_qctl1.v, ...
input                   tlu_lsu_priv_trap_m;    // To excpctl of lsu_excpctl.v
input [3:0]             tlu_lsu_pstate_am;      // To excpctl of lsu_excpctl.v, ...
input [3:0]             tlu_lsu_pstate_cle;     // To excpctl of lsu_excpctl.v, ...
input [3:0]             tlu_lsu_pstate_priv;    // To excpctl of lsu_excpctl.v
input [3:0]             tlu_lsu_redmode;        // To dctl of lsu_dctl.v
input [3:0]             tlu_lsu_redmode_rst_d1; // To dctl of lsu_dctl.v
input                   tlu_lsu_stxa_ack;       // To dctl of lsu_dctl.v
input [1:0]             tlu_lsu_stxa_ack_tid;   // To dctl of lsu_dctl.v
input [1:0]             tlu_lsu_tid_m;          // To dctl of lsu_dctl.v
input [3:0]             tlu_lsu_tl_zero;        // To dctl of lsu_dctl.v
`ifndef NO_RTL_CSM
input                   tlu_dtlb_csm_rd_g;
input [`TLB_CSM]        tlu_dtlb_tte_csm_w2;
input [`TLB_CSM]        ifu_lsu_pcxcsm_e;       // To qctl1 of lsu_qctl1.v, ...
input                   tlu_dtlb_wr_csm_sel_g;

input [`CFG_CSM_STATE_WIDTH-1:0]   cfg_lsu_csm_dtlb_state;
input [`NOC_CHIPID_WIDTH-1:0]      cfg_lsu_csm_dtlb_chipid;
input [`NOC_X_WIDTH-1:0]           cfg_lsu_csm_dtlb_x;
input [`NOC_Y_WIDTH-1:0]           cfg_lsu_csm_dtlb_y;
input [`MSG_HDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hdid;
input [`MSG_LHID_WIDTH-1:0]        cfg_lsu_csm_dtlb_hd_size;
input [`MSG_SDID_WIDTH-1:0]        cfg_lsu_csm_dtlb_sdid;
input [`MSG_LSID_WIDTH-1:0]        cfg_lsu_csm_dtlb_lsid;
`endif

// End of automatics
input                   cfg_asi_lsu_ldxa_vld_w2;
input [1:0]             cfg_asi_lsu_ldxa_tid_w2;
input [63:0]            cfg_asi_lsu_ldxa_data_w2;


// sram wrapper interface
// output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w01_rtap_data;
// output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w23_rtap_data;
// output [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dtag_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w01_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dcache_w23_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] sram_dtag_rtap_data;
wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] dcv_rtap_data;
output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

assign srams_rtap_data = sram_dcache_w01_rtap_data
                        | sram_dcache_w23_rtap_data
                        // | dcv_rtap_data
                        | sram_dtag_rtap_data;

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



/*AUTOOUTPUT*/
// trin: removing useless output
// Beginning of automatic outputs (from unused autoinst outputs)
// output [6:0]            bist_ctl_reg_in;        // From dctldp of lsu_dctldp.v
// output                  bist_ctl_reg_wr_en;     // From dctl of lsu_dctl.v
wire   [6:0]            bist_ctl_reg_in;        // From dctldp of lsu_dctldp.v
wire                    bist_ctl_reg_wr_en;     // From dctl of lsu_dctl.v
output                  ifu_tlu_flush_fd2_w;    // From dctl of lsu_dctl.v
output                  ifu_tlu_flush_fd3_w;    // From dctl of lsu_dctl.v
output                  ifu_tlu_flush_fd_w;     // From dctl of lsu_dctl.v
output [7:0]            lsu_asi_reg0;           // From dctldp of lsu_dctldp.v
output [7:0]            lsu_asi_reg1;           // From dctldp of lsu_dctldp.v
output [7:0]            lsu_asi_reg2;           // From dctldp of lsu_dctldp.v
output [7:0]            lsu_asi_reg3;           // From dctldp of lsu_dctldp.v
output [3:0]            lsu_dmmu_sfsr_trp_wr;   // From excpctl of lsu_excpctl.v
output [23:0]           lsu_dsfsr_din_g;        // From excpctl of lsu_excpctl.v
output [63:0]           lsu_exu_dfill_data_w2;  // From dcdp of lsu_dcdp.v
output                  lsu_exu_dfill_vld_w2;   // From dctl of lsu_dctl.v
output                  lsu_exu_flush_pipe_w;   // From excpctl of lsu_excpctl.v
output                  lsu_exu_ldst_miss_w2;   // From dctl of lsu_dctl.v
output [4:0]            lsu_exu_rd_m;           // From qctl2 of lsu_qctl2.v
output                  lsu_exu_st_dtlb_perr_g; // From excpctl of lsu_excpctl.v
output [1:0]            lsu_exu_thr_m;          // From dctl of lsu_dctl.v
output                  lsu_ffu_ack;            // From qctl1 of lsu_qctl1.v
output                  lsu_ffu_blk_asi_e;      // From dctl of lsu_dctl.v
output                  lsu_ffu_flush_pipe_w;   // From excpctl of lsu_excpctl.v
output [63:0]           lsu_ffu_ld_data;        // From dcdp of lsu_dcdp.v
output                  lsu_ffu_ld_vld;         // From dctl of lsu_dctl.v
output                  lsu_ffu_st_dtlb_perr_g; // From excpctl of lsu_excpctl.v
output                  lsu_ffu_stb_full0;      // From stb_rwctl of lsu_stb_rwctl.v
output                  lsu_ffu_stb_full1;      // From stb_rwctl of lsu_stb_rwctl.v
output                  lsu_ffu_stb_full2;      // From stb_rwctl of lsu_stb_rwctl.v
output                  lsu_ffu_stb_full3;      // From stb_rwctl of lsu_stb_rwctl.v
output [3:0]            lsu_ictag_mrgn;         // From dctldp of lsu_dctldp.v
output [17:0]           lsu_ifu_asi_addr;       // From dctldp of lsu_dctldp.v
output                  lsu_ifu_asi_load;       // From dctl of lsu_dctl.v
output [7:0]            lsu_ifu_asi_state;      // From dctldp of lsu_dctldp.v
output [1:0]            lsu_ifu_asi_thrid;      // From dctl of lsu_dctl.v
output                  lsu_ifu_asi_vld;        // From dctl of lsu_dctl.v
output [`CPX_VLD-1:0]   lsu_ifu_cpxpkt_i1;      // From qdp2 of lsu_qdp2.v
output                  lsu_ifu_cpxpkt_vld_i1;  // From qctl2 of lsu_qctl2.v
output                  lsu_ifu_dc_parity_error_w2;// From dctl of lsu_dctl.v
output                  lsu_ifu_dcache_data_perror;// From dctl of lsu_dctl.v
output                  lsu_ifu_dcache_tag_perror;// From dctl of lsu_dctl.v
output                  lsu_ifu_direct_map_l1;  // From dctldp of lsu_dctldp.v
output [1:0]            lsu_ifu_error_tid;      // From dctl of lsu_dctl.v
output                  lsu_ifu_flush_pipe_w;   // From excpctl of lsu_excpctl.v
output [3:0]            lsu_ifu_icache_en;      // From dctl of lsu_dctl.v
output                  lsu_ifu_io_error;       // From dctl of lsu_dctl.v
output [3:0]            lsu_ifu_itlb_en;        // From dctl of lsu_dctl.v
output                  lsu_ifu_l2_corr_error;  // From dctl of lsu_dctl.v
output                  lsu_ifu_l2_unc_error;   // From dctl of lsu_dctl.v
output [`IC_IDX_HI:5]           lsu_ifu_ld_icache_index;// From qdp1 of lsu_qdp1.v
output [1:0]            lsu_ifu_ld_pcxpkt_tid;  // From qdp1 of lsu_qdp1.v
output                  lsu_ifu_ld_pcxpkt_vld;  // From qctl1 of lsu_qctl1.v
output [3:0]            lsu_ifu_ldst_cmplt;     // From dctl of lsu_dctl.v
output                  lsu_ifu_ldst_miss_w;    // From dctl of lsu_dctl.v
output                  lsu_ifu_ldsta_internal_e;// From dctl of lsu_dctl.v
output                  lsu_ifu_pcxpkt_ack_d;   // From qctl1 of lsu_qctl1.v
output                  lsu_ifu_stallreq;       // From qctl2 of lsu_qctl2.v
output [3:0]            lsu_ifu_stbcnt0;        // From stb_rwctl of lsu_stb_rwctl.v
output [3:0]            lsu_ifu_stbcnt1;        // From stb_rwctl of lsu_stb_rwctl.v
output [3:0]            lsu_ifu_stbcnt2;        // From stb_rwctl of lsu_stb_rwctl.v
output [3:0]            lsu_ifu_stbcnt3;        // From stb_rwctl of lsu_stb_rwctl.v
output [47:0]           lsu_ifu_stxa_data;      // From qdp1 of lsu_qdp1.v
output                  lsu_ifu_tlb_data_su;    // From excpctl of lsu_excpctl.v
output                  lsu_ifu_tlb_data_ue;    // From excpctl of lsu_excpctl.v
output                  lsu_ifu_tlb_tag_ue;     // From excpctl of lsu_excpctl.v
output [7:0]            lsu_itlb_mrgn;          // From dctldp of lsu_dctldp.v
output [3:0]            lsu_mamem_mrgn;         // From dctldp of lsu_dctldp.v
output                  lsu_mmu_defr_trp_taken_g;// From excpctl of lsu_excpctl.v
output                  lsu_mmu_flush_pipe_w;   // From excpctl of lsu_excpctl.v
output [63:0]           lsu_mmu_rs3_data_g;     // From qdp1 of lsu_qdp1.v
output [2:0]            lsu_pid_state0;         // From dctldp of lsu_dctldp.v
output [2:0]            lsu_pid_state1;         // From dctldp of lsu_dctldp.v
output [2:0]            lsu_pid_state2;         // From dctldp of lsu_dctldp.v
output [2:0]            lsu_pid_state3;         // From dctldp of lsu_dctldp.v
output [7:0]            lsu_spu_asi_state_e;    // From dctldp of lsu_dctldp.v
output                  lsu_spu_early_flush_g;  // From excpctl of lsu_excpctl.v
output                  lsu_spu_ldst_ack;       // From qctl1 of lsu_qctl1.v
output [3:0]            lsu_spu_stb_empty;      // From stb_rwctl of lsu_stb_rwctl.v
output [1:0]            lsu_spu_strm_ack_cmplt; // From qctl2 of lsu_qctl2.v
output [12:0]           lsu_t0_pctxt_state;     // From dctldp of lsu_dctldp.v
output [12:0]           lsu_t1_pctxt_state;     // From dctldp of lsu_dctldp.v
output [12:0]           lsu_t2_pctxt_state;     // From dctldp of lsu_dctldp.v
output [12:0]           lsu_t3_pctxt_state;     // From dctldp of lsu_dctldp.v
output [1:0]            lsu_tlu_async_tid_w2;   // From dctl of lsu_dctl.v
output                  lsu_tlu_async_ttype_vld_w2;// From dctl of lsu_dctl.v
output [6:0]            lsu_tlu_async_ttype_w2; // From dctl of lsu_dctl.v
output [3:0]            lsu_tlu_cpx_req;        // From qctl2 of lsu_qctl2.v
output                  lsu_tlu_cpx_vld;        // From qctl2 of lsu_qctl2.v
output                  lsu_tlu_daccess_excptn_g;// From excpctl of lsu_excpctl.v
output [3:0]            lsu_tlu_dcache_miss_w2; // From qctl1 of lsu_qctl1.v
output                  lsu_tlu_defr_trp_taken_g;// From excpctl of lsu_excpctl.v
output                  lsu_tlu_dmmu_miss_g;    // From excpctl of lsu_excpctl.v
output [12:0]           lsu_tlu_dside_ctxt_m;   // From dctldp of lsu_dctldp.v
output                  lsu_tlu_dtlb_done;      // From dctl of lsu_dctl.v
output                  lsu_tlu_early_flush2_w; // From excpctl of lsu_excpctl.v
output                  lsu_tlu_early_flush_w;  // From excpctl of lsu_excpctl.v
output [17:0]           lsu_tlu_intpkt;         // From qctl2 of lsu_qctl2.v
output [3:0]            lsu_tlu_l2_dmiss;       // From qctl2 of lsu_qctl2.v
output [9:0]            lsu_tlu_ldst_va_m;      // From dctldp of lsu_dctldp.v
output                  lsu_tlu_misalign_addr_ldst_atm_m;// From excpctl of lsu_excpctl.v
output [12:0]           lsu_tlu_pctxt_m;        // From dctldp of lsu_dctldp.v
output                  lsu_tlu_pcxpkt_ack;     // From qctl1 of lsu_qctl1.v
output [63:0]           lsu_tlu_rs3_data_g;     // From qdp1 of lsu_qdp1.v
output [7:0]            lsu_tlu_rsr_data_e;     // From dctldp of lsu_dctldp.v
output [3:0]            lsu_tlu_stb_full_w2;    // From stb_ctl0 of lsu_stb_ctl.v, ...
output [1:0]            lsu_tlu_thrid_d;        // From dctl of lsu_dctl.v
output [1:0]            lsu_tlu_tlb_access_tid_m;// From dctl of lsu_dctl.v
output [7:0]            lsu_tlu_tlb_asi_state_m;// From dctldp of lsu_dctldp.v
output [47:13]          lsu_tlu_tlb_dmp_va_m;   // From dctldp of lsu_dctldp.v
output                  lsu_tlu_tlb_ld_inst_m;  // From dctl of lsu_dctl.v
output [`L1D_ADDRESS_HI:0]           lsu_tlu_tlb_ldst_va_m;  // From dctldp of lsu_dctldp.v
output                  lsu_tlu_tlb_st_inst_m;  // From,tl of lsu_dctl.v
output [8:0]            lsu_tlu_ttype_m2;       // From excpctl of lsu_excpctl.v
output                  lsu_tlu_ttype_vld_m2;   // From excpctl of lsu_excpctl.v
output                  lsu_tlu_wsr_inst_e;     // From dctl of lsu_dctl.v
// output [71:0]           mbist_dcache_data_in;   // From dcdp of lsu_dcdp.v
output                  spc_pcx_atom_pq;        // From qctl1 of lsu_qctl1.v
output [`PCX_WIDTH-1:0] spc_pcx_data_pa;        // From qdp1 of lsu_qdp1.v
output [4:0]            spc_pcx_req_pq;         // From qctl1 of lsu_qctl1.v
// End of automatics

`ifndef NO_RTL_CSM
output [`TLB_CSM]       spc_pcx_csm_pa;
`endif

// trin: disabling useless in/outs
wire [`L1D_ADDRESS_HI-4:0]              mbist_dcache_index = 1'b0;     // To dctl of lsu_dctl.v
wire                    mbist_dcache_read = 1'b0;      // To dctl of lsu_dctl.v
wire [1:0]              mbist_dcache_way = 2'b0;       // To dctl of lsu_dctl.v
wire                    mbist_dcache_word = 1'b0;      // To dctl of lsu_dctl.v
wire                    mbist_dcache_write = 1'b0;     // To dctl of lsu_dctl.v
wire [7:0]              mbist_write_data = 8'b0;       // To qdp2 of lsu_qdp2.v

wire [71:0]             mbist_dcache_data_in;   // From dcdp of lsu_dcdp.v
// wire                    spc_efc_dfuse_data;     // From dcdhdr of cmp_sram_redhdr.v
// wire                   mem_write_disable = 0;      // To dcache of bw_r_dcd.v, ...
// wire                   mux_drive_disable = 0;      // To qctl1 of lsu_qctl1.v, ...
// wire mux_drive_disable = ~grst_l;
// wire mem_write_disable = ~grst_l;
wire mux_drive_disable = 1'b0;
wire mem_write_disable = 1'b0;
wire efc_spc_dfuse_ashift = 1'b0;
wire efc_spc_dfuse_data = 1'b0;
wire efc_spc_dfuse_dshift = 1'b0;
wire efc_spc_fuse_clk1 = 1'b0;
wire efc_spc_fuse_clk2 = 1'b0;




/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)

wire                    as_if_user_asi_m;       // From dctl of lsu_dctl.v
wire [7:0]              asi_d;                  // From dctldp of lsu_dctldp.v
wire                    asi_internal_m;         // From dctl of lsu_dctl.v
wire [3:0]              asi_state_wr_thrd;      // From dctl of lsu_dctl.v
wire                    asi_tte_data_perror;    // From excpctl of lsu_excpctl.v
wire                    asi_tte_tag_perror;     // From excpctl of lsu_excpctl.v
wire [5:0]              async_tlb_index;        // From dctl of lsu_dctl.v
wire                    atomic_asi_m;           // From dctl of lsu_dctl.v
wire                    atomic_m;               // From dctl of lsu_dctl.v
wire                    binit_quad_asi_m;       // From dctl of lsu_dctl.v
wire                    bist_tap_wr_en;         // From dctl of lsu_dctl.v
wire                    blk_asi_m;              // From dctl of lsu_dctl.v
wire                    cache_hit;              // From dtlb of bw_r_tlb.v
wire [`L1D_WAY_COUNT-1:0]              cache_way_hit;          // From dtlb of bw_r_tlb.v
wire [`L1D_WAY_COUNT-1:0]              cache_way_hit_buf1;     // From tlbdp of lsu_tlbdp.v
wire [`L1D_WAY_COUNT-1:0]              cache_way_hit_buf2;     // From tlbdp of lsu_tlbdp.v
wire                    cam_real_m;             // From dctl of lsu_dctl.v
wire                    cpx_fwd_pkt_en_cx;      // From qctl2 of lsu_qctl2.v
wire                    cpx_st_ack_tid0;        // From qctl2 of lsu_qctl2.v
wire                    cpx_st_ack_tid1;        // From qctl2 of lsu_qctl2.v
wire                    cpx_st_ack_tid2;        // From qctl2 of lsu_qctl2.v
wire                    cpx_st_ack_tid3;        // From qctl2 of lsu_qctl2.v
wire                    data_rd_vld_g;          // From dctl of lsu_dctl.v
wire                    dc_direct_map;          // From dctldp of lsu_dctldp.v
wire [63:0]             dcache_alt_data_w0_m;   // From qdp1 of lsu_qdp1.v
wire                    dcache_alt_mx_sel_e;    // From dctl of lsu_dctl.v
wire                    dcache_alt_mx_sel_e_bf; // From dctl of lsu_dctl.v
wire                    dcache_arry_data_sel_m; // From dctl of lsu_dctl.v
wire [15:0]             dcache_byte_wr_en_e;    // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI-3:0]              dcache_iob_addr_e;      // From qdp2 of lsu_qdp2.v
// wire [7:0]              dcache_rdata_msb_w0_m;  // From dcache of bw_r_dcd.v
// wire [7:0]              dcache_rdata_msb_w1_m;  // From dcache of bw_r_dcd.v
// wire [7:0]              dcache_rdata_msb_w2_m;  // From dcache of bw_r_dcd.v
// wire [7:0]              dcache_rdata_msb_w3_m;  // From dcache of bw_r_dcd.v
wire [`L1D_WAY_COUNT*8-1:0]              dcache_rdata_msb_m;  // From dcache of bw_r_dcd.v
wire [63:0]             dcache_rdata_wb;        // From dcache of bw_r_dcd.v
wire [63:0]             dcache_rdata_wb_buf;    // From dcdp of lsu_dcdp.v
wire                    dcache_rparity_err_wb;  // From dcache of bw_r_dcd.v
wire [7:0]              dcache_rparity_wb;      // From dcache of bw_r_dcd.v
wire                    dcache_rvld_e;          // From dctl of lsu_dctl.v

// trin
wire [1:0]              dcd_fuse_repair_en;     // From dcache of bw_r_dcd.v
wire [7:0]              dcd_fuse_repair_value;  // From dcache of bw_r_dcd.v
assign dcd_fuse_repair_en = 2'b0;
assign dcd_fuse_repair_value = 2'b0;

wire                    dctl_rst_l;             // From dctl of lsu_dctl.v
wire                    dfill_tlb_asi_e;        // From dctl of lsu_dctl.v
wire                    dfq_byp_ff_en;          // From qctl2 of lsu_qctl2.v
wire [3:0]              dfq_byp_sel;            // From qctl2 of lsu_qctl2.v
wire [4:0]              dfq_rptr;               // From qctl2 of lsu_qctl2.v
wire                    dfq_rptr_vld;           // From qctl2 of lsu_qctl2.v
wire [1:0]              dfq_tid;                // From qdp2 of lsu_qdp2.v
wire [4:0]              dfq_wptr;               // From qctl2 of lsu_qctl2.v
wire                    dfq_wptr_vld;           // From qctl2 of lsu_qctl2.v
wire [3:0]              dfture_tap_rd_en;       // From dctl of lsu_dctl.v
wire                    dfture_tap_wr_mx_sel;   // From dctl of lsu_dctl.v
// wire [32:0]             dtag_rdata_w0_m;        // From dtag of bw_r_dct.v
// wire [32:0]             dtag_rdata_w1_m;        // From dtag of bw_r_dct.v
// wire [32:0]             dtag_rdata_w2_m;        // From dtag of bw_r_dct.v
// wire [32:0]             dtag_rdata_w3_m;        // From dtag of bw_r_dct.v
wire [`L1D_TAG_ARRAY_REAL_WIDTH-1:0]             dtag_rdata_m;        // From dtag of bw_r_dct.v
wire                    dtlb_bypass_m;          // From dctl of lsu_dctl.v
wire [`L1D_VAL_ARRAY_HI:0]             dva_bit_wr_en_e;        // From dctl of lsu_dctl.v
wire                    dva_din_e;              // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI-6:0]              dva_snp_addr_e;         // From qctl2 of lsu_qctl2.v
wire [`L1D_VAL_ARRAY_HI:0]             dva_snp_bit_wr_en_e;    // From qctl2 of lsu_qctl2.v
wire                    dva_svld_e;             // From qctl2 of lsu_qctl2.v
wire [`L1D_WAY_COUNT-1:0]              dva_vld_m;              // From dva of sram_l1d_val.v
wire [`L1D_WAY_COUNT-1:0]              dva_vld_m_bf;           // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI:6]             dva_wr_adr_e;           // From dctl of lsu_dctl.v
wire                    flsh_inst_m;            // From stb_rwctl of lsu_stb_rwctl.v
wire                    fp_ldst_m;              // From dctl of lsu_dctl.v

// trin
wire [1:0]              fuse_dcd_repair_en;     // From dcdhdr of cmp_sram_redhdr.v
wire [7:0]              fuse_dcd_repair_value;  // From dcdhdr of cmp_sram_redhdr.v
wire [5:0]              fuse_dcd_rid;           // From dcdhdr of cmp_sram_redhdr.v
wire                    fuse_dcd_wren;          // From dcdhdr of cmp_sram_redhdr.v
assign fuse_dcd_wren = 1'b0;
assign fuse_dcd_repair_en = 2'b0;
assign fuse_dcd_repair_value = 8'b0;
assign fuse_dcd_rid = 6'b0;

wire [2:0]              fwd_int_fp_pcx_mx_sel;  // From qctl1 of lsu_qctl1.v
wire                    hpstate_en_m;           // From dctl of lsu_dctl.v
wire                    hpv_priv_m;             // From dctl of lsu_dctl.v
wire                    ifill_tlb_asi_e;        // From dctl of lsu_dctl.v
wire                    ifu_lsu_flush_w;        // From dctl of lsu_dctl.v
wire                    ifu_tlu_inst_vld_m_bf2; // From stb_rwctl of lsu_stb_rwctl.v
wire                    imiss_pcx_mx_sel;       // From qctl1 of lsu_qctl1.v
wire                    l2fill_vld_m;           // From dctl of lsu_dctl.v
wire [3:0]              lctl_rst;               // From dctl of lsu_dctl.v
wire [`LMQ_WIDTH-1:40]  ld_pcx_pkt_g;           // From dctl of lsu_dctl.v
wire [1:0]              ld_pcx_thrd;            // From qctl1 of lsu_qctl1.v
wire [2:0]              ld_rawp_st_ackid_w2;    // From stb_rwctl of lsu_stb_rwctl.v
wire                    ld_rawp_st_ced_w2;      // From stb_rwctl of lsu_stb_rwctl.v
wire                    ld_sec_active;          // From qctl2 of lsu_qctl2.v
wire                    ld_sec_hit_thrd0;       // From qdp1 of lsu_qdp1.v
wire                    ld_sec_hit_thrd1;       // From qdp1 of lsu_qdp1.v
wire                    ld_sec_hit_thrd2;       // From qdp1 of lsu_qdp1.v
wire                    ld_sec_hit_thrd3;       // From qdp1 of lsu_qdp1.v
wire                    ld_stb_full_raw_w2;     // From qctl1 of lsu_qctl1.v
wire [3:0]              ld_thrd_byp_mxsel_m;    // From dctl of lsu_dctl.v
wire                    lda_internal_m;         // From dctl of lsu_dctl.v
wire                    ldd_in_dfq_out;         // From qctl2 of lsu_qctl2.v
wire                    ldiagctl_wr_en;         // From dctl of lsu_dctl.v
wire                    ldst_dbl_m;             // From dctl of lsu_dctl.v
wire [1:0]              ldst_sz_m;              // From dctl of lsu_dctl.v
wire                    ldxa_internal;          // From dctl of lsu_dctl.v

wire [1:0]              lmq0_byp_misc_sz;       // From qdp1 of lsu_qdp1.v
wire                    lmq0_l2fill_fpld;       // From qdp1 of lsu_qdp1.v
wire [2:0]              lmq0_ld_rq_type;        // From qdp1 of lsu_qdp1.v
wire                    lmq0_ldd_vld;           // From qdp1 of lsu_qdp1.v
wire                    lmq0_ncache_ld;         // From qdp1 of lsu_qdp1.v
wire [`L1D_ADDRESS_HI:0]             lmq0_pcx_pkt_addr;      // From qdp1 of lsu_qdp1.v
wire [`L1D_WAY_MASK]              lmq0_pcx_pkt_way;       // From qctl1 of lsu_qctl1.v

wire [1:0]              lmq1_byp_misc_sz;       // From qdp1 of lsu_qdp1.v
wire                    lmq1_l2fill_fpld;       // From qdp1 of lsu_qdp1.v
wire [2:0]              lmq1_ld_rq_type;        // From qdp1 of lsu_qdp1.v
wire                    lmq1_ldd_vld;           // From qdp1 of lsu_qdp1.v
wire                    lmq1_ncache_ld;         // From qdp1 of lsu_qdp1.v
wire [`L1D_ADDRESS_HI:0]             lmq1_pcx_pkt_addr;      // From qdp1 of lsu_qdp1.v
wire [`L1D_WAY_MASK]              lmq1_pcx_pkt_way;       // From qctl1 of lsu_qctl1.v
wire [1:0]              lmq2_byp_misc_sz;       // From qdp1 of lsu_qdp1.v
wire                    lmq2_l2fill_fpld;       // From qdp1 of lsu_qdp1.v
wire [2:0]              lmq2_ld_rq_type;        // From qdp1 of lsu_qdp1.v
wire                    lmq2_ldd_vld;           // From qdp1 of lsu_qdp1.v
wire                    lmq2_ncache_ld;         // From qdp1 of lsu_qdp1.v
wire [`L1D_ADDRESS_HI:0]             lmq2_pcx_pkt_addr;      // From qdp1 of lsu_qdp1.v
wire [`L1D_WAY_MASK]              lmq2_pcx_pkt_way;       // From qctl1 of lsu_qctl1.v
wire [1:0]              lmq3_byp_misc_sz;       // From qdp1 of lsu_qdp1.v
wire                    lmq3_l2fill_fpld;       // From qdp1 of lsu_qdp1.v
wire [2:0]              lmq3_ld_rq_type;        // From qdp1 of lsu_qdp1.v
wire                    lmq3_ldd_vld;           // From qdp1 of lsu_qdp1.v
wire                    lmq3_ncache_ld;         // From qdp1 of lsu_qdp1.v
wire [`L1D_ADDRESS_HI:0]             lmq3_pcx_pkt_addr;      // From qdp1 of lsu_qdp1.v
wire [`L1D_WAY_MASK]              lmq3_pcx_pkt_way;       // From qctl1 of lsu_qctl1.v

wire [3:0]              lmq_byp_data_en_w2;     // From dctl of lsu_dctl.v
wire [3:0]              lmq_byp_data_fmx_sel;   // From dctl of lsu_dctl.v
wire [3:0]              lmq_byp_data_mxsel0;    // From dctl of lsu_dctl.v
wire [3:0]              lmq_byp_data_mxsel1;    // From dctl of lsu_dctl.v
wire [3:0]              lmq_byp_data_mxsel2;    // From dctl of lsu_dctl.v
wire [3:0]              lmq_byp_data_mxsel3;    // From dctl of lsu_dctl.v
wire [2:0]              lmq_byp_ldxa_mxsel0;    // From dctl of lsu_dctl.v
wire [2:0]              lmq_byp_ldxa_mxsel1;    // From dctl of lsu_dctl.v
wire [2:0]              lmq_byp_ldxa_mxsel2;    // From dctl of lsu_dctl.v
wire [2:0]              lmq_byp_ldxa_mxsel3;    // From dctl of lsu_dctl.v
wire [3:0]              lmq_enable;             // From qctl1 of lsu_qctl1.v
wire                    lmq_ld_addr_b3;         // From dctl of lsu_dctl.v
wire [4:0]              lmq_ld_rd1;             // From qdp1 of lsu_qdp1.v
wire                    lmq_ldd_vld;            // From dctl of lsu_dctl.v
wire                    lsu_alt_space_m;        // From dctl of lsu_dctl.v
wire [2:0]              lsu_asi_sel_fmx1;       // From dctl of lsu_dctl.v
wire [2:0]              lsu_asi_sel_fmx2;       // From dctl of lsu_dctl.v
wire                    lsu_atm_st_cmplt_e;     // From qctl2 of lsu_qctl2.v
wire [2:0]              lsu_atomic_pkt2_bsel_g; // From dctl of lsu_dctl.v
wire [`L1D_WAY_COUNT-1:0]              lsu_bist_rsel_way_e;    // From dctl of lsu_dctl.v
wire [2:0]              lsu_bld_cnt_m;          // From qctl1 of lsu_qctl1.v
wire                    lsu_bld_helper_cmplt_m; // From qctl1 of lsu_qctl1.v
wire                    lsu_bld_pcx_rq;         // From qctl1 of lsu_qctl1.v
wire                    lsu_bld_reset;          // From qctl1 of lsu_qctl1.v
wire [1:0]              lsu_bld_rq_addr;        // From qctl1 of lsu_qctl1.v
wire                    lsu_blk_asi_m;          // From dctl of lsu_dctl.v
wire                    lsu_blk_st_m;           // From dctl of lsu_dctl.v
wire [39:10]            lsu_blkst_pgnum_m;      // From dctl of lsu_dctl.v
wire                    lsu_bst_in_pipe_m;      // From dctl of lsu_dctl.v
wire                    lsu_byp_ldd_oddrd_m;    // From qctl2 of lsu_qctl2.v
wire [1:0]              lsu_byp_misc_sz_e;      // From qdp1 of lsu_qdp1.v
wire [7:0]              lsu_cpu_dcd_sel;        // From qctl2 of lsu_qctl2.v
// wire                    lsu_cpu_inv_data_b0;    // From qdp2 of lsu_qdp2.v
// wire [13:9]             lsu_cpu_inv_data_b13to9;// From qdp2 of lsu_qdp2.v
// wire [7:2]              lsu_cpu_inv_data_b7to2; // From qdp2 of lsu_qdp2.v
wire                        lsu_cpu_inv_data_val ;
wire  [`L1D_WAY_WIDTH-1:0]  lsu_cpu_inv_data_way ;
wire                    lsu_cpu_uhlf_sel;       // From qctl2 of lsu_qctl2.v
wire                    lsu_cpx_ld_dcache_perror_e;// From qctl2 of lsu_qctl2.v
wire                    lsu_cpx_ld_dtag_perror_e;// From qctl2 of lsu_qctl2.v
wire                    lsu_cpx_pkt_atm_st_cmplt;// From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_atomic;     // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_binit_st;   // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_ifill_type; // From qdp2 of lsu_qdp2.v
wire [`L1D_ADDRESS_HI-6:0]              lsu_cpx_pkt_inv_pa;     // From qdp2 of lsu_qdp2.v
wire [`L1D_WAY_MASK]              lsu_cpx_pkt_invwy;      // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_l2miss;     // From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_cpx_pkt_ld_err;     // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_perror_dinv;// From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_perror_iinv;// From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_cpx_pkt_perror_set; // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_prefetch;   // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_prefetch2;  // From qdp2 of lsu_qdp2.v
wire                    lsu_cpx_pkt_strm_ack;   // From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_cpx_pkt_tid;        // From qdp2 of lsu_qdp2.v
wire [3:0]              lsu_cpx_rmo_st_ack;     // From qctl2 of lsu_qctl2.v
wire                    lsu_cpx_spc_inv_vld;    // From qctl2 of lsu_qctl2.v
wire                    lsu_cpx_stack_dcfill_vld;// From qctl2 of lsu_qctl2.v
wire [3:0]              lsu_cpx_thrdid;         // From qctl2 of lsu_qctl2.v
wire [5:0]              lsu_cpxpkt_type_dcd_cx; // From qctl2 of lsu_qctl2.v
wire [3:0]              lsu_ctl_state_wr_en;    // From dctl of lsu_dctl.v
wire                    lsu_dc_iob_access_e;    // From dctl of lsu_dctl.v
wire                    lsu_dcache_data_perror_g;// From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI:3]             lsu_dcache_fill_addr_e; // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI:4]             lsu_dcache_fill_addr_e_err;// From dctl of lsu_dctl.v
wire [143:0]            lsu_dcache_fill_data_e; // From qdp2 of lsu_qdp2.v
wire [`L1D_WAY_COUNT-1:0]              lsu_dcache_fill_way_e;  // From dctl of lsu_dctl.v
wire                    lsu_dcache_iob_rd_w;    // From qctl2 of lsu_qctl2.v
wire [`L1D_WAY_MASK]              lsu_dcache_iob_way_e;   // From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_dcache_rand;        // From dctl of lsu_dctl.v
wire                    lsu_dcache_tag_perror_g;// From dctl of lsu_dctl.v
wire                    lsu_dcache_wr_vld_e;    // From dctl of lsu_dctl.v
wire                    lsu_dcfill_active_e;    // From qctl2 of lsu_qctl2.v
wire                    lsu_dcfill_data_mx_sel_e;// From dctl of lsu_dctl.v
wire [`L1D_WAY_COUNT-1:0]              lsu_dctag_mrgn;         // From dctldp of lsu_dctldp.v
wire [7:0]              lsu_dctl_asi_state_m;   // From dctldp of lsu_dctldp.v
wire                    lsu_dctldp_thread0_m;   // From dctl of lsu_dctl.v
wire                    lsu_dctldp_thread1_m;   // From dctl of lsu_dctl.v
wire                    lsu_dctldp_thread2_m;   // From dctl of lsu_dctl.v
wire                    lsu_dctldp_thread3_m;   // From dctl of lsu_dctl.v
wire                    lsu_defr_trp_taken_g;   // From excpctl of lsu_excpctl.v
wire                    lsu_dfill_data_sel_hi;  // From qctl2 of lsu_qctl2.v
wire [3:0]              lsu_dfill_dcd_thrd;     // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_byp_atm;        // From qdp2 of lsu_qdp2.v
wire                    lsu_dfq_byp_binit_st;   // From qdp2 of lsu_qdp2.v
wire                    lsu_dfq_byp_cpx_inv;    // From qdp2 of lsu_qdp2.v
wire                    lsu_dfq_byp_ff_en;      // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_byp_flush;      // From qdp2 of lsu_qdp2.v
wire                    lsu_dfq_byp_invwy_vld;  // From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_dfq_byp_stack_adr_b54;// From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_dfq_byp_stack_wrway;// From qdp2 of lsu_qdp2.v
wire [1:0]              lsu_dfq_byp_tid;        // From qdp2 of lsu_qdp2.v
wire [3:0]              lsu_dfq_byp_tid_d1_sel; // From qctl1 of lsu_qctl1.v
wire [5:0]              lsu_dfq_byp_type;       // From qdp2 of lsu_qdp2.v
wire [3:0]              lsu_dfq_flsh_cmplt;     // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_ld_vld;         // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_ldst_vld;       // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_rd_vld_d1;      // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_st_vld;         // From qctl2 of lsu_qctl2.v
wire                    lsu_dfq_vld;            // From qctl2 of lsu_qctl2.v
wire                    lsu_diag_va_prty_invrt; // From dctldp of lsu_dctldp.v
wire [3:0]              lsu_diagnstc_data_sel;  // From dctl of lsu_dctl.v
wire [7:0]              lsu_diagnstc_dc_prty_invrt_e;// From dctldp of lsu_dctldp.v
wire                    lsu_diagnstc_dtagv_prty_invrt_e;// From dctl of lsu_dctl.v
wire [3:0]              lsu_diagnstc_va_sel;    // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI:0]             lsu_diagnstc_wr_addr_e; // From dctldp of lsu_dctldp.v
wire                    lsu_diagnstc_wr_data_b0;// From qdp1 of lsu_qdp1.v
wire [63:0]             lsu_diagnstc_wr_data_e; // From qdp1 of lsu_qdp1.v
wire [`L1D_WAY_MASK]              lsu_diagnstc_wr_way_e;  // From dctldp of lsu_dctldp.v
wire [5:0]              lsu_dp_ctl_reg0;        // From dctldp of lsu_dctldp.v
wire [5:0]              lsu_dp_ctl_reg1;        // From dctldp of lsu_dctldp.v
wire [5:0]              lsu_dp_ctl_reg2;        // From dctldp of lsu_dctldp.v
wire [5:0]              lsu_dp_ctl_reg3;        // From dctldp of lsu_dctldp.v
wire                    lsu_dtag_index_sel_x_e; // From dctl of lsu_dctl.v
wire [3:0]              lsu_dtag_rsel_m;        // From dctl of lsu_dctl.v
wire                    lsu_dtag_wrreq_x_e;     // From dctl of lsu_dctl.v
wire                    lsu_dtagv_wr_vld_e;     // From dctl of lsu_dctl.v
wire                    lsu_dtlb_addr_mask_l_e; // From dctl of lsu_dctl.v
wire                    lsu_dtlb_bypass_e;      // From dctl of lsu_dctl.v
wire [2:0]              lsu_dtlb_cam_pid_e;     // From dctldp of lsu_dctldp.v
wire                    lsu_dtlb_data_rd_e;     // From dctl of lsu_dctl.v
wire                    lsu_dtlb_dmp_all_e;     // From dctl of lsu_dctl.v
wire                    lsu_dtlb_dmp_vld_e;     // From dctl of lsu_dctl.v
wire                    lsu_dtlb_invalid_all_l_m;// From dctl of lsu_dctl.v
wire [7:0]              lsu_dtlb_mrgn;          // From dctldp of lsu_dctldp.v
wire                    lsu_dtlb_rwindex_vld_e; // From dctl of lsu_dctl.v
wire                    lsu_dtlb_tag_rd_e;      // From dctl of lsu_dctl.v
wire                    lsu_dtlb_wr_vld_e;      // From dctl of lsu_dctl.v
wire                    lsu_dtlb_cam_real_e;
wire [1:0]              lsu_encd_way_hit;       // From dctl of lsu_dctl.v
wire [2:0]              lsu_err_addr_sel;       // From dctl of lsu_dctl.v
wire [28:0]             lsu_error_pa_m;         // From qdp1 of lsu_qdp1.v
wire [7:0]              lsu_excpctl_asi_state_m;// From dctldp of lsu_dctldp.v
wire                    lsu_fldd_vld_en;        // From qctl2 of lsu_qctl2.v
wire                    lsu_flsh_inst_m;        // From dctl of lsu_dctl.v
wire                    lsu_fwd_rply_sz1_unc;   // From qctl2 of lsu_qctl2.v
wire [4:0]              lsu_fwdpkt_dest;        // From qctl2 of lsu_qctl2.v
wire                    lsu_fwdpkt_pcx_rq_sel;  // From qctl1 of lsu_qctl1.v
wire                    lsu_fwdpkt_vld;         // From qctl2 of lsu_qctl2.v
wire                    lsu_ifu_asi_data_en_l;  // From dctl of lsu_dctl.v
wire                    lsu_imiss_pcx_rq_sel_d1;// From qctl1 of lsu_qctl1.v
wire [3:0]              lsu_intrpt_cmplt;       // From qctl1 of lsu_qctl1.v
wire                    lsu_iobrdge_fwd_pkt_vld;// From qctl2 of lsu_qctl2.v
wire [2:0]              lsu_iobrdge_rply_data_sel;// From qctl2 of lsu_qctl2.v
wire [8:0]              lsu_iobrdge_tap_rq_type;// From qdp2 of lsu_qdp2.v
wire [43:0]             lsu_iobrdge_wr_data;    // From qdp2 of lsu_qdp2.v
wire                    lsu_l2fill_bendian_m;   // From qdp1 of lsu_qdp1.v
wire [63:0]             lsu_l2fill_data;        // From qdp2 of lsu_qdp2.v
wire                    lsu_l2fill_fpld_e;      // From dctl of lsu_dctl.v
wire                    lsu_l2fill_sign_extend_m;// From qdp1 of lsu_qdp1.v
wire                    lsu_l2fill_vld;         // From qctl2 of lsu_qctl2.v
wire                    lsu_ld0_spec_vld_kill_w2;// From qctl1 of lsu_qctl1.v
wire                    lsu_ld1_spec_vld_kill_w2;// From qctl1 of lsu_qctl1.v
wire                    lsu_ld2_spec_vld_kill_w2;// From qctl1 of lsu_qctl1.v
wire                    lsu_ld3_spec_vld_kill_w2;// From qctl1 of lsu_qctl1.v
wire [3:0]              lsu_ld_inst_vld_g;      // From dctl of lsu_dctl.v
wire                    lsu_ld_miss_wb;         // From dctl of lsu_dctl.v
wire [3:0]              lsu_ld_pcx_rq_mxsel;    // From qctl1 of lsu_qctl1.v
wire [3:0]              lsu_ld_pcx_rq_sel_d2;   // From qctl1 of lsu_qctl1.v
wire [2:0]              lsu_ld_thrd_byp_sel_e;  // From dctl of lsu_dctl.v
wire                    lsu_ldquad_inst_m;      // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_ldst_inst_vld_e;    // From dctl of lsu_dctl.v
wire [7:0]              lsu_ldst_va_g;          // From dctldp of lsu_dctldp.v
wire [12:0]             lsu_ldst_va_m;          // From dctldp of lsu_dctldp.v
wire [47:0]             lsu_ldst_va_m_buf;      // From dctldp of lsu_dctldp.v
wire [1:0]              lsu_ldst_va_way_g;      // From qdp1 of lsu_qdp1.v
wire                    lsu_ldstub_g;           // From dctl of lsu_dctl.v
wire [3:0]              lsu_lmq_byp_misc_sel;   // From qctl1 of lsu_qctl1.v
wire                    lsu_local_diagnstc_tagrd_sel_g;// From dctl of lsu_dctl.v
wire                    lsu_local_early_flush_g;// From excpctl of lsu_excpctl.v
wire                    lsu_local_ldxa_sel_g;   // From dctl of lsu_dctl.v
wire                    lsu_local_ldxa_tlbrd_sel_g;// From dctl of lsu_dctl.v
wire                    lsu_memref_m;           // From dctl of lsu_dctl.v
wire [63:0]             lsu_misc_rdata_w2;      // From tagdp of lsu_tagdp.v
wire [3:0]              lsu_no_spc_pref;        // From dctl of lsu_dctl.v
wire                    lsu_nonalt_nucl_access_m;// From dctl of lsu_dctl.v
wire [3:0]              lsu_outstanding_rmo_st_max;// From dctl of lsu_dctl.v
wire [107:0]            lsu_pcx_fwd_pkt;        // From qdp2 of lsu_qdp2.v
wire                    lsu_pcx_fwd_reply;      // From qctl2 of lsu_qctl2.v
wire                    lsu_pcx_ld_dtag_perror_w2;// From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_req_squash0;    // From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_req_squash1;    // From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_req_squash2;    // From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_req_squash3;    // From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_req_squash_d1;  // From qctl1 of lsu_qctl1.v
wire                    lsu_pcx_rq_sz_b3;       // From qctl1 of lsu_qctl1.v
wire                    lsu_pref_pcx_req;       // From qdp1 of lsu_qdp1.v
wire                    lsu_qdp2_dfq_ld_vld;    // From qctl2 of lsu_qctl2.v
wire                    lsu_qdp2_dfq_st_vld;    // From qctl2 of lsu_qctl2.v
wire                    lsu_quad_asi_e;         // From dctl of lsu_dctl.v
wire                    lsu_quad_word_access_g; // From dctl of lsu_dctl.v
wire                    lsu_ramtest_rd_w;       // From qctl1 of lsu_qctl1.v
wire [`L1D_WAY_ARRAY_MASK]              lsu_rd_dtag_parity_g;   // From tagdp of lsu_tagdp.v
wire                    lsu_snap_blk_st_m;      // From dctl of lsu_dctl.v
wire                    lsu_squash_va_oor_m;    // From dctl of lsu_dctl.v
wire [3:0]              lsu_st_ack_dq_stb;      // From qctl2 of lsu_qctl2.v
wire [1:0]              lsu_st_dcfill_size_e;   // From qdp2 of lsu_qdp2.v
wire [3:0]              lsu_st_dtlb_perr_g;     // From excpctl of lsu_excpctl.v
wire                    lsu_st_hw_le_g;         // From dctl of lsu_dctl.v
wire [3:0]              lsu_st_pcx_rq_kill_w2;  // From stb_ctl0 of lsu_stb_ctl.v, ...
wire [3:0]              lsu_st_pcx_rq_pick;     // From qctl1 of lsu_qctl1.v
wire                    lsu_st_pcx_rq_vld;      // From qctl1 of lsu_qctl1.v
wire                    lsu_st_rmo_m;           // From dctl of lsu_dctl.v
wire [2:1]              lsu_st_rq_type_m;       // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_b_m;          // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_bhw_m;        // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_bhww_m;       // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_dw_m;         // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_hw_m;         // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_hww_m;        // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_w_m;          // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_sz_wdw_m;        // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_st_w_or_dbl_le_g;   // From dctl of lsu_dctl.v
wire [`L1D_WAY_MASK]              lsu_st_way_e;           // From qdp2 of lsu_qdp2.v
wire                    lsu_st_wr_dcache;       // From qctl2 of lsu_qctl2.v
wire                    lsu_st_x_le_g;          // From dctl of lsu_dctl.v
wire [3:0]              lsu_stb_data_early_sel_e;// From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_stb_data_final_sel_m;// From stb_rwctl of lsu_stb_rwctl.v
wire [3:0]              lsu_stb_empty;          // From stb_ctl0 of lsu_stb_ctl.v, ...
wire [3:0]              lsu_stb_empty_buf;      // From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_stb_pcx_rvld_d1;    // From qctl1 of lsu_qctl1.v
wire [1:0]              lsu_stb_rd_tid;         // From qctl1 of lsu_qctl1.v
wire [3:0]              lsu_stb_rmo_st_issue;   // From stb_ctl0 of lsu_stb_ctl.v, ...
wire [9:3]              lsu_stb_va_m;           // From stb_rwctl of lsu_stb_rwctl.v
wire [3:0]              lsu_stbcnt0;            // From stb_ctl0 of lsu_stb_ctl.v
wire [3:0]              lsu_stbcnt1;            // From stb_ctl1 of lsu_stb_ctl.v
wire [3:0]              lsu_stbcnt2;            // From stb_ctl2 of lsu_stb_ctl.v
wire [3:0]              lsu_stbcnt3;            // From stb_ctl3 of lsu_stb_ctl.v
wire                    lsu_stbctl_flush_pipe_w;// From stb_rwctl of lsu_stb_rwctl.v
wire                    lsu_swap_g;             // From dctl of lsu_dctl.v
wire                    lsu_swap_sel_default_byte_7_2_g;// From dctl of lsu_dctl.v
wire                    lsu_swap_sel_default_g; // From dctl of lsu_dctl.v
wire [3:0]              lsu_thread_g;           // From dctl of lsu_dctl.v
wire                    lsu_tlb_asi_data_perr_g;// From dctl of lsu_dctl.v
wire                    lsu_tlb_asi_tag_perr_g; // From dctl of lsu_dctl.v
wire                    lsu_tlb_data_rd_vld_g;  // From dctl of lsu_dctl.v
wire                    lsu_tlb_perr_ld_rq_kill_w;// From excpctl of lsu_excpctl.v
wire [63:0]             lsu_tlb_rd_data;        // From tlbdp of lsu_tlbdp.v
wire [3:0]              lsu_tlb_st_sel_m;       // From dctl of lsu_dctl.v
wire                    lsu_tlbop_force_swo;    // From dctl of lsu_dctl.v
wire [2:0]              lsu_tlu_ctxt_sel_m;     // From dctl of lsu_dctl.v
wire                    lsu_tlu_nonalt_ldst_m;  // From dctl of lsu_dctl.v
wire                    lsu_tlu_write_op_m;     // From dctl of lsu_dctl.v
wire                    lsu_tlu_xslating_ldst_m;// From dctl of lsu_dctl.v
wire                    lsu_ttype_vld_m2;       // From excpctl of lsu_excpctl.v
wire                    lsu_ttype_vld_m2_bf1;   // From excpctl of lsu_excpctl.v
wire                    lsu_va_match_b31_b3_m;  // From qdp1 of lsu_qdp1.v
wire                    lsu_va_match_b47_b32_m; // From qdp1 of lsu_qdp1.v
wire                    lsu_va_wtchpt0_wr_en_l; // From dctl of lsu_dctl.v
wire                    lsu_va_wtchpt1_wr_en_l; // From dctl of lsu_dctl.v
wire                    lsu_va_wtchpt2_wr_en_l; // From dctl of lsu_dctl.v
wire                    lsu_va_wtchpt3_wr_en_l; // From dctl of lsu_dctl.v
wire [47:3]             lsu_va_wtchpt_addr;     // From qdp1 of lsu_qdp1.v
wire                    lsu_va_wtchpt_sel_g;    // From dctl of lsu_dctl.v
wire                    lsu_way_hit_or;         // From dctl of lsu_dctl.v
wire [3:0]              lsuctl_ctlbits_wr_en;   // From dctl of lsu_dctl.v
wire                    merge0_sel_byte0_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte1_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte2_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte3_default_m;// From dctl of lsu_dctl.v
wire                    merge0_sel_byte4_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte5_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte6_m;     // From dctl of lsu_dctl.v
wire                    merge0_sel_byte7_default_m;// From dctl of lsu_dctl.v
wire                    merge0_sel_byte_1h_m;   // From dctl of lsu_dctl.v
wire                    merge1_sel_byte0_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte1_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte2_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte3_default_m;// From dctl of lsu_dctl.v
wire                    merge1_sel_byte4_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte5_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte6_m;     // From dctl of lsu_dctl.v
wire                    merge1_sel_byte7_default_m;// From dctl of lsu_dctl.v
wire                    merge1_sel_byte_1h_m;   // From dctl of lsu_dctl.v
wire                    merge1_sel_byte_2h_m;   // From dctl of lsu_dctl.v
wire                    merge2_sel_byte1_m;     // From dctl of lsu_dctl.v
wire                    merge2_sel_byte2_m;     // From dctl of lsu_dctl.v
wire                    merge2_sel_byte5_m;     // From dctl of lsu_dctl.v
wire                    merge2_sel_byte6_default_m;// From dctl of lsu_dctl.v
wire                    merge2_sel_byte_m;      // From dctl of lsu_dctl.v
wire                    merge3_sel_byte0_m;     // From dctl of lsu_dctl.v
wire                    merge3_sel_byte3_m;     // From dctl of lsu_dctl.v
wire                    merge3_sel_byte4_m;     // From dctl of lsu_dctl.v
wire                    merge3_sel_byte7_default_m;// From dctl of lsu_dctl.v
wire                    merge3_sel_byte_m;      // From dctl of lsu_dctl.v
wire                    merge4_sel_byte3_m;     // From dctl of lsu_dctl.v
wire                    merge4_sel_byte4_m;     // From dctl of lsu_dctl.v
wire                    merge5_sel_byte2_m;     // From dctl of lsu_dctl.v
wire                    merge5_sel_byte5_m;     // From dctl of lsu_dctl.v
wire                    merge6_sel_byte1_m;     // From dctl of lsu_dctl.v
wire                    merge6_sel_byte6_m;     // From dctl of lsu_dctl.v
wire                    merge7_sel_byte0_m;     // From dctl of lsu_dctl.v
wire                    merge7_sel_byte7_m;     // From dctl of lsu_dctl.v
wire [3:0]              misc_ctl_sel_din;       // From dctl of lsu_dctl.v
wire                    mmu_rd_only_asi_m;      // From dctl of lsu_dctl.v
wire [7:0]              morphed_addr_m;         // From dctl of lsu_dctl.v
wire                    mrgn_tap_wr_en;         // From dctl of lsu_dctl.v
wire                    mrgnctl_wr_en;          // From dctl of lsu_dctl.v
wire                    nofault_asi_m;          // From dctl of lsu_dctl.v
wire [3:0]              pctxt_state_wr_thrd;    // From dctl of lsu_dctl.v
wire [3:0]              pcx_pkt_src_sel;        // From qctl1 of lsu_qctl1.v
wire [3:0]              pcx_rq_for_stb;         // From qctl1 of lsu_qctl1.v
wire [3:0]              pcx_rq_for_stb_d1;      // From qctl1 of lsu_qctl1.v
wire                    phy_byp_ec_asi_m;       // From dctl of lsu_dctl.v
wire                    phy_use_ec_asi_m;       // From dctl of lsu_dctl.v
wire [3:0]              pid_state_wr_en;        // From dctl of lsu_dctl.v
wire                    quad_asi_m;             // From dctl of lsu_dctl.v
wire                    rd_only_asi_m;          // From dctl of lsu_dctl.v
wire                    rd_only_ltlb_asi_e;     // From dctl of lsu_dctl.v
wire                    recognized_asi_m;       // From dctl of lsu_dctl.v
wire [3:0]              sctxt_state_wr_thrd;    // From dctl of lsu_dctl.v
wire                    signed_ldst_byte_m;     // From dctl of lsu_dctl.v
wire                    signed_ldst_hw_m;       // From dctl of lsu_dctl.v
wire                    signed_ldst_w_m;        // From dctl of lsu_dctl.v
wire [`L1D_ADDRESS_HI:0]             st_dcfill_addr;         // From qdp2 of lsu_qdp2.v
wire [63:0]             st_rs3_data_g;          // From qdp1 of lsu_qdp1.v
wire                    sta_internal_m;         // From dctl of lsu_dctl.v
wire [2:1]              stb0_atm_rq_type;       // From stb_ctl0 of lsu_stb_ctl.v
wire [7:0]              stb0_clk_en_l;          // From stb_ctl0 of lsu_stb_ctl.v
wire [2:0]              stb0_crnt_ack_id;       // From stb_ctl0 of lsu_stb_ctl.v
wire [2:0]              stb0_l2b_addr;          // From stb_ctl0 of lsu_stb_ctl.v
wire [7:0]              stb0_state_rmo;         // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_0;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_1;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_2;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_3;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_4;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_5;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_6;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb0_state_rtype_7;     // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_0;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_1;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_2;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_3;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_4;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_5;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_6;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [3:2]              stb0_state_si_7;        // From stb_ctldp0 of lsu_stb_ctldp.v
wire [2:1]              stb1_atm_rq_type;       // From stb_ctl1 of lsu_stb_ctl.v
wire [7:0]              stb1_clk_en_l;          // From stb_ctl1 of lsu_stb_ctl.v
wire [2:0]              stb1_crnt_ack_id;       // From stb_ctl1 of lsu_stb_ctl.v
wire [2:0]              stb1_l2b_addr;          // From stb_ctl1 of lsu_stb_ctl.v
wire [7:0]              stb1_state_rmo;         // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_0;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_1;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_2;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_3;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_4;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_5;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_6;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb1_state_rtype_7;     // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_0;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_1;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_2;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_3;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_4;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_5;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_6;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [3:2]              stb1_state_si_7;        // From stb_ctldp1 of lsu_stb_ctldp.v
wire [2:1]              stb2_atm_rq_type;       // From stb_ctl2 of lsu_stb_ctl.v
wire [7:0]              stb2_clk_en_l;          // From stb_ctl2 of lsu_stb_ctl.v
wire [2:0]              stb2_crnt_ack_id;       // From stb_ctl2 of lsu_stb_ctl.v
wire [2:0]              stb2_l2b_addr;          // From stb_ctl2 of lsu_stb_ctl.v
wire [7:0]              stb2_state_rmo;         // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_0;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_1;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_2;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_3;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_4;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_5;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_6;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb2_state_rtype_7;     // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_0;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_1;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_2;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_3;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_4;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_5;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_6;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [3:2]              stb2_state_si_7;        // From stb_ctldp2 of lsu_stb_ctldp.v
wire [2:1]              stb3_atm_rq_type;       // From stb_ctl3 of lsu_stb_ctl.v
wire [7:0]              stb3_clk_en_l;          // From stb_ctl3 of lsu_stb_ctl.v
wire [2:0]              stb3_crnt_ack_id;       // From stb_ctl3 of lsu_stb_ctl.v
wire [2:0]              stb3_l2b_addr;          // From stb_ctl3 of lsu_stb_ctl.v
wire [7:0]              stb3_state_rmo;         // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_0;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_1;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_2;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_3;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_4;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_5;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_6;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [2:1]              stb3_state_rtype_7;     // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_0;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_1;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_2;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_3;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_4;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_5;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_6;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [3:2]              stb3_state_si_7;        // From stb_ctldp3 of lsu_stb_ctldp.v
wire [1:0]              stb_cam_cm_tid;         // From stb_rwctl of lsu_stb_rwctl.v
wire                    stb_cam_hit;            // From stb_cam of bw_r_scm.v
wire                    stb_cam_hit_bf;         // From excpctl of lsu_excpctl.v
wire                    stb_cam_hit_bf1;        // From excpctl of lsu_excpctl.v
wire [2:0]              stb_cam_hit_ptr;        // From stb_cam of bw_r_scm.v
wire                    stb_cam_mhit;           // From stb_cam of bw_r_scm.v
wire                    stb_cam_rptr_vld;       // From stb_rwctl of lsu_stb_rwctl.v
wire [4:0]              stb_cam_rw_ptr;         // From stb_rwctl of lsu_stb_rwctl.v
wire [7:0]              stb_cam_sqsh_msk;       // From excpctl of lsu_excpctl.v
wire                    stb_cam_vld;            // From tlbdp of lsu_tlbdp.v
wire                    stb_cam_wptr_vld;       // From stb_rwctl of lsu_stb_rwctl.v
wire                    stb_cam_wr_no_ivld_m;   // From stb_rwctl of lsu_stb_rwctl.v
wire [3:0]              stb_cam_wvld_m;         // From stb_rwctl of lsu_stb_rwctl.v
wire [4:0]              stb_data_rd_ptr;        // From stb_rwctl of lsu_stb_rwctl.v
wire                    stb_data_rptr_vld;      // From stb_rwctl of lsu_stb_rwctl.v
wire                    stb_data_wptr_vld;      // From stb_rwctl of lsu_stb_rwctl.v
wire [4:0]              stb_data_wr_ptr;        // From stb_rwctl of lsu_stb_rwctl.v
wire [3:0]              stb_flush_st_g;         // From stb_rwctl of lsu_stb_rwctl.v
wire [7:0]              stb_ld_full_raw;        // From stb_cam of bw_r_scm.v
wire [7:0]              stb_ld_partial_raw;     // From stb_cam of bw_r_scm.v
wire [7:0]              stb_ldst_byte_msk;      // From stb_rwctl of lsu_stb_rwctl.v
wire [2:0]              stb_pcx_rptr0;          // From stb_ctl0 of lsu_stb_ctl.v
wire [2:0]              stb_pcx_rptr1;          // From stb_ctl1 of lsu_stb_ctl.v
wire [2:0]              stb_pcx_rptr2;          // From stb_ctl2 of lsu_stb_ctl.v
wire [2:0]              stb_pcx_rptr3;          // From stb_ctl3 of lsu_stb_ctl.v
wire [3:0]              stb_rd_for_pcx;         // From stb_ctl0 of lsu_stb_ctl.v, ...
wire [44:0]             stb_rdata_ramc;         // From stb_cam of bw_r_scm.v
wire [14:9]             stb_rdata_ramc_buf;     // From dcdp of lsu_dcdp.v
wire                    stb_rdata_ramd_b74_buf; // From stb_rwdp of lsu_stb_rwdp.v
wire [69:0]             stb_rdata_ramd_buf;     // From stb_rwdp of lsu_stb_rwdp.v
wire [7:0]              stb_state_ced0;         // From stb_ctl0 of lsu_stb_ctl.v
wire [7:0]              stb_state_ced1;         // From stb_ctl1 of lsu_stb_ctl.v
wire [7:0]              stb_state_ced2;         // From stb_ctl2 of lsu_stb_ctl.v
wire [7:0]              stb_state_ced3;         // From stb_ctl3 of lsu_stb_ctl.v
wire [7:0]              stb_state_vld0;         // From stb_ctl0 of lsu_stb_ctl.v
wire [7:0]              stb_state_vld1;         // From stb_ctl1 of lsu_stb_ctl.v
wire [7:0]              stb_state_vld2;         // From stb_ctl2 of lsu_stb_ctl.v
wire [7:0]              stb_state_vld3;         // From stb_ctl3 of lsu_stb_ctl.v
wire [3:0]              stb_thrd_en_g;          // From stb_rwctl of lsu_stb_rwctl.v
wire [2:0]              stb_wrptr0;             // From stb_ctl0 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr0_prev;        // From stb_ctl0 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr1;             // From stb_ctl1 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr1_prev;        // From stb_ctl1 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr2;             // From stb_ctl2 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr2_prev;        // From stb_ctl2 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr3;             // From stb_ctl3 of lsu_stb_ctl.v
wire [2:0]              stb_wrptr3_prev;        // From stb_ctl3 of lsu_stb_ctl.v
wire                    strm_asi_m;             // From dctl of lsu_dctl.v
wire                    tag_rd_vld_g;           // From dctl of lsu_dctl.v
wire                    thread0_ctxt;           // From dctl of lsu_dctl.v
wire                    thread0_d;              // From dctl of lsu_dctl.v
wire                    thread0_e;              // From dctl of lsu_dctl.v
wire                    thread0_g;              // From dctl of lsu_dctl.v
wire                    thread0_m;              // From dctl of lsu_dctl.v
wire                    thread1_ctxt;           // From dctl of lsu_dctl.v
wire                    thread1_d;              // From dctl of lsu_dctl.v
wire                    thread1_e;              // From dctl of lsu_dctl.v
wire                    thread1_g;              // From dctl of lsu_dctl.v
wire                    thread1_m;              // From dctl of lsu_dctl.v
wire                    thread2_ctxt;           // From dctl of lsu_dctl.v
wire                    thread2_d;              // From dctl of lsu_dctl.v
wire                    thread2_e;              // From dctl of lsu_dctl.v
wire                    thread2_g;              // From dctl of lsu_dctl.v
wire                    thread2_m;              // From dctl of lsu_dctl.v
wire                    thread3_ctxt;           // From dctl of lsu_dctl.v
wire                    thread3_d;              // From dctl of lsu_dctl.v
wire                    thread3_e;              // From dctl of lsu_dctl.v
wire                    thread3_g;              // From dctl of lsu_dctl.v
wire                    thread3_m;              // From dctl of lsu_dctl.v
wire                    thread_actxt;           // From dctl of lsu_dctl.v
wire                    thread_default;         // From dctl of lsu_dctl.v
wire                    thread_pctxt;           // From dctl of lsu_dctl.v
wire                    thread_sctxt;           // From dctl of lsu_dctl.v
wire                    tlb_access_en0_g;       // From dctl of lsu_dctl.v
wire                    tlb_access_en1_g;       // From dctl of lsu_dctl.v
wire                    tlb_access_en2_g;       // From dctl of lsu_dctl.v
wire                    tlb_access_en3_g;       // From dctl of lsu_dctl.v
wire                    tlb_access_sel_default; // From dctl of lsu_dctl.v
wire                    tlb_access_sel_thrd0;   // From dctl of lsu_dctl.v
wire                    tlb_access_sel_thrd1;   // From dctl of lsu_dctl.v
wire                    tlb_access_sel_thrd2;   // From dctl of lsu_dctl.v
wire                    tlb_cam_hit;            // From dtlb of bw_r_tlb.v
wire                    tlb_cam_hit_g;          // From dctl of lsu_dctl.v
wire [12:0]             tlb_ctxt;               // From dctldp of lsu_dctldp.v
wire                    tlb_ldst_cam_vld;       // From dctl of lsu_dctl.v
wire [39:10]            tlb_pgnum;              // From dtlb of bw_r_tlb.v
wire [39:10]            tlb_pgnum_buf;          // From tlbdp of lsu_tlbdp.v
wire [39:37]            tlb_pgnum_buf2;         // From tlbdp of lsu_tlbdp.v
wire [39:10]            tlb_pgnum_crit;         // From dtlb of bw_r_tlb.v
wire [42:0]             tlb_rd_tte_data;        // From dtlb of bw_r_tlb.v
wire                    tlb_rd_tte_data_ie_buf; // From tlbdp of lsu_tlbdp.v
wire [58:0]             tlb_rd_tte_tag;         // From dtlb of bw_r_tlb.v
wire                    tlu_lsu_asi_update_g;   // From dctl of lsu_dctl.v
wire                    tte_data_parity_error;  // From tlbdp of lsu_tlbdp.v
wire                    tte_data_perror_unc;    // From excpctl of lsu_excpctl.v
wire                    tte_tag_parity_error;   // From tlbdp of lsu_tlbdp.v
wire                    unimp_asi_m;            // From dctl of lsu_dctl.v
wire                    va_wtchpt_cmp_en_m;     // From dctl of lsu_dctl.v
wire                    va_wtchpt_msk_match_m;  // From dctldp of lsu_dctldp.v
wire                    wr_only_asi_m;          // From dctl of lsu_dctl.v
wire                    wr_only_ltlb_asi_e;     // From dctl of lsu_dctl.v
// End of automatics

wire stb_ncache_pcx_rq_g;

`ifndef NO_RTL_CSM
wire [`TLB_CSM]         tlb_rd_tte_csm;
wire [`TLB_CSM]         tlb_rd_tte_csm_crit;
wire [`TLB_CSM]         lsu_blkst_csm_m;
wire [`TLB_CSM]         stb_rcsm_ramc;
wire [`TLB_CSM]         stb_cam_csm;
wire [`TLB_CSM]         stb_alt_wr_csm;
wire                    lsu_tlb_csm_rd_vld_g;
wire                    csm_rd_vld_g;
wire                    lsu_dtlb_csm_rd_e;
`endif


//split bus. emacs cannot handle
input [`CPX_WIDTH-1:0]  cpx_spc_data_cx;   // cpx to processor pkt
input [`PCX_WIDTH-1:0]  spu_lsu_ldst_pckt;
input [47:0]            exu_lsu_ldst_va_e;  // VA for mem-ref (src-execute)
input [`L1D_ADDRESS_HI:3]            exu_lsu_early_va_e;  // early partial VA for lookup
input	[80:0]		ffu_lsu_data ;


output [7:0]            lsu_asi_state;
output [47:4]           lsu_ifu_err_addr;
output [15:0]		lsu_sscan_data ;	// fragmented across dbbs
output                  ifu_tlu_inst_vld_m_bf1;
output [2:0]		lsu_ffu_bld_cnt_w ;

wire [47:0]  lsu_local_ldxa_data_g;
wire [43:0]  lsu_iobrdge_rd_data;
wire [79:0]  stb_rdata_ramd;
wire [75:64]  stb_wdata_ramd_b75_b64;
wire [63:0]   lsu_stb_st_data_g;

wire [151:0] dfq_rdata;
wire [151:0] dfq_wdata;
wire         lsu_cpx_stack_icfill_vld;
wire [`L1D_TAG_PARITY_WIDTH-1:0]  dtag_wdata_m;
wire [`L1D_TAG_PARITY_WIDTH-1:0]  dtag_wdata_e;
   wire      lsu_cpx_stack_dcfill_vld_b130;
   wire [7:0] stb_ldst_byte_msk_min;

// scan chain
input                   si0,si1,short_si1,short_si0;
output                  so0, so1,short_so0,short_so1;
   wire     short_scan1_1;
   wire     short_scan1_2;
   wire     short_scan1_3;
   wire     short_scan1_4;
   wire     short_scan1_5;
   wire     short_scan1_6;
   wire     short_scan1_7;
   wire     short_scan1_8;

   wire     short_scan0_1;
   wire     short_scan0_2;
   wire     short_scan0_3;
   wire     short_scan0_4;
   wire     short_scan0_5;
   wire     short_scan0_6;
   wire     short_scan0_7;
   wire     short_scan0_8;
   wire     short_scan0_9;

   wire     scan1_1;
   wire     scan1_2;
   wire     scan1_3;
   wire     scan1_4;

   wire     scan0_1;
   wire     scan0_2;

/*defined input*/

input [7:0]            exu_tlu_wsr_data_m;

/*defined output*/

output                  lsu_tlu_nucleus_ctxt_m ;// access is nucleus context //??no driver
output  [2:0]           lsu_tlu_tte_pg_sz_g ;   // page-size of tte //??no driver


// dsfsr support moved from tlu_tcl to lsu_excpctl ; becomes wire
// !! first check if needed by iside in tlu_tcl, or mmu_ctl !!!
//output			lsu_tlu_nonalt_ldst_m;	// From dctl of lsu_dctl.v
output			lsu_tlu_squash_va_oor_m;// From dctl of lsu_dctl.v
output			lsu_tlu_wtchpt_trp_g;	// From excpctl of lsu_excpctl.v
//output			lsu_tlu_priv_violtn_g;	// From excpctl of lsu_excpctl.v
output			lsu_tlu_daccess_prot_g;	// From excpctl of lsu_excpctl.v
output			lsu_tlu_priv_action_g;	// From excpctl of lsu_excpctl.v
// To accommodate 1Thread design
wire [3:0] 		lsu_tlu_stb_full_w2_t;  // To accommodate 1T design
   wire [7:0]		lsu_asi_reg0_t;
   wire [7:0]		lsu_asi_reg1_t;
   wire [7:0]		lsu_asi_reg2_t;
   wire [7:0]		lsu_asi_reg3_t;
   wire [12:0] 		lsu_t0_pctxt_state_t;
   wire [12:0] 		lsu_t1_pctxt_state_t;
   wire [12:0] 		lsu_t2_pctxt_state_t;
   wire [12:0] 		lsu_t3_pctxt_state_t;
   wire [2:0] 		lsu_pid_state0_t;
   wire [2:0] 		lsu_pid_state1_t;
   wire [2:0] 		lsu_pid_state2_t;
   wire [2:0] 		lsu_pid_state3_t;

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign       lsu_tlu_stb_full_w2[3:0] = {2'b00, lsu_tlu_stb_full_w2_t[1:0]};
   assign       lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign       lsu_asi_reg1[7:0] = lsu_asi_reg1_t[7:0];
   assign       lsu_asi_reg2[7:0] = 7'b0000000;
   assign       lsu_asi_reg3[7:0] = 7'b0000000;
   assign       lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign       lsu_t1_pctxt_state[12:0] = lsu_t1_pctxt_state_t[12:0];
   assign       lsu_t2_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_t3_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign       lsu_pid_state1[2:0] = lsu_pid_state1_t[2:0];
   assign       lsu_pid_state2[2:0] = 2'b00;
   assign       lsu_pid_state3[2:0] = 2'b00;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign 		lsu_tlu_stb_full_w2[3:0] = {3'b000, lsu_tlu_stb_full_w2_t[0]};
   assign 		lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign 		lsu_asi_reg1[7:0] = 7'b0000000;
   assign 		lsu_asi_reg2[7:0] = 7'b0000000;
   assign 		lsu_asi_reg3[7:0] = 7'b0000000;
   assign 		lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign 		lsu_t1_pctxt_state[12:0] = 13'b0000000000000;
   assign 		lsu_t2_pctxt_state[12:0] = 13'b0000000000000;
   assign 		lsu_t3_pctxt_state[12:0] = 13'b0000000000000;
   assign 		lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign 		lsu_pid_state1[2:0] = 2'b00;
   assign 		lsu_pid_state2[2:0] = 2'b00;
   assign 		lsu_pid_state3[2:0] = 2'b00;

`elsif THREADS_1

   assign       lsu_tlu_stb_full_w2[3:0] = {3'b000, lsu_tlu_stb_full_w2_t[0]};
   assign       lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign       lsu_asi_reg1[7:0] = 7'b0000000;
   assign       lsu_asi_reg2[7:0] = 7'b0000000;
   assign       lsu_asi_reg3[7:0] = 7'b0000000;
   assign       lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign       lsu_t1_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_t2_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_t3_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign       lsu_pid_state1[2:0] = 2'b00;
   assign       lsu_pid_state2[2:0] = 2'b00;
   assign       lsu_pid_state3[2:0] = 2'b00;

`elsif THREADS_2

   assign       lsu_tlu_stb_full_w2[3:0] = {2'b00, lsu_tlu_stb_full_w2_t[1:0]};
   assign       lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign       lsu_asi_reg1[7:0] = lsu_asi_reg1_t[7:0];
   assign       lsu_asi_reg2[7:0] = 7'b0000000;
   assign       lsu_asi_reg3[7:0] = 7'b0000000;
   assign       lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign       lsu_t1_pctxt_state[12:0] = lsu_t1_pctxt_state_t[12:0];
   assign       lsu_t2_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_t3_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign       lsu_pid_state1[2:0] = lsu_pid_state1_t[2:0];
   assign       lsu_pid_state2[2:0] = 2'b00;
   assign       lsu_pid_state3[2:0] = 2'b00;

`elsif THREADS_3

   assign       lsu_tlu_stb_full_w2[3:0] = {1'b0, lsu_tlu_stb_full_w2_t[2:0]};
   assign       lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign       lsu_asi_reg1[7:0] = lsu_asi_reg1_t[7:0];
   assign       lsu_asi_reg2[7:0] = lsu_asi_reg2_t[7:0];
   assign       lsu_asi_reg3[7:0] = 7'b0000000;
   assign       lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign       lsu_t1_pctxt_state[12:0] = lsu_t1_pctxt_state_t[12:0];
   assign       lsu_t2_pctxt_state[12:0] = lsu_t2_pctxt_state_t[12:0];
   assign       lsu_t3_pctxt_state[12:0] = 13'b0000000000000;
   assign       lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign       lsu_pid_state1[2:0] = lsu_pid_state1_t[2:0];
   assign       lsu_pid_state2[2:0] = lsu_pid_state2_t[2:0];
   assign       lsu_pid_state3[2:0] = 2'b00;

`else
   assign 		lsu_tlu_stb_full_w2[3:0] = lsu_tlu_stb_full_w2_t[3:0];
   assign 		lsu_asi_reg0[7:0] = lsu_asi_reg0_t[7:0];
   assign 		lsu_asi_reg1[7:0] = lsu_asi_reg1_t[7:0];
   assign 		lsu_asi_reg2[7:0] = lsu_asi_reg2_t[7:0];
   assign 		lsu_asi_reg3[7:0] = lsu_asi_reg3_t[7:0];
   assign 		lsu_t0_pctxt_state[12:0] = lsu_t0_pctxt_state_t[12:0];
   assign 		lsu_t1_pctxt_state[12:0] = lsu_t1_pctxt_state_t[12:0];
   assign 		lsu_t2_pctxt_state[12:0] = lsu_t2_pctxt_state_t[12:0];
   assign 		lsu_t3_pctxt_state[12:0] = lsu_t3_pctxt_state_t[12:0];
   assign 		lsu_pid_state0[2:0] = lsu_pid_state0_t[2:0];
   assign 		lsu_pid_state1[2:0] = lsu_pid_state1_t[2:0];
   assign 		lsu_pid_state2[2:0] = lsu_pid_state2_t[2:0];
   assign 		lsu_pid_state3[2:0] = lsu_pid_state3_t[2:0];

`endif

`endif // `ifndef CONFIG_NUM_THREADS

/* lsu_qctl1 AUTO_TEMPLATE (
                .grst_l                 (gdbginit_l),
                .rst_tri_en             (mux_drive_disable),
                .lsu_ttype_vld_m2       (lsu_ttype_vld_m2_bf1),
                .lsu_ldst_va_m          (lsu_ldst_va_m_buf[7:6]),
                .ifu_lsu_pcxpkt_e_b50   (ifu_lsu_pcxpkt_e[50]),
                .rclk                   (clk),
                .lsu_sscan_data		(lsu_sscan_data[12:0]),
                .ld_inst_vld_e          (ifu_lsu_ld_inst_e),
                .lsu_ld_miss_g          (lsu_ld_miss_wb),
                .spu_lsu_ldst_pckt_vld  (spu_lsu_ldst_pckt[`PCX_VLD]),
                .lsu_stb_empty        	(lsu_stb_empty_buf[3:0]),
                .tlb_pgnum_g            (tlb_pgnum_buf[39:37]),
                .tlu_lsu_pcxpkt_l2baddr (tlu_lsu_pcxpkt[11:10]),
                .tlu_lsu_pcxpkt_tid     (tlu_lsu_pcxpkt[19:18]),
                .tlu_lsu_pcxpkt_vld     (tlu_lsu_pcxpkt[25]),
                .ld_thrd_byp_sel_e      (lsu_ld_thrd_byp_sel_e[2:0]));
*/

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq2_pcx_pkt_way     (),
                  .lmq3_pcx_pkt_way     (),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                  .lsu_ld2_spec_vld_kill_w2(),
                  .lsu_ld3_spec_vld_kill_w2(),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (stb1_l2b_addr[2:0]),
                  .stb2_l2b_addr        (3'b000),
                  .stb3_l2b_addr        (3'b000),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (stb1_crnt_ack_id[2:0]),
                  .stb2_crnt_ack_id     (3'b000),
                  .stb3_crnt_ack_id     (3'b000),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (stb1_atm_rq_type[2:1]),
                  .stb2_atm_rq_type     (2'b00),
                  .stb3_atm_rq_type     (2'b00),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       ({2'b00, stb_rd_for_pcx[1:0]}),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (ld_sec_hit_thrd1),
                  .ld_sec_hit_thrd2     (1'b0),
                  .ld_sec_hit_thrd3     (1'b0),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2({2'b00, lsu_st_pcx_rq_kill_w2[1:0]}),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (),
                  .lmq2_pcx_pkt_way     (),
                  .lmq3_pcx_pkt_way     (),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(),
                  .lsu_ld2_spec_vld_kill_w2(),
                  .lsu_ld3_spec_vld_kill_w2(),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (3'b000),
                  .stb2_l2b_addr        (3'b000),
                  .stb3_l2b_addr        (3'b000),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (3'b000),
                  .stb2_crnt_ack_id     (3'b000),
                  .stb3_crnt_ack_id     (3'b000),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (2'b00),
                  .stb2_atm_rq_type     (2'b00),
                  .stb3_atm_rq_type     (2'b00),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       ({3'b000, stb_rd_for_pcx[0]}),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (1'b0),
                  .ld_sec_hit_thrd2     (1'b0),
                  .ld_sec_hit_thrd3     (1'b0),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2({3'b000, lsu_st_pcx_rq_kill_w2[0]}),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated

`elsif THREADS_1

   lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (),
                  .lmq2_pcx_pkt_way     (),
                  .lmq3_pcx_pkt_way     (),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(),
                  .lsu_ld2_spec_vld_kill_w2(),
                  .lsu_ld3_spec_vld_kill_w2(),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (3'b000),
                  .stb2_l2b_addr        (3'b000),
                  .stb3_l2b_addr        (3'b000),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (3'b000),
                  .stb2_crnt_ack_id     (3'b000),
                  .stb3_crnt_ack_id     (3'b000),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (2'b00),
                  .stb2_atm_rq_type     (2'b00),
                  .stb3_atm_rq_type     (2'b00),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       ({3'b000, stb_rd_for_pcx[0]}),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (1'b0),
                  .ld_sec_hit_thrd2     (1'b0),
                  .ld_sec_hit_thrd3     (1'b0),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2({3'b000, lsu_st_pcx_rq_kill_w2[0]}),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated

`elsif THREADS_2

   lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq2_pcx_pkt_way     (),
                  .lmq3_pcx_pkt_way     (),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                  .lsu_ld2_spec_vld_kill_w2(),
                  .lsu_ld3_spec_vld_kill_w2(),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (stb1_l2b_addr[2:0]),
                  .stb2_l2b_addr        (3'b000),
                  .stb3_l2b_addr        (3'b000),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (stb1_crnt_ack_id[2:0]),
                  .stb2_crnt_ack_id     (3'b000),
                  .stb3_crnt_ack_id     (3'b000),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (stb1_atm_rq_type[2:1]),
                  .stb2_atm_rq_type     (2'b00),
                  .stb3_atm_rq_type     (2'b00),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       ({2'b00, stb_rd_for_pcx[1:0]}),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (ld_sec_hit_thrd1),
                  .ld_sec_hit_thrd2     (1'b0),
                  .ld_sec_hit_thrd3     (1'b0),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2({2'b00, lsu_st_pcx_rq_kill_w2[1:0]}),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated

`elsif THREADS_3

   lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq2_pcx_pkt_way     (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq3_pcx_pkt_way     (),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                  .lsu_ld2_spec_vld_kill_w2(lsu_ld2_spec_vld_kill_w2),
                  .lsu_ld3_spec_vld_kill_w2(),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (stb1_l2b_addr[2:0]),
                  .stb2_l2b_addr        (stb2_l2b_addr[2:0]),
                  .stb3_l2b_addr        (3'b000),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (stb1_crnt_ack_id[2:0]),
                  .stb2_crnt_ack_id     (stb2_crnt_ack_id[2:0]),
                  .stb3_crnt_ack_id     (3'b000),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (stb1_atm_rq_type[2:1]),
                  .stb2_atm_rq_type     (stb2_atm_rq_type[2:1]),
                  .stb3_atm_rq_type     (2'b00),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       ({1'b0, stb_rd_for_pcx[2:0]}),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (ld_sec_hit_thrd1),
                  .ld_sec_hit_thrd2     (ld_sec_hit_thrd2),
                  .ld_sec_hit_thrd3     (1'b0),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2({1'b0, lsu_st_pcx_rq_kill_w2[2:0]}),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated

`else // !`ifdef FPGA_SYN_1THREAD

   lsu_qctl1 qctl1  (
                  .so                   (short_scan1_1),
                  .si                   (short_si1),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_bld_helper_cmplt_m(lsu_bld_helper_cmplt_m),
                  .lsu_bld_cnt_m        (lsu_bld_cnt_m[2:0]),
                  .lsu_bld_reset        (lsu_bld_reset),
                  .lsu_pcx_rq_sz_b3     (lsu_pcx_rq_sz_b3),
                  .lsu_ramtest_rd_w     (lsu_ramtest_rd_w),
                  .ld_stb_full_raw_w2   (ld_stb_full_raw_w2),
                  .lsu_ld_pcx_rq_sel_d2 (lsu_ld_pcx_rq_sel_d2[3:0]),
                  .spc_pcx_req_pq       (spc_pcx_req_pq[4:0]),
                  .spc_pcx_atom_pq      (spc_pcx_atom_pq),
                  .lsu_ifu_pcxpkt_ack_d (lsu_ifu_pcxpkt_ack_d),
                  .pcx_pkt_src_sel      (pcx_pkt_src_sel[3:0]),
                  .lmq_enable           (lmq_enable[3:0]),
                  .imiss_pcx_mx_sel     (imiss_pcx_mx_sel),
                  .fwd_int_fp_pcx_mx_sel(fwd_int_fp_pcx_mx_sel[2:0]),
                  .lsu_ffu_bld_cnt_w    (lsu_ffu_bld_cnt_w[2:0]),
                  .lsu_ld_pcx_rq_mxsel  (lsu_ld_pcx_rq_mxsel[3:0]),
                  .ld_pcx_thrd          (ld_pcx_thrd[1:0]),
                  .lsu_spu_ldst_ack     (lsu_spu_ldst_ack),
                  .pcx_rq_for_stb       (pcx_rq_for_stb[3:0]),
                  .pcx_rq_for_stb_d1    (pcx_rq_for_stb_d1[3:0]),
                  .lsu_ffu_ack          (lsu_ffu_ack),
                  .lsu_ifu_ld_pcxpkt_vld(lsu_ifu_ld_pcxpkt_vld),
                  .lsu_pcx_req_squash0  (lsu_pcx_req_squash0),
                  .lsu_pcx_req_squash1  (lsu_pcx_req_squash1),
                  .lsu_pcx_req_squash2  (lsu_pcx_req_squash2),
                  .lsu_pcx_req_squash3  (lsu_pcx_req_squash3),
                  .lsu_pcx_req_squash_d1(lsu_pcx_req_squash_d1),
                  .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                  .lsu_tlu_dcache_miss_w2(lsu_tlu_dcache_miss_w2[3:0]),
                  .lsu_bld_pcx_rq       (lsu_bld_pcx_rq),
                  .lsu_bld_rq_addr      (lsu_bld_rq_addr[1:0]),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_tlu_pcxpkt_ack   (lsu_tlu_pcxpkt_ack),
                  .lsu_intrpt_cmplt     (lsu_intrpt_cmplt[3:0]),
                  .lsu_lmq_byp_misc_sel (lsu_lmq_byp_misc_sel[3:0]),
                  .lsu_sscan_data       (lsu_sscan_data[12:0]),  // Templated
                  .lsu_dfq_byp_tid_d1_sel(lsu_dfq_byp_tid_d1_sel[3:0]),
                  .lmq0_pcx_pkt_way     (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq1_pcx_pkt_way     (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq2_pcx_pkt_way     (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lmq3_pcx_pkt_way     (lmq3_pcx_pkt_way[`L1D_WAY_MASK]),
                  .lsu_st_pcx_rq_pick   (lsu_st_pcx_rq_pick[3:0]),
                  .lsu_stb_pcx_rvld_d1  (lsu_stb_pcx_rvld_d1),
                  .lsu_stb_rd_tid       (lsu_stb_rd_tid[1:0]),
                  .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                  .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                  .lsu_ld2_spec_vld_kill_w2(lsu_ld2_spec_vld_kill_w2),
                  .lsu_ld3_spec_vld_kill_w2(lsu_ld3_spec_vld_kill_w2),
                  .lsu_st_pcx_rq_vld    (lsu_st_pcx_rq_vld),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .sehold               (sehold),
                  .grst_l               (gdbginit_l),            // Templated
                  .arst_l               (arst_l),
                  .lsu_quad_word_access_g(lsu_quad_word_access_g),
                  .pcx_spc_grant_px     (pcx_spc_grant_px[4:0]),
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .lsu_ldst_va_m        (lsu_ldst_va_m_buf[7:6]), // Templated
                  .stb0_l2b_addr        (stb0_l2b_addr[2:0]),
                  .stb1_l2b_addr        (stb1_l2b_addr[2:0]),
                  .stb2_l2b_addr        (stb2_l2b_addr[2:0]),
                  .stb3_l2b_addr        (stb3_l2b_addr[2:0]),
                  .lsu_ld_miss_g        (lsu_ld_miss_wb),        // Templated
                  .ifu_lsu_ldst_fp_e    (ifu_lsu_ldst_fp_e),
                  .ld_rawp_st_ced_w2    (ld_rawp_st_ced_w2),
                  .ld_rawp_st_ackid_w2  (ld_rawp_st_ackid_w2[2:0]),
                  .stb0_crnt_ack_id     (stb0_crnt_ack_id[2:0]),
                  .stb1_crnt_ack_id     (stb1_crnt_ack_id[2:0]),
                  .stb2_crnt_ack_id     (stb2_crnt_ack_id[2:0]),
                  .stb3_crnt_ack_id     (stb3_crnt_ack_id[2:0]),
                  .ifu_tlu_thrid_e      (ifu_tlu_thrid_e[1:0]),
                  .ldxa_internal        (ldxa_internal),
                  .spu_lsu_ldst_pckt    (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
                  .spu_lsu_ldst_pckt_vld(spu_lsu_ldst_pckt[`PCX_VLD]), // Templated
                  .ifu_tlu_inst_vld_m   (ifu_tlu_inst_vld_m),
                  .ifu_lsu_flush_w      (ifu_lsu_flush_w),
                  .ifu_lsu_casa_e       (ifu_lsu_casa_e),
                  .lsu_ldstub_g         (lsu_ldstub_g),
                  .lsu_swap_g           (lsu_swap_g),
                  .stb0_atm_rq_type     (stb0_atm_rq_type[2:1]),
                  .stb1_atm_rq_type     (stb1_atm_rq_type[2:1]),
                  .stb2_atm_rq_type     (stb2_atm_rq_type[2:1]),
                  .stb3_atm_rq_type     (stb3_atm_rq_type[2:1]),
                  .tlb_pgnum_g          (tlb_pgnum_buf[39:37]),  // Templated
                  .stb_rd_for_pcx       (stb_rd_for_pcx[3:0]),
                  .ffu_lsu_data         (ffu_lsu_data[80:79]),
                  .ffu_lsu_fpop_rq_vld  (ffu_lsu_fpop_rq_vld),
                  .ifu_lsu_ldst_dbl_e   (ifu_lsu_ldst_dbl_e),
                  .ifu_lsu_pcxreq_d     (ifu_lsu_pcxreq_d),
                  .ifu_lsu_destid_s     (ifu_lsu_destid_s[2:0]),
                  .ifu_lsu_pref_inst_e  (ifu_lsu_pref_inst_e),
                  .tlb_cam_hit_g        (tlb_cam_hit_g),
                  .lsu_blk_asi_m        (lsu_blk_asi_m),
                  .stb_cam_hit_bf       (stb_cam_hit_bf),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .tlu_lsu_pcxpkt_tid   (tlu_lsu_pcxpkt[19:18]), // Templated
                  .lsu_stb_empty        (lsu_stb_empty_buf[3:0]), // Templated
                  .tlu_lsu_pcxpkt_vld   (tlu_lsu_pcxpkt[25]),    // Templated
                  .tlu_lsu_pcxpkt_l2baddr(tlu_lsu_pcxpkt[11:10]), // Templated
                  .ld_sec_hit_thrd0     (ld_sec_hit_thrd0),
                  .ld_sec_hit_thrd1     (ld_sec_hit_thrd1),
                  .ld_sec_hit_thrd2     (ld_sec_hit_thrd2),
                  .ld_sec_hit_thrd3     (ld_sec_hit_thrd3),
                  .ld_thrd_byp_sel_e    (lsu_ld_thrd_byp_sel_e[2:0]), // Templated
                  .lsu_st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[3:0]),
                  .ifu_lsu_alt_space_e  (ifu_lsu_alt_space_e),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .stb_ld_full_raw      (stb_ld_full_raw[7:0]),
                  .stb_ld_partial_raw   (stb_ld_partial_raw[7:0]),
                  .stb_cam_mhit         (stb_cam_mhit),
                  .lsu_ldquad_inst_m    (lsu_ldquad_inst_m),
                  .stb_cam_wr_no_ivld_m (stb_cam_wr_no_ivld_m),
                  .lsu_ldst_va_way_g    (lsu_ldst_va_way_g[1:0]),
                  .lsu_dcache_rand      (lsu_dcache_rand[1:0]),
                  .lsu_encd_way_hit     (lsu_encd_way_hit[1:0]),
                  .lsu_way_hit_or       (lsu_way_hit_or),
                  .dc_direct_map        (dc_direct_map),
                  .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .asi_internal_m       (asi_internal_m),
                  .ifu_lsu_pcxpkt_e_b50 (ifu_lsu_pcxpkt_e[50]),  // Templated
                  .lda_internal_m       (lda_internal_m),
                  .atomic_m             (atomic_m),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .lsu_no_spc_pref      (lsu_no_spc_pref[3:0]),
                  .tlu_early_flush_pipe2_w(tlu_early_flush_pipe2_w),
                  .lsu_ttype_vld_m2     (lsu_ttype_vld_m2_bf1));  // Templated
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/* lsu_qctl2 AUTO_TEMPLATE (
                .rst_tri_en             (mux_drive_disable),
                .rclk                    (clk),
                .lsu_dfq_rdata_b103      (dfq_rdata[103]),
                .lsu_dfq_rdata_rq_type   (dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]),
                .lsu_dfq_rdata_type      (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]),
                .lsu_dfq_rdata_invwy_vld (dfq_rdata[`CPX_WYVLD]),
                .lsu_dfq_rdata_cpuid     (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]),
                .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]),
                .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]),
                .lsu_ifill_pkt_vld      (lsu_ifu_cpxpkt_vld_i1),
                .lsu_dfq_vld_entry_w 	(lsu_sscan_data[15]),
                .ifu_pcx_pkt_b10t5      (ifu_lsu_pcxpkt_e[10:5]),
                .ifu_pcx_pkt_b41t40     (ifu_lsu_pcxpkt_e[41:40]),
                .ifu_pcx_pkt_b51        (ifu_lsu_pcxpkt_e[51]),
                .ld_inst_vld_e          (ifu_lsu_ld_inst_e),
                .lsu_l2fill_fpld_e      (lsu_l2fill_fpld_e),
                .lsu_dfq_rdata_flush_bit (dfq_rdata[136]),
                .lsu_dfq_rdata_b17_b0    (dfq_rdata[17:0]),
                .lsu_ld_miss_g          (lsu_ld_miss_wb));
*/

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

          .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (cpx_st_ack_tid1),
                  .cpx_st_ack_tid2      (),
                  .cpx_st_ack_tid3      (),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

		  .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (),
                  .cpx_st_ack_tid2      (),
                  .cpx_st_ack_tid3      (),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));

`elsif THREADS_1

   lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

          .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (),
                  .cpx_st_ack_tid2      (),
                  .cpx_st_ack_tid3      (),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));

`elsif THREADS_2

   lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

          .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (cpx_st_ack_tid1),
                  .cpx_st_ack_tid2      (),
                  .cpx_st_ack_tid3      (),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));

`elsif THREADS_3

   lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

          .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (cpx_st_ack_tid1),
                  .cpx_st_ack_tid2      (cpx_st_ack_tid2),
                  .cpx_st_ack_tid3      (),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));

`else // !`ifdef FPGA_SYN_1THREAD

   lsu_qctl2 qctl2  (
                  .so                   (scan1_1),
                  .si                   (si1),
                  .lsu_cpx_stack_dcfill_vld_b130  (lsu_cpx_stack_dcfill_vld_b130),

                  .cpx_spc_data_cx_b144to140  (cpx_spc_data_cx[`CPX_WIDTH-1:140]),
                  .cpx_spc_data_cx_b138       (cpx_spc_data_cx[138]),
                  .cpx_spc_data_cx_b135to134  (cpx_spc_data_cx[`CPX_TH_HI:`CPX_TH_LO]),
                  .cpx_spc_data_cx_b133       (cpx_spc_data_cx[`CPX_WYVLD]),
                  .cpx_spc_data_cx_b130       (cpx_spc_data_cx[130]),
                  .cpx_spc_data_cx_b129       (cpx_spc_data_cx[129]),
                  .cpx_spc_data_cx_b128       (cpx_spc_data_cx[128]),
                  .cpx_spc_data_cx_b125       (cpx_spc_data_cx[`CPX_BINIT_STACK]),
                  .cpx_spc_data_cx_b124to123  (cpx_spc_data_cx[`CPX_PERR_DINV+1:`CPX_PERR_DINV]),
                  .cpx_spc_data_cx_b120to118  (cpx_spc_data_cx[`CPX_INV_CID_HI:`CPX_INV_CID_LO]),
                  .cpx_spc_data_cx_b71to70    (cpx_spc_data_cx[71:70]),

                  .cpx_spc_data_cx_dcache_inval_val(cpx_spc_data_cx[`CPX_INV_DCACHE_VAL]),
                  .cpx_spc_data_cx_icache_inval_val(cpx_spc_data_cx[`CPX_INV_ICACHE_VAL]),

                  // .cpx_spc_data_cx_b0         (cpx_spc_data_cx[0]),
                  // .cpx_spc_data_cx_b4         (cpx_spc_data_cx[4]),
                  // .cpx_spc_data_cx_b8         (cpx_spc_data_cx[8]),
                  // .cpx_spc_data_cx_b12        (cpx_spc_data_cx[12]),
                  // .cpx_spc_data_cx_b16        (cpx_spc_data_cx[16]),
                  // .cpx_spc_data_cx_b20        (cpx_spc_data_cx[20]),
                  // .cpx_spc_data_cx_b24        (cpx_spc_data_cx[24]),
                  // .cpx_spc_data_cx_b28        (cpx_spc_data_cx[28]),
                  // .cpx_spc_data_cx_b32        (cpx_spc_data_cx[32]),
                  // .cpx_spc_data_cx_b35        (cpx_spc_data_cx[35]),
                  // .cpx_spc_data_cx_b38        (cpx_spc_data_cx[38]),
                  // .cpx_spc_data_cx_b41        (cpx_spc_data_cx[41]),
                  // .cpx_spc_data_cx_b44        (cpx_spc_data_cx[44]),
                  // .cpx_spc_data_cx_b47        (cpx_spc_data_cx[47]),
                  // .cpx_spc_data_cx_b50        (cpx_spc_data_cx[50]),
                  // .cpx_spc_data_cx_b53        (cpx_spc_data_cx[53]),
                  // .cpx_spc_data_cx_b56        (cpx_spc_data_cx[56]),
                  // .cpx_spc_data_cx_b60        (cpx_spc_data_cx[60]),
                  // .cpx_spc_data_cx_b64        (cpx_spc_data_cx[64]),
                  // .cpx_spc_data_cx_b68        (cpx_spc_data_cx[68]),
                  // .cpx_spc_data_cx_b72        (cpx_spc_data_cx[72]),
                  // .cpx_spc_data_cx_b76        (cpx_spc_data_cx[76]),
                  // .cpx_spc_data_cx_b80        (cpx_spc_data_cx[80]),
                  // .cpx_spc_data_cx_b84        (cpx_spc_data_cx[84]),
                  // .cpx_spc_data_cx_b88        (cpx_spc_data_cx[88]),
                  // .cpx_spc_data_cx_b91        (cpx_spc_data_cx[91]),
                  // .cpx_spc_data_cx_b94        (cpx_spc_data_cx[94]),
                  // .cpx_spc_data_cx_b97        (cpx_spc_data_cx[97]),
                  // .cpx_spc_data_cx_b100       (cpx_spc_data_cx[100]),
                  .cpx_spc_data_cx_b103       (cpx_spc_data_cx[103]),
                  // .cpx_spc_data_cx_b106       (cpx_spc_data_cx[106]),
                  // .cpx_spc_data_cx_b109       (cpx_spc_data_cx[109]),
                  // .cpx_spc_data_cx_b1         (cpx_spc_data_cx[1]),
                  // .cpx_spc_data_cx_b5         (cpx_spc_data_cx[5]),
                  // .cpx_spc_data_cx_b9         (cpx_spc_data_cx[9]),
                  // .cpx_spc_data_cx_b13        (cpx_spc_data_cx[13]),
                  // .cpx_spc_data_cx_b17        (cpx_spc_data_cx[17]),
                  // .cpx_spc_data_cx_b21        (cpx_spc_data_cx[21]),
                  // .cpx_spc_data_cx_b25        (cpx_spc_data_cx[25]),
                  // .cpx_spc_data_cx_b29        (cpx_spc_data_cx[29]),
                  // .cpx_spc_data_cx_b57        (cpx_spc_data_cx[57]),
                  // .cpx_spc_data_cx_b61        (cpx_spc_data_cx[61]),
                  // .cpx_spc_data_cx_b65        (cpx_spc_data_cx[65]),
                  // .cpx_spc_data_cx_b69        (cpx_spc_data_cx[69]),
                  // .cpx_spc_data_cx_b73        (cpx_spc_data_cx[73]),
                  // .cpx_spc_data_cx_b77        (cpx_spc_data_cx[77]),
                  // .cpx_spc_data_cx_b81        (cpx_spc_data_cx[81]),
                  // .cpx_spc_data_cx_b85        (cpx_spc_data_cx[85]),

		  .lsu_cpx_stack_icfill_vld(lsu_cpx_stack_icfill_vld),
                  /*AUTOINST*/
                  // Outputs
                  .lsu_fwd_rply_sz1_unc (lsu_fwd_rply_sz1_unc),
                  .lsu_dcache_iob_rd_w  (lsu_dcache_iob_rd_w),
                  .ldd_in_dfq_out       (ldd_in_dfq_out),
                  .lsu_dfq_rd_vld_d1    (lsu_dfq_rd_vld_d1),
                  .dfq_byp_ff_en        (dfq_byp_ff_en),
                  .lsu_dfill_data_sel_hi(lsu_dfill_data_sel_hi),
                  .lsu_ifill_pkt_vld    (lsu_ifu_cpxpkt_vld_i1), // Templated
                  .cpx_fwd_pkt_en_cx    (cpx_fwd_pkt_en_cx),
                  .lsu_cpxpkt_type_dcd_cx(lsu_cpxpkt_type_dcd_cx[5:0]),
                  .lsu_cpu_dcd_sel      (lsu_cpu_dcd_sel[7:0]),
                  .lsu_cpu_uhlf_sel     (lsu_cpu_uhlf_sel),
                  .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                  .lsu_iobrdge_fwd_pkt_vld(lsu_iobrdge_fwd_pkt_vld),
                  .lsu_tlu_cpx_vld      (lsu_tlu_cpx_vld),
                  .lsu_tlu_cpx_req      (lsu_tlu_cpx_req[3:0]),
                  .lsu_tlu_intpkt       (lsu_tlu_intpkt[17:0]),
                  .ld_sec_active        (ld_sec_active),
                  .dfq_byp_sel          (dfq_byp_sel[3:0]),
                  .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
                  .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
                  .lsu_exu_rd_m         (lsu_exu_rd_m[4:0]),
                  .lsu_spu_strm_ack_cmplt(lsu_spu_strm_ack_cmplt[1:0]),
                  .lsu_atm_st_cmplt_e   (lsu_atm_st_cmplt_e),
                  .dva_svld_e           (dva_svld_e),
                  .dfq_wptr_vld         (dfq_wptr_vld),
                  .dfq_wptr             (dfq_wptr[4:0]),
                  .lsu_dfq_flsh_cmplt   (lsu_dfq_flsh_cmplt[3:0]),
                  .dfq_rptr_vld         (dfq_rptr_vld),
                  .dfq_rptr             (dfq_rptr[4:0]),
                  .lsu_ifu_stallreq     (lsu_ifu_stallreq),
                  .dva_snp_addr_e       (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
                  .lsu_st_ack_dq_stb    (lsu_st_ack_dq_stb[3:0]),
                  .lsu_cpx_rmo_st_ack   (lsu_cpx_rmo_st_ack[3:0]),
                  .lsu_st_wr_dcache     (lsu_st_wr_dcache),
                  .cpx_st_ack_tid0      (cpx_st_ack_tid0),
                  .cpx_st_ack_tid1      (cpx_st_ack_tid1),
                  .cpx_st_ack_tid2      (cpx_st_ack_tid2),
                  .cpx_st_ack_tid3      (cpx_st_ack_tid3),
                  .lsu_tlu_l2_dmiss     (lsu_tlu_l2_dmiss[3:0]),
                  .lsu_l2fill_vld       (lsu_l2fill_vld),
                  .lsu_byp_ldd_oddrd_m  (lsu_byp_ldd_oddrd_m),
                  .lsu_pcx_fwd_reply    (lsu_pcx_fwd_reply),
                  .lsu_fwdpkt_vld       (lsu_fwdpkt_vld),
                  .lsu_dcfill_active_e  (lsu_dcfill_active_e),
                  .lsu_dfq_ld_vld       (lsu_dfq_ld_vld),
                  .lsu_fldd_vld_en      (lsu_fldd_vld_en),
                  .lsu_dfill_dcd_thrd   (lsu_dfill_dcd_thrd[3:0]),
                  .lsu_fwdpkt_dest      (lsu_fwdpkt_dest[4:0]),
                  .dva_snp_bit_wr_en_e  (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
                  .lsu_cpx_spc_inv_vld  (lsu_cpx_spc_inv_vld),
                  .lsu_cpx_thrdid       (lsu_cpx_thrdid[3:0]),
                  .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                  .lsu_dfq_vld_entry_w  (lsu_sscan_data[15]),    // Templated
                  .lsu_dfq_st_vld       (lsu_dfq_st_vld),
                  .lsu_dfq_ldst_vld     (lsu_dfq_ldst_vld),
                  .lsu_qdp2_dfq_ld_vld  (lsu_qdp2_dfq_ld_vld),
                  .lsu_qdp2_dfq_st_vld  (lsu_qdp2_dfq_st_vld),
                  .lsu_dfq_vld          (lsu_dfq_vld),
                  .lsu_dfq_byp_ff_en    (lsu_dfq_byp_ff_en),
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .grst_l               (grst_l),
                  .arst_l               (arst_l),
                  .se                   (se),
                  .rst_tri_en           (mux_drive_disable),     // Templated
                  .ld_inst_vld_e        (ifu_lsu_ld_inst_e),     // Templated
                  .ifu_pcx_pkt_b51      (ifu_lsu_pcxpkt_e[51]),  // Templated
                  .ifu_pcx_pkt_b41t40   (ifu_lsu_pcxpkt_e[41:40]), // Templated
                  .ifu_pcx_pkt_b10t5    (ifu_lsu_pcxpkt_e[10:5]), // Templated
                  .lsu_dfq_rdata_flush_bit(dfq_rdata[136]),      // Templated
                  .lsu_dfq_rdata_b17_b0 (dfq_rdata[17:0]),       // Templated
                  .ifu_lsu_rd_e         (ifu_lsu_rd_e[4:0]),
                  .lmq_ld_rd1           (lmq_ld_rd1[4:0]),
                  .lmq_ldd_vld          (lmq_ldd_vld),
                  .dfq_tid              (dfq_tid[1:0]),
                  .const_cpuid          (const_cpuid[2:0]),
                  .lmq_ld_addr_b3       (lmq_ld_addr_b3),
                  .ifu_lsu_ibuf_busy    (ifu_lsu_ibuf_busy),
                  .ifu_lsu_inv_clear    (ifu_lsu_inv_clear),
                  .lsu_byp_misc_sz_e    (lsu_byp_misc_sz_e[1:0]),
                  .lsu_dfq_byp_tid      (lsu_dfq_byp_tid[1:0]),
                  .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                  .lsu_cpx_pkt_l2miss   (lsu_cpx_pkt_l2miss),
                  .lsu_cpx_pkt_tid      (lsu_cpx_pkt_tid[1:0]),
                  .lsu_cpx_pkt_invwy    (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                  .lsu_dfq_byp_flush    (lsu_dfq_byp_flush),
                  .lsu_dfq_byp_type     (lsu_dfq_byp_type[5:0]),
                  .lsu_dfq_byp_invwy_vld(lsu_dfq_byp_invwy_vld),
                  //.lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                  //.lsu_cpu_inv_data_b7to2(lsu_cpu_inv_data_b7to2[7:2]),
                  //.lsu_cpu_inv_data_b0  (lsu_cpu_inv_data_b0),
                  .lsu_cpu_inv_data_val          (lsu_cpu_inv_data_val),
                  .lsu_cpu_inv_data_way          (lsu_cpu_inv_data_way),
                  .lsu_cpx_pkt_inv_pa   (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                  .lsu_cpx_pkt_ifill_type(lsu_cpx_pkt_ifill_type),
                  .lsu_cpx_pkt_atomic   (lsu_cpx_pkt_atomic),
                  .lsu_cpx_pkt_binit_st (lsu_cpx_pkt_binit_st),
                  .lsu_cpx_pkt_prefetch (lsu_cpx_pkt_prefetch),
                  .lsu_dfq_byp_binit_st (lsu_dfq_byp_binit_st),
                  .lsu_tlbop_force_swo  (lsu_tlbop_force_swo),
                  .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[7:3]),
                  .lsu_dcache_tag_perror_g(lsu_dcache_tag_perror_g),
                  .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
                  .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                  .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                  .lsu_cpx_pkt_perror_set(lsu_cpx_pkt_perror_set[1:0]),
                  .lsu_l2fill_fpld_e    (lsu_l2fill_fpld_e),     // Templated
                  .lsu_cpx_pkt_strm_ack (lsu_cpx_pkt_strm_ack),
                  .ifu_lsu_memref_d     (ifu_lsu_memref_d),
                  .lsu_fwdpkt_pcx_rq_sel(lsu_fwdpkt_pcx_rq_sel),
                  .lsu_imiss_pcx_rq_sel_d1(lsu_imiss_pcx_rq_sel_d1),
                  .lsu_dfq_byp_cpx_inv  (lsu_dfq_byp_cpx_inv),
                  .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                  .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                  .lsu_dfq_rdata_st_ack_type(dfq_rdata[`DFQ_WIDTH-4]), // Templated
                  .lsu_dfq_rdata_stack_dcfill_vld(dfq_rdata[130]), // Templated
                  .lsu_dfq_rdata_stack_iinv_vld(dfq_rdata[128]), // Templated
                  .lsu_dfq_rdata_cpuid  (dfq_rdata[`CPX_INV_CID_HI:`CPX_INV_CID_LO]), // Templated
                  .lsu_dfq_byp_atm      (lsu_dfq_byp_atm),
                  .lsu_ld_inst_vld_g    (lsu_ld_inst_vld_g[3:0]),
                  .lsu_dfq_rdata_type   (dfq_rdata[`DFQ_WIDTH-1:`DFQ_WIDTH-6]), // Templated
                  .lsu_dfq_rdata_invwy_vld(dfq_rdata[`CPX_WYVLD]), // Templated
                  .ifu_lsu_fwd_data_vld (ifu_lsu_fwd_data_vld),
                  .ifu_lsu_fwd_wr_ack   (ifu_lsu_fwd_wr_ack),
                  .lsu_dfq_rdata_rq_type(dfq_rdata[`CPX_WIDTH-2:`CPX_WIDTH-5]), // Templated
                  .lsu_dfq_rdata_b103   (dfq_rdata[103]),        // Templated
                  .sehold               (sehold));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*   cmp_sram_redhdr AUTO_TEMPLATE(
                            .fuse_ary_wren(fuse_dcd_wren),
                            .fuse_ary_rid(fuse_dcd_rid[5:0]),
                            .fuse_ary_repair_value(fuse_dcd_repair_value[7:0]),
                            .fuse_ary_repair_en(fuse_dcd_repair_en[1:0]),
                            .spc_efc_xfuse_data(spc_efc_dfuse_data),

                            .efc_spc_xfuse_data(efc_spc_dfuse_data),
                            .efc_spc_xfuse_ashift(efc_spc_dfuse_ashift),
                            .efc_spc_xfuse_dshift(efc_spc_dfuse_dshift),
                            .ary_fuse_repair_value(dcd_fuse_repair_value[7:0]),
                            .ary_fuse_repair_en(dcd_fuse_repair_en[1:0]),
                            .scanin   (si0),
                            .rclk     (clk));
 */

// cmp_sram_redhdr dcdhdr(
//                        .scanout         (scan0_1),
//                        /*AUTOINST*/
//                        // Outputs
//                        .fuse_ary_wren   (fuse_dcd_wren),         // Templated
//                        .fuse_ary_rid    (fuse_dcd_rid[5:0]),     // Templated
//                        .fuse_ary_repair_value(fuse_dcd_repair_value[7:0]), // Templated
//                        .fuse_ary_repair_en(fuse_dcd_repair_en[1:0]), // Templated
//                        .spc_efc_xfuse_data(spc_efc_dfuse_data),  // Templated
//                        // Inputs
//                        .rclk            (clk),                   // Templated
//                        .se              (se),
//                        .scanin          (si0),                   // Templated
//                        .arst_l          (arst_l),
//                        .testmode_l      (testmode_l),
//                        .efc_spc_fuse_clk1(efc_spc_fuse_clk1),
//                        .efc_spc_fuse_clk2(efc_spc_fuse_clk2),
//                        .efc_spc_xfuse_data(efc_spc_dfuse_data),  // Templated
//                        .efc_spc_xfuse_ashift(efc_spc_dfuse_ashift), // Templated
//                        .efc_spc_xfuse_dshift(efc_spc_dfuse_dshift), // Templated
//                        .ary_fuse_repair_value(dcd_fuse_repair_value[7:0]), // Templated
//                        .ary_fuse_repair_en(dcd_fuse_repair_en[1:0])); // Templated
/* bw_r_dcd  AUTO_TEMPLATE (
                   .rst_tri_en           (mem_write_disable),
                   //.sehold               (),
                   .rclk                 (clk),
                   .dcache_alt_addr_e    (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
                   .dcache_alt_rsel_way_e(lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
                   .dcache_rd_addr_e     (exu_lsu_early_va_e[`L1D_ADDRESS_HI:3]),
                   .dcache_rsel_way_wb   (cache_way_hit[`L1D_WAY_COUNT-1:0]),
                   .dcache_wdata_e       (lsu_dcache_fill_data_e[143:0]),
                   .dcache_wr_rway_e     (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
                   .dcache_wvld_e        (lsu_dcache_wr_vld_e));
*/

bw_r_dcd dcache (
                 .so                    (scan1_2),
                 .si                    (scan1_1),
                 /*AUTOINST*/
                 // Outputs
                 .dcache_rdata_wb       (dcache_rdata_wb[63:0]),
                 .dcache_rparity_wb     (dcache_rparity_wb[7:0]),
                 .dcache_rparity_err_wb (dcache_rparity_err_wb),
                 .dcache_rdata_msb_m (dcache_rdata_msb_m),
                 // .dcache_rdata_msb_w0_m (dcache_rdata_msb_w0_m[7:0]),
                 // .dcache_rdata_msb_w1_m (dcache_rdata_msb_w1_m[7:0]),
                 // .dcache_rdata_msb_w2_m (dcache_rdata_msb_w2_m[7:0]),
                 // .dcache_rdata_msb_w3_m (dcache_rdata_msb_w3_m[7:0]),
                 .dcd_fuse_repair_value (dcd_fuse_repair_value[7:0]),
                 .dcd_fuse_repair_en    (dcd_fuse_repair_en[1:0]),
                 // Inputs
                 .dcache_rd_addr_e      (exu_lsu_early_va_e[`L1D_ADDRESS_HI:3]), // Templated
                 .dcache_alt_addr_e     (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]), // Templated
                 .dcache_rvld_e         (dcache_rvld_e),
                 .dcache_wvld_e         (lsu_dcache_wr_vld_e),   // Templated
                 .dcache_wdata_e        (lsu_dcache_fill_data_e[143:0]), // Templated
                 .dcache_wr_rway_e      (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]), // Templated
                 .dcache_byte_wr_en_e   (dcache_byte_wr_en_e[15:0]),
                 .dcache_alt_rsel_way_e (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]), // Templated
                 .dcache_rsel_way_wb    (cache_way_hit[`L1D_WAY_COUNT-1:0]),    // Templated
                 .dcache_alt_mx_sel_e   (dcache_alt_mx_sel_e),
                 .se                    (se),
                 .sehold                (sehold),
                 .rst_tri_en            (mem_write_disable),     // Templated
                 .arst_l                (arst_l),
                 .rclk                  (clk),                   // Templated
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 .dcache_arry_data_sel_m(dcache_arry_data_sel_m),
                 .efc_spc_fuse_clk1     (efc_spc_fuse_clk1),
                 .fuse_dcd_wren         (fuse_dcd_wren),
                 .fuse_dcd_rid          (fuse_dcd_rid[2:0]),
                 .fuse_dcd_repair_value (fuse_dcd_repair_value[7:0]),
                 .fuse_dcd_repair_en    (fuse_dcd_repair_en[1:0]),

                 // interface to srams
                 .sram_dcache_w01_rtap_data (sram_dcache_w01_rtap_data),
                 .sram_dcache_w23_rtap_data (sram_dcache_w23_rtap_data),
                 .rtap_srams_bist_command (rtap_srams_bist_command),
                 .rtap_srams_bist_data (rtap_srams_bist_data)

                 );
/* sram_l1d_val  AUTO_TEMPLATE (
             .rst_tri_en           (mem_write_disable),
             .rclk             (clk),
             .bit_wen          (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
             .din                (dva_din_e),
             .dout               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
             .rd_adr1            (exu_lsu_early_va_e[`L1D_ADDRESS_HI:4]),
             .rd_adr1_sel        (1'b1),
             .rd_adr2            (7'b0),
             .rd_en              (ifu_lsu_ld_inst_e),
             .reset_l            (arst_l),
             //.sehold             (),
             .wr_adr             (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
             .wr_en              (lsu_dtagv_wr_vld_e));
*/

sram_l1d_val dva (
                  .so                   (short_scan0_1),
                  .si                   (short_si0),
                   /*AUTOINST*/
                  // Outputs
                  .dout                 (dva_vld_m[`L1D_WAY_COUNT-1:0]),        // Templated
                  // Inputs
                  .rclk                 (clk),                   // Templated
                  .se                   (se),
                  .reset_l              (arst_l),                // Templated
                  .sehold               (sehold),
                  .rst_tri_en           (mem_write_disable),     // Templated
                  .rd_adr1              (exu_lsu_early_va_e[`L1D_ADDRESS_HI:4]), // Templated
                  .rd_adr2              ({`L1D_SET_IDX_WIDTH{1'b0}}),                  // Templated
                  .rd_adr1_sel          (1'b1),                  // Templated
                  .rd_en                (ifu_lsu_ld_inst_e),     // Templated
                  .wr_adr               (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),    // Templated
                  .wr_en                (lsu_dtagv_wr_vld_e),    // Templated
                  .bit_wen              (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]), // Templated
                  .din                  (dva_din_e),             // Templated

                  // debug interface
                     .sramid            (`BIST_ID_L1_DCV),
                     .rtap_srams_bist_command   (rtap_srams_bist_command),
                     .rtap_srams_bist_data      (rtap_srams_bist_data),
                     .srams_rtap_data           (dcv_rtap_data)
                  );
/* bw_r_dct  AUTO_TEMPLATE (
               .rst_tri_en           (mem_write_disable),
               //.sehold                  (),
               .rclk                    (clk),
               .adj                     (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
               .index0_x                (exu_lsu_early_va_e[`L1D_ADDRESS_HI:4]),
               .index1_x                (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:4]),
               .index_sel_x             (lsu_dtag_index_sel_x_e),
               .rdreq_x                 (lsu_ldst_inst_vld_e),
               .rdtag_w0_y              (dtag_rdata_w0_m[32:0]),
               .rdtag_w1_y              (dtag_rdata_w1_m[32:0]),
               .rdtag_w2_y              (dtag_rdata_w2_m[32:0]),
               .rdtag_w3_y              (dtag_rdata_w3_m[32:0]),
               .wrreq_x                 (lsu_dtag_wrreq_x_e),
               //.wrtag_w0_y                 ({3'b000,dtag_wdata_m}),
               //.wrtag_w1_y                 ({3'b000,dtag_wdata_m}),
               //.wrtag_w2_y                 ({3'b000,dtag_wdata_m}),
               //.wrtag_w3_y                 ({3'b000,dtag_wdata_m}),
               .dec_wrway_x                (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .reset_l                 (arst_l));
*/

bw_r_dct dtag (
                .so                     (short_scan0_2),
                .si                     (short_scan0_1),
		// .wrtag_w0_y		({3'b000,dtag_wdata_m}),
		// .wrtag_w1_y		({3'b000,dtag_wdata_m}),
		// .wrtag_w2_y		({3'b000,dtag_wdata_m}),
		// .wrtag_w3_y		({3'b000,dtag_wdata_m}),
      // .wrtag_w0_x    ({3'b000,dtag_wdata_e}),
      // .wrtag_w1_x    ({3'b000,dtag_wdata_e}),
      // .wrtag_w2_x    ({3'b000,dtag_wdata_e}),
      // .wrtag_w3_x    ({3'b000,dtag_wdata_e}),
      .wrtag_y    ({3'b0, dtag_wdata_m}),
      .wrtag_x    ({3'b0, dtag_wdata_e}),
                /*AUTOINST*/
                // Outputs
                // .rdtag_w0_y             (dtag_rdata_w0_m[32:0]), // Templated
                // .rdtag_w1_y             (dtag_rdata_w1_m[32:0]), // Templated
                // .rdtag_w2_y             (dtag_rdata_w2_m[32:0]), // Templated
                // .rdtag_w3_y             (dtag_rdata_w3_m[32:0]), // Templated
                .rdtag_y             (dtag_rdata_m), // Templated
                // Inputs
                .rclk                   (clk),                   // Templated
                .se                     (se),
                .reset_l                (arst_l),                // Templated
                .sehold                 (sehold),
                .rst_tri_en             (mem_write_disable),     // Templated
                .index0_x               (exu_lsu_early_va_e[`L1D_ADDRESS_HI:4]), // Templated
                .index1_x               (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:4]), // Templated
                .index_sel_x            (lsu_dtag_index_sel_x_e), // Templated
                .dec_wrway_x            (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]), // Templated
                .rdreq_x                (lsu_ldst_inst_vld_e),   // Templated
                .wrreq_x                (lsu_dtag_wrreq_x_e),    // Templated
                .adj                    (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),


               // debug interface
               .sramid   (`BIST_ID_L1_DTAG),
               .srams_rtap_data   (sram_dtag_rtap_data),
               .rtap_srams_bist_command   (rtap_srams_bist_command),
               .rtap_srams_bist_data   (rtap_srams_bist_data)




                );

/*lsu_tlbdp  AUTO_TEMPLATE (
               .rclk  (clk));
*/

lsu_tlbdp tlbdp (
                 .so                    (scan1_3),
                 .si                    (scan1_2),
                 .tlb_rd_tte_data_parity  (tlb_rd_tte_data[42]),
                 .tlb_rd_tte_tag_parity   (tlb_rd_tte_tag[54]),
                 /*AUTOINST*/
                 // Outputs
                 .lsu_tlb_rd_data       (lsu_tlb_rd_data[63:0]),
                 .tlb_pgnum_buf         (tlb_pgnum_buf[39:10]),
                 .tlb_pgnum_buf2        (tlb_pgnum_buf2[39:37]),
                 .tlb_rd_tte_data_ie_buf(tlb_rd_tte_data_ie_buf),
                 .stb_cam_vld           (stb_cam_vld),
                 .tte_data_parity_error (tte_data_parity_error),
                 .tte_tag_parity_error  (tte_tag_parity_error),
                 .cache_way_hit_buf1    (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
                 .cache_way_hit_buf2    (cache_way_hit_buf2[`L1D_WAY_COUNT-1:0]),
                 .lsu_tlu_tte_pg_sz_g   (lsu_tlu_tte_pg_sz_g[2:0]),
                 // Inputs
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .tlb_rd_tte_tag        (tlb_rd_tte_tag[58:0]),
                 .tlb_rd_tte_data       (tlb_rd_tte_data[42:0]),
                 .lsu_tlb_data_rd_vld_g (lsu_tlb_data_rd_vld_g),
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .lsu_tlb_csm_rd_vld_g  (lsu_tlb_csm_rd_vld_g),
                 `endif
                 .tlb_pgnum             (tlb_pgnum[39:10]),
                 .asi_internal_m        (asi_internal_m),
                 .lsu_alt_space_m       (lsu_alt_space_m),
                 .tlb_cam_hit           (tlb_cam_hit),
                 .ifu_lsu_ld_inst_e     (ifu_lsu_ld_inst_e),
                 .lsu_dtlb_bypass_e     (lsu_dtlb_bypass_e),
                 .cache_way_hit         (cache_way_hit[`L1D_WAY_COUNT-1:0]));

/*
lsu_tagdp AUTO_TEMPLATE (
                  .dva_vld_m              (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
                  .rclk                   (clk));
*/

lsu_tagdp tagdp (
                 .so                    (scan1_4),
                 .si                    (scan1_3),
		             .lsu_local_ldxa_data_g ({15'b0,lsu_local_ldxa_data_g[32:0]}),
                 /*AUTOINST*/
                 // Outputs
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_rd_dtag_parity_g  (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
                 // Inputs
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .lsu_va_wtchpt_sel_g   (lsu_va_wtchpt_sel_g),
                 .dva_vld_m             (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),     // Templated
                 .dtag_rdata_m (dtag_rdata_m),
                 .lsu_dtag_rsel_m       (lsu_dtag_rsel_m[3:0]),
                 .lsu_local_ldxa_sel_g  (lsu_local_ldxa_sel_g),
                 .lsu_tlb_rd_data       (lsu_tlb_rd_data[63:0]),
                 .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
                 .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g));

/*
lsu_excpctl AUTO_TEMPLATE (
                .ifu_tlu_inst_vld_m     (ifu_tlu_inst_vld_m_bf2),
                .tlb_rd_tte_data_ebit   (tlb_rd_tte_data[`STLB_DATA_E]),
                .tlb_rd_tte_data_pbit   (tlb_rd_tte_data[`STLB_DATA_P]),
                .tlb_rd_tte_data_nfobit (tlb_rd_tte_data[`STLB_DATA_NFO]),
                .tlb_rd_tte_data_wbit   (tlb_rd_tte_data[`STLB_DATA_W]),
		.lsu_ldst_va_b39_m	(lsu_ldst_va_m_buf[39]),
                .tlb_pgnum_b39          (tlb_pgnum[39]),
       	        .lsu_sun4r_va_m_l	      (lsu_ldst_va_m[10]),
	              .lsu_sun4r_pgsz_b2t0_e  ({exu_lsu_rs3_data_e[48],exu_lsu_rs3_data_e[62:61]}),
	              .lsu_sun4v_pgsz_b2t0_e  (exu_lsu_rs3_data_e[2:0]),
                .ld_inst_vld_e          (ifu_lsu_ld_inst_e),
                .st_inst_vld_e          (ifu_lsu_st_inst_e),
                .rclk                   (clk));
*/

lsu_excpctl excpctl (
                     .so                (short_scan0_3),
                     .si                (short_scan0_2),

                 /*AUTOINST*/
                     // Outputs
                     .lsu_exu_st_dtlb_perr_g(lsu_exu_st_dtlb_perr_g),
                     .lsu_ffu_st_dtlb_perr_g(lsu_ffu_st_dtlb_perr_g),
                     .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                     .lsu_tlu_defr_trp_taken_g(lsu_tlu_defr_trp_taken_g),
                     .lsu_mmu_defr_trp_taken_g(lsu_mmu_defr_trp_taken_g),
                     .lsu_st_dtlb_perr_g(lsu_st_dtlb_perr_g[3:0]),
                     .lsu_dmmu_sfsr_trp_wr(lsu_dmmu_sfsr_trp_wr[3:0]),
                     .lsu_dsfsr_din_g   (lsu_dsfsr_din_g[23:0]),
                     .lsu_tlb_perr_ld_rq_kill_w(lsu_tlb_perr_ld_rq_kill_w),
                     .lsu_spu_early_flush_g(lsu_spu_early_flush_g),
                     .lsu_local_early_flush_g(lsu_local_early_flush_g),
                     .lsu_tlu_early_flush_w(lsu_tlu_early_flush_w),
                     .lsu_tlu_early_flush2_w(lsu_tlu_early_flush2_w),
                     .lsu_ttype_vld_m2  (lsu_ttype_vld_m2),
                     .lsu_ttype_vld_m2_bf1(lsu_ttype_vld_m2_bf1),
                     .lsu_ifu_flush_pipe_w(lsu_ifu_flush_pipe_w),
                     .lsu_exu_flush_pipe_w(lsu_exu_flush_pipe_w),
                     .lsu_mmu_flush_pipe_w(lsu_mmu_flush_pipe_w),
                     .lsu_ffu_flush_pipe_w(lsu_ffu_flush_pipe_w),
                     .lsu_tlu_wtchpt_trp_g(lsu_tlu_wtchpt_trp_g),
                     .lsu_tlu_dmmu_miss_g(lsu_tlu_dmmu_miss_g),
                     .lsu_tlu_misalign_addr_ldst_atm_m(lsu_tlu_misalign_addr_ldst_atm_m),
                     .lsu_tlu_daccess_excptn_g(lsu_tlu_daccess_excptn_g),
                     .lsu_tlu_daccess_prot_g(lsu_tlu_daccess_prot_g),
                     .lsu_tlu_priv_action_g(lsu_tlu_priv_action_g),
                     .lsu_ifu_tlb_data_su(lsu_ifu_tlb_data_su),
                     .lsu_ifu_tlb_data_ue(lsu_ifu_tlb_data_ue),
                     .lsu_ifu_tlb_tag_ue(lsu_ifu_tlb_tag_ue),
                     .lsu_tlu_ttype_m2  (lsu_tlu_ttype_m2[8:0]),
                     .lsu_tlu_ttype_vld_m2(lsu_tlu_ttype_vld_m2),
                     .stb_cam_sqsh_msk  (stb_cam_sqsh_msk[7:0]),
                     .stb_cam_hit_bf    (stb_cam_hit_bf),
                     .stb_cam_hit_bf1   (stb_cam_hit_bf1),
                     .tte_data_perror_unc(tte_data_perror_unc),
                     .asi_tte_data_perror(asi_tte_data_perror),
                     .asi_tte_tag_perror(asi_tte_tag_perror),
                     // Inputs
                     .rclk              (clk),                   // Templated
                     .se                (se),
                     .grst_l            (grst_l),
                     .arst_l            (arst_l),
                     .tlb_rd_tte_data_ebit(tlb_rd_tte_data[`STLB_DATA_E]), // Templated
                     .tlb_rd_tte_data_pbit(tlb_rd_tte_data[`STLB_DATA_P]), // Templated
                     .tlb_rd_tte_data_nfobit(tlb_rd_tte_data[`STLB_DATA_NFO]), // Templated
                     .tlb_rd_tte_data_wbit(tlb_rd_tte_data[`STLB_DATA_W]), // Templated
                     .tlb_cam_hit       (tlb_cam_hit),
                     .tlb_pgnum_b39     (tlb_pgnum[39]),         // Templated
                     .lsu_ldst_va_b39_m (lsu_ldst_va_m_buf[39]), // Templated
                     .lsu_sun4r_va_m_l  (lsu_ldst_va_m[10]),     // Templated
                     .lsu_sun4r_pgsz_b2t0_e({exu_lsu_rs3_data_e[48],exu_lsu_rs3_data_e[62:61]}), // Templated
                     .lsu_sun4v_pgsz_b2t0_e(exu_lsu_rs3_data_e[2:0]), // Templated
                     .tlu_early_flush_pipe_w(tlu_early_flush_pipe_w),
                     .ifu_lsu_flush_w   (ifu_lsu_flush_w),
                     .ifu_lsu_nceen     (ifu_lsu_nceen[3:0]),
                     .lsu_tlb_asi_data_perr_g(lsu_tlb_asi_data_perr_g),
                     .lsu_tlb_asi_tag_perr_g(lsu_tlb_asi_tag_perr_g),
                     .stb_state_vld0    (stb_state_vld0[7:0]),
                     .stb_state_vld1    (stb_state_vld1[7:0]),
                     .stb_state_vld2    (stb_state_vld2[7:0]),
                     .stb_state_vld3    (stb_state_vld3[7:0]),
                     .ifu_tlu_thrid_e   (ifu_tlu_thrid_e[1:0]),
                     .tlu_lsu_priv_trap_m(tlu_lsu_priv_trap_m),
                     .tlu_lsu_pstate_priv(tlu_lsu_pstate_priv[3:0]),
                     .st_inst_vld_e     (ifu_lsu_st_inst_e),     // Templated
                     .ld_inst_vld_e     (ifu_lsu_ld_inst_e),     // Templated
                     .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                     .lsu_ldst_va_m     (lsu_ldst_va_m[7:0]),
                     .hpv_priv_m        (hpv_priv_m),
                     .hpstate_en_m      (hpstate_en_m),
                     .stb_cam_hit       (stb_cam_hit),
                     .dtlb_bypass_m     (dtlb_bypass_m),
                     .lsu_alt_space_m   (lsu_alt_space_m),
                     .atomic_m          (atomic_m),
                     .ldst_dbl_m        (ldst_dbl_m),
                     .fp_ldst_m         (fp_ldst_m),
                     .lda_internal_m    (lda_internal_m),
                     .sta_internal_m    (sta_internal_m),
                     .cam_real_m        (cam_real_m),
                     .data_rd_vld_g     (data_rd_vld_g),
                     .tag_rd_vld_g      (tag_rd_vld_g),
                     .ldst_sz_m         (ldst_sz_m[1:0]),
                     .asi_internal_m    (asi_internal_m),
                     .rd_only_ltlb_asi_e(rd_only_ltlb_asi_e),
                     .wr_only_ltlb_asi_e(wr_only_ltlb_asi_e),
                     .dfill_tlb_asi_e   (dfill_tlb_asi_e),
                     .ifill_tlb_asi_e   (ifill_tlb_asi_e),
                     .nofault_asi_m     (nofault_asi_m),
                     .as_if_user_asi_m  (as_if_user_asi_m),
                     .atomic_asi_m      (atomic_asi_m),
                     .phy_use_ec_asi_m  (phy_use_ec_asi_m),
                     .phy_byp_ec_asi_m  (phy_byp_ec_asi_m),
                     .quad_asi_m        (quad_asi_m),
                     .binit_quad_asi_m  (binit_quad_asi_m),
                     .blk_asi_m         (blk_asi_m),
                     .recognized_asi_m  (recognized_asi_m),
                     .strm_asi_m        (strm_asi_m),
                     .mmu_rd_only_asi_m (mmu_rd_only_asi_m),
                     .rd_only_asi_m     (rd_only_asi_m),
                     .wr_only_asi_m     (wr_only_asi_m),
                     .unimp_asi_m       (unimp_asi_m),
                     .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
                     .va_wtchpt_cmp_en_m(va_wtchpt_cmp_en_m),
                     .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                     .lsu_va_match_b31_b3_m(lsu_va_match_b31_b3_m),
                     .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                     .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m_bf2), // Templated
                     .exu_tlu_misalign_addr_jmpl_rtn_m(exu_tlu_misalign_addr_jmpl_rtn_m),
                     .exu_tlu_va_oor_m  (exu_tlu_va_oor_m),
                     .tlu_dsfsr_flt_vld (tlu_dsfsr_flt_vld[3:0]),
                     .tlu_lsu_pstate_cle(tlu_lsu_pstate_cle[3:0]),
                     .tlu_lsu_pstate_am (tlu_lsu_pstate_am[3:0]),
                     .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                     .lsu_tlu_nonalt_ldst_m(lsu_tlu_nonalt_ldst_m),
                     .lsu_squash_va_oor_m(lsu_squash_va_oor_m),
                     .lsu_tlu_xslating_ldst_m(lsu_tlu_xslating_ldst_m),
                     .lsu_tlu_ctxt_sel_m(lsu_tlu_ctxt_sel_m[2:0]),
                     .lsu_tlu_write_op_m(lsu_tlu_write_op_m),
                     .lsu_memref_m      (lsu_memref_m),
                     .lsu_flsh_inst_m   (lsu_flsh_inst_m),
                     .tte_data_parity_error(tte_data_parity_error),
                     .tte_tag_parity_error(tte_tag_parity_error));

/*lsu_dctldp AUTO_TEMPLATE (
               .thread0_m               (lsu_dctldp_thread0_m),
               .thread1_m               (lsu_dctldp_thread1_m),
               .thread2_m               (lsu_dctldp_thread2_m),
               .thread3_m               (lsu_dctldp_thread3_m),
               .rst_tri_en              (mux_drive_disable),
               .rclk                    (clk),
               .rst_l                   (dctl_rst_l),
      	       .tlu_dtlb_tte_tag_b58t56 (tlu_dtlb_tte_tag_w2[58:56]),
               .lsu_dcfill_addr_e       (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]));
*/

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
           .lsu_iobrdge_rd_data (lsu_iobrdge_rd_data[43:0]),
           .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (lsu_asi_reg1_t[7:0]),
                   .lsu_asi_reg2        (),
                   .lsu_asi_reg3        (),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (lsu_t1_pctxt_state_t[12:0]),
                   .lsu_t2_pctxt_state  (),
                   .lsu_t3_pctxt_state  (),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (lsu_pid_state1_t[2:0]),
                   .lsu_pid_state2      (),
                   .lsu_pid_state3      (),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (lsu_dp_ctl_reg1[5:0]),
                   .lsu_dp_ctl_reg2     (),
                   .lsu_dp_ctl_reg3     (),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (thread1_d),
                   .thread2_d           (1'b0),
                   .thread3_d           (1'b0),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (thread1_ctxt),
                   .thread2_ctxt        (1'b0),
                   .thread3_ctxt        (1'b0),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (thread1_g),
                   .thread2_g           (1'b0),
                   .thread3_g           (1'b0),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (thread1_e),
                   .thread2_e           (1'b0),
                   .thread3_e           (1'b0),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (lsu_dctldp_thread1_m),  // Templated
                   .thread2_m           (1'b0),  // Templated
                   .thread3_m           (1'b0),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (tlb_access_en1_g),
                   .tlb_access_en2_g    (1'b0),
                   .tlb_access_en3_g    (1'b0),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable),


                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)

                   );     // Templated


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
		   .lsu_iobrdge_rd_data	(lsu_iobrdge_rd_data[43:0]),
		   .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (),
                   .lsu_asi_reg2        (),
                   .lsu_asi_reg3        (),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (),
                   .lsu_t2_pctxt_state  (),
                   .lsu_t3_pctxt_state  (),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (),
                   .lsu_pid_state2      (),
                   .lsu_pid_state3      (),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (),
                   .lsu_dp_ctl_reg2     (),
                   .lsu_dp_ctl_reg3     (),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (1'b0),
                   .thread2_d           (1'b0),
                   .thread3_d           (1'b0),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (1'b0),
                   .thread2_ctxt        (1'b0),
                   .thread3_ctxt        (1'b0),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (1'b0),
                   .thread2_g           (1'b0),
                   .thread3_g           (1'b0),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (1'b0),
                   .thread2_e           (1'b0),
                   .thread3_e           (1'b0),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (1'b0),  // Templated
                   .thread2_m           (1'b0),  // Templated
                   .thread3_m           (1'b0),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (1'b0),
                   .tlb_access_en2_g    (1'b0),
                   .tlb_access_en3_g    (1'b0),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable),
                   
                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                   );     // Templated

`elsif THREADS_1

   lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
           .lsu_iobrdge_rd_data (lsu_iobrdge_rd_data[43:0]),
           .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (),
                   .lsu_asi_reg2        (),
                   .lsu_asi_reg3        (),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (),
                   .lsu_t2_pctxt_state  (),
                   .lsu_t3_pctxt_state  (),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (),
                   .lsu_pid_state2      (),
                   .lsu_pid_state3      (),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (),
                   .lsu_dp_ctl_reg2     (),
                   .lsu_dp_ctl_reg3     (),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (1'b0),
                   .thread2_d           (1'b0),
                   .thread3_d           (1'b0),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (1'b0),
                   .thread2_ctxt        (1'b0),
                   .thread3_ctxt        (1'b0),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (1'b0),
                   .thread2_g           (1'b0),
                   .thread3_g           (1'b0),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (1'b0),
                   .thread2_e           (1'b0),
                   .thread3_e           (1'b0),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (1'b0),  // Templated
                   .thread2_m           (1'b0),  // Templated
                   .thread3_m           (1'b0),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (1'b0),
                   .tlb_access_en2_g    (1'b0),
                   .tlb_access_en3_g    (1'b0),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable),
                   
                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                   );     // Templated

`elsif THREADS_2

   lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
           .lsu_iobrdge_rd_data (lsu_iobrdge_rd_data[43:0]),
           .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (lsu_asi_reg1_t[7:0]),
                   .lsu_asi_reg2        (),
                   .lsu_asi_reg3        (),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (lsu_t1_pctxt_state_t[12:0]),
                   .lsu_t2_pctxt_state  (),
                   .lsu_t3_pctxt_state  (),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (lsu_pid_state1_t[2:0]),
                   .lsu_pid_state2      (),
                   .lsu_pid_state3      (),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (lsu_dp_ctl_reg1[5:0]),
                   .lsu_dp_ctl_reg2     (),
                   .lsu_dp_ctl_reg3     (),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (thread1_d),
                   .thread2_d           (1'b0),
                   .thread3_d           (1'b0),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (thread1_ctxt),
                   .thread2_ctxt        (1'b0),
                   .thread3_ctxt        (1'b0),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (thread1_g),
                   .thread2_g           (1'b0),
                   .thread3_g           (1'b0),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (thread1_e),
                   .thread2_e           (1'b0),
                   .thread3_e           (1'b0),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (lsu_dctldp_thread1_m),  // Templated
                   .thread2_m           (1'b0),  // Templated
                   .thread3_m           (1'b0),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (tlb_access_en1_g),
                   .tlb_access_en2_g    (1'b0),
                   .tlb_access_en3_g    (1'b0),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable),
                   
                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                   );     // Templated

`elsif THREADS_3

   lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
           .lsu_iobrdge_rd_data (lsu_iobrdge_rd_data[43:0]),
           .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (lsu_asi_reg1_t[7:0]),
                   .lsu_asi_reg2        (lsu_asi_reg2_t[7:0]),
                   .lsu_asi_reg3        (),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (lsu_t1_pctxt_state_t[12:0]),
                   .lsu_t2_pctxt_state  (lsu_t2_pctxt_state_t[12:0]),
                   .lsu_t3_pctxt_state  (),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (lsu_pid_state1_t[2:0]),
                   .lsu_pid_state2      (lsu_pid_state2_t[2:0]),
                   .lsu_pid_state3      (),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (lsu_dp_ctl_reg1[5:0]),
                   .lsu_dp_ctl_reg2     (lsu_dp_ctl_reg2[5:0]),
                   .lsu_dp_ctl_reg3     (),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (thread1_d),
                   .thread2_d           (thread2_d),
                   .thread3_d           (1'b0),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (thread1_ctxt),
                   .thread2_ctxt        (thread2_ctxt),
                   .thread3_ctxt        (1'b0),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (thread1_g),
                   .thread2_g           (thread2_g),
                   .thread3_g           (1'b0),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (thread1_e),
                   .thread2_e           (thread2_e),
                   .thread3_e           (1'b0),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (lsu_dctldp_thread1_m),  // Templated
                   .thread2_m           (lsu_dctldp_thread2_m),  // Templated
                   .thread3_m           (1'b0),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (tlb_access_en1_g),
                   .tlb_access_en2_g    (tlb_access_en2_g),
                   .tlb_access_en3_g    (1'b0),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable));     // Templated

`else // !`ifdef FPGA_SYN_1THREAD


   lsu_dctldp dctldp (
                   .so                  (short_scan1_2),
                   .si                  (short_scan1_1),
		   .lsu_iobrdge_rd_data	(lsu_iobrdge_rd_data[43:0]),
		   .lsu_local_ldxa_data_g(lsu_local_ldxa_data_g[47:0]),
                   /*AUTOINST*/
                   // Outputs
                   .asi_d               (asi_d[7:0]),
                   .lsu_excpctl_asi_state_m(lsu_excpctl_asi_state_m[7:0]),
                   .lsu_dctl_asi_state_m(lsu_dctl_asi_state_m[7:0]),
                   .lsu_spu_asi_state_e (lsu_spu_asi_state_e[7:0]),
                   .lsu_tlu_rsr_data_e  (lsu_tlu_rsr_data_e[7:0]),
                   .lsu_asi_state       (lsu_asi_state[7:0]),
                   .lsu_asi_reg0        (lsu_asi_reg0_t[7:0]),
                   .lsu_asi_reg1        (lsu_asi_reg1_t[7:0]),
                   .lsu_asi_reg2        (lsu_asi_reg2_t[7:0]),
                   .lsu_asi_reg3        (lsu_asi_reg3_t[7:0]),
                   .lsu_t0_pctxt_state  (lsu_t0_pctxt_state_t[12:0]),
                   .lsu_t1_pctxt_state  (lsu_t1_pctxt_state_t[12:0]),
                   .lsu_t2_pctxt_state  (lsu_t2_pctxt_state_t[12:0]),
                   .lsu_t3_pctxt_state  (lsu_t3_pctxt_state_t[12:0]),
                   .lsu_tlu_dside_ctxt_m(lsu_tlu_dside_ctxt_m[12:0]),
                   .lsu_tlu_pctxt_m     (lsu_tlu_pctxt_m[12:0]),
                   .tlb_ctxt            (tlb_ctxt[12:0]),
                   .lsu_pid_state0      (lsu_pid_state0_t[2:0]),
                   .lsu_pid_state1      (lsu_pid_state1_t[2:0]),
                   .lsu_pid_state2      (lsu_pid_state2_t[2:0]),
                   .lsu_pid_state3      (lsu_pid_state3_t[2:0]),
                   .lsu_dtlb_cam_pid_e  (lsu_dtlb_cam_pid_e[2:0]),
                   .bist_ctl_reg_in     (bist_ctl_reg_in[6:0]),
                   .lsu_ifu_direct_map_l1(lsu_ifu_direct_map_l1),
                   .dc_direct_map       (dc_direct_map),
                   .lsu_ictag_mrgn      (lsu_ictag_mrgn[3:0]),
                   .lsu_dctag_mrgn      (lsu_dctag_mrgn[`L1D_WAY_COUNT-1:0]),
                   .lsu_mamem_mrgn      (lsu_mamem_mrgn[3:0]),
                   .lsu_dtlb_mrgn       (lsu_dtlb_mrgn[7:0]),
                   .lsu_itlb_mrgn       (lsu_itlb_mrgn[7:0]),
                   .lsu_ldst_va_m       (lsu_ldst_va_m[12:0]),
                   .lsu_ldst_va_m_buf   (lsu_ldst_va_m_buf[47:0]),
                   .lsu_tlu_ldst_va_m   (lsu_tlu_ldst_va_m[9:0]),
                   .lsu_tlu_tlb_asi_state_m(lsu_tlu_tlb_asi_state_m[7:0]),
                   .lsu_ifu_asi_state   (lsu_ifu_asi_state[7:0]),
                   .lsu_tlu_tlb_ldst_va_m(lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0]),
                   .lsu_tlu_tlb_dmp_va_m(lsu_tlu_tlb_dmp_va_m[47:13]),
                   .lsu_ifu_asi_addr    (lsu_ifu_asi_addr[17:0]),
                   .lsu_diagnstc_wr_addr_e(lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
                   .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                   .lsu_ifu_err_addr    (lsu_ifu_err_addr[47:4]),
                   .va_wtchpt_msk_match_m(va_wtchpt_msk_match_m),
                   .lsu_ldst_va_g       (lsu_ldst_va_g[7:0]),
                   .lsu_dp_ctl_reg0     (lsu_dp_ctl_reg0[5:0]),
                   .lsu_dp_ctl_reg1     (lsu_dp_ctl_reg1[5:0]),
                   .lsu_dp_ctl_reg2     (lsu_dp_ctl_reg2[5:0]),
                   .lsu_dp_ctl_reg3     (lsu_dp_ctl_reg3[5:0]),
                   .lsu_diagnstc_wr_way_e(lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
                   .lsu_diag_va_prty_invrt(lsu_diag_va_prty_invrt),
                   // Inputs
                   .rclk                (clk),                   // Templated
                   .rst_l               (dctl_rst_l),            // Templated
                   .se                  (se),
                   .async_tlb_index     (async_tlb_index[5:0]),
                   .lsu_dtlb_dmp_vld_e  (lsu_dtlb_dmp_vld_e),
                   .tlu_lsu_asi_m       (tlu_lsu_asi_m[7:0]),
                   .exu_tlu_wsr_data_m  (exu_tlu_wsr_data_m[7:0]),
                   .tlu_lsu_asi_update_g(tlu_lsu_asi_update_g),
                   .asi_state_wr_thrd   (asi_state_wr_thrd[3:0]),
                   .ifu_lsu_imm_asi_d   (ifu_lsu_imm_asi_d[7:0]),
                   .thread0_d           (thread0_d),
                   .thread1_d           (thread1_d),
                   .thread2_d           (thread2_d),
                   .thread3_d           (thread3_d),
                   .ifu_lsu_imm_asi_vld_d(ifu_lsu_imm_asi_vld_d),
                   .lsu_err_addr_sel    (lsu_err_addr_sel[2:0]),
                   .pctxt_state_wr_thrd (pctxt_state_wr_thrd[3:0]),
                   .sctxt_state_wr_thrd (sctxt_state_wr_thrd[3:0]),
                   .st_rs3_data_g       (st_rs3_data_g[32:0]),
                   .thread0_ctxt        (thread0_ctxt),
                   .thread1_ctxt        (thread1_ctxt),
                   .thread2_ctxt        (thread2_ctxt),
                   .thread3_ctxt        (thread3_ctxt),
                   .thread_pctxt        (thread_pctxt),
                   .thread_sctxt        (thread_sctxt),
                   .thread_actxt        (thread_actxt),
                   .thread_default      (thread_default),
                   .tlu_dtlb_tte_tag_w2 (tlu_dtlb_tte_tag_w2[12:0]),
                   .tlu_dtlb_tte_tag_b58t56(tlu_dtlb_tte_tag_w2[58:56]), // Templated
                   .thread0_g           (thread0_g),
                   .thread1_g           (thread1_g),
                   .thread2_g           (thread2_g),
                   .thread3_g           (thread3_g),
                   .pid_state_wr_en     (pid_state_wr_en[3:0]),
                   .thread0_e           (thread0_e),
                   .thread1_e           (thread1_e),
                   .thread2_e           (thread2_e),
                   .thread3_e           (thread3_e),
                   .thread0_m           (lsu_dctldp_thread0_m),  // Templated
                   .thread1_m           (lsu_dctldp_thread1_m),  // Templated
                   .thread2_m           (lsu_dctldp_thread2_m),  // Templated
                   .thread3_m           (lsu_dctldp_thread3_m),  // Templated
                   .lsu_iobrdge_wr_data (lsu_iobrdge_wr_data[27:0]),
                   .dfture_tap_wr_mx_sel(dfture_tap_wr_mx_sel),
                   .lctl_rst            (lctl_rst[3:0]),
                   .lsu_ctl_state_wr_en (lsu_ctl_state_wr_en[3:0]),
                   .lsuctl_ctlbits_wr_en(lsuctl_ctlbits_wr_en[3:0]),
                   .dfture_tap_rd_en    (dfture_tap_rd_en[3:0]),
                   .bist_tap_wr_en      (bist_tap_wr_en),
                   .bist_ctl_reg_out    (bist_ctl_reg_out[`L1D_ADDRESS_HI:0]),
                   .mrgn_tap_wr_en      (mrgn_tap_wr_en),
                   .ldiagctl_wr_en      (ldiagctl_wr_en),
                   .misc_ctl_sel_din    (misc_ctl_sel_din[3:0]),
                   .lsu_asi_sel_fmx1    (lsu_asi_sel_fmx1[2:0]),
                   .lsu_asi_sel_fmx2    (lsu_asi_sel_fmx2[2:0]),
                   .exu_lsu_ldst_va_e   (exu_lsu_ldst_va_e[47:0]),
                   .tlb_access_en0_g    (tlb_access_en0_g),
                   .tlb_access_en1_g    (tlb_access_en1_g),
                   .tlb_access_en2_g    (tlb_access_en2_g),
                   .tlb_access_en3_g    (tlb_access_en3_g),
                   .tlb_access_sel_thrd0(tlb_access_sel_thrd0),
                   .tlb_access_sel_thrd1(tlb_access_sel_thrd1),
                   .tlb_access_sel_thrd2(tlb_access_sel_thrd2),
                   .tlb_access_sel_default(tlb_access_sel_default),
                   .mrgnctl_wr_en       (mrgnctl_wr_en),
                   .lsu_dcfill_addr_e   (lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]), // Templated
                   .lsu_error_pa_m      (lsu_error_pa_m[28:0]),
                   .stb_ldst_byte_msk   (stb_ldst_byte_msk[7:0]),
                   .lsu_diagnstc_va_sel (lsu_diagnstc_va_sel[3:0]),
                   .rst_tri_en          (mux_drive_disable),
                   
                   // .core_rtap_data          (core_rtap_data),
                   .rtap_core_val         (rtap_core_val),
                   .rtap_core_threadid         (rtap_core_threadid),
                   .rtap_core_id         (rtap_core_id),
                   .rtap_core_data         (rtap_core_data)
                   );     // Templated
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*
lsu_dctl AUTO_TEMPLATE (
               .rst_tri_en           (mux_drive_disable),
               .stb_cam_hit             (stb_cam_hit_bf1),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1),
               .bistctl_wr_en           (),
               .rclk                    (clk),
               .lsu_iobrdge_tap_rq_type_b8    (lsu_iobrdge_tap_rq_type[8:8]),
               .lsu_iobrdge_tap_rq_type_b6_b3 (lsu_iobrdge_tap_rq_type[6:3]),
               .lsu_iobrdge_tap_rq_type_b1_b0 (lsu_iobrdge_tap_rq_type[1:0]),

               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),
               .lsu_sscan_data		(lsu_sscan_data[14:13]),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf),
               .lsu_tte_data_cp_g	(tlb_rd_tte_data[`STLB_DATA_CP]),
               .st_inst_vld_e           (ifu_lsu_st_inst_e),
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]),
       	       .lsu_dfill_tid_e		      (dfq_tid[1:0]),
	             .tlb_pgnum		            ({tlb_pgnum_buf[39:10]}),
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]));

*/

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

              /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (thread1_m),
               .thread2_m               (),
               .thread3_m               (),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (lsu_dctldp_thread1_m),
               .lsu_dctldp_thread2_m    (),
               .lsu_dctldp_thread3_m    (),
               .thread0_g               (thread0_g),
               .thread1_g               (thread1_g),
               .thread2_g               (),
               .thread3_g               (),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (thread1_d),
               .thread2_d               (),
               .thread3_d               (),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (thread1_ctxt),
               .thread2_ctxt            (),
               .thread3_ctxt            (),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (thread1_e),
               .thread2_e               (),
               .thread3_e               (),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (tlb_access_en1_g),
               .tlb_access_en2_g        (),
               .tlb_access_en3_g        (),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           ({2'b00, lsu_stb_empty[1:0]}),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    ({2'b00, lsu_stb_rmo_st_issue[1:0]}),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (lsu_dp_ctl_reg1[5:0]),
               .lsu_dp_ctl_reg2         (6'b000000),
               .lsu_dp_ctl_reg3         (6'b000000),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq2_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq3_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

		      /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (),
               .thread2_m               (),
               .thread3_m               (),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (),
               .lsu_dctldp_thread2_m    (),
               .lsu_dctldp_thread3_m    (),
               .thread0_g               (thread0_g),
               .thread1_g               (),
               .thread2_g               (),
               .thread3_g               (),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (),
               .thread2_d               (),
               .thread3_d               (),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (),
               .thread2_ctxt            (),
               .thread3_ctxt            (),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (),
               .thread2_e               (),
               .thread3_e               (),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (),
               .tlb_access_en2_g        (),
               .tlb_access_en3_g        (),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           ({3'b000, lsu_stb_empty[0]}),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    ({3'b000, lsu_stb_rmo_st_issue[0]}),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (6'b000000),
               .lsu_dp_ctl_reg2         (6'b000000),
               .lsu_dp_ctl_reg3         (6'b000000),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq2_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq3_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );

`elsif THREADS_1

   lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

              /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (),
               .thread2_m               (),
               .thread3_m               (),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (),
               .lsu_dctldp_thread2_m    (),
               .lsu_dctldp_thread3_m    (),
               .thread0_g               (thread0_g),
               .thread1_g               (),
               .thread2_g               (),
               .thread3_g               (),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (),
               .thread2_d               (),
               .thread3_d               (),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (),
               .thread2_ctxt            (),
               .thread3_ctxt            (),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (),
               .thread2_e               (),
               .thread3_e               (),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (),
               .tlb_access_en2_g        (),
               .tlb_access_en3_g        (),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           ({3'b000, lsu_stb_empty[0]}),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    ({3'b000, lsu_stb_rmo_st_issue[0]}),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (6'b000000),
               .lsu_dp_ctl_reg2         (6'b000000),
               .lsu_dp_ctl_reg3         (6'b000000),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq2_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq3_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );

`elsif THREADS_2

   lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

              /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (thread1_m),
               .thread2_m               (),
               .thread3_m               (),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (lsu_dctldp_thread1_m),
               .lsu_dctldp_thread2_m    (),
               .lsu_dctldp_thread3_m    (),
               .thread0_g               (thread0_g),
               .thread1_g               (thread1_g),
               .thread2_g               (),
               .thread3_g               (),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (thread1_d),
               .thread2_d               (),
               .thread3_d               (),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (thread1_ctxt),
               .thread2_ctxt            (),
               .thread3_ctxt            (),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (thread1_e),
               .thread2_e               (),
               .thread3_e               (),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (tlb_access_en1_g),
               .tlb_access_en2_g        (),
               .tlb_access_en3_g        (),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           ({2'b00, lsu_stb_empty[1:0]}),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    ({2'b00, lsu_stb_rmo_st_issue[1:0]}),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (lsu_dp_ctl_reg1[5:0]),
               .lsu_dp_ctl_reg2         (6'b000000),
               .lsu_dp_ctl_reg3         (6'b000000),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq2_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq3_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );

`elsif THREADS_3

   lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

              /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (thread1_m),
               .thread2_m               (thread2_m),
               .thread3_m               (),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (lsu_dctldp_thread1_m),
               .lsu_dctldp_thread2_m    (lsu_dctldp_thread2_m),
               .lsu_dctldp_thread3_m    (),
               .thread0_g               (thread0_g),
               .thread1_g               (thread1_g),
               .thread2_g               (thread2_g),
               .thread3_g               (),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (thread1_d),
               .thread2_d               (thread2_d),
               .thread3_d               (),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (thread1_ctxt),
               .thread2_ctxt            (thread2_ctxt),
               .thread3_ctxt            (),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (thread1_e),
               .thread2_e               (thread2_e),
               .thread3_e               (),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (tlb_access_en1_g),
               .tlb_access_en2_g        (tlb_access_en2_g),
               .tlb_access_en3_g        (),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           ({1'b0, lsu_stb_empty[2:0]}),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    ({1'b0, lsu_stb_rmo_st_issue[2:0]}),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (lsu_dp_ctl_reg1[5:0]),
               .lsu_dp_ctl_reg2         (lsu_dp_ctl_reg2[5:0]),
               .lsu_dp_ctl_reg3         (6'b000000),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq2_pcx_pkt_way        (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq3_pcx_pkt_way        ({`L1D_WAY_WIDTH{1'b0}}),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );

`else // !`ifdef FPGA_SYN_1THREAD

lsu_dctl dctl (
               .so                      (short_scan1_3),
               .si                      (short_scan1_2),

         .lsu_dtlb_cam_real_e     (lsu_dtlb_cam_real_e),

		      /*AUTOINST*/
               // Outputs
               .stb_ncache_pcx_rq_g     (stb_ncache_pcx_rq_g),
               .lsu_tlu_nucleus_ctxt_m  (lsu_tlu_nucleus_ctxt_m),
               .lsu_quad_word_access_g  (lsu_quad_word_access_g),
               .dctl_rst_l              (dctl_rst_l),
               .lsu_tlu_wsr_inst_e      (lsu_tlu_wsr_inst_e),
               .lsu_l2fill_fpld_e       (lsu_l2fill_fpld_e),
               .dva_vld_m_bf            (dva_vld_m_bf[`L1D_WAY_COUNT-1:0]),
               .lsu_no_spc_pref         (lsu_no_spc_pref[3:0]),
               .ifu_tlu_flush_fd_w      (ifu_tlu_flush_fd_w),
               .ifu_tlu_flush_fd2_w     (ifu_tlu_flush_fd2_w),
               .ifu_tlu_flush_fd3_w     (ifu_tlu_flush_fd3_w),
               .ifu_lsu_flush_w         (ifu_lsu_flush_w),
               .lsu_tlu_thrid_d         (lsu_tlu_thrid_d[1:0]),
               .lsu_diagnstc_data_sel   (lsu_diagnstc_data_sel[3:0]),
               .lsu_diagnstc_va_sel     (lsu_diagnstc_va_sel[3:0]),
               .lsu_err_addr_sel        (lsu_err_addr_sel[2:0]),
               .dva_bit_wr_en_e         (dva_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_wr_adr_e            (dva_wr_adr_e[`L1D_ADDRESS_HI:6]),
               .lsu_exu_ldst_miss_w2    (lsu_exu_ldst_miss_w2),
               .lsu_exu_dfill_vld_w2    (lsu_exu_dfill_vld_w2),
               .lsu_ffu_ld_vld          (lsu_ffu_ld_vld),
               .lsu_ld_miss_wb          (lsu_ld_miss_wb),
               .lsu_dtlb_bypass_e       (lsu_dtlb_bypass_e),
               .ld_pcx_pkt_g            (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
               .tlb_ldst_cam_vld        (tlb_ldst_cam_vld),
               .ldxa_internal           (ldxa_internal),
               .lsu_ifu_ldsta_internal_e(lsu_ifu_ldsta_internal_e),
               .lsu_ifu_ldst_cmplt      (lsu_ifu_ldst_cmplt[3:0]),
               .lsu_ifu_itlb_en         (lsu_ifu_itlb_en[3:0]),
               .lsu_ifu_icache_en       (lsu_ifu_icache_en[3:0]),
               .lmq_byp_data_en_w2      (lmq_byp_data_en_w2[3:0]),
               .lmq_byp_data_fmx_sel    (lmq_byp_data_fmx_sel[3:0]),
               .lmq_byp_data_mxsel0     (lmq_byp_data_mxsel0[3:0]),
               .lmq_byp_data_mxsel1     (lmq_byp_data_mxsel1[3:0]),
               .lmq_byp_data_mxsel2     (lmq_byp_data_mxsel2[3:0]),
               .lmq_byp_data_mxsel3     (lmq_byp_data_mxsel3[3:0]),
               .lmq_byp_ldxa_mxsel0     (lmq_byp_ldxa_mxsel0[2:0]),
               .lmq_byp_ldxa_mxsel1     (lmq_byp_ldxa_mxsel1[2:0]),
               .lmq_byp_ldxa_mxsel2     (lmq_byp_ldxa_mxsel2[2:0]),
               .lmq_byp_ldxa_mxsel3     (lmq_byp_ldxa_mxsel3[2:0]),
               .lsu_ld_thrd_byp_sel_e   (lsu_ld_thrd_byp_sel_e[2:0]),
               .dcache_byte_wr_en_e     (dcache_byte_wr_en_e[15:0]),
               .lsu_dcache_wr_vld_e     (lsu_dcache_wr_vld_e),
               .lsu_ldstub_g            (lsu_ldstub_g),
               .lsu_swap_g              (lsu_swap_g),
               .lsu_tlu_dtlb_done       (lsu_tlu_dtlb_done),
               .lsu_exu_thr_m           (lsu_exu_thr_m[1:0]),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .lsu_dtagv_wr_vld_e      (lsu_dtagv_wr_vld_e),
               .lsu_dtag_wrreq_x_e      (lsu_dtag_wrreq_x_e),
               .lsu_dtag_index_sel_x_e  (lsu_dtag_index_sel_x_e),
               .lsu_dtlb_wr_vld_e       (lsu_dtlb_wr_vld_e),
               .lsu_dtlb_tag_rd_e       (lsu_dtlb_tag_rd_e),
               .lsu_dtlb_data_rd_e      (lsu_dtlb_data_rd_e),
                `ifndef NO_RTL_CSM
                .csm_rd_vld_g           (csm_rd_vld_g),
                .lsu_tlb_csm_rd_vld_g   (lsu_tlb_csm_rd_vld_g),
                .lsu_dtlb_csm_rd_e      (lsu_dtlb_csm_rd_e),
                .lsu_blkst_csm_m        (lsu_blkst_csm_m),
                `endif
               .lsu_dtlb_dmp_vld_e      (lsu_dtlb_dmp_vld_e),
               .lsu_dtlb_dmp_all_e      (lsu_dtlb_dmp_all_e),
               .lsu_dtlb_rwindex_vld_e  (lsu_dtlb_rwindex_vld_e),
               .lsu_dtlb_invalid_all_l_m(lsu_dtlb_invalid_all_l_m),
               .lsu_tlu_tlb_ld_inst_m   (lsu_tlu_tlb_ld_inst_m),
               .lsu_tlu_tlb_st_inst_m   (lsu_tlu_tlb_st_inst_m),
               .lsu_tlu_tlb_access_tid_m(lsu_tlu_tlb_access_tid_m[1:0]),
               .lsu_tlb_data_rd_vld_g   (lsu_tlb_data_rd_vld_g),
               .lsu_tlb_st_sel_m        (lsu_tlb_st_sel_m[3:0]),
               .lsu_va_wtchpt0_wr_en_l  (lsu_va_wtchpt0_wr_en_l),
               .lsu_va_wtchpt1_wr_en_l  (lsu_va_wtchpt1_wr_en_l),
               .lsu_va_wtchpt2_wr_en_l  (lsu_va_wtchpt2_wr_en_l),
               .lsu_va_wtchpt3_wr_en_l  (lsu_va_wtchpt3_wr_en_l),
               .thread0_m               (thread0_m),
               .thread1_m               (thread1_m),
               .thread2_m               (thread2_m),
               .thread3_m               (thread3_m),
               .lsu_dctldp_thread0_m    (lsu_dctldp_thread0_m),
               .lsu_dctldp_thread1_m    (lsu_dctldp_thread1_m),
               .lsu_dctldp_thread2_m    (lsu_dctldp_thread2_m),
               .lsu_dctldp_thread3_m    (lsu_dctldp_thread3_m),
               .thread0_g               (thread0_g),
               .thread1_g               (thread1_g),
               .thread2_g               (thread2_g),
               .thread3_g               (thread3_g),
               .lsu_tlu_nonalt_ldst_m   (lsu_tlu_nonalt_ldst_m),
               .lsu_tlu_xslating_ldst_m (lsu_tlu_xslating_ldst_m),
               .lsu_tlu_ctxt_sel_m      (lsu_tlu_ctxt_sel_m[2:0]),
               .lsu_tlu_write_op_m      (lsu_tlu_write_op_m),
               .lsu_dtlb_addr_mask_l_e  (lsu_dtlb_addr_mask_l_e),
               .dva_din_e               (dva_din_e),
               .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
               .lsu_ifu_asi_load        (lsu_ifu_asi_load),
               .lsu_ifu_asi_thrid       (lsu_ifu_asi_thrid[1:0]),
               .lsu_ifu_asi_vld         (lsu_ifu_asi_vld),
               .lsu_quad_asi_e          (lsu_quad_asi_e),
               .lsu_local_ldxa_sel_g    (lsu_local_ldxa_sel_g),
               .lsu_dtag_rsel_m         (lsu_dtag_rsel_m[3:0]),
               .lsu_tlbop_force_swo     (lsu_tlbop_force_swo),
               .lsu_atomic_pkt2_bsel_g  (lsu_atomic_pkt2_bsel_g[2:0]),
               .lsu_dcache_tag_perror_g (lsu_dcache_tag_perror_g),
               .lsu_dcache_data_perror_g(lsu_dcache_data_perror_g),
               .lsu_ifu_l2_unc_error    (lsu_ifu_l2_unc_error),
               .lsu_ifu_l2_corr_error   (lsu_ifu_l2_corr_error),
               .lsu_ifu_dcache_data_perror(lsu_ifu_dcache_data_perror),
               .lsu_ifu_dcache_tag_perror(lsu_ifu_dcache_tag_perror),
               .lsu_ifu_error_tid       (lsu_ifu_error_tid[1:0]),
               .lsu_ifu_io_error        (lsu_ifu_io_error),
               .lsu_tlu_squash_va_oor_m (lsu_tlu_squash_va_oor_m),
               .lsu_squash_va_oor_m     (lsu_squash_va_oor_m),
               .tlb_cam_hit_g           (tlb_cam_hit_g),
               .lsu_st_hw_le_g          (lsu_st_hw_le_g),
               .lsu_st_w_or_dbl_le_g    (lsu_st_w_or_dbl_le_g),
               .lsu_st_x_le_g           (lsu_st_x_le_g),
               .lsu_swap_sel_default_g  (lsu_swap_sel_default_g),
               .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
               .lsu_st_rmo_m            (lsu_st_rmo_m),
               .lsu_bst_in_pipe_m       (lsu_bst_in_pipe_m),
               .lsu_snap_blk_st_m       (lsu_snap_blk_st_m),
               .lsu_blk_st_m            (lsu_blk_st_m),
               .lsu_blkst_pgnum_m       (lsu_blkst_pgnum_m[39:10]),
               .lsu_ffu_blk_asi_e       (lsu_ffu_blk_asi_e),
               .lsu_blk_asi_m           (lsu_blk_asi_m),
               .lsu_nonalt_nucl_access_m(lsu_nonalt_nucl_access_m),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e),
               .dcache_alt_mx_sel_e_bf  (dcache_alt_mx_sel_e_bf),
               .dcache_rvld_e           (dcache_rvld_e),
               .lsu_dc_iob_access_e     (lsu_dc_iob_access_e),
               .lsu_ifu_ldst_miss_w     (lsu_ifu_ldst_miss_w),
               .lsu_ifu_dc_parity_error_w2(lsu_ifu_dc_parity_error_w2),
               .lsu_ldst_inst_vld_e     (lsu_ldst_inst_vld_e),
               .lsu_local_ldxa_tlbrd_sel_g(lsu_local_ldxa_tlbrd_sel_g),
               .lsu_local_diagnstc_tagrd_sel_g(lsu_local_diagnstc_tagrd_sel_g),
               .lsu_va_wtchpt_sel_g     (lsu_va_wtchpt_sel_g),
               .asi_state_wr_thrd       (asi_state_wr_thrd[3:0]),
               .thread0_d               (thread0_d),
               .thread1_d               (thread1_d),
               .thread2_d               (thread2_d),
               .thread3_d               (thread3_d),
               .tlu_lsu_asi_update_g    (tlu_lsu_asi_update_g),
               .pctxt_state_wr_thrd     (pctxt_state_wr_thrd[3:0]),
               .sctxt_state_wr_thrd     (sctxt_state_wr_thrd[3:0]),
               .thread_pctxt            (thread_pctxt),
               .thread_sctxt            (thread_sctxt),
               .thread_actxt            (thread_actxt),
               .thread_default          (thread_default),
               .thread0_ctxt            (thread0_ctxt),
               .thread1_ctxt            (thread1_ctxt),
               .thread2_ctxt            (thread2_ctxt),
               .thread3_ctxt            (thread3_ctxt),
               .pid_state_wr_en         (pid_state_wr_en[3:0]),
               .thread0_e               (thread0_e),
               .thread1_e               (thread1_e),
               .thread2_e               (thread2_e),
               .thread3_e               (thread3_e),
               .dfture_tap_wr_mx_sel    (dfture_tap_wr_mx_sel),
               .lctl_rst                (lctl_rst[3:0]),
               .lsu_ctl_state_wr_en     (lsu_ctl_state_wr_en[3:0]),
               .lsuctl_ctlbits_wr_en    (lsuctl_ctlbits_wr_en[3:0]),
               .dfture_tap_rd_en        (dfture_tap_rd_en[3:0]),
               .bist_tap_wr_en          (bist_tap_wr_en),
               .bistctl_wr_en           (),                      // Templated
               .bist_ctl_reg_wr_en      (bist_ctl_reg_wr_en),
               .mrgn_tap_wr_en          (mrgn_tap_wr_en),
               .ldiagctl_wr_en          (ldiagctl_wr_en),
               .misc_ctl_sel_din        (misc_ctl_sel_din[3:0]),
               .lsu_asi_sel_fmx1        (lsu_asi_sel_fmx1[2:0]),
               .lsu_asi_sel_fmx2        (lsu_asi_sel_fmx2[2:0]),
               .tlb_access_en0_g        (tlb_access_en0_g),
               .tlb_access_en1_g        (tlb_access_en1_g),
               .tlb_access_en2_g        (tlb_access_en2_g),
               .tlb_access_en3_g        (tlb_access_en3_g),
               .tlb_access_sel_thrd0    (tlb_access_sel_thrd0),
               .tlb_access_sel_thrd1    (tlb_access_sel_thrd1),
               .tlb_access_sel_thrd2    (tlb_access_sel_thrd2),
               .tlb_access_sel_default  (tlb_access_sel_default),
               .mrgnctl_wr_en           (mrgnctl_wr_en),
               .hpv_priv_m              (hpv_priv_m),
               .hpstate_en_m            (hpstate_en_m),
               .dcache_arry_data_sel_m  (dcache_arry_data_sel_m),
               .dtlb_bypass_m           (dtlb_bypass_m),
               .lsu_alt_space_m         (lsu_alt_space_m),
               .atomic_m                (atomic_m),
               .ldst_dbl_m              (ldst_dbl_m),
               .fp_ldst_m               (fp_ldst_m),
               .lda_internal_m          (lda_internal_m),
               .sta_internal_m          (sta_internal_m),
               .cam_real_m              (cam_real_m),
               .data_rd_vld_g           (data_rd_vld_g),
               .tag_rd_vld_g            (tag_rd_vld_g),
               .ldst_sz_m               (ldst_sz_m[1:0]),
               .asi_internal_m          (asi_internal_m),
               .rd_only_ltlb_asi_e      (rd_only_ltlb_asi_e),
               .wr_only_ltlb_asi_e      (wr_only_ltlb_asi_e),
               .dfill_tlb_asi_e         (dfill_tlb_asi_e),
               .ifill_tlb_asi_e         (ifill_tlb_asi_e),
               .nofault_asi_m           (nofault_asi_m),
               .as_if_user_asi_m        (as_if_user_asi_m),
               .atomic_asi_m            (atomic_asi_m),
               .phy_use_ec_asi_m        (phy_use_ec_asi_m),
               .phy_byp_ec_asi_m        (phy_byp_ec_asi_m),
               .quad_asi_m              (quad_asi_m),
               .binit_quad_asi_m        (binit_quad_asi_m),
               .blk_asi_m               (blk_asi_m),
               .recognized_asi_m        (recognized_asi_m),
               .strm_asi_m              (strm_asi_m),
               .mmu_rd_only_asi_m       (mmu_rd_only_asi_m),
               .rd_only_asi_m           (rd_only_asi_m),
               .wr_only_asi_m           (wr_only_asi_m),
               .unimp_asi_m             (unimp_asi_m),
               .va_wtchpt_cmp_en_m      (va_wtchpt_cmp_en_m),
               .lsu_tlu_async_ttype_vld_w2(lsu_tlu_async_ttype_vld_w2),
               .lsu_tlu_async_ttype_w2  (lsu_tlu_async_ttype_w2[6:0]),
               .lsu_tlu_async_tid_w2    (lsu_tlu_async_tid_w2[1:0]),
               .async_tlb_index         (async_tlb_index[5:0]),
               .l2fill_vld_m            (l2fill_vld_m),
               .ld_thrd_byp_mxsel_m     (ld_thrd_byp_mxsel_m[3:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .lsu_tlb_asi_data_perr_g (lsu_tlb_asi_data_perr_g),
               .lsu_tlb_asi_tag_perr_g  (lsu_tlb_asi_tag_perr_g),
               .lsu_sscan_data          (lsu_sscan_data[14:13]), // Templated
               .lsu_ld_inst_vld_g       (lsu_ld_inst_vld_g[3:0]),
               .lsu_dcache_rand         (lsu_dcache_rand[1:0]),
               .lsu_encd_way_hit        (lsu_encd_way_hit[1:0]),
               .lsu_way_hit_or          (lsu_way_hit_or),
               .lsu_memref_m            (lsu_memref_m),
               .lsu_flsh_inst_m         (lsu_flsh_inst_m),
               .lsu_ifu_asi_data_en_l   (lsu_ifu_asi_data_en_l),
               .lsu_dcache_fill_addr_e  (lsu_dcache_fill_addr_e[`L1D_ADDRESS_HI:3]),
               .lsu_dcache_fill_addr_e_err(lsu_dcache_fill_addr_e_err[`L1D_ADDRESS_HI:4]),
               .lsu_thread_g            (lsu_thread_g[3:0]),
               .lmq_ldd_vld             (lmq_ldd_vld),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .lsu_dcache_fill_way_e   (lsu_dcache_fill_way_e[`L1D_WAY_COUNT-1:0]),
               .lmq_ld_addr_b3          (lmq_ld_addr_b3),
               .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3:0]),
               .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
               // Inputs
               .se                      (se),
               .sehold                  (sehold),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .rclk                    (clk),                   // Templated
               .grst_l                  (grst_l),
               .arst_l                  (arst_l),
               .lsu_diag_va_prty_invrt  (lsu_diag_va_prty_invrt),
               .dva_svld_e              (dva_svld_e),
               .dva_snp_bit_wr_en_e     (dva_snp_bit_wr_en_e[`L1D_VAL_ARRAY_HI:0]),
               .dva_snp_addr_e          (dva_snp_addr_e[`L1D_ADDRESS_HI-6:0]),
               .lsu_tte_data_cp_g       (tlb_rd_tte_data[`STLB_DATA_CP]), // Templated
               .lsu_l2fill_vld          (lsu_l2fill_vld),
               .ld_inst_vld_e           (ifu_lsu_ld_inst_e),     // Templated
               .st_inst_vld_e           (ifu_lsu_st_inst_e),     // Templated
               .ifu_lsu_ldst_fp_e       (ifu_lsu_ldst_fp_e),
               .ldst_sz_e               (ifu_lsu_ldst_size_e[1:0]), // Templated
               .lsu_ldst_va_b12_b11_m   (lsu_ldst_va_m[12:11]),  // Templated
               .lsu_ldst_va_b7_b0_m     (lsu_ldst_va_m[7:0]),    // Templated
               .ifu_lsu_rd_e            (ifu_lsu_rd_e[4:0]),
               .tlb_cam_hit             (tlb_cam_hit),
               .ifu_tlu_sraddr_d        (ifu_tlu_sraddr_d[6:0]),
               .ifu_tlu_wsr_inst_d      (ifu_tlu_wsr_inst_d),
               .ifu_lsu_alt_space_d     (ifu_lsu_alt_space_d),
               .tlu_lsu_int_ldxa_vld_w2 (tlu_lsu_int_ldxa_vld_w2),
               .tlu_lsu_int_ld_ill_va_w2(tlu_lsu_int_ld_ill_va_w2),
               .tlu_lsu_ldxa_tid_w2     (tlu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_ldxa_data_vld_w2(ifu_lsu_ldxa_data_vld_w2),
               .ifu_lsu_ldxa_illgl_va_w2(ifu_lsu_ldxa_illgl_va_w2),
               .ifu_lsu_ldxa_tid_w2     (ifu_lsu_ldxa_tid_w2[1:0]),
               .ifu_lsu_asi_rd_unc      (ifu_lsu_asi_rd_unc),
               .tlu_lsu_tl_zero         (tlu_lsu_tl_zero[3:0]),
               .ifu_lsu_thrid_s         (ifu_lsu_thrid_s[1:0]),
               .ifu_lsu_ldst_dbl_e      (ifu_lsu_ldst_dbl_e),
               .ld_stb_full_raw_w2      (ld_stb_full_raw_w2),
               .ld_sec_active           (ld_sec_active),
               .ifu_tlu_inst_vld_m      (ifu_tlu_inst_vld_m_bf1), // Templated
               .lsu_l2fill_bendian_m    (lsu_l2fill_bendian_m),
               .lmq0_l2fill_fpld        (lmq0_l2fill_fpld),
               .lmq1_l2fill_fpld        (lmq1_l2fill_fpld),
               .lmq2_l2fill_fpld        (lmq2_l2fill_fpld),
               .lmq3_l2fill_fpld        (lmq3_l2fill_fpld),
               .cache_way_hit_buf1      (cache_way_hit_buf1[`L1D_WAY_COUNT-1:0]),
               .cache_hit               (cache_hit),
               .lmq0_byp_misc_sz        (lmq0_byp_misc_sz[1:0]),
               .lmq1_byp_misc_sz        (lmq1_byp_misc_sz[1:0]),
               .lmq2_byp_misc_sz        (lmq2_byp_misc_sz[1:0]),
               .lmq3_byp_misc_sz        (lmq3_byp_misc_sz[1:0]),
               .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
               .lsu_l1hit_sign_extend_e (ifu_lsu_sign_ext_e),    // Templated
               .tlu_lsu_pstate_cle      (tlu_lsu_pstate_cle[3:0]),
               .tlu_lsu_pstate_am       (tlu_lsu_pstate_am[3:0]),
               .tlb_pgnum               ({tlb_pgnum_buf[39:10]}), // Templated
               .tlb_demap_nctxt         (tlu_dtlb_dmp_nctxt_g),  // Templated
               .tlb_demap_pctxt         (tlu_dtlb_dmp_pctxt_g),  // Templated
               .tlb_demap_sctxt         (tlu_dtlb_dmp_sctxt_g),  // Templated
               .tlb_demap_actxt         (tlu_dtlb_dmp_actxt_g),  // Templated
               .tlb_demap_thrid         (tlu_idtlb_dmp_thrid_g[1:0]), // Templated
               .ifu_lsu_casa_e          (ifu_lsu_casa_e),
               .ifu_lsu_ldstub_e        (ifu_lsu_ldstub_e),
               .ifu_lsu_swap_e          (ifu_lsu_swap_e),
               .lsu_atm_st_cmplt_e      (lsu_atm_st_cmplt_e),
               .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
               .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
               .spu_lsu_ldxa_illgl_va_w2(spu_lsu_ldxa_illgl_va_w2),
               .spu_lsu_ldxa_tid_w2     (spu_lsu_ldxa_tid_w2[1:0]),
               .spu_lsu_stxa_ack_tid    (spu_lsu_stxa_ack_tid[1:0]),
               .spu_lsu_stxa_ack        (spu_lsu_stxa_ack),
               .spu_lsu_unc_error_w2    (spu_lsu_unc_error_w2),
               .spu_lsu_int_w2          (spu_lsu_int_w2),
               .tlu_lsu_stxa_ack        (tlu_lsu_stxa_ack),
               .tlu_lsu_stxa_ack_tid    (tlu_lsu_stxa_ack_tid[1:0]),
               .lsu_tlb_invert_endian_g (tlb_rd_tte_data_ie_buf), // Templated
               .lmq0_ncache_ld          (lmq0_ncache_ld),
               .lmq1_ncache_ld          (lmq1_ncache_ld),
               .lmq2_ncache_ld          (lmq2_ncache_ld),
               .lmq3_ncache_ld          (lmq3_ncache_ld),
               .ifu_tlu_mb_inst_e       (ifu_tlu_mb_inst_e),
               .ifu_tlu_flsh_inst_e     (ifu_tlu_flsh_inst_e),
               .lsu_stb_empty           (lsu_stb_empty[3:0]),
               .tlu_dtlb_tag_rd_g       (tlu_dtlb_tag_rd_g),
               .tlu_dtlb_data_rd_g      (tlu_dtlb_data_rd_g),
                `ifndef NO_RTL_CSM
                .tlu_dtlb_csm_rd_g      (tlu_dtlb_csm_rd_g),
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                `endif
               .tlu_dtlb_dmp_vld_g      (tlu_dtlb_dmp_vld_g),
               .tlu_dtlb_dmp_all_g      (tlu_dtlb_dmp_all_g),
               .tlu_dtlb_rw_index_vld_g (tlu_dtlb_rw_index_vld_g),
               .tlu_dtlb_invalidate_all_g(tlu_dtlb_invalidate_all_g),
               .lsu_st_wr_dcache        (lsu_st_wr_dcache),
               .tlu_lsu_asi_update_m    (tlu_lsu_asi_update_m),
               .tlu_lsu_tid_m           (tlu_lsu_tid_m[1:0]),
               .lsu_rd_dtag_parity_g    (lsu_rd_dtag_parity_g[`L1D_WAY_ARRAY_MASK]),
               .dcache_rparity_err_wb   (dcache_rparity_err_wb),
               .lsu_diagnstc_wr_data_b0 (lsu_diagnstc_wr_data_b0),
               .lsu_byp_ldd_oddrd_m     (lsu_byp_ldd_oddrd_m),
               .tlu_lsu_redmode         (tlu_lsu_redmode[3:0]),
               .tlu_lsu_redmode_rst_d1  (tlu_lsu_redmode_rst_d1[3:0]),
               .dva_vld_m               (dva_vld_m[`L1D_WAY_COUNT-1:0]),
               .lsu_dfill_tid_e         (dfq_tid[1:0]),          // Templated
               .ifu_lsu_asi_ack         (ifu_lsu_asi_ack),
               .lsu_intrpt_cmplt        (lsu_intrpt_cmplt[3:0]),
               .lsu_iobrdge_tap_rq_type_b8(lsu_iobrdge_tap_rq_type[8:8]), // Templated
               .lsu_iobrdge_tap_rq_type_b6_b3(lsu_iobrdge_tap_rq_type[6:3]), // Templated
               .lsu_iobrdge_tap_rq_type_b1_b0(lsu_iobrdge_tap_rq_type[1:0]), // Templated
               .lsu_iobrdge_fwd_pkt_vld (lsu_iobrdge_fwd_pkt_vld),
               .lsu_cpx_ld_dtag_perror_e(lsu_cpx_ld_dtag_perror_e),
               .lsu_cpx_ld_dcache_perror_e(lsu_cpx_ld_dcache_perror_e),
               .lsu_cpx_pkt_ld_err      (lsu_cpx_pkt_ld_err[1:0]),
               .ifu_lsu_nceen           (ifu_lsu_nceen[3:0]),
               .tlu_lsu_ldxa_async_data_vld(tlu_lsu_ldxa_async_data_vld),
               .tlu_lsu_hpv_priv        (tlu_lsu_hpv_priv[3:0]),
               .tlu_lsu_hpstate_en      (tlu_lsu_hpstate_en[3:0]),
               .ifu_lsu_memref_d        (ifu_lsu_memref_d),
               .ifu_lsu_pref_inst_e     (ifu_lsu_pref_inst_e),
               .lsu_pref_pcx_req        (lsu_pref_pcx_req),
               .lsu_cpx_pkt_prefetch2   (lsu_cpx_pkt_prefetch2),
               .lsu_ld_pcx_rq_sel_d2    (lsu_ld_pcx_rq_sel_d2[3:0]),
               .lsu_pcx_req_squash_d1   (lsu_pcx_req_squash_d1),
               .lsu_bld_helper_cmplt_m  (lsu_bld_helper_cmplt_m),
               .lsu_bld_cnt_m           (lsu_bld_cnt_m[2:0]),
               .lsu_bld_reset           (lsu_bld_reset),
               .ffu_lsu_blk_st_e        (ffu_lsu_blk_st_e),
               .lsu_stb_rmo_st_issue    (lsu_stb_rmo_st_issue[3:0]),
               .lsu_cpx_rmo_st_ack      (lsu_cpx_rmo_st_ack[3:0]),
               .lsu_dfq_flsh_cmplt      (lsu_dfq_flsh_cmplt[3:0]),
               .stb_cam_hit             (stb_cam_hit_bf1),       // Templated
               .ifu_tlu_flush_m         (ifu_tlu_flush_m),
               .ctu_sscan_tid           (ctu_sscan_tid[3:0]),
               .tte_data_perror_unc     (tte_data_perror_unc),
               .asi_tte_data_perror     (asi_tte_data_perror),
               .asi_tte_tag_perror      (asi_tte_tag_perror),
               .tlu_dtlb_rw_index_g     (tlu_dtlb_rw_index_g[5:0]),
               .lsu_local_early_flush_g (lsu_local_early_flush_g),
               .lsu_dfq_vld             (lsu_dfq_vld),
               .gdbginit_l              (gdbginit_l),
               .dc_direct_map           (dc_direct_map),
               .asi_d                   (asi_d[7:0]),
               .lsu_dctl_asi_state_m    (lsu_dctl_asi_state_m[7:0]),
               .lsu_ldst_va_g           (lsu_ldst_va_g[7:0]),
               .lsu_ifu_err_addr_b39    (lsu_ifu_err_addr[39]),  // Templated
               .lsu_dp_ctl_reg0         (lsu_dp_ctl_reg0[5:0]),
               .lsu_dp_ctl_reg1         (lsu_dp_ctl_reg1[5:0]),
               .lsu_dp_ctl_reg2         (lsu_dp_ctl_reg2[5:0]),
               .lsu_dp_ctl_reg3         (lsu_dp_ctl_reg3[5:0]),
               .ldd_in_dfq_out          (ldd_in_dfq_out),
               .dcache_iob_addr_e       (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
               .mbist_dcache_index      (mbist_dcache_index[`L1D_ADDRESS_HI-4:0]),
               .mbist_dcache_word       (mbist_dcache_word),
               .lsu_diagnstc_wr_addr_e  (lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0]),
               .st_dcfill_addr          (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
               .lsu_dfq_ld_vld          (lsu_dfq_ld_vld),
               .lsu_dfq_st_vld          (lsu_dfq_st_vld),
               .lmq0_ldd_vld            (lmq0_ldd_vld),
               .lmq1_ldd_vld            (lmq1_ldd_vld),
               .lmq2_ldd_vld            (lmq2_ldd_vld),
               .lmq3_ldd_vld            (lmq3_ldd_vld),
               .lsu_dfq_byp_tid         (lsu_dfq_byp_tid[1:0]),
               .dfq_byp_ff_en           (dfq_byp_ff_en),
               .lsu_dcache_iob_way_e    (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
               .mbist_dcache_way        (mbist_dcache_way[1:0]),
               .lsu_diagnstc_wr_way_e   (lsu_diagnstc_wr_way_e[`L1D_WAY_MASK]),
               .lsu_st_way_e            (lsu_st_way_e[`L1D_WAY_MASK]),
               .lmq0_pcx_pkt_way        (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq1_pcx_pkt_way        (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq2_pcx_pkt_way        (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq3_pcx_pkt_way        (lmq3_pcx_pkt_way[`L1D_WAY_MASK]),
               .lmq0_ld_rq_type         (lmq0_ld_rq_type[2:0]),
               .lmq1_ld_rq_type         (lmq1_ld_rq_type[2:0]),
               .lmq2_ld_rq_type         (lmq2_ld_rq_type[2:0]),
               .lmq3_ld_rq_type         (lmq3_ld_rq_type[2:0]),
               .lmq0_pcx_pkt_addr       (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq1_pcx_pkt_addr       (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq2_pcx_pkt_addr       (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lmq3_pcx_pkt_addr       (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
               .lsu_ttype_vld_m2        (lsu_ttype_vld_m2_bf1),  // Templated
               .tlu_early_flush_pipe2_w (tlu_early_flush_pipe2_w),
               .lsu_st_dcfill_size_e    (lsu_st_dcfill_size_e[1:0]),
               .mbist_dcache_write      (mbist_dcache_write),
               .mbist_dcache_read       (mbist_dcache_read),
               .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
               .cfg_asi_lsu_ldxa_tid_w2 (cfg_asi_lsu_ldxa_tid_w2)
               );
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*lsu_dcdp AUTO_TEMPLATE (
           .dcache_alt_mx_sel_e  (dcache_alt_mx_sel_e_bf),
           .rst_tri_en           (mux_drive_disable),
           .rclk                 (clk));
*/

lsu_dcdp dcdp (
               .so                      (scan0_2),
               .si                      (scan0_1),
                /*AUTOINST*/
               // Outputs
               .dcache_rdata_wb_buf     (dcache_rdata_wb_buf[63:0]),
               .mbist_dcache_data_in    (mbist_dcache_data_in[71:0]),
               .lsu_exu_dfill_data_w2   (lsu_exu_dfill_data_w2[63:0]),
               .lsu_ffu_ld_data         (lsu_ffu_ld_data[63:0]),
               .stb_rdata_ramc_buf      (stb_rdata_ramc_buf[14:9]),
               // Inputs
               .rclk                    (clk),                   // Templated
               .se                      (se),
               .rst_tri_en              (mux_drive_disable),     // Templated
               .dcache_rdata_wb         (dcache_rdata_wb[63:0]),
               .dcache_rparity_wb       (dcache_rparity_wb[7:0]),
                 .dcache_rdata_msb_m (dcache_rdata_msb_m),
                 // .dcache_rdata_msb_w0_m (dcache_rdata_msb_w0_m[7:0]),
                 // .dcache_rdata_msb_w1_m (dcache_rdata_msb_w1_m[7:0]),
                 // .dcache_rdata_msb_w2_m (dcache_rdata_msb_w2_m[7:0]),
                 // .dcache_rdata_msb_w3_m (dcache_rdata_msb_w3_m[7:0]),
               .lsu_bist_rsel_way_e     (lsu_bist_rsel_way_e[`L1D_WAY_COUNT-1:0]),
               .dcache_alt_mx_sel_e     (dcache_alt_mx_sel_e_bf), // Templated
               .cache_way_hit_buf2      (cache_way_hit_buf2[`L1D_WAY_COUNT-1:0]),
               .morphed_addr_m          (morphed_addr_m[7:0]),
               .signed_ldst_byte_m      (signed_ldst_byte_m),
               .signed_ldst_hw_m        (signed_ldst_hw_m),
               .signed_ldst_w_m         (signed_ldst_w_m),
               .merge7_sel_byte0_m      (merge7_sel_byte0_m),
               .merge7_sel_byte7_m      (merge7_sel_byte7_m),
               .merge6_sel_byte1_m      (merge6_sel_byte1_m),
               .merge6_sel_byte6_m      (merge6_sel_byte6_m),
               .merge5_sel_byte2_m      (merge5_sel_byte2_m),
               .merge5_sel_byte5_m      (merge5_sel_byte5_m),
               .merge4_sel_byte3_m      (merge4_sel_byte3_m),
               .merge4_sel_byte4_m      (merge4_sel_byte4_m),
               .merge3_sel_byte0_m      (merge3_sel_byte0_m),
               .merge3_sel_byte3_m      (merge3_sel_byte3_m),
               .merge3_sel_byte4_m      (merge3_sel_byte4_m),
               .merge3_sel_byte7_default_m(merge3_sel_byte7_default_m),
               .merge3_sel_byte_m       (merge3_sel_byte_m),
               .merge2_sel_byte1_m      (merge2_sel_byte1_m),
               .merge2_sel_byte2_m      (merge2_sel_byte2_m),
               .merge2_sel_byte5_m      (merge2_sel_byte5_m),
               .merge2_sel_byte6_default_m(merge2_sel_byte6_default_m),
               .merge2_sel_byte_m       (merge2_sel_byte_m),
               .merge0_sel_byte0_m      (merge0_sel_byte0_m),
               .merge0_sel_byte1_m      (merge0_sel_byte1_m),
               .merge0_sel_byte2_m      (merge0_sel_byte2_m),
               .merge0_sel_byte3_default_m(merge0_sel_byte3_default_m),
               .merge0_sel_byte4_m      (merge0_sel_byte4_m),
               .merge0_sel_byte5_m      (merge0_sel_byte5_m),
               .merge0_sel_byte6_m      (merge0_sel_byte6_m),
               .merge0_sel_byte7_default_m(merge0_sel_byte7_default_m),
               .merge1_sel_byte0_m      (merge1_sel_byte0_m),
               .merge1_sel_byte1_m      (merge1_sel_byte1_m),
               .merge1_sel_byte2_m      (merge1_sel_byte2_m),
               .merge1_sel_byte3_default_m(merge1_sel_byte3_default_m),
               .merge1_sel_byte4_m      (merge1_sel_byte4_m),
               .merge1_sel_byte5_m      (merge1_sel_byte5_m),
               .merge1_sel_byte6_m      (merge1_sel_byte6_m),
               .merge1_sel_byte7_default_m(merge1_sel_byte7_default_m),
               .merge0_sel_byte_1h_m    (merge0_sel_byte_1h_m),
               .merge1_sel_byte_1h_m    (merge1_sel_byte_1h_m),
               .merge1_sel_byte_2h_m    (merge1_sel_byte_2h_m),
               .stb_rdata_ramc          (stb_rdata_ramc[14:9]));

/*
bw_r_tlb  AUTO_TEMPLATE (
                 .rst_tri_en            (mem_write_disable),
                 .rclk                  (clk),
                 .adj                   (lsu_dtlb_mrgn[7:0]),
                 .cache_set_vld         (dva_vld_m[`L1D_WAY_COUNT-1:0]),
                 .grst_l                (1'b1), // hard reset not to be used
                 .rst_soft_l            (lsu_dtlb_invalid_all_l_m),
                 .hold              	(sehold),
                 .tlb_addr_mask_l       (lsu_dtlb_addr_mask_l_e),
                 .tlb_bypass            (lsu_dtlb_bypass_e),
                 .tlb_bypass_va         (exu_lsu_ldst_va_e[12:10]),
                 .tlb_cam_pid           (lsu_dtlb_cam_pid_e[2:0]),
                 //.tlb_cam_real          (lsu_dtlb_cam_real_e),
                 .tlb_cam_vld           (tlb_ldst_cam_vld),
                 .tlb_demap             (lsu_dtlb_dmp_vld_e),
                 .tlb_demap_all         (lsu_dtlb_dmp_all_e),
                 .tlb_demap_auto        (tlu_dtlb_dmp_actxt_g),
                 //.tlb_demap_ctxt        (tlu_dtlb_dmp_by_ctxt_g),
                 .tlb_demap_key         (tlu_idtlb_dmp_key_g[40:0]),
                 .tlb_rd_data_vld       (lsu_dtlb_data_rd_e),
                 .tlb_rd_tag_vld        (lsu_dtlb_tag_rd_e),
                 .tlb_rw_index          (tlu_dtlb_rw_index_g[5:0]),
                 .tlb_rw_index_vld      (lsu_dtlb_rwindex_vld_e),
                 .tlb_wr_tte_data       (tlu_dtlb_tte_data_w2[42:0]),
                 .tlb_wr_tte_tag        (tlu_dtlb_tte_tag_w2[58:0]),
                 .tlb_wr_vld            (lsu_dtlb_wr_vld_e),
                 .cache_ptag_w0   ({dtag_rdata_w0_m[28:0], lsu_ldst_va_m[10]}),
                 .cache_ptag_w1   ({dtag_rdata_w1_m[28:0], lsu_ldst_va_m[10]}),
                 .cache_ptag_w2   ({dtag_rdata_w2_m[28:0], lsu_ldst_va_m[10]}),
                 .cache_ptag_w3   ({dtag_rdata_w3_m[28:0], lsu_ldst_va_m[10]}));
*/

bw_r_dtlb dtlb  (
                .so                     (short_scan0_4),
                .si                     (short_scan0_3),
          .tlb_cam_key   ( {exu_lsu_ldst_va_e[47:28], 1'b1,
                            exu_lsu_ldst_va_e[27:22], 1'b1,
			                      exu_lsu_ldst_va_e[21:16], 1'b1,
                            exu_lsu_ldst_va_e[15:13], 1'b1,
                            //1'b1,
			                      lsu_dtlb_cam_real_e,
			                      lsu_dtlb_cam_real_e}
                          ),

                 /*AUTOINST*/
                // Outputs
                `ifndef NO_RTL_CSM
                .tlb_rd_tte_csm         (tlb_rd_tte_csm),
                .tlb_rd_tte_csm_crit    (tlb_rd_tte_csm_crit),
                `endif
                .tlb_rd_tte_tag         (tlb_rd_tte_tag[58:0]),
                .tlb_rd_tte_data        (tlb_rd_tte_data[42:0]),
                .tlb_pgnum              (tlb_pgnum[39:10]),
                .tlb_pgnum_crit         (tlb_pgnum_crit[39:10]),
                .tlb_cam_hit            (tlb_cam_hit),
                .cache_way_hit          (cache_way_hit[`L1D_WAY_COUNT-1:0]),
                .cache_hit              (cache_hit),

                // Inputs
                `ifndef NO_RTL_CSM
                .tlb_wr_tte_csm_thrid   (tlu_idtlb_dmp_thrid_g[1:0]),
                .tlb_wr_tte_csm         (tlu_dtlb_tte_csm_w2),
                .tlb_rd_csm_vld         (lsu_dtlb_csm_rd_e),
                .tlb_wr_csm_sel         (tlu_dtlb_wr_csm_sel_g),

                .cfg_csm_tlb_state      (cfg_lsu_csm_dtlb_state),
                .cfg_csm_tlb_chipid     (cfg_lsu_csm_dtlb_chipid),
                .cfg_csm_tlb_x          (cfg_lsu_csm_dtlb_x),
                .cfg_csm_tlb_y          (cfg_lsu_csm_dtlb_y),
                .cfg_csm_tlb_hdid       (cfg_lsu_csm_dtlb_hdid),
                .cfg_csm_tlb_hd_size    (cfg_lsu_csm_dtlb_hd_size),
                .cfg_csm_tlb_sdid       (cfg_lsu_csm_dtlb_sdid),
                .cfg_csm_tlb_lsid       (cfg_lsu_csm_dtlb_lsid),
                `endif


                .tlb_cam_vld            (tlb_ldst_cam_vld),      // Templated
                .tlb_cam_pid            (lsu_dtlb_cam_pid_e[2:0]), // Templated
                .tlb_demap_key          (tlu_idtlb_dmp_key_g[40:0]), // Templated
                .tlb_addr_mask_l        (lsu_dtlb_addr_mask_l_e), // Templated
                .tlb_ctxt               (tlb_ctxt[12:0]),
                .tlb_wr_vld             (lsu_dtlb_wr_vld_e),     // Templated
                .tlb_wr_tte_tag         (tlu_dtlb_tte_tag_w2[58:0]), // Templated
                .tlb_wr_tte_data        (tlu_dtlb_tte_data_w2[42:0]), // Templated
                .tlb_rd_tag_vld         (lsu_dtlb_tag_rd_e),     // Templated
                .tlb_rd_data_vld        (lsu_dtlb_data_rd_e),    // Templated
                .tlb_rw_index           (tlu_dtlb_rw_index_g[5:0]), // Templated
                .tlb_rw_index_vld       (lsu_dtlb_rwindex_vld_e), // Templated
                .tlb_demap              (lsu_dtlb_dmp_vld_e),    // Templated
                .tlb_demap_auto         (tlu_dtlb_dmp_actxt_g),  // Templated
                .tlb_demap_all          (lsu_dtlb_dmp_all_e),    // Templated
                .cache_ptag          ({lsu_ldst_va_m[10], dtag_rdata_m}), // Templated
                .cache_set_vld          (dva_vld_m[`L1D_WAY_COUNT-1:0]),        // Templated
                .tlb_bypass_va          (exu_lsu_ldst_va_e[12:10]), // Templated
                .tlb_bypass             (lsu_dtlb_bypass_e),     // Templated
                .se                     (se),
                .hold                   (sehold),                // Templated
                .adj                    (lsu_dtlb_mrgn[7:0]),    // Templated
                .arst_l                 (arst_l),
                .rst_soft_l             (lsu_dtlb_invalid_all_l_m), // Templated
                .rclk                   (clk),                   // Templated
                .rst_tri_en             (mem_write_disable));     // Templated
/*
lsu_stb_rwctl  AUTO_TEMPLATE  (
                         .rst_tri_en              (mux_drive_disable),
                         .rclk             (clk),
                         .stb_cam_hit      (stb_cam_hit_bf1),
 			                   .lsu_st_ack_rq_stb(4'b0000),
                         .ffu_lsu_blk_st_tid_m (ffu_lsu_data[77:76]),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]),
                         .st_inst_vld_e (ifu_lsu_st_inst_e),
                         .stb_rdata_ramc_b8t0 (stb_rdata_ramc[8:0]),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]));
*/
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                           .stb_ldst_byte_msk_min   (stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty ({2'b00, lsu_stb_empty[1:0]}),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                  		   .stb_ldst_byte_msk_min	(stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty ({3'b000, lsu_stb_empty[0]}),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));

`elsif THREADS_1

   lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                           .stb_ldst_byte_msk_min   (stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty ({3'b000, lsu_stb_empty[0]}),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));

`elsif THREADS_2

   lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                           .stb_ldst_byte_msk_min   (stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty ({2'b00, lsu_stb_empty[1:0]}),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));

`elsif THREADS_3

   lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                           .stb_ldst_byte_msk_min   (stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty ({1'b0, lsu_stb_empty[2:0]}),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));

`else

lsu_stb_rwctl stb_rwctl (
                         .so            (short_scan1_4),
                         .si            (short_scan1_3),
                         .stb_wdata_ramd_b75_b64(stb_wdata_ramd_b75_b64[75:64]),
                  		   .stb_ldst_byte_msk_min	(stb_ldst_byte_msk_min[7:0]),
                         /*AUTOINST*/
                         // Outputs
                         .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                         .stb_cam_wr_no_ivld_m(stb_cam_wr_no_ivld_m),
                         .ld_rawp_st_ced_w2(ld_rawp_st_ced_w2),
                         .stb_data_wr_ptr(stb_data_wr_ptr[4:0]),
                         .stb_data_wptr_vld(stb_data_wptr_vld),
                         .stb_data_rd_ptr(stb_data_rd_ptr[4:0]),
                         .stb_data_rptr_vld(stb_data_rptr_vld),
                         .stb_cam_cm_tid(stb_cam_cm_tid[1:0]),
                         .stb_ldst_byte_msk(stb_ldst_byte_msk[7:0]),
                         .stb_cam_rw_ptr(stb_cam_rw_ptr[4:0]),
                         .stb_cam_wptr_vld(stb_cam_wptr_vld),
                         .stb_cam_rptr_vld(stb_cam_rptr_vld),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ld_rawp_st_ackid_w2(ld_rawp_st_ackid_w2[2:0]),
                         .stb_flush_st_g(stb_flush_st_g[3:0]),
                         .stb_cam_wvld_m(stb_cam_wvld_m[3:0]),
                         .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .lsu_ldquad_inst_m(lsu_ldquad_inst_m),
                         .stb_thrd_en_g (stb_thrd_en_g[3:0]),
                         .flsh_inst_m   (flsh_inst_m),
                         .lsu_stb_va_m  (lsu_stb_va_m[9:3]),
                         .lsu_stb_empty_buf(lsu_stb_empty_buf[3:0]),
                         .lsu_spu_stb_empty(lsu_spu_stb_empty[3:0]),
                         .ifu_tlu_inst_vld_m_bf1(ifu_tlu_inst_vld_m_bf1),
                         .ifu_tlu_inst_vld_m_bf2(ifu_tlu_inst_vld_m_bf2),
                         .lsu_ifu_stbcnt0(lsu_ifu_stbcnt0[3:0]),
                         .lsu_ifu_stbcnt1(lsu_ifu_stbcnt1[3:0]),
                         .lsu_ifu_stbcnt2(lsu_ifu_stbcnt2[3:0]),
                         .lsu_ifu_stbcnt3(lsu_ifu_stbcnt3[3:0]),
                         .lsu_ffu_stb_full0(lsu_ffu_stb_full0),
                         .lsu_ffu_stb_full1(lsu_ffu_stb_full1),
                         .lsu_ffu_stb_full2(lsu_ffu_stb_full2),
                         .lsu_ffu_stb_full3(lsu_ffu_stb_full3),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .se            (se),
                         .ld_inst_vld_e (ifu_lsu_ld_inst_e),     // Templated
                         .ldst_sz_e     (ifu_lsu_ldst_size_e[1:0]), // Templated
                         .st_inst_vld_e (ifu_lsu_st_inst_e),     // Templated
                         .stb_pcx_rptr0 (stb_pcx_rptr0[2:0]),
                         .stb_wrptr0    (stb_wrptr0[2:0]),
                         .stb_pcx_rptr1 (stb_pcx_rptr1[2:0]),
                         .stb_wrptr1    (stb_wrptr1[2:0]),
                         .stb_pcx_rptr2 (stb_pcx_rptr2[2:0]),
                         .stb_wrptr2    (stb_wrptr2[2:0]),
                         .stb_pcx_rptr3 (stb_pcx_rptr3[2:0]),
                         .stb_wrptr3    (stb_wrptr3[2:0]),
                         .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
                         .stb_cam_hit   (stb_cam_hit_bf1),       // Templated
                         .lsu_ldst_va_m (lsu_ldst_va_m[9:0]),
                         .sta_internal_m(sta_internal_m),
                         .ifu_tlu_thrid_e(ifu_tlu_thrid_e[1:0]),
                         .tlu_exu_early_flush_pipe_w(tlu_exu_early_flush_pipe_w),
                         .lsu_ttype_vld_m2(lsu_ttype_vld_m2),
                         .ifu_lsu_flush_w(ifu_lsu_flush_w),
                         .lsu_defr_trp_taken_g(lsu_defr_trp_taken_g),
                         .ifu_lsu_casa_e(ifu_lsu_casa_e),
                         .ifu_lsu_ldstub_e(ifu_lsu_ldstub_e),
                         .ifu_lsu_swap_e(ifu_lsu_swap_e),
                         .ifu_lsu_ldst_dbl_e(ifu_lsu_ldst_dbl_e),
                         .stb_state_ced0(stb_state_ced0[7:0]),
                         .stb_state_ced1(stb_state_ced1[7:0]),
                         .stb_state_ced2(stb_state_ced2[7:0]),
                         .stb_state_ced3(stb_state_ced3[7:0]),
                         .stb_ld_full_raw(stb_ld_full_raw[7:0]),
                         .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                         .stb_wrptr0_prev(stb_wrptr0_prev[2:0]),
                         .stb_wrptr1_prev(stb_wrptr1_prev[2:0]),
                         .stb_wrptr2_prev(stb_wrptr2_prev[2:0]),
                         .stb_wrptr3_prev(stb_wrptr3_prev[2:0]),
                         .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
                         .ifu_lsu_ldst_fp_e(ifu_lsu_ldst_fp_e),
                         .lsu_quad_asi_e(lsu_quad_asi_e),
                         .lsu_st_rmo_m  (lsu_st_rmo_m),
                         .lsu_bst_in_pipe_m(lsu_bst_in_pipe_m),
                         .ffu_lsu_kill_fst_w(ffu_lsu_kill_fst_w),
                         .ffu_lsu_blk_st_e(ffu_lsu_blk_st_e),
                         .ffu_lsu_blk_st_tid_m(ffu_lsu_data[77:76]), // Templated
                         .ffu_lsu_blk_st_va_e(ffu_lsu_blk_st_va_e[5:3]),
                         .lsu_snap_blk_st_m(lsu_snap_blk_st_m),
                         .tlb_pgnum_b39_g(tlb_pgnum_buf[39]),    // Templated
                         .lsu_stb_empty (lsu_stb_empty[3:0]),
                         .ifu_tlu_flsh_inst_e(ifu_tlu_flsh_inst_e),
                         .stb_cam_mhit  (stb_cam_mhit),
                         .ifu_tlu_inst_vld_m(ifu_tlu_inst_vld_m),
                         .lsu_st_pcx_rq_pick(lsu_st_pcx_rq_pick[3:0]),
                         .lsu_st_pcx_rq_vld(lsu_st_pcx_rq_vld),
                         .stb_rdata_ramc_b8t0(stb_rdata_ramc[8:0]), // Templated
                         .lsu_stbcnt0   (lsu_stbcnt0[3:0]),
                         .lsu_stbcnt1   (lsu_stbcnt1[3:0]),
                         .lsu_stbcnt2   (lsu_stbcnt2[3:0]),
                         .lsu_stbcnt3   (lsu_stbcnt3[3:0]));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*
lsu_stb_rwdp AUTO_TEMPLATE (
      .rst_tri_en           (mux_drive_disable),
      .stb_rdata_ramd_b74     (stb_rdata_ramd[74]),
 			.rclk	(clk));
*/

lsu_stb_rwdp  stb_rwdp  (
                         .so            (so0),
                         .si            (scan0_2),
                         .lsu_stb_st_data_g(lsu_stb_st_data_g[63:0]),
                         /*AUTOINST*/
                         // Outputs
                         .stb_rdata_ramd_buf(stb_rdata_ramd_buf[69:0]),
                         .stb_rdata_ramd_b74_buf(stb_rdata_ramd_b74_buf),
                         // Inputs
                         .rclk          (clk),                   // Templated
                         .se            (se),
                         .rst_tri_en    (mux_drive_disable),     // Templated
                         .exu_lsu_rs3_data_e(exu_lsu_rs3_data_e[63:0]),
                         .lsu_stb_data_early_sel_e(lsu_stb_data_early_sel_e[3:0]),
                         .lsu_stb_data_final_sel_m(lsu_stb_data_final_sel_m),
                         .exu_lsu_rs2_data_e(exu_lsu_rs2_data_e[63:0]),
                         .lsu_st_sz_bhww_m(lsu_st_sz_bhww_m),
                         .lsu_st_sz_dw_m(lsu_st_sz_dw_m),
                         .lsu_st_sz_bhw_m(lsu_st_sz_bhw_m),
                         .lsu_st_sz_wdw_m(lsu_st_sz_wdw_m),
                         .lsu_st_sz_b_m (lsu_st_sz_b_m),
                         .lsu_st_sz_w_m (lsu_st_sz_w_m),
                         .lsu_st_sz_hw_m(lsu_st_sz_hw_m),
                         .lsu_st_sz_hww_m(lsu_st_sz_hww_m),
                         .ffu_lsu_data  (ffu_lsu_data[63:0]),
                         .lsu_st_hw_le_g(lsu_st_hw_le_g),
                         .lsu_st_w_or_dbl_le_g(lsu_st_w_or_dbl_le_g),
                         .lsu_st_x_le_g (lsu_st_x_le_g),
                         .lsu_swap_sel_default_g(lsu_swap_sel_default_g),
                         .lsu_swap_sel_default_byte_7_2_g(lsu_swap_sel_default_byte_7_2_g),
                         .stb_rdata_ramd(stb_rdata_ramd[69:0]),
                         .stb_rdata_ramd_b74(stb_rdata_ramd[74])); // Templated
/*
bw_r_scm  AUTO_TEMPLATE (
                         .rst_tri_en           (mem_write_disable),
                         .rclk            (clk),
                         .stb_quad_ld_cam (lsu_ldquad_inst_m),
                         .stb_alt_wr_data (lsu_blkst_pgnum_m[39:10]),
                         .stb_alt_wsel (lsu_blk_st_m),
                         .stb_cam_data  (tlb_pgnum_crit[39:10]),
                         .stb_cam_rw_tid(stb_cam_rw_ptr[4:3]));
*/

bw_r_scm   stb_cam   (
          .stb_camwr_data ({lsu_stb_va_m[9:3],stb_ldst_byte_msk_min[7:0]}),
          /*AUTOINST*/
                      // Outputs
                      `ifndef NO_RTL_CSM
                      .stb_rcsm_ramc    (stb_rcsm_ramc),
                      `endif
                      .stb_rdata_ramc   (stb_rdata_ramc[44:0]),
                      .stb_ld_full_raw  (stb_ld_full_raw[7:0]),
                      .stb_ld_partial_raw(stb_ld_partial_raw[7:0]),
                      .stb_cam_hit_ptr  (stb_cam_hit_ptr[2:0]),
                      .stb_cam_hit      (stb_cam_hit),
                      .stb_cam_mhit     (stb_cam_mhit),
                      // Inputs
                      `ifndef NO_RTL_CSM
                      .stb_cam_csm      (tlb_rd_tte_csm_crit),
                      .stb_alt_wr_csm   (lsu_blkst_csm_m),
                      `endif
                      .stb_cam_data     (tlb_pgnum_crit[39:10]), // Templated
                      .stb_alt_wr_data  (lsu_blkst_pgnum_m[39:10]), // Templated
                      .stb_alt_wsel     (lsu_blk_st_m),          // Templated
                      .stb_cam_vld      (stb_cam_vld),
                      .stb_cam_cm_tid   (stb_cam_cm_tid[1:0]),
                      .stb_cam_sqsh_msk (stb_cam_sqsh_msk[7:0]),
                      .stb_cam_rw_ptr   (stb_cam_rw_ptr[2:0]),
                      .stb_cam_wptr_vld (stb_cam_wptr_vld),
                      .stb_cam_rptr_vld (stb_cam_rptr_vld),
                      .stb_cam_rw_tid   (stb_cam_rw_ptr[4:3]),   // Templated
                      .stb_quad_ld_cam  (lsu_ldquad_inst_m),     // Templated
                      .rclk             (clk),                   // Templated
                      .rst_tri_en       (mem_write_disable));     // Templated
/*bw_r_rf32x80 AUTO_TEMPLATE (
                         .rst_tri_en           (mem_write_disable),
                         .dout   (stb_rdata_ramd[79:0]),
                         .wr_adr (stb_data_wr_ptr[4:0]),
                         .wr_en  (stb_data_wptr_vld),
                         .nib_wr_en ({20{1'b1}}),
                         .rd_adr (stb_data_rd_ptr[4:0]),
                         .rd_en  (stb_data_rptr_vld),
                         //.sehold (),
                         .reset_l(arst_l),
                         .rclk    (clk));

*/
bw_r_rf32x80 stb_data(
                      .din ({3'b0,stb_ncache_pcx_rq_g, stb_wdata_ramd_b75_b64[75:64], lsu_stb_st_data_g[63:0]}),
                      .so               (short_scan0_5),
                      .si               (short_scan0_4),
                      /*AUTOINST*/
                      // Outputs
                      .dout             (stb_rdata_ramd[79:0]),  // Templated
                      // Inputs
                      .rd_adr           (stb_data_rd_ptr[4:0]),  // Templated
                      .rd_en            (stb_data_rptr_vld),     // Templated
                      .wr_en            (stb_data_wptr_vld),     // Templated
                      .nib_wr_en        ({20{1'b1}}),            // Templated
                      .wr_adr           (stb_data_wr_ptr[4:0]),  // Templated
                      .rclk             (clk),                   // Templated
                      .reset_l          (arst_l),                // Templated
                      .rst_tri_en       (mem_write_disable),     // Templated
                      .sehold           (sehold),
                      .se               (se));
/*lsu_stb_ctl AUTO_TEMPLATE (
         .rclk             	(clk),
	 .st_dtlb_perr_g	(lsu_st_dtlb_perr_g[@]),
         .lsu_outstanding_rmo_st_max (lsu_outstanding_rmo_st_max[@]),
 	       .st_pcx_rq_kill_w2    (lsu_st_pcx_rq_kill_w2[@]),
      	 .flshinst_rst	       (lsu_dfq_flsh_cmplt[@]),
      	 .stb_rmo_st_issue     (lsu_stb_rmo_st_issue[@]),
         .lsu_stb_empty        (lsu_stb_empty[@]),
         .stb_l2bnk_addr       (stb@_l2b_addr[2:0]),
         .stb_atm_rq_type      (stb@_atm_rq_type[2:1]),
         .stb_wrptr            (stb_wrptr@[2:0]),
         .stb_wrptr_prev       (stb_wrptr@_prev[2:0]),
         .stb_state_ced_mod    (stb_state_ced@[7:0]),
         .stb_state_vld_out    (stb_state_vld@[7:0]),
         .stb_rd_for_pcx       (stb_rd_for_pcx[@]),
         .stb_dfq_rptr         (stb_dfq_rptr@[2:0]),
         .stb_pcx_rptr         (stb_pcx_rptr@[2:0]),
         .thrd_en_g            (stb_thrd_en_g[@]),
         .pcx_rq_for_stb       (pcx_rq_for_stb[@]),
         .stb_crnt_ack_id      (stb@_crnt_ack_id[2:0]),
         .lsu_stbcnt           (lsu_stbcnt@[3:0]),
         .pcx_req_squash       (lsu_pcx_req_squash@),
         .cpx_st_ack_tid       (cpx_st_ack_tid@),
         .st_ack_dq_stb        (lsu_st_ack_dq_stb[@]),
         .stb_cam_wvld_m       (stb_cam_wvld_m[@]),
         .stb_flush_st_g       (stb_flush_st_g[@]),
         .cpx_st_ack_tid       (cpx_st_ack_tid@),
	       .stb_full	           (lsu_tlu_stb_full_w2[@]),
         .tlb_pgnum_g          (tlb_pgnum_buf2[39:37]), // timing fix
	 .stb_alt_sel	       (lsu_blk_st_m),
	 .stb_alt_addr	       (lsu_blkst_pgnum_m[39:37]),
         .stb_clk_en_l         (stb@_clk_en_l[7:0]),
         .stb_non_l2bnk        (stb@_non_l2bnk),
         .stb_state_si_0       (stb@_state_si_0[3:2]),
         .stb_state_si_1       (stb@_state_si_1[3:2]),
         .stb_state_si_2       (stb@_state_si_2[3:2]),
         .stb_state_si_3       (stb@_state_si_3[3:2]),
         .stb_state_si_4       (stb@_state_si_4[3:2]),
         .stb_state_si_5       (stb@_state_si_5[3:2]),
         .stb_state_si_6       (stb@_state_si_6[3:2]),
         .stb_state_si_7       (stb@_state_si_7[3:2]),
         .stb_state_rtype_0    (stb@_state_rtype_0[2:1]),
         .stb_state_rtype_1    (stb@_state_rtype_1[2:1]),
         .stb_state_rtype_2    (stb@_state_rtype_2[2:1]),
         .stb_state_rtype_3    (stb@_state_rtype_3[2:1]),
         .stb_state_rtype_4    (stb@_state_rtype_4[2:1]),
         .stb_state_rtype_5    (stb@_state_rtype_5[2:1]),
         .stb_state_rtype_6    (stb@_state_rtype_6[2:1]),
         .stb_state_rtype_7    (stb@_state_rtype_7[2:1]),
         .stb_state_io         (stb@_state_io[7:0]),
         .stb_state_rmo        (stb@_state_rmo[7:0]));
*/

/*lsu_stb_ctldp AUTO_TEMPLATE (
         .rclk         	       (clk),
         .stb_clk_en_l         (stb@_clk_en_l[7:0]),
         .stb_non_l2bnk        (stb@_non_l2bnk),
         .stb_state_si_0       (stb@_state_si_0[3:2]),
         .stb_state_si_1       (stb@_state_si_1[3:2]),
         .stb_state_si_2       (stb@_state_si_2[3:2]),
         .stb_state_si_3       (stb@_state_si_3[3:2]),
         .stb_state_si_4       (stb@_state_si_4[3:2]),
         .stb_state_si_5       (stb@_state_si_5[3:2]),
         .stb_state_si_6       (stb@_state_si_6[3:2]),
         .stb_state_si_7       (stb@_state_si_7[3:2]),
         .stb_state_rtype_0    (stb@_state_rtype_0[2:1]),
         .stb_state_rtype_1    (stb@_state_rtype_1[2:1]),
         .stb_state_rtype_2    (stb@_state_rtype_2[2:1]),
         .stb_state_rtype_3    (stb@_state_rtype_3[2:1]),
         .stb_state_rtype_4    (stb@_state_rtype_4[2:1]),
         .stb_state_rtype_5    (stb@_state_rtype_5[2:1]),
         .stb_state_rtype_6    (stb@_state_rtype_6[2:1]),
         .stb_state_rtype_7    (stb@_state_rtype_7[2:1]),
         .stb_state_io         (stb@_state_io[7:0]),
         .stb_state_rmo        (stb@_state_rmo[7:0]));
*/

lsu_stb_ctl stb_ctl0  (
                       .so              (short_scan0_6),
                       .si              (short_scan0_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb0_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb0_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[0]),      // Templated
                       .stb_l2bnk_addr  (stb0_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb0_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr0[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[0]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr0[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr0_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced0[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld0[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt0[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[0]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[0]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[0]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[0]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid0),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[0]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[0]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[0]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[0]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash0),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[0]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb0_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb0_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb0_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb0_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb0_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb0_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb0_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb0_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb0_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb0_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb0_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb0_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb0_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb0_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb0_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb0_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb0_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[0]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[0])); // Templated
lsu_stb_ctldp stb_ctldp0  (
                           .so          (short_scan1_5),
                           .si          (short_scan1_4),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb0_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb0_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb0_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb0_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb0_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb0_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb0_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb0_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb0_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb0_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb0_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb0_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb0_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb0_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb0_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb0_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb0_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb0_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb1_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[1]),      // Templated
                       .stb_l2bnk_addr  (stb1_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb1_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr1[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[1]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr1[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr1_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced1[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld1[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt1[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[1]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[1]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[1]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[1]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid1),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[1]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[1]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[1]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[1]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash1),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[1]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb1_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb1_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb1_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb1_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb1_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb1_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb1_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb1_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb1_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[1]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[1])); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb1_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb1_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb1_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb1_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb1_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb1_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb1_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb1_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb1_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD


lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

   lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

   lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

`elsif THREADS_1

   lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

   lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

   lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

`elsif THREADS_2

   lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb1_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[1]),      // Templated
                       .stb_l2bnk_addr  (stb1_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb1_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr1[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[1]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr1[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr1_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced1[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld1[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt1[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[1]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[1]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[1]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[1]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid1),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[1]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[1]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[1]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[1]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash1),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[1]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb1_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb1_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb1_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb1_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb1_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb1_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb1_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb1_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb1_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[1]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[1])); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb1_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb1_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb1_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb1_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb1_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb1_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb1_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb1_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb1_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

`elsif THREADS_3

   lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb1_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[1]),      // Templated
                       .stb_l2bnk_addr  (stb1_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb1_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr1[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[1]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr1[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr1_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced1[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld1[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt1[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[1]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[1]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[1]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[1]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid1),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[1]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[1]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[1]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[1]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash1),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[1]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb1_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb1_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb1_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb1_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb1_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb1_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb1_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb1_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb1_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[1]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[1])); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb1_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb1_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb1_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb1_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb1_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb1_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb1_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb1_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb1_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb2_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[2]),      // Templated
                       .stb_l2bnk_addr  (stb2_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb2_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr2[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[2]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr2[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr2_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced2[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld2[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt2[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[2]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[2]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[2]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[2]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid2),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[2]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[2]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[2]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[2]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash2),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[2]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb2_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb2_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb2_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb2_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb2_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb2_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb2_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb2_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb2_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb2_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb2_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb2_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb2_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb2_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb2_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb2_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb2_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[2]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[2])); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb2_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb2_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb2_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb2_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb2_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb2_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb2_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb2_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb2_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb2_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb2_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb2_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb2_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb2_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb2_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb2_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb2_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (), // Templated
                       .lsu_stb_empty   (),      // Templated
                       .stb_l2bnk_addr  (),    // Templated
                       .stb_atm_rq_type (), // Templated
                       .stb_wrptr       (),       // Templated
                       .stb_rd_for_pcx  (),     // Templated
                       .stb_pcx_rptr    (),    // Templated
                       .stb_wrptr_prev  (),  // Templated
                       .stb_state_ced_mod(),  // Templated
                       .stb_state_vld_out(),  // Templated
                       .lsu_stbcnt      (),      // Templated
                       .stb_rmo_st_issue(), // Templated
                       .stb_full        (), // Templated
                       .st_pcx_rq_kill_w2(), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (1'b0),      // Templated
                       .cpx_st_ack_tid  (1'b0),       // Templated
                       .pcx_rq_for_stb  (1'b0),     // Templated
                       .st_ack_dq_stb   (1'b0),  // Templated
                       .stb_flush_st_g  (1'b0),     // Templated
                       .stb_cam_wvld_m  (1'b0),     // Templated
                       .lsu_blk_st_m    (1'b0),
                       .tlb_pgnum_g     (3'b000), // Templated
                       .pcx_req_squash  (1'b0),   // Templated
                       .flshinst_rst    (1'b0), // Templated
                       .lsu_stbctl_flush_pipe_w(1'b0),
                       .flsh_inst_m     (1'b0),
                       .stb_state_si_0  (2'b00),  // Templated
                       .stb_state_si_1  (2'b00),  // Templated
                       .stb_state_si_2  (2'b00),  // Templated
                       .stb_state_si_3  (2'b00),  // Templated
                       .stb_state_si_4  (2'b00),  // Templated
                       .stb_state_si_5  (2'b00),  // Templated
                       .stb_state_si_6  (2'b00),  // Templated
                       .stb_state_si_7  (2'b00),  // Templated
                       .stb_state_rtype_0(2'b00), // Templated
                       .stb_state_rtype_1(2'b00), // Templated
                       .stb_state_rtype_2(2'b00), // Templated
                       .stb_state_rtype_3(2'b00), // Templated
                       .stb_state_rtype_4(2'b00), // Templated
                       .stb_state_rtype_5(2'b00), // Templated
                       .stb_state_rtype_6(2'b00), // Templated
                       .stb_state_rtype_7(2'b00), // Templated
                       .stb_state_rmo   (8'h00),   // Templated
                       .stb_alt_sel     (1'b0),          // Templated
                       .stb_alt_addr    (3'b000), // Templated
                       .lsu_dtlb_bypass_e(1'b0),
                       .tlb_cam_hit     (1'b0),
                       .st_dtlb_perr_g  (1'b0), // Templated
                       .lsu_outstanding_rmo_st_max(1'b0)); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(), // Templated
                           .stb_state_si_1(), // Templated
                           .stb_state_si_2(), // Templated
                           .stb_state_si_3(), // Templated
                           .stb_state_si_4(), // Templated
                           .stb_state_si_5(), // Templated
                           .stb_state_si_6(), // Templated
                           .stb_state_si_7(), // Templated
                           .stb_state_rtype_0(), // Templated
                           .stb_state_rtype_1(), // Templated
                           .stb_state_rtype_2(), // Templated
                           .stb_state_rtype_3(), // Templated
                           .stb_state_rtype_4(), // Templated
                           .stb_state_rtype_5(), // Templated
                           .stb_state_rtype_6(), // Templated
                           .stb_state_rtype_7(), // Templated
                           .stb_state_rmo(),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(2'b00),
                           .lsu_st_rq_type_m(2'b00),
                           .lsu_st_rmo_m(1'b0));

`else // !`ifdef FPGA_SYN_1THREAD


lsu_stb_ctl stb_ctl1  (
                       .so              (short_scan1_6),
                       .si              (short_scan1_5),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb1_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb1_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[1]),      // Templated
                       .stb_l2bnk_addr  (stb1_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb1_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr1[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[1]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr1[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr1_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced1[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld1[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt1[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[1]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[1]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[1]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[1]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid1),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[1]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[1]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[1]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[1]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash1),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[1]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb1_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb1_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb1_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb1_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb1_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb1_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb1_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb1_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb1_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[1]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[1])); // Templated
lsu_stb_ctldp stb_ctldp1  (
                           .so          (short_scan0_7),
                           .si          (short_scan0_6),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb1_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb1_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb1_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb1_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb1_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb1_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb1_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb1_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb1_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb1_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb1_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb1_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb1_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb1_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb1_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb1_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb1_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb1_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl2  (
                       .so              (short_scan1_7),
                       .si              (short_scan1_6),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb2_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb2_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[2]),      // Templated
                       .stb_l2bnk_addr  (stb2_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb2_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr2[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[2]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr2[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr2_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced2[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld2[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt2[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[2]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[2]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[2]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[2]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid2),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[2]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[2]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[2]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[2]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash2),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[2]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb2_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb2_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb2_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb2_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb2_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb2_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb2_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb2_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb2_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb2_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb2_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb2_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb2_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb2_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb2_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb2_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb2_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[2]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[2])); // Templated
lsu_stb_ctldp stb_ctldp2  (
                           .so          (short_scan1_8),
                           .si          (short_scan1_7),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb2_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb2_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb2_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb2_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb2_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb2_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb2_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb2_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb2_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb2_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb2_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb2_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb2_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb2_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb2_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb2_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb2_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb2_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));

lsu_stb_ctl stb_ctl3  (
                       .so              (short_scan0_8),
                       .si              (short_scan0_7),
                       /*AUTOINST*/
                       // Outputs
                       .stb_clk_en_l    (stb3_clk_en_l[7:0]),    // Templated
                       .stb_crnt_ack_id (stb3_crnt_ack_id[2:0]), // Templated
                       .lsu_stb_empty   (lsu_stb_empty[3]),      // Templated
                       .stb_l2bnk_addr  (stb3_l2b_addr[2:0]),    // Templated
                       .stb_atm_rq_type (stb3_atm_rq_type[2:1]), // Templated
                       .stb_wrptr       (stb_wrptr3[2:0]),       // Templated
                       .stb_rd_for_pcx  (stb_rd_for_pcx[3]),     // Templated
                       .stb_pcx_rptr    (stb_pcx_rptr3[2:0]),    // Templated
                       .stb_wrptr_prev  (stb_wrptr3_prev[2:0]),  // Templated
                       .stb_state_ced_mod(stb_state_ced3[7:0]),  // Templated
                       .stb_state_vld_out(stb_state_vld3[7:0]),  // Templated
                       .lsu_stbcnt      (lsu_stbcnt3[3:0]),      // Templated
                       .stb_rmo_st_issue(lsu_stb_rmo_st_issue[3]), // Templated
                       .stb_full        (lsu_tlu_stb_full_w2_t[3]), // Templated
                       .st_pcx_rq_kill_w2(lsu_st_pcx_rq_kill_w2[3]), // Templated
                       // Inputs
                       .rclk            (clk),                   // Templated
                       .grst_l          (grst_l),
                       .arst_l          (arst_l),
                       .se              (se),
                       .thrd_en_g       (stb_thrd_en_g[3]),      // Templated
                       .cpx_st_ack_tid  (cpx_st_ack_tid3),       // Templated
                       .pcx_rq_for_stb  (pcx_rq_for_stb[3]),     // Templated
                       .st_ack_dq_stb   (lsu_st_ack_dq_stb[3]),  // Templated
                       .stb_flush_st_g  (stb_flush_st_g[3]),     // Templated
                       .stb_cam_wvld_m  (stb_cam_wvld_m[3]),     // Templated
                       .lsu_blk_st_m    (lsu_blk_st_m),
                       .tlb_pgnum_g     (tlb_pgnum_buf2[39:37]), // Templated
                       .pcx_req_squash  (lsu_pcx_req_squash3),   // Templated
                       .flshinst_rst    (lsu_dfq_flsh_cmplt[3]), // Templated
                       .lsu_stbctl_flush_pipe_w(lsu_stbctl_flush_pipe_w),
                       .flsh_inst_m     (flsh_inst_m),
                       .stb_state_si_0  (stb3_state_si_0[3:2]),  // Templated
                       .stb_state_si_1  (stb3_state_si_1[3:2]),  // Templated
                       .stb_state_si_2  (stb3_state_si_2[3:2]),  // Templated
                       .stb_state_si_3  (stb3_state_si_3[3:2]),  // Templated
                       .stb_state_si_4  (stb3_state_si_4[3:2]),  // Templated
                       .stb_state_si_5  (stb3_state_si_5[3:2]),  // Templated
                       .stb_state_si_6  (stb3_state_si_6[3:2]),  // Templated
                       .stb_state_si_7  (stb3_state_si_7[3:2]),  // Templated
                       .stb_state_rtype_0(stb3_state_rtype_0[2:1]), // Templated
                       .stb_state_rtype_1(stb3_state_rtype_1[2:1]), // Templated
                       .stb_state_rtype_2(stb3_state_rtype_2[2:1]), // Templated
                       .stb_state_rtype_3(stb3_state_rtype_3[2:1]), // Templated
                       .stb_state_rtype_4(stb3_state_rtype_4[2:1]), // Templated
                       .stb_state_rtype_5(stb3_state_rtype_5[2:1]), // Templated
                       .stb_state_rtype_6(stb3_state_rtype_6[2:1]), // Templated
                       .stb_state_rtype_7(stb3_state_rtype_7[2:1]), // Templated
                       .stb_state_rmo   (stb3_state_rmo[7:0]),   // Templated
                       .stb_alt_sel     (lsu_blk_st_m),          // Templated
                       .stb_alt_addr    (lsu_blkst_pgnum_m[39:37]), // Templated
                       .lsu_dtlb_bypass_e(lsu_dtlb_bypass_e),
                       .tlb_cam_hit     (tlb_cam_hit),
                       .st_dtlb_perr_g  (lsu_st_dtlb_perr_g[3]), // Templated
                       .lsu_outstanding_rmo_st_max(lsu_outstanding_rmo_st_max[3])); // Templated
lsu_stb_ctldp stb_ctldp3  (
                           .so          (short_so1),
                           .si          (short_scan1_8),
                           /*AUTOINST*/
                           // Outputs
                           .stb_state_si_0(stb3_state_si_0[3:2]), // Templated
                           .stb_state_si_1(stb3_state_si_1[3:2]), // Templated
                           .stb_state_si_2(stb3_state_si_2[3:2]), // Templated
                           .stb_state_si_3(stb3_state_si_3[3:2]), // Templated
                           .stb_state_si_4(stb3_state_si_4[3:2]), // Templated
                           .stb_state_si_5(stb3_state_si_5[3:2]), // Templated
                           .stb_state_si_6(stb3_state_si_6[3:2]), // Templated
                           .stb_state_si_7(stb3_state_si_7[3:2]), // Templated
                           .stb_state_rtype_0(stb3_state_rtype_0[2:1]), // Templated
                           .stb_state_rtype_1(stb3_state_rtype_1[2:1]), // Templated
                           .stb_state_rtype_2(stb3_state_rtype_2[2:1]), // Templated
                           .stb_state_rtype_3(stb3_state_rtype_3[2:1]), // Templated
                           .stb_state_rtype_4(stb3_state_rtype_4[2:1]), // Templated
                           .stb_state_rtype_5(stb3_state_rtype_5[2:1]), // Templated
                           .stb_state_rtype_6(stb3_state_rtype_6[2:1]), // Templated
                           .stb_state_rtype_7(stb3_state_rtype_7[2:1]), // Templated
                           .stb_state_rmo(stb3_state_rmo[7:0]),  // Templated
                           // Inputs
                           .rclk        (clk),                   // Templated
                           .se          (se),
                           .stb_clk_en_l(stb3_clk_en_l[7:0]),    // Templated
                           .lsu_stb_va_m(lsu_stb_va_m[7:6]),
                           .lsu_st_rq_type_m(lsu_st_rq_type_m[2:1]),
                           .lsu_st_rmo_m(lsu_st_rmo_m));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*
lsu_qdp1 AUTO_TEMPLATE (
        .tlb_pgnum            (tlb_pgnum_buf[39:13]),
        .rst_tri_en           (mux_drive_disable),
        .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]),
        .rclk                  (clk),
        .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]),
        .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]),
        .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]),
        .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]),
        .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]),
        .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]),
        .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]),
        .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]),
        .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]),
        .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]),
        .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]),
        .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]),
        .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]),
        .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]));
*/
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
                     .lsu_iobrdge_rd_data     ({16'b0,lsu_iobrdge_rd_data[27:0]}),
                     .dtag_wdata_m            (dtag_wdata_m),
                     .dtag_wdata_e            (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (thread1_m),
                 .thread2_m             (1'b0),
                 .thread3_m             (1'b0),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq2_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq3_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                 .lsu_ld2_spec_vld_kill_w2(1'b0),
                 .lsu_ld3_spec_vld_kill_w2(1'b0),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)
                 );


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
		             .lsu_iobrdge_rd_data	  ({16'b0,lsu_iobrdge_rd_data[27:0]}),
		             .dtag_wdata_m		      (dtag_wdata_m),
                   .dtag_wdata_e          (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (1'b0),
                 .thread2_m             (1'b0),
                 .thread3_m             (1'b0),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq2_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq3_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(1'b0),
                 .lsu_ld2_spec_vld_kill_w2(1'b0),
                 .lsu_ld3_spec_vld_kill_w2(1'b0),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)

                 );
`elsif THREADS_1

   lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
                     .lsu_iobrdge_rd_data     ({16'b0,lsu_iobrdge_rd_data[27:0]}),
                     .dtag_wdata_m            (dtag_wdata_m),
                     .dtag_wdata_e            (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (1'b0),
                 .thread2_m             (1'b0),
                 .thread3_m             (1'b0),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq2_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq3_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(1'b0),
                 .lsu_ld2_spec_vld_kill_w2(1'b0),
                 .lsu_ld3_spec_vld_kill_w2(1'b0),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)
                 );

`elsif THREADS_2

   lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
                     .lsu_iobrdge_rd_data     ({16'b0,lsu_iobrdge_rd_data[27:0]}),
                     .dtag_wdata_m            (dtag_wdata_m),
                     .dtag_wdata_e            (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (thread1_m),
                 .thread2_m             (1'b0),
                 .thread3_m             (1'b0),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq2_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lmq3_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                 .lsu_ld2_spec_vld_kill_w2(1'b0),
                 .lsu_ld3_spec_vld_kill_w2(1'b0),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)
                 );

`elsif THREADS_3

   lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
                     .lsu_iobrdge_rd_data     ({16'b0,lsu_iobrdge_rd_data[27:0]}),
                     .dtag_wdata_m            (dtag_wdata_m),
                     .dtag_wdata_e            (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (thread1_m),
                 .thread2_m             (thread2_m),
                 .thread3_m             (1'b0),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq2_pcx_pkt_way      (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq3_pcx_pkt_way      ({`L1D_WAY_WIDTH{1'b0}}),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                 .lsu_ld2_spec_vld_kill_w2(lsu_ld2_spec_vld_kill_w2),
                 .lsu_ld3_spec_vld_kill_w2(1'b0),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)
                 );

`else

lsu_qdp1  qdp1  (
                 .so                    (short_scan0_9),
                 .si                    (short_scan0_8),
		             .lsu_iobrdge_rd_data	  ({16'b0,lsu_iobrdge_rd_data[27:0]}),
		             .dtag_wdata_m		      (dtag_wdata_m),
                   .dtag_wdata_e          (dtag_wdata_e),
                 /*AUTOINST*/
                 // Outputs
                 `ifndef NO_RTL_CSM
                 .spc_pcx_csm_pa        (spc_pcx_csm_pa),
                 `endif
                 .lsu_va_match_b47_b32_m(lsu_va_match_b47_b32_m),
                 .lsu_va_match_b31_b3_m (lsu_va_match_b31_b3_m),
                 .lsu_va_wtchpt_addr    (lsu_va_wtchpt_addr[47:3]),
                 .spc_pcx_data_pa       (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
                 .lmq0_byp_misc_sz      (lmq0_byp_misc_sz[1:0]),
                 .lmq1_byp_misc_sz      (lmq1_byp_misc_sz[1:0]),
                 .lmq2_byp_misc_sz      (lmq2_byp_misc_sz[1:0]),
                 .lmq3_byp_misc_sz      (lmq3_byp_misc_sz[1:0]),
                 .lsu_byp_misc_sz_e     (lsu_byp_misc_sz_e[1:0]),
                 .lsu_l2fill_sign_extend_m(lsu_l2fill_sign_extend_m),
                 .lsu_l2fill_bendian_m  (lsu_l2fill_bendian_m),
                 .lmq0_l2fill_fpld      (lmq0_l2fill_fpld),
                 .lmq1_l2fill_fpld      (lmq1_l2fill_fpld),
                 .lmq2_l2fill_fpld      (lmq2_l2fill_fpld),
                 .lmq3_l2fill_fpld      (lmq3_l2fill_fpld),
                 .lmq_ld_rd1            (lmq_ld_rd1[4:0]),
                 .lmq0_ncache_ld        (lmq0_ncache_ld),
                 .lmq1_ncache_ld        (lmq1_ncache_ld),
                 .lmq2_ncache_ld        (lmq2_ncache_ld),
                 .lmq3_ncache_ld        (lmq3_ncache_ld),
                 .lmq0_ld_rq_type       (lmq0_ld_rq_type[2:0]),
                 .lmq1_ld_rq_type       (lmq1_ld_rq_type[2:0]),
                 .lmq2_ld_rq_type       (lmq2_ld_rq_type[2:0]),
                 .lmq3_ld_rq_type       (lmq3_ld_rq_type[2:0]),
                 .lmq0_ldd_vld          (lmq0_ldd_vld),
                 .lmq1_ldd_vld          (lmq1_ldd_vld),
                 .lmq2_ldd_vld          (lmq2_ldd_vld),
                 .lmq3_ldd_vld          (lmq3_ldd_vld),
                 .ld_sec_hit_thrd0      (ld_sec_hit_thrd0),
                 .ld_sec_hit_thrd1      (ld_sec_hit_thrd1),
                 .ld_sec_hit_thrd2      (ld_sec_hit_thrd2),
                 .ld_sec_hit_thrd3      (ld_sec_hit_thrd3),
                 .lmq0_pcx_pkt_addr     (lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq1_pcx_pkt_addr     (lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq2_pcx_pkt_addr     (lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lmq3_pcx_pkt_addr     (lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0]),
                 .lsu_mmu_rs3_data_g    (lsu_mmu_rs3_data_g[63:0]),
                 .lsu_tlu_rs3_data_g    (lsu_tlu_rs3_data_g[63:0]),
                 .lsu_diagnstc_wr_data_b0(lsu_diagnstc_wr_data_b0),
                 .lsu_diagnstc_wr_data_e(lsu_diagnstc_wr_data_e[63:0]),
                 .lsu_ifu_stxa_data     (lsu_ifu_stxa_data[47:0]),
                 .lsu_ifu_ld_icache_index(lsu_ifu_ld_icache_index[`IC_IDX_HI:5]),
                 .lsu_ifu_ld_pcxpkt_tid (lsu_ifu_ld_pcxpkt_tid[1:0]),
                 .lsu_error_pa_m        (lsu_error_pa_m[28:0]),
                 .lsu_pref_pcx_req      (lsu_pref_pcx_req),
                 .st_rs3_data_g         (st_rs3_data_g[63:0]),
                 .lsu_ldst_va_way_g     (lsu_ldst_va_way_g[1:0]),
                 .dcache_alt_data_w0_m  (dcache_alt_data_w0_m[63:0]),
                 // Inputs
                 `ifndef NO_RTL_CSM
                 .tlb_rd_tte_csm        (tlb_rd_tte_csm),
                 .stb_rcsm_ramc         (stb_rcsm_ramc),
                 .ifu_pcx_csm           (ifu_lsu_pcxcsm_e),
                 `endif
                 .rclk                  (clk),                   // Templated
                 .se                    (se),
                 .sehold                (sehold),
                 .lsu_dcache_iob_rd_w   (lsu_dcache_iob_rd_w),
                 .lsu_ramtest_rd_w      (lsu_ramtest_rd_w),
                 .lsu_pcx_rq_sz_b3      (lsu_pcx_rq_sz_b3),
                 .lsu_diagnstc_data_sel (lsu_diagnstc_data_sel[3:0]),
                 .pcx_pkt_src_sel       (pcx_pkt_src_sel[3:0]),
                 .lsu_stb_pcx_rvld_d1   (lsu_stb_pcx_rvld_d1),
                 .imiss_pcx_mx_sel      (imiss_pcx_mx_sel),
                 .fwd_int_fp_pcx_mx_sel (fwd_int_fp_pcx_mx_sel[2:0]),
                 .spu_lsu_ldst_pckt     (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
                 .tlu_lsu_pcxpkt        (tlu_lsu_pcxpkt[25:0]),
                 .const_cpuid           (const_cpuid[2:0]),
                 .ifu_pcx_pkt           (ifu_lsu_pcxpkt_e[51:0]), // Templated
                 .lmq_byp_data_en_w2    (lmq_byp_data_en_w2[3:0]),
                 .lmq_byp_data_sel0     (lmq_byp_data_mxsel0[3:0]), // Templated
                 .lmq_byp_data_sel1     (lmq_byp_data_mxsel1[3:0]), // Templated
                 .lmq_byp_data_sel2     (lmq_byp_data_mxsel2[3:0]), // Templated
                 .lmq_byp_data_sel3     (lmq_byp_data_mxsel3[3:0]), // Templated
                 .lmq_byp_ldxa_sel0     (lmq_byp_ldxa_mxsel0[2:0]), // Templated
                 .lmq_byp_ldxa_sel1     (lmq_byp_ldxa_mxsel1[2:0]), // Templated
                 .lmq_byp_ldxa_sel2     (lmq_byp_ldxa_mxsel2[2:0]), // Templated
                 .lmq_byp_ldxa_sel3     (lmq_byp_ldxa_mxsel3[2:0]), // Templated
                 .lmq_byp_data_fmx_sel  (lmq_byp_data_fmx_sel[3:0]),
                 .exu_lsu_rs3_data_e    (exu_lsu_rs3_data_e[63:0]),
                 .ifu_lsu_ldxa_data_w2  (ifu_lsu_ldxa_data_w2[63:0]),
                 .tlu_lsu_int_ldxa_data_w2(tlu_lsu_int_ldxa_data_w2[63:0]),
                 .spu_lsu_ldxa_data_w2  (spu_lsu_ldxa_data_w2[63:0]),
                 .stb_rdata_ramd        (stb_rdata_ramd[76:0]),
                 .stb_rdata_ramc        (stb_rdata_ramc[44:9]),
                 .lmq_byp_misc_sel      (lsu_lmq_byp_misc_sel[3:0]), // Templated
                 .dfq_byp_sel           (lsu_dfq_byp_tid_d1_sel[3:0]), // Templated
                 .ld_pcx_rq_sel         (lsu_ld_pcx_rq_mxsel[3:0]), // Templated
                 .ld_pcx_thrd           (ld_pcx_thrd[1:0]),
                 .lmq_enable            (lmq_enable[3:0]),
                 .ld_pcx_pkt_g          (ld_pcx_pkt_g[`LMQ_WIDTH-1:40]),
                 .ffu_lsu_data          (ffu_lsu_data[80:0]),
                 .lsu_tlb_st_sel_m      (lsu_tlb_st_sel_m[3:0]),
                 .lsu_pcx_fwd_pkt       (lsu_pcx_fwd_pkt[107:0]),
                 .lsu_pcx_fwd_reply     (lsu_pcx_fwd_reply),
                 .lsu_diagnstc_dtagv_prty_invrt_e(lsu_diagnstc_dtagv_prty_invrt_e),
                 .lsu_misc_rdata_w2     (lsu_misc_rdata_w2[63:0]),
                 .lsu_stb_rd_tid        (lsu_stb_rd_tid[1:0]),
                 .lsu_iobrdge_rply_data_sel(lsu_iobrdge_rply_data_sel[2:0]),
                 .lsu_atomic_pkt2_bsel_g(lsu_atomic_pkt2_bsel_g[2:0]),
                 .lsu_pcx_ld_dtag_perror_w2(lsu_pcx_ld_dtag_perror_w2),
                 .lsu_dcache_rdata_w    (dcache_rdata_wb_buf[63:0]), // Templated
                 .lsu_va_wtchpt0_wr_en_l(lsu_va_wtchpt0_wr_en_l),
                 .lsu_va_wtchpt1_wr_en_l(lsu_va_wtchpt1_wr_en_l),
                 .lsu_va_wtchpt2_wr_en_l(lsu_va_wtchpt2_wr_en_l),
                 .lsu_va_wtchpt3_wr_en_l(lsu_va_wtchpt3_wr_en_l),
                 .thread0_m             (thread0_m),
                 .thread1_m             (thread1_m),
                 .thread2_m             (thread2_m),
                 .thread3_m             (thread3_m),
                 .lsu_thread_g          (lsu_thread_g[3:0]),
                 .lsu_ldst_va_m         (lsu_ldst_va_m_buf[47:0]), // Templated
                 .tlb_pgnum             (tlb_pgnum_buf[39:13]),  // Templated
                 .lsu_bld_pcx_rq        (lsu_bld_pcx_rq),
                 .lsu_bld_rq_addr       (lsu_bld_rq_addr[1:0]),
                 .lmq0_pcx_pkt_way      (lmq0_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq1_pcx_pkt_way      (lmq1_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq2_pcx_pkt_way      (lmq2_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lmq3_pcx_pkt_way      (lmq3_pcx_pkt_way[`L1D_WAY_MASK]),
                 .lsu_dfq_ld_vld        (lsu_dfq_ld_vld),
                 .lsu_ifu_asi_data_en_l (lsu_ifu_asi_data_en_l),
                 .lsu_ld0_spec_vld_kill_w2(lsu_ld0_spec_vld_kill_w2),
                 .lsu_ld1_spec_vld_kill_w2(lsu_ld1_spec_vld_kill_w2),
                 .lsu_ld2_spec_vld_kill_w2(lsu_ld2_spec_vld_kill_w2),
                 .lsu_ld3_spec_vld_kill_w2(lsu_ld3_spec_vld_kill_w2),
                 .lsu_fwd_rply_sz1_unc  (lsu_fwd_rply_sz1_unc),
                 .rst_tri_en            (mux_drive_disable),     // Templated
                 .lsu_l2fill_data       (lsu_l2fill_data[63:0]),
                 .l2fill_vld_m          (l2fill_vld_m),
                 .ld_thrd_byp_sel_m     (ld_thrd_byp_mxsel_m[3:0]), // Templated
                 .cfg_asi_lsu_ldxa_vld_w2 (cfg_asi_lsu_ldxa_vld_w2),
                 .cfg_asi_lsu_ldxa_data_w2 (cfg_asi_lsu_ldxa_data_w2)
                 );
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

/*
lsu_qdp2 AUTO_TEMPLATE (
       .rst_tri_en              (mux_drive_disable),
       .dfq_byp_ff_en          (lsu_dfq_byp_ff_en),
       .dfq_rd_vld_d1          (lsu_dfq_rd_vld_d1),
       .lsu_dfq_ld_vld         (lsu_qdp2_dfq_ld_vld),
       .lsu_dfq_st_vld         (lsu_qdp2_dfq_st_vld),
       .rclk                    (clk),
       .lsu_ifill_pkt          (lsu_ifu_cpxpkt_i1[`CPX_VLD-1:0]),
       .lsu_cpx_pkt_vld        ());
*/

lsu_qdp2 qdp2  (
                .so                     (so1),
                .si                     (scan1_4),
		.dfq_wdata		(dfq_wdata[`DFQ_WIDTH:0]),
                /*AUTOINST*/
                // Outputs
                .lsu_l2fill_data        (lsu_l2fill_data[63:0]),
                .dfq_tid                (dfq_tid[1:0]),
                .lsu_dcache_fill_data_e (lsu_dcache_fill_data_e[143:0]),
                .lsu_ifill_pkt          (lsu_ifu_cpxpkt_i1[`CPX_VLD-1:0]), // Templated
                .lsu_pcx_fwd_pkt        (lsu_pcx_fwd_pkt[107:0]),
                .lsu_cpx_pkt_strm_ack   (lsu_cpx_pkt_strm_ack),
                .lsu_cpx_pkt_vld        (),                      // Templated
                .lsu_cpx_pkt_atm_st_cmplt(lsu_cpx_pkt_atm_st_cmplt),
                .lsu_cpx_pkt_tid        (lsu_cpx_pkt_tid[1:0]),
                .lsu_cpx_pkt_invwy      (lsu_cpx_pkt_invwy[`L1D_WAY_MASK]),
                .lsu_cpx_pkt_inv_pa     (lsu_cpx_pkt_inv_pa[`L1D_ADDRESS_HI-6:0]),
                .lsu_cpx_pkt_l2miss     (lsu_cpx_pkt_l2miss),
                .lsu_dfq_byp_invwy_vld  (lsu_dfq_byp_invwy_vld),
                .lsu_dfq_byp_type       (lsu_dfq_byp_type[5:0]),
                .lsu_dfq_byp_flush      (lsu_dfq_byp_flush),
                .lsu_dfq_byp_tid        (lsu_dfq_byp_tid[1:0]),
                // .lsu_cpu_inv_data_b13to9(lsu_cpu_inv_data_b13to9[13:9]),
                // .lsu_cpu_inv_data_b7to2 (lsu_cpu_inv_data_b7to2[7:2]),
                // .lsu_cpu_inv_data_b0    (lsu_cpu_inv_data_b0),
                .lsu_cpu_inv_data_val        (lsu_cpu_inv_data_val),
                .lsu_cpu_inv_data_way        (lsu_cpu_inv_data_way),
                .lsu_iobrdge_wr_data    (lsu_iobrdge_wr_data[43:0]),
                .lsu_iobrdge_tap_rq_type(lsu_iobrdge_tap_rq_type[8:0]),
                .lsu_cpx_pkt_perror_dinv(lsu_cpx_pkt_perror_dinv),
                .lsu_cpx_pkt_perror_iinv(lsu_cpx_pkt_perror_iinv),
                .lsu_cpx_pkt_perror_set (lsu_cpx_pkt_perror_set[1:0]),
                .lsu_cpx_pkt_ld_err     (lsu_cpx_pkt_ld_err[1:0]),
                .lsu_dfq_byp_binit_st   (lsu_dfq_byp_binit_st),
                .lsu_cpx_pkt_binit_st   (lsu_cpx_pkt_binit_st),
                .lsu_cpx_pkt_prefetch   (lsu_cpx_pkt_prefetch),
                .lsu_cpx_pkt_prefetch2  (lsu_cpx_pkt_prefetch2),
                .lsu_dfq_byp_cpx_inv    (lsu_dfq_byp_cpx_inv),
                .lsu_dfq_byp_stack_adr_b54(lsu_dfq_byp_stack_adr_b54[1:0]),
                .lsu_dfq_byp_stack_wrway(lsu_dfq_byp_stack_wrway[1:0]),
                .lsu_dfq_byp_atm        (lsu_dfq_byp_atm),
                .dcache_iob_addr_e      (dcache_iob_addr_e[`L1D_ADDRESS_HI-3:0]),
                .st_dcfill_addr         (st_dcfill_addr[`L1D_ADDRESS_HI:0]),
                .lsu_st_way_e           (lsu_st_way_e[`L1D_WAY_MASK]),
                .lsu_dcache_iob_way_e   (lsu_dcache_iob_way_e[`L1D_WAY_MASK]),
                .lsu_st_dcfill_size_e   (lsu_st_dcfill_size_e[1:0]),
                .lsu_cpx_pkt_ifill_type (lsu_cpx_pkt_ifill_type),
                .lsu_cpx_pkt_atomic     (lsu_cpx_pkt_atomic),
                // Inputs
                .rst_tri_en             (mux_drive_disable),     // Templated
                .rclk                   (clk),                   // Templated
                .se                     (se),
                .lsu_dfill_data_sel_hi  (lsu_dfill_data_sel_hi),
                .dfq_byp_ff_en          (lsu_dfq_byp_ff_en),     // Templated
                .dfq_rd_vld_d1          (lsu_dfq_rd_vld_d1),     // Templated
                .dfq_rdata              (dfq_rdata[`DFQ_WIDTH:0]),
                .cpx_spc_data_cx        (cpx_spc_data_cx[`CPX_WIDTH-1:0]),
                .stb_rdata_ramd_buf     (stb_rdata_ramd_buf[69:0]),
                .stb_rdata_ramd_b74_buf (stb_rdata_ramd_b74_buf),
                .stb_rdata_ramc_buf     (stb_rdata_ramc_buf[14:9]),
                .lsu_stb_pcx_rvld_d1    (lsu_stb_pcx_rvld_d1),
                .lsu_diagnstc_wr_data_e (lsu_diagnstc_wr_data_e[63:0]),
                .lsu_diagnstc_dc_prty_invrt_e(lsu_diagnstc_dc_prty_invrt_e[7:0]),
                .mbist_write_data       (mbist_write_data[7:0]),
                .cpx_fwd_pkt_en_cx      (cpx_fwd_pkt_en_cx),
                .lsu_cpu_dcd_sel        (lsu_cpu_dcd_sel[7:0]),
                .lsu_cpu_uhlf_sel       (lsu_cpu_uhlf_sel),
                .lsu_cpxpkt_type_dcd_cx (lsu_cpxpkt_type_dcd_cx[5:0]),
                .lsu_dc_iob_access_e    (lsu_dc_iob_access_e),
                .lsu_dcfill_data_mx_sel_e(lsu_dcfill_data_mx_sel_e),
                .lsu_cpx_spc_inv_vld    (lsu_cpx_spc_inv_vld),
                .lsu_cpx_thrdid         (lsu_cpx_thrdid[3:0]),
                .lsu_cpx_stack_dcfill_vld(lsu_cpx_stack_dcfill_vld),
                .pcx_rq_for_stb_d1      (pcx_rq_for_stb_d1[3:0]),
                .lsu_dfq_ld_vld         (lsu_qdp2_dfq_ld_vld),   // Templated
                .lsu_dfq_st_vld         (lsu_qdp2_dfq_st_vld),   // Templated
                .lsu_dfq_ldst_vld       (lsu_dfq_ldst_vld));


/*
bw_r_rf32x152b AUTO_TEMPLATE (
                 .rst_tri_en           (mem_write_disable),
                 .rclk                    (clk),
                 .dout                  (dfq_rdata[151:0]),
                 .wr_adr                (dfq_wptr[4:0]),
                 .rd_adr                (dfq_rptr[4:0]),
                 .wr_en                 (dfq_wptr_vld),
                 .rd_en                 (dfq_rptr_vld),
                 //.sehold                (),
                 .reset_l               (arst_l));
*/

bw_r_rf32x152b   dfq   (
                 .din            ({dfq_wdata[151:131],
                                   lsu_cpx_stack_dcfill_vld_b130,
                                   dfq_wdata[129],
                                   lsu_cpx_stack_icfill_vld,
                                   dfq_wdata[127:0]}),
                        .so             (short_so0),
                        .si             (short_scan0_9),
                 /*AUTOINST*/
                        // Outputs
                        .dout           (dfq_rdata[151:0]),      // Templated
                        // Inputs
                        .rd_adr         (dfq_rptr[4:0]),         // Templated
                        .rd_en          (dfq_rptr_vld),          // Templated
                        .wr_en          (dfq_wptr_vld),          // Templated
                        .wr_adr         (dfq_wptr[4:0]),         // Templated
                        .rclk           (clk),                   // Templated
                        .reset_l        (arst_l),                // Templated
                        .rst_tri_en     (mem_write_disable),     // Templated
                        .sehold         (sehold),
                        .se             (se));

endmodule

// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl" "../../../common/rtl")
// End:
