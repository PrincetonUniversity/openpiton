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

// Filename: demux_process_pkt.v
// Author: mmckeown
// Description: This module takes the current process packet
//              along with the noc and side ID, and demuxes
//              the data to the correct noc data output,
//              valid signal, and ready signal

module demux_process_pkt(
    // Process packet interface
    input                               process_pkt_val,
    input      [1:0]                    process_pkt_noc,
    input      [1:0]                    process_pkt_side,
    input      [`NOC_DATA_WIDTH-1:0]    process_pkt_data,
    input                               process_pkt_sent_noc,

    // NoC output interfaces
    output reg                          pkttrace_side1_noc1_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side1_noc1_data,
    input                               pkttrace_side1_noc1_rdy,

    output reg                          pkttrace_side1_noc2_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side1_noc2_data,
    input                               pkttrace_side1_noc2_rdy,

    output reg                          pkttrace_side1_noc3_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side1_noc3_data,
    input                               pkttrace_side1_noc3_rdy,

    output reg                          pkttrace_side2_noc1_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side2_noc1_data,
    input                               pkttrace_side2_noc1_rdy,

    output reg                          pkttrace_side2_noc2_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side2_noc2_data,
    input                               pkttrace_side2_noc2_rdy,

    output reg                          pkttrace_side2_noc3_val,
    output reg [`NOC_DATA_WIDTH-1:0]    pkttrace_side2_noc3_data,
    input                               pkttrace_side2_noc3_rdy,

    // Process packet ready signal
    output reg                          process_pkt_rdy
);

///////////////////////
// Type declarations //
///////////////////////

//////////////////////
// Sequential Logic //
//////////////////////

/////////////////////////
// Combinational Logic //
/////////////////////////

always @ *
begin
    // default values
    pkttrace_side1_noc1_val = 1'b0;
    pkttrace_side1_noc2_val = 1'b0;
    pkttrace_side1_noc3_val = 1'b0;
    pkttrace_side2_noc1_val = 1'b0;
    pkttrace_side2_noc2_val = 1'b0;
    pkttrace_side2_noc3_val = 1'b0;

    pkttrace_side1_noc1_data = {`NOC_DATA_WIDTH{1'b0}};
    pkttrace_side1_noc2_data = {`NOC_DATA_WIDTH{1'b0}};
    pkttrace_side1_noc3_data = {`NOC_DATA_WIDTH{1'b0}};
    pkttrace_side2_noc1_data = {`NOC_DATA_WIDTH{1'b0}};
    pkttrace_side2_noc2_data = {`NOC_DATA_WIDTH{1'b0}};
    pkttrace_side2_noc3_data = {`NOC_DATA_WIDTH{1'b0}};

    process_pkt_rdy = 1'b0;

    // Note: side crosses over, if received on side 1 we send on
    // side 2 and vice versa
    case ({process_pkt_side, process_pkt_noc})
        4'b0101:
        begin
            pkttrace_side2_noc1_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side2_noc1_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side2_noc1_rdy;
        end
        4'b0110:
        begin
            pkttrace_side2_noc2_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side2_noc2_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side2_noc2_rdy;
        end
        4'b0111:
        begin
            pkttrace_side2_noc3_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side2_noc3_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side2_noc3_rdy;
        end
        4'b1001:
        begin
            pkttrace_side1_noc1_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side1_noc1_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side1_noc1_rdy;
        end
        4'b1010:
        begin
            pkttrace_side1_noc2_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side1_noc2_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side1_noc2_rdy;
        end
        4'b1011:
        begin
            pkttrace_side1_noc3_val = process_pkt_val & ~process_pkt_sent_noc;
            pkttrace_side1_noc3_data = process_pkt_data;
            process_pkt_rdy = pkttrace_side1_noc3_rdy;
        end
        default: ;
    endcase
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
