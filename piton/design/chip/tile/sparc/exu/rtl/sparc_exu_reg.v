// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_reg.v
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
`include "sys.h"

module sparc_exu_reg (/*AUTOARG*/
   // Outputs
   data_out, 
   // Inputs
   clk, se, thr_out, wen_w, thr_w, data_in_w
   ) ;
   parameter SIZE = 3;

   input     clk;
   input     se;
   input [3:0]       thr_out;
   input             wen_w;
   input [3:0]       thr_w;
   input [SIZE -1:0] data_in_w;

   output [SIZE-1:0] data_out;

   wire [SIZE-1:0]   data_thr0;
   wire [SIZE-1:0]   data_thr1;
   wire [SIZE-1:0]   data_thr2;
   wire [SIZE-1:0]   data_thr3;
   wire [SIZE-1:0]   data_thr0_next;
   wire [SIZE-1:0]   data_thr1_next;
   wire [SIZE-1:0]   data_thr2_next;
   wire [SIZE-1:0]   data_thr3_next;

   wire          wen_thr0_w;
   wire          wen_thr1_w;
   wire          wen_thr2_w;
   wire          wen_thr3_w;

   //////////////////////////////////
   //  Output selection for reg
   //////////////////////////////////

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   // mux between the 2 regs
   mux2ds #(SIZE) mux_data_out1(.dout(data_out[SIZE -1:0]), .sel0(thr_out[0]),
                               .sel1(thr_out[1]), .in0(data_thr0[SIZE -1:0]),
                               .in1(data_thr1[SIZE -1:0]));
   //////////////////////////////////////
   //  Storage of reg
   //////////////////////////////////////
   // enable input for each thread
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   assign        wen_thr1_w = (thr_w[1] & wen_w);

   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));
   mux2ds #(SIZE) data_next1_mux(.dout(data_thr1_next[SIZE -1:0]),
                               .in0(data_thr1[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr1_w),
                               .sel1(wen_thr1_w));

   // store new value
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr1(.din(data_thr1_next[SIZE -1:0]), .clk(clk), .q(data_thr1[SIZE -1:0]),
                       .se(se), .si(), .so());

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign 	 data_out[SIZE -1:0] = data_thr0[SIZE -1:0];
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));   
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());

`elsif THREADS_1

   assign    data_out[SIZE -1:0] = data_thr0[SIZE -1:0];
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());

`elsif THREADS_2

   // mux between the 2 regs
   mux2ds #(SIZE) mux_data_out1(.dout(data_out[SIZE -1:0]), .sel0(thr_out[0]),
                               .sel1(thr_out[1]), .in0(data_thr0[SIZE -1:0]),
                               .in1(data_thr1[SIZE -1:0]));
   //////////////////////////////////////
   //  Storage of reg
   //////////////////////////////////////
   // enable input for each thread
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   assign        wen_thr1_w = (thr_w[1] & wen_w);

   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));
   mux2ds #(SIZE) data_next1_mux(.dout(data_thr1_next[SIZE -1:0]),
                               .in0(data_thr1[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr1_w),
                               .sel1(wen_thr1_w));

   // store new value
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr1(.din(data_thr1_next[SIZE -1:0]), .clk(clk), .q(data_thr1[SIZE -1:0]),
                       .se(se), .si(), .so());

`elsif THREADS_3

   // mux between the 3 regs
   mux3ds #(SIZE) mux_data_out1(.dout(data_out[SIZE -1:0]), .sel0(thr_out[0]),
                               .sel1(thr_out[1]), .sel2(thr_out[2]),
                               .in0(data_thr0[SIZE -1:0]), .in1(data_thr1[SIZE -1:0]),
                               .in2(data_thr2[SIZE -1:0]));

   //////////////////////////////////////
   //  Storage of reg
   //////////////////////////////////////
   // enable input for each thread
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   assign        wen_thr1_w = (thr_w[1] & wen_w);
   assign        wen_thr2_w = (thr_w[2] & wen_w);

   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));
   mux2ds #(SIZE) data_next1_mux(.dout(data_thr1_next[SIZE -1:0]),
                               .in0(data_thr1[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr1_w),
                               .sel1(wen_thr1_w));
   mux2ds #(SIZE) data_next2_mux(.dout(data_thr2_next[SIZE -1:0]),
                               .in0(data_thr2[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr2_w),
                               .sel1(wen_thr2_w));

   // store new value
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr1(.din(data_thr1_next[SIZE -1:0]), .clk(clk), .q(data_thr1[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr2(.din(data_thr2_next[SIZE -1:0]), .clk(clk), .q(data_thr2[SIZE -1:0]),
                       .se(se), .si(), .so());

`else // !`ifdef FPGA_SYN_1THREAD

   // mux between the 4 regs
   mux4ds #(SIZE) mux_data_out1(.dout(data_out[SIZE -1:0]), .sel0(thr_out[0]),
                               .sel1(thr_out[1]), .sel2(thr_out[2]),
                               .sel3(thr_out[3]), .in0(data_thr0[SIZE -1:0]),
                               .in1(data_thr1[SIZE -1:0]), .in2(data_thr2[SIZE -1:0]),
                               .in3(data_thr3[SIZE -1:0]));
   
   //////////////////////////////////////
   //  Storage of reg
   //////////////////////////////////////
   // enable input for each thread
   assign        wen_thr0_w = (thr_w[0] & wen_w);
   assign        wen_thr1_w = (thr_w[1] & wen_w);
   assign        wen_thr2_w = (thr_w[2] & wen_w);
   assign        wen_thr3_w = (thr_w[3] & wen_w);

   // mux between new and current value
   mux2ds #(SIZE) data_next0_mux(.dout(data_thr0_next[SIZE -1:0]),
                               .in0(data_thr0[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr0_w),
                               .sel1(wen_thr0_w));
   mux2ds #(SIZE) data_next1_mux(.dout(data_thr1_next[SIZE -1:0]),
                               .in0(data_thr1[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr1_w),
                               .sel1(wen_thr1_w));
   mux2ds #(SIZE) data_next2_mux(.dout(data_thr2_next[SIZE -1:0]),
                               .in0(data_thr2[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr2_w),
                               .sel1(wen_thr2_w));
   mux2ds #(SIZE) data_next3_mux(.dout(data_thr3_next[SIZE -1:0]),
                               .in0(data_thr3[SIZE -1:0]),
                               .in1(data_in_w[SIZE -1:0]),
                               .sel0(~wen_thr3_w),
                               .sel1(wen_thr3_w));

   // store new value
   dff_s #(SIZE) dff_reg_thr0(.din(data_thr0_next[SIZE -1:0]), .clk(clk), .q(data_thr0[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr1(.din(data_thr1_next[SIZE -1:0]), .clk(clk), .q(data_thr1[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr2(.din(data_thr2_next[SIZE -1:0]), .clk(clk), .q(data_thr2[SIZE -1:0]),
                       .se(se), .si(), .so());
   dff_s #(SIZE) dff_reg_thr3(.din(data_thr3_next[SIZE -1:0]), .clk(clk), .q(data_thr3[SIZE -1:0]),
                       .se(se), .si(), .so());
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS
   
endmodule // sparc_exu_reg
