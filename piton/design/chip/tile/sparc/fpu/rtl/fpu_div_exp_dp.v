// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_exp_dp.v
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
//	Divide pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module fpu_div_exp_dp (
	inq_in1,
	inq_in2,
	d1stg_step,
	d234stg_fdiv,
	div_expadd1_in1_dbl,
	div_expadd1_in1_sng,
	div_expadd1_in2_exp_in2_dbl,
	div_expadd1_in2_exp_in2_sng,
	d3stg_fdiv,
	d4stg_fdiv,
	div_shl_cnt,
	div_exp1_expadd1,
	div_exp1_0835,
	div_exp1_0118,
	div_exp1_zero,
	div_exp1_load,
	div_expadd2_in1_exp_out,
	d5stg_fdiva,
	d5stg_fdivd,
	d5stg_fdivs,
	d6stg_fdiv,
	d7stg_fdiv,
	div_expadd2_no_decr_inv,
	div_expadd2_cin,
	div_exp_out_expadd2,
	div_exp_out_expadd22_inv,
	div_exp_out_of,
	d7stg_to_0_inv,
	d7stg_fdivd,
	div_exp_out_exp_out,
	d7stg_rndup_inv,
	div_frac_add_52_inv,
	div_exp_out_load,
	fdiv_clken_l,
	rclk,
	
	div_exp1,
	div_expadd2_12,
	div_exp_out,
	div_exp_outa,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input		d1stg_step;		// divide pipe load
input		d234stg_fdiv;		// select line to div_expadd1
input		div_expadd1_in1_dbl;	// select line to div_expadd1
input		div_expadd1_in1_sng;	// select line to div_expadd1
input		div_expadd1_in2_exp_in2_dbl; // select line to div_expadd1
input		div_expadd1_in2_exp_in2_sng; //select line to div_expadd1
input		d3stg_fdiv;		// divide operation- divide stage 3
input		d4stg_fdiv;		// divide operation- divide stage 4
input [5:0]	div_shl_cnt;		// divide left shift amount
input		div_exp1_expadd1;	// select line to div_exp1
input		div_exp1_0835;		// select line to div_exp1
input		div_exp1_0118;		// select line to div_exp1
input		div_exp1_zero;		// select line to div_exp1
input		div_exp1_load;		// load enable to div_exp1
input		div_expadd2_in1_exp_out; // select line to div_expadd2
input		d5stg_fdiva;		// divide operation- divide stage 5
input		d5stg_fdivd;		// divide double- divide stage 5
input		d5stg_fdivs;		// divide single- divide stage 5
input		d6stg_fdiv;		// divide operation- divide stage 6
input		d7stg_fdiv;		// divide operation- divide stage 7
input		div_expadd2_no_decr_inv; // no exponent decrement
input		div_expadd2_cin;	// carry in to 2nd exponent adder
input		div_exp_out_expadd2;	// select line to div_exp_out
input		div_exp_out_expadd22_inv; // select line to div_exp_out
input		div_exp_out_of;		// overflow to exponent output
input		d7stg_to_0_inv;		// result to infinity on overflow
input		d7stg_fdivd;		// divide double- divide stage 7
input		div_exp_out_exp_out;	// select line to div_exp_out
input		d7stg_rndup_inv;	// no rounding increment
input		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
input		div_exp_out_load;	// load enable to div_exp_out
input		fdiv_clken_l;           // div pipe clk enable - asserted low
input		rclk;		// global clock

output [12:0]	div_exp1;		// divide exponent- intermediate value
output        	div_expadd2_12;		// divide exponent- 2nd adder output
output [12:0]	div_exp_out;		// divide exponent output
output [10:0]	div_exp_outa;		// divide exponent output- buffered copy

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [10:0]	div_exp_in1;
wire [10:0]	div_exp_in2;
wire [12:0]	div_expadd1_in1;
wire [12:0]	div_expadd1_in2;
wire [12:0]	div_expadd1;
wire [12:0]	div_exp1_in;
wire [12:0]	div_exp1;
wire [12:0]	div_expadd2_in1;
wire [12:0]	div_expadd2_in2;
wire [12:0]     div_expadd2;
wire         	div_expadd2_12;
wire [12:0]	div_exp_out_in;
wire [12:0]	div_exp_out;
wire [10:0]	div_exp_outa;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_div_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fdiv_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//      Divide exponent inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_div_exp_in1 (
        .din    (inq_in1[62:52]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_exp_in1[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_div_exp_in2 (
        .din    (inq_in2[62:52]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_exp_in2[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide exponent adder in the front end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd1_in1[12:0]= ({13{d234stg_fdiv}}
			    & div_exp1[12:0])
		| ({13{div_expadd1_in1_dbl}}
			    & {2'b0, div_exp_in1[10:0]})
		| ({13{div_expadd1_in1_sng}}
			    & {5'b0, div_exp_in1[10:3]});

assign div_expadd1_in2[12:0]= ({13{div_expadd1_in1_dbl}}
			    & 13'h0436)
		| ({13{div_expadd1_in1_sng}}
			    & 13'h0099)
		| ({13{div_expadd1_in2_exp_in2_dbl}}
			    & (~{2'b0, div_exp_in2[10:0]}))
		| ({13{div_expadd1_in2_exp_in2_sng}}
			    & (~{5'b0, div_exp_in2[10:3]}))
		| ({13{d3stg_fdiv}}
			    & (~{7'b0, div_shl_cnt[5:0]}))
		| ({13{d4stg_fdiv}}
			    & {7'b0, div_shl_cnt[5:0]});

assign div_expadd1[12:0]= (div_expadd1_in1[12:0]
			+ div_expadd1_in2[12:0]);

assign div_exp1_in[12:0]= ({13{div_exp1_expadd1}}
			    & div_expadd1[12:0])
		| ({13{div_exp1_0835}}
			    & 13'h0835)
		| ({13{div_exp1_0118}}
			    & 13'h0118)
		| ({13{div_exp1_zero}}
			    & 13'h0000);

dffe_s #(13) i_div_exp1 (
	.din	(div_exp1_in[12:0]),
	.en	(div_exp1_load),
	.clk    (clk),

        .q      (div_exp1[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide exponent adder in the back end of the divide pipe.
//
///////////////////////////////////////////////////////////////////////////////

assign div_expadd2_in1[12:0]= ({13{div_expadd2_in1_exp_out}}
			    & div_exp_out[12:0])
		| ({13{d5stg_fdiva}}
			    & div_exp1[12:0]);

assign div_expadd2_in2[12:0]= ({13{d5stg_fdiva}}
			    & {7'h7f, d5stg_fdivs, 1'b0, d5stg_fdivd,
				d5stg_fdivs, 1'b1, d5stg_fdivs})
		| ({13{d6stg_fdiv}}
			    & {13{div_expadd2_no_decr_inv}})
		| ({13{d7stg_fdiv}}
			    & 13'h0000);

assign div_expadd2[12:0]= (div_expadd2_in1[12:0]
			+ div_expadd2_in2[12:0]
			+ {12'b0, div_expadd2_cin});
assign div_expadd2_12 = div_expadd2[12];

assign div_exp_out_in[12:0]= ({13{(div_exp_out_expadd2
				&& (!(div_frac_add_52_inv
					&& div_exp_out_expadd22_inv)))}}
			    & div_expadd2[12:0])
		| ({13{div_exp_out_of}}
			    & {2'b00, {3{d7stg_fdivd}}, 7'h7f, d7stg_to_0_inv})
		| ({13{(div_exp_out_exp_out
			&& (div_frac_add_52_inv || d7stg_rndup_inv))}}
			    & div_exp_out[12:0]);

dffe_s #(13) i_div_exp_out (
	.din	(div_exp_out_in[12:0]),
	.en	(div_exp_out_load),
	.clk    (clk),

        .q      (div_exp_out[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_exp_outa[10:0]= div_exp_out[10:0];


endmodule


