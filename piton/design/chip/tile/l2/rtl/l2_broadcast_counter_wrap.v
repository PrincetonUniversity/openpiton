/*
Copyright (c) 2015 Princeton University
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Princeton University nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==================================================================================================
//  Filename      : l2_broadcast_counter_wrap.v
//  Created On    : 2014-08-14
//  Revision      
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The wrap module for the broadcast counter in the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_broadcast_counter_wrap(

    input wire clk,
    input wire rst_n,
    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_max,
    input wire [`MSG_SRC_X_WIDTH-1:0] x_max,
    input wire [`MSG_SRC_Y_WIDTH-1:0] y_max,
    input wire pipe_sel,

    input wire [`CS_OP_WIDTH-1:0] counter_op1,
    input wire counter_op_val1,
   

    input wire [`CS_OP_WIDTH-1:0] counter_op2,
    input wire counter_op_val2,
 
    output wire zero1,
    output wire max1,
    output reg  avail1,
    output wire [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_out1,
    output wire [`MSG_SRC_X_WIDTH-1:0] x_out1,
    output wire [`MSG_SRC_Y_WIDTH-1:0] y_out1,

    output wire zero2,
    output wire max2,
    output reg  avail2,
    output wire [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_out2,
    output wire [`MSG_SRC_X_WIDTH-1:0] x_out2,
    output wire [`MSG_SRC_Y_WIDTH-1:0] y_out2
);


reg state_f;
reg state_next;

always @ *
begin
    if (!rst_n)
    begin
        state_next = 1'b0;
    end
    else
    begin
        if (counter_op_val1 && (counter_op1 == `OP_ADD))
        begin
            state_next = 1'b1;
        end
        else if (counter_op_val2 && (counter_op2 == `OP_CLR))
        begin
            state_next = 1'b0;
        end
        else
        begin
            state_next = state_f;
        end
    end
end


always @ (posedge clk)
begin
    state_f <= state_next;
end


always @ *
begin
    avail1 = (state_f == 1'b0);
    avail2 = (state_f == 1'b0);
end


l2_broadcast_counter l2_broadcast_counter1(
    .clk                (clk),
    .rst_n              (rst_n), 
    .chipid_max         (chipid_max),
    .x_max              (x_max),
    .y_max              (y_max),
    .counter_op         (counter_op1),
    .counter_op_val     (counter_op_val1),
    .zero               (zero1),
    .max                (max1),
    .chipid_out         (chipid_out1),
    .x_out              (x_out1),
    .y_out              (y_out1)

);

l2_broadcast_counter l2_broadcast_counter2(
    .clk                (clk),
    .rst_n              (rst_n), 
    .chipid_max         (chipid_max),
    .x_max              (x_max),
    .y_max              (y_max),
    .counter_op         (counter_op2),
    .counter_op_val     (counter_op_val2),
    .zero               (zero2),
    .max                (max2),
    .chipid_out         (chipid_out2),
    .x_out              (x_out2),
    .y_out              (y_out2)

);


endmodule
