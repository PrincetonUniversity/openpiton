// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in.v
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
//	FPU request input.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in (
	pcx_fpio_data_rdy_px2,
	pcx_fpio_data_px2,
	a1stg_step,
	m1stg_step,
	d1stg_step,
	add_pipe_active,
	mul_pipe_active,
	div_pipe_active,
	inq_dout,
	sehold,
	arst_l,
	grst_l,
	rclk,

	fadd_clken_l,
	fmul_clken_l,
	fdiv_clken_l,
	
	inq_add,
	inq_mul,
	inq_div,
	inq_id,
	inq_rnd_mode,
	inq_fcc,
	inq_op,
	inq_in1_exp_neq_ffs,
	inq_in1_exp_eq_0,
	inq_in1_53_0_neq_0,
	inq_in1_50_0_neq_0,
	inq_in1_53_32_neq_0,
	inq_in1,
	inq_in2_exp_neq_ffs,
	inq_in2_exp_eq_0,
	inq_in2_53_0_neq_0,
	inq_in2_50_0_neq_0,
	inq_in2_53_32_neq_0,
	inq_in2,

	fp_id_in,
	fp_rnd_mode_in,
	fp_fcc_in,
	fp_op_in,
	fp_src1_in,
	fp_src2_in,
	inq_rdaddr,
	inq_wraddr,
	inq_read_en,
	inq_we,

	se,
	si,
	so
);


input		pcx_fpio_data_rdy_px2;	// FPU request ready from PCX
input [123:0]	pcx_fpio_data_px2;	// FPU request data from PCX
input		a1stg_step;		// add pipe load
input		m1stg_step;		// multiply pipe load
input		d1stg_step;		// divide pipe load
input 		add_pipe_active;        // add pipe is executing a valid instr
input 		mul_pipe_active;        // mul pipe is executing a valid instr
input 		div_pipe_active;        // div pipe is executing a valid instr
input [154:0] inq_dout; // data read out from input Q SRAM
input sehold; // macrotest hold for sram output mux in fpu_in_dp
input		arst_l;			// global async. reset- asserted low
input		grst_l;			// global sync. reset- asserted low
input		rclk;			// global clock

output		fadd_clken_l;		// add      pipe clk enable - asserted low
output		fmul_clken_l;		// multiply pipe clk enable - asserted low
output		fdiv_clken_l;		// divide   pipe clk enable - asserted low

output		inq_add;		// add pipe request
output		inq_mul;		// multiply pipe request
output		inq_div;		// divide pipe request
output [4:0]	inq_id;			// request ID to the operation pipes
output [1:0]	inq_rnd_mode;		// request rounding mode to op pipes
output [1:0]	inq_fcc;		// request cc ID to op pipes
output [7:0]	inq_op;			// request opcode to op pipes
output		inq_in1_exp_neq_ffs;	// request operand 1 exp!=ff's
output		inq_in1_exp_eq_0;	// request operand 1 exp==0
output		inq_in1_53_0_neq_0;	// request operand 1[53:0]!=0
output		inq_in1_50_0_neq_0;	// request operand 1[50:0]!=0
output		inq_in1_53_32_neq_0;	// request operand 1[53:32]!=0
output [63:0]	inq_in1;		// request operand 1 to op pipes
output		inq_in2_exp_neq_ffs;	// request operand 2 exp!=ff's
output		inq_in2_exp_eq_0;	// request operand 2 exp==0
output		inq_in2_53_0_neq_0;	// request operand 2[53:0]!=0
output		inq_in2_50_0_neq_0;	// request operand 2[50:0]!=0
output		inq_in2_53_32_neq_0;	// request operand 2[53:32]!=0
output [63:0]	inq_in2;		// request operand 2 to op pipes

// 6/20/03: New outputs to drive fpu-level i_fpu_inq_sram inputs 
output [4:0] fp_id_in; // id to be written into inq_sram
output [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
output [1:0] fp_fcc_in; // fcc to be written into inq_sram
output [7:0] fp_op_in; // op field to be written into inq_sram
output [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
output [68:0] fp_src2_in; // operand2, includes pre-computed bits
output [3:0] inq_rdaddr; // read address for inq_sram
output [3:0] inq_wraddr; // write address for inq_sram
output inq_read_en; // read enable for inq_sram
output inq_we; // write enable for inq_sram

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


// Assertions
//
// PCX/FPU Protocol Assumptions:
// -----------------------------
// 
// (1) If a split transaction occurs (fpu packet type A --> N stall cycles -->
// fpu packet type B), the next valid packet after the N stall cycles will always
// be "fpu packet type B"
//
// not0in state_transition -var {pcx_fpio_data_rdy_px2, (pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0a)), (pcx_fpio_data_px2[122:118]==5'h0b)} -val {1'b1, 1'b1, 1'b0} -next {1'b1, 1'b0, 1'b1} {1'b0, 1'b0, 1'b0} {1'b0, 1'b0, 1'b1} {1'b0, 1'b1, 1'b0} -match_by_cycle -message "PCX/FPU protocol violation"
// 
// (3) Crossbar always provides a two beat fpu transfer (packet types A and B).
// Single source instructions produce an invalid transfer on the second beat
// (packet type B).
//
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0b) & pcx_fpio_data_px2[79]) -message "FPU given valid PCX packet B for single src fpop"
// 
// (4) For single precision operands, the unused 32-bit region of the 64-bit
// source is forced to zero by the FFU. The 32-bits of single precision data is
// always contained in the upper 32-bits of the 64-bit source.
//
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0a) & ~pcx_fpio_data_px2[73] & ~(pcx_fpio_data_px2[31:0]==32'b0)) -message "FPU given invalid SP data in PCX packet A"
// not0in custom -fire (pcx_fpio_data_rdy_px2 & pcx_fpio_data_px2[123] & (pcx_fpio_data_px2[122:118]==5'h0b) & ~pcx_fpio_data_px2[73] & ~(pcx_fpio_data_px2[31:0]==32'b0)) -message "FPU given invalid SP data in PCX packet B"


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in_ctl.
//
///////////////////////////////////////////////////////////////////////////////

wire		inq_we;			// input Q write enable
wire [3:0]	inq_wraddr;		// input Q write address
wire            inq_read_en;            // input Q read enable
wire [3:0]	inq_rdaddr;		// input Q read address
wire		inq_bp;			// bypass the input Q SRAM
wire		inq_bp_inv;		// don't bypass the input Q SRAM
wire		inq_fwrd;		// input Q is fwrd
wire		inq_fwrd_inv;		// input Q is not fwrd
wire		inq_add;		// add pipe request
wire		inq_mul;		// multiply pipe request
wire		inq_div;		// divide pipe request
wire  		fadd_clken_l;		// add      pipe clk enable - asserted low
wire 		fmul_clken_l;		// multiply pipe clk enable - asserted low
wire 		fdiv_clken_l;		// divide   pipe clk enable - asserted low


///////////////////////////////////////////////////////////////////////////////
//
//	Outputs of fpu_in_dp.
//
///////////////////////////////////////////////////////////////////////////////

wire [7:0]	fp_op_in;		// request opcode
wire            fp_op_in_7in;           // request opcode
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

// 6/20/03: New outputs to drive fpu-level i_fpu_inq_sram inputs 
wire [4:0] fp_id_in; // id to be written into inq_sram
wire [1:0] fp_rnd_mode_in; // rnd_mode to be written into inq_sram
wire [1:0] fp_fcc_in; // fcc to be written into inq_sram
wire [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
wire [68:0] fp_src2_in; // operand2, includes pre-computed bits

wire fp_data_rdy;

//Previously missing wires
wire        scan_out_fpu_in_ctl;

///////////////////////////////////////////////////////////////////////////////
//
//	Instantiations.
//
///////////////////////////////////////////////////////////////////////////////

fpu_in_ctl fpu_in_ctl (
	.pcx_fpio_data_rdy_px2		(pcx_fpio_data_rdy_px2),
	.pcx_fpio_data_px2		(pcx_fpio_data_px2[123:118]),
	.fp_op_in    			(fp_op_in[3:2]),
        .fp_op_in_7in                   (fp_op_in_7in),
	.a1stg_step			(a1stg_step),
	.m1stg_step			(m1stg_step),
	.d1stg_step			(d1stg_step),
	.add_pipe_active		(add_pipe_active),
	.mul_pipe_active		(mul_pipe_active),
	.div_pipe_active		(div_pipe_active),
	.sehold (sehold),
	.arst_l				(arst_l),
	.grst_l				(grst_l),
	.rclk			(rclk),

        .fp_data_rdy			(fp_data_rdy),
	.fadd_clken_l			(fadd_clken_l),
	.fmul_clken_l			(fmul_clken_l),
	.fdiv_clken_l			(fdiv_clken_l),

	.inq_we				(inq_we),
	.inq_wraddr			(inq_wraddr[3:0]),
	.inq_read_en			(inq_read_en),
	.inq_rdaddr			(inq_rdaddr[3:0]),
	.inq_bp				(inq_bp),
	.inq_bp_inv			(inq_bp_inv),
	.inq_fwrd			(inq_fwrd),
	.inq_fwrd_inv			(inq_fwrd_inv),
	.inq_add			(inq_add),
	.inq_mul			(inq_mul),
	.inq_div			(inq_div),

	.se           (se),
  .si           (si),
  .so           (scan_out_fpu_in_ctl)
);


fpu_in_dp fpu_in_dp (
        .fp_data_rdy			(fp_data_rdy),
        .fpio_data_px2_116_112          (pcx_fpio_data_px2[116:112]),
        .fpio_data_px2_79_72            (pcx_fpio_data_px2[79:72]),
        .fpio_data_px2_67_0             (pcx_fpio_data_px2[67:0]),
	.inq_fwrd			(inq_fwrd),
	.inq_fwrd_inv			(inq_fwrd_inv),
	.inq_bp				(inq_bp),
	.inq_bp_inv			(inq_bp_inv),
	.inq_dout    (inq_dout[154:0]),
	.rclk			(rclk),

        .fp_op_in_7in                   (fp_op_in_7in),
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

	.fp_id_in (fp_id_in[4:0]),
	.fp_rnd_mode_in (fp_rnd_mode_in[1:0]),
	.fp_fcc_in (fp_fcc_in[1:0]),
	.fp_op_in (fp_op_in[7:0]),
	.fp_src1_in (fp_src1_in[68:0]),
	.fp_src2_in (fp_src2_in[68:0]),

	.se                             (se),
        .si                             (scan_out_fpu_in_ctl),
        .so                             (so)
);


endmodule


