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
//  Filename      : pcx_buffer.v
//  Created On    : 2014-03-03 20:20:43
//  Last Modified : 2018-11-14 19:18:52
//  Revision      :
//
//  Description   :
//
//
//==================================================================================================
//pcx_buffer.v

`include "iop.h"

//`default_nettype none
module pcx_buffer(
   input wire clk,
   input wire rst_n,

   // Inputs from sparc core
   input wire [4:0] spc_uncore_req,
   input wire spc_uncore_atomic_req,
   input wire [`PCX_WIDTH-1:0] spc_uncore_data,
   input wire [`TLB_CSM_WIDTH-1:0] spc_uncore_csm_data,

   // ack from the L1.5 that the entry is processed
   input wire pcxdecoder_pcxbuf_ack,

   // grant to sparc core
   output reg [4:0] uncore_spc_grant,

   //
   output reg [`PCX_WIDTH-1:0] pcxbuf_pcxdecoder_data,
   output reg [`PCX_WIDTH-1:0] pcxbuf_pcxdecoder_data_buf1,
   output reg [`TLB_CSM_WIDTH-1:0] pcxbuf_pcxdecoder_csm_data,
   output reg pcxbuf_pcxdecoder_valid
   // output reg pcx_req_squashed
   );

reg [`PCX_WIDTH-1:0]   buffer[0:1];
reg [`PCX_WIDTH-1:0]   buffer_next[0:1];
reg                    buffer_atomic[0:1];
reg                    buffer_atomic_next[0:1];
reg                    buffer_atomic_next_next;
// reg [`PCX_WIDTH-1:0]   buf0, buf1;
// wire [`PCX_WIDTH-1:0] buf0_next, buf1_next;
// wire               buf0_val, buf1_val;
reg [`PCX_WIDTH-1:0]   buffer_csm_data[0:1];
reg [`PCX_WIDTH-1:0]   buffer_csm_data_next[0:1];

reg atomic_req_second_packet_coming;
reg atomic_req_second_packet_coming_next;
reg atomic_ack_second;
reg atomic_ack_second_next;

reg buffer_val [0:1];
reg buffer_val_next [0:1];
reg read_pos;
reg write_pos;
reg read_pos_next;
reg write_pos_next;

reg write_req;
reg write_req_next;
reg read_ack;

// reg invalid_packet;
// reg invalid_packet_next;
// reg invalid_packet_acked;

reg is_buffer_full;
reg is_buffer_full_1back;
// reg is_buffer_full_2back;
reg is_req_squashed;
reg [4:0] uncore_spc_grant_next;

// Reset logic & sequential
always @ (posedge clk)
if (~rst_n)
begin
   // buf0 <= 1'b0;
   // buf1 <= 1'b0;
   buffer[0] <= 1'b0;
   buffer[1] <= 1'b0;
   read_pos <= 1'b0;
   write_pos <= 1'b0;
   write_req <= 1'b0;
   buffer_val[0] <= 1'b0;
   buffer_val[1] <= 1'b0;
   buffer_atomic[0] <= 1'b0;
   buffer_atomic[1] <= 1'b0;
   buffer_atomic_next_next <= 1'b0;
   atomic_req_second_packet_coming <= 1'b0;
   atomic_ack_second <= 1'b0;
   // invalid_packet <= 1'b0;
   // is_buffer_full_2back <= 1'b0;
   is_buffer_full_1back <= 1'b0;
   uncore_spc_grant <= 0;
end
else
begin
   // if (buf0_val && pcxdecoder_pcxbuf_ack)
   // begin
      // buf0 <= buf0_next;
      // buf1 <= buf1_next;
      buffer[0] <= buffer_next[0];
      buffer[1] <= buffer_next[1];
      buffer_csm_data[0] <= buffer_csm_data_next[0];
      buffer_csm_data[1] <= buffer_csm_data_next[1];
      read_pos <= read_pos_next;
      write_pos <= write_pos_next;
      write_req <= write_req_next;
      buffer_val[0] <= buffer_val_next[0];
      buffer_val[1] <= buffer_val_next[1];
      buffer_atomic[0] <= buffer_atomic_next[0];
      buffer_atomic[1] <= buffer_atomic_next[1];
      buffer_atomic_next_next <= spc_uncore_atomic_req && !is_req_squashed;
      atomic_req_second_packet_coming <= atomic_req_second_packet_coming_next;
      atomic_ack_second <= atomic_ack_second_next;
      // invalid_packet <= invalid_packet_next;
      // is_buffer_full_2back <= is_buffer_full_1back;
      is_buffer_full_1back <= is_buffer_full;
      uncore_spc_grant <= uncore_spc_grant_next;
   // end
end

// Combinational

always @ *
begin
   // write_req_next = spc_uncore_req[0] || atomic_req_second_packet_coming;
   // note: the core puts data one cycle after the request
   //       also, only one request for atomic request, but two cycles of data
   read_ack = pcxdecoder_pcxbuf_ack;
   buffer_val_next[0] = buffer_val[0];
   buffer_val_next[1] = buffer_val[1];
   buffer_next[0] = buffer[0];
   buffer_next[1] = buffer[1];
   buffer_atomic_next[0] = buffer_atomic[0];
   buffer_atomic_next[1] = buffer_atomic[1];
   buffer_csm_data_next[0] = buffer_csm_data[0];
   buffer_csm_data_next[1] = buffer_csm_data[1];

   read_pos_next = read_pos;
   write_pos_next = write_pos;
   atomic_ack_second_next = 0;

   if (write_req)
   begin
      // $write("DEBUG: received pcx packet");
      buffer_next[write_pos] = spc_uncore_data;
      buffer_csm_data_next[write_pos] = spc_uncore_csm_data;
      buffer_atomic_next[write_pos] = buffer_atomic_next_next;
      buffer_val_next[write_pos] = 1'b1;
      write_pos_next = write_pos ^ 1'b1;
   end

   if (read_ack)
   begin
      if (buffer_atomic[read_pos] == 1'b1)
      begin
         read_pos_next = read_pos;
         atomic_ack_second_next = 1'b1;
         buffer_val_next[0] = 1'b0;
         buffer_val_next[1] = 1'b0;
      end
      else
      begin
         read_pos_next = read_pos^1'b1;
         buffer_val_next[read_pos] = 1'b0;
      end
   end

   // move this to the end of the process
   // otherwise msim complains about potentially uninitialized "write_pos_next"
   is_buffer_full = (write_pos_next == read_pos) && (buffer_val[read_pos] == 1'b1) && (uncore_spc_grant[0] != 1'b1);
   // is_buffer_full = (write_pos_next == read_pos) && (buffer_val[read_pos] == 1'b1);
   is_req_squashed = is_buffer_full && spc_uncore_req[0];
   // pcx_req_squashed = is_req_squashed;
   atomic_req_second_packet_coming_next = spc_uncore_atomic_req && !is_req_squashed;
   pcxbuf_pcxdecoder_data = buffer[read_pos];
   pcxbuf_pcxdecoder_data_buf1 = buffer[read_pos^1'b1];
   pcxbuf_pcxdecoder_valid = buffer_val[read_pos];
   pcxbuf_pcxdecoder_csm_data = buffer_csm_data[read_pos];
   write_req_next = (spc_uncore_req[0] && !is_req_squashed) || atomic_req_second_packet_coming;

end


always @ *
begin
   // invalid_packet_acked = 0;
   // if (invalid_packet && !pcxdecoder_pcxbuf_ack && !atomic_ack_second)
      // invalid_packet_acked = 1;

   // uncore_spc_grant = {4'b0, pcxdecoder_pcxbuf_ack|atomic_ack_second|invalid_packet};
   // uncore_spc_grant = {4'b0, pcxdecoder_pcxbuf_ack|atomic_ack_second};

   // this signal needs to be early; flopped
   uncore_spc_grant_next = {4'b0, pcxdecoder_pcxbuf_ack|atomic_ack_second};
end

endmodule
