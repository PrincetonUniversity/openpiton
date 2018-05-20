// Copyright (c) 2015 Princeton University
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

// top level module for testing fpga->fpga communication over 32 bit channel
`timescale 1ns/1ps
module fpga_bridge_top(
    rst,
    fpga_rcv_clk,
    fpga_send_clk,
    intcnct_send_clk,
    intcnct_rcv_clk,
    network_in_1,
    network_in_2,
    network_in_3,
    data_in_val_1,
    data_in_val_2,
    data_in_val_3,
    data_in_rdy_1,
    data_in_rdy_2,
    data_in_rdy_3,
    network_out_1,
    network_out_2,
    network_out_3,
    data_out_val_1,
    data_out_val_2,
    data_out_val_3,
    data_out_rdy_1,
    data_out_rdy_2,
    data_out_rdy_3
);

input    rst;
input    fpga_rcv_clk;
input    fpga_send_clk;
input    intcnct_send_clk;
input    intcnct_rcv_clk;
input [63:0]   network_in_1;
input [63:0]   network_in_2;
input [63:0]   network_in_3;
input    data_in_val_1;
input    data_in_val_2;
input    data_in_val_3;
input    data_out_rdy_1;
input    data_out_rdy_2;
input    data_out_rdy_3;

output    data_in_rdy_1;
output    data_in_rdy_2;
output    data_in_rdy_3;
output [63:0]   network_out_1;
output [63:0]   network_out_2;
output [63:0]   network_out_3;
output    data_out_val_1;
output    data_out_val_2;
output    data_out_val_3;


wire [31:0] intcnct_data;
wire [1:0]  intcnct_channel;
wire [2:0]  intcnct_credit_back;
fpga_bridge_send_32 fpga_send(
    .rst(rst), 
    .wr_clk(fpga_send_clk),
    .rd_clk(intcnct_send_clk),
    .credit_wr_clk(intcnct_rcv_clk),
    .bin_data_1(network_in_1),
    .bin_val_1(data_in_val_1),
    .bin_rdy_1(data_in_rdy_1),
    .bin_data_2(network_in_2),
    .bin_val_2(data_in_val_2),
    .bin_rdy_2(data_in_rdy_2),
    .bin_data_3(network_in_3),
    .bin_val_3(data_in_val_3),
    .bin_rdy_3(data_in_rdy_3),
    .data_to_chip(intcnct_data),
    .data_channel(intcnct_channel),
    .credit_from_chip(intcnct_credit_back)
);  


fpga_bridge_rcv_32 fpga_rcv (
    .rst(rst), 
    .wr_clk(intcnct_send_clk),
    .rd_clk(fpga_rcv_clk),
    .credit_rd_clk(intcnct_rcv_clk),
    .bout_data_1(network_out_1),
    .bout_val_1(data_out_val_1),
    .bout_rdy_1(data_out_rdy_1),
    .bout_data_2(network_out_2),
    .bout_val_2(data_out_val_2),
    .bout_rdy_2(data_out_rdy_2),
    .bout_data_3(network_out_3),
    .bout_val_3(data_out_val_3),
    .bout_rdy_3(data_out_rdy_3),
    .data_from_chip(intcnct_data),
    .data_channel(intcnct_channel),
    .credit_to_chip(intcnct_credit_back)
);


endmodule
