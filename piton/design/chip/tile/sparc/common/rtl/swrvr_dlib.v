// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: swrvr_dlib.v
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
// DP library

// 2:1 MUX WITH ENCODED SELECT
module dp_mux2es (dout, in0, in1, sel) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input			sel;

reg	[SIZE-1:0]	dout ;

always @ (sel or in0 or in1)

 begin
	   case (sel)
	     1'b1: dout = in1 ; 
	     1'b0: dout = in0;
	     default: 
         begin
            if (in0 == in1) begin
               dout = in0;
            end
            else
              dout = {SIZE{1'bx}};
         end
	   endcase // case(sel)
 end

endmodule // dp_mux2es

// ----------------------------------------------------------------------


// 4:1 MUX WITH DECODED SELECTS
module dp_mux4ds (dout, in0, in1, in2, in3, 
		     sel0_l, sel1_l, sel2_l, sel3_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk4 ($one_cold ({sel3_l,sel2_l,sel1_l,sel0_l}));
`endif

wire [3:0] sel = {sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3)

	case ({sel3_l,sel2_l,sel1_l,sel0_l})
		4'b1110 : dout = in0 ;
		4'b1101 : dout = in1 ;
		4'b1011 : dout = in2 ;
		4'b0111 : dout = in3 ;
		4'b1111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux4ds

// ----------------------------------------------------------------------


// 5:1 MUX WITH DECODED SELECTS
module dp_mux5ds (dout, in0, in1, in2, in3,  in4,
		     sel0_l, sel1_l, sel2_l, sel3_l, sel4_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk5 ($one_cold ({sel4_l,sel3_l,sel2_l,sel1_l,sel0_l}));
`endif
   
wire [4:0] sel = {sel4_l,sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or sel4_l or
		in0 or in1 or in2 or in3 or in4)

	case ({sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		5'b11110 : dout = in0 ;
		5'b11101 : dout = in1 ;
		5'b11011 : dout = in2 ;
		5'b10111 : dout = in3 ;
		5'b01111 : dout = in4 ;
		5'b11111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux5ds

// --------------------------------------------------------------------

// 8:1 MUX WITH DECODED SELECTS
module dp_mux8ds (dout, in0, in1, in2, in3, 
			in4, in5, in6, in7,
		     sel0_l, sel1_l, sel2_l, sel3_l,
		     sel4_l, sel5_l, sel6_l, sel7_l) ;
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input	[SIZE-1:0]	in3;
input	[SIZE-1:0]	in4;
input	[SIZE-1:0]	in5;
input	[SIZE-1:0]	in6;
input	[SIZE-1:0]	in7;
input			sel0_l;
input			sel1_l;
input			sel2_l;
input			sel3_l;
input			sel4_l;
input			sel5_l;
input			sel6_l;
input			sel7_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk8 ($one_cold ({sel7_l,sel6_l,sel5_l,sel4_l,
				       sel3_l,sel2_l,sel1_l,sel0_l}));
`endif

wire [7:0] sel = {sel7_l,sel6_l,sel5_l,sel4_l,
                  sel3_l,sel2_l,sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or sel2_l or sel3_l or in0 or in1 or in2 or in3 or
	  sel4_l or sel5_l or sel6_l or sel7_l or in4 or in5 or in6 or in7)

	case ({sel7_l,sel6_l,sel5_l,sel4_l,sel3_l,sel2_l,sel1_l,sel0_l})
		8'b11111110 : dout = in0 ;
		8'b11111101 : dout = in1 ;
		8'b11111011 : dout = in2 ;
		8'b11110111 : dout = in3 ;
		8'b11101111 : dout = in4 ;
		8'b11011111 : dout = in5 ;
		8'b10111111 : dout = in6 ;
		8'b01111111 : dout = in7 ;
		8'b11111111 : dout = {SIZE{1'bx}} ;
		default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux8ds


// ----------------------------------------------------------------------


// 3:1 MUX WITH DECODED SELECTS
module dp_mux3ds (dout, in0, in1, in2, 
		     sel0_l, sel1_l, sel2_l);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in0;
input	[SIZE-1:0]	in1;
input	[SIZE-1:0]	in2;
input			sel0_l;
input			sel1_l;
input			sel2_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg	[SIZE-1:0]	dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk3 ($one_cold ({sel2_l,sel1_l,sel0_l}));
`endif

wire [2:0] sel = {sel2_l,sel1_l,sel0_l}; // 0in one_cold
   
always @ (sel0_l or sel1_l or sel2_l or in0 or in1 or in2)

	case ({sel2_l,sel1_l,sel0_l})
		3'b110 : dout = in0 ;
		3'b101 : dout = in1 ;
		3'b011 : dout = in2 ;
	        default : dout = {SIZE{1'bx}} ;
	endcase

endmodule // dp_mux3ds

// ----------------------------------------------------------------------


// 2:1 MUX WITH DECODED SELECTS
module dp_mux2ds (dout, in0, in1,
             sel0_l, sel1_l);
// synopsys template

parameter SIZE = 1;

output  [SIZE-1:0]  dout;
input   [SIZE-1:0]  in0;
input   [SIZE-1:0]  in1;
input           sel0_l;
input           sel1_l;

// reg declaration does not imply state being maintained
// across cycles. Used to construct case statement and
// always updated by inputs every cycle.
reg [SIZE-1:0]  dout ;

`ifdef VERPLEX
   $constraint dl_1c_chk2 ($one_cold ({sel1_l,sel0_l}));
`endif

wire [1:0] sel = {sel1_l,sel0_l}; // 0in one_cold

always @ (sel0_l or sel1_l or in0 or in1)

    case ({sel1_l,sel0_l})
        3'b10 : dout = in0 ;
        3'b01 : dout = in1 ;
            default : dout = {SIZE{1'bx}} ;
    endcase

endmodule // dp_mux3ds

// ---------------------------------------------------------------------


module dp_buffer(dout, in);
// synopsys template

parameter SIZE = 1;

output 	[SIZE-1:0] 	dout;
input	[SIZE-1:0]	in;

assign dout = in;

endmodule // dp_buffer









