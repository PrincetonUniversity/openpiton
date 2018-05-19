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
 *      This module implements a 49-bit shift register with wrap around
 *      to be used by Execution Drafting
 */

module sparc_ifu_esl_shiftreg
#(
    parameter SHIFT_REG_BIT_WIDTH = 16
)
(
    input                                   clk,
    input                                   rst_n,

    // Counter control
    input                                   step,
    input                                   set,

    // Counter output
    output reg [SHIFT_REG_BIT_WIDTH-1:0]    shift_reg_f
);

    //
    // Signal Declarations
    //

    // Counter next state
    reg [SHIFT_REG_BIT_WIDTH-1:0]          shift_reg_next;

    //
    // Sequential logic
    //
    
    // State flip-flops
    always @ (posedge clk)
    begin
        if (~rst_n)
            shift_reg_f <= {SHIFT_REG_BIT_WIDTH{1'b0}};
        else
            shift_reg_f <= shift_reg_next;
    end

    //
    // Combinational logic
    //

    always @ *
    begin
        shift_reg_next = shift_reg_f;
        if (set)
            shift_reg_next = {{(SHIFT_REG_BIT_WIDTH-1){1'b0}}, 1'b1};
        else if (step)
            shift_reg_next = {shift_reg_f[SHIFT_REG_BIT_WIDTH-2:0], shift_reg_f[SHIFT_REG_BIT_WIDTH-1]};
    end

endmodule
