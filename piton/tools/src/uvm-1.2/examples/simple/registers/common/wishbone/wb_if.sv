//
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
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


`ifndef WB_IF__SV
`define WB_IF__SV


interface wb_if;

   logic        clk;
   wire         rst;
   wire  [63:0] wdat;
   logic [63:0] rdat;
   wire  [15:0] wtgd;
   logic [15:0] rtgd;
   logic        ack;
   wire  [63:0] adr;
   wire         we;
   tri0         cyc;
   logic        err;
   tri0         lock;
   logic        rty;
   wire  [ 7:0] sel;
   tri0         stb;
   wire  [15:0] tga;
   wire  [15:0] tgc;

   wire  [ 2:0] cti;
   wire  [ 1:0] bte;

   parameter setup_time = 1;
   parameter hold_time  = 1;

   clocking sysck @ (posedge clk);
      //default input setup_time output hold_time;
      output rst;
   endclocking

   modport syscon (output   clk,
                   clocking sysck);


   clocking mck @ (posedge clk);
      //default input setup_time output hold_time;
      input  rst, rdat, rtgd, ack, err, rty;
      output wdat, wtgd, adr, we, cyc, lock, sel, stb, tga, tgc, cti, bte;
   endclocking

   modport master (clocking mck, clocking sysck);


   clocking sck @ (posedge clk);
      //default input setup_time output hold_time;
      input rst, wdat, wtgd;
   endclocking

   modport slave (clocking sck,
                  input  wdat, wtgd, adr, we, cyc, lock, sel, stb, tga, tgc, cti, bte,
                  output rdat, rtgd, ack, err, rty);


   clocking pck @ (posedge clk);
      //default input setup_time output hold_time;
      input  rst, rdat, rtgd, ack, err, rty, wdat, wtgd, adr, we, cyc,
             lock, sel, stb, tga, tgc, cti, bte;
   endclocking

   modport passive (clocking pck);
endinterface: wb_if

`endif
