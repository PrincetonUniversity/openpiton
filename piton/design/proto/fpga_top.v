// ========== Copyright Header Begin ============================================
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
// ========== Copyright Header End ============================================

/////////////////////////////////////////////////////////////////
//  Filename      : fpga_top.v
//  Created On    : 2015-08-20
//  Author        : Alexey Lavrov
//  Company       : Princeton University
//  Email         : openpiton@princeton.edu
//
//  Description   : Top level file for FPGA simulations
/////////////////////////////////////////////////////////////////


`timescale 1ps/100fs

`ifdef VC707_BOARD
    `define PITON_FPGA_DIFF_CLK
`elsif GENESYS2_BOARD
    `define PITON_FPGA_DIFF_CLK
`endif

`ifdef VC707_BOARD
    `define PITON_FPGA_RST_ACT_HIGH
`endif

`ifdef VC707_BOARD
    `define CLK_HALF_PERIOD_PS  2500
`elsif GENESYS2_BOARD
    `define CLK_HALF_PERIOD_PS  2500
`elsif NEXYSVIDEO_BOARD
    `define CLK_HALF_PERIOD_PS  5000
`endif


module fpga_top();
    
reg         chip_rst;
`ifdef PITON_FPGA_DIFF_CLK
    reg         clk_p;
    reg         clk_n;
`else
    reg         clk;
`endif
reg         pin_rx;
reg         pin_soft_rst;
reg         uart_lb_sw;

wire        led_0;
wire        led_1;
wire        led_2;
wire        led_3;
wire        led_4;
wire        led_5;
wire        fake_noc2_ored;
wire        fake_noc3_ored;

// Hooking up external pins
initial begin
    pin_rx          = 1'b0;
    pin_soft_rst    = 1'b1;
    uart_lb_sw      = 1'b0;
end

// Reset generation
initial begin
    `ifdef PITON_FPGA_RST_ACT_HIGH
        chip_rst = 1;
    `else 
        chip_rst = 0;
    `endif

    `ifdef PITON_FPGA_DIFF_CLK
        repeat(4000)@(posedge clk_n);
    `else
        repeat(4000)@(posedge clk);
    `endif

    chip_rst = ~chip_rst;
end

// Generation of clk
initial begin
    `ifdef PITON_FPGA_DIFF_CLK
        clk_p = 1;
        clk_n = 0;
        forever begin
            #`CLK_HALF_PERIOD_PS clk_p = ~clk_p;
            #`CLK_HALF_PERIOD_PS clk_n = ~clk_n;
        end
    `else
        clk = 0;
        forever begin
            #`CLK_HALF_PERIOD_PS clk = ~clk;
        end
    `endif
end

        
`ifdef VC707_BOARD
`ifdef PITON_FPGA_MC_DDR3
    parameter DQ_WIDTH              = 64;
    parameter DQS_WIDTH             = 8;
    parameter ROW_WIDTH             = 14;
    parameter CS_WIDTH              = 1;
    parameter ODT_WIDTH             = 1;
    parameter DM_WIDTH              = 8;
    parameter CA_MIRROR             = "OFF";

    wire                        ddr3_reset_n;
    wire [DQ_WIDTH-1:0]         ddr3_dq_fpga;
    wire [DQS_WIDTH-1:0]        ddr3_dqs_p_fpga;
    wire [DQS_WIDTH-1:0]        ddr3_dqs_n_fpga;
    wire [ROW_WIDTH-1:0]        ddr3_addr_fpga;
    wire [3-1:0]                ddr3_ba_fpga;
    wire                        ddr3_ras_n_fpga;
    wire                        ddr3_cas_n_fpga;
    wire                        ddr3_we_n_fpga;
    wire [1-1:0]                ddr3_cke_fpga;
    wire [1-1:0]                ddr3_ck_p_fpga;
    wire [1-1:0]                ddr3_ck_n_fpga;

    wire                        init_calib_complete;

    wire [(CS_WIDTH*1)-1:0]     ddr3_cs_n_fpga;
    wire [DM_WIDTH-1:0]         ddr3_dm_fpga;
    wire [ODT_WIDTH-1:0]        ddr3_odt_fpga;

    vc707_ddr3_model    vc707_ddr3_model (
        .ddr3_reset_n           (ddr3_reset_n       ),

        .ddr3_dq_fpga           (ddr3_dq_fpga       ),
        .ddr3_dqs_p_fpga        (ddr3_dqs_p_fpga    ),
        .ddr3_dqs_n_fpga        (ddr3_dqs_n_fpga    ),

        .ddr3_addr_fpga         (ddr3_addr_fpga     ),
        .ddr3_ba_fpga           (ddr3_ba_fpga       ),
        .ddr3_ras_n_fpga        (ddr3_ras_n_fpga    ),
        .ddr3_cas_n_fpga        (ddr3_cas_n_fpga    ),
        .ddr3_we_n_fpga         (ddr3_we_n_fpga     ),
        .ddr3_cke_fpga          (ddr3_cke_fpga      ),
        .ddr3_ck_p_fpga         (ddr3_ck_p_fpga     ),
        .ddr3_ck_n_fpga         (ddr3_ck_n_fpga     ),

        .init_calib_complete    (init_calib_complete),

        .ddr3_cs_n_fpga         (ddr3_cs_n_fpga     ),
        .ddr3_dm_fpga           (ddr3_dm_fpga       ),
        .ddr3_odt_fpga          (ddr3_odt_fpga      )
    );
`endif
`endif

cmp_top cmp_top (
    `ifdef PITON_FPGA_DIFF_CLK
        .clk_p              (clk_p              ),
        .clk_n              (clk_n              ),
    `else
        .pin_clk            (clk                ),
    `endif

    .pin_tx                 (pin_tx             ),
    .pin_rx                 (pin_rx             ),
    
    .pin_rst                (chip_rst           ),
    .pin_soft_rst           (pin_soft_rst       ),

    .led_0                  (led_0              ),
    .led_1                  (led_1              ),
    .led_2                  (led_2              ),
    .led_3                  (led_3              ),
    .led_4                  (led_4              ),
//    .led_5                  (led_5              ),

    .uart_lb_sw             (uart_lb_sw         ),

`ifdef PITON_FPGA_MC_DDR3
    .ddr3_reset_n           (ddr3_reset_n       ),
    .ddr3_dq                (ddr3_dq_fpga       ),
    .ddr3_dqs_p             (ddr3_dqs_p_fpga    ),
    .ddr3_dqs_n             (ddr3_dqs_n_fpga    ),
    .ddr3_addr              (ddr3_addr_fpga     ),
    .ddr3_ba                (ddr3_ba_fpga       ),
    .ddr3_ras_n             (ddr3_ras_n_fpga    ),
    .ddr3_cas_n             (ddr3_cas_n_fpga    ),
    .ddr3_we_n              (ddr3_we_n_fpga     ),
    .ddr3_cke               (ddr3_cke_fpga      ),
    .ddr3_ck_p              (ddr3_ck_p_fpga     ),
    .ddr3_ck_n              (ddr3_ck_n_fpga     ),
    .init_calib_complete    (init_calib_complete),
    .ddr3_cs_n              (ddr3_cs_n_fpga     ),
    .ddr3_dm                (ddr3_dm_fpga       ),
    .ddr3_odt               (ddr3_odt_fpga      ),
`endif

    .fake_noc2_ored         (fake_noc2_ored     ),
    .fake_noc3_ored         (fake_noc3_ored     )

);



endmodule
