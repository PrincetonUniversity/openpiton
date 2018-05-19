// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_out.v
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
//  Module Name:        ucb_bus_out (ucb bus outbound interface block)
//	Description:	This interface block is instantiated by the
//                      UCB modules and IO Bridge to transmit packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which
                        // contains the time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module ucb_bus_out (/*AUTOARG*/
   // Outputs
   vld, data, outdata_buf_busy,
   // Inputs
   clk, rst_l, stall, outdata_buf_in, outdata_vec_in, outdata_buf_wr
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;            // maximum data bits that needs to
                                        // be sent.  Set to 64 or 128

   // Globals
   input                                clk;
   input 				rst_l;


   // UCB bus interface
   output 				vld;
   output [UCB_BUS_WIDTH-1:0] 		data;
   input 				stall;


   // Local interface
   output 				outdata_buf_busy;  // busy outputting, can't accept data into buffer
   input [REG_WIDTH+63:0] 		outdata_buf_in;
   input [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] outdata_vec_in; // indicating how much data to send
   input 				outdata_buf_wr;


   // Local signals
   wire 				stall_d1;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] 	outdata_vec_next;
   wire [REG_WIDTH+63:0] 		outdata_buf;
   reg [REG_WIDTH+63:0] 		outdata_buf_next;
   wire 				load_outdata;
   wire 				shift_outdata;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    ************************************************************/
   assign 	 vld = outdata_vec[0];
   // assign 	 data = vld ? outdata_buf[UCB_BUS_WIDTH-1:0] : `UCB_BUS_WIDTH'b0;
   assign    data = outdata_buf[UCB_BUS_WIDTH-1:0];

   dffrl_ns #(1) stall_d1_ff (.din(stall),
                              .clk(clk),
                              .rst_l(rst_l),
                              .q(stall_d1));


   /************************************************************
    * Outbound Data
    ************************************************************/
   // accept new data only if there is none being processed
   assign 	 load_outdata = outdata_buf_wr & ~outdata_buf_busy;

   assign 	 outdata_buf_busy = outdata_vec[0] | stall_d1;

   // only shifts when then input vector is a straight valids
   assign 	 shift_outdata = outdata_vec[0] & ~stall_d1;

   assign 	 outdata_vec_next =
		 load_outdata  ? outdata_vec_in:
		 shift_outdata ? outdata_vec >> 1:
	                         outdata_vec;
   dffrl_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) outdata_vec_ff (.din(outdata_vec_next),
							    .clk(clk),
							    .rst_l(rst_l),
							    .q(outdata_vec));

   // assign 	 outdata_buf_next =
		 // load_outdata  ? outdata_buf_in:
		 // shift_outdata ? (outdata_buf >> UCB_BUS_WIDTH):
	  //                        outdata_buf;
   always @ *
   begin
      if (load_outdata)
         outdata_buf_next = outdata_buf_in;
      else if (shift_outdata)
      begin
         outdata_buf_next = outdata_buf >> UCB_BUS_WIDTH;
         if (outdata_vec[1] == 1'b0)
            outdata_buf_next[UCB_BUS_WIDTH-1:0] = 0;
      end
      else
         outdata_buf_next = outdata_buf; // no shifting
   end

   dff_ns #(REG_WIDTH+64) outdata_buf_ff (.din(outdata_buf_next),
					  .clk(clk),
					  .q(outdata_buf));


endmodule // ucb_bus_out






