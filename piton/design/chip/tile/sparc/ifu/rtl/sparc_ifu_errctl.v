// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_errctl.v
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
//  Module Name:  sparc_ifu_errctl
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

`include "lsu.tmp.h"

module sparc_ifu_errctl(/*AUTOARG*/
   // Outputs
   erc_erd_pgsz_b0, erc_erd_pgsz_b1, ifu_lsu_asi_rd_unc, 
   ifu_lsu_ldxa_tid_w2, ifu_lsu_ldxa_data_vld_w2, 
   ifu_lsu_fwd_data_vld, ifu_lsu_error_inj, ifu_exu_ecc_mask, 
   ifu_exu_inj_irferr, ifu_ffu_inj_frferr, ifu_exu_nceen_e, 
   ifu_lsu_nceen, ifu_spu_nceen, erb_fcl_spu_uetrap, 
   erb_ifq_itlberr_s1, erb_ifq_ifeterr_d1, erb_dtu_ifeterr_d1, 
   erb_fcl_itlb_ce_d1, erb_fcl_ce_trapvec, erb_fcl_ue_trapvec, 
   erb_fcl_ifet_uevec_d1, erc_erd_errstat_asidata, 
   erc_erd_errinj_asidata, erc_erd_erren_asidata, 
   erc_erd_eadr0_sel_irf_l, erc_erd_eadr0_sel_itlb_l, 
   erc_erd_eadr0_sel_frf_l, erc_erd_eadr0_sel_lsu_l, 
   erc_erd_asiway_s1_l, erc_erd_eadr1_sel_pcd1_l, 
   erc_erd_eadr1_sel_l1pa_l, erc_erd_eadr1_sel_l2pa_l, 
   erc_erd_eadr1_sel_other_l, erc_erd_eadr2_sel_mx1_l, 
   erc_erd_eadr2_sel_wrt_l, erc_erd_eadr2_sel_mx0_l, 
   erc_erd_eadr2_sel_old_l, erc_erd_asi_thr_l, 
   erc_erd_asisrc_sel_icd_s_l, erc_erd_asisrc_sel_misc_s_l, 
   erc_erd_asisrc_sel_err_s_l, erc_erd_asisrc_sel_itlb_s_l, 
   erc_erd_errasi_sel_en_l, erc_erd_errasi_sel_stat_l, 
   erc_erd_errasi_sel_inj_l, erc_erd_errasi_sel_addr_l, 
   erc_erd_miscasi_sel_ict_l, erc_erd_miscasi_sel_imask_l, 
   erc_erd_miscasi_sel_other_l, erc_erd_ld_imask, erb_reset, so, 
   // Inputs
   rclk, se, si, arst_l, grst_l, erd_erc_tte_pgsz, icv_itlb_valid_f, 
   fcl_erb_ievld_s1, fcl_erb_tevld_s1, fcl_erb_immuevld_s1, 
   fcl_erb_inst_issue_d, fcl_erb_inst_vld_d1, ifu_tlu_inst_vld_w, 
   ifu_lsu_thrid_s, fcl_erb_asi_tid_f, ifq_fcl_asi_tid_bf, 
   fcl_erb_clear_iferr, fcl_erb_itlbrd_vld_s, fcl_erb_itlbrd_data_s, 
   erd_erc_tagpe_s1, erd_erc_nirpe_s1, erd_erc_fetpe_s1, 
   erd_erc_tlbt_pe_s1, erd_erc_tlbd_pe_s1, tlu_lsu_pstate_priv, tlu_hpstate_priv,
   lsu_ifu_dtlb_data_su, lsu_ifu_dtlb_data_ue, lsu_ifu_dtlb_tag_ue, 
   lsu_ifu_dcache_data_perror, lsu_ifu_dcache_tag_perror, 
   lsu_ifu_l2_unc_error, lsu_ifu_l2_corr_error, lsu_ifu_io_error, 
   lsu_ifu_error_tid, spu_ifu_unc_err_w1, spu_ifu_mamem_err_w1, 
   spu_ifu_corr_err_w2, spu_ifu_int_w2, spu_ifu_ttype_tid_w2, 
   lsu_ifu_inj_ack, ffu_ifu_ecc_ce_w2, ffu_ifu_ecc_ue_w2, 
   ffu_ifu_inj_ack, ffu_ifu_tid_w2, exu_ifu_ecc_ce_m, 
   exu_ifu_ecc_ue_m, exu_ifu_inj_ack, ifq_erb_ue_rep, ifq_erb_ce_rep, 
   ifq_erb_l2_ue, ifq_erb_io_ue, ifq_erb_ifet_ce, ifq_erb_l2err_tid, 
   ifq_erb_rdtag_f, ifq_erb_rdinst_f, ifq_erb_asi_erren_i2, 
   ifq_erb_asi_errstat_i2, ifq_erb_asi_errinj_i2, 
   ifq_erb_asi_erraddr_i2, ifq_erb_asi_imask_i2, ifq_erb_asiwr_i2, 
   ifq_fcl_asird_bf, ifq_erb_fwdrd_bf, ifq_erb_asidata_i2, 
   ifq_erb_asiway_f
   );

   input        rclk, 
                se, 
                si,
                arst_l,
                grst_l;

   input [2:0]  erd_erc_tte_pgsz;

   input [3:0]  icv_itlb_valid_f;

   input        fcl_erb_ievld_s1,
		            fcl_erb_tevld_s1,
		            fcl_erb_immuevld_s1;

   input        fcl_erb_inst_issue_d;
   input        fcl_erb_inst_vld_d1;
   
   input        ifu_tlu_inst_vld_w;

   input [1:0]  ifu_lsu_thrid_s,
		            fcl_erb_asi_tid_f,
		            ifq_fcl_asi_tid_bf;
   
   input [3:0]  fcl_erb_clear_iferr;

   input        fcl_erb_itlbrd_vld_s,
		            fcl_erb_itlbrd_data_s;	
   
   input [3:0]  erd_erc_tagpe_s1;
   input        erd_erc_nirpe_s1,
		            erd_erc_fetpe_s1;
   input [1:0]  erd_erc_tlbt_pe_s1,
		            erd_erc_tlbd_pe_s1;

   input [3:0]  tlu_lsu_pstate_priv;
   input [3:0]  tlu_hpstate_priv;   

   input        lsu_ifu_dtlb_data_su,
		            lsu_ifu_dtlb_data_ue,
		            lsu_ifu_dtlb_tag_ue,
		            lsu_ifu_dcache_data_perror,
		            lsu_ifu_dcache_tag_perror,
		            lsu_ifu_l2_unc_error,
		            lsu_ifu_l2_corr_error,
		            lsu_ifu_io_error;
   input [1:0]  lsu_ifu_error_tid;

   input        spu_ifu_unc_err_w1,  // 1 cycle earlier for timing reasons
                spu_ifu_mamem_err_w1,// 1 cycle earlier for timing reasons
                spu_ifu_corr_err_w2,
                spu_ifu_int_w2;
   
   input [1:0]  spu_ifu_ttype_tid_w2;

   input [3:0]  lsu_ifu_inj_ack;

   input        ffu_ifu_ecc_ce_w2;
   input        ffu_ifu_ecc_ue_w2;
   input        ffu_ifu_inj_ack;
   input [1:0]  ffu_ifu_tid_w2;
   
   input        exu_ifu_ecc_ce_m,
		            exu_ifu_ecc_ue_m;
   input        exu_ifu_inj_ack;
   
   input        ifq_erb_ue_rep;
   input        ifq_erb_ce_rep;
   input        ifq_erb_l2_ue;
   input        ifq_erb_io_ue;
   input        ifq_erb_ifet_ce;
   input [1:0]  ifq_erb_l2err_tid;

   input        ifq_erb_rdtag_f;
   input        ifq_erb_rdinst_f;
   input        ifq_erb_asi_erren_i2;
   input        ifq_erb_asi_errstat_i2;
   input        ifq_erb_asi_errinj_i2;
   input        ifq_erb_asi_erraddr_i2;
   input        ifq_erb_asi_imask_i2;
   input        ifq_erb_asiwr_i2;
   input        ifq_fcl_asird_bf;
   input        ifq_erb_fwdrd_bf;
   input [31:0] ifq_erb_asidata_i2;
   input [1:0]  ifq_erb_asiway_f;

   output       erc_erd_pgsz_b0;
   output       erc_erd_pgsz_b1;

   output       ifu_lsu_asi_rd_unc;
   output [1:0] ifu_lsu_ldxa_tid_w2;
   output       ifu_lsu_ldxa_data_vld_w2;
   output       ifu_lsu_fwd_data_vld;
   output [3:0] ifu_lsu_error_inj;

   output [7:0] ifu_exu_ecc_mask;
   output       ifu_exu_inj_irferr;
   output       ifu_ffu_inj_frferr;
   
   output       ifu_exu_nceen_e;
   output [3:0] ifu_lsu_nceen;
   output [3:0] ifu_spu_nceen;  //  copy going north

   output [3:0] erb_fcl_spu_uetrap;

   output       erb_ifq_itlberr_s1;
   output       erb_ifq_ifeterr_d1;
   output       erb_dtu_ifeterr_d1;
   output       erb_fcl_itlb_ce_d1;
   output [3:0] erb_fcl_ce_trapvec;
   output [3:0] erb_fcl_ue_trapvec;   
   output [3:0] erb_fcl_ifet_uevec_d1;

   output [22:0] erc_erd_errstat_asidata;
   output [31:0] erc_erd_errinj_asidata;
   output [1:0]  erc_erd_erren_asidata; 

   // mux selects
   output [3:0]  erc_erd_eadr0_sel_irf_l,
		             erc_erd_eadr0_sel_itlb_l,
		             erc_erd_eadr0_sel_frf_l,
		             erc_erd_eadr0_sel_lsu_l;

   output [3:0]  erc_erd_asiway_s1_l;
   
   output [3:0]  erc_erd_eadr1_sel_pcd1_l,
		             erc_erd_eadr1_sel_l1pa_l,
		             erc_erd_eadr1_sel_l2pa_l,
		             erc_erd_eadr1_sel_other_l;
   
   output [3:0]  erc_erd_eadr2_sel_mx1_l,
		             erc_erd_eadr2_sel_wrt_l,
		             erc_erd_eadr2_sel_mx0_l,
		             erc_erd_eadr2_sel_old_l;

   output [3:0]  erc_erd_asi_thr_l;

   output        erc_erd_asisrc_sel_icd_s_l,  
		             erc_erd_asisrc_sel_misc_s_l,
		             erc_erd_asisrc_sel_err_s_l,
		             erc_erd_asisrc_sel_itlb_s_l;

   output        erc_erd_errasi_sel_en_l,
		             erc_erd_errasi_sel_stat_l,
		             erc_erd_errasi_sel_inj_l,
		             erc_erd_errasi_sel_addr_l;

   output        erc_erd_miscasi_sel_ict_l,
		             erc_erd_miscasi_sel_imask_l,
		             erc_erd_miscasi_sel_other_l;

   output        erc_erd_ld_imask;
   output        erb_reset,
                 so;

   // Local Signals

   wire          spu_unc_err_w2,
                 spu_mamem_err_w2;
   
   wire          lsu_dtlb_data_su,        
		             lsu_dtlb_data_ue,        
		             lsu_dtlb_tag_ue,         
		             lsu_dcache_data_perror,  
		             lsu_dcache_tag_perror,   
		             lsu_l2_unc_error,        
		             lsu_l2_corr_error,       
		             lsu_io_error;            
   wire [1:0]    lsu_error_tid;           
   
   wire [3:0]    valid_s1;

   wire [1:0]    tid_d,
                 ffu_tid_w3,
                 l2ierr_tid,
                 spu_tid_w2,
                 asi_tid_w2,
		             asi_tid_s1;
   
   wire [3:0]    thr_e,
                 thr_d,
		             thr_d1,
		             thr_m,
		             thr_w,
                 ffu_thr_w3,
		             asi_thr_s,
                 asi_thr_w2,
		             asi_thr_i2,
		             thr_lsu_err,
                 thr_spu_err,
		             thr_l2ie;
   
   wire          itlb_feterr_s1,
		             tlb_feterr_d1,
                 itlb_errtr_s1_l,
                 itlb_errtr_d1_l;
   
   wire          tlb_fet_ce_d1,
		             tlb_fet_ue_d1;
   
   wire [3:0]    alltag_err_s1;
   
   wire          itlb_tagerr_s1,
		             itlb_dataerr_s1,
		             insterr_d1,
                 insterr_s1,
		             insterr_qual_d1,
		             ictagerr_s1,
		             ictagerr_d1,
		             ictagerr_qual_d1;

   wire          asi_daterr_d1,
		             asi_tagerr_d1,
		             asi_rd_err_d1;

   wire          asi_ttevld_s1,
		             asi_tdevld_s1;
   
   wire [3:0]    any_tlbasi_err;

   wire [3:0]    dmdu,
		             dmdu_nxt,
		             dmsu,
		             dmsu_nxt,
		             dmt,
		             dmt_nxt,
		             ddc,
		             ddc_nxt,
		             dtc,
		             dtc_nxt,
		             ldau,
		             ldau_nxt,
		             ncu,
		             ncu_nxt,
                 mau,
                 mau_nxt,
		             any_lsu_err,
		             any_lsu_ue,
		             any_lsu_ce,
                 any_spu_ce,
                 any_spu_ue,
		             imt,
		             imt_nxt,
		             frc,
		             frc_nxt,
		             irc,
		             irc_nxt,
		             fru,
		             fru_nxt,
		             iru,
		             iru_nxt,
		             any_rf_err,
		             any_rf_ce,
		             any_rf_ue,
		             any_irf_err,
		             any_frf_err,
		             idc,
		             idc_nxt,
		             itc,
		             itc_nxt,
		             imdu,
		             imdu_nxt,
		             any_err_vld,
		             any_ue_vld,
//		             any_ce_vld,
		             early_idc,
		             early_idc_nxt,
		             early_itc,
		             early_itc_nxt,
		             early_imdu,
		             early_imdu_nxt,
		             early_ldau,
		             early_ldau_nxt,
		             early_ncu,
		             early_ncu_nxt,
		             early_l2ce,
		             early_l2ce_nxt,
		             any_ifu_ce,
		             any_ifu_ue,
		             any_ifu_err,
		             any_iferr_vld;

   wire [3:0]    meu,
		             meu_nxt,
		             mec,
		             mec_nxt,
		             priv,
		             priv_nxt,
		             early_meu,
		             early_meu_nxt,
		             early_mec,
		             early_mec_nxt,
		             early_priv,
		             early_priv_nxt;

   wire [22:0]   err_stat0,
		             err_stat1,
		             err_stat2,
		             err_stat3;

   wire [3:0]    ifet_ce_vld,
                 ifet_ue_vld;

   wire [3:0]    l2if_unc_err,
		             l2if_corr_err;

   wire [3:0]    ce_trapvec,
		             ue_trapvec,
		             ifu_ce_trap;

   wire          wrt_errinj_i2;
   wire [7:0]    ecc_mask,
		             ecc_mask_nxt;

   wire [1:0]    errinj_ctl,
		             errinj_ctl_nxt;
   wire [5:0]    errinj_vec,
		             errinj_vec_nxt,
		             corr_errinj_vec;
   
//   wire [3:0]    icache_pa_err_d1;

   wire          irf_ce_w,
                 irf_ce_unq,
		             irf_ue_w,
                 irf_ue_unq;

   wire [3:0]    sel_lsu_err,
		             sel_ifuspu_err,
		             sel_rftlb_err;

   wire          clr_err_qual_e,
                 clr_elyff_e,
                 clr_elyff_m,
                 clr_elyff_w;
   
   wire [3:0]    early_err_vec_e,
		             clear_ely_reg_w,
		             mov_ely_reg_w;

   wire [3:0]    clear_iferr_d1;

   wire [1:0]    asi_way_s1;
   wire [3:0]    dec_asiway_s1;

   wire [3:0]    asi_wrt_err_stat,
		             asi_wrt_err_en,
//		             asi_wrt_err_inj,
		             asi_wrt_err_addr;
   
   wire          dmdu_wrt_data,
		             dmsu_wrt_data,
		             imdu_wrt_data,
		             idc_wrt_data,
		             itc_wrt_data,
		             ddc_wrt_data,
		             dtc_wrt_data,
		             imt_wrt_data,
		             dmt_wrt_data,
		             ldau_wrt_data,
		             ncu_wrt_data,
                 mau_wrt_data,
		             fru_wrt_data,
		             frc_wrt_data,
		             iru_wrt_data,
		             irc_wrt_data,
		             meu_wrt_data,
		             mec_wrt_data,
		             priv_wrt_data;

   wire          nceen_wrt_data,
		             ceen_wrt_data;

   wire [3:0]    ceen,
		             ceen_nxt,
		             nceen,
		             nceen_nxt;

   wire          nceen_d;

   wire          rdtag_s,
		             rdinst_s,
		             asi_erren_f,
		             asi_errstat_f,
		             asi_errinj_f,
		             asi_erraddr_f,
		             asi_imask_f,
		             asi_erren_s,
		             asi_errstat_s,
		             asi_errinj_s,
		             asi_erraddr_s,
		             asi_imask_s;

   wire          asird_f,
		             asird_s;
   wire          fwdrd_f,
                 fwdrd_s,
                 asifwd_rd_s,
                 rdinst_f,
                 fwdrd_d;
   
   wire          ldxa_data_vld_s,
                 ldxa_data_vld_d;

   wire          err_asi_s;
   wire          erb_reset_l;

   wire          ffu_ce_w3;
   wire          ffu_ue_w3;   

   wire [3:0] 	 any_lsu_ue_priv_state;
   wire [3:0] 	 any_priv_state;
   
   wire          clk;
   
   
//   
// Code Begins Here
//
   assign        clk = rclk;
   
   // reset buffer
   dffrl_async rstff(.din (grst_l),
                     .q   (erb_reset_l),
                     .clk (clk), .se(se), .si(), .so(),
                     .rst_l (arst_l));

   assign       erb_reset = ~erb_reset_l;


   
   // need to encode page size before sending it back
   assign erc_erd_pgsz_b0 = (erd_erc_tte_pgsz[2] | 
	                            erd_erc_tte_pgsz[1] | 
                              erd_erc_tte_pgsz[0]);

   assign erc_erd_pgsz_b1 = (~erd_erc_tte_pgsz[2] & 
	                           erd_erc_tte_pgsz[1]);
   

   // Don't need this with SPARC_HPV_EN
   // default to tte_lock_d1 = 0
   // 05/30/03: tlb correctible errors disabled.
   // so treat as if lock = 1 and force ue.
//   dff #(1) lk_ff(.din (erd_erc_tte_lock_s1),
//		              .q   (tte_lock_d1),
//		              .clk (clk), .se(se), .si(), .so());

//-----------------------
// Basic pipeline signals
//-----------------------
   // thr_s1 also contains asi tid
   dff_s #(2) tidd_reg(.din (ifu_lsu_thrid_s),
		                 .q   (tid_d),
		                 .clk (clk), .se(se), .si(), .so());

   assign thr_d[0] = ~tid_d[1] & ~tid_d[0];
   assign thr_d[1] = ~tid_d[1] &  tid_d[0];
   assign thr_d[2] =  tid_d[1] & ~tid_d[0];
   assign thr_d[3] =  tid_d[1] &  tid_d[0];

   dff_s #(4) thre_reg(.din (thr_d),
		                 .q   (thr_e),
		                 .clk (clk), .se(se), .si(), .so());
   assign thr_d1 = thr_e;

   dff_s #(4) thrm_reg(.din (thr_e),
		                 .q   (thr_m),
		                 .clk (clk),  .se(se), .si(), .so());
   dff_s #(4) thrw_reg(.din (thr_m),
		                 .q   (thr_w),
		                 .clk (clk),  .se(se), .si(), .so());


//-----------------------------
// lsu flops (added for timing)
//-----------------------------
   // all the lsu signals go to the final mux in the errdp, to help
   // with timing.  This is no longer necessary, in fact it is no
   // longer desired, since we have added the flop below to stage all
   // the lsu signals.  However, the design is not changed, to save
   // the extra effort in physical composition to rip up the errdp.
   dff_s #(10) lspipe_reg(.din ({lsu_ifu_dtlb_data_su,        
                               lsu_ifu_dtlb_data_ue,        
                               lsu_ifu_dtlb_tag_ue,         
                               lsu_ifu_dcache_data_perror,  
                               lsu_ifu_dcache_tag_perror,   
                               lsu_ifu_l2_unc_error,        
                               lsu_ifu_l2_corr_error,       
                               lsu_ifu_io_error,            
                               lsu_ifu_error_tid[1:0]}),
                        .q   ({lsu_dtlb_data_su,        
                               lsu_dtlb_data_ue,        
                               lsu_dtlb_tag_ue,         
                               lsu_dcache_data_perror,  
                               lsu_dcache_tag_perror,   
                               lsu_l2_unc_error,        
                               lsu_l2_corr_error,       
                               lsu_io_error,            
                               lsu_error_tid[1:0]}),
                        .clk (clk), .se(se), .si(), .so());

   assign any_priv_state = tlu_lsu_pstate_priv | tlu_hpstate_priv;
   
   //Bug 6821: added so that lsu ue's errors pickup the delayed priv level
   dff_s #(4) lsu_priv_reg(.din (any_priv_state),
                        .q   (any_lsu_ue_priv_state),
                        .clk (clk), .se(se), .si(), .so());
   
   // thread from lsu
   assign thr_lsu_err[0] = ~lsu_error_tid[1] & ~lsu_error_tid[0];
   assign thr_lsu_err[1] = ~lsu_error_tid[1] &  lsu_error_tid[0];
   assign thr_lsu_err[2] =  lsu_error_tid[1] & ~lsu_error_tid[0];
   assign thr_lsu_err[3] =  lsu_error_tid[1] &  lsu_error_tid[0];

   // thread from spu
   // From Farnad: tid is ready several cycles before everything else.
   // In the ifu, I will assume 1 cycle before
   dff_s #(2) sptid_reg(.din (spu_ifu_ttype_tid_w2),
                      .q   (spu_tid_w2),
                      .clk (clk), .se(se), .so(), .si());
   
   dff_s #(2) spe1_reg(.din ({spu_ifu_unc_err_w1, 
                            spu_ifu_mamem_err_w1}),
                      .q   ({spu_unc_err_w2,
                             spu_mamem_err_w2}),
                      .clk (clk), .se(se), .so(), .si());

   assign thr_spu_err[0] = ~spu_tid_w2[1] & ~spu_tid_w2[0];
   assign thr_spu_err[1] = ~spu_tid_w2[1] &  spu_tid_w2[0];
   assign thr_spu_err[2] =  spu_tid_w2[1] & ~spu_tid_w2[0];
   assign thr_spu_err[3] =  spu_tid_w2[1] &  spu_tid_w2[0];

   // thread from ifq
   dff_s #(2) ifqthr_reg(.din (ifq_erb_l2err_tid),
                       .q   (l2ierr_tid),
                       .clk (clk), .se(se), .so(), .si());
   
   assign thr_l2ie[0] = ~l2ierr_tid[1] & ~l2ierr_tid[0];
   assign thr_l2ie[1] = ~l2ierr_tid[1] &  l2ierr_tid[0];
   assign thr_l2ie[2] =  l2ierr_tid[1] & ~l2ierr_tid[0];
   assign thr_l2ie[3] =  l2ierr_tid[1] &  l2ierr_tid[0];
   
   
//---------------------------------------
// Error Detection -- icache errors
//---------------------------------------
   // itlb inst fetch errors
   assign itlb_feterr_s1 = (erd_erc_tlbd_pe_s1[0] ^ erd_erc_tlbd_pe_s1[1]) & 
			                       fcl_erb_immuevld_s1;
   assign erb_ifq_itlberr_s1 = itlb_feterr_s1 & nceen_d;
   dff_s #(1) itfete_ff(.din (itlb_feterr_s1),
		                  .q   (tlb_feterr_d1),
		                  .clk (clk), .se(se), .si(), .so());

   assign itlb_errtr_s1_l = ~erb_ifq_itlberr_s1;
   dff_s #(1) itume_ff(.din (itlb_errtr_s1_l),
		                 .q   (itlb_errtr_d1_l),
		                 .clk (clk), .se(se), .si(), .so());
   
//   assign tlb_fet_ce_d1 = tlb_feterr_d1 & ~tte_lock_d1;
//   assign tlb_fet_ue_d1 = tlb_feterr_d1 & tte_lock_d1;
   assign tlb_fet_ce_d1 = 1'b0;
   assign tlb_fet_ue_d1 = tlb_feterr_d1;
   

   // instruction errors
//   assign insterr_s1 = (erd_erc_nirpe_s1 | erd_erc_fetpe_s1) & 
//			                   fcl_erb_ievld_s1;
//   dff #(1)  inserr_ff(.din (insterr_s1),
//		                   .q   (insterr_d1),
//		                   .clk (clk), .se(se), .si(), .so());

   assign insterr_s1 = (erd_erc_fetpe_s1 | erd_erc_nirpe_s1) &
                         fcl_erb_ievld_s1;
   
   dff_s #(1)  feterr_ff(.din (insterr_s1),
		                   .q   (insterr_d1),
		                   .clk (clk), .se(se), .si(), .so());
//   dff #(1)  nirerr_ff(.din (erd_erc_nirpe_s1),
//		                   .q   (nirpe_d1),
//		                   .clk (clk), .se(se), .si(), .so());
//   dff #(1)  ievld1_ff(.din (fcl_erb_ievld_s1),
//		                   .q   (ievld_d1),
//		                   .clk (clk), .se(se), .si(), .so());

   assign insterr_qual_d1 = insterr_d1 & ~tlb_feterr_d1;

   // tag errors
   dff_s #(4)  vld_reg(.din (icv_itlb_valid_f),
		                 .q   (valid_s1),
		                 .clk (clk), .se(se), .si(), .so());
   assign alltag_err_s1 = erd_erc_tagpe_s1 & valid_s1;

   assign ictagerr_s1 = (|alltag_err_s1[3:0]) & fcl_erb_tevld_s1;
   dff_s #(1)  itagerr_ff(.din (ictagerr_s1),
		                    .q   (ictagerr_d1),
		                    .clk (clk), .se(se), .si(), .so());

   assign  ictagerr_qual_d1 = ictagerr_d1 & ~insterr_d1 & 
	                            ~tlb_feterr_d1;

   // Corrective action for IFU errors
   // force an imiss if there is a inst/tag parity error
   assign  erb_ifq_ifeterr_d1 = (ictagerr_d1 | insterr_d1) & itlb_errtr_d1_l;

   // moved qualification with inst_vld_d1 to the dtu.
   assign  erb_dtu_ifeterr_d1 = erb_ifq_ifeterr_d1;
   //assign  erb_dtu_ifeterr_d1 = erb_ifq_ifeterr_d1 & fcl_erb_inst_vld_d1;
//   assign  icache_pa_err_d1 = {4{ictagerr_d1 | insterr_d1}} & thr_d1;

   // force a tlbmiss if there is a correctible tlb data parity error
   assign  erb_fcl_itlb_ce_d1 = tlb_fet_ce_d1;

   // take a precise trap if there is an uncorrectible error
   assign  erb_fcl_ifet_uevec_d1 = ({4{tlb_fet_ue_d1 & fcl_erb_inst_vld_d1}} & 
				                            thr_d1  | 
				                            {4{ifq_erb_l2_ue | ifq_erb_io_ue}} & 
				                            thr_l2ie) & nceen;

   // errors in ifetch to l2 or iob
   assign  l2if_unc_err = {4{ifq_erb_l2_ue | ifq_erb_io_ue}} & thr_l2ie;
   assign  l2if_corr_err = {4{ifq_erb_ifet_ce}} & thr_l2ie;
   
   
//-------------------------------------
// Error Detection -- itlb asi errors
//-------------------------------------   
   assign  itlb_tagerr_s1 = (erd_erc_tlbt_pe_s1[0] ^ erd_erc_tlbt_pe_s1[1]) & 
			                        asi_ttevld_s1;
   assign  itlb_dataerr_s1 = (erd_erc_tlbd_pe_s1[0] ^ erd_erc_tlbd_pe_s1[1]) & 
			                         asi_tdevld_s1;

   dff_s #(1) itdate_ff(.din (itlb_dataerr_s1),
		                  .q   (asi_daterr_d1),
		                  .clk (clk), .se(se), .si(), .so());
   dff_s #(1) ittage_ff(.din (itlb_tagerr_s1),
		                  .q   (asi_tagerr_d1),
		                  .clk (clk), .se(se), .si(), .so());

   assign  asi_rd_err_d1 = asi_daterr_d1 | asi_tagerr_d1;
   assign  ifu_lsu_asi_rd_unc = asi_rd_err_d1;
   
   assign  any_tlbasi_err = {4{asi_rd_err_d1}} & asi_thr_w2;


//------------------------------
// RF errors
//------------------------------   
   dff_s #(1) irfu_ff(.din (exu_ifu_ecc_ue_m),
		                .q   (irf_ue_unq),
		                .clk (clk), .se (se), .si(), .so());
   dff_s #(1) irfc_ff(.din (exu_ifu_ecc_ce_m),
		                .q   (irf_ce_unq),
		                .clk (clk), .se (se), .si(), .so());
   assign  irf_ce_w = irf_ce_unq & ifu_tlu_inst_vld_w;
   assign  irf_ue_w = irf_ue_unq & ifu_tlu_inst_vld_w;
   
//------------------
// Error Logging
//------------------
   // List of all logged errors
   // itlbt  u
   // itlbd  u/c
   // ict  c
   // icd  c
   // irf  c/u
   // frf  c/u
   // dtlb d/t u
   // dct  c
   // dcd  c
   // mau  u
   // l2-d u
   // l2-i u
   // dram u -- not any more
   // io   u
   //
   // Errors not logged but causing a trap
   // l2-d c
   // l2-i c
   // l2-s c
   // 

   // latest errors have highest priority
   // lsu is latest and sometimes asynchronous
   // spu has low priority
   // irf/frf are always "current"
   // ifu errors are speculative ("early")
   // All lsu errors are prioritised at the source
   assign  dmdu_nxt =  {4{lsu_dtlb_data_ue & ~erb_reset}} & thr_lsu_err &
		                    ~any_ue_vld |
	                      dmdu & ~({4{dmdu_wrt_data}} & asi_wrt_err_stat);
   // 6310
   assign  dmsu_nxt =  {4{lsu_dtlb_data_su & ~erb_reset}} & thr_lsu_err &
		                   ~any_ue_vld |
	                     dmsu & ~({4{dmsu_wrt_data}} & asi_wrt_err_stat);
   assign  dmt_nxt =  {4{lsu_dtlb_tag_ue & ~erb_reset}} & thr_lsu_err &
		                  ~any_ue_vld |
	                    dmt & ~({4{dmt_wrt_data}} & asi_wrt_err_stat);
   assign  ddc_nxt =  {4{lsu_dcache_data_perror & ~erb_reset}} & thr_lsu_err &
		                  ~any_err_vld |
	                    ddc & ~({4{ddc_wrt_data}} & asi_wrt_err_stat);
   assign  dtc_nxt =  {4{lsu_dcache_tag_perror & ~erb_reset}} & thr_lsu_err &
		                  ~any_err_vld |
	                    dtc & ~({4{dtc_wrt_data}} & asi_wrt_err_stat);

   assign  ldau_nxt = (mov_ely_reg_w & early_ldau | 
	                     {4{lsu_l2_unc_error}} & thr_lsu_err |
	                     {4{spu_unc_err_w2}} & thr_spu_err) &
		                    ~any_ue_vld |
	                     ldau & ~({4{ldau_wrt_data}} & asi_wrt_err_stat);

   assign  ncu_nxt = (mov_ely_reg_w & early_ncu |  
	                    {4{lsu_io_error}} & thr_lsu_err) &
		                   ~any_ue_vld |
 	                   ncu & ~({4{ncu_wrt_data}} & asi_wrt_err_stat);

   assign  any_lsu_ue = thr_lsu_err & {4{lsu_dtlb_data_ue |
                                         lsu_dtlb_data_su |
					                               lsu_dtlb_tag_ue |
					                               lsu_l2_unc_error |
					                               lsu_io_error}};

   assign  any_lsu_ce = thr_lsu_err & 
	                      {4{(lsu_dcache_data_perror |
			                      lsu_dcache_tag_perror |
			                      lsu_l2_corr_error) &
                           ~lsu_dtlb_data_ue & 
                           ~lsu_dtlb_data_su}};

   assign  any_lsu_err = (any_lsu_ue |
			                    thr_lsu_err & {4{lsu_dcache_data_perror |
					                                 lsu_dcache_tag_perror}});

   // MAmem parity error
   assign mau_nxt = {4{spu_mamem_err_w2}} & thr_spu_err & 
                    ~any_ue_vld |
                    mau &  ~({4{mau_wrt_data}} & asi_wrt_err_stat);

   assign any_spu_ce = {4{spu_ifu_corr_err_w2 & ~spu_unc_err_w2}} & thr_spu_err;
   assign any_spu_ue = {4{spu_unc_err_w2 |
                          spu_mamem_err_w2}} & thr_spu_err;
				 
   // tlb asi read error
   assign imt_nxt =  {4{asi_tagerr_d1 & ~erb_reset}} & asi_thr_w2 &
		                 ~any_ue_vld |
	                   imt & ~({4{imt_wrt_data}} & asi_wrt_err_stat);

   dff_s #(2) ffu_err_reg(.din ({ffu_ifu_ecc_ce_w2,
                               ffu_ifu_ecc_ue_w2}),
                        .q   ({ffu_ce_w3,
                               ffu_ue_w3}),
                        .clk (clk), .se(se), .si(), .so());

   dff_s #(2) fptid_reg(.din (ffu_ifu_tid_w2[1:0]),
		                  .q   (ffu_tid_w3[1:0]),
		                  .clk (clk),  .se(se), .si(), .so());

   assign ffu_thr_w3[0] = ~ffu_tid_w3[1] & ~ffu_tid_w3[0];
   assign ffu_thr_w3[1] = ~ffu_tid_w3[1] &  ffu_tid_w3[0];
   assign ffu_thr_w3[2] =  ffu_tid_w3[1] & ~ffu_tid_w3[0];
   assign ffu_thr_w3[3] =  ffu_tid_w3[1] &  ffu_tid_w3[0];
   
   
   // regfile error
   //Bug6420: log frc and irc bits as well when fru and iru are detected simulatneously
   assign frc_nxt =  {4{ffu_ce_w3 & ~erb_reset}} &    
	              ffu_thr_w3 & ~any_err_vld & ~any_lsu_err |
	              frc & ~({4{frc_wrt_data}} & asi_wrt_err_stat);
   
   assign fru_nxt =  {4{ffu_ue_w3 & ~erb_reset}} & ffu_thr_w3 &
		            ~any_ue_vld & ~any_lsu_ue |
	              fru & ~({4{fru_wrt_data}} & asi_wrt_err_stat);

   //Bug6420
   assign irc_nxt =  {4{irf_ce_w & ~erb_reset}} & thr_w &   
		                ~any_err_vld & ~any_lsu_err |
	                  irc & ~({4{irc_wrt_data}} & asi_wrt_err_stat);
   
   assign iru_nxt =  {4{irf_ue_w & ~erb_reset}} & thr_w &
		               ~any_ue_vld & ~any_lsu_ue |
	                 iru & ~({4{iru_wrt_data}} & asi_wrt_err_stat);

   assign any_irf_err = thr_w & {4{irf_ce_w | irf_ue_w}};
   assign any_frf_err = ffu_thr_w3 & {4{ffu_ce_w3 | ffu_ue_w3}};

   //Bug6420
   assign any_rf_ce = thr_w & {4{irf_ce_w}} |
	                    ffu_thr_w3 & {4{ffu_ce_w3}};
   assign any_rf_ue = thr_w & {4{irf_ue_w}} |
	                    ffu_thr_w3 & {4{ffu_ue_w3}};
   assign any_rf_err = any_irf_err | any_frf_err;


   // ifu errors
   assign idc_nxt =  mov_ely_reg_w & ~any_err_vld & early_idc |
	              idc & ~({4{idc_wrt_data}} & asi_wrt_err_stat);
   
   assign itc_nxt =  mov_ely_reg_w & ~any_err_vld & early_itc | 
	             itc & ~({4{itc_wrt_data}} & asi_wrt_err_stat);

   // bug 6310
   assign imdu_nxt =  (mov_ely_reg_w & early_imdu |
		                   {4{asi_daterr_d1 & ~erb_reset}} & asi_thr_w2) &
                        ~any_ue_vld |
	                    imdu & ~({4{imdu_wrt_data}} & asi_wrt_err_stat);
   
//   assign imdc_nxt =  mov_ely_reg_w & ~any_err_vld & early_imdc |
//	                    imdc & ~({4{imdc_wrt_data}} & asi_wrt_err_stat);
   
   dff_s #(64) errvec_reg(.din ({imt_nxt, imdu_nxt, idc_nxt, itc_nxt, 
			                         iru_nxt, irc_nxt, fru_nxt, frc_nxt,
  	                           dmt_nxt, dmdu_nxt, dmsu_nxt, ddc_nxt, dtc_nxt, 
			                         ldau_nxt, ncu_nxt, mau_nxt}),
		                    .q   ({imt, imdu, idc, itc, 
			                         iru, irc, fru, frc,
  	                           dmt, dmdu, dmsu, ddc, dtc, 
			                         ldau, ncu, mau}),
		                    .clk (clk),
		                    .se  (se), .si(), .so());
		      
   assign any_err_vld = imt | imdu | idc | itc | iru | irc | fru | frc |
  	                    dmt | dmdu | dmsu | ddc | dtc | ldau | ncu | mau;

   assign any_ue_vld =  imt | imdu | iru | fru |
  	                    dmt | dmdu | dmsu | ldau | ncu | mau;
   
//   assign any_ce_vld =  imdc | idc | itc | irc | frc |
//  	                dmdc | ddc | dtc;

   // IFU errors
   assign any_ifu_ue = {4{(ifq_erb_l2_ue | ifq_erb_io_ue) & ~erb_reset}} & 
	                     thr_l2ie |
	                     {4{tlb_fet_ue_d1 & ~erb_reset}} & thr_d1;
   
   assign any_ifu_ce = {4{ifq_erb_ifet_ce & ~erb_reset}} & thr_l2ie |
	                     {4{(tlb_fet_ce_d1 | insterr_qual_d1 | 
			                     ictagerr_qual_d1) & ~erb_reset}} & 
                       thr_d1;

   assign any_ifu_err = any_ifu_ce | any_ifu_ue;
   

   assign ifet_ce_vld = early_idc | early_itc | early_l2ce;
   assign ifet_ue_vld = early_imdu | early_ldau | early_ncu;

   // l2ce's are not logged in sparc, so leave them out
   assign any_iferr_vld = ifet_ue_vld | early_idc | early_itc;   

   // Early errors
   assign early_idc_nxt = {4{insterr_qual_d1}} & thr_d1 &
	                  ~any_iferr_vld & ~any_rf_err & ~any_lsu_err |
	                  early_idc & ~clear_iferr_d1 &
	                  ~mov_ely_reg_w;
   
   assign early_itc_nxt =  {4{ictagerr_qual_d1}} & thr_d1 &
		                ~any_iferr_vld & ~any_rf_err & ~any_lsu_err |
	                  early_itc & ~clear_iferr_d1 &
	                  ~mov_ely_reg_w;	  

   assign early_imdu_nxt =  {4{tlb_fet_ue_d1}} & thr_d1 &
		                 ~ifet_ue_vld & ~any_rf_ue & ~any_lsu_ue |
	                   early_imdu & ~clear_iferr_d1 &
	                   ~mov_ely_reg_w;
	  
//   assign early_imdc_nxt =  {4{tlb_fet_ce_d1}} & thr_d1 &
//		                 ~any_iferr_vld & ~any_rf_err & ~any_lsu_err |
//	                   early_imdc & ~clear_iferr_d1 &
//	                   ~mov_ely_reg_w;

   assign early_ldau_nxt = {4{ifq_erb_l2_ue & ~erb_reset}} & thr_l2ie & 
	                   ~ifet_ue_vld & ~any_rf_ue & ~any_lsu_ue |
	                   early_ldau & ~clear_iferr_d1 &
	                   ~mov_ely_reg_w;
   
   assign early_ncu_nxt = {4{ifq_erb_io_ue & ~erb_reset}} & thr_l2ie & 
	                   ~ifet_ue_vld & ~any_rf_ue & ~any_lsu_ue |
	                   early_ncu & ~clear_iferr_d1 &
	                   ~mov_ely_reg_w;

   assign early_l2ce_nxt =  {4{ifq_erb_ifet_ce}} & thr_l2ie &
		                 ~any_iferr_vld & ~any_rf_err & ~any_lsu_err |
	                   early_l2ce & ~clear_iferr_d1 &
	                   ~mov_ely_reg_w;
   
   dffr_s #(24) elyerr_reg(.din ({early_idc_nxt, 
			                          early_itc_nxt, 
			                          early_imdu_nxt,
			                          early_ldau_nxt,
			                          early_ncu_nxt,
			                          early_l2ce_nxt}),
		                     .q   ({early_idc,
			                          early_itc,
			                          early_imdu,
			                          early_ldau,
			                          early_ncu,
			                          early_l2ce}),
		                     .clk (clk),
		                     .rst (erb_reset),
		                     .se  (se), .si(), .so());

   // Multipl errors
   assign meu_nxt = any_ue_vld & (any_lsu_ue | any_rf_ue | any_tlbasi_err |
                                  any_spu_ue |
		                              mov_ely_reg_w & ifet_ue_vld) |
// known bug - wontfix                            
//                                    mov_ely_reg_w & early_meu |
                    meu & ~({4{meu_wrt_data}} & asi_wrt_err_stat);

   assign mec_nxt = any_err_vld & (any_lsu_ce | any_rf_ce |
		                               mov_ely_reg_w & ifet_ce_vld) |
// known bug - wontfix                     
//                     mov_ely_reg_w & early_mec |
	                  mec & ~({4{mec_wrt_data}} & asi_wrt_err_stat);

   //Bug6821
   assign priv_nxt = 	  ~any_err_vld & (any_lsu_ue_priv_state & any_lsu_ue | 
					  any_priv_state & (any_lsu_ce | any_rf_err | any_tlbasi_err) |
					  mov_ely_reg_w & early_priv) |
			  priv & ~({4{priv_wrt_data}} & asi_wrt_err_stat);
   
   dffr_s #(12) me_reg(.din ({meu_nxt, 
			                      mec_nxt, 
			                      priv_nxt}),
		                 .q   ({meu,
			                      mec,
			                      priv}),
		                 .clk (clk),
		                 .rst (erb_reset),
		                 .se  (se), .si(), .so());

   // Early multiple errors
   assign early_meu_nxt = any_ifu_ue & ifet_ue_vld | 
	                  early_meu & ~clear_iferr_d1 & ~mov_ely_reg_w;

   assign early_mec_nxt = any_ifu_ce & any_iferr_vld |
	                  early_mec & ~clear_iferr_d1 & ~mov_ely_reg_w;

   // bug 6155 & 6821
   assign early_priv_nxt = any_priv_state & ~any_iferr_vld & ~any_rf_err & ~any_lsu_err & any_ifu_err |
	                   early_priv & ~clear_iferr_d1 & ~mov_ely_reg_w;
   
   dffr_s #(12) elyme_reg(.din ({early_meu_nxt, 
			                         early_mec_nxt, 
			                         early_priv_nxt}),
		                    .q   ({early_meu,
			                         early_mec,
			                         early_priv}),
		                    .clk (clk),
		                    .rst (erb_reset),
		                    .se  (se), .si(), .so());

   // pipeline progress
   dff_s #(1) clre_ff(.din (fcl_erb_inst_issue_d),
                    .q   (clr_elyff_e),
                    .clk (clk), .se(se), .si(), .so());
   assign early_err_vec_e = (any_iferr_vld | early_l2ce) & thr_e;
   assign clr_err_qual_e = (|early_err_vec_e[3:0]) & clr_elyff_e;
   
   dff_s #(1) clrm_ff(.din (clr_err_qual_e),
                    .q   (clr_elyff_m),
                    .clk (clk), .se(se), .si(), .so());
   dff_s #(1) clrw_ff(.din (clr_elyff_m),
                    .q   (clr_elyff_w),
                    .clk (clk), .se(se), .si(), .so());

   // fix for 6142 and 6159
   // delay err reg clear by one cycle to prevent clearing your own errors
   dff_s #(4) clree_reg(.din (fcl_erb_clear_iferr),
                      .q   (clear_iferr_d1),
                      .clk (clk), .se(se), .si(), .so());
   

   assign clear_ely_reg_w = {4{clr_elyff_w}} & thr_w & 
	                          (any_iferr_vld | early_l2ce);  // why again?
   assign mov_ely_reg_w = clear_ely_reg_w & 
                          {4{ifu_tlu_inst_vld_w & ~erb_reset}};


   // asi error status output
   assign err_stat0 = {meu[0], mec[0], priv[0],
		                   3'b100,                    // rw, enc, ma
		                   imdu[0], imt[0], 
		                   dmdu[0], dmt[0],
		                   idc[0], itc[0], ddc[0], dtc[0],
		                   irc[0], iru[0], frc[0], fru[0],
		                   ldau[0], ncu[0],
                       dmsu[0], 1'b0, mau[0]};
   
   assign err_stat1 = {meu[1], mec[1], priv[1],
		                   3'b100,
		                   imdu[1], imt[1], 
		                   dmdu[1], dmt[1],
		                   idc[1], itc[1], ddc[1], dtc[1],
		                   irc[1], iru[1], frc[1], fru[1],
		                   ldau[1], ncu[1],
                       dmsu[1], 1'b0, mau[1]};
   
   assign err_stat2 = {meu[2], mec[2], priv[2],
		                   3'b100,
		                   imdu[2], imt[2], 
		                   dmdu[2], dmt[2],
		                   idc[2], itc[2], ddc[2], dtc[2],
		                   irc[2], iru[2], frc[2], fru[2],
		                   ldau[2], ncu[2],
                       dmsu[2], 1'b0, mau[2]};
   
   assign err_stat3 = {meu[3], mec[3], priv[3],
		                   3'b100,
		                   imdu[3], imt[3], 
		                   dmdu[3], dmt[3],
		                   idc[3], itc[3], ddc[3], dtc[3],
		                   irc[3], iru[3], frc[3], fru[3],
		                   ldau[3], ncu[3],
                       dmsu[3], 1'b0, mau[3]};

   mux4ds #(23) err_stat_asi(.dout (erc_erd_errstat_asidata),
			                       .in0  (err_stat0),
			                       .in1  (err_stat1),
			                       .in2  (err_stat2),
			                       .in3  (err_stat3),
			                       .sel0 (asi_thr_s[0]),
			                       .sel1 (asi_thr_s[1]),
			                       .sel2 (asi_thr_s[2]),
			                       .sel3 (asi_thr_s[3]));

//----------------------------------
// Error Address Selection   
//----------------------------------

   // TBD: Uncorrectible errors have to overwrite correctible errors
   // mux 0
   // FRF errors are mutex with everything else
   // ITLB asi errors are mutex with everything else
   // ASI writes are mutex with everything else
   // only one of these errors could occur at a given time
   assign  erc_erd_eadr0_sel_lsu_l = ~(sel_lsu_err);

   assign  erc_erd_eadr0_sel_irf_l =  ~(~sel_lsu_err & any_irf_err);

   assign  erc_erd_eadr0_sel_itlb_l = ~(~sel_lsu_err & ~any_irf_err & 
					                              any_tlbasi_err);

   assign  erc_erd_eadr0_sel_frf_l = ~(~sel_lsu_err & ~any_irf_err & 
				                               ~any_tlbasi_err);

   // mux 1
   // l1 pa and tlb feterr can be simultaneous
   // TBD: need to reorder and make spu lower priority?
   assign  erc_erd_eadr1_sel_other_l = ~(any_spu_ue);
   
   assign  erc_erd_eadr1_sel_l2pa_l = ~(~any_spu_ue & 
                                        (l2if_unc_err | l2if_corr_err));

   assign  erc_erd_eadr1_sel_pcd1_l = ~(~l2if_unc_err & ~l2if_corr_err & 
					                              ~any_spu_ue & 
                                        thr_d1 & {4{tlb_feterr_d1}});

   assign  erc_erd_eadr1_sel_l1pa_l = ~(~l2if_unc_err & ~l2if_corr_err & 
					                              ({4{~tlb_feterr_d1}} | ~thr_d1) & 
                                        ~any_spu_ue);

//   assign  erc_erd_eadr1_sel_other_l = ~(~l2if_unc_err & ~l2if_corr_err & 
//					                           {4{~tlb_feterr_d1}} & ~icache_pa_err_d1);


   // mux2
   assign sel_lsu_err = ~any_err_vld & any_lsu_err |
	                      ~any_ue_vld & any_lsu_ue;

   assign sel_ifuspu_err = (~any_err_vld & ~any_iferr_vld & any_ifu_err |
                            ~any_ue_vld & any_spu_ue |
			                      ~any_ue_vld & ~ifet_ue_vld & any_ifu_ue);

   assign sel_rftlb_err = ~any_ue_vld & (any_rf_ue |
					                               any_tlbasi_err) |
			                    ~any_err_vld & any_rf_ce;
   
   
   assign  erc_erd_eadr2_sel_wrt_l = ~(asi_wrt_err_addr);

   assign  erc_erd_eadr2_sel_mx0_l = ~(~asi_wrt_err_addr & 
				                               (sel_lsu_err | 
					                              sel_rftlb_err));
   
   assign  erc_erd_eadr2_sel_mx1_l = ~(~sel_lsu_err & 
				                               ~asi_wrt_err_addr &
				                               ~sel_rftlb_err &
				                               sel_ifuspu_err);
   
   assign  erc_erd_eadr2_sel_old_l = ~(~sel_lsu_err & 
				                               ~asi_wrt_err_addr &
				                               ~sel_rftlb_err &
				                               ~sel_ifuspu_err);
   
//-----------------------------
// Error Enable Reg
//-----------------------------
   assign nceen_nxt = asi_wrt_err_en & {4{nceen_wrt_data}} |
	                    ~asi_wrt_err_en & nceen;
   
   assign ceen_nxt = asi_wrt_err_en & {4{ceen_wrt_data}} |
	                   ~asi_wrt_err_en & ceen;

   dffr_s #(8) err_en_reg(.din ({nceen_nxt, ceen_nxt}),
		                    .q   ({nceen, ceen}),
		                    .rst (erb_reset),
		                    .clk (clk), .se(se), .si(), .so());

   assign nceen_d = (thr_d[0] & nceen[0] |
                     thr_d[1] & nceen[1] |
                     thr_d[2] & nceen[2] |
                     thr_d[3] & nceen[3]);
   
   dff_s #(1) nce_ff(.din (nceen_d),
                   .q   (ifu_exu_nceen_e),
                   .clk (clk), .se(se), .si(), .so());

   assign ifu_lsu_nceen = nceen;
   assign ifu_spu_nceen = nceen;

   assign ifu_ce_trap = mov_ely_reg_w & ifet_ce_vld;
   assign ce_trapvec =  (ifu_ce_trap |
			                   any_rf_ce |
			                   {4{ifq_erb_ce_rep}} & thr_l2ie |
                         any_spu_ce |
			                   any_lsu_ce) & ceen;

   dff_s #(4) ceint_reg(.din (ce_trapvec),
		                  .q   (erb_fcl_ce_trapvec),
		                  .clk (clk), .se(se), .si(), .so());

   assign ue_trapvec =  ({4{ifq_erb_ue_rep}} & thr_l2ie |
                         any_spu_ue & {4{spu_ifu_int_w2}}) & nceen;

   assign erb_fcl_spu_uetrap = any_spu_ue & nceen;
   
   dff_s #(4) ueint_reg(.din (ue_trapvec),
		                  .q   (erb_fcl_ue_trapvec),
		                  .clk (clk), .se(se), .si(), .so());


   mux4ds #(2) err_en_asi(.dout (erc_erd_erren_asidata),
			                    .in0  ({nceen[0], ceen[0]}),
			                    .in1  ({nceen[1], ceen[1]}),
			                    .in2  ({nceen[2], ceen[2]}),
			                    .in3  ({nceen[3], ceen[3]}),
			                    .sel0 (asi_thr_s[0]),
			                    .sel1 (asi_thr_s[1]),
			                    .sel2 (asi_thr_s[2]),
			                    .sel3 (asi_thr_s[3]));

//-------------------------
// Error Inject
//-------------------------
   assign wrt_errinj_i2 = (ifq_erb_asi_errinj_i2 & ifq_erb_asiwr_i2);
   assign ecc_mask_nxt =  wrt_errinj_i2 ?  ifq_erb_asidata_i2[7:0] :
                                           ecc_mask[7:0];
   
   assign errinj_ctl_nxt[1:0] = wrt_errinj_i2 ? ifq_erb_asidata_i2[31:30] :
	                                              errinj_ctl[1:0];

   // correct for single shot
   assign errinj_vec_nxt[5:0] = wrt_errinj_i2 ? ifq_erb_asidata_i2[29:24] :
	                              errinj_ctl[0] ? corr_errinj_vec :
	                                              errinj_vec;

   dffr_s #(16) errinj_reg(.din ({errinj_ctl_nxt,
			                          errinj_vec_nxt,
			                          ecc_mask_nxt}),
		                     .q   ({errinj_ctl,
			                          errinj_vec,
			                          ecc_mask}),
		                     .rst (erb_reset),
		                     .clk (clk), .se (se), .si(), .so());
   
   assign ifu_exu_ecc_mask = ecc_mask;
   assign ifu_exu_inj_irferr = errinj_vec[1] & errinj_ctl[1];
   assign ifu_ffu_inj_frferr = errinj_vec[0] & errinj_ctl[1];
   assign ifu_lsu_error_inj[3:0] = errinj_vec[5:2] & {4{errinj_ctl[1]}};

   assign corr_errinj_vec[5:0] = errinj_vec[5:0] & ~{lsu_ifu_inj_ack[3:0], 
						                                         exu_ifu_inj_ack,
						                                         ffu_ifu_inj_ack};
   assign erc_erd_errinj_asidata = {errinj_ctl,
				                            errinj_vec,
				                            16'b0,
				                            ecc_mask};
   
//--------------------------
//  ASI Stuff
//--------------------------

   dff_s #(2) asiways_reg(.din (ifq_erb_asiway_f),
		                    .q   (asi_way_s1),
		                    .clk (clk), .se(se), .si(), .so());

   assign dec_asiway_s1[0] = ~asi_way_s1[1] & ~asi_way_s1[0];
   assign dec_asiway_s1[1] = ~asi_way_s1[1] &  asi_way_s1[0];
   assign dec_asiway_s1[2] =  asi_way_s1[1] & ~asi_way_s1[0];
   assign dec_asiway_s1[3] =  asi_way_s1[1] &  asi_way_s1[0];
   
   assign erc_erd_asiway_s1_l = ~dec_asiway_s1;
   
   assign asi_thr_i2[0] = ~ifq_fcl_asi_tid_bf[1] & ~ifq_fcl_asi_tid_bf[0];
   assign asi_thr_i2[1] = ~ifq_fcl_asi_tid_bf[1] &  ifq_fcl_asi_tid_bf[0];
   assign asi_thr_i2[2] =  ifq_fcl_asi_tid_bf[1] & ~ifq_fcl_asi_tid_bf[0];
   assign asi_thr_i2[3] =  ifq_fcl_asi_tid_bf[1] &  ifq_fcl_asi_tid_bf[0];

   dff_s #(2) asi_tids_reg(.din (fcl_erb_asi_tid_f),
			                    .q   (asi_tid_s1),
			                    .clk (clk), .se(se), .si(), .so());
   dff_s #(2) asi_tidw2_reg(.din (asi_tid_s1),
			                    .q   (asi_tid_w2),
			                    .clk (clk), .se(se), .si(), .so());
   assign ifu_lsu_ldxa_tid_w2 = asi_tid_w2;

   assign erc_erd_asi_thr_l = ~asi_thr_s;

   assign asi_thr_s[0] = ~asi_tid_s1[1] & ~asi_tid_s1[0];
   assign asi_thr_s[1] = ~asi_tid_s1[1] &  asi_tid_s1[0];
   assign asi_thr_s[2] =  asi_tid_s1[1] & ~asi_tid_s1[0];
   assign asi_thr_s[3] =  asi_tid_s1[1] &  asi_tid_s1[0];

   assign asi_thr_w2[0] = ~asi_tid_w2[1] & ~asi_tid_w2[0];
   assign asi_thr_w2[1] = ~asi_tid_w2[1] &  asi_tid_w2[0];
   assign asi_thr_w2[2] =  asi_tid_w2[1] & ~asi_tid_w2[0];
   assign asi_thr_w2[3] =  asi_tid_w2[1] &  asi_tid_w2[0];

   
   // F stage flops
   dff_s #(1) asi_en_ff(.din (ifq_erb_asi_erren_i2),
		                  .q   (asi_erren_f),
		                  .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_stat_ff(.din (ifq_erb_asi_errstat_i2),
		                    .q   (asi_errstat_f),
		                    .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_addr_ff(.din (ifq_erb_asi_erraddr_i2),
		                    .q   (asi_erraddr_f),
		                    .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_inj_ff(.din (ifq_erb_asi_errinj_i2),
		                   .q   (asi_errinj_f),
		                   .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_im_ff(.din (ifq_erb_asi_imask_i2),
		                  .q   (asi_imask_f),
		                  .clk (clk), .se(se), .si(), .so());

   // S stage Flops
   dff_s #(1) asi_ens_ff(.din (asi_erren_f),
		                   .q   (asi_erren_s),
		                   .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_stats_ff(.din (asi_errstat_f),
		                     .q   (asi_errstat_s),
		                     .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_addrs_ff(.din (asi_erraddr_f),
		                     .q   (asi_erraddr_s),
		                     .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_injs_ff(.din (asi_errinj_f),
		                    .q   (asi_errinj_s),
		                    .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asi_ims_ff(.din (asi_imask_f),
		                   .q   (asi_imask_s),
		                   .clk (clk), .se(se), .si(), .so());

   // ASI Reads
   // All ASI reads except TLB
   dff_s #(1) asi_rdf_ff(.din (ifq_fcl_asird_bf),
		                   .q   (asird_f),
		                   .clk (clk), .se(se), .si(), .so());
   dff_s #(1) asi_rds_ff(.din (asird_f),
		                   .q   (asird_s),
		                   .clk (clk), .se(se), .si(), .so());

   // fwd reads
   dff_s #(1) fwd_rdf_ff(.din (ifq_erb_fwdrd_bf),
		                   .q   (fwdrd_f),
		                   .clk (clk), .se(se), .si(), .so());
   dff_s #(1) fwd_rds_ff(.din (fwdrd_f),
		                   .q   (fwdrd_s),
		                   .clk (clk), .se(se), .si(), .so());
   dff_s #(1) fwd_rdd_ff(.din (fwdrd_s),
		                   .q   (fwdrd_d),
		                   .clk (clk), .se(se), .si(), .so());

   assign ifu_lsu_fwd_data_vld = fwdrd_d;
   assign asifwd_rd_s = asird_s | fwdrd_s;

   
   // asi reads from icache
   dff_s #(1) ic_rdts_ff(.din (ifq_erb_rdtag_f),
		                   .q   (rdtag_s),
		                   .clk (clk), .se(se), .si(), .so());

   // forward requests also read instruction memory
   assign rdinst_f = fwdrd_f | ifq_erb_rdinst_f;
   
   dff_s #(1) ic_rdds_ff(.din (rdinst_f),
		                   .q   (rdinst_s),
		                   .clk (clk), .se(se), .si(), .so());


//   assign rst_tri_en = 1'b0;

   // pick err asi source
   assign erc_erd_errasi_sel_en_l   = ~asi_erren_s;
   assign erc_erd_errasi_sel_stat_l = ~asi_errstat_s | asi_erren_s;
   assign erc_erd_errasi_sel_inj_l  = ~asi_errinj_s | asi_errstat_s | 
                                       asi_erren_s;
   assign erc_erd_errasi_sel_addr_l =  asi_erren_s | asi_errstat_s | 
	                                     asi_errinj_s;	

   assign err_asi_s = (asi_erren_s | asi_errstat_s | asi_errinj_s | 
	                     asi_erraddr_s);

   // pick other asi source
   assign erc_erd_miscasi_sel_ict_l = ~rdtag_s;
   assign erc_erd_miscasi_sel_imask_l = ~asi_imask_s | rdtag_s;
   assign erc_erd_miscasi_sel_other_l = rdtag_s | asi_imask_s;

   // pick source for final asi loads
   assign erc_erd_asisrc_sel_icd_s_l = ~(asifwd_rd_s & rdinst_s);
   assign erc_erd_asisrc_sel_err_s_l = ~(asifwd_rd_s & ~rdinst_s & err_asi_s);
   assign erc_erd_asisrc_sel_misc_s_l = ~(asifwd_rd_s & ~rdinst_s & ~err_asi_s);
   assign erc_erd_asisrc_sel_itlb_s_l = ~(~asifwd_rd_s);

   // is this asi read valid (for checking parity)
   assign asi_ttevld_s1 = fcl_erb_itlbrd_vld_s & ~fcl_erb_itlbrd_data_s;
   assign asi_tdevld_s1 = fcl_erb_itlbrd_vld_s & fcl_erb_itlbrd_data_s;

   assign ldxa_data_vld_s = fcl_erb_itlbrd_vld_s | asird_s;
//   assign ifu_lsu_ldxa_data_vld_w1 = ldxa_data_vld_s;
   
   dff_s #(1) asirdd_ff(.din (ldxa_data_vld_s),
                      .q   (ldxa_data_vld_d),
                      .clk (clk),
                      .se  (se), .si(), .so());
   
   assign ifu_lsu_ldxa_data_vld_w2 = ldxa_data_vld_d;
   

   // ASI Writes
   assign asi_wrt_err_en = asi_thr_i2 & {4{ifq_erb_asiwr_i2 &
					                                 ifq_erb_asi_erren_i2}};
   assign asi_wrt_err_stat = asi_thr_i2 & {4{ifq_erb_asiwr_i2 &
					                                   ifq_erb_asi_errstat_i2}};
   // err inj is common to the core
//   assign asi_wrt_err_inj = asi_thr_i2 & {4{ifq_erb_asiwr_i2 &
//					                                  ifq_erb_asi_errinj_i2}};
   assign asi_wrt_err_addr = asi_thr_i2 & {4{ifq_erb_asiwr_i2 &
					                                   ifq_erb_asi_erraddr_i2}};   

   assign erc_erd_ld_imask = ifq_erb_asiwr_i2 & ifq_erb_asi_imask_i2;


   // ASI Write Data
   assign  meu_wrt_data  = ifq_erb_asidata_i2[31];
   assign  mec_wrt_data  = ifq_erb_asidata_i2[30];
   assign  priv_wrt_data = ifq_erb_asidata_i2[29];

   assign  imdu_wrt_data = ifq_erb_asidata_i2[25];
   assign  imt_wrt_data  = ifq_erb_asidata_i2[24];
   assign  dmdu_wrt_data = ifq_erb_asidata_i2[23];
   assign  dmt_wrt_data  = ifq_erb_asidata_i2[22];
   assign  idc_wrt_data  = ifq_erb_asidata_i2[21];
   assign  itc_wrt_data  = ifq_erb_asidata_i2[20];
   assign  ddc_wrt_data  = ifq_erb_asidata_i2[19];
   assign  dtc_wrt_data  = ifq_erb_asidata_i2[18];
   assign  irc_wrt_data  = ifq_erb_asidata_i2[17];
   assign  iru_wrt_data  = ifq_erb_asidata_i2[16];
   assign  frc_wrt_data  = ifq_erb_asidata_i2[15];
   assign  fru_wrt_data  = ifq_erb_asidata_i2[14];
   assign  ldau_wrt_data = ifq_erb_asidata_i2[13];
   assign  ncu_wrt_data  = ifq_erb_asidata_i2[12];  
   assign  dmsu_wrt_data = ifq_erb_asidata_i2[11];
   assign  mau_wrt_data  = ifq_erb_asidata_i2[9];
  
   assign nceen_wrt_data = ifq_erb_asidata_i2[1];  
   assign ceen_wrt_data  = ifq_erb_asidata_i2[0];  

   //
   sink s0(.in (ifq_erb_asidata_i2[8]));
   sink s1(.in (ifq_erb_asidata_i2[10]));
   
endmodule
   
