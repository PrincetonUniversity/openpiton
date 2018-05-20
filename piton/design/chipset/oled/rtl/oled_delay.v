// Copyright (c) 2016 Princeton University
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

module oled_delay (
    input           clk,
    input           rst_n,

    input           start,
    input   [31:0]  delay_ms,
    output          finish
);
parameter CLK_FREQ_KHZ = 10000;

reg     [31:0]      cnt;
reg     [31:0]      ms_cnt;
reg                 processing;

wire                ms_tick;

assign finish = processing & (cnt == 32'b0);

assign ms_tick = ms_cnt == CLK_FREQ_KHZ;

always @(posedge clk) begin
    if (~rst_n) begin
        ms_cnt <= 32'b0;
    end
    else begin
        ms_cnt <= start | ms_tick   ? 32'b0         :
                  processing        ? ms_cnt + 1    :   ms_cnt;
    end
end

always @(posedge clk) begin
    if (~rst_n) begin
        cnt <= 32'b0;
        processing <= 1'b0;
    end
    else begin
        cnt <=  start               ? delay_ms     :
                ms_tick & ~finish   ? cnt -1    : cnt;
        processing <=   start       ? 1'b1 :
                        finish      ? 1'b0 : processing;
    end
end


endmodule