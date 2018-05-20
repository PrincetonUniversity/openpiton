// Copyright (c) 2017 Princeton University
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
 
 /////////////////////////////////////////////////////////// //
 // 
 // Yanqi Zhou
 // pll_top.v 
 //
 // Date Generated Fri 10/3/2014
 //
 // mmckeown modified on 5/11/17
 //

`ifdef IBM_VLOG_2ps
 `timescale 1 ns / 1 ps
`else
 `timescale 1 ns / 10 ps
`endif

 module pll_top ( 
   output clk_locked,
   output clk_out,

   input ref_clk,
   input rst,
   input bypass_en,
   input [4:0] rangeA
);

`ifdef PITON_FPGA_SYNTH

// FPGA version, just bypass the clock
// with dumb lock signal
assign clk_out = ref_clk;
assign clk_locked = ~rst;

`elsif USE_FAKE_PLL_AND_CLKMUX

// Non synthesizeable simulation PLL
fake_pll pll (
    .clk_locked(clk_locked),
    .clk_out(clk_out),
    .ref_clk(ref_clk),
    .rst(rst)
);

`else

// PUT REAL PLL HERE FOR SYNTHESIS AND BACKEND
// BELOW IS A DUMMY SO FUNCTIONALITY IS MAINTAINED
assign clk_out = ref_clk;
assign clk_locked = ~rst;

`endif

endmodule
