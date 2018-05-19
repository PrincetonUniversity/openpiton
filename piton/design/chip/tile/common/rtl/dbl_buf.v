// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: dbl_buf.v
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
////////////////////////////////////////////////////////////////////////
/*
//  Module Name:        dbl_buf
//	Description:	A simple double buffer
//                      First-in first-out.  Asserts full when both entries
//                      are occupied.
*/ 
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which 
                        // contains the time scale definition


////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module dbl_buf (/*AUTOARG*/
   // Outputs
   dout, vld, full, 
   // Inputs
   clk, rst_l, wr, rd, din
   );
   // synopsys template
   
   parameter BUF_WIDTH = 64;      // width of the buffer
   

   // Globals
   input          clk;
   input 	  rst_l;
   
   // Buffer Input
   input 	  wr;
   input 	  rd;
   input [BUF_WIDTH-1:0] din;

   // Buffer Output
   output [BUF_WIDTH-1:0] dout;
   output 	  vld;
   output 	  full;
   
   // Buffer Output
   wire 	  wr_buf0;
   wire 	  wr_buf1;
   wire 	  buf0_vld;
   wire 	  buf1_vld;
   wire 	  buf1_older;
   wire 	  rd_buf0;
   wire 	  rd_buf1;
   wire 	  rd_buf;
   wire 	  en_vld0;
   wire 	  en_vld1;
   wire [BUF_WIDTH-1:0] buf0_obj;
   wire [BUF_WIDTH-1:0] buf1_obj;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   // if both entries are empty, write to entry pointed to by the older pointer
   // if only one entry is empty, then write to the empty entry (duh!)
   assign 	  wr_buf0 = wr &
                            (buf1_vld | (~buf0_vld & ~buf1_older));
   assign         wr_buf1 = wr &
                            (buf0_vld | (~buf1_vld & buf1_older));

   // read from the older entry
   assign         rd_buf0 = rd & ~buf1_older;
   assign         rd_buf1 = rd & buf1_older;

   // flip older pointer when an entry is read
   assign 	  rd_buf = rd & (buf0_vld | buf1_vld);
   dffrle_ns buf1_older_ff (.din(~buf1_older),
			    .rst_l(rst_l),
                            .en(rd_buf),
			    .clk(clk),
			    .q(buf1_older));

   // set valid bit for writes and reset for reads
   assign         en_vld0 = wr_buf0 | rd_buf0;
   assign         en_vld1 = wr_buf1 | rd_buf1;

   // the actual buffers
   dffrle_ns buf0_vld_ff (.din(wr_buf0),
			  .rst_l(rst_l),
			  .en(en_vld0),
			  .clk(clk),
			  .q(buf0_vld));

   dffrle_ns buf1_vld_ff (.din(wr_buf1),
			  .rst_l(rst_l),
			  .en(en_vld1),
			  .clk(clk),
			  .q(buf1_vld));

   dffe_ns #(BUF_WIDTH) buf0_obj_ff (.din(din),
				     .en(wr_buf0),
                                     .clk(clk),
				     .q(buf0_obj));
   
   dffe_ns #(BUF_WIDTH) buf1_obj_ff (.din(din),
				     .en(wr_buf1),
                                     .clk(clk),
				     .q(buf1_obj));
   
   // mux out the older entry
   assign         dout = (buf1_older) ? buf1_obj:buf0_obj;

   assign 	  vld = buf0_vld | buf1_vld;
   assign 	  full = buf0_vld & buf1_vld;
   
	  
endmodule // dbl_buf



// Local Variables:
// verilog-library-directories:(".")
// End:







