// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_lru4.v
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
//  Module Name: sparc_ifu_lru4
//  Description:	
//  LRU scheduler.  Least priority to the last granted
//  customer.  If no requests, the priority remains the same. 
*/
////////////////////////////////////////////////////////////////////////

module sparc_ifu_lru4(/*AUTOARG*/
   // Outputs
   grant_vec, so, 
   // Inputs
   clk, reset, se, si, recent_vec, load_recent, req_vec, spec_vec, 
   use_spec
   );

   input     clk, reset, se, si;

   input [3:0] recent_vec;
   input       load_recent;
   input [3:0] req_vec,
               spec_vec;

   input       use_spec;
   
   output [3:0] grant_vec;
   
   output       so;


   wire [3:0]   used0,  // used0 is mru
		            used1,
		            used2,
		            used3;  // used3 is lru

   wire [3:0]   used23,
                used23_nxt;

   wire [3:0]   used0_buf, 
		            used1_buf,
		            used2_buf,
		            used3_buf; 

   wire [3:0]   sp_used0, 
		            sp_used1,
		            sp_used2,
		            sp_used3; 
   wire [3:0]   nosp_used0, 
		            nosp_used1,
		            nosp_used2,
		            nosp_used3; 

   wire [3:0]   used0_calc,
		            used0_nxt,
 		            used1_calc,
		            used1_nxt,
 		            used2_calc,
		            used2_nxt,
 		            used3_calc,
		            used3_nxt;

   wire         hit1,
		            hit2,
		            hit3;

   wire [3:0]   nospec_grant,
                spec_grant;
   
   wire         reqhit1,
		            reqhit2,
		            reqhit3,
                reqhit23;

   wire         spechit1,
		            spechit2,
		            spechit3,
                spechit23;

   wire         sel_u0,
		            sel_u1,
		            sel_u2,
		            sel_u3;

   wire         sel_su0,
		            sel_su1,
		            sel_su2,
		            sel_su3;

   dp_buffer #(4) use_buf0(.dout(used0_buf),
                      .in  (used0));
   dp_buffer #(4) use_buf1(.dout(used1_buf),
                      .in  (used1));
   dp_buffer #(4) use_buf2(.dout(used2_buf),
                      .in  (used2));
   dp_buffer #(4) use_buf3(.dout(used3_buf),
                      .in  (used3));
   

   // determine lru order for next cycle
//   assign hit0 = (used0_buf[0] & recent_vec[0] |
//		              used0_buf[1] & recent_vec[1] |
//		              used0_buf[2] & recent_vec[2] |
//		              used0_buf[3] & recent_vec[3]) & load_recent;

   assign hit1 = (used1_buf[0] & recent_vec[0] |
		              used1_buf[1] & recent_vec[1] |
		              used1_buf[2] & recent_vec[2] |
		              used1_buf[3] & recent_vec[3]) & load_recent;

   assign hit2 = (used2_buf[0] & recent_vec[0] |
		              used2_buf[1] & recent_vec[1] |
		              used2_buf[2] & recent_vec[2] |
		              used2_buf[3] & recent_vec[3]) & load_recent;

   assign hit3 = (used3_buf[0] & recent_vec[0] |
		              used3_buf[1] & recent_vec[1] |
		              used3_buf[2] & recent_vec[2] |
		              used3_buf[3] & recent_vec[3]) & load_recent;
   

   assign  used0_calc = load_recent          ?  recent_vec : used0_buf;
   assign  used1_calc = (hit3 | hit2 | hit1) ?  used0_buf  : used1_buf;
   assign  used2_calc = (hit3 | hit2)        ?  used1_buf  : used2_buf;
   assign  used3_calc = (hit3)               ?  used2_buf  : used3_buf;

   assign  used0_nxt = reset ? 4'b0001 : used0_calc;
   assign  used1_nxt = reset ? 4'b0010 : used1_calc;
   assign  used2_nxt = reset ? 4'b0100 : used2_calc;
   assign  used3_nxt = reset ? 4'b1000 : used3_calc;

   // use 4X4 matrix to hold lru info
   dff_s #(4) use0_reg(.din (used0_nxt),
		                 .q   (used0),
		                 .clk (clk), .se(se), .si(), .so());
   
   dff_s #(4) use1_reg(.din (used1_nxt),
		                 .q   (used1),
		                 .clk (clk), .se(se), .si(), .so());
   
   dff_s #(4) use2_reg(.din (used2_nxt),
		                 .q   (used2),
		                 .clk (clk), .se(se), .si(), .so());
   
   // used3 is lru
   dff_s #(4) use3_reg(.din (used3_nxt),
		                 .q   (used3),
		                 .clk (clk), .se(se), .si(), .so());

   assign  used23_nxt = used2_nxt | used3_nxt;
   
   dff_s #(4) use23_reg(.din (used23_nxt),
		                 .q   (used23),
		                 .clk (clk), .se(se), .si(), .so());
   

   // grant request based on lru

// save some loading on req_vec by not doing this   
//   assign  reqhit0 = (used0[0] & req_vec[0] |
//		      used0[1] & req_vec[1] |
//		      used0[2] & req_vec[2] |
//		      used0[3] & req_vec[3]);
   
   assign  reqhit1 = (used1[0] & req_vec[0] |
		                  used1[1] & req_vec[1] |
		                  used1[2] & req_vec[2] |
		                  used1[3] & req_vec[3]);
   
   assign  reqhit2 = (used2[0] & req_vec[0] |
		                  used2[1] & req_vec[1] |
		                  used2[2] & req_vec[2] |
		                  used2[3] & req_vec[3]);

   assign  reqhit3 = (used3[0] & req_vec[0] |
		                  used3[1] & req_vec[1] |
		                  used3[2] & req_vec[2] |
		                  used3[3] & req_vec[3]);

   assign  reqhit23 = (used23[0] & req_vec[0] |
		                   used23[1] & req_vec[1] |
		                   used23[2] & req_vec[2] |
		                   used23[3] & req_vec[3]);
   
   assign  sel_u3 = reqhit3;
   assign  sel_u2 = ~reqhit3 & reqhit2;
   assign  sel_u1 = ~reqhit23 & reqhit1;
   assign  sel_u0 = ~reqhit23 & ~reqhit1;
   
   assign  nosp_used0 = used0 & {4{~use_spec}};
   assign  nosp_used1 = used1 & {4{~use_spec}};
   assign  nosp_used2 = used2 & {4{~use_spec}};
   assign  nosp_used3 = used3 & {4{~use_spec}};

   mux4ds #(4) nsgnt_mux(.dout (nospec_grant),
		                     .in0  (nosp_used0),
		                     .in1  (nosp_used1),
		                     .in2  (nosp_used2),
		                     .in3  (nosp_used3),
		                     .sel0 (sel_u0),
		                     .sel1 (sel_u1),
		                     .sel2 (sel_u2),
		                     .sel3 (sel_u3));

   assign  spechit1 = (used1[0] & spec_vec[0] |
		                   used1[1] & spec_vec[1] |
		                   used1[2] & spec_vec[2] |
		                   used1[3] & spec_vec[3]);
   
   assign  spechit2 = (used2[0] & spec_vec[0] |
		                   used2[1] & spec_vec[1] |
		                   used2[2] & spec_vec[2] |
		                   used2[3] & spec_vec[3]);

   assign  spechit3 = (used3[0] & spec_vec[0] |
		                   used3[1] & spec_vec[1] |
		                   used3[2] & spec_vec[2] |
		                   used3[3] & spec_vec[3]);

   assign  spechit23 = (used23[0] & spec_vec[0] |
		                    used23[1] & spec_vec[1] |
		                    used23[2] & spec_vec[2] |
		                    used23[3] & spec_vec[3]);
   
   assign  sel_su3 = spechit3;
   assign  sel_su2 = ~spechit3 & spechit2;
   assign  sel_su1 = ~spechit23 & spechit1;
   assign  sel_su0 = ~spechit23 & ~spechit1;

   assign  sp_used0 = used0 & {4{use_spec}};
   assign  sp_used1 = used1 & {4{use_spec}};
   assign  sp_used2 = used2 & {4{use_spec}};
   assign  sp_used3 = used3 & {4{use_spec}};
   
   mux4ds #(4) sgnt_mux(.dout (spec_grant),
		                  .in0  (sp_used0),
		                  .in1  (sp_used1),
		                  .in2  (sp_used2),
		                  .in3  (sp_used3),
		                  .sel0 (sel_su0),
		                  .sel1 (sel_su1),
		                  .sel2 (sel_su2),
		                  .sel3 (sel_su3));

   assign  grant_vec = spec_grant | nospec_grant;
   

endmodule // sparc_ifu_lru4

