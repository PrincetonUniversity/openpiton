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
//`timescale 1ps/1ps
//`define ARM_UD_MODEL
module playback_driver();

parameter	inputwidth=170;
parameter	outputwidth=71;
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
wire				clock_vector;
reg             core_ref_clk;



initial begin
core_ref_clk = 1'b0;
forever #714 core_ref_clk = ~core_ref_clk;
end



assign clock_vector = core_ref_clk;

integer fid, code;
integer	mismatch;
integer cycle;

initial begin
  fid = $fopen(stimfile, "r");
end


always @(posedge clock_vector) begin
  #300;
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
  #200;
  $fscanf(fid, "%b\n", output_vector_ref);
end

task displayMismatch;
input [7:0] port;
input exp;
input got;
begin
  if(port < 4) begin
    $display("sram_rtap_data[%d]: Expect:%b Got:%b at cycle %d",port, exp , got, cycle);
  end else
  if(port < 68) begin
    $display("noc2_data_out[%d]     : Expect:%b Got:%b at cycle %d", port-4, exp , got, cycle);
  end else 
  if(port < 69) begin
    $display("noc2_valid_out     : Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else 
  if(port < 70) begin
    $display("noc3_ready_in     : Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else begin
    $display("noc1_ready_in  : Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end
end
endtask



wire	[outputwidth-1:0]	output_vector;
reg	[outputwidth-1:0]	output_vector_mask;
wire	[outputwidth-1:0]	output_vector_masked;
wire	[outputwidth-1:0]	output_vector_ref_masked;


    wire rst_n;
    
    wire [14-1:0] chipid;
    wire [8-1:0] coreid_x;
    wire [8-1:0] coreid_y;

    wire noc1_valid_in;
    wire [64-1:0] noc1_data_in;
    wire noc1_ready_in;

    wire noc3_valid_in;
    wire [64-1:0] noc3_data_in;
    wire noc3_ready_in;

    wire noc2_valid_out;
    wire [64-1:0] noc2_data_out;
    wire noc2_ready_out;

    // sram interface
    wire [4-1:0] srams_rtap_data;
    wire  [4-1:0] rtap_srams_bist_command;
    wire  [4-1:0] rtap_srams_bist_data;



    l2 l2(
        .clk(clock_vector),
        .rst_n(rst_n),
        .chipid(chipid),
        .coreid_x(coreid_x),
        .coreid_y(coreid_y),
        .noc1_valid_in(noc1_valid_in),
        .noc3_valid_in(noc3_valid_in),
        .noc1_data_in(noc1_data_in),
        .noc3_data_in(noc3_data_in),
        .noc2_ready_out(noc2_ready_out),

        .noc1_ready_in(noc1_ready_in),
        .noc3_ready_in(noc3_ready_in),
        .noc2_valid_out(noc2_valid_out),
        .noc2_data_out(noc2_data_out),

        // interface to srams
        .srams_rtap_data (srams_rtap_data),
        .rtap_srams_bist_command (rtap_srams_bist_command),
        .rtap_srams_bist_data (rtap_srams_bist_data)
    );




task generate_mask;
integer i;
begin
for(i=0;i<outputwidth;i=i+1)
  output_vector_mask[i] = (output_vector_ref[i] === 1'b0) | (output_vector_ref[i] === 1'b1);
end
endtask

assign {
    rst_n,
    chipid,
    coreid_x,
    coreid_y,
    noc1_valid_in,
    noc1_data_in,
    noc3_valid_in,
    noc3_data_in,
    noc2_ready_out,
    rtap_srams_bist_command,
    rtap_srams_bist_data
} = input_vector;

assign output_vector = {
    noc1_ready_in,
    noc3_ready_in,
    noc2_valid_out,
    noc2_data_out,
    srams_rtap_data
};




assign output_vector_ref_masked = output_vector_ref & output_vector_mask;
assign output_vector_masked = output_vector & output_vector_mask;

always @(output_vector_ref)
  generate_mask;

integer i;
initial generate_mask;

initial mismatch = 0;
initial cycle = 0;

always @(negedge clock_vector) begin
  cycle = cycle + 1;
  if(cycle > 2)
  begin
  if(output_vector_ref_masked !== output_vector_masked) begin
    mismatch = mismatch + 1;
    for(i=0;i<outputwidth;i=i+1)
      if(output_vector_ref_masked[i] !== output_vector_masked[i])
	 displayMismatch(i, output_vector_ref_masked[i], output_vector_masked[i]);
    $display("Number of cycles mismatched %d\n",mismatch);
  end
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


