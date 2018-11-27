/*
Copyright (c) 2018 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
`include "l2.tmp.h"

module l2_amo_alu #(
  parameter SWAP_ENDIANESS = 1
) (
  input      [`L2_AMO_ALU_OP_WIDTH-1:0] amo_alu_op,
  input      [`PHY_ADDR_WIDTH-1:0]      address,
  input      [`MSG_DATA_SIZE_WIDTH-1:0] data_size,
  input      [`L2_DATA_DATA_WIDTH-1:0]  memory_operand,
  input      [`L2_DATA_DATA_WIDTH-1:0]  cpu_operand,
  output reg [`L2_DATA_DATA_WIDTH-1:0]  amo_result
);

wire [63:0] amo_operand_a_mux, amo_operand_b_mux;
wire [63:0] amo_operand_a_swp, amo_operand_b_swp;
reg  [63:0] amo_operand_a, amo_operand_b;
reg  [63:0] amo_64b_tmp, amo_64b_result;
reg  [64:0] adder_operand_a, adder_operand_b;
wire [64:0] adder_sum;

// note: the L2_DATA_DATA_WIDTH_LOG2 is calculated for a bit width
// so we have to subtract 6 from it in order to get the a dword index
wire [`L2_DATA_DATA_WIDTH_LOG2-7:0] dword_offset;


// select dword to operate on
assign dword_offset      = address[`L2_DATA_DATA_WIDTH_LOG2-4:3];
assign amo_operand_a_mux = memory_operand[dword_offset*64 +: 64];
assign amo_operand_b_mux = cpu_operand[dword_offset*64 +: 64];

// endianess swap (if needed)
generate
  if (SWAP_ENDIANESS) begin : g_swap_in
    assign amo_operand_a_swp = {amo_operand_a_mux[ 0 +:8],
                                amo_operand_a_mux[ 8 +:8],
                                amo_operand_a_mux[16 +:8],
                                amo_operand_a_mux[24 +:8],
                                amo_operand_a_mux[32 +:8],
                                amo_operand_a_mux[40 +:8],
                                amo_operand_a_mux[48 +:8],
                                amo_operand_a_mux[56 +:8]};

    assign amo_operand_b_swp = {amo_operand_b_mux[ 0 +:8],
                                amo_operand_b_mux[ 8 +:8],
                                amo_operand_b_mux[16 +:8],
                                amo_operand_b_mux[24 +:8],
                                amo_operand_b_mux[32 +:8],
                                amo_operand_b_mux[40 +:8],
                                amo_operand_b_mux[48 +:8],
                                amo_operand_b_mux[56 +:8]};
  end else begin : g_swap_in
    assign amo_operand_a_swp = amo_operand_a_mux;
    assign amo_operand_b_swp = amo_operand_b_mux;
  end
endgenerate

// operand word/byte select
always @* begin
  amo_operand_a = 64'h0;
  amo_operand_b = 64'h0;

  case (data_size)
    `MSG_DATA_SIZE_1B: begin
      amo_operand_a[56 +: 8]     = amo_operand_a_swp[address[2:0]*8 +: 8];
      amo_operand_b[56 +: 8]     = amo_operand_b_swp[address[2:0]*8 +: 8];
    end
    `MSG_DATA_SIZE_2B: begin
        amo_operand_a[48 +: 16]  = amo_operand_a_swp[address[2:1]*16 +: 16];
        amo_operand_b[48 +: 16]  = amo_operand_b_swp[address[2:1]*16 +: 16];
     end
    `MSG_DATA_SIZE_4B: begin
        amo_operand_a[32 +: 32]  = amo_operand_a_swp[address[2:2]*32 +: 32];
        amo_operand_b[32 +: 32]  = amo_operand_b_swp[address[2:2]*32 +: 32];
    end
    `MSG_DATA_SIZE_8B: begin
        amo_operand_a  = amo_operand_a_swp;
        amo_operand_b  = amo_operand_b_swp;
    end
    default: ;
  endcase // data_size
end


// main ALU
assign adder_sum     = adder_operand_a + adder_operand_b;

always @*
begin
    adder_operand_a = $signed(amo_operand_a);
    adder_operand_b = $signed(amo_operand_b);

    amo_64b_tmp     = amo_operand_a;

    case (amo_alu_op)
        `L2_AMO_ALU_NOP: ;
        `L2_AMO_ALU_ADD: amo_64b_tmp = adder_sum[63:0];
        `L2_AMO_ALU_AND: amo_64b_tmp = amo_operand_a & amo_operand_b;
        `L2_AMO_ALU_OR:  amo_64b_tmp = amo_operand_a | amo_operand_b;
        `L2_AMO_ALU_XOR: amo_64b_tmp = amo_operand_a ^ amo_operand_b;
        `L2_AMO_ALU_MAX: begin
            adder_operand_b = -$signed(amo_operand_b);
            amo_64b_tmp = adder_sum[64] ? amo_operand_b : amo_operand_a;
        end
        `L2_AMO_ALU_MAXU: begin
            adder_operand_a = $unsigned(amo_operand_a);
            adder_operand_b = -$unsigned(amo_operand_b);
            amo_64b_tmp = adder_sum[64] ? amo_operand_b : amo_operand_a;
        end
        `L2_AMO_ALU_MIN: begin
            adder_operand_b = -$signed(amo_operand_b);
            amo_64b_tmp = adder_sum[64] ? amo_operand_a : amo_operand_b;
        end
        `L2_AMO_ALU_MINU: begin
            adder_operand_a = $unsigned(amo_operand_a);
            adder_operand_b = -$unsigned(amo_operand_b);
            amo_64b_tmp = adder_sum[64] ? amo_operand_a : amo_operand_b;
        end
        default: ;
    endcase
end


// operand select and endianess swap
always @* begin
  // first read-modify-write 64bit word
  amo_64b_result = amo_operand_a_swp;
  case (data_size)
    `MSG_DATA_SIZE_1B: begin
      amo_64b_result[address[2:0]*8 +: 8]     = amo_64b_tmp[56 +: 8];
    end
    `MSG_DATA_SIZE_2B: begin
        amo_64b_result[address[2:1]*16 +: 16]  = amo_64b_tmp[48 +: 16];
     end
    `MSG_DATA_SIZE_4B: begin
        amo_64b_result[address[2:2]*32 +: 32]  = amo_64b_tmp[32 +: 32];
    end
    `MSG_DATA_SIZE_8B: begin
        amo_64b_result  = amo_64b_tmp;
    end
    default: ;
  endcase // data_size

  // merge back into memory line
  amo_result     = memory_operand;
  if (SWAP_ENDIANESS) begin
    amo_result[dword_offset*64 +: 64] = {amo_64b_result[ 0 +:8],
                                         amo_64b_result[ 8 +:8],
                                         amo_64b_result[16 +:8],
                                         amo_64b_result[24 +:8],
                                         amo_64b_result[32 +:8],
                                         amo_64b_result[40 +:8],
                                         amo_64b_result[48 +:8],
                                         amo_64b_result[56 +:8]};
  end else begin
    amo_result[dword_offset*64 +: 64] = amo_64b_result;
  end
end

endmodule
