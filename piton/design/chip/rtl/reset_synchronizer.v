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

//==================================================================================================
//  Filename      : reset_synchronizer.v
//  Created On    :
//  Last Modified :
//  Revision      :
//  Author        : Michael Schaffner
//  Company       : ETH Zurich
//  Email         : schaffner@iis.ee.ethz.ch
//
//  Description   : Reset synchronizer with parameterizable amount of regs.
//==================================================================================================

module reset_synchronizer #(
    parameter NUM_REGS = 2
) (
  input  clk_i,
  input  rst_ni,
  output rst_no  // synchronized reset
);

  reg [NUM_REGS-1:0] synch_regs_q;

  always @(posedge clk_i or negedge rst_ni) begin : p_regs
    if(~rst_ni) begin
      synch_regs_q <= 0;
    end else begin
      synch_regs_q <= {synch_regs_q[NUM_REGS-2:0], 1'b1};
    end
  end

  assign rst_no = synch_regs_q[NUM_REGS-1];

  initial begin : p_assertions
      if (NUM_REGS < 1) $fatal(1, "At least one register is required.");
  end

endmodule // reset_synchronizer
