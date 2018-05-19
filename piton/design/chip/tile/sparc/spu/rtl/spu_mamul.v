// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_mamul.v
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
//      Description:   state machine to do MA mul/acc/shf. 
*/
////////////////////////////////////////////////////////////////////////

module spu_mamul (


/*outputs*/
spu_mamul_memren,
spu_mamul_memwen,

spu_mamul_rst_iptr,
spu_mamul_rst_jptr,
spu_mamul_incr_iptr,
spu_mamul_incr_jptr,

spu_mamul_a_rd_oprnd_sel,
spu_mamul_ax_rd_oprnd_sel,
spu_mamul_b_rd_oprnd_sel,
spu_mamul_ba_rd_oprnd_sel,
spu_mamul_m_rd_oprnd_sel,
spu_mamul_me_rd_oprnd_sel,
spu_mamul_n_rd_oprnd_sel,
spu_mamul_m_wr_oprnd_sel,
spu_mamul_me_wr_oprnd_sel,

spu_mamul_i_ptr_sel,
spu_mamul_iminus1_ptr_sel,
spu_mamul_j_ptr_sel,
spu_mamul_iminusj_ptr_sel,
spu_mamul_iminuslenminus1_sel,
spu_mamul_jjptr_wen,

spu_mamul_oprnd2_wen,
spu_mamul_oprnd2_bypass,
spu_mamul_oprnd1_mxsel_l,
spu_mamul_oprnd1_wen,

spu_mul_req_vld,
spu_mul_areg_shf,
spu_mul_acc,
spu_mul_areg_rst,
spu_mamul_mul_done,

spu_mamul_jjptr_sel,

spu_mamul_rst,

/*inputs*/
spu_maaeqb_jjptr_sel,

spu_mactl_mulop,

spu_maaddr_iequtwolenplus2,
spu_maaddr_iequtwolenplus1,
spu_maaddr_jequiminus1,
spu_maaddr_jequlen,
spu_maaddr_halfpnt_set,
spu_mactl_iss_pulse_dly,

spu_mared_oprnd2_wen,

mul_spu_ack,
mul_spu_shf_ack,

spu_maexp_start_mulred_anoteqb,

spu_mactl_expop,

spu_maaddr_aequb,


spu_maaeqb_rst_iptr,
spu_maaeqb_rst_jptr,
spu_maaeqb_incr_iptr,
spu_maaeqb_incr_jptr,

spu_maaeqb_a_rd_oprnd_sel,
spu_maaeqb_ax_rd_oprnd_sel,
spu_maaeqb_m_rd_oprnd_sel,
spu_maaeqb_me_rd_oprnd_sel,
spu_maaeqb_n_rd_oprnd_sel,
spu_maaeqb_m_wr_oprnd_sel,
spu_maaeqb_me_wr_oprnd_sel,

spu_maaeqb_iminus1_ptr_sel,
spu_maaeqb_j_ptr_sel,
spu_maaeqb_iminusj_ptr_sel,
spu_maaeqb_iminuslenminus1_sel,
spu_maaeqb_jjptr_wen,

spu_maaeqb_oprnd2_wen,
spu_maaeqb_oprnd2_bypass,

spu_maaeqb_mul_req_vld,
spu_maaeqb_mul_areg_shf,
spu_maaeqb_mul_acc,
spu_maaeqb_mul_areg_rst,
spu_maaeqb_mul_done,

spu_maaeqb_oprnd1_mxsel,
spu_maaeqb_oprnd1_wen,

spu_mactl_kill_op,
spu_mactl_stxa_force_abort,

se,
reset,
rclk);

// ---------------------------------------------------------------
input reset;
input rclk;
input se;

input spu_maaddr_iequtwolenplus2;
input spu_maaddr_iequtwolenplus1;
input spu_maaddr_jequiminus1;
input spu_maaddr_jequlen;
input spu_maaddr_halfpnt_set;

input mul_spu_ack;
input mul_spu_shf_ack;
input spu_mactl_mulop;
input spu_mactl_iss_pulse_dly;

input spu_mared_oprnd2_wen;

input spu_maexp_start_mulred_anoteqb;

input spu_mactl_expop;

input spu_maaddr_aequb;



input spu_maaeqb_rst_iptr;
input spu_maaeqb_rst_jptr;
input spu_maaeqb_incr_iptr;
input spu_maaeqb_incr_jptr;

input spu_maaeqb_a_rd_oprnd_sel;
input spu_maaeqb_ax_rd_oprnd_sel;
input spu_maaeqb_m_rd_oprnd_sel;
input spu_maaeqb_me_rd_oprnd_sel;
input spu_maaeqb_n_rd_oprnd_sel;
input spu_maaeqb_m_wr_oprnd_sel;
input spu_maaeqb_me_wr_oprnd_sel;

input spu_maaeqb_iminus1_ptr_sel;
input spu_maaeqb_j_ptr_sel;
input spu_maaeqb_iminusj_ptr_sel;
input spu_maaeqb_iminuslenminus1_sel;
input spu_maaeqb_jjptr_wen;

input spu_maaeqb_oprnd2_wen;
input spu_maaeqb_oprnd2_bypass;

input spu_maaeqb_mul_req_vld;
input spu_maaeqb_mul_areg_shf;
input spu_maaeqb_mul_acc;
input spu_maaeqb_mul_areg_rst;
input spu_maaeqb_mul_done;

input [1:0] spu_maaeqb_oprnd1_mxsel;
input spu_maaeqb_oprnd1_wen;
input spu_maaeqb_jjptr_sel;

input spu_mactl_kill_op;
input spu_mactl_stxa_force_abort;

// ---------------------------------------------------------------

output spu_mamul_memwen;
output spu_mamul_memren;
output spu_mamul_rst_iptr;
output spu_mamul_rst_jptr;
output spu_mamul_incr_iptr;
output spu_mamul_incr_jptr;

output spu_mamul_a_rd_oprnd_sel;
output spu_mamul_ax_rd_oprnd_sel;
output spu_mamul_b_rd_oprnd_sel;
output spu_mamul_ba_rd_oprnd_sel;
output spu_mamul_m_rd_oprnd_sel;
output spu_mamul_me_rd_oprnd_sel;
output spu_mamul_n_rd_oprnd_sel;
output spu_mamul_m_wr_oprnd_sel;
output spu_mamul_me_wr_oprnd_sel;

output spu_mamul_i_ptr_sel;
output spu_mamul_iminus1_ptr_sel;
output spu_mamul_j_ptr_sel;
output spu_mamul_iminusj_ptr_sel;
output spu_mamul_iminuslenminus1_sel;
output spu_mamul_jjptr_wen;

output spu_mamul_oprnd2_wen;
output spu_mamul_oprnd2_bypass;
output [2:0] spu_mamul_oprnd1_mxsel_l;
output spu_mamul_oprnd1_wen;

output spu_mul_req_vld;
output spu_mul_areg_shf;
output spu_mul_acc;
output spu_mul_areg_rst;
output spu_mamul_mul_done;
output spu_mamul_jjptr_sel;
output spu_mamul_rst;

// ---------------------------------------------------------------
wire tr2mwrite_frm_accumshft_pre;
wire tr2mwrite_frm_accumshft,tr2iloopa_frm_jloopn;
wire spu_mamul_rd_aj,spu_mamul_rd_biminusj,spu_mamul_rd_mj,
	spu_mamul_rd_niminusj,spu_mamul_rd_ai,spu_mamul_rd_b0,
	spu_mamul_wr_mi,spu_mamul_wr_miminuslenminus1,
	spu_mamul_rd_n0;

wire tr2accumshft_frm_mwrite;
wire tr2accumshft_frm_iloopn;
wire nxt_mwrite_state;
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

//wire local_stxa_abort = cur_mwrite_state & spu_mactl_stxa_force_abort;// this causes x to in perr_set
wire local_stxa_abort = nxt_mwrite_state & spu_mactl_stxa_force_abort;

wire state_reset = reset | spu_mactl_kill_op | local_stxa_abort;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
dff_s    #(1) idle_state_ff (
        .din(nxt_idle_state) , 
        .q(cur_idle_state),
        .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopa_state_ff (
        .din(nxt_jloopa_state) , 
        .q(cur_jloopa_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopb_state_ff (
        .din(nxt_jloopb_state) , 
        .q(cur_jloopb_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopn_state_ff (
        .din(nxt_jloopn_state) , 
        .q(cur_jloopn_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopm_state_ff (
        .din(nxt_jloopm_state) , 
        .q(cur_jloopm_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) iloopa_state_ff (
        .din(nxt_iloopa_state) , 
        .q(cur_iloopa_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) iloopb_state_ff (
        .din(nxt_iloopb_state) , 
        .q(cur_iloopb_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) nprime_state_ff (
        .din(nxt_nprime_state) , 
        .q(cur_nprime_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) mwrite_state_ff (
        .din(nxt_mwrite_state) , 
        .q(cur_mwrite_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) iloopn_state_ff (
        .din(nxt_iloopn_state) , 
        .q(cur_iloopn_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) accumshft_state_ff (
        .din(nxt_accumshft_state) , 
        .q(cur_accumshft_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

// ---------------------------------------------------------------

wire spu_maaddr_aequb_q;
dff_s  #(1) spu_maaddr_aequb_ff (
        .din(spu_maaddr_aequb) , 
        .q(spu_maaddr_aequb_q),
        .clk (rclk), .se(se), .si(), .so()); 


// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// 4 cycle delay for mul result coming back.
// ---------------------------------------------------------------

wire tr2mwrite_frm_jloopn = cur_jloopn_state & mul_spu_ack & spu_maaddr_halfpnt_set &
                                spu_maaddr_jequlen;

wire mul_result_c0,mul_result_c1,mul_result_c2,mul_result_c3,mul_result_c4,mul_result_c5;

//assign mul_result_c0 = (cur_nprime_state & mul_spu_ack & ~spu_maaddr_halfpnt_set) |
assign mul_result_c0 = (cur_nprime_state & mul_spu_ack) |
			( tr2mwrite_frm_jloopn );


dffr_s  #(5) mul_res_ff (
        .din({mul_result_c0,mul_result_c1,mul_result_c2,mul_result_c3,mul_result_c4}) , 
        .q({mul_result_c1,mul_result_c2,mul_result_c3,mul_result_c4,mul_result_c5}),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
wire tr2idle_frm_accumshft = cur_accumshft_state & spu_maaddr_iequtwolenplus2 &
				mul_spu_shf_ack;

wire spu_mamul_mul_done_pre = tr2idle_frm_accumshft;
wire spu_mamul_mul_done_q;
dff_s #(1) muldone_dly_ff (
        .din(spu_mamul_mul_done_pre) , 
        .q(spu_mamul_mul_done_q),
        .clk (rclk), .se(se), .si(), .so()); 

assign spu_mamul_mul_done = spu_mamul_mul_done_q | spu_maaeqb_mul_done | local_stxa_abort;

assign spu_mamul_rst_iptr = tr2idle_frm_accumshft | spu_maaeqb_rst_iptr;


// the following is to reset jptr on the 1st half.
wire tr2iloopa_frm_jloopn_dly;
dff_s #(1) tr2iloopa_frm_jloopn_dly_ff (
        .din(tr2iloopa_frm_jloopn) , 
        .q(tr2iloopa_frm_jloopn_dly),
        .clk (rclk), .se(se), .si(), .so()); 

// ---------------------------------------------------------------

wire mulop_start = (spu_mactl_iss_pulse_dly & spu_mactl_mulop & ~spu_maaddr_aequb_q) | 
			spu_maexp_start_mulred_anoteqb;

assign spu_mul_areg_rst = mulop_start | spu_maaeqb_mul_areg_rst;
assign spu_mamul_rst = spu_mul_areg_rst;

assign  nxt_idle_state = (
                         state_reset | 
			 tr2idle_frm_accumshft |
                         (cur_idle_state & ~mulop_start));

// ---------------------------------------------------------------
wire tr2jloopa_frm_accumshft = cur_accumshft_state & ~spu_maaddr_iequtwolenplus2 &
				~spu_maaddr_iequtwolenplus1 & mul_spu_shf_ack;

wire tr2jloopa_frm_accumshft_dly;
dffr_s #(1) tr2jloopa_frm_accumshft_dly_ff (
        .din(tr2jloopa_frm_accumshft) ,
        .q(tr2jloopa_frm_accumshft_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

wire tr2jloopa_frm_jloopn = cur_jloopn_state & mul_spu_ack &
 		((~spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set) |
		(~spu_maaddr_jequlen & spu_maaddr_halfpnt_set)) ;

assign nxt_jloopa_state = (
			  tr2jloopa_frm_jloopn |
                          tr2jloopa_frm_accumshft_dly );


assign spu_mamul_jjptr_wen = cur_jloopm_state | spu_maaeqb_jjptr_wen;

assign spu_mamul_incr_jptr = tr2jloopa_frm_jloopn | spu_maaeqb_incr_jptr;

assign spu_mamul_jjptr_sel = cur_jloopn_state | spu_maaeqb_jjptr_sel;

//assign spu_mamul_rd_aj = nxt_jloopa_state;
assign spu_mamul_rd_aj = 
	(cur_jloopn_state & ((~spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set) |
				(~spu_maaddr_jequlen & spu_maaddr_halfpnt_set))) | 
	tr2jloopa_frm_accumshft_dly;

// ---------------------------------------------------------------
assign nxt_jloopb_state = (
                          cur_jloopa_state |
			  (cur_jloopb_state & ~mul_spu_ack));

//assign spu_mamul_rd_biminusj = nxt_jloopb_state | cur_jloopb_state;
assign spu_mamul_rd_biminusj = cur_jloopa_state;

// ---------------------------------------------------------------
assign nxt_jloopm_state = (
			  (cur_jloopb_state & mul_spu_ack));

//assign spu_mamul_rd_mj = nxt_jloopm_state;
assign spu_mamul_rd_mj = cur_jloopb_state;

// ---------------------------------------------------------------

assign nxt_jloopn_state = (
                          cur_jloopm_state |
			  (cur_jloopn_state & ~mul_spu_ack));

//assign spu_mamul_rd_niminusj = nxt_jloopn_state;
assign spu_mamul_rd_niminusj = cur_jloopm_state;

// ---------------------------------------------------------------
assign tr2iloopa_frm_jloopn = cur_jloopn_state & mul_spu_ack &
                spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set;

wire tr2iloopa_frm_idle = cur_idle_state & mulop_start;

wire tr2iloopa_frm_idle_dly;
dff_s #(1) tr2iloopa_frm_idle_ff (
        .din(tr2iloopa_frm_idle) ,
        .q(tr2iloopa_frm_idle_dly),
        .clk (rclk), .se(se), .si(), .so());


assign nxt_iloopa_state = (
                          (tr2iloopa_frm_idle_dly) |
			  (tr2iloopa_frm_jloopn));

// iloop reads are done in cur_* state where as the jloop reads
// are done in nxt_* and cur_* state(this to hold the rd indx during
// requests. Due to read of the iloop in cur_* state the spu_mul_req_vld
// is delayed by a cycle.
//assign spu_mamul_rd_ai = nxt_iloopa_state;
assign spu_mamul_rd_ai = 
	(cur_jloopn_state & (spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set)) | tr2iloopa_frm_idle_dly;

// ---------------------------------------------------------------
assign nxt_iloopb_state = (
                          (cur_iloopa_state) |
			  (cur_iloopb_state & ~mul_spu_ack));

//assign spu_mamul_rd_b0 = nxt_iloopb_state;
assign spu_mamul_rd_b0 = cur_iloopa_state;

// ---------------------------------------------------------------
assign nxt_nprime_state = (
                          (cur_iloopb_state & mul_spu_ack) |
			  (cur_nprime_state & ~mul_spu_ack));


// ---------------------------------------------------------------
// assign tr2mwrite_frm_accumshft = cur_accumshft_state & mul_spu_shf_ack & 
//                                 spu_maaddr_iequtwolenplus1; 
assign tr2mwrite_frm_accumshft_pre = cur_accumshft_state & mul_spu_shf_ack & 
                                spu_maaddr_iequtwolenplus1; 
// delaying for one cycle to allow time to do i ptr increment
// and calculate i-len-1(M[i-len-1]).This is due to skipping jloop on last
// i iteration, not enough time to do both.
dffr_s #(1) tr2mwrite_frm_accumshft_ff (
        .din(tr2mwrite_frm_accumshft_pre) , 
        .q(tr2mwrite_frm_accumshft),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

assign nxt_mwrite_state = (
			  tr2mwrite_frm_accumshft |
			  (mul_result_c5));

// assign spu_mamul_memwen = nxt_mwrite_state;
//need the following to capture mul data into flop.
wire spu_mamul_wr_mi_oprnd2_wenbyp = nxt_mwrite_state & ~spu_maaddr_halfpnt_set;
wire spu_mamul_wr_miminuslenminus1_oprnd2_wenbyp = nxt_mwrite_state & spu_maaddr_halfpnt_set;

// ---------------------------------------------------------------
assign nxt_iloopn_state = (
			  (cur_mwrite_state & ~spu_maaddr_halfpnt_set) |
			  (cur_iloopn_state & ~mul_spu_ack));

//assign spu_mamul_rd_n0 =  nxt_iloopn_state | cur_iloopn_state;
assign spu_mamul_rd_n0 =  cur_mwrite_state;

// ---------------------------------------------------------------
assign tr2accumshft_frm_mwrite = cur_mwrite_state & spu_maaddr_halfpnt_set;
assign tr2accumshft_frm_iloopn = cur_iloopn_state & mul_spu_ack;

assign nxt_accumshft_state = (
			  tr2accumshft_frm_mwrite |
			  tr2accumshft_frm_iloopn |
			  (cur_accumshft_state & ~mul_spu_shf_ack));

wire mamul_incr_iptr = tr2accumshft_frm_mwrite | tr2accumshft_frm_iloopn;

assign spu_mamul_incr_iptr = mamul_incr_iptr | spu_maaeqb_incr_iptr;


dff_s  #(1) memwen_dly_ff (
        .din(mamul_incr_iptr) ,
        .q(spu_mamul_memwen),
        .clk (rclk), .se(se), .si(), .so());

assign spu_mamul_wr_mi = spu_mamul_memwen & ~spu_maaddr_halfpnt_set;
assign spu_mamul_wr_miminuslenminus1 = spu_mamul_memwen & spu_maaddr_halfpnt_set;

// ---------------------------------------------------------------

wire cur_accumshft_pulse,cur_accumshft_q;

dff_s  #(1) cur_accumshft_pulse_ff (
        .din(cur_accumshft_state) ,
        .q(cur_accumshft_q),
        .clk (rclk), .se(se), .si(), .so());

assign cur_accumshft_pulse = ~cur_accumshft_q & cur_accumshft_state;

wire mamul_rst_jptr = mulop_start | tr2iloopa_frm_jloopn_dly |  (cur_accumshft_pulse &
			spu_maaddr_halfpnt_set & ~spu_maaddr_iequtwolenplus2 &
			~spu_maaddr_iequtwolenplus1);

assign spu_mamul_rst_jptr = mamul_rst_jptr | spu_maaeqb_rst_jptr;
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// send selects to spu_maaddr.v
// ---------------------------------------------------------------
// ---------------------------------------------------------------
assign spu_mamul_memren = spu_mamul_rd_aj | 
		spu_mamul_rd_biminusj |
		spu_mamul_rd_mj | 
		spu_mamul_rd_niminusj |
		spu_mamul_rd_ai | spu_mamul_rd_b0 | spu_mamul_rd_n0;	

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
wire mamul_a_rd_oprnd_sel = (spu_mamul_rd_aj | spu_mamul_rd_ai) & ~spu_mactl_expop;
assign spu_mamul_a_rd_oprnd_sel = mamul_a_rd_oprnd_sel | spu_maaeqb_a_rd_oprnd_sel;

wire mamul_ax_rd_oprnd_sel = (spu_mamul_rd_aj | spu_mamul_rd_ai) & spu_mactl_expop;
assign spu_mamul_ax_rd_oprnd_sel = mamul_ax_rd_oprnd_sel | spu_maaeqb_ax_rd_oprnd_sel;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//assign spu_mamul_b_rd_oprnd_sel = ((spu_mamul_rd_biminusj & ~spu_mamul_rd_aj & ~spu_mamul_rd_mj) | 
assign spu_mamul_b_rd_oprnd_sel = (spu_mamul_rd_biminusj | 
					spu_mamul_rd_b0) & ~spu_mactl_expop;

// bx should be removed, since xxnm does not start mamul, instead it starts maaeqb.
// assign spu_mamul_bx_rd_oprnd_sel = ((spu_mamul_rd_biminusj & ~spu_mamul_rd_aj & ~spu_mamul_rd_mj) | 
// 					spu_mamul_rd_b0) & spu_maexp_b_to_x_sel & spu_mactl_expop;

//assign spu_mamul_ba_rd_oprnd_sel = ((spu_mamul_rd_biminusj & ~spu_mamul_rd_aj & ~spu_mamul_rd_mj) | 
assign spu_mamul_ba_rd_oprnd_sel = (spu_mamul_rd_biminusj | 
					spu_mamul_rd_b0) & spu_mactl_expop;


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

wire mamul_m_rd_oprnd_sel = spu_mamul_rd_mj & ~spu_mactl_expop ;
assign spu_mamul_m_rd_oprnd_sel = mamul_m_rd_oprnd_sel | spu_maaeqb_m_rd_oprnd_sel  ;

wire mamul_me_rd_oprnd_sel = spu_mamul_rd_mj & spu_mactl_expop ;
assign spu_mamul_me_rd_oprnd_sel = mamul_me_rd_oprnd_sel | spu_maaeqb_me_rd_oprnd_sel  ;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//wire mamul_n_rd_oprnd_sel = (spu_mamul_rd_niminusj & ~spu_mamul_rd_aj & ~spu_mamul_rd_mj) | spu_mamul_rd_n0;
wire mamul_n_rd_oprnd_sel = spu_mamul_rd_niminusj | spu_mamul_rd_n0;
assign spu_mamul_n_rd_oprnd_sel = mamul_n_rd_oprnd_sel | spu_maaeqb_n_rd_oprnd_sel;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wire mamul_m_wr_oprnd_sel = (spu_mamul_wr_mi | spu_mamul_wr_miminuslenminus1) & 
						~spu_mactl_expop;
assign spu_mamul_m_wr_oprnd_sel = mamul_m_wr_oprnd_sel | spu_maaeqb_m_wr_oprnd_sel;

wire mamul_me_wr_oprnd_sel = (spu_mamul_wr_mi | spu_mamul_wr_miminuslenminus1) & 
						spu_mactl_expop;
assign spu_mamul_me_wr_oprnd_sel = mamul_me_wr_oprnd_sel | spu_maaeqb_me_wr_oprnd_sel;



wire mamul_m_wr_oprnd2_wen = (spu_mamul_wr_mi_oprnd2_wenbyp | 
				spu_mamul_wr_miminuslenminus1_oprnd2_wenbyp) &
                                                ~spu_mactl_expop;
wire mamul_me_wr_oprnd2_wen = (spu_mamul_wr_mi_oprnd2_wenbyp | 
				spu_mamul_wr_miminuslenminus1_oprnd2_wenbyp) &
                                                spu_mactl_expop;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

//assign spu_mamul_i_ptr_sel = (spu_mamul_rd_ai | spu_mamul_wr_mi) | spu_maaeqb_i_ptr_sel;
assign spu_mamul_i_ptr_sel = spu_mamul_rd_ai ;
assign spu_mamul_iminus1_ptr_sel = spu_mamul_wr_mi | spu_maaeqb_iminus1_ptr_sel ;

assign spu_mamul_j_ptr_sel = (spu_mamul_rd_aj | spu_mamul_rd_mj) | spu_maaeqb_j_ptr_sel;

wire mamul_iminusj_ptr_sel = 
		//(spu_mamul_rd_biminusj | spu_mamul_rd_niminusj) & ~(spu_mamul_rd_aj | spu_mamul_rd_mj);
		(spu_mamul_rd_biminusj | spu_mamul_rd_niminusj) ;
assign spu_mamul_iminusj_ptr_sel = mamul_iminusj_ptr_sel | spu_maaeqb_iminusj_ptr_sel;


assign spu_mamul_iminuslenminus1_sel = spu_mamul_wr_miminuslenminus1 | spu_maaeqb_iminuslenminus1_sel;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// request to mul unit when asserted
/*
wire iloop_or_req_d;
wire iloop_or_req = (cur_iloopb_state | cur_nprime_state | cur_iloopn_state)&
			  ~mul_spu_ack; 
dff_s #(1) iloop_dly_req_ff (
        .din(iloop_or_req) , 
        .q(iloop_or_req_d),
        .clk (rclk), .se(se), .si(), .so()); 
assign spu_mul_req_vld = (cur_jloopb_state | cur_jloopn_state | iloop_or_req_d) ;
*/


wire mamul_mul_req_vld_pre = nxt_jloopb_state | nxt_jloopn_state | nxt_iloopb_state |
                                nxt_nprime_state | nxt_iloopn_state ;

dffr_s #(1) mamul_mul_req_vld_ff (
        .din(mamul_mul_req_vld_pre) , 
        .q(mamul_mul_req_vld),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

/*
wire mamul_mul_req_vld = cur_jloopb_state | cur_jloopn_state | cur_iloopb_state |
				cur_nprime_state | cur_iloopn_state ;
*/

assign spu_mul_req_vld = mamul_mul_req_vld | spu_maaeqb_mul_req_vld;
	
// ---------------------------------------------------------------

assign spu_mul_areg_shf = cur_accumshft_state | spu_maaeqb_mul_areg_shf;
// ---------------------------------------------------------------

/*
wire oprnd2_sel = mamul_a_rd_oprnd_sel | mamul_ax_rd_oprnd_sel | 
	          mamul_m_rd_oprnd_sel | mamul_me_rd_oprnd_sel) & 
*/

wire oprnd2_sel = nxt_jloopa_state | nxt_iloopa_state | nxt_jloopm_state ;

wire oprnd2_sel_q;
dff_s #(1) oprnd2_wen_ff (
        .din(oprnd2_sel) , 
        .q(oprnd2_sel_q),
        .clk (rclk), .se(se), .si(), .so()); 

assign spu_mamul_oprnd2_wen = oprnd2_sel_q | mamul_m_wr_oprnd2_wen | mamul_me_wr_oprnd2_wen | 
				spu_mared_oprnd2_wen |
				spu_maaeqb_oprnd2_wen;

assign spu_mamul_oprnd2_bypass = mamul_m_wr_oprnd2_wen | mamul_me_wr_oprnd2_wen |
					spu_maaeqb_oprnd2_bypass;


//assign spu_mamul_oprnd1_sel = cur_nprime_state | spu_maaeqb_oprnd1_sel; // only select nprime if set

// ---------------------------------------------------------------
assign spu_mul_acc = (mamul_mul_req_vld & ~cur_nprime_state) | spu_maaeqb_mul_acc;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------


wire select_mamul = ~cur_idle_state; 


wire spu_mamul_memrd4op1 = spu_mamul_rd_biminusj | spu_mamul_rd_b0 | spu_mamul_rd_n0 |
					spu_mamul_rd_niminusj;

wire spu_mamul_memrd4op1_q;
dff_s #(1) spu_mamul_memrd4op1_ff (
        .din(spu_mamul_memrd4op1) ,
        .q(spu_mamul_memrd4op1_q),
        .clk (rclk), .se(se), .si(), .so());


wire [1:0] spu_mamul_oprnd1_mxsel;
assign spu_mamul_oprnd1_mxsel[0] = (select_mamul & (~cur_nprime_state & ~spu_mamul_memrd4op1_q)) |
				   (~select_mamul & spu_maaeqb_oprnd1_mxsel[0]) ;
assign spu_mamul_oprnd1_mxsel[1] = (select_mamul & (~cur_nprime_state & spu_mamul_memrd4op1_q)) |
				   (~select_mamul & spu_maaeqb_oprnd1_mxsel[1]);
//assign spu_mamul_oprnd1_mxsel[2] = (select_mamul & cur_nprime_state) | (~select_mamul & spu_maaeqb_oprnd1_mxsel[2]);


wire [2:0] spu_mamul_oprnd1_mxsel_ps;
assign spu_mamul_oprnd1_mxsel_ps[0] = spu_mamul_oprnd1_mxsel[0];
assign spu_mamul_oprnd1_mxsel_ps[1] = ~spu_mamul_oprnd1_mxsel[0] & spu_mamul_oprnd1_mxsel[1];
assign spu_mamul_oprnd1_mxsel_ps[2] = ~spu_mamul_oprnd1_mxsel[0] & ~spu_mamul_oprnd1_mxsel[1];


assign spu_mamul_oprnd1_mxsel_l = ~spu_mamul_oprnd1_mxsel_ps;

assign spu_mamul_oprnd1_wen = spu_mamul_memrd4op1_q | spu_maaeqb_oprnd1_wen;

endmodule
