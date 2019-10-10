// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: fpu_mul_exp_dp.v
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
//	Multiply pipeline exponent datapath.
//
//  Patches by    : John Li
///////////////////////////////////////////////////////////////////////////////
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif


module fpu_mul_exp_dp (
	inq_in1,
	inq_in2,
	m6stg_step,
	m1stg_dblop,
	m1stg_sngop,
	m2stg_exp_expadd,
	m2stg_exp_0bff,
	m2stg_exp_017f,
	m2stg_exp_04ff,
	m2stg_exp_zero,
	m1stg_fsmuld,
	m2stg_fmuld,
	m2stg_fmuls,
	m2stg_fsmuld,
	m3stg_ld0_inv,
	m5stg_fracadd_cout,
	mul_exp_out_exp_plus1,
	mul_exp_out_exp,
	m5stg_in_of,
	m5stg_fmuld,
	m5stg_to_0_inv,
	m4stg_shl_54,
	m4stg_shl_55,
	m4stg_inc_exp_54,
	m4stg_inc_exp_55,
	m4stg_inc_exp_105,
	fmul_clken_l,
	rclk,
	
	m3stg_exp,
	m3stg_expadd_eq_0,
	m3stg_expadd_lte_0_inv,
	m4stg_exp,
	m5stg_exp,
	mul_exp_out,

	se,
	si,
	so
);


input [62:52]	inq_in1;		// request operand 1 to op pipes
input [62:52]	inq_in2;		// request operand 2 to op pipes
input		m6stg_step;		// advance the multiply pipe
input		m1stg_dblop;		// double precision operation- mul 1 stg
input		m1stg_sngop;		// single precision operation- mul 1 stg
input		m2stg_exp_expadd;	// select line to m2stg_exp
input		m2stg_exp_0bff;		// select line to m2stg_exp
input		m2stg_exp_017f;		// select line to m2stg_exp
input		m2stg_exp_04ff;		// select line to m2stg_exp
input		m2stg_exp_zero;		// select line to m2stg_exp
input		m1stg_fsmuld;		// fsmuld- multiply 1 stage
input		m2stg_fmuld;		// fmuld- multiply 2 stage
input		m2stg_fmuls;		// fmuls- multiply 2 stage
input		m2stg_fsmuld;		// fsmuld- multiply 2 stage
input [6:0]	m3stg_ld0_inv;		// leading 0's in multiply operands
input           m4stg_inc_exp_54;       // select line to m5stg_exp
input           m4stg_inc_exp_55;       // select line to m5stg_exp
input           m4stg_inc_exp_105;      // select line to m5stg_exp
input		m5stg_fracadd_cout;	// fraction rounding adder carry out
input		mul_exp_out_exp_plus1;	// select line to mul_exp_out
input		mul_exp_out_exp;	// select line to mul_exp_out
input		m5stg_in_of;		// multiply overflow- select exp out
input		m5stg_fmuld;		// fmuld- multiply 5 stage
input		m5stg_to_0_inv;		// result to infinity on overflow
input		m4stg_shl_54;		// multiply shift left output bit[54]
input		m4stg_shl_55;		// multiply shift left output bit[55]
input		fmul_clken_l;           // multiply pipe clk enable - asserted low
input		rclk; 		// global clock

output [12:0]	m3stg_exp;		// exponent input- multiply 3 stage
output		m3stg_expadd_eq_0;	// mul stage 3 exponent adder sum == 0
output		m3stg_expadd_lte_0_inv;	// mul stage 3 exponent adder sum <= 0
output [12:0]	m4stg_exp;		// exponent input- multiply 4 stage
output [12:0]	m5stg_exp;		// exponent input- multiply 5 stage
output [10:0]	mul_exp_out;		// multiply exponent output

input           se;                     // scan_enable
input           si;                     // scan in
output          so;                     // scan out


wire [10:0]	m1stg_exp_in1;
wire [10:0]	m1stg_exp_in2;
wire [12:0]	m1stg_expadd_in1;
wire [12:0]	m1stg_expadd_in2;
wire [12:0]	m1stg_expadd;
wire [12:0]	m2stg_exp_in;
wire [12:0]	m2stg_exp;
wire [12:0]	m2stg_expadd_in2;
wire [12:0]	m2stg_expadd;
wire [12:0]	m3astg_exp;
wire [12:0]	m3bstg_exp;
wire [12:0]	m3stg_exp;
wire [12:0]	m3stg_expa;
wire [12:0]	m3stg_expadd;
wire		m3stg_expadd_eq_0;
wire		m3stg_expadd_lte_0_inv;
wire [12:0]	m4stg_exp_in;
wire [12:0]	m4stg_exp;
wire [12:0]	m4stg_exp_plus1;
wire [12:0]	m5stg_exp_pre1_in;
wire [12:0]	m5stg_exp_pre1;
wire [12:0]	m5stg_exp_pre2_in;
wire [12:0]	m5stg_exp_pre2;
wire [12:0]	m5stg_exp_pre3_in;
wire [12:0]	m5stg_exp_pre3;
wire [12:0]	m5stg_exp;
wire [12:0]	m5stg_expa;
wire [12:0]	m5stg_exp_plus1;
wire [10:0]	mul_exp_out_in;
wire [10:0]	mul_exp_out;


wire se_l;

//Previously missing wires
wire        clk;
wire        m5stg_shl_55;
wire        m5stg_shl_54;
wire        m5stg_inc_exp_54;
wire        m5stg_inc_exp_55;
wire        m5stg_inc_exp_105;


assign se_l = ~se;

`ifdef FPGA_SYN_CLK_DFF
    assign clk = rclk;
`else
    clken_buf  ckbuf_mul_exp_dp (
      .clk(clk),
      .rclk(rclk),
      .enb_l(fmul_clken_l),
      .tmb_l(se_l)
      );
`endif

///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exponent inputs.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(11) i_m1stg_exp_in1 (
        .din    (inq_in1[62:52]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (m1stg_exp_in1[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(11) i_m1stg_exp_in2 (
        .din    (inq_in2[62:52]),
        .en     (m6stg_step),
        .clk    (clk),
 
        .q      (m1stg_exp_in2[10:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//	Multiply exponent adder.
//
//	Multiply stage 1.
//
///////////////////////////////////////////////////////////////////////////////

assign m1stg_expadd_in1[12:0]= ({13{m1stg_dblop}}
			    & {2'b0, m1stg_exp_in1[10:0]})
		| ({13{m1stg_sngop}}
			    & {5'b0, m1stg_exp_in1[10:3]});

assign m1stg_expadd_in2[12:0]= ({13{m1stg_dblop}}
                            & {2'b0, m1stg_exp_in2[10:0]})
                | ({13{m1stg_sngop}}
                            & {5'b0, m1stg_exp_in2[10:3]});

assign m1stg_expadd[12:0]= (m1stg_expadd_in1[12:0]
			+ m1stg_expadd_in2[12:0]
			+ 13'h0001);

assign m2stg_exp_in[12:0]= ({13{m2stg_exp_expadd}}
			    & m1stg_expadd[12:0])
		| ({13{m2stg_exp_0bff}}
			    & 13'h0bff)
		| ({13{m2stg_exp_017f}}
			    & 13'h017f)
		| ({13{m2stg_exp_04ff}}
			    & 13'h04ff)
		| ({13{m2stg_exp_zero}}
			    & {{3{m1stg_fsmuld}}, 10'b0});

dffe_s #(13) i_m2stg_exp (
	.din	(m2stg_exp_in[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m2stg_exp[12:0]),

	.se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent adder.
//
//      Multiply stage 2.
//
///////////////////////////////////////////////////////////////////////////////

assign m2stg_expadd_in2[12:0]= ({13{m2stg_fmuld}}
			    & 13'h1c00)
		| ({13{m2stg_fmuls}}
			    & 13'h1f80)
		| ({13{m2stg_fsmuld}}
			    & 13'h0300);

assign m2stg_expadd[12:0]= m2stg_exp[12:0]
			+ m2stg_expadd_in2[12:0];

dffe_s #(13) i_m3astg_exp (
	.din	(m2stg_expadd[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m3astg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent.
//
//      Multiply stage 3a.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(13) i_m3bstg_exp (
        .din    (m3astg_exp[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m3bstg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent.
//
//      Multiply stage 3b.
//
///////////////////////////////////////////////////////////////////////////////

dffe_s #(13) i_m3stg_exp (
        .din    (m3bstg_exp[12:0]),
        .en     (m6stg_step),
        .clk    (clk),

        .q      (m3stg_exp[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);

dffe_s #(13) i_m3stg_expa (
	.din	(m3bstg_exp[12:0]),
	.en	(m6stg_step),
	.clk	(clk),

	.q	(m3stg_expa[12:0]),

	.se	(se),
	.si	(),
  	.so	()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent adder.
//
//      Multiply stage 3.
//
///////////////////////////////////////////////////////////////////////////////

assign m3stg_expadd[12:0]= (m3stg_expa[12:0]
			+ {6'h3f, m3stg_ld0_inv[6:0]}
			+ 13'h0001);

assign m3stg_expadd_eq_0= (&(m3stg_exp[12:0] ^ {6'h3f, m3stg_ld0_inv[6:0]}));

assign m3stg_expadd_lte_0_inv= (!(m3stg_expadd[12] || m3stg_expadd_eq_0));

assign m4stg_exp_in[12:0]= (m3stg_expadd[12:0] & {13{(!m3stg_expadd[12])}});

dffe_s #(13) i_m4stg_exp (
        .din    (m4stg_exp_in[12:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (m4stg_exp[12:0]),

        .se     (se),
        .si     (),
        .so     ()
);


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply exponent increment.
//
//      Multiply stage 4.
//
///////////////////////////////////////////////////////////////////////////////

assign m4stg_exp_plus1[12:0]= m4stg_exp[12:0]
			+ 13'h0001;


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m5stg_exp_pre1_in[12:0]= (~({13{m4stg_inc_exp}}
//			    & m4stg_exp_plus1[12:0]));

assign m5stg_exp_pre1_in[12:0]= ( ({13{m6stg_step}}
			    & m4stg_exp_plus1[12:0]));

dff_s #(13) i_m5stg_exp_pre1 (
	.din	(m5stg_exp_pre1_in[12:0]),
	.clk    (clk),
 
        .q      (m5stg_exp_pre1[12:0]),
 
        .se     (se),
        .si     (),
        .so     ()
);


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

// assign m5stg_exp_pre2_in[12:0]= (~({13{m4stg_inc_exp_inv}}
//			    & m4stg_exp[12:0]));

assign m5stg_exp_pre2_in[12:0]= ( ({13{m6stg_step}}
			    & m4stg_exp[12:0]));

dff_s #(13) i_m5stg_exp_pre2 (
	.din	(m5stg_exp_pre2_in[12:0]),
	.clk	(clk),

	.q	(m5stg_exp_pre2[12:0]),

	.se	(se),
	 .si	(),
	.so	()
);

assign m5stg_exp_pre3_in[12:0]= (~({13{(!m6stg_step)}}
			    & m5stg_expa[12:0]));

dff_s #(13) i_m5stg_exp_pre3 (
	.din	(m5stg_exp_pre3_in[12:0]),
	.clk	(clk),

	.q	(m5stg_exp_pre3[12:0]),

	.se	(se),
	 .si	(),
	.so	()
);


// Austin update
// uarch timing fix
// Endpoint: fpu_mul_exp_dp/i_m5stg_exp_pre2_10

//assign m5stg_exp[12:0]= (~m5stg_exp_pre1[12:0])
//		| (~m5stg_exp_pre2[12:0])
//		| (~m5stg_exp_pre3[12:0]);

dff_s #(5) i_m5stg_inc_exp (
	.din	({m4stg_shl_55,m4stg_shl_54,
                  m4stg_inc_exp_54,m4stg_inc_exp_55,m4stg_inc_exp_105}),
	.clk	(clk),

	.q	({m5stg_shl_55,m5stg_shl_54,
                  m5stg_inc_exp_54,m5stg_inc_exp_55,m5stg_inc_exp_105}),

	.se	(se),
	.si	(),
	.so	()
);

assign m5stg_exp[12:0] =

          ( {13{((m5stg_shl_54 & m5stg_inc_exp_54) |
                 (m5stg_shl_55 & m5stg_inc_exp_55) |
                 (m5stg_inc_exp_105)                )}} & m5stg_exp_pre1[12:0]) |

          (~{13{((m5stg_shl_54 & m5stg_inc_exp_54) |
                 (m5stg_shl_55 & m5stg_inc_exp_55) |
                 (m5stg_inc_exp_105)                )}} & m5stg_exp_pre2[12:0]) |

         ~(m5stg_exp_pre3[12:0]);


assign m5stg_expa[12:0]= m5stg_exp[12:0];


///////////////////////////////////////////////////////////////////////////////
//
//      Multiply rounding.
//      Multiply stage 5.
//
///////////////////////////////////////////////////////////////////////////////
 
assign m5stg_exp_plus1[12:0]= m5stg_expa[12:0]
                        + 13'h0001;

assign mul_exp_out_in[10:0]= ({11{(mul_exp_out_exp_plus1
					&& m5stg_fracadd_cout)}}
			    & m5stg_exp_plus1[10:0])
		| ({11{mul_exp_out_exp}}
			    & m5stg_expa[10:0])
		| ({11{((!m5stg_fracadd_cout) && (!m5stg_in_of))}}
			    & m5stg_expa[10:0])
		| ({11{m5stg_in_of}}
			    & {{3{m5stg_fmuld}}, 7'h7f, m5stg_to_0_inv});


dffe_s #(11) i_mul_exp_out (
	.din	(mul_exp_out_in[10:0]),
	.en     (m6stg_step),
        .clk    (clk),

        .q      (mul_exp_out[10:0]),

	.se     (se),
        .si     (),
        .so     ()
);


endmodule


