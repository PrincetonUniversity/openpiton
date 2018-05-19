// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: ctu_level_mon.v
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
// ctu_mon.v
//
// Description: CTU Monitor
////////////////////////////////////////////////////////


module ctu_level_mon (
 hi,
 lo,
 mon_en,
 mon_num,
 off_on

);


  input hi;   // hi signal
  input lo;   // lo signal
  input mon_en;   // monitor enable
  input [31:0] mon_num;   // monitor num for failure tracking
  input off_on;   // turn off if 1 


always @(hi or lo) 
begin
if ( !$test$plusargs("ctu_mon_off")) begin
 if ((mon_en == 1'b1)&& (off_on != 1'b1)) begin
   $display("ERROR : Signal hi or lo toggled when it shouldnt ; hi= %h ,lo=%d \n", hi,lo);
   $display("****NOTE : IF YOUR TEST INTEND TO TOGGLE THESE SIGNALS ******\n");
   $display("****  use -sim_run_args=+ctu_mon_off  as run argument******\n");
   finish_test(" Signal toggles when not supposed to", mon_num);
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
  $display("%0d ERROR: CTU Monitor : %s MONITOR NUMBER : %d", $time, message,mon_num);
  //@(posedge clk);
  //@(posedge clk);
  //@(posedge clk);
  $error ("ctu_mon", "CTU monitor exited") ;
end
endtask


endmodule

