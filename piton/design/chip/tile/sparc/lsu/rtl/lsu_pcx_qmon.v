// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_pcx_qmon.v
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
//      Description:    Monitors queue state of pcx.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                                        // time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu_pcx_qmon (/*AUTOARG*/
   // Outputs
   so, qwrite, sel_qentry0, 
   // Inputs
   rclk, grst_l, arst_l, si, se, send_by_pcx, send_to_pcx
   ) ;                                          

input           rclk ;
input           grst_l;
input           arst_l;
input           si;
input           se;
output          so;

input 	send_by_pcx ;		// PCX sends packet to dest.
input 	send_to_pcx ;		// SKB sends packet to PCX.
 	
output 	qwrite ;		// PCX queue is writable.
output 	sel_qentry0 ;		// entry to be written.

wire       clk;
wire 	reset ,dbb_reset_l ;
wire	entry0_rst, entry1_rst ;
wire	entry0_en, entry1_en ;
wire	entry0_din, entry1_din ;
wire	entry0_full,entry1_full;

    dffrl_async rstff(.din (grst_l),
                        .q   (dbb_reset_l),
                        .clk (clk), .se(se), .si(), .so(),
                        .rst_l (arst_l));

assign  reset =  ~dbb_reset_l;
assign  clk = rclk;


//======================================================================================
//
//	Queue Monitor 
//
//======================================================================================

//
//	Pipeline :
//--------------------------------------------------------------------------------------
//
//	| req to pcx 	| payload to pcx| 		|		|
//	| qfull=0	|   arb/grant=1 | 		|		|
//	| qentry=1	| 		| 		|		|
//	|		|	      	| 		|		|
//	|		| req to pcx 	| payload to pcx| 		|
//	|		| qfull=0	|   arb/grant=0	|		|
//	|		| qentry=2	|		|		|
//	|		|		| req to pcx 	| payload to pcx| 
//	|		|		| qfull=0	|     arb/grant	|
//
//	


// OPERATION :
// Monitors state per 2 input queue of pcx for given processor.
// - Implemented as FIFO.
// - The queue is cleared on reset. 
// - A packet sent from the core to pcx will set a bit in the 
// corresponding logical queue entry.
// - A packet sent from pcx to dest, will cause entry0 to be cleared.
// Only entry0 need be cleared as entry1 will shift to entry0 on
// a grant by the pcx.
// - The queue will never overflow as a packet will never be sent 
// from the skb to the pcx unless at least one queue entry is free.
// Timing : May have to flop grant and then use it.

assign entry0_rst = 	reset | 
			(send_by_pcx & ~entry0_en) ; 		// pcx sends to dest.
assign entry0_en  = 	( entry1_full & send_by_pcx)  	| 	// shift entry1 to entry0
			(~(entry0_full & ~send_by_pcx) & send_to_pcx) ;		
assign entry0_din = 	entry0_en ;

// represents oldest packet.
dffre_s  qstate_entry0 (
        .din    (entry0_din), .q  (entry0_full),
        .rst    (entry0_rst), .en (entry0_en), .clk (clk),
        .se     (1'b0),       .si (), 	       .so ()
        );

assign entry1_rst =	reset | 
			(send_by_pcx & ~entry1_en) ;
assign entry1_en  = 	entry0_full & send_to_pcx 
			& ~(send_by_pcx & ~entry1_full) ; // new packet to entry1
assign entry1_din = 	entry1_en ;

// represents youngest packet.
dffre_s  qstate_entry1 (
        .din    (entry1_din), .q  (entry1_full),
        .rst 	(entry1_rst), .en (entry1_en), 	.clk (clk),
        .se     (1'b0), .si     (), .so ()
        );

assign qwrite = ~entry1_full ; 
		//(entry1_full & send_by_pcx) ;		// look at top of stack only.
assign sel_qentry0 = 
	(~entry0_full & ~send_to_pcx) ; 
	//(~entry0_full | 
	//(~entry1_full & entry0_full & send_by_pcx)) & ~send_to_pcx ;					
									// select which entry to write.

endmodule
