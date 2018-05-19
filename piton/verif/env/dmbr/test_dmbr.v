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

`timescale 1ns/100ps
`include "dmbr_define.v"
module testbench();

    reg clk;
    reg rst;
    reg proc_ld;
    //inputs (the credits should take into account credit scaling factor, which means creditIn_0 should be 1/10 of the original credit)
    reg [`CREDIT_WIDTH-1:0] creditIn_0;
    reg [`CREDIT_WIDTH-1:0] creditIn_1;
    reg [`CREDIT_WIDTH-1:0] creditIn_2;
    reg [`CREDIT_WIDTH-1:0] creditIn_3;
    reg [`CREDIT_WIDTH-1:0] creditIn_4;
    reg [`CREDIT_WIDTH-1:0] creditIn_5;
    reg [`CREDIT_WIDTH-1:0] creditIn_6;
    reg [`CREDIT_WIDTH-1:0] creditIn_7;
    reg [`CREDIT_WIDTH-1:0] creditIn_8;
    reg [`CREDIT_WIDTH-1:0] creditIn_9;

    //scale factor for replenishment (shoud be 100)
    reg [`REPLENISH_WIDTH-1:0]replenishCyclesIn;
    //scale factor for arrival interval checking (shoud be 10)
    reg [`SCALE_WIDTH-1:0]binScaleIn;
    //L2 miss
    reg                  l1missIn;
    reg [1:0]           l1missTag;
    reg                  l2missIn;
    reg [1:0]           l2missTag;
    reg                  l2responseIn;


    //outputs
    wire stallOut;
    wire [`CREDIT_WIDTH-1:0] credit0;
    wire [`CREDIT_WIDTH-1:0] credit1;
    wire [`CREDIT_WIDTH-1:0] credit2;
    wire [7:0] sat_counter;
    wire [7:0] stall_cycles;
    wire [7:0] add_counter;
    wire [10:0] total_stall_cycles;
    wire [7:0] curInterval;

dmbr dmbr_ins (
    .clk(clk),
    .rst(rst),
    .proc_ld(proc_ld),
    //inputs (the credits should take into account credit scaling factor, which means creditIn_0 should be 1/10 of the original credit)
    .creditIn_0(creditIn_0),
    .creditIn_1(creditIn_1),
    .creditIn_2(creditIn_2),
    .creditIn_3(creditIn_3),
    .creditIn_4(creditIn_4),
    .creditIn_5(creditIn_5),
    .creditIn_6(creditIn_6),
    .creditIn_7(creditIn_7),
    .creditIn_8(creditIn_8),
    .creditIn_9(creditIn_9),

    //scale factor for replenishment (shoud be 100)
    .replenishCyclesIn(replenishCyclesIn),
    //scale factor for arrival interval checking (shoud be 10)
    .binScaleIn(binScaleIn),
    //Input from L1.5
    .l1missIn(l1missIn),
    .l1missTag(l1missTag),
    .l2missIn(l2missIn),
    .l2missTag(l2missTag),
    .l2responseIn(l2responseIn),

    //outputs
    .credit0(credit0),
    .credit1(credit1),
    .credit2(credit2),
    .sat_counter(sat_counter),
    .add_counter(add_counter),
    .stall_cycles(stall_cycles),
    .total_stall_cycles(total_stall_cycles),
    .curInterval(curInterval),

    .stallOut(stallOut)


);



always
begin
  #5;
  clk=~clk;
end


initial begin
$monitor("credit0:%d credit1:%d credit2:%d stallOut:%b curInterval:%d stall_cycles:%d sat_counter:%d add_counter:%d total_stall_cycles:%d l2responseIn:%d l2missIn:%d l2missTag:%d l1missIn:%b l1missTag:%d\n", credit0, credit1, credit2,stallOut,curInterval, stall_cycles,sat_counter,add_counter, total_stall_cycles, l2responseIn, l2missIn, l2missTag, l1missIn, l1missTag);

clk = 0;
creditIn_0 = 3;
creditIn_1 = 2;
creditIn_2 = 3;
creditIn_3 = 4;
creditIn_4 = 5;
creditIn_5 = 6;
creditIn_6 = 7;
creditIn_7 = 8;
creditIn_8 = 9;
creditIn_9 = 10;
replenishCyclesIn = 1000;
binScaleIn = 3;
l1missIn = 0;
l1missTag = 0;
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
rst=1;
#10
rst=0;
proc_ld = 1;
#20 // cycle 2: should stall, use credit0
proc_ld = 0;
l1missIn = 1;
l1missTag = 0;
#10
l1missIn = 0;
#20
l2responseIn = 1;
l2missIn = 1;
l2missTag = 0;
#10 
l2responseIn = 0;
l2missIn = 0;
#10 //cycle 7: should stall, use credit0
l1missIn = 1;
l1missTag = 1;
#10
l1missIn = 0;
l1missTag = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 1;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
#100
#10 //cycle 23
l1missIn = 1;
l1missTag = 2;
#10
l1missIn = 0;
l1missTag = 0;
#10
l2responseIn = 1;
l2missIn = 0;
l2missTag = 2;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
#10 //cycle 27: should not stall, use credit1
l1missIn = 1;
l1missTag = 3;
#10
l1missIn = 0;
l1missTag = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 3;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
#10 //cycle 33: should stall, use credit0
l1missIn = 1;
l1missTag = 0;
#10
l1missIn = 0;
l1missTag = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 0;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
#10 //cycle 39: should stall, use credit1
l1missIn = 1;
l1missTag = 1;
#10
l1missIn = 0;
l1missTag = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 1;
#10 
l2responseIn = 0;
l2missTag = 0;
#100
// Test out of order response
// cycle 54: should stall, use credit2
l1missIn = 1;
l1missTag = 2;
#10
l1missIn = 0;
#10 // cycle 56: should stall, use credit2
l1missIn = 1;
l1missTag = 3;
#10
l1missIn = 0;
#20
l2responseIn = 1;
l2missIn = 1;
l2missTag = 3;
#10 
l2responseIn = 0;
l2missIn = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 2;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;
#100
l1missIn = 1;
l1missTag = 0;
#10
l1missIn = 0;
#10 // cycle 56: should stall, use credit2
l1missIn = 1;
l1missTag = 1;
#10
l1missIn = 0;
#20
l2responseIn = 1;
l2missIn = 0;
l2missTag = 1;
#10 
l2responseIn = 0;
l2missIn = 0;
#30
l2responseIn = 1;
l2missIn = 1;
l2missTag = 0;
#10 
l2responseIn = 0;
l2missIn = 0;
l2missTag = 0;


#100
$finish;
end

endmodule



  
  
