// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: bw_sys.v
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
`timescale 1ps/1ps
//------------------------------------------------------------
//Here We do the system level operation.
//------------------------------------------------------------
module bw_sys(/*AUTOARG*/
   // Outputs
   ssi_miso, ext_int_l, clk_stretch, warm_rst_l, temp_trig, 
   // Inputs
   j_rst_l, jbus_gclk, ssi_sck, ssi_mosi
   );
   //input to system.
   input j_rst_l;
   input jbus_gclk;
   input ssi_sck;
   input ssi_mosi;
   
   //output to ciop.
   output ssi_miso;
   output ext_int_l;
   output clk_stretch;
   output warm_rst_l;
   output temp_trig;
   
   //temp. registers
   reg 	  ssi_miso_r;
   reg 	  ext_int_l_r;
   reg    temp_trig_r;
   reg 	  clk_stretch_r;
   
   //ok push button rst
   reg 	  ok_io, ok_reset, rst_val;
   
   // initial values for all reg
   initial begin
      rst_val       = 1 ;
      ext_int_l_r   = 1 ;
      temp_trig_r   = 0 ;
      clk_stretch_r = 0;
      
   end
 //create wramrest signal.
   assign warm_rst_l = rst_val ;

   initial begin
      ok_reset = 1;
   end
   //how many cores are turned on.
   //assign and drive
   assign ext_int_l   = ext_int_l_r;
   assign ssi_miso    = ssi_miso_r;
   assign temp_trig   = temp_trig_r;
   assign clk_stretch = clk_stretch_r;
   
   initial
     begin
	ok_io       = 0;
        ext_int_l_r = 1;
	ssi_miso_r  = 0;
	temp_trig_r = 0;
        while (j_rst_l !== 0) @(posedge jbus_gclk) ;
	@(posedge j_rst_l);//wait for the push button reset.
        ok_io       = 1;
     end
//interface between ssi bus and io.   
   always @(posedge ssi_sck)begin
      if(ok_io)$ssi_drive(
			  //input
			  ssi_mosi,
			  //ouput
			  ssi_miso_r,
			  );
     
   end // always @ (posedge ssi_sck)
   // jbus clk domain here. 
   // 2). warm reset
   // 3). external interrupt
   always @(posedge jbus_gclk)begin
      if(ok_reset)begin
	 $pc_trigger_event(3, 
			   rst_val,
			   ext_int_l_r,
			   temp_trig_r,
			   clk_stretch_r
			   );
      end
   end
endmodule
