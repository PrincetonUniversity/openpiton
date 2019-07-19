// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ffu_dp.v
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
//  Module Name: sparc_ffu_dp
//	Description: This is the ffu datapath.  It stores the 2 128 bit operands
//  	and the result (puts result in the 1st source to save space). 
*/

`include "iop.h"
`include "sys.h"

module sparc_ffu_dp (/*AUTOARG*/
   // Outputs
   so, dp_frf_data, ffu_lsu_data, dp_vis_rs1_data, dp_vis_rs2_data, 
   dp_ctl_rs2_sign, dp_ctl_fsr_fcc, dp_ctl_fsr_rnd, dp_ctl_fsr_tem, 
   dp_ctl_fsr_aexc, dp_ctl_fsr_cexc, dp_ctl_ld_fcc, 
   dp_ctl_gsr_mask_e, dp_ctl_gsr_scale_e, dp_ctl_synd_out_low, 
   dp_ctl_synd_out_high, 
   // Inputs
   rclk, se, si, ctl_dp_rst_l, frf_dp_data, cpx_fpu_data, 
   lsu_ffu_ld_data, vis_dp_rd_data, ctl_dp_wsr_data_w2, ctl_dp_sign, 
   ctl_dp_exc_w2, ctl_dp_fcc_w2, ctl_dp_ftt_w2, ctl_dp_noshift64_frf, 
   ctl_dp_shift_frf_right, ctl_dp_shift_frf_left, 
   ctl_dp_zero_low32_frf, ctl_dp_output_sel_rs1, 
   ctl_dp_output_sel_rs2, ctl_dp_output_sel_frf, 
   ctl_dp_output_sel_fsr, ctl_dp_noflip_lsu, ctl_dp_flip_lsu, 
   ctl_dp_noflip_fpu, ctl_dp_flip_fpu, ctl_dp_rs2_frf_read, 
   ctl_dp_rs2_sel_vis, ctl_dp_rs2_sel_fpu_lsu, ctl_dp_rs2_keep_data, 
   ctl_dp_rd_ecc, ctl_dp_fp_thr, ctl_dp_fsr_sel_old, 
   ctl_dp_fsr_sel_ld, ctl_dp_fsr_sel_fpu, ctl_dp_gsr_wsr_w2, 
   ctl_dp_thr_e, ctl_dp_new_rs1, ctl_dp_ecc_sel_frf
   ) ;
   input rclk;
   input se;
   input si;
   input ctl_dp_rst_l;
   input [77:0] frf_dp_data;
   input [63:0]   cpx_fpu_data;
   input [63:0] lsu_ffu_ld_data;
   input [63:0] vis_dp_rd_data;

   input [36:0] ctl_dp_wsr_data_w2;

   input [1:0]   ctl_dp_sign;  // sign after abs or neg
   input [9:0] 	 ctl_dp_exc_w2;
   input [7:0] 	 ctl_dp_fcc_w2;
   input [2:0] 	 ctl_dp_ftt_w2;

   // mux selects
   input         ctl_dp_noshift64_frf;     // choose output from FRF
   input         ctl_dp_shift_frf_right;
   input         ctl_dp_shift_frf_left;

   input         ctl_dp_zero_low32_frf;
   
   input         ctl_dp_output_sel_rs1;  // choose output to lsu
   input         ctl_dp_output_sel_rs2;
   input         ctl_dp_output_sel_frf;
   input         ctl_dp_output_sel_fsr;

   input         ctl_dp_noflip_lsu;// inputs from lsu and fpu
   input         ctl_dp_flip_lsu;
   input         ctl_dp_noflip_fpu;
   input         ctl_dp_flip_fpu;
   
   input         ctl_dp_rs2_frf_read;    // choose r2
   input         ctl_dp_rs2_sel_vis;
   input         ctl_dp_rs2_sel_fpu_lsu;
   input         ctl_dp_rs2_keep_data;
   input         ctl_dp_rd_ecc;
   
   input [3:0] 	 ctl_dp_fp_thr;

   input [3:0] 	 ctl_dp_fsr_sel_old,     // choose what to update FSR with
		 ctl_dp_fsr_sel_ld,
		 ctl_dp_fsr_sel_fpu;

   input [3:0]   ctl_dp_gsr_wsr_w2;
   input [3:0]   ctl_dp_thr_e;
   

   // rs1 selects
   input         ctl_dp_new_rs1;
   
   // 2:1 mux selects
   input      ctl_dp_ecc_sel_frf;

   // outputs
   output       so;
   output [63:0] dp_frf_data;
   output [63:0] ffu_lsu_data;
   output [63:0] dp_vis_rs1_data;
   output [63:0] dp_vis_rs2_data;
   output [1:0]  dp_ctl_rs2_sign;  // sign for rs2
   output [7:0]  dp_ctl_fsr_fcc;
   output [1:0]  dp_ctl_fsr_rnd;
   output [4:0]  dp_ctl_fsr_tem;
   output [4:0]  dp_ctl_fsr_aexc;
   output [4:0]  dp_ctl_fsr_cexc;
   
   output [7:0]  dp_ctl_ld_fcc;

   output [31:0] dp_ctl_gsr_mask_e;
   output [4:0]  dp_ctl_gsr_scale_e;
   
   
   output [6:0] dp_ctl_synd_out_low;   // signals for ecc errors
   output [6:0] dp_ctl_synd_out_high;
 
   wire         clk;
   wire         reset;
   // local signals
   wire [63:0] 	 fpu_ffu_data;
   wire [63:0]   lsu_ffu_ld_data_d1;
   wire [63:0]   rs2_rd_data;  // stores both the rs2 and rd data
   wire [63:0]   rs2_rd_data_next;
   wire [63:0]   write_data;    // needed since block loads are pipelined
   wire [63:0]   rs2_data_changed;
   wire [63:0]   local_rd_data;
   wire [63:0]   rs1_data;
   wire [63:0]   rs1_data_next;
   wire [63:0]   shifted_frf_data;
   wire [63:0]   new_frf_data;
   wire [63:0]   lsu_fpu_data;
   wire [63:0]   frf_data_in;
   wire [6:0]    synd_in_low;   // input ecc for lower word
   wire [6:0]    synd_in_h;   // input ecc for upper word
   wire [63:0] corr_data_next;
   wire [63:0] corr_data;
   wire [63:0] ecc_data_in;

   wire [27:0] 	 current_fsr,
		 t0_fsr,
		 t1_fsr,
		 t2_fsr,
		 t3_fsr;
   wire [27:0] 	 t0_fsr_nxt,
		 t1_fsr_nxt,
		 t2_fsr_nxt,
		 t3_fsr_nxt;
   wire [27:0] 	 t0_ldfsr_data,
		             t0_fpufsr_data;
   wire [27:0] 	 t1_ldfsr_data,
		             t1_fpufsr_data;
   wire [27:0] 	 t2_ldfsr_data,
		             t2_fpufsr_data;
   wire [27:0] 	 t3_ldfsr_data,
		             t3_fpufsr_data;

   wire [36:0]   gsr_e;
   wire [36:0]   t0_gsr;
   wire [36:0]   t0_gsr_nxt;
   wire [36:0]   t1_gsr;
   wire [36:0]   t1_gsr_nxt;
   wire [36:0]   t2_gsr;
   wire [36:0]   t2_gsr_nxt;
   wire [36:0]   t3_gsr;
   wire [36:0]   t3_gsr_nxt;

   assign        reset = ~ctl_dp_rst_l;
   assign        clk= rclk;

   dff_s #(64) cpx_reg(.din(cpx_fpu_data[63:0]),
			               .q   (fpu_ffu_data[63:0]),
			               .clk (clk), .se(se), .si(), .so());

   // flop for lsu data.  the data is flopped in ffu, but the vld is flopped in the lsu.
   // This is for timing reasons on the valid bit and Sanjay didn't want to redo the
   // lsu dp for the data portion
   dff_s #(64) lsu_data_dff(.din(lsu_ffu_ld_data[63:0]), .clk(clk), .q(lsu_ffu_ld_data_d1[63:0]),
                          .se(se), .si(), .so());
   assign dp_ctl_ld_fcc[7:0] = {lsu_ffu_ld_data_d1[37:32], lsu_ffu_ld_data_d1[11:10]};
   
   ///////////////////////////////////////////////
   //	Input from FRF (shift as needed for singles)
   //	The data needs to be shifted around because these are 64 bit reads but
   //	the required data might be in either the upper or lower 32 bits for
   //	singles.  If it is a double then the data is left alone.
   //	If it is a single move and the source and target have the same alignment
   //	then no change happens.  If it is a single move and the source and target
   //	have different alignments the operands get moved into place for the write.
   //	If it is data that will be sent to the lsu the data is moved into the lower
   //	32 bits.  If the data will be sent to the fpu the data is moved to the upper
   //	32 bits (if not there already)
   ///////////////////////////////////////////////
   assign  frf_data_in[63:32] = frf_dp_data[70:39];
   assign  frf_data_in[31:0] = frf_dp_data[31:0];
   mux3ds #(64) frf_input_mux(.dout(shifted_frf_data[63:0]),
                              .in0(frf_data_in[63:0]),
                              .in1({32'b0, frf_data_in[63:32]}),
                              .in2({frf_data_in[31:0], 32'b0}),
                              .sel0(ctl_dp_noshift64_frf),
                              .sel1(ctl_dp_shift_frf_right),
                              .sel2(ctl_dp_shift_frf_left));
   assign  new_frf_data[63:32] = shifted_frf_data[63:32];
   assign  new_frf_data[31:0] = shifted_frf_data[31:0] & {32{~ctl_dp_zero_low32_frf}};

   mux4ds #(64) lsu_fpu_input_mux(.dout(lsu_fpu_data[63:0]),
                                  .in0(lsu_ffu_ld_data_d1[63:0]),
                                  .in1({lsu_ffu_ld_data_d1[31:0], 32'b0}),
                                  .in2(fpu_ffu_data[63:0]),
                                  .in3({32'b0, fpu_ffu_data[63:32]}),
                                  .sel0(ctl_dp_noflip_lsu),
                                  .sel1(ctl_dp_flip_lsu),
                                  .sel2(ctl_dp_noflip_fpu),
                                  .sel3(ctl_dp_flip_fpu));

   // Data to FRF
   dp_buffer #(64) frf_out_buf(.in(write_data[63:0]), .dout (dp_frf_data[63:0]));



   // Data to LSU
   // Mux for lsu data between two sets of data and the direct 
   // frf output for stores
   mux4ds #(64) output_mux(.dout (ffu_lsu_data[63:0]),
                           .in0  (rs2_rd_data[63:0]),
                           .in1  (rs1_data[63:0]),
                           .in2  (shifted_frf_data[63:0]),
			                     .in3  ({26'b0, current_fsr[27:20], 2'b0, current_fsr[19:15], 6'b0, current_fsr[14:12], 2'b0, current_fsr[11:0]}),
                           .sel0 (ctl_dp_output_sel_rs2),
                           .sel1 (ctl_dp_output_sel_rs1),
                           .sel2 (ctl_dp_output_sel_frf),
			                     .sel3 (ctl_dp_output_sel_fsr));

   // RS2 can take value from frf  (with modification to sign), from lsu 
   // or keep value
   // The modification to the sign bits allows for FABS and FNEG
   assign dp_ctl_rs2_sign[1:0] = {new_frf_data[63], new_frf_data[31]};
   
   assign rs2_data_changed[63:0] = {ctl_dp_sign[1], new_frf_data[62:32], 
				    ctl_dp_sign[0], new_frf_data[30:0]};

   dp_mux2es #(64) local_rd_mux(.dout(local_rd_data[63:0]),
                             .in0(rs2_data_changed[63:0]),
                             .in1(corr_data[63:0]),
                             .sel(ctl_dp_rd_ecc));

   mux4ds #(64) rs2_rd_mux(.dout (rs2_rd_data_next[63:0]),
                           .in0  (local_rd_data[63:0]),
                           .in1  (vis_dp_rd_data[63:0]),
                           .in2  (lsu_fpu_data[63:0]),
                           .in3  (rs2_rd_data[63:0]),
                           .sel0 (ctl_dp_rs2_frf_read),
                           .sel1 (ctl_dp_rs2_sel_vis),
                           .sel2 (ctl_dp_rs2_sel_fpu_lsu),
                           .sel3 (ctl_dp_rs2_keep_data));
   
   dff_s #(64) rs2_rd_dff(.din (rs2_rd_data_next[63:0]), 
			                  .q   (rs2_rd_data[63:0]),
			                  .clk (clk), .se(se), .si(), .so());
   assign dp_vis_rs2_data[63:0] = rs2_rd_data[63:0];
   dff_s #(64) write_data_dff(.din(rs2_rd_data[63:0]),
                            .q(write_data[63:0]),
                            .clk(clk), .se(se), .si(), .so());
   
   ////////////////////////////////////////////////////////
   //			RS1
   ////////////////////////////////////////////////////////
   // RS1 next either takes value from frf or keeps value
   dp_mux2es #(64) rs1_mux(.dout (rs1_data_next[63:0]),
                           .in0  (rs1_data[63:0]),
                           .in1  (new_frf_data[63:0]),
                           .sel  (ctl_dp_new_rs1));
   
   dff_s #(64) rs1_dff(.din (rs1_data_next[63:0]), 
		                 .q   (rs1_data[63:0]),
		                 .clk (clk), .se(se), .si(), .so());
   assign dp_vis_rs1_data[63:0] = rs1_data[63:0];


   /////////////////////////////////////////////////////////
   //			FSR
   /////////////////////////////////////////////////////////
   // FSR takes data from load
   // fsr is set by ldfsr, ldxfsr, or any fpu operation
   assign t0_ldfsr_data[27:0] = {ctl_dp_fcc_w2[7:2],     // fcc3,2,1
			                           lsu_ffu_ld_data_d1[31:30],   // RND mode
			                           //2'b0,                     // rsvd
			                           lsu_ffu_ld_data_d1[27:23],   // TEM
			                           //6'b0,                     // NS, rsvd, ver
			                           t0_fsr[14:12],       // ftt
			                           //2'b0,                     // qne, rsvd
			                           lsu_ffu_ld_data_d1[11:0]};   // fcc0, aexc, cexc
   
   assign t0_fpufsr_data[27:0] = {ctl_dp_fcc_w2[7:2],
			                            t0_fsr[21:20],  // rnd
			                            t0_fsr[19:15],  // TEM
			                            ctl_dp_ftt_w2[2:0],  // ftt
			                            ctl_dp_fcc_w2[1:0],
			                            ctl_dp_exc_w2[9:0]};

   assign t1_ldfsr_data[27:0] = {ctl_dp_fcc_w2[7:2],     // fcc3,2,1
			                           lsu_ffu_ld_data_d1[31:30],   // RND mode
			                           //2'b0,                     // rsvd
			                           lsu_ffu_ld_data_d1[27:23],   // TEM
			                           //6'b0,                     // NS, rsvd, ver
			                           t1_fsr[14:12],       // ftt
			                           //2'b0,                     // qne, rsvd
			                           lsu_ffu_ld_data_d1[11:0]};   // fcc0, aexc, cexc
   
   assign t1_fpufsr_data[27:0] = {ctl_dp_fcc_w2[7:2],
			                            t1_fsr[21:20],  // rnd
			                            t1_fsr[19:15],  // TEM
			                            ctl_dp_ftt_w2[2:0],  // ftt
			                            ctl_dp_fcc_w2[1:0],
			                            ctl_dp_exc_w2[9:0]};

   assign t2_ldfsr_data[27:0] = {ctl_dp_fcc_w2[7:2],     // fcc3,2,1
			                           lsu_ffu_ld_data_d1[31:30],   // RND mode
			                           //2'b0,                     // rsvd
			                           lsu_ffu_ld_data_d1[27:23],   // TEM
			                           //6'b0,                     // NS, rsvd, ver
			                           t2_fsr[14:12],       // ftt
			                           //2'b0,                     // qne, rsvd
			                           lsu_ffu_ld_data_d1[11:0]};   // fcc0, aexc, cexc
   
   assign t2_fpufsr_data[27:0] = {ctl_dp_fcc_w2[7:2],
			                            t2_fsr[21:20],  // rnd
			                            t2_fsr[19:15],  // TEM
			                            ctl_dp_ftt_w2[2:0],  // ftt
			                            ctl_dp_fcc_w2[1:0],
			                            ctl_dp_exc_w2[9:0]};

   assign t3_ldfsr_data[27:0] = {ctl_dp_fcc_w2[7:2],     // fcc3,2,1
			                           lsu_ffu_ld_data_d1[31:30],   // RND mode
			                           //2'b0,                     // rsvd
			                           lsu_ffu_ld_data_d1[27:23],   // TEM
			                           //6'b0,                     // NS, rsvd, ver
			                           t3_fsr[14:12],       // ftt
			                           //2'b0,                     // qne, rsvd
			                           lsu_ffu_ld_data_d1[11:0]};   // fcc0, aexc, cexc
   
   assign t3_fpufsr_data[27:0] = {ctl_dp_fcc_w2[7:2],
			                            t3_fsr[21:20],  // rnd
			                            t3_fsr[19:15],  // TEM
			                            ctl_dp_ftt_w2[2:0],  // ftt
			                            ctl_dp_fcc_w2[1:0],
			                            ctl_dp_exc_w2[9:0]};

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t0_ldfsr_data[27:0]),
               .in2  (t0_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[0]),
               .sel1 (ctl_dp_fsr_sel_ld[0]),
               .sel2 (ctl_dp_fsr_sel_fpu[0]));
   mux3ds #(28) fsr1_mux(.dout (t1_fsr_nxt[27:0]),
               .in0  (t1_fsr[27:0]),
               .in1  (t1_ldfsr_data[27:0]),
               .in2  (t1_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[1]),
               .sel1 (ctl_dp_fsr_sel_ld[1]),
               .sel2 (ctl_dp_fsr_sel_fpu[1]));

   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
                         .q   (t0_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr1_reg(.din (t1_fsr_nxt[27:0]),
                         .q   (t1_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   // Current FSR
   mux2ds #(28) curr_fsr_mux(.dout (current_fsr[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t1_fsr[27:0]),
               .sel0 (ctl_dp_fp_thr[0]),
               .sel1 (ctl_dp_fp_thr[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   
   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
		       .in0  (t0_fsr[27:0]),
		       .in1  (t0_ldfsr_data[27:0]),
		       .in2  (t0_fpufsr_data[27:0]),
		       .sel0 (ctl_dp_fsr_sel_old[0]),
		       .sel1 (ctl_dp_fsr_sel_ld[0]),
		       .sel2 (ctl_dp_fsr_sel_fpu[0]));   
   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
		                 .q   (t0_fsr[27:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   assign current_fsr[27:0] = t0_fsr[27:0];
  
`elsif THREADS_1

   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t0_ldfsr_data[27:0]),
               .in2  (t0_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[0]),
               .sel1 (ctl_dp_fsr_sel_ld[0]),
               .sel2 (ctl_dp_fsr_sel_fpu[0]));
   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
                         .q   (t0_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   assign current_fsr[27:0] = t0_fsr[27:0];

`elsif THREADS_2

   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t0_ldfsr_data[27:0]),
               .in2  (t0_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[0]),
               .sel1 (ctl_dp_fsr_sel_ld[0]),
               .sel2 (ctl_dp_fsr_sel_fpu[0]));
   mux3ds #(28) fsr1_mux(.dout (t1_fsr_nxt[27:0]),
               .in0  (t1_fsr[27:0]),
               .in1  (t1_ldfsr_data[27:0]),
               .in2  (t1_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[1]),
               .sel1 (ctl_dp_fsr_sel_ld[1]),
               .sel2 (ctl_dp_fsr_sel_fpu[1]));

   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
                         .q   (t0_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr1_reg(.din (t1_fsr_nxt[27:0]),
                         .q   (t1_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   // Current FSR
   mux2ds #(28) curr_fsr_mux(.dout (current_fsr[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t1_fsr[27:0]),
               .sel0 (ctl_dp_fp_thr[0]),
               .sel1 (ctl_dp_fp_thr[1])); 
   
`elsif THREADS_3

   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t0_ldfsr_data[27:0]),
               .in2  (t0_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[0]),
               .sel1 (ctl_dp_fsr_sel_ld[0]),
               .sel2 (ctl_dp_fsr_sel_fpu[0]));
   mux3ds #(28) fsr1_mux(.dout (t1_fsr_nxt[27:0]),
               .in0  (t1_fsr[27:0]),
               .in1  (t1_ldfsr_data[27:0]),
               .in2  (t1_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[1]),
               .sel1 (ctl_dp_fsr_sel_ld[1]),
               .sel2 (ctl_dp_fsr_sel_fpu[1]));
   mux3ds #(28) fsr2_mux(.dout (t2_fsr_nxt[27:0]),
               .in0  (t2_fsr[27:0]),
               .in1  (t2_ldfsr_data[27:0]),
               .in2  (t2_fpufsr_data[27:0]),
               .sel0 (ctl_dp_fsr_sel_old[2]),
               .sel1 (ctl_dp_fsr_sel_ld[2]),
               .sel2 (ctl_dp_fsr_sel_fpu[2]));

   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
                         .q   (t0_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr1_reg(.din (t1_fsr_nxt[27:0]),
                         .q   (t1_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr2_reg(.din (t2_fsr_nxt[27:0]),
                         .q   (t2_fsr[27:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   // Current FSR
   mux3ds #(28) curr_fsr_mux(.dout (current_fsr[27:0]),
               .in0  (t0_fsr[27:0]),
               .in1  (t1_fsr[27:0]),
               .in2  (t2_fsr[27:0]),
               .sel0 (ctl_dp_fp_thr[0]),
               .sel1 (ctl_dp_fp_thr[1]),
               .sel2 (ctl_dp_fp_thr[2]));

`else
   
   mux3ds #(28) fsr0_mux(.dout (t0_fsr_nxt[27:0]),
		       .in0  (t0_fsr[27:0]),
		       .in1  (t0_ldfsr_data[27:0]),
		       .in2  (t0_fpufsr_data[27:0]),
		       .sel0 (ctl_dp_fsr_sel_old[0]),
		       .sel1 (ctl_dp_fsr_sel_ld[0]),
		       .sel2 (ctl_dp_fsr_sel_fpu[0]));
   mux3ds #(28) fsr1_mux(.dout (t1_fsr_nxt[27:0]),
		       .in0  (t1_fsr[27:0]),
		       .in1  (t1_ldfsr_data[27:0]),
		       .in2  (t1_fpufsr_data[27:0]),
		       .sel0 (ctl_dp_fsr_sel_old[1]),
		       .sel1 (ctl_dp_fsr_sel_ld[1]),
		       .sel2 (ctl_dp_fsr_sel_fpu[1]));
   mux3ds #(28) fsr2_mux(.dout (t2_fsr_nxt[27:0]),
		       .in0  (t2_fsr[27:0]),
		       .in1  (t2_ldfsr_data[27:0]),
		       .in2  (t2_fpufsr_data[27:0]),
		       .sel0 (ctl_dp_fsr_sel_old[2]),
		       .sel1 (ctl_dp_fsr_sel_ld[2]),
		       .sel2 (ctl_dp_fsr_sel_fpu[2]));
   mux3ds #(28) fsr3_mux(.dout (t3_fsr_nxt[27:0]),
		       .in0  (t3_fsr[27:0]),
		       .in1  (t3_ldfsr_data[27:0]),
		       .in2  (t3_fpufsr_data[27:0]),
		       .sel0 (ctl_dp_fsr_sel_old[3]),
		       .sel1 (ctl_dp_fsr_sel_ld[3]),
		       .sel2 (ctl_dp_fsr_sel_fpu[3]));
   
   // FSR registers
   // need only 28 flops for FSR since rest are always 0
   dffr_s #(28) fsr0_reg(.din (t0_fsr_nxt[27:0]),
		                 .q   (t0_fsr[27:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr1_reg(.din (t1_fsr_nxt[27:0]),
		                 .q   (t1_fsr[27:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr2_reg(.din (t2_fsr_nxt[27:0]),
		                 .q   (t2_fsr[27:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(28) fsr3_reg(.din (t3_fsr_nxt[27:0]),
		                 .q   (t3_fsr[27:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());

   // Current FSR
   mux4ds #(28) curr_fsr_mux(.dout (current_fsr[27:0]),
			   .in0  (t0_fsr[27:0]),
			   .in1  (t1_fsr[27:0]),
			   .in2  (t2_fsr[27:0]),
			   .in3  (t3_fsr[27:0]),
			   .sel0 (ctl_dp_fp_thr[0]),
			   .sel1 (ctl_dp_fp_thr[1]),
			   .sel2 (ctl_dp_fp_thr[2]),
			   .sel3 (ctl_dp_fp_thr[3]));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

   assign dp_ctl_fsr_fcc = {current_fsr[27:22], current_fsr[11:10]};
   assign dp_ctl_fsr_rnd = current_fsr[21:20];
   assign dp_ctl_fsr_tem = current_fsr[19:15];
   assign dp_ctl_fsr_aexc = current_fsr[9:5];
   assign dp_ctl_fsr_cexc = current_fsr[4:0];
   
   ////////////////////////////////////////////////////////////
   //		ECC generation and correction
   ////////////////////////////////////////////////////////////
   dp_mux2es #(64) ecc_mux(.dout(ecc_data_in[63:0]),
                           .in0(rs2_rd_data[63:0]),
                           .in1({frf_dp_data[70:39], frf_dp_data[31:0]}),
                           .sel(ctl_dp_ecc_sel_frf));

   assign     synd_in_low[6:0] = {7{ctl_dp_ecc_sel_frf}} & frf_dp_data[38:32];
   assign     synd_in_h[6:0] = {7{ctl_dp_ecc_sel_frf}} & frf_dp_data[77:71];
   
   zzecc_sctag_ecc39 ecccor_low(.din(ecc_data_in[31:0]),
                                .parity(synd_in_low[6:0]),
                                .dout(corr_data_next[31:0]),
                                .pflag(dp_ctl_synd_out_low[6]),
                                .cflag(dp_ctl_synd_out_low[5:0]));
   
   zzecc_sctag_ecc39 ecccor_high(.din(ecc_data_in[63:32]),
                                .parity(synd_in_h[6:0]),
                                .dout(corr_data_next[63:32]),
                                .pflag(dp_ctl_synd_out_high[6]),
                                .cflag(dp_ctl_synd_out_high[5:0]));

   
   dff_s #(64) ecc_corr_data(.din(corr_data_next[63:0]), .q(corr_data[63:0]),
                           .clk(clk), .se(se), .si(), .so());


   ////////////////////////////////////////////////
   // GSR Storage
   ////////////////////////////////////////////////
   // GSR registers
   // need only 37 flops for GSR since rest are always 0
   // and the align and rnd fields are in the ctl block
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
                         .q   (t0_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr1_reg(.din (t1_gsr_nxt[36:0]),
                         .q   (t1_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   dp_mux2es #(37) gsr0_mux(.dout(t0_gsr_nxt[36:0]),
                            .in0(t0_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[0]));
   dp_mux2es #(37) gsr1_mux(.dout(t1_gsr_nxt[36:0]),
                            .in0(t1_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[1]));

   // GSR_E
   mux2ds #(37) curr_gsr_mux(.dout (gsr_e[36:0]),
               .in0  (t0_gsr[36:0]),
               .in1  (t1_gsr[36:0]),
               .sel0 (ctl_dp_thr_e[0]),
               .sel1 (ctl_dp_thr_e[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
		                 .q   (t0_gsr[36:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   assign     t0_gsr_nxt[36:0] = t0_gsr[36:0];
   assign     gsr_e[36:0] = t0_gsr[36:0];
   
`elsif THREADS_1

   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
                         .q   (t0_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   assign     t0_gsr_nxt[36:0] = t0_gsr[36:0];
   assign     gsr_e[36:0] = t0_gsr[36:0];

`elsif THREADS_2

   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
                         .q   (t0_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr1_reg(.din (t1_gsr_nxt[36:0]),
                         .q   (t1_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   dp_mux2es #(37) gsr0_mux(.dout(t0_gsr_nxt[36:0]),
                            .in0(t0_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[0]));
   dp_mux2es #(37) gsr1_mux(.dout(t1_gsr_nxt[36:0]),
                            .in0(t1_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[1]));

   // GSR_E
   mux2ds #(37) curr_gsr_mux(.dout (gsr_e[36:0]),
               .in0  (t0_gsr[36:0]),
               .in1  (t1_gsr[36:0]),
               .sel0 (ctl_dp_thr_e[0]),
               .sel1 (ctl_dp_thr_e[1]));

`elsif THREADS_3

   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
                         .q   (t0_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr1_reg(.din (t1_gsr_nxt[36:0]),
                         .q   (t1_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr2_reg(.din (t2_gsr_nxt[36:0]),
                         .q   (t2_gsr[36:0]),
                     .rst(reset),
                         .clk (clk), .se(se), .si(), .so());

   dp_mux2es #(37) gsr0_mux(.dout(t0_gsr_nxt[36:0]),
                            .in0(t0_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[0]));
   dp_mux2es #(37) gsr1_mux(.dout(t1_gsr_nxt[36:0]),
                            .in0(t1_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[1]));
   dp_mux2es #(37) gsr2_mux(.dout(t2_gsr_nxt[36:0]),
                            .in0(t2_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[2]));

   // GSR_E
   mux3ds #(37) curr_gsr_mux(.dout (gsr_e[36:0]),
               .in0  (t0_gsr[36:0]),
               .in1  (t1_gsr[36:0]),
               .in2  (t2_gsr[36:0]),
               .sel0 (ctl_dp_thr_e[0]),
               .sel1 (ctl_dp_thr_e[1]),
               .sel2 (ctl_dp_thr_e[2]));

`else
   
   dffr_s #(37) gsr0_reg(.din (t0_gsr_nxt[36:0]),
		                 .q   (t0_gsr[36:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr1_reg(.din (t1_gsr_nxt[36:0]),
		                 .q   (t1_gsr[36:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr2_reg(.din (t2_gsr_nxt[36:0]),
		                 .q   (t2_gsr[36:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());
   dffr_s #(37) gsr3_reg(.din (t3_gsr_nxt[36:0]),
		                 .q   (t3_gsr[36:0]),
                     .rst(reset),
		                 .clk (clk), .se(se), .si(), .so());

   dp_mux2es #(37) gsr0_mux(.dout(t0_gsr_nxt[36:0]),
                            .in0(t0_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[0]));
   dp_mux2es #(37) gsr1_mux(.dout(t1_gsr_nxt[36:0]),
                            .in0(t1_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[1]));
   dp_mux2es #(37) gsr2_mux(.dout(t2_gsr_nxt[36:0]),
                            .in0(t2_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[2]));
   dp_mux2es #(37) gsr3_mux(.dout(t3_gsr_nxt[36:0]),
                            .in0(t3_gsr[36:0]),
                            .in1(ctl_dp_wsr_data_w2[36:0]),
                            .sel(ctl_dp_gsr_wsr_w2[3]));
   
   
   // GSR_E
   mux4ds #(37) curr_gsr_mux(.dout (gsr_e[36:0]),
			   .in0  (t0_gsr[36:0]),
			   .in1  (t1_gsr[36:0]),
			   .in2  (t2_gsr[36:0]),
			   .in3  (t3_gsr[36:0]),
			   .sel0 (ctl_dp_thr_e[0]),
			   .sel1 (ctl_dp_thr_e[1]),
			   .sel2 (ctl_dp_thr_e[2]),
			   .sel3 (ctl_dp_thr_e[3]));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS
   
   assign     dp_ctl_gsr_scale_e[4:0] = gsr_e[4:0];
   assign     dp_ctl_gsr_mask_e[31:0] = gsr_e[36:5];

   
   

endmodule // sparc_ffu_dp
