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

/********************************************************************
 * Author: Sam Payne
 * 
 * Module encapsulates logic used to choose between 3 on chip networks
 * based upon round robin ordering factoring in which networks are 
 * empty and which have been given priority previously
 * *******************************************************************/


`timescale 1ns/1ps

module bridge_network_chooser(
    rst,
    clk,
    data_out,
    data_channel,
    din_1,
    rdy_1,
    val_1,
    din_2,
    rdy_2,
    val_2,
    din_3,
    rdy_3,
    val_3,
    credit_from_fpga
);


input rst;
input clk;

input [63:0] din_1;
input [63:0] din_2;
input [63:0] din_3;
input        val_1;
input        val_2;
input        val_3;
input [ 2:0] credit_from_fpga;

output [63:0] data_out;
output [ 1:0] data_channel;
output        rdy_1;
output        rdy_2;
output        rdy_3;

reg [8:0] credit_1; //holds the number of in flight instructions
reg [8:0] credit_2;
reg [8:0] credit_3;

wire [1:0] select;
reg  [1:0] select_reg;
reg  [0:0] select_counter;

reg sel_23;
reg sel_13;
reg sel_12;
reg [1:0] sel_123;


/*********************************************************
//Combinational Logic
*********************************************************/
assign data_out =   rdy_1 ? din_1 :
                    rdy_2 ? din_2 :
                    rdy_3 ? din_3 : 64'd0;

assign data_channel = select; 

assign rdy_1 = (select == 2'b01 && select_counter == 1'b0) ? 1'b1 : 1'b0;
assign rdy_2 = (select == 2'b10 && select_counter == 1'b0) ? 1'b1 : 1'b0;
assign rdy_3 = (select == 2'b11 && select_counter == 1'b0) ? 1'b1 : 1'b0;

assign select = ( (select_counter != 1'b0         ) )   ? select_reg :
                ( (credit_1 == 9'd255 || ~val_1) &&            //3 networks full
                  (credit_2 == 9'd255 || ~val_2) && 
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b00  :
                ( (credit_2 == 9'd255 || ~val_2) &&            //2 networks full
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b01  :
                ( (credit_1 == 9'd255 || ~val_1) &&
                  (credit_3 == 9'd255 || ~val_3) )   ? 2'b10  :
                ( (credit_1 == 9'd255 || ~val_1) &&
                  (credit_2 == 9'd255 || ~val_2) )   ? 2'b11  :
                ( (credit_1 == 9'd255 || ~val_1) )   ? (sel_23 ? 2'b11 : 2'b10) : //1 network full
                ( (credit_2 == 9'd255 || ~val_2) )   ? (sel_13 ? 2'b11 : 2'b01) :
                ( (credit_3 == 9'd255 || ~val_3) )   ? (sel_12 ? 2'b10 : 2'b01) :
                                                sel_123; //0 networks full


/*********************************************************
//Sequential Logic
*********************************************************/

always @(posedge clk) begin
    if(rst) begin
        select_reg <= 2'd0;
    end
    else begin
        select_reg <= select;
    end
end

always @(posedge clk) begin
    if(rst) begin
        credit_1 <= 9'd0;
        credit_2 <= 9'd0;
        credit_3 <= 9'd0;
        sel_23 <= 0;
        sel_13 <= 0;
        sel_12 <= 0;
        sel_123 <= 0;

        select_counter <= 0;
    end
    else begin
        //update select hold
        if(select == 0) begin
            select_counter <= 0;
        end
        else begin
            select_counter <= select_counter + 2'b01; 
        end

        //update incoming credits
        if(credit_from_fpga[0] & ~(rdy_1 & val_1)) begin
            credit_1 <= credit_1 - 9'd1;
        end
        if(credit_from_fpga[1] & ~(rdy_2 & val_2)) begin
            credit_2 <= credit_2 - 9'd1;
        end
        if(credit_from_fpga[2] & ~(rdy_3 & val_3)) begin
            credit_3 <= credit_3 - 9'd1;
        end
        
        if((credit_1 < 9'd255) &&
           (credit_2 < 9'd255) &&
           (credit_3 < 9'd255) &&
           (sel_123 == 0)         )
            sel_123 <= 2'b01;

        //update outgoing credits
        if(rdy_1 & val_1) begin
            sel_13 <= 1;
            sel_12 <= 1;
            if (sel_123 == 2'b01) begin
                sel_123 <= 2'b10;
            end
            if(~credit_from_fpga[0]) begin
                credit_1 <= credit_1 + 9'd1;
            end
        end 
        if(rdy_2 & val_2) begin
            sel_23 <= 1;
            sel_12 <= 0;
            if (sel_123 == 2'b10) begin
                sel_123 <= 2'b11;
            end
            if( ~credit_from_fpga[1]) begin
                credit_2 <= credit_2 + 9'd1;
            end
        end
        if(rdy_3 & val_3) begin
            sel_23 <= 0;
            sel_13 <= 0;
            if (sel_123 == 2'b11) begin
                sel_123 <= 2'b01;
            end
            if (~credit_from_fpga[2]) begin
                credit_3 <= credit_3 + 9'd1;
            end
        end


    end
end //end always

endmodule
