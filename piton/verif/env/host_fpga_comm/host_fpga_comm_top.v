// Copyright (c) 2016 Princeton University
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

`timescale 1ns/1ns

`include "host_fpga_defines.h"
`include "define.tmp.h"

module host_fpga_comm_top();

localparam  HALF_PERIOD = `CLK_PERIOD / 2;
localparam  RESET_DELAY = 10*`CLK_PERIOD;


reg             clk;
reg             rst_n;

wire            host_fpga_serial;
wire            fpga_host_serial;

wire                            test_start;
wire                            last_part;
wire                            flit_accepted;
reg                             noc2_val;
wire    [`NOC_DATA_WIDTH-1:0]   noc2_data;
wire                            noc2_rdy;
reg     [`NOC_DATA_WIDTH-1:0]   noc2_data_strorage [3:0];
reg     [1:0]                   noc_cnt;



//----------------------------------------------------
// clock
initial begin
    clk = 0;
    forever
        // 20 ns period => 50 MHz
        #HALF_PERIOD clk = ~clk;
end

// reset
initial begin
    rst_n = 0;
    #RESET_DELAY rst_n = ~rst_n;
end

// initialization of other signals

host    host (
    .clk        (clk                ),
    .rst_n      (rst_n              ),

    .serial_tx  (host_fpga_serial   ),
    .serial_rx  (fpga_host_serial   )
);

assign chipset_intf_rdy_noc1    = 1'b1;
assign chipset_intf_rdy_noc2    = 1'b1;
assign chipset_intf_rdy_noc3    = 1'b1;

assign intf_chipset_val_noc1    = 1'b0;
assign intf_chipset_val_noc2    = 1'b0;
assign intf_chipset_val_noc3    = 1'b0;

assign uart_boot_en = 1'b1;

always @(posedge clk) begin
    if (~rst_n)
        noc2_val <= 1'b0;
    else
        noc2_val <= ~test_start | last_part | (noc_cnt == 3)  ? 1'b0  : 1'b1;
end

always @(posedge clk) begin
    if (~rst_n)
        noc_cnt <= 2'b0;
    else
        noc_cnt <= flit_accepted ? noc_cnt + 1 : noc_cnt;
end

assign flit_accepted = noc2_val & noc2_rdy;
assign last_part = (noc_cnt == 2) & flit_accepted;

always @(posedge clk) begin
    noc2_data_strorage[0] <= 64'h8000_0000_8084_c008;
    noc2_data_strorage[1] <= 64'h0000_0004_00c0_0100; //  00ff_f000_0020_0100;
    noc2_data_strorage[2] <= 64'h0000_0000_0000_0000;
    noc2_data_strorage[3] <= 64'h0000_0000_0000_0000;
end

assign noc2_data = noc2_data_strorage[noc_cnt];

chipset_impl    chipset_impl    (
    .chipset_clk                (clk                    ),
    .chipset_rst_n              (rst_n                  ),

    .chipset_intf_data_noc1     ( ),
    .chipset_intf_data_noc2     ( ),
    .chipset_intf_data_noc3     ( ),
    .chipset_intf_val_noc1      ( ),
    .chipset_intf_val_noc2      (  ),
    .chipset_intf_val_noc3      ( ),
    .chipset_intf_rdy_noc1      (chipset_intf_rdy_noc1  ),
    .chipset_intf_rdy_noc2      (chipset_intf_rdy_noc2  ),
    .chipset_intf_rdy_noc3      (chipset_intf_rdy_noc3  ),

    .intf_chipset_data_noc1     ( ),
    .intf_chipset_data_noc2     (noc2_data ),
    .intf_chipset_data_noc3     ( ),
    .intf_chipset_val_noc1      (intf_chipset_val_noc1  ),
    .intf_chipset_val_noc2      (noc2_val  ),
    .intf_chipset_val_noc3      (intf_chipset_val_noc3  ),
    .intf_chipset_rdy_noc1      (  ),
    .intf_chipset_rdy_noc2      (noc2_rdy  ),
    .intf_chipset_rdy_noc3      (  ),

    .uart_tx                    (fpga_host_serial       ),
    .uart_rx                    (host_fpga_serial       ),

    .uart_boot_en               (uart_boot_en           ),

    .test_start                 (test_start             )

);


endmodule