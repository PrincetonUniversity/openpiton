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

/*
 * This is a test bench for the Execution Drafting
 * LFSR.
 */

`include "test_infrstrct.v"

`define VERBOSITY 0  // Can override from command line

// Helper module
module ifu_esl_lfsr_top_helper
(
    input       clk,
    input       rst_n,
    output reg  done
);

    //
    // Signal Declarations
    //

    wire [17:0]     src_bits;
    wire            src_val;
    wire            src_done;

    wire [16:0]     sink_bits;
    wire            sink_rdy;
    wire            sink_done;

    //
    // Combinational Logic
    //

    always @ *
        done = src_done & sink_done;

    //
    // Module instantiations
    //

    // Source module
    test_source
    #(
        .BIT_WIDTH (18),
        .ENTRIES (65536),
        .LOG2_ENTRIES (16)
    ) src
    (
        .clk (clk),
        .rst_n (rst_n),
        .rdy (rst_n),
        .bits (src_bits),
        .val (src_val),
        .done (src_done)
    );

    // Design under test
    sparc_ifu_esl_lfsr dut
    (
        .clk (clk),
        .rst_n (rst_n),
        .lfsr_seed (src_bits[15:0]),
        .lfsr_ld (src_bits[16]),
        .lfsr_step (src_bits[17]),
        .lfsr_state_f (sink_bits[15:0]),
        .lfsr_out_f (sink_bits[16])
    );

    // Sink module
    test_sink
    #(
        .VERBOSITY (`VERBOSITY),
        .BIT_WIDTH (17),
        .ENTRIES (65538),
        .LOG2_ENTRIES (17)
    ) sink
    (
        .clk (clk),
        .rst_n (rst_n),
        .bits (sink_bits),
        .val (rst_n),
        .rdy (sink_rdy),
        .out_data_popped (),
        .done (sink_done)
    );

    // Initialize random delay values
    initial
    begin
        src.RANDOM_DELAY = 0;
        sink.RANDOM_DELAY = 0;
    end

endmodule

// Main test bench top level module
module ifu_esl_lfsr_top;

    `TEST_INFRSTRCT_BEGIN("ifu_esl_lfsr")

    wire done;
    integer i;

    // Plus args for test case
    reg [64*8:1] test_case;
    initial
        $value$plusargs("test_case=%s", test_case);
   
    ifu_esl_lfsr_top_helper helper
    (
        .clk (clk),
        .rst_n (rst_n),
        .done (done)
    );

    `TEST_CASE_BEGIN(1, test_case)
    begin

        // Read in source and sink bits from a file
        $readmemb({test_cases_path, test_case, "_src.vmh"}, helper.src.m_f);
        $readmemb({test_cases_path, test_case, "_sink.vmh"}, helper.sink.m_f);

        `TEST_CASE_RESET

        #1000000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)

        // Reset memories to all x so the next test has fresh memories
        for (i = 0; i < helper.src.ENTRIES; i = i + 1)
            helper.src.m_f[i] = {helper.src.BIT_WIDTH{1'bx}};
        for (i = 0; i < helper.sink.ENTRIES; i = i + 1)
            helper.sink.m_f[i] = {helper.sink.BIT_WIDTH{1'bx}};
    end
    `TEST_CASE_END

    `TEST_INFRSTRCT_END(1)

endmodule
