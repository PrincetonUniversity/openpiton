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

//==================================================================================================
//  Filename      : ciop_iob.v.xlx.v
//  Created On    : 2014-05-09
//  Last Modified : 2016-08-24 22:21:28
//  Revision      :
//  Author        : Alexey Lavrov
//  Company       : Princeton University
//  Email         : alavrov@princeton.edu
//
//  Description   : simple controller for IOB for PITON proto
//
//
//==================================================================================================


module ciop_iob (
    input                               chip_clk,
    input                               fpga_clk,
    input                               rst_n,

    input                               noc1_in_val,
    input [`NOC_DATA_WIDTH-1:0]         noc1_in_data,
    output reg                          noc1_in_rdy,

    output                              noc2_out_val,
    output [`NOC_DATA_WIDTH-1:0]        noc2_out_data,
    input                               noc2_out_rdy,

    input                               noc2_in_val,
    input [`NOC_DATA_WIDTH-1:0]         noc2_in_data,
    output reg                          noc2_in_rdy,

    output                              noc3_out_val,
    output [`NOC_DATA_WIDTH-1:0]        noc3_out_data,
    input                               noc3_out_rdy,

    input                               uart_interrupt  

);

parameter OK_IOB_CNT = 10000;   // ? Alexey: taken from simulation


wire                    ok_iob;
reg     [31:0]          ok_iob_cnt;


assign  ok_iob = ok_iob_cnt == OK_IOB_CNT;

always @(posedge chip_clk) begin
    if (~rst_n)
        ok_iob_cnt <= 32'b0;
    else
        ok_iob_cnt <= ok_iob ? ok_iob_cnt : ok_iob_cnt + 1'b1 ;
end


// making wake up packet
parameter FLIT_TO_SEND = 2;

wire [63:0]         iob_buffer_flit1;
wire [63:0]         iob_buffer_flit2;
reg                 iob_buffer_val;
reg  [1:0]          flit_cnt;

assign iob_buffer_flit1     = 64'h0000_0000_0048_4000;
assign iob_buffer_flit2     = 64'h0000_0000_0001_0001;

// Hardware interrupt packets (use same first packet as wake up)
wire [63:0]         iob_buffer_uart_flit2;
reg                 pending_uart_interrupt;
reg                 ok_iob_sent;
reg                 prev_uart_interrupt;

//0x1f = 31 = VECINTR_DEV
assign iob_buffer_uart_flit2 = 64'h0000_0000_0001_001f;

always @(posedge fpga_clk) begin
    if (~rst_n) begin
        flit_cnt <= 2'b0;
        pending_uart_interrupt <= 1'b0;
    end
    else if (~ok_iob_sent) begin
        flit_cnt <= noc2_out_val & noc2_out_rdy ? flit_cnt + 1 : flit_cnt;
    end 
`ifdef PITON_UART_INTR 
    else begin
        if (pending_uart_interrupt) begin
            flit_cnt <= 2'b0; 
            pending_uart_interrupt <= 1'b0;
        end else begin             
            flit_cnt <= noc2_out_val & noc2_out_rdy ? flit_cnt + 1 : flit_cnt;
        end 
        if (!pending_uart_interrupt & !prev_uart_interrupt & uart_interrupt)
            pending_uart_interrupt <= 1'b1;
    end
`endif
end

always @(posedge fpga_clk)
    prev_uart_interrupt <= uart_interrupt;

always @(posedge fpga_clk)
    iob_buffer_val <= ok_iob;

assign noc2_out_val = iob_buffer_val & (flit_cnt < FLIT_TO_SEND);

assign noc2_out_data = flit_cnt == 2'b0 ? iob_buffer_flit1 : 
                       flit_cnt == 2'b1 ? 
                           (ok_iob_sent == 1'b0 ? iob_buffer_flit2 : iob_buffer_uart_flit2) 
                           : {`NOC_DATA_WIDTH{1'b0}};

// Note when ok_iob finishes sending both packets
always @(posedge fpga_clk)
    if (~rst_n)
        ok_iob_sent <= 1'b0;
    else
        ok_iob_sent <= (flit_cnt == FLIT_TO_SEND) ? ok_iob_sent + 1 : ok_iob_sent;

// noc data out is sent on chip_clk



// reset flit_cnt when an interrupt occurs


// from Alexey: never leave unconnected outputs!
assign noc3_out_val     = 1'b0;
assign noc3_out_data    = {`NOC_DATA_WIDTH{1'b0}};

endmodule
