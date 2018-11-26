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
//  Filename      : l2_broadcast_counter.v
//  Created On    : 2014-08-14
//  Revision      
//  Author        : Yaosheng Fu
//  Company       : Princeton University
//  Email         : yfu@princeton.edu
//
//  Description   : The broadcast counter in the L2 cache
//
//
//==================================================================================================

`include "l2.tmp.h"
`include "define.tmp.h"

module l2_broadcast_counter(

    input wire clk,
    input wire rst_n,
    input wire [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_max,
    input wire [`MSG_SRC_X_WIDTH-1:0] x_max,
    input wire [`MSG_SRC_Y_WIDTH-1:0] y_max,

    input wire [`CS_OP_WIDTH-1:0] counter_op,
    input wire counter_op_val,
    
    output reg zero,
    output reg max,
    output reg [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_out,
    output reg [`MSG_SRC_X_WIDTH-1:0] x_out,
    output reg [`MSG_SRC_Y_WIDTH-1:0] y_out

);


reg [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_f;
reg [`MSG_SRC_CHIPID_WIDTH-1:0] chipid_next;
reg [`MSG_SRC_X_WIDTH-1:0] x_f;
reg [`MSG_SRC_X_WIDTH-1:0] x_next;
reg [`MSG_SRC_Y_WIDTH-1:0] y_f;
reg [`MSG_SRC_Y_WIDTH-1:0] y_next;



always @ *
begin
    if (!rst_n)
    begin
        chipid_next = 0;
        x_next = 0;
        y_next = 0;
    end
    else if (counter_op_val)
    begin
        if (counter_op == `OP_LD)
        begin
            chipid_next = chipid_max;
            x_next = x_max;
            y_next = y_max;
        end
        else if (counter_op == `OP_CLR)
        begin
            chipid_next = 0;
            x_next = 0;
            y_next = 0;
        end
        else if (counter_op == `OP_ADD)
        begin
            if (x_f == x_max)
            begin
                if (y_f == y_max)
                begin
                    if(chipid_f == chipid_max)
                    begin
                        chipid_next = 0;
                        x_next = 0;
                        y_next = 0;
                    end
                    else        
                    begin
                        chipid_next = chipid_f + 1;
                        x_next = 0;
                        y_next = 0;
                    end
                end
                else
                begin
                    chipid_next = chipid_f;
                    x_next = 0;
                    y_next = y_f + 1;
                end
            end
            else
            begin
                chipid_next = chipid_f;
                x_next = x_f + 1;
                y_next = y_f;
            end
        end
        else
        begin
            chipid_next = chipid_f;
            x_next = x_f;
            y_next = y_f;
        end
    end
    else
    begin
        chipid_next = chipid_f;
        x_next = x_f;
        y_next = y_f;
    end
end


always @ (posedge clk)
begin
    chipid_f <= chipid_next;
    x_f <= x_next;
    y_f <= y_next;
end


always @ *
begin
    zero = (x_f == 0) && (y_f == 0) && (chipid_f == 0);
    max = (x_f == x_max) && (y_f == y_max) && (chipid_f == chipid_max);
end



always @ *
begin
    chipid_out = chipid_f;
    x_out = x_f;
    y_out = y_f;
end

endmodule
