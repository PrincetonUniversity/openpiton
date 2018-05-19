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
 *   Description:
 *      This module implements a 16-bit counter to be used by Execution
 *      Drafting
 */

module sparc_ifu_esl_counter
#(
    parameter   COUNT_BIT_WIDTH = 16
)
(
    input                               clk,
    input                               rst_n,

    // Counter control
    input                               step,
    input                               clear,
    input                               set,

    // Counter output
    output reg [COUNT_BIT_WIDTH-1:0]    count_f
);

    //
    // Signal Declarations
    //

    // Counter next state
    reg [COUNT_BIT_WIDTH-1:0]          count_next;

    //
    // Sequential logic
    //
    
    // State flip-flops
    always @ (posedge clk)
    begin
        if (~rst_n)
            count_f <= {COUNT_BIT_WIDTH{1'b0}};
        else
            count_f <= count_next;
    end

    //
    // Combinational logic
    //

    always @ *
    begin
        count_next = count_f;
        if (clear)
            count_next = {COUNT_BIT_WIDTH{1'b0}};
        else if (set)
            count_next = {{(COUNT_BIT_WIDTH-1){1'b0}}, 1'b1};
        else if (step)
            count_next = count_f + {{(COUNT_BIT_WIDTH-1){1'b0}}, 1'b1};
    end

endmodule
