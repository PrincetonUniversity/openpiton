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

module oled_wrapper (
    input   sys_clk,
    input   sys_rst_n,

    input   btnl,
    input   btnr,
    input   btnu,
    input   btnd,

    output  spi_sclk,
    output  spi_dc,
    output  spi_data,

    output  vdd_n,
    output  vbat_n,
    output  rst_n
);
parameter OLED_SYS_CLK_KHZ = 20000;
parameter OLED_SPI_CLK_KHZ = 10000;

localparam STRING_LEN = 64;
localparam DISP_CHAR_NUM = 64;

localparam  IDLE        = 0;
localparam  SENT_CHAR   = 1;
localparam  WAIT        = 2;
localparam  DONE        = 3;

wire                init_done;
reg                 oled_val;
reg     [1:0]       oled_row;
reg     [3:0]       oled_col;
reg     [7:0]       oled_char;
wire                oled_done;

reg     [1:0]       oled_state;
reg     [7:0]       char_cnt;
reg     [7:0]       disp_buf[DISP_CHAR_NUM-1:0];
reg     [0:8*DISP_CHAR_NUM-1]            disp_string;
reg                 btnl_r;
reg                 btnr_r;
reg                 btnu_r;
reg                 btnd_r;
wire                btnl_pulse;
wire                btnr_pulse;
wire                btnu_pulse;
wire                btnd_pulse;

wire                last_char;


assign last_char = char_cnt == (STRING_LEN - 1);

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        oled_state  <= IDLE;
        char_cnt    <= 8'b0;
        oled_val    <= 1'b0;
        oled_row    <= 2'b0;    // TODO: remove?
        oled_col    <= 4'b0;
    end
    else begin
        case (oled_state)
        IDLE: begin
            oled_state  <= init_done  ? SENT_CHAR : oled_state;
            char_cnt    <= 8'b0;
        end
        SENT_CHAR: begin
            oled_state  <= WAIT;
            oled_val    <= 1'b1;
            oled_char   <= disp_buf[char_cnt];
        end
        WAIT: begin
            oled_state  <= oled_done ? ( last_char ? DONE : SENT_CHAR )
                                     : oled_state;
            oled_val    <= 1'b0;
            char_cnt    <= oled_done & ~last_char ? char_cnt + 1 : char_cnt;
        end
        DONE: begin
            oled_state  <= btnl_pulse | btnr_pulse | btnu_pulse | btnd_pulse ? SENT_CHAR : oled_state;
            char_cnt    <= 8'b0;
        end
        default: begin
        end
        endcase
    end
end



ssd1306_top     #(
    .SYS_CLK_FREQ_KHZ   (OLED_SYS_CLK_KHZ   ),
    .SPI_CLK_FREQ_KHZ   (OLED_SPI_CLK_KHZ   )
) ssd1306_top (
    .sys_clk        (sys_clk    ),
    .sys_rst_n      (sys_rst_n  ),

    .init_done      (init_done  ),

    .oled_val       (oled_val   ),
    .oled_row       (oled_row   ),
    .oled_col       (oled_col   ),
    .oled_char      (oled_char  ),
    .oled_done      (oled_done  ),

    .spi_sclk       (spi_sclk   ),
    .spi_dc         (spi_dc     ),
    .spi_data       (spi_data   ),
    
    .vdd_n          (vdd_n      ),
    .vbat_n         (vbat_n     ),
    .rst_n          (rst_n      )
);


always @(posedge sys_clk) begin
    btnl_r <= btnl;
    btnr_r <= btnr;
    btnu_r <= btnu;
    btnd_r <= btnd;
end

assign btnl_pulse = btnl & ~btnl_r;
assign btnr_pulse = btnr & ~btnr_r;
assign btnd_pulse = btnd & ~btnd_r;
assign btnu_pulse = btnu & ~btnu_r;

always @(posedge sys_clk) begin
    disp_string <= `OLED_STRING;
end

generate begin
    genvar i;
    for (i = 0; i < 64; i = i + 1) begin: disp_buf_change
    always @(posedge sys_clk) begin
        if (~sys_rst_n) begin
            disp_buf[i] <= disp_string[8*i:8*(i+1)-1];
        end
        else begin
                disp_buf[i] <= btnl_pulse & (i > 15) ? (i == 31 | i == 47 | i == 63 ? disp_buf[i-15] : disp_buf[i+1]     ) :
                               btnr_pulse & (i > 15) ? (i == 16 | i == 32 | i == 48 ? disp_buf[i+15] : disp_buf[i-1]     ) :
                               btnu_pulse ? (i > 47  ? disp_buf[i-48]   : disp_buf[i+16]    ) :
                               btnd_pulse ? (i < 16  ? disp_buf[i+48]   : disp_buf[i-16]    ) : disp_buf[i];
        end
    end
    end
end
endgenerate

endmodule