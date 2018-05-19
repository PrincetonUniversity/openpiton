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
 * Contains a test source module for providing test vectors to
 * a module or set of modules. Test vectors are read from
 * a .vmh file
 */

module test_source
#(
    parameter BIT_WIDTH         = 64,   // data width of stimuli
    //parameter RANDOM_DELAY      = 0,    // random delay between test stimuli
    parameter ENTRIES           = 1024, // number of test vector entries
    parameter LOG2_ENTRIES      = 10    // log base 2 of the number of test vector entries
)
(
    input                       clk,
    input                       rst_n,

    input                       rdy,

    output [BIT_WIDTH-1:0]      bits,
    output                      val,
    output reg                  done
);

    // This is really a parameter, but VCS doesn't like
    // parameters to be used in left hand sides of always @ *
    // blocks like I want to use it for the test benches.
    // Thus, it is a reg.
    reg [63:0] RANDOM_DELAY; 

    //
    // Internal Parmeters
    //
    parameter WAIT_RANDOM    = 1'b0;
    parameter PUSH_SEND_DATA = 1'b1;

    //
    // Signal Declarations
    //

    // Memory to hold test vectors
    reg [BIT_WIDTH-1:0]     m_f[ENTRIES-1:0];

    // Input index signals
    reg [LOG2_ENTRIES-1:0]  index_f;
    reg [LOG2_ENTRIES-1:0]  index_next;
    reg                     index_en;

    // Random delay signals
    reg [31:0]              rand_delay_f;
    reg [31:0]              rand_delay_next;
    reg                     rand_delay_en;
    reg                     rand_delay_init;
    
    // Output queue signals
    reg [BIT_WIDTH-1:0]    outq_enq_bits;
    reg                    outq_wr_en;
    wire                   outq_full;

    // State register
    reg                    state_f;
    reg                    state_next;

    //
    // Synchronous logic
    //

    // All flip-flops
    always @ (posedge clk)
    begin
        if (~rst_n)
        begin
            index_f         <= 0;
            rand_delay_f    <= 0;
            state_f         <= WAIT_RANDOM;
        end
        else
        begin
            index_f         <= index_next;
            rand_delay_f    <= rand_delay_next;
            state_f         <= state_next;
        end
    end

    //
    // Combinational logic
    //

    // Entry index next value
    always @ *
    begin
        index_next = index_f;
        if (index_en)
            index_next = index_f + 1;
    end

    // Random delay counter next value
    always @ *
    begin
        rand_delay_next = rand_delay_f;
        if (rand_delay_en)
            rand_delay_next = rand_delay_f - 1;
        else if (rand_delay_init)
            rand_delay_next = {$random} % RANDOM_DELAY;
    end

    // Next state logic
    always @ *
    begin
        state_next = state_f;
        case (state_f)
            WAIT_RANDOM:
            begin
                if (!outq_full && !done && (rand_delay_f == 0))
                    state_next = PUSH_SEND_DATA;
            end
            PUSH_SEND_DATA:
            begin
                if (outq_full || done || (RANDOM_DELAY > 0))
                begin
                    state_next = WAIT_RANDOM;
                end
            end
        endcase
    end

    // Enable bits
    always @ *
    begin
        index_en        = (state_f == PUSH_SEND_DATA) & ~outq_full & ~done;
        rand_delay_en   = (state_f == WAIT_RANDOM) & (rand_delay_f > 0) & ~done; 
        rand_delay_init = (state_f == PUSH_SEND_DATA) & (RANDOM_DELAY > 0) & ~done;
    end

    // Output queue signals
    always @ *
    begin
        outq_wr_en      = (state_f == PUSH_SEND_DATA) & ~outq_full && ~done;
        outq_enq_bits   = m_f[index_f];
    end

    // Done signal
    always @ *
        done = ((m_f[index_f] === {BIT_WIDTH{1'bx}}) | (index_f == (ENTRIES-1)));

    //
    // Helper module instantiations
    //

    // Output queue
    test_infrstrct_fifo
    #(
        .BIT_WIDTH (BIT_WIDTH),
        .ENTRIES (16),
        .LOG2_ENTRIES (4)
    ) outQ
    (
        .clk (clk),
        .rst_n (rst_n),
        .din (outq_enq_bits),
        .wr_en (outq_wr_en),
        .rd_en (rdy),
        .dout (bits),
        .full (outq_full),
        .empty (),
        .val (val)
    );

endmodule
