// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul.v
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
//	FPU multiply pipe.
//
///////////////////////////////////////////////////////////////////////////////


module fpu_mul (
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
	inq_mul,
	mul_dest_rdy,
	mul_dest_rdya,
	fmul_clken_l,
	fmul_clken_l_buf1,
	arst_l,
	grst_l,
	rclk,
	
	mul_pipe_active,
	m1stg_step,
	m6stg_fmul_in,
	m6stg_id_in,
	mul_exc_out,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	mul_sign_out,
	mul_exp_out,
	mul_frac_out,

	se_mul,
	se_mul64,
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
input		inq_mul;		// multiply pipe request
input		mul_dest_rdy;		// multiply result req accepted for CPX
input		mul_dest_rdya;		// multiply result req accepted for CPX
input		fmul_clken_l;           // fmul clock enable for mul_frac_dp
input		fmul_clken_l_buf1;           // fmul clock enable for mul_exp_dp
input		arst_l;			// global asynch. reset- asserted low
input		grst_l;			// global synch. reset- asserted low
input		rclk;			// global clock

output		mul_pipe_active;        // mul pipe is executing a valid instr
output		m1stg_step;		// multiply pipe load
output		m6stg_fmul_in;		// mul pipe output request next cycle
output [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
output [4:0]	mul_exc_out;		// multiply pipe result- exception flags
output		m6stg_fmul_dbl_dst;	// double precision multiply result
output		m6stg_fmuls;		// fmuls- multiply 6 stage
output		mul_sign_out;		// multiply sign output
output [10:0]	mul_exp_out;		// multiply exponent output
output [51:0]	mul_frac_out;		// multiply fraction output

input           se_mul;     // scan_enable for mul_frac_dp, mul_ctl, mul_exp_dp
input           se_mul64;       // scan_enable for mul64
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
wire		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
wire		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
wire		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
wire		m1stg_step;		// multiply pipe load
wire		m1stg_sngop;		// single precision operation- mul 1 stg
wire		m1stg_dblop;		// double precision operation- mul 1 stg
wire		m1stg_dblop_inv;	// single or int operation- mul 1 stg
wire		m1stg_fmul;		// multiply operation- mul 1 stage
wire		m1stg_fsmuld;		// fsmuld- multiply 1 stage
wire		m2stg_fmuls;		// fmuls- multiply 2 stage
wire		m2stg_fmuld;		// fmuld- multiply 2 stage
wire		m2stg_fsmuld;		// fsmuld- multiply 2 stage
wire		m5stg_fmuls;		// fmuls- multiply 5 stage
wire		m5stg_fmuld;		// fmuld- multiply 5 stage
wire		m5stg_fmulda;		// fmuld- multiply 5 stage copy
wire		m6stg_fmul_in;		// mul pipe output request next cycle
wire [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
wire		m6stg_fmul_dbl_dst;	// double precision multiply result
wire		m6stg_fmuls;		// fmuls- multiply 6 stage
wire		m6stg_step;		// advance the multiply pipe
wire		mul_sign_out;		// multiply sign output
wire		m5stg_in_of;		// multiply overflow- select exp out
wire [4:0]	mul_exc_out;		// multiply pipe result- exception flags
wire		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
wire		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
wire		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
wire		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
wire		m2stg_frac1_inf;	// select line to m2stg_frac1
wire		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
wire		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
wire		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
wire		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
wire		m2stg_frac2_inf;	// select line to m2stg_frac2
wire		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
wire		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
wire		m2stg_exp_expadd;	// select line to m2stg_exp
wire		m2stg_exp_0bff;		// select line to m2stg_exp
wire		m2stg_exp_017f;		// select line to m2stg_exp
wire		m2stg_exp_04ff;		// select line to m2stg_exp
wire		m2stg_exp_zero;		// select line to m2stg_exp
wire [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
wire [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
wire            m4stg_inc_exp_54;       // select line to m5stg_exp
wire            m4stg_inc_exp_55;       // select line to m5stg_exp
wire            m4stg_inc_exp_105;      // select line to m5stg_exp
wire		m4stg_left_shift_step;	// select line to m5stg_frac
wire		m4stg_right_shift_step;	// select line to m5stg_frac
wire		m5stg_to_0;		// result to max finite on overflow
wire		m5stg_to_0_inv;		// result to infinity on overflow
wire		mul_frac_out_fracadd;	// select line to mul_frac_out
wire		mul_frac_out_frac;	// select line to mul_frac_out
wire		mul_exp_out_exp_plus1;	// select line to mul_exp_out
wire		mul_exp_out_exp;	// select line to mul_exp_out
wire		mul_pipe_active;        // mul pipe is executing a valid instr

// 3/14/03: output of dffrl_async is an input to mul64
wire mul_rst_l; // reset (active low) signal for mul64


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_exp_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
wire		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
wire		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
wire [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
wire [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
wire [10:0]	mul_exp_out;		// multiply exponent output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul_frac_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [52:0]	m2stg_frac1_array_in;	// multiply array input 1
wire [52:0]	m2stg_frac2_array_in;	// multiply array input 2
wire [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
wire [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
wire		m4stg_frac_105;		// multiply stage 4a fraction input[105]
wire [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
wire		m4stg_shl_54;		// multiply shift left output bit[54]
wire		m4stg_shl_55;		// multiply shift left output bit[55]
wire [32:0]	m5stg_frac_32_0;	// multiply stage 5 fraction input
wire		m5stg_frac_dbl_nx;	// double precision inexact result
wire		m5stg_frac_sng_nx;	// single precision inexact result
wire		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
wire		m5stg_fracadd_cout;	// fraction rounding adder carry out
wire [51:0]	mul_frac_out;		// multiply fraction output


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of mul64
//
///////////////////////////////////////////////////////////////////////////////

wire [105:0]	m4stg_frac;		// multiply array output
wire [29:0] m4stg_frac_unused; // unused upper 30 bits (135:106) of the mul64 output

//Previously missing wires
wire        scan_out_fpu_mul_ctl;
wire        scan_out_fpu_mul_exp_dp;
wire        scan_out_fpu_mul_frac_dp;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_mul_ctl fpu_mul_ctl (
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
	.inq_mul			(inq_mul),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_id				(inq_id[4:0]),
	.inq_in1_63			(inq_in1[63]),
	.inq_in2_63			(inq_in2[63]),
	.mul_dest_rdy			(mul_dest_rdy),
	.mul_dest_rdya			(mul_dest_rdya),
	.m5stg_exp			(m5stg_exp[12:0]),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.m5stg_frac_neq_0		(m5stg_frac_neq_0),
	.m5stg_frac_dbl_nx		(m5stg_frac_dbl_nx),
	.m5stg_frac_sng_nx		(m5stg_frac_sng_nx),
	.m1stg_ld0_1			(m1stg_ld0_1[5:0]),
	.m1stg_ld0_2			(m1stg_ld0_2[5:0]),
	.m3stg_exp			(m3stg_exp[12:0]),
	.m3stg_expadd_eq_0		(m3stg_expadd_eq_0),
	.m3stg_expadd_lte_0_inv		(m3stg_expadd_lte_0_inv),
	.m3stg_ld0_inv			(m3stg_ld0_inv[5:0]),
	.m4stg_exp			(m4stg_exp[12:0]),
	.m4stg_frac_105			(m4stg_frac_105),
	.m5stg_frac			(m5stg_frac_32_0[32:0]),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.mula_rst_l    (mul_rst_l),
	.rclk			(rclk),

	.mul_pipe_active                (mul_pipe_active),
	.m1stg_snan_sng_in1		(m1stg_snan_sng_in1),
	.m1stg_snan_dbl_in1		(m1stg_snan_dbl_in1),
	.m1stg_snan_sng_in2		(m1stg_snan_sng_in2),
	.m1stg_snan_dbl_in2		(m1stg_snan_dbl_in2),
	.m1stg_step			(m1stg_step),
	.m1stg_sngop			(m1stg_sngop),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_dblop_inv		(m1stg_dblop_inv),
	.m1stg_fmul			(m1stg_fmul),
	.m1stg_fsmuld			(m1stg_fsmuld),
	.m2stg_fmuls			(m2stg_fmuls),
	.m2stg_fmuld			(m2stg_fmuld),
	.m2stg_fsmuld			(m2stg_fsmuld),
	.m5stg_fmuls			(m5stg_fmuls),
	.m5stg_fmuld			(m5stg_fmuld),
	.m5stg_fmulda			(m5stg_fmulda),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.m6stg_step			(m6stg_step),
	.mul_sign_out			(mul_sign_out),
	.m5stg_in_of			(m5stg_in_of),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m2stg_frac1_dbl_norm		(m2stg_frac1_dbl_norm),
	.m2stg_frac1_dbl_dnrm		(m2stg_frac1_dbl_dnrm),
	.m2stg_frac1_sng_norm		(m2stg_frac1_sng_norm),
	.m2stg_frac1_sng_dnrm		(m2stg_frac1_sng_dnrm),
	.m2stg_frac1_inf		(m2stg_frac1_inf),
	.m2stg_frac2_dbl_norm		(m2stg_frac2_dbl_norm),
	.m2stg_frac2_dbl_dnrm		(m2stg_frac2_dbl_dnrm),
	.m2stg_frac2_sng_norm		(m2stg_frac2_sng_norm),
	.m2stg_frac2_sng_dnrm		(m2stg_frac2_sng_dnrm),
	.m2stg_frac2_inf		(m2stg_frac2_inf),
	.m1stg_inf_zero_in		(m1stg_inf_zero_in),
	.m1stg_inf_zero_in_dbl		(m1stg_inf_zero_in_dbl),
	.m2stg_exp_expadd		(m2stg_exp_expadd),
	.m2stg_exp_0bff			(m2stg_exp_0bff),
	.m2stg_exp_017f			(m2stg_exp_017f),
	.m2stg_exp_04ff			(m2stg_exp_04ff),
	.m2stg_exp_zero			(m2stg_exp_zero),
	.m3bstg_ld0_inv			(m3bstg_ld0_inv[6:0]),
	.m4stg_sh_cnt_in		(m4stg_sh_cnt_in[5:0]),
	.m4stg_inc_exp_54		(m4stg_inc_exp_54),
	.m4stg_inc_exp_55		(m4stg_inc_exp_55),
	.m4stg_inc_exp_105		(m4stg_inc_exp_105),
	.m4stg_left_shift_step		(m4stg_left_shift_step),
	.m4stg_right_shift_step		(m4stg_right_shift_step),
	.m5stg_to_0			(m5stg_to_0),
	.m5stg_to_0_inv			(m5stg_to_0_inv),
	.mul_frac_out_fracadd		(mul_frac_out_fracadd),
	.mul_frac_out_frac		(mul_frac_out_frac),
	.mul_exp_out_exp_plus1		(mul_exp_out_exp_plus1),
	.mul_exp_out_exp		(mul_exp_out_exp),

	.se                             (se_mul),
        .si                             (si),
        .so                             (scan_out_fpu_mul_ctl)
);


fpu_mul_exp_dp fpu_mul_exp_dp (
	.inq_in1			(inq_in1[62:52]),
	.inq_in2			(inq_in2[62:52]),
	.m6stg_step			(m6stg_step),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_sngop			(m1stg_sngop),
	.m2stg_exp_expadd		(m2stg_exp_expadd),
	.m2stg_exp_0bff			(m2stg_exp_0bff),
	.m2stg_exp_017f			(m2stg_exp_017f),
	.m2stg_exp_04ff			(m2stg_exp_04ff),
	.m2stg_exp_zero			(m2stg_exp_zero),
	.m1stg_fsmuld			(m1stg_fsmuld),
	.m2stg_fmuld			(m2stg_fmuld),
	.m2stg_fmuls			(m2stg_fmuls),
	.m2stg_fsmuld			(m2stg_fsmuld),
	.m3stg_ld0_inv			(m3stg_ld0_inv[6:0]),
	.m4stg_inc_exp_54		(m4stg_inc_exp_54),
	.m4stg_inc_exp_55		(m4stg_inc_exp_55),
	.m4stg_inc_exp_105		(m4stg_inc_exp_105),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.mul_exp_out_exp_plus1		(mul_exp_out_exp_plus1),
	.mul_exp_out_exp		(mul_exp_out_exp),
	.m5stg_in_of			(m5stg_in_of),
	.m5stg_fmuld			(m5stg_fmuld),
	.m5stg_to_0_inv			(m5stg_to_0_inv),
	.m4stg_shl_54			(m4stg_shl_54),
	.m4stg_shl_55			(m4stg_shl_55),
	.fmul_clken_l			(fmul_clken_l_buf1),
	.rclk			(rclk),

	.m3stg_exp			(m3stg_exp[12:0]),
	.m3stg_expadd_eq_0		(m3stg_expadd_eq_0),
	.m3stg_expadd_lte_0_inv		(m3stg_expadd_lte_0_inv),
	.m4stg_exp			(m4stg_exp[12:0]),
	.m5stg_exp			(m5stg_exp[12:0]),
	.mul_exp_out			(mul_exp_out[10:0]),

	.se                             (se_mul),
        .si                             (scan_out_fpu_mul_ctl),
        .so                             (scan_out_fpu_mul_exp_dp)
);


fpu_mul_frac_dp fpu_mul_frac_dp (
	.inq_in1			(inq_in1[54:0]),
	.inq_in2			(inq_in2[54:0]),
	.m6stg_step			(m6stg_step),
	.m2stg_frac1_dbl_norm		(m2stg_frac1_dbl_norm),
	.m2stg_frac1_dbl_dnrm		(m2stg_frac1_dbl_dnrm),
	.m2stg_frac1_sng_norm		(m2stg_frac1_sng_norm),
	.m2stg_frac1_sng_dnrm		(m2stg_frac1_sng_dnrm),
	.m2stg_frac1_inf		(m2stg_frac1_inf),
	.m1stg_snan_dbl_in1		(m1stg_snan_dbl_in1),
	.m1stg_snan_sng_in1		(m1stg_snan_sng_in1),
	.m2stg_frac2_dbl_norm		(m2stg_frac2_dbl_norm),
	.m2stg_frac2_dbl_dnrm		(m2stg_frac2_dbl_dnrm),
	.m2stg_frac2_sng_norm		(m2stg_frac2_sng_norm),
	.m2stg_frac2_sng_dnrm		(m2stg_frac2_sng_dnrm),
	.m2stg_frac2_inf		(m2stg_frac2_inf),
	.m1stg_snan_dbl_in2		(m1stg_snan_dbl_in2),
	.m1stg_snan_sng_in2		(m1stg_snan_sng_in2),
	.m1stg_inf_zero_in		(m1stg_inf_zero_in),
	.m1stg_inf_zero_in_dbl		(m1stg_inf_zero_in_dbl),
	.m1stg_dblop			(m1stg_dblop),
	.m1stg_dblop_inv		(m1stg_dblop_inv),
	.m4stg_frac			(m4stg_frac),
	.m4stg_sh_cnt_in		(m4stg_sh_cnt_in[5:0]),
	.m3bstg_ld0_inv			(m3bstg_ld0_inv[6:0]),
	.m4stg_left_shift_step		(m4stg_left_shift_step),
	.m4stg_right_shift_step		(m4stg_right_shift_step),
	.m5stg_fmuls			(m5stg_fmuls),
	.m5stg_fmulda			(m5stg_fmulda),
	.mul_frac_out_fracadd		(mul_frac_out_fracadd),
	.mul_frac_out_frac		(mul_frac_out_frac),
	.m5stg_in_of			(m5stg_in_of),
	.m5stg_to_0			(m5stg_to_0),
	.fmul_clken_l			(fmul_clken_l),
	.rclk			(rclk),

	.m2stg_frac1_array_in		(m2stg_frac1_array_in),
	.m2stg_frac2_array_in		(m2stg_frac2_array_in),
	.m1stg_ld0_1			(m1stg_ld0_1),
	.m1stg_ld0_2			(m1stg_ld0_2),
	.m4stg_frac_105			(m4stg_frac_105),
	.m3stg_ld0_inv			(m3stg_ld0_inv[6:0]),
	.m4stg_shl_54			(m4stg_shl_54),
	.m4stg_shl_55			(m4stg_shl_55),
	.m5stg_frac_32_0		(m5stg_frac_32_0[32:0]),
	.m5stg_frac_dbl_nx		(m5stg_frac_dbl_nx),
	.m5stg_frac_sng_nx		(m5stg_frac_sng_nx),
	.m5stg_frac_neq_0		(m5stg_frac_neq_0),
	.m5stg_fracadd_cout		(m5stg_fracadd_cout),
	.mul_frac_out			(mul_frac_out[51:0]),

	.se                             (se_mul),
        .si                             (scan_out_fpu_mul_exp_dp),
        .so                             (scan_out_fpu_mul_frac_dp)
);


// 3/14/03: Promoted mul64 to unit level. Got rid of fpu_mul_array. Same representation for RTL and gates. Also, now agreed that mul64 will not have dffrl_async inside, so the staged signal mul_rst_l is sent from fpu_mul_ctl. mul64 port step has been renamed to mul_step to avoid conflicts with DEF keyword STEP in some backend flows (WARP).
mul64 i_m4stg_frac (
	.rs1_l ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
		1'b1, 1'b1, 1'b1, m2stg_frac1_array_in[52:0]}),
	.rs2 ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, m2stg_frac2_array_in[52:0]}),
	.valid(m1stg_fmul),
	.areg ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0,
		1'b0}),
	.accreg ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
	.x2 (1'b0),
	.rclk (rclk),
	.si (scan_out_fpu_mul_frac_dp),
	.se (se_mul64),
	.mul_rst_l (mul_rst_l),
	.mul_step (m6stg_step),
	.so (so),
	.out ({m4stg_frac_unused[29:0], m4stg_frac[105:0]})
);

endmodule


