// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: playback_driver.v
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
module playback_driver();

parameter	inputwidth=157;
parameter	outputwidth=130;
parameter	clockwidth=1;

reg [256*8-1:0] stimfile;
reg [256*8-1:0] iofile;


initial begin
stimfile = "not_provided";
if($test$plusargs("stim_file")) begin
$value$plusargs("stim_file=%s", stimfile);
end
end


reg	[inputwidth-1:0]	input_vector;
reg	[inputwidth-1:0]	input_vector_a;
reg	[outputwidth-1:0]	output_vector_ref;
reg				clock_vector;

initial begin
clock_vector = 1'b0;
forever #418 clock_vector = ~clock_vector;
end

integer fid, code;
integer	mismatch;

initial begin
  fid = $fopen(stimfile, "r");
end


always @(posedge clock_vector) begin
  #20;
  input_vector = input_vector_a;
  code = $fscanf(fid, "%b\n", input_vector_a);
  if(code == 0 || code == -1) begin 
    if(mismatch == 0)
      $display("Playback PASSED!");
   else
      $display("Playback FAILED with %1d mismatches!", mismatch);
    $finish; 
  end
  @(negedge clock_vector);
  #1;
  $fscanf(fid, "%b\n", output_vector_ref);
end

task displayMismatch;
input [7:0] port;
input exp;
input got;
begin
  if(port < 124) begin
    $display("spc_pcx_data_pa[%3d]: Expect:%b Got:%b",port, exp , got);
  end else
  if(port < 125) begin
    $display("spc_pcx_atom_pq     : Expect:%b Got:%b", exp , got);
  end else begin
    $display("spc_pcx_req_pq[%1d]   : Expect:%b Got:%b", port-125,exp , got);
  end
end
endtask



wire	[outputwidth-1:0]	output_vector;
reg	[outputwidth-1:0]	output_vector_mask;
wire	[outputwidth-1:0]	output_vector_masked;
wire	[outputwidth-1:0]	output_vector_ref_masked;

// WIRE Definitions for remove
wire		spc_sscan_so;
wire		spc_scanout0;
wire		spc_scanout1;
wire		tst_ctu_mbist_done;
wire		tst_ctu_mbist_fail;
wire		spc_efc_ifuse_data;
wire		spc_efc_dfuse_data;

// WIRE Definitions for constraint
wire	[3:0]	const_cpuid = 4'b0000;
wire	[7:0]	const_maskid = 8'h20;
wire		ctu_tck = 1'b0;
wire		ctu_sscan_se = 1'b0;
wire		ctu_sscan_snap = 1'b0;
wire	[3:0]	ctu_sscan_tid = 4'h1;
wire		ctu_tst_mbist_enable = 1'b0;
wire		efc_spc_fuse_clk1 = 1'b0;
wire		efc_spc_fuse_clk2 = 1'b0;
wire		efc_spc_ifuse_ashift = 1'b0;
wire		efc_spc_ifuse_dshift = 1'b0;
wire		efc_spc_ifuse_data = 1'b0;
wire		efc_spc_dfuse_ashift = 1'b0;
wire		efc_spc_dfuse_dshift = 1'b0;
wire		efc_spc_dfuse_data = 1'b0;
wire		ctu_tst_macrotest = 1'b0;
wire		ctu_tst_scan_disable = 1'b0;
wire		ctu_tst_short_chain = 1'b0;
wire		global_shift_enable = 1'b0;
wire		ctu_tst_scanmode = 1'b0;
wire		spc_scanin0 = 1'b0;
wire		spc_scanin1 = 1'b0;

// WIRE Definitions for clock
wire		gclk;

// WIRE Definitions for input
wire	[4:0]	pcx_spc_grant_px;
wire		cpx_spc_data_rdy_cx2;
wire	[144:0]	cpx_spc_data_cx2;
wire		cluster_cken;
wire		cmp_grst_l;
wire		cmp_arst_l;
wire		ctu_tst_pre_grst_l;
wire		adbginit_l;
wire		gdbginit_l;

// WIRE Definitions for output
wire	[4:0]	spc_pcx_req_pq;
wire		spc_pcx_atom_pq;
wire	[123:0]	spc_pcx_data_pa;

// WIRE Definitions for inout

sparc sparc0 (
	.spc_pcx_req_pq			(spc_pcx_req_pq),
	.spc_pcx_atom_pq		(spc_pcx_atom_pq),
	.spc_pcx_data_pa		(spc_pcx_data_pa),
	.spc_sscan_so			(spc_sscan_so),
	.spc_scanout0			(spc_scanout0),
	.spc_scanout1			(spc_scanout1),
	.tst_ctu_mbist_done		(tst_ctu_mbist_done),
	.tst_ctu_mbist_fail		(tst_ctu_mbist_fail),
	.spc_efc_ifuse_data		(spc_efc_ifuse_data),
	.spc_efc_dfuse_data		(spc_efc_dfuse_data),
	.pcx_spc_grant_px		(pcx_spc_grant_px),
	.cpx_spc_data_rdy_cx2		(cpx_spc_data_rdy_cx2),
	.cpx_spc_data_cx2		(cpx_spc_data_cx2),
	.const_cpuid			(const_cpuid),
	.const_maskid			(const_maskid),
	.ctu_tck			(ctu_tck),
	.ctu_sscan_se			(ctu_sscan_se),
	.ctu_sscan_snap			(ctu_sscan_snap),
	.ctu_sscan_tid			(ctu_sscan_tid),
	.ctu_tst_mbist_enable		(ctu_tst_mbist_enable),
	.efc_spc_fuse_clk1		(efc_spc_fuse_clk1),
	.efc_spc_fuse_clk2		(efc_spc_fuse_clk2),
	.efc_spc_ifuse_ashift		(efc_spc_ifuse_ashift),
	.efc_spc_ifuse_dshift		(efc_spc_ifuse_dshift),
	.efc_spc_ifuse_data		(efc_spc_ifuse_data),
	.efc_spc_dfuse_ashift		(efc_spc_dfuse_ashift),
	.efc_spc_dfuse_dshift		(efc_spc_dfuse_dshift),
	.efc_spc_dfuse_data		(efc_spc_dfuse_data),
	.ctu_tst_macrotest		(ctu_tst_macrotest),
	.ctu_tst_scan_disable		(ctu_tst_scan_disable),
	.ctu_tst_short_chain		(ctu_tst_short_chain),
	.global_shift_enable		(global_shift_enable),
	.ctu_tst_scanmode		(ctu_tst_scanmode),
	.spc_scanin0			(spc_scanin0),
	.spc_scanin1			(spc_scanin1),
	.cluster_cken			(cluster_cken),
	.gclk				(gclk),
	.cmp_grst_l			(cmp_grst_l),
	.cmp_arst_l			(cmp_arst_l),
	.ctu_tst_pre_grst_l		(ctu_tst_pre_grst_l),
	.adbginit_l			(adbginit_l),
	.gdbginit_l			(gdbginit_l)
	);

task generate_mask;
integer i;
begin
for(i=0;i<outputwidth;i=i+1)
  output_vector_mask[i] = (output_vector_ref[i] === 1'b0) | (output_vector_ref[i] === 1'b1);
end
endtask


assign {pcx_spc_grant_px, cpx_spc_data_rdy_cx2, cpx_spc_data_cx2, cluster_cken, cmp_grst_l, cmp_arst_l, ctu_tst_pre_grst_l, adbginit_l, gdbginit_l} = input_vector;

assign {gclk} = clock_vector;

assign output_vector = {spc_pcx_req_pq, spc_pcx_atom_pq, spc_pcx_data_pa};

assign output_vector_ref_masked = output_vector_ref & output_vector_mask;
assign output_vector_masked = output_vector & output_vector_mask;

always @(output_vector_ref)
  generate_mask;

integer i;
initial generate_mask;

initial mismatch = 0;

always @(negedge gclk) begin
  if(output_vector_ref_masked !== output_vector_masked) begin
    mismatch = mismatch + 1;
    for(i=0;i<outputwidth;i=i+1)
      if(output_vector_ref_masked[i] !== output_vector_masked[i])
	 displayMismatch(i, output_vector_ref_masked[i], output_vector_masked[i]);
    $display("Number of cycles mismatched %d\n",mismatch);
  end
end

endmodule

module cmp_top();

playback_driver iop();

`ifdef DUMP_ON

initial
  if($test$plusargs("dump"))
    $fsdbDumpvars(0, cmp_top.iop);

`endif

endmodule


