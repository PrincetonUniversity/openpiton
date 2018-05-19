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
reg io_clk;

initial begin
   fid = $fopen("stimuli.txt","w");
   clk_start = 1'b0;
   core_ref_clk = 1'b0;
   forever #500 core_ref_clk = ~core_ref_clk;
end


wire [169:0] input_vector = {
    cmp_top.chip.tile0.l2.rst_n,
    cmp_top.chip.tile0.l2.chipid,
    cmp_top.chip.tile0.l2.coreid_x,
    cmp_top.chip.tile0.l2.coreid_y,
    cmp_top.chip.tile0.l2.noc1_valid_in,
    cmp_top.chip.tile0.l2.noc1_data_in,
    cmp_top.chip.tile0.l2.noc3_valid_in,
    cmp_top.chip.tile0.l2.noc3_data_in,
    cmp_top.chip.tile0.l2.noc2_ready_out,
    cmp_top.chip.tile0.l2.rtap_srams_bist_command,
    cmp_top.chip.tile0.l2.rtap_srams_bist_data
};

wire [70:0] output_vector = {
    cmp_top.chip.tile0.l2.noc1_ready_in,
    cmp_top.chip.tile0.l2.noc3_ready_in,
    cmp_top.chip.tile0.l2.noc2_valid_out,
    cmp_top.chip.tile0.l2.noc2_data_out,
    cmp_top.chip.tile0.l2.srams_rtap_data
};

wire clock_vector = cmp_top.chip.tile0.l2.clk;

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


