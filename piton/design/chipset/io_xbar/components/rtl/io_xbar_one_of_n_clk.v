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

module io_xbar_one_of_n_clk #(
  parameter NUM_IN    = 5,
  parameter SEL_WIDTH = 3, //ceil(log2(NUM_IN)
  parameter WIDTH     = 8
) (
  input                     clk,
  input                     rst_n,
  input  [WIDTH*NUM_IN-1:0] in,
  input  [SEL_WIDTH-1:0]    sel,
  output [WIDTH-1:0]        out);

  wire [WIDTH-1:0] tmp [0:2**SEL_WIDTH-1];
  
  assign out    = tmp[sel];
 
  genvar k;
  generate
    for (k=0; k<NUM_IN; k=k+1) begin : g_connect
      assign tmp[k] = in[k*WIDTH +: WIDTH];
    end
    for (k=NUM_IN; k<2**SEL_WIDTH; k=k+1) begin : g_pad
      assign tmp[k] = {WIDTH{1'b0}};
    end
  endgenerate

endmodule


