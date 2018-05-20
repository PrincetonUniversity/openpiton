// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: bw_r_rf32x152b.v
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
//      Description:    DCache Fill Queue of Load Store Unit.
//                      - Contains invalidates and loads.
//                      - loads will bypass and/or fill dcache.
//                      - Entry at head of queue may have to
//                      be held for multiple passes.
//
*/

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module bw_r_rf32x152b(dout, so, rd_en, rd_adr, wr_en, wr_adr, din, si, se,
  sehold, rclk, rst_tri_en, reset_l);

  parameter   NUMENTRIES  = 32;

  input [4:0]   rd_adr;
  input     rd_en;
  input     wr_en;
  input [4:0]   wr_adr;
  input [151:0]   din;
  input     rclk;
  input     reset_l;
  input     rst_tri_en;
  input     sehold;
  input     si;
  input     se;
  output  [151:0]   dout;
  // reg [151:0]   dout;
  output      so;

  wire      clk;
  wire      wr_vld;

  reg [151:0]   mem[(NUMENTRIES - 1):0];  /* synthesis syn_ramstyle = block_ram  syn_ramstyle = no_rw_check */
  // reg rd_en_d1;
  reg [4:0]   rd_adr_d1;

  assign clk = rclk;
  assign wr_vld = ((wr_en & (~rst_tri_en)) & reset_l);

  always @(posedge clk) begin
    if (wr_vld) begin
      mem[wr_adr] = din;
    end
    // rd_en_d1 <= rd_en;
    rd_adr_d1 <= rd_adr;
  end

  assign dout = mem[rd_adr_d1];

endmodule

