// Copyright (c) 2015 Christopher Batten
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
//     * Neither the name of Christopher Batten nor the
//       names of its contributors may be used to endorse or promote products
//       derived from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY CHRISTOPHER BATTEN "AS IS" AND
// ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL CHRISTOPHER BATTEN BE LIABLE FOR ANY
// DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

/*
 * This file provides macros for common setup, teardown, and error checking
 * operations for a test bench.
 */

`define TEST_INFRSTRCT_BEGIN(name)                                                  \
    reg          clk = 1;                                                           \
    reg          rst_n = 1;                                                         \
    reg [1023:0] test_case_num = 0;                                                 \
    reg [8*1024:1] test_cases_path;                                                 \
    initial                                                                         \
    begin                                                                           \
        $display ("");                                                              \
        $display (" Entering Test Suite: %s", name);                                \
        $value$plusargs("test_cases_path=%s", test_cases_path);                     \
    end                                                                             \
                                                                                    \
    always #500 clk = ~clk;                                                         \
    always @ *                                                                      \
        if (test_case_num == 0)                                                     \
        begin                                                                       \
            #10000;                                                                 \
            test_case_num = test_case_num + 1;                                      \
        end

`define TEST_INFRSTRCT_END(finalnum)                                                \
    always @ *                                                                      \
        if (test_case_num == (finalnum + 1))                                        \
        begin                                                                       \
            #2500                                                                   \
            $display ("");                                                          \
            $finish;                                                                \
        end                                                                         \

`define TEST_CASE_BEGIN(num, name)                                                  \
    always @ *                                                                      \
    begin                                                                           \
        if (test_case_num == num)                                                   \
        begin                                                                       \
            $display (" + Running Test Case: %s", name);

`define TEST_CASE_RESET                                                             \
    #500  rst_n = 1'b0;                                                             \
    #2500 rst_n = 1'b1;                                                               

`define TEST_CASE_END                                                               \
            test_case_num = test_case_num + 1;                                      \
        end                                                                         \
    end

`define TEST_CHECK(name, boolean, verbosity)                                        \
    if (boolean)                                                                    \
    begin                                                                           \
        if (verbosity)                                                              \
        begin                                                                       \
            $display ("        [PASSED] Test (%s) succeeded ", name);               \
            $display ("Simulation -> PASS (HIT GOOD TRAP)");                        \
        end                                                                         \
    end                                                                             \
    else                                                                            \
        $display ("        [FAILED] Test (%s) failed", name);

`define TEST_EQ(name, tval, cval, verbosity)                                        \
    casez (tval)                                                                    \
        cval :                                                                      \
            if (verbosity)                                                          \
                $display (                                                          \
                    "        [PASSED] Test (%s) succeeded, [%x (expected) == %x]",  \
                    name, tval, cval);                                              \
        default :                                                                   \
        begin                                                                       \
            $display (                                                              \
                "        [FAILED] Test (%s) failed, [%x (expected) != %x]",         \
                name, tval, cval);                                                  \
            $display ("Simulation -> FAIL (HIT BAD TRAP)");                         \
            $finish;                                                                \
        end                                                                         \
    endcase
