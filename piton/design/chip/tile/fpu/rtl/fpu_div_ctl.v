// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_ctl.v
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
//	Divide pipeline synthesizable logic
//              - special input cases
//              - opcode pipeline
//              - sign logic
//              - exception logic
//              - datapath control- select lines and control logic
//
///////////////////////////////////////////////////////////////////////////////

module fpu_div_ctl (
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
	div_exp1,
	div_dest_rdy,
	inq_rnd_mode,
	inq_id,
	inq_in1_63,
	inq_in2_63,
	inq_div,
	div_exp_out,
	div_frac_add_52_inva,
	div_frac_add_in1_neq_0,
	div_frac_out_54,
	d6stg_frac_0,
	d6stg_frac_1,
	d6stg_frac_2,
	d6stg_frac_29,
	d6stg_frac_30,
	d6stg_frac_31,
	div_frac_out_53,
	div_expadd2_12,
	arst_l,
	grst_l,
	rclk,

	div_pipe_active,	
	d1stg_snan_sng_in1,
	d1stg_snan_dbl_in1,
	d1stg_snan_sng_in2,
	d1stg_snan_dbl_in2,
	d1stg_step,
	d1stg_dblop,
	d234stg_fdiv,
	d3stg_fdiv,
	d4stg_fdiv,
	d5stg_fdiva,
	d5stg_fdivb,
	d5stg_fdivs,
	d5stg_fdivd,
	d6stg_fdiv,
	d6stg_fdivs,
	d6stg_fdivd,
	d7stg_fdiv,
	d7stg_fdivd,
	d8stg_fdiv_in,
	d8stg_fdivs,
	d8stg_fdivd,
	div_id_out_in,
	div_sign_out,
	div_exc_out,
	div_norm_frac_in1_dbl_norm,
	div_norm_frac_in1_dbl_dnrm,
	div_norm_frac_in1_sng_norm,
	div_norm_frac_in1_sng_dnrm,
	div_norm_frac_in2_dbl_norm,
	div_norm_frac_in2_dbl_dnrm,
	div_norm_frac_in2_sng_norm,
	div_norm_frac_in2_sng_dnrm,
	div_norm_inf,
	div_norm_qnan,
	div_norm_zero,
	div_frac_add_in2_load,
	d6stg_frac_out_shl1,
	d6stg_frac_out_nosh,
	div_frac_add_in1_add,
	div_frac_add_in1_load,
	d7stg_rndup_inv,
	d7stg_to_0,
	d7stg_to_0_inv,
	div_frac_out_add_in1,
	div_frac_out_add,
	div_frac_out_shl1_dbl,
	div_frac_out_shl1_sng,
	div_frac_out_of,
	div_frac_out_load,
	div_expadd1_in1_dbl,
	div_expadd1_in1_sng,
	div_expadd1_in2_exp_in2_dbl,
	div_expadd1_in2_exp_in2_sng,
	div_exp1_expadd1,
	div_exp1_0835,
	div_exp1_0118,
	div_exp1_zero,
	div_exp1_load,
	div_expadd2_in1_exp_out,
	div_expadd2_no_decr_inv,
	div_expadd2_cin,
	div_exp_out_expadd22_inv,
	div_exp_out_expadd2,
	div_exp_out_of,
	div_exp_out_exp_out,
	div_exp_out_load,

	se,
	si,
	so
);


parameter
		FDIVS=  8'h4d,
		FDIVD=	8'h4e;


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
input [12:0]	div_exp1;		// divide exponent- intermediate value
input		div_dest_rdy;		// divide result req accepted for CPX
input [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
input [4:0]	inq_id;			// request ID to the operation pipes
input		inq_in1_63;		// request operand 1 to op pipes- sign
input		inq_in2_63;		// request operand 2 to op pipes- sign
input		inq_div;		// divide pipe request
input [12:0]	div_exp_out;		// divide exponent output
input		div_frac_add_52_inva;	// div_frac_add bit[52] inverted
input		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
input		div_frac_out_54;	// div_frac_out bit[54]
input		d6stg_frac_0;		// divide fraction[0]- intermediate val
input		d6stg_frac_1;		// divide fraction[1]- intermediate val
input		d6stg_frac_2;		// divide fraction[2]- intermediate val
input		d6stg_frac_29;		// divide fraction[29]- intermediate val
input		d6stg_frac_30;		// divide fraction[30]- intermediate val
input		d6stg_frac_31;		// divide fraction[31]- intermediate val
input		div_frac_out_53;	// div_frac_out bit[53]
input		div_expadd2_12;		// div_expadd2 bit[12]
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;		// global clock

output		div_pipe_active;        // div pipe is executing a valid instr
output		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
output		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
output		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
output		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
output		d1stg_step;		// divide pipe load
output		d1stg_dblop;		// double precision operation- d1 stg
output		d234stg_fdiv;		// select line to div_expadd1
output		d3stg_fdiv;		// divide operation- divide stage 3
output		d4stg_fdiv;		// divide operation- divide stage 4
output		d5stg_fdiva;		// divide operation- divide stage 5
output		d5stg_fdivb;		// divide operation- divide stage 5
output		d5stg_fdivs;		// divide single- divide stage 5
output		d5stg_fdivd;		// divide double- divide stage 5
output		d6stg_fdiv;		// divide operation- divide stage 6
output		d6stg_fdivs;		// divide single- divide stage 6
output		d6stg_fdivd;		// divide double- divide stage 6
output		d7stg_fdiv;		// divide operation- divide stage 7
output		d7stg_fdivd;		// divide double- divide stage 7
output		d8stg_fdiv_in;		// div pipe output request next cycle
output		d8stg_fdivs;		// divide single- divide stage 8
output		d8stg_fdivd;		// divide double- divide stage 8
output [9:0]	div_id_out_in;		// div pipe output ID next cycle
output		div_sign_out;		// divide sign output
output [4:0]	div_exc_out;		// divide pipe result- exception flags
output		div_norm_frac_in1_dbl_norm; // select line to div_norm
output		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
output		div_norm_frac_in1_sng_norm; // select line to div_norm
output		div_norm_frac_in1_sng_dnrm; // select line to div_norm
output		div_norm_frac_in2_dbl_norm; // select line to div_norm
output		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
output		div_norm_frac_in2_sng_norm; // select line to div_norm
output		div_norm_frac_in2_sng_dnrm; // select line to div_norm
output		div_norm_inf;		// select line to div_norm
output		div_norm_qnan;		// select line to div_norm
output		div_norm_zero;		// select line to div_norm
output		div_frac_add_in2_load;	// load enable to div_frac_add_in2
output		d6stg_frac_out_shl1;	// select line to d6stg_frac
output		d6stg_frac_out_nosh;	// select line to d6stg_frac
output		div_frac_add_in1_add;	// select line to div_frac_add_in1
output		div_frac_add_in1_load;	// load enable to div_frac_add_in1
output		d7stg_rndup_inv;	// no rounding increment
output		d7stg_to_0;		// result to max finite on overflow
output		d7stg_to_0_inv;		// result to infinity on overflow
output		div_frac_out_add_in1;	// select line to div_frac_out
output		div_frac_out_add;	// select line to div_frac_out
output		div_frac_out_shl1_dbl;	// select line to div_frac_out
output		div_frac_out_shl1_sng;	// select line to div_frac_out
output		div_frac_out_of;	// select line to div_frac_out
output		div_frac_out_load;	// load enable to div_frac_out
output		div_expadd1_in1_dbl;	// select line to div_expadd1
output		div_expadd1_in1_sng;	// select line to div_expadd1
output		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
output		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
output		div_exp1_expadd1;	// select line to div_exp1
output		div_exp1_0835;		// select line to div_exp1
output		div_exp1_0118;		// select line to div_exp1
output		div_exp1_zero;		// select line to div_exp1
output		div_exp1_load;		// load enable to div_exp1
output		div_expadd2_in1_exp_out; // select line to div_expadd2
output		div_expadd2_no_decr_inv; // no exponent decrement
output		div_expadd2_cin;	// carry in to 2nd exponent adder
output		div_exp_out_expadd22_inv; // select line to div_exp_out
output		div_exp_out_expadd2;	// select line to div_exp_out
output		div_exp_out_of;		// overflow to exponent output
output		div_exp_out_exp_out;	// select line to div_exp_out
output		div_exp_out_load;	// load enable to div_exp_out

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire		reset;
wire		div_frac_in1_51;
wire		div_frac_in1_54;
wire		div_frac_in1_53_0_neq_0;
wire		div_frac_in1_50_0_neq_0;
wire		div_frac_in1_53_32_neq_0;
wire		div_exp_in1_exp_eq_0;
wire		div_exp_in1_exp_neq_ffs;
wire		div_frac_in2_51;
wire		div_frac_in2_54;
wire		div_frac_in2_53_0_neq_0;
wire		div_frac_in2_50_0_neq_0;
wire		div_frac_in2_53_32_neq_0;
wire		div_exp_in2_exp_eq_0;
wire		div_exp_in2_exp_neq_ffs;
wire		d1stg_denorm_sng_in1;
wire		d1stg_denorm_dbl_in1;
wire		d1stg_denorm_sng_in2;
wire		d1stg_denorm_dbl_in2;
wire		d2stg_denorm_sng_in2;
wire		d2stg_denorm_dbl_in2;
wire		d1stg_norm_sng_in1;
wire		d1stg_norm_dbl_in1;
wire		d1stg_norm_sng_in2;
wire		d1stg_norm_dbl_in2;
wire		d2stg_norm_sng_in2;
wire		d2stg_norm_dbl_in2;
wire		d1stg_snan_sng_in1;
wire		d1stg_snan_dbl_in1;
wire		d1stg_snan_sng_in2;
wire		d1stg_snan_dbl_in2;
wire		d1stg_qnan_sng_in1;
wire		d1stg_qnan_dbl_in1;
wire		d1stg_qnan_sng_in2;
wire		d1stg_qnan_dbl_in2;
wire		d1stg_snan_in1;
wire		d1stg_snan_in2;
wire		d1stg_qnan_in1;
wire		d1stg_qnan_in2;
wire		d1stg_nan_sng_in1;
wire		d1stg_nan_dbl_in1;
wire		d1stg_nan_sng_in2;
wire		d1stg_nan_dbl_in2;
wire		d1stg_nan_in1;
wire		d1stg_nan_in2;
wire		d1stg_nan_in;
wire		d2stg_snan_in1;
wire		d2stg_snan_in2;
wire		d2stg_qnan_in1;
wire		d2stg_qnan_in2;
wire		d2stg_nan_in2;
wire		d2stg_nan_in;
wire		d1stg_inf_sng_in1;
wire		d1stg_inf_dbl_in1;
wire		d1stg_inf_sng_in2;
wire		d1stg_inf_dbl_in2;
wire		d1stg_inf_in1;
wire		d1stg_inf_in2;
wire		d1stg_inf_in;
wire		d1stg_2inf_in;
wire		d2stg_inf_in1;
wire		d2stg_inf_in2;
wire		d2stg_2inf_in;
wire		d1stg_infnan_sng_in1;
wire		d1stg_infnan_dbl_in1;
wire		d1stg_infnan_sng_in2;
wire		d1stg_infnan_dbl_in2;
wire		d1stg_infnan_in1;
wire		d1stg_infnan_in2;
wire		d1stg_infnan_in;
wire		d2stg_infnan_in1;
wire		d2stg_infnan_in2;
wire		d2stg_infnan_in;
wire		d1stg_zero_in1;
wire		d1stg_zero_in2;
wire		d1stg_zero_in;
wire		d1stg_2zero_in;
wire		d2stg_zero_in1;
wire		d2stg_zero_in2;
wire		d2stg_zero_in;
wire		d2stg_2zero_in;
wire		d1stg_hold;
wire		d1stg_holda;
wire		d1stg_step;
wire		d1stg_stepa;
wire [7:0]	d1stg_op_in;
wire [7:0]	d1stg_op;
wire		d1stg_div_in;
wire		d1stg_div;
wire [4:0]	d1stg_sngopa;
wire		d1stg_dblop;
wire [4:0]	d1stg_dblopa;
wire		d1stg_fdiv;
wire		d1stg_fdivs;
wire		d1stg_fdivd;
wire [2:0]	d1stg_opdec;
wire		d234stg_fdiv_in;
wire [2:0]	d2stg_opdec;
wire		d234stg_fdiv;
wire		d2stg_fdiv;
wire		d2stg_fdivs;
wire		d2stg_fdivd;
wire [2:0]	d3stg_opdec;
wire		d3stg_fdiv;
wire [2:0]	d4stg_opdec;
wire		d4stg_fdiv;
wire		d4stg_fdivs;
wire		d4stg_fdivd;
wire		d5stg_step;
wire [2:0]	d5stg_opdec;
wire		d5stg_fdiva;
wire		d5stg_fdivb_in;
wire		d5stg_fdivb;
wire		d5stg_fdiv;
wire		d5stg_fdivs;
wire		d5stg_fdivd;
wire		d6stg_step;
wire [2:0]	d6stg_opdec_in;
wire [2:0]	d6stg_opdec;
wire		d6stg_fdiv;
wire		d6stg_fdivs;
wire		d6stg_fdivd;
wire [2:0]	d7stg_opdec;
wire		d7stg_fdiv;
wire		d7stg_fdivs;
wire		d7stg_fdivd;
wire		d8stg_fdiv_in;
wire [2:0]	d8stg_opdec;
wire		d8stg_fdiv;
wire		d8stg_fdivs;
wire		d8stg_fdivd;
wire		d8stg_hold;
wire		d8stg_step;
wire [1:0]	d1stg_rnd_mode;
wire [4:0]	d1stg_id;
wire		d1stg_sign1;
wire		d1stg_sign2;
wire		d1stg_sign;
wire		div_bkend_step;
wire [1:0]	div_rnd_mode;
wire [9:0]	div_id_out_in;
wire [9:0]	div_id_out;
wire		div_sign_out;
wire [5:0]	div_cnt_plus1;
wire [5:0]	div_cnt_in;
wire		div_cnt_step;
wire [5:0]	div_cnt;
wire		div_cnt_lt_step;
wire		divs_cnt_lt_23_in;
wire		divs_cnt_lt_23;
wire		divs_cnt_lt_23a;
wire		divd_cnt_lt_52_in;
wire		divd_cnt_lt_52;
wire		divd_cnt_lt_52a;
wire		div_exc_step;
wire		div_of_mask_in;
wire		div_of_mask;
wire		div_nv_out_in;
wire		div_nv_out;
wire		div_dz_out_in;
wire		div_dz_out;
wire		d7stg_in_of;
wire		div_of_out_tmp1_in;
wire		div_of_out_tmp1;
wire		div_of_out_tmp2;
wire		div_out_52_inv;
wire		div_of_out;
wire		div_uf_out_in;
wire		div_uf_out;
wire		div_nx_out_in;
wire		div_nx_out;
wire [4:0]	div_exc_out;
wire		d1stg_spc_rslt;
wire		div_norm_frac_in1_dbl_norm;
wire		div_norm_frac_in1_dbl_dnrm;
wire		div_norm_frac_in1_sng_norm;
wire		div_norm_frac_in1_sng_dnrm;
wire		div_norm_frac_in2_dbl_norm;
wire		div_norm_frac_in2_dbl_dnrm;
wire		div_norm_frac_in2_sng_norm;
wire		div_norm_frac_in2_sng_dnrm;
wire		div_norm_inf;
wire		div_norm_qnan;
wire		div_norm_zero;
wire		div_frac_add_in2_load;
wire		d6stg_frac_out_shl1;
wire		d6stg_frac_out_nosh;
wire		div_frac_add_in1_add;
wire		div_frac_add_in1_load;
wire		d7stg_lsb_in;
wire		d7stg_grd_in;
wire		d7stg_stk_in;
wire		d7stg_lsb;
wire		d7stg_grd;
wire		d7stg_stk;
wire		d7stg_rndup;
wire		d7stg_rndup_inv;
wire		d7stg_to_0;
wire		d7stg_to_0_inv;
wire		div_frac_out_add_in1;
wire		div_frac_out_add;
wire		div_frac_out_shl1_dbl;
wire		div_frac_out_shl1_sng;
wire		div_frac_out_of;
wire		div_frac_out_load;
wire		div_expadd1_in1_dbl_in;
wire		div_expadd1_in1_dbl;
wire		div_expadd1_in1_sng_in;
wire		div_expadd1_in1_sng;
wire		div_expadd1_in2_exp_in2_dbl;
wire		div_expadd1_in2_exp_in2_sng;
wire		div_exp1_expadd1;
wire		div_exp1_0835;
wire		div_exp1_0118;
wire		div_exp1_zero;
wire		d2stg_max_exp;
wire		d2stg_zero_exp;
wire		div_exp1_load;
wire		div_expadd2_in1_exp_out_in;
wire		div_expadd2_in1_exp_out;
wire		div_expadd2_no_decr_inv_in;
wire		div_expadd2_no_decr_load;
wire		div_expadd2_no_decr_inv;
wire		div_expadd2_cin;
wire		div_exp_out_zero;
wire		div_exp_out_expadd22_inv;
wire		div_exp_out_expadd2;
wire		div_exp_out_of;
wire		div_exp_out_exp_out;
wire		div_exp_out_load;
wire		div_pipe_active_in;
wire		div_pipe_active;

//Previously missing wires
wire        div_ctl_rst_l;

dffrl_async #(1)  dffrl_div_ctl (
  .din  (grst_l),
  .clk  (rclk),
  .rst_l(arst_l),
  .q    (div_ctl_rst_l),
	.se (se),
	.si (),
	.so ()
  );

assign reset= (!div_ctl_rst_l);

///////////////////////////////////////////////////////////////////////////////
//
//	Divide pipeline special input cases.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(1) i_div_frac_in1_51 (
	.din	(inq_in1_51),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_51),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_54 (
	.din	(inq_in1_54),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_54),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_53_0_neq_0 (
	.din	(inq_in1_53_0_neq_0),
	.en     (d1stg_step),
        .clk    (rclk),
 
        .q      (div_frac_in1_53_0_neq_0),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_frac_in1_50_0_neq_0 (
	.din	(inq_in1_50_0_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in1_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in1_53_32_neq_0 (
	.din	(inq_in1_53_32_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in1_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in1_exp_eq_0 (
        .din	(inq_in1_exp_eq_0),
        .en	(d1stg_step),
        .clk	(rclk),
 
        .q	(div_exp_in1_exp_eq_0),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_div_exp_in1_exp_neq_ffs (
	.din	(inq_in1_exp_neq_ffs),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_exp_in1_exp_neq_ffs),

   	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_51 (
	.din	(inq_in2_51),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_51),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_54 (
	.din	(inq_in2_54),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_54),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_53_0_neq_0 (
	.din	(inq_in2_53_0_neq_0),
	.en  	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_53_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_50_0_neq_0 (
	.din	(inq_in2_50_0_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_50_0_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_frac_in2_53_32_neq_0 (
	.din	(inq_in2_53_32_neq_0),
	.en	(d1stg_step),
	.clk	(rclk),

	.q	(div_frac_in2_53_32_neq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in2_exp_eq_0 (
	.din	(inq_in2_exp_eq_0),
	 .en	(d1stg_step),
	.clk	(rclk),

	.q	(div_exp_in2_exp_eq_0),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_exp_in2_exp_neq_ffs (
        .din	(inq_in2_exp_neq_ffs),
        .en	(d1stg_step),
        .clk	(rclk),
 
        .q	(div_exp_in2_exp_neq_ffs),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Denorm divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_denorm_sng_in1= div_exp_in1_exp_eq_0 && d1stg_sngopa[0];

assign d1stg_denorm_dbl_in1= div_exp_in1_exp_eq_0 && d1stg_dblopa[0];

assign d1stg_denorm_sng_in2= div_exp_in2_exp_eq_0 && d1stg_sngopa[0];

assign d1stg_denorm_dbl_in2= div_exp_in2_exp_eq_0 && d1stg_dblopa[0];

dff_s #(1) i_d2stg_denorm_sng_in2 (
	.din	(d1stg_denorm_sng_in2),
	.clk	(rclk),

	.q	(d2stg_denorm_sng_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_denorm_dbl_in2 (
	.din	(d1stg_denorm_dbl_in2),
	.clk	(rclk),

	.q	(d2stg_denorm_dbl_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Non-denorm divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_norm_sng_in1= (!div_exp_in1_exp_eq_0) && d1stg_sngopa[0];

assign d1stg_norm_dbl_in1= (!div_exp_in1_exp_eq_0) && d1stg_dblopa[0];

assign d1stg_norm_sng_in2= (!div_exp_in2_exp_eq_0) && d1stg_sngopa[0];

assign d1stg_norm_dbl_in2= (!div_exp_in2_exp_eq_0) && d1stg_dblopa[0];

dff_s #(1) i_d2stg_norm_sng_in2 (
	.din	(d1stg_norm_sng_in2),
	.clk	(rclk),

	.q	(d2stg_norm_sng_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_norm_dbl_in2 (
	.din	(d1stg_norm_dbl_in2),
	.clk	(rclk),

	.q	(d2stg_norm_dbl_in2),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Nan divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_snan_sng_in1= (!div_exp_in1_exp_neq_ffs) && (!div_frac_in1_54)
		&& div_frac_in1_53_32_neq_0 && d1stg_sngopa[1];

assign d1stg_snan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && (!div_frac_in1_51)
		&& div_frac_in1_50_0_neq_0 && d1stg_dblopa[1];

assign d1stg_snan_sng_in2= (!div_exp_in2_exp_neq_ffs) && (!div_frac_in2_54)
                && div_frac_in2_53_32_neq_0 && d1stg_sngopa[1];

assign d1stg_snan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && (!div_frac_in2_51)
                && div_frac_in2_50_0_neq_0 && d1stg_dblopa[1];

assign d1stg_qnan_sng_in1= (!div_exp_in1_exp_neq_ffs) && div_frac_in1_54
		&& d1stg_sngopa[1];

assign d1stg_qnan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && div_frac_in1_51
		&& d1stg_dblopa[1];

assign d1stg_qnan_sng_in2= (!div_exp_in2_exp_neq_ffs) && div_frac_in2_54
                && d1stg_sngopa[1];

assign d1stg_qnan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && div_frac_in2_51
                && d1stg_dblopa[1];

assign d1stg_snan_in1= d1stg_snan_sng_in1 || d1stg_snan_dbl_in1;

assign d1stg_snan_in2= d1stg_snan_sng_in2 || d1stg_snan_dbl_in2;

assign d1stg_qnan_in1= d1stg_qnan_sng_in1 || d1stg_qnan_dbl_in1;
 
assign d1stg_qnan_in2= d1stg_qnan_sng_in2 || d1stg_qnan_dbl_in2;

assign d1stg_nan_sng_in1= (!div_exp_in1_exp_neq_ffs)
		&& (div_frac_in1_54 || div_frac_in1_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_nan_dbl_in1= (!div_exp_in1_exp_neq_ffs)
		&& (div_frac_in1_51 || div_frac_in1_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_nan_sng_in2= (!div_exp_in2_exp_neq_ffs)
		&& (div_frac_in2_54 || div_frac_in2_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_nan_dbl_in2= (!div_exp_in2_exp_neq_ffs)
		&& (div_frac_in2_51 || div_frac_in2_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_nan_in1= d1stg_nan_sng_in1 || d1stg_nan_dbl_in1;

assign d1stg_nan_in2= d1stg_nan_sng_in2 || d1stg_nan_dbl_in2;

assign d1stg_nan_in= d1stg_nan_in1 || d1stg_nan_in2;

dff_s #(1) i_d2stg_snan_in1 (
	.din	(d1stg_snan_in1),
	.clk	(rclk),

	.q	(d2stg_snan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_snan_in2 (
	.din	(d1stg_snan_in2),
	.clk	(rclk),

	.q	(d2stg_snan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_qnan_in1 (
	.din	(d1stg_qnan_in1),
	.clk	(rclk),

	.q	(d2stg_qnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_qnan_in2 (
	.din	(d1stg_qnan_in2),
	.clk	(rclk),

	.q	(d2stg_qnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_nan_in2 (
	.din	(d1stg_nan_in2),
	.clk	(rclk),

	.q	(d2stg_nan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_nan_in (
	.din	(d1stg_nan_in),
	.clk	(rclk),

	.q	(d2stg_nan_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Infinity divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_inf_sng_in1= (!div_exp_in1_exp_neq_ffs)
		&& (!div_frac_in1_54) && (!div_frac_in1_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_inf_dbl_in1= (!div_exp_in1_exp_neq_ffs)
		&& (!div_frac_in1_51) && (!div_frac_in1_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_inf_sng_in2= (!div_exp_in2_exp_neq_ffs)
		&& (!div_frac_in2_54) && (!div_frac_in2_53_32_neq_0)
		&& d1stg_sngopa[2];

assign d1stg_inf_dbl_in2= (!div_exp_in2_exp_neq_ffs)
		&& (!div_frac_in2_51) && (!div_frac_in2_50_0_neq_0)
		&& d1stg_dblopa[2];

assign d1stg_inf_in1= d1stg_inf_sng_in1 || d1stg_inf_dbl_in1;

assign d1stg_inf_in2= d1stg_inf_sng_in2 || d1stg_inf_dbl_in2;

assign d1stg_inf_in= d1stg_inf_in1 || d1stg_inf_in2;

assign d1stg_2inf_in= d1stg_inf_in1 && d1stg_inf_in2;

dff_s #(1) i_d2stg_inf_in1 (
	.din	(d1stg_inf_in1),
	.clk	(rclk),

	.q	(d2stg_inf_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_inf_in2 (
	.din	(d1stg_inf_in2),
	.clk	(rclk),

	.q	(d2stg_inf_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_2inf_in (
	.din	(d1stg_2inf_in),
	.clk	(rclk),

	.q	(d2stg_2inf_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Infinity/Nan divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_infnan_sng_in1= (!div_exp_in1_exp_neq_ffs) && d1stg_sngopa[3];

assign d1stg_infnan_dbl_in1= (!div_exp_in1_exp_neq_ffs) && d1stg_dblopa[3];

assign d1stg_infnan_sng_in2= (!div_exp_in2_exp_neq_ffs) && d1stg_sngopa[3];

assign d1stg_infnan_dbl_in2= (!div_exp_in2_exp_neq_ffs) && d1stg_dblopa[3];

assign d1stg_infnan_in1= d1stg_infnan_sng_in1 || d1stg_infnan_dbl_in1;

assign d1stg_infnan_in2= d1stg_infnan_sng_in2 || d1stg_infnan_dbl_in2;

assign d1stg_infnan_in= d1stg_infnan_in1 || d1stg_infnan_in2;

dff_s #(1) i_d2stg_infnan_in1 (
	.din	(d1stg_infnan_in1),
	.clk	(rclk),

	.q	(d2stg_infnan_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_infnan_in2 (
	.din	(d1stg_infnan_in2),
	.clk	(rclk),

	.q	(d2stg_infnan_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_infnan_in (
	.din	(d1stg_infnan_in),
	.clk	(rclk),

	.q	(d2stg_infnan_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Zero divide inputs.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_zero_in1= div_exp_in1_exp_eq_0
		&& (!div_frac_in1_53_0_neq_0) && (!div_frac_in1_54);

assign d1stg_zero_in2= div_exp_in2_exp_eq_0
		&& (!div_frac_in2_53_0_neq_0) && (!div_frac_in2_54);

assign d1stg_zero_in= d1stg_zero_in1 || d1stg_zero_in2;
 
assign d1stg_2zero_in= d1stg_zero_in1 && d1stg_zero_in2;

dff_s #(1) i_d2stg_zero_in1 (
	.din	(d1stg_zero_in1),
	.clk	(rclk),

	.q	(d2stg_zero_in1),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_zero_in2 (
	.din	(d1stg_zero_in2),
	.clk	(rclk),

	.q	(d2stg_zero_in2),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_zero_in (
	.din	(d1stg_zero_in),
	.clk	(rclk),

	.q	(d2stg_zero_in),

	.se	(se),
	.si	(),
	.so	()
);

dff_s #(1) i_d2stg_2zero_in (
	.din	(d1stg_2zero_in),
	.clk	(rclk),

	.q	(d2stg_2zero_in),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Floating point divide control pipeline.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- divide pipeline input.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_hold= d1stg_div 
		|| d234stg_fdiv
		|| divs_cnt_lt_23
		|| divd_cnt_lt_52;

assign d1stg_holda= d1stg_div
        	|| d234stg_fdiv
        	|| divs_cnt_lt_23a
		|| divd_cnt_lt_52a;

assign d1stg_step= (!d1stg_hold);

assign d1stg_stepa= (!d1stg_holda);


assign d1stg_op_in[7:0]= ({8{d1stg_stepa}}
			    & (inq_op[7:0] & {8{inq_div}}));

dffr_s #(8) i_d1stg_op (
	.din	(d1stg_op_in[7:0]),
	.rst	(reset),
	.clk	(rclk),

	.q	(d1stg_op[7:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign d1stg_div_in= inq_div && d1stg_stepa;

dffr_s #(1) i_d1stg_div (
	.din	(d1stg_div_in),
	.rst	(reset),
        .clk	(rclk),
 
        .q	(d1stg_div),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(5) i_d1stg_sngopa (
        .din	({5{inq_op[0]}}),
        .en	(d1stg_stepa),
        .clk	(rclk),
 
        .q	(d1stg_sngopa[4:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(1) i_d1stg_dblop (
        .din    (inq_op[1]),
        .en     (d1stg_stepa),
        .clk    (rclk),
 
        .q      (d1stg_dblop),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_d1stg_dblopa (
        .din	({5{inq_op[1]}}),
        .en	(d1stg_stepa),
        .clk	(rclk),
 
        .q	(d1stg_dblopa[4:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode decode- divide stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_fdiv= (d1stg_op[7:0]==FDIVS) || (d1stg_op[7:0]==FDIVD);

assign d1stg_fdivs= (d1stg_op[7:0]==FDIVS);

assign d1stg_fdivd= (d1stg_op[7:0]==FDIVD);

assign d1stg_opdec[2:0]= {d1stg_fdiv,
			d1stg_fdivs,
			d1stg_fdivd};

assign d234stg_fdiv_in= d1stg_fdiv || d2stg_fdiv || d3stg_fdiv;

dffr_s #(3) i_d2stg_opdec (
	.din	(d1stg_opdec[2:0]),
	.rst	(reset),
	.clk	(rclk),

	.q	(d2stg_opdec[2:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffr_s #(1) i_d234stg_fdiv (
	.din	(d234stg_fdiv_in),
	.rst    (reset),
        .clk    (rclk),

	.q	(d234stg_fdiv),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Opcode pipeline- divide stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign d2stg_fdiv= d2stg_opdec[2];
assign d2stg_fdivs= d2stg_opdec[1];
assign d2stg_fdivd= d2stg_opdec[0];

dffr_s #(3) i_d3stg_opdec (
        .din    (d2stg_opdec[2:0]),
        .rst    (reset),
        .clk    (rclk),

        .q      (d3stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign d3stg_fdiv= d3stg_opdec[2];
//assign d3stg_fdivs= d3stg_opdec[1];
//assign d3stg_fdivd= d3stg_opdec[0];

dffr_s #(3) i_d4stg_opdec (
        .din    (d3stg_opdec[2:0]),
        .rst    (reset),
        .clk    (rclk),
 
        .q      (d4stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);
 

///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign d4stg_fdiv= d4stg_opdec[2];
assign d4stg_fdivs= d4stg_opdec[1];
assign d4stg_fdivd= d4stg_opdec[0];
 
assign d5stg_step= (!d5stg_fdiv) || d6stg_step;

dffre_s #(3) i_d5stg_opdec (
	.din	(d4stg_opdec[2:0]),
	.en	(d5stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q	(d5stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffre_s #(1) i_d5stg_fdiva (
	.din	(d4stg_fdiv),
	.en	(d5stg_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(d5stg_fdiva),

	.se	(se),
	.si	(),
	.so	()
);

assign d5stg_fdivb_in= ((d5stg_step && d4stg_fdiv)
			|| ((!d5stg_step) && d5stg_fdiv))
		&& (!reset);

dff_s #(1) i_d5stg_fdivb (
	.din	(d5stg_fdivb_in),
	.clk	(rclk),

	.q	(d5stg_fdivb),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign d5stg_fdiv= d5stg_opdec[2];
assign d5stg_fdivs= d5stg_opdec[1];
assign d5stg_fdivd= d5stg_opdec[0];

assign d6stg_step= (d5stg_fdivd && (div_cnt[5:0]==6'h36))
		|| (d5stg_fdivs && (div_cnt[5:0]==6'h19))
		|| (d5stg_fdiv && ((({7'b0, div_cnt[5:0]}==div_exp1[12:0])
					&& (div_exp1[12:0]!=13'b0))
				|| (({7'b0, div_cnt[5:0]}==div_exp1[12:0])
					&& (div_exp1[12:0]==13'b0)
					&& d8stg_step)
				|| (div_exp1[12] && d8stg_step)));

assign d6stg_opdec_in[2:0]= ({3{d6stg_step}}
			    & d5stg_opdec[2:0]);

dffr_s #(3) i_d6stg_opdec (
	.din	(d6stg_opdec_in[2:0]),
	.rst    (reset),
        .clk    (rclk),

        .q      (d6stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 6.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_fdiv= d6stg_opdec[2];
assign d6stg_fdivs= d6stg_opdec[1];
assign d6stg_fdivd= d6stg_opdec[0];

dffr_s #(3) i_d7stg_opdec (
        .din    (d6stg_opdec[2:0]),
	.rst    (reset),
        .clk    (rclk),

        .q      (d7stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide stage 7.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_fdiv= d7stg_opdec[2];
assign d7stg_fdivs= d7stg_opdec[1];
assign d7stg_fdivd= d7stg_opdec[0];

assign d8stg_fdiv_in= (d8stg_step && (!reset) && d7stg_fdiv)
                || ((!d8stg_step) && (!reset) && d8stg_fdiv);

dffre_s #(3) i_d8stg_opdec (
        .din    (d7stg_opdec[2:0]),
	.en	(d8stg_step),
	.rst    (reset),
        .clk    (rclk),

        .q      (d8stg_opdec[2:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Opcode pipeline- divide pipeline output.
//
///////////////////////////////////////////////////////////////////////////////

assign d8stg_fdiv= d8stg_opdec[2];
assign d8stg_fdivs= d8stg_opdec[1];
assign d8stg_fdivd= d8stg_opdec[0];

assign d8stg_hold= d8stg_fdiv && (!div_dest_rdy);

assign d8stg_step= (!d8stg_hold);

// Austin update
// Power management update

assign div_pipe_active_in =  // div pipe is executing a valid instr
   d1stg_fdiv || d2stg_fdiv || d3stg_fdiv || d4stg_fdiv |
   d5stg_fdiv || d6stg_fdiv || d7stg_fdiv || d8stg_fdiv ;

dffre_s #(1) i_div_pipe_active (
	.din	(div_pipe_active_in),
	.en     (1'b1),
        .rst    (reset),
        .clk    (rclk),

        .q      (div_pipe_active),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide information pipeline
//		- rounding mode
//		- ID
//		- sign logic
//	Front end of the pipeline.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(2) i_d1stg_rnd_mode (
	.din	(inq_rnd_mode[1:0]),
	.en	(d1stg_stepa),
	.clk	(rclk),

	.q	(d1stg_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(5) i_d1stg_id (
        .din    (inq_id[4:0]),
        .en     (d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_id[4:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d1stg_sign1 (
	.din	(inq_in1_63),
	.en	(d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_sign1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d1stg_sign2 (
        .din    (inq_in2_63),
        .en     (d1stg_stepa),
        .clk    (rclk),

        .q      (d1stg_sign2),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide information pipeline
//              - rounding mode
//              - ID
//              - sign logic
//      Back end of the pipeline.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_sign= ((d1stg_sign1
				&& (!d2stg_snan_in2)
				&& (!(d2stg_qnan_in2 && (!d2stg_snan_in1))))
			^ (d1stg_sign2
				&& (!(d2stg_snan_in1 && (!d2stg_snan_in2)))
				&& (!(d2stg_qnan_in1 && (!d2stg_nan_in2)))))
		&& (!(d2stg_2inf_in || d2stg_2zero_in));
 
assign div_bkend_step= (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step);

dffe_s #(2) i_div_rnd_mode (
	.din	(d1stg_rnd_mode[1:0]),
	.en	(div_bkend_step),
	.clk    (rclk),

        .q      (div_rnd_mode[1:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_id_out_in[9:0]= ({10{div_bkend_step}}
			    & {(d1stg_id[4:2]==3'o7),
				(d1stg_id[4:2]==3'o6),
				(d1stg_id[4:2]==3'o5),
				(d1stg_id[4:2]==3'o4),
				(d1stg_id[4:2]==3'o3),
				(d1stg_id[4:2]==3'o2),
				(d1stg_id[4:2]==3'o1),
				(d1stg_id[4:2]==3'o0),
				d1stg_id[1:0]})
		| ({10{(!div_bkend_step)}}
			    & div_id_out[9:0]);

dff_s #(10) i_div_id_out (
	.din	(div_id_out_in[9:0]),
	.clk    (rclk),
 
        .q      (div_id_out[9:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_sign_out (
	.din	(d1stg_sign),
	.en	(div_bkend_step),
	.clk    (rclk),
 
        .q      (div_sign_out),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide counter.
//
//	Tracks the number of subtraction iterations.
//
///////////////////////////////////////////////////////////////////////////////

assign div_cnt_plus1[5:0]= (div_cnt[5:0] + 6'h01);

assign div_cnt_in[5:0]= ({6{(d5stg_fdiv && d8stg_step)}}
			    & div_cnt_plus1[5:0])
		| ({6{d4stg_fdiv}}
			    & 6'b0);

assign div_cnt_step= (d5stg_fdiv && d8stg_step)
		|| d4stg_fdiv;

dffre_s #(6) i_div_cnt (
	.din	(div_cnt_in[5:0]),
	.en	(div_cnt_step),
	.rst	(reset),
	.clk    (rclk),
 
        .q      (div_cnt[5:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_cnt_lt_step= (!d5stg_fdiv) || d6stg_step || d8stg_step;

assign divs_cnt_lt_23_in= d4stg_fdivs
		|| (d5stg_fdivs && (!d6stg_step) && (div_cnt_plus1[5:0]<6'h17));

dffre_s #(1) i_divs_cnt_lt_23 (
	.din	(divs_cnt_lt_23_in),
	.en	(div_cnt_lt_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(divs_cnt_lt_23),
 
        .se	(se),
        .si	(),
        .so	()
);

dffre_s #(1) i_divs_cnt_lt_23a (
        .din	(divs_cnt_lt_23_in),
        .en	(div_cnt_lt_step),
        .rst	(reset),
        .clk	(rclk),
 
        .q	(divs_cnt_lt_23a),
 
        .se	(se),
        .si	(),
        .so	()
);

assign divd_cnt_lt_52_in= d4stg_fdivd
		|| (d5stg_fdivd && (!d6stg_step) && (div_cnt_plus1[5:0]<6'h34));

dffre_s #(1) i_divd_cnt_lt_52 (
	.din	(divd_cnt_lt_52_in),
	.en	(div_cnt_lt_step),
	.rst	(reset),
	.clk	(rclk),

	.q	(divd_cnt_lt_52),
 
        .se	(se),
        .si	(),
        .so	()
);

dffre_s #(1) i_divd_cnt_lt_52a (
        .din	(divd_cnt_lt_52_in),
        .en	(div_cnt_lt_step),
        .rst	(reset),
        .clk	(rclk),
 
        .q	(divd_cnt_lt_52a),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exception logic.
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
//
//	Divide overflow exception enabled.
//
///////////////////////////////////////////////////////////////////////////////

assign div_exc_step= d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step;

assign div_of_mask_in= (!(d1stg_infnan_in || d1stg_zero_in));

dffe_s #(1) i_div_of_mask (
	.din	(div_of_mask_in),
	.en	(div_exc_step),
	.clk    (rclk),

        .q      (div_of_mask),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide invalid exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_nv_out_in= d1stg_snan_in1 || d1stg_snan_in2 || d1stg_2inf_in
		|| d1stg_2zero_in;

dffe_s #(1) i_div_nv_out (
	.din	(div_nv_out_in),
	.en	(div_exc_step),
	.clk    (rclk),

        .q      (div_nv_out),

	.se     (se),
        .si     (),
        .so     ()
);

///////////////////////////////////////////////////////////////////////////////
//
//      Divide by zero exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_dz_out_in= d1stg_zero_in2 && (!d1stg_zero_in1)
		&& (!d1stg_infnan_in1);

dffe_s #(1) i_div_dz_out (
        .din    (div_dz_out_in),
        .en     (div_exc_step),
        .clk    (rclk),
 
        .q      (div_dz_out),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide overflow exception.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_in_of= ((!div_exp_out[12])
			&& d7stg_fdivd
			&& (div_exp_out[11] || (&div_exp_out[10:0]))
			&& div_of_mask)
		|| ((!div_exp_out[12])
			&& d7stg_fdivs
			&& ((|div_exp_out[11:8]) || (&div_exp_out[7:0]))
			&& div_of_mask);

assign div_of_out_tmp1_in= ((!div_exp_out[12])
			&& d7stg_fdivd
			&& (&div_exp_out[10:1])
			&& d7stg_rndup
			&& div_of_mask)
		|| ((!div_exp_out[12])
	                && d7stg_fdivs
			&& (&div_exp_out[7:1])
	                && d7stg_rndup
	                && div_of_mask);

dffe_s #(1) i_div_of_out_tmp1 (
	.din	(div_of_out_tmp1_in),
	.en	(d7stg_fdiv),
	.clk    (rclk),

        .q      (div_of_out_tmp1),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_div_of_out_tmp2 (
	.din	(d7stg_in_of),
	.en	(d7stg_fdiv),
	.clk	(rclk),

	.q	(div_of_out_tmp2),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(1) i_div_out_52_inv (
	.din	(div_frac_add_52_inva),
	.en	(d7stg_fdiv),
        .clk	(rclk),
 
        .q	(div_out_52_inv),

// Austin update
// include se pin
	.se	(se),
	.si	(),
        .so	()
);

assign div_of_out= div_of_out_tmp2
		|| (div_of_out_tmp1 && (!div_out_52_inv));


///////////////////////////////////////////////////////////////////////////////
//
//      Divide underflow exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_uf_out_in= ((!(|div_exp_out[11:0]))
			&& (div_frac_add_in1_neq_0
				|| d7stg_grd
				|| d7stg_stk)
			&& div_of_mask)
		|| (div_exp_out[12]
			&& div_of_mask);

dffe_s #(1) i_div_uf_out (
        .din    (div_uf_out_in),
        .en     (d7stg_fdiv),
        .clk    (rclk),
 
        .q      (div_uf_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide inexact exception.
//
///////////////////////////////////////////////////////////////////////////////

assign div_nx_out_in= d7stg_grd || d7stg_stk;

dffe_s #(1) i_div_nx_out (
        .din    (div_nx_out_in),
        .en     (d7stg_fdiv),
        .clk    (rclk),

        .q      (div_nx_out),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exception output.
//
///////////////////////////////////////////////////////////////////////////////

// Austin update
// Overflow is always accompanied by inexact.
// Previously this was handled within the FFU.

// assign div_exc_out[4:0]= {div_nv_out, div_of_out, div_uf_out, div_dz_out,
//				div_nx_out};

assign div_exc_out[4:0] =
  {div_nv_out,
   div_of_out,
   div_uf_out,
   div_dz_out,
   (div_nx_out || div_of_out)};  // Overflow is always accompanied by inexact


///////////////////////////////////////////////////////////////////////////////
//
//      Divide pipeline control logic.
//
///////////////////////////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////////////////////
//
//	Select lines- divide normalization and special input injection.
//
///////////////////////////////////////////////////////////////////////////////

assign d1stg_spc_rslt= (d1stg_inf_in || d1stg_zero_in) && (!d1stg_nan_in);

assign div_norm_frac_in1_dbl_norm= d1stg_fdiv && d1stg_norm_dbl_in1
		&& (!d1stg_snan_dbl_in2)
		&& ((!d1stg_qnan_dbl_in2) || d1stg_snan_dbl_in1)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_dbl_dnrm= d1stg_fdiv && d1stg_denorm_dbl_in1
		&& (!d1stg_snan_dbl_in2)
		&& (!d1stg_qnan_dbl_in2)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_sng_norm= d1stg_fdiv && d1stg_norm_sng_in1
		&& (!d1stg_snan_sng_in2)
		&& ((!d1stg_qnan_sng_in2) || d1stg_snan_sng_in1)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in1_sng_dnrm= d1stg_fdiv && d1stg_denorm_sng_in1
		&& (!d1stg_snan_sng_in2)
		&& (!d1stg_qnan_sng_in2)
		&& (!d1stg_spc_rslt);

assign div_norm_frac_in2_dbl_norm= (d2stg_fdiv && d2stg_norm_dbl_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| (d1stg_fdiv && d1stg_snan_dbl_in2)
		|| (d1stg_fdiv && d1stg_qnan_dbl_in2 && (!d1stg_snan_dbl_in1));

assign div_norm_frac_in2_dbl_dnrm= d2stg_fdiv && d2stg_denorm_dbl_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in);

assign div_norm_frac_in2_sng_norm= (d2stg_fdiv && d2stg_norm_sng_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| (d1stg_fdiv && d1stg_snan_sng_in2)
		|| (d1stg_fdiv && d1stg_qnan_sng_in2 && (!d1stg_snan_sng_in1));

assign div_norm_frac_in2_sng_dnrm= d2stg_fdiv && d2stg_denorm_sng_in2
			&& (!d2stg_infnan_in) && (!d2stg_zero_in);

assign div_norm_inf= (d2stg_fdiv && (d2stg_infnan_in || d2stg_zero_in))
		|| (d1stg_fdiv && ((d1stg_inf_in1 && (!d1stg_infnan_in2))
				|| (d1stg_zero_in2 && (!d1stg_infnan_in1)
					&& (!d1stg_zero_in1))));

assign div_norm_qnan= d1stg_fdiv && (d1stg_2inf_in || d1stg_2zero_in);

assign div_norm_zero= d1stg_fdiv
		&& ((d1stg_inf_in2 && (!d1stg_infnan_in1))
			|| (d1stg_zero_in1 && (!d1stg_infnan_in2)
				&& (!d1stg_zero_in2)));


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide left shift.
//
///////////////////////////////////////////////////////////////////////////////

assign div_frac_add_in2_load= d4stg_fdiv || d6stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide adder/subtractor 2nd input.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_frac_out_shl1= (!div_frac_out_54) && (!div_exp_out[12])
		&& (div_exp_out[11:1]!=11'b0);

assign d6stg_frac_out_nosh= (!d6stg_frac_out_shl1);

assign div_frac_add_in1_add= d5stg_fdiv && (!div_exp1[12]) && d8stg_step;

assign div_frac_add_in1_load= d4stg_fdiv
		|| (d5stg_fdiv && (!div_exp1[12]) && d8stg_step)
		|| d6stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//	Divide rounding bits.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_lsb_in= (d6stg_fdivd && d6stg_frac_2)
		|| ((!d6stg_fdivd) && d6stg_frac_31);

assign d7stg_grd_in= (d6stg_fdivd && d6stg_frac_1)
		|| ((!d6stg_fdivd) && d6stg_frac_30);

assign d7stg_stk_in= (d6stg_fdivd && d6stg_frac_0)
		|| ((!d6stg_fdivd) && d6stg_frac_29)
		|| div_frac_add_in1_neq_0;

dffe_s #(1) i_d7stg_lsb (
	.din	(d7stg_lsb_in),
	.en	(d6stg_fdiv),
	.clk    (rclk),

        .q      (d7stg_lsb),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d7stg_grd (
        .din    (d7stg_grd_in),
        .en     (d6stg_fdiv),
        .clk    (rclk),
 
        .q      (d7stg_grd),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(1) i_d7stg_stk (
        .din    (d7stg_stk_in),
        .en     (d6stg_fdiv),
        .clk    (rclk),
 
        .q      (d7stg_stk),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Select lines- divide adder/subtractor and fraction output register.
//
///////////////////////////////////////////////////////////////////////////////

assign d7stg_rndup= ((div_rnd_mode[1:0]==2'b10) && (!div_sign_out)
			&& (d7stg_grd || d7stg_stk))
		|| ((div_rnd_mode[1:0]==2'b11) && div_sign_out
			&& (d7stg_grd || d7stg_stk))
		|| ((div_rnd_mode[1:0]==2'b00)
			&& ((d7stg_grd && d7stg_stk)
				|| (d7stg_grd && (!d7stg_stk) && d7stg_lsb)));

assign d7stg_rndup_inv= (!d7stg_rndup);

assign d7stg_to_0= (div_rnd_mode[1:0]==2'b01)
		|| ((div_rnd_mode[1:0]==2'b10) && div_sign_out)
		|| ((div_rnd_mode[1:0]==2'b11) && (!div_sign_out));

assign d7stg_to_0_inv= (!d7stg_to_0);

assign div_frac_out_add_in1= d7stg_fdiv && (!d7stg_rndup) && (!d7stg_in_of);

assign div_frac_out_add= d7stg_fdiv && d7stg_rndup && (!d7stg_in_of);

assign div_frac_out_shl1_dbl= d5stg_fdivd && (!div_exp1[12]) && d8stg_step;

assign div_frac_out_shl1_sng= d5stg_fdivs && (!div_exp1[12]) && d8stg_step;

assign div_frac_out_of= d7stg_fdiv && d7stg_in_of;

assign div_frac_out_load= d4stg_fdiv
		|| d7stg_fdiv
		|| div_frac_out_shl1_dbl
		|| div_frac_out_shl1_sng;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide exponent adder in the front end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd1_in1_dbl_in= ((d1stg_stepa && inq_op[1])
			|| ((!d1stg_stepa) && d1stg_dblopa[4]))
		&& (!((d1stg_fdiv || d2stg_fdiv || d3stg_fdiv) && (!reset)));

dff_s #(1) i_div_expadd1_in1_dbl (
	.din	(div_expadd1_in1_dbl_in),
        .clk    (rclk),

	.q	(div_expadd1_in1_dbl),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_expadd1_in1_sng_in= ((d1stg_stepa && inq_op[0])
			|| ((!d1stg_stepa) && d1stg_sngopa[4]))
		&& (!((d1stg_fdiv || d2stg_fdiv || d3stg_fdiv) && (!reset)));

dff_s #(1) i_div_expadd1_in1_sng (
	.din	(div_expadd1_in1_sng_in),
	.clk	(rclk),

	.q	(div_expadd1_in1_sng),

	.se	(se),
	.si	(),
	.so	()
);

assign div_expadd1_in2_exp_in2_dbl= d2stg_fdivd;

assign div_expadd1_in2_exp_in2_sng= d2stg_fdivs;

assign div_exp1_expadd1= d1stg_fdiv
		|| (d2stg_fdiv && (!d2stg_infnan_in) && (!d2stg_zero_in))
		|| d3stg_fdiv
		|| d4stg_fdiv;

assign div_exp1_0835= d2stg_fdivd && d2stg_max_exp;

assign div_exp1_0118= d2stg_fdivs && d2stg_max_exp;

assign div_exp1_zero= d2stg_fdiv && d2stg_zero_exp;

assign d2stg_max_exp= d2stg_nan_in || d2stg_inf_in1 || d2stg_zero_in2;

assign d2stg_zero_exp= (d2stg_inf_in2 && (!d2stg_infnan_in1))
		|| (d2stg_zero_in1 && (!d2stg_infnan_in2) && (!d2stg_zero_in2));

assign div_exp1_load= d1stg_fdiv || d2stg_fdiv || d3stg_fdiv || d4stg_fdiv;


///////////////////////////////////////////////////////////////////////////////
//
//      Select lines- divide exponent adder in the back end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd2_in1_exp_out_in= d6stg_opdec_in[2] || d6stg_fdiv;

dffr_s #(1) i_div_expadd2_in1_exp_out (
	.din	(div_expadd2_in1_exp_out_in),
	.rst	(reset),
	.clk	(rclk),

	.q	(div_expadd2_in1_exp_out),

	.se	(se),
	.si	(),
	.so	()
);

assign div_expadd2_no_decr_inv_in= (!(div_frac_out_53
		|| (div_exp1[11:0]==(({12{(!d5stg_fdivs)}} & 12'h035)
					| ({12{d5stg_fdivs}} & 12'h018)))
		|| div_expadd2_12));

assign div_expadd2_no_decr_load= d5stg_fdiv && d8stg_step;

dffe_s #(1) i_div_expadd2_no_decr_inv (
	.din	(div_expadd2_no_decr_inv_in),
	.en	(div_expadd2_no_decr_load),
	.clk	(rclk),

	.q	(div_expadd2_no_decr_inv),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_expadd2_cin= d5stg_fdiv || d7stg_fdiv;

assign div_exp_out_zero= d7stg_fdiv && div_exp_out[12];

assign div_exp_out_expadd22_inv= (!(d6stg_fdiv
			|| (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)));

assign div_exp_out_expadd2= ((d7stg_fdiv && d7stg_rndup && (!d7stg_in_of))
			|| (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)
			|| d6stg_fdiv)
		&& (!div_exp_out_zero);

assign div_exp_out_of= d7stg_fdiv && d7stg_in_of;

assign div_exp_out_exp_out= d7stg_fdiv
		&& (!d7stg_in_of)
		&& (!div_exp_out_zero);

assign div_exp_out_load= (d5stg_fdiv && (div_cnt[5:0]==6'b0) && d8stg_step)
		|| d6stg_fdiv
		|| d7stg_fdiv;


endmodule


