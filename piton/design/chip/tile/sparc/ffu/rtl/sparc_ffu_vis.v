// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ffu_vis.v
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
///////////////////////////////////////////////////////////////////////
/*
//  Module Name: sparc_ffu_vis
//      Description: This is the ffu VIS blk.
//	It implements FALIGN, partitioned add and logicals.
*/

module sparc_ffu_vis(/*AUTOARG*/
   // Outputs
   vis_dp_rd_data, 
   // Inputs
   dp_vis_rs1_data, dp_vis_rs2_data, ctl_vis_sel_add, 
   ctl_vis_sel_log, ctl_vis_sel_align, ctl_vis_add32, 
   ctl_vis_subtract, ctl_vis_cin, ctl_vis_align0, ctl_vis_align2, 
   ctl_vis_align4, ctl_vis_align6, ctl_vis_align_odd, 
   ctl_vis_log_sel_pass, ctl_vis_log_sel_nand, ctl_vis_log_sel_nor, 
   ctl_vis_log_sel_xor, ctl_vis_log_invert_rs1, 
   ctl_vis_log_invert_rs2, ctl_vis_log_constant, 
   ctl_vis_log_pass_const, ctl_vis_log_pass_rs1, 
   ctl_vis_log_pass_rs2
   );

   input [63:0] dp_vis_rs1_data;
   input [63:0] dp_vis_rs2_data;
   input        ctl_vis_sel_add;
   input        ctl_vis_sel_log;
   input        ctl_vis_sel_align;
   input        ctl_vis_add32;
   input        ctl_vis_subtract;
   input        ctl_vis_cin;
   input         ctl_vis_align0;
   input         ctl_vis_align2;
   input         ctl_vis_align4;
   input         ctl_vis_align6;
   input         ctl_vis_align_odd;
   input         ctl_vis_log_sel_pass;
   input         ctl_vis_log_sel_nand;
   input         ctl_vis_log_sel_nor;
   input         ctl_vis_log_sel_xor;
   input         ctl_vis_log_invert_rs1;
   input         ctl_vis_log_invert_rs2;
   input         ctl_vis_log_constant;
   input         ctl_vis_log_pass_const;
   input         ctl_vis_log_pass_rs1;
   input         ctl_vis_log_pass_rs2;

   output [63:0] vis_dp_rd_data;

   wire [71:0]   align_data1;
   wire [63:0]   align_rs1;
   wire [63:8]   align_rs2;

   wire [63:0]   add_out;
   wire [63:0]   log_out;
   wire [63:0]   align_out;
   wire [63:0]   add_in_rs1;
   wire [63:0]   add_in_rs2;

   wire [63:0]   logic_nor;
   wire [63:0]   logic_pass;
   wire [63:0]   logic_xor;
   wire [63:0]   logic_nand;
   wire [63:0]   logic_rs1;
   wire [63:0]   logic_rs2;
   
   /////////////////////////////////////////////////////////////////
   // Logic for partitioned addition.
   //----------------------------------
   // RS1 is normal RS1 data, RS2 is inverted by subtraction signal.
   /////////////////////////////////////////////////////////////////
   assign        add_in_rs1[63:0] = dp_vis_rs1_data[63:0];
   assign        add_in_rs2[63:0] = dp_vis_rs2_data[63:0] ^ {64{ctl_vis_subtract}};
   sparc_ffu_part_add32 part_adder_hi(.z(add_out[63:32]),
                                   .add32(ctl_vis_add32),
                                   .a(add_in_rs1[63:32]),
                                   .b(add_in_rs2[63:32]),
                                   .cin(ctl_vis_cin));
   sparc_ffu_part_add32 part_adder_lo(.z(add_out[31:0]),
                                   .add32(ctl_vis_add32),
                                   .a(add_in_rs1[31:0]),
                                   .b(add_in_rs2[31:0]),
                                   .cin(ctl_vis_cin));

   ///////////////////////////////////////////////////////////////////////////
   // Datapath for FALIGNDATA
   //---------------------------------------------------------------
   // FALIGNDATA concatenates rs1 and rs2 and shifts them by byte to create
   // an 8 byte value.  The first mux creates a 72 bit value and the
   // 2nd mux picks 64 bits out of these for the output.
   ///////////////////////////////////////////////////////////////////////////
   dp_buffer #(64) align_rs1_buf(.dout(align_rs1[63:0]), .in(dp_vis_rs1_data[63:0]));
   dp_buffer #(56) align_rs2_buf(.dout(align_rs2[63:8]), .in(dp_vis_rs2_data[63:8]));
   mux4ds #(72) falign_mux1(.dout(align_data1[71:0]),
                            .in0({align_rs1[63:0], align_rs2[63:56]}),
                            .in1({align_rs1[47:0], align_rs2[63:40]}),
                            .in2({align_rs1[31:0], align_rs2[63:24]}),
                            .in3({align_rs1[15:0], align_rs2[63:8]}),
                            .sel0(ctl_vis_align0),
                            .sel1(ctl_vis_align2),
                            .sel2(ctl_vis_align4),
                            .sel3(ctl_vis_align6));
   dp_mux2es #(64) falign_mux2(.dout(align_out[63:0]),
                              .in0(align_data1[71:8]),
                              .in1(align_data1[63:0]),
                              .sel(ctl_vis_align_odd));

   ///////////////////////////////////////////////////////////////////////////
   // Datapath for VIS logicals
   //-----------------------------------------------------------------------
   // VIS logicals perform 3 fundamental ops: NAND, NOR and XOR plus inverted
   // versions of the inputs to create the other versions.  These 3 outputs are
   // muxed with a choice of 1, 0, rs1 or rs2.
   ///////////////////////////////////////////////////////////////////////////

   // create inverted versions of data if desired
   assign        logic_rs1[63:0] = dp_vis_rs1_data[63:0] ^ {64{ctl_vis_log_invert_rs1}};
   assign        logic_rs2[63:0] = dp_vis_rs2_data[63:0] ^ {64{ctl_vis_log_invert_rs2}};

   // 3 basic logical operations
   assign        logic_nor[63:0] = ~(logic_rs1[63:0] | logic_rs2[63:0]);
   assign        logic_nand[63:0] = ~(logic_rs1[63:0] & logic_rs2[63:0]);
   assign        logic_xor[63:0] = (logic_rs1[63:0] ^ logic_rs2[63:0]);
   
   // mux for pass through data
   mux3ds #(64) pass_mux(.dout(logic_pass[63:0]),
                         .in0({64{ctl_vis_log_constant}}),
                         .in1(logic_rs1[63:0]),
                         .in2(logic_rs2[63:0]),
                         .sel0(ctl_vis_log_pass_const),
                         .sel1(ctl_vis_log_pass_rs1),
                         .sel2(ctl_vis_log_pass_rs2));

   // pick between logic outputs
   mux4ds #(64) logic_mux(.dout(log_out[63:0]),
                          .in0(logic_nor[63:0]),
                          .in1(logic_nand[63:0]),
                          .in2(logic_xor[63:0]),
                          .in3(logic_pass[63:0]),
                          .sel0(ctl_vis_log_sel_nor),
                          .sel1(ctl_vis_log_sel_nand),
                          .sel2(ctl_vis_log_sel_xor),
                          .sel3(ctl_vis_log_sel_pass));


   
   //////////////////////////////////////////////////////////
   // output mux
   //////////////////////////////////////////////////////////
   mux3ds #(64) output_mux(.dout(vis_dp_rd_data[63:0]),
                           .in0(add_out[63:0]),
                           .in1(log_out[63:0]),
                           .in2(align_out[63:0]),
                           .sel0(ctl_vis_sel_add),
                           .sel1(ctl_vis_sel_log),
                           .sel2(ctl_vis_sel_align));
   
endmodule // sparc_ffu_vis
