// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_div.v
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
//  Module Name: sparc_exu_div
*/
module sparc_exu_div (/*AUTOARG*/
   // Outputs
   so, div_ecl_xin_msb_l, div_ecl_x_msb, div_ecl_d_msb, 
   div_ecl_cout64, div_ecl_cout32, div_ecl_gencc_in_msb_l, 
   div_ecl_gencc_in_31, div_ecl_upper32_equal, div_ecl_low32_nonzero, 
   div_ecl_dividend_msb, div_byp_muldivout_g, div_byp_yreg_e, 
   div_ecl_yreg_0_l, exu_mul_rs1_data, exu_mul_rs2_data, 
   div_ecl_adder_out_31, div_ecl_detect_zero_low, 
   div_ecl_detect_zero_high, div_ecl_d_62, 
   // Inputs
   ecl_div_yreg_wen_w, ecl_div_yreg_wen_l, ecl_div_yreg_wen_g, 
   ecl_div_yreg_shift_g, ecl_div_yreg_data_31_g, ecl_div_thr_e, 
   byp_div_yreg_data_w, rclk, se, si, ecl_div_keep_d, 
   ecl_div_ld_inputs, ecl_div_sel_adder, ecl_div_last_cycle, 
   ecl_div_almostlast_cycle, ecl_div_div64, ecl_div_sel_u32, 
   ecl_div_sel_pos32, ecl_div_sel_neg32, ecl_div_sel_64b, 
   ecl_div_upper32_zero, ecl_div_upper33_one, ecl_div_upper33_zero, 
   mul_exu_data_g, ecl_div_sel_div, ecl_div_mul_wen, 
   ecl_div_dividend_sign, ecl_div_subtract_l, ecl_div_cin, 
   ecl_div_newq, ecl_div_xinmask, ecl_div_keepx, 
   ecl_div_mul_get_new_data, ecl_div_mul_keep_data, 
   ecl_div_mul_get_32bit_data, ecl_div_mul_sext_rs2_e, 
   ecl_div_mul_sext_rs1_e, byp_div_rs1_data_e, byp_div_rs2_data_e, 
   ecl_div_muls_rs1_31_e_l, ecl_div_muls, ecl_div_zero_rs2_e
   ) ;
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input [31:0]         byp_div_yreg_data_w;    // To yreg of sparc_exu_div_yreg.v
   input [3:0]          ecl_div_thr_e;          // To yreg of sparc_exu_div_yreg.v
   input                ecl_div_yreg_data_31_g; // To yreg of sparc_exu_div_yreg.v
   input [3:0]          ecl_div_yreg_shift_g;   // To yreg of sparc_exu_div_yreg.v
   input [3:0]          ecl_div_yreg_wen_g;     // To yreg of sparc_exu_div_yreg.v
   input [3:0]          ecl_div_yreg_wen_l;     // To yreg of sparc_exu_div_yreg.v
   input [3:0]          ecl_div_yreg_wen_w;     // To yreg of sparc_exu_div_yreg.v
   // End of automatics
   input rclk;
   input se;
   input si;
   input        ecl_div_keep_d; // d should store (w/ overflow calcs)
   input        ecl_div_ld_inputs;// load in d and x
   input        ecl_div_sel_adder;// d should use adder output
   input        ecl_div_last_cycle;// last cycle of computations
   input         ecl_div_almostlast_cycle;// 2nd to last cycle of div
   input   ecl_div_div64;
   input         ecl_div_sel_u32;
   input         ecl_div_sel_pos32;
   input         ecl_div_sel_neg32;
   input         ecl_div_sel_64b;
   input         ecl_div_upper32_zero;
   input         ecl_div_upper33_one;
   input         ecl_div_upper33_zero;
   input [63:0]  mul_exu_data_g;
   input         ecl_div_sel_div;
   input         ecl_div_mul_wen;
   input         ecl_div_dividend_sign;
   input         ecl_div_subtract_l;     // add/subtract to adder
   input         ecl_div_cin;
   input  ecl_div_newq;         // newest q bit
   input         ecl_div_xinmask;
   input  ecl_div_keepx;
   input         ecl_div_mul_get_new_data;
   input         ecl_div_mul_keep_data;
   input         ecl_div_mul_get_32bit_data;
   input         ecl_div_mul_sext_rs2_e;
   input         ecl_div_mul_sext_rs1_e;
   input [63:0]  byp_div_rs1_data_e;
   input [63:0]  byp_div_rs2_data_e;
   input         ecl_div_muls_rs1_31_e_l;
   input         ecl_div_muls;
   input         ecl_div_zero_rs2_e;
   
   output        so;
   output div_ecl_xin_msb_l;
   output div_ecl_x_msb;
   output div_ecl_d_msb;
   output div_ecl_cout64;       // cout from adder
   output div_ecl_cout32;       // cout from adder
   output        div_ecl_gencc_in_msb_l;
   output        div_ecl_gencc_in_31;
   output        div_ecl_upper32_equal;
   output        div_ecl_low32_nonzero;
   output        div_ecl_dividend_msb;
   output [63:0] div_byp_muldivout_g;
   output [31:0] div_byp_yreg_e;
   output [3:0]  div_ecl_yreg_0_l;
   output [63:0]          exu_mul_rs1_data; 
   output [63:0]          exu_mul_rs2_data;
   output                 div_ecl_adder_out_31; 
   output        div_ecl_detect_zero_low;
   output        div_ecl_detect_zero_high;
   output        div_ecl_d_62;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [31:0]          yreg_mdq_y_e;           // From yreg of sparc_exu_div_yreg.v
   // End of automatics
   wire                 clk;
   wire [127:0]  din;           // sign extended dividend
   wire [127:0]  d;             // current dividend/quotient
   wire [63:0]   adder_out;     // output of adder
   wire [127:0]  dnext;         // input to d flop
   wire [127:0]  adder_dnext;   // combination of adder out and quotient
   wire [63:0]   x;             // divisor
   wire [63:0]   xin;           // sign extended (for 32bit) divisor
   wire [63:0]   xnext;         // input to divisor flop
   wire [63:0]   adderin1;      // first input to adder
   wire [63:0]   adderin2;      // 2nd input to adder
   
   wire [63:0]   curr_q;        // current quotient
   wire [63:0]   out64;         // 64 bit result
   wire [63:0]   pos32;         // positive 32 bit result w/ ovfl
   wire [63:0]   neg32;         // negative 32 bit result w/ ovfl
   wire [63:0]   u32;           // unsigned 32 bit result w/ ovfl
   wire [63:0]   gencc_in;
   wire [63:0]   mul_result;
   wire [63:0]   mul_result_next;
   wire [127:0]  input_data_e;
   wire [63:0]   dividend;
   wire [63:0]   divisor;
   wire [127:0]  next_mul_data;
   wire [127:0]  mul_data_out;
   wire [127:0]  mul32_input_data_e;
   wire          subtract;
   wire [63:0]   spr_out;
   wire [63:0]   z_in;

   assign        clk = rclk;
   ///////////////////////////////////////
   // Input masking for 32 bit operations
   ///////////////////////////////////////
   dp_buffer #(128) buf_input_data(.dout(input_data_e[127:0]), 
                                   .in({byp_div_rs2_data_e[63:0], byp_div_rs1_data_e[63:0]}));
   // Mux in yreg into upper 32 bits on 32 bit divides
   dp_mux2es #(32) dividendmux(.dout(dividend[63:32]),
                             .in0(yreg_mdq_y_e[31:0]),
                             .in1(input_data_e[63:32]),
                             .sel(ecl_div_div64));
   assign        dividend[31:0] = input_data_e[31:0];
   assign        divisor[63:0] = input_data_e[127:64];

   
   /////////////////////
   // Output assignment
   /////////////////////
   dp_mux2es #(64) output_mux(.dout(div_byp_muldivout_g[63:0]), .in1(d[63:0]),
                         .in0(mul_result[63:0]),
                         .sel(ecl_div_sel_div));
   ///////////////////////////
   // Generate Condition Codes and divide by zero exception and overflow
   ///////////////////////////
   dp_mux2es #(64) gencc_mux(.dout(gencc_in[63:0]), 
                          .in0(mul_result[63:0]),
                          .in1(curr_q[63:0]),
                          .sel(ecl_div_sel_div));
   sparc_exu_div_32eql u32eql(.in(gencc_in[63:32]), .equal(div_ecl_upper32_equal));
   sparc_exu_aluor32 low32or(// Outputs
                             .out  (div_ecl_low32_nonzero),
                             // Inputs
                             .in    (gencc_in[31:0]));  
   assign        div_ecl_gencc_in_msb_l = ~gencc_in[63];
   assign        div_ecl_gencc_in_31 = gencc_in[31];
   
   
   // Division overflow calculations
   assign        curr_q = d[127:64];
   assign        u32 = {32'b0, (curr_q[31:0] | {32{~ecl_div_upper32_zero}})}; 
   assign        pos32 = {33'b0, (curr_q[30:0] | {31{~ecl_div_upper33_zero}})}; 
   assign        neg32 = {{33{1'b1}}, (curr_q[30:0] & {31{ecl_div_upper33_one}})}; 
   
   mux4ds #(64) result_mux(.dout(out64[63:0]), .in0(curr_q[63:0]), .in1(u32[63:0]),
                         .in2(pos32[63:0]), .in3(neg32[63:0]), .sel0(ecl_div_sel_64b),
                         .sel1(ecl_div_sel_u32), .sel2(ecl_div_sel_pos32),
                         .sel3(ecl_div_sel_neg32));
   
   //////////////////////////
   // Logic for D (dividend)
   //////////////////////////
   
   // If signed div sign extend dividend to 127 bits
   assign        div_ecl_dividend_msb = dividend[63];
   assign        din[62:0] = dividend[62:0];
   dp_mux2es #(32) din_mux(.dout(din[94:63]),
                           .in0({{31{ecl_div_dividend_sign}}, dividend[63]}),
                           .in1({~ecl_div_muls_rs1_31_e_l, dividend[31:1]}),
                           .sel(ecl_div_muls));
   assign        din[127:95] = {33{ecl_div_dividend_sign}};
//   assign        din = {{64{ecl_div_dividend_sign}}, dividend[63:0]};


   // Select input to FF for d
   mux3ds #(128) d_mux(.dout(dnext[127:0]), .in0({d[127:64], out64[63:0]}),
                     .in1(adder_dnext[127:0]), .in2(din[127:0]),
                     .sel0(ecl_div_keep_d),
                     .sel1(ecl_div_sel_adder),
                     .sel2(ecl_div_ld_inputs));
   assign        div_ecl_d_62 = d[62];

   // FF for d
   dff_s #(128) d_dff(.din(dnext[127:0]), .clk(clk), .q(d[127:0]), .se(se), .si(), .so());

   ////////////////////////////
   // Logic for X (divisor)
   ////////////////////////////
   // if signed div and 32 bits sign extend to upper 32 bits
   dp_mux2es #(32) xin_mux(.dout(xin[63:32]), .in1(divisor[63:32]),
                      .in0({32{ecl_div_xinmask}}),
                      .sel(ecl_div_div64));
   assign        xin[31:0] = divisor[31:0] & {32{~ecl_div_zero_rs2_e}};
   //assign xin[31:0] = divisor[31:0];

   // Pick between x and divisor and 1 (use divisor on first cycle, 1 last cycle)
   mux3ds #(64) x_mux(.dout(xnext[63:0]), .in0(x[63:0]), .in1(xin[63:0]), .in2({64'b0}),
                    .sel0(ecl_div_keepx),
                    .sel1(ecl_div_ld_inputs),
                    .sel2(ecl_div_almostlast_cycle));

   // FF for x
   dff_s #(64) x_dff(.din(xnext[63:0]), .clk(clk), .q(x[63:0]), .se(se), .si(), .so());


   ///////////////////////////
   // Logic for inputs to adder
   //////////////////////////
   assign div_ecl_xin_msb_l = ~xin[63];
   assign div_ecl_x_msb = x[63];
   assign div_ecl_d_msb = d[127];
   dp_mux2es #(64) in1_mux(.dout(adderin1[63:0]), .in0(d[126:63]),
                      .in1({d[62:0], ecl_div_newq}), .sel(ecl_div_last_cycle));

   assign subtract = ~ecl_div_subtract_l;
   assign        adderin2[63:0] = x[63:0] ^ {64{subtract}};

   //////////////////////////
   //  Adder
   /////////////////////////
   sparc_exu_aluadder64 add64(// Outputs
                              .adder_out(adder_out[63:0]),
                              .cout32   (div_ecl_cout32),
                              .cout64   (div_ecl_cout64),
                              // Inputs
                              .rs1_data (adderin1[63:0]),
                              .rs2_data (adderin2[63:0]),
                              .cin      (ecl_div_cin));

   assign        adder_dnext = {adder_out[63:0], d[62:0], ecl_div_newq};
   assign        div_ecl_adder_out_31 = adder_out[31];

   // sum predict and zero detection
   sparc_exu_aluspr spr(.rs1_data(adderin1[63:0]), .rs2_data(adderin2[63:0]), .cin(ecl_div_cin),
                        .spr_out(spr_out[63:0]));   
   dp_mux2es #(64) zero_detect_mux(.dout(z_in[63:0]),
                                   .in0(spr_out[63:0]),
                                   .in1(xin[63:0]),
                                   .sel(ecl_div_ld_inputs));
   //sparc_exu_aluzcmp64 regzcmp(.in(z_in[63:0]), .zero64(div_ecl_detect_zero));
   assign        div_ecl_detect_zero_low = ~(|z_in[31:0]);
   assign        div_ecl_detect_zero_high = ~(|z_in[63:32]);
   

   // y register
   assign        div_byp_yreg_e = yreg_mdq_y_e;
   sparc_exu_div_yreg yreg(.mul_div_yreg_data_g(mul_exu_data_g[63:32]),
                           /*AUTOINST*/
                           // Outputs
                           .yreg_mdq_y_e(yreg_mdq_y_e[31:0]),
                           .div_ecl_yreg_0_l(div_ecl_yreg_0_l[3:0]),
                           // Inputs
                           .clk         (clk),
                           .se          (se),
                           .byp_div_yreg_data_w(byp_div_yreg_data_w[31:0]),
                           .ecl_div_thr_e(ecl_div_thr_e[3:0]),
                           .ecl_div_yreg_wen_w(ecl_div_yreg_wen_w[3:0]),
                           .ecl_div_yreg_wen_g(ecl_div_yreg_wen_g[3:0]),
                           .ecl_div_yreg_wen_l(ecl_div_yreg_wen_l[3:0]),
                           .ecl_div_yreg_data_31_g(ecl_div_yreg_data_31_g),
                           .ecl_div_yreg_shift_g(ecl_div_yreg_shift_g[3:0]));
   
   
   //////////////////////////////////
   // MULTIPLIER inputs
   //////////////////////////////////                  
   assign        mul32_input_data_e[127:64] = {{32{ecl_div_mul_sext_rs2_e}}, input_data_e[95:64]};
   assign        mul32_input_data_e[63:0] = {{32{ecl_div_mul_sext_rs1_e}}, input_data_e[31:0]};
   mux3ds #(128) mul_data_mux(.dout(next_mul_data[127:0]),
                              .in0(input_data_e[127:0]),
                              .in1(mul32_input_data_e[127:0]),
                              .in2(mul_data_out[127:0]),
                              .sel0(ecl_div_mul_get_new_data),
                              .sel1(ecl_div_mul_get_32bit_data),
                              .sel2(ecl_div_mul_keep_data));
   dff_s #(128) mul_data_dff(.din(next_mul_data[127:0]), .clk(clk), .q(mul_data_out[127:0]),
                           .se(se), .si(), .so());
   assign        exu_mul_rs1_data = mul_data_out[63:0];
   assign        exu_mul_rs2_data = mul_data_out[127:64];

   ///////////////////////////////////
   // Store output from mul
   //////////////////////////////////
   dp_mux2es #(64) mul_result_mux(.dout(mul_result_next[63:0]), .in0(mul_result[63:0]),
                           .in1(mul_exu_data_g[63:0]),
                           .sel(ecl_div_mul_wen));
   dff_s #(64) mul_result_dff(.din(mul_result_next[63:0]), .clk(clk), .q(mul_result[63:0]),
                        .se(se), .si(), .so());

   
endmodule // sparc_exu_div
