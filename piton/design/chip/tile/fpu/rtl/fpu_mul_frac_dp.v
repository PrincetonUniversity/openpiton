// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_frac_dp.v
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
//	Multiply pipeline fraction datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module fpu_mul_frac_dp (
	inq_in1,
	inq_in2,
	m6stg_step,
	m2stg_frac1_dbl_norm,
	m2stg_frac1_dbl_dnrm,
	m2stg_frac1_sng_norm,
	m2stg_frac1_sng_dnrm,
	m2stg_frac1_inf,
	m1stg_snan_dbl_in1,
	m1stg_snan_sng_in1,
	m2stg_frac2_dbl_norm,
	m2stg_frac2_dbl_dnrm,
	m2stg_frac2_sng_norm,
	m2stg_frac2_sng_dnrm,
	m2stg_frac2_inf,
	m1stg_snan_dbl_in2,
	m1stg_snan_sng_in2,
	m1stg_inf_zero_in,
	m1stg_inf_zero_in_dbl,
	m1stg_dblop,
	m1stg_dblop_inv,
	m4stg_frac,
	m4stg_sh_cnt_in,
	m3bstg_ld0_inv,
	m4stg_left_shift_step,
	m4stg_right_shift_step,
	m5stg_fmuls,
	m5stg_fmulda,
	mul_frac_out_fracadd,
	mul_frac_out_frac,
	m5stg_in_of,
	m5stg_to_0,
	fmul_clken_l,
	rclk,
	
	m2stg_frac1_array_in,
	m2stg_frac2_array_in,
	m1stg_ld0_1,
	m1stg_ld0_2,
	m4stg_frac_105,
	m3stg_ld0_inv,
	m4stg_shl_54,
	m4stg_shl_55,
	m5stg_frac_32_0,
	m5stg_frac_dbl_nx,
	m5stg_frac_sng_nx,
	m5stg_frac_neq_0,
	m5stg_fracadd_cout,
	mul_frac_out,

	se,
	si,
	so
);


input [54:0]	inq_in1;		// request operand 1 to op pipes
input [54:0]	inq_in2;		// request operand 2 to op pipes
input		m6stg_step;		// advance the multiply pipe
input		m2stg_frac1_dbl_norm;	// select line to m2stg_frac1
input		m2stg_frac1_dbl_dnrm;	// select line to m2stg_frac1
input		m2stg_frac1_sng_norm;	// select line to m2stg_frac1
input		m2stg_frac1_sng_dnrm;	// select line to m2stg_frac1
input		m2stg_frac1_inf;	// select line to m2stg_frac1
input		m1stg_snan_dbl_in1;	// operand 1 is double signalling NaN
input		m1stg_snan_sng_in1;	// operand 1 is single signalling NaN
input		m2stg_frac2_dbl_norm;	// select line to m2stg_frac2
input		m2stg_frac2_dbl_dnrm;	// select line to m2stg_frac2
input		m2stg_frac2_sng_norm;	// select line to m2stg_frac2
input		m2stg_frac2_sng_dnrm;	// select line to m2stg_frac2
input		m2stg_frac2_inf;	// select line to m2stg_frac2
input		m1stg_snan_dbl_in2;	// operand 2 is double signalling NaN
input		m1stg_snan_sng_in2;	// operand 2 is single signalling NaN
input		m1stg_inf_zero_in;	// 1 operand is infinity; other is 0
input		m1stg_inf_zero_in_dbl;	// 1 opnd is infinity; other is 0- dbl
input		m1stg_dblop;		// double precision operation- mul 1 stg
input		m1stg_dblop_inv;	// single or int operation- mul 1 stg
input [105:0]	m4stg_frac;		// multiply array output
input [5:0]	m4stg_sh_cnt_in;	// multiply normalization shift count
input [6:0]	m3bstg_ld0_inv;		// leading 0's in multiply operands
input		m4stg_left_shift_step;	// select line to m5stg_frac
input		m4stg_right_shift_step;	// select line to m5stg_frac
input		m5stg_fmuls;		// fmuls- multiply 5 stage
input		m5stg_fmulda;		// fmuld- multiply 5 stage
input		mul_frac_out_fracadd;	// select line to mul_frac_out
input		mul_frac_out_frac;	// select line to mul_frac_out
input		m5stg_in_of;		// multiply overflow- select exp out
input		m5stg_to_0;		// result to max finite on overflow
input		fmul_clken_l;           // multiply pipe clk enable - asserted low
input		rclk;		// global clock

output [52:0]	m2stg_frac1_array_in;	// multiply array input 1
output [52:0]	m2stg_frac2_array_in;	// multiply array input 2
output [5:0]	m1stg_ld0_1;		// denorm operand 1 leading 0's
output [5:0]	m1stg_ld0_2;		// denorm operand 2 leading 0's
output		m4stg_frac_105;		// multiply stage 4a fraction input[105]
output [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
output		m4stg_shl_54;		// multiply shift left output bit[54]
output		m4stg_shl_55;		// multiply shift left output bit[55]
output [32:0]	m5stg_frac_32_0;	// multiply stage 5 fraction input
output		m5stg_frac_dbl_nx;	// double precision inexact result
output		m5stg_frac_sng_nx;	// single precision inexact result
output		m5stg_frac_neq_0;	// fraction input to mul 5 stage != 0
output		m5stg_fracadd_cout;	// fraction rounding adder carry out
output [51:0]	mul_frac_out;		// multiply fraction output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [54:0]	mul_frac_in1;
wire [54:0]	mul_frac_in2;
wire [52:0]	m2stg_frac1_in;
wire [52:0]	m2stg_frac1_array_in;
wire [52:0]	m2stg_frac2_in;
wire [52:0]	m2stg_frac2_array_in;
wire [52:0]	m1stg_ld0_1_din;
wire [5:0]	m1stg_ld0_1;
wire [52:0]	m1stg_ld0_2_din;
wire [5:0]	m1stg_ld0_2;
wire		m4stg_frac_105;
wire [5:0]	m4stg_sh_cnt_5;
wire [5:0]	m4stg_sh_cnt_4;
wire [5:0]	m4stg_sh_cnt;
wire [6:0]	m3stg_ld0_inv;
wire [168:63]	m4stg_shl_tmp;
wire [55:0]	m4stg_shl;
wire		m4stg_shl_54;
wire		m4stg_shl_55;

// 2/18/03: Changed to 225:0 (for easier LEC matching plus closer to implementation)
// wire [219:0]	m4stg_shr_tmp;
wire [168:0]	m4stg_shr_tmp;

wire [55:0]	m4stg_shr;
wire [54:0]	m5stg_frac_pre1_in;
wire [54:0]	m5stg_frac_pre1;
wire [54:0]	m5stg_frac_pre2_in;
wire [54:0]	m5stg_frac_pre2;
wire [54:0]	m5stg_frac_pre3_in;
wire [54:0]	m5stg_frac_pre3;
wire [54:0]	m5stg_frac_pre4_in;
wire [54:0]	m5stg_frac_pre4;
wire [54:33]	m5stg_frac_54_33;
wire [32:0]	m5stg_frac_32_0;
wire [54:3]	m5stg_fraca;
wire [54:0]	m5stg_fracb;
wire		m5stg_frac_dbl_nx;
wire		m5stg_frac_sng_nx;
wire		m5stg_frac_neq_0;
wire [52:0]	m5stg_fracadd_tmp;
wire		m5stg_fracadd_cout;
wire [51:0]	m5stg_fracadd;
wire [51:0]	mul_frac_out_in;
wire [51:0]	mul_frac_out;
wire [30:0] mstg_xtra_regs;

wire se_l;

//Previously missed wires
wire        clk;

assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_mul_frac_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fmul_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//	Multiply fraction inputs.
//
//	Multiply input stage.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(55) i_mul_frac_in1 (
        .din    (inq_in1[54:0]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (mul_frac_in1[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(55) i_mul_frac_in2 (
        .din    (inq_in2[54:0]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (mul_frac_in2[54:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply normalization and special input injection.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_frac1_in[52:0]= ({53{m2stg_frac1_dbl_norm}}
			    & {1'b1, (mul_frac_in1[51] || m1stg_snan_dbl_in1),
				mul_frac_in1[50:0]})
		| ({53{m2stg_frac1_dbl_dnrm}}
                            & {mul_frac_in1[51:0], 1'b0})
                | ({53{m2stg_frac1_sng_norm}}
                            & {1'b1, (mul_frac_in1[54] || m1stg_snan_sng_in1),
                                mul_frac_in1[53:32], 29'b0})
                | ({53{m2stg_frac1_sng_dnrm}}
                            & {mul_frac_in1[54:32], 30'b0})
		| ({53{m2stg_frac1_inf}}
			    & 53'h10000000000000);

assign m2stg_frac1_array_in[52:0]= (~m2stg_frac1_in[52:0]);

assign m2stg_frac2_in[52:0]= ({53{m2stg_frac2_dbl_norm}}
                            & {1'b1, (mul_frac_in2[51] || m1stg_snan_dbl_in2),
                                mul_frac_in2[50:0]})
                | ({53{m2stg_frac2_dbl_dnrm}}
                            & {mul_frac_in2[51:0], 1'b0})
                | ({53{m2stg_frac2_sng_norm}}
                            & {1'b1, (mul_frac_in2[54] || m1stg_snan_sng_in2),
                                mul_frac_in2[53:32], 29'b0})
                | ({53{m2stg_frac2_sng_dnrm}}
                            & {mul_frac_in2[54:32], 30'b0})
                | ({53{m2stg_frac2_inf}}
			    & {1'b1, {23{m1stg_inf_zero_in}},
					{29{m1stg_inf_zero_in_dbl}}});
 
assign m2stg_frac2_array_in[52:0]= m2stg_frac2_in[52:0];


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply leading 0 counts.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_ld0_1_din[52:0]= ({53{m1stg_dblop_inv}}
			    & {mul_frac_in1[54:32], 30'b0})
		| ({53{m1stg_dblop}}
			    & {mul_frac_in1[51:0], 1'b0});

fpu_cnt_lead0_53b i_m1stg_ld0_1 (
	.din	(m1stg_ld0_1_din[52:0]),

	.lead0	(m1stg_ld0_1[5:0])
);

assign m1stg_ld0_2_din[52:0]= ({53{m1stg_dblop_inv}}
			    & {mul_frac_in2[54:32], 30'b0})
		| ({53{m1stg_dblop}}
			    & {mul_frac_in2[51:0], 1'b0});

fpu_cnt_lead0_53b i_m1stg_ld0_2 (
	.din	(m1stg_ld0_2_din[52:0]),

	.lead0	(m1stg_ld0_2[5:0])
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply shifts for post-normalization/denormalization.
//
//	Multiply stage 4a.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_frac_105= m4stg_frac[105];

dffe_s #(56) i_mstg_xtra_regs (
	.din	({{6{m4stg_sh_cnt_in[5]}}, 
			{6{m4stg_sh_cnt_in[4]}},
			m4stg_sh_cnt_in[5:0],
			m3bstg_ld0_inv[6:0],
			31'h0000_0000}),
	.en     (m6stg_step),
        .clk    (clk),

	.q	({m4stg_sh_cnt_5[5:0],
			m4stg_sh_cnt_4[5:0],
			m4stg_sh_cnt[5:0],
			m3stg_ld0_inv[6:0],
			mstg_xtra_regs[30:0]}),
	.se     (se),
        .si     (),
        .so     ()
);

//assign m4stg_shl_tmp[168:0]= {m4stg_frac[105:0], 63'b0}
//		<< {m4stg_sh_cnt_5[0], m4stg_sh_cnt[4:0]};

  assign m4stg_shl_tmp[168:63]=  m4stg_frac[105:0]
		<< {m4stg_sh_cnt_5[0], m4stg_sh_cnt[4:0]};

assign m4stg_shl[55:0]= {m4stg_shl_tmp[168:114], (|m4stg_shl_tmp[113:63])};
assign m4stg_shl_54= m4stg_shl[54];

assign m4stg_shl_55= m4stg_shl[55];

// 2/18/03: changed below to match implementation plus easier LEC
// assign m4stg_shr_tmp[219:0]= {57'b0, m4stg_frac[105:0], 57'b0} 
// 						>> m4stg_sh_cnt[5:0];
// assign m4stg_shr[55:0]= {m4stg_shr_tmp[162:108], (|m4stg_shr_tmp[107:0])};

//assign m4stg_shr_tmp[225:0]= {57'b0, m4stg_frac[105:0], 63'b0} >> m4stg_sh_cnt[5:0];
  assign m4stg_shr_tmp[168:0]= {       m4stg_frac[105:0], 63'b0} >> m4stg_sh_cnt[5:0];


assign m4stg_shr[55:0]= {m4stg_shr_tmp[168:114], (|m4stg_shr_tmp[113:0])};


///////////////////////////////////////////////////////////////////////////////
//
//	Select post-normalization or denormalization result.
//
//	Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre1_in[54:0]= ({55{(m4stg_left_shift_step && m4stg_shl[55])}}
//           & m4stg_shl[54:0])
//     | ({55{(!m6stg_step)}}
//           & m5stg_fracb[54:0]);

assign m5stg_frac_pre1_in[54:0]= ~(({55{(m4stg_left_shift_step && m4stg_shl[55])}}
			    & m4stg_shl[54:0])
		| ({55{(!m6stg_step)}}
			    & m5stg_fracb[54:0]));

dff_s #(55) i_m5stg_frac_pre1 (
	.din	(m5stg_frac_pre1_in[54:0]),
	.clk    (clk),

        .q      (m5stg_frac_pre1[54:0]),

	.se     (se),
        .si     (),
        .so     ()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre2_in[54:0]= ({55{(m4stg_left_shift_step
//           && (!m4stg_shl[55]))}}
//           & {m4stg_shl[53:0], 1'b0});


assign m5stg_frac_pre2_in[54:0]= ~({55{(m4stg_left_shift_step
					&& (!m4stg_shl[55]))}}
			    & {m4stg_shl[53:0], 1'b0});

dff_s #(55) i_m5stg_frac_pre2 (
	.din	(m5stg_frac_pre2_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre2[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre3_in[54:0]= ({55{(m4stg_right_shift_step
//           && m4stg_shr[55])}}
//           & m4stg_shr[54:0]);

assign m5stg_frac_pre3_in[54:0]= ~({55{(m4stg_right_shift_step
					&& m4stg_shr[55])}}
			    & m4stg_shr[54:0]);

dff_s #(55) i_m5stg_frac_pre3 (
	.din	(m5stg_frac_pre3_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre3[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of and) to reflect implementation and easier LEC
// assign m5stg_frac_pre4_in[54:0]= ({55{(m4stg_right_shift_step
//           && (!m4stg_shr[55]))}}
//           & {m4stg_shr[53:0], 1'b0});

assign m5stg_frac_pre4_in[54:0]= ~({55{(m4stg_right_shift_step
					&& (!m4stg_shr[55]))}}
			    & {m4stg_shr[53:0], 1'b0});

dff_s #(55) i_m5stg_frac_pre4 (
	.din	(m5stg_frac_pre4_in[54:0]),
	.clk	(clk),

	.q	(m5stg_frac_pre4[54:0]),

	.se	(se),
		.si	(),
	.so	()
);

// 2/18/03: Inverted the logic (nand instead of or) to reflect implementation and easier LEC
// assign m5stg_frac[54:0]= (m5stg_frac_pre1[54:0]
//     | m5stg_frac_pre2[54:0]
//     | m5stg_frac_pre3[54:0]
//     | m5stg_frac_pre4[54:0]);

assign {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:0]} = ~(m5stg_frac_pre1[54:0]
		& m5stg_frac_pre2[54:0]
		& m5stg_frac_pre3[54:0]
		& m5stg_frac_pre4[54:0]);


assign m5stg_fraca[54:3]= {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:3]};

assign m5stg_fracb[54:0]= {m5stg_frac_54_33[54:33], m5stg_frac_32_0[32:0]};


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply rounding.
//
//	Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////

assign m5stg_frac_dbl_nx= (|m5stg_fracb[2:0]);

assign m5stg_frac_sng_nx= m5stg_frac_dbl_nx || (|m5stg_fracb[31:3]);

assign m5stg_frac_neq_0= m5stg_frac_sng_nx || (|m5stg_fracb[54:32]);

assign m5stg_fracadd_tmp[52:0]= {1'b0, m5stg_fraca[54:3]}
			+ {23'b0, m5stg_fmuls, 28'b0, m5stg_fmulda};

assign m5stg_fracadd_cout= m5stg_fracadd_tmp[52];

assign m5stg_fracadd[51:0]= m5stg_fracadd_tmp[51:0];

assign mul_frac_out_in[51:0]= ({52{mul_frac_out_fracadd}}
			    & m5stg_fracadd[51:0])
		| ({52{mul_frac_out_frac}}
			    & m5stg_fracb[54:3])
		| ({52{m5stg_in_of}}
			    & {52{m5stg_to_0}});

dffe_s #(52) i_mul_frac_out (
	.din	(mul_frac_out_in[51:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (mul_frac_out[51:0]),

	.se     (se),
        .si     (),
        .so     ()
);

endmodule


