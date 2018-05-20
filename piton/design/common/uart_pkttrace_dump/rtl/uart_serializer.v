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

// Filename: uart_serializer.v
// Author: mmckeown
// Description: Serializes a n-byte packet to bytes for UART transmission.
//              Sends in MSB to LSB ordering

module uart_serializer
#(
    parameter                           PACKET_LEN_BYTES = 30,
    parameter                           PACKET_LEN_BYTES_LOG2 = 5
)
(
    input                               clk,
    input                               rst_n,
   
    input                               pkt_val,
    input  [(PACKET_LEN_BYTES*8)-1:0]   pkt_data,
    output                              pkt_rdy,

    output                              uart_val,
    output [7:0]                        uart_data,
    input                               uart_rdy
);

///////////////////////
// Type declarations //
///////////////////////

reg                                     pkt_val_next;
reg                                     pkt_val_f;

reg  [(PACKET_LEN_BYTES*8)-1:0]         pkt_data_next;
reg  [(PACKET_LEN_BYTES*8)-1:0]         pkt_data_f;
wire [(PACKET_LEN_BYTES*8)-1:0]         pkt_data_f_shifted;

reg  [PACKET_LEN_BYTES_LOG2-1:0]        byte_counter_next;
reg  [PACKET_LEN_BYTES_LOG2-1:0]        byte_counter_f;

//////////////////////
// Sequential Logic //
//////////////////////

always @ (posedge clk)
begin
    if (~rst_n)
    begin
        pkt_val_f <= 1'b0;
        pkt_data_f <= {(PACKET_LEN_BYTES*8){1'b0}};
        byte_counter_f <= {PACKET_LEN_BYTES_LOG2{1'b0}};
    end
    else
    begin
        pkt_val_f <= pkt_val_next;
        pkt_data_f <= pkt_data_next;
        byte_counter_f <= byte_counter_next;
    end
end

/////////////////////////
// Combinational Logic //
/////////////////////////

assign pkt_rdy = byte_counter_f == {PACKET_LEN_BYTES_LOG2{1'b0}} && (uart_rdy || !pkt_val_f);

always @ *
begin
    // If we are on the last byte, we are sending a byte or there is no current valid byte, 
    // and a new packet is available, accept a new packet
    if (byte_counter_f == {PACKET_LEN_BYTES_LOG2{1'b0}} && (uart_rdy || !pkt_val_f) && pkt_val)
    begin
        pkt_val_next = 1'b1;
        pkt_data_next = pkt_data;
        byte_counter_next = PACKET_LEN_BYTES-1;
    end
    // If we are on the last byte, we are sending a byte or there is no current valid pkt, 
    // and a there is no new packet, clear the current packet
    else if (byte_counter_f == {PACKET_LEN_BYTES_LOG2{1'b0}} && (uart_rdy || !pkt_val_f))
    begin
        pkt_val_next = 1'b0;
        pkt_data_next = {(PACKET_LEN_BYTES*8){1'b0}};
        byte_counter_next = byte_counter_f;
    end
    // Otherwise, keep current packet
    else
    begin
        pkt_val_next = pkt_val_f;
        pkt_data_next = pkt_data_f;
        // If we can send, decrement counter
        // Otherwise keep counter
        if (uart_rdy)
            byte_counter_next = byte_counter_f - 1'b1;
        else
            byte_counter_next = byte_counter_f;
    end
end

assign uart_val = pkt_val_f;
// Grab the correct byte according to the counter (bottom 8 bits of shift right by byte_counter_f*8)
assign pkt_data_f_shifted = pkt_data_f >> ({3'b0, byte_counter_f} << 3);
assign uart_data = pkt_data_f_shifted[7:0];

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
