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

/****************************************************************************
 *
 *   FILE: credit_to_valrdy.v
 *
 *   Modified: Yaosheng Fu
 *   Date: May 2 2014

 ***************************************************************************/

`include "network_define.v"

module credit_to_valrdy (
   clk,
   reset,
   //credit based interface	
   data_in,
   valid_in,
   yummy_in,
            
   //val/rdy interface
   data_out,
   valid_out,
   ready_out
);

   input	 clk;
   input	 reset;
   input [`DATA_WIDTH-1:0]	 data_in;
   input	 valid_in;
   input     ready_out;
    
   output	 yummy_in;
   output	 valid_out;
   output [`DATA_WIDTH-1:0] data_out;
   
   wire	 thanksIn;

   wire valid_out_temp;

   assign valid_out = valid_out_temp;

   network_input_blk_multi_out #(.LOG2_NUMBER_FIFO_ELEMENTS(2)) data(
      .clk(clk),
      .reset(reset),
      .data_in(data_in),
      .valid_in(valid_in),

      .thanks_in(valid_out & ready_out),

      .yummy_out(yummy_in),
      .data_val(data_out),
      .data_val1(/*not used*/),
      .data_avail(valid_out_temp));

endmodule



