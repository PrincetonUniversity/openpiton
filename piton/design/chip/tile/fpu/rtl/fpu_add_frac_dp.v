// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_frac_dp.v
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
//	Add pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module fpu_add_frac_dp (
	inq_in1,
	inq_in2,
	a1stg_step,
	a1stg_sngop,
	a1stg_expadd3_11,
	a1stg_norm_dbl_in1,
	a1stg_denorm_dbl_in1,
	a1stg_norm_sng_in1,
	a1stg_denorm_sng_in1,
	a1stg_norm_dbl_in2,
	a1stg_denorm_dbl_in2,
	a1stg_norm_sng_in2,
	a1stg_denorm_sng_in2,
	a1stg_intlngop,
	a2stg_frac1_in_frac1,
	a2stg_frac1_in_frac2,
	a1stg_2nan_in_inv,
	a1stg_faddsubop_inv,
	a2stg_frac1_in_qnan,
	a2stg_frac1_in_nv,
	a2stg_frac1_in_nv_dbl,
	a6stg_step,
	a2stg_frac2_in_frac1,
	a2stg_frac2_in_qnan,
	a2stg_shr_cnt_in,
	a2stg_shr_cnt_5_inv_in,
	a2stg_shr_frac2_shr_int,
	a2stg_shr_frac2_shr_dbl,
	a2stg_shr_frac2_shr_sng,
	a2stg_shr_frac2_max,
	a2stg_expadd_11,
	a2stg_sub_step,
	a2stg_fracadd_frac2_inv_in,
	a2stg_fracadd_frac2_inv_shr1_in,
	a2stg_fracadd_frac2,
	a2stg_fracadd_cin_in,
	a2stg_exp,
	a2stg_expdec_neq_0,
	a3stg_faddsubopa,
	a3stg_sub_in,
	a3stg_exp10_0_eq0,
	a3stg_exp10_1_eq0,
	a3stg_exp_0,
	a4stg_rnd_frac_add_inv,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_rnd_sng,
	a4stg_rnd_dbl,
	a4stg_shl_cnt_in,
	add_frac_out_rndadd,
	add_frac_out_rnd_frac,
	a4stg_in_of,
	add_frac_out_shl,
	a4stg_to_0,
	fadd_clken_l,
	rclk,
	
	a1stg_in2_neq_in1_frac,
	a1stg_in2_gt_in1_frac,
	a1stg_in2_eq_in1_exp,
	a2stg_frac2_63,
	a2stg_frac2hi_neq_0,
	a2stg_frac2lo_neq_0,
	a3stg_fsdtoix_nx,
	a3stg_fsdtoi_nx,
	a3stg_denorm,
	a3stg_denorm_inv,
	a3stg_lead0,
	a4stg_round,
	a4stg_shl_cnt,
	a4stg_denorm_inv,
	a3stg_inc_exp_inv,
	a3stg_same_exp_inv,
	a3stg_dec_exp_inv,
	a4stg_rnd_frac_40,
	a4stg_rnd_frac_39,
	a4stg_rnd_frac_11,
	a4stg_rnd_frac_10,
	a4stg_rndadd_cout,
	a4stg_frac_9_0_nx,
	a4stg_frac_dbl_nx,
	a4stg_frac_38_0_nx,
	a4stg_frac_sng_nx,
	a4stg_frac_neq_0,
	a4stg_shl_data_neq_0,
	add_of_out_cout,
	add_frac_out,

	se,
        si,
        so
);


input [62:0]	inq_in1;		// request operand 1 to op pipes
input [63:0]	inq_in2;		// request operand 2 to op pipes
input		a1stg_step;		// add pipe load
input		a1stg_sngop;		// single precision operation- add 1 stg
input		a1stg_expadd3_11;	// exponent adder sign out- add 1 stg
input		a1stg_norm_dbl_in1;	// select line to normalized fraction 1
input		a1stg_denorm_dbl_in1;	// select line to normalized fraction 1
input		a1stg_norm_sng_in1;	// select line to normalized fraction 1
input		a1stg_denorm_sng_in1;	// select line to normalized fraction 1
input		a1stg_norm_dbl_in2;	// select line to normalized fraction 2
input		a1stg_denorm_dbl_in2;	// select line to normalized fraction 2
input		a1stg_norm_sng_in2;	// select line to normalized fraction 2
input		a1stg_denorm_sng_in2;	// select line to normalized fraction 2
input		a1stg_intlngop;		// integer/long input- add 1 stage
input		a2stg_frac1_in_frac1;	// select line to a2stg_frac1
input		a2stg_frac1_in_frac2;	// select line to a2stg_frac1
input		a1stg_2nan_in_inv;	// 2 NaN inputs- a1 stage
input		a1stg_faddsubop_inv;	// add/subtract- a1 stage
input		a2stg_frac1_in_qnan;	// make fraction 1 a QNaN
input		a2stg_frac1_in_nv;	// NV- make a new prec QNaN
input		a2stg_frac1_in_nv_dbl;	// NV- make a new double prec QNaN
input		a6stg_step;		// advance the add pipe
input		a2stg_frac2_in_frac1;	// select line to a2stg_frac2
input		a2stg_frac2_in_qnan;	// make fraction 2 a QNaN
input [5:0]	a2stg_shr_cnt_in;	// right shift count input- add 1 stage
input		a2stg_shr_cnt_5_inv_in;	// right shift count input[5]- add 1 stg
input		a2stg_shr_frac2_shr_int; // select line to a3stg_frac2
input		a2stg_shr_frac2_shr_dbl; // select line to a3stg_frac2
input		a2stg_shr_frac2_shr_sng; // select line to a3stg_frac2
input		a2stg_shr_frac2_max;	// select line to a3stg_frac2
input		a2stg_expadd_11;	// exponent adder[11]- add 2 stage
input		a2stg_sub_step;		// select line to a3stg_frac2
input		a2stg_fracadd_frac2_inv_in; // sel line to main adder input 2
input		a2stg_fracadd_frac2_inv_shr1_in; // sel line to main adder in 2
input		a2stg_fracadd_frac2;	// select line to main adder input 2
input		a2stg_fracadd_cin_in;	// carry in to main adder- add 1 stage
input [5:0]	a2stg_exp;		// exponent add 2 stage bits[5:0]
input		a2stg_expdec_neq_0;	// exponent will be < 54
input [1:0]	a3stg_faddsubopa;	// denorm compare lead0[10] input select
input		a3stg_sub_in;		// subtract in main adder- add 3 stage
input		a3stg_exp10_0_eq0;	// exponent[10:0]==0- add 3 stg
input		a3stg_exp10_1_eq0;	// exponent[10:1]==0- add 3 stg
input		a3stg_exp_0;		// exponent[0]- add 3 stg
input		a4stg_rnd_frac_add_inv;	// select line to a4stg_rnd_frac
input		a3stg_fdtos_inv;	// double to single convert- add 3 stg
input		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
input		a4stg_rnd_sng;		// round to single precision- add 4 stg
input		a4stg_rnd_dbl;		// round to double precision- add 4 stg
input [9:0]	a4stg_shl_cnt_in;	// postnorm shift left count- add 3 stg
input		add_frac_out_rndadd;	// select line to add_frac_out
input		add_frac_out_rnd_frac;	// select line to add_frac_out
input		a4stg_in_of;		// add overflow- select fraction out
input		add_frac_out_shl;	// select line to add_frac_out
input		a4stg_to_0;		// result to max finite on overflow
input		fadd_clken_l;           // add pipe clk enable - asserted low
input		rclk;		// global clock

output		a1stg_in2_neq_in1_frac;	// operand 2 fraction != oprnd 1 frac
output		a1stg_in2_gt_in1_frac;	// operand 2 fraction > oprnd 1 frac
output		a1stg_in2_eq_in1_exp;	// operand 2 exponent == oprnd 1 exp
output		a2stg_frac2_63;		// fraction 2 bit[63]- add 2 stage
output		a2stg_frac2hi_neq_0;	// fraction 2[62:32]in add 2 stage != 0
output		a2stg_frac2lo_neq_0;	// fraction 2[31:11] in add 2 stage != 0
output		a3stg_fsdtoix_nx;	// inexact result for flt -> ints
output		a3stg_fsdtoi_nx;	// inexact result for flt -> 32b ints
output		a3stg_denorm;		// denorm output- add 3 stage
output		a3stg_denorm_inv;	// result is not a denorm- add 3 stage
output [5:0]	a3stg_lead0;		// leading 0's count- add 3 stage
output		a4stg_round;		// round the result- add 4 stage
output [5:0]	a4stg_shl_cnt;		// subtract in main adder- add 4 stage
output		a4stg_denorm_inv;	// 0 the exponent
output		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
output		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
output		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
output		a4stg_rnd_frac_40;	// rounded fraction[40]- add 4 stage
output		a4stg_rnd_frac_39;	// rounded fraction[39]- add 4 stage
output		a4stg_rnd_frac_11;	// rounded fraction[11]- add 4 stage
output		a4stg_rnd_frac_10;	// rounded fraction[10]- add 4 stage
output		a4stg_rndadd_cout;	// fraction rounding adder carry out
output		a4stg_frac_9_0_nx;	// inexact double precision result
output		a4stg_frac_dbl_nx;	// inexact double precision result
output		a4stg_frac_38_0_nx;	// inexact single precision result
output		a4stg_frac_sng_nx;	// inexact single precision result
output		a4stg_frac_neq_0;	// fraction != 0- add 4 stage
output		a4stg_shl_data_neq_0;	// left shift result != 0- add 4 stage
output		add_of_out_cout;	// fraction rounding adder carry out
output [63:0]	add_frac_out;		// add fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [62:0]	a1stg_in1;
wire [54:0]	a1stg_in1a;
wire		a1stg_in1_31_0_neq_0;
wire		a1stg_in1_50_32_neq_0;
wire		a1stg_in1_50_0_neq_0;
wire		a1stg_in1_53_32_neq_0;
wire		a1stg_in1_51;
wire		a1stg_in1_54;
wire [63:0]	a1stg_in2;
wire [54:0]	a1stg_in2a;
wire		a1stg_in2_31_0_neq_0;
wire		a1stg_in2_50_32_neq_0;
wire		a1stg_in2_50_0_neq_0;
wire		a1stg_in2_53_32_neq_0;
wire		a1stg_in2_51;
wire		a1stg_in2_54;
wire		a1stg_in2_neq_in1_frac;
wire		a1stg_in2_gt_in1_frac;
wire		a1stg_in2_gt_in1;
wire		a1stg_in2_eq_in1_exp;
wire [63:0]	a1stg_norm_frac1;
wire [63:0]	a1stg_norm_frac2;
wire [63:0]	a2stg_frac1_in;
wire [63:0]	a2stg_frac1;
wire [63:0]	a2stg_frac2_in;
wire [63:0]	a2stg_frac2;
wire [63:0]	a2stg_frac2a;
wire		a2stg_frac2_63;
wire		a2stg_frac2hi_neq_0;
wire		a2stg_frac2lo_neq_0;
wire [115:52]	a2stg_shr;
wire		a2stg_fsdtoix_nx;
wire		a2stg_fsdtoi_nx;
wire		a2stg_shr_60_0_neq_0;
wire [63:0]	a2stg_shr_frac2_inv;
wire [63:0]	a3stg_frac2_in;
wire [63:0]	a3stg_frac2;
wire [63:0]	a3stg_frac1;
wire [63:0]	a2stg_fracadd_in2;
wire [63:0]	a2stg_fracadd;
wire [63:0]	a3stg_ld0_frac;
wire [53:0]	a2stg_expdec_tmp;
wire [53:0]	a2stg_expdec;
wire [53:0]	a3stg_expdec;
wire		a3stg_ld0_dnrm_10;
wire		a3stg_denorm;
wire		a3stg_denorm_inv;
wire		a3stg_denorma;
wire		a3stg_denorm_inva;
wire [5:0]	a3stg_lead0;
wire [63:0]	a3stg_fracadd;
wire		a4stg_round_in;
wire		a4stg_round;
wire [5:0]	a2stg_shr_cnt;
wire [5:3]	a2stg_shr_cnta;
wire [2:0]	a2stg_shr_cnta_5;
wire [3:0]	a2stg_shr_cnt_5_inv;
wire [3:0]	a2stg_shr_cnt_5;
wire [4:0]	a2stg_shr_cnt_4;
wire [4:0]	a2stg_shr_cnt_3;
wire [1:0]	a2stg_shr_cnt_2;
wire [1:0]	a2stg_shr_cnt_1;
wire [1:0]	a2stg_shr_cnt_0;
wire		a3stg_sub;
wire		a3stg_suba;
wire [2:0]	a4stg_shl_cnt_dec54_0;
wire [2:0]	a4stg_shl_cnt_dec54_1;
wire [2:0]	a4stg_shl_cnt_dec54_2;
wire [2:0]	a4stg_shl_cnt_dec54_3;
wire [5:0]	a4stg_shl_cnt;
wire		a2stg_fracadd_frac2_inv;
wire		a2stg_fracadd_frac2_inv_shr1;
wire		a4stg_denorm_inv;
wire		a3stg_fsdtoix_nx;
wire		a3stg_fsdtoi_nx;
wire		a2stg_fracadd_cin;
wire [63:0]	astg_xtra_regs;
wire		a3stg_inc_exp_inv;
wire		a3stg_same_exp_inv;
wire		a3stg_dec_exp_inv;
wire		a3stg_inc_exp_inva;
wire		a3stg_fsame_exp_inv;
wire		a3stg_fdec_exp_inv;
wire [63:0]	a4stg_rnd_frac_pre1_in;
wire [63:0]	a4stg_rnd_frac_pre1;
wire [63:0]	a4stg_rnd_frac_pre2_in;
wire [63:0]	a4stg_rnd_frac_pre2;
wire [63:0]	a4stg_rnd_frac_pre3_in;
wire [63:0]	a4stg_rnd_frac_pre3;
wire [63:0]	a4stg_rnd_frac;
wire [63:0]	a4stg_rnd_fraca;
wire		a4stg_rnd_frac_40;
wire		a4stg_rnd_frac_39;
wire		a4stg_rnd_frac_11;
wire		a4stg_rnd_frac_10;
wire [63:0]	a4stg_shl_data_in;
wire [63:0]	a4stg_shl_data;
wire [52:0]	a4stg_rndadd_tmp;
wire		a4stg_rndadd_cout;
wire [51:0]	a4stg_rndadd;
wire		a4stg_frac_9_0_nx;
wire		a4stg_frac_dbl_nx;
wire		a4stg_frac_38_0_nx;
wire		a4stg_frac_sng_nx;
wire		a4stg_frac_neq_0;
wire		a4stg_shl_data_neq_0;
wire [126:0]	a4stg_shl_tmp;
wire [63:0]	a4stg_shl;
wire		add_of_out_cout;
wire		a5stg_frac_out_rndadd;
wire		a5stg_frac_out_rnd_frac;
wire		a5stg_in_of;
wire		a5stg_frac_out_shl;
wire		a5stg_to_0;
wire [51:0]	a5stg_rndadd;
wire [63:0]	a5stg_rnd_frac;
wire [63:0]	a5stg_shl;
wire [63:0]	add_frac_out;

wire [63:0] a2stg_shr_tmp2;
wire [63:0] a2stg_shr_tmp4;
wire [63:0] a2stg_shr_tmp6;
wire [63:0] a2stg_shr_tmp8;
wire [63:0] a2stg_shr_tmp10;
wire [63:0] a2stg_shr_tmp13;
wire [63:0] a2stg_shr_tmp18;
wire [63:20] a2stg_nx_neq0_84_tmp_1;
wire [63:36] a2stg_nx_neq0_84_tmp_2;
wire [63:44] a2stg_nx_neq0_84_tmp_3;
wire [63:48] a2stg_nx_neq0_84_tmp_4;
wire [61:50] a2stg_nx_neq0_84_tmp_5;
wire [60:59] a2stg_nx_neq0_84_tmp_6;
wire a2stg_nx_neq0_84_tmp_6_51;

wire [63:0] a4stg_shl_tmp4;

wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_add_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fadd_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//	Add fraction inputs.
//
//	Add input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(63) i_a1stg_in1 (
        .din    (inq_in1[62:0]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in1[62:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_a1stg_in1a (
        .din	(inq_in1[54:0]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in1a[54:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(64) i_a1stg_in2 (
        .din    (inq_in2[63:0]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in2[63:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_a1stg_in2a (
        .din	(inq_in2[54:0]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in2a[54:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add normalization and special input injection.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in2_gt_in1_frac i_a1stg_in2_gt_in1_frac (
	.din1			(a1stg_in1a[54:0]),
	.din2			(a1stg_in2a[54:0]),
	.sngop			(a1stg_sngop),
	.expadd11		(a1stg_expadd3_11),
	.expeq			(a1stg_in2_eq_in1_exp),

	.din2_neq_din1		(a1stg_in2_neq_in1_frac),
	.din2_gt_din1		(a1stg_in2_gt_in1_frac),
	.din2_gt1_din1		(a1stg_in2_gt_in1)
);

assign a1stg_in2_eq_in1_exp= (&{(~(a1stg_in1[62:55] ^ a1stg_in2[62:55])),
				((~(a1stg_in1[54:52] ^ a1stg_in2[54:52]))
					| {3{a1stg_sngop}})});

assign a1stg_norm_frac1[63:0]= ({64{a1stg_norm_dbl_in1}}
			    & {1'b1, a1stg_in1[51:0], 11'b0})
		| ({64{a1stg_denorm_dbl_in1}}
			    & {a1stg_in1[51:0], 12'b0})
		| ({64{a1stg_norm_sng_in1}}
			    & {1'b1, a1stg_in1[54:32], 40'b0})
		| ({64{a1stg_denorm_sng_in1}}
			    & {a1stg_in1[54:32], 41'b0});

assign a1stg_norm_frac2[63:0]= ({64{a1stg_norm_dbl_in2}}
			    & {1'b1, a1stg_in2[51:0], 11'b0})
                | ({64{a1stg_denorm_dbl_in2}}
                            & {a1stg_in2[51:0], 12'b0})
                | ({64{a1stg_norm_sng_in2}} 
                            & {1'b1, a1stg_in2[54:32], 40'b0})
                | ({64{a1stg_denorm_sng_in2}}
                            & {a1stg_in2[54:32], 41'b0})
		| ({64{a1stg_intlngop}}
			    & a1stg_in2[63:0]);

assign a2stg_frac1_in[63:0]= ({64{(a1stg_faddsubop_inv
				|| (!((a1stg_in2_gt_in1 && a1stg_2nan_in_inv)
						|| a2stg_frac1_in_frac1)))}}
			    & {a1stg_norm_frac1[63],
				(a1stg_norm_frac1[62] || a2stg_frac1_in_qnan),
				(a1stg_norm_frac1[61:40]
						| {22{a2stg_frac1_in_nv}}),
				(a1stg_norm_frac1[39:11]
						| {29{a2stg_frac1_in_nv_dbl}}),
				a1stg_norm_frac1[10:0]})
		| ({64{(a2stg_frac1_in_frac2
				    && (a1stg_in2_gt_in1 || a2stg_frac1_in_frac1))}}
			    & {a1stg_norm_frac2[63],
				(a1stg_norm_frac2[62] || a2stg_frac1_in_qnan),
				(a1stg_norm_frac2[61:40]
						| {22{a2stg_frac1_in_nv}}),
				(a1stg_norm_frac2[39:11]
						| {29{a2stg_frac1_in_nv_dbl}}),
				a1stg_norm_frac2[10:0]});

dffe_s #(64) i_a2stg_frac1 (
	.din	(a2stg_frac1_in[63:0]),
	.en	(a6stg_step),
	.clk    (clk),

        .q      (a2stg_frac1[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a2stg_frac2_in[63:0]= ({64{a1stg_faddsubop_inv}}
			    & {a1stg_norm_frac2[63],
				(a1stg_norm_frac2[62] || a2stg_frac2_in_qnan),
                                a1stg_norm_frac2[61:0]})
		| ({64{(a2stg_frac2_in_frac1 && (!a1stg_in2_gt_in1))}}
			    & {a1stg_norm_frac2[63],
        			(a1stg_norm_frac2[62] || a2stg_frac2_in_qnan),
        			a1stg_norm_frac2[61:0]})
		| ({64{(a2stg_frac2_in_frac1 && a1stg_in2_gt_in1)}}
			    & a1stg_norm_frac1[63:0]);

dffe_s #(64) i_a2stg_frac2 (
	.din	(a2stg_frac2_in[63:0]),
	.en	(a6stg_step),
	.clk    (clk),

        .q      (a2stg_frac2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a2stg_frac2a (
	.din	(a2stg_frac2_in[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a2stg_frac2a[63:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe right shift
//		- shift the smaller fraction right for adds and subtracts
//		- shift the fraction right for float to integer conversion
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_frac2_63= a2stg_frac2[63];

assign a2stg_frac2hi_neq_0= (|a2stg_frac2[62:32]);

assign a2stg_frac2lo_neq_0= (|a2stg_frac2[31:11]);


// a2 stage right shifter
assign a2stg_shr_tmp2[63:0] = ({{24{a2stg_shr_cnt_5[0]}}, {16{a2stg_shr_cnt_5[1]}}, {13{a2stg_shr_cnt_5[2]}}, {11{a2stg_shr_cnt_5[3]}}} & {32'h00000000, a2stg_frac2a[63:32]})
	| ({{24{a2stg_shr_cnt_5_inv[0]}}, {16{a2stg_shr_cnt_5_inv[1]}}, {13{a2stg_shr_cnt_5_inv[2]}}, {11{a2stg_shr_cnt_5_inv[3]}}} & a2stg_frac2a[63:0]);

assign a2stg_shr_tmp4[63:0] = ({{24{a2stg_shr_cnt_4[0]}}, {16{a2stg_shr_cnt_4[1]}}, {13{a2stg_shr_cnt_4[2]}}, {11{a2stg_shr_cnt_4[3]}}} & {16'h0000, a2stg_shr_tmp2[63:16]})
	| ({{43{~a2stg_shr_cnt_4[4]}}, {21{~a2stg_shr_cnt_4[4]}}} & a2stg_shr_tmp2[63:0]);

assign a2stg_shr_tmp6[63:0] = ~(({{24{a2stg_shr_cnt_3[0]}}, {16{a2stg_shr_cnt_3[1]}}, {13{a2stg_shr_cnt_3[2]}}, {11{a2stg_shr_cnt_3[3]}}} & {8'h00, a2stg_shr_tmp4[63:8]})
	| ({64{~a2stg_shr_cnt_3[4]}} & a2stg_shr_tmp4[63:0]));

assign a2stg_shr_tmp8[63:0] = ~(({{43{a2stg_shr_cnt_2[0]}}, {21{a2stg_shr_cnt_2[0]}}} | a2stg_shr_tmp6[63:0])
	& ({64{~a2stg_shr_cnt_2[1]}} | {4'hf, a2stg_shr_tmp6[63:4]}));

assign a2stg_shr_tmp10[63:0] = ~(({{43{a2stg_shr_cnt_1[0]}}, {21{a2stg_shr_cnt_1[0]}}} & {2'b00, a2stg_shr_tmp8[63:2]})
	| ({64{~a2stg_shr_cnt_1[1]}} & a2stg_shr_tmp8[63:0]));

assign a2stg_shr[115:52] = ~(({{43{a2stg_shr_cnt_0[0]}}, {21{a2stg_shr_cnt_0[0]}}} | a2stg_shr_tmp10[63:0])
	 & ({64{~a2stg_shr_cnt_0[1]}} | {1'b1, a2stg_shr_tmp10[63:1]}));

assign a2stg_shr_tmp18[63:0] = ~a2stg_shr_tmp2[63:0];
assign a2stg_shr_tmp13[63:0] = a2stg_shr_tmp4[63:0];

// a2 stage nx signals
assign a2stg_fsdtoi_nx = (| a2stg_shr_tmp13[31:0])
	| (~(& a2stg_shr_tmp6[31:24]))
	| (| a2stg_shr_tmp8[31:28])
	| (~(& a2stg_shr_tmp10[31:30]))
	| a2stg_shr[83];


assign a2stg_nx_neq0_84_tmp_1[63:20] = ~((a2stg_frac2a[43:0] & {44{a2stg_shr_cnt[5]}})
	| ({a2stg_frac2a[11:0], 32'h00000000} & {44{~a2stg_shr_cnt[5]}}));

assign a2stg_nx_neq0_84_tmp_2[63:36] = ~(({a2stg_shr_tmp18[27:12], a2stg_nx_neq0_84_tmp_1[63:52]} | {28{~a2stg_shr_cnt[4]}})
	& (a2stg_nx_neq0_84_tmp_1[63:36] | {28{a2stg_shr_cnt[4]}}));

assign a2stg_nx_neq0_84_tmp_3[63:44] = ~(({a2stg_shr_tmp13[19:12], a2stg_nx_neq0_84_tmp_2[63:52]} & {20{a2stg_shr_cnt[3]}})
	| (a2stg_nx_neq0_84_tmp_2[63:44] & {20{~a2stg_shr_cnt[3]}}));

assign a2stg_nx_neq0_84_tmp_4[63:48] = ~(({a2stg_shr_tmp6[15:12], a2stg_nx_neq0_84_tmp_3[63:52]} | {16{~a2stg_shr_cnt[2]}})
	& (a2stg_nx_neq0_84_tmp_3[63:48] | {16{a2stg_shr_cnt[2]}}));

assign a2stg_nx_neq0_84_tmp_5[61:50] = ~((a2stg_nx_neq0_84_tmp_4[63:52] & {12{a2stg_shr_cnt[1]}})
	| (a2stg_nx_neq0_84_tmp_4[61:50] & {12{~a2stg_shr_cnt[1]}}));

assign a2stg_nx_neq0_84_tmp_6[59] = ~(a2stg_shr_cnt[0] | a2stg_nx_neq0_84_tmp_5[60]);
assign a2stg_nx_neq0_84_tmp_6[60] = ~(~a2stg_shr_cnt[0] | a2stg_nx_neq0_84_tmp_5[61]);
assign a2stg_nx_neq0_84_tmp_6_51 = ~((a2stg_nx_neq0_84_tmp_5[52] | ~a2stg_shr_cnt[0])
	& (a2stg_nx_neq0_84_tmp_5[51] | a2stg_shr_cnt[0]));

assign a2stg_fsdtoix_nx = (~(& a2stg_nx_neq0_84_tmp_1[51:20])
	| (| a2stg_nx_neq0_84_tmp_2[51:36])
	| ~(& a2stg_nx_neq0_84_tmp_3[51:44])
	| (| a2stg_nx_neq0_84_tmp_4[51:48])
	| ~(& a2stg_nx_neq0_84_tmp_5[51:50])
	| a2stg_nx_neq0_84_tmp_6_51);

assign a2stg_shr_60_0_neq_0 = (~(& a2stg_nx_neq0_84_tmp_1[60:20])
	| (| a2stg_nx_neq0_84_tmp_2[60:45])
	| ~(& a2stg_nx_neq0_84_tmp_3[60:53])
	| (| a2stg_nx_neq0_84_tmp_4[60:57])
	| ~(& a2stg_nx_neq0_84_tmp_5[60:59])
	| (| a2stg_nx_neq0_84_tmp_6[60:59]));


assign a2stg_shr_frac2_inv[63:0]= (~(({64{a2stg_shr_frac2_shr_int}}
			    & {1'b0, a2stg_shr[115:61], a2stg_shr_60_0_neq_0,
					7'b0})
		| ({64{(a2stg_shr_frac2_shr_dbl && a2stg_expadd_11)}}
			    & a2stg_shr[115:52])
		| ({64{(a2stg_shr_frac2_shr_sng && a2stg_expadd_11)}}
			    & {a2stg_shr[115:84], 32'b0})
		| ({64{(a2stg_shr_frac2_max && (!a2stg_expadd_11))}}
			    & 64'h7fffffffffffffff)
		| ({64{(!a6stg_step)}}
			    & a3stg_frac2[63:0])));

assign a3stg_frac2_in[63:0]= (~(a2stg_shr_frac2_inv[63:0]
		^ {64{a2stg_sub_step}}));

dff_s #(64) i_a3stg_frac2 (
	.din	(a3stg_frac2_in[63:0]),
        .clk    (clk),

        .q      (a3stg_frac2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Pipe the other/larger fraction to stage 3.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(64) i_a3stg_frac1 (
	.din    ({1'b0, a2stg_frac1[63:1]}),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_frac1[63:0]),
         
        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe adder.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_fracadd_in2[63:0]= ({64{a2stg_fracadd_frac2_inv}}
			    & (~a2stg_frac2[63:0]))
		| ({64{a2stg_fracadd_frac2_inv_shr1}}
			    & (~{1'b0, a2stg_frac2[63:1]}))
		| ({64{a2stg_fracadd_frac2}}
			    & a2stg_frac2[63:0]);

assign a2stg_fracadd[63:0]= (a2stg_frac1[63:0]
			+ a2stg_fracadd_in2[63:0]
			+ {63'b0, a2stg_fracadd_cin});

dffe_s #(64) i_a3stg_ld0_frac (
	.din	(a2stg_fracadd[63:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_ld0_frac[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent decode- used to identify denorm results.
//
//      Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

// assign a2stg_expdec_tmp[107:0]= ({54'b0, 54'h20000000000000} >> a2stg_exp[5:0]);
assign a2stg_expdec_tmp[53:0] =          54'h20000000000000  >> a2stg_exp[5:0] ;

assign a2stg_expdec[53:0]= a2stg_expdec_tmp[53:0] & {54{a2stg_expdec_neq_0}};

dffe_s #(54) i_a3stg_expdec (
	.din	(a2stg_expdec[53:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a3stg_expdec[53:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe denorm comparator to identify denorm results.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_ld0_dnrm_10= (a3stg_faddsubopa[0] && a3stg_ld0_frac[10])
		|| ((!a3stg_faddsubopa[0]) && (|a3stg_ld0_frac[10:0]));

fpu_denorm_frac i_a3stg_denorm (
	.din1			({a3stg_ld0_frac[63:11], a3stg_ld0_dnrm_10}),
	.din2			(a3stg_expdec[53:0]),

	.din2_din1_denorm	(a3stg_denorm),
	.din2_din1_denorm_inv	(a3stg_denorm_inv),
	.din2_din1_denorma	(a3stg_denorma),
	.din2_din1_denorm_inva	(a3stg_denorm_inva)
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe leading 0's counter.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

fpu_cnt_lead0_64b i_a3stg_lead0 (
	.din	(a3stg_ld0_frac[63:0]),

	.lead0	(a3stg_lead0[5:0])
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe main adder.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_fracadd[63:0]= (a3stg_frac1[63:0]
			+ a3stg_frac2[63:0]
			+ {63'b0, a3stg_suba});

dffe_s #(64) i_astg_xtra_regs (
	.din	({{4{a2stg_shr_cnt_5_inv_in}}, {4{a2stg_shr_cnt_in[5]}},
			a2stg_shr_cnt_in[5:3],
			{5{a2stg_shr_cnt_in[4]}}, {5{a2stg_shr_cnt_in[3]}},
			a2stg_shr_cnt_in[5:0], a4stg_round_in,
			{2{a2stg_shr_cnt_in[2]}}, {2{a2stg_shr_cnt_in[1]}},
			{2{a2stg_shr_cnt_in[0]}},
			{3{a4stg_shl_cnt_in[6]}},
			{3{a4stg_shl_cnt_in[7]}},
			{3{a4stg_shl_cnt_in[8]}},
			{3{a4stg_shl_cnt_in[9]}},
			a4stg_shl_cnt_in[5:0],
			{3{a2stg_shr_cnt_in[5]}},
			a2stg_fracadd_frac2_inv_in,
			a2stg_fracadd_frac2_inv_shr1_in,
			a3stg_denorm_inva,
			a2stg_fsdtoix_nx, a2stg_fsdtoi_nx,
			1'b0, a2stg_fracadd_cin_in, {2{a3stg_sub_in}}}),
	.en	(a6stg_step),
	.clk	(clk),

	.q	({a2stg_shr_cnt_5_inv[3:0], a2stg_shr_cnt_5[3:0],
			a2stg_shr_cnta[5:3],
			a2stg_shr_cnt_4[4:0], a2stg_shr_cnt_3[4:0],
			a2stg_shr_cnt[5:0], a4stg_round,
			a2stg_shr_cnt_2[1:0], a2stg_shr_cnt_1[1:0],
			a2stg_shr_cnt_0[1:0],
			a4stg_shl_cnt_dec54_0[2:0],
			a4stg_shl_cnt_dec54_1[2:0],
			a4stg_shl_cnt_dec54_2[2:0],
			a4stg_shl_cnt_dec54_3[2:0],
			a4stg_shl_cnt[5:0],
			a2stg_shr_cnta_5[2:0],
			a2stg_fracadd_frac2_inv,
			a2stg_fracadd_frac2_inv_shr1,
			a4stg_denorm_inv,
			a3stg_fsdtoix_nx, a3stg_fsdtoi_nx,
			astg_xtra_regs[3], a2stg_fracadd_cin,
			a3stg_sub, a3stg_suba}),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_round_in= a3stg_fracadd[61]
		|| a3stg_fracadd[62]
		|| a3stg_fracadd[63];

assign a3stg_inc_exp_inv= (!a3stg_fracadd[63]);

assign a3stg_same_exp_inv= (!(((!a3stg_fracadd[63]) && a3stg_fracadd[62])
		|| ((!a3stg_fracadd[63]) && a3stg_exp10_0_eq0)));

assign a3stg_dec_exp_inv= (!((!a3stg_fracadd[63])
		&& (!a3stg_fracadd[62])
		&& a3stg_fracadd[61]
		&& (!a3stg_exp10_0_eq0)));

assign a3stg_inc_exp_inva= (!a3stg_fracadd[63]);

assign a3stg_fsame_exp_inv= (!(((!a3stg_fracadd[63])
			&& (!a3stg_fracadd[62])
			&& a3stg_fracadd[61]
			&& a3stg_exp10_1_eq0
			&& a3stg_exp_0)
		|| ((!a3stg_fracadd[63])
			&& a3stg_fracadd[62]
			&& (!a3stg_exp10_0_eq0))));

assign a3stg_fdec_exp_inv= (!((!a3stg_fracadd[63])
		&& (!a3stg_fracadd[62])
		&& a3stg_fracadd[61]
		&& (!a3stg_exp10_1_eq0)));

assign a4stg_rnd_frac_pre1_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_fdec_exp_inv))}}
			    & {a3stg_fracadd[61:0], 2'b00});

dff_s #(64) i_a4stg_rnd_frac_pre1 (
	.din	(a4stg_rnd_frac_pre1_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre1[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_frac_pre3_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_fsame_exp_inv))}}
			    & {a3stg_fracadd[62:0], 1'b0});

dff_s #(64) i_a4stg_rnd_frac_pre3 (
	.din	(a4stg_rnd_frac_pre3_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre3[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_rnd_frac_pre2_in[63:0]= ({64{(a3stg_faddsubopa[1] && a6stg_step
					&& (!a3stg_inc_exp_inva))}}
			    & a3stg_fracadd[63:0])
		| ({64{((!a4stg_rnd_frac_add_inv) && a6stg_step)}}
			    & a3stg_fracadd[63:0])
		| ({64{((!a3stg_fdtos_inv) && a6stg_step)}}
			    & {a3stg_fracadd[62:0], 1'b0})
		| ({64{((!a4stg_fixtos_fxtod_inv) && a6stg_step)}}
			    & a4stg_shl[63:0])
		| ({64{(!a6stg_step)}}
			    & a4stg_rnd_frac[63:0]);

dff_s #(64) i_a4stg_rnd_frac_pre2 (
	.din	(a4stg_rnd_frac_pre2_in[63:0]),
        .clk    (clk),

        .q      (a4stg_rnd_frac_pre2[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe input to left shift.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_data_in[63:0]= ({64{a3stg_denorm_inva}}
			    & a3stg_ld0_frac[63:0])
		| ({64{a3stg_denorma}}
			    & {1'b0, a3stg_ld0_frac[63:1]});

dffe_s #(64) i_a4stg_shl_data (
	.din	(a4stg_shl_data_in[63:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a4stg_shl_data[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe rounding adder.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_rnd_frac[63:0]= (a4stg_rnd_frac_pre1[63:0]
				| a4stg_rnd_frac_pre2[63:0]
				| a4stg_rnd_frac_pre3[63:0]);

assign a4stg_rnd_frac_40= a4stg_rnd_frac[40];

assign a4stg_rnd_frac_39= a4stg_rnd_frac[39];

assign a4stg_rnd_frac_11= a4stg_rnd_frac[11];

assign a4stg_rnd_frac_10= a4stg_rnd_frac[10];

assign a4stg_frac_9_0_nx= (|a4stg_rnd_frac[9:0]);

assign a4stg_frac_dbl_nx= a4stg_frac_9_0_nx || a4stg_rnd_frac[10];

assign a4stg_frac_38_0_nx= a4stg_frac_dbl_nx || (|a4stg_rnd_frac[38:11]);

assign a4stg_frac_sng_nx= a4stg_frac_38_0_nx || a4stg_rnd_frac[39];

assign a4stg_frac_neq_0= a4stg_frac_sng_nx || (|a4stg_rnd_frac[63:40]);

assign a4stg_rndadd_tmp[52:0]= {1'b0, a4stg_rnd_frac[62:11]}
			+ {23'b0, a4stg_rnd_sng, 28'b0, a4stg_rnd_dbl};

assign a4stg_rndadd_cout= a4stg_rndadd_tmp[52];

assign a4stg_rndadd[51:0]= a4stg_rndadd_tmp[51:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe left shift.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_shl_data_neq_0= (|a4stg_shl_data[63:0]);

assign a4stg_shl_tmp4[63:0] = ({{32{a4stg_shl_cnt_dec54_0[0]}}, {21{a4stg_shl_cnt_dec54_0[1]}}, {11{a4stg_shl_cnt_dec54_0[2]}}} & a4stg_shl_data[63:0])
	| ({{32{a4stg_shl_cnt_dec54_1[0]}}, {21{a4stg_shl_cnt_dec54_1[1]}}, {11{a4stg_shl_cnt_dec54_1[2]}}} & {a4stg_shl_data[47:0], 16'h0000})
	| ({{32{a4stg_shl_cnt_dec54_2[0]}}, {21{a4stg_shl_cnt_dec54_2[1]}}, {11{a4stg_shl_cnt_dec54_2[2]}}} & {a4stg_shl_data[31:0], 32'h00000000})
	| ({{32{a4stg_shl_cnt_dec54_3[0]}}, {21{a4stg_shl_cnt_dec54_3[1]}}, {11{a4stg_shl_cnt_dec54_3[2]}}} & {a4stg_shl_data[15:0], 32'h00000000, 16'h0000});

assign a4stg_shl[63:0] = a4stg_shl_tmp4[63:0] << a4stg_shl_cnt[3:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe fraction output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(58) i_a5stg_rndadd (
	.din	({a4stg_rndadd_cout, add_frac_out_rndadd, add_frac_out_rnd_frac,
			a4stg_in_of, add_frac_out_shl, a4stg_to_0,
			a4stg_rndadd[51:0]}),
	.en	(a6stg_step),
        .clk    (clk),

	.q	({add_of_out_cout, a5stg_frac_out_rndadd,
			a5stg_frac_out_rnd_frac, a5stg_in_of,
			a5stg_frac_out_shl, a5stg_to_0,
			a5stg_rndadd[51:0]}),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a5stg_rnd_frac (
	.din	(a4stg_rnd_frac[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a5stg_rnd_frac[63:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(64) i_a5stg_shl (
	.din	(a4stg_shl[63:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a5stg_shl[63:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign add_frac_out[63:0]= ({64{a5stg_frac_out_rndadd}}
			    & {1'b0, a5stg_rndadd[51:0], 11'b0})
		| ({64{a5stg_frac_out_rnd_frac}}
			    & a5stg_rnd_frac[63:0])
		| ({64{a5stg_in_of}}
			    & {64{a5stg_to_0}})
		| ({64{a5stg_frac_out_shl}}
			    & a5stg_shl[63:0]);


endmodule

