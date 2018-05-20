// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: mask_mon.v
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
`include "ifu.tmp.h"

module mask_mon(/*AUTOARG*/
   // Inputs
   clk, rst_l, wm_imiss, wm_other, wm_stbwait, mul_wait, div_wait,
   fp_wait, mul_busy_e, div_busy_e, fp_busy_e, ldmiss, coreid
   );
   input clk;
   input rst_l;

   input [3:0] wm_imiss;
   input [3:0] wm_other;
   input [3:0] wm_stbwait;
   input [3:0] mul_wait;
   input [3:0] div_wait;
   input [3:0] fp_wait;
   input [3:0] mul_busy_e;
   input [3:0] div_busy_e;
   input [3:0] fp_busy_e;
   input [3:0] ldmiss;
   input [9:0] coreid;

   reg [39:0]  old_val, new_val;

   initial
     begin
     	old_val = 0;
	new_val = 0;
     end

   always @(negedge clk)begin
      if (rst_l)
	begin
	   new_val = {wm_imiss[3:0],wm_other[3:0],wm_stbwait[3:0],mul_wait[3:0],div_wait[3:0],fp_wait[3:0],
		      mul_busy_e[3:0],div_busy_e[3:0],fp_busy_e[3:0],ldmiss[3:0]};
	   if (new_val != old_val)
	     begin
	       $display ("%d: C%1d: WM: %x%x%x%x%x%x%x%x%x%x", $time, coreid, wm_imiss, wm_other,
		     wm_stbwait, mul_wait, div_wait, fp_wait, mul_busy_e, div_busy_e, fp_busy_e, ldmiss);
	     end
	   old_val = new_val;
      	end // if (!reset)
   end
endmodule


