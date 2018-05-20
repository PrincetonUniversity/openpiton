// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_clib.v
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
///////////////////////////////////////////////////////////////////////
/*
//
//  Module Name: swrvr_clib.v
//      Description: Design control behavioural library
*/                 

`ifdef PITON_PROTO 
`define NO_SCAN 
`endif

// POSITVE-EDGE TRIGGERED FLOP with SCAN
module dff_s (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

`ifdef NO_SCAN
always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;
`else

always @ (posedge clk)

	q[SIZE-1:0]  <= (se) ? si[SIZE-1:0]  : din[SIZE-1:0] ;

assign so[SIZE-1:0] = q[SIZE-1:0] ;

`endif

endmodule // dff_s

// POSITVE-EDGE TRIGGERED FLOP with SCAN for Shadow-scan
module dff_sscan (din, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

`ifdef CONNECT_SHADOW_SCAN

always @ (posedge clk)

	q[SIZE-1:0]  <= (se) ? si[SIZE-1:0]  : din[SIZE-1:0] ;

assign so[SIZE-1:0] = q[SIZE-1:0] ;

`else
always @ (posedge clk)
  q[SIZE-1:0]  <= din[SIZE-1:0] ;

assign so={SIZE{1'b0}};
`endif

endmodule // dff_sscan

// POSITVE-EDGE TRIGGERED FLOP without SCAN
module dff_ns (din, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)

	q[SIZE-1:0]  <= din[SIZE-1:0] ;

endmodule // dff_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET
module dffr_s (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

`ifdef NO_SCAN
always @ (posedge clk)
	q[SIZE-1:0]  <= ((rst) ? {SIZE{1'b0}}  : din[SIZE-1:0] );
`else

// Scan-Enable dominates
always @ (posedge clk)

	q[SIZE-1:0]  <= se ? si[SIZE-1:0] : ((rst) ? {SIZE{1'b0}}  : din[SIZE-1:0] );

assign so[SIZE-1:0] = q[SIZE-1:0] ;
`endif

endmodule // dffr_s

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, RESET_L
module dffrl_s (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk or scan clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

`ifdef NO_SCAN
always @ (posedge clk)
	q[SIZE-1:0]  <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};
`else

// Reset dominates
always @ (posedge clk)

	q[SIZE-1:0]  <= rst_l ? ((se) ? si[SIZE-1:0]  : din[SIZE-1:0] ) : {SIZE{1'b0}};

assign so[SIZE-1:0] = q[SIZE-1:0] ;
`endif

endmodule // dffrl_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, without SCAN
module dffr_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];
   
endmodule // dffr_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, without SCAN
module dffrl_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			clk ;	// clk
input			rst_l ;	// reset

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? din[SIZE-1:0] : {SIZE{1'b0}};

endmodule // dffrl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN and FUNCTIONAL ENABLE
module dffe_s (din, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// en	se	out
//------------------
// x	1	sin ; scan dominates
// 1  	0	din
// 0 	0	q
//

`ifdef NO_SCAN
always @ (posedge clk)
	q[SIZE-1:0]  <= ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) ;
`else

always @ (posedge clk)

	q[SIZE-1:0]  <= (se) ? si[SIZE-1:0]  : ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) ;

assign so[SIZE-1:0] = q[SIZE-1:0] ;
`endif

endmodule // dffe_s

// POSITIVE-EDGE TRIGGERED FLOP with enable, without SCAN
module dffe_ns (din, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

always @ (posedge clk)
  q[SIZE-1:0] <= en ? din[SIZE-1:0] : q[SIZE-1:0];

endmodule // dffe_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET, FUNCTIONAL ENABLE, SCAN.
module dffre_s (din, rst, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 1	x	x	0   ; reset dominates
// 0	x	1	sin ; scan dominates
// 0	1  	0	din
// 0 	0 	0	q
//

`ifdef NO_SCAN
always @ (posedge clk)
	q[SIZE-1:0]  <= (rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) ;
`else

always @ (posedge clk)

//	q[SIZE-1:0]  <= rst ? {SIZE{1'b0}} : ((se) ? si[SIZE-1:0]  : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) ;
	q[SIZE-1:0]  <= se ? si[SIZE-1:0]  : (rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) ;

assign so[SIZE-1:0] = q[SIZE-1:0] ;

`endif

endmodule // dffre_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, FUNCTIONAL ENABLE, SCAN.
module dffrle_s (din, rst_l, en, clk, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk or scan clk

output	[SIZE-1:0]	q ;	// output

input			se ;	// scan-enable
input	[SIZE-1:0]	si ;	// scan-input
output	[SIZE-1:0]	so ;	// scan-output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	se	out
//------------------
// 0	x	x	0   ; reset dominates
// 1	x	1	sin ; scan dominates
// 1	1  	0	din
// 1 	0 	0	q
//

`ifdef NO_SCAN
always @ (posedge clk)
	 q[SIZE-1:0]  <= (rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}}) ;
`else

always @ (posedge clk)

//	q[SIZE-1:0]  <= rst_l ? ((se) ? si[SIZE-1:0]  : ((en) ? din[SIZE-1:0] : q[SIZE-1:0])) : {SIZE{1'b0}} ;
	q[SIZE-1:0]  <= se ? si[SIZE-1:0]  : (rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}}) ;

assign so[SIZE-1:0] = q[SIZE-1:0] ;
`endif

endmodule // dffrle_s

// POSITIVE-EDGE TRIGGERED FLOP with RESET, ENABLE, without SCAN.
module dffre_ns (din, rst, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 1	x	0   ; reset dominates
// 0	1  	din
// 0 	0 	q
//

// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : ((en) ? din[SIZE-1:0] : q[SIZE-1:0]);

endmodule // dffre_ns

// POSITIVE-EDGE TRIGGERED FLOP with RESET_L, ENABLE, without SCAN.
module dffrle_ns (din, rst_l, en, clk, q);
// synopsys template

parameter SIZE = 1;

input	[SIZE-1:0]	din ;	// data in
input			en ;	// functional enable
input			rst_l ;	// reset
input			clk ;	// clk

output	[SIZE-1:0]	q ;	// output

reg 	[SIZE-1:0]	q ;

// Enable Interpretation. Ultimate interpretation depends on design
// 
// rst	en	out
//------------------
// 0	x	0   ; reset dominates
// 1	1  	din
// 1 	0 	q
//

// synopsys sync_set_reset "rst_l"
always @ (posedge clk)
  q[SIZE-1:0] <= rst_l ? ((en) ? din[SIZE-1:0] : q[SIZE-1:0]) : {SIZE{1'b0}} ;

endmodule // dffrle_ns

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET
module dffr_async (din, clk, rst, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;

`ifdef NO_SCAN
always @ (posedge clk or posedge rst)
	q[SIZE-1:0]  <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];
`else

// Reset dominates
always @ (posedge clk or posedge rst)
  q[SIZE-1:0]  <= rst ? {SIZE{1'b0}} : ((se) ? si[SIZE-1:0]  : din[SIZE-1:0] );

assign so[SIZE-1:0] = q[SIZE-1:0] ;

`endif

endmodule // dffr_async

// POSITIVE-EDGE TRIGGERED FLOP with SCAN, and ASYNC RESET_L
module dffrl_async (din, clk, rst_l, q, se, si, so);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

input                   se ;    // scan-enable
input   [SIZE-1:0]      si ;    // scan-input
output  [SIZE-1:0]      so ;    // scan-output

reg     [SIZE-1:0]      q ;

`ifdef NO_SCAN
always @ (posedge clk or negedge rst_l)
	q[SIZE-1:0]  <= (!rst_l) ? {SIZE{1'b0}} : din[SIZE-1:0];
`else

// Reset dominates
always @ (posedge clk or negedge rst_l)
  q[SIZE-1:0]  <= (!rst_l) ? {SIZE{1'b0}} : ((se) ? si[SIZE-1:0]  : din[SIZE-1:0] );

assign so[SIZE-1:0] = q[SIZE-1:0] ;

`endif

endmodule // dffrl_async

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET, without SCAN
//module dffr_async_ns (din, clk, rst, q);
//// synopsys template
//parameter SIZE = 1;
//input   [SIZE-1:0]      din ;   // data in
//input                   clk ;   // clk or scan clk
//input                   rst ;   // reset
//output  [SIZE-1:0]      q ;     // output
//reg     [SIZE-1:0]      q ;
// Reset dominates
//// synopsys async_set_reset "rst"
//always @ (posedge clk or posedge rst)
//        if(rst) q[SIZE-1:0]  <= {SIZE{1'b0}};
//        else if(clk) q[SIZE-1:0]  <= din[SIZE-1:0];
//endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED FLOP with ASYNC RESET_L, without SCAN
module dffrl_async_ns (din, clk, rst_l, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst_l ;   // reset

output  [SIZE-1:0]      q ;     // output

// Reset dominates
// synopsys async_set_reset "rst_l"
 reg [SIZE-1:0] q;   
always @ (posedge clk or negedge rst_l)
  q[SIZE-1:0] <= ~rst_l ?  {SIZE{1'b0}} : ({SIZE{rst_l}} & din[SIZE-1:0]);

//   reg  [SIZE-1:0]   qm, qs, qm_l, qs_l, qm_f, qs_f;
//   wire              s_l;
//   assign            s_l = 1'b1;
//
//   always @ (rst_l or qm)   qm_l = ~(qm & {SIZE{rst_l}});
//   always @ (s_l or qs)   qs_l = ~(qs & {SIZE{s_l}});
//   always @ (s_l or qm_l) qm_f = ~(qm_l & {SIZE{s_l}});
//   always @ (rst_l or qs_l) qs_f = ~(qs_l & {SIZE{rst_l}});
//
//   always @ (clk or din or qm_f)
//      qm <= clk ? qm_f : din;
//
//   always @ (clk or qm_l or qs_f)
//      qs <= clk ? qm_l : qs_f;
//
//   assign q  = ~qs;

endmodule // dffrl_async_ns

// 2:1 MUX WITH DECODED SELECTS
module mux2ds (dout, in0, in1, sel0, sel1) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel0;
input			sel1;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

// priority encoding takes care of mutex'ing selects.
`ifdef VERPLEX
   $constraint cl_1h_chk2 ($one_hot ({sel1,sel0}));
`endif

wire [1:0] sel = {sel1, sel0}; // 0in one_hot
   
always @ (sel0 or sel1 or in0 or in1)

	case ({sel1,sel0}) // synopsys infer_mux
		2'b01 :	dout = in0 ;
		2'b10 : dout = in1 ;
		2'b11 : dout = {SIZE{1'bx}} ;
		2'b00 : dout = {SIZE{1'bx}} ;
			// 2'b00 : // E.g. 4state vs. 2state modelling.
			// begin
			//	`ifdef FOUR_STATE
			//		dout = {SIZE{1'bx}};
			//	`else
			//		begin
			//		dout = {SIZE{1'b0}};
			//		$error();
			//		end
			//	`endif
			// end
		default : dout = {SIZE{1'bx}};
	endcase

endmodule // mux2ds

// 3:1 MUX WITH DECODED SELECTS
module mux3ds (dout, in0, in1, in2, sel0, sel1, sel2) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0;
input			sel1;
input			sel2;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint cl_1h_chk3 ($one_hot ({sel2,sel1,sel0}));
`endif

wire [2:0] sel = {sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or in0 or in1 or in2)

	case ({sel2,sel1,sel0}) 
		3'b001 : dout = in0 ;
		3'b010 : dout = in1 ;
		3'b100 : dout = in2 ;
		3'b000 : dout = {SIZE{1'bx}} ;
		3'b011 : dout = {SIZE{1'bx}} ;
		3'b101 : dout = {SIZE{1'bx}} ;
		3'b110 : dout = {SIZE{1'bx}} ;
		3'b111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux3ds

// 4:1 MUX WITH DECODED SELECTS
module mux4ds (dout, in0, in1, in2, in3, sel0, sel1, sel2, sel3) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0;
input			sel1;
input			sel2;
input			sel3;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint cl_1h_chk4 ($one_hot ({sel3,sel2,sel1,sel0}));
`endif
   
wire [3:0] sel = {sel3,sel2,sel1,sel0}; // 0in one_hot
   
// priority encoding takes care of mutex'ing selects.
always @ (sel0 or sel1 or sel2 or sel3 or in0 or in1 or in2 or in3)

	case ({sel3,sel2,sel1,sel0}) 
		4'b0001 : dout = in0 ;
		4'b0010 : dout = in1 ;
		4'b0100 : dout = in2 ;
		4'b1000 : dout = in3 ;
		4'b0000 : dout = {SIZE{1'bx}} ;
		4'b0011 : dout = {SIZE{1'bx}} ;
		4'b0101 : dout = {SIZE{1'bx}} ;
		4'b0110 : dout = {SIZE{1'bx}} ;
		4'b0111 : dout = {SIZE{1'bx}} ;
		4'b1001 : dout = {SIZE{1'bx}} ;
		4'b1010 : dout = {SIZE{1'bx}} ;
		4'b1011 : dout = {SIZE{1'bx}} ;
		4'b1100 : dout = {SIZE{1'bx}} ;
		4'b1101 : dout = {SIZE{1'bx}} ;
		4'b1110 : dout = {SIZE{1'bx}} ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}};
			// two state vs four state modelling will be added.
	endcase

endmodule // mux4ds

// SINK FOR UNLOADED INPUT PORTS
module sink (in);
// synopsys template

parameter SIZE = 1;

input [SIZE-1:0] in;

// Alexey
// `ifdef PITON_PROTO
   // As of version 8.2 XST does not remove this module without the
   // following additional dead code

   wire    a;

   assign		a = | in;

// `endif

endmodule //sink

// SOURCE FOR UNDRIVEN OUTPUT PORTS
module source (out) ;
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0] out;
// 
// Once 4state/2state model established
// then enable check.
// `ifdef FOUR_STATE
// leda check for x_or_z_in rhs_of assign turned off
// assign  out = {SIZE{1'bx}};
//`else
assign  out = {SIZE{1'b0}};
//`endif

endmodule //source

// 2:1 MUX WITH PRIORITY ENCODED SELECTS
//module mux2es (dout, in0, in1, sel0, sel1) ;
//
//parameter SIZE = 1;
//
//output 	[SIZE-1:0] 	dout;
//input	[SIZE-1:0]	in0;
//input	[SIZE-1:0]	in1;
//input			sel0;
//input			sel1;
//
//// reg declaration does not imply state being maintained
//// across cycles. Used to construct case statement and
//// always updated by inputs every cycle.
//reg	[SIZE-1:0]	dout ;
//
//// must take into account lack of mutex selects.
//// there is no reason for handling of x and z conditions.
//// This will be dictated by design.
//always @ (sel0 or sel1 or in0 or in1)
//
//	case ({sel1,sel0})
//		2'b1x : dout = in1 ; // 10(in1),11(z) 
//		2'b0x :	dout = in0 ; // 01(in0),00(x)
//	endcase
//
//endmodule // mux2es

// CLK Header for gating off the clock of
// a FF.
// clk - output of the clk header
// rclk - input clk
// enb_l - Active low clock enable
// tmb_l  - Active low clock enable ( in scan mode, this input is !se )

module clken_buf (clk, rclk, enb_l, tmb_l);
output clk;
input  rclk, enb_l, tmb_l;
reg    clken;

  always @ (rclk or enb_l or tmb_l)
    if (!rclk)  //latch opens on rclk low phase
      clken = !enb_l | !tmb_l;
  assign clk = clken & rclk;

endmodule



// The following flops are maintained and used in ENET , MAC IP  ONLY
// -- Mimi X61467

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys sync_set_reset "set_l"
always @ (posedge clk)
  q[SIZE-1:0] <= set_l ? din[SIZE-1:0] : {SIZE{1'b1}};

endmodule // dffsl_ns

// POSITIVE-EDGE TRIGGERED FLOP with SET_L, without SCAN.

module dffsl_async_ns (din, clk, set_l, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   set_l ; // set

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// synopsys async_set_reset "set_l"
always @ (posedge clk or negedge set_l)
  q[SIZE-1:0] <= ~set_l ? {SIZE{1'b1}} : ({SIZE{~set_l}} | din[SIZE-1:0]);

endmodule // dffsl_async_ns

// POSITIVE-EDGE TRIGGERED FLOP WITH SET_H , without SCAN.

module dffr_ns_r1 (din, clk, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (posedge clk)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_ns_r1

// POSITIVE-EDGE TRIGGERED ASYNC RESET_H FLOP , without SCAN.

module dffr_async_ns (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset dominates
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b0}} : din[SIZE-1:0];

endmodule // dffr_async_ns

// POSITIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_r1 (din, clk, rst, q);
// synopsys template

parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clk ;   // clk or scan clk
input                   rst;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Reset to 1
// synopsys async_set_reset "rst"
always @ (posedge clk or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_r1


// NEGATIVE-EDGE TRIGGERED ASYNC SET_H FLOP , without SCAN.

module dffr_async_ns_cl_r1 (din, clkl, rst, q);
// synopsys template
parameter SIZE = 1;

input   [SIZE-1:0]      din ;   // data in
input                   clkl ;  // clk or scan clk
input                   rst ;   // reset

output  [SIZE-1:0]      q ;     // output

reg     [SIZE-1:0]      q ;

// Set to 1
// synopsys sync_set_reset "rst"
always @ (negedge clkl or posedge rst)
  q[SIZE-1:0] <= rst ? {SIZE{1'b1}} : din[SIZE-1:0];

endmodule // dffr_async_ns_cl_r1

