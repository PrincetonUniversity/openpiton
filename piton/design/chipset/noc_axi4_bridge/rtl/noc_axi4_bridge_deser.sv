// Modified by Barcelona Supercomputing Center on March 3rd, 2022
// ========== Copyright Header Begin ============================================
// Copyright (c) 2019 Princeton University
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

`include "mc_define.h"
`include "define.tmp.h"
`include "noc_axi4_bridge_define.vh"
import noc_axi4_bridge_pkg::*;


module noc_axi4_bridge_deser #(
  parameter SWAP_ENDIANESS = 0 // swap endianess, needed when used in conjunction with a little endian core like Ariane
) (
  input clk, 
  input rst_n, 

  input [`NOC_DATA_WIDTH-1:0] flit_in, 
  input  flit_in_val, 
  output flit_in_rdy, 
  input phy_init_done,

  output [`MSG_HEADER_WIDTH-1:0] header_out, 
  output reg [`AXI4_DATA_WIDTH-1:0] data_out, 
  output out_val, 
  input  out_rdy
);

localparam ACCEPT_W1   = 3'd0;
localparam ACCEPT_W2   = 3'd1;
localparam ACCEPT_W3   = 3'd2;
localparam ACCEPT_DATA = 3'd3;
localparam SEND        = 3'd4;

reg [`NOC_DATA_WIDTH-1:0]           pkt_w1;
reg [`NOC_DATA_WIDTH-1:0]           pkt_w2;
reg [`NOC_DATA_WIDTH-1:0]           pkt_w3; 
reg [`MSG_LENGTH_WIDTH-1:0]         remaining_flits; //flits remaining in current packet
reg [2:0]                           state;

assign flit_in_rdy = (state != SEND) & phy_init_done;
wire flit_in_go = flit_in_val & flit_in_rdy;
assign out_val = (state == SEND);

wire [`MSG_DATA_SIZE_WIDTH -1:0] dat_size_log;
noc_extractSize deser_extractSize(
                .header  (header_out),
                .size_log(dat_size_log));

wire [`NOC_DATA_WIDTH -1:0] data_swapped = SWAP_ENDIANESS ? swapData(flit_in, dat_size_log) :
                                                                     flit_in;
reg [$clog2(`PAYLOAD_LEN)-1 :0] dat_flit;
always @(posedge clk)
  if(~rst_n) state <= ACCEPT_W1;
  else
    case (state)
      ACCEPT_W1: begin
        if (flit_in_go) begin
          state <= ACCEPT_W2;
          remaining_flits <= flit_in[`MSG_LENGTH]-1;
          pkt_w1 <= flit_in;  
          dat_flit <= 0;
          data_out <= `AXI4_DATA_WIDTH'h0;
        end
      end
      ACCEPT_W2: begin
        if (flit_in_go) begin
          state <= ACCEPT_W3;
          remaining_flits <= remaining_flits - 1;
          pkt_w2 <= flit_in;
        end
      end
      ACCEPT_W3: begin
        if (flit_in_go) begin
          if (remaining_flits == 0)
            state <= SEND;
          else begin
            state <= ACCEPT_DATA;
            remaining_flits <= remaining_flits - 1;
          end
          pkt_w3 <= flit_in;  
        end
      end
      ACCEPT_DATA: begin
        if (flit_in_go) begin
          if (remaining_flits == 0)
            state <= SEND;
          else begin
            state <= ACCEPT_DATA;
            remaining_flits <= remaining_flits - 1;
            dat_flit <= dat_flit + 1;
          end
        end
        if (flit_in_val) begin
          data_out[dat_flit * `NOC_DATA_WIDTH +: `NOC_DATA_WIDTH] <= data_swapped;
        end
      end
      SEND: begin
        if (out_rdy)
          state <= ACCEPT_W1;
      end
      default: begin
        // should never end up here
        state <= 3'bX;
        remaining_flits <= `MSG_LENGTH_WIDTH'bX;
        pkt_w1 <= `NOC_DATA_WIDTH'bX;
        pkt_w2 <= `NOC_DATA_WIDTH'bX;
        pkt_w3 <= `NOC_DATA_WIDTH'bX;
      end
    endcase // state

assign header_out = {pkt_w3, pkt_w2, pkt_w1};

endmodule
