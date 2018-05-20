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

module ssd1306_ctrl (
    input               sys_clk,
    input               sys_rst_n,

    output              init_start,
    input               init_done,

    input               init_spi_val,
    input       [7:0]   init_spi_data,
    input               init_spi_dc,
    output  reg         init_spi_cmpl,

    input               ext_spi_val,
    input       [7:0]   ext_spi_data,
    input               ext_spi_dc,
    output  reg         ext_spi_cmpl,

    output  reg         ctrl_spi_val,
    output  reg [7:0]   ctrl_spi_data,
    output  reg         ctrl_spi_dc,
    input               ctrl_spi_cmpl
);

localparam  IDLE    = 0;
localparam  INIT    = 1;
localparam  EXT     = 2;


reg [1:0]       ssd1306_state;

assign init_start = ssd1306_state == IDLE;

always @(posedge sys_clk) begin
    if(~sys_rst_n) begin
        ssd1306_state   <= IDLE;
    end
    else begin
        case (ssd1306_state)
            IDLE: begin
                ssd1306_state <= INIT;
            end
            INIT: begin
                ssd1306_state <= init_done ? EXT : ssd1306_state;
            end
            EXT: begin
                ssd1306_state <= ssd1306_state;
            end
            default: begin
            end
        endcase
    end
end



always @(*) begin
    case (ssd1306_state)
    INIT: begin
        ctrl_spi_val    <= init_spi_val;
        ctrl_spi_data   <= init_spi_data;
        ctrl_spi_dc     <= init_spi_dc;
        init_spi_cmpl   <= ctrl_spi_cmpl;
        ext_spi_cmpl    <= 1'b0;
    end
    default: begin
        ctrl_spi_val    <= ext_spi_val;
        ctrl_spi_data   <= ext_spi_data;
        ctrl_spi_dc     <= ext_spi_dc;
        ext_spi_cmpl    <= ctrl_spi_cmpl;
        init_spi_cmpl   <= 1'b0;
    end
    endcase
end

endmodule