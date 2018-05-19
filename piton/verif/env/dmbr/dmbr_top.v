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
 * This is a test bench for the dmbr module
 *
 * Author: Yanqi Zhou
 */

`include "test_infrstrct.v"

`define VERBOSITY 0    // Can override from the command line

// Testbench helper module
module dmbr_top_helper
(
    input       clk,
    input       rst_n,
    output reg  done
);

    //
    // Signal Declarations
    //

    // TODO: Fill in SRC_BIT_WIDTH with the sum of all
    //       DUT input widths excluding clk and rst_n
    wire [SRC_BIT_WIDTH-1:0]    src_bits;
    wire                        src_val;
    wire                        src_done;

    // TODO: Fill in SINK_BIT_WIDTH with the sum of all
    //       DUT output widths
    wire [SINK_BIT_WIDTH-1:0]   sink_bits;
    wire                        sink_rdy;
    wire                        sink_done;

    //
    // Combinational Logic
    //

    always @ *
        done = src_done & sink_done;

    //
    // Module Instantiations
    //

    // Source module
    // TODO: Fill in SRC_BIT_WIDTH with the sum of all
    //       DUT input widths excluding clk and rst_n
    // TODO: Fill in SRC_ENTRIES with the maximum number
    //       of test vectors one of your test cases will have
    // TODO: Fill in SRC_LOG2_ENTRIES with the base 2 log of
    //       SRC_ENTRIES
    test_source
    #(
        .BIT_WIDTH (SRC_BIT_WIDTH),
        .ENTRIES (SRC_ENTRIES),
        .LOG2_ENTRIES (SRC_LOG2_ENTRIES)
    ) src
    (
        .clk (clk),
        .rst_n (rst_n),
        .rdy (rst_n), // TODO: If your DUT has a val/rdy interface hook it up here
        .bits (src_bits),
        .val (src_val), // TODO: if your DUT as a val/rdy interface hook it up here
        .done (src_done)
    );

    // Design under test (DUT)
    // TODO: change module name if this is not the correct one
    dmbr dut
    (
        .clk (clk),
        .rst_n (rst_n),
        // TODO: Fill in your DUT inputs and outputs here,
        //       with the src_bits feeding your inputs and
        //       the sink_bits connected to your outputs.
        //       Below is an example.
        .input0 (src_bits[15:0]),
        .input1 (src_bits[16]),
        .input2 (src_bits[17]),
        .output0 (sink_bits[15:0]),
        .output1 (sink_bits[16])
    );

    // Sink module
    // TODO: Fill in SINK_BIT_WIDTH with the sum of all
    //       DUT output widths
    // TODO: Fill in SINK_ENTRIES with the maximum number 
    //       of monitor vectors one of your test cases will have
    // TODO: Fill in SINK_LOG2_ENTRIES with the base 2 of
    //       SINK_ENTRIES
    test_sink
    #(
        .VERBOSITY (`VERBOSITY),
        .BIT_WIDTH (SINK_BIT_WIDTH),
        .ENTRIES (SINK_ENTRIES),
        .LOG2_ENTRIES (SINK_LOG2_ENTRIES)
    ) sink
    (
        .clk (clk),
        .rst_n (rst_n),
        .bits (sink_bits),
        .val (rst_n), // TODO: If your DUT has a val/rdy interface hook it up here
        .rdy (sink_rdy), // TODO: If your DUT as a val/rdy interface hook it up here
        .out_data_popped (),
        .done (sink_done)
    );

    // Initialize source and sink random delay values
    initial
    begin
        src.RANDOM_DELAY = 0;
        sink.RANDOM_DELAY = 0;
    end

endmodule

// Top-level testbench module
module dmbr_top;

    `TEST_INFRSTRCT_BEGIN("dmbr")

    wire done;
    integer i;

    dmbr_top_helper helper
    (
        .clk (clk),
        .rst_n (rst_n),
        .done (done)
    );

    // TODO: Replace "dmbr_test1" with a
    //       descriptive name for this test case.
    //       The first argument to this macro is the 
    //       test case number.  This should begin at 1
    //       and increment for subsequent test cases
    `TEST_CASE_BEGIN(1, "dmbr_test1")
    begin

        // TODO: This is where you setup the test case.
        //       There are a few things you may want to do here:
        //           - Set the RANDOM_DELAY value of the src and sink.
        //             This controls whether a random delay is inserted
        //             between applying signals (src) or checking the
        //             outputs (sink).  Note that if your DUT does not
        //             implement a val/rdy interface that is hooked up to
        //             to the src and sink, the previous value before the
        //             random delay will still be applied/checked since your
        //             DUT has no way of telling/conveying whether the values
        //             being applied/checked are valid.  Set these values to
        //             0 if you do not want a random delay.  They are set by
        //             default to 0.  If you do plan to use these, know that
        //             the values you set will carry over to the next test
        //             case, so you may need to reset them back to 0 or to
        //             a new value if you do not want them to be the same.
        //             Below is an example of setting the random delay to 15
        //             for both the src and sink:
        //
        //                     helper.src.RANDOM_DELAY = 15;
        //                     helper.sink.RANDOM_DELAY = 15;
        //
        //           - Read values from a .vmh file into the src and sink memories.
        //             This allows you to write your test cases in the form of .vmh
        //             and keep them separate from the test bench.  Thus, you will 
        //             not need to recompile when you change the test vectors in a
        //             test case.  You could also use the Verilog plusargs system
        //             function to convey which test to run from the command line.
        //             Below is an example of reading test case vectors from
        //             statically configured .vmh files into the src and sink memories:
        //
        //                     $readmemb({test_cases_path, "test1_src.vmh"}, helper.src.m_f);
        //                     $readmemb({test_cases_path, "test1_sink.vmh"}, helper.sink.m_f);
        //
        //             Note that the variable test_cases_path is set by the `TEST_INFRSTRCT_BEGIN
        //             macro and is read from the command line.  The command line variable is always
        //             set via the $DV_ROOT/tools/src/sims/dmbr.config file, so you do not
        //             need to worry about it.  It points to the absolute path to your test cases
        //             which is by default set to the test_cases directory in the environment
        //             directory.
        //
        //             Also note that readmemb expects the test vectors to be specified in binary
        //             in the .vmh file, while you can use readmemh if you prefer to write your
        //             .vmh files in hexadecimal.
        //
        //             Below is an example of how you might read the test case specified at the
        //             command line and initialize the src and sink memories based on that:
        //
        //                     $value$plusargs("test_case=%s", test_case);
        //                     $readmemb({test_cases_path, test_case, "_src.vmh"}, helper.src.m_f);
        //                     $readmemb({test_cases_path, test_case, "_sink.vmh"}, helper.sink.m_f);
        //
        //             Note you will need to declare the variable test_case above, as this
        //             is inside of an always @ * block, where you cannot declare variables.
        //             The test_case variable should be declared as reg like this:
        //
        //                     reg [64*8:1] test_case;  // Max 64 characters
        //
        //             You can specify the test_case variable at the command line of the compiled
        //             simv file for this test bench using the plus arguments, i.e. +test_case=test1.
        //             You can also specify this at the command line of the sims script used to run
        //             the simulations with the sim_run_args switch, i.e. -sim_run_args=+test_case=test1.
        //
        //             For more info on Verilog plusargs, visit: http://www.project-veripage.com/plusarg.php
        //
        //           - Initialize the src and sink memories from Verilog.  This option is
        //             generally good if the test case is rather simple and the memories
        //             can easily be initialized from Verilog. Below is an example of initializing
        //             the memories with random values and may be used for a DUT which just passes
        //             values through, such as a flow-controlled network link:
        //
        //                     for (i = 0; i < helper.src.ENTRIES; i = i + 1)
        //                     begin
        //                         helper.src.m_f[i] = $random;
        //                         helper.sink.m_f[i] = helper.src.m_f[i];
        //                     end

        // Apply reset signal
        `TEST_CASE_RESET

        // Do a timeout check in case DUT stalls
        // TODO: Ensure the timeout delay is set appropriately for this test case.
        //       If the value is too small, the test case will always fail because
        //       the source and sink were not able to traverse their memories before
        //       timeout.  If this value is too large, it may affect simulation time
        #100000 `TEST_CHECK("Timeout check", done, `VERBOSITY)

        // Reset memories to all x so the next test has fresh memories
        for (i = 0; i < helper.src.ENTRIES; i = i + 1)
            helper.src.m_f[i] = {helper.src.BIT_WIDTH{1'bx}};
        for (i = 0; i < helper.sink.ENTRIES; i = i + 1)
            helper.sink.m_f[i] = {helper.sink.BIT_WIDTH{1'bx}};

    end
    `TEST_CASE_END

    // TODO: Add additional test cases here.  Be sure to increment
    //       the test number and change the name

    // TODO: Replace NUM_TEST_CASES with the number of test cases in this testbench
    `TEST_INFRSTRCT_END(NUM_TEST_CASES)

endmodule