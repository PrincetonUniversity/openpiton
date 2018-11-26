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

// Filename: uart_pkttrace_dump.v
// Author: mmckeown
// Description: This module passes through 3 physical val/rdy NoCs
//              and dumps the traffic over UART for debugging

// TODO: Accept data individually from NoCs as they are processed
//       instead of waiting for all to be processed? Would have to
//       change to round-robin processing instead of static ordering

module uart_pkttrace_dump(
    input                                   clk,
    input                                   rst_n,

    // side1 to uart_pkttrace_dump interfaces
    input                                   side1_pkttrace_noc1_val,
    input  [`NOC_DATA_WIDTH-1:0]            side1_pkttrace_noc1_data,
    output                                  side1_pkttrace_noc1_rdy,
    
    input                                   side1_pkttrace_noc2_val,
    input  [`NOC_DATA_WIDTH-1:0]            side1_pkttrace_noc2_data,
    output                                  side1_pkttrace_noc2_rdy,

    input                                   side1_pkttrace_noc3_val,
    input  [`NOC_DATA_WIDTH-1:0]            side1_pkttrace_noc3_data,
    output                                  side1_pkttrace_noc3_rdy,

    // uart_pkttrace_dump to side1 interfaces
    output                                  pkttrace_side1_noc1_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side1_noc1_data,
    input                                   pkttrace_side1_noc1_rdy,

    output                                  pkttrace_side1_noc2_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side1_noc2_data,
    input                                   pkttrace_side1_noc2_rdy,

    output                                  pkttrace_side1_noc3_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side1_noc3_data,
    input                                   pkttrace_side1_noc3_rdy,

    // side2 to uart_pkttrace_dump interfaces
    input                                   side2_pkttrace_noc1_val,
    input  [`NOC_DATA_WIDTH-1:0]            side2_pkttrace_noc1_data,
    output                                  side2_pkttrace_noc1_rdy,
    
    input                                   side2_pkttrace_noc2_val,
    input  [`NOC_DATA_WIDTH-1:0]            side2_pkttrace_noc2_data,
    output                                  side2_pkttrace_noc2_rdy,

    input                                   side2_pkttrace_noc3_val,
    input  [`NOC_DATA_WIDTH-1:0]            side2_pkttrace_noc3_data,
    output                                  side2_pkttrace_noc3_rdy,

    // uart_pkttrace_dump to side2 interfaces
    output                                  pkttrace_side2_noc1_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side2_noc1_data,
    input                                   pkttrace_side2_noc1_rdy,

    output                                  pkttrace_side2_noc2_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side2_noc2_data,
    input                                   pkttrace_side2_noc2_rdy,

    output                                  pkttrace_side2_noc3_val,
    output [`NOC_DATA_WIDTH-1:0]            pkttrace_side2_noc3_data,
    input                                   pkttrace_side2_noc3_rdy,

    // UART interface
    input                                   uart_rx,
    output                                  uart_tx
);

///////////////////////
// Type declarations //
///////////////////////

// Strings to dump over UART for different sides
// Must be the same length for both sides
parameter                                   SIDE1_STRING = "SIDE1";
parameter                                   SIDE2_STRING = "SIDE2";
parameter                                   SIDE_STRING_LEN_BITS = 40;
parameter                                   SIDE_STRING_LEN_BITS_LOG2 = 6;

// Full packet is "<side string> NoC#: <data>\r\n"
parameter                                   UART_FULL_PACKET_LEN_BYTES = (SIDE_STRING_LEN_BITS/8) + 25;
// This is quite conservative but sould always be correct, compiler will
// optimize away anyways
parameter                                   UART_FULL_PACKET_LEN_BYTES_LOG2 = (SIDE_STRING_LEN_BITS_LOG2-3) + 5;

wire                                        uart_val;
wire [7:0]                                  uart_data;
wire                                        uart_rdy;

wire                                        process_pkt_val;
wire [1:0]                                  process_pkt_noc;
wire [1:0]                                  process_pkt_side;
wire [`NOC_DATA_WIDTH-1:0]                  process_pkt_data;

wire [31:0]                                 process_pkt_noc_string;
wire [SIDE_STRING_LEN_BITS-1:0]             process_pkt_side_string;
wire [(`NOC_DATA_WIDTH*2)-1:0]              process_pkt_data_hex_string;

reg  [(UART_FULL_PACKET_LEN_BYTES*8)-1:0]   process_pkt_data_final;

wire                                        process_pkt_noc_rdy;
wire                                        process_pkt_uart_rdy;

wire                                        process_pkt_sent_noc;
wire                                        process_pkt_sent_uart;
wire                                        process_pkt_complete;

//////////////////////
// Sequential Logic //
//////////////////////

/////////////////////////
// Combinational Logic //
/////////////////////////

// Full packet is "<side string> NoC#: <data>\r\n"
always @ *
    process_pkt_data_final = {process_pkt_side_string, " ", process_pkt_noc_string, ": ", 
                              process_pkt_data_hex_string, "\r\n"};

//////////////////////////
// Sub-module Instances //
//////////////////////////

// Mux the 3 NoCs into a packet to process
mux_process_pkt mux_process_pkt(
    .clk                        (clk                        ),
    .rst_n                      (rst_n                      ),

    .side1_pkttrace_noc1_val    (side1_pkttrace_noc1_val    ),
    .side1_pkttrace_noc1_data   (side1_pkttrace_noc1_data   ),
    .side1_pkttrace_noc1_rdy    (side1_pkttrace_noc1_rdy    ),

    .side1_pkttrace_noc2_val    (side1_pkttrace_noc2_val    ),
    .side1_pkttrace_noc2_data   (side1_pkttrace_noc2_data   ),
    .side1_pkttrace_noc2_rdy    (side1_pkttrace_noc2_rdy    ),

    .side1_pkttrace_noc3_val    (side1_pkttrace_noc3_val    ),
    .side1_pkttrace_noc3_data   (side1_pkttrace_noc3_data   ),
    .side1_pkttrace_noc3_rdy    (side1_pkttrace_noc3_rdy    ),

    .side2_pkttrace_noc1_val    (side2_pkttrace_noc1_val    ),
    .side2_pkttrace_noc1_data   (side2_pkttrace_noc1_data   ),
    .side2_pkttrace_noc1_rdy    (side2_pkttrace_noc1_rdy    ),

    .side2_pkttrace_noc2_val    (side2_pkttrace_noc2_val    ),
    .side2_pkttrace_noc2_data   (side2_pkttrace_noc2_data   ),
    .side2_pkttrace_noc2_rdy    (side2_pkttrace_noc2_rdy    ),

    .side2_pkttrace_noc3_val    (side2_pkttrace_noc3_val    ),
    .side2_pkttrace_noc3_data   (side2_pkttrace_noc3_data   ),
    .side2_pkttrace_noc3_rdy    (side2_pkttrace_noc3_rdy    ),

    .process_pkt_complete       (process_pkt_complete       ),

    .process_pkt_val            (process_pkt_val            ),
    .process_pkt_noc            (process_pkt_noc            ),
    .process_pkt_side           (process_pkt_side           ),
    .process_pkt_data           (process_pkt_data           )
);

// Determine when process pkt is complete
process_pkt_complete process_pkt_complete_mod(
    .clk                    (clk                    ),
    .rst_n                  (rst_n                  ),

    .process_pkt_val        (process_pkt_val        ),
    .process_pkt_noc_rdy    (process_pkt_noc_rdy    ),
    .process_pkt_uart_rdy   (process_pkt_uart_rdy   ),
   
    .process_pkt_sent_noc   (process_pkt_sent_noc   ),
    .process_pkt_sent_uart  (process_pkt_sent_uart  ),
    .process_pkt_complete   (process_pkt_complete   )
);

// Demux the current processing packet to the 3 NoCs
// for the two side outputs
demux_process_pkt demux_process_pkt(
    .process_pkt_val            (process_pkt_val            ),
    .process_pkt_noc            (process_pkt_noc            ),
    .process_pkt_side           (process_pkt_side           ),
    .process_pkt_data           (process_pkt_data           ),
    .process_pkt_sent_noc       (process_pkt_sent_noc       ),

    .pkttrace_side1_noc1_val    (pkttrace_side1_noc1_val    ),
    .pkttrace_side1_noc1_data   (pkttrace_side1_noc1_data   ),
    .pkttrace_side1_noc1_rdy    (pkttrace_side1_noc1_rdy    ),

    .pkttrace_side1_noc2_val    (pkttrace_side1_noc2_val    ),
    .pkttrace_side1_noc2_data   (pkttrace_side1_noc2_data   ),
    .pkttrace_side1_noc2_rdy    (pkttrace_side1_noc2_rdy    ),

    .pkttrace_side1_noc3_val    (pkttrace_side1_noc3_val    ),
    .pkttrace_side1_noc3_data   (pkttrace_side1_noc3_data   ),
    .pkttrace_side1_noc3_rdy    (pkttrace_side1_noc3_rdy    ),

    .pkttrace_side2_noc1_val    (pkttrace_side2_noc1_val    ),
    .pkttrace_side2_noc1_data   (pkttrace_side2_noc1_data   ),
    .pkttrace_side2_noc1_rdy    (pkttrace_side2_noc1_rdy    ),

    .pkttrace_side2_noc2_val    (pkttrace_side2_noc2_val    ),
    .pkttrace_side2_noc2_data   (pkttrace_side2_noc2_data   ),
    .pkttrace_side2_noc2_rdy    (pkttrace_side2_noc2_rdy    ),

    .pkttrace_side2_noc3_val    (pkttrace_side2_noc3_val    ),
    .pkttrace_side2_noc3_data   (pkttrace_side2_noc3_data   ),
    .pkttrace_side2_noc3_rdy    (pkttrace_side2_noc3_rdy    ),

    .process_pkt_rdy            (process_pkt_noc_rdy        )
);

// Convert NoC ID to a string
noc2string noc2string(
    .noc_id     (process_pkt_noc        ),
    .noc_string (process_pkt_noc_string )
);

// Convert side ID to a string
side2string # (
    .SIDE1_STRING           (SIDE1_STRING           ),
    .SIDE2_STRING           (SIDE2_STRING           ),
    .SIDE_STRING_LEN_BITS   (SIDE_STRING_LEN_BITS   )
) side2string (
    .side_id                (process_pkt_side       ),
    .side_string            (process_pkt_side_string)
);

// Convert 64-bit data to hex string
bits2hex bits2hex[(`NOC_DATA_WIDTH/4)-1:0] (
    .bits   (process_pkt_data           ),
    .char   (process_pkt_data_hex_string)
);

// UART serializer
uart_serializer # (
    .PACKET_LEN_BYTES           (UART_FULL_PACKET_LEN_BYTES                 ),
    .PACKET_LEN_BYTES_LOG2      (UART_FULL_PACKET_LEN_BYTES_LOG2            )
) uart_serializer (
    .clk                        (clk                                        ),
    .rst_n                      (rst_n                                      ),

    .pkt_val                    (process_pkt_val & ~process_pkt_sent_uart   ),
    .pkt_data                   (process_pkt_data_final                     ),
    .pkt_rdy                    (process_pkt_uart_rdy                       ),
    
    .uart_val                   (uart_val                                   ),
    .uart_data                  (uart_data                                  ),
    .uart_rdy                   (uart_rdy                                   )
);

// UART controller
UART    # (
    .ClockFreq      (100000000          ),
`ifdef UART_SIM_FAST_BAUD_RATE
    .Baud           (100000000          ),
`else // ifndef UART_SIM_FAST_BAUD_RATE
    .Baud           (115200             ),
`endif // UART_SIM_FAST_BAUD_RATE
    .Width          (8                  ),
    .Parity         (0                  ),
    .StopBits       (1                  )
) UART    (
    .Clock          (clk                ),
    .Reset          (~rst_n             ),

    .DataIn         (uart_data          ),
    .DataInValid    (uart_val           ),
    .DataInReady    (uart_rdy           ),

    // We don't expect to be receiving any data
    // from UART, this just dumps out
    .DataOut        (                   ),
    .DataOutValid   (                   ),
    .DataOutReady   (                   ),

    .SIn            (uart_rx            ),
    .SOut           (uart_tx            )
);

endmodule

