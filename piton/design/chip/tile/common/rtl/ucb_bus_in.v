// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: ucb_bus_in.v
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
//  Module Name:	ucb_bus_in (ucb bus inbound interface block)
//  Description:	This interface block is instaniated by the
//                      UCB modules and IO Bridge to receive packets
//                      on the UCB bus.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the
			// time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////
// Interface signal list declarations
////////////////////////////////////////////////////////////////////////
module ucb_bus_in (/*AUTOARG*/
   // Outputs
   stall, indata_buf_vld, indata_buf,
   // Inputs
   rst_l, clk, vld, data, stall_a1
   );

   // synopsys template

   parameter UCB_BUS_WIDTH = 32;
   parameter REG_WIDTH = 64;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
   // Global interface
   input                     rst_l;
   input 		     clk;


   // UCB bus interface
   input 		     vld;
   input [UCB_BUS_WIDTH-1:0] data;
   output 		     stall;


   // Local interface
   output 		     indata_buf_vld;
   output [REG_WIDTH+63:0]   indata_buf;
   input 		     stall_a1; // would this prevent indata_buf to change?


   // Internal signals
   wire 		     vld_d1;
   wire 		     stall_d1;
   wire [UCB_BUS_WIDTH-1:0]  data_d1;
   wire 		     skid_buf0_en;
   wire 		     vld_buf0;
   wire [UCB_BUS_WIDTH-1:0]  data_buf0;
   wire 		     skid_buf1_en;
   wire 		     vld_buf1;
   wire [UCB_BUS_WIDTH-1:0]  data_buf1;
   wire 		     skid_buf0_sel;
   wire 		     skid_buf1_sel;
   wire 		     vld_mux;
   wire [UCB_BUS_WIDTH-1:0]  data_mux;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec_next;
   wire [(REG_WIDTH+64)/UCB_BUS_WIDTH-1:0] indata_vec;
   wire [REG_WIDTH+63:0]     indata_buf_next;
   wire 		     indata_vec0_d1;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
   /************************************************************
    * UCB bus interface flops
    * This is to make signals going between IOB and UCB flop-to-flop
    * to improve timing.
    ************************************************************/
   dffrle_ns #(1) vld_d1_ff (.din(vld),
			     .rst_l(rst_l),
			     .en(~stall_d1),
			     .clk(clk),
			     .q(vld_d1));

   dffe_ns #(UCB_BUS_WIDTH) data_d1_ff (.din(data),
					.en(~stall_d1),
					.clk(clk),
					.q(data_d1));

   dffrl_ns #(1) stall_ff (.din(stall_a1),
			   .clk(clk),
			   .rst_l(rst_l),
			   .q(stall));

   dffrl_ns #(1) stall_d1_ff (.din(stall),
			      .clk(clk),
			      .rst_l(rst_l),
			      .q(stall_d1));


   /************************************************************
    * Skid buffer
    * We need a two deep skid buffer to handle stalling.
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   // Buffer 0
   assign 	 skid_buf0_en = stall_a1 & ~stall;

   dffrle_ns #(1) vld_buf0_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf0_en),
			       .clk(clk),
			       .q(vld_buf0));

   dffe_ns #(UCB_BUS_WIDTH) data_buf0_ff (.din(data_d1),
					  .en(skid_buf0_en),
					  .clk(clk),
					  .q(data_buf0));

   // Buffer 1
   dffrl_ns #(1) skid_buf1_en_ff (.din(skid_buf0_en),
				  .clk(clk),
				  .rst_l(rst_l),
				  .q(skid_buf1_en));

   dffrle_ns #(1) vld_buf1_ff (.din(vld_d1),
			       .rst_l(rst_l),
			       .en(skid_buf1_en),
			       .clk(clk),
			       .q(vld_buf1));

   dffe_ns #(UCB_BUS_WIDTH) data_buf1_ff (.din(data_d1),
					  .en(skid_buf1_en),
					  .clk(clk),
					  .q(data_buf1));


   /************************************************************
    * Mux between skid buffer and interface flop
    ************************************************************/
   // Assertion: stall has to be deasserted for more than 1 cycle
   //            ie time between two separate stalls has to be
   //            at least two cycles.  Otherwise, contents from
   //            skid buffer will be lost.

   assign 	 skid_buf0_sel = ~stall_a1 & stall;

   dffrl_ns #(1) skid_buf1_sel_ff (.din(skid_buf0_sel),
				   .clk(clk),
				   .rst_l(rst_l),
				   .q(skid_buf1_sel));

   assign 	 vld_mux = skid_buf0_sel ? vld_buf0 :
		           skid_buf1_sel ? vld_buf1 :
		                           vld_d1;

   assign 	 data_mux = skid_buf0_sel ? data_buf0 :
		            skid_buf1_sel ? data_buf1 :
		                            data_d1;


   /************************************************************
    * Assemble inbound data
    ************************************************************/
   // valid vector
   assign 	 indata_vec_next = {vld_mux,
				    indata_vec[(REG_WIDTH+64)/UCB_BUS_WIDTH-1:1]};
   dffrle_ns #((REG_WIDTH+64)/UCB_BUS_WIDTH) indata_vec_ff (.din(indata_vec_next),
							    .en(~stall_a1),
							    .rst_l(rst_l),
							    .clk(clk),
							    .q(indata_vec));

   // data buffer
   assign 	 indata_buf_next = {data_mux,
				    indata_buf[REG_WIDTH+63:UCB_BUS_WIDTH]};
   dffe_ns #(REG_WIDTH+64) indata_buf_ff (.din(indata_buf_next),
					  .en(~stall_a1),
					  .clk(clk),
					  .q(indata_buf));

   // detect a new packet
   dffrle_ns #(1) indata_vec0_d1_ff (.din(indata_vec[0]),
				     .rst_l(rst_l),
				     .en(~stall_a1),
				     .clk(clk),
				     .q(indata_vec0_d1));

   assign        indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;


endmodule // ucb_bus_in
