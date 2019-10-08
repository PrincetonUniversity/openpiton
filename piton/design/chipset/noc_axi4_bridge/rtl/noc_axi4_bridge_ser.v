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


module noc_axi4_bridge_ser(
  input clk, 
  input rst_n, 

  input [`MSG_HEADER_WIDTH-1:0] header_in, 
  input [`AXI4_DATA_WIDTH-1:0] data_in, 
  input in_val, 
  output in_rdy, 

  output reg [`NOC_DATA_WIDTH-1:0] flit_out, 
  output  flit_out_val, 
  input flit_out_rdy 
);

// states
localparam ACCEPT = 2'd0;
localparam SEND_HEADER = 2'd1;
localparam SEND_DATA = 2'd2;

reg [`AXI4_DATA_WIDTH-1:0] data_in_f;

wire in_go = in_val & in_rdy;
wire flit_out_go = flit_out_val & flit_out_rdy;

always @(posedge clk) begin 
  if(~rst_n) begin
    data_in_f <= {`AXI4_DATA_WIDTH{1'b0}};
  end 
  else if (in_go) begin
    data_in_f <= data_in;
  end
  else begin
    data_in_f <= data_in_f;
  end
end

reg [1:0] state;
reg [`MSG_LENGTH_WIDTH-1:0] remaining_flits;
assign flit_out_val = (state == SEND_HEADER) || (state == SEND_DATA);
assign in_rdy = (state == ACCEPT);


always @(posedge clk) begin
  if(~rst_n) begin
    state <= ACCEPT;
    remaining_flits <= `MSG_LENGTH_WIDTH'b0;
  end 
  else begin
    case (state)
      ACCEPT: begin
        state <= in_val ? SEND_HEADER : ACCEPT;
        remaining_flits <= `MSG_LENGTH_WIDTH'b0;
      end
      SEND_HEADER: begin
        if (flit_out_rdy) begin
          if (resp_header[`MSG_LENGTH] == 0) begin
            state <= ACCEPT;
            remaining_flits <= 0;
          end
          else begin
            state <= SEND_DATA;
            remaining_flits <= resp_header[`MSG_LENGTH];
          end
        end
        else begin
          state <= state;
          remaining_flits <= remaining_flits;
        end
      end
      SEND_DATA: begin
        if (remaining_flits == `MSG_LENGTH_WIDTH'b1) begin
          state <= flit_out_rdy ? ACCEPT : SEND_DATA;
          remaining_flits <= 0;
        end
        else begin
          state <= SEND_DATA;
          remaining_flits <= flit_out_rdy ? remaining_flits - `MSG_LENGTH_WIDTH'b1 : remaining_flits;
        end
      end
      default: begin
        // should never end up here
        state <= ACCEPT;
        remaining_flits <= `MSG_LENGTH_WIDTH'b0;
      end
    endcase // state
  end
end

reg [`NOC_DATA_WIDTH-1:0] resp_header;
always @(posedge clk) begin
  if (~rst_n) begin
    resp_header <= `NOC_DATA_WIDTH'b0;
  end
  else begin
    case (state)
      ACCEPT: begin
        if (in_go) begin
          resp_header[`MSG_DST_CHIPID  ]     <= header_in[`MSG_SRC_CHIPID];
          resp_header[`MSG_DST_X       ]     <= header_in[`MSG_SRC_X     ];
          resp_header[`MSG_DST_Y       ]     <= header_in[`MSG_SRC_Y     ];
          resp_header[`MSG_DST_FBITS   ]     <= header_in[`MSG_SRC_FBITS ];
          resp_header[`MSG_MSHRID      ]     <= header_in[`MSG_MSHRID    ];
          resp_header[`MSG_OPTIONS_1   ]     <= {`MSG_OPTIONS_1_WIDTH{1'b0}};
          case (header_in[`MSG_TYPE])
            `MSG_TYPE_LOAD_MEM: begin
              resp_header[`MSG_TYPE    ]     <= `MSG_TYPE_LOAD_MEM_ACK;
              resp_header[`MSG_LENGTH  ]     <= `PAYLOAD_LEN; 
            end
            `MSG_TYPE_STORE_MEM: begin
              resp_header[`MSG_TYPE    ]     <= `MSG_TYPE_STORE_MEM_ACK;
              resp_header[`MSG_LENGTH  ]     <= 0;
            end
            `MSG_TYPE_NC_LOAD_REQ: begin
              resp_header[`MSG_TYPE    ]     <= `MSG_TYPE_NC_LOAD_MEM_ACK;
              resp_header[`MSG_LENGTH  ]     <= `PAYLOAD_LEN; 
            end
            `MSG_TYPE_NC_STORE_REQ: begin
              resp_header[`MSG_TYPE    ]     <= `MSG_TYPE_NC_STORE_MEM_ACK;
              resp_header[`MSG_LENGTH  ]     <= 0;
            end
            default: begin
              // shouldn't end up herere
              resp_header[`MSG_TYPE    ]     <= `MSG_TYPE_WIDTH'b0;
              resp_header[`MSG_LENGTH  ]     <= 0;
            end
          endcase // header_in[`MSG_TYPE]
        end
        else begin
          resp_header <= resp_header;
        end
      end
      SEND_HEADER: begin
        if (flit_out_go) begin
          resp_header <= `NOC_DATA_WIDTH'b0;
        end
        else begin
          resp_header <= resp_header;
        end
      end
      SEND_DATA: begin
        resp_header <= resp_header;
      end
      default: begin
        //shouldnt end up here
        resp_header <= `NOC_DATA_WIDTH'b0;
      end
    endcase //state
  end
end

always @(*) begin
  case (state)
    ACCEPT: begin
      flit_out = `NOC_DATA_WIDTH'b0;
    end
    SEND_HEADER: begin
      flit_out = resp_header;
    end
    SEND_DATA: begin
      flit_out = data_in_f >> (64 * (`PAYLOAD_LEN - remaining_flits));
    end
    default: begin
      flit_out = `NOC_DATA_WIDTH'b0;
    end
  endcase // state

end
endmodule
