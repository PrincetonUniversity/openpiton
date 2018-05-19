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

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates the off chip interface for networks 1, 2 and 3
 * channel is 32 bits wide, splitting flits into two parts before send
 * relies on arbitration logic in chip_net_chooser.v
 *
 *******************************************************************/



`timescale 1ns/1ps

module chip_bridge_out (
    rst, 
    wr_clk,
    rd_clk,
    async_mux,
    bin_data_1,
    bin_val_1,
    bin_rdy_1,
    bin_data_2,
    bin_val_2,
    bin_rdy_2,
    bin_data_3,
    bin_val_3,
    bin_rdy_3,
    data_to_fpga,
    data_channel,
    credit_from_fpga
);  

input rst;
input wr_clk;
input rd_clk;
input async_mux;

output          bin_rdy_1;
output          bin_rdy_2;
output          bin_rdy_3;
output [31:0]   data_to_fpga;
output [ 1:0]    data_channel;

input [63:0]    bin_data_1;
input           bin_val_1;
input [63:0]    bin_data_2;
input           bin_val_2;
input [63:0]    bin_data_3;
input           bin_val_3;
input [2:0]     credit_from_fpga;

wire network_rdy_1;
wire network_rdy_2;
wire network_rdy_3;

wire fifo1_full;
wire fifo2_full;
wire fifo3_full;

wire [63:0] network_data_1;
wire [63:0] network_data_2;
wire [63:0] network_data_3;

wire network_val_1;
wire network_val_2;
wire network_val_3;

wire async_fifo1_full;
wire async_fifo2_full;
wire async_fifo3_full;

wire [63:0] async_network_data_1;
wire [63:0] async_network_data_2;
wire [63:0] async_network_data_3;

wire async_network_val_1;
wire async_network_val_2;
wire async_network_val_3;

wire sync_fifo1_full;
wire sync_fifo2_full;
wire sync_fifo3_full;

wire [63:0] sync_network_data_1;
wire [63:0] sync_network_data_2;
wire [63:0] sync_network_data_3;

wire sync_network_val_1;
wire sync_network_val_2;
wire sync_network_val_3;


wire [63:0] data_to_serial_buffer;
reg  [31:0] serial_buffer_data[1:0];
reg   [0:0] serial_buffer_data_counter;
wire  [1:0] channel_to_serial_buffer;
reg   [1:0] serial_buffer_channel;

assign bin_rdy_1 = ~fifo1_full; 
assign bin_rdy_2 = ~fifo2_full; 
assign bin_rdy_3 = ~fifo3_full; 

assign data_to_fpga = serial_buffer_data[serial_buffer_data_counter];
assign data_channel = serial_buffer_channel;


bridge_network_chooser separator(
    .rst    (rst),
    .clk    (rd_clk),
    .data_out(data_to_serial_buffer),
    .data_channel(channel_to_serial_buffer),
    .din_1  (network_data_1),
    .rdy_1  (network_rdy_1),
    .val_1  (~network_val_1),
    .din_2  (network_data_2),
    .rdy_2  (network_rdy_2),
    .val_2  (~network_val_2),
    .din_3  (network_data_3),
    .rdy_3  (network_rdy_3),
    .val_3  (~network_val_3),
    .credit_from_fpga(credit_from_fpga)
);
//TODO: determine if full/empty are active high or low
//input-output fixed to 64 bits
async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_1(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_1 && async_mux),
    .wval(bin_val_1 && async_mux),
    .wdata(bin_data_1),
    .rdata(async_network_data_1),
    .wfull(async_fifo1_full),
    .rempty(async_network_val_1)
);

async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_2(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_2 && async_mux),
    .wval(bin_val_2 && async_mux),
    .wdata(bin_data_2),
    .rdata(async_network_data_2),
    .wfull(async_fifo2_full),
    .rempty(async_network_val_2)
);

async_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
async_fifo_3(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(network_rdy_3 && async_mux),
    .wval(bin_val_3 && async_mux),
    .wdata(bin_data_3),
    .rdata(async_network_data_3),
    .wfull(async_fifo3_full),
    .rempty(async_network_val_3)
);

sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_1(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_1 && ~async_mux),
    .wval(bin_val_1 && ~async_mux),
    .wdata(bin_data_1),
    .rdata(sync_network_data_1),
    .full(sync_fifo1_full),
    .empty(sync_network_val_1)
);

sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_2(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_2 && ~async_mux),
    .wval(bin_val_2 && ~async_mux),
    .wdata(bin_data_2),
    .rdata(sync_network_data_2),
    .full(sync_fifo2_full),
    .empty(sync_network_val_2)
);

sync_fifo #(
.DSIZE(64),
.ASIZE(4),
.MEMSIZE(8) )
sync_fifo_3(
    .reset(rst),
    .clk(rd_clk),
    .ren(network_rdy_3 && ~async_mux),
    .wval(bin_val_3 && ~async_mux),
    .wdata(bin_data_3),
    .rdata(sync_network_data_3),
    .full(sync_fifo3_full),
    .empty(sync_network_val_3)
);

assign network_val_1  = async_mux ? async_network_val_1 : sync_network_val_1;
assign network_val_2  = async_mux ? async_network_val_2 : sync_network_val_2;
assign network_val_3  = async_mux ? async_network_val_3 : sync_network_val_3;

assign network_data_1  = async_mux ? async_network_data_1 : sync_network_data_1;
assign network_data_2  = async_mux ? async_network_data_2 : sync_network_data_2;
assign network_data_3  = async_mux ? async_network_data_3 : sync_network_data_3;

assign fifo1_full = async_mux ? async_fifo1_full : sync_fifo1_full;
assign fifo2_full = async_mux ? async_fifo2_full : sync_fifo2_full;
assign fifo3_full = async_mux ? async_fifo3_full : sync_fifo3_full;

always @(posedge rd_clk) begin
    if(rst) begin
        serial_buffer_data [0] <= 32'd0;
        serial_buffer_data [1] <= 32'd0;
        serial_buffer_channel <= 2'd0;
        serial_buffer_data_counter <= 1'b1;
    end
    else begin
        if( channel_to_serial_buffer != 0 && serial_buffer_data_counter == 1) begin
            
            serial_buffer_data[0] <= data_to_serial_buffer[31:0];
            serial_buffer_data[1] <= data_to_serial_buffer[63:32];
            serial_buffer_channel <= channel_to_serial_buffer;

            serial_buffer_data_counter <= serial_buffer_data_counter + 1'b1;
        end
        else if( data_channel != 0 && serial_buffer_data_counter != 1'b1) begin
            serial_buffer_data_counter <= serial_buffer_data_counter + 1'b1;
        end
        else begin
            serial_buffer_data_counter <= 1'b1;
            serial_buffer_channel <= channel_to_serial_buffer;
        end
    end
end 

endmodule
