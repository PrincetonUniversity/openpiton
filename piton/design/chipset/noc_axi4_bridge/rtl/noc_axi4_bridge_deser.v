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


module noc_axi4_bridge_deser (
  input clk, 
  input rst_n, 

  input [`NOC_DATA_WIDTH-1:0] flit_in, 
  input  flit_in_val, 
  output flit_in_rdy, 
  input phy_init_done,

  output [`MSG_HEADER_WIDTH-1:0] header_out, 
  output [`AXI4_DATA_WIDTH-1:0] data_out, 
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
reg [`NOC_DATA_WIDTH-1:0]           in_data_buf[`PAYLOAD_LEN-1:0]; //buffer for incomming packets
reg [`MSG_LENGTH_WIDTH-1:0]         remaining_flits; //flits remaining in current packet
reg [2:0]                           state;

assign flit_in_rdy = (state != SEND) & phy_init_done;
wire flit_in_go = flit_in_val & flit_in_rdy;
assign out_val = (state == SEND);

always @(posedge clk) begin
  if(~rst_n) begin
    state <= ACCEPT_W1;
    remaining_flits <= 0;
    pkt_w1 <= 0;
    pkt_w2 <= 0;
    pkt_w3 <= 0;
  end 
  else begin
    case (state)
      ACCEPT_W1: begin
        if (flit_in_go) begin
          state <= ACCEPT_W2;
          remaining_flits <= flit_in[`MSG_LENGTH]-1;
          pkt_w1 <= flit_in;  
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
          pkt_w1 <= pkt_w1;
        end
        pkt_w2 <= pkt_w2;
        pkt_w3 <= pkt_w3;  
      end
      ACCEPT_W2: begin
        if (flit_in_go) begin
          state <= ACCEPT_W3;
          remaining_flits <= remaining_flits - 1;
          pkt_w2 <= flit_in;
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
          pkt_w2 <= pkt_w2;
        end
        pkt_w1 <= pkt_w1;
        pkt_w3 <= pkt_w3;  
      end
      ACCEPT_W3: begin
        if (flit_in_go) begin
          if (remaining_flits == 0) begin
            state <= SEND;
            remaining_flits <= 0;
          end
          else begin
            state <= ACCEPT_DATA;
            remaining_flits <= remaining_flits - 1;
          end
          pkt_w3 <= flit_in;  
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
          pkt_w3 <= pkt_w3;  
        end
        pkt_w1 <= pkt_w1;
        pkt_w2 <= pkt_w2;
      end
      ACCEPT_DATA: begin
        if (flit_in_go) begin
          if (remaining_flits == 0) begin
            state <= SEND;
            remaining_flits <= 0;
          end
          else begin
            state <= ACCEPT_DATA;
            remaining_flits <= remaining_flits - 1;
          end
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
        end
        pkt_w1 <= pkt_w1;
        pkt_w2 <= pkt_w2;
        pkt_w3 <= pkt_w3;  
      end
      SEND: begin
        if (out_rdy) begin
          state <= ACCEPT_W1;
          remaining_flits <= 0;
          pkt_w1 <= 0;
          pkt_w2 <= 0;
          pkt_w3 <= 0;
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
          pkt_w1 <= pkt_w1;
          pkt_w2 <= pkt_w2;
          pkt_w3 <= pkt_w3;  
        end
      end
    endcase // state
  end
end

genvar i;
generate
  for (i = 0; i < `PAYLOAD_LEN; i = i + 1) begin
    always @(posedge clk) begin
      if(~rst_n) begin
        in_data_buf[i] <= 0;
      end 
      else begin
        in_data_buf[i] <= (i == remaining_flits) & flit_in_val & (state == ACCEPT_DATA) ? flit_in 
                        : (state == SEND) & out_rdy                                     ? 0
                        :                                                                 in_data_buf[i];
      end
    end
  end
endgenerate



assign header_out = {pkt_w3, pkt_w2, pkt_w1};
assign data_out = {in_data_buf[0], in_data_buf[1], in_data_buf[2], in_data_buf[3], in_data_buf[4], in_data_buf[5], in_data_buf[6], in_data_buf[7]};

endmodule
