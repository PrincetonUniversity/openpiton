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
`timescale 1ps/1ps
module playback_driver();

parameter	inputwidth=43;
parameter	outputwidth=39;
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
reg             io_clk;
reg             core_ref_clk;
reg             jtag_clk;



initial begin
io_clk = 1'b0;
forever #1429 io_clk = ~io_clk;
end

initial begin
core_ref_clk = 1'b0;

`ifndef USE_FAKE_PLL_AND_CLKMUX
forever #5000 core_ref_clk = ~core_ref_clk;
`else
forever #500 core_ref_clk = ~core_ref_clk;
`endif
end

initial begin
jtag_clk = 1'b0;
forever #6529 jtag_clk = ~jtag_clk;
end


assign clock_vector = io_clk;

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
  if(port < 2) begin
    $display("chip_intf_channel[%d]: Expect:%b Got:%b",port, exp , got);
  end else
  if(port < 34) begin
    $display("chip_inrf_data[%d]     : Expect:%b Got:%b", port-2, exp , got);
  end else 
  if(port < 37) begin
    $display("intf_chip_credit_back[%d]     : Expect:%b Got:%b", port-34, exp , got);
  end else 
  if(port < 38) begin
    $display("pll_lock   : Expect:%b Got:%b", exp , got);
  end else begin
    $display("jtag_dataout   : Expect:%b Got:%b", exp , got);
  end
end
endtask



wire	[outputwidth-1:0]	output_vector;
reg	[outputwidth-1:0]	output_vector_mask;
wire	[outputwidth-1:0]	output_vector_masked;
wire	[outputwidth-1:0]	output_vector_ref_masked;


    wire clk_en;
    wire jtag_rst_l;
    wire jtag_modesel;
    wire jtag_datain;
    wire jtag_dataout;
    wire          chip_rst_n;
    wire          pll_rst_n;

    wire         pll_lock;
    wire          pll_bypass = 1'b1;
    wire [4:0]    pll_rangea = 5'b00001;
    wire [1:0]    clk_mux_sel = 2'b00;
    wire          async_mux = 1'b0;

    wire [31:0]  intf_chip_data;
    wire [1:0]   intf_chip_channel;
    wire [2:0]   intf_chip_credit_back;

    wire [31:0]  chip_intf_data;
    wire [1:0]   chip_intf_channel;
    wire [2:0]   chip_intf_credit_back;


    chip chip(
        .slew(1'b1),
        .impsel1(1'b1),
        .impsel2(1'b1),
    
        .core_ref_clk(core_ref_clk),
        .io_clk(io_clk),
        .rst_n(chip_rst_n),
        .pll_rst_n(pll_rst_n),
        .clk_en(clk_en),
        .async_mux (async_mux),

        .pll_lock (pll_lock),
        .pll_bypass (pll_bypass),
        .pll_rangea (pll_rangea),
        .clk_mux_sel (clk_mux_sel),
        // .pll_clk (pll_clk),

        .oram_on(1'b0),
        .oram_traffic_gen(1'b0),        
        .oram_dummy_gen(1'b0),
        // JTAG pins
        .jtag_clk(jtag_clk),
        .jtag_rst_l(jtag_rst_l),
        .jtag_modesel(jtag_modesel),
        .jtag_datain(jtag_datain),
        .jtag_dataout(jtag_dataout),

        .intf_chip_data(intf_chip_data),
        .intf_chip_channel(intf_chip_channel),
        .intf_chip_credit_back(intf_chip_credit_back),

        .chip_intf_data(chip_intf_data),
        .chip_intf_channel(chip_intf_channel),
        .chip_intf_credit_back(chip_intf_credit_back)
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
    pll_rst_n,
    clk_en,
    jtag_rst_l,
    jtag_modesel,
    jtag_datain,
    intf_chip_data,
    intf_chip_channel,
    chip_intf_credit_back 
} = input_vector;


assign output_vector = {
    jtag_dataout,
    pll_lock,
    intf_chip_credit_back,
    chip_intf_data,
    chip_intf_channel
};


assign output_vector_ref_masked = output_vector_ref & output_vector_mask;
assign output_vector_masked = output_vector & output_vector_mask;

always @(output_vector_ref)
  generate_mask;

integer i;
initial generate_mask;

initial mismatch = 0;

always @(negedge clock_vector) begin
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


