// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_rrobin_picker.v
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
//      Description:    Round-Robin Picker for 4 eventss.
//			Differs from lsu'v rrobin picker by the
//			fact that there is no default 1-hot event.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                                        // time scale definition

module tlu_rrobin_picker (/*AUTOARG*/
   // Outputs
   pick_one_hot, 
   // Inputs
   events, tlu_rst_l, clk
   );

input 	[3:0]	events ;		// multi-hot; events that could be chosen
// this siganl was modified to abide to the Niagara reset methodology
input		tlu_rst_l ;			// reset - active low
input		clk ;

output	[3:0]	pick_one_hot ;  // one-hot; events that must be chosen
//
// this signal was added to abide to the Niagara reset methodology
wire	tlu_rst ;	

// This section was modified to abide to the Niagara synthesis methodology
//
// reg	[3:0]	pick_status ;	
wire	pick_status_reset ;	
wire	[3:0]	pick_status_in ;	
wire	[3:0]	pick_status ;	

wire	events_unpicked ;
wire	[3:0]	pe_mask ;

//
// this signal was added to abide to the Niagara reset methodology
assign tlu_rst = ~tlu_rst_l;

assign	events_unpicked = |(events[3:0] & ~pick_status[3:0]) ;
			// term replicated.

// priority encode mask
assign	pe_mask[3:0] =
		events_unpicked ? 
		(events[3:0] & ~pick_status[3:0]) : 	// choose from eventss that have not picked.
		events[3:0] ;				// else all eventss on equal terms

assign	pick_one_hot[0] = 
		pe_mask[0] ;
		//pe_mask[0] | ~(|pe_mask[3:0]);		// none requesting then 0 is forced hot
assign	pick_one_hot[1] = 
		pe_mask[1] & ~pe_mask[0] ;
assign	pick_one_hot[2] = 
		pe_mask[2] & ~(|pe_mask[1:0]) ;
assign	pick_one_hot[3] = 
		pe_mask[3] & ~(|pe_mask[2:0]) ;

// This section was modified to abide to the Niagara synthesis methodology
//
// Define Pick Status
//always	@ (posedge clk)
//	begin
//		if ((&(pick_status[3:0] | pick_one_hot[3:0])) | tlu_rst) 
//			pick_status[3:0] <= 4'b0000 ;	// clear pick_status
//		else
//			pick_status[3:0] <= pick_status[3:0] | pick_one_hot[3:0] ;
//					// term replicated
//	end

assign pick_status_reset = (&(pick_status[3:0] | pick_one_hot[3:0])) | tlu_rst;
assign pick_status_in    = pick_status[3:0] | pick_one_hot[3:0]; 

dffr_s #(4)  dffre_pick_status  (
        .din (pick_status_in[3:0]), .q (pick_status[3:0]),
        .rst (pick_status_reset), .clk (clk),
        .se  (1'b0),  .si  (),       .so ()
        );

endmodule
