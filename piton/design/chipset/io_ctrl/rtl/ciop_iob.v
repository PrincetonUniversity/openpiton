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
//  Last Modified : 2017-02-23 18:20:19
//  Revision      :
//  Author        : Alexey Lavrov
//  Company       : Princeton University
//  Email         : alavrov@princeton.edu
//
//  Description   : simple controller for IOB for PITON proto
//
//
//==================================================================================================

`include "define.tmp.h"

module ciop_iob (
    input                               chip_clk,
    input                               fpga_clk,
    input                               rst_n,

    `ifdef PITON_PICO_HET
    input                               core_select,
    `endif                 

    input                               noc1_in_val,
    input [`NOC_DATA_WIDTH-1:0]         noc1_in_data,
    output reg                          noc1_in_rdy,

    output                              noc2_out_val,
    output reg [`NOC_DATA_WIDTH-1:0]        noc2_out_data,
    input                               noc2_out_rdy,

    input                               noc3_in_val,
    input [`NOC_DATA_WIDTH-1:0]         noc3_in_data,
    output wire                         noc3_in_rdy,

    input                               noc2_in_val,
    input [`NOC_DATA_WIDTH-1:0]         noc2_in_data,
    output reg                          noc2_in_rdy,

    output                              noc3_out_val,
    output [`NOC_DATA_WIDTH-1:0]        noc3_out_data,
    input                               noc3_out_rdy,

    input                               uart_interrupt,
    input                               net_interrupt
);

// trin: wait time for SRAMs to initialize
// 64KB L2 is the bottleneck, requiring 4096 cycles to clear
// 128KB..8K cycles
// 256KB..16K cycles
// ...
   parameter OK_IOB_CNT = 40000; // trin: should be long enough for 512KB L2 (per-tile)


wire                    ok_iob;
reg     [31:0]          ok_iob_cnt;

assign noc3_in_rdy = 1'b1;
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
reg  [1:0]          net_flit_cnt;
reg  [1:0]          uart_flit_cnt;

`ifdef PITON_PICO_HET
assign iob_buffer_flit1     = core_select ? 64'h0000_0400_0048_4000 : 64'h0000_0000_0048_4000;
`else
assign iob_buffer_flit1     = 64'h0000_0000_0048_4000;
`endif

assign iob_buffer_flit2     = 64'h0000_0000_0001_0001;

reg                 ok_iob_sent;
// Ethernet interrupt packets (use same first packet as wake up)
wire [63:0]         iob_buffer_net_flit2;
reg                 pending_net_interrupt;
reg                 net_interrupt_in_prog;
reg                 prev_net_interrupt;
reg                 buf_prev_net_int;
   
// UART interrupt packets (use same first packet as wake up)
wire [63:0]         iob_buffer_uart_flit2;
reg                 pending_uart_interrupt;
reg                 uart_interrupt_in_prog;
reg                 prev_uart_interrupt;
reg                 buf_prev_uart_int;
   

//0x1d = 29 = VECINTR_SNET
assign iob_buffer_net_flit2 = 64'h0000_0000_0000_001d;
//0x1c = 28 = VECINTR_CONSOLE
assign iob_buffer_uart_flit2 = 64'h0000_0000_0000_001c;
   
always @(posedge fpga_clk) begin
    if (~rst_n) begin
        flit_cnt <= 2'b0;
        // Ethernet
        net_flit_cnt <= 2'b0;
        pending_net_interrupt <= 1'b0;
        net_interrupt_in_prog <= 1'b0;
        // UART
        uart_flit_cnt <= 2'b0;
        pending_uart_interrupt <= 1'b0;
        uart_interrupt_in_prog <= 1'b0;
    end
    else if (~ok_iob_sent) begin
        flit_cnt <= noc2_out_val & noc2_out_rdy ? flit_cnt + 1 : flit_cnt;
    end 
    else begin
        flit_cnt <= flit_cnt;
`ifdef PITON_FPGA_ETHERNETLITE
        if (pending_net_interrupt & ~uart_interrupt_in_prog) begin
            net_flit_cnt <= 2'b0; 
            pending_net_interrupt <= 1'b0;
            net_interrupt_in_prog <= 1'b1;
        end
        else if (!buf_prev_net_int & net_interrupt) begin
            pending_net_interrupt <= 1'b1;
        end
        else if (net_interrupt_in_prog & (net_flit_cnt < FLIT_TO_SEND)) begin             
            net_flit_cnt <= noc2_out_val & noc2_out_rdy ? net_flit_cnt + 1 : net_flit_cnt;
        end else if (net_interrupt_in_prog & (net_flit_cnt == FLIT_TO_SEND)) begin
            net_interrupt_in_prog <= 1'b0;
        end     
`endif
`ifdef PITON_UART_INTR
        if (pending_uart_interrupt & ~net_interrupt_in_prog) begin
            uart_flit_cnt <= 2'b0; 
            pending_uart_interrupt <= 1'b0;
            uart_interrupt_in_prog <= 1'b1;
        end
        else if (!buf_prev_uart_int & uart_interrupt) begin
            pending_uart_interrupt <= 1'b1;
        end
        else if (uart_interrupt_in_prog & (uart_flit_cnt < FLIT_TO_SEND)) begin             
            uart_flit_cnt <= noc2_out_val & noc2_out_rdy ? uart_flit_cnt + 1 : uart_flit_cnt;
        end else if (uart_interrupt_in_prog & (uart_flit_cnt == FLIT_TO_SEND)) begin
            uart_interrupt_in_prog <= 1'b0;
        end     
`endif
    end
end

   
always @(posedge fpga_clk) begin
    if (~rst_n) begin
       prev_net_interrupt <= 1'b0;
       buf_prev_net_int <= 1'b0;
       prev_uart_interrupt <= 1'b0;
       buf_prev_uart_int <= 1'b0;
       iob_buffer_val = 1'b0;
    end
    else begin
       prev_net_interrupt <= net_interrupt;
       buf_prev_net_int <= prev_net_interrupt;
       prev_uart_interrupt <= uart_interrupt;
       buf_prev_uart_int <= prev_uart_interrupt;
       iob_buffer_val <= ok_iob;
    end
end

assign noc2_out_val = iob_buffer_val & (((flit_cnt < FLIT_TO_SEND) && !ok_iob_sent)
`ifdef PITON_FPGA_ETHERNETLITE
                    || (ok_iob_sent & net_interrupt_in_prog & (net_flit_cnt < FLIT_TO_SEND))
`endif
`ifdef PITON_UART_INTR
                    || (ok_iob_sent & uart_interrupt_in_prog & (uart_flit_cnt < FLIT_TO_SEND))
`endif
                    );

always @(*) begin
    if (!ok_iob_sent) begin
        if(flit_cnt == 2'b0) begin
            noc2_out_data = iob_buffer_flit1;
        end else if (flit_cnt == 2'b1) begin
            noc2_out_data = iob_buffer_flit2;
        end 
        else begin
            noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
        end
    end 
    else begin
`ifdef PITON_FPGA_ETHERNETLITE
        if (net_interrupt_in_prog) begin
            if(net_flit_cnt == 2'b0) begin
                noc2_out_data = iob_buffer_flit1;
            end else if (net_flit_cnt == 2'b1) begin
                noc2_out_data = iob_buffer_net_flit2;
            end
            else begin
                noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
            end
        end
`ifndef PITON_UART_INTR
        else begin
            noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
        end
`endif
`endif

`ifdef PITON_FPGA_ETHERNETLITE
`ifdef PITON_UART_INTR
    // Make the uart_ one an else if in the case they're both defined
        else
`endif
`endif

`ifdef PITON_UART_INTR
        if (uart_interrupt_in_prog) begin
            if(uart_flit_cnt == 2'b0) begin
                noc2_out_data = iob_buffer_flit1;
            end else if (uart_flit_cnt == 2'b1) begin
                noc2_out_data = iob_buffer_uart_flit2;
            end
            else begin
                noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
            end
        end
`ifndef PITON_FPGA_ETHERNETLITE
        else begin
            noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
        end
`endif
`endif

`ifdef PITON_FPGA_ETHERNETLITE
`ifdef PITON_UART_INTR
        else begin
            noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
        end
`endif
`endif

`ifndef PITON_FPGA_ETHERNETLITE
`ifndef PITON_UART_INTR
        noc2_out_data =  {`NOC_DATA_WIDTH{1'b0}};
`endif
`endif
    end
end

// Note when ok_iob finishes sending both packets
// ok_iob_sent could technically be a wire fed by flit_cnt?
always @(posedge fpga_clk) begin
    if (~rst_n) begin
        ok_iob_sent <= 1'b0;
    end
    else if (flit_cnt == FLIT_TO_SEND) begin
       ok_iob_sent <= 1'b1;
    end
end

// noc data out is sent on chip_clk



// reset flit_cnt when an interrupt occurs


// from Alexey: never leave unconnected outputs!
assign noc3_out_val     = 1'b0;
assign noc3_out_data    = {`NOC_DATA_WIDTH{1'b0}};

endmodule
