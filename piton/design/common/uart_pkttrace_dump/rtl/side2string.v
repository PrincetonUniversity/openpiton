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

// Filename: side2string.v
// Author: mmckeown
// Description: This module converts a side of the uart_pkttrace_dump
//              to a string

module side2string #(
    // Both side strings should have same length
    parameter               SIDE1_STRING = "SIDE1",
    parameter               SIDE2_STRING = "SIDE2",
    parameter               SIDE_STRING_LEN_BITS = 40
)(
    input      [1:0]                        side_id,
    output reg [SIDE_STRING_LEN_BITS-1:0]   side_string  
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
    case (side_id)
        2'd1: side_string = SIDE1_STRING;
        2'd2: side_string = SIDE2_STRING;
        default: side_string = {(SIDE_STRING_LEN_BITS/8){"?"}};
    endcase
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
