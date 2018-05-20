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

// Filename: chip_rst_seq.v
// Author: mmckeown
// Description: Generates chip reset sequence for bootup

module chip_rst_seq(
    input                   clk,
    input                   rst_n,
    input                   ref_clk_locked,
    input                   chip_clk_locked,

    output                  pll_rst_n,
    output                  chip_rst_n,
    output                  jtag_rst_n,

    output                  piton_ready_n   
);

///////////////////////
// Type declarations //
///////////////////////

wire                        piton_ready;

//////////////////////
// Sequential Logic //
//////////////////////

/////////////////////////
// Combinational Logic //
/////////////////////////

// Chip JTAG and JTAG resets can be the same,
// don't see any reason that cannot be
assign jtag_rst_n = chip_rst_n;

// Invert sense of piton_ready
assign piton_ready_n = ~piton_ready;

//////////////////////////
// Sub-module Instances //
//////////////////////////

// Hold PLL in reset for 100 core_ref_clk cycles
alarm_counter #(.COUNTER_WIDTH(7), .ALARM_THRESHOLD(7'd100)) pll_rst_alarm_counter(
    .clk (clk),
    .rst_n (rst_n),
    .en (ref_clk_locked),
    .trigger (pll_rst_n)
);

// Hold chip and chip JTAG in reset for 1000 cycles
alarm_counter #(.COUNTER_WIDTH(10), .ALARM_THRESHOLD(10'd1000)) chip_jtag_rst_alarm_counter(
    .clk (clk),
    .rst_n (rst_n),
    .en (chip_clk_locked),
    .trigger (chip_rst_n)
);

// Wait 10,000 cycles for chip to be ready
alarm_counter #(.COUNTER_WIDTH(14), .ALARM_THRESHOLD(14'd10000)) piton_ready_alarm_counter (
    .clk (clk),
    .rst_n (rst_n),
    .en (chip_rst_n),
    .trigger (piton_ready)
);

endmodule
