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

//==================================================================================================
//  Filename      : mig_async_fifo.v
//  Created On    : 2015-08-25
//  Revision      :
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : Async FIFO between MIG user interface and FPGA for converting clock
//  TODO          : change wires names *_splitter to more common
//
//==================================================================================================



// *_in_*_1 --> *out_*_2
// *_out_*_1 <-- *_in_*_2
module noc_bidir_afifo (

    input wire          clk_1,
    input wire          rst_1,
    
    input wire          clk_2,
    input wire          rst_2,
    
    // Request direction
    input wire          flit_in_val_1,
    input wire [63:0]   flit_in_data_1,
    output wire         flit_in_rdy_1,

    output wire         flit_out_val_2,
    output wire [63:0]  flit_out_data_2,
    input wire          flit_out_rdy_2,
    
    // Response direction
    input wire          flit_in_val_2,
    input wire [63:0]   flit_in_data_2,
    output wire         flit_in_rdy_2,

    output wire         flit_out_val_1,
    output wire [63:0]  flit_out_data_1,
    input wire          flit_out_rdy_1
);

wire fifo_recv_full;
wire fifo_recv_empty;
reg  fifo_recv_empty_reg;
wire fifo_send_full;
wire fifo_send_empty;
reg  fifo_send_empty_reg;
wire    [63:0]  fifo_data_to_splitter;
wire            fifo_recv_rd_en;
reg             outreg_empty;



afifo_w64_d128_std async_fifo_recv(
    .rst(rst_1),
    .wr_clk(clk_2),
    .rd_clk(clk_1),
    .rd_en(fifo_recv_rd_en),
    .wr_en(flit_in_val_2),
    .din(flit_in_data_2),
    .dout(fifo_data_to_splitter),   // data: 1 cycle delay after rd_en
    .full(fifo_recv_full),
    .empty(fifo_recv_empty)
);

afifo_w64_d128_std async_fifo_send(
    .rst(rst_2),
    .wr_clk(clk_1),
    .rd_clk(clk_2),
    .rd_en(flit_out_rdy_2),
    .wr_en(flit_in_val_1),
    .din(flit_in_data_1),
    .dout(flit_out_data_2),     // data: 1 cycle delay after rd_en
    .full(fifo_send_full),
    .empty(fifo_send_empty)
);

assign flit_in_rdy_1 = ~fifo_send_full;
assign flit_in_rdy_2 = ~fifo_recv_full;

always @ (posedge clk_1)
    fifo_recv_empty_reg <= fifo_recv_empty;

always @ (posedge clk_2)
begin
    if (rst_2)
    begin
        fifo_send_empty_reg <= 1'b1;
    end
    else
    begin
        if (flit_out_rdy_2)
        begin
            fifo_send_empty_reg <= fifo_send_empty;  
        end
        else
        begin
            fifo_send_empty_reg <= fifo_send_empty_reg;  
        end
    end
end

// New stuff

always @(posedge clk_1) begin
    if (rst_1)
        outreg_empty <= 1'b1;
    else
        outreg_empty <= fifo_recv_rd_en                                     ? 1'b0 :
                        ~outreg_empty & flit_out_rdy_1 & ~fifo_recv_rd_en   ? 1'b1 : outreg_empty;
end

assign fifo_recv_rd_en = ~fifo_recv_empty & (outreg_empty | (~outreg_empty & flit_out_rdy_1));
assign flit_out_val_1 = ~outreg_empty;
assign flit_out_data_1 = fifo_data_to_splitter;


assign flit_out_val_2 = ~fifo_send_empty_reg;

endmodule
