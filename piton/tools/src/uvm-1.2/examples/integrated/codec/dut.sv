// 
// -------------------------------------------------------------
//    Copyright 2004-2011 Synopsys, Inc.
//    Copyright 2010 Mentor Graphics Corporation
//    Copyright 2010-2011 Cadence Design Systems, Inc.
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

`include "uvm_macros.svh"

`timescale 1ns/1ns

module dut(output bit tx,
           input  bit rx,
           input  bit sclk,
           apb_if apb,
           output bit intr,
           input  bit clk,
           input  bit rst);

import uvm_pkg::*;
uvm_report_object rpt;
initial rpt = new($sformatf("%m"));

reg [31:0] pr_data;
assign apb.prdata = (apb.psel && apb.penable && !apb.pwrite) ? pr_data : 'z;

reg TxEn;
reg RxEn;

reg [ 7:0] TxFIFO[$];
const int  TxDepth = 32;  // Depth of Tx FIFO
reg [ 4:0] TxLWM;         // Low Water Mark on TxFIFO

reg [ 7:0] RxFIFO[$];
const int  RxDepth = 32;  // Depth of Rx FIFO
reg [ 4:0] RxHWM;         // High Water Mark on RxFIFO

const bit [7:0] SYNC = 8'hB2;
const bit [7:0] ESC  = 8'hE7;
const bit [7:0] IDLE = 8'h81;

// Status bits
reg TxEmpty;
reg TxLow;
reg TxFull;
reg RxEmpty;
reg RxHigh;
reg RxFull;
reg aligned;
reg SA;

wire [8:0] IntReq = {SA,
                     1'b0, RxFull, RxHigh, RxEmpty,
                     1'b0, TxFull, TxLow, TxEmpty};
reg [8:0] IntMask;
assign intr = |(IntReq & IntMask);

bit [7:0] TxByte;
bit       TxValid;

bit [7:0] RxByte;
bit       RxValid;

always @ (posedge clk)
begin
   if (rst) begin
      TxEn = 0;
      TxFIFO.delete();
      TxLWM   <= TxDepth * 0.25;
      
      RxEn = 0;
      aligned = 0;
      RxFIFO.delete();
      RxHWM <= RxDepth * 0.50;

      pr_data <= 32'h0;
      TxValid = 0;
   end
   else begin
      
      // Wait for a SETUP+READ or ENABLE+WRITE cycle
      if (apb.psel == 1'b1 && apb.penable == apb.pwrite) begin
         pr_data <= 32'h0;
         if (apb.pwrite) begin
            casex (apb.paddr)
             16'h0000: if (apb.pwdata[8]) SA = 0;
             16'h0004: IntMask <= apb.pwdata;
             16'h0010: TxEn  <= apb.pwdata;
             16'h0014: TxLWM <= apb.pwdata;
             16'h0020: RxEn  <= apb.pwdata;
             16'h0024: RxHWM <= apb.pwdata;
             16'h0100: if (TxFIFO.size() < TxDepth) TxFIFO.push_back(apb.pwdata);
            endcase
         end
         else begin
            casex (apb.paddr)
             16'h0000: pr_data <= IntReq;
             16'h0004: pr_data <= IntMask;
             16'h0010: pr_data <= TxEn;
             16'h0014: pr_data <= TxLWM;
             16'h0020: pr_data <= {aligned, RxEn};
             16'h0024: pr_data <= RxHWM;
             16'h0100: if (RxFIFO.size() > 0) begin
                pr_data <= RxFIFO[0];
                void'(RxFIFO.pop_front());
             end
            endcase
         end
      end
   end

   //
   // Tx
   //
   if (!TxValid && TxFIFO.size() > 0) begin
      TxByte = TxFIFO[0];
      TxValid = 1;
      void'(TxFIFO.pop_front());
   end
   TxEmpty <= TxFIFO.size() == 0;
   TxLow   <= TxFIFO.size() <= TxLWM;
   TxFull  <= TxFIFO.size() >= TxDepth;

   //
   // Rx
   //
   if (RxValid) begin
      if (RxFIFO.size() < RxDepth) RxFIFO.push_back(RxByte);
      RxValid = 0;
   end
   RxEmpty <= RxFIFO.size() == 0;
   RxHigh  <= RxFIFO.size() >= RxHWM;
   RxFull  <= RxFIFO.size() >= TxDepth;
end


//
// Transmit bytes, with SYNC symbols every 7 bytes
//
always begin: TX
   wait (rst != 1 && TxEn);

   if (TxValid) begin
      bit [7:0] symbol;
         
      symbol = TxByte;
      TxValid = 0;
         
      if (symbol == IDLE || symbol == ESC) send(ESC);
      send(symbol);
   end
   else send(IDLE);
end

task automatic send(input bit [7:0] symbol);
   static int tx_cnt = 0;

   if (tx_cnt == 0) begin
      bit [7:0] sync = 8'hB2;
      repeat (8) begin
         tx = sync[7];
         @(negedge sclk);
         sync = sync << 1;
      end
   end
   repeat (8) begin
      tx = symbol[7];
      @(negedge sclk);
      symbol = symbol << 1;
   end
   tx_cnt = (tx_cnt + 1) % 6;
endtask


//
// Detect symbol alignment and receive bytes once aligned
//
always begin: RX
   bit [7:0] symbol;
   bit escaped;
   
   RxValid = 0;
   symbol = 8'h00;
   escaped = 0;
   aligned = 1'b0;

   wait (rst != 1 && RxEn);

   `uvm_info_context("RX", "Rx Path Enabled...", UVM_MEDIUM, rpt)
   
   // First, look for SYNC in the bit stream
   `uvm_info_context("RX", "Looking for SYNC character...", UVM_MEDIUM, rpt)
   while (symbol != SYNC) begin
      @(posedge sclk);
      symbol = {symbol[6:0], rx};
   end
   `uvm_info_context("RX", "Found SYNC character!", UVM_MEDIUM, rpt)

   // Next, look for SYNC every 7 bytes for 3 frames
   repeat (3) begin
      repeat (21 * 8) begin
         @ (posedge sclk);
         symbol = {symbol[6:0], rx};
      end
      if (symbol != SYNC) disable RX;
      `uvm_info_context("RX", "Found SYNC character!", UVM_MEDIUM, rpt)
   end

   `uvm_info_context("RX", "Symbol alignment acquired!", UVM_MEDIUM, rpt)
   
   // We are in phase!
   SA = 1'b1;
   aligned = 1'b1;
   escaped = 0;

   // Make sure we continue to see SYNC every 7 bytes
   forever begin
      repeat (6) begin
         repeat (8) begin
            @ (posedge sclk);
            symbol = {symbol[6:0], rx};
         end
         if (escaped || (symbol != IDLE && symbol != ESC)) begin
            RxValid = 1;
            RxByte = symbol;
            escaped = 0;
         end
         else if (symbol == ESC) begin
            escaped = 1;
         end
      end
      repeat (8) begin
         @ (posedge sclk);
         symbol = {symbol[6:0], rx};
      end
      if (symbol != SYNC) begin
         `uvm_info_context("RX", "Symbol alignment lost!", UVM_MEDIUM, rpt)
         SA = 1;
         disable RX;
      end
   end
end

//
// Reset handler
//
always @(posedge clk)
begin
   if (rst == 1'b1) begin
      disable RX;
      disable TX;
   end
   else begin
      if (!TxEn) disable TX;
      if (!RxEn) disable RX;
   end
end

endmodule
