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
//  Filename      : rtap_ucb_receiver.v
//  Created On    : 2014- 12:52:57
//  Last Modified : 2018-11-16 17:23:14
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

module rtap_ucb_receiver(
    input wire clk,
    input wire rst_n,

    // RTAP
    output wire ucb_rx_val,
    output wire [`CTAP_UCB_PACKET_WIDTH-1:0] ucb_rx_data,
    // input wire ctap_ucb_rx_rdy,

    // from CTAP
    input wire ucb_in_vld,
    // output wire ucb_in_stall
    input wire [`UCB_BUS_WIDTH-1:0] ucb_in_data
    );

// trin notes:
// no back pressure from the core for now
// upon valid from any core, packet is copied into a single buffer in CTAP
// 1. stall_a1 is intentionally set to 1'b0
ucb_bus_in #(`UCB_BUS_WIDTH, `CTAP_UCB_PACKET_WIDTH-64) ucb_in_tile0(
    .vld(ucb_in_vld),
    .data(ucb_in_data),
    .stall(),
    .clk(clk),
    .rst_l(rst_n),
    .indata_buf_vld(ucb_rx_val),
    .indata_buf(ucb_rx_data),
    .stall_a1(1'b0)
    );

endmodule

