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
 * This is a test bench for the sdctrl_test module
 *
 * Author: mmckeown
 */

`timescale 1ps/1ps

`include "test_infrstrct.v"
`include "mc_define.h"

`define VERBOSITY 0    // Can override from the command line
`define PITON_SDCTRL_TEST_SIM_CLKS

// Testbench helper module
module sdctrl_test_top_helper
(
    input               test_sys_clk,
    input               spi_sys_clk,
    input      [2:0]    addr_mode,
    input      [4:0]    test_mode,
    input               rst_n,
    output reg          done
);

    //
    // Signal Declarations
    //
    
    wire [7:0] led;

    wire        spi_data_in;
    wire        spi_data_out;
    wire        spi_clk_out;
    wire        spi_cs_n;

    //
    // Combinational Logic
    //

    always @ *
        done = ((&led[7:6]) & ~led[5] & led[4]);

    //
    // Module Instantiations
    //

    sdctrl_test dut
    (
        .test_sys_clk (test_sys_clk),
        .spi_sys_clk (spi_sys_clk),
        
        .rst_n (rst_n),

        .sw({test_mode,addr_mode}),
        
        .led(led),

        .spi_data_in(spi_data_in),
        .spi_data_out(spi_data_out),
        .spi_clk_out(spi_clk_out),
        .spi_cs_n(spi_cs_n)
    );

endmodule

// Top-level testbench module
module sdctrl_test_top;

    `TEST_INFRSTRCT_BEGIN("sdctrl_test")

    reg spi_sys_clk = 1;
    always #1250 spi_sys_clk = ~spi_sys_clk;

    wire done;
    integer i;
    reg [2:0] addr_mode;
    reg [4:0] test_mode;

    sdctrl_test_top_helper helper
    (
        .test_sys_clk (clk),
        .spi_sys_clk (spi_sys_clk),
        .addr_mode(addr_mode),
        .test_mode(test_mode),
        .rst_n (rst_n),       
        .done (done)
    );

    `TEST_CASE_BEGIN(1, "sdctrl_test_address_own_8byte_addr")
    begin

        addr_mode = 3'b100;
        test_mode = 5'd1;
        //`TEST_CASE_RESET
        #100000 rst_n = 1'b0;
        #100000 rst_n = 1'b1;
        
        #10000000000000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_INFRSTRCT_END(1)

endmodule
