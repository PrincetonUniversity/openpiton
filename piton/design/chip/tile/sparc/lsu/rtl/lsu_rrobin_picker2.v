// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_rrobin_picker2.v
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
//                      (see description of picker at the end of this file)
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                                        // time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////    

module lsu_rrobin_picker2 (/*AUTOARG*/
   // Outputs
   so, pick_one_hot, 
   // Inputs
   rclk, grst_l, arst_l, si, se, events, events_picked, thread_force
   );

input           rclk ;
input           grst_l;
input           arst_l;
input           si;
input           se;
output          so;


input 	[3:0]	events ;		// multi-hot; events that could be chosen
input 	[3:0]	events_picked ;		// one-hot; events that were picked - same cycle as pick
input 	[3:0]	thread_force ;	        // multi-hot; thread events that have high priority

output 	[3:0]	pick_one_hot ;		// one-hot

wire         clk;
wire         reset,dbb_reset_l ;
   
wire  [3:0]  thread_force_pe_mask ;
wire  [3:0]  pick_thread_force_1hot ;
wire         thread_force_events_sel ;

wire  [3:0]  pick_rrobin_1hot, pick_rev_rrobin_1hot, pick_rrobin_1hot_mx ;
wire         events_pick_dir_d1 ;
wire         events_pick_dir ;
wire  [3:0]  pick_rrobin_status_or_one_hot ;
wire  [3:0]  pick_rrobin_din ;
wire  [3:0]  pick_rrobin ;
wire         pick_rrobin_reset ;
wire         pick_rrobin_dir_upd ;
wire  [3:0]  pick_rrobin_events ;

   

    dffrl_async rstff(.din (grst_l),
                        .q   (dbb_reset_l),
                        .clk (clk), .se(se), .si(), .so(),
                        .rst_l (arst_l));

assign  reset =  ~dbb_reset_l;
assign  clk = rclk;


//*******************************************************************************************************
//PICK  
//*******************************************************************************************************

   //pick for thread force events
assign	thread_force_events_sel = |(events[3:0] & thread_force[3:0]) ;

assign  thread_force_pe_mask[3:0]  =  events[3:0] & thread_force[3:0] ;
assign	pick_thread_force_1hot[0] = thread_force_pe_mask[0] ;
assign	pick_thread_force_1hot[1] = thread_force_pe_mask[1] & ~thread_force_pe_mask[0] ;
assign	pick_thread_force_1hot[2] = thread_force_pe_mask[2] & ~|thread_force_pe_mask[1:0] ;
assign	pick_thread_force_1hot[3] = thread_force_pe_mask[3] & ~|thread_force_pe_mask[2:0] ;

   //pick for round robin events
assign  pick_rrobin_events[3:0]  =  events[3:0] & ~pick_rrobin[3:0] ;

assign  pick_rrobin_1hot[0] = ~events_pick_dir_d1 & pick_rrobin_events[0] ;
assign	pick_rrobin_1hot[1] = ~events_pick_dir_d1 & pick_rrobin_events[1] & ~pick_rrobin_events[0] ;
assign	pick_rrobin_1hot[2] = ~events_pick_dir_d1 & pick_rrobin_events[2] & ~|pick_rrobin_events[1:0] ;
assign	pick_rrobin_1hot[3] = ~events_pick_dir_d1 & pick_rrobin_events[3] & ~|pick_rrobin_events[2:0] ;

   //pick for reverse round robin events
assign  pick_rev_rrobin_1hot[0] = events_pick_dir_d1 & pick_rrobin_events[0] & ~|pick_rrobin_events[3:1] ;
assign	pick_rev_rrobin_1hot[1] = events_pick_dir_d1 & pick_rrobin_events[1] & ~|pick_rrobin_events[3:2] ;
assign	pick_rev_rrobin_1hot[2] = events_pick_dir_d1 & pick_rrobin_events[2] & ~|pick_rrobin_events[3] ;
assign	pick_rev_rrobin_1hot[3] = events_pick_dir_d1 & pick_rrobin_events[3] ;

assign  pick_rrobin_1hot_mx[3:0]  =  pick_rev_rrobin_1hot[3:0] | pick_rrobin_1hot[3:0] ;
assign  pick_one_hot[3:0]    =  thread_force_events_sel ? pick_thread_force_1hot[3:0] : 
                                                          pick_rrobin_1hot_mx[3:0] ;

//*******************************************************************************************************



//*******************************************************************************************************
//PICK ROUND ROBIN (bug4814)
//*******************************************************************************************************
// this is used if there are no requests to be picked based on pick_status[3:0]

assign pick_rrobin_status_or_one_hot[3:0] = pick_rrobin[3:0] | events_picked[3:0] ;
assign pick_rrobin_reset = reset | ~|(events[3:0] & ~pick_rrobin_status_or_one_hot[3:0]) ;
   //change direction bit only when events are non-zero
assign pick_rrobin_dir_upd = |events[3:0] & (~|(events[3:0] & ~pick_rrobin_status_or_one_hot[3:0])) ;

   // make reset dominant
assign pick_rrobin_din[3:0] = pick_rrobin_status_or_one_hot[3:0] & ~{4{pick_rrobin_reset}};

dff_s   #(4) ff_pick_rrobin (
           .din    (pick_rrobin_din[3:0]),
           .q      (pick_rrobin[3:0]    ),
           .clk    (clk),
           .se     (1'b0),       .si (),          .so ()
            );
//*******************************************************************************************************


//*******************************************************************************************************
// PICK DIRECTION
//*******************************************************************************************************

   //bug4609 - change direction of pick all events are picked in round robin pick
   //          this is needed when the condition below occurs. assuming misc is less frequent
   //          this should pick load/store in round robin fashion
   //-------------------------------------------------------
   // cycle                 0   1   2
   //-------------------------------------------------------
   // history{misc,st,ld}  010 011 011
   // vld{misc,st,ld}      011 011 011
   //-------------------------------------------------------

assign events_pick_dir  =  ~reset &
                           (( ~pick_rrobin_dir_upd & events_pick_dir_d1) |		//hold
                            (  pick_rrobin_dir_upd & ~events_pick_dir_d1)) ;		//set - invert direction
   
   dff_s   #(1) ff_events_pick_dir (
        .din    (events_pick_dir),
        .q      (events_pick_dir_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
   
//*******************************************************************************************************
endmodule
