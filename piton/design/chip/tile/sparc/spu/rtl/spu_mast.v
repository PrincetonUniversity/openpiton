// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_mast.v
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
//      Description:   state machine to do stores to L2. 
*/
////////////////////////////////////////////////////////////////////////

module spu_mast (

/*outputs*/
spu_mast_maaddr_addrinc,
spu_mast_memren,
spu_mast_stbuf_wen,
spu_mast_mpa_addrinc,
spu_mast_streq,

spu_mast_done_set,
/*inputs*/

spu_mactl_iss_pulse_dly,
mactl_stop,
streq_ack,
len_neqz,

spu_wen_allma_stacks_ok,

spu_mactl_perr_set,

spu_mactl_stxa_force_abort,

se,
reset,
rclk);


input reset;
input rclk;
input se;

input spu_mactl_iss_pulse_dly;
input mactl_stop;
input streq_ack;
input len_neqz;

input spu_wen_allma_stacks_ok;

input spu_mactl_perr_set;

input spu_mactl_stxa_force_abort;
// -----------------------------------------------------------------

output spu_mast_maaddr_addrinc;
output spu_mast_memren;
output spu_mast_stbuf_wen;
output spu_mast_mpa_addrinc;
output spu_mast_streq;
output spu_mast_done_set;
// -----------------------------------------------------------------
// -----------------------------------------------------------------
wire spu_mast_st_done,tr2rdmem_frm_wait4stdrain;

wire ok_to_signal_cmplt;

wire start_set;
wire spu_mast_allow_rdmem;

wire [1:0] rd_cntr_add,rd_cntr_q;

wire tr2laststreq_frm_wait4stdrain;

wire local_kill_abort;
// -----------------------------------------------------------------
wire streq_ack_dly;
dff_s    #(1) streq_ack_ff (
        .din(streq_ack) ,
        .q(streq_ack_dly),
        .clk (rclk), .se(se), .si(), .so());

// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// we need a state set to indcate st is done, and when an
// masync gets issued later, then the load asi is returned.
wire spu_mast_done_wen = (spu_mast_st_done | local_kill_abort) & mactl_stop;
wire spu_mast_done_rst = reset | spu_mactl_iss_pulse_dly;

wire spu_mast_done_set_q;

dffre_s    #(1) spu_mast_done_ff (
        .din(1'b1) , 
        .q(spu_mast_done_set_q),
        .en(spu_mast_done_wen),
        .rst(spu_mast_done_rst), .clk (rclk), .se(se), .si(), .so()); 

assign spu_mast_done_set = spu_mast_done_set_q & ok_to_signal_cmplt;


// -----------------------------------------------------------------
// -----------------------------------------------------------------

// added the following dly to fix bug5212. I had added a flop to lsu_spu_ldst_ack to
// the logic to increment the store req in spu_wen ack_cmplt counter to prevent
// introducing a timing path. Now in the case if an ma_store has a length 1, then
// the done_set gets asserted a cycle before the store ack incrementer increments.
// So now i have to delay the done_set by a cycle so that the incrementer has
// seen a store request by that time and the counter is no longer zero.
wire spu_mast_done_wen_dly;
dff_s    #(1) spu_mast_done_wen_ff (
        .din(spu_mast_done_wen) ,
        .q(spu_mast_done_wen_dly),
        .clk (rclk), .se(se), .si(), .so());

dffre_s    #(1) spu_mast_done_stack_ff (
        .din(1'b1) ,
        .q(spu_mast_done_set_stack),
        .en(spu_mast_done_wen_dly),
        .rst(spu_mast_done_rst), .clk (rclk), .se(se), .si(), .so());

assign ok_to_signal_cmplt = spu_wen_allma_stacks_ok & spu_mast_done_set_stack;


// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------
wire  state_reset = reset | local_kill_abort;
// -------------------------------------------------------------------------
dff_s    #(1) idle_state_ff (
        .din(nxt_idle_state) ,
        .q(cur_idle_state),
        .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) rdmem_state_ff (
        .din(nxt_rdmem_state) ,
        .q(cur_rdmem_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) wait4stdrain_state_ff (
        .din(nxt_wait4stdrain_state) , 
        .q(cur_wait4stdrain_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) laststreq_state_ff (
        .din(nxt_laststreq_state) ,
        .q(cur_laststreq_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire start_stop = spu_mactl_iss_pulse_dly & mactl_stop;

// -------------------------------------------------------------------------
//  transition to idle state.

/*
assign spu_mast_st_done = cur_wait4stdrain_state & streq_ack & 
				(~len_neqz | spu_mactl_stxa_force_abort);
*/


assign spu_mast_st_done = 
			//((cur_wait4stdrain_state & ~len_neqz & start_set) |
			((cur_wait4stdrain_state & ~len_neqz & rd_cntr_q[0]) |
			  cur_laststreq_state) & streq_ack ; 


assign  nxt_idle_state = (
                         state_reset | spu_mast_st_done |
                         (cur_idle_state & ~start_stop));


wire tr2rdmem_frm_idle = cur_idle_state & start_stop;

// this delay is because spu_mast_memren is based on nxt_rdmem_state
// and it happens before cur_idle_state goes to zero.
wire dly_tr2rdmem_frm_idle;
dff_s    #(1) dly_tr2rdmem_frm_idle_ff (
        .din(tr2rdmem_frm_idle) ,
        .q(dly_tr2rdmem_frm_idle),
        .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------
//  transition to rdmem state.


assign tr2rdmem_frm_wait4stdrain = cur_wait4stdrain_state & 
					(streq_ack | spu_mast_allow_rdmem) & 
					len_neqz ;

assign  nxt_rdmem_state = (
			 (dly_tr2rdmem_frm_idle) |
			 (tr2rdmem_frm_wait4stdrain));

// -------------------------------------------------------------------------
//  transition to wait4stdrain state.

assign nxt_wait4stdrain_state = (
                         cur_rdmem_state |
			 (cur_wait4stdrain_state & ~(streq_ack | (spu_mast_allow_rdmem & 
									len_neqz)) ));

// -------------------------------------------------------------------------
//  transition to laststreq state.

assign tr2laststreq_frm_wait4stdrain = cur_wait4stdrain_state & streq_ack & ~len_neqz &
						//~start_set;
						~rd_cntr_q[0];

assign nxt_laststreq_state = (
			 tr2laststreq_frm_wait4stdrain |
			 (cur_laststreq_state & ~streq_ack) );

wire tr2laststreq_frm_wait4stdrain_dly;
dff_s    #(1) tr2laststreq_frm_wait4stdrain_ff (
        .din(tr2laststreq_frm_wait4stdrain) ,
        .q(tr2laststreq_frm_wait4stdrain_dly),
        .clk (rclk), .se(se), .si(), .so());

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

assign spu_mast_maaddr_addrinc = cur_rdmem_state;

//assign spu_mast_memren = nxt_rdmem_state;
assign spu_mast_memren = cur_rdmem_state & ~local_kill_abort;

wire cur_rdmem_state_dly;
dff_s    #(1) cur_rdmem_state_ff (
        .din(cur_rdmem_state) ,
        .q(cur_rdmem_state_dly),
        .clk (rclk), .se(se), .si(), .so());

wire cur_rdmem_state_dly2,cur_rdmem_state_dly3;
dff_s    #(2) cur_rdmem_state_dly_ff (
        .din({cur_rdmem_state_dly,cur_rdmem_state_dly2}) ,
        .q({cur_rdmem_state_dly2,cur_rdmem_state_dly3}),
        .clk (rclk), .se(se), .si(), .so());

assign spu_mast_stbuf_wen = cur_rdmem_state_dly;


// cannot use cur_rdmem_state to start the request since the data will
// not be in the store buffer till the next cyle after mem rd.
//assign spu_mast_streq = cur_wait4stdrain_state | cur_rdmem_state;


//assign spu_mast_streq = cur_wait4stdrain_state & ~spu_mactl_dly_streq &
assign spu_mast_streq = ((cur_rdmem_state_dly3 & start_set & ~rd_cntr_q[1]) |
				(streq_ack_dly & len_neqz) |
				(tr2laststreq_frm_wait4stdrain_dly) )&
				~cur_idle_state & ~spu_mactl_perr_set &
				~spu_mactl_stxa_force_abort;
			// when perr is asserted
			// the state machine to goto idle. but due to above eq, len is not zero and
			// whith streq_ack it will continue doing streq and hence the st_ack counter keeps incr.


assign local_kill_abort = ((cur_rdmem_state_dly3 & start_set & ~rd_cntr_q[1]) |
                                (streq_ack_dly & len_neqz) |
                                (tr2laststreq_frm_wait4stdrain_dly) )&
				(spu_mactl_perr_set | spu_mactl_stxa_force_abort);


wire tr2rdmem_frm_wait4stdrain_dly;
dff_s    #(1) tr2rdmem_frm_wait4stdrain_ff (
        .din(tr2rdmem_frm_wait4stdrain) ,
        .q(tr2rdmem_frm_wait4stdrain_dly),
        .clk (rclk), .se(se), .si(), .so());

wire tr2rdmem_frm_wait4stdrain_dly2;
dff_s    #(1) tr2rdmem_frm_wait4stdrain_dly_ff (
        .din(tr2rdmem_frm_wait4stdrain_dly) ,
        .q(tr2rdmem_frm_wait4stdrain_dly2),
        .clk (rclk), .se(se), .si(), .so());

assign spu_mast_mpa_addrinc = tr2rdmem_frm_wait4stdrain_dly2;


// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// cntr to do an extra st req.

wire rd_cntr_en = cur_rdmem_state;

wire rd_cntr_rst = state_reset | streq_ack_dly | start_stop;

assign rd_cntr_add[1:0] = rd_cntr_q[1:0] + 2'b01;

dffre_s  #(2) rd_cntr_ff (
        .din(rd_cntr_add[1:0]) ,
        .q(rd_cntr_q[1:0]),
        .en(rd_cntr_en),
        .rst(rd_cntr_rst), .clk (rclk), .se(se), .si(), .so());


dffre_s  #(1) start_stop_ff (
        .din(1'b1) ,
        .q(start_set),
        .en(start_stop),
        .rst(state_reset | streq_ack_dly), .clk (rclk), .se(se), .si(), .so());


/*
assign  spu_mast_allow_rdmem = (start_set & ~rd_cntr_q[1] & cur_rdmem_state_dly3) | 
				(~start_set & rd_cntr_q[0]) ;
*/


assign  spu_mast_allow_rdmem = (start_set & ~rd_cntr_q[1] & cur_rdmem_state_dly3) ; 
//------------------------------------------------------------------

endmodule
