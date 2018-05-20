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
 * Module encapsulates the chip to fpga receive interface for networks 
 * 1, 2 and 3. packets received are 64 bits wide, received in 4 
 * 16-bit payloads.
 *
 *******************************************************************/



`timescale 1ns/1ps

module fpga_bridge_rcv_16 (
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
input [15:0] data_from_chip;
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

reg [15:0] channel_buffer [3:0];
reg [1:0]  channel_buffer_count;
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

assign sort_data_1 = (buffered_channel == 2'b01 && channel_buffer_count == 2'b11) ? buffered_data : 64'd0;
assign sort_data_2 = (buffered_channel == 2'b10 && channel_buffer_count == 2'b11) ? buffered_data : 64'd0;
assign sort_data_3 = (buffered_channel == 2'b11 && channel_buffer_count == 2'b11) ? buffered_data : 64'd0;


assign sort_val_1  = (buffered_channel == 2'b01 && channel_buffer_count == 2'b11) ? 1'b1 : 1'b0;
assign sort_val_2  = (buffered_channel == 2'b10 && channel_buffer_count == 2'b11) ? 1'b1 : 1'b0;
assign sort_val_3  = (buffered_channel == 2'b11 && channel_buffer_count == 2'b11) ? 1'b1 : 1'b0;

/*********************************************************
//buffer broken up flits
*********************************************************/
assign buffered_data = {data_from_chip, channel_buffer[2], channel_buffer[1], channel_buffer[0]};

always @(posedge wr_clk) begin
    if(rst) begin
        channel_buffer[0] <= 16'd0;
        channel_buffer[1] <= 16'd0;
        channel_buffer[2] <= 16'd0;
        channel_buffer[3] <= 16'd0;
        channel_buffer_count <= 0;
    end
    else begin
        if(data_channel != 0) begin //do not store data if no channel is assigned
            channel_buffer[channel_buffer_count] <= data_from_chip;
            buffered_channel <= data_channel;
            channel_buffer_count <= channel_buffer_count + 2'b01;
        end
        else begin
            buffered_channel <= data_channel;
            channel_buffer_count <= 2'b00;
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

a_fifo_w64 fifo_1(
    .rst(rst_d1),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(sort_data_1),
    .wr_en(sort_val_1),
    .rd_en(bout_rdy_1 & ~credit_fifo_full),
    .dout(bout_data_1),
    .full(fifo1_full),
    .valid(bout_val_pre1),
    .empty()
);


always @ (posedge rd_clk)
begin
    if (rst)
    begin
        bout_val_buf1 <= 1'b0;
    end
    else if (bout_val_pre1 && ~(bout_rdy_1 & ~credit_fifo_full))
    begin
        bout_val_buf1 <= 1'b1;
    end
    else if (~bout_val_pre1 && (bout_rdy_1 & ~credit_fifo_full))
    begin
        bout_val_buf1 <= 1'b0;
    end
    else
    begin
        bout_val_buf1 <= bout_val_buf1;
    end
end

assign bout_val_1 = bout_val_buf1 | bout_val_pre1;


a_fifo_w64 fifo_2(
    .rst(rst_d1),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(sort_data_2),
    .wr_en(sort_val_2),
    .rd_en(bout_rdy_2 & ~credit_fifo_full),
    .dout(bout_data_2),
    .full(fifo2_full),
    .valid(bout_val_pre2),
    .empty()
);

always @ (posedge rd_clk)
begin
    if (rst)
    begin
        bout_val_buf2 <= 1'b0;
    end
    else if (bout_val_pre2 && ~(bout_rdy_2 & ~credit_fifo_full))
    begin
        bout_val_buf2 <= 1'b1;
    end
    else if (~bout_val_pre2 && (bout_rdy_2 & ~credit_fifo_full))
    begin
        bout_val_buf2 <= 1'b0;
    end
    else
    begin
        bout_val_buf2 <= bout_val_buf2;
    end
end

assign bout_val_2 = bout_val_buf2 | bout_val_pre2;


a_fifo_w64 fifo_3(
    .rst(rst_d1),
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .din(sort_data_3),
    .wr_en(sort_val_3),
    .rd_en(bout_rdy_3 & ~credit_fifo_full),
    .dout(bout_data_3),
    .full(fifo3_full),
    .valid(bout_val_pre3),
    .empty()
);

always @ (posedge rd_clk)
begin
    if (rst)
    begin
        bout_val_buf3 <= 1'b0;
    end
    else if (bout_val_pre3 && ~(bout_rdy_3 & ~credit_fifo_full))
    begin
        bout_val_buf3 <= 1'b1;
    end
    else if (~bout_val_pre3 && (bout_rdy_3 & ~credit_fifo_full))
    begin
        bout_val_buf3 <= 1'b0;
    end
    else
    begin
        bout_val_buf3 <= bout_val_buf3;
    end
end

assign bout_val_3 = bout_val_buf3 | bout_val_pre3;



/*********************************************************
//credit FIFO
*********************************************************/

wire [2:0] credit_gather;
wire credit_val;
wire [2:0] credit_fifo_out;

reg  [2:0] credit_to_chip_r;

//FIFO used for bridging credits between clock domains
a_fifo_w3 credit_fifo(
    .rst(rst_d1),
    .wr_clk(rd_clk),
    .rd_clk(wr_clk),
    .din(credit_gather),
    .wr_en(~(rst | rst_d0) & (| credit_gather)),               //tied to 1
    .rd_en(~(rst | rst_d0)),               //tied to 1
    .dout(credit_fifo_out),
    .full(credit_fifo_full),                    
    .valid(credit_val),
    .empty()
);

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
