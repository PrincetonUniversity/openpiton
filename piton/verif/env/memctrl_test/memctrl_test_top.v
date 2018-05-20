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

/*
 * This is a test bench for the memctrl_test module
 *
 * Author: mmckeown
 */

`timescale 1ps/1ps

`include "test_infrstrct.v"
`include "mc_define.h"

`define VERBOSITY 0    // Can override from the command line
`define PITON_MEMCTRL_TEST_SIM_CLKS

// Testbench helper module
module memctrl_test_top_helper
(
    input               test_sys_clk,
    input               mc_sys_clk,
    input      [2:0]    addr_mode,
    input      [4:0]    test_mode,
    input               rst_n,
    output reg          done
);

    //
    // Signal Declarations
    //
    
    wire [7:0] led;

    wire [`DDR3_ADDR_WIDTH-1:0]     ddr_addr;
    wire [`DDR3_BA_WIDTH-1:0]       ddr_ba;
    wire                            ddr_cas_n;
    wire [`DDR3_CK_WIDTH-1:0]       ddr_ck_n;
    wire [`DDR3_CK_WIDTH-1:0]       ddr_ck_p;
    wire [`DDR3_CKE_WIDTH-1:0]      ddr_cke;
    wire                            ddr_ras_n;
    wire                            ddr_reset_n;
    wire                            ddr_we_n;
    wire [`DDR3_DQ_WIDTH-1:0]       ddr_dq;
    wire [`DDR3_DQS_WIDTH-1:0]      ddr_dqs_n;
    wire [`DDR3_DQS_WIDTH-1:0]      ddr_dqs_p;
    wire [`DDR3_CS_WIDTH-1:0]       ddr_cs_n;
    wire [`DDR3_DM_WIDTH-1:0]       ddr_dm;
    wire                            ddr_odt;

    //
    // Combinational Logic
    //

    always @ *
        done = ((&led[7:6]) & ~led[5] & led[4]);

    //
    // Module Instantiations
    //

    memctrl_test dut
    (
        .test_sys_clk (test_sys_clk),
        .mc_sys_clk (mc_sys_clk),
        
        .rst_n (rst_n),

        .sw({test_mode,addr_mode}),
        
        .led(led),

        .ddr_addr(ddr_addr),
        .ddr_ba(ddr_ba),
        .ddr_cas_n(ddr_cas_n),
        .ddr_ck_n(ddr_ck_n),
        .ddr_ck_p(ddr_ck_p),
        .ddr_cke(ddr_cke),
        .ddr_ras_n(ddr_ras_n),
        .ddr_reset_n(ddr_reset_n),
        .ddr_we_n(ddr_we_n),
        .ddr_dq(ddr_dq),
        .ddr_dqs_n(ddr_dqs_n),
        .ddr_dqs_p(ddr_dqs_p),
`ifndef NEXYSVIDEO_BOARD
        .ddr_cs_n(ddr_cs_n),
`endif // endif NEXYSVIDEO_BOARD
        .ddr_dm(ddr_dm),
        .ddr_odt(ddr_odt)
    );

`ifdef GENESYS2_BOARD
    // DDR3 models
    ddr3_model ddr3_model0 (
        .rst_n(ddr_reset_n),
        .ck(ddr_ck_p),
        .ck_n(ddr_ck_n),
        .cke(ddr_cke),
        .cs_n(ddr_cs_n),
        .ras_n(ddr_ras_n),
        .cas_n(ddr_cas_n),
        .we_n(ddr_we_n),
        .dm_tdqs(ddr_dm[1:0]),
        .ba(ddr_ba),
        .addr(ddr_addr),
        .dq(ddr_dq[15:0]),
        .dqs(ddr_dqs_p[1:0]),
        .dqs_n(ddr_dqs_n[1:0]),
        .tdqs_n(),
        .odt(ddr_odt)
    );

    ddr3_model ddr3_model1 (
        .rst_n(ddr_reset_n),
        .ck(ddr_ck_p),
        .ck_n(ddr_ck_n),
        .cke(ddr_cke),
        .cs_n(ddr_cs_n),
        .ras_n(ddr_ras_n),
        .cas_n(ddr_cas_n),
        .we_n(ddr_we_n),
        .dm_tdqs(ddr_dm[3:2]),
        .ba(ddr_ba),
        .addr(ddr_addr),
        .dq(ddr_dq[31:16]),
        .dqs(ddr_dqs_p[3:2]),
        .dqs_n(ddr_dqs_n[3:2]),
        .tdqs_n(),
        .odt(ddr_odt)
    ); 
`endif // GENESYS2_BOARD
    
    
endmodule

// Top-level testbench module
module memctrl_test_top;

    `TEST_INFRSTRCT_BEGIN("memctrl_test")

    reg mc_sys_clk = 1;
    always #2500 mc_sys_clk = ~mc_sys_clk;

    wire done;
    integer i;
    reg [2:0] addr_mode;
    reg [4:0] test_mode;

    memctrl_test_top_helper helper
    (
        .test_sys_clk (clk),
        .mc_sys_clk (mc_sys_clk),
        .addr_mode(addr_mode),
        .test_mode(test_mode),
        .rst_n (rst_n),       
        .done (done)
    );

    `TEST_CASE_BEGIN(1, "memctrl_test_walk_ones_64byte_addr")
    begin

        addr_mode = 3'b111;
        test_mode = 5'd0;
        //`TEST_CASE_RESET
        #100000 rst_n = 1'b0;
        #100000 rst_n = 1'b1;
        
        #1000000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_INFRSTRCT_END(1)

endmodule
