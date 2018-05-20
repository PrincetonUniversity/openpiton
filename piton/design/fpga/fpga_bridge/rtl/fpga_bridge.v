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

//`timescale 1ns/1ps
module fpga_bridge(
    rst_n,
`ifdef PITON_SPARTAN6
    fpga_clk,
    intcnct_clk_out,
    intcnct_clk_back,
`else
    fpga_clk,
    intcnct_clk,
`endif
    network_out_1,
    network_out_2,
    network_out_3,
    data_out_val_1,
    data_out_val_2,
    data_out_val_3,
    data_out_rdy_1,
    data_out_rdy_2,
    data_out_rdy_3,
    intcnct_data_in,
    intcnct_channel_in,
    intcnct_credit_back_in,
    network_in_1,
    network_in_2,
    network_in_3,
    data_in_val_1,
    data_in_val_2,
    data_in_val_3,
    data_in_rdy_1,
    data_in_rdy_2,
    data_in_rdy_3,
    intcnct_data_out,
    intcnct_channel_out,
    intcnct_credit_back_out
//    dbg_interconnect_data,
//    dbg_interconnect_channel
);

input           rst_n;

`ifdef PITON_SPARTAN6
    input           fpga_clk;
    input           intcnct_clk_out;
    input           intcnct_clk_back;
`else
    input           fpga_clk;
    input           intcnct_clk;
`endif

input [63:0]    network_out_1;
input [63:0]    network_out_2;
input [63:0]    network_out_3;
input           data_out_val_1;
input           data_out_val_2;
input           data_out_val_3;
output          data_out_rdy_1;
output          data_out_rdy_2;
output          data_out_rdy_3;

input   [31:0]  intcnct_data_in;
input   [1:0]   intcnct_channel_in;
output  [2:0]   intcnct_credit_back_in;

output  [63:0]  network_in_1;
output  [63:0]  network_in_2;
output  [63:0]  network_in_3;
output          data_in_val_1;
output          data_in_val_2;
output          data_in_val_3;
input           data_in_rdy_1;
input           data_in_rdy_2;
input           data_in_rdy_3;

output  [31:0]  intcnct_data_out;
output  [1:0]   intcnct_channel_out;
input   [2:0]   intcnct_credit_back_out;

//output [31:0]   dbg_interconnect_data;
//output [1:0]    dbg_interconnect_channel;

//assign dbg_interconnect_data = intcnct_data;
//assign dbg_interconnect_channel = intcnct_channel;

fpga_bridge_send_32 fpga_chip_out(
    .rst(~rst_n),
`ifdef PITON_SPARTAN6
    .wr_clk(fpga_clk),
    .rd_clk(intcnct_clk_out),
`else
    .wr_clk(fpga_clk),
    .rd_clk(intcnct_clk),
`endif
    .bin_data_1(network_out_1),
    .bin_val_1(data_out_val_1),
    .bin_rdy_1(data_out_rdy_1),
    .bin_data_2(network_out_2),
    .bin_val_2(data_out_val_2),
    .bin_rdy_2(data_out_rdy_2),
    .bin_data_3(network_out_3),
    .bin_val_3(data_out_val_3),
    .bin_rdy_3(data_out_rdy_3),
    .data_to_chip(intcnct_data_out),
    .data_channel(intcnct_channel_out),
    .credit_from_chip(intcnct_credit_back_out)
    );  

fpga_bridge_rcv_32 fpga_chip_in (
    .rst(~rst_n), 
`ifdef PITON_SPARTAN6
    .wr_clk(intcnct_clk_back),
    .rd_clk(fpga_clk),
`else
    .wr_clk(intcnct_clk),
    .rd_clk(fpga_clk),
`endif
    .bout_data_1(network_in_1),
    .bout_val_1(data_in_val_1),
    .bout_rdy_1(data_in_rdy_1),
    .bout_data_2(network_in_2),
    .bout_val_2(data_in_val_2),
    .bout_rdy_2(data_in_rdy_2),
    .bout_data_3(network_in_3),
    .bout_val_3(data_in_val_3),
    .bout_rdy_3(data_in_rdy_3),
    .data_from_chip(intcnct_data_in),
    .data_channel(intcnct_channel_in),
    .credit_to_chip(intcnct_credit_back_in)
);

endmodule
