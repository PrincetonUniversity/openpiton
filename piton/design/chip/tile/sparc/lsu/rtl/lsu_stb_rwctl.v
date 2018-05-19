// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_stb_rwctl.v
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
///////////////////////////////////////////////////////////////////
/*
//  Description:  Control for Unified STB CAM/DATA of LSU
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include  "sys.h" // system level definition file which contains the 
          // time scale definition

`include "iop.h"

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu_stb_rwctl (/*AUTOARG*/
   // Outputs
   so, lsu_stbctl_flush_pipe_w, stb_cam_wr_no_ivld_m, 
   ld_rawp_st_ced_w2, stb_data_wr_ptr, stb_data_wptr_vld, 
   stb_data_rd_ptr, stb_data_rptr_vld, stb_wdata_ramd_b75_b64, 
   stb_cam_cm_tid, stb_ldst_byte_msk, stb_ldst_byte_msk_min, 
   stb_cam_rw_ptr, stb_cam_wptr_vld, stb_cam_rptr_vld, 
   lsu_st_sz_bhww_m, lsu_st_sz_dw_m, lsu_st_sz_bhw_m, 
   lsu_st_sz_wdw_m, lsu_st_sz_b_m, lsu_st_sz_w_m, lsu_st_sz_hw_m, 
   lsu_st_sz_hww_m, ld_rawp_st_ackid_w2, stb_flush_st_g, 
   stb_cam_wvld_m, lsu_st_rq_type_m, lsu_stb_data_early_sel_e, 
   lsu_stb_data_final_sel_m, lsu_ldquad_inst_m, stb_thrd_en_g, 
   flsh_inst_m, lsu_stb_va_m, lsu_stb_empty_buf, lsu_spu_stb_empty, 
   ifu_tlu_inst_vld_m_bf1, ifu_tlu_inst_vld_m_bf2, lsu_ifu_stbcnt0, 
   lsu_ifu_stbcnt1, lsu_ifu_stbcnt2, lsu_ifu_stbcnt3, 
   lsu_ffu_stb_full0, lsu_ffu_stb_full1, lsu_ffu_stb_full2, 
   lsu_ffu_stb_full3, 
   // Inputs
   rclk, rst_tri_en, si, se, ld_inst_vld_e, ldst_sz_e, st_inst_vld_e, 
   stb_pcx_rptr0, stb_wrptr0, stb_pcx_rptr1, stb_wrptr1, 
   stb_pcx_rptr2, stb_wrptr2, stb_pcx_rptr3, stb_wrptr3, 
   stb_cam_hit_ptr, stb_cam_hit, lsu_ldst_va_m, sta_internal_m, 
   ifu_tlu_thrid_e, tlu_exu_early_flush_pipe_w, lsu_ttype_vld_m2, 
   ifu_lsu_flush_w, lsu_defr_trp_taken_g, ifu_lsu_casa_e, 
   ifu_lsu_ldstub_e, ifu_lsu_swap_e, ifu_lsu_ldst_dbl_e, 
   stb_state_ced0, stb_state_ced1, stb_state_ced2, stb_state_ced3, 
   stb_ld_full_raw, stb_ld_partial_raw, stb_wrptr0_prev, 
   stb_wrptr1_prev, stb_wrptr2_prev, stb_wrptr3_prev, 
   ifu_lsu_alt_space_e, ifu_lsu_ldst_fp_e, lsu_quad_asi_e, 
   lsu_st_rmo_m, lsu_bst_in_pipe_m, ffu_lsu_kill_fst_w, 
   ffu_lsu_blk_st_e, ffu_lsu_blk_st_tid_m, ffu_lsu_blk_st_va_e, 
   lsu_snap_blk_st_m, tlb_pgnum_b39_g, lsu_stb_empty, 
   ifu_tlu_flsh_inst_e, stb_cam_mhit, ifu_tlu_inst_vld_m, 
   lsu_st_pcx_rq_pick, lsu_st_pcx_rq_vld, stb_rdata_ramc_b8t0, 
   lsu_stbcnt0, lsu_stbcnt1, lsu_stbcnt2, lsu_stbcnt3
   ) ;  

input     rclk ;     
//input     grst_l ;   
//input     arst_l ;   
   input  rst_tri_en;
   
   input  si;
   input  se;
   output so;
   

input     ld_inst_vld_e ;   // load in pipe.
input [1:0]   ldst_sz_e ;   // size of load.
input     st_inst_vld_e ;   // store in pipe.
// Currently bypass flop make request 
//input [3:0]   pcx_rq_for_stb ;  // pcx request rd of dfq - threaded
//input [2:0]   stb_dfq_rptr0 ;   // dfq rptr for stb0
input [2:0]   stb_pcx_rptr0 ;   // pcx rptr for stb0
input [2:0]   stb_wrptr0 ;    // wrt ptr - stb0
//input [2:0]   stb_dfq_rptr1 ;   // dfq rptr for stb1
input [2:0]   stb_pcx_rptr1 ;   // pcx rptr for stb1
input [2:0]   stb_wrptr1 ;    // wrt ptr - stb1
//input [2:0]   stb_dfq_rptr2 ;   // dfq rptr for stb2
input [2:0]   stb_pcx_rptr2 ;   // pcx rptr for stb2
input [2:0]   stb_wrptr2 ;    // wrt ptr - stb2
//input [2:0]   stb_dfq_rptr3 ;   // dfq rptr for stb3
input [2:0]   stb_pcx_rptr3 ;   // pcx rptr for stb3
input [2:0]   stb_wrptr3 ;    // wrt ptr - stb3
input [2:0]     stb_cam_hit_ptr ; // entry which hit
input     stb_cam_hit ;   // hit has occurred
//input [7:0]     stb_state_vld0 ;  // valid bits - stb0
//input [7:0]     stb_state_vld1 ;  // valid bits - stb1
//input [7:0]     stb_state_vld2 ;  // valid bits - stb2
//input [7:0]     stb_state_vld3 ;  // valid bits - stb3
input [9:0]    lsu_ldst_va_m ;
input     sta_internal_m ;   // internal stxa
input [1:0]   ifu_tlu_thrid_e ; // thread-id.

//   output     lsu_stbrwctl_flush_pipe_w ;  // tmp for tso_mon
   input      tlu_exu_early_flush_pipe_w;
   input      lsu_ttype_vld_m2;
   
   input      ifu_lsu_flush_w;
   input      lsu_defr_trp_taken_g;
   output     lsu_stbctl_flush_pipe_w;
   
   
input                   ifu_lsu_casa_e ;        // compare-swap instr
input                   ifu_lsu_ldstub_e ;      // ldstub
input                   ifu_lsu_swap_e ;        // swap
input     ifu_lsu_ldst_dbl_e; // ldst dbl, specifically for stquad.
//input   [63:0]          lsu_stb_st_data_g ;     // data to be written to stb
input [7:0]   stb_state_ced0 ;
input [7:0]   stb_state_ced1 ;
input [7:0]   stb_state_ced2 ;
input [7:0]   stb_state_ced3 ;
input [7:0]   stb_ld_full_raw ;
input [7:0]   stb_ld_partial_raw ;
input   [2:0]   stb_wrptr0_prev ;
input   [2:0]   stb_wrptr1_prev ;
input   [2:0]     stb_wrptr2_prev ;
input   [2:0]   stb_wrptr3_prev ;
input     ifu_lsu_alt_space_e ; // alt_space inst
input     ifu_lsu_ldst_fp_e ;
//input     tlb_cam_hit ;   // tlb cam hit - mstage
input     lsu_quad_asi_e ;  // quad ldst asi
//input  [3:0]      lsu_st_ack_rq_stb ;
//input     lsu_dtlb_bypass_e ;
input	lsu_st_rmo_m ;	// rmo st in m cycle.
input	lsu_bst_in_pipe_m ;	// 1st helper for bst.
input           ffu_lsu_kill_fst_w ;	// ecc error on st.
input  		ffu_lsu_blk_st_e ;     	// blk st helper signalled by ffu
input  	[1:0]	ffu_lsu_blk_st_tid_m ;  // blk st tid - from ffu_lsu_data
input	[5:3]  	ffu_lsu_blk_st_va_e ;	// bits 5:3 of va from increment
input  		lsu_snap_blk_st_m ;     	// snap blk st state
input		tlb_pgnum_b39_g ;

input 	[3:0]   lsu_stb_empty ;         // thread's stb is empty
input           ifu_tlu_flsh_inst_e;
input		stb_cam_mhit ;
input           ifu_tlu_inst_vld_m ;
//input   [3:0]   lsu_st_pcx_rq_kill_w2 ;

input [3:0]   lsu_st_pcx_rq_pick ;  

input         lsu_st_pcx_rq_vld ;

input	[8:0]	stb_rdata_ramc_b8t0 ;	// scan-only

output          stb_cam_wr_no_ivld_m ;

//output      ld_rawp_st_ced_g ;
output      ld_rawp_st_ced_w2 ;
output  [4:0]   stb_data_wr_ptr ; // write ptr - stb data
output      stb_data_wptr_vld ; // wr vld for stb data
output  [4:0]   stb_data_rd_ptr ; // rd ptr for stb data
output      stb_data_rptr_vld ; // rptr vld for stb data
output  [75:64]    stb_wdata_ramd_b75_b64 ;  // write data for DATA RAM. 

// partial or full raw required
output  [1:0]   stb_cam_cm_tid ;  // cam tid - stb cam
//output  [7:0]   stb_cam_sqsh_msk ;  // squash spurious hits
//output      stb_cam_vld ;
output  [7:0]   stb_ldst_byte_msk ; // byte mask for write/cam
output  [7:0]   stb_ldst_byte_msk_min ; // byte mask for write/cam for min path

//output  [3:0]   stb_rd_for_pcx_sel ;    // stb's st selected for read for pcx
output  [4:0]   stb_cam_rw_ptr ;        // rw ptr for shared stb cam port
output          stb_cam_wptr_vld ;      // wr vld for stb write   
output          stb_cam_rptr_vld ;      // rd vld for stb write   


//output      lsu_stb_pcx_rvld_d1 ; // stb has been read-delayby1cycle
//output      lsu_stb_dfq_rvld ;  // wr to dfq stb bypass ff

output                  lsu_st_sz_bhww_m ;      // byte or hword or word
output                  lsu_st_sz_dw_m ;        // double word
output                  lsu_st_sz_bhw_m ;       // byte or hword
output                  lsu_st_sz_wdw_m ;       // word or dword
output                  lsu_st_sz_b_m ;         // byte
output                  lsu_st_sz_w_m ;         // word
output                  lsu_st_sz_hw_m ;        // hword
output                  lsu_st_sz_hww_m ;       // hword or word

//output     ld_stb_full_raw_g ;
//output     ld_stb_partial_raw_g ;
//output  [3:0]   ld_stb_full_raw_g ;
//output  [3:0]   ld_stb_partial_raw_g ;

output  [2:0]   ld_rawp_st_ackid_w2 ;

//output  [2:0]   stb_dfq_rd_id ;   // stb entry being read for current thread for current thread

output  [3:0]     stb_flush_st_g ;  // st is flushed in cycle g
output  [3:0]     stb_cam_wvld_m ;

output  [2:1]   lsu_st_rq_type_m ;

output  [3:0]   lsu_stb_data_early_sel_e ;// select source of stb data.
output      lsu_stb_data_final_sel_m ;// select source of stb data.

output      lsu_ldquad_inst_m ; // stquad inst
//output      lsu_stdbl_inst_m ;  // stdbl inst

//output  [1:0]   lsu_stb_rd_tid ;  // thread for which stb read occurs

output	[3:0]	stb_thrd_en_g ;	// thread id for current stb access

   output     flsh_inst_m;

   output [9:3] lsu_stb_va_m;

output	[3:0]	lsu_stb_empty_buf ;
output	[3:0]	lsu_spu_stb_empty ;

   output     ifu_tlu_inst_vld_m_bf1;
   output     ifu_tlu_inst_vld_m_bf2;

   input [3:0] lsu_stbcnt0;
   input [3:0] lsu_stbcnt1;
   input [3:0] lsu_stbcnt2;
   input [3:0] lsu_stbcnt3;

   output [3:0] lsu_ifu_stbcnt0;
   output [3:0] lsu_ifu_stbcnt1;
   output [3:0] lsu_ifu_stbcnt2;
   output [3:0] lsu_ifu_stbcnt3;

   output       lsu_ffu_stb_full0;
   output       lsu_ffu_stb_full1;
   output       lsu_ffu_stb_full2;
   output       lsu_ffu_stb_full3;
 
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
//wire  [4:0] stb_dequeue_ptr ;
wire  [2:0] stb_wptr_prev ;
wire  [1:0] st_thrid_m,st_thrid_g ;
wire  [7:0] ld_any_raw_vld ;
wire  [7:0] ld_any_raw_vld_d1 ;
//wire    ld_raw_mhit ;
wire  [2:0] st_rq_type_m,st_rq_type_g ;

wire  [1:0] ldst_sz_m,ldst_sz_g, pipe_ldst_sz_m ;
wire    ldst_byte, ldst_hwrd, ldst_word, ldst_dwrd ;
wire  [7:0] ldst_byte_mask ;
wire  [2:0] stb_wptr ;  
wire  [1:0] thrid_m,thrid_g ;
wire    ld_inst_vld_m, st_inst_vld_m ;

wire    ldst_dbl_m;
wire    atomic_m ;
wire    ldstub_m ;
wire    casa_m, casa_g ;
wire    swap_m;
wire    flush_st_g ;
wire    cam_wptr_vld_g ;
wire  [2:0] cam_wptr_d1 ;

wire  [2:0] stb_rdptr0,stb_rdptr1 ;
wire  [2:0] stb_rdptr2,stb_rdptr3 ;

//wire  [3:0] stb_rd_mask ;
wire  [3:0] stb_select_rptr ;
wire  [1:0] stb_rd_thrid ;
//wire    cam_vld_g ;
wire  [9:0]  ldst_va_m, pipe_ldst_va_m ;
wire  [3:0]  ldst_va_g ;
wire  [2:0] cam_wr_ptr ;
wire  thread0_m, thread1_m, thread2_m, thread3_m ;
wire  thread0_g, thread1_g, thread2_g, thread3_g ;
wire  [2:0]   ld_rawp_stb_id ;

//wire  rd_for_dfq_granted ;
wire  [7:0] stb_state_ced,stb_state_ced_d1 ;
//wire    stq_wr_en ;
//wire  [3:0] stq_wr_en_g ;
//wire  [3:0] stquad_vld ;
//wire  [2:0] stquad_ptr0,stquad_ptr1,stquad_ptr2,stquad_ptr3 ;
//wire  [3:0] ld_stq_hit_g ;
//wire  ldq_hit_g ;
//wire  [3:0] ldq_hit_g ;
wire  ldst_fp_m;
wire  ldstub_e,casa_e,ldst_dbl_e;
//wire  stb_data_final_sel_e ;
wire  alt_space_e,alt_space_m ;
wire  quad_asi_m ;
//wire  stquad_e, stquad_m ;
wire  stdbl_e ;
//wire  dfq_any_rq_for_stb ;
//wire  [3:0]   stb_rd_for_dfq ;  // read rq for dfq - threaded
wire    blkst_m,blkst_g ;
wire	stb_not_empty ;

   wire       clk;
   assign     clk = rclk;

//   wire       rst_l;
//   wire       stb_rwctl_rst_l;
   
//   dffrl_async rstff(.din (grst_l),
//                     .q   (stb_rwctl_rst_l),
//                     .clk (clk), .se(se), .si(), .so(),
//                     .rst_l (arst_l));

//=========================================================================================
//  MISC
//=========================================================================================

// Scan-only flops.

wire	[8:0]	stb_rdata_ramc_b8t0_so ;
dff_s #(9)  scmscan_ff (
        .din    (stb_rdata_ramc_b8t0[8:0]),
        .q      (stb_rdata_ramc_b8t0_so[8:0]),
        .clk    (clk),
        .se   (se),       .si (),          .so ()
        );

//=========================================================================================
//  INST_VLD_W GENERATION
//=========================================================================================

wire    flush_w_inst_vld_m ;
wire    lsu_inst_vld_w ;
wire    lsu_stbrwctl_flush_pipe_w;

//=======================================
//instaniate buffers
//======================================

   wire   ifu_tlu_inst_vld_m_bf0;
   
bw_u1_buf_10x UZfix_ifu_tlu_inst_vld_m_bf0 ( .a(ifu_tlu_inst_vld_m), .z(ifu_tlu_inst_vld_m_bf0) );
bw_u1_buf_30x UZfix_ifu_tlu_inst_vld_m_bf1 ( .a(ifu_tlu_inst_vld_m_bf0), .z(ifu_tlu_inst_vld_m_bf1) );
bw_u1_buf_20x UZfix_ifu_tlu_inst_vld_m_bf2 ( .a(ifu_tlu_inst_vld_m_bf0), .z(ifu_tlu_inst_vld_m_bf2) );
   
assign  flush_w_inst_vld_m =
        ifu_tlu_inst_vld_m_bf0 &
        ~(lsu_stbrwctl_flush_pipe_w & (thrid_m[1:0] == thrid_g[1:0])) ; // really lsu_flush_pipe_w

dff_s  stgw_ivld (
        .din    (flush_w_inst_vld_m),
        .q      (lsu_inst_vld_w),
        .clk    (clk),
        .se   (se),       .si (),          .so ()
        );

   wire other_flush_pipe_w;
   wire tlu_early_flush_pipe_w;
   assign tlu_early_flush_pipe_w = tlu_exu_early_flush_pipe_w;
   
assign	other_flush_pipe_w = 
tlu_early_flush_pipe_w | (lsu_ttype_vld_m2 & lsu_inst_vld_w) |
lsu_defr_trp_taken_g ;
   
   wire lsu_flush_pipe_w;
   
assign	lsu_flush_pipe_w = other_flush_pipe_w | ifu_lsu_flush_w ;
assign 	lsu_stbctl_flush_pipe_w = lsu_flush_pipe_w ;
assign 	lsu_stbrwctl_flush_pipe_w = lsu_flush_pipe_w ;   

//=========================================================================================
//  STB Array Addr/Ctl Generation
//=========================================================================================

assign  ldstub_e = ifu_lsu_ldstub_e ;
assign  casa_e   = ifu_lsu_casa_e ;
assign  ldst_dbl_e = ifu_lsu_ldst_dbl_e ;

assign  alt_space_e = ifu_lsu_alt_space_e ;

//assign  stdbl_e =  ldst_dbl_e & (~alt_space_e | (alt_space_e & ~lsu_quad_asi_e)) ;
assign  stdbl_e =  ldst_dbl_e ;

//   wire lsu_stdbl_inst_m;
   
//dff  stq_stgm (
//  .din  (stdbl_e), 
//  .q  	(lsu_stdbl_inst_m),  
//  .clk  (clk), 
//  .se (se), .si (), .so ()
//  );

// This path can probably be eased.
assign  lsu_stb_data_early_sel_e[0] = ldstub_e  & ~rst_tri_en;
assign  lsu_stb_data_early_sel_e[1] = casa_e & ~rst_tri_en;
assign  lsu_stb_data_early_sel_e[2] = ~(ldstub_e | casa_e |  stdbl_e) | rst_tri_en;
assign  lsu_stb_data_early_sel_e[3] = stdbl_e & ~rst_tri_en ;

// modify for accepting bst data out of pipe.
//assign  stb_data_final_sel_e = ~(ldst_fp_e | ffu_lsu_blk_st_e) ;

/*dff  lsel_g (
  .din  (stb_data_final_sel_e), 
  .q  (lsu_stb_data_final_sel_m),
  .clk  (clk), 
  .se (se), .si (), .so ()
  );*/

assign	lsu_stb_data_final_sel_m = ~(ldst_fp_m | blkst_m) ;

wire	real_st_m ;
wire	flsh_inst_m, flsh_inst_g ;
// !!! could qualify st_inst_vld_e with stxa_internal !!!
dff_s #(13) stgm_vld  (
  .din  ({ld_inst_vld_e,st_inst_vld_e,ldst_sz_e[1:0], 
    ifu_lsu_swap_e, ifu_lsu_ldstub_e, ifu_lsu_casa_e,ifu_lsu_ldst_dbl_e,
    ifu_tlu_thrid_e[1:0],ifu_lsu_ldst_fp_e,lsu_quad_asi_e,ifu_tlu_flsh_inst_e}),  
  .q  ({ld_inst_vld_m,real_st_m,pipe_ldst_sz_m[1:0], 
    swap_m,ldstub_m,casa_m,ldst_dbl_m,thrid_m[1:0],ldst_fp_m,quad_asi_m,flsh_inst_m}),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );

assign	st_inst_vld_m = real_st_m | flsh_inst_m ;

// do we need ld/st unflushed ?
   wire sta_internal_g;
   
dff_s #(7) stgw_vld  (
  .din  ({sta_internal_m,   
    casa_m, thrid_m[1:0],ldst_sz_m[1:0], flsh_inst_m}),  
  .q    ({sta_internal_g,   
    casa_g, thrid_g[1:0],ldst_sz_g[1:0], flsh_inst_g}),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );


// stb-cam will be written by st at rising edge of g-stage.
// However, st can be flushed after write. To keep, the stb state consistent,
// The valid and write ptr will not be updated until the rising edge of w2.

wire	early_flush_cond_g,partial_flush_st_g ;
assign early_flush_cond_g = 
(sta_internal_g | ~(lsu_inst_vld_w | blkst_g) | ffu_lsu_kill_fst_w) ;
assign	flush_st_g = (early_flush_cond_g | lsu_stbrwctl_flush_pipe_w) & cam_wptr_vld_g ;

//timing, send to stb_ctl and qualified by stb_cam_wvld_g (thread version of cam_wptr_vld_g)   
//assign	partial_flush_st_g = early_flush_cond_g & cam_wptr_vld_g ;
assign	partial_flush_st_g = early_flush_cond_g ; 

assign  atomic_m = (casa_m | ldstub_m | swap_m) & st_inst_vld_m ;

// WRITE PTR VALID GENERATION.

// meant specifically to squash pcx_rq_for_stb.
assign  stb_cam_wr_no_ivld_m 
  = (st_inst_vld_m | casa_m | ldstub_m | swap_m | blkst_m) ;

//bug3610 - kill cam write vld(==stb data write vld next cycle) to avoid datat read and write same cycle
//          to the same entry
wire  b2b_st_detect ;

assign  stb_cam_wptr_vld  
  = (((st_inst_vld_m | atomic_m) & ifu_tlu_inst_vld_m_bf0) | blkst_m) & ~(flush_st_g & b2b_st_detect) ;
  //= ((st_inst_vld_m | atomic_m) & ifu_tlu_inst_vld_m_bf0) | blkst_m ;  // bug3610
  //= (st_inst_vld_m | atomic_m | (ldst_dbl_m & st_inst_vld_m) | blkst_m) ;

dff_s  wptr_g (
  .din  (stb_cam_wptr_vld), .q  (cam_wptr_vld_g),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );

//flop move into mem cell (roll back)  
assign  stb_data_wptr_vld = cam_wptr_vld_g ;

// WRITE PTR GENERATION

// It is assumed that if there is a store in the pipe, there is a 
// free entry in the corresponding stb. Otherwise, the pipe would've
// stalled for the thread.      

// If a store-like inst has been flushed, then the old ptr has to be restored
// and used.  This is done within thread specific stb control

assign  thread0_m = ~st_thrid_m[1] & ~st_thrid_m[0] ;
assign  thread1_m = ~st_thrid_m[1] &  st_thrid_m[0] ;
assign  thread2_m =  st_thrid_m[1] & ~st_thrid_m[0] ;
assign  thread3_m =  st_thrid_m[1] &  st_thrid_m[0] ;

dff_s #(4) stgg_thrd (
  .din  ({thread0_m,thread1_m,thread2_m,thread3_m}),  
  .q  ({thread0_g,thread1_g,thread2_g,thread3_g}),  
  .clk  (clk), 
  .se (se), .si (), .so ()
  );

assign	stb_thrd_en_g[0] = thread0_g ;
assign	stb_thrd_en_g[1] = thread1_g ;
assign	stb_thrd_en_g[2] = thread2_g ;
assign	stb_thrd_en_g[3] = thread3_g ;

//assign  stb_wptr[2:0] = 
//  thread0_m ? stb_wrptr0[2:0] :
//    thread1_m ? stb_wrptr1[2:0] :
//      thread2_m ? stb_wrptr2[2:0] :
//        thread3_m ? stb_wrptr3[2:0] : 3'bxxx ;

assign  stb_wptr[2:0] = 
  (thread0_m ? stb_wrptr0[2:0] :  3'b000) |
  (thread1_m ? stb_wrptr1[2:0] :  3'b000) |
  (thread2_m ? stb_wrptr2[2:0] :  3'b000) |
  (thread3_m ? stb_wrptr3[2:0] :  3'b000) ;
   
assign  b2b_st_detect =   // detect back-to-back store
  (thread0_m & thread0_g) |
  (thread1_m & thread1_g) |
  (thread2_m & thread2_g) |
  (thread3_m & thread3_g) ;

assign  cam_wr_ptr[2:0] = (flush_st_g & b2b_st_detect) ? cam_wptr_d1[2:0] : stb_wptr[2:0] ;

dff_s #(3)  wptr_d1 (
  .din  (cam_wr_ptr[2:0]),  .q  (cam_wptr_d1[2:0]),
  .clk  (clk), 
  .se (se), .si (), .so ()
  );

assign  stb_cam_wvld_m[0] = stb_cam_wptr_vld & thread0_m ;
assign  stb_cam_wvld_m[1] = stb_cam_wptr_vld & thread1_m ;
assign  stb_cam_wvld_m[2] = stb_cam_wptr_vld & thread2_m ;
assign  stb_cam_wvld_m[3] = stb_cam_wptr_vld & thread3_m ;

// contains potential flush conditions.
assign  stb_flush_st_g[0] = partial_flush_st_g ;
assign  stb_flush_st_g[1] = partial_flush_st_g ;
assign  stb_flush_st_g[2] = partial_flush_st_g ;
assign  stb_flush_st_g[3] = partial_flush_st_g ;

// stb-data has a delayed write in w2. Alignment of stb data will be done on write
// of 64b into stb. This allows write of stb cam and data to be done in the
// same cycle, and thus read can occur simultaneously for pcx. 

//mem cell change to bw_r_rf32x80, flop move into mem cell (roll back)
//flop outside mem cell
assign  stb_data_wr_ptr[4:0] =  {st_thrid_g[1:0],cam_wptr_d1[2:0]};
   
// RD PTR/VLD GENERATION

// stb read for dfq dumps data into a bypass flop. Thus a read for the dfq can occur
// if a thread's stb has an acked entry and the bypass flop is empty.
// stb read for pcx occurs on availability of queue entry. 

// Both dfq and pcx require a read of the cam and data. The reads
// can thus not happen when load that hits in the stb is in the w2 (change to W3)
// stage and a store is in the g-stage of the pipe. Both
// probabilities are low.

// ??Read for pcx takes priority over dfq. No deadlock can occur
// ??as at some point the pcx reads will be exhausted and the stb
// ??will have to drain itself. The stb is self-regulating in this regard.

// priority of stb read: ld_cam_hit (full raw bypass) > dfq > pcx 

//====================================================================================
//raw bypass timing 
//G/WB                          W2     W3                      W4
//cam_hit(from stb_cam output)  flop   stb_data rd_ptr/rd_vld  read STB_DATA/BYP
//====================================================================================

   wire [1:0] thrid_w2;
   wire [2:0] stb_cam_hit_ptr_w2;
   wire       stb_cam_hit_w2;   
   wire       stb_cam_hit_w;   
   
   //bug3503
   assign stb_cam_hit_w  =  stb_cam_hit & lsu_inst_vld_w & ~lsu_stbrwctl_flush_pipe_w;

dff_s #(6) stb_cam_hit_stg_w2 (
  .din  ({thrid_g[1:0],  stb_cam_hit_ptr[2:0],    stb_cam_hit_w   }), 
  .q  	({thrid_w2[1:0], stb_cam_hit_ptr_w2[2:0], stb_cam_hit_w2}),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );
   
// logic moved to qctl1
// pcx is making request for data in current cycle. Can be multi-hot.
//assign  pcx_any_rq_for_stb = |pcx_rq_for_stb[3:0] ;
//assign  pcx_any_rq_for_stb = 
//	(pcx_rq_for_stb[0] & ~lsu_st_pcx_rq_kill_w2[0]) | 
//	(pcx_rq_for_stb[1] & ~lsu_st_pcx_rq_kill_w2[1]) | 
//	(pcx_rq_for_stb[2] & ~lsu_st_pcx_rq_kill_w2[2]) | 
//	(pcx_rq_for_stb[3] & ~lsu_st_pcx_rq_kill_w2[3]) ; 

// ??ld-cam hit based read takes precedence
// ??Timing : This could be made pessimistic by using ld_inst_vld_g

//assign  stb_select_rptr[3:0] =  pcx_rq_for_stb[3:0] ;  // timing fix
assign  stb_select_rptr[3:0] =  lsu_st_pcx_rq_pick[3:0] ; 

// This could be a critical path. Be careful !
//assign  stb_rdptr0[2:0] = ~dfq_any_rq_for_stb ? stb_pcx_rptr0[2:0] : stb_dfq_rptr0[2:0] ; 
assign  stb_rdptr0[2:0] = stb_pcx_rptr0[2:0] ;
assign  stb_rdptr1[2:0] = stb_pcx_rptr1[2:0] ;
assign  stb_rdptr2[2:0] = stb_pcx_rptr2[2:0] ;
assign  stb_rdptr3[2:0] = stb_pcx_rptr3[2:0] ;

// logic moved to qctl1
//wire  [1:0] stb_rd_tid ;
//
//assign  stb_rd_tid[0] = pcx_rq_for_stb[1] | pcx_rq_for_stb[3] ;
//assign  stb_rd_tid[1] = pcx_rq_for_stb[2] | pcx_rq_for_stb[3] ;
//   
//dff #(2) stbtid_stgd1 (
//  .din    (stb_rd_tid[1:0]),  .q  (lsu_stb_rd_tid[1:0]),
//  .clk    (clk), 
//  .se   (se), .si (), .so ()
//  );

//assign  stb_dfq_rd_id[2:0] = stb_data_rd_ptr[2:0] ; // or cam rd ptr

//timing fix:5/6/03
//bug4988 - change the prirority from 0->3 to 3->0; the reason is when select_rptr=0, the
//          default thread id(rptr[4:3])=thread0 but the default rptr[2:0]=thread3. If
//          thread0 and thread3 rptr are the same and the thread0 write is occuring, the
//          rptr[4:0] is same as wptr[4:0]
wire  [2:0]  stb_rdptr ;
//assign  stb_rdptr[2:0] = 
//  stb_select_rptr[0] ? stb_rdptr0[2:0] :
//    stb_select_rptr[1] ? stb_rdptr1[2:0] :
//      stb_select_rptr[2] ? stb_rdptr2[2:0] :
//                             stb_rdptr3[2:0] ;

//assign  stb_rdptr[2:0] = 
//  stb_select_rptr[3] ? stb_rdptr3[2:0] :
//    stb_select_rptr[2] ? stb_rdptr2[2:0] :
//      stb_select_rptr[1] ? stb_rdptr1[2:0] :
//                             stb_rdptr0[2:0] ;

assign  stb_rdptr[2:0] = 
  (stb_select_rptr[3] ? stb_rdptr3[2:0] : 3'b0) |
  (stb_select_rptr[2] ? stb_rdptr2[2:0] : 3'b0) |
  (stb_select_rptr[1] ? stb_rdptr1[2:0] : 3'b0) |
  (stb_select_rptr[0] ? stb_rdptr0[2:0] : 3'b0) ;
    
//timing fix: 8/29/03 - remove the default select logic for stb_select_rptr since synthesis is forced to replace 
//            4to1 mux w/ and-or mux or 2to1 mux
//wire   stb_select_rptr_b3;
//assign stb_select_rptr_b3 =  ~|stb_select_rptr[2:0];

wire  [2:0]  stb_rdptr_l;

assign stb_rdptr_l[2:0] =  ~stb_rdptr[2:0] ;
//bw_u1_muxi41d_2x  UZsize_stb_rdptr_b0_mux(
//                  .z(stb_rdptr_l[0]), 
//                  .d0(stb_rdptr0[0]), 
//                  .d1(stb_rdptr1[0]), 
//                  .d2(stb_rdptr2[0]), 
//                  .d3(stb_rdptr3[0]), 
//                  .s0(stb_select_rptr[0]), 
//                  .s1(stb_select_rptr[1]), 
//                  .s2(stb_select_rptr[2]), 
//                  .s3(stb_select_rptr[3]));
//   
//bw_u1_muxi41d_2x  UZsize_stb_rdptr_b1_mux(
//                  .z(stb_rdptr_l[1]), 
//                  .d0(stb_rdptr0[1]), 
//                  .d1(stb_rdptr1[1]), 
//                  .d2(stb_rdptr2[1]), 
//                  .d3(stb_rdptr3[1]), 
//                  .s0(stb_select_rptr[0]), 
//                  .s1(stb_select_rptr[1]), 
//                  .s2(stb_select_rptr[2]), 
//                  .s3(stb_select_rptr[3]));
//   
//bw_u1_muxi41d_2x  UZsize_stb_rdptr_b2_mux(
//                  .z(stb_rdptr_l[2]), 
//                  .d0(stb_rdptr0[2]), 
//                  .d1(stb_rdptr1[2]), 
//                  .d2(stb_rdptr2[2]), 
//                  .d3(stb_rdptr3[2]), 
//                  .s0(stb_select_rptr[0]), 
//                  .s1(stb_select_rptr[1]), 
//                  .s2(stb_select_rptr[2]), 
//                  .s3(stb_select_rptr[3]));
//   
   
assign  stb_rd_thrid[0] = stb_select_rptr[1] | stb_select_rptr[3] ;
assign  stb_rd_thrid[1] = stb_select_rptr[2] | stb_select_rptr[3] ;

// read
// this mux will have to be accommodated in path !!! Talk to Satya. 
// Timing : This could be made pessimistic by using ld_inst_vld_g

// raw read STB at W3 (changed from W2)        
assign  stb_data_rd_ptr[4:0] = stb_cam_hit_w2 ? 
        {thrid_w2[1:0],stb_cam_hit_ptr_w2[2:0]} :  // rd based on ld hit
        {stb_rd_thrid[1:0],~stb_rdptr_l[2:0]} ;       // rd for pcx or dfq
   
// Blk-st modification for thread.
assign	st_thrid_m[1:0] = blkst_m ? ffu_lsu_blk_st_tid_m[1:0] : thrid_m[1:0] ;
dff_s #(2)  stid_stgg (
  .din  (st_thrid_m[1:0]), 
  .q  	(st_thrid_g[1:0]),
  .clk  (clk), 
  .se (se), .si (), .so ()
  );

//timing fix: 5/6/03
//assign  stb_cam_rw_ptr[4:0]  = stb_cam_wptr_vld ? 
//        {st_thrid_m[1:0],cam_wr_ptr[2:0]} :  // write
//        {stb_rd_thrid[1:0],stb_rdptr[2:0]} ;  // read

wire [2:0] cam_wr_ptr_l;
wire [1:0] stb_rd_thrid_l;
wire [1:0] st_thrid_m_l;

assign cam_wr_ptr_l[2:0]  =  ~cam_wr_ptr[2:0];
assign stb_rd_thrid_l[1:0]  =  ~stb_rd_thrid[1:0];
assign st_thrid_m_l[1:0]  =  ~st_thrid_m[1:0];

bw_u1_muxi21_2x  UZsize_stb_cam_rw_ptr_b0_mux(
                  .z(stb_cam_rw_ptr[0]), 
                  .d0(stb_rdptr_l[0]), 
                  .d1(cam_wr_ptr_l[0]), 
                  .s(stb_cam_wptr_vld));
   
bw_u1_muxi21_2x  UZsize_stb_cam_rw_ptr_b1_mux(
                  .z(stb_cam_rw_ptr[1]), 
                  .d0(stb_rdptr_l[1]), 
                  .d1(cam_wr_ptr_l[1]), 
                  .s(stb_cam_wptr_vld));
   
bw_u1_muxi21_2x  UZsize_stb_cam_rw_ptr_b2_mux(
                  .z(stb_cam_rw_ptr[2]), 
                  .d0(stb_rdptr_l[2]), 
                  .d1(cam_wr_ptr_l[2]), 
                  .s(stb_cam_wptr_vld));
   
bw_u1_muxi21_2x  UZsize_stb_cam_rw_ptr_b3_mux(
                  .z(stb_cam_rw_ptr[3]), 
                  .d0(stb_rd_thrid_l[0]), 
                  .d1(st_thrid_m_l[0]), 
                  .s(stb_cam_wptr_vld));
   
bw_u1_muxi21_2x  UZsize_stb_cam_rw_ptr_b4_mux(
                  .z(stb_cam_rw_ptr[4]), 
                  .d0(stb_rd_thrid_l[1]), 
                  .d1(st_thrid_m_l[1]), 
                  .s(stb_cam_wptr_vld));
   


//raw read STB at W3 (not W2)
//timing fix: 9/2/03 - reduce fanout in stb_rwctl for lsu_st_pcx_rq_pick - gen separate signal for
//                     stb_cam_rptr_vld and stb_data_rptr_vld

//bug4988 - qual lsu_st_pcx_rq_vld w/ no write vld to stb_data. use stb_cam_wr_no_ivld_m instead of write vld.
//          this is the same signal used to kill pcx_rq_for_stb
//          stb_cam_rptr_vld is not set if stb_cam_wptr_vld=1
     
assign  stb_data_rptr_vld = 
  //(|stb_select_rptr[3:0]) |  // pcx/dfq rd - timing fix
  //lsu_st_pcx_rq_vld |  // pcx/dfq rd  // bug4988
   (lsu_st_pcx_rq_vld & ~stb_cam_wr_no_ivld_m) |  // pcx/dfq rd
    stb_cam_hit_w2 ;         // cam hit requires read whether single or multiple

//raw read STB at W3 (not W2)      
//timing fix: 9/2/03 - reduce fanout in stb_rwctl for lsu_st_pcx_rq_pick - gen separate signal for
//                     stb_cam_rptr_vld and stb_data_rptr_vld
assign  stb_cam_rptr_vld = 
  //((|stb_select_rptr[3:0]) & ~(stb_cam_hit_w2)) & // only pcx read  - timing fix
  (lsu_st_pcx_rq_vld & ~(stb_cam_hit_w2)) & // only pcx read 
      ~stb_cam_wptr_vld ;   // st,st-like write does not block
   
// lsu_stb_rd_vld_d1 - not used
//dff  stbrd_stgd1  (
//  .din    (stb_cam_rptr_vld), .q  (lsu_stb_rd_vld_d1),
//  .clk    (clk), 
//  .se   (se), .si (), .so ()
//  );

// logic moved to qctl1
//dff #(1)  prvld_stgd1 (
//  .din  (pcx_any_rq_for_stb), 
//  .q  (lsu_stb_pcx_rvld_d1),
//  .clk  (clk), 
//  .se (se), .si (), .so ()
//  );

assign  stb_cam_cm_tid[1:0] = thrid_m[1:0] ;


//=========================================================================================
//  BYTE MASK FORMATTING
//=========================================================================================


// Write/CAM Data for CAM RAM.
// Physical dword aligned addr - PA[39:3] (37b)
// Byte Mask - (8b)
// Total - 45b

//  | b7  |  b6 | b5  | b4  | b3  | b2  | b1  | b0  |
//  |   hw3 |   hw2 |   hw1 |   hw0 |
//  |     w1    |   w0    |
//  |       dw        | 



//dff  #(11) va_m (
//  .din    (exu_lsu_ldst_va_e[10:0]),  .q  (pipe_ldst_va_m[10:0]),
//  .clk    (clk), 
//  .se   (se), .si (), .so ()
//  );

assign pipe_ldst_va_m[9:0] = lsu_ldst_va_m[9:0];

// ldst_byte may not be needed
assign ldst_byte = ~ldst_sz_m[1] & ~ldst_sz_m[0] ;  // 00
assign ldst_hwrd = ~ldst_sz_m[1] &  ldst_sz_m[0] ;  // 01
assign ldst_word =  ldst_sz_m[1] & ~ldst_sz_m[0] ;  // 10
assign ldst_dwrd =  ldst_sz_m[1] &  ldst_sz_m[0] ;  // 11

// Note : dword term is common. 
assign ldst_byte_mask[0]  =
  ( ldst_va_m[2] &  ldst_va_m[1] &  ldst_va_m[0] )       |
  ( ldst_va_m[2] &  ldst_va_m[1] & ~ldst_va_m[0] & (ldst_hwrd)) |
  ( ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_word))  |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd))  ; 
assign ldst_byte_mask[1]  =
  ( ldst_va_m[2] &  ldst_va_m[1] & ~ldst_va_m[0])        |
  ( ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_word))  |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd))  ; 
assign ldst_byte_mask[2]  =
  ( ldst_va_m[2] & ~ldst_va_m[1] &  ldst_va_m[0])         |
  ( ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_hwrd | ldst_word))  |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd))  ; 
assign ldst_byte_mask[3]  =
  ( ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0])       |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd))  ; 
assign ldst_byte_mask[4]  =
  (~ldst_va_m[2] &  ldst_va_m[1] &  ldst_va_m[0])        |
  (~ldst_va_m[2] &  ldst_va_m[1] & ~ldst_va_m[0] & (ldst_hwrd)) |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd | ldst_word)) ;
assign ldst_byte_mask[5]  =
  (~ldst_va_m[2] &  ldst_va_m[1] & ~ldst_va_m[0])         |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] &  (ldst_dwrd | ldst_word))  ;
assign ldst_byte_mask[6]  =
  (~ldst_va_m[2] & ~ldst_va_m[1] &  ldst_va_m[0])     |
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0] & (ldst_dwrd | ldst_word | ldst_hwrd)) ;
assign ldst_byte_mask[7]  =
  (~ldst_va_m[2] & ~ldst_va_m[1] & ~ldst_va_m[0])   ;

assign  stb_ldst_byte_msk[7:0]  = ldst_byte_mask[7:0]; 

   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b0 (.a(ldst_byte_mask[0]), .z(stb_ldst_byte_msk_min[0]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b1 (.a(ldst_byte_mask[1]), .z(stb_ldst_byte_msk_min[1]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b2 (.a(ldst_byte_mask[2]), .z(stb_ldst_byte_msk_min[2]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b3 (.a(ldst_byte_mask[3]), .z(stb_ldst_byte_msk_min[3]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b4 (.a(ldst_byte_mask[4]), .z(stb_ldst_byte_msk_min[4]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b5 (.a(ldst_byte_mask[5]), .z(stb_ldst_byte_msk_min[5]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b6 (.a(ldst_byte_mask[6]), .z(stb_ldst_byte_msk_min[6]));
   bw_u1_minbuf_5x UZfix_stb_ldst_byte_msk_min_b7 (.a(ldst_byte_mask[7]), .z(stb_ldst_byte_msk_min[7]));
   
   
// Generate selects to format st data
assign  lsu_st_sz_bhww_m = ldst_byte | ldst_hwrd | ldst_word ;      // byte or hword or word
assign  lsu_st_sz_dw_m   = ldst_dwrd ;            // double word
assign  lsu_st_sz_bhw_m  = ldst_byte | ldst_hwrd ;      // byte or hword
assign  lsu_st_sz_wdw_m  = ldst_word | ldst_dwrd ;      // word or dword
assign  lsu_st_sz_b_m    = ldst_byte ;            // byte
assign  lsu_st_sz_w_m    = ldst_word ;            // word
assign  lsu_st_sz_hw_m   = ldst_hwrd ;            // hword
assign  lsu_st_sz_hww_m  = ldst_hwrd | ldst_word ;      // hword or word

//=========================================================================================
//  BLK-ST HANDLING
//=========================================================================================

wire	blkst_m_tmp ;
dff_s  stgm_bst (
  .din (ffu_lsu_blk_st_e),
  .q   (blkst_m_tmp),
  .clk (clk),
  .se   (se),       .si (),          .so ()
);

assign	blkst_m = blkst_m_tmp & ~(real_st_m  | flsh_inst_m |
		ld_inst_vld_m) ; // Bug 3444

dff_s  stgg_bst (
  .din (blkst_m),
  .q   (blkst_g),
  .clk (clk),
  .se   (se),       .si (),          .so ()
);

wire	snap_blk_st_local_m ;
assign	snap_blk_st_local_m = lsu_snap_blk_st_m & ifu_tlu_inst_vld_m_bf0 ;

wire	[1:0]	bst_sz_m ;
wire	[9:0]	bst_va_m ;
// output to be used in m-stage.
dffe_s #(9) bst_state_m (
        .din    ({ldst_sz_m[1:0],ldst_va_m[9:6],ldst_va_m[2:0]}),
        .q      ({bst_sz_m[1:0],bst_va_m[9:6],bst_va_m[2:0]}),
        .en     (snap_blk_st_local_m),
        .clk    (clk),
        .se   (se),       .si (),          .so ()
        );

dff_s #(3)  bsva_stgm (
  .din    (ffu_lsu_blk_st_va_e[5:3]), .q (bst_va_m[5:3]),
  .clk    (clk), 
  .se   (se), .si (), .so ()
  );

//assign	bst_va_m[5:3]	= ffu_lsu_blk_st_va_e[5:3] ;

//assign  ldst_va_m[10] =  pipe_ldst_va_m[10] ;
assign  ldst_va_m[9:0] = blkst_m ?  bst_va_m[9:0] : pipe_ldst_va_m[9:0] ;

assign	lsu_stb_va_m[9:3] = ldst_va_m[9:3] ;

assign	ldst_sz_m[1:0]	=  blkst_m ? bst_sz_m[1:0] : pipe_ldst_sz_m[1:0] ;

//=========================================================================================
//  WRITE DATA FOR DATA RAM
//=========================================================================================

// Write Data for DATA RAM.
// Data - (64b)
// (8b parity is generated on read)
// Rqtype - (3b)
// Size - (3b). 
// Addr - (3b). Lower 3b of 40b addr.
// (set index and way available from ctl state.
// Total - 73b.

// st-quad requires own encoding.
// assume does not have to be changed for blk-st
assign  st_rq_type_m[2:0] =
                casa_m ? 3'b010 :                       // cas pkt 1
                        (ldstub_m | swap_m) ? 3'b110 :  // ldstub/swap
                          //(stquad_m)  ? 3'b111 :  // stquad-pkt1
                                  3'b001 ;        // normal store or partial interrupt rq type

//assign  lsu_st_rq_type_m[2:0] = st_rq_type_m[2:0] ;
assign  lsu_st_rq_type_m[2:1] = st_rq_type_m[2:1] ;

// Need ASI decode
/*wire	lsu_stquad_inst_m ;
assign  lsu_stquad_inst_m = ldst_dbl_m & st_inst_vld_m & quad_asi_m ; 
*/

wire	st_rmo_m,st_rmo_g ;
assign	st_rmo_m = lsu_st_rmo_m | blkst_m ; // binit and blk rmo stores.
wire bst_in_pipe_g;
dff_s #(9)  stgg_etc  (
  .din    ({ldst_va_m[3:0],st_rq_type_m[2:0],st_rmo_m,lsu_bst_in_pipe_m}), 
  .q      ({ldst_va_g[3:0],st_rq_type_g[2:0],st_rmo_g,bst_in_pipe_g}),
  .clk    (clk), 
  .se   (se), .si (), .so ()
  );

wire	bst_any_helper ;
assign	bst_any_helper = blkst_g | bst_in_pipe_g ; // Bug 3934

// Size will have to be changed to 2bits.
// 7 more bits could be added to data ram to save read of cam in providing dfq pkt !!! 
assign stb_wdata_ramd_b75_b64[75:64]   = 
  {st_rmo_g,st_rq_type_g[2:0],flsh_inst_g,bst_any_helper,ldst_sz_g[1:0],ldst_va_g[3:0]}; 
	// Bug3395, 3934

//=========================================================================================
//  FULL/PARTIAL RAW CALCULATION
//=========================================================================================

// io load cannot bypass from stb. A stb hit results in an io-ld being treated
// as a partial-raw. (OR should it be serialized behind any io store ??)
wire	io_ld,io_ld_w2 ;
assign	io_ld = tlb_pgnum_b39_g ; // Bug 4362

// full-raw is squashed on multiple hits in stb. Treated like partial raw.
// Ensure that all ld and ld-like instructions signal ld_inst_vld. We can then
// remove qualification with ld_inst_vld_g.
/*assign  ld_stb_full_raw_g = 
	(|stb_ld_full_raw[7:0]) & ~(stb_cam_mhit | ldq_hit_g | io_ld) ;
assign  ld_stb_full_raw_g[0] = (|stb_ld_full_raw[7:0]) & ld_inst_vld_g & 
          ~(stb_cam_mhit | ldq_hit_g[0] | io_ld) & thread0_g ;
          //~(ld_raw_mhit | ld_stq_hit_g[0] | io_ld) & thread0_g ;
assign  ld_stb_full_raw_g[1] = (|stb_ld_full_raw[7:0]) & ld_inst_vld_g & 
          ~(stb_cam_mhit | ldq_hit_g[1] | io_ld) & thread1_g ;
assign  ld_stb_full_raw_g[2] = (|stb_ld_full_raw[7:0]) & ld_inst_vld_g & 
          ~(stb_cam_mhit | ldq_hit_g[2] | io_ld) & thread2_g ;
assign  ld_stb_full_raw_g[3] = (|stb_ld_full_raw[7:0]) & ld_inst_vld_g & 
          ~(stb_cam_mhit | ldq_hit_g[3] | io_ld) & thread3_g ; */
// Multiple full raws are also treated like a partial.
/*assign  ld_stb_partial_raw_g = 
	((|stb_ld_partial_raw[7:0]) | stb_cam_mhit | ldq_hit_g | (io_ld & stb_not_empty)) ;
assign  ld_stb_partial_raw_g[0] = 
	((|stb_ld_partial_raw[7:0]) | stb_cam_mhit | ldq_hit_g[0] | (io_ld & stb_not_empty)) 
          & ld_inst_vld_g & thread0_g ;
assign  ld_stb_partial_raw_g[1] = 
	((|stb_ld_partial_raw[7:0]) | stb_cam_mhit | ldq_hit_g[1] | (io_ld & stb_not_empty)) 
          & ld_inst_vld_g & thread1_g ;
assign  ld_stb_partial_raw_g[2] = 
	((|stb_ld_partial_raw[7:0]) | stb_cam_mhit | ldq_hit_g[2] | (io_ld & stb_not_empty)) 
          & ld_inst_vld_g & thread2_g ;
assign  ld_stb_partial_raw_g[3] = 
	((|stb_ld_partial_raw[7:0]) | stb_cam_mhit | ldq_hit_g[3] | (io_ld & stb_not_empty)) 
          & ld_inst_vld_g & thread3_g; */

//=========================================================================================
//  STQ HANDLING
//=========================================================================================

/*	REMOVE STQUAD */

//=========================================================================================
//	LD QUAD HANDLING
//=========================================================================================

dff_s  altsp_stgm (
  .din    (alt_space_e), .q (alt_space_m),
  .clk    (clk), 
  .se   (se), .si (), .so ()
  );

assign  lsu_ldquad_inst_m = ldst_dbl_m & ld_inst_vld_m & quad_asi_m & alt_space_m ; 

/*wire	ldquad_inst_g ;
dff_s  ldq_stgg (
  .din    (lsu_ldquad_inst_m), .q (ldquad_inst_g),
  .clk    (clk), 
  .se   (se), .si (), .so ()
  );

wire	ldq_stb_cam_hit ;
assign	ldq_stb_cam_hit = stb_cam_hit & ldquad_inst_g ;
// Terms can be made common.
assign  ldq_hit_g = ldq_stb_cam_hit ; */
/*assign  ldq_hit_g[0] = thread0_g & ldq_stb_cam_hit ;
assign  ldq_hit_g[1] = thread1_g & ldq_stb_cam_hit ;
assign  ldq_hit_g[2] = thread2_g & ldq_stb_cam_hit ;
assign  ldq_hit_g[3] = thread3_g & ldq_stb_cam_hit ; */

//=========================================================================================
//  STB MULTIPLE HIT GENERATION
//=========================================================================================

// Multiple hits in stb is to be treated as a partial raw case. The ld however must wait
// until the youngest store which hit exits the stb. A ptr needs to be calculated for this case.
// A version of stb_wptr is used instead because it is easily available. (Would this have
// any significant performance impact ? - No)

assign  ld_any_raw_vld[7:0] = stb_ld_full_raw[7:0] | stb_ld_partial_raw[7:0] ;

dff_s #(16)  stgw2_rvld (
        .din    ({ld_any_raw_vld[7:0],stb_state_ced[7:0]}),
        .q    	({ld_any_raw_vld_d1[7:0],stb_state_ced_d1[7:0]}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );


// This equation can be optimized for the grape flow.
// This can be obtained from stb.
/*assign  ld_raw_mhit =
  (ld_any_raw_vld[7] & |(ld_any_raw_vld[6:0])) |
  (ld_any_raw_vld[6] & |(ld_any_raw_vld[5:0])) |
  (ld_any_raw_vld[5] & |(ld_any_raw_vld[4:0])) |
  (ld_any_raw_vld[4] & |(ld_any_raw_vld[3:0])) |
  (ld_any_raw_vld[3] & |(ld_any_raw_vld[2:0])) |
  (ld_any_raw_vld[2] & |(ld_any_raw_vld[1:0])) |
  (ld_any_raw_vld[1] &   ld_any_raw_vld[0]) ; */

//=========================================================================================
//  STB Partial Raw ptr generation
//=========================================================================================

// The loading on the raw output of the stb cam will be significant if the signal 
// has to fan out to all 4 ctl blocks. That's why the control has to be localized.

// Using the ack bit may result in pessimistic issue of partial raw loads.
// For a single partial raw or multiple hit case, detecting whether there is any
// unacked store is sufficient. Calculation is for no unacked store.
// Can we use cam_hit ptr instead !!!

//assign  ld_rawp_st_ced_w2 = (~(|(ld_any_raw_vld_d1[7:0] & ~stb_state_ced_d1[7:0]))) ;
wire [2:0] wptr_prev ;
assign	wptr_prev[2:0] = stb_wptr_prev[2:0] ;
wire [7:0] wptr_dcd ; // Bug 4294
assign	wptr_dcd[0] = ~wptr_prev[2] & ~wptr_prev[1] & ~wptr_prev[0] ;
assign	wptr_dcd[1] = ~wptr_prev[2] & ~wptr_prev[1] &  wptr_prev[0] ;
assign	wptr_dcd[2] = ~wptr_prev[2] &  wptr_prev[1] & ~wptr_prev[0] ;
assign	wptr_dcd[3] = ~wptr_prev[2] &  wptr_prev[1] &  wptr_prev[0] ;
assign	wptr_dcd[4] =  wptr_prev[2] & ~wptr_prev[1] & ~wptr_prev[0] ;
assign	wptr_dcd[5] =  wptr_prev[2] & ~wptr_prev[1] &  wptr_prev[0] ;
assign	wptr_dcd[6] =  wptr_prev[2] &  wptr_prev[1] & ~wptr_prev[0] ;
assign  wptr_dcd[7] =  wptr_prev[2] &  wptr_prev[1] &  wptr_prev[0] ;

wire iold_st_ced_g,iold_st_ced_w2 ;
assign	iold_st_ced_g = |(wptr_dcd[7:0] & stb_state_ced[7:0]) ;

dff_s #(2)   ioldced_stgw2  (
  .din  ({iold_st_ced_g,io_ld}), 
  .q 	({iold_st_ced_w2,io_ld_w2}),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );

assign  ld_rawp_st_ced_w2 = 
	io_ld_w2 ? iold_st_ced_w2 :
	(~(|(ld_any_raw_vld_d1[7:0] & ~stb_state_ced_d1[7:0]))) ;

// For the case of a single partial raw.
assign  ld_rawp_stb_id[0] = stb_cam_hit_ptr[0] ;
assign  ld_rawp_stb_id[1] = stb_cam_hit_ptr[1] ;
assign  ld_rawp_stb_id[2] = stb_cam_hit_ptr[2] ;
/*assign  ld_rawp_stb_id[0] = stb_ld_partial_raw[1] | stb_ld_partial_raw[3] |
        stb_ld_partial_raw[5] | stb_ld_partial_raw[7] ;
assign  ld_rawp_stb_id[1] = stb_ld_partial_raw[2] | stb_ld_partial_raw[3] |
        stb_ld_partial_raw[6] | stb_ld_partial_raw[7] ;
assign  ld_rawp_stb_id[2] = stb_ld_partial_raw[4] | stb_ld_partial_raw[5] |
        stb_ld_partial_raw[6] | stb_ld_partial_raw[7] ; */

   wire [3:0] pipe_thread_g;
   assign     pipe_thread_g[0] = ~thrid_g[1] & ~thrid_g[0];
   assign     pipe_thread_g[1] = ~thrid_g[1] &  thrid_g[0];
   assign     pipe_thread_g[2] =  thrid_g[1] & ~thrid_g[0];
   assign     pipe_thread_g[3] =  thrid_g[1] &  thrid_g[0];
 
assign  stb_state_ced[7:0] = 
( pipe_thread_g[0] ? stb_state_ced0[7:0] : 8'b0 ) |
( pipe_thread_g[1] ? stb_state_ced1[7:0] : 8'b0 ) |
( pipe_thread_g[2] ? stb_state_ced2[7:0] : 8'b0 ) |
( pipe_thread_g[3] ? stb_state_ced3[7:0] : 8'b0 );

assign  stb_wptr_prev[2:0] = 
  (pipe_thread_g[0] ? stb_wrptr0_prev[2:0] : 3'b0) |
  (pipe_thread_g[1] ? stb_wrptr1_prev[2:0] : 3'b0) |
  (pipe_thread_g[2] ? stb_wrptr2_prev[2:0] : 3'b0) |
  (pipe_thread_g[3] ? stb_wrptr3_prev[2:0] : 3'b0);

assign  stb_not_empty  =
  (pipe_thread_g[0]  & ~lsu_stb_empty[0] ) | 
  (pipe_thread_g[1]  & ~lsu_stb_empty[1] ) |
  (pipe_thread_g[2]  & ~lsu_stb_empty[2] ) |
  (pipe_thread_g[3]  & ~lsu_stb_empty[3] ) ;

assign	lsu_stb_empty_buf[3:0] = lsu_stb_empty[3:0] ;
assign	lsu_spu_stb_empty[3:0] = lsu_stb_empty[3:0] ;

//wire ldstdbl_g ;
// stdbl should be qualified with quad_asi_g !!!
//assign  ldstdbl_g = ldst_dbl_g & (ld_inst_vld_g | st_inst_vld_g) & ~ldst_fp_g ;

// casa_g and stdbl_g may not be required.
//assign  ld_rawp_st_ackid_g[2:0] = 
//  (casa_g | ldstdbl_g | stb_cam_mhit | (io_ld & stb_not_empty))
//  ? stb_wptr_prev[2:0] : ld_rawp_stb_id[2:0] ;

//===================================================
//casa: need st-st order
//st cam mhit: cannot figure out the youngest
//io: side effect
//remove int ldd and quad ldd, why need ldstdbl?
//===================================================
wire	[2:0]	ld_rawp_st_ackid_g ;

assign  ld_rawp_st_ackid_g[2:0] = 
  (casa_g | stb_cam_mhit | (io_ld & stb_not_empty))?
   stb_wptr_prev[2:0] : ld_rawp_stb_id[2:0] ;
   
dff_s #(3)  rawpackid_w2 (
  .din  (ld_rawp_st_ackid_g[2:0]), 
  .q 	(ld_rawp_st_ackid_w2[2:0]),
  .clk  (clk), 
  .se   (se), .si (), .so ()
  );


   assign lsu_ifu_stbcnt0[3:0] = lsu_stbcnt0[3:0] ;
   assign lsu_ifu_stbcnt1[3:0] = lsu_stbcnt1[3:0] ;
   assign lsu_ifu_stbcnt2[3:0] = lsu_stbcnt2[3:0] ;
   assign lsu_ifu_stbcnt3[3:0] = lsu_stbcnt3[3:0] ;

   assign lsu_ffu_stb_full0 =    lsu_stbcnt0[3];
   assign lsu_ffu_stb_full1 =    lsu_stbcnt1[3];
   assign lsu_ffu_stb_full2 =    lsu_stbcnt2[3];
   assign lsu_ffu_stb_full3 =    lsu_stbcnt3[3];
   
endmodule

