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

//----------------------------------
// Start-up sequence
//----------------------------------

module ssd_1306_init (
    input                   start,

    input                   sys_clk,
    input                   sys_rst_n,

    output  reg             spi_val,
    output  reg     [7:0]   spi_data,
    output  reg             spi_dc,
    input                   spi_cmpl,

    output  reg             vdd_n,
    output  reg             vbat_n,
    output  reg             rst_n,

    output                  done
);
parameter   SYS_CLK_FREQ_KHZ = 10000;   // sys clk frequence in KHz

localparam IDLE             = 0;
localparam PULL_VDD         = 1;
localparam ASSERT_RST       = 2;
localparam SENT_CMD         = 3;
localparam WAIT_CMD_CMPL    = 4;
localparam PULL_VBAT        = 5;
localparam DISPL_ON         = 6;
localparam DONE             = 7;

// start-up delays in ms
localparam  VDD_DELAY   = 20;
localparam  RST_DELAY   = 1;
localparam  VBAT_DELAY  = 100;

localparam  CFG_CMD_NUM = 25;

reg [2:0]   init_state;
reg [31:0]  delay_ms;
reg         delay_start;
reg  [5:0]   cmd_cnt;
wire [7:0]   cmd_buff[CFG_CMD_NUM-1:0];
wire        last_cfg_cmd;

wire        delay_end;

assign done         = init_state == DONE;
assign last_cfg_cmd = cmd_cnt == (CFG_CMD_NUM - 1);

always @(posedge sys_clk) begin
    if (~sys_rst_n) begin
        init_state  <= IDLE;
        delay_ms    <= 32'b0;
        delay_start <= 1'b0;
        spi_val     <= 1'b0;
        cmd_cnt     <= 6'b0;
        rst_n       <= 1'b1;
        vdd_n       <= 1'b1;
        vbat_n      <= 1'b1;
    end
    else begin
        case (init_state)
            IDLE: begin
                init_state  <= start ? PULL_VDD : init_state;
                delay_start <= start ? 1'b1  : delay_start;
                delay_ms    <= VDD_DELAY;
                vdd_n       <= 1'b0;
            end
            PULL_VDD: begin
                init_state  <= delay_end ? ASSERT_RST : init_state;
                delay_start <= delay_end ? 1'b1 : 1'b0;
                rst_n       <= delay_end ? 1'b0 : rst_n;
                delay_ms    <= RST_DELAY;
            end
            ASSERT_RST: begin
                init_state  <= delay_end ? SENT_CMD : init_state;
                delay_start <= 1'b0;
                rst_n       <= delay_end ? 1'b1 : rst_n;
            end
            SENT_CMD: begin
                init_state  <= WAIT_CMD_CMPL;
                spi_val     <= 1'b1;
                spi_dc      <= 1'b0;
                spi_data    <= cmd_buff[cmd_cnt];
            end
            WAIT_CMD_CMPL: begin
                init_state  <= spi_cmpl ? (last_cfg_cmd ? PULL_VBAT : SENT_CMD )
                                        : init_state;
                spi_val     <= 1'b0;
                cmd_cnt     <= spi_cmpl & ~last_cfg_cmd ? cmd_cnt + 1 : cmd_cnt;
                vbat_n      <= spi_cmpl & last_cfg_cmd ? 1'b0 : vbat_n;
                delay_start <= spi_cmpl & last_cfg_cmd;
                delay_ms    <= VBAT_DELAY;
            end
            PULL_VBAT: begin
                init_state  <= delay_end ? DISPL_ON : init_state;
                delay_start <= 1'b0;
                spi_val     <= delay_end ? 1'b1 : spi_val;
                spi_data    <= delay_end ? 8'haf : spi_data;
                spi_dc      <= 1'b0;
            end
            DISPL_ON: begin
                init_state  <= spi_cmpl ? DONE : init_state;
                spi_val     <= 1'b0;
            end
            DONE: begin
               init_state   <= init_state; 
            end
            default: begin
            end
        endcase
    end
    
end

// Init commands specified by a manual
assign 
    cmd_buff[0]     = 8'hae,   // Display off
    cmd_buff[1]     = 8'hd5,   // Set Osc Frequency
    cmd_buff[2]     = 8'h80,
    cmd_buff[3]     = 8'ha8,   // Set MUX Ratio
    cmd_buff[4]     = 8'h3f,
    cmd_buff[5]     = 8'hd3,   // Set Offset to 0
    cmd_buff[6]     = 8'h00,
    cmd_buff[7]     = 8'h40,    // Set Start Line
    cmd_buff[8]     = 8'h8d,    // Charge Pump
    cmd_buff[9]     = 8'h14,
    cmd_buff[10]    = 8'hd9,  // Set pre-charge
    cmd_buff[11]    = 8'hf1,
    cmd_buff[12]    = 8'h20,    // Set Memory mode
    cmd_buff[13]    = 8'h00,    // horizontal addressing
    cmd_buff[14]    = 8'h22,    // Set page start/end
    cmd_buff[15]    = 8'h00,    
    cmd_buff[16]    = 8'h03,    
    cmd_buff[17]    = 8'ha0,    // Disable Remap
    cmd_buff[18]    = 8'hc0,    // Scan direction - horizontal
    cmd_buff[19]    = 8'hda,    // pins configuration
    cmd_buff[20]    = 8'h00,
    cmd_buff[21]    = 8'h81,    // Set Contrast
    cmd_buff[22]    = 8'hCF,
    // missed COM detect ??
    cmd_buff[23]    = 8'ha4,    // Resume
    cmd_buff[24]    = 8'ha6;    // Normal Display



oled_delay #(
    .CLK_FREQ_KHZ   (SYS_CLK_FREQ_KHZ )
) oled_delay (
    .clk        (sys_clk        ),
    .rst_n      (sys_rst_n      ),

    .start      (delay_start    ),
    .delay_ms   (delay_ms       ),
    .finish     (delay_end      )
);




endmodule