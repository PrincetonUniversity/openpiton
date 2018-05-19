// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_stb_ctl.v
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
///////////////////////////////////////////////////////////////////////
/*
//	Description:	Control for STB of LSU
//				- Contains control for a single STB currently.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the 
					// time scale definition

`include "iop.h"
////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu_stb_ctl (/*AUTOARG*/
   // Outputs
   so, stb_clk_en_l, stb_crnt_ack_id, lsu_stb_empty, stb_l2bnk_addr, 
   stb_atm_rq_type, stb_wrptr, stb_rd_for_pcx, stb_pcx_rptr, 
   stb_wrptr_prev, stb_state_ced_mod, stb_state_vld_out, 
   lsu_stbcnt, stb_rmo_st_issue, stb_full, st_pcx_rq_kill_w2, 
   // Inputs
   rclk, grst_l, arst_l, si, se, thrd_en_g, cpx_st_ack_tid, 
   pcx_rq_for_stb, st_ack_dq_stb, stb_flush_st_g, stb_cam_wvld_m, 
   lsu_blk_st_m, tlb_pgnum_g, pcx_req_squash, flshinst_rst, 
   lsu_stbctl_flush_pipe_w, flsh_inst_m, stb_state_si_0, 
   stb_state_si_1, stb_state_si_2, stb_state_si_3, stb_state_si_4, 
   stb_state_si_5, stb_state_si_6, stb_state_si_7, stb_state_rtype_0, 
   stb_state_rtype_1, stb_state_rtype_2, stb_state_rtype_3, 
   stb_state_rtype_4, stb_state_rtype_5, stb_state_rtype_6, 
   stb_state_rtype_7, stb_state_rmo, stb_alt_sel, stb_alt_addr, 
   lsu_dtlb_bypass_e, tlb_cam_hit, lsu_outstanding_rmo_st_max,
   st_dtlb_perr_g
   ) ;	


   input rclk ;			
   input grst_l;
   input arst_l;
   
   input si;
   input se;
   output so;
   
input		thrd_en_g ;
input		cpx_st_ack_tid ;	// st ack for given thread
input		pcx_rq_for_stb ;	// stb's st selected for read for pcx
input		st_ack_dq_stb ;		// store dequeued from stb
input		stb_flush_st_g ;	// flush stb write in cycle g
input		stb_cam_wvld_m ;	// stb write in cycle m

input		lsu_blk_st_m ;		// blk st wr

//input  [7:6]    lsu_ldst_va_m ;         // staging purposes
//input  [2:1]    lsu_st_rq_type_m ;	// st request type
//input		lsu_st_rmo_m ;		// rmo store in m-stage

input  [39:37]  tlb_pgnum_g ;  	        // ldst access to io 
input		pcx_req_squash ;	// pcx req is squashed

input		flshinst_rst ;		// reset by flush inst on return
input		lsu_stbctl_flush_pipe_w ;

   input flsh_inst_m;
   

//from stb_ctldp
   input [3:2] stb_state_si_0;
   input [3:2] stb_state_si_1;
   input [3:2] stb_state_si_2;
   input [3:2] stb_state_si_3;
   input [3:2] stb_state_si_4;
   input [3:2] stb_state_si_5;
   input [3:2] stb_state_si_6;
   input [3:2] stb_state_si_7;

   input [2:1] stb_state_rtype_0;
   input [2:1] stb_state_rtype_1;
   input [2:1] stb_state_rtype_2;
   input [2:1] stb_state_rtype_3;
   input [2:1] stb_state_rtype_4;
   input [2:1] stb_state_rtype_5;
   input [2:1] stb_state_rtype_6;
   input [2:1] stb_state_rtype_7;

   //input [7:0] stb_state_io;
   input [7:0] stb_state_rmo;

   input       stb_alt_sel ;
   input [2:0] stb_alt_addr ;

input          lsu_dtlb_bypass_e;
input          tlb_cam_hit;		// m-cycle

input		st_dtlb_perr_g ;	// enabled st dtlb parity err.
 
   //output      stb_non_l2bnk;
   output [7:0] stb_clk_en_l;
  
output  [2:0]   stb_crnt_ack_id ;       // ackid for current outstanding st.

output		lsu_stb_empty ;		// stb is empty

output	[2:0]	stb_l2bnk_addr ;	// l2bank address.	
output	[2:1]	stb_atm_rq_type ;	// identify atomic transaction

output	[2:0]	stb_wrptr ;		// write ptr - per thread
//output	[2:0]	stb_dfq_rptr ;		// rptr for dfq - per thread
output		stb_rd_for_pcx ; 	// rd vld for pcx - per thread
output	[2:0]	stb_pcx_rptr ;		// rptr for pcx - per thread
output	[2:0]	stb_wrptr_prev ;
output  [7:0]   stb_state_ced_mod ;
output  [7:0]   stb_state_vld_out ;

output	[3:0]	lsu_stbcnt ;	// # of vld entries

output		stb_rmo_st_issue ;		// rmo store issued from thread's stb.

output		stb_full ;
output		st_pcx_rq_kill_w2 ;

   input  lsu_outstanding_rmo_st_max;
   
   wire [7:0] stb_state_rst;
   
   wire [7:0] stb_state_vld;
   wire [7:0] stb_state_vld_din;
   wire [7:0] stb_state_vld_set;
   
   wire [7:0] stb_state_ced;
   wire [7:0] stb_state_ced_din;
   wire [7:0] stb_state_ced_set;

   wire [7:0] stb_state_ack;
   wire [7:0] stb_state_ack_din;
   wire [7:0] stb_state_ack_set;

   wire [3:2] stb_state_si_0;	// removed 8x4 bits
   wire [3:2] stb_state_si_1;
   wire [3:2] stb_state_si_2;
   wire [3:2] stb_state_si_3;
   wire [3:2] stb_state_si_4;
   wire [3:2] stb_state_si_5;
   wire [3:2] stb_state_si_6;
   wire [3:2] stb_state_si_7;
/*
   wire [3:2] stb_state_si_0_din;
   wire [3:2] stb_state_si_1_din;
   wire [3:2] stb_state_si_2_din;
   wire [3:2] stb_state_si_3_din;
   wire [3:2] stb_state_si_4_din;
   wire [3:2] stb_state_si_5_din;
   wire [3:2] stb_state_si_6_din;
   wire [3:2] stb_state_si_7_din;
*/   
   wire [7:0] stb_state_io;
   wire [7:0] stb_state_io_din;

   wire [7:0] stb_state_rmo;
//   wire [7:0] stb_state_rmo_din;
   
   wire [2:1] stb_state_rtype_0; // rm 8x1 bits
   wire [2:1] stb_state_rtype_1;
   wire [2:1] stb_state_rtype_2;
   wire [2:1] stb_state_rtype_3;
   wire [2:1] stb_state_rtype_4;
   wire [2:1] stb_state_rtype_5;
   wire [2:1] stb_state_rtype_6;
   wire [2:1] stb_state_rtype_7;
/*
   wire [2:1] stb_state_rtype_0_din;
   wire [2:1] stb_state_rtype_1_din;
   wire [2:1] stb_state_rtype_2_din;
   wire [2:1] stb_state_rtype_3_din;
   wire [2:1] stb_state_rtype_4_din;
   wire [2:1] stb_state_rtype_5_din;
   wire [2:1] stb_state_rtype_6_din;
   wire [2:1] stb_state_rtype_7_din;
*/
   wire [2:0] stb_l2bnk_addr;
   wire [2:1] stb_atm_rq_type;
      
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
wire	[3:0]	stb_wptr_prev ;
wire		stb_rptr_dfq_en ;
wire		update_stb_wptr ;
//wire 	[1:0] 	st_enc_set_way ;
wire	[3:0]	stb_rptr_dfq_new, stb_rptr_dfq ;
wire 	valid_entry_for_pcx ;
wire	[7:0]	dec_wptr_g, dec_rptr_dfq, dec_rptr_pcx, dec_ackptr ;
wire	[7:0]	dec_wptr_m ;
//wire		stb_wvld_g ;
//wire	[5:0]	stb_inv_set0,stb_inv_set1;
//wire	[5:0]	stb_inv_set2,stb_inv_set3;

wire		ack_vld ;
wire	[3:0]	stb_wptr_new, stb_wptr ;	
wire		stb_cam_wvld_g ;
wire	[7:0] 	inflight_vld_g ;
wire		dq_vld_d1,dq_vld_d2 ;
wire	[7:0]	dqptr_d1,dqptr_d2;
wire		pcx_rq_for_stb_d1 ;
wire    	pcx_rq_for_stb_d2,pcx_req_squash_d2 ;

   wire       clk;
   assign     clk = rclk;

   wire       rst_l;
   wire       stb_ctl_rst_l;
   
   dffrl_async rstff(.din (grst_l),
                     .q   (stb_ctl_rst_l),
                     .clk (clk), .se(se), .si(), .so(),
                     .rst_l (arst_l));
   assign     rst_l = stb_ctl_rst_l;
   
//=========================================================================================
//	RESET
//=========================================================================================

// A flush will reset the vld bit in the stb - it should be the only one as
// the stb has drained.

   wire   reset;
   //waiting int 3.0
   //assign rst_l = stb_ctl_rst_l;

   assign reset = ~rst_l | flshinst_rst ;

//=========================================================================================
//	STB READ FOR PCX
//=========================================================================================

// Assumes that an entry can be sent to the pcx iff the next oldest
// entry has received its ack. This pointer will not look for L2Bank
// overlap as the ptr calculation is much more complicated.

// (1)--> Entry must be valid and not already sent to pcx.
//		Includes squashing of speculative req
// (2)--> Previous in linked list must be valid and acked (or invalid)
// (3)--> This is to break the deadlock between oldest and youngest
// entries when queue is full. Oldest entry can always exit to pcx.

// This vector is one-hot. Assumption is that stb is a circular queue.
// deadlock has to be broken between oldest and youngest entry when the
// queue is full. The dfq ptr is used to mark oldest

dff_s #(2)  rq_stgd1       (
        .din    ({pcx_rq_for_stb_d1,pcx_req_squash}), 
        .q    	({pcx_rq_for_stb_d2,pcx_req_squash_d2}), 
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

wire	ffu_bst_wr_g ;
dff_s #(1)  ff_bstg       (
        .din    (lsu_blk_st_m),
        .q    	(ffu_bst_wr_g),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

wire	full_flush_st_g ;
// flush_pipe does not apply to blk st wr.
assign	full_flush_st_g = (stb_flush_st_g | (lsu_stbctl_flush_pipe_w & ~ffu_bst_wr_g)) & stb_cam_wvld_g ;

// timing fix: 5/6 -  begin
// qual dec_rptr_pcx w/ tlb camhit and in qctl1 move kill qual after store pick
wire      tlb_cam_hit_g, tlb_hit_g;
wire      dtlb_bypass_m, dtlb_bypass_g ;

dff_s #(1)  ff_dtlb_bypass_m       (
        .din    (lsu_dtlb_bypass_e),
        .q    	(dtlb_bypass_m),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

dff_s #(1)  ff_dtlb_bypass_g       (
        .din    (dtlb_bypass_m),
        .q    	(dtlb_bypass_g),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

dff_s #(1)  ff_tlb_cam_hit_g       (
        .din    (tlb_cam_hit),
        .q    	(tlb_cam_hit_g),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

assign  tlb_hit_g  =  tlb_cam_hit_g | dtlb_bypass_g | ffu_bst_wr_g; //bug6406/eco6610
// timing fix: 5/6 -  end

// st rq can now speculate on flush
assign	inflight_vld_g[7:0] = 
	dec_wptr_g[7:0] & {8{stb_cam_wvld_g & thrd_en_g}} ; 
	// the later term is for an inflight ld which gets squashed. It
	// should not effect dec_rptr_pcx. This is related to a timing fix
	// where the flush is taken out of inflight_vld_g.
//assign	inflight_vld_g[7:0] = dec_wptr_g[7:0] & {8{stb_wvld_g & thrd_en_g}} ;

//timing fix: 5/6/03 - kill inflight vld if tlb_hit_g=0; dec_rptr_pcx will be 0 and hence kill_w2 will be 0
// leave inflight_vld_g as is, since it is used to set squash - which eventually reset state_vld
wire [7:0] inflight_issue_g_tmp ;

assign  inflight_issue_g_tmp[7:0]  =  inflight_vld_g[7:0] & {8{tlb_hit_g}};

wire [7:0] inflight_issue_g ;
assign	inflight_issue_g[7:0] = 
	inflight_issue_g_tmp[7:0] & {8{~(|(stb_state_vld[7:0] & ~stb_state_ack[7:0]))}};  
	//inflight_vld_g[7:0] & {8{~(|(stb_state_vld[7:0] & ~stb_state_ack[7:0]))}};  // timing fix : 5/6


// Modified state ced includes in-flight pcx sel which is not squashed.
// Timing : pcx_req_squash delayed. A st that is squashed can then make a request 3-cycles
// later.
wire	skid_ced, st_vld_rq_d2 ;
assign	st_vld_rq_d2 = pcx_rq_for_stb_d2 & ~pcx_req_squash_d2 ;
assign	skid_ced = pcx_rq_for_stb_d1 | st_vld_rq_d2 ;
// For squashing rawp.
assign	stb_state_ced_mod[7:0] =
	((dec_ackptr[7:0] & {8{st_vld_rq_d2}}) | stb_state_ced[7:0]) ;

//RMO st counter satuated
   
wire  rmo_st_satuated;   
//dff #(1) rmo_st_satuated_ff  (
//    .din (lsu_outstanding_rmo_st_max),
//    .q   (rmo_st_satuated),
//    .clk    (clk),
//    .se     (se), .si     (), .so ()
//);
                          
   assign rmo_st_satuated  =  lsu_outstanding_rmo_st_max;
                      
wire	[7:0]	stb_state_ced_spec ;
assign	stb_state_ced_spec[7:0] =
	((dec_ackptr[7:0] & {8{skid_ced}}) | stb_state_ced[7:0]) | 
   (stb_state_rmo[7:0] & {8{rmo_st_satuated}});
   
assign 	dec_rptr_pcx[7:0] =
		 (inflight_issue_g[7:0] | stb_state_vld[7:0]) 
		 //(inflight_vld_g[7:0] | stb_state_vld[7:0]) 
			& ~stb_state_ced_spec[7:0] &	// -->(1)
		(({stb_state_vld[6:0],stb_state_vld[7]} &	// 
		  {stb_state_ack[6:0],stb_state_ack[7]}) // 
		| ~{stb_state_vld[6:0],stb_state_vld[7]}	// -->(2)
		| dec_rptr_dfq[7:0]) ;				// -->(3)


// There should be only one such entry i.e., the vector is 1-hot.
// Incorporate st dtlb parity error. It should not propagate to memory.
// Tracing full_flush_st_g, note that the pointers will not be restored
// correctly for timing reasons - anyway, this is considered unrecoverable.
// Monitor !
assign valid_entry_for_pcx = |dec_rptr_pcx[7:0] ;

wire	any_inflight_iss_g,any_inflight_iss_w2 ;
assign	any_inflight_iss_g = |inflight_vld_g[7:0] ;
wire	pick_inflight_iss_g,pick_inflight_iss_w2 ;
assign	pick_inflight_iss_g = |(dec_rptr_pcx[7:0] & inflight_issue_g[7:0]) ;

wire	st_pcx_rq_kill_g ;
assign	st_pcx_rq_kill_g = pick_inflight_iss_g & full_flush_st_g ;
//assign	st_pcx_rq_kill_g = (|(dec_rptr_pcx[7:0] & inflight_issue_g[7:0])) & full_flush_st_g ;

wire	st_vld_squash_g,st_vld_squash_w2 ;
assign	st_vld_squash_g = any_inflight_iss_g & full_flush_st_g ;
//assign	st_vld_squash_g = (|inflight_vld_g[7:0]) & full_flush_st_g ;

wire st_pcx_rq_kill_tmp,st_vld_squash_tmp ;
wire st_dtlb_perr_w2 ;
dff_s #(5)  stkill_stgd1       (
        .din    ({st_pcx_rq_kill_g,st_vld_squash_g,
		any_inflight_iss_g,pick_inflight_iss_g,st_dtlb_perr_g}), 
	.q      ({st_pcx_rq_kill_tmp,st_vld_squash_tmp,
		any_inflight_iss_w2,pick_inflight_iss_w2,st_dtlb_perr_w2}), 
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

assign	st_pcx_rq_kill_w2 = 
		st_pcx_rq_kill_tmp | 
		(pick_inflight_iss_w2 & st_dtlb_perr_w2); 

assign	st_vld_squash_w2  =
		st_vld_squash_tmp  |
		(any_inflight_iss_w2 & st_dtlb_perr_w2);


// Encode pcx rptr
// ** Timing : Could put flop in rwctl. 
assign stb_pcx_rptr[0] = dec_rptr_pcx[1] | dec_rptr_pcx[3] | dec_rptr_pcx[5] | dec_rptr_pcx[7] ;	
assign stb_pcx_rptr[1] = dec_rptr_pcx[2] | dec_rptr_pcx[3] | dec_rptr_pcx[6] | dec_rptr_pcx[7] ;	
assign stb_pcx_rptr[2] = dec_rptr_pcx[4] | dec_rptr_pcx[5] | dec_rptr_pcx[6] | dec_rptr_pcx[7] ;	

// This is used in qctl.
// Timing : flopped in qctl before use.
assign	stb_rd_for_pcx = valid_entry_for_pcx ; 

//=========================================================================================
//	STB READ FOR DFQ
//=========================================================================================


// Read Pointer to generate the next available entry for the dfq.
// Timing : This should be fine as st_ack_dq_stb is decode out of dfq byp flop.
wire	incr_dfq_ptr ;
// stb_rmo_st_issue added for rmo st bug - if critical then add flop.

// bug2983: incr_dfq_ptr is set by both st_ack_dq_stb and stb_rmo_st_issue
//          in the same cycle. this results in losing a dequeue.
//
//          fix is to detect rmo store after regular store. issue the rmo
//          store and dont reset the rmo store vld until the dequeue of the older
//          regular store.

wire    stb_dq_rmo ;

//assign	incr_dfq_ptr = st_ack_dq_stb | stb_rmo_st_issue ; //bug 2983
assign	incr_dfq_ptr = st_ack_dq_stb | stb_dq_rmo ;

assign	stb_rptr_dfq_new[3:0]	=	stb_rptr_dfq[3:0]  + {3'b0, incr_dfq_ptr} ;
//assign	stb_rptr_dfq_new[3:0]	=	stb_rptr_dfq[3:0]  + {3'b0, st_ack_dq_stb} ;

assign stb_rptr_dfq_en = st_ack_dq_stb | incr_dfq_ptr ; 

dffre_s #(4)  rptr_d	(
	.din		(stb_rptr_dfq_new[3:0]),.q	(stb_rptr_dfq[3:0]),
	.en		(stb_rptr_dfq_en),	.rst	(reset), 
	.clk		(clk), 
	.se		(se),	.si	(), .so	()
	);

//assign	stb_dfq_rptr[2:0] = stb_rptr_dfq_new[2:0] ;

// Decode Read Ptr
// Generated cycle before actual read.
assign	dec_rptr_dfq[0]	= ~stb_rptr_dfq[2] & ~stb_rptr_dfq[1] & ~stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[1]	= ~stb_rptr_dfq[2] & ~stb_rptr_dfq[1] &  stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[2]	= ~stb_rptr_dfq[2] &  stb_rptr_dfq[1] & ~stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[3]	= ~stb_rptr_dfq[2] &  stb_rptr_dfq[1] &  stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[4]	=  stb_rptr_dfq[2] & ~stb_rptr_dfq[1] & ~stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[5]	=  stb_rptr_dfq[2] & ~stb_rptr_dfq[1] &  stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[6]	=  stb_rptr_dfq[2] &  stb_rptr_dfq[1] & ~stb_rptr_dfq[0] ;	
assign	dec_rptr_dfq[7]	=  stb_rptr_dfq[2] &  stb_rptr_dfq[1] &  stb_rptr_dfq[0] ;

// Stge dfq ptr and dq vld by 2-cycles to appropriate invalidation pt
dff_s #(9)  dq_stgd1       (
        .din    ({dec_rptr_dfq[7:0],st_ack_dq_stb}), 
	.q      ({dqptr_d1[7:0],dq_vld_d1}),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

dff_s #(9)  dq_stgd2       (
        .din    ({dqptr_d1[7:0],dq_vld_d1}), 
	.q      ({dqptr_d2[7:0],dq_vld_d2}),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

//=========================================================================================
//	WPTR FOR STB
//=========================================================================================

// It is assumed that if there is a store in the pipe, there is a
// free entry in the corresponding stb. Otherwise, the pipe would've
// have stalled for the thread. This is maintained locally instead of in
// stb rw ctl.

// 00(flush,wr) - no update,01 - +1,10 - d1,11 - no update 
// cam or data wr ptr would do. 
//assign  update_stb_wptr         =       stb_cam_wvld_m |  stb_flush_st_g ;
assign  update_stb_wptr         =       stb_cam_wvld_m ^  (full_flush_st_g | st_dtlb_perr_g);

assign  stb_wptr_new[3:0]       =       (full_flush_st_g | st_dtlb_perr_g) ?
                                                        stb_wptr_prev[3:0] :
                                                        stb_wptr[3:0] + {3'b0, stb_cam_wvld_m} ;

dff_s  wvld_stgg       (
        .din    (stb_cam_wvld_m), .q      (stb_cam_wvld_g),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );


//assign	stb_wvld_g = stb_cam_wvld_g & ~full_flush_st_g ;

dffre_s #(4)  wptr_new    (
        .din            (stb_wptr_new[3:0]),    .q      (stb_wptr[3:0]),
        .en             (update_stb_wptr),    .rst    (reset),
        .clk            (clk),
        .se             (se), .si     (), .so ()
        );

assign	stb_wrptr[2:0]	= stb_wptr[2:0] ;

wire [2:0] stb_wptr_m ;
// flush should not be required. If the previous st is flushed then
// the current st should be invalid.
assign  stb_wptr_m[2:0]       =      stb_wptr[2:0] ;
/*assign  stb_wptr_m[3:0]       =       (full_flush_st_g) ?
                                                        stb_wptr_prev[3:0] :
                                                        stb_wptr[3:0] ;*/

// Decode wptr
assign	dec_wptr_m[0] = ~stb_wptr_m[2] & ~stb_wptr_m[1] & ~stb_wptr_m[0] ;	
assign	dec_wptr_m[1] = ~stb_wptr_m[2] & ~stb_wptr_m[1] &  stb_wptr_m[0] ;	
assign	dec_wptr_m[2] = ~stb_wptr_m[2] &  stb_wptr_m[1] & ~stb_wptr_m[0] ;	
assign	dec_wptr_m[3] = ~stb_wptr_m[2] &  stb_wptr_m[1] &  stb_wptr_m[0] ;	
assign	dec_wptr_m[4] =  stb_wptr_m[2] & ~stb_wptr_m[1] & ~stb_wptr_m[0] ;	
assign	dec_wptr_m[5] =  stb_wptr_m[2] & ~stb_wptr_m[1] &  stb_wptr_m[0] ;	
assign	dec_wptr_m[6] =  stb_wptr_m[2] &  stb_wptr_m[1] & ~stb_wptr_m[0] ;	
assign	dec_wptr_m[7] =  stb_wptr_m[2] &  stb_wptr_m[1] &  stb_wptr_m[0] ;

dff_s #(8)  dwptr_stgg       (
        .din    (dec_wptr_m[7:0]), .q      (dec_wptr_g[7:0]),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

// stb_wptr_prev represents the latest valid entry in stb
/*dffre #(4)  wptr_prev   (
        .din            (stb_wptr[3:0]),        .q      (stb_wptr_prev[3:0]),
        .en             (update_stb_wptr),      .rst    (reset),
        .clk            (clk),
        .se             (se), .si     (), .so ()
        );*/

assign	stb_wptr_prev[3:0] = stb_wptr[3:0] - {4'b0001} ;

// Bug 2419 - In case this is a critical path, a flop can be inserted.
assign	stb_wrptr_prev[2:0]	= stb_wptr_prev[2:0] ;

//=========================================================================================
//	# OF STORES IN STB
//=========================================================================================

wire	[3:0]	stb_wptr_w2 ;

// Count should not include stores in pipe-stages 'g' or before.
dff_s #(4)  wptr_stgw2       (
        .din    (stb_wptr[3:0]), .q      (stb_wptr_w2[3:0]),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

assign	lsu_stbcnt[3:0] =  (stb_wptr_w2[3:0] - stb_rptr_dfq[3:0]) ;

// Performance Cntr Info
wire	stb_full_w2 ;
assign	stb_full_w2 = lsu_stbcnt[2] & lsu_stbcnt[1] & lsu_stbcnt[0] ;
dff_s   sfull (
        .din    (stb_full_w2), .q      (stb_full),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

//=========================================================================================
//	CONTROL STATE
//=========================================================================================

// (V) 	-	Valid State. Initialized by write and cleared once entry
// 		has written DFQ and then written the cache. If the store
//		will only bypass then it still needs to enter DFQ but 
//		can be deallocated immediately on entry into DFQ. (1b)
// (A)	-	(NA) Allocate. Determined on read of cache. May be modified by
//		invalidate or st mv'ing to DFQ. The load woust have to
//		have same set index and same replacement way to clear A bit. (1b)
// (SI) -	cache set index for invalidate/load cam'ing. (6b)
// (WY) -	(NA) Allocate way for store. (2b)
// (CED) -	Committed to SKB. Entry written to SKB. (1b)
// (ACK) - 	Ack for store received from L2. (1b)
// (UPD) -	(NA) Entry mv'ed to DFQ. (1b)
// (W)   -  	(NA) Wrap bit. (1b) <--- Not used
// * All state needs to be reset when entry is freed.
//
// Total - 14b.

// ack_id is internally tracked. 
// There can only be one outstanding
dffre_s #(8)  ackptr_ff	(
	.din		(dec_rptr_pcx[7:0]), .q	(dec_ackptr[7:0]),
	.en		(pcx_rq_for_stb), .rst (reset),
	.clk		(clk), 
	.se		(se),	.si	(), .so	()
	);

   
assign 	ack_vld = cpx_st_ack_tid ;
//assign	st_dc_hit_g = lsu_st_hit_g ;

assign  stb_crnt_ack_id[0] = dec_ackptr[1] | dec_ackptr[3] |
                                dec_ackptr[5] | dec_ackptr[7] ;
assign  stb_crnt_ack_id[1] = dec_ackptr[2] | dec_ackptr[3] |
                                dec_ackptr[6] | dec_ackptr[7] ;
assign  stb_crnt_ack_id[2] = dec_ackptr[4] | dec_ackptr[5] |
                                dec_ackptr[6] | dec_ackptr[7] ;       

// Decode valid dequeue ids arriving from dfq.

// pa[39:36] 
// 0x00-0x7f  dram
// 0xa0-0xbf  l2csr
// others as non l2 accsess = b39 & ~(~b38 & b37)   
// timing fix: stb_non_l2bnk is delayed 1 cycle - gen in w/g cycle
//assign	stb_non_l2bnk = stb_alt_sel ?
//	stb_alt_addr[2] & ~(~stb_alt_addr[1] & stb_alt_addr[0]) :
//	tlb_pgnum_m[39]  & ~(~tlb_pgnum_m[38]  & tlb_pgnum_m[37])  & ~flsh_inst_m;

wire   [2:0]  stb_alt_addr_g;
wire          stb_alt_sel_g;

dff_s #(4) ff_alt_addr_g       (
        .din    ({stb_alt_sel,stb_alt_addr[2:0]}), 
        .q      ({stb_alt_sel_g,stb_alt_addr_g[2:0]}),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

wire  flsh_inst_g;
dff_s #(1) ff_flsh_inst_g       (
        .din    (flsh_inst_m),
        .q      (flsh_inst_g),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

wire   stb_alt_io_g , tlb_pgnum_io_g ;

assign  stb_alt_io_g  =  
        stb_alt_addr_g[2] & ~(~stb_alt_addr_g[1] & stb_alt_addr_g[0]);
assign  tlb_pgnum_io_g  =  
        tlb_pgnum_g[39]  & ~(~tlb_pgnum_g[38]  & tlb_pgnum_g[37])  & ~flsh_inst_g;

// used as input to state_io in stb_ctldp
wire   stb_non_l2bnk_g;
assign  stb_non_l2bnk_g  =  
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

// used as output to qctl1 - this has to be qual'ed w/dec_rptr_pcx so no x's propagate
//alt_sel_g  state_vld  comment
// 0         0          select tlb_pgnum_io_g(bypass)
// 0         1          select stb_state_io
// 1         0          select stb_alt_io_g
// 1         1          select stb_alt_io_g

wire  [7:0]  stb_l2bnk_addr_b2;

//  inflight (stb_alt / tlb)
//  stb
//  bug3875       
assign  stb_l2bnk_addr_b2[0]  =  
     stb_state_vld[0] ? stb_state_io[0] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[1]  =  
     stb_state_vld[1] ? stb_state_io[1] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[2]  =  
     stb_state_vld[2] ? stb_state_io[2] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[3]  =  
     stb_state_vld[3] ? stb_state_io[3] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[4]  =  
     stb_state_vld[4] ? stb_state_io[4] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[5]  =  
     stb_state_vld[5] ? stb_state_io[5] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[6]  =  
     stb_state_vld[6] ? stb_state_io[6] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;

assign  stb_l2bnk_addr_b2[7]  =  
     stb_state_vld[7] ? stb_state_io[7] :
        stb_alt_sel_g ? stb_alt_io_g :
                        tlb_pgnum_io_g ;


dff_s  rqsel_stgg       (
        .din    (pcx_rq_for_stb), .q      (pcx_rq_for_stb_d1),
        .clk    (clk),
        .se     (se), .si     (), .so ()
        );

// Use of tlb_pgnum_m will be critical !!! 

//always @( posedge clk)
//	begin
//	for (i=0;i<8;i=i+1) 	
//		begin
//			if (reset                                                 // reset
//                                | (dqptr_d2[i] & dq_vld_d2)                  	  // dequeue from stb
//				  | (dec_ackptr[i] & pcx_rq_for_stb_d1 & 
//						~pcx_req_squash & stb_state_rmo[i])) 
//				// write will be visible in cache.
//				begin
//					stb_state_vld[i] <= 1'b0 ;
//					stb_state_ced[i] <= 1'b0 ;
//					stb_state_ack[i] <= 1'b0 ;
//				end
//			if (dec_wptr_g[i] & stb_wvld_g & thrd_en_g )
//				begin
//					stb_state_vld[i] <= 1'b1 ;
//					stb_state_wy[i] <=  st_enc_set_way[1:0];
//				end
//			if (dec_wptr_m[i] & stb_cam_wvld_m)	// spec. write
//				begin
//					stb_state_si[i] <=  lsu_ldst_va_m[9:4] ;
//					stb_state_rtype[i] <= lsu_st_rq_type_m[2:0] ;
//					stb_state_io[i] <=  non_l2bnk ;
//					stb_state_rmo[i] <= lsu_st_rmo_m ;
//				end
//			// atomic will not write to cache even if it hits.
//			// rd_for_pcx needs to be gated for a cycle.
//			// This is delayed by a cycle to take into account
//			// squashing of speculative requests.
//			// rmo's will dequeue entry immediately.
//			if (dec_ackptr[i] & pcx_rq_for_stb_d1 & ~pcx_req_squash & ~stb_state_rmo[i]) 
//				stb_state_ced[i] = 1'b1 ;
//			if (dec_ackptr[i] & ack_vld)
//				stb_state_ack[i] = 1'b1 ;
			
//		end
//	end

// UNIFY : mux select destination address of pcx pkt

// always->dff translation begin

   // =================================
   // rst  set  din
   // 0    0    q
   // 1    0    0 (reset)
   // x    1    1 (set)
   // ==================================
   // din = set | (~r & q)

   //vld 
   wire	[7:0]	stb_issue_rmo ;
   wire	[7:0]	flush_vld_w2 ;
   // Timing 
   assign	stb_issue_rmo[7:0] = 
	(dec_ackptr[7:0] & {8{st_vld_rq_d2}} & stb_state_rmo[7:0]) ;
	// (dec_ackptr[7:0] & {8{pcx_rq_for_stb_d1}} & 
	//	{8{~pcx_req_squash}} & stb_state_rmo[7:0]) ;
   assign	stb_rmo_st_issue = |stb_issue_rmo[7:0] ;

   //bug2983 - begin
   wire        rmo_pend,rmo_pend_d1;
   wire [7:0]  rmo_pend_ackptr , stb_dq_rmo_dfq_ptr;
   // this will set 1 cycle after pcx_rq_for_stb and before the corresponding ced is set(which is 2 cycles
   // after pcx_rq_for_stb
   //bug3249: dec_rptr_dfq catches up w/ dec_ackptr; i.e. dec_ackptr entry is the oldset. rmo_pend should not
   //         be set in this case based on previuos entry (since it will be the youngest)
   //         fix - kill pend if issue and dq ptr are same (~{8{|(dec_ackptr[7:0] & dec_rptr_dfq[7:0])}})
   assign rmo_pend_ackptr[7:0]  =
          // is the current req RMO store
          //(dec_ackptr[7:0] & stb_state_rmo[7:0]) &  //bug3249
          //(dec_ackptr[7:0] & stb_state_rmo[7:0] & ~dec_rptr_dfq[7:0]) &    //bug7100 new fix, bug7117
          (dec_ackptr[7:0] & stb_state_rmo[7:0] & ~dqptr_d2[7:0]) & 
          // is the older store a regular store
          ({stb_state_vld[6:0],stb_state_vld[7]} & ~{stb_state_rmo[6:0],stb_state_rmo[7]});

   assign rmo_pend = |rmo_pend_ackptr[7:0];

   wire   rmo_pend_rst;
   assign rmo_pend_rst  =  reset | stb_dq_rmo;

   dffre_s #(1)  ff_rmo_pend      (
         .din  (rmo_pend),
         .q    (rmo_pend_d1),
         .en   (st_vld_rq_d2),      
         .rst  (rmo_pend_rst),
         .clk  (clk),
         .se   (se), .si     (), .so ()
         );

   // ok to use either dec_ackptr[7:0] OR dec_rptr_dfq[7:0] 'cos the stores younger to 1st RMO store
   // are not issued ('cos vld of RMO store is not reset). Hence ackptr and rptr_dfq will be the same
   // when rmo_pend=0.
   //
   // has to qual'ed w/ st_vld_rq_d2. otherwise can result in vld reset before ced is set. the next
   // time the entry is used it will have ced=1 and not issue.
   //
   // cannot use rmo_pend_ackptr[7:0] instead of dec_ackptr[7:0] 'cos the former will be reset when
   // rmo_pend=0 and will not dequeue the rmo stb entry. i.e if rmo_pend=1 when st_vld_rq_d2=1, use
   // dec_ackptr[7:0]

   //------------------------------------------------------------------------------------------------
   // Case 1: NO older regular store vld dequeue pending
   //------------------------------------------------------------------------------------------------
   // |        1           |    2    |    3    |    4     |     5    |          |          |
   // stb_state_vld=8'h1------------------------------------->8'h0
   // stb_state_rmo=8'h1
   //
   // pcx_rq_for_stb=1-------->0                     
   //
   // dec_ackptr=8'h0--------->8'h1
   //
   // st_vld_rq_d2=0--------------------->1           0
   // stb_issue_rmo=8'h0-------------->8'h1        8'h0
   // stb_dq_rmo_dfq_ptr=8'h0--------->8'h1       8'h0
   //
   // rmo_pend=0
   // rmo_pend_d1=0
   //
   // dq_vld_d2=0
   // dqptr_d2=8'h0
   //------------------------------------------------------------------------------------------------
   // Case 2: older regular store vld dequeue pending(entry0-older reg store; entry1-rmo younger store)
   //------------------------------------------------------------------------------------------------
   // |        1              |    2     |   3    |    4    |    5    |    6    |          | 
   // stb_state_vld=8'h3-------------------------------------->8'h2      8'h0
   // stb_state_rmo=8'h2
   // stb_state_ack=8'h1-------------------------------------->8'h0
   //
   // pcx_rq_for_stb=1-------------->0                     
   //
   // dec_ackptr=8'h1------------>8'h2
   //
   // st_vld_rq_d2=0-------------------------->1        0
   // stb_issue_rmo=8'h0------------------->8'h1     8'h0
   // stb_dq_rmo_dfq_ptr=8'h0--------------------------------->8'h2      8'h0 (dequeue rmo store)
   //
   // rmo_pend=0-------------------->1                           0
   // rmo_pend_d1=0--------------------------->1                            0
   //
   // dq_vld_d2=0-------------------------------------->1        0
   // dqptr_d2=8'h0--------------------------------->8'h1     8'h0 (dequeue regular store)
   //------------------------------------------------------------------------------------------------

   assign stb_dq_rmo_dfq_ptr[7:0] = 
          (stb_issue_rmo[7:0]   & ~rmo_pend_ackptr[7:0]) |         // if rmo_pend=0 when st_vld_rq_d2=1
          (dec_ackptr[7:0]      & {8{rmo_pend_d1 & ~rmo_pend}});   // if rmo_pend=1 when st_vld_rq_d2=1

   assign stb_dq_rmo  =  |stb_dq_rmo_dfq_ptr[7:0];
   //bug2983 - end

   assign stb_state_rst[7:0] = 
	{8{reset}} | (dqptr_d2[7:0] & {8{dq_vld_d2}})
	// reset vld,ced,ack immed. on issue to pcx for rmo store.
	| stb_dq_rmo_dfq_ptr[7:0] |  // fix for bug2983
	// | stb_issue_rmo[7:0] |  // bug2983
        flush_vld_w2[7:0] ;	// because of trap

   // vld is now speculatively written
   assign stb_state_vld_set[7:0] = dec_wptr_g[7:0] & {8{stb_cam_wvld_g & thrd_en_g}} ;
   //assign stb_state_vld_set[7:0] = dec_wptr_g[7:0] & {8{stb_wvld_g & thrd_en_g}} ;
   assign stb_state_vld_din[7:0] = stb_state_vld_set[7:0] | 
                                  (~stb_state_rst[7:0] & stb_state_vld[7:0]);
  
   wire	[7:0] stb_state_vld_tmp ; 
   dff_s #(8)  ff_stb_state_vld       (
        .din    (stb_state_vld_din[7:0]), 
        .q      (stb_state_vld_tmp[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );
	
   assign stb_state_vld[7:0] = stb_state_vld_tmp[7:0] & ~flush_vld_w2[7:0] ;

   wire	[7:0] stb_state_vld_set_w2 ;
   dff_s #(8)  ff_stb_state_vld_set       (
        .din    (stb_state_vld_set[7:0]), 
        .q      (stb_state_vld_set_w2[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );

   assign flush_vld_w2[7:0] = stb_state_vld_set_w2[7:0] & {8{st_vld_squash_w2}} ;

   // The stb valids for the scm need not include the intermediate flush condition
   // (flush_vld_w2). It is assumed that the flush of the store will invalidate 
   // a subsequent ld. (8 extra flops).
   // Bug 3201 - rmo st are made invisible to loads.
   
   wire [7:0]  st_scm_vld ;
   assign st_scm_vld[7:0] = stb_state_vld_din[7:0] & ~stb_state_rmo[7:0] ;
   
   dff_s #(8)  ff_st_scm_vld       (
        .din    (st_scm_vld[7:0]), 
        .q      (stb_state_vld_out[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );

   //ced
   assign stb_state_ced_set[7:0] = dec_ackptr[7:0] & {8{st_vld_rq_d2}} ;
   // Timing fix.
   //assign stb_state_ced_set[7:0] = dec_ackptr[7:0] & {8{pcx_rq_for_stb_d1 & ~pcx_req_squash}};
   // make reset dominant - specifically for coincident set and reset by rmo st.
   assign stb_state_ced_din[7:0] = ~stb_state_rst[7:0] & 
					(stb_state_ced_set[7:0] | stb_state_ced[7:0]);
   //assign stb_state_ced_din[7:0] = stb_state_ced_set[7:0] | 
   //                               (~stb_state_rst[7:0] & stb_state_ced[7:0]);
   
   dff_s #(8)  ff_stb_state_ced       (
        .din    (stb_state_ced_din[7:0]), 
        .q      (stb_state_ced[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );

   //ack
   assign stb_state_ack_set[7:0] = dec_ackptr[7:0] & {8{ack_vld}};
   assign stb_state_ack_din[7:0] = stb_state_ack_set[7:0] | 
                                  (~stb_state_rst[7:0] & stb_state_ack[7:0]);
   
   dff_s #(8)  ff_stb_state_ack       (
        .din    (stb_state_ack_din[7:0]), 
        .q      (stb_state_ack[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );

   //spec. write
   wire [7:0] spec_wrt;   
   assign     spec_wrt [7:0] = dec_wptr_m[7:0] & {8{stb_cam_wvld_m}};
   assign     stb_clk_en_l [7:0] = ~spec_wrt[7:0];

  //spec write Ffs move to lsu_stb_ctldp to save area      
 

  // moved state_io logic from ctldp 

  assign stb_state_io_din[7:0]  =  (stb_state_vld_set[7:0] & {8{stb_non_l2bnk_g}}) |
                                   (~stb_state_rst[7:0] & stb_state_io[7:0]);

   dff_s #(8)  ff_stb_state_io       (
        .din    (stb_state_io_din[7:0]), 
        .q      (stb_state_io[7:0]    ),
        .clk    (clk),
        .se     (se), .si (), .so ()
        );

// always->dff translation end    
// streaming unit does not have to care about outstanding rmo sparc-stores.
// membar will take care of that. spu must insert appr. delay in sampling signal.
assign	lsu_stb_empty = ~(|stb_state_vld[7:0]);

//=========================================================================================
//	SELECT L2BANK ADDRESS
//=========================================================================================

//reg [5:0] temp ;
//reg [2:0] stb_l2bnk_addr ;

//// This is modelling a mux. 
//always @(/*AUTOSENSE*/ /*memory or*/ dec_rptr_pcx)
//	begin
//		for (j=0;j<8;j=j+1) 	
//			if (dec_rptr_pcx[j])	// 1-hot
//				begin
//				temp[5:0] 		= stb_state_si[j] ;
//				stb_l2bnk_addr[2:0] 	= {stb_state_io[j],temp[4:3]} ;
//				stb_atm_rq_type[2:0] 	= stb_state_rtype[j] ;
//				end
//	end


//always->and-or translation begin
   assign stb_l2bnk_addr[2:0] = {3{dec_rptr_pcx[0]}} & {stb_l2bnk_addr_b2[0], stb_state_si_0[3:2]} |
                                {3{dec_rptr_pcx[1]}} & {stb_l2bnk_addr_b2[1], stb_state_si_1[3:2]} |
                                {3{dec_rptr_pcx[2]}} & {stb_l2bnk_addr_b2[2], stb_state_si_2[3:2]} |
                                {3{dec_rptr_pcx[3]}} & {stb_l2bnk_addr_b2[3], stb_state_si_3[3:2]} |
                                {3{dec_rptr_pcx[4]}} & {stb_l2bnk_addr_b2[4], stb_state_si_4[3:2]} |
                                {3{dec_rptr_pcx[5]}} & {stb_l2bnk_addr_b2[5], stb_state_si_5[3:2]} |
                                {3{dec_rptr_pcx[6]}} & {stb_l2bnk_addr_b2[6], stb_state_si_6[3:2]} |
                                {3{dec_rptr_pcx[7]}} & {stb_l2bnk_addr_b2[7], stb_state_si_7[3:2]} ;
   
   assign stb_atm_rq_type[2:1]= {2{dec_rptr_pcx[0]}} &  stb_state_rtype_0[2:1] |
                                {2{dec_rptr_pcx[1]}} &  stb_state_rtype_1[2:1] |
                                {2{dec_rptr_pcx[2]}} &  stb_state_rtype_2[2:1] |
                                {2{dec_rptr_pcx[3]}} &  stb_state_rtype_3[2:1] |
                                {2{dec_rptr_pcx[4]}} &  stb_state_rtype_4[2:1] |
                                {2{dec_rptr_pcx[5]}} &  stb_state_rtype_5[2:1] |
                                {2{dec_rptr_pcx[6]}} &  stb_state_rtype_6[2:1] |
                                {2{dec_rptr_pcx[7]}} &  stb_state_rtype_7[2:1] ;
   
//always->and-or translation end
          
   
endmodule

