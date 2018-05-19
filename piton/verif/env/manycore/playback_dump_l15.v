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


wire [356:0] input_vector = {
    cmp_top.chip.tile0.l15.rst_n,
    cmp_top.chip.tile0.l15.pcx_req_0,
    cmp_top.chip.tile0.l15.pcx_atomic_req,
    cmp_top.chip.tile0.l15.pcx_data_123_117,
    cmp_top.chip.tile0.l15.pcx_data_112_0,
    cmp_top.chip.tile0.l15.pcx_csm,
    cmp_top.chip.tile0.l15.noc1_out_rdy,
    cmp_top.chip.tile0.l15.noc2_in_val,
    cmp_top.chip.tile0.l15.noc2_in_data,
    cmp_top.chip.tile0.l15.noc3_out_rdy,
    cmp_top.chip.tile0.l15.dmbr_l15_stall,
    cmp_top.chip.tile0.l15.chipid,
    cmp_top.chip.tile0.l15.coreid_x,
    cmp_top.chip.tile0.l15.coreid_y,
    cmp_top.chip.tile0.l15.config_l15_read_res_data_s3,
    cmp_top.chip.tile0.l15.config_csm_en,
    cmp_top.chip.tile0.l15.config_system_tile_count_5_0,
    cmp_top.chip.tile0.l15.config_home_alloc_method,
    cmp_top.chip.tile0.l15.config_hmt_base,
    cmp_top.chip.tile0.l15.rtap_srams_bist_command,
    cmp_top.chip.tile0.l15.rtap_srams_bist_data
};

wire [370:0] output_vector = {
    cmp_top.chip.tile0.l15.pcx_grant,
    cmp_top.chip.tile0.l15.cpx_data_ready,
    cmp_top.chip.tile0.l15.cpx_data,
    cmp_top.chip.tile0.l15.noc1_out_val,
    cmp_top.chip.tile0.l15.noc1_out_data,
    cmp_top.chip.tile0.l15.noc2_in_rdy,
    cmp_top.chip.tile0.l15.noc3_out_val,
    cmp_top.chip.tile0.l15.noc3_out_data,
    cmp_top.chip.tile0.l15.l15_dmbr_l1missIn,
    cmp_top.chip.tile0.l15.l15_dmbr_l1missTag,
    cmp_top.chip.tile0.l15.l15_dmbr_l2responseIn,
    cmp_top.chip.tile0.l15.l15_dmbr_l2missIn,
    cmp_top.chip.tile0.l15.l15_dmbr_l2missTag,
    cmp_top.chip.tile0.l15.l15_config_req_val_s2,
    cmp_top.chip.tile0.l15.l15_config_req_rw_s2,
    cmp_top.chip.tile0.l15.l15_config_write_req_data_s2,
    cmp_top.chip.tile0.l15.l15_config_req_address_s2,
    cmp_top.chip.tile0.l15.srams_rtap_data
};

wire clock_vector = cmp_top.chip.tile0.l15.clk;

always @(posedge core_ref_clk) begin
  if(~clk_start) begin
    $fdisplay(fid, "%b\n%b\n", {1'b0,input_vector}, output_vector);
  end
end

always @(posedge clock_vector) begin
  clk_start = 1'b1;
  $fdisplay(fid, "%b\n%b\n", {1'b1,input_vector}, output_vector);
end

endmodule


