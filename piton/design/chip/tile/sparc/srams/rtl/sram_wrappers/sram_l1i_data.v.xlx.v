// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

// 17/02/2015 17:18:31
// This file is auto-generated
// Author: Tri Nguyen
`include "define.vh"
`include "ifu.tmp.h"
`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif
module sram_l1i_data
(
input wire MEMCLK,
input wire RESET_N,
input wire CE,
input wire [`IC_SET_IDX_HI+1:0] A,
input wire RDWEN,
input wire [271:0] BW,  // magic number?
input wire [271:0] DIN,
output wire [271:0] DOUT,

input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
input wire [`BIST_ID_WIDTH-1:0] SRAMID
);

always @*
   BIST_DOUT = {`SRAM_WRAPPER_BUS_WIDTH{1'b0}};

bram_sdp_wrapper #(
   .NAME          ("l1i_data"          ),
   .DEPTH         (`IC_SET_COUNT*2     ),
   .ADDR_WIDTH    (`IC_SET_IDX_HI+2    ),
   .BITMASK_WIDTH (272                 ),
   .DATA_WIDTH    (272                 )
)   bram_wrapper (
   .MEMCLK        (MEMCLK     ),
   .CE            (CE         ),
   .A             (A          ),
   .RDWEN         (RDWEN      ),
   .BW            (BW         ),
   .DIN           (DIN        ),
   .DOUT          (DOUT       )
);

endmodule
