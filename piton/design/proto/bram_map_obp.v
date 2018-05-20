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

//-----------------------------------------
// Auto generated mapping module
// It is provided for test: uart-hello-world.s 
//-----------------------------------------
 module bram_map_obp #(parameter MEM_ADDR_WIDTH=64, PHY_ADDR_WIDTH=40, BRAM_ADDR_WIDTH=12)
(
    input       [PHY_ADDR_WIDTH-1:0]    msg_addr,
    
    output      [BRAM_ADDR_WIDTH-1:0]   bram_blk_addr,
    output                              hit_any_section
);

wire [63:0]                      bram_addr_0;
wire [63:0]                      bram_addr_1;

wire                            in_section_0;
wire                            in_section_1;


assign bram_addr_0 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'hfff0000000) >> 6) + 0;
assign bram_addr_1 = (({{(MEM_ADDR_WIDTH-PHY_ADDR_WIDTH){1'b0}}, msg_addr} - 64'h0000000000) >> 6) + 16384;

assign in_section_0 = (msg_addr >= 64'hfff0000000) & (msg_addr < 64'hfff0100000);
assign in_section_1 = (msg_addr >= 64'h0000000000) & (msg_addr < 64'h0000300000);

assign bram_blk_addr = ({BRAM_ADDR_WIDTH{in_section_0}} & bram_addr_0[BRAM_ADDR_WIDTH-1:0]) |
                       ({BRAM_ADDR_WIDTH{in_section_1}} & bram_addr_1[BRAM_ADDR_WIDTH-1:0]) ;


assign hit_any_section = in_section_0 | in_section_1;

endmodule
