// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: fpu.v
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
//	Floating Point Unit.
//
///////////////////////////////////////////////////////////////////////////////

module fpu (
	pcx_fpio_data_rdy_px2,
	pcx_fpio_data_px2,
	arst_l,
	grst_l,
	gclk,
	cluster_cken,

	fp_cpx_req_cq,
	fp_cpx_data_ca,

	ctu_tst_pre_grst_l,
	global_shift_enable,
	ctu_tst_scan_disable,
	ctu_tst_scanmode,
	ctu_tst_macrotest,
	ctu_tst_short_chain,

	si,
	so
);


input		pcx_fpio_data_rdy_px2;	// FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX
input		arst_l;			// chip async. reset- asserted low
input		grst_l;			// chip sync. reset- asserted low
input		gclk;			// chip clock
input		cluster_cken;			// cluster clock enable

output [7:0]	fp_cpx_req_cq;		// FPU result request to CPX
output [144:0]	fp_cpx_data_ca;		// FPU result to CPX

input						ctu_tst_pre_grst_l;
input						global_shift_enable;
input						ctu_tst_scan_disable;
input						ctu_tst_scanmode;
input 					ctu_tst_macrotest;
input 					ctu_tst_short_chain;
input           si;                     // scan in
output          so;                     // scan out


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in.
//
///////////////////////////////////////////////////////////////////////////////

wire		inq_add;		// add pipe request
wire		inq_mul;		// multiply pipe request
wire		inq_div;		// divide pipe request
wire [4:0]	inq_id;			// request ID to the operation pipes
wire [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
wire [1:0]	inq_fcc;		// request cc ID to op pipes
wire [7:0]	inq_op;			// request opcode to op pipes
wire		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
wire		inq_in1_exp_eq_0;	// request operand 1 exp==0
wire		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
wire		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
wire		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
wire [63:0]	inq_in1;		// request operand 1 to op pipes
wire		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
wire		inq_in2_exp_eq_0;	// request operand 2 exp==0
wire		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
wire		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
wire		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
wire [63:0]	inq_in2;		// request operand 2 to op pipes
wire  		fadd_clken_l;		// add      pipe clk enable - asserted low
wire 		fmul_clken_l;		// multiply pipe clk enable - asserted low
wire 		fdiv_clken_l;		// divide   pipe clk enable - asserted low

// 6/20/03: New outputs of fpu_in for fpu-level i_fpu_inq_sram

wire [4:0] fp_id_in; // id to be written into inq_sram
wire [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
wire [1:0] fp_fcc_in; // fcc to be written into inq_sram
wire [7:0] fp_op_in; // op field to be written into inq_sram
wire [68:0] fp_src1_in; // operand1, includes pre-computed bits matching special values, such as exp all ffs
wire [68:0] fp_src2_in; // operand2, includes pre-computed bits matching special values, such as exp all ffs
wire [3:0] inq_rdaddr; // read address for inq_sram
wire [3:0] inq_wraddr; // write address for inq_sram
wire inq_read_en; // read enable for inq_sram
wire inq_we; // write enable for inq_sram


///////////////////////////////////////////////////////////////////////////////
//
// Outputs of i_fpu_inq_sram
//
///////////////////////////////////////////////////////////////////////////////

wire [154:0] inq_dout; // fpu op packet read out from inq_sram
wire [4:0] inq_dout_unused; // unused bits from sram


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_add.
//
///////////////////////////////////////////////////////////////////////////////

wire		a1stg_step;		// add pipe load
wire		a6stg_fadd_in;		// add pipe output request next cycle
wire [9:0]	add_id_out_in;		// add pipe output ID next cycle
wire		a6stg_fcmpop;		// compare- add 6 stage
wire [4:0]	add_exc_out;		// add pipe result- exception flags
wire		a6stg_dbl_dst;		// float double result- add 6 stage
wire		a6stg_sng_dst;		// float single result- add 6 stage
wire		a6stg_long_dst;		// 64bit integer result- add 6 stage
wire		a6stg_int_dst;		// 32bit integer result- add 6 stage
wire		add_sign_out;		// add sign output
wire [10:0]	add_exp_out;		// add exponent output
wire [63:0]	add_frac_out;		// add fraction output
wire [1:0]	add_cc_out;		// add pipe result- condition
wire [1:0]	add_fcc_out;		// add pipe input fcc passed through
wire		add_pipe_active;        // add pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_mul.
//
///////////////////////////////////////////////////////////////////////////////

wire		m1stg_step;		// multiply pipe load
wire		m6stg_fmul_in;		// mul pipe output request next cycle
wire [9:0]	m6stg_id_in;		// mul pipe output ID next cycle
wire [4:0]	mul_exc_out;		// multiply pipe result- exception flags
wire		m6stg_fmul_dbl_dst;	// double precision multiply result
wire		m6stg_fmuls;		// fmuls- multiply 6 stage
wire		mul_sign_out;		// multiply sign output
wire [10:0]	mul_exp_out;		// multiply exponent output
wire [51:0]	mul_frac_out;		// multiply fraction output
wire		mul_pipe_active;        // mul pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_div.
//
///////////////////////////////////////////////////////////////////////////////

wire		d1stg_step;		// divide pipe load
wire		d8stg_fdiv_in;		// div pipe output request next cycle
wire [9:0]	div_id_out_in;		// div pipe output ID next cycle
wire [4:0]	div_exc_out;		// divide pipe result- exception flags
wire		d8stg_fdivd;		// divide double- divide stage 8
wire		d8stg_fdivs;		// divide single- divide stage 8
wire		div_sign_out;		// divide sign output
wire [10:0]	div_exp_out;		// divide exponent output
wire [51:0]	div_frac_out;		// divide fraction output
wire		div_pipe_active;        // div pipe is executing a valid instr


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_out.
//
///////////////////////////////////////////////////////////////////////////////

wire [7:0]	fp_cpx_req_cq_unbuf;		// FPU result request to CPX
wire		add_dest_rdy;		// add pipe result request this cycle
wire		mul_dest_rdy;		// mul pipe result request this cycle
wire		div_dest_rdy;		// div pipe result request this cycle
wire [144:0]	fp_cpx_data_ca_unbuf;		// FPU result to CPX


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of cluster_header, test_stub.
//
///////////////////////////////////////////////////////////////////////////////

wire rclk; // ref. clock

wire		sehold; // scan in data hold

wire fpu_grst_l;

///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_rptr_groups.
//
///////////////////////////////////////////////////////////////////////////////

wire [63:0] inq_in1_add_buf1;
wire [63:0] inq_in1_mul_buf1;
wire [63:0] inq_in1_div_buf1;
wire [63:0] inq_in2_add_buf1;
wire [63:0] inq_in2_mul_buf1;
wire [63:0] inq_in2_div_buf1;
wire [4:0] inq_id_add_buf1;
wire [4:0] inq_id_mul_buf1;
wire [4:0] inq_id_div_buf1;
wire [7:0] inq_op_add_buf1;
wire [7:0] inq_op_mul_buf1;
wire [7:0] inq_op_div_buf1;
wire [1:0] inq_rnd_mode_add_buf1;
wire [1:0] inq_rnd_mode_mul_buf1;
wire [1:0] inq_rnd_mode_div_buf1;
wire inq_in1_50_0_neq_0_add_buf1;
wire inq_in1_50_0_neq_0_mul_buf1;
wire inq_in1_50_0_neq_0_div_buf1;
wire inq_in1_53_0_neq_0_add_buf1;
wire inq_in1_53_0_neq_0_mul_buf1;
wire inq_in1_53_0_neq_0_div_buf1;
wire inq_in1_53_32_neq_0_add_buf1;
wire inq_in1_53_32_neq_0_mul_buf1;
wire inq_in1_53_32_neq_0_div_buf1;
wire inq_in1_exp_eq_0_add_buf1;
wire inq_in1_exp_eq_0_mul_buf1;
wire inq_in1_exp_eq_0_div_buf1;
wire inq_in1_exp_neq_ffs_add_buf1;
wire inq_in1_exp_neq_ffs_mul_buf1;
wire inq_in1_exp_neq_ffs_div_buf1;
wire inq_in2_50_0_neq_0_add_buf1;
wire inq_in2_50_0_neq_0_mul_buf1;
wire inq_in2_50_0_neq_0_div_buf1;
wire inq_in2_53_0_neq_0_add_buf1;
wire inq_in2_53_0_neq_0_mul_buf1;
wire inq_in2_53_0_neq_0_div_buf1;
wire inq_in2_53_32_neq_0_add_buf1;
wire inq_in2_53_32_neq_0_mul_buf1;
wire inq_in2_53_32_neq_0_div_buf1;
wire inq_in2_exp_eq_0_add_buf1;
wire inq_in2_exp_eq_0_mul_buf1;
wire inq_in2_exp_eq_0_div_buf1;
wire inq_in2_exp_neq_ffs_add_buf1;
wire inq_in2_exp_neq_ffs_mul_buf1;
wire inq_in2_exp_neq_ffs_div_buf1;

wire [123:0] pcx_fpio_data_px2_buf1;
wire [155:0] inq_sram_din_buf1;

// Previously missing wire declarations:
wire         pcx_fpio_data_rdy_px2_buf1;
wire         arst_l_in_buf3;
wire         fpu_grst_l_in_buf2;
wire         se_in_buf3;
wire         manual_scan_0;
wire         scan_manual_1;
wire         se;
wire         si_buf1;
wire         scan_inq_sram_w;
wire         rst_tri_en;
wire         arst_l_add_buf4;
wire         fpu_grst_l_add_buf3;
wire         se_add_exp_buf2;
wire         se_add_frac_buf2;
wire         scan_manual_2;
wire         fmul_clken_l_buf1;
wire         arst_l_mul_buf2;
wire         fpu_grst_l_mul_buf1;
wire         se_mul_buf4;
wire         se_mul64_buf2;
wire         scan_manual_3;
wire         fdiv_clken_l_div_frac_buf1;
wire         fdiv_clken_l_div_exp_buf1;
wire         arst_l_div_buf2;
wire         se_div_buf5;
wire         scan_manual_4;
wire         arst_l_out_buf3;
wire         se_out_buf2;
wire         scan_manual_5;
wire         ctu_tst_pre_grst_l_buf1;
wire         global_shift_enable_buf1;
wire         ctu_tst_scan_disable_buf1;
wire         ctu_tst_scanmode_buf1;
wire         ctu_tst_macrotest_buf1;
wire         ctu_tst_short_chain_buf1;
wire         scan_manual_6_buf1;
wire         so_unbuf;
wire         scan_manual_6;
wire         grst_l_buf1;
wire         cluster_cken_buf1;
wire         se_cluster_header_buf2;
wire         arst_l_cluster_header_buf2;


///////////////////////////////////////////////////////////////////////////////
//
//      Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in fpu_in (
	.pcx_fpio_data_rdy_px2		(pcx_fpio_data_rdy_px2_buf1),
	.pcx_fpio_data_px2		(pcx_fpio_data_px2_buf1[123:0]),
	.a1stg_step			(a1stg_step),
	.m1stg_step			(m1stg_step),
	.d1stg_step			(d1stg_step),
	.add_pipe_active		(add_pipe_active),
	.mul_pipe_active		(mul_pipe_active),
	.div_pipe_active		(div_pipe_active),
	.inq_dout    (inq_dout[154:0]),
	.sehold (sehold),
	.arst_l				(arst_l_in_buf3),
	.grst_l				(fpu_grst_l_in_buf2),
	.rclk				(rclk),

	.fadd_clken_l			(fadd_clken_l),
	.fmul_clken_l			(fmul_clken_l),
	.fdiv_clken_l			(fdiv_clken_l),

	.inq_add			(inq_add),
	.inq_mul			(inq_mul),
	.inq_div			(inq_div),
	.inq_id				(inq_id[4:0]),
	.inq_rnd_mode			(inq_rnd_mode[1:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_op				(inq_op[7:0]),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0),
	.inq_in1			(inq_in1[63:0]),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0),
	.inq_in2			(inq_in2[63:0]),

// new outputs of fpu_in to drive i_fpu_inq_sram
	.fp_id_in (fp_id_in[4:0]),
	.fp_rnd_mode_in (fp_rnd_mode_in[1:0]),
	.fp_fcc_in (fp_fcc_in[1:0]),
	.fp_op_in (fp_op_in[7:0]),
	.fp_src1_in (fp_src1_in[68:0]),
	.fp_src2_in (fp_src2_in[68:0]),
	.inq_rdaddr (inq_rdaddr[3:0]),
	.inq_wraddr (inq_wraddr[3:0]),
	.inq_read_en (inq_read_en),
	.inq_we (inq_we),

	.se (se_in_buf3),
  .si (manual_scan_0),
  .so (scan_manual_1)
);


// 7/30/03: updated scan ports from si to si_r, si_w and so to so_r, so_w
// 06/20/03: Pulled up i_fpu_inq_sram from fpu_in_dp into fpu

bw_r_rf16x160 i_fpu_inq_sram (
	.din ({inq_sram_din_buf1[155:0], 4'b0000}),
	.rd_adr (inq_rdaddr[3:0]),
	.wr_adr (inq_wraddr[3:0]),
	.read_en (inq_read_en),
	.wr_en (inq_we),
	.word_wen (4'hf),
	.byte_wen (20'hfffff),
	.rd_clk (rclk),
	.wr_clk (rclk),
	.se (se),
	.si_r (si_buf1),
	.si_w (scan_inq_sram_w),
	.reset_l (arst_l_in_buf3),
	.sehold (sehold),
	.rst_tri_en (rst_tri_en),
	.dout ({inq_dout[154:0], inq_dout_unused[4:0]}),
	.so_r (scan_inq_sram_w),
	.so_w (manual_scan_0)
);


fpu_add fpu_add (
	.inq_op				(inq_op_add_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_add_buf1[1:0]),
	.inq_id				(inq_id_add_buf1[4:0]),
	.inq_fcc			(inq_fcc[1:0]),
	.inq_in1			(inq_in1_add_buf1[63:0]),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_add_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_add_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_add_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_add_buf1),
	.inq_in2			(inq_in2_add_buf1[63:0]),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_add_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_add_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_add_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_add_buf1),
	.inq_add			(inq_add),
	.add_dest_rdy			(add_dest_rdy),
	.fadd_clken_l			(fadd_clken_l),
	.arst_l				(arst_l_add_buf4),
	.grst_l				(fpu_grst_l_add_buf3),
	.rclk				(rclk),

	.add_pipe_active                (add_pipe_active),
	.a1stg_step			(a1stg_step),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.add_id_out_in			(add_id_out_in[9:0]),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.add_exc_out			(add_exc_out[4:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.add_sign_out			(add_sign_out),
	.add_exp_out			(add_exp_out[10:0]),
	.add_frac_out			(add_frac_out[63:0]),
	.add_cc_out			(add_cc_out[1:0]),
	.add_fcc_out			(add_fcc_out[1:0]),

	.se_add_exp     (se_add_exp_buf2),
	.se_add_frac    (se_add_frac_buf2),
  .si             (scan_manual_1),
  .so             (scan_manual_2)
);


fpu_mul fpu_mul (
	.inq_op				(inq_op_mul_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_mul_buf1[1:0]),
	.inq_id				(inq_id_mul_buf1[4:0]),
	.inq_in1			(inq_in1_mul_buf1[63:0]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_mul_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_mul_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_mul_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_mul_buf1),
	.inq_in2			(inq_in2_mul_buf1[63:0]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_mul_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_mul_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_mul_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_mul_buf1),
	.inq_mul			(inq_mul),
	.mul_dest_rdy			(mul_dest_rdy),
	.mul_dest_rdya			(mul_dest_rdy),
	.fmul_clken_l			(fmul_clken_l),
	.fmul_clken_l_buf1			(fmul_clken_l_buf1),
	.arst_l				(arst_l_mul_buf2),
	.grst_l				(fpu_grst_l_mul_buf1),
	.rclk				(rclk),

	.mul_pipe_active                (mul_pipe_active),
	.m1stg_step			(m1stg_step),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.mul_sign_out			(mul_sign_out),
	.mul_exp_out			(mul_exp_out[10:0]),
	.mul_frac_out			(mul_frac_out[51:0]),

	.se_mul           (se_mul_buf4),
	.se_mul64 (se_mul64_buf2),
  .si              (scan_manual_2),
  .so              (scan_manual_3)
);


fpu_div fpu_div (
	.inq_op				(inq_op_div_buf1[7:0]),
	.inq_rnd_mode			(inq_rnd_mode_div_buf1[1:0]),
	.inq_id				(inq_id_div_buf1[4:0]),
	.inq_in1			(inq_in1_div_buf1[63:0]),
	.inq_in1_53_0_neq_0		(inq_in1_53_0_neq_0_div_buf1),
	.inq_in1_50_0_neq_0		(inq_in1_50_0_neq_0_div_buf1),
	.inq_in1_53_32_neq_0		(inq_in1_53_32_neq_0_div_buf1),
	.inq_in1_exp_eq_0		(inq_in1_exp_eq_0_div_buf1),
	.inq_in1_exp_neq_ffs		(inq_in1_exp_neq_ffs_div_buf1),
	.inq_in2			(inq_in2_div_buf1[63:0]),
	.inq_in2_53_0_neq_0		(inq_in2_53_0_neq_0_div_buf1),
	.inq_in2_50_0_neq_0		(inq_in2_50_0_neq_0_div_buf1),
	.inq_in2_53_32_neq_0		(inq_in2_53_32_neq_0_div_buf1),
	.inq_in2_exp_eq_0		(inq_in2_exp_eq_0_div_buf1),
	.inq_in2_exp_neq_ffs		(inq_in2_exp_neq_ffs_div_buf1),
	.inq_div			(inq_div),
	.div_dest_rdy			(div_dest_rdy),
  .fdiv_clken_l			(fdiv_clken_l_div_frac_buf1),
  .fdiv_clken_l_div_exp_buf1 (fdiv_clken_l_div_exp_buf1),
	.arst_l				(arst_l_div_buf2),
	.grst_l				(fpu_grst_l),
	.rclk				(rclk),

	.div_pipe_active                (div_pipe_active),
	.d1stg_step			(d1stg_step),
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.div_id_out_in			(div_id_out_in[9:0]),
	.div_exc_out			(div_exc_out[4:0]),
	.d8stg_fdivd			(d8stg_fdivd),
	.d8stg_fdivs			(d8stg_fdivs),
	.div_sign_out			(div_sign_out),
	.div_exp_outa			(div_exp_out[10:0]),
	.div_frac_outa			(div_frac_out[51:0]),

	.se              (se_div_buf5),
  .si              (scan_manual_3),
  .so              (scan_manual_4)
);


fpu_out fpu_out (
	.d8stg_fdiv_in			(d8stg_fdiv_in),
	.m6stg_fmul_in			(m6stg_fmul_in),
	.a6stg_fadd_in			(a6stg_fadd_in),
	.div_id_out_in			(div_id_out_in[9:0]),
	.m6stg_id_in			(m6stg_id_in[9:0]),
	.add_id_out_in			(add_id_out_in[9:0]),
	.div_exc_out			(div_exc_out[4:0]),
	.d8stg_fdivd			(d8stg_fdivd),
	.d8stg_fdivs			(d8stg_fdivs),
	.div_sign_out			(div_sign_out),
	.div_exp_out			(div_exp_out[10:0]),
	.div_frac_out			(div_frac_out[51:0]),
	.mul_exc_out			(mul_exc_out[4:0]),
	.m6stg_fmul_dbl_dst		(m6stg_fmul_dbl_dst),
	.m6stg_fmuls			(m6stg_fmuls),
	.mul_sign_out			(mul_sign_out),
	.mul_exp_out			(mul_exp_out[10:0]),
	.mul_frac_out			(mul_frac_out[51:0]),
	.add_exc_out			(add_exc_out[4:0]),
	.a6stg_fcmpop			(a6stg_fcmpop),
	.add_cc_out			(add_cc_out[1:0]),
	.add_fcc_out			(add_fcc_out[1:0]),
	.a6stg_dbl_dst			(a6stg_dbl_dst),
	.a6stg_sng_dst			(a6stg_sng_dst),
	.a6stg_long_dst			(a6stg_long_dst),
	.a6stg_int_dst			(a6stg_int_dst),
	.add_sign_out			(add_sign_out),
	.add_exp_out			(add_exp_out[10:0]),
	.add_frac_out			(add_frac_out[63:0]),
	.arst_l				(arst_l_out_buf3),
	.grst_l				(fpu_grst_l_add_buf3),
	.rclk				(rclk),

	.fp_cpx_req_cq			(fp_cpx_req_cq_unbuf[7:0]),
	.add_dest_rdy			(add_dest_rdy),
	.mul_dest_rdy			(mul_dest_rdy),
	.div_dest_rdy			(div_dest_rdy),
	.fp_cpx_data_ca			(fp_cpx_data_ca_unbuf[144:0]),

	.se               (se_out_buf2),
  .si           (scan_manual_4),
  .so           (scan_manual_5)
);

///////////////////////////////////////////////////////////////////////////////
//
//      FPU test_stub.
//
///////////////////////////////////////////////////////////////////////////////

`ifdef NO_SCAN
assign se = 1'b0;
assign sehold = 1'b0;
assign rst_tri_en = 1'b0;
`else

test_stub_scan test_stub (
	.ctu_tst_pre_grst_l (ctu_tst_pre_grst_l_buf1),
	.arst_l (arst_l_add_buf4),
	.global_shift_enable (global_shift_enable_buf1),
	.ctu_tst_scan_disable (ctu_tst_scan_disable_buf1),
	.ctu_tst_scanmode (ctu_tst_scanmode_buf1),
	.ctu_tst_macrotest (ctu_tst_macrotest_buf1),
	.ctu_tst_short_chain (ctu_tst_short_chain_buf1),
	.long_chain_so_0 (scan_manual_6_buf1), // connect to long scan chain
	.short_chain_so_0 (manual_scan_0), // connect to short scan chain (from fpu_inq_sram)
	.long_chain_so_1 (1'b0),
	.short_chain_so_1 (1'b0),
	.long_chain_so_2 (1'b0),
	.short_chain_so_2 (1'b0),

	.mux_drive_disable (),
	.mem_write_disable (rst_tri_en),
	.sehold (sehold),
	.se (se),
	.testmode_l (),
	.mem_bypass (),
	.so_0 (so_unbuf),
	.so_1 (),
	.so_2 ()
);

`endif

///////////////////////////////////////////////////////////////////////////////
//
//      FPU cluster_header.
//
///////////////////////////////////////////////////////////////////////////////

//bw_clk_cl_fpu_cmp cluster_header (
//	.gclk (gclk),
//	.cluster_cken (cluster_cken_buf1),
//	.arst_l (arst_l_cluster_header_buf2),
//	.grst_l (grst_l_buf1),
//	.adbginit_l (1'b1),
//	.gdbginit_l (1'b1),
//	.dbginit_l (),
//	.cluster_grst_l (fpu_grst_l),
//	.rclk (rclk),
//	.se (se_cluster_header_buf2),
//	.si (scan_manual_5),
//	.so (scan_manual_6)
//);

assign rclk = gclk;
assign fpu_grst_l = grst_l;


///////////////////////////////////////////////////////////////////////////////
//
//      FPU repeater_groups.
//
///////////////////////////////////////////////////////////////////////////////

// 3/14/03: Added repeater groups
fpu_rptr_groups fpu_rptr_groups (
	.inq_in1 (inq_in1[63:0]),
	.inq_in2 (inq_in2[63:0]),
	.inq_id (inq_id[4:0]),
	.inq_op (inq_op[7:0]),
	.inq_rnd_mode (inq_rnd_mode[1:0]),
	.inq_in1_50_0_neq_0 (inq_in1_50_0_neq_0),
	.inq_in1_53_0_neq_0 (inq_in1_53_0_neq_0),
	.inq_in1_53_32_neq_0 (inq_in1_53_32_neq_0),
	.inq_in1_exp_eq_0 (inq_in1_exp_eq_0),
	.inq_in1_exp_neq_ffs (inq_in1_exp_neq_ffs),
	.inq_in2_50_0_neq_0 (inq_in2_50_0_neq_0),
	.inq_in2_53_0_neq_0 (inq_in2_53_0_neq_0),
	.inq_in2_53_32_neq_0 (inq_in2_53_32_neq_0),
	.inq_in2_exp_eq_0 (inq_in2_exp_eq_0),
	.inq_in2_exp_neq_ffs (inq_in2_exp_neq_ffs),

	.ctu_tst_macrotest (ctu_tst_macrotest),
	.ctu_tst_pre_grst_l (ctu_tst_pre_grst_l),
	.ctu_tst_scan_disable (ctu_tst_scan_disable),
	.ctu_tst_scanmode (ctu_tst_scanmode),
	.ctu_tst_short_chain (ctu_tst_short_chain),
	.global_shift_enable (global_shift_enable),

	.grst_l (grst_l),
	.cluster_cken (cluster_cken),

	.se (se),

	.arst_l (arst_l),

	.fpu_grst_l (fpu_grst_l),

	.fmul_clken_l (fmul_clken_l),
	.fdiv_clken_l (fdiv_clken_l),

	.scan_manual_6 (),
	// .scan_manual_6 (scan_manual_6),

	.si (si),
	.so_unbuf (so_unbuf),

	.pcx_fpio_data_px2 (pcx_fpio_data_px2[123:0]),
	.pcx_fpio_data_rdy_px2 (pcx_fpio_data_rdy_px2),

	.fp_cpx_data_ca (fp_cpx_data_ca_unbuf[144:0]),
	.fp_cpx_req_cq (fp_cpx_req_cq_unbuf[7:0]),

	.inq_sram_din_unbuf ({fp_id_in[4:0],
		fp_rnd_mode_in[1:0],
		fp_fcc_in[1:0],
		fp_op_in[7:0],
		fp_src1_in[68:0],
		fp_src2_in[68:0], 1'b0}),

	.inq_in1_add_buf1 (inq_in1_add_buf1[63:0]),
	.inq_in1_mul_buf1 (inq_in1_mul_buf1[63:0]),
	.inq_in1_div_buf1 (inq_in1_div_buf1[63:0]),
	.inq_in2_add_buf1 (inq_in2_add_buf1[63:0]),
	.inq_in2_mul_buf1 (inq_in2_mul_buf1[63:0]),
	.inq_in2_div_buf1 (inq_in2_div_buf1[63:0]),
	.inq_id_add_buf1 (inq_id_add_buf1[4:0]),
	.inq_id_div_buf1 (inq_id_div_buf1[4:0]),
	.inq_id_mul_buf1 (inq_id_mul_buf1[4:0]),
	.inq_op_add_buf1 (inq_op_add_buf1[7:0]),
	.inq_op_mul_buf1 (inq_op_mul_buf1[7:0]),
	.inq_op_div_buf1 (inq_op_div_buf1[7:0]),
	.inq_rnd_mode_add_buf1 (inq_rnd_mode_add_buf1[1:0]),
	.inq_rnd_mode_mul_buf1 (inq_rnd_mode_mul_buf1[1:0]),
	.inq_rnd_mode_div_buf1 (inq_rnd_mode_div_buf1[1:0]),
	.inq_in1_50_0_neq_0_add_buf1 (inq_in1_50_0_neq_0_add_buf1),
	.inq_in1_50_0_neq_0_mul_buf1 (inq_in1_50_0_neq_0_mul_buf1),
	.inq_in1_50_0_neq_0_div_buf1 (inq_in1_50_0_neq_0_div_buf1),
	.inq_in1_53_0_neq_0_add_buf1 (inq_in1_53_0_neq_0_add_buf1),
	.inq_in1_53_0_neq_0_mul_buf1 (inq_in1_53_0_neq_0_mul_buf1),
	.inq_in1_53_0_neq_0_div_buf1 (inq_in1_53_0_neq_0_div_buf1),
	.inq_in1_53_32_neq_0_add_buf1 (inq_in1_53_32_neq_0_add_buf1),
	.inq_in1_53_32_neq_0_mul_buf1 (inq_in1_53_32_neq_0_mul_buf1),
	.inq_in1_53_32_neq_0_div_buf1 (inq_in1_53_32_neq_0_div_buf1),
	.inq_in1_exp_eq_0_add_buf1 (inq_in1_exp_eq_0_add_buf1),
	.inq_in1_exp_eq_0_mul_buf1 (inq_in1_exp_eq_0_mul_buf1),
	.inq_in1_exp_eq_0_div_buf1 (inq_in1_exp_eq_0_div_buf1),
	.inq_in1_exp_neq_ffs_add_buf1 (inq_in1_exp_neq_ffs_add_buf1),
	.inq_in1_exp_neq_ffs_mul_buf1 (inq_in1_exp_neq_ffs_mul_buf1),
	.inq_in1_exp_neq_ffs_div_buf1 (inq_in1_exp_neq_ffs_div_buf1),
	.inq_in2_50_0_neq_0_add_buf1 (inq_in2_50_0_neq_0_add_buf1),
	.inq_in2_50_0_neq_0_mul_buf1 (inq_in2_50_0_neq_0_mul_buf1),
	.inq_in2_50_0_neq_0_div_buf1 (inq_in2_50_0_neq_0_div_buf1),
	.inq_in2_53_0_neq_0_add_buf1 (inq_in2_53_0_neq_0_add_buf1),
	.inq_in2_53_0_neq_0_mul_buf1 (inq_in2_53_0_neq_0_mul_buf1),
	.inq_in2_53_0_neq_0_div_buf1 (inq_in2_53_0_neq_0_div_buf1),
	.inq_in2_53_32_neq_0_add_buf1 (inq_in2_53_32_neq_0_add_buf1),
	.inq_in2_53_32_neq_0_mul_buf1 (inq_in2_53_32_neq_0_mul_buf1),
	.inq_in2_53_32_neq_0_div_buf1 (inq_in2_53_32_neq_0_div_buf1),
	.inq_in2_exp_eq_0_add_buf1 (inq_in2_exp_eq_0_add_buf1),
	.inq_in2_exp_eq_0_mul_buf1 (inq_in2_exp_eq_0_mul_buf1),
	.inq_in2_exp_eq_0_div_buf1 (inq_in2_exp_eq_0_div_buf1),
	.inq_in2_exp_neq_ffs_add_buf1 (inq_in2_exp_neq_ffs_add_buf1),
	.inq_in2_exp_neq_ffs_mul_buf1 (inq_in2_exp_neq_ffs_mul_buf1),
	.inq_in2_exp_neq_ffs_div_buf1 (inq_in2_exp_neq_ffs_div_buf1),

	.ctu_tst_macrotest_buf1 (ctu_tst_macrotest_buf1),
	.ctu_tst_pre_grst_l_buf1 (ctu_tst_pre_grst_l_buf1),
	.ctu_tst_scan_disable_buf1 (ctu_tst_scan_disable_buf1),
	.ctu_tst_scanmode_buf1 (ctu_tst_scanmode_buf1),
	.ctu_tst_short_chain_buf1 (ctu_tst_short_chain_buf1),
	.global_shift_enable_buf1 (global_shift_enable_buf1),

	.grst_l_buf1 (grst_l_buf1),
	.cluster_cken_buf1 (cluster_cken_buf1),

	.se_add_exp_buf2 (se_add_exp_buf2),
	.se_add_frac_buf2 (se_add_frac_buf2),
	.se_out_buf2 (se_out_buf2),
	.se_mul64_buf2 (se_mul64_buf2),
	.se_cluster_header_buf2 (se_cluster_header_buf2),
	.se_in_buf3 (se_in_buf3),
	.se_mul_buf4 (se_mul_buf4),
	.se_div_buf5 (se_div_buf5),

	.arst_l_div_buf2 (arst_l_div_buf2),
	.arst_l_mul_buf2 (arst_l_mul_buf2),
	.arst_l_cluster_header_buf2 (arst_l_cluster_header_buf2),
	.arst_l_in_buf3 (arst_l_in_buf3),
	.arst_l_out_buf3 (arst_l_out_buf3),
	.arst_l_add_buf4 (arst_l_add_buf4),

	.fpu_grst_l_mul_buf1 (fpu_grst_l_mul_buf1),
	.fpu_grst_l_in_buf2 (fpu_grst_l_in_buf2),
	.fpu_grst_l_add_buf3 (fpu_grst_l_add_buf3),

	.fmul_clken_l_buf1 (fmul_clken_l_buf1),
	.fdiv_clken_l_div_exp_buf1 (fdiv_clken_l_div_exp_buf1),
	.fdiv_clken_l_div_frac_buf1 (fdiv_clken_l_div_frac_buf1),

	.scan_manual_6_buf1 (scan_manual_6_buf1),

	.si_buf1 (si_buf1),
	.so (so),

	.pcx_fpio_data_px2_buf1 (pcx_fpio_data_px2_buf1[123:0]),
	.pcx_fpio_data_rdy_px2_buf1 (pcx_fpio_data_rdy_px2_buf1),

	.fp_cpx_data_ca_buf1 (fp_cpx_data_ca[144:0]),
	.fp_cpx_req_cq_buf1 (fp_cpx_req_cq[7:0]),

	.inq_sram_din_buf1 (inq_sram_din_buf1[155:0])

);


endmodule

// Local Variables:
// verilog-library-directories:("." "../../../srams/rtl")
// End:

