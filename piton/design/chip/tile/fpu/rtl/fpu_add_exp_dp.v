// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_add_exp_dp.v
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
//	Add pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module fpu_add_exp_dp (
	inq_in1,
	inq_in2,
	inq_op,
	inq_op_7,
	a1stg_step,
	a1stg_faddsubd,
	a1stg_faddsubs,
	a1stg_fsdtoix,
	a6stg_step,
	a1stg_fstod,
	a1stg_fdtos,
	a1stg_fstoi,
	a1stg_fstox,
	a1stg_fdtoi,
	a1stg_fdtox,
	a2stg_fsdtoix_fdtos,
	a2stg_faddsubop,
	a2stg_fitos,
	a2stg_fitod,
	a2stg_fxtos,
	a2stg_fxtod,
	a3stg_exp_7ff,
	a3stg_exp_ff,
	a3stg_exp_add,
	a3stg_inc_exp_inv,
	a3stg_same_exp_inv,
	a3stg_dec_exp_inv,
	a3stg_faddsubop,
	a3stg_fdtos_inv,
	a4stg_fixtos_fxtod_inv,
	a4stg_shl_cnt,
	a4stg_denorm_inv,
	a4stg_rndadd_cout,
	add_exp_out_expinc,
	add_exp_out_exp,
	add_exp_out_exp1,
	a4stg_in_of,
	add_exp_out_expadd,
	a4stg_dblop,
	a4stg_to_0_inv,
	fadd_clken_l,
	rclk,
	
	a1stg_expadd3_11,
	a1stg_expadd1_11_0,
	a1stg_expadd4_inv,
	a1stg_expadd2_5_0,
	a2stg_exp,
	a2stg_expadd,
	a3stg_exp_10_0,
	a4stg_exp_11_0,
	add_exp_out,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input [1:0]	inq_op;			// request opcode[1:0]
input		inq_op_7;		// request opcode[7]
input		a1stg_step;		// add pipe load
input		a1stg_faddsubd;		// add/subtract double- add 1 stg
input		a1stg_faddsubs;		// add/subtract single- add 1 stg
input		a1stg_fsdtoix;		// float to integer convert- add 1 stg
input		a6stg_step;		// advance the add pipe
input		a1stg_fstod;		// fstod- add 1 stage
input		a1stg_fdtos;		// fdtos- add 1 stage
input		a1stg_fstoi;		// fstoi- add 1 stage
input		a1stg_fstox;		// fstox- add 1 stage
input		a1stg_fdtoi;		// fdtoi- add 1 stage
input		a1stg_fdtox;		// fdtox- add 1 stage
input		a2stg_fsdtoix_fdtos;	// float to integer convert- add 2 stg
input		a2stg_faddsubop;	// float add or subtract- add 2 stage
input		a2stg_fitos;		// fitos- add 2 stage
input		a2stg_fitod;		// fitod- add 2 stage
input		a2stg_fxtos;		// fxtos- add 2 stage
input		a2stg_fxtod;		// fxtod- add 2 stage
input		a3stg_exp_7ff;		// select line to a3stg_exp
input		a3stg_exp_ff;		// select line to a3stg_exp
input		a3stg_exp_add;		// select line to a3stg_exp
input		a3stg_inc_exp_inv;	// increment the exponent- add 3 stg
input		a3stg_same_exp_inv;	// keep the exponent- add 3 stg
input		a3stg_dec_exp_inv;	// decrement the exponent- add 3 stg
input		a3stg_faddsubop;	// add/subtract- add 3 stage
input		a3stg_fdtos_inv;	// double to single convert- add 3 stg
input		a4stg_fixtos_fxtod_inv;	// int to single/double cvt- add 4 stg
input [5:0]	a4stg_shl_cnt;		// postnorm shift left count- add 4 stg
input		a4stg_denorm_inv;	// 0 the exponent
input		a4stg_rndadd_cout;	// fraction rounding adder carry out
input		add_exp_out_expinc;	// select line to add_exp_out
input		add_exp_out_exp;	// select line to add_exp_out
input		add_exp_out_exp1;	// select line to add_exp_out
input		a4stg_in_of;		// add overflow- select exp out
input		add_exp_out_expadd;	// select line to add_exp_out
input		a4stg_dblop;		// double precision operation- add 4 stg
input		a4stg_to_0_inv;		// result to infinity on overflow
input		fadd_clken_l;           // add pipe clk enable - asserted low
input		rclk;		// global clock

output        	a1stg_expadd3_11;	// exponent adder 3 output- add 1 stage
output [11:0]	a1stg_expadd1_11_0;	// exponent adder 1 output- add 1 stage
output [10:0]	a1stg_expadd4_inv;	// exponent adder 4 output- add 1 stage
output [5:0]	a1stg_expadd2_5_0;	// exponent adder 2 output- add 1 stage
output [11:0]	a2stg_exp;		// exponent- add 2 stage
output [12:0]	a2stg_expadd;		// exponent adder- add 2 stage
output [10:0]	a3stg_exp_10_0;		// exponent adder- add 3 stage
output [11:0]	a4stg_exp_11_0;		// exponent adder- add 4 stage
output [10:0]	add_exp_out;		// add exponent output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [62:52]	a1stg_in1;
wire [62:52]	a1stg_in1a;
wire [62:52]	a1stg_in2;
wire [62:52]	a1stg_in2a;
wire [12:0]	a1stg_dp_sngop;
wire [12:0]	a1stg_dp_sngopa;
wire [12:0]	a1stg_dp_dblop;
wire [12:0]	a1stg_dp_dblopa;
wire [9:7]      a1stg_op_7;
wire            a1stg_op_7_0;
wire [10:0]	a1stg_expadd3_in1;
wire [10:0]	a1stg_expadd3_in2_in;
wire [10:0]	a1stg_expadd3_in2;
wire [12:0]	a1stg_expadd3;
wire            a1stg_expadd3_11;
wire [12:0]	a1stg_expadd1_in1;
wire [12:0]	a1stg_expadd1_in2;
wire [12:0]	a1stg_expadd1;
wire [11:0]     a1stg_expadd1_11_0;
wire [12:0]	a1stg_expadd4_in1;
wire [12:0]	a1stg_expadd4_in2;
wire [12:0]	a1stg_expadd4;
wire [10:0]	a1stg_expadd4_inv;
wire [12:0]	a1stg_expadd2_in1;
wire [12:0]	a1stg_expadd2;
wire [5:0]      a1stg_expadd2_5_0;
wire [12:0]	a2stg_exp_in;
wire [11:0]	a2stg_exp;
wire [12:0]	a2stg_expa;
wire [12:0]	a2stg_expadd_in2_in;
wire [12:0]	a2stg_expadd_in2;
wire [12:0]	a2stg_expadd;
wire [12:0]	a3stg_exp_in;
wire [12:0]	a3stg_exp;
wire [10:0]     a3stg_exp_10_0;
wire [12:0]	a3stg_exp_plus1;
wire [12:0]	a3stg_exp_minus1;
wire [12:0]	a4stg_exp_pre1_in;
wire [12:0]	a4stg_exp_pre1;
wire [12:0]	a4stg_exp_pre3_in;
wire [12:0]	a4stg_exp_pre3;
wire [12:0]	a4stg_exp_pre2_in;
wire [12:0]	a4stg_exp_pre2;
wire [12:0]	a4stg_exp_pre4_in;
wire [12:0]	a4stg_exp_pre4;
wire [12:0]	a4stg_exp;
wire [11:0]	a4stg_exp_11_0;
wire [12:0]	a4stg_exp2;
wire [12:0]	a4stg_expinc;
wire [12:0]	a4stg_expadd_in2;
wire [12:0]	a4stg_expadd;
wire [12:0]	a4stg_expshl;
wire [10:0]	add_exp_out_in1;
wire [10:0]	add_exp_out1;
wire [10:0]	add_exp_out_in2;
wire [10:0]	add_exp_out2;
wire [10:0]	add_exp_out_in3;
wire [10:0]	add_exp_out3;
wire [10:0]	add_exp_out4;
wire [10:0]	add_exp_out;

//Previously missing wires
wire        clk;

// 6/23/03: Removed tm_l input port. Using locally generated se_l instead for cken_buf 
wire se_l;

assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_add_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fadd_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//	Add exponent inputs.
//
//	Add input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_a1stg_in1 (
        .din    (inq_in1[62:52]),
        .en     (a1stg_step),
        .clk    (clk),
 
        .q      (a1stg_in1[62:52]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_a1stg_in1a (
	.din	(inq_in1[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_in1a[62:52]),

	.se	(se),
        .si	(),
        .so	()
);

dffe_s #(11) i_a1stg_in2 (
	.din	(inq_in2[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_in2[62:52]),

	.se	(se),
	.si	(),
   	.so	()
);

dffe_s #(11) i_a1stg_in2a (
        .din	(inq_in2[62:52]),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_in2a[62:52]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(13) i_a1stg_dp_sngop (
	.din	({13{inq_op[0]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_sngop[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(13) i_a1stg_dp_sngopa (
        .din	({13{inq_op[0]}}),
        .en	(a1stg_step),
        .clk	(clk),
 
        .q	(a1stg_dp_sngopa[12:0]),
 
        .se	(se),
        .si	(),
        .so	()
);

dffe_s #(13) i_a1stg_dp_dblop (
	.din	({13{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_dblop[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(13) i_a1stg_dp_dblopa (
	.din	({13{inq_op[1]}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_dp_dblopa[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(4) i_a1stg_op_7 (
	.din	({4{inq_op_7}}),
	.en	(a1stg_step),
	.clk	(clk),

	.q	({a1stg_op_7[9:7], a1stg_op_7_0}),

	.se	(se),
	.si	(),
	.so	()
);

dffe_s #(11) i_a1stg_expadd3_in1 (
	.din	(inq_in1[62:52]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_expadd3_in1[10:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign a1stg_expadd3_in2_in[10:0]= (~(inq_in2[62:52] 
		& {8'hff, {3{inq_op[1]}}}));

dffe_s #(11) i_a1stg_expadd3_in2 (
	.din	(a1stg_expadd3_in2_in[10:0]),
	.en	(a1stg_step),
	.clk	(clk),

	.q	(a1stg_expadd3_in2[10:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent comparison.
//
//	Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a1stg_expadd3[12:0]= ({2'b00, a1stg_expadd3_in1[10:0]}
			+ {2'b11, a1stg_expadd3_in2[10:0]}
			+ 13'h0001);
assign a1stg_expadd3_11 = a1stg_expadd3[11];


assign a1stg_expadd1_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in1[62:52]})
		| (a1stg_dp_sngopa
			    & {5'b0, a1stg_in1[62:55]})
		| {3'b0, a1stg_op_7[9:7], 6'b0, a1stg_op_7_0};

assign a1stg_expadd1_in2[12:0]= (~((a1stg_dp_dblop
			    & {2'b0, a1stg_in2[62:52]})
		| (a1stg_dp_sngop
			    & {5'b0, a1stg_in2[62:55]})));

assign a1stg_expadd1[12:0]= (a1stg_expadd1_in1[12:0]
			+ a1stg_expadd1_in2[12:0]
			+ 13'h0001);
assign a1stg_expadd1_11_0[11:0] = a1stg_expadd1[11:0];

assign a1stg_expadd4_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in2a[62:52]})
                | (a1stg_dp_sngopa
			    & {5'b0, a1stg_in2a[62:55]});

assign a1stg_expadd4_in2[12:0]= (~((a1stg_dp_dblop
                            & {2'b0, a1stg_in1a[62:52]})
		| (a1stg_dp_sngop
			    & {5'b0, a1stg_in1a[62:55]})));

assign a1stg_expadd4[12:0]= (a1stg_expadd4_in1[12:0]
			+ a1stg_expadd4_in2[12:0]
			+ 13'h0001);
assign a1stg_expadd4_inv[10:0]= (~a1stg_expadd4[10:0]);

assign a1stg_expadd2_in1[12:0]= (a1stg_dp_dblopa
			    & {2'b0, a1stg_in2a[62:52]})
                | (a1stg_dp_sngopa
			    & {5'b0, a1stg_in2a[62:55]});

assign a1stg_expadd2[12:0]= (a1stg_expadd2_in1[12:0]
			+ 13'h0001);
assign a1stg_expadd2_5_0[5:0] = a1stg_expadd2[5:0];

assign a2stg_exp_in[12:0]= ({13{(a1stg_faddsubd && (!a1stg_expadd1[12]))}}
			    & {2'b0, a1stg_in1a[62:52]})
		| ({13{(a1stg_faddsubs && (!a1stg_expadd1[12]))}}
			    & {5'b0, a1stg_in1a[62:55]})
		| ({13{(a1stg_faddsubd && a1stg_expadd1[12])}}
			    & {2'b0, a1stg_in2[62:52]})
		| ({13{a1stg_fdtos}}
			    & {2'b0, a1stg_in2[62:52]})
		| ({13{(a1stg_faddsubs && a1stg_expadd1[12])}}
			    & {5'b0, a1stg_in2[62:55]})
		| ({13{a1stg_fstod}}
			    & {5'b0, a1stg_in2[62:55]})
		| ({13{a1stg_fsdtoix}}
			    & a1stg_expadd2[12:0]);

dffe_s #(12) i_a2stg_exp (
	.din	(a2stg_exp_in[11:0]),
	.en     (a6stg_step),
        .clk    (clk),
 
        .q      (a2stg_exp[11:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_a2stg_expa (
	.din	(a2stg_exp_in[12:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(a2stg_expa[12:0]),

	.se	(se),
	.si	(),
	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent adjustment.
//
//      Add stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expadd_in2_in[12:0]= ({13{a1stg_fstod}}
			    & 13'h0380)
		| ({13{a1stg_fdtos}}
			    & (~13'h0380))
		| ({13{a1stg_fstoi}}
			    & (~13'h009f))
		| ({13{a1stg_fstox}}
			    & (~13'h00bf))
		| ({13{a1stg_fdtoi}}
			    & (~13'h041f))
		| ({13{a1stg_fdtox}}
			    & (~13'h043f));

dffe_s #(13) i_a2stg_expadd2_in2 (
        .din	(a2stg_expadd_in2_in[12:0]),
        .en	(a6stg_step),
        .clk	(clk),
 
        .q	(a2stg_expadd_in2[12:0]),
 
        .se	(se),
        .si	(),
        .so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Add pipe exponent adjustment.
//
//	Add stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign a2stg_expadd[12:0]= (a2stg_expa[12:0]
			+ a2stg_expadd_in2[12:0]
			+ {12'b0, a2stg_fsdtoix_fdtos});

assign a3stg_exp_in[12:0]= ({13{a2stg_faddsubop}}
			    & a2stg_expa[12:0])
		| ({13{a2stg_fitos}}
			    & 13'h009e)
		| ({13{a2stg_fitod}}
			    & 13'h041e)
		| ({13{a2stg_fxtos}}
			    & 13'h00be)
		| ({13{a2stg_fxtod}}
			    & 13'h043e)
		| ({13{a3stg_exp_7ff}}
			    & 13'h07ff)
		| ({13{a3stg_exp_ff}}
			    & 13'h00ff)
		| ({13{a3stg_exp_add}}
			    & (a2stg_expadd[12:0] & {13{(!a2stg_expadd[11])}}));

dffe_s #(13) i_a3stg_exp (
        .din    (a3stg_exp_in[12:0]),
        .en     (a6stg_step),
        .clk    (clk),
 
        .q      (a3stg_exp[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign a3stg_exp_10_0[10:0] = a3stg_exp[10:0];



///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent increment/decrement adjustment.
//
//      Add stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign a3stg_exp_plus1[12:0]= a3stg_exp[12:0] + 13'h0001;

assign a3stg_exp_minus1[12:0]= a3stg_exp[12:0] - 13'h0001;

assign a4stg_exp_pre1_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_inc_exp_inv))}}
			    & a3stg_exp_plus1[12:0]);

dff_s #(13) i_a4stg_exp_pre1 (
	.din	(a4stg_exp_pre1_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre1[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_exp_pre3_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_dec_exp_inv))}}
			    & a3stg_exp_minus1[12:0]);

dff_s #(13) i_a4stg_exp_pre3 (
	.din	(a4stg_exp_pre3_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre3[12:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign a4stg_exp_pre2_in[12:0]= ({13{((!a3stg_fdtos_inv) && a6stg_step)}}
			    & a3stg_exp[12:0])
		| ({13{((!a4stg_fixtos_fxtod_inv) && a6stg_step)}}
			    & a4stg_expshl[12:0])
		| ({13{(!a6stg_step)}}
			    & a4stg_exp[12:0]);

dff_s #(13) i_a4stg_exp_pre2 (
	.din	(a4stg_exp_pre2_in[12:0]),
        .clk    (clk),

        .q      (a4stg_exp_pre2[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign a4stg_exp_pre4_in[12:0]= ({13{(a3stg_faddsubop && a6stg_step
					&& (!a3stg_same_exp_inv))}}
			    & a3stg_exp[12:0]);

dff_s #(13) i_a4stg_exp_pre4 (
	.din	(a4stg_exp_pre4_in[12:0]),
	.clk	(clk),

	.q	(a4stg_exp_pre4[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_a4stg_exp2 (
	.din	(a3stg_exp[12:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (a4stg_exp2[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent rounding increment.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_exp[12:0]= (a4stg_exp_pre1[12:0]
		| a4stg_exp_pre2[12:0]
		| a4stg_exp_pre3[12:0]
		| a4stg_exp_pre4[12:0]);

assign a4stg_exp_11_0[11:0] = a4stg_exp[11:0];

assign a4stg_expinc[12:0]= a4stg_exp[12:0] + 13'h0001;


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent adjustment for post normalization left shift.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_expadd_in2[12:0]= (~{7'b0, a4stg_shl_cnt[5:0]});

assign a4stg_expadd[12:0]= (a4stg_exp2[12:0]
			+ a4stg_expadd_in2[12:0]
			+ 13'h0001);


///////////////////////////////////////////////////////////////////////////////
//
//      Add pipe exponent output.
//
//      Add stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign a4stg_expshl[12:0]= (a4stg_expadd[12:0] & {13{a4stg_denorm_inv}});

assign add_exp_out_in1[10:0]= (~(({11{add_exp_out_exp1}}
			    & a4stg_exp[10:0])
		| ({11{a4stg_in_of}}
			    & {{3{a4stg_dblop}}, 7'h7f, a4stg_to_0_inv})
		| ({11{add_exp_out_expadd}}
			    & a4stg_expshl[10:0])));

dffe_s #(11) i_add_exp_out1 (
	.din	(add_exp_out_in1[10:0]),
	.en     (a6stg_step),
        .clk    (clk),

        .q      (add_exp_out1[10:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign add_exp_out_in2[10:0]= (~({11{(add_exp_out_expinc
					&& a4stg_rndadd_cout)}}
			    & a4stg_expinc[10:0]));

dffe_s #(11) i_add_exp_out2 (
	.din	(add_exp_out_in2[10:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out2[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

assign add_exp_out_in3[10:0]= (~({11{add_exp_out_exp}}
			    & a4stg_exp[10:0]));

dffe_s #(11) i_add_exp_out3 (
	.din	(add_exp_out_in3[10:0]),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out3[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

dffe_s #(11) i_add_exp_out4 (
	.din	({11{a4stg_rndadd_cout}}),
	.en	(a6stg_step),
	.clk	(clk),

	.q	(add_exp_out4[10:0]),

	.se  	(se),
	.si	(),
	.so	()
);

assign add_exp_out[10:0]= (~(add_exp_out1[10:0]
		& add_exp_out2[10:0]
		& (add_exp_out3[10:0] | add_exp_out4[10:0])));


endmodule


