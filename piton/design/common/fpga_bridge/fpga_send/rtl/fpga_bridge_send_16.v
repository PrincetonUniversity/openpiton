// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates the off chip interface for networks 1, 2 and 3
 * channel is 16 bits wide, splitting flits into four parts before send
 * relies on arbitration logic in fpga_net_chooser_16.v
 *
 *******************************************************************/

`timescale 1ns/1ps

module fpga_bridge_send_16 (
    rst, 
    wr_clk,
    rd_clk,
    bin_data_1,
    bin_val_1,
    bin_rdy_1,
    bin_data_2,
    bin_val_2,
    bin_rdy_2,
    bin_data_3,
    bin_val_3,
    bin_rdy_3,
    data_to_chip,
    data_channel,
    credit_from_chip
);  

input rst;
input wr_clk;
input rd_clk;

output          bin_rdy_1;
output          bin_rdy_2;
output          bin_rdy_3;
output [15:0]   data_to_chip;
output [ 1:0]    data_channel;

input [63:0]    bin_data_1;
input           bin_val_1;
input [63:0]    bin_data_2;
input           bin_val_2;
input [63:0]    bin_data_3;
input           bin_val_3;
input [2:0]     credit_from_chip;

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

wire network_empty_1;
wire network_empty_2;
wire network_empty_3;

wire [63:0] data_to_serial_buffer;
reg  [15:0] serial_buffer_data[3:0];
reg   [1:0] serial_buffer_data_counter;
wire  [2:0] channel_to_serial_buffer;
reg   [2:0] serial_buffer_channel;

assign bin_rdy_1 = ~fifo1_full; 
assign bin_rdy_2 = ~fifo2_full; 
assign bin_rdy_3 = ~fifo3_full; 

assign data_to_chip = serial_buffer_data[serial_buffer_data_counter];
assign data_channel = serial_buffer_channel;

bridge_network_chooser_16 separator(
    .rst    (rst),
    .clk    (rd_clk),
    .data_out(data_to_serial_buffer),
    .data_channel(channel_to_serial_buffer),
    .val_1  (network_val_1),
    .val_2  (network_val_2),
    .val_3  (network_val_3),
    .din_1  (network_data_1),
    .din_2  (network_data_2),
    .din_3  (network_data_3),
    .rdy_1  (network_rdy_1),
    .rdy_2  (network_rdy_2),
    .rdy_3  (network_rdy_3),
    .empty_1(network_empty_1),
    .empty_2(network_empty_2),
    .empty_3(network_empty_3),
    .credit_from_chip(credit_from_chip)
);
//TODO: determine if full/empty are active high or low
//input-output fixed to 64 bits


a_fifo_w64 fifo_1(
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(bin_data_1),
    .wr_en(bin_val_1),
    .rd_en(network_rdy_1),
    .dout(network_data_1),
    .full(fifo1_full),
    .valid(network_val_1),
    .empty(network_empty_1)
);

a_fifo_w64 fifo_2(
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(bin_data_2),
    .wr_en(bin_val_2),
    .rd_en(network_rdy_2),
    .dout(network_data_2),
    .full(fifo2_full),
    .valid(network_val_2),
    .empty(network_empty_2)
);



a_fifo_w64 fifo_3(
    .rst(rst),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(bin_data_3),
    .wr_en(bin_val_3),
    .rd_en(network_rdy_3),
    .dout(network_data_3),
    .full(fifo3_full),
    .valid(network_val_3),
    .empty(network_empty_3)
);

always @(posedge rd_clk) begin
    if(rst) begin
        serial_buffer_data [0] <= 16'd0;
        serial_buffer_data [1] <= 16'd0;
        serial_buffer_data [2] <= 16'd0;
        serial_buffer_data [3] <= 16'd0;
        serial_buffer_channel <= 2'd0;
        serial_buffer_data_counter = 2'b11;
    end
    else begin
        if( channel_to_serial_buffer != 0 && serial_buffer_data_counter == 2'b11) begin
            
            serial_buffer_data[0] <= data_to_serial_buffer[15:0];
            serial_buffer_data[1] <= data_to_serial_buffer[31:16];
            serial_buffer_data[2] <= data_to_serial_buffer[47:32];
            serial_buffer_data[3] <= data_to_serial_buffer[63:48];
            serial_buffer_channel <= channel_to_serial_buffer;

            serial_buffer_data_counter <= serial_buffer_data_counter + 2'b01;
        end
        else if( data_channel != 0 && serial_buffer_data_counter != 2'b11) begin
            serial_buffer_data_counter <= serial_buffer_data_counter + 2'b01;
        end
        else begin
            serial_buffer_data_counter <= 2'b11;
            serial_buffer_channel <= channel_to_serial_buffer;
        end


    end


end 

endmodule
