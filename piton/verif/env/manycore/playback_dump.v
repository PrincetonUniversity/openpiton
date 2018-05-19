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
reg clk;

initial begin
   fid = $fopen("stimuli.txt","w");
   clk_start = 1'b0;
   clk = 1'b0;
   forever #418 clk = ~clk;
end


wire [156:0] input_vector = {
	cmp_top.iop.sparc0.pcx_spc_grant_px, 
	cmp_top.iop.sparc0.cpx_spc_data_rdy_cx2, 
	cmp_top.iop.sparc0.cpx_spc_data_cx2, 
	cmp_top.iop.sparc0.cluster_cken, 
	cmp_top.iop.sparc0.cmp_grst_l, 
	cmp_top.iop.sparc0.cmp_arst_l, 
	cmp_top.iop.sparc0.ctu_tst_pre_grst_l, 
	cmp_top.iop.sparc0.adbginit_l, 
	cmp_top.iop.sparc0.gdbginit_l};

wire [129:0] output_vector = {
	cmp_top.iop.sparc0.spc_pcx_req_pq, 
	cmp_top.iop.sparc0.spc_pcx_atom_pq, 
	cmp_top.iop.sparc0.spc_pcx_data_pa};

wire clock_vector = cmp_top.iop.sparc0.gclk;

always @(posedge clk) begin
  if(~clk_start) begin
    $fdisplay(fid, "%b\n%b\n", input_vector, output_vector);
  end
end

always @(posedge clock_vector) begin
  clk_start = 1'b1;
  $fdisplay(fid, "%b\n%b\n", input_vector, output_vector);
end

endmodule


