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

`include "define.tmp.h"

// Filename: mux_process_pkt.v
// Author: mmckeown
// Description: This module buffers and multiplexes 
//              the 3 physical NoCs into the next 
//              packet to process.  Note, this could
//              be optimized to accept individual packets
//              from different NoCs as the buffer spaces
//              become free, but would need to implement some
//              sort of round-robin scheme otherwise it could
//              starve some networks with static ordering.  
//              This is much more complex and actually doesn't 
//              save you much, as you will still be limited
//              by UART.  Accepting any available packets and 
//              stalling networks until all packets are
//              processed is much simpler to implement.  Other
//              packets that become available will just buffer
//              back into the network until currently buffered
//              packets are processed.

module mux_process_pkt(
    input                                   clk,
    input                                   rst_n,

    input                                   side1_pkttrace_noc1_val,
    input      [`NOC_DATA_WIDTH-1:0]        side1_pkttrace_noc1_data,
    output reg                              side1_pkttrace_noc1_rdy,

    input                                   side1_pkttrace_noc2_val,
    input      [`NOC_DATA_WIDTH-1:0]        side1_pkttrace_noc2_data,
    output reg                              side1_pkttrace_noc2_rdy,

    input                                   side1_pkttrace_noc3_val,
    input      [`NOC_DATA_WIDTH-1:0]        side1_pkttrace_noc3_data,
    output reg                              side1_pkttrace_noc3_rdy,

    input                                   side2_pkttrace_noc1_val,
    input      [`NOC_DATA_WIDTH-1:0]        side2_pkttrace_noc1_data,
    output reg                              side2_pkttrace_noc1_rdy,

    input                                   side2_pkttrace_noc2_val,
    input      [`NOC_DATA_WIDTH-1:0]        side2_pkttrace_noc2_data,
    output reg                              side2_pkttrace_noc2_rdy,

    input                                   side2_pkttrace_noc3_val,
    input      [`NOC_DATA_WIDTH-1:0]        side2_pkttrace_noc3_data,
    output reg                              side2_pkttrace_noc3_rdy,

    input                                   process_pkt_complete,

    output reg                              process_pkt_val,
    output reg [1:0]                        process_pkt_noc,
    output reg [1:0]                        process_pkt_side,
    output reg [`NOC_DATA_WIDTH-1:0]        process_pkt_data
);

///////////////////////
// Type declarations //
///////////////////////

reg                                         accepting_data;

// Buffered input data
reg                                         side1_pkttrace_noc1_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc1_data_next;
reg                                         side1_pkttrace_noc2_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc2_data_next;
reg                                         side1_pkttrace_noc3_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc3_data_next;

reg                                         side1_pkttrace_noc1_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc1_data_f;
reg                                         side1_pkttrace_noc2_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc2_data_f;
reg                                         side1_pkttrace_noc3_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side1_pkttrace_noc3_data_f;

reg                                         side2_pkttrace_noc1_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc1_data_next;
reg                                         side2_pkttrace_noc2_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc2_data_next;
reg                                         side2_pkttrace_noc3_val_next;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc3_data_next;

reg                                         side2_pkttrace_noc1_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc1_data_f;
reg                                         side2_pkttrace_noc2_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc2_data_f;
reg                                         side2_pkttrace_noc3_val_f;
reg  [`NOC_DATA_WIDTH-1:0]                  side2_pkttrace_noc3_data_f;

reg                                         process_pkt_val_next;
reg  [1:0]                                  process_pkt_noc_next;
reg  [1:0]                                  process_pkt_side_next;
reg  [`NOC_DATA_WIDTH-1:0]                  process_pkt_data_next;

//////////////////////
// Sequential Logic //
//////////////////////

always @ (posedge clk)
begin
    if (~rst_n)
    begin
        // Do not need to reset data
        side1_pkttrace_noc1_val_f <= 1'b0;
        side1_pkttrace_noc2_val_f <= 1'b0;
        side1_pkttrace_noc3_val_f <= 1'b0;

        side2_pkttrace_noc1_val_f <= 1'b0;
        side2_pkttrace_noc2_val_f <= 1'b0;
        side2_pkttrace_noc3_val_f <= 1'b0;

        process_pkt_val <= 1'b0;
        process_pkt_noc <= 2'd0;
        process_pkt_side <= 2'd0;
        process_pkt_data <= {`NOC_DATA_WIDTH{1'b0}};
    end
    else
    begin
        side1_pkttrace_noc1_val_f <= side1_pkttrace_noc1_val_next;
        side1_pkttrace_noc2_val_f <= side1_pkttrace_noc2_val_next;
        side1_pkttrace_noc3_val_f <= side1_pkttrace_noc3_val_next;

        side2_pkttrace_noc1_val_f <= side2_pkttrace_noc1_val_next;
        side2_pkttrace_noc2_val_f <= side2_pkttrace_noc2_val_next;
        side2_pkttrace_noc3_val_f <= side2_pkttrace_noc3_val_next;

        process_pkt_val <= process_pkt_val_next;
        process_pkt_noc <= process_pkt_noc_next;
        process_pkt_side <= process_pkt_side_next;
        process_pkt_data <= process_pkt_data_next;
    end

    side1_pkttrace_noc1_data_f <= side1_pkttrace_noc1_data_next;
    side1_pkttrace_noc2_data_f <= side1_pkttrace_noc2_data_next;
    side1_pkttrace_noc3_data_f <= side1_pkttrace_noc3_data_next;
    side2_pkttrace_noc1_data_f <= side2_pkttrace_noc1_data_next;
    side2_pkttrace_noc2_data_f <= side2_pkttrace_noc2_data_next;
    side2_pkttrace_noc3_data_f <= side2_pkttrace_noc3_data_next;
end

/////////////////////////
// Combinational Logic //
/////////////////////////

always @ *
begin
    // We are only accepting data when there are no
    // more valid packets in buffers
    accepting_data = !side1_pkttrace_noc1_val_f &&
                     !side1_pkttrace_noc2_val_f &&
                     !side1_pkttrace_noc3_val_f &&
                     !side2_pkttrace_noc1_val_f &&
                     !side2_pkttrace_noc2_val_f &&
                     !side2_pkttrace_noc3_val_f;

    side1_pkttrace_noc1_rdy = accepting_data;
    side1_pkttrace_noc2_rdy = accepting_data;
    side1_pkttrace_noc3_rdy = accepting_data;

    side2_pkttrace_noc1_rdy = accepting_data;
    side2_pkttrace_noc2_rdy = accepting_data;
    side2_pkttrace_noc3_rdy = accepting_data;

end

// Select next process packet
always @ *
begin
    // Default is to keep previous valid flag
    side1_pkttrace_noc1_val_next = side1_pkttrace_noc1_val_f;
    side1_pkttrace_noc2_val_next = side1_pkttrace_noc2_val_f;
    side1_pkttrace_noc3_val_next = side1_pkttrace_noc3_val_f;
    side2_pkttrace_noc1_val_next = side2_pkttrace_noc1_val_f;
    side2_pkttrace_noc2_val_next = side2_pkttrace_noc2_val_f;
    side2_pkttrace_noc3_val_next = side2_pkttrace_noc3_val_f;

    // Default is to keep previous data
    side1_pkttrace_noc1_data_next = side1_pkttrace_noc1_data_f;
    side1_pkttrace_noc2_data_next = side1_pkttrace_noc2_data_f;
    side1_pkttrace_noc3_data_next = side1_pkttrace_noc3_data_f;
    side2_pkttrace_noc1_data_next = side2_pkttrace_noc1_data_f;
    side2_pkttrace_noc2_data_next = side2_pkttrace_noc2_data_f;
    side2_pkttrace_noc3_data_next = side2_pkttrace_noc3_data_f;

    // If we have a valid packet and the current processing
    // packet completes, meaning it is sent to uart and to
    // receiving noc channel choose new processing packet. 
    // Clear the valid flag for the side and noc next cycle 
    // as it is going to processing stage.
    if (side1_pkttrace_noc1_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd1;
        process_pkt_side_next = 2'd1;
        process_pkt_data_next = side1_pkttrace_noc1_data_f;

        side1_pkttrace_noc1_val_next = 1'b0;
    end
    else if (side1_pkttrace_noc2_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd2;
        process_pkt_side_next = 2'd1;
        process_pkt_data_next = side1_pkttrace_noc2_data_f;

        side1_pkttrace_noc2_val_next = 1'b0;
    end
    else if (side1_pkttrace_noc3_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd3;
        process_pkt_side_next = 2'd1;
        process_pkt_data_next = side1_pkttrace_noc3_data_f;

        side1_pkttrace_noc3_val_next = 1'b0;
    end
    else if (side2_pkttrace_noc1_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd1;
        process_pkt_side_next = 2'd2;
        process_pkt_data_next = side2_pkttrace_noc1_data_f;

        side2_pkttrace_noc1_val_next = 1'b0;
    end
    else if (side2_pkttrace_noc2_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd2;
        process_pkt_side_next = 2'd2;
        process_pkt_data_next = side2_pkttrace_noc2_data_f;

        side2_pkttrace_noc2_val_next = 1'b0;
    end
    else if (side2_pkttrace_noc3_val_f && process_pkt_complete)
    begin
        process_pkt_val_next = 1'b1;
        process_pkt_noc_next = 2'd3;
        process_pkt_side_next = 2'd2;
        process_pkt_data_next = side2_pkttrace_noc3_data_f;

        side2_pkttrace_noc3_val_next = 1'b0;
    end
    else
    begin
        // We did not have any new valid packets to send to process
        // or the currently processing packet is not complete.
        // If the currently processing packet is complete,
        // clear the current packet. Otherwise, keep current packet
        if (process_pkt_complete)
        begin
            process_pkt_val_next = 1'b0;
            process_pkt_noc_next = 2'd0;
            process_pkt_side_next = 2'd0;
            process_pkt_data_next = {`NOC_DATA_WIDTH{1'b0}};
        end
        else
        begin
            process_pkt_val_next = process_pkt_val;
            process_pkt_noc_next = process_pkt_noc;
            process_pkt_side_next = process_pkt_side;
            process_pkt_data_next = process_pkt_data;
        end

        // If we are accepting new data (meaning there are no valid
        // packets in buffers), then accept new data
        if (accepting_data)
        begin
            side1_pkttrace_noc1_val_next = side1_pkttrace_noc1_val;
            side1_pkttrace_noc2_val_next = side1_pkttrace_noc2_val;
            side1_pkttrace_noc3_val_next = side1_pkttrace_noc3_val;
            side2_pkttrace_noc1_val_next = side2_pkttrace_noc1_val;
            side2_pkttrace_noc2_val_next = side2_pkttrace_noc2_val;
            side2_pkttrace_noc3_val_next = side2_pkttrace_noc3_val;

            side1_pkttrace_noc1_data_next = side1_pkttrace_noc1_data;
            side1_pkttrace_noc2_data_next = side1_pkttrace_noc2_data;
            side1_pkttrace_noc3_data_next = side1_pkttrace_noc3_data;
            side2_pkttrace_noc1_data_next = side2_pkttrace_noc1_data;
            side2_pkttrace_noc2_data_next = side2_pkttrace_noc2_data;
            side2_pkttrace_noc3_data_next = side2_pkttrace_noc3_data;
        end
    end
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
