// Copyright (c) 2020 Princeton University
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

// Filename: sync_fifo.v
// Author: Fei Gao
// Description: Synchronous FIFO. For easy implemnetation, the fifo depth requires
//              to be at least 2. Added between router and noc splitter to cut 
//              the long critical path.

`include "define.tmp.h"

module sync_fifo_vr #(
    parameter   DATA_WIDTH     = 64,
    // FIFO_DEPTH needs to be at least 2. 
    parameter   FIFO_DEPTH     = 4
) (
    input                               clk,
    input                               rst_n,

    input                               enqueue_vr_val,
    input       [DATA_WIDTH-1:0]        enqueue_vr_dat,
    output                              enqueue_vr_rdy,

    output                              dequeue_vr_val,
    output      [DATA_WIDTH-1:0]        dequeue_vr_dat,
    input                               dequeue_vr_rdy
);

    // clog2.
    function integer clog2;
      // Value to calculate clog2 on
      input integer value;
    begin
      for (clog2=0; value>0; clog2=clog2+1) begin
        value = value >> 1;
      end
    end
    endfunction

    localparam PTR_WIDTH = (FIFO_DEPTH >= 2) ? clog2(FIFO_DEPTH-1) : 1; 

    wire empty, full;
    reg [PTR_WIDTH-1:0] enq_ptr, deq_ptr;
    wire [PTR_WIDTH-1:0] enq_ptr_plus1, deq_ptr_plus1;
    reg [DATA_WIDTH-1:0] buf_dat[FIFO_DEPTH-1:0];

    assign enq_ptr_plus1 = (enq_ptr < (FIFO_DEPTH-1)) ? (enq_ptr + 1) : {PTR_WIDTH{1'b0}};
    assign deq_ptr_plus1 = (deq_ptr < (FIFO_DEPTH-1)) ? (deq_ptr + 1) : {PTR_WIDTH{1'b0}};

    assign empty = (enq_ptr == deq_ptr);
    assign full = (enq_ptr_plus1 == deq_ptr);
    assign dequeue_vr_val = ~empty;
    assign enqueue_vr_rdy = ~full;


    assign dequeue_vr_dat = buf_dat[deq_ptr];

    always @(posedge clk) begin
        if (~rst_n) begin
            enq_ptr <= {PTR_WIDTH{1'b0}};
            deq_ptr <= {PTR_WIDTH{1'b0}};
        end
        else begin 
            if (enqueue_vr_val && enqueue_vr_rdy) begin
                enq_ptr   <= enq_ptr_plus1;
                buf_dat[enq_ptr] <= enqueue_vr_dat;
            end
            if (dequeue_vr_val && dequeue_vr_rdy) begin
                deq_ptr   <= deq_ptr_plus1;
            end
        end
    end

endmodule

