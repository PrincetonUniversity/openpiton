// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: lsu_mon.v
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
////////////////////////////////////////////////////////;
// lsu_mon.vpal
//
// Description: LSU Monitor for monitoring some coverage conditions
// 		as well as some checkers. Run pal to get .v
// 		like pal -r -o lsu_mon.v lsu_mon.vpal
////////////////////////////////////////////////////////

`include "cross_module.h.tmp"
`include "sys.h"
`include "iop.h"

module lsu_mon ( clk, rst_l);
  input clk;		// the cpu clock
  input rst_l;		// reset (active low).


   reg 	lsu_mon_msg;
  initial
  begin
    if( $test$plusargs("lsu_mon_msg") )
      lsu_mon_msg = 1'b1;
    else
      lsu_mon_msg= 1'b0;
  end // initial begin

//============================================================================================
`ifdef RTL_SPARC0

wire 	   spc0_dva_ren 	        = `SPARC_CORE0.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc0_dva_wen 	        = `SPARC_CORE0.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc0_dva_din 	        = `SPARC_CORE0.sparc0.lsu.dva_din_e;
wire [3:0] spc0_dva_dout 	        = `SPARC_CORE0.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc0_dva_raddr 	        = `SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc0_dva_waddr 	        = `SPARC_CORE0.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc0_dva_dtag_perror 	= `SPARC_CORE0.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc0_dva_dcache_perror 	= `SPARC_CORE0.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc0_dva_inv_perror 	= `SPARC_CORE0.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc0_ld_miss 	        = `SPARC_CORE0.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc0_ld_miss_capture;

wire 	   spc0_atomic_g 	        = `SPARC_CORE0.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc0_atm_type0 	= `SPARC_CORE0.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc0_atm_type1 	= `SPARC_CORE0.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc0_atm_type2 	= `SPARC_CORE0.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc0_atm_type3 	= `SPARC_CORE0.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc0_dctl_lsu_way_hit 	= `SPARC_CORE0.sparc0.lsu.dctl.lsu_way_hit;
wire       spc0_dctl_dcache_enable_g 	= `SPARC_CORE0.sparc0.lsu.dctl.dcache_enable_g;
wire       spc0_dctl_ldxa_internal 	= `SPARC_CORE0.sparc0.lsu.dctl.ldxa_internal;
wire       spc0_dctl_ldst_dbl_g 	= `SPARC_CORE0.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc0_dctl_atomic_g 	= `SPARC_CORE0.sparc0.lsu.dctl.atomic_g;
wire       spc0_dctl_stb_cam_hit 	= `SPARC_CORE0.sparc0.lsu.dctl.stb_cam_hit;
wire       spc0_dctl_endian_mispred_g 	= `SPARC_CORE0.sparc0.lsu.dctl.endian_mispred_g;
wire       spc0_dctl_dcache_rd_parity_error 	= `SPARC_CORE0.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc0_dctl_dtag_perror_g 	= `SPARC_CORE0.sparc0.lsu.dctl.dtag_perror_g;
wire       spc0_dctl_tte_data_perror_unc 	= `SPARC_CORE0.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc0_dctl_ld_inst_vld_g 	= `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc0_dctl_lsu_alt_space_g 	= `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc0_dctl_recognized_asi_g 	= `SPARC_CORE0.sparc0.lsu.dctl.recognized_asi_g;
wire       spc0_dctl_ncache_asild_rq_g  = `SPARC_CORE0.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc0_dctl_bld_hit;
wire       spc0_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc0_ixinv0  = `SPARC_CORE0.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc0_ixinv1  = `SPARC_CORE0.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc0_ixinv2  = `SPARC_CORE0.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc0_ixinv3  = `SPARC_CORE0.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc0_ifill  = `SPARC_CORE0.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc0_inv  = `SPARC_CORE0.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc0_inv_clr  = `SPARC_CORE0.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc0_ibuf_busy  = `SPARC_CORE0.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc0_l2  = `SPARC_CORE0.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc0_unc  = `SPARC_CORE0.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc0_fpld  = `SPARC_CORE0.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc0_fpldst  = `SPARC_CORE0.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc0_unflush  = `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc0_ldw  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc0_byp  = `SPARC_CORE0.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc0_flsh  = `SPARC_CORE0.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc0_chm  = `SPARC_CORE0.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc0_ldxa  = `SPARC_CORE0.sparc0.lsu.dctl.ldxa_internal ;
wire       spc0_ato  = `SPARC_CORE0.sparc0.lsu.dctl.atomic_g ;
wire       spc0_pref  = `SPARC_CORE0.sparc0.lsu.dctl.pref_inst_g ;
wire       spc0_chit  = `SPARC_CORE0.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc0_dcp  = `SPARC_CORE0.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc0_dtp  = `SPARC_CORE0.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc0_mpc  = `SPARC_CORE0.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc0_mpc  = 1'b0;
wire       spc0_mpu  = `SPARC_CORE0.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc0_exu_und;
reg  [4:0] spc0_exu;

// excptn
wire spc0_exp_wtchpt_trp_g                    = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc0_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc0_exp_priv_violtn_g                    = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc0_exp_daccess_excptn_g                 = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc0_exp_daccess_prot_g                   = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc0_exp_priv_action_g                    = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc0_exp_spec_access_epage_g              = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc0_exp_uncache_atomic_g                 = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc0_exp_illegal_asi_action_g             = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc0_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc0_exp_asi_rd_unc                       = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc0_exp_tlb_data_ce                     = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc0_exp_asi_rd_unc                       = 1'b0;
wire spc0_exp_tlb_data_ce                     =  1'b0;

wire spc0_exp_tlb_data_ue                     = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc0_exp_tlb_tag_ue                      = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc0_exp_unc                  = `SPARC_CORE0.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc0_exp_corr                 = `SPARC_CORE0.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc0_exp_corr                 = 1'b0;
wire [15:0] spc0_exp_und;
reg  [4:0] spc0_exp;
// dctl cmplt

wire       spc0_dctl_stxa_internal_d2  = `SPARC_CORE0.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc0_dctl_lsu_l2fill_vld  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc0_dctl_atomic_ld_squash_e  = `SPARC_CORE0.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc0_dctl_lsu_ignore_fill  = `SPARC_CORE0.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc0_dctl_l2fill_fpld_e  = `SPARC_CORE0.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc0_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc0_dctl_fill_err_trap_e  = `SPARC_CORE0.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc0_dctl_l2_corr_error_e  = `SPARC_CORE0.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc0_dctl_intld_byp_cmplt  = `SPARC_CORE0.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc0_dctl_lsu_intrpt_cmplt  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc0_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE0.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc0_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE0.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc0_dctl_lsu_pcx_pref_issue  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc0_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE0.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc0_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc0_ldstcond_cmplt_d;

wire       spc0_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE0.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc0_qctl1_ld0_inst_vld_g  = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc0_ld0_pkt_vld_unmasked  = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc0_ld0_pkt_vld_unmasked_d;
reg	   spc0_qctl1_ld_sec_hit_thrd0_w2;

wire       spc0_dctl_thread0_w3  = `SPARC_CORE0.sparc0.lsu.dctl.thread0_w3;
wire       spc0_dctl_dfill_thread0  = `SPARC_CORE0.sparc0.lsu.dctl.dfill_thread0;
wire       spc0_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc0_dctl_diag_wr_cmplt0  = `SPARC_CORE0.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc0_dctl_bsync0_reset  = `SPARC_CORE0.sparc0.lsu.dctl.bsync0_reset;
wire       spc0_dctl_late_cmplt0  = `SPARC_CORE0.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc0_dctl_stxa_cmplt0;
wire       spc0_dctl_l2fill_cmplt0;
wire       spc0_dctl_atm_cmplt0;
wire       spc0_dctl_fillerr0;
wire [4:0] spc0_cmplt0;
wire [5:0] spc0_dctl_ldst_cond_cmplt0;
reg  [3:0] spc0_ldstcond_cmplt0;
reg  [3:0] spc0_ldstcond_cmplt0_d;

wire       spc0_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE0.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc0_qctl1_ld1_inst_vld_g  = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc0_ld1_pkt_vld_unmasked  = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc0_ld1_pkt_vld_unmasked_d;
reg	   spc0_qctl1_ld_sec_hit_thrd1_w2;

wire       spc0_dctl_thread1_w3  = `SPARC_CORE0.sparc0.lsu.dctl.thread1_w3;
wire       spc0_dctl_dfill_thread1  = `SPARC_CORE0.sparc0.lsu.dctl.dfill_thread1;
wire       spc0_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc0_dctl_diag_wr_cmplt1  = `SPARC_CORE0.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc0_dctl_bsync1_reset  = `SPARC_CORE0.sparc0.lsu.dctl.bsync1_reset;
wire       spc0_dctl_late_cmplt1  = `SPARC_CORE0.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc0_dctl_stxa_cmplt1;
wire       spc0_dctl_l2fill_cmplt1;
wire       spc0_dctl_atm_cmplt1;
wire       spc0_dctl_fillerr1;
wire [4:0] spc0_cmplt1;
wire [5:0] spc0_dctl_ldst_cond_cmplt1;
reg  [3:0] spc0_ldstcond_cmplt1;
reg  [3:0] spc0_ldstcond_cmplt1_d;

wire       spc0_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE0.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc0_qctl1_ld2_inst_vld_g  = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc0_ld2_pkt_vld_unmasked  = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc0_ld2_pkt_vld_unmasked_d;
reg	   spc0_qctl1_ld_sec_hit_thrd2_w2;

wire       spc0_dctl_thread2_w3  = `SPARC_CORE0.sparc0.lsu.dctl.thread2_w3;
wire       spc0_dctl_dfill_thread2  = `SPARC_CORE0.sparc0.lsu.dctl.dfill_thread2;
wire       spc0_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc0_dctl_diag_wr_cmplt2  = `SPARC_CORE0.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc0_dctl_bsync2_reset  = `SPARC_CORE0.sparc0.lsu.dctl.bsync2_reset;
wire       spc0_dctl_late_cmplt2  = `SPARC_CORE0.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc0_dctl_stxa_cmplt2;
wire       spc0_dctl_l2fill_cmplt2;
wire       spc0_dctl_atm_cmplt2;
wire       spc0_dctl_fillerr2;
wire [4:0] spc0_cmplt2;
wire [5:0] spc0_dctl_ldst_cond_cmplt2;
reg  [3:0] spc0_ldstcond_cmplt2;
reg  [3:0] spc0_ldstcond_cmplt2_d;

wire       spc0_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE0.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc0_qctl1_ld3_inst_vld_g  = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc0_ld3_pkt_vld_unmasked  = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc0_ld3_pkt_vld_unmasked_d;
reg	   spc0_qctl1_ld_sec_hit_thrd3_w2;

wire       spc0_dctl_thread3_w3  = `SPARC_CORE0.sparc0.lsu.dctl.thread3_w3;
wire       spc0_dctl_dfill_thread3  = `SPARC_CORE0.sparc0.lsu.dctl.dfill_thread3;
wire       spc0_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc0_dctl_diag_wr_cmplt3  = `SPARC_CORE0.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc0_dctl_bsync3_reset  = `SPARC_CORE0.sparc0.lsu.dctl.bsync3_reset;
wire       spc0_dctl_late_cmplt3  = `SPARC_CORE0.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc0_dctl_stxa_cmplt3;
wire       spc0_dctl_l2fill_cmplt3;
wire       spc0_dctl_atm_cmplt3;
wire       spc0_dctl_fillerr3;
wire [4:0] spc0_cmplt3;
wire [5:0] spc0_dctl_ldst_cond_cmplt3;
reg  [3:0] spc0_ldstcond_cmplt3;
reg  [3:0] spc0_ldstcond_cmplt3_d;


wire       spc0_qctl1_bld_g 	= `SPARC_CORE0.sparc0.lsu.qctl1.bld_g;
wire       spc0_qctl1_bld_reset 	= `SPARC_CORE0.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc0_qctl1_bld_cnt 	= `SPARC_CORE0.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc0_bld0_full_cntr;
reg  [1:0] spc0_bld0_full_d;
reg 	   spc0_bld0_full_capture;
reg  [9:0] spc0_bld1_full_cntr;
reg  [1:0] spc0_bld1_full_d;
reg 	   spc0_bld1_full_capture;
reg  [9:0] spc0_bld2_full_cntr;
reg  [1:0] spc0_bld2_full_d;
reg 	   spc0_bld2_full_capture;
reg  [9:0] spc0_bld3_full_cntr;
reg  [1:0] spc0_bld3_full_d;
reg 	   spc0_bld3_full_capture;

wire       spc0_ipick 	= `SPARC_CORE0.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc0_lpick 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc0_spick 	= `SPARC_CORE0.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc0_mpick 	= `SPARC_CORE0.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc0_apick 	= `SPARC_CORE0.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc0_msquash 	= `SPARC_CORE0.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc0_fpicko;
wire [3:0] spc0_fpick;

wire [39:0] spc0_imiss_pa 	= `SPARC_CORE0.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc0_imiss_vld 	= `SPARC_CORE0.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc0_imiss_vld_d;
wire [39:0] spc0_lmiss_pa0 	= `SPARC_CORE0.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc0_lmiss_vld0 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc0_ld_pkt_vld0 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc0_st_pkt_vld0 	= `SPARC_CORE0.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc0_lmiss_eq0;
reg             spc0_atm_imiss_eq0;
wire [39:0] spc0_lmiss_pa1 	= `SPARC_CORE0.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc0_lmiss_vld1 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc0_ld_pkt_vld1 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc0_st_pkt_vld1 	= `SPARC_CORE0.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc0_lmiss_eq1;
reg             spc0_atm_imiss_eq1;
wire [39:0] spc0_lmiss_pa2 	= `SPARC_CORE0.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc0_lmiss_vld2 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc0_ld_pkt_vld2 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc0_st_pkt_vld2 	= `SPARC_CORE0.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc0_lmiss_eq2;
reg             spc0_atm_imiss_eq2;
wire [39:0] spc0_lmiss_pa3 	= `SPARC_CORE0.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc0_lmiss_vld3 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc0_ld_pkt_vld3 	= `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc0_st_pkt_vld3 	= `SPARC_CORE0.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc0_lmiss_eq3;
reg             spc0_atm_imiss_eq3;

wire [44:0]	spc0_wdata_ramc = `SPARC_CORE0.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc0_wptr_vld   = `SPARC_CORE0.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc0_wdata_ramd = {`SPARC_CORE0.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE0.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc0_stb_cam_hit 	        = `SPARC_CORE0.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc0_stb_cam_hit_ptr 	= `SPARC_CORE0.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc0_stb_ld_full_raw	= `SPARC_CORE0.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc0_stb_ld_partial_raw	= `SPARC_CORE0.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc0_stb_cam_mhit		= `SPARC_CORE0.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc0_dfq_vld_entries 	= `SPARC_CORE0.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc0_dfq_full;
reg  [9:0] spc0_dfq_full_cntr;
reg        spc0_dfq_full_d;
reg 	   spc0_dfq_full_capture;

reg  [9:0] spc0_dfq_full_cntr1;
reg        spc0_dfq_full_d1;
wire 	   spc0_dfq_full1;
reg 	   spc0_dfq_full_capture1;
reg  [9:0] spc0_dfq_full_cntr2;
reg        spc0_dfq_full_d2;
wire 	   spc0_dfq_full2;
reg 	   spc0_dfq_full_capture2;
reg  [9:0] spc0_dfq_full_cntr3;
reg        spc0_dfq_full_d3;
wire 	   spc0_dfq_full3;
reg 	   spc0_dfq_full_capture3;
reg  [9:0] spc0_dfq_full_cntr4;
reg        spc0_dfq_full_d4;
wire 	   spc0_dfq_full4;
reg 	   spc0_dfq_full_capture4;
reg  [9:0] spc0_dfq_full_cntr5;
reg        spc0_dfq_full_d5;
wire 	   spc0_dfq_full5;
reg 	   spc0_dfq_full_capture5;
reg  [9:0] spc0_dfq_full_cntr6;
reg        spc0_dfq_full_d6;
wire 	   spc0_dfq_full6;
reg 	   spc0_dfq_full_capture6;
reg  [9:0] spc0_dfq_full_cntr7;
reg        spc0_dfq_full_d7;
wire 	   spc0_dfq_full7;
reg 	   spc0_dfq_full_capture7;

wire 	   spc0_dva_rdwrhit;
reg  [9:0] spc0_dva_full_cntr;
reg        spc0_dva_full_d;
reg 	   spc0_dva_full_capture;
reg 	   spc0_dva_inv;
reg 	   spc0_dva_inv_d;
reg 	   spc0_dva_vld;
reg 	   spc0_dva_vld_d;
reg  [9:0] spc0_dva_vfull_cntr;
reg        spc0_dva_vfull_d;
reg 	   spc0_dva_vfull_capture;
reg        spc0_dva_collide;
reg        spc0_dva_vld2lkup;
reg        spc0_dva_invld2lkup;
reg        spc0_dva_invld_err;

reg  [9:0] spc0_dva_efull_cntr;
reg        spc0_dva_efull_d;

reg        spc0_dva_vlddtag_err;
reg        spc0_dva_vlddcache_err;
reg        spc0_dva_err;
reg [6:0] spc0_dva_raddr_d;
reg [4:0] spc0_dva_waddr_d;
reg [4:0] spc0_dva_invwaddr_d;

reg  	        spc0_ld0_lt_1;
reg  	        spc0_ld0_lt_2;
reg  	        spc0_ld0_lt_3;
reg  	        spc0_ld1_lt_0;
reg  	        spc0_ld1_lt_2;
reg  	        spc0_ld1_lt_3;
reg  	        spc0_ld2_lt_0;
reg  	        spc0_ld2_lt_1;
reg  	        spc0_ld2_lt_3;
reg  	        spc0_ld3_lt_0;
reg  	        spc0_ld3_lt_1;
reg  	        spc0_ld3_lt_2;

reg  	        spc0_st0_lt_1;
reg  	        spc0_st0_lt_2;
reg  	        spc0_st0_lt_3;
reg  	        spc0_st1_lt_0;
reg  	        spc0_st1_lt_2;
reg  	        spc0_st1_lt_3;
reg  	        spc0_st2_lt_0;
reg  	        spc0_st2_lt_1;
reg  	        spc0_st2_lt_3;
reg  	        spc0_st3_lt_0;
reg  	        spc0_st3_lt_1;
reg  	        spc0_st3_lt_2;

wire [11:0]      spc0_ld_ooo_ret;
wire [11:0]      spc0_st_ooo_ret;

wire [7:0]	spc0_stb_state_vld0 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc0_stb_state_ack0 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc0_stb_state_ced0 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc0_stb_state_rst0 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc0_stb_ack_vld0 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc0_ld0_inst_vld_g 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc0_intrpt0_cmplt 	 = `SPARC_CORE0.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc0_stb0_full 	         = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc0_stb0_full_w2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc0_lmq0_full 	         = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc0_mbar_vld0 	         = `SPARC_CORE0.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc0_ld0_unfilled 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc0_flsh_vld0	         = `SPARC_CORE0.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc0_ld0_unf_cntr;
reg  	        spc0_ld0_unfilled_d;

reg  [9:0]	spc0_st0_unf_cntr;
reg  	        spc0_st0_unfilled_d;
reg  	        spc0_st0_unfilled;

reg 	        spc0_mbar_vld_d0;
reg 	        spc0_flsh_vld_d0;

reg 	        spc0_lmq0_full_d;
reg  [9:0]	spc0_lmq_full_cntr0;
reg             spc0_lmq_full_capture0;

reg  [9:0]	spc0_stb_full_cntr0;
reg 		spc0_stb_full_capture0;

reg  [9:0]	spc0_mbar_vld_cntr0;
reg 		spc0_mbar_vld_capture0;

reg  [9:0]	spc0_flsh_vld_cntr0;
reg 		spc0_flsh_vld_capture0;

reg 		spc0_stb_head_hit0;
wire 		spc0_raw_ack_capture0;
reg  [9:0]	spc0_stb_ack_cntr0;

reg  [9:0]	spc0_stb_ced_cntr0;
reg  	        spc0_stb_ced0_d;
reg  	        spc0_stb_ced_capture0;
wire  	        spc0_stb_ced0;

reg 	        spc0_atm0_d;
reg  [9:0]	spc0_atm_cntr0;
reg             spc0_atm_intrpt_capture0;
reg             spc0_atm_intrpt_b4capture0;
reg             spc0_atm_inv_capture0;


reg  [39:0]     spc0_stb_wr_addr0;
reg  [39:0]     spc0_stb_atm_addr0;
reg             spc0_atm_lmiss_eq0;
wire [7:0]	spc0_stb_state_vld1 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc0_stb_state_ack1 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc0_stb_state_ced1 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc0_stb_state_rst1 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc0_stb_ack_vld1 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc0_ld1_inst_vld_g 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc0_intrpt1_cmplt 	 = `SPARC_CORE0.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc0_stb1_full 	         = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc0_stb1_full_w2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc0_lmq1_full 	         = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc0_mbar_vld1 	         = `SPARC_CORE0.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc0_ld1_unfilled 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc0_flsh_vld1	         = `SPARC_CORE0.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc0_ld1_unf_cntr;
reg  	        spc0_ld1_unfilled_d;

reg  [9:0]	spc0_st1_unf_cntr;
reg  	        spc0_st1_unfilled_d;
reg  	        spc0_st1_unfilled;

reg 	        spc0_mbar_vld_d1;
reg 	        spc0_flsh_vld_d1;

reg 	        spc0_lmq1_full_d;
reg  [9:0]	spc0_lmq_full_cntr1;
reg             spc0_lmq_full_capture1;

reg  [9:0]	spc0_stb_full_cntr1;
reg 		spc0_stb_full_capture1;

reg  [9:0]	spc0_mbar_vld_cntr1;
reg 		spc0_mbar_vld_capture1;

reg  [9:0]	spc0_flsh_vld_cntr1;
reg 		spc0_flsh_vld_capture1;

reg 		spc0_stb_head_hit1;
wire 		spc0_raw_ack_capture1;
reg  [9:0]	spc0_stb_ack_cntr1;

reg  [9:0]	spc0_stb_ced_cntr1;
reg  	        spc0_stb_ced1_d;
reg  	        spc0_stb_ced_capture1;
wire  	        spc0_stb_ced1;

reg 	        spc0_atm1_d;
reg  [9:0]	spc0_atm_cntr1;
reg             spc0_atm_intrpt_capture1;
reg             spc0_atm_intrpt_b4capture1;
reg             spc0_atm_inv_capture1;


reg  [39:0]     spc0_stb_wr_addr1;
reg  [39:0]     spc0_stb_atm_addr1;
reg             spc0_atm_lmiss_eq1;
wire [7:0]	spc0_stb_state_vld2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc0_stb_state_ack2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc0_stb_state_ced2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc0_stb_state_rst2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc0_stb_ack_vld2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc0_ld2_inst_vld_g 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc0_intrpt2_cmplt 	 = `SPARC_CORE0.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc0_stb2_full 	         = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc0_stb2_full_w2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc0_lmq2_full 	         = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc0_mbar_vld2 	         = `SPARC_CORE0.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc0_ld2_unfilled 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc0_flsh_vld2	         = `SPARC_CORE0.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc0_ld2_unf_cntr;
reg  	        spc0_ld2_unfilled_d;

reg  [9:0]	spc0_st2_unf_cntr;
reg  	        spc0_st2_unfilled_d;
reg  	        spc0_st2_unfilled;

reg 	        spc0_mbar_vld_d2;
reg 	        spc0_flsh_vld_d2;

reg 	        spc0_lmq2_full_d;
reg  [9:0]	spc0_lmq_full_cntr2;
reg             spc0_lmq_full_capture2;

reg  [9:0]	spc0_stb_full_cntr2;
reg 		spc0_stb_full_capture2;

reg  [9:0]	spc0_mbar_vld_cntr2;
reg 		spc0_mbar_vld_capture2;

reg  [9:0]	spc0_flsh_vld_cntr2;
reg 		spc0_flsh_vld_capture2;

reg 		spc0_stb_head_hit2;
wire 		spc0_raw_ack_capture2;
reg  [9:0]	spc0_stb_ack_cntr2;

reg  [9:0]	spc0_stb_ced_cntr2;
reg  	        spc0_stb_ced2_d;
reg  	        spc0_stb_ced_capture2;
wire  	        spc0_stb_ced2;

reg 	        spc0_atm2_d;
reg  [9:0]	spc0_atm_cntr2;
reg             spc0_atm_intrpt_capture2;
reg             spc0_atm_intrpt_b4capture2;
reg             spc0_atm_inv_capture2;


reg  [39:0]     spc0_stb_wr_addr2;
reg  [39:0]     spc0_stb_atm_addr2;
reg             spc0_atm_lmiss_eq2;
wire [7:0]	spc0_stb_state_vld3 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc0_stb_state_ack3 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc0_stb_state_ced3 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc0_stb_state_rst3 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc0_stb_ack_vld3 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc0_ld3_inst_vld_g 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc0_intrpt3_cmplt 	 = `SPARC_CORE0.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc0_stb3_full 	         = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc0_stb3_full_w2 	 = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc0_lmq3_full 	         = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc0_mbar_vld3 	         = `SPARC_CORE0.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc0_ld3_unfilled 	 = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc0_flsh_vld3	         = `SPARC_CORE0.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc0_ld3_unf_cntr;
reg  	        spc0_ld3_unfilled_d;

reg  [9:0]	spc0_st3_unf_cntr;
reg  	        spc0_st3_unfilled_d;
reg  	        spc0_st3_unfilled;

reg 	        spc0_mbar_vld_d3;
reg 	        spc0_flsh_vld_d3;

reg 	        spc0_lmq3_full_d;
reg  [9:0]	spc0_lmq_full_cntr3;
reg             spc0_lmq_full_capture3;

reg  [9:0]	spc0_stb_full_cntr3;
reg 		spc0_stb_full_capture3;

reg  [9:0]	spc0_mbar_vld_cntr3;
reg 		spc0_mbar_vld_capture3;

reg  [9:0]	spc0_flsh_vld_cntr3;
reg 		spc0_flsh_vld_capture3;

reg 		spc0_stb_head_hit3;
wire 		spc0_raw_ack_capture3;
reg  [9:0]	spc0_stb_ack_cntr3;

reg  [9:0]	spc0_stb_ced_cntr3;
reg  	        spc0_stb_ced3_d;
reg  	        spc0_stb_ced_capture3;
wire  	        spc0_stb_ced3;

reg 	        spc0_atm3_d;
reg  [9:0]	spc0_atm_cntr3;
reg             spc0_atm_intrpt_capture3;
reg             spc0_atm_intrpt_b4capture3;
reg             spc0_atm_inv_capture3;


reg  [39:0]     spc0_stb_wr_addr3;
reg  [39:0]     spc0_stb_atm_addr3;
reg             spc0_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc0_fpick = {spc0_mpick,spc0_spick,spc0_lpick,spc0_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc0_msquash,spc0_apick,spc0_fpick})
         9'b000000000 : spc0_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc0_fpicko = 1'b0;
         9'b1xxxxxxxx : spc0_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc0_fpicko = 1'b0;
	 default:
	  begin
		spc0_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon0 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc0_exu_und = {spc0_l2,
			  spc0_unc,
			  spc0_fpld,
			  spc0_fpldst,
			  spc0_unflush,
			  spc0_ldw,
			  spc0_byp,
			  spc0_flsh,
			  spc0_chm,
			  spc0_ldxa,
			  spc0_ato,
			  spc0_pref,
			  spc0_chit,
			  spc0_dcp,
			  spc0_dtp,
			  spc0_mpc,
			  spc0_mpu};

always @(spc0_exu_und)
begin
       case (spc0_exu_und)
         17'h00000 : spc0_exu =  5'h00;
         17'h00001 : spc0_exu =  5'h01;
         17'h00002 : spc0_exu =  5'h02;
         17'h00004 : spc0_exu =  5'h03;
         17'h00008 : spc0_exu =  5'h04;
         17'h00010 : spc0_exu =  5'h05;
         17'h00020 : spc0_exu =  5'h06;
         17'h00040 : spc0_exu =  5'h07;
         17'h00080 : spc0_exu =  5'h08;
         17'h00100 : spc0_exu =  5'h09;
         17'h00200 : spc0_exu =  5'h0a;
         17'h00400 : spc0_exu =  5'h0b;
         17'h00800 : spc0_exu =  5'h0c;
         17'h01000 : spc0_exu =  5'h0d;
         17'h02000 : spc0_exu =  5'h0e;
         17'h04000 : spc0_exu =  5'h0f;
         17'h08000 : spc0_exu =  5'h10;
         17'h10000 : spc0_exu =  5'h11;
	 default: spc0_exu =  5'h12;
       endcase
end
//excp
assign spc0_exp_und = {spc0_exp_wtchpt_trp_g,
			  spc0_exp_misalign_addr_ldst_atm_m,
			  spc0_exp_priv_violtn_g,
			  spc0_exp_daccess_excptn_g,
			  spc0_exp_daccess_prot_g,
			  spc0_exp_priv_action_g,
			  spc0_exp_spec_access_epage_g,
			  spc0_exp_uncache_atomic_g,
			  spc0_exp_illegal_asi_action_g,
			  spc0_exp_flt_ld_nfo_pg_g,
			  spc0_exp_asi_rd_unc,
			  spc0_exp_tlb_data_ce,
			  spc0_exp_tlb_data_ue,
			  spc0_exp_tlb_tag_ue,
			  spc0_exp_unc,
			  spc0_exp_corr};

always @(spc0_exp_und)
begin
       case (spc0_exp_und)
         16'h0000 : spc0_exp =  5'h00;
         16'h0001 : spc0_exp =  5'h01;
         16'h0002 : spc0_exp =  5'h02;
         16'h0004 : spc0_exp =  5'h03;
         16'h0008 : spc0_exp =  5'h04;
         16'h0010 : spc0_exp =  5'h05;
         16'h0020 : spc0_exp =  5'h06;
         16'h0040 : spc0_exp =  5'h07;
         16'h0080 : spc0_exp =  5'h08;
         16'h0100 : spc0_exp =  5'h09;
         16'h0200 : spc0_exp =  5'h0a;
         16'h0400 : spc0_exp =  5'h0b;
         16'h0800 : spc0_exp =  5'h0c;
         16'h1000 : spc0_exp =  5'h0d;
         16'h2000 : spc0_exp =  5'h0e;
         16'h4000 : spc0_exp =  5'h0f;
         16'h8000 : spc0_exp =  5'h10;
	 default: spc0_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc0_dctl_stxa_cmplt0 = ((spc0_dctl_stxa_internal_d2 & spc0_dctl_thread0_w3) |
				       spc0_dctl_stxa_stall_wr_cmplt0_d1);
assign spc0_dctl_l2fill_cmplt0 = (((spc0_dctl_lsu_l2fill_vld & ~spc0_dctl_atomic_ld_squash_e &
					    ~spc0_dctl_lsu_ignore_fill)) & ~spc0_dctl_l2fill_fpld_e &
					  ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread0);

assign spc0_dctl_fillerr0 = spc0_dctl_l2_corr_error_e & spc0_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc0_dctl_atm_cmplt0 = (spc0_dctl_lsu_atm_st_cmplt_e & ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread0);

assign spc0_dctl_ldst_cond_cmplt0 = { spc0_dctl_stxa_cmplt0, spc0_dctl_l2fill_cmplt0,
					    spc0_dctl_atomic_ld_squash_e, spc0_dctl_intld_byp_cmplt[0],
					    spc0_dctl_bsync0_reset, spc0_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc0_cmplt0 = { spc0_dctl_ldxa_illgl_va_cmplt_d1, spc0_dctl_pref_tlbmiss_cmplt_d2,
			      spc0_dctl_lsu_pcx_pref_issue, spc0_dctl_diag_wr_cmplt0, spc0_dctl_l2fill_fpld_e};


always @(spc0_cmplt0 or spc0_dctl_ldst_cond_cmplt0)
begin
       case ({spc0_dctl_fillerr0,spc0_dctl_ldst_cond_cmplt0,spc0_cmplt0})
         12'h000 : spc0_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc0_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc0_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc0_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc0_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc0_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc0_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc0_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc0_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc0_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc0_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc0_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc0_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc0_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc0_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc0_dctl_stxa_cmplt1 = ((spc0_dctl_stxa_internal_d2 & spc0_dctl_thread1_w3) |
				       spc0_dctl_stxa_stall_wr_cmplt1_d1);
assign spc0_dctl_l2fill_cmplt1 = (((spc0_dctl_lsu_l2fill_vld & ~spc0_dctl_atomic_ld_squash_e &
					    ~spc0_dctl_lsu_ignore_fill)) & ~spc0_dctl_l2fill_fpld_e &
					  ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread1);

assign spc0_dctl_fillerr1 = spc0_dctl_l2_corr_error_e & spc0_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc0_dctl_atm_cmplt1 = (spc0_dctl_lsu_atm_st_cmplt_e & ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread1);

assign spc0_dctl_ldst_cond_cmplt1 = { spc0_dctl_stxa_cmplt1, spc0_dctl_l2fill_cmplt1,
					    spc0_dctl_atomic_ld_squash_e, spc0_dctl_intld_byp_cmplt[1],
					    spc0_dctl_bsync1_reset, spc0_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc0_cmplt1 = { spc0_dctl_ldxa_illgl_va_cmplt_d1, spc0_dctl_pref_tlbmiss_cmplt_d2,
			      spc0_dctl_lsu_pcx_pref_issue, spc0_dctl_diag_wr_cmplt1, spc0_dctl_l2fill_fpld_e};


always @(spc0_cmplt1 or spc0_dctl_ldst_cond_cmplt1)
begin
       case ({spc0_dctl_fillerr1,spc0_dctl_ldst_cond_cmplt1,spc0_cmplt1})
         12'h000 : spc0_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc0_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc0_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc0_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc0_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc0_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc0_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc0_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc0_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc0_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc0_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc0_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc0_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc0_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc0_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc0_dctl_stxa_cmplt2 = ((spc0_dctl_stxa_internal_d2 & spc0_dctl_thread2_w3) |
				       spc0_dctl_stxa_stall_wr_cmplt2_d1);
assign spc0_dctl_l2fill_cmplt2 = (((spc0_dctl_lsu_l2fill_vld & ~spc0_dctl_atomic_ld_squash_e &
					    ~spc0_dctl_lsu_ignore_fill)) & ~spc0_dctl_l2fill_fpld_e &
					  ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread2);

assign spc0_dctl_fillerr2 = spc0_dctl_l2_corr_error_e & spc0_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc0_dctl_atm_cmplt2 = (spc0_dctl_lsu_atm_st_cmplt_e & ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread2);

assign spc0_dctl_ldst_cond_cmplt2 = { spc0_dctl_stxa_cmplt2, spc0_dctl_l2fill_cmplt2,
					    spc0_dctl_atomic_ld_squash_e, spc0_dctl_intld_byp_cmplt[2],
					    spc0_dctl_bsync2_reset, spc0_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc0_cmplt2 = { spc0_dctl_ldxa_illgl_va_cmplt_d1, spc0_dctl_pref_tlbmiss_cmplt_d2,
			      spc0_dctl_lsu_pcx_pref_issue, spc0_dctl_diag_wr_cmplt2, spc0_dctl_l2fill_fpld_e};


always @(spc0_cmplt2 or spc0_dctl_ldst_cond_cmplt2)
begin
       case ({spc0_dctl_fillerr2,spc0_dctl_ldst_cond_cmplt2,spc0_cmplt2})
         12'h000 : spc0_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc0_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc0_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc0_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc0_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc0_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc0_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc0_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc0_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc0_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc0_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc0_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc0_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc0_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc0_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc0_dctl_stxa_cmplt3 = ((spc0_dctl_stxa_internal_d2 & spc0_dctl_thread3_w3) |
				       spc0_dctl_stxa_stall_wr_cmplt3_d1);
assign spc0_dctl_l2fill_cmplt3 = (((spc0_dctl_lsu_l2fill_vld & ~spc0_dctl_atomic_ld_squash_e &
					    ~spc0_dctl_lsu_ignore_fill)) & ~spc0_dctl_l2fill_fpld_e &
					  ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread3);

assign spc0_dctl_fillerr3 = spc0_dctl_l2_corr_error_e & spc0_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc0_dctl_atm_cmplt3 = (spc0_dctl_lsu_atm_st_cmplt_e & ~spc0_dctl_fill_err_trap_e & spc0_dctl_dfill_thread3);

assign spc0_dctl_ldst_cond_cmplt3 = { spc0_dctl_stxa_cmplt3, spc0_dctl_l2fill_cmplt3,
					    spc0_dctl_atomic_ld_squash_e, spc0_dctl_intld_byp_cmplt[3],
					    spc0_dctl_bsync3_reset, spc0_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc0_cmplt3 = { spc0_dctl_ldxa_illgl_va_cmplt_d1, spc0_dctl_pref_tlbmiss_cmplt_d2,
			      spc0_dctl_lsu_pcx_pref_issue, spc0_dctl_diag_wr_cmplt3, spc0_dctl_l2fill_fpld_e};


always @(spc0_cmplt3 or spc0_dctl_ldst_cond_cmplt3)
begin
       case ({spc0_dctl_fillerr3,spc0_dctl_ldst_cond_cmplt3,spc0_cmplt3})
         12'h000 : spc0_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc0_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc0_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc0_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc0_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc0_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc0_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc0_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc0_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc0_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc0_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc0_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc0_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc0_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc0_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc0_ldstcond_cmplt0 or spc0_ldstcond_cmplt1 or spc0_ldstcond_cmplt2
	 or spc0_ldstcond_cmplt3 or spc0_dctl_lsu_ifu_ldst_cmplt
	 or spc0_dctl_late_cmplt0 or spc0_dctl_late_cmplt1 or spc0_dctl_late_cmplt2 or spc0_dctl_late_cmplt3)
begin
       case (spc0_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc0_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc0_ldstcond_cmplt_d = spc0_dctl_late_cmplt0 ? spc0_ldstcond_cmplt0_d : spc0_ldstcond_cmplt0;
         4'b0010 : spc0_ldstcond_cmplt_d = spc0_dctl_late_cmplt1 ? spc0_ldstcond_cmplt1_d : spc0_ldstcond_cmplt1;
         4'b0100 : spc0_ldstcond_cmplt_d = spc0_dctl_late_cmplt2 ? spc0_ldstcond_cmplt2_d : spc0_ldstcond_cmplt2;
         4'b1000 : spc0_ldstcond_cmplt_d = spc0_dctl_late_cmplt3 ? spc0_ldstcond_cmplt3_d : spc0_ldstcond_cmplt3;
         4'b0011 : spc0_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc0_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc0_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc0_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc0_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc0_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc0_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc0_st_ooo_ret = { spc0_st0_lt_1, spc0_st0_lt_2, spc0_st0_lt_3,
			      spc0_st1_lt_0, spc0_st1_lt_2, spc0_st1_lt_3,
			      spc0_st2_lt_0, spc0_st2_lt_1, spc0_st2_lt_3,
			      spc0_st3_lt_0, spc0_st3_lt_1, spc0_st3_lt_2};

always @(posedge clk)
begin
    if(~spc0_st0_unfilled || ~rst_l)
      spc0_st0_unfilled_d <= 1'b0;
    else
      spc0_st0_unfilled_d <= spc0_st0_unfilled;

    if(~rst_l)
      spc0_ldstcond_cmplt0_d <= 4'h0;
    else
      spc0_ldstcond_cmplt0_d <= spc0_ldstcond_cmplt0;

    if(~spc0_ld0_pkt_vld_unmasked || ~rst_l)
      spc0_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc0_ld0_pkt_vld_unmasked_d <= spc0_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc0_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc0_qctl1_ld_sec_hit_thrd0 && spc0_qctl1_ld0_inst_vld_g)
      spc0_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc0_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc0_st1_unfilled || ~rst_l)
      spc0_st1_unfilled_d <= 1'b0;
    else
      spc0_st1_unfilled_d <= spc0_st1_unfilled;

    if(~rst_l)
      spc0_ldstcond_cmplt1_d <= 4'h0;
    else
      spc0_ldstcond_cmplt1_d <= spc0_ldstcond_cmplt1;

    if(~spc0_ld1_pkt_vld_unmasked || ~rst_l)
      spc0_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc0_ld1_pkt_vld_unmasked_d <= spc0_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc0_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc0_qctl1_ld_sec_hit_thrd1 && spc0_qctl1_ld1_inst_vld_g)
      spc0_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc0_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc0_st2_unfilled || ~rst_l)
      spc0_st2_unfilled_d <= 1'b0;
    else
      spc0_st2_unfilled_d <= spc0_st2_unfilled;

    if(~rst_l)
      spc0_ldstcond_cmplt2_d <= 4'h0;
    else
      spc0_ldstcond_cmplt2_d <= spc0_ldstcond_cmplt2;

    if(~spc0_ld2_pkt_vld_unmasked || ~rst_l)
      spc0_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc0_ld2_pkt_vld_unmasked_d <= spc0_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc0_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc0_qctl1_ld_sec_hit_thrd2 && spc0_qctl1_ld2_inst_vld_g)
      spc0_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc0_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc0_st3_unfilled || ~rst_l)
      spc0_st3_unfilled_d <= 1'b0;
    else
      spc0_st3_unfilled_d <= spc0_st3_unfilled;

    if(~rst_l)
      spc0_ldstcond_cmplt3_d <= 4'h0;
    else
      spc0_ldstcond_cmplt3_d <= spc0_ldstcond_cmplt3;

    if(~spc0_ld3_pkt_vld_unmasked || ~rst_l)
      spc0_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc0_ld3_pkt_vld_unmasked_d <= spc0_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc0_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc0_qctl1_ld_sec_hit_thrd3 && spc0_qctl1_ld3_inst_vld_g)
      spc0_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc0_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc0_stb_state_ced0) && (|spc0_stb_state_rst0)) || ~rst_l)
      spc0_st0_unfilled <= 1'b0;
    else if( ((|spc0_stb_state_ced0) && ~(|spc0_stb_state_rst0)))
      spc0_st0_unfilled <= 1'b1;
    else
      spc0_st0_unfilled <= spc0_st0_unfilled;
    if( ((|spc0_stb_state_ced1) && (|spc0_stb_state_rst1)) || ~rst_l)
      spc0_st1_unfilled <= 1'b0;
    else if( ((|spc0_stb_state_ced1) && ~(|spc0_stb_state_rst1)))
      spc0_st1_unfilled <= 1'b1;
    else
      spc0_st1_unfilled <= spc0_st1_unfilled;
    if( ((|spc0_stb_state_ced2) && (|spc0_stb_state_rst2)) || ~rst_l)
      spc0_st2_unfilled <= 1'b0;
    else if( ((|spc0_stb_state_ced2) && ~(|spc0_stb_state_rst2)))
      spc0_st2_unfilled <= 1'b1;
    else
      spc0_st2_unfilled <= spc0_st2_unfilled;
    if( ((|spc0_stb_state_ced3) && (|spc0_stb_state_rst3)) || ~rst_l)
      spc0_st3_unfilled <= 1'b0;
    else if( ((|spc0_stb_state_ced3) && ~(|spc0_stb_state_rst3)))
      spc0_st3_unfilled <= 1'b1;
    else
      spc0_st3_unfilled <= spc0_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc0_st0_unfilled && spc0_st0_unfilled_d)|| ~rst_l)
      begin
        spc0_st0_unf_cntr <= 9'h000;
      end
    else if(spc0_st0_unfilled)
      begin
        spc0_st0_unf_cntr <= spc0_st0_unf_cntr + 1;
      end
    else
      begin
        spc0_st0_unf_cntr <= spc0_st0_unf_cntr;
      end
    if((~spc0_st1_unfilled && spc0_st1_unfilled_d)|| ~rst_l)
      begin
        spc0_st1_unf_cntr <= 9'h000;
      end
    else if(spc0_st1_unfilled)
      begin
        spc0_st1_unf_cntr <= spc0_st1_unf_cntr + 1;
      end
    else
      begin
        spc0_st1_unf_cntr <= spc0_st1_unf_cntr;
      end
    if((~spc0_st2_unfilled && spc0_st2_unfilled_d)|| ~rst_l)
      begin
        spc0_st2_unf_cntr <= 9'h000;
      end
    else if(spc0_st2_unfilled)
      begin
        spc0_st2_unf_cntr <= spc0_st2_unf_cntr + 1;
      end
    else
      begin
        spc0_st2_unf_cntr <= spc0_st2_unf_cntr;
      end
    if((~spc0_st3_unfilled && spc0_st3_unfilled_d)|| ~rst_l)
      begin
        spc0_st3_unf_cntr <= 9'h000;
      end
    else if(spc0_st3_unfilled)
      begin
        spc0_st3_unf_cntr <= spc0_st3_unf_cntr + 1;
      end
    else
      begin
        spc0_st3_unf_cntr <= spc0_st3_unf_cntr;
      end
end

always @(spc0_st0_unfilled or spc0_st1_unfilled or spc0_st2_unfilled or spc0_st3_unfilled
	 or spc0_st0_unfilled_d or spc0_st1_unfilled_d or spc0_st2_unfilled_d or spc0_st3_unfilled_d)
begin
if(~spc0_st0_unfilled && spc0_st0_unfilled_d && spc0_st1_unfilled)
 spc0_st0_lt_1 <= (spc0_st1_unf_cntr > spc0_st0_unf_cntr);
else
 spc0_st0_lt_1 <= 1'b0;
if(~spc0_st0_unfilled && spc0_st0_unfilled_d && spc0_st2_unfilled)
 spc0_st0_lt_2 <= (spc0_st2_unf_cntr > spc0_st0_unf_cntr);
else
 spc0_st0_lt_2 <= 1'b0;
if(~spc0_st0_unfilled && spc0_st0_unfilled_d && spc0_st3_unfilled)
 spc0_st0_lt_3 <= (spc0_st3_unf_cntr > spc0_st0_unf_cntr);
else
 spc0_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc0_st1_unfilled && spc0_st1_unfilled_d && spc0_st0_unfilled)
 spc0_st1_lt_0 <= (spc0_st0_unf_cntr > spc0_st1_unf_cntr);
else
 spc0_st1_lt_0 <= 1'b0;
if(~spc0_st1_unfilled && spc0_st1_unfilled_d && spc0_st2_unfilled)
 spc0_st1_lt_2 <= (spc0_st2_unf_cntr > spc0_st1_unf_cntr);
else
 spc0_st1_lt_2 <= 1'b0;
if(~spc0_st1_unfilled && spc0_st1_unfilled_d && spc0_st3_unfilled)
 spc0_st1_lt_3 <= (spc0_st3_unf_cntr > spc0_st1_unf_cntr);
else
 spc0_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc0_st2_unfilled && spc0_st2_unfilled_d && spc0_st0_unfilled)
 spc0_st2_lt_0 <= (spc0_st0_unf_cntr > spc0_st2_unf_cntr);
else
 spc0_st2_lt_0 <= 1'b0;
if(~spc0_st2_unfilled && spc0_st2_unfilled_d && spc0_st1_unfilled)
 spc0_st2_lt_1 <= (spc0_st1_unf_cntr > spc0_st2_unf_cntr);
else
 spc0_st2_lt_1 <= 1'b0;
if(~spc0_st2_unfilled && spc0_st2_unfilled_d && spc0_st3_unfilled)
 spc0_st2_lt_3 <= (spc0_st3_unf_cntr > spc0_st2_unf_cntr);
else
 spc0_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc0_st3_unfilled && spc0_st3_unfilled_d && spc0_st0_unfilled)
 spc0_st3_lt_0 <= (spc0_st0_unf_cntr > spc0_st3_unf_cntr);
else
 spc0_st3_lt_0 <= 1'b0;
if(~spc0_st3_unfilled && spc0_st3_unfilled_d && spc0_st1_unfilled)
 spc0_st3_lt_1 <= (spc0_st1_unf_cntr > spc0_st3_unf_cntr);
else
 spc0_st3_lt_1 <= 1'b0;
if(~spc0_st3_unfilled && spc0_st3_unfilled_d && spc0_st2_unfilled)
 spc0_st3_lt_2 <= (spc0_st2_unf_cntr > spc0_st3_unf_cntr);
else
 spc0_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc0_ld_ooo_ret = { spc0_ld0_lt_1, spc0_ld0_lt_2, spc0_ld0_lt_3,
			      spc0_ld1_lt_0, spc0_ld1_lt_2, spc0_ld1_lt_3,
			      spc0_ld2_lt_0, spc0_ld2_lt_1, spc0_ld2_lt_3,
			      spc0_ld3_lt_0, spc0_ld3_lt_1, spc0_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc0_ld0_unfilled && spc0_ld0_unfilled_d)|| ~rst_l)
      begin
        spc0_ld0_unf_cntr <= 9'h000;
      end
    else if(spc0_ld0_unfilled)
      begin
        spc0_ld0_unf_cntr <= spc0_ld0_unf_cntr + 1;
      end
    else
      begin
        spc0_ld0_unf_cntr <= spc0_ld0_unf_cntr;
      end
    if((~spc0_ld1_unfilled && spc0_ld1_unfilled_d)|| ~rst_l)
      begin
        spc0_ld1_unf_cntr <= 9'h000;
      end
    else if(spc0_ld1_unfilled)
      begin
        spc0_ld1_unf_cntr <= spc0_ld1_unf_cntr + 1;
      end
    else
      begin
        spc0_ld1_unf_cntr <= spc0_ld1_unf_cntr;
      end
    if((~spc0_ld2_unfilled && spc0_ld2_unfilled_d)|| ~rst_l)
      begin
        spc0_ld2_unf_cntr <= 9'h000;
      end
    else if(spc0_ld2_unfilled)
      begin
        spc0_ld2_unf_cntr <= spc0_ld2_unf_cntr + 1;
      end
    else
      begin
        spc0_ld2_unf_cntr <= spc0_ld2_unf_cntr;
      end
    if((~spc0_ld3_unfilled && spc0_ld3_unfilled_d)|| ~rst_l)
      begin
        spc0_ld3_unf_cntr <= 9'h000;
      end
    else if(spc0_ld3_unfilled)
      begin
        spc0_ld3_unf_cntr <= spc0_ld3_unf_cntr + 1;
      end
    else
      begin
        spc0_ld3_unf_cntr <= spc0_ld3_unf_cntr;
      end
end

always @(spc0_ld0_unfilled or spc0_ld1_unfilled or spc0_ld2_unfilled or spc0_ld3_unfilled
	 or spc0_ld0_unfilled_d or spc0_ld1_unfilled_d or spc0_ld2_unfilled_d or spc0_ld3_unfilled_d)
begin
if(~spc0_ld0_unfilled && spc0_ld0_unfilled_d && spc0_ld1_unfilled)
 spc0_ld0_lt_1 <= (spc0_ld1_unf_cntr > spc0_ld0_unf_cntr);
else
 spc0_ld0_lt_1 <= 1'b0;
if(~spc0_ld0_unfilled && spc0_ld0_unfilled_d && spc0_ld2_unfilled)
 spc0_ld0_lt_2 <= (spc0_ld2_unf_cntr > spc0_ld0_unf_cntr);
else
 spc0_ld0_lt_2 <= 1'b0;
if(~spc0_ld0_unfilled && spc0_ld0_unfilled_d && spc0_ld3_unfilled)
 spc0_ld0_lt_3 <= (spc0_ld3_unf_cntr > spc0_ld0_unf_cntr);
else
 spc0_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc0_ld1_unfilled && spc0_ld1_unfilled_d && spc0_ld0_unfilled)
 spc0_ld1_lt_0 <= (spc0_ld0_unf_cntr > spc0_ld1_unf_cntr);
else
 spc0_ld1_lt_0 <= 1'b0;
if(~spc0_ld1_unfilled && spc0_ld1_unfilled_d && spc0_ld2_unfilled)
 spc0_ld1_lt_2 <= (spc0_ld2_unf_cntr > spc0_ld1_unf_cntr);
else
 spc0_ld1_lt_2 <= 1'b0;
if(~spc0_ld1_unfilled && spc0_ld1_unfilled_d && spc0_ld3_unfilled)
 spc0_ld1_lt_3 <= (spc0_ld3_unf_cntr > spc0_ld1_unf_cntr);
else
 spc0_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc0_ld2_unfilled && spc0_ld2_unfilled_d && spc0_ld0_unfilled)
 spc0_ld2_lt_0 <= (spc0_ld0_unf_cntr > spc0_ld2_unf_cntr);
else
 spc0_ld2_lt_0 <= 1'b0;
if(~spc0_ld2_unfilled && spc0_ld2_unfilled_d && spc0_ld1_unfilled)
 spc0_ld2_lt_1 <= (spc0_ld1_unf_cntr > spc0_ld2_unf_cntr);
else
 spc0_ld2_lt_1 <= 1'b0;
if(~spc0_ld2_unfilled && spc0_ld2_unfilled_d && spc0_ld3_unfilled)
 spc0_ld2_lt_3 <= (spc0_ld3_unf_cntr > spc0_ld2_unf_cntr);
else
 spc0_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc0_ld3_unfilled && spc0_ld3_unfilled_d && spc0_ld0_unfilled)
 spc0_ld3_lt_0 <= (spc0_ld0_unf_cntr > spc0_ld3_unf_cntr);
else
 spc0_ld3_lt_0 <= 1'b0;
if(~spc0_ld3_unfilled && spc0_ld3_unfilled_d && spc0_ld1_unfilled)
 spc0_ld3_lt_1 <= (spc0_ld1_unf_cntr > spc0_ld3_unf_cntr);
else
 spc0_ld3_lt_1 <= 1'b0;
if(~spc0_ld3_unfilled && spc0_ld3_unfilled_d && spc0_ld2_unfilled)
 spc0_ld3_lt_2 <= (spc0_ld2_unf_cntr > spc0_ld3_unf_cntr);
else
 spc0_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc0_dctl_bld_hit =
((|spc0_dctl_lsu_way_hit[3:0])  & spc0_dctl_dcache_enable_g &
  ~spc0_dctl_ldxa_internal & ~spc0_dctl_dcache_rd_parity_error & ~spc0_dctl_dtag_perror_g &
  ~spc0_dctl_endian_mispred_g &
  ~spc0_dctl_atomic_g & ~spc0_dctl_ncache_asild_rq_g) & ~spc0_dctl_tte_data_perror_unc &
  spc0_dctl_ld_inst_vld_g & spc0_qctl1_bld_g ;

assign spc0_dctl_bld_stb_hit = spc0_dctl_bld_hit & spc0_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc0_bld0_full_d <= 2'b00;
      spc0_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc0_bld0_full_d <= spc0_qctl1_bld_cnt;
      spc0_ld0_unfilled_d <= spc0_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc0_bld1_full_d <= 2'b00;
      spc0_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc0_bld1_full_d <= spc0_qctl1_bld_cnt;
      spc0_ld1_unfilled_d <= spc0_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc0_bld2_full_d <= 2'b00;
      spc0_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc0_bld2_full_d <= spc0_qctl1_bld_cnt;
      spc0_ld2_unfilled_d <= spc0_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc0_bld3_full_d <= 2'b00;
      spc0_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc0_bld3_full_d <= spc0_qctl1_bld_cnt;
      spc0_ld3_unfilled_d <= spc0_ld3_unfilled;
     end
end
always @(spc0_bld0_full_d or spc0_qctl1_bld_cnt)
begin
 if( (spc0_bld0_full_d != spc0_qctl1_bld_cnt) && (spc0_bld0_full_d == 2'd0))
    spc0_bld0_full_capture <= 1'b1;
 else
    spc0_bld0_full_capture <= 1'b0;
end
always @(spc0_bld1_full_d or spc0_qctl1_bld_cnt)
begin
 if( (spc0_bld1_full_d != spc0_qctl1_bld_cnt) && (spc0_bld1_full_d == 2'd1))
    spc0_bld1_full_capture <= 1'b1;
 else
    spc0_bld1_full_capture <= 1'b0;
end
always @(spc0_bld2_full_d or spc0_qctl1_bld_cnt)
begin
 if( (spc0_bld2_full_d != spc0_qctl1_bld_cnt) && (spc0_bld2_full_d == 2'd2))
    spc0_bld2_full_capture <= 1'b1;
 else
    spc0_bld2_full_capture <= 1'b0;
end
always @(spc0_bld3_full_d or spc0_qctl1_bld_cnt)
begin
 if( (spc0_bld3_full_d != spc0_qctl1_bld_cnt) && (spc0_bld3_full_d == 2'd3))
    spc0_bld3_full_capture <= 1'b1;
 else
    spc0_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc0_qctl1_bld_cnt != 2'b00) && (spc0_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc0_bld0_full_cntr <= 9'h000;
      end
    else if(spc0_qctl1_bld_g && (spc0_qctl1_bld_cnt == 2'b00))
      begin
        spc0_bld0_full_cntr <= spc0_bld0_full_cntr + 1;
      end
    else if( (spc0_qctl1_bld_cnt == 2'b00) && (spc0_bld0_full_cntr != 9'h000))
      begin
        spc0_bld0_full_cntr <= spc0_bld0_full_cntr + 1;
      end
    else
      begin
        spc0_bld0_full_cntr <= spc0_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc0_qctl1_bld_cnt != 2'b01) && (spc0_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc0_bld1_full_cntr <= 9'h000;
      end
    else if(spc0_qctl1_bld_cnt == 2'b01)
      begin
        spc0_bld1_full_cntr <= spc0_bld1_full_cntr + 1;
      end
    else if( (spc0_qctl1_bld_cnt == 2'b01) && (spc0_bld1_full_cntr != 9'h000))
      begin
        spc0_bld1_full_cntr <= spc0_bld1_full_cntr + 1;
      end
    else
      begin
        spc0_bld1_full_cntr <= spc0_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc0_qctl1_bld_cnt != 2'b10) && (spc0_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc0_bld2_full_cntr <= 9'h000;
      end
    else if(spc0_qctl1_bld_cnt == 2'b10)
      begin
        spc0_bld2_full_cntr <= spc0_bld2_full_cntr + 1;
      end
    else if( (spc0_qctl1_bld_cnt == 2'b10) && (spc0_bld2_full_cntr != 9'h000))
      begin
        spc0_bld2_full_cntr <= spc0_bld2_full_cntr + 1;
      end
    else
      begin
        spc0_bld2_full_cntr <= spc0_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc0_qctl1_bld_cnt != 2'b11) && (spc0_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc0_bld3_full_cntr <= 9'h000;
      end
    else if(spc0_qctl1_bld_cnt == 2'b11)
      begin
        spc0_bld3_full_cntr <= spc0_bld3_full_cntr + 1;
      end
    else if( (spc0_qctl1_bld_cnt == 2'b11) && (spc0_bld3_full_cntr != 9'h000))
      begin
        spc0_bld3_full_cntr <= spc0_bld3_full_cntr + 1;
      end
    else
      begin
        spc0_bld3_full_cntr <= spc0_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc0_stb_state_vld0) && ~spc0_atomic_g) || ~rst_l)
      begin
        spc0_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc0_atomic_g && (spc0_atm_type0 != 8'h00) && spc0_wptr_vld)
      begin
        spc0_stb_atm_addr0 <= {spc0_wdata_ramc[44:9],spc0_wdata_ramd[67:64]};
      end
    else
      begin
        spc0_stb_atm_addr0 <= spc0_stb_atm_addr0;
      end
    if( ( ~(|spc0_stb_state_vld1) && ~spc0_atomic_g) || ~rst_l)
      begin
        spc0_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc0_atomic_g && (spc0_atm_type1 != 8'h00) && spc0_wptr_vld)
      begin
        spc0_stb_atm_addr1 <= {spc0_wdata_ramc[44:9],spc0_wdata_ramd[67:64]};
      end
    else
      begin
        spc0_stb_atm_addr1 <= spc0_stb_atm_addr1;
      end
    if( ( ~(|spc0_stb_state_vld2) && ~spc0_atomic_g) || ~rst_l)
      begin
        spc0_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc0_atomic_g && (spc0_atm_type2 != 8'h00) && spc0_wptr_vld)
      begin
        spc0_stb_atm_addr2 <= {spc0_wdata_ramc[44:9],spc0_wdata_ramd[67:64]};
      end
    else
      begin
        spc0_stb_atm_addr2 <= spc0_stb_atm_addr2;
      end
    if( ( ~(|spc0_stb_state_vld3) && ~spc0_atomic_g) || ~rst_l)
      begin
        spc0_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc0_atomic_g && (spc0_atm_type3 != 8'h00) && spc0_wptr_vld)
      begin
        spc0_stb_atm_addr3 <= {spc0_wdata_ramc[44:9],spc0_wdata_ramd[67:64]};
      end
    else
      begin
        spc0_stb_atm_addr3 <= spc0_stb_atm_addr3;
      end
end

 assign spc0_dfq_full = (spc0_dfq_vld_entries >= 3'd4);


assign spc0_dfq_full1 = (spc0_dfq_vld_entries >= (3'd4 + 1));

always @(spc0_dfq_full_d1 or spc0_dfq_full1)
begin
  if (spc0_dfq_full_d1 && ~spc0_dfq_full1)
    spc0_dfq_full_capture1 <= 1'b1;
  else
    spc0_dfq_full_capture1 <= 1'b0;
end

assign spc0_dfq_full2 = (spc0_dfq_vld_entries >= (3'd4 + 2));

always @(spc0_dfq_full_d2 or spc0_dfq_full2)
begin
  if (spc0_dfq_full_d2 && ~spc0_dfq_full2)
    spc0_dfq_full_capture2 <= 1'b1;
  else
    spc0_dfq_full_capture2 <= 1'b0;
end

assign spc0_dfq_full3 = (spc0_dfq_vld_entries >= (3'd4 + 3));

always @(spc0_dfq_full_d3 or spc0_dfq_full3)
begin
  if (spc0_dfq_full_d3 && ~spc0_dfq_full3)
    spc0_dfq_full_capture3 <= 1'b1;
  else
    spc0_dfq_full_capture3 <= 1'b0;
end

assign spc0_dfq_full4 = (spc0_dfq_vld_entries >= (3'd4 + 4));

always @(spc0_dfq_full_d4 or spc0_dfq_full4)
begin
  if (spc0_dfq_full_d4 && ~spc0_dfq_full4)
    spc0_dfq_full_capture4 <= 1'b1;
  else
    spc0_dfq_full_capture4 <= 1'b0;
end

assign spc0_dfq_full5 = (spc0_dfq_vld_entries >= (3'd4 + 5));

always @(spc0_dfq_full_d5 or spc0_dfq_full5)
begin
  if (spc0_dfq_full_d5 && ~spc0_dfq_full5)
    spc0_dfq_full_capture5 <= 1'b1;
  else
    spc0_dfq_full_capture5 <= 1'b0;
end

assign spc0_dfq_full6 = (spc0_dfq_vld_entries >= (3'd4 + 6));

always @(spc0_dfq_full_d6 or spc0_dfq_full6)
begin
  if (spc0_dfq_full_d6 && ~spc0_dfq_full6)
    spc0_dfq_full_capture6 <= 1'b1;
  else
    spc0_dfq_full_capture6 <= 1'b0;
end

assign spc0_dfq_full7 = (spc0_dfq_vld_entries >= (3'd4 + 7));

always @(spc0_dfq_full_d7 or spc0_dfq_full7)
begin
  if (spc0_dfq_full_d7 && ~spc0_dfq_full7)
    spc0_dfq_full_capture7 <= 1'b1;
  else
    spc0_dfq_full_capture7 <= 1'b0;
end

always @(spc0_mbar_vld_d0 or spc0_mbar_vld0)
begin
  if (spc0_mbar_vld_d0 && ~spc0_mbar_vld0)
    spc0_mbar_vld_capture0 <= 1'b1;
  else
    spc0_mbar_vld_capture0 <= 1'b0;
end
always @(spc0_mbar_vld_d1 or spc0_mbar_vld1)
begin
  if (spc0_mbar_vld_d1 && ~spc0_mbar_vld1)
    spc0_mbar_vld_capture1 <= 1'b1;
  else
    spc0_mbar_vld_capture1 <= 1'b0;
end
always @(spc0_mbar_vld_d2 or spc0_mbar_vld2)
begin
  if (spc0_mbar_vld_d2 && ~spc0_mbar_vld2)
    spc0_mbar_vld_capture2 <= 1'b1;
  else
    spc0_mbar_vld_capture2 <= 1'b0;
end
always @(spc0_mbar_vld_d3 or spc0_mbar_vld3)
begin
  if (spc0_mbar_vld_d3 && ~spc0_mbar_vld3)
    spc0_mbar_vld_capture3 <= 1'b1;
  else
    spc0_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc0_dfq_full1 && (spc0_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr1 <= 9'h000;
       spc0_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr1);
      end
    else if( spc0_dfq_full1)
      begin
       spc0_dfq_full_cntr1 <= spc0_dfq_full_cntr1 + 1;
       spc0_dfq_full_d1 <= spc0_dfq_full1;
      end
    else
      begin
       spc0_dfq_full_cntr1 <= spc0_dfq_full_cntr1;
       spc0_dfq_full_d1 <= spc0_dfq_full1;
      end
    if( ( ~spc0_dfq_full2 && (spc0_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr2 <= 9'h000;
       spc0_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr2);
      end
    else if( spc0_dfq_full2)
      begin
       spc0_dfq_full_cntr2 <= spc0_dfq_full_cntr2 + 1;
       spc0_dfq_full_d2 <= spc0_dfq_full2;
      end
    else
      begin
       spc0_dfq_full_cntr2 <= spc0_dfq_full_cntr2;
       spc0_dfq_full_d2 <= spc0_dfq_full2;
      end
    if( ( ~spc0_dfq_full3 && (spc0_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr3 <= 9'h000;
       spc0_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr3);
      end
    else if( spc0_dfq_full3)
      begin
       spc0_dfq_full_cntr3 <= spc0_dfq_full_cntr3 + 1;
       spc0_dfq_full_d3 <= spc0_dfq_full3;
      end
    else
      begin
       spc0_dfq_full_cntr3 <= spc0_dfq_full_cntr3;
       spc0_dfq_full_d3 <= spc0_dfq_full3;
      end
    if( ( ~spc0_dfq_full4 && (spc0_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr4 <= 9'h000;
       spc0_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr4);
      end
    else if( spc0_dfq_full4)
      begin
       spc0_dfq_full_cntr4 <= spc0_dfq_full_cntr4 + 1;
       spc0_dfq_full_d4 <= spc0_dfq_full4;
      end
    else
      begin
       spc0_dfq_full_cntr4 <= spc0_dfq_full_cntr4;
       spc0_dfq_full_d4 <= spc0_dfq_full4;
      end
    if( ( ~spc0_dfq_full5 && (spc0_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr5 <= 9'h000;
       spc0_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr5);
      end
    else if( spc0_dfq_full5)
      begin
       spc0_dfq_full_cntr5 <= spc0_dfq_full_cntr5 + 1;
       spc0_dfq_full_d5 <= spc0_dfq_full5;
      end
    else
      begin
       spc0_dfq_full_cntr5 <= spc0_dfq_full_cntr5;
       spc0_dfq_full_d5 <= spc0_dfq_full5;
      end
    if( ( ~spc0_dfq_full6 && (spc0_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr6 <= 9'h000;
       spc0_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr6);
      end
    else if( spc0_dfq_full6)
      begin
       spc0_dfq_full_cntr6 <= spc0_dfq_full_cntr6 + 1;
       spc0_dfq_full_d6 <= spc0_dfq_full6;
      end
    else
      begin
       spc0_dfq_full_cntr6 <= spc0_dfq_full_cntr6;
       spc0_dfq_full_d6 <= spc0_dfq_full6;
      end
    if( ( ~spc0_dfq_full7 && (spc0_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr7 <= 9'h000;
       spc0_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr7);
      end
    else if( spc0_dfq_full7)
      begin
       spc0_dfq_full_cntr7 <= spc0_dfq_full_cntr7 + 1;
       spc0_dfq_full_d7 <= spc0_dfq_full7;
      end
    else
      begin
       spc0_dfq_full_cntr7 <= spc0_dfq_full_cntr7;
       spc0_dfq_full_d7 <= spc0_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc0_intrpt0_cmplt or spc0_atm_cntr0 or spc0_stb_state_ced0)
begin
  if (spc0_intrpt0_cmplt && (spc0_atm_cntr0 != 9'h000) && ~(|spc0_stb_state_ced0))
    spc0_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc0_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc0_intrpt1_cmplt or spc0_atm_cntr1 or spc0_stb_state_ced1)
begin
  if (spc0_intrpt1_cmplt && (spc0_atm_cntr1 != 9'h000) && ~(|spc0_stb_state_ced1))
    spc0_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc0_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc0_intrpt2_cmplt or spc0_atm_cntr2 or spc0_stb_state_ced2)
begin
  if (spc0_intrpt2_cmplt && (spc0_atm_cntr2 != 9'h000) && ~(|spc0_stb_state_ced2))
    spc0_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc0_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc0_intrpt3_cmplt or spc0_atm_cntr3 or spc0_stb_state_ced3)
begin
  if (spc0_intrpt3_cmplt && (spc0_atm_cntr3 != 9'h000) && ~(|spc0_stb_state_ced3))
    spc0_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc0_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc0_intrpt0_cmplt or spc0_atm_cntr0 or spc0_stb_state_ced0)
begin
  if (spc0_intrpt0_cmplt && (spc0_atm_cntr0 != 9'h000) && (|spc0_stb_state_ced0))
    spc0_atm_intrpt_capture0 <= 1'b1;
  else
    spc0_atm_intrpt_capture0 <= 1'b0;
end
always @(spc0_intrpt1_cmplt or spc0_atm_cntr1 or spc0_stb_state_ced1)
begin
  if (spc0_intrpt1_cmplt && (spc0_atm_cntr1 != 9'h000) && (|spc0_stb_state_ced1))
    spc0_atm_intrpt_capture1 <= 1'b1;
  else
    spc0_atm_intrpt_capture1 <= 1'b0;
end
always @(spc0_intrpt2_cmplt or spc0_atm_cntr2 or spc0_stb_state_ced2)
begin
  if (spc0_intrpt2_cmplt && (spc0_atm_cntr2 != 9'h000) && (|spc0_stb_state_ced2))
    spc0_atm_intrpt_capture2 <= 1'b1;
  else
    spc0_atm_intrpt_capture2 <= 1'b0;
end
always @(spc0_intrpt3_cmplt or spc0_atm_cntr3 or spc0_stb_state_ced3)
begin
  if (spc0_intrpt3_cmplt && (spc0_atm_cntr3 != 9'h000) && (|spc0_stb_state_ced3))
    spc0_atm_intrpt_capture3 <= 1'b1;
  else
    spc0_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc0_atm_cntr0 or spc0_dva_din or spc0_dva_wen)
begin
  if (~spc0_dva_din && spc0_dva_wen && (spc0_atm_cntr0 != 9'h000))
    spc0_atm_inv_capture0 <= 1'b1;
  else
    spc0_atm_inv_capture0 <= 1'b0;
end
always @(spc0_atm_cntr1 or spc0_dva_din or spc0_dva_wen)
begin
  if (~spc0_dva_din && spc0_dva_wen && (spc0_atm_cntr1 != 9'h000))
    spc0_atm_inv_capture1 <= 1'b1;
  else
    spc0_atm_inv_capture1 <= 1'b0;
end
always @(spc0_atm_cntr2 or spc0_dva_din or spc0_dva_wen)
begin
  if (~spc0_dva_din && spc0_dva_wen && (spc0_atm_cntr2 != 9'h000))
    spc0_atm_inv_capture2 <= 1'b1;
  else
    spc0_atm_inv_capture2 <= 1'b0;
end
always @(spc0_atm_cntr3 or spc0_dva_din or spc0_dva_wen)
begin
  if (~spc0_dva_din && spc0_dva_wen && (spc0_atm_cntr3 != 9'h000))
    spc0_atm_inv_capture3 <= 1'b1;
  else
    spc0_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc0_stb_state_vld0) && (spc0_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_atm_cntr0 <= 9'h000;
       spc0_atm0_d <= 1'b0;
      end
    else if( spc0_atomic_g && (spc0_atm_type0 != 8'h00))
      begin
       spc0_atm_cntr0 <= spc0_atm_cntr0 + 1;
       spc0_atm0_d <= 1'b1;
      end
    else if( spc0_atm0_d && (|spc0_stb_state_vld0))
      begin
       spc0_atm_cntr0 <= spc0_atm_cntr0 + 1;
       spc0_atm0_d <= spc0_atm0_d;
      end
    else
      begin
       spc0_atm_cntr0 <= spc0_atm_cntr0;
       spc0_atm0_d <= spc0_atm0_d;
      end
    if( ( ~(|spc0_stb_state_vld1) && (spc0_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_atm_cntr1 <= 9'h000;
       spc0_atm1_d <= 1'b0;
      end
    else if( spc0_atomic_g && (spc0_atm_type1 != 8'h00))
      begin
       spc0_atm_cntr1 <= spc0_atm_cntr1 + 1;
       spc0_atm1_d <= 1'b1;
      end
    else if( spc0_atm1_d && (|spc0_stb_state_vld1))
      begin
       spc0_atm_cntr1 <= spc0_atm_cntr1 + 1;
       spc0_atm1_d <= spc0_atm1_d;
      end
    else
      begin
       spc0_atm_cntr1 <= spc0_atm_cntr1;
       spc0_atm1_d <= spc0_atm1_d;
      end
    if( ( ~(|spc0_stb_state_vld2) && (spc0_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_atm_cntr2 <= 9'h000;
       spc0_atm2_d <= 1'b0;
      end
    else if( spc0_atomic_g && (spc0_atm_type2 != 8'h00))
      begin
       spc0_atm_cntr2 <= spc0_atm_cntr2 + 1;
       spc0_atm2_d <= 1'b1;
      end
    else if( spc0_atm2_d && (|spc0_stb_state_vld2))
      begin
       spc0_atm_cntr2 <= spc0_atm_cntr2 + 1;
       spc0_atm2_d <= spc0_atm2_d;
      end
    else
      begin
       spc0_atm_cntr2 <= spc0_atm_cntr2;
       spc0_atm2_d <= spc0_atm2_d;
      end
    if( ( ~(|spc0_stb_state_vld3) && (spc0_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_atm_cntr3 <= 9'h000;
       spc0_atm3_d <= 1'b0;
      end
    else if( spc0_atomic_g && (spc0_atm_type3 != 8'h00))
      begin
       spc0_atm_cntr3 <= spc0_atm_cntr3 + 1;
       spc0_atm3_d <= 1'b1;
      end
    else if( spc0_atm3_d && (|spc0_stb_state_vld3))
      begin
       spc0_atm_cntr3 <= spc0_atm_cntr3 + 1;
       spc0_atm3_d <= spc0_atm3_d;
      end
    else
      begin
       spc0_atm_cntr3 <= spc0_atm_cntr3;
       spc0_atm3_d <= spc0_atm3_d;
      end
end

 assign spc0_raw_ack_capture0 = spc0_stb_ack_vld0 && (spc0_stb_ack_cntr0 != 9'h000);
 assign spc0_stb_ced0 = |spc0_stb_state_ced0;
 assign spc0_raw_ack_capture1 = spc0_stb_ack_vld1 && (spc0_stb_ack_cntr1 != 9'h000);
 assign spc0_stb_ced1 = |spc0_stb_state_ced1;
 assign spc0_raw_ack_capture2 = spc0_stb_ack_vld2 && (spc0_stb_ack_cntr2 != 9'h000);
 assign spc0_stb_ced2 = |spc0_stb_state_ced2;
 assign spc0_raw_ack_capture3 = spc0_stb_ack_vld3 && (spc0_stb_ack_cntr3 != 9'h000);
 assign spc0_stb_ced3 = |spc0_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc0_stb_ced0 && (spc0_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ced_cntr0 <= 9'h000;
       spc0_stb_ced0_d <= 1'b0;
      end
    else if( spc0_stb_ced0 && (spc0_stb_state_ack0 == 8'h00))
      begin
       spc0_stb_ced_cntr0 <= spc0_stb_ced_cntr0 + 1;
       spc0_stb_ced0_d <= spc0_stb_ced0;
      end
    else
      begin
       spc0_stb_ced_cntr0 <= spc0_stb_ced_cntr0;
       spc0_stb_ced0_d <= spc0_stb_ced0_d;
      end

    if( ( ~spc0_mbar_vld0 && (spc0_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_mbar_vld_cntr0 <= 9'h000;
       spc0_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_mbar_vld_counter = %d", spc0_mbar_vld_cntr0);
      end
    else if( spc0_mbar_vld0)
      begin
       spc0_mbar_vld_cntr0 <= spc0_mbar_vld_cntr0 + 1;
       spc0_mbar_vld_d0 <= spc0_mbar_vld0;
      end
    else
      begin
       spc0_mbar_vld_cntr0 <= spc0_mbar_vld_cntr0;
       spc0_mbar_vld_d0 <= spc0_mbar_vld0;
      end

    if( ( ~spc0_flsh_vld0 && (spc0_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_flsh_vld_cntr0 <= 9'h000;
       spc0_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_flsh_vld_counter = %d", spc0_flsh_vld_cntr0);
      end
    else if( spc0_flsh_vld0)
      begin
       spc0_flsh_vld_cntr0 <= spc0_flsh_vld_cntr0 + 1;
       spc0_flsh_vld_d0 <= spc0_flsh_vld0;
      end
    else
      begin
       spc0_flsh_vld_cntr0 <= spc0_flsh_vld_cntr0;
       spc0_flsh_vld_d0 <= spc0_flsh_vld0;
      end

    if( ( ~spc0_stb_ced1 && (spc0_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ced_cntr1 <= 9'h000;
       spc0_stb_ced1_d <= 1'b0;
      end
    else if( spc0_stb_ced1 && (spc0_stb_state_ack1 == 8'h00))
      begin
       spc0_stb_ced_cntr1 <= spc0_stb_ced_cntr1 + 1;
       spc0_stb_ced1_d <= spc0_stb_ced1;
      end
    else
      begin
       spc0_stb_ced_cntr1 <= spc0_stb_ced_cntr1;
       spc0_stb_ced1_d <= spc0_stb_ced1_d;
      end

    if( ( ~spc0_mbar_vld1 && (spc0_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_mbar_vld_cntr1 <= 9'h000;
       spc0_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_mbar_vld_counter = %d", spc0_mbar_vld_cntr1);
      end
    else if( spc0_mbar_vld1)
      begin
       spc0_mbar_vld_cntr1 <= spc0_mbar_vld_cntr1 + 1;
       spc0_mbar_vld_d1 <= spc0_mbar_vld1;
      end
    else
      begin
       spc0_mbar_vld_cntr1 <= spc0_mbar_vld_cntr1;
       spc0_mbar_vld_d1 <= spc0_mbar_vld1;
      end

    if( ( ~spc0_flsh_vld1 && (spc0_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_flsh_vld_cntr1 <= 9'h000;
       spc0_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_flsh_vld_counter = %d", spc0_flsh_vld_cntr1);
      end
    else if( spc0_flsh_vld1)
      begin
       spc0_flsh_vld_cntr1 <= spc0_flsh_vld_cntr1 + 1;
       spc0_flsh_vld_d1 <= spc0_flsh_vld1;
      end
    else
      begin
       spc0_flsh_vld_cntr1 <= spc0_flsh_vld_cntr1;
       spc0_flsh_vld_d1 <= spc0_flsh_vld1;
      end

    if( ( ~spc0_stb_ced2 && (spc0_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ced_cntr2 <= 9'h000;
       spc0_stb_ced2_d <= 1'b0;
      end
    else if( spc0_stb_ced2 && (spc0_stb_state_ack2 == 8'h00))
      begin
       spc0_stb_ced_cntr2 <= spc0_stb_ced_cntr2 + 1;
       spc0_stb_ced2_d <= spc0_stb_ced2;
      end
    else
      begin
       spc0_stb_ced_cntr2 <= spc0_stb_ced_cntr2;
       spc0_stb_ced2_d <= spc0_stb_ced2_d;
      end

    if( ( ~spc0_mbar_vld2 && (spc0_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_mbar_vld_cntr2 <= 9'h000;
       spc0_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_mbar_vld_counter = %d", spc0_mbar_vld_cntr2);
      end
    else if( spc0_mbar_vld2)
      begin
       spc0_mbar_vld_cntr2 <= spc0_mbar_vld_cntr2 + 1;
       spc0_mbar_vld_d2 <= spc0_mbar_vld2;
      end
    else
      begin
       spc0_mbar_vld_cntr2 <= spc0_mbar_vld_cntr2;
       spc0_mbar_vld_d2 <= spc0_mbar_vld2;
      end

    if( ( ~spc0_flsh_vld2 && (spc0_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_flsh_vld_cntr2 <= 9'h000;
       spc0_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_flsh_vld_counter = %d", spc0_flsh_vld_cntr2);
      end
    else if( spc0_flsh_vld2)
      begin
       spc0_flsh_vld_cntr2 <= spc0_flsh_vld_cntr2 + 1;
       spc0_flsh_vld_d2 <= spc0_flsh_vld2;
      end
    else
      begin
       spc0_flsh_vld_cntr2 <= spc0_flsh_vld_cntr2;
       spc0_flsh_vld_d2 <= spc0_flsh_vld2;
      end

    if( ( ~spc0_stb_ced3 && (spc0_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ced_cntr3 <= 9'h000;
       spc0_stb_ced3_d <= 1'b0;
      end
    else if( spc0_stb_ced3 && (spc0_stb_state_ack3 == 8'h00))
      begin
       spc0_stb_ced_cntr3 <= spc0_stb_ced_cntr3 + 1;
       spc0_stb_ced3_d <= spc0_stb_ced3;
      end
    else
      begin
       spc0_stb_ced_cntr3 <= spc0_stb_ced_cntr3;
       spc0_stb_ced3_d <= spc0_stb_ced3_d;
      end

    if( ( ~spc0_mbar_vld3 && (spc0_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_mbar_vld_cntr3 <= 9'h000;
       spc0_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_mbar_vld_counter = %d", spc0_mbar_vld_cntr3);
      end
    else if( spc0_mbar_vld3)
      begin
       spc0_mbar_vld_cntr3 <= spc0_mbar_vld_cntr3 + 1;
       spc0_mbar_vld_d3 <= spc0_mbar_vld3;
      end
    else
      begin
       spc0_mbar_vld_cntr3 <= spc0_mbar_vld_cntr3;
       spc0_mbar_vld_d3 <= spc0_mbar_vld3;
      end

    if( ( ~spc0_flsh_vld3 && (spc0_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_flsh_vld_cntr3 <= 9'h000;
       spc0_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_flsh_vld_counter = %d", spc0_flsh_vld_cntr3);
      end
    else if( spc0_flsh_vld3)
      begin
       spc0_flsh_vld_cntr3 <= spc0_flsh_vld_cntr3 + 1;
       spc0_flsh_vld_d3 <= spc0_flsh_vld3;
      end
    else
      begin
       spc0_flsh_vld_cntr3 <= spc0_flsh_vld_cntr3;
       spc0_flsh_vld_d3 <= spc0_flsh_vld3;
      end

end

always @(spc0_flsh_vld_d0 or spc0_flsh_vld0)
begin
  if (spc0_flsh_vld_d0 && ~spc0_flsh_vld0)
    spc0_flsh_vld_capture0 <= 1'b1;
  else
    spc0_flsh_vld_capture0 <= 1'b0;
end
always @(spc0_flsh_vld_d1 or spc0_flsh_vld1)
begin
  if (spc0_flsh_vld_d1 && ~spc0_flsh_vld1)
    spc0_flsh_vld_capture1 <= 1'b1;
  else
    spc0_flsh_vld_capture1 <= 1'b0;
end
always @(spc0_flsh_vld_d2 or spc0_flsh_vld2)
begin
  if (spc0_flsh_vld_d2 && ~spc0_flsh_vld2)
    spc0_flsh_vld_capture2 <= 1'b1;
  else
    spc0_flsh_vld_capture2 <= 1'b0;
end
always @(spc0_flsh_vld_d3 or spc0_flsh_vld3)
begin
  if (spc0_flsh_vld_d3 && ~spc0_flsh_vld3)
    spc0_flsh_vld_capture3 <= 1'b1;
  else
    spc0_flsh_vld_capture3 <= 1'b0;
end

always @(spc0_lmiss_pa0 or spc0_imiss_pa or spc0_imiss_vld_d or spc0_lmiss_vld0)
begin
if((spc0_lmiss_pa0 == spc0_imiss_pa) && spc0_imiss_vld_d && spc0_lmiss_vld0)
 spc0_lmiss_eq0 = 1'b1;
else
 spc0_lmiss_eq0 = 1'b0;
end
always @(spc0_lmiss_pa1 or spc0_imiss_pa or spc0_imiss_vld_d or spc0_lmiss_vld1)
begin
if((spc0_lmiss_pa1 == spc0_imiss_pa) && spc0_imiss_vld_d && spc0_lmiss_vld1)
 spc0_lmiss_eq1 = 1'b1;
else
 spc0_lmiss_eq1 = 1'b0;
end
always @(spc0_lmiss_pa2 or spc0_imiss_pa or spc0_imiss_vld_d or spc0_lmiss_vld2)
begin
if((spc0_lmiss_pa2 == spc0_imiss_pa) && spc0_imiss_vld_d && spc0_lmiss_vld2)
 spc0_lmiss_eq2 = 1'b1;
else
 spc0_lmiss_eq2 = 1'b0;
end
always @(spc0_lmiss_pa3 or spc0_imiss_pa or spc0_imiss_vld_d or spc0_lmiss_vld3)
begin
if((spc0_lmiss_pa3 == spc0_imiss_pa) && spc0_imiss_vld_d && spc0_lmiss_vld3)
 spc0_lmiss_eq3 = 1'b1;
else
 spc0_lmiss_eq3 = 1'b0;
end

always @(spc0_lmiss_pa0 or spc0_stb_atm_addr0 or spc0_atm_cntr0 or spc0_lmiss_vld0)
begin
if ( ((spc0_lmiss_pa0 == spc0_stb_atm_addr0) && (spc0_atm_cntr0 != 9'h000) && spc0_lmiss_vld0) ||
     ((spc0_lmiss_pa1 == spc0_stb_atm_addr0) && (spc0_atm_cntr0 != 9'h000) && spc0_lmiss_vld1) ||
     ((spc0_lmiss_pa2 == spc0_stb_atm_addr0) && (spc0_atm_cntr0 != 9'h000) && spc0_lmiss_vld2) ||
     ((spc0_lmiss_pa3 == spc0_stb_atm_addr0) && (spc0_atm_cntr0 != 9'h000) && spc0_lmiss_vld3) )

 spc0_atm_lmiss_eq0 = 1'b1;
else
 spc0_atm_lmiss_eq0 = 1'b0;
end
always @(spc0_lmiss_pa1 or spc0_stb_atm_addr1 or spc0_atm_cntr1 or spc0_lmiss_vld1)
begin
if ( ((spc0_lmiss_pa0 == spc0_stb_atm_addr1) && (spc0_atm_cntr1 != 9'h000) && spc0_lmiss_vld0) ||
     ((spc0_lmiss_pa1 == spc0_stb_atm_addr1) && (spc0_atm_cntr1 != 9'h000) && spc0_lmiss_vld1) ||
     ((spc0_lmiss_pa2 == spc0_stb_atm_addr1) && (spc0_atm_cntr1 != 9'h000) && spc0_lmiss_vld2) ||
     ((spc0_lmiss_pa3 == spc0_stb_atm_addr1) && (spc0_atm_cntr1 != 9'h000) && spc0_lmiss_vld3) )

 spc0_atm_lmiss_eq1 = 1'b1;
else
 spc0_atm_lmiss_eq1 = 1'b0;
end
always @(spc0_lmiss_pa2 or spc0_stb_atm_addr2 or spc0_atm_cntr2 or spc0_lmiss_vld2)
begin
if ( ((spc0_lmiss_pa0 == spc0_stb_atm_addr2) && (spc0_atm_cntr2 != 9'h000) && spc0_lmiss_vld0) ||
     ((spc0_lmiss_pa1 == spc0_stb_atm_addr2) && (spc0_atm_cntr2 != 9'h000) && spc0_lmiss_vld1) ||
     ((spc0_lmiss_pa2 == spc0_stb_atm_addr2) && (spc0_atm_cntr2 != 9'h000) && spc0_lmiss_vld2) ||
     ((spc0_lmiss_pa3 == spc0_stb_atm_addr2) && (spc0_atm_cntr2 != 9'h000) && spc0_lmiss_vld3) )

 spc0_atm_lmiss_eq2 = 1'b1;
else
 spc0_atm_lmiss_eq2 = 1'b0;
end
always @(spc0_lmiss_pa3 or spc0_stb_atm_addr3 or spc0_atm_cntr3 or spc0_lmiss_vld3)
begin
if ( ((spc0_lmiss_pa0 == spc0_stb_atm_addr3) && (spc0_atm_cntr3 != 9'h000) && spc0_lmiss_vld0) ||
     ((spc0_lmiss_pa1 == spc0_stb_atm_addr3) && (spc0_atm_cntr3 != 9'h000) && spc0_lmiss_vld1) ||
     ((spc0_lmiss_pa2 == spc0_stb_atm_addr3) && (spc0_atm_cntr3 != 9'h000) && spc0_lmiss_vld2) ||
     ((spc0_lmiss_pa3 == spc0_stb_atm_addr3) && (spc0_atm_cntr3 != 9'h000) && spc0_lmiss_vld3) )

 spc0_atm_lmiss_eq3 = 1'b1;
else
 spc0_atm_lmiss_eq3 = 1'b0;
end

always @(spc0_imiss_pa or spc0_stb_atm_addr0 or spc0_atm_cntr0 or spc0_imiss_vld_d)
begin
if((spc0_imiss_pa == spc0_stb_atm_addr0) && (spc0_atm_cntr0 != 9'h000) && spc0_imiss_vld_d)
 spc0_atm_imiss_eq0 = 1'b1;
else
 spc0_atm_imiss_eq0 = 1'b0;
end
always @(spc0_imiss_pa or spc0_stb_atm_addr1 or spc0_atm_cntr1 or spc0_imiss_vld_d)
begin
if((spc0_imiss_pa == spc0_stb_atm_addr1) && (spc0_atm_cntr1 != 9'h000) && spc0_imiss_vld_d)
 spc0_atm_imiss_eq1 = 1'b1;
else
 spc0_atm_imiss_eq1 = 1'b0;
end
always @(spc0_imiss_pa or spc0_stb_atm_addr2 or spc0_atm_cntr2 or spc0_imiss_vld_d)
begin
if((spc0_imiss_pa == spc0_stb_atm_addr2) && (spc0_atm_cntr2 != 9'h000) && spc0_imiss_vld_d)
 spc0_atm_imiss_eq2 = 1'b1;
else
 spc0_atm_imiss_eq2 = 1'b0;
end
always @(spc0_imiss_pa or spc0_stb_atm_addr3 or spc0_atm_cntr3 or spc0_imiss_vld_d)
begin
if((spc0_imiss_pa == spc0_stb_atm_addr3) && (spc0_atm_cntr3 != 9'h000) && spc0_imiss_vld_d)
 spc0_atm_imiss_eq3 = 1'b1;
else
 spc0_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc0_imiss_vld || ~rst_l)
   spc0_imiss_vld_d <= 1'b0;
 else
   spc0_imiss_vld_d <= spc0_imiss_vld;

 if( ~spc0_ld_miss || ~rst_l)
   spc0_ld_miss_capture <= 1'b0;
 else
   spc0_ld_miss_capture <= spc0_ld_miss;

end

always @(spc0_stb_ced0 or spc0_stb_ced0_d)
begin
if (~spc0_stb_ced0 && spc0_stb_ced0_d)
spc0_stb_ced_capture0 <= 1'b1;
else
spc0_stb_ced_capture0 <= 1'b0;

end
always @(spc0_stb_ced1 or spc0_stb_ced1_d)
begin
if (~spc0_stb_ced1 && spc0_stb_ced1_d)
spc0_stb_ced_capture1 <= 1'b1;
else
spc0_stb_ced_capture1 <= 1'b0;

end
always @(spc0_stb_ced2 or spc0_stb_ced2_d)
begin
if (~spc0_stb_ced2 && spc0_stb_ced2_d)
spc0_stb_ced_capture2 <= 1'b1;
else
spc0_stb_ced_capture2 <= 1'b0;

end
always @(spc0_stb_ced3 or spc0_stb_ced3_d)
begin
if (~spc0_stb_ced3 && spc0_stb_ced3_d)
spc0_stb_ced_capture3 <= 1'b1;
else
spc0_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc0_stb_state_ack0 != 8'h00 && (spc0_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_ack_counter0 = %d", spc0_stb_ack_cntr0);
      end
    else if(spc0_stb_cam_hit && spc0_ld0_inst_vld_g && (spc0_stb_state_ack0 == 8'h00))
      begin
       spc0_stb_ack_cntr0 <= spc0_stb_ack_cntr0 + 1;
      end
    else if( (spc0_stb_state_ack0 == 8'h00 ) && (spc0_stb_ack_cntr0 != 9'h000))
      begin
       spc0_stb_ack_cntr0 <= spc0_stb_ack_cntr0 + 1;
      end // if ( (spc0_stb_state_ack0 == 8'h00 ) && (spc0_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc0_stb_ack_cntr0 <= spc0_stb_ack_cntr0;
      end

    if( (spc0_stb_state_ack1 != 8'h00 && (spc0_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_ack_counter1 = %d", spc0_stb_ack_cntr1);
      end
    else if(spc0_stb_cam_hit && spc0_ld1_inst_vld_g && (spc0_stb_state_ack1 == 8'h00))
      begin
       spc0_stb_ack_cntr1 <= spc0_stb_ack_cntr1 + 1;
      end
    else if( (spc0_stb_state_ack1 == 8'h00 ) && (spc0_stb_ack_cntr1 != 9'h000))
      begin
       spc0_stb_ack_cntr1 <= spc0_stb_ack_cntr1 + 1;
      end // if ( (spc0_stb_state_ack1 == 8'h00 ) && (spc0_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc0_stb_ack_cntr1 <= spc0_stb_ack_cntr1;
      end

    if( (spc0_stb_state_ack2 != 8'h00 && (spc0_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_ack_counter2 = %d", spc0_stb_ack_cntr2);
      end
    else if(spc0_stb_cam_hit && spc0_ld2_inst_vld_g && (spc0_stb_state_ack2 == 8'h00))
      begin
       spc0_stb_ack_cntr2 <= spc0_stb_ack_cntr2 + 1;
      end
    else if( (spc0_stb_state_ack2 == 8'h00 ) && (spc0_stb_ack_cntr2 != 9'h000))
      begin
       spc0_stb_ack_cntr2 <= spc0_stb_ack_cntr2 + 1;
      end // if ( (spc0_stb_state_ack2 == 8'h00 ) && (spc0_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc0_stb_ack_cntr2 <= spc0_stb_ack_cntr2;
      end

    if( (spc0_stb_state_ack3 != 8'h00 && (spc0_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_ack_counter3 = %d", spc0_stb_ack_cntr3);
      end
    else if(spc0_stb_cam_hit && spc0_ld3_inst_vld_g && (spc0_stb_state_ack3 == 8'h00))
      begin
       spc0_stb_ack_cntr3 <= spc0_stb_ack_cntr3 + 1;
      end
    else if( (spc0_stb_state_ack3 == 8'h00 ) && (spc0_stb_ack_cntr3 != 9'h000))
      begin
       spc0_stb_ack_cntr3 <= spc0_stb_ack_cntr3 + 1;
      end // if ( (spc0_stb_state_ack3 == 8'h00 ) && (spc0_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc0_stb_ack_cntr3 <= spc0_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc0_stb0_full_w2 or spc0_stb0_full)
begin
if (~spc0_stb0_full_w2 && spc0_stb0_full)
spc0_stb_full_capture0 <= 1'b1;
else
spc0_stb_full_capture0 <= 1'b0;

end
always @(spc0_stb1_full_w2 or spc0_stb1_full)
begin
if (~spc0_stb1_full_w2 && spc0_stb1_full)
spc0_stb_full_capture1 <= 1'b1;
else
spc0_stb_full_capture1 <= 1'b0;

end
always @(spc0_stb2_full_w2 or spc0_stb2_full)
begin
if (~spc0_stb2_full_w2 && spc0_stb2_full)
spc0_stb_full_capture2 <= 1'b1;
else
spc0_stb_full_capture2 <= 1'b0;

end
always @(spc0_stb3_full_w2 or spc0_stb3_full)
begin
if (~spc0_stb3_full_w2 && spc0_stb3_full)
spc0_stb_full_capture3 <= 1'b1;
else
spc0_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc0_stb0_full && (spc0_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_full_counter0 = %d", spc0_stb_full_cntr0);
      end
    else if( spc0_stb0_full)
      begin
       spc0_stb_full_cntr0 <= spc0_stb_full_cntr0 + 1;
      end
    else
      begin
       spc0_stb_full_cntr0 <= spc0_stb_full_cntr0;
      end
    if( ( ~spc0_stb1_full && (spc0_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_full_counter1 = %d", spc0_stb_full_cntr1);
      end
    else if( spc0_stb1_full)
      begin
       spc0_stb_full_cntr1 <= spc0_stb_full_cntr1 + 1;
      end
    else
      begin
       spc0_stb_full_cntr1 <= spc0_stb_full_cntr1;
      end
    if( ( ~spc0_stb2_full && (spc0_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_full_counter2 = %d", spc0_stb_full_cntr2);
      end
    else if( spc0_stb2_full)
      begin
       spc0_stb_full_cntr2 <= spc0_stb_full_cntr2 + 1;
      end
    else
      begin
       spc0_stb_full_cntr2 <= spc0_stb_full_cntr2;
      end
    if( ( ~spc0_stb3_full && (spc0_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc0_stb_full_counter3 = %d", spc0_stb_full_cntr3);
      end
    else if( spc0_stb3_full)
      begin
       spc0_stb_full_cntr3 <= spc0_stb_full_cntr3 + 1;
      end
    else
      begin
       spc0_stb_full_cntr3 <= spc0_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc0_lmq0_full_d or spc0_lmq0_full)
begin
if (spc0_lmq0_full_d && ~spc0_lmq0_full)
spc0_lmq_full_capture0 <= 1'b1;
else
spc0_lmq_full_capture0 <= 1'b0;

end
always @(spc0_lmq1_full_d or spc0_lmq1_full)
begin
if (spc0_lmq1_full_d && ~spc0_lmq1_full)
spc0_lmq_full_capture1 <= 1'b1;
else
spc0_lmq_full_capture1 <= 1'b0;

end
always @(spc0_lmq2_full_d or spc0_lmq2_full)
begin
if (spc0_lmq2_full_d && ~spc0_lmq2_full)
spc0_lmq_full_capture2 <= 1'b1;
else
spc0_lmq_full_capture2 <= 1'b0;

end
always @(spc0_lmq3_full_d or spc0_lmq3_full)
begin
if (spc0_lmq3_full_d && ~spc0_lmq3_full)
spc0_lmq_full_capture3 <= 1'b1;
else
spc0_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc0_lmq0_full && (spc0_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc0_lmq_full_cntr0 <= 9'h000;
       spc0_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_lmq_full_counter0 = %d", spc0_lmq_full_cntr0);
      end
    else if( spc0_lmq0_full)
      begin
       spc0_lmq_full_cntr0 <= spc0_lmq_full_cntr0 + 1;
       spc0_lmq0_full_d <= spc0_lmq0_full;
      end
    else
      begin
       spc0_lmq_full_cntr0 <= spc0_lmq_full_cntr0;
       spc0_lmq0_full_d <= spc0_lmq0_full;
      end

    if( ( ~spc0_lmq1_full && (spc0_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc0_lmq_full_cntr1 <= 9'h000;
       spc0_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_lmq_full_counter1 = %d", spc0_lmq_full_cntr1);
      end
    else if( spc0_lmq1_full)
      begin
       spc0_lmq_full_cntr1 <= spc0_lmq_full_cntr1 + 1;
       spc0_lmq1_full_d <= spc0_lmq1_full;
      end
    else
      begin
       spc0_lmq_full_cntr1 <= spc0_lmq_full_cntr1;
       spc0_lmq1_full_d <= spc0_lmq1_full;
      end

    if( ( ~spc0_lmq2_full && (spc0_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc0_lmq_full_cntr2 <= 9'h000;
       spc0_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_lmq_full_counter2 = %d", spc0_lmq_full_cntr2);
      end
    else if( spc0_lmq2_full)
      begin
       spc0_lmq_full_cntr2 <= spc0_lmq_full_cntr2 + 1;
       spc0_lmq2_full_d <= spc0_lmq2_full;
      end
    else
      begin
       spc0_lmq_full_cntr2 <= spc0_lmq_full_cntr2;
       spc0_lmq2_full_d <= spc0_lmq2_full;
      end

    if( ( ~spc0_lmq3_full && (spc0_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc0_lmq_full_cntr3 <= 9'h000;
       spc0_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_lmq_full_counter3 = %d", spc0_lmq_full_cntr3);
      end
    else if( spc0_lmq3_full)
      begin
       spc0_lmq_full_cntr3 <= spc0_lmq_full_cntr3 + 1;
       spc0_lmq3_full_d <= spc0_lmq3_full;
      end
    else
      begin
       spc0_lmq_full_cntr3 <= spc0_lmq_full_cntr3;
       spc0_lmq3_full_d <= spc0_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc0_dfq_full_d or spc0_dfq_full)
begin
  if (spc0_dfq_full_d && ~spc0_dfq_full)
    spc0_dfq_full_capture <= 1'b1;
  else
    spc0_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc0_dfq_full && (spc0_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc0_dfq_full_cntr <= 9'h000;
       spc0_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dfq_full_counter = %d", spc0_dfq_full_cntr);
      end
    else if( spc0_dfq_full)
      begin
       spc0_dfq_full_cntr <= spc0_dfq_full_cntr + 1;
       spc0_dfq_full_d <= spc0_dfq_full;
      end
    else
      begin
       spc0_dfq_full_cntr <= spc0_dfq_full_cntr;
       spc0_dfq_full_d <= spc0_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc0_dva_full_d or spc0_dva_inv)
begin
  if (spc0_dva_full_d && ~spc0_dva_inv)
    spc0_dva_full_capture <= 1'b1;
  else
    spc0_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc0_dva_din && spc0_dva_wen)
    begin
     spc0_dva_inv <= 1'b1;
     spc0_dva_waddr_d <= spc0_dva_waddr;
    end
  else if(~spc0_dva_din && spc0_dva_wen)
    begin
     spc0_dva_inv <= 1'b0;
     spc0_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc0_dva_inv <= spc0_dva_inv;
     spc0_dva_waddr_d <= spc0_dva_waddr_d;
    end
end

always @(spc0_dva_raddr or spc0_dva_ren or spc0_dva_inv)
begin
  if (spc0_dva_inv && spc0_dva_ren && (spc0_dva_raddr[6:2] == spc0_dva_waddr_d))
    spc0_dva_vld2lkup <= 1'b1;
  else
    spc0_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc0_dva_inv && (spc0_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc0_dva_full_cntr <= 9'h000;
       spc0_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc0_dva_full_counter = %d", spc0_dva_full_cntr);
      end
    else if( spc0_dva_inv)
      begin
       spc0_dva_full_cntr <= spc0_dva_full_cntr + 1;
       spc0_dva_full_d <= spc0_dva_inv;
      end
    else
      begin
       spc0_dva_full_cntr <= spc0_dva_full_cntr;
       spc0_dva_full_d <= spc0_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc0_dva_vfull_d or spc0_dva_vld)
begin
  if (spc0_dva_vfull_d && ~spc0_dva_vld)
    spc0_dva_vfull_capture <= 1'b1;
  else
    spc0_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc0_dva_din && spc0_dva_wen)
   begin
    spc0_dva_vld <= 1'b1;
    spc0_dva_invwaddr_d <= spc0_dva_waddr;
    spc0_dva_invld_err <= spc0_dva_inv_perror;
   end
  else if(spc0_dva_din && spc0_dva_wen)
    begin
     spc0_dva_vld <= 1'b0;
     spc0_dva_invwaddr_d <= 5'b00000;
     spc0_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc0_dva_vld <= spc0_dva_vld;
     spc0_dva_invwaddr_d <= spc0_dva_invwaddr_d;
     spc0_dva_invld_err <= spc0_dva_invld_err;
    end
end


always @(spc0_dva_raddr or spc0_dva_ren or spc0_dva_vld)
begin
  if (spc0_dva_vld && spc0_dva_ren && (spc0_dva_raddr[6:2] == spc0_dva_waddr_d))
    spc0_dva_invld2lkup <= 1'b1;
  else
    spc0_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc0_dva_vld && (spc0_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc0_dva_vfull_cntr <= 9'h000;
    spc0_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc0_dva_vfull_counter = %d", spc0_dva_vfull_cntr);
  end
    else if( spc0_dva_vld)
    begin
      spc0_dva_vfull_cntr <= spc0_dva_vfull_cntr + 1;
      spc0_dva_vfull_d <= spc0_dva_vld;
    end
    else
    begin
      spc0_dva_vfull_cntr <= spc0_dva_vfull_cntr;
      spc0_dva_vfull_d <= spc0_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc0_dva_raddr or spc0_dva_waddr or spc0_dva_ren or spc0_dva_wen)
begin
  if ( spc0_dva_ren && spc0_dva_wen && (spc0_dva_raddr[6:2] == spc0_dva_waddr))
    spc0_dva_collide <= 1'b1;
  else
    spc0_dva_collide <= 1'b0;
end

// dva error cases

always @(spc0_dva_raddr or spc0_dva_ren or spc0_dva_dtag_perror or spc0_dva_dtag_perror)
begin
  if (spc0_dva_ren && (spc0_dva_dtag_perror || spc0_dva_dtag_perror))
    spc0_dva_err <= 1'b1;
  else
    spc0_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc0_dva_err)
     spc0_dva_efull_d <= 1'b1;
  else
     spc0_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc0_dva_ren && ~(spc0_dva_dtag_perror || spc0_dva_dtag_perror ) &&
       (spc0_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc0_dva_efull_cntr <= 9'h000;
     spc0_dva_raddr_d <= spc0_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc0_dva_efull_counter = %d", spc0_dva_efull_cntr);
    end
  else if(spc0_dva_efull_d)
    begin
      spc0_dva_efull_cntr <= spc0_dva_efull_cntr + 1;
      spc0_dva_raddr_d <= spc0_dva_raddr_d;
    end
  else
    begin
      spc0_dva_efull_cntr <= spc0_dva_efull_cntr;
      spc0_dva_raddr_d <= spc0_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC1

wire 	   spc1_dva_ren 	        = `SPARC_CORE1.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc1_dva_wen 	        = `SPARC_CORE1.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc1_dva_din 	        = `SPARC_CORE1.sparc0.lsu.dva_din_e;
wire [3:0] spc1_dva_dout 	        = `SPARC_CORE1.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc1_dva_raddr 	        = `SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc1_dva_waddr 	        = `SPARC_CORE1.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc1_dva_dtag_perror 	= `SPARC_CORE1.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc1_dva_dcache_perror 	= `SPARC_CORE1.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc1_dva_inv_perror 	= `SPARC_CORE1.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc1_ld_miss 	        = `SPARC_CORE1.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc1_ld_miss_capture;

wire 	   spc1_atomic_g 	        = `SPARC_CORE1.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc1_atm_type0 	= `SPARC_CORE1.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc1_atm_type1 	= `SPARC_CORE1.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc1_atm_type2 	= `SPARC_CORE1.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc1_atm_type3 	= `SPARC_CORE1.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc1_dctl_lsu_way_hit 	= `SPARC_CORE1.sparc0.lsu.dctl.lsu_way_hit;
wire       spc1_dctl_dcache_enable_g 	= `SPARC_CORE1.sparc0.lsu.dctl.dcache_enable_g;
wire       spc1_dctl_ldxa_internal 	= `SPARC_CORE1.sparc0.lsu.dctl.ldxa_internal;
wire       spc1_dctl_ldst_dbl_g 	= `SPARC_CORE1.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc1_dctl_atomic_g 	= `SPARC_CORE1.sparc0.lsu.dctl.atomic_g;
wire       spc1_dctl_stb_cam_hit 	= `SPARC_CORE1.sparc0.lsu.dctl.stb_cam_hit;
wire       spc1_dctl_endian_mispred_g 	= `SPARC_CORE1.sparc0.lsu.dctl.endian_mispred_g;
wire       spc1_dctl_dcache_rd_parity_error 	= `SPARC_CORE1.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc1_dctl_dtag_perror_g 	= `SPARC_CORE1.sparc0.lsu.dctl.dtag_perror_g;
wire       spc1_dctl_tte_data_perror_unc 	= `SPARC_CORE1.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc1_dctl_ld_inst_vld_g 	= `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc1_dctl_lsu_alt_space_g 	= `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc1_dctl_recognized_asi_g 	= `SPARC_CORE1.sparc0.lsu.dctl.recognized_asi_g;
wire       spc1_dctl_ncache_asild_rq_g  = `SPARC_CORE1.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc1_dctl_bld_hit;
wire       spc1_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc1_ixinv0  = `SPARC_CORE1.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc1_ixinv1  = `SPARC_CORE1.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc1_ixinv2  = `SPARC_CORE1.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc1_ixinv3  = `SPARC_CORE1.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc1_ifill  = `SPARC_CORE1.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc1_inv  = `SPARC_CORE1.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc1_inv_clr  = `SPARC_CORE1.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc1_ibuf_busy  = `SPARC_CORE1.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc1_l2  = `SPARC_CORE1.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc1_unc  = `SPARC_CORE1.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc1_fpld  = `SPARC_CORE1.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc1_fpldst  = `SPARC_CORE1.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc1_unflush  = `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc1_ldw  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc1_byp  = `SPARC_CORE1.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc1_flsh  = `SPARC_CORE1.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc1_chm  = `SPARC_CORE1.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc1_ldxa  = `SPARC_CORE1.sparc0.lsu.dctl.ldxa_internal ;
wire       spc1_ato  = `SPARC_CORE1.sparc0.lsu.dctl.atomic_g ;
wire       spc1_pref  = `SPARC_CORE1.sparc0.lsu.dctl.pref_inst_g ;
wire       spc1_chit  = `SPARC_CORE1.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc1_dcp  = `SPARC_CORE1.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc1_dtp  = `SPARC_CORE1.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc1_mpc  = `SPARC_CORE1.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc1_mpc  = 1'b0;
wire       spc1_mpu  = `SPARC_CORE1.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc1_exu_und;
reg  [4:0] spc1_exu;

// excptn
wire spc1_exp_wtchpt_trp_g                    = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc1_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc1_exp_priv_violtn_g                    = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc1_exp_daccess_excptn_g                 = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc1_exp_daccess_prot_g                   = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc1_exp_priv_action_g                    = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc1_exp_spec_access_epage_g              = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc1_exp_uncache_atomic_g                 = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc1_exp_illegal_asi_action_g             = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc1_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc1_exp_asi_rd_unc                       = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc1_exp_tlb_data_ce                     = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc1_exp_asi_rd_unc                       = 1'b0;
wire spc1_exp_tlb_data_ce                     =  1'b0;

wire spc1_exp_tlb_data_ue                     = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc1_exp_tlb_tag_ue                      = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc1_exp_unc                  = `SPARC_CORE1.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc1_exp_corr                 = `SPARC_CORE1.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc1_exp_corr                 = 1'b0;
wire [15:0] spc1_exp_und;
reg  [4:0] spc1_exp;
// dctl cmplt

wire       spc1_dctl_stxa_internal_d2  = `SPARC_CORE1.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc1_dctl_lsu_l2fill_vld  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc1_dctl_atomic_ld_squash_e  = `SPARC_CORE1.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc1_dctl_lsu_ignore_fill  = `SPARC_CORE1.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc1_dctl_l2fill_fpld_e  = `SPARC_CORE1.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc1_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc1_dctl_fill_err_trap_e  = `SPARC_CORE1.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc1_dctl_l2_corr_error_e  = `SPARC_CORE1.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc1_dctl_intld_byp_cmplt  = `SPARC_CORE1.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc1_dctl_lsu_intrpt_cmplt  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc1_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE1.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc1_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE1.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc1_dctl_lsu_pcx_pref_issue  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc1_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE1.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc1_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc1_ldstcond_cmplt_d;

wire       spc1_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE1.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc1_qctl1_ld0_inst_vld_g  = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc1_ld0_pkt_vld_unmasked  = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc1_ld0_pkt_vld_unmasked_d;
reg	   spc1_qctl1_ld_sec_hit_thrd0_w2;

wire       spc1_dctl_thread0_w3  = `SPARC_CORE1.sparc0.lsu.dctl.thread0_w3;
wire       spc1_dctl_dfill_thread0  = `SPARC_CORE1.sparc0.lsu.dctl.dfill_thread0;
wire       spc1_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc1_dctl_diag_wr_cmplt0  = `SPARC_CORE1.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc1_dctl_bsync0_reset  = `SPARC_CORE1.sparc0.lsu.dctl.bsync0_reset;
wire       spc1_dctl_late_cmplt0  = `SPARC_CORE1.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc1_dctl_stxa_cmplt0;
wire       spc1_dctl_l2fill_cmplt0;
wire       spc1_dctl_atm_cmplt0;
wire       spc1_dctl_fillerr0;
wire [4:0] spc1_cmplt0;
wire [5:0] spc1_dctl_ldst_cond_cmplt0;
reg  [3:0] spc1_ldstcond_cmplt0;
reg  [3:0] spc1_ldstcond_cmplt0_d;

wire       spc1_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE1.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc1_qctl1_ld1_inst_vld_g  = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc1_ld1_pkt_vld_unmasked  = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc1_ld1_pkt_vld_unmasked_d;
reg	   spc1_qctl1_ld_sec_hit_thrd1_w2;

wire       spc1_dctl_thread1_w3  = `SPARC_CORE1.sparc0.lsu.dctl.thread1_w3;
wire       spc1_dctl_dfill_thread1  = `SPARC_CORE1.sparc0.lsu.dctl.dfill_thread1;
wire       spc1_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc1_dctl_diag_wr_cmplt1  = `SPARC_CORE1.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc1_dctl_bsync1_reset  = `SPARC_CORE1.sparc0.lsu.dctl.bsync1_reset;
wire       spc1_dctl_late_cmplt1  = `SPARC_CORE1.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc1_dctl_stxa_cmplt1;
wire       spc1_dctl_l2fill_cmplt1;
wire       spc1_dctl_atm_cmplt1;
wire       spc1_dctl_fillerr1;
wire [4:0] spc1_cmplt1;
wire [5:0] spc1_dctl_ldst_cond_cmplt1;
reg  [3:0] spc1_ldstcond_cmplt1;
reg  [3:0] spc1_ldstcond_cmplt1_d;

wire       spc1_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE1.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc1_qctl1_ld2_inst_vld_g  = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc1_ld2_pkt_vld_unmasked  = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc1_ld2_pkt_vld_unmasked_d;
reg	   spc1_qctl1_ld_sec_hit_thrd2_w2;

wire       spc1_dctl_thread2_w3  = `SPARC_CORE1.sparc0.lsu.dctl.thread2_w3;
wire       spc1_dctl_dfill_thread2  = `SPARC_CORE1.sparc0.lsu.dctl.dfill_thread2;
wire       spc1_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc1_dctl_diag_wr_cmplt2  = `SPARC_CORE1.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc1_dctl_bsync2_reset  = `SPARC_CORE1.sparc0.lsu.dctl.bsync2_reset;
wire       spc1_dctl_late_cmplt2  = `SPARC_CORE1.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc1_dctl_stxa_cmplt2;
wire       spc1_dctl_l2fill_cmplt2;
wire       spc1_dctl_atm_cmplt2;
wire       spc1_dctl_fillerr2;
wire [4:0] spc1_cmplt2;
wire [5:0] spc1_dctl_ldst_cond_cmplt2;
reg  [3:0] spc1_ldstcond_cmplt2;
reg  [3:0] spc1_ldstcond_cmplt2_d;

wire       spc1_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE1.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc1_qctl1_ld3_inst_vld_g  = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc1_ld3_pkt_vld_unmasked  = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc1_ld3_pkt_vld_unmasked_d;
reg	   spc1_qctl1_ld_sec_hit_thrd3_w2;

wire       spc1_dctl_thread3_w3  = `SPARC_CORE1.sparc0.lsu.dctl.thread3_w3;
wire       spc1_dctl_dfill_thread3  = `SPARC_CORE1.sparc0.lsu.dctl.dfill_thread3;
wire       spc1_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc1_dctl_diag_wr_cmplt3  = `SPARC_CORE1.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc1_dctl_bsync3_reset  = `SPARC_CORE1.sparc0.lsu.dctl.bsync3_reset;
wire       spc1_dctl_late_cmplt3  = `SPARC_CORE1.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc1_dctl_stxa_cmplt3;
wire       spc1_dctl_l2fill_cmplt3;
wire       spc1_dctl_atm_cmplt3;
wire       spc1_dctl_fillerr3;
wire [4:0] spc1_cmplt3;
wire [5:0] spc1_dctl_ldst_cond_cmplt3;
reg  [3:0] spc1_ldstcond_cmplt3;
reg  [3:0] spc1_ldstcond_cmplt3_d;


wire       spc1_qctl1_bld_g 	= `SPARC_CORE1.sparc0.lsu.qctl1.bld_g;
wire       spc1_qctl1_bld_reset 	= `SPARC_CORE1.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc1_qctl1_bld_cnt 	= `SPARC_CORE1.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc1_bld0_full_cntr;
reg  [1:0] spc1_bld0_full_d;
reg 	   spc1_bld0_full_capture;
reg  [9:0] spc1_bld1_full_cntr;
reg  [1:0] spc1_bld1_full_d;
reg 	   spc1_bld1_full_capture;
reg  [9:0] spc1_bld2_full_cntr;
reg  [1:0] spc1_bld2_full_d;
reg 	   spc1_bld2_full_capture;
reg  [9:0] spc1_bld3_full_cntr;
reg  [1:0] spc1_bld3_full_d;
reg 	   spc1_bld3_full_capture;

wire       spc1_ipick 	= `SPARC_CORE1.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc1_lpick 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc1_spick 	= `SPARC_CORE1.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc1_mpick 	= `SPARC_CORE1.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc1_apick 	= `SPARC_CORE1.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc1_msquash 	= `SPARC_CORE1.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc1_fpicko;
wire [3:0] spc1_fpick;

wire [39:0] spc1_imiss_pa 	= `SPARC_CORE1.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc1_imiss_vld 	= `SPARC_CORE1.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc1_imiss_vld_d;
wire [39:0] spc1_lmiss_pa0 	= `SPARC_CORE1.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc1_lmiss_vld0 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc1_ld_pkt_vld0 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc1_st_pkt_vld0 	= `SPARC_CORE1.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc1_lmiss_eq0;
reg             spc1_atm_imiss_eq0;
wire [39:0] spc1_lmiss_pa1 	= `SPARC_CORE1.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc1_lmiss_vld1 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc1_ld_pkt_vld1 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc1_st_pkt_vld1 	= `SPARC_CORE1.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc1_lmiss_eq1;
reg             spc1_atm_imiss_eq1;
wire [39:0] spc1_lmiss_pa2 	= `SPARC_CORE1.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc1_lmiss_vld2 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc1_ld_pkt_vld2 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc1_st_pkt_vld2 	= `SPARC_CORE1.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc1_lmiss_eq2;
reg             spc1_atm_imiss_eq2;
wire [39:0] spc1_lmiss_pa3 	= `SPARC_CORE1.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc1_lmiss_vld3 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc1_ld_pkt_vld3 	= `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc1_st_pkt_vld3 	= `SPARC_CORE1.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc1_lmiss_eq3;
reg             spc1_atm_imiss_eq3;

wire [44:0]	spc1_wdata_ramc = `SPARC_CORE1.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc1_wptr_vld   = `SPARC_CORE1.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc1_wdata_ramd = {`SPARC_CORE1.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE1.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc1_stb_cam_hit 	        = `SPARC_CORE1.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc1_stb_cam_hit_ptr 	= `SPARC_CORE1.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc1_stb_ld_full_raw	= `SPARC_CORE1.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc1_stb_ld_partial_raw	= `SPARC_CORE1.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc1_stb_cam_mhit		= `SPARC_CORE1.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc1_dfq_vld_entries 	= `SPARC_CORE1.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc1_dfq_full;
reg  [9:0] spc1_dfq_full_cntr;
reg        spc1_dfq_full_d;
reg 	   spc1_dfq_full_capture;

reg  [9:0] spc1_dfq_full_cntr1;
reg        spc1_dfq_full_d1;
wire 	   spc1_dfq_full1;
reg 	   spc1_dfq_full_capture1;
reg  [9:0] spc1_dfq_full_cntr2;
reg        spc1_dfq_full_d2;
wire 	   spc1_dfq_full2;
reg 	   spc1_dfq_full_capture2;
reg  [9:0] spc1_dfq_full_cntr3;
reg        spc1_dfq_full_d3;
wire 	   spc1_dfq_full3;
reg 	   spc1_dfq_full_capture3;
reg  [9:0] spc1_dfq_full_cntr4;
reg        spc1_dfq_full_d4;
wire 	   spc1_dfq_full4;
reg 	   spc1_dfq_full_capture4;
reg  [9:0] spc1_dfq_full_cntr5;
reg        spc1_dfq_full_d5;
wire 	   spc1_dfq_full5;
reg 	   spc1_dfq_full_capture5;
reg  [9:0] spc1_dfq_full_cntr6;
reg        spc1_dfq_full_d6;
wire 	   spc1_dfq_full6;
reg 	   spc1_dfq_full_capture6;
reg  [9:0] spc1_dfq_full_cntr7;
reg        spc1_dfq_full_d7;
wire 	   spc1_dfq_full7;
reg 	   spc1_dfq_full_capture7;

wire 	   spc1_dva_rdwrhit;
reg  [9:0] spc1_dva_full_cntr;
reg        spc1_dva_full_d;
reg 	   spc1_dva_full_capture;
reg 	   spc1_dva_inv;
reg 	   spc1_dva_inv_d;
reg 	   spc1_dva_vld;
reg 	   spc1_dva_vld_d;
reg  [9:0] spc1_dva_vfull_cntr;
reg        spc1_dva_vfull_d;
reg 	   spc1_dva_vfull_capture;
reg        spc1_dva_collide;
reg        spc1_dva_vld2lkup;
reg        spc1_dva_invld2lkup;
reg        spc1_dva_invld_err;

reg  [9:0] spc1_dva_efull_cntr;
reg        spc1_dva_efull_d;

reg        spc1_dva_vlddtag_err;
reg        spc1_dva_vlddcache_err;
reg        spc1_dva_err;
reg [6:0] spc1_dva_raddr_d;
reg [4:0] spc1_dva_waddr_d;
reg [4:0] spc1_dva_invwaddr_d;

reg  	        spc1_ld0_lt_1;
reg  	        spc1_ld0_lt_2;
reg  	        spc1_ld0_lt_3;
reg  	        spc1_ld1_lt_0;
reg  	        spc1_ld1_lt_2;
reg  	        spc1_ld1_lt_3;
reg  	        spc1_ld2_lt_0;
reg  	        spc1_ld2_lt_1;
reg  	        spc1_ld2_lt_3;
reg  	        spc1_ld3_lt_0;
reg  	        spc1_ld3_lt_1;
reg  	        spc1_ld3_lt_2;

reg  	        spc1_st0_lt_1;
reg  	        spc1_st0_lt_2;
reg  	        spc1_st0_lt_3;
reg  	        spc1_st1_lt_0;
reg  	        spc1_st1_lt_2;
reg  	        spc1_st1_lt_3;
reg  	        spc1_st2_lt_0;
reg  	        spc1_st2_lt_1;
reg  	        spc1_st2_lt_3;
reg  	        spc1_st3_lt_0;
reg  	        spc1_st3_lt_1;
reg  	        spc1_st3_lt_2;

wire [11:0]      spc1_ld_ooo_ret;
wire [11:0]      spc1_st_ooo_ret;

wire [7:0]	spc1_stb_state_vld0 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc1_stb_state_ack0 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc1_stb_state_ced0 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc1_stb_state_rst0 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc1_stb_ack_vld0 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc1_ld0_inst_vld_g 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc1_intrpt0_cmplt 	 = `SPARC_CORE1.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc1_stb0_full 	         = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc1_stb0_full_w2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc1_lmq0_full 	         = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc1_mbar_vld0 	         = `SPARC_CORE1.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc1_ld0_unfilled 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc1_flsh_vld0	         = `SPARC_CORE1.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc1_ld0_unf_cntr;
reg  	        spc1_ld0_unfilled_d;

reg  [9:0]	spc1_st0_unf_cntr;
reg  	        spc1_st0_unfilled_d;
reg  	        spc1_st0_unfilled;

reg 	        spc1_mbar_vld_d0;
reg 	        spc1_flsh_vld_d0;

reg 	        spc1_lmq0_full_d;
reg  [9:0]	spc1_lmq_full_cntr0;
reg             spc1_lmq_full_capture0;

reg  [9:0]	spc1_stb_full_cntr0;
reg 		spc1_stb_full_capture0;

reg  [9:0]	spc1_mbar_vld_cntr0;
reg 		spc1_mbar_vld_capture0;

reg  [9:0]	spc1_flsh_vld_cntr0;
reg 		spc1_flsh_vld_capture0;

reg 		spc1_stb_head_hit0;
wire 		spc1_raw_ack_capture0;
reg  [9:0]	spc1_stb_ack_cntr0;

reg  [9:0]	spc1_stb_ced_cntr0;
reg  	        spc1_stb_ced0_d;
reg  	        spc1_stb_ced_capture0;
wire  	        spc1_stb_ced0;

reg 	        spc1_atm0_d;
reg  [9:0]	spc1_atm_cntr0;
reg             spc1_atm_intrpt_capture0;
reg             spc1_atm_intrpt_b4capture0;
reg             spc1_atm_inv_capture0;


reg  [39:0]     spc1_stb_wr_addr0;
reg  [39:0]     spc1_stb_atm_addr0;
reg             spc1_atm_lmiss_eq0;
wire [7:0]	spc1_stb_state_vld1 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc1_stb_state_ack1 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc1_stb_state_ced1 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc1_stb_state_rst1 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc1_stb_ack_vld1 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc1_ld1_inst_vld_g 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc1_intrpt1_cmplt 	 = `SPARC_CORE1.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc1_stb1_full 	         = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc1_stb1_full_w2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc1_lmq1_full 	         = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc1_mbar_vld1 	         = `SPARC_CORE1.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc1_ld1_unfilled 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc1_flsh_vld1	         = `SPARC_CORE1.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc1_ld1_unf_cntr;
reg  	        spc1_ld1_unfilled_d;

reg  [9:0]	spc1_st1_unf_cntr;
reg  	        spc1_st1_unfilled_d;
reg  	        spc1_st1_unfilled;

reg 	        spc1_mbar_vld_d1;
reg 	        spc1_flsh_vld_d1;

reg 	        spc1_lmq1_full_d;
reg  [9:0]	spc1_lmq_full_cntr1;
reg             spc1_lmq_full_capture1;

reg  [9:0]	spc1_stb_full_cntr1;
reg 		spc1_stb_full_capture1;

reg  [9:0]	spc1_mbar_vld_cntr1;
reg 		spc1_mbar_vld_capture1;

reg  [9:0]	spc1_flsh_vld_cntr1;
reg 		spc1_flsh_vld_capture1;

reg 		spc1_stb_head_hit1;
wire 		spc1_raw_ack_capture1;
reg  [9:0]	spc1_stb_ack_cntr1;

reg  [9:0]	spc1_stb_ced_cntr1;
reg  	        spc1_stb_ced1_d;
reg  	        spc1_stb_ced_capture1;
wire  	        spc1_stb_ced1;

reg 	        spc1_atm1_d;
reg  [9:0]	spc1_atm_cntr1;
reg             spc1_atm_intrpt_capture1;
reg             spc1_atm_intrpt_b4capture1;
reg             spc1_atm_inv_capture1;


reg  [39:0]     spc1_stb_wr_addr1;
reg  [39:0]     spc1_stb_atm_addr1;
reg             spc1_atm_lmiss_eq1;
wire [7:0]	spc1_stb_state_vld2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc1_stb_state_ack2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc1_stb_state_ced2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc1_stb_state_rst2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc1_stb_ack_vld2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc1_ld2_inst_vld_g 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc1_intrpt2_cmplt 	 = `SPARC_CORE1.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc1_stb2_full 	         = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc1_stb2_full_w2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc1_lmq2_full 	         = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc1_mbar_vld2 	         = `SPARC_CORE1.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc1_ld2_unfilled 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc1_flsh_vld2	         = `SPARC_CORE1.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc1_ld2_unf_cntr;
reg  	        spc1_ld2_unfilled_d;

reg  [9:0]	spc1_st2_unf_cntr;
reg  	        spc1_st2_unfilled_d;
reg  	        spc1_st2_unfilled;

reg 	        spc1_mbar_vld_d2;
reg 	        spc1_flsh_vld_d2;

reg 	        spc1_lmq2_full_d;
reg  [9:0]	spc1_lmq_full_cntr2;
reg             spc1_lmq_full_capture2;

reg  [9:0]	spc1_stb_full_cntr2;
reg 		spc1_stb_full_capture2;

reg  [9:0]	spc1_mbar_vld_cntr2;
reg 		spc1_mbar_vld_capture2;

reg  [9:0]	spc1_flsh_vld_cntr2;
reg 		spc1_flsh_vld_capture2;

reg 		spc1_stb_head_hit2;
wire 		spc1_raw_ack_capture2;
reg  [9:0]	spc1_stb_ack_cntr2;

reg  [9:0]	spc1_stb_ced_cntr2;
reg  	        spc1_stb_ced2_d;
reg  	        spc1_stb_ced_capture2;
wire  	        spc1_stb_ced2;

reg 	        spc1_atm2_d;
reg  [9:0]	spc1_atm_cntr2;
reg             spc1_atm_intrpt_capture2;
reg             spc1_atm_intrpt_b4capture2;
reg             spc1_atm_inv_capture2;


reg  [39:0]     spc1_stb_wr_addr2;
reg  [39:0]     spc1_stb_atm_addr2;
reg             spc1_atm_lmiss_eq2;
wire [7:0]	spc1_stb_state_vld3 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc1_stb_state_ack3 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc1_stb_state_ced3 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc1_stb_state_rst3 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc1_stb_ack_vld3 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc1_ld3_inst_vld_g 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc1_intrpt3_cmplt 	 = `SPARC_CORE1.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc1_stb3_full 	         = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc1_stb3_full_w2 	 = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc1_lmq3_full 	         = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc1_mbar_vld3 	         = `SPARC_CORE1.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc1_ld3_unfilled 	 = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc1_flsh_vld3	         = `SPARC_CORE1.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc1_ld3_unf_cntr;
reg  	        spc1_ld3_unfilled_d;

reg  [9:0]	spc1_st3_unf_cntr;
reg  	        spc1_st3_unfilled_d;
reg  	        spc1_st3_unfilled;

reg 	        spc1_mbar_vld_d3;
reg 	        spc1_flsh_vld_d3;

reg 	        spc1_lmq3_full_d;
reg  [9:0]	spc1_lmq_full_cntr3;
reg             spc1_lmq_full_capture3;

reg  [9:0]	spc1_stb_full_cntr3;
reg 		spc1_stb_full_capture3;

reg  [9:0]	spc1_mbar_vld_cntr3;
reg 		spc1_mbar_vld_capture3;

reg  [9:0]	spc1_flsh_vld_cntr3;
reg 		spc1_flsh_vld_capture3;

reg 		spc1_stb_head_hit3;
wire 		spc1_raw_ack_capture3;
reg  [9:0]	spc1_stb_ack_cntr3;

reg  [9:0]	spc1_stb_ced_cntr3;
reg  	        spc1_stb_ced3_d;
reg  	        spc1_stb_ced_capture3;
wire  	        spc1_stb_ced3;

reg 	        spc1_atm3_d;
reg  [9:0]	spc1_atm_cntr3;
reg             spc1_atm_intrpt_capture3;
reg             spc1_atm_intrpt_b4capture3;
reg             spc1_atm_inv_capture3;


reg  [39:0]     spc1_stb_wr_addr3;
reg  [39:0]     spc1_stb_atm_addr3;
reg             spc1_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc1_fpick = {spc1_mpick,spc1_spick,spc1_lpick,spc1_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc1_msquash,spc1_apick,spc1_fpick})
         9'b000000000 : spc1_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc1_fpicko = 1'b0;
         9'b1xxxxxxxx : spc1_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc1_fpicko = 1'b0;
	 default:
	  begin
		spc1_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon1 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc1_exu_und = {spc1_l2,
			  spc1_unc,
			  spc1_fpld,
			  spc1_fpldst,
			  spc1_unflush,
			  spc1_ldw,
			  spc1_byp,
			  spc1_flsh,
			  spc1_chm,
			  spc1_ldxa,
			  spc1_ato,
			  spc1_pref,
			  spc1_chit,
			  spc1_dcp,
			  spc1_dtp,
			  spc1_mpc,
			  spc1_mpu};

always @(spc1_exu_und)
begin
       case (spc1_exu_und)
         17'h00000 : spc1_exu =  5'h00;
         17'h00001 : spc1_exu =  5'h01;
         17'h00002 : spc1_exu =  5'h02;
         17'h00004 : spc1_exu =  5'h03;
         17'h00008 : spc1_exu =  5'h04;
         17'h00010 : spc1_exu =  5'h05;
         17'h00020 : spc1_exu =  5'h06;
         17'h00040 : spc1_exu =  5'h07;
         17'h00080 : spc1_exu =  5'h08;
         17'h00100 : spc1_exu =  5'h09;
         17'h00200 : spc1_exu =  5'h0a;
         17'h00400 : spc1_exu =  5'h0b;
         17'h00800 : spc1_exu =  5'h0c;
         17'h01000 : spc1_exu =  5'h0d;
         17'h02000 : spc1_exu =  5'h0e;
         17'h04000 : spc1_exu =  5'h0f;
         17'h08000 : spc1_exu =  5'h10;
         17'h10000 : spc1_exu =  5'h11;
	 default: spc1_exu =  5'h12;
       endcase
end
//excp
assign spc1_exp_und = {spc1_exp_wtchpt_trp_g,
			  spc1_exp_misalign_addr_ldst_atm_m,
			  spc1_exp_priv_violtn_g,
			  spc1_exp_daccess_excptn_g,
			  spc1_exp_daccess_prot_g,
			  spc1_exp_priv_action_g,
			  spc1_exp_spec_access_epage_g,
			  spc1_exp_uncache_atomic_g,
			  spc1_exp_illegal_asi_action_g,
			  spc1_exp_flt_ld_nfo_pg_g,
			  spc1_exp_asi_rd_unc,
			  spc1_exp_tlb_data_ce,
			  spc1_exp_tlb_data_ue,
			  spc1_exp_tlb_tag_ue,
			  spc1_exp_unc,
			  spc1_exp_corr};

always @(spc1_exp_und)
begin
       case (spc1_exp_und)
         16'h0000 : spc1_exp =  5'h00;
         16'h0001 : spc1_exp =  5'h01;
         16'h0002 : spc1_exp =  5'h02;
         16'h0004 : spc1_exp =  5'h03;
         16'h0008 : spc1_exp =  5'h04;
         16'h0010 : spc1_exp =  5'h05;
         16'h0020 : spc1_exp =  5'h06;
         16'h0040 : spc1_exp =  5'h07;
         16'h0080 : spc1_exp =  5'h08;
         16'h0100 : spc1_exp =  5'h09;
         16'h0200 : spc1_exp =  5'h0a;
         16'h0400 : spc1_exp =  5'h0b;
         16'h0800 : spc1_exp =  5'h0c;
         16'h1000 : spc1_exp =  5'h0d;
         16'h2000 : spc1_exp =  5'h0e;
         16'h4000 : spc1_exp =  5'h0f;
         16'h8000 : spc1_exp =  5'h10;
	 default: spc1_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc1_dctl_stxa_cmplt0 = ((spc1_dctl_stxa_internal_d2 & spc1_dctl_thread0_w3) |
				       spc1_dctl_stxa_stall_wr_cmplt0_d1);
assign spc1_dctl_l2fill_cmplt0 = (((spc1_dctl_lsu_l2fill_vld & ~spc1_dctl_atomic_ld_squash_e &
					    ~spc1_dctl_lsu_ignore_fill)) & ~spc1_dctl_l2fill_fpld_e &
					  ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread0);

assign spc1_dctl_fillerr0 = spc1_dctl_l2_corr_error_e & spc1_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc1_dctl_atm_cmplt0 = (spc1_dctl_lsu_atm_st_cmplt_e & ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread0);

assign spc1_dctl_ldst_cond_cmplt0 = { spc1_dctl_stxa_cmplt0, spc1_dctl_l2fill_cmplt0,
					    spc1_dctl_atomic_ld_squash_e, spc1_dctl_intld_byp_cmplt[0],
					    spc1_dctl_bsync0_reset, spc1_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc1_cmplt0 = { spc1_dctl_ldxa_illgl_va_cmplt_d1, spc1_dctl_pref_tlbmiss_cmplt_d2,
			      spc1_dctl_lsu_pcx_pref_issue, spc1_dctl_diag_wr_cmplt0, spc1_dctl_l2fill_fpld_e};


always @(spc1_cmplt0 or spc1_dctl_ldst_cond_cmplt0)
begin
       case ({spc1_dctl_fillerr0,spc1_dctl_ldst_cond_cmplt0,spc1_cmplt0})
         12'h000 : spc1_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc1_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc1_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc1_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc1_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc1_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc1_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc1_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc1_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc1_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc1_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc1_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc1_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc1_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc1_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc1_dctl_stxa_cmplt1 = ((spc1_dctl_stxa_internal_d2 & spc1_dctl_thread1_w3) |
				       spc1_dctl_stxa_stall_wr_cmplt1_d1);
assign spc1_dctl_l2fill_cmplt1 = (((spc1_dctl_lsu_l2fill_vld & ~spc1_dctl_atomic_ld_squash_e &
					    ~spc1_dctl_lsu_ignore_fill)) & ~spc1_dctl_l2fill_fpld_e &
					  ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread1);

assign spc1_dctl_fillerr1 = spc1_dctl_l2_corr_error_e & spc1_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc1_dctl_atm_cmplt1 = (spc1_dctl_lsu_atm_st_cmplt_e & ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread1);

assign spc1_dctl_ldst_cond_cmplt1 = { spc1_dctl_stxa_cmplt1, spc1_dctl_l2fill_cmplt1,
					    spc1_dctl_atomic_ld_squash_e, spc1_dctl_intld_byp_cmplt[1],
					    spc1_dctl_bsync1_reset, spc1_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc1_cmplt1 = { spc1_dctl_ldxa_illgl_va_cmplt_d1, spc1_dctl_pref_tlbmiss_cmplt_d2,
			      spc1_dctl_lsu_pcx_pref_issue, spc1_dctl_diag_wr_cmplt1, spc1_dctl_l2fill_fpld_e};


always @(spc1_cmplt1 or spc1_dctl_ldst_cond_cmplt1)
begin
       case ({spc1_dctl_fillerr1,spc1_dctl_ldst_cond_cmplt1,spc1_cmplt1})
         12'h000 : spc1_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc1_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc1_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc1_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc1_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc1_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc1_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc1_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc1_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc1_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc1_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc1_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc1_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc1_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc1_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc1_dctl_stxa_cmplt2 = ((spc1_dctl_stxa_internal_d2 & spc1_dctl_thread2_w3) |
				       spc1_dctl_stxa_stall_wr_cmplt2_d1);
assign spc1_dctl_l2fill_cmplt2 = (((spc1_dctl_lsu_l2fill_vld & ~spc1_dctl_atomic_ld_squash_e &
					    ~spc1_dctl_lsu_ignore_fill)) & ~spc1_dctl_l2fill_fpld_e &
					  ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread2);

assign spc1_dctl_fillerr2 = spc1_dctl_l2_corr_error_e & spc1_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc1_dctl_atm_cmplt2 = (spc1_dctl_lsu_atm_st_cmplt_e & ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread2);

assign spc1_dctl_ldst_cond_cmplt2 = { spc1_dctl_stxa_cmplt2, spc1_dctl_l2fill_cmplt2,
					    spc1_dctl_atomic_ld_squash_e, spc1_dctl_intld_byp_cmplt[2],
					    spc1_dctl_bsync2_reset, spc1_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc1_cmplt2 = { spc1_dctl_ldxa_illgl_va_cmplt_d1, spc1_dctl_pref_tlbmiss_cmplt_d2,
			      spc1_dctl_lsu_pcx_pref_issue, spc1_dctl_diag_wr_cmplt2, spc1_dctl_l2fill_fpld_e};


always @(spc1_cmplt2 or spc1_dctl_ldst_cond_cmplt2)
begin
       case ({spc1_dctl_fillerr2,spc1_dctl_ldst_cond_cmplt2,spc1_cmplt2})
         12'h000 : spc1_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc1_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc1_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc1_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc1_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc1_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc1_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc1_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc1_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc1_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc1_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc1_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc1_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc1_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc1_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc1_dctl_stxa_cmplt3 = ((spc1_dctl_stxa_internal_d2 & spc1_dctl_thread3_w3) |
				       spc1_dctl_stxa_stall_wr_cmplt3_d1);
assign spc1_dctl_l2fill_cmplt3 = (((spc1_dctl_lsu_l2fill_vld & ~spc1_dctl_atomic_ld_squash_e &
					    ~spc1_dctl_lsu_ignore_fill)) & ~spc1_dctl_l2fill_fpld_e &
					  ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread3);

assign spc1_dctl_fillerr3 = spc1_dctl_l2_corr_error_e & spc1_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc1_dctl_atm_cmplt3 = (spc1_dctl_lsu_atm_st_cmplt_e & ~spc1_dctl_fill_err_trap_e & spc1_dctl_dfill_thread3);

assign spc1_dctl_ldst_cond_cmplt3 = { spc1_dctl_stxa_cmplt3, spc1_dctl_l2fill_cmplt3,
					    spc1_dctl_atomic_ld_squash_e, spc1_dctl_intld_byp_cmplt[3],
					    spc1_dctl_bsync3_reset, spc1_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc1_cmplt3 = { spc1_dctl_ldxa_illgl_va_cmplt_d1, spc1_dctl_pref_tlbmiss_cmplt_d2,
			      spc1_dctl_lsu_pcx_pref_issue, spc1_dctl_diag_wr_cmplt3, spc1_dctl_l2fill_fpld_e};


always @(spc1_cmplt3 or spc1_dctl_ldst_cond_cmplt3)
begin
       case ({spc1_dctl_fillerr3,spc1_dctl_ldst_cond_cmplt3,spc1_cmplt3})
         12'h000 : spc1_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc1_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc1_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc1_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc1_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc1_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc1_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc1_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc1_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc1_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc1_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc1_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc1_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc1_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc1_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc1_ldstcond_cmplt0 or spc1_ldstcond_cmplt1 or spc1_ldstcond_cmplt2
	 or spc1_ldstcond_cmplt3 or spc1_dctl_lsu_ifu_ldst_cmplt
	 or spc1_dctl_late_cmplt0 or spc1_dctl_late_cmplt1 or spc1_dctl_late_cmplt2 or spc1_dctl_late_cmplt3)
begin
       case (spc1_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc1_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc1_ldstcond_cmplt_d = spc1_dctl_late_cmplt0 ? spc1_ldstcond_cmplt0_d : spc1_ldstcond_cmplt0;
         4'b0010 : spc1_ldstcond_cmplt_d = spc1_dctl_late_cmplt1 ? spc1_ldstcond_cmplt1_d : spc1_ldstcond_cmplt1;
         4'b0100 : spc1_ldstcond_cmplt_d = spc1_dctl_late_cmplt2 ? spc1_ldstcond_cmplt2_d : spc1_ldstcond_cmplt2;
         4'b1000 : spc1_ldstcond_cmplt_d = spc1_dctl_late_cmplt3 ? spc1_ldstcond_cmplt3_d : spc1_ldstcond_cmplt3;
         4'b0011 : spc1_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc1_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc1_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc1_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc1_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc1_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc1_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc1_st_ooo_ret = { spc1_st0_lt_1, spc1_st0_lt_2, spc1_st0_lt_3,
			      spc1_st1_lt_0, spc1_st1_lt_2, spc1_st1_lt_3,
			      spc1_st2_lt_0, spc1_st2_lt_1, spc1_st2_lt_3,
			      spc1_st3_lt_0, spc1_st3_lt_1, spc1_st3_lt_2};

always @(posedge clk)
begin
    if(~spc1_st0_unfilled || ~rst_l)
      spc1_st0_unfilled_d <= 1'b0;
    else
      spc1_st0_unfilled_d <= spc1_st0_unfilled;

    if(~rst_l)
      spc1_ldstcond_cmplt0_d <= 4'h0;
    else
      spc1_ldstcond_cmplt0_d <= spc1_ldstcond_cmplt0;

    if(~spc1_ld0_pkt_vld_unmasked || ~rst_l)
      spc1_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc1_ld0_pkt_vld_unmasked_d <= spc1_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc1_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc1_qctl1_ld_sec_hit_thrd0 && spc1_qctl1_ld0_inst_vld_g)
      spc1_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc1_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc1_st1_unfilled || ~rst_l)
      spc1_st1_unfilled_d <= 1'b0;
    else
      spc1_st1_unfilled_d <= spc1_st1_unfilled;

    if(~rst_l)
      spc1_ldstcond_cmplt1_d <= 4'h0;
    else
      spc1_ldstcond_cmplt1_d <= spc1_ldstcond_cmplt1;

    if(~spc1_ld1_pkt_vld_unmasked || ~rst_l)
      spc1_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc1_ld1_pkt_vld_unmasked_d <= spc1_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc1_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc1_qctl1_ld_sec_hit_thrd1 && spc1_qctl1_ld1_inst_vld_g)
      spc1_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc1_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc1_st2_unfilled || ~rst_l)
      spc1_st2_unfilled_d <= 1'b0;
    else
      spc1_st2_unfilled_d <= spc1_st2_unfilled;

    if(~rst_l)
      spc1_ldstcond_cmplt2_d <= 4'h0;
    else
      spc1_ldstcond_cmplt2_d <= spc1_ldstcond_cmplt2;

    if(~spc1_ld2_pkt_vld_unmasked || ~rst_l)
      spc1_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc1_ld2_pkt_vld_unmasked_d <= spc1_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc1_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc1_qctl1_ld_sec_hit_thrd2 && spc1_qctl1_ld2_inst_vld_g)
      spc1_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc1_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc1_st3_unfilled || ~rst_l)
      spc1_st3_unfilled_d <= 1'b0;
    else
      spc1_st3_unfilled_d <= spc1_st3_unfilled;

    if(~rst_l)
      spc1_ldstcond_cmplt3_d <= 4'h0;
    else
      spc1_ldstcond_cmplt3_d <= spc1_ldstcond_cmplt3;

    if(~spc1_ld3_pkt_vld_unmasked || ~rst_l)
      spc1_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc1_ld3_pkt_vld_unmasked_d <= spc1_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc1_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc1_qctl1_ld_sec_hit_thrd3 && spc1_qctl1_ld3_inst_vld_g)
      spc1_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc1_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc1_stb_state_ced0) && (|spc1_stb_state_rst0)) || ~rst_l)
      spc1_st0_unfilled <= 1'b0;
    else if( ((|spc1_stb_state_ced0) && ~(|spc1_stb_state_rst0)))
      spc1_st0_unfilled <= 1'b1;
    else
      spc1_st0_unfilled <= spc1_st0_unfilled;
    if( ((|spc1_stb_state_ced1) && (|spc1_stb_state_rst1)) || ~rst_l)
      spc1_st1_unfilled <= 1'b0;
    else if( ((|spc1_stb_state_ced1) && ~(|spc1_stb_state_rst1)))
      spc1_st1_unfilled <= 1'b1;
    else
      spc1_st1_unfilled <= spc1_st1_unfilled;
    if( ((|spc1_stb_state_ced2) && (|spc1_stb_state_rst2)) || ~rst_l)
      spc1_st2_unfilled <= 1'b0;
    else if( ((|spc1_stb_state_ced2) && ~(|spc1_stb_state_rst2)))
      spc1_st2_unfilled <= 1'b1;
    else
      spc1_st2_unfilled <= spc1_st2_unfilled;
    if( ((|spc1_stb_state_ced3) && (|spc1_stb_state_rst3)) || ~rst_l)
      spc1_st3_unfilled <= 1'b0;
    else if( ((|spc1_stb_state_ced3) && ~(|spc1_stb_state_rst3)))
      spc1_st3_unfilled <= 1'b1;
    else
      spc1_st3_unfilled <= spc1_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc1_st0_unfilled && spc1_st0_unfilled_d)|| ~rst_l)
      begin
        spc1_st0_unf_cntr <= 9'h000;
      end
    else if(spc1_st0_unfilled)
      begin
        spc1_st0_unf_cntr <= spc1_st0_unf_cntr + 1;
      end
    else
      begin
        spc1_st0_unf_cntr <= spc1_st0_unf_cntr;
      end
    if((~spc1_st1_unfilled && spc1_st1_unfilled_d)|| ~rst_l)
      begin
        spc1_st1_unf_cntr <= 9'h000;
      end
    else if(spc1_st1_unfilled)
      begin
        spc1_st1_unf_cntr <= spc1_st1_unf_cntr + 1;
      end
    else
      begin
        spc1_st1_unf_cntr <= spc1_st1_unf_cntr;
      end
    if((~spc1_st2_unfilled && spc1_st2_unfilled_d)|| ~rst_l)
      begin
        spc1_st2_unf_cntr <= 9'h000;
      end
    else if(spc1_st2_unfilled)
      begin
        spc1_st2_unf_cntr <= spc1_st2_unf_cntr + 1;
      end
    else
      begin
        spc1_st2_unf_cntr <= spc1_st2_unf_cntr;
      end
    if((~spc1_st3_unfilled && spc1_st3_unfilled_d)|| ~rst_l)
      begin
        spc1_st3_unf_cntr <= 9'h000;
      end
    else if(spc1_st3_unfilled)
      begin
        spc1_st3_unf_cntr <= spc1_st3_unf_cntr + 1;
      end
    else
      begin
        spc1_st3_unf_cntr <= spc1_st3_unf_cntr;
      end
end

always @(spc1_st0_unfilled or spc1_st1_unfilled or spc1_st2_unfilled or spc1_st3_unfilled
	 or spc1_st0_unfilled_d or spc1_st1_unfilled_d or spc1_st2_unfilled_d or spc1_st3_unfilled_d)
begin
if(~spc1_st0_unfilled && spc1_st0_unfilled_d && spc1_st1_unfilled)
 spc1_st0_lt_1 <= (spc1_st1_unf_cntr > spc1_st0_unf_cntr);
else
 spc1_st0_lt_1 <= 1'b0;
if(~spc1_st0_unfilled && spc1_st0_unfilled_d && spc1_st2_unfilled)
 spc1_st0_lt_2 <= (spc1_st2_unf_cntr > spc1_st0_unf_cntr);
else
 spc1_st0_lt_2 <= 1'b0;
if(~spc1_st0_unfilled && spc1_st0_unfilled_d && spc1_st3_unfilled)
 spc1_st0_lt_3 <= (spc1_st3_unf_cntr > spc1_st0_unf_cntr);
else
 spc1_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc1_st1_unfilled && spc1_st1_unfilled_d && spc1_st0_unfilled)
 spc1_st1_lt_0 <= (spc1_st0_unf_cntr > spc1_st1_unf_cntr);
else
 spc1_st1_lt_0 <= 1'b0;
if(~spc1_st1_unfilled && spc1_st1_unfilled_d && spc1_st2_unfilled)
 spc1_st1_lt_2 <= (spc1_st2_unf_cntr > spc1_st1_unf_cntr);
else
 spc1_st1_lt_2 <= 1'b0;
if(~spc1_st1_unfilled && spc1_st1_unfilled_d && spc1_st3_unfilled)
 spc1_st1_lt_3 <= (spc1_st3_unf_cntr > spc1_st1_unf_cntr);
else
 spc1_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc1_st2_unfilled && spc1_st2_unfilled_d && spc1_st0_unfilled)
 spc1_st2_lt_0 <= (spc1_st0_unf_cntr > spc1_st2_unf_cntr);
else
 spc1_st2_lt_0 <= 1'b0;
if(~spc1_st2_unfilled && spc1_st2_unfilled_d && spc1_st1_unfilled)
 spc1_st2_lt_1 <= (spc1_st1_unf_cntr > spc1_st2_unf_cntr);
else
 spc1_st2_lt_1 <= 1'b0;
if(~spc1_st2_unfilled && spc1_st2_unfilled_d && spc1_st3_unfilled)
 spc1_st2_lt_3 <= (spc1_st3_unf_cntr > spc1_st2_unf_cntr);
else
 spc1_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc1_st3_unfilled && spc1_st3_unfilled_d && spc1_st0_unfilled)
 spc1_st3_lt_0 <= (spc1_st0_unf_cntr > spc1_st3_unf_cntr);
else
 spc1_st3_lt_0 <= 1'b0;
if(~spc1_st3_unfilled && spc1_st3_unfilled_d && spc1_st1_unfilled)
 spc1_st3_lt_1 <= (spc1_st1_unf_cntr > spc1_st3_unf_cntr);
else
 spc1_st3_lt_1 <= 1'b0;
if(~spc1_st3_unfilled && spc1_st3_unfilled_d && spc1_st2_unfilled)
 spc1_st3_lt_2 <= (spc1_st2_unf_cntr > spc1_st3_unf_cntr);
else
 spc1_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc1_ld_ooo_ret = { spc1_ld0_lt_1, spc1_ld0_lt_2, spc1_ld0_lt_3,
			      spc1_ld1_lt_0, spc1_ld1_lt_2, spc1_ld1_lt_3,
			      spc1_ld2_lt_0, spc1_ld2_lt_1, spc1_ld2_lt_3,
			      spc1_ld3_lt_0, spc1_ld3_lt_1, spc1_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc1_ld0_unfilled && spc1_ld0_unfilled_d)|| ~rst_l)
      begin
        spc1_ld0_unf_cntr <= 9'h000;
      end
    else if(spc1_ld0_unfilled)
      begin
        spc1_ld0_unf_cntr <= spc1_ld0_unf_cntr + 1;
      end
    else
      begin
        spc1_ld0_unf_cntr <= spc1_ld0_unf_cntr;
      end
    if((~spc1_ld1_unfilled && spc1_ld1_unfilled_d)|| ~rst_l)
      begin
        spc1_ld1_unf_cntr <= 9'h000;
      end
    else if(spc1_ld1_unfilled)
      begin
        spc1_ld1_unf_cntr <= spc1_ld1_unf_cntr + 1;
      end
    else
      begin
        spc1_ld1_unf_cntr <= spc1_ld1_unf_cntr;
      end
    if((~spc1_ld2_unfilled && spc1_ld2_unfilled_d)|| ~rst_l)
      begin
        spc1_ld2_unf_cntr <= 9'h000;
      end
    else if(spc1_ld2_unfilled)
      begin
        spc1_ld2_unf_cntr <= spc1_ld2_unf_cntr + 1;
      end
    else
      begin
        spc1_ld2_unf_cntr <= spc1_ld2_unf_cntr;
      end
    if((~spc1_ld3_unfilled && spc1_ld3_unfilled_d)|| ~rst_l)
      begin
        spc1_ld3_unf_cntr <= 9'h000;
      end
    else if(spc1_ld3_unfilled)
      begin
        spc1_ld3_unf_cntr <= spc1_ld3_unf_cntr + 1;
      end
    else
      begin
        spc1_ld3_unf_cntr <= spc1_ld3_unf_cntr;
      end
end

always @(spc1_ld0_unfilled or spc1_ld1_unfilled or spc1_ld2_unfilled or spc1_ld3_unfilled
	 or spc1_ld0_unfilled_d or spc1_ld1_unfilled_d or spc1_ld2_unfilled_d or spc1_ld3_unfilled_d)
begin
if(~spc1_ld0_unfilled && spc1_ld0_unfilled_d && spc1_ld1_unfilled)
 spc1_ld0_lt_1 <= (spc1_ld1_unf_cntr > spc1_ld0_unf_cntr);
else
 spc1_ld0_lt_1 <= 1'b0;
if(~spc1_ld0_unfilled && spc1_ld0_unfilled_d && spc1_ld2_unfilled)
 spc1_ld0_lt_2 <= (spc1_ld2_unf_cntr > spc1_ld0_unf_cntr);
else
 spc1_ld0_lt_2 <= 1'b0;
if(~spc1_ld0_unfilled && spc1_ld0_unfilled_d && spc1_ld3_unfilled)
 spc1_ld0_lt_3 <= (spc1_ld3_unf_cntr > spc1_ld0_unf_cntr);
else
 spc1_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc1_ld1_unfilled && spc1_ld1_unfilled_d && spc1_ld0_unfilled)
 spc1_ld1_lt_0 <= (spc1_ld0_unf_cntr > spc1_ld1_unf_cntr);
else
 spc1_ld1_lt_0 <= 1'b0;
if(~spc1_ld1_unfilled && spc1_ld1_unfilled_d && spc1_ld2_unfilled)
 spc1_ld1_lt_2 <= (spc1_ld2_unf_cntr > spc1_ld1_unf_cntr);
else
 spc1_ld1_lt_2 <= 1'b0;
if(~spc1_ld1_unfilled && spc1_ld1_unfilled_d && spc1_ld3_unfilled)
 spc1_ld1_lt_3 <= (spc1_ld3_unf_cntr > spc1_ld1_unf_cntr);
else
 spc1_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc1_ld2_unfilled && spc1_ld2_unfilled_d && spc1_ld0_unfilled)
 spc1_ld2_lt_0 <= (spc1_ld0_unf_cntr > spc1_ld2_unf_cntr);
else
 spc1_ld2_lt_0 <= 1'b0;
if(~spc1_ld2_unfilled && spc1_ld2_unfilled_d && spc1_ld1_unfilled)
 spc1_ld2_lt_1 <= (spc1_ld1_unf_cntr > spc1_ld2_unf_cntr);
else
 spc1_ld2_lt_1 <= 1'b0;
if(~spc1_ld2_unfilled && spc1_ld2_unfilled_d && spc1_ld3_unfilled)
 spc1_ld2_lt_3 <= (spc1_ld3_unf_cntr > spc1_ld2_unf_cntr);
else
 spc1_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc1_ld3_unfilled && spc1_ld3_unfilled_d && spc1_ld0_unfilled)
 spc1_ld3_lt_0 <= (spc1_ld0_unf_cntr > spc1_ld3_unf_cntr);
else
 spc1_ld3_lt_0 <= 1'b0;
if(~spc1_ld3_unfilled && spc1_ld3_unfilled_d && spc1_ld1_unfilled)
 spc1_ld3_lt_1 <= (spc1_ld1_unf_cntr > spc1_ld3_unf_cntr);
else
 spc1_ld3_lt_1 <= 1'b0;
if(~spc1_ld3_unfilled && spc1_ld3_unfilled_d && spc1_ld2_unfilled)
 spc1_ld3_lt_2 <= (spc1_ld2_unf_cntr > spc1_ld3_unf_cntr);
else
 spc1_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc1_dctl_bld_hit =
((|spc1_dctl_lsu_way_hit[3:0])  & spc1_dctl_dcache_enable_g &
  ~spc1_dctl_ldxa_internal & ~spc1_dctl_dcache_rd_parity_error & ~spc1_dctl_dtag_perror_g &
  ~spc1_dctl_endian_mispred_g &
  ~spc1_dctl_atomic_g & ~spc1_dctl_ncache_asild_rq_g) & ~spc1_dctl_tte_data_perror_unc &
  spc1_dctl_ld_inst_vld_g & spc1_qctl1_bld_g ;

assign spc1_dctl_bld_stb_hit = spc1_dctl_bld_hit & spc1_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc1_bld0_full_d <= 2'b00;
      spc1_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc1_bld0_full_d <= spc1_qctl1_bld_cnt;
      spc1_ld0_unfilled_d <= spc1_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc1_bld1_full_d <= 2'b00;
      spc1_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc1_bld1_full_d <= spc1_qctl1_bld_cnt;
      spc1_ld1_unfilled_d <= spc1_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc1_bld2_full_d <= 2'b00;
      spc1_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc1_bld2_full_d <= spc1_qctl1_bld_cnt;
      spc1_ld2_unfilled_d <= spc1_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc1_bld3_full_d <= 2'b00;
      spc1_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc1_bld3_full_d <= spc1_qctl1_bld_cnt;
      spc1_ld3_unfilled_d <= spc1_ld3_unfilled;
     end
end
always @(spc1_bld0_full_d or spc1_qctl1_bld_cnt)
begin
 if( (spc1_bld0_full_d != spc1_qctl1_bld_cnt) && (spc1_bld0_full_d == 2'd0))
    spc1_bld0_full_capture <= 1'b1;
 else
    spc1_bld0_full_capture <= 1'b0;
end
always @(spc1_bld1_full_d or spc1_qctl1_bld_cnt)
begin
 if( (spc1_bld1_full_d != spc1_qctl1_bld_cnt) && (spc1_bld1_full_d == 2'd1))
    spc1_bld1_full_capture <= 1'b1;
 else
    spc1_bld1_full_capture <= 1'b0;
end
always @(spc1_bld2_full_d or spc1_qctl1_bld_cnt)
begin
 if( (spc1_bld2_full_d != spc1_qctl1_bld_cnt) && (spc1_bld2_full_d == 2'd2))
    spc1_bld2_full_capture <= 1'b1;
 else
    spc1_bld2_full_capture <= 1'b0;
end
always @(spc1_bld3_full_d or spc1_qctl1_bld_cnt)
begin
 if( (spc1_bld3_full_d != spc1_qctl1_bld_cnt) && (spc1_bld3_full_d == 2'd3))
    spc1_bld3_full_capture <= 1'b1;
 else
    spc1_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc1_qctl1_bld_cnt != 2'b00) && (spc1_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc1_bld0_full_cntr <= 9'h000;
      end
    else if(spc1_qctl1_bld_g && (spc1_qctl1_bld_cnt == 2'b00))
      begin
        spc1_bld0_full_cntr <= spc1_bld0_full_cntr + 1;
      end
    else if( (spc1_qctl1_bld_cnt == 2'b00) && (spc1_bld0_full_cntr != 9'h000))
      begin
        spc1_bld0_full_cntr <= spc1_bld0_full_cntr + 1;
      end
    else
      begin
        spc1_bld0_full_cntr <= spc1_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc1_qctl1_bld_cnt != 2'b01) && (spc1_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc1_bld1_full_cntr <= 9'h000;
      end
    else if(spc1_qctl1_bld_cnt == 2'b01)
      begin
        spc1_bld1_full_cntr <= spc1_bld1_full_cntr + 1;
      end
    else if( (spc1_qctl1_bld_cnt == 2'b01) && (spc1_bld1_full_cntr != 9'h000))
      begin
        spc1_bld1_full_cntr <= spc1_bld1_full_cntr + 1;
      end
    else
      begin
        spc1_bld1_full_cntr <= spc1_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc1_qctl1_bld_cnt != 2'b10) && (spc1_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc1_bld2_full_cntr <= 9'h000;
      end
    else if(spc1_qctl1_bld_cnt == 2'b10)
      begin
        spc1_bld2_full_cntr <= spc1_bld2_full_cntr + 1;
      end
    else if( (spc1_qctl1_bld_cnt == 2'b10) && (spc1_bld2_full_cntr != 9'h000))
      begin
        spc1_bld2_full_cntr <= spc1_bld2_full_cntr + 1;
      end
    else
      begin
        spc1_bld2_full_cntr <= spc1_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc1_qctl1_bld_cnt != 2'b11) && (spc1_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc1_bld3_full_cntr <= 9'h000;
      end
    else if(spc1_qctl1_bld_cnt == 2'b11)
      begin
        spc1_bld3_full_cntr <= spc1_bld3_full_cntr + 1;
      end
    else if( (spc1_qctl1_bld_cnt == 2'b11) && (spc1_bld3_full_cntr != 9'h000))
      begin
        spc1_bld3_full_cntr <= spc1_bld3_full_cntr + 1;
      end
    else
      begin
        spc1_bld3_full_cntr <= spc1_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc1_stb_state_vld0) && ~spc1_atomic_g) || ~rst_l)
      begin
        spc1_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc1_atomic_g && (spc1_atm_type0 != 8'h00) && spc1_wptr_vld)
      begin
        spc1_stb_atm_addr0 <= {spc1_wdata_ramc[44:9],spc1_wdata_ramd[67:64]};
      end
    else
      begin
        spc1_stb_atm_addr0 <= spc1_stb_atm_addr0;
      end
    if( ( ~(|spc1_stb_state_vld1) && ~spc1_atomic_g) || ~rst_l)
      begin
        spc1_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc1_atomic_g && (spc1_atm_type1 != 8'h00) && spc1_wptr_vld)
      begin
        spc1_stb_atm_addr1 <= {spc1_wdata_ramc[44:9],spc1_wdata_ramd[67:64]};
      end
    else
      begin
        spc1_stb_atm_addr1 <= spc1_stb_atm_addr1;
      end
    if( ( ~(|spc1_stb_state_vld2) && ~spc1_atomic_g) || ~rst_l)
      begin
        spc1_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc1_atomic_g && (spc1_atm_type2 != 8'h00) && spc1_wptr_vld)
      begin
        spc1_stb_atm_addr2 <= {spc1_wdata_ramc[44:9],spc1_wdata_ramd[67:64]};
      end
    else
      begin
        spc1_stb_atm_addr2 <= spc1_stb_atm_addr2;
      end
    if( ( ~(|spc1_stb_state_vld3) && ~spc1_atomic_g) || ~rst_l)
      begin
        spc1_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc1_atomic_g && (spc1_atm_type3 != 8'h00) && spc1_wptr_vld)
      begin
        spc1_stb_atm_addr3 <= {spc1_wdata_ramc[44:9],spc1_wdata_ramd[67:64]};
      end
    else
      begin
        spc1_stb_atm_addr3 <= spc1_stb_atm_addr3;
      end
end

 assign spc1_dfq_full = (spc1_dfq_vld_entries >= 3'd4);


assign spc1_dfq_full1 = (spc1_dfq_vld_entries >= (3'd4 + 1));

always @(spc1_dfq_full_d1 or spc1_dfq_full1)
begin
  if (spc1_dfq_full_d1 && ~spc1_dfq_full1)
    spc1_dfq_full_capture1 <= 1'b1;
  else
    spc1_dfq_full_capture1 <= 1'b0;
end

assign spc1_dfq_full2 = (spc1_dfq_vld_entries >= (3'd4 + 2));

always @(spc1_dfq_full_d2 or spc1_dfq_full2)
begin
  if (spc1_dfq_full_d2 && ~spc1_dfq_full2)
    spc1_dfq_full_capture2 <= 1'b1;
  else
    spc1_dfq_full_capture2 <= 1'b0;
end

assign spc1_dfq_full3 = (spc1_dfq_vld_entries >= (3'd4 + 3));

always @(spc1_dfq_full_d3 or spc1_dfq_full3)
begin
  if (spc1_dfq_full_d3 && ~spc1_dfq_full3)
    spc1_dfq_full_capture3 <= 1'b1;
  else
    spc1_dfq_full_capture3 <= 1'b0;
end

assign spc1_dfq_full4 = (spc1_dfq_vld_entries >= (3'd4 + 4));

always @(spc1_dfq_full_d4 or spc1_dfq_full4)
begin
  if (spc1_dfq_full_d4 && ~spc1_dfq_full4)
    spc1_dfq_full_capture4 <= 1'b1;
  else
    spc1_dfq_full_capture4 <= 1'b0;
end

assign spc1_dfq_full5 = (spc1_dfq_vld_entries >= (3'd4 + 5));

always @(spc1_dfq_full_d5 or spc1_dfq_full5)
begin
  if (spc1_dfq_full_d5 && ~spc1_dfq_full5)
    spc1_dfq_full_capture5 <= 1'b1;
  else
    spc1_dfq_full_capture5 <= 1'b0;
end

assign spc1_dfq_full6 = (spc1_dfq_vld_entries >= (3'd4 + 6));

always @(spc1_dfq_full_d6 or spc1_dfq_full6)
begin
  if (spc1_dfq_full_d6 && ~spc1_dfq_full6)
    spc1_dfq_full_capture6 <= 1'b1;
  else
    spc1_dfq_full_capture6 <= 1'b0;
end

assign spc1_dfq_full7 = (spc1_dfq_vld_entries >= (3'd4 + 7));

always @(spc1_dfq_full_d7 or spc1_dfq_full7)
begin
  if (spc1_dfq_full_d7 && ~spc1_dfq_full7)
    spc1_dfq_full_capture7 <= 1'b1;
  else
    spc1_dfq_full_capture7 <= 1'b0;
end

always @(spc1_mbar_vld_d0 or spc1_mbar_vld0)
begin
  if (spc1_mbar_vld_d0 && ~spc1_mbar_vld0)
    spc1_mbar_vld_capture0 <= 1'b1;
  else
    spc1_mbar_vld_capture0 <= 1'b0;
end
always @(spc1_mbar_vld_d1 or spc1_mbar_vld1)
begin
  if (spc1_mbar_vld_d1 && ~spc1_mbar_vld1)
    spc1_mbar_vld_capture1 <= 1'b1;
  else
    spc1_mbar_vld_capture1 <= 1'b0;
end
always @(spc1_mbar_vld_d2 or spc1_mbar_vld2)
begin
  if (spc1_mbar_vld_d2 && ~spc1_mbar_vld2)
    spc1_mbar_vld_capture2 <= 1'b1;
  else
    spc1_mbar_vld_capture2 <= 1'b0;
end
always @(spc1_mbar_vld_d3 or spc1_mbar_vld3)
begin
  if (spc1_mbar_vld_d3 && ~spc1_mbar_vld3)
    spc1_mbar_vld_capture3 <= 1'b1;
  else
    spc1_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc1_dfq_full1 && (spc1_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr1 <= 9'h000;
       spc1_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr1);
      end
    else if( spc1_dfq_full1)
      begin
       spc1_dfq_full_cntr1 <= spc1_dfq_full_cntr1 + 1;
       spc1_dfq_full_d1 <= spc1_dfq_full1;
      end
    else
      begin
       spc1_dfq_full_cntr1 <= spc1_dfq_full_cntr1;
       spc1_dfq_full_d1 <= spc1_dfq_full1;
      end
    if( ( ~spc1_dfq_full2 && (spc1_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr2 <= 9'h000;
       spc1_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr2);
      end
    else if( spc1_dfq_full2)
      begin
       spc1_dfq_full_cntr2 <= spc1_dfq_full_cntr2 + 1;
       spc1_dfq_full_d2 <= spc1_dfq_full2;
      end
    else
      begin
       spc1_dfq_full_cntr2 <= spc1_dfq_full_cntr2;
       spc1_dfq_full_d2 <= spc1_dfq_full2;
      end
    if( ( ~spc1_dfq_full3 && (spc1_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr3 <= 9'h000;
       spc1_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr3);
      end
    else if( spc1_dfq_full3)
      begin
       spc1_dfq_full_cntr3 <= spc1_dfq_full_cntr3 + 1;
       spc1_dfq_full_d3 <= spc1_dfq_full3;
      end
    else
      begin
       spc1_dfq_full_cntr3 <= spc1_dfq_full_cntr3;
       spc1_dfq_full_d3 <= spc1_dfq_full3;
      end
    if( ( ~spc1_dfq_full4 && (spc1_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr4 <= 9'h000;
       spc1_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr4);
      end
    else if( spc1_dfq_full4)
      begin
       spc1_dfq_full_cntr4 <= spc1_dfq_full_cntr4 + 1;
       spc1_dfq_full_d4 <= spc1_dfq_full4;
      end
    else
      begin
       spc1_dfq_full_cntr4 <= spc1_dfq_full_cntr4;
       spc1_dfq_full_d4 <= spc1_dfq_full4;
      end
    if( ( ~spc1_dfq_full5 && (spc1_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr5 <= 9'h000;
       spc1_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr5);
      end
    else if( spc1_dfq_full5)
      begin
       spc1_dfq_full_cntr5 <= spc1_dfq_full_cntr5 + 1;
       spc1_dfq_full_d5 <= spc1_dfq_full5;
      end
    else
      begin
       spc1_dfq_full_cntr5 <= spc1_dfq_full_cntr5;
       spc1_dfq_full_d5 <= spc1_dfq_full5;
      end
    if( ( ~spc1_dfq_full6 && (spc1_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr6 <= 9'h000;
       spc1_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr6);
      end
    else if( spc1_dfq_full6)
      begin
       spc1_dfq_full_cntr6 <= spc1_dfq_full_cntr6 + 1;
       spc1_dfq_full_d6 <= spc1_dfq_full6;
      end
    else
      begin
       spc1_dfq_full_cntr6 <= spc1_dfq_full_cntr6;
       spc1_dfq_full_d6 <= spc1_dfq_full6;
      end
    if( ( ~spc1_dfq_full7 && (spc1_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr7 <= 9'h000;
       spc1_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr7);
      end
    else if( spc1_dfq_full7)
      begin
       spc1_dfq_full_cntr7 <= spc1_dfq_full_cntr7 + 1;
       spc1_dfq_full_d7 <= spc1_dfq_full7;
      end
    else
      begin
       spc1_dfq_full_cntr7 <= spc1_dfq_full_cntr7;
       spc1_dfq_full_d7 <= spc1_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc1_intrpt0_cmplt or spc1_atm_cntr0 or spc1_stb_state_ced0)
begin
  if (spc1_intrpt0_cmplt && (spc1_atm_cntr0 != 9'h000) && ~(|spc1_stb_state_ced0))
    spc1_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc1_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc1_intrpt1_cmplt or spc1_atm_cntr1 or spc1_stb_state_ced1)
begin
  if (spc1_intrpt1_cmplt && (spc1_atm_cntr1 != 9'h000) && ~(|spc1_stb_state_ced1))
    spc1_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc1_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc1_intrpt2_cmplt or spc1_atm_cntr2 or spc1_stb_state_ced2)
begin
  if (spc1_intrpt2_cmplt && (spc1_atm_cntr2 != 9'h000) && ~(|spc1_stb_state_ced2))
    spc1_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc1_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc1_intrpt3_cmplt or spc1_atm_cntr3 or spc1_stb_state_ced3)
begin
  if (spc1_intrpt3_cmplt && (spc1_atm_cntr3 != 9'h000) && ~(|spc1_stb_state_ced3))
    spc1_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc1_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc1_intrpt0_cmplt or spc1_atm_cntr0 or spc1_stb_state_ced0)
begin
  if (spc1_intrpt0_cmplt && (spc1_atm_cntr0 != 9'h000) && (|spc1_stb_state_ced0))
    spc1_atm_intrpt_capture0 <= 1'b1;
  else
    spc1_atm_intrpt_capture0 <= 1'b0;
end
always @(spc1_intrpt1_cmplt or spc1_atm_cntr1 or spc1_stb_state_ced1)
begin
  if (spc1_intrpt1_cmplt && (spc1_atm_cntr1 != 9'h000) && (|spc1_stb_state_ced1))
    spc1_atm_intrpt_capture1 <= 1'b1;
  else
    spc1_atm_intrpt_capture1 <= 1'b0;
end
always @(spc1_intrpt2_cmplt or spc1_atm_cntr2 or spc1_stb_state_ced2)
begin
  if (spc1_intrpt2_cmplt && (spc1_atm_cntr2 != 9'h000) && (|spc1_stb_state_ced2))
    spc1_atm_intrpt_capture2 <= 1'b1;
  else
    spc1_atm_intrpt_capture2 <= 1'b0;
end
always @(spc1_intrpt3_cmplt or spc1_atm_cntr3 or spc1_stb_state_ced3)
begin
  if (spc1_intrpt3_cmplt && (spc1_atm_cntr3 != 9'h000) && (|spc1_stb_state_ced3))
    spc1_atm_intrpt_capture3 <= 1'b1;
  else
    spc1_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc1_atm_cntr0 or spc1_dva_din or spc1_dva_wen)
begin
  if (~spc1_dva_din && spc1_dva_wen && (spc1_atm_cntr0 != 9'h000))
    spc1_atm_inv_capture0 <= 1'b1;
  else
    spc1_atm_inv_capture0 <= 1'b0;
end
always @(spc1_atm_cntr1 or spc1_dva_din or spc1_dva_wen)
begin
  if (~spc1_dva_din && spc1_dva_wen && (spc1_atm_cntr1 != 9'h000))
    spc1_atm_inv_capture1 <= 1'b1;
  else
    spc1_atm_inv_capture1 <= 1'b0;
end
always @(spc1_atm_cntr2 or spc1_dva_din or spc1_dva_wen)
begin
  if (~spc1_dva_din && spc1_dva_wen && (spc1_atm_cntr2 != 9'h000))
    spc1_atm_inv_capture2 <= 1'b1;
  else
    spc1_atm_inv_capture2 <= 1'b0;
end
always @(spc1_atm_cntr3 or spc1_dva_din or spc1_dva_wen)
begin
  if (~spc1_dva_din && spc1_dva_wen && (spc1_atm_cntr3 != 9'h000))
    spc1_atm_inv_capture3 <= 1'b1;
  else
    spc1_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc1_stb_state_vld0) && (spc1_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_atm_cntr0 <= 9'h000;
       spc1_atm0_d <= 1'b0;
      end
    else if( spc1_atomic_g && (spc1_atm_type0 != 8'h00))
      begin
       spc1_atm_cntr0 <= spc1_atm_cntr0 + 1;
       spc1_atm0_d <= 1'b1;
      end
    else if( spc1_atm0_d && (|spc1_stb_state_vld0))
      begin
       spc1_atm_cntr0 <= spc1_atm_cntr0 + 1;
       spc1_atm0_d <= spc1_atm0_d;
      end
    else
      begin
       spc1_atm_cntr0 <= spc1_atm_cntr0;
       spc1_atm0_d <= spc1_atm0_d;
      end
    if( ( ~(|spc1_stb_state_vld1) && (spc1_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_atm_cntr1 <= 9'h000;
       spc1_atm1_d <= 1'b0;
      end
    else if( spc1_atomic_g && (spc1_atm_type1 != 8'h00))
      begin
       spc1_atm_cntr1 <= spc1_atm_cntr1 + 1;
       spc1_atm1_d <= 1'b1;
      end
    else if( spc1_atm1_d && (|spc1_stb_state_vld1))
      begin
       spc1_atm_cntr1 <= spc1_atm_cntr1 + 1;
       spc1_atm1_d <= spc1_atm1_d;
      end
    else
      begin
       spc1_atm_cntr1 <= spc1_atm_cntr1;
       spc1_atm1_d <= spc1_atm1_d;
      end
    if( ( ~(|spc1_stb_state_vld2) && (spc1_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_atm_cntr2 <= 9'h000;
       spc1_atm2_d <= 1'b0;
      end
    else if( spc1_atomic_g && (spc1_atm_type2 != 8'h00))
      begin
       spc1_atm_cntr2 <= spc1_atm_cntr2 + 1;
       spc1_atm2_d <= 1'b1;
      end
    else if( spc1_atm2_d && (|spc1_stb_state_vld2))
      begin
       spc1_atm_cntr2 <= spc1_atm_cntr2 + 1;
       spc1_atm2_d <= spc1_atm2_d;
      end
    else
      begin
       spc1_atm_cntr2 <= spc1_atm_cntr2;
       spc1_atm2_d <= spc1_atm2_d;
      end
    if( ( ~(|spc1_stb_state_vld3) && (spc1_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_atm_cntr3 <= 9'h000;
       spc1_atm3_d <= 1'b0;
      end
    else if( spc1_atomic_g && (spc1_atm_type3 != 8'h00))
      begin
       spc1_atm_cntr3 <= spc1_atm_cntr3 + 1;
       spc1_atm3_d <= 1'b1;
      end
    else if( spc1_atm3_d && (|spc1_stb_state_vld3))
      begin
       spc1_atm_cntr3 <= spc1_atm_cntr3 + 1;
       spc1_atm3_d <= spc1_atm3_d;
      end
    else
      begin
       spc1_atm_cntr3 <= spc1_atm_cntr3;
       spc1_atm3_d <= spc1_atm3_d;
      end
end

 assign spc1_raw_ack_capture0 = spc1_stb_ack_vld0 && (spc1_stb_ack_cntr0 != 9'h000);
 assign spc1_stb_ced0 = |spc1_stb_state_ced0;
 assign spc1_raw_ack_capture1 = spc1_stb_ack_vld1 && (spc1_stb_ack_cntr1 != 9'h000);
 assign spc1_stb_ced1 = |spc1_stb_state_ced1;
 assign spc1_raw_ack_capture2 = spc1_stb_ack_vld2 && (spc1_stb_ack_cntr2 != 9'h000);
 assign spc1_stb_ced2 = |spc1_stb_state_ced2;
 assign spc1_raw_ack_capture3 = spc1_stb_ack_vld3 && (spc1_stb_ack_cntr3 != 9'h000);
 assign spc1_stb_ced3 = |spc1_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc1_stb_ced0 && (spc1_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ced_cntr0 <= 9'h000;
       spc1_stb_ced0_d <= 1'b0;
      end
    else if( spc1_stb_ced0 && (spc1_stb_state_ack0 == 8'h00))
      begin
       spc1_stb_ced_cntr0 <= spc1_stb_ced_cntr0 + 1;
       spc1_stb_ced0_d <= spc1_stb_ced0;
      end
    else
      begin
       spc1_stb_ced_cntr0 <= spc1_stb_ced_cntr0;
       spc1_stb_ced0_d <= spc1_stb_ced0_d;
      end

    if( ( ~spc1_mbar_vld0 && (spc1_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_mbar_vld_cntr0 <= 9'h000;
       spc1_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_mbar_vld_counter = %d", spc1_mbar_vld_cntr0);
      end
    else if( spc1_mbar_vld0)
      begin
       spc1_mbar_vld_cntr0 <= spc1_mbar_vld_cntr0 + 1;
       spc1_mbar_vld_d0 <= spc1_mbar_vld0;
      end
    else
      begin
       spc1_mbar_vld_cntr0 <= spc1_mbar_vld_cntr0;
       spc1_mbar_vld_d0 <= spc1_mbar_vld0;
      end

    if( ( ~spc1_flsh_vld0 && (spc1_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_flsh_vld_cntr0 <= 9'h000;
       spc1_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_flsh_vld_counter = %d", spc1_flsh_vld_cntr0);
      end
    else if( spc1_flsh_vld0)
      begin
       spc1_flsh_vld_cntr0 <= spc1_flsh_vld_cntr0 + 1;
       spc1_flsh_vld_d0 <= spc1_flsh_vld0;
      end
    else
      begin
       spc1_flsh_vld_cntr0 <= spc1_flsh_vld_cntr0;
       spc1_flsh_vld_d0 <= spc1_flsh_vld0;
      end

    if( ( ~spc1_stb_ced1 && (spc1_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ced_cntr1 <= 9'h000;
       spc1_stb_ced1_d <= 1'b0;
      end
    else if( spc1_stb_ced1 && (spc1_stb_state_ack1 == 8'h00))
      begin
       spc1_stb_ced_cntr1 <= spc1_stb_ced_cntr1 + 1;
       spc1_stb_ced1_d <= spc1_stb_ced1;
      end
    else
      begin
       spc1_stb_ced_cntr1 <= spc1_stb_ced_cntr1;
       spc1_stb_ced1_d <= spc1_stb_ced1_d;
      end

    if( ( ~spc1_mbar_vld1 && (spc1_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_mbar_vld_cntr1 <= 9'h000;
       spc1_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_mbar_vld_counter = %d", spc1_mbar_vld_cntr1);
      end
    else if( spc1_mbar_vld1)
      begin
       spc1_mbar_vld_cntr1 <= spc1_mbar_vld_cntr1 + 1;
       spc1_mbar_vld_d1 <= spc1_mbar_vld1;
      end
    else
      begin
       spc1_mbar_vld_cntr1 <= spc1_mbar_vld_cntr1;
       spc1_mbar_vld_d1 <= spc1_mbar_vld1;
      end

    if( ( ~spc1_flsh_vld1 && (spc1_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_flsh_vld_cntr1 <= 9'h000;
       spc1_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_flsh_vld_counter = %d", spc1_flsh_vld_cntr1);
      end
    else if( spc1_flsh_vld1)
      begin
       spc1_flsh_vld_cntr1 <= spc1_flsh_vld_cntr1 + 1;
       spc1_flsh_vld_d1 <= spc1_flsh_vld1;
      end
    else
      begin
       spc1_flsh_vld_cntr1 <= spc1_flsh_vld_cntr1;
       spc1_flsh_vld_d1 <= spc1_flsh_vld1;
      end

    if( ( ~spc1_stb_ced2 && (spc1_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ced_cntr2 <= 9'h000;
       spc1_stb_ced2_d <= 1'b0;
      end
    else if( spc1_stb_ced2 && (spc1_stb_state_ack2 == 8'h00))
      begin
       spc1_stb_ced_cntr2 <= spc1_stb_ced_cntr2 + 1;
       spc1_stb_ced2_d <= spc1_stb_ced2;
      end
    else
      begin
       spc1_stb_ced_cntr2 <= spc1_stb_ced_cntr2;
       spc1_stb_ced2_d <= spc1_stb_ced2_d;
      end

    if( ( ~spc1_mbar_vld2 && (spc1_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_mbar_vld_cntr2 <= 9'h000;
       spc1_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_mbar_vld_counter = %d", spc1_mbar_vld_cntr2);
      end
    else if( spc1_mbar_vld2)
      begin
       spc1_mbar_vld_cntr2 <= spc1_mbar_vld_cntr2 + 1;
       spc1_mbar_vld_d2 <= spc1_mbar_vld2;
      end
    else
      begin
       spc1_mbar_vld_cntr2 <= spc1_mbar_vld_cntr2;
       spc1_mbar_vld_d2 <= spc1_mbar_vld2;
      end

    if( ( ~spc1_flsh_vld2 && (spc1_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_flsh_vld_cntr2 <= 9'h000;
       spc1_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_flsh_vld_counter = %d", spc1_flsh_vld_cntr2);
      end
    else if( spc1_flsh_vld2)
      begin
       spc1_flsh_vld_cntr2 <= spc1_flsh_vld_cntr2 + 1;
       spc1_flsh_vld_d2 <= spc1_flsh_vld2;
      end
    else
      begin
       spc1_flsh_vld_cntr2 <= spc1_flsh_vld_cntr2;
       spc1_flsh_vld_d2 <= spc1_flsh_vld2;
      end

    if( ( ~spc1_stb_ced3 && (spc1_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ced_cntr3 <= 9'h000;
       spc1_stb_ced3_d <= 1'b0;
      end
    else if( spc1_stb_ced3 && (spc1_stb_state_ack3 == 8'h00))
      begin
       spc1_stb_ced_cntr3 <= spc1_stb_ced_cntr3 + 1;
       spc1_stb_ced3_d <= spc1_stb_ced3;
      end
    else
      begin
       spc1_stb_ced_cntr3 <= spc1_stb_ced_cntr3;
       spc1_stb_ced3_d <= spc1_stb_ced3_d;
      end

    if( ( ~spc1_mbar_vld3 && (spc1_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_mbar_vld_cntr3 <= 9'h000;
       spc1_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_mbar_vld_counter = %d", spc1_mbar_vld_cntr3);
      end
    else if( spc1_mbar_vld3)
      begin
       spc1_mbar_vld_cntr3 <= spc1_mbar_vld_cntr3 + 1;
       spc1_mbar_vld_d3 <= spc1_mbar_vld3;
      end
    else
      begin
       spc1_mbar_vld_cntr3 <= spc1_mbar_vld_cntr3;
       spc1_mbar_vld_d3 <= spc1_mbar_vld3;
      end

    if( ( ~spc1_flsh_vld3 && (spc1_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_flsh_vld_cntr3 <= 9'h000;
       spc1_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_flsh_vld_counter = %d", spc1_flsh_vld_cntr3);
      end
    else if( spc1_flsh_vld3)
      begin
       spc1_flsh_vld_cntr3 <= spc1_flsh_vld_cntr3 + 1;
       spc1_flsh_vld_d3 <= spc1_flsh_vld3;
      end
    else
      begin
       spc1_flsh_vld_cntr3 <= spc1_flsh_vld_cntr3;
       spc1_flsh_vld_d3 <= spc1_flsh_vld3;
      end

end

always @(spc1_flsh_vld_d0 or spc1_flsh_vld0)
begin
  if (spc1_flsh_vld_d0 && ~spc1_flsh_vld0)
    spc1_flsh_vld_capture0 <= 1'b1;
  else
    spc1_flsh_vld_capture0 <= 1'b0;
end
always @(spc1_flsh_vld_d1 or spc1_flsh_vld1)
begin
  if (spc1_flsh_vld_d1 && ~spc1_flsh_vld1)
    spc1_flsh_vld_capture1 <= 1'b1;
  else
    spc1_flsh_vld_capture1 <= 1'b0;
end
always @(spc1_flsh_vld_d2 or spc1_flsh_vld2)
begin
  if (spc1_flsh_vld_d2 && ~spc1_flsh_vld2)
    spc1_flsh_vld_capture2 <= 1'b1;
  else
    spc1_flsh_vld_capture2 <= 1'b0;
end
always @(spc1_flsh_vld_d3 or spc1_flsh_vld3)
begin
  if (spc1_flsh_vld_d3 && ~spc1_flsh_vld3)
    spc1_flsh_vld_capture3 <= 1'b1;
  else
    spc1_flsh_vld_capture3 <= 1'b0;
end

always @(spc1_lmiss_pa0 or spc1_imiss_pa or spc1_imiss_vld_d or spc1_lmiss_vld0)
begin
if((spc1_lmiss_pa0 == spc1_imiss_pa) && spc1_imiss_vld_d && spc1_lmiss_vld0)
 spc1_lmiss_eq0 = 1'b1;
else
 spc1_lmiss_eq0 = 1'b0;
end
always @(spc1_lmiss_pa1 or spc1_imiss_pa or spc1_imiss_vld_d or spc1_lmiss_vld1)
begin
if((spc1_lmiss_pa1 == spc1_imiss_pa) && spc1_imiss_vld_d && spc1_lmiss_vld1)
 spc1_lmiss_eq1 = 1'b1;
else
 spc1_lmiss_eq1 = 1'b0;
end
always @(spc1_lmiss_pa2 or spc1_imiss_pa or spc1_imiss_vld_d or spc1_lmiss_vld2)
begin
if((spc1_lmiss_pa2 == spc1_imiss_pa) && spc1_imiss_vld_d && spc1_lmiss_vld2)
 spc1_lmiss_eq2 = 1'b1;
else
 spc1_lmiss_eq2 = 1'b0;
end
always @(spc1_lmiss_pa3 or spc1_imiss_pa or spc1_imiss_vld_d or spc1_lmiss_vld3)
begin
if((spc1_lmiss_pa3 == spc1_imiss_pa) && spc1_imiss_vld_d && spc1_lmiss_vld3)
 spc1_lmiss_eq3 = 1'b1;
else
 spc1_lmiss_eq3 = 1'b0;
end

always @(spc1_lmiss_pa0 or spc1_stb_atm_addr0 or spc1_atm_cntr0 or spc1_lmiss_vld0)
begin
if ( ((spc1_lmiss_pa0 == spc1_stb_atm_addr0) && (spc1_atm_cntr0 != 9'h000) && spc1_lmiss_vld0) ||
     ((spc1_lmiss_pa1 == spc1_stb_atm_addr0) && (spc1_atm_cntr0 != 9'h000) && spc1_lmiss_vld1) ||
     ((spc1_lmiss_pa2 == spc1_stb_atm_addr0) && (spc1_atm_cntr0 != 9'h000) && spc1_lmiss_vld2) ||
     ((spc1_lmiss_pa3 == spc1_stb_atm_addr0) && (spc1_atm_cntr0 != 9'h000) && spc1_lmiss_vld3) )

 spc1_atm_lmiss_eq0 = 1'b1;
else
 spc1_atm_lmiss_eq0 = 1'b0;
end
always @(spc1_lmiss_pa1 or spc1_stb_atm_addr1 or spc1_atm_cntr1 or spc1_lmiss_vld1)
begin
if ( ((spc1_lmiss_pa0 == spc1_stb_atm_addr1) && (spc1_atm_cntr1 != 9'h000) && spc1_lmiss_vld0) ||
     ((spc1_lmiss_pa1 == spc1_stb_atm_addr1) && (spc1_atm_cntr1 != 9'h000) && spc1_lmiss_vld1) ||
     ((spc1_lmiss_pa2 == spc1_stb_atm_addr1) && (spc1_atm_cntr1 != 9'h000) && spc1_lmiss_vld2) ||
     ((spc1_lmiss_pa3 == spc1_stb_atm_addr1) && (spc1_atm_cntr1 != 9'h000) && spc1_lmiss_vld3) )

 spc1_atm_lmiss_eq1 = 1'b1;
else
 spc1_atm_lmiss_eq1 = 1'b0;
end
always @(spc1_lmiss_pa2 or spc1_stb_atm_addr2 or spc1_atm_cntr2 or spc1_lmiss_vld2)
begin
if ( ((spc1_lmiss_pa0 == spc1_stb_atm_addr2) && (spc1_atm_cntr2 != 9'h000) && spc1_lmiss_vld0) ||
     ((spc1_lmiss_pa1 == spc1_stb_atm_addr2) && (spc1_atm_cntr2 != 9'h000) && spc1_lmiss_vld1) ||
     ((spc1_lmiss_pa2 == spc1_stb_atm_addr2) && (spc1_atm_cntr2 != 9'h000) && spc1_lmiss_vld2) ||
     ((spc1_lmiss_pa3 == spc1_stb_atm_addr2) && (spc1_atm_cntr2 != 9'h000) && spc1_lmiss_vld3) )

 spc1_atm_lmiss_eq2 = 1'b1;
else
 spc1_atm_lmiss_eq2 = 1'b0;
end
always @(spc1_lmiss_pa3 or spc1_stb_atm_addr3 or spc1_atm_cntr3 or spc1_lmiss_vld3)
begin
if ( ((spc1_lmiss_pa0 == spc1_stb_atm_addr3) && (spc1_atm_cntr3 != 9'h000) && spc1_lmiss_vld0) ||
     ((spc1_lmiss_pa1 == spc1_stb_atm_addr3) && (spc1_atm_cntr3 != 9'h000) && spc1_lmiss_vld1) ||
     ((spc1_lmiss_pa2 == spc1_stb_atm_addr3) && (spc1_atm_cntr3 != 9'h000) && spc1_lmiss_vld2) ||
     ((spc1_lmiss_pa3 == spc1_stb_atm_addr3) && (spc1_atm_cntr3 != 9'h000) && spc1_lmiss_vld3) )

 spc1_atm_lmiss_eq3 = 1'b1;
else
 spc1_atm_lmiss_eq3 = 1'b0;
end

always @(spc1_imiss_pa or spc1_stb_atm_addr0 or spc1_atm_cntr0 or spc1_imiss_vld_d)
begin
if((spc1_imiss_pa == spc1_stb_atm_addr0) && (spc1_atm_cntr0 != 9'h000) && spc1_imiss_vld_d)
 spc1_atm_imiss_eq0 = 1'b1;
else
 spc1_atm_imiss_eq0 = 1'b0;
end
always @(spc1_imiss_pa or spc1_stb_atm_addr1 or spc1_atm_cntr1 or spc1_imiss_vld_d)
begin
if((spc1_imiss_pa == spc1_stb_atm_addr1) && (spc1_atm_cntr1 != 9'h000) && spc1_imiss_vld_d)
 spc1_atm_imiss_eq1 = 1'b1;
else
 spc1_atm_imiss_eq1 = 1'b0;
end
always @(spc1_imiss_pa or spc1_stb_atm_addr2 or spc1_atm_cntr2 or spc1_imiss_vld_d)
begin
if((spc1_imiss_pa == spc1_stb_atm_addr2) && (spc1_atm_cntr2 != 9'h000) && spc1_imiss_vld_d)
 spc1_atm_imiss_eq2 = 1'b1;
else
 spc1_atm_imiss_eq2 = 1'b0;
end
always @(spc1_imiss_pa or spc1_stb_atm_addr3 or spc1_atm_cntr3 or spc1_imiss_vld_d)
begin
if((spc1_imiss_pa == spc1_stb_atm_addr3) && (spc1_atm_cntr3 != 9'h000) && spc1_imiss_vld_d)
 spc1_atm_imiss_eq3 = 1'b1;
else
 spc1_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc1_imiss_vld || ~rst_l)
   spc1_imiss_vld_d <= 1'b0;
 else
   spc1_imiss_vld_d <= spc1_imiss_vld;

 if( ~spc1_ld_miss || ~rst_l)
   spc1_ld_miss_capture <= 1'b0;
 else
   spc1_ld_miss_capture <= spc1_ld_miss;

end

always @(spc1_stb_ced0 or spc1_stb_ced0_d)
begin
if (~spc1_stb_ced0 && spc1_stb_ced0_d)
spc1_stb_ced_capture0 <= 1'b1;
else
spc1_stb_ced_capture0 <= 1'b0;

end
always @(spc1_stb_ced1 or spc1_stb_ced1_d)
begin
if (~spc1_stb_ced1 && spc1_stb_ced1_d)
spc1_stb_ced_capture1 <= 1'b1;
else
spc1_stb_ced_capture1 <= 1'b0;

end
always @(spc1_stb_ced2 or spc1_stb_ced2_d)
begin
if (~spc1_stb_ced2 && spc1_stb_ced2_d)
spc1_stb_ced_capture2 <= 1'b1;
else
spc1_stb_ced_capture2 <= 1'b0;

end
always @(spc1_stb_ced3 or spc1_stb_ced3_d)
begin
if (~spc1_stb_ced3 && spc1_stb_ced3_d)
spc1_stb_ced_capture3 <= 1'b1;
else
spc1_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc1_stb_state_ack0 != 8'h00 && (spc1_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_ack_counter0 = %d", spc1_stb_ack_cntr0);
      end
    else if(spc1_stb_cam_hit && spc1_ld0_inst_vld_g && (spc1_stb_state_ack0 == 8'h00))
      begin
       spc1_stb_ack_cntr0 <= spc1_stb_ack_cntr0 + 1;
      end
    else if( (spc1_stb_state_ack0 == 8'h00 ) && (spc1_stb_ack_cntr0 != 9'h000))
      begin
       spc1_stb_ack_cntr0 <= spc1_stb_ack_cntr0 + 1;
      end // if ( (spc1_stb_state_ack0 == 8'h00 ) && (spc1_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc1_stb_ack_cntr0 <= spc1_stb_ack_cntr0;
      end

    if( (spc1_stb_state_ack1 != 8'h00 && (spc1_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_ack_counter1 = %d", spc1_stb_ack_cntr1);
      end
    else if(spc1_stb_cam_hit && spc1_ld1_inst_vld_g && (spc1_stb_state_ack1 == 8'h00))
      begin
       spc1_stb_ack_cntr1 <= spc1_stb_ack_cntr1 + 1;
      end
    else if( (spc1_stb_state_ack1 == 8'h00 ) && (spc1_stb_ack_cntr1 != 9'h000))
      begin
       spc1_stb_ack_cntr1 <= spc1_stb_ack_cntr1 + 1;
      end // if ( (spc1_stb_state_ack1 == 8'h00 ) && (spc1_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc1_stb_ack_cntr1 <= spc1_stb_ack_cntr1;
      end

    if( (spc1_stb_state_ack2 != 8'h00 && (spc1_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_ack_counter2 = %d", spc1_stb_ack_cntr2);
      end
    else if(spc1_stb_cam_hit && spc1_ld2_inst_vld_g && (spc1_stb_state_ack2 == 8'h00))
      begin
       spc1_stb_ack_cntr2 <= spc1_stb_ack_cntr2 + 1;
      end
    else if( (spc1_stb_state_ack2 == 8'h00 ) && (spc1_stb_ack_cntr2 != 9'h000))
      begin
       spc1_stb_ack_cntr2 <= spc1_stb_ack_cntr2 + 1;
      end // if ( (spc1_stb_state_ack2 == 8'h00 ) && (spc1_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc1_stb_ack_cntr2 <= spc1_stb_ack_cntr2;
      end

    if( (spc1_stb_state_ack3 != 8'h00 && (spc1_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_ack_counter3 = %d", spc1_stb_ack_cntr3);
      end
    else if(spc1_stb_cam_hit && spc1_ld3_inst_vld_g && (spc1_stb_state_ack3 == 8'h00))
      begin
       spc1_stb_ack_cntr3 <= spc1_stb_ack_cntr3 + 1;
      end
    else if( (spc1_stb_state_ack3 == 8'h00 ) && (spc1_stb_ack_cntr3 != 9'h000))
      begin
       spc1_stb_ack_cntr3 <= spc1_stb_ack_cntr3 + 1;
      end // if ( (spc1_stb_state_ack3 == 8'h00 ) && (spc1_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc1_stb_ack_cntr3 <= spc1_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc1_stb0_full_w2 or spc1_stb0_full)
begin
if (~spc1_stb0_full_w2 && spc1_stb0_full)
spc1_stb_full_capture0 <= 1'b1;
else
spc1_stb_full_capture0 <= 1'b0;

end
always @(spc1_stb1_full_w2 or spc1_stb1_full)
begin
if (~spc1_stb1_full_w2 && spc1_stb1_full)
spc1_stb_full_capture1 <= 1'b1;
else
spc1_stb_full_capture1 <= 1'b0;

end
always @(spc1_stb2_full_w2 or spc1_stb2_full)
begin
if (~spc1_stb2_full_w2 && spc1_stb2_full)
spc1_stb_full_capture2 <= 1'b1;
else
spc1_stb_full_capture2 <= 1'b0;

end
always @(spc1_stb3_full_w2 or spc1_stb3_full)
begin
if (~spc1_stb3_full_w2 && spc1_stb3_full)
spc1_stb_full_capture3 <= 1'b1;
else
spc1_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc1_stb0_full && (spc1_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_full_counter0 = %d", spc1_stb_full_cntr0);
      end
    else if( spc1_stb0_full)
      begin
       spc1_stb_full_cntr0 <= spc1_stb_full_cntr0 + 1;
      end
    else
      begin
       spc1_stb_full_cntr0 <= spc1_stb_full_cntr0;
      end
    if( ( ~spc1_stb1_full && (spc1_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_full_counter1 = %d", spc1_stb_full_cntr1);
      end
    else if( spc1_stb1_full)
      begin
       spc1_stb_full_cntr1 <= spc1_stb_full_cntr1 + 1;
      end
    else
      begin
       spc1_stb_full_cntr1 <= spc1_stb_full_cntr1;
      end
    if( ( ~spc1_stb2_full && (spc1_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_full_counter2 = %d", spc1_stb_full_cntr2);
      end
    else if( spc1_stb2_full)
      begin
       spc1_stb_full_cntr2 <= spc1_stb_full_cntr2 + 1;
      end
    else
      begin
       spc1_stb_full_cntr2 <= spc1_stb_full_cntr2;
      end
    if( ( ~spc1_stb3_full && (spc1_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc1_stb_full_counter3 = %d", spc1_stb_full_cntr3);
      end
    else if( spc1_stb3_full)
      begin
       spc1_stb_full_cntr3 <= spc1_stb_full_cntr3 + 1;
      end
    else
      begin
       spc1_stb_full_cntr3 <= spc1_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc1_lmq0_full_d or spc1_lmq0_full)
begin
if (spc1_lmq0_full_d && ~spc1_lmq0_full)
spc1_lmq_full_capture0 <= 1'b1;
else
spc1_lmq_full_capture0 <= 1'b0;

end
always @(spc1_lmq1_full_d or spc1_lmq1_full)
begin
if (spc1_lmq1_full_d && ~spc1_lmq1_full)
spc1_lmq_full_capture1 <= 1'b1;
else
spc1_lmq_full_capture1 <= 1'b0;

end
always @(spc1_lmq2_full_d or spc1_lmq2_full)
begin
if (spc1_lmq2_full_d && ~spc1_lmq2_full)
spc1_lmq_full_capture2 <= 1'b1;
else
spc1_lmq_full_capture2 <= 1'b0;

end
always @(spc1_lmq3_full_d or spc1_lmq3_full)
begin
if (spc1_lmq3_full_d && ~spc1_lmq3_full)
spc1_lmq_full_capture3 <= 1'b1;
else
spc1_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc1_lmq0_full && (spc1_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc1_lmq_full_cntr0 <= 9'h000;
       spc1_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_lmq_full_counter0 = %d", spc1_lmq_full_cntr0);
      end
    else if( spc1_lmq0_full)
      begin
       spc1_lmq_full_cntr0 <= spc1_lmq_full_cntr0 + 1;
       spc1_lmq0_full_d <= spc1_lmq0_full;
      end
    else
      begin
       spc1_lmq_full_cntr0 <= spc1_lmq_full_cntr0;
       spc1_lmq0_full_d <= spc1_lmq0_full;
      end

    if( ( ~spc1_lmq1_full && (spc1_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc1_lmq_full_cntr1 <= 9'h000;
       spc1_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_lmq_full_counter1 = %d", spc1_lmq_full_cntr1);
      end
    else if( spc1_lmq1_full)
      begin
       spc1_lmq_full_cntr1 <= spc1_lmq_full_cntr1 + 1;
       spc1_lmq1_full_d <= spc1_lmq1_full;
      end
    else
      begin
       spc1_lmq_full_cntr1 <= spc1_lmq_full_cntr1;
       spc1_lmq1_full_d <= spc1_lmq1_full;
      end

    if( ( ~spc1_lmq2_full && (spc1_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc1_lmq_full_cntr2 <= 9'h000;
       spc1_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_lmq_full_counter2 = %d", spc1_lmq_full_cntr2);
      end
    else if( spc1_lmq2_full)
      begin
       spc1_lmq_full_cntr2 <= spc1_lmq_full_cntr2 + 1;
       spc1_lmq2_full_d <= spc1_lmq2_full;
      end
    else
      begin
       spc1_lmq_full_cntr2 <= spc1_lmq_full_cntr2;
       spc1_lmq2_full_d <= spc1_lmq2_full;
      end

    if( ( ~spc1_lmq3_full && (spc1_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc1_lmq_full_cntr3 <= 9'h000;
       spc1_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_lmq_full_counter3 = %d", spc1_lmq_full_cntr3);
      end
    else if( spc1_lmq3_full)
      begin
       spc1_lmq_full_cntr3 <= spc1_lmq_full_cntr3 + 1;
       spc1_lmq3_full_d <= spc1_lmq3_full;
      end
    else
      begin
       spc1_lmq_full_cntr3 <= spc1_lmq_full_cntr3;
       spc1_lmq3_full_d <= spc1_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc1_dfq_full_d or spc1_dfq_full)
begin
  if (spc1_dfq_full_d && ~spc1_dfq_full)
    spc1_dfq_full_capture <= 1'b1;
  else
    spc1_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc1_dfq_full && (spc1_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc1_dfq_full_cntr <= 9'h000;
       spc1_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dfq_full_counter = %d", spc1_dfq_full_cntr);
      end
    else if( spc1_dfq_full)
      begin
       spc1_dfq_full_cntr <= spc1_dfq_full_cntr + 1;
       spc1_dfq_full_d <= spc1_dfq_full;
      end
    else
      begin
       spc1_dfq_full_cntr <= spc1_dfq_full_cntr;
       spc1_dfq_full_d <= spc1_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc1_dva_full_d or spc1_dva_inv)
begin
  if (spc1_dva_full_d && ~spc1_dva_inv)
    spc1_dva_full_capture <= 1'b1;
  else
    spc1_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc1_dva_din && spc1_dva_wen)
    begin
     spc1_dva_inv <= 1'b1;
     spc1_dva_waddr_d <= spc1_dva_waddr;
    end
  else if(~spc1_dva_din && spc1_dva_wen)
    begin
     spc1_dva_inv <= 1'b0;
     spc1_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc1_dva_inv <= spc1_dva_inv;
     spc1_dva_waddr_d <= spc1_dva_waddr_d;
    end
end

always @(spc1_dva_raddr or spc1_dva_ren or spc1_dva_inv)
begin
  if (spc1_dva_inv && spc1_dva_ren && (spc1_dva_raddr[6:2] == spc1_dva_waddr_d))
    spc1_dva_vld2lkup <= 1'b1;
  else
    spc1_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc1_dva_inv && (spc1_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc1_dva_full_cntr <= 9'h000;
       spc1_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc1_dva_full_counter = %d", spc1_dva_full_cntr);
      end
    else if( spc1_dva_inv)
      begin
       spc1_dva_full_cntr <= spc1_dva_full_cntr + 1;
       spc1_dva_full_d <= spc1_dva_inv;
      end
    else
      begin
       spc1_dva_full_cntr <= spc1_dva_full_cntr;
       spc1_dva_full_d <= spc1_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc1_dva_vfull_d or spc1_dva_vld)
begin
  if (spc1_dva_vfull_d && ~spc1_dva_vld)
    spc1_dva_vfull_capture <= 1'b1;
  else
    spc1_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc1_dva_din && spc1_dva_wen)
   begin
    spc1_dva_vld <= 1'b1;
    spc1_dva_invwaddr_d <= spc1_dva_waddr;
    spc1_dva_invld_err <= spc1_dva_inv_perror;
   end
  else if(spc1_dva_din && spc1_dva_wen)
    begin
     spc1_dva_vld <= 1'b0;
     spc1_dva_invwaddr_d <= 5'b00000;
     spc1_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc1_dva_vld <= spc1_dva_vld;
     spc1_dva_invwaddr_d <= spc1_dva_invwaddr_d;
     spc1_dva_invld_err <= spc1_dva_invld_err;
    end
end


always @(spc1_dva_raddr or spc1_dva_ren or spc1_dva_vld)
begin
  if (spc1_dva_vld && spc1_dva_ren && (spc1_dva_raddr[6:2] == spc1_dva_waddr_d))
    spc1_dva_invld2lkup <= 1'b1;
  else
    spc1_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc1_dva_vld && (spc1_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc1_dva_vfull_cntr <= 9'h000;
    spc1_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc1_dva_vfull_counter = %d", spc1_dva_vfull_cntr);
  end
    else if( spc1_dva_vld)
    begin
      spc1_dva_vfull_cntr <= spc1_dva_vfull_cntr + 1;
      spc1_dva_vfull_d <= spc1_dva_vld;
    end
    else
    begin
      spc1_dva_vfull_cntr <= spc1_dva_vfull_cntr;
      spc1_dva_vfull_d <= spc1_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc1_dva_raddr or spc1_dva_waddr or spc1_dva_ren or spc1_dva_wen)
begin
  if ( spc1_dva_ren && spc1_dva_wen && (spc1_dva_raddr[6:2] == spc1_dva_waddr))
    spc1_dva_collide <= 1'b1;
  else
    spc1_dva_collide <= 1'b0;
end

// dva error cases

always @(spc1_dva_raddr or spc1_dva_ren or spc1_dva_dtag_perror or spc1_dva_dtag_perror)
begin
  if (spc1_dva_ren && (spc1_dva_dtag_perror || spc1_dva_dtag_perror))
    spc1_dva_err <= 1'b1;
  else
    spc1_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc1_dva_err)
     spc1_dva_efull_d <= 1'b1;
  else
     spc1_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc1_dva_ren && ~(spc1_dva_dtag_perror || spc1_dva_dtag_perror ) &&
       (spc1_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc1_dva_efull_cntr <= 9'h000;
     spc1_dva_raddr_d <= spc1_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc1_dva_efull_counter = %d", spc1_dva_efull_cntr);
    end
  else if(spc1_dva_efull_d)
    begin
      spc1_dva_efull_cntr <= spc1_dva_efull_cntr + 1;
      spc1_dva_raddr_d <= spc1_dva_raddr_d;
    end
  else
    begin
      spc1_dva_efull_cntr <= spc1_dva_efull_cntr;
      spc1_dva_raddr_d <= spc1_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC2

wire 	   spc2_dva_ren 	        = `SPARC_CORE2.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc2_dva_wen 	        = `SPARC_CORE2.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc2_dva_din 	        = `SPARC_CORE2.sparc0.lsu.dva_din_e;
wire [3:0] spc2_dva_dout 	        = `SPARC_CORE2.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc2_dva_raddr 	        = `SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc2_dva_waddr 	        = `SPARC_CORE2.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc2_dva_dtag_perror 	= `SPARC_CORE2.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc2_dva_dcache_perror 	= `SPARC_CORE2.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc2_dva_inv_perror 	= `SPARC_CORE2.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc2_ld_miss 	        = `SPARC_CORE2.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc2_ld_miss_capture;

wire 	   spc2_atomic_g 	        = `SPARC_CORE2.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc2_atm_type0 	= `SPARC_CORE2.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc2_atm_type1 	= `SPARC_CORE2.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc2_atm_type2 	= `SPARC_CORE2.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc2_atm_type3 	= `SPARC_CORE2.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc2_dctl_lsu_way_hit 	= `SPARC_CORE2.sparc0.lsu.dctl.lsu_way_hit;
wire       spc2_dctl_dcache_enable_g 	= `SPARC_CORE2.sparc0.lsu.dctl.dcache_enable_g;
wire       spc2_dctl_ldxa_internal 	= `SPARC_CORE2.sparc0.lsu.dctl.ldxa_internal;
wire       spc2_dctl_ldst_dbl_g 	= `SPARC_CORE2.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc2_dctl_atomic_g 	= `SPARC_CORE2.sparc0.lsu.dctl.atomic_g;
wire       spc2_dctl_stb_cam_hit 	= `SPARC_CORE2.sparc0.lsu.dctl.stb_cam_hit;
wire       spc2_dctl_endian_mispred_g 	= `SPARC_CORE2.sparc0.lsu.dctl.endian_mispred_g;
wire       spc2_dctl_dcache_rd_parity_error 	= `SPARC_CORE2.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc2_dctl_dtag_perror_g 	= `SPARC_CORE2.sparc0.lsu.dctl.dtag_perror_g;
wire       spc2_dctl_tte_data_perror_unc 	= `SPARC_CORE2.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc2_dctl_ld_inst_vld_g 	= `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc2_dctl_lsu_alt_space_g 	= `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc2_dctl_recognized_asi_g 	= `SPARC_CORE2.sparc0.lsu.dctl.recognized_asi_g;
wire       spc2_dctl_ncache_asild_rq_g  = `SPARC_CORE2.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc2_dctl_bld_hit;
wire       spc2_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc2_ixinv0  = `SPARC_CORE2.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc2_ixinv1  = `SPARC_CORE2.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc2_ixinv2  = `SPARC_CORE2.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc2_ixinv3  = `SPARC_CORE2.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc2_ifill  = `SPARC_CORE2.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc2_inv  = `SPARC_CORE2.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc2_inv_clr  = `SPARC_CORE2.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc2_ibuf_busy  = `SPARC_CORE2.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc2_l2  = `SPARC_CORE2.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc2_unc  = `SPARC_CORE2.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc2_fpld  = `SPARC_CORE2.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc2_fpldst  = `SPARC_CORE2.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc2_unflush  = `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc2_ldw  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc2_byp  = `SPARC_CORE2.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc2_flsh  = `SPARC_CORE2.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc2_chm  = `SPARC_CORE2.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc2_ldxa  = `SPARC_CORE2.sparc0.lsu.dctl.ldxa_internal ;
wire       spc2_ato  = `SPARC_CORE2.sparc0.lsu.dctl.atomic_g ;
wire       spc2_pref  = `SPARC_CORE2.sparc0.lsu.dctl.pref_inst_g ;
wire       spc2_chit  = `SPARC_CORE2.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc2_dcp  = `SPARC_CORE2.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc2_dtp  = `SPARC_CORE2.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc2_mpc  = `SPARC_CORE2.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc2_mpc  = 1'b0;
wire       spc2_mpu  = `SPARC_CORE2.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc2_exu_und;
reg  [4:0] spc2_exu;

// excptn
wire spc2_exp_wtchpt_trp_g                    = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc2_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc2_exp_priv_violtn_g                    = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc2_exp_daccess_excptn_g                 = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc2_exp_daccess_prot_g                   = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc2_exp_priv_action_g                    = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc2_exp_spec_access_epage_g              = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc2_exp_uncache_atomic_g                 = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc2_exp_illegal_asi_action_g             = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc2_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc2_exp_asi_rd_unc                       = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc2_exp_tlb_data_ce                     = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc2_exp_asi_rd_unc                       = 1'b0;
wire spc2_exp_tlb_data_ce                     =  1'b0;

wire spc2_exp_tlb_data_ue                     = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc2_exp_tlb_tag_ue                      = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc2_exp_unc                  = `SPARC_CORE2.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc2_exp_corr                 = `SPARC_CORE2.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc2_exp_corr                 = 1'b0;
wire [15:0] spc2_exp_und;
reg  [4:0] spc2_exp;
// dctl cmplt

wire       spc2_dctl_stxa_internal_d2  = `SPARC_CORE2.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc2_dctl_lsu_l2fill_vld  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc2_dctl_atomic_ld_squash_e  = `SPARC_CORE2.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc2_dctl_lsu_ignore_fill  = `SPARC_CORE2.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc2_dctl_l2fill_fpld_e  = `SPARC_CORE2.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc2_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc2_dctl_fill_err_trap_e  = `SPARC_CORE2.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc2_dctl_l2_corr_error_e  = `SPARC_CORE2.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc2_dctl_intld_byp_cmplt  = `SPARC_CORE2.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc2_dctl_lsu_intrpt_cmplt  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc2_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE2.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc2_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE2.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc2_dctl_lsu_pcx_pref_issue  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc2_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE2.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc2_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc2_ldstcond_cmplt_d;

wire       spc2_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE2.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc2_qctl1_ld0_inst_vld_g  = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc2_ld0_pkt_vld_unmasked  = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc2_ld0_pkt_vld_unmasked_d;
reg	   spc2_qctl1_ld_sec_hit_thrd0_w2;

wire       spc2_dctl_thread0_w3  = `SPARC_CORE2.sparc0.lsu.dctl.thread0_w3;
wire       spc2_dctl_dfill_thread0  = `SPARC_CORE2.sparc0.lsu.dctl.dfill_thread0;
wire       spc2_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc2_dctl_diag_wr_cmplt0  = `SPARC_CORE2.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc2_dctl_bsync0_reset  = `SPARC_CORE2.sparc0.lsu.dctl.bsync0_reset;
wire       spc2_dctl_late_cmplt0  = `SPARC_CORE2.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc2_dctl_stxa_cmplt0;
wire       spc2_dctl_l2fill_cmplt0;
wire       spc2_dctl_atm_cmplt0;
wire       spc2_dctl_fillerr0;
wire [4:0] spc2_cmplt0;
wire [5:0] spc2_dctl_ldst_cond_cmplt0;
reg  [3:0] spc2_ldstcond_cmplt0;
reg  [3:0] spc2_ldstcond_cmplt0_d;

wire       spc2_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE2.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc2_qctl1_ld1_inst_vld_g  = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc2_ld1_pkt_vld_unmasked  = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc2_ld1_pkt_vld_unmasked_d;
reg	   spc2_qctl1_ld_sec_hit_thrd1_w2;

wire       spc2_dctl_thread1_w3  = `SPARC_CORE2.sparc0.lsu.dctl.thread1_w3;
wire       spc2_dctl_dfill_thread1  = `SPARC_CORE2.sparc0.lsu.dctl.dfill_thread1;
wire       spc2_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc2_dctl_diag_wr_cmplt1  = `SPARC_CORE2.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc2_dctl_bsync1_reset  = `SPARC_CORE2.sparc0.lsu.dctl.bsync1_reset;
wire       spc2_dctl_late_cmplt1  = `SPARC_CORE2.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc2_dctl_stxa_cmplt1;
wire       spc2_dctl_l2fill_cmplt1;
wire       spc2_dctl_atm_cmplt1;
wire       spc2_dctl_fillerr1;
wire [4:0] spc2_cmplt1;
wire [5:0] spc2_dctl_ldst_cond_cmplt1;
reg  [3:0] spc2_ldstcond_cmplt1;
reg  [3:0] spc2_ldstcond_cmplt1_d;

wire       spc2_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE2.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc2_qctl1_ld2_inst_vld_g  = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc2_ld2_pkt_vld_unmasked  = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc2_ld2_pkt_vld_unmasked_d;
reg	   spc2_qctl1_ld_sec_hit_thrd2_w2;

wire       spc2_dctl_thread2_w3  = `SPARC_CORE2.sparc0.lsu.dctl.thread2_w3;
wire       spc2_dctl_dfill_thread2  = `SPARC_CORE2.sparc0.lsu.dctl.dfill_thread2;
wire       spc2_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc2_dctl_diag_wr_cmplt2  = `SPARC_CORE2.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc2_dctl_bsync2_reset  = `SPARC_CORE2.sparc0.lsu.dctl.bsync2_reset;
wire       spc2_dctl_late_cmplt2  = `SPARC_CORE2.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc2_dctl_stxa_cmplt2;
wire       spc2_dctl_l2fill_cmplt2;
wire       spc2_dctl_atm_cmplt2;
wire       spc2_dctl_fillerr2;
wire [4:0] spc2_cmplt2;
wire [5:0] spc2_dctl_ldst_cond_cmplt2;
reg  [3:0] spc2_ldstcond_cmplt2;
reg  [3:0] spc2_ldstcond_cmplt2_d;

wire       spc2_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE2.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc2_qctl1_ld3_inst_vld_g  = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc2_ld3_pkt_vld_unmasked  = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc2_ld3_pkt_vld_unmasked_d;
reg	   spc2_qctl1_ld_sec_hit_thrd3_w2;

wire       spc2_dctl_thread3_w3  = `SPARC_CORE2.sparc0.lsu.dctl.thread3_w3;
wire       spc2_dctl_dfill_thread3  = `SPARC_CORE2.sparc0.lsu.dctl.dfill_thread3;
wire       spc2_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc2_dctl_diag_wr_cmplt3  = `SPARC_CORE2.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc2_dctl_bsync3_reset  = `SPARC_CORE2.sparc0.lsu.dctl.bsync3_reset;
wire       spc2_dctl_late_cmplt3  = `SPARC_CORE2.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc2_dctl_stxa_cmplt3;
wire       spc2_dctl_l2fill_cmplt3;
wire       spc2_dctl_atm_cmplt3;
wire       spc2_dctl_fillerr3;
wire [4:0] spc2_cmplt3;
wire [5:0] spc2_dctl_ldst_cond_cmplt3;
reg  [3:0] spc2_ldstcond_cmplt3;
reg  [3:0] spc2_ldstcond_cmplt3_d;


wire       spc2_qctl1_bld_g 	= `SPARC_CORE2.sparc0.lsu.qctl1.bld_g;
wire       spc2_qctl1_bld_reset 	= `SPARC_CORE2.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc2_qctl1_bld_cnt 	= `SPARC_CORE2.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc2_bld0_full_cntr;
reg  [1:0] spc2_bld0_full_d;
reg 	   spc2_bld0_full_capture;
reg  [9:0] spc2_bld1_full_cntr;
reg  [1:0] spc2_bld1_full_d;
reg 	   spc2_bld1_full_capture;
reg  [9:0] spc2_bld2_full_cntr;
reg  [1:0] spc2_bld2_full_d;
reg 	   spc2_bld2_full_capture;
reg  [9:0] spc2_bld3_full_cntr;
reg  [1:0] spc2_bld3_full_d;
reg 	   spc2_bld3_full_capture;

wire       spc2_ipick 	= `SPARC_CORE2.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc2_lpick 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc2_spick 	= `SPARC_CORE2.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc2_mpick 	= `SPARC_CORE2.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc2_apick 	= `SPARC_CORE2.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc2_msquash 	= `SPARC_CORE2.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc2_fpicko;
wire [3:0] spc2_fpick;

wire [39:0] spc2_imiss_pa 	= `SPARC_CORE2.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc2_imiss_vld 	= `SPARC_CORE2.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc2_imiss_vld_d;
wire [39:0] spc2_lmiss_pa0 	= `SPARC_CORE2.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc2_lmiss_vld0 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc2_ld_pkt_vld0 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc2_st_pkt_vld0 	= `SPARC_CORE2.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc2_lmiss_eq0;
reg             spc2_atm_imiss_eq0;
wire [39:0] spc2_lmiss_pa1 	= `SPARC_CORE2.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc2_lmiss_vld1 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc2_ld_pkt_vld1 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc2_st_pkt_vld1 	= `SPARC_CORE2.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc2_lmiss_eq1;
reg             spc2_atm_imiss_eq1;
wire [39:0] spc2_lmiss_pa2 	= `SPARC_CORE2.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc2_lmiss_vld2 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc2_ld_pkt_vld2 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc2_st_pkt_vld2 	= `SPARC_CORE2.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc2_lmiss_eq2;
reg             spc2_atm_imiss_eq2;
wire [39:0] spc2_lmiss_pa3 	= `SPARC_CORE2.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc2_lmiss_vld3 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc2_ld_pkt_vld3 	= `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc2_st_pkt_vld3 	= `SPARC_CORE2.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc2_lmiss_eq3;
reg             spc2_atm_imiss_eq3;

wire [44:0]	spc2_wdata_ramc = `SPARC_CORE2.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc2_wptr_vld   = `SPARC_CORE2.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc2_wdata_ramd = {`SPARC_CORE2.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE2.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc2_stb_cam_hit 	        = `SPARC_CORE2.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc2_stb_cam_hit_ptr 	= `SPARC_CORE2.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc2_stb_ld_full_raw	= `SPARC_CORE2.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc2_stb_ld_partial_raw	= `SPARC_CORE2.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc2_stb_cam_mhit		= `SPARC_CORE2.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc2_dfq_vld_entries 	= `SPARC_CORE2.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc2_dfq_full;
reg  [9:0] spc2_dfq_full_cntr;
reg        spc2_dfq_full_d;
reg 	   spc2_dfq_full_capture;

reg  [9:0] spc2_dfq_full_cntr1;
reg        spc2_dfq_full_d1;
wire 	   spc2_dfq_full1;
reg 	   spc2_dfq_full_capture1;
reg  [9:0] spc2_dfq_full_cntr2;
reg        spc2_dfq_full_d2;
wire 	   spc2_dfq_full2;
reg 	   spc2_dfq_full_capture2;
reg  [9:0] spc2_dfq_full_cntr3;
reg        spc2_dfq_full_d3;
wire 	   spc2_dfq_full3;
reg 	   spc2_dfq_full_capture3;
reg  [9:0] spc2_dfq_full_cntr4;
reg        spc2_dfq_full_d4;
wire 	   spc2_dfq_full4;
reg 	   spc2_dfq_full_capture4;
reg  [9:0] spc2_dfq_full_cntr5;
reg        spc2_dfq_full_d5;
wire 	   spc2_dfq_full5;
reg 	   spc2_dfq_full_capture5;
reg  [9:0] spc2_dfq_full_cntr6;
reg        spc2_dfq_full_d6;
wire 	   spc2_dfq_full6;
reg 	   spc2_dfq_full_capture6;
reg  [9:0] spc2_dfq_full_cntr7;
reg        spc2_dfq_full_d7;
wire 	   spc2_dfq_full7;
reg 	   spc2_dfq_full_capture7;

wire 	   spc2_dva_rdwrhit;
reg  [9:0] spc2_dva_full_cntr;
reg        spc2_dva_full_d;
reg 	   spc2_dva_full_capture;
reg 	   spc2_dva_inv;
reg 	   spc2_dva_inv_d;
reg 	   spc2_dva_vld;
reg 	   spc2_dva_vld_d;
reg  [9:0] spc2_dva_vfull_cntr;
reg        spc2_dva_vfull_d;
reg 	   spc2_dva_vfull_capture;
reg        spc2_dva_collide;
reg        spc2_dva_vld2lkup;
reg        spc2_dva_invld2lkup;
reg        spc2_dva_invld_err;

reg  [9:0] spc2_dva_efull_cntr;
reg        spc2_dva_efull_d;

reg        spc2_dva_vlddtag_err;
reg        spc2_dva_vlddcache_err;
reg        spc2_dva_err;
reg [6:0] spc2_dva_raddr_d;
reg [4:0] spc2_dva_waddr_d;
reg [4:0] spc2_dva_invwaddr_d;

reg  	        spc2_ld0_lt_1;
reg  	        spc2_ld0_lt_2;
reg  	        spc2_ld0_lt_3;
reg  	        spc2_ld1_lt_0;
reg  	        spc2_ld1_lt_2;
reg  	        spc2_ld1_lt_3;
reg  	        spc2_ld2_lt_0;
reg  	        spc2_ld2_lt_1;
reg  	        spc2_ld2_lt_3;
reg  	        spc2_ld3_lt_0;
reg  	        spc2_ld3_lt_1;
reg  	        spc2_ld3_lt_2;

reg  	        spc2_st0_lt_1;
reg  	        spc2_st0_lt_2;
reg  	        spc2_st0_lt_3;
reg  	        spc2_st1_lt_0;
reg  	        spc2_st1_lt_2;
reg  	        spc2_st1_lt_3;
reg  	        spc2_st2_lt_0;
reg  	        spc2_st2_lt_1;
reg  	        spc2_st2_lt_3;
reg  	        spc2_st3_lt_0;
reg  	        spc2_st3_lt_1;
reg  	        spc2_st3_lt_2;

wire [11:0]      spc2_ld_ooo_ret;
wire [11:0]      spc2_st_ooo_ret;

wire [7:0]	spc2_stb_state_vld0 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc2_stb_state_ack0 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc2_stb_state_ced0 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc2_stb_state_rst0 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc2_stb_ack_vld0 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc2_ld0_inst_vld_g 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc2_intrpt0_cmplt 	 = `SPARC_CORE2.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc2_stb0_full 	         = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc2_stb0_full_w2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc2_lmq0_full 	         = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc2_mbar_vld0 	         = `SPARC_CORE2.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc2_ld0_unfilled 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc2_flsh_vld0	         = `SPARC_CORE2.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc2_ld0_unf_cntr;
reg  	        spc2_ld0_unfilled_d;

reg  [9:0]	spc2_st0_unf_cntr;
reg  	        spc2_st0_unfilled_d;
reg  	        spc2_st0_unfilled;

reg 	        spc2_mbar_vld_d0;
reg 	        spc2_flsh_vld_d0;

reg 	        spc2_lmq0_full_d;
reg  [9:0]	spc2_lmq_full_cntr0;
reg             spc2_lmq_full_capture0;

reg  [9:0]	spc2_stb_full_cntr0;
reg 		spc2_stb_full_capture0;

reg  [9:0]	spc2_mbar_vld_cntr0;
reg 		spc2_mbar_vld_capture0;

reg  [9:0]	spc2_flsh_vld_cntr0;
reg 		spc2_flsh_vld_capture0;

reg 		spc2_stb_head_hit0;
wire 		spc2_raw_ack_capture0;
reg  [9:0]	spc2_stb_ack_cntr0;

reg  [9:0]	spc2_stb_ced_cntr0;
reg  	        spc2_stb_ced0_d;
reg  	        spc2_stb_ced_capture0;
wire  	        spc2_stb_ced0;

reg 	        spc2_atm0_d;
reg  [9:0]	spc2_atm_cntr0;
reg             spc2_atm_intrpt_capture0;
reg             spc2_atm_intrpt_b4capture0;
reg             spc2_atm_inv_capture0;


reg  [39:0]     spc2_stb_wr_addr0;
reg  [39:0]     spc2_stb_atm_addr0;
reg             spc2_atm_lmiss_eq0;
wire [7:0]	spc2_stb_state_vld1 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc2_stb_state_ack1 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc2_stb_state_ced1 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc2_stb_state_rst1 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc2_stb_ack_vld1 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc2_ld1_inst_vld_g 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc2_intrpt1_cmplt 	 = `SPARC_CORE2.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc2_stb1_full 	         = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc2_stb1_full_w2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc2_lmq1_full 	         = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc2_mbar_vld1 	         = `SPARC_CORE2.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc2_ld1_unfilled 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc2_flsh_vld1	         = `SPARC_CORE2.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc2_ld1_unf_cntr;
reg  	        spc2_ld1_unfilled_d;

reg  [9:0]	spc2_st1_unf_cntr;
reg  	        spc2_st1_unfilled_d;
reg  	        spc2_st1_unfilled;

reg 	        spc2_mbar_vld_d1;
reg 	        spc2_flsh_vld_d1;

reg 	        spc2_lmq1_full_d;
reg  [9:0]	spc2_lmq_full_cntr1;
reg             spc2_lmq_full_capture1;

reg  [9:0]	spc2_stb_full_cntr1;
reg 		spc2_stb_full_capture1;

reg  [9:0]	spc2_mbar_vld_cntr1;
reg 		spc2_mbar_vld_capture1;

reg  [9:0]	spc2_flsh_vld_cntr1;
reg 		spc2_flsh_vld_capture1;

reg 		spc2_stb_head_hit1;
wire 		spc2_raw_ack_capture1;
reg  [9:0]	spc2_stb_ack_cntr1;

reg  [9:0]	spc2_stb_ced_cntr1;
reg  	        spc2_stb_ced1_d;
reg  	        spc2_stb_ced_capture1;
wire  	        spc2_stb_ced1;

reg 	        spc2_atm1_d;
reg  [9:0]	spc2_atm_cntr1;
reg             spc2_atm_intrpt_capture1;
reg             spc2_atm_intrpt_b4capture1;
reg             spc2_atm_inv_capture1;


reg  [39:0]     spc2_stb_wr_addr1;
reg  [39:0]     spc2_stb_atm_addr1;
reg             spc2_atm_lmiss_eq1;
wire [7:0]	spc2_stb_state_vld2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc2_stb_state_ack2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc2_stb_state_ced2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc2_stb_state_rst2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc2_stb_ack_vld2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc2_ld2_inst_vld_g 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc2_intrpt2_cmplt 	 = `SPARC_CORE2.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc2_stb2_full 	         = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc2_stb2_full_w2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc2_lmq2_full 	         = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc2_mbar_vld2 	         = `SPARC_CORE2.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc2_ld2_unfilled 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc2_flsh_vld2	         = `SPARC_CORE2.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc2_ld2_unf_cntr;
reg  	        spc2_ld2_unfilled_d;

reg  [9:0]	spc2_st2_unf_cntr;
reg  	        spc2_st2_unfilled_d;
reg  	        spc2_st2_unfilled;

reg 	        spc2_mbar_vld_d2;
reg 	        spc2_flsh_vld_d2;

reg 	        spc2_lmq2_full_d;
reg  [9:0]	spc2_lmq_full_cntr2;
reg             spc2_lmq_full_capture2;

reg  [9:0]	spc2_stb_full_cntr2;
reg 		spc2_stb_full_capture2;

reg  [9:0]	spc2_mbar_vld_cntr2;
reg 		spc2_mbar_vld_capture2;

reg  [9:0]	spc2_flsh_vld_cntr2;
reg 		spc2_flsh_vld_capture2;

reg 		spc2_stb_head_hit2;
wire 		spc2_raw_ack_capture2;
reg  [9:0]	spc2_stb_ack_cntr2;

reg  [9:0]	spc2_stb_ced_cntr2;
reg  	        spc2_stb_ced2_d;
reg  	        spc2_stb_ced_capture2;
wire  	        spc2_stb_ced2;

reg 	        spc2_atm2_d;
reg  [9:0]	spc2_atm_cntr2;
reg             spc2_atm_intrpt_capture2;
reg             spc2_atm_intrpt_b4capture2;
reg             spc2_atm_inv_capture2;


reg  [39:0]     spc2_stb_wr_addr2;
reg  [39:0]     spc2_stb_atm_addr2;
reg             spc2_atm_lmiss_eq2;
wire [7:0]	spc2_stb_state_vld3 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc2_stb_state_ack3 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc2_stb_state_ced3 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc2_stb_state_rst3 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc2_stb_ack_vld3 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc2_ld3_inst_vld_g 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc2_intrpt3_cmplt 	 = `SPARC_CORE2.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc2_stb3_full 	         = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc2_stb3_full_w2 	 = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc2_lmq3_full 	         = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc2_mbar_vld3 	         = `SPARC_CORE2.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc2_ld3_unfilled 	 = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc2_flsh_vld3	         = `SPARC_CORE2.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc2_ld3_unf_cntr;
reg  	        spc2_ld3_unfilled_d;

reg  [9:0]	spc2_st3_unf_cntr;
reg  	        spc2_st3_unfilled_d;
reg  	        spc2_st3_unfilled;

reg 	        spc2_mbar_vld_d3;
reg 	        spc2_flsh_vld_d3;

reg 	        spc2_lmq3_full_d;
reg  [9:0]	spc2_lmq_full_cntr3;
reg             spc2_lmq_full_capture3;

reg  [9:0]	spc2_stb_full_cntr3;
reg 		spc2_stb_full_capture3;

reg  [9:0]	spc2_mbar_vld_cntr3;
reg 		spc2_mbar_vld_capture3;

reg  [9:0]	spc2_flsh_vld_cntr3;
reg 		spc2_flsh_vld_capture3;

reg 		spc2_stb_head_hit3;
wire 		spc2_raw_ack_capture3;
reg  [9:0]	spc2_stb_ack_cntr3;

reg  [9:0]	spc2_stb_ced_cntr3;
reg  	        spc2_stb_ced3_d;
reg  	        spc2_stb_ced_capture3;
wire  	        spc2_stb_ced3;

reg 	        spc2_atm3_d;
reg  [9:0]	spc2_atm_cntr3;
reg             spc2_atm_intrpt_capture3;
reg             spc2_atm_intrpt_b4capture3;
reg             spc2_atm_inv_capture3;


reg  [39:0]     spc2_stb_wr_addr3;
reg  [39:0]     spc2_stb_atm_addr3;
reg             spc2_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc2_fpick = {spc2_mpick,spc2_spick,spc2_lpick,spc2_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc2_msquash,spc2_apick,spc2_fpick})
         9'b000000000 : spc2_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc2_fpicko = 1'b0;
         9'b1xxxxxxxx : spc2_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc2_fpicko = 1'b0;
	 default:
	  begin
		spc2_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon2 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc2_exu_und = {spc2_l2,
			  spc2_unc,
			  spc2_fpld,
			  spc2_fpldst,
			  spc2_unflush,
			  spc2_ldw,
			  spc2_byp,
			  spc2_flsh,
			  spc2_chm,
			  spc2_ldxa,
			  spc2_ato,
			  spc2_pref,
			  spc2_chit,
			  spc2_dcp,
			  spc2_dtp,
			  spc2_mpc,
			  spc2_mpu};

always @(spc2_exu_und)
begin
       case (spc2_exu_und)
         17'h00000 : spc2_exu =  5'h00;
         17'h00001 : spc2_exu =  5'h01;
         17'h00002 : spc2_exu =  5'h02;
         17'h00004 : spc2_exu =  5'h03;
         17'h00008 : spc2_exu =  5'h04;
         17'h00010 : spc2_exu =  5'h05;
         17'h00020 : spc2_exu =  5'h06;
         17'h00040 : spc2_exu =  5'h07;
         17'h00080 : spc2_exu =  5'h08;
         17'h00100 : spc2_exu =  5'h09;
         17'h00200 : spc2_exu =  5'h0a;
         17'h00400 : spc2_exu =  5'h0b;
         17'h00800 : spc2_exu =  5'h0c;
         17'h01000 : spc2_exu =  5'h0d;
         17'h02000 : spc2_exu =  5'h0e;
         17'h04000 : spc2_exu =  5'h0f;
         17'h08000 : spc2_exu =  5'h10;
         17'h10000 : spc2_exu =  5'h11;
	 default: spc2_exu =  5'h12;
       endcase
end
//excp
assign spc2_exp_und = {spc2_exp_wtchpt_trp_g,
			  spc2_exp_misalign_addr_ldst_atm_m,
			  spc2_exp_priv_violtn_g,
			  spc2_exp_daccess_excptn_g,
			  spc2_exp_daccess_prot_g,
			  spc2_exp_priv_action_g,
			  spc2_exp_spec_access_epage_g,
			  spc2_exp_uncache_atomic_g,
			  spc2_exp_illegal_asi_action_g,
			  spc2_exp_flt_ld_nfo_pg_g,
			  spc2_exp_asi_rd_unc,
			  spc2_exp_tlb_data_ce,
			  spc2_exp_tlb_data_ue,
			  spc2_exp_tlb_tag_ue,
			  spc2_exp_unc,
			  spc2_exp_corr};

always @(spc2_exp_und)
begin
       case (spc2_exp_und)
         16'h0000 : spc2_exp =  5'h00;
         16'h0001 : spc2_exp =  5'h01;
         16'h0002 : spc2_exp =  5'h02;
         16'h0004 : spc2_exp =  5'h03;
         16'h0008 : spc2_exp =  5'h04;
         16'h0010 : spc2_exp =  5'h05;
         16'h0020 : spc2_exp =  5'h06;
         16'h0040 : spc2_exp =  5'h07;
         16'h0080 : spc2_exp =  5'h08;
         16'h0100 : spc2_exp =  5'h09;
         16'h0200 : spc2_exp =  5'h0a;
         16'h0400 : spc2_exp =  5'h0b;
         16'h0800 : spc2_exp =  5'h0c;
         16'h1000 : spc2_exp =  5'h0d;
         16'h2000 : spc2_exp =  5'h0e;
         16'h4000 : spc2_exp =  5'h0f;
         16'h8000 : spc2_exp =  5'h10;
	 default: spc2_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc2_dctl_stxa_cmplt0 = ((spc2_dctl_stxa_internal_d2 & spc2_dctl_thread0_w3) |
				       spc2_dctl_stxa_stall_wr_cmplt0_d1);
assign spc2_dctl_l2fill_cmplt0 = (((spc2_dctl_lsu_l2fill_vld & ~spc2_dctl_atomic_ld_squash_e &
					    ~spc2_dctl_lsu_ignore_fill)) & ~spc2_dctl_l2fill_fpld_e &
					  ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread0);

assign spc2_dctl_fillerr0 = spc2_dctl_l2_corr_error_e & spc2_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc2_dctl_atm_cmplt0 = (spc2_dctl_lsu_atm_st_cmplt_e & ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread0);

assign spc2_dctl_ldst_cond_cmplt0 = { spc2_dctl_stxa_cmplt0, spc2_dctl_l2fill_cmplt0,
					    spc2_dctl_atomic_ld_squash_e, spc2_dctl_intld_byp_cmplt[0],
					    spc2_dctl_bsync0_reset, spc2_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc2_cmplt0 = { spc2_dctl_ldxa_illgl_va_cmplt_d1, spc2_dctl_pref_tlbmiss_cmplt_d2,
			      spc2_dctl_lsu_pcx_pref_issue, spc2_dctl_diag_wr_cmplt0, spc2_dctl_l2fill_fpld_e};


always @(spc2_cmplt0 or spc2_dctl_ldst_cond_cmplt0)
begin
       case ({spc2_dctl_fillerr0,spc2_dctl_ldst_cond_cmplt0,spc2_cmplt0})
         12'h000 : spc2_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc2_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc2_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc2_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc2_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc2_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc2_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc2_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc2_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc2_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc2_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc2_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc2_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc2_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc2_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc2_dctl_stxa_cmplt1 = ((spc2_dctl_stxa_internal_d2 & spc2_dctl_thread1_w3) |
				       spc2_dctl_stxa_stall_wr_cmplt1_d1);
assign spc2_dctl_l2fill_cmplt1 = (((spc2_dctl_lsu_l2fill_vld & ~spc2_dctl_atomic_ld_squash_e &
					    ~spc2_dctl_lsu_ignore_fill)) & ~spc2_dctl_l2fill_fpld_e &
					  ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread1);

assign spc2_dctl_fillerr1 = spc2_dctl_l2_corr_error_e & spc2_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc2_dctl_atm_cmplt1 = (spc2_dctl_lsu_atm_st_cmplt_e & ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread1);

assign spc2_dctl_ldst_cond_cmplt1 = { spc2_dctl_stxa_cmplt1, spc2_dctl_l2fill_cmplt1,
					    spc2_dctl_atomic_ld_squash_e, spc2_dctl_intld_byp_cmplt[1],
					    spc2_dctl_bsync1_reset, spc2_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc2_cmplt1 = { spc2_dctl_ldxa_illgl_va_cmplt_d1, spc2_dctl_pref_tlbmiss_cmplt_d2,
			      spc2_dctl_lsu_pcx_pref_issue, spc2_dctl_diag_wr_cmplt1, spc2_dctl_l2fill_fpld_e};


always @(spc2_cmplt1 or spc2_dctl_ldst_cond_cmplt1)
begin
       case ({spc2_dctl_fillerr1,spc2_dctl_ldst_cond_cmplt1,spc2_cmplt1})
         12'h000 : spc2_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc2_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc2_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc2_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc2_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc2_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc2_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc2_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc2_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc2_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc2_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc2_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc2_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc2_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc2_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc2_dctl_stxa_cmplt2 = ((spc2_dctl_stxa_internal_d2 & spc2_dctl_thread2_w3) |
				       spc2_dctl_stxa_stall_wr_cmplt2_d1);
assign spc2_dctl_l2fill_cmplt2 = (((spc2_dctl_lsu_l2fill_vld & ~spc2_dctl_atomic_ld_squash_e &
					    ~spc2_dctl_lsu_ignore_fill)) & ~spc2_dctl_l2fill_fpld_e &
					  ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread2);

assign spc2_dctl_fillerr2 = spc2_dctl_l2_corr_error_e & spc2_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc2_dctl_atm_cmplt2 = (spc2_dctl_lsu_atm_st_cmplt_e & ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread2);

assign spc2_dctl_ldst_cond_cmplt2 = { spc2_dctl_stxa_cmplt2, spc2_dctl_l2fill_cmplt2,
					    spc2_dctl_atomic_ld_squash_e, spc2_dctl_intld_byp_cmplt[2],
					    spc2_dctl_bsync2_reset, spc2_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc2_cmplt2 = { spc2_dctl_ldxa_illgl_va_cmplt_d1, spc2_dctl_pref_tlbmiss_cmplt_d2,
			      spc2_dctl_lsu_pcx_pref_issue, spc2_dctl_diag_wr_cmplt2, spc2_dctl_l2fill_fpld_e};


always @(spc2_cmplt2 or spc2_dctl_ldst_cond_cmplt2)
begin
       case ({spc2_dctl_fillerr2,spc2_dctl_ldst_cond_cmplt2,spc2_cmplt2})
         12'h000 : spc2_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc2_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc2_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc2_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc2_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc2_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc2_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc2_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc2_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc2_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc2_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc2_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc2_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc2_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc2_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc2_dctl_stxa_cmplt3 = ((spc2_dctl_stxa_internal_d2 & spc2_dctl_thread3_w3) |
				       spc2_dctl_stxa_stall_wr_cmplt3_d1);
assign spc2_dctl_l2fill_cmplt3 = (((spc2_dctl_lsu_l2fill_vld & ~spc2_dctl_atomic_ld_squash_e &
					    ~spc2_dctl_lsu_ignore_fill)) & ~spc2_dctl_l2fill_fpld_e &
					  ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread3);

assign spc2_dctl_fillerr3 = spc2_dctl_l2_corr_error_e & spc2_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc2_dctl_atm_cmplt3 = (spc2_dctl_lsu_atm_st_cmplt_e & ~spc2_dctl_fill_err_trap_e & spc2_dctl_dfill_thread3);

assign spc2_dctl_ldst_cond_cmplt3 = { spc2_dctl_stxa_cmplt3, spc2_dctl_l2fill_cmplt3,
					    spc2_dctl_atomic_ld_squash_e, spc2_dctl_intld_byp_cmplt[3],
					    spc2_dctl_bsync3_reset, spc2_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc2_cmplt3 = { spc2_dctl_ldxa_illgl_va_cmplt_d1, spc2_dctl_pref_tlbmiss_cmplt_d2,
			      spc2_dctl_lsu_pcx_pref_issue, spc2_dctl_diag_wr_cmplt3, spc2_dctl_l2fill_fpld_e};


always @(spc2_cmplt3 or spc2_dctl_ldst_cond_cmplt3)
begin
       case ({spc2_dctl_fillerr3,spc2_dctl_ldst_cond_cmplt3,spc2_cmplt3})
         12'h000 : spc2_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc2_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc2_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc2_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc2_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc2_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc2_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc2_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc2_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc2_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc2_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc2_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc2_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc2_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc2_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc2_ldstcond_cmplt0 or spc2_ldstcond_cmplt1 or spc2_ldstcond_cmplt2
	 or spc2_ldstcond_cmplt3 or spc2_dctl_lsu_ifu_ldst_cmplt
	 or spc2_dctl_late_cmplt0 or spc2_dctl_late_cmplt1 or spc2_dctl_late_cmplt2 or spc2_dctl_late_cmplt3)
begin
       case (spc2_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc2_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc2_ldstcond_cmplt_d = spc2_dctl_late_cmplt0 ? spc2_ldstcond_cmplt0_d : spc2_ldstcond_cmplt0;
         4'b0010 : spc2_ldstcond_cmplt_d = spc2_dctl_late_cmplt1 ? spc2_ldstcond_cmplt1_d : spc2_ldstcond_cmplt1;
         4'b0100 : spc2_ldstcond_cmplt_d = spc2_dctl_late_cmplt2 ? spc2_ldstcond_cmplt2_d : spc2_ldstcond_cmplt2;
         4'b1000 : spc2_ldstcond_cmplt_d = spc2_dctl_late_cmplt3 ? spc2_ldstcond_cmplt3_d : spc2_ldstcond_cmplt3;
         4'b0011 : spc2_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc2_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc2_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc2_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc2_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc2_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc2_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc2_st_ooo_ret = { spc2_st0_lt_1, spc2_st0_lt_2, spc2_st0_lt_3,
			      spc2_st1_lt_0, spc2_st1_lt_2, spc2_st1_lt_3,
			      spc2_st2_lt_0, spc2_st2_lt_1, spc2_st2_lt_3,
			      spc2_st3_lt_0, spc2_st3_lt_1, spc2_st3_lt_2};

always @(posedge clk)
begin
    if(~spc2_st0_unfilled || ~rst_l)
      spc2_st0_unfilled_d <= 1'b0;
    else
      spc2_st0_unfilled_d <= spc2_st0_unfilled;

    if(~rst_l)
      spc2_ldstcond_cmplt0_d <= 4'h0;
    else
      spc2_ldstcond_cmplt0_d <= spc2_ldstcond_cmplt0;

    if(~spc2_ld0_pkt_vld_unmasked || ~rst_l)
      spc2_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc2_ld0_pkt_vld_unmasked_d <= spc2_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc2_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc2_qctl1_ld_sec_hit_thrd0 && spc2_qctl1_ld0_inst_vld_g)
      spc2_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc2_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc2_st1_unfilled || ~rst_l)
      spc2_st1_unfilled_d <= 1'b0;
    else
      spc2_st1_unfilled_d <= spc2_st1_unfilled;

    if(~rst_l)
      spc2_ldstcond_cmplt1_d <= 4'h0;
    else
      spc2_ldstcond_cmplt1_d <= spc2_ldstcond_cmplt1;

    if(~spc2_ld1_pkt_vld_unmasked || ~rst_l)
      spc2_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc2_ld1_pkt_vld_unmasked_d <= spc2_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc2_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc2_qctl1_ld_sec_hit_thrd1 && spc2_qctl1_ld1_inst_vld_g)
      spc2_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc2_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc2_st2_unfilled || ~rst_l)
      spc2_st2_unfilled_d <= 1'b0;
    else
      spc2_st2_unfilled_d <= spc2_st2_unfilled;

    if(~rst_l)
      spc2_ldstcond_cmplt2_d <= 4'h0;
    else
      spc2_ldstcond_cmplt2_d <= spc2_ldstcond_cmplt2;

    if(~spc2_ld2_pkt_vld_unmasked || ~rst_l)
      spc2_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc2_ld2_pkt_vld_unmasked_d <= spc2_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc2_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc2_qctl1_ld_sec_hit_thrd2 && spc2_qctl1_ld2_inst_vld_g)
      spc2_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc2_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc2_st3_unfilled || ~rst_l)
      spc2_st3_unfilled_d <= 1'b0;
    else
      spc2_st3_unfilled_d <= spc2_st3_unfilled;

    if(~rst_l)
      spc2_ldstcond_cmplt3_d <= 4'h0;
    else
      spc2_ldstcond_cmplt3_d <= spc2_ldstcond_cmplt3;

    if(~spc2_ld3_pkt_vld_unmasked || ~rst_l)
      spc2_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc2_ld3_pkt_vld_unmasked_d <= spc2_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc2_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc2_qctl1_ld_sec_hit_thrd3 && spc2_qctl1_ld3_inst_vld_g)
      spc2_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc2_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc2_stb_state_ced0) && (|spc2_stb_state_rst0)) || ~rst_l)
      spc2_st0_unfilled <= 1'b0;
    else if( ((|spc2_stb_state_ced0) && ~(|spc2_stb_state_rst0)))
      spc2_st0_unfilled <= 1'b1;
    else
      spc2_st0_unfilled <= spc2_st0_unfilled;
    if( ((|spc2_stb_state_ced1) && (|spc2_stb_state_rst1)) || ~rst_l)
      spc2_st1_unfilled <= 1'b0;
    else if( ((|spc2_stb_state_ced1) && ~(|spc2_stb_state_rst1)))
      spc2_st1_unfilled <= 1'b1;
    else
      spc2_st1_unfilled <= spc2_st1_unfilled;
    if( ((|spc2_stb_state_ced2) && (|spc2_stb_state_rst2)) || ~rst_l)
      spc2_st2_unfilled <= 1'b0;
    else if( ((|spc2_stb_state_ced2) && ~(|spc2_stb_state_rst2)))
      spc2_st2_unfilled <= 1'b1;
    else
      spc2_st2_unfilled <= spc2_st2_unfilled;
    if( ((|spc2_stb_state_ced3) && (|spc2_stb_state_rst3)) || ~rst_l)
      spc2_st3_unfilled <= 1'b0;
    else if( ((|spc2_stb_state_ced3) && ~(|spc2_stb_state_rst3)))
      spc2_st3_unfilled <= 1'b1;
    else
      spc2_st3_unfilled <= spc2_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc2_st0_unfilled && spc2_st0_unfilled_d)|| ~rst_l)
      begin
        spc2_st0_unf_cntr <= 9'h000;
      end
    else if(spc2_st0_unfilled)
      begin
        spc2_st0_unf_cntr <= spc2_st0_unf_cntr + 1;
      end
    else
      begin
        spc2_st0_unf_cntr <= spc2_st0_unf_cntr;
      end
    if((~spc2_st1_unfilled && spc2_st1_unfilled_d)|| ~rst_l)
      begin
        spc2_st1_unf_cntr <= 9'h000;
      end
    else if(spc2_st1_unfilled)
      begin
        spc2_st1_unf_cntr <= spc2_st1_unf_cntr + 1;
      end
    else
      begin
        spc2_st1_unf_cntr <= spc2_st1_unf_cntr;
      end
    if((~spc2_st2_unfilled && spc2_st2_unfilled_d)|| ~rst_l)
      begin
        spc2_st2_unf_cntr <= 9'h000;
      end
    else if(spc2_st2_unfilled)
      begin
        spc2_st2_unf_cntr <= spc2_st2_unf_cntr + 1;
      end
    else
      begin
        spc2_st2_unf_cntr <= spc2_st2_unf_cntr;
      end
    if((~spc2_st3_unfilled && spc2_st3_unfilled_d)|| ~rst_l)
      begin
        spc2_st3_unf_cntr <= 9'h000;
      end
    else if(spc2_st3_unfilled)
      begin
        spc2_st3_unf_cntr <= spc2_st3_unf_cntr + 1;
      end
    else
      begin
        spc2_st3_unf_cntr <= spc2_st3_unf_cntr;
      end
end

always @(spc2_st0_unfilled or spc2_st1_unfilled or spc2_st2_unfilled or spc2_st3_unfilled
	 or spc2_st0_unfilled_d or spc2_st1_unfilled_d or spc2_st2_unfilled_d or spc2_st3_unfilled_d)
begin
if(~spc2_st0_unfilled && spc2_st0_unfilled_d && spc2_st1_unfilled)
 spc2_st0_lt_1 <= (spc2_st1_unf_cntr > spc2_st0_unf_cntr);
else
 spc2_st0_lt_1 <= 1'b0;
if(~spc2_st0_unfilled && spc2_st0_unfilled_d && spc2_st2_unfilled)
 spc2_st0_lt_2 <= (spc2_st2_unf_cntr > spc2_st0_unf_cntr);
else
 spc2_st0_lt_2 <= 1'b0;
if(~spc2_st0_unfilled && spc2_st0_unfilled_d && spc2_st3_unfilled)
 spc2_st0_lt_3 <= (spc2_st3_unf_cntr > spc2_st0_unf_cntr);
else
 spc2_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc2_st1_unfilled && spc2_st1_unfilled_d && spc2_st0_unfilled)
 spc2_st1_lt_0 <= (spc2_st0_unf_cntr > spc2_st1_unf_cntr);
else
 spc2_st1_lt_0 <= 1'b0;
if(~spc2_st1_unfilled && spc2_st1_unfilled_d && spc2_st2_unfilled)
 spc2_st1_lt_2 <= (spc2_st2_unf_cntr > spc2_st1_unf_cntr);
else
 spc2_st1_lt_2 <= 1'b0;
if(~spc2_st1_unfilled && spc2_st1_unfilled_d && spc2_st3_unfilled)
 spc2_st1_lt_3 <= (spc2_st3_unf_cntr > spc2_st1_unf_cntr);
else
 spc2_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc2_st2_unfilled && spc2_st2_unfilled_d && spc2_st0_unfilled)
 spc2_st2_lt_0 <= (spc2_st0_unf_cntr > spc2_st2_unf_cntr);
else
 spc2_st2_lt_0 <= 1'b0;
if(~spc2_st2_unfilled && spc2_st2_unfilled_d && spc2_st1_unfilled)
 spc2_st2_lt_1 <= (spc2_st1_unf_cntr > spc2_st2_unf_cntr);
else
 spc2_st2_lt_1 <= 1'b0;
if(~spc2_st2_unfilled && spc2_st2_unfilled_d && spc2_st3_unfilled)
 spc2_st2_lt_3 <= (spc2_st3_unf_cntr > spc2_st2_unf_cntr);
else
 spc2_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc2_st3_unfilled && spc2_st3_unfilled_d && spc2_st0_unfilled)
 spc2_st3_lt_0 <= (spc2_st0_unf_cntr > spc2_st3_unf_cntr);
else
 spc2_st3_lt_0 <= 1'b0;
if(~spc2_st3_unfilled && spc2_st3_unfilled_d && spc2_st1_unfilled)
 spc2_st3_lt_1 <= (spc2_st1_unf_cntr > spc2_st3_unf_cntr);
else
 spc2_st3_lt_1 <= 1'b0;
if(~spc2_st3_unfilled && spc2_st3_unfilled_d && spc2_st2_unfilled)
 spc2_st3_lt_2 <= (spc2_st2_unf_cntr > spc2_st3_unf_cntr);
else
 spc2_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc2_ld_ooo_ret = { spc2_ld0_lt_1, spc2_ld0_lt_2, spc2_ld0_lt_3,
			      spc2_ld1_lt_0, spc2_ld1_lt_2, spc2_ld1_lt_3,
			      spc2_ld2_lt_0, spc2_ld2_lt_1, spc2_ld2_lt_3,
			      spc2_ld3_lt_0, spc2_ld3_lt_1, spc2_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc2_ld0_unfilled && spc2_ld0_unfilled_d)|| ~rst_l)
      begin
        spc2_ld0_unf_cntr <= 9'h000;
      end
    else if(spc2_ld0_unfilled)
      begin
        spc2_ld0_unf_cntr <= spc2_ld0_unf_cntr + 1;
      end
    else
      begin
        spc2_ld0_unf_cntr <= spc2_ld0_unf_cntr;
      end
    if((~spc2_ld1_unfilled && spc2_ld1_unfilled_d)|| ~rst_l)
      begin
        spc2_ld1_unf_cntr <= 9'h000;
      end
    else if(spc2_ld1_unfilled)
      begin
        spc2_ld1_unf_cntr <= spc2_ld1_unf_cntr + 1;
      end
    else
      begin
        spc2_ld1_unf_cntr <= spc2_ld1_unf_cntr;
      end
    if((~spc2_ld2_unfilled && spc2_ld2_unfilled_d)|| ~rst_l)
      begin
        spc2_ld2_unf_cntr <= 9'h000;
      end
    else if(spc2_ld2_unfilled)
      begin
        spc2_ld2_unf_cntr <= spc2_ld2_unf_cntr + 1;
      end
    else
      begin
        spc2_ld2_unf_cntr <= spc2_ld2_unf_cntr;
      end
    if((~spc2_ld3_unfilled && spc2_ld3_unfilled_d)|| ~rst_l)
      begin
        spc2_ld3_unf_cntr <= 9'h000;
      end
    else if(spc2_ld3_unfilled)
      begin
        spc2_ld3_unf_cntr <= spc2_ld3_unf_cntr + 1;
      end
    else
      begin
        spc2_ld3_unf_cntr <= spc2_ld3_unf_cntr;
      end
end

always @(spc2_ld0_unfilled or spc2_ld1_unfilled or spc2_ld2_unfilled or spc2_ld3_unfilled
	 or spc2_ld0_unfilled_d or spc2_ld1_unfilled_d or spc2_ld2_unfilled_d or spc2_ld3_unfilled_d)
begin
if(~spc2_ld0_unfilled && spc2_ld0_unfilled_d && spc2_ld1_unfilled)
 spc2_ld0_lt_1 <= (spc2_ld1_unf_cntr > spc2_ld0_unf_cntr);
else
 spc2_ld0_lt_1 <= 1'b0;
if(~spc2_ld0_unfilled && spc2_ld0_unfilled_d && spc2_ld2_unfilled)
 spc2_ld0_lt_2 <= (spc2_ld2_unf_cntr > spc2_ld0_unf_cntr);
else
 spc2_ld0_lt_2 <= 1'b0;
if(~spc2_ld0_unfilled && spc2_ld0_unfilled_d && spc2_ld3_unfilled)
 spc2_ld0_lt_3 <= (spc2_ld3_unf_cntr > spc2_ld0_unf_cntr);
else
 spc2_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc2_ld1_unfilled && spc2_ld1_unfilled_d && spc2_ld0_unfilled)
 spc2_ld1_lt_0 <= (spc2_ld0_unf_cntr > spc2_ld1_unf_cntr);
else
 spc2_ld1_lt_0 <= 1'b0;
if(~spc2_ld1_unfilled && spc2_ld1_unfilled_d && spc2_ld2_unfilled)
 spc2_ld1_lt_2 <= (spc2_ld2_unf_cntr > spc2_ld1_unf_cntr);
else
 spc2_ld1_lt_2 <= 1'b0;
if(~spc2_ld1_unfilled && spc2_ld1_unfilled_d && spc2_ld3_unfilled)
 spc2_ld1_lt_3 <= (spc2_ld3_unf_cntr > spc2_ld1_unf_cntr);
else
 spc2_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc2_ld2_unfilled && spc2_ld2_unfilled_d && spc2_ld0_unfilled)
 spc2_ld2_lt_0 <= (spc2_ld0_unf_cntr > spc2_ld2_unf_cntr);
else
 spc2_ld2_lt_0 <= 1'b0;
if(~spc2_ld2_unfilled && spc2_ld2_unfilled_d && spc2_ld1_unfilled)
 spc2_ld2_lt_1 <= (spc2_ld1_unf_cntr > spc2_ld2_unf_cntr);
else
 spc2_ld2_lt_1 <= 1'b0;
if(~spc2_ld2_unfilled && spc2_ld2_unfilled_d && spc2_ld3_unfilled)
 spc2_ld2_lt_3 <= (spc2_ld3_unf_cntr > spc2_ld2_unf_cntr);
else
 spc2_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc2_ld3_unfilled && spc2_ld3_unfilled_d && spc2_ld0_unfilled)
 spc2_ld3_lt_0 <= (spc2_ld0_unf_cntr > spc2_ld3_unf_cntr);
else
 spc2_ld3_lt_0 <= 1'b0;
if(~spc2_ld3_unfilled && spc2_ld3_unfilled_d && spc2_ld1_unfilled)
 spc2_ld3_lt_1 <= (spc2_ld1_unf_cntr > spc2_ld3_unf_cntr);
else
 spc2_ld3_lt_1 <= 1'b0;
if(~spc2_ld3_unfilled && spc2_ld3_unfilled_d && spc2_ld2_unfilled)
 spc2_ld3_lt_2 <= (spc2_ld2_unf_cntr > spc2_ld3_unf_cntr);
else
 spc2_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc2_dctl_bld_hit =
((|spc2_dctl_lsu_way_hit[3:0])  & spc2_dctl_dcache_enable_g &
  ~spc2_dctl_ldxa_internal & ~spc2_dctl_dcache_rd_parity_error & ~spc2_dctl_dtag_perror_g &
  ~spc2_dctl_endian_mispred_g &
  ~spc2_dctl_atomic_g & ~spc2_dctl_ncache_asild_rq_g) & ~spc2_dctl_tte_data_perror_unc &
  spc2_dctl_ld_inst_vld_g & spc2_qctl1_bld_g ;

assign spc2_dctl_bld_stb_hit = spc2_dctl_bld_hit & spc2_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc2_bld0_full_d <= 2'b00;
      spc2_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc2_bld0_full_d <= spc2_qctl1_bld_cnt;
      spc2_ld0_unfilled_d <= spc2_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc2_bld1_full_d <= 2'b00;
      spc2_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc2_bld1_full_d <= spc2_qctl1_bld_cnt;
      spc2_ld1_unfilled_d <= spc2_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc2_bld2_full_d <= 2'b00;
      spc2_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc2_bld2_full_d <= spc2_qctl1_bld_cnt;
      spc2_ld2_unfilled_d <= spc2_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc2_bld3_full_d <= 2'b00;
      spc2_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc2_bld3_full_d <= spc2_qctl1_bld_cnt;
      spc2_ld3_unfilled_d <= spc2_ld3_unfilled;
     end
end
always @(spc2_bld0_full_d or spc2_qctl1_bld_cnt)
begin
 if( (spc2_bld0_full_d != spc2_qctl1_bld_cnt) && (spc2_bld0_full_d == 2'd0))
    spc2_bld0_full_capture <= 1'b1;
 else
    spc2_bld0_full_capture <= 1'b0;
end
always @(spc2_bld1_full_d or spc2_qctl1_bld_cnt)
begin
 if( (spc2_bld1_full_d != spc2_qctl1_bld_cnt) && (spc2_bld1_full_d == 2'd1))
    spc2_bld1_full_capture <= 1'b1;
 else
    spc2_bld1_full_capture <= 1'b0;
end
always @(spc2_bld2_full_d or spc2_qctl1_bld_cnt)
begin
 if( (spc2_bld2_full_d != spc2_qctl1_bld_cnt) && (spc2_bld2_full_d == 2'd2))
    spc2_bld2_full_capture <= 1'b1;
 else
    spc2_bld2_full_capture <= 1'b0;
end
always @(spc2_bld3_full_d or spc2_qctl1_bld_cnt)
begin
 if( (spc2_bld3_full_d != spc2_qctl1_bld_cnt) && (spc2_bld3_full_d == 2'd3))
    spc2_bld3_full_capture <= 1'b1;
 else
    spc2_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc2_qctl1_bld_cnt != 2'b00) && (spc2_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc2_bld0_full_cntr <= 9'h000;
      end
    else if(spc2_qctl1_bld_g && (spc2_qctl1_bld_cnt == 2'b00))
      begin
        spc2_bld0_full_cntr <= spc2_bld0_full_cntr + 1;
      end
    else if( (spc2_qctl1_bld_cnt == 2'b00) && (spc2_bld0_full_cntr != 9'h000))
      begin
        spc2_bld0_full_cntr <= spc2_bld0_full_cntr + 1;
      end
    else
      begin
        spc2_bld0_full_cntr <= spc2_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc2_qctl1_bld_cnt != 2'b01) && (spc2_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc2_bld1_full_cntr <= 9'h000;
      end
    else if(spc2_qctl1_bld_cnt == 2'b01)
      begin
        spc2_bld1_full_cntr <= spc2_bld1_full_cntr + 1;
      end
    else if( (spc2_qctl1_bld_cnt == 2'b01) && (spc2_bld1_full_cntr != 9'h000))
      begin
        spc2_bld1_full_cntr <= spc2_bld1_full_cntr + 1;
      end
    else
      begin
        spc2_bld1_full_cntr <= spc2_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc2_qctl1_bld_cnt != 2'b10) && (spc2_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc2_bld2_full_cntr <= 9'h000;
      end
    else if(spc2_qctl1_bld_cnt == 2'b10)
      begin
        spc2_bld2_full_cntr <= spc2_bld2_full_cntr + 1;
      end
    else if( (spc2_qctl1_bld_cnt == 2'b10) && (spc2_bld2_full_cntr != 9'h000))
      begin
        spc2_bld2_full_cntr <= spc2_bld2_full_cntr + 1;
      end
    else
      begin
        spc2_bld2_full_cntr <= spc2_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc2_qctl1_bld_cnt != 2'b11) && (spc2_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc2_bld3_full_cntr <= 9'h000;
      end
    else if(spc2_qctl1_bld_cnt == 2'b11)
      begin
        spc2_bld3_full_cntr <= spc2_bld3_full_cntr + 1;
      end
    else if( (spc2_qctl1_bld_cnt == 2'b11) && (spc2_bld3_full_cntr != 9'h000))
      begin
        spc2_bld3_full_cntr <= spc2_bld3_full_cntr + 1;
      end
    else
      begin
        spc2_bld3_full_cntr <= spc2_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc2_stb_state_vld0) && ~spc2_atomic_g) || ~rst_l)
      begin
        spc2_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc2_atomic_g && (spc2_atm_type0 != 8'h00) && spc2_wptr_vld)
      begin
        spc2_stb_atm_addr0 <= {spc2_wdata_ramc[44:9],spc2_wdata_ramd[67:64]};
      end
    else
      begin
        spc2_stb_atm_addr0 <= spc2_stb_atm_addr0;
      end
    if( ( ~(|spc2_stb_state_vld1) && ~spc2_atomic_g) || ~rst_l)
      begin
        spc2_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc2_atomic_g && (spc2_atm_type1 != 8'h00) && spc2_wptr_vld)
      begin
        spc2_stb_atm_addr1 <= {spc2_wdata_ramc[44:9],spc2_wdata_ramd[67:64]};
      end
    else
      begin
        spc2_stb_atm_addr1 <= spc2_stb_atm_addr1;
      end
    if( ( ~(|spc2_stb_state_vld2) && ~spc2_atomic_g) || ~rst_l)
      begin
        spc2_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc2_atomic_g && (spc2_atm_type2 != 8'h00) && spc2_wptr_vld)
      begin
        spc2_stb_atm_addr2 <= {spc2_wdata_ramc[44:9],spc2_wdata_ramd[67:64]};
      end
    else
      begin
        spc2_stb_atm_addr2 <= spc2_stb_atm_addr2;
      end
    if( ( ~(|spc2_stb_state_vld3) && ~spc2_atomic_g) || ~rst_l)
      begin
        spc2_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc2_atomic_g && (spc2_atm_type3 != 8'h00) && spc2_wptr_vld)
      begin
        spc2_stb_atm_addr3 <= {spc2_wdata_ramc[44:9],spc2_wdata_ramd[67:64]};
      end
    else
      begin
        spc2_stb_atm_addr3 <= spc2_stb_atm_addr3;
      end
end

 assign spc2_dfq_full = (spc2_dfq_vld_entries >= 3'd4);


assign spc2_dfq_full1 = (spc2_dfq_vld_entries >= (3'd4 + 1));

always @(spc2_dfq_full_d1 or spc2_dfq_full1)
begin
  if (spc2_dfq_full_d1 && ~spc2_dfq_full1)
    spc2_dfq_full_capture1 <= 1'b1;
  else
    spc2_dfq_full_capture1 <= 1'b0;
end

assign spc2_dfq_full2 = (spc2_dfq_vld_entries >= (3'd4 + 2));

always @(spc2_dfq_full_d2 or spc2_dfq_full2)
begin
  if (spc2_dfq_full_d2 && ~spc2_dfq_full2)
    spc2_dfq_full_capture2 <= 1'b1;
  else
    spc2_dfq_full_capture2 <= 1'b0;
end

assign spc2_dfq_full3 = (spc2_dfq_vld_entries >= (3'd4 + 3));

always @(spc2_dfq_full_d3 or spc2_dfq_full3)
begin
  if (spc2_dfq_full_d3 && ~spc2_dfq_full3)
    spc2_dfq_full_capture3 <= 1'b1;
  else
    spc2_dfq_full_capture3 <= 1'b0;
end

assign spc2_dfq_full4 = (spc2_dfq_vld_entries >= (3'd4 + 4));

always @(spc2_dfq_full_d4 or spc2_dfq_full4)
begin
  if (spc2_dfq_full_d4 && ~spc2_dfq_full4)
    spc2_dfq_full_capture4 <= 1'b1;
  else
    spc2_dfq_full_capture4 <= 1'b0;
end

assign spc2_dfq_full5 = (spc2_dfq_vld_entries >= (3'd4 + 5));

always @(spc2_dfq_full_d5 or spc2_dfq_full5)
begin
  if (spc2_dfq_full_d5 && ~spc2_dfq_full5)
    spc2_dfq_full_capture5 <= 1'b1;
  else
    spc2_dfq_full_capture5 <= 1'b0;
end

assign spc2_dfq_full6 = (spc2_dfq_vld_entries >= (3'd4 + 6));

always @(spc2_dfq_full_d6 or spc2_dfq_full6)
begin
  if (spc2_dfq_full_d6 && ~spc2_dfq_full6)
    spc2_dfq_full_capture6 <= 1'b1;
  else
    spc2_dfq_full_capture6 <= 1'b0;
end

assign spc2_dfq_full7 = (spc2_dfq_vld_entries >= (3'd4 + 7));

always @(spc2_dfq_full_d7 or spc2_dfq_full7)
begin
  if (spc2_dfq_full_d7 && ~spc2_dfq_full7)
    spc2_dfq_full_capture7 <= 1'b1;
  else
    spc2_dfq_full_capture7 <= 1'b0;
end

always @(spc2_mbar_vld_d0 or spc2_mbar_vld0)
begin
  if (spc2_mbar_vld_d0 && ~spc2_mbar_vld0)
    spc2_mbar_vld_capture0 <= 1'b1;
  else
    spc2_mbar_vld_capture0 <= 1'b0;
end
always @(spc2_mbar_vld_d1 or spc2_mbar_vld1)
begin
  if (spc2_mbar_vld_d1 && ~spc2_mbar_vld1)
    spc2_mbar_vld_capture1 <= 1'b1;
  else
    spc2_mbar_vld_capture1 <= 1'b0;
end
always @(spc2_mbar_vld_d2 or spc2_mbar_vld2)
begin
  if (spc2_mbar_vld_d2 && ~spc2_mbar_vld2)
    spc2_mbar_vld_capture2 <= 1'b1;
  else
    spc2_mbar_vld_capture2 <= 1'b0;
end
always @(spc2_mbar_vld_d3 or spc2_mbar_vld3)
begin
  if (spc2_mbar_vld_d3 && ~spc2_mbar_vld3)
    spc2_mbar_vld_capture3 <= 1'b1;
  else
    spc2_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc2_dfq_full1 && (spc2_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr1 <= 9'h000;
       spc2_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr1);
      end
    else if( spc2_dfq_full1)
      begin
       spc2_dfq_full_cntr1 <= spc2_dfq_full_cntr1 + 1;
       spc2_dfq_full_d1 <= spc2_dfq_full1;
      end
    else
      begin
       spc2_dfq_full_cntr1 <= spc2_dfq_full_cntr1;
       spc2_dfq_full_d1 <= spc2_dfq_full1;
      end
    if( ( ~spc2_dfq_full2 && (spc2_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr2 <= 9'h000;
       spc2_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr2);
      end
    else if( spc2_dfq_full2)
      begin
       spc2_dfq_full_cntr2 <= spc2_dfq_full_cntr2 + 1;
       spc2_dfq_full_d2 <= spc2_dfq_full2;
      end
    else
      begin
       spc2_dfq_full_cntr2 <= spc2_dfq_full_cntr2;
       spc2_dfq_full_d2 <= spc2_dfq_full2;
      end
    if( ( ~spc2_dfq_full3 && (spc2_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr3 <= 9'h000;
       spc2_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr3);
      end
    else if( spc2_dfq_full3)
      begin
       spc2_dfq_full_cntr3 <= spc2_dfq_full_cntr3 + 1;
       spc2_dfq_full_d3 <= spc2_dfq_full3;
      end
    else
      begin
       spc2_dfq_full_cntr3 <= spc2_dfq_full_cntr3;
       spc2_dfq_full_d3 <= spc2_dfq_full3;
      end
    if( ( ~spc2_dfq_full4 && (spc2_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr4 <= 9'h000;
       spc2_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr4);
      end
    else if( spc2_dfq_full4)
      begin
       spc2_dfq_full_cntr4 <= spc2_dfq_full_cntr4 + 1;
       spc2_dfq_full_d4 <= spc2_dfq_full4;
      end
    else
      begin
       spc2_dfq_full_cntr4 <= spc2_dfq_full_cntr4;
       spc2_dfq_full_d4 <= spc2_dfq_full4;
      end
    if( ( ~spc2_dfq_full5 && (spc2_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr5 <= 9'h000;
       spc2_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr5);
      end
    else if( spc2_dfq_full5)
      begin
       spc2_dfq_full_cntr5 <= spc2_dfq_full_cntr5 + 1;
       spc2_dfq_full_d5 <= spc2_dfq_full5;
      end
    else
      begin
       spc2_dfq_full_cntr5 <= spc2_dfq_full_cntr5;
       spc2_dfq_full_d5 <= spc2_dfq_full5;
      end
    if( ( ~spc2_dfq_full6 && (spc2_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr6 <= 9'h000;
       spc2_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr6);
      end
    else if( spc2_dfq_full6)
      begin
       spc2_dfq_full_cntr6 <= spc2_dfq_full_cntr6 + 1;
       spc2_dfq_full_d6 <= spc2_dfq_full6;
      end
    else
      begin
       spc2_dfq_full_cntr6 <= spc2_dfq_full_cntr6;
       spc2_dfq_full_d6 <= spc2_dfq_full6;
      end
    if( ( ~spc2_dfq_full7 && (spc2_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr7 <= 9'h000;
       spc2_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr7);
      end
    else if( spc2_dfq_full7)
      begin
       spc2_dfq_full_cntr7 <= spc2_dfq_full_cntr7 + 1;
       spc2_dfq_full_d7 <= spc2_dfq_full7;
      end
    else
      begin
       spc2_dfq_full_cntr7 <= spc2_dfq_full_cntr7;
       spc2_dfq_full_d7 <= spc2_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc2_intrpt0_cmplt or spc2_atm_cntr0 or spc2_stb_state_ced0)
begin
  if (spc2_intrpt0_cmplt && (spc2_atm_cntr0 != 9'h000) && ~(|spc2_stb_state_ced0))
    spc2_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc2_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc2_intrpt1_cmplt or spc2_atm_cntr1 or spc2_stb_state_ced1)
begin
  if (spc2_intrpt1_cmplt && (spc2_atm_cntr1 != 9'h000) && ~(|spc2_stb_state_ced1))
    spc2_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc2_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc2_intrpt2_cmplt or spc2_atm_cntr2 or spc2_stb_state_ced2)
begin
  if (spc2_intrpt2_cmplt && (spc2_atm_cntr2 != 9'h000) && ~(|spc2_stb_state_ced2))
    spc2_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc2_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc2_intrpt3_cmplt or spc2_atm_cntr3 or spc2_stb_state_ced3)
begin
  if (spc2_intrpt3_cmplt && (spc2_atm_cntr3 != 9'h000) && ~(|spc2_stb_state_ced3))
    spc2_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc2_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc2_intrpt0_cmplt or spc2_atm_cntr0 or spc2_stb_state_ced0)
begin
  if (spc2_intrpt0_cmplt && (spc2_atm_cntr0 != 9'h000) && (|spc2_stb_state_ced0))
    spc2_atm_intrpt_capture0 <= 1'b1;
  else
    spc2_atm_intrpt_capture0 <= 1'b0;
end
always @(spc2_intrpt1_cmplt or spc2_atm_cntr1 or spc2_stb_state_ced1)
begin
  if (spc2_intrpt1_cmplt && (spc2_atm_cntr1 != 9'h000) && (|spc2_stb_state_ced1))
    spc2_atm_intrpt_capture1 <= 1'b1;
  else
    spc2_atm_intrpt_capture1 <= 1'b0;
end
always @(spc2_intrpt2_cmplt or spc2_atm_cntr2 or spc2_stb_state_ced2)
begin
  if (spc2_intrpt2_cmplt && (spc2_atm_cntr2 != 9'h000) && (|spc2_stb_state_ced2))
    spc2_atm_intrpt_capture2 <= 1'b1;
  else
    spc2_atm_intrpt_capture2 <= 1'b0;
end
always @(spc2_intrpt3_cmplt or spc2_atm_cntr3 or spc2_stb_state_ced3)
begin
  if (spc2_intrpt3_cmplt && (spc2_atm_cntr3 != 9'h000) && (|spc2_stb_state_ced3))
    spc2_atm_intrpt_capture3 <= 1'b1;
  else
    spc2_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc2_atm_cntr0 or spc2_dva_din or spc2_dva_wen)
begin
  if (~spc2_dva_din && spc2_dva_wen && (spc2_atm_cntr0 != 9'h000))
    spc2_atm_inv_capture0 <= 1'b1;
  else
    spc2_atm_inv_capture0 <= 1'b0;
end
always @(spc2_atm_cntr1 or spc2_dva_din or spc2_dva_wen)
begin
  if (~spc2_dva_din && spc2_dva_wen && (spc2_atm_cntr1 != 9'h000))
    spc2_atm_inv_capture1 <= 1'b1;
  else
    spc2_atm_inv_capture1 <= 1'b0;
end
always @(spc2_atm_cntr2 or spc2_dva_din or spc2_dva_wen)
begin
  if (~spc2_dva_din && spc2_dva_wen && (spc2_atm_cntr2 != 9'h000))
    spc2_atm_inv_capture2 <= 1'b1;
  else
    spc2_atm_inv_capture2 <= 1'b0;
end
always @(spc2_atm_cntr3 or spc2_dva_din or spc2_dva_wen)
begin
  if (~spc2_dva_din && spc2_dva_wen && (spc2_atm_cntr3 != 9'h000))
    spc2_atm_inv_capture3 <= 1'b1;
  else
    spc2_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc2_stb_state_vld0) && (spc2_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_atm_cntr0 <= 9'h000;
       spc2_atm0_d <= 1'b0;
      end
    else if( spc2_atomic_g && (spc2_atm_type0 != 8'h00))
      begin
       spc2_atm_cntr0 <= spc2_atm_cntr0 + 1;
       spc2_atm0_d <= 1'b1;
      end
    else if( spc2_atm0_d && (|spc2_stb_state_vld0))
      begin
       spc2_atm_cntr0 <= spc2_atm_cntr0 + 1;
       spc2_atm0_d <= spc2_atm0_d;
      end
    else
      begin
       spc2_atm_cntr0 <= spc2_atm_cntr0;
       spc2_atm0_d <= spc2_atm0_d;
      end
    if( ( ~(|spc2_stb_state_vld1) && (spc2_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_atm_cntr1 <= 9'h000;
       spc2_atm1_d <= 1'b0;
      end
    else if( spc2_atomic_g && (spc2_atm_type1 != 8'h00))
      begin
       spc2_atm_cntr1 <= spc2_atm_cntr1 + 1;
       spc2_atm1_d <= 1'b1;
      end
    else if( spc2_atm1_d && (|spc2_stb_state_vld1))
      begin
       spc2_atm_cntr1 <= spc2_atm_cntr1 + 1;
       spc2_atm1_d <= spc2_atm1_d;
      end
    else
      begin
       spc2_atm_cntr1 <= spc2_atm_cntr1;
       spc2_atm1_d <= spc2_atm1_d;
      end
    if( ( ~(|spc2_stb_state_vld2) && (spc2_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_atm_cntr2 <= 9'h000;
       spc2_atm2_d <= 1'b0;
      end
    else if( spc2_atomic_g && (spc2_atm_type2 != 8'h00))
      begin
       spc2_atm_cntr2 <= spc2_atm_cntr2 + 1;
       spc2_atm2_d <= 1'b1;
      end
    else if( spc2_atm2_d && (|spc2_stb_state_vld2))
      begin
       spc2_atm_cntr2 <= spc2_atm_cntr2 + 1;
       spc2_atm2_d <= spc2_atm2_d;
      end
    else
      begin
       spc2_atm_cntr2 <= spc2_atm_cntr2;
       spc2_atm2_d <= spc2_atm2_d;
      end
    if( ( ~(|spc2_stb_state_vld3) && (spc2_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_atm_cntr3 <= 9'h000;
       spc2_atm3_d <= 1'b0;
      end
    else if( spc2_atomic_g && (spc2_atm_type3 != 8'h00))
      begin
       spc2_atm_cntr3 <= spc2_atm_cntr3 + 1;
       spc2_atm3_d <= 1'b1;
      end
    else if( spc2_atm3_d && (|spc2_stb_state_vld3))
      begin
       spc2_atm_cntr3 <= spc2_atm_cntr3 + 1;
       spc2_atm3_d <= spc2_atm3_d;
      end
    else
      begin
       spc2_atm_cntr3 <= spc2_atm_cntr3;
       spc2_atm3_d <= spc2_atm3_d;
      end
end

 assign spc2_raw_ack_capture0 = spc2_stb_ack_vld0 && (spc2_stb_ack_cntr0 != 9'h000);
 assign spc2_stb_ced0 = |spc2_stb_state_ced0;
 assign spc2_raw_ack_capture1 = spc2_stb_ack_vld1 && (spc2_stb_ack_cntr1 != 9'h000);
 assign spc2_stb_ced1 = |spc2_stb_state_ced1;
 assign spc2_raw_ack_capture2 = spc2_stb_ack_vld2 && (spc2_stb_ack_cntr2 != 9'h000);
 assign spc2_stb_ced2 = |spc2_stb_state_ced2;
 assign spc2_raw_ack_capture3 = spc2_stb_ack_vld3 && (spc2_stb_ack_cntr3 != 9'h000);
 assign spc2_stb_ced3 = |spc2_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc2_stb_ced0 && (spc2_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ced_cntr0 <= 9'h000;
       spc2_stb_ced0_d <= 1'b0;
      end
    else if( spc2_stb_ced0 && (spc2_stb_state_ack0 == 8'h00))
      begin
       spc2_stb_ced_cntr0 <= spc2_stb_ced_cntr0 + 1;
       spc2_stb_ced0_d <= spc2_stb_ced0;
      end
    else
      begin
       spc2_stb_ced_cntr0 <= spc2_stb_ced_cntr0;
       spc2_stb_ced0_d <= spc2_stb_ced0_d;
      end

    if( ( ~spc2_mbar_vld0 && (spc2_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_mbar_vld_cntr0 <= 9'h000;
       spc2_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_mbar_vld_counter = %d", spc2_mbar_vld_cntr0);
      end
    else if( spc2_mbar_vld0)
      begin
       spc2_mbar_vld_cntr0 <= spc2_mbar_vld_cntr0 + 1;
       spc2_mbar_vld_d0 <= spc2_mbar_vld0;
      end
    else
      begin
       spc2_mbar_vld_cntr0 <= spc2_mbar_vld_cntr0;
       spc2_mbar_vld_d0 <= spc2_mbar_vld0;
      end

    if( ( ~spc2_flsh_vld0 && (spc2_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_flsh_vld_cntr0 <= 9'h000;
       spc2_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_flsh_vld_counter = %d", spc2_flsh_vld_cntr0);
      end
    else if( spc2_flsh_vld0)
      begin
       spc2_flsh_vld_cntr0 <= spc2_flsh_vld_cntr0 + 1;
       spc2_flsh_vld_d0 <= spc2_flsh_vld0;
      end
    else
      begin
       spc2_flsh_vld_cntr0 <= spc2_flsh_vld_cntr0;
       spc2_flsh_vld_d0 <= spc2_flsh_vld0;
      end

    if( ( ~spc2_stb_ced1 && (spc2_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ced_cntr1 <= 9'h000;
       spc2_stb_ced1_d <= 1'b0;
      end
    else if( spc2_stb_ced1 && (spc2_stb_state_ack1 == 8'h00))
      begin
       spc2_stb_ced_cntr1 <= spc2_stb_ced_cntr1 + 1;
       spc2_stb_ced1_d <= spc2_stb_ced1;
      end
    else
      begin
       spc2_stb_ced_cntr1 <= spc2_stb_ced_cntr1;
       spc2_stb_ced1_d <= spc2_stb_ced1_d;
      end

    if( ( ~spc2_mbar_vld1 && (spc2_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_mbar_vld_cntr1 <= 9'h000;
       spc2_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_mbar_vld_counter = %d", spc2_mbar_vld_cntr1);
      end
    else if( spc2_mbar_vld1)
      begin
       spc2_mbar_vld_cntr1 <= spc2_mbar_vld_cntr1 + 1;
       spc2_mbar_vld_d1 <= spc2_mbar_vld1;
      end
    else
      begin
       spc2_mbar_vld_cntr1 <= spc2_mbar_vld_cntr1;
       spc2_mbar_vld_d1 <= spc2_mbar_vld1;
      end

    if( ( ~spc2_flsh_vld1 && (spc2_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_flsh_vld_cntr1 <= 9'h000;
       spc2_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_flsh_vld_counter = %d", spc2_flsh_vld_cntr1);
      end
    else if( spc2_flsh_vld1)
      begin
       spc2_flsh_vld_cntr1 <= spc2_flsh_vld_cntr1 + 1;
       spc2_flsh_vld_d1 <= spc2_flsh_vld1;
      end
    else
      begin
       spc2_flsh_vld_cntr1 <= spc2_flsh_vld_cntr1;
       spc2_flsh_vld_d1 <= spc2_flsh_vld1;
      end

    if( ( ~spc2_stb_ced2 && (spc2_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ced_cntr2 <= 9'h000;
       spc2_stb_ced2_d <= 1'b0;
      end
    else if( spc2_stb_ced2 && (spc2_stb_state_ack2 == 8'h00))
      begin
       spc2_stb_ced_cntr2 <= spc2_stb_ced_cntr2 + 1;
       spc2_stb_ced2_d <= spc2_stb_ced2;
      end
    else
      begin
       spc2_stb_ced_cntr2 <= spc2_stb_ced_cntr2;
       spc2_stb_ced2_d <= spc2_stb_ced2_d;
      end

    if( ( ~spc2_mbar_vld2 && (spc2_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_mbar_vld_cntr2 <= 9'h000;
       spc2_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_mbar_vld_counter = %d", spc2_mbar_vld_cntr2);
      end
    else if( spc2_mbar_vld2)
      begin
       spc2_mbar_vld_cntr2 <= spc2_mbar_vld_cntr2 + 1;
       spc2_mbar_vld_d2 <= spc2_mbar_vld2;
      end
    else
      begin
       spc2_mbar_vld_cntr2 <= spc2_mbar_vld_cntr2;
       spc2_mbar_vld_d2 <= spc2_mbar_vld2;
      end

    if( ( ~spc2_flsh_vld2 && (spc2_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_flsh_vld_cntr2 <= 9'h000;
       spc2_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_flsh_vld_counter = %d", spc2_flsh_vld_cntr2);
      end
    else if( spc2_flsh_vld2)
      begin
       spc2_flsh_vld_cntr2 <= spc2_flsh_vld_cntr2 + 1;
       spc2_flsh_vld_d2 <= spc2_flsh_vld2;
      end
    else
      begin
       spc2_flsh_vld_cntr2 <= spc2_flsh_vld_cntr2;
       spc2_flsh_vld_d2 <= spc2_flsh_vld2;
      end

    if( ( ~spc2_stb_ced3 && (spc2_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ced_cntr3 <= 9'h000;
       spc2_stb_ced3_d <= 1'b0;
      end
    else if( spc2_stb_ced3 && (spc2_stb_state_ack3 == 8'h00))
      begin
       spc2_stb_ced_cntr3 <= spc2_stb_ced_cntr3 + 1;
       spc2_stb_ced3_d <= spc2_stb_ced3;
      end
    else
      begin
       spc2_stb_ced_cntr3 <= spc2_stb_ced_cntr3;
       spc2_stb_ced3_d <= spc2_stb_ced3_d;
      end

    if( ( ~spc2_mbar_vld3 && (spc2_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_mbar_vld_cntr3 <= 9'h000;
       spc2_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_mbar_vld_counter = %d", spc2_mbar_vld_cntr3);
      end
    else if( spc2_mbar_vld3)
      begin
       spc2_mbar_vld_cntr3 <= spc2_mbar_vld_cntr3 + 1;
       spc2_mbar_vld_d3 <= spc2_mbar_vld3;
      end
    else
      begin
       spc2_mbar_vld_cntr3 <= spc2_mbar_vld_cntr3;
       spc2_mbar_vld_d3 <= spc2_mbar_vld3;
      end

    if( ( ~spc2_flsh_vld3 && (spc2_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_flsh_vld_cntr3 <= 9'h000;
       spc2_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_flsh_vld_counter = %d", spc2_flsh_vld_cntr3);
      end
    else if( spc2_flsh_vld3)
      begin
       spc2_flsh_vld_cntr3 <= spc2_flsh_vld_cntr3 + 1;
       spc2_flsh_vld_d3 <= spc2_flsh_vld3;
      end
    else
      begin
       spc2_flsh_vld_cntr3 <= spc2_flsh_vld_cntr3;
       spc2_flsh_vld_d3 <= spc2_flsh_vld3;
      end

end

always @(spc2_flsh_vld_d0 or spc2_flsh_vld0)
begin
  if (spc2_flsh_vld_d0 && ~spc2_flsh_vld0)
    spc2_flsh_vld_capture0 <= 1'b1;
  else
    spc2_flsh_vld_capture0 <= 1'b0;
end
always @(spc2_flsh_vld_d1 or spc2_flsh_vld1)
begin
  if (spc2_flsh_vld_d1 && ~spc2_flsh_vld1)
    spc2_flsh_vld_capture1 <= 1'b1;
  else
    spc2_flsh_vld_capture1 <= 1'b0;
end
always @(spc2_flsh_vld_d2 or spc2_flsh_vld2)
begin
  if (spc2_flsh_vld_d2 && ~spc2_flsh_vld2)
    spc2_flsh_vld_capture2 <= 1'b1;
  else
    spc2_flsh_vld_capture2 <= 1'b0;
end
always @(spc2_flsh_vld_d3 or spc2_flsh_vld3)
begin
  if (spc2_flsh_vld_d3 && ~spc2_flsh_vld3)
    spc2_flsh_vld_capture3 <= 1'b1;
  else
    spc2_flsh_vld_capture3 <= 1'b0;
end

always @(spc2_lmiss_pa0 or spc2_imiss_pa or spc2_imiss_vld_d or spc2_lmiss_vld0)
begin
if((spc2_lmiss_pa0 == spc2_imiss_pa) && spc2_imiss_vld_d && spc2_lmiss_vld0)
 spc2_lmiss_eq0 = 1'b1;
else
 spc2_lmiss_eq0 = 1'b0;
end
always @(spc2_lmiss_pa1 or spc2_imiss_pa or spc2_imiss_vld_d or spc2_lmiss_vld1)
begin
if((spc2_lmiss_pa1 == spc2_imiss_pa) && spc2_imiss_vld_d && spc2_lmiss_vld1)
 spc2_lmiss_eq1 = 1'b1;
else
 spc2_lmiss_eq1 = 1'b0;
end
always @(spc2_lmiss_pa2 or spc2_imiss_pa or spc2_imiss_vld_d or spc2_lmiss_vld2)
begin
if((spc2_lmiss_pa2 == spc2_imiss_pa) && spc2_imiss_vld_d && spc2_lmiss_vld2)
 spc2_lmiss_eq2 = 1'b1;
else
 spc2_lmiss_eq2 = 1'b0;
end
always @(spc2_lmiss_pa3 or spc2_imiss_pa or spc2_imiss_vld_d or spc2_lmiss_vld3)
begin
if((spc2_lmiss_pa3 == spc2_imiss_pa) && spc2_imiss_vld_d && spc2_lmiss_vld3)
 spc2_lmiss_eq3 = 1'b1;
else
 spc2_lmiss_eq3 = 1'b0;
end

always @(spc2_lmiss_pa0 or spc2_stb_atm_addr0 or spc2_atm_cntr0 or spc2_lmiss_vld0)
begin
if ( ((spc2_lmiss_pa0 == spc2_stb_atm_addr0) && (spc2_atm_cntr0 != 9'h000) && spc2_lmiss_vld0) ||
     ((spc2_lmiss_pa1 == spc2_stb_atm_addr0) && (spc2_atm_cntr0 != 9'h000) && spc2_lmiss_vld1) ||
     ((spc2_lmiss_pa2 == spc2_stb_atm_addr0) && (spc2_atm_cntr0 != 9'h000) && spc2_lmiss_vld2) ||
     ((spc2_lmiss_pa3 == spc2_stb_atm_addr0) && (spc2_atm_cntr0 != 9'h000) && spc2_lmiss_vld3) )

 spc2_atm_lmiss_eq0 = 1'b1;
else
 spc2_atm_lmiss_eq0 = 1'b0;
end
always @(spc2_lmiss_pa1 or spc2_stb_atm_addr1 or spc2_atm_cntr1 or spc2_lmiss_vld1)
begin
if ( ((spc2_lmiss_pa0 == spc2_stb_atm_addr1) && (spc2_atm_cntr1 != 9'h000) && spc2_lmiss_vld0) ||
     ((spc2_lmiss_pa1 == spc2_stb_atm_addr1) && (spc2_atm_cntr1 != 9'h000) && spc2_lmiss_vld1) ||
     ((spc2_lmiss_pa2 == spc2_stb_atm_addr1) && (spc2_atm_cntr1 != 9'h000) && spc2_lmiss_vld2) ||
     ((spc2_lmiss_pa3 == spc2_stb_atm_addr1) && (spc2_atm_cntr1 != 9'h000) && spc2_lmiss_vld3) )

 spc2_atm_lmiss_eq1 = 1'b1;
else
 spc2_atm_lmiss_eq1 = 1'b0;
end
always @(spc2_lmiss_pa2 or spc2_stb_atm_addr2 or spc2_atm_cntr2 or spc2_lmiss_vld2)
begin
if ( ((spc2_lmiss_pa0 == spc2_stb_atm_addr2) && (spc2_atm_cntr2 != 9'h000) && spc2_lmiss_vld0) ||
     ((spc2_lmiss_pa1 == spc2_stb_atm_addr2) && (spc2_atm_cntr2 != 9'h000) && spc2_lmiss_vld1) ||
     ((spc2_lmiss_pa2 == spc2_stb_atm_addr2) && (spc2_atm_cntr2 != 9'h000) && spc2_lmiss_vld2) ||
     ((spc2_lmiss_pa3 == spc2_stb_atm_addr2) && (spc2_atm_cntr2 != 9'h000) && spc2_lmiss_vld3) )

 spc2_atm_lmiss_eq2 = 1'b1;
else
 spc2_atm_lmiss_eq2 = 1'b0;
end
always @(spc2_lmiss_pa3 or spc2_stb_atm_addr3 or spc2_atm_cntr3 or spc2_lmiss_vld3)
begin
if ( ((spc2_lmiss_pa0 == spc2_stb_atm_addr3) && (spc2_atm_cntr3 != 9'h000) && spc2_lmiss_vld0) ||
     ((spc2_lmiss_pa1 == spc2_stb_atm_addr3) && (spc2_atm_cntr3 != 9'h000) && spc2_lmiss_vld1) ||
     ((spc2_lmiss_pa2 == spc2_stb_atm_addr3) && (spc2_atm_cntr3 != 9'h000) && spc2_lmiss_vld2) ||
     ((spc2_lmiss_pa3 == spc2_stb_atm_addr3) && (spc2_atm_cntr3 != 9'h000) && spc2_lmiss_vld3) )

 spc2_atm_lmiss_eq3 = 1'b1;
else
 spc2_atm_lmiss_eq3 = 1'b0;
end

always @(spc2_imiss_pa or spc2_stb_atm_addr0 or spc2_atm_cntr0 or spc2_imiss_vld_d)
begin
if((spc2_imiss_pa == spc2_stb_atm_addr0) && (spc2_atm_cntr0 != 9'h000) && spc2_imiss_vld_d)
 spc2_atm_imiss_eq0 = 1'b1;
else
 spc2_atm_imiss_eq0 = 1'b0;
end
always @(spc2_imiss_pa or spc2_stb_atm_addr1 or spc2_atm_cntr1 or spc2_imiss_vld_d)
begin
if((spc2_imiss_pa == spc2_stb_atm_addr1) && (spc2_atm_cntr1 != 9'h000) && spc2_imiss_vld_d)
 spc2_atm_imiss_eq1 = 1'b1;
else
 spc2_atm_imiss_eq1 = 1'b0;
end
always @(spc2_imiss_pa or spc2_stb_atm_addr2 or spc2_atm_cntr2 or spc2_imiss_vld_d)
begin
if((spc2_imiss_pa == spc2_stb_atm_addr2) && (spc2_atm_cntr2 != 9'h000) && spc2_imiss_vld_d)
 spc2_atm_imiss_eq2 = 1'b1;
else
 spc2_atm_imiss_eq2 = 1'b0;
end
always @(spc2_imiss_pa or spc2_stb_atm_addr3 or spc2_atm_cntr3 or spc2_imiss_vld_d)
begin
if((spc2_imiss_pa == spc2_stb_atm_addr3) && (spc2_atm_cntr3 != 9'h000) && spc2_imiss_vld_d)
 spc2_atm_imiss_eq3 = 1'b1;
else
 spc2_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc2_imiss_vld || ~rst_l)
   spc2_imiss_vld_d <= 1'b0;
 else
   spc2_imiss_vld_d <= spc2_imiss_vld;

 if( ~spc2_ld_miss || ~rst_l)
   spc2_ld_miss_capture <= 1'b0;
 else
   spc2_ld_miss_capture <= spc2_ld_miss;

end

always @(spc2_stb_ced0 or spc2_stb_ced0_d)
begin
if (~spc2_stb_ced0 && spc2_stb_ced0_d)
spc2_stb_ced_capture0 <= 1'b1;
else
spc2_stb_ced_capture0 <= 1'b0;

end
always @(spc2_stb_ced1 or spc2_stb_ced1_d)
begin
if (~spc2_stb_ced1 && spc2_stb_ced1_d)
spc2_stb_ced_capture1 <= 1'b1;
else
spc2_stb_ced_capture1 <= 1'b0;

end
always @(spc2_stb_ced2 or spc2_stb_ced2_d)
begin
if (~spc2_stb_ced2 && spc2_stb_ced2_d)
spc2_stb_ced_capture2 <= 1'b1;
else
spc2_stb_ced_capture2 <= 1'b0;

end
always @(spc2_stb_ced3 or spc2_stb_ced3_d)
begin
if (~spc2_stb_ced3 && spc2_stb_ced3_d)
spc2_stb_ced_capture3 <= 1'b1;
else
spc2_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc2_stb_state_ack0 != 8'h00 && (spc2_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_ack_counter0 = %d", spc2_stb_ack_cntr0);
      end
    else if(spc2_stb_cam_hit && spc2_ld0_inst_vld_g && (spc2_stb_state_ack0 == 8'h00))
      begin
       spc2_stb_ack_cntr0 <= spc2_stb_ack_cntr0 + 1;
      end
    else if( (spc2_stb_state_ack0 == 8'h00 ) && (spc2_stb_ack_cntr0 != 9'h000))
      begin
       spc2_stb_ack_cntr0 <= spc2_stb_ack_cntr0 + 1;
      end // if ( (spc2_stb_state_ack0 == 8'h00 ) && (spc2_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc2_stb_ack_cntr0 <= spc2_stb_ack_cntr0;
      end

    if( (spc2_stb_state_ack1 != 8'h00 && (spc2_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_ack_counter1 = %d", spc2_stb_ack_cntr1);
      end
    else if(spc2_stb_cam_hit && spc2_ld1_inst_vld_g && (spc2_stb_state_ack1 == 8'h00))
      begin
       spc2_stb_ack_cntr1 <= spc2_stb_ack_cntr1 + 1;
      end
    else if( (spc2_stb_state_ack1 == 8'h00 ) && (spc2_stb_ack_cntr1 != 9'h000))
      begin
       spc2_stb_ack_cntr1 <= spc2_stb_ack_cntr1 + 1;
      end // if ( (spc2_stb_state_ack1 == 8'h00 ) && (spc2_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc2_stb_ack_cntr1 <= spc2_stb_ack_cntr1;
      end

    if( (spc2_stb_state_ack2 != 8'h00 && (spc2_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_ack_counter2 = %d", spc2_stb_ack_cntr2);
      end
    else if(spc2_stb_cam_hit && spc2_ld2_inst_vld_g && (spc2_stb_state_ack2 == 8'h00))
      begin
       spc2_stb_ack_cntr2 <= spc2_stb_ack_cntr2 + 1;
      end
    else if( (spc2_stb_state_ack2 == 8'h00 ) && (spc2_stb_ack_cntr2 != 9'h000))
      begin
       spc2_stb_ack_cntr2 <= spc2_stb_ack_cntr2 + 1;
      end // if ( (spc2_stb_state_ack2 == 8'h00 ) && (spc2_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc2_stb_ack_cntr2 <= spc2_stb_ack_cntr2;
      end

    if( (spc2_stb_state_ack3 != 8'h00 && (spc2_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_ack_counter3 = %d", spc2_stb_ack_cntr3);
      end
    else if(spc2_stb_cam_hit && spc2_ld3_inst_vld_g && (spc2_stb_state_ack3 == 8'h00))
      begin
       spc2_stb_ack_cntr3 <= spc2_stb_ack_cntr3 + 1;
      end
    else if( (spc2_stb_state_ack3 == 8'h00 ) && (spc2_stb_ack_cntr3 != 9'h000))
      begin
       spc2_stb_ack_cntr3 <= spc2_stb_ack_cntr3 + 1;
      end // if ( (spc2_stb_state_ack3 == 8'h00 ) && (spc2_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc2_stb_ack_cntr3 <= spc2_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc2_stb0_full_w2 or spc2_stb0_full)
begin
if (~spc2_stb0_full_w2 && spc2_stb0_full)
spc2_stb_full_capture0 <= 1'b1;
else
spc2_stb_full_capture0 <= 1'b0;

end
always @(spc2_stb1_full_w2 or spc2_stb1_full)
begin
if (~spc2_stb1_full_w2 && spc2_stb1_full)
spc2_stb_full_capture1 <= 1'b1;
else
spc2_stb_full_capture1 <= 1'b0;

end
always @(spc2_stb2_full_w2 or spc2_stb2_full)
begin
if (~spc2_stb2_full_w2 && spc2_stb2_full)
spc2_stb_full_capture2 <= 1'b1;
else
spc2_stb_full_capture2 <= 1'b0;

end
always @(spc2_stb3_full_w2 or spc2_stb3_full)
begin
if (~spc2_stb3_full_w2 && spc2_stb3_full)
spc2_stb_full_capture3 <= 1'b1;
else
spc2_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc2_stb0_full && (spc2_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_full_counter0 = %d", spc2_stb_full_cntr0);
      end
    else if( spc2_stb0_full)
      begin
       spc2_stb_full_cntr0 <= spc2_stb_full_cntr0 + 1;
      end
    else
      begin
       spc2_stb_full_cntr0 <= spc2_stb_full_cntr0;
      end
    if( ( ~spc2_stb1_full && (spc2_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_full_counter1 = %d", spc2_stb_full_cntr1);
      end
    else if( spc2_stb1_full)
      begin
       spc2_stb_full_cntr1 <= spc2_stb_full_cntr1 + 1;
      end
    else
      begin
       spc2_stb_full_cntr1 <= spc2_stb_full_cntr1;
      end
    if( ( ~spc2_stb2_full && (spc2_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_full_counter2 = %d", spc2_stb_full_cntr2);
      end
    else if( spc2_stb2_full)
      begin
       spc2_stb_full_cntr2 <= spc2_stb_full_cntr2 + 1;
      end
    else
      begin
       spc2_stb_full_cntr2 <= spc2_stb_full_cntr2;
      end
    if( ( ~spc2_stb3_full && (spc2_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc2_stb_full_counter3 = %d", spc2_stb_full_cntr3);
      end
    else if( spc2_stb3_full)
      begin
       spc2_stb_full_cntr3 <= spc2_stb_full_cntr3 + 1;
      end
    else
      begin
       spc2_stb_full_cntr3 <= spc2_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc2_lmq0_full_d or spc2_lmq0_full)
begin
if (spc2_lmq0_full_d && ~spc2_lmq0_full)
spc2_lmq_full_capture0 <= 1'b1;
else
spc2_lmq_full_capture0 <= 1'b0;

end
always @(spc2_lmq1_full_d or spc2_lmq1_full)
begin
if (spc2_lmq1_full_d && ~spc2_lmq1_full)
spc2_lmq_full_capture1 <= 1'b1;
else
spc2_lmq_full_capture1 <= 1'b0;

end
always @(spc2_lmq2_full_d or spc2_lmq2_full)
begin
if (spc2_lmq2_full_d && ~spc2_lmq2_full)
spc2_lmq_full_capture2 <= 1'b1;
else
spc2_lmq_full_capture2 <= 1'b0;

end
always @(spc2_lmq3_full_d or spc2_lmq3_full)
begin
if (spc2_lmq3_full_d && ~spc2_lmq3_full)
spc2_lmq_full_capture3 <= 1'b1;
else
spc2_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc2_lmq0_full && (spc2_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc2_lmq_full_cntr0 <= 9'h000;
       spc2_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_lmq_full_counter0 = %d", spc2_lmq_full_cntr0);
      end
    else if( spc2_lmq0_full)
      begin
       spc2_lmq_full_cntr0 <= spc2_lmq_full_cntr0 + 1;
       spc2_lmq0_full_d <= spc2_lmq0_full;
      end
    else
      begin
       spc2_lmq_full_cntr0 <= spc2_lmq_full_cntr0;
       spc2_lmq0_full_d <= spc2_lmq0_full;
      end

    if( ( ~spc2_lmq1_full && (spc2_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc2_lmq_full_cntr1 <= 9'h000;
       spc2_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_lmq_full_counter1 = %d", spc2_lmq_full_cntr1);
      end
    else if( spc2_lmq1_full)
      begin
       spc2_lmq_full_cntr1 <= spc2_lmq_full_cntr1 + 1;
       spc2_lmq1_full_d <= spc2_lmq1_full;
      end
    else
      begin
       spc2_lmq_full_cntr1 <= spc2_lmq_full_cntr1;
       spc2_lmq1_full_d <= spc2_lmq1_full;
      end

    if( ( ~spc2_lmq2_full && (spc2_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc2_lmq_full_cntr2 <= 9'h000;
       spc2_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_lmq_full_counter2 = %d", spc2_lmq_full_cntr2);
      end
    else if( spc2_lmq2_full)
      begin
       spc2_lmq_full_cntr2 <= spc2_lmq_full_cntr2 + 1;
       spc2_lmq2_full_d <= spc2_lmq2_full;
      end
    else
      begin
       spc2_lmq_full_cntr2 <= spc2_lmq_full_cntr2;
       spc2_lmq2_full_d <= spc2_lmq2_full;
      end

    if( ( ~spc2_lmq3_full && (spc2_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc2_lmq_full_cntr3 <= 9'h000;
       spc2_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_lmq_full_counter3 = %d", spc2_lmq_full_cntr3);
      end
    else if( spc2_lmq3_full)
      begin
       spc2_lmq_full_cntr3 <= spc2_lmq_full_cntr3 + 1;
       spc2_lmq3_full_d <= spc2_lmq3_full;
      end
    else
      begin
       spc2_lmq_full_cntr3 <= spc2_lmq_full_cntr3;
       spc2_lmq3_full_d <= spc2_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc2_dfq_full_d or spc2_dfq_full)
begin
  if (spc2_dfq_full_d && ~spc2_dfq_full)
    spc2_dfq_full_capture <= 1'b1;
  else
    spc2_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc2_dfq_full && (spc2_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc2_dfq_full_cntr <= 9'h000;
       spc2_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dfq_full_counter = %d", spc2_dfq_full_cntr);
      end
    else if( spc2_dfq_full)
      begin
       spc2_dfq_full_cntr <= spc2_dfq_full_cntr + 1;
       spc2_dfq_full_d <= spc2_dfq_full;
      end
    else
      begin
       spc2_dfq_full_cntr <= spc2_dfq_full_cntr;
       spc2_dfq_full_d <= spc2_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc2_dva_full_d or spc2_dva_inv)
begin
  if (spc2_dva_full_d && ~spc2_dva_inv)
    spc2_dva_full_capture <= 1'b1;
  else
    spc2_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc2_dva_din && spc2_dva_wen)
    begin
     spc2_dva_inv <= 1'b1;
     spc2_dva_waddr_d <= spc2_dva_waddr;
    end
  else if(~spc2_dva_din && spc2_dva_wen)
    begin
     spc2_dva_inv <= 1'b0;
     spc2_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc2_dva_inv <= spc2_dva_inv;
     spc2_dva_waddr_d <= spc2_dva_waddr_d;
    end
end

always @(spc2_dva_raddr or spc2_dva_ren or spc2_dva_inv)
begin
  if (spc2_dva_inv && spc2_dva_ren && (spc2_dva_raddr[6:2] == spc2_dva_waddr_d))
    spc2_dva_vld2lkup <= 1'b1;
  else
    spc2_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc2_dva_inv && (spc2_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc2_dva_full_cntr <= 9'h000;
       spc2_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc2_dva_full_counter = %d", spc2_dva_full_cntr);
      end
    else if( spc2_dva_inv)
      begin
       spc2_dva_full_cntr <= spc2_dva_full_cntr + 1;
       spc2_dva_full_d <= spc2_dva_inv;
      end
    else
      begin
       spc2_dva_full_cntr <= spc2_dva_full_cntr;
       spc2_dva_full_d <= spc2_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc2_dva_vfull_d or spc2_dva_vld)
begin
  if (spc2_dva_vfull_d && ~spc2_dva_vld)
    spc2_dva_vfull_capture <= 1'b1;
  else
    spc2_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc2_dva_din && spc2_dva_wen)
   begin
    spc2_dva_vld <= 1'b1;
    spc2_dva_invwaddr_d <= spc2_dva_waddr;
    spc2_dva_invld_err <= spc2_dva_inv_perror;
   end
  else if(spc2_dva_din && spc2_dva_wen)
    begin
     spc2_dva_vld <= 1'b0;
     spc2_dva_invwaddr_d <= 5'b00000;
     spc2_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc2_dva_vld <= spc2_dva_vld;
     spc2_dva_invwaddr_d <= spc2_dva_invwaddr_d;
     spc2_dva_invld_err <= spc2_dva_invld_err;
    end
end


always @(spc2_dva_raddr or spc2_dva_ren or spc2_dva_vld)
begin
  if (spc2_dva_vld && spc2_dva_ren && (spc2_dva_raddr[6:2] == spc2_dva_waddr_d))
    spc2_dva_invld2lkup <= 1'b1;
  else
    spc2_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc2_dva_vld && (spc2_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc2_dva_vfull_cntr <= 9'h000;
    spc2_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc2_dva_vfull_counter = %d", spc2_dva_vfull_cntr);
  end
    else if( spc2_dva_vld)
    begin
      spc2_dva_vfull_cntr <= spc2_dva_vfull_cntr + 1;
      spc2_dva_vfull_d <= spc2_dva_vld;
    end
    else
    begin
      spc2_dva_vfull_cntr <= spc2_dva_vfull_cntr;
      spc2_dva_vfull_d <= spc2_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc2_dva_raddr or spc2_dva_waddr or spc2_dva_ren or spc2_dva_wen)
begin
  if ( spc2_dva_ren && spc2_dva_wen && (spc2_dva_raddr[6:2] == spc2_dva_waddr))
    spc2_dva_collide <= 1'b1;
  else
    spc2_dva_collide <= 1'b0;
end

// dva error cases

always @(spc2_dva_raddr or spc2_dva_ren or spc2_dva_dtag_perror or spc2_dva_dtag_perror)
begin
  if (spc2_dva_ren && (spc2_dva_dtag_perror || spc2_dva_dtag_perror))
    spc2_dva_err <= 1'b1;
  else
    spc2_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc2_dva_err)
     spc2_dva_efull_d <= 1'b1;
  else
     spc2_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc2_dva_ren && ~(spc2_dva_dtag_perror || spc2_dva_dtag_perror ) &&
       (spc2_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc2_dva_efull_cntr <= 9'h000;
     spc2_dva_raddr_d <= spc2_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc2_dva_efull_counter = %d", spc2_dva_efull_cntr);
    end
  else if(spc2_dva_efull_d)
    begin
      spc2_dva_efull_cntr <= spc2_dva_efull_cntr + 1;
      spc2_dva_raddr_d <= spc2_dva_raddr_d;
    end
  else
    begin
      spc2_dva_efull_cntr <= spc2_dva_efull_cntr;
      spc2_dva_raddr_d <= spc2_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC3

wire 	   spc3_dva_ren 	        = `SPARC_CORE3.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc3_dva_wen 	        = `SPARC_CORE3.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc3_dva_din 	        = `SPARC_CORE3.sparc0.lsu.dva_din_e;
wire [3:0] spc3_dva_dout 	        = `SPARC_CORE3.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc3_dva_raddr 	        = `SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc3_dva_waddr 	        = `SPARC_CORE3.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc3_dva_dtag_perror 	= `SPARC_CORE3.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc3_dva_dcache_perror 	= `SPARC_CORE3.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc3_dva_inv_perror 	= `SPARC_CORE3.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc3_ld_miss 	        = `SPARC_CORE3.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc3_ld_miss_capture;

wire 	   spc3_atomic_g 	        = `SPARC_CORE3.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc3_atm_type0 	= `SPARC_CORE3.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc3_atm_type1 	= `SPARC_CORE3.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc3_atm_type2 	= `SPARC_CORE3.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc3_atm_type3 	= `SPARC_CORE3.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc3_dctl_lsu_way_hit 	= `SPARC_CORE3.sparc0.lsu.dctl.lsu_way_hit;
wire       spc3_dctl_dcache_enable_g 	= `SPARC_CORE3.sparc0.lsu.dctl.dcache_enable_g;
wire       spc3_dctl_ldxa_internal 	= `SPARC_CORE3.sparc0.lsu.dctl.ldxa_internal;
wire       spc3_dctl_ldst_dbl_g 	= `SPARC_CORE3.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc3_dctl_atomic_g 	= `SPARC_CORE3.sparc0.lsu.dctl.atomic_g;
wire       spc3_dctl_stb_cam_hit 	= `SPARC_CORE3.sparc0.lsu.dctl.stb_cam_hit;
wire       spc3_dctl_endian_mispred_g 	= `SPARC_CORE3.sparc0.lsu.dctl.endian_mispred_g;
wire       spc3_dctl_dcache_rd_parity_error 	= `SPARC_CORE3.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc3_dctl_dtag_perror_g 	= `SPARC_CORE3.sparc0.lsu.dctl.dtag_perror_g;
wire       spc3_dctl_tte_data_perror_unc 	= `SPARC_CORE3.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc3_dctl_ld_inst_vld_g 	= `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc3_dctl_lsu_alt_space_g 	= `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc3_dctl_recognized_asi_g 	= `SPARC_CORE3.sparc0.lsu.dctl.recognized_asi_g;
wire       spc3_dctl_ncache_asild_rq_g  = `SPARC_CORE3.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc3_dctl_bld_hit;
wire       spc3_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc3_ixinv0  = `SPARC_CORE3.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc3_ixinv1  = `SPARC_CORE3.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc3_ixinv2  = `SPARC_CORE3.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc3_ixinv3  = `SPARC_CORE3.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc3_ifill  = `SPARC_CORE3.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc3_inv  = `SPARC_CORE3.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc3_inv_clr  = `SPARC_CORE3.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc3_ibuf_busy  = `SPARC_CORE3.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc3_l2  = `SPARC_CORE3.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc3_unc  = `SPARC_CORE3.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc3_fpld  = `SPARC_CORE3.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc3_fpldst  = `SPARC_CORE3.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc3_unflush  = `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc3_ldw  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc3_byp  = `SPARC_CORE3.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc3_flsh  = `SPARC_CORE3.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc3_chm  = `SPARC_CORE3.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc3_ldxa  = `SPARC_CORE3.sparc0.lsu.dctl.ldxa_internal ;
wire       spc3_ato  = `SPARC_CORE3.sparc0.lsu.dctl.atomic_g ;
wire       spc3_pref  = `SPARC_CORE3.sparc0.lsu.dctl.pref_inst_g ;
wire       spc3_chit  = `SPARC_CORE3.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc3_dcp  = `SPARC_CORE3.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc3_dtp  = `SPARC_CORE3.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc3_mpc  = `SPARC_CORE3.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc3_mpc  = 1'b0;
wire       spc3_mpu  = `SPARC_CORE3.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc3_exu_und;
reg  [4:0] spc3_exu;

// excptn
wire spc3_exp_wtchpt_trp_g                    = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc3_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc3_exp_priv_violtn_g                    = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc3_exp_daccess_excptn_g                 = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc3_exp_daccess_prot_g                   = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc3_exp_priv_action_g                    = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc3_exp_spec_access_epage_g              = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc3_exp_uncache_atomic_g                 = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc3_exp_illegal_asi_action_g             = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc3_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc3_exp_asi_rd_unc                       = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc3_exp_tlb_data_ce                     = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc3_exp_asi_rd_unc                       = 1'b0;
wire spc3_exp_tlb_data_ce                     =  1'b0;

wire spc3_exp_tlb_data_ue                     = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc3_exp_tlb_tag_ue                      = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc3_exp_unc                  = `SPARC_CORE3.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc3_exp_corr                 = `SPARC_CORE3.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc3_exp_corr                 = 1'b0;
wire [15:0] spc3_exp_und;
reg  [4:0] spc3_exp;
// dctl cmplt

wire       spc3_dctl_stxa_internal_d2  = `SPARC_CORE3.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc3_dctl_lsu_l2fill_vld  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc3_dctl_atomic_ld_squash_e  = `SPARC_CORE3.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc3_dctl_lsu_ignore_fill  = `SPARC_CORE3.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc3_dctl_l2fill_fpld_e  = `SPARC_CORE3.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc3_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc3_dctl_fill_err_trap_e  = `SPARC_CORE3.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc3_dctl_l2_corr_error_e  = `SPARC_CORE3.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc3_dctl_intld_byp_cmplt  = `SPARC_CORE3.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc3_dctl_lsu_intrpt_cmplt  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc3_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE3.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc3_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE3.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc3_dctl_lsu_pcx_pref_issue  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc3_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE3.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc3_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc3_ldstcond_cmplt_d;

wire       spc3_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE3.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc3_qctl1_ld0_inst_vld_g  = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc3_ld0_pkt_vld_unmasked  = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc3_ld0_pkt_vld_unmasked_d;
reg	   spc3_qctl1_ld_sec_hit_thrd0_w2;

wire       spc3_dctl_thread0_w3  = `SPARC_CORE3.sparc0.lsu.dctl.thread0_w3;
wire       spc3_dctl_dfill_thread0  = `SPARC_CORE3.sparc0.lsu.dctl.dfill_thread0;
wire       spc3_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc3_dctl_diag_wr_cmplt0  = `SPARC_CORE3.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc3_dctl_bsync0_reset  = `SPARC_CORE3.sparc0.lsu.dctl.bsync0_reset;
wire       spc3_dctl_late_cmplt0  = `SPARC_CORE3.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc3_dctl_stxa_cmplt0;
wire       spc3_dctl_l2fill_cmplt0;
wire       spc3_dctl_atm_cmplt0;
wire       spc3_dctl_fillerr0;
wire [4:0] spc3_cmplt0;
wire [5:0] spc3_dctl_ldst_cond_cmplt0;
reg  [3:0] spc3_ldstcond_cmplt0;
reg  [3:0] spc3_ldstcond_cmplt0_d;

wire       spc3_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE3.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc3_qctl1_ld1_inst_vld_g  = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc3_ld1_pkt_vld_unmasked  = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc3_ld1_pkt_vld_unmasked_d;
reg	   spc3_qctl1_ld_sec_hit_thrd1_w2;

wire       spc3_dctl_thread1_w3  = `SPARC_CORE3.sparc0.lsu.dctl.thread1_w3;
wire       spc3_dctl_dfill_thread1  = `SPARC_CORE3.sparc0.lsu.dctl.dfill_thread1;
wire       spc3_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc3_dctl_diag_wr_cmplt1  = `SPARC_CORE3.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc3_dctl_bsync1_reset  = `SPARC_CORE3.sparc0.lsu.dctl.bsync1_reset;
wire       spc3_dctl_late_cmplt1  = `SPARC_CORE3.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc3_dctl_stxa_cmplt1;
wire       spc3_dctl_l2fill_cmplt1;
wire       spc3_dctl_atm_cmplt1;
wire       spc3_dctl_fillerr1;
wire [4:0] spc3_cmplt1;
wire [5:0] spc3_dctl_ldst_cond_cmplt1;
reg  [3:0] spc3_ldstcond_cmplt1;
reg  [3:0] spc3_ldstcond_cmplt1_d;

wire       spc3_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE3.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc3_qctl1_ld2_inst_vld_g  = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc3_ld2_pkt_vld_unmasked  = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc3_ld2_pkt_vld_unmasked_d;
reg	   spc3_qctl1_ld_sec_hit_thrd2_w2;

wire       spc3_dctl_thread2_w3  = `SPARC_CORE3.sparc0.lsu.dctl.thread2_w3;
wire       spc3_dctl_dfill_thread2  = `SPARC_CORE3.sparc0.lsu.dctl.dfill_thread2;
wire       spc3_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc3_dctl_diag_wr_cmplt2  = `SPARC_CORE3.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc3_dctl_bsync2_reset  = `SPARC_CORE3.sparc0.lsu.dctl.bsync2_reset;
wire       spc3_dctl_late_cmplt2  = `SPARC_CORE3.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc3_dctl_stxa_cmplt2;
wire       spc3_dctl_l2fill_cmplt2;
wire       spc3_dctl_atm_cmplt2;
wire       spc3_dctl_fillerr2;
wire [4:0] spc3_cmplt2;
wire [5:0] spc3_dctl_ldst_cond_cmplt2;
reg  [3:0] spc3_ldstcond_cmplt2;
reg  [3:0] spc3_ldstcond_cmplt2_d;

wire       spc3_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE3.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc3_qctl1_ld3_inst_vld_g  = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc3_ld3_pkt_vld_unmasked  = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc3_ld3_pkt_vld_unmasked_d;
reg	   spc3_qctl1_ld_sec_hit_thrd3_w2;

wire       spc3_dctl_thread3_w3  = `SPARC_CORE3.sparc0.lsu.dctl.thread3_w3;
wire       spc3_dctl_dfill_thread3  = `SPARC_CORE3.sparc0.lsu.dctl.dfill_thread3;
wire       spc3_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc3_dctl_diag_wr_cmplt3  = `SPARC_CORE3.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc3_dctl_bsync3_reset  = `SPARC_CORE3.sparc0.lsu.dctl.bsync3_reset;
wire       spc3_dctl_late_cmplt3  = `SPARC_CORE3.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc3_dctl_stxa_cmplt3;
wire       spc3_dctl_l2fill_cmplt3;
wire       spc3_dctl_atm_cmplt3;
wire       spc3_dctl_fillerr3;
wire [4:0] spc3_cmplt3;
wire [5:0] spc3_dctl_ldst_cond_cmplt3;
reg  [3:0] spc3_ldstcond_cmplt3;
reg  [3:0] spc3_ldstcond_cmplt3_d;


wire       spc3_qctl1_bld_g 	= `SPARC_CORE3.sparc0.lsu.qctl1.bld_g;
wire       spc3_qctl1_bld_reset 	= `SPARC_CORE3.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc3_qctl1_bld_cnt 	= `SPARC_CORE3.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc3_bld0_full_cntr;
reg  [1:0] spc3_bld0_full_d;
reg 	   spc3_bld0_full_capture;
reg  [9:0] spc3_bld1_full_cntr;
reg  [1:0] spc3_bld1_full_d;
reg 	   spc3_bld1_full_capture;
reg  [9:0] spc3_bld2_full_cntr;
reg  [1:0] spc3_bld2_full_d;
reg 	   spc3_bld2_full_capture;
reg  [9:0] spc3_bld3_full_cntr;
reg  [1:0] spc3_bld3_full_d;
reg 	   spc3_bld3_full_capture;

wire       spc3_ipick 	= `SPARC_CORE3.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc3_lpick 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc3_spick 	= `SPARC_CORE3.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc3_mpick 	= `SPARC_CORE3.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc3_apick 	= `SPARC_CORE3.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc3_msquash 	= `SPARC_CORE3.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc3_fpicko;
wire [3:0] spc3_fpick;

wire [39:0] spc3_imiss_pa 	= `SPARC_CORE3.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc3_imiss_vld 	= `SPARC_CORE3.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc3_imiss_vld_d;
wire [39:0] spc3_lmiss_pa0 	= `SPARC_CORE3.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc3_lmiss_vld0 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc3_ld_pkt_vld0 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc3_st_pkt_vld0 	= `SPARC_CORE3.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc3_lmiss_eq0;
reg             spc3_atm_imiss_eq0;
wire [39:0] spc3_lmiss_pa1 	= `SPARC_CORE3.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc3_lmiss_vld1 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc3_ld_pkt_vld1 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc3_st_pkt_vld1 	= `SPARC_CORE3.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc3_lmiss_eq1;
reg             spc3_atm_imiss_eq1;
wire [39:0] spc3_lmiss_pa2 	= `SPARC_CORE3.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc3_lmiss_vld2 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc3_ld_pkt_vld2 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc3_st_pkt_vld2 	= `SPARC_CORE3.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc3_lmiss_eq2;
reg             spc3_atm_imiss_eq2;
wire [39:0] spc3_lmiss_pa3 	= `SPARC_CORE3.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc3_lmiss_vld3 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc3_ld_pkt_vld3 	= `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc3_st_pkt_vld3 	= `SPARC_CORE3.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc3_lmiss_eq3;
reg             spc3_atm_imiss_eq3;

wire [44:0]	spc3_wdata_ramc = `SPARC_CORE3.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc3_wptr_vld   = `SPARC_CORE3.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc3_wdata_ramd = {`SPARC_CORE3.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE3.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc3_stb_cam_hit 	        = `SPARC_CORE3.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc3_stb_cam_hit_ptr 	= `SPARC_CORE3.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc3_stb_ld_full_raw	= `SPARC_CORE3.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc3_stb_ld_partial_raw	= `SPARC_CORE3.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc3_stb_cam_mhit		= `SPARC_CORE3.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc3_dfq_vld_entries 	= `SPARC_CORE3.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc3_dfq_full;
reg  [9:0] spc3_dfq_full_cntr;
reg        spc3_dfq_full_d;
reg 	   spc3_dfq_full_capture;

reg  [9:0] spc3_dfq_full_cntr1;
reg        spc3_dfq_full_d1;
wire 	   spc3_dfq_full1;
reg 	   spc3_dfq_full_capture1;
reg  [9:0] spc3_dfq_full_cntr2;
reg        spc3_dfq_full_d2;
wire 	   spc3_dfq_full2;
reg 	   spc3_dfq_full_capture2;
reg  [9:0] spc3_dfq_full_cntr3;
reg        spc3_dfq_full_d3;
wire 	   spc3_dfq_full3;
reg 	   spc3_dfq_full_capture3;
reg  [9:0] spc3_dfq_full_cntr4;
reg        spc3_dfq_full_d4;
wire 	   spc3_dfq_full4;
reg 	   spc3_dfq_full_capture4;
reg  [9:0] spc3_dfq_full_cntr5;
reg        spc3_dfq_full_d5;
wire 	   spc3_dfq_full5;
reg 	   spc3_dfq_full_capture5;
reg  [9:0] spc3_dfq_full_cntr6;
reg        spc3_dfq_full_d6;
wire 	   spc3_dfq_full6;
reg 	   spc3_dfq_full_capture6;
reg  [9:0] spc3_dfq_full_cntr7;
reg        spc3_dfq_full_d7;
wire 	   spc3_dfq_full7;
reg 	   spc3_dfq_full_capture7;

wire 	   spc3_dva_rdwrhit;
reg  [9:0] spc3_dva_full_cntr;
reg        spc3_dva_full_d;
reg 	   spc3_dva_full_capture;
reg 	   spc3_dva_inv;
reg 	   spc3_dva_inv_d;
reg 	   spc3_dva_vld;
reg 	   spc3_dva_vld_d;
reg  [9:0] spc3_dva_vfull_cntr;
reg        spc3_dva_vfull_d;
reg 	   spc3_dva_vfull_capture;
reg        spc3_dva_collide;
reg        spc3_dva_vld2lkup;
reg        spc3_dva_invld2lkup;
reg        spc3_dva_invld_err;

reg  [9:0] spc3_dva_efull_cntr;
reg        spc3_dva_efull_d;

reg        spc3_dva_vlddtag_err;
reg        spc3_dva_vlddcache_err;
reg        spc3_dva_err;
reg [6:0] spc3_dva_raddr_d;
reg [4:0] spc3_dva_waddr_d;
reg [4:0] spc3_dva_invwaddr_d;

reg  	        spc3_ld0_lt_1;
reg  	        spc3_ld0_lt_2;
reg  	        spc3_ld0_lt_3;
reg  	        spc3_ld1_lt_0;
reg  	        spc3_ld1_lt_2;
reg  	        spc3_ld1_lt_3;
reg  	        spc3_ld2_lt_0;
reg  	        spc3_ld2_lt_1;
reg  	        spc3_ld2_lt_3;
reg  	        spc3_ld3_lt_0;
reg  	        spc3_ld3_lt_1;
reg  	        spc3_ld3_lt_2;

reg  	        spc3_st0_lt_1;
reg  	        spc3_st0_lt_2;
reg  	        spc3_st0_lt_3;
reg  	        spc3_st1_lt_0;
reg  	        spc3_st1_lt_2;
reg  	        spc3_st1_lt_3;
reg  	        spc3_st2_lt_0;
reg  	        spc3_st2_lt_1;
reg  	        spc3_st2_lt_3;
reg  	        spc3_st3_lt_0;
reg  	        spc3_st3_lt_1;
reg  	        spc3_st3_lt_2;

wire [11:0]      spc3_ld_ooo_ret;
wire [11:0]      spc3_st_ooo_ret;

wire [7:0]	spc3_stb_state_vld0 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc3_stb_state_ack0 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc3_stb_state_ced0 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc3_stb_state_rst0 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc3_stb_ack_vld0 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc3_ld0_inst_vld_g 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc3_intrpt0_cmplt 	 = `SPARC_CORE3.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc3_stb0_full 	         = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc3_stb0_full_w2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc3_lmq0_full 	         = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc3_mbar_vld0 	         = `SPARC_CORE3.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc3_ld0_unfilled 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc3_flsh_vld0	         = `SPARC_CORE3.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc3_ld0_unf_cntr;
reg  	        spc3_ld0_unfilled_d;

reg  [9:0]	spc3_st0_unf_cntr;
reg  	        spc3_st0_unfilled_d;
reg  	        spc3_st0_unfilled;

reg 	        spc3_mbar_vld_d0;
reg 	        spc3_flsh_vld_d0;

reg 	        spc3_lmq0_full_d;
reg  [9:0]	spc3_lmq_full_cntr0;
reg             spc3_lmq_full_capture0;

reg  [9:0]	spc3_stb_full_cntr0;
reg 		spc3_stb_full_capture0;

reg  [9:0]	spc3_mbar_vld_cntr0;
reg 		spc3_mbar_vld_capture0;

reg  [9:0]	spc3_flsh_vld_cntr0;
reg 		spc3_flsh_vld_capture0;

reg 		spc3_stb_head_hit0;
wire 		spc3_raw_ack_capture0;
reg  [9:0]	spc3_stb_ack_cntr0;

reg  [9:0]	spc3_stb_ced_cntr0;
reg  	        spc3_stb_ced0_d;
reg  	        spc3_stb_ced_capture0;
wire  	        spc3_stb_ced0;

reg 	        spc3_atm0_d;
reg  [9:0]	spc3_atm_cntr0;
reg             spc3_atm_intrpt_capture0;
reg             spc3_atm_intrpt_b4capture0;
reg             spc3_atm_inv_capture0;


reg  [39:0]     spc3_stb_wr_addr0;
reg  [39:0]     spc3_stb_atm_addr0;
reg             spc3_atm_lmiss_eq0;
wire [7:0]	spc3_stb_state_vld1 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc3_stb_state_ack1 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc3_stb_state_ced1 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc3_stb_state_rst1 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc3_stb_ack_vld1 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc3_ld1_inst_vld_g 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc3_intrpt1_cmplt 	 = `SPARC_CORE3.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc3_stb1_full 	         = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc3_stb1_full_w2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc3_lmq1_full 	         = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc3_mbar_vld1 	         = `SPARC_CORE3.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc3_ld1_unfilled 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc3_flsh_vld1	         = `SPARC_CORE3.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc3_ld1_unf_cntr;
reg  	        spc3_ld1_unfilled_d;

reg  [9:0]	spc3_st1_unf_cntr;
reg  	        spc3_st1_unfilled_d;
reg  	        spc3_st1_unfilled;

reg 	        spc3_mbar_vld_d1;
reg 	        spc3_flsh_vld_d1;

reg 	        spc3_lmq1_full_d;
reg  [9:0]	spc3_lmq_full_cntr1;
reg             spc3_lmq_full_capture1;

reg  [9:0]	spc3_stb_full_cntr1;
reg 		spc3_stb_full_capture1;

reg  [9:0]	spc3_mbar_vld_cntr1;
reg 		spc3_mbar_vld_capture1;

reg  [9:0]	spc3_flsh_vld_cntr1;
reg 		spc3_flsh_vld_capture1;

reg 		spc3_stb_head_hit1;
wire 		spc3_raw_ack_capture1;
reg  [9:0]	spc3_stb_ack_cntr1;

reg  [9:0]	spc3_stb_ced_cntr1;
reg  	        spc3_stb_ced1_d;
reg  	        spc3_stb_ced_capture1;
wire  	        spc3_stb_ced1;

reg 	        spc3_atm1_d;
reg  [9:0]	spc3_atm_cntr1;
reg             spc3_atm_intrpt_capture1;
reg             spc3_atm_intrpt_b4capture1;
reg             spc3_atm_inv_capture1;


reg  [39:0]     spc3_stb_wr_addr1;
reg  [39:0]     spc3_stb_atm_addr1;
reg             spc3_atm_lmiss_eq1;
wire [7:0]	spc3_stb_state_vld2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc3_stb_state_ack2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc3_stb_state_ced2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc3_stb_state_rst2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc3_stb_ack_vld2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc3_ld2_inst_vld_g 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc3_intrpt2_cmplt 	 = `SPARC_CORE3.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc3_stb2_full 	         = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc3_stb2_full_w2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc3_lmq2_full 	         = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc3_mbar_vld2 	         = `SPARC_CORE3.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc3_ld2_unfilled 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc3_flsh_vld2	         = `SPARC_CORE3.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc3_ld2_unf_cntr;
reg  	        spc3_ld2_unfilled_d;

reg  [9:0]	spc3_st2_unf_cntr;
reg  	        spc3_st2_unfilled_d;
reg  	        spc3_st2_unfilled;

reg 	        spc3_mbar_vld_d2;
reg 	        spc3_flsh_vld_d2;

reg 	        spc3_lmq2_full_d;
reg  [9:0]	spc3_lmq_full_cntr2;
reg             spc3_lmq_full_capture2;

reg  [9:0]	spc3_stb_full_cntr2;
reg 		spc3_stb_full_capture2;

reg  [9:0]	spc3_mbar_vld_cntr2;
reg 		spc3_mbar_vld_capture2;

reg  [9:0]	spc3_flsh_vld_cntr2;
reg 		spc3_flsh_vld_capture2;

reg 		spc3_stb_head_hit2;
wire 		spc3_raw_ack_capture2;
reg  [9:0]	spc3_stb_ack_cntr2;

reg  [9:0]	spc3_stb_ced_cntr2;
reg  	        spc3_stb_ced2_d;
reg  	        spc3_stb_ced_capture2;
wire  	        spc3_stb_ced2;

reg 	        spc3_atm2_d;
reg  [9:0]	spc3_atm_cntr2;
reg             spc3_atm_intrpt_capture2;
reg             spc3_atm_intrpt_b4capture2;
reg             spc3_atm_inv_capture2;


reg  [39:0]     spc3_stb_wr_addr2;
reg  [39:0]     spc3_stb_atm_addr2;
reg             spc3_atm_lmiss_eq2;
wire [7:0]	spc3_stb_state_vld3 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc3_stb_state_ack3 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc3_stb_state_ced3 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc3_stb_state_rst3 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc3_stb_ack_vld3 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc3_ld3_inst_vld_g 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc3_intrpt3_cmplt 	 = `SPARC_CORE3.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc3_stb3_full 	         = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc3_stb3_full_w2 	 = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc3_lmq3_full 	         = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc3_mbar_vld3 	         = `SPARC_CORE3.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc3_ld3_unfilled 	 = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc3_flsh_vld3	         = `SPARC_CORE3.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc3_ld3_unf_cntr;
reg  	        spc3_ld3_unfilled_d;

reg  [9:0]	spc3_st3_unf_cntr;
reg  	        spc3_st3_unfilled_d;
reg  	        spc3_st3_unfilled;

reg 	        spc3_mbar_vld_d3;
reg 	        spc3_flsh_vld_d3;

reg 	        spc3_lmq3_full_d;
reg  [9:0]	spc3_lmq_full_cntr3;
reg             spc3_lmq_full_capture3;

reg  [9:0]	spc3_stb_full_cntr3;
reg 		spc3_stb_full_capture3;

reg  [9:0]	spc3_mbar_vld_cntr3;
reg 		spc3_mbar_vld_capture3;

reg  [9:0]	spc3_flsh_vld_cntr3;
reg 		spc3_flsh_vld_capture3;

reg 		spc3_stb_head_hit3;
wire 		spc3_raw_ack_capture3;
reg  [9:0]	spc3_stb_ack_cntr3;

reg  [9:0]	spc3_stb_ced_cntr3;
reg  	        spc3_stb_ced3_d;
reg  	        spc3_stb_ced_capture3;
wire  	        spc3_stb_ced3;

reg 	        spc3_atm3_d;
reg  [9:0]	spc3_atm_cntr3;
reg             spc3_atm_intrpt_capture3;
reg             spc3_atm_intrpt_b4capture3;
reg             spc3_atm_inv_capture3;


reg  [39:0]     spc3_stb_wr_addr3;
reg  [39:0]     spc3_stb_atm_addr3;
reg             spc3_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc3_fpick = {spc3_mpick,spc3_spick,spc3_lpick,spc3_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc3_msquash,spc3_apick,spc3_fpick})
         9'b000000000 : spc3_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc3_fpicko = 1'b0;
         9'b1xxxxxxxx : spc3_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc3_fpicko = 1'b0;
	 default:
	  begin
		spc3_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon3 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc3_exu_und = {spc3_l2,
			  spc3_unc,
			  spc3_fpld,
			  spc3_fpldst,
			  spc3_unflush,
			  spc3_ldw,
			  spc3_byp,
			  spc3_flsh,
			  spc3_chm,
			  spc3_ldxa,
			  spc3_ato,
			  spc3_pref,
			  spc3_chit,
			  spc3_dcp,
			  spc3_dtp,
			  spc3_mpc,
			  spc3_mpu};

always @(spc3_exu_und)
begin
       case (spc3_exu_und)
         17'h00000 : spc3_exu =  5'h00;
         17'h00001 : spc3_exu =  5'h01;
         17'h00002 : spc3_exu =  5'h02;
         17'h00004 : spc3_exu =  5'h03;
         17'h00008 : spc3_exu =  5'h04;
         17'h00010 : spc3_exu =  5'h05;
         17'h00020 : spc3_exu =  5'h06;
         17'h00040 : spc3_exu =  5'h07;
         17'h00080 : spc3_exu =  5'h08;
         17'h00100 : spc3_exu =  5'h09;
         17'h00200 : spc3_exu =  5'h0a;
         17'h00400 : spc3_exu =  5'h0b;
         17'h00800 : spc3_exu =  5'h0c;
         17'h01000 : spc3_exu =  5'h0d;
         17'h02000 : spc3_exu =  5'h0e;
         17'h04000 : spc3_exu =  5'h0f;
         17'h08000 : spc3_exu =  5'h10;
         17'h10000 : spc3_exu =  5'h11;
	 default: spc3_exu =  5'h12;
       endcase
end
//excp
assign spc3_exp_und = {spc3_exp_wtchpt_trp_g,
			  spc3_exp_misalign_addr_ldst_atm_m,
			  spc3_exp_priv_violtn_g,
			  spc3_exp_daccess_excptn_g,
			  spc3_exp_daccess_prot_g,
			  spc3_exp_priv_action_g,
			  spc3_exp_spec_access_epage_g,
			  spc3_exp_uncache_atomic_g,
			  spc3_exp_illegal_asi_action_g,
			  spc3_exp_flt_ld_nfo_pg_g,
			  spc3_exp_asi_rd_unc,
			  spc3_exp_tlb_data_ce,
			  spc3_exp_tlb_data_ue,
			  spc3_exp_tlb_tag_ue,
			  spc3_exp_unc,
			  spc3_exp_corr};

always @(spc3_exp_und)
begin
       case (spc3_exp_und)
         16'h0000 : spc3_exp =  5'h00;
         16'h0001 : spc3_exp =  5'h01;
         16'h0002 : spc3_exp =  5'h02;
         16'h0004 : spc3_exp =  5'h03;
         16'h0008 : spc3_exp =  5'h04;
         16'h0010 : spc3_exp =  5'h05;
         16'h0020 : spc3_exp =  5'h06;
         16'h0040 : spc3_exp =  5'h07;
         16'h0080 : spc3_exp =  5'h08;
         16'h0100 : spc3_exp =  5'h09;
         16'h0200 : spc3_exp =  5'h0a;
         16'h0400 : spc3_exp =  5'h0b;
         16'h0800 : spc3_exp =  5'h0c;
         16'h1000 : spc3_exp =  5'h0d;
         16'h2000 : spc3_exp =  5'h0e;
         16'h4000 : spc3_exp =  5'h0f;
         16'h8000 : spc3_exp =  5'h10;
	 default: spc3_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc3_dctl_stxa_cmplt0 = ((spc3_dctl_stxa_internal_d2 & spc3_dctl_thread0_w3) |
				       spc3_dctl_stxa_stall_wr_cmplt0_d1);
assign spc3_dctl_l2fill_cmplt0 = (((spc3_dctl_lsu_l2fill_vld & ~spc3_dctl_atomic_ld_squash_e &
					    ~spc3_dctl_lsu_ignore_fill)) & ~spc3_dctl_l2fill_fpld_e &
					  ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread0);

assign spc3_dctl_fillerr0 = spc3_dctl_l2_corr_error_e & spc3_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc3_dctl_atm_cmplt0 = (spc3_dctl_lsu_atm_st_cmplt_e & ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread0);

assign spc3_dctl_ldst_cond_cmplt0 = { spc3_dctl_stxa_cmplt0, spc3_dctl_l2fill_cmplt0,
					    spc3_dctl_atomic_ld_squash_e, spc3_dctl_intld_byp_cmplt[0],
					    spc3_dctl_bsync0_reset, spc3_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc3_cmplt0 = { spc3_dctl_ldxa_illgl_va_cmplt_d1, spc3_dctl_pref_tlbmiss_cmplt_d2,
			      spc3_dctl_lsu_pcx_pref_issue, spc3_dctl_diag_wr_cmplt0, spc3_dctl_l2fill_fpld_e};


always @(spc3_cmplt0 or spc3_dctl_ldst_cond_cmplt0)
begin
       case ({spc3_dctl_fillerr0,spc3_dctl_ldst_cond_cmplt0,spc3_cmplt0})
         12'h000 : spc3_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc3_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc3_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc3_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc3_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc3_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc3_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc3_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc3_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc3_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc3_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc3_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc3_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc3_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc3_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc3_dctl_stxa_cmplt1 = ((spc3_dctl_stxa_internal_d2 & spc3_dctl_thread1_w3) |
				       spc3_dctl_stxa_stall_wr_cmplt1_d1);
assign spc3_dctl_l2fill_cmplt1 = (((spc3_dctl_lsu_l2fill_vld & ~spc3_dctl_atomic_ld_squash_e &
					    ~spc3_dctl_lsu_ignore_fill)) & ~spc3_dctl_l2fill_fpld_e &
					  ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread1);

assign spc3_dctl_fillerr1 = spc3_dctl_l2_corr_error_e & spc3_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc3_dctl_atm_cmplt1 = (spc3_dctl_lsu_atm_st_cmplt_e & ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread1);

assign spc3_dctl_ldst_cond_cmplt1 = { spc3_dctl_stxa_cmplt1, spc3_dctl_l2fill_cmplt1,
					    spc3_dctl_atomic_ld_squash_e, spc3_dctl_intld_byp_cmplt[1],
					    spc3_dctl_bsync1_reset, spc3_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc3_cmplt1 = { spc3_dctl_ldxa_illgl_va_cmplt_d1, spc3_dctl_pref_tlbmiss_cmplt_d2,
			      spc3_dctl_lsu_pcx_pref_issue, spc3_dctl_diag_wr_cmplt1, spc3_dctl_l2fill_fpld_e};


always @(spc3_cmplt1 or spc3_dctl_ldst_cond_cmplt1)
begin
       case ({spc3_dctl_fillerr1,spc3_dctl_ldst_cond_cmplt1,spc3_cmplt1})
         12'h000 : spc3_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc3_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc3_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc3_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc3_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc3_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc3_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc3_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc3_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc3_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc3_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc3_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc3_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc3_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc3_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc3_dctl_stxa_cmplt2 = ((spc3_dctl_stxa_internal_d2 & spc3_dctl_thread2_w3) |
				       spc3_dctl_stxa_stall_wr_cmplt2_d1);
assign spc3_dctl_l2fill_cmplt2 = (((spc3_dctl_lsu_l2fill_vld & ~spc3_dctl_atomic_ld_squash_e &
					    ~spc3_dctl_lsu_ignore_fill)) & ~spc3_dctl_l2fill_fpld_e &
					  ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread2);

assign spc3_dctl_fillerr2 = spc3_dctl_l2_corr_error_e & spc3_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc3_dctl_atm_cmplt2 = (spc3_dctl_lsu_atm_st_cmplt_e & ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread2);

assign spc3_dctl_ldst_cond_cmplt2 = { spc3_dctl_stxa_cmplt2, spc3_dctl_l2fill_cmplt2,
					    spc3_dctl_atomic_ld_squash_e, spc3_dctl_intld_byp_cmplt[2],
					    spc3_dctl_bsync2_reset, spc3_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc3_cmplt2 = { spc3_dctl_ldxa_illgl_va_cmplt_d1, spc3_dctl_pref_tlbmiss_cmplt_d2,
			      spc3_dctl_lsu_pcx_pref_issue, spc3_dctl_diag_wr_cmplt2, spc3_dctl_l2fill_fpld_e};


always @(spc3_cmplt2 or spc3_dctl_ldst_cond_cmplt2)
begin
       case ({spc3_dctl_fillerr2,spc3_dctl_ldst_cond_cmplt2,spc3_cmplt2})
         12'h000 : spc3_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc3_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc3_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc3_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc3_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc3_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc3_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc3_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc3_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc3_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc3_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc3_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc3_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc3_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc3_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc3_dctl_stxa_cmplt3 = ((spc3_dctl_stxa_internal_d2 & spc3_dctl_thread3_w3) |
				       spc3_dctl_stxa_stall_wr_cmplt3_d1);
assign spc3_dctl_l2fill_cmplt3 = (((spc3_dctl_lsu_l2fill_vld & ~spc3_dctl_atomic_ld_squash_e &
					    ~spc3_dctl_lsu_ignore_fill)) & ~spc3_dctl_l2fill_fpld_e &
					  ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread3);

assign spc3_dctl_fillerr3 = spc3_dctl_l2_corr_error_e & spc3_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc3_dctl_atm_cmplt3 = (spc3_dctl_lsu_atm_st_cmplt_e & ~spc3_dctl_fill_err_trap_e & spc3_dctl_dfill_thread3);

assign spc3_dctl_ldst_cond_cmplt3 = { spc3_dctl_stxa_cmplt3, spc3_dctl_l2fill_cmplt3,
					    spc3_dctl_atomic_ld_squash_e, spc3_dctl_intld_byp_cmplt[3],
					    spc3_dctl_bsync3_reset, spc3_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc3_cmplt3 = { spc3_dctl_ldxa_illgl_va_cmplt_d1, spc3_dctl_pref_tlbmiss_cmplt_d2,
			      spc3_dctl_lsu_pcx_pref_issue, spc3_dctl_diag_wr_cmplt3, spc3_dctl_l2fill_fpld_e};


always @(spc3_cmplt3 or spc3_dctl_ldst_cond_cmplt3)
begin
       case ({spc3_dctl_fillerr3,spc3_dctl_ldst_cond_cmplt3,spc3_cmplt3})
         12'h000 : spc3_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc3_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc3_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc3_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc3_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc3_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc3_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc3_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc3_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc3_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc3_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc3_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc3_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc3_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc3_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc3_ldstcond_cmplt0 or spc3_ldstcond_cmplt1 or spc3_ldstcond_cmplt2
	 or spc3_ldstcond_cmplt3 or spc3_dctl_lsu_ifu_ldst_cmplt
	 or spc3_dctl_late_cmplt0 or spc3_dctl_late_cmplt1 or spc3_dctl_late_cmplt2 or spc3_dctl_late_cmplt3)
begin
       case (spc3_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc3_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc3_ldstcond_cmplt_d = spc3_dctl_late_cmplt0 ? spc3_ldstcond_cmplt0_d : spc3_ldstcond_cmplt0;
         4'b0010 : spc3_ldstcond_cmplt_d = spc3_dctl_late_cmplt1 ? spc3_ldstcond_cmplt1_d : spc3_ldstcond_cmplt1;
         4'b0100 : spc3_ldstcond_cmplt_d = spc3_dctl_late_cmplt2 ? spc3_ldstcond_cmplt2_d : spc3_ldstcond_cmplt2;
         4'b1000 : spc3_ldstcond_cmplt_d = spc3_dctl_late_cmplt3 ? spc3_ldstcond_cmplt3_d : spc3_ldstcond_cmplt3;
         4'b0011 : spc3_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc3_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc3_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc3_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc3_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc3_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc3_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc3_st_ooo_ret = { spc3_st0_lt_1, spc3_st0_lt_2, spc3_st0_lt_3,
			      spc3_st1_lt_0, spc3_st1_lt_2, spc3_st1_lt_3,
			      spc3_st2_lt_0, spc3_st2_lt_1, spc3_st2_lt_3,
			      spc3_st3_lt_0, spc3_st3_lt_1, spc3_st3_lt_2};

always @(posedge clk)
begin
    if(~spc3_st0_unfilled || ~rst_l)
      spc3_st0_unfilled_d <= 1'b0;
    else
      spc3_st0_unfilled_d <= spc3_st0_unfilled;

    if(~rst_l)
      spc3_ldstcond_cmplt0_d <= 4'h0;
    else
      spc3_ldstcond_cmplt0_d <= spc3_ldstcond_cmplt0;

    if(~spc3_ld0_pkt_vld_unmasked || ~rst_l)
      spc3_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc3_ld0_pkt_vld_unmasked_d <= spc3_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc3_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc3_qctl1_ld_sec_hit_thrd0 && spc3_qctl1_ld0_inst_vld_g)
      spc3_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc3_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc3_st1_unfilled || ~rst_l)
      spc3_st1_unfilled_d <= 1'b0;
    else
      spc3_st1_unfilled_d <= spc3_st1_unfilled;

    if(~rst_l)
      spc3_ldstcond_cmplt1_d <= 4'h0;
    else
      spc3_ldstcond_cmplt1_d <= spc3_ldstcond_cmplt1;

    if(~spc3_ld1_pkt_vld_unmasked || ~rst_l)
      spc3_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc3_ld1_pkt_vld_unmasked_d <= spc3_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc3_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc3_qctl1_ld_sec_hit_thrd1 && spc3_qctl1_ld1_inst_vld_g)
      spc3_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc3_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc3_st2_unfilled || ~rst_l)
      spc3_st2_unfilled_d <= 1'b0;
    else
      spc3_st2_unfilled_d <= spc3_st2_unfilled;

    if(~rst_l)
      spc3_ldstcond_cmplt2_d <= 4'h0;
    else
      spc3_ldstcond_cmplt2_d <= spc3_ldstcond_cmplt2;

    if(~spc3_ld2_pkt_vld_unmasked || ~rst_l)
      spc3_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc3_ld2_pkt_vld_unmasked_d <= spc3_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc3_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc3_qctl1_ld_sec_hit_thrd2 && spc3_qctl1_ld2_inst_vld_g)
      spc3_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc3_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc3_st3_unfilled || ~rst_l)
      spc3_st3_unfilled_d <= 1'b0;
    else
      spc3_st3_unfilled_d <= spc3_st3_unfilled;

    if(~rst_l)
      spc3_ldstcond_cmplt3_d <= 4'h0;
    else
      spc3_ldstcond_cmplt3_d <= spc3_ldstcond_cmplt3;

    if(~spc3_ld3_pkt_vld_unmasked || ~rst_l)
      spc3_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc3_ld3_pkt_vld_unmasked_d <= spc3_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc3_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc3_qctl1_ld_sec_hit_thrd3 && spc3_qctl1_ld3_inst_vld_g)
      spc3_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc3_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc3_stb_state_ced0) && (|spc3_stb_state_rst0)) || ~rst_l)
      spc3_st0_unfilled <= 1'b0;
    else if( ((|spc3_stb_state_ced0) && ~(|spc3_stb_state_rst0)))
      spc3_st0_unfilled <= 1'b1;
    else
      spc3_st0_unfilled <= spc3_st0_unfilled;
    if( ((|spc3_stb_state_ced1) && (|spc3_stb_state_rst1)) || ~rst_l)
      spc3_st1_unfilled <= 1'b0;
    else if( ((|spc3_stb_state_ced1) && ~(|spc3_stb_state_rst1)))
      spc3_st1_unfilled <= 1'b1;
    else
      spc3_st1_unfilled <= spc3_st1_unfilled;
    if( ((|spc3_stb_state_ced2) && (|spc3_stb_state_rst2)) || ~rst_l)
      spc3_st2_unfilled <= 1'b0;
    else if( ((|spc3_stb_state_ced2) && ~(|spc3_stb_state_rst2)))
      spc3_st2_unfilled <= 1'b1;
    else
      spc3_st2_unfilled <= spc3_st2_unfilled;
    if( ((|spc3_stb_state_ced3) && (|spc3_stb_state_rst3)) || ~rst_l)
      spc3_st3_unfilled <= 1'b0;
    else if( ((|spc3_stb_state_ced3) && ~(|spc3_stb_state_rst3)))
      spc3_st3_unfilled <= 1'b1;
    else
      spc3_st3_unfilled <= spc3_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc3_st0_unfilled && spc3_st0_unfilled_d)|| ~rst_l)
      begin
        spc3_st0_unf_cntr <= 9'h000;
      end
    else if(spc3_st0_unfilled)
      begin
        spc3_st0_unf_cntr <= spc3_st0_unf_cntr + 1;
      end
    else
      begin
        spc3_st0_unf_cntr <= spc3_st0_unf_cntr;
      end
    if((~spc3_st1_unfilled && spc3_st1_unfilled_d)|| ~rst_l)
      begin
        spc3_st1_unf_cntr <= 9'h000;
      end
    else if(spc3_st1_unfilled)
      begin
        spc3_st1_unf_cntr <= spc3_st1_unf_cntr + 1;
      end
    else
      begin
        spc3_st1_unf_cntr <= spc3_st1_unf_cntr;
      end
    if((~spc3_st2_unfilled && spc3_st2_unfilled_d)|| ~rst_l)
      begin
        spc3_st2_unf_cntr <= 9'h000;
      end
    else if(spc3_st2_unfilled)
      begin
        spc3_st2_unf_cntr <= spc3_st2_unf_cntr + 1;
      end
    else
      begin
        spc3_st2_unf_cntr <= spc3_st2_unf_cntr;
      end
    if((~spc3_st3_unfilled && spc3_st3_unfilled_d)|| ~rst_l)
      begin
        spc3_st3_unf_cntr <= 9'h000;
      end
    else if(spc3_st3_unfilled)
      begin
        spc3_st3_unf_cntr <= spc3_st3_unf_cntr + 1;
      end
    else
      begin
        spc3_st3_unf_cntr <= spc3_st3_unf_cntr;
      end
end

always @(spc3_st0_unfilled or spc3_st1_unfilled or spc3_st2_unfilled or spc3_st3_unfilled
	 or spc3_st0_unfilled_d or spc3_st1_unfilled_d or spc3_st2_unfilled_d or spc3_st3_unfilled_d)
begin
if(~spc3_st0_unfilled && spc3_st0_unfilled_d && spc3_st1_unfilled)
 spc3_st0_lt_1 <= (spc3_st1_unf_cntr > spc3_st0_unf_cntr);
else
 spc3_st0_lt_1 <= 1'b0;
if(~spc3_st0_unfilled && spc3_st0_unfilled_d && spc3_st2_unfilled)
 spc3_st0_lt_2 <= (spc3_st2_unf_cntr > spc3_st0_unf_cntr);
else
 spc3_st0_lt_2 <= 1'b0;
if(~spc3_st0_unfilled && spc3_st0_unfilled_d && spc3_st3_unfilled)
 spc3_st0_lt_3 <= (spc3_st3_unf_cntr > spc3_st0_unf_cntr);
else
 spc3_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc3_st1_unfilled && spc3_st1_unfilled_d && spc3_st0_unfilled)
 spc3_st1_lt_0 <= (spc3_st0_unf_cntr > spc3_st1_unf_cntr);
else
 spc3_st1_lt_0 <= 1'b0;
if(~spc3_st1_unfilled && spc3_st1_unfilled_d && spc3_st2_unfilled)
 spc3_st1_lt_2 <= (spc3_st2_unf_cntr > spc3_st1_unf_cntr);
else
 spc3_st1_lt_2 <= 1'b0;
if(~spc3_st1_unfilled && spc3_st1_unfilled_d && spc3_st3_unfilled)
 spc3_st1_lt_3 <= (spc3_st3_unf_cntr > spc3_st1_unf_cntr);
else
 spc3_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc3_st2_unfilled && spc3_st2_unfilled_d && spc3_st0_unfilled)
 spc3_st2_lt_0 <= (spc3_st0_unf_cntr > spc3_st2_unf_cntr);
else
 spc3_st2_lt_0 <= 1'b0;
if(~spc3_st2_unfilled && spc3_st2_unfilled_d && spc3_st1_unfilled)
 spc3_st2_lt_1 <= (spc3_st1_unf_cntr > spc3_st2_unf_cntr);
else
 spc3_st2_lt_1 <= 1'b0;
if(~spc3_st2_unfilled && spc3_st2_unfilled_d && spc3_st3_unfilled)
 spc3_st2_lt_3 <= (spc3_st3_unf_cntr > spc3_st2_unf_cntr);
else
 spc3_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc3_st3_unfilled && spc3_st3_unfilled_d && spc3_st0_unfilled)
 spc3_st3_lt_0 <= (spc3_st0_unf_cntr > spc3_st3_unf_cntr);
else
 spc3_st3_lt_0 <= 1'b0;
if(~spc3_st3_unfilled && spc3_st3_unfilled_d && spc3_st1_unfilled)
 spc3_st3_lt_1 <= (spc3_st1_unf_cntr > spc3_st3_unf_cntr);
else
 spc3_st3_lt_1 <= 1'b0;
if(~spc3_st3_unfilled && spc3_st3_unfilled_d && spc3_st2_unfilled)
 spc3_st3_lt_2 <= (spc3_st2_unf_cntr > spc3_st3_unf_cntr);
else
 spc3_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc3_ld_ooo_ret = { spc3_ld0_lt_1, spc3_ld0_lt_2, spc3_ld0_lt_3,
			      spc3_ld1_lt_0, spc3_ld1_lt_2, spc3_ld1_lt_3,
			      spc3_ld2_lt_0, spc3_ld2_lt_1, spc3_ld2_lt_3,
			      spc3_ld3_lt_0, spc3_ld3_lt_1, spc3_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc3_ld0_unfilled && spc3_ld0_unfilled_d)|| ~rst_l)
      begin
        spc3_ld0_unf_cntr <= 9'h000;
      end
    else if(spc3_ld0_unfilled)
      begin
        spc3_ld0_unf_cntr <= spc3_ld0_unf_cntr + 1;
      end
    else
      begin
        spc3_ld0_unf_cntr <= spc3_ld0_unf_cntr;
      end
    if((~spc3_ld1_unfilled && spc3_ld1_unfilled_d)|| ~rst_l)
      begin
        spc3_ld1_unf_cntr <= 9'h000;
      end
    else if(spc3_ld1_unfilled)
      begin
        spc3_ld1_unf_cntr <= spc3_ld1_unf_cntr + 1;
      end
    else
      begin
        spc3_ld1_unf_cntr <= spc3_ld1_unf_cntr;
      end
    if((~spc3_ld2_unfilled && spc3_ld2_unfilled_d)|| ~rst_l)
      begin
        spc3_ld2_unf_cntr <= 9'h000;
      end
    else if(spc3_ld2_unfilled)
      begin
        spc3_ld2_unf_cntr <= spc3_ld2_unf_cntr + 1;
      end
    else
      begin
        spc3_ld2_unf_cntr <= spc3_ld2_unf_cntr;
      end
    if((~spc3_ld3_unfilled && spc3_ld3_unfilled_d)|| ~rst_l)
      begin
        spc3_ld3_unf_cntr <= 9'h000;
      end
    else if(spc3_ld3_unfilled)
      begin
        spc3_ld3_unf_cntr <= spc3_ld3_unf_cntr + 1;
      end
    else
      begin
        spc3_ld3_unf_cntr <= spc3_ld3_unf_cntr;
      end
end

always @(spc3_ld0_unfilled or spc3_ld1_unfilled or spc3_ld2_unfilled or spc3_ld3_unfilled
	 or spc3_ld0_unfilled_d or spc3_ld1_unfilled_d or spc3_ld2_unfilled_d or spc3_ld3_unfilled_d)
begin
if(~spc3_ld0_unfilled && spc3_ld0_unfilled_d && spc3_ld1_unfilled)
 spc3_ld0_lt_1 <= (spc3_ld1_unf_cntr > spc3_ld0_unf_cntr);
else
 spc3_ld0_lt_1 <= 1'b0;
if(~spc3_ld0_unfilled && spc3_ld0_unfilled_d && spc3_ld2_unfilled)
 spc3_ld0_lt_2 <= (spc3_ld2_unf_cntr > spc3_ld0_unf_cntr);
else
 spc3_ld0_lt_2 <= 1'b0;
if(~spc3_ld0_unfilled && spc3_ld0_unfilled_d && spc3_ld3_unfilled)
 spc3_ld0_lt_3 <= (spc3_ld3_unf_cntr > spc3_ld0_unf_cntr);
else
 spc3_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc3_ld1_unfilled && spc3_ld1_unfilled_d && spc3_ld0_unfilled)
 spc3_ld1_lt_0 <= (spc3_ld0_unf_cntr > spc3_ld1_unf_cntr);
else
 spc3_ld1_lt_0 <= 1'b0;
if(~spc3_ld1_unfilled && spc3_ld1_unfilled_d && spc3_ld2_unfilled)
 spc3_ld1_lt_2 <= (spc3_ld2_unf_cntr > spc3_ld1_unf_cntr);
else
 spc3_ld1_lt_2 <= 1'b0;
if(~spc3_ld1_unfilled && spc3_ld1_unfilled_d && spc3_ld3_unfilled)
 spc3_ld1_lt_3 <= (spc3_ld3_unf_cntr > spc3_ld1_unf_cntr);
else
 spc3_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc3_ld2_unfilled && spc3_ld2_unfilled_d && spc3_ld0_unfilled)
 spc3_ld2_lt_0 <= (spc3_ld0_unf_cntr > spc3_ld2_unf_cntr);
else
 spc3_ld2_lt_0 <= 1'b0;
if(~spc3_ld2_unfilled && spc3_ld2_unfilled_d && spc3_ld1_unfilled)
 spc3_ld2_lt_1 <= (spc3_ld1_unf_cntr > spc3_ld2_unf_cntr);
else
 spc3_ld2_lt_1 <= 1'b0;
if(~spc3_ld2_unfilled && spc3_ld2_unfilled_d && spc3_ld3_unfilled)
 spc3_ld2_lt_3 <= (spc3_ld3_unf_cntr > spc3_ld2_unf_cntr);
else
 spc3_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc3_ld3_unfilled && spc3_ld3_unfilled_d && spc3_ld0_unfilled)
 spc3_ld3_lt_0 <= (spc3_ld0_unf_cntr > spc3_ld3_unf_cntr);
else
 spc3_ld3_lt_0 <= 1'b0;
if(~spc3_ld3_unfilled && spc3_ld3_unfilled_d && spc3_ld1_unfilled)
 spc3_ld3_lt_1 <= (spc3_ld1_unf_cntr > spc3_ld3_unf_cntr);
else
 spc3_ld3_lt_1 <= 1'b0;
if(~spc3_ld3_unfilled && spc3_ld3_unfilled_d && spc3_ld2_unfilled)
 spc3_ld3_lt_2 <= (spc3_ld2_unf_cntr > spc3_ld3_unf_cntr);
else
 spc3_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc3_dctl_bld_hit =
((|spc3_dctl_lsu_way_hit[3:0])  & spc3_dctl_dcache_enable_g &
  ~spc3_dctl_ldxa_internal & ~spc3_dctl_dcache_rd_parity_error & ~spc3_dctl_dtag_perror_g &
  ~spc3_dctl_endian_mispred_g &
  ~spc3_dctl_atomic_g & ~spc3_dctl_ncache_asild_rq_g) & ~spc3_dctl_tte_data_perror_unc &
  spc3_dctl_ld_inst_vld_g & spc3_qctl1_bld_g ;

assign spc3_dctl_bld_stb_hit = spc3_dctl_bld_hit & spc3_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc3_bld0_full_d <= 2'b00;
      spc3_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc3_bld0_full_d <= spc3_qctl1_bld_cnt;
      spc3_ld0_unfilled_d <= spc3_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc3_bld1_full_d <= 2'b00;
      spc3_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc3_bld1_full_d <= spc3_qctl1_bld_cnt;
      spc3_ld1_unfilled_d <= spc3_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc3_bld2_full_d <= 2'b00;
      spc3_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc3_bld2_full_d <= spc3_qctl1_bld_cnt;
      spc3_ld2_unfilled_d <= spc3_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc3_bld3_full_d <= 2'b00;
      spc3_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc3_bld3_full_d <= spc3_qctl1_bld_cnt;
      spc3_ld3_unfilled_d <= spc3_ld3_unfilled;
     end
end
always @(spc3_bld0_full_d or spc3_qctl1_bld_cnt)
begin
 if( (spc3_bld0_full_d != spc3_qctl1_bld_cnt) && (spc3_bld0_full_d == 2'd0))
    spc3_bld0_full_capture <= 1'b1;
 else
    spc3_bld0_full_capture <= 1'b0;
end
always @(spc3_bld1_full_d or spc3_qctl1_bld_cnt)
begin
 if( (spc3_bld1_full_d != spc3_qctl1_bld_cnt) && (spc3_bld1_full_d == 2'd1))
    spc3_bld1_full_capture <= 1'b1;
 else
    spc3_bld1_full_capture <= 1'b0;
end
always @(spc3_bld2_full_d or spc3_qctl1_bld_cnt)
begin
 if( (spc3_bld2_full_d != spc3_qctl1_bld_cnt) && (spc3_bld2_full_d == 2'd2))
    spc3_bld2_full_capture <= 1'b1;
 else
    spc3_bld2_full_capture <= 1'b0;
end
always @(spc3_bld3_full_d or spc3_qctl1_bld_cnt)
begin
 if( (spc3_bld3_full_d != spc3_qctl1_bld_cnt) && (spc3_bld3_full_d == 2'd3))
    spc3_bld3_full_capture <= 1'b1;
 else
    spc3_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc3_qctl1_bld_cnt != 2'b00) && (spc3_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc3_bld0_full_cntr <= 9'h000;
      end
    else if(spc3_qctl1_bld_g && (spc3_qctl1_bld_cnt == 2'b00))
      begin
        spc3_bld0_full_cntr <= spc3_bld0_full_cntr + 1;
      end
    else if( (spc3_qctl1_bld_cnt == 2'b00) && (spc3_bld0_full_cntr != 9'h000))
      begin
        spc3_bld0_full_cntr <= spc3_bld0_full_cntr + 1;
      end
    else
      begin
        spc3_bld0_full_cntr <= spc3_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc3_qctl1_bld_cnt != 2'b01) && (spc3_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc3_bld1_full_cntr <= 9'h000;
      end
    else if(spc3_qctl1_bld_cnt == 2'b01)
      begin
        spc3_bld1_full_cntr <= spc3_bld1_full_cntr + 1;
      end
    else if( (spc3_qctl1_bld_cnt == 2'b01) && (spc3_bld1_full_cntr != 9'h000))
      begin
        spc3_bld1_full_cntr <= spc3_bld1_full_cntr + 1;
      end
    else
      begin
        spc3_bld1_full_cntr <= spc3_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc3_qctl1_bld_cnt != 2'b10) && (spc3_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc3_bld2_full_cntr <= 9'h000;
      end
    else if(spc3_qctl1_bld_cnt == 2'b10)
      begin
        spc3_bld2_full_cntr <= spc3_bld2_full_cntr + 1;
      end
    else if( (spc3_qctl1_bld_cnt == 2'b10) && (spc3_bld2_full_cntr != 9'h000))
      begin
        spc3_bld2_full_cntr <= spc3_bld2_full_cntr + 1;
      end
    else
      begin
        spc3_bld2_full_cntr <= spc3_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc3_qctl1_bld_cnt != 2'b11) && (spc3_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc3_bld3_full_cntr <= 9'h000;
      end
    else if(spc3_qctl1_bld_cnt == 2'b11)
      begin
        spc3_bld3_full_cntr <= spc3_bld3_full_cntr + 1;
      end
    else if( (spc3_qctl1_bld_cnt == 2'b11) && (spc3_bld3_full_cntr != 9'h000))
      begin
        spc3_bld3_full_cntr <= spc3_bld3_full_cntr + 1;
      end
    else
      begin
        spc3_bld3_full_cntr <= spc3_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc3_stb_state_vld0) && ~spc3_atomic_g) || ~rst_l)
      begin
        spc3_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc3_atomic_g && (spc3_atm_type0 != 8'h00) && spc3_wptr_vld)
      begin
        spc3_stb_atm_addr0 <= {spc3_wdata_ramc[44:9],spc3_wdata_ramd[67:64]};
      end
    else
      begin
        spc3_stb_atm_addr0 <= spc3_stb_atm_addr0;
      end
    if( ( ~(|spc3_stb_state_vld1) && ~spc3_atomic_g) || ~rst_l)
      begin
        spc3_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc3_atomic_g && (spc3_atm_type1 != 8'h00) && spc3_wptr_vld)
      begin
        spc3_stb_atm_addr1 <= {spc3_wdata_ramc[44:9],spc3_wdata_ramd[67:64]};
      end
    else
      begin
        spc3_stb_atm_addr1 <= spc3_stb_atm_addr1;
      end
    if( ( ~(|spc3_stb_state_vld2) && ~spc3_atomic_g) || ~rst_l)
      begin
        spc3_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc3_atomic_g && (spc3_atm_type2 != 8'h00) && spc3_wptr_vld)
      begin
        spc3_stb_atm_addr2 <= {spc3_wdata_ramc[44:9],spc3_wdata_ramd[67:64]};
      end
    else
      begin
        spc3_stb_atm_addr2 <= spc3_stb_atm_addr2;
      end
    if( ( ~(|spc3_stb_state_vld3) && ~spc3_atomic_g) || ~rst_l)
      begin
        spc3_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc3_atomic_g && (spc3_atm_type3 != 8'h00) && spc3_wptr_vld)
      begin
        spc3_stb_atm_addr3 <= {spc3_wdata_ramc[44:9],spc3_wdata_ramd[67:64]};
      end
    else
      begin
        spc3_stb_atm_addr3 <= spc3_stb_atm_addr3;
      end
end

 assign spc3_dfq_full = (spc3_dfq_vld_entries >= 3'd4);


assign spc3_dfq_full1 = (spc3_dfq_vld_entries >= (3'd4 + 1));

always @(spc3_dfq_full_d1 or spc3_dfq_full1)
begin
  if (spc3_dfq_full_d1 && ~spc3_dfq_full1)
    spc3_dfq_full_capture1 <= 1'b1;
  else
    spc3_dfq_full_capture1 <= 1'b0;
end

assign spc3_dfq_full2 = (spc3_dfq_vld_entries >= (3'd4 + 2));

always @(spc3_dfq_full_d2 or spc3_dfq_full2)
begin
  if (spc3_dfq_full_d2 && ~spc3_dfq_full2)
    spc3_dfq_full_capture2 <= 1'b1;
  else
    spc3_dfq_full_capture2 <= 1'b0;
end

assign spc3_dfq_full3 = (spc3_dfq_vld_entries >= (3'd4 + 3));

always @(spc3_dfq_full_d3 or spc3_dfq_full3)
begin
  if (spc3_dfq_full_d3 && ~spc3_dfq_full3)
    spc3_dfq_full_capture3 <= 1'b1;
  else
    spc3_dfq_full_capture3 <= 1'b0;
end

assign spc3_dfq_full4 = (spc3_dfq_vld_entries >= (3'd4 + 4));

always @(spc3_dfq_full_d4 or spc3_dfq_full4)
begin
  if (spc3_dfq_full_d4 && ~spc3_dfq_full4)
    spc3_dfq_full_capture4 <= 1'b1;
  else
    spc3_dfq_full_capture4 <= 1'b0;
end

assign spc3_dfq_full5 = (spc3_dfq_vld_entries >= (3'd4 + 5));

always @(spc3_dfq_full_d5 or spc3_dfq_full5)
begin
  if (spc3_dfq_full_d5 && ~spc3_dfq_full5)
    spc3_dfq_full_capture5 <= 1'b1;
  else
    spc3_dfq_full_capture5 <= 1'b0;
end

assign spc3_dfq_full6 = (spc3_dfq_vld_entries >= (3'd4 + 6));

always @(spc3_dfq_full_d6 or spc3_dfq_full6)
begin
  if (spc3_dfq_full_d6 && ~spc3_dfq_full6)
    spc3_dfq_full_capture6 <= 1'b1;
  else
    spc3_dfq_full_capture6 <= 1'b0;
end

assign spc3_dfq_full7 = (spc3_dfq_vld_entries >= (3'd4 + 7));

always @(spc3_dfq_full_d7 or spc3_dfq_full7)
begin
  if (spc3_dfq_full_d7 && ~spc3_dfq_full7)
    spc3_dfq_full_capture7 <= 1'b1;
  else
    spc3_dfq_full_capture7 <= 1'b0;
end

always @(spc3_mbar_vld_d0 or spc3_mbar_vld0)
begin
  if (spc3_mbar_vld_d0 && ~spc3_mbar_vld0)
    spc3_mbar_vld_capture0 <= 1'b1;
  else
    spc3_mbar_vld_capture0 <= 1'b0;
end
always @(spc3_mbar_vld_d1 or spc3_mbar_vld1)
begin
  if (spc3_mbar_vld_d1 && ~spc3_mbar_vld1)
    spc3_mbar_vld_capture1 <= 1'b1;
  else
    spc3_mbar_vld_capture1 <= 1'b0;
end
always @(spc3_mbar_vld_d2 or spc3_mbar_vld2)
begin
  if (spc3_mbar_vld_d2 && ~spc3_mbar_vld2)
    spc3_mbar_vld_capture2 <= 1'b1;
  else
    spc3_mbar_vld_capture2 <= 1'b0;
end
always @(spc3_mbar_vld_d3 or spc3_mbar_vld3)
begin
  if (spc3_mbar_vld_d3 && ~spc3_mbar_vld3)
    spc3_mbar_vld_capture3 <= 1'b1;
  else
    spc3_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc3_dfq_full1 && (spc3_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr1 <= 9'h000;
       spc3_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr1);
      end
    else if( spc3_dfq_full1)
      begin
       spc3_dfq_full_cntr1 <= spc3_dfq_full_cntr1 + 1;
       spc3_dfq_full_d1 <= spc3_dfq_full1;
      end
    else
      begin
       spc3_dfq_full_cntr1 <= spc3_dfq_full_cntr1;
       spc3_dfq_full_d1 <= spc3_dfq_full1;
      end
    if( ( ~spc3_dfq_full2 && (spc3_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr2 <= 9'h000;
       spc3_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr2);
      end
    else if( spc3_dfq_full2)
      begin
       spc3_dfq_full_cntr2 <= spc3_dfq_full_cntr2 + 1;
       spc3_dfq_full_d2 <= spc3_dfq_full2;
      end
    else
      begin
       spc3_dfq_full_cntr2 <= spc3_dfq_full_cntr2;
       spc3_dfq_full_d2 <= spc3_dfq_full2;
      end
    if( ( ~spc3_dfq_full3 && (spc3_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr3 <= 9'h000;
       spc3_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr3);
      end
    else if( spc3_dfq_full3)
      begin
       spc3_dfq_full_cntr3 <= spc3_dfq_full_cntr3 + 1;
       spc3_dfq_full_d3 <= spc3_dfq_full3;
      end
    else
      begin
       spc3_dfq_full_cntr3 <= spc3_dfq_full_cntr3;
       spc3_dfq_full_d3 <= spc3_dfq_full3;
      end
    if( ( ~spc3_dfq_full4 && (spc3_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr4 <= 9'h000;
       spc3_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr4);
      end
    else if( spc3_dfq_full4)
      begin
       spc3_dfq_full_cntr4 <= spc3_dfq_full_cntr4 + 1;
       spc3_dfq_full_d4 <= spc3_dfq_full4;
      end
    else
      begin
       spc3_dfq_full_cntr4 <= spc3_dfq_full_cntr4;
       spc3_dfq_full_d4 <= spc3_dfq_full4;
      end
    if( ( ~spc3_dfq_full5 && (spc3_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr5 <= 9'h000;
       spc3_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr5);
      end
    else if( spc3_dfq_full5)
      begin
       spc3_dfq_full_cntr5 <= spc3_dfq_full_cntr5 + 1;
       spc3_dfq_full_d5 <= spc3_dfq_full5;
      end
    else
      begin
       spc3_dfq_full_cntr5 <= spc3_dfq_full_cntr5;
       spc3_dfq_full_d5 <= spc3_dfq_full5;
      end
    if( ( ~spc3_dfq_full6 && (spc3_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr6 <= 9'h000;
       spc3_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr6);
      end
    else if( spc3_dfq_full6)
      begin
       spc3_dfq_full_cntr6 <= spc3_dfq_full_cntr6 + 1;
       spc3_dfq_full_d6 <= spc3_dfq_full6;
      end
    else
      begin
       spc3_dfq_full_cntr6 <= spc3_dfq_full_cntr6;
       spc3_dfq_full_d6 <= spc3_dfq_full6;
      end
    if( ( ~spc3_dfq_full7 && (spc3_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr7 <= 9'h000;
       spc3_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr7);
      end
    else if( spc3_dfq_full7)
      begin
       spc3_dfq_full_cntr7 <= spc3_dfq_full_cntr7 + 1;
       spc3_dfq_full_d7 <= spc3_dfq_full7;
      end
    else
      begin
       spc3_dfq_full_cntr7 <= spc3_dfq_full_cntr7;
       spc3_dfq_full_d7 <= spc3_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc3_intrpt0_cmplt or spc3_atm_cntr0 or spc3_stb_state_ced0)
begin
  if (spc3_intrpt0_cmplt && (spc3_atm_cntr0 != 9'h000) && ~(|spc3_stb_state_ced0))
    spc3_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc3_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc3_intrpt1_cmplt or spc3_atm_cntr1 or spc3_stb_state_ced1)
begin
  if (spc3_intrpt1_cmplt && (spc3_atm_cntr1 != 9'h000) && ~(|spc3_stb_state_ced1))
    spc3_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc3_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc3_intrpt2_cmplt or spc3_atm_cntr2 or spc3_stb_state_ced2)
begin
  if (spc3_intrpt2_cmplt && (spc3_atm_cntr2 != 9'h000) && ~(|spc3_stb_state_ced2))
    spc3_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc3_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc3_intrpt3_cmplt or spc3_atm_cntr3 or spc3_stb_state_ced3)
begin
  if (spc3_intrpt3_cmplt && (spc3_atm_cntr3 != 9'h000) && ~(|spc3_stb_state_ced3))
    spc3_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc3_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc3_intrpt0_cmplt or spc3_atm_cntr0 or spc3_stb_state_ced0)
begin
  if (spc3_intrpt0_cmplt && (spc3_atm_cntr0 != 9'h000) && (|spc3_stb_state_ced0))
    spc3_atm_intrpt_capture0 <= 1'b1;
  else
    spc3_atm_intrpt_capture0 <= 1'b0;
end
always @(spc3_intrpt1_cmplt or spc3_atm_cntr1 or spc3_stb_state_ced1)
begin
  if (spc3_intrpt1_cmplt && (spc3_atm_cntr1 != 9'h000) && (|spc3_stb_state_ced1))
    spc3_atm_intrpt_capture1 <= 1'b1;
  else
    spc3_atm_intrpt_capture1 <= 1'b0;
end
always @(spc3_intrpt2_cmplt or spc3_atm_cntr2 or spc3_stb_state_ced2)
begin
  if (spc3_intrpt2_cmplt && (spc3_atm_cntr2 != 9'h000) && (|spc3_stb_state_ced2))
    spc3_atm_intrpt_capture2 <= 1'b1;
  else
    spc3_atm_intrpt_capture2 <= 1'b0;
end
always @(spc3_intrpt3_cmplt or spc3_atm_cntr3 or spc3_stb_state_ced3)
begin
  if (spc3_intrpt3_cmplt && (spc3_atm_cntr3 != 9'h000) && (|spc3_stb_state_ced3))
    spc3_atm_intrpt_capture3 <= 1'b1;
  else
    spc3_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc3_atm_cntr0 or spc3_dva_din or spc3_dva_wen)
begin
  if (~spc3_dva_din && spc3_dva_wen && (spc3_atm_cntr0 != 9'h000))
    spc3_atm_inv_capture0 <= 1'b1;
  else
    spc3_atm_inv_capture0 <= 1'b0;
end
always @(spc3_atm_cntr1 or spc3_dva_din or spc3_dva_wen)
begin
  if (~spc3_dva_din && spc3_dva_wen && (spc3_atm_cntr1 != 9'h000))
    spc3_atm_inv_capture1 <= 1'b1;
  else
    spc3_atm_inv_capture1 <= 1'b0;
end
always @(spc3_atm_cntr2 or spc3_dva_din or spc3_dva_wen)
begin
  if (~spc3_dva_din && spc3_dva_wen && (spc3_atm_cntr2 != 9'h000))
    spc3_atm_inv_capture2 <= 1'b1;
  else
    spc3_atm_inv_capture2 <= 1'b0;
end
always @(spc3_atm_cntr3 or spc3_dva_din or spc3_dva_wen)
begin
  if (~spc3_dva_din && spc3_dva_wen && (spc3_atm_cntr3 != 9'h000))
    spc3_atm_inv_capture3 <= 1'b1;
  else
    spc3_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc3_stb_state_vld0) && (spc3_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_atm_cntr0 <= 9'h000;
       spc3_atm0_d <= 1'b0;
      end
    else if( spc3_atomic_g && (spc3_atm_type0 != 8'h00))
      begin
       spc3_atm_cntr0 <= spc3_atm_cntr0 + 1;
       spc3_atm0_d <= 1'b1;
      end
    else if( spc3_atm0_d && (|spc3_stb_state_vld0))
      begin
       spc3_atm_cntr0 <= spc3_atm_cntr0 + 1;
       spc3_atm0_d <= spc3_atm0_d;
      end
    else
      begin
       spc3_atm_cntr0 <= spc3_atm_cntr0;
       spc3_atm0_d <= spc3_atm0_d;
      end
    if( ( ~(|spc3_stb_state_vld1) && (spc3_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_atm_cntr1 <= 9'h000;
       spc3_atm1_d <= 1'b0;
      end
    else if( spc3_atomic_g && (spc3_atm_type1 != 8'h00))
      begin
       spc3_atm_cntr1 <= spc3_atm_cntr1 + 1;
       spc3_atm1_d <= 1'b1;
      end
    else if( spc3_atm1_d && (|spc3_stb_state_vld1))
      begin
       spc3_atm_cntr1 <= spc3_atm_cntr1 + 1;
       spc3_atm1_d <= spc3_atm1_d;
      end
    else
      begin
       spc3_atm_cntr1 <= spc3_atm_cntr1;
       spc3_atm1_d <= spc3_atm1_d;
      end
    if( ( ~(|spc3_stb_state_vld2) && (spc3_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_atm_cntr2 <= 9'h000;
       spc3_atm2_d <= 1'b0;
      end
    else if( spc3_atomic_g && (spc3_atm_type2 != 8'h00))
      begin
       spc3_atm_cntr2 <= spc3_atm_cntr2 + 1;
       spc3_atm2_d <= 1'b1;
      end
    else if( spc3_atm2_d && (|spc3_stb_state_vld2))
      begin
       spc3_atm_cntr2 <= spc3_atm_cntr2 + 1;
       spc3_atm2_d <= spc3_atm2_d;
      end
    else
      begin
       spc3_atm_cntr2 <= spc3_atm_cntr2;
       spc3_atm2_d <= spc3_atm2_d;
      end
    if( ( ~(|spc3_stb_state_vld3) && (spc3_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_atm_cntr3 <= 9'h000;
       spc3_atm3_d <= 1'b0;
      end
    else if( spc3_atomic_g && (spc3_atm_type3 != 8'h00))
      begin
       spc3_atm_cntr3 <= spc3_atm_cntr3 + 1;
       spc3_atm3_d <= 1'b1;
      end
    else if( spc3_atm3_d && (|spc3_stb_state_vld3))
      begin
       spc3_atm_cntr3 <= spc3_atm_cntr3 + 1;
       spc3_atm3_d <= spc3_atm3_d;
      end
    else
      begin
       spc3_atm_cntr3 <= spc3_atm_cntr3;
       spc3_atm3_d <= spc3_atm3_d;
      end
end

 assign spc3_raw_ack_capture0 = spc3_stb_ack_vld0 && (spc3_stb_ack_cntr0 != 9'h000);
 assign spc3_stb_ced0 = |spc3_stb_state_ced0;
 assign spc3_raw_ack_capture1 = spc3_stb_ack_vld1 && (spc3_stb_ack_cntr1 != 9'h000);
 assign spc3_stb_ced1 = |spc3_stb_state_ced1;
 assign spc3_raw_ack_capture2 = spc3_stb_ack_vld2 && (spc3_stb_ack_cntr2 != 9'h000);
 assign spc3_stb_ced2 = |spc3_stb_state_ced2;
 assign spc3_raw_ack_capture3 = spc3_stb_ack_vld3 && (spc3_stb_ack_cntr3 != 9'h000);
 assign spc3_stb_ced3 = |spc3_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc3_stb_ced0 && (spc3_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ced_cntr0 <= 9'h000;
       spc3_stb_ced0_d <= 1'b0;
      end
    else if( spc3_stb_ced0 && (spc3_stb_state_ack0 == 8'h00))
      begin
       spc3_stb_ced_cntr0 <= spc3_stb_ced_cntr0 + 1;
       spc3_stb_ced0_d <= spc3_stb_ced0;
      end
    else
      begin
       spc3_stb_ced_cntr0 <= spc3_stb_ced_cntr0;
       spc3_stb_ced0_d <= spc3_stb_ced0_d;
      end

    if( ( ~spc3_mbar_vld0 && (spc3_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_mbar_vld_cntr0 <= 9'h000;
       spc3_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_mbar_vld_counter = %d", spc3_mbar_vld_cntr0);
      end
    else if( spc3_mbar_vld0)
      begin
       spc3_mbar_vld_cntr0 <= spc3_mbar_vld_cntr0 + 1;
       spc3_mbar_vld_d0 <= spc3_mbar_vld0;
      end
    else
      begin
       spc3_mbar_vld_cntr0 <= spc3_mbar_vld_cntr0;
       spc3_mbar_vld_d0 <= spc3_mbar_vld0;
      end

    if( ( ~spc3_flsh_vld0 && (spc3_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_flsh_vld_cntr0 <= 9'h000;
       spc3_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_flsh_vld_counter = %d", spc3_flsh_vld_cntr0);
      end
    else if( spc3_flsh_vld0)
      begin
       spc3_flsh_vld_cntr0 <= spc3_flsh_vld_cntr0 + 1;
       spc3_flsh_vld_d0 <= spc3_flsh_vld0;
      end
    else
      begin
       spc3_flsh_vld_cntr0 <= spc3_flsh_vld_cntr0;
       spc3_flsh_vld_d0 <= spc3_flsh_vld0;
      end

    if( ( ~spc3_stb_ced1 && (spc3_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ced_cntr1 <= 9'h000;
       spc3_stb_ced1_d <= 1'b0;
      end
    else if( spc3_stb_ced1 && (spc3_stb_state_ack1 == 8'h00))
      begin
       spc3_stb_ced_cntr1 <= spc3_stb_ced_cntr1 + 1;
       spc3_stb_ced1_d <= spc3_stb_ced1;
      end
    else
      begin
       spc3_stb_ced_cntr1 <= spc3_stb_ced_cntr1;
       spc3_stb_ced1_d <= spc3_stb_ced1_d;
      end

    if( ( ~spc3_mbar_vld1 && (spc3_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_mbar_vld_cntr1 <= 9'h000;
       spc3_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_mbar_vld_counter = %d", spc3_mbar_vld_cntr1);
      end
    else if( spc3_mbar_vld1)
      begin
       spc3_mbar_vld_cntr1 <= spc3_mbar_vld_cntr1 + 1;
       spc3_mbar_vld_d1 <= spc3_mbar_vld1;
      end
    else
      begin
       spc3_mbar_vld_cntr1 <= spc3_mbar_vld_cntr1;
       spc3_mbar_vld_d1 <= spc3_mbar_vld1;
      end

    if( ( ~spc3_flsh_vld1 && (spc3_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_flsh_vld_cntr1 <= 9'h000;
       spc3_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_flsh_vld_counter = %d", spc3_flsh_vld_cntr1);
      end
    else if( spc3_flsh_vld1)
      begin
       spc3_flsh_vld_cntr1 <= spc3_flsh_vld_cntr1 + 1;
       spc3_flsh_vld_d1 <= spc3_flsh_vld1;
      end
    else
      begin
       spc3_flsh_vld_cntr1 <= spc3_flsh_vld_cntr1;
       spc3_flsh_vld_d1 <= spc3_flsh_vld1;
      end

    if( ( ~spc3_stb_ced2 && (spc3_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ced_cntr2 <= 9'h000;
       spc3_stb_ced2_d <= 1'b0;
      end
    else if( spc3_stb_ced2 && (spc3_stb_state_ack2 == 8'h00))
      begin
       spc3_stb_ced_cntr2 <= spc3_stb_ced_cntr2 + 1;
       spc3_stb_ced2_d <= spc3_stb_ced2;
      end
    else
      begin
       spc3_stb_ced_cntr2 <= spc3_stb_ced_cntr2;
       spc3_stb_ced2_d <= spc3_stb_ced2_d;
      end

    if( ( ~spc3_mbar_vld2 && (spc3_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_mbar_vld_cntr2 <= 9'h000;
       spc3_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_mbar_vld_counter = %d", spc3_mbar_vld_cntr2);
      end
    else if( spc3_mbar_vld2)
      begin
       spc3_mbar_vld_cntr2 <= spc3_mbar_vld_cntr2 + 1;
       spc3_mbar_vld_d2 <= spc3_mbar_vld2;
      end
    else
      begin
       spc3_mbar_vld_cntr2 <= spc3_mbar_vld_cntr2;
       spc3_mbar_vld_d2 <= spc3_mbar_vld2;
      end

    if( ( ~spc3_flsh_vld2 && (spc3_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_flsh_vld_cntr2 <= 9'h000;
       spc3_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_flsh_vld_counter = %d", spc3_flsh_vld_cntr2);
      end
    else if( spc3_flsh_vld2)
      begin
       spc3_flsh_vld_cntr2 <= spc3_flsh_vld_cntr2 + 1;
       spc3_flsh_vld_d2 <= spc3_flsh_vld2;
      end
    else
      begin
       spc3_flsh_vld_cntr2 <= spc3_flsh_vld_cntr2;
       spc3_flsh_vld_d2 <= spc3_flsh_vld2;
      end

    if( ( ~spc3_stb_ced3 && (spc3_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ced_cntr3 <= 9'h000;
       spc3_stb_ced3_d <= 1'b0;
      end
    else if( spc3_stb_ced3 && (spc3_stb_state_ack3 == 8'h00))
      begin
       spc3_stb_ced_cntr3 <= spc3_stb_ced_cntr3 + 1;
       spc3_stb_ced3_d <= spc3_stb_ced3;
      end
    else
      begin
       spc3_stb_ced_cntr3 <= spc3_stb_ced_cntr3;
       spc3_stb_ced3_d <= spc3_stb_ced3_d;
      end

    if( ( ~spc3_mbar_vld3 && (spc3_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_mbar_vld_cntr3 <= 9'h000;
       spc3_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_mbar_vld_counter = %d", spc3_mbar_vld_cntr3);
      end
    else if( spc3_mbar_vld3)
      begin
       spc3_mbar_vld_cntr3 <= spc3_mbar_vld_cntr3 + 1;
       spc3_mbar_vld_d3 <= spc3_mbar_vld3;
      end
    else
      begin
       spc3_mbar_vld_cntr3 <= spc3_mbar_vld_cntr3;
       spc3_mbar_vld_d3 <= spc3_mbar_vld3;
      end

    if( ( ~spc3_flsh_vld3 && (spc3_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_flsh_vld_cntr3 <= 9'h000;
       spc3_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_flsh_vld_counter = %d", spc3_flsh_vld_cntr3);
      end
    else if( spc3_flsh_vld3)
      begin
       spc3_flsh_vld_cntr3 <= spc3_flsh_vld_cntr3 + 1;
       spc3_flsh_vld_d3 <= spc3_flsh_vld3;
      end
    else
      begin
       spc3_flsh_vld_cntr3 <= spc3_flsh_vld_cntr3;
       spc3_flsh_vld_d3 <= spc3_flsh_vld3;
      end

end

always @(spc3_flsh_vld_d0 or spc3_flsh_vld0)
begin
  if (spc3_flsh_vld_d0 && ~spc3_flsh_vld0)
    spc3_flsh_vld_capture0 <= 1'b1;
  else
    spc3_flsh_vld_capture0 <= 1'b0;
end
always @(spc3_flsh_vld_d1 or spc3_flsh_vld1)
begin
  if (spc3_flsh_vld_d1 && ~spc3_flsh_vld1)
    spc3_flsh_vld_capture1 <= 1'b1;
  else
    spc3_flsh_vld_capture1 <= 1'b0;
end
always @(spc3_flsh_vld_d2 or spc3_flsh_vld2)
begin
  if (spc3_flsh_vld_d2 && ~spc3_flsh_vld2)
    spc3_flsh_vld_capture2 <= 1'b1;
  else
    spc3_flsh_vld_capture2 <= 1'b0;
end
always @(spc3_flsh_vld_d3 or spc3_flsh_vld3)
begin
  if (spc3_flsh_vld_d3 && ~spc3_flsh_vld3)
    spc3_flsh_vld_capture3 <= 1'b1;
  else
    spc3_flsh_vld_capture3 <= 1'b0;
end

always @(spc3_lmiss_pa0 or spc3_imiss_pa or spc3_imiss_vld_d or spc3_lmiss_vld0)
begin
if((spc3_lmiss_pa0 == spc3_imiss_pa) && spc3_imiss_vld_d && spc3_lmiss_vld0)
 spc3_lmiss_eq0 = 1'b1;
else
 spc3_lmiss_eq0 = 1'b0;
end
always @(spc3_lmiss_pa1 or spc3_imiss_pa or spc3_imiss_vld_d or spc3_lmiss_vld1)
begin
if((spc3_lmiss_pa1 == spc3_imiss_pa) && spc3_imiss_vld_d && spc3_lmiss_vld1)
 spc3_lmiss_eq1 = 1'b1;
else
 spc3_lmiss_eq1 = 1'b0;
end
always @(spc3_lmiss_pa2 or spc3_imiss_pa or spc3_imiss_vld_d or spc3_lmiss_vld2)
begin
if((spc3_lmiss_pa2 == spc3_imiss_pa) && spc3_imiss_vld_d && spc3_lmiss_vld2)
 spc3_lmiss_eq2 = 1'b1;
else
 spc3_lmiss_eq2 = 1'b0;
end
always @(spc3_lmiss_pa3 or spc3_imiss_pa or spc3_imiss_vld_d or spc3_lmiss_vld3)
begin
if((spc3_lmiss_pa3 == spc3_imiss_pa) && spc3_imiss_vld_d && spc3_lmiss_vld3)
 spc3_lmiss_eq3 = 1'b1;
else
 spc3_lmiss_eq3 = 1'b0;
end

always @(spc3_lmiss_pa0 or spc3_stb_atm_addr0 or spc3_atm_cntr0 or spc3_lmiss_vld0)
begin
if ( ((spc3_lmiss_pa0 == spc3_stb_atm_addr0) && (spc3_atm_cntr0 != 9'h000) && spc3_lmiss_vld0) ||
     ((spc3_lmiss_pa1 == spc3_stb_atm_addr0) && (spc3_atm_cntr0 != 9'h000) && spc3_lmiss_vld1) ||
     ((spc3_lmiss_pa2 == spc3_stb_atm_addr0) && (spc3_atm_cntr0 != 9'h000) && spc3_lmiss_vld2) ||
     ((spc3_lmiss_pa3 == spc3_stb_atm_addr0) && (spc3_atm_cntr0 != 9'h000) && spc3_lmiss_vld3) )

 spc3_atm_lmiss_eq0 = 1'b1;
else
 spc3_atm_lmiss_eq0 = 1'b0;
end
always @(spc3_lmiss_pa1 or spc3_stb_atm_addr1 or spc3_atm_cntr1 or spc3_lmiss_vld1)
begin
if ( ((spc3_lmiss_pa0 == spc3_stb_atm_addr1) && (spc3_atm_cntr1 != 9'h000) && spc3_lmiss_vld0) ||
     ((spc3_lmiss_pa1 == spc3_stb_atm_addr1) && (spc3_atm_cntr1 != 9'h000) && spc3_lmiss_vld1) ||
     ((spc3_lmiss_pa2 == spc3_stb_atm_addr1) && (spc3_atm_cntr1 != 9'h000) && spc3_lmiss_vld2) ||
     ((spc3_lmiss_pa3 == spc3_stb_atm_addr1) && (spc3_atm_cntr1 != 9'h000) && spc3_lmiss_vld3) )

 spc3_atm_lmiss_eq1 = 1'b1;
else
 spc3_atm_lmiss_eq1 = 1'b0;
end
always @(spc3_lmiss_pa2 or spc3_stb_atm_addr2 or spc3_atm_cntr2 or spc3_lmiss_vld2)
begin
if ( ((spc3_lmiss_pa0 == spc3_stb_atm_addr2) && (spc3_atm_cntr2 != 9'h000) && spc3_lmiss_vld0) ||
     ((spc3_lmiss_pa1 == spc3_stb_atm_addr2) && (spc3_atm_cntr2 != 9'h000) && spc3_lmiss_vld1) ||
     ((spc3_lmiss_pa2 == spc3_stb_atm_addr2) && (spc3_atm_cntr2 != 9'h000) && spc3_lmiss_vld2) ||
     ((spc3_lmiss_pa3 == spc3_stb_atm_addr2) && (spc3_atm_cntr2 != 9'h000) && spc3_lmiss_vld3) )

 spc3_atm_lmiss_eq2 = 1'b1;
else
 spc3_atm_lmiss_eq2 = 1'b0;
end
always @(spc3_lmiss_pa3 or spc3_stb_atm_addr3 or spc3_atm_cntr3 or spc3_lmiss_vld3)
begin
if ( ((spc3_lmiss_pa0 == spc3_stb_atm_addr3) && (spc3_atm_cntr3 != 9'h000) && spc3_lmiss_vld0) ||
     ((spc3_lmiss_pa1 == spc3_stb_atm_addr3) && (spc3_atm_cntr3 != 9'h000) && spc3_lmiss_vld1) ||
     ((spc3_lmiss_pa2 == spc3_stb_atm_addr3) && (spc3_atm_cntr3 != 9'h000) && spc3_lmiss_vld2) ||
     ((spc3_lmiss_pa3 == spc3_stb_atm_addr3) && (spc3_atm_cntr3 != 9'h000) && spc3_lmiss_vld3) )

 spc3_atm_lmiss_eq3 = 1'b1;
else
 spc3_atm_lmiss_eq3 = 1'b0;
end

always @(spc3_imiss_pa or spc3_stb_atm_addr0 or spc3_atm_cntr0 or spc3_imiss_vld_d)
begin
if((spc3_imiss_pa == spc3_stb_atm_addr0) && (spc3_atm_cntr0 != 9'h000) && spc3_imiss_vld_d)
 spc3_atm_imiss_eq0 = 1'b1;
else
 spc3_atm_imiss_eq0 = 1'b0;
end
always @(spc3_imiss_pa or spc3_stb_atm_addr1 or spc3_atm_cntr1 or spc3_imiss_vld_d)
begin
if((spc3_imiss_pa == spc3_stb_atm_addr1) && (spc3_atm_cntr1 != 9'h000) && spc3_imiss_vld_d)
 spc3_atm_imiss_eq1 = 1'b1;
else
 spc3_atm_imiss_eq1 = 1'b0;
end
always @(spc3_imiss_pa or spc3_stb_atm_addr2 or spc3_atm_cntr2 or spc3_imiss_vld_d)
begin
if((spc3_imiss_pa == spc3_stb_atm_addr2) && (spc3_atm_cntr2 != 9'h000) && spc3_imiss_vld_d)
 spc3_atm_imiss_eq2 = 1'b1;
else
 spc3_atm_imiss_eq2 = 1'b0;
end
always @(spc3_imiss_pa or spc3_stb_atm_addr3 or spc3_atm_cntr3 or spc3_imiss_vld_d)
begin
if((spc3_imiss_pa == spc3_stb_atm_addr3) && (spc3_atm_cntr3 != 9'h000) && spc3_imiss_vld_d)
 spc3_atm_imiss_eq3 = 1'b1;
else
 spc3_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc3_imiss_vld || ~rst_l)
   spc3_imiss_vld_d <= 1'b0;
 else
   spc3_imiss_vld_d <= spc3_imiss_vld;

 if( ~spc3_ld_miss || ~rst_l)
   spc3_ld_miss_capture <= 1'b0;
 else
   spc3_ld_miss_capture <= spc3_ld_miss;

end

always @(spc3_stb_ced0 or spc3_stb_ced0_d)
begin
if (~spc3_stb_ced0 && spc3_stb_ced0_d)
spc3_stb_ced_capture0 <= 1'b1;
else
spc3_stb_ced_capture0 <= 1'b0;

end
always @(spc3_stb_ced1 or spc3_stb_ced1_d)
begin
if (~spc3_stb_ced1 && spc3_stb_ced1_d)
spc3_stb_ced_capture1 <= 1'b1;
else
spc3_stb_ced_capture1 <= 1'b0;

end
always @(spc3_stb_ced2 or spc3_stb_ced2_d)
begin
if (~spc3_stb_ced2 && spc3_stb_ced2_d)
spc3_stb_ced_capture2 <= 1'b1;
else
spc3_stb_ced_capture2 <= 1'b0;

end
always @(spc3_stb_ced3 or spc3_stb_ced3_d)
begin
if (~spc3_stb_ced3 && spc3_stb_ced3_d)
spc3_stb_ced_capture3 <= 1'b1;
else
spc3_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc3_stb_state_ack0 != 8'h00 && (spc3_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_ack_counter0 = %d", spc3_stb_ack_cntr0);
      end
    else if(spc3_stb_cam_hit && spc3_ld0_inst_vld_g && (spc3_stb_state_ack0 == 8'h00))
      begin
       spc3_stb_ack_cntr0 <= spc3_stb_ack_cntr0 + 1;
      end
    else if( (spc3_stb_state_ack0 == 8'h00 ) && (spc3_stb_ack_cntr0 != 9'h000))
      begin
       spc3_stb_ack_cntr0 <= spc3_stb_ack_cntr0 + 1;
      end // if ( (spc3_stb_state_ack0 == 8'h00 ) && (spc3_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc3_stb_ack_cntr0 <= spc3_stb_ack_cntr0;
      end

    if( (spc3_stb_state_ack1 != 8'h00 && (spc3_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_ack_counter1 = %d", spc3_stb_ack_cntr1);
      end
    else if(spc3_stb_cam_hit && spc3_ld1_inst_vld_g && (spc3_stb_state_ack1 == 8'h00))
      begin
       spc3_stb_ack_cntr1 <= spc3_stb_ack_cntr1 + 1;
      end
    else if( (spc3_stb_state_ack1 == 8'h00 ) && (spc3_stb_ack_cntr1 != 9'h000))
      begin
       spc3_stb_ack_cntr1 <= spc3_stb_ack_cntr1 + 1;
      end // if ( (spc3_stb_state_ack1 == 8'h00 ) && (spc3_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc3_stb_ack_cntr1 <= spc3_stb_ack_cntr1;
      end

    if( (spc3_stb_state_ack2 != 8'h00 && (spc3_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_ack_counter2 = %d", spc3_stb_ack_cntr2);
      end
    else if(spc3_stb_cam_hit && spc3_ld2_inst_vld_g && (spc3_stb_state_ack2 == 8'h00))
      begin
       spc3_stb_ack_cntr2 <= spc3_stb_ack_cntr2 + 1;
      end
    else if( (spc3_stb_state_ack2 == 8'h00 ) && (spc3_stb_ack_cntr2 != 9'h000))
      begin
       spc3_stb_ack_cntr2 <= spc3_stb_ack_cntr2 + 1;
      end // if ( (spc3_stb_state_ack2 == 8'h00 ) && (spc3_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc3_stb_ack_cntr2 <= spc3_stb_ack_cntr2;
      end

    if( (spc3_stb_state_ack3 != 8'h00 && (spc3_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_ack_counter3 = %d", spc3_stb_ack_cntr3);
      end
    else if(spc3_stb_cam_hit && spc3_ld3_inst_vld_g && (spc3_stb_state_ack3 == 8'h00))
      begin
       spc3_stb_ack_cntr3 <= spc3_stb_ack_cntr3 + 1;
      end
    else if( (spc3_stb_state_ack3 == 8'h00 ) && (spc3_stb_ack_cntr3 != 9'h000))
      begin
       spc3_stb_ack_cntr3 <= spc3_stb_ack_cntr3 + 1;
      end // if ( (spc3_stb_state_ack3 == 8'h00 ) && (spc3_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc3_stb_ack_cntr3 <= spc3_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc3_stb0_full_w2 or spc3_stb0_full)
begin
if (~spc3_stb0_full_w2 && spc3_stb0_full)
spc3_stb_full_capture0 <= 1'b1;
else
spc3_stb_full_capture0 <= 1'b0;

end
always @(spc3_stb1_full_w2 or spc3_stb1_full)
begin
if (~spc3_stb1_full_w2 && spc3_stb1_full)
spc3_stb_full_capture1 <= 1'b1;
else
spc3_stb_full_capture1 <= 1'b0;

end
always @(spc3_stb2_full_w2 or spc3_stb2_full)
begin
if (~spc3_stb2_full_w2 && spc3_stb2_full)
spc3_stb_full_capture2 <= 1'b1;
else
spc3_stb_full_capture2 <= 1'b0;

end
always @(spc3_stb3_full_w2 or spc3_stb3_full)
begin
if (~spc3_stb3_full_w2 && spc3_stb3_full)
spc3_stb_full_capture3 <= 1'b1;
else
spc3_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc3_stb0_full && (spc3_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_full_counter0 = %d", spc3_stb_full_cntr0);
      end
    else if( spc3_stb0_full)
      begin
       spc3_stb_full_cntr0 <= spc3_stb_full_cntr0 + 1;
      end
    else
      begin
       spc3_stb_full_cntr0 <= spc3_stb_full_cntr0;
      end
    if( ( ~spc3_stb1_full && (spc3_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_full_counter1 = %d", spc3_stb_full_cntr1);
      end
    else if( spc3_stb1_full)
      begin
       spc3_stb_full_cntr1 <= spc3_stb_full_cntr1 + 1;
      end
    else
      begin
       spc3_stb_full_cntr1 <= spc3_stb_full_cntr1;
      end
    if( ( ~spc3_stb2_full && (spc3_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_full_counter2 = %d", spc3_stb_full_cntr2);
      end
    else if( spc3_stb2_full)
      begin
       spc3_stb_full_cntr2 <= spc3_stb_full_cntr2 + 1;
      end
    else
      begin
       spc3_stb_full_cntr2 <= spc3_stb_full_cntr2;
      end
    if( ( ~spc3_stb3_full && (spc3_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc3_stb_full_counter3 = %d", spc3_stb_full_cntr3);
      end
    else if( spc3_stb3_full)
      begin
       spc3_stb_full_cntr3 <= spc3_stb_full_cntr3 + 1;
      end
    else
      begin
       spc3_stb_full_cntr3 <= spc3_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc3_lmq0_full_d or spc3_lmq0_full)
begin
if (spc3_lmq0_full_d && ~spc3_lmq0_full)
spc3_lmq_full_capture0 <= 1'b1;
else
spc3_lmq_full_capture0 <= 1'b0;

end
always @(spc3_lmq1_full_d or spc3_lmq1_full)
begin
if (spc3_lmq1_full_d && ~spc3_lmq1_full)
spc3_lmq_full_capture1 <= 1'b1;
else
spc3_lmq_full_capture1 <= 1'b0;

end
always @(spc3_lmq2_full_d or spc3_lmq2_full)
begin
if (spc3_lmq2_full_d && ~spc3_lmq2_full)
spc3_lmq_full_capture2 <= 1'b1;
else
spc3_lmq_full_capture2 <= 1'b0;

end
always @(spc3_lmq3_full_d or spc3_lmq3_full)
begin
if (spc3_lmq3_full_d && ~spc3_lmq3_full)
spc3_lmq_full_capture3 <= 1'b1;
else
spc3_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc3_lmq0_full && (spc3_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc3_lmq_full_cntr0 <= 9'h000;
       spc3_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_lmq_full_counter0 = %d", spc3_lmq_full_cntr0);
      end
    else if( spc3_lmq0_full)
      begin
       spc3_lmq_full_cntr0 <= spc3_lmq_full_cntr0 + 1;
       spc3_lmq0_full_d <= spc3_lmq0_full;
      end
    else
      begin
       spc3_lmq_full_cntr0 <= spc3_lmq_full_cntr0;
       spc3_lmq0_full_d <= spc3_lmq0_full;
      end

    if( ( ~spc3_lmq1_full && (spc3_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc3_lmq_full_cntr1 <= 9'h000;
       spc3_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_lmq_full_counter1 = %d", spc3_lmq_full_cntr1);
      end
    else if( spc3_lmq1_full)
      begin
       spc3_lmq_full_cntr1 <= spc3_lmq_full_cntr1 + 1;
       spc3_lmq1_full_d <= spc3_lmq1_full;
      end
    else
      begin
       spc3_lmq_full_cntr1 <= spc3_lmq_full_cntr1;
       spc3_lmq1_full_d <= spc3_lmq1_full;
      end

    if( ( ~spc3_lmq2_full && (spc3_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc3_lmq_full_cntr2 <= 9'h000;
       spc3_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_lmq_full_counter2 = %d", spc3_lmq_full_cntr2);
      end
    else if( spc3_lmq2_full)
      begin
       spc3_lmq_full_cntr2 <= spc3_lmq_full_cntr2 + 1;
       spc3_lmq2_full_d <= spc3_lmq2_full;
      end
    else
      begin
       spc3_lmq_full_cntr2 <= spc3_lmq_full_cntr2;
       spc3_lmq2_full_d <= spc3_lmq2_full;
      end

    if( ( ~spc3_lmq3_full && (spc3_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc3_lmq_full_cntr3 <= 9'h000;
       spc3_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_lmq_full_counter3 = %d", spc3_lmq_full_cntr3);
      end
    else if( spc3_lmq3_full)
      begin
       spc3_lmq_full_cntr3 <= spc3_lmq_full_cntr3 + 1;
       spc3_lmq3_full_d <= spc3_lmq3_full;
      end
    else
      begin
       spc3_lmq_full_cntr3 <= spc3_lmq_full_cntr3;
       spc3_lmq3_full_d <= spc3_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc3_dfq_full_d or spc3_dfq_full)
begin
  if (spc3_dfq_full_d && ~spc3_dfq_full)
    spc3_dfq_full_capture <= 1'b1;
  else
    spc3_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc3_dfq_full && (spc3_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc3_dfq_full_cntr <= 9'h000;
       spc3_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dfq_full_counter = %d", spc3_dfq_full_cntr);
      end
    else if( spc3_dfq_full)
      begin
       spc3_dfq_full_cntr <= spc3_dfq_full_cntr + 1;
       spc3_dfq_full_d <= spc3_dfq_full;
      end
    else
      begin
       spc3_dfq_full_cntr <= spc3_dfq_full_cntr;
       spc3_dfq_full_d <= spc3_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc3_dva_full_d or spc3_dva_inv)
begin
  if (spc3_dva_full_d && ~spc3_dva_inv)
    spc3_dva_full_capture <= 1'b1;
  else
    spc3_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc3_dva_din && spc3_dva_wen)
    begin
     spc3_dva_inv <= 1'b1;
     spc3_dva_waddr_d <= spc3_dva_waddr;
    end
  else if(~spc3_dva_din && spc3_dva_wen)
    begin
     spc3_dva_inv <= 1'b0;
     spc3_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc3_dva_inv <= spc3_dva_inv;
     spc3_dva_waddr_d <= spc3_dva_waddr_d;
    end
end

always @(spc3_dva_raddr or spc3_dva_ren or spc3_dva_inv)
begin
  if (spc3_dva_inv && spc3_dva_ren && (spc3_dva_raddr[6:2] == spc3_dva_waddr_d))
    spc3_dva_vld2lkup <= 1'b1;
  else
    spc3_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc3_dva_inv && (spc3_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc3_dva_full_cntr <= 9'h000;
       spc3_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc3_dva_full_counter = %d", spc3_dva_full_cntr);
      end
    else if( spc3_dva_inv)
      begin
       spc3_dva_full_cntr <= spc3_dva_full_cntr + 1;
       spc3_dva_full_d <= spc3_dva_inv;
      end
    else
      begin
       spc3_dva_full_cntr <= spc3_dva_full_cntr;
       spc3_dva_full_d <= spc3_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc3_dva_vfull_d or spc3_dva_vld)
begin
  if (spc3_dva_vfull_d && ~spc3_dva_vld)
    spc3_dva_vfull_capture <= 1'b1;
  else
    spc3_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc3_dva_din && spc3_dva_wen)
   begin
    spc3_dva_vld <= 1'b1;
    spc3_dva_invwaddr_d <= spc3_dva_waddr;
    spc3_dva_invld_err <= spc3_dva_inv_perror;
   end
  else if(spc3_dva_din && spc3_dva_wen)
    begin
     spc3_dva_vld <= 1'b0;
     spc3_dva_invwaddr_d <= 5'b00000;
     spc3_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc3_dva_vld <= spc3_dva_vld;
     spc3_dva_invwaddr_d <= spc3_dva_invwaddr_d;
     spc3_dva_invld_err <= spc3_dva_invld_err;
    end
end


always @(spc3_dva_raddr or spc3_dva_ren or spc3_dva_vld)
begin
  if (spc3_dva_vld && spc3_dva_ren && (spc3_dva_raddr[6:2] == spc3_dva_waddr_d))
    spc3_dva_invld2lkup <= 1'b1;
  else
    spc3_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc3_dva_vld && (spc3_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc3_dva_vfull_cntr <= 9'h000;
    spc3_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc3_dva_vfull_counter = %d", spc3_dva_vfull_cntr);
  end
    else if( spc3_dva_vld)
    begin
      spc3_dva_vfull_cntr <= spc3_dva_vfull_cntr + 1;
      spc3_dva_vfull_d <= spc3_dva_vld;
    end
    else
    begin
      spc3_dva_vfull_cntr <= spc3_dva_vfull_cntr;
      spc3_dva_vfull_d <= spc3_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc3_dva_raddr or spc3_dva_waddr or spc3_dva_ren or spc3_dva_wen)
begin
  if ( spc3_dva_ren && spc3_dva_wen && (spc3_dva_raddr[6:2] == spc3_dva_waddr))
    spc3_dva_collide <= 1'b1;
  else
    spc3_dva_collide <= 1'b0;
end

// dva error cases

always @(spc3_dva_raddr or spc3_dva_ren or spc3_dva_dtag_perror or spc3_dva_dtag_perror)
begin
  if (spc3_dva_ren && (spc3_dva_dtag_perror || spc3_dva_dtag_perror))
    spc3_dva_err <= 1'b1;
  else
    spc3_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc3_dva_err)
     spc3_dva_efull_d <= 1'b1;
  else
     spc3_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc3_dva_ren && ~(spc3_dva_dtag_perror || spc3_dva_dtag_perror ) &&
       (spc3_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc3_dva_efull_cntr <= 9'h000;
     spc3_dva_raddr_d <= spc3_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc3_dva_efull_counter = %d", spc3_dva_efull_cntr);
    end
  else if(spc3_dva_efull_d)
    begin
      spc3_dva_efull_cntr <= spc3_dva_efull_cntr + 1;
      spc3_dva_raddr_d <= spc3_dva_raddr_d;
    end
  else
    begin
      spc3_dva_efull_cntr <= spc3_dva_efull_cntr;
      spc3_dva_raddr_d <= spc3_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC4

wire 	   spc4_dva_ren 	        = `SPARC_CORE4.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc4_dva_wen 	        = `SPARC_CORE4.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc4_dva_din 	        = `SPARC_CORE4.sparc0.lsu.dva_din_e;
wire [3:0] spc4_dva_dout 	        = `SPARC_CORE4.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc4_dva_raddr 	        = `SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc4_dva_waddr 	        = `SPARC_CORE4.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc4_dva_dtag_perror 	= `SPARC_CORE4.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc4_dva_dcache_perror 	= `SPARC_CORE4.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc4_dva_inv_perror 	= `SPARC_CORE4.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc4_ld_miss 	        = `SPARC_CORE4.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc4_ld_miss_capture;

wire 	   spc4_atomic_g 	        = `SPARC_CORE4.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc4_atm_type0 	= `SPARC_CORE4.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc4_atm_type1 	= `SPARC_CORE4.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc4_atm_type2 	= `SPARC_CORE4.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc4_atm_type3 	= `SPARC_CORE4.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc4_dctl_lsu_way_hit 	= `SPARC_CORE4.sparc0.lsu.dctl.lsu_way_hit;
wire       spc4_dctl_dcache_enable_g 	= `SPARC_CORE4.sparc0.lsu.dctl.dcache_enable_g;
wire       spc4_dctl_ldxa_internal 	= `SPARC_CORE4.sparc0.lsu.dctl.ldxa_internal;
wire       spc4_dctl_ldst_dbl_g 	= `SPARC_CORE4.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc4_dctl_atomic_g 	= `SPARC_CORE4.sparc0.lsu.dctl.atomic_g;
wire       spc4_dctl_stb_cam_hit 	= `SPARC_CORE4.sparc0.lsu.dctl.stb_cam_hit;
wire       spc4_dctl_endian_mispred_g 	= `SPARC_CORE4.sparc0.lsu.dctl.endian_mispred_g;
wire       spc4_dctl_dcache_rd_parity_error 	= `SPARC_CORE4.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc4_dctl_dtag_perror_g 	= `SPARC_CORE4.sparc0.lsu.dctl.dtag_perror_g;
wire       spc4_dctl_tte_data_perror_unc 	= `SPARC_CORE4.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc4_dctl_ld_inst_vld_g 	= `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc4_dctl_lsu_alt_space_g 	= `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc4_dctl_recognized_asi_g 	= `SPARC_CORE4.sparc0.lsu.dctl.recognized_asi_g;
wire       spc4_dctl_ncache_asild_rq_g  = `SPARC_CORE4.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc4_dctl_bld_hit;
wire       spc4_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc4_ixinv0  = `SPARC_CORE4.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc4_ixinv1  = `SPARC_CORE4.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc4_ixinv2  = `SPARC_CORE4.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc4_ixinv3  = `SPARC_CORE4.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc4_ifill  = `SPARC_CORE4.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc4_inv  = `SPARC_CORE4.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc4_inv_clr  = `SPARC_CORE4.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc4_ibuf_busy  = `SPARC_CORE4.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc4_l2  = `SPARC_CORE4.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc4_unc  = `SPARC_CORE4.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc4_fpld  = `SPARC_CORE4.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc4_fpldst  = `SPARC_CORE4.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc4_unflush  = `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc4_ldw  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc4_byp  = `SPARC_CORE4.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc4_flsh  = `SPARC_CORE4.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc4_chm  = `SPARC_CORE4.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc4_ldxa  = `SPARC_CORE4.sparc0.lsu.dctl.ldxa_internal ;
wire       spc4_ato  = `SPARC_CORE4.sparc0.lsu.dctl.atomic_g ;
wire       spc4_pref  = `SPARC_CORE4.sparc0.lsu.dctl.pref_inst_g ;
wire       spc4_chit  = `SPARC_CORE4.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc4_dcp  = `SPARC_CORE4.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc4_dtp  = `SPARC_CORE4.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc4_mpc  = `SPARC_CORE4.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc4_mpc  = 1'b0;
wire       spc4_mpu  = `SPARC_CORE4.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc4_exu_und;
reg  [4:0] spc4_exu;

// excptn
wire spc4_exp_wtchpt_trp_g                    = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc4_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc4_exp_priv_violtn_g                    = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc4_exp_daccess_excptn_g                 = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc4_exp_daccess_prot_g                   = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc4_exp_priv_action_g                    = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc4_exp_spec_access_epage_g              = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc4_exp_uncache_atomic_g                 = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc4_exp_illegal_asi_action_g             = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc4_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc4_exp_asi_rd_unc                       = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc4_exp_tlb_data_ce                     = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc4_exp_asi_rd_unc                       = 1'b0;
wire spc4_exp_tlb_data_ce                     =  1'b0;

wire spc4_exp_tlb_data_ue                     = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc4_exp_tlb_tag_ue                      = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc4_exp_unc                  = `SPARC_CORE4.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc4_exp_corr                 = `SPARC_CORE4.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc4_exp_corr                 = 1'b0;
wire [15:0] spc4_exp_und;
reg  [4:0] spc4_exp;
// dctl cmplt

wire       spc4_dctl_stxa_internal_d2  = `SPARC_CORE4.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc4_dctl_lsu_l2fill_vld  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc4_dctl_atomic_ld_squash_e  = `SPARC_CORE4.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc4_dctl_lsu_ignore_fill  = `SPARC_CORE4.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc4_dctl_l2fill_fpld_e  = `SPARC_CORE4.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc4_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc4_dctl_fill_err_trap_e  = `SPARC_CORE4.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc4_dctl_l2_corr_error_e  = `SPARC_CORE4.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc4_dctl_intld_byp_cmplt  = `SPARC_CORE4.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc4_dctl_lsu_intrpt_cmplt  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc4_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE4.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc4_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE4.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc4_dctl_lsu_pcx_pref_issue  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc4_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE4.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc4_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc4_ldstcond_cmplt_d;

wire       spc4_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE4.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc4_qctl1_ld0_inst_vld_g  = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc4_ld0_pkt_vld_unmasked  = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc4_ld0_pkt_vld_unmasked_d;
reg	   spc4_qctl1_ld_sec_hit_thrd0_w2;

wire       spc4_dctl_thread0_w3  = `SPARC_CORE4.sparc0.lsu.dctl.thread0_w3;
wire       spc4_dctl_dfill_thread0  = `SPARC_CORE4.sparc0.lsu.dctl.dfill_thread0;
wire       spc4_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc4_dctl_diag_wr_cmplt0  = `SPARC_CORE4.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc4_dctl_bsync0_reset  = `SPARC_CORE4.sparc0.lsu.dctl.bsync0_reset;
wire       spc4_dctl_late_cmplt0  = `SPARC_CORE4.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc4_dctl_stxa_cmplt0;
wire       spc4_dctl_l2fill_cmplt0;
wire       spc4_dctl_atm_cmplt0;
wire       spc4_dctl_fillerr0;
wire [4:0] spc4_cmplt0;
wire [5:0] spc4_dctl_ldst_cond_cmplt0;
reg  [3:0] spc4_ldstcond_cmplt0;
reg  [3:0] spc4_ldstcond_cmplt0_d;

wire       spc4_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE4.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc4_qctl1_ld1_inst_vld_g  = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc4_ld1_pkt_vld_unmasked  = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc4_ld1_pkt_vld_unmasked_d;
reg	   spc4_qctl1_ld_sec_hit_thrd1_w2;

wire       spc4_dctl_thread1_w3  = `SPARC_CORE4.sparc0.lsu.dctl.thread1_w3;
wire       spc4_dctl_dfill_thread1  = `SPARC_CORE4.sparc0.lsu.dctl.dfill_thread1;
wire       spc4_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc4_dctl_diag_wr_cmplt1  = `SPARC_CORE4.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc4_dctl_bsync1_reset  = `SPARC_CORE4.sparc0.lsu.dctl.bsync1_reset;
wire       spc4_dctl_late_cmplt1  = `SPARC_CORE4.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc4_dctl_stxa_cmplt1;
wire       spc4_dctl_l2fill_cmplt1;
wire       spc4_dctl_atm_cmplt1;
wire       spc4_dctl_fillerr1;
wire [4:0] spc4_cmplt1;
wire [5:0] spc4_dctl_ldst_cond_cmplt1;
reg  [3:0] spc4_ldstcond_cmplt1;
reg  [3:0] spc4_ldstcond_cmplt1_d;

wire       spc4_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE4.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc4_qctl1_ld2_inst_vld_g  = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc4_ld2_pkt_vld_unmasked  = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc4_ld2_pkt_vld_unmasked_d;
reg	   spc4_qctl1_ld_sec_hit_thrd2_w2;

wire       spc4_dctl_thread2_w3  = `SPARC_CORE4.sparc0.lsu.dctl.thread2_w3;
wire       spc4_dctl_dfill_thread2  = `SPARC_CORE4.sparc0.lsu.dctl.dfill_thread2;
wire       spc4_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc4_dctl_diag_wr_cmplt2  = `SPARC_CORE4.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc4_dctl_bsync2_reset  = `SPARC_CORE4.sparc0.lsu.dctl.bsync2_reset;
wire       spc4_dctl_late_cmplt2  = `SPARC_CORE4.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc4_dctl_stxa_cmplt2;
wire       spc4_dctl_l2fill_cmplt2;
wire       spc4_dctl_atm_cmplt2;
wire       spc4_dctl_fillerr2;
wire [4:0] spc4_cmplt2;
wire [5:0] spc4_dctl_ldst_cond_cmplt2;
reg  [3:0] spc4_ldstcond_cmplt2;
reg  [3:0] spc4_ldstcond_cmplt2_d;

wire       spc4_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE4.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc4_qctl1_ld3_inst_vld_g  = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc4_ld3_pkt_vld_unmasked  = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc4_ld3_pkt_vld_unmasked_d;
reg	   spc4_qctl1_ld_sec_hit_thrd3_w2;

wire       spc4_dctl_thread3_w3  = `SPARC_CORE4.sparc0.lsu.dctl.thread3_w3;
wire       spc4_dctl_dfill_thread3  = `SPARC_CORE4.sparc0.lsu.dctl.dfill_thread3;
wire       spc4_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc4_dctl_diag_wr_cmplt3  = `SPARC_CORE4.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc4_dctl_bsync3_reset  = `SPARC_CORE4.sparc0.lsu.dctl.bsync3_reset;
wire       spc4_dctl_late_cmplt3  = `SPARC_CORE4.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc4_dctl_stxa_cmplt3;
wire       spc4_dctl_l2fill_cmplt3;
wire       spc4_dctl_atm_cmplt3;
wire       spc4_dctl_fillerr3;
wire [4:0] spc4_cmplt3;
wire [5:0] spc4_dctl_ldst_cond_cmplt3;
reg  [3:0] spc4_ldstcond_cmplt3;
reg  [3:0] spc4_ldstcond_cmplt3_d;


wire       spc4_qctl1_bld_g 	= `SPARC_CORE4.sparc0.lsu.qctl1.bld_g;
wire       spc4_qctl1_bld_reset 	= `SPARC_CORE4.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc4_qctl1_bld_cnt 	= `SPARC_CORE4.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc4_bld0_full_cntr;
reg  [1:0] spc4_bld0_full_d;
reg 	   spc4_bld0_full_capture;
reg  [9:0] spc4_bld1_full_cntr;
reg  [1:0] spc4_bld1_full_d;
reg 	   spc4_bld1_full_capture;
reg  [9:0] spc4_bld2_full_cntr;
reg  [1:0] spc4_bld2_full_d;
reg 	   spc4_bld2_full_capture;
reg  [9:0] spc4_bld3_full_cntr;
reg  [1:0] spc4_bld3_full_d;
reg 	   spc4_bld3_full_capture;

wire       spc4_ipick 	= `SPARC_CORE4.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc4_lpick 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc4_spick 	= `SPARC_CORE4.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc4_mpick 	= `SPARC_CORE4.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc4_apick 	= `SPARC_CORE4.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc4_msquash 	= `SPARC_CORE4.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc4_fpicko;
wire [3:0] spc4_fpick;

wire [39:0] spc4_imiss_pa 	= `SPARC_CORE4.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc4_imiss_vld 	= `SPARC_CORE4.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc4_imiss_vld_d;
wire [39:0] spc4_lmiss_pa0 	= `SPARC_CORE4.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc4_lmiss_vld0 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc4_ld_pkt_vld0 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc4_st_pkt_vld0 	= `SPARC_CORE4.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc4_lmiss_eq0;
reg             spc4_atm_imiss_eq0;
wire [39:0] spc4_lmiss_pa1 	= `SPARC_CORE4.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc4_lmiss_vld1 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc4_ld_pkt_vld1 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc4_st_pkt_vld1 	= `SPARC_CORE4.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc4_lmiss_eq1;
reg             spc4_atm_imiss_eq1;
wire [39:0] spc4_lmiss_pa2 	= `SPARC_CORE4.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc4_lmiss_vld2 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc4_ld_pkt_vld2 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc4_st_pkt_vld2 	= `SPARC_CORE4.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc4_lmiss_eq2;
reg             spc4_atm_imiss_eq2;
wire [39:0] spc4_lmiss_pa3 	= `SPARC_CORE4.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc4_lmiss_vld3 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc4_ld_pkt_vld3 	= `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc4_st_pkt_vld3 	= `SPARC_CORE4.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc4_lmiss_eq3;
reg             spc4_atm_imiss_eq3;

wire [44:0]	spc4_wdata_ramc = `SPARC_CORE4.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc4_wptr_vld   = `SPARC_CORE4.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc4_wdata_ramd = {`SPARC_CORE4.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE4.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc4_stb_cam_hit 	        = `SPARC_CORE4.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc4_stb_cam_hit_ptr 	= `SPARC_CORE4.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc4_stb_ld_full_raw	= `SPARC_CORE4.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc4_stb_ld_partial_raw	= `SPARC_CORE4.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc4_stb_cam_mhit		= `SPARC_CORE4.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc4_dfq_vld_entries 	= `SPARC_CORE4.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc4_dfq_full;
reg  [9:0] spc4_dfq_full_cntr;
reg        spc4_dfq_full_d;
reg 	   spc4_dfq_full_capture;

reg  [9:0] spc4_dfq_full_cntr1;
reg        spc4_dfq_full_d1;
wire 	   spc4_dfq_full1;
reg 	   spc4_dfq_full_capture1;
reg  [9:0] spc4_dfq_full_cntr2;
reg        spc4_dfq_full_d2;
wire 	   spc4_dfq_full2;
reg 	   spc4_dfq_full_capture2;
reg  [9:0] spc4_dfq_full_cntr3;
reg        spc4_dfq_full_d3;
wire 	   spc4_dfq_full3;
reg 	   spc4_dfq_full_capture3;
reg  [9:0] spc4_dfq_full_cntr4;
reg        spc4_dfq_full_d4;
wire 	   spc4_dfq_full4;
reg 	   spc4_dfq_full_capture4;
reg  [9:0] spc4_dfq_full_cntr5;
reg        spc4_dfq_full_d5;
wire 	   spc4_dfq_full5;
reg 	   spc4_dfq_full_capture5;
reg  [9:0] spc4_dfq_full_cntr6;
reg        spc4_dfq_full_d6;
wire 	   spc4_dfq_full6;
reg 	   spc4_dfq_full_capture6;
reg  [9:0] spc4_dfq_full_cntr7;
reg        spc4_dfq_full_d7;
wire 	   spc4_dfq_full7;
reg 	   spc4_dfq_full_capture7;

wire 	   spc4_dva_rdwrhit;
reg  [9:0] spc4_dva_full_cntr;
reg        spc4_dva_full_d;
reg 	   spc4_dva_full_capture;
reg 	   spc4_dva_inv;
reg 	   spc4_dva_inv_d;
reg 	   spc4_dva_vld;
reg 	   spc4_dva_vld_d;
reg  [9:0] spc4_dva_vfull_cntr;
reg        spc4_dva_vfull_d;
reg 	   spc4_dva_vfull_capture;
reg        spc4_dva_collide;
reg        spc4_dva_vld2lkup;
reg        spc4_dva_invld2lkup;
reg        spc4_dva_invld_err;

reg  [9:0] spc4_dva_efull_cntr;
reg        spc4_dva_efull_d;

reg        spc4_dva_vlddtag_err;
reg        spc4_dva_vlddcache_err;
reg        spc4_dva_err;
reg [6:0] spc4_dva_raddr_d;
reg [4:0] spc4_dva_waddr_d;
reg [4:0] spc4_dva_invwaddr_d;

reg  	        spc4_ld0_lt_1;
reg  	        spc4_ld0_lt_2;
reg  	        spc4_ld0_lt_3;
reg  	        spc4_ld1_lt_0;
reg  	        spc4_ld1_lt_2;
reg  	        spc4_ld1_lt_3;
reg  	        spc4_ld2_lt_0;
reg  	        spc4_ld2_lt_1;
reg  	        spc4_ld2_lt_3;
reg  	        spc4_ld3_lt_0;
reg  	        spc4_ld3_lt_1;
reg  	        spc4_ld3_lt_2;

reg  	        spc4_st0_lt_1;
reg  	        spc4_st0_lt_2;
reg  	        spc4_st0_lt_3;
reg  	        spc4_st1_lt_0;
reg  	        spc4_st1_lt_2;
reg  	        spc4_st1_lt_3;
reg  	        spc4_st2_lt_0;
reg  	        spc4_st2_lt_1;
reg  	        spc4_st2_lt_3;
reg  	        spc4_st3_lt_0;
reg  	        spc4_st3_lt_1;
reg  	        spc4_st3_lt_2;

wire [11:0]      spc4_ld_ooo_ret;
wire [11:0]      spc4_st_ooo_ret;

wire [7:0]	spc4_stb_state_vld0 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc4_stb_state_ack0 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc4_stb_state_ced0 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc4_stb_state_rst0 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc4_stb_ack_vld0 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc4_ld0_inst_vld_g 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc4_intrpt0_cmplt 	 = `SPARC_CORE4.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc4_stb0_full 	         = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc4_stb0_full_w2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc4_lmq0_full 	         = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc4_mbar_vld0 	         = `SPARC_CORE4.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc4_ld0_unfilled 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc4_flsh_vld0	         = `SPARC_CORE4.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc4_ld0_unf_cntr;
reg  	        spc4_ld0_unfilled_d;

reg  [9:0]	spc4_st0_unf_cntr;
reg  	        spc4_st0_unfilled_d;
reg  	        spc4_st0_unfilled;

reg 	        spc4_mbar_vld_d0;
reg 	        spc4_flsh_vld_d0;

reg 	        spc4_lmq0_full_d;
reg  [9:0]	spc4_lmq_full_cntr0;
reg             spc4_lmq_full_capture0;

reg  [9:0]	spc4_stb_full_cntr0;
reg 		spc4_stb_full_capture0;

reg  [9:0]	spc4_mbar_vld_cntr0;
reg 		spc4_mbar_vld_capture0;

reg  [9:0]	spc4_flsh_vld_cntr0;
reg 		spc4_flsh_vld_capture0;

reg 		spc4_stb_head_hit0;
wire 		spc4_raw_ack_capture0;
reg  [9:0]	spc4_stb_ack_cntr0;

reg  [9:0]	spc4_stb_ced_cntr0;
reg  	        spc4_stb_ced0_d;
reg  	        spc4_stb_ced_capture0;
wire  	        spc4_stb_ced0;

reg 	        spc4_atm0_d;
reg  [9:0]	spc4_atm_cntr0;
reg             spc4_atm_intrpt_capture0;
reg             spc4_atm_intrpt_b4capture0;
reg             spc4_atm_inv_capture0;


reg  [39:0]     spc4_stb_wr_addr0;
reg  [39:0]     spc4_stb_atm_addr0;
reg             spc4_atm_lmiss_eq0;
wire [7:0]	spc4_stb_state_vld1 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc4_stb_state_ack1 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc4_stb_state_ced1 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc4_stb_state_rst1 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc4_stb_ack_vld1 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc4_ld1_inst_vld_g 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc4_intrpt1_cmplt 	 = `SPARC_CORE4.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc4_stb1_full 	         = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc4_stb1_full_w2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc4_lmq1_full 	         = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc4_mbar_vld1 	         = `SPARC_CORE4.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc4_ld1_unfilled 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc4_flsh_vld1	         = `SPARC_CORE4.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc4_ld1_unf_cntr;
reg  	        spc4_ld1_unfilled_d;

reg  [9:0]	spc4_st1_unf_cntr;
reg  	        spc4_st1_unfilled_d;
reg  	        spc4_st1_unfilled;

reg 	        spc4_mbar_vld_d1;
reg 	        spc4_flsh_vld_d1;

reg 	        spc4_lmq1_full_d;
reg  [9:0]	spc4_lmq_full_cntr1;
reg             spc4_lmq_full_capture1;

reg  [9:0]	spc4_stb_full_cntr1;
reg 		spc4_stb_full_capture1;

reg  [9:0]	spc4_mbar_vld_cntr1;
reg 		spc4_mbar_vld_capture1;

reg  [9:0]	spc4_flsh_vld_cntr1;
reg 		spc4_flsh_vld_capture1;

reg 		spc4_stb_head_hit1;
wire 		spc4_raw_ack_capture1;
reg  [9:0]	spc4_stb_ack_cntr1;

reg  [9:0]	spc4_stb_ced_cntr1;
reg  	        spc4_stb_ced1_d;
reg  	        spc4_stb_ced_capture1;
wire  	        spc4_stb_ced1;

reg 	        spc4_atm1_d;
reg  [9:0]	spc4_atm_cntr1;
reg             spc4_atm_intrpt_capture1;
reg             spc4_atm_intrpt_b4capture1;
reg             spc4_atm_inv_capture1;


reg  [39:0]     spc4_stb_wr_addr1;
reg  [39:0]     spc4_stb_atm_addr1;
reg             spc4_atm_lmiss_eq1;
wire [7:0]	spc4_stb_state_vld2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc4_stb_state_ack2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc4_stb_state_ced2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc4_stb_state_rst2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc4_stb_ack_vld2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc4_ld2_inst_vld_g 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc4_intrpt2_cmplt 	 = `SPARC_CORE4.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc4_stb2_full 	         = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc4_stb2_full_w2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc4_lmq2_full 	         = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc4_mbar_vld2 	         = `SPARC_CORE4.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc4_ld2_unfilled 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc4_flsh_vld2	         = `SPARC_CORE4.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc4_ld2_unf_cntr;
reg  	        spc4_ld2_unfilled_d;

reg  [9:0]	spc4_st2_unf_cntr;
reg  	        spc4_st2_unfilled_d;
reg  	        spc4_st2_unfilled;

reg 	        spc4_mbar_vld_d2;
reg 	        spc4_flsh_vld_d2;

reg 	        spc4_lmq2_full_d;
reg  [9:0]	spc4_lmq_full_cntr2;
reg             spc4_lmq_full_capture2;

reg  [9:0]	spc4_stb_full_cntr2;
reg 		spc4_stb_full_capture2;

reg  [9:0]	spc4_mbar_vld_cntr2;
reg 		spc4_mbar_vld_capture2;

reg  [9:0]	spc4_flsh_vld_cntr2;
reg 		spc4_flsh_vld_capture2;

reg 		spc4_stb_head_hit2;
wire 		spc4_raw_ack_capture2;
reg  [9:0]	spc4_stb_ack_cntr2;

reg  [9:0]	spc4_stb_ced_cntr2;
reg  	        spc4_stb_ced2_d;
reg  	        spc4_stb_ced_capture2;
wire  	        spc4_stb_ced2;

reg 	        spc4_atm2_d;
reg  [9:0]	spc4_atm_cntr2;
reg             spc4_atm_intrpt_capture2;
reg             spc4_atm_intrpt_b4capture2;
reg             spc4_atm_inv_capture2;


reg  [39:0]     spc4_stb_wr_addr2;
reg  [39:0]     spc4_stb_atm_addr2;
reg             spc4_atm_lmiss_eq2;
wire [7:0]	spc4_stb_state_vld3 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc4_stb_state_ack3 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc4_stb_state_ced3 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc4_stb_state_rst3 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc4_stb_ack_vld3 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc4_ld3_inst_vld_g 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc4_intrpt3_cmplt 	 = `SPARC_CORE4.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc4_stb3_full 	         = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc4_stb3_full_w2 	 = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc4_lmq3_full 	         = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc4_mbar_vld3 	         = `SPARC_CORE4.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc4_ld3_unfilled 	 = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc4_flsh_vld3	         = `SPARC_CORE4.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc4_ld3_unf_cntr;
reg  	        spc4_ld3_unfilled_d;

reg  [9:0]	spc4_st3_unf_cntr;
reg  	        spc4_st3_unfilled_d;
reg  	        spc4_st3_unfilled;

reg 	        spc4_mbar_vld_d3;
reg 	        spc4_flsh_vld_d3;

reg 	        spc4_lmq3_full_d;
reg  [9:0]	spc4_lmq_full_cntr3;
reg             spc4_lmq_full_capture3;

reg  [9:0]	spc4_stb_full_cntr3;
reg 		spc4_stb_full_capture3;

reg  [9:0]	spc4_mbar_vld_cntr3;
reg 		spc4_mbar_vld_capture3;

reg  [9:0]	spc4_flsh_vld_cntr3;
reg 		spc4_flsh_vld_capture3;

reg 		spc4_stb_head_hit3;
wire 		spc4_raw_ack_capture3;
reg  [9:0]	spc4_stb_ack_cntr3;

reg  [9:0]	spc4_stb_ced_cntr3;
reg  	        spc4_stb_ced3_d;
reg  	        spc4_stb_ced_capture3;
wire  	        spc4_stb_ced3;

reg 	        spc4_atm3_d;
reg  [9:0]	spc4_atm_cntr3;
reg             spc4_atm_intrpt_capture3;
reg             spc4_atm_intrpt_b4capture3;
reg             spc4_atm_inv_capture3;


reg  [39:0]     spc4_stb_wr_addr3;
reg  [39:0]     spc4_stb_atm_addr3;
reg             spc4_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc4_fpick = {spc4_mpick,spc4_spick,spc4_lpick,spc4_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc4_msquash,spc4_apick,spc4_fpick})
         9'b000000000 : spc4_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc4_fpicko = 1'b0;
         9'b1xxxxxxxx : spc4_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc4_fpicko = 1'b0;
	 default:
	  begin
		spc4_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon4 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc4_exu_und = {spc4_l2,
			  spc4_unc,
			  spc4_fpld,
			  spc4_fpldst,
			  spc4_unflush,
			  spc4_ldw,
			  spc4_byp,
			  spc4_flsh,
			  spc4_chm,
			  spc4_ldxa,
			  spc4_ato,
			  spc4_pref,
			  spc4_chit,
			  spc4_dcp,
			  spc4_dtp,
			  spc4_mpc,
			  spc4_mpu};

always @(spc4_exu_und)
begin
       case (spc4_exu_und)
         17'h00000 : spc4_exu =  5'h00;
         17'h00001 : spc4_exu =  5'h01;
         17'h00002 : spc4_exu =  5'h02;
         17'h00004 : spc4_exu =  5'h03;
         17'h00008 : spc4_exu =  5'h04;
         17'h00010 : spc4_exu =  5'h05;
         17'h00020 : spc4_exu =  5'h06;
         17'h00040 : spc4_exu =  5'h07;
         17'h00080 : spc4_exu =  5'h08;
         17'h00100 : spc4_exu =  5'h09;
         17'h00200 : spc4_exu =  5'h0a;
         17'h00400 : spc4_exu =  5'h0b;
         17'h00800 : spc4_exu =  5'h0c;
         17'h01000 : spc4_exu =  5'h0d;
         17'h02000 : spc4_exu =  5'h0e;
         17'h04000 : spc4_exu =  5'h0f;
         17'h08000 : spc4_exu =  5'h10;
         17'h10000 : spc4_exu =  5'h11;
	 default: spc4_exu =  5'h12;
       endcase
end
//excp
assign spc4_exp_und = {spc4_exp_wtchpt_trp_g,
			  spc4_exp_misalign_addr_ldst_atm_m,
			  spc4_exp_priv_violtn_g,
			  spc4_exp_daccess_excptn_g,
			  spc4_exp_daccess_prot_g,
			  spc4_exp_priv_action_g,
			  spc4_exp_spec_access_epage_g,
			  spc4_exp_uncache_atomic_g,
			  spc4_exp_illegal_asi_action_g,
			  spc4_exp_flt_ld_nfo_pg_g,
			  spc4_exp_asi_rd_unc,
			  spc4_exp_tlb_data_ce,
			  spc4_exp_tlb_data_ue,
			  spc4_exp_tlb_tag_ue,
			  spc4_exp_unc,
			  spc4_exp_corr};

always @(spc4_exp_und)
begin
       case (spc4_exp_und)
         16'h0000 : spc4_exp =  5'h00;
         16'h0001 : spc4_exp =  5'h01;
         16'h0002 : spc4_exp =  5'h02;
         16'h0004 : spc4_exp =  5'h03;
         16'h0008 : spc4_exp =  5'h04;
         16'h0010 : spc4_exp =  5'h05;
         16'h0020 : spc4_exp =  5'h06;
         16'h0040 : spc4_exp =  5'h07;
         16'h0080 : spc4_exp =  5'h08;
         16'h0100 : spc4_exp =  5'h09;
         16'h0200 : spc4_exp =  5'h0a;
         16'h0400 : spc4_exp =  5'h0b;
         16'h0800 : spc4_exp =  5'h0c;
         16'h1000 : spc4_exp =  5'h0d;
         16'h2000 : spc4_exp =  5'h0e;
         16'h4000 : spc4_exp =  5'h0f;
         16'h8000 : spc4_exp =  5'h10;
	 default: spc4_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc4_dctl_stxa_cmplt0 = ((spc4_dctl_stxa_internal_d2 & spc4_dctl_thread0_w3) |
				       spc4_dctl_stxa_stall_wr_cmplt0_d1);
assign spc4_dctl_l2fill_cmplt0 = (((spc4_dctl_lsu_l2fill_vld & ~spc4_dctl_atomic_ld_squash_e &
					    ~spc4_dctl_lsu_ignore_fill)) & ~spc4_dctl_l2fill_fpld_e &
					  ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread0);

assign spc4_dctl_fillerr0 = spc4_dctl_l2_corr_error_e & spc4_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc4_dctl_atm_cmplt0 = (spc4_dctl_lsu_atm_st_cmplt_e & ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread0);

assign spc4_dctl_ldst_cond_cmplt0 = { spc4_dctl_stxa_cmplt0, spc4_dctl_l2fill_cmplt0,
					    spc4_dctl_atomic_ld_squash_e, spc4_dctl_intld_byp_cmplt[0],
					    spc4_dctl_bsync0_reset, spc4_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc4_cmplt0 = { spc4_dctl_ldxa_illgl_va_cmplt_d1, spc4_dctl_pref_tlbmiss_cmplt_d2,
			      spc4_dctl_lsu_pcx_pref_issue, spc4_dctl_diag_wr_cmplt0, spc4_dctl_l2fill_fpld_e};


always @(spc4_cmplt0 or spc4_dctl_ldst_cond_cmplt0)
begin
       case ({spc4_dctl_fillerr0,spc4_dctl_ldst_cond_cmplt0,spc4_cmplt0})
         12'h000 : spc4_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc4_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc4_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc4_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc4_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc4_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc4_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc4_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc4_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc4_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc4_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc4_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc4_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc4_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc4_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc4_dctl_stxa_cmplt1 = ((spc4_dctl_stxa_internal_d2 & spc4_dctl_thread1_w3) |
				       spc4_dctl_stxa_stall_wr_cmplt1_d1);
assign spc4_dctl_l2fill_cmplt1 = (((spc4_dctl_lsu_l2fill_vld & ~spc4_dctl_atomic_ld_squash_e &
					    ~spc4_dctl_lsu_ignore_fill)) & ~spc4_dctl_l2fill_fpld_e &
					  ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread1);

assign spc4_dctl_fillerr1 = spc4_dctl_l2_corr_error_e & spc4_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc4_dctl_atm_cmplt1 = (spc4_dctl_lsu_atm_st_cmplt_e & ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread1);

assign spc4_dctl_ldst_cond_cmplt1 = { spc4_dctl_stxa_cmplt1, spc4_dctl_l2fill_cmplt1,
					    spc4_dctl_atomic_ld_squash_e, spc4_dctl_intld_byp_cmplt[1],
					    spc4_dctl_bsync1_reset, spc4_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc4_cmplt1 = { spc4_dctl_ldxa_illgl_va_cmplt_d1, spc4_dctl_pref_tlbmiss_cmplt_d2,
			      spc4_dctl_lsu_pcx_pref_issue, spc4_dctl_diag_wr_cmplt1, spc4_dctl_l2fill_fpld_e};


always @(spc4_cmplt1 or spc4_dctl_ldst_cond_cmplt1)
begin
       case ({spc4_dctl_fillerr1,spc4_dctl_ldst_cond_cmplt1,spc4_cmplt1})
         12'h000 : spc4_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc4_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc4_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc4_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc4_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc4_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc4_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc4_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc4_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc4_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc4_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc4_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc4_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc4_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc4_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc4_dctl_stxa_cmplt2 = ((spc4_dctl_stxa_internal_d2 & spc4_dctl_thread2_w3) |
				       spc4_dctl_stxa_stall_wr_cmplt2_d1);
assign spc4_dctl_l2fill_cmplt2 = (((spc4_dctl_lsu_l2fill_vld & ~spc4_dctl_atomic_ld_squash_e &
					    ~spc4_dctl_lsu_ignore_fill)) & ~spc4_dctl_l2fill_fpld_e &
					  ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread2);

assign spc4_dctl_fillerr2 = spc4_dctl_l2_corr_error_e & spc4_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc4_dctl_atm_cmplt2 = (spc4_dctl_lsu_atm_st_cmplt_e & ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread2);

assign spc4_dctl_ldst_cond_cmplt2 = { spc4_dctl_stxa_cmplt2, spc4_dctl_l2fill_cmplt2,
					    spc4_dctl_atomic_ld_squash_e, spc4_dctl_intld_byp_cmplt[2],
					    spc4_dctl_bsync2_reset, spc4_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc4_cmplt2 = { spc4_dctl_ldxa_illgl_va_cmplt_d1, spc4_dctl_pref_tlbmiss_cmplt_d2,
			      spc4_dctl_lsu_pcx_pref_issue, spc4_dctl_diag_wr_cmplt2, spc4_dctl_l2fill_fpld_e};


always @(spc4_cmplt2 or spc4_dctl_ldst_cond_cmplt2)
begin
       case ({spc4_dctl_fillerr2,spc4_dctl_ldst_cond_cmplt2,spc4_cmplt2})
         12'h000 : spc4_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc4_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc4_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc4_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc4_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc4_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc4_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc4_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc4_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc4_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc4_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc4_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc4_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc4_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc4_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc4_dctl_stxa_cmplt3 = ((spc4_dctl_stxa_internal_d2 & spc4_dctl_thread3_w3) |
				       spc4_dctl_stxa_stall_wr_cmplt3_d1);
assign spc4_dctl_l2fill_cmplt3 = (((spc4_dctl_lsu_l2fill_vld & ~spc4_dctl_atomic_ld_squash_e &
					    ~spc4_dctl_lsu_ignore_fill)) & ~spc4_dctl_l2fill_fpld_e &
					  ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread3);

assign spc4_dctl_fillerr3 = spc4_dctl_l2_corr_error_e & spc4_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc4_dctl_atm_cmplt3 = (spc4_dctl_lsu_atm_st_cmplt_e & ~spc4_dctl_fill_err_trap_e & spc4_dctl_dfill_thread3);

assign spc4_dctl_ldst_cond_cmplt3 = { spc4_dctl_stxa_cmplt3, spc4_dctl_l2fill_cmplt3,
					    spc4_dctl_atomic_ld_squash_e, spc4_dctl_intld_byp_cmplt[3],
					    spc4_dctl_bsync3_reset, spc4_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc4_cmplt3 = { spc4_dctl_ldxa_illgl_va_cmplt_d1, spc4_dctl_pref_tlbmiss_cmplt_d2,
			      spc4_dctl_lsu_pcx_pref_issue, spc4_dctl_diag_wr_cmplt3, spc4_dctl_l2fill_fpld_e};


always @(spc4_cmplt3 or spc4_dctl_ldst_cond_cmplt3)
begin
       case ({spc4_dctl_fillerr3,spc4_dctl_ldst_cond_cmplt3,spc4_cmplt3})
         12'h000 : spc4_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc4_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc4_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc4_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc4_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc4_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc4_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc4_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc4_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc4_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc4_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc4_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc4_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc4_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc4_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc4_ldstcond_cmplt0 or spc4_ldstcond_cmplt1 or spc4_ldstcond_cmplt2
	 or spc4_ldstcond_cmplt3 or spc4_dctl_lsu_ifu_ldst_cmplt
	 or spc4_dctl_late_cmplt0 or spc4_dctl_late_cmplt1 or spc4_dctl_late_cmplt2 or spc4_dctl_late_cmplt3)
begin
       case (spc4_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc4_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc4_ldstcond_cmplt_d = spc4_dctl_late_cmplt0 ? spc4_ldstcond_cmplt0_d : spc4_ldstcond_cmplt0;
         4'b0010 : spc4_ldstcond_cmplt_d = spc4_dctl_late_cmplt1 ? spc4_ldstcond_cmplt1_d : spc4_ldstcond_cmplt1;
         4'b0100 : spc4_ldstcond_cmplt_d = spc4_dctl_late_cmplt2 ? spc4_ldstcond_cmplt2_d : spc4_ldstcond_cmplt2;
         4'b1000 : spc4_ldstcond_cmplt_d = spc4_dctl_late_cmplt3 ? spc4_ldstcond_cmplt3_d : spc4_ldstcond_cmplt3;
         4'b0011 : spc4_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc4_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc4_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc4_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc4_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc4_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc4_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc4_st_ooo_ret = { spc4_st0_lt_1, spc4_st0_lt_2, spc4_st0_lt_3,
			      spc4_st1_lt_0, spc4_st1_lt_2, spc4_st1_lt_3,
			      spc4_st2_lt_0, spc4_st2_lt_1, spc4_st2_lt_3,
			      spc4_st3_lt_0, spc4_st3_lt_1, spc4_st3_lt_2};

always @(posedge clk)
begin
    if(~spc4_st0_unfilled || ~rst_l)
      spc4_st0_unfilled_d <= 1'b0;
    else
      spc4_st0_unfilled_d <= spc4_st0_unfilled;

    if(~rst_l)
      spc4_ldstcond_cmplt0_d <= 4'h0;
    else
      spc4_ldstcond_cmplt0_d <= spc4_ldstcond_cmplt0;

    if(~spc4_ld0_pkt_vld_unmasked || ~rst_l)
      spc4_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc4_ld0_pkt_vld_unmasked_d <= spc4_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc4_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc4_qctl1_ld_sec_hit_thrd0 && spc4_qctl1_ld0_inst_vld_g)
      spc4_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc4_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc4_st1_unfilled || ~rst_l)
      spc4_st1_unfilled_d <= 1'b0;
    else
      spc4_st1_unfilled_d <= spc4_st1_unfilled;

    if(~rst_l)
      spc4_ldstcond_cmplt1_d <= 4'h0;
    else
      spc4_ldstcond_cmplt1_d <= spc4_ldstcond_cmplt1;

    if(~spc4_ld1_pkt_vld_unmasked || ~rst_l)
      spc4_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc4_ld1_pkt_vld_unmasked_d <= spc4_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc4_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc4_qctl1_ld_sec_hit_thrd1 && spc4_qctl1_ld1_inst_vld_g)
      spc4_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc4_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc4_st2_unfilled || ~rst_l)
      spc4_st2_unfilled_d <= 1'b0;
    else
      spc4_st2_unfilled_d <= spc4_st2_unfilled;

    if(~rst_l)
      spc4_ldstcond_cmplt2_d <= 4'h0;
    else
      spc4_ldstcond_cmplt2_d <= spc4_ldstcond_cmplt2;

    if(~spc4_ld2_pkt_vld_unmasked || ~rst_l)
      spc4_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc4_ld2_pkt_vld_unmasked_d <= spc4_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc4_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc4_qctl1_ld_sec_hit_thrd2 && spc4_qctl1_ld2_inst_vld_g)
      spc4_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc4_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc4_st3_unfilled || ~rst_l)
      spc4_st3_unfilled_d <= 1'b0;
    else
      spc4_st3_unfilled_d <= spc4_st3_unfilled;

    if(~rst_l)
      spc4_ldstcond_cmplt3_d <= 4'h0;
    else
      spc4_ldstcond_cmplt3_d <= spc4_ldstcond_cmplt3;

    if(~spc4_ld3_pkt_vld_unmasked || ~rst_l)
      spc4_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc4_ld3_pkt_vld_unmasked_d <= spc4_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc4_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc4_qctl1_ld_sec_hit_thrd3 && spc4_qctl1_ld3_inst_vld_g)
      spc4_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc4_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc4_stb_state_ced0) && (|spc4_stb_state_rst0)) || ~rst_l)
      spc4_st0_unfilled <= 1'b0;
    else if( ((|spc4_stb_state_ced0) && ~(|spc4_stb_state_rst0)))
      spc4_st0_unfilled <= 1'b1;
    else
      spc4_st0_unfilled <= spc4_st0_unfilled;
    if( ((|spc4_stb_state_ced1) && (|spc4_stb_state_rst1)) || ~rst_l)
      spc4_st1_unfilled <= 1'b0;
    else if( ((|spc4_stb_state_ced1) && ~(|spc4_stb_state_rst1)))
      spc4_st1_unfilled <= 1'b1;
    else
      spc4_st1_unfilled <= spc4_st1_unfilled;
    if( ((|spc4_stb_state_ced2) && (|spc4_stb_state_rst2)) || ~rst_l)
      spc4_st2_unfilled <= 1'b0;
    else if( ((|spc4_stb_state_ced2) && ~(|spc4_stb_state_rst2)))
      spc4_st2_unfilled <= 1'b1;
    else
      spc4_st2_unfilled <= spc4_st2_unfilled;
    if( ((|spc4_stb_state_ced3) && (|spc4_stb_state_rst3)) || ~rst_l)
      spc4_st3_unfilled <= 1'b0;
    else if( ((|spc4_stb_state_ced3) && ~(|spc4_stb_state_rst3)))
      spc4_st3_unfilled <= 1'b1;
    else
      spc4_st3_unfilled <= spc4_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc4_st0_unfilled && spc4_st0_unfilled_d)|| ~rst_l)
      begin
        spc4_st0_unf_cntr <= 9'h000;
      end
    else if(spc4_st0_unfilled)
      begin
        spc4_st0_unf_cntr <= spc4_st0_unf_cntr + 1;
      end
    else
      begin
        spc4_st0_unf_cntr <= spc4_st0_unf_cntr;
      end
    if((~spc4_st1_unfilled && spc4_st1_unfilled_d)|| ~rst_l)
      begin
        spc4_st1_unf_cntr <= 9'h000;
      end
    else if(spc4_st1_unfilled)
      begin
        spc4_st1_unf_cntr <= spc4_st1_unf_cntr + 1;
      end
    else
      begin
        spc4_st1_unf_cntr <= spc4_st1_unf_cntr;
      end
    if((~spc4_st2_unfilled && spc4_st2_unfilled_d)|| ~rst_l)
      begin
        spc4_st2_unf_cntr <= 9'h000;
      end
    else if(spc4_st2_unfilled)
      begin
        spc4_st2_unf_cntr <= spc4_st2_unf_cntr + 1;
      end
    else
      begin
        spc4_st2_unf_cntr <= spc4_st2_unf_cntr;
      end
    if((~spc4_st3_unfilled && spc4_st3_unfilled_d)|| ~rst_l)
      begin
        spc4_st3_unf_cntr <= 9'h000;
      end
    else if(spc4_st3_unfilled)
      begin
        spc4_st3_unf_cntr <= spc4_st3_unf_cntr + 1;
      end
    else
      begin
        spc4_st3_unf_cntr <= spc4_st3_unf_cntr;
      end
end

always @(spc4_st0_unfilled or spc4_st1_unfilled or spc4_st2_unfilled or spc4_st3_unfilled
	 or spc4_st0_unfilled_d or spc4_st1_unfilled_d or spc4_st2_unfilled_d or spc4_st3_unfilled_d)
begin
if(~spc4_st0_unfilled && spc4_st0_unfilled_d && spc4_st1_unfilled)
 spc4_st0_lt_1 <= (spc4_st1_unf_cntr > spc4_st0_unf_cntr);
else
 spc4_st0_lt_1 <= 1'b0;
if(~spc4_st0_unfilled && spc4_st0_unfilled_d && spc4_st2_unfilled)
 spc4_st0_lt_2 <= (spc4_st2_unf_cntr > spc4_st0_unf_cntr);
else
 spc4_st0_lt_2 <= 1'b0;
if(~spc4_st0_unfilled && spc4_st0_unfilled_d && spc4_st3_unfilled)
 spc4_st0_lt_3 <= (spc4_st3_unf_cntr > spc4_st0_unf_cntr);
else
 spc4_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc4_st1_unfilled && spc4_st1_unfilled_d && spc4_st0_unfilled)
 spc4_st1_lt_0 <= (spc4_st0_unf_cntr > spc4_st1_unf_cntr);
else
 spc4_st1_lt_0 <= 1'b0;
if(~spc4_st1_unfilled && spc4_st1_unfilled_d && spc4_st2_unfilled)
 spc4_st1_lt_2 <= (spc4_st2_unf_cntr > spc4_st1_unf_cntr);
else
 spc4_st1_lt_2 <= 1'b0;
if(~spc4_st1_unfilled && spc4_st1_unfilled_d && spc4_st3_unfilled)
 spc4_st1_lt_3 <= (spc4_st3_unf_cntr > spc4_st1_unf_cntr);
else
 spc4_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc4_st2_unfilled && spc4_st2_unfilled_d && spc4_st0_unfilled)
 spc4_st2_lt_0 <= (spc4_st0_unf_cntr > spc4_st2_unf_cntr);
else
 spc4_st2_lt_0 <= 1'b0;
if(~spc4_st2_unfilled && spc4_st2_unfilled_d && spc4_st1_unfilled)
 spc4_st2_lt_1 <= (spc4_st1_unf_cntr > spc4_st2_unf_cntr);
else
 spc4_st2_lt_1 <= 1'b0;
if(~spc4_st2_unfilled && spc4_st2_unfilled_d && spc4_st3_unfilled)
 spc4_st2_lt_3 <= (spc4_st3_unf_cntr > spc4_st2_unf_cntr);
else
 spc4_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc4_st3_unfilled && spc4_st3_unfilled_d && spc4_st0_unfilled)
 spc4_st3_lt_0 <= (spc4_st0_unf_cntr > spc4_st3_unf_cntr);
else
 spc4_st3_lt_0 <= 1'b0;
if(~spc4_st3_unfilled && spc4_st3_unfilled_d && spc4_st1_unfilled)
 spc4_st3_lt_1 <= (spc4_st1_unf_cntr > spc4_st3_unf_cntr);
else
 spc4_st3_lt_1 <= 1'b0;
if(~spc4_st3_unfilled && spc4_st3_unfilled_d && spc4_st2_unfilled)
 spc4_st3_lt_2 <= (spc4_st2_unf_cntr > spc4_st3_unf_cntr);
else
 spc4_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc4_ld_ooo_ret = { spc4_ld0_lt_1, spc4_ld0_lt_2, spc4_ld0_lt_3,
			      spc4_ld1_lt_0, spc4_ld1_lt_2, spc4_ld1_lt_3,
			      spc4_ld2_lt_0, spc4_ld2_lt_1, spc4_ld2_lt_3,
			      spc4_ld3_lt_0, spc4_ld3_lt_1, spc4_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc4_ld0_unfilled && spc4_ld0_unfilled_d)|| ~rst_l)
      begin
        spc4_ld0_unf_cntr <= 9'h000;
      end
    else if(spc4_ld0_unfilled)
      begin
        spc4_ld0_unf_cntr <= spc4_ld0_unf_cntr + 1;
      end
    else
      begin
        spc4_ld0_unf_cntr <= spc4_ld0_unf_cntr;
      end
    if((~spc4_ld1_unfilled && spc4_ld1_unfilled_d)|| ~rst_l)
      begin
        spc4_ld1_unf_cntr <= 9'h000;
      end
    else if(spc4_ld1_unfilled)
      begin
        spc4_ld1_unf_cntr <= spc4_ld1_unf_cntr + 1;
      end
    else
      begin
        spc4_ld1_unf_cntr <= spc4_ld1_unf_cntr;
      end
    if((~spc4_ld2_unfilled && spc4_ld2_unfilled_d)|| ~rst_l)
      begin
        spc4_ld2_unf_cntr <= 9'h000;
      end
    else if(spc4_ld2_unfilled)
      begin
        spc4_ld2_unf_cntr <= spc4_ld2_unf_cntr + 1;
      end
    else
      begin
        spc4_ld2_unf_cntr <= spc4_ld2_unf_cntr;
      end
    if((~spc4_ld3_unfilled && spc4_ld3_unfilled_d)|| ~rst_l)
      begin
        spc4_ld3_unf_cntr <= 9'h000;
      end
    else if(spc4_ld3_unfilled)
      begin
        spc4_ld3_unf_cntr <= spc4_ld3_unf_cntr + 1;
      end
    else
      begin
        spc4_ld3_unf_cntr <= spc4_ld3_unf_cntr;
      end
end

always @(spc4_ld0_unfilled or spc4_ld1_unfilled or spc4_ld2_unfilled or spc4_ld3_unfilled
	 or spc4_ld0_unfilled_d or spc4_ld1_unfilled_d or spc4_ld2_unfilled_d or spc4_ld3_unfilled_d)
begin
if(~spc4_ld0_unfilled && spc4_ld0_unfilled_d && spc4_ld1_unfilled)
 spc4_ld0_lt_1 <= (spc4_ld1_unf_cntr > spc4_ld0_unf_cntr);
else
 spc4_ld0_lt_1 <= 1'b0;
if(~spc4_ld0_unfilled && spc4_ld0_unfilled_d && spc4_ld2_unfilled)
 spc4_ld0_lt_2 <= (spc4_ld2_unf_cntr > spc4_ld0_unf_cntr);
else
 spc4_ld0_lt_2 <= 1'b0;
if(~spc4_ld0_unfilled && spc4_ld0_unfilled_d && spc4_ld3_unfilled)
 spc4_ld0_lt_3 <= (spc4_ld3_unf_cntr > spc4_ld0_unf_cntr);
else
 spc4_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc4_ld1_unfilled && spc4_ld1_unfilled_d && spc4_ld0_unfilled)
 spc4_ld1_lt_0 <= (spc4_ld0_unf_cntr > spc4_ld1_unf_cntr);
else
 spc4_ld1_lt_0 <= 1'b0;
if(~spc4_ld1_unfilled && spc4_ld1_unfilled_d && spc4_ld2_unfilled)
 spc4_ld1_lt_2 <= (spc4_ld2_unf_cntr > spc4_ld1_unf_cntr);
else
 spc4_ld1_lt_2 <= 1'b0;
if(~spc4_ld1_unfilled && spc4_ld1_unfilled_d && spc4_ld3_unfilled)
 spc4_ld1_lt_3 <= (spc4_ld3_unf_cntr > spc4_ld1_unf_cntr);
else
 spc4_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc4_ld2_unfilled && spc4_ld2_unfilled_d && spc4_ld0_unfilled)
 spc4_ld2_lt_0 <= (spc4_ld0_unf_cntr > spc4_ld2_unf_cntr);
else
 spc4_ld2_lt_0 <= 1'b0;
if(~spc4_ld2_unfilled && spc4_ld2_unfilled_d && spc4_ld1_unfilled)
 spc4_ld2_lt_1 <= (spc4_ld1_unf_cntr > spc4_ld2_unf_cntr);
else
 spc4_ld2_lt_1 <= 1'b0;
if(~spc4_ld2_unfilled && spc4_ld2_unfilled_d && spc4_ld3_unfilled)
 spc4_ld2_lt_3 <= (spc4_ld3_unf_cntr > spc4_ld2_unf_cntr);
else
 spc4_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc4_ld3_unfilled && spc4_ld3_unfilled_d && spc4_ld0_unfilled)
 spc4_ld3_lt_0 <= (spc4_ld0_unf_cntr > spc4_ld3_unf_cntr);
else
 spc4_ld3_lt_0 <= 1'b0;
if(~spc4_ld3_unfilled && spc4_ld3_unfilled_d && spc4_ld1_unfilled)
 spc4_ld3_lt_1 <= (spc4_ld1_unf_cntr > spc4_ld3_unf_cntr);
else
 spc4_ld3_lt_1 <= 1'b0;
if(~spc4_ld3_unfilled && spc4_ld3_unfilled_d && spc4_ld2_unfilled)
 spc4_ld3_lt_2 <= (spc4_ld2_unf_cntr > spc4_ld3_unf_cntr);
else
 spc4_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc4_dctl_bld_hit =
((|spc4_dctl_lsu_way_hit[3:0])  & spc4_dctl_dcache_enable_g &
  ~spc4_dctl_ldxa_internal & ~spc4_dctl_dcache_rd_parity_error & ~spc4_dctl_dtag_perror_g &
  ~spc4_dctl_endian_mispred_g &
  ~spc4_dctl_atomic_g & ~spc4_dctl_ncache_asild_rq_g) & ~spc4_dctl_tte_data_perror_unc &
  spc4_dctl_ld_inst_vld_g & spc4_qctl1_bld_g ;

assign spc4_dctl_bld_stb_hit = spc4_dctl_bld_hit & spc4_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc4_bld0_full_d <= 2'b00;
      spc4_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc4_bld0_full_d <= spc4_qctl1_bld_cnt;
      spc4_ld0_unfilled_d <= spc4_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc4_bld1_full_d <= 2'b00;
      spc4_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc4_bld1_full_d <= spc4_qctl1_bld_cnt;
      spc4_ld1_unfilled_d <= spc4_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc4_bld2_full_d <= 2'b00;
      spc4_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc4_bld2_full_d <= spc4_qctl1_bld_cnt;
      spc4_ld2_unfilled_d <= spc4_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc4_bld3_full_d <= 2'b00;
      spc4_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc4_bld3_full_d <= spc4_qctl1_bld_cnt;
      spc4_ld3_unfilled_d <= spc4_ld3_unfilled;
     end
end
always @(spc4_bld0_full_d or spc4_qctl1_bld_cnt)
begin
 if( (spc4_bld0_full_d != spc4_qctl1_bld_cnt) && (spc4_bld0_full_d == 2'd0))
    spc4_bld0_full_capture <= 1'b1;
 else
    spc4_bld0_full_capture <= 1'b0;
end
always @(spc4_bld1_full_d or spc4_qctl1_bld_cnt)
begin
 if( (spc4_bld1_full_d != spc4_qctl1_bld_cnt) && (spc4_bld1_full_d == 2'd1))
    spc4_bld1_full_capture <= 1'b1;
 else
    spc4_bld1_full_capture <= 1'b0;
end
always @(spc4_bld2_full_d or spc4_qctl1_bld_cnt)
begin
 if( (spc4_bld2_full_d != spc4_qctl1_bld_cnt) && (spc4_bld2_full_d == 2'd2))
    spc4_bld2_full_capture <= 1'b1;
 else
    spc4_bld2_full_capture <= 1'b0;
end
always @(spc4_bld3_full_d or spc4_qctl1_bld_cnt)
begin
 if( (spc4_bld3_full_d != spc4_qctl1_bld_cnt) && (spc4_bld3_full_d == 2'd3))
    spc4_bld3_full_capture <= 1'b1;
 else
    spc4_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc4_qctl1_bld_cnt != 2'b00) && (spc4_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc4_bld0_full_cntr <= 9'h000;
      end
    else if(spc4_qctl1_bld_g && (spc4_qctl1_bld_cnt == 2'b00))
      begin
        spc4_bld0_full_cntr <= spc4_bld0_full_cntr + 1;
      end
    else if( (spc4_qctl1_bld_cnt == 2'b00) && (spc4_bld0_full_cntr != 9'h000))
      begin
        spc4_bld0_full_cntr <= spc4_bld0_full_cntr + 1;
      end
    else
      begin
        spc4_bld0_full_cntr <= spc4_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc4_qctl1_bld_cnt != 2'b01) && (spc4_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc4_bld1_full_cntr <= 9'h000;
      end
    else if(spc4_qctl1_bld_cnt == 2'b01)
      begin
        spc4_bld1_full_cntr <= spc4_bld1_full_cntr + 1;
      end
    else if( (spc4_qctl1_bld_cnt == 2'b01) && (spc4_bld1_full_cntr != 9'h000))
      begin
        spc4_bld1_full_cntr <= spc4_bld1_full_cntr + 1;
      end
    else
      begin
        spc4_bld1_full_cntr <= spc4_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc4_qctl1_bld_cnt != 2'b10) && (spc4_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc4_bld2_full_cntr <= 9'h000;
      end
    else if(spc4_qctl1_bld_cnt == 2'b10)
      begin
        spc4_bld2_full_cntr <= spc4_bld2_full_cntr + 1;
      end
    else if( (spc4_qctl1_bld_cnt == 2'b10) && (spc4_bld2_full_cntr != 9'h000))
      begin
        spc4_bld2_full_cntr <= spc4_bld2_full_cntr + 1;
      end
    else
      begin
        spc4_bld2_full_cntr <= spc4_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc4_qctl1_bld_cnt != 2'b11) && (spc4_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc4_bld3_full_cntr <= 9'h000;
      end
    else if(spc4_qctl1_bld_cnt == 2'b11)
      begin
        spc4_bld3_full_cntr <= spc4_bld3_full_cntr + 1;
      end
    else if( (spc4_qctl1_bld_cnt == 2'b11) && (spc4_bld3_full_cntr != 9'h000))
      begin
        spc4_bld3_full_cntr <= spc4_bld3_full_cntr + 1;
      end
    else
      begin
        spc4_bld3_full_cntr <= spc4_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc4_stb_state_vld0) && ~spc4_atomic_g) || ~rst_l)
      begin
        spc4_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc4_atomic_g && (spc4_atm_type0 != 8'h00) && spc4_wptr_vld)
      begin
        spc4_stb_atm_addr0 <= {spc4_wdata_ramc[44:9],spc4_wdata_ramd[67:64]};
      end
    else
      begin
        spc4_stb_atm_addr0 <= spc4_stb_atm_addr0;
      end
    if( ( ~(|spc4_stb_state_vld1) && ~spc4_atomic_g) || ~rst_l)
      begin
        spc4_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc4_atomic_g && (spc4_atm_type1 != 8'h00) && spc4_wptr_vld)
      begin
        spc4_stb_atm_addr1 <= {spc4_wdata_ramc[44:9],spc4_wdata_ramd[67:64]};
      end
    else
      begin
        spc4_stb_atm_addr1 <= spc4_stb_atm_addr1;
      end
    if( ( ~(|spc4_stb_state_vld2) && ~spc4_atomic_g) || ~rst_l)
      begin
        spc4_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc4_atomic_g && (spc4_atm_type2 != 8'h00) && spc4_wptr_vld)
      begin
        spc4_stb_atm_addr2 <= {spc4_wdata_ramc[44:9],spc4_wdata_ramd[67:64]};
      end
    else
      begin
        spc4_stb_atm_addr2 <= spc4_stb_atm_addr2;
      end
    if( ( ~(|spc4_stb_state_vld3) && ~spc4_atomic_g) || ~rst_l)
      begin
        spc4_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc4_atomic_g && (spc4_atm_type3 != 8'h00) && spc4_wptr_vld)
      begin
        spc4_stb_atm_addr3 <= {spc4_wdata_ramc[44:9],spc4_wdata_ramd[67:64]};
      end
    else
      begin
        spc4_stb_atm_addr3 <= spc4_stb_atm_addr3;
      end
end

 assign spc4_dfq_full = (spc4_dfq_vld_entries >= 3'd4);


assign spc4_dfq_full1 = (spc4_dfq_vld_entries >= (3'd4 + 1));

always @(spc4_dfq_full_d1 or spc4_dfq_full1)
begin
  if (spc4_dfq_full_d1 && ~spc4_dfq_full1)
    spc4_dfq_full_capture1 <= 1'b1;
  else
    spc4_dfq_full_capture1 <= 1'b0;
end

assign spc4_dfq_full2 = (spc4_dfq_vld_entries >= (3'd4 + 2));

always @(spc4_dfq_full_d2 or spc4_dfq_full2)
begin
  if (spc4_dfq_full_d2 && ~spc4_dfq_full2)
    spc4_dfq_full_capture2 <= 1'b1;
  else
    spc4_dfq_full_capture2 <= 1'b0;
end

assign spc4_dfq_full3 = (spc4_dfq_vld_entries >= (3'd4 + 3));

always @(spc4_dfq_full_d3 or spc4_dfq_full3)
begin
  if (spc4_dfq_full_d3 && ~spc4_dfq_full3)
    spc4_dfq_full_capture3 <= 1'b1;
  else
    spc4_dfq_full_capture3 <= 1'b0;
end

assign spc4_dfq_full4 = (spc4_dfq_vld_entries >= (3'd4 + 4));

always @(spc4_dfq_full_d4 or spc4_dfq_full4)
begin
  if (spc4_dfq_full_d4 && ~spc4_dfq_full4)
    spc4_dfq_full_capture4 <= 1'b1;
  else
    spc4_dfq_full_capture4 <= 1'b0;
end

assign spc4_dfq_full5 = (spc4_dfq_vld_entries >= (3'd4 + 5));

always @(spc4_dfq_full_d5 or spc4_dfq_full5)
begin
  if (spc4_dfq_full_d5 && ~spc4_dfq_full5)
    spc4_dfq_full_capture5 <= 1'b1;
  else
    spc4_dfq_full_capture5 <= 1'b0;
end

assign spc4_dfq_full6 = (spc4_dfq_vld_entries >= (3'd4 + 6));

always @(spc4_dfq_full_d6 or spc4_dfq_full6)
begin
  if (spc4_dfq_full_d6 && ~spc4_dfq_full6)
    spc4_dfq_full_capture6 <= 1'b1;
  else
    spc4_dfq_full_capture6 <= 1'b0;
end

assign spc4_dfq_full7 = (spc4_dfq_vld_entries >= (3'd4 + 7));

always @(spc4_dfq_full_d7 or spc4_dfq_full7)
begin
  if (spc4_dfq_full_d7 && ~spc4_dfq_full7)
    spc4_dfq_full_capture7 <= 1'b1;
  else
    spc4_dfq_full_capture7 <= 1'b0;
end

always @(spc4_mbar_vld_d0 or spc4_mbar_vld0)
begin
  if (spc4_mbar_vld_d0 && ~spc4_mbar_vld0)
    spc4_mbar_vld_capture0 <= 1'b1;
  else
    spc4_mbar_vld_capture0 <= 1'b0;
end
always @(spc4_mbar_vld_d1 or spc4_mbar_vld1)
begin
  if (spc4_mbar_vld_d1 && ~spc4_mbar_vld1)
    spc4_mbar_vld_capture1 <= 1'b1;
  else
    spc4_mbar_vld_capture1 <= 1'b0;
end
always @(spc4_mbar_vld_d2 or spc4_mbar_vld2)
begin
  if (spc4_mbar_vld_d2 && ~spc4_mbar_vld2)
    spc4_mbar_vld_capture2 <= 1'b1;
  else
    spc4_mbar_vld_capture2 <= 1'b0;
end
always @(spc4_mbar_vld_d3 or spc4_mbar_vld3)
begin
  if (spc4_mbar_vld_d3 && ~spc4_mbar_vld3)
    spc4_mbar_vld_capture3 <= 1'b1;
  else
    spc4_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc4_dfq_full1 && (spc4_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr1 <= 9'h000;
       spc4_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr1);
      end
    else if( spc4_dfq_full1)
      begin
       spc4_dfq_full_cntr1 <= spc4_dfq_full_cntr1 + 1;
       spc4_dfq_full_d1 <= spc4_dfq_full1;
      end
    else
      begin
       spc4_dfq_full_cntr1 <= spc4_dfq_full_cntr1;
       spc4_dfq_full_d1 <= spc4_dfq_full1;
      end
    if( ( ~spc4_dfq_full2 && (spc4_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr2 <= 9'h000;
       spc4_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr2);
      end
    else if( spc4_dfq_full2)
      begin
       spc4_dfq_full_cntr2 <= spc4_dfq_full_cntr2 + 1;
       spc4_dfq_full_d2 <= spc4_dfq_full2;
      end
    else
      begin
       spc4_dfq_full_cntr2 <= spc4_dfq_full_cntr2;
       spc4_dfq_full_d2 <= spc4_dfq_full2;
      end
    if( ( ~spc4_dfq_full3 && (spc4_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr3 <= 9'h000;
       spc4_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr3);
      end
    else if( spc4_dfq_full3)
      begin
       spc4_dfq_full_cntr3 <= spc4_dfq_full_cntr3 + 1;
       spc4_dfq_full_d3 <= spc4_dfq_full3;
      end
    else
      begin
       spc4_dfq_full_cntr3 <= spc4_dfq_full_cntr3;
       spc4_dfq_full_d3 <= spc4_dfq_full3;
      end
    if( ( ~spc4_dfq_full4 && (spc4_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr4 <= 9'h000;
       spc4_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr4);
      end
    else if( spc4_dfq_full4)
      begin
       spc4_dfq_full_cntr4 <= spc4_dfq_full_cntr4 + 1;
       spc4_dfq_full_d4 <= spc4_dfq_full4;
      end
    else
      begin
       spc4_dfq_full_cntr4 <= spc4_dfq_full_cntr4;
       spc4_dfq_full_d4 <= spc4_dfq_full4;
      end
    if( ( ~spc4_dfq_full5 && (spc4_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr5 <= 9'h000;
       spc4_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr5);
      end
    else if( spc4_dfq_full5)
      begin
       spc4_dfq_full_cntr5 <= spc4_dfq_full_cntr5 + 1;
       spc4_dfq_full_d5 <= spc4_dfq_full5;
      end
    else
      begin
       spc4_dfq_full_cntr5 <= spc4_dfq_full_cntr5;
       spc4_dfq_full_d5 <= spc4_dfq_full5;
      end
    if( ( ~spc4_dfq_full6 && (spc4_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr6 <= 9'h000;
       spc4_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr6);
      end
    else if( spc4_dfq_full6)
      begin
       spc4_dfq_full_cntr6 <= spc4_dfq_full_cntr6 + 1;
       spc4_dfq_full_d6 <= spc4_dfq_full6;
      end
    else
      begin
       spc4_dfq_full_cntr6 <= spc4_dfq_full_cntr6;
       spc4_dfq_full_d6 <= spc4_dfq_full6;
      end
    if( ( ~spc4_dfq_full7 && (spc4_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr7 <= 9'h000;
       spc4_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr7);
      end
    else if( spc4_dfq_full7)
      begin
       spc4_dfq_full_cntr7 <= spc4_dfq_full_cntr7 + 1;
       spc4_dfq_full_d7 <= spc4_dfq_full7;
      end
    else
      begin
       spc4_dfq_full_cntr7 <= spc4_dfq_full_cntr7;
       spc4_dfq_full_d7 <= spc4_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc4_intrpt0_cmplt or spc4_atm_cntr0 or spc4_stb_state_ced0)
begin
  if (spc4_intrpt0_cmplt && (spc4_atm_cntr0 != 9'h000) && ~(|spc4_stb_state_ced0))
    spc4_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc4_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc4_intrpt1_cmplt or spc4_atm_cntr1 or spc4_stb_state_ced1)
begin
  if (spc4_intrpt1_cmplt && (spc4_atm_cntr1 != 9'h000) && ~(|spc4_stb_state_ced1))
    spc4_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc4_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc4_intrpt2_cmplt or spc4_atm_cntr2 or spc4_stb_state_ced2)
begin
  if (spc4_intrpt2_cmplt && (spc4_atm_cntr2 != 9'h000) && ~(|spc4_stb_state_ced2))
    spc4_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc4_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc4_intrpt3_cmplt or spc4_atm_cntr3 or spc4_stb_state_ced3)
begin
  if (spc4_intrpt3_cmplt && (spc4_atm_cntr3 != 9'h000) && ~(|spc4_stb_state_ced3))
    spc4_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc4_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc4_intrpt0_cmplt or spc4_atm_cntr0 or spc4_stb_state_ced0)
begin
  if (spc4_intrpt0_cmplt && (spc4_atm_cntr0 != 9'h000) && (|spc4_stb_state_ced0))
    spc4_atm_intrpt_capture0 <= 1'b1;
  else
    spc4_atm_intrpt_capture0 <= 1'b0;
end
always @(spc4_intrpt1_cmplt or spc4_atm_cntr1 or spc4_stb_state_ced1)
begin
  if (spc4_intrpt1_cmplt && (spc4_atm_cntr1 != 9'h000) && (|spc4_stb_state_ced1))
    spc4_atm_intrpt_capture1 <= 1'b1;
  else
    spc4_atm_intrpt_capture1 <= 1'b0;
end
always @(spc4_intrpt2_cmplt or spc4_atm_cntr2 or spc4_stb_state_ced2)
begin
  if (spc4_intrpt2_cmplt && (spc4_atm_cntr2 != 9'h000) && (|spc4_stb_state_ced2))
    spc4_atm_intrpt_capture2 <= 1'b1;
  else
    spc4_atm_intrpt_capture2 <= 1'b0;
end
always @(spc4_intrpt3_cmplt or spc4_atm_cntr3 or spc4_stb_state_ced3)
begin
  if (spc4_intrpt3_cmplt && (spc4_atm_cntr3 != 9'h000) && (|spc4_stb_state_ced3))
    spc4_atm_intrpt_capture3 <= 1'b1;
  else
    spc4_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc4_atm_cntr0 or spc4_dva_din or spc4_dva_wen)
begin
  if (~spc4_dva_din && spc4_dva_wen && (spc4_atm_cntr0 != 9'h000))
    spc4_atm_inv_capture0 <= 1'b1;
  else
    spc4_atm_inv_capture0 <= 1'b0;
end
always @(spc4_atm_cntr1 or spc4_dva_din or spc4_dva_wen)
begin
  if (~spc4_dva_din && spc4_dva_wen && (spc4_atm_cntr1 != 9'h000))
    spc4_atm_inv_capture1 <= 1'b1;
  else
    spc4_atm_inv_capture1 <= 1'b0;
end
always @(spc4_atm_cntr2 or spc4_dva_din or spc4_dva_wen)
begin
  if (~spc4_dva_din && spc4_dva_wen && (spc4_atm_cntr2 != 9'h000))
    spc4_atm_inv_capture2 <= 1'b1;
  else
    spc4_atm_inv_capture2 <= 1'b0;
end
always @(spc4_atm_cntr3 or spc4_dva_din or spc4_dva_wen)
begin
  if (~spc4_dva_din && spc4_dva_wen && (spc4_atm_cntr3 != 9'h000))
    spc4_atm_inv_capture3 <= 1'b1;
  else
    spc4_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc4_stb_state_vld0) && (spc4_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_atm_cntr0 <= 9'h000;
       spc4_atm0_d <= 1'b0;
      end
    else if( spc4_atomic_g && (spc4_atm_type0 != 8'h00))
      begin
       spc4_atm_cntr0 <= spc4_atm_cntr0 + 1;
       spc4_atm0_d <= 1'b1;
      end
    else if( spc4_atm0_d && (|spc4_stb_state_vld0))
      begin
       spc4_atm_cntr0 <= spc4_atm_cntr0 + 1;
       spc4_atm0_d <= spc4_atm0_d;
      end
    else
      begin
       spc4_atm_cntr0 <= spc4_atm_cntr0;
       spc4_atm0_d <= spc4_atm0_d;
      end
    if( ( ~(|spc4_stb_state_vld1) && (spc4_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_atm_cntr1 <= 9'h000;
       spc4_atm1_d <= 1'b0;
      end
    else if( spc4_atomic_g && (spc4_atm_type1 != 8'h00))
      begin
       spc4_atm_cntr1 <= spc4_atm_cntr1 + 1;
       spc4_atm1_d <= 1'b1;
      end
    else if( spc4_atm1_d && (|spc4_stb_state_vld1))
      begin
       spc4_atm_cntr1 <= spc4_atm_cntr1 + 1;
       spc4_atm1_d <= spc4_atm1_d;
      end
    else
      begin
       spc4_atm_cntr1 <= spc4_atm_cntr1;
       spc4_atm1_d <= spc4_atm1_d;
      end
    if( ( ~(|spc4_stb_state_vld2) && (spc4_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_atm_cntr2 <= 9'h000;
       spc4_atm2_d <= 1'b0;
      end
    else if( spc4_atomic_g && (spc4_atm_type2 != 8'h00))
      begin
       spc4_atm_cntr2 <= spc4_atm_cntr2 + 1;
       spc4_atm2_d <= 1'b1;
      end
    else if( spc4_atm2_d && (|spc4_stb_state_vld2))
      begin
       spc4_atm_cntr2 <= spc4_atm_cntr2 + 1;
       spc4_atm2_d <= spc4_atm2_d;
      end
    else
      begin
       spc4_atm_cntr2 <= spc4_atm_cntr2;
       spc4_atm2_d <= spc4_atm2_d;
      end
    if( ( ~(|spc4_stb_state_vld3) && (spc4_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_atm_cntr3 <= 9'h000;
       spc4_atm3_d <= 1'b0;
      end
    else if( spc4_atomic_g && (spc4_atm_type3 != 8'h00))
      begin
       spc4_atm_cntr3 <= spc4_atm_cntr3 + 1;
       spc4_atm3_d <= 1'b1;
      end
    else if( spc4_atm3_d && (|spc4_stb_state_vld3))
      begin
       spc4_atm_cntr3 <= spc4_atm_cntr3 + 1;
       spc4_atm3_d <= spc4_atm3_d;
      end
    else
      begin
       spc4_atm_cntr3 <= spc4_atm_cntr3;
       spc4_atm3_d <= spc4_atm3_d;
      end
end

 assign spc4_raw_ack_capture0 = spc4_stb_ack_vld0 && (spc4_stb_ack_cntr0 != 9'h000);
 assign spc4_stb_ced0 = |spc4_stb_state_ced0;
 assign spc4_raw_ack_capture1 = spc4_stb_ack_vld1 && (spc4_stb_ack_cntr1 != 9'h000);
 assign spc4_stb_ced1 = |spc4_stb_state_ced1;
 assign spc4_raw_ack_capture2 = spc4_stb_ack_vld2 && (spc4_stb_ack_cntr2 != 9'h000);
 assign spc4_stb_ced2 = |spc4_stb_state_ced2;
 assign spc4_raw_ack_capture3 = spc4_stb_ack_vld3 && (spc4_stb_ack_cntr3 != 9'h000);
 assign spc4_stb_ced3 = |spc4_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc4_stb_ced0 && (spc4_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ced_cntr0 <= 9'h000;
       spc4_stb_ced0_d <= 1'b0;
      end
    else if( spc4_stb_ced0 && (spc4_stb_state_ack0 == 8'h00))
      begin
       spc4_stb_ced_cntr0 <= spc4_stb_ced_cntr0 + 1;
       spc4_stb_ced0_d <= spc4_stb_ced0;
      end
    else
      begin
       spc4_stb_ced_cntr0 <= spc4_stb_ced_cntr0;
       spc4_stb_ced0_d <= spc4_stb_ced0_d;
      end

    if( ( ~spc4_mbar_vld0 && (spc4_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_mbar_vld_cntr0 <= 9'h000;
       spc4_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_mbar_vld_counter = %d", spc4_mbar_vld_cntr0);
      end
    else if( spc4_mbar_vld0)
      begin
       spc4_mbar_vld_cntr0 <= spc4_mbar_vld_cntr0 + 1;
       spc4_mbar_vld_d0 <= spc4_mbar_vld0;
      end
    else
      begin
       spc4_mbar_vld_cntr0 <= spc4_mbar_vld_cntr0;
       spc4_mbar_vld_d0 <= spc4_mbar_vld0;
      end

    if( ( ~spc4_flsh_vld0 && (spc4_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_flsh_vld_cntr0 <= 9'h000;
       spc4_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_flsh_vld_counter = %d", spc4_flsh_vld_cntr0);
      end
    else if( spc4_flsh_vld0)
      begin
       spc4_flsh_vld_cntr0 <= spc4_flsh_vld_cntr0 + 1;
       spc4_flsh_vld_d0 <= spc4_flsh_vld0;
      end
    else
      begin
       spc4_flsh_vld_cntr0 <= spc4_flsh_vld_cntr0;
       spc4_flsh_vld_d0 <= spc4_flsh_vld0;
      end

    if( ( ~spc4_stb_ced1 && (spc4_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ced_cntr1 <= 9'h000;
       spc4_stb_ced1_d <= 1'b0;
      end
    else if( spc4_stb_ced1 && (spc4_stb_state_ack1 == 8'h00))
      begin
       spc4_stb_ced_cntr1 <= spc4_stb_ced_cntr1 + 1;
       spc4_stb_ced1_d <= spc4_stb_ced1;
      end
    else
      begin
       spc4_stb_ced_cntr1 <= spc4_stb_ced_cntr1;
       spc4_stb_ced1_d <= spc4_stb_ced1_d;
      end

    if( ( ~spc4_mbar_vld1 && (spc4_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_mbar_vld_cntr1 <= 9'h000;
       spc4_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_mbar_vld_counter = %d", spc4_mbar_vld_cntr1);
      end
    else if( spc4_mbar_vld1)
      begin
       spc4_mbar_vld_cntr1 <= spc4_mbar_vld_cntr1 + 1;
       spc4_mbar_vld_d1 <= spc4_mbar_vld1;
      end
    else
      begin
       spc4_mbar_vld_cntr1 <= spc4_mbar_vld_cntr1;
       spc4_mbar_vld_d1 <= spc4_mbar_vld1;
      end

    if( ( ~spc4_flsh_vld1 && (spc4_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_flsh_vld_cntr1 <= 9'h000;
       spc4_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_flsh_vld_counter = %d", spc4_flsh_vld_cntr1);
      end
    else if( spc4_flsh_vld1)
      begin
       spc4_flsh_vld_cntr1 <= spc4_flsh_vld_cntr1 + 1;
       spc4_flsh_vld_d1 <= spc4_flsh_vld1;
      end
    else
      begin
       spc4_flsh_vld_cntr1 <= spc4_flsh_vld_cntr1;
       spc4_flsh_vld_d1 <= spc4_flsh_vld1;
      end

    if( ( ~spc4_stb_ced2 && (spc4_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ced_cntr2 <= 9'h000;
       spc4_stb_ced2_d <= 1'b0;
      end
    else if( spc4_stb_ced2 && (spc4_stb_state_ack2 == 8'h00))
      begin
       spc4_stb_ced_cntr2 <= spc4_stb_ced_cntr2 + 1;
       spc4_stb_ced2_d <= spc4_stb_ced2;
      end
    else
      begin
       spc4_stb_ced_cntr2 <= spc4_stb_ced_cntr2;
       spc4_stb_ced2_d <= spc4_stb_ced2_d;
      end

    if( ( ~spc4_mbar_vld2 && (spc4_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_mbar_vld_cntr2 <= 9'h000;
       spc4_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_mbar_vld_counter = %d", spc4_mbar_vld_cntr2);
      end
    else if( spc4_mbar_vld2)
      begin
       spc4_mbar_vld_cntr2 <= spc4_mbar_vld_cntr2 + 1;
       spc4_mbar_vld_d2 <= spc4_mbar_vld2;
      end
    else
      begin
       spc4_mbar_vld_cntr2 <= spc4_mbar_vld_cntr2;
       spc4_mbar_vld_d2 <= spc4_mbar_vld2;
      end

    if( ( ~spc4_flsh_vld2 && (spc4_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_flsh_vld_cntr2 <= 9'h000;
       spc4_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_flsh_vld_counter = %d", spc4_flsh_vld_cntr2);
      end
    else if( spc4_flsh_vld2)
      begin
       spc4_flsh_vld_cntr2 <= spc4_flsh_vld_cntr2 + 1;
       spc4_flsh_vld_d2 <= spc4_flsh_vld2;
      end
    else
      begin
       spc4_flsh_vld_cntr2 <= spc4_flsh_vld_cntr2;
       spc4_flsh_vld_d2 <= spc4_flsh_vld2;
      end

    if( ( ~spc4_stb_ced3 && (spc4_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ced_cntr3 <= 9'h000;
       spc4_stb_ced3_d <= 1'b0;
      end
    else if( spc4_stb_ced3 && (spc4_stb_state_ack3 == 8'h00))
      begin
       spc4_stb_ced_cntr3 <= spc4_stb_ced_cntr3 + 1;
       spc4_stb_ced3_d <= spc4_stb_ced3;
      end
    else
      begin
       spc4_stb_ced_cntr3 <= spc4_stb_ced_cntr3;
       spc4_stb_ced3_d <= spc4_stb_ced3_d;
      end

    if( ( ~spc4_mbar_vld3 && (spc4_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_mbar_vld_cntr3 <= 9'h000;
       spc4_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_mbar_vld_counter = %d", spc4_mbar_vld_cntr3);
      end
    else if( spc4_mbar_vld3)
      begin
       spc4_mbar_vld_cntr3 <= spc4_mbar_vld_cntr3 + 1;
       spc4_mbar_vld_d3 <= spc4_mbar_vld3;
      end
    else
      begin
       spc4_mbar_vld_cntr3 <= spc4_mbar_vld_cntr3;
       spc4_mbar_vld_d3 <= spc4_mbar_vld3;
      end

    if( ( ~spc4_flsh_vld3 && (spc4_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_flsh_vld_cntr3 <= 9'h000;
       spc4_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_flsh_vld_counter = %d", spc4_flsh_vld_cntr3);
      end
    else if( spc4_flsh_vld3)
      begin
       spc4_flsh_vld_cntr3 <= spc4_flsh_vld_cntr3 + 1;
       spc4_flsh_vld_d3 <= spc4_flsh_vld3;
      end
    else
      begin
       spc4_flsh_vld_cntr3 <= spc4_flsh_vld_cntr3;
       spc4_flsh_vld_d3 <= spc4_flsh_vld3;
      end

end

always @(spc4_flsh_vld_d0 or spc4_flsh_vld0)
begin
  if (spc4_flsh_vld_d0 && ~spc4_flsh_vld0)
    spc4_flsh_vld_capture0 <= 1'b1;
  else
    spc4_flsh_vld_capture0 <= 1'b0;
end
always @(spc4_flsh_vld_d1 or spc4_flsh_vld1)
begin
  if (spc4_flsh_vld_d1 && ~spc4_flsh_vld1)
    spc4_flsh_vld_capture1 <= 1'b1;
  else
    spc4_flsh_vld_capture1 <= 1'b0;
end
always @(spc4_flsh_vld_d2 or spc4_flsh_vld2)
begin
  if (spc4_flsh_vld_d2 && ~spc4_flsh_vld2)
    spc4_flsh_vld_capture2 <= 1'b1;
  else
    spc4_flsh_vld_capture2 <= 1'b0;
end
always @(spc4_flsh_vld_d3 or spc4_flsh_vld3)
begin
  if (spc4_flsh_vld_d3 && ~spc4_flsh_vld3)
    spc4_flsh_vld_capture3 <= 1'b1;
  else
    spc4_flsh_vld_capture3 <= 1'b0;
end

always @(spc4_lmiss_pa0 or spc4_imiss_pa or spc4_imiss_vld_d or spc4_lmiss_vld0)
begin
if((spc4_lmiss_pa0 == spc4_imiss_pa) && spc4_imiss_vld_d && spc4_lmiss_vld0)
 spc4_lmiss_eq0 = 1'b1;
else
 spc4_lmiss_eq0 = 1'b0;
end
always @(spc4_lmiss_pa1 or spc4_imiss_pa or spc4_imiss_vld_d or spc4_lmiss_vld1)
begin
if((spc4_lmiss_pa1 == spc4_imiss_pa) && spc4_imiss_vld_d && spc4_lmiss_vld1)
 spc4_lmiss_eq1 = 1'b1;
else
 spc4_lmiss_eq1 = 1'b0;
end
always @(spc4_lmiss_pa2 or spc4_imiss_pa or spc4_imiss_vld_d or spc4_lmiss_vld2)
begin
if((spc4_lmiss_pa2 == spc4_imiss_pa) && spc4_imiss_vld_d && spc4_lmiss_vld2)
 spc4_lmiss_eq2 = 1'b1;
else
 spc4_lmiss_eq2 = 1'b0;
end
always @(spc4_lmiss_pa3 or spc4_imiss_pa or spc4_imiss_vld_d or spc4_lmiss_vld3)
begin
if((spc4_lmiss_pa3 == spc4_imiss_pa) && spc4_imiss_vld_d && spc4_lmiss_vld3)
 spc4_lmiss_eq3 = 1'b1;
else
 spc4_lmiss_eq3 = 1'b0;
end

always @(spc4_lmiss_pa0 or spc4_stb_atm_addr0 or spc4_atm_cntr0 or spc4_lmiss_vld0)
begin
if ( ((spc4_lmiss_pa0 == spc4_stb_atm_addr0) && (spc4_atm_cntr0 != 9'h000) && spc4_lmiss_vld0) ||
     ((spc4_lmiss_pa1 == spc4_stb_atm_addr0) && (spc4_atm_cntr0 != 9'h000) && spc4_lmiss_vld1) ||
     ((spc4_lmiss_pa2 == spc4_stb_atm_addr0) && (spc4_atm_cntr0 != 9'h000) && spc4_lmiss_vld2) ||
     ((spc4_lmiss_pa3 == spc4_stb_atm_addr0) && (spc4_atm_cntr0 != 9'h000) && spc4_lmiss_vld3) )

 spc4_atm_lmiss_eq0 = 1'b1;
else
 spc4_atm_lmiss_eq0 = 1'b0;
end
always @(spc4_lmiss_pa1 or spc4_stb_atm_addr1 or spc4_atm_cntr1 or spc4_lmiss_vld1)
begin
if ( ((spc4_lmiss_pa0 == spc4_stb_atm_addr1) && (spc4_atm_cntr1 != 9'h000) && spc4_lmiss_vld0) ||
     ((spc4_lmiss_pa1 == spc4_stb_atm_addr1) && (spc4_atm_cntr1 != 9'h000) && spc4_lmiss_vld1) ||
     ((spc4_lmiss_pa2 == spc4_stb_atm_addr1) && (spc4_atm_cntr1 != 9'h000) && spc4_lmiss_vld2) ||
     ((spc4_lmiss_pa3 == spc4_stb_atm_addr1) && (spc4_atm_cntr1 != 9'h000) && spc4_lmiss_vld3) )

 spc4_atm_lmiss_eq1 = 1'b1;
else
 spc4_atm_lmiss_eq1 = 1'b0;
end
always @(spc4_lmiss_pa2 or spc4_stb_atm_addr2 or spc4_atm_cntr2 or spc4_lmiss_vld2)
begin
if ( ((spc4_lmiss_pa0 == spc4_stb_atm_addr2) && (spc4_atm_cntr2 != 9'h000) && spc4_lmiss_vld0) ||
     ((spc4_lmiss_pa1 == spc4_stb_atm_addr2) && (spc4_atm_cntr2 != 9'h000) && spc4_lmiss_vld1) ||
     ((spc4_lmiss_pa2 == spc4_stb_atm_addr2) && (spc4_atm_cntr2 != 9'h000) && spc4_lmiss_vld2) ||
     ((spc4_lmiss_pa3 == spc4_stb_atm_addr2) && (spc4_atm_cntr2 != 9'h000) && spc4_lmiss_vld3) )

 spc4_atm_lmiss_eq2 = 1'b1;
else
 spc4_atm_lmiss_eq2 = 1'b0;
end
always @(spc4_lmiss_pa3 or spc4_stb_atm_addr3 or spc4_atm_cntr3 or spc4_lmiss_vld3)
begin
if ( ((spc4_lmiss_pa0 == spc4_stb_atm_addr3) && (spc4_atm_cntr3 != 9'h000) && spc4_lmiss_vld0) ||
     ((spc4_lmiss_pa1 == spc4_stb_atm_addr3) && (spc4_atm_cntr3 != 9'h000) && spc4_lmiss_vld1) ||
     ((spc4_lmiss_pa2 == spc4_stb_atm_addr3) && (spc4_atm_cntr3 != 9'h000) && spc4_lmiss_vld2) ||
     ((spc4_lmiss_pa3 == spc4_stb_atm_addr3) && (spc4_atm_cntr3 != 9'h000) && spc4_lmiss_vld3) )

 spc4_atm_lmiss_eq3 = 1'b1;
else
 spc4_atm_lmiss_eq3 = 1'b0;
end

always @(spc4_imiss_pa or spc4_stb_atm_addr0 or spc4_atm_cntr0 or spc4_imiss_vld_d)
begin
if((spc4_imiss_pa == spc4_stb_atm_addr0) && (spc4_atm_cntr0 != 9'h000) && spc4_imiss_vld_d)
 spc4_atm_imiss_eq0 = 1'b1;
else
 spc4_atm_imiss_eq0 = 1'b0;
end
always @(spc4_imiss_pa or spc4_stb_atm_addr1 or spc4_atm_cntr1 or spc4_imiss_vld_d)
begin
if((spc4_imiss_pa == spc4_stb_atm_addr1) && (spc4_atm_cntr1 != 9'h000) && spc4_imiss_vld_d)
 spc4_atm_imiss_eq1 = 1'b1;
else
 spc4_atm_imiss_eq1 = 1'b0;
end
always @(spc4_imiss_pa or spc4_stb_atm_addr2 or spc4_atm_cntr2 or spc4_imiss_vld_d)
begin
if((spc4_imiss_pa == spc4_stb_atm_addr2) && (spc4_atm_cntr2 != 9'h000) && spc4_imiss_vld_d)
 spc4_atm_imiss_eq2 = 1'b1;
else
 spc4_atm_imiss_eq2 = 1'b0;
end
always @(spc4_imiss_pa or spc4_stb_atm_addr3 or spc4_atm_cntr3 or spc4_imiss_vld_d)
begin
if((spc4_imiss_pa == spc4_stb_atm_addr3) && (spc4_atm_cntr3 != 9'h000) && spc4_imiss_vld_d)
 spc4_atm_imiss_eq3 = 1'b1;
else
 spc4_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc4_imiss_vld || ~rst_l)
   spc4_imiss_vld_d <= 1'b0;
 else
   spc4_imiss_vld_d <= spc4_imiss_vld;

 if( ~spc4_ld_miss || ~rst_l)
   spc4_ld_miss_capture <= 1'b0;
 else
   spc4_ld_miss_capture <= spc4_ld_miss;

end

always @(spc4_stb_ced0 or spc4_stb_ced0_d)
begin
if (~spc4_stb_ced0 && spc4_stb_ced0_d)
spc4_stb_ced_capture0 <= 1'b1;
else
spc4_stb_ced_capture0 <= 1'b0;

end
always @(spc4_stb_ced1 or spc4_stb_ced1_d)
begin
if (~spc4_stb_ced1 && spc4_stb_ced1_d)
spc4_stb_ced_capture1 <= 1'b1;
else
spc4_stb_ced_capture1 <= 1'b0;

end
always @(spc4_stb_ced2 or spc4_stb_ced2_d)
begin
if (~spc4_stb_ced2 && spc4_stb_ced2_d)
spc4_stb_ced_capture2 <= 1'b1;
else
spc4_stb_ced_capture2 <= 1'b0;

end
always @(spc4_stb_ced3 or spc4_stb_ced3_d)
begin
if (~spc4_stb_ced3 && spc4_stb_ced3_d)
spc4_stb_ced_capture3 <= 1'b1;
else
spc4_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc4_stb_state_ack0 != 8'h00 && (spc4_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_ack_counter0 = %d", spc4_stb_ack_cntr0);
      end
    else if(spc4_stb_cam_hit && spc4_ld0_inst_vld_g && (spc4_stb_state_ack0 == 8'h00))
      begin
       spc4_stb_ack_cntr0 <= spc4_stb_ack_cntr0 + 1;
      end
    else if( (spc4_stb_state_ack0 == 8'h00 ) && (spc4_stb_ack_cntr0 != 9'h000))
      begin
       spc4_stb_ack_cntr0 <= spc4_stb_ack_cntr0 + 1;
      end // if ( (spc4_stb_state_ack0 == 8'h00 ) && (spc4_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc4_stb_ack_cntr0 <= spc4_stb_ack_cntr0;
      end

    if( (spc4_stb_state_ack1 != 8'h00 && (spc4_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_ack_counter1 = %d", spc4_stb_ack_cntr1);
      end
    else if(spc4_stb_cam_hit && spc4_ld1_inst_vld_g && (spc4_stb_state_ack1 == 8'h00))
      begin
       spc4_stb_ack_cntr1 <= spc4_stb_ack_cntr1 + 1;
      end
    else if( (spc4_stb_state_ack1 == 8'h00 ) && (spc4_stb_ack_cntr1 != 9'h000))
      begin
       spc4_stb_ack_cntr1 <= spc4_stb_ack_cntr1 + 1;
      end // if ( (spc4_stb_state_ack1 == 8'h00 ) && (spc4_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc4_stb_ack_cntr1 <= spc4_stb_ack_cntr1;
      end

    if( (spc4_stb_state_ack2 != 8'h00 && (spc4_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_ack_counter2 = %d", spc4_stb_ack_cntr2);
      end
    else if(spc4_stb_cam_hit && spc4_ld2_inst_vld_g && (spc4_stb_state_ack2 == 8'h00))
      begin
       spc4_stb_ack_cntr2 <= spc4_stb_ack_cntr2 + 1;
      end
    else if( (spc4_stb_state_ack2 == 8'h00 ) && (spc4_stb_ack_cntr2 != 9'h000))
      begin
       spc4_stb_ack_cntr2 <= spc4_stb_ack_cntr2 + 1;
      end // if ( (spc4_stb_state_ack2 == 8'h00 ) && (spc4_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc4_stb_ack_cntr2 <= spc4_stb_ack_cntr2;
      end

    if( (spc4_stb_state_ack3 != 8'h00 && (spc4_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_ack_counter3 = %d", spc4_stb_ack_cntr3);
      end
    else if(spc4_stb_cam_hit && spc4_ld3_inst_vld_g && (spc4_stb_state_ack3 == 8'h00))
      begin
       spc4_stb_ack_cntr3 <= spc4_stb_ack_cntr3 + 1;
      end
    else if( (spc4_stb_state_ack3 == 8'h00 ) && (spc4_stb_ack_cntr3 != 9'h000))
      begin
       spc4_stb_ack_cntr3 <= spc4_stb_ack_cntr3 + 1;
      end // if ( (spc4_stb_state_ack3 == 8'h00 ) && (spc4_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc4_stb_ack_cntr3 <= spc4_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc4_stb0_full_w2 or spc4_stb0_full)
begin
if (~spc4_stb0_full_w2 && spc4_stb0_full)
spc4_stb_full_capture0 <= 1'b1;
else
spc4_stb_full_capture0 <= 1'b0;

end
always @(spc4_stb1_full_w2 or spc4_stb1_full)
begin
if (~spc4_stb1_full_w2 && spc4_stb1_full)
spc4_stb_full_capture1 <= 1'b1;
else
spc4_stb_full_capture1 <= 1'b0;

end
always @(spc4_stb2_full_w2 or spc4_stb2_full)
begin
if (~spc4_stb2_full_w2 && spc4_stb2_full)
spc4_stb_full_capture2 <= 1'b1;
else
spc4_stb_full_capture2 <= 1'b0;

end
always @(spc4_stb3_full_w2 or spc4_stb3_full)
begin
if (~spc4_stb3_full_w2 && spc4_stb3_full)
spc4_stb_full_capture3 <= 1'b1;
else
spc4_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc4_stb0_full && (spc4_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_full_counter0 = %d", spc4_stb_full_cntr0);
      end
    else if( spc4_stb0_full)
      begin
       spc4_stb_full_cntr0 <= spc4_stb_full_cntr0 + 1;
      end
    else
      begin
       spc4_stb_full_cntr0 <= spc4_stb_full_cntr0;
      end
    if( ( ~spc4_stb1_full && (spc4_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_full_counter1 = %d", spc4_stb_full_cntr1);
      end
    else if( spc4_stb1_full)
      begin
       spc4_stb_full_cntr1 <= spc4_stb_full_cntr1 + 1;
      end
    else
      begin
       spc4_stb_full_cntr1 <= spc4_stb_full_cntr1;
      end
    if( ( ~spc4_stb2_full && (spc4_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_full_counter2 = %d", spc4_stb_full_cntr2);
      end
    else if( spc4_stb2_full)
      begin
       spc4_stb_full_cntr2 <= spc4_stb_full_cntr2 + 1;
      end
    else
      begin
       spc4_stb_full_cntr2 <= spc4_stb_full_cntr2;
      end
    if( ( ~spc4_stb3_full && (spc4_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc4_stb_full_counter3 = %d", spc4_stb_full_cntr3);
      end
    else if( spc4_stb3_full)
      begin
       spc4_stb_full_cntr3 <= spc4_stb_full_cntr3 + 1;
      end
    else
      begin
       spc4_stb_full_cntr3 <= spc4_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc4_lmq0_full_d or spc4_lmq0_full)
begin
if (spc4_lmq0_full_d && ~spc4_lmq0_full)
spc4_lmq_full_capture0 <= 1'b1;
else
spc4_lmq_full_capture0 <= 1'b0;

end
always @(spc4_lmq1_full_d or spc4_lmq1_full)
begin
if (spc4_lmq1_full_d && ~spc4_lmq1_full)
spc4_lmq_full_capture1 <= 1'b1;
else
spc4_lmq_full_capture1 <= 1'b0;

end
always @(spc4_lmq2_full_d or spc4_lmq2_full)
begin
if (spc4_lmq2_full_d && ~spc4_lmq2_full)
spc4_lmq_full_capture2 <= 1'b1;
else
spc4_lmq_full_capture2 <= 1'b0;

end
always @(spc4_lmq3_full_d or spc4_lmq3_full)
begin
if (spc4_lmq3_full_d && ~spc4_lmq3_full)
spc4_lmq_full_capture3 <= 1'b1;
else
spc4_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc4_lmq0_full && (spc4_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc4_lmq_full_cntr0 <= 9'h000;
       spc4_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_lmq_full_counter0 = %d", spc4_lmq_full_cntr0);
      end
    else if( spc4_lmq0_full)
      begin
       spc4_lmq_full_cntr0 <= spc4_lmq_full_cntr0 + 1;
       spc4_lmq0_full_d <= spc4_lmq0_full;
      end
    else
      begin
       spc4_lmq_full_cntr0 <= spc4_lmq_full_cntr0;
       spc4_lmq0_full_d <= spc4_lmq0_full;
      end

    if( ( ~spc4_lmq1_full && (spc4_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc4_lmq_full_cntr1 <= 9'h000;
       spc4_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_lmq_full_counter1 = %d", spc4_lmq_full_cntr1);
      end
    else if( spc4_lmq1_full)
      begin
       spc4_lmq_full_cntr1 <= spc4_lmq_full_cntr1 + 1;
       spc4_lmq1_full_d <= spc4_lmq1_full;
      end
    else
      begin
       spc4_lmq_full_cntr1 <= spc4_lmq_full_cntr1;
       spc4_lmq1_full_d <= spc4_lmq1_full;
      end

    if( ( ~spc4_lmq2_full && (spc4_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc4_lmq_full_cntr2 <= 9'h000;
       spc4_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_lmq_full_counter2 = %d", spc4_lmq_full_cntr2);
      end
    else if( spc4_lmq2_full)
      begin
       spc4_lmq_full_cntr2 <= spc4_lmq_full_cntr2 + 1;
       spc4_lmq2_full_d <= spc4_lmq2_full;
      end
    else
      begin
       spc4_lmq_full_cntr2 <= spc4_lmq_full_cntr2;
       spc4_lmq2_full_d <= spc4_lmq2_full;
      end

    if( ( ~spc4_lmq3_full && (spc4_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc4_lmq_full_cntr3 <= 9'h000;
       spc4_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_lmq_full_counter3 = %d", spc4_lmq_full_cntr3);
      end
    else if( spc4_lmq3_full)
      begin
       spc4_lmq_full_cntr3 <= spc4_lmq_full_cntr3 + 1;
       spc4_lmq3_full_d <= spc4_lmq3_full;
      end
    else
      begin
       spc4_lmq_full_cntr3 <= spc4_lmq_full_cntr3;
       spc4_lmq3_full_d <= spc4_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc4_dfq_full_d or spc4_dfq_full)
begin
  if (spc4_dfq_full_d && ~spc4_dfq_full)
    spc4_dfq_full_capture <= 1'b1;
  else
    spc4_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc4_dfq_full && (spc4_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc4_dfq_full_cntr <= 9'h000;
       spc4_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dfq_full_counter = %d", spc4_dfq_full_cntr);
      end
    else if( spc4_dfq_full)
      begin
       spc4_dfq_full_cntr <= spc4_dfq_full_cntr + 1;
       spc4_dfq_full_d <= spc4_dfq_full;
      end
    else
      begin
       spc4_dfq_full_cntr <= spc4_dfq_full_cntr;
       spc4_dfq_full_d <= spc4_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc4_dva_full_d or spc4_dva_inv)
begin
  if (spc4_dva_full_d && ~spc4_dva_inv)
    spc4_dva_full_capture <= 1'b1;
  else
    spc4_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc4_dva_din && spc4_dva_wen)
    begin
     spc4_dva_inv <= 1'b1;
     spc4_dva_waddr_d <= spc4_dva_waddr;
    end
  else if(~spc4_dva_din && spc4_dva_wen)
    begin
     spc4_dva_inv <= 1'b0;
     spc4_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc4_dva_inv <= spc4_dva_inv;
     spc4_dva_waddr_d <= spc4_dva_waddr_d;
    end
end

always @(spc4_dva_raddr or spc4_dva_ren or spc4_dva_inv)
begin
  if (spc4_dva_inv && spc4_dva_ren && (spc4_dva_raddr[6:2] == spc4_dva_waddr_d))
    spc4_dva_vld2lkup <= 1'b1;
  else
    spc4_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc4_dva_inv && (spc4_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc4_dva_full_cntr <= 9'h000;
       spc4_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc4_dva_full_counter = %d", spc4_dva_full_cntr);
      end
    else if( spc4_dva_inv)
      begin
       spc4_dva_full_cntr <= spc4_dva_full_cntr + 1;
       spc4_dva_full_d <= spc4_dva_inv;
      end
    else
      begin
       spc4_dva_full_cntr <= spc4_dva_full_cntr;
       spc4_dva_full_d <= spc4_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc4_dva_vfull_d or spc4_dva_vld)
begin
  if (spc4_dva_vfull_d && ~spc4_dva_vld)
    spc4_dva_vfull_capture <= 1'b1;
  else
    spc4_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc4_dva_din && spc4_dva_wen)
   begin
    spc4_dva_vld <= 1'b1;
    spc4_dva_invwaddr_d <= spc4_dva_waddr;
    spc4_dva_invld_err <= spc4_dva_inv_perror;
   end
  else if(spc4_dva_din && spc4_dva_wen)
    begin
     spc4_dva_vld <= 1'b0;
     spc4_dva_invwaddr_d <= 5'b00000;
     spc4_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc4_dva_vld <= spc4_dva_vld;
     spc4_dva_invwaddr_d <= spc4_dva_invwaddr_d;
     spc4_dva_invld_err <= spc4_dva_invld_err;
    end
end


always @(spc4_dva_raddr or spc4_dva_ren or spc4_dva_vld)
begin
  if (spc4_dva_vld && spc4_dva_ren && (spc4_dva_raddr[6:2] == spc4_dva_waddr_d))
    spc4_dva_invld2lkup <= 1'b1;
  else
    spc4_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc4_dva_vld && (spc4_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc4_dva_vfull_cntr <= 9'h000;
    spc4_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc4_dva_vfull_counter = %d", spc4_dva_vfull_cntr);
  end
    else if( spc4_dva_vld)
    begin
      spc4_dva_vfull_cntr <= spc4_dva_vfull_cntr + 1;
      spc4_dva_vfull_d <= spc4_dva_vld;
    end
    else
    begin
      spc4_dva_vfull_cntr <= spc4_dva_vfull_cntr;
      spc4_dva_vfull_d <= spc4_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc4_dva_raddr or spc4_dva_waddr or spc4_dva_ren or spc4_dva_wen)
begin
  if ( spc4_dva_ren && spc4_dva_wen && (spc4_dva_raddr[6:2] == spc4_dva_waddr))
    spc4_dva_collide <= 1'b1;
  else
    spc4_dva_collide <= 1'b0;
end

// dva error cases

always @(spc4_dva_raddr or spc4_dva_ren or spc4_dva_dtag_perror or spc4_dva_dtag_perror)
begin
  if (spc4_dva_ren && (spc4_dva_dtag_perror || spc4_dva_dtag_perror))
    spc4_dva_err <= 1'b1;
  else
    spc4_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc4_dva_err)
     spc4_dva_efull_d <= 1'b1;
  else
     spc4_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc4_dva_ren && ~(spc4_dva_dtag_perror || spc4_dva_dtag_perror ) &&
       (spc4_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc4_dva_efull_cntr <= 9'h000;
     spc4_dva_raddr_d <= spc4_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc4_dva_efull_counter = %d", spc4_dva_efull_cntr);
    end
  else if(spc4_dva_efull_d)
    begin
      spc4_dva_efull_cntr <= spc4_dva_efull_cntr + 1;
      spc4_dva_raddr_d <= spc4_dva_raddr_d;
    end
  else
    begin
      spc4_dva_efull_cntr <= spc4_dva_efull_cntr;
      spc4_dva_raddr_d <= spc4_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC5

wire 	   spc5_dva_ren 	        = `SPARC_CORE5.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc5_dva_wen 	        = `SPARC_CORE5.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc5_dva_din 	        = `SPARC_CORE5.sparc0.lsu.dva_din_e;
wire [3:0] spc5_dva_dout 	        = `SPARC_CORE5.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc5_dva_raddr 	        = `SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc5_dva_waddr 	        = `SPARC_CORE5.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc5_dva_dtag_perror 	= `SPARC_CORE5.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc5_dva_dcache_perror 	= `SPARC_CORE5.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc5_dva_inv_perror 	= `SPARC_CORE5.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc5_ld_miss 	        = `SPARC_CORE5.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc5_ld_miss_capture;

wire 	   spc5_atomic_g 	        = `SPARC_CORE5.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc5_atm_type0 	= `SPARC_CORE5.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc5_atm_type1 	= `SPARC_CORE5.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc5_atm_type2 	= `SPARC_CORE5.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc5_atm_type3 	= `SPARC_CORE5.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc5_dctl_lsu_way_hit 	= `SPARC_CORE5.sparc0.lsu.dctl.lsu_way_hit;
wire       spc5_dctl_dcache_enable_g 	= `SPARC_CORE5.sparc0.lsu.dctl.dcache_enable_g;
wire       spc5_dctl_ldxa_internal 	= `SPARC_CORE5.sparc0.lsu.dctl.ldxa_internal;
wire       spc5_dctl_ldst_dbl_g 	= `SPARC_CORE5.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc5_dctl_atomic_g 	= `SPARC_CORE5.sparc0.lsu.dctl.atomic_g;
wire       spc5_dctl_stb_cam_hit 	= `SPARC_CORE5.sparc0.lsu.dctl.stb_cam_hit;
wire       spc5_dctl_endian_mispred_g 	= `SPARC_CORE5.sparc0.lsu.dctl.endian_mispred_g;
wire       spc5_dctl_dcache_rd_parity_error 	= `SPARC_CORE5.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc5_dctl_dtag_perror_g 	= `SPARC_CORE5.sparc0.lsu.dctl.dtag_perror_g;
wire       spc5_dctl_tte_data_perror_unc 	= `SPARC_CORE5.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc5_dctl_ld_inst_vld_g 	= `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc5_dctl_lsu_alt_space_g 	= `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc5_dctl_recognized_asi_g 	= `SPARC_CORE5.sparc0.lsu.dctl.recognized_asi_g;
wire       spc5_dctl_ncache_asild_rq_g  = `SPARC_CORE5.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc5_dctl_bld_hit;
wire       spc5_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc5_ixinv0  = `SPARC_CORE5.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc5_ixinv1  = `SPARC_CORE5.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc5_ixinv2  = `SPARC_CORE5.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc5_ixinv3  = `SPARC_CORE5.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc5_ifill  = `SPARC_CORE5.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc5_inv  = `SPARC_CORE5.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc5_inv_clr  = `SPARC_CORE5.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc5_ibuf_busy  = `SPARC_CORE5.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc5_l2  = `SPARC_CORE5.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc5_unc  = `SPARC_CORE5.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc5_fpld  = `SPARC_CORE5.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc5_fpldst  = `SPARC_CORE5.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc5_unflush  = `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc5_ldw  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc5_byp  = `SPARC_CORE5.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc5_flsh  = `SPARC_CORE5.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc5_chm  = `SPARC_CORE5.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc5_ldxa  = `SPARC_CORE5.sparc0.lsu.dctl.ldxa_internal ;
wire       spc5_ato  = `SPARC_CORE5.sparc0.lsu.dctl.atomic_g ;
wire       spc5_pref  = `SPARC_CORE5.sparc0.lsu.dctl.pref_inst_g ;
wire       spc5_chit  = `SPARC_CORE5.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc5_dcp  = `SPARC_CORE5.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc5_dtp  = `SPARC_CORE5.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc5_mpc  = `SPARC_CORE5.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc5_mpc  = 1'b0;
wire       spc5_mpu  = `SPARC_CORE5.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc5_exu_und;
reg  [4:0] spc5_exu;

// excptn
wire spc5_exp_wtchpt_trp_g                    = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc5_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc5_exp_priv_violtn_g                    = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc5_exp_daccess_excptn_g                 = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc5_exp_daccess_prot_g                   = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc5_exp_priv_action_g                    = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc5_exp_spec_access_epage_g              = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc5_exp_uncache_atomic_g                 = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc5_exp_illegal_asi_action_g             = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc5_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc5_exp_asi_rd_unc                       = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc5_exp_tlb_data_ce                     = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc5_exp_asi_rd_unc                       = 1'b0;
wire spc5_exp_tlb_data_ce                     =  1'b0;

wire spc5_exp_tlb_data_ue                     = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc5_exp_tlb_tag_ue                      = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc5_exp_unc                  = `SPARC_CORE5.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc5_exp_corr                 = `SPARC_CORE5.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc5_exp_corr                 = 1'b0;
wire [15:0] spc5_exp_und;
reg  [4:0] spc5_exp;
// dctl cmplt

wire       spc5_dctl_stxa_internal_d2  = `SPARC_CORE5.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc5_dctl_lsu_l2fill_vld  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc5_dctl_atomic_ld_squash_e  = `SPARC_CORE5.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc5_dctl_lsu_ignore_fill  = `SPARC_CORE5.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc5_dctl_l2fill_fpld_e  = `SPARC_CORE5.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc5_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc5_dctl_fill_err_trap_e  = `SPARC_CORE5.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc5_dctl_l2_corr_error_e  = `SPARC_CORE5.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc5_dctl_intld_byp_cmplt  = `SPARC_CORE5.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc5_dctl_lsu_intrpt_cmplt  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc5_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE5.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc5_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE5.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc5_dctl_lsu_pcx_pref_issue  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc5_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE5.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc5_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc5_ldstcond_cmplt_d;

wire       spc5_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE5.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc5_qctl1_ld0_inst_vld_g  = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc5_ld0_pkt_vld_unmasked  = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc5_ld0_pkt_vld_unmasked_d;
reg	   spc5_qctl1_ld_sec_hit_thrd0_w2;

wire       spc5_dctl_thread0_w3  = `SPARC_CORE5.sparc0.lsu.dctl.thread0_w3;
wire       spc5_dctl_dfill_thread0  = `SPARC_CORE5.sparc0.lsu.dctl.dfill_thread0;
wire       spc5_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc5_dctl_diag_wr_cmplt0  = `SPARC_CORE5.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc5_dctl_bsync0_reset  = `SPARC_CORE5.sparc0.lsu.dctl.bsync0_reset;
wire       spc5_dctl_late_cmplt0  = `SPARC_CORE5.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc5_dctl_stxa_cmplt0;
wire       spc5_dctl_l2fill_cmplt0;
wire       spc5_dctl_atm_cmplt0;
wire       spc5_dctl_fillerr0;
wire [4:0] spc5_cmplt0;
wire [5:0] spc5_dctl_ldst_cond_cmplt0;
reg  [3:0] spc5_ldstcond_cmplt0;
reg  [3:0] spc5_ldstcond_cmplt0_d;

wire       spc5_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE5.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc5_qctl1_ld1_inst_vld_g  = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc5_ld1_pkt_vld_unmasked  = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc5_ld1_pkt_vld_unmasked_d;
reg	   spc5_qctl1_ld_sec_hit_thrd1_w2;

wire       spc5_dctl_thread1_w3  = `SPARC_CORE5.sparc0.lsu.dctl.thread1_w3;
wire       spc5_dctl_dfill_thread1  = `SPARC_CORE5.sparc0.lsu.dctl.dfill_thread1;
wire       spc5_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc5_dctl_diag_wr_cmplt1  = `SPARC_CORE5.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc5_dctl_bsync1_reset  = `SPARC_CORE5.sparc0.lsu.dctl.bsync1_reset;
wire       spc5_dctl_late_cmplt1  = `SPARC_CORE5.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc5_dctl_stxa_cmplt1;
wire       spc5_dctl_l2fill_cmplt1;
wire       spc5_dctl_atm_cmplt1;
wire       spc5_dctl_fillerr1;
wire [4:0] spc5_cmplt1;
wire [5:0] spc5_dctl_ldst_cond_cmplt1;
reg  [3:0] spc5_ldstcond_cmplt1;
reg  [3:0] spc5_ldstcond_cmplt1_d;

wire       spc5_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE5.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc5_qctl1_ld2_inst_vld_g  = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc5_ld2_pkt_vld_unmasked  = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc5_ld2_pkt_vld_unmasked_d;
reg	   spc5_qctl1_ld_sec_hit_thrd2_w2;

wire       spc5_dctl_thread2_w3  = `SPARC_CORE5.sparc0.lsu.dctl.thread2_w3;
wire       spc5_dctl_dfill_thread2  = `SPARC_CORE5.sparc0.lsu.dctl.dfill_thread2;
wire       spc5_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc5_dctl_diag_wr_cmplt2  = `SPARC_CORE5.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc5_dctl_bsync2_reset  = `SPARC_CORE5.sparc0.lsu.dctl.bsync2_reset;
wire       spc5_dctl_late_cmplt2  = `SPARC_CORE5.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc5_dctl_stxa_cmplt2;
wire       spc5_dctl_l2fill_cmplt2;
wire       spc5_dctl_atm_cmplt2;
wire       spc5_dctl_fillerr2;
wire [4:0] spc5_cmplt2;
wire [5:0] spc5_dctl_ldst_cond_cmplt2;
reg  [3:0] spc5_ldstcond_cmplt2;
reg  [3:0] spc5_ldstcond_cmplt2_d;

wire       spc5_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE5.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc5_qctl1_ld3_inst_vld_g  = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc5_ld3_pkt_vld_unmasked  = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc5_ld3_pkt_vld_unmasked_d;
reg	   spc5_qctl1_ld_sec_hit_thrd3_w2;

wire       spc5_dctl_thread3_w3  = `SPARC_CORE5.sparc0.lsu.dctl.thread3_w3;
wire       spc5_dctl_dfill_thread3  = `SPARC_CORE5.sparc0.lsu.dctl.dfill_thread3;
wire       spc5_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc5_dctl_diag_wr_cmplt3  = `SPARC_CORE5.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc5_dctl_bsync3_reset  = `SPARC_CORE5.sparc0.lsu.dctl.bsync3_reset;
wire       spc5_dctl_late_cmplt3  = `SPARC_CORE5.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc5_dctl_stxa_cmplt3;
wire       spc5_dctl_l2fill_cmplt3;
wire       spc5_dctl_atm_cmplt3;
wire       spc5_dctl_fillerr3;
wire [4:0] spc5_cmplt3;
wire [5:0] spc5_dctl_ldst_cond_cmplt3;
reg  [3:0] spc5_ldstcond_cmplt3;
reg  [3:0] spc5_ldstcond_cmplt3_d;


wire       spc5_qctl1_bld_g 	= `SPARC_CORE5.sparc0.lsu.qctl1.bld_g;
wire       spc5_qctl1_bld_reset 	= `SPARC_CORE5.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc5_qctl1_bld_cnt 	= `SPARC_CORE5.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc5_bld0_full_cntr;
reg  [1:0] spc5_bld0_full_d;
reg 	   spc5_bld0_full_capture;
reg  [9:0] spc5_bld1_full_cntr;
reg  [1:0] spc5_bld1_full_d;
reg 	   spc5_bld1_full_capture;
reg  [9:0] spc5_bld2_full_cntr;
reg  [1:0] spc5_bld2_full_d;
reg 	   spc5_bld2_full_capture;
reg  [9:0] spc5_bld3_full_cntr;
reg  [1:0] spc5_bld3_full_d;
reg 	   spc5_bld3_full_capture;

wire       spc5_ipick 	= `SPARC_CORE5.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc5_lpick 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc5_spick 	= `SPARC_CORE5.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc5_mpick 	= `SPARC_CORE5.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc5_apick 	= `SPARC_CORE5.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc5_msquash 	= `SPARC_CORE5.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc5_fpicko;
wire [3:0] spc5_fpick;

wire [39:0] spc5_imiss_pa 	= `SPARC_CORE5.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc5_imiss_vld 	= `SPARC_CORE5.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc5_imiss_vld_d;
wire [39:0] spc5_lmiss_pa0 	= `SPARC_CORE5.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc5_lmiss_vld0 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc5_ld_pkt_vld0 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc5_st_pkt_vld0 	= `SPARC_CORE5.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc5_lmiss_eq0;
reg             spc5_atm_imiss_eq0;
wire [39:0] spc5_lmiss_pa1 	= `SPARC_CORE5.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc5_lmiss_vld1 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc5_ld_pkt_vld1 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc5_st_pkt_vld1 	= `SPARC_CORE5.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc5_lmiss_eq1;
reg             spc5_atm_imiss_eq1;
wire [39:0] spc5_lmiss_pa2 	= `SPARC_CORE5.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc5_lmiss_vld2 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc5_ld_pkt_vld2 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc5_st_pkt_vld2 	= `SPARC_CORE5.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc5_lmiss_eq2;
reg             spc5_atm_imiss_eq2;
wire [39:0] spc5_lmiss_pa3 	= `SPARC_CORE5.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc5_lmiss_vld3 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc5_ld_pkt_vld3 	= `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc5_st_pkt_vld3 	= `SPARC_CORE5.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc5_lmiss_eq3;
reg             spc5_atm_imiss_eq3;

wire [44:0]	spc5_wdata_ramc = `SPARC_CORE5.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc5_wptr_vld   = `SPARC_CORE5.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc5_wdata_ramd = {`SPARC_CORE5.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE5.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc5_stb_cam_hit 	        = `SPARC_CORE5.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc5_stb_cam_hit_ptr 	= `SPARC_CORE5.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc5_stb_ld_full_raw	= `SPARC_CORE5.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc5_stb_ld_partial_raw	= `SPARC_CORE5.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc5_stb_cam_mhit		= `SPARC_CORE5.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc5_dfq_vld_entries 	= `SPARC_CORE5.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc5_dfq_full;
reg  [9:0] spc5_dfq_full_cntr;
reg        spc5_dfq_full_d;
reg 	   spc5_dfq_full_capture;

reg  [9:0] spc5_dfq_full_cntr1;
reg        spc5_dfq_full_d1;
wire 	   spc5_dfq_full1;
reg 	   spc5_dfq_full_capture1;
reg  [9:0] spc5_dfq_full_cntr2;
reg        spc5_dfq_full_d2;
wire 	   spc5_dfq_full2;
reg 	   spc5_dfq_full_capture2;
reg  [9:0] spc5_dfq_full_cntr3;
reg        spc5_dfq_full_d3;
wire 	   spc5_dfq_full3;
reg 	   spc5_dfq_full_capture3;
reg  [9:0] spc5_dfq_full_cntr4;
reg        spc5_dfq_full_d4;
wire 	   spc5_dfq_full4;
reg 	   spc5_dfq_full_capture4;
reg  [9:0] spc5_dfq_full_cntr5;
reg        spc5_dfq_full_d5;
wire 	   spc5_dfq_full5;
reg 	   spc5_dfq_full_capture5;
reg  [9:0] spc5_dfq_full_cntr6;
reg        spc5_dfq_full_d6;
wire 	   spc5_dfq_full6;
reg 	   spc5_dfq_full_capture6;
reg  [9:0] spc5_dfq_full_cntr7;
reg        spc5_dfq_full_d7;
wire 	   spc5_dfq_full7;
reg 	   spc5_dfq_full_capture7;

wire 	   spc5_dva_rdwrhit;
reg  [9:0] spc5_dva_full_cntr;
reg        spc5_dva_full_d;
reg 	   spc5_dva_full_capture;
reg 	   spc5_dva_inv;
reg 	   spc5_dva_inv_d;
reg 	   spc5_dva_vld;
reg 	   spc5_dva_vld_d;
reg  [9:0] spc5_dva_vfull_cntr;
reg        spc5_dva_vfull_d;
reg 	   spc5_dva_vfull_capture;
reg        spc5_dva_collide;
reg        spc5_dva_vld2lkup;
reg        spc5_dva_invld2lkup;
reg        spc5_dva_invld_err;

reg  [9:0] spc5_dva_efull_cntr;
reg        spc5_dva_efull_d;

reg        spc5_dva_vlddtag_err;
reg        spc5_dva_vlddcache_err;
reg        spc5_dva_err;
reg [6:0] spc5_dva_raddr_d;
reg [4:0] spc5_dva_waddr_d;
reg [4:0] spc5_dva_invwaddr_d;

reg  	        spc5_ld0_lt_1;
reg  	        spc5_ld0_lt_2;
reg  	        spc5_ld0_lt_3;
reg  	        spc5_ld1_lt_0;
reg  	        spc5_ld1_lt_2;
reg  	        spc5_ld1_lt_3;
reg  	        spc5_ld2_lt_0;
reg  	        spc5_ld2_lt_1;
reg  	        spc5_ld2_lt_3;
reg  	        spc5_ld3_lt_0;
reg  	        spc5_ld3_lt_1;
reg  	        spc5_ld3_lt_2;

reg  	        spc5_st0_lt_1;
reg  	        spc5_st0_lt_2;
reg  	        spc5_st0_lt_3;
reg  	        spc5_st1_lt_0;
reg  	        spc5_st1_lt_2;
reg  	        spc5_st1_lt_3;
reg  	        spc5_st2_lt_0;
reg  	        spc5_st2_lt_1;
reg  	        spc5_st2_lt_3;
reg  	        spc5_st3_lt_0;
reg  	        spc5_st3_lt_1;
reg  	        spc5_st3_lt_2;

wire [11:0]      spc5_ld_ooo_ret;
wire [11:0]      spc5_st_ooo_ret;

wire [7:0]	spc5_stb_state_vld0 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc5_stb_state_ack0 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc5_stb_state_ced0 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc5_stb_state_rst0 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc5_stb_ack_vld0 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc5_ld0_inst_vld_g 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc5_intrpt0_cmplt 	 = `SPARC_CORE5.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc5_stb0_full 	         = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc5_stb0_full_w2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc5_lmq0_full 	         = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc5_mbar_vld0 	         = `SPARC_CORE5.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc5_ld0_unfilled 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc5_flsh_vld0	         = `SPARC_CORE5.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc5_ld0_unf_cntr;
reg  	        spc5_ld0_unfilled_d;

reg  [9:0]	spc5_st0_unf_cntr;
reg  	        spc5_st0_unfilled_d;
reg  	        spc5_st0_unfilled;

reg 	        spc5_mbar_vld_d0;
reg 	        spc5_flsh_vld_d0;

reg 	        spc5_lmq0_full_d;
reg  [9:0]	spc5_lmq_full_cntr0;
reg             spc5_lmq_full_capture0;

reg  [9:0]	spc5_stb_full_cntr0;
reg 		spc5_stb_full_capture0;

reg  [9:0]	spc5_mbar_vld_cntr0;
reg 		spc5_mbar_vld_capture0;

reg  [9:0]	spc5_flsh_vld_cntr0;
reg 		spc5_flsh_vld_capture0;

reg 		spc5_stb_head_hit0;
wire 		spc5_raw_ack_capture0;
reg  [9:0]	spc5_stb_ack_cntr0;

reg  [9:0]	spc5_stb_ced_cntr0;
reg  	        spc5_stb_ced0_d;
reg  	        spc5_stb_ced_capture0;
wire  	        spc5_stb_ced0;

reg 	        spc5_atm0_d;
reg  [9:0]	spc5_atm_cntr0;
reg             spc5_atm_intrpt_capture0;
reg             spc5_atm_intrpt_b4capture0;
reg             spc5_atm_inv_capture0;


reg  [39:0]     spc5_stb_wr_addr0;
reg  [39:0]     spc5_stb_atm_addr0;
reg             spc5_atm_lmiss_eq0;
wire [7:0]	spc5_stb_state_vld1 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc5_stb_state_ack1 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc5_stb_state_ced1 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc5_stb_state_rst1 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc5_stb_ack_vld1 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc5_ld1_inst_vld_g 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc5_intrpt1_cmplt 	 = `SPARC_CORE5.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc5_stb1_full 	         = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc5_stb1_full_w2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc5_lmq1_full 	         = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc5_mbar_vld1 	         = `SPARC_CORE5.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc5_ld1_unfilled 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc5_flsh_vld1	         = `SPARC_CORE5.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc5_ld1_unf_cntr;
reg  	        spc5_ld1_unfilled_d;

reg  [9:0]	spc5_st1_unf_cntr;
reg  	        spc5_st1_unfilled_d;
reg  	        spc5_st1_unfilled;

reg 	        spc5_mbar_vld_d1;
reg 	        spc5_flsh_vld_d1;

reg 	        spc5_lmq1_full_d;
reg  [9:0]	spc5_lmq_full_cntr1;
reg             spc5_lmq_full_capture1;

reg  [9:0]	spc5_stb_full_cntr1;
reg 		spc5_stb_full_capture1;

reg  [9:0]	spc5_mbar_vld_cntr1;
reg 		spc5_mbar_vld_capture1;

reg  [9:0]	spc5_flsh_vld_cntr1;
reg 		spc5_flsh_vld_capture1;

reg 		spc5_stb_head_hit1;
wire 		spc5_raw_ack_capture1;
reg  [9:0]	spc5_stb_ack_cntr1;

reg  [9:0]	spc5_stb_ced_cntr1;
reg  	        spc5_stb_ced1_d;
reg  	        spc5_stb_ced_capture1;
wire  	        spc5_stb_ced1;

reg 	        spc5_atm1_d;
reg  [9:0]	spc5_atm_cntr1;
reg             spc5_atm_intrpt_capture1;
reg             spc5_atm_intrpt_b4capture1;
reg             spc5_atm_inv_capture1;


reg  [39:0]     spc5_stb_wr_addr1;
reg  [39:0]     spc5_stb_atm_addr1;
reg             spc5_atm_lmiss_eq1;
wire [7:0]	spc5_stb_state_vld2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc5_stb_state_ack2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc5_stb_state_ced2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc5_stb_state_rst2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc5_stb_ack_vld2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc5_ld2_inst_vld_g 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc5_intrpt2_cmplt 	 = `SPARC_CORE5.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc5_stb2_full 	         = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc5_stb2_full_w2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc5_lmq2_full 	         = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc5_mbar_vld2 	         = `SPARC_CORE5.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc5_ld2_unfilled 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc5_flsh_vld2	         = `SPARC_CORE5.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc5_ld2_unf_cntr;
reg  	        spc5_ld2_unfilled_d;

reg  [9:0]	spc5_st2_unf_cntr;
reg  	        spc5_st2_unfilled_d;
reg  	        spc5_st2_unfilled;

reg 	        spc5_mbar_vld_d2;
reg 	        spc5_flsh_vld_d2;

reg 	        spc5_lmq2_full_d;
reg  [9:0]	spc5_lmq_full_cntr2;
reg             spc5_lmq_full_capture2;

reg  [9:0]	spc5_stb_full_cntr2;
reg 		spc5_stb_full_capture2;

reg  [9:0]	spc5_mbar_vld_cntr2;
reg 		spc5_mbar_vld_capture2;

reg  [9:0]	spc5_flsh_vld_cntr2;
reg 		spc5_flsh_vld_capture2;

reg 		spc5_stb_head_hit2;
wire 		spc5_raw_ack_capture2;
reg  [9:0]	spc5_stb_ack_cntr2;

reg  [9:0]	spc5_stb_ced_cntr2;
reg  	        spc5_stb_ced2_d;
reg  	        spc5_stb_ced_capture2;
wire  	        spc5_stb_ced2;

reg 	        spc5_atm2_d;
reg  [9:0]	spc5_atm_cntr2;
reg             spc5_atm_intrpt_capture2;
reg             spc5_atm_intrpt_b4capture2;
reg             spc5_atm_inv_capture2;


reg  [39:0]     spc5_stb_wr_addr2;
reg  [39:0]     spc5_stb_atm_addr2;
reg             spc5_atm_lmiss_eq2;
wire [7:0]	spc5_stb_state_vld3 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc5_stb_state_ack3 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc5_stb_state_ced3 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc5_stb_state_rst3 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc5_stb_ack_vld3 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc5_ld3_inst_vld_g 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc5_intrpt3_cmplt 	 = `SPARC_CORE5.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc5_stb3_full 	         = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc5_stb3_full_w2 	 = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc5_lmq3_full 	         = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc5_mbar_vld3 	         = `SPARC_CORE5.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc5_ld3_unfilled 	 = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc5_flsh_vld3	         = `SPARC_CORE5.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc5_ld3_unf_cntr;
reg  	        spc5_ld3_unfilled_d;

reg  [9:0]	spc5_st3_unf_cntr;
reg  	        spc5_st3_unfilled_d;
reg  	        spc5_st3_unfilled;

reg 	        spc5_mbar_vld_d3;
reg 	        spc5_flsh_vld_d3;

reg 	        spc5_lmq3_full_d;
reg  [9:0]	spc5_lmq_full_cntr3;
reg             spc5_lmq_full_capture3;

reg  [9:0]	spc5_stb_full_cntr3;
reg 		spc5_stb_full_capture3;

reg  [9:0]	spc5_mbar_vld_cntr3;
reg 		spc5_mbar_vld_capture3;

reg  [9:0]	spc5_flsh_vld_cntr3;
reg 		spc5_flsh_vld_capture3;

reg 		spc5_stb_head_hit3;
wire 		spc5_raw_ack_capture3;
reg  [9:0]	spc5_stb_ack_cntr3;

reg  [9:0]	spc5_stb_ced_cntr3;
reg  	        spc5_stb_ced3_d;
reg  	        spc5_stb_ced_capture3;
wire  	        spc5_stb_ced3;

reg 	        spc5_atm3_d;
reg  [9:0]	spc5_atm_cntr3;
reg             spc5_atm_intrpt_capture3;
reg             spc5_atm_intrpt_b4capture3;
reg             spc5_atm_inv_capture3;


reg  [39:0]     spc5_stb_wr_addr3;
reg  [39:0]     spc5_stb_atm_addr3;
reg             spc5_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc5_fpick = {spc5_mpick,spc5_spick,spc5_lpick,spc5_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc5_msquash,spc5_apick,spc5_fpick})
         9'b000000000 : spc5_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc5_fpicko = 1'b0;
         9'b1xxxxxxxx : spc5_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc5_fpicko = 1'b0;
	 default:
	  begin
		spc5_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon5 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc5_exu_und = {spc5_l2,
			  spc5_unc,
			  spc5_fpld,
			  spc5_fpldst,
			  spc5_unflush,
			  spc5_ldw,
			  spc5_byp,
			  spc5_flsh,
			  spc5_chm,
			  spc5_ldxa,
			  spc5_ato,
			  spc5_pref,
			  spc5_chit,
			  spc5_dcp,
			  spc5_dtp,
			  spc5_mpc,
			  spc5_mpu};

always @(spc5_exu_und)
begin
       case (spc5_exu_und)
         17'h00000 : spc5_exu =  5'h00;
         17'h00001 : spc5_exu =  5'h01;
         17'h00002 : spc5_exu =  5'h02;
         17'h00004 : spc5_exu =  5'h03;
         17'h00008 : spc5_exu =  5'h04;
         17'h00010 : spc5_exu =  5'h05;
         17'h00020 : spc5_exu =  5'h06;
         17'h00040 : spc5_exu =  5'h07;
         17'h00080 : spc5_exu =  5'h08;
         17'h00100 : spc5_exu =  5'h09;
         17'h00200 : spc5_exu =  5'h0a;
         17'h00400 : spc5_exu =  5'h0b;
         17'h00800 : spc5_exu =  5'h0c;
         17'h01000 : spc5_exu =  5'h0d;
         17'h02000 : spc5_exu =  5'h0e;
         17'h04000 : spc5_exu =  5'h0f;
         17'h08000 : spc5_exu =  5'h10;
         17'h10000 : spc5_exu =  5'h11;
	 default: spc5_exu =  5'h12;
       endcase
end
//excp
assign spc5_exp_und = {spc5_exp_wtchpt_trp_g,
			  spc5_exp_misalign_addr_ldst_atm_m,
			  spc5_exp_priv_violtn_g,
			  spc5_exp_daccess_excptn_g,
			  spc5_exp_daccess_prot_g,
			  spc5_exp_priv_action_g,
			  spc5_exp_spec_access_epage_g,
			  spc5_exp_uncache_atomic_g,
			  spc5_exp_illegal_asi_action_g,
			  spc5_exp_flt_ld_nfo_pg_g,
			  spc5_exp_asi_rd_unc,
			  spc5_exp_tlb_data_ce,
			  spc5_exp_tlb_data_ue,
			  spc5_exp_tlb_tag_ue,
			  spc5_exp_unc,
			  spc5_exp_corr};

always @(spc5_exp_und)
begin
       case (spc5_exp_und)
         16'h0000 : spc5_exp =  5'h00;
         16'h0001 : spc5_exp =  5'h01;
         16'h0002 : spc5_exp =  5'h02;
         16'h0004 : spc5_exp =  5'h03;
         16'h0008 : spc5_exp =  5'h04;
         16'h0010 : spc5_exp =  5'h05;
         16'h0020 : spc5_exp =  5'h06;
         16'h0040 : spc5_exp =  5'h07;
         16'h0080 : spc5_exp =  5'h08;
         16'h0100 : spc5_exp =  5'h09;
         16'h0200 : spc5_exp =  5'h0a;
         16'h0400 : spc5_exp =  5'h0b;
         16'h0800 : spc5_exp =  5'h0c;
         16'h1000 : spc5_exp =  5'h0d;
         16'h2000 : spc5_exp =  5'h0e;
         16'h4000 : spc5_exp =  5'h0f;
         16'h8000 : spc5_exp =  5'h10;
	 default: spc5_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc5_dctl_stxa_cmplt0 = ((spc5_dctl_stxa_internal_d2 & spc5_dctl_thread0_w3) |
				       spc5_dctl_stxa_stall_wr_cmplt0_d1);
assign spc5_dctl_l2fill_cmplt0 = (((spc5_dctl_lsu_l2fill_vld & ~spc5_dctl_atomic_ld_squash_e &
					    ~spc5_dctl_lsu_ignore_fill)) & ~spc5_dctl_l2fill_fpld_e &
					  ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread0);

assign spc5_dctl_fillerr0 = spc5_dctl_l2_corr_error_e & spc5_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc5_dctl_atm_cmplt0 = (spc5_dctl_lsu_atm_st_cmplt_e & ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread0);

assign spc5_dctl_ldst_cond_cmplt0 = { spc5_dctl_stxa_cmplt0, spc5_dctl_l2fill_cmplt0,
					    spc5_dctl_atomic_ld_squash_e, spc5_dctl_intld_byp_cmplt[0],
					    spc5_dctl_bsync0_reset, spc5_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc5_cmplt0 = { spc5_dctl_ldxa_illgl_va_cmplt_d1, spc5_dctl_pref_tlbmiss_cmplt_d2,
			      spc5_dctl_lsu_pcx_pref_issue, spc5_dctl_diag_wr_cmplt0, spc5_dctl_l2fill_fpld_e};


always @(spc5_cmplt0 or spc5_dctl_ldst_cond_cmplt0)
begin
       case ({spc5_dctl_fillerr0,spc5_dctl_ldst_cond_cmplt0,spc5_cmplt0})
         12'h000 : spc5_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc5_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc5_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc5_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc5_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc5_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc5_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc5_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc5_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc5_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc5_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc5_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc5_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc5_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc5_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc5_dctl_stxa_cmplt1 = ((spc5_dctl_stxa_internal_d2 & spc5_dctl_thread1_w3) |
				       spc5_dctl_stxa_stall_wr_cmplt1_d1);
assign spc5_dctl_l2fill_cmplt1 = (((spc5_dctl_lsu_l2fill_vld & ~spc5_dctl_atomic_ld_squash_e &
					    ~spc5_dctl_lsu_ignore_fill)) & ~spc5_dctl_l2fill_fpld_e &
					  ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread1);

assign spc5_dctl_fillerr1 = spc5_dctl_l2_corr_error_e & spc5_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc5_dctl_atm_cmplt1 = (spc5_dctl_lsu_atm_st_cmplt_e & ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread1);

assign spc5_dctl_ldst_cond_cmplt1 = { spc5_dctl_stxa_cmplt1, spc5_dctl_l2fill_cmplt1,
					    spc5_dctl_atomic_ld_squash_e, spc5_dctl_intld_byp_cmplt[1],
					    spc5_dctl_bsync1_reset, spc5_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc5_cmplt1 = { spc5_dctl_ldxa_illgl_va_cmplt_d1, spc5_dctl_pref_tlbmiss_cmplt_d2,
			      spc5_dctl_lsu_pcx_pref_issue, spc5_dctl_diag_wr_cmplt1, spc5_dctl_l2fill_fpld_e};


always @(spc5_cmplt1 or spc5_dctl_ldst_cond_cmplt1)
begin
       case ({spc5_dctl_fillerr1,spc5_dctl_ldst_cond_cmplt1,spc5_cmplt1})
         12'h000 : spc5_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc5_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc5_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc5_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc5_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc5_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc5_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc5_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc5_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc5_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc5_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc5_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc5_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc5_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc5_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc5_dctl_stxa_cmplt2 = ((spc5_dctl_stxa_internal_d2 & spc5_dctl_thread2_w3) |
				       spc5_dctl_stxa_stall_wr_cmplt2_d1);
assign spc5_dctl_l2fill_cmplt2 = (((spc5_dctl_lsu_l2fill_vld & ~spc5_dctl_atomic_ld_squash_e &
					    ~spc5_dctl_lsu_ignore_fill)) & ~spc5_dctl_l2fill_fpld_e &
					  ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread2);

assign spc5_dctl_fillerr2 = spc5_dctl_l2_corr_error_e & spc5_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc5_dctl_atm_cmplt2 = (spc5_dctl_lsu_atm_st_cmplt_e & ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread2);

assign spc5_dctl_ldst_cond_cmplt2 = { spc5_dctl_stxa_cmplt2, spc5_dctl_l2fill_cmplt2,
					    spc5_dctl_atomic_ld_squash_e, spc5_dctl_intld_byp_cmplt[2],
					    spc5_dctl_bsync2_reset, spc5_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc5_cmplt2 = { spc5_dctl_ldxa_illgl_va_cmplt_d1, spc5_dctl_pref_tlbmiss_cmplt_d2,
			      spc5_dctl_lsu_pcx_pref_issue, spc5_dctl_diag_wr_cmplt2, spc5_dctl_l2fill_fpld_e};


always @(spc5_cmplt2 or spc5_dctl_ldst_cond_cmplt2)
begin
       case ({spc5_dctl_fillerr2,spc5_dctl_ldst_cond_cmplt2,spc5_cmplt2})
         12'h000 : spc5_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc5_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc5_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc5_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc5_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc5_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc5_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc5_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc5_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc5_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc5_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc5_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc5_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc5_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc5_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc5_dctl_stxa_cmplt3 = ((spc5_dctl_stxa_internal_d2 & spc5_dctl_thread3_w3) |
				       spc5_dctl_stxa_stall_wr_cmplt3_d1);
assign spc5_dctl_l2fill_cmplt3 = (((spc5_dctl_lsu_l2fill_vld & ~spc5_dctl_atomic_ld_squash_e &
					    ~spc5_dctl_lsu_ignore_fill)) & ~spc5_dctl_l2fill_fpld_e &
					  ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread3);

assign spc5_dctl_fillerr3 = spc5_dctl_l2_corr_error_e & spc5_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc5_dctl_atm_cmplt3 = (spc5_dctl_lsu_atm_st_cmplt_e & ~spc5_dctl_fill_err_trap_e & spc5_dctl_dfill_thread3);

assign spc5_dctl_ldst_cond_cmplt3 = { spc5_dctl_stxa_cmplt3, spc5_dctl_l2fill_cmplt3,
					    spc5_dctl_atomic_ld_squash_e, spc5_dctl_intld_byp_cmplt[3],
					    spc5_dctl_bsync3_reset, spc5_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc5_cmplt3 = { spc5_dctl_ldxa_illgl_va_cmplt_d1, spc5_dctl_pref_tlbmiss_cmplt_d2,
			      spc5_dctl_lsu_pcx_pref_issue, spc5_dctl_diag_wr_cmplt3, spc5_dctl_l2fill_fpld_e};


always @(spc5_cmplt3 or spc5_dctl_ldst_cond_cmplt3)
begin
       case ({spc5_dctl_fillerr3,spc5_dctl_ldst_cond_cmplt3,spc5_cmplt3})
         12'h000 : spc5_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc5_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc5_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc5_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc5_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc5_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc5_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc5_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc5_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc5_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc5_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc5_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc5_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc5_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc5_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc5_ldstcond_cmplt0 or spc5_ldstcond_cmplt1 or spc5_ldstcond_cmplt2
	 or spc5_ldstcond_cmplt3 or spc5_dctl_lsu_ifu_ldst_cmplt
	 or spc5_dctl_late_cmplt0 or spc5_dctl_late_cmplt1 or spc5_dctl_late_cmplt2 or spc5_dctl_late_cmplt3)
begin
       case (spc5_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc5_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc5_ldstcond_cmplt_d = spc5_dctl_late_cmplt0 ? spc5_ldstcond_cmplt0_d : spc5_ldstcond_cmplt0;
         4'b0010 : spc5_ldstcond_cmplt_d = spc5_dctl_late_cmplt1 ? spc5_ldstcond_cmplt1_d : spc5_ldstcond_cmplt1;
         4'b0100 : spc5_ldstcond_cmplt_d = spc5_dctl_late_cmplt2 ? spc5_ldstcond_cmplt2_d : spc5_ldstcond_cmplt2;
         4'b1000 : spc5_ldstcond_cmplt_d = spc5_dctl_late_cmplt3 ? spc5_ldstcond_cmplt3_d : spc5_ldstcond_cmplt3;
         4'b0011 : spc5_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc5_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc5_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc5_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc5_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc5_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc5_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc5_st_ooo_ret = { spc5_st0_lt_1, spc5_st0_lt_2, spc5_st0_lt_3,
			      spc5_st1_lt_0, spc5_st1_lt_2, spc5_st1_lt_3,
			      spc5_st2_lt_0, spc5_st2_lt_1, spc5_st2_lt_3,
			      spc5_st3_lt_0, spc5_st3_lt_1, spc5_st3_lt_2};

always @(posedge clk)
begin
    if(~spc5_st0_unfilled || ~rst_l)
      spc5_st0_unfilled_d <= 1'b0;
    else
      spc5_st0_unfilled_d <= spc5_st0_unfilled;

    if(~rst_l)
      spc5_ldstcond_cmplt0_d <= 4'h0;
    else
      spc5_ldstcond_cmplt0_d <= spc5_ldstcond_cmplt0;

    if(~spc5_ld0_pkt_vld_unmasked || ~rst_l)
      spc5_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc5_ld0_pkt_vld_unmasked_d <= spc5_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc5_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc5_qctl1_ld_sec_hit_thrd0 && spc5_qctl1_ld0_inst_vld_g)
      spc5_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc5_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc5_st1_unfilled || ~rst_l)
      spc5_st1_unfilled_d <= 1'b0;
    else
      spc5_st1_unfilled_d <= spc5_st1_unfilled;

    if(~rst_l)
      spc5_ldstcond_cmplt1_d <= 4'h0;
    else
      spc5_ldstcond_cmplt1_d <= spc5_ldstcond_cmplt1;

    if(~spc5_ld1_pkt_vld_unmasked || ~rst_l)
      spc5_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc5_ld1_pkt_vld_unmasked_d <= spc5_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc5_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc5_qctl1_ld_sec_hit_thrd1 && spc5_qctl1_ld1_inst_vld_g)
      spc5_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc5_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc5_st2_unfilled || ~rst_l)
      spc5_st2_unfilled_d <= 1'b0;
    else
      spc5_st2_unfilled_d <= spc5_st2_unfilled;

    if(~rst_l)
      spc5_ldstcond_cmplt2_d <= 4'h0;
    else
      spc5_ldstcond_cmplt2_d <= spc5_ldstcond_cmplt2;

    if(~spc5_ld2_pkt_vld_unmasked || ~rst_l)
      spc5_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc5_ld2_pkt_vld_unmasked_d <= spc5_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc5_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc5_qctl1_ld_sec_hit_thrd2 && spc5_qctl1_ld2_inst_vld_g)
      spc5_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc5_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc5_st3_unfilled || ~rst_l)
      spc5_st3_unfilled_d <= 1'b0;
    else
      spc5_st3_unfilled_d <= spc5_st3_unfilled;

    if(~rst_l)
      spc5_ldstcond_cmplt3_d <= 4'h0;
    else
      spc5_ldstcond_cmplt3_d <= spc5_ldstcond_cmplt3;

    if(~spc5_ld3_pkt_vld_unmasked || ~rst_l)
      spc5_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc5_ld3_pkt_vld_unmasked_d <= spc5_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc5_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc5_qctl1_ld_sec_hit_thrd3 && spc5_qctl1_ld3_inst_vld_g)
      spc5_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc5_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc5_stb_state_ced0) && (|spc5_stb_state_rst0)) || ~rst_l)
      spc5_st0_unfilled <= 1'b0;
    else if( ((|spc5_stb_state_ced0) && ~(|spc5_stb_state_rst0)))
      spc5_st0_unfilled <= 1'b1;
    else
      spc5_st0_unfilled <= spc5_st0_unfilled;
    if( ((|spc5_stb_state_ced1) && (|spc5_stb_state_rst1)) || ~rst_l)
      spc5_st1_unfilled <= 1'b0;
    else if( ((|spc5_stb_state_ced1) && ~(|spc5_stb_state_rst1)))
      spc5_st1_unfilled <= 1'b1;
    else
      spc5_st1_unfilled <= spc5_st1_unfilled;
    if( ((|spc5_stb_state_ced2) && (|spc5_stb_state_rst2)) || ~rst_l)
      spc5_st2_unfilled <= 1'b0;
    else if( ((|spc5_stb_state_ced2) && ~(|spc5_stb_state_rst2)))
      spc5_st2_unfilled <= 1'b1;
    else
      spc5_st2_unfilled <= spc5_st2_unfilled;
    if( ((|spc5_stb_state_ced3) && (|spc5_stb_state_rst3)) || ~rst_l)
      spc5_st3_unfilled <= 1'b0;
    else if( ((|spc5_stb_state_ced3) && ~(|spc5_stb_state_rst3)))
      spc5_st3_unfilled <= 1'b1;
    else
      spc5_st3_unfilled <= spc5_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc5_st0_unfilled && spc5_st0_unfilled_d)|| ~rst_l)
      begin
        spc5_st0_unf_cntr <= 9'h000;
      end
    else if(spc5_st0_unfilled)
      begin
        spc5_st0_unf_cntr <= spc5_st0_unf_cntr + 1;
      end
    else
      begin
        spc5_st0_unf_cntr <= spc5_st0_unf_cntr;
      end
    if((~spc5_st1_unfilled && spc5_st1_unfilled_d)|| ~rst_l)
      begin
        spc5_st1_unf_cntr <= 9'h000;
      end
    else if(spc5_st1_unfilled)
      begin
        spc5_st1_unf_cntr <= spc5_st1_unf_cntr + 1;
      end
    else
      begin
        spc5_st1_unf_cntr <= spc5_st1_unf_cntr;
      end
    if((~spc5_st2_unfilled && spc5_st2_unfilled_d)|| ~rst_l)
      begin
        spc5_st2_unf_cntr <= 9'h000;
      end
    else if(spc5_st2_unfilled)
      begin
        spc5_st2_unf_cntr <= spc5_st2_unf_cntr + 1;
      end
    else
      begin
        spc5_st2_unf_cntr <= spc5_st2_unf_cntr;
      end
    if((~spc5_st3_unfilled && spc5_st3_unfilled_d)|| ~rst_l)
      begin
        spc5_st3_unf_cntr <= 9'h000;
      end
    else if(spc5_st3_unfilled)
      begin
        spc5_st3_unf_cntr <= spc5_st3_unf_cntr + 1;
      end
    else
      begin
        spc5_st3_unf_cntr <= spc5_st3_unf_cntr;
      end
end

always @(spc5_st0_unfilled or spc5_st1_unfilled or spc5_st2_unfilled or spc5_st3_unfilled
	 or spc5_st0_unfilled_d or spc5_st1_unfilled_d or spc5_st2_unfilled_d or spc5_st3_unfilled_d)
begin
if(~spc5_st0_unfilled && spc5_st0_unfilled_d && spc5_st1_unfilled)
 spc5_st0_lt_1 <= (spc5_st1_unf_cntr > spc5_st0_unf_cntr);
else
 spc5_st0_lt_1 <= 1'b0;
if(~spc5_st0_unfilled && spc5_st0_unfilled_d && spc5_st2_unfilled)
 spc5_st0_lt_2 <= (spc5_st2_unf_cntr > spc5_st0_unf_cntr);
else
 spc5_st0_lt_2 <= 1'b0;
if(~spc5_st0_unfilled && spc5_st0_unfilled_d && spc5_st3_unfilled)
 spc5_st0_lt_3 <= (spc5_st3_unf_cntr > spc5_st0_unf_cntr);
else
 spc5_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc5_st1_unfilled && spc5_st1_unfilled_d && spc5_st0_unfilled)
 spc5_st1_lt_0 <= (spc5_st0_unf_cntr > spc5_st1_unf_cntr);
else
 spc5_st1_lt_0 <= 1'b0;
if(~spc5_st1_unfilled && spc5_st1_unfilled_d && spc5_st2_unfilled)
 spc5_st1_lt_2 <= (spc5_st2_unf_cntr > spc5_st1_unf_cntr);
else
 spc5_st1_lt_2 <= 1'b0;
if(~spc5_st1_unfilled && spc5_st1_unfilled_d && spc5_st3_unfilled)
 spc5_st1_lt_3 <= (spc5_st3_unf_cntr > spc5_st1_unf_cntr);
else
 spc5_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc5_st2_unfilled && spc5_st2_unfilled_d && spc5_st0_unfilled)
 spc5_st2_lt_0 <= (spc5_st0_unf_cntr > spc5_st2_unf_cntr);
else
 spc5_st2_lt_0 <= 1'b0;
if(~spc5_st2_unfilled && spc5_st2_unfilled_d && spc5_st1_unfilled)
 spc5_st2_lt_1 <= (spc5_st1_unf_cntr > spc5_st2_unf_cntr);
else
 spc5_st2_lt_1 <= 1'b0;
if(~spc5_st2_unfilled && spc5_st2_unfilled_d && spc5_st3_unfilled)
 spc5_st2_lt_3 <= (spc5_st3_unf_cntr > spc5_st2_unf_cntr);
else
 spc5_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc5_st3_unfilled && spc5_st3_unfilled_d && spc5_st0_unfilled)
 spc5_st3_lt_0 <= (spc5_st0_unf_cntr > spc5_st3_unf_cntr);
else
 spc5_st3_lt_0 <= 1'b0;
if(~spc5_st3_unfilled && spc5_st3_unfilled_d && spc5_st1_unfilled)
 spc5_st3_lt_1 <= (spc5_st1_unf_cntr > spc5_st3_unf_cntr);
else
 spc5_st3_lt_1 <= 1'b0;
if(~spc5_st3_unfilled && spc5_st3_unfilled_d && spc5_st2_unfilled)
 spc5_st3_lt_2 <= (spc5_st2_unf_cntr > spc5_st3_unf_cntr);
else
 spc5_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc5_ld_ooo_ret = { spc5_ld0_lt_1, spc5_ld0_lt_2, spc5_ld0_lt_3,
			      spc5_ld1_lt_0, spc5_ld1_lt_2, spc5_ld1_lt_3,
			      spc5_ld2_lt_0, spc5_ld2_lt_1, spc5_ld2_lt_3,
			      spc5_ld3_lt_0, spc5_ld3_lt_1, spc5_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc5_ld0_unfilled && spc5_ld0_unfilled_d)|| ~rst_l)
      begin
        spc5_ld0_unf_cntr <= 9'h000;
      end
    else if(spc5_ld0_unfilled)
      begin
        spc5_ld0_unf_cntr <= spc5_ld0_unf_cntr + 1;
      end
    else
      begin
        spc5_ld0_unf_cntr <= spc5_ld0_unf_cntr;
      end
    if((~spc5_ld1_unfilled && spc5_ld1_unfilled_d)|| ~rst_l)
      begin
        spc5_ld1_unf_cntr <= 9'h000;
      end
    else if(spc5_ld1_unfilled)
      begin
        spc5_ld1_unf_cntr <= spc5_ld1_unf_cntr + 1;
      end
    else
      begin
        spc5_ld1_unf_cntr <= spc5_ld1_unf_cntr;
      end
    if((~spc5_ld2_unfilled && spc5_ld2_unfilled_d)|| ~rst_l)
      begin
        spc5_ld2_unf_cntr <= 9'h000;
      end
    else if(spc5_ld2_unfilled)
      begin
        spc5_ld2_unf_cntr <= spc5_ld2_unf_cntr + 1;
      end
    else
      begin
        spc5_ld2_unf_cntr <= spc5_ld2_unf_cntr;
      end
    if((~spc5_ld3_unfilled && spc5_ld3_unfilled_d)|| ~rst_l)
      begin
        spc5_ld3_unf_cntr <= 9'h000;
      end
    else if(spc5_ld3_unfilled)
      begin
        spc5_ld3_unf_cntr <= spc5_ld3_unf_cntr + 1;
      end
    else
      begin
        spc5_ld3_unf_cntr <= spc5_ld3_unf_cntr;
      end
end

always @(spc5_ld0_unfilled or spc5_ld1_unfilled or spc5_ld2_unfilled or spc5_ld3_unfilled
	 or spc5_ld0_unfilled_d or spc5_ld1_unfilled_d or spc5_ld2_unfilled_d or spc5_ld3_unfilled_d)
begin
if(~spc5_ld0_unfilled && spc5_ld0_unfilled_d && spc5_ld1_unfilled)
 spc5_ld0_lt_1 <= (spc5_ld1_unf_cntr > spc5_ld0_unf_cntr);
else
 spc5_ld0_lt_1 <= 1'b0;
if(~spc5_ld0_unfilled && spc5_ld0_unfilled_d && spc5_ld2_unfilled)
 spc5_ld0_lt_2 <= (spc5_ld2_unf_cntr > spc5_ld0_unf_cntr);
else
 spc5_ld0_lt_2 <= 1'b0;
if(~spc5_ld0_unfilled && spc5_ld0_unfilled_d && spc5_ld3_unfilled)
 spc5_ld0_lt_3 <= (spc5_ld3_unf_cntr > spc5_ld0_unf_cntr);
else
 spc5_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc5_ld1_unfilled && spc5_ld1_unfilled_d && spc5_ld0_unfilled)
 spc5_ld1_lt_0 <= (spc5_ld0_unf_cntr > spc5_ld1_unf_cntr);
else
 spc5_ld1_lt_0 <= 1'b0;
if(~spc5_ld1_unfilled && spc5_ld1_unfilled_d && spc5_ld2_unfilled)
 spc5_ld1_lt_2 <= (spc5_ld2_unf_cntr > spc5_ld1_unf_cntr);
else
 spc5_ld1_lt_2 <= 1'b0;
if(~spc5_ld1_unfilled && spc5_ld1_unfilled_d && spc5_ld3_unfilled)
 spc5_ld1_lt_3 <= (spc5_ld3_unf_cntr > spc5_ld1_unf_cntr);
else
 spc5_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc5_ld2_unfilled && spc5_ld2_unfilled_d && spc5_ld0_unfilled)
 spc5_ld2_lt_0 <= (spc5_ld0_unf_cntr > spc5_ld2_unf_cntr);
else
 spc5_ld2_lt_0 <= 1'b0;
if(~spc5_ld2_unfilled && spc5_ld2_unfilled_d && spc5_ld1_unfilled)
 spc5_ld2_lt_1 <= (spc5_ld1_unf_cntr > spc5_ld2_unf_cntr);
else
 spc5_ld2_lt_1 <= 1'b0;
if(~spc5_ld2_unfilled && spc5_ld2_unfilled_d && spc5_ld3_unfilled)
 spc5_ld2_lt_3 <= (spc5_ld3_unf_cntr > spc5_ld2_unf_cntr);
else
 spc5_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc5_ld3_unfilled && spc5_ld3_unfilled_d && spc5_ld0_unfilled)
 spc5_ld3_lt_0 <= (spc5_ld0_unf_cntr > spc5_ld3_unf_cntr);
else
 spc5_ld3_lt_0 <= 1'b0;
if(~spc5_ld3_unfilled && spc5_ld3_unfilled_d && spc5_ld1_unfilled)
 spc5_ld3_lt_1 <= (spc5_ld1_unf_cntr > spc5_ld3_unf_cntr);
else
 spc5_ld3_lt_1 <= 1'b0;
if(~spc5_ld3_unfilled && spc5_ld3_unfilled_d && spc5_ld2_unfilled)
 spc5_ld3_lt_2 <= (spc5_ld2_unf_cntr > spc5_ld3_unf_cntr);
else
 spc5_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc5_dctl_bld_hit =
((|spc5_dctl_lsu_way_hit[3:0])  & spc5_dctl_dcache_enable_g &
  ~spc5_dctl_ldxa_internal & ~spc5_dctl_dcache_rd_parity_error & ~spc5_dctl_dtag_perror_g &
  ~spc5_dctl_endian_mispred_g &
  ~spc5_dctl_atomic_g & ~spc5_dctl_ncache_asild_rq_g) & ~spc5_dctl_tte_data_perror_unc &
  spc5_dctl_ld_inst_vld_g & spc5_qctl1_bld_g ;

assign spc5_dctl_bld_stb_hit = spc5_dctl_bld_hit & spc5_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc5_bld0_full_d <= 2'b00;
      spc5_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc5_bld0_full_d <= spc5_qctl1_bld_cnt;
      spc5_ld0_unfilled_d <= spc5_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc5_bld1_full_d <= 2'b00;
      spc5_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc5_bld1_full_d <= spc5_qctl1_bld_cnt;
      spc5_ld1_unfilled_d <= spc5_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc5_bld2_full_d <= 2'b00;
      spc5_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc5_bld2_full_d <= spc5_qctl1_bld_cnt;
      spc5_ld2_unfilled_d <= spc5_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc5_bld3_full_d <= 2'b00;
      spc5_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc5_bld3_full_d <= spc5_qctl1_bld_cnt;
      spc5_ld3_unfilled_d <= spc5_ld3_unfilled;
     end
end
always @(spc5_bld0_full_d or spc5_qctl1_bld_cnt)
begin
 if( (spc5_bld0_full_d != spc5_qctl1_bld_cnt) && (spc5_bld0_full_d == 2'd0))
    spc5_bld0_full_capture <= 1'b1;
 else
    spc5_bld0_full_capture <= 1'b0;
end
always @(spc5_bld1_full_d or spc5_qctl1_bld_cnt)
begin
 if( (spc5_bld1_full_d != spc5_qctl1_bld_cnt) && (spc5_bld1_full_d == 2'd1))
    spc5_bld1_full_capture <= 1'b1;
 else
    spc5_bld1_full_capture <= 1'b0;
end
always @(spc5_bld2_full_d or spc5_qctl1_bld_cnt)
begin
 if( (spc5_bld2_full_d != spc5_qctl1_bld_cnt) && (spc5_bld2_full_d == 2'd2))
    spc5_bld2_full_capture <= 1'b1;
 else
    spc5_bld2_full_capture <= 1'b0;
end
always @(spc5_bld3_full_d or spc5_qctl1_bld_cnt)
begin
 if( (spc5_bld3_full_d != spc5_qctl1_bld_cnt) && (spc5_bld3_full_d == 2'd3))
    spc5_bld3_full_capture <= 1'b1;
 else
    spc5_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc5_qctl1_bld_cnt != 2'b00) && (spc5_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc5_bld0_full_cntr <= 9'h000;
      end
    else if(spc5_qctl1_bld_g && (spc5_qctl1_bld_cnt == 2'b00))
      begin
        spc5_bld0_full_cntr <= spc5_bld0_full_cntr + 1;
      end
    else if( (spc5_qctl1_bld_cnt == 2'b00) && (spc5_bld0_full_cntr != 9'h000))
      begin
        spc5_bld0_full_cntr <= spc5_bld0_full_cntr + 1;
      end
    else
      begin
        spc5_bld0_full_cntr <= spc5_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc5_qctl1_bld_cnt != 2'b01) && (spc5_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc5_bld1_full_cntr <= 9'h000;
      end
    else if(spc5_qctl1_bld_cnt == 2'b01)
      begin
        spc5_bld1_full_cntr <= spc5_bld1_full_cntr + 1;
      end
    else if( (spc5_qctl1_bld_cnt == 2'b01) && (spc5_bld1_full_cntr != 9'h000))
      begin
        spc5_bld1_full_cntr <= spc5_bld1_full_cntr + 1;
      end
    else
      begin
        spc5_bld1_full_cntr <= spc5_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc5_qctl1_bld_cnt != 2'b10) && (spc5_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc5_bld2_full_cntr <= 9'h000;
      end
    else if(spc5_qctl1_bld_cnt == 2'b10)
      begin
        spc5_bld2_full_cntr <= spc5_bld2_full_cntr + 1;
      end
    else if( (spc5_qctl1_bld_cnt == 2'b10) && (spc5_bld2_full_cntr != 9'h000))
      begin
        spc5_bld2_full_cntr <= spc5_bld2_full_cntr + 1;
      end
    else
      begin
        spc5_bld2_full_cntr <= spc5_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc5_qctl1_bld_cnt != 2'b11) && (spc5_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc5_bld3_full_cntr <= 9'h000;
      end
    else if(spc5_qctl1_bld_cnt == 2'b11)
      begin
        spc5_bld3_full_cntr <= spc5_bld3_full_cntr + 1;
      end
    else if( (spc5_qctl1_bld_cnt == 2'b11) && (spc5_bld3_full_cntr != 9'h000))
      begin
        spc5_bld3_full_cntr <= spc5_bld3_full_cntr + 1;
      end
    else
      begin
        spc5_bld3_full_cntr <= spc5_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc5_stb_state_vld0) && ~spc5_atomic_g) || ~rst_l)
      begin
        spc5_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc5_atomic_g && (spc5_atm_type0 != 8'h00) && spc5_wptr_vld)
      begin
        spc5_stb_atm_addr0 <= {spc5_wdata_ramc[44:9],spc5_wdata_ramd[67:64]};
      end
    else
      begin
        spc5_stb_atm_addr0 <= spc5_stb_atm_addr0;
      end
    if( ( ~(|spc5_stb_state_vld1) && ~spc5_atomic_g) || ~rst_l)
      begin
        spc5_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc5_atomic_g && (spc5_atm_type1 != 8'h00) && spc5_wptr_vld)
      begin
        spc5_stb_atm_addr1 <= {spc5_wdata_ramc[44:9],spc5_wdata_ramd[67:64]};
      end
    else
      begin
        spc5_stb_atm_addr1 <= spc5_stb_atm_addr1;
      end
    if( ( ~(|spc5_stb_state_vld2) && ~spc5_atomic_g) || ~rst_l)
      begin
        spc5_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc5_atomic_g && (spc5_atm_type2 != 8'h00) && spc5_wptr_vld)
      begin
        spc5_stb_atm_addr2 <= {spc5_wdata_ramc[44:9],spc5_wdata_ramd[67:64]};
      end
    else
      begin
        spc5_stb_atm_addr2 <= spc5_stb_atm_addr2;
      end
    if( ( ~(|spc5_stb_state_vld3) && ~spc5_atomic_g) || ~rst_l)
      begin
        spc5_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc5_atomic_g && (spc5_atm_type3 != 8'h00) && spc5_wptr_vld)
      begin
        spc5_stb_atm_addr3 <= {spc5_wdata_ramc[44:9],spc5_wdata_ramd[67:64]};
      end
    else
      begin
        spc5_stb_atm_addr3 <= spc5_stb_atm_addr3;
      end
end

 assign spc5_dfq_full = (spc5_dfq_vld_entries >= 3'd4);


assign spc5_dfq_full1 = (spc5_dfq_vld_entries >= (3'd4 + 1));

always @(spc5_dfq_full_d1 or spc5_dfq_full1)
begin
  if (spc5_dfq_full_d1 && ~spc5_dfq_full1)
    spc5_dfq_full_capture1 <= 1'b1;
  else
    spc5_dfq_full_capture1 <= 1'b0;
end

assign spc5_dfq_full2 = (spc5_dfq_vld_entries >= (3'd4 + 2));

always @(spc5_dfq_full_d2 or spc5_dfq_full2)
begin
  if (spc5_dfq_full_d2 && ~spc5_dfq_full2)
    spc5_dfq_full_capture2 <= 1'b1;
  else
    spc5_dfq_full_capture2 <= 1'b0;
end

assign spc5_dfq_full3 = (spc5_dfq_vld_entries >= (3'd4 + 3));

always @(spc5_dfq_full_d3 or spc5_dfq_full3)
begin
  if (spc5_dfq_full_d3 && ~spc5_dfq_full3)
    spc5_dfq_full_capture3 <= 1'b1;
  else
    spc5_dfq_full_capture3 <= 1'b0;
end

assign spc5_dfq_full4 = (spc5_dfq_vld_entries >= (3'd4 + 4));

always @(spc5_dfq_full_d4 or spc5_dfq_full4)
begin
  if (spc5_dfq_full_d4 && ~spc5_dfq_full4)
    spc5_dfq_full_capture4 <= 1'b1;
  else
    spc5_dfq_full_capture4 <= 1'b0;
end

assign spc5_dfq_full5 = (spc5_dfq_vld_entries >= (3'd4 + 5));

always @(spc5_dfq_full_d5 or spc5_dfq_full5)
begin
  if (spc5_dfq_full_d5 && ~spc5_dfq_full5)
    spc5_dfq_full_capture5 <= 1'b1;
  else
    spc5_dfq_full_capture5 <= 1'b0;
end

assign spc5_dfq_full6 = (spc5_dfq_vld_entries >= (3'd4 + 6));

always @(spc5_dfq_full_d6 or spc5_dfq_full6)
begin
  if (spc5_dfq_full_d6 && ~spc5_dfq_full6)
    spc5_dfq_full_capture6 <= 1'b1;
  else
    spc5_dfq_full_capture6 <= 1'b0;
end

assign spc5_dfq_full7 = (spc5_dfq_vld_entries >= (3'd4 + 7));

always @(spc5_dfq_full_d7 or spc5_dfq_full7)
begin
  if (spc5_dfq_full_d7 && ~spc5_dfq_full7)
    spc5_dfq_full_capture7 <= 1'b1;
  else
    spc5_dfq_full_capture7 <= 1'b0;
end

always @(spc5_mbar_vld_d0 or spc5_mbar_vld0)
begin
  if (spc5_mbar_vld_d0 && ~spc5_mbar_vld0)
    spc5_mbar_vld_capture0 <= 1'b1;
  else
    spc5_mbar_vld_capture0 <= 1'b0;
end
always @(spc5_mbar_vld_d1 or spc5_mbar_vld1)
begin
  if (spc5_mbar_vld_d1 && ~spc5_mbar_vld1)
    spc5_mbar_vld_capture1 <= 1'b1;
  else
    spc5_mbar_vld_capture1 <= 1'b0;
end
always @(spc5_mbar_vld_d2 or spc5_mbar_vld2)
begin
  if (spc5_mbar_vld_d2 && ~spc5_mbar_vld2)
    spc5_mbar_vld_capture2 <= 1'b1;
  else
    spc5_mbar_vld_capture2 <= 1'b0;
end
always @(spc5_mbar_vld_d3 or spc5_mbar_vld3)
begin
  if (spc5_mbar_vld_d3 && ~spc5_mbar_vld3)
    spc5_mbar_vld_capture3 <= 1'b1;
  else
    spc5_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc5_dfq_full1 && (spc5_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr1 <= 9'h000;
       spc5_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr1);
      end
    else if( spc5_dfq_full1)
      begin
       spc5_dfq_full_cntr1 <= spc5_dfq_full_cntr1 + 1;
       spc5_dfq_full_d1 <= spc5_dfq_full1;
      end
    else
      begin
       spc5_dfq_full_cntr1 <= spc5_dfq_full_cntr1;
       spc5_dfq_full_d1 <= spc5_dfq_full1;
      end
    if( ( ~spc5_dfq_full2 && (spc5_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr2 <= 9'h000;
       spc5_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr2);
      end
    else if( spc5_dfq_full2)
      begin
       spc5_dfq_full_cntr2 <= spc5_dfq_full_cntr2 + 1;
       spc5_dfq_full_d2 <= spc5_dfq_full2;
      end
    else
      begin
       spc5_dfq_full_cntr2 <= spc5_dfq_full_cntr2;
       spc5_dfq_full_d2 <= spc5_dfq_full2;
      end
    if( ( ~spc5_dfq_full3 && (spc5_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr3 <= 9'h000;
       spc5_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr3);
      end
    else if( spc5_dfq_full3)
      begin
       spc5_dfq_full_cntr3 <= spc5_dfq_full_cntr3 + 1;
       spc5_dfq_full_d3 <= spc5_dfq_full3;
      end
    else
      begin
       spc5_dfq_full_cntr3 <= spc5_dfq_full_cntr3;
       spc5_dfq_full_d3 <= spc5_dfq_full3;
      end
    if( ( ~spc5_dfq_full4 && (spc5_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr4 <= 9'h000;
       spc5_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr4);
      end
    else if( spc5_dfq_full4)
      begin
       spc5_dfq_full_cntr4 <= spc5_dfq_full_cntr4 + 1;
       spc5_dfq_full_d4 <= spc5_dfq_full4;
      end
    else
      begin
       spc5_dfq_full_cntr4 <= spc5_dfq_full_cntr4;
       spc5_dfq_full_d4 <= spc5_dfq_full4;
      end
    if( ( ~spc5_dfq_full5 && (spc5_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr5 <= 9'h000;
       spc5_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr5);
      end
    else if( spc5_dfq_full5)
      begin
       spc5_dfq_full_cntr5 <= spc5_dfq_full_cntr5 + 1;
       spc5_dfq_full_d5 <= spc5_dfq_full5;
      end
    else
      begin
       spc5_dfq_full_cntr5 <= spc5_dfq_full_cntr5;
       spc5_dfq_full_d5 <= spc5_dfq_full5;
      end
    if( ( ~spc5_dfq_full6 && (spc5_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr6 <= 9'h000;
       spc5_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr6);
      end
    else if( spc5_dfq_full6)
      begin
       spc5_dfq_full_cntr6 <= spc5_dfq_full_cntr6 + 1;
       spc5_dfq_full_d6 <= spc5_dfq_full6;
      end
    else
      begin
       spc5_dfq_full_cntr6 <= spc5_dfq_full_cntr6;
       spc5_dfq_full_d6 <= spc5_dfq_full6;
      end
    if( ( ~spc5_dfq_full7 && (spc5_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr7 <= 9'h000;
       spc5_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr7);
      end
    else if( spc5_dfq_full7)
      begin
       spc5_dfq_full_cntr7 <= spc5_dfq_full_cntr7 + 1;
       spc5_dfq_full_d7 <= spc5_dfq_full7;
      end
    else
      begin
       spc5_dfq_full_cntr7 <= spc5_dfq_full_cntr7;
       spc5_dfq_full_d7 <= spc5_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc5_intrpt0_cmplt or spc5_atm_cntr0 or spc5_stb_state_ced0)
begin
  if (spc5_intrpt0_cmplt && (spc5_atm_cntr0 != 9'h000) && ~(|spc5_stb_state_ced0))
    spc5_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc5_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc5_intrpt1_cmplt or spc5_atm_cntr1 or spc5_stb_state_ced1)
begin
  if (spc5_intrpt1_cmplt && (spc5_atm_cntr1 != 9'h000) && ~(|spc5_stb_state_ced1))
    spc5_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc5_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc5_intrpt2_cmplt or spc5_atm_cntr2 or spc5_stb_state_ced2)
begin
  if (spc5_intrpt2_cmplt && (spc5_atm_cntr2 != 9'h000) && ~(|spc5_stb_state_ced2))
    spc5_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc5_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc5_intrpt3_cmplt or spc5_atm_cntr3 or spc5_stb_state_ced3)
begin
  if (spc5_intrpt3_cmplt && (spc5_atm_cntr3 != 9'h000) && ~(|spc5_stb_state_ced3))
    spc5_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc5_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc5_intrpt0_cmplt or spc5_atm_cntr0 or spc5_stb_state_ced0)
begin
  if (spc5_intrpt0_cmplt && (spc5_atm_cntr0 != 9'h000) && (|spc5_stb_state_ced0))
    spc5_atm_intrpt_capture0 <= 1'b1;
  else
    spc5_atm_intrpt_capture0 <= 1'b0;
end
always @(spc5_intrpt1_cmplt or spc5_atm_cntr1 or spc5_stb_state_ced1)
begin
  if (spc5_intrpt1_cmplt && (spc5_atm_cntr1 != 9'h000) && (|spc5_stb_state_ced1))
    spc5_atm_intrpt_capture1 <= 1'b1;
  else
    spc5_atm_intrpt_capture1 <= 1'b0;
end
always @(spc5_intrpt2_cmplt or spc5_atm_cntr2 or spc5_stb_state_ced2)
begin
  if (spc5_intrpt2_cmplt && (spc5_atm_cntr2 != 9'h000) && (|spc5_stb_state_ced2))
    spc5_atm_intrpt_capture2 <= 1'b1;
  else
    spc5_atm_intrpt_capture2 <= 1'b0;
end
always @(spc5_intrpt3_cmplt or spc5_atm_cntr3 or spc5_stb_state_ced3)
begin
  if (spc5_intrpt3_cmplt && (spc5_atm_cntr3 != 9'h000) && (|spc5_stb_state_ced3))
    spc5_atm_intrpt_capture3 <= 1'b1;
  else
    spc5_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc5_atm_cntr0 or spc5_dva_din or spc5_dva_wen)
begin
  if (~spc5_dva_din && spc5_dva_wen && (spc5_atm_cntr0 != 9'h000))
    spc5_atm_inv_capture0 <= 1'b1;
  else
    spc5_atm_inv_capture0 <= 1'b0;
end
always @(spc5_atm_cntr1 or spc5_dva_din or spc5_dva_wen)
begin
  if (~spc5_dva_din && spc5_dva_wen && (spc5_atm_cntr1 != 9'h000))
    spc5_atm_inv_capture1 <= 1'b1;
  else
    spc5_atm_inv_capture1 <= 1'b0;
end
always @(spc5_atm_cntr2 or spc5_dva_din or spc5_dva_wen)
begin
  if (~spc5_dva_din && spc5_dva_wen && (spc5_atm_cntr2 != 9'h000))
    spc5_atm_inv_capture2 <= 1'b1;
  else
    spc5_atm_inv_capture2 <= 1'b0;
end
always @(spc5_atm_cntr3 or spc5_dva_din or spc5_dva_wen)
begin
  if (~spc5_dva_din && spc5_dva_wen && (spc5_atm_cntr3 != 9'h000))
    spc5_atm_inv_capture3 <= 1'b1;
  else
    spc5_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc5_stb_state_vld0) && (spc5_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_atm_cntr0 <= 9'h000;
       spc5_atm0_d <= 1'b0;
      end
    else if( spc5_atomic_g && (spc5_atm_type0 != 8'h00))
      begin
       spc5_atm_cntr0 <= spc5_atm_cntr0 + 1;
       spc5_atm0_d <= 1'b1;
      end
    else if( spc5_atm0_d && (|spc5_stb_state_vld0))
      begin
       spc5_atm_cntr0 <= spc5_atm_cntr0 + 1;
       spc5_atm0_d <= spc5_atm0_d;
      end
    else
      begin
       spc5_atm_cntr0 <= spc5_atm_cntr0;
       spc5_atm0_d <= spc5_atm0_d;
      end
    if( ( ~(|spc5_stb_state_vld1) && (spc5_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_atm_cntr1 <= 9'h000;
       spc5_atm1_d <= 1'b0;
      end
    else if( spc5_atomic_g && (spc5_atm_type1 != 8'h00))
      begin
       spc5_atm_cntr1 <= spc5_atm_cntr1 + 1;
       spc5_atm1_d <= 1'b1;
      end
    else if( spc5_atm1_d && (|spc5_stb_state_vld1))
      begin
       spc5_atm_cntr1 <= spc5_atm_cntr1 + 1;
       spc5_atm1_d <= spc5_atm1_d;
      end
    else
      begin
       spc5_atm_cntr1 <= spc5_atm_cntr1;
       spc5_atm1_d <= spc5_atm1_d;
      end
    if( ( ~(|spc5_stb_state_vld2) && (spc5_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_atm_cntr2 <= 9'h000;
       spc5_atm2_d <= 1'b0;
      end
    else if( spc5_atomic_g && (spc5_atm_type2 != 8'h00))
      begin
       spc5_atm_cntr2 <= spc5_atm_cntr2 + 1;
       spc5_atm2_d <= 1'b1;
      end
    else if( spc5_atm2_d && (|spc5_stb_state_vld2))
      begin
       spc5_atm_cntr2 <= spc5_atm_cntr2 + 1;
       spc5_atm2_d <= spc5_atm2_d;
      end
    else
      begin
       spc5_atm_cntr2 <= spc5_atm_cntr2;
       spc5_atm2_d <= spc5_atm2_d;
      end
    if( ( ~(|spc5_stb_state_vld3) && (spc5_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_atm_cntr3 <= 9'h000;
       spc5_atm3_d <= 1'b0;
      end
    else if( spc5_atomic_g && (spc5_atm_type3 != 8'h00))
      begin
       spc5_atm_cntr3 <= spc5_atm_cntr3 + 1;
       spc5_atm3_d <= 1'b1;
      end
    else if( spc5_atm3_d && (|spc5_stb_state_vld3))
      begin
       spc5_atm_cntr3 <= spc5_atm_cntr3 + 1;
       spc5_atm3_d <= spc5_atm3_d;
      end
    else
      begin
       spc5_atm_cntr3 <= spc5_atm_cntr3;
       spc5_atm3_d <= spc5_atm3_d;
      end
end

 assign spc5_raw_ack_capture0 = spc5_stb_ack_vld0 && (spc5_stb_ack_cntr0 != 9'h000);
 assign spc5_stb_ced0 = |spc5_stb_state_ced0;
 assign spc5_raw_ack_capture1 = spc5_stb_ack_vld1 && (spc5_stb_ack_cntr1 != 9'h000);
 assign spc5_stb_ced1 = |spc5_stb_state_ced1;
 assign spc5_raw_ack_capture2 = spc5_stb_ack_vld2 && (spc5_stb_ack_cntr2 != 9'h000);
 assign spc5_stb_ced2 = |spc5_stb_state_ced2;
 assign spc5_raw_ack_capture3 = spc5_stb_ack_vld3 && (spc5_stb_ack_cntr3 != 9'h000);
 assign spc5_stb_ced3 = |spc5_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc5_stb_ced0 && (spc5_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ced_cntr0 <= 9'h000;
       spc5_stb_ced0_d <= 1'b0;
      end
    else if( spc5_stb_ced0 && (spc5_stb_state_ack0 == 8'h00))
      begin
       spc5_stb_ced_cntr0 <= spc5_stb_ced_cntr0 + 1;
       spc5_stb_ced0_d <= spc5_stb_ced0;
      end
    else
      begin
       spc5_stb_ced_cntr0 <= spc5_stb_ced_cntr0;
       spc5_stb_ced0_d <= spc5_stb_ced0_d;
      end

    if( ( ~spc5_mbar_vld0 && (spc5_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_mbar_vld_cntr0 <= 9'h000;
       spc5_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_mbar_vld_counter = %d", spc5_mbar_vld_cntr0);
      end
    else if( spc5_mbar_vld0)
      begin
       spc5_mbar_vld_cntr0 <= spc5_mbar_vld_cntr0 + 1;
       spc5_mbar_vld_d0 <= spc5_mbar_vld0;
      end
    else
      begin
       spc5_mbar_vld_cntr0 <= spc5_mbar_vld_cntr0;
       spc5_mbar_vld_d0 <= spc5_mbar_vld0;
      end

    if( ( ~spc5_flsh_vld0 && (spc5_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_flsh_vld_cntr0 <= 9'h000;
       spc5_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_flsh_vld_counter = %d", spc5_flsh_vld_cntr0);
      end
    else if( spc5_flsh_vld0)
      begin
       spc5_flsh_vld_cntr0 <= spc5_flsh_vld_cntr0 + 1;
       spc5_flsh_vld_d0 <= spc5_flsh_vld0;
      end
    else
      begin
       spc5_flsh_vld_cntr0 <= spc5_flsh_vld_cntr0;
       spc5_flsh_vld_d0 <= spc5_flsh_vld0;
      end

    if( ( ~spc5_stb_ced1 && (spc5_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ced_cntr1 <= 9'h000;
       spc5_stb_ced1_d <= 1'b0;
      end
    else if( spc5_stb_ced1 && (spc5_stb_state_ack1 == 8'h00))
      begin
       spc5_stb_ced_cntr1 <= spc5_stb_ced_cntr1 + 1;
       spc5_stb_ced1_d <= spc5_stb_ced1;
      end
    else
      begin
       spc5_stb_ced_cntr1 <= spc5_stb_ced_cntr1;
       spc5_stb_ced1_d <= spc5_stb_ced1_d;
      end

    if( ( ~spc5_mbar_vld1 && (spc5_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_mbar_vld_cntr1 <= 9'h000;
       spc5_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_mbar_vld_counter = %d", spc5_mbar_vld_cntr1);
      end
    else if( spc5_mbar_vld1)
      begin
       spc5_mbar_vld_cntr1 <= spc5_mbar_vld_cntr1 + 1;
       spc5_mbar_vld_d1 <= spc5_mbar_vld1;
      end
    else
      begin
       spc5_mbar_vld_cntr1 <= spc5_mbar_vld_cntr1;
       spc5_mbar_vld_d1 <= spc5_mbar_vld1;
      end

    if( ( ~spc5_flsh_vld1 && (spc5_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_flsh_vld_cntr1 <= 9'h000;
       spc5_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_flsh_vld_counter = %d", spc5_flsh_vld_cntr1);
      end
    else if( spc5_flsh_vld1)
      begin
       spc5_flsh_vld_cntr1 <= spc5_flsh_vld_cntr1 + 1;
       spc5_flsh_vld_d1 <= spc5_flsh_vld1;
      end
    else
      begin
       spc5_flsh_vld_cntr1 <= spc5_flsh_vld_cntr1;
       spc5_flsh_vld_d1 <= spc5_flsh_vld1;
      end

    if( ( ~spc5_stb_ced2 && (spc5_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ced_cntr2 <= 9'h000;
       spc5_stb_ced2_d <= 1'b0;
      end
    else if( spc5_stb_ced2 && (spc5_stb_state_ack2 == 8'h00))
      begin
       spc5_stb_ced_cntr2 <= spc5_stb_ced_cntr2 + 1;
       spc5_stb_ced2_d <= spc5_stb_ced2;
      end
    else
      begin
       spc5_stb_ced_cntr2 <= spc5_stb_ced_cntr2;
       spc5_stb_ced2_d <= spc5_stb_ced2_d;
      end

    if( ( ~spc5_mbar_vld2 && (spc5_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_mbar_vld_cntr2 <= 9'h000;
       spc5_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_mbar_vld_counter = %d", spc5_mbar_vld_cntr2);
      end
    else if( spc5_mbar_vld2)
      begin
       spc5_mbar_vld_cntr2 <= spc5_mbar_vld_cntr2 + 1;
       spc5_mbar_vld_d2 <= spc5_mbar_vld2;
      end
    else
      begin
       spc5_mbar_vld_cntr2 <= spc5_mbar_vld_cntr2;
       spc5_mbar_vld_d2 <= spc5_mbar_vld2;
      end

    if( ( ~spc5_flsh_vld2 && (spc5_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_flsh_vld_cntr2 <= 9'h000;
       spc5_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_flsh_vld_counter = %d", spc5_flsh_vld_cntr2);
      end
    else if( spc5_flsh_vld2)
      begin
       spc5_flsh_vld_cntr2 <= spc5_flsh_vld_cntr2 + 1;
       spc5_flsh_vld_d2 <= spc5_flsh_vld2;
      end
    else
      begin
       spc5_flsh_vld_cntr2 <= spc5_flsh_vld_cntr2;
       spc5_flsh_vld_d2 <= spc5_flsh_vld2;
      end

    if( ( ~spc5_stb_ced3 && (spc5_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ced_cntr3 <= 9'h000;
       spc5_stb_ced3_d <= 1'b0;
      end
    else if( spc5_stb_ced3 && (spc5_stb_state_ack3 == 8'h00))
      begin
       spc5_stb_ced_cntr3 <= spc5_stb_ced_cntr3 + 1;
       spc5_stb_ced3_d <= spc5_stb_ced3;
      end
    else
      begin
       spc5_stb_ced_cntr3 <= spc5_stb_ced_cntr3;
       spc5_stb_ced3_d <= spc5_stb_ced3_d;
      end

    if( ( ~spc5_mbar_vld3 && (spc5_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_mbar_vld_cntr3 <= 9'h000;
       spc5_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_mbar_vld_counter = %d", spc5_mbar_vld_cntr3);
      end
    else if( spc5_mbar_vld3)
      begin
       spc5_mbar_vld_cntr3 <= spc5_mbar_vld_cntr3 + 1;
       spc5_mbar_vld_d3 <= spc5_mbar_vld3;
      end
    else
      begin
       spc5_mbar_vld_cntr3 <= spc5_mbar_vld_cntr3;
       spc5_mbar_vld_d3 <= spc5_mbar_vld3;
      end

    if( ( ~spc5_flsh_vld3 && (spc5_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_flsh_vld_cntr3 <= 9'h000;
       spc5_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_flsh_vld_counter = %d", spc5_flsh_vld_cntr3);
      end
    else if( spc5_flsh_vld3)
      begin
       spc5_flsh_vld_cntr3 <= spc5_flsh_vld_cntr3 + 1;
       spc5_flsh_vld_d3 <= spc5_flsh_vld3;
      end
    else
      begin
       spc5_flsh_vld_cntr3 <= spc5_flsh_vld_cntr3;
       spc5_flsh_vld_d3 <= spc5_flsh_vld3;
      end

end

always @(spc5_flsh_vld_d0 or spc5_flsh_vld0)
begin
  if (spc5_flsh_vld_d0 && ~spc5_flsh_vld0)
    spc5_flsh_vld_capture0 <= 1'b1;
  else
    spc5_flsh_vld_capture0 <= 1'b0;
end
always @(spc5_flsh_vld_d1 or spc5_flsh_vld1)
begin
  if (spc5_flsh_vld_d1 && ~spc5_flsh_vld1)
    spc5_flsh_vld_capture1 <= 1'b1;
  else
    spc5_flsh_vld_capture1 <= 1'b0;
end
always @(spc5_flsh_vld_d2 or spc5_flsh_vld2)
begin
  if (spc5_flsh_vld_d2 && ~spc5_flsh_vld2)
    spc5_flsh_vld_capture2 <= 1'b1;
  else
    spc5_flsh_vld_capture2 <= 1'b0;
end
always @(spc5_flsh_vld_d3 or spc5_flsh_vld3)
begin
  if (spc5_flsh_vld_d3 && ~spc5_flsh_vld3)
    spc5_flsh_vld_capture3 <= 1'b1;
  else
    spc5_flsh_vld_capture3 <= 1'b0;
end

always @(spc5_lmiss_pa0 or spc5_imiss_pa or spc5_imiss_vld_d or spc5_lmiss_vld0)
begin
if((spc5_lmiss_pa0 == spc5_imiss_pa) && spc5_imiss_vld_d && spc5_lmiss_vld0)
 spc5_lmiss_eq0 = 1'b1;
else
 spc5_lmiss_eq0 = 1'b0;
end
always @(spc5_lmiss_pa1 or spc5_imiss_pa or spc5_imiss_vld_d or spc5_lmiss_vld1)
begin
if((spc5_lmiss_pa1 == spc5_imiss_pa) && spc5_imiss_vld_d && spc5_lmiss_vld1)
 spc5_lmiss_eq1 = 1'b1;
else
 spc5_lmiss_eq1 = 1'b0;
end
always @(spc5_lmiss_pa2 or spc5_imiss_pa or spc5_imiss_vld_d or spc5_lmiss_vld2)
begin
if((spc5_lmiss_pa2 == spc5_imiss_pa) && spc5_imiss_vld_d && spc5_lmiss_vld2)
 spc5_lmiss_eq2 = 1'b1;
else
 spc5_lmiss_eq2 = 1'b0;
end
always @(spc5_lmiss_pa3 or spc5_imiss_pa or spc5_imiss_vld_d or spc5_lmiss_vld3)
begin
if((spc5_lmiss_pa3 == spc5_imiss_pa) && spc5_imiss_vld_d && spc5_lmiss_vld3)
 spc5_lmiss_eq3 = 1'b1;
else
 spc5_lmiss_eq3 = 1'b0;
end

always @(spc5_lmiss_pa0 or spc5_stb_atm_addr0 or spc5_atm_cntr0 or spc5_lmiss_vld0)
begin
if ( ((spc5_lmiss_pa0 == spc5_stb_atm_addr0) && (spc5_atm_cntr0 != 9'h000) && spc5_lmiss_vld0) ||
     ((spc5_lmiss_pa1 == spc5_stb_atm_addr0) && (spc5_atm_cntr0 != 9'h000) && spc5_lmiss_vld1) ||
     ((spc5_lmiss_pa2 == spc5_stb_atm_addr0) && (spc5_atm_cntr0 != 9'h000) && spc5_lmiss_vld2) ||
     ((spc5_lmiss_pa3 == spc5_stb_atm_addr0) && (spc5_atm_cntr0 != 9'h000) && spc5_lmiss_vld3) )

 spc5_atm_lmiss_eq0 = 1'b1;
else
 spc5_atm_lmiss_eq0 = 1'b0;
end
always @(spc5_lmiss_pa1 or spc5_stb_atm_addr1 or spc5_atm_cntr1 or spc5_lmiss_vld1)
begin
if ( ((spc5_lmiss_pa0 == spc5_stb_atm_addr1) && (spc5_atm_cntr1 != 9'h000) && spc5_lmiss_vld0) ||
     ((spc5_lmiss_pa1 == spc5_stb_atm_addr1) && (spc5_atm_cntr1 != 9'h000) && spc5_lmiss_vld1) ||
     ((spc5_lmiss_pa2 == spc5_stb_atm_addr1) && (spc5_atm_cntr1 != 9'h000) && spc5_lmiss_vld2) ||
     ((spc5_lmiss_pa3 == spc5_stb_atm_addr1) && (spc5_atm_cntr1 != 9'h000) && spc5_lmiss_vld3) )

 spc5_atm_lmiss_eq1 = 1'b1;
else
 spc5_atm_lmiss_eq1 = 1'b0;
end
always @(spc5_lmiss_pa2 or spc5_stb_atm_addr2 or spc5_atm_cntr2 or spc5_lmiss_vld2)
begin
if ( ((spc5_lmiss_pa0 == spc5_stb_atm_addr2) && (spc5_atm_cntr2 != 9'h000) && spc5_lmiss_vld0) ||
     ((spc5_lmiss_pa1 == spc5_stb_atm_addr2) && (spc5_atm_cntr2 != 9'h000) && spc5_lmiss_vld1) ||
     ((spc5_lmiss_pa2 == spc5_stb_atm_addr2) && (spc5_atm_cntr2 != 9'h000) && spc5_lmiss_vld2) ||
     ((spc5_lmiss_pa3 == spc5_stb_atm_addr2) && (spc5_atm_cntr2 != 9'h000) && spc5_lmiss_vld3) )

 spc5_atm_lmiss_eq2 = 1'b1;
else
 spc5_atm_lmiss_eq2 = 1'b0;
end
always @(spc5_lmiss_pa3 or spc5_stb_atm_addr3 or spc5_atm_cntr3 or spc5_lmiss_vld3)
begin
if ( ((spc5_lmiss_pa0 == spc5_stb_atm_addr3) && (spc5_atm_cntr3 != 9'h000) && spc5_lmiss_vld0) ||
     ((spc5_lmiss_pa1 == spc5_stb_atm_addr3) && (spc5_atm_cntr3 != 9'h000) && spc5_lmiss_vld1) ||
     ((spc5_lmiss_pa2 == spc5_stb_atm_addr3) && (spc5_atm_cntr3 != 9'h000) && spc5_lmiss_vld2) ||
     ((spc5_lmiss_pa3 == spc5_stb_atm_addr3) && (spc5_atm_cntr3 != 9'h000) && spc5_lmiss_vld3) )

 spc5_atm_lmiss_eq3 = 1'b1;
else
 spc5_atm_lmiss_eq3 = 1'b0;
end

always @(spc5_imiss_pa or spc5_stb_atm_addr0 or spc5_atm_cntr0 or spc5_imiss_vld_d)
begin
if((spc5_imiss_pa == spc5_stb_atm_addr0) && (spc5_atm_cntr0 != 9'h000) && spc5_imiss_vld_d)
 spc5_atm_imiss_eq0 = 1'b1;
else
 spc5_atm_imiss_eq0 = 1'b0;
end
always @(spc5_imiss_pa or spc5_stb_atm_addr1 or spc5_atm_cntr1 or spc5_imiss_vld_d)
begin
if((spc5_imiss_pa == spc5_stb_atm_addr1) && (spc5_atm_cntr1 != 9'h000) && spc5_imiss_vld_d)
 spc5_atm_imiss_eq1 = 1'b1;
else
 spc5_atm_imiss_eq1 = 1'b0;
end
always @(spc5_imiss_pa or spc5_stb_atm_addr2 or spc5_atm_cntr2 or spc5_imiss_vld_d)
begin
if((spc5_imiss_pa == spc5_stb_atm_addr2) && (spc5_atm_cntr2 != 9'h000) && spc5_imiss_vld_d)
 spc5_atm_imiss_eq2 = 1'b1;
else
 spc5_atm_imiss_eq2 = 1'b0;
end
always @(spc5_imiss_pa or spc5_stb_atm_addr3 or spc5_atm_cntr3 or spc5_imiss_vld_d)
begin
if((spc5_imiss_pa == spc5_stb_atm_addr3) && (spc5_atm_cntr3 != 9'h000) && spc5_imiss_vld_d)
 spc5_atm_imiss_eq3 = 1'b1;
else
 spc5_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc5_imiss_vld || ~rst_l)
   spc5_imiss_vld_d <= 1'b0;
 else
   spc5_imiss_vld_d <= spc5_imiss_vld;

 if( ~spc5_ld_miss || ~rst_l)
   spc5_ld_miss_capture <= 1'b0;
 else
   spc5_ld_miss_capture <= spc5_ld_miss;

end

always @(spc5_stb_ced0 or spc5_stb_ced0_d)
begin
if (~spc5_stb_ced0 && spc5_stb_ced0_d)
spc5_stb_ced_capture0 <= 1'b1;
else
spc5_stb_ced_capture0 <= 1'b0;

end
always @(spc5_stb_ced1 or spc5_stb_ced1_d)
begin
if (~spc5_stb_ced1 && spc5_stb_ced1_d)
spc5_stb_ced_capture1 <= 1'b1;
else
spc5_stb_ced_capture1 <= 1'b0;

end
always @(spc5_stb_ced2 or spc5_stb_ced2_d)
begin
if (~spc5_stb_ced2 && spc5_stb_ced2_d)
spc5_stb_ced_capture2 <= 1'b1;
else
spc5_stb_ced_capture2 <= 1'b0;

end
always @(spc5_stb_ced3 or spc5_stb_ced3_d)
begin
if (~spc5_stb_ced3 && spc5_stb_ced3_d)
spc5_stb_ced_capture3 <= 1'b1;
else
spc5_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc5_stb_state_ack0 != 8'h00 && (spc5_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_ack_counter0 = %d", spc5_stb_ack_cntr0);
      end
    else if(spc5_stb_cam_hit && spc5_ld0_inst_vld_g && (spc5_stb_state_ack0 == 8'h00))
      begin
       spc5_stb_ack_cntr0 <= spc5_stb_ack_cntr0 + 1;
      end
    else if( (spc5_stb_state_ack0 == 8'h00 ) && (spc5_stb_ack_cntr0 != 9'h000))
      begin
       spc5_stb_ack_cntr0 <= spc5_stb_ack_cntr0 + 1;
      end // if ( (spc5_stb_state_ack0 == 8'h00 ) && (spc5_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc5_stb_ack_cntr0 <= spc5_stb_ack_cntr0;
      end

    if( (spc5_stb_state_ack1 != 8'h00 && (spc5_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_ack_counter1 = %d", spc5_stb_ack_cntr1);
      end
    else if(spc5_stb_cam_hit && spc5_ld1_inst_vld_g && (spc5_stb_state_ack1 == 8'h00))
      begin
       spc5_stb_ack_cntr1 <= spc5_stb_ack_cntr1 + 1;
      end
    else if( (spc5_stb_state_ack1 == 8'h00 ) && (spc5_stb_ack_cntr1 != 9'h000))
      begin
       spc5_stb_ack_cntr1 <= spc5_stb_ack_cntr1 + 1;
      end // if ( (spc5_stb_state_ack1 == 8'h00 ) && (spc5_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc5_stb_ack_cntr1 <= spc5_stb_ack_cntr1;
      end

    if( (spc5_stb_state_ack2 != 8'h00 && (spc5_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_ack_counter2 = %d", spc5_stb_ack_cntr2);
      end
    else if(spc5_stb_cam_hit && spc5_ld2_inst_vld_g && (spc5_stb_state_ack2 == 8'h00))
      begin
       spc5_stb_ack_cntr2 <= spc5_stb_ack_cntr2 + 1;
      end
    else if( (spc5_stb_state_ack2 == 8'h00 ) && (spc5_stb_ack_cntr2 != 9'h000))
      begin
       spc5_stb_ack_cntr2 <= spc5_stb_ack_cntr2 + 1;
      end // if ( (spc5_stb_state_ack2 == 8'h00 ) && (spc5_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc5_stb_ack_cntr2 <= spc5_stb_ack_cntr2;
      end

    if( (spc5_stb_state_ack3 != 8'h00 && (spc5_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_ack_counter3 = %d", spc5_stb_ack_cntr3);
      end
    else if(spc5_stb_cam_hit && spc5_ld3_inst_vld_g && (spc5_stb_state_ack3 == 8'h00))
      begin
       spc5_stb_ack_cntr3 <= spc5_stb_ack_cntr3 + 1;
      end
    else if( (spc5_stb_state_ack3 == 8'h00 ) && (spc5_stb_ack_cntr3 != 9'h000))
      begin
       spc5_stb_ack_cntr3 <= spc5_stb_ack_cntr3 + 1;
      end // if ( (spc5_stb_state_ack3 == 8'h00 ) && (spc5_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc5_stb_ack_cntr3 <= spc5_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc5_stb0_full_w2 or spc5_stb0_full)
begin
if (~spc5_stb0_full_w2 && spc5_stb0_full)
spc5_stb_full_capture0 <= 1'b1;
else
spc5_stb_full_capture0 <= 1'b0;

end
always @(spc5_stb1_full_w2 or spc5_stb1_full)
begin
if (~spc5_stb1_full_w2 && spc5_stb1_full)
spc5_stb_full_capture1 <= 1'b1;
else
spc5_stb_full_capture1 <= 1'b0;

end
always @(spc5_stb2_full_w2 or spc5_stb2_full)
begin
if (~spc5_stb2_full_w2 && spc5_stb2_full)
spc5_stb_full_capture2 <= 1'b1;
else
spc5_stb_full_capture2 <= 1'b0;

end
always @(spc5_stb3_full_w2 or spc5_stb3_full)
begin
if (~spc5_stb3_full_w2 && spc5_stb3_full)
spc5_stb_full_capture3 <= 1'b1;
else
spc5_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc5_stb0_full && (spc5_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_full_counter0 = %d", spc5_stb_full_cntr0);
      end
    else if( spc5_stb0_full)
      begin
       spc5_stb_full_cntr0 <= spc5_stb_full_cntr0 + 1;
      end
    else
      begin
       spc5_stb_full_cntr0 <= spc5_stb_full_cntr0;
      end
    if( ( ~spc5_stb1_full && (spc5_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_full_counter1 = %d", spc5_stb_full_cntr1);
      end
    else if( spc5_stb1_full)
      begin
       spc5_stb_full_cntr1 <= spc5_stb_full_cntr1 + 1;
      end
    else
      begin
       spc5_stb_full_cntr1 <= spc5_stb_full_cntr1;
      end
    if( ( ~spc5_stb2_full && (spc5_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_full_counter2 = %d", spc5_stb_full_cntr2);
      end
    else if( spc5_stb2_full)
      begin
       spc5_stb_full_cntr2 <= spc5_stb_full_cntr2 + 1;
      end
    else
      begin
       spc5_stb_full_cntr2 <= spc5_stb_full_cntr2;
      end
    if( ( ~spc5_stb3_full && (spc5_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc5_stb_full_counter3 = %d", spc5_stb_full_cntr3);
      end
    else if( spc5_stb3_full)
      begin
       spc5_stb_full_cntr3 <= spc5_stb_full_cntr3 + 1;
      end
    else
      begin
       spc5_stb_full_cntr3 <= spc5_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc5_lmq0_full_d or spc5_lmq0_full)
begin
if (spc5_lmq0_full_d && ~spc5_lmq0_full)
spc5_lmq_full_capture0 <= 1'b1;
else
spc5_lmq_full_capture0 <= 1'b0;

end
always @(spc5_lmq1_full_d or spc5_lmq1_full)
begin
if (spc5_lmq1_full_d && ~spc5_lmq1_full)
spc5_lmq_full_capture1 <= 1'b1;
else
spc5_lmq_full_capture1 <= 1'b0;

end
always @(spc5_lmq2_full_d or spc5_lmq2_full)
begin
if (spc5_lmq2_full_d && ~spc5_lmq2_full)
spc5_lmq_full_capture2 <= 1'b1;
else
spc5_lmq_full_capture2 <= 1'b0;

end
always @(spc5_lmq3_full_d or spc5_lmq3_full)
begin
if (spc5_lmq3_full_d && ~spc5_lmq3_full)
spc5_lmq_full_capture3 <= 1'b1;
else
spc5_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc5_lmq0_full && (spc5_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc5_lmq_full_cntr0 <= 9'h000;
       spc5_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_lmq_full_counter0 = %d", spc5_lmq_full_cntr0);
      end
    else if( spc5_lmq0_full)
      begin
       spc5_lmq_full_cntr0 <= spc5_lmq_full_cntr0 + 1;
       spc5_lmq0_full_d <= spc5_lmq0_full;
      end
    else
      begin
       spc5_lmq_full_cntr0 <= spc5_lmq_full_cntr0;
       spc5_lmq0_full_d <= spc5_lmq0_full;
      end

    if( ( ~spc5_lmq1_full && (spc5_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc5_lmq_full_cntr1 <= 9'h000;
       spc5_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_lmq_full_counter1 = %d", spc5_lmq_full_cntr1);
      end
    else if( spc5_lmq1_full)
      begin
       spc5_lmq_full_cntr1 <= spc5_lmq_full_cntr1 + 1;
       spc5_lmq1_full_d <= spc5_lmq1_full;
      end
    else
      begin
       spc5_lmq_full_cntr1 <= spc5_lmq_full_cntr1;
       spc5_lmq1_full_d <= spc5_lmq1_full;
      end

    if( ( ~spc5_lmq2_full && (spc5_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc5_lmq_full_cntr2 <= 9'h000;
       spc5_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_lmq_full_counter2 = %d", spc5_lmq_full_cntr2);
      end
    else if( spc5_lmq2_full)
      begin
       spc5_lmq_full_cntr2 <= spc5_lmq_full_cntr2 + 1;
       spc5_lmq2_full_d <= spc5_lmq2_full;
      end
    else
      begin
       spc5_lmq_full_cntr2 <= spc5_lmq_full_cntr2;
       spc5_lmq2_full_d <= spc5_lmq2_full;
      end

    if( ( ~spc5_lmq3_full && (spc5_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc5_lmq_full_cntr3 <= 9'h000;
       spc5_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_lmq_full_counter3 = %d", spc5_lmq_full_cntr3);
      end
    else if( spc5_lmq3_full)
      begin
       spc5_lmq_full_cntr3 <= spc5_lmq_full_cntr3 + 1;
       spc5_lmq3_full_d <= spc5_lmq3_full;
      end
    else
      begin
       spc5_lmq_full_cntr3 <= spc5_lmq_full_cntr3;
       spc5_lmq3_full_d <= spc5_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc5_dfq_full_d or spc5_dfq_full)
begin
  if (spc5_dfq_full_d && ~spc5_dfq_full)
    spc5_dfq_full_capture <= 1'b1;
  else
    spc5_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc5_dfq_full && (spc5_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc5_dfq_full_cntr <= 9'h000;
       spc5_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dfq_full_counter = %d", spc5_dfq_full_cntr);
      end
    else if( spc5_dfq_full)
      begin
       spc5_dfq_full_cntr <= spc5_dfq_full_cntr + 1;
       spc5_dfq_full_d <= spc5_dfq_full;
      end
    else
      begin
       spc5_dfq_full_cntr <= spc5_dfq_full_cntr;
       spc5_dfq_full_d <= spc5_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc5_dva_full_d or spc5_dva_inv)
begin
  if (spc5_dva_full_d && ~spc5_dva_inv)
    spc5_dva_full_capture <= 1'b1;
  else
    spc5_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc5_dva_din && spc5_dva_wen)
    begin
     spc5_dva_inv <= 1'b1;
     spc5_dva_waddr_d <= spc5_dva_waddr;
    end
  else if(~spc5_dva_din && spc5_dva_wen)
    begin
     spc5_dva_inv <= 1'b0;
     spc5_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc5_dva_inv <= spc5_dva_inv;
     spc5_dva_waddr_d <= spc5_dva_waddr_d;
    end
end

always @(spc5_dva_raddr or spc5_dva_ren or spc5_dva_inv)
begin
  if (spc5_dva_inv && spc5_dva_ren && (spc5_dva_raddr[6:2] == spc5_dva_waddr_d))
    spc5_dva_vld2lkup <= 1'b1;
  else
    spc5_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc5_dva_inv && (spc5_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc5_dva_full_cntr <= 9'h000;
       spc5_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc5_dva_full_counter = %d", spc5_dva_full_cntr);
      end
    else if( spc5_dva_inv)
      begin
       spc5_dva_full_cntr <= spc5_dva_full_cntr + 1;
       spc5_dva_full_d <= spc5_dva_inv;
      end
    else
      begin
       spc5_dva_full_cntr <= spc5_dva_full_cntr;
       spc5_dva_full_d <= spc5_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc5_dva_vfull_d or spc5_dva_vld)
begin
  if (spc5_dva_vfull_d && ~spc5_dva_vld)
    spc5_dva_vfull_capture <= 1'b1;
  else
    spc5_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc5_dva_din && spc5_dva_wen)
   begin
    spc5_dva_vld <= 1'b1;
    spc5_dva_invwaddr_d <= spc5_dva_waddr;
    spc5_dva_invld_err <= spc5_dva_inv_perror;
   end
  else if(spc5_dva_din && spc5_dva_wen)
    begin
     spc5_dva_vld <= 1'b0;
     spc5_dva_invwaddr_d <= 5'b00000;
     spc5_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc5_dva_vld <= spc5_dva_vld;
     spc5_dva_invwaddr_d <= spc5_dva_invwaddr_d;
     spc5_dva_invld_err <= spc5_dva_invld_err;
    end
end


always @(spc5_dva_raddr or spc5_dva_ren or spc5_dva_vld)
begin
  if (spc5_dva_vld && spc5_dva_ren && (spc5_dva_raddr[6:2] == spc5_dva_waddr_d))
    spc5_dva_invld2lkup <= 1'b1;
  else
    spc5_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc5_dva_vld && (spc5_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc5_dva_vfull_cntr <= 9'h000;
    spc5_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc5_dva_vfull_counter = %d", spc5_dva_vfull_cntr);
  end
    else if( spc5_dva_vld)
    begin
      spc5_dva_vfull_cntr <= spc5_dva_vfull_cntr + 1;
      spc5_dva_vfull_d <= spc5_dva_vld;
    end
    else
    begin
      spc5_dva_vfull_cntr <= spc5_dva_vfull_cntr;
      spc5_dva_vfull_d <= spc5_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc5_dva_raddr or spc5_dva_waddr or spc5_dva_ren or spc5_dva_wen)
begin
  if ( spc5_dva_ren && spc5_dva_wen && (spc5_dva_raddr[6:2] == spc5_dva_waddr))
    spc5_dva_collide <= 1'b1;
  else
    spc5_dva_collide <= 1'b0;
end

// dva error cases

always @(spc5_dva_raddr or spc5_dva_ren or spc5_dva_dtag_perror or spc5_dva_dtag_perror)
begin
  if (spc5_dva_ren && (spc5_dva_dtag_perror || spc5_dva_dtag_perror))
    spc5_dva_err <= 1'b1;
  else
    spc5_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc5_dva_err)
     spc5_dva_efull_d <= 1'b1;
  else
     spc5_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc5_dva_ren && ~(spc5_dva_dtag_perror || spc5_dva_dtag_perror ) &&
       (spc5_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc5_dva_efull_cntr <= 9'h000;
     spc5_dva_raddr_d <= spc5_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc5_dva_efull_counter = %d", spc5_dva_efull_cntr);
    end
  else if(spc5_dva_efull_d)
    begin
      spc5_dva_efull_cntr <= spc5_dva_efull_cntr + 1;
      spc5_dva_raddr_d <= spc5_dva_raddr_d;
    end
  else
    begin
      spc5_dva_efull_cntr <= spc5_dva_efull_cntr;
      spc5_dva_raddr_d <= spc5_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC6

wire 	   spc6_dva_ren 	        = `SPARC_CORE6.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc6_dva_wen 	        = `SPARC_CORE6.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc6_dva_din 	        = `SPARC_CORE6.sparc0.lsu.dva_din_e;
wire [3:0] spc6_dva_dout 	        = `SPARC_CORE6.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc6_dva_raddr 	        = `SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc6_dva_waddr 	        = `SPARC_CORE6.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc6_dva_dtag_perror 	= `SPARC_CORE6.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc6_dva_dcache_perror 	= `SPARC_CORE6.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc6_dva_inv_perror 	= `SPARC_CORE6.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc6_ld_miss 	        = `SPARC_CORE6.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc6_ld_miss_capture;

wire 	   spc6_atomic_g 	        = `SPARC_CORE6.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc6_atm_type0 	= `SPARC_CORE6.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc6_atm_type1 	= `SPARC_CORE6.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc6_atm_type2 	= `SPARC_CORE6.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc6_atm_type3 	= `SPARC_CORE6.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc6_dctl_lsu_way_hit 	= `SPARC_CORE6.sparc0.lsu.dctl.lsu_way_hit;
wire       spc6_dctl_dcache_enable_g 	= `SPARC_CORE6.sparc0.lsu.dctl.dcache_enable_g;
wire       spc6_dctl_ldxa_internal 	= `SPARC_CORE6.sparc0.lsu.dctl.ldxa_internal;
wire       spc6_dctl_ldst_dbl_g 	= `SPARC_CORE6.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc6_dctl_atomic_g 	= `SPARC_CORE6.sparc0.lsu.dctl.atomic_g;
wire       spc6_dctl_stb_cam_hit 	= `SPARC_CORE6.sparc0.lsu.dctl.stb_cam_hit;
wire       spc6_dctl_endian_mispred_g 	= `SPARC_CORE6.sparc0.lsu.dctl.endian_mispred_g;
wire       spc6_dctl_dcache_rd_parity_error 	= `SPARC_CORE6.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc6_dctl_dtag_perror_g 	= `SPARC_CORE6.sparc0.lsu.dctl.dtag_perror_g;
wire       spc6_dctl_tte_data_perror_unc 	= `SPARC_CORE6.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc6_dctl_ld_inst_vld_g 	= `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc6_dctl_lsu_alt_space_g 	= `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc6_dctl_recognized_asi_g 	= `SPARC_CORE6.sparc0.lsu.dctl.recognized_asi_g;
wire       spc6_dctl_ncache_asild_rq_g  = `SPARC_CORE6.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc6_dctl_bld_hit;
wire       spc6_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc6_ixinv0  = `SPARC_CORE6.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc6_ixinv1  = `SPARC_CORE6.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc6_ixinv2  = `SPARC_CORE6.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc6_ixinv3  = `SPARC_CORE6.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc6_ifill  = `SPARC_CORE6.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc6_inv  = `SPARC_CORE6.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc6_inv_clr  = `SPARC_CORE6.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc6_ibuf_busy  = `SPARC_CORE6.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc6_l2  = `SPARC_CORE6.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc6_unc  = `SPARC_CORE6.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc6_fpld  = `SPARC_CORE6.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc6_fpldst  = `SPARC_CORE6.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc6_unflush  = `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc6_ldw  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc6_byp  = `SPARC_CORE6.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc6_flsh  = `SPARC_CORE6.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc6_chm  = `SPARC_CORE6.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc6_ldxa  = `SPARC_CORE6.sparc0.lsu.dctl.ldxa_internal ;
wire       spc6_ato  = `SPARC_CORE6.sparc0.lsu.dctl.atomic_g ;
wire       spc6_pref  = `SPARC_CORE6.sparc0.lsu.dctl.pref_inst_g ;
wire       spc6_chit  = `SPARC_CORE6.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc6_dcp  = `SPARC_CORE6.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc6_dtp  = `SPARC_CORE6.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc6_mpc  = `SPARC_CORE6.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc6_mpc  = 1'b0;
wire       spc6_mpu  = `SPARC_CORE6.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc6_exu_und;
reg  [4:0] spc6_exu;

// excptn
wire spc6_exp_wtchpt_trp_g                    = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc6_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc6_exp_priv_violtn_g                    = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc6_exp_daccess_excptn_g                 = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc6_exp_daccess_prot_g                   = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc6_exp_priv_action_g                    = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc6_exp_spec_access_epage_g              = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc6_exp_uncache_atomic_g                 = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc6_exp_illegal_asi_action_g             = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc6_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc6_exp_asi_rd_unc                       = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc6_exp_tlb_data_ce                     = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc6_exp_asi_rd_unc                       = 1'b0;
wire spc6_exp_tlb_data_ce                     =  1'b0;

wire spc6_exp_tlb_data_ue                     = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc6_exp_tlb_tag_ue                      = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc6_exp_unc                  = `SPARC_CORE6.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc6_exp_corr                 = `SPARC_CORE6.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc6_exp_corr                 = 1'b0;
wire [15:0] spc6_exp_und;
reg  [4:0] spc6_exp;
// dctl cmplt

wire       spc6_dctl_stxa_internal_d2  = `SPARC_CORE6.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc6_dctl_lsu_l2fill_vld  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc6_dctl_atomic_ld_squash_e  = `SPARC_CORE6.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc6_dctl_lsu_ignore_fill  = `SPARC_CORE6.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc6_dctl_l2fill_fpld_e  = `SPARC_CORE6.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc6_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc6_dctl_fill_err_trap_e  = `SPARC_CORE6.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc6_dctl_l2_corr_error_e  = `SPARC_CORE6.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc6_dctl_intld_byp_cmplt  = `SPARC_CORE6.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc6_dctl_lsu_intrpt_cmplt  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc6_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE6.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc6_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE6.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc6_dctl_lsu_pcx_pref_issue  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc6_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE6.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc6_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc6_ldstcond_cmplt_d;

wire       spc6_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE6.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc6_qctl1_ld0_inst_vld_g  = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc6_ld0_pkt_vld_unmasked  = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc6_ld0_pkt_vld_unmasked_d;
reg	   spc6_qctl1_ld_sec_hit_thrd0_w2;

wire       spc6_dctl_thread0_w3  = `SPARC_CORE6.sparc0.lsu.dctl.thread0_w3;
wire       spc6_dctl_dfill_thread0  = `SPARC_CORE6.sparc0.lsu.dctl.dfill_thread0;
wire       spc6_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc6_dctl_diag_wr_cmplt0  = `SPARC_CORE6.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc6_dctl_bsync0_reset  = `SPARC_CORE6.sparc0.lsu.dctl.bsync0_reset;
wire       spc6_dctl_late_cmplt0  = `SPARC_CORE6.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc6_dctl_stxa_cmplt0;
wire       spc6_dctl_l2fill_cmplt0;
wire       spc6_dctl_atm_cmplt0;
wire       spc6_dctl_fillerr0;
wire [4:0] spc6_cmplt0;
wire [5:0] spc6_dctl_ldst_cond_cmplt0;
reg  [3:0] spc6_ldstcond_cmplt0;
reg  [3:0] spc6_ldstcond_cmplt0_d;

wire       spc6_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE6.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc6_qctl1_ld1_inst_vld_g  = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc6_ld1_pkt_vld_unmasked  = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc6_ld1_pkt_vld_unmasked_d;
reg	   spc6_qctl1_ld_sec_hit_thrd1_w2;

wire       spc6_dctl_thread1_w3  = `SPARC_CORE6.sparc0.lsu.dctl.thread1_w3;
wire       spc6_dctl_dfill_thread1  = `SPARC_CORE6.sparc0.lsu.dctl.dfill_thread1;
wire       spc6_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc6_dctl_diag_wr_cmplt1  = `SPARC_CORE6.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc6_dctl_bsync1_reset  = `SPARC_CORE6.sparc0.lsu.dctl.bsync1_reset;
wire       spc6_dctl_late_cmplt1  = `SPARC_CORE6.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc6_dctl_stxa_cmplt1;
wire       spc6_dctl_l2fill_cmplt1;
wire       spc6_dctl_atm_cmplt1;
wire       spc6_dctl_fillerr1;
wire [4:0] spc6_cmplt1;
wire [5:0] spc6_dctl_ldst_cond_cmplt1;
reg  [3:0] spc6_ldstcond_cmplt1;
reg  [3:0] spc6_ldstcond_cmplt1_d;

wire       spc6_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE6.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc6_qctl1_ld2_inst_vld_g  = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc6_ld2_pkt_vld_unmasked  = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc6_ld2_pkt_vld_unmasked_d;
reg	   spc6_qctl1_ld_sec_hit_thrd2_w2;

wire       spc6_dctl_thread2_w3  = `SPARC_CORE6.sparc0.lsu.dctl.thread2_w3;
wire       spc6_dctl_dfill_thread2  = `SPARC_CORE6.sparc0.lsu.dctl.dfill_thread2;
wire       spc6_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc6_dctl_diag_wr_cmplt2  = `SPARC_CORE6.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc6_dctl_bsync2_reset  = `SPARC_CORE6.sparc0.lsu.dctl.bsync2_reset;
wire       spc6_dctl_late_cmplt2  = `SPARC_CORE6.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc6_dctl_stxa_cmplt2;
wire       spc6_dctl_l2fill_cmplt2;
wire       spc6_dctl_atm_cmplt2;
wire       spc6_dctl_fillerr2;
wire [4:0] spc6_cmplt2;
wire [5:0] spc6_dctl_ldst_cond_cmplt2;
reg  [3:0] spc6_ldstcond_cmplt2;
reg  [3:0] spc6_ldstcond_cmplt2_d;

wire       spc6_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE6.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc6_qctl1_ld3_inst_vld_g  = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc6_ld3_pkt_vld_unmasked  = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc6_ld3_pkt_vld_unmasked_d;
reg	   spc6_qctl1_ld_sec_hit_thrd3_w2;

wire       spc6_dctl_thread3_w3  = `SPARC_CORE6.sparc0.lsu.dctl.thread3_w3;
wire       spc6_dctl_dfill_thread3  = `SPARC_CORE6.sparc0.lsu.dctl.dfill_thread3;
wire       spc6_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc6_dctl_diag_wr_cmplt3  = `SPARC_CORE6.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc6_dctl_bsync3_reset  = `SPARC_CORE6.sparc0.lsu.dctl.bsync3_reset;
wire       spc6_dctl_late_cmplt3  = `SPARC_CORE6.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc6_dctl_stxa_cmplt3;
wire       spc6_dctl_l2fill_cmplt3;
wire       spc6_dctl_atm_cmplt3;
wire       spc6_dctl_fillerr3;
wire [4:0] spc6_cmplt3;
wire [5:0] spc6_dctl_ldst_cond_cmplt3;
reg  [3:0] spc6_ldstcond_cmplt3;
reg  [3:0] spc6_ldstcond_cmplt3_d;


wire       spc6_qctl1_bld_g 	= `SPARC_CORE6.sparc0.lsu.qctl1.bld_g;
wire       spc6_qctl1_bld_reset 	= `SPARC_CORE6.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc6_qctl1_bld_cnt 	= `SPARC_CORE6.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc6_bld0_full_cntr;
reg  [1:0] spc6_bld0_full_d;
reg 	   spc6_bld0_full_capture;
reg  [9:0] spc6_bld1_full_cntr;
reg  [1:0] spc6_bld1_full_d;
reg 	   spc6_bld1_full_capture;
reg  [9:0] spc6_bld2_full_cntr;
reg  [1:0] spc6_bld2_full_d;
reg 	   spc6_bld2_full_capture;
reg  [9:0] spc6_bld3_full_cntr;
reg  [1:0] spc6_bld3_full_d;
reg 	   spc6_bld3_full_capture;

wire       spc6_ipick 	= `SPARC_CORE6.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc6_lpick 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc6_spick 	= `SPARC_CORE6.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc6_mpick 	= `SPARC_CORE6.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc6_apick 	= `SPARC_CORE6.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc6_msquash 	= `SPARC_CORE6.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc6_fpicko;
wire [3:0] spc6_fpick;

wire [39:0] spc6_imiss_pa 	= `SPARC_CORE6.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc6_imiss_vld 	= `SPARC_CORE6.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc6_imiss_vld_d;
wire [39:0] spc6_lmiss_pa0 	= `SPARC_CORE6.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc6_lmiss_vld0 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc6_ld_pkt_vld0 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc6_st_pkt_vld0 	= `SPARC_CORE6.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc6_lmiss_eq0;
reg             spc6_atm_imiss_eq0;
wire [39:0] spc6_lmiss_pa1 	= `SPARC_CORE6.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc6_lmiss_vld1 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc6_ld_pkt_vld1 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc6_st_pkt_vld1 	= `SPARC_CORE6.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc6_lmiss_eq1;
reg             spc6_atm_imiss_eq1;
wire [39:0] spc6_lmiss_pa2 	= `SPARC_CORE6.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc6_lmiss_vld2 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc6_ld_pkt_vld2 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc6_st_pkt_vld2 	= `SPARC_CORE6.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc6_lmiss_eq2;
reg             spc6_atm_imiss_eq2;
wire [39:0] spc6_lmiss_pa3 	= `SPARC_CORE6.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc6_lmiss_vld3 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc6_ld_pkt_vld3 	= `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc6_st_pkt_vld3 	= `SPARC_CORE6.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc6_lmiss_eq3;
reg             spc6_atm_imiss_eq3;

wire [44:0]	spc6_wdata_ramc = `SPARC_CORE6.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc6_wptr_vld   = `SPARC_CORE6.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc6_wdata_ramd = {`SPARC_CORE6.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE6.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc6_stb_cam_hit 	        = `SPARC_CORE6.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc6_stb_cam_hit_ptr 	= `SPARC_CORE6.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc6_stb_ld_full_raw	= `SPARC_CORE6.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc6_stb_ld_partial_raw	= `SPARC_CORE6.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc6_stb_cam_mhit		= `SPARC_CORE6.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc6_dfq_vld_entries 	= `SPARC_CORE6.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc6_dfq_full;
reg  [9:0] spc6_dfq_full_cntr;
reg        spc6_dfq_full_d;
reg 	   spc6_dfq_full_capture;

reg  [9:0] spc6_dfq_full_cntr1;
reg        spc6_dfq_full_d1;
wire 	   spc6_dfq_full1;
reg 	   spc6_dfq_full_capture1;
reg  [9:0] spc6_dfq_full_cntr2;
reg        spc6_dfq_full_d2;
wire 	   spc6_dfq_full2;
reg 	   spc6_dfq_full_capture2;
reg  [9:0] spc6_dfq_full_cntr3;
reg        spc6_dfq_full_d3;
wire 	   spc6_dfq_full3;
reg 	   spc6_dfq_full_capture3;
reg  [9:0] spc6_dfq_full_cntr4;
reg        spc6_dfq_full_d4;
wire 	   spc6_dfq_full4;
reg 	   spc6_dfq_full_capture4;
reg  [9:0] spc6_dfq_full_cntr5;
reg        spc6_dfq_full_d5;
wire 	   spc6_dfq_full5;
reg 	   spc6_dfq_full_capture5;
reg  [9:0] spc6_dfq_full_cntr6;
reg        spc6_dfq_full_d6;
wire 	   spc6_dfq_full6;
reg 	   spc6_dfq_full_capture6;
reg  [9:0] spc6_dfq_full_cntr7;
reg        spc6_dfq_full_d7;
wire 	   spc6_dfq_full7;
reg 	   spc6_dfq_full_capture7;

wire 	   spc6_dva_rdwrhit;
reg  [9:0] spc6_dva_full_cntr;
reg        spc6_dva_full_d;
reg 	   spc6_dva_full_capture;
reg 	   spc6_dva_inv;
reg 	   spc6_dva_inv_d;
reg 	   spc6_dva_vld;
reg 	   spc6_dva_vld_d;
reg  [9:0] spc6_dva_vfull_cntr;
reg        spc6_dva_vfull_d;
reg 	   spc6_dva_vfull_capture;
reg        spc6_dva_collide;
reg        spc6_dva_vld2lkup;
reg        spc6_dva_invld2lkup;
reg        spc6_dva_invld_err;

reg  [9:0] spc6_dva_efull_cntr;
reg        spc6_dva_efull_d;

reg        spc6_dva_vlddtag_err;
reg        spc6_dva_vlddcache_err;
reg        spc6_dva_err;
reg [6:0] spc6_dva_raddr_d;
reg [4:0] spc6_dva_waddr_d;
reg [4:0] spc6_dva_invwaddr_d;

reg  	        spc6_ld0_lt_1;
reg  	        spc6_ld0_lt_2;
reg  	        spc6_ld0_lt_3;
reg  	        spc6_ld1_lt_0;
reg  	        spc6_ld1_lt_2;
reg  	        spc6_ld1_lt_3;
reg  	        spc6_ld2_lt_0;
reg  	        spc6_ld2_lt_1;
reg  	        spc6_ld2_lt_3;
reg  	        spc6_ld3_lt_0;
reg  	        spc6_ld3_lt_1;
reg  	        spc6_ld3_lt_2;

reg  	        spc6_st0_lt_1;
reg  	        spc6_st0_lt_2;
reg  	        spc6_st0_lt_3;
reg  	        spc6_st1_lt_0;
reg  	        spc6_st1_lt_2;
reg  	        spc6_st1_lt_3;
reg  	        spc6_st2_lt_0;
reg  	        spc6_st2_lt_1;
reg  	        spc6_st2_lt_3;
reg  	        spc6_st3_lt_0;
reg  	        spc6_st3_lt_1;
reg  	        spc6_st3_lt_2;

wire [11:0]      spc6_ld_ooo_ret;
wire [11:0]      spc6_st_ooo_ret;

wire [7:0]	spc6_stb_state_vld0 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc6_stb_state_ack0 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc6_stb_state_ced0 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc6_stb_state_rst0 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc6_stb_ack_vld0 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc6_ld0_inst_vld_g 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc6_intrpt0_cmplt 	 = `SPARC_CORE6.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc6_stb0_full 	         = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc6_stb0_full_w2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc6_lmq0_full 	         = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc6_mbar_vld0 	         = `SPARC_CORE6.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc6_ld0_unfilled 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc6_flsh_vld0	         = `SPARC_CORE6.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc6_ld0_unf_cntr;
reg  	        spc6_ld0_unfilled_d;

reg  [9:0]	spc6_st0_unf_cntr;
reg  	        spc6_st0_unfilled_d;
reg  	        spc6_st0_unfilled;

reg 	        spc6_mbar_vld_d0;
reg 	        spc6_flsh_vld_d0;

reg 	        spc6_lmq0_full_d;
reg  [9:0]	spc6_lmq_full_cntr0;
reg             spc6_lmq_full_capture0;

reg  [9:0]	spc6_stb_full_cntr0;
reg 		spc6_stb_full_capture0;

reg  [9:0]	spc6_mbar_vld_cntr0;
reg 		spc6_mbar_vld_capture0;

reg  [9:0]	spc6_flsh_vld_cntr0;
reg 		spc6_flsh_vld_capture0;

reg 		spc6_stb_head_hit0;
wire 		spc6_raw_ack_capture0;
reg  [9:0]	spc6_stb_ack_cntr0;

reg  [9:0]	spc6_stb_ced_cntr0;
reg  	        spc6_stb_ced0_d;
reg  	        spc6_stb_ced_capture0;
wire  	        spc6_stb_ced0;

reg 	        spc6_atm0_d;
reg  [9:0]	spc6_atm_cntr0;
reg             spc6_atm_intrpt_capture0;
reg             spc6_atm_intrpt_b4capture0;
reg             spc6_atm_inv_capture0;


reg  [39:0]     spc6_stb_wr_addr0;
reg  [39:0]     spc6_stb_atm_addr0;
reg             spc6_atm_lmiss_eq0;
wire [7:0]	spc6_stb_state_vld1 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc6_stb_state_ack1 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc6_stb_state_ced1 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc6_stb_state_rst1 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc6_stb_ack_vld1 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc6_ld1_inst_vld_g 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc6_intrpt1_cmplt 	 = `SPARC_CORE6.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc6_stb1_full 	         = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc6_stb1_full_w2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc6_lmq1_full 	         = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc6_mbar_vld1 	         = `SPARC_CORE6.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc6_ld1_unfilled 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc6_flsh_vld1	         = `SPARC_CORE6.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc6_ld1_unf_cntr;
reg  	        spc6_ld1_unfilled_d;

reg  [9:0]	spc6_st1_unf_cntr;
reg  	        spc6_st1_unfilled_d;
reg  	        spc6_st1_unfilled;

reg 	        spc6_mbar_vld_d1;
reg 	        spc6_flsh_vld_d1;

reg 	        spc6_lmq1_full_d;
reg  [9:0]	spc6_lmq_full_cntr1;
reg             spc6_lmq_full_capture1;

reg  [9:0]	spc6_stb_full_cntr1;
reg 		spc6_stb_full_capture1;

reg  [9:0]	spc6_mbar_vld_cntr1;
reg 		spc6_mbar_vld_capture1;

reg  [9:0]	spc6_flsh_vld_cntr1;
reg 		spc6_flsh_vld_capture1;

reg 		spc6_stb_head_hit1;
wire 		spc6_raw_ack_capture1;
reg  [9:0]	spc6_stb_ack_cntr1;

reg  [9:0]	spc6_stb_ced_cntr1;
reg  	        spc6_stb_ced1_d;
reg  	        spc6_stb_ced_capture1;
wire  	        spc6_stb_ced1;

reg 	        spc6_atm1_d;
reg  [9:0]	spc6_atm_cntr1;
reg             spc6_atm_intrpt_capture1;
reg             spc6_atm_intrpt_b4capture1;
reg             spc6_atm_inv_capture1;


reg  [39:0]     spc6_stb_wr_addr1;
reg  [39:0]     spc6_stb_atm_addr1;
reg             spc6_atm_lmiss_eq1;
wire [7:0]	spc6_stb_state_vld2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc6_stb_state_ack2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc6_stb_state_ced2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc6_stb_state_rst2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc6_stb_ack_vld2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc6_ld2_inst_vld_g 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc6_intrpt2_cmplt 	 = `SPARC_CORE6.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc6_stb2_full 	         = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc6_stb2_full_w2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc6_lmq2_full 	         = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc6_mbar_vld2 	         = `SPARC_CORE6.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc6_ld2_unfilled 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc6_flsh_vld2	         = `SPARC_CORE6.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc6_ld2_unf_cntr;
reg  	        spc6_ld2_unfilled_d;

reg  [9:0]	spc6_st2_unf_cntr;
reg  	        spc6_st2_unfilled_d;
reg  	        spc6_st2_unfilled;

reg 	        spc6_mbar_vld_d2;
reg 	        spc6_flsh_vld_d2;

reg 	        spc6_lmq2_full_d;
reg  [9:0]	spc6_lmq_full_cntr2;
reg             spc6_lmq_full_capture2;

reg  [9:0]	spc6_stb_full_cntr2;
reg 		spc6_stb_full_capture2;

reg  [9:0]	spc6_mbar_vld_cntr2;
reg 		spc6_mbar_vld_capture2;

reg  [9:0]	spc6_flsh_vld_cntr2;
reg 		spc6_flsh_vld_capture2;

reg 		spc6_stb_head_hit2;
wire 		spc6_raw_ack_capture2;
reg  [9:0]	spc6_stb_ack_cntr2;

reg  [9:0]	spc6_stb_ced_cntr2;
reg  	        spc6_stb_ced2_d;
reg  	        spc6_stb_ced_capture2;
wire  	        spc6_stb_ced2;

reg 	        spc6_atm2_d;
reg  [9:0]	spc6_atm_cntr2;
reg             spc6_atm_intrpt_capture2;
reg             spc6_atm_intrpt_b4capture2;
reg             spc6_atm_inv_capture2;


reg  [39:0]     spc6_stb_wr_addr2;
reg  [39:0]     spc6_stb_atm_addr2;
reg             spc6_atm_lmiss_eq2;
wire [7:0]	spc6_stb_state_vld3 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc6_stb_state_ack3 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc6_stb_state_ced3 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc6_stb_state_rst3 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc6_stb_ack_vld3 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc6_ld3_inst_vld_g 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc6_intrpt3_cmplt 	 = `SPARC_CORE6.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc6_stb3_full 	         = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc6_stb3_full_w2 	 = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc6_lmq3_full 	         = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc6_mbar_vld3 	         = `SPARC_CORE6.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc6_ld3_unfilled 	 = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc6_flsh_vld3	         = `SPARC_CORE6.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc6_ld3_unf_cntr;
reg  	        spc6_ld3_unfilled_d;

reg  [9:0]	spc6_st3_unf_cntr;
reg  	        spc6_st3_unfilled_d;
reg  	        spc6_st3_unfilled;

reg 	        spc6_mbar_vld_d3;
reg 	        spc6_flsh_vld_d3;

reg 	        spc6_lmq3_full_d;
reg  [9:0]	spc6_lmq_full_cntr3;
reg             spc6_lmq_full_capture3;

reg  [9:0]	spc6_stb_full_cntr3;
reg 		spc6_stb_full_capture3;

reg  [9:0]	spc6_mbar_vld_cntr3;
reg 		spc6_mbar_vld_capture3;

reg  [9:0]	spc6_flsh_vld_cntr3;
reg 		spc6_flsh_vld_capture3;

reg 		spc6_stb_head_hit3;
wire 		spc6_raw_ack_capture3;
reg  [9:0]	spc6_stb_ack_cntr3;

reg  [9:0]	spc6_stb_ced_cntr3;
reg  	        spc6_stb_ced3_d;
reg  	        spc6_stb_ced_capture3;
wire  	        spc6_stb_ced3;

reg 	        spc6_atm3_d;
reg  [9:0]	spc6_atm_cntr3;
reg             spc6_atm_intrpt_capture3;
reg             spc6_atm_intrpt_b4capture3;
reg             spc6_atm_inv_capture3;


reg  [39:0]     spc6_stb_wr_addr3;
reg  [39:0]     spc6_stb_atm_addr3;
reg             spc6_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc6_fpick = {spc6_mpick,spc6_spick,spc6_lpick,spc6_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc6_msquash,spc6_apick,spc6_fpick})
         9'b000000000 : spc6_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc6_fpicko = 1'b0;
         9'b1xxxxxxxx : spc6_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc6_fpicko = 1'b0;
	 default:
	  begin
		spc6_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon6 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc6_exu_und = {spc6_l2,
			  spc6_unc,
			  spc6_fpld,
			  spc6_fpldst,
			  spc6_unflush,
			  spc6_ldw,
			  spc6_byp,
			  spc6_flsh,
			  spc6_chm,
			  spc6_ldxa,
			  spc6_ato,
			  spc6_pref,
			  spc6_chit,
			  spc6_dcp,
			  spc6_dtp,
			  spc6_mpc,
			  spc6_mpu};

always @(spc6_exu_und)
begin
       case (spc6_exu_und)
         17'h00000 : spc6_exu =  5'h00;
         17'h00001 : spc6_exu =  5'h01;
         17'h00002 : spc6_exu =  5'h02;
         17'h00004 : spc6_exu =  5'h03;
         17'h00008 : spc6_exu =  5'h04;
         17'h00010 : spc6_exu =  5'h05;
         17'h00020 : spc6_exu =  5'h06;
         17'h00040 : spc6_exu =  5'h07;
         17'h00080 : spc6_exu =  5'h08;
         17'h00100 : spc6_exu =  5'h09;
         17'h00200 : spc6_exu =  5'h0a;
         17'h00400 : spc6_exu =  5'h0b;
         17'h00800 : spc6_exu =  5'h0c;
         17'h01000 : spc6_exu =  5'h0d;
         17'h02000 : spc6_exu =  5'h0e;
         17'h04000 : spc6_exu =  5'h0f;
         17'h08000 : spc6_exu =  5'h10;
         17'h10000 : spc6_exu =  5'h11;
	 default: spc6_exu =  5'h12;
       endcase
end
//excp
assign spc6_exp_und = {spc6_exp_wtchpt_trp_g,
			  spc6_exp_misalign_addr_ldst_atm_m,
			  spc6_exp_priv_violtn_g,
			  spc6_exp_daccess_excptn_g,
			  spc6_exp_daccess_prot_g,
			  spc6_exp_priv_action_g,
			  spc6_exp_spec_access_epage_g,
			  spc6_exp_uncache_atomic_g,
			  spc6_exp_illegal_asi_action_g,
			  spc6_exp_flt_ld_nfo_pg_g,
			  spc6_exp_asi_rd_unc,
			  spc6_exp_tlb_data_ce,
			  spc6_exp_tlb_data_ue,
			  spc6_exp_tlb_tag_ue,
			  spc6_exp_unc,
			  spc6_exp_corr};

always @(spc6_exp_und)
begin
       case (spc6_exp_und)
         16'h0000 : spc6_exp =  5'h00;
         16'h0001 : spc6_exp =  5'h01;
         16'h0002 : spc6_exp =  5'h02;
         16'h0004 : spc6_exp =  5'h03;
         16'h0008 : spc6_exp =  5'h04;
         16'h0010 : spc6_exp =  5'h05;
         16'h0020 : spc6_exp =  5'h06;
         16'h0040 : spc6_exp =  5'h07;
         16'h0080 : spc6_exp =  5'h08;
         16'h0100 : spc6_exp =  5'h09;
         16'h0200 : spc6_exp =  5'h0a;
         16'h0400 : spc6_exp =  5'h0b;
         16'h0800 : spc6_exp =  5'h0c;
         16'h1000 : spc6_exp =  5'h0d;
         16'h2000 : spc6_exp =  5'h0e;
         16'h4000 : spc6_exp =  5'h0f;
         16'h8000 : spc6_exp =  5'h10;
	 default: spc6_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc6_dctl_stxa_cmplt0 = ((spc6_dctl_stxa_internal_d2 & spc6_dctl_thread0_w3) |
				       spc6_dctl_stxa_stall_wr_cmplt0_d1);
assign spc6_dctl_l2fill_cmplt0 = (((spc6_dctl_lsu_l2fill_vld & ~spc6_dctl_atomic_ld_squash_e &
					    ~spc6_dctl_lsu_ignore_fill)) & ~spc6_dctl_l2fill_fpld_e &
					  ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread0);

assign spc6_dctl_fillerr0 = spc6_dctl_l2_corr_error_e & spc6_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc6_dctl_atm_cmplt0 = (spc6_dctl_lsu_atm_st_cmplt_e & ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread0);

assign spc6_dctl_ldst_cond_cmplt0 = { spc6_dctl_stxa_cmplt0, spc6_dctl_l2fill_cmplt0,
					    spc6_dctl_atomic_ld_squash_e, spc6_dctl_intld_byp_cmplt[0],
					    spc6_dctl_bsync0_reset, spc6_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc6_cmplt0 = { spc6_dctl_ldxa_illgl_va_cmplt_d1, spc6_dctl_pref_tlbmiss_cmplt_d2,
			      spc6_dctl_lsu_pcx_pref_issue, spc6_dctl_diag_wr_cmplt0, spc6_dctl_l2fill_fpld_e};


always @(spc6_cmplt0 or spc6_dctl_ldst_cond_cmplt0)
begin
       case ({spc6_dctl_fillerr0,spc6_dctl_ldst_cond_cmplt0,spc6_cmplt0})
         12'h000 : spc6_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc6_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc6_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc6_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc6_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc6_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc6_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc6_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc6_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc6_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc6_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc6_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc6_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc6_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc6_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc6_dctl_stxa_cmplt1 = ((spc6_dctl_stxa_internal_d2 & spc6_dctl_thread1_w3) |
				       spc6_dctl_stxa_stall_wr_cmplt1_d1);
assign spc6_dctl_l2fill_cmplt1 = (((spc6_dctl_lsu_l2fill_vld & ~spc6_dctl_atomic_ld_squash_e &
					    ~spc6_dctl_lsu_ignore_fill)) & ~spc6_dctl_l2fill_fpld_e &
					  ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread1);

assign spc6_dctl_fillerr1 = spc6_dctl_l2_corr_error_e & spc6_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc6_dctl_atm_cmplt1 = (spc6_dctl_lsu_atm_st_cmplt_e & ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread1);

assign spc6_dctl_ldst_cond_cmplt1 = { spc6_dctl_stxa_cmplt1, spc6_dctl_l2fill_cmplt1,
					    spc6_dctl_atomic_ld_squash_e, spc6_dctl_intld_byp_cmplt[1],
					    spc6_dctl_bsync1_reset, spc6_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc6_cmplt1 = { spc6_dctl_ldxa_illgl_va_cmplt_d1, spc6_dctl_pref_tlbmiss_cmplt_d2,
			      spc6_dctl_lsu_pcx_pref_issue, spc6_dctl_diag_wr_cmplt1, spc6_dctl_l2fill_fpld_e};


always @(spc6_cmplt1 or spc6_dctl_ldst_cond_cmplt1)
begin
       case ({spc6_dctl_fillerr1,spc6_dctl_ldst_cond_cmplt1,spc6_cmplt1})
         12'h000 : spc6_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc6_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc6_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc6_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc6_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc6_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc6_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc6_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc6_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc6_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc6_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc6_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc6_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc6_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc6_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc6_dctl_stxa_cmplt2 = ((spc6_dctl_stxa_internal_d2 & spc6_dctl_thread2_w3) |
				       spc6_dctl_stxa_stall_wr_cmplt2_d1);
assign spc6_dctl_l2fill_cmplt2 = (((spc6_dctl_lsu_l2fill_vld & ~spc6_dctl_atomic_ld_squash_e &
					    ~spc6_dctl_lsu_ignore_fill)) & ~spc6_dctl_l2fill_fpld_e &
					  ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread2);

assign spc6_dctl_fillerr2 = spc6_dctl_l2_corr_error_e & spc6_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc6_dctl_atm_cmplt2 = (spc6_dctl_lsu_atm_st_cmplt_e & ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread2);

assign spc6_dctl_ldst_cond_cmplt2 = { spc6_dctl_stxa_cmplt2, spc6_dctl_l2fill_cmplt2,
					    spc6_dctl_atomic_ld_squash_e, spc6_dctl_intld_byp_cmplt[2],
					    spc6_dctl_bsync2_reset, spc6_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc6_cmplt2 = { spc6_dctl_ldxa_illgl_va_cmplt_d1, spc6_dctl_pref_tlbmiss_cmplt_d2,
			      spc6_dctl_lsu_pcx_pref_issue, spc6_dctl_diag_wr_cmplt2, spc6_dctl_l2fill_fpld_e};


always @(spc6_cmplt2 or spc6_dctl_ldst_cond_cmplt2)
begin
       case ({spc6_dctl_fillerr2,spc6_dctl_ldst_cond_cmplt2,spc6_cmplt2})
         12'h000 : spc6_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc6_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc6_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc6_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc6_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc6_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc6_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc6_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc6_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc6_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc6_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc6_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc6_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc6_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc6_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc6_dctl_stxa_cmplt3 = ((spc6_dctl_stxa_internal_d2 & spc6_dctl_thread3_w3) |
				       spc6_dctl_stxa_stall_wr_cmplt3_d1);
assign spc6_dctl_l2fill_cmplt3 = (((spc6_dctl_lsu_l2fill_vld & ~spc6_dctl_atomic_ld_squash_e &
					    ~spc6_dctl_lsu_ignore_fill)) & ~spc6_dctl_l2fill_fpld_e &
					  ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread3);

assign spc6_dctl_fillerr3 = spc6_dctl_l2_corr_error_e & spc6_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc6_dctl_atm_cmplt3 = (spc6_dctl_lsu_atm_st_cmplt_e & ~spc6_dctl_fill_err_trap_e & spc6_dctl_dfill_thread3);

assign spc6_dctl_ldst_cond_cmplt3 = { spc6_dctl_stxa_cmplt3, spc6_dctl_l2fill_cmplt3,
					    spc6_dctl_atomic_ld_squash_e, spc6_dctl_intld_byp_cmplt[3],
					    spc6_dctl_bsync3_reset, spc6_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc6_cmplt3 = { spc6_dctl_ldxa_illgl_va_cmplt_d1, spc6_dctl_pref_tlbmiss_cmplt_d2,
			      spc6_dctl_lsu_pcx_pref_issue, spc6_dctl_diag_wr_cmplt3, spc6_dctl_l2fill_fpld_e};


always @(spc6_cmplt3 or spc6_dctl_ldst_cond_cmplt3)
begin
       case ({spc6_dctl_fillerr3,spc6_dctl_ldst_cond_cmplt3,spc6_cmplt3})
         12'h000 : spc6_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc6_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc6_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc6_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc6_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc6_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc6_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc6_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc6_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc6_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc6_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc6_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc6_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc6_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc6_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc6_ldstcond_cmplt0 or spc6_ldstcond_cmplt1 or spc6_ldstcond_cmplt2
	 or spc6_ldstcond_cmplt3 or spc6_dctl_lsu_ifu_ldst_cmplt
	 or spc6_dctl_late_cmplt0 or spc6_dctl_late_cmplt1 or spc6_dctl_late_cmplt2 or spc6_dctl_late_cmplt3)
begin
       case (spc6_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc6_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc6_ldstcond_cmplt_d = spc6_dctl_late_cmplt0 ? spc6_ldstcond_cmplt0_d : spc6_ldstcond_cmplt0;
         4'b0010 : spc6_ldstcond_cmplt_d = spc6_dctl_late_cmplt1 ? spc6_ldstcond_cmplt1_d : spc6_ldstcond_cmplt1;
         4'b0100 : spc6_ldstcond_cmplt_d = spc6_dctl_late_cmplt2 ? spc6_ldstcond_cmplt2_d : spc6_ldstcond_cmplt2;
         4'b1000 : spc6_ldstcond_cmplt_d = spc6_dctl_late_cmplt3 ? spc6_ldstcond_cmplt3_d : spc6_ldstcond_cmplt3;
         4'b0011 : spc6_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc6_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc6_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc6_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc6_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc6_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc6_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc6_st_ooo_ret = { spc6_st0_lt_1, spc6_st0_lt_2, spc6_st0_lt_3,
			      spc6_st1_lt_0, spc6_st1_lt_2, spc6_st1_lt_3,
			      spc6_st2_lt_0, spc6_st2_lt_1, spc6_st2_lt_3,
			      spc6_st3_lt_0, spc6_st3_lt_1, spc6_st3_lt_2};

always @(posedge clk)
begin
    if(~spc6_st0_unfilled || ~rst_l)
      spc6_st0_unfilled_d <= 1'b0;
    else
      spc6_st0_unfilled_d <= spc6_st0_unfilled;

    if(~rst_l)
      spc6_ldstcond_cmplt0_d <= 4'h0;
    else
      spc6_ldstcond_cmplt0_d <= spc6_ldstcond_cmplt0;

    if(~spc6_ld0_pkt_vld_unmasked || ~rst_l)
      spc6_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc6_ld0_pkt_vld_unmasked_d <= spc6_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc6_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc6_qctl1_ld_sec_hit_thrd0 && spc6_qctl1_ld0_inst_vld_g)
      spc6_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc6_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc6_st1_unfilled || ~rst_l)
      spc6_st1_unfilled_d <= 1'b0;
    else
      spc6_st1_unfilled_d <= spc6_st1_unfilled;

    if(~rst_l)
      spc6_ldstcond_cmplt1_d <= 4'h0;
    else
      spc6_ldstcond_cmplt1_d <= spc6_ldstcond_cmplt1;

    if(~spc6_ld1_pkt_vld_unmasked || ~rst_l)
      spc6_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc6_ld1_pkt_vld_unmasked_d <= spc6_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc6_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc6_qctl1_ld_sec_hit_thrd1 && spc6_qctl1_ld1_inst_vld_g)
      spc6_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc6_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc6_st2_unfilled || ~rst_l)
      spc6_st2_unfilled_d <= 1'b0;
    else
      spc6_st2_unfilled_d <= spc6_st2_unfilled;

    if(~rst_l)
      spc6_ldstcond_cmplt2_d <= 4'h0;
    else
      spc6_ldstcond_cmplt2_d <= spc6_ldstcond_cmplt2;

    if(~spc6_ld2_pkt_vld_unmasked || ~rst_l)
      spc6_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc6_ld2_pkt_vld_unmasked_d <= spc6_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc6_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc6_qctl1_ld_sec_hit_thrd2 && spc6_qctl1_ld2_inst_vld_g)
      spc6_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc6_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc6_st3_unfilled || ~rst_l)
      spc6_st3_unfilled_d <= 1'b0;
    else
      spc6_st3_unfilled_d <= spc6_st3_unfilled;

    if(~rst_l)
      spc6_ldstcond_cmplt3_d <= 4'h0;
    else
      spc6_ldstcond_cmplt3_d <= spc6_ldstcond_cmplt3;

    if(~spc6_ld3_pkt_vld_unmasked || ~rst_l)
      spc6_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc6_ld3_pkt_vld_unmasked_d <= spc6_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc6_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc6_qctl1_ld_sec_hit_thrd3 && spc6_qctl1_ld3_inst_vld_g)
      spc6_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc6_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc6_stb_state_ced0) && (|spc6_stb_state_rst0)) || ~rst_l)
      spc6_st0_unfilled <= 1'b0;
    else if( ((|spc6_stb_state_ced0) && ~(|spc6_stb_state_rst0)))
      spc6_st0_unfilled <= 1'b1;
    else
      spc6_st0_unfilled <= spc6_st0_unfilled;
    if( ((|spc6_stb_state_ced1) && (|spc6_stb_state_rst1)) || ~rst_l)
      spc6_st1_unfilled <= 1'b0;
    else if( ((|spc6_stb_state_ced1) && ~(|spc6_stb_state_rst1)))
      spc6_st1_unfilled <= 1'b1;
    else
      spc6_st1_unfilled <= spc6_st1_unfilled;
    if( ((|spc6_stb_state_ced2) && (|spc6_stb_state_rst2)) || ~rst_l)
      spc6_st2_unfilled <= 1'b0;
    else if( ((|spc6_stb_state_ced2) && ~(|spc6_stb_state_rst2)))
      spc6_st2_unfilled <= 1'b1;
    else
      spc6_st2_unfilled <= spc6_st2_unfilled;
    if( ((|spc6_stb_state_ced3) && (|spc6_stb_state_rst3)) || ~rst_l)
      spc6_st3_unfilled <= 1'b0;
    else if( ((|spc6_stb_state_ced3) && ~(|spc6_stb_state_rst3)))
      spc6_st3_unfilled <= 1'b1;
    else
      spc6_st3_unfilled <= spc6_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc6_st0_unfilled && spc6_st0_unfilled_d)|| ~rst_l)
      begin
        spc6_st0_unf_cntr <= 9'h000;
      end
    else if(spc6_st0_unfilled)
      begin
        spc6_st0_unf_cntr <= spc6_st0_unf_cntr + 1;
      end
    else
      begin
        spc6_st0_unf_cntr <= spc6_st0_unf_cntr;
      end
    if((~spc6_st1_unfilled && spc6_st1_unfilled_d)|| ~rst_l)
      begin
        spc6_st1_unf_cntr <= 9'h000;
      end
    else if(spc6_st1_unfilled)
      begin
        spc6_st1_unf_cntr <= spc6_st1_unf_cntr + 1;
      end
    else
      begin
        spc6_st1_unf_cntr <= spc6_st1_unf_cntr;
      end
    if((~spc6_st2_unfilled && spc6_st2_unfilled_d)|| ~rst_l)
      begin
        spc6_st2_unf_cntr <= 9'h000;
      end
    else if(spc6_st2_unfilled)
      begin
        spc6_st2_unf_cntr <= spc6_st2_unf_cntr + 1;
      end
    else
      begin
        spc6_st2_unf_cntr <= spc6_st2_unf_cntr;
      end
    if((~spc6_st3_unfilled && spc6_st3_unfilled_d)|| ~rst_l)
      begin
        spc6_st3_unf_cntr <= 9'h000;
      end
    else if(spc6_st3_unfilled)
      begin
        spc6_st3_unf_cntr <= spc6_st3_unf_cntr + 1;
      end
    else
      begin
        spc6_st3_unf_cntr <= spc6_st3_unf_cntr;
      end
end

always @(spc6_st0_unfilled or spc6_st1_unfilled or spc6_st2_unfilled or spc6_st3_unfilled
	 or spc6_st0_unfilled_d or spc6_st1_unfilled_d or spc6_st2_unfilled_d or spc6_st3_unfilled_d)
begin
if(~spc6_st0_unfilled && spc6_st0_unfilled_d && spc6_st1_unfilled)
 spc6_st0_lt_1 <= (spc6_st1_unf_cntr > spc6_st0_unf_cntr);
else
 spc6_st0_lt_1 <= 1'b0;
if(~spc6_st0_unfilled && spc6_st0_unfilled_d && spc6_st2_unfilled)
 spc6_st0_lt_2 <= (spc6_st2_unf_cntr > spc6_st0_unf_cntr);
else
 spc6_st0_lt_2 <= 1'b0;
if(~spc6_st0_unfilled && spc6_st0_unfilled_d && spc6_st3_unfilled)
 spc6_st0_lt_3 <= (spc6_st3_unf_cntr > spc6_st0_unf_cntr);
else
 spc6_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc6_st1_unfilled && spc6_st1_unfilled_d && spc6_st0_unfilled)
 spc6_st1_lt_0 <= (spc6_st0_unf_cntr > spc6_st1_unf_cntr);
else
 spc6_st1_lt_0 <= 1'b0;
if(~spc6_st1_unfilled && spc6_st1_unfilled_d && spc6_st2_unfilled)
 spc6_st1_lt_2 <= (spc6_st2_unf_cntr > spc6_st1_unf_cntr);
else
 spc6_st1_lt_2 <= 1'b0;
if(~spc6_st1_unfilled && spc6_st1_unfilled_d && spc6_st3_unfilled)
 spc6_st1_lt_3 <= (spc6_st3_unf_cntr > spc6_st1_unf_cntr);
else
 spc6_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc6_st2_unfilled && spc6_st2_unfilled_d && spc6_st0_unfilled)
 spc6_st2_lt_0 <= (spc6_st0_unf_cntr > spc6_st2_unf_cntr);
else
 spc6_st2_lt_0 <= 1'b0;
if(~spc6_st2_unfilled && spc6_st2_unfilled_d && spc6_st1_unfilled)
 spc6_st2_lt_1 <= (spc6_st1_unf_cntr > spc6_st2_unf_cntr);
else
 spc6_st2_lt_1 <= 1'b0;
if(~spc6_st2_unfilled && spc6_st2_unfilled_d && spc6_st3_unfilled)
 spc6_st2_lt_3 <= (spc6_st3_unf_cntr > spc6_st2_unf_cntr);
else
 spc6_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc6_st3_unfilled && spc6_st3_unfilled_d && spc6_st0_unfilled)
 spc6_st3_lt_0 <= (spc6_st0_unf_cntr > spc6_st3_unf_cntr);
else
 spc6_st3_lt_0 <= 1'b0;
if(~spc6_st3_unfilled && spc6_st3_unfilled_d && spc6_st1_unfilled)
 spc6_st3_lt_1 <= (spc6_st1_unf_cntr > spc6_st3_unf_cntr);
else
 spc6_st3_lt_1 <= 1'b0;
if(~spc6_st3_unfilled && spc6_st3_unfilled_d && spc6_st2_unfilled)
 spc6_st3_lt_2 <= (spc6_st2_unf_cntr > spc6_st3_unf_cntr);
else
 spc6_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc6_ld_ooo_ret = { spc6_ld0_lt_1, spc6_ld0_lt_2, spc6_ld0_lt_3,
			      spc6_ld1_lt_0, spc6_ld1_lt_2, spc6_ld1_lt_3,
			      spc6_ld2_lt_0, spc6_ld2_lt_1, spc6_ld2_lt_3,
			      spc6_ld3_lt_0, spc6_ld3_lt_1, spc6_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc6_ld0_unfilled && spc6_ld0_unfilled_d)|| ~rst_l)
      begin
        spc6_ld0_unf_cntr <= 9'h000;
      end
    else if(spc6_ld0_unfilled)
      begin
        spc6_ld0_unf_cntr <= spc6_ld0_unf_cntr + 1;
      end
    else
      begin
        spc6_ld0_unf_cntr <= spc6_ld0_unf_cntr;
      end
    if((~spc6_ld1_unfilled && spc6_ld1_unfilled_d)|| ~rst_l)
      begin
        spc6_ld1_unf_cntr <= 9'h000;
      end
    else if(spc6_ld1_unfilled)
      begin
        spc6_ld1_unf_cntr <= spc6_ld1_unf_cntr + 1;
      end
    else
      begin
        spc6_ld1_unf_cntr <= spc6_ld1_unf_cntr;
      end
    if((~spc6_ld2_unfilled && spc6_ld2_unfilled_d)|| ~rst_l)
      begin
        spc6_ld2_unf_cntr <= 9'h000;
      end
    else if(spc6_ld2_unfilled)
      begin
        spc6_ld2_unf_cntr <= spc6_ld2_unf_cntr + 1;
      end
    else
      begin
        spc6_ld2_unf_cntr <= spc6_ld2_unf_cntr;
      end
    if((~spc6_ld3_unfilled && spc6_ld3_unfilled_d)|| ~rst_l)
      begin
        spc6_ld3_unf_cntr <= 9'h000;
      end
    else if(spc6_ld3_unfilled)
      begin
        spc6_ld3_unf_cntr <= spc6_ld3_unf_cntr + 1;
      end
    else
      begin
        spc6_ld3_unf_cntr <= spc6_ld3_unf_cntr;
      end
end

always @(spc6_ld0_unfilled or spc6_ld1_unfilled or spc6_ld2_unfilled or spc6_ld3_unfilled
	 or spc6_ld0_unfilled_d or spc6_ld1_unfilled_d or spc6_ld2_unfilled_d or spc6_ld3_unfilled_d)
begin
if(~spc6_ld0_unfilled && spc6_ld0_unfilled_d && spc6_ld1_unfilled)
 spc6_ld0_lt_1 <= (spc6_ld1_unf_cntr > spc6_ld0_unf_cntr);
else
 spc6_ld0_lt_1 <= 1'b0;
if(~spc6_ld0_unfilled && spc6_ld0_unfilled_d && spc6_ld2_unfilled)
 spc6_ld0_lt_2 <= (spc6_ld2_unf_cntr > spc6_ld0_unf_cntr);
else
 spc6_ld0_lt_2 <= 1'b0;
if(~spc6_ld0_unfilled && spc6_ld0_unfilled_d && spc6_ld3_unfilled)
 spc6_ld0_lt_3 <= (spc6_ld3_unf_cntr > spc6_ld0_unf_cntr);
else
 spc6_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc6_ld1_unfilled && spc6_ld1_unfilled_d && spc6_ld0_unfilled)
 spc6_ld1_lt_0 <= (spc6_ld0_unf_cntr > spc6_ld1_unf_cntr);
else
 spc6_ld1_lt_0 <= 1'b0;
if(~spc6_ld1_unfilled && spc6_ld1_unfilled_d && spc6_ld2_unfilled)
 spc6_ld1_lt_2 <= (spc6_ld2_unf_cntr > spc6_ld1_unf_cntr);
else
 spc6_ld1_lt_2 <= 1'b0;
if(~spc6_ld1_unfilled && spc6_ld1_unfilled_d && spc6_ld3_unfilled)
 spc6_ld1_lt_3 <= (spc6_ld3_unf_cntr > spc6_ld1_unf_cntr);
else
 spc6_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc6_ld2_unfilled && spc6_ld2_unfilled_d && spc6_ld0_unfilled)
 spc6_ld2_lt_0 <= (spc6_ld0_unf_cntr > spc6_ld2_unf_cntr);
else
 spc6_ld2_lt_0 <= 1'b0;
if(~spc6_ld2_unfilled && spc6_ld2_unfilled_d && spc6_ld1_unfilled)
 spc6_ld2_lt_1 <= (spc6_ld1_unf_cntr > spc6_ld2_unf_cntr);
else
 spc6_ld2_lt_1 <= 1'b0;
if(~spc6_ld2_unfilled && spc6_ld2_unfilled_d && spc6_ld3_unfilled)
 spc6_ld2_lt_3 <= (spc6_ld3_unf_cntr > spc6_ld2_unf_cntr);
else
 spc6_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc6_ld3_unfilled && spc6_ld3_unfilled_d && spc6_ld0_unfilled)
 spc6_ld3_lt_0 <= (spc6_ld0_unf_cntr > spc6_ld3_unf_cntr);
else
 spc6_ld3_lt_0 <= 1'b0;
if(~spc6_ld3_unfilled && spc6_ld3_unfilled_d && spc6_ld1_unfilled)
 spc6_ld3_lt_1 <= (spc6_ld1_unf_cntr > spc6_ld3_unf_cntr);
else
 spc6_ld3_lt_1 <= 1'b0;
if(~spc6_ld3_unfilled && spc6_ld3_unfilled_d && spc6_ld2_unfilled)
 spc6_ld3_lt_2 <= (spc6_ld2_unf_cntr > spc6_ld3_unf_cntr);
else
 spc6_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc6_dctl_bld_hit =
((|spc6_dctl_lsu_way_hit[3:0])  & spc6_dctl_dcache_enable_g &
  ~spc6_dctl_ldxa_internal & ~spc6_dctl_dcache_rd_parity_error & ~spc6_dctl_dtag_perror_g &
  ~spc6_dctl_endian_mispred_g &
  ~spc6_dctl_atomic_g & ~spc6_dctl_ncache_asild_rq_g) & ~spc6_dctl_tte_data_perror_unc &
  spc6_dctl_ld_inst_vld_g & spc6_qctl1_bld_g ;

assign spc6_dctl_bld_stb_hit = spc6_dctl_bld_hit & spc6_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc6_bld0_full_d <= 2'b00;
      spc6_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc6_bld0_full_d <= spc6_qctl1_bld_cnt;
      spc6_ld0_unfilled_d <= spc6_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc6_bld1_full_d <= 2'b00;
      spc6_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc6_bld1_full_d <= spc6_qctl1_bld_cnt;
      spc6_ld1_unfilled_d <= spc6_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc6_bld2_full_d <= 2'b00;
      spc6_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc6_bld2_full_d <= spc6_qctl1_bld_cnt;
      spc6_ld2_unfilled_d <= spc6_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc6_bld3_full_d <= 2'b00;
      spc6_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc6_bld3_full_d <= spc6_qctl1_bld_cnt;
      spc6_ld3_unfilled_d <= spc6_ld3_unfilled;
     end
end
always @(spc6_bld0_full_d or spc6_qctl1_bld_cnt)
begin
 if( (spc6_bld0_full_d != spc6_qctl1_bld_cnt) && (spc6_bld0_full_d == 2'd0))
    spc6_bld0_full_capture <= 1'b1;
 else
    spc6_bld0_full_capture <= 1'b0;
end
always @(spc6_bld1_full_d or spc6_qctl1_bld_cnt)
begin
 if( (spc6_bld1_full_d != spc6_qctl1_bld_cnt) && (spc6_bld1_full_d == 2'd1))
    spc6_bld1_full_capture <= 1'b1;
 else
    spc6_bld1_full_capture <= 1'b0;
end
always @(spc6_bld2_full_d or spc6_qctl1_bld_cnt)
begin
 if( (spc6_bld2_full_d != spc6_qctl1_bld_cnt) && (spc6_bld2_full_d == 2'd2))
    spc6_bld2_full_capture <= 1'b1;
 else
    spc6_bld2_full_capture <= 1'b0;
end
always @(spc6_bld3_full_d or spc6_qctl1_bld_cnt)
begin
 if( (spc6_bld3_full_d != spc6_qctl1_bld_cnt) && (spc6_bld3_full_d == 2'd3))
    spc6_bld3_full_capture <= 1'b1;
 else
    spc6_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc6_qctl1_bld_cnt != 2'b00) && (spc6_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc6_bld0_full_cntr <= 9'h000;
      end
    else if(spc6_qctl1_bld_g && (spc6_qctl1_bld_cnt == 2'b00))
      begin
        spc6_bld0_full_cntr <= spc6_bld0_full_cntr + 1;
      end
    else if( (spc6_qctl1_bld_cnt == 2'b00) && (spc6_bld0_full_cntr != 9'h000))
      begin
        spc6_bld0_full_cntr <= spc6_bld0_full_cntr + 1;
      end
    else
      begin
        spc6_bld0_full_cntr <= spc6_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc6_qctl1_bld_cnt != 2'b01) && (spc6_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc6_bld1_full_cntr <= 9'h000;
      end
    else if(spc6_qctl1_bld_cnt == 2'b01)
      begin
        spc6_bld1_full_cntr <= spc6_bld1_full_cntr + 1;
      end
    else if( (spc6_qctl1_bld_cnt == 2'b01) && (spc6_bld1_full_cntr != 9'h000))
      begin
        spc6_bld1_full_cntr <= spc6_bld1_full_cntr + 1;
      end
    else
      begin
        spc6_bld1_full_cntr <= spc6_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc6_qctl1_bld_cnt != 2'b10) && (spc6_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc6_bld2_full_cntr <= 9'h000;
      end
    else if(spc6_qctl1_bld_cnt == 2'b10)
      begin
        spc6_bld2_full_cntr <= spc6_bld2_full_cntr + 1;
      end
    else if( (spc6_qctl1_bld_cnt == 2'b10) && (spc6_bld2_full_cntr != 9'h000))
      begin
        spc6_bld2_full_cntr <= spc6_bld2_full_cntr + 1;
      end
    else
      begin
        spc6_bld2_full_cntr <= spc6_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc6_qctl1_bld_cnt != 2'b11) && (spc6_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc6_bld3_full_cntr <= 9'h000;
      end
    else if(spc6_qctl1_bld_cnt == 2'b11)
      begin
        spc6_bld3_full_cntr <= spc6_bld3_full_cntr + 1;
      end
    else if( (spc6_qctl1_bld_cnt == 2'b11) && (spc6_bld3_full_cntr != 9'h000))
      begin
        spc6_bld3_full_cntr <= spc6_bld3_full_cntr + 1;
      end
    else
      begin
        spc6_bld3_full_cntr <= spc6_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc6_stb_state_vld0) && ~spc6_atomic_g) || ~rst_l)
      begin
        spc6_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc6_atomic_g && (spc6_atm_type0 != 8'h00) && spc6_wptr_vld)
      begin
        spc6_stb_atm_addr0 <= {spc6_wdata_ramc[44:9],spc6_wdata_ramd[67:64]};
      end
    else
      begin
        spc6_stb_atm_addr0 <= spc6_stb_atm_addr0;
      end
    if( ( ~(|spc6_stb_state_vld1) && ~spc6_atomic_g) || ~rst_l)
      begin
        spc6_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc6_atomic_g && (spc6_atm_type1 != 8'h00) && spc6_wptr_vld)
      begin
        spc6_stb_atm_addr1 <= {spc6_wdata_ramc[44:9],spc6_wdata_ramd[67:64]};
      end
    else
      begin
        spc6_stb_atm_addr1 <= spc6_stb_atm_addr1;
      end
    if( ( ~(|spc6_stb_state_vld2) && ~spc6_atomic_g) || ~rst_l)
      begin
        spc6_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc6_atomic_g && (spc6_atm_type2 != 8'h00) && spc6_wptr_vld)
      begin
        spc6_stb_atm_addr2 <= {spc6_wdata_ramc[44:9],spc6_wdata_ramd[67:64]};
      end
    else
      begin
        spc6_stb_atm_addr2 <= spc6_stb_atm_addr2;
      end
    if( ( ~(|spc6_stb_state_vld3) && ~spc6_atomic_g) || ~rst_l)
      begin
        spc6_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc6_atomic_g && (spc6_atm_type3 != 8'h00) && spc6_wptr_vld)
      begin
        spc6_stb_atm_addr3 <= {spc6_wdata_ramc[44:9],spc6_wdata_ramd[67:64]};
      end
    else
      begin
        spc6_stb_atm_addr3 <= spc6_stb_atm_addr3;
      end
end

 assign spc6_dfq_full = (spc6_dfq_vld_entries >= 3'd4);


assign spc6_dfq_full1 = (spc6_dfq_vld_entries >= (3'd4 + 1));

always @(spc6_dfq_full_d1 or spc6_dfq_full1)
begin
  if (spc6_dfq_full_d1 && ~spc6_dfq_full1)
    spc6_dfq_full_capture1 <= 1'b1;
  else
    spc6_dfq_full_capture1 <= 1'b0;
end

assign spc6_dfq_full2 = (spc6_dfq_vld_entries >= (3'd4 + 2));

always @(spc6_dfq_full_d2 or spc6_dfq_full2)
begin
  if (spc6_dfq_full_d2 && ~spc6_dfq_full2)
    spc6_dfq_full_capture2 <= 1'b1;
  else
    spc6_dfq_full_capture2 <= 1'b0;
end

assign spc6_dfq_full3 = (spc6_dfq_vld_entries >= (3'd4 + 3));

always @(spc6_dfq_full_d3 or spc6_dfq_full3)
begin
  if (spc6_dfq_full_d3 && ~spc6_dfq_full3)
    spc6_dfq_full_capture3 <= 1'b1;
  else
    spc6_dfq_full_capture3 <= 1'b0;
end

assign spc6_dfq_full4 = (spc6_dfq_vld_entries >= (3'd4 + 4));

always @(spc6_dfq_full_d4 or spc6_dfq_full4)
begin
  if (spc6_dfq_full_d4 && ~spc6_dfq_full4)
    spc6_dfq_full_capture4 <= 1'b1;
  else
    spc6_dfq_full_capture4 <= 1'b0;
end

assign spc6_dfq_full5 = (spc6_dfq_vld_entries >= (3'd4 + 5));

always @(spc6_dfq_full_d5 or spc6_dfq_full5)
begin
  if (spc6_dfq_full_d5 && ~spc6_dfq_full5)
    spc6_dfq_full_capture5 <= 1'b1;
  else
    spc6_dfq_full_capture5 <= 1'b0;
end

assign spc6_dfq_full6 = (spc6_dfq_vld_entries >= (3'd4 + 6));

always @(spc6_dfq_full_d6 or spc6_dfq_full6)
begin
  if (spc6_dfq_full_d6 && ~spc6_dfq_full6)
    spc6_dfq_full_capture6 <= 1'b1;
  else
    spc6_dfq_full_capture6 <= 1'b0;
end

assign spc6_dfq_full7 = (spc6_dfq_vld_entries >= (3'd4 + 7));

always @(spc6_dfq_full_d7 or spc6_dfq_full7)
begin
  if (spc6_dfq_full_d7 && ~spc6_dfq_full7)
    spc6_dfq_full_capture7 <= 1'b1;
  else
    spc6_dfq_full_capture7 <= 1'b0;
end

always @(spc6_mbar_vld_d0 or spc6_mbar_vld0)
begin
  if (spc6_mbar_vld_d0 && ~spc6_mbar_vld0)
    spc6_mbar_vld_capture0 <= 1'b1;
  else
    spc6_mbar_vld_capture0 <= 1'b0;
end
always @(spc6_mbar_vld_d1 or spc6_mbar_vld1)
begin
  if (spc6_mbar_vld_d1 && ~spc6_mbar_vld1)
    spc6_mbar_vld_capture1 <= 1'b1;
  else
    spc6_mbar_vld_capture1 <= 1'b0;
end
always @(spc6_mbar_vld_d2 or spc6_mbar_vld2)
begin
  if (spc6_mbar_vld_d2 && ~spc6_mbar_vld2)
    spc6_mbar_vld_capture2 <= 1'b1;
  else
    spc6_mbar_vld_capture2 <= 1'b0;
end
always @(spc6_mbar_vld_d3 or spc6_mbar_vld3)
begin
  if (spc6_mbar_vld_d3 && ~spc6_mbar_vld3)
    spc6_mbar_vld_capture3 <= 1'b1;
  else
    spc6_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc6_dfq_full1 && (spc6_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr1 <= 9'h000;
       spc6_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr1);
      end
    else if( spc6_dfq_full1)
      begin
       spc6_dfq_full_cntr1 <= spc6_dfq_full_cntr1 + 1;
       spc6_dfq_full_d1 <= spc6_dfq_full1;
      end
    else
      begin
       spc6_dfq_full_cntr1 <= spc6_dfq_full_cntr1;
       spc6_dfq_full_d1 <= spc6_dfq_full1;
      end
    if( ( ~spc6_dfq_full2 && (spc6_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr2 <= 9'h000;
       spc6_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr2);
      end
    else if( spc6_dfq_full2)
      begin
       spc6_dfq_full_cntr2 <= spc6_dfq_full_cntr2 + 1;
       spc6_dfq_full_d2 <= spc6_dfq_full2;
      end
    else
      begin
       spc6_dfq_full_cntr2 <= spc6_dfq_full_cntr2;
       spc6_dfq_full_d2 <= spc6_dfq_full2;
      end
    if( ( ~spc6_dfq_full3 && (spc6_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr3 <= 9'h000;
       spc6_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr3);
      end
    else if( spc6_dfq_full3)
      begin
       spc6_dfq_full_cntr3 <= spc6_dfq_full_cntr3 + 1;
       spc6_dfq_full_d3 <= spc6_dfq_full3;
      end
    else
      begin
       spc6_dfq_full_cntr3 <= spc6_dfq_full_cntr3;
       spc6_dfq_full_d3 <= spc6_dfq_full3;
      end
    if( ( ~spc6_dfq_full4 && (spc6_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr4 <= 9'h000;
       spc6_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr4);
      end
    else if( spc6_dfq_full4)
      begin
       spc6_dfq_full_cntr4 <= spc6_dfq_full_cntr4 + 1;
       spc6_dfq_full_d4 <= spc6_dfq_full4;
      end
    else
      begin
       spc6_dfq_full_cntr4 <= spc6_dfq_full_cntr4;
       spc6_dfq_full_d4 <= spc6_dfq_full4;
      end
    if( ( ~spc6_dfq_full5 && (spc6_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr5 <= 9'h000;
       spc6_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr5);
      end
    else if( spc6_dfq_full5)
      begin
       spc6_dfq_full_cntr5 <= spc6_dfq_full_cntr5 + 1;
       spc6_dfq_full_d5 <= spc6_dfq_full5;
      end
    else
      begin
       spc6_dfq_full_cntr5 <= spc6_dfq_full_cntr5;
       spc6_dfq_full_d5 <= spc6_dfq_full5;
      end
    if( ( ~spc6_dfq_full6 && (spc6_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr6 <= 9'h000;
       spc6_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr6);
      end
    else if( spc6_dfq_full6)
      begin
       spc6_dfq_full_cntr6 <= spc6_dfq_full_cntr6 + 1;
       spc6_dfq_full_d6 <= spc6_dfq_full6;
      end
    else
      begin
       spc6_dfq_full_cntr6 <= spc6_dfq_full_cntr6;
       spc6_dfq_full_d6 <= spc6_dfq_full6;
      end
    if( ( ~spc6_dfq_full7 && (spc6_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr7 <= 9'h000;
       spc6_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr7);
      end
    else if( spc6_dfq_full7)
      begin
       spc6_dfq_full_cntr7 <= spc6_dfq_full_cntr7 + 1;
       spc6_dfq_full_d7 <= spc6_dfq_full7;
      end
    else
      begin
       spc6_dfq_full_cntr7 <= spc6_dfq_full_cntr7;
       spc6_dfq_full_d7 <= spc6_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc6_intrpt0_cmplt or spc6_atm_cntr0 or spc6_stb_state_ced0)
begin
  if (spc6_intrpt0_cmplt && (spc6_atm_cntr0 != 9'h000) && ~(|spc6_stb_state_ced0))
    spc6_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc6_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc6_intrpt1_cmplt or spc6_atm_cntr1 or spc6_stb_state_ced1)
begin
  if (spc6_intrpt1_cmplt && (spc6_atm_cntr1 != 9'h000) && ~(|spc6_stb_state_ced1))
    spc6_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc6_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc6_intrpt2_cmplt or spc6_atm_cntr2 or spc6_stb_state_ced2)
begin
  if (spc6_intrpt2_cmplt && (spc6_atm_cntr2 != 9'h000) && ~(|spc6_stb_state_ced2))
    spc6_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc6_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc6_intrpt3_cmplt or spc6_atm_cntr3 or spc6_stb_state_ced3)
begin
  if (spc6_intrpt3_cmplt && (spc6_atm_cntr3 != 9'h000) && ~(|spc6_stb_state_ced3))
    spc6_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc6_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc6_intrpt0_cmplt or spc6_atm_cntr0 or spc6_stb_state_ced0)
begin
  if (spc6_intrpt0_cmplt && (spc6_atm_cntr0 != 9'h000) && (|spc6_stb_state_ced0))
    spc6_atm_intrpt_capture0 <= 1'b1;
  else
    spc6_atm_intrpt_capture0 <= 1'b0;
end
always @(spc6_intrpt1_cmplt or spc6_atm_cntr1 or spc6_stb_state_ced1)
begin
  if (spc6_intrpt1_cmplt && (spc6_atm_cntr1 != 9'h000) && (|spc6_stb_state_ced1))
    spc6_atm_intrpt_capture1 <= 1'b1;
  else
    spc6_atm_intrpt_capture1 <= 1'b0;
end
always @(spc6_intrpt2_cmplt or spc6_atm_cntr2 or spc6_stb_state_ced2)
begin
  if (spc6_intrpt2_cmplt && (spc6_atm_cntr2 != 9'h000) && (|spc6_stb_state_ced2))
    spc6_atm_intrpt_capture2 <= 1'b1;
  else
    spc6_atm_intrpt_capture2 <= 1'b0;
end
always @(spc6_intrpt3_cmplt or spc6_atm_cntr3 or spc6_stb_state_ced3)
begin
  if (spc6_intrpt3_cmplt && (spc6_atm_cntr3 != 9'h000) && (|spc6_stb_state_ced3))
    spc6_atm_intrpt_capture3 <= 1'b1;
  else
    spc6_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc6_atm_cntr0 or spc6_dva_din or spc6_dva_wen)
begin
  if (~spc6_dva_din && spc6_dva_wen && (spc6_atm_cntr0 != 9'h000))
    spc6_atm_inv_capture0 <= 1'b1;
  else
    spc6_atm_inv_capture0 <= 1'b0;
end
always @(spc6_atm_cntr1 or spc6_dva_din or spc6_dva_wen)
begin
  if (~spc6_dva_din && spc6_dva_wen && (spc6_atm_cntr1 != 9'h000))
    spc6_atm_inv_capture1 <= 1'b1;
  else
    spc6_atm_inv_capture1 <= 1'b0;
end
always @(spc6_atm_cntr2 or spc6_dva_din or spc6_dva_wen)
begin
  if (~spc6_dva_din && spc6_dva_wen && (spc6_atm_cntr2 != 9'h000))
    spc6_atm_inv_capture2 <= 1'b1;
  else
    spc6_atm_inv_capture2 <= 1'b0;
end
always @(spc6_atm_cntr3 or spc6_dva_din or spc6_dva_wen)
begin
  if (~spc6_dva_din && spc6_dva_wen && (spc6_atm_cntr3 != 9'h000))
    spc6_atm_inv_capture3 <= 1'b1;
  else
    spc6_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc6_stb_state_vld0) && (spc6_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_atm_cntr0 <= 9'h000;
       spc6_atm0_d <= 1'b0;
      end
    else if( spc6_atomic_g && (spc6_atm_type0 != 8'h00))
      begin
       spc6_atm_cntr0 <= spc6_atm_cntr0 + 1;
       spc6_atm0_d <= 1'b1;
      end
    else if( spc6_atm0_d && (|spc6_stb_state_vld0))
      begin
       spc6_atm_cntr0 <= spc6_atm_cntr0 + 1;
       spc6_atm0_d <= spc6_atm0_d;
      end
    else
      begin
       spc6_atm_cntr0 <= spc6_atm_cntr0;
       spc6_atm0_d <= spc6_atm0_d;
      end
    if( ( ~(|spc6_stb_state_vld1) && (spc6_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_atm_cntr1 <= 9'h000;
       spc6_atm1_d <= 1'b0;
      end
    else if( spc6_atomic_g && (spc6_atm_type1 != 8'h00))
      begin
       spc6_atm_cntr1 <= spc6_atm_cntr1 + 1;
       spc6_atm1_d <= 1'b1;
      end
    else if( spc6_atm1_d && (|spc6_stb_state_vld1))
      begin
       spc6_atm_cntr1 <= spc6_atm_cntr1 + 1;
       spc6_atm1_d <= spc6_atm1_d;
      end
    else
      begin
       spc6_atm_cntr1 <= spc6_atm_cntr1;
       spc6_atm1_d <= spc6_atm1_d;
      end
    if( ( ~(|spc6_stb_state_vld2) && (spc6_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_atm_cntr2 <= 9'h000;
       spc6_atm2_d <= 1'b0;
      end
    else if( spc6_atomic_g && (spc6_atm_type2 != 8'h00))
      begin
       spc6_atm_cntr2 <= spc6_atm_cntr2 + 1;
       spc6_atm2_d <= 1'b1;
      end
    else if( spc6_atm2_d && (|spc6_stb_state_vld2))
      begin
       spc6_atm_cntr2 <= spc6_atm_cntr2 + 1;
       spc6_atm2_d <= spc6_atm2_d;
      end
    else
      begin
       spc6_atm_cntr2 <= spc6_atm_cntr2;
       spc6_atm2_d <= spc6_atm2_d;
      end
    if( ( ~(|spc6_stb_state_vld3) && (spc6_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_atm_cntr3 <= 9'h000;
       spc6_atm3_d <= 1'b0;
      end
    else if( spc6_atomic_g && (spc6_atm_type3 != 8'h00))
      begin
       spc6_atm_cntr3 <= spc6_atm_cntr3 + 1;
       spc6_atm3_d <= 1'b1;
      end
    else if( spc6_atm3_d && (|spc6_stb_state_vld3))
      begin
       spc6_atm_cntr3 <= spc6_atm_cntr3 + 1;
       spc6_atm3_d <= spc6_atm3_d;
      end
    else
      begin
       spc6_atm_cntr3 <= spc6_atm_cntr3;
       spc6_atm3_d <= spc6_atm3_d;
      end
end

 assign spc6_raw_ack_capture0 = spc6_stb_ack_vld0 && (spc6_stb_ack_cntr0 != 9'h000);
 assign spc6_stb_ced0 = |spc6_stb_state_ced0;
 assign spc6_raw_ack_capture1 = spc6_stb_ack_vld1 && (spc6_stb_ack_cntr1 != 9'h000);
 assign spc6_stb_ced1 = |spc6_stb_state_ced1;
 assign spc6_raw_ack_capture2 = spc6_stb_ack_vld2 && (spc6_stb_ack_cntr2 != 9'h000);
 assign spc6_stb_ced2 = |spc6_stb_state_ced2;
 assign spc6_raw_ack_capture3 = spc6_stb_ack_vld3 && (spc6_stb_ack_cntr3 != 9'h000);
 assign spc6_stb_ced3 = |spc6_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc6_stb_ced0 && (spc6_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ced_cntr0 <= 9'h000;
       spc6_stb_ced0_d <= 1'b0;
      end
    else if( spc6_stb_ced0 && (spc6_stb_state_ack0 == 8'h00))
      begin
       spc6_stb_ced_cntr0 <= spc6_stb_ced_cntr0 + 1;
       spc6_stb_ced0_d <= spc6_stb_ced0;
      end
    else
      begin
       spc6_stb_ced_cntr0 <= spc6_stb_ced_cntr0;
       spc6_stb_ced0_d <= spc6_stb_ced0_d;
      end

    if( ( ~spc6_mbar_vld0 && (spc6_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_mbar_vld_cntr0 <= 9'h000;
       spc6_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_mbar_vld_counter = %d", spc6_mbar_vld_cntr0);
      end
    else if( spc6_mbar_vld0)
      begin
       spc6_mbar_vld_cntr0 <= spc6_mbar_vld_cntr0 + 1;
       spc6_mbar_vld_d0 <= spc6_mbar_vld0;
      end
    else
      begin
       spc6_mbar_vld_cntr0 <= spc6_mbar_vld_cntr0;
       spc6_mbar_vld_d0 <= spc6_mbar_vld0;
      end

    if( ( ~spc6_flsh_vld0 && (spc6_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_flsh_vld_cntr0 <= 9'h000;
       spc6_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_flsh_vld_counter = %d", spc6_flsh_vld_cntr0);
      end
    else if( spc6_flsh_vld0)
      begin
       spc6_flsh_vld_cntr0 <= spc6_flsh_vld_cntr0 + 1;
       spc6_flsh_vld_d0 <= spc6_flsh_vld0;
      end
    else
      begin
       spc6_flsh_vld_cntr0 <= spc6_flsh_vld_cntr0;
       spc6_flsh_vld_d0 <= spc6_flsh_vld0;
      end

    if( ( ~spc6_stb_ced1 && (spc6_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ced_cntr1 <= 9'h000;
       spc6_stb_ced1_d <= 1'b0;
      end
    else if( spc6_stb_ced1 && (spc6_stb_state_ack1 == 8'h00))
      begin
       spc6_stb_ced_cntr1 <= spc6_stb_ced_cntr1 + 1;
       spc6_stb_ced1_d <= spc6_stb_ced1;
      end
    else
      begin
       spc6_stb_ced_cntr1 <= spc6_stb_ced_cntr1;
       spc6_stb_ced1_d <= spc6_stb_ced1_d;
      end

    if( ( ~spc6_mbar_vld1 && (spc6_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_mbar_vld_cntr1 <= 9'h000;
       spc6_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_mbar_vld_counter = %d", spc6_mbar_vld_cntr1);
      end
    else if( spc6_mbar_vld1)
      begin
       spc6_mbar_vld_cntr1 <= spc6_mbar_vld_cntr1 + 1;
       spc6_mbar_vld_d1 <= spc6_mbar_vld1;
      end
    else
      begin
       spc6_mbar_vld_cntr1 <= spc6_mbar_vld_cntr1;
       spc6_mbar_vld_d1 <= spc6_mbar_vld1;
      end

    if( ( ~spc6_flsh_vld1 && (spc6_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_flsh_vld_cntr1 <= 9'h000;
       spc6_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_flsh_vld_counter = %d", spc6_flsh_vld_cntr1);
      end
    else if( spc6_flsh_vld1)
      begin
       spc6_flsh_vld_cntr1 <= spc6_flsh_vld_cntr1 + 1;
       spc6_flsh_vld_d1 <= spc6_flsh_vld1;
      end
    else
      begin
       spc6_flsh_vld_cntr1 <= spc6_flsh_vld_cntr1;
       spc6_flsh_vld_d1 <= spc6_flsh_vld1;
      end

    if( ( ~spc6_stb_ced2 && (spc6_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ced_cntr2 <= 9'h000;
       spc6_stb_ced2_d <= 1'b0;
      end
    else if( spc6_stb_ced2 && (spc6_stb_state_ack2 == 8'h00))
      begin
       spc6_stb_ced_cntr2 <= spc6_stb_ced_cntr2 + 1;
       spc6_stb_ced2_d <= spc6_stb_ced2;
      end
    else
      begin
       spc6_stb_ced_cntr2 <= spc6_stb_ced_cntr2;
       spc6_stb_ced2_d <= spc6_stb_ced2_d;
      end

    if( ( ~spc6_mbar_vld2 && (spc6_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_mbar_vld_cntr2 <= 9'h000;
       spc6_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_mbar_vld_counter = %d", spc6_mbar_vld_cntr2);
      end
    else if( spc6_mbar_vld2)
      begin
       spc6_mbar_vld_cntr2 <= spc6_mbar_vld_cntr2 + 1;
       spc6_mbar_vld_d2 <= spc6_mbar_vld2;
      end
    else
      begin
       spc6_mbar_vld_cntr2 <= spc6_mbar_vld_cntr2;
       spc6_mbar_vld_d2 <= spc6_mbar_vld2;
      end

    if( ( ~spc6_flsh_vld2 && (spc6_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_flsh_vld_cntr2 <= 9'h000;
       spc6_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_flsh_vld_counter = %d", spc6_flsh_vld_cntr2);
      end
    else if( spc6_flsh_vld2)
      begin
       spc6_flsh_vld_cntr2 <= spc6_flsh_vld_cntr2 + 1;
       spc6_flsh_vld_d2 <= spc6_flsh_vld2;
      end
    else
      begin
       spc6_flsh_vld_cntr2 <= spc6_flsh_vld_cntr2;
       spc6_flsh_vld_d2 <= spc6_flsh_vld2;
      end

    if( ( ~spc6_stb_ced3 && (spc6_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ced_cntr3 <= 9'h000;
       spc6_stb_ced3_d <= 1'b0;
      end
    else if( spc6_stb_ced3 && (spc6_stb_state_ack3 == 8'h00))
      begin
       spc6_stb_ced_cntr3 <= spc6_stb_ced_cntr3 + 1;
       spc6_stb_ced3_d <= spc6_stb_ced3;
      end
    else
      begin
       spc6_stb_ced_cntr3 <= spc6_stb_ced_cntr3;
       spc6_stb_ced3_d <= spc6_stb_ced3_d;
      end

    if( ( ~spc6_mbar_vld3 && (spc6_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_mbar_vld_cntr3 <= 9'h000;
       spc6_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_mbar_vld_counter = %d", spc6_mbar_vld_cntr3);
      end
    else if( spc6_mbar_vld3)
      begin
       spc6_mbar_vld_cntr3 <= spc6_mbar_vld_cntr3 + 1;
       spc6_mbar_vld_d3 <= spc6_mbar_vld3;
      end
    else
      begin
       spc6_mbar_vld_cntr3 <= spc6_mbar_vld_cntr3;
       spc6_mbar_vld_d3 <= spc6_mbar_vld3;
      end

    if( ( ~spc6_flsh_vld3 && (spc6_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_flsh_vld_cntr3 <= 9'h000;
       spc6_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_flsh_vld_counter = %d", spc6_flsh_vld_cntr3);
      end
    else if( spc6_flsh_vld3)
      begin
       spc6_flsh_vld_cntr3 <= spc6_flsh_vld_cntr3 + 1;
       spc6_flsh_vld_d3 <= spc6_flsh_vld3;
      end
    else
      begin
       spc6_flsh_vld_cntr3 <= spc6_flsh_vld_cntr3;
       spc6_flsh_vld_d3 <= spc6_flsh_vld3;
      end

end

always @(spc6_flsh_vld_d0 or spc6_flsh_vld0)
begin
  if (spc6_flsh_vld_d0 && ~spc6_flsh_vld0)
    spc6_flsh_vld_capture0 <= 1'b1;
  else
    spc6_flsh_vld_capture0 <= 1'b0;
end
always @(spc6_flsh_vld_d1 or spc6_flsh_vld1)
begin
  if (spc6_flsh_vld_d1 && ~spc6_flsh_vld1)
    spc6_flsh_vld_capture1 <= 1'b1;
  else
    spc6_flsh_vld_capture1 <= 1'b0;
end
always @(spc6_flsh_vld_d2 or spc6_flsh_vld2)
begin
  if (spc6_flsh_vld_d2 && ~spc6_flsh_vld2)
    spc6_flsh_vld_capture2 <= 1'b1;
  else
    spc6_flsh_vld_capture2 <= 1'b0;
end
always @(spc6_flsh_vld_d3 or spc6_flsh_vld3)
begin
  if (spc6_flsh_vld_d3 && ~spc6_flsh_vld3)
    spc6_flsh_vld_capture3 <= 1'b1;
  else
    spc6_flsh_vld_capture3 <= 1'b0;
end

always @(spc6_lmiss_pa0 or spc6_imiss_pa or spc6_imiss_vld_d or spc6_lmiss_vld0)
begin
if((spc6_lmiss_pa0 == spc6_imiss_pa) && spc6_imiss_vld_d && spc6_lmiss_vld0)
 spc6_lmiss_eq0 = 1'b1;
else
 spc6_lmiss_eq0 = 1'b0;
end
always @(spc6_lmiss_pa1 or spc6_imiss_pa or spc6_imiss_vld_d or spc6_lmiss_vld1)
begin
if((spc6_lmiss_pa1 == spc6_imiss_pa) && spc6_imiss_vld_d && spc6_lmiss_vld1)
 spc6_lmiss_eq1 = 1'b1;
else
 spc6_lmiss_eq1 = 1'b0;
end
always @(spc6_lmiss_pa2 or spc6_imiss_pa or spc6_imiss_vld_d or spc6_lmiss_vld2)
begin
if((spc6_lmiss_pa2 == spc6_imiss_pa) && spc6_imiss_vld_d && spc6_lmiss_vld2)
 spc6_lmiss_eq2 = 1'b1;
else
 spc6_lmiss_eq2 = 1'b0;
end
always @(spc6_lmiss_pa3 or spc6_imiss_pa or spc6_imiss_vld_d or spc6_lmiss_vld3)
begin
if((spc6_lmiss_pa3 == spc6_imiss_pa) && spc6_imiss_vld_d && spc6_lmiss_vld3)
 spc6_lmiss_eq3 = 1'b1;
else
 spc6_lmiss_eq3 = 1'b0;
end

always @(spc6_lmiss_pa0 or spc6_stb_atm_addr0 or spc6_atm_cntr0 or spc6_lmiss_vld0)
begin
if ( ((spc6_lmiss_pa0 == spc6_stb_atm_addr0) && (spc6_atm_cntr0 != 9'h000) && spc6_lmiss_vld0) ||
     ((spc6_lmiss_pa1 == spc6_stb_atm_addr0) && (spc6_atm_cntr0 != 9'h000) && spc6_lmiss_vld1) ||
     ((spc6_lmiss_pa2 == spc6_stb_atm_addr0) && (spc6_atm_cntr0 != 9'h000) && spc6_lmiss_vld2) ||
     ((spc6_lmiss_pa3 == spc6_stb_atm_addr0) && (spc6_atm_cntr0 != 9'h000) && spc6_lmiss_vld3) )

 spc6_atm_lmiss_eq0 = 1'b1;
else
 spc6_atm_lmiss_eq0 = 1'b0;
end
always @(spc6_lmiss_pa1 or spc6_stb_atm_addr1 or spc6_atm_cntr1 or spc6_lmiss_vld1)
begin
if ( ((spc6_lmiss_pa0 == spc6_stb_atm_addr1) && (spc6_atm_cntr1 != 9'h000) && spc6_lmiss_vld0) ||
     ((spc6_lmiss_pa1 == spc6_stb_atm_addr1) && (spc6_atm_cntr1 != 9'h000) && spc6_lmiss_vld1) ||
     ((spc6_lmiss_pa2 == spc6_stb_atm_addr1) && (spc6_atm_cntr1 != 9'h000) && spc6_lmiss_vld2) ||
     ((spc6_lmiss_pa3 == spc6_stb_atm_addr1) && (spc6_atm_cntr1 != 9'h000) && spc6_lmiss_vld3) )

 spc6_atm_lmiss_eq1 = 1'b1;
else
 spc6_atm_lmiss_eq1 = 1'b0;
end
always @(spc6_lmiss_pa2 or spc6_stb_atm_addr2 or spc6_atm_cntr2 or spc6_lmiss_vld2)
begin
if ( ((spc6_lmiss_pa0 == spc6_stb_atm_addr2) && (spc6_atm_cntr2 != 9'h000) && spc6_lmiss_vld0) ||
     ((spc6_lmiss_pa1 == spc6_stb_atm_addr2) && (spc6_atm_cntr2 != 9'h000) && spc6_lmiss_vld1) ||
     ((spc6_lmiss_pa2 == spc6_stb_atm_addr2) && (spc6_atm_cntr2 != 9'h000) && spc6_lmiss_vld2) ||
     ((spc6_lmiss_pa3 == spc6_stb_atm_addr2) && (spc6_atm_cntr2 != 9'h000) && spc6_lmiss_vld3) )

 spc6_atm_lmiss_eq2 = 1'b1;
else
 spc6_atm_lmiss_eq2 = 1'b0;
end
always @(spc6_lmiss_pa3 or spc6_stb_atm_addr3 or spc6_atm_cntr3 or spc6_lmiss_vld3)
begin
if ( ((spc6_lmiss_pa0 == spc6_stb_atm_addr3) && (spc6_atm_cntr3 != 9'h000) && spc6_lmiss_vld0) ||
     ((spc6_lmiss_pa1 == spc6_stb_atm_addr3) && (spc6_atm_cntr3 != 9'h000) && spc6_lmiss_vld1) ||
     ((spc6_lmiss_pa2 == spc6_stb_atm_addr3) && (spc6_atm_cntr3 != 9'h000) && spc6_lmiss_vld2) ||
     ((spc6_lmiss_pa3 == spc6_stb_atm_addr3) && (spc6_atm_cntr3 != 9'h000) && spc6_lmiss_vld3) )

 spc6_atm_lmiss_eq3 = 1'b1;
else
 spc6_atm_lmiss_eq3 = 1'b0;
end

always @(spc6_imiss_pa or spc6_stb_atm_addr0 or spc6_atm_cntr0 or spc6_imiss_vld_d)
begin
if((spc6_imiss_pa == spc6_stb_atm_addr0) && (spc6_atm_cntr0 != 9'h000) && spc6_imiss_vld_d)
 spc6_atm_imiss_eq0 = 1'b1;
else
 spc6_atm_imiss_eq0 = 1'b0;
end
always @(spc6_imiss_pa or spc6_stb_atm_addr1 or spc6_atm_cntr1 or spc6_imiss_vld_d)
begin
if((spc6_imiss_pa == spc6_stb_atm_addr1) && (spc6_atm_cntr1 != 9'h000) && spc6_imiss_vld_d)
 spc6_atm_imiss_eq1 = 1'b1;
else
 spc6_atm_imiss_eq1 = 1'b0;
end
always @(spc6_imiss_pa or spc6_stb_atm_addr2 or spc6_atm_cntr2 or spc6_imiss_vld_d)
begin
if((spc6_imiss_pa == spc6_stb_atm_addr2) && (spc6_atm_cntr2 != 9'h000) && spc6_imiss_vld_d)
 spc6_atm_imiss_eq2 = 1'b1;
else
 spc6_atm_imiss_eq2 = 1'b0;
end
always @(spc6_imiss_pa or spc6_stb_atm_addr3 or spc6_atm_cntr3 or spc6_imiss_vld_d)
begin
if((spc6_imiss_pa == spc6_stb_atm_addr3) && (spc6_atm_cntr3 != 9'h000) && spc6_imiss_vld_d)
 spc6_atm_imiss_eq3 = 1'b1;
else
 spc6_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc6_imiss_vld || ~rst_l)
   spc6_imiss_vld_d <= 1'b0;
 else
   spc6_imiss_vld_d <= spc6_imiss_vld;

 if( ~spc6_ld_miss || ~rst_l)
   spc6_ld_miss_capture <= 1'b0;
 else
   spc6_ld_miss_capture <= spc6_ld_miss;

end

always @(spc6_stb_ced0 or spc6_stb_ced0_d)
begin
if (~spc6_stb_ced0 && spc6_stb_ced0_d)
spc6_stb_ced_capture0 <= 1'b1;
else
spc6_stb_ced_capture0 <= 1'b0;

end
always @(spc6_stb_ced1 or spc6_stb_ced1_d)
begin
if (~spc6_stb_ced1 && spc6_stb_ced1_d)
spc6_stb_ced_capture1 <= 1'b1;
else
spc6_stb_ced_capture1 <= 1'b0;

end
always @(spc6_stb_ced2 or spc6_stb_ced2_d)
begin
if (~spc6_stb_ced2 && spc6_stb_ced2_d)
spc6_stb_ced_capture2 <= 1'b1;
else
spc6_stb_ced_capture2 <= 1'b0;

end
always @(spc6_stb_ced3 or spc6_stb_ced3_d)
begin
if (~spc6_stb_ced3 && spc6_stb_ced3_d)
spc6_stb_ced_capture3 <= 1'b1;
else
spc6_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc6_stb_state_ack0 != 8'h00 && (spc6_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_ack_counter0 = %d", spc6_stb_ack_cntr0);
      end
    else if(spc6_stb_cam_hit && spc6_ld0_inst_vld_g && (spc6_stb_state_ack0 == 8'h00))
      begin
       spc6_stb_ack_cntr0 <= spc6_stb_ack_cntr0 + 1;
      end
    else if( (spc6_stb_state_ack0 == 8'h00 ) && (spc6_stb_ack_cntr0 != 9'h000))
      begin
       spc6_stb_ack_cntr0 <= spc6_stb_ack_cntr0 + 1;
      end // if ( (spc6_stb_state_ack0 == 8'h00 ) && (spc6_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc6_stb_ack_cntr0 <= spc6_stb_ack_cntr0;
      end

    if( (spc6_stb_state_ack1 != 8'h00 && (spc6_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_ack_counter1 = %d", spc6_stb_ack_cntr1);
      end
    else if(spc6_stb_cam_hit && spc6_ld1_inst_vld_g && (spc6_stb_state_ack1 == 8'h00))
      begin
       spc6_stb_ack_cntr1 <= spc6_stb_ack_cntr1 + 1;
      end
    else if( (spc6_stb_state_ack1 == 8'h00 ) && (spc6_stb_ack_cntr1 != 9'h000))
      begin
       spc6_stb_ack_cntr1 <= spc6_stb_ack_cntr1 + 1;
      end // if ( (spc6_stb_state_ack1 == 8'h00 ) && (spc6_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc6_stb_ack_cntr1 <= spc6_stb_ack_cntr1;
      end

    if( (spc6_stb_state_ack2 != 8'h00 && (spc6_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_ack_counter2 = %d", spc6_stb_ack_cntr2);
      end
    else if(spc6_stb_cam_hit && spc6_ld2_inst_vld_g && (spc6_stb_state_ack2 == 8'h00))
      begin
       spc6_stb_ack_cntr2 <= spc6_stb_ack_cntr2 + 1;
      end
    else if( (spc6_stb_state_ack2 == 8'h00 ) && (spc6_stb_ack_cntr2 != 9'h000))
      begin
       spc6_stb_ack_cntr2 <= spc6_stb_ack_cntr2 + 1;
      end // if ( (spc6_stb_state_ack2 == 8'h00 ) && (spc6_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc6_stb_ack_cntr2 <= spc6_stb_ack_cntr2;
      end

    if( (spc6_stb_state_ack3 != 8'h00 && (spc6_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_ack_counter3 = %d", spc6_stb_ack_cntr3);
      end
    else if(spc6_stb_cam_hit && spc6_ld3_inst_vld_g && (spc6_stb_state_ack3 == 8'h00))
      begin
       spc6_stb_ack_cntr3 <= spc6_stb_ack_cntr3 + 1;
      end
    else if( (spc6_stb_state_ack3 == 8'h00 ) && (spc6_stb_ack_cntr3 != 9'h000))
      begin
       spc6_stb_ack_cntr3 <= spc6_stb_ack_cntr3 + 1;
      end // if ( (spc6_stb_state_ack3 == 8'h00 ) && (spc6_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc6_stb_ack_cntr3 <= spc6_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc6_stb0_full_w2 or spc6_stb0_full)
begin
if (~spc6_stb0_full_w2 && spc6_stb0_full)
spc6_stb_full_capture0 <= 1'b1;
else
spc6_stb_full_capture0 <= 1'b0;

end
always @(spc6_stb1_full_w2 or spc6_stb1_full)
begin
if (~spc6_stb1_full_w2 && spc6_stb1_full)
spc6_stb_full_capture1 <= 1'b1;
else
spc6_stb_full_capture1 <= 1'b0;

end
always @(spc6_stb2_full_w2 or spc6_stb2_full)
begin
if (~spc6_stb2_full_w2 && spc6_stb2_full)
spc6_stb_full_capture2 <= 1'b1;
else
spc6_stb_full_capture2 <= 1'b0;

end
always @(spc6_stb3_full_w2 or spc6_stb3_full)
begin
if (~spc6_stb3_full_w2 && spc6_stb3_full)
spc6_stb_full_capture3 <= 1'b1;
else
spc6_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc6_stb0_full && (spc6_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_full_counter0 = %d", spc6_stb_full_cntr0);
      end
    else if( spc6_stb0_full)
      begin
       spc6_stb_full_cntr0 <= spc6_stb_full_cntr0 + 1;
      end
    else
      begin
       spc6_stb_full_cntr0 <= spc6_stb_full_cntr0;
      end
    if( ( ~spc6_stb1_full && (spc6_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_full_counter1 = %d", spc6_stb_full_cntr1);
      end
    else if( spc6_stb1_full)
      begin
       spc6_stb_full_cntr1 <= spc6_stb_full_cntr1 + 1;
      end
    else
      begin
       spc6_stb_full_cntr1 <= spc6_stb_full_cntr1;
      end
    if( ( ~spc6_stb2_full && (spc6_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_full_counter2 = %d", spc6_stb_full_cntr2);
      end
    else if( spc6_stb2_full)
      begin
       spc6_stb_full_cntr2 <= spc6_stb_full_cntr2 + 1;
      end
    else
      begin
       spc6_stb_full_cntr2 <= spc6_stb_full_cntr2;
      end
    if( ( ~spc6_stb3_full && (spc6_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc6_stb_full_counter3 = %d", spc6_stb_full_cntr3);
      end
    else if( spc6_stb3_full)
      begin
       spc6_stb_full_cntr3 <= spc6_stb_full_cntr3 + 1;
      end
    else
      begin
       spc6_stb_full_cntr3 <= spc6_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc6_lmq0_full_d or spc6_lmq0_full)
begin
if (spc6_lmq0_full_d && ~spc6_lmq0_full)
spc6_lmq_full_capture0 <= 1'b1;
else
spc6_lmq_full_capture0 <= 1'b0;

end
always @(spc6_lmq1_full_d or spc6_lmq1_full)
begin
if (spc6_lmq1_full_d && ~spc6_lmq1_full)
spc6_lmq_full_capture1 <= 1'b1;
else
spc6_lmq_full_capture1 <= 1'b0;

end
always @(spc6_lmq2_full_d or spc6_lmq2_full)
begin
if (spc6_lmq2_full_d && ~spc6_lmq2_full)
spc6_lmq_full_capture2 <= 1'b1;
else
spc6_lmq_full_capture2 <= 1'b0;

end
always @(spc6_lmq3_full_d or spc6_lmq3_full)
begin
if (spc6_lmq3_full_d && ~spc6_lmq3_full)
spc6_lmq_full_capture3 <= 1'b1;
else
spc6_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc6_lmq0_full && (spc6_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc6_lmq_full_cntr0 <= 9'h000;
       spc6_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_lmq_full_counter0 = %d", spc6_lmq_full_cntr0);
      end
    else if( spc6_lmq0_full)
      begin
       spc6_lmq_full_cntr0 <= spc6_lmq_full_cntr0 + 1;
       spc6_lmq0_full_d <= spc6_lmq0_full;
      end
    else
      begin
       spc6_lmq_full_cntr0 <= spc6_lmq_full_cntr0;
       spc6_lmq0_full_d <= spc6_lmq0_full;
      end

    if( ( ~spc6_lmq1_full && (spc6_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc6_lmq_full_cntr1 <= 9'h000;
       spc6_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_lmq_full_counter1 = %d", spc6_lmq_full_cntr1);
      end
    else if( spc6_lmq1_full)
      begin
       spc6_lmq_full_cntr1 <= spc6_lmq_full_cntr1 + 1;
       spc6_lmq1_full_d <= spc6_lmq1_full;
      end
    else
      begin
       spc6_lmq_full_cntr1 <= spc6_lmq_full_cntr1;
       spc6_lmq1_full_d <= spc6_lmq1_full;
      end

    if( ( ~spc6_lmq2_full && (spc6_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc6_lmq_full_cntr2 <= 9'h000;
       spc6_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_lmq_full_counter2 = %d", spc6_lmq_full_cntr2);
      end
    else if( spc6_lmq2_full)
      begin
       spc6_lmq_full_cntr2 <= spc6_lmq_full_cntr2 + 1;
       spc6_lmq2_full_d <= spc6_lmq2_full;
      end
    else
      begin
       spc6_lmq_full_cntr2 <= spc6_lmq_full_cntr2;
       spc6_lmq2_full_d <= spc6_lmq2_full;
      end

    if( ( ~spc6_lmq3_full && (spc6_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc6_lmq_full_cntr3 <= 9'h000;
       spc6_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_lmq_full_counter3 = %d", spc6_lmq_full_cntr3);
      end
    else if( spc6_lmq3_full)
      begin
       spc6_lmq_full_cntr3 <= spc6_lmq_full_cntr3 + 1;
       spc6_lmq3_full_d <= spc6_lmq3_full;
      end
    else
      begin
       spc6_lmq_full_cntr3 <= spc6_lmq_full_cntr3;
       spc6_lmq3_full_d <= spc6_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc6_dfq_full_d or spc6_dfq_full)
begin
  if (spc6_dfq_full_d && ~spc6_dfq_full)
    spc6_dfq_full_capture <= 1'b1;
  else
    spc6_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc6_dfq_full && (spc6_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc6_dfq_full_cntr <= 9'h000;
       spc6_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dfq_full_counter = %d", spc6_dfq_full_cntr);
      end
    else if( spc6_dfq_full)
      begin
       spc6_dfq_full_cntr <= spc6_dfq_full_cntr + 1;
       spc6_dfq_full_d <= spc6_dfq_full;
      end
    else
      begin
       spc6_dfq_full_cntr <= spc6_dfq_full_cntr;
       spc6_dfq_full_d <= spc6_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc6_dva_full_d or spc6_dva_inv)
begin
  if (spc6_dva_full_d && ~spc6_dva_inv)
    spc6_dva_full_capture <= 1'b1;
  else
    spc6_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc6_dva_din && spc6_dva_wen)
    begin
     spc6_dva_inv <= 1'b1;
     spc6_dva_waddr_d <= spc6_dva_waddr;
    end
  else if(~spc6_dva_din && spc6_dva_wen)
    begin
     spc6_dva_inv <= 1'b0;
     spc6_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc6_dva_inv <= spc6_dva_inv;
     spc6_dva_waddr_d <= spc6_dva_waddr_d;
    end
end

always @(spc6_dva_raddr or spc6_dva_ren or spc6_dva_inv)
begin
  if (spc6_dva_inv && spc6_dva_ren && (spc6_dva_raddr[6:2] == spc6_dva_waddr_d))
    spc6_dva_vld2lkup <= 1'b1;
  else
    spc6_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc6_dva_inv && (spc6_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc6_dva_full_cntr <= 9'h000;
       spc6_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc6_dva_full_counter = %d", spc6_dva_full_cntr);
      end
    else if( spc6_dva_inv)
      begin
       spc6_dva_full_cntr <= spc6_dva_full_cntr + 1;
       spc6_dva_full_d <= spc6_dva_inv;
      end
    else
      begin
       spc6_dva_full_cntr <= spc6_dva_full_cntr;
       spc6_dva_full_d <= spc6_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc6_dva_vfull_d or spc6_dva_vld)
begin
  if (spc6_dva_vfull_d && ~spc6_dva_vld)
    spc6_dva_vfull_capture <= 1'b1;
  else
    spc6_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc6_dva_din && spc6_dva_wen)
   begin
    spc6_dva_vld <= 1'b1;
    spc6_dva_invwaddr_d <= spc6_dva_waddr;
    spc6_dva_invld_err <= spc6_dva_inv_perror;
   end
  else if(spc6_dva_din && spc6_dva_wen)
    begin
     spc6_dva_vld <= 1'b0;
     spc6_dva_invwaddr_d <= 5'b00000;
     spc6_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc6_dva_vld <= spc6_dva_vld;
     spc6_dva_invwaddr_d <= spc6_dva_invwaddr_d;
     spc6_dva_invld_err <= spc6_dva_invld_err;
    end
end


always @(spc6_dva_raddr or spc6_dva_ren or spc6_dva_vld)
begin
  if (spc6_dva_vld && spc6_dva_ren && (spc6_dva_raddr[6:2] == spc6_dva_waddr_d))
    spc6_dva_invld2lkup <= 1'b1;
  else
    spc6_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc6_dva_vld && (spc6_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc6_dva_vfull_cntr <= 9'h000;
    spc6_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc6_dva_vfull_counter = %d", spc6_dva_vfull_cntr);
  end
    else if( spc6_dva_vld)
    begin
      spc6_dva_vfull_cntr <= spc6_dva_vfull_cntr + 1;
      spc6_dva_vfull_d <= spc6_dva_vld;
    end
    else
    begin
      spc6_dva_vfull_cntr <= spc6_dva_vfull_cntr;
      spc6_dva_vfull_d <= spc6_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc6_dva_raddr or spc6_dva_waddr or spc6_dva_ren or spc6_dva_wen)
begin
  if ( spc6_dva_ren && spc6_dva_wen && (spc6_dva_raddr[6:2] == spc6_dva_waddr))
    spc6_dva_collide <= 1'b1;
  else
    spc6_dva_collide <= 1'b0;
end

// dva error cases

always @(spc6_dva_raddr or spc6_dva_ren or spc6_dva_dtag_perror or spc6_dva_dtag_perror)
begin
  if (spc6_dva_ren && (spc6_dva_dtag_perror || spc6_dva_dtag_perror))
    spc6_dva_err <= 1'b1;
  else
    spc6_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc6_dva_err)
     spc6_dva_efull_d <= 1'b1;
  else
     spc6_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc6_dva_ren && ~(spc6_dva_dtag_perror || spc6_dva_dtag_perror ) &&
       (spc6_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc6_dva_efull_cntr <= 9'h000;
     spc6_dva_raddr_d <= spc6_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc6_dva_efull_counter = %d", spc6_dva_efull_cntr);
    end
  else if(spc6_dva_efull_d)
    begin
      spc6_dva_efull_cntr <= spc6_dva_efull_cntr + 1;
      spc6_dva_raddr_d <= spc6_dva_raddr_d;
    end
  else
    begin
      spc6_dva_efull_cntr <= spc6_dva_efull_cntr;
      spc6_dva_raddr_d <= spc6_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
//============================================================================================
`ifdef RTL_SPARC7

wire 	   spc7_dva_ren 	        = `SPARC_CORE7.sparc0.lsu.ifu_lsu_ld_inst_e;
wire 	   spc7_dva_wen 	        = `SPARC_CORE7.sparc0.lsu.lsu_dtagv_wr_vld_e;
wire 	   spc7_dva_din 	        = `SPARC_CORE7.sparc0.lsu.dva_din_e;
wire [3:0] spc7_dva_dout 	        = `SPARC_CORE7.sparc0.lsu.dva_vld_m[3:0];
wire [6:0] spc7_dva_raddr 	        = `SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[10:4];
wire [4:0] spc7_dva_waddr 	        = `SPARC_CORE7.sparc0.lsu.dva_wr_adr_e[10:6];
wire       spc7_dva_dtag_perror 	= `SPARC_CORE7.sparc0.lsu.lsu_cpx_ld_dtag_perror_e;
wire       spc7_dva_dcache_perror 	= `SPARC_CORE7.sparc0.lsu.lsu_cpx_ld_dcache_perror_e;
wire       spc7_dva_inv_perror 	= `SPARC_CORE7.sparc0.lsu.qctl2.lsu_cpx_pkt_perror_dinv;
wire 	   spc7_ld_miss 	        = `SPARC_CORE7.sparc0.lsu.dctl.lsu_ld_miss_wb;
reg        spc7_ld_miss_capture;

wire 	   spc7_atomic_g 	        = `SPARC_CORE7.sparc0.lsu.qctl1.atomic_g;
wire [1:0] spc7_atm_type0 	= `SPARC_CORE7.sparc0.lsu.qctl1.stb0_atm_rq_type[2:1];

wire [1:0] spc7_atm_type1 	= `SPARC_CORE7.sparc0.lsu.qctl1.stb1_atm_rq_type[2:1];

wire [1:0] spc7_atm_type2 	= `SPARC_CORE7.sparc0.lsu.qctl1.stb2_atm_rq_type[2:1];

wire [1:0] spc7_atm_type3 	= `SPARC_CORE7.sparc0.lsu.qctl1.stb3_atm_rq_type[2:1];



wire [3:0] spc7_dctl_lsu_way_hit 	= `SPARC_CORE7.sparc0.lsu.dctl.lsu_way_hit;
wire       spc7_dctl_dcache_enable_g 	= `SPARC_CORE7.sparc0.lsu.dctl.dcache_enable_g;
wire       spc7_dctl_ldxa_internal 	= `SPARC_CORE7.sparc0.lsu.dctl.ldxa_internal;
wire       spc7_dctl_ldst_dbl_g 	= `SPARC_CORE7.sparc0.lsu.dctl.ldst_dbl_g;
wire       spc7_dctl_atomic_g 	= `SPARC_CORE7.sparc0.lsu.dctl.atomic_g;
wire       spc7_dctl_stb_cam_hit 	= `SPARC_CORE7.sparc0.lsu.dctl.stb_cam_hit;
wire       spc7_dctl_endian_mispred_g 	= `SPARC_CORE7.sparc0.lsu.dctl.endian_mispred_g;
wire       spc7_dctl_dcache_rd_parity_error 	= `SPARC_CORE7.sparc0.lsu.dctl.dcache_rd_parity_error;
wire       spc7_dctl_dtag_perror_g 	= `SPARC_CORE7.sparc0.lsu.dctl.dtag_perror_g;
wire       spc7_dctl_tte_data_perror_unc 	= `SPARC_CORE7.sparc0.lsu.dctl.tte_data_perror_unc;
wire       spc7_dctl_ld_inst_vld_g 	= `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_g;
wire       spc7_dctl_lsu_alt_space_g 	= `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g;
wire       spc7_dctl_recognized_asi_g 	= `SPARC_CORE7.sparc0.lsu.dctl.recognized_asi_g;
wire       spc7_dctl_ncache_asild_rq_g  = `SPARC_CORE7.sparc0.lsu.dctl.ncache_asild_rq_g ;
wire       spc7_dctl_bld_hit;
wire       spc7_dctl_bld_stb_hit;
// interfaces
// ifu
wire       spc7_ixinv0  = `SPARC_CORE7.sparc0.lsu.qctl2.imiss0_inv_en;
wire       spc7_ixinv1  = `SPARC_CORE7.sparc0.lsu.qctl2.imiss1_inv_en;
wire       spc7_ixinv2  = `SPARC_CORE7.sparc0.lsu.qctl2.imiss2_inv_en;
wire       spc7_ixinv3  = `SPARC_CORE7.sparc0.lsu.qctl2.imiss3_inv_en;

wire       spc7_ifill  = `SPARC_CORE7.sparc0.lsu.qctl2.lsu_ifill_pkt_vld ;
wire       spc7_inv  = `SPARC_CORE7.sparc0.lsu.qctl2.lsu_cpx_spc_inv_vld ;
wire       spc7_inv_clr  = `SPARC_CORE7.sparc0.lsu.qctl2.ifu_lsu_inv_clear;
wire       spc7_ibuf_busy  = `SPARC_CORE7.sparc0.lsu.qctl2.ifu_lsu_ibuf_busy;
//exu

wire       spc7_l2  = `SPARC_CORE7.sparc0.lsu.dctl.l2fill_vld_g ;
wire       spc7_unc  = `SPARC_CORE7.sparc0.lsu.dctl.unc_err_trap_g ;
wire       spc7_fpld  = `SPARC_CORE7.sparc0.lsu.dctl.l2fill_fpld_g ;
wire       spc7_fpldst  = `SPARC_CORE7.sparc0.lsu.dctl.fp_ldst_g ;
wire       spc7_unflush  = `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
wire       spc7_ldw  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire       spc7_byp  = `SPARC_CORE7.sparc0.lsu.dctl.intld_byp_data_vld_m ;
wire       spc7_flsh  = `SPARC_CORE7.sparc0.lsu.lsu_exu_flush_pipe_w ;
wire       spc7_chm  = `SPARC_CORE7.sparc0.lsu.dctl.common_ldst_miss_w ;
wire       spc7_ldxa  = `SPARC_CORE7.sparc0.lsu.dctl.ldxa_internal ;
wire       spc7_ato  = `SPARC_CORE7.sparc0.lsu.dctl.atomic_g ;
wire       spc7_pref  = `SPARC_CORE7.sparc0.lsu.dctl.pref_inst_g ;
wire       spc7_chit  = `SPARC_CORE7.sparc0.lsu.dctl.stb_cam_hit ;
wire       spc7_dcp  = `SPARC_CORE7.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire       spc7_dtp  = `SPARC_CORE7.sparc0.lsu.dctl.dtag_perror_g ;
//wire       spc7_mpc  = `SPARC_CORE7.sparc0.lsu.dctl.tte_data_perror_corr_en ;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
wire       spc7_mpc  = 1'b0;
wire       spc7_mpu  = `SPARC_CORE7.sparc0.lsu.dctl.tte_data_perror_unc_en ;


wire [17:0] spc7_exu_und;
reg  [4:0] spc7_exu;

// excptn
wire spc7_exp_wtchpt_trp_g                    = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g ;
wire spc7_exp_misalign_addr_ldst_atm_m         = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m ;
wire spc7_exp_priv_violtn_g                    = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire spc7_exp_daccess_excptn_g                 = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_daccess_excptn_g;
wire spc7_exp_daccess_prot_g                   = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire spc7_exp_priv_action_g                    = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire spc7_exp_spec_access_epage_g              = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire spc7_exp_uncache_atomic_g                 = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire spc7_exp_illegal_asi_action_g             = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire spc7_exp_flt_ld_nfo_pg_g                  = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc7_exp_asi_rd_unc                       = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_asi_rd_unc;
// wire spc7_exp_tlb_data_ce                     = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ce ;
wire spc7_exp_asi_rd_unc                       = 1'b0;
wire spc7_exp_tlb_data_ce                     =  1'b0;

wire spc7_exp_tlb_data_ue                     = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue ;
wire spc7_exp_tlb_tag_ue                      = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue ;
wire spc7_exp_unc                  = `SPARC_CORE7.sparc0.lsu.excpctl.tte_data_perror_unc;
// Combine sanjay's change in lsu_mon.v hack 1.21 to 1.24
// wire spc7_exp_corr                 = `SPARC_CORE7.sparc0.lsu.excpctl.tte_data_perror_corr;
wire spc7_exp_corr                 = 1'b0;
wire [15:0] spc7_exp_und;
reg  [4:0] spc7_exp;
// dctl cmplt

wire       spc7_dctl_stxa_internal_d2  = `SPARC_CORE7.sparc0.lsu.dctl.stxa_internal_d2;
wire       spc7_dctl_lsu_l2fill_vld  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_l2fill_vld;
wire       spc7_dctl_atomic_ld_squash_e  = `SPARC_CORE7.sparc0.lsu.dctl.atomic_ld_squash_e;
wire       spc7_dctl_lsu_ignore_fill  = `SPARC_CORE7.sparc0.lsu.qctl2.lsu_ignore_fill;
wire       spc7_dctl_l2fill_fpld_e  = `SPARC_CORE7.sparc0.lsu.dctl.l2fill_fpld_e;
// wire       spc7_dctl_lsu_atm_st_cmplt_e  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_atm_st_cmplt_e;
wire       spc7_dctl_fill_err_trap_e  = `SPARC_CORE7.sparc0.lsu.dctl.fill_err_trap_e;
wire       spc7_dctl_l2_corr_error_e  = `SPARC_CORE7.sparc0.lsu.dctl.l2_corr_error_e;
wire [3:0] spc7_dctl_intld_byp_cmplt  = `SPARC_CORE7.sparc0.lsu.dctl.intld_byp_cmplt;
wire [3:0] spc7_dctl_lsu_intrpt_cmplt  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_intrpt_cmplt;
wire [3:0] spc7_dctl_ldxa_illgl_va_cmplt_d1  = `SPARC_CORE7.sparc0.lsu.dctl.ldxa_illgl_va_cmplt_d1;
wire [3:0] spc7_dctl_pref_tlbmiss_cmplt_d2  = `SPARC_CORE7.sparc0.lsu.dctl.pref_tlbmiss_cmplt_d2;
wire [3:0] spc7_dctl_lsu_pcx_pref_issue  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_pcx_pref_issue;
wire [3:0] spc7_dctl_lsu_ifu_ldst_cmplt  = `SPARC_CORE7.sparc0.lsu.dctl.lsu_ifu_ldst_cmplt;
reg  [3:0] spc7_dctl_lsu_ifu_ldst_cmplt_d;
reg  [3:0] spc7_ldstcond_cmplt_d;

wire       spc7_qctl1_ld_sec_hit_thrd0  = `SPARC_CORE7.sparc0.lsu.qctl1.ld_sec_hit_thrd0;
wire       spc7_qctl1_ld0_inst_vld_g  = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire       spc7_ld0_pkt_vld_unmasked  = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pkt_vld_unmasked;
reg        spc7_ld0_pkt_vld_unmasked_d;
reg	   spc7_qctl1_ld_sec_hit_thrd0_w2;

wire       spc7_dctl_thread0_w3  = `SPARC_CORE7.sparc0.lsu.dctl.thread0_w3;
wire       spc7_dctl_dfill_thread0  = `SPARC_CORE7.sparc0.lsu.dctl.dfill_thread0;
wire       spc7_dctl_stxa_stall_wr_cmplt0_d1  = `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_wr_cmplt0_d1;
wire       spc7_dctl_diag_wr_cmplt0  = `SPARC_CORE7.sparc0.lsu.dctl.diag_wr_cmplt0;
wire       spc7_dctl_bsync0_reset  = `SPARC_CORE7.sparc0.lsu.dctl.bsync0_reset;
wire       spc7_dctl_late_cmplt0  = `SPARC_CORE7.sparc0.lsu.dctl.ldst_cmplt_late_0_d1;
wire       spc7_dctl_stxa_cmplt0;
wire       spc7_dctl_l2fill_cmplt0;
wire       spc7_dctl_atm_cmplt0;
wire       spc7_dctl_fillerr0;
wire [4:0] spc7_cmplt0;
wire [5:0] spc7_dctl_ldst_cond_cmplt0;
reg  [3:0] spc7_ldstcond_cmplt0;
reg  [3:0] spc7_ldstcond_cmplt0_d;

wire       spc7_qctl1_ld_sec_hit_thrd1  = `SPARC_CORE7.sparc0.lsu.qctl1.ld_sec_hit_thrd1;
wire       spc7_qctl1_ld1_inst_vld_g  = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire       spc7_ld1_pkt_vld_unmasked  = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pkt_vld_unmasked;
reg        spc7_ld1_pkt_vld_unmasked_d;
reg	   spc7_qctl1_ld_sec_hit_thrd1_w2;

wire       spc7_dctl_thread1_w3  = `SPARC_CORE7.sparc0.lsu.dctl.thread1_w3;
wire       spc7_dctl_dfill_thread1  = `SPARC_CORE7.sparc0.lsu.dctl.dfill_thread1;
wire       spc7_dctl_stxa_stall_wr_cmplt1_d1  = `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_wr_cmplt1_d1;
wire       spc7_dctl_diag_wr_cmplt1  = `SPARC_CORE7.sparc0.lsu.dctl.diag_wr_cmplt1;
wire       spc7_dctl_bsync1_reset  = `SPARC_CORE7.sparc0.lsu.dctl.bsync1_reset;
wire       spc7_dctl_late_cmplt1  = `SPARC_CORE7.sparc0.lsu.dctl.ldst_cmplt_late_1_d1;
wire       spc7_dctl_stxa_cmplt1;
wire       spc7_dctl_l2fill_cmplt1;
wire       spc7_dctl_atm_cmplt1;
wire       spc7_dctl_fillerr1;
wire [4:0] spc7_cmplt1;
wire [5:0] spc7_dctl_ldst_cond_cmplt1;
reg  [3:0] spc7_ldstcond_cmplt1;
reg  [3:0] spc7_ldstcond_cmplt1_d;

wire       spc7_qctl1_ld_sec_hit_thrd2  = `SPARC_CORE7.sparc0.lsu.qctl1.ld_sec_hit_thrd2;
wire       spc7_qctl1_ld2_inst_vld_g  = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire       spc7_ld2_pkt_vld_unmasked  = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pkt_vld_unmasked;
reg        spc7_ld2_pkt_vld_unmasked_d;
reg	   spc7_qctl1_ld_sec_hit_thrd2_w2;

wire       spc7_dctl_thread2_w3  = `SPARC_CORE7.sparc0.lsu.dctl.thread2_w3;
wire       spc7_dctl_dfill_thread2  = `SPARC_CORE7.sparc0.lsu.dctl.dfill_thread2;
wire       spc7_dctl_stxa_stall_wr_cmplt2_d1  = `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_wr_cmplt2_d1;
wire       spc7_dctl_diag_wr_cmplt2  = `SPARC_CORE7.sparc0.lsu.dctl.diag_wr_cmplt2;
wire       spc7_dctl_bsync2_reset  = `SPARC_CORE7.sparc0.lsu.dctl.bsync2_reset;
wire       spc7_dctl_late_cmplt2  = `SPARC_CORE7.sparc0.lsu.dctl.ldst_cmplt_late_2_d1;
wire       spc7_dctl_stxa_cmplt2;
wire       spc7_dctl_l2fill_cmplt2;
wire       spc7_dctl_atm_cmplt2;
wire       spc7_dctl_fillerr2;
wire [4:0] spc7_cmplt2;
wire [5:0] spc7_dctl_ldst_cond_cmplt2;
reg  [3:0] spc7_ldstcond_cmplt2;
reg  [3:0] spc7_ldstcond_cmplt2_d;

wire       spc7_qctl1_ld_sec_hit_thrd3  = `SPARC_CORE7.sparc0.lsu.qctl1.ld_sec_hit_thrd3;
wire       spc7_qctl1_ld3_inst_vld_g  = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire       spc7_ld3_pkt_vld_unmasked  = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pkt_vld_unmasked;
reg        spc7_ld3_pkt_vld_unmasked_d;
reg	   spc7_qctl1_ld_sec_hit_thrd3_w2;

wire       spc7_dctl_thread3_w3  = `SPARC_CORE7.sparc0.lsu.dctl.thread3_w3;
wire       spc7_dctl_dfill_thread3  = `SPARC_CORE7.sparc0.lsu.dctl.dfill_thread3;
wire       spc7_dctl_stxa_stall_wr_cmplt3_d1  = `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_wr_cmplt3_d1;
wire       spc7_dctl_diag_wr_cmplt3  = `SPARC_CORE7.sparc0.lsu.dctl.diag_wr_cmplt3;
wire       spc7_dctl_bsync3_reset  = `SPARC_CORE7.sparc0.lsu.dctl.bsync3_reset;
wire       spc7_dctl_late_cmplt3  = `SPARC_CORE7.sparc0.lsu.dctl.ldst_cmplt_late_3_d1;
wire       spc7_dctl_stxa_cmplt3;
wire       spc7_dctl_l2fill_cmplt3;
wire       spc7_dctl_atm_cmplt3;
wire       spc7_dctl_fillerr3;
wire [4:0] spc7_cmplt3;
wire [5:0] spc7_dctl_ldst_cond_cmplt3;
reg  [3:0] spc7_ldstcond_cmplt3;
reg  [3:0] spc7_ldstcond_cmplt3_d;


wire       spc7_qctl1_bld_g 	= `SPARC_CORE7.sparc0.lsu.qctl1.bld_g;
wire       spc7_qctl1_bld_reset 	= `SPARC_CORE7.sparc0.lsu.qctl1.bld_reset;
wire [1:0] spc7_qctl1_bld_cnt 	= `SPARC_CORE7.sparc0.lsu.qctl1.bld_cnt;


reg  [9:0] spc7_bld0_full_cntr;
reg  [1:0] spc7_bld0_full_d;
reg 	   spc7_bld0_full_capture;
reg  [9:0] spc7_bld1_full_cntr;
reg  [1:0] spc7_bld1_full_d;
reg 	   spc7_bld1_full_capture;
reg  [9:0] spc7_bld2_full_cntr;
reg  [1:0] spc7_bld2_full_d;
reg 	   spc7_bld2_full_capture;
reg  [9:0] spc7_bld3_full_cntr;
reg  [1:0] spc7_bld3_full_d;
reg 	   spc7_bld3_full_capture;

wire       spc7_ipick 	= `SPARC_CORE7.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
wire       spc7_lpick 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld_pcx_rq_all;
wire       spc7_spick 	= `SPARC_CORE7.sparc0.lsu.qctl1.st_pcx_rq_all;
wire       spc7_mpick 	= `SPARC_CORE7.sparc0.lsu.qctl1.misc_pcx_rq_all;
wire [3:0] spc7_apick 	= `SPARC_CORE7.sparc0.lsu.qctl1.all_pcx_rq_pick;
wire       spc7_msquash 	= `SPARC_CORE7.sparc0.lsu.qctl1.mcycle_squash_d1;

reg       spc7_fpicko;
wire [3:0] spc7_fpick;

wire [39:0] spc7_imiss_pa 	= `SPARC_CORE7.sparc0.lsu.ifu_lsu_pcxpkt_e[39:0];
wire       spc7_imiss_vld 	= `SPARC_CORE7.sparc0.lsu.qctl1.imiss_pcx_rq_vld;
reg       spc7_imiss_vld_d;
wire [39:0] spc7_lmiss_pa0 	= `SPARC_CORE7.sparc0.lsu.qdp1.lmq0_pcx_pkt[39:0];
wire       spc7_lmiss_vld0 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire       spc7_ld_pkt_vld0 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pkt_vld;
wire       spc7_st_pkt_vld0 	= `SPARC_CORE7.sparc0.lsu.qctl1.st0_pkt_vld;

reg       spc7_lmiss_eq0;
reg             spc7_atm_imiss_eq0;
wire [39:0] spc7_lmiss_pa1 	= `SPARC_CORE7.sparc0.lsu.qdp1.lmq1_pcx_pkt[39:0];
wire       spc7_lmiss_vld1 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire       spc7_ld_pkt_vld1 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pkt_vld;
wire       spc7_st_pkt_vld1 	= `SPARC_CORE7.sparc0.lsu.qctl1.st1_pkt_vld;

reg       spc7_lmiss_eq1;
reg             spc7_atm_imiss_eq1;
wire [39:0] spc7_lmiss_pa2 	= `SPARC_CORE7.sparc0.lsu.qdp1.lmq2_pcx_pkt[39:0];
wire       spc7_lmiss_vld2 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire       spc7_ld_pkt_vld2 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pkt_vld;
wire       spc7_st_pkt_vld2 	= `SPARC_CORE7.sparc0.lsu.qctl1.st2_pkt_vld;

reg       spc7_lmiss_eq2;
reg             spc7_atm_imiss_eq2;
wire [39:0] spc7_lmiss_pa3 	= `SPARC_CORE7.sparc0.lsu.qdp1.lmq3_pcx_pkt[39:0];
wire       spc7_lmiss_vld3 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire       spc7_ld_pkt_vld3 	= `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pkt_vld;
wire       spc7_st_pkt_vld3 	= `SPARC_CORE7.sparc0.lsu.qctl1.st3_pkt_vld;

reg       spc7_lmiss_eq3;
reg             spc7_atm_imiss_eq3;

wire [44:0]	spc7_wdata_ramc = `SPARC_CORE7.sparc0.lsu.stb_cam.wdata_ramc;
wire		spc7_wptr_vld   = `SPARC_CORE7.sparc0.lsu.stb_cam.wptr_vld;
wire [75:0]	spc7_wdata_ramd = {`SPARC_CORE7.sparc0.lsu.stb_wdata_ramd_b75_b64[75:64],`SPARC_CORE7.sparc0.lsu.lsu_stb_st_data_g[63:0]};

wire 	   spc7_stb_cam_hit 	        = `SPARC_CORE7.sparc0.lsu.stb_rwctl.stb_cam_hit;
wire [2:0] spc7_stb_cam_hit_ptr 	= `SPARC_CORE7.sparc0.lsu.stb_rwctl.stb_cam_hit_ptr;
wire [7:0] spc7_stb_ld_full_raw	= `SPARC_CORE7.sparc0.lsu.stb_ld_full_raw[7:0];
wire [7:0] spc7_stb_ld_partial_raw	= `SPARC_CORE7.sparc0.lsu.stb_ld_partial_raw[7:0];
wire       spc7_stb_cam_mhit		= `SPARC_CORE7.sparc0.lsu.stb_cam_mhit;

wire [3:0] spc7_dfq_vld_entries 	= `SPARC_CORE7.sparc0.lsu.qctl2.dfq_vld_entries;
wire 	   spc7_dfq_full;
reg  [9:0] spc7_dfq_full_cntr;
reg        spc7_dfq_full_d;
reg 	   spc7_dfq_full_capture;

reg  [9:0] spc7_dfq_full_cntr1;
reg        spc7_dfq_full_d1;
wire 	   spc7_dfq_full1;
reg 	   spc7_dfq_full_capture1;
reg  [9:0] spc7_dfq_full_cntr2;
reg        spc7_dfq_full_d2;
wire 	   spc7_dfq_full2;
reg 	   spc7_dfq_full_capture2;
reg  [9:0] spc7_dfq_full_cntr3;
reg        spc7_dfq_full_d3;
wire 	   spc7_dfq_full3;
reg 	   spc7_dfq_full_capture3;
reg  [9:0] spc7_dfq_full_cntr4;
reg        spc7_dfq_full_d4;
wire 	   spc7_dfq_full4;
reg 	   spc7_dfq_full_capture4;
reg  [9:0] spc7_dfq_full_cntr5;
reg        spc7_dfq_full_d5;
wire 	   spc7_dfq_full5;
reg 	   spc7_dfq_full_capture5;
reg  [9:0] spc7_dfq_full_cntr6;
reg        spc7_dfq_full_d6;
wire 	   spc7_dfq_full6;
reg 	   spc7_dfq_full_capture6;
reg  [9:0] spc7_dfq_full_cntr7;
reg        spc7_dfq_full_d7;
wire 	   spc7_dfq_full7;
reg 	   spc7_dfq_full_capture7;

wire 	   spc7_dva_rdwrhit;
reg  [9:0] spc7_dva_full_cntr;
reg        spc7_dva_full_d;
reg 	   spc7_dva_full_capture;
reg 	   spc7_dva_inv;
reg 	   spc7_dva_inv_d;
reg 	   spc7_dva_vld;
reg 	   spc7_dva_vld_d;
reg  [9:0] spc7_dva_vfull_cntr;
reg        spc7_dva_vfull_d;
reg 	   spc7_dva_vfull_capture;
reg        spc7_dva_collide;
reg        spc7_dva_vld2lkup;
reg        spc7_dva_invld2lkup;
reg        spc7_dva_invld_err;

reg  [9:0] spc7_dva_efull_cntr;
reg        spc7_dva_efull_d;

reg        spc7_dva_vlddtag_err;
reg        spc7_dva_vlddcache_err;
reg        spc7_dva_err;
reg [6:0] spc7_dva_raddr_d;
reg [4:0] spc7_dva_waddr_d;
reg [4:0] spc7_dva_invwaddr_d;

reg  	        spc7_ld0_lt_1;
reg  	        spc7_ld0_lt_2;
reg  	        spc7_ld0_lt_3;
reg  	        spc7_ld1_lt_0;
reg  	        spc7_ld1_lt_2;
reg  	        spc7_ld1_lt_3;
reg  	        spc7_ld2_lt_0;
reg  	        spc7_ld2_lt_1;
reg  	        spc7_ld2_lt_3;
reg  	        spc7_ld3_lt_0;
reg  	        spc7_ld3_lt_1;
reg  	        spc7_ld3_lt_2;

reg  	        spc7_st0_lt_1;
reg  	        spc7_st0_lt_2;
reg  	        spc7_st0_lt_3;
reg  	        spc7_st1_lt_0;
reg  	        spc7_st1_lt_2;
reg  	        spc7_st1_lt_3;
reg  	        spc7_st2_lt_0;
reg  	        spc7_st2_lt_1;
reg  	        spc7_st2_lt_3;
reg  	        spc7_st3_lt_0;
reg  	        spc7_st3_lt_1;
reg  	        spc7_st3_lt_2;

wire [11:0]      spc7_ld_ooo_ret;
wire [11:0]      spc7_st_ooo_ret;

wire [7:0]	spc7_stb_state_vld0 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld;
wire [7:0]	spc7_stb_state_ack0 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_ack;
wire [7:0]	spc7_stb_state_ced0 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_ced;
wire [7:0]	spc7_stb_state_rst0 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_rst;
wire 	        spc7_stb_ack_vld0 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.ack_vld;
wire 	        spc7_ld0_inst_vld_g 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_inst_vld_g;
wire 	        spc7_intrpt0_cmplt 	 = `SPARC_CORE7.sparc0.lsu.qctl1.lsu_intrpt_cmplt[0];
wire 	        spc7_stb0_full 	         = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_full;
wire 	        spc7_stb0_full_w2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_full_w2;
wire 	        spc7_lmq0_full 	         = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pcx_rq_vld;
wire 	        spc7_mbar_vld0 	         = `SPARC_CORE7.sparc0.lsu.dctl.mbar_vld0;
wire 	        spc7_ld0_unfilled 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_unfilled;
wire 	        spc7_flsh_vld0	         = `SPARC_CORE7.sparc0.lsu.dctl.flsh_vld0;

reg  [9:0]	spc7_ld0_unf_cntr;
reg  	        spc7_ld0_unfilled_d;

reg  [9:0]	spc7_st0_unf_cntr;
reg  	        spc7_st0_unfilled_d;
reg  	        spc7_st0_unfilled;

reg 	        spc7_mbar_vld_d0;
reg 	        spc7_flsh_vld_d0;

reg 	        spc7_lmq0_full_d;
reg  [9:0]	spc7_lmq_full_cntr0;
reg             spc7_lmq_full_capture0;

reg  [9:0]	spc7_stb_full_cntr0;
reg 		spc7_stb_full_capture0;

reg  [9:0]	spc7_mbar_vld_cntr0;
reg 		spc7_mbar_vld_capture0;

reg  [9:0]	spc7_flsh_vld_cntr0;
reg 		spc7_flsh_vld_capture0;

reg 		spc7_stb_head_hit0;
wire 		spc7_raw_ack_capture0;
reg  [9:0]	spc7_stb_ack_cntr0;

reg  [9:0]	spc7_stb_ced_cntr0;
reg  	        spc7_stb_ced0_d;
reg  	        spc7_stb_ced_capture0;
wire  	        spc7_stb_ced0;

reg 	        spc7_atm0_d;
reg  [9:0]	spc7_atm_cntr0;
reg             spc7_atm_intrpt_capture0;
reg             spc7_atm_intrpt_b4capture0;
reg             spc7_atm_inv_capture0;


reg  [39:0]     spc7_stb_wr_addr0;
reg  [39:0]     spc7_stb_atm_addr0;
reg             spc7_atm_lmiss_eq0;
wire [7:0]	spc7_stb_state_vld1 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld;
wire [7:0]	spc7_stb_state_ack1 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_ack;
wire [7:0]	spc7_stb_state_ced1 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_ced;
wire [7:0]	spc7_stb_state_rst1 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_rst;
wire 	        spc7_stb_ack_vld1 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.ack_vld;
wire 	        spc7_ld1_inst_vld_g 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_inst_vld_g;
wire 	        spc7_intrpt1_cmplt 	 = `SPARC_CORE7.sparc0.lsu.qctl1.lsu_intrpt_cmplt[1];
wire 	        spc7_stb1_full 	         = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_full;
wire 	        spc7_stb1_full_w2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_full_w2;
wire 	        spc7_lmq1_full 	         = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pcx_rq_vld;
wire 	        spc7_mbar_vld1 	         = `SPARC_CORE7.sparc0.lsu.dctl.mbar_vld1;
wire 	        spc7_ld1_unfilled 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_unfilled;
wire 	        spc7_flsh_vld1	         = `SPARC_CORE7.sparc0.lsu.dctl.flsh_vld1;

reg  [9:0]	spc7_ld1_unf_cntr;
reg  	        spc7_ld1_unfilled_d;

reg  [9:0]	spc7_st1_unf_cntr;
reg  	        spc7_st1_unfilled_d;
reg  	        spc7_st1_unfilled;

reg 	        spc7_mbar_vld_d1;
reg 	        spc7_flsh_vld_d1;

reg 	        spc7_lmq1_full_d;
reg  [9:0]	spc7_lmq_full_cntr1;
reg             spc7_lmq_full_capture1;

reg  [9:0]	spc7_stb_full_cntr1;
reg 		spc7_stb_full_capture1;

reg  [9:0]	spc7_mbar_vld_cntr1;
reg 		spc7_mbar_vld_capture1;

reg  [9:0]	spc7_flsh_vld_cntr1;
reg 		spc7_flsh_vld_capture1;

reg 		spc7_stb_head_hit1;
wire 		spc7_raw_ack_capture1;
reg  [9:0]	spc7_stb_ack_cntr1;

reg  [9:0]	spc7_stb_ced_cntr1;
reg  	        spc7_stb_ced1_d;
reg  	        spc7_stb_ced_capture1;
wire  	        spc7_stb_ced1;

reg 	        spc7_atm1_d;
reg  [9:0]	spc7_atm_cntr1;
reg             spc7_atm_intrpt_capture1;
reg             spc7_atm_intrpt_b4capture1;
reg             spc7_atm_inv_capture1;


reg  [39:0]     spc7_stb_wr_addr1;
reg  [39:0]     spc7_stb_atm_addr1;
reg             spc7_atm_lmiss_eq1;
wire [7:0]	spc7_stb_state_vld2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld;
wire [7:0]	spc7_stb_state_ack2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_ack;
wire [7:0]	spc7_stb_state_ced2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_ced;
wire [7:0]	spc7_stb_state_rst2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_rst;
wire 	        spc7_stb_ack_vld2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.ack_vld;
wire 	        spc7_ld2_inst_vld_g 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_inst_vld_g;
wire 	        spc7_intrpt2_cmplt 	 = `SPARC_CORE7.sparc0.lsu.qctl1.lsu_intrpt_cmplt[2];
wire 	        spc7_stb2_full 	         = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_full;
wire 	        spc7_stb2_full_w2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_full_w2;
wire 	        spc7_lmq2_full 	         = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pcx_rq_vld;
wire 	        spc7_mbar_vld2 	         = `SPARC_CORE7.sparc0.lsu.dctl.mbar_vld2;
wire 	        spc7_ld2_unfilled 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_unfilled;
wire 	        spc7_flsh_vld2	         = `SPARC_CORE7.sparc0.lsu.dctl.flsh_vld2;

reg  [9:0]	spc7_ld2_unf_cntr;
reg  	        spc7_ld2_unfilled_d;

reg  [9:0]	spc7_st2_unf_cntr;
reg  	        spc7_st2_unfilled_d;
reg  	        spc7_st2_unfilled;

reg 	        spc7_mbar_vld_d2;
reg 	        spc7_flsh_vld_d2;

reg 	        spc7_lmq2_full_d;
reg  [9:0]	spc7_lmq_full_cntr2;
reg             spc7_lmq_full_capture2;

reg  [9:0]	spc7_stb_full_cntr2;
reg 		spc7_stb_full_capture2;

reg  [9:0]	spc7_mbar_vld_cntr2;
reg 		spc7_mbar_vld_capture2;

reg  [9:0]	spc7_flsh_vld_cntr2;
reg 		spc7_flsh_vld_capture2;

reg 		spc7_stb_head_hit2;
wire 		spc7_raw_ack_capture2;
reg  [9:0]	spc7_stb_ack_cntr2;

reg  [9:0]	spc7_stb_ced_cntr2;
reg  	        spc7_stb_ced2_d;
reg  	        spc7_stb_ced_capture2;
wire  	        spc7_stb_ced2;

reg 	        spc7_atm2_d;
reg  [9:0]	spc7_atm_cntr2;
reg             spc7_atm_intrpt_capture2;
reg             spc7_atm_intrpt_b4capture2;
reg             spc7_atm_inv_capture2;


reg  [39:0]     spc7_stb_wr_addr2;
reg  [39:0]     spc7_stb_atm_addr2;
reg             spc7_atm_lmiss_eq2;
wire [7:0]	spc7_stb_state_vld3 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld;
wire [7:0]	spc7_stb_state_ack3 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_ack;
wire [7:0]	spc7_stb_state_ced3 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_ced;
wire [7:0]	spc7_stb_state_rst3 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_rst;
wire 	        spc7_stb_ack_vld3 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.ack_vld;
wire 	        spc7_ld3_inst_vld_g 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_inst_vld_g;
wire 	        spc7_intrpt3_cmplt 	 = `SPARC_CORE7.sparc0.lsu.qctl1.lsu_intrpt_cmplt[3];
wire 	        spc7_stb3_full 	         = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_full;
wire 	        spc7_stb3_full_w2 	 = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_full_w2;
wire 	        spc7_lmq3_full 	         = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pcx_rq_vld;
wire 	        spc7_mbar_vld3 	         = `SPARC_CORE7.sparc0.lsu.dctl.mbar_vld3;
wire 	        spc7_ld3_unfilled 	 = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_unfilled;
wire 	        spc7_flsh_vld3	         = `SPARC_CORE7.sparc0.lsu.dctl.flsh_vld3;

reg  [9:0]	spc7_ld3_unf_cntr;
reg  	        spc7_ld3_unfilled_d;

reg  [9:0]	spc7_st3_unf_cntr;
reg  	        spc7_st3_unfilled_d;
reg  	        spc7_st3_unfilled;

reg 	        spc7_mbar_vld_d3;
reg 	        spc7_flsh_vld_d3;

reg 	        spc7_lmq3_full_d;
reg  [9:0]	spc7_lmq_full_cntr3;
reg             spc7_lmq_full_capture3;

reg  [9:0]	spc7_stb_full_cntr3;
reg 		spc7_stb_full_capture3;

reg  [9:0]	spc7_mbar_vld_cntr3;
reg 		spc7_mbar_vld_capture3;

reg  [9:0]	spc7_flsh_vld_cntr3;
reg 		spc7_flsh_vld_capture3;

reg 		spc7_stb_head_hit3;
wire 		spc7_raw_ack_capture3;
reg  [9:0]	spc7_stb_ack_cntr3;

reg  [9:0]	spc7_stb_ced_cntr3;
reg  	        spc7_stb_ced3_d;
reg  	        spc7_stb_ced_capture3;
wire  	        spc7_stb_ced3;

reg 	        spc7_atm3_d;
reg  [9:0]	spc7_atm_cntr3;
reg             spc7_atm_intrpt_capture3;
reg             spc7_atm_intrpt_b4capture3;
reg             spc7_atm_inv_capture3;


reg  [39:0]     spc7_stb_wr_addr3;
reg  [39:0]     spc7_stb_atm_addr3;
reg             spc7_atm_lmiss_eq3;
// bug 3967
// The following bad_states needs to be added in lsu_mon.
// <   bad_state s_not_ipick (8'bxxx1xxx0);
// <   bad_state s_not_lpick (8'bxx10xx0x);
// <   bad_state s_not_spick (8'bx100x0xx);
// <   bad_state s_not_mpick (8'b10000xxx);

assign spc7_fpick = {spc7_mpick,spc7_spick,spc7_lpick,spc7_ipick};

// Sanjay mentioned, that the final picker is just
// priority encoded for i miss but ld/st/misc are round robin.
// At some point he as to communicate this thru either in a spec.
// or a mail.
always @(negedge clk)
begin
    if(rst_l)
     begin
       casex ({spc7_msquash,spc7_apick,spc7_fpick})
         9'b000000000 : spc7_fpicko = 1'b0;
         9'b0xxx1xxx1 : spc7_fpicko = 1'b0;
         9'b1xxxxxxxx : spc7_fpicko = 1'b0;
         9'b0xxx0xxx0 : spc7_fpicko = 1'b0;
	 default:
	  begin
		spc7_fpicko =  1'b1;
		$display("%0d ERROR: lsu_mon7 final picker imiss not picked", $time);
		repeat(100) @(posedge clk);
		$finish;
	  end
       endcase
     end
end

// interface
//exu
assign spc7_exu_und = {spc7_l2,
			  spc7_unc,
			  spc7_fpld,
			  spc7_fpldst,
			  spc7_unflush,
			  spc7_ldw,
			  spc7_byp,
			  spc7_flsh,
			  spc7_chm,
			  spc7_ldxa,
			  spc7_ato,
			  spc7_pref,
			  spc7_chit,
			  spc7_dcp,
			  spc7_dtp,
			  spc7_mpc,
			  spc7_mpu};

always @(spc7_exu_und)
begin
       case (spc7_exu_und)
         17'h00000 : spc7_exu =  5'h00;
         17'h00001 : spc7_exu =  5'h01;
         17'h00002 : spc7_exu =  5'h02;
         17'h00004 : spc7_exu =  5'h03;
         17'h00008 : spc7_exu =  5'h04;
         17'h00010 : spc7_exu =  5'h05;
         17'h00020 : spc7_exu =  5'h06;
         17'h00040 : spc7_exu =  5'h07;
         17'h00080 : spc7_exu =  5'h08;
         17'h00100 : spc7_exu =  5'h09;
         17'h00200 : spc7_exu =  5'h0a;
         17'h00400 : spc7_exu =  5'h0b;
         17'h00800 : spc7_exu =  5'h0c;
         17'h01000 : spc7_exu =  5'h0d;
         17'h02000 : spc7_exu =  5'h0e;
         17'h04000 : spc7_exu =  5'h0f;
         17'h08000 : spc7_exu =  5'h10;
         17'h10000 : spc7_exu =  5'h11;
	 default: spc7_exu =  5'h12;
       endcase
end
//excp
assign spc7_exp_und = {spc7_exp_wtchpt_trp_g,
			  spc7_exp_misalign_addr_ldst_atm_m,
			  spc7_exp_priv_violtn_g,
			  spc7_exp_daccess_excptn_g,
			  spc7_exp_daccess_prot_g,
			  spc7_exp_priv_action_g,
			  spc7_exp_spec_access_epage_g,
			  spc7_exp_uncache_atomic_g,
			  spc7_exp_illegal_asi_action_g,
			  spc7_exp_flt_ld_nfo_pg_g,
			  spc7_exp_asi_rd_unc,
			  spc7_exp_tlb_data_ce,
			  spc7_exp_tlb_data_ue,
			  spc7_exp_tlb_tag_ue,
			  spc7_exp_unc,
			  spc7_exp_corr};

always @(spc7_exp_und)
begin
       case (spc7_exp_und)
         16'h0000 : spc7_exp =  5'h00;
         16'h0001 : spc7_exp =  5'h01;
         16'h0002 : spc7_exp =  5'h02;
         16'h0004 : spc7_exp =  5'h03;
         16'h0008 : spc7_exp =  5'h04;
         16'h0010 : spc7_exp =  5'h05;
         16'h0020 : spc7_exp =  5'h06;
         16'h0040 : spc7_exp =  5'h07;
         16'h0080 : spc7_exp =  5'h08;
         16'h0100 : spc7_exp =  5'h09;
         16'h0200 : spc7_exp =  5'h0a;
         16'h0400 : spc7_exp =  5'h0b;
         16'h0800 : spc7_exp =  5'h0c;
         16'h1000 : spc7_exp =  5'h0d;
         16'h2000 : spc7_exp =  5'h0e;
         16'h4000 : spc7_exp =  5'h0f;
         16'h8000 : spc7_exp =  5'h10;
	 default: spc7_exp =  5'h11;
       endcase
end

//dctl cmplt compact
// Change for rtl timing fix :
// assign  lsu_ifu_ldst_cmplt[0] =
//     // * can be early or
//     ((stxa_internal_d2 & thread0_w3) | stxa_stall_wr_cmplt0_d1) |
//     // * late signal and critical.
//     // Can this be snapped earlier ?
//     (((l2fill_vld_e & ~atomic_ld_squash_e & ~ignore_fill))
//       & ~l2fill_fpld_e & ~lsu_cpx_pkt_ld_err[1] & dfill_thread0)  |// 1st fill for ldd.
//       //& ~l2fill_fpld_e & ~fill_err_trap_e & dfill_thread0)  |// 1st fill for ldd.
//     intld_byp_cmplt[0] |
//     // * early-or signals
//     ldst_cmplt_late_0_d1 ;
// assign	ldst_cmplt_late_0 =
//     (lsu_atm_st_cmplt_e & ~fill_err_trap_e & dfill_thread0) |
//     bsync0_reset    |
//     lsu_intrpt_cmplt[0]   |
//     diag_wr_cmplt0 |
//     dc0_diagnstc_rd_w2 |
//     ldxa_illgl_va_cmplt_d1[0] |
//     pref_tlbmiss_cmplt_d2[0] |
//     lsu_pcx_pref_issue[0];


assign spc7_dctl_stxa_cmplt0 = ((spc7_dctl_stxa_internal_d2 & spc7_dctl_thread0_w3) |
				       spc7_dctl_stxa_stall_wr_cmplt0_d1);
assign spc7_dctl_l2fill_cmplt0 = (((spc7_dctl_lsu_l2fill_vld & ~spc7_dctl_atomic_ld_squash_e &
					    ~spc7_dctl_lsu_ignore_fill)) & ~spc7_dctl_l2fill_fpld_e &
					  ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread0);

assign spc7_dctl_fillerr0 = spc7_dctl_l2_corr_error_e & spc7_dctl_dfill_thread0;
// Rolling in changes due to bug 3624
// assign spc7_dctl_atm_cmplt0 = (spc7_dctl_lsu_atm_st_cmplt_e & ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread0);

assign spc7_dctl_ldst_cond_cmplt0 = { spc7_dctl_stxa_cmplt0, spc7_dctl_l2fill_cmplt0,
					    spc7_dctl_atomic_ld_squash_e, spc7_dctl_intld_byp_cmplt[0],
					    spc7_dctl_bsync0_reset, spc7_dctl_lsu_intrpt_cmplt[0]
					     };

assign spc7_cmplt0 = { spc7_dctl_ldxa_illgl_va_cmplt_d1, spc7_dctl_pref_tlbmiss_cmplt_d2,
			      spc7_dctl_lsu_pcx_pref_issue, spc7_dctl_diag_wr_cmplt0, spc7_dctl_l2fill_fpld_e};


always @(spc7_cmplt0 or spc7_dctl_ldst_cond_cmplt0)
begin
       case ({spc7_dctl_fillerr0,spc7_dctl_ldst_cond_cmplt0,spc7_cmplt0})
         12'h000 : spc7_ldstcond_cmplt0 =  4'h0;
         12'h001 : spc7_ldstcond_cmplt0 =  4'h1; // fp
         12'h002 : spc7_ldstcond_cmplt0 =  4'h2; // dwr
         12'h004 : spc7_ldstcond_cmplt0 =  4'h3; // pref
         12'h008 : spc7_ldstcond_cmplt0 =  4'h4; // ptlb
         12'h010 : spc7_ldstcond_cmplt0 =  4'h5; // va
         12'h020 : spc7_ldstcond_cmplt0 =  4'h6; // intr
         12'h040 : spc7_ldstcond_cmplt0 =  4'h7; // bsyn
         12'h080 : spc7_ldstcond_cmplt0 =  4'h8; // intld
         12'h100 : spc7_ldstcond_cmplt0 =  4'h9; // atm
         12'h200 : spc7_ldstcond_cmplt0 =  4'ha; // l2
         12'h400 : spc7_ldstcond_cmplt0 =  4'hb; // stxa
         12'h800 : spc7_ldstcond_cmplt0 =  4'hc; // err
         12'ha00 : spc7_ldstcond_cmplt0 =  4'hd; // err & l2
	 default:
	   begin
		spc7_ldstcond_cmplt0 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc7_dctl_stxa_cmplt1 = ((spc7_dctl_stxa_internal_d2 & spc7_dctl_thread1_w3) |
				       spc7_dctl_stxa_stall_wr_cmplt1_d1);
assign spc7_dctl_l2fill_cmplt1 = (((spc7_dctl_lsu_l2fill_vld & ~spc7_dctl_atomic_ld_squash_e &
					    ~spc7_dctl_lsu_ignore_fill)) & ~spc7_dctl_l2fill_fpld_e &
					  ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread1);

assign spc7_dctl_fillerr1 = spc7_dctl_l2_corr_error_e & spc7_dctl_dfill_thread1;
// Rolling in changes due to bug 3624
// assign spc7_dctl_atm_cmplt1 = (spc7_dctl_lsu_atm_st_cmplt_e & ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread1);

assign spc7_dctl_ldst_cond_cmplt1 = { spc7_dctl_stxa_cmplt1, spc7_dctl_l2fill_cmplt1,
					    spc7_dctl_atomic_ld_squash_e, spc7_dctl_intld_byp_cmplt[1],
					    spc7_dctl_bsync1_reset, spc7_dctl_lsu_intrpt_cmplt[1]
					     };

assign spc7_cmplt1 = { spc7_dctl_ldxa_illgl_va_cmplt_d1, spc7_dctl_pref_tlbmiss_cmplt_d2,
			      spc7_dctl_lsu_pcx_pref_issue, spc7_dctl_diag_wr_cmplt1, spc7_dctl_l2fill_fpld_e};


always @(spc7_cmplt1 or spc7_dctl_ldst_cond_cmplt1)
begin
       case ({spc7_dctl_fillerr1,spc7_dctl_ldst_cond_cmplt1,spc7_cmplt1})
         12'h000 : spc7_ldstcond_cmplt1 =  4'h0;
         12'h001 : spc7_ldstcond_cmplt1 =  4'h1; // fp
         12'h002 : spc7_ldstcond_cmplt1 =  4'h2; // dwr
         12'h004 : spc7_ldstcond_cmplt1 =  4'h3; // pref
         12'h008 : spc7_ldstcond_cmplt1 =  4'h4; // ptlb
         12'h010 : spc7_ldstcond_cmplt1 =  4'h5; // va
         12'h020 : spc7_ldstcond_cmplt1 =  4'h6; // intr
         12'h040 : spc7_ldstcond_cmplt1 =  4'h7; // bsyn
         12'h080 : spc7_ldstcond_cmplt1 =  4'h8; // intld
         12'h100 : spc7_ldstcond_cmplt1 =  4'h9; // atm
         12'h200 : spc7_ldstcond_cmplt1 =  4'ha; // l2
         12'h400 : spc7_ldstcond_cmplt1 =  4'hb; // stxa
         12'h800 : spc7_ldstcond_cmplt1 =  4'hc; // err
         12'ha00 : spc7_ldstcond_cmplt1 =  4'hd; // err & l2
	 default:
	   begin
		spc7_ldstcond_cmplt1 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc7_dctl_stxa_cmplt2 = ((spc7_dctl_stxa_internal_d2 & spc7_dctl_thread2_w3) |
				       spc7_dctl_stxa_stall_wr_cmplt2_d1);
assign spc7_dctl_l2fill_cmplt2 = (((spc7_dctl_lsu_l2fill_vld & ~spc7_dctl_atomic_ld_squash_e &
					    ~spc7_dctl_lsu_ignore_fill)) & ~spc7_dctl_l2fill_fpld_e &
					  ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread2);

assign spc7_dctl_fillerr2 = spc7_dctl_l2_corr_error_e & spc7_dctl_dfill_thread2;
// Rolling in changes due to bug 3624
// assign spc7_dctl_atm_cmplt2 = (spc7_dctl_lsu_atm_st_cmplt_e & ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread2);

assign spc7_dctl_ldst_cond_cmplt2 = { spc7_dctl_stxa_cmplt2, spc7_dctl_l2fill_cmplt2,
					    spc7_dctl_atomic_ld_squash_e, spc7_dctl_intld_byp_cmplt[2],
					    spc7_dctl_bsync2_reset, spc7_dctl_lsu_intrpt_cmplt[2]
					     };

assign spc7_cmplt2 = { spc7_dctl_ldxa_illgl_va_cmplt_d1, spc7_dctl_pref_tlbmiss_cmplt_d2,
			      spc7_dctl_lsu_pcx_pref_issue, spc7_dctl_diag_wr_cmplt2, spc7_dctl_l2fill_fpld_e};


always @(spc7_cmplt2 or spc7_dctl_ldst_cond_cmplt2)
begin
       case ({spc7_dctl_fillerr2,spc7_dctl_ldst_cond_cmplt2,spc7_cmplt2})
         12'h000 : spc7_ldstcond_cmplt2 =  4'h0;
         12'h001 : spc7_ldstcond_cmplt2 =  4'h1; // fp
         12'h002 : spc7_ldstcond_cmplt2 =  4'h2; // dwr
         12'h004 : spc7_ldstcond_cmplt2 =  4'h3; // pref
         12'h008 : spc7_ldstcond_cmplt2 =  4'h4; // ptlb
         12'h010 : spc7_ldstcond_cmplt2 =  4'h5; // va
         12'h020 : spc7_ldstcond_cmplt2 =  4'h6; // intr
         12'h040 : spc7_ldstcond_cmplt2 =  4'h7; // bsyn
         12'h080 : spc7_ldstcond_cmplt2 =  4'h8; // intld
         12'h100 : spc7_ldstcond_cmplt2 =  4'h9; // atm
         12'h200 : spc7_ldstcond_cmplt2 =  4'ha; // l2
         12'h400 : spc7_ldstcond_cmplt2 =  4'hb; // stxa
         12'h800 : spc7_ldstcond_cmplt2 =  4'hc; // err
         12'ha00 : spc7_ldstcond_cmplt2 =  4'hd; // err & l2
	 default:
	   begin
		spc7_ldstcond_cmplt2 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end


assign spc7_dctl_stxa_cmplt3 = ((spc7_dctl_stxa_internal_d2 & spc7_dctl_thread3_w3) |
				       spc7_dctl_stxa_stall_wr_cmplt3_d1);
assign spc7_dctl_l2fill_cmplt3 = (((spc7_dctl_lsu_l2fill_vld & ~spc7_dctl_atomic_ld_squash_e &
					    ~spc7_dctl_lsu_ignore_fill)) & ~spc7_dctl_l2fill_fpld_e &
					  ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread3);

assign spc7_dctl_fillerr3 = spc7_dctl_l2_corr_error_e & spc7_dctl_dfill_thread3;
// Rolling in changes due to bug 3624
// assign spc7_dctl_atm_cmplt3 = (spc7_dctl_lsu_atm_st_cmplt_e & ~spc7_dctl_fill_err_trap_e & spc7_dctl_dfill_thread3);

assign spc7_dctl_ldst_cond_cmplt3 = { spc7_dctl_stxa_cmplt3, spc7_dctl_l2fill_cmplt3,
					    spc7_dctl_atomic_ld_squash_e, spc7_dctl_intld_byp_cmplt[3],
					    spc7_dctl_bsync3_reset, spc7_dctl_lsu_intrpt_cmplt[3]
					     };

assign spc7_cmplt3 = { spc7_dctl_ldxa_illgl_va_cmplt_d1, spc7_dctl_pref_tlbmiss_cmplt_d2,
			      spc7_dctl_lsu_pcx_pref_issue, spc7_dctl_diag_wr_cmplt3, spc7_dctl_l2fill_fpld_e};


always @(spc7_cmplt3 or spc7_dctl_ldst_cond_cmplt3)
begin
       case ({spc7_dctl_fillerr3,spc7_dctl_ldst_cond_cmplt3,spc7_cmplt3})
         12'h000 : spc7_ldstcond_cmplt3 =  4'h0;
         12'h001 : spc7_ldstcond_cmplt3 =  4'h1; // fp
         12'h002 : spc7_ldstcond_cmplt3 =  4'h2; // dwr
         12'h004 : spc7_ldstcond_cmplt3 =  4'h3; // pref
         12'h008 : spc7_ldstcond_cmplt3 =  4'h4; // ptlb
         12'h010 : spc7_ldstcond_cmplt3 =  4'h5; // va
         12'h020 : spc7_ldstcond_cmplt3 =  4'h6; // intr
         12'h040 : spc7_ldstcond_cmplt3 =  4'h7; // bsyn
         12'h080 : spc7_ldstcond_cmplt3 =  4'h8; // intld
         12'h100 : spc7_ldstcond_cmplt3 =  4'h9; // atm
         12'h200 : spc7_ldstcond_cmplt3 =  4'ha; // l2
         12'h400 : spc7_ldstcond_cmplt3 =  4'hb; // stxa
         12'h800 : spc7_ldstcond_cmplt3 =  4'hc; // err
         12'ha00 : spc7_ldstcond_cmplt3 =  4'hd; // err & l2
	 default:
	   begin
		spc7_ldstcond_cmplt3 =  4'hd;
		// Got filter out fp ld and err and check one hot
	   end
       endcase
end



always @(spc7_ldstcond_cmplt0 or spc7_ldstcond_cmplt1 or spc7_ldstcond_cmplt2
	 or spc7_ldstcond_cmplt3 or spc7_dctl_lsu_ifu_ldst_cmplt
	 or spc7_dctl_late_cmplt0 or spc7_dctl_late_cmplt1 or spc7_dctl_late_cmplt2 or spc7_dctl_late_cmplt3)
begin
       case (spc7_dctl_lsu_ifu_ldst_cmplt)
         4'b0000 : spc7_ldstcond_cmplt_d = 4'h0;
         4'b0001 : spc7_ldstcond_cmplt_d = spc7_dctl_late_cmplt0 ? spc7_ldstcond_cmplt0_d : spc7_ldstcond_cmplt0;
         4'b0010 : spc7_ldstcond_cmplt_d = spc7_dctl_late_cmplt1 ? spc7_ldstcond_cmplt1_d : spc7_ldstcond_cmplt1;
         4'b0100 : spc7_ldstcond_cmplt_d = spc7_dctl_late_cmplt2 ? spc7_ldstcond_cmplt2_d : spc7_ldstcond_cmplt2;
         4'b1000 : spc7_ldstcond_cmplt_d = spc7_dctl_late_cmplt3 ? spc7_ldstcond_cmplt3_d : spc7_ldstcond_cmplt3;
         4'b0011 : spc7_ldstcond_cmplt_d = 4'he;
         4'b0101 : spc7_ldstcond_cmplt_d = 4'he;
         4'b1001 : spc7_ldstcond_cmplt_d = 4'he;
         4'b0110 : spc7_ldstcond_cmplt_d = 4'he;
         4'b1010 : spc7_ldstcond_cmplt_d = 4'he;
         4'b1100 : spc7_ldstcond_cmplt_d = 4'he;
	 default:
	  	begin
			spc7_ldstcond_cmplt_d =  4'hf;
		end
       endcase
end


// st returns ooo
assign spc7_st_ooo_ret = { spc7_st0_lt_1, spc7_st0_lt_2, spc7_st0_lt_3,
			      spc7_st1_lt_0, spc7_st1_lt_2, spc7_st1_lt_3,
			      spc7_st2_lt_0, spc7_st2_lt_1, spc7_st2_lt_3,
			      spc7_st3_lt_0, spc7_st3_lt_1, spc7_st3_lt_2};

always @(posedge clk)
begin
    if(~spc7_st0_unfilled || ~rst_l)
      spc7_st0_unfilled_d <= 1'b0;
    else
      spc7_st0_unfilled_d <= spc7_st0_unfilled;

    if(~rst_l)
      spc7_ldstcond_cmplt0_d <= 4'h0;
    else
      spc7_ldstcond_cmplt0_d <= spc7_ldstcond_cmplt0;

    if(~spc7_ld0_pkt_vld_unmasked || ~rst_l)
      spc7_ld0_pkt_vld_unmasked_d <= 1'b0;
    else
      spc7_ld0_pkt_vld_unmasked_d <= spc7_ld0_pkt_vld_unmasked;

    if(~rst_l)
      spc7_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    else if(spc7_qctl1_ld_sec_hit_thrd0 && spc7_qctl1_ld0_inst_vld_g)
      spc7_qctl1_ld_sec_hit_thrd0_w2 <= 1'b1;
    else
      spc7_qctl1_ld_sec_hit_thrd0_w2 <= 1'b0;
    if(~spc7_st1_unfilled || ~rst_l)
      spc7_st1_unfilled_d <= 1'b0;
    else
      spc7_st1_unfilled_d <= spc7_st1_unfilled;

    if(~rst_l)
      spc7_ldstcond_cmplt1_d <= 4'h0;
    else
      spc7_ldstcond_cmplt1_d <= spc7_ldstcond_cmplt1;

    if(~spc7_ld1_pkt_vld_unmasked || ~rst_l)
      spc7_ld1_pkt_vld_unmasked_d <= 1'b0;
    else
      spc7_ld1_pkt_vld_unmasked_d <= spc7_ld1_pkt_vld_unmasked;

    if(~rst_l)
      spc7_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    else if(spc7_qctl1_ld_sec_hit_thrd1 && spc7_qctl1_ld1_inst_vld_g)
      spc7_qctl1_ld_sec_hit_thrd1_w2 <= 1'b1;
    else
      spc7_qctl1_ld_sec_hit_thrd1_w2 <= 1'b0;
    if(~spc7_st2_unfilled || ~rst_l)
      spc7_st2_unfilled_d <= 1'b0;
    else
      spc7_st2_unfilled_d <= spc7_st2_unfilled;

    if(~rst_l)
      spc7_ldstcond_cmplt2_d <= 4'h0;
    else
      spc7_ldstcond_cmplt2_d <= spc7_ldstcond_cmplt2;

    if(~spc7_ld2_pkt_vld_unmasked || ~rst_l)
      spc7_ld2_pkt_vld_unmasked_d <= 1'b0;
    else
      spc7_ld2_pkt_vld_unmasked_d <= spc7_ld2_pkt_vld_unmasked;

    if(~rst_l)
      spc7_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    else if(spc7_qctl1_ld_sec_hit_thrd2 && spc7_qctl1_ld2_inst_vld_g)
      spc7_qctl1_ld_sec_hit_thrd2_w2 <= 1'b1;
    else
      spc7_qctl1_ld_sec_hit_thrd2_w2 <= 1'b0;
    if(~spc7_st3_unfilled || ~rst_l)
      spc7_st3_unfilled_d <= 1'b0;
    else
      spc7_st3_unfilled_d <= spc7_st3_unfilled;

    if(~rst_l)
      spc7_ldstcond_cmplt3_d <= 4'h0;
    else
      spc7_ldstcond_cmplt3_d <= spc7_ldstcond_cmplt3;

    if(~spc7_ld3_pkt_vld_unmasked || ~rst_l)
      spc7_ld3_pkt_vld_unmasked_d <= 1'b0;
    else
      spc7_ld3_pkt_vld_unmasked_d <= spc7_ld3_pkt_vld_unmasked;

    if(~rst_l)
      spc7_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
    else if(spc7_qctl1_ld_sec_hit_thrd3 && spc7_qctl1_ld3_inst_vld_g)
      spc7_qctl1_ld_sec_hit_thrd3_w2 <= 1'b1;
    else
      spc7_qctl1_ld_sec_hit_thrd3_w2 <= 1'b0;
end

always @(posedge clk)
begin
    if( ((|spc7_stb_state_ced0) && (|spc7_stb_state_rst0)) || ~rst_l)
      spc7_st0_unfilled <= 1'b0;
    else if( ((|spc7_stb_state_ced0) && ~(|spc7_stb_state_rst0)))
      spc7_st0_unfilled <= 1'b1;
    else
      spc7_st0_unfilled <= spc7_st0_unfilled;
    if( ((|spc7_stb_state_ced1) && (|spc7_stb_state_rst1)) || ~rst_l)
      spc7_st1_unfilled <= 1'b0;
    else if( ((|spc7_stb_state_ced1) && ~(|spc7_stb_state_rst1)))
      spc7_st1_unfilled <= 1'b1;
    else
      spc7_st1_unfilled <= spc7_st1_unfilled;
    if( ((|spc7_stb_state_ced2) && (|spc7_stb_state_rst2)) || ~rst_l)
      spc7_st2_unfilled <= 1'b0;
    else if( ((|spc7_stb_state_ced2) && ~(|spc7_stb_state_rst2)))
      spc7_st2_unfilled <= 1'b1;
    else
      spc7_st2_unfilled <= spc7_st2_unfilled;
    if( ((|spc7_stb_state_ced3) && (|spc7_stb_state_rst3)) || ~rst_l)
      spc7_st3_unfilled <= 1'b0;
    else if( ((|spc7_stb_state_ced3) && ~(|spc7_stb_state_rst3)))
      spc7_st3_unfilled <= 1'b1;
    else
      spc7_st3_unfilled <= spc7_st3_unfilled;
end

always @(posedge clk)
begin
    if((~spc7_st0_unfilled && spc7_st0_unfilled_d)|| ~rst_l)
      begin
        spc7_st0_unf_cntr <= 9'h000;
      end
    else if(spc7_st0_unfilled)
      begin
        spc7_st0_unf_cntr <= spc7_st0_unf_cntr + 1;
      end
    else
      begin
        spc7_st0_unf_cntr <= spc7_st0_unf_cntr;
      end
    if((~spc7_st1_unfilled && spc7_st1_unfilled_d)|| ~rst_l)
      begin
        spc7_st1_unf_cntr <= 9'h000;
      end
    else if(spc7_st1_unfilled)
      begin
        spc7_st1_unf_cntr <= spc7_st1_unf_cntr + 1;
      end
    else
      begin
        spc7_st1_unf_cntr <= spc7_st1_unf_cntr;
      end
    if((~spc7_st2_unfilled && spc7_st2_unfilled_d)|| ~rst_l)
      begin
        spc7_st2_unf_cntr <= 9'h000;
      end
    else if(spc7_st2_unfilled)
      begin
        spc7_st2_unf_cntr <= spc7_st2_unf_cntr + 1;
      end
    else
      begin
        spc7_st2_unf_cntr <= spc7_st2_unf_cntr;
      end
    if((~spc7_st3_unfilled && spc7_st3_unfilled_d)|| ~rst_l)
      begin
        spc7_st3_unf_cntr <= 9'h000;
      end
    else if(spc7_st3_unfilled)
      begin
        spc7_st3_unf_cntr <= spc7_st3_unf_cntr + 1;
      end
    else
      begin
        spc7_st3_unf_cntr <= spc7_st3_unf_cntr;
      end
end

always @(spc7_st0_unfilled or spc7_st1_unfilled or spc7_st2_unfilled or spc7_st3_unfilled
	 or spc7_st0_unfilled_d or spc7_st1_unfilled_d or spc7_st2_unfilled_d or spc7_st3_unfilled_d)
begin
if(~spc7_st0_unfilled && spc7_st0_unfilled_d && spc7_st1_unfilled)
 spc7_st0_lt_1 <= (spc7_st1_unf_cntr > spc7_st0_unf_cntr);
else
 spc7_st0_lt_1 <= 1'b0;
if(~spc7_st0_unfilled && spc7_st0_unfilled_d && spc7_st2_unfilled)
 spc7_st0_lt_2 <= (spc7_st2_unf_cntr > spc7_st0_unf_cntr);
else
 spc7_st0_lt_2 <= 1'b0;
if(~spc7_st0_unfilled && spc7_st0_unfilled_d && spc7_st3_unfilled)
 spc7_st0_lt_3 <= (spc7_st3_unf_cntr > spc7_st0_unf_cntr);
else
 spc7_st0_lt_3 <= 1'b0;
// get thr 1
if(~spc7_st1_unfilled && spc7_st1_unfilled_d && spc7_st0_unfilled)
 spc7_st1_lt_0 <= (spc7_st0_unf_cntr > spc7_st1_unf_cntr);
else
 spc7_st1_lt_0 <= 1'b0;
if(~spc7_st1_unfilled && spc7_st1_unfilled_d && spc7_st2_unfilled)
 spc7_st1_lt_2 <= (spc7_st2_unf_cntr > spc7_st1_unf_cntr);
else
 spc7_st1_lt_2 <= 1'b0;
if(~spc7_st1_unfilled && spc7_st1_unfilled_d && spc7_st3_unfilled)
 spc7_st1_lt_3 <= (spc7_st3_unf_cntr > spc7_st1_unf_cntr);
else
 spc7_st1_lt_3 <= 1'b0;
// get thr 2
if(~spc7_st2_unfilled && spc7_st2_unfilled_d && spc7_st0_unfilled)
 spc7_st2_lt_0 <= (spc7_st0_unf_cntr > spc7_st2_unf_cntr);
else
 spc7_st2_lt_0 <= 1'b0;
if(~spc7_st2_unfilled && spc7_st2_unfilled_d && spc7_st1_unfilled)
 spc7_st2_lt_1 <= (spc7_st1_unf_cntr > spc7_st2_unf_cntr);
else
 spc7_st2_lt_1 <= 1'b0;
if(~spc7_st2_unfilled && spc7_st2_unfilled_d && spc7_st3_unfilled)
 spc7_st2_lt_3 <= (spc7_st3_unf_cntr > spc7_st2_unf_cntr);
else
 spc7_st2_lt_3 <= 1'b0;
// get thr 3
if(~spc7_st3_unfilled && spc7_st3_unfilled_d && spc7_st0_unfilled)
 spc7_st3_lt_0 <= (spc7_st0_unf_cntr > spc7_st3_unf_cntr);
else
 spc7_st3_lt_0 <= 1'b0;
if(~spc7_st3_unfilled && spc7_st3_unfilled_d && spc7_st1_unfilled)
 spc7_st3_lt_1 <= (spc7_st1_unf_cntr > spc7_st3_unf_cntr);
else
 spc7_st3_lt_1 <= 1'b0;
if(~spc7_st3_unfilled && spc7_st3_unfilled_d && spc7_st2_unfilled)
 spc7_st3_lt_2 <= (spc7_st2_unf_cntr > spc7_st3_unf_cntr);
else
 spc7_st3_lt_2 <= 1'b0;				      //
end
// load returns ooo
assign spc7_ld_ooo_ret = { spc7_ld0_lt_1, spc7_ld0_lt_2, spc7_ld0_lt_3,
			      spc7_ld1_lt_0, spc7_ld1_lt_2, spc7_ld1_lt_3,
			      spc7_ld2_lt_0, spc7_ld2_lt_1, spc7_ld2_lt_3,
			      spc7_ld3_lt_0, spc7_ld3_lt_1, spc7_ld3_lt_2};
always @(posedge clk)
begin
    if((~spc7_ld0_unfilled && spc7_ld0_unfilled_d)|| ~rst_l)
      begin
        spc7_ld0_unf_cntr <= 9'h000;
      end
    else if(spc7_ld0_unfilled)
      begin
        spc7_ld0_unf_cntr <= spc7_ld0_unf_cntr + 1;
      end
    else
      begin
        spc7_ld0_unf_cntr <= spc7_ld0_unf_cntr;
      end
    if((~spc7_ld1_unfilled && spc7_ld1_unfilled_d)|| ~rst_l)
      begin
        spc7_ld1_unf_cntr <= 9'h000;
      end
    else if(spc7_ld1_unfilled)
      begin
        spc7_ld1_unf_cntr <= spc7_ld1_unf_cntr + 1;
      end
    else
      begin
        spc7_ld1_unf_cntr <= spc7_ld1_unf_cntr;
      end
    if((~spc7_ld2_unfilled && spc7_ld2_unfilled_d)|| ~rst_l)
      begin
        spc7_ld2_unf_cntr <= 9'h000;
      end
    else if(spc7_ld2_unfilled)
      begin
        spc7_ld2_unf_cntr <= spc7_ld2_unf_cntr + 1;
      end
    else
      begin
        spc7_ld2_unf_cntr <= spc7_ld2_unf_cntr;
      end
    if((~spc7_ld3_unfilled && spc7_ld3_unfilled_d)|| ~rst_l)
      begin
        spc7_ld3_unf_cntr <= 9'h000;
      end
    else if(spc7_ld3_unfilled)
      begin
        spc7_ld3_unf_cntr <= spc7_ld3_unf_cntr + 1;
      end
    else
      begin
        spc7_ld3_unf_cntr <= spc7_ld3_unf_cntr;
      end
end

always @(spc7_ld0_unfilled or spc7_ld1_unfilled or spc7_ld2_unfilled or spc7_ld3_unfilled
	 or spc7_ld0_unfilled_d or spc7_ld1_unfilled_d or spc7_ld2_unfilled_d or spc7_ld3_unfilled_d)
begin
if(~spc7_ld0_unfilled && spc7_ld0_unfilled_d && spc7_ld1_unfilled)
 spc7_ld0_lt_1 <= (spc7_ld1_unf_cntr > spc7_ld0_unf_cntr);
else
 spc7_ld0_lt_1 <= 1'b0;
if(~spc7_ld0_unfilled && spc7_ld0_unfilled_d && spc7_ld2_unfilled)
 spc7_ld0_lt_2 <= (spc7_ld2_unf_cntr > spc7_ld0_unf_cntr);
else
 spc7_ld0_lt_2 <= 1'b0;
if(~spc7_ld0_unfilled && spc7_ld0_unfilled_d && spc7_ld3_unfilled)
 spc7_ld0_lt_3 <= (spc7_ld3_unf_cntr > spc7_ld0_unf_cntr);
else
 spc7_ld0_lt_3 <= 1'b0;
// get thr 1
if(~spc7_ld1_unfilled && spc7_ld1_unfilled_d && spc7_ld0_unfilled)
 spc7_ld1_lt_0 <= (spc7_ld0_unf_cntr > spc7_ld1_unf_cntr);
else
 spc7_ld1_lt_0 <= 1'b0;
if(~spc7_ld1_unfilled && spc7_ld1_unfilled_d && spc7_ld2_unfilled)
 spc7_ld1_lt_2 <= (spc7_ld2_unf_cntr > spc7_ld1_unf_cntr);
else
 spc7_ld1_lt_2 <= 1'b0;
if(~spc7_ld1_unfilled && spc7_ld1_unfilled_d && spc7_ld3_unfilled)
 spc7_ld1_lt_3 <= (spc7_ld3_unf_cntr > spc7_ld1_unf_cntr);
else
 spc7_ld1_lt_3 <= 1'b0;
// get thr 2
if(~spc7_ld2_unfilled && spc7_ld2_unfilled_d && spc7_ld0_unfilled)
 spc7_ld2_lt_0 <= (spc7_ld0_unf_cntr > spc7_ld2_unf_cntr);
else
 spc7_ld2_lt_0 <= 1'b0;
if(~spc7_ld2_unfilled && spc7_ld2_unfilled_d && spc7_ld1_unfilled)
 spc7_ld2_lt_1 <= (spc7_ld1_unf_cntr > spc7_ld2_unf_cntr);
else
 spc7_ld2_lt_1 <= 1'b0;
if(~spc7_ld2_unfilled && spc7_ld2_unfilled_d && spc7_ld3_unfilled)
 spc7_ld2_lt_3 <= (spc7_ld3_unf_cntr > spc7_ld2_unf_cntr);
else
 spc7_ld2_lt_3 <= 1'b0;
// get thr 3
if(~spc7_ld3_unfilled && spc7_ld3_unfilled_d && spc7_ld0_unfilled)
 spc7_ld3_lt_0 <= (spc7_ld0_unf_cntr > spc7_ld3_unf_cntr);
else
 spc7_ld3_lt_0 <= 1'b0;
if(~spc7_ld3_unfilled && spc7_ld3_unfilled_d && spc7_ld1_unfilled)
 spc7_ld3_lt_1 <= (spc7_ld1_unf_cntr > spc7_ld3_unf_cntr);
else
 spc7_ld3_lt_1 <= 1'b0;
if(~spc7_ld3_unfilled && spc7_ld3_unfilled_d && spc7_ld2_unfilled)
 spc7_ld3_lt_2 <= (spc7_ld2_unf_cntr > spc7_ld3_unf_cntr);
else
 spc7_ld3_lt_2 <= 1'b0;				      //
end

// bld checks note it has stb_cam hit, ldst_dbl and asi terms removed from the dctl hit equation
assign spc7_dctl_bld_hit =
((|spc7_dctl_lsu_way_hit[3:0])  & spc7_dctl_dcache_enable_g &
  ~spc7_dctl_ldxa_internal & ~spc7_dctl_dcache_rd_parity_error & ~spc7_dctl_dtag_perror_g &
  ~spc7_dctl_endian_mispred_g &
  ~spc7_dctl_atomic_g & ~spc7_dctl_ncache_asild_rq_g) & ~spc7_dctl_tte_data_perror_unc &
  spc7_dctl_ld_inst_vld_g & spc7_qctl1_bld_g ;

assign spc7_dctl_bld_stb_hit = spc7_dctl_bld_hit & spc7_dctl_stb_cam_hit;

always @(posedge clk)
begin
    if(~rst_l)
     begin
      spc7_bld0_full_d <= 2'b00;
      spc7_ld0_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc7_bld0_full_d <= spc7_qctl1_bld_cnt;
      spc7_ld0_unfilled_d <= spc7_ld0_unfilled;
     end
    if(~rst_l)
     begin
      spc7_bld1_full_d <= 2'b00;
      spc7_ld1_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc7_bld1_full_d <= spc7_qctl1_bld_cnt;
      spc7_ld1_unfilled_d <= spc7_ld1_unfilled;
     end
    if(~rst_l)
     begin
      spc7_bld2_full_d <= 2'b00;
      spc7_ld2_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc7_bld2_full_d <= spc7_qctl1_bld_cnt;
      spc7_ld2_unfilled_d <= spc7_ld2_unfilled;
     end
    if(~rst_l)
     begin
      spc7_bld3_full_d <= 2'b00;
      spc7_ld3_unfilled_d <= 4'b0000;
     end
    else
     begin
      spc7_bld3_full_d <= spc7_qctl1_bld_cnt;
      spc7_ld3_unfilled_d <= spc7_ld3_unfilled;
     end
end
always @(spc7_bld0_full_d or spc7_qctl1_bld_cnt)
begin
 if( (spc7_bld0_full_d != spc7_qctl1_bld_cnt) && (spc7_bld0_full_d == 2'd0))
    spc7_bld0_full_capture <= 1'b1;
 else
    spc7_bld0_full_capture <= 1'b0;
end
always @(spc7_bld1_full_d or spc7_qctl1_bld_cnt)
begin
 if( (spc7_bld1_full_d != spc7_qctl1_bld_cnt) && (spc7_bld1_full_d == 2'd1))
    spc7_bld1_full_capture <= 1'b1;
 else
    spc7_bld1_full_capture <= 1'b0;
end
always @(spc7_bld2_full_d or spc7_qctl1_bld_cnt)
begin
 if( (spc7_bld2_full_d != spc7_qctl1_bld_cnt) && (spc7_bld2_full_d == 2'd2))
    spc7_bld2_full_capture <= 1'b1;
 else
    spc7_bld2_full_capture <= 1'b0;
end
always @(spc7_bld3_full_d or spc7_qctl1_bld_cnt)
begin
 if( (spc7_bld3_full_d != spc7_qctl1_bld_cnt) && (spc7_bld3_full_d == 2'd3))
    spc7_bld3_full_capture <= 1'b1;
 else
    spc7_bld3_full_capture <= 1'b0;
end
always @(posedge clk)
begin
    if( ( (spc7_qctl1_bld_cnt != 2'b00) && (spc7_bld0_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc7_bld0_full_cntr <= 9'h000;
      end
    else if(spc7_qctl1_bld_g && (spc7_qctl1_bld_cnt == 2'b00))
      begin
        spc7_bld0_full_cntr <= spc7_bld0_full_cntr + 1;
      end
    else if( (spc7_qctl1_bld_cnt == 2'b00) && (spc7_bld0_full_cntr != 9'h000))
      begin
        spc7_bld0_full_cntr <= spc7_bld0_full_cntr + 1;
      end
    else
      begin
        spc7_bld0_full_cntr <= spc7_bld0_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc7_qctl1_bld_cnt != 2'b01) && (spc7_bld1_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc7_bld1_full_cntr <= 9'h000;
      end
    else if(spc7_qctl1_bld_cnt == 2'b01)
      begin
        spc7_bld1_full_cntr <= spc7_bld1_full_cntr + 1;
      end
    else if( (spc7_qctl1_bld_cnt == 2'b01) && (spc7_bld1_full_cntr != 9'h000))
      begin
        spc7_bld1_full_cntr <= spc7_bld1_full_cntr + 1;
      end
    else
      begin
        spc7_bld1_full_cntr <= spc7_bld1_full_cntr;
      end
end


always @(posedge clk)
begin
    if( ( (spc7_qctl1_bld_cnt != 2'b10) && (spc7_bld2_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc7_bld2_full_cntr <= 9'h000;
      end
    else if(spc7_qctl1_bld_cnt == 2'b10)
      begin
        spc7_bld2_full_cntr <= spc7_bld2_full_cntr + 1;
      end
    else if( (spc7_qctl1_bld_cnt == 2'b10) && (spc7_bld2_full_cntr != 9'h000))
      begin
        spc7_bld2_full_cntr <= spc7_bld2_full_cntr + 1;
      end
    else
      begin
        spc7_bld2_full_cntr <= spc7_bld2_full_cntr;
      end
end

always @(posedge clk)
begin
    if( ( (spc7_qctl1_bld_cnt != 2'b11) && (spc7_bld3_full_cntr != 9'h000))   || ~rst_l)
      begin
        spc7_bld3_full_cntr <= 9'h000;
      end
    else if(spc7_qctl1_bld_cnt == 2'b11)
      begin
        spc7_bld3_full_cntr <= spc7_bld3_full_cntr + 1;
      end
    else if( (spc7_qctl1_bld_cnt == 2'b11) && (spc7_bld3_full_cntr != 9'h000))
      begin
        spc7_bld3_full_cntr <= spc7_bld3_full_cntr + 1;
      end
    else
      begin
        spc7_bld3_full_cntr <= spc7_bld3_full_cntr;
      end
end

// Capture atomic address until it's retired
// Used for comparing colliding address
always @(posedge clk)
begin
    if( ( ~(|spc7_stb_state_vld0) && ~spc7_atomic_g) || ~rst_l)
      begin
        spc7_stb_atm_addr0 <= 40'h0000000000;
      end
    else if(spc7_atomic_g && (spc7_atm_type0 != 8'h00) && spc7_wptr_vld)
      begin
        spc7_stb_atm_addr0 <= {spc7_wdata_ramc[44:9],spc7_wdata_ramd[67:64]};
      end
    else
      begin
        spc7_stb_atm_addr0 <= spc7_stb_atm_addr0;
      end
    if( ( ~(|spc7_stb_state_vld1) && ~spc7_atomic_g) || ~rst_l)
      begin
        spc7_stb_atm_addr1 <= 40'h0000000000;
      end
    else if(spc7_atomic_g && (spc7_atm_type1 != 8'h00) && spc7_wptr_vld)
      begin
        spc7_stb_atm_addr1 <= {spc7_wdata_ramc[44:9],spc7_wdata_ramd[67:64]};
      end
    else
      begin
        spc7_stb_atm_addr1 <= spc7_stb_atm_addr1;
      end
    if( ( ~(|spc7_stb_state_vld2) && ~spc7_atomic_g) || ~rst_l)
      begin
        spc7_stb_atm_addr2 <= 40'h0000000000;
      end
    else if(spc7_atomic_g && (spc7_atm_type2 != 8'h00) && spc7_wptr_vld)
      begin
        spc7_stb_atm_addr2 <= {spc7_wdata_ramc[44:9],spc7_wdata_ramd[67:64]};
      end
    else
      begin
        spc7_stb_atm_addr2 <= spc7_stb_atm_addr2;
      end
    if( ( ~(|spc7_stb_state_vld3) && ~spc7_atomic_g) || ~rst_l)
      begin
        spc7_stb_atm_addr3 <= 40'h0000000000;
      end
    else if(spc7_atomic_g && (spc7_atm_type3 != 8'h00) && spc7_wptr_vld)
      begin
        spc7_stb_atm_addr3 <= {spc7_wdata_ramc[44:9],spc7_wdata_ramd[67:64]};
      end
    else
      begin
        spc7_stb_atm_addr3 <= spc7_stb_atm_addr3;
      end
end

 assign spc7_dfq_full = (spc7_dfq_vld_entries >= 3'd4);


assign spc7_dfq_full1 = (spc7_dfq_vld_entries >= (3'd4 + 1));

always @(spc7_dfq_full_d1 or spc7_dfq_full1)
begin
  if (spc7_dfq_full_d1 && ~spc7_dfq_full1)
    spc7_dfq_full_capture1 <= 1'b1;
  else
    spc7_dfq_full_capture1 <= 1'b0;
end

assign spc7_dfq_full2 = (spc7_dfq_vld_entries >= (3'd4 + 2));

always @(spc7_dfq_full_d2 or spc7_dfq_full2)
begin
  if (spc7_dfq_full_d2 && ~spc7_dfq_full2)
    spc7_dfq_full_capture2 <= 1'b1;
  else
    spc7_dfq_full_capture2 <= 1'b0;
end

assign spc7_dfq_full3 = (spc7_dfq_vld_entries >= (3'd4 + 3));

always @(spc7_dfq_full_d3 or spc7_dfq_full3)
begin
  if (spc7_dfq_full_d3 && ~spc7_dfq_full3)
    spc7_dfq_full_capture3 <= 1'b1;
  else
    spc7_dfq_full_capture3 <= 1'b0;
end

assign spc7_dfq_full4 = (spc7_dfq_vld_entries >= (3'd4 + 4));

always @(spc7_dfq_full_d4 or spc7_dfq_full4)
begin
  if (spc7_dfq_full_d4 && ~spc7_dfq_full4)
    spc7_dfq_full_capture4 <= 1'b1;
  else
    spc7_dfq_full_capture4 <= 1'b0;
end

assign spc7_dfq_full5 = (spc7_dfq_vld_entries >= (3'd4 + 5));

always @(spc7_dfq_full_d5 or spc7_dfq_full5)
begin
  if (spc7_dfq_full_d5 && ~spc7_dfq_full5)
    spc7_dfq_full_capture5 <= 1'b1;
  else
    spc7_dfq_full_capture5 <= 1'b0;
end

assign spc7_dfq_full6 = (spc7_dfq_vld_entries >= (3'd4 + 6));

always @(spc7_dfq_full_d6 or spc7_dfq_full6)
begin
  if (spc7_dfq_full_d6 && ~spc7_dfq_full6)
    spc7_dfq_full_capture6 <= 1'b1;
  else
    spc7_dfq_full_capture6 <= 1'b0;
end

assign spc7_dfq_full7 = (spc7_dfq_vld_entries >= (3'd4 + 7));

always @(spc7_dfq_full_d7 or spc7_dfq_full7)
begin
  if (spc7_dfq_full_d7 && ~spc7_dfq_full7)
    spc7_dfq_full_capture7 <= 1'b1;
  else
    spc7_dfq_full_capture7 <= 1'b0;
end

always @(spc7_mbar_vld_d0 or spc7_mbar_vld0)
begin
  if (spc7_mbar_vld_d0 && ~spc7_mbar_vld0)
    spc7_mbar_vld_capture0 <= 1'b1;
  else
    spc7_mbar_vld_capture0 <= 1'b0;
end
always @(spc7_mbar_vld_d1 or spc7_mbar_vld1)
begin
  if (spc7_mbar_vld_d1 && ~spc7_mbar_vld1)
    spc7_mbar_vld_capture1 <= 1'b1;
  else
    spc7_mbar_vld_capture1 <= 1'b0;
end
always @(spc7_mbar_vld_d2 or spc7_mbar_vld2)
begin
  if (spc7_mbar_vld_d2 && ~spc7_mbar_vld2)
    spc7_mbar_vld_capture2 <= 1'b1;
  else
    spc7_mbar_vld_capture2 <= 1'b0;
end
always @(spc7_mbar_vld_d3 or spc7_mbar_vld3)
begin
  if (spc7_mbar_vld_d3 && ~spc7_mbar_vld3)
    spc7_mbar_vld_capture3 <= 1'b1;
  else
    spc7_mbar_vld_capture3 <= 1'b0;
end



always @(posedge clk)
begin
    if( ( ~spc7_dfq_full1 && (spc7_dfq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr1 <= 9'h000;
       spc7_dfq_full_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr1);
      end
    else if( spc7_dfq_full1)
      begin
       spc7_dfq_full_cntr1 <= spc7_dfq_full_cntr1 + 1;
       spc7_dfq_full_d1 <= spc7_dfq_full1;
      end
    else
      begin
       spc7_dfq_full_cntr1 <= spc7_dfq_full_cntr1;
       spc7_dfq_full_d1 <= spc7_dfq_full1;
      end
    if( ( ~spc7_dfq_full2 && (spc7_dfq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr2 <= 9'h000;
       spc7_dfq_full_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr2);
      end
    else if( spc7_dfq_full2)
      begin
       spc7_dfq_full_cntr2 <= spc7_dfq_full_cntr2 + 1;
       spc7_dfq_full_d2 <= spc7_dfq_full2;
      end
    else
      begin
       spc7_dfq_full_cntr2 <= spc7_dfq_full_cntr2;
       spc7_dfq_full_d2 <= spc7_dfq_full2;
      end
    if( ( ~spc7_dfq_full3 && (spc7_dfq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr3 <= 9'h000;
       spc7_dfq_full_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr3);
      end
    else if( spc7_dfq_full3)
      begin
       spc7_dfq_full_cntr3 <= spc7_dfq_full_cntr3 + 1;
       spc7_dfq_full_d3 <= spc7_dfq_full3;
      end
    else
      begin
       spc7_dfq_full_cntr3 <= spc7_dfq_full_cntr3;
       spc7_dfq_full_d3 <= spc7_dfq_full3;
      end
    if( ( ~spc7_dfq_full4 && (spc7_dfq_full_cntr4 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr4 <= 9'h000;
       spc7_dfq_full_d4 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr4);
      end
    else if( spc7_dfq_full4)
      begin
       spc7_dfq_full_cntr4 <= spc7_dfq_full_cntr4 + 1;
       spc7_dfq_full_d4 <= spc7_dfq_full4;
      end
    else
      begin
       spc7_dfq_full_cntr4 <= spc7_dfq_full_cntr4;
       spc7_dfq_full_d4 <= spc7_dfq_full4;
      end
    if( ( ~spc7_dfq_full5 && (spc7_dfq_full_cntr5 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr5 <= 9'h000;
       spc7_dfq_full_d5 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr5);
      end
    else if( spc7_dfq_full5)
      begin
       spc7_dfq_full_cntr5 <= spc7_dfq_full_cntr5 + 1;
       spc7_dfq_full_d5 <= spc7_dfq_full5;
      end
    else
      begin
       spc7_dfq_full_cntr5 <= spc7_dfq_full_cntr5;
       spc7_dfq_full_d5 <= spc7_dfq_full5;
      end
    if( ( ~spc7_dfq_full6 && (spc7_dfq_full_cntr6 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr6 <= 9'h000;
       spc7_dfq_full_d6 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr6);
      end
    else if( spc7_dfq_full6)
      begin
       spc7_dfq_full_cntr6 <= spc7_dfq_full_cntr6 + 1;
       spc7_dfq_full_d6 <= spc7_dfq_full6;
      end
    else
      begin
       spc7_dfq_full_cntr6 <= spc7_dfq_full_cntr6;
       spc7_dfq_full_d6 <= spc7_dfq_full6;
      end
    if( ( ~spc7_dfq_full7 && (spc7_dfq_full_cntr7 != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr7 <= 9'h000;
       spc7_dfq_full_d7 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr7);
      end
    else if( spc7_dfq_full7)
      begin
       spc7_dfq_full_cntr7 <= spc7_dfq_full_cntr7 + 1;
       spc7_dfq_full_d7 <= spc7_dfq_full7;
      end
    else
      begin
       spc7_dfq_full_cntr7 <= spc7_dfq_full_cntr7;
       spc7_dfq_full_d7 <= spc7_dfq_full7;
      end
end // always @ (posedge clk)

//Capture b4 atomic is sent to pcx
always @(spc7_intrpt0_cmplt or spc7_atm_cntr0 or spc7_stb_state_ced0)
begin
  if (spc7_intrpt0_cmplt && (spc7_atm_cntr0 != 9'h000) && ~(|spc7_stb_state_ced0))
    spc7_atm_intrpt_b4capture0 <= 1'b1;
  else
    spc7_atm_intrpt_b4capture0 <= 1'b0;
end
always @(spc7_intrpt1_cmplt or spc7_atm_cntr1 or spc7_stb_state_ced1)
begin
  if (spc7_intrpt1_cmplt && (spc7_atm_cntr1 != 9'h000) && ~(|spc7_stb_state_ced1))
    spc7_atm_intrpt_b4capture1 <= 1'b1;
  else
    spc7_atm_intrpt_b4capture1 <= 1'b0;
end
always @(spc7_intrpt2_cmplt or spc7_atm_cntr2 or spc7_stb_state_ced2)
begin
  if (spc7_intrpt2_cmplt && (spc7_atm_cntr2 != 9'h000) && ~(|spc7_stb_state_ced2))
    spc7_atm_intrpt_b4capture2 <= 1'b1;
  else
    spc7_atm_intrpt_b4capture2 <= 1'b0;
end
always @(spc7_intrpt3_cmplt or spc7_atm_cntr3 or spc7_stb_state_ced3)
begin
  if (spc7_intrpt3_cmplt && (spc7_atm_cntr3 != 9'h000) && ~(|spc7_stb_state_ced3))
    spc7_atm_intrpt_b4capture3 <= 1'b1;
  else
    spc7_atm_intrpt_b4capture3 <= 1'b0;
end
//Capture after atomic is sent to pcx
always @(spc7_intrpt0_cmplt or spc7_atm_cntr0 or spc7_stb_state_ced0)
begin
  if (spc7_intrpt0_cmplt && (spc7_atm_cntr0 != 9'h000) && (|spc7_stb_state_ced0))
    spc7_atm_intrpt_capture0 <= 1'b1;
  else
    spc7_atm_intrpt_capture0 <= 1'b0;
end
always @(spc7_intrpt1_cmplt or spc7_atm_cntr1 or spc7_stb_state_ced1)
begin
  if (spc7_intrpt1_cmplt && (spc7_atm_cntr1 != 9'h000) && (|spc7_stb_state_ced1))
    spc7_atm_intrpt_capture1 <= 1'b1;
  else
    spc7_atm_intrpt_capture1 <= 1'b0;
end
always @(spc7_intrpt2_cmplt or spc7_atm_cntr2 or spc7_stb_state_ced2)
begin
  if (spc7_intrpt2_cmplt && (spc7_atm_cntr2 != 9'h000) && (|spc7_stb_state_ced2))
    spc7_atm_intrpt_capture2 <= 1'b1;
  else
    spc7_atm_intrpt_capture2 <= 1'b0;
end
always @(spc7_intrpt3_cmplt or spc7_atm_cntr3 or spc7_stb_state_ced3)
begin
  if (spc7_intrpt3_cmplt && (spc7_atm_cntr3 != 9'h000) && (|spc7_stb_state_ced3))
    spc7_atm_intrpt_capture3 <= 1'b1;
  else
    spc7_atm_intrpt_capture3 <= 1'b0;
end

//Capture after atomic is sent to pcx
always @(spc7_atm_cntr0 or spc7_dva_din or spc7_dva_wen)
begin
  if (~spc7_dva_din && spc7_dva_wen && (spc7_atm_cntr0 != 9'h000))
    spc7_atm_inv_capture0 <= 1'b1;
  else
    spc7_atm_inv_capture0 <= 1'b0;
end
always @(spc7_atm_cntr1 or spc7_dva_din or spc7_dva_wen)
begin
  if (~spc7_dva_din && spc7_dva_wen && (spc7_atm_cntr1 != 9'h000))
    spc7_atm_inv_capture1 <= 1'b1;
  else
    spc7_atm_inv_capture1 <= 1'b0;
end
always @(spc7_atm_cntr2 or spc7_dva_din or spc7_dva_wen)
begin
  if (~spc7_dva_din && spc7_dva_wen && (spc7_atm_cntr2 != 9'h000))
    spc7_atm_inv_capture2 <= 1'b1;
  else
    spc7_atm_inv_capture2 <= 1'b0;
end
always @(spc7_atm_cntr3 or spc7_dva_din or spc7_dva_wen)
begin
  if (~spc7_dva_din && spc7_dva_wen && (spc7_atm_cntr3 != 9'h000))
    spc7_atm_inv_capture3 <= 1'b1;
  else
    spc7_atm_inv_capture3 <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~(|spc7_stb_state_vld0) && (spc7_atm_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_atm_cntr0 <= 9'h000;
       spc7_atm0_d <= 1'b0;
      end
    else if( spc7_atomic_g && (spc7_atm_type0 != 8'h00))
      begin
       spc7_atm_cntr0 <= spc7_atm_cntr0 + 1;
       spc7_atm0_d <= 1'b1;
      end
    else if( spc7_atm0_d && (|spc7_stb_state_vld0))
      begin
       spc7_atm_cntr0 <= spc7_atm_cntr0 + 1;
       spc7_atm0_d <= spc7_atm0_d;
      end
    else
      begin
       spc7_atm_cntr0 <= spc7_atm_cntr0;
       spc7_atm0_d <= spc7_atm0_d;
      end
    if( ( ~(|spc7_stb_state_vld1) && (spc7_atm_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_atm_cntr1 <= 9'h000;
       spc7_atm1_d <= 1'b0;
      end
    else if( spc7_atomic_g && (spc7_atm_type1 != 8'h00))
      begin
       spc7_atm_cntr1 <= spc7_atm_cntr1 + 1;
       spc7_atm1_d <= 1'b1;
      end
    else if( spc7_atm1_d && (|spc7_stb_state_vld1))
      begin
       spc7_atm_cntr1 <= spc7_atm_cntr1 + 1;
       spc7_atm1_d <= spc7_atm1_d;
      end
    else
      begin
       spc7_atm_cntr1 <= spc7_atm_cntr1;
       spc7_atm1_d <= spc7_atm1_d;
      end
    if( ( ~(|spc7_stb_state_vld2) && (spc7_atm_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_atm_cntr2 <= 9'h000;
       spc7_atm2_d <= 1'b0;
      end
    else if( spc7_atomic_g && (spc7_atm_type2 != 8'h00))
      begin
       spc7_atm_cntr2 <= spc7_atm_cntr2 + 1;
       spc7_atm2_d <= 1'b1;
      end
    else if( spc7_atm2_d && (|spc7_stb_state_vld2))
      begin
       spc7_atm_cntr2 <= spc7_atm_cntr2 + 1;
       spc7_atm2_d <= spc7_atm2_d;
      end
    else
      begin
       spc7_atm_cntr2 <= spc7_atm_cntr2;
       spc7_atm2_d <= spc7_atm2_d;
      end
    if( ( ~(|spc7_stb_state_vld3) && (spc7_atm_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_atm_cntr3 <= 9'h000;
       spc7_atm3_d <= 1'b0;
      end
    else if( spc7_atomic_g && (spc7_atm_type3 != 8'h00))
      begin
       spc7_atm_cntr3 <= spc7_atm_cntr3 + 1;
       spc7_atm3_d <= 1'b1;
      end
    else if( spc7_atm3_d && (|spc7_stb_state_vld3))
      begin
       spc7_atm_cntr3 <= spc7_atm_cntr3 + 1;
       spc7_atm3_d <= spc7_atm3_d;
      end
    else
      begin
       spc7_atm_cntr3 <= spc7_atm_cntr3;
       spc7_atm3_d <= spc7_atm3_d;
      end
end

 assign spc7_raw_ack_capture0 = spc7_stb_ack_vld0 && (spc7_stb_ack_cntr0 != 9'h000);
 assign spc7_stb_ced0 = |spc7_stb_state_ced0;
 assign spc7_raw_ack_capture1 = spc7_stb_ack_vld1 && (spc7_stb_ack_cntr1 != 9'h000);
 assign spc7_stb_ced1 = |spc7_stb_state_ced1;
 assign spc7_raw_ack_capture2 = spc7_stb_ack_vld2 && (spc7_stb_ack_cntr2 != 9'h000);
 assign spc7_stb_ced2 = |spc7_stb_state_ced2;
 assign spc7_raw_ack_capture3 = spc7_stb_ack_vld3 && (spc7_stb_ack_cntr3 != 9'h000);
 assign spc7_stb_ced3 = |spc7_stb_state_ced3;

always @(posedge clk)
begin
    if( ( ~spc7_stb_ced0 && (spc7_stb_ced_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ced_cntr0 <= 9'h000;
       spc7_stb_ced0_d <= 1'b0;
      end
    else if( spc7_stb_ced0 && (spc7_stb_state_ack0 == 8'h00))
      begin
       spc7_stb_ced_cntr0 <= spc7_stb_ced_cntr0 + 1;
       spc7_stb_ced0_d <= spc7_stb_ced0;
      end
    else
      begin
       spc7_stb_ced_cntr0 <= spc7_stb_ced_cntr0;
       spc7_stb_ced0_d <= spc7_stb_ced0_d;
      end

    if( ( ~spc7_mbar_vld0 && (spc7_mbar_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_mbar_vld_cntr0 <= 9'h000;
       spc7_mbar_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_mbar_vld_counter = %d", spc7_mbar_vld_cntr0);
      end
    else if( spc7_mbar_vld0)
      begin
       spc7_mbar_vld_cntr0 <= spc7_mbar_vld_cntr0 + 1;
       spc7_mbar_vld_d0 <= spc7_mbar_vld0;
      end
    else
      begin
       spc7_mbar_vld_cntr0 <= spc7_mbar_vld_cntr0;
       spc7_mbar_vld_d0 <= spc7_mbar_vld0;
      end

    if( ( ~spc7_flsh_vld0 && (spc7_flsh_vld_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_flsh_vld_cntr0 <= 9'h000;
       spc7_flsh_vld_d0 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_flsh_vld_counter = %d", spc7_flsh_vld_cntr0);
      end
    else if( spc7_flsh_vld0)
      begin
       spc7_flsh_vld_cntr0 <= spc7_flsh_vld_cntr0 + 1;
       spc7_flsh_vld_d0 <= spc7_flsh_vld0;
      end
    else
      begin
       spc7_flsh_vld_cntr0 <= spc7_flsh_vld_cntr0;
       spc7_flsh_vld_d0 <= spc7_flsh_vld0;
      end

    if( ( ~spc7_stb_ced1 && (spc7_stb_ced_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ced_cntr1 <= 9'h000;
       spc7_stb_ced1_d <= 1'b0;
      end
    else if( spc7_stb_ced1 && (spc7_stb_state_ack1 == 8'h00))
      begin
       spc7_stb_ced_cntr1 <= spc7_stb_ced_cntr1 + 1;
       spc7_stb_ced1_d <= spc7_stb_ced1;
      end
    else
      begin
       spc7_stb_ced_cntr1 <= spc7_stb_ced_cntr1;
       spc7_stb_ced1_d <= spc7_stb_ced1_d;
      end

    if( ( ~spc7_mbar_vld1 && (spc7_mbar_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_mbar_vld_cntr1 <= 9'h000;
       spc7_mbar_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_mbar_vld_counter = %d", spc7_mbar_vld_cntr1);
      end
    else if( spc7_mbar_vld1)
      begin
       spc7_mbar_vld_cntr1 <= spc7_mbar_vld_cntr1 + 1;
       spc7_mbar_vld_d1 <= spc7_mbar_vld1;
      end
    else
      begin
       spc7_mbar_vld_cntr1 <= spc7_mbar_vld_cntr1;
       spc7_mbar_vld_d1 <= spc7_mbar_vld1;
      end

    if( ( ~spc7_flsh_vld1 && (spc7_flsh_vld_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_flsh_vld_cntr1 <= 9'h000;
       spc7_flsh_vld_d1 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_flsh_vld_counter = %d", spc7_flsh_vld_cntr1);
      end
    else if( spc7_flsh_vld1)
      begin
       spc7_flsh_vld_cntr1 <= spc7_flsh_vld_cntr1 + 1;
       spc7_flsh_vld_d1 <= spc7_flsh_vld1;
      end
    else
      begin
       spc7_flsh_vld_cntr1 <= spc7_flsh_vld_cntr1;
       spc7_flsh_vld_d1 <= spc7_flsh_vld1;
      end

    if( ( ~spc7_stb_ced2 && (spc7_stb_ced_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ced_cntr2 <= 9'h000;
       spc7_stb_ced2_d <= 1'b0;
      end
    else if( spc7_stb_ced2 && (spc7_stb_state_ack2 == 8'h00))
      begin
       spc7_stb_ced_cntr2 <= spc7_stb_ced_cntr2 + 1;
       spc7_stb_ced2_d <= spc7_stb_ced2;
      end
    else
      begin
       spc7_stb_ced_cntr2 <= spc7_stb_ced_cntr2;
       spc7_stb_ced2_d <= spc7_stb_ced2_d;
      end

    if( ( ~spc7_mbar_vld2 && (spc7_mbar_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_mbar_vld_cntr2 <= 9'h000;
       spc7_mbar_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_mbar_vld_counter = %d", spc7_mbar_vld_cntr2);
      end
    else if( spc7_mbar_vld2)
      begin
       spc7_mbar_vld_cntr2 <= spc7_mbar_vld_cntr2 + 1;
       spc7_mbar_vld_d2 <= spc7_mbar_vld2;
      end
    else
      begin
       spc7_mbar_vld_cntr2 <= spc7_mbar_vld_cntr2;
       spc7_mbar_vld_d2 <= spc7_mbar_vld2;
      end

    if( ( ~spc7_flsh_vld2 && (spc7_flsh_vld_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_flsh_vld_cntr2 <= 9'h000;
       spc7_flsh_vld_d2 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_flsh_vld_counter = %d", spc7_flsh_vld_cntr2);
      end
    else if( spc7_flsh_vld2)
      begin
       spc7_flsh_vld_cntr2 <= spc7_flsh_vld_cntr2 + 1;
       spc7_flsh_vld_d2 <= spc7_flsh_vld2;
      end
    else
      begin
       spc7_flsh_vld_cntr2 <= spc7_flsh_vld_cntr2;
       spc7_flsh_vld_d2 <= spc7_flsh_vld2;
      end

    if( ( ~spc7_stb_ced3 && (spc7_stb_ced_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ced_cntr3 <= 9'h000;
       spc7_stb_ced3_d <= 1'b0;
      end
    else if( spc7_stb_ced3 && (spc7_stb_state_ack3 == 8'h00))
      begin
       spc7_stb_ced_cntr3 <= spc7_stb_ced_cntr3 + 1;
       spc7_stb_ced3_d <= spc7_stb_ced3;
      end
    else
      begin
       spc7_stb_ced_cntr3 <= spc7_stb_ced_cntr3;
       spc7_stb_ced3_d <= spc7_stb_ced3_d;
      end

    if( ( ~spc7_mbar_vld3 && (spc7_mbar_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_mbar_vld_cntr3 <= 9'h000;
       spc7_mbar_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_mbar_vld_counter = %d", spc7_mbar_vld_cntr3);
      end
    else if( spc7_mbar_vld3)
      begin
       spc7_mbar_vld_cntr3 <= spc7_mbar_vld_cntr3 + 1;
       spc7_mbar_vld_d3 <= spc7_mbar_vld3;
      end
    else
      begin
       spc7_mbar_vld_cntr3 <= spc7_mbar_vld_cntr3;
       spc7_mbar_vld_d3 <= spc7_mbar_vld3;
      end

    if( ( ~spc7_flsh_vld3 && (spc7_flsh_vld_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_flsh_vld_cntr3 <= 9'h000;
       spc7_flsh_vld_d3 <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_flsh_vld_counter = %d", spc7_flsh_vld_cntr3);
      end
    else if( spc7_flsh_vld3)
      begin
       spc7_flsh_vld_cntr3 <= spc7_flsh_vld_cntr3 + 1;
       spc7_flsh_vld_d3 <= spc7_flsh_vld3;
      end
    else
      begin
       spc7_flsh_vld_cntr3 <= spc7_flsh_vld_cntr3;
       spc7_flsh_vld_d3 <= spc7_flsh_vld3;
      end

end

always @(spc7_flsh_vld_d0 or spc7_flsh_vld0)
begin
  if (spc7_flsh_vld_d0 && ~spc7_flsh_vld0)
    spc7_flsh_vld_capture0 <= 1'b1;
  else
    spc7_flsh_vld_capture0 <= 1'b0;
end
always @(spc7_flsh_vld_d1 or spc7_flsh_vld1)
begin
  if (spc7_flsh_vld_d1 && ~spc7_flsh_vld1)
    spc7_flsh_vld_capture1 <= 1'b1;
  else
    spc7_flsh_vld_capture1 <= 1'b0;
end
always @(spc7_flsh_vld_d2 or spc7_flsh_vld2)
begin
  if (spc7_flsh_vld_d2 && ~spc7_flsh_vld2)
    spc7_flsh_vld_capture2 <= 1'b1;
  else
    spc7_flsh_vld_capture2 <= 1'b0;
end
always @(spc7_flsh_vld_d3 or spc7_flsh_vld3)
begin
  if (spc7_flsh_vld_d3 && ~spc7_flsh_vld3)
    spc7_flsh_vld_capture3 <= 1'b1;
  else
    spc7_flsh_vld_capture3 <= 1'b0;
end

always @(spc7_lmiss_pa0 or spc7_imiss_pa or spc7_imiss_vld_d or spc7_lmiss_vld0)
begin
if((spc7_lmiss_pa0 == spc7_imiss_pa) && spc7_imiss_vld_d && spc7_lmiss_vld0)
 spc7_lmiss_eq0 = 1'b1;
else
 spc7_lmiss_eq0 = 1'b0;
end
always @(spc7_lmiss_pa1 or spc7_imiss_pa or spc7_imiss_vld_d or spc7_lmiss_vld1)
begin
if((spc7_lmiss_pa1 == spc7_imiss_pa) && spc7_imiss_vld_d && spc7_lmiss_vld1)
 spc7_lmiss_eq1 = 1'b1;
else
 spc7_lmiss_eq1 = 1'b0;
end
always @(spc7_lmiss_pa2 or spc7_imiss_pa or spc7_imiss_vld_d or spc7_lmiss_vld2)
begin
if((spc7_lmiss_pa2 == spc7_imiss_pa) && spc7_imiss_vld_d && spc7_lmiss_vld2)
 spc7_lmiss_eq2 = 1'b1;
else
 spc7_lmiss_eq2 = 1'b0;
end
always @(spc7_lmiss_pa3 or spc7_imiss_pa or spc7_imiss_vld_d or spc7_lmiss_vld3)
begin
if((spc7_lmiss_pa3 == spc7_imiss_pa) && spc7_imiss_vld_d && spc7_lmiss_vld3)
 spc7_lmiss_eq3 = 1'b1;
else
 spc7_lmiss_eq3 = 1'b0;
end

always @(spc7_lmiss_pa0 or spc7_stb_atm_addr0 or spc7_atm_cntr0 or spc7_lmiss_vld0)
begin
if ( ((spc7_lmiss_pa0 == spc7_stb_atm_addr0) && (spc7_atm_cntr0 != 9'h000) && spc7_lmiss_vld0) ||
     ((spc7_lmiss_pa1 == spc7_stb_atm_addr0) && (spc7_atm_cntr0 != 9'h000) && spc7_lmiss_vld1) ||
     ((spc7_lmiss_pa2 == spc7_stb_atm_addr0) && (spc7_atm_cntr0 != 9'h000) && spc7_lmiss_vld2) ||
     ((spc7_lmiss_pa3 == spc7_stb_atm_addr0) && (spc7_atm_cntr0 != 9'h000) && spc7_lmiss_vld3) )

 spc7_atm_lmiss_eq0 = 1'b1;
else
 spc7_atm_lmiss_eq0 = 1'b0;
end
always @(spc7_lmiss_pa1 or spc7_stb_atm_addr1 or spc7_atm_cntr1 or spc7_lmiss_vld1)
begin
if ( ((spc7_lmiss_pa0 == spc7_stb_atm_addr1) && (spc7_atm_cntr1 != 9'h000) && spc7_lmiss_vld0) ||
     ((spc7_lmiss_pa1 == spc7_stb_atm_addr1) && (spc7_atm_cntr1 != 9'h000) && spc7_lmiss_vld1) ||
     ((spc7_lmiss_pa2 == spc7_stb_atm_addr1) && (spc7_atm_cntr1 != 9'h000) && spc7_lmiss_vld2) ||
     ((spc7_lmiss_pa3 == spc7_stb_atm_addr1) && (spc7_atm_cntr1 != 9'h000) && spc7_lmiss_vld3) )

 spc7_atm_lmiss_eq1 = 1'b1;
else
 spc7_atm_lmiss_eq1 = 1'b0;
end
always @(spc7_lmiss_pa2 or spc7_stb_atm_addr2 or spc7_atm_cntr2 or spc7_lmiss_vld2)
begin
if ( ((spc7_lmiss_pa0 == spc7_stb_atm_addr2) && (spc7_atm_cntr2 != 9'h000) && spc7_lmiss_vld0) ||
     ((spc7_lmiss_pa1 == spc7_stb_atm_addr2) && (spc7_atm_cntr2 != 9'h000) && spc7_lmiss_vld1) ||
     ((spc7_lmiss_pa2 == spc7_stb_atm_addr2) && (spc7_atm_cntr2 != 9'h000) && spc7_lmiss_vld2) ||
     ((spc7_lmiss_pa3 == spc7_stb_atm_addr2) && (spc7_atm_cntr2 != 9'h000) && spc7_lmiss_vld3) )

 spc7_atm_lmiss_eq2 = 1'b1;
else
 spc7_atm_lmiss_eq2 = 1'b0;
end
always @(spc7_lmiss_pa3 or spc7_stb_atm_addr3 or spc7_atm_cntr3 or spc7_lmiss_vld3)
begin
if ( ((spc7_lmiss_pa0 == spc7_stb_atm_addr3) && (spc7_atm_cntr3 != 9'h000) && spc7_lmiss_vld0) ||
     ((spc7_lmiss_pa1 == spc7_stb_atm_addr3) && (spc7_atm_cntr3 != 9'h000) && spc7_lmiss_vld1) ||
     ((spc7_lmiss_pa2 == spc7_stb_atm_addr3) && (spc7_atm_cntr3 != 9'h000) && spc7_lmiss_vld2) ||
     ((spc7_lmiss_pa3 == spc7_stb_atm_addr3) && (spc7_atm_cntr3 != 9'h000) && spc7_lmiss_vld3) )

 spc7_atm_lmiss_eq3 = 1'b1;
else
 spc7_atm_lmiss_eq3 = 1'b0;
end

always @(spc7_imiss_pa or spc7_stb_atm_addr0 or spc7_atm_cntr0 or spc7_imiss_vld_d)
begin
if((spc7_imiss_pa == spc7_stb_atm_addr0) && (spc7_atm_cntr0 != 9'h000) && spc7_imiss_vld_d)
 spc7_atm_imiss_eq0 = 1'b1;
else
 spc7_atm_imiss_eq0 = 1'b0;
end
always @(spc7_imiss_pa or spc7_stb_atm_addr1 or spc7_atm_cntr1 or spc7_imiss_vld_d)
begin
if((spc7_imiss_pa == spc7_stb_atm_addr1) && (spc7_atm_cntr1 != 9'h000) && spc7_imiss_vld_d)
 spc7_atm_imiss_eq1 = 1'b1;
else
 spc7_atm_imiss_eq1 = 1'b0;
end
always @(spc7_imiss_pa or spc7_stb_atm_addr2 or spc7_atm_cntr2 or spc7_imiss_vld_d)
begin
if((spc7_imiss_pa == spc7_stb_atm_addr2) && (spc7_atm_cntr2 != 9'h000) && spc7_imiss_vld_d)
 spc7_atm_imiss_eq2 = 1'b1;
else
 spc7_atm_imiss_eq2 = 1'b0;
end
always @(spc7_imiss_pa or spc7_stb_atm_addr3 or spc7_atm_cntr3 or spc7_imiss_vld_d)
begin
if((spc7_imiss_pa == spc7_stb_atm_addr3) && (spc7_atm_cntr3 != 9'h000) && spc7_imiss_vld_d)
 spc7_atm_imiss_eq3 = 1'b1;
else
 spc7_atm_imiss_eq3 = 1'b0;
end

always @(posedge clk)
begin
 if( ~spc7_imiss_vld || ~rst_l)
   spc7_imiss_vld_d <= 1'b0;
 else
   spc7_imiss_vld_d <= spc7_imiss_vld;

 if( ~spc7_ld_miss || ~rst_l)
   spc7_ld_miss_capture <= 1'b0;
 else
   spc7_ld_miss_capture <= spc7_ld_miss;

end

always @(spc7_stb_ced0 or spc7_stb_ced0_d)
begin
if (~spc7_stb_ced0 && spc7_stb_ced0_d)
spc7_stb_ced_capture0 <= 1'b1;
else
spc7_stb_ced_capture0 <= 1'b0;

end
always @(spc7_stb_ced1 or spc7_stb_ced1_d)
begin
if (~spc7_stb_ced1 && spc7_stb_ced1_d)
spc7_stb_ced_capture1 <= 1'b1;
else
spc7_stb_ced_capture1 <= 1'b0;

end
always @(spc7_stb_ced2 or spc7_stb_ced2_d)
begin
if (~spc7_stb_ced2 && spc7_stb_ced2_d)
spc7_stb_ced_capture2 <= 1'b1;
else
spc7_stb_ced_capture2 <= 1'b0;

end
always @(spc7_stb_ced3 or spc7_stb_ced3_d)
begin
if (~spc7_stb_ced3 && spc7_stb_ced3_d)
spc7_stb_ced_capture3 <= 1'b1;
else
spc7_stb_ced_capture3 <= 1'b0;

end

always @(posedge clk)
begin

    if( (spc7_stb_state_ack0 != 8'h00 && (spc7_stb_ack_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ack_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_ack_counter0 = %d", spc7_stb_ack_cntr0);
      end
    else if(spc7_stb_cam_hit && spc7_ld0_inst_vld_g && (spc7_stb_state_ack0 == 8'h00))
      begin
       spc7_stb_ack_cntr0 <= spc7_stb_ack_cntr0 + 1;
      end
    else if( (spc7_stb_state_ack0 == 8'h00 ) && (spc7_stb_ack_cntr0 != 9'h000))
      begin
       spc7_stb_ack_cntr0 <= spc7_stb_ack_cntr0 + 1;
      end // if ( (spc7_stb_state_ack0 == 8'h00 ) && (spc7_stb_ack_cntr0 != 9'h000))
    else
      begin
       spc7_stb_ack_cntr0 <= spc7_stb_ack_cntr0;
      end

    if( (spc7_stb_state_ack1 != 8'h00 && (spc7_stb_ack_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ack_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_ack_counter1 = %d", spc7_stb_ack_cntr1);
      end
    else if(spc7_stb_cam_hit && spc7_ld1_inst_vld_g && (spc7_stb_state_ack1 == 8'h00))
      begin
       spc7_stb_ack_cntr1 <= spc7_stb_ack_cntr1 + 1;
      end
    else if( (spc7_stb_state_ack1 == 8'h00 ) && (spc7_stb_ack_cntr1 != 9'h000))
      begin
       spc7_stb_ack_cntr1 <= spc7_stb_ack_cntr1 + 1;
      end // if ( (spc7_stb_state_ack1 == 8'h00 ) && (spc7_stb_ack_cntr1 != 9'h000))
    else
      begin
       spc7_stb_ack_cntr1 <= spc7_stb_ack_cntr1;
      end

    if( (spc7_stb_state_ack2 != 8'h00 && (spc7_stb_ack_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ack_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_ack_counter2 = %d", spc7_stb_ack_cntr2);
      end
    else if(spc7_stb_cam_hit && spc7_ld2_inst_vld_g && (spc7_stb_state_ack2 == 8'h00))
      begin
       spc7_stb_ack_cntr2 <= spc7_stb_ack_cntr2 + 1;
      end
    else if( (spc7_stb_state_ack2 == 8'h00 ) && (spc7_stb_ack_cntr2 != 9'h000))
      begin
       spc7_stb_ack_cntr2 <= spc7_stb_ack_cntr2 + 1;
      end // if ( (spc7_stb_state_ack2 == 8'h00 ) && (spc7_stb_ack_cntr2 != 9'h000))
    else
      begin
       spc7_stb_ack_cntr2 <= spc7_stb_ack_cntr2;
      end

    if( (spc7_stb_state_ack3 != 8'h00 && (spc7_stb_ack_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_ack_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_ack_counter3 = %d", spc7_stb_ack_cntr3);
      end
    else if(spc7_stb_cam_hit && spc7_ld3_inst_vld_g && (spc7_stb_state_ack3 == 8'h00))
      begin
       spc7_stb_ack_cntr3 <= spc7_stb_ack_cntr3 + 1;
      end
    else if( (spc7_stb_state_ack3 == 8'h00 ) && (spc7_stb_ack_cntr3 != 9'h000))
      begin
       spc7_stb_ack_cntr3 <= spc7_stb_ack_cntr3 + 1;
      end // if ( (spc7_stb_state_ack3 == 8'h00 ) && (spc7_stb_ack_cntr3 != 9'h000))
    else
      begin
       spc7_stb_ack_cntr3 <= spc7_stb_ack_cntr3;
      end
end // always @ (posedge clk)


// stb full coverage window
always @(spc7_stb0_full_w2 or spc7_stb0_full)
begin
if (~spc7_stb0_full_w2 && spc7_stb0_full)
spc7_stb_full_capture0 <= 1'b1;
else
spc7_stb_full_capture0 <= 1'b0;

end
always @(spc7_stb1_full_w2 or spc7_stb1_full)
begin
if (~spc7_stb1_full_w2 && spc7_stb1_full)
spc7_stb_full_capture1 <= 1'b1;
else
spc7_stb_full_capture1 <= 1'b0;

end
always @(spc7_stb2_full_w2 or spc7_stb2_full)
begin
if (~spc7_stb2_full_w2 && spc7_stb2_full)
spc7_stb_full_capture2 <= 1'b1;
else
spc7_stb_full_capture2 <= 1'b0;

end
always @(spc7_stb3_full_w2 or spc7_stb3_full)
begin
if (~spc7_stb3_full_w2 && spc7_stb3_full)
spc7_stb_full_capture3 <= 1'b1;
else
spc7_stb_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc7_stb0_full && (spc7_stb_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_full_cntr0 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_full_counter0 = %d", spc7_stb_full_cntr0);
      end
    else if( spc7_stb0_full)
      begin
       spc7_stb_full_cntr0 <= spc7_stb_full_cntr0 + 1;
      end
    else
      begin
       spc7_stb_full_cntr0 <= spc7_stb_full_cntr0;
      end
    if( ( ~spc7_stb1_full && (spc7_stb_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_full_cntr1 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_full_counter1 = %d", spc7_stb_full_cntr1);
      end
    else if( spc7_stb1_full)
      begin
       spc7_stb_full_cntr1 <= spc7_stb_full_cntr1 + 1;
      end
    else
      begin
       spc7_stb_full_cntr1 <= spc7_stb_full_cntr1;
      end
    if( ( ~spc7_stb2_full && (spc7_stb_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_full_cntr2 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_full_counter2 = %d", spc7_stb_full_cntr2);
      end
    else if( spc7_stb2_full)
      begin
       spc7_stb_full_cntr2 <= spc7_stb_full_cntr2 + 1;
      end
    else
      begin
       spc7_stb_full_cntr2 <= spc7_stb_full_cntr2;
      end
    if( ( ~spc7_stb3_full && (spc7_stb_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_stb_full_cntr3 <= 9'h000;
       if(lsu_mon_msg) $display("lsu_mon: spc7_stb_full_counter3 = %d", spc7_stb_full_cntr3);
      end
    else if( spc7_stb3_full)
      begin
       spc7_stb_full_cntr3 <= spc7_stb_full_cntr3 + 1;
      end
    else
      begin
       spc7_stb_full_cntr3 <= spc7_stb_full_cntr3;
      end
end // always @ (posedge clk)


// lmq full coverage window
always @(spc7_lmq0_full_d or spc7_lmq0_full)
begin
if (spc7_lmq0_full_d && ~spc7_lmq0_full)
spc7_lmq_full_capture0 <= 1'b1;
else
spc7_lmq_full_capture0 <= 1'b0;

end
always @(spc7_lmq1_full_d or spc7_lmq1_full)
begin
if (spc7_lmq1_full_d && ~spc7_lmq1_full)
spc7_lmq_full_capture1 <= 1'b1;
else
spc7_lmq_full_capture1 <= 1'b0;

end
always @(spc7_lmq2_full_d or spc7_lmq2_full)
begin
if (spc7_lmq2_full_d && ~spc7_lmq2_full)
spc7_lmq_full_capture2 <= 1'b1;
else
spc7_lmq_full_capture2 <= 1'b0;

end
always @(spc7_lmq3_full_d or spc7_lmq3_full)
begin
if (spc7_lmq3_full_d && ~spc7_lmq3_full)
spc7_lmq_full_capture3 <= 1'b1;
else
spc7_lmq_full_capture3 <= 1'b0;

end
always @(posedge clk)
begin
    if( ( ~spc7_lmq0_full && (spc7_lmq_full_cntr0 != 9'h000)) || ~rst_l)
      begin
       spc7_lmq_full_cntr0 <= 9'h000;
       spc7_lmq0_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_lmq_full_counter0 = %d", spc7_lmq_full_cntr0);
      end
    else if( spc7_lmq0_full)
      begin
       spc7_lmq_full_cntr0 <= spc7_lmq_full_cntr0 + 1;
       spc7_lmq0_full_d <= spc7_lmq0_full;
      end
    else
      begin
       spc7_lmq_full_cntr0 <= spc7_lmq_full_cntr0;
       spc7_lmq0_full_d <= spc7_lmq0_full;
      end

    if( ( ~spc7_lmq1_full && (spc7_lmq_full_cntr1 != 9'h000)) || ~rst_l)
      begin
       spc7_lmq_full_cntr1 <= 9'h000;
       spc7_lmq1_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_lmq_full_counter1 = %d", spc7_lmq_full_cntr1);
      end
    else if( spc7_lmq1_full)
      begin
       spc7_lmq_full_cntr1 <= spc7_lmq_full_cntr1 + 1;
       spc7_lmq1_full_d <= spc7_lmq1_full;
      end
    else
      begin
       spc7_lmq_full_cntr1 <= spc7_lmq_full_cntr1;
       spc7_lmq1_full_d <= spc7_lmq1_full;
      end

    if( ( ~spc7_lmq2_full && (spc7_lmq_full_cntr2 != 9'h000)) || ~rst_l)
      begin
       spc7_lmq_full_cntr2 <= 9'h000;
       spc7_lmq2_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_lmq_full_counter2 = %d", spc7_lmq_full_cntr2);
      end
    else if( spc7_lmq2_full)
      begin
       spc7_lmq_full_cntr2 <= spc7_lmq_full_cntr2 + 1;
       spc7_lmq2_full_d <= spc7_lmq2_full;
      end
    else
      begin
       spc7_lmq_full_cntr2 <= spc7_lmq_full_cntr2;
       spc7_lmq2_full_d <= spc7_lmq2_full;
      end

    if( ( ~spc7_lmq3_full && (spc7_lmq_full_cntr3 != 9'h000)) || ~rst_l)
      begin
       spc7_lmq_full_cntr3 <= 9'h000;
       spc7_lmq3_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_lmq_full_counter3 = %d", spc7_lmq_full_cntr3);
      end
    else if( spc7_lmq3_full)
      begin
       spc7_lmq_full_cntr3 <= spc7_lmq_full_cntr3 + 1;
       spc7_lmq3_full_d <= spc7_lmq3_full;
      end
    else
      begin
       spc7_lmq_full_cntr3 <= spc7_lmq_full_cntr3;
       spc7_lmq3_full_d <= spc7_lmq3_full;
      end

end // always @ (posedge clk)


// dfq full coverage window
always @(spc7_dfq_full_d or spc7_dfq_full)
begin
  if (spc7_dfq_full_d && ~spc7_dfq_full)
    spc7_dfq_full_capture <= 1'b1;
  else
    spc7_dfq_full_capture <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc7_dfq_full && (spc7_dfq_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc7_dfq_full_cntr <= 9'h000;
       spc7_dfq_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dfq_full_counter = %d", spc7_dfq_full_cntr);
      end
    else if( spc7_dfq_full)
      begin
       spc7_dfq_full_cntr <= spc7_dfq_full_cntr + 1;
       spc7_dfq_full_d <= spc7_dfq_full;
      end
    else
      begin
       spc7_dfq_full_cntr <= spc7_dfq_full_cntr;
       spc7_dfq_full_d <= spc7_dfq_full;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc7_dva_full_d or spc7_dva_inv)
begin
  if (spc7_dva_full_d && ~spc7_dva_inv)
    spc7_dva_full_capture <= 1'b1;
  else
    spc7_dva_full_capture <= 1'b0;
end

always @(posedge clk)
begin
  if (spc7_dva_din && spc7_dva_wen)
    begin
     spc7_dva_inv <= 1'b1;
     spc7_dva_waddr_d <= spc7_dva_waddr;
    end
  else if(~spc7_dva_din && spc7_dva_wen)
    begin
     spc7_dva_inv <= 1'b0;
     spc7_dva_waddr_d <= 5'b00000;
    end
  else
    begin
     spc7_dva_inv <= spc7_dva_inv;
     spc7_dva_waddr_d <= spc7_dva_waddr_d;
    end
end

always @(spc7_dva_raddr or spc7_dva_ren or spc7_dva_inv)
begin
  if (spc7_dva_inv && spc7_dva_ren && (spc7_dva_raddr[6:2] == spc7_dva_waddr_d))
    spc7_dva_vld2lkup <= 1'b1;
  else
    spc7_dva_vld2lkup <= 1'b0;
end

always @(posedge clk)
begin
    if( ( ~spc7_dva_inv && (spc7_dva_full_cntr != 9'h000)) || ~rst_l)
      begin
       spc7_dva_full_cntr <= 9'h000;
       spc7_dva_full_d <= 1'b0;
       if(lsu_mon_msg) $display("lsu_mon: spc7_dva_full_counter = %d", spc7_dva_full_cntr);
      end
    else if( spc7_dva_inv)
      begin
       spc7_dva_full_cntr <= spc7_dva_full_cntr + 1;
       spc7_dva_full_d <= spc7_dva_inv;
      end
    else
      begin
       spc7_dva_full_cntr <= spc7_dva_full_cntr;
       spc7_dva_full_d <= spc7_dva_full_d;
      end
end // always @ (posedge clk)

// dva valid/invalidate coverage window
always @(spc7_dva_vfull_d or spc7_dva_vld)
begin
  if (spc7_dva_vfull_d && ~spc7_dva_vld)
    spc7_dva_vfull_capture <= 1'b1;
  else
    spc7_dva_vfull_capture <= 1'b0;

end


always @(posedge clk)
begin
  if (~spc7_dva_din && spc7_dva_wen)
   begin
    spc7_dva_vld <= 1'b1;
    spc7_dva_invwaddr_d <= spc7_dva_waddr;
    spc7_dva_invld_err <= spc7_dva_inv_perror;
   end
  else if(spc7_dva_din && spc7_dva_wen)
    begin
     spc7_dva_vld <= 1'b0;
     spc7_dva_invwaddr_d <= 5'b00000;
     spc7_dva_invld_err <= 1'b0;
    end
  else
    begin
     spc7_dva_vld <= spc7_dva_vld;
     spc7_dva_invwaddr_d <= spc7_dva_invwaddr_d;
     spc7_dva_invld_err <= spc7_dva_invld_err;
    end
end


always @(spc7_dva_raddr or spc7_dva_ren or spc7_dva_vld)
begin
  if (spc7_dva_vld && spc7_dva_ren && (spc7_dva_raddr[6:2] == spc7_dva_waddr_d))
    spc7_dva_invld2lkup <= 1'b1;
  else
    spc7_dva_invld2lkup <= 1'b0;
end


always @(posedge clk)
begin
  if( ( ~spc7_dva_vld && (spc7_dva_vfull_cntr != 9'h000)) || ~rst_l)
  begin
    spc7_dva_vfull_cntr <= 9'h000;
    spc7_dva_vfull_d <= 1'b0;
    if(lsu_mon_msg) $display("lsu_mon: spc7_dva_vfull_counter = %d", spc7_dva_vfull_cntr);
  end
    else if( spc7_dva_vld)
    begin
      spc7_dva_vfull_cntr <= spc7_dva_vfull_cntr + 1;
      spc7_dva_vfull_d <= spc7_dva_vld;
    end
    else
    begin
      spc7_dva_vfull_cntr <= spc7_dva_vfull_cntr;
      spc7_dva_vfull_d <= spc7_dva_vfull_d;
    end
end // always @ (posedge clk)

// Can this ever happen/Might have to flag this as an error..
always @(spc7_dva_raddr or spc7_dva_waddr or spc7_dva_ren or spc7_dva_wen)
begin
  if ( spc7_dva_ren && spc7_dva_wen && (spc7_dva_raddr[6:2] == spc7_dva_waddr))
    spc7_dva_collide <= 1'b1;
  else
    spc7_dva_collide <= 1'b0;
end

// dva error cases

always @(spc7_dva_raddr or spc7_dva_ren or spc7_dva_dtag_perror or spc7_dva_dtag_perror)
begin
  if (spc7_dva_ren && (spc7_dva_dtag_perror || spc7_dva_dtag_perror))
    spc7_dva_err <= 1'b1;
  else
    spc7_dva_err <= 1'b0;
end

always @(posedge clk)
begin

  if(spc7_dva_err)
     spc7_dva_efull_d <= 1'b1;
  else
     spc7_dva_efull_d <= 1'b0;

end
always @(posedge clk)
begin
  if( (spc7_dva_ren && ~(spc7_dva_dtag_perror || spc7_dva_dtag_perror ) &&
       (spc7_dva_efull_cntr != 9'h000)) || ~rst_l)
    begin
     spc7_dva_efull_cntr <= 9'h000;
     spc7_dva_raddr_d <= spc7_dva_raddr;
     if(lsu_mon_msg) $display("lsu_mon: spc7_dva_efull_counter = %d", spc7_dva_efull_cntr);
    end
  else if(spc7_dva_efull_d)
    begin
      spc7_dva_efull_cntr <= spc7_dva_efull_cntr + 1;
      spc7_dva_raddr_d <= spc7_dva_raddr_d;
    end
  else
    begin
      spc7_dva_efull_cntr <= spc7_dva_efull_cntr;
      spc7_dva_raddr_d <= spc7_dva_raddr_d;
    end
end // always @ (posedge clk)

`endif
endmodule

