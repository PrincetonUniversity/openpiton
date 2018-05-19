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

parameter	inputwidth=358;
parameter	outputwidth=371;
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
  if(port < 12) begin
    $display("l15_config_req_address_s2[%d]: Expect:%b Got:%b at cycle %d",port-4, exp , got, cycle);
  end else
  if(port < 76) begin
    $display("l15_config_write_req_data_s2[%d]: Expect:%b Got:%b at cycle %d",port-12, exp , got, cycle);
  end else
  if(port < 77) begin
    $display("l15_config_req_rw_s2: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 78) begin
    $display("l15_config_req_val_s2: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 82) begin
    $display("l15_dmbr_l2missTag[%d]: Expect:%b Got:%b at cycle %d",port-78, exp , got, cycle);
  end else
  if(port < 83) begin
    $display("l15_dmbr_l2missIn: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 84) begin
    $display("l15_dmbr_l2responseIn: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 88) begin
    $display("l15_dmbr_l1missTag[%d]: Expect:%b Got:%b at cycle %d",port-84, exp , got, cycle);
  end else
  if(port < 89) begin
    $display("l15_dmbr_l1missIn: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 153) begin
    $display("noc3_out_data[%d]: Expect:%b Got:%b at cycle %d", port-89, exp , got, cycle);
  end else
  if(port < 154) begin
    $display("noc3_out_val: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 155) begin
    $display("noc2_in_rdy: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 219) begin
    $display("noc1_out_data[%d]: Expect:%b Got:%b at cycle %d",port-155, exp , got, cycle);
  end else
  if(port < 220) begin
    $display("noc1_out_val: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  if(port < 365) begin
    $display("cpx_data[%d]: Expect:%b Got:%b at cycle %d",port-220, exp , got, cycle);
  end else
  if(port < 366) begin
    $display("cpx_data_ready: Expect:%b Got:%b at cycle %d", exp , got, cycle);
  end else
  begin
    $display("pcx_grant[%d]: Expect:%b Got:%b at cycle %d",port-366, exp , got, cycle);
  end 
end
endtask



wire	[outputwidth-1:0]	output_vector;
reg	[outputwidth-1:0]	output_vector_mask;
wire	[outputwidth-1:0]	output_vector_masked;
wire	[outputwidth-1:0]	output_vector_ref_masked;



    wire clk;
    wire clk_en;
    wire rst_n;

    wire           pcx_req_0;
    wire           pcx_atomic_req;
    
    wire   [123:117] pcx_data_123_117;
    wire   [112:0]   pcx_data_112_0;
    wire   [33-1:0] pcx_csm;
    wire noc1_out_rdy;
    wire noc2_in_val;
    wire [64-1:0] noc2_in_data;
    wire noc3_out_rdy;
    wire dmbr_l15_stall;
    wire [14-1:0] chipid;
    wire [8-1:0] coreid_x;
    wire [8-1:0] coreid_y;

    // from config registers to pipeline
    wire [63:0] config_l15_read_res_data_s3;
    wire config_csm_en;
    wire [5:0] config_system_tile_count_5_0;
    wire [2-1:0] config_home_alloc_method; 
    wire [22-1:0] config_hmt_base;

    wire [4:0]     pcx_grant;
    wire           cpx_data_ready;
    wire [144:0]   cpx_data;
    wire noc1_out_val;
    wire [64-1:0] noc1_out_data;
    wire noc2_in_rdy;
    wire noc3_out_val;
    wire [64-1:0] noc3_out_data;
    // wire pcx_req_squashed;
    wire                       l15_dmbr_l1missIn;
    wire [4-1:0] l15_dmbr_l1missTag;
    wire                       l15_dmbr_l2responseIn;
    wire                       l15_dmbr_l2missIn;
    wire [4-1:0] l15_dmbr_l2missTag;

    // to config registers to pipeline
    wire l15_config_req_val_s2;
    wire l15_config_req_rw_s2;
    wire [63:0] l15_config_write_req_data_s2;
    wire [15:8] l15_config_req_address_s2;

    // sram interface
    wire [4-1:0] srams_rtap_data;
    wire  [4-1:0] rtap_srams_bist_command;
    wire  [4-1:0] rtap_srams_bist_data;



   l15_wrap l15(
        .clk(clk),
        .rst_n(rst_n),

        .pcx_req_0(pcx_req_0),
        .pcx_atomic_req(pcx_atomic_req),
        .pcx_data_123_117(pcx_data_123_117),
        .pcx_data_112_0(pcx_data_112_0),
        .pcx_csm(pcx_csm),
        .noc1_out_rdy(noc1_out_rdy),
        .noc2_in_val(noc2_in_val),
        .noc2_in_data(noc2_in_data),
        .noc3_out_rdy(noc3_out_rdy),
        .dmbr_l15_stall(dmbr_l15_stall),
        .chipid(chipid),
        .coreid_x(coreid_x),
        .coreid_y(coreid_y),

        .pcx_grant(pcx_grant),
        .cpx_data_ready(cpx_data_ready),
        .cpx_data(cpx_data),
        .noc1_out_val(noc1_out_val),
        .noc1_out_data(noc1_out_data),
        .noc2_in_rdy(noc2_in_rdy),
        .noc3_out_val(noc3_out_val),
        .noc3_out_data(noc3_out_data),
        .l15_dmbr_l1missIn(l15_dmbr_l1missIn),
        .l15_dmbr_l1missTag(l15_dmbr_l1missTag),
        .l15_dmbr_l2missIn(l15_dmbr_l2missIn),
        .l15_dmbr_l2missTag(l15_dmbr_l2missTag),
        .l15_dmbr_l2responseIn(l15_dmbr_l2responseIn),

        // config registers
        .l15_config_req_val_s2(l15_config_req_val_s2),
        .l15_config_req_rw_s2(l15_config_req_rw_s2),
        .l15_config_write_req_data_s2(l15_config_write_req_data_s2),
        .l15_config_req_address_s2(l15_config_req_address_s2),
        .config_l15_read_res_data_s3(config_l15_read_res_data_s3),

        // config regs
        .config_csm_en(config_csm_en),
        .config_hmt_base(config_hmt_base),
        .config_system_tile_count_5_0(config_system_tile_count_5_0),
        .config_home_alloc_method(config_home_alloc_method), 

        // sram interfaces
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
    clk_en,
    rst_n,
    pcx_req_0,
    pcx_atomic_req,
    pcx_data_123_117,
    pcx_data_112_0,
    pcx_csm,
    noc1_out_rdy,
    noc2_in_val,
    noc2_in_data,
    noc3_out_rdy,
    dmbr_l15_stall,
    chipid,
    coreid_x,
    coreid_y,
    config_l15_read_res_data_s3,
    config_csm_en,
    config_system_tile_count_5_0,
    config_home_alloc_method,
    config_hmt_base,
    rtap_srams_bist_command,
    rtap_srams_bist_data
} = input_vector;

assign output_vector = {
    pcx_grant,
    cpx_data_ready,
    cpx_data,
    noc1_out_val,
    noc1_out_data,
    noc2_in_rdy,
    noc3_out_val,
    noc3_out_data,
    l15_dmbr_l1missIn,
    l15_dmbr_l1missTag,
    l15_dmbr_l2responseIn,
    l15_dmbr_l2missIn,
    l15_dmbr_l2missTag,
    l15_config_req_val_s2,
    l15_config_req_rw_s2,
    l15_config_write_req_data_s2,
    l15_config_req_address_s2,
    srams_rtap_data
};

assign clk = clk_en? clock_vector : 1'b0;





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


