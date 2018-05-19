
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

// 02/06/2015 14:58:59
// This file is auto-generated
// Author: Tri Nguyen
`include "define.vh"
`ifdef DEFAULT_NETTYPE_NONE
`default_nettype none
`endif
module sram_2rw_256x66
(
input wire MEMCLK,
input wire RESET_N,
input wire CEA,
input wire [7:0] AA,
input wire RDWENA,
input wire CEB,
input wire [7:0] AB,
input wire RDWENB,
input wire [65:0] BWA,
input wire [65:0] DINA,
output wire [65:0] DOUTA,
input wire [65:0] BWB,
input wire [65:0] DINB,
output wire [65:0] DOUTB,
input wire [`BIST_OP_WIDTH-1:0] BIST_COMMAND,
input wire [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DIN,
output reg [`SRAM_WRAPPER_BUS_WIDTH-1:0] BIST_DOUT,
input wire [`BIST_ID_WIDTH-1:0] SRAMID
);
reg [65:0] cache [255:0];

integer i;
initial
begin
   for (i = 0; i < 256; i = i + 1)
   begin
      cache[i] = 0;
   end
end



   reg [65:0] dout_f0;

   assign DOUTA = dout_f0;

   always @ (posedge MEMCLK)
   begin
      if (CEA)
      begin
         if (RDWENA == 1'b0)
            cache[AA] <= (DINA & BWA) | (cache[AA] & ~BWA);
         else
            dout_f0 <= cache[AA];
      end
   end

   

   reg [65:0] dout_f1;

   assign DOUTB = dout_f1;

   always @ (posedge MEMCLK)
   begin
      if (CEB)
      begin
         if (RDWENB == 1'b0)
            cache[AB] <= (DINB & BWB) | (cache[AB] & ~BWB);
         else
            dout_f1 <= cache[AB];
      end
   end

   
endmodule
