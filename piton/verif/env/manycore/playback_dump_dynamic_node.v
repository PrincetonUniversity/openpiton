// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: playback_dump.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
`include "sys.h"

module playback_dump();

integer fid;
reg clk_start;
reg core_ref_clk;

initial begin
   fid = $fopen("stimuli.txt","w");
   clk_start = 1'b0;
   core_ref_clk = 1'b0;
   forever #500 core_ref_clk = ~core_ref_clk;
end


wire [360:0] input_vector = {
    cmp_top.chip.tile0.user_dynamic_network0.reset_in,
    cmp_top.chip.tile0.user_dynamic_network0.dataIn_N,
    cmp_top.chip.tile0.user_dynamic_network0.dataIn_E,
    cmp_top.chip.tile0.user_dynamic_network0.dataIn_S,
    cmp_top.chip.tile0.user_dynamic_network0.dataIn_W,
    cmp_top.chip.tile0.user_dynamic_network0.dataIn_P,
    cmp_top.chip.tile0.user_dynamic_network0.validIn_N,
    cmp_top.chip.tile0.user_dynamic_network0.validIn_E,
    cmp_top.chip.tile0.user_dynamic_network0.validIn_S,
    cmp_top.chip.tile0.user_dynamic_network0.validIn_W,
    cmp_top.chip.tile0.user_dynamic_network0.validIn_P,
    cmp_top.chip.tile0.user_dynamic_network0.yummyIn_N,
    cmp_top.chip.tile0.user_dynamic_network0.yummyIn_E,
    cmp_top.chip.tile0.user_dynamic_network0.yummyIn_S,
    cmp_top.chip.tile0.user_dynamic_network0.yummyIn_W,
    cmp_top.chip.tile0.user_dynamic_network0.yummyIn_P,
    cmp_top.chip.tile0.user_dynamic_network0.myLocX,
    cmp_top.chip.tile0.user_dynamic_network0.myLocY,
    cmp_top.chip.tile0.user_dynamic_network0.myChipID
};

wire [330:0] output_vector = {
    cmp_top.chip.tile0.user_dynamic_network0.dataOut_N,
    cmp_top.chip.tile0.user_dynamic_network0.dataOut_E,
    cmp_top.chip.tile0.user_dynamic_network0.dataOut_S,
    cmp_top.chip.tile0.user_dynamic_network0.dataOut_W,
    cmp_top.chip.tile0.user_dynamic_network0.dataOut_P,
    cmp_top.chip.tile0.user_dynamic_network0.validOut_N,
    cmp_top.chip.tile0.user_dynamic_network0.validOut_E,
    cmp_top.chip.tile0.user_dynamic_network0.validOut_S,
    cmp_top.chip.tile0.user_dynamic_network0.validOut_W,
    cmp_top.chip.tile0.user_dynamic_network0.validOut_P,
    cmp_top.chip.tile0.user_dynamic_network0.yummyOut_N,
    cmp_top.chip.tile0.user_dynamic_network0.yummyOut_E,
    cmp_top.chip.tile0.user_dynamic_network0.yummyOut_S,
    cmp_top.chip.tile0.user_dynamic_network0.yummyOut_W,
    cmp_top.chip.tile0.user_dynamic_network0.yummyOut_P,
    cmp_top.chip.tile0.user_dynamic_network0.thanksIn_P
};


wire clock_vector = cmp_top.chip.tile0.user_dynamic_network0.clk;

always @(posedge core_ref_clk) begin
  if(~clk_start) begin
    $fdisplay(fid, "%b\n%b\n", input_vector, output_vector);
  end
end

always @(posedge clock_vector) begin
  clk_start = 1'b1;
  $fdisplay(fid, "%b\n%b\n", input_vector, output_vector);
end

endmodule


