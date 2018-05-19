// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_ctl.v
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
//	Multiply pipeline synthesizable logic
//              - special input cases
//              - opcode pipeline
//              - sign logic
//              - exception logic
//              - datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////


module fpu_mul_ctl (
	inq_in1_51,
	inq_in1_54,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_51,
	inq_in2_54,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_op,
	inq_mul,
	inq_rnd_mode,
	inq_id,
	inq_in1_63,
	inq_in2_63,
	mul_dest_rdy,
	mul_dest_rdya,
	m5stg_exp,
	m5stg_fracadd_cout,
	m5stg_frac_neq_0,
	m5stg_frac_dbl_nx,
	m5stg_frac_sng_nx,
	m1stg_ld0_1,
	m1stg_ld0_2,
	m3stg_exp,
	m3stg_expadd_eq_0,
	m3stg_expadd_lte_0_inv,
	m3stg_ld0_inv,
	m4stg_exp,
	m4stg_frac_105,
	m5stg_frac,
	arst_l,
	grst_l,
	rclk,

	mul_pipe_active,
	m1stg_snan_sng_in1,
	m1stg_snan_dbl_in1,
	m1stg_snan_sng_in2,
	m1stg_snan_dbl_in2,
	m1stg_step,
	m1stg_sngop,
	m1stg_dblop,
	m1stg_dblop_inv,
	m1stg_fmul,
	m1stg_fsmuld,
	m2stg_fmuls,
	m2stg_fmuld,
	m2stg_fsmuld,
	m5stg_fmuls,
	m5stg_fmuld,
	m5stg_fmulda,
	m6stg_fmul_in,
	m6stg_id_in,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	m6stg_step,
	mul_sign_out,
	m5stg_in_of,
	mul_exc_out,
	m2stg_frac1_dbl_norm,
	m2stg_frac1_dbl_dnrm,
	m2stg_frac1_sng_norm,
	m2stg_frac1_sng_dnrm,
	m2stg_frac1_inf,
	m2stg_frac2_dbl_norm,
	m2stg_frac2_dbl_dnrm,
	m2stg_frac2_sng_norm,
	m2stg_frac2_sng_dnrm,
	m2stg_frac2_inf,
	m1stg_inf_zero_in,
	m1stg_inf_zero_in_dbl,
	m2stg_exp_expadd,
	m2stg_exp_0bff,
	m2stg_exp_017f,
	m2stg_exp_04ff,
	m2stg_exp_zero,
	m3bstg_ld0_inv,
	m4stg_sh_cnt_in,
	m4stg_inc_exp_54,
	m4stg_inc_exp_55,
	m4stg_inc_exp_105,
	m4stg_left_shift_step,
	m4stg_right_shift_step,
	m5stg_to_0,
	m5stg_to_0_inv,
	mul_frac_out_fracadd,
	mul_frac_out_frac,
	mul_exp_out_exp_plus1,
	mul_exp_out_exp,
	mula_rst_l,

	se,
	si,
	so
);


parameter
		FMULS=  8'h49,
		FMULD=	8'h4a,
		FSMULD=	8'h69;


input		inq_in1_51;		// request operand 1[51]
input		inq_in1_54;		// request operand 1[54]
input		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1[62:52]==0
input		inq_in1_exp_neq_ffs;	// request operand 1[62:52]!=0x7ff
input		inq_in2_51;		// request operand 2[51]
input		inq_in2_54;		// request operand 2[54]
input		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2[62:52]==0
input		inq_in2_exp_neq_ffs;	// request operand 2[62:52]!=0x7ff
input [7:0]	inq_op;			// request opcode to op pipes
input		inq_mul;		// multiply pipe request
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input		inq_in1_63;		// request[63] operand 1 to op pipes
input		inq_in2_63;		// request[63] operand 2 to op pipes
input		mul_dest_rdy;		// multiply result req accepted for CPX
input		mul_dest_rdya;		// multiply result req accepted for CPX
input [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
input		m5stg_fracadd_cout;	// fraction rounding adder carry out
input		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
input		m5stg_frac_dbl_nx;	// double precision inexact result
input		m5stg_frac_sng_nx;	// single precision inexact result
input [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
input [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
input [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
input		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
input		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
input [5:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
input [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
input		m4stg_frac_105;	// multiply stage 4a fraction input[105]
input [32:0]	m5stg_frac;		// multiply stage 5 fraction input
input		arst_l;			// asynchronous global reset- asserted low
input		grst_l;			// synchronous global reset- asserted low
input		rclk;		// global clock

output		mul_pipe_active;        // mul pipe is executing a valid instr
output		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
output		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
output		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
output		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
output		m1stg_step;		// multiply pipe load
output		m1stg_sngop;		// single precision operation- mul 1 stg
output		m1stg_dblop;		// double precision operation- mul 1 stg
output		m1stg_dblop_inv;	// single or int operation- mul 1 stg
output		m1stg_fmul;		// multiply operation- mul 1 stage
output		m1stg_fsmuld;		// fsmuld- multiply 1 stage
output		m2stg_fmuls;		// fmuls- multiply 2 stage
output		m2stg_fmuld;		// fmuld- multiply 2 stage
output		m2stg_fsmuld;		// fsmuld- multiply 2 stage
output		m5stg_fmuls;		// fmuls- multiply 5 stage
output		m5stg_fmuld;		// fmuld- multiply 5 stage
output		m5stg_fmulda;		// fmuld- multiply 5 stage copy
output		m6stg_fmul_in;		// mul pipe output request next cycle
output [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
output		m6stg_fmul_dbl_dst;	// double precision multiply result
output		m6stg_fmuls;		// fmuls- multiply 6 stage
output		m6stg_step;		// advance the multiply pipe
output		mul_sign_out;		// multiply sign output
output		m5stg_in_of;		// multiply overflow- select exp out
output [4:0]	mul_exc_out;		// multiply pipe result- exception flags
output		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
output		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
output		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
output		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
output		m2stg_frac1_inf;	// select line to m2stg_frac1
output		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
output		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
output		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
output		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
output		m2stg_frac2_inf;	// select line to m2stg_frac2
output		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
output		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
output		m2stg_exp_expadd;	// select line to m2stg_exp
output		m2stg_exp_0bff;		// select line to m2stg_exp
output		m2stg_exp_017f;		// select line to m2stg_exp
output		m2stg_exp_04ff;		// select line to m2stg_exp
output		m2stg_exp_zero;		// select line to m2stg_exp
output [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
output [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
output          m4stg_inc_exp_54;       // select line to m5stg_exp
output          m4stg_inc_exp_55;       // select line to m5stg_exp
output          m4stg_inc_exp_105;      // select line to m5stg_exp
output		m4stg_left_shift_step;	// select line to m5stg_frac
output		m4stg_right_shift_step;	// select line to m5stg_frac
output		m5stg_to_0;		// result to max finite on overflow
output		m5stg_to_0_inv;		// result to infinity on overflow
output		mul_frac_out_fracadd;	// select line to mul_frac_out
output		mul_frac_out_frac;	// select line to mul_frac_out
output		mul_exp_out_exp_plus1;	// select line to mul_exp_out
output		mul_exp_out_exp;	// select line to mul_exp_out
output    mula_rst_l; // reset for mul64

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		mul_frac_in1_51;
wire		mul_frac_in1_54;
wire		mul_frac_in1_53_0_neq_0;
wire		mul_frac_in1_50_0_neq_0;
wire		mul_frac_in1_53_32_neq_0;
wire		mul_exp_in1_exp_eq_0;
wire		mul_exp_in1_exp_neq_ffs;
wire		mul_frac_in2_51;
wire		mul_frac_in2_54;
wire		mul_frac_in2_53_0_neq_0;
wire		mul_frac_in2_50_0_neq_0;
wire		mul_frac_in2_53_32_neq_0;
wire		mul_exp_in2_exp_eq_0;
wire		mul_exp_in2_exp_neq_ffs;
wire		m1stg_denorm_sng_in1;
wire		m1stg_denorm_dbl_in1;
wire		m1stg_denorm_sng_in2;
wire		m1stg_denorm_dbl_in2;
wire		m1stg_denorm_in1;
wire		m1stg_denorm_in2;
wire		m1stg_norm_sng_in1;
wire		m1stg_norm_dbl_in1;
wire		m1stg_norm_sng_in2;
wire		m1stg_norm_dbl_in2;
wire		m1stg_snan_sng_in1;
wire		m1stg_snan_dbl_in1;
wire		m1stg_snan_sng_in2;
wire		m1stg_snan_dbl_in2;
wire		m1stg_qnan_sng_in1;
wire		m1stg_qnan_dbl_in1;
wire		m1stg_qnan_sng_in2;
wire		m1stg_qnan_dbl_in2;
wire		m1stg_snan_in1;
wire		m1stg_snan_in2;
wire		m1stg_qnan_in1;
wire		m1stg_qnan_in2;
wire		m2stg_snan_in1;
wire		m2stg_snan_in2;
wire		m2stg_qnan_in1;
wire		m2stg_qnan_in2;
wire		m1stg_nan_sng_in1;
wire		m1stg_nan_dbl_in1;
wire		m1stg_nan_sng_in2;
wire		m1stg_nan_dbl_in2;
wire		m1stg_nan_in1;
wire		m1stg_nan_in2;
wire		m2stg_nan_in2;
wire		m1stg_inf_sng_in1;
wire		m1stg_inf_dbl_in1;
wire		m1stg_inf_sng_in2;
wire		m1stg_inf_dbl_in2;
wire		m1stg_inf_in1;
wire		m1stg_inf_in2;
wire		m1stg_inf_in;
wire		m2stg_inf_in1;
wire		m2stg_inf_in2;
wire		m2stg_inf_in;
wire		m1stg_infnan_sng_in1;
wire		m1stg_infnan_dbl_in1;
wire		m1stg_infnan_sng_in2;
wire		m1stg_infnan_dbl_in2;
wire		m1stg_infnan_in1;
wire		m1stg_infnan_in2;
wire		m1stg_infnan_in;
wire		m1stg_zero_in1;
wire		m1stg_zero_in2;
wire		m1stg_zero_in;
wire		m2stg_zero_in1;
wire		m2stg_zero_in2;
wire		m2stg_zero_in;
wire		m1stg_step;
wire [7:0]	m1stg_op_in;
wire [7:0]	m1stg_op;
wire		m1stg_mul_in;
wire		m1stg_mul;
wire		m1stg_sngop;
wire [3:0]	m1stg_sngopa;
wire		m1stg_dblop;
wire [3:0]	m1stg_dblopa;
wire		m1stg_dblop_inv_in;
wire		m1stg_dblop_inv;
wire [1:0]	m1stg_rnd_mode;
wire [4:0]	m1stg_id;
wire		m1stg_fmul;
wire		m1stg_fmul_dbl_dst;
wire		m1stg_fmuls;
wire		m1stg_fmuld;
wire		m1stg_fsmuld;
wire [4:0]	m1stg_opdec;
wire [4:0]	m2stg_opdec;
wire [1:0]	m2stg_rnd_mode;
wire [4:0]	m2stg_id;
wire		m2stg_fmul;
wire		m2stg_fmuls;
wire		m2stg_fmuld;
wire		m2stg_fsmuld;
wire [4:1]	m3astg_opdec;
wire [1:0]	m3astg_rnd_mode;
wire [4:0]	m3astg_id;
wire [4:1]	m3bstg_opdec;
wire [1:0]	m3bstg_rnd_mode;
wire [4:0]	m3bstg_id;
wire [4:1]	m3stg_opdec;
wire [1:0]	m3stg_rnd_mode;
wire [4:0]	m3stg_id;
wire		m3stg_fmul;
wire [4:1]	m4stg_opdec;
wire [1:0]	m4stg_rnd_mode;
wire [4:0]	m4stg_id;
wire		m4stg_fmul;
wire		m4stg_fmuld;
wire [4:1]	m5stg_opdec;
wire [1:0]	m5stg_rnd_mode;
wire [4:0]	m5stg_id;
wire		m5stg_fmul;
wire		m5stg_fmuls;
wire		m5stg_fmuld;
wire		m5stg_fmulda;
wire		m6stg_fmul_in;
wire [4:2]	m6stg_opdec;
wire [9:0]	m6stg_id_in;
wire [9:0]	m6stg_id;
wire		m6stg_fmul;
wire		m6stg_fmul_dbl_dst;
wire		m6stg_fmuls;
wire		m6stg_hold;
wire		m6stg_holda;
wire		m6stg_step;
wire		m6stg_stepa;
wire		m1stg_sign1;
wire		m1stg_sign2;
wire		m2stg_sign1;
wire		m2stg_sign2;
wire		m1stg_of_mask;
wire		m2stg_of_mask;
wire		m2stg_sign;
wire		m3astg_sign;
wire		m2stg_nv;
wire		m3astg_nv;
wire		m3astg_of_mask;
wire		m3bstg_sign;
wire		m3bstg_nv;
wire		m3stg_sign;
wire		m3stg_nv;
wire		m3stg_of_mask;
wire		m4stg_sign;
wire		m4stg_nv;
wire		m4stg_of_mask;
wire		m5stg_sign;
wire		m5stg_nv;
wire		m5stg_of_mask;
wire		mul_sign_out;
wire		mul_nv_out;
wire		m5stg_in_of;
wire		mul_of_out_tmp1_in;
wire		mul_of_out_tmp1;
wire		mul_of_out_tmp2;
wire		mul_of_out_cout;
wire		mul_of_out;
wire		mul_uf_out_in;
wire		mul_uf_out;
wire		mul_nx_out_in;
wire		mul_nx_out;
wire [4:0]	mul_exc_out;
wire		m2stg_frac1_dbl_norm;
wire		m2stg_frac1_dbl_dnrm;
wire		m2stg_frac1_sng_norm;
wire		m2stg_frac1_sng_dnrm;
wire		m2stg_frac1_inf;
wire		m2stg_frac2_dbl_norm;
wire		m2stg_frac2_dbl_dnrm;
wire		m2stg_frac2_sng_norm;
wire		m2stg_frac2_sng_dnrm;
wire		m2stg_frac2_inf;
wire		m1stg_inf_zero_in;
wire		m1stg_inf_zero_in_dbl;
wire [5:0]	m2stg_ld0_1_in;
wire [5:0]	m2stg_ld0_1;
wire [5:0]	m2stg_ld0_2_in;
wire [5:0]	m2stg_ld0_2;
wire		m2stg_exp_expadd;
wire		m2stg_exp_0bff;
wire		m2stg_exp_017f;
wire		m2stg_exp_04ff;
wire		m2stg_exp_zero;
wire [6:0]	m2stg_ld0;
wire [6:0]	m2stg_ld0_inv;
wire [6:0]	m3astg_ld0_inv;
wire [6:0]	m3bstg_ld0_inv;
wire		m4stg_expadd_eq_0;
wire		m3stg_exp_lte_0;
wire		m4stg_right_shift_in;
wire		m4stg_right_shift;
wire [5:0]	m3stg_exp_minus1;
wire [5:0]	m3stg_exp_inv_plus2;
wire		m3stg_exp_lt_neg57;
wire [5:0]	m4stg_sh_cnt_in;
wire		m4stg_left_shift_step;
wire		m4stg_right_shift_step;
wire		m4stg_inc_exp_54;
wire		m4stg_inc_exp_55;
wire		m4stg_inc_exp_105;
wire		m5stg_rndup;
wire		m5stg_to_0;
wire		m5stg_to_0_inv;
wire		mul_frac_out_fracadd;
wire		mul_frac_out_frac;
wire		mul_exp_out_exp_plus1;
wire		mul_exp_out_exp;
wire		mul_pipe_active_in;
wire		mul_pipe_active;
wire    mula_rst_l;

//Previously missing wires
wire        mul_ctl_rst_l;
wire        m3bstf_of_mask;

dffrl_async #(1)  dffrl_mul_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (mul_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!mul_ctl_rst_l);

// 3/14/03 reset signal for mul64
assign mula_rst_l = mul_ctl_rst_l;


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_mul_frac_in1_51 (
	.din	(inq_in1_51),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_54 (
	.din	(inq_in1_54),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_53_0_neq_0 (
	.din	(inq_in1_53_0_neq_0),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_frac_in1_53_0_neq_0),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_frac_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(mul_exp_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_mul_exp_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_exp_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_51 (
	.din	(inq_in2_51),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_54 (
	.din	(inq_in2_54),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_53_0_neq_0 (
	.din	(inq_in2_53_0_neq_0),
	.en  	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_53_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_frac_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_frac_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(m6stg_step),
	.clk	(rclk),

	.q	(mul_exp_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_exp_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(mul_exp_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_denorm_sng_in1= mul_exp_in1_exp_eq_0 && m1stg_sngopa[0];

assign m1stg_denorm_dbl_in1= mul_exp_in1_exp_eq_0 && m1stg_dblopa[0];

assign m1stg_denorm_sng_in2= mul_exp_in2_exp_eq_0 && m1stg_sngopa[0];

assign m1stg_denorm_dbl_in2= mul_exp_in2_exp_eq_0 && m1stg_dblopa[0];

assign m1stg_denorm_in1= m1stg_denorm_sng_in1 || m1stg_denorm_dbl_in1;

assign m1stg_denorm_in2= m1stg_denorm_sng_in2 || m1stg_denorm_dbl_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_norm_sng_in1= (!mul_exp_in1_exp_eq_0) && m1stg_sngopa[0];

assign m1stg_norm_dbl_in1= (!mul_exp_in1_exp_eq_0) && m1stg_dblopa[0];

assign m1stg_norm_sng_in2= (!mul_exp_in2_exp_eq_0) && m1stg_sngopa[0];

assign m1stg_norm_dbl_in2= (!mul_exp_in2_exp_eq_0) && m1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Nan multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_snan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && (!mul_frac_in1_54)
		&& (mul_frac_in1_53_32_neq_0) && m1stg_sngopa[1];

assign m1stg_snan_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_51) && mul_frac_in1_50_0_neq_0
		&& m1stg_dblopa[1];

assign m1stg_snan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && (!mul_frac_in2_54)
                && (mul_frac_in2_53_32_neq_0) && m1stg_sngopa[1];

assign m1stg_snan_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
                && (!mul_frac_in2_51) && mul_frac_in2_50_0_neq_0
                && m1stg_dblopa[1];

assign m1stg_qnan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && mul_frac_in1_54
		&& m1stg_sngopa[1];

assign m1stg_qnan_dbl_in1= (!mul_exp_in1_exp_neq_ffs) && mul_frac_in1_51
		&& m1stg_dblopa[1];

assign m1stg_qnan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && mul_frac_in2_54
                && m1stg_sngopa[1];

assign m1stg_qnan_dbl_in2= (!mul_exp_in2_exp_neq_ffs) && mul_frac_in2_51
                && m1stg_dblopa[1];

assign m1stg_snan_in1= m1stg_snan_sng_in1 || m1stg_snan_dbl_in1;

assign m1stg_snan_in2= m1stg_snan_sng_in2 || m1stg_snan_dbl_in2;

assign m1stg_qnan_in1= m1stg_qnan_sng_in1 || m1stg_qnan_dbl_in1;
 
assign m1stg_qnan_in2= m1stg_qnan_sng_in2 || m1stg_qnan_dbl_in2;

dffe_s #(1) i_m2stg_snan_in1 (
	.din	(m1stg_snan_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_snan_in1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m2stg_snan_in2 (
	.din	(m1stg_snan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_snan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_qnan_in1 (
	.din	(m1stg_qnan_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_qnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_qnan_in2 (
	.din	(m1stg_qnan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_qnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_nan_sng_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (mul_frac_in1_54 || mul_frac_in1_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_nan_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (mul_frac_in1_51 || mul_frac_in1_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_nan_sng_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (mul_frac_in2_54 || mul_frac_in2_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_nan_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (mul_frac_in2_51 || mul_frac_in2_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_nan_in1= m1stg_nan_sng_in1 || m1stg_nan_dbl_in1;

assign m1stg_nan_in2= m1stg_nan_sng_in2 || m1stg_nan_dbl_in2;

dffe_s #(1) i_m2stg_nan_in2 (
	.din	(m1stg_nan_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_nan_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_inf_sng_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_54) && (!mul_frac_in1_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_inf_dbl_in1= (!mul_exp_in1_exp_neq_ffs)
		&& (!mul_frac_in1_51) && (!mul_frac_in1_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_inf_sng_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (!mul_frac_in2_54) && (!mul_frac_in2_53_32_neq_0)
		&& m1stg_sngopa[2];

assign m1stg_inf_dbl_in2= (!mul_exp_in2_exp_neq_ffs)
		&& (!mul_frac_in2_51) && (!mul_frac_in2_50_0_neq_0)
		&& m1stg_dblopa[2];

assign m1stg_inf_in1= m1stg_inf_sng_in1 || m1stg_inf_dbl_in1;

assign m1stg_inf_in2= m1stg_inf_sng_in2 || m1stg_inf_dbl_in2;

assign m1stg_inf_in= m1stg_inf_in1 || m1stg_inf_in2;

dffe_s #(1) i_m2stg_inf_in1 (
	.din	(m1stg_inf_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_inf_in2 (
	.din	(m1stg_inf_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in2),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_m2stg_inf_in (
	.din	(m1stg_inf_in),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_inf_in),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_infnan_sng_in1= (!mul_exp_in1_exp_neq_ffs) && m1stg_sngopa[3];

assign m1stg_infnan_dbl_in1= (!mul_exp_in1_exp_neq_ffs) && m1stg_dblopa[3];

assign m1stg_infnan_sng_in2= (!mul_exp_in2_exp_neq_ffs) && m1stg_sngopa[3];

assign m1stg_infnan_dbl_in2= (!mul_exp_in2_exp_neq_ffs) && m1stg_dblopa[3];

assign m1stg_infnan_in1= m1stg_infnan_sng_in1 || m1stg_infnan_dbl_in1;

assign m1stg_infnan_in2= m1stg_infnan_sng_in2 || m1stg_infnan_dbl_in2;

assign m1stg_infnan_in= m1stg_infnan_in1 || m1stg_infnan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Zero multiply inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_zero_in1= mul_exp_in1_exp_eq_0
		&& (!mul_frac_in1_53_0_neq_0) && (!mul_frac_in1_54);

assign m1stg_zero_in2= mul_exp_in2_exp_eq_0
                && (!mul_frac_in2_53_0_neq_0) && (!mul_frac_in2_54);

assign m1stg_zero_in= m1stg_zero_in1 || m1stg_zero_in2;

dffe_s #(1) i_m2stg_zero_in1 (
	.din	(m1stg_zero_in1),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_zero_in2 (
	.din	(m1stg_zero_in2),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_m2stg_zero_in (
	.din	(m1stg_zero_in),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m2stg_zero_in),
 
        .se	(se),
        .si	(),
        .so	()
);
 

///////////////////////////////////////////////////////////////////////////////
//
//	Floating point multiply control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply input stage.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_step= m6stg_stepa && (!m1stg_mul);

assign m1stg_op_in[7:0]= ({8{(m1stg_step && (!reset))}}
			    & (inq_op[7:0] & {8{inq_mul}}))
		| ({8{((!m6stg_step) && (!reset))}}
			    & m1stg_op[7:0]);

dff_s #(8) i_m1stg_op (
	.din	(m1stg_op_in[7:0]),
	.clk	(rclk),

	.q	(m1stg_op[7:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_mul_in= (m1stg_step && (!reset) && inq_mul)
		|| ((!m6stg_step) && (!reset) && m1stg_mul);

dff_s #(1) i_m1stg_mul (
        .din    (m1stg_mul_in),
	.clk    (rclk),
 
        .q      (m1stg_mul),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m1stg_sngop (
	.din	(inq_op[0]),
	.en	(m6stg_step),
	.clk	(rclk),

	.q	(m1stg_sngop),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_m1stg_sngopa (
	.din	({4{inq_op[0]}}),
	.en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m1stg_sngopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_m1stg_dblop (
        .din    (inq_op[1]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_m1stg_dblopa (
	.din	({4{inq_op[1]}}),
	.en	(m6stg_step),
	.clk	(rclk),

	 .q	(m1stg_dblopa[3:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign m1stg_dblop_inv_in= (!inq_op[1]);

dffe_s #(1) i_m1stg_dblop_inv (
        .din	(m1stg_dblop_inv_in),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m1stg_dblop_inv),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(2) i_m1stg_rnd_mode (
	.din	(inq_rnd_mode[1:0]),
	.en	(m6stg_step),
	.clk    (rclk),

        .q      (m1stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m1stg_id (
	.din	(inq_id[4:0]),
	.en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m1stg_id[4:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode decode- multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_fmul= (m1stg_op[7:0]==FMULS) || (m1stg_op[7:0]==FMULD)
		|| (m1stg_op[7:0]==FSMULD);

assign m1stg_fmul_dbl_dst= (m1stg_op[7:0]==FMULD) || (m1stg_op[7:0]==FSMULD);

assign m1stg_fmuls= (m1stg_op[7:0]==FMULS);

assign m1stg_fmuld= (m1stg_op[7:0]==FMULD);

assign m1stg_fsmuld= (m1stg_op[7:0]==FSMULD);

assign m1stg_opdec[4:0]= {m1stg_fmul,
			m1stg_fmul_dbl_dst,
			m1stg_fmuls,
			m1stg_fmuld,
			m1stg_fsmuld};

dffre_s #(5) i_m2stg_opdec (
	.din	(m1stg_opdec[4:0]),
	.en	(m6stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(m2stg_opdec[4:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m2stg_rnd_mode (
        .din    (m1stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(5) i_m2stg_id (
        .din    (m1stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_fmul= m2stg_opdec[4];
assign m2stg_fmuls= m2stg_opdec[2];
assign m2stg_fmuld= m2stg_opdec[1];
assign m2stg_fsmuld= m2stg_opdec[0];

dffre_s #(4) i_m3astg_opdec (
        .din    (m2stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3astg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3astg_rnd_mode (
        .din    (m2stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3astg_id (
        .din    (m2stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffre_s #(4) i_m3bstg_opdec (
        .din    (m3astg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3bstg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3bstg_rnd_mode (
        .din    (m3astg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m3bstg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3bstg_id (
        .din    (m3astg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_id[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffre_s #(4) i_m3stg_opdec (
        .din    (m3bstg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m3stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m3stg_rnd_mode (
        .din    (m3bstg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m3stg_id (
        .din    (m3bstg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m3stg_id[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign m3stg_fmul= m3stg_opdec[4];

dffre_s #(4) i_m4stg_opdec (
        .din    (m3stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m4stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m4stg_rnd_mode (
        .din    (m3stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m4stg_id (
        .din    (m3stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_fmul= m4stg_opdec[4];
assign m4stg_fmuld= m4stg_opdec[1];

dffre_s #(4) i_m5stg_opdec (
        .din    (m4stg_opdec[4:1]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m5stg_opdec[4:1]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_m5stg_rnd_mode (
        .din    (m4stg_rnd_mode[1:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_m5stg_id (
        .din    (m4stg_id[4:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_m5stg_fmulda (
	.din	(m4stg_fmuld),
	.en	(m6stg_step),
	.rst	(reset),
	.clk	(rclk),

  	.q	(m5stg_fmulda),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_fmul= m5stg_opdec[4];
assign m5stg_fmuls= m5stg_opdec[2];
assign m5stg_fmuld= m5stg_opdec[1];

assign m6stg_fmul_in= (m6stg_stepa && (!reset)
			&& m5stg_fmul)
		|| ((!m6stg_stepa) && (!reset)
			&& m6stg_fmul);

dffre_s #(3) i_m6stg_opdec (
        .din    (m5stg_opdec[4:2]),
        .en     (m6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (m6stg_opdec[4:2]),

        .se     (se),
        .si     (),
        .so     ()
);

assign m6stg_id_in[9:0]= ({10{m6stg_stepa}}
			    & {(m5stg_id[4:2]==3'o7),
				(m5stg_id[4:2]==3'o6),
				(m5stg_id[4:2]==3'o5),
				(m5stg_id[4:2]==3'o4),
				(m5stg_id[4:2]==3'o3),
				(m5stg_id[4:2]==3'o2),
				(m5stg_id[4:2]==3'o1),
				(m5stg_id[4:2]==3'o0),
				m5stg_id[1:0]})
		| ({10{(!m6stg_stepa)}}
			    & m6stg_id[9:0]);

dffe_s #(10) i_m6stg_id (
        .din    (m6stg_id_in[9:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m6stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- multiply pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign m6stg_fmul= m6stg_opdec[4];
assign m6stg_fmul_dbl_dst= m6stg_opdec[3];
assign m6stg_fmuls= m6stg_opdec[2];

assign m6stg_hold= m6stg_fmul && (!mul_dest_rdy);
assign m6stg_holda= m6stg_fmul && (!mul_dest_rdya);

assign m6stg_step= (!m6stg_hold);
assign m6stg_stepa= (!m6stg_holda);

// Austin update
// Power management update

assign mul_pipe_active_in =  // mul pipe is executing a valid instr
   m1stg_fmul || m2stg_fmul || m3astg_opdec[4] || m3bstg_opdec[4] ||
   m3stg_fmul || m4stg_fmul || m5stg_fmul      || m6stg_fmul;

dffre_s #(1) i_mul_pipe_active (
	.din	(mul_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (mul_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply sign and exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Multiply sign inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m1stg_sign1 (
        .din    (inq_in1_63),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m1stg_sign1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m1stg_sign2 (
        .din    (inq_in2_63),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m1stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m2stg_sign1 (
        .din	(m1stg_sign1),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m2stg_sign1),
 
        .se	(se),
        .si	(),
        .so	()
);
 
dffe_s #(1) i_m2stg_sign2 (
        .din	(m1stg_sign2),
        .en	(m6stg_step),
        .clk	(rclk),
 
        .q	(m2stg_sign2),
 
        .se	(se),
        .si	(),
        .so	()
);

assign m1stg_of_mask= (!m1stg_infnan_in);

dffe_s #(1) i_m2stg_of_mask (
        .din    (m1stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m2stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_sign= ((m2stg_sign1
				&& (!m2stg_snan_in2)
				&& (!(m2stg_qnan_in2 && (!m2stg_snan_in1))))
			^ (m2stg_sign2
				&& (!(m2stg_snan_in1 && (!m2stg_snan_in2)))
				&& (!(m2stg_qnan_in1 && (!m2stg_nan_in2)))))
		&& (!(m2stg_inf_in && m2stg_zero_in));

dffe_s #(1) i_m3astg_sign (
        .din    (m2stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

assign m2stg_nv= m2stg_snan_in1
		|| m2stg_snan_in2
		|| (m2stg_zero_in1 && m2stg_inf_in2)
		|| (m2stg_inf_in1 && m2stg_zero_in2);

dffe_s #(1) i_m3astg_nv (
        .din    (m2stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3astg_of_mask (
        .din    (m2stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m3bstg_sign (
        .din    (m3astg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3bstg_nv (
        .din    (m3astg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

wire m3bstg_of_mask;
dffe_s #(1) i_m3bstg_of_mask (
        .din    (m3astg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m3stg_sign (
        .din    (m3bstg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3stg_nv (
        .din    (m3bstg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m3stg_of_mask (
        .din    (m3bstg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////
 
dffe_s #(1) i_m4stg_sign (
        .din    (m3stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_sign),
 
        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(1) i_m4stg_nv (
        .din    (m3stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_nv),
 
        .se     (se),
        .si     (),
        .so     ()
);
 
dffe_s #(1) i_m4stg_of_mask (
        .din    (m3stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m5stg_sign (
        .din    (m4stg_sign),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_sign),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m5stg_nv (
        .din    (m4stg_nv),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m5stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_m5stg_of_mask (
        .din    (m4stg_of_mask),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m5stg_of_mask),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply sign and exceptions.
//
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_mul_sign_out (
	.din	(m5stg_sign),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_nv_out (
	.din	(m5stg_nv),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_nv_out),

	.se     (se),
        .si     (),
        .so     ()
);

assign m5stg_in_of= ((!m5stg_exp[12])
                        && m5stg_fmuld
                        && (m5stg_exp[11] || (&m5stg_exp[10:0]))
                        && m5stg_of_mask)
                || ((!m5stg_exp[12])
                        && m5stg_fmuls
                        && ((|m5stg_exp[11:8]) || (&m5stg_exp[7:0]))
                        && m5stg_of_mask);

assign mul_of_out_tmp1_in= ((!m5stg_exp[12])
                        && m5stg_fmuld
                        && (&m5stg_exp[10:1])
                        && m5stg_rndup
                        && m5stg_of_mask)
                || ((!m5stg_exp[12])
                        && m5stg_fmuls
                        && (&m5stg_exp[7:1])
                        && m5stg_rndup
                        && m5stg_of_mask);

dffe_s #(1) i_mul_of_out_tmp1 (
        .din    (mul_of_out_tmp1_in),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_of_out_tmp1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_mul_of_out_tmp2 (
	.din	(m5stg_in_of),
	.en	(m6stg_step),
    	.clk	(rclk),

	.q	(mul_of_out_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_mul_of_out_cout (
	.din	(m5stg_fracadd_cout),
	.en	(m6stg_step),
    	.clk	(rclk),

	.q	(mul_of_out_cout),

	.se	(se),
	.si	(),
	.so	()
);

assign mul_of_out= mul_of_out_tmp2
		|| (mul_of_out_tmp1 && mul_of_out_cout);

assign mul_uf_out_in= (m5stg_exp[12] || (!(|m5stg_exp[11:0])))
		&& m5stg_frac_neq_0;

dffe_s #(1) i_mul_uf_out (
        .din    (mul_uf_out_in),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (mul_uf_out),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign mul_nx_out_in= (m5stg_fmuld && m5stg_frac_dbl_nx)
		|| (m5stg_fmuls && m5stg_frac_sng_nx);

dffe_s #(1) i_mul_nx_out (
        .din    (mul_nx_out_in),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (mul_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign mul_exc_out[4:0]= {mul_nv_out, mul_of_out, mul_uf_out, 1'b0, mul_nx_out};

assign mul_exc_out[4:0] =
  {mul_nv_out,
   mul_of_out,
   mul_uf_out,
   1'b0,
   (mul_nx_out || mul_of_out)};  // Overflow is always accompanied by inexact


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- multiply normalization and special input injection.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_frac1_dbl_norm= m1stg_norm_dbl_in1
		&& ((!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2))
			|| (m1stg_snan_dbl_in1 && (!m1stg_snan_dbl_in2))
			|| (m1stg_qnan_dbl_in1 && (!m1stg_nan_dbl_in2)));

assign m2stg_frac1_dbl_dnrm= m1stg_denorm_dbl_in1
		&& (!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2));

assign m2stg_frac1_sng_norm= m1stg_norm_sng_in1
		&& ((!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2))
                        || (m1stg_snan_sng_in1 && (!m1stg_snan_sng_in2))
                        || (m1stg_qnan_sng_in1 && (!m1stg_nan_sng_in2)));

assign m2stg_frac1_sng_dnrm= m1stg_denorm_sng_in1
		&& (!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2));

assign m2stg_frac1_inf= (m1stg_inf_in && (!m1stg_nan_in1) && (!m1stg_nan_in2))
		|| m1stg_snan_in2
		|| (m1stg_qnan_in2 && (!m1stg_snan_in1));

assign m2stg_frac2_dbl_norm= m1stg_norm_dbl_in2
		&& ((!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2))
			|| m1stg_snan_dbl_in2
			|| (m1stg_qnan_dbl_in2 && (!m1stg_snan_dbl_in1)));

assign m2stg_frac2_dbl_dnrm= m1stg_denorm_dbl_in2
		&& (!(m1stg_infnan_dbl_in1 || m1stg_infnan_dbl_in2));

assign m2stg_frac2_sng_norm= m1stg_norm_sng_in2
		&& ((!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2))
                        || m1stg_snan_sng_in2
                        || (m1stg_qnan_sng_in2 && (!m1stg_snan_sng_in1)));

assign m2stg_frac2_sng_dnrm= m1stg_denorm_sng_in2
		&& (!(m1stg_infnan_sng_in1 || m1stg_infnan_sng_in2));

assign m2stg_frac2_inf= (m1stg_inf_in && (!m1stg_nan_in1) && (!m1stg_nan_in2))
		|| (m1stg_snan_in1 && (!m1stg_snan_in2))
		|| (m1stg_qnan_in1 && (!m1stg_nan_in2));

assign m1stg_inf_zero_in= (m1stg_inf_in1 && m1stg_zero_in2)
		|| (m1stg_zero_in1 && m1stg_inf_in2);

assign m1stg_inf_zero_in_dbl= ((m1stg_inf_in1 && m1stg_zero_in2)
			|| (m1stg_zero_in1 && m1stg_inf_in2))
		&& m1stg_fmul_dbl_dst;


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines and control logic- multiply leading 0 counts.
//
//      Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_ld0_1_in[5:0]= ({6{(m1stg_denorm_in1 && (!m1stg_infnan_in))}}
		& m1stg_ld0_1[5:0]);

dffe_s #(6) i_m2stg_ld0_1 (
	.din	(m2stg_ld0_1_in[5:0]),
	.en	(m6stg_step),
	.clk    (rclk),

        .q      (m2stg_ld0_1[5:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign m2stg_ld0_2_in[5:0]= ({6{(m1stg_denorm_in2 && (!m1stg_infnan_in))}}
		& m1stg_ld0_2[5:0]);

dffe_s #(6) i_m2stg_ld0_2 (
        .din    (m2stg_ld0_2_in[5:0]),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m2stg_ld0_2[5:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- multiply exponent adder.
//
//      Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_exp_expadd= (!m1stg_infnan_in) && (!m1stg_zero_in);

assign m2stg_exp_0bff= m1stg_fmuld && m1stg_infnan_in;

assign m2stg_exp_017f= m1stg_fmuls && m1stg_infnan_in;

assign m2stg_exp_04ff= m1stg_fsmuld && m1stg_infnan_in;
 
assign m2stg_exp_zero= m1stg_zero_in && (!m1stg_infnan_in);


///////////////////////////////////////////////////////////////////////////////
//
//	Total the leading 0's.
//
//	Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_ld0[6:0]= {1'b0, m2stg_ld0_1[5:0]}
			+ {1'b0, m2stg_ld0_2[5:0]};

assign m2stg_ld0_inv[6:0]= (~m2stg_ld0[6:0]);

dffe_s #(7) i_m3astg_ld0_inv (
	.din	(m2stg_ld0_inv[6:0]),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (m3astg_ld0_inv[6:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Leading 0's.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(7) i_m3bstg_ld0_inv (
        .din    (m3astg_ld0_inv[6:0]),
        .en     (m6stg_step),
        .clk    (rclk),

        .q      (m3bstg_ld0_inv[6:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Post-normalization/denormalization shift count and direction.
//
//	Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_m4stg_expadd_eq_0 (
        .din    (m3stg_expadd_eq_0),
        .en     (m6stg_step),
        .clk    (rclk),
 
        .q      (m4stg_expadd_eq_0),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign m3stg_exp_lte_0= (!(|m3stg_exp[11:0])) || m3stg_exp[12];

assign m4stg_right_shift_in= (!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0;

dffe_s #(1) i_m4stg_right_shift (
	.din	(m4stg_right_shift_in),
	.en     (m6stg_step),
        .clk    (rclk),

        .q      (m4stg_right_shift),

	.se     (se),
        .si     (),
        .so     ()
);

assign m3stg_exp_minus1[5:0]= m3stg_exp[5:0]
			+ 6'h3f;

assign m3stg_exp_inv_plus2[5:0]= (~m3stg_exp[5:0])
			+ 6'h02;

assign m3stg_exp_lt_neg57= ((!(&m3stg_exp[11:6]))
			|| (!(|m3stg_exp[5:3])))
		&& m3stg_exp[12];

assign m4stg_sh_cnt_in[5:0]= ({6{((!m3stg_expadd_lte_0_inv)
				&& (!m3stg_exp_lte_0))}}
			    & m3stg_exp_minus1[5:0])
		| ({6{((!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0
				&& m3stg_exp_lt_neg57)}}
			    & 6'h39)
		| ({6{((!m3stg_expadd_lte_0_inv) && m3stg_exp_lte_0
				&& (!m3stg_exp_lt_neg57))}}
			    & m3stg_exp_inv_plus2[5:0])
		| ({6{m3stg_expadd_lte_0_inv}}
			    & (~m3stg_ld0_inv[5:0]));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- multiply shifts for
//              post-normalization/denormalization.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_left_shift_step= (!m4stg_right_shift) && m6stg_step;

assign m4stg_right_shift_step= m4stg_right_shift && m6stg_step;

// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m4stg_inc_exp= (((!(|m4stg_exp[12:0])) && (!m4stg_right_shift)
//				&& m4stg_shl_54)
//			|| (m4stg_expadd_eq_0 && m4stg_right_shift
//				&& m4stg_frac_105)
//			|| ((!m4stg_right_shift) && m4stg_shl_55))
//	 	&& m6stg_step;
//
// assign m4stg_inc_exp_inv= (!m4stg_inc_exp) && m6stg_step;

assign m4stg_inc_exp_54  = (!(|m4stg_exp[12:0])) && (!m4stg_right_shift);
assign m4stg_inc_exp_55  = !m4stg_right_shift;
assign m4stg_inc_exp_105 = m4stg_expadd_eq_0 && m4stg_right_shift && m4stg_frac_105;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- multiply rounding.
//
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_rndup= ((((m5stg_rnd_mode[1:0]==2'b10) && (!m5stg_sign)
					&& (m5stg_frac[2:0]!=3'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b11) && m5stg_sign
					&& (m5stg_frac[2:0]!=3'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b00)
					&& m5stg_frac[2]
					&& ((m5stg_frac[1:0]!=2'b0)
						|| m5stg_frac[3])))
			&& m5stg_fmuld)
		|| ((((m5stg_rnd_mode[1:0]==2'b10) && (!m5stg_sign)
					&& (m5stg_frac[31:0]!=32'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b11) && m5stg_sign
                                        && (m5stg_frac[31:0]!=32'b0))
				|| ((m5stg_rnd_mode[1:0]==2'b00)
                                        && m5stg_frac[31]
					&& ((m5stg_frac[30:0]!=31'b0)
						|| m5stg_frac[32])))
			&& m5stg_fmuls);

assign m5stg_to_0= (m5stg_rnd_mode[1:0]==2'b01)
                || ((m5stg_rnd_mode[1:0]==2'b10) && m5stg_sign)
                || ((m5stg_rnd_mode[1:0]==2'b11) && (!m5stg_sign));

assign m5stg_to_0_inv= (!m5stg_to_0);

assign mul_frac_out_fracadd= m5stg_rndup && (!m5stg_in_of);

assign mul_frac_out_frac= (!m5stg_rndup) && (!m5stg_in_of);

assign mul_exp_out_exp_plus1= m5stg_rndup && (!m5stg_in_of);

assign mul_exp_out_exp= (!m5stg_rndup) && (!m5stg_in_of);


endmodule


