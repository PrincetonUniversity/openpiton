// Copyright (c) 2016 Princeton University
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

module bram_2p_model #(
    parameter DATA_WIDTH=64,
    parameter DEPTH=16
)(
    input                           clka,
    input                           ena,
    input                           wea,
    input   [clogb2(DEPTH)-1:0]     addra,
    input   [DATA_WIDTH-1:0]        dina,

    input                           clkb,
    input                           enb,
    input   [clogb2(DEPTH)-1:0]     addrb,
    output  reg [DATA_WIDTH-1:0]    doutb  
);

localparam ADDR_WIDTH = clogb2(DEPTH);

genvar i;

reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];

generate
    for (i = 0; i < DEPTH; i = i+1) begin: mem_gen
        always @(posedge clka)
            mem[i] <= ena & (i == addra) ? dina : mem[i];
    end    
endgenerate

always @(posedge clkb) begin
    doutb <= enb ? mem[addrb] : doutb;
end

//------------------------------------------------
function integer clogb2;
  input [31:0] value;
  begin
    value = value - 1;
    for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1) begin
      value = value >> 1;
    end
  end
endfunction


endmodule   
