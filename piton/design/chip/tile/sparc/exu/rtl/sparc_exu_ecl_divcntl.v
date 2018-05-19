// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_exu_ecl_divcntl.v
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
//  Module Name: sparc_exu_divcntl
//	Description: Control block for div.  Division takes 1 cycle to load
//		the values, 65 cycles to calculate the result, and 1 cycle to 
//    calculate the ccs and check for overflow.
//   	Controlled by a one hot state machine and a 6 bit counter.
*/

`define IDLE 0
`define RUN 1
`define LAST_CALC 2
`define CHK_OVFL 3
`define FIX_OVFL 4
`define DONE 5

module sparc_exu_ecl_divcntl (/*AUTOARG*/
   // Outputs
   ecl_div_xinmask, ecl_div_keep_d, ecl_div_ld_inputs, 
   ecl_div_sel_adder, ecl_div_last_cycle, ecl_div_almostlast_cycle, 
   ecl_div_sel_div, divcntl_wb_req_g, divcntl_ccr_cc_w2, 
   ecl_div_sel_64b, ecl_div_sel_u32, ecl_div_sel_pos32, 
   ecl_div_sel_neg32, ecl_div_upper32_zero, ecl_div_upper33_one, 
   ecl_div_upper33_zero, ecl_div_dividend_sign, ecl_div_newq, 
   ecl_div_subtract_l, ecl_div_keepx, ecl_div_cin, 
   // Inputs
   clk, se, reset, mdqctl_divcntl_input_vld, wb_divcntl_ack_g, 
   mdqctl_divcntl_reset_div, div_ecl_gencc_in_msb_l, 
   div_ecl_gencc_in_31, div_ecl_upper32_equal, div_ecl_low32_nonzero, 
   ecl_div_signed_div, div_ecl_dividend_msb, div_ecl_xin_msb_l, 
   div_ecl_x_msb, div_ecl_d_msb, div_ecl_cout64, 
   div_ecl_divisorin_31, ecl_div_div64, mdqctl_divcntl_muldone, 
   ecl_div_muls, div_ecl_adder_out_31, muls_rs1_31_m_l, 
   div_ecl_cout32, rs2_data_31_m, div_ecl_detect_zero_high, 
   div_ecl_detect_zero_low, div_ecl_d_62
   ) ;
   input     clk;
   input     se;
   input     reset;
   input     mdqctl_divcntl_input_vld;
   input     wb_divcntl_ack_g;
   input     mdqctl_divcntl_reset_div;
   input     div_ecl_gencc_in_msb_l;
   input     div_ecl_gencc_in_31;
   input     div_ecl_upper32_equal;
   input     div_ecl_low32_nonzero;
   input     ecl_div_signed_div;
   input     div_ecl_dividend_msb;
   input     div_ecl_xin_msb_l;
   input     div_ecl_x_msb;
   input     div_ecl_d_msb;
   input     div_ecl_cout64;
   input     div_ecl_divisorin_31;
   input     ecl_div_div64;
   input     mdqctl_divcntl_muldone;
   input     ecl_div_muls;
   input  div_ecl_adder_out_31;
   input  muls_rs1_31_m_l;
   input  div_ecl_cout32;
   input  rs2_data_31_m;
   input         div_ecl_detect_zero_high;
   input         div_ecl_detect_zero_low;
   input         div_ecl_d_62;
   
   output    ecl_div_xinmask;
   output    ecl_div_keep_d;
   output    ecl_div_ld_inputs;
   output    ecl_div_sel_adder;
   output    ecl_div_last_cycle;   // last cycle of calculation
   output    ecl_div_almostlast_cycle;//
   output    ecl_div_sel_div;
   output    divcntl_wb_req_g;
   output [7:0] divcntl_ccr_cc_w2;
   output       ecl_div_sel_64b;
   output       ecl_div_sel_u32;
   output       ecl_div_sel_pos32;
   output       ecl_div_sel_neg32;
   output       ecl_div_upper32_zero;
   output       ecl_div_upper33_one;
   output       ecl_div_upper33_zero;
   output       ecl_div_dividend_sign;
   output       ecl_div_newq;
   output       ecl_div_subtract_l;
   output       ecl_div_keepx;
   output        ecl_div_cin;
   
   wire         firstq;
   wire         q_next;        // next q bit
   wire         adderin1_64;   // msbs for adder
   wire         adderin2_64;
   wire         firstlast_sub; // subtract for first and last cycle
   wire         sub_next;      // next cycle will subtract
   wire         subtract;
   wire         bit64_halfadd; // partial result for qpredict
   wire         partial_qpredict;
   wire [1:0]   q_next_nocout;
   wire [1:0]   sub_next_nocout;
   wire         partial_qpredict_l;
   wire          divisor_sign;
   wire          detect_zero;
   wire          new_zero_rem_with_zero;
   wire          new_zero_rem_no_zero;
   wire          zero_rem_d;
   wire          zero_rem_q;
   wire          last_cin_with_zero;
   wire          last_cin_no_zero;
   wire          last_cin;
   wire          last_cin_next;
   
   // overflow correction wires
   wire          upper32_equal_d1;
   wire          gencc_in_msb_l_d1;
   wire          gencc_in_31_d1;
   wire          sel_div_d1;
   wire          low32_nonzero_d1;
   
   // Condition code generation wires
   wire [3:0]   xcc;
   wire [3:0]   icc;
   wire         unsign_ovfl;
   wire         pos_ovfl;
   wire         neg_ovfl;
   wire         muls_c;
   wire         next_muls_c;
   wire         muls_v;
   wire         next_muls_v;
   wire         muls_rs1_data_31_m;
   wire         div_adder_out_31_w;
   wire         rs2_data_31_w;
   wire         muls_rs1_data_31_w;
   wire         ovfl_32;
   wire         div_v;
   
   wire [5:0]   div_state;
   wire [5:0]   next_state;
   wire         go_idle,
                stay_idle,
                go_run,
                stay_run,
                go_last_calc,
                go_chk_ovfl,
                go_fix_ovfl,
                go_done,
                stay_done;


   wire         reset_cnt;
   wire [5:0]   cntr;
   wire         cntris63;

   /////////////////////////////////
   // G arbitration between MUL/DIV
   /////////////////////////////////
   assign        divcntl_wb_req_g = div_state[`DONE] | 
                      (~(div_state[`DONE] | div_state[`CHK_OVFL] | div_state[`FIX_OVFL]) &mdqctl_divcntl_muldone);
   assign        ecl_div_sel_div = ~(~(div_state[`DONE] | div_state[`CHK_OVFL] | div_state[`FIX_OVFL]) & 
                                    mdqctl_divcntl_muldone);
   
   // state flop
   dff_s #(6) divstate_dff(.din(next_state[5:0]), .clk(clk), .q(div_state[5:0]), .se(se), .si(),
                    .so());

   // output logic and state decode
   assign        ecl_div_almostlast_cycle = go_last_calc & ~ecl_div_ld_inputs;
   assign        ecl_div_sel_adder = (div_state[`RUN] | div_state[`LAST_CALC]) & ~ecl_div_ld_inputs;
   assign        ecl_div_last_cycle = div_state[`LAST_CALC];
   assign        ecl_div_ld_inputs = mdqctl_divcntl_input_vld;
   assign        ecl_div_keep_d = ~(ecl_div_sel_adder | ecl_div_ld_inputs);
   assign        reset_cnt = ~div_state[`RUN];
   
   // next state logic
   assign        stay_idle = div_state[`IDLE] & ~mdqctl_divcntl_input_vld;
   assign        go_idle = div_state[`DONE] & wb_divcntl_ack_g;
   assign        next_state[`IDLE] = go_idle | stay_idle | mdqctl_divcntl_reset_div | reset;

   assign        stay_run = div_state[`RUN] & ~cntris63 & ~ecl_div_muls;
   assign        go_run = (div_state[`IDLE] & mdqctl_divcntl_input_vld);
   assign        next_state[`RUN] = (go_run | stay_run) & 
                                      ~mdqctl_divcntl_reset_div & ~reset;

   assign        go_last_calc = div_state[`RUN] & (cntris63);
   assign        next_state[`LAST_CALC] = go_last_calc & ~mdqctl_divcntl_reset_div & ~reset;

   // chk_ovfl and fix_ovfl are place holders to guarantee that the overflow checking
   // takes place on the result.  No special logic occurs in them compared to the done state.
   assign        go_chk_ovfl = div_state[`LAST_CALC];
   assign        next_state[`CHK_OVFL] = go_chk_ovfl & ~mdqctl_divcntl_reset_div & ~reset;

   assign        go_fix_ovfl = div_state[`CHK_OVFL] | (div_state[`RUN] & ecl_div_muls);
   assign        next_state[`FIX_OVFL] = go_fix_ovfl & ~mdqctl_divcntl_reset_div & ~reset;

   assign        go_done = div_state[`FIX_OVFL];
   assign        stay_done = div_state[`DONE] & ~wb_divcntl_ack_g;
   assign        next_state[`DONE] = (go_done | stay_done) & ~mdqctl_divcntl_reset_div & ~reset;
   
   // counter
   sparc_exu_ecl_cnt6 cnt6(.reset       (reset_cnt),
                           /*AUTOINST*/
                           // Outputs
                           .cntr        (cntr[5:0]),
                           // Inputs
                           .clk         (clk),
                           .se          (se));

   assign        cntris63 = cntr[5] & cntr[4] & cntr[3] & cntr[2] & cntr[1] & cntr[0];


   ///////////////////////////////
   // Random logic for divider
   ///////////////////////////////
   // Generation of sign extension of dividend and divisor
   assign        ecl_div_dividend_sign = ecl_div_signed_div & div_ecl_dividend_msb;
   assign        ecl_div_xinmask = div_ecl_divisorin_31 & ecl_div_signed_div;

   assign        divisor_sign = div_ecl_x_msb & ecl_div_signed_div;
   
   // Generation of next bit of quotient
   ////////////////////////////////////////////////////////////////
   //	Calculate the next q.  Requires calculating the result
   // of the 65th bit of the adder and xoring it with the sign of
   // the divisor.  The order of these xors is switched for critical
   // path considerations.
   ////////////////////////////////////////////////////////////////
   assign        adderin1_64 = div_ecl_d_msb;
   assign        adderin2_64 = (ecl_div_signed_div & div_ecl_x_msb) ^ subtract;
   assign        bit64_halfadd = adderin1_64 ^ adderin2_64;
   assign        partial_qpredict = bit64_halfadd ^ ~(div_ecl_x_msb & ecl_div_signed_div);
   assign        partial_qpredict_l = ~partial_qpredict;
   //assign        qpredict = partial_qpredict ^ div_ecl_cout64;
   //assign        firstq = ~ecl_div_signed_div | div_ecl_xin_msb_l; 
   assign        firstq = ecl_div_dividend_sign;

   mux2ds #(2) qnext_mux(.dout(q_next_nocout[1:0]), 
                            .in0({partial_qpredict, partial_qpredict_l}),
                            .in1({2{firstq}}),
                            .sel0(~ecl_div_ld_inputs),
                            .sel1(ecl_div_ld_inputs));
   dp_mux2es qnext_cout_mux(.dout(q_next),
                            .in0(q_next_nocout[1]),
                            .in1(q_next_nocout[0]),
                            .sel(div_ecl_cout64));

   dff_s q_dff(.din(q_next), .clk(clk), .q(ecl_div_newq), .se(se), .si(),
               .so());


   ////////////////////////////
   // Subtraction logic and subtract flop
   //-------------------------------------
   // To take the subtraction calc out of the critical path,
   // it is done in the previous cycle and part is done with a
   // mux.  The result is put into a flop.
   ////////////////////////////
   assign firstlast_sub = ~ecl_div_almostlast_cycle & ~ecl_div_muls &
          (~ecl_div_signed_div | ~(div_ecl_dividend_msb ^ ~div_ecl_xin_msb_l));
                                                       
   assign        ecl_div_keepx = ~(ecl_div_ld_inputs |
                                  ecl_div_almostlast_cycle);

   mux2ds #(2) subnext_mux(.dout(sub_next_nocout[1:0]), 
                              .in0({2{firstlast_sub}}),
                              .in1({partial_qpredict, partial_qpredict_l}),
                              .sel0(~ecl_div_keepx),
                              .sel1(ecl_div_keepx));
   dp_mux2es subtract_cout_mux(.dout(sub_next),
                            .in0(sub_next_nocout[1]),
                            .in1(sub_next_nocout[0]),
                            .sel(div_ecl_cout64));
   
   dff_s sub_dff(.din(sub_next), .clk(clk), .q(subtract), .se(se), .si(),
               .so());

   assign        ecl_div_subtract_l = ~subtract;


   /////////////////////////////////////////////
   // Carry in logic
   //--------------------------------------------
   // The carry is usually just subtract.  The
   // quotient correction for signed division
   // sometimes has to adjust it though.
   /////////////////////////////////////////////
   assign        detect_zero = div_ecl_detect_zero_low & div_ecl_detect_zero_high;

   assign ecl_div_cin = (ecl_div_last_cycle)? last_cin: subtract;
   // stores if the partial remainder was ever zero.
/* -----\/----- EXCLUDED -----\/-----
   // changed for timing
    assign        zero_rem_d = ~ecl_div_ld_inputs & (div_ecl_detect_zero | zero_rem_q) & 
                                                     (~div_ecl_d_62 | ecl_div_almostlast_cycle);
 -----/\----- EXCLUDED -----/\----- */
   assign new_zero_rem_with_zero = ~ecl_div_ld_inputs & (~div_ecl_d_62 | ecl_div_almostlast_cycle);
   assign new_zero_rem_no_zero = zero_rem_q & new_zero_rem_with_zero;
   assign zero_rem_d = (detect_zero)? new_zero_rem_with_zero: new_zero_rem_no_zero;
   dff_s zero_rem_dff(.din(zero_rem_d), .clk(clk), .q(zero_rem_q),
                    .se(se), .si(), .so());
   
/* -----\/----- EXCLUDED -----\/-----
   // changed for timing
   assign last_cin_next = ecl_div_signed_div & (divisor_sign & ~div_ecl_d_62 | 
                                                ~divisor_sign &div_ecl_d_62&~zero_rem_d |
                                                divisor_sign &div_ecl_d_62&zero_rem_d);
 -----/\----- EXCLUDED -----/\----- */
   assign last_cin_with_zero = ecl_div_signed_div & (divisor_sign & ~div_ecl_d_62 | 
                                                ~divisor_sign &div_ecl_d_62&~new_zero_rem_with_zero |
                                                divisor_sign &div_ecl_d_62&new_zero_rem_with_zero);
   assign last_cin_no_zero = ecl_div_signed_div & (divisor_sign & ~div_ecl_d_62 | 
                                                ~divisor_sign &div_ecl_d_62&~new_zero_rem_no_zero |
                                                divisor_sign &div_ecl_d_62&new_zero_rem_no_zero);
   assign last_cin_next = (detect_zero)? last_cin_with_zero: last_cin_no_zero;
   dff_s last_cin_dff(.din(last_cin_next), .clk(clk), .q(last_cin),
                    .se(se), .si(), .so());
   
   ///////////////////////////////
   // Condition code generation
   ///////////////////////////////
   // There is a special case:
   // For 64 bit signed division largest neg/-1 = largest neg
   // However for 32 bit division this will give us positive overflow.
   // This is detected by a sign switch on this case.
   wire   inputs_neg_d;
   wire   inputs_neg_q;
   wire   large_neg_ovfl;
   assign inputs_neg_d = div_ecl_dividend_msb & div_ecl_divisorin_31;
   assign large_neg_ovfl = inputs_neg_q & ~gencc_in_msb_l_d1;
   dffe_s inputs_neg_dff(.din(inputs_neg_d), .clk(clk), .q(inputs_neg_q), 
                       .en(ecl_div_ld_inputs), .se(se), .si(), .so());
   dff_s #(5) cc_sig_dff(.din({div_ecl_upper32_equal, div_ecl_gencc_in_msb_l,
                             div_ecl_gencc_in_31, ecl_div_sel_div, div_ecl_low32_nonzero}),
                         .q({upper32_equal_d1, gencc_in_msb_l_d1,
                             gencc_in_31_d1, sel_div_d1, low32_nonzero_d1}),
                         .clk(clk), .se(se), .si(), .so());
   // selects for correcting divide overflow
   assign        ecl_div_sel_64b = ecl_div_div64 | ecl_div_muls;
   assign        ecl_div_sel_u32 = ~ecl_div_sel_64b & ~ecl_div_signed_div;
   assign 			 ecl_div_sel_pos32 = (~ecl_div_sel_64b & ecl_div_signed_div & 
                                      (gencc_in_msb_l_d1 | large_neg_ovfl));
   assign        ecl_div_sel_neg32 = (~ecl_div_sel_64b & ecl_div_signed_div & 
                                      ~gencc_in_msb_l_d1 & ~large_neg_ovfl);

   // results of checking are staged one cycle for timing reasons
   // this is the reason for the chk and fix ovfl states
   assign        ecl_div_upper32_zero = upper32_equal_d1 & gencc_in_msb_l_d1;
   assign        ecl_div_upper33_zero = (upper32_equal_d1 & gencc_in_msb_l_d1 & 
                                         ~gencc_in_31_d1);
   assign        ecl_div_upper33_one = (upper32_equal_d1 & ~gencc_in_msb_l_d1 & 
                                        gencc_in_31_d1);

   // divide overflow
   assign        unsign_ovfl = ecl_div_sel_u32 & ~ecl_div_upper32_zero & sel_div_d1;
   assign        pos_ovfl = ecl_div_sel_pos32 & ~ecl_div_upper33_zero & sel_div_d1;
   assign        neg_ovfl = ecl_div_sel_neg32 & ~ecl_div_upper33_one & sel_div_d1;
   assign        div_v = pos_ovfl | unsign_ovfl | neg_ovfl;

   // muls carry and overflow
   assign next_muls_c = (div_state[`RUN]) ? div_ecl_cout32: muls_c;

   assign        muls_rs1_data_31_m = ~muls_rs1_31_m_l;
   dff_s #(3) muls_overlow_dff(.din({muls_rs1_data_31_m, rs2_data_31_m, div_ecl_adder_out_31}),
                             .q({muls_rs1_data_31_w, rs2_data_31_w, div_adder_out_31_w}),
                             .clk(clk), .se(se), .si(), .so());
   assign ovfl_32 = ((muls_rs1_data_31_w & rs2_data_31_w & ~div_adder_out_31_w) |
                     (~muls_rs1_data_31_w & ~rs2_data_31_w & div_adder_out_31_w));
   assign next_muls_v = (div_state[`FIX_OVFL]) ? ovfl_32: muls_v;
   dff_s muls_c_dff(.din(next_muls_c), .clk(clk), .q(muls_c),
                  .se(se), .si(), .so());
   dff_s muls_v_dff(.din(next_muls_v), .clk(clk), .q(muls_v),
                  .se(se), .si(), .so());
  
   // negative
   assign xcc[3] = ~gencc_in_msb_l_d1 & ~unsign_ovfl & ~pos_ovfl;
   assign icc[3] = (gencc_in_31_d1 & ~pos_ovfl) | neg_ovfl | unsign_ovfl;
   // zero
   assign xcc[2] = upper32_equal_d1 & gencc_in_msb_l_d1 & ~low32_nonzero_d1;
   assign icc[2] = ~low32_nonzero_d1 & ~div_v; // nonzero checks before ovfl
   //overflow
   assign xcc[1] = 1'b0;
   assign icc[1] = (ecl_div_muls & sel_div_d1) ? muls_v: div_v;
   // carry
   assign xcc[0] = 1'b0;
   assign icc[0] = ecl_div_muls & sel_div_d1 & muls_c;

   assign divcntl_ccr_cc_w2 = {xcc, icc};

endmodule // sparc_exu_divcntl
