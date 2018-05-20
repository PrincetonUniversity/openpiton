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

// Filename: process_pkt_complete.v
// Author: mmckeown
// Description: This module takes the process pkt valid
//              signal and ready signals and determines
//              if it has completed processing

module process_pkt_complete(
    input                   clk,
    input                   rst_n,

    input                   process_pkt_val,
    input                   process_pkt_noc_rdy,
    input                   process_pkt_uart_rdy,

    output reg              process_pkt_sent_noc,
    output reg              process_pkt_sent_uart,
    output reg              process_pkt_complete
);

///////////////////////
// Type declarations //
///////////////////////

reg                         process_pkt_noc_rdy_next;
reg                         process_pkt_uart_rdy_next;

reg                         process_pkt_noc_rdy_f;
reg                         process_pkt_uart_rdy_f;

//////////////////////
// Sequential Logic //
//////////////////////

always @ (posedge clk)
begin
    if(~rst_n)
    begin
        process_pkt_noc_rdy_f <= 1'b0;
        process_pkt_uart_rdy_f <= 1'b0;
    end
    else
    begin
        process_pkt_noc_rdy_f <= process_pkt_noc_rdy_next;
        process_pkt_uart_rdy_f <= process_pkt_uart_rdy_next;
    end
end

/////////////////////////
// Combinational Logic //
/////////////////////////

always @ *
begin
    // When a packet completes, clear the stored
    // ready bits
    if(process_pkt_complete)
    begin
        process_pkt_noc_rdy_next = 1'b0;
        process_pkt_uart_rdy_next = 1'b0;
    end
    else
    begin
        // If process pkt has not been ready before,
        // take new values from real ready signal.
        // Otherwise, maintain value
        if(!process_pkt_noc_rdy_f)
            process_pkt_noc_rdy_next = process_pkt_noc_rdy;
        else
            process_pkt_noc_rdy_next = process_pkt_noc_rdy_f;
        if(!process_pkt_uart_rdy_f)
            process_pkt_uart_rdy_next = process_pkt_uart_rdy;
        else
            process_pkt_uart_rdy_next = process_pkt_uart_rdy_f;
    end
end

// Done processing when both ready signals have been ready before
// or are rdy now, or when there is not a valid packet
always @ *
    process_pkt_complete = ((process_pkt_noc_rdy_f || process_pkt_noc_rdy) &&
                            (process_pkt_uart_rdy_f || process_pkt_uart_rdy)) ||
                           !process_pkt_val;

always @ *
begin
    process_pkt_sent_noc = process_pkt_noc_rdy_f;
    process_pkt_sent_uart = process_pkt_uart_rdy_f;
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
