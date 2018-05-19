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

//File: network_input_blk_multi_out.v

`include "network_define.v"
module network_input_blk_multi_out 
   #(parameter LOG2_NUMBER_FIFO_ELEMENTS = 2)
(
   input wire clk, 
   input wire reset,
   input wire [`DATA_WIDTH-1:0] data_in, 
   input wire valid_in, 
   input wire thanks_in,

   output wire yummy_out, 
   // data_val and data_val1 are the same, this is just done for buffering to
   // convince the synthesis tool to buffer up these high fanout nets
   output wire [`DATA_WIDTH-1:0] data_val, 
   output wire [`DATA_WIDTH-1:0] data_val1, 
   output wire data_avail 
);

reg [`DATA_WIDTH-1:0] storage_data_f [0:(1<<LOG2_NUMBER_FIFO_ELEMENTS)-1];

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_f;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_f;

reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] head_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS-1:0] tail_ptr_next;
reg [LOG2_NUMBER_FIFO_ELEMENTS:0] elements_in_array_next;

reg yummy_out_f;

assign yummy_out = yummy_out_f;

// data_val and data_val1 are the same, just done for buffering
assign data_val = storage_data_f[head_ptr_f];
assign data_val1 = storage_data_f[head_ptr_f];
assign data_avail = elements_in_array_f != 0;

always @ *
begin
   head_ptr_next = head_ptr_f;
   tail_ptr_next = tail_ptr_f;
   elements_in_array_next = elements_in_array_f;
   case({valid_in,thanks_in})
      2'b00:
         begin
            // do nothing here
         end
      2'b01:
         begin
            // we are being dequeued from
            head_ptr_next = head_ptr_f + 1;
            elements_in_array_next = elements_in_array_f - 1;
         end
      2'b10:
         begin
            // we are being enqueued into
            tail_ptr_next = tail_ptr_f + 1;
            elements_in_array_next = elements_in_array_f + 1;
         end
      2'b11:
         begin
            // simultaneous enqueue and dequeue
            head_ptr_next = head_ptr_f + 1;
            tail_ptr_next = tail_ptr_f + 1;
         end
      default:
         begin
            // this is an error because this is a full parallel case statement
         end
   endcase
end

always @ (posedge clk)
begin
   if (reset)
   begin
      yummy_out_f <= 0;
      head_ptr_f <= 0;
      tail_ptr_f <= 0;
      elements_in_array_f <= 0;
   end
   else
   begin
      yummy_out_f <= thanks_in; // this is just a feed through via a flip flop
      head_ptr_f <= head_ptr_next;
      tail_ptr_f <= tail_ptr_next;
      elements_in_array_f <= elements_in_array_next;
      if(valid_in)
      begin
         storage_data_f[tail_ptr_f] <= data_in;
      end
   end
end

endmodule
