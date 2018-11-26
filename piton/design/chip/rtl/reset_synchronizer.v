// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Michael Schaffner <schaffner@iis.ee.ethz.ch>, ETH Zurich
// Date: 15.08.2018
// Description: Reset synchronizer with parameterizable amount of regs.

module reset_synchronizer #(
    parameter NUM_REGS = 1
) (
  input  clk_i,
  input  rst_ni,
  input  tmode_i, // bypasses the reset synchronizer
  output rst_no   // synchronized reset
);

  reg [NUM_REGS-1:0] synch_regs_q;

  always @(posedge clk_i or negedge rst_ni) begin : p_regs
    if(~rst_ni) begin
      synch_regs_q <= 0;
    end else begin
      synch_regs_q <= {synch_regs_q[NUM_REGS-1:0], 1'b1};
    end
  end

  assign rst_no = (tmode_i) ? rst_ni :
                              synch_regs_q[NUM_REGS-1];

  initial begin : p_assertions
      if (NUM_REGS < 1) $fatal(1, "At least one register is required.");
  end

endmodule // reset_synchronizer
