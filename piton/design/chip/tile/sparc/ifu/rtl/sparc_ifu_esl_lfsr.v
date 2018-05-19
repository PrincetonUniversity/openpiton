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
//  Description:
//      An LFSR for the Execution Drafting random thread synchronization method.
//      The LFSR provides pseudo-randomness in selecting a random thread to execute.
//      It is a 16-bit LFSR with the following polynomial:
//          x^16 + x^14 + x^13 + x^11 + 1
*/

module sparc_ifu_esl_lfsr 
(
    input               clk,
    input               rst_n,

    // Seeding the LFSR
    input [15:0]        lfsr_seed,
    input               lfsr_ld,

    // Enable signal for LFSR
    input               lfsr_step,

    // LFSR state output
    output reg [15:0]   lfsr_state_f,

    // LFSR bit stream output
    output reg          lfsr_out_f
);

    //
    // Signal Declarations
    //
    
    // LFSR next state
    reg [15:0]          lfsr_state_next;

    //
    // Sequential logic
    //

    // State flip-flops
    always @ (posedge clk)
    begin
        if (~rst_n)
            lfsr_state_f <= 16'b0;
        else
            lfsr_state_f <= lfsr_state_next;
    end
    
    //
    // Combinational Logic
    // 
    
    always @ *
    begin
        // Next state logic
        lfsr_state_next = lfsr_state_f;
        if (rst_n && lfsr_ld)
            lfsr_state_next = lfsr_seed;
        else if (rst_n && lfsr_step)
            lfsr_state_next = {lfsr_state_f[14:0], 
                               lfsr_state_f[15] ^ lfsr_state_f[13] ^ lfsr_state_f[12] ^ lfsr_state_f[10]};

        // Output bitstream comes from the 16th state bit
        lfsr_out_f = lfsr_state_f[15];
    end

endmodule // sparc_esl_lfsr
