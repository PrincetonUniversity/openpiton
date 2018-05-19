// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_out_dp.v
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
//      FPU output datapath.
//
///////////////////////////////////////////////////////////////////////////////
 

module fpu_out_dp (
	dest_rdy,
	req_thread,
	div_exc_out,
	d8stg_fdivd,
	d8stg_fdivs,
	div_sign_out,
	div_exp_out,
	div_frac_out,
	mul_exc_out,
	m6stg_fmul_dbl_dst,
	m6stg_fmuls,
	mul_sign_out,
	mul_exp_out,
	mul_frac_out,
	add_exc_out,
	a6stg_fcmpop,
	add_cc_out,
	add_fcc_out,
	a6stg_dbl_dst,
	a6stg_sng_dst,
	a6stg_long_dst,
	a6stg_int_dst,
	add_sign_out,
	add_exp_out,
	add_frac_out,
	rclk,
	
	fp_cpx_data_ca,

	se,
	si,
	so
);


input [2:0]	dest_rdy;		// pipe with result request this cycle
input [1:0]	req_thread;		// thread ID of result req this cycle
input [4:0]	div_exc_out;		// divide pipe result- exception flags
input		d8stg_fdivd;		// divide double- divide stage 8
input		d8stg_fdivs;		// divide single- divide stage 8
input		div_sign_out;		// divide sign output
input [10:0]	div_exp_out;		// divide exponent output
input [51:0]	div_frac_out;		// divide fraction output
input [4:0]	mul_exc_out;		// multiply pipe result- exception flags
input		m6stg_fmul_dbl_dst;	// double precision multiply result
input		m6stg_fmuls;		// fmuls- multiply 6 stage
input		mul_sign_out;		// multiply sign output
input [10:0]	mul_exp_out;		// multiply exponent output
input [51:0]	mul_frac_out;		// multiply fraction output
input [4:0]	add_exc_out;		// add pipe result- exception flags
input		a6stg_fcmpop;		// compare- add 6 stage
input [1:0]	add_cc_out;		// add pipe result- condition
input [1:0]	add_fcc_out;		// add pipe input fcc passed through
input		a6stg_dbl_dst;		// float double result- add 6 stage
input		a6stg_sng_dst;		// float single result- add 6 stage
input		a6stg_long_dst;		// 64bit integer result- add 6 stage
input		a6stg_int_dst;		// 32bit integer result- add 6 stage
input		add_sign_out;		// add sign output
input [10:0]	add_exp_out;		// add exponent output
input [63:0]	add_frac_out;		// add fraction output
input		rclk;		// global clock

output [144:0]	fp_cpx_data_ca;		// FPU result to CPX

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [63:0]	add_out;
wire [63:0]	mul_out;
wire [63:0]	div_out;
wire [7:0]	fp_cpx_data_ca_84_77_in;
wire [76:0]	fp_cpx_data_ca_76_0_in;
wire [7:0]	fp_cpx_data_ca_84_77;
wire [76:0]	fp_cpx_data_ca_76_0;
wire [144:0]	fp_cpx_data_ca;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;

clken_buf  ckbuf_out_dp (
  .clk(clk),
  .rclk(rclk),
  .enb_l(1'b0),
  .tmb_l(se_l)
  );

///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe output.
//
///////////////////////////////////////////////////////////////////////////////

assign add_out[63:0]= ({64{a6stg_dbl_dst}}
			    & {add_sign_out, add_exp_out[10:0],
				add_frac_out[62:11]})
		| ({64{a6stg_sng_dst}}
			    & {add_sign_out, add_exp_out[7:0],
				add_frac_out[62:40], 32'b0})
		| ({64{a6stg_long_dst}}
			    & add_frac_out[63:0])
		| ({64{a6stg_int_dst}}
			    & {add_frac_out[63:32], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply output.
//
///////////////////////////////////////////////////////////////////////////////

assign mul_out[63:0]= ({64{m6stg_fmul_dbl_dst}}
			    & {mul_sign_out, mul_exp_out[10:0],
				mul_frac_out[51:0]})
		| ({64{m6stg_fmuls}}
			    & {mul_sign_out, mul_exp_out[7:0],
				mul_frac_out[51:29], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Divide output.
//
///////////////////////////////////////////////////////////////////////////////

assign div_out[63:0]= ({64{d8stg_fdivd}}
			    & {div_sign_out, div_exp_out[10:0],
				div_frac_out[51:0]})
		| ({64{d8stg_fdivs}}
			    & {div_sign_out, div_exp_out[7:0],
				div_frac_out[51:29], 32'b0});


///////////////////////////////////////////////////////////////////////////////
//
//	Choose the output data.
//
//	Input to the CPX data (CA) stage.
//
///////////////////////////////////////////////////////////////////////////////

assign fp_cpx_data_ca_84_77_in[7:0]= ({8{(|dest_rdy)}}
			    & {1'b1, 4'b1000, 1'b0, req_thread[1:0]});

assign fp_cpx_data_ca_76_0_in[76:0]= ({77{dest_rdy[2]}}
			    & {div_exc_out[4:0], 8'b0, div_out[63:0]})
		| ({77{dest_rdy[1]}}
			    & {mul_exc_out[4:0], 8'b0, mul_out[63:0]})
		| ({77{dest_rdy[0]}}
			    & {add_exc_out[4:0], 2'b0, a6stg_fcmpop,
				add_cc_out[1:0], add_fcc_out[1:0], 1'b0,
				add_out[63:0]});

dff_s #(8) i_fp_cpx_data_ca_84_77 (
	.din	(fp_cpx_data_ca_84_77_in[7:0]),
	.clk    (clk),

        .q      (fp_cpx_data_ca_84_77[7:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dff_s #(77) i_fp_cpx_data_ca_76_0 (
	.din	(fp_cpx_data_ca_76_0_in[76:0]),
	.clk    (clk),

        .q      (fp_cpx_data_ca_76_0[76:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign fp_cpx_data_ca[144:0]= {fp_cpx_data_ca_84_77[7:3],
				3'b0,
				fp_cpx_data_ca_84_77[2:0],
				57'b0,
				fp_cpx_data_ca_76_0[76:0]};


endmodule


