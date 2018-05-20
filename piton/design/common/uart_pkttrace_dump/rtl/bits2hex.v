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

// Filename: bits2hex.v
// Author: mmckeown
// Description: This module converts 4 bits to an 8-bit hex character

module bits2hex(
    input      [3:0]    bits,
    output reg [7:0]    char
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
    case (bits)
        4'h0: char = "0";
        4'h1: char = "1";
        4'h2: char = "2";
        4'h3: char = "3";
        4'h4: char = "4";
        4'h5: char = "5";
        4'h6: char = "6";
        4'h7: char = "7";
        4'h8: char = "8";
        4'h9: char = "9";
        4'ha: char = "a";
        4'hb: char = "b";
        4'hc: char = "c";
        4'hd: char = "d";
        4'he: char = "e";
        4'hf: char = "f";
        default: char = "?";
    endcase
end

//////////////////////////
// Sub-module Instances //
//////////////////////////

endmodule
