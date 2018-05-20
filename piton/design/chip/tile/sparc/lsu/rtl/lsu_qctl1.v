// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_qctl1.v
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
//  Description:  LSU Queue Control for Sparc Core  
//      - includes monitoring for pcx queues
//      - control for lsu datapath
//      - rd/wr control of dfq 
*/
////////////////////////////////////////////////////////////////////////
// header file includes
////////////////////////////////////////////////////////////////////////
`include  "sys.h" // system level definition file which contains the 
                  // time scale definition
`include  "iop.h" 

`include  "lsu.tmp.h" 

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu_qctl1 ( /*AUTOARG*/
   // Outputs
   lsu_bld_helper_cmplt_m, lsu_bld_cnt_m, lsu_bld_reset, 
   lsu_pcx_rq_sz_b3, lsu_ramtest_rd_w, ld_stb_full_raw_w2, 
   lsu_ld_pcx_rq_sel_d2, spc_pcx_req_pq, spc_pcx_atom_pq, 
   lsu_ifu_pcxpkt_ack_d, pcx_pkt_src_sel, lmq_enable, 
   imiss_pcx_mx_sel, fwd_int_fp_pcx_mx_sel, lsu_ffu_bld_cnt_w, 
   lsu_ld_pcx_rq_mxsel, ld_pcx_thrd, lsu_spu_ldst_ack, 
   pcx_rq_for_stb, pcx_rq_for_stb_d1, lsu_ffu_ack, 
   lsu_ifu_ld_pcxpkt_vld, lsu_pcx_req_squash0, lsu_pcx_req_squash1, 
   lsu_pcx_req_squash2, lsu_pcx_req_squash3, lsu_pcx_req_squash_d1, 
   lsu_pcx_ld_dtag_perror_w2, lsu_tlu_dcache_miss_w2, lsu_bld_pcx_rq, 
   lsu_bld_rq_addr, lsu_fwdpkt_pcx_rq_sel, lsu_imiss_pcx_rq_sel_d1, 
   lsu_tlu_pcxpkt_ack, lsu_intrpt_cmplt, lsu_lmq_byp_misc_sel, 
   lsu_sscan_data, so, lsu_dfq_byp_tid_d1_sel, lmq0_pcx_pkt_way, 
   lmq1_pcx_pkt_way, lmq2_pcx_pkt_way, lmq3_pcx_pkt_way, 
   lsu_st_pcx_rq_pick, lsu_stb_pcx_rvld_d1, lsu_stb_rd_tid, 
   lsu_ld0_spec_vld_kill_w2, lsu_ld1_spec_vld_kill_w2, 
   lsu_ld2_spec_vld_kill_w2, lsu_ld3_spec_vld_kill_w2, 
   lsu_st_pcx_rq_vld, 
   // Inputs
   rclk, si, se, sehold, grst_l, arst_l, lsu_quad_word_access_g, 
   pcx_spc_grant_px, ld_inst_vld_e, lsu_ldst_va_m, stb0_l2b_addr, 
   stb1_l2b_addr, stb2_l2b_addr, stb3_l2b_addr, lsu_ld_miss_g, 
   ifu_lsu_ldst_fp_e, ld_rawp_st_ced_w2, ld_rawp_st_ackid_w2, 
   stb0_crnt_ack_id, stb1_crnt_ack_id, stb2_crnt_ack_id, 
   stb3_crnt_ack_id, ifu_tlu_thrid_e, ldxa_internal, 
   spu_lsu_ldst_pckt, spu_lsu_ldst_pckt_vld, ifu_tlu_inst_vld_m, 
   ifu_lsu_flush_w, ifu_lsu_casa_e, lsu_ldstub_g, lsu_swap_g, 
   stb0_atm_rq_type, stb1_atm_rq_type, stb2_atm_rq_type, 
   stb3_atm_rq_type, tlb_pgnum_g, stb_rd_for_pcx, ffu_lsu_data, 
   ffu_lsu_fpop_rq_vld, ifu_lsu_ldst_dbl_e, ifu_lsu_pcxreq_d, 
   ifu_lsu_destid_s, ifu_lsu_pref_inst_e, tlb_cam_hit_g, 
   lsu_blk_asi_m, stb_cam_hit_bf, lsu_fwdpkt_vld, 
   lsu_dcfill_active_e, dfq_byp_sel, lsu_dfq_ld_vld, lsu_fldd_vld_en, 
   lsu_dfill_dcd_thrd, lsu_fwdpkt_dest, tlu_lsu_pcxpkt_tid, 
   lsu_stb_empty, tlu_lsu_pcxpkt_vld, tlu_lsu_pcxpkt_l2baddr, 
   ld_sec_hit_thrd0, ld_sec_hit_thrd1, ld_sec_hit_thrd2, 
   ld_sec_hit_thrd3, ld_thrd_byp_sel_e, lsu_st_pcx_rq_kill_w2, 
   ifu_lsu_alt_space_e, lsu_dfq_byp_tid, dfq_byp_ff_en, 
   stb_ld_full_raw, stb_ld_partial_raw, stb_cam_mhit, 
   lsu_ldquad_inst_m, stb_cam_wr_no_ivld_m, lsu_ldst_va_way_g, 
   lsu_dcache_rand, lsu_encd_way_hit, lsu_way_hit_or, dc_direct_map, 
   lsu_tlb_perr_ld_rq_kill_w, lsu_dcache_tag_perror_g, 
   lsu_ld_inst_vld_g, asi_internal_m, ifu_lsu_pcxpkt_e_b50, 
   lda_internal_m, atomic_m, lsu_dcache_iob_rd_w, 
   ifu_lsu_fwd_data_vld, rst_tri_en, lsu_no_spc_pref, 
   tlu_early_flush_pipe2_w, lsu_ttype_vld_m2
   );


input     rclk ;
input                   si;
input                   se;
input                   sehold;
input                   grst_l;
input                   arst_l;

//input [1:0] 		ld_pcx_pkt_wy_g ;
input			lsu_quad_word_access_g ;

// LSU <- PCX
// bit5 - FP, bit4 - IO.
input [4:0]             pcx_spc_grant_px ;    // pcx grants packet to destination.
input                   ld_inst_vld_e;        // valid ld inst; d-stage
input [7:6]             lsu_ldst_va_m ;           // Virt. Addr. of ld/st/atomic.

input [2:0]             stb0_l2b_addr ;         // st's addr for pcx - thread0.
input [2:0]             stb1_l2b_addr ;         // st's addr for pcx - thread1.
input [2:0]             stb2_l2b_addr ;         // st's addr for pcx - thread2.
input [2:0]             stb3_l2b_addr ;         // st's addr for pcx - thread3.
input                   lsu_ld_miss_g ;         // load misses in dcache.
//input                   lsu_ld_hit_g ;          // load hits in dcache.
input                   ifu_lsu_ldst_fp_e ;     // fp load/store.

//input                   ld_stb_full_raw_g ;    // full raw for load - thread0
//input                   ld_stb_partial_raw_g ; // partial raw for load - thread0
input                   ld_rawp_st_ced_w2 ;      // store has been acked - thread0
//input                   ld_rawp_st_ced_g ;      // store has been acked - thread0
input   [2:0]           ld_rawp_st_ackid_w2 ;    // ackid for acked store - thread0
input [2:0]             stb0_crnt_ack_id ;      // ackid for crnt outstanding st. 
input [2:0]             stb1_crnt_ack_id ;      // ackid for crnt outstanding st. 
input [2:0]             stb2_crnt_ack_id ;      // ackid for crnt outstanding st. 
input [2:0]             stb3_crnt_ack_id ;      // ackid for crnt outstanding st. 
input [1:0]             ifu_tlu_thrid_e ;       // thread-id
input                   ldxa_internal ;         // internal ldxa, stg g 

input [`PCX_AD_LO+7:`PCX_AD_LO+6] spu_lsu_ldst_pckt ;  // addr bits
input                   spu_lsu_ldst_pckt_vld ; // vld
input                   ifu_tlu_inst_vld_m ;    // inst is vld - wstage

input                   ifu_lsu_flush_w ;  	// ifu's flush
input                   ifu_lsu_casa_e ;        // compare-swap instr
input                   lsu_ldstub_g ;          // ldstub(a) instruction
input                   lsu_swap_g ;            // swap(a) instruction 
input  [2:1]            stb0_atm_rq_type ;      // stb pcx rq type - atomic
input  [2:1]            stb1_atm_rq_type ;      // stb pcx rq type - atomic
input  [2:1]            stb2_atm_rq_type ;      // stb pcx rq type - atomic
input  [2:1]            stb3_atm_rq_type ;      // stb_pcx_rq_type - atomic
input [39:37]           tlb_pgnum_g ;           // ldst access to io 
input [3:0]             stb_rd_for_pcx ;        // rd for pcx can be scheduled
input [80:79]           ffu_lsu_data ;
input                   ffu_lsu_fpop_rq_vld ;   // ffu dispatches fpop issue request.
input                   ifu_lsu_ldst_dbl_e ;    // ld/st double
input                   ifu_lsu_pcxreq_d ;
input   [2:0]           ifu_lsu_destid_s ;
input			ifu_lsu_pref_inst_e ;	   // prefetch inst
input 			tlb_cam_hit_g ;		   // tlb cam hit ; error included
input			lsu_blk_asi_m ;
//input                   stb_cam_wptr_vld;
input		        stb_cam_hit_bf;

input                   lsu_fwdpkt_vld;
//input  [3:0]            lsu_error_rst;
input                   lsu_dcfill_active_e;
input  [3:0]            dfq_byp_sel ;	
//input  [3:0]            lsu_dfq_byp_mxsel ;	
//input  [3:0]            lsu_st_ack_rq_stb ;
input                   lsu_dfq_ld_vld;
input                   lsu_fldd_vld_en;
input  [3:0]            lsu_dfill_dcd_thrd ;
input  [4:0]            lsu_fwdpkt_dest ;
   
input [19:18]           tlu_lsu_pcxpkt_tid ;
input   [3:0]           lsu_stb_empty ;
input                   tlu_lsu_pcxpkt_vld ;
input [11:10]           tlu_lsu_pcxpkt_l2baddr ;
input                   ld_sec_hit_thrd0 ;      // ld has sec. hit against th0
input                   ld_sec_hit_thrd1 ;      // ld has sec. hit against th1
input                   ld_sec_hit_thrd2 ;      // ld has sec. hit against th2
input                   ld_sec_hit_thrd3 ;      // ld has sec. hit against th3
input [2:0]             ld_thrd_byp_sel_e ;       // stb,ldxa thread byp sel
input   [3:0]   	lsu_st_pcx_rq_kill_w2 ;

input			ifu_lsu_alt_space_e ;
input   [1:0]           lsu_dfq_byp_tid;

input                   dfq_byp_ff_en;

//input	[3:0]		lsu_dtag_perror_w2 ;

input [7:0]   		stb_ld_full_raw ;
input [7:0]   		stb_ld_partial_raw ;

input			stb_cam_mhit ;		// multiple hits in stb
input      		lsu_ldquad_inst_m ; // ldquad inst

input			stb_cam_wr_no_ivld_m ;

input  [1:0]            lsu_ldst_va_way_g ;          // 12:11 for direct map
input  [1:0]            lsu_dcache_rand;
input  [1:0]            lsu_encd_way_hit;
input                   lsu_way_hit_or;
input                   dc_direct_map;
//input                   lsu_quad_asi_g;

input			lsu_tlb_perr_ld_rq_kill_w ;

input                   lsu_dcache_tag_perror_g ;  // dcache tag parity error
input   [3:0]           lsu_ld_inst_vld_g ;
//input                  lsu_pcx_ld_dtag_perror_w2 ;	// from qctl2

input			asi_internal_m ;

input			ifu_lsu_pcxpkt_e_b50 ;

input			lda_internal_m ;
input			atomic_m ;

input			lsu_dcache_iob_rd_w ;
input			ifu_lsu_fwd_data_vld ;

input                   rst_tri_en ;

output			lsu_bld_helper_cmplt_m ;
output	[2:0]		lsu_bld_cnt_m ;
output			lsu_bld_reset ;

output			lsu_pcx_rq_sz_b3 ;

output			lsu_ramtest_rd_w ;


output 	   		ld_stb_full_raw_w2 ;

output 	[3:0]		lsu_ld_pcx_rq_sel_d2 ;
   
output  [4:0]           spc_pcx_req_pq;         // request destination for packet.
              // FPU, IO, L2_BANK[3:0].
              // 1-hot - create monitor !
output                  spc_pcx_atom_pq ;       // atomic packet. 
output                  lsu_ifu_pcxpkt_ack_d ;  // ack for I$ fill request.
output  [3:0]           pcx_pkt_src_sel ;	// - qdp1
output  [3:0]           lmq_enable ;	// - qdp1
output                  imiss_pcx_mx_sel ;	// - qdp1
output  [2:0]           fwd_int_fp_pcx_mx_sel ;	// - qdp1
output	[2:0]		lsu_ffu_bld_cnt_w ;
//output  [3:0]           ld_pcx_rq_sel ;	// - qctl2
output  [3:0]           lsu_ld_pcx_rq_mxsel ;	// - qdp1
output  [1:0]           ld_pcx_thrd ;	// - qdp1
output                  lsu_spu_ldst_ack ;  // strm ld/st ack to spu
//output                  strm_sldst_cam_vld; // strm ld/st xslate rq
//output                  strm_sld_dc_rd_vld; // strm alloc. ld xslate rq.
//output                  strm_sldst_cam_d2;  // strm ld/st xslate rq-d2
output  [3:0]           pcx_rq_for_stb ;      // pcx demands rd for store - stb_ctl
output  [3:0]           pcx_rq_for_stb_d1 ;  // pcx demands rd for store - qdp2
output                  lsu_ffu_ack ;         // ack to ffu.
output                  lsu_ifu_ld_pcxpkt_vld ;
//output  [3:0]           lsu_iobrdge_rply_data_sel ;	// - qdp1
//output                  lsu_pcx_req_squash ;
output                  lsu_pcx_req_squash0 ;
output                  lsu_pcx_req_squash1 ;
output                  lsu_pcx_req_squash2 ;
output                  lsu_pcx_req_squash3 ;
output                  lsu_pcx_req_squash_d1 ;
output                  lsu_pcx_ld_dtag_perror_w2 ;	// - qdp1
output	[3:0]		lsu_tlu_dcache_miss_w2 ;
output 			lsu_bld_pcx_rq ;	// cycle after request	// - qdp1
output [1:0] 		lsu_bld_rq_addr ;	// cycle after request	// - qdp1
//output			lsu_ifu_flush_ireg ;

output                 lsu_fwdpkt_pcx_rq_sel ;
//output                 lsu_ld0_pcx_rq_sel_d1, lsu_ld1_pcx_rq_sel_d1 ;
//output                 lsu_ld2_pcx_rq_sel_d1, lsu_ld3_pcx_rq_sel_d1 ;
output                 lsu_imiss_pcx_rq_sel_d1 ;
output                 lsu_tlu_pcxpkt_ack;
output  [3:0]           lsu_intrpt_cmplt ;      // intrpt can restart thread
//output                  lsu_ld_sec_hit_l2access_g ;
//output  [1:0]           lsu_ld_sec_hit_wy_g ;
output  [3:0]           lsu_lmq_byp_misc_sel ;    // select g-stage lmq source

output	[12:0]		lsu_sscan_data ;

output                  so;
output  [3:0]           lsu_dfq_byp_tid_d1_sel;


   input [3:0]          lsu_no_spc_pref;
   
//output  [1:0]           lsu_lmq_pkt_way_g;
output  [`L1D_WAY_MASK]           lmq0_pcx_pkt_way;
output  [`L1D_WAY_MASK]           lmq1_pcx_pkt_way;
output  [`L1D_WAY_MASK]           lmq2_pcx_pkt_way;
output  [`L1D_WAY_MASK]           lmq3_pcx_pkt_way;
output  [3:0]           lsu_st_pcx_rq_pick;

// signals related to logic moved from stb_rwctl
output                  lsu_stb_pcx_rvld_d1;
output  [1:0]           lsu_stb_rd_tid;

output                  lsu_ld0_spec_vld_kill_w2 ;
output                  lsu_ld1_spec_vld_kill_w2 ;
output                  lsu_ld2_spec_vld_kill_w2 ;
output                  lsu_ld3_spec_vld_kill_w2 ;

output                  lsu_st_pcx_rq_vld ;


   input                tlu_early_flush_pipe2_w;
   input                lsu_ttype_vld_m2;

/* adif: added this parameter to fix L2 bank packet destinations */
localparam AVAILABLE_L2_BANKS  = 4'b0001; 

   
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics

wire  thread0_e,thread1_e,thread2_e,thread3_e;
wire  thread0_w2,thread1_w2,thread2_w2,thread3_w2;
wire    ld0_inst_vld_e,ld1_inst_vld_e,ld2_inst_vld_e,ld3_inst_vld_e ;
wire    ld0_inst_vld_g,ld1_inst_vld_g,ld2_inst_vld_g,ld3_inst_vld_g ;
wire    ld0_inst_vld_w2,ld1_inst_vld_w2,ld2_inst_vld_w2,ld3_inst_vld_w2 ;
//wire    st_inst_vld_m,st_inst_vld_g;
wire  imiss_pcx_rq_sel_d1, strm_pcx_rq_sel_d1 ;
wire  imiss_pcx_rq_sel_d2 ;
wire    fpop_pcx_rq_sel_d1, fpop_pcx_rq_sel_d2 ;
wire        imiss_pcx_rq_sel ;
wire        imiss_pkt_vld ;
wire  [2:0]     imiss_l2bnk_addr ;
wire  [4:0]     imiss_l2bnk_dest ;
wire    fpst_vld_m, fpst_vld_g ;
wire    fpop_vld_reset ;
wire    fpop_pcx_rq_sel ;
wire    fpop_pcx_rq_sel_tmp ;
wire    fpop_vld_en ;
wire    fpop_pkt1 ;
wire    fpop_pkt_vld,fpop_pkt_vld_unmasked ;
wire    fpop_atom_req, fpop_atom_rq_pq ;
wire  [4:0] fpop_l2bnk_dest ;
wire        pcx_req_squash ;
wire  [4:0] strm_l2bnk_dest ;
wire    strm_pkt_vld;
wire        st0_pkt_vld ;
wire        st1_pkt_vld ;
wire        st2_pkt_vld ;
wire        st3_pkt_vld ;
wire    st0_pcx_rq_sel_d1, st1_pcx_rq_sel_d1;
wire    st2_pcx_rq_sel_d1, st3_pcx_rq_sel_d1;
wire    st0_pcx_rq_sel_d2, st1_pcx_rq_sel_d2;
wire    st2_pcx_rq_sel_d2, st3_pcx_rq_sel_d2;
wire    st0_pcx_rq_sel_d3, st1_pcx_rq_sel_d3;
wire    st2_pcx_rq_sel_d3, st3_pcx_rq_sel_d3;
wire    st0_cas_vld, st1_cas_vld, st2_cas_vld, st3_cas_vld ;
wire    st0_atomic_vld, st1_atomic_vld, st2_atomic_vld, st3_atomic_vld ;
wire  [4:0]     st0_l2bnk_dest,st1_l2bnk_dest ;
wire  [4:0]     st2_l2bnk_dest,st3_l2bnk_dest ;
wire	bld_helper_cmplt_e, bld_helper_cmplt_m, bld_helper_cmplt_g ;	
wire	bld_din,bld_dout ;
wire	bld_g ;
wire	bld_en ;
wire	[1:0]	bld_cnt ;
wire	[1:0]	bcnt_din ;
wire	[2:0]	bld_rd_din, bld_rd_dout, bld_rd_dout_m ;
wire	[3:0]	bld_annul,bld_annul_d1 ;
wire	bld_rd_en ;
wire    casa_m, casa_g ;
wire        ld0_vld_reset, ld0_pkt_vld ;
wire        ld0_pcx_rq_sel_d2, ld1_pcx_rq_sel_d2 ;
wire        ld2_pcx_rq_sel_d2, ld3_pcx_rq_sel_d2 ;
wire    ld0_fill_reset, ld1_fill_reset,ld2_fill_reset,ld3_fill_reset;
wire    ld0_fill_reset_d1,ld1_fill_reset_d1,ld2_fill_reset_d1,ld3_fill_reset_d1;
wire    ld0_fill_reset_d2,ld1_fill_reset_d2,ld2_fill_reset_d2,ld3_fill_reset_d2;
wire    ld0_fill_reset_d2_tmp,ld1_fill_reset_d2_tmp,ld2_fill_reset_d2_tmp,ld3_fill_reset_d2_tmp;
wire  [4:0]     ld0_l2bnk_dest, ld1_l2bnk_dest ;
wire  [4:0]     ld2_l2bnk_dest, ld3_l2bnk_dest ;
wire        ld1_vld_reset, ld1_pkt_vld ;
wire        ld2_vld_reset, ld2_pkt_vld ;
wire        ld3_vld_reset, ld3_pkt_vld ;
//wire    casa0_g, casa1_g, casa2_g, casa3_g;
wire    ld0_rawp_reset,ld0_rawp_en,ld0_rawp_disabled;
wire    ld1_rawp_reset,ld1_rawp_en,ld1_rawp_disabled;
wire    ld2_rawp_reset,ld2_rawp_en,ld2_rawp_disabled;
wire    ld3_rawp_reset,ld3_rawp_en,ld3_rawp_disabled;
wire  [2:0] ld0_rawp_ackid,ld1_rawp_ackid ;
wire  [2:0] ld2_rawp_ackid,ld3_rawp_ackid ;
wire        ld0_pcx_rq_vld, ld1_pcx_rq_vld ;
wire        ld2_pcx_rq_vld, ld3_pcx_rq_vld ;
wire  [4:0]     queue_write ;
wire	mcycle_squash_d1 ;
//wire        ld_pcx_rq_vld, st_pcx_rq_vld ;
wire  [4:0] st0_q_wr,st1_q_wr,st2_q_wr,st3_q_wr ;
wire  [4:0]     sel_qentry0 ;
wire    st0_atom_rq,st1_atom_rq,st2_atom_rq,st3_atom_rq ;
wire    st0_atom_rq_d1,st1_atom_rq_d1,st2_atom_rq_d1,st3_atom_rq_d1 ;
wire    st0_cas_vld_d1,st1_cas_vld_d1,st2_cas_vld_d1,st3_cas_vld_d1 ;
wire    st0_atom_rq_d2,st1_atom_rq_d2,st2_atom_rq_d2,st3_atom_rq_d2 ;
wire    st0_cas_vld_d2,st1_cas_vld_d2,st2_cas_vld_d2,st3_cas_vld_d2 ;
//wire    st_cas_rq_d2,st_quad_rq_d2;
wire    st_cas_rq_d2 ;
wire        st0_pcx_rq_vld, st1_pcx_rq_vld;
wire        st2_pcx_rq_vld, st3_pcx_rq_vld;
wire    st_atom_rq ;
wire    st_atom_rq_d1 ;
wire        imiss_pcx_rq_vld ;
wire  [4:0] spc_pcx_req_update_g,spc_pcx_req_update_w2 ;
wire    strm_pcx_rq_vld ;
wire    fwdpkt_rq_vld ;
wire    intrpt_pcx_rq_vld ;
wire    fpop_pcx_rq_vld ;
wire	[4:0]	pre_qwr ;
wire        ld0_pcx_rq_sel, ld1_pcx_rq_sel ;
wire        ld2_pcx_rq_sel, ld3_pcx_rq_sel ;
wire    strm_pcx_rq_sel ;
wire    intrpt_pcx_rq_sel ;
//wire    imiss_strm_pcx_rq_sel ;
//wire  [2:0]     dest_pkt_sel ;
wire  [4:0] spc_pcx_req_g ;
wire  [1:0]   strm_l2bnk_addr ;
wire  [2:0]     ld0_l2bnk_addr, ld1_l2bnk_addr ;
wire  [2:0]     ld2_l2bnk_addr, ld3_l2bnk_addr ;
wire  [4:0]     current_pkt_dest ;
wire  [7:6]      ldst_va_m, ldst_va_g ;
wire  [4:0]     ld_pkt_dest ;
wire  [4:0] st_pkt_dest  ;


wire  [4:0]            intrpt_l2bnk_dest ;
wire                   pcx_req_squash_d1, pcx_req_squash_d2 ;
wire                   intrpt_pcx_rq_sel_d1 ;
wire  [2:0] intrpt_l2bnk_addr ;
//wire                  st0_stq_vld,st1_stq_vld,st2_stq_vld,st3_stq_vld ;
wire        st0_pcx_rq_sel, st1_pcx_rq_sel;
wire        st2_pcx_rq_sel, st3_pcx_rq_sel;
//wire    ld0_sec_hit_g,ld1_sec_hit_g,ld2_sec_hit_g,ld3_sec_hit_g;
wire    ld0_sec_hit_w2,ld1_sec_hit_w2,ld2_sec_hit_w2,ld3_sec_hit_w2;
//wire  [3:0] dfq_byp_sel_m, dfq_byp_sel_g ;
//wire  [3:0] dfq_byp_sel_m;
wire                 ld0_unfilled,ld1_unfilled,ld2_unfilled,ld3_unfilled;
wire                 ld0_unfilled_tmp,ld1_unfilled_tmp,ld2_unfilled_tmp,ld3_unfilled_tmp;
wire  [`L1D_WAY_MASK]          ld0_unfilled_wy,ld1_unfilled_wy,ld2_unfilled_wy,ld3_unfilled_wy ;
wire        ld0_l2cache_rq,ld1_l2cache_rq ;
wire        ld2_l2cache_rq,ld3_l2cache_rq ;
wire                 ld0_pcx_rq_sel_d1, ld1_pcx_rq_sel_d1 ;
wire                 ld2_pcx_rq_sel_d1, ld3_pcx_rq_sel_d1 ;
wire         intrpt_pkt_vld;
wire                 fwdpkt_pcx_rq_sel;
wire		fwdpkt_pcx_rq_sel_d1,fwdpkt_pcx_rq_sel_d2,fwdpkt_pcx_rq_sel_d3 ;
wire         reset,dbb_reset_l;
wire         clk;
//wire         st_inst_vld_unflushed;
wire         ldst_dbl_g;
//wire                  lsu_ld_sec_hit_l2access_g ;
wire                  lsu_ld_sec_hit_l2access_w2 ;
//wire  [1:0]           lsu_ld_sec_hit_wy_g ;
wire  [`L1D_WAY_MASK]           lsu_ld_sec_hit_wy_w2 ;
//wire  [1:0]  ld_way;
//wire [1:0]	      ld_pcx_pkt_wy_g ;

wire	[3:0]		lsu_dtag_perror_w2 ;

wire	[3:0]		lmq_enable_w2 ;
wire  ld0_spec_pick_vld_g ,
      ld0_spec_pick_vld_w2 ;
wire  ld1_spec_pick_vld_g ,
      ld1_spec_pick_vld_w2 ;
wire  ld2_spec_pick_vld_g ,
      ld2_spec_pick_vld_w2 ;
wire  ld3_spec_pick_vld_g ,
      ld3_spec_pick_vld_w2 ;
wire  non_l2bnk_mx0_d1 ;
wire  non_l2bnk_mx1_d1 ;
wire  non_l2bnk_mx2_d1 ;
wire  non_l2bnk_mx3_d1 ;
wire  lsu_pcx_req_squash ;
wire  spc_pcx_atom_pq_buf2 ;
wire  [4:0]  spc_pcx_req_pq_buf2 ;
wire         lsu_ld0_pcx_rq_sel_d1, lsu_ld1_pcx_rq_sel_d1 ;
wire         lsu_ld2_pcx_rq_sel_d1, lsu_ld3_pcx_rq_sel_d1 ;

wire  [3:0]  ld_thrd_force_d1 ;
wire  [3:0]  st_thrd_force_d1 ;
wire  [3:0]  misc_thrd_force_d1 ;
wire  [3:0]  ld_thrd_force_vld ;
wire  [3:0]  st_thrd_force_vld ;
wire  [3:0]  misc_thrd_force_vld ;
wire  [3:0]  all_thrd_force_vld ;
wire  [3:0]  ld_thrd_pick_din ;
wire  [3:0]  st_thrd_pick_din ;
wire  [3:0]  misc_thrd_pick_din ;
wire  [3:0]  ld_thrd_pick_status_din ;
wire  [3:0]  st_thrd_pick_status_din ;
wire  [3:0]  misc_thrd_pick_status_din ;
wire  [3:0]  ld_thrd_pick_status ;
wire  [3:0]  st_thrd_pick_status ;
wire  [3:0]  misc_thrd_pick_status ;
wire         ld_thrd_pick_rst ;
wire         st_thrd_pick_rst ;
wire         misc_thrd_pick_rst ;
wire         all_thrd_pick_rst ;


   
   
assign  clk = rclk;

    dffrl_async rstff(.din (grst_l),
                        .q   (dbb_reset_l),
                        .clk (clk), .se(se), .si(), .so(),
                        .rst_l (arst_l));

assign  reset  =  ~dbb_reset_l;


//assign	lsu_ifu_flush_ireg = 1'b0 ;
//=================================================================================================
// TEMP !! rm from vlin.filter also !!
//=================================================================================================

wire atm_in_stb_g ;
assign atm_in_stb_g = 1'b0 ;

//=================================================================================================
// LOGIC MOVED FROM STB_RWCTL
//=================================================================================================

// pcx is making request for data in current cycle. Can be multi-hot.
//assign  pcx_any_rq_for_stb = |pcx_rq_for_stb[3:0] ;
//assign  pcx_any_rq_for_stb = 
//        (pcx_rq_for_stb[0] & ~lsu_st_pcx_rq_kill_w2[0]) | 
//        (pcx_rq_for_stb[1] & ~lsu_st_pcx_rq_kill_w2[1]) | 
//        (pcx_rq_for_stb[2] & ~lsu_st_pcx_rq_kill_w2[2]) | 
//        (pcx_rq_for_stb[3] & ~lsu_st_pcx_rq_kill_w2[3]) ; 
//
//dff #(1)  prvld_stgd1 (
//  .din  (pcx_any_rq_for_stb), 
//  .q  (lsu_stb_pcx_rvld_d1),
//  .clk  (clk), 
//  .se (1'b0), .si (), .so ()
//  );

// replacement for above logic - pcx_rq_for_stb is already qual'ed w/ lsu_st_pcx_rq_kill_w2
// this signal is used in qdp1 and qdp2 as pcx paket valids.
assign  lsu_stb_pcx_rvld_d1  =  st3_pcx_rq_sel_d1 |
                                st2_pcx_rq_sel_d1 |
                                st1_pcx_rq_sel_d1 | 
                                st0_pcx_rq_sel_d1 ;


//assign  stb_rd_tid[0] = pcx_rq_for_stb[1] | pcx_rq_for_stb[3] ;
//assign  stb_rd_tid[1] = pcx_rq_for_stb[2] | pcx_rq_for_stb[3] ;
//
//dff #(2) stbtid_stgd1 (
//  .din    (stb_rd_tid[1:0]),  .q  (lsu_stb_rd_tid[1:0]),
//  .clk    (clk),
//  .se   (1'b0), .si (), .so ()
//  );

assign  lsu_stb_rd_tid[0]  =  st1_pcx_rq_sel_d1 | st3_pcx_rq_sel_d1;
assign  lsu_stb_rd_tid[1]  =  st2_pcx_rq_sel_d1 | st3_pcx_rq_sel_d1;

//=================================================================================================

assign	lsu_ramtest_rd_w = lsu_dcache_iob_rd_w | ifu_lsu_fwd_data_vld ;

//=================================================================================================
// LD PCX PKT WAY
//=================================================================================================


// For direct-map mode, assume that addition set-index bits 12:11 are
// used to file line in set.
// timing fix: 5/19/03: move secondary hit way generation to w2
//assign  ld_way[1:0] = 
//    lsu_way_hit_or ? lsu_encd_way_hit[1:0]: 
//                lsu_ld_sec_hit_l2access_g ? lsu_ld_sec_hit_wy_g[1:0] :
//                        (dc_direct_map ? lsu_ldst_va_way_g[1:0] : lsu_dcache_rand[1:0]) ;
//
//assign  lsu_lmq_pkt_way_g[1:0] = 
//(ldst_dbl_g & st_inst_vld_unflushed & lsu_quad_asi_g) ? 2'b01 :
//        casa_g ? 2'b00 : ld_way[1:0] ;
//
//assign  ld_pcx_pkt_wy_g[1:0] = lsu_lmq_pkt_way_g[1:0];
wire  [`L1D_WAY_MASK]  ld_way_mx1_g , ld_way_mx2_g , ld_way_mx2_w2;

assign  ld_way_mx1_g[`L1D_WAY_MASK] = 
    lsu_way_hit_or ? lsu_encd_way_hit[`L1D_WAY_MASK]: 
                        (dc_direct_map ? lsu_ldst_va_way_g[`L1D_WAY_MASK] : lsu_dcache_rand[`L1D_WAY_MASK]) ;

assign  ld_way_mx2_g[`L1D_WAY_MASK] = 
//(ldst_dbl_g & st_inst_vld_unflushed & lsu_quad_asi_g) ? 2'b01 :  //quad st, obsolete
        casa_g ? {`L1D_WAY_WIDTH{1'b0}} : ld_way_mx1_g[`L1D_WAY_MASK] ;

dff_s #(`L1D_WAY_WIDTH)  ff_ld_way_mx2_w2 (
        .din    (ld_way_mx2_g[`L1D_WAY_MASK]),
        .q      (ld_way_mx2_w2[`L1D_WAY_MASK]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire  [`L1D_WAY_MASK]  lsu_lmq_pkt_way_w2;
assign  lsu_lmq_pkt_way_w2[`L1D_WAY_MASK] =  lsu_ld_sec_hit_l2access_w2 ? lsu_ld_sec_hit_wy_w2[`L1D_WAY_MASK] :
                                         ld_way_mx2_w2[`L1D_WAY_MASK];

//bug2705 - add mx for way in w2-cycle
wire  [`L1D_WAY_MASK]  lmq0_pcx_pkt_way_tmp, lmq1_pcx_pkt_way_tmp, lmq2_pcx_pkt_way_tmp, lmq3_pcx_pkt_way_tmp ;

assign  lmq0_pcx_pkt_way[`L1D_WAY_MASK] =  ld0_spec_pick_vld_w2 ? lsu_lmq_pkt_way_w2[`L1D_WAY_MASK] : lmq0_pcx_pkt_way_tmp[`L1D_WAY_MASK] ;
assign  lmq1_pcx_pkt_way[`L1D_WAY_MASK] =  ld1_spec_pick_vld_w2 ? lsu_lmq_pkt_way_w2[`L1D_WAY_MASK] : lmq1_pcx_pkt_way_tmp[`L1D_WAY_MASK] ;
assign  lmq2_pcx_pkt_way[`L1D_WAY_MASK] =  ld2_spec_pick_vld_w2 ? lsu_lmq_pkt_way_w2[`L1D_WAY_MASK] : lmq2_pcx_pkt_way_tmp[`L1D_WAY_MASK] ;
assign  lmq3_pcx_pkt_way[`L1D_WAY_MASK] =  ld3_spec_pick_vld_w2 ? lsu_lmq_pkt_way_w2[`L1D_WAY_MASK] : lmq3_pcx_pkt_way_tmp[`L1D_WAY_MASK] ;

wire	qword_access0,qword_access1,qword_access2,qword_access3;

// Extend by 1-b to add support for 3rd size bit for iospace.
// move the flops from qdp1 to qctl1
dffe_s #(`L1D_WAY_WIDTH)  ff_lmq0_pcx_pkt_way (
           .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
           .q      (lmq0_pcx_pkt_way_tmp[`L1D_WAY_MASK]),
           .en     (lmq_enable_w2[0]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s #(`L1D_WAY_WIDTH)  ff_lmq1_pcx_pkt_way (
           .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
           .q      (lmq1_pcx_pkt_way_tmp[`L1D_WAY_MASK]),
           .en     (lmq_enable_w2[1]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s #(`L1D_WAY_WIDTH)  ff_lmq2_pcx_pkt_way (
           .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
           .q      (lmq2_pcx_pkt_way_tmp[`L1D_WAY_MASK]),
           .en     (lmq_enable_w2[2]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s #(`L1D_WAY_WIDTH)  ff_lmq3_pcx_pkt_way (
           .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
           .q      (lmq3_pcx_pkt_way_tmp[`L1D_WAY_MASK]),
           .en     (lmq_enable_w2[3]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );

// Q Word Access to IO
dffe_s   ff_lmq0_qw (
           .din    (lsu_quad_word_access_g),
           .q      (qword_access0),
           .en     (lmq_enable[0]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s   ff_lmq1_qw (
           .din    (lsu_quad_word_access_g),
           .q      (qword_access1),
           .en     (lmq_enable[1]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s   ff_lmq2_qw(
           .din    (lsu_quad_word_access_g),
           .q      (qword_access2),
           .en     (lmq_enable[2]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
dffe_s   ff_lmq3_qw (
           .din    (lsu_quad_word_access_g),
           .q      (qword_access3),
           .en     (lmq_enable[3]),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );

assign	lsu_pcx_rq_sz_b3 =
	(ld0_pcx_rq_sel_d1 & qword_access0) |
	(ld1_pcx_rq_sel_d1 & qword_access1) |
	(ld2_pcx_rq_sel_d1 & qword_access2) |
	(ld3_pcx_rq_sel_d1 & qword_access3) ;

//=================================================================================================
// SHADOW SCAN
//=================================================================================================


// Monitors outstanding loads. This would hang a thread.
assign	lsu_sscan_data[3:0] = 
		{ld0_pcx_rq_vld, ld1_pcx_rq_vld , ld2_pcx_rq_vld , ld3_pcx_rq_vld} ;
// Monitors outstanding loads. This would hang issue from stb
assign	lsu_sscan_data[7:4] = 
		{st0_pcx_rq_vld, st1_pcx_rq_vld, st2_pcx_rq_vld, st3_pcx_rq_vld} ;
assign	lsu_sscan_data[8] = imiss_pcx_rq_vld ; 	// imiss
assign	lsu_sscan_data[9] = strm_pcx_rq_vld ;  	// strm
assign	lsu_sscan_data[10] = fwdpkt_rq_vld ;	// fwd rply/rq 
assign	lsu_sscan_data[11] = intrpt_pcx_rq_vld ; // intrpt
assign	lsu_sscan_data[12] = fpop_pcx_rq_vld ;	// fpop


//=================================================================================================
// QDP1 selects
//=================================================================================================

wire [3:0] dfq_byp_tid_sel;
   
assign dfq_byp_tid_sel[0]  =  (lsu_dfq_byp_tid[1:0]==2'b00);
assign dfq_byp_tid_sel[1]  =  (lsu_dfq_byp_tid[1:0]==2'b01);
assign dfq_byp_tid_sel[2]  =  (lsu_dfq_byp_tid[1:0]==2'b10);
assign dfq_byp_tid_sel[3]  =  (lsu_dfq_byp_tid[1:0]==2'b11);
//assign dfq_byp_tid__sel[3]  =  ~|(lsu_dfq_byp_d1_sel[2:0]);

wire  [3:0]  lsu_dfq_byp_tid_d1_sel_tmp ;
   
dffe_s #(4)  dfq_byp_tid_sel_ff (
           .din    (dfq_byp_tid_sel[3:0]),
           .q      (lsu_dfq_byp_tid_d1_sel_tmp[3:0]),
           .en     (dfq_byp_ff_en),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );

//11/21/03 - add rst_tri_en to lsu_dfq_byp_tid_d1_sel[3:0] going to qdp1 as dfq_byp_sel[3:0]

assign  lsu_dfq_byp_tid_d1_sel[2:0]  =  lsu_dfq_byp_tid_d1_sel_tmp[2:0]  & {3{~rst_tri_en}};
assign  lsu_dfq_byp_tid_d1_sel[3]    =  lsu_dfq_byp_tid_d1_sel_tmp[3]    | rst_tri_en;


//=================================================================================================
// INST_VLD_W GENERATION
//=================================================================================================


wire [1:0] thrid_m, thrid_g ;
dff_s #(2)  stgm_thrid (
        .din    (ifu_tlu_thrid_e[1:0]),
        .q      (thrid_m[1:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s  #(2) stgg_thrid (
        .din    (thrid_m[1:0]),
        .q      (thrid_g[1:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	flush_w_inst_vld_m ;
wire	lsu_inst_vld_w,lsu_inst_vld_tmp ;
wire	other_flush_pipe_w ;
wire  qctl1_flush_pipe_w;
   
assign	flush_w_inst_vld_m = 
	ifu_tlu_inst_vld_m & 
	~(qctl1_flush_pipe_w & (thrid_m[1:0] == thrid_g[1:0])) ; // really lsu_flush_pipe_w
   
dff_s  stgw_ivld (
        .din    (flush_w_inst_vld_m),
        .q      (lsu_inst_vld_tmp),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


assign	other_flush_pipe_w = tlu_early_flush_pipe2_w | (lsu_ttype_vld_m2 & lsu_inst_vld_tmp);     
assign	qctl1_flush_pipe_w = other_flush_pipe_w | ifu_lsu_flush_w ;

assign	lsu_inst_vld_w = lsu_inst_vld_tmp & ~qctl1_flush_pipe_w ;


//=================================================================================================
// SECONDARY VS. PRIMARY LOADS
//=================================================================================================

// An incoming load can hit can match addresses with an outstanding load request
// from another thread. In this case, the secondary load must wait until the primary
// load returns and then it will bypass (but not fill). There can only be one primary
// load but multiple secondary loads. The secondary loads will not enter the dfq.
// The primary load will however be recirculated until all secondary loads have bypassed.

// Could have multiple secondary hits. Only one thread can be chosen
// as primary though.

//An incoming load can match addresses with any outstanding load request from other threads.
//can be multiple hits
// timing fix: 5/19/03: move secondary hit way generation to w2
//
//assign  ld0_sec_hit_g = ld_sec_hit_thrd0 & ld0_unfilled  ;
//assign  ld1_sec_hit_g = ld_sec_hit_thrd1 & ld1_unfilled  ;
//assign  ld2_sec_hit_g = ld_sec_hit_thrd2 & ld2_unfilled  ;
//assign  ld3_sec_hit_g = ld_sec_hit_thrd3 & ld3_unfilled  ;
//
//
// Fix for Bug1606
//assign  lsu_ld_sec_hit_l2access_g =
//         ld0_sec_hit_g | ld1_sec_hit_g | ld2_sec_hit_g | ld3_sec_hit_g ;
//
//phase 2
//since can be multiple hits, it isn't one-hot mux, but fix priority-sel mux
//assign  lsu_ld_sec_hit_wy_g[1:0] =
//    ld0_sec_hit_g ? ld0_unfilled_wy[1:0] :
//      ld1_sec_hit_g ? ld1_unfilled_wy[1:0] :
//        ld2_sec_hit_g ? ld2_unfilled_wy[1:0] :
//          ld3_sec_hit_g ? ld3_unfilled_wy[1:0] : 2'bxx ;

wire  ld_sec_hit_thrd0_w2,ld_sec_hit_thrd1_w2,ld_sec_hit_thrd2_w2,ld_sec_hit_thrd3_w2;

dff_s #(4) ff_ld_sec_hit_thrd0to3_d1 (
        .din    ({ld_sec_hit_thrd0,ld_sec_hit_thrd1,ld_sec_hit_thrd2,ld_sec_hit_thrd3}),
        .q      ({ld_sec_hit_thrd0_w2,ld_sec_hit_thrd1_w2,ld_sec_hit_thrd2_w2,ld_sec_hit_thrd3_w2}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign  ld0_sec_hit_w2 = ld_sec_hit_thrd0_w2 & ld0_unfilled  ;
assign  ld1_sec_hit_w2 = ld_sec_hit_thrd1_w2 & ld1_unfilled  ;
assign  ld2_sec_hit_w2 = ld_sec_hit_thrd2_w2 & ld2_unfilled  ;
assign  ld3_sec_hit_w2 = ld_sec_hit_thrd3_w2 & ld3_unfilled  ;

// Fix for Bug1606
assign  lsu_ld_sec_hit_l2access_w2 =
         ld0_sec_hit_w2 | ld1_sec_hit_w2 | ld2_sec_hit_w2 | ld3_sec_hit_w2 ;

//phase 2
//since can be multiple hits, it isn't one-hot mux, but fix priority-sel mux
assign  lsu_ld_sec_hit_wy_w2[`L1D_WAY_MASK] =
    ld0_sec_hit_w2 ? ld0_unfilled_wy[`L1D_WAY_MASK] :
      ld1_sec_hit_w2 ? ld1_unfilled_wy[`L1D_WAY_MASK] :
        ld2_sec_hit_w2 ? ld2_unfilled_wy[`L1D_WAY_MASK] :
          ld3_sec_hit_w2 ? ld3_unfilled_wy[`L1D_WAY_MASK] : {`L1D_WAY_WIDTH{1'bx}} ;

//dff #(4)  stgm_dbypsel (
//        .din    (dfq_byp_sel[3:0]),
//        .q      (dfq_byp_sel_m[3:0]),
//        .clk    (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );

//dff #(4)  stgg_dbypsel (
//        .din    (dfq_byp_sel_m[3:0]),
//        .q      (dfq_byp_sel_g[3:0]),
//        .clk    (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );

// select g-stage lmq source.
// Selects for lmq contents shared by fill/hit and alternate sources such as ldxa/raw.
// Is qualification of dfq_byp_sel_g by ld_thrd_byp_sel necessary ???

wire	[3:0] lmq_byp_misc_sel_e ;

assign  lmq_byp_misc_sel_e[0] = ld_thrd_byp_sel_e[0]  |        // select for ldxa/raw.
                                dfq_byp_sel[0]  ;              // select for dfq.
assign  lmq_byp_misc_sel_e[1] = ld_thrd_byp_sel_e[1]  |        // select for ldxa/raw.
                                dfq_byp_sel[1] ;               // select for dfq.
assign  lmq_byp_misc_sel_e[2] = ld_thrd_byp_sel_e[2]  |        // select for ldxa/raw.
                                dfq_byp_sel[2] ;               // select for dfq.
assign  lmq_byp_misc_sel_e[3] = ~|lmq_byp_misc_sel_e[2:0];
                                //ld_thrd_byp_sel_e[3]  |        // select for ldxa/raw.
                                //dfq_byp_sel[3] ;               // select for dfq.

/*
assign  lmq_byp_misc_sel_e[0] = ld_thrd_byp_sel_e[0]  |        // select for ldxa/raw.
          (dfq_byp_sel[0] & ~ld_thrd_byp_sel_e[0]) ;  // select for dfq.
assign  lmq_byp_misc_sel_e[1] = ld_thrd_byp_sel_e[1]  |        // select for ldxa/raw.
          (dfq_byp_sel[1] & ~ld_thrd_byp_sel_e[1]) ; // select for dfq.
assign  lmq_byp_misc_sel_e[2] = ld_thrd_byp_sel_e[2]  |        // select for ldxa/raw.
          (dfq_byp_sel[2] & ~ld_thrd_byp_sel_e[2]) ; // select for dfq.
assign  lmq_byp_misc_sel_e[3] = ld_thrd_byp_sel_e[3]  |        // select for ldxa/raw.
          (dfq_byp_sel[3] & ~ld_thrd_byp_sel_e[3]) ; // select for dfq.
*/

// M-Stage 
//10/27/03 - add rst_tri_en for the select - lsu_lmq_byp_misc_sel to qdp1
wire  [3:0]  lsu_lmq_byp_misc_sel_tmp ;
dff_s #(4)  stgg_lbsel (
        .din    (lmq_byp_misc_sel_e[3:0]),
        .q      (lsu_lmq_byp_misc_sel_tmp[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign lsu_lmq_byp_misc_sel[2:0]=  lsu_lmq_byp_misc_sel_tmp[2:0] & {3{~rst_tri_en}} ;
assign lsu_lmq_byp_misc_sel[3]  =  lsu_lmq_byp_misc_sel_tmp[3] | rst_tri_en ;


/*
assign  lsu_lmq_byp_misc_sel[0] = ld_thrd_byp_sel[0]  |        // select for ldxa/raw.
          (dfq_byp_sel_g[0] & ~ld_thrd_byp_sel[0]) ;  // select for dfq.
assign  lsu_lmq_byp_misc_sel[1] = ld_thrd_byp_sel[1]  |        // select for ldxa/raw.
          (dfq_byp_sel_g[1] & ~ld_thrd_byp_sel[1]) ; // select for dfq.
assign  lsu_lmq_byp_misc_sel[2] = ld_thrd_byp_sel[2]  |        // select for ldxa/raw.
          (dfq_byp_sel_g[2] & ~ld_thrd_byp_sel[2]) ; // select for dfq.
assign  lsu_lmq_byp_misc_sel[3] = ld_thrd_byp_sel[3]  |        // select for ldxa/raw.
          (dfq_byp_sel_g[3] & ~ld_thrd_byp_sel[3]) ; // select for dfq.
*/



//=================================================================================================
//  Miscellaneous Staging
//=================================================================================================

   
assign  thread0_e = ~ifu_tlu_thrid_e[1] & ~ifu_tlu_thrid_e[0] ;
assign  thread1_e = ~ifu_tlu_thrid_e[1] &  ifu_tlu_thrid_e[0] ;
assign  thread2_e =  ifu_tlu_thrid_e[1] & ~ifu_tlu_thrid_e[0] ;
assign  thread3_e =  ifu_tlu_thrid_e[1] &  ifu_tlu_thrid_e[0] ;

assign  ld0_inst_vld_e = ld_inst_vld_e & thread0_e ;
assign  ld1_inst_vld_e = ld_inst_vld_e & thread1_e ;
assign  ld2_inst_vld_e = ld_inst_vld_e & thread2_e ;
assign  ld3_inst_vld_e = ld_inst_vld_e & thread3_e ;
     
assign ldst_va_m[7:6] = lsu_ldst_va_m[7:6];
   
wire ld0_inst_vld_m;
wire ld1_inst_vld_m;
wire ld2_inst_vld_m;
wire ld3_inst_vld_m;
wire ldst_fp_m;
wire ldst_dbl_m;
dff_s  #(6) stgm_ad_m (
        .din    ({ld0_inst_vld_e,ld1_inst_vld_e,
    ld2_inst_vld_e,ld3_inst_vld_e,ifu_lsu_ldst_fp_e,
    ifu_lsu_ldst_dbl_e}),
        .q      ({ld0_inst_vld_m,ld1_inst_vld_m,
    ld2_inst_vld_m,ld3_inst_vld_m,ldst_fp_m,
    ldst_dbl_m}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

wire ld0_inst_vld_unflushed;
wire ld1_inst_vld_unflushed;
wire ld2_inst_vld_unflushed;
wire ld3_inst_vld_unflushed;
wire ldst_fp_g;
dff_s  #(8) stgm_ad_g (
        .din    ({ldst_va_m[7:6],ld0_inst_vld_m,ld1_inst_vld_m,
        //.din    ({ldst_va_m[8:6],ld0_inst_vld_m,ld1_inst_vld_m,
    ld2_inst_vld_m,ld3_inst_vld_m,ldst_fp_m,
    //ld2_inst_vld_m,ld3_inst_vld_m,st_inst_vld_m,ldst_fp_m,
    ldst_dbl_m}),
        .q      ({ldst_va_g[7:6],ld0_inst_vld_unflushed,ld1_inst_vld_unflushed,
        //.q      ({ldst_va_g[8:6],ld0_inst_vld_unflushed,ld1_inst_vld_unflushed,
    ld2_inst_vld_unflushed,ld3_inst_vld_unflushed,
    //ld2_inst_vld_unflushed,ld3_inst_vld_unflushed,st_inst_vld_unflushed,
    ldst_fp_g,ldst_dbl_g}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
  );

assign  ld0_inst_vld_g = ld0_inst_vld_unflushed & lsu_inst_vld_w ;
assign  ld1_inst_vld_g = ld1_inst_vld_unflushed & lsu_inst_vld_w ;
assign  ld2_inst_vld_g = ld2_inst_vld_unflushed & lsu_inst_vld_w ;
assign  ld3_inst_vld_g = ld3_inst_vld_unflushed & lsu_inst_vld_w ;
//assign  st_inst_vld_g  = st_inst_vld_unflushed & lsu_inst_vld_w  ;

dff_s  #(4) ivld_stgw2 (
        .din    ({ld0_inst_vld_g,ld1_inst_vld_g,ld2_inst_vld_g,ld3_inst_vld_g}),
        .q    	({ld0_inst_vld_w2,ld1_inst_vld_w2,ld2_inst_vld_w2,ld3_inst_vld_w2}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
  );

wire thread0_m;
wire thread1_m;
wire thread2_m;
wire thread3_m;
dff_s  #(4) th_stgm (
        .din    ({thread0_e,thread1_e,thread2_e,thread3_e}),
        .q      ({thread0_m,thread1_m,thread2_m,thread3_m}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
  );

wire thread0_g;
wire thread1_g;
wire thread2_g;
wire thread3_g;
dff_s  #(4) th_stgg (
        .din    ({thread0_m,thread1_m,thread2_m,thread3_m}),
        .q      ({thread0_g,thread1_g,thread2_g,thread3_g}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
  );

dff_s  #(4) th_stgw2 (
        .din    ({thread0_g,thread1_g,thread2_g,thread3_g}),
        .q      ({thread0_w2,thread1_w2,thread2_w2,thread3_w2}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
  );



//=================================================================================================
//
// IMISS PCX PKT REQ CTL
//
//=================================================================================================


// ** ifu request packet should be sent out in e-stage **
// ** Prefer not to make dfq dual-ported **

// Format of IFU pcx packet (50b) :
//  b49 - valid
//  b48:44 - req type
//  b43:42 - rep way (for "eviction" - maintains directory consistency )
//  b41:40 - mil id
//  b39:0  - imiss address
// *
// destid :
//  b2  - b39 of pa
//  b1  - b8  of pa
//  b0  - b7  of pa 
// pcxpkt :
//  b51 - valid
//  b50 - reserved
//  b49 - NC
//  b48:44 - req type
//  b43:42 - rep way (for "eviction" - maintains directory consistency )
//  b41:40 - mil id
//  b39:0  - imiss address

// IMISS REQUEST CONTROL
// Vld is reset if imiss pkt requests and request is not subsequently
// squashed and new imiss pkt unavailable.

// Request rate is 1/3 cycles.

/*dff  iack_stg (
        .din    (imiss_pcx_rq_sel),
        .q      (lsu_ifu_pcxpkt_ack_d),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); */

assign	lsu_ifu_pcxpkt_ack_d = imiss_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;

assign  imiss_pkt_vld =  ifu_lsu_pcxreq_d & ~(imiss_pcx_rq_sel_d1 | imiss_pcx_rq_sel_d2) ;

//timing fix: 5/21/03 - ifu sends destid 1 cycle early
//assign  imiss_l2bnk_addr[2:0] = ifu_lsu_destid_d[2:0] ;

wire  ifu_destid_en ;
assign  ifu_destid_en  =  ~ifu_lsu_pcxreq_d | (lsu_ifu_pcxpkt_ack_d & ~ifu_lsu_pcxpkt_e_b50);

wire  [2:0]  ifu_destid_d;
dffe_s #(3)  ff_ifu_destid_d (
           .din    (ifu_lsu_destid_s[2:0]),
           .q      (ifu_destid_d[2:0]),
           .en     (ifu_destid_en),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
           );
assign  imiss_l2bnk_addr[2:0] = ifu_destid_d[2:0] ;

assign imiss_l2bnk_dest[0] = 
~imiss_l2bnk_addr[2] & ~imiss_l2bnk_addr[1] & ~imiss_l2bnk_addr[0] ;
assign imiss_l2bnk_dest[1] = 
~imiss_l2bnk_addr[2] & ~imiss_l2bnk_addr[1] &  imiss_l2bnk_addr[0] ;
assign imiss_l2bnk_dest[2] = 
~imiss_l2bnk_addr[2] & imiss_l2bnk_addr[1] & ~imiss_l2bnk_addr[0] ;
assign imiss_l2bnk_dest[3] = 
~imiss_l2bnk_addr[2] & imiss_l2bnk_addr[1] &  imiss_l2bnk_addr[0] ;
assign imiss_l2bnk_dest[4] = imiss_l2bnk_addr[2] ;


//=================================================================================================
//  FPOP PCX RQ CTL
//=================================================================================================


assign  fpst_vld_m = ffu_lsu_data[80] & ffu_lsu_data[79] ;

dff_s  fpst_stg (
        .din    (fpst_vld_m),
        .q      (fpst_vld_g),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// ffu req is  never speculative as it must always begin with the queue empty 
assign  lsu_ffu_ack =   
	fpop_pcx_rq_sel_d1 |   // fpop needs to wait until selected;d1 for timing
	//fpop_pcx_rq_sel |   // fpop needs to wait until selected
      	fpst_vld_g ;    // fpst responds immediately.

// req_squash needs to match up with rq_sel_d1 !!!
// keep vld around for two cycles.
assign fpop_vld_reset = 
  (reset | fpop_pcx_rq_sel) ; 
  //(reset | fpop_pcx_rq_sel_d1) ; 

assign fpop_vld_en = ffu_lsu_fpop_rq_vld ;

// fpop valid
dffre_s #(1)  fpop_vld (
        .din  (ffu_lsu_fpop_rq_vld),
        .q    (fpop_pkt_vld_unmasked),
  	.rst  (fpop_vld_reset), .en (fpop_vld_en),
        .clk  (clk),
        .se   (1'b0),       .si (),          .so ()
        );

// ** fpop_pkt1 should not be required.
assign	fpop_pkt1 = fpop_pkt_vld_unmasked & ~fpop_pcx_rq_sel_d1 ;

assign  fpop_pkt_vld = fpop_pkt_vld_unmasked ; // & ~ffu_lsu_kill_fpop_rq ;

assign  fpop_atom_req = fpop_pkt1 & fpop_pcx_rq_sel ;

dff_s  fpatm_stg (
        .din    (fpop_atom_req),
        .q      (fpop_atom_rq_pq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign fpop_l2bnk_dest[4:0]   = 5'b10000 ;



//=================================================================================================
//  SPU PCX PKT REQ CONTROL
//=================================================================================================
  
// If ack is sent in a given cycle, then the earliest the spu can send
// a response is in the same cycle. 

wire	strm_pcx_rq_sel_d2 ;
assign  lsu_spu_ldst_ack = 
  strm_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;  // spu request sent to pcx.
  //strm_pcx_rq_sel_d1 & ~pcx_req_squash ;  // spu request sent to pcx.

dff_s #(1) rqsel_d2 (
  .din (strm_pcx_rq_sel_d1),
  .q   (strm_pcx_rq_sel_d2),
  .clk (clk),
  .se     (1'b0),       .si (),          .so ()
);              

wire spu_ack_d1 ;
dff_s #(1) spuack_d1 (
  .din (lsu_spu_ldst_ack),
  .q   (spu_ack_d1),
  .clk (clk),
  .se     (1'b0),       .si (),          .so ()
);              

dff_s #(2) ff_spu_lsu_ldst_pckt_d1 (
  .din (spu_lsu_ldst_pckt[`PCX_AD_LO+7:`PCX_AD_LO+6]),
  .q   (strm_l2bnk_addr[1:0]),
  .clk (clk),
  .se     (1'b0),       .si (),          .so ()
);              
                              
// Streaming does not access io space.
assign strm_l2bnk_dest[0] = 
~strm_l2bnk_addr[1] & ~strm_l2bnk_addr[0] ;
assign strm_l2bnk_dest[1] = 
~strm_l2bnk_addr[1] &  strm_l2bnk_addr[0] ;
assign strm_l2bnk_dest[2] = 
strm_l2bnk_addr[1] & ~strm_l2bnk_addr[0] ;
assign strm_l2bnk_dest[3] = 
strm_l2bnk_addr[1] &  strm_l2bnk_addr[0] ;
assign strm_l2bnk_dest[4] = 1'b0 ;

wire  strm_pkt_vld_unmasked ;

dff_s #(1) spu_pkt_vld_d1 (
        .din    (spu_lsu_ldst_pckt_vld),
        .q      (strm_pkt_vld_unmasked),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );              
                                  
assign  strm_pkt_vld = 
	strm_pkt_vld_unmasked & ~(strm_pcx_rq_sel_d1 | lsu_spu_ldst_ack | spu_ack_d1);

// temp = remove strming interface
//assign strm_sldst_cam_vld = 1'b0 ;
//assign strm_sld_dc_rd_vld = 1'b0 ;
//assign strm_sldst_cam_d2 = 1'b0 ;
// temp = remove strming interface


//=================================================================================================
//  STORE PCX PKT REQ CONTROL
//=================================================================================================

// Stage by a cycle.

// Thread0
wire	[2:1]	stb0_rqtype ;
wire	[2:0]	stb0_rqaddr ; 
dff_s #(5) stgd1_s0rq (
        .din    ({stb0_atm_rq_type[2:1], stb0_l2b_addr[2:0]}),
        .q      ({stb0_rqtype[2:1],stb0_rqaddr[2:0]}),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Thread1
wire	[2:1]	stb1_rqtype ;
wire	[2:0]	stb1_rqaddr ; 
dff_s #(5) stgd1_s1rq (
        .din    ({stb1_atm_rq_type[2:1], stb1_l2b_addr[2:0]}),
        .q      ({stb1_rqtype[2:1],stb1_rqaddr[2:0]}),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Thread2
wire	[2:1]	stb2_rqtype ;
wire	[2:0]	stb2_rqaddr ; 
dff_s #(5) stgd1_s2rq (
        .din    ({stb2_atm_rq_type[2:1], stb2_l2b_addr[2:0]}),
        .q      ({stb2_rqtype[2:1],stb2_rqaddr[2:0]}),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Thread3
wire	[2:1]	stb3_rqtype ;
wire	[2:0]	stb3_rqaddr ; 
dff_s #(5) stgd1_s3rq (
        .din    ({stb3_atm_rq_type[2:1], stb3_l2b_addr[2:0]}),
        .q      ({stb3_rqtype[2:1],stb3_rqaddr[2:0]}),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	stb0_rd_for_pcx,stb1_rd_for_pcx,stb2_rd_for_pcx,stb3_rd_for_pcx ;
wire	stb0_rd_for_pcx_tmp,stb1_rd_for_pcx_tmp,stb2_rd_for_pcx_tmp,stb3_rd_for_pcx_tmp ;
dff_s #(4) stgd1_rdpcx (
        .din    (stb_rd_for_pcx[3:0]),
        .q      ({stb3_rd_for_pcx_tmp,stb2_rd_for_pcx_tmp,stb1_rd_for_pcx_tmp,stb0_rd_for_pcx_tmp}),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

// timing fix: 5/6 - move kill qual after store pick
//assign	stb0_rd_for_pcx = stb0_rd_for_pcx_tmp & ~lsu_st_pcx_rq_kill_w2[0] ;
//assign	stb1_rd_for_pcx = stb1_rd_for_pcx_tmp & ~lsu_st_pcx_rq_kill_w2[1] ;
//assign	stb2_rd_for_pcx = stb2_rd_for_pcx_tmp & ~lsu_st_pcx_rq_kill_w2[2] ;
//assign	stb3_rd_for_pcx = stb3_rd_for_pcx_tmp & ~lsu_st_pcx_rq_kill_w2[3] ;

assign	stb0_rd_for_pcx = stb0_rd_for_pcx_tmp;
assign	stb1_rd_for_pcx = stb1_rd_for_pcx_tmp;
assign	stb2_rd_for_pcx = stb2_rd_for_pcx_tmp;
assign	stb3_rd_for_pcx = stb3_rd_for_pcx_tmp;

// STORE REQUEST CONTROL
// ** Data must come from bypass mux output.
// THREAD0

// Reads for stores will have to be made non-speculative ????
// or delay when ced bit is set such that there is no need
// to replay store.
// The size of atm_rq_type can be reduced in stb_ctl etc !!!
assign  st0_pkt_vld = stb0_rd_for_pcx & ~st0_pcx_rq_sel_d1 ;
assign  st0_cas_vld = ~stb0_rqtype[2] & stb0_rqtype[1] ;
// stquad not supported.
//assign  st0_stq_vld = 1'b0 ;
assign  st0_atomic_vld = st0_cas_vld ;
  //st0_stq_vld |               // stq(1)
  //(~stb0_rqtype[2] & stb0_rqtype[1] & ~stb0_rqtype[0]) ; // cas(1)

assign  st1_pkt_vld = stb1_rd_for_pcx & ~st1_pcx_rq_sel_d1 ;
assign  st1_cas_vld = ~stb1_rqtype[2] & stb1_rqtype[1] ;
//assign  st1_stq_vld = 1'b0 ;
assign  st1_atomic_vld = st1_cas_vld ;

assign  st2_pkt_vld = stb2_rd_for_pcx & ~st2_pcx_rq_sel_d1 ;
assign  st2_cas_vld = ~stb2_rqtype[2] & stb2_rqtype[1] ;
//assign  st2_stq_vld = 1'b0 ;
assign  st2_atomic_vld = st2_cas_vld ;

assign  st3_pkt_vld = stb3_rd_for_pcx & ~st3_pcx_rq_sel_d1 ;
assign  st3_cas_vld = ~stb3_rqtype[2] & stb3_rqtype[1] ;
//assign  st3_stq_vld = 1'b0 ;
assign  st3_atomic_vld = st3_cas_vld ;

// Can this be based on st0_pcx_rq_vld instead to ease critical path.

//assign  pcx_rq_for_stb[0] = st_pcx_rq_mhot_sel[0] ;
//assign  pcx_rq_for_stb[1] = st_pcx_rq_mhot_sel[1] ;
//assign  pcx_rq_for_stb[2] = st_pcx_rq_mhot_sel[2] ;
//assign  pcx_rq_for_stb[3] = st_pcx_rq_mhot_sel[3] ;

   
assign st0_l2bnk_dest[0] = 
~stb0_rqaddr[2] & ~stb0_rqaddr[1] & ~stb0_rqaddr[0] ;
assign st0_l2bnk_dest[1] = 
~stb0_rqaddr[2] & ~stb0_rqaddr[1] &  stb0_rqaddr[0] ;
assign st0_l2bnk_dest[2] = 
~stb0_rqaddr[2] &  stb0_rqaddr[1] & ~stb0_rqaddr[0] ;
assign st0_l2bnk_dest[3] = 
~stb0_rqaddr[2] &  stb0_rqaddr[1] &  stb0_rqaddr[0] ;
assign st0_l2bnk_dest[4] =  stb0_rqaddr[2] ;

assign st1_l2bnk_dest[0] = 
~stb1_rqaddr[2] & ~stb1_rqaddr[1] & ~stb1_rqaddr[0] ;
assign st1_l2bnk_dest[1] = 
~stb1_rqaddr[2] & ~stb1_rqaddr[1] &  stb1_rqaddr[0] ;
assign st1_l2bnk_dest[2] = 
~stb1_rqaddr[2] &  stb1_rqaddr[1] & ~stb1_rqaddr[0] ;
assign st1_l2bnk_dest[3] = 
~stb1_rqaddr[2] &  stb1_rqaddr[1] &  stb1_rqaddr[0] ;
assign st1_l2bnk_dest[4] =  stb1_rqaddr[2] ;

assign st2_l2bnk_dest[0] = 
~stb2_rqaddr[2] & ~stb2_rqaddr[1] & ~stb2_rqaddr[0] ;
assign st2_l2bnk_dest[1] = 
~stb2_rqaddr[2] & ~stb2_rqaddr[1] &  stb2_rqaddr[0] ;
assign st2_l2bnk_dest[2] = 
~stb2_rqaddr[2] &  stb2_rqaddr[1] & ~stb2_rqaddr[0] ;
assign st2_l2bnk_dest[3] = 
~stb2_rqaddr[2] &  stb2_rqaddr[1] &  stb2_rqaddr[0] ;
assign st2_l2bnk_dest[4] =  stb2_rqaddr[2] ;

assign st3_l2bnk_dest[0] = 
~stb3_rqaddr[2] & ~stb3_rqaddr[1] & ~stb3_rqaddr[0] ;
assign st3_l2bnk_dest[1] = 
~stb3_rqaddr[2] & ~stb3_rqaddr[1] &  stb3_rqaddr[0] ;
assign st3_l2bnk_dest[2] = 
~stb3_rqaddr[2] &  stb3_rqaddr[1] & ~stb3_rqaddr[0] ;
assign st3_l2bnk_dest[3] = 
~stb3_rqaddr[2] &  stb3_rqaddr[1] &  stb3_rqaddr[0] ;
assign st3_l2bnk_dest[4] =  stb3_rqaddr[2] ;

//=================================================================================================
//  	BLK-LOAD TRACKING
//=================================================================================================

// The 64B load request is divided into 4 16B requests, i.e., 4 pcx pkts.
// The last bld request to the pcx must be marked as so. 
// Only one bld can be processed at any time.

   wire [1:0] bld_thrd_din;
   wire [1:0] bld_thrd_dout;
   wire [3:0] bld_dcd_thrd;
   wire       ld_03_inst_vld_g;
   wire       bld_pcx_rq_sel_d1;
   
wire blk_asi_g;
dff_s  stgg_blkasi (
        .din    (lsu_blk_asi_m),
        .q      (blk_asi_g),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	bld_helper_cmplt_e = lsu_fldd_vld_en & bld_dout & (
                             bld_dcd_thrd[0] & lsu_dfill_dcd_thrd[0] |
                             bld_dcd_thrd[1] & lsu_dfill_dcd_thrd[1] |
                             bld_dcd_thrd[2] & lsu_dfill_dcd_thrd[2] |
                             bld_dcd_thrd[3] & lsu_dfill_dcd_thrd[3] );

   
dff_s #(1) stgm_bldhlpr (
        .din    (bld_helper_cmplt_e),
        .q    	(bld_helper_cmplt_m),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	lsu_bld_helper_cmplt_m = bld_helper_cmplt_m ;

dff_s #(1) stgg_bldhlpr (
        .din    (bld_helper_cmplt_m),
        .q    	(bld_helper_cmplt_g),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	alt_space_m, alt_space_g, alt_space_w2 ;
dff_s stg_aspacem(
        .din    (ifu_lsu_alt_space_e),
        .q    	(alt_space_m),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s stg_aspaceg(
        .din    (alt_space_m),
        .q    	(alt_space_g),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s stg_aspacew2 (
        .din    (alt_space_g),
        .q    	(alt_space_w2),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        );


// PCX bld helper issue :
// 00-1st->01-2nd->10-3rd->11-4th->00
    
   assign     bld_thrd_din[0] = ld1_inst_vld_unflushed | ld3_inst_vld_unflushed;
   assign     bld_thrd_din[1] = ld2_inst_vld_unflushed | ld3_inst_vld_unflushed;


   assign ld_03_inst_vld_g =  lsu_inst_vld_w & (
                              ld0_inst_vld_unflushed | ld1_inst_vld_unflushed | 
                              ld2_inst_vld_unflushed | ld3_inst_vld_unflushed );
   
   assign	bld_g = blk_asi_g & ldst_fp_g & ldst_dbl_g & alt_space_g & ld_03_inst_vld_g ;
		//~lsu_tlb_perr_ld_rq_kill_w ; // Bug 4645

wire	bld_w2 ;
dff_s #(1) bldstg (
        .din    (bld_g),
        .q      (bld_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	perr_ld_rq_kill_w2 ;
wire	bld_perr_kill_w2 ;
assign	bld_perr_kill_w2 = bld_w2 & perr_ld_rq_kill_w2 ;

wire bld_reset; 
dffre_s #(2) bld_thrd (
        .din  (bld_thrd_din[1:0] ),
        .q    (bld_thrd_dout[1:0]),
  	.rst  (bld_reset), .en (bld_g),
        .clk  (clk),
        .se   (1'b0),       .si (),          .so ()
        );                     
   assign bld_dcd_thrd[0] = ~bld_thrd_dout[1] & ~bld_thrd_dout[0];
   assign bld_dcd_thrd[1] = ~bld_thrd_dout[1] &  bld_thrd_dout[0];
   assign bld_dcd_thrd[2] =  bld_thrd_dout[1] & ~bld_thrd_dout[0];
   assign bld_dcd_thrd[3] =  bld_thrd_dout[1] &  bld_thrd_dout[0];

//bug 2757    
   assign bld_pcx_rq_sel_d1 = ld0_pcx_rq_sel_d1 & bld_dcd_thrd[0] | 
                              ld1_pcx_rq_sel_d1 & bld_dcd_thrd[1] |
                              ld2_pcx_rq_sel_d1 & bld_dcd_thrd[2] | 
                              ld3_pcx_rq_sel_d1 & bld_dcd_thrd[3];

   //wire   bld_pcx_rq_sel_d2, bld_pcx_rq_sel;
   wire    bld_pcx_rq_sel;
   //bug 3322
//   assign bld_pcx_rq_sel = bld_pcx_rq_sel_d2 & ~pcx_req_squash_d1;
   
//dff #(1) ff_bld_pcx_rq_sel_d2 (
//        .din  (bld_pcx_rq_sel_d1),
//        .q    (bld_pcx_rq_sel_d2),
//        .clk  (clk),
//        .se   (1'b0),       .si (),          .so ()
//        );                  

  assign bld_pcx_rq_sel = (ld0_pcx_rq_sel_d2 & bld_dcd_thrd[0] | 
                           ld1_pcx_rq_sel_d2 & bld_dcd_thrd[1] |
                           ld2_pcx_rq_sel_d2 & bld_dcd_thrd[2] | 
                           ld3_pcx_rq_sel_d2 & bld_dcd_thrd[3] ) &
                           ~pcx_req_squash_d1;
     
  assign	bld_en = bld_g |  (bld_pcx_rq_sel & bld_dout & ~(bld_cnt[1] & bld_cnt[0])) ; 
  assign	bld_din = bld_g | bld_dout ;
  assign	bcnt_din[1:0] = bld_cnt[1:0] + {1'b0,(bld_pcx_rq_sel & bld_dout)} ;

// Reset by last completing bld helper.  
  assign	bld_reset = 
	reset | bld_perr_kill_w2 |
	(bld_rd_dout[2] & bld_rd_dout[1] & bld_rd_dout[0] & bld_helper_cmplt_g) ;

assign	lsu_bld_reset = bld_reset ;

wire	bld_dout_tmp ;
dffre_s #(3)   bld_pcx_cnt (
        .din  ({bcnt_din[1:0],bld_din}),
        .q    ({bld_cnt[1:0], bld_dout_tmp}),
       	.rst  (bld_reset), .en (bld_en),
        .clk  (clk),
        .se   (1'b0),       .si (),          .so ()
        );

assign	bld_dout = bld_dout_tmp & ~bld_perr_kill_w2 ;

// Last one allows ld-rq-vld to be reset.
assign  bld_annul[0] =  bld_dcd_thrd[0] & (bld_dout & ~(bld_cnt[1] & bld_cnt[0])) ;
assign  bld_annul[1] =  bld_dcd_thrd[1] & (bld_dout & ~(bld_cnt[1] & bld_cnt[0])) ;
assign  bld_annul[2] =  bld_dcd_thrd[2] & (bld_dout & ~(bld_cnt[1] & bld_cnt[0])) ;
assign  bld_annul[3] =  bld_dcd_thrd[3] & (bld_dout & ~(bld_cnt[1] & bld_cnt[0])) ;

dff_s #(4) bannul_d1 (
        .din    (bld_annul[3:0]),
        .q      (bld_annul_d1[3:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );
   
// Maintain rd (cpx return pkt counter). This is based on when the blk ld helper completes.
// lower 3b of rd have to start out as zero.
// Should be asserted 8 times for the entire bld.
assign	bld_rd_en = (bld_helper_cmplt_m & bld_dout) ;
assign	bld_rd_din[2:0] = bld_rd_dout_m[2:0] + {2'b00,(bld_helper_cmplt_m & bld_dout)} ;
//assign	bld_rd_en = (bld_helper_cmplt_g & bld_dout) ;
//assign	bld_rd_din[2:0] = bld_rd_dout[2:0] + {2'b00,(bld_helper_cmplt_g & bld_dout)} ;

dffre_s #(3)   bld_cpx_cnt (
        .din  (bld_rd_din[2:0]),
        .q    (bld_rd_dout_m[2:0]),
  	    .rst  (bld_reset), .en   (bld_rd_en),
        .clk  (clk),
        .se   (1'b0),       .si (),          .so ()
        );

dff_s #(3) bld_cnt_stg (
        .din    (bld_rd_dout_m[2:0]),
        .q      (bld_rd_dout[2:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Select appr. rd. (cpx return pkt counter)
assign	lsu_ffu_bld_cnt_w[2:0] = bld_rd_dout[2:0] ;
assign	lsu_bld_cnt_m[2:0] = bld_rd_dout_m[2:0] ;

// pcx pkt address cntrl.
wire	[1:0]	addr_b54 ;
assign   addr_b54[1:0] = bld_cnt[1:0];

/*wire bld_rq_w2 ;
assign bld_rq_w2 = bld_dout; */

dff_s #(2) blkrq_d1 (
        .din    ({addr_b54[1:0]}),
        .q      ({lsu_bld_rq_addr[1:0]}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	lsu_bld_pcx_rq = bld_pcx_rq_sel_d1 & bld_dout ;

/*dff #(3) blkrq_d1 (
        .din    ({addr_b54[1:0],bld_rq_w2}),
        .q      ({lsu_bld_rq_addr[1:0],lsu_bld_pcx_rq}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );*/


//=================================================================================================
//  	LOAD PCX PKT REQ CONTROL
//=================================================================================================

// Staging pref.
wire pref_inst_m, pref_inst_g ;

dff_s  stgm_prf (
        .din    (ifu_lsu_pref_inst_e),
        .q      (pref_inst_m),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s  stgg_prf (
        .din    (pref_inst_m),
        .q      (pref_inst_g),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Performance Ctr Info
dff_s #(4)  stgg_dmiss (
        .din    ({ld3_l2cache_rq,ld2_l2cache_rq,ld1_l2cache_rq,ld0_l2cache_rq}),
        .q      (lsu_tlu_dcache_miss_w2[3:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire  ld0_l2cache_rq_w2, ld1_l2cache_rq_w2, ld2_l2cache_rq_w2, ld3_l2cache_rq_w2 ;

assign ld0_l2cache_rq_w2  =  lsu_tlu_dcache_miss_w2[0];
assign ld1_l2cache_rq_w2  =  lsu_tlu_dcache_miss_w2[1];
assign ld2_l2cache_rq_w2  =  lsu_tlu_dcache_miss_w2[2];
assign ld3_l2cache_rq_w2  =  lsu_tlu_dcache_miss_w2[3];

wire    pref_vld0_g, pref_vld1_g, pref_vld2_g, pref_vld3_g ;
wire    pref_rq_vld0_g, pref_rq_vld1_g, pref_rq_vld2_g, pref_rq_vld3_g ;
wire    pref_vld_g ;
assign  pref_vld_g = pref_inst_g & ~tlb_pgnum_g[39] & tlb_cam_hit_g ; // Bug 4318. 
assign  pref_rq_vld0_g = pref_vld_g & thread0_g & lsu_inst_vld_w ;
assign  pref_rq_vld1_g = pref_vld_g & thread1_g & lsu_inst_vld_w ;
assign  pref_rq_vld2_g = pref_vld_g & thread2_g & lsu_inst_vld_w ;
assign  pref_rq_vld3_g = pref_vld_g & thread3_g & lsu_inst_vld_w ;
assign  pref_vld0_g = pref_inst_g & thread0_g ;
assign  pref_vld1_g = pref_inst_g & thread1_g ;
assign  pref_vld2_g = pref_inst_g & thread2_g ;
assign  pref_vld3_g = pref_inst_g & thread3_g ;

//=========================================================================================
// Shift full-raw/partial-raw logic from rw_ctl to qctl1

wire    ldquad_inst_g ;
dff_s  ldq_stgg (
  .din    (lsu_ldquad_inst_m), .q (ldquad_inst_g),
  .clk    (clk),
  .se   (1'b0), .si (), .so ()
  );

wire    io_ld,io_ld_w2 ;
assign  io_ld = tlb_pgnum_g[39] ; // Bug 4362
//assign  io_ld = tlb_pgnum_g[39]  & ~(~tlb_pgnum_g[38]  & tlb_pgnum_g[37]) ;

wire	stb_not_empty ;
assign  stb_not_empty  =
  thread0_g ? ~lsu_stb_empty[0] :
    thread1_g ? ~lsu_stb_empty[1] :
      thread2_g ? ~lsu_stb_empty[2] :
                        ~lsu_stb_empty[3] ;

wire  	ldq_hit_g,ldq_hit_w2 ;
wire    ldq_stb_cam_hit ;
assign  ldq_stb_cam_hit = stb_cam_hit_bf & ldquad_inst_g ;
// Terms can be made common.
assign  ldq_hit_g = ldq_stb_cam_hit ;

wire	full_raw_g,partial_raw_g ;
wire	full_raw_w2,partial_raw_w2 ;
assign	full_raw_g = |stb_ld_full_raw[7:0] ;
assign	partial_raw_g = |stb_ld_partial_raw[7:0] ;

wire	stb_cam_mhit_w2 ;
wire	stb_not_empty_w2 ;
dff_s #(6) stgw2_rawcond (
        .din    ({full_raw_g,partial_raw_g,stb_cam_mhit,ldq_hit_g,io_ld,stb_not_empty}),
        .q      ({full_raw_w2,partial_raw_w2,stb_cam_mhit_w2,ldq_hit_w2,io_ld_w2,
		stb_not_empty_w2}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// BEGIN !!! ld_stb_full_raw_g for SAS support only !!!
//wire	ld_stb_full_raw_g ;
//wire	ld_stb_partial_raw_g ;

// END !!! ld_stb_full_raw_g for SAS support only !!!
assign  ld_stb_full_raw_w2 =
        (full_raw_w2 & ~(stb_cam_mhit_w2 | ldq_hit_w2 | io_ld_w2)) ;
        //(full_raw_w2 & ~(stb_cam_mhit_w2 | ldq_hit_w2 | io_ld_w2)) ; // Bug 3624
wire	ld_stb_partial_raw_w2 ;
wire	stb_cam_hit_w2 ;
assign  ld_stb_partial_raw_w2 =
        (partial_raw_w2 | stb_cam_mhit_w2 | ldq_hit_w2 | 
	(io_ld_w2 & stb_not_empty_w2)) ;
        //(partial_raw_w2 | stb_cam_mhit_w2 | ldq_hit_w2 | (io_ld_w2 & stb_not_empty_w2)) ;

//=========================================================================================

/*wire	ld_stb_full_raw_w2 ;
dff_s #(1) stgw2_fraw (
        .din    (ld_stb_full_raw_g),
        .q      (ld_stb_full_raw_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); */

// THREAD0 LOAD PCX REQUEST CONTROL

//=====
// For delayed ld0,1,2,3_l2cache_rq, we need to delay certain
// inputs to flops enabled by ld0,1,2,3_l2cache_rq.

wire	ld0_ldbl_rq_w2 ;
wire	ld1_ldbl_rq_w2 ;
wire	ld2_ldbl_rq_w2 ;
wire	ld3_ldbl_rq_w2 ;
// wire [1:0] 	ld_pcx_pkt_wy_w2 ;
 wire		pref_rq_vld0_w2,pref_rq_vld1_w2,pref_rq_vld2_w2,pref_rq_vld3_w2 ;
 wire    	non_l2bnk ;
 wire		non_l2bnk_w2 ;
 wire [7:6]	ldst_va_w2 ;

dff_s #(7) stgw2_l2crqmx (
        .din    ({
                //ld_pcx_pkt_wy_g[1:0],
 		pref_rq_vld0_g,pref_rq_vld1_g,pref_rq_vld2_g,pref_rq_vld3_g,
 		non_l2bnk,
		ldst_va_g[7:6]}),
        .q    	({
                //ld_pcx_pkt_wy_w2[1:0],
 		pref_rq_vld0_w2,pref_rq_vld1_w2,pref_rq_vld2_w2,pref_rq_vld3_w2,
 		non_l2bnk_w2,
		ldst_va_w2[7:6]}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// wire [1:0] 	ld_pcx_pkt_wy_mx0,ld_pcx_pkt_wy_mx1,ld_pcx_pkt_wy_mx2,ld_pcx_pkt_wy_mx3 ;
 wire		pref_rq_vld0_mx,pref_rq_vld1_mx,pref_rq_vld2_mx,pref_rq_vld3_mx ;
 wire		non_l2bnk_mx0,non_l2bnk_mx1,non_l2bnk_mx2,non_l2bnk_mx3 ;
 wire [7:6]	ldst_va_mx0,ldst_va_mx1,ldst_va_mx2,ldst_va_mx3 ;

// timing fix: 5/19/03: move secondary hit way generation to w2
//                      remove ld_pcx_pkt_wy_mx[0-3] and replace w/ lsu_lmq_pkt_way_w2
// assign	ld_pcx_pkt_wy_mx0[1:0] = 
//	ld0_ldbl_rq_w2 ? ld_pcx_pkt_wy_w2[1:0] : ld_pcx_pkt_wy_g[1:0] ;
// assign	ld_pcx_pkt_wy_mx1[1:0] = 
//	ld1_ldbl_rq_w2 ? ld_pcx_pkt_wy_w2[1:0] : ld_pcx_pkt_wy_g[1:0] ;
// assign	ld_pcx_pkt_wy_mx2[1:0] = 
//	ld2_ldbl_rq_w2 ? ld_pcx_pkt_wy_w2[1:0] : ld_pcx_pkt_wy_g[1:0] ;
// assign	ld_pcx_pkt_wy_mx3[1:0] = 
//	ld3_ldbl_rq_w2 ? ld_pcx_pkt_wy_w2[1:0] : ld_pcx_pkt_wy_g[1:0] ;


 assign	pref_rq_vld0_mx =
	ld0_ldbl_rq_w2 ? pref_rq_vld0_w2 : pref_rq_vld0_g ;
 assign	pref_rq_vld1_mx =
	ld1_ldbl_rq_w2 ? pref_rq_vld1_w2 : pref_rq_vld1_g ;
 assign	pref_rq_vld2_mx =
	ld2_ldbl_rq_w2 ? pref_rq_vld2_w2 : pref_rq_vld2_g ;
 assign	pref_rq_vld3_mx =
	ld3_ldbl_rq_w2 ? pref_rq_vld3_w2 : pref_rq_vld3_g ;
 assign	non_l2bnk_mx0 =
	ld0_ldbl_rq_w2 ? non_l2bnk_w2 : non_l2bnk ;
 assign	non_l2bnk_mx1 =
	ld1_ldbl_rq_w2 ? non_l2bnk_w2 : non_l2bnk ;
 assign	non_l2bnk_mx2 =
	ld2_ldbl_rq_w2 ? non_l2bnk_w2 : non_l2bnk ;
 assign	non_l2bnk_mx3 =
	ld3_ldbl_rq_w2 ? non_l2bnk_w2 : non_l2bnk ;

//timing fix: 10/13/03 - ldst_va_mx[0-3] is used in the same cycle 'cos of perf bug fix-bug2705
//            this delays the ld request valid which in turn delays pcx_rq_for_stb
//            fix is to isolate this mux and the following l2bank addr mux from ld?_ldbl_rq_w2;
//            use ld[0-3]_inst_vld_w2 instead of ld[0-3]_ldbl_rq_w2 as select
 assign	ldst_va_mx0[7:6] =
	ld0_inst_vld_w2 ? ldst_va_w2[7:6] : ldst_va_g[7:6] ;
 assign	ldst_va_mx1[7:6] =
	ld1_inst_vld_w2 ? ldst_va_w2[7:6] : ldst_va_g[7:6] ;
 assign	ldst_va_mx2[7:6] =
	ld2_inst_vld_w2 ? ldst_va_w2[7:6] : ldst_va_g[7:6] ;
 assign	ldst_va_mx3[7:6] =
	ld3_inst_vld_w2 ? ldst_va_w2[7:6] : ldst_va_g[7:6] ;

//=====

wire	atomic_g ;
assign  atomic_g = casa_g | lsu_swap_g | lsu_ldstub_g ;

   wire dbl_force_l2access_g;
   wire dbl_force_l2access_w2;
   assign dbl_force_l2access_g = ldst_dbl_g & ~(ldst_fp_g & ~(alt_space_g & blk_asi_g));
   
wire atomic_w2;
dff_s #(2) stgw2_atm (
        .din    ({atomic_g, dbl_force_l2access_g}),
        .q      ({atomic_w2,dbl_force_l2access_w2}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s #(1) stgw2_perrkill (
        .din    (lsu_tlb_perr_ld_rq_kill_w),
        .q      (perr_ld_rq_kill_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	asi_internal_g,asi_internal_w2;
dff_s #(1) stgg_intasi (
        .din    (asi_internal_m),
        .q      (asi_internal_g),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s #(1) stgw2_intasi (
        .din    (asi_internal_g),
        .q      (asi_internal_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	ld0_l2cache_rq_kill ; 
assign	ld0_l2cache_rq_kill = 
	ld0_inst_vld_w2 & ((ld_stb_full_raw_w2 & ~dbl_force_l2access_w2) | perr_ld_rq_kill_w2) ; 
						// full-raw which looks like partial
assign	ld0_ldbl_rq_w2 = 
		((ld_stb_full_raw_w2 & dbl_force_l2access_w2) | ld_stb_partial_raw_w2)
			& ~atomic_w2 & ~perr_ld_rq_kill_w2 & ~(asi_internal_w2 & alt_space_w2) 
			& ld0_inst_vld_w2 ;

//bug:2877 - dtag parity error 2nd packet request; dont reset if dtag parity error 2nd pkt valid
//           dtag error is reset 1 cycle after 1st pkt sent
//----------------------------------------------------------------------------------------------------------
// |       1       |        2       |         3          |        4       |        5        |        6    |
//  spc_pcx_rq_pq=1   ld_err-pkt1                                           spc_pcx_rq_pq=1   ld_err-pkt2
//                                     ld0_vld_reset=0       pick 2nd pkt
//                                     error_rst=1
//----------------------------------------------------------------------------------------------------------

wire   [3:0]  dtag_perr_pkt2_vld_d1 ;
assign ld0_vld_reset = 
  (reset | (ld0_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld0_inst_vld_g | bld_annul_d1[0] | dtag_perr_pkt2_vld_d1[0]))) |
  ld0_l2cache_rq_kill ;
  //(reset | (ld0_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld0_inst_vld_g | bld_annul_d1[0]))) |

// The equation for partial raw has redundancy !! Change it.
// prefetch will not bypass from stb
/* prim vs sec phase 2 change
assign ld0_l2cache_rq = 
        (((lsu_ld_miss_g & ~ld_stb_full_raw_g  & ~ld_sec_hit_g & ~ldxa_internal) |
        ((lsu_ld_hit_g | lsu_ld_miss_g) & (ld_stb_partial_raw_g | (ld_stb_full_raw_g & ldst_dbl_g))))
        & ~atomic_g & ld0_inst_vld_g) |
	| (pref_inst_g & tlb_cam_hit_g & thread0_g) ;
*/


wire  ld0_l2cache_rq_g;

assign ld0_l2cache_rq_g = 
        (((lsu_ld_miss_g & ~ldxa_internal))
        //((lsu_ld_hit_g | lsu_ld_miss_g) & (ld_stb_partial_raw_g)))
        & ~atomic_g & ld0_inst_vld_g)
        | pref_rq_vld0_g; 

assign ld0_l2cache_rq = ld0_l2cache_rq_g | ld0_ldbl_rq_w2 ;
   
wire  ld0_pkt_vld_unmasked ;
wire  ld1_pkt_vld_unmasked ;
wire  ld2_pkt_vld_unmasked ;
wire  ld3_pkt_vld_unmasked ;
   
// ld valid until request made.
wire pref_rq_vld0;         
dffre_s #(2)  ld0_vld (
        .din    ({ld0_l2cache_rq, pref_rq_vld0_mx}    ),
        .q      ({ld0_pkt_vld_unmasked, pref_rq_vld0}),
  .rst  (ld0_vld_reset),  .en (ld0_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// bug2705 - speculative pick in w-cycle -begin
// dbl_force_l2access_g is set for ldd(f),std(f),ldq,stq
//perf fix: 7/29/03 - kill spec vld if other thread non-spec valids are set
//timing fix: 8/29/03 - flop atomic_m and ldxa_internal_m from dctl for spec req
wire    atomic_or_ldxa_internal_rq_m ;
assign  atomic_or_ldxa_internal_rq_m  =  atomic_m | lda_internal_m ;

wire atomic_or_ldxa_internal_rq_g;
dff_s #(1) ff_atomic_or_ldxa_internal_rq_g (
        .din    (atomic_or_ldxa_internal_rq_m),
        .q      (atomic_or_ldxa_internal_rq_g),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire    ld0_spec_vld_g ;
assign  ld0_spec_vld_g  =  ld0_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g &
                           ~atomic_or_ldxa_internal_rq_g &
                           ~(ld1_pkt_vld_unmasked | ld2_pkt_vld_unmasked | ld3_pkt_vld_unmasked);
//assign  ld0_spec_vld_g  =  ld0_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g ;

dff_s #(1) ff_ld0_spec_pick_vld_w2 (
        .din    (ld0_spec_pick_vld_g),
        .q      (ld0_spec_pick_vld_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// kill packet valid if spec req is picked in w and stb hits in w2
// cannot use ld0_ldbl_rawp_en_w2 because it is late signal instead use ld0_ldbl_rq_w2
//timing fix: 7/21/03 - kill pkt vld if spec pick in w-cycle was to non$ address
//timing fix: 8/6/03 - kill pkt_vld if ld?_l2cache_rq_g=0 in w-cycle but spec_pick=1
wire    ld0_pkt_vld_tmp ;
//bug 3964 - replace ld0_pkt_vld_unmasked w/ ld0_l2cache_rq_w2
//assign lsu_ld0_spec_vld_kill_w2  =  ld0_spec_pick_vld_w2 & (~ld0_pkt_vld_unmasked | ld0_l2cache_rq_kill | ld0_ldbl_rq_w2 | non_l2bnk_mx0_d1) ;
assign lsu_ld0_spec_vld_kill_w2  =  ld0_spec_pick_vld_w2 & (~ld0_l2cache_rq_w2 | ld0_l2cache_rq_kill | ld0_ldbl_rq_w2 | non_l2bnk_mx0_d1) ;

assign  ld0_pkt_vld_tmp =  ld0_pkt_vld_unmasked & ~(ld0_pcx_rq_sel_d1 | ld0_pcx_rq_sel_d2) &
                      ~(ld0_l2cache_rq_kill | ld0_ldbl_rq_w2) &
                      ~(pref_rq_vld0 & lsu_no_spc_pref[0]) ;  // prefetch pending 
                       
assign  ld0_pkt_vld = ld0_pkt_vld_tmp | ld0_spec_vld_g ;
// bug2705 - speculative pick in w-cycle -end

//assign  ld0_pkt_vld = ld0_pkt_vld_unmasked & ~ld0_pcx_rq_sel_d1 ; 

assign  ld0_fill_reset = reset | (lsu_dfq_ld_vld & lsu_dcfill_active_e & dfq_byp_sel[0]) ;


dff_s #(4) stgm_lduwyd1 (
        .din    ({ld0_fill_reset,ld1_fill_reset,ld2_fill_reset,ld3_fill_reset}),
        .q      ({ld0_fill_reset_d1,ld1_fill_reset_d1,ld2_fill_reset_d1,ld3_fill_reset_d1}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s #(4) stgm_lduwyd2 (
        .din    ({ld0_fill_reset_d1,ld1_fill_reset_d1,ld2_fill_reset_d1,ld3_fill_reset_d1}),
        .q      ({ld0_fill_reset_d2_tmp,ld1_fill_reset_d2_tmp,ld2_fill_reset_d2_tmp,ld3_fill_reset_d2_tmp}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire  ld0_l2cache_rq_w2_tmp;
wire  ld0_l2cache_rq_g_tmp;

assign ld0_l2cache_rq_g_tmp  =  ld0_l2cache_rq_g & ~pref_inst_g ;

dff_s #(1) ff_ld0_l2cache_rq_w2 (
        .din    (ld0_l2cache_rq_g_tmp),
        .q      (ld0_l2cache_rq_w2_tmp),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );


//wire ld0_unfilled_en ;
//assign	ld0_unfilled_en = ld0_l2cache_rq & ~pref_inst_g ;
wire ld0_unfilled_wy_en ;
assign	ld0_unfilled_wy_en = ld0_l2cache_rq_w2_tmp | ld0_ldbl_rq_w2 ;

wire  ld0_l2cache_rq_tmp;
assign ld0_l2cache_rq_tmp  = ld0_unfilled_wy_en & ~ld0_l2cache_rq_kill;

// ld valid until fill occur.
dffre_s #(1)  ld0out_state (
        //.din    (ld0_l2cache_rq),
        .din    (ld0_l2cache_rq_tmp),
        .q      (ld0_unfilled_tmp),
        .rst    (ld0_fill_reset_d2),  .en     (ld0_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dffre_s #(`L1D_WAY_WIDTH)  ld0out_state_way (
        //.din    (ld_pcx_pkt_wy_mx0[`L1D_WAY_MASK]}),
        .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
        .q      (ld0_unfilled_wy[`L1D_WAY_MASK]),
        .rst    (ld0_fill_reset_d2),  .en     (ld0_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	ld0_fill_reset_d2 = ld0_fill_reset_d2_tmp | ld0_l2cache_rq_kill ;
//assign	ld0_unfilled = ld0_unfilled_tmp & ~ld0_l2cache_rq_kill ;
assign	ld0_unfilled = ld0_unfilled_tmp ;

//bug3516
//assign  non_l2bnk = tlb_pgnum_g[39] & tlb_pgnum_g[38] ;
assign  non_l2bnk = tlb_pgnum_g[39]  & ~(~tlb_pgnum_g[38]  & tlb_pgnum_g[37]) ;

// ld l2bank address
dffe_s  #(3) ld0_l2bnka (
        .din    ({non_l2bnk_mx0,ldst_va_mx0[7:6]}),
        .q      (ld0_l2bnk_addr[2:0]),
  .en (ld0_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - add byp for address to be available in w-cycle
//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2 if non_l2bnk_mx0=1 (non$ access)
wire  [2:0]  ld0_l2bnk_addr_mx ;
assign  ld0_l2bnk_addr_mx[2:0]  =  ld0_pkt_vld_unmasked ? ld0_l2bnk_addr[2:0] :
                                                          {1'b0,ldst_va_mx0[7:6]} ;             // assume $able access for spec pick

//assign  ld0_l2bnk_addr_mx[2:0]  =  (ld0_inst_vld_unflushed  & lsu_inst_vld_tmp) ? 
//                                        {1'b0,ldst_va_mx0[7:6]} :             // assume $able access for spec pick
//                                        //{non_l2bnk_mx0,ldst_va_mx0[7:6]} : 
//				             ld0_l2bnk_addr[2:0] ;

//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2
dff_s #(1) ff_non_l2bnk_mx0_d1 (
        .din    (non_l2bnk_mx0),
        .q      (non_l2bnk_mx0_d1),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - change ld0_l2bnk_addr[2:0] to ld0_l2bnk_addr_mx[2:0]
assign ld0_l2bnk_dest[0] = ~ld0_l2bnk_addr_mx[2] & ~ld0_l2bnk_addr_mx[1] & ~ld0_l2bnk_addr_mx[0] ;
assign ld0_l2bnk_dest[1] = ~ld0_l2bnk_addr_mx[2] & ~ld0_l2bnk_addr_mx[1] &  ld0_l2bnk_addr_mx[0] ;
assign ld0_l2bnk_dest[2] = ~ld0_l2bnk_addr_mx[2] &  ld0_l2bnk_addr_mx[1] & ~ld0_l2bnk_addr_mx[0] ;
assign ld0_l2bnk_dest[3] = ~ld0_l2bnk_addr_mx[2] &  ld0_l2bnk_addr_mx[1] &  ld0_l2bnk_addr_mx[0] ;
assign ld0_l2bnk_dest[4] =  ld0_l2bnk_addr_mx[2] ;

// THREAD1 LOAD PCX REQUEST CONTROL

wire	ld1_l2cache_rq_kill ; 
assign	ld1_l2cache_rq_kill = 
	ld1_inst_vld_w2 & ((ld_stb_full_raw_w2 & ~dbl_force_l2access_w2) | perr_ld_rq_kill_w2) ; 	
					// full-raw which looks like partial
assign	ld1_ldbl_rq_w2 = 
		((ld_stb_full_raw_w2 & dbl_force_l2access_w2) | ld_stb_partial_raw_w2)
			& ~atomic_w2 & ~perr_ld_rq_kill_w2 & ~(asi_internal_w2 & alt_space_w2) &
			ld1_inst_vld_w2 ;

assign ld1_vld_reset = 
  (reset | (ld1_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld1_inst_vld_g | bld_annul_d1[1] | dtag_perr_pkt2_vld_d1[1]))) |
  ld1_l2cache_rq_kill ;
  //(reset | (ld1_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld1_inst_vld_g | bld_annul_d1[1]))) | // bug2877
  //(reset | (ld1_pcx_rq_sel_d1 & ~(pcx_req_squash | ld1_inst_vld_g | bld_annul[1]))) ;

wire  ld1_l2cache_rq_g;
assign ld1_l2cache_rq_g = 
        (((lsu_ld_miss_g & ~ldxa_internal))
        //((lsu_ld_hit_g | lsu_ld_miss_g) & (ld_stb_partial_raw_g))) // ldst_dbl always rqs
        & ~atomic_g & ld1_inst_vld_g)  
        | pref_rq_vld1_g ;

assign ld1_l2cache_rq =  ld1_l2cache_rq_g | ld1_ldbl_rq_w2 ;

   
// ld valid
wire pref_rq_vld1;   
dffre_s #(2)  ld1_vld (
        .din    ({ld1_l2cache_rq, pref_rq_vld1_mx}),
        .q      ({ld1_pkt_vld_unmasked, pref_rq_vld1}),
  .rst  (ld1_vld_reset),  .en (ld1_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// bug2705 - speculative pick in w-cycle-begin
wire    ld1_spec_vld_g ;
assign  ld1_spec_vld_g  =  ld1_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g  &
                           ~atomic_or_ldxa_internal_rq_g &
                           ~(ld0_pkt_vld_unmasked | ld2_pkt_vld_unmasked | ld3_pkt_vld_unmasked);
//assign  ld1_spec_vld_g  =  ld1_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g ;

dff_s #(1) ff_ld1_spec_pick_vld_w2 (
        .din    (ld1_spec_pick_vld_g),
        .q      (ld1_spec_pick_vld_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// kill packet valid if spec req is picked in w and stb hits in w2
wire    ld1_pkt_vld_tmp ;
assign lsu_ld1_spec_vld_kill_w2  =  ld1_spec_pick_vld_w2 & (~ld1_l2cache_rq_w2 | ld1_l2cache_rq_kill | ld1_ldbl_rq_w2 | non_l2bnk_mx1_d1) ;

assign  ld1_pkt_vld_tmp =  ld1_pkt_vld_unmasked & ~(ld1_pcx_rq_sel_d1 | ld1_pcx_rq_sel_d2) &
                      ~(ld1_l2cache_rq_kill | ld1_ldbl_rq_w2) &
                      ~(pref_rq_vld1 & lsu_no_spc_pref[1]) ; 

assign  ld1_pkt_vld = ld1_pkt_vld_tmp | ld1_spec_vld_g ;
// bug2705 - speculative pick in w-cycle-end

//assign  ld1_pkt_vld = ld1_pkt_vld_unmasked & ~ld1_pcx_rq_sel_d1 ; 


assign  ld1_fill_reset = reset | (lsu_dfq_ld_vld & lsu_dcfill_active_e & dfq_byp_sel[1]) ;

wire  ld1_l2cache_rq_g_tmp;
wire  ld1_l2cache_rq_w2_tmp;

assign ld1_l2cache_rq_g_tmp  =  ld1_l2cache_rq_g & ~pref_inst_g ;
 
dff_s #(1) ff_ld1_l2cache_rq_w2 (
         .din    (ld1_l2cache_rq_g_tmp),
         .q      (ld1_l2cache_rq_w2_tmp),
         .clk  (clk),
         .se     (1'b0),       .si (),          .so ()
         );

//wire ld1_unfilled_en ;
//assign	ld1_unfilled_en = ld1_l2cache_rq & ~pref_inst_g ;
wire ld1_unfilled_wy_en ;
assign	ld1_unfilled_wy_en = ld1_l2cache_rq_w2_tmp | ld1_ldbl_rq_w2 ;

wire  ld1_l2cache_rq_tmp;
assign ld1_l2cache_rq_tmp  = ld1_unfilled_wy_en & ~ld1_l2cache_rq_kill;

// ld valid until fill occur.
dffre_s  #(1)  ld1out_state (
        //.din    (ld1_l2cache_rq),
        .din    (ld1_l2cache_rq_tmp),
        .q      (ld1_unfilled_tmp),
        .rst    (ld1_fill_reset_d2),  .en     (ld1_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
  );
dffre_s  #(`L1D_WAY_WIDTH)  ld1out_state_way (
        //.din    (ld_pcx_pkt_wy_mx1[`L1D_WAY_MASK]),
        .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
        .q      (ld1_unfilled_wy[`L1D_WAY_MASK]),
        .rst    (ld1_fill_reset_d2),  .en     (ld1_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
  );


assign	ld1_fill_reset_d2 = ld1_fill_reset_d2_tmp | ld1_l2cache_rq_kill ;
//assign	ld1_unfilled = ld1_unfilled_tmp & ~ld1_l2cache_rq_kill ;
assign	ld1_unfilled = ld1_unfilled_tmp ;

// ld l2bank address
dffe_s  #(3) ld1_l2bnka (
        .din    ({non_l2bnk_mx1,ldst_va_mx1[7:6]}),
        .q      (ld1_l2bnk_addr[2:0]),
  .en (ld1_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - add byp for address to be available in w-cycle
//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2 if non_l2bnk_mx0=1 (non$ access)

wire  [2:0]  ld1_l2bnk_addr_mx ;
assign  ld1_l2bnk_addr_mx[2:0]  =  ld1_pkt_vld_unmasked  ? ld1_l2bnk_addr[2:0] :
				           {1'b0,ldst_va_mx1[7:6]} ; 

//assign  ld1_l2bnk_addr_mx[2:0]  =  (ld1_inst_vld_unflushed  & lsu_inst_vld_tmp) ? 
//				           {1'b0,ldst_va_mx1[7:6]} : 
//				           //{non_l2bnk_mx1,ldst_va_mx1[7:6]} : 
//						ld1_l2bnk_addr[2:0] ;

//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2
dff_s #(1) ff_non_l2bnk_mx1_d1 (
        .din    (non_l2bnk_mx1),
        .q      (non_l2bnk_mx1_d1),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - change ld1_l2bnk_addr[2:0] to ld1_l2bnk_addr_mx[2:0]
assign ld1_l2bnk_dest[0] = ~ld1_l2bnk_addr_mx[2] & ~ld1_l2bnk_addr_mx[1] & ~ld1_l2bnk_addr_mx[0] ;
assign ld1_l2bnk_dest[1] = ~ld1_l2bnk_addr_mx[2] & ~ld1_l2bnk_addr_mx[1] &  ld1_l2bnk_addr_mx[0] ;
assign ld1_l2bnk_dest[2] = ~ld1_l2bnk_addr_mx[2] &  ld1_l2bnk_addr_mx[1] & ~ld1_l2bnk_addr_mx[0] ;
assign ld1_l2bnk_dest[3] = ~ld1_l2bnk_addr_mx[2] &  ld1_l2bnk_addr_mx[1] &  ld1_l2bnk_addr_mx[0] ;
assign ld1_l2bnk_dest[4] =  ld1_l2bnk_addr_mx[2] ;


// THREAD2 LOAD PCX REQUEST CONTROL

wire	ld2_l2cache_rq_kill ; 
assign	ld2_l2cache_rq_kill = 
	ld2_inst_vld_w2 & ((ld_stb_full_raw_w2 & ~dbl_force_l2access_w2) | perr_ld_rq_kill_w2) ; 	
						// full-raw which looks like partial
assign	ld2_ldbl_rq_w2 = 
		((ld_stb_full_raw_w2 & dbl_force_l2access_w2) | ld_stb_partial_raw_w2)
			& ~atomic_w2 & ~perr_ld_rq_kill_w2 & ~(asi_internal_w2 & alt_space_w2) & 
			ld2_inst_vld_w2 ;
//assign	ld2_l2cache_rq_kill = ld2_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 ;
//assign	ld2_ldbl_rq_w2 = ld_stb_full_raw_w2 & dbl_force_l2access_w2 & ~atomic_w2 & ld2_inst_vld_w2 ;

assign ld2_vld_reset = 
  (reset | (ld2_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld2_inst_vld_g | bld_annul_d1[2] | dtag_perr_pkt2_vld_d1[2]))) |
  ld2_l2cache_rq_kill ;
  //(reset | (ld2_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld2_inst_vld_g | bld_annul_d1[2]))) | // bug2877
  //(reset | (ld2_pcx_rq_sel_d1 & ~(pcx_req_squash | ld2_inst_vld_g | bld_annul[2]))) ;

wire  ld2_l2cache_rq_g;

assign ld2_l2cache_rq_g = 
        (((lsu_ld_miss_g & ~ldxa_internal)) 
        //((lsu_ld_hit_g | lsu_ld_miss_g) & (ld_stb_partial_raw_g))) // ldst_dbl always rqs
        & ~atomic_g & ld2_inst_vld_g )
        | pref_rq_vld2_g ;
   
assign ld2_l2cache_rq = ld2_l2cache_rq_g | ld2_ldbl_rq_w2 ;

   
// ld valid
wire pref_rq_vld2;         
dffre_s #(2) ld2_vld (
        .din    ({ld2_l2cache_rq, pref_rq_vld2_mx}),
        .q      ({ld2_pkt_vld_unmasked, pref_rq_vld2} ),
  .rst  (ld2_vld_reset),  .en (ld2_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// bug2705 - speculative pick in w-cycle - begin
wire    ld2_spec_vld_g ;
assign  ld2_spec_vld_g  =  ld2_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g  &
                           ~atomic_or_ldxa_internal_rq_g &
                           ~(ld0_pkt_vld_unmasked | ld1_pkt_vld_unmasked | ld3_pkt_vld_unmasked);
//assign  ld2_spec_vld_g  =  ld2_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g ;

dff_s #(1) ff_ld2_spec_pick_vld_w2 (
        .din    (ld2_spec_pick_vld_g),
        .q      (ld2_spec_pick_vld_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// kill packet valid if spec req is picked in w and stb hits in w2
wire    ld2_pkt_vld_tmp ;
assign lsu_ld2_spec_vld_kill_w2  =  ld2_spec_pick_vld_w2 & (~ld2_l2cache_rq_w2 | ld2_l2cache_rq_kill | ld2_ldbl_rq_w2 | non_l2bnk_mx2_d1) ;

assign  ld2_pkt_vld_tmp = ld2_pkt_vld_unmasked & ~(ld2_pcx_rq_sel_d1 | ld2_pcx_rq_sel_d2) & 
                      ~(ld2_l2cache_rq_kill | ld2_ldbl_rq_w2) &
                      ~(pref_rq_vld2 & lsu_no_spc_pref[2]) ; 

assign  ld2_pkt_vld = ld2_pkt_vld_tmp | ld2_spec_vld_g ;
// bug2705 - speculative pick in w-cycle - end

//assign  ld2_pkt_vld = ld2_pkt_vld_unmasked & ~ld2_pcx_rq_sel_d1 ; 


assign  ld2_fill_reset = reset | (lsu_dfq_ld_vld & lsu_dcfill_active_e & dfq_byp_sel[2]) ;

wire  ld2_l2cache_rq_g_tmp;
wire  ld2_l2cache_rq_w2_tmp;

assign ld2_l2cache_rq_g_tmp  =  ld2_l2cache_rq_g & ~pref_inst_g ;

dff_s #(1) ff_ld2_l2cache_rq_w2 (
         .din    (ld2_l2cache_rq_g_tmp),
         .q      (ld2_l2cache_rq_w2_tmp),
         .clk  (clk),
         .se     (1'b0),       .si (),          .so ()
         );

//wire ld2_unfilled_en ;
//assign	ld2_unfilled_en = ld2_l2cache_rq & ~pref_inst_g ;
wire ld2_unfilled_wy_en ;
assign	ld2_unfilled_wy_en = ld2_l2cache_rq_w2_tmp | ld2_ldbl_rq_w2 ;

wire  ld2_l2cache_rq_tmp;
assign ld2_l2cache_rq_tmp  = ld2_unfilled_wy_en & ~ld2_l2cache_rq_kill;

// ld valid until fill occur.
dffre_s  #(1) ld2out_state (
        //.din    (ld2_l2cache_rq),
        .din    (ld2_l2cache_rq_tmp),
        .q      (ld2_unfilled_tmp),
        .rst    (ld2_fill_reset_d2),  .en     (ld2_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
dffre_s  #(`L1D_WAY_WIDTH) ld2out_state_way (
        .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
        .q      (ld2_unfilled_wy[`L1D_WAY_MASK]),
        .rst    (ld2_fill_reset_d2),  .en     (ld2_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


assign	ld2_fill_reset_d2 = ld2_fill_reset_d2_tmp | ld2_l2cache_rq_kill ;
//assign	ld2_unfilled = ld2_unfilled_tmp & ~ld2_l2cache_rq_kill ;
assign	ld2_unfilled = ld2_unfilled_tmp ;

// ld l2bank address
dffe_s  #(3) ld2_l2bnka (
        .din    ({non_l2bnk_mx2,ldst_va_mx2[7:6]}),
        .q      (ld2_l2bnk_addr[2:0]),
  .en (ld2_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - add byp for address to be available in w-cycle
//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2 if non_l2bnk_mx0=1 (non$ access)

wire  [2:0]  ld2_l2bnk_addr_mx ;
assign  ld2_l2bnk_addr_mx[2:0]  =  ld2_pkt_vld_unmasked ? ld2_l2bnk_addr[2:0] :
					{1'b0,ldst_va_mx2[7:6]} ; 

//assign  ld2_l2bnk_addr_mx[2:0]  =  (ld2_inst_vld_unflushed  & lsu_inst_vld_tmp) ? 
//					{1'b0,ldst_va_mx2[7:6]} : 
//					//{non_l2bnk_mx2,ldst_va_mx2[7:6]} : 
//						ld2_l2bnk_addr[2:0] ;

//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2
dff_s #(1) ff_non_l2bnk_mx2_d1 (
        .din    (non_l2bnk_mx2),
        .q      (non_l2bnk_mx2_d1),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - change ld2_l2bnk_addr[2:0] to ld2_l2bnk_addr_mx[2:0]
assign ld2_l2bnk_dest[0] = ~ld2_l2bnk_addr_mx[2] & ~ld2_l2bnk_addr_mx[1] & ~ld2_l2bnk_addr_mx[0] ;
assign ld2_l2bnk_dest[1] = ~ld2_l2bnk_addr_mx[2] & ~ld2_l2bnk_addr_mx[1] &  ld2_l2bnk_addr_mx[0] ;
assign ld2_l2bnk_dest[2] = ~ld2_l2bnk_addr_mx[2] &  ld2_l2bnk_addr_mx[1] & ~ld2_l2bnk_addr_mx[0] ;
assign ld2_l2bnk_dest[3] = ~ld2_l2bnk_addr_mx[2] &  ld2_l2bnk_addr_mx[1] &  ld2_l2bnk_addr_mx[0] ;
assign ld2_l2bnk_dest[4] =  ld2_l2bnk_addr_mx[2] ;

// THREAD3 LOAD PCX REQUEST CONTROL

wire	ld3_l2cache_rq_kill ; 
assign	ld3_l2cache_rq_kill = 
	ld3_inst_vld_w2 & ((ld_stb_full_raw_w2 & ~dbl_force_l2access_w2) | perr_ld_rq_kill_w2) ; 	
						// full-raw which looks like partial
assign	ld3_ldbl_rq_w2 = 
		((ld_stb_full_raw_w2 & dbl_force_l2access_w2) | ld_stb_partial_raw_w2)
			& ~atomic_w2 & ~perr_ld_rq_kill_w2 & ~(asi_internal_w2 & alt_space_w2) &
			ld3_inst_vld_w2 ;
//assign	ld3_l2cache_rq_kill = ld3_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 ;
//assign	ld3_ldbl_rq_w2 = ld_stb_full_raw_w2 & dbl_force_l2access_w2 & ~atomic_w2 & ld3_inst_vld_w2 ;

assign ld3_vld_reset = 
  (reset | (ld3_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld3_inst_vld_g | bld_annul_d1[3] | dtag_perr_pkt2_vld_d1[3]))) |
  ld3_l2cache_rq_kill ;
  //(reset | (ld3_pcx_rq_sel_d2 & ~(pcx_req_squash_d1 | ld3_inst_vld_g | bld_annul_d1[3]))) | // bug 2877
  //(reset | (ld3_pcx_rq_sel_d1 & ~(pcx_req_squash | ld3_inst_vld_g | bld_annul[3]))) ;

wire  ld3_l2cache_rq_g;
assign ld3_l2cache_rq_g = 
        (((lsu_ld_miss_g & ~ldxa_internal))
        //((lsu_ld_hit_g | lsu_ld_miss_g) & (ld_stb_partial_raw_g))) // ldst_dbl always rqs
        & ~atomic_g & ld3_inst_vld_g) 
        | pref_rq_vld3_g ;

assign  ld3_l2cache_rq =  ld3_l2cache_rq_g | ld3_ldbl_rq_w2 ;
   
   
// ld valid
wire pref_rq_vld3;         
dffre_s  #(2) ld3_vld (
        .din    ({ld3_l2cache_rq, pref_rq_vld3_mx} ),
        .q      ({ld3_pkt_vld_unmasked, pref_rq_vld3}),
  .rst  (ld3_vld_reset),  .en (ld3_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// bug2705 - speculative pick in w-cycle - begin
wire    ld3_spec_vld_g ;
assign  ld3_spec_vld_g  =  ld3_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g  &
                           ~atomic_or_ldxa_internal_rq_g &
                           ~(ld0_pkt_vld_unmasked | ld1_pkt_vld_unmasked | ld2_pkt_vld_unmasked);
//assign  ld3_spec_vld_g  =  ld3_inst_vld_unflushed & lsu_inst_vld_tmp & ~dbl_force_l2access_g & tlb_cam_hit_g ;


dff_s #(1) ff_ld3_spec_pick_vld_w2 (
        .din    (ld3_spec_pick_vld_g),
        .q      (ld3_spec_pick_vld_w2),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// kill packet valid if spec req is picked in w and stb hits in w2
wire    ld3_pkt_vld_tmp ;
assign lsu_ld3_spec_vld_kill_w2  =  ld3_spec_pick_vld_w2 & (~ld3_l2cache_rq_w2 | ld3_l2cache_rq_kill | ld3_ldbl_rq_w2 | non_l2bnk_mx3_d1) ;

assign  ld3_pkt_vld_tmp = ld3_pkt_vld_unmasked & ~(ld3_pcx_rq_sel_d1 | ld3_pcx_rq_sel_d2) & 
                      ~(ld3_l2cache_rq_kill | ld3_ldbl_rq_w2) &
                      ~(pref_rq_vld3 & lsu_no_spc_pref[3]) ;

assign  ld3_pkt_vld = ld3_pkt_vld_tmp | ld3_spec_vld_g ;
// bug2705 - speculative pick in w-cycle - end

//assign  ld3_pkt_vld = ld3_pkt_vld_unmasked & ~ld3_pcx_rq_sel_d1 ; 

assign  ld3_fill_reset = reset | (lsu_dfq_ld_vld & lsu_dcfill_active_e & dfq_byp_sel[3]) ;

wire  ld3_l2cache_rq_g_tmp;
wire  ld3_l2cache_rq_w2_tmp;

assign ld3_l2cache_rq_g_tmp  =  ld3_l2cache_rq_g & ~pref_inst_g ;

dff_s #(1) ff_ld3_l2cache_rq_w2 (
         .din    (ld3_l2cache_rq_g_tmp),
         .q      (ld3_l2cache_rq_w2_tmp),
         .clk  (clk),
         .se     (1'b0),       .si (),          .so ()
         );

//wire ld3_unfilled_en ;
//assign	ld3_unfilled_en = ld3_l2cache_rq & ~pref_inst_g ;
wire ld3_unfilled_wy_en ;
assign	ld3_unfilled_wy_en = ld3_l2cache_rq_w2_tmp | ld3_ldbl_rq_w2 ;

wire  ld3_l2cache_rq_tmp;
assign ld3_l2cache_rq_tmp  = ld3_unfilled_wy_en & ~ld3_l2cache_rq_kill;

// ld valid until fill occur.
dffre_s #(1)  ld3out_state (
        //.din    (ld3_l2cache_rq),
        .din    (ld3_l2cache_rq_tmp),
        .q      (ld3_unfilled_tmp),
        .rst    (ld3_fill_reset_d2),  .en     (ld3_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
dffre_s #(`L1D_WAY_WIDTH)  ld3out_state_way (
        .din    (lsu_lmq_pkt_way_w2[`L1D_WAY_MASK]),
        .q      (ld3_unfilled_wy[`L1D_WAY_MASK]),
        .rst    (ld3_fill_reset_d2),  .en     (ld3_unfilled_wy_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


assign	ld3_fill_reset_d2 = ld3_fill_reset_d2_tmp | ld3_l2cache_rq_kill ;
//assign	ld3_unfilled = ld3_unfilled_tmp & ~ld3_l2cache_rq_kill ;
assign	ld3_unfilled = ld3_unfilled_tmp;

// ld l2bank address
dffe_s  #(3) ld3_l2bnka (
        .din    ({non_l2bnk_mx3,ldst_va_mx3[7:6]}),
        .q      (ld3_l2bnk_addr[2:0]),
  .en (ld3_l2cache_rq),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//bug2705 - add byp for address to be available in w-cycle
//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2 if non_l2bnk_mx0=1 (non$ access)

wire  [2:0]  ld3_l2bnk_addr_mx ;
assign  ld3_l2bnk_addr_mx[2:0]  =  ld3_pkt_vld_unmasked ? ld3_l2bnk_addr[2:0] :
					{1'b0,ldst_va_mx3[7:6]} ; 

//assign  ld3_l2bnk_addr_mx[2:0]  =  (ld3_inst_vld_unflushed  & lsu_inst_vld_tmp) ? 
//					{1'b0,ldst_va_mx3[7:6]} : 
//					//{non_l2bnk_mx3,ldst_va_mx3[7:6]} : 
//						ld3_l2bnk_addr[2:0] ;

//7/21/03: timing fix - non_l2bnk_mx0 (uses tlb_pgnum_g[39:37] which arrives in qctl1 ~400ps)
//         this will cause timing paths in spec pick in w-cycle; hence assume $able access for
//         spec pick and kill pkt vld in w2
dff_s #(1) ff_non_l2bnk_mx3_d1 (
        .din    (non_l2bnk_mx3),
        .q      (non_l2bnk_mx3_d1),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );


//bug2705 - change ld3_l2bnk_addr[2:0] to ld3_l2bnk_addr_mx[2:0]
assign ld3_l2bnk_dest[0] = ~ld3_l2bnk_addr_mx[2] & ~ld3_l2bnk_addr_mx[1] & ~ld3_l2bnk_addr_mx[0] ;
assign ld3_l2bnk_dest[1] = ~ld3_l2bnk_addr_mx[2] & ~ld3_l2bnk_addr_mx[1] &  ld3_l2bnk_addr_mx[0] ;
assign ld3_l2bnk_dest[2] = ~ld3_l2bnk_addr_mx[2] &  ld3_l2bnk_addr_mx[1] & ~ld3_l2bnk_addr_mx[0] ;
assign ld3_l2bnk_dest[3] = ~ld3_l2bnk_addr_mx[2] &  ld3_l2bnk_addr_mx[1] &  ld3_l2bnk_addr_mx[0] ;
assign ld3_l2bnk_dest[4] =  ld3_l2bnk_addr_mx[2] ;

//=================================================================================================
//  LMQ Miscellaneous Control
//=================================================================================================

dff_s #(1) stgm_cas (
        .din    (ifu_lsu_casa_e),
        .q      (casa_m),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s  #(1) stgg_cas (
        .din    (casa_m),
        .q      (casa_g),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//assign  casa0_g = casa_g & thread0_g ;
//assign  casa1_g = casa_g & thread1_g ;
//assign  casa2_g = casa_g & thread2_g ;
//assign  casa3_g = casa_g & thread3_g ;

// PARTIAL RAW BYPASSING.

// Partial raw of load in stb. Even if the load hits in the dcache, it must follow
// the st to the pcx, obtain merged data to bypass to the pipeline. This load will 
// also fill the dcache. i.e., once the store is received it looks like a normal load.

// This path is also used for 2nd cas pkt. rs1(addr) and rs2(cmp data) are in 1st
// pkt which is written to stb. rd(swap value) is written to lmq as 2nd pkt. The
// 2nd pkt will wait in the lmq until the 1st pkt is sent.

// *** Atomics need to switch out the thread ***

// THREAD0

// timing fix: 9/15/03 - reduce loading on pcx_rq_for_stb[3:0] to stb_clt[0-3]. it had FO2 (stb_ctl,qdp2 - cap=0.5-0.8)
//             move the flop from qdp2 to qctl1

dff_s #(4)  ff_pcx_rq_for_stb_d1 (
        .din    (pcx_rq_for_stb[3:0]),
        .q      (pcx_rq_for_stb_d1[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dff_s #(4)  srqsel_d1 (
        .din    (pcx_rq_for_stb[3:0]),
        //.q      ({st3_pcx_rq_tmp, st2_pcx_rq_tmp,st1_pcx_rq_tmp, st0_pcx_rq_tmp}),
        .q      ({st3_pcx_rq_sel_d1, st2_pcx_rq_sel_d1,st1_pcx_rq_sel_d1, st0_pcx_rq_sel_d1}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dff_s #(4)  srqsel_d2 (
        .din      ({st3_pcx_rq_sel_d1, st2_pcx_rq_sel_d1,st1_pcx_rq_sel_d1, st0_pcx_rq_sel_d1}),
        .q      ({st3_pcx_rq_sel_d2, st2_pcx_rq_sel_d2,st1_pcx_rq_sel_d2, st0_pcx_rq_sel_d2}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dff_s #(4)  srqsel_d3 (
        .din    ({st3_pcx_rq_sel_d2, st2_pcx_rq_sel_d2,st1_pcx_rq_sel_d2, st0_pcx_rq_sel_d2}),
        .q      ({st3_pcx_rq_sel_d3, st2_pcx_rq_sel_d3,st1_pcx_rq_sel_d3, st0_pcx_rq_sel_d3}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

wire	ld0_ldbl_rawp_en_w2 ;
assign	ld0_ldbl_rawp_en_w2 = ld0_ldbl_rq_w2 & ~ld_rawp_st_ced_w2 & ~ld0_rawp_reset ;

/*assign	st3_pcx_rq_sel_d1 = st3_pcx_rq_tmp & ~pcx_req_squash ;
assign	st2_pcx_rq_sel_d1 = st2_pcx_rq_tmp & ~pcx_req_squash ;
assign	st1_pcx_rq_sel_d1 = st1_pcx_rq_tmp & ~pcx_req_squash ;
assign	st0_pcx_rq_sel_d1 = st0_pcx_rq_tmp & ~pcx_req_squash ;*/

assign ld0_rawp_reset =
        (reset | (st0_pcx_rq_sel_d3 & ~pcx_req_squash_d2 & ld0_rawp_disabled & (ld0_rawp_ackid[2:0] == stb0_crnt_ack_id[2:0])));
        //(reset | (st0_pcx_rq_sel_d2 & ~pcx_req_squash_d1 & ld0_rawp_disabled & (ld0_rawp_ackid[2:0] == stb0_crnt_ack_id[2:0])));

// TO BE REMOVED ALONG WITH defines !!!
//wire	ld_rawp_st_ced_g ;
//assign 	ld_rawp_st_ced_g = 1'b0 ;

// reset needs to be dominant in case ack comes on fly.
// atomics will not set rawp_disabled
assign ld0_rawp_en = 
        //(((ld_stb_partial_raw_g) & ~ld_rawp_st_ced_g & ~ld0_rawp_reset)     // partial_raw
        //& ~atomic_g & ld0_inst_vld_g) |          // cas inst - 2nd pkt
	ld0_ldbl_rawp_en_w2 ;

// ack-id and wait-for-ack disable - Thread 0
dffre_s #(1)  ldrawp0_dis (
        .din    (ld0_rawp_en),
        .q      (ld0_rawp_disabled),
        .rst    (ld0_rawp_reset),  .en     (ld0_rawp_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dffe_s #(3)  ldrawp0_ackid (
        .din    (ld_rawp_st_ackid_w2[2:0]),
        .q      (ld0_rawp_ackid[2:0]),
        .en     (ld0_inst_vld_w2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

// THREAD1

wire	ld1_ldbl_rawp_en_w2 ;
assign	ld1_ldbl_rawp_en_w2 = ld1_ldbl_rq_w2 & ~ld_rawp_st_ced_w2 & ~ld1_rawp_reset ;

// 1st st ack for st-quad will not cause ack.

assign ld1_rawp_reset =
        (reset | (st1_pcx_rq_sel_d3 & ~pcx_req_squash_d2 & ld1_rawp_disabled & 
        //(reset | (st1_pcx_rq_sel_d2 & ~pcx_req_squash_d1 & ld1_rawp_disabled & 
			(ld1_rawp_ackid[2:0] == stb1_crnt_ack_id[2:0])));

// reset needs to be dominant in case ack comes on fly.
// atomics will not set rawp_disabled
assign ld1_rawp_en = 
        //(((ld_stb_partial_raw_g) & ~ld_rawp_st_ced_g & ~ld1_rawp_reset) // partial raw
        //(((ld_stb_partial_raw_g | (ld_stb_full_raw_g & ldst_dbl_g)) & ~ld_rawp_st_ced_g & ~ld1_rawp_reset) // partial raw
        //& ~atomic_g  & ld1_inst_vld_g)  |                // cas inst - 2nd pkt
	ld1_ldbl_rawp_en_w2 ;

// ack-id and wait-for-ack disable - Thread 0
dffre_s #(1)  ldrawp1_dis (
        .din    (ld1_rawp_en),
        .q      (ld1_rawp_disabled),
        .rst    (ld1_rawp_reset),  .en     (ld1_rawp_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dffe_s #(3)  ldrawp1_ackid (
        .din    (ld_rawp_st_ackid_w2[2:0]),
        .q      (ld1_rawp_ackid[2:0]),
        .en     (ld1_inst_vld_w2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

// THREAD2

wire	ld2_ldbl_rawp_en_w2 ;
assign	ld2_ldbl_rawp_en_w2 = ld2_ldbl_rq_w2 & ~ld_rawp_st_ced_w2 & ~ld2_rawp_reset ;

assign ld2_rawp_reset =
        (reset | (st2_pcx_rq_sel_d3 & ~pcx_req_squash_d2 & ld2_rawp_disabled & 
        //(reset | (st2_pcx_rq_sel_d2 & ~pcx_req_squash_d1 & ld2_rawp_disabled & 
			(ld2_rawp_ackid[2:0] == stb2_crnt_ack_id[2:0])));

// reset needs to be dominant in case ack comes on fly.
// atomics will not set rawp_disabled
assign ld2_rawp_en = 
        //(((ld_stb_partial_raw_g) & ~ld_rawp_st_ced_g & ~ld2_rawp_reset) // partial raw
        //& ~atomic_g & ld2_inst_vld_g) |          // cas inst - 2nd pkt
	ld2_ldbl_rawp_en_w2 ;

// ack-id and wait-for-ack disable - Thread 0
dffre_s #(1)  ldrawp2_dis (
        .din    (ld2_rawp_en),
        .q      (ld2_rawp_disabled),
        .rst    (ld2_rawp_reset),  .en     (ld2_rawp_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dffe_s #(3)  ldrawp2_ackid (
        .din    (ld_rawp_st_ackid_w2[2:0]),
        .q      (ld2_rawp_ackid[2:0]),
        .en     (ld2_inst_vld_w2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

// THREAD3

wire	ld3_ldbl_rawp_en_w2 ;
assign	ld3_ldbl_rawp_en_w2 = ld3_ldbl_rq_w2 & ~ld_rawp_st_ced_w2 & ~ld3_rawp_reset ;

assign ld3_rawp_reset =
        (reset | (st3_pcx_rq_sel_d3 & ~pcx_req_squash_d2 & ld3_rawp_disabled & 
        //(reset | (st3_pcx_rq_sel_d2 & ~pcx_req_squash_d1 & ld3_rawp_disabled & 
				(ld3_rawp_ackid[2:0] == stb3_crnt_ack_id[2:0])));

// reset needs to be dominant in case ack comes on fly.
// atomics will not set rawp_disabled
assign ld3_rawp_en = 
        //(((ld_stb_partial_raw_g) & ~ld_rawp_st_ced_g & ~ld3_rawp_reset) // partial raw
        //& ~atomic_g & ld3_inst_vld_g) |          // cas inst - 2nd pkt
	ld3_ldbl_rawp_en_w2 ;

// ack-id and wait-for-ack disable - Thread 0
dffre_s #(1)  ldrawp3_dis (
        .din    (ld3_rawp_en),
        .q      (ld3_rawp_disabled),
        .rst    (ld3_rawp_reset),  .en     (ld3_rawp_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                

dffe_s #(3)  ldrawp3_ackid (
        .din    (ld_rawp_st_ackid_w2[2:0]),
        .q      (ld3_rawp_ackid[2:0]),
        .en     (ld3_inst_vld_w2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );                                



//=================================================================================================
//  INTERRUPT PCX PKT REQ CTL
//=================================================================================================

wire    intrpt_pcx_rq_sel_d2 ;
wire    intrpt_vld_reset;
wire    intrpt_vld_en ;
wire  [3:0] intrpt_thread ;
wire    intrpt_clr ;


assign  lsu_tlu_pcxpkt_ack = intrpt_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;

assign intrpt_vld_reset =
        reset | lsu_tlu_pcxpkt_ack ;
        //reset | (intrpt_pcx_rq_sel_d1 & ~pcx_req_squash);
wire    intrpt_pkt_vld_unmasked ;
// assumption is that pkt vld cannot be turned around in same cycle
assign intrpt_vld_en = ~intrpt_pkt_vld_unmasked ;
//assign intrpt_vld_en = ~lsu_intrpt_pkt_vld ;

dff_s #(1) intpkt_stgd2 (
        .din    (intrpt_pcx_rq_sel_d1),
        .q      (intrpt_pcx_rq_sel_d2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// intrpt valid
dffre_s  intrpt_vld (
        .din    (tlu_lsu_pcxpkt_vld),
        .q      (intrpt_pkt_vld_unmasked),
        .rst    (intrpt_vld_reset),     .en     (intrpt_vld_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign  intrpt_thread[0] = ~tlu_lsu_pcxpkt_tid[19] & ~tlu_lsu_pcxpkt_tid[18] ;
assign  intrpt_thread[1] = ~tlu_lsu_pcxpkt_tid[19] &  tlu_lsu_pcxpkt_tid[18] ;
assign  intrpt_thread[2] =  tlu_lsu_pcxpkt_tid[19] & ~tlu_lsu_pcxpkt_tid[18] ;
assign  intrpt_thread[3] =  tlu_lsu_pcxpkt_tid[19] &  tlu_lsu_pcxpkt_tid[18] ;

assign  intrpt_clr =
  (intrpt_thread[0] & lsu_stb_empty[0]) |
  (intrpt_thread[1] & lsu_stb_empty[1]) |
  (intrpt_thread[2] & lsu_stb_empty[2]) |
  (intrpt_thread[3] & lsu_stb_empty[3]) ;

wire	intrpt_clr_d1 ;
dff_s #(1) intclr_stgd1 (
        .din    (intrpt_clr),
        .q      (intrpt_clr_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	[3:0]	intrpt_cmplt ;

assign  intrpt_cmplt[0] = lsu_tlu_pcxpkt_ack & intrpt_thread[0] ;
assign  intrpt_cmplt[1] = lsu_tlu_pcxpkt_ack & intrpt_thread[1] ;
assign  intrpt_cmplt[2] = lsu_tlu_pcxpkt_ack & intrpt_thread[2] ;
assign  intrpt_cmplt[3] = lsu_tlu_pcxpkt_ack & intrpt_thread[3] ;

dff_s #(4) intrpt_stg (
        .din    (intrpt_cmplt[3:0]),
        .q      (lsu_intrpt_cmplt[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign  intrpt_pkt_vld =
intrpt_pkt_vld_unmasked & ~(intrpt_pcx_rq_sel_d1 | intrpt_pcx_rq_sel_d2) & intrpt_clr_d1 ;

// ** enabled flop should not be required !!
// intrpt l2bank address
// ?? Can interrupt requests go to io-bridge ??
// Using upper 3b of 5b thread field of INTR_W to address 4 l2 banks
dffe_s #(3) intrpt_l2bnka (
        .din    ({1'b0,tlu_lsu_pcxpkt_l2baddr[11:10]}),
        .q      (intrpt_l2bnk_addr[2:0]),
        .en     (intrpt_vld_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// IO Requests should not go to iobrdge.
assign intrpt_l2bnk_dest[0] =
~intrpt_l2bnk_addr[2] & ~intrpt_l2bnk_addr[1] & ~intrpt_l2bnk_addr[0] ;
assign intrpt_l2bnk_dest[1] =
~intrpt_l2bnk_addr[2] & ~intrpt_l2bnk_addr[1] &  intrpt_l2bnk_addr[0] ;
assign intrpt_l2bnk_dest[2] =
~intrpt_l2bnk_addr[2] & intrpt_l2bnk_addr[1] & ~intrpt_l2bnk_addr[0] ;
assign intrpt_l2bnk_dest[3] =
~intrpt_l2bnk_addr[2] & intrpt_l2bnk_addr[1] &  intrpt_l2bnk_addr[0] ;
assign intrpt_l2bnk_dest[4] = intrpt_l2bnk_addr[2] ;

//=================================================================================================
//
// QDP Specific Control
//
//=================================================================================================


// Qualify with thread.
// Write cas pckt 2 to lmq
// Timing Change : ld0_l2cache_rq guarantees validity.
//assign lmq_enable[0] = lsu_ld_miss_g & thread0_g ;
//assign lmq_enable[0] = ld0_inst_vld_g | pref_vld0_g ;

//assign lmq_enable[0] = (ld0_inst_vld_unflushed & lsu_inst_vld_w) | pref_vld0_g ;
//assign lmq_enable[1] = (ld1_inst_vld_unflushed & lsu_inst_vld_w) | pref_vld1_g ;
//assign lmq_enable[2] = (ld2_inst_vld_unflushed & lsu_inst_vld_w) | pref_vld2_g ;
//assign lmq_enable[3] = (ld3_inst_vld_unflushed & lsu_inst_vld_w) | pref_vld3_g ;

//bug 2771; timing path - remove flush-pipe, add ifu's flush signal
//assign lmq_enable[0] = (ld0_inst_vld_unflushed | pref_vld0_g) & lsu_inst_vld_w ;
assign lmq_enable[0] = (ld0_inst_vld_unflushed | pref_vld0_g) & lsu_inst_vld_tmp & ~ifu_lsu_flush_w ;
assign lmq_enable[1] = (ld1_inst_vld_unflushed | pref_vld1_g) & lsu_inst_vld_tmp & ~ifu_lsu_flush_w ;
assign lmq_enable[2] = (ld2_inst_vld_unflushed | pref_vld2_g) & lsu_inst_vld_tmp & ~ifu_lsu_flush_w ;
assign lmq_enable[3] = (ld3_inst_vld_unflushed | pref_vld3_g) & lsu_inst_vld_tmp & ~ifu_lsu_flush_w ; 
        
// timing fix: 5/19/03: move secondary hit way generation to w2
dff_s #(4) ff_lmq_enable_w2 (
        .din    (lmq_enable[3:0]),
        .q      (lmq_enable_w2[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


// needs to be 1-hot always.
assign imiss_pcx_mx_sel = imiss_pcx_rq_sel_d1 ;
//assign imiss_pcx_mx_sel[1] = strm_pcx_rq_sel_d1 ;
//assign imiss_pcx_mx_sel[2] = intrpt_pcx_rq_sel_d1 ;
//assign imiss_pcx_mx_sel[3] = fpop_pcx_rq_sel_d1 ;

//11/7/03: add rst_tri_en
wire  [2:0]  fwd_int_fp_pcx_mx_sel_tmp ;

assign fwd_int_fp_pcx_mx_sel_tmp[0]= ~fwd_int_fp_pcx_mx_sel[1] & ~fwd_int_fp_pcx_mx_sel[2];
assign fwd_int_fp_pcx_mx_sel_tmp[1]=  intrpt_pcx_rq_sel_d1 ;
assign fwd_int_fp_pcx_mx_sel_tmp[2]=  fpop_pcx_rq_sel_d1 | fpop_pcx_rq_sel_d2 ;

assign fwd_int_fp_pcx_mx_sel[1:0] = fwd_int_fp_pcx_mx_sel_tmp[1:0] & ~{2{rst_tri_en}} ;
assign fwd_int_fp_pcx_mx_sel[2]   = fwd_int_fp_pcx_mx_sel_tmp[2] | rst_tri_en ;


//*************************************************************************************************
// 			PCX REQUEST GENERATION (BEGIN)

//=================================================================================================
//  PCX REQUEST SELECTION CONTROL
//=================================================================================================

// LOAD
// fpops have to squash other rqs in the 2nd cycle also.
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign ld0_pcx_rq_vld = 
  (|(queue_write[4:0] & ld0_l2bnk_dest[4:0])) & 
    ld0_pkt_vld & ~ld0_rawp_disabled;
    //ld0_pkt_vld & ~ld0_rawp_disabled & ~mcycle_squash_d1;
    //ld0_pkt_vld & ~ld0_rawp_disabled & ~st_atom_rq_d1 ;
assign ld1_pcx_rq_vld = 
  (|(queue_write[4:0] & ld1_l2bnk_dest[4:0])) & 
    ld1_pkt_vld & ~ld1_rawp_disabled;
    //ld1_pkt_vld & ~ld1_rawp_disabled & ~mcycle_squash_d1;
    //ld1_pkt_vld & ~ld1_rawp_disabled & ~st_atom_rq_d1 ;
assign ld2_pcx_rq_vld = 
  (|(queue_write[4:0] & ld2_l2bnk_dest[4:0])) & 
    ld2_pkt_vld & ~ld2_rawp_disabled ;
    //ld2_pkt_vld & ~ld2_rawp_disabled & ~mcycle_squash_d1;
    //ld2_pkt_vld & ~ld2_rawp_disabled & ~st_atom_rq_d1 ;
assign ld3_pcx_rq_vld = 
  (|(queue_write[4:0] & ld3_l2bnk_dest[4:0])) & 
    ld3_pkt_vld & ~ld3_rawp_disabled;
    //ld3_pkt_vld & ~ld3_rawp_disabled & ~mcycle_squash_d1;
    //ld3_pkt_vld & ~ld3_rawp_disabled & ~st_atom_rq_d1 ;

//assign  ld_pcx_rq_vld = ld0_pcx_rq_vld | ld1_pcx_rq_vld 
//      | ld2_pcx_rq_vld | ld3_pcx_rq_vld ;

wire    st0_atomic_pend_d1, st1_atomic_pend_d1, st2_atomic_pend_d1, st3_atomic_pend_d1 ;

assign  st0_q_wr[4:0] = st0_atomic_pend_d1 ? pre_qwr[4:0] : queue_write[4:0] ;
assign  st1_q_wr[4:0] = st1_atomic_pend_d1 ? pre_qwr[4:0] : queue_write[4:0] ;
assign  st2_q_wr[4:0] = st2_atomic_pend_d1 ? pre_qwr[4:0] : queue_write[4:0] ;
assign  st3_q_wr[4:0] = st3_atomic_pend_d1 ? pre_qwr[4:0] : queue_write[4:0] ;

assign  st0_atom_rq = (st0_pcx_rq_sel & st0_atomic_vld) ; 
assign  st1_atom_rq = (st1_pcx_rq_sel & st1_atomic_vld) ;
assign  st2_atom_rq = (st2_pcx_rq_sel & st2_atomic_vld) ;
assign  st3_atom_rq = (st3_pcx_rq_sel & st3_atomic_vld) ;

dff_s #(8)  avlds_d1 (
        .din    ({st0_atom_rq,st1_atom_rq,st2_atom_rq,st3_atom_rq,
    st0_cas_vld,st1_cas_vld,st2_cas_vld,st3_cas_vld}),
        .q      ({st0_atom_rq_d1,st1_atom_rq_d1,st2_atom_rq_d1,st3_atom_rq_d1,
    st0_cas_vld_d1,st1_cas_vld_d1,st2_cas_vld_d1,st3_cas_vld_d1}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s #(8)  avlds_d2 (
        .din    ({st0_atom_rq_d1,st1_atom_rq_d1,st2_atom_rq_d1,st3_atom_rq_d1,
    st0_cas_vld_d1,st1_cas_vld_d1,st2_cas_vld_d1,st3_cas_vld_d1}),
        .q      ({st0_atom_rq_d2,st1_atom_rq_d2,st2_atom_rq_d2,st3_atom_rq_d2,
    st0_cas_vld_d2,st1_cas_vld_d2,st2_cas_vld_d2,st3_cas_vld_d2}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//timing fix : 7/28/03 - move the OR before flop
assign st_atom_rq = st0_atom_rq | st1_atom_rq | st2_atom_rq | st3_atom_rq ; 
//assign st_atom_rq_d1 = st0_atom_rq_d1 | st1_atom_rq_d1 | st2_atom_rq_d1 | st3_atom_rq_d1 ; 

// timing fix: 7/28/03 - move the OR before flop
dff_s #(1)  ff_st_atom_pq (
  .din (st_atom_rq),
  .q   (st_atom_rq_d1),
  .clk (clk),
  .se  (1'b0), .si (), .so ()
  );


assign st_cas_rq_d2 = 
  (st0_atom_rq_d2 & st0_cas_vld_d2)  | 
  (st1_atom_rq_d2 & st1_cas_vld_d2)  | 
  (st2_atom_rq_d2 & st2_cas_vld_d2)  | 
  (st3_atom_rq_d2 & st3_cas_vld_d2)  ; 
//assign st_quad_rq_d2 = 
//  (st0_atom_rq_d2 & ~st0_cas_vld_d2)  | 
//  (st1_atom_rq_d2 & ~st1_cas_vld_d2)  | 
//  (st2_atom_rq_d2 & ~st2_cas_vld_d2)  | 
//  (st3_atom_rq_d2 & ~st3_cas_vld_d2)  ; 

//timing fix: 9/17/03 - move the OR to previous cycle and add flop for spc_pcx_atom_pq
//                      instantiate buf30 for flop output
//assign  spc_pcx_atom_pq = 
//    st_atom_rq_d1 |  
//    fpop_atom_rq_pq ;

wire  spc_pcx_atom_w, spc_pcx_atom_pq_tmp ;
assign spc_pcx_atom_w  =  st_atom_rq | fpop_atom_req ;

dff_s #(1)  ff_spc_pcx_atom_pq (
  .din (spc_pcx_atom_w),
  .q   (spc_pcx_atom_pq_tmp),
  .clk (clk),
  .se  (1'b0), .si (), .so ()
  );

bw_u1_buf_30x UZfix_spc_pcx_atom_pq_buf1 ( .a(spc_pcx_atom_pq_tmp), .z(spc_pcx_atom_pq) );
bw_u1_buf_30x UZsize_spc_pcx_atom_pq_buf2 ( .a(spc_pcx_atom_pq_tmp), .z(spc_pcx_atom_pq_buf2) );

// STORE
// st will wait in pcx bypass until previous st in chain is acked !!!!
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign st0_pcx_rq_vld = 
  (|(st0_q_wr[4:0] & st0_l2bnk_dest[4:0])) & st0_pkt_vld ;
  //(|(st0_q_wr[4:0] & st0_l2bnk_dest[4:0])) & st0_pkt_vld & ~mcycle_squash_d1;
  //(|(st0_q_wr[4:0] & st0_l2bnk_dest[4:0])) & st0_pkt_vld & ~st_atom_rq_d1 ;
assign st1_pcx_rq_vld = 
  (|(st1_q_wr[4:0] & st1_l2bnk_dest[4:0])) & st1_pkt_vld ;
  //(|(st1_q_wr[4:0] & st1_l2bnk_dest[4:0])) & st1_pkt_vld & ~mcycle_squash_d1;
  //(|(st1_q_wr[4:0] & st1_l2bnk_dest[4:0])) & st1_pkt_vld & ~st_atom_rq_d1 ;
assign st2_pcx_rq_vld = 
  (|(st2_q_wr[4:0] & st2_l2bnk_dest[4:0])) & st2_pkt_vld ;
  //(|(st2_q_wr[4:0] & st2_l2bnk_dest[4:0])) & st2_pkt_vld & ~mcycle_squash_d1;
  //(|(st2_q_wr[4:0] & st2_l2bnk_dest[4:0])) & st2_pkt_vld & ~st_atom_rq_d1 ;
assign st3_pcx_rq_vld = 
  (|(st3_q_wr[4:0] & st3_l2bnk_dest[4:0])) & st3_pkt_vld ;
  //(|(st3_q_wr[4:0] & st3_l2bnk_dest[4:0])) & st3_pkt_vld & ~mcycle_squash_d1;
  //(|(st3_q_wr[4:0] & st3_l2bnk_dest[4:0])) & st3_pkt_vld & ~st_atom_rq_d1 ;

// IMISS
// imiss requests will not speculate - ** change !!!
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign imiss_pcx_rq_vld = 
  (|(queue_write[4:0] & imiss_l2bnk_dest[4:0])) & imiss_pkt_vld ;
  //(|(queue_write[4:0] & imiss_l2bnk_dest[4:0])) & imiss_pkt_vld & ~mcycle_squash_d1;
  //(|((queue_write[4:0] & (sel_qentry0[4:0] | (~sel_qentry0[4:0] & ~spc_pcx_req_update_w2[4:0]))) & imiss_l2bnk_dest[4:0])) & imiss_pkt_vld & ~mcycle_squash_d1;

// SPU
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign strm_pcx_rq_vld = 
  (|(queue_write[4:0] & strm_l2bnk_dest[4:0])) & strm_pkt_vld ;
  //(|(queue_write[4:0] & strm_l2bnk_dest[4:0])) & strm_pkt_vld & ~mcycle_squash_d1;

wire lsu_fwdpkt_vld_d1 ;
wire	[4:0]	fwdpkt_dest_d1 ;
// This delay is to compensate for the 1-cycle delay for internal rd/wr.
dff_s #(6)  fvld_stgd1 (
  .din ({lsu_fwdpkt_vld,lsu_fwdpkt_dest[4:0]}),
  .q   ({lsu_fwdpkt_vld_d1,fwdpkt_dest_d1[4:0]}),
  .clk (clk),
  .se  (1'b0), .si (), .so ()
  );

// FWD PKT
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign fwdpkt_rq_vld = 
  (|(queue_write[4:0] & fwdpkt_dest_d1[4:0])) & 
	lsu_fwdpkt_vld_d1 & 
	~(fwdpkt_pcx_rq_sel_d1 | fwdpkt_pcx_rq_sel_d2 |  // screen vld until reset can be sent.
	fwdpkt_pcx_rq_sel_d3) ;	// extra cycle since fwdpkt_vld is now flop delayed.
	//~mcycle_squash_d1;

// This to reset state. It must thus take into account speculative requests.
assign lsu_fwdpkt_pcx_rq_sel =  fwdpkt_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;

// INTERRUPT
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign intrpt_pcx_rq_vld = 
  (|(queue_write[4:0] & intrpt_l2bnk_dest[4:0])) & intrpt_pkt_vld ;
  //(|(queue_write[4:0] & intrpt_l2bnk_dest[4:0])) & intrpt_pkt_vld & ~mcycle_squash_d1;

// FFU
// fpop will never get squashed.
// ** Should be able to simplify equation.
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
//for fpop pre_qwr is good enough to qual 'cos there are no ld/st atomics to IOB
wire [4:0]  fpop_q_wr ;
assign fpop_pcx_rq_vld = 
  //sel_qentry0[4] & fpop_l2bnk_dest[4] & fpop_pkt_vld ;
  //(|(queue_write[4:0] & fpop_l2bnk_dest[4:0])) & 
  //(|(pre_qwr[4:0] & fpop_l2bnk_dest[4:0])) &
  (|(fpop_q_wr[4:0] & fpop_l2bnk_dest[4:0])) & 
	// change sel_qentry0[5] to sel_qentry0[4] for fpio merge
      fpop_pkt_vld ;
      //fpop_pkt_vld & ((sel_qentry0[4] & fpop_pkt1) | ~fpop_pkt1) ;
	//~mcycle_squash_d1 ;


//=================================================================================================
// HIERARCHICAL PICKER FOR PCX REQ GENERATION
//=================================================================================================

// 13 requests to choose from :
// - imiss, 4 ld, 4 st, (intrpt,strm,fpop,fwdpkt).
// - 4 categories are thus formed, each with equal weight.
// - As a consequence, imiss has the highest priority (because it is one vs. 4 in others)
// - Fair scheduling thru round-robin is ensured between and within categories.
// - Starvation for 2-cycle b2b ops (cas/fpop) is prevented.
// - strm requests, even though they lie in the misc category, will get good 
// thruput as the other misc requests will be infrequent.

// LEVEL ONE - PICK WITHIN CATEGORIES

// Note : picker defaults to 1-hot.

wire	[3:0]	all_pcx_rq_pick ;
wire	[3:0]	ld_events_raw ;
//wire	[3:0]	ld_events_final ;
wire	ld3_pcx_rq_pick,ld2_pcx_rq_pick,ld1_pcx_rq_pick,ld0_pcx_rq_pick ;

//bug6807 - kill load events raw when partial raw is detected.
assign ld_events_raw[0]  =  (ld0_pkt_vld_unmasked & ~ld0_rawp_disabled) | ld0_pcx_rq_sel_d1 | ld0_pcx_rq_sel_d2 ;
assign ld_events_raw[1]  =  (ld1_pkt_vld_unmasked & ~ld1_rawp_disabled) | ld1_pcx_rq_sel_d1 | ld1_pcx_rq_sel_d2 ;
assign ld_events_raw[2]  =  (ld2_pkt_vld_unmasked & ~ld2_rawp_disabled) | ld2_pcx_rq_sel_d1 | ld2_pcx_rq_sel_d2 ;
assign ld_events_raw[3]  =  (ld3_pkt_vld_unmasked & ~ld3_rawp_disabled) | ld3_pcx_rq_sel_d1 | ld3_pcx_rq_sel_d2 ;

//bug4814 - change rrobin_picker1 to rrobin_picker2
// Choose one among 4 loads.
//lsu_rrobin_picker1 ld4_rrobin  (
//    .events   	  ({ld3_pcx_rq_vld,ld2_pcx_rq_vld,
//		    ld1_pcx_rq_vld,ld0_pcx_rq_vld}),
//    .events_raw   ({ld3_pkt_vld_unmasked,ld2_pkt_vld_unmasked,
//		    ld1_pkt_vld_unmasked,ld0_pkt_vld_unmasked}),
//    .pick_one_hot ({ld3_pcx_rq_pick,ld2_pcx_rq_pick,
//		    ld1_pcx_rq_pick,ld0_pcx_rq_pick}),
//    .events_final (ld_events_final[3:0]),
//    .rclk         (rclk),
//    .grst_l       (grst_l),
//    .arst_l       (arst_l),
//    .si(),
//    .se(se),
//    .so()
//  );

lsu_rrobin_picker2 ld4_rrobin  (
    .events   	  ({ld3_pcx_rq_vld,ld2_pcx_rq_vld,ld1_pcx_rq_vld,ld0_pcx_rq_vld}),
    .thread_force (ld_thrd_force_vld[3:0]),
    .pick_one_hot ({ld3_pcx_rq_pick,ld2_pcx_rq_pick,ld1_pcx_rq_pick,ld0_pcx_rq_pick}),
    .events_picked({ld3_pcx_rq_sel,ld2_pcx_rq_sel,ld1_pcx_rq_sel,ld0_pcx_rq_sel}),
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so()
  );




//timing fix: 05/20/03 - move mcycle_squash_d1 after pick instead of before pick
//assign	ld3_pcx_rq_sel = ld3_pcx_rq_pick & ld3_pcx_rq_vld & all_pcx_rq_pick[1] ;
//assign	ld2_pcx_rq_sel = ld2_pcx_rq_pick & ld2_pcx_rq_vld & all_pcx_rq_pick[1] ;
//assign	ld1_pcx_rq_sel = ld1_pcx_rq_pick & ld1_pcx_rq_vld & all_pcx_rq_pick[1] ;
//assign	ld0_pcx_rq_sel = ld0_pcx_rq_pick & ld0_pcx_rq_vld & all_pcx_rq_pick[1] ;
//bug2705 - add spec valid qualification
//assign	ld3_pcx_rq_sel = ld3_pcx_rq_pick & ld3_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
//timing fix: 08/06/03 - tag_rdata->gen tag_parity_err->lsu_ld_miss_g arrives @625 in qctl1
//                       cache_way_hit ->lsu_ld_miss_g arrives @525 in qctl1
//                       cache_way_hit ->lsu_way_hit_or arrives @510 in qctl1
//                       625ps + ld?_l2cache_rq_g (130ps) + urq_stgpq flop logic(100ps) (slack=-100ps)
//assign  ld0_spec_pick_vld_g  =   ld0_spec_vld_g & ld0_l2cache_rq_g & ld0_pcx_rq_pick & ld0_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
wire    ld0_nspec_pick_vld ,
        ld1_nspec_pick_vld ,
        ld2_nspec_pick_vld ,
        ld3_nspec_pick_vld ;

assign  ld0_spec_pick_vld_g  =   ld0_spec_vld_g & ~lsu_way_hit_or & ld0_pcx_rq_pick & ld0_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
assign  ld0_nspec_pick_vld   =  ~ld0_spec_vld_g &                   ld0_pcx_rq_pick & ld0_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;

assign  ld1_spec_pick_vld_g  =   ld1_spec_vld_g & ~lsu_way_hit_or & ld1_pcx_rq_pick & ld1_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
assign  ld1_nspec_pick_vld   =  ~ld1_spec_vld_g &                   ld1_pcx_rq_pick & ld1_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;

assign  ld2_spec_pick_vld_g  =   ld2_spec_vld_g & ~lsu_way_hit_or & ld2_pcx_rq_pick & ld2_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
assign  ld2_nspec_pick_vld   =  ~ld2_spec_vld_g &                   ld2_pcx_rq_pick & ld2_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;

assign  ld3_spec_pick_vld_g  =   ld3_spec_vld_g & ~lsu_way_hit_or & ld3_pcx_rq_pick & ld3_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;
assign  ld3_nspec_pick_vld   =  ~ld3_spec_vld_g &                   ld3_pcx_rq_pick & ld3_pcx_rq_vld & all_pcx_rq_pick[1] & ~mcycle_squash_d1 ;


assign	ld0_pcx_rq_sel = (ld0_spec_pick_vld_g | ld0_nspec_pick_vld) ;
assign	ld1_pcx_rq_sel = (ld1_spec_pick_vld_g | ld1_nspec_pick_vld) ;
assign	ld2_pcx_rq_sel = (ld2_spec_pick_vld_g | ld2_nspec_pick_vld) ;
assign	ld3_pcx_rq_sel = (ld3_spec_pick_vld_g | ld3_nspec_pick_vld) ;

//bug3506: set mask in the level1 pick in w3-cycle if picked by pcx
//assign  ld_events_final[3] = ld3_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  ld_events_final[2] = ld2_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  ld_events_final[1] = ld1_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  ld_events_final[0] = ld0_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;



wire	st3_pcx_rq_pick,st2_pcx_rq_pick,st1_pcx_rq_pick,st0_pcx_rq_pick ;

// Choose one among 4 st.

wire   pcx_rq_for_stb_en;
//wire [3:0]  st_events_final ;
wire [3:0]  st_events_raw ;

//8/20/03: bug3506 fix is incomplete - vld may not be held until d2 cycle
assign st_events_raw[0]  =  stb0_rd_for_pcx | st0_pcx_rq_sel_d1 | st0_pcx_rq_sel_d2 ;
assign st_events_raw[1]  =  stb1_rd_for_pcx | st1_pcx_rq_sel_d1 | st1_pcx_rq_sel_d2 ;
assign st_events_raw[2]  =  stb2_rd_for_pcx | st2_pcx_rq_sel_d1 | st2_pcx_rq_sel_d2 ;
assign st_events_raw[3]  =  stb3_rd_for_pcx | st3_pcx_rq_sel_d1 | st3_pcx_rq_sel_d2 ;

//bug4814 - change rrobin_picker1 to rrobin_picker2
//lsu_rrobin_picker1 st4_rrobin  (
//    .events   	  ({st3_pcx_rq_vld,st2_pcx_rq_vld,
//		                st1_pcx_rq_vld,st0_pcx_rq_vld}),
//    .events_raw	  (st_events_raw[3:0]),
//    .pick_one_hot ({st3_pcx_rq_pick,st2_pcx_rq_pick,
//		                st1_pcx_rq_pick,st0_pcx_rq_pick}),
//    //.en           (pcx_rq_for_stb_en),                                                                
//    .events_final (st_events_final[3:0]),
//    .rclk         (rclk),
//    .grst_l       (grst_l),
//    .arst_l       (arst_l),
//    .si(),
//    .se(se),
//    .so()
//
//  );

lsu_rrobin_picker2 st4_rrobin  (
    .events   	  ({st3_pcx_rq_vld,st2_pcx_rq_vld,st1_pcx_rq_vld,st0_pcx_rq_vld}),
    .thread_force(st_thrd_force_vld[3:0]),
    .pick_one_hot ({st3_pcx_rq_pick,st2_pcx_rq_pick,st1_pcx_rq_pick,st0_pcx_rq_pick}),

    .events_picked(pcx_rq_for_stb[3:0]),
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so()
  );



assign lsu_st_pcx_rq_pick[3:0]  =  {st3_pcx_rq_pick,st2_pcx_rq_pick,st1_pcx_rq_pick,st0_pcx_rq_pick};
//timing fix: 9/2/03 - reduce fanout in stb_rwctl for lsu_st_pcx_rq_pick - gen separate signal for
//                     stb_cam_rptr_vld and stb_data_rptr_vld
assign lsu_st_pcx_rq_vld  =  st0_pcx_rq_vld | st1_pcx_rq_vld | st2_pcx_rq_vld | st3_pcx_rq_vld ;

//wire        st0_pcx_rq_sel_tmp, st1_pcx_rq_sel_tmp;
//wire        st2_pcx_rq_sel_tmp, st3_pcx_rq_sel_tmp;
   

   wire stb_cam_hit_w;

//bug3503
assign stb_cam_hit_w  =  stb_cam_hit_bf & lsu_inst_vld_w ;

dff_s #(1)  stb_cam_hit_stg_w2  (
  .din (stb_cam_hit_w),
  .q   (stb_cam_hit_w2),
  .clk (clk),
  .se  (1'b0), .si (), .so ()
  );


//RAW read STB at W3 (not W2), so stb_cam_hit_w2 isn't critical   
//assign pcx_rq_for_stb_en = ~(|lsu_st_ack_rq_stb[3:0]) &   ~stb_cam_hit_w2 & ~stb_cam_wptr_vld;
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
assign pcx_rq_for_stb_en = ~stb_cam_hit_w2 & ~stb_cam_wr_no_ivld_m & ~mcycle_squash_d1 ;

//timing fix : 5/6 - move kill_w2 after store pick
//assign	pcx_rq_for_stb[3] = st3_pcx_rq_pick & st3_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en;
//assign	pcx_rq_for_stb[2] = st2_pcx_rq_pick & st2_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en;
//assign	pcx_rq_for_stb[1] = st1_pcx_rq_pick & st1_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en;
//assign	pcx_rq_for_stb[0] = st0_pcx_rq_pick & st0_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en;

//timing fix: 05/20/03 - move mcycle_squash_d1 after pick instead of before pick
//bug4513 - kill pcx_rq_for_stb if atomic request is picked and 2 entries to the l2bank are not available

wire  [3:0]  pcx_rq_for_stb_tmp ;
wire   st0_qmon_2entry_avail,st1_qmon_2entry_avail,st2_qmon_2entry_avail,st3_qmon_2entry_avail ;

assign	pcx_rq_for_stb_tmp[3] =
        st3_pcx_rq_pick & st3_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[3] & ~mcycle_squash_d1 ;
        //st3_pcx_rq_pick & st3_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[3];

assign	pcx_rq_for_stb_tmp[2] =
        st2_pcx_rq_pick & st2_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[2] & ~mcycle_squash_d1 ;
        //st2_pcx_rq_pick & st2_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[2];

assign	pcx_rq_for_stb_tmp[1] =
        st1_pcx_rq_pick & st1_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[1] & ~mcycle_squash_d1 ;
        //st1_pcx_rq_pick & st1_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[1];

assign	pcx_rq_for_stb_tmp[0] = 
        st0_pcx_rq_pick & st0_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[0] & ~mcycle_squash_d1 ;
        //st0_pcx_rq_pick & st0_pcx_rq_vld & all_pcx_rq_pick[2] & pcx_rq_for_stb_en & ~lsu_st_pcx_rq_kill_w2[0];

//bug4513 - kill pcx_rq_for_stb if atomic request is picked and 2 entries to the l2bank are not available
assign	pcx_rq_for_stb[3] = ((st3_atomic_vld & st3_qmon_2entry_avail) | ~st3_atomic_vld) & pcx_rq_for_stb_tmp[3] ;
assign	pcx_rq_for_stb[2] = ((st2_atomic_vld & st2_qmon_2entry_avail) | ~st2_atomic_vld) & pcx_rq_for_stb_tmp[2] ;
assign	pcx_rq_for_stb[1] = ((st1_atomic_vld & st1_qmon_2entry_avail) | ~st1_atomic_vld) & pcx_rq_for_stb_tmp[1] ;
assign	pcx_rq_for_stb[0] = ((st0_atomic_vld & st0_qmon_2entry_avail) | ~st0_atomic_vld) & pcx_rq_for_stb_tmp[0] ;

//assign	st3_pcx_rq_sel_tmp = st3_pcx_rq_pick & st3_pcx_rq_vld & all_pcx_rq_pick[2] ;
//assign	st2_pcx_rq_sel_tmp = st2_pcx_rq_pick & st2_pcx_rq_vld & all_pcx_rq_pick[2] ;
//assign	st1_pcx_rq_sel_tmp = st1_pcx_rq_pick & st1_pcx_rq_vld & all_pcx_rq_pick[2] ;
//assign	st0_pcx_rq_sel_tmp = st0_pcx_rq_pick & st0_pcx_rq_vld & all_pcx_rq_pick[2] ;

//bug3506: set mask in the level1 pick in w3-cycle if picked by pcx
//assign  st_events_final[3] = st3_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  st_events_final[2] = st2_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  st_events_final[1] = st1_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;
//assign  st_events_final[0] = st0_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;



wire	strm_pcx_rq_pick,fpop_pcx_rq_pick,intrpt_pcx_rq_pick,fwdpkt_pcx_rq_pick;
//wire [3:0]  misc_events_final ;
wire [3:0]  misc_events_raw ;

//8/20/03: bug3506 fix is incomplete - vld may not be held until d2 cycle
assign  misc_events_raw[0]   =  lsu_fwdpkt_vld_d1 | fwdpkt_pcx_rq_sel_d1 | fwdpkt_pcx_rq_sel_d2 ;
//bug6807 - kill interrupt events raw when store buffer is not empty i.e. interrupt clear=0
assign  misc_events_raw[1]   =  (intrpt_pkt_vld_unmasked & intrpt_clr_d1) | intrpt_pcx_rq_sel_d1 | intrpt_pcx_rq_sel_d2 ;
assign  misc_events_raw[2]   =  fpop_pkt_vld_unmasked | fpop_pcx_rq_sel_d1 | fpop_pcx_rq_sel_d2 ;
assign  misc_events_raw[3]   =  strm_pkt_vld_unmasked | strm_pcx_rq_sel_d1 | strm_pcx_rq_sel_d2 ;


//bug4814 - change rrobin_picker1 to rrobin_picker2
//lsu_rrobin_picker1 misc4_rrobin  (
//    .events   	  ({strm_pcx_rq_vld,fpop_pcx_rq_vld,
//		    intrpt_pcx_rq_vld,fwdpkt_rq_vld}),
//    .events_raw   (misc_events_raw[3:0]),
//    .pick_one_hot ({strm_pcx_rq_pick,fpop_pcx_rq_pick,
//		    intrpt_pcx_rq_pick,fwdpkt_pcx_rq_pick}),
//    .events_final (misc_events_final[3:0]),
//    .rclk         (rclk),
//    .grst_l       (grst_l),
//    .arst_l       (arst_l),
//    .si(),
//    .se(se),
//    .so()
//  );

lsu_rrobin_picker2 misc4_rrobin  (
    .events   	  ({strm_pcx_rq_vld,fpop_pcx_rq_vld,intrpt_pcx_rq_vld,fwdpkt_rq_vld}),
    .thread_force(misc_thrd_force_vld[3:0]),
    .pick_one_hot ({strm_pcx_rq_pick,fpop_pcx_rq_pick,intrpt_pcx_rq_pick,fwdpkt_pcx_rq_pick}),

    .events_picked({strm_pcx_rq_sel,fpop_pcx_rq_sel,intrpt_pcx_rq_sel,fwdpkt_pcx_rq_sel}),
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so()
  );


//timing fix: 05/20/03 - move mcycle_squash_d1 after pick instead of before pick
//assign	strm_pcx_rq_sel = strm_pcx_rq_pick & strm_pcx_rq_vld & all_pcx_rq_pick[3] ;
//assign	fpop_pcx_rq_sel = fpop_pcx_rq_pick & fpop_pcx_rq_vld & all_pcx_rq_pick[3] ;
//assign	intrpt_pcx_rq_sel = intrpt_pcx_rq_pick & intrpt_pcx_rq_vld & all_pcx_rq_pick[3] ;
//assign	fwdpkt_pcx_rq_sel = fwdpkt_pcx_rq_pick & fwdpkt_rq_vld & all_pcx_rq_pick[3] ;
assign	strm_pcx_rq_sel = strm_pcx_rq_pick & strm_pcx_rq_vld & all_pcx_rq_pick[3] & ~mcycle_squash_d1 ;

//11/15/03 - change fpop atomic to be same as store atomic (bug4513)
//assign	fpop_pcx_rq_sel = fpop_pcx_rq_pick & fpop_pcx_rq_vld & all_pcx_rq_pick[3] & ~mcycle_squash_d1 ;
wire    fpop_qmon_2entry_avail ;
assign	fpop_pcx_rq_sel_tmp = fpop_pcx_rq_pick & fpop_pcx_rq_vld & all_pcx_rq_pick[3] & ~mcycle_squash_d1 ;
assign	fpop_pcx_rq_sel = fpop_pcx_rq_sel_tmp & fpop_qmon_2entry_avail ;

assign	intrpt_pcx_rq_sel = intrpt_pcx_rq_pick & intrpt_pcx_rq_vld & all_pcx_rq_pick[3] & ~mcycle_squash_d1 ;
assign	fwdpkt_pcx_rq_sel = fwdpkt_pcx_rq_pick & fwdpkt_rq_vld & all_pcx_rq_pick[3] & ~mcycle_squash_d1 ;


//bug3506: set mask in the level1 pick in w3-cycle if picked by pcx
//assign  misc_events_final[3] = lsu_spu_ldst_ack ;
//assign  misc_events_final[2] = lsu_tlu_pcxpkt_ack ;
//assign  misc_events_final[1] = lsu_fwdpkt_pcx_rq_sel ;
//assign  misc_events_final[0] = fpop_pcx_rq_sel_d2 & ~pcx_req_squash_d1 ;




// LEVEL TWO - PICK AMONG CATEGORIES
// In parallel with level one

wire	ld_pcx_rq_all, st_pcx_rq_all, misc_pcx_rq_all ;
assign	ld_pcx_rq_all = ld3_pcx_rq_vld | ld2_pcx_rq_vld | ld1_pcx_rq_vld | ld0_pcx_rq_vld ;	
assign	st_pcx_rq_all = st3_pcx_rq_vld | st2_pcx_rq_vld | st1_pcx_rq_vld | st0_pcx_rq_vld ; 
assign	misc_pcx_rq_all = strm_pcx_rq_vld | fpop_pcx_rq_vld | intrpt_pcx_rq_vld | fwdpkt_rq_vld ;

//bug3506- raw valid used in resetting pick status
//8/20/03: bug3506 fix is incomplete - vld may not be held until d2 cycle

//wire all4_rrobin_en;
//timing fix: 5/20/03 - pcx_rq_for_stb will be independent of ifu_lsu_pcxreq_d
//assign all4_rrobin_en = ~(all_pcx_rq_pick[2] & ~pcx_rq_for_stb_en) ;
//timing fix: 05/20/03 - move mycle_squash_d1 after pick instead of before pick
//assign all4_rrobin_en = ~((all_pcx_rq_pick[2] & ~pcx_rq_for_stb_en) | imiss_pcx_rq_vld );
//bug3348 - setting history moved from w-stage to w3-stage(1-cycle after spc_pcx_req_pq)
//          and hence there are no cases to disable logging of history
//assign all4_rrobin_en = ~((all_pcx_rq_pick[2] & ~pcx_rq_for_stb_en) | imiss_pcx_rq_vld | mcycle_squash_d1);
//wire   spc_pcx_req_vld_pq1 ;
//assign all4_rrobin_en =  spc_pcx_req_vld_pq1 ;
 
//wire  [3:1]  all_pcx_rq_pick_no_iqual;
wire  [3:0]  all_pcx_rq_pick_no_iqual;  
//wire  [3:0]  all_pcx_pick_status_d2;  // bug 3348
//wire  [3:0]  all_pick_status_rst_d2;    //bug 3506
wire  [3:0]  all_pick_status_set;

//bug3506: set pick status in the same cycle
assign  all_pick_status_set[3]  =  |{ strm_pcx_rq_sel, intrpt_pcx_rq_sel,fpop_pcx_rq_sel, fwdpkt_pcx_rq_sel} ;
assign  all_pick_status_set[2]  =  |pcx_rq_for_stb[3:0] ;
assign  all_pick_status_set[1]  =  |{ld0_pcx_rq_sel,ld1_pcx_rq_sel,ld2_pcx_rq_sel,ld3_pcx_rq_sel} ;
assign  all_pick_status_set[0]  =  1'b0 ;



lsu_rrobin_picker2 all4_rrobin  (
    .events   	  ({misc_pcx_rq_all,st_pcx_rq_all,ld_pcx_rq_all,1'b0}),
    .thread_force(all_thrd_force_vld[3:0]),
    .pick_one_hot (all_pcx_rq_pick_no_iqual[3:0]),

    .events_picked(all_pick_status_set[3:0]),
    //.en           (all4_rrobin_en),      // bug 3348
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so()
  );


// 5/22/03: cmp1_regr fail - qual all pick w/  ~mcycle_squash_d1; not doing this causes multi-hot select to
//          pcx_pkt mux
assign all_pcx_rq_pick[0]    =  imiss_pcx_rq_vld & ~mcycle_squash_d1;
assign all_pcx_rq_pick[3:1]  =  all_pcx_rq_pick_no_iqual[3:1] & ~{3{imiss_pcx_rq_vld | mcycle_squash_d1}};

wire   all_pcx_rq_dest_sel3 ;
assign all_pcx_rq_dest_sel3  =  ~|all_pcx_rq_pick[2:0];

//timing fix: 5/20/03 - pcx_rq_for_stb will be independent of ifu_lsu_pcxreq_d
//assign	imiss_pcx_rq_sel = imiss_pcx_rq_vld & all_pcx_rq_pick[0] ;
//timing fix: 05/20/03 - move mcycle_squash_d1 after pick instead of before pick
//assign	imiss_pcx_rq_sel = imiss_pcx_rq_vld;
assign	imiss_pcx_rq_sel = imiss_pcx_rq_vld & ~mcycle_squash_d1 ;

//=================================================================================================

// Select appr. load. Need a scheme which allows threads to
// make fwd progress.
/*assign  ld0_pcx_rq_sel = ld0_pcx_rq_vld ;
assign  ld1_pcx_rq_sel = ld1_pcx_rq_vld & ~ld0_pcx_rq_vld ;
assign  ld2_pcx_rq_sel = ld2_pcx_rq_vld & ~(ld0_pcx_rq_vld | ld1_pcx_rq_vld);
assign  ld3_pcx_rq_sel = ld3_pcx_rq_vld & ~(ld0_pcx_rq_vld | ld1_pcx_rq_vld | ld2_pcx_rq_vld)   ; */

dff_s #(4)  lrsel_stgd1 (
        .din    ({ld0_pcx_rq_sel, ld1_pcx_rq_sel, ld2_pcx_rq_sel, ld3_pcx_rq_sel}),
        .q      ({ld0_pcx_rq_sel_d1, ld1_pcx_rq_sel_d1, ld2_pcx_rq_sel_d1, ld3_pcx_rq_sel_d1}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//bug2705- kill pcx pick if spec vld kill is set
assign  lsu_ld0_pcx_rq_sel_d1  =  ld0_pcx_rq_sel_d1 & ~lsu_ld0_spec_vld_kill_w2 ;
assign  lsu_ld1_pcx_rq_sel_d1  =  ld1_pcx_rq_sel_d1 & ~lsu_ld1_spec_vld_kill_w2 ;
assign  lsu_ld2_pcx_rq_sel_d1  =  ld2_pcx_rq_sel_d1 & ~lsu_ld2_spec_vld_kill_w2 ;
assign  lsu_ld3_pcx_rq_sel_d1  =  ld3_pcx_rq_sel_d1 & ~lsu_ld3_spec_vld_kill_w2 ;


dff_s #(4)  lrsel_stgd2 (
        .din    ({lsu_ld0_pcx_rq_sel_d1, lsu_ld1_pcx_rq_sel_d1, lsu_ld2_pcx_rq_sel_d1, lsu_ld3_pcx_rq_sel_d1}),
        .q      ({ld0_pcx_rq_sel_d2, ld1_pcx_rq_sel_d2, ld2_pcx_rq_sel_d2, ld3_pcx_rq_sel_d2}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

// Used to complete prefetch. Be careful ! ld could be squashed. Add pcx_req_squash.
assign	lsu_ld_pcx_rq_sel_d2[3] = ld3_pcx_rq_sel_d2 ;
assign	lsu_ld_pcx_rq_sel_d2[2] = ld2_pcx_rq_sel_d2 ;
assign	lsu_ld_pcx_rq_sel_d2[1] = ld1_pcx_rq_sel_d2 ;
assign	lsu_ld_pcx_rq_sel_d2[0] = ld0_pcx_rq_sel_d2 ;

//bug2705- kill pcx pick if spec vld kill is set
wire	ld_pcxpkt_vld ;
assign  ld_pcxpkt_vld = 
  lsu_ld0_pcx_rq_sel_d1 | lsu_ld1_pcx_rq_sel_d1 | lsu_ld2_pcx_rq_sel_d1 | lsu_ld3_pcx_rq_sel_d1 ;
  //ld0_pcx_rq_sel_d1 | ld1_pcx_rq_sel_d1 | ld2_pcx_rq_sel_d1 | ld3_pcx_rq_sel_d1 ;

dff_s #(1)  icindx_stgd1 (
        .din    (ld_pcxpkt_vld), 
	.q  	(lsu_ifu_ld_pcxpkt_vld),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

wire  [3:0]           ld_pcx_rq_sel ;	

assign  ld_pcx_rq_sel[0] =  ld0_pcx_rq_sel_d1 | st0_atom_rq_d2 ;
assign  ld_pcx_rq_sel[1] =  ld1_pcx_rq_sel_d1 | st1_atom_rq_d2 ;
assign  ld_pcx_rq_sel[2] =  ld2_pcx_rq_sel_d1 | st2_atom_rq_d2 ;
assign  ld_pcx_rq_sel[3] =  ld3_pcx_rq_sel_d1 | st3_atom_rq_d2 ;

//11/7/03: add rst_tri_en
assign  lsu_ld_pcx_rq_mxsel[2:0]  =    ld_pcx_rq_sel[2:0] & {3{~rst_tri_en}} ;
assign  lsu_ld_pcx_rq_mxsel[3]    =  (~|ld_pcx_rq_sel[2:0]) | rst_tri_en ;

assign ld_pcx_thrd[0] = ld_pcx_rq_sel[1] | ld_pcx_rq_sel[3] ;
assign ld_pcx_thrd[1] = ld_pcx_rq_sel[2] | ld_pcx_rq_sel[3] ;
   
// Assume a simple priority based scheme for now.
// This should not be prioritized at this point. 
//assign st_pcx_rq_mhot_sel[0] = st0_pcx_rq_sel_tmp ;
//assign st_pcx_rq_mhot_sel[1] = st1_pcx_rq_sel_tmp ;
//assign st_pcx_rq_mhot_sel[2] = st2_pcx_rq_sel_tmp ;
//assign st_pcx_rq_mhot_sel[3] = st3_pcx_rq_sel_tmp ;
   
/*assign st_pcx_rq_mhot_sel[0] = 
  ~ld_pcx_rq_vld  & st0_pcx_rq_vld ;
assign st_pcx_rq_mhot_sel[1] = 
  ~ld_pcx_rq_vld  & st1_pcx_rq_vld ;
assign st_pcx_rq_mhot_sel[2] = 
  ~ld_pcx_rq_vld  & st2_pcx_rq_vld ;
assign st_pcx_rq_mhot_sel[3] = 
  ~ld_pcx_rq_vld  & st3_pcx_rq_vld ;*/

   
assign  st0_pcx_rq_sel = pcx_rq_for_stb[0] ;
assign  st1_pcx_rq_sel = pcx_rq_for_stb[1] ;
assign  st2_pcx_rq_sel = pcx_rq_for_stb[2] ;
assign  st3_pcx_rq_sel = pcx_rq_for_stb[3] ;

//assign  st_pcx_rq_vld =  (|pcx_rq_for_stb[3:0]);

// Temporary.
//assign  st0_pcx_rq_sel = stb_rd_for_pcx_sel[0] ;
//assign  st1_pcx_rq_sel = stb_rd_for_pcx_sel[1] ;
//assign  st2_pcx_rq_sel = stb_rd_for_pcx_sel[2] ;
//assign  st3_pcx_rq_sel = stb_rd_for_pcx_sel[3] ;

// This will be on a critical path. Massage !!!
// Allows for speculative requests.
//assign  st_pcx_rq_vld = 
//    (st0_pcx_rq_sel & stb_rd_for_pcx_sel[0]) | 
//    (st1_pcx_rq_sel & stb_rd_for_pcx_sel[1]) | 
//    (st2_pcx_rq_sel & stb_rd_for_pcx_sel[2]) | 
//    (st3_pcx_rq_sel & stb_rd_for_pcx_sel[3])  ;


   
/*assign imiss_pcx_rq_sel = 
  imiss_pcx_rq_vld & ~(ld_pcx_rq_vld | st_pcx_rq_vld) ;
assign strm_pcx_rq_sel = 
  strm_pcx_rq_vld & ~(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_sel) ;
assign fpop_pcx_rq_sel = 
  fpop_pcx_rq_vld & ~(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_vld | strm_pcx_rq_vld) ;
assign intrpt_pcx_rq_sel = 
  intrpt_pcx_rq_vld & ~(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_vld | strm_pcx_rq_vld | fpop_pcx_rq_sel) ;
assign fwdpkt_pcx_rq_sel = 
  fwdpkt_rq_vld & ~(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_vld | strm_pcx_rq_vld | intrpt_pcx_rq_vld 
                        | fpop_pcx_rq_sel) ; */


//assign imiss_strm_pcx_rq_sel = imiss_pcx_rq_sel | strm_pcx_rq_sel ;

// request was made with the queues full but not grant. 
assign  pcx_req_squash = 
  (|(spc_pcx_req_pq_buf2[4:0] & ~pre_qwr[4:0] & ~pcx_spc_grant_px[4:0])) ;
//(|(spc_pcx_req_pq[4:0] & ~queue_write[4:0] & ~pcx_spc_grant_px[4:0])) ;
//  (|lsu_error_rst[3:0]) | // dtag parity error requires two ld pkts
//  (st_atom_rq_d1) ; // cas,stq - 2 pkt requests

//bug:2877 - dtag parity error 2nd packet request;
//wire	error_rst ;

//assign	error_rst =
//	(ld0_pcx_rq_sel_d1 & lsu_dtag_perror_w2[0]) |
//	(ld1_pcx_rq_sel_d1 & lsu_dtag_perror_w2[1]) |
//	(ld2_pcx_rq_sel_d1 & lsu_dtag_perror_w2[2]) |
//	(ld3_pcx_rq_sel_d1 & lsu_dtag_perror_w2[3]) ;

//wire	error_rst_d1 ;
//dff #(1)  erst_stgd1 (
//        .din    (error_rst), 
//	.q  	(error_rst_d1),
//        .clk  	(clk),
//        .se     (1'b0),       .si (),          .so ()
//        ); 

wire   [3:0]  dtag_perr_pkt2_vld ;
assign  dtag_perr_pkt2_vld[0] =  lsu_ld0_pcx_rq_sel_d1 & lsu_dtag_perror_w2[0];
assign  dtag_perr_pkt2_vld[1] =  lsu_ld1_pcx_rq_sel_d1 & lsu_dtag_perror_w2[1];
assign  dtag_perr_pkt2_vld[2] =  lsu_ld2_pcx_rq_sel_d1 & lsu_dtag_perror_w2[2];
assign  dtag_perr_pkt2_vld[3] =  lsu_ld3_pcx_rq_sel_d1 & lsu_dtag_perror_w2[3];

//bug:2877 - dtag parity error 2nd packet request; flop to sync w/ ld?_pcx_rq_sel_d2
dff_s #(4) ff_dtag_perr_pkt2_vld_d1 (
        .din    (dtag_perr_pkt2_vld[3:0]), 
        .q      (dtag_perr_pkt2_vld_d1[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 



//bug:2877 - dtag parity error 2nd packet request; error_rst can be removed from mcycle_mask_d1 since
//           it does not behave like an atomic i.e. it is sent as 2 separate packets.
assign	mcycle_squash_d1 =
 // error_rst | // dtag parity error requires two ld pkts
  //(|lsu_error_rst[3:0]) | // dtag parity error requires two ld pkts
  spc_pcx_atom_pq_buf2 ;   // cas/fpop

dff_s #(1)  sqsh_stgd1 (
        .din    (pcx_req_squash), 
	.q  	(pcx_req_squash_d1),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

dff_s #(1)  sqsh_stgd2 (
        .din    (pcx_req_squash_d1), 
	.q  	(pcx_req_squash_d2),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
//timing fix: 9/19/03 - split the lsu_pcx_req_squash to 4 signals to stb_ctl[0-3] to reduce loading
assign  lsu_pcx_req_squash = pcx_req_squash & ~st_atom_rq_d1 ;
assign  lsu_pcx_req_squash0 = lsu_pcx_req_squash ;
assign  lsu_pcx_req_squash1 = lsu_pcx_req_squash ;
assign  lsu_pcx_req_squash2 = lsu_pcx_req_squash ;
assign  lsu_pcx_req_squash3 = lsu_pcx_req_squash ;

assign  lsu_pcx_req_squash_d1 = pcx_req_squash_d1 ;

dff_s #(5)  rsel_stgd1 (
        //.din    ({imiss_strm_pcx_rq_sel,
        .din    ({
    imiss_pcx_rq_sel, strm_pcx_rq_sel, intrpt_pcx_rq_sel, fpop_pcx_rq_sel,
    fwdpkt_pcx_rq_sel}), 
        //.q      ({imiss_strm_pcx_rq_sel_d1,
        .q      ({
    imiss_pcx_rq_sel_d1, strm_pcx_rq_sel_d1, intrpt_pcx_rq_sel_d1,fpop_pcx_rq_sel_d1,
    fwdpkt_pcx_rq_sel_d1}), 
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

assign  lsu_imiss_pcx_rq_sel_d1  =  imiss_pcx_rq_sel_d1;

dff_s  imrqs_stgd2 (
        .din    (imiss_pcx_rq_sel_d1), 
	.q  	(imiss_pcx_rq_sel_d2),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

dff_s  fwdrqs_stgd2 (
        .din    (fwdpkt_pcx_rq_sel_d1), 
	.q  	(fwdpkt_pcx_rq_sel_d2),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

dff_s  fwdrqs_stgd3 (
        .din    (fwdpkt_pcx_rq_sel_d2), 
	.q  	(fwdpkt_pcx_rq_sel_d3),
        .clk  	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

dff_s  fpop_stgd2 (
        .din    (fpop_pcx_rq_sel_d1), .q  (fpop_pcx_rq_sel_d2),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//bug4665: add sehold to pcx_pkt_src_sel[1]
//wire	ld_pcx_rq_sel_d1,st_pcx_rq_sel_d1,misc_pcx_rq_sel_d1;
wire	ld_pcx_rq_sel_d1,st_pcx_rq_sel_d1;
wire    all_pcx_rq_pick_b2 ;
assign  all_pcx_rq_pick_b2  =  sehold ? st_pcx_rq_sel_d1 : all_pcx_rq_pick[2] ;

dff_s #(2)  pick_stgd1 (
        .din    ({all_pcx_rq_pick_b2, all_pcx_rq_pick[1]}), 
        .q      ({st_pcx_rq_sel_d1,ld_pcx_rq_sel_d1}),
        //.din    ({all_pcx_rq_pick[3], all_pcx_rq_pick_b2, all_pcx_rq_pick[1]}), 
        //.q      ({misc_pcx_rq_sel_d1,st_pcx_rq_sel_d1,ld_pcx_rq_sel_d1}),
        //.din    (all_pcx_rq_pick[2:1]), .q      ({st_pcx_rq_sel_d1,ld_pcx_rq_sel_d1}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

// add other sources in such as interrupt and fpop.
//bug:2877 - dtag parity error 2nd packet request; remove error_rst_d1 since dtag parity error does not
//           behave as an atomic
//assign pcx_pkt_src_sel[0] = ld_pcx_rq_sel_d1 | st_cas_rq_d2 | error_rst_d1 ;

//11/7/03 - add rst_tri_en
wire  [3:0]  pcx_pkt_src_sel_tmp ;
assign pcx_pkt_src_sel_tmp[0] = ld_pcx_rq_sel_d1 | st_cas_rq_d2 ;
assign pcx_pkt_src_sel_tmp[1] = st_pcx_rq_sel_d1 ;
assign pcx_pkt_src_sel_tmp[2] = ~|{pcx_pkt_src_sel[3],pcx_pkt_src_sel[1:0]};
                                //imiss_strm_pcx_rq_sel_d1  ;
assign pcx_pkt_src_sel_tmp[3] = fpop_pcx_rq_sel_d1 | fpop_pcx_rq_sel_d2 |
			        fwdpkt_pcx_rq_sel_d1 | intrpt_pcx_rq_sel_d1 ;

//bug4888 -  change rst_tri_en to select b[1] instead of b[3]

assign pcx_pkt_src_sel[3:2]  =  pcx_pkt_src_sel_tmp[3:2] & {2{~rst_tri_en}} ;
assign pcx_pkt_src_sel[1]    =  pcx_pkt_src_sel_tmp[1] | rst_tri_en ;
assign pcx_pkt_src_sel[0]    =  pcx_pkt_src_sel_tmp[0] & ~rst_tri_en ;

//assign  dest_pkt_sel[0] = ld_pcx_rq_vld ;
//assign  dest_pkt_sel[1] = st_pcx_rq_vld ;
//assign  dest_pkt_sel[2] = ~(ld_pcx_rq_vld | st_pcx_rq_vld);

//=================================================================================================
//		SELECT DESTINATION
//=================================================================================================

// Select dest for load.
mux4ds  #(5) ldsel_dest (
  .in0  (ld0_l2bnk_dest[4:0]),
  .in1  (ld1_l2bnk_dest[4:0]),
  .in2  (ld2_l2bnk_dest[4:0]),
  .in3  (ld3_l2bnk_dest[4:0]),
  .sel0 (ld0_pcx_rq_pick),
  .sel1 (ld1_pcx_rq_pick),
  .sel2 (ld2_pcx_rq_pick),
  .sel3 (ld3_pcx_rq_pick),
  .dout (ld_pkt_dest[4:0])
);

// Select dest for store
mux4ds  #(5) stsel_dest (
  .in0  (st0_l2bnk_dest[4:0]),
  .in1  (st1_l2bnk_dest[4:0]),
  .in2  (st2_l2bnk_dest[4:0]),
  .in3  (st3_l2bnk_dest[4:0]),
  .sel0 (st0_pcx_rq_pick),
  .sel1 (st1_pcx_rq_pick),
  .sel2 (st2_pcx_rq_pick),
  .sel3 (st3_pcx_rq_pick),
  .dout (st_pkt_dest[4:0])
);

wire	[4:0]	misc_pkt_dest ;
mux4ds  #(5) miscsel_dest (
  .in0  (strm_l2bnk_dest[4:0]),
  .in1  (fpop_l2bnk_dest[4:0]),
  .in2  (intrpt_l2bnk_dest[4:0]),
  .in3  (fwdpkt_dest_d1[4:0]),
  .sel0 (strm_pcx_rq_pick),
  .sel1 (fpop_pcx_rq_pick),
  .sel2 (intrpt_pcx_rq_pick),
  .sel3 (fwdpkt_pcx_rq_pick),
  .dout (misc_pkt_dest[4:0])
);

// This is temporary until the req/ack path is restructured
/*assign  imiss_strm_pkt_dest[4:0] =
  imiss_pcx_rq_sel ? imiss_l2bnk_dest[4:0] :  
    strm_pcx_rq_sel ? strm_l2bnk_dest[4:0] :
      fpop_pcx_rq_sel ? fpop_l2bnk_dest[4:0] :
        intrpt_pcx_rq_sel ? intrpt_l2bnk_dest[4:0] :
                lsu_fwdpkt_dest[4:0] ;  */

/*
// This needs to be replaced with structural mux once rq/ack resolved.
mux4ds  #(5) istrmsel_dest (
  .in0  (imiss_l2bnk_dest[4:0]),
  .in1  (strm_l2bnk_dest[4:0]),
  .in2  (fpop_l2bnk_dest[4:0]),
  .in3  (intrpt_l2bnk_dest[4:0]),
  .sel0 (imiss_pcx_rq_sel),  
  .sel1   (strm_pcx_rq_sel),
  .sel2   (fpop_pcx_rq_sel),
  .sel3   (intrpt_pcx_rq_sel),
  .dout (imiss_strm_pkt_dest[4:0])
);
*/

/* Tri
mux4ds  #(5) sel_final_dest (
  .in0  (imiss_l2bnk_dest[4:0]),
  .in1  (ld_pkt_dest[4:0]),
  .in2  (st_pkt_dest[4:0]),
  .in3  (misc_pkt_dest[4:0]),
  .sel0 (all_pcx_rq_pick[0]),  
  .sel1 (all_pcx_rq_pick[1]),
  .sel2 (all_pcx_rq_pick[2]), 
  .sel3 (all_pcx_rq_dest_sel3), 
  //.sel3 (all_pcx_rq_pick[3]), 
  .dout (current_pkt_dest[4:0])
);
*/
// Tri: the only destination is the PCX decoder in the transceiver (0)
//assign current_pkt_dest[4:0] = 5'b00001; adif: setting the available banks here and in the atomic availability logic  
assign current_pkt_dest[4:0] = {1'b0,AVAILABLE_L2_BANKS};
/*mux3ds  #(5) sel_dest (
  .in0  (ld_pkt_dest[4:0]),
  .in1  (st_pkt_dest[4:0]),
  .in2    (imiss_strm_pkt_dest[4:0]),
  .sel0 (dest_pkt_sel[0]),  
  .sel1   (dest_pkt_sel[1]),
  .sel2   (dest_pkt_sel[2]), 
  .dout (current_pkt_dest[4:0])
);*/

wire	pcx_rq_sel ;
assign	pcx_rq_sel = 
  ld0_pcx_rq_sel | ld1_pcx_rq_sel | ld2_pcx_rq_sel | ld3_pcx_rq_sel |
  st0_pcx_rq_sel | st1_pcx_rq_sel | st2_pcx_rq_sel | st3_pcx_rq_sel |
  imiss_pcx_rq_sel | strm_pcx_rq_sel | fpop_pcx_rq_sel | intrpt_pcx_rq_sel |
  fwdpkt_pcx_rq_sel ;

assign spc_pcx_req_g[4:0] = 
  (current_pkt_dest[4:0] & {5{pcx_rq_sel}}) ;
  //(current_pkt_dest[4:0] & 
  //{5{(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_vld | strm_pcx_rq_vld | intrpt_pcx_rq_vld | fpop_atom_req | fwdpkt_rq_vld)}}) ;

//timing fix: 9/19/03 - instantiate buffer for spc_pcx_req_pq
wire  [4:0]  spc_pcx_req_pq_tmp ;
dff_s #(5)  rq_stgpq (
        .din    (spc_pcx_req_g[4:0]), .q  (spc_pcx_req_pq_tmp[4:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 


bw_u1_buf_30x UZfix_spc_pcx_req_pq0_buf1 ( .a(spc_pcx_req_pq_tmp[0]), .z(spc_pcx_req_pq[0]) );
bw_u1_buf_30x UZfix_spc_pcx_req_pq1_buf1 ( .a(spc_pcx_req_pq_tmp[1]), .z(spc_pcx_req_pq[1]) );
bw_u1_buf_30x UZfix_spc_pcx_req_pq2_buf1 ( .a(spc_pcx_req_pq_tmp[2]), .z(spc_pcx_req_pq[2]) );
bw_u1_buf_30x UZfix_spc_pcx_req_pq3_buf1 ( .a(spc_pcx_req_pq_tmp[3]), .z(spc_pcx_req_pq[3]) );
bw_u1_buf_30x UZfix_spc_pcx_req_pq4_buf1 ( .a(spc_pcx_req_pq_tmp[4]), .z(spc_pcx_req_pq[4]) );

bw_u1_buf_30x UZsize_spc_pcx_req_pq0_buf2 ( .a(spc_pcx_req_pq_tmp[0]), .z(spc_pcx_req_pq_buf2[0]) );
bw_u1_buf_30x UZsize_spc_pcx_req_pq1_buf2 ( .a(spc_pcx_req_pq_tmp[1]), .z(spc_pcx_req_pq_buf2[1]) );
bw_u1_buf_30x UZsize_spc_pcx_req_pq2_buf2 ( .a(spc_pcx_req_pq_tmp[2]), .z(spc_pcx_req_pq_buf2[2]) );
bw_u1_buf_30x UZsize_spc_pcx_req_pq3_buf2 ( .a(spc_pcx_req_pq_tmp[3]), .z(spc_pcx_req_pq_buf2[3]) );
bw_u1_buf_30x UZsize_spc_pcx_req_pq4_buf2 ( .a(spc_pcx_req_pq_tmp[4]), .z(spc_pcx_req_pq_buf2[4]) );

//bug3348 - not needed
//wire   spc_pcx_req_vld_pq ;
//assign spc_pcx_req_vld_pq =  |spc_pcx_req_pq[4:0];
//
//dff #(1)  rq_stgpq1 (
//        .din    (spc_pcx_req_vld_pq), .q  (spc_pcx_req_vld_pq1),
//        .clk  (clk),
//        .se     (1'b0),       .si (),          .so ()
//        ); 

assign spc_pcx_req_update_g[4:0] = 
        (st_atom_rq_d1 | fpop_atom_rq_pq) ?
        spc_pcx_req_pq_buf2[4:0] :           // Recirculate same request if back to back case - stda, cas etc
        (current_pkt_dest[4:0] & 
        {5{pcx_rq_sel}}) ;
        //{5{(ld_pcx_rq_vld | st_pcx_rq_vld | imiss_pcx_rq_vld | strm_pcx_rq_vld | intrpt_pcx_rq_vld | fpop_pcx_rq_vld | fwdpkt_rq_vld)}}) ;
                                        // Standard request

dff_s #(5)  urq_stgpq (
        .din    (spc_pcx_req_update_g[4:0]), .q  (spc_pcx_req_update_w2[4:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//=================================================================================================
//	2-CYCLE OP HANDLING
//=================================================================================================

// cas,fpop,dtag-error pkt. dtag-error pkt does not have to be b2b.
// prevent starvation, ensure requests are b2b.
// fpop can only request to fpu.(bit4) cas can only request to L2 (b3:0) 
// ** error rst needs to be handled correctly.

// ** This needs to be massaged for timing.
// timing fix: 5/7/03 - delay the mask 1 cycle for stores.
wire	[3:0]	mcycle_mask_qwr ;
wire	[4:0]	mcycle_mask_qwr_d1 ;
//assign	mcycle_mask_qwr[3:0] =
//	({4{(stb0_rd_for_pcx & st0_atomic_vld)}} & st0_l2bnk_dest[3:0]) |
//	({4{(stb1_rd_for_pcx & st1_atomic_vld)}} & st1_l2bnk_dest[3:0]) |
//	({4{(stb2_rd_for_pcx & st2_atomic_vld)}} & st2_l2bnk_dest[3:0]) |
//	({4{(stb3_rd_for_pcx & st3_atomic_vld)}} & st3_l2bnk_dest[3:0]) ;


//bug4513- kill the atomic store pcx req in this cycle if only 1 entry is available -
//         atomic packets have to be sent b2bto pcx.
//
// ex. thread0 to l2 bank0 atomic store - w/ only 1 bank0 entry available
//---------------------------------------------------------------------------------
//				1	2	3	4	5	6	7
//---------------------------------------------------------------------------------
// st0_atomic_vld-------------->1
// pcx_rq_for_stb_tmp[0]------->1
// pcx_rq_for_stb[0]----------->0                               1
// st0_qmon_2entry_avail------->0                               1
//---------------------------------------------------------------------------------
// st0_atomic_pend------------->1                               0
// st0_atomic_pend_d1------------------>1                               0
// mcycle_mask_qwr_d1[0]--------------->1                               0
//---------------------------------------------------------------------------------

/*
assign  st0_qmon_2entry_avail =  |(st0_l2bnk_dest[3:0] & sel_qentry0[3:0]) ;
assign  st1_qmon_2entry_avail =  |(st1_l2bnk_dest[3:0] & sel_qentry0[3:0]) ;
assign  st2_qmon_2entry_avail =  |(st2_l2bnk_dest[3:0] & sel_qentry0[3:0]) ;
assign  st3_qmon_2entry_avail =  |(st3_l2bnk_dest[3:0] & sel_qentry0[3:0]) ;
*/
// adif: adding back pressure to atomic availability accoording to available banks
// 9/25/14 trin: simplify logics, also fixing fpop 2entry logics
assign  st0_qmon_2entry_avail =  sel_qentry0[0];
assign  st1_qmon_2entry_avail =  sel_qentry0[0];
assign  st2_qmon_2entry_avail =  sel_qentry0[0];
assign  st3_qmon_2entry_avail =  sel_qentry0[0];

 // assign  fpop_qmon_2entry_avail =  fpop_l2bnk_dest[4] & sel_qentry0[4] ;
 // 9/25/14 trin: should fix the problem (bug #96)
 assign  fpop_qmon_2entry_avail =  sel_qentry0[0];


//bug4513 - when atomic is picked, if 2 entries are not free, kill all requests until 2entries are free
wire    st0_atomic_pend, st1_atomic_pend, st2_atomic_pend, st3_atomic_pend ;

assign  st0_atomic_pend  =  (pcx_rq_for_stb_tmp[0] & st0_atomic_vld & ~st0_qmon_2entry_avail) |  //set
                            (st0_atomic_pend_d1 & ~st0_qmon_2entry_avail) ;		     //recycle/reset

assign  st1_atomic_pend  =  (pcx_rq_for_stb_tmp[1] & st1_atomic_vld & ~st1_qmon_2entry_avail) |  //set
                            (st1_atomic_pend_d1 & ~st1_qmon_2entry_avail) ;		     //recycle/reset

assign  st2_atomic_pend  =  (pcx_rq_for_stb_tmp[2] & st2_atomic_vld & ~st2_qmon_2entry_avail) |  //set
                            (st2_atomic_pend_d1 & ~st2_qmon_2entry_avail) ;		     //recycle/reset

assign  st3_atomic_pend  =  (pcx_rq_for_stb_tmp[3] & st3_atomic_vld & ~st3_qmon_2entry_avail) |  //set
                            (st3_atomic_pend_d1 & ~st3_qmon_2entry_avail) ;		     //recycle/reset

dff_s #(4)  ff_st0to3_atomic_pend_d1 (
        .din ({st3_atomic_pend,st2_atomic_pend,st1_atomic_pend,st0_atomic_pend}),
        .q   ({st3_atomic_pend_d1,st2_atomic_pend_d1,st1_atomic_pend_d1,st0_atomic_pend_d1}),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//bug4513 - kill all requests after atomic if 2 entries to the bank are not available
assign	mcycle_mask_qwr[3:0] =
	({4{st0_atomic_pend}} & st0_l2bnk_dest[3:0]) |
	({4{st1_atomic_pend}} & st1_l2bnk_dest[3:0]) |
	({4{st2_atomic_pend}} & st2_l2bnk_dest[3:0]) |
	({4{st3_atomic_pend}} & st3_l2bnk_dest[3:0]) ;

//11/15/03 - change fpop atomic to be same as store atomic (bug4513)
//assign	mcycle_mask_qwr[4] = fpop_pkt_vld | fpop_pcx_rq_sel_d1 ;

wire    fpop_atomic_pend, fpop_atomic_pend_d1 ;


assign fpop_atomic_pend = (fpop_pcx_rq_sel_tmp & ~fpop_qmon_2entry_avail) |
                          (fpop_atomic_pend_d1 & ~fpop_qmon_2entry_avail) ;

assign  fpop_q_wr[4:0] = fpop_atomic_pend_d1 ? pre_qwr[4:0] : queue_write[4:0] ;

dff_s #(1)  ff_fpop_atomic_pend_d1 (
        .din (fpop_atomic_pend),
        .q   (fpop_atomic_pend_d1),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 


dff_s #(5)  ff_mcycle_mask_qwr_b4to0 (
        .din ({fpop_atomic_pend,mcycle_mask_qwr[3:0]}), 
        .q   (mcycle_mask_qwr_d1[4:0]),
        .clk  (clk),
        .se     (1'b0),       .si (),          .so ()
        ); 


// 			PCX REQUEST GENERATION (END)
//*************************************************************************************************

//=================================================================================================
//
// CPX Packet Processing
//
//=================================================================================================


// D-SIDE PROCESSING

/*input  [3:0]   lsu_cpx_pkt_rqtype ;
input          lsu_cpx_pkt_vld ;*/

// non-cacheables are processed at the head of the dfq.
// cpx_ld_type may not have to factor in strm load.

//=================================================================================================
//
// PCX Queue Control
//
//=================================================================================================

//timing fix: 5/7/03 - delay mask 1 cycle for stores
//11/15/03 - change fpop atomic to be same as store atomic (bug4513)
//assign	queue_write[4:0] = pre_qwr[4:0] & ~{mcycle_mask_qwr[4],mcycle_mask_qwr_d1[3:0]} ;
assign	queue_write[4:0] = pre_qwr[4:0] & ~mcycle_mask_qwr_d1[4:0] ;

//bug4513 - mcycle_mask_qwr will kill all requests other than stores. stores can be killed
//          by fpop atomics
//11/14/03- fox for bug4513 was incorrect ; st_queue_write[3:0] not needed 'cos st[0-3]_q_wr 
//          has been changed to use st0_atomic_pend instead of st0_atomic_vld
//assign	st_queue_write[4] = pre_qwr[4] & ~mcycle_mask_qwr[4] ;
//assign	st_queue_write[3:0] = pre_qwr[3:0] ;

//assign	queue_write[4:0] = pre_qwr[4:0] & ~mcycle_mask_qwr[4:0] ; // timing fix
// assign	queue_write[4:0] = pre_qwr[4:0] ;

// PCX Queue Control
// - qctl tracks 2-input queue state for each of 6 destinations
// through grant signals available from pcx.

// L2 Bank0 Queue Monitor
lsu_pcx_qmon  l2bank0_qmon (
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so(),
  .send_by_pcx  (pcx_spc_grant_px[0]),
  .send_to_pcx  (spc_pcx_req_update_w2[0]),
  //.qwrite   (queue_write[0]),
  .qwrite   (pre_qwr[0]),
  .sel_qentry0  (sel_qentry0[0])
);

// L2 Bank1 Queue Monitor
lsu_pcx_qmon  l2bank1_qmon (
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so(),
  .send_by_pcx  (pcx_spc_grant_px[1]),
  .send_to_pcx  (spc_pcx_req_update_w2[1]),
  //.qwrite   (queue_write[1]),
  .qwrite   (pre_qwr[1]),
  .sel_qentry0  (sel_qentry0[1])
);

// L2 Bank2 Queue Monitor
lsu_pcx_qmon  l2bank2_qmon (
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so(),
  .send_by_pcx  (pcx_spc_grant_px[2]),
  .send_to_pcx  (spc_pcx_req_update_w2[2]),
  //.qwrite   (queue_write[2]),
  .qwrite   (pre_qwr[2]),
  .sel_qentry0  (sel_qentry0[2])
);

// L2 Bank3 Queue Monitor
lsu_pcx_qmon  l2bank3_qmon (
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so(),
  .send_by_pcx  (pcx_spc_grant_px[3]),
  .send_to_pcx  (spc_pcx_req_update_w2[3]),
  //.qwrite   (queue_write[3]),
  .qwrite   (pre_qwr[3]),
  .sel_qentry0  (sel_qentry0[3])
);

// FP/IO Bridge Queue Monitor
lsu_pcx_qmon  fpiobridge_qmon (
    .rclk         (rclk),
    .grst_l       (grst_l),
    .arst_l       (arst_l),
    .si(),
    .se(se),
    .so(),
  .send_by_pcx  (pcx_spc_grant_px[4]),
  .send_to_pcx  (spc_pcx_req_update_w2[4]),
  //.qwrite   (queue_write[4]),
  .qwrite   (pre_qwr[4]),
  .sel_qentry0  (sel_qentry0[4])
);




// 5/13/03: timing fix for lsu_dtag_perror_w2 thru st_pick
wire  [3:0]  error_en;
wire  [3:0]  error_rst_thrd;

//assign  error_en[0] = lmq_enable[0] | (lsu_cpx_pkt_atm_st_cmplt & dcfill_active_e & dfq_byp_sel[0]);
assign  error_en[0] = lsu_ld_inst_vld_g[0];
assign  error_en[1] = lsu_ld_inst_vld_g[1];
assign  error_en[2] = lsu_ld_inst_vld_g[2];
assign  error_en[3] = lsu_ld_inst_vld_g[3];

//assign  error_rst_thrd[0] = reset | (lsu_ld0_pcx_rq_sel_d1 & lsu_pcx_ld_dtag_perror_w2) ;
//assign  error_rst_thrd[1] = reset | (lsu_ld1_pcx_rq_sel_d1 & lsu_pcx_ld_dtag_perror_w2) ;
//assign  error_rst_thrd[2] = reset | (lsu_ld2_pcx_rq_sel_d1 & lsu_pcx_ld_dtag_perror_w2) ;
//assign  error_rst_thrd[3] = reset | (lsu_ld3_pcx_rq_sel_d1 & lsu_pcx_ld_dtag_perror_w2) ;

// reset moved to d2 'cos if 1st pkt is speculative and grant=0, error should not be reset.
//bug4512 - stb_full_raw has to be qual w/ ld[0-3] inst_vld_w2
//          also, need to qualify stb_full_raw w/ fp loads i.e. dont reset error if full raw is for fp double loads
assign  error_rst_thrd[0] = reset | (ld0_pcx_rq_sel_d2 & ~pcx_req_squash_d1) 
				| (ld0_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 & thread0_w2) ; // Bug4512
				//| (ld_stb_full_raw_w2 & thread0_w2) ; // Bug 4361

assign  error_rst_thrd[1] = reset | (ld1_pcx_rq_sel_d2 & ~pcx_req_squash_d1)
				| (ld1_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 & thread1_w2) ;

assign  error_rst_thrd[2] = reset | (ld2_pcx_rq_sel_d2 & ~pcx_req_squash_d1)
				| (ld2_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 & thread2_w2) ;

assign  error_rst_thrd[3] = reset | (ld3_pcx_rq_sel_d2 & ~pcx_req_squash_d1)
				| (ld3_inst_vld_w2 & ld_stb_full_raw_w2 & ~dbl_force_l2access_w2 & thread3_w2) ;

//assign  lsu_error_rst[3:0]  =  error_rst[3:0];

wire	dtag_perror3,dtag_perror2,dtag_perror1,dtag_perror0;

// Thread 0
dffre_s  #(1) error_t0 (
        .din    (lsu_dcache_tag_perror_g),
        .q      (dtag_perror0),
        .rst  (error_rst_thrd[0]), .en     (error_en[0]),               
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );            

// Thread 1
dffre_s  #(1) error_t1 (
        .din    (lsu_dcache_tag_perror_g),
        .q      (dtag_perror1),
        .rst  (error_rst_thrd[1]), .en     (error_en[1]),               
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );            

// Thread 2
dffre_s  #(1) error_t2 (
        .din    (lsu_dcache_tag_perror_g),
        .q      (dtag_perror2),
        .rst  (error_rst_thrd[2]), .en     (error_en[2]),               
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );            

// Thread 3
dffre_s  #(1) error_t3 (
        .din    (lsu_dcache_tag_perror_g),
        .q      (dtag_perror3),
        .rst  (error_rst_thrd[3]), .en     (error_en[3]),               
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );            

assign	lsu_dtag_perror_w2[3] = dtag_perror3 ;
assign	lsu_dtag_perror_w2[2] = dtag_perror2 ;
assign	lsu_dtag_perror_w2[1] = dtag_perror1 ;
assign	lsu_dtag_perror_w2[0] = dtag_perror0 ;

// Determine if ld pkt requires correction due to dtag parity error.
assign  lsu_pcx_ld_dtag_perror_w2 =
  ld_pcx_rq_sel[0] ? dtag_perror0 :
    ld_pcx_rq_sel[1] ? dtag_perror1 :
      ld_pcx_rq_sel[2] ? dtag_perror2 : dtag_perror3 ;


//=================================================================================================
//
// THREAD RETRY DETECTION (picker related logic)
//
//=================================================================================================

//bug4814 - move pick_staus out of picker and reset pick status when all 12 valid requests have
//          is picked and not squashed.

assign  ld_thrd_pick_din[0]  =  ld_thrd_pick_status[0] | (ld0_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  ld_thrd_pick_din[1]  =  ld_thrd_pick_status[1] | (ld1_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  ld_thrd_pick_din[2]  =  ld_thrd_pick_status[2] | (ld2_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  ld_thrd_pick_din[3]  =  ld_thrd_pick_status[3] | (ld3_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;

assign  ld_thrd_pick_rst  =  ~|(ld_events_raw[3:0] & ~ld_thrd_pick_din[3:0]) ;
   
assign  ld_thrd_pick_status_din[3:0] =  ld_thrd_pick_din[3:0] & ~{4{all_thrd_pick_rst}} ;
//assign  ld_thrd_pick_status_din[3:0]  =  ld_thrd_pick_din[3:0] & ~{4{ld_thrd_pick_rst}} ;

assign  st_thrd_pick_din[0] = st_thrd_pick_status[0] | (st0_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  st_thrd_pick_din[1] = st_thrd_pick_status[1] | (st1_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  st_thrd_pick_din[2] = st_thrd_pick_status[2] | (st2_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  st_thrd_pick_din[3] = st_thrd_pick_status[3] | (st3_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;

assign  st_thrd_pick_rst  =  ~|(st_events_raw[3:0] & ~st_thrd_pick_din[3:0]) ;
assign  st_thrd_pick_status_din[3:0]  =  st_thrd_pick_din[3:0] & ~{4{all_thrd_pick_rst}} ;
//assign  st_thrd_pick_status_din[3:0]  =  st_thrd_pick_din[3:0] & ~{4{st_thrd_pick_rst}} ;

assign  misc_thrd_pick_din[3] = misc_thrd_pick_status[3] | lsu_spu_ldst_ack ;
assign  misc_thrd_pick_din[2] = misc_thrd_pick_status[2] | (fpop_pcx_rq_sel_d2 & ~pcx_req_squash_d1) ;
assign  misc_thrd_pick_din[1] = misc_thrd_pick_status[1] | lsu_tlu_pcxpkt_ack ;
assign  misc_thrd_pick_din[0] = misc_thrd_pick_status[0] | lsu_fwdpkt_pcx_rq_sel ;

assign  misc_thrd_pick_rst  =  ~|(misc_events_raw[3:0] & ~misc_thrd_pick_din[3:0]) ;
   
assign  misc_thrd_pick_status_din[3:0]  =  misc_thrd_pick_din[3:0] & ~{4{all_thrd_pick_rst}} ;
//assign  misc_thrd_pick_status_din[3:0]  =  misc_thrd_pick_din[3:0] & ~{4{misc_thrd_pick_rst}} ;

assign  all_thrd_pick_rst  =  ld_thrd_pick_rst & st_thrd_pick_rst & misc_thrd_pick_rst ;


dff_s    #(4) ff_ld_thrd_force(
        .din    (ld_thrd_pick_status_din[3:0]),
        .q      (ld_thrd_pick_status[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s    #(4) ff_st_thrd_force(
        .din    (st_thrd_pick_status_din[3:0]),
        .q      (st_thrd_pick_status[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s    #(4) ff_misc_thrd_force(
        .din    (misc_thrd_pick_status_din[3:0]),
        .q      (misc_thrd_pick_status[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign  ld_thrd_force_d1[3:0]  =  ~ld_thrd_pick_status[3:0] ;
assign  st_thrd_force_d1[3:0]  =  ~st_thrd_pick_status[3:0] ;
assign  misc_thrd_force_d1[3:0]  =  ~misc_thrd_pick_status[3:0] ;

assign ld_thrd_force_vld[0]  =  ld_thrd_force_d1[0] & 
                               ~(ld0_pcx_rq_sel_d1 | ld0_pcx_rq_sel_d2) ;

assign ld_thrd_force_vld[1]  =  ld_thrd_force_d1[1] &
                               ~(ld1_pcx_rq_sel_d1 | ld1_pcx_rq_sel_d2) ;

assign ld_thrd_force_vld[2]  =  ld_thrd_force_d1[2] &
                               ~(ld2_pcx_rq_sel_d1 | ld2_pcx_rq_sel_d2) ;

assign ld_thrd_force_vld[3]  =  ld_thrd_force_d1[3] &
                               ~(ld3_pcx_rq_sel_d1 | ld3_pcx_rq_sel_d2) ;


// force valid to store picker if 1 entry is free and if it not picked in d1/d2
assign st_thrd_force_vld[0]  =  st_thrd_force_d1[0] &
                               ~(st0_pcx_rq_sel_d1 | st0_pcx_rq_sel_d2) ;

assign st_thrd_force_vld[1]  =  st_thrd_force_d1[1] &
                               ~(st1_pcx_rq_sel_d1 | st1_pcx_rq_sel_d2) ;

assign st_thrd_force_vld[2]  =  st_thrd_force_d1[2] &
                               ~(st2_pcx_rq_sel_d1 | st2_pcx_rq_sel_d2) ;

assign st_thrd_force_vld[3]  =  st_thrd_force_d1[3] &
                               ~(st3_pcx_rq_sel_d1 | st3_pcx_rq_sel_d2) ;



// force valid to misc picker if 1 entry is free and if it is not picked in d1/d2
assign misc_thrd_force_vld[0]  =  misc_thrd_force_d1[0] &
                                 ~(fwdpkt_pcx_rq_sel_d1 | fwdpkt_pcx_rq_sel_d2) ;

assign misc_thrd_force_vld[1]  =  misc_thrd_force_d1[1] &
                                 ~(intrpt_pcx_rq_sel_d1 | intrpt_pcx_rq_sel_d2);

assign misc_thrd_force_vld[2]  =  misc_thrd_force_d1[2] &
                                 ~(fpop_pcx_rq_sel_d1 | fpop_pcx_rq_sel_d2) ;

assign misc_thrd_force_vld[3]  =  misc_thrd_force_d1[3] &
                                 ~(strm_pcx_rq_sel_d1 | strm_pcx_rq_sel_d2) ;

//2nd level pick thread force - force only req are valid and l2bnk is free
assign all_thrd_force_vld[0]  =  1'b0 ;

assign all_thrd_force_vld[1]  =  
                    |(ld_thrd_force_vld[3:0] & 
                     {ld3_pcx_rq_vld,ld2_pcx_rq_vld,ld1_pcx_rq_vld,ld0_pcx_rq_vld}) ;

assign all_thrd_force_vld[2]  =  
                    |(st_thrd_force_vld[3:0] &
                     {st3_pcx_rq_vld,st2_pcx_rq_vld,st1_pcx_rq_vld,st0_pcx_rq_vld}) ;

assign all_thrd_force_vld[3]  =  
                    |(misc_thrd_force_vld[3:0] &
                     {strm_pcx_rq_vld,fpop_pcx_rq_vld,intrpt_pcx_rq_vld,fwdpkt_rq_vld}) ;


endmodule
