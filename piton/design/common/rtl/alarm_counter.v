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
 * Filename: alarm_counter.v
 * Description: Counts parameterizable number of cycles and
 *              raises a trigger signal
 * Author: Michael McKeown
 * Date Created: 2/5/2106
 */

module alarm_counter 
(
    input       clk,
    input       rst_n,
    input       en,
    output reg  trigger
);

/*********************/
/* Type declarations */
/*********************/

parameter COUNTER_WIDTH = 7;
parameter ALARM_THRESHOLD = 7'd100;

reg [COUNTER_WIDTH-1:0] count_f, count_next;

/********************/
/* Sequential Logic */
/********************/

always @ (posedge clk)
begin
    if (~rst_n)
        count_f <= {COUNTER_WIDTH{1'b0}};
    else if (en)
        count_f <= count_next;
end

/***********************/
/* Combinational Logic */
/***********************/

always @ *
begin
    if (count_f <= ALARM_THRESHOLD)
    begin
        count_next = count_f + 1'b1;
        trigger = 1'b0;
    end
    else
    begin
        count_next = count_f;
        trigger = 1'b1;
    end
end

/************************/
/* Sub-module Instances */
/************************/

endmodule
