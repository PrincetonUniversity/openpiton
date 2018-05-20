// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: mul64.v
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
/*//////////////////////////////////////////////////////////////////////
//
//  Module Name: mul64
//  Description:        *This block implements the multiplier used in the modular multiplier
//                       unit (MUL) and be shared by sparc EXU and the streaming unit (SPU).
//                       It is also used as the 54x54 multiplier in the FPU.
//                      *It takes two 64-bit unsign data and accumulated operand and do the
//                       64x64 MAC operation at two cycle thruput and 5 cycle latency.
//                      *The mul_valid signal indicate the beginning of a new operation.
//                       It MUST be dis-asserted at the next cycle to have the proper 2-cycle
//                       latency operation in the csa array. If there are two back-to-back
//                       cycle operation, the first operation result will be incorrect.
//                      *Results are avaliable on the 5th cycle of the mul_valid as shows
//
//			*Following inputs should tie to "0" when used as a 64x64 multiplier
//			 - areg 
//			 - accreg 
//			 - x2
//
//                         Cycle-0  | Cycle-1 | Cycle-2 | Cycle-3 | Cycle-4 | Cycle-5
//                       1st        *         |         |         |         |
//                       rs1, rs2   ^         |         |         |         | 1st results
//                       valid=1    | valid=0 |         *         |         | avaliable
//                                1st         | 2nd OP  ^         |         |
//                                setup       | valid=1 |         |         |
//                                            |        2nd        |         |
//                                            |       setup       |         |
//
*/

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_MUL
`endif

`ifdef FPGA_SYN_MUL
(* use_dsp48 = "yes" *) module mul64(rs1_l, rs2, valid, areg, accreg, x2, out, rclk, si, so, se, 
	mul_rst_l, mul_step);

	input	[63:0]		rs1_l;
	input	[63:0]		rs2;
	input			valid;
	input	[96:0]		areg;
	input	[135:129]	accreg;
	input			x2;
	input			rclk;
	input			si;
	input			se;
	input			mul_rst_l;
	input			mul_step;
	output			so;
	output	[135:0]		out;

reg [135:0] myout, myout_a1, myout_a2, myout_a3;

reg [63:0] rs1_ff;
reg [64:0] rs2_ff;

reg [63:0] par1, par2;
reg [64:0] par3, par4;

reg [5:0] state;

always @(posedge rclk)
  state <= {valid,state[5:1]};


always @(posedge rclk) begin
  if(mul_step) begin
    if(valid) begin
      rs1_ff <= ~rs1_l;
      rs2_ff <= x2 ? {rs2,1'b0} : {1'b0,rs2};
    end else begin
      rs1_ff <= {32'b0, rs1_ff[63:32]};
    end
    par1 <= (rs1_ff[31:0] * rs2_ff[31:0]);
    par3 <= rs1_ff[31:0] * rs2_ff[64:32];
    myout_a1 <= ({32'b0, myout_a1[135:32]} & {136{state[3]}}) + par1 + {par3, 32'b0} + areg;
    myout <= {(myout_a1[103:97]+accreg),myout_a1[96:0],myout[63:32]};
  end 
end

assign out = myout;
assign so = 1'b0;

endmodule

`else


module mul64 (rs1_l, rs2, valid, areg, accreg, x2, out, rclk, si, so, se, mul_rst_l, mul_step);

input  [63:0]  	rs1_l;			// op1
input  [63:0]  	rs2;			// op2
input	       	valid;			// begin of the MUL operation
input  [96:0]  	areg;			// accumulated input for ACCUM
input  [135:129] accreg;		// direct input from ACCUM [135:129]
input	       	x2;			// for op1*op2*2
input	       	rclk, si, se, mul_rst_l, mul_step;
output  	so;
output [135:0] 	out;

wire	       	cyc1, cyc2, cyc3;	// cycle stage of MUL
wire [2:0]	b0, b1, b2,  b3,  b4,  b5,  b6,  b7;
wire [2:0]	b8, b9, b10, b11, b12, b13, b14, b15;
wire	    	b16;
wire [63:0]	op1_l, op1;
wire [81:0]	a0sum, a1sum, a0s, a1s; 
wire [81:4]	a0cout, a1cout, a0c, a1c;
wire		pcoutx2, psumx2;
wire 		x2_c1, x2_c2, x2_c3, x2_c2c3;

wire [98:0]	psum, pcout;
wire [98:30]	pcout_in, pc;
wire [98:31]	psum_in, ps;
wire [96:0]	ary2_cout, addin_cout;
wire [97:0]	ary2_sum,  addin_sum ;
wire		add_cin, addin_cin, add_co31, add_co96;
wire [103:0]	addout;
wire		clk_enb0, clk_enb1;
wire 		rst;
wire		clk;
wire		tm_l;

  assign clk = rclk;
  assign rst = ~mul_rst_l; 
  assign tm_l = ~se;

  clken_buf	ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));

  /////////////////////////////////////////////////////////////////////
  // 	States count
  /////////////////////////////////////////////////////////////////////
  dffr_s  cyc1_dff(.din(valid), .clk(clk_enb0), .q(cyc1), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc2_dff(.din(cyc1),  .clk(clk_enb0), .q(cyc2), .rst(rst), .se(se), .si(), .so());
  dffr_s  cyc3_dff(.din(cyc2),  .clk(clk_enb0), .q(cyc3), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c1_dff(.din(x2),    .clk(clk_enb0), .q(x2_c1), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c2_dff(.din(x2_c1), .clk(clk_enb0), .q(x2_c2), .rst(rst), .se(se), .si(), .so());
  dffr_s  x2c3_dff(.din(x2_c2), .clk(clk_enb0), .q(x2_c3), .rst(rst), .se(se), .si(), .so());

  assign x2_c2c3 =  x2_c2 | x2_c3 ;
	
  /////////////////////////////////////////////////////////////////////
  // 	Enable flops for op1
  /////////////////////////////////////////////////////////////////////
  clken_buf	ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(valid & mul_step)), .tmb_l(tm_l));
  dff_s #(64)  	ffrs1  (.din(rs1_l[63:0]), .clk(clk_enb1), .q(op1_l[63:0]),
			.se(se), .si(), .so());




  assign op1[63:0] = ~op1_l[63:0];

  mul_booth	 booth (.head (valid),
			.b_in (rs2),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (b8),
			.b9   (b9),
			.b10  (b10),
			.b11  (b11),
			.b12  (b12),
			.b13  (b13),
			.b14  (b14),
			.b15  (b15),
			.b16  (b16),
			.clk  (clk), .se(se), .si(), .so(), .mul_step(mul_step), .tm_l(tm_l));
			
  /////////////////////////////////////////////////////////////////////
  // 	Two Array1 inst ary1_a0 & ary1_a1 with the ouput flops 
  /////////////////////////////////////////////////////////////////////
  mul_array1	ary1_a0(.cout (a0cout[81:4]),
			.sum  (a0sum[81:0]),
			.a    (op1),
			.b0   (b0),
			.b1   (b1),
			.b2   (b2),
			.b3   (b3),
			.b4   (b4),
			.b5   (b5),
			.b6   (b6),
			.b7   (b7),
			.b8   (3'b000),
			.head (cyc1),
			.bot  (1'b0)); //array a is never at the bottom of 33-pp rows
 
  dff_s #(78)  a0cot_dff (.din(a0cout[81:4]), .clk(clk_enb0), .q(a0c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a0sum_dff (.din(a0sum[81:0]), .clk(clk_enb0), .q(a0s[81:0]),
			.se(se), .si(), .so());

  mul_array1	ary1_a1(.cout (a1cout[81:4]),
			.sum  (a1sum[81:0]),
			.a    (op1),
			.b0   (b8),
			.b1   (b9),
			.b2   (b10),
			.b3   (b11),
			.b4   (b12),
			.b5   (b13),
			.b6   (b14),
			.b7   (b15),
			.b8   ({1'b0,b16,1'b0}),
			.head (1'b0),	//array b is never at the head of 33-pp rows
			.bot  (cyc2)); 

  dff_s #(78)  a1cot_dff (.din(a1cout[81:4]), .clk(clk_enb0), .q(a1c[81:4]),
			.se(se), .si(), .so());
  dff_s #(82)  a1sum_dff (.din(a1sum[81:0]), .clk(clk_enb0), .q(a1s[81:0]),
			.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Array2 with the reorder output mux-flops
  /////////////////////////////////////////////////////////////////////
  mul_array2 	 array2(.pcoutx2 (pcoutx2),
			.psumx2  (psumx2),
			.pcout 	 (pcout[98:0]),
			.psum    (psum[98:0]), 
			.a0c     (a0c[81:4]),
			.a0s     (a0s[81:0]),
			.a1c     (a1c[81:4]),
			.a1s     (a1s[81:0]),
			.pc	 (pc[98:30]),
			.ps	 (ps[98:31]),
			.areg    (areg[96:0]),
			.bot     (cyc3),
			.x2      (x2_c2c3));
 
  //// Outpput re-order muxes and flops	////
  dp_mux2es #(97)  ary2_cmux (.dout(ary2_cout[96:0]),
                              .in0(pcout[96:0]),
                              .in1({pcout[95:0],pcoutx2}),
                              .sel(x2_c2c3));
  dff_s #(97)  a2cot_dff (.din(ary2_cout[96:0]), .clk(clk_enb0), .q(addin_cout[96:0]), 
              		.se(se), .si(), .so());

  dp_mux2es #(98) ary2_smux (.dout(ary2_sum[97:0]),
                             .in0(psum[97:0]),
                             .in1({psum[96:0],psumx2}),
                             .sel(x2_c2c3));
  dff_s #(98)  a2sum_dff (.din(ary2_sum[97:0]), .clk(clk_enb0), .q(addin_sum[97:0]), 
			.se(se), .si(), .so());

  //// Pseudo sum & cout logic and flops ////
  assign psum_in[98:32]  = psum[98:32] & {67{cyc2}} ;
  assign psum_in[31]     = psum[31] & x2_c2 ;

  assign pcout_in[98:31] = pcout[98:31] & {68{cyc2}} ;
  assign pcout_in[30]    = pcout[30] & x2_c2 ;
  
  dff_s #(68)  psum_dff  (.din(psum_in[98:31]), .clk(clk_enb0), .q(ps[98:31]),
                	.se(se), .si(), .so());
  dff_s #(69)  pcout_dff (.din(pcout_in[98:30]), .clk(clk_enb0), .q(pc[98:30]),
            		.se(se), .si(), .so());

  /////////////////////////////////////////////////////////////////////
  // 	Adder (104-bit) 
  /////////////////////////////////////////////////////////////////////

  assign 	add_cin = add_co31 & cyc3 ;

  assign {add_co31,addout[31:0]} =   {{1'b0},addin_sum[31:0]} 
		     		   + {{1'b0},addin_cout[30:0],addin_cin} ;


  assign {add_co96,addout[96:32]} =  addin_sum[97:32]	
				  + addin_cout[96:31]
				  + {{65'b0},add_co31} ;

  assign 	addout[103:97] =  accreg[135:129] + {{6'b0},add_co96} ;

  /////////////////////////////////////////////////////////////////////
  // 	Pipe adder outputs  
  /////////////////////////////////////////////////////////////////////

  dff_s  	      co31_dff (.din(add_cin), .clk(clk_enb0), .q(addin_cin),
       			.se(se), .si(), .so());

  dff_s #(104)   out_dff (.din(addout[103:0]), .clk(clk_enb0), .q(out[135:32]),
              		.se(se), .si(), .so());

  dff_s #(32)    pip_dff (.din(out[63:32]), .clk(clk_enb0), .q(out[31:0]),
               		.se(se), .si(), .so());

endmodule // mul64




////////////////////////////////////////////////////////////////////////
//	Sub-moudle for mul64
////////////////////////////////////////////////////////////////////////

module mul_array1 ( cout, sum, a, b0, b1, b2, b3, b4, b5, b6, b7, b8,
     bot, head );

input  bot, head;
output [81:4]  cout;
output [81:0]  sum;
input [2:0]  b6;
input [2:0]  b3;
input [2:0]  b8;
input [2:0]  b2;
input [2:0]  b1;
input [2:0]  b7;
input [63:0]  a;
input [2:0]  b0;
input [2:0]  b4;
input [2:0]  b5;

// Buses in the design

wire  [1:0]  b5n;
wire  [1:0]  b2n;
wire  [68:1]  c0;
wire  [69:0]  s1;
wire  [68:1]  c1;
wire  [69:0]  s2;
wire  [68:1]  c2;
wire  [70:4]  s_1;
wire  [69:2]  s0;
wire  [76:10]  s_2;
wire  [70:2]  c_1;
wire  [76:10]  c_2;
wire  [75:11]  co;

mul_negen p1n ( .b(b5[2:0]), .n1(b5n[1]), .n0(b5n[0]));
mul_negen p0n ( .b(b2[2:0]), .n1(b2n[1]), .n0(b2n[0]));
mul_csa42  sc3_71_ ( .c(s_2[71]), .cin(co[70]), .a(c_1[70]),
     .b(c_2[70]), .cout(co[71]), .sum(sum[71]), .d(s1[65]),
     .carry(cout[71]));
mul_csa42  sc3_75_ ( .c(s_2[75]), .cin(co[74]), .a(1'b0),
     .b(c_2[74]), .cout(co[75]), .sum(sum[75]), .d(s1[69]),
     .carry(cout[75]));
mul_csa42  sc3_74_ ( .c(s_2[74]), .cin(co[73]), .a(1'b0),
     .b(c_2[73]), .cout(co[74]), .sum(sum[74]), .d(s1[68]),
     .carry(cout[74]));
mul_csa42  sc3_73_ ( .c(s_2[73]), .cin(co[72]), .a(1'b0),
     .b(c_2[72]), .cout(co[73]), .sum(sum[73]), .d(s1[67]),
     .carry(cout[73]));
mul_csa42  sc3_72_ ( .c(s_2[72]), .cin(co[71]), .a(1'b0),
     .b(c_2[71]), .cout(co[72]), .sum(sum[72]), .d(s1[66]),
     .carry(cout[72]));
mul_csa42  sc3_76_ ( .c(s_2[76]), .cin(co[75]), .a(1'b0),
     .b(c_2[75]), .cout(), .sum(sum[76]), .d(1'b0),
     .carry(cout[76]));
mul_csa42  sc3_70_ ( .c(s_2[70]), .cin(co[69]), .a(c_1[69]),
     .b(c_2[69]), .cout(co[70]), .sum(sum[70]), .d(s_1[70]),
     .carry(cout[70]));
mul_csa42  sc3_69_ ( .c(s_2[69]), .cin(co[68]), .a(c_1[68]),
     .b(c_2[68]), .cout(co[69]), .sum(sum[69]), .d(s_1[69]),
     .carry(cout[69]));
mul_csa42  sc3_68_ ( .c(s_2[68]), .cin(co[67]), .a(c_1[67]),
     .b(c_2[67]), .cout(co[68]), .sum(sum[68]), .d(s_1[68]),
     .carry(cout[68]));
mul_csa42  sc3_67_ ( .c(s_2[67]), .cin(co[66]), .a(c_1[66]),
     .b(c_2[66]), .cout(co[67]), .sum(sum[67]), .d(s_1[67]),
     .carry(cout[67]));
mul_csa42  sc3_66_ ( .c(s_2[66]), .cin(co[65]), .a(c_1[65]),
     .b(c_2[65]), .cout(co[66]), .sum(sum[66]), .d(s_1[66]),
     .carry(cout[66]));
mul_csa42  sc3_65_ ( .c(s_2[65]), .cin(co[64]), .a(c_1[64]),
     .b(c_2[64]), .cout(co[65]), .sum(sum[65]), .d(s_1[65]),
     .carry(cout[65]));
mul_csa42  sc3_64_ ( .c(s_2[64]), .cin(co[63]), .a(c_1[63]),
     .b(c_2[63]), .cout(co[64]), .sum(sum[64]), .d(s_1[64]),
     .carry(cout[64]));
mul_csa42  sc3_63_ ( .c(s_2[63]), .cin(co[62]), .a(c_1[62]),
     .b(c_2[62]), .cout(co[63]), .sum(sum[63]), .d(s_1[63]),
     .carry(cout[63]));
mul_csa42  sc3_62_ ( .c(s_2[62]), .cin(co[61]), .a(c_1[61]),
     .b(c_2[61]), .cout(co[62]), .sum(sum[62]), .d(s_1[62]),
     .carry(cout[62]));
mul_csa42  sc3_61_ ( .c(s_2[61]), .cin(co[60]), .a(c_1[60]),
     .b(c_2[60]), .cout(co[61]), .sum(sum[61]), .d(s_1[61]),
     .carry(cout[61]));
mul_csa42  sc3_60_ ( .c(s_2[60]), .cin(co[59]), .a(c_1[59]),
     .b(c_2[59]), .cout(co[60]), .sum(sum[60]), .d(s_1[60]),
     .carry(cout[60]));
mul_csa42  sc3_59_ ( .c(s_2[59]), .cin(co[58]), .a(c_1[58]),
     .b(c_2[58]), .cout(co[59]), .sum(sum[59]), .d(s_1[59]),
     .carry(cout[59]));
mul_csa42  sc3_58_ ( .c(s_2[58]), .cin(co[57]), .a(c_1[57]),
     .b(c_2[57]), .cout(co[58]), .sum(sum[58]), .d(s_1[58]),
     .carry(cout[58]));
mul_csa42  sc3_57_ ( .c(s_2[57]), .cin(co[56]), .a(c_1[56]),
     .b(c_2[56]), .cout(co[57]), .sum(sum[57]), .d(s_1[57]),
     .carry(cout[57]));
mul_csa42  sc3_56_ ( .c(s_2[56]), .cin(co[55]), .a(c_1[55]),
     .b(c_2[55]), .cout(co[56]), .sum(sum[56]), .d(s_1[56]),
     .carry(cout[56]));
mul_csa42  sc3_55_ ( .c(s_2[55]), .cin(co[54]), .a(c_1[54]),
     .b(c_2[54]), .cout(co[55]), .sum(sum[55]), .d(s_1[55]),
     .carry(cout[55]));
mul_csa42  sc3_54_ ( .c(s_2[54]), .cin(co[53]), .a(c_1[53]),
     .b(c_2[53]), .cout(co[54]), .sum(sum[54]), .d(s_1[54]),
     .carry(cout[54]));
mul_csa42  sc3_53_ ( .c(s_2[53]), .cin(co[52]), .a(c_1[52]),
     .b(c_2[52]), .cout(co[53]), .sum(sum[53]), .d(s_1[53]),
     .carry(cout[53]));
mul_csa42  sc3_52_ ( .c(s_2[52]), .cin(co[51]), .a(c_1[51]),
     .b(c_2[51]), .cout(co[52]), .sum(sum[52]), .d(s_1[52]),
     .carry(cout[52]));
mul_csa42  sc3_51_ ( .c(s_2[51]), .cin(co[50]), .a(c_1[50]),
     .b(c_2[50]), .cout(co[51]), .sum(sum[51]), .d(s_1[51]),
     .carry(cout[51]));
mul_csa42  sc3_50_ ( .c(s_2[50]), .cin(co[49]), .a(c_1[49]),
     .b(c_2[49]), .cout(co[50]), .sum(sum[50]), .d(s_1[50]),
     .carry(cout[50]));
mul_csa42  sc3_49_ ( .c(s_2[49]), .cin(co[48]), .a(c_1[48]),
     .b(c_2[48]), .cout(co[49]), .sum(sum[49]), .d(s_1[49]),
     .carry(cout[49]));
mul_csa42  sc3_48_ ( .c(s_2[48]), .cin(co[47]), .a(c_1[47]),
     .b(c_2[47]), .cout(co[48]), .sum(sum[48]), .d(s_1[48]),
     .carry(cout[48]));
mul_csa42  sc3_47_ ( .c(s_2[47]), .cin(co[46]), .a(c_1[46]),
     .b(c_2[46]), .cout(co[47]), .sum(sum[47]), .d(s_1[47]),
     .carry(cout[47]));
mul_csa42  sc3_46_ ( .c(s_2[46]), .cin(co[45]), .a(c_1[45]),
     .b(c_2[45]), .cout(co[46]), .sum(sum[46]), .d(s_1[46]),
     .carry(cout[46]));
mul_csa42  sc3_45_ ( .c(s_2[45]), .cin(co[44]), .a(c_1[44]),
     .b(c_2[44]), .cout(co[45]), .sum(sum[45]), .d(s_1[45]),
     .carry(cout[45]));
mul_csa42  sc3_44_ ( .c(s_2[44]), .cin(co[43]), .a(c_1[43]),
     .b(c_2[43]), .cout(co[44]), .sum(sum[44]), .d(s_1[44]),
     .carry(cout[44]));
mul_csa42  sc3_43_ ( .c(s_2[43]), .cin(co[42]), .a(c_1[42]),
     .b(c_2[42]), .cout(co[43]), .sum(sum[43]), .d(s_1[43]),
     .carry(cout[43]));
mul_csa42  sc3_42_ ( .c(s_2[42]), .cin(co[41]), .a(c_1[41]),
     .b(c_2[41]), .cout(co[42]), .sum(sum[42]), .d(s_1[42]),
     .carry(cout[42]));
mul_csa42  sc3_41_ ( .c(s_2[41]), .cin(co[40]), .a(c_1[40]),
     .b(c_2[40]), .cout(co[41]), .sum(sum[41]), .d(s_1[41]),
     .carry(cout[41]));
mul_csa42  sc3_40_ ( .c(s_2[40]), .cin(co[39]), .a(c_1[39]),
     .b(c_2[39]), .cout(co[40]), .sum(sum[40]), .d(s_1[40]),
     .carry(cout[40]));
mul_csa42  sc3_39_ ( .c(s_2[39]), .cin(co[38]), .a(c_1[38]),
     .b(c_2[38]), .cout(co[39]), .sum(sum[39]), .d(s_1[39]),
     .carry(cout[39]));
mul_csa42  sc3_38_ ( .c(s_2[38]), .cin(co[37]), .a(c_1[37]),
     .b(c_2[37]), .cout(co[38]), .sum(sum[38]), .d(s_1[38]),
     .carry(cout[38]));
mul_csa42  sc3_37_ ( .c(s_2[37]), .cin(co[36]), .a(c_1[36]),
     .b(c_2[36]), .cout(co[37]), .sum(sum[37]), .d(s_1[37]),
     .carry(cout[37]));
mul_csa42  sc3_36_ ( .c(s_2[36]), .cin(co[35]), .a(c_1[35]),
     .b(c_2[35]), .cout(co[36]), .sum(sum[36]), .d(s_1[36]),
     .carry(cout[36]));
mul_csa42  sc3_35_ ( .c(s_2[35]), .cin(co[34]), .a(c_1[34]),
     .b(c_2[34]), .cout(co[35]), .sum(sum[35]), .d(s_1[35]),
     .carry(cout[35]));
mul_csa42  sc3_34_ ( .c(s_2[34]), .cin(co[33]), .a(c_1[33]),
     .b(c_2[33]), .cout(co[34]), .sum(sum[34]), .d(s_1[34]),
     .carry(cout[34]));
mul_csa42  sc3_33_ ( .c(s_2[33]), .cin(co[32]), .a(c_1[32]),
     .b(c_2[32]), .cout(co[33]), .sum(sum[33]), .d(s_1[33]),
     .carry(cout[33]));
mul_csa42  sc3_32_ ( .c(s_2[32]), .cin(co[31]), .a(c_1[31]),
     .b(c_2[31]), .cout(co[32]), .sum(sum[32]), .d(s_1[32]),
     .carry(cout[32]));
mul_csa42  sc3_31_ ( .c(s_2[31]), .cin(co[30]), .a(c_1[30]),
     .b(c_2[30]), .cout(co[31]), .sum(sum[31]), .d(s_1[31]),
     .carry(cout[31]));
mul_csa42  sc3_30_ ( .c(s_2[30]), .cin(co[29]), .a(c_1[29]),
     .b(c_2[29]), .cout(co[30]), .sum(sum[30]), .d(s_1[30]),
     .carry(cout[30]));
mul_csa42  sc3_29_ ( .c(s_2[29]), .cin(co[28]), .a(c_1[28]),
     .b(c_2[28]), .cout(co[29]), .sum(sum[29]), .d(s_1[29]),
     .carry(cout[29]));
mul_csa42  sc3_28_ ( .c(s_2[28]), .cin(co[27]), .a(c_1[27]),
     .b(c_2[27]), .cout(co[28]), .sum(sum[28]), .d(s_1[28]),
     .carry(cout[28]));
mul_csa42  sc3_27_ ( .c(s_2[27]), .cin(co[26]), .a(c_1[26]),
     .b(c_2[26]), .cout(co[27]), .sum(sum[27]), .d(s_1[27]),
     .carry(cout[27]));
mul_csa42  sc3_26_ ( .c(s_2[26]), .cin(co[25]), .a(c_1[25]),
     .b(c_2[25]), .cout(co[26]), .sum(sum[26]), .d(s_1[26]),
     .carry(cout[26]));
mul_csa42  sc3_25_ ( .c(s_2[25]), .cin(co[24]), .a(c_1[24]),
     .b(c_2[24]), .cout(co[25]), .sum(sum[25]), .d(s_1[25]),
     .carry(cout[25]));
mul_csa42  sc3_24_ ( .c(s_2[24]), .cin(co[23]), .a(c_1[23]),
     .b(c_2[23]), .cout(co[24]), .sum(sum[24]), .d(s_1[24]),
     .carry(cout[24]));
mul_csa42  sc3_23_ ( .c(s_2[23]), .cin(co[22]), .a(c_1[22]),
     .b(c_2[22]), .cout(co[23]), .sum(sum[23]), .d(s_1[23]),
     .carry(cout[23]));
mul_csa42  sc3_22_ ( .c(s_2[22]), .cin(co[21]), .a(c_1[21]),
     .b(c_2[21]), .cout(co[22]), .sum(sum[22]), .d(s_1[22]),
     .carry(cout[22]));
mul_csa42  sc3_21_ ( .c(s_2[21]), .cin(co[20]), .a(c_1[20]),
     .b(c_2[20]), .cout(co[21]), .sum(sum[21]), .d(s_1[21]),
     .carry(cout[21]));
mul_csa42  sc3_20_ ( .c(s_2[20]), .cin(co[19]), .a(c_1[19]),
     .b(c_2[19]), .cout(co[20]), .sum(sum[20]), .d(s_1[20]),
     .carry(cout[20]));
mul_csa42  sc3_19_ ( .c(s_2[19]), .cin(co[18]), .a(c_1[18]),
     .b(c_2[18]), .cout(co[19]), .sum(sum[19]), .d(s_1[19]),
     .carry(cout[19]));
mul_csa42  sc3_18_ ( .c(s_2[18]), .cin(co[17]), .a(c_1[17]),
     .b(c_2[17]), .cout(co[18]), .sum(sum[18]), .d(s_1[18]),
     .carry(cout[18]));
mul_csa42  sc3_17_ ( .c(s_2[17]), .cin(co[16]), .a(c_1[16]),
     .b(c_2[16]), .cout(co[17]), .sum(sum[17]), .d(s_1[17]),
     .carry(cout[17]));
mul_csa42  sc3_16_ ( .c(s_2[16]), .cin(co[15]), .a(c_1[15]),
     .b(c_2[15]), .cout(co[16]), .sum(sum[16]), .d(s_1[16]),
     .carry(cout[16]));
mul_csa42  sc3_15_ ( .c(s_2[15]), .cin(co[14]), .a(c_1[14]),
     .b(c_2[14]), .cout(co[15]), .sum(sum[15]), .d(s_1[15]),
     .carry(cout[15]));
mul_csa42  sc3_14_ ( .c(s_2[14]), .cin(co[13]), .a(c_1[13]),
     .b(c_2[13]), .cout(co[14]), .sum(sum[14]), .d(s_1[14]),
     .carry(cout[14]));
mul_csa42  sc3_13_ ( .c(s_2[13]), .cin(co[12]), .a(c_1[12]),
     .b(c_2[12]), .cout(co[13]), .sum(sum[13]), .d(s_1[13]),
     .carry(cout[13]));
mul_csa42  sc3_12_ ( .c(s_2[12]), .cin(co[11]), .a(c_1[11]),
     .b(c_2[11]), .cout(co[12]), .sum(sum[12]), .d(s_1[12]),
     .carry(cout[12]));
mul_csa42  sc3_11_ ( .c(s_2[11]), .cin(1'b0),
     .a(c_1[10]), .b(c_2[10]), .cout(co[11]), .sum(sum[11]),
     .d(s_1[11]), .carry(cout[11]));
mul_csa32  sc2_2_70_ ( .c(c1[63]), .b(c2[57]), .a(s2[58]),
     .cout(c_2[70]), .sum(s_2[70]));
mul_csa32  sc2_2_69_ ( .c(c1[62]), .b(c2[56]), .a(s2[57]),
     .cout(c_2[69]), .sum(s_2[69]));
mul_csa32  sc2_2_68_ ( .c(c1[61]), .b(c2[55]), .a(s2[56]),
     .cout(c_2[68]), .sum(s_2[68]));
mul_csa32  sc2_2_67_ ( .c(c1[60]), .b(c2[54]), .a(s2[55]),
     .cout(c_2[67]), .sum(s_2[67]));
mul_csa32  sc2_2_66_ ( .c(c1[59]), .b(c2[53]), .a(s2[54]),
     .cout(c_2[66]), .sum(s_2[66]));
mul_csa32  sc2_2_65_ ( .c(c1[58]), .b(c2[52]), .a(s2[53]),
     .cout(c_2[65]), .sum(s_2[65]));
mul_csa32  sc2_2_64_ ( .c(c1[57]), .b(c2[51]), .a(s2[52]),
     .cout(c_2[64]), .sum(s_2[64]));
mul_csa32  sc2_2_63_ ( .c(c1[56]), .b(c2[50]), .a(s2[51]),
     .cout(c_2[63]), .sum(s_2[63]));
mul_csa32  sc2_2_62_ ( .c(c1[55]), .b(c2[49]), .a(s2[50]),
     .cout(c_2[62]), .sum(s_2[62]));
mul_csa32  sc2_2_61_ ( .c(c1[54]), .b(c2[48]), .a(s2[49]),
     .cout(c_2[61]), .sum(s_2[61]));
mul_csa32  sc2_2_60_ ( .c(c1[53]), .b(c2[47]), .a(s2[48]),
     .cout(c_2[60]), .sum(s_2[60]));
mul_csa32  sc2_2_59_ ( .c(c1[52]), .b(c2[46]), .a(s2[47]),
     .cout(c_2[59]), .sum(s_2[59]));
mul_csa32  sc2_2_58_ ( .c(c1[51]), .b(c2[45]), .a(s2[46]),
     .cout(c_2[58]), .sum(s_2[58]));
mul_csa32  sc2_2_57_ ( .c(c1[50]), .b(c2[44]), .a(s2[45]),
     .cout(c_2[57]), .sum(s_2[57]));
mul_csa32  sc2_2_56_ ( .c(c1[49]), .b(c2[43]), .a(s2[44]),
     .cout(c_2[56]), .sum(s_2[56]));
mul_csa32  sc2_2_55_ ( .c(c1[48]), .b(c2[42]), .a(s2[43]),
     .cout(c_2[55]), .sum(s_2[55]));
mul_csa32  sc2_2_54_ ( .c(c1[47]), .b(c2[41]), .a(s2[42]),
     .cout(c_2[54]), .sum(s_2[54]));
mul_csa32  sc2_2_53_ ( .c(c1[46]), .b(c2[40]), .a(s2[41]),
     .cout(c_2[53]), .sum(s_2[53]));
mul_csa32  sc2_2_52_ ( .c(c1[45]), .b(c2[39]), .a(s2[40]),
     .cout(c_2[52]), .sum(s_2[52]));
mul_csa32  sc2_2_51_ ( .c(c1[44]), .b(c2[38]), .a(s2[39]),
     .cout(c_2[51]), .sum(s_2[51]));
mul_csa32  sc2_2_50_ ( .c(c1[43]), .b(c2[37]), .a(s2[38]),
     .cout(c_2[50]), .sum(s_2[50]));
mul_csa32  sc2_2_49_ ( .c(c1[42]), .b(c2[36]), .a(s2[37]),
     .cout(c_2[49]), .sum(s_2[49]));
mul_csa32  sc2_2_48_ ( .c(c1[41]), .b(c2[35]), .a(s2[36]),
     .cout(c_2[48]), .sum(s_2[48]));
mul_csa32  sc2_2_47_ ( .c(c1[40]), .b(c2[34]), .a(s2[35]),
     .cout(c_2[47]), .sum(s_2[47]));
mul_csa32  sc2_2_46_ ( .c(c1[39]), .b(c2[33]), .a(s2[34]),
     .cout(c_2[46]), .sum(s_2[46]));
mul_csa32  sc2_2_45_ ( .c(c1[38]), .b(c2[32]), .a(s2[33]),
     .cout(c_2[45]), .sum(s_2[45]));
mul_csa32  sc2_2_44_ ( .c(c1[37]), .b(c2[31]), .a(s2[32]),
     .cout(c_2[44]), .sum(s_2[44]));
mul_csa32  sc2_2_43_ ( .c(c1[36]), .b(c2[30]), .a(s2[31]),
     .cout(c_2[43]), .sum(s_2[43]));
mul_csa32  sc2_2_42_ ( .c(c1[35]), .b(c2[29]), .a(s2[30]),
     .cout(c_2[42]), .sum(s_2[42]));
mul_csa32  sc2_2_41_ ( .c(c1[34]), .b(c2[28]), .a(s2[29]),
     .cout(c_2[41]), .sum(s_2[41]));
mul_csa32  sc2_2_40_ ( .c(c1[33]), .b(c2[27]), .a(s2[28]),
     .cout(c_2[40]), .sum(s_2[40]));
mul_csa32  sc2_2_39_ ( .c(c1[32]), .b(c2[26]), .a(s2[27]),
     .cout(c_2[39]), .sum(s_2[39]));
mul_csa32  sc2_2_38_ ( .c(c1[31]), .b(c2[25]), .a(s2[26]),
     .cout(c_2[38]), .sum(s_2[38]));
mul_csa32  sc2_2_37_ ( .c(c1[30]), .b(c2[24]), .a(s2[25]),
     .cout(c_2[37]), .sum(s_2[37]));
mul_csa32  sc2_2_36_ ( .c(c1[29]), .b(c2[23]), .a(s2[24]),
     .cout(c_2[36]), .sum(s_2[36]));
mul_csa32  sc2_2_35_ ( .c(c1[28]), .b(c2[22]), .a(s2[23]),
     .cout(c_2[35]), .sum(s_2[35]));
mul_csa32  sc2_2_34_ ( .c(c1[27]), .b(c2[21]), .a(s2[22]),
     .cout(c_2[34]), .sum(s_2[34]));
mul_csa32  sc2_2_33_ ( .c(c1[26]), .b(c2[20]), .a(s2[21]),
     .cout(c_2[33]), .sum(s_2[33]));
mul_csa32  sc2_2_32_ ( .c(c1[25]), .b(c2[19]), .a(s2[20]),
     .cout(c_2[32]), .sum(s_2[32]));
mul_csa32  sc2_2_31_ ( .c(c1[24]), .b(c2[18]), .a(s2[19]),
     .cout(c_2[31]), .sum(s_2[31]));
mul_csa32  sc2_2_30_ ( .c(c1[23]), .b(c2[17]), .a(s2[18]),
     .cout(c_2[30]), .sum(s_2[30]));
mul_csa32  sc2_2_29_ ( .c(c1[22]), .b(c2[16]), .a(s2[17]),
     .cout(c_2[29]), .sum(s_2[29]));
mul_csa32  sc2_2_28_ ( .c(c1[21]), .b(c2[15]), .a(s2[16]),
     .cout(c_2[28]), .sum(s_2[28]));
mul_csa32  sc2_2_27_ ( .c(c1[20]), .b(c2[14]), .a(s2[15]),
     .cout(c_2[27]), .sum(s_2[27]));
mul_csa32  sc2_2_26_ ( .c(c1[19]), .b(c2[13]), .a(s2[14]),
     .cout(c_2[26]), .sum(s_2[26]));
mul_csa32  sc2_2_25_ ( .c(c1[18]), .b(c2[12]), .a(s2[13]),
     .cout(c_2[25]), .sum(s_2[25]));
mul_csa32  sc2_2_24_ ( .c(c1[17]), .b(c2[11]), .a(s2[12]),
     .cout(c_2[24]), .sum(s_2[24]));
mul_csa32  sc2_2_23_ ( .c(c1[16]), .b(c2[10]), .a(s2[11]),
     .cout(c_2[23]), .sum(s_2[23]));
mul_csa32  sc2_2_22_ ( .c(c1[15]), .b(c2[9]), .a(s2[10]),
     .cout(c_2[22]), .sum(s_2[22]));
mul_csa32  sc2_2_21_ ( .c(c1[14]), .b(c2[8]), .a(s2[9]),
     .cout(c_2[21]), .sum(s_2[21]));
mul_csa32  sc2_2_20_ ( .c(c1[13]), .b(c2[7]), .a(s2[8]),
     .cout(c_2[20]), .sum(s_2[20]));
mul_csa32  sc2_2_19_ ( .c(c1[12]), .b(c2[6]), .a(s2[7]),
     .cout(c_2[19]), .sum(s_2[19]));
mul_csa32  sc2_2_18_ ( .c(c1[11]), .b(c2[5]), .a(s2[6]),
     .cout(c_2[18]), .sum(s_2[18]));
mul_csa32  sc2_2_17_ ( .c(c1[10]), .b(c2[4]), .a(s2[5]),
     .cout(c_2[17]), .sum(s_2[17]));
mul_csa32  sc2_2_16_ ( .c(c1[9]), .b(c2[3]), .a(s2[4]),
     .cout(c_2[16]), .sum(s_2[16]));
mul_csa32  sc2_2_15_ ( .c(c1[8]), .b(c2[2]), .a(s2[3]),
     .cout(c_2[15]), .sum(s_2[15]));
mul_csa32  sc2_2_14_ ( .c(c1[7]), .b(c2[1]), .a(s2[2]),
     .cout(c_2[14]), .sum(s_2[14]));
mul_csa32  sc2_2_13_ ( .c(c1[6]), .b(s1[7]), .a(s2[1]),
     .cout(c_2[13]), .sum(s_2[13]));
mul_csa32  sc2_2_12_ ( .c(c1[5]), .b(s1[6]), .a(s2[0]),
     .cout(c_2[12]), .sum(s_2[12]));
mul_csa32  sc2_2_11_ ( .c(c1[4]), .b(s1[5]), .a(b5n[1]),
     .cout(c_2[11]), .sum(s_2[11]));
mul_csa32  sc2_2_10_ ( .c(c1[3]), .b(s1[4]), .a(b5n[0]),
     .cout(c_2[10]), .sum(s_2[10]));
mul_csa32  sc2_2_76_ ( .c(1'b1), .b(c2[63]), .a(s2[64]),
     .cout(c_2[76]), .sum(s_2[76]));
mul_csa32  sc2_2_77_ ( .c(c_2[76]), .b(c2[64]), .a(s2[65]),
     .cout(cout[77]), .sum(sum[77]));
mul_csa32  sc2_1_9_ ( .c(s1[3]), .b(c0[8]), .a(s0[9]), .cout(c_1[9]),
     .sum(s_1[9]));
mul_csa32  sc2_1_8_ ( .c(s1[2]), .b(c0[7]), .a(s0[8]), .cout(c_1[8]),
     .sum(s_1[8]));
mul_csa32  sc2_1_3_ ( .c(c_1[2]), .b(c0[2]), .a(s0[3]),
     .cout(c_1[3]), .sum(sum[3]));
mul_csa32  sc3_10_ ( .c(s_2[10]), .b(s_1[10]), .a(c_1[9]),
     .cout(cout[10]), .sum(sum[10]));
mul_csa32  sc3_9_ ( .c(c1[2]), .sum(sum[9]), .cout(cout[9]),
     .a(c_1[8]), .b(s_1[9]));
mul_csa32  sc3_8_ ( .c(c1[1]), .sum(sum[8]), .cout(cout[8]),
     .a(c_1[7]), .b(s_1[8]));
mul_csa32  sc2_2_71_ ( .c(c1[64]), .b(c2[58]), .a(s2[59]),
     .cout(c_2[71]), .sum(s_2[71]));
mul_csa32  sc2_2_75_ ( .c(c1[68]), .b(c2[62]), .a(s2[63]),
     .cout(c_2[75]), .sum(s_2[75]));
mul_csa32  sc2_2_74_ ( .c(c1[67]), .b(c2[61]), .a(s2[62]),
     .cout(c_2[74]), .sum(s_2[74]));
mul_csa32  sc2_2_73_ ( .c(c1[66]), .b(c2[60]), .a(s2[61]),
     .cout(c_2[73]), .sum(s_2[73]));
mul_csa32  sc2_2_72_ ( .c(c1[65]), .b(c2[59]), .a(s2[60]),
     .cout(c_2[72]), .sum(s_2[72]));
mul_csa32  sc2_1_69_ ( .c(s1[63]), .sum(s_1[69]), .cout(c_1[69]),
     .a(s0[69]), .b(c0[68]));
mul_csa32  sc2_1_68_ ( .c(s1[62]), .sum(s_1[68]), .cout(c_1[68]),
     .a(s0[68]), .b(c0[67]));
mul_csa32  sc2_1_67_ ( .c(s1[61]), .sum(s_1[67]), .cout(c_1[67]),
     .a(s0[67]), .b(c0[66]));
mul_csa32  sc2_1_66_ ( .c(s1[60]), .sum(s_1[66]), .cout(c_1[66]),
     .a(s0[66]), .b(c0[65]));
mul_csa32  sc2_1_65_ ( .c(s1[59]), .sum(s_1[65]), .cout(c_1[65]),
     .a(s0[65]), .b(c0[64]));
mul_csa32  sc2_1_64_ ( .c(s1[58]), .sum(s_1[64]), .cout(c_1[64]),
     .a(s0[64]), .b(c0[63]));
mul_csa32  sc2_1_63_ ( .c(s1[57]), .sum(s_1[63]), .cout(c_1[63]),
     .a(s0[63]), .b(c0[62]));
mul_csa32  sc2_1_62_ ( .c(s1[56]), .sum(s_1[62]), .cout(c_1[62]),
     .a(s0[62]), .b(c0[61]));
mul_csa32  sc2_1_61_ ( .c(s1[55]), .sum(s_1[61]), .cout(c_1[61]),
     .a(s0[61]), .b(c0[60]));
mul_csa32  sc2_1_60_ ( .c(s1[54]), .sum(s_1[60]), .cout(c_1[60]),
     .a(s0[60]), .b(c0[59]));
mul_csa32  sc2_1_59_ ( .c(s1[53]), .sum(s_1[59]), .cout(c_1[59]),
     .a(s0[59]), .b(c0[58]));
mul_csa32  sc2_1_58_ ( .c(s1[52]), .sum(s_1[58]), .cout(c_1[58]),
     .a(s0[58]), .b(c0[57]));
mul_csa32  sc2_1_57_ ( .c(s1[51]), .sum(s_1[57]), .cout(c_1[57]),
     .a(s0[57]), .b(c0[56]));
mul_csa32  sc2_1_56_ ( .c(s1[50]), .sum(s_1[56]), .cout(c_1[56]),
     .a(s0[56]), .b(c0[55]));
mul_csa32  sc2_1_55_ ( .c(s1[49]), .sum(s_1[55]), .cout(c_1[55]),
     .a(s0[55]), .b(c0[54]));
mul_csa32  sc2_1_54_ ( .c(s1[48]), .sum(s_1[54]), .cout(c_1[54]),
     .a(s0[54]), .b(c0[53]));
mul_csa32  sc2_1_53_ ( .c(s1[47]), .sum(s_1[53]), .cout(c_1[53]),
     .a(s0[53]), .b(c0[52]));
mul_csa32  sc2_1_52_ ( .c(s1[46]), .sum(s_1[52]), .cout(c_1[52]),
     .a(s0[52]), .b(c0[51]));
mul_csa32  sc2_1_51_ ( .c(s1[45]), .sum(s_1[51]), .cout(c_1[51]),
     .a(s0[51]), .b(c0[50]));
mul_csa32  sc2_1_50_ ( .c(s1[44]), .sum(s_1[50]), .cout(c_1[50]),
     .a(s0[50]), .b(c0[49]));
mul_csa32  sc2_1_49_ ( .c(s1[43]), .sum(s_1[49]), .cout(c_1[49]),
     .a(s0[49]), .b(c0[48]));
mul_csa32  sc2_1_48_ ( .c(s1[42]), .sum(s_1[48]), .cout(c_1[48]),
     .a(s0[48]), .b(c0[47]));
mul_csa32  sc2_1_47_ ( .c(s1[41]), .sum(s_1[47]), .cout(c_1[47]),
     .a(s0[47]), .b(c0[46]));
mul_csa32  sc2_1_46_ ( .c(s1[40]), .sum(s_1[46]), .cout(c_1[46]),
     .a(s0[46]), .b(c0[45]));
mul_csa32  sc2_1_45_ ( .c(s1[39]), .sum(s_1[45]), .cout(c_1[45]),
     .a(s0[45]), .b(c0[44]));
mul_csa32  sc2_1_44_ ( .c(s1[38]), .sum(s_1[44]), .cout(c_1[44]),
     .a(s0[44]), .b(c0[43]));
mul_csa32  sc2_1_43_ ( .c(s1[37]), .sum(s_1[43]), .cout(c_1[43]),
     .a(s0[43]), .b(c0[42]));
mul_csa32  sc2_1_42_ ( .c(s1[36]), .sum(s_1[42]), .cout(c_1[42]),
     .a(s0[42]), .b(c0[41]));
mul_csa32  sc2_1_41_ ( .c(s1[35]), .sum(s_1[41]), .cout(c_1[41]),
     .a(s0[41]), .b(c0[40]));
mul_csa32  sc2_1_40_ ( .c(s1[34]), .sum(s_1[40]), .cout(c_1[40]),
     .a(s0[40]), .b(c0[39]));
mul_csa32  sc2_1_39_ ( .c(s1[33]), .sum(s_1[39]), .cout(c_1[39]),
     .a(s0[39]), .b(c0[38]));
mul_csa32  sc2_1_38_ ( .c(s1[32]), .sum(s_1[38]), .cout(c_1[38]),
     .a(s0[38]), .b(c0[37]));
mul_csa32  sc2_1_37_ ( .c(s1[31]), .sum(s_1[37]), .cout(c_1[37]),
     .a(s0[37]), .b(c0[36]));
mul_csa32  sc2_1_36_ ( .c(s1[30]), .sum(s_1[36]), .cout(c_1[36]),
     .a(s0[36]), .b(c0[35]));
mul_csa32  sc2_1_35_ ( .c(s1[29]), .sum(s_1[35]), .cout(c_1[35]),
     .a(s0[35]), .b(c0[34]));
mul_csa32  sc2_1_34_ ( .c(s1[28]), .sum(s_1[34]), .cout(c_1[34]),
     .a(s0[34]), .b(c0[33]));
mul_csa32  sc2_1_33_ ( .c(s1[27]), .sum(s_1[33]), .cout(c_1[33]),
     .a(s0[33]), .b(c0[32]));
mul_csa32  sc2_1_32_ ( .c(s1[26]), .sum(s_1[32]), .cout(c_1[32]),
     .a(s0[32]), .b(c0[31]));
mul_csa32  sc2_1_31_ ( .c(s1[25]), .sum(s_1[31]), .cout(c_1[31]),
     .a(s0[31]), .b(c0[30]));
mul_csa32  sc2_1_30_ ( .c(s1[24]), .sum(s_1[30]), .cout(c_1[30]),
     .a(s0[30]), .b(c0[29]));
mul_csa32  sc2_1_29_ ( .c(s1[23]), .sum(s_1[29]), .cout(c_1[29]),
     .a(s0[29]), .b(c0[28]));
mul_csa32  sc2_1_28_ ( .c(s1[22]), .sum(s_1[28]), .cout(c_1[28]),
     .a(s0[28]), .b(c0[27]));
mul_csa32  sc2_1_27_ ( .c(s1[21]), .sum(s_1[27]), .cout(c_1[27]),
     .a(s0[27]), .b(c0[26]));
mul_csa32  sc2_1_26_ ( .c(s1[20]), .sum(s_1[26]), .cout(c_1[26]),
     .a(s0[26]), .b(c0[25]));
mul_csa32  sc2_1_25_ ( .c(s1[19]), .sum(s_1[25]), .cout(c_1[25]),
     .a(s0[25]), .b(c0[24]));
mul_csa32  sc2_1_24_ ( .c(s1[18]), .sum(s_1[24]), .cout(c_1[24]),
     .a(s0[24]), .b(c0[23]));
mul_csa32  sc2_1_23_ ( .c(s1[17]), .sum(s_1[23]), .cout(c_1[23]),
     .a(s0[23]), .b(c0[22]));
mul_csa32  sc2_1_22_ ( .c(s1[16]), .sum(s_1[22]), .cout(c_1[22]),
     .a(s0[22]), .b(c0[21]));
mul_csa32  sc2_1_21_ ( .c(s1[15]), .sum(s_1[21]), .cout(c_1[21]),
     .a(s0[21]), .b(c0[20]));
mul_csa32  sc2_1_20_ ( .c(s1[14]), .sum(s_1[20]), .cout(c_1[20]),
     .a(s0[20]), .b(c0[19]));
mul_csa32  sc2_1_19_ ( .c(s1[13]), .sum(s_1[19]), .cout(c_1[19]),
     .a(s0[19]), .b(c0[18]));
mul_csa32  sc2_1_18_ ( .c(s1[12]), .sum(s_1[18]), .cout(c_1[18]),
     .a(s0[18]), .b(c0[17]));
mul_csa32  sc2_1_17_ ( .c(s1[11]), .sum(s_1[17]), .cout(c_1[17]),
     .a(s0[17]), .b(c0[16]));
mul_csa32  sc2_1_16_ ( .c(s1[10]), .sum(s_1[16]), .cout(c_1[16]),
     .a(s0[16]), .b(c0[15]));
mul_csa32  sc2_1_15_ ( .c(s1[9]), .sum(s_1[15]), .cout(c_1[15]),
     .a(s0[15]), .b(c0[14]));
mul_csa32  sc2_1_14_ ( .c(s1[8]), .sum(s_1[14]), .cout(c_1[14]),
     .a(s0[14]), .b(c0[13]));
mul_csa32  sc2_1_7_ ( .c(s1[1]), .b(c0[6]), .a(s0[7]), .cout(c_1[7]),
     .sum(s_1[7]));
mul_csa32  sc2_1_6_ ( .c(s1[0]), .b(c0[5]), .a(s0[6]), .cout(c_1[6]),
     .sum(s_1[6]));
mul_csa32  sc2_1_5_ ( .c(b2n[1]), .b(c0[4]), .a(s0[5]),
     .cout(c_1[5]), .sum(s_1[5]));
mul_csa32  sc2_1_4_ ( .c(b2n[0]), .b(c0[3]), .a(s0[4]),
     .cout(c_1[4]), .sum(s_1[4]));
mul_ha sc2_1_10_ ( .sum(s_1[10]), .cout(c_1[10]), .a(s0[10]),
     .b(c0[9]));
mul_ha sc3_7_ ( .sum(sum[7]), .cout(cout[7]), .a(c_1[6]),
     .b(s_1[7]));
mul_ha sc3_6_ ( .sum(sum[6]), .cout(cout[6]), .a(c_1[5]),
     .b(s_1[6]));
mul_ha sc3_5_ ( .sum(sum[5]), .cout(cout[5]), .a(c_1[4]),
     .b(s_1[5]));
mul_ha sc3_4_ ( .sum(sum[4]), .cout(cout[4]), .a(c_1[3]),
     .b(s_1[4]));
mul_ha sc2_2_81_ ( .sum(sum[81]), .cout(cout[81]), .a(s2[69]),
     .b(c2[68]));
mul_ha sc2_2_80_ ( .sum(sum[80]), .cout(cout[80]), .a(s2[68]),
     .b(c2[67]));
mul_ha sc2_2_79_ ( .sum(sum[79]), .cout(cout[79]), .a(s2[67]),
     .b(c2[66]));
mul_ha sc2_2_78_ ( .sum(sum[78]), .cout(cout[78]), .a(s2[66]),
     .b(c2[65]));
mul_ha sc2_1_70_ ( .sum(s_1[70]), .cout(c_1[70]),
     .a(1'b1), .b(s1[64]));
mul_ha sc2_1_2_ ( .sum(sum[2]), .cout(c_1[2]), .a(s0[2]), .b(c0[1]));
mul_ha sc2_1_13_ ( .sum(s_1[13]), .cout(c_1[13]), .a(s0[13]),
     .b(c0[12]));
mul_ha sc2_1_12_ ( .sum(s_1[12]), .cout(c_1[12]), .a(s0[12]),
     .b(c0[11]));
mul_ha sc2_1_11_ ( .sum(s_1[11]), .cout(c_1[11]), .a(s0[11]),
     .b(c0[10]));
mul_ppgenrow3 I2 ( .head(1'b0), .bot(bot), .b2(b8[2:0]),
     .b1(b7[2:0]), .b0(b6[2:0]), .a(a[63:0]), .sum(s2[69:0]),
     .cout(c2[68:1]));
mul_ppgenrow3 I1 ( .head(1'b0), .bot(1'b1),
     .b2(b5[2:0]), .b1(b4[2:0]), .b0(b3[2:0]), .a(a[63:0]),
     .sum(s1[69:0]), .cout(c1[68:1]));
mul_ppgenrow3 I0 ( .head(head), .bot(1'b1), .b2(b2[2:0]),
     .b1(b1[2:0]), .b0(b0[2:0]), .a(a[63:0]), .sum({s0[69:2],
     sum[1:0]}), .cout(c0[68:1]));

endmodule // mul_array1

module mul_array2 ( pcout, pcoutx2, psum, psumx2, a0c, a0s, a1c, a1s,
     areg, bot, pc, ps, x2 );

output  pcoutx2, psumx2;
input  bot, x2;
output [98:0]  psum;
output [98:0]  pcout;
input [81:4]  a1c;
input [98:30]  pc;
input [98:31]  ps;
input [81:0]  a0s;
input [96:0]  areg;
input [81:0]  a1s;
input [81:4]  a0c;

// Buses in the design
wire  [81:15]  s3;
wire  [81:15]  c3;
wire  [96:0]  ain;
wire  [67:20]  co;
wire  [82:0]  s1;
wire  [96:0]  c2;
wire  [82:0]  c1;
wire  [96:0]  s2;
wire	      ainx2, s1x2, c1x2;

mul_mux2 sh_82_ ( .d1(areg[83]), .z(ain[82]), .d0(areg[82]), .s(x2));
mul_mux2 sh_68_ ( .d1(areg[69]), .z(ain[68]), .d0(areg[68]), .s(x2));
mul_mux2 sh_67_ ( .d1(areg[68]), .z(ain[67]), .d0(areg[67]), .s(x2));
mul_mux2 sh_66_ ( .d1(areg[67]), .z(ain[66]), .d0(areg[66]), .s(x2));
mul_mux2 sh_65_ ( .d1(areg[66]), .z(ain[65]), .d0(areg[65]), .s(x2));
mul_mux2 sh_64_ ( .d1(areg[65]), .z(ain[64]), .d0(areg[64]), .s(x2));
mul_mux2 sh_63_ ( .d1(areg[64]), .z(ain[63]), .d0(areg[63]), .s(x2));
mul_mux2 sh_62_ ( .d1(areg[63]), .z(ain[62]), .d0(areg[62]), .s(x2));
mul_mux2 sh_61_ ( .d1(areg[62]), .z(ain[61]), .d0(areg[61]), .s(x2));
mul_mux2 sh_60_ ( .d1(areg[61]), .z(ain[60]), .d0(areg[60]), .s(x2));
mul_mux2 sh_59_ ( .d1(areg[60]), .z(ain[59]), .d0(areg[59]), .s(x2));
mul_mux2 sh_58_ ( .d1(areg[59]), .z(ain[58]), .d0(areg[58]), .s(x2));
mul_mux2 sh_57_ ( .d1(areg[58]), .z(ain[57]), .d0(areg[57]), .s(x2));
mul_mux2 sh_56_ ( .d1(areg[57]), .z(ain[56]), .d0(areg[56]), .s(x2));
mul_mux2 sh_55_ ( .d1(areg[56]), .z(ain[55]), .d0(areg[55]), .s(x2));
mul_mux2 sh_54_ ( .d1(areg[55]), .z(ain[54]), .d0(areg[54]), .s(x2));
mul_mux2 sh_53_ ( .d1(areg[54]), .z(ain[53]), .d0(areg[53]), .s(x2));
mul_mux2 sh_52_ ( .d1(areg[53]), .z(ain[52]), .d0(areg[52]), .s(x2));
mul_mux2 sh_51_ ( .d1(areg[52]), .z(ain[51]), .d0(areg[51]), .s(x2));
mul_mux2 sh_50_ ( .d1(areg[51]), .z(ain[50]), .d0(areg[50]), .s(x2));
mul_mux2 sh_49_ ( .d1(areg[50]), .z(ain[49]), .d0(areg[49]), .s(x2));
mul_mux2 sh_48_ ( .d1(areg[49]), .z(ain[48]), .d0(areg[48]), .s(x2));
mul_mux2 sh_47_ ( .d1(areg[48]), .z(ain[47]), .d0(areg[47]), .s(x2));
mul_mux2 sh_46_ ( .d1(areg[47]), .z(ain[46]), .d0(areg[46]), .s(x2));
mul_mux2 sh_45_ ( .d1(areg[46]), .z(ain[45]), .d0(areg[45]), .s(x2));
mul_mux2 sh_44_ ( .d1(areg[45]), .z(ain[44]), .d0(areg[44]), .s(x2));
mul_mux2 sh_43_ ( .d1(areg[44]), .z(ain[43]), .d0(areg[43]), .s(x2));
mul_mux2 sh_42_ ( .d1(areg[43]), .z(ain[42]), .d0(areg[42]), .s(x2));
mul_mux2 sh_41_ ( .d1(areg[42]), .z(ain[41]), .d0(areg[41]), .s(x2));
mul_mux2 sh_40_ ( .d1(areg[41]), .z(ain[40]), .d0(areg[40]), .s(x2));
mul_mux2 sh_39_ ( .d1(areg[40]), .z(ain[39]), .d0(areg[39]), .s(x2));
mul_mux2 sh_38_ ( .d1(areg[39]), .z(ain[38]), .d0(areg[38]), .s(x2));
mul_mux2 sh_37_ ( .d1(areg[38]), .z(ain[37]), .d0(areg[37]), .s(x2));
mul_mux2 sh_36_ ( .d1(areg[37]), .z(ain[36]), .d0(areg[36]), .s(x2));
mul_mux2 sh_35_ ( .d1(areg[36]), .z(ain[35]), .d0(areg[35]), .s(x2));
mul_mux2 sh_34_ ( .d1(areg[35]), .z(ain[34]), .d0(areg[34]), .s(x2));
mul_mux2 sh_33_ ( .d1(areg[34]), .z(ain[33]), .d0(areg[33]), .s(x2));
mul_mux2 sh_32_ ( .d1(areg[33]), .z(ain[32]), .d0(areg[32]), .s(x2));
mul_mux2 sh_31_ ( .d1(areg[32]), .z(ain[31]), .d0(areg[31]), .s(x2));
mul_mux2 sh_30_ ( .d1(areg[31]), .z(ain[30]), .d0(areg[30]), .s(x2));
mul_mux2 sh_29_ ( .d1(areg[30]), .z(ain[29]), .d0(areg[29]), .s(x2));
mul_mux2 sh_28_ ( .d1(areg[29]), .z(ain[28]), .d0(areg[28]), .s(x2));
mul_mux2 sh_27_ ( .d1(areg[28]), .z(ain[27]), .d0(areg[27]), .s(x2));
mul_mux2 sh_26_ ( .d1(areg[27]), .z(ain[26]), .d0(areg[26]), .s(x2));
mul_mux2 sh_25_ ( .d1(areg[26]), .z(ain[25]), .d0(areg[25]), .s(x2));
mul_mux2 sh_24_ ( .d1(areg[25]), .z(ain[24]), .d0(areg[24]), .s(x2));
mul_mux2 sh_23_ ( .d1(areg[24]), .z(ain[23]), .d0(areg[23]), .s(x2));
mul_mux2 sh_22_ ( .d1(areg[23]), .z(ain[22]), .d0(areg[22]), .s(x2));
mul_mux2 sh_21_ ( .d1(areg[22]), .z(ain[21]), .d0(areg[21]), .s(x2));
mul_mux2 sh_20_ ( .d1(areg[21]), .z(ain[20]), .d0(areg[20]), .s(x2));
mul_mux2 sh_96_ ( .d1(1'b0), .z(ain[96]), .d0(areg[96]),
     .s(x2));
mul_mux2 sh_95_ ( .d1(areg[96]), .z(ain[95]), .d0(areg[95]), .s(x2));
mul_mux2 sh_94_ ( .d1(areg[95]), .z(ain[94]), .d0(areg[94]), .s(x2));
mul_mux2 sh_93_ ( .d1(areg[94]), .z(ain[93]), .d0(areg[93]), .s(x2));
mul_mux2 sh_92_ ( .d1(areg[93]), .z(ain[92]), .d0(areg[92]), .s(x2));
mul_mux2 sh_91_ ( .d1(areg[92]), .z(ain[91]), .d0(areg[91]), .s(x2));
mul_mux2 sh_90_ ( .d1(areg[91]), .z(ain[90]), .d0(areg[90]), .s(x2));
mul_mux2 sh_89_ ( .d1(areg[90]), .z(ain[89]), .d0(areg[89]), .s(x2));
mul_mux2 sh_88_ ( .d1(areg[89]), .z(ain[88]), .d0(areg[88]), .s(x2));
mul_mux2 sh_87_ ( .d1(areg[88]), .z(ain[87]), .d0(areg[87]), .s(x2));
mul_mux2 sh_86_ ( .d1(areg[87]), .z(ain[86]), .d0(areg[86]), .s(x2));
mul_mux2 sh_85_ ( .d1(areg[86]), .z(ain[85]), .d0(areg[85]), .s(x2));
mul_mux2 sh_84_ ( .d1(areg[85]), .z(ain[84]), .d0(areg[84]), .s(x2));
mul_mux2 sh_0_ ( .d1(areg[1]), .z(ain[0]), .d0(areg[0]), .s(x2));
mul_mux2 sh_81_ ( .d1(areg[82]), .z(ain[81]), .d0(areg[81]), .s(x2));
mul_mux2 sh_80_ ( .d1(areg[81]), .z(ain[80]), .d0(areg[80]), .s(x2));
mul_mux2 sh_79_ ( .d1(areg[80]), .z(ain[79]), .d0(areg[79]), .s(x2));
mul_mux2 sh_78_ ( .d1(areg[79]), .z(ain[78]), .d0(areg[78]), .s(x2));
mul_mux2 sh_77_ ( .d1(areg[78]), .z(ain[77]), .d0(areg[77]), .s(x2));
mul_mux2 sh_76_ ( .d1(areg[77]), .z(ain[76]), .d0(areg[76]), .s(x2));
mul_mux2 sh_75_ ( .d1(areg[76]), .z(ain[75]), .d0(areg[75]), .s(x2));
mul_mux2 sh_74_ ( .d1(areg[75]), .z(ain[74]), .d0(areg[74]), .s(x2));
mul_mux2 sh_73_ ( .d1(areg[74]), .z(ain[73]), .d0(areg[73]), .s(x2));
mul_mux2 sh_72_ ( .d1(areg[73]), .z(ain[72]), .d0(areg[72]), .s(x2));
mul_mux2 sh_71_ ( .d1(areg[72]), .z(ain[71]), .d0(areg[71]), .s(x2));
mul_mux2 sh_70_ ( .d1(areg[71]), .z(ain[70]), .d0(areg[70]), .s(x2));
mul_mux2 sh_69_ ( .d1(areg[70]), .z(ain[69]), .d0(areg[69]), .s(x2));
mul_mux2 sh_19_ ( .d1(areg[20]), .z(ain[19]), .d0(areg[19]), .s(x2));
mul_mux2 sh_18_ ( .d1(areg[19]), .z(ain[18]), .d0(areg[18]), .s(x2));
mul_mux2 sh_17_ ( .d1(areg[18]), .z(ain[17]), .d0(areg[17]), .s(x2));
mul_mux2 sh_16_ ( .d1(areg[17]), .z(ain[16]), .d0(areg[16]), .s(x2));
mul_mux2 sh_15_ ( .d1(areg[16]), .z(ain[15]), .d0(areg[15]), .s(x2));
mul_mux2 sh_4_ ( .d1(areg[5]), .z(ain[4]), .d0(areg[4]), .s(x2));
mul_mux2 sh_3_ ( .d1(areg[4]), .z(ain[3]), .d0(areg[3]), .s(x2));
mul_mux2 sh_2_ ( .d1(areg[3]), .z(ain[2]), .d0(areg[2]), .s(x2));
mul_mux2 sh_1_ ( .d1(areg[2]), .z(ain[1]), .d0(areg[1]), .s(x2));
mul_mux2 shx2 ( .d1(areg[0]), .z(ainx2), .d0(1'b0),
     .s(x2));
mul_mux2 sh_83_ ( .d1(areg[84]), .z(ain[83]), .d0(areg[83]), .s(x2));
mul_mux2 sh_14_ ( .d1(areg[15]), .z(ain[14]), .d0(areg[14]), .s(x2));
mul_mux2 sh_13_ ( .d1(areg[14]), .z(ain[13]), .d0(areg[13]), .s(x2));
mul_mux2 sh_12_ ( .d1(areg[13]), .z(ain[12]), .d0(areg[12]), .s(x2));
mul_mux2 sh_11_ ( .d1(areg[12]), .z(ain[11]), .d0(areg[11]), .s(x2));
mul_mux2 sh_10_ ( .d1(areg[11]), .z(ain[10]), .d0(areg[10]), .s(x2));
mul_mux2 sh_9_ ( .d1(areg[10]), .z(ain[9]), .d0(areg[9]), .s(x2));
mul_mux2 sh_8_ ( .d1(areg[9]), .z(ain[8]), .d0(areg[8]), .s(x2));
mul_mux2 sh_7_ ( .d1(areg[8]), .z(ain[7]), .d0(areg[7]), .s(x2));
mul_mux2 sh_6_ ( .d1(areg[7]), .z(ain[6]), .d0(areg[6]), .s(x2));
mul_mux2 sh_5_ ( .d1(areg[6]), .z(ain[5]), .d0(areg[5]), .s(x2));
mul_csa42  sc3_68_ ( .cin(co[67]), .d(1'b0),
     .carry(c3[68]), .c(c2[67]), .b(s2[68]), .a(1'b0),
     .cout(), .sum(s3[68]));
mul_csa42  sc3_67_ ( .cin(co[66]), .d(1'b0),
     .carry(c3[67]), .c(c2[66]), .b(s2[67]), .a(s1[67]), .cout(co[67]),
     .sum(s3[67]));
mul_csa42  sc3_66_ ( .cin(co[65]), .d(c1[65]), .carry(c3[66]),
     .c(c2[65]), .b(s2[66]), .a(s1[66]), .cout(co[66]), .sum(s3[66]));
mul_csa42  sc3_65_ ( .cin(co[64]), .d(c1[64]), .carry(c3[65]),
     .c(c2[64]), .b(s2[65]), .a(s1[65]), .cout(co[65]), .sum(s3[65]));
mul_csa42  sc3_64_ ( .cin(co[63]), .d(c1[63]), .carry(c3[64]),
     .c(c2[63]), .b(s2[64]), .a(s1[64]), .cout(co[64]), .sum(s3[64]));
mul_csa42  sc3_63_ ( .cin(co[62]), .d(c1[62]), .carry(c3[63]),
     .c(c2[62]), .b(s2[63]), .a(s1[63]), .cout(co[63]), .sum(s3[63]));
mul_csa42  sc3_62_ ( .cin(co[61]), .d(c1[61]), .carry(c3[62]),
     .c(c2[61]), .b(s2[62]), .a(s1[62]), .cout(co[62]), .sum(s3[62]));
mul_csa42  sc3_61_ ( .cin(co[60]), .d(c1[60]), .carry(c3[61]),
     .c(c2[60]), .b(s2[61]), .a(s1[61]), .cout(co[61]), .sum(s3[61]));
mul_csa42  sc3_60_ ( .cin(co[59]), .d(c1[59]), .carry(c3[60]),
     .c(c2[59]), .b(s2[60]), .a(s1[60]), .cout(co[60]), .sum(s3[60]));
mul_csa42  sc3_59_ ( .cin(co[58]), .d(c1[58]), .carry(c3[59]),
     .c(c2[58]), .b(s2[59]), .a(s1[59]), .cout(co[59]), .sum(s3[59]));
mul_csa42  sc3_58_ ( .cin(co[57]), .d(c1[57]), .carry(c3[58]),
     .c(c2[57]), .b(s2[58]), .a(s1[58]), .cout(co[58]), .sum(s3[58]));
mul_csa42  sc3_57_ ( .cin(co[56]), .d(c1[56]), .carry(c3[57]),
     .c(c2[56]), .b(s2[57]), .a(s1[57]), .cout(co[57]), .sum(s3[57]));
mul_csa42  sc3_56_ ( .cin(co[55]), .d(c1[55]), .carry(c3[56]),
     .c(c2[55]), .b(s2[56]), .a(s1[56]), .cout(co[56]), .sum(s3[56]));
mul_csa42  sc3_55_ ( .cin(co[54]), .d(c1[54]), .carry(c3[55]),
     .c(c2[54]), .b(s2[55]), .a(s1[55]), .cout(co[55]), .sum(s3[55]));
mul_csa42  sc3_54_ ( .cin(co[53]), .d(c1[53]), .carry(c3[54]),
     .c(c2[53]), .b(s2[54]), .a(s1[54]), .cout(co[54]), .sum(s3[54]));
mul_csa42  sc3_53_ ( .cin(co[52]), .d(c1[52]), .carry(c3[53]),
     .c(c2[52]), .b(s2[53]), .a(s1[53]), .cout(co[53]), .sum(s3[53]));
mul_csa42  sc3_52_ ( .cin(co[51]), .d(c1[51]), .carry(c3[52]),
     .c(c2[51]), .b(s2[52]), .a(s1[52]), .cout(co[52]), .sum(s3[52]));
mul_csa42  sc3_51_ ( .cin(co[50]), .d(c1[50]), .carry(c3[51]),
     .c(c2[50]), .b(s2[51]), .a(s1[51]), .cout(co[51]), .sum(s3[51]));
mul_csa42  sc3_50_ ( .cin(co[49]), .d(c1[49]), .carry(c3[50]),
     .c(c2[49]), .b(s2[50]), .a(s1[50]), .cout(co[50]), .sum(s3[50]));
mul_csa42  sc3_49_ ( .cin(co[48]), .d(c1[48]), .carry(c3[49]),
     .c(c2[48]), .b(s2[49]), .a(s1[49]), .cout(co[49]), .sum(s3[49]));
mul_csa42  sc3_48_ ( .cin(co[47]), .d(c1[47]), .carry(c3[48]),
     .c(c2[47]), .b(s2[48]), .a(s1[48]), .cout(co[48]), .sum(s3[48]));
mul_csa42  sc3_47_ ( .cin(co[46]), .d(c1[46]), .carry(c3[47]),
     .c(c2[46]), .b(s2[47]), .a(s1[47]), .cout(co[47]), .sum(s3[47]));
mul_csa42  sc3_46_ ( .cin(co[45]), .d(c1[45]), .carry(c3[46]),
     .c(c2[45]), .b(s2[46]), .a(s1[46]), .cout(co[46]), .sum(s3[46]));
mul_csa42  sc3_45_ ( .cin(co[44]), .d(c1[44]), .carry(c3[45]),
     .c(c2[44]), .b(s2[45]), .a(s1[45]), .cout(co[45]), .sum(s3[45]));
mul_csa42  sc3_44_ ( .cin(co[43]), .d(c1[43]), .carry(c3[44]),
     .c(c2[43]), .b(s2[44]), .a(s1[44]), .cout(co[44]), .sum(s3[44]));
mul_csa42  sc3_43_ ( .cin(co[42]), .d(c1[42]), .carry(c3[43]),
     .c(c2[42]), .b(s2[43]), .a(s1[43]), .cout(co[43]), .sum(s3[43]));
mul_csa42  sc3_42_ ( .cin(co[41]), .d(c1[41]), .carry(c3[42]),
     .c(c2[41]), .b(s2[42]), .a(s1[42]), .cout(co[42]), .sum(s3[42]));
mul_csa42  sc3_41_ ( .cin(co[40]), .d(c1[40]), .carry(c3[41]),
     .c(c2[40]), .b(s2[41]), .a(s1[41]), .cout(co[41]), .sum(s3[41]));
mul_csa42  sc3_40_ ( .cin(co[39]), .d(c1[39]), .carry(c3[40]),
     .c(c2[39]), .b(s2[40]), .a(s1[40]), .cout(co[40]), .sum(s3[40]));
mul_csa42  sc3_39_ ( .cin(co[38]), .d(c1[38]), .carry(c3[39]),
     .c(c2[38]), .b(s2[39]), .a(s1[39]), .cout(co[39]), .sum(s3[39]));
mul_csa42  sc3_38_ ( .cin(co[37]), .d(c1[37]), .carry(c3[38]),
     .c(c2[37]), .b(s2[38]), .a(s1[38]), .cout(co[38]), .sum(s3[38]));
mul_csa42  sc3_37_ ( .cin(co[36]), .d(c1[36]), .carry(c3[37]),
     .c(c2[36]), .b(s2[37]), .a(s1[37]), .cout(co[37]), .sum(s3[37]));
mul_csa42  sc3_36_ ( .cin(co[35]), .d(c1[35]), .carry(c3[36]),
     .c(c2[35]), .b(s2[36]), .a(s1[36]), .cout(co[36]), .sum(s3[36]));
mul_csa42  sc3_35_ ( .cin(co[34]), .d(c1[34]), .carry(c3[35]),
     .c(c2[34]), .b(s2[35]), .a(s1[35]), .cout(co[35]), .sum(s3[35]));
mul_csa42  sc3_34_ ( .cin(co[33]), .d(c1[33]), .carry(c3[34]),
     .c(c2[33]), .b(s2[34]), .a(s1[34]), .cout(co[34]), .sum(s3[34]));
mul_csa42  sc3_33_ ( .cin(co[32]), .d(c1[32]), .carry(c3[33]),
     .c(c2[32]), .b(s2[33]), .a(s1[33]), .cout(co[33]), .sum(s3[33]));
mul_csa42  sc3_32_ ( .cin(co[31]), .d(c1[31]), .carry(c3[32]),
     .c(c2[31]), .b(s2[32]), .a(s1[32]), .cout(co[32]), .sum(s3[32]));
mul_csa42  sc3_31_ ( .cin(co[30]), .d(c1[30]), .carry(c3[31]),
     .c(c2[30]), .b(s2[31]), .a(s1[31]), .cout(co[31]), .sum(s3[31]));
mul_csa42  sc3_30_ ( .cin(co[29]), .d(c1[29]), .carry(c3[30]),
     .c(c2[29]), .b(s2[30]), .a(s1[30]), .cout(co[30]), .sum(s3[30]));
mul_csa42  sc3_29_ ( .cin(co[28]), .d(c1[28]), .carry(c3[29]),
     .c(c2[28]), .b(s2[29]), .a(s1[29]), .cout(co[29]), .sum(s3[29]));
mul_csa42  sc3_28_ ( .cin(co[27]), .d(c1[27]), .carry(c3[28]),
     .c(c2[27]), .b(s2[28]), .a(s1[28]), .cout(co[28]), .sum(s3[28]));
mul_csa42  sc3_27_ ( .cin(co[26]), .d(c1[26]), .carry(c3[27]),
     .c(c2[26]), .b(s2[27]), .a(s1[27]), .cout(co[27]), .sum(s3[27]));
mul_csa42  sc3_26_ ( .cin(co[25]), .d(c1[25]), .carry(c3[26]),
     .c(c2[25]), .b(s2[26]), .a(s1[26]), .cout(co[26]), .sum(s3[26]));
mul_csa42  sc3_25_ ( .cin(co[24]), .d(c1[24]), .carry(c3[25]),
     .c(c2[24]), .b(s2[25]), .a(s1[25]), .cout(co[25]), .sum(s3[25]));
mul_csa42  sc3_24_ ( .cin(co[23]), .d(c1[23]), .carry(c3[24]),
     .c(c2[23]), .b(s2[24]), .a(s1[24]), .cout(co[24]), .sum(s3[24]));
mul_csa42  sc3_23_ ( .cin(co[22]), .d(c1[22]), .carry(c3[23]),
     .c(c2[22]), .b(s2[23]), .a(s1[23]), .cout(co[23]), .sum(s3[23]));
mul_csa42  sc3_22_ ( .cin(co[21]), .d(c1[21]), .carry(c3[22]),
     .c(c2[21]), .b(s2[22]), .a(s1[22]), .cout(co[22]), .sum(s3[22]));
mul_csa42  sc3_21_ ( .cin(co[20]), .d(c1[20]), .carry(c3[21]),
     .c(c2[20]), .b(s2[21]), .a(s1[21]), .cout(co[21]), .sum(s3[21]));
mul_csa42  sc3_20_ ( .cin(1'b0), .d(c1[19]),
     .carry(c3[20]), .c(c2[19]), .b(s2[20]), .a(s1[20]), .cout(co[20]),
     .sum(s3[20]));
mul_csa32  sc4_82_ ( .c(c3[81]), .b(s2[82]), .a(ain[82]),
     .cout(pcout[82]), .sum(psum[82]));
mul_csa32  sc4_68_ ( .c(c3[67]), .b(s3[68]), .a(ain[68]),
     .cout(pcout[68]), .sum(psum[68]));
mul_csa32  sc4_67_ ( .c(c3[66]), .b(s3[67]), .a(ain[67]),
     .cout(pcout[67]), .sum(psum[67]));
mul_csa32  sc4_66_ ( .c(c3[65]), .b(s3[66]), .a(ain[66]),
     .cout(pcout[66]), .sum(psum[66]));
mul_csa32  sc4_65_ ( .c(c3[64]), .b(s3[65]), .a(ain[65]),
     .cout(pcout[65]), .sum(psum[65]));
mul_csa32  sc4_64_ ( .c(c3[63]), .b(s3[64]), .a(ain[64]),
     .cout(pcout[64]), .sum(psum[64]));
mul_csa32  sc4_63_ ( .c(c3[62]), .b(s3[63]), .a(ain[63]),
     .cout(pcout[63]), .sum(psum[63]));
mul_csa32  sc4_62_ ( .c(c3[61]), .b(s3[62]), .a(ain[62]),
     .cout(pcout[62]), .sum(psum[62]));
mul_csa32  sc4_61_ ( .c(c3[60]), .b(s3[61]), .a(ain[61]),
     .cout(pcout[61]), .sum(psum[61]));
mul_csa32  sc4_60_ ( .c(c3[59]), .b(s3[60]), .a(ain[60]),
     .cout(pcout[60]), .sum(psum[60]));
mul_csa32  sc4_59_ ( .c(c3[58]), .b(s3[59]), .a(ain[59]),
     .cout(pcout[59]), .sum(psum[59]));
mul_csa32  sc4_58_ ( .c(c3[57]), .b(s3[58]), .a(ain[58]),
     .cout(pcout[58]), .sum(psum[58]));
mul_csa32  sc4_57_ ( .c(c3[56]), .b(s3[57]), .a(ain[57]),
     .cout(pcout[57]), .sum(psum[57]));
mul_csa32  sc4_56_ ( .c(c3[55]), .b(s3[56]), .a(ain[56]),
     .cout(pcout[56]), .sum(psum[56]));
mul_csa32  sc4_55_ ( .c(c3[54]), .b(s3[55]), .a(ain[55]),
     .cout(pcout[55]), .sum(psum[55]));
mul_csa32  sc4_54_ ( .c(c3[53]), .b(s3[54]), .a(ain[54]),
     .cout(pcout[54]), .sum(psum[54]));
mul_csa32  sc4_53_ ( .c(c3[52]), .b(s3[53]), .a(ain[53]),
     .cout(pcout[53]), .sum(psum[53]));
mul_csa32  sc4_52_ ( .c(c3[51]), .b(s3[52]), .a(ain[52]),
     .cout(pcout[52]), .sum(psum[52]));
mul_csa32  sc4_51_ ( .c(c3[50]), .b(s3[51]), .a(ain[51]),
     .cout(pcout[51]), .sum(psum[51]));
mul_csa32  sc4_50_ ( .c(c3[49]), .b(s3[50]), .a(ain[50]),
     .cout(pcout[50]), .sum(psum[50]));
mul_csa32  sc4_49_ ( .c(c3[48]), .b(s3[49]), .a(ain[49]),
     .cout(pcout[49]), .sum(psum[49]));
mul_csa32  sc4_48_ ( .c(c3[47]), .b(s3[48]), .a(ain[48]),
     .cout(pcout[48]), .sum(psum[48]));
mul_csa32  sc4_47_ ( .c(c3[46]), .b(s3[47]), .a(ain[47]),
     .cout(pcout[47]), .sum(psum[47]));
mul_csa32  sc4_46_ ( .c(c3[45]), .b(s3[46]), .a(ain[46]),
     .cout(pcout[46]), .sum(psum[46]));
mul_csa32  sc4_45_ ( .c(c3[44]), .b(s3[45]), .a(ain[45]),
     .cout(pcout[45]), .sum(psum[45]));
mul_csa32  sc4_44_ ( .c(c3[43]), .b(s3[44]), .a(ain[44]),
     .cout(pcout[44]), .sum(psum[44]));
mul_csa32  sc4_43_ ( .c(c3[42]), .b(s3[43]), .a(ain[43]),
     .cout(pcout[43]), .sum(psum[43]));
mul_csa32  sc4_42_ ( .c(c3[41]), .b(s3[42]), .a(ain[42]),
     .cout(pcout[42]), .sum(psum[42]));
mul_csa32  sc4_41_ ( .c(c3[40]), .b(s3[41]), .a(ain[41]),
     .cout(pcout[41]), .sum(psum[41]));
mul_csa32  sc4_40_ ( .c(c3[39]), .b(s3[40]), .a(ain[40]),
     .cout(pcout[40]), .sum(psum[40]));
mul_csa32  sc4_39_ ( .c(c3[38]), .b(s3[39]), .a(ain[39]),
     .cout(pcout[39]), .sum(psum[39]));
mul_csa32  sc4_38_ ( .c(c3[37]), .b(s3[38]), .a(ain[38]),
     .cout(pcout[38]), .sum(psum[38]));
mul_csa32  sc4_37_ ( .c(c3[36]), .b(s3[37]), .a(ain[37]),
     .cout(pcout[37]), .sum(psum[37]));
mul_csa32  sc4_36_ ( .c(c3[35]), .b(s3[36]), .a(ain[36]),
     .cout(pcout[36]), .sum(psum[36]));
mul_csa32  sc4_35_ ( .c(c3[34]), .b(s3[35]), .a(ain[35]),
     .cout(pcout[35]), .sum(psum[35]));
mul_csa32  sc4_34_ ( .c(c3[33]), .b(s3[34]), .a(ain[34]),
     .cout(pcout[34]), .sum(psum[34]));
mul_csa32  sc4_33_ ( .c(c3[32]), .b(s3[33]), .a(ain[33]),
     .cout(pcout[33]), .sum(psum[33]));
mul_csa32  sc4_32_ ( .c(c3[31]), .b(s3[32]), .a(ain[32]),
     .cout(pcout[32]), .sum(psum[32]));
mul_csa32  sc4_31_ ( .c(c3[30]), .b(s3[31]), .a(ain[31]),
     .cout(pcout[31]), .sum(psum[31]));
mul_csa32  sc4_30_ ( .c(c3[29]), .b(s3[30]), .a(ain[30]),
     .cout(pcout[30]), .sum(psum[30]));
mul_csa32  sc4_29_ ( .c(c3[28]), .b(s3[29]), .a(ain[29]),
     .cout(pcout[29]), .sum(psum[29]));
mul_csa32  sc4_28_ ( .c(c3[27]), .b(s3[28]), .a(ain[28]),
     .cout(pcout[28]), .sum(psum[28]));
mul_csa32  sc4_27_ ( .c(c3[26]), .b(s3[27]), .a(ain[27]),
     .cout(pcout[27]), .sum(psum[27]));
mul_csa32  sc4_26_ ( .c(c3[25]), .b(s3[26]), .a(ain[26]),
     .cout(pcout[26]), .sum(psum[26]));
mul_csa32  sc4_25_ ( .c(c3[24]), .b(s3[25]), .a(ain[25]),
     .cout(pcout[25]), .sum(psum[25]));
mul_csa32  sc4_24_ ( .c(c3[23]), .b(s3[24]), .a(ain[24]),
     .cout(pcout[24]), .sum(psum[24]));
mul_csa32  sc4_23_ ( .c(c3[22]), .b(s3[23]), .a(ain[23]),
     .cout(pcout[23]), .sum(psum[23]));
mul_csa32  sc4_22_ ( .c(c3[21]), .b(s3[22]), .a(ain[22]),
     .cout(pcout[22]), .sum(psum[22]));
mul_csa32  sc4_21_ ( .c(c3[20]), .b(s3[21]), .a(ain[21]),
     .cout(pcout[21]), .sum(psum[21]));
mul_csa32  sc4_20_ ( .c(c3[19]), .b(s3[20]), .a(ain[20]),
     .cout(pcout[20]), .sum(psum[20]));
mul_csa32  sc4_96_ ( .c(c2[95]), .b(s2[96]), .a(ain[96]),
     .cout(pcout[96]), .sum(psum[96]));
mul_csa32  sc4_95_ ( .c(c2[94]), .b(s2[95]), .a(ain[95]),
     .cout(pcout[95]), .sum(psum[95]));
mul_csa32  sc4_94_ ( .c(c2[93]), .b(s2[94]), .a(ain[94]),
     .cout(pcout[94]), .sum(psum[94]));
mul_csa32  sc4_93_ ( .c(c2[92]), .b(s2[93]), .a(ain[93]),
     .cout(pcout[93]), .sum(psum[93]));
mul_csa32  sc4_92_ ( .c(c2[91]), .b(s2[92]), .a(ain[92]),
     .cout(pcout[92]), .sum(psum[92]));
mul_csa32  sc4_91_ ( .c(c2[90]), .b(s2[91]), .a(ain[91]),
     .cout(pcout[91]), .sum(psum[91]));
mul_csa32  sc4_90_ ( .c(c2[89]), .b(s2[90]), .a(ain[90]),
     .cout(pcout[90]), .sum(psum[90]));
mul_csa32  sc4_89_ ( .c(c2[88]), .b(s2[89]), .a(ain[89]),
     .cout(pcout[89]), .sum(psum[89]));
mul_csa32  sc4_88_ ( .c(c2[87]), .b(s2[88]), .a(ain[88]),
     .cout(pcout[88]), .sum(psum[88]));
mul_csa32  sc4_87_ ( .c(c2[86]), .b(s2[87]), .a(ain[87]),
     .cout(pcout[87]), .sum(psum[87]));
mul_csa32  sc4_86_ ( .c(c2[85]), .b(s2[86]), .a(ain[86]),
     .cout(pcout[86]), .sum(psum[86]));
mul_csa32  sc4_85_ ( .c(c2[84]), .b(s2[85]), .a(ain[85]),
     .cout(pcout[85]), .sum(psum[85]));
mul_csa32  sc4_84_ ( .c(c2[83]), .b(s2[84]), .a(ain[84]),
     .cout(pcout[84]), .sum(psum[84]));
mul_csa32  sc4_81_ ( .c(c3[80]), .b(s3[81]), .a(ain[81]),
     .cout(pcout[81]), .sum(psum[81]));
mul_csa32  sc4_80_ ( .c(c3[79]), .b(s3[80]), .a(ain[80]),
     .cout(pcout[80]), .sum(psum[80]));
mul_csa32  sc4_79_ ( .c(c3[78]), .b(s3[79]), .a(ain[79]),
     .cout(pcout[79]), .sum(psum[79]));
mul_csa32  sc4_78_ ( .c(c3[77]), .b(s3[78]), .a(ain[78]),
     .cout(pcout[78]), .sum(psum[78]));
mul_csa32  sc4_77_ ( .c(c3[76]), .b(s3[77]), .a(ain[77]),
     .cout(pcout[77]), .sum(psum[77]));
mul_csa32  sc4_76_ ( .c(c3[75]), .b(s3[76]), .a(ain[76]),
     .cout(pcout[76]), .sum(psum[76]));
mul_csa32  sc4_75_ ( .c(c3[74]), .b(s3[75]), .a(ain[75]),
     .cout(pcout[75]), .sum(psum[75]));
mul_csa32  sc4_74_ ( .c(c3[73]), .b(s3[74]), .a(ain[74]),
     .cout(pcout[74]), .sum(psum[74]));
mul_csa32  sc4_73_ ( .c(c3[72]), .b(s3[73]), .a(ain[73]),
     .cout(pcout[73]), .sum(psum[73]));
mul_csa32  sc4_72_ ( .c(c3[71]), .b(s3[72]), .a(ain[72]),
     .cout(pcout[72]), .sum(psum[72]));
mul_csa32  sc4_71_ ( .c(c3[70]), .b(s3[71]), .a(ain[71]),
     .cout(pcout[71]), .sum(psum[71]));
mul_csa32  sc4_70_ ( .c(c3[69]), .b(s3[70]), .a(ain[70]),
     .cout(pcout[70]), .sum(psum[70]));
mul_csa32  sc4_69_ ( .c(c3[68]), .b(s3[69]), .a(ain[69]),
     .cout(pcout[69]), .sum(psum[69]));
mul_csa32  acc_4_ ( .c(c2[3]), .sum(psum[4]), .cout(pcout[4]),
     .a(ain[4]), .b(s2[4]));
mul_csa32  acc_3_ ( .c(c2[2]), .sum(psum[3]), .cout(pcout[3]),
     .a(ain[3]), .b(s2[3]));
mul_csa32  acc_2_ ( .c(c2[1]), .sum(psum[2]), .cout(pcout[2]),
     .a(ain[2]), .b(s2[2]));
mul_csa32  acc_1_ ( .c(c2[0]), .sum(psum[1]), .cout(pcout[1]),
     .a(ain[1]), .b(s2[1]));
mul_csa32  sc3_97_ ( .c(c2[96]), .sum(psum[97]), .cout(pcout[97]),
     .a(a1s[81]), .b(a1c[80]));
mul_csa32  sc1_19_ ( .c(a1s[3]), .b(pc[50]), .a(ps[51]),
     .cout(c1[19]), .sum(s1[19]));
mul_csa32  sc1_18_ ( .c(a1s[2]), .b(pc[49]), .a(ps[50]),
     .cout(c1[18]), .sum(s1[18]));
mul_csa32  sc1_17_ ( .c(a1s[1]), .b(pc[48]), .a(ps[49]),
     .cout(c1[17]), .sum(s1[17]));
mul_csa32  sc1_16_ ( .c(a1s[0]), .b(pc[47]), .a(ps[48]),
     .cout(c1[16]), .sum(s1[16]));
mul_csa32  sc1_15_ ( .c(1'b0), .b(pc[46]), .a(ps[47]),
     .cout(c1[15]), .sum(s1[15]));
mul_csa32  sc4_83_ ( .c(c2[82]), .b(s2[83]), .a(ain[83]),
     .cout(pcout[83]), .sum(psum[83]));
mul_csa32  sc2_83_ ( .c(c1[82]), .b(a1c[66]), .a(a1s[67]),
     .cout(c2[83]), .sum(s2[83]));
mul_csa32  sc2_19_ ( .c(a0c[18]), .b(a0s[19]), .a(s1[19]),
     .cout(c2[19]), .sum(s2[19]));
mul_csa32  sc2_18_ ( .c(a0c[17]), .b(a0s[18]), .a(s1[18]),
     .cout(c2[18]), .sum(s2[18]));
mul_csa32  sc2_17_ ( .c(a0c[16]), .b(a0s[17]), .a(s1[17]),
     .cout(c2[17]), .sum(s2[17]));
mul_csa32  sc2_16_ ( .c(a0c[15]), .b(a0s[16]), .a(s1[16]),
     .cout(c2[16]), .sum(s2[16]));
mul_csa32  sc2_15_ ( .c(a0c[14]), .b(a0s[15]), .a(s1[15]),
     .cout(c2[15]), .sum(s2[15]));
mul_csa32  sc1_81_ ( .c(a0s[81]), .b(a1c[64]), .a(a1s[65]),
     .cout(c1[81]), .sum(s1[81]));
mul_csa32  sc1_80_ ( .c(a0s[80]), .b(a1c[63]), .a(a1s[64]),
     .cout(c1[80]), .sum(s1[80]));
mul_csa32  sc1_79_ ( .c(a0s[79]), .b(a1c[62]), .a(a1s[63]),
     .cout(c1[79]), .sum(s1[79]));
mul_csa32  sc1_78_ ( .c(a0s[78]), .b(a1c[61]), .a(a1s[62]),
     .cout(c1[78]), .sum(s1[78]));
mul_csa32  sc1_77_ ( .c(a0s[77]), .b(a1c[60]), .a(a1s[61]),
     .cout(c1[77]), .sum(s1[77]));
mul_csa32  sc1_76_ ( .c(a0s[76]), .b(a1c[59]), .a(a1s[60]),
     .cout(c1[76]), .sum(s1[76]));
mul_csa32  sc1_75_ ( .c(a0s[75]), .b(a1c[58]), .a(a1s[59]),
     .cout(c1[75]), .sum(s1[75]));
mul_csa32  sc1_74_ ( .c(a0s[74]), .b(a1c[57]), .a(a1s[58]),
     .cout(c1[74]), .sum(s1[74]));
mul_csa32  sc1_73_ ( .c(a0s[73]), .b(a1c[56]), .a(a1s[57]),
     .cout(c1[73]), .sum(s1[73]));
mul_csa32  sc1_72_ ( .c(a0s[72]), .b(a1c[55]), .a(a1s[56]),
     .cout(c1[72]), .sum(s1[72]));
mul_csa32  sc1_71_ ( .c(a0s[71]), .b(a1c[54]), .a(a1s[55]),
     .cout(c1[71]), .sum(s1[71]));
mul_csa32  sc1_70_ ( .c(a0s[70]), .b(a1c[53]), .a(a1s[54]),
     .cout(c1[70]), .sum(s1[70]));
mul_csa32  sc1_69_ ( .c(a0s[69]), .b(a1c[52]), .a(a1s[53]),
     .cout(c1[69]), .sum(s1[69]));
mul_csa32  sc1_68_ ( .c(a0s[68]), .b(a1c[51]), .a(a1s[52]),
     .cout(c1[68]), .sum(s1[68]));
mul_csa32  sc3_19_ ( .c(c2[18]), .b(c1[18]), .a(s2[19]),
     .cout(c3[19]), .sum(s3[19]));
mul_csa32  sc3_18_ ( .c(c2[17]), .b(c1[17]), .a(s2[18]),
     .cout(c3[18]), .sum(s3[18]));
mul_csa32  sc3_17_ ( .c(c2[16]), .b(c1[16]), .a(s2[17]),
     .cout(c3[17]), .sum(s3[17]));
mul_csa32  sc3_16_ ( .c(c2[15]), .b(c1[15]), .a(s2[16]),
     .cout(c3[16]), .sum(s3[16]));
mul_csa32  sc3_15_ ( .c(c2[14]), .b(c1[14]), .a(s2[15]),
     .cout(c3[15]), .sum(s3[15]));
mul_csa32  sc1_82_ ( .c(a0c[81]), .b(a1c[65]), .a(a1s[66]),
     .cout(c1[82]), .sum(s1[82]));
mul_csa32  acc_14_ ( .c(c2[13]), .sum(psum[14]), .cout(pcout[14]),
     .a(ain[14]), .b(s2[14]));
mul_csa32  acc_13_ ( .c(c2[12]), .sum(psum[13]), .cout(pcout[13]),
     .a(ain[13]), .b(s2[13]));
mul_csa32  acc_12_ ( .c(c2[11]), .sum(psum[12]), .cout(pcout[12]),
     .a(ain[12]), .b(s2[12]));
mul_csa32  acc_11_ ( .c(c2[10]), .sum(psum[11]), .cout(pcout[11]),
     .a(ain[11]), .b(s2[11]));
mul_csa32  acc_10_ ( .c(c2[9]), .sum(psum[10]), .cout(pcout[10]),
     .a(ain[10]), .b(s2[10]));
mul_csa32  acc_9_ ( .c(c2[8]), .sum(psum[9]), .cout(pcout[9]),
     .a(ain[9]), .b(s2[9]));
mul_csa32  acc_8_ ( .c(c2[7]), .sum(psum[8]), .cout(pcout[8]),
     .a(ain[8]), .b(s2[8]));
mul_csa32  acc_7_ ( .c(c2[6]), .sum(psum[7]), .cout(pcout[7]),
     .a(ain[7]), .b(s2[7]));
mul_csa32  acc_6_ ( .c(c2[5]), .sum(psum[6]), .cout(pcout[6]),
     .a(ain[6]), .b(s2[6]));
mul_csa32  acc_5_ ( .c(c2[4]), .sum(psum[5]), .cout(pcout[5]),
     .a(ain[5]), .b(s2[5]));
mul_csa32  sc2_67_ ( .c(a0c[66]), .b(c1[66]), .a(a0s[67]),
     .cout(c2[67]), .sum(s2[67]));
mul_csa32  sc1_14_ ( .c(a0s[14]), .b(pc[45]), .a(ps[46]),
     .cout(c1[14]), .sum(s1[14]));
mul_csa32  sc1_13_ ( .c(a0s[13]), .b(pc[44]), .a(ps[45]),
     .cout(c1[13]), .sum(s1[13]));
mul_csa32  sc1_12_ ( .c(a0s[12]), .b(pc[43]), .a(ps[44]),
     .cout(c1[12]), .sum(s1[12]));
mul_csa32  sc1_11_ ( .c(a0s[11]), .b(pc[42]), .a(ps[43]),
     .cout(c1[11]), .sum(s1[11]));
mul_csa32  sc1_10_ ( .c(a0s[10]), .b(pc[41]), .a(ps[42]),
     .cout(c1[10]), .sum(s1[10]));
mul_csa32  sc1_9_ ( .c(a0s[9]), .b(pc[40]), .a(ps[41]), .cout(c1[9]),
     .sum(s1[9]));
mul_csa32  sc1_8_ ( .c(a0s[8]), .b(pc[39]), .a(ps[40]), .cout(c1[8]),
     .sum(s1[8]));
mul_csa32  sc1_7_ ( .c(a0s[7]), .b(pc[38]), .a(ps[39]), .cout(c1[7]),
     .sum(s1[7]));
mul_csa32  sc1_6_ ( .c(a0s[6]), .b(pc[37]), .a(ps[38]), .cout(c1[6]),
     .sum(s1[6]));
mul_csa32  sc1_5_ ( .c(a0s[5]), .b(pc[36]), .a(ps[37]), .cout(c1[5]),
     .sum(s1[5]));
mul_csa32  sc2_14_ ( .c(a0c[13]), .b(c1[13]), .a(s1[14]),
     .cout(c2[14]), .sum(s2[14]));
mul_csa32  sc2_13_ ( .c(a0c[12]), .b(c1[12]), .a(s1[13]),
     .cout(c2[13]), .sum(s2[13]));
mul_csa32  sc2_12_ ( .c(a0c[11]), .b(c1[11]), .a(s1[12]),
     .cout(c2[12]), .sum(s2[12]));
mul_csa32  sc2_11_ ( .c(a0c[10]), .b(c1[10]), .a(s1[11]),
     .cout(c2[11]), .sum(s2[11]));
mul_csa32  sc2_10_ ( .c(a0c[9]), .b(c1[9]), .a(s1[10]),
     .cout(c2[10]), .sum(s2[10]));
mul_csa32  sc2_9_ ( .c(a0c[8]), .b(c1[8]), .a(s1[9]), .cout(c2[9]),
     .sum(s2[9]));
mul_csa32  sc2_8_ ( .c(a0c[7]), .b(c1[7]), .a(s1[8]), .cout(c2[8]),
     .sum(s2[8]));
mul_csa32  sc2_7_ ( .c(a0c[6]), .b(c1[6]), .a(s1[7]), .cout(c2[7]),
     .sum(s2[7]));
mul_csa32  sc2_6_ ( .c(a0c[5]), .b(c1[5]), .a(s1[6]), .cout(c2[6]),
     .sum(s2[6]));
mul_csa32  sc2_5_ ( .c(a0c[4]), .b(c1[4]), .a(s1[5]), .cout(c2[5]),
     .sum(s2[5]));
mul_csa32  sc2_82_ ( .c(c2[81]), .b(c1[81]), .a(s1[82]),
     .cout(c2[82]), .sum(s2[82]));
mul_csa32  sc1_4_ ( .c(a0s[4]), .b(pc[35]), .a(ps[36]), .cout(c1[4]),
     .sum(s1[4]));
mul_csa32  sc1_3_ ( .c(a0s[3]), .b(pc[34]), .a(ps[35]), .cout(c1[3]),
     .sum(s1[3]));
mul_csa32  sc1_2_ ( .c(a0s[2]), .b(pc[33]), .a(ps[34]), .cout(c1[2]),
     .sum(s1[2]));
mul_csa32  sc1_1_ ( .c(a0s[1]), .b(pc[32]), .a(ps[33]), .cout(c1[1]),
     .sum(s1[1]));
mul_csa32  sc2_66_ ( .c(a0c[65]), .b(a0s[66]), .a(a1c[49]),
     .cout(c2[66]), .sum(s2[66]));
mul_csa32  sc2_65_ ( .c(a0c[64]), .b(a0s[65]), .a(a1c[48]),
     .cout(c2[65]), .sum(s2[65]));
mul_csa32  sc2_64_ ( .c(a0c[63]), .b(a0s[64]), .a(a1c[47]),
     .cout(c2[64]), .sum(s2[64]));
mul_csa32  sc2_63_ ( .c(a0c[62]), .b(a0s[63]), .a(a1c[46]),
     .cout(c2[63]), .sum(s2[63]));
mul_csa32  sc2_62_ ( .c(a0c[61]), .b(a0s[62]), .a(a1c[45]),
     .cout(c2[62]), .sum(s2[62]));
mul_csa32  sc2_61_ ( .c(a0c[60]), .b(a0s[61]), .a(a1c[44]),
     .cout(c2[61]), .sum(s2[61]));
mul_csa32  sc2_60_ ( .c(a0c[59]), .b(a0s[60]), .a(a1c[43]),
     .cout(c2[60]), .sum(s2[60]));
mul_csa32  sc2_59_ ( .c(a0c[58]), .b(a0s[59]), .a(a1c[42]),
     .cout(c2[59]), .sum(s2[59]));
mul_csa32  sc2_58_ ( .c(a0c[57]), .b(a0s[58]), .a(a1c[41]),
     .cout(c2[58]), .sum(s2[58]));
mul_csa32  sc2_57_ ( .c(a0c[56]), .b(a0s[57]), .a(a1c[40]),
     .cout(c2[57]), .sum(s2[57]));
mul_csa32  sc2_56_ ( .c(a0c[55]), .b(a0s[56]), .a(a1c[39]),
     .cout(c2[56]), .sum(s2[56]));
mul_csa32  sc2_55_ ( .c(a0c[54]), .b(a0s[55]), .a(a1c[38]),
     .cout(c2[55]), .sum(s2[55]));
mul_csa32  sc2_54_ ( .c(a0c[53]), .b(a0s[54]), .a(a1c[37]),
     .cout(c2[54]), .sum(s2[54]));
mul_csa32  sc2_53_ ( .c(a0c[52]), .b(a0s[53]), .a(a1c[36]),
     .cout(c2[53]), .sum(s2[53]));
mul_csa32  sc2_52_ ( .c(a0c[51]), .b(a0s[52]), .a(a1c[35]),
     .cout(c2[52]), .sum(s2[52]));
mul_csa32  sc2_51_ ( .c(a0c[50]), .b(a0s[51]), .a(a1c[34]),
     .cout(c2[51]), .sum(s2[51]));
mul_csa32  sc2_50_ ( .c(a0c[49]), .b(a0s[50]), .a(a1c[33]),
     .cout(c2[50]), .sum(s2[50]));
mul_csa32  sc2_49_ ( .c(a0c[48]), .b(a0s[49]), .a(a1c[32]),
     .cout(c2[49]), .sum(s2[49]));
mul_csa32  sc2_48_ ( .c(a0c[47]), .b(a0s[48]), .a(a1c[31]),
     .cout(c2[48]), .sum(s2[48]));
mul_csa32  sc2_47_ ( .c(a0c[46]), .b(a0s[47]), .a(a1c[30]),
     .cout(c2[47]), .sum(s2[47]));
mul_csa32  sc2_46_ ( .c(a0c[45]), .b(a0s[46]), .a(a1c[29]),
     .cout(c2[46]), .sum(s2[46]));
mul_csa32  sc2_45_ ( .c(a0c[44]), .b(a0s[45]), .a(a1c[28]),
     .cout(c2[45]), .sum(s2[45]));
mul_csa32  sc2_44_ ( .c(a0c[43]), .b(a0s[44]), .a(a1c[27]),
     .cout(c2[44]), .sum(s2[44]));
mul_csa32  sc2_43_ ( .c(a0c[42]), .b(a0s[43]), .a(a1c[26]),
     .cout(c2[43]), .sum(s2[43]));
mul_csa32  sc2_42_ ( .c(a0c[41]), .b(a0s[42]), .a(a1c[25]),
     .cout(c2[42]), .sum(s2[42]));
mul_csa32  sc2_41_ ( .c(a0c[40]), .b(a0s[41]), .a(a1c[24]),
     .cout(c2[41]), .sum(s2[41]));
mul_csa32  sc2_40_ ( .c(a0c[39]), .b(a0s[40]), .a(a1c[23]),
     .cout(c2[40]), .sum(s2[40]));
mul_csa32  sc2_39_ ( .c(a0c[38]), .b(a0s[39]), .a(a1c[22]),
     .cout(c2[39]), .sum(s2[39]));
mul_csa32  sc2_38_ ( .c(a0c[37]), .b(a0s[38]), .a(a1c[21]),
     .cout(c2[38]), .sum(s2[38]));
mul_csa32  sc2_37_ ( .c(a0c[36]), .b(a0s[37]), .a(a1c[20]),
     .cout(c2[37]), .sum(s2[37]));
mul_csa32  sc2_36_ ( .c(a0c[35]), .b(a0s[36]), .a(a1c[19]),
     .cout(c2[36]), .sum(s2[36]));
mul_csa32  sc2_35_ ( .c(a0c[34]), .b(a0s[35]), .a(a1c[18]),
     .cout(c2[35]), .sum(s2[35]));
mul_csa32  sc2_34_ ( .c(a0c[33]), .b(a0s[34]), .a(a1c[17]),
     .cout(c2[34]), .sum(s2[34]));
mul_csa32  sc2_33_ ( .c(a0c[32]), .b(a0s[33]), .a(a1c[16]),
     .cout(c2[33]), .sum(s2[33]));
mul_csa32  sc2_32_ ( .c(a0c[31]), .b(a0s[32]), .a(a1c[15]),
     .cout(c2[32]), .sum(s2[32]));
mul_csa32  sc2_31_ ( .c(a0c[30]), .b(a0s[31]), .a(a1c[14]),
     .cout(c2[31]), .sum(s2[31]));
mul_csa32  sc2_30_ ( .c(a0c[29]), .b(a0s[30]), .a(a1c[13]),
     .cout(c2[30]), .sum(s2[30]));
mul_csa32  sc2_29_ ( .c(a0c[28]), .b(a0s[29]), .a(a1c[12]),
     .cout(c2[29]), .sum(s2[29]));
mul_csa32  sc2_28_ ( .c(a0c[27]), .b(a0s[28]), .a(a1c[11]),
     .cout(c2[28]), .sum(s2[28]));
mul_csa32  sc2_27_ ( .c(a0c[26]), .b(a0s[27]), .a(a1c[10]),
     .cout(c2[27]), .sum(s2[27]));
mul_csa32  sc2_26_ ( .c(a0c[25]), .b(a0s[26]), .a(a1c[9]),
     .cout(c2[26]), .sum(s2[26]));
mul_csa32  sc2_25_ ( .c(a0c[24]), .b(a0s[25]), .a(a1c[8]),
     .cout(c2[25]), .sum(s2[25]));
mul_csa32  sc2_24_ ( .c(a0c[23]), .b(a0s[24]), .a(a1c[7]),
     .cout(c2[24]), .sum(s2[24]));
mul_csa32  sc2_23_ ( .c(a0c[22]), .b(a0s[23]), .a(a1c[6]),
     .cout(c2[23]), .sum(s2[23]));
mul_csa32  sc2_22_ ( .c(a0c[21]), .b(a0s[22]), .a(a1c[5]),
     .cout(c2[22]), .sum(s2[22]));
mul_csa32  sc2_21_ ( .c(a0c[20]), .b(a0s[21]), .a(a1c[4]),
     .cout(c2[21]), .sum(s2[21]));
mul_csa32  sc2_20_ ( .c(a0c[19]), .b(a0s[20]), .a(1'b0),
     .cout(c2[20]), .sum(s2[20]));
mul_csa32  sc1_66_ ( .c(a1s[50]), .b(pc[97]), .a(ps[98]),
     .cout(c1[66]), .sum(s1[66]));
mul_csa32  sc1_65_ ( .c(a1s[49]), .b(pc[96]), .a(ps[97]),
     .cout(c1[65]), .sum(s1[65]));
mul_csa32  sc1_64_ ( .c(a1s[48]), .b(pc[95]), .a(ps[96]),
     .cout(c1[64]), .sum(s1[64]));
mul_csa32  sc1_63_ ( .c(a1s[47]), .b(pc[94]), .a(ps[95]),
     .cout(c1[63]), .sum(s1[63]));
mul_csa32  sc1_62_ ( .c(a1s[46]), .b(pc[93]), .a(ps[94]),
     .cout(c1[62]), .sum(s1[62]));
mul_csa32  sc1_61_ ( .c(a1s[45]), .b(pc[92]), .a(ps[93]),
     .cout(c1[61]), .sum(s1[61]));
mul_csa32  sc1_60_ ( .c(a1s[44]), .b(pc[91]), .a(ps[92]),
     .cout(c1[60]), .sum(s1[60]));
mul_csa32  sc1_59_ ( .c(a1s[43]), .b(pc[90]), .a(ps[91]),
     .cout(c1[59]), .sum(s1[59]));
mul_csa32  sc1_58_ ( .c(a1s[42]), .b(pc[89]), .a(ps[90]),
     .cout(c1[58]), .sum(s1[58]));
mul_csa32  sc1_57_ ( .c(a1s[41]), .b(pc[88]), .a(ps[89]),
     .cout(c1[57]), .sum(s1[57]));
mul_csa32  sc1_56_ ( .c(a1s[40]), .b(pc[87]), .a(ps[88]),
     .cout(c1[56]), .sum(s1[56]));
mul_csa32  sc1_55_ ( .c(a1s[39]), .b(pc[86]), .a(ps[87]),
     .cout(c1[55]), .sum(s1[55]));
mul_csa32  sc1_54_ ( .c(a1s[38]), .b(pc[85]), .a(ps[86]),
     .cout(c1[54]), .sum(s1[54]));
mul_csa32  sc1_53_ ( .c(a1s[37]), .b(pc[84]), .a(ps[85]),
     .cout(c1[53]), .sum(s1[53]));
mul_csa32  sc1_52_ ( .c(a1s[36]), .b(pc[83]), .a(ps[84]),
     .cout(c1[52]), .sum(s1[52]));
mul_csa32  sc1_51_ ( .c(a1s[35]), .b(pc[82]), .a(ps[83]),
     .cout(c1[51]), .sum(s1[51]));
mul_csa32  sc1_50_ ( .c(a1s[34]), .b(pc[81]), .a(ps[82]),
     .cout(c1[50]), .sum(s1[50]));
mul_csa32  sc1_49_ ( .c(a1s[33]), .b(pc[80]), .a(ps[81]),
     .cout(c1[49]), .sum(s1[49]));
mul_csa32  sc1_48_ ( .c(a1s[32]), .b(pc[79]), .a(ps[80]),
     .cout(c1[48]), .sum(s1[48]));
mul_csa32  sc1_47_ ( .c(a1s[31]), .b(pc[78]), .a(ps[79]),
     .cout(c1[47]), .sum(s1[47]));
mul_csa32  sc1_46_ ( .c(a1s[30]), .b(pc[77]), .a(ps[78]),
     .cout(c1[46]), .sum(s1[46]));
mul_csa32  sc1_45_ ( .c(a1s[29]), .b(pc[76]), .a(ps[77]),
     .cout(c1[45]), .sum(s1[45]));
mul_csa32  sc1_44_ ( .c(a1s[28]), .b(pc[75]), .a(ps[76]),
     .cout(c1[44]), .sum(s1[44]));
mul_csa32  sc1_43_ ( .c(a1s[27]), .b(pc[74]), .a(ps[75]),
     .cout(c1[43]), .sum(s1[43]));
mul_csa32  sc1_42_ ( .c(a1s[26]), .b(pc[73]), .a(ps[74]),
     .cout(c1[42]), .sum(s1[42]));
mul_csa32  sc1_41_ ( .c(a1s[25]), .b(pc[72]), .a(ps[73]),
     .cout(c1[41]), .sum(s1[41]));
mul_csa32  sc1_40_ ( .c(a1s[24]), .b(pc[71]), .a(ps[72]),
     .cout(c1[40]), .sum(s1[40]));
mul_csa32  sc1_39_ ( .c(a1s[23]), .b(pc[70]), .a(ps[71]),
     .cout(c1[39]), .sum(s1[39]));
mul_csa32  sc1_38_ ( .c(a1s[22]), .b(pc[69]), .a(ps[70]),
     .cout(c1[38]), .sum(s1[38]));
mul_csa32  sc1_37_ ( .c(a1s[21]), .b(pc[68]), .a(ps[69]),
     .cout(c1[37]), .sum(s1[37]));
mul_csa32  sc1_36_ ( .c(a1s[20]), .b(pc[67]), .a(ps[68]),
     .cout(c1[36]), .sum(s1[36]));
mul_csa32  sc1_35_ ( .c(a1s[19]), .b(pc[66]), .a(ps[67]),
     .cout(c1[35]), .sum(s1[35]));
mul_csa32  sc1_34_ ( .c(a1s[18]), .b(pc[65]), .a(ps[66]),
     .cout(c1[34]), .sum(s1[34]));
mul_csa32  sc1_33_ ( .c(a1s[17]), .b(pc[64]), .a(ps[65]),
     .cout(c1[33]), .sum(s1[33]));
mul_csa32  sc1_32_ ( .c(a1s[16]), .b(pc[63]), .a(ps[64]),
     .cout(c1[32]), .sum(s1[32]));
mul_csa32  sc1_31_ ( .c(a1s[15]), .b(pc[62]), .a(ps[63]),
     .cout(c1[31]), .sum(s1[31]));
mul_csa32  sc1_30_ ( .c(a1s[14]), .b(pc[61]), .a(ps[62]),
     .cout(c1[30]), .sum(s1[30]));
mul_csa32  sc1_29_ ( .c(a1s[13]), .b(pc[60]), .a(ps[61]),
     .cout(c1[29]), .sum(s1[29]));
mul_csa32  sc1_28_ ( .c(a1s[12]), .b(pc[59]), .a(ps[60]),
     .cout(c1[28]), .sum(s1[28]));
mul_csa32  sc1_27_ ( .c(a1s[11]), .b(pc[58]), .a(ps[59]),
     .cout(c1[27]), .sum(s1[27]));
mul_csa32  sc1_26_ ( .c(a1s[10]), .b(pc[57]), .a(ps[58]),
     .cout(c1[26]), .sum(s1[26]));
mul_csa32  sc1_25_ ( .c(a1s[9]), .b(pc[56]), .a(ps[57]),
     .cout(c1[25]), .sum(s1[25]));
mul_csa32  sc1_24_ ( .c(a1s[8]), .b(pc[55]), .a(ps[56]),
     .cout(c1[24]), .sum(s1[24]));
mul_csa32  sc1_23_ ( .c(a1s[7]), .b(pc[54]), .a(ps[55]),
     .cout(c1[23]), .sum(s1[23]));
mul_csa32  sc1_22_ ( .c(a1s[6]), .b(pc[53]), .a(ps[54]),
     .cout(c1[22]), .sum(s1[22]));
mul_csa32  sc1_21_ ( .c(a1s[5]), .b(pc[52]), .a(ps[53]),
     .cout(c1[21]), .sum(s1[21]));
mul_csa32  sc1_20_ ( .c(a1s[4]), .b(pc[51]), .a(ps[52]),
     .cout(c1[20]), .sum(s1[20]));
mul_csa32  sc2_81_ ( .c(a0c[80]), .b(c1[80]), .a(s1[81]),
     .cout(c2[81]), .sum(s2[81]));
mul_csa32  sc2_80_ ( .c(a0c[79]), .b(c1[79]), .a(s1[80]),
     .cout(c2[80]), .sum(s2[80]));
mul_csa32  sc2_79_ ( .c(a0c[78]), .b(c1[78]), .a(s1[79]),
     .cout(c2[79]), .sum(s2[79]));
mul_csa32  sc2_78_ ( .c(a0c[77]), .b(c1[77]), .a(s1[78]),
     .cout(c2[78]), .sum(s2[78]));
mul_csa32  sc2_77_ ( .c(a0c[76]), .b(c1[76]), .a(s1[77]),
     .cout(c2[77]), .sum(s2[77]));
mul_csa32  sc2_76_ ( .c(a0c[75]), .b(c1[75]), .a(s1[76]),
     .cout(c2[76]), .sum(s2[76]));
mul_csa32  sc2_75_ ( .c(a0c[74]), .b(c1[74]), .a(s1[75]),
     .cout(c2[75]), .sum(s2[75]));
mul_csa32  sc2_74_ ( .c(a0c[73]), .b(c1[73]), .a(s1[74]),
     .cout(c2[74]), .sum(s2[74]));
mul_csa32  sc2_73_ ( .c(a0c[72]), .b(c1[72]), .a(s1[73]),
     .cout(c2[73]), .sum(s2[73]));
mul_csa32  sc2_72_ ( .c(a0c[71]), .b(c1[71]), .a(s1[72]),
     .cout(c2[72]), .sum(s2[72]));
mul_csa32  sc2_71_ ( .c(a0c[70]), .b(c1[70]), .a(s1[71]),
     .cout(c2[71]), .sum(s2[71]));
mul_csa32  sc2_70_ ( .c(a0c[69]), .b(c1[69]), .a(s1[70]),
     .cout(c2[70]), .sum(s2[70]));
mul_csa32  sc2_69_ ( .c(a0c[68]), .b(c1[68]), .a(s1[69]),
     .cout(c2[69]), .sum(s2[69]));
mul_csa32  sc2_68_ ( .c(a0c[67]), .b(c1[67]), .a(s1[68]),
     .cout(c2[68]), .sum(s2[68]));
mul_csa32  acc_19_ ( .c(c3[18]), .b(s3[19]), .a(ain[19]),
     .cout(pcout[19]), .sum(psum[19]));
mul_csa32  acc_18_ ( .c(c3[17]), .b(s3[18]), .a(ain[18]),
     .cout(pcout[18]), .sum(psum[18]));
mul_csa32  acc_17_ ( .c(c3[16]), .b(s3[17]), .a(ain[17]),
     .cout(pcout[17]), .sum(psum[17]));
mul_csa32  acc_16_ ( .c(c3[15]), .b(s3[16]), .a(ain[16]),
     .cout(pcout[16]), .sum(psum[16]));
mul_csa32  acc_15_ ( .c(1'b0), .b(s3[15]), .a(ain[15]),
     .cout(pcout[15]), .sum(psum[15]));
mul_csa32  sc1_0_ ( .c(a0s[0]), .sum(s1[0]), .cout(c1[0]),
     .a(ps[32]), .b(pc[31]));
mul_csa32  sc1_67_ ( .c(a1c[50]), .b(pc[98]), .a(a1s[51]),
     .cout(c1[67]), .sum(s1[67]));
mul_ha acc_0_ ( .sum(psum[0]), .cout(pcout[0]), .a(ain[0]),
     .b(s2[0]));
mul_ha sc3_98_ ( .sum(psum[98]), .cout(pcout[98]), .a(bot),
     .b(a1c[81]));
mul_ha sc2_96_ ( .b(a1c[79]), .a(a1s[80]), .cout(c2[96]),
     .sum(s2[96]));
mul_ha sc2_95_ ( .b(a1c[78]), .a(a1s[79]), .cout(c2[95]),
     .sum(s2[95]));
mul_ha sc2_94_ ( .b(a1c[77]), .a(a1s[78]), .cout(c2[94]),
     .sum(s2[94]));
mul_ha sc2_93_ ( .b(a1c[76]), .a(a1s[77]), .cout(c2[93]),
     .sum(s2[93]));
mul_ha sc2_92_ ( .b(a1c[75]), .a(a1s[76]), .cout(c2[92]),
     .sum(s2[92]));
mul_ha sc2_91_ ( .b(a1c[74]), .a(a1s[75]), .cout(c2[91]),
     .sum(s2[91]));
mul_ha sc2_90_ ( .b(a1c[73]), .a(a1s[74]), .cout(c2[90]),
     .sum(s2[90]));
mul_ha sc2_89_ ( .b(a1c[72]), .a(a1s[73]), .cout(c2[89]),
     .sum(s2[89]));
mul_ha sc2_88_ ( .b(a1c[71]), .a(a1s[72]), .cout(c2[88]),
     .sum(s2[88]));
mul_ha sc2_87_ ( .b(a1c[70]), .a(a1s[71]), .cout(c2[87]),
     .sum(s2[87]));
mul_ha sc2_86_ ( .b(a1c[69]), .a(a1s[70]), .cout(c2[86]),
     .sum(s2[86]));
mul_ha sc2_85_ ( .b(a1c[68]), .a(a1s[69]), .cout(c2[85]),
     .sum(s2[85]));
mul_ha sc2_84_ ( .b(a1c[67]), .a(a1s[68]), .cout(c2[84]),
     .sum(s2[84]));
mul_ha sc3_81_ ( .b(c2[80]), .a(s2[81]), .cout(c3[81]),
     .sum(s3[81]));
mul_ha sc3_80_ ( .b(c2[79]), .a(s2[80]), .cout(c3[80]),
     .sum(s3[80]));
mul_ha sc3_79_ ( .b(c2[78]), .a(s2[79]), .cout(c3[79]),
     .sum(s3[79]));
mul_ha sc3_78_ ( .b(c2[77]), .a(s2[78]), .cout(c3[78]),
     .sum(s3[78]));
mul_ha sc3_77_ ( .b(c2[76]), .a(s2[77]), .cout(c3[77]),
     .sum(s3[77]));
mul_ha sc3_76_ ( .b(c2[75]), .a(s2[76]), .cout(c3[76]),
     .sum(s3[76]));
mul_ha sc3_75_ ( .b(c2[74]), .a(s2[75]), .cout(c3[75]),
     .sum(s3[75]));
mul_ha sc3_74_ ( .b(c2[73]), .a(s2[74]), .cout(c3[74]),
     .sum(s3[74]));
mul_ha sc3_73_ ( .b(c2[72]), .a(s2[73]), .cout(c3[73]),
     .sum(s3[73]));
mul_ha sc3_72_ ( .b(c2[71]), .a(s2[72]), .cout(c3[72]),
     .sum(s3[72]));
mul_ha sc3_71_ ( .b(c2[70]), .a(s2[71]), .cout(c3[71]),
     .sum(s3[71]));
mul_ha sc3_70_ ( .b(c2[69]), .a(s2[70]), .cout(c3[70]),
     .sum(s3[70]));
mul_ha sc3_69_ ( .b(c2[68]), .a(s2[69]), .cout(c3[69]),
     .sum(s3[69]));
mul_ha accx2 ( .sum(psumx2), .cout(pcoutx2), .a(ainx2), .b(s1x2));
mul_ha sc2_4_ ( .sum(s2[4]), .cout(c2[4]), .a(s1[4]), .b(c1[3]));
mul_ha sc2_3_ ( .sum(s2[3]), .cout(c2[3]), .a(s1[3]), .b(c1[2]));
mul_ha sc2_2_ ( .sum(s2[2]), .cout(c2[2]), .a(s1[2]), .b(c1[1]));
mul_ha sc2_1_ ( .sum(s2[1]), .cout(c2[1]), .a(s1[1]), .b(c1[0]));
mul_ha sc2_0_ ( .sum(s2[0]), .cout(c2[0]), .a(s1[0]), .b(c1x2));
mul_ha sc1x2 ( .sum(s1x2), .cout(c1x2), .a(ps[31]), .b(pc[30]));

endmodule //mul_array2

module mul_csa32 (sum, cout, a, b, c);

output sum, cout;
input a, b, c;

wire x, y0, y1, y2;

assign x = a ^ b;
assign sum = c ^ x;

assign y0 = a & b ;
assign y1 = a & c ;
assign y2 = b & c ;

assign cout = y0 | y1 | y2 ;

endmodule //mul_csa32

module mul_csa42 (sum, carry, cout, a, b, c, d, cin);

output sum, carry, cout;
input a, b, c, d, cin;

wire x, y, z;

assign x = a ^ b;
assign y = c ^ d;
assign z = x ^ y;

assign sum = z ^ cin ;

assign carry = (b & ~z) | (cin & z);

assign cout = (d & ~y) | (a & y);

endmodule // mul_csa42

module mul_ha ( cout, sum, a, b );
output  cout, sum;
input  a, b;

assign sum = a ^ b;
assign cout = a & b ;

endmodule //mul_ha

module mul_negen ( n0, n1, b );
output  n0, n1;
input [2:0]  b;

assign n0 = b[2] & b[1] & ~b[0] ;
assign n1 = b[2] & b[1] & b[0] ;

endmodule //mul_negen

module mul_ppgen3lsb4 (cout, p0_l, p1_l, sum, a, b0, b1 );

output  p0_l, p1_l;
output [3:0]  sum;
output [3:1]  cout;
input [3:0]  a;
input [2:0]  b0;
input [2:0]  b1;

wire b0n, b0n_0, b0n_1, b1n_0, b1n_1;
wire p0_0, p0_1, p0_2, p0_3, p1_2, p1_3;
wire p0_l_0, p0_l_1, p0_l_2, p1_l_2;

assign b0n = b0n_1 | (b0n_0 & p0_0) ;
assign sum[0] = b0n_0 ^ p0_0 ;

mul_negen p0n ( .b(b0[2:0]), .n1(b0n_1), .n0(b0n_0));
mul_negen p1n ( .b(b1[2:0]), .n1(b1n_1), .n0(b1n_0));
mul_csa32  sc1_2_ ( .c(b1n_0), .sum(sum[2]), .cout(cout[2]),
     .a(p0_2), .b(p1_2));
mul_csa32  sc1_3_ ( .c(b1n_1), .sum(sum[3]), .cout(cout[3]),
     .a(p0_3), .b(p1_3));
mul_ha sc1_1_ ( .sum(sum[1]), .cout(cout[1]), .a(p0_1),
     .b(b0n));
mul_ppgen p0_3_ ( .pm1_l(p0_l_2), .p_l(p0_l), .b(b0[2:0]), .a(a[3]),
     .z(p0_3));
mul_ppgen p1_3_ ( .pm1_l(p1_l_2), .p_l(p1_l), .b(b1[2:0]), .a(a[1]),
     .z(p1_3));
mul_ppgen p0_2_ ( .pm1_l(p0_l_1), .p_l(p0_l_2), .b(b0[2:0]),
     .a(a[2]), .z(p0_2));
mul_ppgen p0_1_ ( .pm1_l(p0_l_0), .p_l(p0_l_1), .b(b0[2:0]),
     .a(a[1]), .z(p0_1));
mul_ppgen p0_0_ ( .pm1_l(1'b1), .p_l(p0_l_0),
     .b(b0[2:0]), .a(a[0]), .z(p0_0));
mul_ppgen p1_2_ ( .pm1_l(1'b1), .p_l(p1_l_2),
     .b(b1[2:0]), .a(a[0]), .z(p1_2));

endmodule // mul_ppgen3lsb4

module mul_ppgen3sign ( cout, sum, am1, am2, am3, am4, b0, b1, b2,
     bot, head, p0m1_l, p1m1_l, p2m1_l );
input  am1, am2, am3, am4;
input  bot, head, p0m1_l, p1m1_l, p2m1_l;
output [5:0]  sum;
output [4:0]  cout;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net37, net42, net075, net088, net0117; 
wire net47, net073, net38, net0118, net078, net8, net15, net43, net48, net35;
wire p2_l_67, p2_l_66, p2_l_65, p2_l_64; 
wire p1_l_65, p1_l_64; 

assign sum[5] = bot & net075 ;
assign net0117 = head & net088 ; 
assign net37 = ~net0117 ;
assign net42 = head ^ net088 ;

mul_ppgensign p0_64_ ( .b(b0[2:0]), .z(net47), .p_l(net088),
     .pm1_l(p0m1_l));
mul_ppgensign p2_68_ ( .pm1_l(p2_l_67), .b(b2[2:0]), .z(net073),
     .p_l(net075));
mul_ppgensign p1_66_ ( .pm1_l(p1_l_65), .b(b1[2:0]), .z(net38),
     .p_l(net0118));
mul_ha sc1_68_ ( .b(net073), .a(1'b1), .cout(cout[4]),
     .sum(sum[4]));
mul_ppgen p2_67_ ( .pm1_l(p2_l_66), .b(b2[2:0]), .a(am1), .z(net078),
     .p_l(p2_l_67));
mul_ppgen p2_66_ ( .pm1_l(p2_l_65), .b(b2[2:0]), .a(am2), .z(net8),
     .p_l(p2_l_66));
mul_ppgen p2_65_ ( .pm1_l(p2_l_64), .p_l(p2_l_65), .b(b2[2:0]),
     .a(am3), .z(net15));
mul_ppgen p1_65_ ( .pm1_l(p1_l_64), .p_l(p1_l_65), .b(b1[2:0]),
     .a(am1), .z(net43));
mul_ppgen p1_64_ ( .pm1_l(p1m1_l), .p_l(p1_l_64), .b(b1[2:0]),
     .a(am2), .z(net48));
mul_ppgen p2_64_ ( .pm1_l(p2m1_l), .p_l(p2_l_64), .b(b2[2:0]),
     .a(am4), .z(net35));
mul_csa32  sc1_67_ ( .c(net078), .b(net0117), .a(net0118),
     .cout(cout[3]), .sum(sum[3]));
mul_csa32  sc1_66_ ( .c(net8), .b(net37), .a(net38), .cout(cout[2]),
     .sum(sum[2]));
mul_csa32  sc1_65_ ( .c(net15), .b(net42), .a(net43), .cout(cout[1]),
     .sum(sum[1]));
mul_csa32  sc1_64_ ( .c(net35), .b(net47), .a(net48), .cout(cout[0]),
     .sum(sum[0]));

endmodule //mul_ppgen3sign

module mul_ppgen3 ( cout, p0_l, p1_l, p2_l, sum, am2, am4,
     a, b0, b1, b2, p0m1_l, p1m1_l, p2m1_l );
output  cout, p0_l, p1_l, p2_l, sum;
input  am2, am4;
input  a, p0m1_l, p1m1_l, p2m1_l;
input [2:0]  b0;
input [2:0]  b2;
input [2:0]  b1;

wire net046, net32, net043;

mul_csa32  sc1 ( .a(net046), .b(net32), .cout(cout), .sum(sum),
     .c(net043));
mul_ppgen p2 ( .pm1_l(p2m1_l), .p_l(p2_l), .b(b2[2:0]), .a(am4),
     .z(net043));
mul_ppgen p1 ( .pm1_l(p1m1_l), .p_l(p1_l), .b(b1[2:0]), .a(am2),
     .z(net046));
mul_ppgen p0 ( .pm1_l(p0m1_l), .p_l(p0_l), .b(b0[2:0]), .a(a),
     .z(net32));

endmodule // mul_ppgen3

module mul_ppgenrow3 ( cout, sum, a, b0, b1, b2, bot, head );

output [68:1]  cout;
output [69:0]  sum;
input [63:0]  a;
input [2:0]  b2;
input [2:0]  b0;
input [2:0]  b1;
input  bot, head;

// Buses in the design
wire  [63:4]  p2_l;
wire  [63:3]  p1_l;
wire  [63:3]  p0_l;

mul_ppgen3sign I2 ( .am4(a[60]), .am3(a[61]), .am2(a[62]),
     .am1(a[63]), .p2m1_l(p2_l[63]), .p1m1_l(p1_l[63]),
     .p0m1_l(p0_l[63]), .b2(b2[2:0]), .head(head), .bot(bot),
     .sum(sum[69:64]), .cout(cout[68:64]), .b1(b1[2:0]), .b0(b0[2:0]));
mul_ppgen3 I1_63_ ( .p2_l(p2_l[63]), .b2(b2[2:0]),
     .am2(a[61]), .a(a[63]), .p2m1_l(p2_l[62]),
     .p1m1_l(p1_l[62]), .p0m1_l(p0_l[62]), .am4(a[59]), .sum(sum[63]),
     .cout(cout[63]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[63]),
     .p0_l(p0_l[63]));
mul_ppgen3 I1_62_ ( .p2_l(p2_l[62]), .b2(b2[2:0]), 
     .am2(a[60]), .a(a[62]), .p2m1_l(p2_l[61]),
     .p1m1_l(p1_l[61]), .p0m1_l(p0_l[61]), .am4(a[58]), .sum(sum[62]),
     .cout(cout[62]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[62]),
     .p0_l(p0_l[62]));
mul_ppgen3 I1_61_ ( .p2_l(p2_l[61]), .b2(b2[2:0]), 
     .am2(a[59]), .a(a[61]), .p2m1_l(p2_l[60]),
     .p1m1_l(p1_l[60]), .p0m1_l(p0_l[60]), .am4(a[57]), .sum(sum[61]),
     .cout(cout[61]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[61]),
     .p0_l(p0_l[61]));
mul_ppgen3 I1_60_ ( .p2_l(p2_l[60]), .b2(b2[2:0]), 
     .am2(a[58]), .a(a[60]), .p2m1_l(p2_l[59]),
     .p1m1_l(p1_l[59]), .p0m1_l(p0_l[59]), .am4(a[56]), .sum(sum[60]),
     .cout(cout[60]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[60]),
     .p0_l(p0_l[60]));
mul_ppgen3 I1_59_ ( .p2_l(p2_l[59]), .b2(b2[2:0]), 
     .am2(a[57]), .a(a[59]), .p2m1_l(p2_l[58]),
     .p1m1_l(p1_l[58]), .p0m1_l(p0_l[58]), .am4(a[55]), .sum(sum[59]),
     .cout(cout[59]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[59]),
     .p0_l(p0_l[59]));
mul_ppgen3 I1_58_ ( .p2_l(p2_l[58]), .b2(b2[2:0]), 
     .am2(a[56]), .a(a[58]), .p2m1_l(p2_l[57]),
     .p1m1_l(p1_l[57]), .p0m1_l(p0_l[57]), .am4(a[54]), .sum(sum[58]),
     .cout(cout[58]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[58]),
     .p0_l(p0_l[58]));
mul_ppgen3 I1_57_ ( .p2_l(p2_l[57]), .b2(b2[2:0]), 
     .am2(a[55]), .a(a[57]), .p2m1_l(p2_l[56]),
     .p1m1_l(p1_l[56]), .p0m1_l(p0_l[56]), .am4(a[53]), .sum(sum[57]),
     .cout(cout[57]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[57]),
     .p0_l(p0_l[57]));
mul_ppgen3 I1_56_ ( .p2_l(p2_l[56]), .b2(b2[2:0]), 
     .am2(a[54]), .a(a[56]), .p2m1_l(p2_l[55]),
     .p1m1_l(p1_l[55]), .p0m1_l(p0_l[55]), .am4(a[52]), .sum(sum[56]),
     .cout(cout[56]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[56]),
     .p0_l(p0_l[56]));
mul_ppgen3 I1_55_ ( .p2_l(p2_l[55]), .b2(b2[2:0]), 
     .am2(a[53]), .a(a[55]), .p2m1_l(p2_l[54]),
     .p1m1_l(p1_l[54]), .p0m1_l(p0_l[54]), .am4(a[51]), .sum(sum[55]),
     .cout(cout[55]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[55]),
     .p0_l(p0_l[55]));
mul_ppgen3 I1_54_ ( .p2_l(p2_l[54]), .b2(b2[2:0]), 
     .am2(a[52]), .a(a[54]), .p2m1_l(p2_l[53]),
     .p1m1_l(p1_l[53]), .p0m1_l(p0_l[53]), .am4(a[50]), .sum(sum[54]),
     .cout(cout[54]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[54]),
     .p0_l(p0_l[54]));
mul_ppgen3 I1_53_ ( .p2_l(p2_l[53]), .b2(b2[2:0]), 
     .am2(a[51]), .a(a[53]), .p2m1_l(p2_l[52]),
     .p1m1_l(p1_l[52]), .p0m1_l(p0_l[52]), .am4(a[49]), .sum(sum[53]),
     .cout(cout[53]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[53]),
     .p0_l(p0_l[53]));
mul_ppgen3 I1_52_ ( .p2_l(p2_l[52]), .b2(b2[2:0]), 
     .am2(a[50]), .a(a[52]), .p2m1_l(p2_l[51]),
     .p1m1_l(p1_l[51]), .p0m1_l(p0_l[51]), .am4(a[48]), .sum(sum[52]),
     .cout(cout[52]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[52]),
     .p0_l(p0_l[52]));
mul_ppgen3 I1_51_ ( .p2_l(p2_l[51]), .b2(b2[2:0]), 
     .am2(a[49]), .a(a[51]), .p2m1_l(p2_l[50]),
     .p1m1_l(p1_l[50]), .p0m1_l(p0_l[50]), .am4(a[47]), .sum(sum[51]),
     .cout(cout[51]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[51]),
     .p0_l(p0_l[51]));
mul_ppgen3 I1_50_ ( .p2_l(p2_l[50]), .b2(b2[2:0]), 
     .am2(a[48]), .a(a[50]), .p2m1_l(p2_l[49]),
     .p1m1_l(p1_l[49]), .p0m1_l(p0_l[49]), .am4(a[46]), .sum(sum[50]),
     .cout(cout[50]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[50]),
     .p0_l(p0_l[50]));
mul_ppgen3 I1_49_ ( .p2_l(p2_l[49]), .b2(b2[2:0]), 
     .am2(a[47]), .a(a[49]), .p2m1_l(p2_l[48]),
     .p1m1_l(p1_l[48]), .p0m1_l(p0_l[48]), .am4(a[45]), .sum(sum[49]),
     .cout(cout[49]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[49]),
     .p0_l(p0_l[49]));
mul_ppgen3 I1_48_ ( .p2_l(p2_l[48]), .b2(b2[2:0]), 
     .am2(a[46]), .a(a[48]), .p2m1_l(p2_l[47]),
     .p1m1_l(p1_l[47]), .p0m1_l(p0_l[47]), .am4(a[44]), .sum(sum[48]),
     .cout(cout[48]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[48]),
     .p0_l(p0_l[48]));
mul_ppgen3 I1_47_ ( .p2_l(p2_l[47]), .b2(b2[2:0]), 
     .am2(a[45]), .a(a[47]), .p2m1_l(p2_l[46]),
     .p1m1_l(p1_l[46]), .p0m1_l(p0_l[46]), .am4(a[43]), .sum(sum[47]),
     .cout(cout[47]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[47]),
     .p0_l(p0_l[47]));
mul_ppgen3 I1_46_ ( .p2_l(p2_l[46]), .b2(b2[2:0]), 
     .am2(a[44]), .a(a[46]), .p2m1_l(p2_l[45]),
     .p1m1_l(p1_l[45]), .p0m1_l(p0_l[45]), .am4(a[42]), .sum(sum[46]),
     .cout(cout[46]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[46]),
     .p0_l(p0_l[46]));
mul_ppgen3 I1_45_ ( .p2_l(p2_l[45]), .b2(b2[2:0]), 
     .am2(a[43]), .a(a[45]), .p2m1_l(p2_l[44]),
     .p1m1_l(p1_l[44]), .p0m1_l(p0_l[44]), .am4(a[41]), .sum(sum[45]),
     .cout(cout[45]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[45]),
     .p0_l(p0_l[45]));
mul_ppgen3 I1_44_ ( .p2_l(p2_l[44]), .b2(b2[2:0]), 
     .am2(a[42]), .a(a[44]), .p2m1_l(p2_l[43]),
     .p1m1_l(p1_l[43]), .p0m1_l(p0_l[43]), .am4(a[40]), .sum(sum[44]),
     .cout(cout[44]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[44]),
     .p0_l(p0_l[44]));
mul_ppgen3 I1_43_ ( .p2_l(p2_l[43]), .b2(b2[2:0]), 
     .am2(a[41]), .a(a[43]), .p2m1_l(p2_l[42]),
     .p1m1_l(p1_l[42]), .p0m1_l(p0_l[42]), .am4(a[39]), .sum(sum[43]),
     .cout(cout[43]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[43]),
     .p0_l(p0_l[43]));
mul_ppgen3 I1_42_ ( .p2_l(p2_l[42]), .b2(b2[2:0]), 
     .am2(a[40]), .a(a[42]), .p2m1_l(p2_l[41]),
     .p1m1_l(p1_l[41]), .p0m1_l(p0_l[41]), .am4(a[38]), .sum(sum[42]),
     .cout(cout[42]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[42]),
     .p0_l(p0_l[42]));
mul_ppgen3 I1_41_ ( .p2_l(p2_l[41]), .b2(b2[2:0]), 
     .am2(a[39]), .a(a[41]), .p2m1_l(p2_l[40]),
     .p1m1_l(p1_l[40]), .p0m1_l(p0_l[40]), .am4(a[37]), .sum(sum[41]),
     .cout(cout[41]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[41]),
     .p0_l(p0_l[41]));
mul_ppgen3 I1_40_ ( .p2_l(p2_l[40]), .b2(b2[2:0]), 
     .am2(a[38]), .a(a[40]), .p2m1_l(p2_l[39]),
     .p1m1_l(p1_l[39]), .p0m1_l(p0_l[39]), .am4(a[36]), .sum(sum[40]),
     .cout(cout[40]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[40]),
     .p0_l(p0_l[40]));
mul_ppgen3 I1_39_ ( .p2_l(p2_l[39]), .b2(b2[2:0]), 
     .am2(a[37]), .a(a[39]), .p2m1_l(p2_l[38]),
     .p1m1_l(p1_l[38]), .p0m1_l(p0_l[38]), .am4(a[35]), .sum(sum[39]),
     .cout(cout[39]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[39]),
     .p0_l(p0_l[39]));
mul_ppgen3 I1_38_ ( .p2_l(p2_l[38]), .b2(b2[2:0]), 
     .am2(a[36]), .a(a[38]), .p2m1_l(p2_l[37]),
     .p1m1_l(p1_l[37]), .p0m1_l(p0_l[37]), .am4(a[34]), .sum(sum[38]),
     .cout(cout[38]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[38]),
     .p0_l(p0_l[38]));
mul_ppgen3 I1_37_ ( .p2_l(p2_l[37]), .b2(b2[2:0]), 
     .am2(a[35]), .a(a[37]), .p2m1_l(p2_l[36]),
     .p1m1_l(p1_l[36]), .p0m1_l(p0_l[36]), .am4(a[33]), .sum(sum[37]),
     .cout(cout[37]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[37]),
     .p0_l(p0_l[37]));
mul_ppgen3 I1_36_ ( .p2_l(p2_l[36]), .b2(b2[2:0]), 
     .am2(a[34]), .a(a[36]), .p2m1_l(p2_l[35]),
     .p1m1_l(p1_l[35]), .p0m1_l(p0_l[35]), .am4(a[32]), .sum(sum[36]),
     .cout(cout[36]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[36]),
     .p0_l(p0_l[36]));
mul_ppgen3 I1_35_ ( .p2_l(p2_l[35]), .b2(b2[2:0]), 
     .am2(a[33]), .a(a[35]), .p2m1_l(p2_l[34]),
     .p1m1_l(p1_l[34]), .p0m1_l(p0_l[34]), .am4(a[31]), .sum(sum[35]),
     .cout(cout[35]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[35]),
     .p0_l(p0_l[35]));
mul_ppgen3 I1_34_ ( .p2_l(p2_l[34]), .b2(b2[2:0]), 
     .am2(a[32]), .a(a[34]), .p2m1_l(p2_l[33]),
     .p1m1_l(p1_l[33]), .p0m1_l(p0_l[33]), .am4(a[30]), .sum(sum[34]),
     .cout(cout[34]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[34]),
     .p0_l(p0_l[34]));
mul_ppgen3 I1_33_ ( .p2_l(p2_l[33]), .b2(b2[2:0]), 
     .am2(a[31]), .a(a[33]), .p2m1_l(p2_l[32]),
     .p1m1_l(p1_l[32]), .p0m1_l(p0_l[32]), .am4(a[29]), .sum(sum[33]),
     .cout(cout[33]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[33]),
     .p0_l(p0_l[33]));
mul_ppgen3 I1_32_ ( .p2_l(p2_l[32]), .b2(b2[2:0]), 
     .am2(a[30]), .a(a[32]), .p2m1_l(p2_l[31]),
     .p1m1_l(p1_l[31]), .p0m1_l(p0_l[31]), .am4(a[28]), .sum(sum[32]),
     .cout(cout[32]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[32]),
     .p0_l(p0_l[32]));
mul_ppgen3 I1_31_ ( .p2_l(p2_l[31]), .b2(b2[2:0]), 
     .am2(a[29]), .a(a[31]), .p2m1_l(p2_l[30]),
     .p1m1_l(p1_l[30]), .p0m1_l(p0_l[30]), .am4(a[27]), .sum(sum[31]),
     .cout(cout[31]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[31]),
     .p0_l(p0_l[31]));
mul_ppgen3 I1_30_ ( .p2_l(p2_l[30]), .b2(b2[2:0]), 
     .am2(a[28]), .a(a[30]), .p2m1_l(p2_l[29]),
     .p1m1_l(p1_l[29]), .p0m1_l(p0_l[29]), .am4(a[26]), .sum(sum[30]),
     .cout(cout[30]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[30]),
     .p0_l(p0_l[30]));
mul_ppgen3 I1_29_ ( .p2_l(p2_l[29]), .b2(b2[2:0]), 
     .am2(a[27]), .a(a[29]), .p2m1_l(p2_l[28]),
     .p1m1_l(p1_l[28]), .p0m1_l(p0_l[28]), .am4(a[25]), .sum(sum[29]),
     .cout(cout[29]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[29]),
     .p0_l(p0_l[29]));
mul_ppgen3 I1_28_ ( .p2_l(p2_l[28]), .b2(b2[2:0]), 
     .am2(a[26]), .a(a[28]), .p2m1_l(p2_l[27]),
     .p1m1_l(p1_l[27]), .p0m1_l(p0_l[27]), .am4(a[24]), .sum(sum[28]),
     .cout(cout[28]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[28]),
     .p0_l(p0_l[28]));
mul_ppgen3 I1_27_ ( .p2_l(p2_l[27]), .b2(b2[2:0]), 
     .am2(a[25]), .a(a[27]), .p2m1_l(p2_l[26]),
     .p1m1_l(p1_l[26]), .p0m1_l(p0_l[26]), .am4(a[23]), .sum(sum[27]),
     .cout(cout[27]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[27]),
     .p0_l(p0_l[27]));
mul_ppgen3 I1_26_ ( .p2_l(p2_l[26]), .b2(b2[2:0]), 
     .am2(a[24]), .a(a[26]), .p2m1_l(p2_l[25]),
     .p1m1_l(p1_l[25]), .p0m1_l(p0_l[25]), .am4(a[22]), .sum(sum[26]),
     .cout(cout[26]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[26]),
     .p0_l(p0_l[26]));
mul_ppgen3 I1_25_ ( .p2_l(p2_l[25]), .b2(b2[2:0]), 
     .am2(a[23]), .a(a[25]), .p2m1_l(p2_l[24]),
     .p1m1_l(p1_l[24]), .p0m1_l(p0_l[24]), .am4(a[21]), .sum(sum[25]),
     .cout(cout[25]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[25]),
     .p0_l(p0_l[25]));
mul_ppgen3 I1_24_ ( .p2_l(p2_l[24]), .b2(b2[2:0]), 
     .am2(a[22]), .a(a[24]), .p2m1_l(p2_l[23]),
     .p1m1_l(p1_l[23]), .p0m1_l(p0_l[23]), .am4(a[20]), .sum(sum[24]),
     .cout(cout[24]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[24]),
     .p0_l(p0_l[24]));
mul_ppgen3 I1_23_ ( .p2_l(p2_l[23]), .b2(b2[2:0]), 
     .am2(a[21]), .a(a[23]), .p2m1_l(p2_l[22]),
     .p1m1_l(p1_l[22]), .p0m1_l(p0_l[22]), .am4(a[19]), .sum(sum[23]),
     .cout(cout[23]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[23]),
     .p0_l(p0_l[23]));
mul_ppgen3 I1_22_ ( .p2_l(p2_l[22]), .b2(b2[2:0]), 
     .am2(a[20]), .a(a[22]), .p2m1_l(p2_l[21]),
     .p1m1_l(p1_l[21]), .p0m1_l(p0_l[21]), .am4(a[18]), .sum(sum[22]),
     .cout(cout[22]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[22]),
     .p0_l(p0_l[22]));
mul_ppgen3 I1_21_ ( .p2_l(p2_l[21]), .b2(b2[2:0]), 
     .am2(a[19]), .a(a[21]), .p2m1_l(p2_l[20]),
     .p1m1_l(p1_l[20]), .p0m1_l(p0_l[20]), .am4(a[17]), .sum(sum[21]),
     .cout(cout[21]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[21]),
     .p0_l(p0_l[21]));
mul_ppgen3 I1_20_ ( .p2_l(p2_l[20]), .b2(b2[2:0]), 
     .am2(a[18]), .a(a[20]), .p2m1_l(p2_l[19]),
     .p1m1_l(p1_l[19]), .p0m1_l(p0_l[19]), .am4(a[16]), .sum(sum[20]),
     .cout(cout[20]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[20]),
     .p0_l(p0_l[20]));
mul_ppgen3 I1_19_ ( .p2_l(p2_l[19]), .b2(b2[2:0]), 
     .am2(a[17]), .a(a[19]), .p2m1_l(p2_l[18]),
     .p1m1_l(p1_l[18]), .p0m1_l(p0_l[18]), .am4(a[15]), .sum(sum[19]),
     .cout(cout[19]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[19]),
     .p0_l(p0_l[19]));
mul_ppgen3 I1_18_ ( .p2_l(p2_l[18]), .b2(b2[2:0]), 
     .am2(a[16]), .a(a[18]), .p2m1_l(p2_l[17]),
     .p1m1_l(p1_l[17]), .p0m1_l(p0_l[17]), .am4(a[14]), .sum(sum[18]),
     .cout(cout[18]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[18]),
     .p0_l(p0_l[18]));
mul_ppgen3 I1_17_ ( .p2_l(p2_l[17]), .b2(b2[2:0]), 
     .am2(a[15]), .a(a[17]), .p2m1_l(p2_l[16]),
     .p1m1_l(p1_l[16]), .p0m1_l(p0_l[16]), .am4(a[13]), .sum(sum[17]),
     .cout(cout[17]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[17]),
     .p0_l(p0_l[17]));
mul_ppgen3 I1_16_ ( .p2_l(p2_l[16]), .b2(b2[2:0]), 
     .am2(a[14]), .a(a[16]), .p2m1_l(p2_l[15]),
     .p1m1_l(p1_l[15]), .p0m1_l(p0_l[15]), .am4(a[12]), .sum(sum[16]),
     .cout(cout[16]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[16]),
     .p0_l(p0_l[16]));
mul_ppgen3 I1_15_ ( .p2_l(p2_l[15]), .b2(b2[2:0]), 
     .am2(a[13]), .a(a[15]), .p2m1_l(p2_l[14]),
     .p1m1_l(p1_l[14]), .p0m1_l(p0_l[14]), .am4(a[11]), .sum(sum[15]),
     .cout(cout[15]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[15]),
     .p0_l(p0_l[15]));
mul_ppgen3 I1_14_ ( .p2_l(p2_l[14]), .b2(b2[2:0]), 
     .am2(a[12]), .a(a[14]), .p2m1_l(p2_l[13]),
     .p1m1_l(p1_l[13]), .p0m1_l(p0_l[13]), .am4(a[10]), .sum(sum[14]),
     .cout(cout[14]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[14]),
     .p0_l(p0_l[14]));
mul_ppgen3 I1_13_ ( .p2_l(p2_l[13]), .b2(b2[2:0]), 
     .am2(a[11]), .a(a[13]), .p2m1_l(p2_l[12]),
     .p1m1_l(p1_l[12]), .p0m1_l(p0_l[12]), .am4(a[9]), .sum(sum[13]),
     .cout(cout[13]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[13]),
     .p0_l(p0_l[13]));
mul_ppgen3 I1_12_ ( .p2_l(p2_l[12]), .b2(b2[2:0]), 
     .am2(a[10]), .a(a[12]), .p2m1_l(p2_l[11]),
     .p1m1_l(p1_l[11]), .p0m1_l(p0_l[11]), .am4(a[8]), .sum(sum[12]),
     .cout(cout[12]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[12]),
     .p0_l(p0_l[12]));
mul_ppgen3 I1_11_ ( .p2_l(p2_l[11]), .b2(b2[2:0]), 
     .am2(a[9]), .a(a[11]), .p2m1_l(p2_l[10]),
     .p1m1_l(p1_l[10]), .p0m1_l(p0_l[10]), .am4(a[7]), .sum(sum[11]),
     .cout(cout[11]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[11]),
     .p0_l(p0_l[11]));
mul_ppgen3 I1_10_ ( .p2_l(p2_l[10]), .b2(b2[2:0]), 
     .am2(a[8]), .a(a[10]), .p2m1_l(p2_l[9]),
     .p1m1_l(p1_l[9]), .p0m1_l(p0_l[9]), .am4(a[6]), .sum(sum[10]),
     .cout(cout[10]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[10]),
     .p0_l(p0_l[10]));
mul_ppgen3 I1_9_ ( .p2_l(p2_l[9]), .b2(b2[2:0]), 
     .am2(a[7]), .a(a[9]), .p2m1_l(p2_l[8]),
     .p1m1_l(p1_l[8]), .p0m1_l(p0_l[8]), .am4(a[5]), .sum(sum[9]),
     .cout(cout[9]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[9]),
     .p0_l(p0_l[9]));
mul_ppgen3 I1_8_ ( .p2_l(p2_l[8]), .b2(b2[2:0]), 
     .am2(a[6]), .a(a[8]), .p2m1_l(p2_l[7]),
     .p1m1_l(p1_l[7]), .p0m1_l(p0_l[7]), .am4(a[4]), .sum(sum[8]),
     .cout(cout[8]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[8]),
     .p0_l(p0_l[8]));
mul_ppgen3 I1_7_ ( .p2_l(p2_l[7]), .b2(b2[2:0]), 
     .am2(a[5]), .a(a[7]), .p2m1_l(p2_l[6]),
     .p1m1_l(p1_l[6]), .p0m1_l(p0_l[6]), .am4(a[3]), .sum(sum[7]),
     .cout(cout[7]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[7]),
     .p0_l(p0_l[7]));
mul_ppgen3 I1_6_ ( .p2_l(p2_l[6]), .b2(b2[2:0]), 
     .am2(a[4]), .a(a[6]), .p2m1_l(p2_l[5]),
     .p1m1_l(p1_l[5]), .p0m1_l(p0_l[5]), .am4(a[2]), .sum(sum[6]),
     .cout(cout[6]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[6]),
     .p0_l(p0_l[6]));
mul_ppgen3 I1_5_ ( .p2_l(p2_l[5]), .b2(b2[2:0]), 
     .am2(a[3]), .a(a[5]), .p2m1_l(p2_l[4]),
     .p1m1_l(p1_l[4]), .p0m1_l(p0_l[4]), .am4(a[1]), .sum(sum[5]),
     .cout(cout[5]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[5]),
     .p0_l(p0_l[5]));
mul_ppgen3 I1_4_ ( .p2_l(p2_l[4]), .b2(b2[2:0]), 
     .am2(a[2]), .a(a[4]), .p2m1_l(1'b1),
     .p1m1_l(p1_l[3]), .p0m1_l(p0_l[3]), .am4(a[0]), .sum(sum[4]),
     .cout(cout[4]), .b1(b1[2:0]), .b0(b0[2:0]), .p1_l(p1_l[4]),
     .p0_l(p0_l[4]));
mul_ppgen3lsb4 I0 ( .cout(cout[3:1]), .a(a[3:0]), .sum(sum[3:0]),
     .p1_l(p1_l[3]), .p0_l(p0_l[3]), .b1(b1[2:0]), .b0(b0[2:0]));

endmodule //mul_ppgenrow3

module mul_ppgensign ( p_l, z, b, pm1_l );
output  p_l, z;
input  pm1_l;
input [2:0]  b;

assign p_l = ~(b[1] & b[2]);
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgensign

module mul_ppgen ( p_l, z, a, b, pm1_l );
output  p_l, z;
input  a, pm1_l;
input [2:0]  b;

assign p_l = ~((a ^ b[2]) & b[1]) ;
assign z = b[0] ? ~pm1_l : ~p_l ;

endmodule //mul_ppgen

module mul_mux2 ( z, d0, d1, s );
output  z;
input  d0, d1, s;

assign z = s ? d1 : d0 ;

endmodule // mul_mux2 

module mul_booth(
	head,
        b_in,
        b0, b1, b2, b3, b4, b5, b6, b7,
	b8, b9, b10, b11, b12, b13, b14, b15, b16,
	clk, se, si, so, mul_step, tm_l
	);
input		head;		// begin of the MUL operation
input   [63:0] 	b_in;
input		clk, se, si, mul_step, tm_l;
output  [2:0]  	b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;
output 		b16;
output 		so;

wire  [63:31] 	b;
wire [2:0] 	b0_in0, b1_in0,  b2_in0,  b3_in0,  b4_in0,  b5_in0,  b6_in0,  b7_in0 ;
wire [2:0] 	b8_in0, b9_in0, b10_in0, b11_in0, b12_in0, b13_in0, b14_in0, b15_in0 ;
wire [2:0] 	b0_in1, b1_in1,  b2_in1,  b3_in1,  b4_in1,  b5_in1,  b6_in1,  b7_in1 ;
wire [2:0] 	b8_in1, b9_in1, b10_in1, b11_in1, b12_in1, b13_in1, b14_in1, b15_in1 ;
wire 	   	b16_in1;

wire [2:0] 	b0_outmx, b1_outmx, b2_outmx, b3_outmx, b4_outmx, b5_outmx, b6_outmx;
wire [2:0] 	b7_outmx, b8_outmx, b9_outmx, b10_outmx, b11_outmx, b12_outmx, b13_outmx;
wire [2:0] 	b14_outmx, b15_outmx;
wire 	   	b16_outmx;
wire		clk_enb0, clk_enb1;


  mul_bodec 		encode0_a(
				.x  (1'b0),
				.b  (b_in[15:0]),
				.b0 (b0_in0),
				.b1 (b1_in0),
				.b2 (b2_in0),
				.b3 (b3_in0),
				.b4 (b4_in0),
				.b5 (b5_in0),
				.b6 (b6_in0),
				.b7 (b7_in0)
				);
				//remove 16th row since it's never the last row
				//b8_in0 = 3'b010; 
  mul_bodec		encode0_b(
				.x  (b_in[15]),
				.b  (b_in[31:16]),
				.b0 (b8_in0),
				.b1 (b9_in0),
				.b2 (b10_in0),
				.b3 (b11_in0),
				.b4 (b12_in0),
				.b5 (b13_in0),
				.b6 (b14_in0),
				.b7 (b15_in0)
				);
				// remove 32th row since it's never the last row 
				// b16_in0 = 3'b010 ;

  // Pipe picked address [63:31] and hold flop

  clken_buf     ckbuf_0(.clk(clk_enb0), .rclk(clk), .enb_l(~mul_step), .tmb_l(tm_l));
  clken_buf     ckbuf_1(.clk(clk_enb1), .rclk(clk), .enb_l(~(head & mul_step)), .tmb_l(tm_l));

  dff_s 			hld_dff0(.din(b_in[31]), .clk(clk_enb1), .q(b[31]),
                        	.se(se), .si(), .so());
  dff_s #(32) 		hld_dff(.din(b_in[63:32]), .clk(clk_enb1), .q(b[63:32]),
				.se(se), .si(), .so());

  mul_bodec     	encode1_a(
                        	.x  (b[31]),
                        	.b  (b[47:32]),
                        	.b0 (b0_in1),
                        	.b1 (b1_in1),
                        	.b2 (b2_in1),
                        	.b3 (b3_in1),
                        	.b4 (b4_in1),
                        	.b5 (b5_in1),
                        	.b6 (b6_in1),
                        	.b7 (b7_in1)
                        	);
                        	//remove 16th row since it's never the last row
                        	//b8_in1 = 3'b010;
  mul_bodec     	encode1_b(
                        	.x  (b[47]),
                        	.b  (b[63:48]),
                        	.b0 (b8_in1),
                        	.b1 (b9_in1),
                        	.b2 (b10_in1),
                        	.b3 (b11_in1),
                        	.b4 (b12_in1),
                        	.b5 (b13_in1),
                        	.b6 (b14_in1),
                        	.b7 (b15_in1)
                        	);
				assign b16_in1 = b[63] ;

// Select booth encoded b outputs and flop based on the cycle0 and cycle1 

  dp_mux2es #(3)    out_mux0(.dout(b0_outmx[2:0]),
                        .in0(b0_in0[2:0]),
                        .in1(b0_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux1(.dout(b1_outmx[2:0]),
                        .in0(b1_in0[2:0]),
                        .in1(b1_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux2(.dout(b2_outmx[2:0]),
                        .in0(b2_in0[2:0]),
                        .in1(b2_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux3(.dout(b3_outmx[2:0]),
                        .in0(b3_in0[2:0]),
                        .in1(b3_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux4(.dout(b4_outmx[2:0]),
                        .in0(b4_in0[2:0]),
                        .in1(b4_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux5(.dout(b5_outmx[2:0]),
                        .in0(b5_in0[2:0]),
                        .in1(b5_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux6(.dout(b6_outmx[2:0]),
                        .in0(b6_in0[2:0]),
                        .in1(b6_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux7(.dout(b7_outmx[2:0]),
                        .in0(b7_in0[2:0]),
                        .in1(b7_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux8(.dout(b8_outmx[2:0]),
                        .in0(b8_in0[2:0]),
                        .in1(b8_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux9(.dout(b9_outmx[2:0]),
                        .in0(b9_in0[2:0]),
                        .in1(b9_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux10(.dout(b10_outmx[2:0]),
                        .in0(b10_in0[2:0]),
                        .in1(b10_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux11(.dout(b11_outmx[2:0]),
                        .in0(b11_in0[2:0]),
                        .in1(b11_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux12(.dout(b12_outmx[2:0]),
                        .in0(b12_in0[2:0]),
                        .in1(b12_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux13(.dout(b13_outmx[2:0]),
                        .in0(b13_in0[2:0]),
                        .in1(b13_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux14(.dout(b14_outmx[2:0]),
                        .in0(b14_in0[2:0]),
                        .in1(b14_in1[2:0]),
                        .sel(~head));
  dp_mux2es #(3)    out_mux15(.dout(b15_outmx[2:0]),
                        .in0(b15_in0[2:0]),
                        .in1(b15_in1[2:0]),
                        .sel(~head));
  dp_mux2es         out_mux16(.dout(b16_outmx),
                        .in0(1'b0),
                        .in1(b16_in1),
                        .sel(~head));

  dff_s #(3)    out_dff0 (.din(b0_outmx[2:0]), .clk(clk_enb0), .q(b0[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff1 (.din(b1_outmx[2:0]), .clk(clk_enb0), .q(b1[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff2 (.din(b2_outmx[2:0]), .clk(clk_enb0), .q(b2[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff3 (.din(b3_outmx[2:0]), .clk(clk_enb0), .q(b3[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff4 (.din(b4_outmx[2:0]), .clk(clk_enb0), .q(b4[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff5 (.din(b5_outmx[2:0]), .clk(clk_enb0), .q(b5[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff6 (.din(b6_outmx[2:0]), .clk(clk_enb0), .q(b6[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff7 (.din(b7_outmx[2:0]), .clk(clk_enb0), .q(b7[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff8 (.din(b8_outmx[2:0]), .clk(clk_enb0), .q(b8[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff9 (.din(b9_outmx[2:0]), .clk(clk_enb0), .q(b9[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff10 (.din(b10_outmx[2:0]), .clk(clk_enb0), .q(b10[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff11 (.din(b11_outmx[2:0]), .clk(clk_enb0), .q(b11[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff12 (.din(b12_outmx[2:0]), .clk(clk_enb0), .q(b12[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff13 (.din(b13_outmx[2:0]), .clk(clk_enb0), .q(b13[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff14 (.din(b14_outmx[2:0]), .clk(clk_enb0), .q(b14[2:0]),
			.se(se), .si(), .so());
  dff_s #(3)    out_dff15 (.din(b15_outmx[2:0]), .clk(clk_enb0), .q(b15[2:0]),
			.se(se), .si(), .so());
  dff_s 	      out_dff16 (.din(b16_outmx), .clk(clk_enb0), .q(b16),
			.se(se), .si(), .so());
endmodule //mul_booth

module mul_bodec (x, b,  
        b0, b1, b2, b3, b4, b5, b6, b7);

input	x;
input   [15:0] 	b;
output  [2:0] 	b0, b1, b2, b3, b4, b5, b6, b7; 

assign b0[2] = b[1];
assign b0[1] = ~((b[1] & b[0] & x) | (~b[1] & ~b[0] & ~x)) ;
assign b0[0] = (~b[1] & b[0] & x) | (b[1] & ~b[0] & ~x) ;

assign b1[2] = b[3]; 
assign b1[1] = ~((b[3] & b[2] & b[1]) | (~b[3] & ~b[2] & ~b[1])) ;
assign b1[0] = (~b[3] & b[2] & b[1]) | (b[3] & ~b[2] & ~b[1]) ;

assign b2[2] = b[5]; 
assign b2[1] = ~((b[5] & b[4] & b[3]) | (~b[5] & ~b[4] & ~b[3])) ;
assign b2[0] = (~b[5] & b[4] & b[3]) | (b[5] & ~b[4] & ~b[3]) ;

assign b3[2] = b[7] ;
assign b3[1] = ~((b[7] & b[6] & b[5]) | (~b[7] & ~b[6] & ~b[5])) ;
assign b3[0] = (~b[7] & b[6] & b[5]) | (b[7] & ~b[6] & ~b[5]) ;

assign b4[2] = b[9] ;
assign b4[1] = ~((b[9] & b[8] & b[7]) | (~b[9] & ~b[8] & ~b[7])) ;
assign b4[0] = (~b[9] & b[8] & b[7]) | (b[9] & ~b[8] & ~b[7]) ;

assign b5[2] = b[11] ;
assign b5[1] = ~((b[11] & b[10] & b[9]) | (~b[11] & ~b[10] & ~b[9])) ;
assign b5[0] = (~b[11] & b[10] & b[9]) | (b[11] & ~b[10] & ~b[9]) ;

assign b6[2] = b[13] ;
assign b6[1] = ~((b[13] & b[12] & b[11]) | (~b[13] & ~b[12] & ~b[11])) ;
assign b6[0] = (~b[13] & b[12] & b[11]) | (b[13] & ~b[12] & ~b[11]) ;

assign b7[2] = b[15] ;
assign b7[1] = ~((b[15] & b[14] & b[13]) | (~b[15] & ~b[14] & ~b[13])) ;
assign b7[0] = (~b[15] & b[14] & b[13]) | (b[15] & ~b[14] & ~b[13]) ;

endmodule // mul_bodec
`endif
