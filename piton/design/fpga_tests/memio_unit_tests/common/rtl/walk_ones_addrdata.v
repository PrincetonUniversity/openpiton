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

`include "define.tmp.h"

// Filename: walk_ones_addrdata.v
// Author: mmckeown
// Description: This module generates addresses
//              and data for the walking ones
//              data pattern

module walk_ones_addrdata(
    input                               en,

    input      [`PHY_ADDR_WIDTH-1:0]    addr_incr_val,
    input      [`PHY_ADDR_WIDTH-1:0]    mem_top_addr,

    input                               test_state_reset,
    
    input      [`PHY_ADDR_WIDTH-1:0]    curr_addr,
    input      [511:0]                  curr_data,

    output reg [`PHY_ADDR_WIDTH-1:0]    next_addr,
    output reg [511:0]                  next_data,

    output reg                          done
);

///////////////////////
// Type declarations //
///////////////////////

//////////////////////
// Sequential Logic //
//////////////////////

/////////////////////////
// Combinational Logic //
/////////////////////////

always @ *
begin
    // Reset or not enabled address/data values
    if (test_state_reset | ~en)
    begin
        next_addr = {`PHY_ADDR_WIDTH{1'b0}};
        next_data = 512'd1;
        done = 1'b0;
    end
    else
    begin
        // Check if this is the last test case for this address
        // (1 is in the left-most position)
        if (curr_data == (512'd1<<((addr_incr_val<<3)-{{`PHY_ADDR_WIDTH-1{1'b0}}, 1'b1})))
        begin
            // Check if this is the last address for this test. Done condition
            // (testing all addresses)
            if (curr_addr == mem_top_addr)
            begin
                next_addr = curr_addr;
                next_data = curr_data;
                done = 1'b1;
            end
            // If not, go to next address and initial data
            else
            begin
                next_addr = curr_addr + addr_incr_val;
                next_data = 512'd1;
                done = 1'b0;
            end
        end
        // If not, go to next data
        else
        begin
            next_addr = curr_addr;
            next_data = curr_data << 1;
            done = 1'b0;
        end
    end
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
