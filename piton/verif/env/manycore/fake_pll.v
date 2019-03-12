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
// Description: Fake PLL to use for simulation
// Date created: 5/11/2017
//

module fake_pll (
    output  clk_locked,
    output  clk_out,

    input   ref_clk,
    input   rst
);

reg [6:0] counter;

// Bypass clock
assign clk_out = ref_clk;

// Non-synthesizeable locked logic
// Starts out as 0 and changes to 1 100 ref_clk
// cycles after falling edge of reset (deasserting reset)
`ifndef VERILATOR
initial
begin
    force clk_locked = 1'b0;
    wait (rst == 1'b1);
    wait (rst == 1'b0);
    repeat(100)@(posedge ref_clk);
    force clk_locked = 1'b1;
end
`else
always @(posedge ref_clk)
begin
    if (rst)
    begin
        counter = 7'd0;
    end
    else if (counter < 7'd100)
    begin
        counter = counter + 1'b1;
    end
end

assign clk_locked = counter == 7'd100;
`endif

endmodule
