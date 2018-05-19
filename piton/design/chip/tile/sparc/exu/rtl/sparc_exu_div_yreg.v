// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_div_yreg.v
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
//  Module Name: sparc_exu_div_yreg
//	Description: The 4 32 bit y registers.  It can be written to
// 		twice each cycle because by definition the writes must come
//		from different threads.  There is no bypassing because wry switches out.
*/
`include "sys.h"

module sparc_exu_div_yreg (/*AUTOARG*/
   // Outputs
   yreg_mdq_y_e, div_ecl_yreg_0_l, 
   // Inputs
   clk, se, byp_div_yreg_data_w, mul_div_yreg_data_g, ecl_div_thr_e, 
   ecl_div_yreg_wen_w, ecl_div_yreg_wen_g, ecl_div_yreg_wen_l, 
   ecl_div_yreg_data_31_g, ecl_div_yreg_shift_g
   ) ;
   input clk;
   input se;
   input [31:0] byp_div_yreg_data_w;
   input [31:0] mul_div_yreg_data_g;
   input [3:0]  ecl_div_thr_e;
   input [3:0]  ecl_div_yreg_wen_w;
   input [3:0]  ecl_div_yreg_wen_g;
   input [3:0]  ecl_div_yreg_wen_l;// w or w2
   input        ecl_div_yreg_data_31_g;// bit shifted in on muls
   input [3:0]  ecl_div_yreg_shift_g;// yreg should be shifted
   
   output [31:0] yreg_mdq_y_e;
   output [3:0]  div_ecl_yreg_0_l;

   wire [31:0]   next_yreg_thr0;// next value for yreg
   wire [31:0]   next_yreg_thr1;
   wire [31:0]   next_yreg_thr2;
   wire [31:0]   next_yreg_thr3;
   wire [31:0]   yreg_thr0;     // current value of yreg
   wire [31:0]   yreg_thr1;
   wire [31:0]   yreg_thr2;
   wire [31:0]   yreg_thr3;
   wire [3:0]    div_ecl_yreg_0;
   wire [31:0]   yreg_data_w1;


   //////////////////////////////////
   //  Output selection for yreg
   //////////////////////////////////
   // output the LSB of all 4 regs
   assign        div_ecl_yreg_0[3:0] = {yreg_thr3[0],yreg_thr2[0],yreg_thr1[0],yreg_thr0[0]};
   assign        div_ecl_yreg_0_l[3:0] = ~div_ecl_yreg_0[3:0];

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   // mux between the 2 yregs
   mux2ds #(32) mux_yreg_out(.dout(yreg_mdq_y_e[31:0]), .sel0(ecl_div_thr_e[0]),
                         .sel1(ecl_div_thr_e[1]), .in0(yreg_thr0[31:0]),
                         .in1(yreg_thr1[31:0])); 

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

   assign 	 yreg_mdq_y_e[31:0] = yreg_thr0[31:0];

`elsif THREADS_1

   assign    yreg_mdq_y_e[31:0] = yreg_thr0[31:0];

`elsif THREADS_2

   // mux between the 2 yregs
   mux2ds #(32) mux_yreg_out(.dout(yreg_mdq_y_e[31:0]), .sel0(ecl_div_thr_e[0]),
                         .sel1(ecl_div_thr_e[1]), .in0(yreg_thr0[31:0]),
                         .in1(yreg_thr1[31:0]));  

`elsif THREADS_3

   // mux between the 3 yregs
   mux3ds #(32) mux_yreg_out(.dout(yreg_mdq_y_e[31:0]), .sel0(ecl_div_thr_e[0]),
                         .sel1(ecl_div_thr_e[1]), .sel2(ecl_div_thr_e[2]),
                         .in0(yreg_thr0[31:0]), .in1(yreg_thr1[31:0]), 
                         .in2(yreg_thr2[31:0]));

`else
   
   // mux between the 4 yregs
   mux4ds #(32) mux_yreg_out(.dout(yreg_mdq_y_e[31:0]), .sel0(ecl_div_thr_e[0]),
                         .sel1(ecl_div_thr_e[1]), .sel2(ecl_div_thr_e[2]),
                         .sel3(ecl_div_thr_e[3]), .in0(yreg_thr0[31:0]),
                         .in1(yreg_thr1[31:0]), .in2(yreg_thr2[31:0]),
                         .in3(yreg_thr3[31:0]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS
   
   //////////////////////////////////////
   //  Storage of yreg
   //////////////////////////////////////
   // pass along yreg w to w2 (for control signal timing)
   dff_s #(32) yreg_dff_w2w2(.din(byp_div_yreg_data_w[31:0]), .clk(clk), .q(yreg_data_w1[31:0]),
                           .se(se), .si(), .so());


   // mux between yreg_w, yreg_g, old value
   mux4ds #(32) mux_yregin0(.dout(next_yreg_thr0[31:0]), 
                          .sel0(ecl_div_yreg_wen_w[0]),
                          .sel1(ecl_div_yreg_wen_g[0]), 
                          .sel2(ecl_div_yreg_wen_l[0]),
                          .sel3(ecl_div_yreg_shift_g[0]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]), 
                          .in2(yreg_thr0[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr0[31:1]}));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   mux4ds #(32) mux_yregin1(.dout(next_yreg_thr1[31:0]),
                          .sel0(ecl_div_yreg_wen_w[1]),
                          .sel1(ecl_div_yreg_wen_g[1]),
                          .sel2(ecl_div_yreg_wen_l[1]),
                          .sel3(ecl_div_yreg_shift_g[1]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]),
                          .in2(yreg_thr1[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr1[31:1]}));
   assign    next_yreg_thr2[31:0] = yreg_data_w1[31:0];
   assign    next_yreg_thr3[31:0] = yreg_data_w1[31:0];

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign 	 next_yreg_thr1[31:0] = yreg_data_w1[31:0];
   assign 	 next_yreg_thr2[31:0] = yreg_data_w1[31:0];
   assign 	 next_yreg_thr3[31:0] = yreg_data_w1[31:0];

`elsif THREADS_1

   assign    next_yreg_thr1[31:0] = yreg_data_w1[31:0];
   assign    next_yreg_thr2[31:0] = yreg_data_w1[31:0];
   assign    next_yreg_thr3[31:0] = yreg_data_w1[31:0];

`elsif THREADS_2

   mux4ds #(32) mux_yregin1(.dout(next_yreg_thr1[31:0]),
                          .sel0(ecl_div_yreg_wen_w[1]),
                          .sel1(ecl_div_yreg_wen_g[1]),
                          .sel2(ecl_div_yreg_wen_l[1]),
                          .sel3(ecl_div_yreg_shift_g[1]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]),
                          .in2(yreg_thr1[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr1[31:1]}));
   assign    next_yreg_thr2[31:0] = yreg_data_w1[31:0];
   assign    next_yreg_thr3[31:0] = yreg_data_w1[31:0];

`elsif THREADS_3

   mux4ds #(32) mux_yregin1(.dout(next_yreg_thr1[31:0]),
                          .sel0(ecl_div_yreg_wen_w[1]),
                          .sel1(ecl_div_yreg_wen_g[1]),
                          .sel2(ecl_div_yreg_wen_l[1]),
                          .sel3(ecl_div_yreg_shift_g[1]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]),
                          .in2(yreg_thr1[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr1[31:1]}));
   mux4ds #(32) mux_yregin2(.dout(next_yreg_thr2[31:0]),
                          .sel0(ecl_div_yreg_wen_w[2]),
                          .sel1(ecl_div_yreg_wen_g[2]),
                          .sel2(ecl_div_yreg_wen_l[2]),
                          .sel3(ecl_div_yreg_shift_g[2]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]),
                          .in2(yreg_thr2[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr2[31:1]}));
    assign    next_yreg_thr3[31:0] = yreg_data_w1[31:0];


 
`else
   
   mux4ds #(32) mux_yregin1(.dout(next_yreg_thr1[31:0]), 
                          .sel0(ecl_div_yreg_wen_w[1]),
                          .sel1(ecl_div_yreg_wen_g[1]), 
                          .sel2(ecl_div_yreg_wen_l[1]),
                          .sel3(ecl_div_yreg_shift_g[1]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]), 
                          .in2(yreg_thr1[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr1[31:1]}));
   mux4ds #(32) mux_yregin2(.dout(next_yreg_thr2[31:0]), 
                          .sel0(ecl_div_yreg_wen_w[2]),
                          .sel1(ecl_div_yreg_wen_g[2]), 
                          .sel2(ecl_div_yreg_wen_l[2]),
                          .sel3(ecl_div_yreg_shift_g[2]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]), 
                          .in2(yreg_thr2[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr2[31:1]}));
   mux4ds #(32) mux_yregin3(.dout(next_yreg_thr3[31:0]), 
                          .sel0(ecl_div_yreg_wen_w[3]),
                          .sel1(ecl_div_yreg_wen_g[3]), 
                          .sel2(ecl_div_yreg_wen_l[3]),
                          .sel3(ecl_div_yreg_shift_g[3]),
                          .in0(yreg_data_w1[31:0]),
                          .in1(mul_div_yreg_data_g[31:0]), 
                          .in2(yreg_thr3[31:0]),
                          .in3({ecl_div_yreg_data_31_g, yreg_thr3[31:1]}));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS
   
   // store new value
   dff_s #(32) dff_yreg_thr0(.din(next_yreg_thr0[31:0]), .clk(clk), .q(yreg_thr0[31:0]),
                       .se(se), .si(), .so());
   dff_s #(32) dff_yreg_thr1(.din(next_yreg_thr1[31:0]), .clk(clk), .q(yreg_thr1[31:0]),
                       .se(se), .si(), .so());
   dff_s #(32) dff_yreg_thr2(.din(next_yreg_thr2[31:0]), .clk(clk), .q(yreg_thr2[31:0]),
                       .se(se), .si(), .so());
   dff_s #(32) dff_yreg_thr3(.din(next_yreg_thr3[31:0]), .clk(clk), .q(yreg_thr3[31:0]),
                       .se(se), .si(), .so());
   
   
endmodule // sparc_exu_div_yreg
