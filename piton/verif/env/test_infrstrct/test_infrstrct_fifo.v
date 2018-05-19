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
 * FIFO module used in test infrastructure
 */

module test_infrstrct_fifo
#(
    parameter BIT_WIDTH     = 64,   // data width 
    parameter ENTRIES       = 16,   // number of entries in the FIFP
    parameter LOG2_ENTRIES  = 4     // log base 2 of number of entries in FIFO
)
(
    input                       clk,
    input                       rst_n,

    input [BIT_WIDTH-1:0]       din,
    input                       wr_en,
    input                       rd_en,

    output reg [BIT_WIDTH-1:0]  dout,
    output reg                  full,
    output reg                  empty,
    output reg                  val  
);

    //
    // Signal Declarations
    //

    // FIFO memory
    reg [BIT_WIDTH-1:0]         m_f[ENTRIES-1:0];
    reg [BIT_WIDTH-1:0]         m_next;
    integer                     i;

    // Pointer variables
    reg [LOG2_ENTRIES-1:0]      wr_pointer_f;
    reg [LOG2_ENTRIES-1:0]      wr_pointer_next;
    reg [LOG2_ENTRIES-1:0]      rd_pointer_f;
    reg [LOG2_ENTRIES-1:0]      rd_pointer_next;

    // Entry count variables
    reg [LOG2_ENTRIES:0]        entry_count_f;
    reg [LOG2_ENTRIES:0]        entry_count_next;

    //
    // Synchronous logic
    //
    
    // All flip-flops
    always @ (posedge clk)
    begin
        if (~rst_n)
        begin
            wr_pointer_f        <= 0;
            rd_pointer_f        <= 0;
            entry_count_f       <= 0;
            for (i = 0; i < ENTRIES; i = i + 1)
                m_f[i] <= 0;
        end
        else
        begin
            wr_pointer_f        <= wr_pointer_next;
            rd_pointer_f        <= rd_pointer_next;
            entry_count_f       <= entry_count_next;
            m_f[wr_pointer_f]   <= m_next;
        end
    end
    
    //
    // Combinational logic
    // 

    // Write and read pointers
    always @ *
    begin
        wr_pointer_next = wr_pointer_f;
        rd_pointer_next = rd_pointer_f;
        if (wr_en)
            wr_pointer_next = wr_pointer_f + 1;
        if (rd_en && val)
            rd_pointer_next = rd_pointer_f + 1;
    end

    // Write logic
    always @ *
    begin
        m_next = m_f[wr_pointer_f];
        if (wr_en)
            m_next = din;
    end

    // Output data and valid signal
    always @ *
    begin
        // Take care of case where we are writing and reading
        // on the same cycle to the same location
        if (rd_en && wr_en && rd_pointer_f == wr_pointer_f)
        begin
            dout = din;
            val = 1'b1;
        end
        else
        begin
            dout = m_f[rd_pointer_f];
            val = rd_en && ~empty;
        end
    end

    // Entry count
    always @ *
    begin
        entry_count_next = entry_count_f;
        if (rd_en && !wr_en && (entry_count_f != 0))
            entry_count_next = entry_count_f - 1;
        else if (!rd_en && wr_en && (entry_count_f != ENTRIES))
            entry_count_next = entry_count_f + 1;
    end

    // Full/empty logic
    always @ *
    begin
        full = (entry_count_f == (ENTRIES-1));
        empty = (entry_count_f == 0);
    end

endmodule
