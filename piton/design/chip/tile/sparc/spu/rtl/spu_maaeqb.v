// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_maaeqb.v
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
//      Description:   state machine to do MA mul/acc/shf when
//				A = B. 
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

module spu_maaeqb (


/*outputs*/
spu_maaeqb_memren,
spu_maaeqb_memwen,

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
spu_maaeqb_irshft_sel,
spu_maaeqb_jjptr_wen,

spu_maaeqb_oprnd2_wen,
spu_maaeqb_oprnd2_bypass,
spu_maaeqb_a_leftshft,
spu_maaeqb_oprnd1_mxsel,
spu_maaeqb_oprnd1_wen,

spu_maaeqb_mul_req_vld,
spu_maaeqb_mul_areg_shf,
spu_maaeqb_mul_acc,
spu_maaeqb_mul_areg_rst,
spu_maaeqb_mul_done,

spu_maaeqb_jjptr_sel,

/*inputs*/
spu_mactl_mulop,

spu_maaddr_iequtwolenplus2,
spu_maaddr_iequtwolenplus1,
spu_maaddr_jequiminus1,
spu_maaddr_jequlen,
spu_maaddr_halfpnt_set,
spu_mactl_iss_pulse_dly,


mul_spu_ack,
mul_spu_shf_ack,

spu_maexp_start_mulred_aequb,

spu_mactl_expop,


spu_maaddr_jequiminus1rshft,
spu_maaddr_iequtwolen,
spu_maaddr_ieven,
spu_maaddr_ieq0,

spu_maaddr_aequb,

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


input spu_maexp_start_mulred_aequb;

input spu_mactl_expop;



input spu_maaddr_jequiminus1rshft;
input spu_maaddr_iequtwolen;
input spu_maaddr_ieven;
input spu_maaddr_ieq0;


input spu_maaddr_aequb;

input spu_mactl_kill_op;
input spu_mactl_stxa_force_abort;

// ---------------------------------------------------------------

output spu_maaeqb_memwen;
output spu_maaeqb_memren;
output spu_maaeqb_rst_iptr;
output spu_maaeqb_rst_jptr;
output spu_maaeqb_incr_iptr;
output spu_maaeqb_incr_jptr;

output spu_maaeqb_a_rd_oprnd_sel;
output spu_maaeqb_ax_rd_oprnd_sel;
output spu_maaeqb_m_rd_oprnd_sel;
output spu_maaeqb_me_rd_oprnd_sel;
output spu_maaeqb_n_rd_oprnd_sel;
output spu_maaeqb_m_wr_oprnd_sel;
output spu_maaeqb_me_wr_oprnd_sel;

output spu_maaeqb_iminus1_ptr_sel;
output spu_maaeqb_j_ptr_sel;
output spu_maaeqb_iminusj_ptr_sel;
output spu_maaeqb_iminuslenminus1_sel;
output spu_maaeqb_irshft_sel;
output spu_maaeqb_jjptr_wen;

output spu_maaeqb_oprnd2_wen;
output spu_maaeqb_oprnd2_bypass;
output spu_maaeqb_a_leftshft;
output [1:0] spu_maaeqb_oprnd1_mxsel;
output spu_maaeqb_oprnd1_wen;

output spu_maaeqb_mul_req_vld;
output spu_maaeqb_mul_areg_shf;
output spu_maaeqb_mul_acc;
output spu_maaeqb_mul_areg_rst;
output spu_maaeqb_mul_done;

output spu_maaeqb_jjptr_sel;
// ---------------------------------------------------------------
wire tr2mwrite_frm_accumshft_pre;
wire tr2mwrite_frm_accumshft;
wire spu_maaeqb_rd_aj,spu_maaeqb_rd_mj,
	spu_maaeqb_rd_niminusj,spu_maaeqb_rd_ai,
	spu_maaeqb_wr_mi,spu_maaeqb_wr_miminuslenminus1,
	spu_maaeqb_rd_n0;

wire spu_maaeqb_rd_aiminusj;

wire tr2accumshft_frm_mwrite;
wire tr2accumshft_frm_iloopn;
wire nxt_mwrite_state;
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

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

dffr_s  #(1) ijloopa_state_ff (
        .din(nxt_ijloopa_state) , 
        .q(cur_ijloopa_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopn_state_ff (
        .din(nxt_jloopn_state) , 
        .q(cur_jloopn_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) jloopm_state_ff (
        .din(nxt_jloopm_state) , 
        .q(cur_jloopm_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 

dffr_s  #(1) iloopa1_state_ff (
        .din(nxt_iloopa1_state) ,
        .q(cur_iloopa1_state),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

dffr_s  #(1) iloopa_state_ff (
        .din(nxt_iloopa_state) , 
        .q(cur_iloopa_state),
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
// ---------------------------------------------------------------
// ---------------------------------------------------------------


wire spu_maaddr_aequb_q;
dff_s  #(1) spu_maaddr_aequb_ff (
        .din(spu_maaddr_aequb) ,
        .q(spu_maaddr_aequb_q),
        .clk (rclk), .se(se), .si(), .so());


// ---------------------------------------------------------------
// 5 cycle delay for mul result coming back.
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


// ----------------------------------------------------------------
// ----------------------------------------------------------------
// ---------------------------------------------------------------
wire tr2idle_frm_accumshft = cur_accumshft_state & spu_maaddr_iequtwolenplus2 &
                                mul_spu_shf_ack;


wire spu_maaeqb_mul_done_pre = tr2idle_frm_accumshft;

wire spu_maaeqb_mul_done_q;
dff_s #(1) muldone_dly_ff (
        .din(spu_maaeqb_mul_done_pre) , 
        .q(spu_maaeqb_mul_done_q),
        .clk (rclk), .se(se), .si(), .so()); 

assign spu_maaeqb_mul_done = spu_maaeqb_mul_done_q | local_stxa_abort;


assign spu_maaeqb_rst_iptr = tr2idle_frm_accumshft;


// ----------------------------------------------------------------
// transition to idle state 

wire mulop_start = (spu_mactl_iss_pulse_dly & spu_mactl_mulop & spu_maaddr_aequb_q) | 
				spu_maexp_start_mulred_aequb;

assign spu_maaeqb_mul_areg_rst = mulop_start;


assign  nxt_idle_state = (
                         state_reset |
                         tr2idle_frm_accumshft |
                         (cur_idle_state & ~mulop_start));


// ----------------------------------------------------------------
// transition to jloopa state(rdA[j])

wire tr2jloopa_frm_ijloopa = cur_ijloopa_state & mul_spu_ack & ~spu_maaddr_jequiminus1rshft;

wire tr2jloopa_frm_accumshft = cur_accumshft_state & ~spu_maaddr_iequtwolenplus2 &
                                ~spu_maaddr_iequtwolenplus1 & ~spu_maaddr_iequtwolen &
				mul_spu_shf_ack;

wire tr2jloopa_frm_accumshft_dly;
dffr_s #(1) tr2jloopa_frm_accumshft_dly_ff (
        .din(tr2jloopa_frm_accumshft) ,
        .q(tr2jloopa_frm_accumshft_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());


assign nxt_jloopa_state = (
                          tr2jloopa_frm_ijloopa |
                          tr2jloopa_frm_accumshft_dly );

//assign spu_maaeqb_rd_aj = nxt_jloopa_state;
assign spu_maaeqb_rd_aj = (cur_ijloopa_state & ~spu_maaddr_jequiminus1rshft) |
				tr2jloopa_frm_accumshft_dly;

// ----------------------------------------------------------------
// transition to jloopa state(rdA[i-j])


assign nxt_ijloopa_state = (
                          cur_jloopa_state |
                          (cur_ijloopa_state & ~mul_spu_ack));

assign spu_maaeqb_a_leftshft = cur_ijloopa_state;

//assign spu_maaeqb_rd_aiminusj = nxt_ijloopa_state | cur_ijloopa_state;
assign spu_maaeqb_rd_aiminusj = cur_jloopa_state;


// ----------------------------------------------------------------
// transition to iloopa state(rdA[i/2])

wire tr2iloopa1_frm_ijloopa = cur_ijloopa_state & mul_spu_ack & spu_maaddr_ieven &
				spu_maaddr_jequiminus1rshft;

wire tr2iloopa1_frm_accumshft = spu_maaddr_ieven & cur_accumshft_state & mul_spu_shf_ack &
			//(spu_maaddr_iequtwolenplus1 | spu_maaddr_iequtwolenplus2 |
			(spu_maaddr_iequtwolenplus1 | 
			 spu_maaddr_iequtwolen); 

wire tr2iloopa1_frm_accumshft_dly;
dffr_s #(1) tr2iloopa1_frm_accumshft_dly_ff (
        .din(tr2iloopa1_frm_accumshft) ,
        .q(tr2iloopa1_frm_accumshft_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());


wire tr2iloopa1_frm_idle = cur_idle_state & mulop_start;

wire tr2iloopa1_frm_idle_dly;
dffr_s #(1) tr2iloopa1_frm_idle_ff (
        .din(tr2iloopa1_frm_idle) ,
        .q(tr2iloopa1_frm_idle_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());



assign nxt_iloopa1_state = (
                          tr2iloopa1_frm_accumshft_dly |
                          tr2iloopa1_frm_ijloopa |
                          tr2iloopa1_frm_idle_dly) ;

wire cur_iloopa1_state_dly;
dffr_s #(1) cur_iloopa1_state_dly_ff (
        .din(cur_iloopa1_state) ,
        .q(cur_iloopa1_state_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());


assign nxt_iloopa_state = (
			  cur_iloopa1_state_dly |
                          (cur_iloopa_state & ~mul_spu_ack));



//assign spu_maaeqb_rd_ai = cur_iloopa1_state | nxt_iloopa_state | cur_iloopa_state; 

assign spu_maaeqb_rd_ai = (cur_ijloopa_state & spu_maaddr_ieven & spu_maaddr_jequiminus1rshft) |
				tr2iloopa1_frm_idle_dly |
	//(cur_accumshft_state & spu_maaddr_ieven & (spu_maaddr_iequtwolenplus1 | spu_maaddr_iequtwolen))	|
		tr2iloopa1_frm_accumshft_dly |
// above are for iloopa1 and below are for iloopa.
	(cur_iloopa1_state_dly);

// ----------------------------------------------------------------
// transition to jloopm state(rdM[j])

wire tr2jloopm_frm_ijloopa = cur_ijloopa_state & mul_spu_ack & ~spu_maaddr_ieven &
				spu_maaddr_jequiminus1rshft;

// the following is needed to reset jptr on the transition
// from ijloopa to jloopm.
wire tr2jloopm_frm_ijloopa_dly;
dffr_s #(1) tr2jloopm_frm_ijloopa_dly_ff (
        .din(tr2jloopm_frm_ijloopa) ,
        .q(tr2jloopm_frm_ijloopa_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());


wire tr2jloopm_frm_iloopa = cur_iloopa_state & mul_spu_ack & ~spu_maaddr_ieq0 ;
wire tr2jloopm_frm_iloopa_dly;
dffr_s #(1) tr2jloopm_frm_iloopa_dly_ff (
        .din(tr2jloopm_frm_iloopa) ,
        .q(tr2jloopm_frm_iloopa_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());


wire tr2jloopm_frm_jloopn = cur_jloopn_state & mul_spu_ack &
                ((~spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set) |
                (~spu_maaddr_jequlen & spu_maaddr_halfpnt_set)) ;

assign nxt_jloopm_state = (
			  tr2jloopm_frm_jloopn |
			  tr2jloopm_frm_ijloopa_dly |
			  tr2jloopm_frm_iloopa_dly);


//assign spu_maaeqb_rd_mj = nxt_jloopm_state;
assign spu_maaeqb_rd_mj = tr2jloopm_frm_ijloopa_dly | tr2jloopm_frm_iloopa_dly |
			cur_jloopn_state & 
                ((~spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set) |
                (~spu_maaddr_jequlen & spu_maaddr_halfpnt_set))	;



// ----------------------------------------------------------------
// transition to jloopn state(rdN[j])

assign nxt_jloopn_state = (
                          cur_jloopm_state |
                          (cur_jloopn_state & ~mul_spu_ack));

assign spu_maaeqb_jjptr_wen = cur_jloopa_state | cur_jloopm_state;
assign spu_maaeqb_incr_jptr = tr2jloopa_frm_ijloopa | tr2jloopm_frm_jloopn;

assign spu_maaeqb_jjptr_sel = cur_ijloopa_state | cur_jloopn_state;


//assign spu_maaeqb_rd_niminusj = nxt_jloopn_state;
assign spu_maaeqb_rd_niminusj = cur_jloopm_state;


// ----------------------------------------------------------------
// transition to nprime state

wire tr2nprime_frm_jloopn = cur_jloopn_state & mul_spu_ack &
                spu_maaddr_jequiminus1 & ~spu_maaddr_halfpnt_set;

wire tr2nprime_frm_iloopa = cur_iloopa_state & mul_spu_ack & spu_maaddr_ieq0;

assign nxt_nprime_state = (
			  tr2nprime_frm_jloopn |
			  tr2nprime_frm_iloopa |
                          (cur_nprime_state & ~mul_spu_ack));




// the following is to reset jptr on the 1st half.
wire tr2nprime_frm_jloopn_dly;
dffr_s #(1) tr2nprime_frm_jloopn_dly_ff (
        .din(tr2nprime_frm_jloopn) ,
        .q(tr2nprime_frm_jloopn_dly),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so());

// ----------------------------------------------------------------
// transition to mwrite state


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


//assign spu_maaeqb_memwen = nxt_mwrite_state;

wire spu_maaeqb_wr_mi_oprnd2_wenbyp = nxt_mwrite_state & ~spu_maaddr_halfpnt_set;
wire spu_maaeqb_wr_miminuslenminus1_oprnd2_wenbyp = nxt_mwrite_state & spu_maaddr_halfpnt_set;


// ---------------------------------------------------------------
// transition to iloopn state

assign nxt_iloopn_state = (
                          (cur_mwrite_state & ~spu_maaddr_halfpnt_set) |
                          (cur_iloopn_state & ~mul_spu_ack));


//assign spu_maaeqb_rd_n0 =  nxt_iloopn_state | cur_iloopn_state; 
assign spu_maaeqb_rd_n0 =  cur_mwrite_state; 

// ---------------------------------------------------------------
// transition to accumshft state

assign tr2accumshft_frm_mwrite = cur_mwrite_state & spu_maaddr_halfpnt_set;
assign tr2accumshft_frm_iloopn = cur_iloopn_state & mul_spu_ack;

assign nxt_accumshft_state = (
                          tr2accumshft_frm_mwrite |
                          tr2accumshft_frm_iloopn |
                          (cur_accumshft_state & ~mul_spu_shf_ack));

assign spu_maaeqb_incr_iptr = tr2accumshft_frm_mwrite | tr2accumshft_frm_iloopn;

dff_s  #(1) memwen_dly_ff (
        .din(spu_maaeqb_incr_iptr) ,
        .q(spu_maaeqb_memwen),
        .clk (rclk), .se(se), .si(), .so());

assign spu_maaeqb_wr_mi = spu_maaeqb_memwen & ~spu_maaddr_halfpnt_set;
assign spu_maaeqb_wr_miminuslenminus1 = spu_maaeqb_memwen & spu_maaddr_halfpnt_set;

// ---------------------------------------------------------------

wire cur_accumshft_pulse,cur_accumshft_q;

dff_s  #(1) cur_accumshft_pulse_ff (
        .din(cur_accumshft_state) ,
        .q(cur_accumshft_q),
        .clk (rclk), .se(se), .si(), .so());

assign cur_accumshft_pulse = ~cur_accumshft_q & cur_accumshft_state;




assign spu_maaeqb_rst_jptr = mulop_start | tr2nprime_frm_jloopn_dly |  
				tr2jloopm_frm_ijloopa | tr2iloopa1_frm_ijloopa |
			(cur_accumshft_pulse &
                        spu_maaddr_halfpnt_set & ~spu_maaddr_iequtwolenplus2 &
                        ~spu_maaddr_iequtwolenplus1);


// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// send selects to spu_maaddr.v
// ---------------------------------------------------------------
// ---------------------------------------------------------------
assign spu_maaeqb_memren = spu_maaeqb_rd_aj | 
                spu_maaeqb_rd_aiminusj |
                spu_maaeqb_rd_mj | 
                spu_maaeqb_rd_niminusj |
                spu_maaeqb_rd_ai | spu_maaeqb_rd_n0;    

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------
assign spu_maaeqb_a_rd_oprnd_sel = (spu_maaeqb_rd_aj | spu_maaeqb_rd_ai | 
					spu_maaeqb_rd_aiminusj) & ~spu_mactl_expop ;
assign spu_maaeqb_ax_rd_oprnd_sel = (spu_maaeqb_rd_aj | spu_maaeqb_rd_ai | 
					spu_maaeqb_rd_aiminusj) & spu_mactl_expop ;

assign spu_maaeqb_m_rd_oprnd_sel = spu_maaeqb_rd_mj & ~spu_mactl_expop;
assign spu_maaeqb_me_rd_oprnd_sel = spu_maaeqb_rd_mj & spu_mactl_expop  ;



assign spu_maaeqb_n_rd_oprnd_sel = (spu_maaeqb_rd_niminusj & ~spu_maaeqb_rd_mj) | 
					spu_maaeqb_rd_n0;


// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

assign spu_maaeqb_m_wr_oprnd_sel = (spu_maaeqb_wr_mi | spu_maaeqb_wr_miminuslenminus1) &
                                                ~spu_mactl_expop;
assign spu_maaeqb_me_wr_oprnd_sel = (spu_maaeqb_wr_mi | spu_maaeqb_wr_miminuslenminus1) &
                                                spu_mactl_expop;



wire spu_maaeqb_m_wr_oprnd2_wen = (spu_maaeqb_wr_mi_oprnd2_wenbyp | 
					spu_maaeqb_wr_miminuslenminus1_oprnd2_wenbyp) &
                                                ~spu_mactl_expop;
wire spu_maaeqb_me_wr_oprnd2_wen = (spu_maaeqb_wr_mi_oprnd2_wenbyp | 
					spu_maaeqb_wr_miminuslenminus1_oprnd2_wenbyp) &
                                                spu_mactl_expop;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


assign spu_maaeqb_iminus1_ptr_sel = spu_maaeqb_wr_mi;

assign spu_maaeqb_j_ptr_sel = spu_maaeqb_rd_aj | spu_maaeqb_rd_mj;
assign spu_maaeqb_iminusj_ptr_sel = 
                (spu_maaeqb_rd_aiminusj | spu_maaeqb_rd_niminusj) &
                ~(spu_maaeqb_rd_aj | spu_maaeqb_rd_mj);

assign spu_maaeqb_iminuslenminus1_sel = spu_maaeqb_wr_miminuslenminus1;


assign spu_maaeqb_irshft_sel = spu_maaeqb_rd_ai;

// ---------------------------------------------------------------
// request to mul unit when asserted

wire spu_maaeqb_mul_req_vld_pre = nxt_ijloopa_state | nxt_jloopn_state |
                                nxt_nprime_state | nxt_iloopn_state |
                                        nxt_iloopa_state;
dffr_s #(1) spu_maaeqb_mul_req_vld_ff (
        .din(spu_maaeqb_mul_req_vld_pre) , 
        .q(spu_maaeqb_mul_req_vld),
        .rst(state_reset), .clk (rclk), .se(se), .si(), .so()); 


/*
assign spu_maaeqb_mul_req_vld = cur_ijloopa_state | cur_jloopn_state | 
                                cur_nprime_state | cur_iloopn_state |
					cur_iloopa_state;
*/
        
// ---------------------------------------------------------------

assign spu_maaeqb_mul_areg_shf = cur_accumshft_state;
// ---------------------------------------------------------------

/*
wire oprnd2_sel = (spu_maaeqb_rd_aj | spu_maaeqb_rd_ai |
                  spu_maaeqb_m_rd_oprnd_sel | spu_maaeqb_me_rd_oprnd_sel) ;
*/

//wire oprnd2_sel = nxt_jloopa_state | cur_iloopa1_state | nxt_iloopa_state | nxt_jloopm_state ;
wire oprnd2_sel = nxt_jloopa_state | nxt_iloopa1_state | nxt_jloopm_state ;


wire oprnd2_sel_q;
dff_s #(1) oprnd2_wen_ff (
        .din(oprnd2_sel) , 
        .q(oprnd2_sel_q),
        .clk (rclk), .se(se), .si(), .so()); 

assign spu_maaeqb_oprnd2_wen = oprnd2_sel_q | spu_maaeqb_m_wr_oprnd2_wen |
                                spu_maaeqb_me_wr_oprnd2_wen ;



assign spu_maaeqb_oprnd2_bypass = spu_maaeqb_m_wr_oprnd2_wen | spu_maaeqb_me_wr_oprnd2_wen ;


//assign spu_maaeqb_oprnd1_sel = cur_nprime_state; // only select nprime if set

// ---------------------------------------------------------------
assign spu_maaeqb_mul_acc = spu_maaeqb_mul_req_vld & ~cur_nprime_state;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

wire spu_maaeqb_memrd4op1 = spu_maaeqb_rd_aiminusj | 
				//spu_maaeqb_rd_ai |
				cur_iloopa1_state_dly |
				spu_maaeqb_rd_niminusj | spu_maaeqb_rd_n0;

wire spu_maaeqb_memrd4op1_q;
dff_s #(1) spu_maaeqb_memrd4op1_ff (
        .din(spu_maaeqb_memrd4op1) ,
        .q(spu_maaeqb_memrd4op1_q),
        .clk (rclk), .se(se), .si(), .so());


wire [1:0] spu_maaeqb_oprnd1_mxsel;
assign spu_maaeqb_oprnd1_mxsel[0] = ~cur_nprime_state & ~spu_maaeqb_memrd4op1_q;
assign spu_maaeqb_oprnd1_mxsel[1] = ~cur_nprime_state & spu_maaeqb_memrd4op1_q;
//assign spu_maaeqb_oprnd1_mxsel[2] = cur_nprime_state;


assign spu_maaeqb_oprnd1_wen = spu_maaeqb_memrd4op1_q;



endmodule

