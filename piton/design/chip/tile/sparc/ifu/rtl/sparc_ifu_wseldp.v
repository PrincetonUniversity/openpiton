// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_wseldp.v
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
//////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_ifu_wsel
//  Description:	
//     Way selects removed from icache and done here 
*/

module sparc_ifu_wseldp (/*AUTOARG*/
   // Outputs
   wsel_fdp_fetdata_s1, wsel_fdp_topdata_s1, wsel_mbist_icache_data, 
   so, 
   // Inputs
   rclk, se, si, icd_wsel_fetdata_s1, icd_wsel_topdata_s1, 
   itlb_wsel_waysel_s1, ifq_erb_asiway_f
   );

   input          rclk, 
                  se,
                  si;

   input  [135:0] icd_wsel_fetdata_s1,
                  icd_wsel_topdata_s1;

   input [3:0]    itlb_wsel_waysel_s1;
   input [1:0]    ifq_erb_asiway_f;

   output [33:0]  wsel_fdp_fetdata_s1;
   output [33:0]  wsel_fdp_topdata_s1;

   output [67:0]  wsel_mbist_icache_data;

   output         so;
   
   // local signals
   wire [3:0]     dec_asiway_s_l,
                  waysel_buf_s1;
   wire [1:0]     asiway_s;
   
   wire [33:0]    rdc_fetdata_s1,
                  rdc_topdata_s1,
                  erb_asidata_s,                  
                  asi_topdata_s;
   wire           clk;
   
   //
   // Code begins here
   //
   //------------------
   // Control Portion
   //------------------

   assign   clk = rclk;
   
   // flop and decode waysel
   dff_s #(2) asiway_reg(.din (ifq_erb_asiway_f),
                       .q   (asiway_s),
                       .clk (clk), .se(se), .si(), .so());
   assign   dec_asiway_s_l[0] = ~(~asiway_s[1] & ~asiway_s[0]);
   assign   dec_asiway_s_l[1] = ~(~asiway_s[1] &  asiway_s[0]);
   assign   dec_asiway_s_l[2] = ~( asiway_s[1] & ~asiway_s[0]);
   assign   dec_asiway_s_l[3] = ~( asiway_s[1] &  asiway_s[0]);

   //--------------------------
   // Datapath Section
   //--------------------------

   // buffer wayselect from itlb
   // align these buffers with the corresponding pins in itlb
   assign   waysel_buf_s1 = itlb_wsel_waysel_s1;

   // Very Timing Critical Wayselect Muxes
   // !!Cannot be a one-hot mux!!
   // use ao2222
//   bw_u1_ao2222_2x #(34) fetway_mx(.z   (rdc_fetdata_s1[33:0]),
//                                   .a2  (icd_wsel_fetdata_s1[33:0]),
//                                   .b2  (icd_wsel_fetdata_s1[67:34]),
//                                   .c2  (icd_wsel_fetdata_s1[101:68]),
//                                   .d2  (icd_wsel_fetdata_s1[135:102]),
//                                   .a1  (waysel_buf_s1[0]),
//                                   .b1  (waysel_buf_s1[1]),
//                                   .c1  (waysel_buf_s1[2]),
//                                   .d1  (waysel_buf_s1[3]));

//   bw_u1_ao2222_2x #(34) topway_mx(.z   (rdc_topdata_s1[33:0]),
//                                   .a2  (icd_wsel_topdata_s1[33:0]),
//                                   .b2  (icd_wsel_topdata_s1[67:34]),
//                                   .c2  (icd_wsel_topdata_s1[101:68]),
//                                   .d2  (icd_wsel_topdata_s1[135:102]),
//                                   .a1  (waysel_buf_s1[0]),
//                                   .b1  (waysel_buf_s1[1]),
//                                   .c1  (waysel_buf_s1[2]),
//                                   .d1  (waysel_buf_s1[3]));

   assign rdc_fetdata_s1 = icd_wsel_fetdata_s1[33:0] & {34{waysel_buf_s1[0]}} |
                         icd_wsel_fetdata_s1[67:34] & {34{waysel_buf_s1[1]}}  |
                         icd_wsel_fetdata_s1[101:68] & {34{waysel_buf_s1[2]}} |
                         icd_wsel_fetdata_s1[135:102] & {34{waysel_buf_s1[3]}};
   
   assign rdc_topdata_s1 = icd_wsel_topdata_s1[33:0] & {34{waysel_buf_s1[0]}} |
                         icd_wsel_topdata_s1[67:34] & {34{waysel_buf_s1[1]}}  |
                         icd_wsel_topdata_s1[101:68] & {34{waysel_buf_s1[2]}} |
                         icd_wsel_topdata_s1[135:102] & {34{waysel_buf_s1[3]}};

   // buffer and send to fdp
   assign   wsel_fdp_fetdata_s1 = rdc_fetdata_s1;
   assign   wsel_fdp_topdata_s1 = rdc_topdata_s1;
   
   // mux for asi data, not critical
   dp_mux4ds #(34) asid_mx(.dout (erb_asidata_s[33:0]),
                           .in0  (icd_wsel_fetdata_s1[33:0]),
                           .in1  (icd_wsel_fetdata_s1[67:34]),
                           .in2  (icd_wsel_fetdata_s1[101:68]),
                           .in3  (icd_wsel_fetdata_s1[135:102]),
                           .sel0_l (dec_asiway_s_l[0]),
                           .sel1_l (dec_asiway_s_l[1]),
                           .sel2_l (dec_asiway_s_l[2]),
                           .sel3_l (dec_asiway_s_l[3]));

   dp_mux4ds #(34) asitop_mx(.dout (asi_topdata_s[33:0]),
                           .in0  (icd_wsel_topdata_s1[33:0]),
                           .in1  (icd_wsel_topdata_s1[67:34]),
                           .in2  (icd_wsel_topdata_s1[101:68]),
                           .in3  (icd_wsel_topdata_s1[135:102]),
                           .sel0_l (dec_asiway_s_l[0]),
                           .sel1_l (dec_asiway_s_l[1]),
                           .sel2_l (dec_asiway_s_l[2]),
                           .sel3_l (dec_asiway_s_l[3]));

   // buffer before sending to bist/errdp
   assign wsel_mbist_icache_data = {asi_topdata_s[33:32], 
                                    erb_asidata_s[33:32], 
                                    asi_topdata_s[31:0],
                                    erb_asidata_s[31:0]};

// Everything below can be ignored for physical implementation
// monitor for waysel -- moved here from itlb
// Keeping this around for 0-in. cmp level check is in icache_mutex_mon.v

`ifdef DEFINE_0IN
   always @ (negedge clk)
     begin
        if (!((waysel_buf_s1 == 4'b0001) ||
              (waysel_buf_s1 == 4'b0010) || 
              (waysel_buf_s1 == 4'b0100) ||
              (waysel_buf_s1 == 4'b1000) || 
              (waysel_buf_s1 == 4'b0000)))
          begin
             // 0in <fire -message "FATAL ERROR: icache waysel not mutex"
             //$display("IC_WAYSEL", "FATAL ERROR: icache waysel not mutex %b",
             //       waysel_buf_s1);
             //$finish();
          end
     end // always @ (negedge clk)
`endif
 
endmodule // sparc_ifu_wseldp

