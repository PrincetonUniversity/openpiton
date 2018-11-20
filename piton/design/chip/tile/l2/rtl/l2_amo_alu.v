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

module l2_amo_alu (
input      [`L2_AMO_ALU_OP_WIDTH-1:0] amo_alu_op,
input      [`PHY_ADDR_WIDTH-1:0]      address,
input      [`MSG_DATA_SIZE_WIDTH-1:0] data_size,
input      [`L2_DATA_DATA_WIDTH-1:0]  memory_operand,
input      [`L2_DATA_DATA_WIDTH-1:0]  cpu_operand,
output reg [`L2_DATA_DATA_WIDTH-1:0]  amo_result
);

reg [63:0] operand_a_64b;
reg [31:0] operand_a_32b;
reg [15:0] operand_a_16b;
reg  [7:0] operand_a_8b;

reg [63:0] operand_b_64b;
reg [31:0] operand_b_32b;
reg [15:0] operand_b_16b;
reg  [7:0] operand_b_8b;

reg [63:0] result_64b;
reg [31:0] result_32b;
reg [15:0] result_16b;
reg  [7:0] result_8b;

reg [63:0] adder_operand_a_64b;
reg [31:0] adder_operand_a_32b;
reg [15:0] adder_operand_a_16b;
reg  [7:0] adder_operand_a_8b;

reg [63:0] adder_operand_b_64b;
reg [31:0] adder_operand_b_32b;
reg [15:0] adder_operand_b_16b;
reg  [7:0] adder_operand_b_8b;

wire [64:0] adder_sum_65b; // Note 1b bigger
wire [32:0] adder_sum_33b; // Note 1b bigger
wire [16:0] adder_sum_17b; // Note 1b bigger
wire  [8:0] adder_sum_9b;  // Note 1b bigger

wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_upper_64b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_lower_64b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_upper_32b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_lower_32b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_upper_16b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_lower_16b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_upper_8b;
wire [`L2_DATA_DATA_WIDTH_LOG2-1:0] address_index_lower_8b;

assign adder_sum_65b = adder_operand_a_64b + adder_operand_b_64b;
assign adder_sum_33b = adder_operand_a_32b + adder_operand_b_32b;
assign adder_sum_17b = adder_operand_a_16b + adder_operand_b_16b;
assign adder_sum_9b  = adder_operand_a_8b  + adder_operand_b_8b;

assign address_index_upper_64b = {~address[`L2_DATA_DATA_WIDTH_LOG2-1], {6{1'b1}}};
assign address_index_upper_32b = {~address[`L2_DATA_DATA_WIDTH_LOG2-1], address[`L2_DATA_DATA_WIDTH_LOG2-2:5], {5{1'b1}}};
assign address_index_upper_16b = {~address[`L2_DATA_DATA_WIDTH_LOG2-1], address[`L2_DATA_DATA_WIDTH_LOG2-2:4], {4{1'b1}}};
assign address_index_upper_8b = {~address[`L2_DATA_DATA_WIDTH_LOG2-1], address[`L2_DATA_DATA_WIDTH_LOG2-2:3], {3{1'b1}}};

always @*
begin
    operand_a_64b = memory_operand[address_index_upper_64b-:64];
    operand_b_64b = cpu_operand[address_index_upper_64b-:64];
    
    operand_a_32b = memory_operand[address_index_upper_32b-:32];
    operand_b_32b = cpu_operand[address_index_upper_32b-:32];
    
    operand_a_16b = memory_operand[address_index_upper_16b-:16];
    operand_b_16b = cpu_operand[address_index_upper_16b-:16];
    
    operand_a_8b = memory_operand[address_index_upper_8b-:8];
    operand_b_8b = cpu_operand[address_index_upper_8b-:8];
end

always @*
begin
    adder_operand_a_64b = $signed(operand_a_64b);
    adder_operand_a_32b = $signed(operand_a_32b);
    adder_operand_a_16b = $signed(operand_a_16b);
    adder_operand_a_8b  = $signed(operand_a_8b);

    adder_operand_b_64b = $signed(operand_b_64b);
    adder_operand_b_32b = $signed(operand_b_32b);
    adder_operand_b_16b = $signed(operand_b_16b);
    adder_operand_b_8b  = $signed(operand_b_8b);

    case (amo_alu_op)
        `L2_AMO_ALU_NOP:
        begin
            result_64b = {64{1'b0}};
            result_32b = {32{1'b0}};
            result_16b = {16{1'b0}};
            result_8b  = {8{1'b0}};
        end
        `L2_AMO_ALU_ADD:
        begin
            result_64b = adder_sum_65b[63:0];   
            result_32b = adder_sum_33b[31:0];   
            result_16b = adder_sum_17b[15:0];   
            result_8b  = adder_sum_9b[7:0];   
        end
        `L2_AMO_ALU_AND:
        begin
            result_64b = operand_a_64b & operand_b_64b;
            result_32b = operand_a_32b & operand_b_32b;
            result_16b = operand_a_16b & operand_b_16b;
            result_8b  = operand_a_8b  & operand_b_8b;
        end
        `L2_AMO_ALU_OR:
        begin
            result_64b = operand_a_64b | operand_b_64b;
            result_32b = operand_a_32b | operand_b_32b;
            result_16b = operand_a_16b | operand_b_16b;
            result_8b  = operand_a_8b  | operand_b_8b;
        end
        `L2_AMO_ALU_XOR:
        begin
            result_64b = operand_a_64b ^ operand_b_64b;
            result_32b = operand_a_32b ^ operand_b_32b;
            result_16b = operand_a_16b ^ operand_b_16b;
            result_8b  = operand_a_8b  ^ operand_b_8b;
        end
        `L2_AMO_ALU_MAX:
        begin
            adder_operand_b_64b = -$signed(operand_b_64b);
            adder_operand_b_32b = -$signed(operand_b_32b);
            adder_operand_b_16b = -$signed(operand_b_16b);
            adder_operand_b_8b  = -$signed(operand_b_8b);

            result_64b = adder_sum_65b[64] ? operand_b_64b : operand_a_64b;
            result_32b = adder_sum_33b[32] ? operand_b_32b : operand_a_32b;
            result_16b = adder_sum_17b[16] ? operand_b_16b : operand_a_16b;
            result_8b  = adder_sum_9b[8]  ? operand_b_8b  : operand_a_8b;
        end
        `L2_AMO_ALU_MAXU:
        begin
            adder_operand_a_64b = $unsigned(operand_a_64b);
            adder_operand_a_32b = $unsigned(operand_a_32b);
            adder_operand_a_16b = $unsigned(operand_a_16b);
            adder_operand_a_8b  = $unsigned(operand_a_8b);

            adder_operand_b_64b = -$unsigned(operand_b_64b);
            adder_operand_b_32b = -$unsigned(operand_b_32b);
            adder_operand_b_16b = -$unsigned(operand_b_16b);
            adder_operand_b_8b  = -$unsigned(operand_b_8b);

            result_64b = adder_sum_65b[64] ? operand_b_64b : operand_a_64b;
            result_32b = adder_sum_33b[32] ? operand_b_32b : operand_a_32b;
            result_16b = adder_sum_17b[16] ? operand_b_16b : operand_a_16b;
            result_8b  = adder_sum_9b[8]  ? operand_b_8b  : operand_a_8b;
        end
        `L2_AMO_ALU_MIN:
        begin
            adder_operand_b_64b = -$signed(operand_b_64b);
            adder_operand_b_32b = -$signed(operand_b_32b);
            adder_operand_b_16b = -$signed(operand_b_16b);
            adder_operand_b_8b  = -$signed(operand_b_8b);

            result_64b = adder_sum_65b[64] ? operand_a_64b : operand_b_64b;
            result_32b = adder_sum_33b[32] ? operand_a_32b : operand_b_32b;
            result_16b = adder_sum_17b[16] ? operand_a_16b : operand_b_16b;
            result_8b  = adder_sum_9b[8]  ? operand_a_8b  : operand_b_8b;
        end
        `L2_AMO_ALU_MINU:
        begin
            adder_operand_a_64b = $unsigned(operand_a_64b);
            adder_operand_a_32b = $unsigned(operand_a_32b);
            adder_operand_a_16b = $unsigned(operand_a_16b);
            adder_operand_a_8b  = $unsigned(operand_a_8b);

            adder_operand_b_64b = -$unsigned(operand_b_64b);
            adder_operand_b_32b = -$unsigned(operand_b_32b);
            adder_operand_b_16b = -$unsigned(operand_b_16b);
            adder_operand_b_8b  = -$unsigned(operand_b_8b);

            result_64b = adder_sum_65b[64] ? operand_a_64b : operand_b_64b;
            result_32b = adder_sum_33b[32] ? operand_a_32b : operand_b_32b;
            result_16b = adder_sum_17b[16] ? operand_a_16b : operand_b_16b;
            result_8b  = adder_sum_9b[8]  ? operand_a_8b  : operand_b_8b;
        end
        default:
        begin
            result_64b = {64{1'bX}};
            result_32b = {32{1'bX}};
            result_16b = {16{1'bX}};
            result_8b  = {8{1'bX}};
        end
    endcase
end

always @*
begin
    amo_result = memory_operand;

    case (data_size)
        `MSG_DATA_SIZE_1B:
        begin
            amo_result[address_index_upper_8b-:8] = result_8b;
        end
        `MSG_DATA_SIZE_2B:
        begin
            amo_result[address_index_upper_16b-:16] = result_16b;
        end
        `MSG_DATA_SIZE_4B:
        begin
            amo_result[address_index_upper_32b-:32] = result_32b;
        end
        `MSG_DATA_SIZE_8B:
        begin
            amo_result[address_index_upper_64b-:64] = result_64b;
        end
        default:
        begin
            amo_result = {`L2_DATA_DATA_WIDTH{1'bX}};
        end
    endcase
end

endmodule
