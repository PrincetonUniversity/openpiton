// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_in_dp.v
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
//      FPU input datapath.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_in_dp (
	fp_data_rdy,
        fpio_data_px2_116_112,
        fpio_data_px2_79_72,
        fpio_data_px2_67_0,
	inq_fwrd,
	inq_fwrd_inv,
	inq_bp,
	inq_bp_inv,
	inq_dout,
	rclk,
	
        fp_op_in_7in,
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

	se,
	si,
	so
);


input           fp_data_rdy;
input [116:112] fpio_data_px2_116_112;  // FPU request data from PCX
input [79:72]   fpio_data_px2_79_72;    // FPU request data from PCX
input [67:0]    fpio_data_px2_67_0;     // FPU request data from PCX
input		inq_fwrd;		// input Q is empty
input		inq_fwrd_inv;		// input Q is not empty
input		inq_bp;			// bypass the input Q SRAM
input		inq_bp_inv;		// don't bypass the input Q SRAM
input [154:0] inq_dout; // data read out from input Q SRAM
input		rclk;		// global clock

output          fp_op_in_7in;           // request opcode
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
output [7:0] fp_op_in; // request opcode
output [68:0] fp_src1_in; // operand1 and its pre-computed bits portion
output [68:0] fp_src2_in; // operand2, includes pre-computed bits

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [154:0]	inq_dout;
wire [4:0]	fp_id_in;
wire [7:0]	fp_op_in;
wire		fp_op_in_7;		// request opcode bit[7]
wire		fp_op_in_7_inv;		// inverted request opcode bit[7]
wire            fp_op_in_7in;
wire [1:0]	fp_fcc_in;
wire [1:0]	fp_rnd_mode_in;
wire [63:0]	fp_srca_in;
wire		fp_srca_53_0_neq_0;
wire		fp_srca_50_0_neq_0;
wire		fp_srca_53_32_neq_0;
wire		fp_srca_exp_eq_0;
wire		fp_srca_exp_neq_ffs;
wire [68:0]	fp_srcb_in;
wire [68:0]	fp_src1_in;
wire [68:0]	fp_src2_in;
wire [154:0]	inq_din_d1;
wire [154:0]	inq_data;
wire [4:0]	inq_id;
wire [1:0]	inq_rnd_mode;
wire [1:0]	inq_fcc;
wire [7:0]	inq_op;
wire		inq_in1_exp_neq_ffs;
wire		inq_in1_exp_eq_0;
wire		inq_in1_53_0_neq_0;
wire		inq_in1_50_0_neq_0;
wire		inq_in1_53_32_neq_0;
wire [63:0]	inq_in1;
wire		inq_in2_exp_neq_ffs;
wire		inq_in2_exp_eq_0;
wire		inq_in2_53_0_neq_0;
wire		inq_in2_50_0_neq_0;
wire		inq_in2_53_32_neq_0;
wire [63:0]	inq_in2;

wire clk;

wire se_l;

// 6/23/03: Replaced tm_l with se_l 
assign se_l = ~se;

clken_buf  ckbuf_in_dp (
  .clk(clk),
  .rclk(rclk),
  .enb_l(1'b0),
  .tmb_l(se_l)
  );

///////////////////////////////////////////////////////////////////////////////
//
//      Capture input information.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(5) i_fp_id_in (
	.din	(fpio_data_px2_116_112[116:112]),
	.clk    (clk),
 
        .q      (fp_id_in[4:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(8) i_fp_op_in (
        .din    (fpio_data_px2_79_72[79:72]),
        .clk    (clk),

        .q      (fp_op_in[7:0]),

        .se     (se),
        .si     (),
        .so     ()
);

assign fp_op_in_7in = fp_op_in[7];
assign fp_op_in_7 = fp_op_in[7];
assign fp_op_in_7_inv = ~fp_op_in[7];

dff_s #(2) i_fp_fcc_in (
        .din    (fpio_data_px2_67_0[67:66]),
        .clk    (clk),

        .q      (fp_fcc_in[1:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(2) i_fp_rnd_mode_in (
        .din    (fpio_data_px2_67_0[65:64]),
        .clk    (clk),

        .q      (fp_rnd_mode_in[1:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dff_s #(64) i_fp_srca_in (
	.din    (fpio_data_px2_67_0[63:0]),
        .clk    (clk),

        .q      (fp_srca_in[63:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign fp_srca_53_0_neq_0= (|fp_srca_in[53:0]);

assign fp_srca_50_0_neq_0= (|fp_srca_in[50:0]);

assign fp_srca_53_32_neq_0= (|fp_srca_in[53:32]);

assign fp_srca_exp_eq_0= (!((|fp_srca_in[62:55])
		|| (fp_op_in[1] && (|fp_srca_in[54:52]))));

assign fp_srca_exp_neq_ffs= (!((&fp_srca_in[62:55])
		&& (fp_op_in[0] || (&fp_srca_in[54:52]))));


///////////////////////////////////////////////////////////////////////////////
//
//	Extract the two operands.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(69) i_fp_srcb_in (
	.din	({fp_srca_exp_neq_ffs, fp_srca_exp_eq_0, fp_srca_53_0_neq_0,
			fp_srca_50_0_neq_0, fp_srca_53_32_neq_0,
			fp_srca_in[63:0]}),
        .en     (fp_data_rdy),
	.clk    (clk),

        .q      (fp_srcb_in[68:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign fp_src1_in[68:0]= ({69{fp_op_in_7_inv}}
			    & {fp_srca_exp_neq_ffs, fp_srca_exp_eq_0,
				fp_srca_53_0_neq_0, fp_srca_50_0_neq_0,
				fp_srca_53_32_neq_0, fp_srca_in[63:0]})
		| ({69{fp_op_in_7}}
			    & 69'h180000000000000000);

assign fp_src2_in[68:0]= ({69{fp_op_in_7_inv}}
			    & fp_srcb_in[68:0])
		| ({69{fp_op_in_7}}
			    & {fp_srca_exp_neq_ffs, fp_srca_exp_eq_0,
				fp_srca_53_0_neq_0, fp_srca_50_0_neq_0,
				fp_srca_53_32_neq_0, fp_srca_in[63:0]});


///////////////////////////////////////////////////////////////////////////////
//
//	Input queue FIFO bypass and output.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(155) i_inq_din_d1 (
	.din	({fp_id_in[4:0], fp_rnd_mode_in[1:0], fp_fcc_in[1:0],
                        fp_op_in[7:0], fp_src1_in[68:0], fp_src2_in[68:0]}),
	.clk    (clk),

        .q      (inq_din_d1[154:0]),

        .se     (se),
        .si     (),
        .so     ()
);


assign inq_data[154:0]= ({155{inq_fwrd}}
			    & {fp_id_in[4:0], fp_rnd_mode_in[1:0],
				fp_fcc_in[1:0], fp_op_in[7:0],
				fp_src1_in[68:0], fp_src2_in[68:0]})
		| ({155{inq_fwrd_inv}}
			    & (({155{inq_bp}}
					& inq_din_d1[154:0])
				| ({155{inq_bp_inv}}
					& inq_dout[154:0])));

assign inq_id[4:0]= inq_data[154:150];
assign inq_rnd_mode[1:0]= inq_data[149:148];
assign inq_fcc[1:0]= inq_data[147:146];
assign inq_op[7:0]= inq_data[145:138];
assign inq_in1_exp_neq_ffs= inq_data[137];
assign inq_in1_exp_eq_0= inq_data[136];
assign inq_in1_53_0_neq_0= inq_data[135];
assign inq_in1_50_0_neq_0= inq_data[134];
assign inq_in1_53_32_neq_0= inq_data[133];
assign inq_in1[63:0]= inq_data[132:69];
assign inq_in2_exp_neq_ffs= inq_data[68];
assign inq_in2_exp_eq_0= inq_data[67];
assign inq_in2_53_0_neq_0= inq_data[66];
assign inq_in2_50_0_neq_0= inq_data[65];
assign inq_in2_53_32_neq_0= inq_data[64];
assign inq_in2[63:0]= inq_data[63:0];


endmodule

