// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_ctl.v
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
//	Add pipeline synthesizable logic
//		- special input cases
//		- opcode pipeline
//		- sign logic
//		- exception logic
//		- datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////

module fpu_add_ctl (
	inq_in1_51,
	inq_in1_54,
	inq_in1_63,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1_exp_eq_0,
	inq_in1_exp_neq_ffs,
	inq_in2_51,
	inq_in2_54,
	inq_in2_63,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2_exp_eq_0,
	inq_in2_exp_neq_ffs,
	inq_op,
	inq_rnd_mode,
	inq_id,
	inq_fcc,
	inq_add,
	add_dest_rdy,
	a1stg_in2_neq_in1_frac,
	a1stg_in2_gt_in1_frac,
	a1stg_in2_eq_in1_exp,
	a1stg_expadd1,
	a2stg_expadd,
	a2stg_frac2hi_neq_0,
	a2stg_frac2lo_neq_0,
	a2stg_exp,
	a3stg_fsdtoix_nx,
	a3stg_fsdtoi_nx,
	a2stg_frac2_63,
	a4stg_exp,
	add_of_out_cout,
	a4stg_frac_neq_0,
	a4stg_shl_data_neq_0,
	a4stg_frac_dbl_nx,
	a4stg_frac_sng_nx,
	a1stg_expadd2,
	a1stg_expadd4_inv,
	a3stg_denorm,
	a3stg_denorm_inv,
	a4stg_denorm_inv,
	a3stg_exp,
	a4stg_round,
	a3stg_lead0,
	a4stg_rnd_frac_40,
	a4stg_rnd_frac_39,
	a4stg_rnd_frac_11,
	a4stg_rnd_frac_10,
	a4stg_frac_38_0_nx,
	a4stg_frac_9_0_nx,
	arst_l,
	grst_l,
	rclk,
	
	add_pipe_active,
	a1stg_denorm_sng_in1,
	a1stg_denorm_dbl_in1,
	a1stg_denorm_sng_in2,
	a1stg_denorm_dbl_in2,
	a1stg_norm_sng_in1,
	a1stg_norm_dbl_in1,
	a1stg_norm_sng_in2,
	a1stg_norm_dbl_in2,
	a1stg_step,
	a1stg_stepa,
	a1stg_sngop,
	a1stg_intlngop,
	a1stg_fsdtoix,
	a1stg_fstod,
	a1stg_fstoi,
	a1stg_fstox,
	a1stg_fdtoi,
	a1stg_fdtox,
	a1stg_faddsubs,
	a1stg_faddsubd,
	a1stg_fdtos,
	a2stg_faddsubop,
	a2stg_fsdtoix_fdtos,
	a2stg_fitos,
	a2stg_fitod,
	a2stg_fxtos,
	a2stg_fxtod,
	a3stg_faddsubop,
	a3stg_faddsubopa,
	a4stg_dblop,
	a6stg_fadd_in,
	add_id_out_in,
	add_fcc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	a6stg_fcmpop,
	a6stg_step,
	a3stg_sub_in,
	add_sign_out,
	add_cc_out,
	a4stg_in_of,
	add_exc_out,
	a2stg_frac1_in_frac1,
	a2stg_frac1_in_frac2,
	a1stg_2nan_in_inv,
	a1stg_faddsubop_inv,
	a2stg_frac1_in_qnan,
	a2stg_frac1_in_nv,
	a2stg_frac1_in_nv_dbl,
	a2stg_frac2_in_frac1,
	a2stg_frac2_in_qnan,
	a2stg_shr_cnt_in,
	a2stg_shr_cnt_5_inv_in,
	a2stg_shr_frac2_shr_int,
	a2stg_shr_frac2_shr_dbl,
	a2stg_shr_frac2_shr_sng,
	a2stg_shr_frac2_max,
	a2stg_sub_step,
	a2stg_fracadd_frac2_inv_in,
	a2stg_fracadd_frac2_inv_shr1_in,
	a2stg_fracadd_frac2,
	a2stg_fracadd_cin_in,
	a3stg_exp_7ff,
	a3stg_exp_ff,
	a3stg_exp_add,
	a2stg_expdec_neq_0,
	a3stg_exp10_0_eq0,
	a3stg_exp10_1_eq0,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_rnd_frac_add_inv,
	a4stg_shl_cnt_in,
	a4stg_rnd_sng,
	a4stg_rnd_dbl,
	add_frac_out_rndadd,
	add_frac_out_rnd_frac,
	add_frac_out_shl,
	a4stg_to_0,
	add_exp_out_expinc,
	add_exp_out_exp,
	add_exp_out_exp1,
	add_exp_out_expadd,
	a4stg_to_0_inv,

	se,
	si,
	so
);


parameter
		FADDS=	8'h41,
		FADDD=	8'h42,
		FSUBS=	8'h45,
		FSUBD=	8'h46,
		FCMPS=	8'h51,
		FCMPD=	8'h52,
		FCMPES=	8'h55,
		FCMPED=	8'h56,
		FSTOX=	8'h81,
		FDTOX=	8'h82,
		FSTOI=	8'hd1,
		FDTOI=	8'hd2,
		FSTOD=	8'hc9,
		FDTOS=	8'hc6,
		FXTOS=	8'h84,
		FXTOD=	8'h88,
		FITOS=	8'hc4,
		FITOD=	8'hc8;


input		inq_in1_51;		// request operand 1[51]
input		inq_in1_54;		// request operand 1[54]
input		inq_in1_63;		// request operand 1[63]
input		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
input		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
input		inq_in1_exp_eq_0;	// request operand 1[62:52]==0
input		inq_in1_exp_neq_ffs;	// request operand 1[62:52]!=0x7ff
input		inq_in2_51;		// request operand 2[51]
input		inq_in2_54;		// request operand 2[54]
input		inq_in2_63;		// request operand 2[63]
input		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
input		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
input		inq_in2_exp_eq_0;	// request operand 2[62:52]==0
input		inq_in2_exp_neq_ffs;	// request operand 2[62:52]!=0x7ff
input [7:0]	inq_op;			// request opcode to op pipes
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input [1:0]	inq_fcc;		// request cc ID to op pipes
input		inq_add;		// add pipe request
input		add_dest_rdy;		// add result req accepted for CPX
input		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
input		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
input		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
input [11:0]	a1stg_expadd1;		// exponent adder 1 output- add 1 stage
input [11:0]	a2stg_expadd;		// exponent adder- add 2 stage
input		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
input		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
input [11:0]	a2stg_exp;		// exponent- add 2 stage
input		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
input		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
input		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
input [11:0]	a4stg_exp;		// exponent- add 4 stage
input		add_of_out_cout;	// fraction rounding adder carry out
input		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
input		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
input		a4stg_frac_dbl_nx;	// inexact double precision result
input		a4stg_frac_sng_nx;	// inexact single precision result
input [5:0]	a1stg_expadd2;		// exponent adder 2 output- add 1 stage
input [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
input		a3stg_denorm;		// denorm output- add 3 stage
input		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
input		a4stg_denorm_inv;	// 0 the exponent
input [10:0]	a3stg_exp;		// exponent- add 3 stage
input		a4stg_round;		// round the result- add 4 stage
input [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
input		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
input		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
input		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
input		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
input		a4stg_frac_38_0_nx;	// inexact single precision result
input		a4stg_frac_9_0_nx;	// inexact double precision result
input		arst_l;			// global asynchronous reset- asserted low
input		grst_l;			// global synchronous reset- asserted low
input		rclk;		// global clock

output		add_pipe_active;        // add pipe is executing a valid instr
output		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
output		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
output		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
output		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
output		a1stg_norm_sng_in1;	// select line to normalized fraction 1
output		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
output		a1stg_norm_sng_in2;	// select line to normalized fraction 2
output		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
output		a1stg_step;		// add pipe load
output		a1stg_stepa;		// add pipe load- copy
output		a1stg_sngop;		// single precision operation- add 1 stg
output		a1stg_intlngop;		// integer/long input- add 1 stage
output		a1stg_fsdtoix;		// float to integer convert- add 1 stg
output		a1stg_fstod;		// fstod- add 1 stage
output		a1stg_fstoi;		// fstoi- add 1 stage
output		a1stg_fstox;		// fstox- add 1 stage
output		a1stg_fdtoi;		// fdtoi- add 1 stage
output		a1stg_fdtox;		// fdtox- add 1 stage
output		a1stg_faddsubs;		// add/subtract single- add 1 stg
output		a1stg_faddsubd;		// add/subtract double- add 1 stg
output		a1stg_fdtos;		// fdtos- add 1 stage
output		a2stg_faddsubop;	// float add or subtract- add 2 stage
output		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
output		a2stg_fitos;		// fitos- add 2 stage
output		a2stg_fitod;		// fitod- add 2 stage
output		a2stg_fxtos;		// fxtos- add 2 stage
output		a2stg_fxtod;		// fxtod- add 2 stage
output		a3stg_faddsubop;	// denorm compare lead0[10] input select
output [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
output		a4stg_dblop;		// double precision operation- add 4 stg
output		a6stg_fadd_in;		// add pipe output request next cycle
output [9:0]	add_id_out_in;		// add pipe output ID next cycle
output [1:0]	add_fcc_out;		// add pipe input fcc passed through
output		a6stg_dbl_dst;		// float double result- add 6 stage
output		a6stg_sng_dst;		// float single result- add 6 stage
output		a6stg_long_dst;		// 64bit integer result- add 6 stage
output		a6stg_int_dst;		// 32bit integer result- add 6 stage
output		a6stg_fcmpop;		// compare- add 6 stage
output		a6stg_step;		// advance the add pipe
output		a3stg_sub_in;		// subtract in main adder- add 3 stage
output		add_sign_out;		// add sign output
output [1:0]	add_cc_out;		// add pipe result- condition
output		a4stg_in_of;		// add overflow- select exp out
output [4:0]	add_exc_out;		// add pipe result- exception flags
output		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
output		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
output		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
output		a1stg_faddsubop_inv;	// add/subtract- a1 stage
output		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
output		a2stg_frac1_in_nv;	// NV- make a new QNaN
output		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
output		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
output		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
output [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
output    a2stg_shr_cnt_5_inv_in; // right shift count input[5]- add 1 stg
output		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
output		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
output		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
output		a2stg_shr_frac2_max;	// select line to a3stg_frac2
output		a2stg_sub_step;		// select line to a3stg_frac2
output		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
output		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
output		a2stg_fracadd_frac2;	// select line to main adder input 2
output		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
output		a3stg_exp_7ff;		// select line to a3stg_exp
output		a3stg_exp_ff;		// select line to a3stg_exp
output		a3stg_exp_add;		// select line to a3stg_exp
output		a2stg_expdec_neq_0;	// exponent will be < 54
output		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stage
output		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stage
output		a3stg_fdtos_inv;	// double to single convert- add 3 stg
output		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
output		a4stg_rnd_frac_add_inv; // select line to a4stg_rnd_frac
output [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
output		a4stg_rnd_sng;		// round to single precision- add 4 stg
output		a4stg_rnd_dbl;		// round to double precision- add 4 stg
output		add_frac_out_rndadd;	// select line to add_frac_out
output		add_frac_out_rnd_frac;	// select line to add_frac_out
output		add_frac_out_shl;	// select line to add_frac_out
output		a4stg_to_0;		// result to max finite on overflow
output		add_exp_out_expinc;	// select line to add_exp_out
output		add_exp_out_exp;	// select line to add_exp_out
output		add_exp_out_exp1;	// select line to add_exp_out
output		add_exp_out_expadd;	// select line to add_exp_out
output		a4stg_to_0_inv;		// result to infinity on overflow

input		se;			// scan_enable
input		si;			// scan in
output		so;			// scan out


wire		reset;
wire		a1stg_in1_51;
wire		a1stg_in1_54;
wire		a1stg_in1_63;
wire		a1stg_in1_50_0_neq_0;
wire		a1stg_in1_53_32_neq_0;
wire		a1stg_in1_exp_eq_0;
wire		a1stg_in1_exp_neq_ffs;
wire		a1stg_in2_51;
wire		a1stg_in2_54;
wire		a1stg_in2_63;
wire		a1stg_in2_50_0_neq_0;
wire		a1stg_in2_53_32_neq_0;
wire		a1stg_in2_exp_eq_0;
wire		a1stg_in2_exp_neq_ffs;
wire		a1stg_denorm_sng_in1;
wire		a1stg_denorm_dbl_in1;
wire		a1stg_denorm_sng_in2;
wire		a1stg_denorm_dbl_in2;
wire		a1stg_norm_sng_in1;
wire		a1stg_norm_dbl_in1;
wire		a1stg_norm_sng_in2;
wire		a1stg_norm_dbl_in2;
wire		a1stg_snan_sng_in1;
wire		a1stg_snan_dbl_in1;
wire		a1stg_snan_sng_in2;
wire		a1stg_snan_dbl_in2;
wire		a1stg_qnan_sng_in1;
wire		a1stg_qnan_dbl_in1;
wire		a1stg_qnan_sng_in2;
wire		a1stg_qnan_dbl_in2;
wire		a1stg_snan_in1;
wire		a1stg_snan_in2;
wire		a1stg_qnan_in1;
wire		a1stg_qnan_in2;
wire		a1stg_nan_sng_in1;
wire		a1stg_nan_dbl_in1;
wire		a1stg_nan_sng_in2;
wire		a1stg_nan_dbl_in2;
wire		a1stg_nan_in1;
wire		a1stg_nan_in2;
wire		a1stg_nan_in;
wire		a1stg_2nan_in;
wire		a1stg_inf_sng_in1;
wire		a1stg_inf_dbl_in1;
wire		a1stg_inf_sng_in2;
wire		a1stg_inf_dbl_in2;
wire		a1stg_inf_in1;
wire		a1stg_inf_in2;
wire		a1stg_2inf_in;
wire		a1stg_infnan_sng_in1;
wire		a1stg_infnan_dbl_in1;
wire		a1stg_infnan_sng_in2;
wire		a1stg_infnan_dbl_in2;
wire		a1stg_infnan_in1;
wire		a1stg_infnan_in2;
wire		a1stg_infnan_in;
wire		a1stg_2zero_in;
wire		a1stg_step;
wire		a1stg_stepa;
wire [7:0]	a1stg_op_in;
wire [7:0]	a1stg_op;
wire		a1stg_sngop;
wire [3:0]	a1stg_sngopa;
wire		a1stg_dblop;
wire [3:0]	a1stg_dblopa;
wire [1:0]	a1stg_rnd_mode;
wire [4:0]	a1stg_id;
wire [1:0]	a1stg_fcc;
wire		a1stg_fadd;
wire		a1stg_dbl_dst;
wire		a1stg_sng_dst;
wire		a1stg_long_dst;
wire		a1stg_int_dst;
wire		a1stg_intlngop;
wire		a1stg_faddsubop;
wire		a1stg_fsubop;
wire		a1stg_fsdtox;
wire		a1stg_fcmpesd;
wire		a1stg_fcmpsd;
wire		a1stg_faddsub_dtosop;
wire		a1stg_fdtoix;
wire		a1stg_fstoix;
wire		a1stg_fsdtoix;
wire		a1stg_fixtosd;
wire		a1stg_fstod;
wire		a1stg_fstoi;
wire		a1stg_fstox;
wire		a1stg_fdtoi;
wire		a1stg_fdtox;
wire		a1stg_fsdtoix_fdtos;
wire		a1stg_fitos;
wire		a1stg_fitod;
wire		a1stg_fxtos;
wire		a1stg_fcmpop;
wire		a1stg_f4cycop;
wire		a1stg_fixtos_fxtod;
wire		a1stg_faddsubs_fdtos;
wire		a1stg_faddsubs;
wire		a1stg_faddsubd;
wire		a1stg_fdtos;
wire		a1stg_fistod;
wire		a1stg_fixtos;
wire		a1stg_fxtod;
wire            a1stg_opdec_36;
wire [34:28]	a1stg_opdec;
wire [3:0]      a1stg_opdec_24_21;
wire [8:0]      a1stg_opdec_19_11;
wire [9:0]      a1stg_opdec_9_0;
wire		fixtosd_hold;
wire [30:0]	a2stg_opdec_in;
wire            a2stg_opdec_36;
wire [34:28]	a2stg_opdec;
wire [3:0]      a2stg_opdec_24_21;
wire [8:0]      a2stg_opdec_19_11;
wire [9:0]      a2stg_opdec_9_0;
wire [1:0]	a2stg_rnd_mode;
wire [4:0]	a2stg_id;
wire [1:0]	a2stg_fcc;
wire		a2stg_fadd;
wire		a2stg_long_dst;
wire		a2stg_faddsubop;
wire		a2stg_fsubop;
wire		a2stg_faddsub_dtosop;
wire		a2stg_fdtoix;
wire		a2stg_fstoix;
wire		a2stg_fsdtoix;
wire		a2stg_fstod;
wire		a2stg_fstoi;
wire		a2stg_fstox;
wire		a2stg_fdtoi;
wire		a2stg_fdtox;
wire		a2stg_fsdtoix_fdtos;
wire		a2stg_fitos;
wire		a2stg_fitod;
wire		a2stg_fxtos;
wire		a2stg_fcmpop;
wire		a2stg_fixtos_fxtod;
wire		a2stg_fdtos;
wire		a2stg_fxtod;
wire            a3stg_opdec_36;
wire [34:29]	a3stg_opdec;
wire            a3stg_opdec_24;
wire            a3stg_opdec_21;
wire [9:0]      a3stg_opdec_9_0;
wire [1:0]	a3stg_rnd_mode;
wire [4:0]	a3stg_id;
wire [1:0]	a3stg_fcc;
wire		a3stg_fadd;
wire		a3stg_int_dst;
wire		a3stg_faddsubop;
wire [1:0]	a3stg_faddsubopa;
wire		a3stg_fsdtoix;
wire		a3stg_f4cycop;
wire		a3stg_fixtos_fxtod;
wire		a3stg_fdtos;
wire            a4stg_opdec_36;
wire [34:29]	a4stg_opdec;
wire            a4stg_opdec_24;
wire            a4stg_opdec_21;
wire            a4stg_opdec_9;
wire [7:0]      a4stg_opdec_7_0;
wire [1:0]	a4stg_rnd_mode_in;
wire [1:0]	a4stg_rnd_mode;
wire [1:0]	a4stg_rnd_mode2;
wire [9:0]	a4stg_id_in;
wire [9:0]	a4stg_id;
wire [1:0]	a4stg_fcc;
wire		a4stg_dblop;
wire		a4stg_fadd;
wire		a4stg_faddsubop;
wire		a4stg_faddsub_dtosop;
wire		a4stg_fsdtoix;
wire		a4stg_fcmpop;
wire		a4stg_fixtos_fxtod;
wire		a4stg_faddsubs_fdtos;
wire		a4stg_faddsubs;
wire		a4stg_faddsubd;
wire		a4stg_fdtos;
wire		a4stg_fistod;
wire [34:30]	a5stg_opdec;
wire            a5stg_opdec_9;
wire            a5stg_opdec_7;
wire            a5stg_opdec_1;
wire            a5stg_opdec_0;
wire [9:0]	a5stg_id;
wire		a5stg_fadd;
wire		a5stg_fixtos_fxtod;
wire		a5stg_fixtos;
wire		a5stg_fxtod;
wire [34:30]	a6stg_opdec_in;
wire            a6stg_opdec_in_9;
wire		a6stg_fadd_in;
wire [34:30]	a6stg_opdec;
wire            a6stg_opdec_9;
wire [9:0]	add_id_out_in;
wire [9:0]	add_id_out;
wire [1:0]	add_fcc_out_in;
wire [1:0]	add_fcc_out;
wire		a6stg_fadd;
wire		a6stg_dbl_dst;
wire		a6stg_sng_dst;
wire		a6stg_long_dst;
wire		a6stg_int_dst;
wire		a6stg_fcmpop;
wire		a6stg_hold;
wire		a6stg_step;
wire		a1stg_sub;
wire		a2stg_sign1;
wire		a2stg_sign2;
wire		a2stg_sub;
wire		a2stg_in2_neq_in1_frac;
wire		a2stg_in2_gt_in1_frac;
wire		a2stg_in2_eq_in1_exp;
wire		a2stg_in2_gt_in1_exp;
wire		a2stg_nan_in;
wire		a2stg_nan_in2;
wire		a2stg_snan_in2;
wire		a2stg_qnan_in2;
wire		a2stg_snan_in1;
wire		a2stg_qnan_in1;
wire		a2stg_2zero_in;
wire		a2stg_2inf_in;
wire		a2stg_in2_eq_in1;
wire		a2stg_in2_gt_in1;
wire		a3stg_sub_in;
wire		a2stg_faddsub_sign;
wire		a3stg_sign_in;
wire		a3stg_sign;
wire		a2stg_cc_1;
wire		a2stg_cc_0;
wire [1:0]	a2stg_cc;
wire [1:0]	a3stg_cc;
wire		a4stg_sign_in;
wire		a4stg_sign;
wire		a4stg_sign2;
wire [1:0]	a4stg_cc;
wire		add_sign_out;
wire [1:0]	add_cc_out_in;
wire [1:0]	add_cc_out;
wire		a1stg_nv;
wire		a2stg_nv;
wire		a1stg_of_mask;
wire		a2stg_of_mask;
wire		a3stg_nv_in;
wire		a3stg_nv;
wire		a3stg_of_mask;
wire		a2stg_nx_tmp1;
wire		a2stg_nx_tmp2;
wire		a2stg_nx_tmp3;
wire		a3stg_a2_expadd_11;
wire		a3stg_nx_tmp1;
wire		a3stg_nx_tmp2;
wire		a3stg_nx_tmp3;
wire		a3stg_nx;
wire		a4stg_nv_in;
wire		a4stg_nv;
wire		a4stg_nv2;
wire		a4stg_of_mask_in;
wire		a4stg_of_mask;
wire		a4stg_of_mask2;
wire		a4stg_nx_in;
wire		a4stg_nx;
wire		a4stg_nx2;
wire		add_nv_out;
wire		a4stg_in_of;
wire		add_of_out_tmp1_in;
wire		add_of_out_tmp1;
wire		add_of_out_tmp2;
wire		add_of_out;
wire		a4stg_uf;
wire		add_uf_out;
wire		add_nx_out_in;
wire		add_nx_out;
wire [4:0]	add_exc_out;
wire		a2stg_frac1_in_frac1;
wire		a2stg_frac1_in_frac2;
wire		a1stg_2nan_in_inv;
wire		a1stg_faddsubop_inv;
wire		a2stg_frac1_in_qnan;
wire		a2stg_frac1_in_nv;
wire		a2stg_frac1_in_nv_dbl;
wire		a2stg_frac2_in_frac1;
wire		a2stg_frac2_in_qnan;
wire		a1stg_exp_diff_add1;
wire		a1stg_exp_diff_add2;
wire		a1stg_exp_diff_5;
wire [10:0]	a1stg_exp_diff;
wire [5:0]	a1stg_clamp63;
wire [5:0]	a2stg_shr_cnt_in;
wire    a2stg_shr_cnt_5_inv_in;
wire		a2stg_shr_frac2_shr_int;
wire		a2stg_shr_frac2_shr_dbl;
wire		a2stg_shr_frac2_shr_sng;
wire		a2stg_shr_frac2_max;
wire		a2stg_sub_step;
wire		a1stg_faddsub_clamp63_0;
wire		a2stg_fracadd_frac2_inv_in;
wire		a2stg_fracadd_frac2_inv_shr1_in;
wire		a2stg_fracadd_frac2_in;
wire		a2stg_fracadd_frac2;
wire		a2stg_fracadd_cin_in;
wire		a3stg_exp_7ff;
wire		a3stg_exp_ff;
wire		a3stg_exp_add;
wire		a2stg_expdec_neq_0;
wire		a3stg_exp10_0_eq0;
wire		a3stg_exp10_1_eq0;
wire		a3stg_fdtos_inv;
wire		a4stg_fixtos_fxtod_inv;
wire		a4stg_rnd_frac_add_inv;
wire [9:0]	a4stg_shl_cnt_in;
wire		a4stg_rnd_sng;
wire		a4stg_rnd_dbl;
wire		a4stg_rndup_sng;
wire		a4stg_rndup_dbl;
wire		a4stg_rndup;
wire		a5stg_rndup;
wire		add_frac_out_rndadd;
wire		add_frac_out_rnd_frac;
wire		add_frac_out_shl;
wire		a4stg_to_0;
wire		add_exp_out_expinc;
wire		add_exp_out_exp;
wire		add_exp_out_exp1;
wire		add_exp_out_expadd;
wire		a4stg_to_0_inv;
wire		add_pipe_active_in;
wire		add_pipe_active;

//Previously missing wires
wire        add_ctl_rst_l;

dffrl_async #(1)  dffrl_add_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (add_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!add_ctl_rst_l);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_a1stg_in1_51 (
	.din	(inq_in1_51),
	.en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_in1_54 (
	.din	(inq_in1_54),
	.en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_in1_63 (
        .din	(inq_in1_63),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in1_63),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_51 (
	.din	(inq_in2_51),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_54 (
	.din	(inq_in2_54),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_63 (
        .din	(inq_in2_63),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in2_63),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a1stg_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_denorm_sng_in1= a1stg_in1_exp_eq_0 && a1stg_sngopa[0];

assign a1stg_denorm_dbl_in1= a1stg_in1_exp_eq_0 && a1stg_dblopa[0];

assign a1stg_denorm_sng_in2= a1stg_in2_exp_eq_0 && a1stg_sngopa[0];

assign a1stg_denorm_dbl_in2= a1stg_in2_exp_eq_0 && a1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_norm_sng_in1= (!a1stg_in1_exp_eq_0) && a1stg_sngopa[0];

assign a1stg_norm_dbl_in1= (!a1stg_in1_exp_eq_0) && a1stg_dblopa[0];

assign a1stg_norm_sng_in2= (!a1stg_in2_exp_eq_0) && a1stg_sngopa[0];

assign a1stg_norm_dbl_in2= (!a1stg_in2_exp_eq_0) && a1stg_dblopa[0];


///////////////////////////////////////////////////////////////////////////////
//
//	Nan add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_snan_sng_in1= (!a1stg_in1_exp_neq_ffs) && (!a1stg_in1_54)
		&& a1stg_in1_53_32_neq_0 && a1stg_sngopa[1];

assign a1stg_snan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && (!a1stg_in1_51)
		&& a1stg_in1_50_0_neq_0 && a1stg_dblopa[1];

assign a1stg_snan_sng_in2= (!a1stg_in2_exp_neq_ffs) && (!a1stg_in2_54)
                && a1stg_in2_53_32_neq_0 && a1stg_sngopa[1];

assign a1stg_snan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && (!a1stg_in2_51)
                && a1stg_in2_50_0_neq_0 && a1stg_dblopa[1];

assign a1stg_qnan_sng_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_in1_54
		&& a1stg_sngopa[1];

assign a1stg_qnan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_in1_51
		&& a1stg_dblopa[1];

assign a1stg_qnan_sng_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_in2_54
                && a1stg_sngopa[1];

assign a1stg_qnan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_in2_51
                && a1stg_dblopa[1];

assign a1stg_snan_in1= a1stg_snan_sng_in1 || a1stg_snan_dbl_in1;

assign a1stg_snan_in2= a1stg_snan_sng_in2 || a1stg_snan_dbl_in2;

assign a1stg_qnan_in1= a1stg_qnan_sng_in1 || a1stg_qnan_dbl_in1;
 
assign a1stg_qnan_in2= a1stg_qnan_sng_in2 || a1stg_qnan_dbl_in2;

assign a1stg_nan_sng_in1= (!a1stg_in1_exp_neq_ffs)
		&& (a1stg_in1_54 || a1stg_in1_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_nan_dbl_in1= (!a1stg_in1_exp_neq_ffs)
		&& (a1stg_in1_51 || a1stg_in1_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_nan_sng_in2= (!a1stg_in2_exp_neq_ffs)
		&& (a1stg_in2_54 || a1stg_in2_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_nan_dbl_in2= (!a1stg_in2_exp_neq_ffs)
		&& (a1stg_in2_51 || a1stg_in2_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_nan_in1= a1stg_nan_sng_in1 || a1stg_nan_dbl_in1;

assign a1stg_nan_in2= a1stg_nan_sng_in2 || a1stg_nan_dbl_in2;

assign a1stg_nan_in= a1stg_nan_in1 || a1stg_nan_in2;

assign a1stg_2nan_in= a1stg_nan_in1 && a1stg_nan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_inf_sng_in1= (!a1stg_in1_exp_neq_ffs)
		&& (!a1stg_in1_54) && (!a1stg_in1_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_inf_dbl_in1= (!a1stg_in1_exp_neq_ffs)
		&& (!a1stg_in1_51) && (!a1stg_in1_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_inf_sng_in2= (!a1stg_in2_exp_neq_ffs)
		&& (!a1stg_in2_54) && (!a1stg_in2_53_32_neq_0)
		&& a1stg_sngopa[2];

assign a1stg_inf_dbl_in2= (!a1stg_in2_exp_neq_ffs)
		&& (!a1stg_in2_51) && (!a1stg_in2_50_0_neq_0)
		&& a1stg_dblopa[2];

assign a1stg_inf_in1= a1stg_inf_sng_in1 || a1stg_inf_dbl_in1;

assign a1stg_inf_in2= a1stg_inf_sng_in2 || a1stg_inf_dbl_in2;

assign a1stg_2inf_in= a1stg_inf_in1 && a1stg_inf_in2;


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan add inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_infnan_sng_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_sngopa[3];

assign a1stg_infnan_dbl_in1= (!a1stg_in1_exp_neq_ffs) && a1stg_dblopa[3];

assign a1stg_infnan_sng_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_sngopa[3];

assign a1stg_infnan_dbl_in2= (!a1stg_in2_exp_neq_ffs) && a1stg_dblopa[3];

assign a1stg_infnan_in1= a1stg_infnan_sng_in1 || a1stg_infnan_dbl_in1;

assign a1stg_infnan_in2= a1stg_infnan_sng_in2 || a1stg_infnan_dbl_in2;

assign a1stg_infnan_in= a1stg_infnan_in1 || a1stg_infnan_in2;


///////////////////////////////////////////////////////////////////////////////
//
//	Zero inputs.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// correctly detect case where both single precision operands are zero

// assign a1stg_2zero_in= a1stg_in1_exp_eq_0 && (!a1stg_in1_51)
//		&& (!a1stg_in1_50_0_neq_0)
//		&& a1stg_in2_exp_eq_0 && (!a1stg_in2_51)
//		&& (!a1stg_in2_50_0_neq_0);

assign a1stg_2zero_in =

		a1stg_in1_exp_eq_0                          &&
                (!a1stg_in1_54          || a1stg_dblopa[3]) &&  // (!bit54          ) || dp
                (!a1stg_in1_53_32_neq_0 || a1stg_dblopa[3]) &&  // (!bit53 && !bit52) || dp
                (!a1stg_in1_51)                             &&
                (!a1stg_in1_50_0_neq_0)                     &&

                a1stg_in2_exp_eq_0                          &&
                (!a1stg_in2_54          || a1stg_dblopa[3]) &&  // (!bit54          ) || dp
                (!a1stg_in2_53_32_neq_0 || a1stg_dblopa[3]) &&  // (!bit53 && !bit52) || dp
                (!a1stg_in2_51)                             &&
                (!a1stg_in2_50_0_neq_0);


///////////////////////////////////////////////////////////////////////////////
//
//      Floating point add control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add input stage.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_step= (!fixtosd_hold) && (!a6stg_hold);

assign a1stg_stepa= a1stg_step;

assign a1stg_op_in[7:0]= ({8{inq_add}}
			    & inq_op[7:0]);

dffre_s #(8) i_a1stg_op (
        .din    (a1stg_op_in[7:0]),
        .en     (a1stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      (a1stg_op[7:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a1stg_sngop (
	.din	(inq_op[0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_sngop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_a1stg_sngopa (
        .din	({4{inq_op[0]}}),
        .en	(a1stg_step),
        .clk	(rclk),
 
        .q	(a1stg_sngopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_a1stg_dblop (
	.din	(inq_op[1]),
        .en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(4) i_a1stg_dblopa (
 	.din	({4{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(rclk),

	.q	(a1stg_dblopa[3:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(2) i_a1stg_rnd_mode (
        .din    (inq_rnd_mode[1:0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a1stg_id (
        .din    (inq_id[4:0]),
        .en     (a1stg_step),
        .clk    (rclk),
 
        .q      (a1stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a1stg_fcc (
        .din    (inq_fcc[1:0]),
        .en     (a1stg_step),
        .clk    (rclk),

        .q      (a1stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode decode- add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_fadd= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
		|| (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED)
		|| (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD)
		|| (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FITOD)
		|| (a1stg_op[7:0]==FXTOS) || (a1stg_op[7:0]==FXTOD)
		|| (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
		|| (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX)
		|| (a1stg_op[7:0]==FSTOD) || (a1stg_op[7:0]==FDTOS);

assign a1stg_dbl_dst= (a1stg_op[7:0]==FADDD) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FITOD) || (a1stg_op[7:0]==FXTOD)
		|| (a1stg_op[7:0]==FSTOD);

assign a1stg_sng_dst= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS)
		|| (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_long_dst= (a1stg_op[7:0]==FSTOX) || (a1stg_op[7:0]==FDTOX);

assign a1stg_int_dst= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FDTOI);

assign a1stg_intlngop= (!(a1stg_sngopa[3] || a1stg_dblop));

assign a1stg_faddsubop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
		|| (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fsubop= (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fsdtox= (a1stg_op[7:0]==FSTOX) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fcmpesd= (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED);

assign a1stg_fcmpsd= (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD);

assign a1stg_faddsub_dtosop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
                || (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_fdtoix= (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fstoix= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX);

assign a1stg_fsdtoix= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
		|| (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX);

assign a1stg_fixtosd= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FITOD)
		|| (a1stg_op[7:0]==FXTOS) || (a1stg_op[7:0]==FXTOD);

assign a1stg_fstod= (a1stg_op[7:0]==FSTOD);

assign a1stg_fstoi= (a1stg_op[7:0]==FSTOI);

assign a1stg_fstox= (a1stg_op[7:0]==FSTOX);

assign a1stg_fdtoi= (a1stg_op[7:0]==FDTOI);

assign a1stg_fdtox= (a1stg_op[7:0]==FDTOX);

assign a1stg_fsdtoix_fdtos= (a1stg_op[7:0]==FSTOI) || (a1stg_op[7:0]==FSTOX)
                || (a1stg_op[7:0]==FDTOI) || (a1stg_op[7:0]==FDTOX)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_fitos= (a1stg_op[7:0]==FITOS);

assign a1stg_fitod= (a1stg_op[7:0]==FITOD);

assign a1stg_fxtos= (a1stg_op[7:0]==FXTOS);

assign a1stg_fcmpop= (a1stg_op[7:0]==FCMPS) || (a1stg_op[7:0]==FCMPD)
		|| (a1stg_op[7:0]==FCMPES) || (a1stg_op[7:0]==FCMPED);

assign a1stg_f4cycop= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FADDD)
                || (a1stg_op[7:0]==FSUBS) || (a1stg_op[7:0]==FSUBD)
                || (a1stg_op[7:0]==FDTOS) || (a1stg_op[7:0]==FSTOD)
		|| (a1stg_op[7:0]==FITOD);

assign a1stg_fixtos_fxtod= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS)
		|| (a1stg_op[7:0]==FXTOD);

assign a1stg_faddsubs_fdtos= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS)
		|| (a1stg_op[7:0]==FDTOS);

assign a1stg_faddsubs= (a1stg_op[7:0]==FADDS) || (a1stg_op[7:0]==FSUBS);

assign a1stg_faddsubd= (a1stg_op[7:0]==FADDD) || (a1stg_op[7:0]==FSUBD);

assign a1stg_fdtos= (a1stg_op[7:0]==FDTOS);

assign a1stg_fistod= (a1stg_op[7:0]==FITOD) || (a1stg_op[7:0]==FSTOD);

assign a1stg_fixtos= (a1stg_op[7:0]==FITOS) || (a1stg_op[7:0]==FXTOS);

assign a1stg_fxtod= (a1stg_op[7:0]==FXTOD);

assign a1stg_opdec_36 = a1stg_dblop;

assign a1stg_opdec[34:28] =
			 {a1stg_fadd,
			  a1stg_dbl_dst,
			  a1stg_sng_dst,
			  a1stg_long_dst,
			  a1stg_int_dst,
			  a1stg_faddsubop,
			  a1stg_fsubop};

assign a1stg_opdec_24_21[3:0] =
			 {a1stg_faddsub_dtosop,
			  a1stg_fdtoix,
			  a1stg_fstoix,
			  a1stg_fsdtoix};

assign a1stg_opdec_19_11[8:0] =
			 {a1stg_fstod,
			  a1stg_fstoi,
			  a1stg_fstox,
			  a1stg_fdtoi,
			  a1stg_fdtox,
			  a1stg_fsdtoix_fdtos,
			  a1stg_fitos,
			  a1stg_fitod,
			  a1stg_fxtos};
 
assign a1stg_opdec_9_0[9:0] = 
			 {a1stg_fcmpop,
			  a1stg_f4cycop,
			  a1stg_fixtos_fxtod,
			  a1stg_faddsubs_fdtos,
			  a1stg_faddsubs,
			  a1stg_faddsubd,
			  a1stg_fdtos,
			  a1stg_fistod,
			  a1stg_fixtos,
			  a1stg_fxtod};

assign fixtosd_hold= a2stg_fixtos_fxtod
		&& (!(a1stg_op[7] && (!a1stg_op[1]) && (!a1stg_op[0])
			&& (a1stg_op[2] || (!a1stg_op[6]))));

assign a2stg_opdec_in[30:0]= {31{(!fixtosd_hold)}}
			    & {a1stg_opdec_36, a1stg_opdec[34:28],
                               a1stg_opdec_24_21[3:0], a1stg_opdec_19_11[8:0],
                               a1stg_opdec_9_0[9:0]};

dffre_s #(31) i_a2stg_opdec (
	.din	(a2stg_opdec_in[30:0]),
	.en	(a6stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q      ({a2stg_opdec_36, a2stg_opdec[34:28], a2stg_opdec_24_21[3:0],
                  a2stg_opdec_19_11[8:0], a2stg_opdec_9_0[9:0]}),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a2stg_rnd_mode (
        .din    (a1stg_rnd_mode[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a2stg_id (
        .din    (a1stg_id[4:0]),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a2stg_fcc (
        .din    (a1stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_fadd= a2stg_opdec[34];
assign a2stg_long_dst= a2stg_opdec[31];
assign a2stg_faddsubop= a2stg_opdec[29];
assign a2stg_fsubop= a2stg_opdec[28];
assign a2stg_faddsub_dtosop= a2stg_opdec_24_21[3];
assign a2stg_fdtoix= a2stg_opdec_24_21[2];
assign a2stg_fstoix= a2stg_opdec_24_21[1];
assign a2stg_fsdtoix= a2stg_opdec_24_21[0];
assign a2stg_fstod= a2stg_opdec_19_11[8];
assign a2stg_fstoi= a2stg_opdec_19_11[7];
assign a2stg_fstox= a2stg_opdec_19_11[6];
assign a2stg_fdtoi= a2stg_opdec_19_11[5];
assign a2stg_fdtox= a2stg_opdec_19_11[4];
assign a2stg_fsdtoix_fdtos= a2stg_opdec_19_11[3];
assign a2stg_fitos= a2stg_opdec_19_11[2];
assign a2stg_fitod= a2stg_opdec_19_11[1];
assign a2stg_fxtos= a2stg_opdec_19_11[0];
assign a2stg_fcmpop= a2stg_opdec_9_0[9];
assign a2stg_fixtos_fxtod= a2stg_opdec_9_0[7];
assign a2stg_fdtos= a2stg_opdec_9_0[3];
assign a2stg_fxtod= a2stg_opdec_9_0[0];

dffre_s #(19) i_a3stg_opdec (
        .din    ({a2stg_opdec_36, a2stg_opdec[34:29], a2stg_opdec_24_21[3],
                  a2stg_opdec_24_21[0], a2stg_opdec_9_0[9:0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a3stg_opdec_36, a3stg_opdec[34:29], a3stg_opdec_24,
                  a3stg_opdec_21, a3stg_opdec_9_0[9:0]}),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(2) i_a3stg_faddsubopa (
	.din	({2{a2stg_faddsubop}}),
	.en	(a6stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(a3stg_faddsubopa[1:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(2) i_a3stg_rnd_mode (
        .din    (a2stg_rnd_mode[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_rnd_mode[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_a3stg_id (
        .din    (a2stg_id[4:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a3stg_fcc (
        .din    (a2stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_fadd= a3stg_opdec[34];
assign a3stg_int_dst= a3stg_opdec[30];
assign a3stg_faddsubop= a3stg_opdec[29];
assign a3stg_fsdtoix= a3stg_opdec_21;
assign a3stg_f4cycop= a3stg_opdec_9_0[8];
assign a3stg_fixtos_fxtod= a3stg_opdec_9_0[7];
assign a3stg_fdtos= a3stg_opdec_9_0[3];

dffre_s #(18) i_a4stg_opdec (
        .din    ({a3stg_opdec_36, a3stg_opdec[34:29], a3stg_opdec_24,
                  a3stg_opdec_21, a3stg_opdec_9_0[9], a3stg_opdec_9_0[7:0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a4stg_opdec_36, a4stg_opdec[34:29], a4stg_opdec_24,
                  a4stg_opdec_21, a4stg_opdec_9, a4stg_opdec_7_0[7:0]}),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_mode_in[1:0]= ({2{a3stg_f4cycop}}
			    & a3stg_rnd_mode[1:0])
		| ({2{(!a3stg_f4cycop)}}
			    & a4stg_rnd_mode2[1:0]);

dffe_s #(2) i_a4stg_rnd_mode (
	.din	(a4stg_rnd_mode_in[1:0]),
	.en     (a6stg_step),
	.clk    (rclk),

        .q      (a4stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_rnd_mode2 (
	.din	(a3stg_rnd_mode[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_rnd_mode2[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_id_in[9:0]= {(a3stg_id[4:2]==3'o7),
				(a3stg_id[4:2]==3'o6),
				(a3stg_id[4:2]==3'o5),
				(a3stg_id[4:2]==3'o4),
				(a3stg_id[4:2]==3'o3),
				(a3stg_id[4:2]==3'o2),
				(a3stg_id[4:2]==3'o1),
				(a3stg_id[4:2]==3'o0),
				a3stg_id[1:0]};

dffe_s #(10) i_a4stg_id (
        .din    (a4stg_id_in[9:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_fcc (
        .din    (a3stg_fcc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_fcc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add stages 4 and 5.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_dblop= a4stg_opdec_36;
assign a4stg_fadd= a4stg_opdec[34];
assign a4stg_faddsubop= a4stg_opdec[29];
assign a4stg_faddsub_dtosop= a4stg_opdec_24;
assign a4stg_fsdtoix= a4stg_opdec_21;
assign a4stg_fcmpop= a4stg_opdec_9;
assign a4stg_fixtos_fxtod= a4stg_opdec_7_0[7];
assign a4stg_faddsubs_fdtos= a4stg_opdec_7_0[6];
assign a4stg_faddsubs= a4stg_opdec_7_0[5];
assign a4stg_faddsubd= a4stg_opdec_7_0[4];
assign a4stg_fdtos= a4stg_opdec_7_0[3];
assign a4stg_fistod= a4stg_opdec_7_0[2];

dffre_s #(9) i_a5stg_opdec (
        .din    ({a4stg_opdec[34:30], a4stg_opdec_9, a4stg_opdec_7_0[7],
                  a4stg_opdec_7_0[1], a4stg_opdec_7_0[0]}),
        .en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a5stg_opdec[34:30], a5stg_opdec_9, a5stg_opdec_7,
                  a5stg_opdec_1, a5stg_opdec_0}),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(10) i_a5stg_id (
        .din    (a4stg_id[9:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a5stg_id[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign a5stg_fadd= a5stg_opdec[34];
assign a5stg_fixtos_fxtod= a5stg_opdec_7;
assign a5stg_fixtos= a5stg_opdec_1;
assign a5stg_fxtod= a5stg_opdec_0;

assign a6stg_opdec_in[34:30] = ({5{a5stg_fixtos_fxtod}}
			    & a5stg_opdec[34:30])
		| ({5{((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod))}}
			    & a4stg_opdec[34:30]);

assign a6stg_opdec_in_9 = (a5stg_fixtos_fxtod
			    & a5stg_opdec_9)
		| (((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod))
			    & a4stg_opdec_9);

assign a6stg_fadd_in= (a5stg_fixtos_fxtod && a6stg_step && (!reset)
			&& a5stg_fadd)
		|| ((!a4stg_fixtos_fxtod) && (!a5stg_fixtos_fxtod)
			&& a6stg_step && (!reset) && a4stg_fadd)
		|| ((!a6stg_step) && (!reset) && a6stg_fadd);

dffre_s #(6) i_a6stg_opdec (
	.din	({a6stg_opdec_in[34:30], a6stg_opdec_in_9}),
	.en     (a6stg_step),
        .rst    (reset),
        .clk    (rclk),

        .q      ({a6stg_opdec[34:30], a6stg_opdec_9}),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_id_out_in[9:0]= ({10{((!a5stg_fixtos_fxtod) && a6stg_step)}}
			    & a4stg_id[9:0])
		| ({10{(a5stg_fixtos_fxtod && a6stg_step)}}
			    & a5stg_id[9:0])
		| ({10{(!a6stg_step)}}
			    & add_id_out[9:0]);

dff_s #(10) i_add_id_out (
	.din	(add_id_out_in[9:0]),
        .clk    (rclk),

        .q      (add_id_out[9:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_fcc_out_in[1:0]= ({2{a4stg_fcmpop}}
			    & a4stg_fcc);

dffe_s #(2) i_add_fcc_out (
	.din    (add_fcc_out_in[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_fcc_out[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- add pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign a6stg_fadd= a6stg_opdec[34];
assign a6stg_dbl_dst= a6stg_opdec[33];
assign a6stg_sng_dst= a6stg_opdec[32];
assign a6stg_long_dst= a6stg_opdec[31];
assign a6stg_int_dst= a6stg_opdec[30];
assign a6stg_fcmpop= a6stg_opdec_9;

assign a6stg_hold= a6stg_fadd && (!add_dest_rdy);

assign a6stg_step= (!a6stg_hold);

// Austin update
// Power management update

assign add_pipe_active_in =  // add pipe is executing a valid instr
   a1stg_fadd || a2stg_fadd || a3stg_fadd || a4stg_fadd || a5stg_fadd || a6stg_fadd;

dffre_s #(1) i_add_pipe_active (
	.din	(add_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (add_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add sign and exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Add sign logic.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_sub= (a1stg_fsubop ^ (a1stg_in1_63 ^ a1stg_in2_63))
		&& (!a1stg_fdtos)
		&& (!(a1stg_faddsubop && a1stg_nan_in));

dffe_s #(1) i_a2stg_sign1 (
	.din	(a1stg_in1_63),
	.en	(a6stg_step),
	.clk    (rclk),

        .q      (a2stg_sign1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_sign2 (
	.din    (a1stg_in2_63),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_sub (
        .din    (a1stg_sub),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_sub),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_neq_in1_frac (
        .din    (a1stg_in2_neq_in1_frac),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_neq_in1_frac),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_gt_in1_frac (
        .din    (a1stg_in2_gt_in1_frac),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_gt_in1_frac),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_eq_in1_exp (
        .din    (a1stg_in2_eq_in1_exp),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_eq_in1_exp),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_in2_gt_in1_exp (
        .din    (a1stg_expadd1[11]),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_in2_gt_in1_exp),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_nan_in (
        .din    (a1stg_nan_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_nan_in),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_nan_in2 (
        .din    (a1stg_nan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_nan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_snan_in2 (
        .din    (a1stg_snan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_snan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_qnan_in2 (
        .din    (a1stg_qnan_in2),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_qnan_in2),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_snan_in1 (
        .din    (a1stg_snan_in1),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_snan_in1),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_qnan_in1 (
        .din    (a1stg_qnan_in1),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_qnan_in1),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_2zero_in (
        .din    (a1stg_2zero_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_2zero_in),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a2stg_2inf_in (
        .din    (a1stg_2inf_in),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a2stg_2inf_in),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_in2_eq_in1= a2stg_in2_eq_in1_exp && (!a2stg_in2_neq_in1_frac);

assign a2stg_in2_gt_in1= a2stg_in2_gt_in1_exp
		|| (a2stg_in2_eq_in1_exp && a2stg_in2_neq_in1_frac
			&& a2stg_in2_gt_in1_frac);

assign a3stg_sub_in= a2stg_sub
		&& (!a2stg_nan_in)
		&& (!(a2stg_fsdtoix && (!a2stg_expadd[11])));

assign a2stg_faddsub_sign= (a2stg_sign1
			&& (!a2stg_nan_in)
			&& (a2stg_sign2 ^ a2stg_fsubop)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| (a2stg_sign1
			&& (!a2stg_nan_in)
			&& (!a2stg_in2_eq_in1)
			&& (!a2stg_in2_gt_in1)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| ((!a2stg_in2_eq_in1)
			&& a2stg_in2_gt_in1
			&& (!a2stg_nan_in)
			&& (a2stg_sign2 ^ a2stg_fsubop)
			&& (!(a2stg_2inf_in && a2stg_sub)))
		|| (a2stg_sign2
			&& (a2stg_snan_in2
				|| (a2stg_qnan_in2 && (!a2stg_snan_in1))))
		|| (a2stg_sign1
			&& ((a2stg_snan_in1 && (!a2stg_snan_in2))
				|| (a2stg_qnan_in1 && (!a2stg_nan_in2))))
		|| ((a2stg_rnd_mode[1:0]==2'b11)
			&& a2stg_in2_eq_in1
			&& (a2stg_sign1 ^ (a2stg_sign2 ^ a2stg_fsubop))
			&& (!a2stg_nan_in)
			&& (!a2stg_2inf_in));

assign a3stg_sign_in= (a2stg_faddsubop && a2stg_faddsub_sign)
		|| ((!a2stg_faddsubop) && a2stg_sign2);

dffe_s #(1) i_a3stg_sign (
	.din	(a3stg_sign_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_sign),

	.se     (se),
        .si     (),
        .so     ()
);

assign a2stg_cc_1= ((a2stg_sign2 && (!a2stg_2zero_in) && a2stg_sub)
			|| ((!a2stg_in2_eq_in1) && (!a2stg_sub)
				&& (a2stg_in2_gt_in1 ^ (!a2stg_sign2)))
			|| a2stg_nan_in)
		&& a2stg_fcmpop;

assign a2stg_cc_0= (((!a2stg_sign2) && (!a2stg_2zero_in) && a2stg_sub)
			|| ((!a2stg_in2_eq_in1) && (!a2stg_sub)
				&& (a2stg_in2_gt_in1 ^ a2stg_sign2))
			|| a2stg_nan_in)
		&& a2stg_fcmpop;

assign a2stg_cc[1:0]= {a2stg_cc_1, a2stg_cc_0};

dffe_s #(2) i_a3stg_cc (
	.din	(a2stg_cc[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_cc[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_sign_in= (a3stg_f4cycop && a3stg_sign)
		|| ((!a3stg_f4cycop) && a4stg_sign2);

dffe_s #(1) i_a4stg_sign (
	.din	(a4stg_sign_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_sign),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_sign2 (
	.din	(a3stg_sign),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(2) i_a4stg_cc (
        .din    (a3stg_cc[1:0]),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_cc[1:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add sign logic.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_add_sign_out (
	.din	(a4stg_sign),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (add_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);

assign add_cc_out_in[1:0]= ({2{a4stg_fcmpop}}
			    & a4stg_cc[1:0]);

dffe_s #(2) i_add_cc_out (
	.din	(add_cc_out_in[1:0]),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (add_cc_out[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_nv= (a1stg_faddsubop
			&& ((a1stg_2inf_in && a1stg_sub)
				|| a1stg_snan_in1
				|| a1stg_snan_in2))
		|| (a1stg_fstod && a1stg_snan_in2)
		|| (a1stg_fdtos && a1stg_snan_in2)
		|| (a1stg_fcmpesd && a1stg_nan_in)
		|| (a1stg_fcmpsd
			&& (a1stg_snan_in1 || a1stg_snan_in2));

dffe_s #(1) i_a2stg_nv (
	.din	(a1stg_nv),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

assign a1stg_of_mask= (!(a1stg_faddsub_dtosop && a1stg_infnan_in));

dffe_s #(1) i_a2stg_of_mask (
        .din    (a1stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a2stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_nv_in= ((!a2stg_expadd[11])
			&& a2stg_fsdtoix
			&& ((!a2stg_sign2)
				|| (|a2stg_expadd[10:0])
				|| a2stg_frac2hi_neq_0
				|| (a2stg_long_dst && a2stg_frac2lo_neq_0)))
		|| a2stg_nv;

dffe_s #(1) i_a3stg_nv (
	.din	(a3stg_nv_in),
	.en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a3stg_of_mask (
        .din    (a2stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a3stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);

assign a2stg_nx_tmp1= (a2stg_fdtoix && (|a2stg_exp[11:10]))
		|| (a2stg_fstoix && (|a2stg_exp[11:7]));

assign a2stg_nx_tmp2= ((a2stg_fdtoix && (!(|a2stg_exp[11:10])))
			|| (a2stg_fstoix && (!(|a2stg_exp[11:7]))))
		&& ((|a2stg_exp[10:1])
			|| a2stg_frac2hi_neq_0
			|| a2stg_frac2lo_neq_0
			|| a2stg_frac2_63);

assign a2stg_nx_tmp3= (a2stg_exp[11:0]==12'h41f)
		&& a2stg_sign2
		&& (!a2stg_frac2hi_neq_0)
		&& a2stg_frac2lo_neq_0
		&& a2stg_fdtoi;

dffe_s #(1) i_a3stg_a2_expadd_11 (
	.din	(a2stg_expadd[11]),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_a2_expadd_11),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp1 (
	.din	(a2stg_nx_tmp1),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp1),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp2 (
	.din	(a2stg_nx_tmp2),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_a3stg_nx_tmp3 (
	.din	(a2stg_nx_tmp3),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a3stg_nx_tmp3),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_nx= (a3stg_a2_expadd_11
		    && ((a3stg_nx_tmp1
				&& ((a3stg_fsdtoi_nx && a3stg_int_dst)
					|| a3stg_fsdtoix_nx))
			|| a3stg_nx_tmp2))
		|| a3stg_nx_tmp3;

assign a4stg_nv_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
			&& a3stg_nv)
		|| ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
			&& a4stg_nv2);
dffe_s #(1) i_a4stg_nv (
        .din    (a4stg_nv_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_nv),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_nv2 (
        .din    (a3stg_nv),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_nv2),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_of_mask_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
                        && a3stg_of_mask)
		|| ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
                        && a4stg_of_mask2);

dffe_s #(1) i_a4stg_of_mask (
        .din    (a4stg_of_mask_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_of_mask),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_of_mask2 (
        .din    (a3stg_of_mask),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_of_mask2),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_nx_in= ((a3stg_fadd && (!a3stg_fixtos_fxtod))
                        && a3stg_nx)
                || ((!(a3stg_fadd && (!a3stg_fixtos_fxtod)))
                        && a4stg_nx2);

dffe_s #(1) i_a4stg_nx (
        .din    (a4stg_nx_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (a4stg_nx),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_a4stg_nx2 (
        .din    (a3stg_nx),
        .en     (a6stg_step),
        .clk    (rclk),
 
        .q      (a4stg_nx2),
 
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add exception logic.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_add_nv_out (
        .din    (a4stg_nv),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_nv_out),

        .se     (se),
        .si     (),
        .so     ()
);

assign a4stg_in_of= ((a4stg_exp[11] || (&a4stg_exp[10:0]))
			&& a4stg_faddsubd
			&& a4stg_of_mask)
		|| (((|a4stg_exp[11:8]) || (&a4stg_exp[7:0]))
			&& a4stg_faddsubs_fdtos
			&& a4stg_of_mask);

assign add_of_out_tmp1_in= ((&a4stg_exp[10:1]) && a4stg_rndup && a4stg_round
			&& a4stg_faddsubd
                        && a4stg_of_mask)
		|| ((&a4stg_exp[7:1]) && a4stg_rndup
			&& (a4stg_round || a4stg_fdtos)
			&& a4stg_faddsubs_fdtos
			&& a4stg_of_mask);

dffe_s #(1) i_add_of_out_tmp1 (
        .din    (add_of_out_tmp1_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_of_out_tmp1),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_add_of_out_tmp2 (
	.din	(a4stg_in_of),
        .en	(a6stg_step),
        .clk	(rclk),
 
        .q	(add_of_out_tmp2),
 
        .se	(se),
        .si	(),
        .so	()
);

assign add_of_out= add_of_out_tmp2
		|| (add_of_out_tmp1 && add_of_out_cout);

assign a4stg_uf= ((!(|a4stg_exp[10:0]))
			&& a4stg_frac_neq_0
			&& (a4stg_round || a4stg_fdtos)
			&& a4stg_faddsub_dtosop)
		|| (a4stg_faddsubop
			&& (!(a4stg_round || a4stg_fdtos))
			&& (!a4stg_denorm_inv)
			&& a4stg_shl_data_neq_0);

dffe_s #(1) i_add_uf_out (
        .din    (a4stg_uf),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_uf_out),

        .se     (se),
        .si     (),
        .so     ()
);

assign add_nx_out_in= (a4stg_of_mask
			&& a4stg_frac_dbl_nx
			&& (a4stg_faddsubd || a5stg_fxtod)
			&& ((!a4stg_faddsubd) || a4stg_round))
		|| (a4stg_of_mask
			&& a4stg_frac_sng_nx
			&& (a4stg_faddsubs_fdtos || a5stg_fixtos)
			&& ((!a4stg_faddsubs) || a4stg_round))
		|| a4stg_nx;

dffe_s #(1) i_add_nx_out (
        .din    (add_nx_out_in),
        .en     (a6stg_step),
        .clk    (rclk),

        .q      (add_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign add_exc_out[4:0]= {add_nv_out, add_of_out, add_uf_out, 1'b0, add_nx_out};

assign add_exc_out[4:0] =
  {add_nv_out,
   add_of_out,
   add_uf_out,
   1'b0,
   (add_nx_out || add_of_out)};  // Overflow is always accompanied by inexact

///////////////////////////////////////////////////////////////////////////////
//
//      Add pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add normalization and special input injection.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_frac1_in_frac1= a1stg_snan_in2
		|| (a1stg_qnan_in2 && (!a1stg_snan_in1));

assign a2stg_frac1_in_frac2= a1stg_faddsubop
		&& ((!a1stg_2nan_in)
			|| a1stg_snan_in2
        		|| (a1stg_qnan_in2 && (!a1stg_snan_in1)));

assign a1stg_2nan_in_inv= (!a1stg_2nan_in);

assign a1stg_faddsubop_inv= (!a1stg_faddsubop);

assign a2stg_frac1_in_qnan= (a1stg_nan_in
			|| (a1stg_2inf_in && a1stg_sub))
		&& a1stg_faddsubop;

assign a2stg_frac1_in_nv= a1stg_2inf_in && a1stg_sub && a1stg_faddsubop;

assign a2stg_frac1_in_nv_dbl= a1stg_2inf_in && a1stg_sub && a1stg_faddsubd;

assign a2stg_frac2_in_frac1= a1stg_faddsubop && (!a1stg_infnan_in);

assign a2stg_frac2_in_qnan= a1stg_snan_in2 && (!a1stg_faddsubop);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe right shift count
//		count calculation.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_exp_diff_add1= a1stg_faddsub_dtosop && (!a1stg_expadd1[11]);

assign a1stg_exp_diff_add2= a1stg_faddsubop && a1stg_expadd1[11];

assign a1stg_exp_diff_5= (!a1stg_expadd2[5]) && a1stg_fsdtox;

assign a1stg_exp_diff[10:0]= ({11{a1stg_exp_diff_add1}}
			    & a1stg_expadd1[10:0])
		| ({11{a1stg_exp_diff_add2}}
			    & (~a1stg_expadd4_inv[10:0]))
		| ({11{a1stg_fsdtoix}}
			    & {5'b0, a1stg_exp_diff_5, (~a1stg_expadd2[4:0])});

assign a1stg_clamp63[5:0]= a1stg_exp_diff[5:0] | {6{(|a1stg_exp_diff[10:6])}};

assign a2stg_shr_cnt_in[5:0]= a1stg_clamp63[5:0];

assign a2stg_shr_cnt_5_inv_in= (!a1stg_clamp63[5]);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe right shift.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_shr_frac2_shr_int= a2stg_faddsub_dtosop && a6stg_step;

assign a2stg_shr_frac2_shr_dbl= ((a2stg_fdtox && (|a2stg_exp[11:10]))
			|| (a2stg_fstox && (|a2stg_exp[11:7])))
		&& a6stg_step;

assign a2stg_shr_frac2_shr_sng= ((a2stg_fdtoi && (|a2stg_exp[11:10]))
			|| (a2stg_fstoi && (|a2stg_exp[11:7])))
		&& a6stg_step;

assign a2stg_shr_frac2_max= a2stg_fsdtoix && a6stg_step;

assign a2stg_sub_step= a2stg_sub && a6stg_step;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe adder.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_faddsub_clamp63_0= (|(({6{a1stg_expadd1[11]}}
			    & (~{a1stg_expadd4_inv[10:6],
						a1stg_expadd4_inv[0]}))
		| ({6{(!a1stg_expadd1[11])}}
			    & {a1stg_expadd1[10:6], a1stg_expadd1[0]})));

assign a2stg_fracadd_frac2_inv_in= (a1stg_fixtosd && a1stg_in2_63)
		|| (a1stg_faddsubop && a1stg_sub
			&& (!a1stg_faddsub_clamp63_0));

assign a2stg_fracadd_frac2_inv_shr1_in= a1stg_faddsubop && a1stg_sub
			&& a1stg_faddsub_clamp63_0;

assign a2stg_fracadd_frac2_in= (a1stg_fixtosd && (!a1stg_in2_63))
		|| a1stg_fstod
		|| (a1stg_faddsubop && (!a1stg_sub));

dffe_s #(1) i_a2stg_fracadd_frac2 (
	.din	(a2stg_fracadd_frac2_in),
	.en	(a6stg_step),
	.clk	(rclk),

	.q	(a2stg_fracadd_frac2),

	.se	(se),
	.si	(),
	.so   	()
);

assign a2stg_fracadd_cin_in= (a1stg_fixtosd && a1stg_in2_63)
		|| (a1stg_faddsubop && a1stg_sub);


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe exponent adjustment.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp_7ff= a2stg_fstod && (&a2stg_exp[7:0]);

assign a3stg_exp_ff= a2stg_fdtos && (&a2stg_exp[10:0]);

assign a3stg_exp_add= (a2stg_fstod && (!(&a2stg_exp[7:0])))
		|| (a2stg_fdtos && (!(&a2stg_exp[10:0])));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- add pipe exponent decode- used to identify denorm results.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expdec_neq_0= a2stg_faddsubop && (a2stg_exp[10:0]<11'h36);


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines and control logic
//		- add pipe main adder
//		- add pipe exponent increment/decrement adjustment
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp10_0_eq0= (a3stg_exp[10:0]==11'b0);

assign a3stg_exp10_1_eq0= (a3stg_exp[10:1]==10'b0);

assign a3stg_fdtos_inv= (!a3stg_fdtos);

assign a4stg_fixtos_fxtod_inv= (!a4stg_fixtos_fxtod);

assign a4stg_rnd_frac_add_inv= (!(a3stg_fsdtoix
		|| (a3stg_faddsubop && a3stg_exp10_0_eq0)));


///////////////////////////////////////////////////////////////////////////////
//
//	Control logic- add pipe left shift count.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_cnt_in[9:0]= ({10{a3stg_denorm}}
			    & {(a3stg_exp[5:4]==2'b11),
				(a3stg_exp[5:4]==2'b10),
				(a3stg_exp[5:4]==2'b01),
				(a3stg_exp[5:4]==2'b00),
				a3stg_exp[5:0]})
		| ({10{a3stg_denorm_inv}}
			    & {(a3stg_lead0[5:4]==2'b11),
				(a3stg_lead0[5:4]==2'b10),
				(a3stg_lead0[5:4]==2'b01),
				(a3stg_lead0[5:4]==2'b00),
				a3stg_lead0[5:0]});


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe rounding adder.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rnd_sng= a5stg_fixtos || a4stg_faddsubs_fdtos;

assign a4stg_rnd_dbl= a5stg_fxtod || a4stg_faddsubd;

	
///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe fraction output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rndup_sng= ((a4stg_rnd_mode==2'b10) && (!a4stg_sign)
			&& a4stg_frac_sng_nx)
		|| ((a4stg_rnd_mode==2'b11) && a4stg_sign
			&& a4stg_frac_sng_nx)
		|| ((a4stg_rnd_mode==2'b00) && a4stg_rnd_frac_39
			&& (a4stg_frac_38_0_nx || a4stg_rnd_frac_40));

assign a4stg_rndup_dbl= ((a4stg_rnd_mode==2'b10) && (!a4stg_sign)
                        && a4stg_frac_dbl_nx)
                || ((a4stg_rnd_mode==2'b11) && a4stg_sign
                        && a4stg_frac_dbl_nx)
                || ((a4stg_rnd_mode==2'b00) && a4stg_rnd_frac_10
			&& (a4stg_frac_9_0_nx || a4stg_rnd_frac_11));

assign a4stg_rndup= (a4stg_faddsubd && a4stg_rndup_dbl)
		|| (a4stg_faddsubs && a4stg_rndup_sng)
		|| (a4stg_fdtos && a4stg_rndup_sng && a4stg_of_mask);

assign a5stg_rndup= (a5stg_fxtod && a4stg_rndup_dbl)
		|| (a5stg_fixtos && a4stg_rndup_sng);

assign add_frac_out_rndadd= (a4stg_faddsubop && a4stg_round && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && a4stg_rndup && (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && a5stg_rndup);

assign add_frac_out_rnd_frac= (a4stg_faddsubop && a4stg_round && (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && (!a4stg_rndup) && (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && (!a5stg_rndup))
		|| a4stg_fsdtoix;

assign add_frac_out_shl= (a4stg_faddsubop && (!a4stg_round) && (!a4stg_in_of))
		|| a4stg_fistod;

assign a4stg_to_0= (!((a4stg_rnd_mode==2'b00)
			|| ((a4stg_rnd_mode==2'b10) && (!a4stg_sign))
			|| ((a4stg_rnd_mode==2'b11) && a4stg_sign)));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines and control logic- add pipe exponent output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign add_exp_out_expinc= (a4stg_faddsubop && a4stg_round && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a4stg_fdtos && a4stg_rndup
			&& (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod && a5stg_rndup);

assign add_exp_out_exp= (a4stg_faddsubop && a4stg_round
			&& (!a4stg_in_of))
		|| (a4stg_fdtos
			&& (!a4stg_in_of))
		|| a5stg_fixtos_fxtod;

assign add_exp_out_exp1= (a4stg_faddsubop && a4stg_round
			&& (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a4stg_fdtos
			&& (!a4stg_rndup)
			&& (!a4stg_in_of))
		|| (a5stg_fixtos_fxtod
			&& (!a5stg_rndup));

assign add_exp_out_expadd= (a4stg_faddsubop && (!a4stg_round) && (!a4stg_in_of))
		|| a4stg_fistod;

assign a4stg_to_0_inv= (!a4stg_to_0);


endmodule


