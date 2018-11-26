/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//top level module for fpga->chip communication tests

`include "define.tmp.h"

module fpga_bridge(
    // Clocks and resets
    input                               rst_n,
    input                               fpga_out_clk,
    input                               fpga_in_clk,
    input                               intf_out_clk,
    input                               intf_in_clk,

    // FPGA to interface val/rdy interface
    input  [`NOC_DATA_WIDTH-1:0]        fpga_intf_data_noc1,
    input  [`NOC_DATA_WIDTH-1:0]        fpga_intf_data_noc2,
    input  [`NOC_DATA_WIDTH-1:0]        fpga_intf_data_noc3,
    input                               fpga_intf_val_noc1,
    input                               fpga_intf_val_noc2,
    input                               fpga_intf_val_noc3,
    output                              fpga_intf_rdy_noc1,
    output                              fpga_intf_rdy_noc2,
    output                              fpga_intf_rdy_noc3,

    // FPGA to interface credit based virtual channel interface
    output [31:0]                       fpga_intf_data,
    output [1:0]                        fpga_intf_channel,
    input  [2:0]                        fpga_intf_credit_back,

    // Interface to FPGA val/rdy interface
    output [`NOC_DATA_WIDTH-1:0]        intf_fpga_data_noc1,
    output [`NOC_DATA_WIDTH-1:0]        intf_fpga_data_noc2,
    output [`NOC_DATA_WIDTH-1:0]        intf_fpga_data_noc3,
    output                              intf_fpga_val_noc1,
    output                              intf_fpga_val_noc2,
    output                              intf_fpga_val_noc3,
    input                               intf_fpga_rdy_noc1,
    input                               intf_fpga_rdy_noc2,
    input                               intf_fpga_rdy_noc3,

    // Interface to FPGA credit based virtual channel interface
    input  [31:0]                       intf_fpga_data,
    input  [1:0]                        intf_fpga_channel,
    output [2:0]                        intf_fpga_credit_back
);

parameter SEND_CREDIT_THRESHOLD = 9'd255;

fpga_bridge_send_32 #(
    .FULL_THRESHOLD(SEND_CREDIT_THRESHOLD)
)fpga_chip_out(
    .rst(~rst_n),
    .wr_clk(fpga_out_clk),
    .rd_clk(intf_out_clk),
    .credit_wr_clk(intf_in_clk),
    .bin_data_1(fpga_intf_data_noc1),
    .bin_val_1(fpga_intf_val_noc1),
    .bin_rdy_1(fpga_intf_rdy_noc1),
    .bin_data_2(fpga_intf_data_noc2),
    .bin_val_2(fpga_intf_val_noc2),
    .bin_rdy_2(fpga_intf_rdy_noc2),
    .bin_data_3(fpga_intf_data_noc3),
    .bin_val_3(fpga_intf_val_noc3),
    .bin_rdy_3(fpga_intf_rdy_noc3),
    .data_to_chip(fpga_intf_data),
    .data_channel(fpga_intf_channel),
    .credit_from_chip(fpga_intf_credit_back)
    );

fpga_bridge_rcv_32 fpga_chip_in (
    .rst(~rst_n),
    .wr_clk(intf_in_clk),
    .rd_clk(fpga_in_clk),
    .credit_rd_clk(intf_out_clk),
    .bout_data_1(intf_fpga_data_noc1),
    .bout_val_1(intf_fpga_val_noc1),
    .bout_rdy_1(intf_fpga_rdy_noc1),
    .bout_data_2(intf_fpga_data_noc2),
    .bout_val_2(intf_fpga_val_noc2),
    .bout_rdy_2(intf_fpga_rdy_noc2),
    .bout_data_3(intf_fpga_data_noc3),
    .bout_val_3(intf_fpga_val_noc3),
    .bout_rdy_3(intf_fpga_rdy_noc3),
    .data_from_chip(intf_fpga_data),
    .data_channel(intf_fpga_channel),
    .credit_to_chip(intf_fpga_credit_back)
);

endmodule
