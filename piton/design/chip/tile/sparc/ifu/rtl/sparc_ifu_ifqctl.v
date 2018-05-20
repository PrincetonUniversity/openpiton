// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_ifqctl.v
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
//  Module Name: sparc_ifu_ifqctl
//  Description:	
//  Contains the control logic for the ifq and mil.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

`include "iop.h"
`include "ifu.tmp.h"


module sparc_ifu_ifqctl(/*AUTOARG*/
   // Outputs
   ifu_lsu_inv_clear, ifu_lsu_ibuf_busy, ifu_lsu_asi_ack, 
   ifu_lsu_ldxa_illgl_va_w2, ifu_lsu_fwd_wr_ack, ifu_lsu_pcxreq_d, 
   ifu_lsu_destid_s, ifu_tlu_l2imiss, ifq_fcl_stallreq, 
   ifq_swl_stallreq, ifq_fcl_flush_sonly_e, ifq_fcl_wrreq_bf, 
   ifq_fcl_rdreq_bf, ifq_fcl_icd_wrreq_bf, ifq_fcl_ictv_wrreq_bf, 
   ifq_erb_fwdrd_bf, ifq_erb_rdtag_f, ifq_erb_rdinst_f, 
   ifq_erb_asi_erren_i2, ifq_erb_asi_errstat_i2, 
   ifq_erb_asi_errinj_i2, ifq_erb_asi_erraddr_i2, 
   ifq_erb_asi_imask_i2, ifq_erb_asiwr_i2, ifq_fcl_asird_bf, 
   ifq_fcl_asi_tid_bf, ifq_erb_ue_rep, ifq_erb_ce_rep, ifq_erb_l2_ue, 
   ifq_erb_io_ue, ifq_erb_ifet_ce, ifq_erb_l2err_tid, 
   ifq_icv_wrdata_bf, ifq_icd_worden_bf, ifq_fcl_fill_thr, 
   ifq_dtu_thrrdy, ifq_dtu_pred_rdy, ifc_ifd_filladdr4_i2, 
   ifc_ifd_reqvalid_e, ifc_ifd_idx_sel_fwd_i2, ifc_ifd_errinv_e, 
   ifc_ifd_uncached_e, ifc_ifd_thrid_e, ifc_ifd_pcxline_adj_d, 
   ifc_inv_asireq_i2, ifc_ifd_repway_s, ifq_sscan_data, 
   ifc_ifd_milfill_sel_i2_l, ifc_ifd_finst_sel_l, 
   ifc_ifd_milreq_sel_d_l, ifc_ifd_ifqbyp_sel_fwd_l, 
   ifc_ifd_ifqbyp_sel_inq_l, ifc_ifd_ifqbyp_sel_asi_l, 
   ifc_ifd_ifqbyp_sel_lsu_l, ifc_ifd_ifqbyp_en_l, 
   ifc_ifd_addr_sel_bist_i2_l, ifc_ifd_addr_sel_asi_i2_l, 
   ifc_ifd_addr_sel_old_i2_l, ifc_ifd_addr_sel_fill_i2_l, 
   ifq_icd_data_sel_bist_i2, ifq_icd_data_sel_fill_i2, 
   ifq_icd_data_sel_old_i2, ifc_ifd_ldmil_sel_new, ifc_ifd_ld_inq_i1, 
   ifc_inv_ifqadv_i2, so, 
   // Inputs
   lsu_ifu_cpxpkt_wayvld_i1, ifd_ifc_milhit_s, ifd_ifc_instoffset0, ifd_ifc_instoffset1, 
   ifd_ifc_instoffset2, ifd_ifc_instoffset3, ifd_ifc_cpxvalid_i1, 
   ifd_ifc_cpxreq_i1, ifd_ifc_cpxreq_nxt, ifd_ifc_cpxthr_nxt, 
   ifd_ifc_cpxvld_i2, ifd_ifc_iobpkt_i2, ifd_ifc_4bpkt_i2, 
   ifd_ifc_cpxnc_i2, ifd_ifc_fwd2ic_i2, ifd_ifc_cpxce_i2, 
   ifd_ifc_cpxue_i2, ifd_ifc_cpxms_i2, ifd_ifc_miladdr4_i2, 
   ifd_ifc_asiaddr_i2, ifd_ifc_asi_vachklo_i2, ifd_ifc_destid0, 
   ifd_ifc_destid1, ifd_ifc_destid2, ifd_ifc_destid3, 
   ifd_ifc_newdestid_s, ifd_ifc_pcxline_d, inv_ifc_inv_pending, 
   fcl_ifq_icmiss_s1, fcl_ifq_rdreq_s1, fcl_ifq_thr_s1, 
   fcl_ifq_canthr, fcl_ifq_grant_bf, dtu_ifq_kill_latest_d, 
   erb_ifq_ifeterr_d1, erb_ifq_itlberr_s1, lsu_ifu_pcxpkt_ack_d, 
   lsu_ifu_direct_map_l1, lsu_ifu_asi_vld, lsu_ifu_asi_state, 
   lsu_ifu_asi_load, lsu_ifu_asi_thrid, fcl_ifq_icache_en_s_l, 
   mbist_ifq_run_bist, mbist_icache_write, mbist_icache_read, 
   ctu_sscan_tid, rclk, se, si, gdbginit_l, arst_l, grst_l, 
   rst_tri_en, sehold
   );

   input          lsu_ifu_cpxpkt_wayvld_i1;
   input [3:0]	  ifd_ifc_milhit_s;      // if an Imiss hits in MIL
   input [1:0]    ifd_ifc_instoffset0; // to select inst to TIR
   input [1:0]    ifd_ifc_instoffset1; // to select inst to TIR
   input [1:0]    ifd_ifc_instoffset2; // to select inst to TIR
   input [1:0]    ifd_ifc_instoffset3; // to select inst to TIR

   input         ifd_ifc_cpxvalid_i1;
   input [`CPX_RQ_SIZE:0] ifd_ifc_cpxreq_i1;

   input [3:0]   ifd_ifc_cpxreq_nxt;
   input [1:0]   ifd_ifc_cpxthr_nxt;
   input         ifd_ifc_cpxvld_i2;
   
   input         ifd_ifc_iobpkt_i2;
   input         ifd_ifc_4bpkt_i2;
   input         ifd_ifc_cpxnc_i2;
   input         ifd_ifc_fwd2ic_i2;
   input         ifd_ifc_cpxce_i2,
		             ifd_ifc_cpxue_i2,
                 ifd_ifc_cpxms_i2;
   
   input [3:0]   ifd_ifc_miladdr4_i2;

   input [3:2]   ifd_ifc_asiaddr_i2;
   input         ifd_ifc_asi_vachklo_i2;

   input [2:0]   ifd_ifc_destid0,
		             ifd_ifc_destid1,
		             ifd_ifc_destid2,
		             ifd_ifc_destid3,
		             ifd_ifc_newdestid_s;
   input [4:2]   ifd_ifc_pcxline_d;
//   input [7:0]   ifd_ifc_mil_repway_s;   

   input         inv_ifc_inv_pending;
   
   input         fcl_ifq_icmiss_s1;   // icache miss
   input         fcl_ifq_rdreq_s1;

   input [1:0]   fcl_ifq_thr_s1;

   input [3:0]   fcl_ifq_canthr;        // cancel the imiss reqs to
                                        // these threads
   input         fcl_ifq_grant_bf;

   input         dtu_ifq_kill_latest_d;
   input         erb_ifq_ifeterr_d1;
   input         erb_ifq_itlberr_s1;
   
   input         lsu_ifu_pcxpkt_ack_d;
   input         lsu_ifu_direct_map_l1;

   input         lsu_ifu_asi_vld;
   input [7:0]   lsu_ifu_asi_state;
   input         lsu_ifu_asi_load;
   input [1:0]   lsu_ifu_asi_thrid;

   input         fcl_ifq_icache_en_s_l;
   
   input         mbist_ifq_run_bist,
                 mbist_icache_write,
		             mbist_icache_read;

   input [3:0]   ctu_sscan_tid;

   input         rclk, 
                 se, 
                 si,
                 gdbginit_l,
                 arst_l,
                 grst_l;

   input         rst_tri_en;
   input         sehold;
   
   // outputs
   output        ifu_lsu_inv_clear;
   output        ifu_lsu_ibuf_busy;
   output        ifu_lsu_asi_ack;
   output        ifu_lsu_ldxa_illgl_va_w2;

   output        ifu_lsu_fwd_wr_ack;
   
   output        ifu_lsu_pcxreq_d;
   output [2:0]  ifu_lsu_destid_s;

   output [3:0]  ifu_tlu_l2imiss;
   
   output        ifq_fcl_stallreq;
   output        ifq_swl_stallreq;
   output        ifq_fcl_flush_sonly_e;
   
   output        ifq_fcl_wrreq_bf;
   output        ifq_fcl_rdreq_bf;
   
   output        ifq_fcl_icd_wrreq_bf,
		             ifq_fcl_ictv_wrreq_bf;
   output        ifq_erb_fwdrd_bf;
   output        ifq_erb_rdtag_f;
   output        ifq_erb_rdinst_f;
   output        ifq_erb_asi_erren_i2;
   output        ifq_erb_asi_errstat_i2;
   output        ifq_erb_asi_errinj_i2;
   output        ifq_erb_asi_erraddr_i2;
   output        ifq_erb_asi_imask_i2;
   output        ifq_erb_asiwr_i2;
   
   output        ifq_fcl_asird_bf;
   output [1:0]  ifq_fcl_asi_tid_bf;

   output        ifq_erb_ue_rep;
   output        ifq_erb_ce_rep;
   output        ifq_erb_l2_ue;
   output        ifq_erb_io_ue;
   output        ifq_erb_ifet_ce;
   output [1:0]  ifq_erb_l2err_tid;

   output        ifq_icv_wrdata_bf;
   output [3:0]  ifq_icd_worden_bf;

   output [3:0]  ifq_fcl_fill_thr;     // should be same stage as 
   // fill_inst
   output [3:0]  ifq_dtu_thrrdy;
   output [3:0]  ifq_dtu_pred_rdy;
   
   output        ifc_ifd_filladdr4_i2;
   output        ifc_ifd_reqvalid_e;
   output        ifc_ifd_idx_sel_fwd_i2;

   output        ifc_ifd_errinv_e;
   output        ifc_ifd_uncached_e;
   output [1:0]  ifc_ifd_thrid_e;
   output [4:2]  ifc_ifd_pcxline_adj_d;

   output        ifc_inv_asireq_i2;

   output [1:0]  ifc_ifd_repway_s;

   output [3:0]  ifq_sscan_data;
   
   // mux selects
   output [3:0]  ifc_ifd_milfill_sel_i2_l;
   output [3:0]  ifc_ifd_finst_sel_l;
   output [3:0]  ifc_ifd_milreq_sel_d_l;
   output        ifc_ifd_ifqbyp_sel_fwd_l, // select next input to ifq pipe
		             ifc_ifd_ifqbyp_sel_inq_l,
		             ifc_ifd_ifqbyp_sel_asi_l,
		             ifc_ifd_ifqbyp_sel_lsu_l;
	 output        ifc_ifd_ifqbyp_en_l;
   
   output        ifc_ifd_addr_sel_bist_i2_l,
		             ifc_ifd_addr_sel_asi_i2_l,
                 ifc_ifd_addr_sel_old_i2_l,
		             ifc_ifd_addr_sel_fill_i2_l;

   output        ifq_icd_data_sel_bist_i2,
		             ifq_icd_data_sel_fill_i2,
		             ifq_icd_data_sel_old_i2;
	 
   // 2:1 mux selects
   output [3:0]  ifc_ifd_ldmil_sel_new;     // mil load enable

   
   output        ifc_ifd_ld_inq_i1;
   
   output        ifc_inv_ifqadv_i2;         // move a new op from ifq
	 // pipe to icache

   output        so;
   
   //----------------------------------------------------------------------
   // Declarations
   //----------------------------------------------------------------------   
   // local signals
   wire [3:0]    thr_s1,      // s1 thread which missed in I$
		             thr_d1,
                 thr_e1,
		             dfthr_f,     // thread currently being filled in I$
                 dfthr_next_i2,
		             dfthr_i2,    // next thread to be filled from CPX
                 milfthr_i2,
		             dpcxthr_s,
		             dpcxthr_d;   // thread being transmitted to lsu

   wire [1:0]    thrid_d,
                 thrid_e;
   
   wire [3:0]    pcx_accept_d;

   wire          req_pending_d,
//		             req_pending_e,
		             req_accept_d,
//                 can_pcx_d,
                 pcxreq_vbit_d;
   
   wire [3:0]    comp_valid_s,
		             mil_valid_s,
                 mil_cancel;

   wire [3:0]    finst_i2,
                 finst0,
                 finst1,
                 finst2,
                 finst3;

   wire [2:0]    milchld0,
		             milchld1,
		             milchld2,
		             milchld3,
		             next_milchld,
		             milchld_d1;
   wire          milchld_vld_f,
		             next_milchld_i2,
		             milchld_vld_i2;

   wire [3:0]    mil0_state,
                 mil1_state,
                 mil2_state,
                 mil3_state;

   wire [2:0]    i2out;         // state machine output in i2 stage
   
   wire          any_milhit_qual_s,     // hit in MIL
                 any_qualhit_or_io_s,
		             icmiss_qual_s,
//		             reqq_empty,    // no pending requests in MIL
		             oldreq_valid,
		             next_wrreq_i2,
		             wrreq_f;
   wire          block_fetch_s1,
                 block_fetch_d1;

   wire [3:0]    mil_thr_ready,
                 all_retry_rdy_e1,
                 all_retry_rdy_m1;
   wire          retry_rdy_final_d1,
                 retry_rdy_e1;

   wire          rst_starv_ctr_l;
   wire          starv_alert;

   wire [3:0]    milhit_vec_s;
   wire          any_milhit_s;

   wire [1:0]    rand_repway_s;
//   wire [1:0]    mil_repway_s;

   wire [3:0]    errthr_d1,
		             err_vec_d1,
		             err_req;
   wire          errinv_d1;

   wire          ifeterr_qual_d1,
                 ifeterr_e1;
   wire          thr_match_d1e1;
   wire          ifqadv_i1;

   wire          ifqadvi2_nxt,
                 ifqadv_i2_ff;
   wire          access_grant_l;

   wire          addrbit4_i2;
   wire          addrbit4_nxt_i2;
   
   wire [3:0]    cpxreq_i2;
   wire [1:0]    cpxthr_i2;
   

   wire          uncached_i2,
                 uncached_s,
                 mil_vld_i2,
                 mil_uncan_i2,
                 mil_nc_i2,
                 mil_nc_e,
                 mil_nc_d,
		             uncached_fill_i2,
		             uncached_f;

   wire [3:0]    mil_nc_vec,
                 mil_nc_vec_nxt;
                 
   
   wire [3:0]    pcxreq_s,          // req bit from MIL
                 pcxreq_qual_s,
//		             newpcxreq_s,       // valid new request from latest miss
//		             oldpcxreq_s,
		             rr_gnt,          // round robin grant signal
		             fill_addr4_i2;    // fill address bit 4 - determines
	 // which 16B of the 32B line gets
	 // written. Assume 0 first then 1

   wire          newreq_valid,    // latest S stage miss creates request.
		             nextreq_valid_s, // if either a new req from i$ or old
				         // req from MIL is made in this cycle.
		             req_valid_d;     // req to LSU is valid

   wire          inq_vld,
		             inq_vld_nxt;

   wire          ic_pkt_i1;
   
//   wire          fill_this16b;

   wire [1:0]    filltid_i2,
		             next_filltid_i2,
		             filltid_f;

   wire          imissrtn_i2,   // input cpx is ifill return
                 imissrtn_next_i2,
                 imissrtn_f,
		             imissrtn_i1;   // pkt in inq is ifill ret

   wire          invalidate_i1;

   wire [3:0]    icmiss_thr_s,
		             icmiss_thr_d;
   wire          icmiss_d1,
                 icmiss_qual_d1;
   wire          canthr_s1,
                 canthr_d1,
                 canthr_s1_del1;
   wire          itlberr_d1;

   wire [2:0]    old_destid_s;

   wire          destid_iob_s,
                 destid_iob_d;

   wire          iosp_d1_l,
                 n763;
   
   wire [3:0]    wrt_tir;

   wire [3:0]    wr_complete_f;
   wire [3:0]    pred_rdy_i2;
   wire [3:0]    fill_retn_thr_i2;

   wire          filladdr4_f;
   
   wire [3:0]    milhit_to_thr_s,
		             icmiss_for_milchk,
                 qualhit_pe_s,
                 qualhit_or_io_s;
//		             milhit_qual_s;

   wire          l2_ue_i2,
		             l2_ce_i2,
		             io_ue_i2;
   wire          l2_miss_i2,
                 l2_miss_f;
//   wire [3:0]    l2ms_thr;
   
   wire          ce_rep_i2,
		             ue_rep_i2;

   wire          fwdreq_i2,
                 fwdreq_i3,
                 fwd_stall,
                 fwdwr_i3,
                 fwdrd_i3;

   wire          cpxnc_i3;

   wire          stallreq_d0,
                 stallreq_d1;

   wire          ifu_asireq_i1,
                 ifu_asireq_i0,
                 byp_sel_asi_l,
                 asird_i1,
		             asireq_i2,
                 asireq_i2_l,
		             asi_load_i1,
		             asi_load_i2,
		             asi_vld_next,
                 asi_vld_i0,
                 asi_vld_qual_i0;
   
   wire [7:0]    asi_state_i1;
   wire          asi_ic_data_i1,
		             asi_ic_data_i2,
		             asi_ic_tag_i1,
		             asi_ic_tag_i2;

   wire          asi_erren_i1,
		             asi_errstat_i1,
		             asi_errinj_i1,
		             asi_erraddr_i1,
		             asi_imask_i1;

   wire          asi_ic_data_unchk_i1,
		             asi_ic_tag_unchk_i1;

   wire          asi_erren_unchk_i1,
		             asi_errstat_unchk_i1,
		             asi_errinj_unchk_i1,
		             asi_erraddr_unchk_i1,
		             asi_imask_unchk_i1;

   wire          illva_i0,
                 illva_i1,
                 illva_i2,
                 illva_f,
                 illva_s,
                 illva_w2;

   wire [3:0]    word_sel_i2;
   wire          bist_op;

   wire          rdinst_bf,
		             rd_tag_bf;
   
   wire          errpkt_i1;
   
   wire          stpkt_i1,
                 strmack_i1,
		             ldpkt_i1,
		             evpkt_i1,
		             errpkt_i2;
   
   wire          icv_wrdata_i2,
		             icv_wbit_i2,
		             icv_wrdata_f;

   wire          rst_way_lfsr;

   wire          inq_wayvld_i1;
   wire          inq_wayvld_i1_nxt;
   wire          ldinv_i1;
   wire          ldinv_i2_nxt;
   wire          ldinv_i2;
	 
   wire          ifq_reset,
                 rnd_reset,
                 ifq_reset_l;
   

   wire          clk;
   
   
//----------------------------------------------------------------------
// Code start here 
//----------------------------------------------------------------------

   assign        clk = rclk;
   

   // reset buffer
   dffrl_async rstff(.din (grst_l),
                     .q   (ifq_reset_l),
                     .clk (clk), .se(se), .si(), .so(),
                     .rst_l (arst_l));

   assign       ifq_reset = ~ifq_reset_l;

   
//---------
// MIL fsm
//---------   
   sparc_ifu_milfsm mil0(
 	                       .ifc_fsm_can_thisthr      (fcl_ifq_canthr[0]),        
                         //	.ifc_fsm_orphan_thisthr (orphan_thr_d1[0]),


	                       .ifc_fsm_fill_thisthr_i2  (fill_retn_thr_i2[0]),    
	                       .ifc_fsm_wr_complete_f    (wr_complete_f[0]),

                         .ifqadv_i2  (ifc_inv_ifqadv_i2),

                         .ifd_ifc_4bpkt_i2         (ifd_ifc_4bpkt_i2),
	                       .fcl_ifq_thr_s1           (fcl_ifq_thr_s1),
	                       .ifc_fsm_imiss_thisthr_s  (icmiss_thr_s[0]),          
	                       .ifc_fsm_milhit_s         (any_milhit_qual_s),

	                       .ifc_fsm_hiton_thismil_s  (milhit_to_thr_s[0]),   

	                       .ifc_fsm_pcxaccept_thisthr(pcx_accept_d[0]),
                         .ifc_fsm_miladdr4         (ifd_ifc_miladdr4_i2[0]),

	                       .clk                      (clk),
                         .se                       (se),
                         .si                       (si),
	                       .reset                    (ifq_reset),

                         .so                       (),

	                       .ifc_fsm_err_thisthr      (errthr_d1[0]),
			
	                       // outputs	 
                         .fsm_ifc_errreq           (err_req[0]),
		  
	                       .fsm_ifc_wrt_tir          (wrt_tir[0]),
	                       .fsm_ifc_comp_valid       (comp_valid_s[0]),
	                       .fsm_ifc_mil_valid        (mil_valid_s[0]),
	                       .fsm_ifc_mil_cancel       (mil_cancel[0]),
                         .fsm_ifc_milstate         (mil0_state[3:0]),
			
	                       .fsm_ifc_thr_ready        (mil_thr_ready[0]),
	                       .fsm_ifc_pred_rdy         (pred_rdy_i2[0]),
	                       .fsm_ifc_pcxreq           (pcxreq_s[0]),       
	                       .fsm_ifc_addrbit4_i2      (fill_addr4_i2[0]),
	                       .fsm_ifc_milchld          (milchld0[2:0]));
   

   sparc_ifu_milfsm mil1(
                         .ifc_fsm_can_thisthr      (fcl_ifq_canthr[1]),        
                         //	   .ifc_fsm_orphan_thisthr   (orphan_thr_d1[1]),     

	                       .ifc_fsm_fill_thisthr_i2  (fill_retn_thr_i2[1]),   
	                       .ifc_fsm_wr_complete_f    (wr_complete_f[1]),          
      
                         .ifqadv_i2  (ifc_inv_ifqadv_i2),

                         .ifd_ifc_4bpkt_i2         (ifd_ifc_4bpkt_i2),
	                       .fcl_ifq_thr_s1           (fcl_ifq_thr_s1),             
	                       .ifc_fsm_milhit_s         (any_milhit_qual_s),           
	                       .ifc_fsm_hiton_thismil_s (milhit_to_thr_s[1]),   
	                       .ifc_fsm_imiss_thisthr_s   (icmiss_thr_s[1]),          

	                       .ifc_fsm_pcxaccept_thisthr   (pcx_accept_d[1]),     
                         //	   .ifc_fsm_reqq_empty       (reqq_empty),         
                         .ifc_fsm_miladdr4         (ifd_ifc_miladdr4_i2[1]),

	                       .clk                      (clk),
                         .se                       (se),
                         .si                       (si),
	                       .reset                    (ifq_reset),

	                       .ifc_fsm_err_thisthr      (errthr_d1[1]),
			
	                       // outputs	 
                         .fsm_ifc_errreq           (err_req[1]),

	                       .fsm_ifc_wrt_tir          (wrt_tir[1]),
                         .so                       (),	    
                         //	   .fsm_ifc_cm_pending       (can_miss_pending[1]),
                         //	   .fsm_ifc_delay_mil        (delay_mil[1]),
	                       .fsm_ifc_comp_valid       (comp_valid_s[1]), 
	                       .fsm_ifc_mil_valid        (mil_valid_s[1]),
	                       .fsm_ifc_mil_cancel       (mil_cancel[1]),
                         .fsm_ifc_milstate         (mil1_state[3:0]),

	                       .fsm_ifc_pcxreq           (pcxreq_s[1]),       
	                       .fsm_ifc_thr_ready        (mil_thr_ready[1]),
	                       .fsm_ifc_pred_rdy         (pred_rdy_i2[1]),
	                       .fsm_ifc_addrbit4_i2      (fill_addr4_i2[1]), 
	                       .fsm_ifc_milchld          (milchld1[2:0]));

   sparc_ifu_milfsm mil2(
                         .ifc_fsm_can_thisthr      (fcl_ifq_canthr[2]),        
                         //	   .ifc_fsm_orphan_thisthr   (orphan_thr_d1[2]),     

	                       .ifc_fsm_fill_thisthr_i2  (fill_retn_thr_i2[2]),
	                       .ifc_fsm_wr_complete_f    (wr_complete_f[2]),          
			
                         .ifqadv_i2  (ifc_inv_ifqadv_i2),

                         .ifd_ifc_4bpkt_i2         (ifd_ifc_4bpkt_i2),
	                       .fcl_ifq_thr_s1           (fcl_ifq_thr_s1),             
	                       .ifc_fsm_milhit_s         (any_milhit_qual_s),           
	                       .ifc_fsm_hiton_thismil_s (milhit_to_thr_s[2]),   
	                       .ifc_fsm_imiss_thisthr_s  (icmiss_thr_s[2]),          

	                       .ifc_fsm_pcxaccept_thisthr(pcx_accept_d[2]),     
                         //	   .ifc_fsm_reqq_empty       (reqq_empty),         

                         .ifc_fsm_miladdr4         (ifd_ifc_miladdr4_i2[2]),

	                       .clk                      (clk),
                         .se                       (se),
                         .si                       (si),
	                       .reset                    (ifq_reset),

	                       .ifc_fsm_err_thisthr      (errthr_d1[2]),
			
	                       // outputs	 
                         .fsm_ifc_errreq           (err_req[2]),

                         .so                       (),	    
                         //	   .fsm_ifc_cm_pending       (can_miss_pending[2]),
                         //	   .fsm_ifc_delay_mil        (delay_mil[2]),
	                       .fsm_ifc_wrt_tir          (wrt_tir[2]),
	                       .fsm_ifc_comp_valid       (comp_valid_s[2]),
	                       .fsm_ifc_mil_valid        (mil_valid_s[2]),
	                       .fsm_ifc_mil_cancel       (mil_cancel[2]),
                         .fsm_ifc_milstate         (mil2_state[3:0]),
			
	                       .fsm_ifc_pcxreq           (pcxreq_s[2]),       
	                       .fsm_ifc_thr_ready        (mil_thr_ready[2]),
	                       .fsm_ifc_pred_rdy         (pred_rdy_i2[2]),
	                       .fsm_ifc_addrbit4_i2      (fill_addr4_i2[2]), 
	                       .fsm_ifc_milchld          (milchld2[2:0]));


   sparc_ifu_milfsm mil3(
                         .ifc_fsm_can_thisthr      (fcl_ifq_canthr[3]),        
                         //	   .ifc_fsm_orphan_thisthr   (orphan_thr_d1[3]),     

	                       .ifc_fsm_fill_thisthr_i2  (fill_retn_thr_i2[3]),
	                       .ifc_fsm_wr_complete_f    (wr_complete_f[3]), 
			
                         .ifqadv_i2  (ifc_inv_ifqadv_i2),

                         .ifd_ifc_4bpkt_i2         (ifd_ifc_4bpkt_i2),
	                       .fcl_ifq_thr_s1           (fcl_ifq_thr_s1),             
	                       .ifc_fsm_milhit_s         (any_milhit_qual_s),           
	                       .ifc_fsm_hiton_thismil_s (milhit_to_thr_s[3]),   
	                       .ifc_fsm_imiss_thisthr_s   (icmiss_thr_s[3]),          

	                       .ifc_fsm_pcxaccept_thisthr(pcx_accept_d[3]),     
                         //	   .ifc_fsm_reqq_empty       (reqq_empty),         

                         .ifc_fsm_miladdr4         (ifd_ifc_miladdr4_i2[3]),

	                       .clk                      (clk),
                         .se                       (se),
                         .si                       (si),
	                       .reset                    (ifq_reset),

	                       .ifc_fsm_err_thisthr      (errthr_d1[3]),
			
	                       // outputs	 
                         .fsm_ifc_errreq           (err_req[3]),

                         .so                       (),	
                         //	   .fsm_ifc_cm_pending       (can_miss_pending[3]),
                         //	   .fsm_ifc_delay_mil        (delay_mil[3]),
	                       .fsm_ifc_wrt_tir          (wrt_tir[3]),
	                       .fsm_ifc_comp_valid       (comp_valid_s[3]),
	                       .fsm_ifc_mil_valid        (mil_valid_s[3]),
	                       .fsm_ifc_mil_cancel       (mil_cancel[3]),
                         .fsm_ifc_milstate         (mil3_state[3:0]),
			
	                       .fsm_ifc_pcxreq           (pcxreq_s[3]),           
	                       .fsm_ifc_thr_ready        (mil_thr_ready[3]),
	                       .fsm_ifc_pred_rdy         (pred_rdy_i2[3]),
	                       .fsm_ifc_addrbit4_i2      (fill_addr4_i2[3]),    
	                       .fsm_ifc_milchld          (milchld3[2:0]));


   
//-------------------------------------------
// Fill Return Control (IFU interfac to CPX)
//-------------------------------------------

   // use soffm2 for lower setup
   dffe_s #(4) cpxreq_reg(.din (ifd_ifc_cpxreq_nxt),
                        .q   (cpxreq_i2),
                        .en  (ifqadv_i1),
                        .clk (clk), .se(se), .si(), .so());
   dffe_s #(2) cpxthr_reg(.din (ifd_ifc_cpxthr_nxt),
                        .q   (cpxthr_i2),
                        .en  (ifqadv_i1),
                        .clk (clk), .se(se), .si(), .so());
   

   // Decode CPX request
   assign imissrtn_i1 = (ifd_ifc_cpxreq_i1 == `CPX_IFILLPKT) ? 1'b1 : 1'b0;   
   assign imissrtn_i2 = (cpxreq_i2 == `IFILL_RET) ? ifd_ifc_cpxvld_i2 : 1'b0;

   assign imissrtn_next_i2 = ifc_inv_ifqadv_i2 ? imissrtn_i2 : imissrtn_f;
   
   dff_s #(1) imsf_ff(.din (imissrtn_next_i2),
                    .q   (imissrtn_f),
                    .clk (clk), .se (se), .si(), .so());
   
   // Determine if this is an IFILL RET to one of the threads
   assign fill_retn_thr_i2 = dfthr_i2 & {4{imissrtn_i2}};
   
   // decode current icache fill thread
   assign dfthr_f[0] = ~filltid_f[1] & ~filltid_f[0];
   assign dfthr_f[1] = ~filltid_f[1] &  filltid_f[0];
   assign dfthr_f[2] =  filltid_f[1] & ~filltid_f[0];
   assign dfthr_f[3] =  filltid_f[1] &  filltid_f[0];

//`ifdef IFU_SAT
//   assign ifc_ifd_uncached_s = fcl_ifq_icache_en_s_l;   
//`else   
//`endif

   assign uncached_s = ifd_ifc_newdestid_s[2] | fcl_ifq_icache_en_s_l;

   // timing fix: keep nc bit locally instead of in DP
   assign mil_nc_vec_nxt = ({4{uncached_s & fcl_ifq_rdreq_s1}} & 
                              thr_s1 & ~errthr_d1 |
                              mil_nc_vec & (mil_valid_s |
                                            errthr_d1));

   dff_s #(4) nc_reg(.din (mil_nc_vec_nxt),
                   .q   (mil_nc_vec),
                   .clk (clk), .se(se), .si(), .so());

   assign mil_nc_i2 = (dfthr_i2[0] & mil_nc_vec[0] |
                       dfthr_i2[1] & mil_nc_vec[1] |
                       dfthr_i2[2] & mil_nc_vec[2] |
                       dfthr_i2[3] & mil_nc_vec[3]);

   assign mil_nc_d = (dpcxthr_d[0] & mil_nc_vec[0] |
                      dpcxthr_d[1] & mil_nc_vec[1] |
                      dpcxthr_d[2] & mil_nc_vec[2] |
                      dpcxthr_d[3] & mil_nc_vec[3]);

   dff_s #(1) nce_ff(.din (mil_nc_d),
                   .q   (mil_nc_e),
                   .clk (clk), .se(se), .si(), .so());
   assign ifc_ifd_uncached_e = mil_nc_e;
   
//   assign uncached_fill_i2 = ifd_ifc_uncached_i2 | ifd_ifc_cpxnc_i2;
   assign uncached_fill_i2 = mil_nc_i2 | ifd_ifc_cpxnc_i2;   
   
   // uncached fill -- do not write to icache
   assign uncached_i2 = ifc_inv_ifqadv_i2 ? 
	                          uncached_fill_i2 : uncached_f;

   dff_s unc_ff(.din (uncached_i2),
	            .q   (uncached_f),
	            .clk (clk),
	            .se  (se), .si(), .so());

   // Determine if Icache write is done or 
   // if none is necessary (i.e. if this is a child process or NC)
   assign wr_complete_f = dfthr_f & {4{(wrreq_f & ifc_inv_ifqadv_i2 | 
                                        milchld_vld_f |
				                                uncached_f) & imissrtn_f}};

   // State Machine Outputs
   // One of these has to be chosen for I2 stage operation
   mux4ds #(3)  i2out_mux(.dout  (i2out),
		       .in0   (milchld0),
		       .in1   (milchld1),
		       .in2   (milchld2),
		       .in3   (milchld3),
		       .sel0  (dfthr_i2[0]),
		       .sel1  (dfthr_i2[1]),
		       .sel2  (dfthr_i2[2]),
		       .sel3  (dfthr_i2[3]));

   assign mil_vld_i2 = (mil_valid_s[0] & dfthr_i2[0] |
                        mil_valid_s[1] & dfthr_i2[1] |
                        mil_valid_s[2] & dfthr_i2[2] |
                        mil_valid_s[3] & dfthr_i2[3]);

   assign mil_uncan_i2 = (mil_valid_s[0] & ~mil_cancel[0] & dfthr_i2[0] |
                          mil_valid_s[1] & ~mil_cancel[1] & dfthr_i2[1] |
                          mil_valid_s[2] & ~mil_cancel[2] & dfthr_i2[2] |
                          mil_valid_s[3] & ~mil_cancel[3] & dfthr_i2[3]);

   // Don't make a wrreq if this is a child entry.  However, if this is
   // a child and the parent was cancelled, then go ahead and
   // write... is this really necessary?  Not for functionality.
   // 3/19: parent will write even if cancelled.  So never write child
   assign next_wrreq_i2 = imissrtn_i2 & mil_vld_i2 & ~uncached_fill_i2 &
	                  ~milchld_vld_i2 & ~ifd_ifc_4bpkt_i2; // was: iobpkt_i2

   assign addrbit4_i2 = (milfthr_i2[0] & fill_addr4_i2[0] |
                         milfthr_i2[1] & fill_addr4_i2[1] |
                         milfthr_i2[2] & fill_addr4_i2[2] |
                         milfthr_i2[3] & fill_addr4_i2[3]);

   assign addrbit4_nxt_i2= ifc_inv_ifqadv_i2 ? addrbit4_i2 : filladdr4_f;
   dff_s #(1) ab4_ff(.din (addrbit4_nxt_i2),
                   .q   (filladdr4_f),
                   .clk (clk),
                   .se  (se), .si(), .so());
   
   assign ifc_ifd_filladdr4_i2 = addrbit4_nxt_i2;

   assign next_milchld = ifc_inv_ifqadv_i2 ? 
	                          {(i2out[2] & imissrtn_i2), i2out[1:0]} :
	                          milchld_d1;

   // After the packet is processed, the child entry in the MIL,
   // pointed to by the reg below is processed next (if valid)
   dffr_s #(3)  milchldd_reg(.din  (next_milchld),
			                     .clk  (clk),
			                     .rst  (ifq_reset),
			                     .q    (milchld_d1),
			                     .se   (se), .si(), .so());

   assign milchld_vld_i2 = milchld_d1[2];
   assign next_milchld_i2 = ifc_inv_ifqadv_i2 ? milchld_d1[2] :
	                                              milchld_vld_f;
   
   dffr_s #(1) milchldf_ff(.din  (next_milchld_i2),
		       .q    (milchld_vld_f),
		       .clk  (clk),
		       .rst  (ifq_reset),
		       .se   (se), .si(), .so());

   // need this to avoid x's in the simulation
//   assign cpxthrid_adj_i2 = ifd_ifc_cpxthr_i2 &
//	                          {2{ifd_ifc_cpxreq_i2[`CPX_RQ_SIZE]}};

   // Determine if we should process the child or a new entry
//   assign next_thr_sel_milchld_i2 = ifc_inv_ifqadv_i2 & milchld_vld_i2 & 
//	                            ~errpkt_i2;
//   assign next_thr_sel_milchld_i2 = milchld_vld_i2 & ~errpkt_i2;
   
   
   // if previous mil entry had a child, process that next
//   mux2ds  #(2) filltid_mux(.dout  (filltid_i2),
//		                        .in0   (cpxthrid_adj_i2),
//		                        .in1   (milchld_d1[1:0]),
//		                        .sel0  (~milchld_vld_i2),
//		                        .sel1  (milchld_vld_i2));
   assign filltid_i2 = milchld_vld_i2 ? milchld_d1[1:0] :
                                        cpxthr_i2[1:0];

   // decode fill thread  (either cpx thread or MIL child thread from above)
   // need to qual with valid bit to avoid X's in simulation
//   assign cpxvld_or_milc_i2 = ifd_ifc_cpxreq_i2[`CPX_RQ_SIZE] | milchld_vld_i2;
   assign dfthr_i2[0] = ~filltid_i2[1] & ~filltid_i2[0];
   assign dfthr_i2[1] = ~filltid_i2[1] &  filltid_i2[0];
   assign dfthr_i2[2] =  filltid_i2[1] & ~filltid_i2[0];
   assign dfthr_i2[3] =  filltid_i2[1] &  filltid_i2[0];

   dp_mux2es  #(2)  thren_mux(.dout (next_filltid_i2),
			                        .in0  (filltid_f),
			                        .in1  (filltid_i2),
			                        .sel  (ifc_inv_ifqadv_i2));

   dff_s #(2) wrthr_reg(.din  (next_filltid_i2),
		                  .clk  (clk),
		                  .q    (filltid_f),
		                  .se   (se), .si(), .so());   


   dp_mux2es  #(4)  dthren_mux(.dout (dfthr_next_i2),
			                         .in0  (dfthr_f),
			                         .in1  (dfthr_i2),
			                         .sel  (ifc_inv_ifqadv_i2));
   

   // Early start of threads
   // Do we need a control bit to turn this off?
   // -- do it in SWL
   assign ifq_dtu_pred_rdy =  pred_rdy_i2 & {dfthr_next_i2[3:0]} &
                              {4{imissrtn_next_i2}};

// If timing is a problem resort to:
//   assign ifq_dtu_pred_rdy =  pred_rdy_i2 & {4{ifc_inv_ifqadv_i2}} &
//                              dfthr_i2 & {4{imissrtn_i2}};
   
   

   // pick 16B half cache line which contains the instruction we want
//   assign fill_this16b = ~(ifc_ifd_filladdr4_i2 ^ ifd_ifc_missaddr4_i2);
                         // | ifd_ifc_4bpkt_i2;

   // write to thread instruction register
//   assign ifq_fcl_fill_thr = wrt_tir & {4{fill_this16b | ifd_ifc_4bpkt_i2}};
//   assign ifq_fcl_fill_thr = wrt_tir & {4{fill_this16b}};
   assign ifq_fcl_fill_thr = wrt_tir | thr_d1 & {4{itlberr_d1 & 
                                                   ~canthr_d1 & 
                                                   icmiss_d1 & 
                                                   ~canthr_s1_del1}};

   // Select instruction to send to TIR
   // TBD: Need to find out how the inst from boot PROM is aligned -- Done
   // From kinkee 02/21/03: It is aligned to the correct 4B of the 16B 
   // packet.  The other locations are X.
   assign finst0[0] = ~ifd_ifc_instoffset0[1] & ~ifd_ifc_instoffset0[0];
   assign finst0[1] = ~ifd_ifc_instoffset0[1] &  ifd_ifc_instoffset0[0];
   assign finst0[2] =  ifd_ifc_instoffset0[1] & ~ifd_ifc_instoffset0[0];
   assign finst0[3] =  ifd_ifc_instoffset0[1] &  ifd_ifc_instoffset0[0];

   assign finst1[0] = ~ifd_ifc_instoffset1[1] & ~ifd_ifc_instoffset1[0];
   assign finst1[1] = ~ifd_ifc_instoffset1[1] &  ifd_ifc_instoffset1[0];
   assign finst1[2] =  ifd_ifc_instoffset1[1] & ~ifd_ifc_instoffset1[0];
   assign finst1[3] =  ifd_ifc_instoffset1[1] &  ifd_ifc_instoffset1[0];

   assign finst2[0] = ~ifd_ifc_instoffset2[1] & ~ifd_ifc_instoffset2[0];
   assign finst2[1] = ~ifd_ifc_instoffset2[1] &  ifd_ifc_instoffset2[0];
   assign finst2[2] =  ifd_ifc_instoffset2[1] & ~ifd_ifc_instoffset2[0];
   assign finst2[3] =  ifd_ifc_instoffset2[1] &  ifd_ifc_instoffset2[0];

   assign finst3[0] = ~ifd_ifc_instoffset3[1] & ~ifd_ifc_instoffset3[0];
   assign finst3[1] = ~ifd_ifc_instoffset3[1] &  ifd_ifc_instoffset3[0];
   assign finst3[2] =  ifd_ifc_instoffset3[1] & ~ifd_ifc_instoffset3[0];
   assign finst3[3] =  ifd_ifc_instoffset3[1] &  ifd_ifc_instoffset3[0];

//   mux4ds #(4) finst_mx(.dout (finst_i2),
//                        .in0  (finst0),
//                        .in1  (finst1),
//                        .in2  (finst2),
//                        .in3  (finst3),
//                        .sel0 (dfthr_i2[0]),
//                        .sel1 (dfthr_i2[1]),
//                        .sel2 (dfthr_i2[2]),
//                        .sel3 (dfthr_i2[3]));

   wire [3:0] finst_ev,
              finst_od,
              finst_i2_l;
   wire [1:0] filltid_i2_l;
   bw_u1_inv_10x UZsize_ftid_bf0(.z (filltid_i2_l[0]),
                                 .a (filltid_i2[0]));
   bw_u1_inv_20x UZsize_ftid_bf1(.z (filltid_i2_l[1]),
                                 .a (filltid_i2[1]));
   // use bw_u1_muxi21_4x
   assign finst_ev = filltid_i2_l[1] ? finst0 : finst2;
   assign finst_od = filltid_i2_l[1] ? finst1 : finst3;
   assign finst_i2_l = filltid_i2_l[0] ? (~finst_ev) : (~finst_od);
   assign finst_i2 = ~finst_i2_l;

   assign ifc_ifd_finst_sel_l = ~finst_i2;

   // pick MIL entry corresponding to current thread
   assign milfthr_i2[0] = ~cpxthr_i2[1] & ~cpxthr_i2[0];
   assign milfthr_i2[1] = ~cpxthr_i2[1] &  cpxthr_i2[0];
   assign milfthr_i2[2] =  cpxthr_i2[1] & ~cpxthr_i2[0];
   assign milfthr_i2[3] =  cpxthr_i2[1] &  cpxthr_i2[0];
   assign ifc_ifd_milfill_sel_i2_l = ~milfthr_i2;

   // write request
   // assign ifq_fcl_wrreq_bf = ifc_inv_ifqadv_i2 ? next_wrreq_i2 : wrreq_f;
   // assign ifq_fcl_wrreq_bf = ~ifc_inv_ifqadv_i2 | next_wrreq_i2;
   assign ifq_fcl_wrreq_bf = wrreq_f & ~ifc_inv_ifqadv_i2 | next_wrreq_i2;
   
   dffr_s #(1) wrreq_ff(.din (ifq_fcl_wrreq_bf),
		                  .clk (clk),
		                  .q   (wrreq_f),
		                  .rst (ifq_reset),
		                  .se  (se), .si(), .so());

   // starvation check
   // if a write is not granted for 24 cycles, sound the alarm
   sparc_ifu_ctr5 starv_ctr(
			                      // Outputs
			                      .limit	(starv_alert),
			                      .so	(so),
			                      // Inputs
			                      .clk	(clk),
			                      .se	(se),
			                      .si	(si),
			                      .rst_ctr_l (rst_starv_ctr_l));
   assign rst_starv_ctr_l = ~ifq_reset & wrreq_f;

   // advance in i2 when a write ack is received or if not a fill
   // Can help timing of this signal by doing
   //  ifqadv_nxt = ~ifq_fcl_wrreq_bf | fcl_icd_index_sel_ifq_bf
   assign access_grant_l = ~fcl_ifq_grant_bf;
   bw_u1_nand2_2x UZsize_acc_n2(.z (ifqadvi2_nxt),
                                .a (ifq_fcl_wrreq_bf),
                                .b (access_grant_l));
   dff_s #(1) qadv_ff(.din (ifqadvi2_nxt),
                    .q   (ifqadv_i2_ff),
                    .clk (clk), .se(se), .si(), .so());
   assign ifc_inv_ifqadv_i2 = ifqadv_i2_ff;

   

   // advance in i1 when a write ack is received AND there are no
   // child threads to be taken care of
   assign ifqadv_i1 = (ifc_inv_ifqadv_i2 & ~next_milchld[2] & ~fwd_stall) | 
                        ifq_reset; 

//-----------------------------------
// Errors and Error Packet
//-----------------------------------   

   assign errpkt_i1 = (ifd_ifc_cpxreq_i1 == `CPX_ERRPKT) ? 1'b1 : 1'b0;
   assign errpkt_i2 = (cpxreq_i2 == `ERR_RET) ? ifd_ifc_cpxvld_i2 : 1'b0;

   // Reported Errors are not logged in ERB
   assign ce_rep_i2 = ifd_ifc_cpxce_i2 & ~ifd_ifc_cpxue_i2 & errpkt_i2 &
	                    ifc_inv_ifqadv_i2;
   assign ue_rep_i2 = ifd_ifc_cpxue_i2 & errpkt_i2 & ifc_inv_ifqadv_i2;

   dff_s #(1) cerep_ff(.din (ce_rep_i2),
		                 .q   (ifq_erb_ce_rep),
		                 .clk (clk), .se(se), .si(), .so());
   dff_s #(1) uerep_ff(.din (ue_rep_i2),
		                 .q   (ifq_erb_ue_rep),
		                 .clk (clk), .se(se), .si(), .so());

//   dff #(2) ertid_reg(.din (filltid_i2),
//		                  .q   (ifq_erb_l2err_tid),
//		                  .clk (clk), .se(se), .si(), .so());
   // send thread id one cycle earlier to help crit path
   assign ifq_erb_l2err_tid = filltid_i2;
   
   // Ifetch Errors are logged in ERB
   assign l2_ce_i2 = ifd_ifc_cpxce_i2 & ~ifd_ifc_cpxue_i2 & imissrtn_i2 &
	                   ifc_inv_ifqadv_i2 & mil_uncan_i2;
   assign l2_ue_i2 = ifd_ifc_cpxue_i2 & imissrtn_i2 & ~ifd_ifc_iobpkt_i2 &
	                   ifc_inv_ifqadv_i2 & mil_uncan_i2;
   assign io_ue_i2 = ifd_ifc_cpxue_i2 & imissrtn_i2 & ifd_ifc_iobpkt_i2 &
	                   ifc_inv_ifqadv_i2 & mil_uncan_i2;

   dff_s #(1) l2ce_ff(.din (l2_ce_i2),
		                .q   (ifq_erb_ifet_ce),
		                .clk (clk), .se(se), .si(), .so());
   dff_s #(1) l2ue_ff(.din (l2_ue_i2),
		                .q   (ifq_erb_l2_ue),
		                .clk (clk), .se(se), .si(), .so());
   dff_s #(1) ioue_ff(.din (io_ue_i2),
		                .q   (ifq_erb_io_ue),
		                .clk (clk), .se(se), .si(), .so());

   assign l2_miss_i2 = ifd_ifc_cpxms_i2 & imissrtn_i2 & ifc_inv_ifqadv_i2;
   dff_s #(1) l2ms_ff(.din (l2_miss_i2),
		                .q   (l2_miss_f),
		                .clk (clk), .se(se), .si(), .so());

   assign ifu_tlu_l2imiss = dfthr_f & {4{l2_miss_f}};
   
//--------------------------------------------
// Miss Request Control (IFU interface to PCX)
//--------------------------------------------

   // decode imiss thread
   assign thr_s1[0] = ~fcl_ifq_thr_s1[0] & ~fcl_ifq_thr_s1[1];
   assign thr_s1[1] =  fcl_ifq_thr_s1[0] & ~fcl_ifq_thr_s1[1];
   assign thr_s1[2] = ~fcl_ifq_thr_s1[0] & fcl_ifq_thr_s1[1];
   assign thr_s1[3] =  fcl_ifq_thr_s1[0] & fcl_ifq_thr_s1[1];

   // signal ic miss to thread MIL state machines
   assign icmiss_thr_s = {4{fcl_ifq_icmiss_s1 & ~block_fetch_s1}} & thr_s1 & 
	                       ~icmiss_thr_d;

//   dff #(4) icmsreg(.din  (icmiss_thr_s),
//		                .clk  (clk),
//		                .q    (icmiss_thr_d),
//		                .se   (se), .si(), .so());

   dff_s #(1) icmsd_ff(.din  (fcl_ifq_icmiss_s1),
		                 .clk  (clk),
		                 .q    (icmiss_d1),
		                 .se   (se), .si(), .so());

   assign icmiss_qual_d1 = icmiss_d1 & ~(thr_match_d1e1 & ifeterr_e1);

   // bug 5926
   assign n763 = ~ifd_ifc_newdestid_s[2];
   dff_s #(1) iosp_ff(.din (n763),
		                .q   (iosp_d1_l),
		                .clk (clk), .se(se), .si(), .so());
   
   assign icmiss_thr_d = {4{icmiss_d1 | erb_ifq_ifeterr_d1 & iosp_d1_l}} & thr_d1 |
                         {4{ifeterr_e1}} & thr_e1;
   
   dff_s #(4) thrdreg(.din  (thr_s1),
		                .clk  (clk),
		                .q    (thr_d1),
		                .se   (se), .si(), .so());

   dff_s #(4) threreg(.din  (thr_d1),
		                .clk  (clk),
		                .q    (thr_e1),
		                .se   (se), .si(), .so());

   dff_s #(1) erre_ff(.din (ifeterr_qual_d1),
                    .q   (ifeterr_e1),
                    .clk (clk), .se(se), .si(), .so());
   assign thr_match_d1e1 =  (thr_d1[0] & thr_e1[0] |
                             thr_d1[1] & thr_e1[1] |
                             thr_d1[2] & thr_e1[2] |
                             thr_d1[3] & thr_e1[3]);

//   assign ifeterr_qual_d1 = ~(thr_match_d1e1 & ifeterr_e1) & ~canthr_d1 & 
//                               erb_ifq_ifeterr_d1;
   assign ifeterr_qual_d1 = ~(thr_match_d1e1 & ifeterr_e1) & 
                               erb_ifq_ifeterr_d1 & iosp_d1_l;
     
   assign errthr_d1 = (thr_d1 & {4{ifeterr_qual_d1 & ~block_fetch_d1}});
   
   // If misses to same thread, (in successive cycles), ignore
   assign ifc_ifd_ldmil_sel_new = (thr_s1 & {4{fcl_ifq_rdreq_s1}} &
				                           ~errthr_d1 & ~mil_valid_s);

   // Check hit in MIL -- a thread cannot hit 
   //   1. its own MIL
   //   2. an MIL that is being filled
   //   3. if it is to an IOB line
   assign qualhit_or_io_s = ifd_ifc_milhit_s & comp_valid_s & 
	                          ~thr_s1 & 
                            ~fill_retn_thr_i2 & 
                            {4{~ifd_ifc_newdestid_s[2]}};

   assign any_qualhit_or_io_s = (qualhit_or_io_s[0] |
		                             qualhit_or_io_s[1] |
		                             qualhit_or_io_s[2] |
		                             qualhit_or_io_s[3]);
   
//   assign milhit_qual_s = ifd_ifc_milhit_s & comp_valid_s & 
//	                        ~thr_s1 & 
//                          ~fill_retn_thr_i2 & 
//                          {4{~ifd_ifc_newdestid_s[2]}};
   
//   assign any_milhit_qual_s = any_qualhit_or_io_s & ~ifd_ifc_newdestid_s[2];
   assign any_milhit_qual_s = any_qualhit_or_io_s;   
   
   // Generate Replacement Way
   // Make sure a req doesn't go out to a different way than 
   // what is pending
   assign milhit_vec_s = ifd_ifc_milhit_s & (mil_valid_s | errthr_d1);
   assign any_milhit_s = (|milhit_vec_s[3:0]);
   
//   assign mil_repway_s = (ifd_ifc_mil_repway_s[7:6] & {2{milhit_vec_s[3]}} | 
//                          ifd_ifc_mil_repway_s[5:4] & {2{milhit_vec_s[2]}} | 
//                          ifd_ifc_mil_repway_s[3:2] & {2{milhit_vec_s[1]}} | 
//                          ifd_ifc_mil_repway_s[1:0] & {2{milhit_vec_s[0]}});

//   assign ifc_ifd_repway_s = any_milhit_s ? mil_repway_s : rand_repway_s;
   assign ifc_ifd_repway_s = rand_repway_s;   

   // pick any way at random
   // reset with dbg_init as well
   sparc_ifu_lfsr5  lfsr(.out (rand_repway_s),
			                   .clk  (clk),
			                   .advance (fcl_ifq_icmiss_s1),
			                   .reset (rst_way_lfsr),
			                   .se (se),
			                   .si (si),
			                   .so (so));

   assign rst_way_lfsr = ifq_reset | lsu_ifu_direct_map_l1 | ~gdbginit_l;

   // check if miss req is valid in a given pipe stage
   assign canthr_s1 = (fcl_ifq_canthr[0] & thr_s1[0] |
                       fcl_ifq_canthr[1] & thr_s1[1] |
                       fcl_ifq_canthr[2] & thr_s1[2] |
                       fcl_ifq_canthr[3] & thr_s1[3]);
   assign canthr_d1 = (fcl_ifq_canthr[0] & thr_d1[0] |
                       fcl_ifq_canthr[1] & thr_d1[1] |
                       fcl_ifq_canthr[2] & thr_d1[2] |
                       fcl_ifq_canthr[3] & thr_d1[3]);
   
   // retry a fetch if the imiss occurs while it is being filled
//   assign block_fetch_s1 = any_milhit_s & 
//                           ~(any_qualhit_or_io_s | ifd_ifc_newdestid_s[2]) |
//                           dtu_ifq_kill_latest_d;
   assign block_fetch_s1 = any_milhit_s & ~ifd_ifc_newdestid_s[2] &
                           ~any_qualhit_or_io_s | 
                           dtu_ifq_kill_latest_d |
                           erb_ifq_itlberr_s1;

   dff_s #(1) bfd_ff(.din (block_fetch_s1),
                   .q   (block_fetch_d1),
                   .clk (clk), .se(se), .si(), .so());

   dff_s #(1) tlbe_ff(.din (erb_ifq_itlberr_s1),
                    .q   (itlberr_d1),
                    .clk (clk), .se(se), .si(), .so());
   
//   assign retry_rdy_s1 = block_fetch_s1 & fcl_ifq_icmiss_s1;
//   dff #(1) retrd_ff(.din (retry_rdy_s1),
//                     .q   (retry_rdy_d1),
//                     .clk (clk), .se(se), .si(), .so());
   
   assign retry_rdy_final_d1 = block_fetch_d1 & (icmiss_qual_d1 | 
                                                 ifeterr_qual_d1);
   dff_s #(1) retre_ff(.din (retry_rdy_final_d1),
                     .q   (retry_rdy_e1),
                     .clk (clk), .se(se), .si(), .so());

   assign all_retry_rdy_e1 = {4{retry_rdy_e1}} & thr_e1;
   dff_s #(4) retrm_reg(.din (all_retry_rdy_e1),
                      .q   (all_retry_rdy_m1),
                     .clk (clk), .se(se), .si(), .so());
   
   assign ifq_dtu_thrrdy = mil_thr_ready | all_retry_rdy_m1;

//   assign retry_fetch_s1 = block_fetch_s1 & fcl_ifq_icmiss_s1 & 
//                           ~canthr_s1;
   dff_s #(1) cans_ff(.din (canthr_s1),
                    .q   (canthr_s1_del1),
                    .clk (clk), .se(se), .si(), .so());

   assign ifq_fcl_flush_sonly_e = (block_fetch_d1 & 
                                   (icmiss_qual_d1 & ~canthr_s1_del1 |
                                    ifeterr_qual_d1) & 
                                   ~canthr_d1 & ~itlberr_d1);

   // Determine which thread's MIL was hit, if at all
   // first check if this really was an imiss
   assign icmiss_for_milchk = thr_s1 & ~icmiss_thr_d & ~errthr_d1;
   assign icmiss_qual_s = (|icmiss_for_milchk[3:0]) & fcl_ifq_icmiss_s1 & 
                          ~dtu_ifq_kill_latest_d & ~erb_ifq_itlberr_s1;

   // since multiple requests can be outstanding when an error is
   // encountered, need to prioritise the mil hits.
   // TBD: there must be a cleaner way to do this!
   assign qualhit_pe_s[0] = qualhit_or_io_s[0];
   assign qualhit_pe_s[1] = ~qualhit_or_io_s[0] & qualhit_or_io_s[1];
   assign qualhit_pe_s[2] = ~qualhit_or_io_s[0] & ~qualhit_or_io_s[1] &
                             qualhit_or_io_s[2];
   assign qualhit_pe_s[3] = ~qualhit_or_io_s[0] & ~qualhit_or_io_s[1] &
                            ~qualhit_or_io_s[2] & qualhit_or_io_s[3];
   
   // A thread cannot hit on an MIL to the IOB
   assign milhit_to_thr_s = qualhit_pe_s & {4{icmiss_qual_s & 
                                                 ~ifd_ifc_newdestid_s[2]}};

   // Make Request to PCX if miss in Icache and MIL
   // determine if we need to send req to L2
//   assign newpcxreq_s = icmiss_for_milchk & ~fcl_ifq_canthr;
//   assign newreq_valid = fcl_ifq_icmiss_s1 & ~dtu_ifq_kill_latest_d & 
//	                       (newpcxreq_s[0] | 
//			                    newpcxreq_s[1] | 
//			                    newpcxreq_s[2] | 
//			                    newpcxreq_s[3]) & 
//                           (~any_milhit_s | ifd_ifc_newdestid_s[2]);

   assign newreq_valid = icmiss_qual_s &
                          (~any_milhit_s | ifd_ifc_newdestid_s[2]);

   // check if there are any old requests outstanding, that are not
   // current in  the D stage. 
   assign pcxreq_qual_s = pcxreq_s & ~(dpcxthr_d & {4{req_valid_d}});
   
//   assign reqq_empty = ~(|pcxreq_qual_s[3:0]);
//   assign oldpcxreq_s = pcxreq_qual_s & rr_gnt & ~fcl_ifq_canthr;
//   assign oldreq_valid = (|oldpcxreq_s);
//   assign oldpcxreq_s = pcxreq_qual_s & rr_gnt;   
   assign oldreq_valid = (|pcxreq_qual_s);
	  
   // Send out PCX request in round robin order if there are other
   // reqests pending.  If the request queue is empty send this req
//   assign nextreq_valid_s = ~reqq_empty | newreq_valid;
   
   assign nextreq_valid_s = oldreq_valid | newreq_valid | req_pending_d;

   assign rnd_reset = ifq_reset | ~gdbginit_l;
   
   // round robin assignment to pcx
   sparc_ifu_rndrob  pcxrndrob(.req_vec   (pcxreq_qual_s),
			                         .grant_vec (rr_gnt),
			                         .advance   (req_accept_d),
			                         .rst_tri_enable (rst_tri_en),
			                         .clk       (clk),
			                         .reset     (rnd_reset),
			                         .se  (se),
			                         .si (si),
			                         .so ());

   // if req queue is empty forward the new request to pcx
   // if not store it in the MIL
   assign dpcxthr_s  = req_pending_d ? dpcxthr_d :
	                     ~oldreq_valid ? thr_s1    : 
	                                     rr_gnt;
   dff_s #(4) pcxthr_ff(.din (dpcxthr_s),
		                  .clk (clk),
		                  .q   (dpcxthr_d),
		                  .se  (se), .si(), .so());

   assign thrid_d[0] = dpcxthr_d[3] | dpcxthr_d[1];
   assign thrid_d[1] = dpcxthr_d[3] | dpcxthr_d[2];
   dff_s #(2) tide_reg(.din (thrid_d),
                     .q   (thrid_e),
                     .clk (clk), .se(se), .si(), .so());
   assign ifc_ifd_thrid_e = thrid_e;
   
   // Determine the destination to which the request is made:
   mux4ds #(3) dest_mux(.dout (old_destid_s),
		                    .in0  (ifd_ifc_destid0[2:0]),
		                    .in1  (ifd_ifc_destid1[2:0]),
		                    .in2  (ifd_ifc_destid2[2:0]),
		                    .in3  (ifd_ifc_destid3[2:0]),
		                    .sel0 (rr_gnt[0]),
		                    .sel1 (rr_gnt[1]),
		                    .sel2 (rr_gnt[2]),
		                    .sel3 (rr_gnt[3]));
   
//   mux2ds #(3) fdest_mux(.dout (destid_s),
//		                     .in0  (ifd_ifc_newdestid_s),
//		                     .in1  (old_destid_s),
//		                     .sel0 (~oldreq_valid),
//		                     .sel1 (oldreq_valid));

//   assign destid_s  = req_pending_d ? ifu_lsu_destid_d    :
//	                    ~oldreq_valid ? ifd_ifc_newdestid_s : 
//	                                    old_destid_s;
   assign ifu_lsu_destid_s = oldreq_valid ? old_destid_s :
                                            ifd_ifc_newdestid_s;

   // remove this
   assign destid_iob_s  = req_pending_d ? destid_iob_d :
                                          ifu_lsu_destid_s[2];
   dff_s #(1) destd_reg(.din (destid_iob_s),
		                  .q   (destid_iob_d),
		                  .clk (clk), .se(se), .si(), .so());

   // If this is going to any L2 bank, zero out the line address 
   // for Rams 
   assign ifc_ifd_pcxline_adj_d[4:2] = ifd_ifc_pcxline_d[4:2] & 
                                       {3{destid_iob_d}};
   
   // advace req 
   dffr_s #(1) pcxreqvd_ff(.din  (nextreq_valid_s),
		                     .clk  (clk),
		                     .rst  (ifq_reset),
		                     .q    (req_valid_d),
		                     .se   (se), .si(), .so());

   assign ifu_lsu_pcxreq_d = req_valid_d;

//   assign req_pending_d = req_valid_d & ~can_pcx_d & ~lsu_ifu_pcxpkt_ack_d;
   assign req_pending_d = req_valid_d & ~(lsu_ifu_pcxpkt_ack_d & ~errinv_d1);
   assign req_accept_d = req_valid_d & lsu_ifu_pcxpkt_ack_d;
//   assign rr_advance_d = req_accept_d & ~errinv_d1

   // Signal to FSM if pcx request has been accepted by LSU
   assign pcx_accept_d = dpcxthr_d & {4{req_accept_d}};
   // Alternate implementation with canthr delayed by a cycle
//   assign pcxreq_vbit_d = req_valid_d & ~can_pcx_d;
//   assign pcx_accept_d = dpcxthr_d & {4{req_accept_d}} & ~fcl_ifq_canthr;

   // check if there was an error to this thread
   assign err_vec_d1 = dpcxthr_d & (errthr_d1 | err_req);
   assign errinv_d1 = (|err_vec_d1[3:0]);

   dff_s #(1) errinv_ff(.din (errinv_d1),
		                  .q   (ifc_ifd_errinv_e),
		                  .clk (clk), .se(se), .si(), .so());
   
   assign pcxreq_vbit_d = req_valid_d;   
   dff_s #(1) pcxreqve_ff(.din  (pcxreq_vbit_d),  // same as ifu_lsu_pcxreq_d
		                    .clk  (clk),
		                    .q    (ifc_ifd_reqvalid_e),
		                    .se   (se), .si(), .so());

//   dff #(1) pcxreqpe_ff(.din  (req_pending_d),
//		                    .clk  (clk),
//		                    .q    (req_pending_e),
//		                    .se   (se), .si(), .so());

   // advance pcx request if there is no prev request pending
   // the data is deliberately held valid for one extra cycle.  this
   // is legacy stuff.  LSU guarantees that the data is picked up
   // minimum 1 cycle after request is made. 
//   assign ifc_ifd_nxtpcx_sel_new_d = ~req_pending_e;
//   assign ifc_ifd_nxtpcx_sel_new_d = 1'b1;   

   // Select which MIL request to send out to PCX
   assign ifc_ifd_milreq_sel_d_l[0] = ~dpcxthr_d[0] & ~rst_tri_en;
   assign ifc_ifd_milreq_sel_d_l[1] = ~dpcxthr_d[1] | rst_tri_en;
   assign ifc_ifd_milreq_sel_d_l[2] = ~dpcxthr_d[2] | rst_tri_en;
   assign ifc_ifd_milreq_sel_d_l[3] = ~dpcxthr_d[3] | rst_tri_en;


//-----------------------------
// Invalidate Controls
//----------------------------
   assign stpkt_i1 = (ifd_ifc_cpxreq_i1 == `CPX_STRPKT) ? 1'b1 : 1'b0;
   assign strmack_i1 = (ifd_ifc_cpxreq_i1 == `CPX_STRMACK) ? 1'b1 : 1'b0;
   assign evpkt_i1 = (ifd_ifc_cpxreq_i1 == `CPX_EVPKT) ? 1'b1 : 1'b0;
   assign ldpkt_i1 = (ifd_ifc_cpxreq_i1 == `CPX_LDPKT) ? 1'b1 : 1'b0;
   
   assign invalidate_i1 = (stpkt_i1 | strmack_i1 | evpkt_i1 | ldpkt_i1);
   assign ifu_lsu_inv_clear = ~(invalidate_i1 | inv_ifc_inv_pending);
//	 assign ifc_inv_wrreq_i2 = (imissrtn_i2 |
//                              asireq_i2 & asi_ic_tag_i2 & ~asi_load_i2 |
//			                        mbist_icache_write);
   
//   assign wrt_en_wd0_i2 = inv_ifc_word0_inv_i2 & (stpkt_i2 | evpkt_i2) |
//                          ldinv_i2 & ~ifd_ifc_ldaddr5_i2 |
//		                      (imissrtn_i2 |
//                           asireq_i2 & asi_ic_tag_i2 & ~asi_load_i2 |
//			                     mbist_icache_write) & 
//	                       ~ifd_ifc_missaddr5_i2;
//
//   assign wrt_en_wd1_i2 = inv_ifc_word1_inv_i2 & (stpkt_i2 | evpkt_i2) |
//			                      ldinv_i2 & ifd_ifc_ldaddr5_i2 |
//		                        (imissrtn_i2 |
//			                       asireq_i2 & asi_ic_tag_i2 & ~asi_load_i2 |
//			                       mbist_icache_write) & 
//	                        ifd_ifc_missaddr5_i2;
   
   // calculate the ICV write data
   assign icv_wbit_i2 = imissrtn_i2 & ifc_ifd_filladdr4_i2 |
	                   asireq_i2 & asi_ic_tag_i2 & ~asi_load_i2 & 
	                   cpxreq_i2[2];
   
   assign icv_wrdata_i2 = ifc_inv_ifqadv_i2 ? icv_wbit_i2 : icv_wrdata_f;
   
//   mux2ds #(2) icv_damux(.dout (icv_wrdata_i2),
//		                     .in0  (icv_wrdata_f),
//		                     .in1  (icv_wbit_i2),
//		                     .sel0 (~ifc_inv_ifqadv_i2),
//		                     .sel1 (ifc_inv_ifqadv_i2));

   dff_s #(1) icv_daff(.din  (icv_wrdata_i2),
		                 .q    (icv_wrdata_f),
		                 .clk  (clk),
		                 .se   (se), .si(), .so());
   assign ifq_icv_wrdata_bf = icv_wrdata_i2;


// Begin ECO7010
   dp_mux2es #(1) wayvld_mux (.dout (inq_wayvld_i1_nxt),        //done
			      .in0 (lsu_ifu_cpxpkt_wayvld_i1),
			      .in1 (inq_wayvld_i1),
			      .sel(inq_vld));

   dff_s #(1) wayvld_ff (.din (inq_wayvld_i1_nxt),             //done
                       .q   (inq_wayvld_i1),
                       .clk (clk), .se(se), .si(), .so());
   
   assign ldinv_i1 = ldpkt_i1 & inq_wayvld_i1;  //done

   dp_mux2es #(1) ldinv_i2_mux (.dout (ldinv_i2_nxt),  //done
			      .in0 (ldinv_i1),
			      .in1 (ldinv_i2),
			      .sel(ifc_ifd_ifqbyp_en_l));

   dff_s #(1) ldinv_i2_ff (.din (ldinv_i2_nxt),   //done
			 .q   (ldinv_i2),
			 .clk (clk), .se(se), .si(), .so());   

//End ECO7010

//------------------------------------------------
// Fwd Request to read/write Icache
//------------------------------------------------
   // is this a fwd req to the L1I?
   assign fwdreq_i2 = (cpxreq_i2 == `FWD_RQ_RET) ? 
                        (ifd_ifc_fwd2ic_i2 & ifd_ifc_4bpkt_i2 &
                         ifd_ifc_cpxvld_i2) : 1'b0;

   // detect first cycle of fwdpkt and stall
   assign fwd_stall = fwdreq_i2 & ~fwdreq_i3;
   
   dff_s #(1) freq_ff(.din (fwd_stall),
                    .q   (fwdreq_i3),
                    .clk (clk), .se(se), .si(), .so());

   dff_s #(1) cpx3_ff(.din (ifd_ifc_cpxnc_i2),
                    .q   (cpxnc_i3),
                    .clk (clk), .se(se), .si(), .so());

   // NC bit is also R/W_bar bit
   assign fwdrd_i3 = fwdreq_i3 & cpxnc_i3;
   assign fwdwr_i3 = fwdreq_i3 & ~cpxnc_i3;

   // ack back to the LSU to send fwd reply
   assign ifu_lsu_fwd_wr_ack = fwdwr_i3;
   assign ifc_ifd_idx_sel_fwd_i2 = fwdreq_i2;

   // let errctl know a fwd packet is coming
   assign ifq_erb_fwdrd_bf = fwdrd_i3;
   
//----------------------------------
// INQ controls -- now ibuf controls
//----------------------------------

// INQ removed 2/13/02   

   // Is the pkt in the inq a pkt that affects the icache?
   assign ic_pkt_i1 = invalidate_i1 | imissrtn_i1 | errpkt_i1;
   
//   assign inq_vld_nxt = ~inq_vld & ifd_ifc_cpxvalid_i1 & 
//	                      (~ifqadv_i1 | asireq_i1) | 
//	                      inq_vld & ((~ifqadv_i1 | asireq_i1) & ic_pkt_i1 |
//				                             ifd_ifc_cpxvalid_i1);

   // cut this down to 1 aoi gate
   assign inq_vld_nxt = (ifd_ifc_cpxvalid_i1 |
                         inq_vld & ic_pkt_i1) & (~ifqadv_i1 | ifu_asireq_i1);
   
   dffr_s #(1) inqv_ff(.din (inq_vld_nxt),
		                 .q   (inq_vld),
		                 .rst (ifq_reset),
		                 .clk (clk), .se(se), .si(), .so());

   assign ifc_ifd_ifqbyp_en_l = ~(ifqadv_i1 | fwd_stall);
   
   assign ifc_ifd_ifqbyp_sel_fwd_l = ~(fwd_stall & ~ifq_reset);
   assign ifc_ifd_ifqbyp_sel_asi_l = ~(~fwd_stall & ~ifq_reset & 
                                       ifu_asireq_i1);
   assign ifc_ifd_ifqbyp_sel_inq_l = ~(~fwd_stall & ~ifq_reset & 
                                       ~ifu_asireq_i1 & inq_vld);
   assign ifc_ifd_ifqbyp_sel_lsu_l = ~(~fwd_stall & ~ifu_asireq_i1 & 
                                       ~inq_vld | ifq_reset);

   assign byp_sel_asi_l = ~(ifqadv_i1 & ifu_asireq_i1);
   
//   assign ifu_lsu_ibuf_busy = inq_vld & (~ifqadv_i1 | asireq_i1);
//   assign ifc_ifd_ld_inq_i1 = ~inq_vld | ifqadv_i1 & ~asireq_i1;

   assign ifu_lsu_ibuf_busy = inq_vld;
   assign ifc_ifd_ld_inq_i1 = ~inq_vld;

//-----------------------------------------
// ASI access controls
//-----------------------------------------

   // need this to help with timing
   // - asi_vld is asserted only if the asi transaction is to an IFU asi
   //   register AND that register is not in the IMMU.
   // - it is held valid until an ack is signalled .
   // - the ack is not signalled for atleast 2 cycles
   assign asi_vld_next = lsu_ifu_asi_vld & byp_sel_asi_l & 
	                       ~asireq_i2 & ~illva_i2;  // not when ack is sent
   
   dff_s #(1) asiv0_ff(.din (asi_vld_next),
		                .q   (asi_vld_i0),
		                .clk (clk), .se(se), .si(), .so());
   assign asi_vld_qual_i0 = asi_vld_i0 & ~asireq_i2 & ~illva_i2 &
                            byp_sel_asi_l & ~illva_i1 &
                            lsu_ifu_asi_vld;

   dff_s #(8) asi_reg(.din (lsu_ifu_asi_state[7:0]),
		                .q   (asi_state_i1),
		                .clk (clk), .se(se), .si(), .so());

   dff_s #(2) asi_tid_reg(.din (lsu_ifu_asi_thrid[1:0]),
		                    .q   (ifq_fcl_asi_tid_bf[1:0]),
		                    .clk (clk), .se(se), .si(), .so());

//   assign ifu_lsu_asi_ack = ~byp_sel_asi_l;
   // Decided to wait one more cycle before sending the ack.
   assign ifu_lsu_asi_ack = asireq_i2 | illva_i2;   
   
   // ifu ASIs
   // icache data = 0x66
   assign asi_ic_data_unchk_i1 = ~asi_state_i1[7] & 
	        asi_state_i1[6] & 
	        asi_state_i1[5] & 
	        ~asi_state_i1[4] & 
	        ~asi_state_i1[3] & 
		      asi_state_i1[2] & 
		      asi_state_i1[1] & 
		      ~asi_state_i1[0];
   assign asi_ic_data_i1 = asi_ic_data_unchk_i1;
   
   // icache tags = 0x67
   // writing to tag also writes to vbits
   assign asi_ic_tag_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      ~asi_state_i1[3] & 
		      asi_state_i1[2] & 
		      asi_state_i1[1] & 
		      asi_state_i1[0];
   assign asi_ic_tag_i1 = asi_ic_tag_unchk_i1;

   // error enable 0x4B
   assign asi_erren_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      ~asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      asi_state_i1[3] & 
		      ~asi_state_i1[2] & 
		      asi_state_i1[1] & 
		      asi_state_i1[0];
   assign asi_erren_i1 =  asi_erren_unchk_i1 &
          ~ifd_ifc_asi_vachklo_i2 &
          ~ifd_ifc_asiaddr_i2[2];
   
   // error status 0x4C
   assign asi_errstat_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      ~asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      asi_state_i1[3] & 
		      asi_state_i1[2] & 
		      ~asi_state_i1[1] & 
		      ~asi_state_i1[0];
   assign asi_errstat_i1 = asi_errstat_unchk_i1 &
          ~ifd_ifc_asi_vachklo_i2 &
          ~ifd_ifc_asiaddr_i2[2];

   // error addr 0x4D
   assign asi_erraddr_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      ~asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      asi_state_i1[3] & 
		      asi_state_i1[2] & 
		      ~asi_state_i1[1] & 
		      asi_state_i1[0];
   assign asi_erraddr_i1 =  asi_erraddr_unchk_i1 &
          ~ifd_ifc_asi_vachklo_i2 &
          ~ifd_ifc_asiaddr_i2[2];

   // error inject 0x43
   assign asi_errinj_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      ~asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      ~asi_state_i1[3] & 
		      ~asi_state_i1[2] & 
		      asi_state_i1[1] & 
		      asi_state_i1[0];
   assign asi_errinj_i1 =  asi_errinj_unchk_i1 &
          ~ifd_ifc_asi_vachklo_i2 &
          ~ifd_ifc_asiaddr_i2[2];

   // imask 0x42, va=0x8
   assign asi_imask_unchk_i1 = ~asi_state_i1[7] & 
		      asi_state_i1[6] & 
		      ~asi_state_i1[5] & 
		      ~asi_state_i1[4] & 
		      ~asi_state_i1[3] & 
		      ~asi_state_i1[2] & 
		      asi_state_i1[1] & 
		      ~asi_state_i1[0];
   assign asi_imask_i1 = asi_imask_unchk_i1  &
          ~ifd_ifc_asi_vachklo_i2 &
          ifd_ifc_asiaddr_i2[2];  // this is actually va[3]

   // illegal va check
   assign illva_i0 = ((asi_erren_unchk_i1 |
                       asi_errstat_unchk_i1 |
                       asi_errinj_unchk_i1 |
                       asi_erraddr_unchk_i1) & (ifd_ifc_asi_vachklo_i2 |
                                                ifd_ifc_asiaddr_i2[2])) &
                       asi_vld_qual_i0;

   dff_s #(1) illvai1_ff(.din (illva_i0),
                       .q   (illva_i1),
                       .clk (clk), .se(se), .si(), .so());
   dff_s #(1) illvabf_ff(.din (illva_i1),
                     .q   (illva_i2),
                     .clk (clk), .se(se), .si(), .so());
   dff_s #(1) illvaf_ff(.din (illva_i2),
                     .q   (illva_f),
                     .clk (clk), .se(se), .si(), .so());
   dff_s #(1) illvas_ff(.din (illva_f),
                      .q   (illva_s),
                      .clk (clk), .se(se), .si(), .so());
   dff_s #(1) illvaw2_ff(.din (illva_s),
                       .q   (illva_w2),
                       .clk (clk), .se(se), .si(), .so());
   assign ifu_lsu_ldxa_illgl_va_w2 = illva_w2;

   dff_s #(1) tagasi_ff(.din (asi_ic_tag_i1),
		                  .q   (asi_ic_tag_i2),
		                  .clk (clk), .se(se), .si(), .so());
   dff_s #(1) datasi_ff(.din (asi_ic_data_i1),
		                  .q   (asi_ic_data_i2),
		                  .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asieeni2_ff(.din (asi_erren_i1),
		                    .q   (ifq_erb_asi_erren_i2),
		                    .clk (clk), .se(se), .si(), .so());
   dff_s #(1) asieini2_ff(.din (asi_errinj_i1),
		                    .q   (ifq_erb_asi_errinj_i2),
		                    .clk (clk), .se(se), .si(), .so());
   dff_s #(1) asiesti2_ff(.din (asi_errstat_i1),
		                    .q   (ifq_erb_asi_errstat_i2),
		                    .clk (clk), .se(se), .si(), .so());
   dff_s #(1) asieadi2_ff(.din (asi_erraddr_i1),
		                    .q   (ifq_erb_asi_erraddr_i2),
		                    .clk (clk), .se(se), .si(), .so());
   dff_s #(1) imaski2_ff(.din (asi_imask_i1),
		                   .q   (ifq_erb_asi_imask_i2),
		                   .clk (clk), .se(se), .si(), .so());

   // All IFU asi requests
   assign ifu_asireq_i0 = (asi_ic_tag_i1 | asi_ic_data_i1 | asi_erren_i1 |
		                       asi_errinj_i1 | asi_errstat_i1 | asi_erraddr_i1 |
		                       asi_imask_i1) & asi_vld_qual_i0;

   dff_s #(1) asireq1_ff(.din  (ifu_asireq_i0),
		                   .q    (ifu_asireq_i1),
		                   .clk  (clk), .se(se), .si(), .so());
   
   dff_s #(1) asivld_ff(.din  (byp_sel_asi_l),
		                  .q    (asireq_i2_l),
		                  .clk  (clk), .se(se), .si(), .so());
   assign asireq_i2 = ~asireq_i2_l;
   assign ifc_inv_asireq_i2 = asireq_i2;

   // Stall if we are doing an asi op or fwdreq
  assign stallreq_d0 = (ifu_asireq_i0 | 
                         ~byp_sel_asi_l |
                         fwdreq_i2) | 
                          starv_alert | 
                          mbist_ifq_run_bist |
	                  ldinv_i1 & ~ifqadv_i1 |        //ECO 7010
                  	  ldinv_i2 & ~ifc_inv_ifqadv_i2; //ECO 7010

   dff_s #(1) stal_ff(.din (stallreq_d0),
                    .q   (stallreq_d1),
                    .clk (clk), .se(se), .si(), .so());

   // split into two to save repeater
   assign ifq_fcl_stallreq = stallreq_d1;
   assign ifq_swl_stallreq = stallreq_d1;

   dff_s #(1) asil1_ff(.din (lsu_ifu_asi_load),
		                 .q   (asi_load_i1),
		                 .clk (clk), .se(se), .si(), .so());

   dff_s #(1) asil2_ff(.din (asi_load_i1),
		                 .q   (asi_load_i2),
		                 .clk (clk), .se(se), .si(), .so());

   // insert parity error in data and/or tag
   // Don't need to qualify with asireq and imissrtn...
   //   -- moved this to the DP since the qual is not necessary
//   assign ifc_ifd_insert_pe = (asireq_i2 | imissrtn_i2) & 
//				ifd_ifc_cpxue_i2;

   // decode asi
   // generate word selects
   // can use finst instead of word_sel_i2, but it screws up timing
   
   assign word_sel_i2[0] = ~ifd_ifc_asiaddr_i2[3] & ~ifd_ifc_asiaddr_i2[2];
   assign word_sel_i2[1] = ~ifd_ifc_asiaddr_i2[3] &  ifd_ifc_asiaddr_i2[2];
   assign word_sel_i2[2] =  ifd_ifc_asiaddr_i2[3] & ~ifd_ifc_asiaddr_i2[2];
   assign word_sel_i2[3] =  ifd_ifc_asiaddr_i2[3] &  ifd_ifc_asiaddr_i2[2];

   // this assumes asi requests are never stalled
   assign ifq_icd_worden_bf = (word_sel_i2 | {4{~asireq_i2 & ~fwdwr_i3  |
//                                                ~ifc_inv_ifqadv_i2 | 
                                                mbist_icache_write}});
// & (mbist_icache_worden | {4{~bist_op}});

   // choose where the ic address should come from
//   assign bist_op = (mbist_icache_read | mbist_icache_write);
   dff_s #(1) bist_run_ff(.din (mbist_ifq_run_bist),
                        .q   (bist_op),
                        .clk (clk), .se(se), .si(), .so());
   
   assign ifc_ifd_addr_sel_bist_i2_l = ~bist_op | sehold;
   assign ifc_ifd_addr_sel_old_i2_l = (bist_op | ifc_inv_ifqadv_i2) & ~sehold;
   assign ifc_ifd_addr_sel_asi_i2_l = bist_op | ~ifc_inv_ifqadv_i2 | 
                                      sehold | ~(asireq_i2 | fwdreq_i3);
   assign ifc_ifd_addr_sel_fill_i2_l = bist_op | ~ifc_inv_ifqadv_i2 | 
                                       sehold | asireq_i2 | fwdreq_i3;

   // choose where the data should come from
   assign ifq_icd_data_sel_bist_i2 = mbist_icache_write & ~sehold;
   assign ifq_icd_data_sel_fill_i2 = ~mbist_icache_write & ifc_inv_ifqadv_i2 &
                                     ~sehold;
   assign ifq_icd_data_sel_old_i2 = ~mbist_icache_write & ~ifc_inv_ifqadv_i2 |
                                     sehold;
   
   // generate icache controls
   assign ifq_fcl_rdreq_bf = asireq_i2 & asi_load_i2 & 
	                           (asi_ic_data_i2 | asi_ic_tag_i2) |
	                           mbist_icache_read |
                             fwdrd_i3;

   assign ifq_fcl_icd_wrreq_bf = asi_ic_data_i2 & asireq_i2 & ~asi_load_i2 |
	                               mbist_icache_write |
                                 fwdwr_i3;

   assign ifq_fcl_ictv_wrreq_bf = asi_ic_tag_i2 & asireq_i2 & ~asi_load_i2;

   assign rd_tag_bf = asi_ic_tag_i2 & asi_load_i2;
   dff_s #(1) asi_srcf_ff(.din (rd_tag_bf),
		               .q   (ifq_erb_rdtag_f),
		               .clk (clk), .se(se), .si(), .so());
   
   assign rdinst_bf = asi_ic_data_i2 & asi_load_i2;
   dff_s #(1) asi_inst_ff(.din (rdinst_bf),
		               .q   (ifq_erb_rdinst_f),
		               .clk (clk), .se(se), .si(), .so());

   assign asird_i1 = asi_load_i1 & (~byp_sel_asi_l | illva_i1);
   dff_s #(1) asirdq_ff(.din (asird_i1),
                      .q   (ifq_fcl_asird_bf),
                      .clk (clk), .se(se), .si(), .so());

   assign ifq_erb_asiwr_i2 = ~asi_load_i2 & asireq_i2;



   // Shadow scan mux
   mux4ds #(4) milss_mux(.dout (ifq_sscan_data[3:0]),
                         .in0  (mil0_state),
                         .in1  (mil1_state),
                         .in2  (mil2_state),
                         .in3  (mil3_state),
                         .sel0 (ctu_sscan_tid[0]),
                         .sel1 (ctu_sscan_tid[1]),
                         .sel2 (ctu_sscan_tid[2]),
                         .sel3 (ctu_sscan_tid[3]));
   

   
endmodule // sparc_ifu_ifqctl

