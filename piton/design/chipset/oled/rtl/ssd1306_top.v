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

module ssd1306_top (
    input                   sys_clk,
    input                   sys_rst_n,

    output                  init_done,

    input                   oled_val,
    input   [1:0]           oled_row,
    input   [3:0]           oled_col,
    input   [7:0]           oled_char,
    output                  oled_done,

    output                  spi_sclk,       // active high    
    output                  spi_dc,         // active low/high
    output                  spi_data,       // active high
    
    output                  vdd_n,       // active low
    output                  vbat_n,      // active low
    output                  rst_n
);
parameter SYS_CLK_FREQ_KHZ = 20000;
parameter SPI_CLK_FREQ_KHZ = 10000;

wire            init_start;

wire            init_spi_val;
wire    [7:0]   init_spi_data;
wire            init_spi_dc;
wire            init_spi_cmpl;

wire            ext_spi_val;
wire    [7:0]   ext_spi_data;
wire            ext_spi_dc;
wire            ext_spi_cmpl;

wire            ctrl_spi_val;
wire    [7:0]   ctrl_spi_data;
wire            ctrl_spi_dc;
wire            ctrl_spi_cmpl;

ssd1306_ctrl    ssd1306_ctrl (
    .sys_clk        (sys_clk        ),
    .sys_rst_n      (sys_rst_n      ),

    .init_start     (init_start     ),
    .init_done      (init_done      ),

    .init_spi_val   (init_spi_val   ),
    .init_spi_data  (init_spi_data  ),
    .init_spi_dc    (init_spi_dc    ),
    .init_spi_cmpl  (init_spi_cmpl  ),

    .ext_spi_val    (ext_spi_val    ),
    .ext_spi_data   (ext_spi_data   ),
    .ext_spi_dc     (ext_spi_dc     ),
    .ext_spi_cmpl   (ext_spi_cmpl   ),

    .ctrl_spi_val   (ctrl_spi_val   ),
    .ctrl_spi_data  (ctrl_spi_data  ),
    .ctrl_spi_dc    (ctrl_spi_dc    ),
    .ctrl_spi_cmpl  (ctrl_spi_cmpl  )
);

ssd_1306_init   #(
    .SYS_CLK_FREQ_KHZ (SYS_CLK_FREQ_KHZ )
) ssd_1306_init (
    .sys_clk        (sys_clk        ),
    .sys_rst_n      (sys_rst_n      ),

    .start          (init_start     ),
    .done           (init_done      ),

    .spi_val        (init_spi_val   ),
    .spi_data       (init_spi_data  ),
    .spi_dc         (init_spi_dc    ),
    .spi_cmpl       (init_spi_cmpl  ),

    .vdd_n          (vdd_n          ),
    .vbat_n         (vbat_n         ),
    .rst_n          (rst_n          )
);


ssd1306_spi     #(
    .SYS_CLK_FREQ_KHZ   (SYS_CLK_FREQ_KHZ   ),
    .SPI_CLK_FREQ_KHZ   (SPI_CLK_FREQ_KHZ   )
) ssd1306_spi (
    .sys_clk        (sys_clk        ),
    .sys_rst_n      (sys_rst_n      ),

    .val_in         (ctrl_spi_val   ),
    .data_in        (ctrl_spi_data  ),
    .dc_in          (ctrl_spi_dc    ),
    .complete       (ctrl_spi_cmpl  ),

    .spi_sclk       (spi_sclk       ),
    .spi_data       (spi_data       ),
    .spi_dc         (spi_dc         )
);

oled_transform  oled_transform (
    .sys_clk        (sys_clk        ),
    .sys_rst_n      (sys_rst_n      ),

    .oled_val       (oled_val       ),
    .oled_row       (oled_row       ),
    .oled_col       (oled_col       ),
    .oled_char      (oled_char      ),
    .oled_done      (oled_done      ),

    .ext_spi_val    (ext_spi_val    ),
    .ext_spi_data   (ext_spi_data   ),
    .ext_spi_dc     (ext_spi_dc     ),
    .ext_spi_cmpl   (ext_spi_cmpl   )
);

endmodule