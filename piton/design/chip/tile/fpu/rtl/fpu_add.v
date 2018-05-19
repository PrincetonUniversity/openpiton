// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add.v
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
//	FPU add pipe.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_add (
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_fcc,
	inq_in1,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_add,
	add_dest_rdy,
	fadd_clken_l,
	arst_l,
	grst_l,
	rclk,

	add_pipe_active,	
	a1stg_step,
	a6stg_fadd_in,
	add_id_out_in,
	a6stg_fcmpop,
	add_exc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	add_sign_out,
	add_exp_out,
	add_frac_out,
	add_cc_out,
	add_fcc_out,

	se_add_exp,
	se_add_frac,
	si,
	so
);


input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [1:0]	inq_fcc;		// request cc ID to op pipes
input [63:0]	inq_in1;		// request operand 1 to op pipes
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1 exp==0
input		inq_in1_exp_neq_ffs;	// request operand 1 exp!=0xff's
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2 exp==0
input		inq_in2_exp_neq_ffs;	// request operand 2 exp!=0xff's
input		inq_add;		// add pipe request
input		add_dest_rdy;		// add result req accepted for CPX
input		fadd_clken_l;           // fadd clock enable
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		add_pipe_active;        // add pipe is executing a valid instr
output		a1stg_step;		// add pipe load
output		a6stg_fadd_in;		// add pipe output request next cycle
output [9:0]    add_id_out_in;		// add pipe output ID next cycle
output		a6stg_fcmpop;		// compare- add 6 stage
output [4:0]	add_exc_out;		// add pipe result- exception flags
output		a6stg_dbl_dst;		// float double result- add 6 stage
output		a6stg_sng_dst;		// float single result- add 6 stage
output		a6stg_long_dst;		// 64bit integer result- add 6 stage
output		a6stg_int_dst;		// 32bit integer result- add 6 stage
output		add_sign_out;		// add sign output
output [10:0]	add_exp_out;		// add exponent output
output [63:0]	add_frac_out;		// add fraction output
output [1:0]	add_cc_out;		// add pipe result- condition
output [1:0]	add_fcc_out;		// add pipe input fcc passed through

input           se_add_exp;     // scan_enable for add_exp_dp, add_ctl
input           se_add_frac;    // scan_enable for add_frac_dp
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
wire		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
wire		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
wire		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
wire		a1stg_norm_sng_in1;	// select line to normalized fraction 1
wire		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
wire		a1stg_norm_sng_in2;	// select line to normalized fraction 2
wire		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
wire		a1stg_step;		// add pipe load
wire		a1stg_stepa;		// add pipe load- copy
wire		a1stg_sngop;		// single precision operation- add 1 stg
wire		a1stg_intlngop;		// integer/long input- add 1 stage
wire		a1stg_fsdtoix;		// float to integer convert- add 1 stg
wire		a1stg_fstod;		// fstod- add 1 stage
wire		a1stg_fstoi;		// fstoi- add 1 stage
wire		a1stg_fstox;		// fstox- add 1 stage
wire		a1stg_fdtoi;		// fdtoi- add 1 stage
wire		a1stg_fdtox;		// fdtox- add 1 stage
wire		a1stg_faddsubs;		// add/subtract single- add 1 stg
wire		a1stg_faddsubd;		// add/subtract double- add 1 stg
wire		a1stg_fdtos;		// fdtos- add 1 stage
wire		a2stg_faddsubop;	// float add or subtract- add 2 stage
wire		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
wire		a2stg_fitos;		// fitos- add 2 stage
wire		a2stg_fitod;		// fitod- add 2 stage
wire		a2stg_fxtos;		// fxtos- add 2 stage
wire		a2stg_fxtod;		// fxtod- add 2 stage
wire		a3stg_faddsubop;	// denorm compare lead0[10] input select
wire [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
wire		a4stg_dblop;		// double precision operation- add 4 stg
wire		a6stg_fadd_in;		// add pipe output request next cycle
wire [9:0]	add_id_out_in;		// add pipe output ID next cycle
wire [1:0]	add_fcc_out;		// add pipe input fcc passed through
wire		a6stg_dbl_dst;		// float double result- add 6 stage
wire		a6stg_sng_dst;		// float single result- add 6 stage
wire		a6stg_long_dst;		// 64bit integer result- add 6 stage
wire		a6stg_int_dst;		// 32bit integer result- add 6 stage
wire		a6stg_fcmpop;		// compare- add 6 stage
wire		a6stg_step;		// advance the add pipe
wire		a3stg_sub_in;		// subtract in main adder- add 3 stage
wire		add_sign_out;		// add sign output
wire [1:0]	add_cc_out;		// add pipe result- condition
wire		a4stg_in_of;		// add overflow- select exp out
wire [4:0]	add_exc_out;		// add pipe result- exception flags
wire		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
wire		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
wire		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
wire		a1stg_faddsubop_inv;	// add/subtract- a1 stage
wire		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
wire		a2stg_frac1_in_nv;	// NV- make a new QNaN
wire		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
wire		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
wire		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
wire [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
wire 		a2stg_shr_cnt_5_inv_in; // right shift count input[5]- add 1 stg
wire		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
wire		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
wire		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
wire		a2stg_shr_frac2_max;	// select line to a3stg_frac2
wire		a2stg_sub_step;		// select line to a3stg_frac2
wire		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
wire		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
wire		a2stg_fracadd_frac2;	// select line to main adder input 2
wire		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
wire		a3stg_exp_7ff;		// select line to a3stg_exp
wire		a3stg_exp_ff;		// select line to a3stg_exp
wire		a3stg_exp_add;		// select line to a3stg_exp
wire		a2stg_expdec_neq_0;	// exponent will be < 54
wire		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stage
wire		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stage
wire		a3stg_fdtos_inv;	// double to single convert- add 3 stg
wire		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
wire		a4stg_rnd_frac_add_inv;	// select line to a4stg_rnd_frac
wire [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
wire		a4stg_rnd_sng;		// round to single precision- add 4 stg
wire		a4stg_rnd_dbl;		// round to double precision- add 4 stg
wire		add_frac_out_rndadd;	// select line to add_frac_out
wire		add_frac_out_rnd_frac;	// select line to add_frac_out
wire		add_frac_out_shl;	// select line to add_frac_out
wire		a4stg_to_0;		// result to max finite on overflow
wire		add_exp_out_expinc;	// select line to add_exp_out
wire		add_exp_out_exp;	// select line to add_exp_out
wire		add_exp_out_exp1;	// select line to add_exp_out
wire		add_exp_out_expadd;	// select line to add_exp_out
wire		a4stg_to_0_inv;		// result to infinity on overflow
wire            add_pipe_active;        // add pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire        	a1stg_expadd3_11;	// exponent adder 3 output- add 1 stage
wire [11:0]	a1stg_expadd1_11_0;	// exponent adder 1 output- add 1 stage
wire [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
wire [5:0]	a1stg_expadd2_5_0;	// exponent adder 2 output- add 1 stage
wire [11:0]	a2stg_exp;		// exponent- add 2 stage
wire [12:0]	a2stg_expadd;		// exponent adder- add 2 stage
wire [10:0]	a3stg_exp_10_0;		// exponent adder- add 3 stage
wire [11:0]	a4stg_exp_11_0;		// exponent adder- add 4 stage
wire [10:0]	add_exp_out;		// add exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
wire		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
wire		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
wire		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
wire		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
wire		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
wire		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
wire		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
wire		a3stg_denorm;		// denorm output- add 3 stage
wire		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
wire [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
wire		a4stg_round;		// round the result- add 4 stage
wire [5:0]	a4stg_shl_cnt;		// subtract in main adder- add 4 stage
wire		a4stg_denorm_inv;	// 0 the exponent
wire		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
wire		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
wire		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
wire		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
wire		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
wire		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
wire		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
wire		a4stg_rndadd_cout;	// fraction rounding adder carry out
wire		a4stg_frac_9_0_nx;	// inexact double precision result
wire		a4stg_frac_dbl_nx;	// inexact double precision result
wire		a4stg_frac_38_0_nx;	// inexact single precision result
wire		a4stg_frac_sng_nx;	// inexact single precision result
wire		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
wire		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
wire		add_of_out_cout;	// fraction rounding adder carry out
wire [63:0]	add_frac_out;		// add fraction output

// Previously missing wires
wire        scan_out_fpu_add_ctl;
wire        scan_out_fpu_add_exp_dp;

///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_add_ctl fpu_add_ctl (
	.inq_in1_51			(inq_in1[51]),
	.inq_in1_54			(inq_in1[54]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in2_51			(inq_in2[51]),
	.inq_in2_54			(inq_in2[54]),
	.inq_in2_63			(inq_in2[63]),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_op				(inq_op[7:0]),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_add			(inq_add),
	.add_dest_rdy			(add_dest_rdy),
	.a1stg_in2_neq_in1_frac		(a1stg_in2_neq_in1_frac),
	.a1stg_in2_gt_in1_frac		(a1stg_in2_gt_in1_frac),
	.a1stg_in2_eq_in1_exp		(a1stg_in2_eq_in1_exp),
	.a1stg_expadd1			(a1stg_expadd1_11_0[11:0]),
	.a2stg_expadd			(a2stg_expadd[11:0]),
	.a2stg_frac2hi_neq_0		(a2stg_frac2hi_neq_0),
	.a2stg_frac2lo_neq_0		(a2stg_frac2lo_neq_0),
	.a2stg_exp			(a2stg_exp[11:0]),
	.a3stg_fsdtoix_nx		(a3stg_fsdtoix_nx),
	.a3stg_fsdtoi_nx		(a3stg_fsdtoi_nx),
	.a2stg_frac2_63			(a2stg_frac2_63),
	.a4stg_exp			(a4stg_exp_11_0[11:0]),
	.add_of_out_cout		(add_of_out_cout),
	.a4stg_frac_neq_0		(a4stg_frac_neq_0),
	.a4stg_shl_data_neq_0		(a4stg_shl_data_neq_0),
	.a4stg_frac_dbl_nx		(a4stg_frac_dbl_nx),
	.a4stg_frac_sng_nx		(a4stg_frac_sng_nx),
	.a1stg_expadd2			(a1stg_expadd2_5_0[5:0]),
	.a1stg_expadd4_inv		(a1stg_expadd4_inv[10:0]),
	.a3stg_denorm			(a3stg_denorm),
	.a3stg_denorm_inv		(a3stg_denorm_inv),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a3stg_exp			(a3stg_exp_10_0[10:0]),
	.a4stg_round			(a4stg_round),
	.a3stg_lead0			(a3stg_lead0[5:0]),
	.a4stg_rnd_frac_40		(a4stg_rnd_frac_40),
	.a4stg_rnd_frac_39		(a4stg_rnd_frac_39),
	.a4stg_rnd_frac_11		(a4stg_rnd_frac_11),
	.a4stg_rnd_frac_10		(a4stg_rnd_frac_10),
	.a4stg_frac_38_0_nx		(a4stg_frac_38_0_nx),
	.a4stg_frac_9_0_nx		(a4stg_frac_9_0_nx),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

	.add_pipe_active                (add_pipe_active),
	.a1stg_denorm_sng_in1		(a1stg_denorm_sng_in1),
	.a1stg_denorm_dbl_in1		(a1stg_denorm_dbl_in1),
	.a1stg_denorm_sng_in2		(a1stg_denorm_sng_in2),
	.a1stg_denorm_dbl_in2		(a1stg_denorm_dbl_in2),
	.a1stg_norm_sng_in1		(a1stg_norm_sng_in1),
	.a1stg_norm_dbl_in1		(a1stg_norm_dbl_in1),
	.a1stg_norm_sng_in2		(a1stg_norm_sng_in2),
	.a1stg_norm_dbl_in2		(a1stg_norm_dbl_in2),
	.a1stg_step			(a1stg_step),
	.a1stg_stepa			(a1stg_stepa),
	.a1stg_sngop			(a1stg_sngop),
	.a1stg_intlngop			(a1stg_intlngop),
	.a1stg_fsdtoix			(a1stg_fsdtoix),
	.a1stg_fstod			(a1stg_fstod),
	.a1stg_fstoi			(a1stg_fstoi),
	.a1stg_fstox			(a1stg_fstox),
	.a1stg_fdtoi			(a1stg_fdtoi),
	.a1stg_fdtox			(a1stg_fdtox),
	.a1stg_faddsubs			(a1stg_faddsubs),
	.a1stg_faddsubd			(a1stg_faddsubd),
	.a1stg_fdtos			(a1stg_fdtos),
	.a2stg_faddsubop		(a2stg_faddsubop),
	.a2stg_fsdtoix_fdtos		(a2stg_fsdtoix_fdtos),
	.a2stg_fitos			(a2stg_fitos),
	.a2stg_fitod			(a2stg_fitod),
	.a2stg_fxtos			(a2stg_fxtos),
	.a2stg_fxtod			(a2stg_fxtod),
	.a3stg_faddsubop		(a3stg_faddsubop),
	.a3stg_faddsubopa		(a3stg_faddsubopa[1:0]),
	.a4stg_dblop			(a4stg_dblop),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.add_id_out_in			(add_id_out_in[9:0]),
	.add_fcc_out			(add_fcc_out[1:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.a6stg_step			(a6stg_step),
	.a3stg_sub_in			(a3stg_sub_in),
	.add_sign_out			(add_sign_out),
	.add_cc_out			(add_cc_out[1:0]),
	.a4stg_in_of			(a4stg_in_of),
	.add_exc_out			(add_exc_out[4:0]),
	.a2stg_frac1_in_frac1		(a2stg_frac1_in_frac1),
	.a2stg_frac1_in_frac2		(a2stg_frac1_in_frac2),
	.a1stg_2nan_in_inv		(a1stg_2nan_in_inv),
	.a1stg_faddsubop_inv		(a1stg_faddsubop_inv),
	.a2stg_frac1_in_qnan		(a2stg_frac1_in_qnan),
	.a2stg_frac1_in_nv		(a2stg_frac1_in_nv),
	.a2stg_frac1_in_nv_dbl		(a2stg_frac1_in_nv_dbl),
	.a2stg_frac2_in_frac1		(a2stg_frac2_in_frac1),
	.a2stg_frac2_in_qnan		(a2stg_frac2_in_qnan),
	.a2stg_shr_cnt_in		(a2stg_shr_cnt_in[5:0]),
	.a2stg_shr_cnt_5_inv_in   (a2stg_shr_cnt_5_inv_in),
	.a2stg_shr_frac2_shr_int	(a2stg_shr_frac2_shr_int),
	.a2stg_shr_frac2_shr_dbl	(a2stg_shr_frac2_shr_dbl),
	.a2stg_shr_frac2_shr_sng	(a2stg_shr_frac2_shr_sng),
	.a2stg_shr_frac2_max		(a2stg_shr_frac2_max),
	.a2stg_sub_step			(a2stg_sub_step),
	.a2stg_fracadd_frac2_inv_in	(a2stg_fracadd_frac2_inv_in),
	.a2stg_fracadd_frac2_inv_shr1_in (a2stg_fracadd_frac2_inv_shr1_in),
	.a2stg_fracadd_frac2		(a2stg_fracadd_frac2),
	.a2stg_fracadd_cin_in		(a2stg_fracadd_cin_in),
	.a3stg_exp_7ff			(a3stg_exp_7ff),
	.a3stg_exp_ff			(a3stg_exp_ff),
	.a3stg_exp_add			(a3stg_exp_add),
	.a2stg_expdec_neq_0		(a2stg_expdec_neq_0),
	.a3stg_exp10_0_eq0		(a3stg_exp10_0_eq0),
	.a3stg_exp10_1_eq0		(a3stg_exp10_1_eq0),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_rnd_frac_add_inv		(a4stg_rnd_frac_add_inv),
	.a4stg_shl_cnt_in		(a4stg_shl_cnt_in[9:0]),
	.a4stg_rnd_sng			(a4stg_rnd_sng),
	.a4stg_rnd_dbl			(a4stg_rnd_dbl),
	.add_frac_out_rndadd		(add_frac_out_rndadd),
	.add_frac_out_rnd_frac		(add_frac_out_rnd_frac),
	.add_frac_out_shl		(add_frac_out_shl),
	.a4stg_to_0			(a4stg_to_0),
	.add_exp_out_expinc		(add_exp_out_expinc),
	.add_exp_out_exp		(add_exp_out_exp),
	.add_exp_out_exp1		(add_exp_out_exp1),
	.add_exp_out_expadd		(add_exp_out_expadd),
	.a4stg_to_0_inv			(a4stg_to_0_inv),

	.se				(se_add_exp),
	.si				(si),
	.so				(scan_out_fpu_add_ctl)
);


fpu_add_exp_dp fpu_add_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.inq_op				(inq_op[1:0]),
	.inq_op_7			(inq_op[7]),
	.a1stg_step			(a1stg_stepa),
	.a1stg_faddsubd			(a1stg_faddsubd),
	.a1stg_faddsubs			(a1stg_faddsubs),
	.a1stg_fsdtoix			(a1stg_fsdtoix),
	.a6stg_step			(a6stg_step),
	.a1stg_fstod			(a1stg_fstod),
	.a1stg_fdtos			(a1stg_fdtos),
	.a1stg_fstoi			(a1stg_fstoi),
	.a1stg_fstox			(a1stg_fstox),
	.a1stg_fdtoi			(a1stg_fdtoi),
	.a1stg_fdtox			(a1stg_fdtox),
	.a2stg_fsdtoix_fdtos		(a2stg_fsdtoix_fdtos),
	.a2stg_faddsubop		(a2stg_faddsubop),
	.a2stg_fitos			(a2stg_fitos),
	.a2stg_fitod			(a2stg_fitod),
	.a2stg_fxtos			(a2stg_fxtos),
	.a2stg_fxtod			(a2stg_fxtod),
	.a3stg_exp_7ff			(a3stg_exp_7ff),
	.a3stg_exp_ff			(a3stg_exp_ff),
	.a3stg_exp_add			(a3stg_exp_add),
	.a3stg_inc_exp_inv		(a3stg_inc_exp_inv),
	.a3stg_same_exp_inv		(a3stg_same_exp_inv),
	.a3stg_dec_exp_inv		(a3stg_dec_exp_inv),
	.a3stg_faddsubop		(a3stg_faddsubop),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_shl_cnt			(a4stg_shl_cnt[5:0]),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a4stg_rndadd_cout		(a4stg_rndadd_cout),
	.add_exp_out_expinc		(add_exp_out_expinc),
	.add_exp_out_exp		(add_exp_out_exp),
	.add_exp_out_exp1		(add_exp_out_exp1),
	.a4stg_in_of			(a4stg_in_of),
	.add_exp_out_expadd		(add_exp_out_expadd),
	.a4stg_dblop			(a4stg_dblop),
	.a4stg_to_0_inv			(a4stg_to_0_inv),
	.fadd_clken_l			(fadd_clken_l),
	.rclk			(rclk),

	.a1stg_expadd3_11		(a1stg_expadd3_11),
	.a1stg_expadd1_11_0		(a1stg_expadd1_11_0[11:0]),
	.a1stg_expadd4_inv		(a1stg_expadd4_inv[10:0]),
	.a1stg_expadd2_5_0		(a1stg_expadd2_5_0[5:0]),
	.a2stg_exp			(a2stg_exp[11:0]),
	.a2stg_expadd			(a2stg_expadd[12:0]),
	.a3stg_exp_10_0			(a3stg_exp_10_0[10:0]),
	.a4stg_exp_11_0			(a4stg_exp_11_0[11:0]),
	.add_exp_out			(add_exp_out[10:0]),

	.se                             (se_add_exp),
        .si                             (scan_out_fpu_add_ctl),
        .so                             (scan_out_fpu_add_exp_dp)
);


fpu_add_frac_dp fpu_add_frac_dp (
	.inq_in1			(inq_in1[62:0]),
	.inq_in2			(inq_in2[63:0]),
	.a1stg_step			(a1stg_stepa),
	.a1stg_sngop			(a1stg_sngop),
	.a1stg_expadd3_11		(a1stg_expadd3_11),
	.a1stg_norm_dbl_in1		(a1stg_norm_dbl_in1),
	.a1stg_denorm_dbl_in1		(a1stg_denorm_dbl_in1),
	.a1stg_norm_sng_in1		(a1stg_norm_sng_in1),
	.a1stg_denorm_sng_in1		(a1stg_denorm_sng_in1),
	.a1stg_norm_dbl_in2		(a1stg_norm_dbl_in2),
	.a1stg_denorm_dbl_in2		(a1stg_denorm_dbl_in2),
	.a1stg_norm_sng_in2		(a1stg_norm_sng_in2),
	.a1stg_denorm_sng_in2		(a1stg_denorm_sng_in2),
	.a1stg_intlngop			(a1stg_intlngop),
	.a2stg_frac1_in_frac1		(a2stg_frac1_in_frac1),
	.a2stg_frac1_in_frac2		(a2stg_frac1_in_frac2),
	.a1stg_2nan_in_inv		(a1stg_2nan_in_inv),
	.a1stg_faddsubop_inv		(a1stg_faddsubop_inv),
	.a2stg_frac1_in_qnan		(a2stg_frac1_in_qnan),
	.a2stg_frac1_in_nv		(a2stg_frac1_in_nv),
	.a2stg_frac1_in_nv_dbl		(a2stg_frac1_in_nv_dbl),
	.a6stg_step			(a6stg_step),
	.a2stg_frac2_in_frac1		(a2stg_frac2_in_frac1),
	.a2stg_frac2_in_qnan		(a2stg_frac2_in_qnan),
	.a2stg_shr_cnt_in		(a2stg_shr_cnt_in[5:0]),
	.a2stg_shr_cnt_5_inv_in (a2stg_shr_cnt_5_inv_in),
	.a2stg_shr_frac2_shr_int	(a2stg_shr_frac2_shr_int),
	.a2stg_shr_frac2_shr_dbl	(a2stg_shr_frac2_shr_dbl),
	.a2stg_shr_frac2_shr_sng	(a2stg_shr_frac2_shr_sng),
	.a2stg_shr_frac2_max		(a2stg_shr_frac2_max),
	.a2stg_expadd_11		(a2stg_expadd[12]),
	.a2stg_sub_step			(a2stg_sub_step),
	.a2stg_fracadd_frac2_inv_in	(a2stg_fracadd_frac2_inv_in),
	.a2stg_fracadd_frac2_inv_shr1_in (a2stg_fracadd_frac2_inv_shr1_in),
	.a2stg_fracadd_frac2		(a2stg_fracadd_frac2),
	.a2stg_fracadd_cin_in		(a2stg_fracadd_cin_in),
	.a2stg_exp			(a2stg_exp[5:0]),
	.a2stg_expdec_neq_0		(a2stg_expdec_neq_0),
	.a3stg_faddsubopa		(a3stg_faddsubopa[1:0]),
	.a3stg_sub_in			(a3stg_sub_in),
	.a3stg_exp10_0_eq0		(a3stg_exp10_0_eq0),
	.a3stg_exp10_1_eq0		(a3stg_exp10_1_eq0),
	.a3stg_exp_0			(a3stg_exp_10_0[0]),
	.a4stg_rnd_frac_add_inv		(a4stg_rnd_frac_add_inv),
	.a3stg_fdtos_inv		(a3stg_fdtos_inv),
	.a4stg_fixtos_fxtod_inv		(a4stg_fixtos_fxtod_inv),
	.a4stg_rnd_sng			(a4stg_rnd_sng),
	.a4stg_rnd_dbl			(a4stg_rnd_dbl),
	.a4stg_shl_cnt_in		(a4stg_shl_cnt_in[9:0]),
	.add_frac_out_rndadd		(add_frac_out_rndadd),
	.add_frac_out_rnd_frac		(add_frac_out_rnd_frac),
	.a4stg_in_of			(a4stg_in_of),
	.add_frac_out_shl		(add_frac_out_shl),
	.a4stg_to_0			(a4stg_to_0),
	.fadd_clken_l			(fadd_clken_l),
	.rclk			(rclk),

	.a1stg_in2_neq_in1_frac		(a1stg_in2_neq_in1_frac),
	.a1stg_in2_gt_in1_frac		(a1stg_in2_gt_in1_frac),
	.a1stg_in2_eq_in1_exp		(a1stg_in2_eq_in1_exp),
	.a2stg_frac2_63			(a2stg_frac2_63),
	.a2stg_frac2hi_neq_0		(a2stg_frac2hi_neq_0),
	.a2stg_frac2lo_neq_0		(a2stg_frac2lo_neq_0),
	.a3stg_fsdtoix_nx		(a3stg_fsdtoix_nx),
	.a3stg_fsdtoi_nx		(a3stg_fsdtoi_nx),
	.a3stg_denorm			(a3stg_denorm),
	.a3stg_denorm_inv		(a3stg_denorm_inv),
	.a3stg_lead0			(a3stg_lead0[5:0]),
	.a4stg_round			(a4stg_round),
	.a4stg_shl_cnt			(a4stg_shl_cnt[5:0]),
	.a4stg_denorm_inv		(a4stg_denorm_inv),
	.a3stg_inc_exp_inv		(a3stg_inc_exp_inv),
	.a3stg_same_exp_inv		(a3stg_same_exp_inv),
	.a3stg_dec_exp_inv		(a3stg_dec_exp_inv),
	.a4stg_rnd_frac_40		(a4stg_rnd_frac_40),
	.a4stg_rnd_frac_39		(a4stg_rnd_frac_39),
	.a4stg_rnd_frac_11		(a4stg_rnd_frac_11),
	.a4stg_rnd_frac_10		(a4stg_rnd_frac_10),
	.a4stg_rndadd_cout		(a4stg_rndadd_cout),
	.a4stg_frac_9_0_nx		(a4stg_frac_9_0_nx),
	.a4stg_frac_dbl_nx		(a4stg_frac_dbl_nx),
	.a4stg_frac_38_0_nx		(a4stg_frac_38_0_nx),
	.a4stg_frac_sng_nx		(a4stg_frac_sng_nx),
	.a4stg_frac_neq_0		(a4stg_frac_neq_0),
	.a4stg_shl_data_neq_0		(a4stg_shl_data_neq_0),
	.add_of_out_cout		(add_of_out_cout),
	.add_frac_out			(add_frac_out[63:0]),

	.se                             (se_add_frac),
        .si                             (scan_out_fpu_add_exp_dp),
        .so                             (so)
);


endmodule


