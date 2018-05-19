// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div.v
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
///////////////////////////////////////////////////////////////////////////////
//
//	FPU divide pipe.
//
///////////////////////////////////////////////////////////////////////////////


module fpu_div (
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_in1,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_div,
	div_dest_rdy,
	fdiv_clken_l,
	fdiv_clken_l_div_exp_buf1,
	arst_l,
	grst_l,
	rclk,
	
	div_pipe_active,
	d1stg_step,
	d8stg_fdiv_in,
	div_id_out_in,
	div_exc_out,
	d8stg_fdivd,
	d8stg_fdivs,
	div_sign_out,
	div_exp_outa,
	div_frac_outa,

	se,
	si,
	so
);


input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [63:0]	inq_in1;		// request operand 1 to op pipes
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1 exp==0
input		inq_in1_exp_neq_ffs;	// request operand 1 exp!=0xff's
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2 exp==0
input		inq_in2_exp_neq_ffs;	// request operand 2 exp!=0xff's
input		inq_div;		// divide pipe request
input		div_dest_rdy;		// divide result req accepted for CPX
input		fdiv_clken_l;           // fdiv clock enable for div_frac_dp
input		fdiv_clken_l_div_exp_buf1;           // fdiv clock enable for div_exp_dp
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		div_pipe_active;        // div pipe is executing a valid instr
output		d1stg_step;		// divide pipe load
output		d8stg_fdiv_in;		// div pipe output request next cycle
output [9:0]	div_id_out_in;		// div pipe output ID next cycle
output [4:0]	div_exc_out;		// divide pipe result- exception flags
output		d8stg_fdivd;		// divide double- divide stage 8
output		d8stg_fdivs;		// divide single- divide stage 8
output		div_sign_out;		// divide sign output
output [10:0]	div_exp_outa;		// divide exponent output
output [51:0]	div_frac_outa;		// divide fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
wire		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
wire		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
wire		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
wire		d1stg_step;		// divide pipe load
wire		d1stg_dblop;		// double precision operation- d1 stg
wire		d234stg_fdiv;		// select line to div_expadd1
wire		d3stg_fdiv;		// divide operation- divide stage 3
wire		d4stg_fdiv;		// divide operation- divide stage 4
wire		d5stg_fdiva;		// divide operation- divide stage 5
wire		d5stg_fdivb;		// divide operation- divide stage 5
wire		d5stg_fdivs;		// divide single- divide stage 5
wire		d5stg_fdivd;		// divide double- divide stage 5
wire		d6stg_fdiv;		// divide operation- divide stage 6
wire		d6stg_fdivs;		// divide single- divide stage 6
wire		d6stg_fdivd;		// divide double- divide stage 6
wire		d7stg_fdiv;		// divide operation- divide stage 7
wire		d7stg_fdivd;		// divide double- divide stage 7
wire		d8stg_fdiv_in;		// div pipe output request next cycle
wire		d8stg_fdivs;		// divide single- divide stage 8
wire		d8stg_fdivd;		// divide double- divide stage 8
wire [9:0]	div_id_out_in;		// div pipe output ID next cycle
wire		div_sign_out;		// divide sign output
wire [4:0]	div_exc_out;		// divide pipe result- exception flags
wire		div_norm_frac_in1_dbl_norm; // select line to div_norm
wire		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
wire		div_norm_frac_in1_sng_norm; // select line to div_norm
wire		div_norm_frac_in1_sng_dnrm; // select line to div_norm
wire		div_norm_frac_in2_dbl_norm; // select line to div_norm
wire		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
wire		div_norm_frac_in2_sng_norm; // select line to div_norm
wire		div_norm_frac_in2_sng_dnrm; // select line to div_norm
wire		div_norm_inf;		// select line to div_norm
wire		div_norm_qnan;		// select line to div_norm
wire		div_norm_zero;		// select line to div_norm
wire		div_frac_add_in2_load;	// load enable to div_frac_add_in2
wire		d6stg_frac_out_shl1;	// select line to d6stg_frac
wire		d6stg_frac_out_nosh;	// select line to d6stg_frac
wire		div_frac_add_in1_add;	// select line to div_frac_add_in1
wire		div_frac_add_in1_load;	// load enable to div_frac_add_in1
wire		d7stg_rndup_inv;	// no rounding increment
wire		d7stg_to_0;		// result to max finite on overflow
wire		d7stg_to_0_inv;		// result to infinity on overflow
wire		div_frac_out_add_in1;	// select line to div_frac_out
wire		div_frac_out_add;	// select line to div_frac_out
wire		div_frac_out_shl1_dbl;	// select line to div_frac_out
wire		div_frac_out_shl1_sng;	// select line to div_frac_out
wire		div_frac_out_of;	// select line to div_frac_out
wire		div_frac_out_load;	// load enable to div_frac_out
wire		div_expadd1_in1_dbl;	// select line to div_expadd1
wire		div_expadd1_in1_sng;	// select line to div_expadd1
wire		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
wire		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
wire		div_exp1_expadd1;	// select line to div_exp1
wire		div_exp1_0835;		// select line to div_exp1
wire		div_exp1_0118;		// select line to div_exp1
wire		div_exp1_zero;		// select line to div_exp1
wire		div_exp1_load;		// load enable to div_exp1
wire		div_expadd2_in1_exp_out; // select line to div_expadd2
wire		div_expadd2_no_decr_inv; // no exponent decrement
wire		div_expadd2_cin;	// carry in to 2nd exponent adder
wire		div_exp_out_expadd22_inv; // select line to div_exp_out
wire		div_exp_out_expadd2;	// select line to div_exp_out
wire		div_exp_out_of;		// overflow to exponent output
wire		div_exp_out_exp_out;	// select line to div_exp_out
wire		div_exp_out_load;	// load enable to div_exp_out
wire		div_pipe_active;        // div pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [12:0]	div_exp1;		// divide exponent- intermediate value
wire [12:12]	div_expadd2;		// divide exponent- 2nd adder output
wire [12:0]	div_exp_out;		// divide exponent output- fpu_div
wire [10:0]	div_exp_outa;		// divide exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [5:0]	div_shl_cnt;		// divide left shift amount
wire		d6stg_frac_0;		// divide fraction[0]- intermediate val
wire		d6stg_frac_1;		// divide fraction[1]- intermediate val
wire		d6stg_frac_2;		// divide fraction[2]- intermediate val
wire		d6stg_frac_29;		// divide fraction[29]- intermediate val
wire		d6stg_frac_30;		// divide fraction[30]- intermediate val
wire		d6stg_frac_31;		// divide fraction[31]- intermediate val
wire		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
wire		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
wire		div_frac_add_52_inva;	// div_frac_add bit[52] inverted copy
wire [54:53]	div_frac_out;		// divide fraction output- fpu_div
wire [51:0]	div_frac_outa;		// divide fraction output

// Previously missing wires
wire        scan_out_fpu_div_ctl;
wire        scan_out_fpu_div_exp_dp;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_div_ctl fpu_div_ctl (
	.inq_in1_51			(inq_in1[51]),
	.inq_in1_54			(inq_in1[54]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in2_51			(inq_in2[51]),
	.inq_in2_54			(inq_in2[54]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_op				(inq_op[7:0]),
	.div_exp1			(div_exp1[12:0]),
	.div_dest_rdy			(div_dest_rdy),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in2_63			(inq_in2[63]),
	.inq_div			(inq_div),
	.div_exp_out			(div_exp_out[12:0]),
	.div_frac_add_52_inva		(div_frac_add_52_inva),
	.div_frac_add_in1_neq_0		(div_frac_add_in1_neq_0),
	.div_frac_out_54		(div_frac_out[54]),
	.d6stg_frac_0			(d6stg_frac_0),
	.d6stg_frac_1			(d6stg_frac_1),
	.d6stg_frac_2			(d6stg_frac_2),
	.d6stg_frac_29			(d6stg_frac_29),
	.d6stg_frac_30			(d6stg_frac_30),
	.d6stg_frac_31			(d6stg_frac_31),
	.div_frac_out_53		(div_frac_out[53]),
	.div_expadd2_12			(div_expadd2[12]),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

	.div_pipe_active		(div_pipe_active),
	.d1stg_snan_sng_in1		(d1stg_snan_sng_in1),
	.d1stg_snan_dbl_in1		(d1stg_snan_dbl_in1),
	.d1stg_snan_sng_in2		(d1stg_snan_sng_in2),
	.d1stg_snan_dbl_in2		(d1stg_snan_dbl_in2),
	.d1stg_step			(d1stg_step),
	.d1stg_dblop			(d1stg_dblop),
	.d234stg_fdiv			(d234stg_fdiv),
	.d3stg_fdiv			(d3stg_fdiv),
	.d4stg_fdiv			(d4stg_fdiv),
	.d5stg_fdiva			(d5stg_fdiva),
	.d5stg_fdivb			(d5stg_fdivb),
	.d5stg_fdivs			(d5stg_fdivs),
	.d5stg_fdivd			(d5stg_fdivd),
	.d6stg_fdiv			(d6stg_fdiv),
	.d6stg_fdivs			(d6stg_fdivs),
	.d6stg_fdivd			(d6stg_fdivd),
	.d7stg_fdiv			(d7stg_fdiv),
	.d7stg_fdivd			(d7stg_fdivd),
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.d8stg_fdivs			(d8stg_fdivs),
	.d8stg_fdivd			(d8stg_fdivd),
	.div_id_out_in			(div_id_out_in[9:0]),
	.div_sign_out			(div_sign_out),
	.div_exc_out			(div_exc_out[4:0]),
	.div_norm_frac_in1_dbl_norm	(div_norm_frac_in1_dbl_norm),
	.div_norm_frac_in1_dbl_dnrm	(div_norm_frac_in1_dbl_dnrm),
	.div_norm_frac_in1_sng_norm	(div_norm_frac_in1_sng_norm),
	.div_norm_frac_in1_sng_dnrm	(div_norm_frac_in1_sng_dnrm),
	.div_norm_frac_in2_dbl_norm	(div_norm_frac_in2_dbl_norm),
	.div_norm_frac_in2_dbl_dnrm	(div_norm_frac_in2_dbl_dnrm),
	.div_norm_frac_in2_sng_norm	(div_norm_frac_in2_sng_norm),
	.div_norm_frac_in2_sng_dnrm	(div_norm_frac_in2_sng_dnrm),
	.div_norm_inf			(div_norm_inf),
	.div_norm_qnan			(div_norm_qnan),
	.div_norm_zero			(div_norm_zero),
	.div_frac_add_in2_load		(div_frac_add_in2_load),
	.d6stg_frac_out_shl1		(d6stg_frac_out_shl1),
	.d6stg_frac_out_nosh		(d6stg_frac_out_nosh),
	.div_frac_add_in1_add		(div_frac_add_in1_add),
	.div_frac_add_in1_load		(div_frac_add_in1_load),
	.d7stg_rndup_inv		(d7stg_rndup_inv),
	.d7stg_to_0			(d7stg_to_0),
	.d7stg_to_0_inv			(d7stg_to_0_inv),
	.div_frac_out_add_in1		(div_frac_out_add_in1),
	.div_frac_out_add		(div_frac_out_add),
	.div_frac_out_shl1_dbl		(div_frac_out_shl1_dbl),
	.div_frac_out_shl1_sng		(div_frac_out_shl1_sng),
	.div_frac_out_of		(div_frac_out_of),
	.div_frac_out_load		(div_frac_out_load),
	.div_expadd1_in1_dbl		(div_expadd1_in1_dbl),
	.div_expadd1_in1_sng		(div_expadd1_in1_sng),
	.div_expadd1_in2_exp_in2_dbl	(div_expadd1_in2_exp_in2_dbl),
	.div_expadd1_in2_exp_in2_sng	(div_expadd1_in2_exp_in2_sng),
	.div_exp1_expadd1		(div_exp1_expadd1),
	.div_exp1_0835			(div_exp1_0835),
	.div_exp1_0118			(div_exp1_0118),
	.div_exp1_zero			(div_exp1_zero),
	.div_exp1_load			(div_exp1_load),
	.div_expadd2_in1_exp_out	(div_expadd2_in1_exp_out),
	.div_expadd2_no_decr_inv	(div_expadd2_no_decr_inv),
	.div_expadd2_cin		(div_expadd2_cin),
	.div_exp_out_expadd22_inv	(div_exp_out_expadd22_inv),
	.div_exp_out_expadd2		(div_exp_out_expadd2),
	.div_exp_out_of			(div_exp_out_of),
	.div_exp_out_exp_out		(div_exp_out_exp_out),
	.div_exp_out_load		(div_exp_out_load),

	.se                             (se),
        .si                             (si),
        .so                             (scan_out_fpu_div_ctl)
);


fpu_div_exp_dp fpu_div_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.d1stg_step			(d1stg_step),
	.d234stg_fdiv			(d234stg_fdiv),
	.div_expadd1_in1_dbl		(div_expadd1_in1_dbl),
	.div_expadd1_in1_sng		(div_expadd1_in1_sng),
	.div_expadd1_in2_exp_in2_dbl	(div_expadd1_in2_exp_in2_dbl),
	.div_expadd1_in2_exp_in2_sng	(div_expadd1_in2_exp_in2_sng),
	.d3stg_fdiv			(d3stg_fdiv),
	.d4stg_fdiv			(d4stg_fdiv),
	.div_shl_cnt			(div_shl_cnt[5:0]),
	.div_exp1_expadd1		(div_exp1_expadd1),
	.div_exp1_0835			(div_exp1_0835),
	.div_exp1_0118			(div_exp1_0118),
	.div_exp1_zero			(div_exp1_zero),
	.div_exp1_load			(div_exp1_load),
	.div_expadd2_in1_exp_out	(div_expadd2_in1_exp_out),
	.d5stg_fdiva			(d5stg_fdiva),
	.d5stg_fdivd			(d5stg_fdivd),
	.d5stg_fdivs			(d5stg_fdivs),
	.d6stg_fdiv			(d6stg_fdiv),
	.d7stg_fdiv			(d7stg_fdiv),
	.div_expadd2_no_decr_inv	(div_expadd2_no_decr_inv),
	.div_expadd2_cin		(div_expadd2_cin),
	.div_exp_out_expadd2		(div_exp_out_expadd2),
	.div_exp_out_expadd22_inv	(div_exp_out_expadd22_inv),
	.div_exp_out_of			(div_exp_out_of),
	.d7stg_to_0_inv			(d7stg_to_0_inv),
	.d7stg_fdivd			(d7stg_fdivd),
	.div_exp_out_exp_out		(div_exp_out_exp_out),
	.d7stg_rndup_inv		(d7stg_rndup_inv),
	.div_frac_add_52_inv		(div_frac_add_52_inv),
	.div_exp_out_load		(div_exp_out_load),
	.fdiv_clken_l			(fdiv_clken_l_div_exp_buf1),
	.rclk			(rclk),

	.div_exp1			(div_exp1[12:0]),
	.div_expadd2_12			(div_expadd2[12]),
	.div_exp_out			(div_exp_out[12:0]),
	.div_exp_outa			(div_exp_outa[10:0]),

	.se                             (se),
        .si                             (scan_out_fpu_div_ctl),
        .so                             (scan_out_fpu_div_exp_dp)
);


fpu_div_frac_dp fpu_div_frac_dp (
	.inq_in1			(inq_in1[54:0]),
	.inq_in2			(inq_in2[54:0]),
	.d1stg_step			(d1stg_step),
	.div_norm_frac_in1_dbl_norm	(div_norm_frac_in1_dbl_norm),
	.div_norm_frac_in1_dbl_dnrm	(div_norm_frac_in1_dbl_dnrm),
	.div_norm_frac_in1_sng_norm	(div_norm_frac_in1_sng_norm),
	.div_norm_frac_in1_sng_dnrm	(div_norm_frac_in1_sng_dnrm),
	.div_norm_frac_in2_dbl_norm	(div_norm_frac_in2_dbl_norm),
	.div_norm_frac_in2_dbl_dnrm	(div_norm_frac_in2_dbl_dnrm),
	.div_norm_frac_in2_sng_norm	(div_norm_frac_in2_sng_norm),
	.div_norm_frac_in2_sng_dnrm	(div_norm_frac_in2_sng_dnrm),
	.div_norm_inf			(div_norm_inf),
	.div_norm_qnan			(div_norm_qnan),
	.d1stg_dblop			(d1stg_dblop),
	.div_norm_zero			(div_norm_zero),
	.d1stg_snan_dbl_in1		(d1stg_snan_dbl_in1),
	.d1stg_snan_sng_in1		(d1stg_snan_sng_in1),
	.d1stg_snan_dbl_in2		(d1stg_snan_dbl_in2),
	.d1stg_snan_sng_in2		(d1stg_snan_sng_in2),
	.d3stg_fdiv			(d3stg_fdiv),
	.d6stg_fdiv			(d6stg_fdiv),
	.d6stg_fdivd			(d6stg_fdivd),
	.d6stg_fdivs			(d6stg_fdivs),
	.div_frac_add_in2_load		(div_frac_add_in2_load),
	.d6stg_frac_out_shl1		(d6stg_frac_out_shl1),
	.d6stg_frac_out_nosh		(d6stg_frac_out_nosh),
	.d4stg_fdiv			(d4stg_fdiv),
	.div_frac_add_in1_add		(div_frac_add_in1_add),
	.div_frac_add_in1_load		(div_frac_add_in1_load),
	.d5stg_fdivb			(d5stg_fdivb),
	.div_frac_out_add_in1		(div_frac_out_add_in1),
	.div_frac_out_add		(div_frac_out_add),
	.div_frac_out_shl1_dbl		(div_frac_out_shl1_dbl),
	.div_frac_out_shl1_sng		(div_frac_out_shl1_sng),
	.div_frac_out_of		(div_frac_out_of),
	.d7stg_to_0			(d7stg_to_0),
	.div_frac_out_load		(div_frac_out_load),
	.fdiv_clken_l			(fdiv_clken_l),
	.rclk			(rclk),

	.div_shl_cnt			(div_shl_cnt[5:0]),
	.d6stg_frac_0			(d6stg_frac_0),
	.d6stg_frac_1			(d6stg_frac_1),
	.d6stg_frac_2			(d6stg_frac_2),
	.d6stg_frac_29			(d6stg_frac_29),
	.d6stg_frac_30			(d6stg_frac_30),
	.d6stg_frac_31			(d6stg_frac_31),
	.div_frac_add_in1_neq_0		(div_frac_add_in1_neq_0),
	.div_frac_add_52_inv		(div_frac_add_52_inv),
	.div_frac_add_52_inva		(div_frac_add_52_inva),
	.div_frac_out_54_53      	(div_frac_out[54:53]),
	.div_frac_outa			(div_frac_outa[51:0]),

	.se                             (se),
        .si                             (scan_out_fpu_div_exp_dp),
        .so                             (so)
);


endmodule


