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
 * Module encapsulates the off chip receive interface for networks 
 * 1, 2 and 3. packets received are 64 bits wide, received in 2 
 * 32-bit payloads.
 *
 *******************************************************************/

`timescale 1ns/1ps

module chip_bridge_in (
    rst, 
    wr_clk,
    rd_clk,
    async_mux,
    bout_data_1,
    bout_val_1,
    bout_rdy_1,
    bout_data_2,
    bout_val_2,
    bout_rdy_2,
    bout_data_3,
    bout_val_3,
    bout_rdy_3,
    data_from_fpga,
    data_channel,
    credit_to_fpga
); 

input rst;
input wr_clk;
input rd_clk;
input async_mux;
input bout_rdy_1;
input bout_rdy_2;
input bout_rdy_3;
input [31:0] data_from_fpga;
input [ 1:0] data_channel;

output [63:0]   bout_data_1;
output          bout_val_1;
output [63:0]   bout_data_2;
output          bout_val_2;
output [63:0]   bout_data_3;
output          bout_val_3;
output [2:0]    credit_to_fpga;


wire [63:0] async_bout_data_1;
wire [63:0] async_bout_data_2;
wire [63:0] async_bout_data_3;

wire [63:0] sync_bout_data_1;
wire [63:0] sync_bout_data_2;
wire [63:0] sync_bout_data_3;

wire sort_rdy_1;
wire sort_rdy_2;
wire sort_rdy_3;


wire [63:0] sort_data_1;
wire [63:0] sort_data_2;
wire [63:0] sort_data_3;

wire sort_val_1;
wire sort_val_2;
wire sort_val_3;

wire fifo1_empty;
wire fifo2_empty;
wire fifo3_empty;

wire async_fifo1_empty;
wire async_fifo2_empty;
wire async_fifo3_empty;

wire sync_fifo1_empty;
wire sync_fifo2_empty;
wire sync_fifo3_empty;


wire fifo1_full;
wire fifo2_full;
wire fifo3_full;
wire credit_fifo_full;

wire async_fifo1_full;
wire async_fifo2_full;
wire async_fifo3_full;
wire async_credit_fifo_full;

wire sync_fifo1_full;
wire sync_fifo2_full;
wire sync_fifo3_full;
wire sync_credit_fifo_full;

assign bout_val_1 = ~fifo1_empty & ~credit_fifo_full;
assign bout_val_2 = ~fifo2_empty & ~credit_fifo_full;
assign bout_val_3 = ~fifo3_empty & ~credit_fifo_full;


reg [31:0] channel_buffer;
reg [0:0]  channel_buffer_count;
wire [63:0] buffered_data;
reg [1:0] buffered_channel;


/*********************************************************
//credit FIFO boot system
*********************************************************/

assign sort_data_1 = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_2 = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_3 = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;


assign sort_val_1  = (buffered_channel == 2'b01 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_2  = (buffered_channel == 2'b10 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_3  = (buffered_channel == 2'b11 && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;

/*********************************************************
//buffer broken up flits
*********************************************************/
assign buffered_data = {data_from_fpga, channel_buffer};

always @(posedge wr_clk) begin
    if(rst) begin
        channel_buffer <= 32'd0;
        channel_buffer_count <= 0;
    end
    else begin
        if(data_channel != 0) begin //do not store data if no channel is assigned
            channel_buffer <= data_from_fpga;
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

async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_1(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_1 & ~credit_fifo_full & async_mux),
    .wval(sort_val_1 & async_mux),
    .wdata(sort_data_1),
    .rdata(async_bout_data_1),
    .wfull(async_fifo1_full), //credit system should prevent this from ever being full
    .rempty(async_fifo1_empty)
);

async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_2(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_2 & ~credit_fifo_full & async_mux),
    .wval(sort_val_2 & async_mux),
    .wdata(sort_data_2),
    .rdata(async_bout_data_2),
    .wfull(async_fifo2_full), //credit system should prevent this from ever being full
    .rempty(async_fifo2_empty)
);



async_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
async_fifo_3(
    .rreset(rst),
    .wreset(rst),
    .wclk(wr_clk),
    .rclk(rd_clk),
    .ren(bout_rdy_3 & ~credit_fifo_full & async_mux),
    .wval(sort_val_3 & async_mux),
    .wdata(sort_data_3),
    .rdata(async_bout_data_3),
    .wfull(async_fifo3_full), //credit system should prevent this from ever being full
    .rempty(async_fifo3_empty)
);

sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_1(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_1 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_1 & ~async_mux),
    .wdata(sort_data_1),
    .rdata(sync_bout_data_1),
    .full(sync_fifo1_full), //credit system should prevent this from ever being full
    .empty(sync_fifo1_empty)
);

sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_2(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_2 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_2 & ~async_mux),
    .wdata(sort_data_2),
    .rdata(sync_bout_data_2),
    .full(sync_fifo2_full), //credit system should prevent this from ever being full
    .empty(sync_fifo2_empty)
);



sync_fifo #(
.DSIZE(64),
.ASIZE(5),
.MEMSIZE(16) )
sync_fifo_3(
    .reset(rst),
    .clk(wr_clk),
    .ren(bout_rdy_3 & ~credit_fifo_full & ~async_mux),
    .wval(sort_val_3 & ~async_mux),
    .wdata(sort_data_3),
    .rdata(sync_bout_data_3),
    .full(sync_fifo3_full), //credit system should prevent this from ever being full
    .empty(sync_fifo3_empty)
);

assign fifo1_full = async_mux ? async_fifo1_full : sync_fifo1_full;
assign fifo2_full = async_mux ? async_fifo2_full : sync_fifo2_full;
assign fifo3_full = async_mux ? async_fifo3_full : sync_fifo3_full;

assign fifo1_empty = async_mux ? async_fifo1_empty : sync_fifo1_empty;
assign fifo2_empty = async_mux ? async_fifo2_empty : sync_fifo2_empty;
assign fifo3_empty = async_mux ? async_fifo3_empty : sync_fifo3_empty;

assign bout_data_1 = async_mux ? async_bout_data_1 : sync_bout_data_1;
assign bout_data_2 = async_mux ? async_bout_data_2 : sync_bout_data_2;
assign bout_data_3 = async_mux ? async_bout_data_3 : sync_bout_data_3;


/*********************************************************
//credit FIFO
*********************************************************/

wire [2:0] credit_gather;
wire credit_empty;
wire async_credit_empty;
wire sync_credit_empty;

wire [2:0] credit_fifo_out;
wire [2:0] async_credit_fifo_out;
wire [2:0] sync_credit_fifo_out;

reg  [2:0] credit_to_fpga_r;

//FIFO used for bridging credits between clock domains

async_fifo #(
.DSIZE(3),
.ASIZE(5),
.MEMSIZE(16) )
async_credit_fifo(
    .rreset(rst),
    .wreset(rst),
    .wclk(rd_clk),
    .rclk(wr_clk),
    .ren(~rst & async_mux),
    .wval(~(rst) & (| credit_gather) & async_mux),
    .wdata(credit_gather),
    .rdata(async_credit_fifo_out),
    .wfull(async_credit_fifo_full),   
    .rempty(async_credit_empty)
);

sync_fifo #(
.DSIZE(3),
.ASIZE(5),
.MEMSIZE(16) )
sync_credit_fifo(
    .reset(rst),
    .clk(wr_clk),
    .ren(~rst & ~async_mux),
    .wval(~(rst) & (| credit_gather) & ~async_mux),
    .wdata(credit_gather),
    .rdata(sync_credit_fifo_out),
    .full(sync_credit_fifo_full),   
    .empty(sync_credit_empty)
);

assign credit_fifo_out = async_mux ? async_credit_fifo_out : sync_credit_fifo_out;
assign credit_fifo_full = async_mux ? async_credit_fifo_full : sync_credit_fifo_full;
assign credit_empty = async_mux ? async_credit_empty: sync_credit_empty;

assign credit_to_fpga = credit_to_fpga_r;

assign credit_gather[0] = bout_rdy_1 & bout_val_1;
assign credit_gather[1] = bout_rdy_2 & bout_val_2;
assign credit_gather[2] = bout_rdy_3 & bout_val_3;

/****************************************************
 channel side sequential logic 
 ****************************************************/
always@(posedge wr_clk) begin
   if(rst) begin
        credit_to_fpga_r <= 3'b000;       
   end
   else begin
       if(~credit_empty) begin 
           credit_to_fpga_r <= credit_fifo_out;
       end
       else
           credit_to_fpga_r <= 3'b000;       
   end 
end

endmodule

