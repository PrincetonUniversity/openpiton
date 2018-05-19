// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_dcl.v
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
//  Module Name: sparc_ifu_dcl
//  Description:	
//   The decode control logic block does branch condition evaluation,
//   delay slot management, and appropriate condition code
//   selection.  It also executes the tcc instruction and kills the E
//   stage instruction if a move did not succeed.  The DCL block is
//   also responsible for generating the correct select signals to
//   choose the branch offset and immediate operand.
//
*/
////////////////////////////////////////////////////////////////////////

`include "sys.h"

`define CC_N  3
`define CC_Z  2
`define CC_V  1
`define CC_C  0

`define FP_U  3
`define FP_G  2
`define FP_L  1
`define FP_E  0

`define FSR_FCC0_HI 11
`define FSR_FCC0_LO 10
`define FSR_FCC1_HI 33
`define FSR_FCC1_LO 32
`define FSR_FCC2_HI 35
`define FSR_FCC2_LO 34
`define FSR_FCC3_HI 37
`define FSR_FCC3_LO 36


module sparc_ifu_dcl(/*AUTOARG*/
   // Outputs
   ifu_exu_kill_e, ifu_exu_dontmv_regz0_e, ifu_exu_dontmv_regz1_e, 
   ifu_exu_tcc_e, ifu_exu_dbrinst_d, ifu_ffu_mvcnd_m, 
   dcl_fcl_bcregz0_e, dcl_fcl_bcregz1_e, dtu_inst_anull_e, 
   dcl_swl_tcc_done_m, dcl_imd_immdata_sel_simm13_d_l, 
   dcl_imd_immdata_sel_movcc_d_l, dcl_imd_immdata_sel_sethi_d_l, 
   dcl_imd_immdata_sel_movr_d_l, dcl_imd_broff_sel_call_d_l, 
   dcl_imd_broff_sel_br_d_l, dcl_imd_broff_sel_bcc_d_l, 
   dcl_imd_broff_sel_bpcc_d_l, dcl_imd_immbr_sel_br_d, so,
   dcl_esl_br_inst_d, dcl_esl_br_inst_e,
   // Inputs
   rclk, se, si, dtu_reset, exu_ifu_cc_d, fcl_dcl_regz_e, 
   exu_ifu_regn_e, ffu_ifu_cc_w2, ffu_ifu_cc_vld_w2, 
   tlu_ifu_flush_pipe_w, swl_dcl_thr_d, swl_dcl_thr_w2, 
   imd_dcl_brcond_d, imd_dcl_mvcond_d, fdp_dcl_op_s, fdp_dcl_op3_s, 
   imd_dcl_abit_d, dec_dcl_cctype_d, dtu_dcl_opf2_d, 
   fcl_dtu_inst_vld_e, fcl_dtu_intr_vld_e, ifu_tlu_flush_w
   );

   input    rclk, 
            se, 
            si, 
            dtu_reset;
   
   input [7:0] exu_ifu_cc_d;         // latest CCs from EXU
   
   input       fcl_dcl_regz_e,        // rs1=0
	             exu_ifu_regn_e;        // rs1<0

   input [7:0] ffu_ifu_cc_w2;
   input [3:0] ffu_ifu_cc_vld_w2;

   input       tlu_ifu_flush_pipe_w;
   
   input [3:0] swl_dcl_thr_d,
	             swl_dcl_thr_w2;
   
   input [3:0] imd_dcl_brcond_d;     // branch condition type
   input [7:0] imd_dcl_mvcond_d;     // mov condition type

   input [1:0] fdp_dcl_op_s;
   input [5:0] fdp_dcl_op3_s;
   input       imd_dcl_abit_d;	      // anull bit for cond branch
   input [2:0] dec_dcl_cctype_d;     // which cond codes to use
   input       dtu_dcl_opf2_d;

   input       fcl_dtu_inst_vld_e;
   input       fcl_dtu_intr_vld_e;
   input       ifu_tlu_flush_w;

   output      ifu_exu_kill_e,
		           ifu_exu_dontmv_regz0_e,
		           ifu_exu_dontmv_regz1_e,
		           ifu_exu_tcc_e;
   output      ifu_exu_dbrinst_d;

   output      ifu_ffu_mvcnd_m;
   
   output      dcl_fcl_bcregz0_e,
               dcl_fcl_bcregz1_e;

   output      dtu_inst_anull_e;
   output      dcl_swl_tcc_done_m;

   output      dcl_imd_immdata_sel_simm13_d_l,      // imm data select
	             dcl_imd_immdata_sel_movcc_d_l,
	             dcl_imd_immdata_sel_sethi_d_l,
	             dcl_imd_immdata_sel_movr_d_l;

   output      dcl_imd_broff_sel_call_d_l,      // dir branch offset select
	             dcl_imd_broff_sel_br_d_l,
	             dcl_imd_broff_sel_bcc_d_l,
	             dcl_imd_broff_sel_bpcc_d_l;

   output      dcl_imd_immbr_sel_br_d;
   
   output      so;

   output      dcl_esl_br_inst_d;
   output      dcl_esl_br_inst_e;

//----------------------------------------------------------------------
// Declarations
//----------------------------------------------------------------------

   wire [7:0]  cc_breval_e,
	             fp_breval_d;

   wire        abit_e;

   wire        cond_brtaken_e,
	             anull_all,
	             anull_ubr,
	             anull_cbr;

   wire [3:0]  anull_next_e,
               anull_e,
               thr_anull_d;

   wire        inst_anull_d,
               inst_anull_e;

   wire [3:0]  flush_abit;
   wire        all_flush_w,
               all_flush_w2;

   wire        br_always_e;
   
   wire        sel_movcc,
	             sel_movr;

   wire [3:0]  br_cond_e,
	             br_cond_d;
   wire [3:0]  thr_vld_e;
   
   wire [3:0]  ls_brcond_d,
               ls_brcond_e;
   wire [1:0]  ccfp_sel;

   wire [3:0]  cc_e;

   wire [1:0]  curr_fcc_d;

   wire [7:0]  fcc_d;

   wire [7:0]  t0_fcc_d,
	             t1_fcc_d,
	             t2_fcc_d,
	             t3_fcc_d,
	             t0_fcc_nxt,
	             t1_fcc_nxt,
	             t2_fcc_nxt,
	             t3_fcc_nxt;

   wire        use_fcc0_d,
	             use_fcc1_d,
	             use_fcc2_d,
	             use_fcc3_d;

   wire [3:0]  thr_e,
	             thr_dec_d;
//	             fcc_dec_d,
//	             fcc_dec_e;
   
   wire [1:0]  op_d;
   wire [5:0]  op3_d;

   wire        use_xcc_d,
	             ltz_e,
	             cc_eval0,
	             cc_eval1,
	             fp_eval0_d,
	             fp_eval1_d,
	             fp_eval_d,
	             fp_eval_e,
	             r_eval1,
	             r_eval0,
	             ccfp_eval,
	             ccbr_taken_e,
	             mvbr_sel_br_d,
	             cc_mvbr_d,
	             cc_mvbr_e,
	             fpcond_mvbr_d,
	             fpcond_mvbr_e;

   wire        call_inst_e,
               call_inst_d,
	             dbr_inst_d,
	             dbr_inst_e,
	             ibr_inst_d,
	             ibr_inst_e,
	             mov_inst_d,
	             mov_inst_e,
               tcc_done_e,
	             tcc_inst_d,
	             tcc_inst_e;

   wire        clk;
   

   
//----------------------------------------------------------------------
// Code start here 
//----------------------------------------------------------------------
   assign      clk = rclk;
   

   // S Stage Operands
   dff_s #(2) opreg(.din  (fdp_dcl_op_s),
		              .clk  (clk),
		              .q    (op_d),
		              .se   (se), .si(), .so());

   dff_s #(6) op3_reg(.din  (fdp_dcl_op3_s),
		                .clk  (clk),
		                .q    (op3_d),
		                .se   (se), .si(), .so());

   dff_s abite_reg(.din  (imd_dcl_abit_d),
		             .clk  (clk),
		             .q    (abit_e),
		             .se   (se), .si(), .so());

   // need to protect from scan contention
   dff_s #(4) thre_reg(.din (swl_dcl_thr_d),
                     .q   (thr_e),
                     .clk (clk), .se(se), .si(), .so());

   //------------------------------
   // Choose correct immediate data
   //------------------------------
   // movcc if op3 = 101100
   assign dcl_imd_immdata_sel_movcc_d_l = ~(op_d[1] &
					                                  op3_d[5] & ~op3_d[4] & 
                                            op3_d[3] & ~op3_d[0]);

   // movr if op3 = 101111
   //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   // Reduced the number of terms in the eqn to help with timing 
   // path, the result of which is that the immediate data sent to the
   // exu for a FLUSH instruction is INCORRECT!  (It is decoded as a
   // MOVR).  However, since our architecture completely ignores the
   // address of the flush, this should be ok.  Confirmed with Sanjay
   // 03/31/03. (v1.29 -> 1.30)
   // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
   assign dcl_imd_immdata_sel_movr_d_l = ~(op_d[1] &
				                                   op3_d[5] & op3_d[3] &
				                                   op3_d[1] & op3_d[0]);
   
   // sethi if op3 = 100xx
   assign dcl_imd_immdata_sel_sethi_d_l = ~(~op_d[1]);

   // everything else
   assign dcl_imd_immdata_sel_simm13_d_l = 
                   	        ~(dcl_imd_immdata_sel_movcc_d_l &
                              dcl_imd_immdata_sel_movr_d_l  &
	                            dcl_imd_immdata_sel_sethi_d_l);

   //------------------------------
   // Choose correct branch offset
   //------------------------------
   // call or ld/store
   assign dcl_imd_broff_sel_call_d_l = ~(op_d[0]);

   // branch on register
   assign dcl_imd_broff_sel_br_d_l = ~(~op_d[0] & 
				                               op3_d[4] & op3_d[3]);
   // branch w/o prediction
   assign dcl_imd_broff_sel_bcc_d_l = ~(~op_d[0] & 
					                              op3_d[4] & ~op3_d[3]);
   // everything else
   assign dcl_imd_broff_sel_bpcc_d_l = ~(~op_d[0] & 
					                               ~op3_d[4]);

   //------------------------------------
   // mark branch/conditional instrctions
   //------------------------------------
   // call
   assign call_inst_d = ~op_d[1] & op_d[0];
   dff_s #(1) call_inste_reg(.din  (call_inst_d),
			                     .clk  (clk),
			                     .q    (call_inst_e),
			                     .se   (se), .si(), .so());

   // call or branch but not nop/sethi
   assign dbr_inst_d = ~op_d[1] & (op_d[0] | op3_d[4] | op3_d[3]);
   
   // Choose between branch offset and immediate operand
   assign dcl_imd_immbr_sel_br_d = dbr_inst_d;

   // tell exu to use pc instead of rs1
   assign ifu_exu_dbrinst_d = ~op_d[1];

   dff_s #(1) dbr_inste_reg(.din  (dbr_inst_d),
			                    .clk  (clk),
			                    .q    (dbr_inst_e),
			                    .se   (se), .si(), .so());

   // jmpl + return
   assign ibr_inst_d = op_d[1] & ~op_d[0] &
		                    op3_d[5] &  op3_d[4] &  op3_d[3] & 
                        ~op3_d[2] & ~op3_d[1];
   dff_s #(1) ibr_inste_reg(.din  (ibr_inst_d),
			                    .clk  (clk),
			                    .q    (ibr_inst_e),
			                    .se   (se), .si(), .so());   

   assign dcl_esl_br_inst_d = dbr_inst_d | ibr_inst_d;
   assign dcl_esl_br_inst_e = dbr_inst_e | ibr_inst_e;
   // mov
   assign mov_inst_d = (op_d[1] & ~op_d[0] &
			                  op3_d[5] & ~op3_d[4] & op3_d[3] & op3_d[2] & 
			                  (~op3_d[1] & ~op3_d[0] | op3_d[1] & op3_d[0]));

   dff_s #(1) mov_inste_reg(.din  (mov_inst_d),
			                    .clk  (clk),
			                    .q    (mov_inst_e),
			                    .se   (se), .si(), .so());
   // tcc
   assign tcc_inst_d = op_d[1] & ~op_d[0] &
		                   op3_d[5] &  op3_d[4] &  op3_d[3] & 
		                   ~op3_d[2] &  op3_d[1] & ~op3_d[0];
   dff_s #(1) tcc_inste_reg(.din  (tcc_inst_d),
			                    .clk  (clk),
			                    .q    (tcc_inst_e),
			                    .se   (se), .si(), .so());

   assign mvbr_sel_br_d = ~op_d[1] & ~op_d[0] |          // br
	                         op3_d[3] & ~op3_d[2] & op3_d[1] & ~op3_d[0]; // tcc
   
   assign cc_mvbr_d = ~(~op_d[1] & ~op_d[0] & op3_d[4] & op3_d[3] |  // bpr
			                  op_d[1] & ~op_d[0] & op3_d[5] & ~op3_d[4] &
			                  op3_d[3] & op3_d[2] & op3_d[1] & op3_d[0] |  // movr
			                  op_d[1] & ~op_d[0] & op3_d[5] & op3_d[4] &
			                  ~op3_d[3] & op3_d[2] & ~op3_d[1] & op3_d[0] &
			                  dtu_dcl_opf2_d);                             // fmovr


   //---------------------------
   // FCC Logic
   //--------------------------
   // choose current fcc
   assign use_fcc0_d = ~dec_dcl_cctype_d[1] & ~dec_dcl_cctype_d[0];
   assign use_fcc1_d = ~dec_dcl_cctype_d[1] &  dec_dcl_cctype_d[0];
   assign use_fcc2_d =  dec_dcl_cctype_d[1] & ~dec_dcl_cctype_d[0];
   assign use_fcc3_d =  dec_dcl_cctype_d[1] &  dec_dcl_cctype_d[0];
   
   mux4ds #(2) fcc_mux(.dout (curr_fcc_d[1:0]),
		                   .in0  (fcc_d[1:0]),
		                   .in1  (fcc_d[3:2]),
		                   .in2  (fcc_d[5:4]),
		                   .in3  (fcc_d[7:6]),
		                   .sel0 (use_fcc0_d),
		                   .sel1 (use_fcc1_d),
		                   .sel2 (use_fcc2_d),
		                   .sel3 (use_fcc3_d));

   // decode to make next step easier
//   assign fcc_dec_d[0] = ~curr_fcc_d[1] & ~curr_fcc_d[0];
//   assign fcc_dec_d[1] = ~curr_fcc_d[1] &  curr_fcc_d[0];
//   assign fcc_dec_d[2] =  curr_fcc_d[1] & ~curr_fcc_d[0];
//   assign fcc_dec_d[3] =  curr_fcc_d[1] &  curr_fcc_d[0];

//   dff #(4) fcce_reg(.din (fcc_dec_d),
//		                 .q   (fcc_dec_e),
//		                 .clk (clk),
//		                 .se  (se), .si(), .so());
   
   
   //------------------
   // CC Logic for BCC
   //------------------
   // Choose appropriate CCs
   //
   // dec_cctype is 3 bits
   // 10X  icc
   // 11X  xcc
   // 000  fcc0
   // 001  fcc1
   // 010  fcc2
   // 011  fcc3
//   assign use_xcc_d = (dec_dcl_cctype_d[2] | op3_d[3]) & dec_dcl_cctype_d[1];
   assign use_xcc_d = dec_dcl_cctype_d[1];   
   assign fpcond_mvbr_d = ~dec_dcl_cctype_d[2] & ~tcc_inst_d;

   dff_s fpbr_reg(.din  (fpcond_mvbr_d),
		            .clk  (clk),
		            .q    (fpcond_mvbr_e),
		            .se   (se), .si(), .so());
   
   // mux between xcc and icc
//   assign cc_d =  use_xcc_d ?  exu_ifu_cc_d[7:4] :      // xcc
//			                         exu_ifu_cc_d[3:0];       // icc
//   dff #(4)  ccreg_e(.din  (cc_d),
//		                 .clk  (clk),
//		                 .q    (cc_e),
//		                 .se   (se),  .si(), .so());

   bw_u1_soffm2_4x UZsize_ccreg0_e(.d0 (exu_ifu_cc_d[0]),
                                   .d1 (exu_ifu_cc_d[4]),
                                   .s  (use_xcc_d),
                                   .q  (cc_e[0]),
                                   .ck (clk), .se(se), .sd(), .so());
   bw_u1_soffm2_4x UZsize_ccreg1_e(.d0 (exu_ifu_cc_d[1]),
                                   .d1 (exu_ifu_cc_d[5]),
                                   .s  (use_xcc_d),
                                   .q  (cc_e[1]),
                                   .ck (clk), .se(se), .sd(), .so());
   bw_u1_soffm2_4x UZsize_ccreg2_e(.d0 (exu_ifu_cc_d[2]),
                                   .d1 (exu_ifu_cc_d[6]),
                                   .s  (use_xcc_d),
                                   .q  (cc_e[2]),
                                   .ck (clk), .se(se), .sd(), .so());
   bw_u1_soffm2_4x UZsize_ccreg3_e(.d0 (exu_ifu_cc_d[3]),
                                   .d1 (exu_ifu_cc_d[7]),
                                   .s  (use_xcc_d),
                                   .q  (cc_e[3]),
                                   .ck (clk), .se(se), .sd(), .so());
   
   
   //------------------------------
   // Evaluate Branch
   //------------------------------
   // Select correct branch condition
   assign sel_movcc = ~mvbr_sel_br_d & cc_mvbr_d;
   assign sel_movr = ~mvbr_sel_br_d & ~cc_mvbr_d;
   
   // br_cond is the same as the "cond" field = inst[28:25] for bcc
   mux3ds #(4)  brcond_mux(.dout   (br_cond_d),
			                     .in0    (imd_dcl_brcond_d),  // br or tcc
			                     .in1    (imd_dcl_mvcond_d[7:4]),  // movcc
			                     .in2    (imd_dcl_mvcond_d[3:0]),  // movr
			                     .sel0   (mvbr_sel_br_d),
			                     .sel1   (sel_movcc),
			                     .sel2   (sel_movr));
   
   dff_s #(4)  brcond_e_reg(.din  (br_cond_d),
			                    .clk  (clk),
			                    .q    (br_cond_e),
			                    .se   (se), .si(), .so());

   // Branch Type Decode
   assign ls_brcond_d[0]  =  ~br_cond_d[1] & ~br_cond_d[0];
   assign ls_brcond_d[1]  =  ~br_cond_d[1] &  br_cond_d[0];
   assign ls_brcond_d[2]  =   br_cond_d[1] & ~br_cond_d[0];
   assign ls_brcond_d[3]  =   br_cond_d[1] &  br_cond_d[0];

   dff_s #(4)  lsbrc_e_reg(.din  (ls_brcond_d),
			                   .clk  (clk),
			                   .q    (ls_brcond_e),
			                   .se   (se), .si(), .so());
   
   // Evaluate potential integer CC branches
   assign ltz_e = (cc_e[`CC_N] ^ cc_e[`CC_V]);

   assign cc_breval_e[0] = 1'b0;                       // BPN
   assign cc_breval_e[1] = cc_e[`CC_Z];	               // BPE
   assign cc_breval_e[2] = cc_e[`CC_Z] | ltz_e;        // BPLE
   assign cc_breval_e[3] = ltz_e;                      // BPL
   assign cc_breval_e[4] = cc_e[`CC_Z] | cc_e[`CC_C];  // BPLEU
   assign cc_breval_e[5] = cc_e[`CC_C];                // BPCS
   assign cc_breval_e[6] = cc_e[`CC_N];                // BPNEG
   assign cc_breval_e[7] = cc_e[`CC_V];                // BPVS 

   // mux to choose right condition
   assign cc_eval0 = cc_breval_e[0] & ls_brcond_e[0] |
		                 cc_breval_e[1] & ls_brcond_e[1] |
		                 cc_breval_e[2] & ls_brcond_e[2] |
		                 cc_breval_e[3] & ls_brcond_e[3];

   assign cc_eval1 = cc_breval_e[4] & ls_brcond_e[0] |
		                 cc_breval_e[5] & ls_brcond_e[1] |
		                 cc_breval_e[6] & ls_brcond_e[2] |
		                 cc_breval_e[7] & ls_brcond_e[3];

   // Evaluate FP CC branches in D stage
   assign fp_breval_d[0] = 1'b0;                            // FBN / A
   assign fp_breval_d[1] = (curr_fcc_d[1] | curr_fcc_d[0]); // FBNE / E
   assign fp_breval_d[2] = curr_fcc_d[1] ^ curr_fcc_d[0];   // FBLG / UE
   assign fp_breval_d[3] = curr_fcc_d[0];                   // FBUL / GE
   assign fp_breval_d[4] = ~curr_fcc_d[1] & curr_fcc_d[0];  // FBL / UGE
   assign fp_breval_d[5] = curr_fcc_d[1];                   // FBUG / LE
   assign fp_breval_d[6] = curr_fcc_d[1] & ~curr_fcc_d[0];  // FBG / ULE
   assign fp_breval_d[7] = curr_fcc_d[1] & curr_fcc_d[0];   // FBU / O
   
   assign fp_eval0_d = fp_breval_d[0] & ls_brcond_d[0] |
		                 fp_breval_d[1] & ls_brcond_d[1] |
		                 fp_breval_d[2] & ls_brcond_d[2] |
		                 fp_breval_d[3] & ls_brcond_d[3];

   assign fp_eval1_d = fp_breval_d[4] & ls_brcond_d[0] |
		                 fp_breval_d[5] & ls_brcond_d[1] |
		                 fp_breval_d[6] & ls_brcond_d[2] |
		                 fp_breval_d[7] & ls_brcond_d[3];

   assign fp_eval_d = br_cond_d[2] ? fp_eval1_d :
                                     fp_eval0_d;

   dff_s #(1) fpev_ff(.din (fp_eval_d),
		                .q   (fp_eval_e),
		                .clk (clk),
		                .se  (se), .si(), .so());

   // merge eval0, eval1 and fp condition codes
   assign ccfp_sel[0] = ~fpcond_mvbr_e & ~br_cond_e[2];
   assign ccfp_sel[1] = ~fpcond_mvbr_e &  br_cond_e[2];
//   assign ccfp_sel[2] =  fpcond_mvbr_e & ~br_cond_e[2];
//   assign ccfp_sel[3] =  fpcond_mvbr_e &  br_cond_e[2];
   
   assign ccfp_eval = ccfp_sel[0] & cc_eval0 |
		                  ccfp_sel[1] & cc_eval1 | 
		                  fpcond_mvbr_e & fp_eval_e;
   
   // invert branch condition if this is an inverted br type
//   assign ccbr_taken_e = (ccfp_eval ^ br_cond_e[3]) & cc_mvbr_e;
   assign ccbr_taken_e = ccfp_eval ? (cc_mvbr_e & ~br_cond_e[3]) :
                                       (cc_mvbr_e & br_cond_e[3]);

   assign br_always_e = (~br_cond_e[0] & ~br_cond_e[1] & ~br_cond_e[2] & 
	                       br_cond_e[3] & cc_mvbr_e);

   //--------------
   // For BRZ
   // -------------
   // Calculate Cond Assuming Z=1 And Z=0.  Then Mux
//   assign r_eval1 = ((exu_ifu_regn_e | ~br_cond_e[1] | ~br_cond_e[0]) ^
//		                  br_cond_e[2]) & ~cc_mvbr_e;
   assign r_eval1 = exu_ifu_regn_e ? (~br_cond_e[2] & ~cc_mvbr_e) :
                                       (((br_cond_e[1] & br_cond_e[0]) ^ 
                                         ~br_cond_e[2]) & ~cc_mvbr_e);
   
//   assign r_eval0 = ((exu_ifu_regn_e & br_cond_e[1]) ^
//                      br_cond_e[2]) & ~cc_mvbr_e;
   assign r_eval0 = exu_ifu_regn_e ? ((br_cond_e[1] ^ br_cond_e[2]) & 
                                       ~cc_mvbr_e) :
                                       (br_cond_e[2] & ~cc_mvbr_e);

   dff_s #(1) regcc_ff(.din  (cc_mvbr_d),
		                 .clk  (clk),
		                 .q    (cc_mvbr_e),
		                 .se   (se), .si(), .so());

   // Evaluate Final Branch condition
   // 3:1 mux
//   assign cond_brtaken_e = cc_mvbr_e      ?  ccbr_taken_e :
//		                       exu_ifu_regz_e ?       r_eval1 :
//		                                              r_eval0;
   // 2:1 mux
//   assign cond_brtaken_e = exu_ifu_regz_e ? (r_eval1 | ccbr_taken_e) :
//                                              (r_eval0 | ccbr_taken_e);

   //////// Chandra ////////

   wire   temp0, temp1, cond_brtaken_e_l;

   // limit loading on this signal
//   wire   regz_buf_e;
//   bw_u1_buf_5x UZfix_regz_bf(.a (exu_ifu_regz_e),
//                              .z (regz_buf_e));
   
   assign temp0 = (r_eval0 | ccbr_taken_e);
   assign temp1 = (r_eval1 | ccbr_taken_e);

   bw_u1_muxi21_6x UZsize_cbtmux(.z(cond_brtaken_e_l), 
                                  .d0(temp0), 
                                  .d1(temp1), 
                                  .s(fcl_dcl_regz_e));
   
   bw_u1_inv_20x UZsize_cbtinv(.z(cond_brtaken_e), 
                                .a(cond_brtaken_e_l));

   ////////////////////////

   assign dcl_fcl_bcregz0_e = (temp0 & dbr_inst_e | ibr_inst_e | 
                               call_inst_e) & ~dtu_inst_anull_e;
   assign dcl_fcl_bcregz1_e = (temp1 & dbr_inst_e | ibr_inst_e | 
                               call_inst_e) & ~dtu_inst_anull_e;

//   assign ifu_exu_dontmove_e = mov_inst_e & ~cond_brtaken_e;
   assign ifu_exu_dontmv_regz0_e = ~temp0 & mov_inst_e;
   assign ifu_exu_dontmv_regz1_e = ~temp1 & mov_inst_e;

   // branch condition to FPU
   dff_s #(1) fpcond_ff(.din  (cond_brtaken_e),
		                  .q    (ifu_ffu_mvcnd_m),
		                  .clk  (clk),
		                  .se   (se), .si(), .so());		    

   // branch / move completion and anull signals
//   assign dtu_fcl_brtaken_e = ~dtu_inst_anull_e & 
//	                            (ibr_inst_e | call_inst_e |
//			                         dbr_inst_e & cond_brtaken_e);

   // if mov didn't succeed kill write back and bypass
   // need to check thread as well
//   assign ifu_exu_kill_e = dtu_inst_anull_e | 
//	                   ~fcl_dtu_inst_vld_e;  // don't need this anymore
   assign ifu_exu_kill_e = dtu_inst_anull_e;


   // signal trap if tcc succeeds
   assign ifu_exu_tcc_e = ~dtu_inst_anull_e & tcc_inst_e & ccbr_taken_e & 
                          fcl_dtu_inst_vld_e;

   assign tcc_done_e = ~dtu_inst_anull_e & tcc_inst_e & ~ccbr_taken_e & 
                       fcl_dtu_inst_vld_e;   

   dff_s #(1) tccm_ff(.din (tcc_done_e),
                    .q   (dcl_swl_tcc_done_m),
                    .clk (clk),
                    .se  (se), .si(), .so());
   
   // logic to anull delay slot, if this branch itsel is not anulled
   assign anull_cbr  =  abit_e & dbr_inst_e & ~br_always_e & ~call_inst_e;
   assign anull_ubr  =  abit_e & dbr_inst_e & br_always_e & ~call_inst_e;

   assign anull_all =  anull_ubr  | anull_cbr & ~cond_brtaken_e;

   // check which thread to anull
   assign thr_vld_e = thr_e & {4{fcl_dtu_inst_vld_e}};

   assign all_flush_w = tlu_ifu_flush_pipe_w | ifu_tlu_flush_w;
   dff_s #(1) flshw2_ff(.din (all_flush_w),
                      .q   (all_flush_w2),
                      .clk (clk), .se(se), .si(), .so());

   assign flush_abit = swl_dcl_thr_w2 & {4{all_flush_w2}};
   
   assign anull_next_e = ((~anull_e & {4{anull_all}} & thr_vld_e) |
 	                        (anull_e & ~(thr_e & {4{fcl_dtu_inst_vld_e |
                                                  fcl_dtu_intr_vld_e}}))) & 
                           ~flush_abit;
   
   // anull_e needs to be per thread
   dffr_s #(4) anull_ff(.din  (anull_next_e),
		                  .clk  (clk),
		                  .rst  (dtu_reset),
		                  .q    (anull_e),
		                  .se   (se), .si(), .so());

   // 
//   assign thr_dec_e[0] = swl_dcl_thr_e[0] | rst_tri_enable;
//   assign thr_dec_e[3:1] = swl_dcl_thr_e[3:1] & {3{~rst_tri_enable}};

   assign thr_anull_d = swl_dcl_thr_d & anull_next_e;
   assign inst_anull_d =  (|thr_anull_d[3:0]);
   dff_s #(1) ina_ff(.din (inst_anull_d),
                   .q   (inst_anull_e),
                   .clk (clk), .se (se), .si(), .so());
                   
   assign dtu_inst_anull_e = inst_anull_e;

//   mux4ds dcla_mux(.dout (this_inst_anull_e),  
//		               .in0  (anull_e[0]),
//		               .in1  (anull_e[1]),
//		               .in2  (anull_e[2]),
//		               .in3  (anull_e[3]),
//		               .sel0 (thr_dec_e[0]),
//		               .sel1 (thr_dec_e[1]),
//		               .sel2 (thr_dec_e[2]),
//		               .sel3 (thr_dec_e[3]));
//   assign dtu_inst_anull_e = this_inst_anull_e & fcl_dtu_inst_vld_e;


//--------------------
// Copy of FCC
//--------------------
   // FCC's are maintained in the ffu.  A copy is kept here to run the
   // FP branch instructions.
   
   // load FCC from FFU
   mux2ds #(8)  t0_fcc_mux(.dout (t0_fcc_nxt[7:0]),
			                     .in0  (t0_fcc_d[7:0]),
			                     .in1  (ffu_ifu_cc_w2[7:0]),
			                     .sel0  (~ffu_ifu_cc_vld_w2[0]),
			                     .sel1  (ffu_ifu_cc_vld_w2[0]));
   
   dffr_s #(8) t0_fcc_reg(.din (t0_fcc_nxt[7:0]),
		                    .q   (t0_fcc_d[7:0]),
		                    .rst (dtu_reset),
		                    .clk (clk),  .se  (se), .si(), .so());
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   mux2ds #(8)  t1_fcc_mux(.dout (t1_fcc_nxt[7:0]),
                                 .in0  (t1_fcc_d[7:0]),
                                 .in1  (ffu_ifu_cc_w2[7:0]),
                                 .sel0  (~ffu_ifu_cc_vld_w2[1]),
                                 .sel1  (ffu_ifu_cc_vld_w2[1]));

   // thread0 fcc registers

   dffr_s #(8) t1_fcc_reg(.din (t1_fcc_nxt[7:0]),
                            .q   (t1_fcc_d[7:0]),
                            .rst (dtu_reset),
                            .clk (clk),  .se  (se), .si(), .so());

   // choose thread
   assign thr_dec_d[0] = swl_dcl_thr_d[0];
   assign thr_dec_d[3:1] = swl_dcl_thr_d[3:1];

   mux2ds #(8) fcc0d_mx(.dout (fcc_d[7:0]),
                            .in0  (t0_fcc_d[7:0]),
                            .in1  (t1_fcc_d[7:0]),
                            .sel0 (thr_dec_d[0]),
                            .sel1 (thr_dec_d[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign fcc_d[7:0] = t0_fcc_d[7:0];

`elsif THREADS_1

   assign fcc_d[7:0] = t0_fcc_d[7:0];

`elsif THREADS_2

   mux2ds #(8)  t1_fcc_mux(.dout (t1_fcc_nxt[7:0]),
                                 .in0  (t1_fcc_d[7:0]),
                                 .in1  (ffu_ifu_cc_w2[7:0]),
                                 .sel0  (~ffu_ifu_cc_vld_w2[1]),
                                 .sel1  (ffu_ifu_cc_vld_w2[1]));

   // thread0 fcc registers

   dffr_s #(8) t1_fcc_reg(.din (t1_fcc_nxt[7:0]),
                            .q   (t1_fcc_d[7:0]),
                            .rst (dtu_reset),
                            .clk (clk),  .se  (se), .si(), .so());

   // choose thread
   assign thr_dec_d[0] = swl_dcl_thr_d[0];
   assign thr_dec_d[3:1] = swl_dcl_thr_d[3:1];

   mux2ds #(8) fcc0d_mx(.dout (fcc_d[7:0]),
                            .in0  (t0_fcc_d[7:0]),
                            .in1  (t1_fcc_d[7:0]),
                            .sel0 (thr_dec_d[0]),
                            .sel1 (thr_dec_d[1]));

`elsif THREADS_3

   mux2ds #(8)  t1_fcc_mux(.dout (t1_fcc_nxt[7:0]),
                                 .in0  (t1_fcc_d[7:0]),
                                 .in1  (ffu_ifu_cc_w2[7:0]),
                                 .sel0  (~ffu_ifu_cc_vld_w2[1]),
                                 .sel1  (ffu_ifu_cc_vld_w2[1]));

   mux2ds #(8)  t2_fcc_mux(.dout (t2_fcc_nxt[7:0]),
                                 .in0  (t2_fcc_d[7:0]),
                                 .in1  (ffu_ifu_cc_w2[7:0]),
                                 .sel0  (~ffu_ifu_cc_vld_w2[2]),
                                 .sel1  (ffu_ifu_cc_vld_w2[2]));

   // thread0 fcc registers

   dffr_s #(8) t1_fcc_reg(.din (t1_fcc_nxt[7:0]),
                            .q   (t1_fcc_d[7:0]),
                            .rst (dtu_reset),
                            .clk (clk),  .se  (se), .si(), .so());
   dffr_s #(8) t2_fcc_reg(.din (t2_fcc_nxt[7:0]),
                            .q   (t2_fcc_d[7:0]),
                            .rst (dtu_reset),
                            .clk (clk),  .se  (se), .si(), .so());

   // choose thread
   assign thr_dec_d[0] = swl_dcl_thr_d[0];
   assign thr_dec_d[3:1] = swl_dcl_thr_d[3:1];

   mux3ds #(8) fcc0d_mx(.dout (fcc_d[7:0]),
                            .in0  (t0_fcc_d[7:0]),
                            .in1  (t1_fcc_d[7:0]),
                            .in2  (t2_fcc_d[7:0]),
                            .sel0 (thr_dec_d[0]),
                            .sel1 (thr_dec_d[1]),
                            .sel2 (thr_dec_d[2]));

`else
   
   mux2ds #(8)  t1_fcc_mux(.dout (t1_fcc_nxt[7:0]),
			                     .in0  (t1_fcc_d[7:0]),
			                     .in1  (ffu_ifu_cc_w2[7:0]),
			                     .sel0  (~ffu_ifu_cc_vld_w2[1]),
			                     .sel1  (ffu_ifu_cc_vld_w2[1]));
   
   mux2ds #(8)  t2_fcc_mux(.dout (t2_fcc_nxt[7:0]),
			                     .in0  (t2_fcc_d[7:0]),
			                     .in1  (ffu_ifu_cc_w2[7:0]),
			                     .sel0  (~ffu_ifu_cc_vld_w2[2]),
			                     .sel1  (ffu_ifu_cc_vld_w2[2]));
   
   mux2ds #(8)  t3_fcc_mux(.dout (t3_fcc_nxt[7:0]),
			                     .in0  (t3_fcc_d[7:0]),
			                     .in1  (ffu_ifu_cc_w2[7:0]),
			                     .sel0  (~ffu_ifu_cc_vld_w2[3]),
			                     .sel1  (ffu_ifu_cc_vld_w2[3]));
   
   // thread0 fcc registers

   dffr_s #(8) t1_fcc_reg(.din (t1_fcc_nxt[7:0]),
		                    .q   (t1_fcc_d[7:0]),
		                    .rst (dtu_reset),
		                    .clk (clk),  .se  (se), .si(), .so());
   dffr_s #(8) t2_fcc_reg(.din (t2_fcc_nxt[7:0]),
		                    .q   (t2_fcc_d[7:0]),
		                    .rst (dtu_reset),
		                    .clk (clk),  .se  (se), .si(), .so());
   dffr_s #(8) t3_fcc_reg(.din (t3_fcc_nxt[7:0]),
		                    .q   (t3_fcc_d[7:0]),
		                    .rst (dtu_reset),
		                    .clk (clk),  .se  (se), .si(), .so());

   // choose thread
   assign thr_dec_d[0] = swl_dcl_thr_d[0];
   assign thr_dec_d[3:1] = swl_dcl_thr_d[3:1];
   
   mux4ds #(8) fcc0d_mx(.dout (fcc_d[7:0]),
		                    .in0  (t0_fcc_d[7:0]),
		                    .in1  (t1_fcc_d[7:0]),
		                    .in2  (t2_fcc_d[7:0]),
		                    .in3  (t3_fcc_d[7:0]),
		                    .sel0 (thr_dec_d[0]),
		                    .sel1 (thr_dec_d[1]),
		                    .sel2 (thr_dec_d[2]),
		                    .sel3 (thr_dec_d[3]));

`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS
   
endmodule // sparc_ifu_dcl

