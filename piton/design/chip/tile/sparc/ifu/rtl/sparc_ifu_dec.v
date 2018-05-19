// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_dec.v
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
//  Module Name: sparc_ifu_dec
//  Description:	
//  The decode block implements the sparc instruction decode ROM
//  It has a purely combinational part and some staging flops
*/
////////////////////////////////////////////////////////////////////////

module sparc_ifu_dec(/*AUTOARG*/
   // Outputs
   so, ifu_exu_aluop_d, ifu_exu_invert_d, ifu_exu_useimm_d, 
   ifu_exu_usecin_d, ifu_exu_enshift_d, ifu_exu_tagop_d, 
   ifu_exu_tv_d, ifu_exu_muls_d, ifu_exu_ialign_d, 
   ifu_exu_range_check_jlret_d, ifu_exu_range_check_other_d, 
   ifu_exu_shiftop_d, ifu_exu_muldivop_d, ifu_exu_wen_d, 
   ifu_exu_setcc_d, ifu_exu_rd_ifusr_e, ifu_exu_rd_exusr_e, 
   ifu_exu_rd_ffusr_e, ifu_exu_rs1_vld_d, ifu_exu_rs2_vld_d, 
   ifu_exu_rs3e_vld_d, ifu_exu_rs3o_vld_d, ifu_exu_use_rsr_e_l, 
   ifu_exu_save_d, ifu_exu_restore_d, ifu_exu_return_d, 
   ifu_exu_flushw_e, ifu_exu_saved_e, ifu_exu_restored_e, 
   ifu_tlu_rsr_inst_d, ifu_lsu_wsr_inst_d, ifu_exu_wsr_inst_d, 
   ifu_tlu_done_inst_d, ifu_tlu_retry_inst_d, ifu_lsu_ld_inst_e, 
   ifu_lsu_st_inst_e, ifu_lsu_pref_inst_e, ifu_lsu_alt_space_e, 
   ifu_lsu_alt_space_d, ifu_tlu_alt_space_d, ifu_lsu_memref_d, 
   ifu_lsu_sign_ext_e, ifu_lsu_ldstub_e, ifu_lsu_casa_e, 
   ifu_exu_casa_d, ifu_lsu_swap_e, ifu_tlu_mb_inst_e, 
   ifu_tlu_sir_inst_m, ifu_tlu_flsh_inst_e, ifu_lsu_ldst_dbl_e, 
   ifu_lsu_ldst_fp_e, ifu_lsu_ldst_size_e, ifu_ffu_fpop1_d, 
   ifu_ffu_visop_d, ifu_ffu_fpop2_d, ifu_ffu_fld_d, ifu_ffu_fst_d, 
   ifu_ffu_ldst_size_d, ifu_ffu_ldfsr_d, ifu_ffu_ldxfsr_d, 
   ifu_ffu_stfsr_d, ifu_ffu_quad_op_e, dec_fcl_rdsr_sel_pc_d, 
   dec_fcl_rdsr_sel_thr_d, dec_imd_call_inst_d, 
   dtu_fcl_flush_sonly_e, dtu_fcl_illinst_e, dtu_fcl_fpdis_e, 
   dtu_fcl_privop_e, dtu_fcl_imask_hit_e, dtu_fcl_br_inst_d, 
   dtu_fcl_sir_inst_e, dtu_ifq_kill_latest_d, dec_swl_wrt_tcr_w, 
   dec_swl_wrtfprs_w, dec_swl_ll_done_d, dec_swl_br_done_d, 
   dec_swl_rdsr_sel_thr_d, dec_swl_ld_inst_d, dec_swl_sta_inst_e, 
   dec_swl_std_inst_d, dec_swl_st_inst_d, dec_swl_fpop_d, 
   dec_swl_allfp_d, dec_swl_frf_upper_d, dec_swl_frf_lower_d, 
   dec_swl_div_inst_d, dec_swl_mul_inst_d, wsr_fixed_inst_w, 
   ifu_exu_sethi_inst_d, dec_dcl_cctype_d, 
   // Inputs
   rclk, se, si, dtu_inst_d, erb_dtu_imask, swl_dec_ibe_e, 
   dtu_inst_anull_e, lsu_ifu_ldsta_internal_e, fcl_dtu_tlzero_d, 
   fcl_dtu_privmode_d, fcl_dtu_hprivmode_d, fcl_dtu_inst_vld_d, 
   fcl_dtu_ely_inst_vld_d, fcl_dec_intr_vld_d, fcl_dtu_inst_vld_e, 
   fcl_dec_dslot_s, swl_dec_mulbusy_e, swl_dec_fpbusy_e, 
   swl_dec_divbusy_e, swl_dec_fp_enable_d
   );

   input          rclk, 
                  se, 
                  si;
   input [31:0]   dtu_inst_d;	// fed in at Switch (S) stage.
   input [38:0]   erb_dtu_imask;
   input          swl_dec_ibe_e;
   input          dtu_inst_anull_e;
   input          lsu_ifu_ldsta_internal_e;
   input          fcl_dtu_tlzero_d;
   input          fcl_dtu_privmode_d;
   input          fcl_dtu_hprivmode_d;
   input          fcl_dtu_inst_vld_d,
                  fcl_dtu_ely_inst_vld_d,
                  fcl_dec_intr_vld_d,
		              fcl_dtu_inst_vld_e;  // qual with this is not necessary

   input          fcl_dec_dslot_s;

   input          swl_dec_mulbusy_e;
   input          swl_dec_fpbusy_e;
   input          swl_dec_divbusy_e;
   input          swl_dec_fp_enable_d;


   output         so;
   
   // to EXU
   output [2:0]   ifu_exu_aluop_d;// 000 - add/sub
                                  // 001 - and
                                  // 010 - or
                                  // 011 - xor
                                  // 1X0 - movcc
                                  // 1x1 - movr
   output         ifu_exu_invert_d;   // invert rs2 operand
   output         ifu_exu_useimm_d;
   output         ifu_exu_usecin_d;   // use c from icc
   output         ifu_exu_enshift_d;  // turn on shifter

   output         ifu_exu_tagop_d,     
		              ifu_exu_tv_d,     
		              ifu_exu_muls_d,
                  ifu_exu_ialign_d,
		              ifu_exu_range_check_jlret_d,		
		              ifu_exu_range_check_other_d;

   output [2:0] ifu_exu_shiftop_d;  // b2 - 32b(0) or 64b(1)
                                    // b1 - unsigned(0)  or signed(1)
                                    // b0 - left(0) or right(1) shift
   
   output [4:0] ifu_exu_muldivop_d; // b4 - is_mul
                                    // b3 - is_div
                                    // b2 - 64b if 1, 32b if 0
                                    // b1 - signed if 1, unsigned if 0
                                    // b0 - set cc's
   
   output       ifu_exu_wen_d;      // write to rd
   output       ifu_exu_setcc_d;    // b0 - write to icc/xcc

   output       ifu_exu_rd_ifusr_e,
		            ifu_exu_rd_exusr_e,
		            ifu_exu_rd_ffusr_e;

   output       ifu_exu_rs1_vld_d,
		            ifu_exu_rs2_vld_d,
		            ifu_exu_rs3e_vld_d,
		            ifu_exu_rs3o_vld_d;
   
   output       ifu_exu_use_rsr_e_l;
   
   output       ifu_exu_save_d, 
		            ifu_exu_restore_d,
		            ifu_exu_return_d,
		            ifu_exu_flushw_e,
		            ifu_exu_saved_e,
		            ifu_exu_restored_e;

   // to TLU
   output       ifu_tlu_rsr_inst_d,
		            ifu_lsu_wsr_inst_d,
		            ifu_exu_wsr_inst_d,
		            ifu_tlu_done_inst_d,
		            ifu_tlu_retry_inst_d;
   
   // to LSU 
   output       ifu_lsu_ld_inst_e,   // ld inst or atomic
		            ifu_lsu_st_inst_e,   // store or atomic
                ifu_lsu_pref_inst_e,
		            ifu_lsu_alt_space_e, // alt space -- to be removed
		            ifu_lsu_alt_space_d, // never x -- to be removed
		            ifu_tlu_alt_space_d, // sometimes x but faster
		            ifu_lsu_memref_d;    // alerts lsu of upcoming ldst
//		            ifu_lsu_imm_asi_vld_d;

   output       ifu_lsu_sign_ext_e,
		            ifu_lsu_ldstub_e,
		            ifu_lsu_casa_e,
		            ifu_exu_casa_d,
		            ifu_lsu_swap_e;

   output       ifu_tlu_mb_inst_e,
		            ifu_tlu_sir_inst_m,
		            ifu_tlu_flsh_inst_e;

   output       ifu_lsu_ldst_dbl_e,
		            ifu_lsu_ldst_fp_e;
   
   output [1:0] ifu_lsu_ldst_size_e;
   
   // to SPU
//   output 	ifu_spu_scpy_inst_e,
//		ifu_spu_scmp_inst_e;

   // to FFU
   output       ifu_ffu_fpop1_d;
   output       ifu_ffu_visop_d;
   output       ifu_ffu_fpop2_d;
   output       ifu_ffu_fld_d;
   output       ifu_ffu_fst_d;
   output       ifu_ffu_ldst_size_d;
   
   output       ifu_ffu_ldfsr_d,
		            ifu_ffu_ldxfsr_d,
		            ifu_ffu_stfsr_d;
   output       ifu_ffu_quad_op_e;

   // within IFU
   output       dec_fcl_rdsr_sel_pc_d,
		            dec_fcl_rdsr_sel_thr_d;

   output       dec_imd_call_inst_d;

   output       dtu_fcl_flush_sonly_e,
//                dec_fcl_kill4sta_e,
		            dtu_fcl_illinst_e,
		            dtu_fcl_fpdis_e,
		            dtu_fcl_privop_e,
		            dtu_fcl_imask_hit_e,
		            dtu_fcl_br_inst_d,
		            dtu_fcl_sir_inst_e;

   output       dtu_ifq_kill_latest_d;
   
   // within DTU
   output       dec_swl_wrt_tcr_w,
		            dec_swl_wrtfprs_w,
		            dec_swl_ll_done_d,
                dec_swl_br_done_d,
		            dec_swl_rdsr_sel_thr_d,
		            dec_swl_ld_inst_d,
		            dec_swl_sta_inst_e,
		            dec_swl_std_inst_d,
		            dec_swl_st_inst_d,
		            dec_swl_fpop_d,
		            dec_swl_allfp_d,
		            dec_swl_frf_upper_d,
		            dec_swl_frf_lower_d,
		            dec_swl_div_inst_d,
		            dec_swl_mul_inst_d,
		            wsr_fixed_inst_w,
		            ifu_exu_sethi_inst_d;   // can be sethi or no-op

   output [2:0] dec_dcl_cctype_d;       // 0yy - fcc(yy)
                                        // 100 - icc
                                        // 110 - xcc
                                        // 1X1 - illegal inst!
   
   //------------------------------------------------------------
   // Declarations
   //------------------------------------------------------------
   // Internal Signals
   wire [1:0]   op;
   wire [2:0]   op2;
   wire [5:0]   op3;
   wire [8:0]   opf;

   wire         brsethi_inst,  // op types
		            call_inst,
		            arith_inst,
		            mem_inst;
   wire         sethi_or_nop;
   wire [15:0]  op3_lo;        // decode op3[3:0]
   wire [3:0]   op3_hi;        // decode op3[5:4]

   wire         dbr_inst_d, 
		            ibr_inst_d,    // jmpl or return
		            jmpl_inst_d,
		            retn_inst_d,
		            sethi_inst_d;

   wire         rdsr_done_d,
                rdpr_done_d;
   wire         dslot_d;
   
   wire         use_rsr_d_l;
   
   wire         flushw_d,
		            saved_d,
		            restored_d;
   wire         save_retn_done_d;
   wire         privop_d,
		            privop_e,
                hprivop_d,
                hprivop_e,
                valid_hp_rs_d,
                valid_hp_rd_d,
		            inv_reg_access_d,
                rsvchk_fail_d,
		            ill_inst_d,
		            ill_inst_e;

   wire         inst12_5_nonzero_d,
                inst11_8_nonzero_d,
                inst9_5_nonzero_d,
                rs2_nonzero_d;

   wire         state_chg_inst_d,
		            state_chg_inst_e,
		            flush_inst_d;

   wire         cctype_sel_imov,   // select which CC's to use
		            cctype_sel_fmov,
		            cctype_sel_bcc,
		            cctype_sel_bpcc;

   wire         rs1_vld_d,
		            rs2_vld_d,
		            rs3_vld_d,
		            rs4_vld_d;

   wire [4:0]   rs1,
		            rd;
   
   wire         rs1_00,           // decoded rs1
		            rs1_01,
		            rs1_02,
		            rs1_05,
		            rs1_06,
		            rs1_07,
		            rs1_09_0e,
		            rs1_0f,
                rs1_10,
		            rs1_12,
		            rs1_13,
		            rs1_14_15,
		            rs1_16_17,
                rs1_19,
		            rs1_1a,
		            rs1_1b,
		            rs1_1c_1f,
		            rd_00,
		            rd_01,
		            rd_04,
		            rd_05,
		            rd_06,
		            rd_07,
		            rd_09,
		            rd_0f,
                rd_10,
		            rd_11,
		            rd_12,
                rd_13,
                rd_18,
		            rd_1a,
		            rd_1b,
		            rd_1c_1f,
                rd_1f,
		            rs1_1f;

   wire         fcn0;
   
   wire         rd_ifusr_d,
		            rd_ifusr_e,
                rd_ffusr_d,
		            rd_ffusr_e,
		            rd_exusr_d,
		            rd_exusr_e;
   wire         wsr_fixed_inst_e,
		            wsr_fixed_inst_m,
		            wsr_inst_next_e,
		            wsr_fixed_inst_d;

   wire         wrt_tcr_d,
		            wrt_tcr_e,
		            wrt_tcr_qual_e,
		            wrt_tcr_m;
	 
   wire         wrt_fprs_d,
		            wrt_fprs_e,
		            wrt_fprs_qual_e,
		            wrt_fprs_m;
	 
   wire         prefetch,
                impl_prefetch,
                illegal_prefetch,
                noop_prefetch,
                pref_done_d,
                prefetch_d,
                prefetch_e;

   wire [2:0]   lstype_d,
		            lstype_e;
   wire [1:0]   lssize_d;
   wire         ldst_dbl_d,
		            ldst_fp_d,
		            sta_inst_d,
//                kill_for_sta_d,
                sta_nostf_d,
		            sta_inst_e,
                sta_nostf_e,
		            sext_d,
		            ldstub_d,
		            casa_d,
                casa_e,
		            swap_d;

   wire         mb_mask_d,
		            mb_inst_d,
		            mb_inst_e;

   wire         sir_inst_d,
		            sir_inst_e,
//		            kill_sir_d,
		            flag_sir_d,
		            flag_sir_e;
   
   wire         fpld_d,
		            fpop1_d,
                visop_d,
                int_align_d,
		            fpop2_d;
   wire         quad_ffuop_d;

   wire         allfp_d,
		            any_fpinst_d,
		            fpdis_trap_d,
		            fpdis_trap_e,
		            fcc_mov_d,
		            fcc_branch_d;
   
   wire         rs2_hit,
		            opf_hit,
		            ibit_hit,
		            rs1_hit,
		            op3_hit,
		            rd_hit,
		            op_hit,
		            imask_hit,
		            imask_hit_e;

   wire         clk;
   

//----------------------------------------------------------------------
// Code Begins Here
//----------------------------------------------------------------------
   assign       clk = rclk;

   
   assign   op  = dtu_inst_d[31:30];
   assign   op2 = dtu_inst_d[24:22];
   assign   op3 = dtu_inst_d[24:19];
   assign   opf = dtu_inst_d[13:5];

   // decode op
   assign   brsethi_inst = ~op[1] & ~op[0];
   assign   call_inst    = ~op[1] &  op[0];
   assign   arith_inst   =  op[1] & ~op[0];
   assign   mem_inst     =  op[1] &  op[0];

   // partial decode op2
   assign   sethi_or_nop = op2[2] & ~op2[1] & ~op2[0];
   
   // decode op3
   assign   op3_hi[0] = ~op3[5] & ~op3[4];
   assign   op3_hi[1] = ~op3[5] &  op3[4];
   assign   op3_hi[2] =  op3[5] & ~op3[4];
   assign   op3_hi[3] =  op3[5] &  op3[4];
   
   assign   op3_lo[0]  = ~op3[3] & ~op3[2] & ~op3[1] & ~op3[0];
   assign   op3_lo[1]  = ~op3[3] & ~op3[2] & ~op3[1] &  op3[0];
   assign   op3_lo[2]  = ~op3[3] & ~op3[2] &  op3[1] & ~op3[0];
   assign   op3_lo[3]  = ~op3[3] & ~op3[2] &  op3[1] &  op3[0];
   assign   op3_lo[4]  = ~op3[3] &  op3[2] & ~op3[1] & ~op3[0];
   assign   op3_lo[5]  = ~op3[3] &  op3[2] & ~op3[1] &  op3[0];
   assign   op3_lo[6]  = ~op3[3] &  op3[2] &  op3[1] & ~op3[0];
   assign   op3_lo[7]  = ~op3[3] &  op3[2] &  op3[1] &  op3[0];
   assign   op3_lo[8]  =  op3[3] & ~op3[2] & ~op3[1] & ~op3[0];
   assign   op3_lo[9]  =  op3[3] & ~op3[2] & ~op3[1] &  op3[0];
   assign   op3_lo[10] =  op3[3] & ~op3[2] &  op3[1] & ~op3[0];
   assign   op3_lo[11] =  op3[3] & ~op3[2] &  op3[1] &  op3[0];
   assign   op3_lo[12] =  op3[3] &  op3[2] & ~op3[1] & ~op3[0];
   assign   op3_lo[13] =  op3[3] &  op3[2] & ~op3[1] &  op3[0];
   assign   op3_lo[14] =  op3[3] &  op3[2] &  op3[1] & ~op3[0];
   assign   op3_lo[15] =  op3[3] &  op3[2] &  op3[1] &  op3[0];

   //-------------------------
   // Branch and Move Controls
   //-------------------------
   // brtype
   assign dbr_inst_d = brsethi_inst & (op2[1] | op2[0]) |   // regular branch
	                     call_inst;
   assign jmpl_inst_d = arith_inst & op3_hi[3] & op3_lo[8];  // jmpl
   assign retn_inst_d = arith_inst & op3_hi[3] & op3_lo[9];  // retn
   assign ibr_inst_d = jmpl_inst_d | retn_inst_d;
   assign sethi_inst_d = brsethi_inst & sethi_or_nop;
   assign ifu_exu_sethi_inst_d = sethi_inst_d;
   
   assign dec_swl_br_done_d = (dbr_inst_d | jmpl_inst_d); // br compl.
                                                  // retn has separate
                                                  // completion signal
   assign dtu_fcl_br_inst_d = dbr_inst_d | ibr_inst_d;
   assign dec_imd_call_inst_d = call_inst;

   // MV-BR Condition
   assign   cctype_sel_imov  =  op[1] & ~op3[4];
   assign   cctype_sel_fmov  =  op[1] & op3[4];
   assign   cctype_sel_bcc  = ~op[1] &  op2[1];
   assign   cctype_sel_bpcc = ~op[1] & ~op2[1];

   mux4ds  #(3) cctype_mux(.dout  (dec_dcl_cctype_d),
			                   .in0   ({dtu_inst_d[18], dtu_inst_d[12:11]}),
			                   .in1   (dtu_inst_d[13:11]),
			                   // op2[2]=1 for fp branch
			                   .in2   ({~op2[2], 2'b00}),
			                   .in3   ({~op2[2], dtu_inst_d[21:20]}),
			                   .sel0  (cctype_sel_imov),
			                   .sel1  (cctype_sel_fmov),
			                   .sel2  (cctype_sel_bcc),
			                   .sel3  (cctype_sel_bpcc));

   //-------------
   // ALU Controls
   //-------------
   // mov bit
   assign ifu_exu_aluop_d[2] = brsethi_inst & sethi_or_nop |   // sethi
                       	    arith_inst & op3_hi[2] & op3[3];   // mov, rd

   // aluop
   assign ifu_exu_aluop_d[1] = (arith_inst & 
	                              ((op3_hi[3] & (op3_lo[0] |   // wr
                                               op3_lo[2] |   // wrpr
                                               op3_lo[3])) | // wrhpr
				                         (~op3[5] & op3[1]))         // xor, or
                                );
				
   // aluop/mov type
   assign ifu_exu_aluop_d[0] = (arith_inst & 
	                              ((op3_hi[3] & (op3_lo[0] |
                                               op3_lo[2] |
                                               op3_lo[3])) | // wr
				                         (~op3[5] & op3[0])        | // xor, and
				                         (op3_hi[2] & op3_lo[15]))   // movr
                                );
   
   // invert rs2
   assign ifu_exu_invert_d  = arith_inst &
	                      (~op3[5] & op3[2]  |   // sub, andn, orn, xorn
	                       op3_hi[2] & (op3_lo[3] | op3_lo[1])); // tag sub

   assign ifu_exu_usecin_d   = arith_inst & ~op3[5] & op3[3];   // addc, subc

   // tagged ops
   assign ifu_exu_tagop_d = arith_inst & op3_hi[2] & ~op3[3] & ~op3[2] &
	                          fcl_dtu_inst_vld_d;
   assign ifu_exu_tv_d = ifu_exu_tagop_d & op3[1];
   assign ifu_exu_muls_d  = arith_inst & op3_hi[2] & op3_lo[4] & 
	                          ~swl_dec_divbusy_e & fcl_dtu_ely_inst_vld_d;

   // memory for ibr and ldst address range check
   assign ifu_exu_range_check_other_d = mem_inst & ~prefetch; // ld, st, atom
   assign ifu_exu_range_check_jlret_d = arith_inst & op3_hi[3] &    
                                        (op3_lo[8] | op3_lo[9]); // jmpl, retn
   
   //--------------
   // SHFT Controls
   //--------------
   // enable shifter and choose shift output
   // This can be simplified a great deal if MULScc could also be
   // decoded as a shift instruction.
   // 9/26/01: No can do! Mulscc is implemented now
   assign ifu_exu_enshift_d = arith_inst & op3_hi[2] &
                       	       (op3_lo[5] | op3_lo[6] | op3_lo[7]); 
   // unsigned or signed (1 => signed)
   assign ifu_exu_shiftop_d[0] = op3[0];
   // left or right (1 => right)
   assign ifu_exu_shiftop_d[1] = op3[1];
   // shift 32b or 64b (1 => 64)
   assign ifu_exu_shiftop_d[2] = dtu_inst_d[12];   // was sh32_64


   //-------------------
   // Writeback Controls
   //-------------------
   //  write to icc/xcc
   assign ifu_exu_setcc_d = arith_inst & 
	                     (op3_hi[1] & (~op3[3] | ~op3[1] & ~op3[0]) |
	                      op3_hi[2] & (~op3[3] & ~op3[2])); // tagged op
   //  write to rd
   assign ifu_exu_wen_d = ((~rd_00) & brsethi_inst & sethi_or_nop | // sethi
	                         (~rd_00) & arith_inst &  // all single cycle insts
	                         (~op3[5] & ~op3[3]    |     // alu ops
			                      ~op3[5] & op3_lo[8]  |     // addC
			                      ~op3[5] & op3_lo[12] |     // subC
			                      op3_hi[2] &                
			                      (~op3[3] & ~op3_lo[4] |    // shft, tag, ~muls
			                       // need to kill if rd to invalid reg
			                       // all vld regs will retn in W stage
			                       op3_lo[8] & ~rs1_0f | op3_lo[10]  | // rd
                             op3_lo[9] | // rdhpr
			                       op3_lo[12] | op3_lo[15])| // mov
			                      op3_hi[3] &
			                      (op3_lo[8]  |    // jmpl
			                       op3_lo[12] |    // save
			                       op3_lo[13] |    // restore
                             op3_lo[6] & int_align_d)  // vis int align
			                      )           |    
	                         call_inst);
   
   //-----------------
   // MUL/DIV Controls
   //-----------------
   // is mul
   assign dec_swl_mul_inst_d = (arith_inst &
				                        ((op3_hi[0] &
				                          (op3_lo[9]  |      // mulx
				                           op3_lo[10] |      // umul
				                           op3_lo[11])) |    // smul
				                         (op3_hi[1] &        
				                          (op3_lo[10] |      // umulcc
				                           op3_lo[11])))     // smulcc
				                        );

   assign ifu_exu_muldivop_d[4] = dec_swl_mul_inst_d & ~swl_dec_mulbusy_e & 
                                  fcl_dtu_ely_inst_vld_d;
   
   // is div
   assign dec_swl_div_inst_d = (arith_inst &
				                        ((op3_hi[0] &
				                          (op3_lo[13]  |     // udivx
				                           op3_lo[14]  |     // udiv
				                           op3_lo[15]))  |   // sdiv
				                         (op3_hi[2] & 
				                          (op3_lo[13]   |    // sdivx
				                           op3_lo[4]))  |    // muls
				                         (op3_hi[1] &
				                          (op3_lo[14] |      // udivcc
				                           op3_lo[15])))     // sdivcc
				                        );

   assign ifu_exu_muldivop_d[3] = dec_swl_div_inst_d & ~swl_dec_divbusy_e &
				                          op3[3] & fcl_dtu_ely_inst_vld_d; // not muls
   
   // 64b or 32b (1 => 64b)
   assign ifu_exu_muldivop_d[2] = ~op3[1];

   // signed or unsigned (1 => signed)
   assign ifu_exu_muldivop_d[1] = op3_hi[2] |          // sdivx
	                                (op3[1] & op3[0]);   // smul, sdiv
   // set cc as well?
   assign ifu_exu_muldivop_d[0] = op3[4];

   //-------------------------
   // FP controls
   //-------------------------

   // portion of vis that is actually an int instruction
   assign int_align_d = (~opf[8] & ~opf[7] & ~opf[6] & ~opf[5] & 
                         opf[4] & opf[3] & ~opf[2] & ~opf[0]);
   assign ifu_exu_ialign_d = arith_inst & op3_hi[3] & op3_lo[6] &
                             int_align_d & fcl_dtu_inst_vld_d;
   

   assign fpop1_d = arith_inst & op3_hi[3] & op3_lo[4];
   assign fpop2_d = arith_inst & op3_hi[3] & op3_lo[5];
   assign visop_d = arith_inst & op3_hi[3] & op3_lo[6];
   assign fpld_d = mem_inst & op3[5] & ~op3[3] & ~op3[2];

   // FP stores don't switch out and don't block the fpu
   assign dec_swl_fpop_d = (fpop1_d | fpop2_d | fpld_d | visop_d);
   assign allfp_d = (fpop1_d | fpop2_d | fpld_d | visop_d |
	                   mem_inst & op3[5] & ~op3[3] & op3[2]);
   assign dec_swl_allfp_d = allfp_d;

   assign ifu_ffu_ldfsr_d = op3_lo[1] & op3_hi[2] & ~rd[0];
   assign ifu_ffu_ldxfsr_d = op3_lo[1] & op3_hi[2] & rd[0];	  
   assign ifu_ffu_stfsr_d = op3_lo[5] & op3_hi[2];	  

   assign ifu_ffu_fpop1_d = fpop1_d & ~swl_dec_fpbusy_e & 
                            fcl_dtu_ely_inst_vld_d;
   assign ifu_ffu_fpop2_d = fpop2_d & ~swl_dec_fpbusy_e & 
                            fcl_dtu_ely_inst_vld_d;
   assign ifu_ffu_visop_d = visop_d & ~swl_dec_fpbusy_e & 
                            fcl_dtu_ely_inst_vld_d;

   assign ifu_ffu_fld_d =  mem_inst & op3[5] & ~op3[3] & ~op3[2] & 
			                     fcl_dtu_ely_inst_vld_d & ~swl_dec_fpbusy_e;
   
   assign ifu_ffu_fst_d =  mem_inst & op3[5] & ~op3[3] & op3[2] & 
		                       fcl_dtu_ely_inst_vld_d & ~swl_dec_fpbusy_e;

   // ldqf and stqf are not fpops
   assign quad_ffuop_d = (opf[1] & opf[0] & (fpop1_d | fpop2_d) |
	                        fpop1_d & opf[3] & opf[2] & // exc div
	                        ~(~opf[7] & opf[6] & ~opf[5])) &
	                         swl_dec_fp_enable_d & fcl_dtu_inst_vld_d;

   dff_s #(1) qope_ff(.din  (quad_ffuop_d),
		              .q    (ifu_ffu_quad_op_e),
		              .clk  (clk), .se(se), .si(), .so());

   // quiet traps -- flush the pipe but don't take a trap till later
//   assign dec_swl_qtrap_d = mem_inst & op3[5] & op3_lo[6] & fcl_dtu_inst_vld_d;  // stq
//   dff #(1) qtrpe_ff(.din  (dec_swl_qtrap_d),
//		   .q    (dtu_fcl_qtrap_e),
//		   .clk  (clk), .se(se), .si(), .so());

   // FP Enabled check
   assign fcc_branch_d = ~op[1] & ~op[0] & op3[5] & (op3[4] | op3[3]);
   assign fcc_mov_d = op[1] & ~op[0] & op3_hi[2] & op3_lo[12] & 
	                    ~dtu_inst_d[18];
   
   assign any_fpinst_d = allfp_d | fcc_branch_d | fcc_mov_d | 
                         arith_inst & op3_hi[2] & op3_lo[8] & rs1_13 | // rd gsr
                         arith_inst & op3_hi[3] & op3_lo[0] & rd_13;   // wr gsr
   
   assign fpdis_trap_d = any_fpinst_d & ~swl_dec_fp_enable_d & 
                         fcl_dtu_inst_vld_d;
   dff_s #(1) fpdise_ff(.din (fpdis_trap_d),
		                .q   (fpdis_trap_e),
		                .clk (clk), .se(se), .si(), .so());
   assign dtu_fcl_fpdis_e = fpdis_trap_e;

   // FRF dirty bits
   // bit 0 is the msb for double and quad
   assign dec_swl_frf_upper_d = rd[0] & (mem_inst & op3_lo[3] |  // fld
					                    fpop1_d & (opf[7] | opf[6] & opf[5]) & 
                                         (opf[3] | ~opf[2]) |
					                    fpop1_d & ~opf[7] & opf[1] & ~opf[0] |
					                    fpop2_d & opf[1] | 
                              visop_d & ~opf[0]);
   
   assign dec_swl_frf_lower_d = ~rd[0] & (mem_inst & op3_lo[3] |  // fld
					                    fpop1_d & (opf[7] | opf[6] & opf[5]) & 
                                          (opf[3] | ~opf[2]) |
					                    fpop1_d & ~opf[7] & opf[1] & ~opf[0] |
					                    fpop2_d & opf[1] | 
                              visop_d & ~opf[0]) |
				                      (fpop2_d & ~opf[1] |  // all sgl ops wrt lower
	                             fpop1_d & opf[7] & ~opf[3] & opf[2] |
                                     //bug 6470 - fdtoi,fstoi,fqtoi
	                             (fpop1_d & (opf[7:6]==2'b11) & (opf[3:2]==2'b00)) |
                                     //bug6470 - end
				                       fpop1_d & ~opf[7] & ~opf[1] & opf[0] |
                               visop_d & opf[0] |
				                       mem_inst & op3_lo[0] & op3[5]);
   
   
   //-------------------------
   // Special Reg R/W Controls
   //-------------------------
   // decode rs1
   assign rs1 = dtu_inst_d[18:14];
   assign rs1_00 = ~rs1[4] & ~rs1[3] & ~rs1[2] & ~rs1[1] & ~rs1[0]; // Y
   assign rs1_01 = ~rs1[4] & ~rs1[3] & ~rs1[2] & ~rs1[1] & rs1[0]; //
   assign rs1_02 = ~rs1[4] & ~rs1[3] & ~rs1[2] & rs1[1] & ~rs1[0];  // CCR
   assign rs1_05 = ~rs1[4] & ~rs1[3] & rs1[2] & ~rs1[1] & rs1[0]; // PC
   assign rs1_06 = ~rs1[4] & ~rs1[3] & rs1[2] & rs1[1] & ~rs1[0]; // fprs
   assign rs1_07 = ~rs1[4] & ~rs1[3] & rs1[2] & rs1[1] & rs1[0]; //
   assign rs1_0f = ~rs1[4] & rs1[3] & rs1[2] & rs1[1] & rs1[0];   // mem#
   assign rs1_10 = rs1[4] & ~rs1[3] & ~rs1[2] & ~rs1[1] & ~rs1[0];   
   assign rs1_12 = rs1[4] & ~rs1[3] & ~rs1[2] & rs1[1] & ~rs1[0];
   assign rs1_13 = rs1[4] & ~rs1[3] & ~rs1[2] & rs1[1] & rs1[0];
   assign rs1_14_15 = rs1[4] & ~rs1[3] & rs1[2] & ~rs1[1];   
   assign rs1_16_17 = rs1[4] & ~rs1[3] & rs1[2] & rs1[1];
   assign rs1_19 = rs1[4] & rs1[3] & ~rs1[2] & ~rs1[1] & rs1[0];
   assign rs1_1f = rs1[4] & rs1[3] & rs1[2] & rs1[1] & rs1[0];    // 
   assign rs1_1a = rs1[4] & rs1[3] & ~rs1[2] & rs1[1] & ~rs1[0]; // THR
   assign rs1_1b = rs1[4] & rs1[3] & ~rs1[2] & rs1[1] & rs1[0];
   assign rs1_1c_1f = rs1[4] & rs1[3] & rs1[2];
   assign rs1_09_0e = ~rs1[4] & rs1[3] &          // all window mgmt regs
	              (rs1[2] & ~rs1[1] | rs1[1] & ~rs1[0] |
		             rs1[0] & ~rs1[2]);

   // decode rd
   assign rd = dtu_inst_d[29:25];
   assign rd_00 = ~rd[4] & ~rd[3] & ~rd[2] & ~rd[1] & ~rd[0]; // mem#
   assign rd_01 = ~rd[4] & ~rd[3] & ~rd[2] & ~rd[1] & rd[0]; // 
   assign rd_04 = ~rd[4] & ~rd[3] & rd[2] & ~rd[1] & ~rd[0]; //  tick
   assign rd_05 = ~rd[4] & ~rd[3] & rd[2] & ~rd[1] & rd[0];  //  PC
   assign rd_06 = ~rd[4] & ~rd[3] & rd[2] & rd[1] & ~rd[0]; 
   assign rd_07 = ~rd[4] & ~rd[3] & rd[2] & rd[1] & rd[0]; 
   assign rd_09 = ~rd[4] & rd[3] & ~rd[2] & ~rd[1] & rd[0]; // CWP
   assign rd_0f = ~rd[4] & rd[3] & rd[2] & rd[1] & rd[0];   // not impl
   assign rd_10 = rd[4] & ~rd[3] & ~rd[2] & ~rd[1] & ~rd[0];   // gl
   assign rd_11 = rd[4] & ~rd[3] & ~rd[2] & ~rd[1] & rd[0];   // pic
   assign rd_12 = rd[4] & ~rd[3] & ~rd[2] & rd[1] & ~rd[0];   // not impl
   assign rd_13 = rd[4] & ~rd[3] & ~rd[2] & rd[1] & rd[0];   // GSR
   assign rd_18 = rd[4] & rd[3] & ~rd[2] & ~rd[1] & ~rd[0]; // stick   
   assign rd_1a = rd[4] & rd[3] & ~rd[2] & rd[1] & ~rd[0]; // Thr
   assign rd_1b = rd[4] & rd[3] & ~rd[2] & rd[1] & rd[0];
   assign rd_1c_1f = rd[4] & rd[3] & rd[2];
   assign rd_1f = rd[4] & rd[3] & rd[2] & rd[1] & rd[0];
   
   assign ifu_lsu_wsr_inst_d = arith_inst & fcl_dtu_ely_inst_vld_d & 
	                       op3_hi[3] & (op3_lo[0] | op3_lo[2] | op3_lo[3]);
   assign ifu_exu_wsr_inst_d = ifu_lsu_wsr_inst_d;

   assign ifu_tlu_rsr_inst_d = arith_inst & fcl_dtu_ely_inst_vld_d & 
	                       op3_hi[2] & (op3_lo[8] & ~rs1_0f | // ~membar
                                      op3_lo[9] |           // hpr
					                            op3_lo[10]);          // pr

   assign rdsr_done_d = arith_inst & op3_hi[2] & op3_lo[8] & ~mb_inst_d;
   assign rdpr_done_d = arith_inst & op3_hi[2] & (op3_lo[10] | op3_lo[9]);
   
   // all wrpr's except cwp are fixed length
   // 
   assign wsr_fixed_inst_d = arith_inst & op3_hi[3] & 
                               (op3_lo[2] & ~rd_09 |  // wrpr exc. cwp 
	                              op3_lo[0] & ~rd_1a |  // wr exc. thr
                                op3_lo[3]);           // wrhpr
   
	                     
   dff_s #(1) wre_ff(.din (wsr_fixed_inst_d),
		             .clk (clk),
		             .q   (wsr_fixed_inst_e),
		             .se  (se), .si(), .so());

   assign wsr_inst_next_e = (~dtu_inst_anull_e) & wsr_fixed_inst_e & 
	                          fcl_dtu_inst_vld_e;
   
   dff_s #(1) wrm_ff(.din (wsr_inst_next_e),
		             .clk (clk),
		             .q   (wsr_fixed_inst_m),
		             .se  (se), .si(), .so());

   dff_s #(1) wrw_ff(.din (wsr_fixed_inst_m),
		             .clk (clk),
		             .q   (wsr_fixed_inst_w),
		             .se  (se), .si(), .so());

   assign use_rsr_d_l = ~(ifu_tlu_rsr_inst_d | ibr_inst_d | call_inst);
   
   dff_s #(1) rdsre_ff(.din (use_rsr_d_l),
		               .clk (clk),
		               .q   (ifu_exu_use_rsr_e_l),
		               .se  (se), .si(), .so());

   assign flush_inst_d = fcl_dtu_inst_vld_d & arith_inst & 
	                       op3_hi[3] & op3_lo[11];

   dff_s #(1) flsh_ff(.din (flush_inst_d),
		              .q   (ifu_tlu_flsh_inst_e),
		              .clk (clk),
		              .se  (se), .si(), .so());
   

   // If machine state is changed kill the already fetched instructions
   assign state_chg_inst_d = ifu_lsu_wsr_inst_d | flush_inst_d |
	                           ifu_tlu_done_inst_d | ifu_tlu_retry_inst_d;

   
   dff_s #(1) schg_ff(.din (state_chg_inst_d),
		                .clk (clk),
		                .q   (state_chg_inst_e),
//		               .rst (reset),
		                .se  (se), .si(), .so());

//   assign sta_inst_d = mem_inst & op3[4] & fcl_dtu_inst_vld_d & 
//                       (~op3[5] & ~op3[3] & op3[2] |
//			                  op3[5] & (op3_lo[4] | op3_lo[7]) |
//			                  ~op3[5] & op3_lo[14]);
   assign sta_inst_d = mem_inst & op3[4] & op3[2] & fcl_dtu_inst_vld_d & ~prefetch;

   assign sta_nostf_d = mem_inst & op3[4] & fcl_dtu_inst_vld_d & 
                       (~op3[5] & ~op3[3] & op3[2] |
			                  ~op3[5] & op3_lo[14]);

   dff_s #(1) sta_ff (.din (sta_inst_d),
		              .clk (clk),
		              .q   (sta_inst_e),
		              .se  (se), .si(), .so());

   dff_s #(1) stanf_ff (.din (sta_nostf_d),
		                  .clk (clk),
		                  .q   (sta_nostf_e),
		                  .se  (se), .si(), .so());

  assign dec_swl_sta_inst_e = sta_nostf_e;
 
   // Mov qualification with inst_vld_e to FCL?  Done
   assign dtu_fcl_flush_sonly_e = (sta_inst_e & lsu_ifu_ldsta_internal_e |
                                   state_chg_inst_e);

   dff_s #(1) ds_ff(.din (fcl_dec_dslot_s),
                  .q   (dslot_d),
                  .clk (clk), .se(se), .si(), .so());

   // suppress ifetch if arch state changes in delay slot (if not 
   // suppressed, it may cause in error in the L2 for an unmapped 
   // address). 
//   assign dtu_ifq_kill_latest_d = ifu_lsu_wsr_inst_d | flush_inst_d |
//	                              ifu_tlu_done_inst_d | ifu_tlu_retry_inst_d |  
//                                sta_inst_d;
   assign dtu_ifq_kill_latest_d = (((arith_inst & op3_hi[3] & 
                                     (op3_lo[2] | op3_lo[3] | op3_lo[0]) |// wr
                                     mem_inst & op3[4] & op3[2]) & 
                                    fcl_dtu_ely_inst_vld_d) |
                                   fcl_dec_intr_vld_d) & dslot_d; // in DS

//   assign kill_for_sta_d = mem_inst & op3[4] & op3[2] & 
                           // ~op3[5] &  // sta - excl stf and pref
//                           fcl_dtu_ely_inst_vld_d & dslot_d; // in DS
   
//   dff #(1) kfste_ff(.din (kill_for_sta_d),
//                     .q   (kill_for_sta_e),
//                     .clk (clk), .se(se), .si(), .so());
//   assign dec_fcl_kill4sta_e = kill_for_sta_e;
   
   assign rd_ifusr_d = arith_inst & op3_hi[2] & 
	                     (op3_lo[9] & rs1_06    |  // rdhpr - ver
			                  op3_lo[8] & (rs1_05 |    // rdsr - pc
				                             rs1_1a |    // rdsr - thr
				                             rs1_06))  | // rdsr - fprs
		                     jmpl_inst_d |                    // jmpl
	                     call_inst;                         // call
   
   assign rd_exusr_d = arith_inst & op3_hi[2] &
	        (op3_lo[10] & rs1_09_0e |         // rdpr (wind)
			     op3_lo[8] & (rs1_00 | rs1_02));  // rdsr (y + ccr)

   assign rd_ffusr_d = arith_inst & op3_hi[2] &
			                 op3_lo[8] & rs1_13;  // rdsr (gsr)
   
   dff_s #(1) ifusr_ff(.din  (rd_ifusr_d),
		               .clk  (clk),
		               .q    (rd_ifusr_e),
		               .se   (se), .si(), .so());
   dff_s #(1) ffusr_ff(.din  (rd_ffusr_d),
		               .clk  (clk),
		               .q    (rd_ffusr_e),
		               .se   (se), .si(), .so());
   dff_s #(1) exusr_ff(.din  (rd_exusr_d),
		               .clk  (clk),
		               .q    (rd_exusr_e),
		               .se   (se), .si(), .so());

   // make sure they are exclusive
   assign ifu_exu_rd_ifusr_e = rd_ifusr_e;
   assign ifu_exu_rd_exusr_e = rd_exusr_e;
   assign ifu_exu_rd_ffusr_e = rd_ffusr_e;

   // choose which of IFU special regs should be read
   // call, jmpl or rdpc (05) => pc
   assign dec_fcl_rdsr_sel_pc_d = ~dtu_inst_d[31] | op3_hi[3] | ~rs1[1] & rs1[0];
   // read thread conf (1a) or fprs (06)
   assign dec_fcl_rdsr_sel_thr_d = dtu_inst_d[31] & op3_hi[2] & op3_lo[8] & ~rs1[0];
   // else version reg (rdhpr 06)

   //   dff #(1) rdfprs_ff(.din (rs1[4]),
   //		    .q   (dec_swl_rdsr_sel_thr_e),
   //		    .clk (clk), .se(se), .si(), .so());
   assign dec_swl_rdsr_sel_thr_d = rs1[4];

   assign wrt_tcr_d = arith_inst & fcl_dtu_inst_vld_d & 
	                    op3_hi[3] & op3_lo[0] & rd_1a;

   dff_s #(1) tcre_ff(.din  (wrt_tcr_d),
		                .clk  (clk),
		                .q    (wrt_tcr_e),
		                .se   (se), .si(), .so());

   assign wrt_tcr_qual_e = wrt_tcr_e & (~dtu_inst_anull_e) & 
					                               fcl_dtu_inst_vld_e;

   dff_s #(1) tcrm_ff(.din  (wrt_tcr_qual_e),
		              .clk  (clk),
		              .q    (wrt_tcr_m),
		              .se   (se), .si(), .so());
   
   dff_s #(1) tcrw_ff(.din  (wrt_tcr_m),
		              .clk  (clk),
		              .q    (dec_swl_wrt_tcr_w),
		              .se   (se), .si(), .so());

   // FPRS write
   assign wrt_fprs_d = arith_inst & fcl_dtu_inst_vld_d & 
	                     op3_hi[3] & op3_lo[0] & rd_06;
   dff_s #(1) fprse_ff(.din  (wrt_fprs_d),
		               .clk  (clk),
		               .q    (wrt_fprs_e),
		               .se   (se), .si(), .so());
   assign wrt_fprs_qual_e = wrt_fprs_e & (~dtu_inst_anull_e) & 
					                                 fcl_dtu_inst_vld_e;
   dff_s #(1) fprsm_ff(.din  (wrt_fprs_qual_e),
		               .clk  (clk),
		               .q    (wrt_fprs_m),
		               .se   (se), .si(), .so());
   dff_s #(1) fprsw_ff(.din  (wrt_fprs_m),
		               .clk  (clk),
		               .q    (dec_swl_wrtfprs_w),
		               .se   (se), .si(), .so());

   //----------------
   // RF/RML Controls
   //----------------
   // Reg Valid Signals for doing ECC

   //bug6777 - cas decode is incorrect
   //         ~(op3_hi[3] & dtu_inst_d[22] & mem_inst); // CAS
   assign ifu_exu_useimm_d = ~dtu_inst_d[31] | 
	                      dtu_inst_d[13] & 
	                     ~(op3_hi[3] & dtu_inst_d[22] & ~op3[0] & mem_inst); // CAS

   // alternately try: ~ren2_d | ~23 | ~22
   assign rs1_vld_d = (brsethi_inst & op2[1] & op2[0] |
		                   arith_inst & (~op3[5] |
				                             op3_hi[2] & ~op3[3] |
				                             op3_hi[2] & op3_lo[13] |
				                             op3_hi[2] & op3_lo[15] |
				                             op3_hi[3] & op3_lo[0]  |
				                             op3_hi[3] & op3_lo[2]  |
				                             op3_hi[3] & op3_lo[3]  |
				                             op3_hi[3] & op3_lo[5] & 
                                     ~opf[4] & ~opf[3] & opf[2] |  // fmovr
				                             op3_hi[3] & op3_lo[6] & int_align_d  |
				                             op3_hi[3] & op3[3] & ~op3[2] |
				                             op3_hi[3] & op3[3] & ~op3[1]) |
		                   mem_inst & (~op3[5] |
				                           ~op3[3] |
				                           op3[4] & op3[3] & op3[2]));

   assign ifu_exu_rs1_vld_d = rs1_vld_d;

   assign rs2_vld_d = (arith_inst & (~op3[5] |
				                             op3_hi[2] & (~op3[3] | op3[2]) |
				                             op3_hi[3] & op3_lo[0]  |
				                             op3_hi[3] & op3_lo[2]  |
				                             op3_hi[3] & op3_lo[3]  |
				                             op3_hi[3] & op3_lo[6] & int_align_d  |
				                             op3_hi[3] & op3[3] & ~op3[2] |
				                             op3_hi[3] & op3[3] & ~op3[1]) &
		                               ~dtu_inst_d[13] |
		                   mem_inst & (~op3[5] |
				                           ~op3[3]) & ~dtu_inst_d[13] |
		                   mem_inst & op3_hi[3] & (op3_lo[12] |   // cas
					                                     op3_lo[14]));

   assign ifu_exu_rs2_vld_d = rs2_vld_d;

   assign rs3_vld_d = mem_inst & (~op3[5] & ~op3[3] & op3[2] | // all st
				                          ~op3[5] & op3[3] & op3[2] | // swp,stx,ldstub
				                          op3_hi[3] & (op3_lo[12] |   // cas
					                                     op3_lo[14])) |
                      arith_inst & (op3_hi[2] & (op3_lo[12] | 
                                                 op3_lo[15]));
   
   // for std and stq(=stda) & ~stf
   assign rs4_vld_d = mem_inst & ~op3[5] & op3_lo[7];

   // rs3even = rs4 + rs3 & ~rd[0]
   // rs3odd = rs4 + rs3 & rd[0]
   // needs both to distinguish std
   assign ifu_exu_rs3e_vld_d = rs4_vld_d | rs3_vld_d & ~rd[0];
   assign ifu_exu_rs3o_vld_d = rs4_vld_d | rs3_vld_d & rd[0];

   // RML control signals
   assign ifu_exu_save_d = arith_inst & op3_hi[3] & op3_lo[12] & 
                           fcl_dtu_inst_vld_d;
   assign ifu_exu_restore_d = arith_inst & op3_hi[3] & fcl_dtu_inst_vld_d &
              	        (op3_lo[13] |       // restore
		                     op3_lo[9]);        // return
   assign ifu_exu_return_d = arith_inst & op3_hi[3] & op3_lo[9] & 
                             fcl_dtu_inst_vld_d;   

   assign save_retn_done_d = arith_inst & op3_hi[3] & (op3_lo[12] | op3_lo[9]);
   assign saved_d = arith_inst & op3_hi[3] & op3_lo[1] & ~dtu_inst_d[25] & 
                    fcl_dtu_inst_vld_d;
   assign restored_d = arith_inst & op3_hi[3] & op3_lo[1] & dtu_inst_d[25] & 
                     fcl_dtu_inst_vld_d;
   assign flushw_d = arith_inst & op3_hi[2] & op3_lo[11] & fcl_dtu_inst_vld_d;
   
   dff_s #(1) savd_ff(.din  (saved_d),
		              .clk  (clk),
		              .q    (ifu_exu_saved_e),
		              .se   (se), .si(), .so());
   dff_s #(1) restd_ff(.din  (restored_d),
		               .clk  (clk),
		               .q    (ifu_exu_restored_e),
		               .se   (se), .si(), .so());
   dff_s #(1) flushw_ff(.din  (flushw_d),
		                .clk  (clk),
		                .q    (ifu_exu_flushw_e),
		                .se   (se), .si(), .so());

   //-----------------------
   // TLU Controls and Traps
   //-----------------------
   // Done/Retry
   assign ifu_tlu_done_inst_d = arith_inst & op3_hi[3] & op3_lo[14] &
	                        fcl_dtu_ely_inst_vld_d & 
	                        ~dtu_inst_d[25];   // inst_d[25] = lsb of fcn
   assign ifu_tlu_retry_inst_d = arith_inst & op3_hi[3] & op3_lo[14] & 
	                        fcl_dtu_ely_inst_vld_d & dtu_inst_d[25];

   // SIR
   assign sir_inst_d = arith_inst & op3_hi[3] & op3_lo[0] & 
	               rs1_00 & rd_0f & dtu_inst_d[13];

//   assign kill_sir_d = sir_inst_d & ~(fcl_dtu_privmode_d | fcl_dtu_hprivmode_d);
//bug 6484 - flag sir instrn. to tlu only in hpriv mode
//   assign flag_sir_d = sir_inst_d & (fcl_dtu_privmode_d | fcl_dtu_hprivmode_d);

   assign flag_sir_d = sir_inst_d & fcl_dtu_hprivmode_d;

   dff_s #(1) sire_ff(.din (flag_sir_d),
		              .q   (sir_inst_e),
		              .clk (clk), .se(se), .si(), .so());
   assign dtu_fcl_sir_inst_e = sir_inst_e;

//bug 6484 - kill sir instrn. to tlu if bits other than opcode bits cause illegal instrn.
//   assign flag_sir_e = sir_inst_e & fcl_dtu_inst_vld_e & ~dtu_inst_anull_e;

   assign flag_sir_e = sir_inst_e & fcl_dtu_inst_vld_e & ~dtu_inst_anull_e & ~ill_inst_e;

   dff_s #(1) sirm_ff(.din (flag_sir_e),
		              .q   (ifu_tlu_sir_inst_m),
		              .clk (clk), .se(se), .si(), .so());
   

   // Privileged opcode trap
   assign fcn0 = ~rd[4] & ~rd[3] & ~rd[2] & ~rd[1];

	 //op3_lo[0] & rd[4] & ~(rd_12 | rd_13 | 
	 //rd[3] & ~rd_1a |
   //rd_1f)) | 

   assign privop_d = (op3_hi[3] & (op3_lo[14] | // done/retr
				                           op3_lo[2] |         // wrpr
                                   // & (~rd[4] & ~rd_0f | rd_10) |
                                   // op3_lo[3] |         // wrhpr
                                   // & valid_hp_rd_d |  
				                           op3_lo[1] |  // savd,restd
				                           op3_lo[0] & ((rd[4] & ~(rd_11 | rd_12 | rd_13 | rd_1b |
							                                             rd[3] & rd[2])) |
                                                rd_04)) | // wrasr
		                                                   
		                  op3_hi[2] & (op3_lo[10] |        // rdpr
                                   // & (~rs1[4] | rs1_10 | rs1_1f) |
                                   // op3_lo[9] |         // rdhpr
                                   // & valid_hp_rs_d |
				                           op3_lo[8] &           // rdasr & ~mem#
				                           (rs1_10 | rs1_16_17 | // perf + sftint
                                    rs1_19 | rs1_1a))    // stick, thrd stat
		                  ) & arith_inst & ~(fcl_dtu_privmode_d | 
                                         fcl_dtu_hprivmode_d);

   // hp regs 0,1,3 and 5, 6 and 1f are implemented
   // 6 is read only

   assign valid_hp_rd_d = (~rd[4] & ~rd[3] & rd[0] & 
                           (~rd[2] | ~rd[1]) |      // 1,3,5
                           rd_00 | rd_1f );          // 0, 1f
   assign valid_hp_rs_d = (~rs1[4] & ~rs1[3] & rs1[0] & 
                           (~rs1[2] | ~rs1[1]) |
                           rs1_00 | rs1_06 | rs1_1f);
   
   assign hprivop_d = arith_inst & ~fcl_dtu_hprivmode_d & 
                      (op3_hi[3] & op3_lo[3] |      // wrhpr
                       // & valid_hp_rd_d 
                       op3_hi[2] & op3_lo[9] |      // rdhpr
                       // & valid_hp_rs_d 
                       // bug 6484 ----
                       sir_inst_d |
                       //  ----
                       op3_hi[3] & op3_lo[0] & 
                          (rd_04 | rd_18) & fcl_dtu_privmode_d |   // wrsr s/tick
                       op3_hi[3] & op3_lo[2] & 
                          rd_04 & fcl_dtu_privmode_d);             // wrpr
          
   dff_s #(1) prope_ff(.din (privop_d),
		                 .q   (privop_e),
		                 .clk (clk), .se(se), .si(), .so());

   dff_s #(1) hprope_ff(.din (hprivop_d),
		                 .q   (hprivop_e),
		                 .clk (clk), .se(se), .si(), .so());
   assign dtu_fcl_privop_e = privop_e & ~hprivop_e;
//   assign dtu_fcl_hprivop_e = hprivop_e & ~dtu_inst_anull_e;   

   // Illegal Instruction Trap
   // when they are accessed.  
   assign inv_reg_access_d = arith_inst & (op3_hi[2] & op3_lo[8] &    // rd asr
					                                 (rs1_01 | rs1_07 |         // 1, 7
                                            ~rs1[4] & rs1[3] & ~rs1_0f |  // 8-E, F=mem#
					                                  rs1_12 | rs1_14_15 |      // 13 is gsr
                                                                   // 14-15 are WO
                                            rs1_1b | 
                                            rs1_1c_1f) |
   
					                                 op3_hi[3] & op3_lo[0] &   // wr asr
					                                 (rd_01 | rd_05 | rd_07 |
                                            ~rd[4] & rd[3] & ~rd_0f | // 8-E, F is sir
					                                  rd_12 | rd_1b | 
                                            rd_1c_1f)
                                           );

   // reserved field checking (more done in ill_inst check below)
   assign inst12_5_nonzero_d = (|dtu_inst_d[12:5]);
   assign inst11_8_nonzero_d = (|dtu_inst_d[11:8]);
   assign inst9_5_nonzero_d = (|dtu_inst_d[9:5]);
   assign rs2_nonzero_d = (|dtu_inst_d[4:0]);

   // rsv check is not complete, but most of the important 
   // holes are covered
   assign rsvchk_fail_d = (arith_inst & ((~op3[5] |  // arith
                                          op3_hi[2] & op3_lo[13] | // sdivx
                                          op3_hi[2] & ~op3[3] & ~op3[2] | // tag
                                          op3_hi[2] & op3_lo[4] |  // mulscc
                                          op3_hi[3] & op3_lo[11] | // flsh
                                          op3_hi[3] & op3[3] & ~op3[1]) & // sav,jmp
                                         ~dtu_inst_d[13] & inst12_5_nonzero_d |
   
                                         op3_hi[2] & (op3[3] & ~op3[2] &  // rd/rdpr
                                                      ~(rs1_0f & 
                                                        dtu_inst_d[13]) | // ~mem#
                                                      op3_lo[11]) &  // flshw
                                         (inst12_5_nonzero_d | 
                                          rs2_nonzero_d | 
                                          dtu_inst_d[13]) |
   
                                         op3_hi[3] & ~op3[3] & ~op3[2] & // wr/pr
                                         ~rd_0f &  // ~sir
                                         ~dtu_inst_d[13] & inst12_5_nonzero_d |
   
				                                 op3_hi[2] & op3_lo[12] &  // movcc
                                         ~dtu_inst_d[13] & 
                                         (inst9_5_nonzero_d | dtu_inst_d[10]) |
   
                                         op3_hi[2] & op3_lo[15] &  // movr
                                         ~dtu_inst_d[13] & 
                                         inst9_5_nonzero_d |

                                         op3_hi[3] & op3_lo[11] &  // flsh
                                         ~rd_00 |

                                         op3_hi[2] & op3_lo[11] &  // flshw
                                         (~rd_00 | ~rs1_00) |

				                                 op3_hi[2] & 
                                         (op3_lo[5] | op3_lo[6] | 
                                          op3_lo[7]) & // shft
                                         (inst11_8_nonzero_d |
                                          dtu_inst_d[7] |
                                          dtu_inst_d[6] |
                                          dtu_inst_d[5] & (~dtu_inst_d[12] |
                                                           ~dtu_inst_d[13]))
                                         ) |
   
		                       mem_inst & (~op3[4] & ~dtu_inst_d[13] &  // ld/st
                                       inst12_5_nonzero_d |
                                       op3_hi[3] & 
                                       (op3_lo[12] | op3_lo[14]) &  // cas
                                       dtu_inst_d[13] & inst12_5_nonzero_d) |
				       
				       ((op[1] & ~op[0]) & (op3[5] & op3[4] & op3[3] & ~op3[2] & ~op3[1] & op3[0]) & |rd) // RETURN(rd != 0), bug 4490

                           );
   


   assign ill_inst_d = (brsethi_inst & (~op2[2] & ~op2[1] & ~op2[0] |  // ill inst
					                              op2[2] & op2[1] & op2[0] | // null
					                              op2[1] & op2[0] &  // wrong bpr cond
					                              (~dtu_inst_d[25] & ~dtu_inst_d[26] |
                                         dtu_inst_d[28]) | // b28 has to be 0
					                              ~op2[2] & ~op2[1] & op2[0] & // bpcc
					                              dtu_inst_d[20]) |
			                  arith_inst & (op3_hi[1] & (op3_lo[9] | op3_lo[13]) |
				                              op3_hi[3] & (op3_lo[15] | // null
						                                       op3_lo[7]) | // impdep2
				                              op3_hi[3] & op3_lo[14] & 
				                              (~fcn0 | fcl_dtu_tlzero_d |
                                       rs2_nonzero_d | inst12_5_nonzero_d |
                                       dtu_inst_d[13] | ~rs1_00) |  // done/retr
				                              op3_hi[2] & op3_lo[12] & // movcc
				                              dtu_inst_d[18] & dtu_inst_d[11] |
				                              op3_hi[2] & op3_lo[15] &  // movr
				                              ~dtu_inst_d[11] & ~dtu_inst_d[10] |
				                              op3_hi[2] & op3_lo[14] | // popc
				                              op3_hi[2] & op3_lo[9] &  //rdhpr
                                      (~valid_hp_rs_d | rs1_01 & fcl_dtu_tlzero_d) |
				                              op3_hi[2] & op3_lo[10] &      // rdpr
				                              (rs1[4] & ~rs1_10 | // not gl
                                       rs1_0f | 
				                               ~rs1[4] & ~rs1[3] & ~rs1[2] & fcl_dtu_tlzero_d) |
				                              op3_hi[2] & op3_lo[8] & 
                                      (rs1_0f & (~rd_00 |
                                                 dtu_inst_d[12] |
                                                 dtu_inst_d[7] |
                                                 inst11_8_nonzero_d)) | // mem#
				                              op3_hi[3] & op3_lo[1] & 
                                      (~fcn0 | ~rs1_00 | rs2_nonzero_d |
                                       inst12_5_nonzero_d |
                                       dtu_inst_d[13]) | // savd, restd
				                              op3_hi[3] & op3_lo[10] & 
                                      (inst11_8_nonzero_d |
                                       dtu_inst_d[7] & 
                                       ~(fcl_dtu_privmode_d |
                                         fcl_dtu_hprivmode_d) |
                                       dtu_inst_d[29] |
                                       ~dtu_inst_d[13] & (dtu_inst_d[6] |
                                                          dtu_inst_d[5])) |// tcc
                                      op3_hi[3] & op3_lo[3] &   // wrhpr
                                      (~valid_hp_rd_d | rd_01 & fcl_dtu_tlzero_d) |
				                              op3_hi[3] & op3_lo[2] &   // wrpr
				                              (rd[4] & ~rd_10 | rd_0f | // gl=0x10
				                               ~rd[4] & ~rd[3] & ~rd[2] & fcl_dtu_tlzero_d) |
				                              op3_hi[3] & op3_lo[0] &  
				                              (rd_0f & ~(rs1_00 & dtu_inst_d[13]))  // sir
                                      ) |
			                  mem_inst & (~op3[5] & op3_lo[12] |
				                            op3[5] & (op3_lo[2] | op3_lo[6]) | // stqf, ldqf
				                            op3[5] & op3[3] & ~op3[2] |
				                            op3_hi[2] & (op3_lo[12] | 
						                                     op3_lo[14] | op3_lo[15]) |
				                            op3_hi[3] & (op3_lo[1] | op3_lo[5] |
						                                     op3_lo[15]) |    //  null
				                            ~op3[5] & op3_lo[3] & rd[0] | // ldd w/ odd rd
				                            op3[5] & op3_lo[1] & ~fcn0 |  // ldfsr
				                            op3[5] & op3_lo[13] & // prefetch
				                              illegal_prefetch |
				                            op3[5] & op3_lo[5] & ~fcn0 | // stfsr
				                            ~op3[5] & op3_lo[7] & rd[0])  | // std w/ odd rd
			                  inv_reg_access_d |
                        rsvchk_fail_d);
   
   dff_s #(1) illinste_ff(.din (ill_inst_d),
		                  .q   (ill_inst_e),
		                  .clk (clk), .se(se), .si(), .so());
   assign dtu_fcl_illinst_e = (ill_inst_e | 
//                               imask_hit_e |
                               hprivop_e);
   
				    
   //-------------
   // LSU Controls
   //-------------
   // prefetch
   assign prefetch    = op3_lo[13] & op3[5];

   assign impl_prefetch = ~rd[4] & ~rd[3] & ~rd[2] | // 0-3
                           rd[4] & ~rd[3];           // 10-17 (hex)
   assign noop_prefetch = rd_04 | rd[4] & rd[3];     // 4, 18-1f
      
   assign illegal_prefetch = ~rd[4] & rd[2] & (rd[1] | rd[0]) | // 5-7
                             ~rd[4] & rd[3];                    // 8-f
   
   assign prefetch_d = mem_inst & prefetch & impl_prefetch & 
                       fcl_dtu_inst_vld_d;
   assign pref_done_d = mem_inst & prefetch & noop_prefetch;

   assign dec_swl_ll_done_d = (pref_done_d | rdsr_done_d | rdpr_done_d |
                               save_retn_done_d);

   // alt space
   assign lstype_d[2] = mem_inst & op3[4] & fcl_dtu_inst_vld_d;
   // store
   assign lstype_d[1] = mem_inst & op3[2] & ~prefetch & fcl_dtu_inst_vld_d &
                        ~quad_ffuop_d;
   // load
   assign lstype_d[0] = mem_inst & ~prefetch & fcl_dtu_inst_vld_d &
	                      (~op3[2] | op3[3]) & (~op3_lo[14] | op3[5]) &
                        ~quad_ffuop_d;

   
   // only the stda instruction needs to be flagged
   assign dec_swl_std_inst_d = mem_inst & op3_hi[1] & op3_lo[7] &
	                             fcl_dtu_inst_vld_d;
   
   assign sext_d = op3[3] & ~op3[2]; // load sign extension
   assign ldstub_d = mem_inst & ~op3[5] & op3_lo[13] & fcl_dtu_inst_vld_d;
   assign casa_d = mem_inst & op3[5] & (op3_lo[12] | op3_lo[14]) & 
                                         fcl_dtu_inst_vld_d;
   assign swap_d = mem_inst & op3_lo[15] & fcl_dtu_inst_vld_d;

   // load inst for speculation
   // fp loads are not speculated on
   // ldd is not speculated on
   assign dec_swl_ld_inst_d = mem_inst & ~op3[2] & 
	                            ~op3[5] & ~op3_lo[3];

   // store, atomic or flush inst for stb flow control
   // TBD: no need to full decode this if timing is a problem
   assign dec_swl_st_inst_d = mem_inst & op3[2] |   // st, pref, cas, ldstb
                              arith_inst & op3_hi[3] & op3_lo[11];  // flsh
   
   // size(out) 00-b 01-h 10-w 11-x/q/d
   assign lssize_d[0] =  (op3[1] & ~op3_lo[15]) |   // stx,ld/sth,ld/stq, 
                                                    // ldx, ldd, std, ~swap
			                     op3[5] & (op3_lo[1] | op3_lo[5]) & rd[0]; // ldxfsr
   

   assign lssize_d[1] =  ~(op3[1]^op3[0])      |  // ~ld/st b,h
                          (op3[5] & op3_lo[2]) |  // ld/stq 
                          op3_lo[14]           |  // stx, casx
	                        op3_hi[2] & (op3_lo[1] | op3_lo[5]);  // ldst fsr

   assign ifu_ffu_ldst_size_d = ~(op3[1] & op3[0]); // ldf, stf
//   assign ifu_ffu_ldst_size_d[1] = op3[1] & op3[0];    // lddf, stdf
   

   assign ldst_fp_d   =  op3[5] & ~op3[3] & fcl_dtu_inst_vld_d & 
                         ~swl_dec_fpbusy_e;

   assign ldst_dbl_d  =  (~op3[3] & op3[1] & op3[0] | // ldd(f), std(f)
	                        op3[5] & (op3_lo[2] | op3_lo[6])) &   // ldq, stq
			                     fcl_dtu_inst_vld_d;

   // mem bar
   assign mb_mask_d = dtu_inst_d[1] |   // #storeload
	                    dtu_inst_d[5] |   // #memissue
  	                  dtu_inst_d[6];    // #sync
   
   assign mb_inst_d = arith_inst & op3_hi[2] & op3_lo[8] & 
	                    rs1_0f & rd_00 & fcl_dtu_inst_vld_d & 
	                    dtu_inst_d[13] & mb_mask_d;


   dff_s #(3) lstype_reg(.din (lstype_d),
		                 .clk (clk),
		                 .q   (lstype_e),
		                 .se  (se), .si(), .so());
   dff_s #(2) lssize_reg(.din (lssize_d),
		                 .clk (clk),
		                 .q   (ifu_lsu_ldst_size_e),
		                 .se  (se), .si(), .so());
   dff_s #(1) lsfp_reg(.din (ldst_fp_d),
		               .clk (clk),
		               .q   (ifu_lsu_ldst_fp_e),
		               .se  (se), .si(), .so());
   dff_s #(1) lsdbl_reg(.din (ldst_dbl_d),
		                .clk (clk),
		                .q   (ifu_lsu_ldst_dbl_e),
		                .se  (se), .si(), .so());

   dff_s #(1) sext_reg(.din(sext_d),
                     .clk(clk),
                     .q(ifu_lsu_sign_ext_e),
                     .se(se), .si(), .so());
   dff_s #(1) casa_reg(.din(casa_d),
                     .clk(clk),
                     .q(casa_e),
                     .se(se), .si(), .so());
   dff_s #(1) ldstub_reg(.din(ldstub_d),
                       .clk(clk),
                       .q(ifu_lsu_ldstub_e),
                       .se(se), .si(), .so());
   dff_s #(1) swap_reg(.din(swap_d),
                     .clk(clk),
                     .q(ifu_lsu_swap_e),
                     .se(se), .si(), .so());

   dff_s #(1) pfe_ff(.din (prefetch_d),
                   .q   (prefetch_e),
                   .clk (clk), .se(se), .si(), .so());

   dff_s #(1) mb_ff(.din (mb_inst_d),
		            .q   (mb_inst_e),
		            .clk (clk),
                .se(se), .si(), .so());

   assign ifu_lsu_casa_e = casa_e;
   assign ifu_exu_casa_d = casa_d;

//   assign ifu_lsu_ld_inst_e = lstype_e[0] & (~dtu_inst_anull_e) & 
//			                          ~ifu_ffu_quad_op_e & fcl_dtu_inst_vld_e;
//   assign ifu_lsu_st_inst_e = lstype_e[1] & (~dtu_inst_anull_e) & 
//			                          ~ifu_ffu_quad_op_e & fcl_dtu_inst_vld_e;

   assign ifu_lsu_ld_inst_e = lstype_e[0];
   assign ifu_lsu_st_inst_e = lstype_e[1];

   // temporary
//   assign ifu_lsu_alt_space_e = lstype_e[2] & ~dtu_inst_anull_e & 
//	                              fcl_dtu_inst_vld_e;

   assign ifu_lsu_alt_space_e = lstype_e[2];
   assign ifu_lsu_alt_space_d = mem_inst & op3[4] & fcl_dtu_inst_vld_d;
   assign ifu_tlu_alt_space_d = op3[4] & fcl_dtu_ely_inst_vld_d;
//   assign ifu_lsu_imm_asi_vld_d = op3[4] & ~dtu_inst_d[13];
   assign ifu_lsu_memref_d = mem_inst & fcl_dtu_ely_inst_vld_d;
   
   assign ifu_tlu_mb_inst_e = mb_inst_e & ~dtu_inst_anull_e & 
	                            fcl_dtu_inst_vld_e;

   assign ifu_lsu_pref_inst_e = fcl_dtu_inst_vld_e & prefetch_e &
                                ~dtu_inst_anull_e;

   //------------
   // IMASK
   //------------
   assign rs2_hit = (dtu_inst_d[4:0] == erb_dtu_imask[4:0]);
   assign opf_hit = (dtu_inst_d[12:5] == erb_dtu_imask[12:5]);
   assign ibit_hit = (dtu_inst_d[13] == erb_dtu_imask[13]);
   assign rs1_hit = (dtu_inst_d[18:14] == erb_dtu_imask[18:14]);
   assign op3_hit = (dtu_inst_d[24:19] == erb_dtu_imask[24:19]);
   assign rd_hit = (dtu_inst_d[29:25] == erb_dtu_imask[29:25]);
   assign op_hit = (dtu_inst_d[31:30] == erb_dtu_imask[31:30]);

   assign imask_hit = (rs2_hit  | ~erb_dtu_imask[32]) &
                      (opf_hit  | ~erb_dtu_imask[33]) &
                      (ibit_hit | ~erb_dtu_imask[34]) &
                      (rs1_hit  | ~erb_dtu_imask[35]) &
                      (op3_hit  | ~erb_dtu_imask[36]) &
                      (rd_hit   | ~erb_dtu_imask[37]) &
                      (op_hit   | ~erb_dtu_imask[38]) &
                      (|erb_dtu_imask[38:32]) & 
                      fcl_dtu_inst_vld_d;
   
   dff_s #(1) imsk_ff(.din (imask_hit),
		              .q   (imask_hit_e),
		              .clk (clk), .se(se), .si(), .so());
   assign dtu_fcl_imask_hit_e = imask_hit_e & swl_dec_ibe_e;
   

   //-------------
   // SPU Controls
   //-------------

//   assign scpy_inst_d = arith_inst & op3_hi[3] & op3_lo[7] & // use impdep 2
//	                ~dtu_inst_d[13] & dtu_inst_d[12];    // i=0 always
//   assign scmp_inst_d = arith_inst & op3_hi[3] & op3_lo[7] & 
//	                ~dtu_inst_d[13] & ~dtu_inst_d[12];
//
//   dff #(1) scpy_ff (.din (scpy_inst_d),
//		   .clk (clk),
//		   .q   (scpy_inst_e),
//		   .se  (se), .si(), .so());
//
//   assign ifu_spu_scpy_inst_e = scpy_inst_e & ~dtu_inst_anull_e & 
//	                        fcl_dtu_inst_vld_e;
//   
//   dff #(1) scmp_ff (.din (scmp_inst_d),
//		   .q   (scmp_inst_e),
//		   .clk (clk), .se  (se), .si(), .so());
//
//   assign ifu_spu_scmp_inst_e = scmp_inst_e & ~dtu_inst_anull_e & 
//	                        fcl_dtu_inst_vld_e;
//
//
   
endmodule // sparc_ifu_dec

// Local Variables:
// verilog-library-directories:("../rtl" ".")
// End:
