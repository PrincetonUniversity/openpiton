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
 * Module encapsulates the chip to fpga receive interface for networks 
 * 1, 2 and 3. packets received are 64 bits wide, received in 2 
 * 32-bit payloads.
 *
 *******************************************************************/



`timescale 1ns/1ps

module fpga_bridge_rcv_32 (
    rst, 
    wr_clk,
    rd_clk,
    bout_data_1,
    bout_val_1,
    bout_rdy_1,
    bout_data_2,
    bout_val_2,
    bout_rdy_2,
    bout_data_3,
    bout_val_3,
    bout_rdy_3,
    data_from_chip,
    data_channel,
    credit_to_chip
); 

input rst;
input wr_clk;
input rd_clk;
input bout_rdy_1;
input bout_rdy_2;
input bout_rdy_3;
input [31:0] data_from_chip;
input [ 1:0] data_channel;

output [63:0]   bout_data_1;
output          bout_val_1;
output [63:0]   bout_data_2;
output          bout_val_2;
output [63:0]   bout_data_3;
output          bout_val_3;
output [2:0]    credit_to_chip;

wire sort_rdy_1;
wire sort_rdy_2;
wire sort_rdy_3;


wire [63:0] sort_data_1;
wire [63:0] sort_data_2;
wire [63:0] sort_data_3;

wire sort_val_1;
wire sort_val_2;
wire sort_val_3;

wire fifo1_full;
wire fifo2_full;
wire fifo3_full;
wire credit_fifo_full;

reg [31:0] channel_buffer;
reg [0:0]  channel_buffer_count;
wire [63:0] buffered_data;
reg [1:0] buffered_channel;

/*********************************************************
//credit FIFO boot system
*********************************************************/
reg rst_d0, rst_d1, rst_d2, rst_d3, rst_d4, rst_d5;

always @(posedge rd_clk) begin
    if(rst) begin
        rst_d0 <= 1;
        rst_d1 <= rst_d2;
        rst_d2 <= rst_d3;
        rst_d3 <= rst_d4;
        rst_d4 <= rst_d5;
        rst_d5 <= 1;
    end
    else begin
        rst_d0 <= rst_d1;
        rst_d1 <= 0;
        rst_d2 <= 0;
        rst_d3 <= 0;
        rst_d4 <= 0;
        rst_d5 <= 0;
    end
end

assign sort_data_1 = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_2 = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_3 = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;


assign sort_val_1  = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_2  = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_3  = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;

/*********************************************************
//buffer broken up flits
*********************************************************/
assign buffered_data = {data_from_chip, channel_buffer};

always @(posedge wr_clk) begin
    if(rst) begin
        channel_buffer <= 32'd0;
        channel_buffer_count <= 0;
    end
    else begin
        if(data_channel != 0) begin //do not store data if no channel is assigned
            channel_buffer <= data_from_chip;
            buffered_channel <= data_channel;
            channel_buffer_count <= channel_buffer_count + 1'b1;
        end
        else begin
            buffered_channel <= data_channel;
            channel_buffer_count <= 1'b0;
        end
    end
end

//input-output fixed to 64 bits
/*********************************************************
//data FIFOs
*********************************************************/

wire          bout_val_pre1;
wire          bout_val_pre2;
wire          bout_val_pre3;
reg           bout_val_buf1;
reg           bout_val_buf2;
reg           bout_val_buf3;

//data is read out a cycle later after the rd_en signal, so the interface is different than val/rdy


wire fifo1_empty;

async_fifo #(
.DSIZE(64),
.ASIZE(9),
.MEMSIZE(256) )
async_fifo_1(
    .rreset(rst_d1),
    .wreset(rst_d1),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_1 & ~credit_fifo_full),
    .wval(sort_val_1),
    .wdata(sort_data_1),
    .rdata(bout_data_1),
    .wfull(fifo1_full), //credit system should prevent this from ever being full
    .rempty(fifo1_empty)
);

assign bout_val_1 = ~fifo1_empty & ~credit_fifo_full;


wire fifo2_empty;

async_fifo #(
.DSIZE(64),
.ASIZE(9),
.MEMSIZE(256) )
async_fifo_2(
    .rreset(rst_d1),
    .wreset(rst_d1),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_2 & ~credit_fifo_full),
    .wval(sort_val_2),
    .wdata(sort_data_2),
    .rdata(bout_data_2),
    .wfull(fifo2_full), //credit system should prevent this from ever being full
    .rempty(fifo2_empty)
);

assign bout_val_2 = ~fifo2_empty & ~credit_fifo_full;

wire fifo3_empty;

async_fifo #(
.DSIZE(64),
.ASIZE(9),
.MEMSIZE(256) )
async_fifo_3(
    .rreset(rst_d1),
    .wreset(rst_d1),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_3 & ~credit_fifo_full),
    .wval(sort_val_3),
    .wdata(sort_data_3),
    .rdata(bout_data_3),
    .wfull(fifo3_full), //credit system should prevent this from ever being full
    .rempty(fifo3_empty)
);

assign bout_val_3 = ~fifo3_empty & ~credit_fifo_full;




/*********************************************************
//credit FIFO
*********************************************************/

wire [2:0] credit_gather;
wire credit_val;
wire [2:0] credit_fifo_out;

reg  [2:0] credit_to_chip_r;

//FIFO used for bridging credits between clock domains


wire credit_empty;

async_fifo #(
.DSIZE(3),
.ASIZE(9),
.MEMSIZE(256) )
async_credit_fifo(
    .rreset(rst_d1),
    .wreset(rst_d1),
    .wclk(rd_clk),
    .rclk(wr_clk),
    .ren(~(rst | rst_d0)),
    .wval(~(rst | rst_d0) & (| credit_gather)),
    .wdata(credit_gather),
    .rdata(credit_fifo_out),
    .wfull(credit_fifo_full),   
    .rempty(credit_empty)
);

assign credit_val = ~ credit_empty;


assign credit_to_chip = credit_to_chip_r;

assign credit_gather[0] = bout_val_1 & bout_rdy_1;
assign credit_gather[1] = bout_val_2 & bout_rdy_2;
assign credit_gather[2] = bout_val_3 & bout_rdy_3;

/****************************************************
 channel side sequential logic 
 ****************************************************/
always@(posedge wr_clk) begin
   if(rst_d1) begin
        credit_to_chip_r <= 3'b000;       
   end
   else begin
       if(credit_val) begin 
           credit_to_chip_r <= credit_fifo_out;
       end
       else
           credit_to_chip_r <= 3'b000;       
   end 
end

endmodule

