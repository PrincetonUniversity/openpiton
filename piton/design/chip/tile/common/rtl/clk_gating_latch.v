/*
Copyright (c) 2015 Princeton University
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

//==================================================================================================
//  Filename      : clk_gating_latch.v
//  Created On    : 2015-01-26 14:10:43
//  Last Modified : 2019-03-15 16:24:53
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : Latch for glitchless clock gating
//==================================================================================================

module clk_gating_latch (
    input wire clk,
    input wire clk_en,
    output wire clk_out
);

// use clock buffer on FPGA
// note that not all FPGAs have enough of these available
// so we use the latch as a fallback on certain boards (e.g., vc707)
`ifdef PITON_CLK_GATE_USE_BUFG

  wire clk_en_sync;
  reg clk_en_sync_reg;

  synchronizer sync(
      .clk            (clk),
      .presyncdata    (clk_en),
      .syncdata       (clk_en_sync)
  );

  // clk_en_sync_reg changes only on the negative edge of clk
  always @ (negedge clk)
    clk_en_sync_reg = clk_en_sync;

  BUFGCE #(
    .CE_TYPE        ( "ASYNC" ),
    .IS_CE_INVERTED ( 1'b0   ),
    .IS_I_INVERTED  ( 1'b0   )
  ) BUFGCE_inst (
    .I  ( clk              ),
    .CE ( clk_en_sync_reg  ),
    .O  ( clk_out          )
  );

`else // PITON_FPGA_SYNTH

  wire clk_en_sync;
  reg clk_en_sync_latch;

  assign clk_out = clk & clk_en_sync_latch;

  synchronizer sync(
      .clk            (clk),
      .presyncdata    (clk_en),
      .syncdata       (clk_en_sync)
  );

  // clk_en_sync_latch changes only on the negative duty of the cycle
  always @ (clk or clk_en_sync)
      if (~clk) clk_en_sync_latch = clk_en_sync;
`endif


endmodule // clk_gating_latch
