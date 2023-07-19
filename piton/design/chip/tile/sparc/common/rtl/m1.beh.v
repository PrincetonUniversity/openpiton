// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: m1.behV
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
////////////////////////////////////////////////////////////////////////
// 64 bit nor gate with first 32 bits out

module zznor64_32 ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32



////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate

module zzor36 ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
	     | a[32] | a[33] | a[34] | a[35]); 
   
endmodule // zzor36



////////////////////////////////////////////////////////////////////////////////
// 32 bit or gate

module zzor32 ( z, a );
  input  [31:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	     | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	     | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
	     | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

endmodule // zzor32



////////////////////////////////////////////////////////////////////////////////
// 24 bit nor gate

module zznor24 ( z, a );
  input  [23:0] a;
  output        z;

  assign z =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
	      | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]); 

endmodule // zznor24



////////////////////////////////////////////////////////////////////////////////
// 16 bit nor gate

module zznor16 ( z, a );
  input  [15:0] a;
  output        z;

  assign z =  ~(a[0] | a[1] | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
	      | a[8] | a[9] | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]); 

endmodule // zznor16



////////////////////////////////////////////////////////////////////////////////
// 8 bit or gate

module zzor8 ( z, a );
  input  [7:0] a;
  output       z;

  assign z =  (a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7]); 
   
endmodule // zzor8




////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd13 ( rs1_data, rs2_data, cin, adder_out );

  input  [12:0] rs1_data;   // 1st input operand
  input  [12:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [12:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd13



////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc FPU.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out. 

module zzadd56 ( rs1_data, rs2_data, cin, adder_out );

  input  [55:0] rs1_data;   // 1st input operand
  input  [55:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [55:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd56



////////////////////////////////////////////////////////////////////////////////

module zzadd48 ( rs1_data, rs2_data, cin, adder_out );

  input  [47:0] rs1_data;   // 1st input operand
  input  [47:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [47:0] adder_out;  // result of adder

  assign adder_out = rs1_data + rs2_data + cin;

endmodule // zzadd48



////////////////////////////////////////////////////////////////////////////////
//  This adder is primarily used in the multiplier.
//  The cin to out path is optimized.

module zzadd34c ( rs1_data, rs2_data, cin, adder_out );

  input  [33:0] rs1_data;
  input  [33:0] rs2_data;
  input         cin;

  output [33:0] adder_out;

  assign adder_out = rs1_data + rs2_data + cin;


endmodule // zzadd34c



////////////////////////////////////////////////////////////////////////////////

module zzadd32 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [31:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd32



////////////////////////////////////////////////////////////////////////////////

module zzadd18 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [17:0] rs1_data;   // 1st input operand
  input  [17:0] rs2_data;   // 2nd input operand
  input         cin;        // carry in

  output [17:0] adder_out;  // result of adder
  output 	cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd18



////////////////////////////////////////////////////////////////////////////////

module zzadd8 ( rs1_data, rs2_data, cin, adder_out, cout );

  input  [7:0] rs1_data;   // 1st input operand
  input  [7:0] rs2_data;   // 2nd input operand
  input        cin;        // carry in

  output [7:0] adder_out;  // result of add & decrement
  output       cout;       // carry out

  assign {cout, adder_out} = rs1_data + rs2_data + cin;

endmodule // zzadd8



////////////////////////////////////////////////////////////////////////////////
// Special 4-operand 32b adder used in spu_shamd5
//  Description:        This block implements the 4-operand 32-bit adder for SPU
//			It takes four 32-bit operands. It add them together and
//			output the 32-bit results to adder_out. The overflow of
//			32th bit and higher will be ignored.

module zzadd32op4 ( rs1_data, rs2_data, rs3_data, rs4_data, adder_out );

  input  [31:0] rs1_data;   // 1st input operand
  input  [31:0] rs2_data;   // 2nd input operand
  input  [31:0] rs3_data;   // 3rd input operand
  input  [31:0] rs4_data;   // 4th input operand

  output [31:0] adder_out;  // result of add

  assign adder_out = rs1_data + rs2_data + rs3_data + rs4_data;

endmodule // zzadd32op4


////////////////////////////////////////////////////////////////////////////////
//  Description:	This block implements the adder for the sparc alu.
//  			It takes two operands and a carry bit.  It adds them together
//			and sends the output to adder_out.  It outputs the overflow
//			and carry condition codes for both 64 bit and 32 bit operations.

module zzadd64 ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64



///////////////////////////////////////////////////////////////////////
/*
//      Description: This is the ffu VIS adder.  It can do either
//                              2 16 bit adds or 1 32 bit add.
*/

module zzadd32v (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
   a, b, cin, add32
   ) ;
   input [31:0] a;
   input [31:0] b;
   input        cin;
   input        add32;

   output [31:0] z;

   wire          cout15; // carry out from lower 16 bit add
   wire          cin16; // carry in to the upper 16 bit add
   wire          cout31; // carry out from the upper 16 bit add

   assign        cin16 = (add32)? cout15: cin;

   assign      {cout15, z[15:0]} = a[15:0]+b[15:0]+ cin;
   assign      {cout31, z[31:16]} = a[31:16]+b[31:16]+ cin16;

endmodule // zzadd32v




////////////////////////////////////////////////////////////////////////////////
// 64-bit incrementer

module zzinc64 ( in, out );

  input  [63:0] in;

  output [63:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc64


////////////////////////////////////////////////////////////////////////////////
// 48-bit incrementer

module zzinc48 ( in, out, overflow );

  input  [47:0] in;

  output [47:0] out;      // result of increment
  output        overflow; // overflow

  assign out      = in + 1'b1;
  assign overflow = ~in[47] & out[47];

endmodule // zzinc48


////////////////////////////////////////////////////////////////////////////////
// 32-bit incrementer

module zzinc32 ( in, out );

  input  [31:0] in;

  output [31:0] out;   // result of increment

  assign out = in + 1'b1;

endmodule // zzinc32


////////////////////////////////////////////////////////////////////////////////

module zzecc_exu_chkecc2 ( q,ce, ue, ne, d, p, vld );
   input [63:0] d;
   input [7:0]  p;
   input        vld;
   output [6:0] q;
   output       ce,
                ue,
                ne;

   wire       parity;

   assign     ce = vld & parity;

   assign ue = vld & ~parity & (q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);

   assign ne = ~vld | ~(parity | q[6] | q[5] | q[4] | q[3] | q[2] | q[1] | q[0]);


   assign q[0] = d[0]  ^ d[1]  ^ d[3]  ^ d[4]  ^ d[6]  ^ d[8]  ^ d[10]
               ^ d[11] ^ d[13] ^ d[15] ^ d[17] ^ d[19] ^ d[21] ^ d[23]
               ^ d[25] ^ d[26] ^ d[28] ^ d[30] ^ d[32] ^ d[34] ^ d[36]
               ^ d[38] ^ d[40] ^ d[42] ^ d[44] ^ d[46] ^ d[48] ^ d[50]
               ^ d[52] ^ d[54] ^ d[56] ^ d[57] ^ d[59] ^ d[61] ^ d[63]
               ^ p[0]  ;

   assign q[1] = d[0]  ^ d[2]  ^ d[3]  ^ d[5]  ^ d[6]  ^ d[9]  ^ d[10]
               ^ d[12] ^ d[13] ^ d[16] ^ d[17] ^ d[20] ^ d[21] ^ d[24]
               ^ d[25] ^ d[27] ^ d[28] ^ d[31] ^ d[32] ^ d[35] ^ d[36]
               ^ d[39] ^ d[40] ^ d[43] ^ d[44] ^ d[47] ^ d[48] ^ d[51]
               ^ d[52] ^ d[55] ^ d[56] ^ d[58] ^ d[59] ^ d[62] ^ d[63]
               ^ p[1]  ;

   assign q[2] = d[1]  ^ d[2]  ^ d[3]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[14] ^ d[15] ^ d[16] ^ d[17] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[29] ^ d[30] ^ d[31] ^ d[32] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[45] ^ d[46] ^ d[47] ^ d[48] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
               ^ p[2]  ;

   assign q[3] = d[4]  ^ d[5]  ^ d[6]  ^ d[7]  ^ d[8]  ^ d[9]  ^ d[10]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38]
               ^ d[39] ^ d[40] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[3]  ;

   assign q[4] = d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15] ^ d[16] ^ d[17]
               ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23] ^ d[24]
               ^ d[25] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[4]  ;

   assign q[5] = d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31] ^ d[32]
               ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
               ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46]
               ^ d[47] ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53]
               ^ d[54] ^ d[55] ^ d[56] ^ p[5]  ;

   assign q[6] = d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63] ^ p[6] ;

   assign parity = d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
                 ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
                 ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
                 ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
                 ^ d[32] ^ d[33] ^ d[34] ^ d[35] ^ d[36] ^ d[37] ^ d[38] ^ d[39]
                 ^ d[40] ^ d[41] ^ d[42] ^ d[43] ^ d[44] ^ d[45] ^ d[46] ^ d[47]
                 ^ d[48] ^ d[49] ^ d[50] ^ d[51] ^ d[52] ^ d[53] ^ d[54] ^ d[55]
                 ^ d[56] ^ d[57] ^ d[58] ^ d[59] ^ d[60] ^ d[61] ^ d[62] ^ d[63]
                 ^ p[0]  ^ p[1]  ^ p[2]  ^ p[3]  ^ p[4]  ^ p[5]  ^ p[6]  ^ p[7];

endmodule // zzecc_exu_chkecc2



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_24b_gen ( din, dout, parity ) ;

// Input Ports
input  [23:0] din ;

// Output Ports
output [23:0] dout ;
output [5:0]  parity ;

wire   [23:0] dout ;
wire   [5:0]  parity ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire          p30 ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |  |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |  |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |  |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |  |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   |   | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |  |  |* |  |* |* |  |  |* |* |  |* |  |  | * |   | * | * |   | * |   |   | * | * |   |   | * |   | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p30 = din[0]  ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5]  ^
             din[7]  ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^
             din[17] ^ din[18] ^ din[21] ^ din[23] ;

assign dout   = din ;
assign parity = {p30, p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////

module zzecc_sctag_30b_cor ( din, parity, dout, corrected_bit ) ;

// Input Ports
input  [23:0] din ;
input  [4:0]  parity ;

// Output Ports
output [23:0] dout ;
output [4:0]  corrected_bit ;

wire   [23:0] dout ;
wire   [4:0]  corrected_bit ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire [23:0]   error_bit ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |* |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |* |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |* |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |* |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   | * | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |* |* |* |* |* |* |* |* |* |* |* |* |* |* | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


assign p1  = parity[0] ^
             din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
             din[21] ^ din[23] ;

assign p2  = parity[1] ^
             din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
             din[21] ;

assign p4  = parity[2] ^
             din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
             din[23] ;

assign p8  = parity[3] ^
             din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign p16 = parity[4] ^
             din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
             din[23] ;

assign  error_bit[0]  = !p16 & !p8 & !p4 &  p2 &  p1 ; // 3
assign  error_bit[1]  = !p16 & !p8 &  p4 & !p2 &  p1 ; // 5
assign  error_bit[2]  = !p16 & !p8 &  p4 &  p2 & !p1 ; // 6
assign  error_bit[3]  = !p16 & !p8 &  p4 &  p2 &  p1 ; // 7
assign  error_bit[4]  = !p16 &  p8 & !p4 & !p2 &  p1 ; // 9
assign  error_bit[5]  = !p16 &  p8 & !p4 &  p2 & !p1 ; // 10
assign  error_bit[6]  = !p16 &  p8 & !p4 &  p2 &  p1 ; // 11
assign  error_bit[7]  = !p16 &  p8 &  p4 & !p2 & !p1 ; // 12
assign  error_bit[8]  = !p16 &  p8 &  p4 & !p2 &  p1 ; // 13
assign  error_bit[9]  = !p16 &  p8 &  p4 &  p2 & !p1 ; // 14
assign  error_bit[10] = !p16 &  p8 &  p4 &  p2 &  p1 ; // 15
assign  error_bit[11] =  p16 & !p8 & !p4 & !p2 &  p1 ; // 17
assign  error_bit[12] =  p16 & !p8 & !p4 &  p2 & !p1 ; // 18
assign  error_bit[13] =  p16 & !p8 & !p4 &  p2 &  p1 ; // 19
assign  error_bit[14] =  p16 & !p8 &  p4 & !p2 & !p1 ; // 20
assign  error_bit[15] =  p16 & !p8 &  p4 & !p2 &  p1 ; // 21
assign  error_bit[16] =  p16 & !p8 &  p4 &  p2 & !p1 ; // 22
assign  error_bit[17] =  p16 & !p8 &  p4 &  p2 &  p1 ; // 23
assign  error_bit[18] =  p16 &  p8 & !p4 & !p2 & !p1 ; // 24
assign  error_bit[19] =  p16 &  p8 & !p4 & !p2 &  p1 ; // 25
assign  error_bit[20] =  p16 &  p8 & !p4 &  p2 & !p1 ; // 26
assign  error_bit[21] =  p16 &  p8 & !p4 &  p2 &  p1 ; // 27
assign  error_bit[22] =  p16 &  p8 &  p4 & !p2 & !p1 ; // 28
assign  error_bit[23] =  p16 &  p8 &  p4 & !p2 &  p1 ; // 29

assign  dout          = din ^ error_bit ;
assign  corrected_bit = {p16, p8, p4, p2, p1} ;

endmodule



////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_ecc39
//Function: Error Detection and Correction
//
//

module zzecc_sctag_ecc39 ( dout, cflag, pflag, parity, din);

   //Output: 32bit corrected data
   output[31:0] dout;
   output [5:0] cflag;
   output 	pflag;
   
   //Input: 32bit data din
   input [31:0] din;
   input [6:0]	parity;

   wire 	c0,c1,c2,c3,c4,c5;
   wire [31:0] 	err_bit_pos;

   //refer to the comments in parity_gen_32b.v for the position description
   
   assign c0= parity[0]^(din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   
   assign c1= parity[1]^(din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   
   assign c2= parity[2]^(din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   
   assign c3= parity[3]^(din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   
   assign c4= parity[4]^(din[11]^din[12])^(din[13]^din[14])^
                    (din[15]^din[16])^(din[17]^din[18])^(din[19]^din[20])^
                    (din[21]^din[22])^(din[23]^din[24])^din[25];

   assign c5= parity[5]^(din[26]^din[27])^(din[28]^din[29])^
		    (din[30]^din[31]);

   //generate total parity flag
   assign pflag= c0 ^
		(( (((parity[1]^parity[2])^(parity[3]^parity[4])) ^
		 ((parity[5]^parity[6])^(din[2]^din[5]))) ^		 
		 (((din[7]^din[9])^(din[12]^din[14])) ^
		 ((din[16]^din[18])^(din[20]^din[22]))) ) ^
		 ((din[24]^din[27])^(din[29]^din[31])) );
   
   assign cflag= {c5,c4,c3,c2,c1,c0};
   
   //6 to 32 decoder
   assign err_bit_pos[0] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[1] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[2] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[3] = (c0)&(c1)&(c2)&(~c3)&(~c4)&(~c5);
   assign err_bit_pos[4] = (c0)&(~c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[5] = (~c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[6] = (c0)&(c1)&(~c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[7] = (~c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[8] = (c0)&(~c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[9] = (~c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[10] = (c0)&(c1)&(c2)&(c3)&(~c4)&(~c5);
   assign err_bit_pos[11] = (c0)&(~c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[12] = (~c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[13] = (c0)&(c1)&(~c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[14] = (~c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[15] = (c0)&(~c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[16] = (~c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[17] = (c0)&(c1)&(c2)&(~c3)&(c4)&(~c5);
   assign err_bit_pos[18] = (~c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[19] = (c0)&(~c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[20] = (~c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[21] = (c0)&(c1)&(~c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[22] = (~c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[23] = (c0)&(~c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[24] = (~c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[25] = (c0)&(c1)&(c2)&(c3)&(c4)&(~c5);
   assign err_bit_pos[26] = (c0)&(~c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[27] = (~c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[28] = (c0)&(c1)&(~c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[29] = (~c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[30] = (c0)&(~c1)&(c2)&(~c3)&(~c4)&(c5);
   assign err_bit_pos[31] = (~c0)&(c1)&(c2)&(~c3)&(~c4)&(c5);

   //correct the error bit, it can only correct one error bit.
   
   assign dout = din ^ err_bit_pos;

endmodule // zzecc_sctag_ecc39


////////////////////////////////////////////////////////////////////////////////
//Module Name: zzecc_sctag_pgen_32b
//Function: Generate 7 parity bits for 32bits input data
//

module zzecc_sctag_pgen_32b ( dout, parity, din);

   //Output: 32bit dout and 7bit parity bit
   output[31:0] dout;
   output [6:0] parity;

   //Input: 32bit data din
   input [31:0] din;

   //input data passing through this module
   assign dout = din ;

   //generate parity bits based on the hamming codes
   //the method to generate parity bit is shown as follows
   //1   2  3  4  5  6  7  8  9 10 11 12 13 14  15  16  17  18  19
   //P1 P2 d0 P4 d1 d2 d3 P8 d4 d5 d6 d7 d8 d9 d10 P16 d11 d12 d13 
   //
   // 20  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35 
   //d14 d15 d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 P32 d26 d27 d28
   //
   // 36  37  38       
   //d29 d30 d31
   //For binary numbers B1-B2-B3-B4-B5-B6:
   //B1=1 for (1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,...)
   //B2=1 for (2,3,6,7,10,11,14,15,18,19,22,23,26,27,30,31,34,35,38,39...)
   //B3=1 for (4,5,6,7,12,13,14,15,20,21,22,23,28,29,30,31,36,37,38,39....)
   //B4=1 for (8,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31,40,41,42,....)
   //B5=1 for (16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,48,49,...)
   //B6=1 for (32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49...)
   //Parity bit P1,P2,P4,P8,P16,P32 can be generated from the above group of
   //bits B1=1,B2=1,B3=1,B4=1,B5=1,B6=1 respectively.

   //use parity[5:0] to stand for P1,P2,P4,P8,P16,P32
   assign parity[0] = (din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);
   //
   assign parity[1] = (din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);
   //
   assign parity[2] = (din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);
   //
   assign parity[3] = (din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[4] = (din[11]^din[12])^(din[13]^din[14])^(din[15]^din[16])
                     ^(din[17]^din[18])^(din[19]^din[20])^(din[21]^din[22])
		     ^(din[23]^din[24])^din[25];
   //
   assign parity[5] = (din[26]^din[27])^(din[28]^din[29])^(din[30]^din[31]);

   //the last parity bit is the xor of all 38bits
   //assign parity[6] = (^din)^(^parity[5:0]);
   //it can be further simplified as:
   //din= d0  d1  d2  d3  d4  d5  d6  d7  d8  d9 d10 d11 d12 d13 d14 d15 
   //p0 =  x   x       x   x       x       x       x   x       x       x
   //p1 =  x       x   x       x   x           x   x       x   x
   //p2 =      x   x   x               x   x   x   x               x   x
   //p3 =                  x   x   x   x   x   x   x  
   //p4 =                                              x   x   x   x   x
   //p5 =
   //-------------------------------------------------------------------
   //Total 3   3   3   4   3   3   4   3   4   4   5   3   3   4   3   4 
   //
   //din=d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31 
   //p0=       x       x       x       x       x   x       x       x    
   //p1=   x   x           x   x           x   x       x   x           x
   //p2=   x   x                   x   x   x   x               x   x   x
   //p3=           x   x   x   x   x   x   x   x
   //p4=   x   x   x   x   x   x   x   x   x   x
   //p5=                                           x   x   x   x   x   x
   //-------------------------------------------------------------------
   //total 4   5   3   4   4   5   4   5   5   6   3   3   4   3   4   4

   //so total=even number, the corresponding bit will not show up in the
   //final xor tree.
   assign parity[6] =  din[0] ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5] ^ din[7]
		    ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^ din[17]
		    ^ din[18] ^ din[21] ^ din[23] ^ din[24] ^ din[26]
		    ^ din[27] ^ din[29];
   
endmodule // zzecc_sctag_pgen_32b

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree

module zzpar34 ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
	      ^ d[32] ^ d[33]; 

endmodule // zzpar34



////////////////////////////////////////////////////////////////////////////////
// 32 bit parity tree

module zzpar32 ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]; 

endmodule // zzpar32



////////////////////////////////////////////////////////////////////////////////
// 28 bit parity tree

module zzpar28 ( z, d );
   input  [27:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	      ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
	      ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
	      ^ d[24] ^ d[25] ^ d[26] ^ d[27]; 

endmodule // zzpar28



////////////////////////////////////////////////////////////////////////////////
// 16 bit parity tree

module zzpar16 ( z, d );
   input  [15:0] d;
   output        z;

   assign z = d[0] ^ d[1] ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
	    ^ d[8] ^ d[9] ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]; 
   
endmodule // zzpar16



////////////////////////////////////////////////////////////////////////////////
// 8 bit parity tree

module zzpar8 ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8



////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority

module zzpenc64 (/*AUTOARG*/
   // Outputs
   z, 
   // Inputs
  a 
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64

////////////////////////////////////////////////////////////////////////////////
//    4-bit 60x buffers

module zzbufh_60x4 (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [3:0] a;
   output [3:0] z;

   assign z = a;

endmodule //zzbufh_60x4

// LVT modules added below

module zzadd64_lv ( rs1_data, rs2_data, cin, adder_out, cout32, cout64 );

   input [63:0]  rs1_data;   // 1st input operand
   input [63:0]  rs2_data;   // 2nd input operand
   input         cin;        // carry in

   output [63:0] adder_out;  // result of adder
   output        cout32;     // carry out from lower 32 bit add
   output        cout64;     // carry out from 64 bit add

   assign {cout32, adder_out[31:0]}  = rs1_data[31:0]  + rs2_data[31:0]  + cin;
   assign {cout64, adder_out[63:32]} = rs1_data[63:32] + rs2_data[63:32] + cout32;

endmodule // zzadd64_lv

module zzpar8_lv ( z, d );
   input  [7:0] d;
   output       z;

   assign  z =  d[0] ^ d[1] ^ d[2] ^ d[3] ^ d[4] ^ d[5] ^ d[6] ^ d[7]; 

endmodule // zzpar8_lv


module zzpar32_lv ( z, d );
   input  [31:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31];

endmodule // zzpar32_lv



module zznor64_32_lv ( znor64, znor32, a );
  input  [63:0] a;
  output        znor64;
  output        znor32;

  assign znor32 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]); 

  assign znor64 =  ~(a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
		   | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
		   | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
		   | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31] 
		   | a[32] | a[33] | a[34] | a[35] | a[36] | a[37] | a[38] | a[39] 
		   | a[40] | a[41] | a[42] | a[43] | a[44] | a[45] | a[46] | a[47] 
		   | a[48] | a[49] | a[50] | a[51] | a[52] | a[53] | a[54] | a[55] 
		   | a[56] | a[57] | a[58] | a[59] | a[60] | a[61] | a[62] | a[63]);

endmodule // zznor64_32_lv

////////////////////////////////////////////////////////////////////////////////
//    64 -> 6 priority encoder
//    Bit 63 has the highest priority
//    LVT version

module zzpenc64_lv (/*AUTOARG*/
   // Outputs
   z,
   // Inputs
  a
   );

   input [63:0] a;
   output [5:0] z;

   integer      i;
   reg  [5:0]   z;

     always @ (a)
     begin
          z = 6'b0;
          for (i=0;i<64;i=i+1)
               if (a[i])
                      z = i;
     end

endmodule // zzpenc64_lv

////////////////////////////////////////////////////////////////////////////////
// 36 bit or gate
// LVT version

module zzor36_lv ( z, a );
  input  [35:0] a;
  output        z;

  assign z =  (a[0]  | a[1]  | a[2]  | a[3]  | a[4]  | a[5]  | a[6]  | a[7]
             | a[8]  | a[9]  | a[10] | a[11] | a[12] | a[13] | a[14] | a[15]
             | a[16] | a[17] | a[18] | a[19] | a[20] | a[21] | a[22] | a[23]
             | a[24] | a[25] | a[26] | a[27] | a[28] | a[29] | a[30] | a[31]
             | a[32] | a[33] | a[34] | a[35]);

endmodule // zzor36_lv

////////////////////////////////////////////////////////////////////////////////
// 34 bit parity tree
// LVT version

module zzpar34_lv ( z, d );
   input  [33:0] d;
   output        z;

   assign  z =  d[0]  ^ d[1]  ^ d[2]  ^ d[3]  ^ d[4]  ^ d[5]  ^ d[6]  ^ d[7]
              ^ d[8]  ^ d[9]  ^ d[10] ^ d[11] ^ d[12] ^ d[13] ^ d[14] ^ d[15]
              ^ d[16] ^ d[17] ^ d[18] ^ d[19] ^ d[20] ^ d[21] ^ d[22] ^ d[23]
              ^ d[24] ^ d[25] ^ d[26] ^ d[27] ^ d[28] ^ d[29] ^ d[30] ^ d[31]
              ^ d[32] ^ d[33];

endmodule // zzpar34_lv


