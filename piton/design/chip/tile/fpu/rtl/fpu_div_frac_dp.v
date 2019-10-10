// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_div_frac_dp.v
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
//	Divide pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif


module fpu_div_frac_dp (
	inq_in1,
	inq_in2,
	d1stg_step,
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
	d1stg_dblop,
	div_norm_zero,
	d1stg_snan_dbl_in1,
	d1stg_snan_sng_in1,
	d1stg_snan_dbl_in2,
	d1stg_snan_sng_in2,
	d3stg_fdiv,
	d6stg_fdiv,
	d6stg_fdivd,
	d6stg_fdivs,
	div_frac_add_in2_load,
	d6stg_frac_out_shl1,
	d6stg_frac_out_nosh,
	d4stg_fdiv,
	div_frac_add_in1_add,
	div_frac_add_in1_load,
	d5stg_fdivb,
	div_frac_out_add_in1,
	div_frac_out_add,
	div_frac_out_shl1_dbl,
	div_frac_out_shl1_sng,
	div_frac_out_of,
	d7stg_to_0,
	div_frac_out_load,
	fdiv_clken_l,
	rclk,
	
	div_shl_cnt,
	d6stg_frac_0,
	d6stg_frac_1,
	d6stg_frac_2,
	d6stg_frac_29,
	d6stg_frac_30,
	d6stg_frac_31,
	div_frac_add_in1_neq_0,
	div_frac_add_52_inv,
	div_frac_add_52_inva,
	div_frac_out_54_53,
	div_frac_outa,

	se,
	si,
	so
);


input [54:0]	inq_in1;		// request operand 1 to op pipes
input [54:0]	inq_in2;		// request operand 2 to op pipes
input		d1stg_step;		// divide pipe load
input		div_norm_frac_in1_dbl_norm; // select line to div_norm
input		div_norm_frac_in1_dbl_dnrm; // select line to div_norm
input		div_norm_frac_in1_sng_norm; // select line to div_norm
input		div_norm_frac_in1_sng_dnrm; // select line to div_norm
input		div_norm_frac_in2_dbl_norm; // select line to div_norm
input		div_norm_frac_in2_dbl_dnrm; // select line to div_norm
input		div_norm_frac_in2_sng_norm; // select line to div_norm
input		div_norm_frac_in2_sng_dnrm; // select line to div_norm
input		div_norm_inf;		// select line to div_norm
input		div_norm_qnan;		// select line to div_norm
input		d1stg_dblop;		// double precision operation- d1 stg
input		div_norm_zero;		// select line to div_norm
input		d1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
input		d1stg_snan_sng_in1;	// operand 1 is single signalling NaN
input		d1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
input		d1stg_snan_sng_in2;	// operand 2 is single signalling NaN
input		d3stg_fdiv;		// divide operation- divide stage 3
input		d6stg_fdiv;		// divide operation- divide stage 6
input		d6stg_fdivd;		// divide double- divide stage 6
input		d6stg_fdivs;		// divide single- divide stage 6
input		div_frac_add_in2_load;	// load enable to div_frac_add_in2
input		d6stg_frac_out_shl1;	// select line to d6stg_frac
input		d6stg_frac_out_nosh;	// select line to d6stg_frac
input		d4stg_fdiv;		// divide operation- divide stage 4
input		div_frac_add_in1_add;	// select line to div_frac_add_in1
input		div_frac_add_in1_load;	// load enable to div_frac_add_in1
input		d5stg_fdivb;		// divide operation- divide stage 5
input		div_frac_out_add_in1;	// select line to div_frac_out
input		div_frac_out_add;	// select line to div_frac_out
input		div_frac_out_shl1_dbl;	// select line to div_frac_out
input		div_frac_out_shl1_sng;	// select line to div_frac_out
input		div_frac_out_of;	// select line to div_frac_out
input		d7stg_to_0;		// result to max finite on overflow
input		div_frac_out_load;	// load enable to div_frac_out
input		fdiv_clken_l;           // div pipe clk enable - asserted low
input		rclk;		// global clock

output [5:0]	div_shl_cnt;		// divide left shift amount
output		d6stg_frac_0;		// divide fraction[0]- intermediate val
output		d6stg_frac_1;		// divide fraction[1]- intermediate val
output		d6stg_frac_2;		// divide fraction[2]- intermediate val
output		d6stg_frac_29;		// divide fraction[29]- intermediate val
output		d6stg_frac_30;		// divide fraction[30]- intermediate val
output		d6stg_frac_31;		// divide fraction[31]- intermediate val
output		div_frac_add_in1_neq_0;	// div_frac_add_in1 != 0
output		div_frac_add_52_inv;	// div_frac_add bit[52] inverted
output		div_frac_add_52_inva;	// div_frac_add bit[52] inverted copy
output [1:0]  	div_frac_out_54_53;	// divide fraction output
output [51:0]	div_frac_outa;		// divide fraction output- buffered copy

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [54:0]	div_frac_in1;
wire [54:0]	div_frac_in2;
wire [52:0]	div_norm_inv_in;
wire [52:0]	div_norm_inv;
wire [52:0]	div_norm;
wire [5:0]	div_lead0;
wire [5:0]	div_shl_cnt;
wire [5:0]	div_shl_cnta;
wire [52:0]	div_shl_data;
wire [105:53]	div_shl_tmp;
wire [52:0]	div_shl;
wire [54:0]	div_shl_save;
wire [54:0]	div_frac_add_in2_in;
wire [54:0]	div_frac_add_in2;
wire [53:0]	d6stg_frac;
wire		d6stg_frac_0;
wire		d6stg_frac_1;
wire		d6stg_frac_2;
wire		d6stg_frac_29;
wire		d6stg_frac_30;
wire		d6stg_frac_31;
wire [54:0]	div_frac_add_in1_in;
wire [54:0]	div_frac_add_in1;
wire [54:0]	div_frac_add_in1a;
wire		div_frac_add_in1_neq_0;
wire [54:0]	div_frac_add;
wire		div_frac_add_52_inv;
wire		div_frac_add_52_inva;
wire [54:0]	div_frac_out_in;
wire  [1:0]     div_frac_out_54_53;
wire [54:0]	div_frac_out;
wire [51:0]	div_frac_outa;


wire se_l;

//Previously missing wires
wire        clk;

assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_div_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fdiv_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//	Divide fraction inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(55) i_div_frac_in1 (
	.din	(inq_in1[54:0]),
	.en	(d1stg_step),
	.clk    (clk),
 
        .q      (div_frac_in1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_div_frac_in2 (
        .din    (inq_in2[54:0]),
        .en     (d1stg_step),
        .clk    (clk),
 
        .q      (div_frac_in2[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide normalization and special input injection.
//
///////////////////////////////////////////////////////////////////////////////

assign div_norm_inv_in[52:0]= (~(({53{div_norm_frac_in1_dbl_norm}}
			    & {1'b1, (div_frac_in1[51] || d1stg_snan_dbl_in1),
				div_frac_in1[50:0]})
		| ({53{div_norm_frac_in1_dbl_dnrm}}
			    & {div_frac_in1[51:0], 1'b0})
		| ({53{div_norm_frac_in1_sng_norm}}
			    & {1'b1, (div_frac_in1[54] || d1stg_snan_sng_in1),
				div_frac_in1[53:32], 29'b0})
		| ({53{div_norm_frac_in1_sng_dnrm}}
			    & {div_frac_in1[54:32], 30'b0})
		| ({53{div_norm_frac_in2_dbl_norm}}
			    & {1'b1, (div_frac_in2[51] || d1stg_snan_dbl_in2),
				div_frac_in2[50:0]})
		| ({53{div_norm_frac_in2_dbl_dnrm}}
			    & {div_frac_in2[51:0], 1'b0})
		| ({53{div_norm_frac_in2_sng_norm}}
			    & {1'b1, (div_frac_in2[54] || d1stg_snan_sng_in2),
				div_frac_in2[53:32], 29'b0})
		| ({53{div_norm_frac_in2_sng_dnrm}}
			    & {div_frac_in2[54:32], 30'b0})
		| ({53{div_norm_inf}}
			    & 53'h10000000000000)
		| ({53{div_norm_qnan}}
			    & {24'hffffff, {29{d1stg_dblop}}})
		| ({53{div_norm_zero}}
			    & 53'h00000000000000)));

dff_s #(53) i_div_norm_inv (
	.din	(div_norm_inv_in[52:0]),
	.clk	(clk),

	.q	(div_norm_inv[52:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_norm[52:0]= (~div_norm_inv);


///////////////////////////////////////////////////////////////////////////////
//
//	Divide lead zero count.
//
///////////////////////////////////////////////////////////////////////////////


fpu_cnt_lead0_53b i_div_lead0 (
	.din	(div_norm[52:0]),

	.lead0 (div_lead0[5:0])
);

dff_s #(12) i_dstg_xtra_regs (
        .din    ({div_lead0[5:0], div_lead0[5:0]}),
        .clk    (clk),

        .q      ({div_shl_cnta[5:0], div_shl_cnt[5:0]}),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide left shift.
//
///////////////////////////////////////////////////////////////////////////////

dff_s #(53) i_div_shl_data (
	.din	(div_norm[52:0]),
	.clk    (clk),

        .q      (div_shl_data[52:0]),

	.se     (se),
        .si     (),
        .so     ()
);

//assign div_shl_tmp[105:0]= {div_shl_data[52:0], 53'b0} << div_shl_cnta[5:0];
  assign div_shl_tmp[105:53]= div_shl_data[52:0]         << div_shl_cnta[5:0];

assign div_shl[52:0]= div_shl_tmp[105:53];

dffe_s #(55) i_div_shl_save (
	.din	({2'b0, div_shl[52:0]}),
	.en	(d3stg_fdiv),
        .clk    (clk),
 
        .q      (div_shl_save[54:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

assign div_frac_add_in2_in[54:0]= ({55{d4stg_fdiv}}
			    & (~{2'b0, div_shl[52:0]}))
		| ({55{d6stg_fdiv}}
			    & {25'b0, d6stg_fdivs, 28'b0, d6stg_fdivd});

dffe_s #(55) i_div_frac_add_in2 (
	.din	(div_frac_add_in2_in[54:0]),
	.en	(div_frac_add_in2_load),
	.clk    (clk),

        .q      (div_frac_add_in2[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide adder/subtractor 2nd input.
//
///////////////////////////////////////////////////////////////////////////////

assign d6stg_frac[53:0]= ({54{d6stg_frac_out_shl1}}
			    & {div_frac_out[52:0], 1'b0})
		| ({54{d6stg_frac_out_nosh}}
			    & div_frac_out[53:0]);

assign d6stg_frac_0= d6stg_frac[0];
assign d6stg_frac_1= d6stg_frac[1];
assign d6stg_frac_2= d6stg_frac[2];
assign d6stg_frac_29= d6stg_frac[29];
assign d6stg_frac_30= d6stg_frac[30];
assign d6stg_frac_31= d6stg_frac[31];

assign div_frac_add_in1_in[54:0]= ({55{d4stg_fdiv}}
			    & div_shl_save[54:0])
		| ({55{(div_frac_add_in1_add && (!div_frac_add[54]))}}
			    & {div_frac_add[53:0], 1'b0})
		| ({55{(div_frac_add_in1_add && div_frac_add[54])}}
			    & {div_frac_add_in1[53:0], 1'b0})
		| ({55{d6stg_fdiv}}
			    & {3'b0, d6stg_frac[53:31],
				(d6stg_frac[30:2] & {29{d6stg_fdivd}})});

dffe_s #(55) i_div_frac_add_in1 (
	.din	(div_frac_add_in1_in[54:0]),
	.en	(div_frac_add_in1_load),
	.clk    (clk),

        .q      (div_frac_add_in1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_div_frac_add_in1a (
	.din	(div_frac_add_in1_in[54:0]),
	.en	(div_frac_add_in1_load),
	.clk	(clk),

	.q	(div_frac_add_in1a[54:0]),

	.se	(se),
	.si	(),
	.so	()
);

assign div_frac_add_in1_neq_0= (|div_frac_add_in1[54:0]);


///////////////////////////////////////////////////////////////////////////////
//
//      Divide adder/subtractor.
//
///////////////////////////////////////////////////////////////////////////////

assign div_frac_add[54:0]= (div_frac_add_in1a[54:0]
			+ div_frac_add_in2[54:0]
			+ {54'b0, d5stg_fdivb});

assign div_frac_add_52_inv= (!div_frac_add[52]);
assign div_frac_add_52_inva= (!div_frac_add[52]);

assign div_frac_out_in[54:0]= ({55{d4stg_fdiv}}
			    & 55'b0)
		| ({55{div_frac_out_add_in1}}
			    & div_frac_add_in1[54:0])
		| ({55{div_frac_out_add}}
			    & div_frac_add[54:0])
		| ({55{div_frac_out_shl1_dbl}}
			    & {div_frac_out[53:0], (!div_frac_add[54])})
		| ({55{div_frac_out_shl1_sng}}
			    & {div_frac_out[53:29], (!div_frac_add[54]), 29'b0})
		| ({55{div_frac_out_of}}
			    & {55{d7stg_to_0}});

dffe_s #(55) i_div_frac_out (
	.din	(div_frac_out_in[54:0]),
	.en	(div_frac_out_load),
	.clk    (clk),

        .q      (div_frac_out[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

assign div_frac_out_54_53[1:0] = div_frac_out[54:53];

assign div_frac_outa[51:0]= div_frac_out[51:0];

endmodule


