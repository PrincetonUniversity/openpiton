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
 * This is a test bench for the test infrastructure
 * sink and source.  It uses randomly generated 64-bit
 * words to test the sink and source modules
 */

`include "test_infrstrct.v"

`define VERBOSITY 0     // Can override from command line

// Helper module
module test_infrstrct_top_helper
(
    input       clk,
    input       rst_n,
    output reg  done
);
    //
    // Signal Declarations
    //

    wire [63:0]     src_bits_sink_bits;
    wire            src_val_sink_val;
    wire            sink_rdy_src_rdy;
    wire            src_done;
    wire            sink_done;

    //
    // Combinational Logic
    //
    
    always @ *
        done = src_done & sink_done;

    //
    // Designs under test (sink and source in this case)
    //

    test_source src
    (
        .clk (clk),
        .rst_n (rst_n),
        .rdy (sink_rdy_src_rdy),
        .bits (src_bits_sink_bits),
        .val (src_val_sink_val),
        .done (src_done)
    );  

    test_sink
    #(
        .VERBOSITY (`VERBOSITY)
    ) sink
    (
        .clk (clk),
        .rst_n (rst_n),
        .bits (src_bits_sink_bits),
        .val (src_val_sink_val),
        .rdy (sink_rdy_src_rdy),
        .out_data_popped (),
        .done (sink_done)
    );

    initial
    begin
        src.RANDOM_DELAY = 0;
        sink.RANDOM_DELAY = 0;
    end

endmodule

// Main testbench top level module
module test_infrstrct_top;

    `TEST_INFRSTRCT_BEGIN("test_infrstrct")

    wire done;
    integer i;

    test_infrstrct_top_helper helper
    (
        .clk (clk),
        .rst_n (rst_n),
        .done (done)
    );

    `TEST_CASE_BEGIN(1, "test_source_sink_no_delay")
    begin
        // Generate random test vectors for this, although you could
        // read the test vectors from a file here
        for (i = 0; i < 1024; i = i + 1)
        begin
            helper.src.m_f[i][31:0] = $random;
            helper.src.m_f[i][63:32] = $random;
            helper.sink.m_f[i] = helper.src.m_f[i];
        end

        `TEST_CASE_RESET 

        #10000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_CASE_BEGIN(2, "test_source_sink_source_delay")
    begin
        helper.src.RANDOM_DELAY = 15;

        // Generate random test vectors for this, although you could
        // read the test vectors from a file here
        for (i = 0; i < 1024; i = i + 1)
        begin
            helper.src.m_f[i][31:0] = $random;
            helper.src.m_f[i][63:32] = $random;
            helper.sink.m_f[i] = helper.src.m_f[i];
        end

        `TEST_CASE_RESET
       
        #100000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_CASE_BEGIN(3, "test_source_sink_sink_delay")
    begin
        helper.src.RANDOM_DELAY = 0;
        helper.sink.RANDOM_DELAY = 15;

        // Generate random test vectors for this, although you could
        // read the test vectors from a file here
        for (i = 0; i < 1024; i = i + 1)
        begin
            helper.src.m_f[i][31:0] = $random;
            helper.src.m_f[i][63:32] = $random;
            helper.sink.m_f[i] = helper.src.m_f[i];
        end

        `TEST_CASE_RESET

        #100000000 `TEST_CHECK ("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END    
    
    `TEST_CASE_BEGIN(4, "test_source_sink_both_delay")
    begin
        helper.src.RANDOM_DELAY = 15;

        // Generate random test vectors for this, although you could
        // read the test vectors from a file here
        for (i = 0; i < 1024; i = i + 1)
        begin
            helper.src.m_f[i][31:0] = $random;
            helper.src.m_f[i][63:32] = $random;
            helper.sink.m_f[i] = helper.src.m_f[i];
        end

        `TEST_CASE_RESET

        #100000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_CASE_BEGIN(5, "test_source_sink_fail")
    begin
        helper.src.RANDOM_DELAY = 0;
        helper.sink.RANDOM_DELAY = 0;

        // Generate random test vectors for this, although you could
        // read the test vectors from a file here
        for (i = 0; i < 1024; i = i + 1)
        begin
            helper.src.m_f[i][31:0] = $random;
            helper.src.m_f[i][63:32] = $random;
            helper.sink.m_f[i][31:0] = $random;
            helper.sink.m_f[i][63:32] = $random;
        end

        `TEST_CASE_RESET

        #10000000 `TEST_CHECK("Timeout check", done, `VERBOSITY)
    end
    `TEST_CASE_END

    `TEST_INFRSTRCT_END(5)

endmodule
