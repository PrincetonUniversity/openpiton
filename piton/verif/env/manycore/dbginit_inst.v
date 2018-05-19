// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: dbginit_inst.v
// Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be 
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
// 
// ========== Copyright Header End ============================================
////////////////////////////////////////////////////////;
// dbginit_inst.v
//
// Description: dbginit_inst Monitor
////////////////////////////////////////////////////////

module dbginit_inst (
 rst,
 clk,
 dbginit,
 actual,
 expected,
 cnt_val,
 mon_num

);

   parameter CMP_SZ = 1;


  input rst;
  input clk;
  input dbginit;           // dbginit signal
  input [CMP_SZ-1:0]  actual;    // actual value of signal monitored
  input [CMP_SZ-1:0]  expected;  // expected value on dbginit
  input [10:0] cnt_val;    // monitor num for failure tracking
  input [31:0] mon_num;    // monitor num for failure tracking

  reg same;
  reg sig_same;
  reg diff;
  reg [31:0]  cntr;
  reg check_done;
  reg start_mon;

initial 
 begin 
  same = 0;
  diff = 0;
  cntr = 0;
  check_done = 0;
  sig_same  = 0;
  start_mon  = 0;
 end

always @(dbginit)
begin
if ( !$test$plusargs("dbginit_mon_off")) begin

if (rst & !dbginit) begin 
 same <= 0;
 diff <= 0;
 start_mon <= 1;
 
 if (actual == expected)
  same <= 1;
 else 
  diff <= 1;
end else begin 
 same <= 0;
 diff <= 0;
 start_mon <= 0;

end

end
end

always @(posedge clk)
begin
if ( !$test$plusargs("dbginit_mon_off")) begin

if (rst & start_mon) begin 
  cntr <= (!dbginit) ?  cntr +1 : 0;
 if ((cntr == cnt_val) & !check_done) begin 
   check_done <= 1;

     if ((actual != expected) && (!sig_same)) begin 
        $display("ERROR : Signal value not as expected after dbginit ; expected= %h ,actual=%h \n", expected,actual);
        finish_test("RTL doesnt reset signals on DBGINIT", mon_num);
     end else begin 
       if (same == 1'b1) 
        $display("****NOTE : Value did not change before and after debuginit for Monitor#%d ******\n",mon_num);
     end
  end

  // for cases where signal toggles and starts changing again
  if (same || diff ) begin 
     if (actual == expected) 
       sig_same <= 1;
   end
end else begin 
  cntr       <= 0;
  check_done <= 0;
  sig_same   <= 0;
end

end
end





//=====================================================================
// This task allows some more clocks and kills the test
//=====================================================================
task finish_test;
input [512:0] message;
input [31:0]   id;

begin
  $display("%0d ERROR: DBGINIT Monitor : %s MONITOR NUMBER : %d", $time, message,mon_num);
  @(posedge clk);
  $error ("dbginit_inst", "DBGINIT monitor exited") ;
end
endtask


endmodule

