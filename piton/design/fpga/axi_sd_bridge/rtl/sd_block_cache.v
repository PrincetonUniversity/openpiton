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

//==================================================================================================
//  Filename      : sd_block_cache.v
//  Created On    : 2015-04-20
//  Last Modified : 2016-01-26 16:46:21
//  Revision      :
//  Author        : Matthew Matl
//  Company       : Princeton University
//  Email         : mmatl@princeton.edu
//
//  Description   : Handles caching SD blocks.
//==================================================================================================

module sd_block_cache
#(
    parameter EADDR_WIDTH = 2,
    parameter ENTRY_COUNT = (2**EADDR_WIDTH),
    parameter CACHE_DEPTH = (64*ENTRY_COUNT),
    parameter CADDR_WIDTH = 6,
    parameter CDATA_WIDTH = (2**CADDR_WIDTH)
)(
    // Clock + Reset
    input  wire                   clk,

    input  wire [EADDR_WIDTH-1:0] r_entry,
    input  wire [CADDR_WIDTH-1:0] r_addr,

    output reg  [CDATA_WIDTH-1:0] r_data,

    input  wire                   w_en,
    input  wire [EADDR_WIDTH-1:0] w_entry,
    input  wire [CADDR_WIDTH-1:0] w_addr,
    input  wire [CDATA_WIDTH-1:0] w_data
);

    localparam TADDR_WIDTH = EADDR_WIDTH + CADDR_WIDTH;

    reg [CDATA_WIDTH-1:0] blocks [CACHE_DEPTH-1:0];

    wire [TADDR_WIDTH-1:0] true_r_addr = ({6'd0, r_entry} << 6) + r_addr;
    wire [TADDR_WIDTH-1:0] true_w_addr = ({6'd0, w_entry} << 6) + w_addr;

    always @(posedge clk)
    begin
        r_data <= blocks[true_r_addr];
    end

    always @(posedge clk)
    begin
        if (w_en == 1'b1)
        begin
            blocks[true_w_addr] <= w_data;
        end
    end


endmodule
