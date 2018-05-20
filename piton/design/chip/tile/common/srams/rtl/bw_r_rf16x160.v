// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_rf16x160.v
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
// 16 X 160 R1 W1 RF macro
// REad/Write ports can be accessed in PH1 only.
////////////////////////////////////////////////////////////////////////

`ifdef SIM_FPGA_SYN_SRAM_RF16X160 // simulation flag
`define PITON_PROTO
`endif

`ifdef FPGA_FORCE_SRAM_RF16X160
`undef PITON_PROTO
`endif

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_16x160
`else
`define SRAM_RF16X160
`endif

`ifdef FPGA_SYN_16x160
module bw_r_rf16x160(/*AUTOARG*/
   // Outputs
   dout, so_w, so_r,
   // Inputs
   din, rd_adr, wr_adr, read_en, wr_en, rst_tri_en, word_wen,
   byte_wen, rd_clk, wr_clk, se, si_r, si_w, reset_l, sehold
   );

   input [159:0]  din; // data input
   input [3:0]    rd_adr;   // read addr
   input [3:0]	  wr_adr;  // write addr
   input          read_en;
   input	  wr_en;	//   used in conjunction with
				//  word_wen and byte_wen
   input	  rst_tri_en ; // gates off writes during SCAN.
   input [3:0]    word_wen; // word enables ( if you don't use these
			    // tie them to Vdd )
   input [19:0]	  byte_wen;	// byte enables ( if you don't use these
                            // tie them to Vdd )
   input          rd_clk;
   input          wr_clk;
   input          se, si_r, si_w ;
   input	  reset_l;
   input	  sehold; // hold scan in data.

   output [159:0] dout;
   output         so_w;
   output         so_r;

   // Lint
   wire _unused_ok = &{1'b0,
                      se,
                      si_r,
                      si_w,
                      1'b0};

   wire _unused_output = 1'b0;
   assign so_w = _unused_output;
   assign so_r = _unused_output;

   // local signals
   reg  [159:0]   wrdata_d1;

   reg  [3:0]     rdptr_d1, wrptr_d1;
   reg            ren_d1;
   reg 	          wr_en_d1;


   wire          so;
   // internal variable
   integer          i, j;
   reg     [159:0]  temp, data_in, tmp_dout;
   reg     [3:0]    word_wen_d1;
   reg     [3:0]    word_wen_d2;
   reg     [19:0]   byte_wen_d1;
   reg			rst_tri_en_d1;


//-------

always @ (posedge wr_clk)
begin
  wrdata_d1[159:0]  <= (sehold) ? wrdata_d1[159:0]  : din[159:0];
  wr_en_d1          <= (sehold) ? wr_en_d1          : wr_en;
  word_wen_d1[3:0]  <= (sehold) ? word_wen_d1[3:0]  : word_wen[3:0];
  word_wen_d2[3:0]  <= (sehold) ? word_wen_d2[3:0]  : (word_wen[3:0] &
				{4{wr_en & ~rst_tri_en}});
  byte_wen_d1[19:0] <= (sehold) ? byte_wen_d1[19:0] : byte_wen[19:0];
  wrptr_d1[3:0]     <= (sehold) ? wrptr_d1[3:0]     : wr_adr[3:0];

  rst_tri_en_d1 <= rst_tri_en ; // not a real flop. ONly used as a trigger.
end
//-------


always @ (posedge rd_clk)
begin
  ren_d1        <= (sehold) ? ren_d1        : read_en;
  rdptr_d1[3:0] <= (sehold) ? rdptr_d1[3:0] : rd_adr[3:0];
end
//-------


bw_r_rf16x2 arr0 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 0]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[  7:  0]),
	.rd_data(dout[  7:  0]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr1 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 1]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 15:  8]),
	.rd_data(dout[ 15:  8]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr2 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 2]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 23: 16]),
	.rd_data(dout[ 23: 16]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr3 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 3]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 31: 24]),
	.rd_data(dout[ 31: 24]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr4 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 4]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 39: 32]),
	.rd_data(dout[ 39: 32]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr5 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 5]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 47: 40]),
	.rd_data(dout[ 47: 40]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr6 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 6]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 55: 48]),
	.rd_data(dout[ 55: 48]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr7 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 7]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 63: 56]),
	.rd_data(dout[ 63: 56]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr8 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 8]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 71: 64]),
	.rd_data(dout[ 71: 64]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr9 (
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[ 9]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 79: 72]),
	.rd_data(dout[ 79: 72]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr10(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[10]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 87: 80]),
	.rd_data(dout[ 87: 80]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr11(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[11]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[ 95: 88]),
	.rd_data(dout[ 95: 88]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr12(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[12]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[103: 96]),
	.rd_data(dout[103: 96]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr13(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[13]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[111:104]),
	.rd_data(dout[111:104]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr14(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[14]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[119:112]),
	.rd_data(dout[119:112]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr15(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[15]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[127:120]),
	.rd_data(dout[127:120]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr16(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[16]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[135:128]),
	.rd_data(dout[135:128]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr17(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[17]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[143:136]),
	.rd_data(dout[143:136]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr18(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[18]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[151:144]),
	.rd_data(dout[151:144]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

bw_r_rf16x2 arr19(
	.word_wen(word_wen_d2),
	.wen(byte_wen_d1[19]),
	.ren(ren_d1),
	.wr_addr(wrptr_d1),
	.rd_addr(rdptr_d1),
	.wr_data(wrdata_d1[159:152]),
	.rd_data(dout[159:152]),
	.clk(wr_clk),
	.rd_clk(rd_clk),
	.reset_l(reset_l));

endmodule // rf_16x160

module bw_r_rf16x2(word_wen, wen, ren, wr_addr, rd_addr, wr_data,
	rd_data, clk, rd_clk, reset_l);
  input [3:0] word_wen;
  input	      wen;
  input	      ren;
  input	[3:0] wr_addr;
  input [3:0] rd_addr;
  input [7:0] wr_data;
  output [7:0] rd_data;
  input	clk;
  input	rd_clk;
  input reset_l;

  reg	[7:0] rd_data_temp;

  reg [1:0] inq_ary0[15:0];
  reg [1:0] inq_ary1[15:0];
  reg [1:0] inq_ary2[15:0];
  reg [1:0] inq_ary3[15:0];

  always @(posedge clk) begin
    if(reset_l & wen & word_wen[0])
      inq_ary0[wr_addr] = {wr_data[4],wr_data[0]};
    if(reset_l & wen & word_wen[1])
      inq_ary1[wr_addr] = {wr_data[5],wr_data[1]};
    if(reset_l & wen & word_wen[2])
      inq_ary2[wr_addr] = {wr_data[6],wr_data[2]};
    if(reset_l & wen & word_wen[3])
      inq_ary3[wr_addr] = {wr_data[7],wr_data[3]};
  end

  always @(negedge rd_clk) begin
    if (~reset_l) begin
      rd_data_temp = 8'b0;
    end else if(ren == 1'b1) begin
        rd_data_temp = {inq_ary3[rd_addr], inq_ary2[rd_addr], inq_ary1[rd_addr], inq_ary0[rd_addr]};
    end
  end

  assign rd_data = {rd_data_temp[7], rd_data_temp[5], rd_data_temp[3],
		rd_data_temp[1], rd_data_temp[6], rd_data_temp[4],
		rd_data_temp[2], rd_data_temp[0]};

endmodule
`endif


`ifdef SRAM_RF16X160

module bw_r_rf16x160(/*AUTOARG*/
   // Outputs
   dout, so_w, so_r,
   // Inputs
   din, rd_adr, wr_adr, read_en, wr_en, rst_tri_en, word_wen,
   byte_wen, rd_clk, wr_clk, se, si_r, si_w, reset_l, sehold
   );

   input [159:0]  din; // data input
   input [3:0]    rd_adr;   // read addr
   input [3:0]    wr_adr;  // write addr
   input          read_en;
   input    wr_en;  //   used in conjunction with
        //  word_wen and byte_wen
   input    rst_tri_en ; // gates off writes during SCAN.
   input [3:0]    word_wen; // word enables ( if you don't use these
          // tie them to Vdd )
   input [19:0]   byte_wen; // byte enables ( if you don't use these
                            // tie them to Vdd )
   input          rd_clk;
   input          wr_clk;
   input          se, si_r, si_w ;
   input    reset_l;
   input    sehold; // hold scan in data.

   output [159:0] dout;
   output         so_w;
   output         so_r;

   // Lint
   wire _unused_ok = &{1'b0,
                      se,
                      si_r,
                      si_w,
                      1'b0};

   wire _unused_output = 1'b0;
   assign so_w = _unused_output;
   assign so_r = _unused_output;

   wire [159:0] bit_en; // write-mask
   // reg [159:0] din_d1;
   reg [3:0] rd_adr_d1;
   reg [3:0] rd_adr_d2;
   reg [3:0] wr_adr_d1;
   reg wr_en_d1;
   reg [3:0] word_wen_d1;
   reg [19:0] byte_wen_d1;
   reg read_en_d1;
   reg read_en_d2;

   // memory
   reg [159:0] inq_ary [15:0];

   // read
   assign dout = inq_ary[rd_adr_d1];

   // write
   always @ (posedge wr_clk)
   begin
      if (!reset_l)
      begin
         // assume flops
         inq_ary[00] <= 160'b0;
         inq_ary[01] <= 160'b0;
         inq_ary[02] <= 160'b0;
         inq_ary[03] <= 160'b0;
         inq_ary[04] <= 160'b0;
         inq_ary[05] <= 160'b0;
         inq_ary[06] <= 160'b0;
         inq_ary[07] <= 160'b0;
         inq_ary[08] <= 160'b0;
         inq_ary[09] <= 160'b0;
         inq_ary[10] <= 160'b0;
         inq_ary[11] <= 160'b0;
         inq_ary[12] <= 160'b0;
         inq_ary[13] <= 160'b0;
         inq_ary[14] <= 160'b0;
         inq_ary[15] <= 160'b0;
      end
      else
      begin
         if (wr_en)
         begin
            inq_ary[wr_adr] <= (din & bit_en) | (inq_ary[wr_adr] & ~bit_en);
         end
      end
   end

   // pipeline crap

   always @ (posedge rd_clk)
   begin
      // din_d1 <= din;
      rd_adr_d1 <= rd_adr;
      rd_adr_d2 <= rd_adr_d1;
      wr_adr_d1 <= wr_adr;
      wr_en_d1 <= wr_en;
      word_wen_d1 <= word_wen;
      byte_wen_d1 <= byte_wen;
      read_en_d1 <= read_en;
      read_en_d2 <= read_en_d1;
   end

   assign bit_en[0]  = word_wen[0] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[1]  = word_wen[1] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[2]  = word_wen[2] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[3]  = word_wen[3] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[4]  = word_wen[0] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[5]  = word_wen[1] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[6]  = word_wen[2] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[7]  = word_wen[3] & byte_wen[0] & ~rst_tri_en;
   assign bit_en[8]  = word_wen[0] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[9]  = word_wen[1] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[10] = word_wen[2] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[11] = word_wen[3] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[12] = word_wen[0] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[13] = word_wen[1] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[14] = word_wen[2] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[15] = word_wen[3] & byte_wen[1] & ~rst_tri_en;
   assign bit_en[16] = word_wen[0] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[17] = word_wen[1] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[18] = word_wen[2] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[19] = word_wen[3] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[20] = word_wen[0] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[21] = word_wen[1] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[22] = word_wen[2] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[23] = word_wen[3] & byte_wen[2] & ~rst_tri_en;
   assign bit_en[24] = word_wen[0] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[25] = word_wen[1] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[26] = word_wen[2] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[27] = word_wen[3] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[28] = word_wen[0] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[29] = word_wen[1] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[30] = word_wen[2] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[31] = word_wen[3] & byte_wen[3] & ~rst_tri_en;
   assign bit_en[32] = word_wen[0] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[33] = word_wen[1] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[34] = word_wen[2] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[35] = word_wen[3] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[36] = word_wen[0] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[37] = word_wen[1] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[38] = word_wen[2] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[39] = word_wen[3] & byte_wen[4] & ~rst_tri_en;
   assign bit_en[40] = word_wen[0] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[41] = word_wen[1] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[42] = word_wen[2] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[43] = word_wen[3] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[44] = word_wen[0] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[45] = word_wen[1] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[46] = word_wen[2] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[47] = word_wen[3] & byte_wen[5] & ~rst_tri_en;
   assign bit_en[48] = word_wen[0] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[49] = word_wen[1] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[50] = word_wen[2] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[51] = word_wen[3] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[52] = word_wen[0] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[53] = word_wen[1] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[54] = word_wen[2] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[55] = word_wen[3] & byte_wen[6] & ~rst_tri_en;
   assign bit_en[56] = word_wen[0] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[57] = word_wen[1] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[58] = word_wen[2] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[59] = word_wen[3] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[60] = word_wen[0] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[61] = word_wen[1] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[62] = word_wen[2] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[63] = word_wen[3] & byte_wen[7] & ~rst_tri_en;
   assign bit_en[64] = word_wen[0] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[65] = word_wen[1] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[66] = word_wen[2] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[67] = word_wen[3] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[68] = word_wen[0] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[69] = word_wen[1] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[70] = word_wen[2] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[71] = word_wen[3] & byte_wen[8] & ~rst_tri_en;
   assign bit_en[72] = word_wen[0] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[73] = word_wen[1] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[74] = word_wen[2] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[75] = word_wen[3] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[76] = word_wen[0] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[77] = word_wen[1] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[78] = word_wen[2] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[79] = word_wen[3] & byte_wen[9] & ~rst_tri_en;
   assign bit_en[80] = word_wen[0] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[81] = word_wen[1] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[82] = word_wen[2] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[83] = word_wen[3] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[84] = word_wen[0] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[85] = word_wen[1] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[86] = word_wen[2] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[87] = word_wen[3] & byte_wen[10] & ~rst_tri_en;
   assign bit_en[88] = word_wen[0] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[89] = word_wen[1] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[90] = word_wen[2] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[91] = word_wen[3] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[92] = word_wen[0] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[93] = word_wen[1] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[94] = word_wen[2] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[95] = word_wen[3] & byte_wen[11] & ~rst_tri_en;
   assign bit_en[96] = word_wen[0] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[97] = word_wen[1] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[98] = word_wen[2] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[99] = word_wen[3] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[100] = word_wen[0] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[101] = word_wen[1] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[102] = word_wen[2] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[103] = word_wen[3] & byte_wen[12] & ~rst_tri_en;
   assign bit_en[104] = word_wen[0] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[105] = word_wen[1] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[106] = word_wen[2] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[107] = word_wen[3] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[108] = word_wen[0] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[109] = word_wen[1] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[110] = word_wen[2] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[111] = word_wen[3] & byte_wen[13] & ~rst_tri_en;
   assign bit_en[112] = word_wen[0] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[113] = word_wen[1] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[114] = word_wen[2] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[115] = word_wen[3] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[116] = word_wen[0] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[117] = word_wen[1] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[118] = word_wen[2] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[119] = word_wen[3] & byte_wen[14] & ~rst_tri_en;
   assign bit_en[120] = word_wen[0] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[121] = word_wen[1] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[122] = word_wen[2] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[123] = word_wen[3] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[124] = word_wen[0] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[125] = word_wen[1] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[126] = word_wen[2] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[127] = word_wen[3] & byte_wen[15] & ~rst_tri_en;
   assign bit_en[128] = word_wen[0] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[129] = word_wen[1] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[130] = word_wen[2] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[131] = word_wen[3] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[132] = word_wen[0] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[133] = word_wen[1] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[134] = word_wen[2] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[135] = word_wen[3] & byte_wen[16] & ~rst_tri_en;
   assign bit_en[136] = word_wen[0] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[137] = word_wen[1] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[138] = word_wen[2] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[139] = word_wen[3] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[140] = word_wen[0] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[141] = word_wen[1] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[142] = word_wen[2] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[143] = word_wen[3] & byte_wen[17] & ~rst_tri_en;
   assign bit_en[144] = word_wen[0] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[145] = word_wen[1] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[146] = word_wen[2] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[147] = word_wen[3] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[148] = word_wen[0] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[149] = word_wen[1] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[150] = word_wen[2] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[151] = word_wen[3] & byte_wen[18] & ~rst_tri_en;
   assign bit_en[152] = word_wen[0] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[153] = word_wen[1] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[154] = word_wen[2] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[155] = word_wen[3] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[156] = word_wen[0] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[157] = word_wen[1] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[158] = word_wen[2] & byte_wen[19] & ~rst_tri_en;
   assign bit_en[159] = word_wen[3] & byte_wen[19] & ~rst_tri_en;

endmodule


`endif

`ifdef SIM_FPGA_SYN_SRAM_RF16X160 // simulation flag
`undef PITON_PROTO
`endif

`ifdef FPGA_FORCE_SRAM_RF16X160
`define PITON_PROTO
`endif
