// ========== Copyright Header Begin ============================================
// Copyright (c) 2015 Princeton University
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Princeton University nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ========== Copyright Header End ============================================

module MC_packet_trans_test_dut
#()
(
clk,
rst,
flit_in,
flit_in_val,
flit_in_rdy,
flit_out,
flit_out_val,
flit_out_rdy
);

input           clk;
input           rst;
input  [63:0]   flit_in;
input           flit_in_val;
output          flit_in_rdy;
output [63:0]   flit_out;
output          flit_out_val;
input           flit_out_rdy;



wire app_rdy;
wire app_wdf_rdy;
wire app_rd_data;
wire app_rd_data_end;
wire app_rd_data_valid;
wire phy_init_done;
wire app_wdf_wren;
wire app_wdf_data;
wire app_wdf_mask;
wire app_wdf_end;
wire app_addr;
wire app_en;
wire app_cmd;


//TODO: figure out clocking

 mc_model_DDR3_wrapper
 #(
 )mc (
  .app_rdy(app_rdy),
  .app_wdf_rdy(app_wdf_rdy),
  .app_rd_data(app_rd_data),
  .app_rd_data_end(app_rd_data_end),
  .app_rd_data_valid(app_rd_data_valid),
  .phy_init_done(phy_init_done),
  .app_wdf_wren(app_wdf_wren),
  .app_wdf_data(app_wdf_data),
  .app_wdf_mask(app_wdf_mask),
  .app_wdf_end(app_wdf_end),
  .app_addr(app_addr),
  .app_en(app_en),
  .app_cmd(app_cmd)
);




//**************************************************************************//
// Instantiate Packet Translator
//**************************************************************************//

  pkt_trans_dp
  # (
  )
  u_pkt_trans_dp(
  .clk(clk),
  .rst(rst),
  .flit_in(flit_in),
  .flit_in_val(flit_in_val),
  .flit_in_rdy(flit_in_rdy),
  .flit_out(flit_out),
  .flit_out_val(flit_out_val),
  .flit_out_rdy(flit_out_rdy),
  .app_rdy(app_rdy),
  .app_wdf_rdy(app_wdf_rdy),
  .app_rd_data(app_rd_data),
  .app_rd_data_end(app_rd_data_end),
  .app_rd_data_valid(app_rd_data_valid),
  .phy_init_done(phy_init_done),
  .app_wdf_wren(app_wdf_wren),
  .app_wdf_data(app_wdf_data),
  .app_wdf_mask(app_wdf_mask),
  .app_wdf_end(app_wdf_end),
  .app_addr(app_addr),
  .app_en(app_en),
  .app_cmd(app_cmd)
  );


endmodule

