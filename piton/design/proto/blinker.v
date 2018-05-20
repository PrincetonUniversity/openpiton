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

//==================================================================================================
//  Filename      : blinker.v
//  Created On    : 2014-05-10
//  Last Modified : 2015-05-10 16:52:02
//  Revision      :
//  Author        : Alexey Lavrov
//  Company       : Princeton University
//  Email         : alavrov@princeton.edu
//
//  Description   : a blinker for testing presence of clk signal of FPGA
//
//
//==================================================================================================

module blinker (
    input           clk,
    input           rst_n,

    output reg      GPIO_LED_0,
    output reg      GPIO_LED_1,
    output reg      GPIO_LED_2,
    output reg      GPIO_LED_3,
    output reg      GPIO_LED_4,
    output reg      GPIO_LED_5,
    output reg      GPIO_LED_6
 );

reg [31:0]              cnt;
reg                     out_val;
wire                    flag_0, flag_1, flag_2, flag_3;

always @(posedge clk) begin
        if (~rst_n)
                cnt <= 32'b0;
        else
                cnt <= cnt + 1;
end

always @(posedge clk) begin
        if (~rst_n) begin
                GPIO_LED_0 <= 1'b0;
                     GPIO_LED_1 <= 1'b0;
                     GPIO_LED_2 <= 1'b0;
                     GPIO_LED_3 <= 1'b0;
          end
        else begin
                GPIO_LED_0 <= flag_0 ? ~GPIO_LED_0 : GPIO_LED_0;
                     GPIO_LED_1 <= flag_1 ? ~GPIO_LED_1 : GPIO_LED_1;
                     GPIO_LED_2 <= flag_2 ? ~GPIO_LED_2 : GPIO_LED_2;
                     GPIO_LED_3 <= flag_3 ? ~GPIO_LED_3 : GPIO_LED_3;
          end
end

assign flag_0 = (cnt % 32'h100000)  == 32'b0;
assign flag_1 = (cnt % 32'h200000)  == 32'b0;
assign flag_2 = (cnt % 32'h300000)  == 32'b0;
assign flag_3 = (cnt % 32'h400000)  == 32'b0;

always @(*) begin
    GPIO_LED_4 = 1'b1;
    GPIO_LED_5 = 1'b0;
    GPIO_LED_6 = 1'b1;
end

endmodule
