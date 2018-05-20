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
    credit_rd_clk,
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
input credit_rd_clk;
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

reg [31:0] data_from_chip_f /* synthesis iob = true */;
reg  [1:0] data_channel_f /* synthesis iob = true */;
reg [31:0] data_from_chip_ff; // Buffering these for timing
reg  [1:0] data_channel_ff; // Buffering  these for timing
reg [31:0] data_from_chip_fff; // Buffering these for timing
reg  [1:0] data_channel_fff; // Buffering  these for timing

reg [31:0] channel_buffer;
reg [0:0]  channel_buffer_count;
wire [63:0] buffered_data;
reg [1:0] buffered_channel;

reg wr_rst_f;
reg wr_rst_ff;
reg rd_rst_f;
reg rd_rst_ff;
reg credit_rd_rst_f;
reg credit_rd_rst_ff;

// assume reset is asynchronous, synchronize
always @ (posedge wr_clk)
begin
    wr_rst_f <= rst;
    wr_rst_ff <= wr_rst_f;
end

always @ (posedge rd_clk)
begin
    rd_rst_f <= rst;
    rd_rst_ff <= rd_rst_f;
end

always @ (posedge credit_rd_clk)
begin
    credit_rd_rst_f <= rst;
    credit_rd_rst_ff <= credit_rd_rst_f;
end

assign sort_data_1 = (buffered_channel == 2'b01 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_2 = (buffered_channel == 2'b10 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;
assign sort_data_3 = (buffered_channel == 2'b11 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? buffered_data : 64'd0;


assign sort_val_1  = (buffered_channel == 2'b01 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_2  = (buffered_channel == 2'b10 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;
assign sort_val_3  = (buffered_channel == 2'b11 && buffered_channel == data_channel_fff && channel_buffer_count == 1'b1) ? 1'b1 : 1'b0;

/*********************************************************
//buffer broken up flits
*********************************************************/
assign buffered_data = {data_from_chip_fff, channel_buffer};

always @(posedge wr_clk) begin
    data_from_chip_f <= data_from_chip;
    data_from_chip_ff <= data_from_chip_f;
    data_from_chip_fff <= data_from_chip_ff;
end
always @(posedge wr_clk) begin
    if(wr_rst_ff) begin
        buffered_channel <= 2'd0;
        channel_buffer_count <= 0;
        data_channel_f <= 2'd0;
        data_channel_ff <= 2'd0;
        data_channel_fff <= 2'd0;
    end
    else begin
        if(!channel_buffer_count && data_channel_fff != 0) begin //do not store data if no channel is assigned
            channel_buffer <= data_from_chip_fff;
            buffered_channel <= data_channel_fff;
            channel_buffer_count <= channel_buffer_count + 1'b1;
        end
        else if (channel_buffer_count && buffered_channel == data_channel_fff) begin
            channel_buffer_count <= 1'b0;
            buffered_channel <= 2'b00;
        end
        data_channel_f <= data_channel;
        data_channel_ff <= data_channel_f;
        data_channel_fff <= data_channel_ff;
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

//data is read out a cycle later after the rd_en signal, so the interface is differd_ent than val/rdy


wire fifo1_empty;

`ifdef PITON_FPGA_SYNTH
    afifo_w64  async_fifo_1(
        .rst(rst),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rd_en(bout_rdy_1 & ~credit_fifo_full),
        .wr_en(sort_val_1),
        .din(sort_data_1),
        .dout(bout_data_1),
        .full(fifo1_full), //credit system should prevent this from ever being full
        .empty(fifo1_empty)
    );
`else
    async_fifo #(
    .DSIZE(64),
    .ASIZE(9),
    .MEMSIZE(256) )
    async_fifo_1(
        .rreset(rd_rst_ff),
        .wreset(wr_rst_ff),
        .wclk(wr_clk),
        .rclk(rd_clk),
        .ren(bout_rdy_1 & ~credit_fifo_full),
        .wval(sort_val_1),
        .wdata(sort_data_1),
        .rdata(bout_data_1),
        .wfull(fifo1_full), //credit system should prevent this from ever being full
        .rempty(fifo1_empty)
    );
`endif


assign bout_val_1 = ~fifo1_empty & ~credit_fifo_full;


wire fifo2_empty;

`ifdef PITON_FPGA_SYNTH
    afifo_w64 async_fifo_2(
        .rst(rst),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rd_en(bout_rdy_2 & ~credit_fifo_full),
        .wr_en(sort_val_2),
        .din(sort_data_2),
        .dout(bout_data_2),
        .full(fifo2_full), //credit system should prevent this from ever being full
        .empty(fifo2_empty)
    );
`else
    async_fifo #(
    .DSIZE(64),
    .ASIZE(9),
    .MEMSIZE(256) )
    async_fifo_2(
        .rreset(rd_rst_ff),
        .wreset(wr_rst_ff),
        .wclk(wr_clk),
        .rclk(rd_clk),
        .ren(bout_rdy_2 & ~credit_fifo_full),
        .wval(sort_val_2),
        .wdata(sort_data_2),
        .rdata(bout_data_2),
        .wfull(fifo2_full), //credit system should prevent this from ever being full
        .rempty(fifo2_empty)
    );
`endif


assign bout_val_2 = ~fifo2_empty & ~credit_fifo_full;

wire fifo3_empty;

`ifdef PITON_FPGA_SYNTH
    afifo_w64 async_fifo_3(
        .rst(rst),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rd_en(bout_rdy_3 & ~credit_fifo_full),
        .wr_en(sort_val_3),
        .din(sort_data_3),
        .dout(bout_data_3),
        .full(fifo3_full), //credit system should prevent this from ever being full
        .empty(fifo3_empty)
    );
`else
    async_fifo #(
    .DSIZE(64),
    .ASIZE(9),
    .MEMSIZE(256) )
    async_fifo_3(
        .rreset(rd_rst_ff),
        .wreset(wr_rst_ff),
        .wclk(wr_clk),
        .rclk(rd_clk),
        .ren(bout_rdy_3 & ~credit_fifo_full),
        .wval(sort_val_3),
        .wdata(sort_data_3),
        .rdata(bout_data_3),
        .wfull(fifo3_full), //credit system should prevent this from ever being full
        .rempty(fifo3_empty)
    );
`endif

assign bout_val_3 = ~fifo3_empty & ~credit_fifo_full;




/*********************************************************
//credit FIFO
*********************************************************/

wire [2:0] credit_gather;
wire credit_val;
wire [2:0] credit_fifo_out;

reg  [2:0] credit_to_chip_r /* synthesis iob = true */;

// mmckeown: adding two pipeline register after credit fifo valid signal for timing
reg  [2:0] credit_fifo_out_f;

//FIFO used for bridging credits between clock domains


wire credit_empty;

`ifdef PITON_FPGA_SYNTH
    afifo_w3 async_credit_fifo(
        .rst(rst),
        .wr_clk(rd_clk),
        .rd_clk(credit_rd_clk),
        .rd_en(~credit_rd_rst_ff),
        .wr_en(~rd_rst_ff & (| credit_gather)),
        .din(credit_gather),
        .dout(credit_fifo_out),
        .full(credit_fifo_full),   
        .empty(credit_empty)
    );
`else
    async_fifo #(
    .DSIZE(3),
    .ASIZE(11),
    .MEMSIZE(1024) )
    async_credit_fifo(
        .rreset(credit_rd_rst_ff),
        .wreset(rd_rst_ff),
        .wclk(rd_clk),
        .rclk(credit_rd_clk),
        .ren(~credit_rd_rst_ff),
        .wval(~rd_rst_ff & (| credit_gather)),
        .wdata(credit_gather),
        .rdata(credit_fifo_out),
        .wfull(credit_fifo_full),   
        .rempty(credit_empty)
    );
`endif

assign credit_val = ~ credit_empty;


assign credit_to_chip = credit_to_chip_r;

assign credit_gather[0] = bout_val_1 & bout_rdy_1;
assign credit_gather[1] = bout_val_2 & bout_rdy_2;
assign credit_gather[2] = bout_val_3 & bout_rdy_3;

/****************************************************
 channel side sequential logic 
 ****************************************************/

// mmckeown: adding pipeline register after credit fifo valid signal for timing
always@(posedge credit_rd_clk) begin
   if(credit_rd_rst_ff) begin
        credit_to_chip_r <= 3'b000;
        credit_fifo_out_f <= 3'b000;
   end
   else begin
       credit_to_chip_r <= credit_fifo_out_f;
       if(credit_val) begin 
           credit_fifo_out_f <= credit_fifo_out;
       end
       else
           credit_fifo_out_f <= 3'b000;
   end 
end

endmodule
