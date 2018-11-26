// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_frf.v
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
/*
//  Module Name: bw_r_frf
// Description: This is the floating point register file.  It has one R/W port that is
//     78 bits (64 bits data, 14 bits ecc) wide.
*/

`define SRAM_FRF
// trin 4/18/16: always use nowrapper implementation
//  all others will fail floating point tests


`ifdef SRAM_FRF
`include "define.tmp.h"

module bw_r_frf (/*AUTOARG*/
   // Outputs
   so, frf_dp_data,
   // Inputs
   rclk, si, se, sehold, rst_tri_en, ctl_frf_wen, ctl_frf_ren,
   dp_frf_data, ctl_frf_addr,


   // sram wrapper interface
   srams_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data

   ) ;
   input rclk;
   input si;
   input se;
   input sehold;
   input rst_tri_en;
   input [1:0] ctl_frf_wen;
   input ctl_frf_ren;
   input [77:0] dp_frf_data;
   input [6:0]   ctl_frf_addr;

   output so;
   output [77:0] frf_dp_data;

   wire [7:0]    regfile_index;
  //  wire [7:0]   regfile_index_low;
    // wire [7:0] regfile_index_high;
   //
   reg [77:0] frf_dp_data_f;

   assign frf_dp_data = frf_dp_data_f;

  output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
  input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
  input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

   // reg            rst_tri_en_negedge;
   // wire           ren_d1;
   // wire [6:0]     addr_d1;
   // wire [1:0]     wen_d1;
   // wire [77:0]    write_data_d1;
   // wire [77:0]    sehold_write_data;
   // wire [9:0]     sehold_cntl_data;

   // wire [9:0]     cntl_scan_data;
   // wire [38:0]    write_scan_data_hi;
   // wire [38:0]    write_scan_data_lo;
   // wire [38:0]    read_scan_data_hi;
   // wire [38:0]    read_scan_data_lo;

   // wire           real_se;
   // assign         real_se = se & ~sehold;

   // This is for sas comparisons
   assign        regfile_index[7:0] = {ctl_frf_addr[6:0], 1'b0};

   // assign        regfile_index_low[7:0] = {addr_d1[6:0], 1'b0};
   // assign        regfile_index_high[7:0] = {addr_d1[6:0], 1'b1};

   // assign         sehold_write_data[77:0] = (sehold)? write_data_d1[77:0]: dp_frf_data[77:0];
   // assign sehold_cntl_data[9:0] = (sehold)? {addr_d1[6:0],wen_d1[1:0], ren_d1}:
   //                                          {ctl_frf_addr[6:0],ctl_frf_wen[1:0],ctl_frf_ren};
   // All inputs go through flop
   // dff_s #(39) datain_dff1(.din(sehold_write_data[77:39]), .clk(rclk), .q(write_data_d1[77:39]),
   //                       .se(real_se), .si({cntl_scan_data[0],write_scan_data_lo[38:1]}),
   //                       .so(write_scan_data_hi[38:0]));
   // dff_s #(39) datain_dff2(.din(sehold_write_data[38:0]), .clk(rclk), .q(write_data_d1[38:0]),
   //                       .se(real_se), .si(write_scan_data_hi[38:0]), .so(write_scan_data_lo[38:0]));
   // dff_s #(10) controlin_dff(.din(sehold_cntl_data[9:0]),
   //                         .q({addr_d1[6:0],wen_d1[1:0],ren_d1}),
   //                         .clk(rclk), .se(real_se), .si({si,cntl_scan_data[9:1]}), .so(cntl_scan_data[9:0]));


   wire [77:0] write_mask = {{39{ctl_frf_wen[1]}},{39{ctl_frf_wen[0]}}};
   wire ctl_frf_wens = ctl_frf_wen[1] | ctl_frf_wen[0];

   wire [77:0] read_data;
sram_1rw_128x78 regfile
//sram_configurable_frf regfile
(
  .MEMCLK(rclk),
  .RESET_N(!rst_tri_en),
  .CE(ctl_frf_wens | ctl_frf_ren),
  .A(ctl_frf_addr),
  .DIN(dp_frf_data),
  .BW(write_mask),
  .RDWEN(~ctl_frf_wens),
  .DOUT(read_data),

  .BIST_COMMAND(rtap_srams_bist_command),
  .BIST_DIN(rtap_srams_bist_data),
  .BIST_DOUT(srams_rtap_data),
  .SRAMID(`BIST_ID_L1_FRF)
);

   always @ (posedge rclk)
   begin
      frf_dp_data_f <= read_data;
   end

   // dff_s #(39) dataout_dff1(.din(read_data[77:39]), .clk(rclk), .q(frf_dp_data[77:39]),
   //                        .se(real_se), .si(read_scan_data_lo[38:0]), .so(read_scan_data_hi[38:0]));
   // dff_s #(39) dataout_dff2(.din(read_data[38:0]), .clk(rclk), .q(frf_dp_data[38:0]),
   //                        .se(real_se), .si({read_scan_data_hi[37:0],write_scan_data_lo[0]}),
   //                        .so(read_scan_data_lo[38:0]));
   // assign so = read_scan_data_hi[38];


   // always @ (negedge rclk) begin
   //    // latch rst_tri_en
   //    rst_tri_en_negedge <= rst_tri_en;
   // end

endmodule // sparc_ffu_frf


`else // `ifdef SRAM_FRF

TRIN_NOT_USED; // FPGA should be using the SRAM implmentation above

module bw_r_frf (/*AUTOARG*/
   // Outputs
   so, frf_dp_data,
   // Inputs
   rclk, si, se, sehold, rst_tri_en, ctl_frf_wen, ctl_frf_ren,
   dp_frf_data, ctl_frf_addr,
   // sram wrapper interface
   srams_rtap_data,
   rtap_srams_bist_command,
   rtap_srams_bist_data
   ) ;
   input rclk;
   input si;
   input se;
   input sehold;
   input rst_tri_en;
   input [1:0] ctl_frf_wen;
   input ctl_frf_ren;
   input [77:0] dp_frf_data;
   input [6:0]   ctl_frf_addr;

   output so;
   output [77:0] frf_dp_data;

  output [`SRAM_WRAPPER_BUS_WIDTH-1:0] srams_rtap_data;
  input  [`BIST_OP_WIDTH-1:0] rtap_srams_bist_command;
  input  [`SRAM_WRAPPER_BUS_WIDTH-1:0] rtap_srams_bist_data;

   wire [7:0]    regfile_index;
   //XST WA CR436004
        (* keep = "yes" *) wire [7:0]   regfile_index_low;
  (* keep = "yes" *) wire [7:0] regfile_index_high;
   //

`ifdef FPGA_SYN_FRF
   (* ram_style = "block" *) reg [38:0]     regfile_high [127:0];
   (* ram_style = "block" *) reg [38:0]     regfile_low [127:0];
`else
   reg [38:0]     regfile [255:0];
`endif

   reg            rst_tri_en_negedge;
   wire [77:0]    read_data;
   wire           ren_d1;
   wire [6:0]     addr_d1;
   wire [1:0]     wen_d1;
   wire [77:0]    write_data_d1;
   wire [77:0]    sehold_write_data;
   wire [9:0]     sehold_cntl_data;

   wire [9:0]     cntl_scan_data;
   wire [38:0]    write_scan_data_hi;
   wire [38:0]    write_scan_data_lo;
   wire [38:0]    read_scan_data_hi;
   wire [38:0]    read_scan_data_lo;

   wire           real_se;
   assign         real_se = se & ~sehold;

   // This is for sas comparisons
   assign        regfile_index[7:0] = {ctl_frf_addr[6:0], 1'b0};

   assign        regfile_index_low[7:0] = {addr_d1[6:0], 1'b0};
   assign        regfile_index_high[7:0] = {addr_d1[6:0], 1'b1};

   assign         sehold_write_data[77:0] = (sehold)? write_data_d1[77:0]: dp_frf_data[77:0];
   assign sehold_cntl_data[9:0] = (sehold)? {addr_d1[6:0],wen_d1[1:0], ren_d1}:
                                            {ctl_frf_addr[6:0],ctl_frf_wen[1:0],ctl_frf_ren};
   // All inputs go through flop
   dff_s #(39) datain_dff1(.din(sehold_write_data[77:39]), .clk(rclk), .q(write_data_d1[77:39]),
                         .se(real_se), .si({cntl_scan_data[0],write_scan_data_lo[38:1]}),
                         .so(write_scan_data_hi[38:0]));
   dff_s #(39) datain_dff2(.din(sehold_write_data[38:0]), .clk(rclk), .q(write_data_d1[38:0]),
                         .se(real_se), .si(write_scan_data_hi[38:0]), .so(write_scan_data_lo[38:0]));
   dff_s #(10) controlin_dff(.din(sehold_cntl_data[9:0]),
                           .q({addr_d1[6:0],wen_d1[1:0],ren_d1}),
                           .clk(rclk), .se(real_se), .si({si,cntl_scan_data[9:1]}), .so(cntl_scan_data[9:0]));

   // Read logic
`ifdef FPGA_SYN_FRF
   assign read_data[77:0] = (~ren_d1)?             78'b0:
                            (wen_d1[1]|wen_d1[0])? {78{1'bx}}:
                               {regfile_high[regfile_index_high[7:1]],regfile_low[regfile_index_low[7:1]]};
`else
   assign read_data[77:0] = (~ren_d1)?             78'b0:
                            (wen_d1[1]|wen_d1[0])? {78{1'bx}}:
                               {regfile[regfile_index_high],regfile[regfile_index_low]};
`endif


   dff_s #(39) dataout_dff1(.din(read_data[77:39]), .clk(rclk), .q(frf_dp_data[77:39]),
                          .se(real_se), .si(read_scan_data_lo[38:0]), .so(read_scan_data_hi[38:0]));
   dff_s #(39) dataout_dff2(.din(read_data[38:0]), .clk(rclk), .q(frf_dp_data[38:0]),
                          .se(real_se), .si({read_scan_data_hi[37:0],write_scan_data_lo[0]}),
                          .so(read_scan_data_lo[38:0]));
   assign so = read_scan_data_hi[38];

   always @ (posedge rclk) begin
      // Write port
      // write is gated by rst_tri_en
`ifdef FPGA_SYN_FRF
      if (wen_d1[0] & ~ren_d1 & ~rst_tri_en_negedge) begin
    regfile_low[regfile_index_low[7:1]] <= write_data_d1[38:0];
      end
      if (wen_d1[1] & ~ren_d1 & ~rst_tri_en_negedge) begin
         regfile_high[regfile_index_high[7:1]] <= write_data_d1[77:39];
      end
`else
      if (wen_d1[0] & ~ren_d1 & ~rst_tri_en_negedge) begin
         regfile[regfile_index_low] <= write_data_d1[38:0];
      end
      if (wen_d1[1] & ~ren_d1 & ~rst_tri_en_negedge) begin
         regfile[regfile_index_high] <= write_data_d1[77:39];
      end
`endif
   end
   always @ (negedge rclk) begin
      // latch rst_tri_en
      rst_tri_en_negedge <= rst_tri_en;
   end

endmodule // sparc_ffu_frf

`endif
