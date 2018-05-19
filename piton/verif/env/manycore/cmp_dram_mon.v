// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: cmp_dram_mon.v
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
module cmp_dram_mon(/*AUTOARG*/
   // Inputs
   clk, dram_pad0_cs_l, dram_pad1_cs_l, dram_pad2_cs_l, 
   dram_pad3_cs_l, rst_l
   );
   input clk;
   input [1:0] dram_pad0_cs_l;
   input [1:0] dram_pad1_cs_l;
   input [1:0] dram_pad2_cs_l;
   input [1:0] dram_pad3_cs_l;

   input       rst_l;
   
   reg[2:0]     count00, count01, count10, count11, count20, count21, count30, count31;
   reg 		tr00, tr01, tr10, tr11, tr20, tr21, tr30, tr31;
   
   initial begin
      count00 = 0;count01 = 0;
      count10 = 0;count11 = 0;
      count20 = 0;count21 = 0;
      count30 = 0;count31 = 0;
      tr00    = 0;tr01    = 0;
      tr10    = 0;tr11    = 0;
      tr20    = 0;tr21    = 0;
      tr30    = 0;tr31    = 0;
   end

`ifdef GATE_SIM_DRAM
`else
     dram_mon dram_mon0( .clk       (clk), .rst_l   (rst_l));
   
  always @(negedge clk)
    begin
       
       if(rst_l)begin
	  if(`DRAM_PATH0.que_pos == 5'h0a)begin
	     #2
	     if((dram_pad0_cs_l[0] == 0) & (dram_pad0_cs_l[1] == 0))begin
		$display("%0d Error: pad0 cs0 and cs1 turn on the same time", $time);
		`MONITOR_PATH.fail("cs0 and cs1 turn on the same time");
	     end
	     if(dram_pad0_cs_l[0] == 0)begin
		if(tr01 && (count01 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs0 turn on early");
		end
		tr00    = 1;tr01    = 0;count00 = 0;
	     end
	     if(dram_pad0_cs_l[1] == 0)begin
		if(tr00 && (count00 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs1 turn on early");
		end
		tr01    = 1;tr00    = 0;count01 = 0;
	     end // if (dram_pad0_cs_l[1] == 0)
	     
	  end // if (que_pos0 == 5'h0a)
	  
	  if(`DRAM_PATH1.que_pos == 5'h0a)begin
	     #2
	     if((dram_pad1_cs_l[0] == 0) & (dram_pad1_cs_l[1] == 0))begin
		$display("%0d Error: pad1 cs0 and cs1 turn on the same time", $time);
		`MONITOR_PATH.fail("cs0 and cs1 turn on the same time");
	     end
	     if(dram_pad1_cs_l[0] == 0)begin
		if(tr11 && (count11 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs0 turn on early");
		end
		tr10    = 1;tr11    = 0;count10 = 0;
	     end
	     if(dram_pad1_cs_l[1] == 0)begin
		if(tr10 && (count10 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs1 turn on early");
		end
		tr11    = 1;tr10    = 0;count11 = 0;
	     end
	  end // if (que_pos1 == 5'h0a)
	  if(`DRAM_PATH2.que_pos == 5'h0a)begin
	     #2
	     if((dram_pad2_cs_l[0] == 0) & (dram_pad2_cs_l[1] == 0))begin
		$display("%0d Error: pad2 cs0 and cs1 turn on the same time", $time);
		`MONITOR_PATH.fail("cs0 and cs1 turn on the same time");
	     end
	     if(dram_pad2_cs_l[0] == 0)begin
		if(tr21 && (count21 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs0 turn on early");
		end
		tr20    = 1;tr21    = 0;count20 = 0;
	     end
	     if(dram_pad2_cs_l[1] == 0)begin
		if(tr20 && (count20 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs1 turn on early");
		end
		tr21    = 1;tr20    = 0;count21 = 0;
	     end // if (dram_pad0_cs_l[1])
	  end // if (que_pos2 == 5'h0a)
	  if(`DRAM_PATH3.que_pos == 5'h0a)begin
	     #2
	     if((dram_pad3_cs_l[0] == 0) & (dram_pad3_cs_l[1] == 0))begin
		$display("%0d Error: pad3 cs0 and cs1 turn on the same time", $time);
		`MONITOR_PATH.fail("cs0 and cs1 turn on the same time");
	     end
	     if(dram_pad3_cs_l[0] == 0)begin
		if(tr31 && (count31 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs0 turn on early");
		end
		tr30    = 1;tr31    = 0;count30 = 0;
	     end
	     if(dram_pad3_cs_l[1] == 0)begin
		if(tr30 && (count30 < 6))begin
		   $display("%0d Error: dram pad0 chip enable turn on early", $time);
		   `MONITOR_PATH.fail("Dram chip cs1 turn on early");
		end
		tr31    = 1;tr30    = 0;count31 = 0;
	     end // if (dram_pad0_cs_l[1])
	  end // if (que_pos3 == 5'h0a)
	  
	  if(tr00)count00 =  count00 + 1;
	  if(tr01)count01 =  count01 + 1;
	  if(tr10)count10 =  count10 + 1;
	  if(tr11)count11 =  count11 + 1;
	  if(tr20)count20 =  count20 + 1;
	  if(tr21)count21 =  count21 + 1;
	  if(tr30)count30 =  count30 + 1;
	  if(tr31)count31 =  count31 + 1;
	  if(count00 == 6)tr00 = 0;
	  if(count01 == 6)tr01 = 0;
	  if(count10 == 6)tr10 = 0;
	  if(count11 == 6)tr11 = 0;
	  if(count20 == 6)tr20 = 0;
	  if(count21 == 6)tr21 = 0;
	  if(count30 == 6)tr30 = 0;
	  if(count31 == 6)tr31 = 0;
       end	
	
    end // always @ (negedge clk)
`endif	// ifdef GATE_SIM_DRAM
endmodule



