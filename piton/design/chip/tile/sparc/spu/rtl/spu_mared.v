// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_mared.v
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
//      Description:    state machine to do MA reduction. 
*/
////////////////////////////////////////////////////////////////////////

module spu_mared (

/*outputs*/
spu_mared_data_sel_l,
spu_mared_j_ptr_sel,
spu_mared_nm_rd_oprnd_sel,
spu_mared_m_rd_oprnd_sel,
spu_mared_me_rd_oprnd_sel,
spu_mared_x_wr_oprnd_sel,
spu_mared_xe_wr_oprnd_sel,
spu_mared_nr_rd_oprnd_sel,
spu_mared_a_rd_oprnd_sel,
spu_mared_r_wr_oprnd_sel,
spu_mared_update_jptr,
spu_mared_rst_jptr,
spu_mared_maxlen_wen,
spu_mared_rdn_wen,
spu_mared_oprnd2_wen,

spu_mared_memren,
spu_mared_memwen,

spu_mared_cin_set_4sub,
spu_mared_cin_oprnd_sub_mod,

spu_mared_done_set,
spu_mared_start_wen,
spu_mared_start_sel,

spu_mared_red_done,

spu_mared_update_redwr_jptr,
spu_mared_jjptr_wen,

spu_mared_not_idle,

/*inputs*/
mul_data_out_0,
spu_madp_m_eq_n,
spu_madp_m_lt_n,

spu_mactl_expop,
spu_mactl_mulop,
spu_mactl_redop,
spu_mamul_mul_done,
spu_mactl_iss_pulse_dly,

spu_maaddr_jptr_eqz,
spu_maaddr_len_eqmax,

spu_mast_stbuf_wen,
spu_madp_cout_oprnd_sub_mod,

spu_mactl_kill_op,

spu_mactl_stxa_force_abort,

se,
reset,
rclk);

// -------------------------------------------------------------------------
input reset;
input rclk;
input se;

input mul_data_out_0;

input spu_madp_m_eq_n;
input spu_madp_m_lt_n;

input spu_mactl_expop;
input spu_mactl_mulop;
input spu_mactl_redop;
input spu_mamul_mul_done;
input spu_mactl_iss_pulse_dly;

input spu_maaddr_jptr_eqz;
input spu_maaddr_len_eqmax;

input spu_mast_stbuf_wen;
input spu_madp_cout_oprnd_sub_mod;

input spu_mactl_kill_op;

input spu_mactl_stxa_force_abort;

// -------------------------------------------------------------------------

output [3:0] spu_mared_data_sel_l;
output spu_mared_j_ptr_sel;
output spu_mared_nm_rd_oprnd_sel;
output spu_mared_m_rd_oprnd_sel;
output spu_mared_me_rd_oprnd_sel;
output spu_mared_x_wr_oprnd_sel;
output spu_mared_xe_wr_oprnd_sel;
output spu_mared_nr_rd_oprnd_sel;
output spu_mared_a_rd_oprnd_sel;
output spu_mared_r_wr_oprnd_sel;
output spu_mared_update_jptr;
output spu_mared_rst_jptr;
output spu_mared_maxlen_wen;
output spu_mared_rdn_wen;
output spu_mared_oprnd2_wen;

output spu_mared_memren;
output spu_mared_memwen;

output spu_mared_cin_set_4sub;
output spu_mared_cin_oprnd_sub_mod;

output spu_mared_done_set;
output spu_mared_start_wen;
output spu_mared_start_sel;
output spu_mared_red_done;
output spu_mared_update_redwr_jptr;
output spu_mared_jjptr_wen;
output spu_mared_not_idle;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

wire m_gt_n_rst;
wire spu_mared_red_done;
wire m_gt_n_set,m_lt_n_rst,m_lt_n_set;
wire start_op;
wire tr2idle_frm_wr0tox,tr2idle_frm_wrmtox,tr2idle_frm_wrstox;
wire tr2rdm_frm_wr0tox,tr2rdm_frm_saveptrs,dly_saveptrs_state,
     tr2rdm_frm_wrstox,tr2rdm_frm_wrmtox;

wire start_mtox_from_msw;

wire local_stxa_abort;
wire cur_rdm_state;
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire  state_reset = reset | spu_mared_red_done | spu_mactl_kill_op |
					local_stxa_abort;
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// we need a state set to indcate mulred/red is done, and when an
// masync gets issued later, then the load asi is returned.
// ********* ONLY FOR mul_op & red_op NOT exp_op.
wire spu_mared_done_wen = (spu_mared_red_done | spu_mactl_kill_op | local_stxa_abort) & 
				(spu_mactl_mulop | spu_mactl_redop);
wire spu_mared_done_rst = reset | spu_mactl_iss_pulse_dly;

dffre_s    #(1) spu_mared_done_ff (
        .din(1'b1) , 
        .q(spu_mared_done_set),
        .en(spu_mared_done_wen),
        .rst(spu_mared_done_rst), .clk (rclk)
        , .se(se), .si(), .so()); 

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

dff_s    #(1) idle_state_ff (
        .din(nxt_idle_state) ,
        .q(cur_idle_state),
        .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) rdm_state_ff (
        .din(nxt_rdm_state) ,
        .q(cur_rdm_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

assign local_stxa_abort = cur_rdm_state & spu_mactl_stxa_force_abort;

// the delay is for the loop which is rdm,wrmtox to 
//match the cycles for other read/write loops
dffr_s  #(1) rdmdly_state_ff (
        .din(nxt_rdmdly_state) ,
        .q(cur_rdmdly_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) rdn_state_ff (
        .din(nxt_rdn_state) ,
        .q(cur_rdn_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) cmpsub_state_ff (
        .din(nxt_cmpsub_state) ,
        .q(cur_cmpsub_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) wr0tox_state_ff (
        .din(nxt_wr0tox_state) ,
        .q(cur_wr0tox_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) wrmtox_state_ff (
        .din(nxt_wrmtox_state) ,
        .q(cur_wrmtox_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

// s = m-n
dffr_s  #(1) wrstox_state_ff (
        .din(nxt_wrstox_state) ,
        .q(cur_wrstox_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) saveptrs_state_ff (
        .din(nxt_saveptrs_state) ,
        .q(cur_saveptrs_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

dffr_s  #(1) submn_state_ff (
        .din(nxt_submn_state) ,
        .q(cur_submn_state),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire m_gt_n_q,m_lt_n_q;

wire spu_mared_m_eq_n = spu_madp_m_eq_n & ~(m_lt_n_q | m_gt_n_q);
//assign spu_mared_m_gt_n = ~(spu_madp_m_eq_n | spu_madp_m_lt_n | m_lt_n_q);
wire spu_mared_m_lt_n = ~(spu_madp_m_eq_n | m_gt_n_q) & spu_madp_m_lt_n;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
wire mamulred_op_rst = state_reset;

wire spu_mamul_mul_done_qual = spu_mamul_mul_done & ~spu_mactl_kill_op;

wire mamulred_op_set = (spu_mactl_mulop | spu_mactl_expop) & spu_mamul_mul_done_qual;
wire mulred_start = mamulred_op_set;

dffre_s #(1) mamulred_op_ff (
        .din(1'b1) ,
        .q(mamulred_op_q),
        .en(mamulred_op_set),
        .rst(mamulred_op_rst), .clk (rclk)
        , .se(se), .si(), .so());

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------

assign m_gt_n_rst = state_reset;

assign m_gt_n_set = ((spu_mactl_mulop | spu_mactl_expop) & mul_data_out_0 & spu_mamul_mul_done_qual) |
				(cur_saveptrs_state & ~m_lt_n_q);

dffre_s #(1) m_gt_n_ff (
        .din(1'b1) ,
        .q(m_gt_n_q),
        .en(m_gt_n_set),
        .rst(m_gt_n_rst), .clk (rclk)
        , .se(se), .si(), .so());

// -------------------------------------------------------------------------
assign m_lt_n_rst = state_reset;
assign m_lt_n_set = cur_cmpsub_state & spu_mared_m_lt_n;

dffre_s #(1) m_lt_n_ff (
        .din(1'b1) ,
        .q(m_lt_n_q),
        .en(m_lt_n_set),
        .rst(m_lt_n_rst), .clk (rclk)
        , .se(se), .si(), .so());

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// transition to idle state

// this dley is so that m_gt_n_q is updated by the time we start. as
// this is one of the conditions to come out of idle state.
wire mulred_start_q;
dff_s #(1) dly_start_mulred_ff (
        .din(mulred_start) ,
        .q(mulred_start_q),
        .clk (rclk)
        , .se(se), .si(), .so());


// delaying mared_start so we can save len ptr to jptr before
// starting.
wire mared_start_p1 = spu_mactl_redop & spu_mactl_iss_pulse_dly;

wire mared_start_p1_q,mared_start_q;
dff_s #(2) dly_start_red_ff (
        .din({mared_start_p1,mared_start_p1_q}) ,
        .q({mared_start_p1_q,mared_start_q}),
        .clk (rclk)
        , .se(se), .si(), .so());

assign spu_mared_start_wen = mared_start_p1_q | start_mtox_from_msw | spu_mamul_mul_done_qual;
assign spu_mared_start_sel = mared_start_p1_q | start_mtox_from_msw | spu_mamul_mul_done;

assign start_op = mulred_start_q | mared_start_q;


assign tr2idle_frm_wr0tox = cur_wr0tox_state & spu_maaddr_jptr_eqz;
assign tr2idle_frm_wrmtox = cur_wrmtox_state & spu_maaddr_jptr_eqz;
assign tr2idle_frm_wrstox = cur_wrstox_state & spu_maaddr_len_eqmax;

wire spu_mared_red_done_pre = tr2idle_frm_wr0tox | tr2idle_frm_wrmtox |
				tr2idle_frm_wrstox;

dffr_s #(2) spu_mared_red_done_ff (
        .din({spu_mared_red_done_pre,spu_mared_red_done_dly1}) ,
        .q({spu_mared_red_done_dly1,spu_mared_red_done_dly2}),
        .rst(state_reset), .clk (rclk)
        , .se(se), .si(), .so());

assign spu_mared_red_done = spu_mared_red_done_dly2 | local_stxa_abort;

// --------------------------

assign spu_mared_not_idle = ~cur_idle_state;


assign  nxt_idle_state = (
                         state_reset | spu_mared_red_done | 
                         (cur_idle_state & ~start_op));


// -------------------------------------------------------------------------
// transition to rdm state

wire twodly_saveptrs_state;

assign tr2rdm_frm_wr0tox = cur_wr0tox_state & ~spu_maaddr_jptr_eqz;
assign tr2rdm_frm_saveptrs = twodly_saveptrs_state & ~cur_idle_state;
assign tr2rdm_frm_wrstox = cur_wrstox_state & ~spu_maaddr_len_eqmax;
assign tr2rdm_frm_wrmtox = cur_wrmtox_state & m_lt_n_q & ~spu_maaddr_jptr_eqz;

assign  nxt_rdm_state = ( 
			 tr2rdm_frm_wrmtox |
			 tr2rdm_frm_wr0tox | tr2rdm_frm_saveptrs |
			 tr2rdm_frm_wrstox |
                         (cur_idle_state & start_op & ~(m_lt_n_q|m_gt_n_q)));
                         //(cur_idle_state & start_op & ~m_lt_n_q));

// this goes to spu_mamul to get ored with the logic there before
// sending to spu_madp.
assign spu_mared_oprnd2_wen = cur_rdm_state;


// -------------------------------------------------------------------------
// transition to rdmdly state

assign  nxt_rdmdly_state = (
                         (cur_rdm_state & m_lt_n_q) );

// -------------------------------------------------------------------------
// transition to rdn state


assign  nxt_rdn_state = (
                         (cur_rdm_state & ~m_lt_n_q));

// the following is for capturing the N data into flop
// used for subtract & compare.
assign spu_mared_rdn_wen = cur_rdn_state | spu_mast_stbuf_wen;

// -------------------------------------------------------------------------
// transition to cmpsub state

assign  nxt_cmpsub_state = (
			 (cur_rdn_state & ~(m_lt_n_q | m_gt_n_q)));

// -------------------------------------------------------------------------
// transition to wr0tox state

assign  nxt_wr0tox_state = (
			 (cur_cmpsub_state & spu_mared_m_eq_n));

// -------------------------------------------------------------------------
// transition to wrmtox state

assign  nxt_wrmtox_state = (
                         (cur_rdmdly_state) );

// -------------------------------------------------------------------------
// transition to wrstox state

assign  nxt_wrstox_state = (
                         (cur_submn_state));

// -------------------------------------------------------------------------
// transition to saveptrs state

assign  nxt_saveptrs_state = (
                         (cur_idle_state & start_op & m_gt_n_q) |
			 (cur_cmpsub_state & ~spu_mared_m_eq_n));
/*
                         (cur_cmpsub_state & spu_mared_m_gt_n) |
			 (cur_cmpsub_state & spu_mared_m_lt_n));
*/


dffr_s    #(1) dly_saveptrs_ff (
        .din(cur_saveptrs_state) ,
        .q(dly_saveptrs_state),
        .clk (rclk),
        .rst(state_reset), .se(se), .si(), .so());

// the delay is needed so we can save the pointer before
// reseting it.
assign spu_mared_maxlen_wen = cur_saveptrs_state & ~m_lt_n_q;
assign spu_mared_rst_jptr = dly_saveptrs_state & ~m_lt_n_q;

assign start_mtox_from_msw = cur_saveptrs_state & m_lt_n_q;

// need to delay this an extra cycle to trigger nxt_rdm_state, so 
// the len_eqmax has correct value by then.
dffr_s    #(1) twodly_saveptrs_ff (
        .din(dly_saveptrs_state) ,
        .q(twodly_saveptrs_state),
        .clk (rclk),
        .rst(state_reset), .se(se), .si(), .so());

// -------------------------------------------------------------------------
// transition to submn state

assign  nxt_submn_state = (
                         (cur_rdn_state & m_gt_n_q));

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
/*
assign spu_mared_incr_jptr = nxt_wr0tox_state | nxt_wrmtox_state |
				nxt_wstox_state;
*/

// the follwoing is to mux the updated jjptr from a temp
// flop for the transition to rdm state and then the mux selects
// the jptr updated value for rdn and wr.
assign spu_mared_update_jptr = tr2rdm_frm_wr0tox | tr2rdm_frm_wrmtox  |
				tr2rdm_frm_wrstox;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------


// added spu_mactl_stxa_force_abort to the following since ren causes perr_set with x's.
assign spu_mared_memren = (nxt_rdm_state | nxt_rdn_state) & ~spu_mactl_stxa_force_abort;

// ---------------------
assign spu_mared_jjptr_wen = nxt_wr0tox_state | nxt_wrmtox_state |
                                nxt_wrstox_state;

dff_s #(3) nxt_wr0tox_state_ff(
        .din({nxt_wr0tox_state,nxt_wr0tox_state_dly1,nxt_wr0tox_state_dly2}) ,
        .q({nxt_wr0tox_state_dly1,nxt_wr0tox_state_dly2,nxt_wr0tox_state_dly3}),
        .clk (rclk)
        , .se(se), .si(), .so());

dff_s #(3) nxt_wrstox_state_ff(
        .din({nxt_wrstox_state,nxt_wrstox_state_dly1,nxt_wrstox_state_dly2}) ,
        .q({nxt_wrstox_state_dly1,nxt_wrstox_state_dly2,nxt_wrstox_state_dly3}),
        .clk (rclk)
        , .se(se), .si(), .so());


dff_s #(2) nxt_wrmtox_state_ff(
        .din({nxt_wrmtox_state,nxt_wrmtox_state_dly1}) ,
        .q({nxt_wrmtox_state_dly1,nxt_wrmtox_state_dly2}),
        .clk (rclk)
        , .se(se), .si(), .so());

assign spu_mared_memwen = nxt_wr0tox_state_dly3 | nxt_wrmtox_state_dly2 |
				nxt_wrstox_state_dly3;
// -----------------------

dff_s #(2) spu_mared_start_wen_ff(
        .din({spu_mared_start_wen,spu_mared_start_wen_dly}) ,
        .q({spu_mared_start_wen_dly,spu_mared_start_wen_dly2}),
        .clk (rclk)
        , .se(se), .si(), .so());

dff_s #(2) spu_mared_rst_jptr_ff(
        .din({spu_mared_rst_jptr,spu_mared_rst_jptr_dly}) ,
        .q({spu_mared_rst_jptr_dly,spu_mared_rst_jptr_dly2}),
        .clk (rclk)
        , .se(se), .si(), .so());

dff_s    #(1) spu_mared_memwen_ff (
        .din(spu_mared_memwen) ,
        .q(spu_mared_memwen_dly),
        .clk (rclk)
        , .se(se), .si(), .so());

assign spu_mared_update_redwr_jptr  = spu_mared_rst_jptr_dly2 | spu_mared_start_wen_dly2 | 
						spu_mared_memwen_dly;

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
/*
assign spu_mared_m_rd_oprnd_sel = nxt_rdm_state & (mamulred_op_q | mamulred_op_set);
assign spu_mared_nm_rd_oprnd_sel = nxt_rdn_state & (mamulred_op_q | mamulred_op_set);
assign spu_mared_x_wr_oprnd_sel = spu_mared_memwen & mamulred_op_q; 
*/

assign spu_mared_m_rd_oprnd_sel = nxt_rdm_state & spu_mactl_mulop;
assign spu_mared_nm_rd_oprnd_sel = nxt_rdn_state & (spu_mactl_mulop | spu_mactl_expop);
assign spu_mared_x_wr_oprnd_sel = spu_mared_memwen & spu_mactl_mulop; 

assign spu_mared_me_rd_oprnd_sel = nxt_rdm_state & spu_mactl_expop;
assign spu_mared_xe_wr_oprnd_sel = spu_mared_memwen & spu_mactl_expop; 

assign spu_mared_a_rd_oprnd_sel = nxt_rdm_state & spu_mactl_redop;
assign spu_mared_nr_rd_oprnd_sel = nxt_rdn_state & spu_mactl_redop;
assign spu_mared_r_wr_oprnd_sel = spu_mared_memwen & spu_mactl_redop; 

//assign spu_mared_j_ptr_sel = spu_mared_memren | spu_mared_memwen;
assign spu_mared_j_ptr_sel = spu_mared_memren ;

// -------------------------------------------------------------------------
// the following selects go to spu_madp.
wire [3:0] spu_mared_data_sel;
assign spu_mared_data_sel[0] = ~(mamulred_op_q | spu_mactl_redop);
//assign spu_mared_data_sel[1] = (mamulred_op_q | spu_mactl_redop) & spu_mared_m_eq_n;
assign spu_mared_data_sel[1] = (mamulred_op_q | spu_mactl_redop) & ~m_lt_n_q & ~m_gt_n_q;
assign spu_mared_data_sel[2] = (mamulred_op_q | spu_mactl_redop) & m_lt_n_q & ~m_gt_n_q;
assign spu_mared_data_sel[3] = (mamulred_op_q | spu_mactl_redop) & m_gt_n_q;

assign spu_mared_data_sel_l[3:0] = ~spu_mared_data_sel[3:0];
// -------------------------------------------------------------------------

assign spu_mared_cin_set_4sub = spu_mared_data_sel[2] | spu_mared_data_sel[1];

// -------------------------------------------------------------------------

// except for the first word subtract(starting at jptr=0), use borrow from the
// previous stage as cin for the next stage.
wire sel_cout_frm_prev_stage = (~spu_maaddr_jptr_eqz & m_gt_n_q) & ~start_op;

wire spu_mared_cin_oprnd_sub_mod_pre;
mux3ds  #(1) cin_sel_mux (
        .in0    (1'b0),
        .in1    (1'b1),
        .in2    (spu_madp_cout_oprnd_sub_mod),
        .sel0   (1'b0),
        .sel1   (~sel_cout_frm_prev_stage),
        .sel2   (sel_cout_frm_prev_stage),
        .dout   (spu_mared_cin_oprnd_sub_mod_pre)
);


wire dly_cur_wrstox_state;

wire cin_cout_wen = start_op | dly_cur_wrstox_state;

wire spu_mared_cin_oprnd_sub_mod_q;
dffre_s    #(1) cin_cout_ff (
        .din(spu_mared_cin_oprnd_sub_mod_pre) ,
        .q(spu_mared_cin_oprnd_sub_mod_q),
        .en(cin_cout_wen),
        .rst(reset), 
        .clk (rclk)
        , .se(se), .si(), .so());


// for ld and store ops force cin to zero, since the adder is used for MPA calculations.
wire force_cin_to_zero = spu_mactl_expop | spu_mactl_mulop | spu_mactl_redop;

wire force_cin_to_zero_q;
dff_s    #(1) force_cin_to_zero_ff (
        .din(force_cin_to_zero) ,
        .q(force_cin_to_zero_q),
        .clk (rclk)
        , .se(se), .si(), .so());

assign spu_mared_cin_oprnd_sub_mod = spu_mared_cin_oprnd_sub_mod_q & force_cin_to_zero_q;

// -------------------------
// delaying cur_wrstox_state to write the cout to cin reg. this delay
// is for when the j-ptr comes out of being zero is when we need to capture
// the next cout to cin.

dff_s    #(1) dly_cur_wrstox_state_ff (
        .din(cur_wrstox_state) ,
        .q(dly_cur_wrstox_state),
        .clk (rclk)
        , .se(se), .si(), .so());



endmodule
