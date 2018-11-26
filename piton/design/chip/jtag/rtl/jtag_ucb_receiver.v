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
//==================================================================================================
//  Filename      : jtag_ucb_receiver.v
//  Created On    : 2014- 12:52:57
//  Revision      :
//  Author        : Tri Nguyen
//  Company       : Princeton University
//  Email         : trin@princeton.edu
//
//  Description   : 
//==================================================================================================

`include "define.tmp.h"
`include "jtag.vh"

`ifdef L15_EXTRA_DEBUG
`default_nettype none
`endif

// Receives and assembles UCB packets from the RTAP modules in the tiles
// Each tiles has an individual UCB bus to the JTAG module because we wouldn't
//  want to have a tri-state bus
//  nor requiring big buffer at the transmitter to drive the bus all over the chip


module jtag_ucb_receiver(
    input wire clk,
    input wire rst_n,

    // CTAP
    output reg ctap_ucb_rx_val,
    output reg [`CTAP_UCB_PACKET_WIDTH-1:0] ctap_ucb_rx_data,
    // input wire ctap_ucb_rx_rdy,

    // from tiles
    input wire tiles_jtag_ucb_val,
    input wire [`UCB_BUS_WIDTH-1:0] tiles_jtag_ucb_data
    // output wire tiles_jtag_ucb_stall
    );

// trin notes:
// no back pressure from the core for now
// upon valid from any core, packet is copied into a single buffer in CTAP
// 1. stall_a1 is intentionally set to 1'b0
wire tiles_val;
wire [`CTAP_UCB_PACKET_WIDTH-1:0] tiles_data;
ucb_bus_in #(`UCB_BUS_WIDTH, `CTAP_UCB_PACKET_WIDTH-64) ucb_in_tiles(
    .vld(tiles_jtag_ucb_val),
    .data(tiles_jtag_ucb_data),
    .stall(),
    .clk(clk),
    .rst_l(rst_n),
    .indata_buf_vld(tiles_val),
    .indata_buf(tiles_data),
    .stall_a1(1'b0)
    );

// input mux
always @ *
begin
    ctap_ucb_rx_val = tiles_val;

    ctap_ucb_rx_data = `UCB_BUS_WIDTH'b0;
    if (tiles_val)
        ctap_ucb_rx_data = tiles_data;
end

endmodule

