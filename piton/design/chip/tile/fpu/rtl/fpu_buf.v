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

///////////////////////////////////////////////////////////////////////////////
//
//  Floating Point Unit to stallable CPX buffer.
//
///////////////////////////////////////////////////////////////////////////////

module fpu_buf (
    input wire rst_n,
    input wire clk,

    input wire [7:0] fp_cpx_req_cq,
    input wire [144:0] fp_cpx_data_ca,

    input wire l15_fp_rdy,

    output reg fpu_arb_data_rdy,
    output reg [144:0] fpu_arb_data
);

// Tri: i'm going to write the logic using val/rdy convention; easier to understand
reg fp_cpx_req;
reg fp_cpx_req_d1;

reg output_rdy;
reg output_val;
reg [144:0] output_data;
reg buffer_val_next;
reg buffer_val;
reg [144:0] buffer_next;
reg [144:0] buffer;
reg buffer_wr_en;

always @*
begin
    // renaming
    fp_cpx_req = fp_cpx_req_cq[0];
    output_rdy = !l15_fp_rdy;

    // assigning outputs
    // output is valid when (buffer_val || fp_cpx_req_d1 == 1) && output_rdy;
    output_val = (buffer_val || fp_cpx_req_d1) && output_rdy;
    output_data = buffer_val ? buffer : fp_cpx_data_ca;

    // buffer is valid next cycle if
    // 1. buffer_val && !output_val (hold buffer)
    // 2. fp_cpx_req_d1 && !output_val (new buffer)
    buffer_val_next = (buffer_val || fp_cpx_req_d1) && !output_val;
    // write new buffer when fp_cpx_req_d1 && !output_val (new buffer)
    buffer_wr_en = fp_cpx_req_d1 && !output_val;
    buffer_next = buffer_wr_en ? fp_cpx_data_ca : buffer;

    // output assignments
    fpu_arb_data_rdy = output_val;
    fpu_arb_data = output_data;
end

always @(posedge clk)
begin
    if (~rst_n)
    begin
        fp_cpx_req_d1 <= 1'b0;
        buffer_val <= 1'b0;
        buffer <= 145'b0;
    end
    else
    begin 
        fp_cpx_req_d1 <= fp_cpx_req;
        buffer_val <= buffer_val_next;
        buffer <= buffer_next;
    end
end


endmodule
