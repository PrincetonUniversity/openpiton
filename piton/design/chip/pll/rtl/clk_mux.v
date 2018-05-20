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

//
// Author: mmckeown
// Description: Muxes 3 clocks.  Takes two differential and
//              one single ended clock and multiplexes to a
//              single ended clock.
// Date created: 5/11/2017
//

module clk_mux (
    input       clk0_p,
    input       clk0_n,
    input       clk1_p,
    input       clk1_n,
    input       clk2,

    input [1:0] sel,

    output      clk_muxed
);

// Clock mux not used in fpga and
// simulation fake clk mux.  Anything
// that uses the differential clock
// should assume only the positive
// signal is valid in this case.  
// Also, since the clock mux is not used
// in fpga and simulation we just statically
// assign clk0 to output
`ifdef PITON_FPGA_SYNTH
assign clk_muxed = clk0_p;
`elsif USE_FAKE_PLL_AND_CLKMUX
assign clk_muxed = clk0_p;
`else
// PUT REAL CLOCK MUX FOR SYNTHESIS AND BACKEND HERE
// BELOW IS A DUMMY SO FUNCTIONALITY IS MAINTAINED
assign clk_muxed = clk0_p;
`endif

endmodule
