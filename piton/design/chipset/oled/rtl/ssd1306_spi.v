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

module ssd1306_spi (
    input           sys_clk,
    input           sys_rst_n,

    input           val_in,
    input   [7:0]   data_in,
    input           dc_in,
    output          complete,

    output reg      spi_sclk,
    output          spi_data,
    output reg      spi_dc
);
parameter SYS_CLK_FREQ_KHZ = 20000;
parameter SPI_CLK_FREQ_KHZ = 10000;

localparam SYS_SPI_CLK_RATIO = SYS_CLK_FREQ_KHZ / SPI_CLK_FREQ_KHZ;
localparam SYS_TICKS_IN_SPI_HALF  = SYS_SPI_CLK_RATIO / 2;

reg [7:0]   sys_tick_cnt;
reg [7:0]   shift_r;
reg         sclk_falling;
reg [2:0]   bit_cnt;
reg         processing;

wire        sclk_front;

assign sclk_front = sys_tick_cnt == (SYS_TICKS_IN_SPI_HALF - 1);
assign spi_data = shift_r[7];
assign complete = processing & (bit_cnt == 3'h7) & sclk_front & ~sclk_falling;

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        sys_tick_cnt <= 8'b0;
    end
    else begin
        sys_tick_cnt <= val_in | sclk_front | ~processing ? 8'b0 : sys_tick_cnt + 1;
    end
end

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        spi_sclk    <= 1'b1;
        sclk_falling <= 1'b0;
    end
    else begin
        spi_sclk    <=  val_in          ? 1'b0          :
                        sclk_front &
                        processing      ? ~spi_sclk     : spi_sclk;
        sclk_falling <= val_in          ? 1'b0          :
                        sclk_front      ? ~sclk_falling : sclk_falling;
        shift_r     <=  val_in          ? data_in       :
                        sclk_front &
                        sclk_falling    ? shift_r << 1  : shift_r;
        spi_dc      <=  val_in          ? dc_in         : spi_dc;
    end
end

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        bit_cnt  <= 3'b0;
        processing <= 1'b0;
    end
    else begin
        bit_cnt     <=  val_in | complete           ? 3'b0          :
                        sclk_falling & sclk_front &
                        processing                  ? bit_cnt + 1   : bit_cnt;
        processing  <= val_in       ? 1'b1 :
                       complete     ? 1'b0 : processing; 
    end
end

endmodule