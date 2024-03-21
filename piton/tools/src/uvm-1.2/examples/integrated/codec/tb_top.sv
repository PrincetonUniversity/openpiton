// 
// -------------------------------------------------------------
//    Copyright 2011 Synopsys, Inc.
//    All Rights Reserved Worldwide
// 
//    Licensed under the Apache License, Version 2.0 (the
//    "License"); you may not use this file except in
//    compliance with the License.  You may obtain a copy of
//    the License at
// 
//        http://www.apache.org/licenses/LICENSE-2.0
// 
//    Unless required by applicable law or agreed to in
//    writing, software distributed under the License is
//    distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//    CONDITIONS OF ANY KIND, either express or implied.  See
//    the License for the specific language governing
//    permissions and limitations under the License.
// -------------------------------------------------------------
//

import uvm_pkg::*;
`include "uvm_macros.svh"

`include "apb_if.sv"
`include "vip_if.sv"
`include "dut.sv"

`timescale 1ns/1ns

interface tb_ctl_if(input  reg clk,
                    input  reg sclk,
                    output reg rst,
                    input  reg intr);
endinterface


module tb_top;

reg  clk, sclk;
wire rst;

wire tx, rx;
wire intr;

tb_ctl_if ctl(clk, sclk, rst, intr);
apb_if apb0(clk);
vip_if vip0(sclk, rx, tx);

dut dut0(tx, rx, sclk, apb0, intr, clk, rst);

initial
begin
   // Clk & rst start at x

   // Rst resolves first
   #100 ctl.rst = 1'b1;

   // then clocks
   #200;
   clk = 1'b0;
   sclk = 1'b0;

   // the clocks eventually toggles
   // but it is up to the environment to release rst
   #500;
   fork
      forever begin
         #50 clk = 1'b1;
         #50 clk = 1'b0;
      end
      #4 forever begin
         #250 sclk = 1'b1;
         #250 sclk = 1'b0;
      end
   join_none
end

endmodule
