// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: sparc_ifu_imd.v
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
//  Module Name: sparc_ifu_imd
//  Description:	
//  Contains the immediate operand datapath.  Has two outputs:  The
//  simm data to the EXU and the branch offset to the IFU.
*/


module sparc_ifu_imd(/*AUTOARG*/
   // Outputs
   ifu_exu_imm_data_d, dtu_inst_d, ifu_exu_rd_d, ifu_lsu_rd_e, 
   ifu_lsu_imm_asi_d, ifu_tlu_imm_asi_d, ifu_lsu_imm_asi_vld_d, ifu_tlu_sraddr_d, 
   ifu_tlu_sraddr_d_v2, imd_dcl_brcond_d, imd_dcl_mvcond_d, 
   imd_dcl_abit_d, so, ifu_ffu_frs1_d, ifu_ffu_frs2_d, ifu_ffu_frd_d, 
   ifu_ffu_fpopcode_d, ifu_ffu_fcc_num_d, 
   // Inputs
   rclk, se, si, fdp_dtu_inst_s, fcl_imd_oddwin_d, 
   dcl_imd_immdata_sel_simm13_d_l, dcl_imd_immdata_sel_movcc_d_l, 
   dcl_imd_immdata_sel_sethi_d_l, dcl_imd_immdata_sel_movr_d_l, 
   dcl_imd_broff_sel_call_d_l, dcl_imd_broff_sel_br_d_l, 
   dcl_imd_broff_sel_bcc_d_l, dcl_imd_broff_sel_bpcc_d_l, 
   dcl_imd_immbr_sel_br_d, dcl_imd_call_inst_d
   );

   input rclk, 
         se, 
         si;

   input [31:0] fdp_dtu_inst_s;          // instruction from fetch

   input        fcl_imd_oddwin_d;       // are we in an even or odd window
   
   input        dcl_imd_immdata_sel_simm13_d_l,  // imm data selects
		            dcl_imd_immdata_sel_movcc_d_l,
		            dcl_imd_immdata_sel_sethi_d_l,
		            dcl_imd_immdata_sel_movr_d_l;
   
   input        dcl_imd_broff_sel_call_d_l,      // dir branch offset select
		            dcl_imd_broff_sel_br_d_l,
		            dcl_imd_broff_sel_bcc_d_l,
		            dcl_imd_broff_sel_bpcc_d_l;

   input        dcl_imd_immbr_sel_br_d;  // use branch offset or simm data
   input        dcl_imd_call_inst_d;
   
   output [31:0] ifu_exu_imm_data_d;      // imm data to EXU
   output [31:0] dtu_inst_d;              // D stage inst to DEC

   output [4:0]  ifu_exu_rd_d,
		             ifu_lsu_rd_e;
   
   output [7:0]  ifu_lsu_imm_asi_d;       // ASI for ldA and stA
   output [8:0]  ifu_tlu_imm_asi_d;       // ASI for ldA and stA
   output        ifu_lsu_imm_asi_vld_d;
   output [6:0]  ifu_tlu_sraddr_d;
   output [6:0]  ifu_tlu_sraddr_d_v2;
   output [3:0]  imd_dcl_brcond_d;
   output [7:0]  imd_dcl_mvcond_d;

   output        imd_dcl_abit_d;         // anull bit for cond branch

   output        so;

   output [4:0]  ifu_ffu_frs1_d,
		             ifu_ffu_frs2_d,
		             ifu_ffu_frd_d;

   output [8:0]  ifu_ffu_fpopcode_d;
   output [1:0]  ifu_ffu_fcc_num_d;
	 

//-----------------------------------
// Declaration of local signals
//----------------------------------
   wire [4:0]  sraddr5;

   wire [31:0] imm_data_d;       // imm data 

   wire [31:0] dtu_inst_d,
		           simm13,
		           simm11,
		           simm10,
		           imm22,
		           dbr16,
		           dbcc22_nopred,
		           dbcc19_pred,
		           dcall,
		           broffset_d;
   
   wire        clk, ifu_lsu_imm_asi_vld_f;
   
   
//----------------------------------------------------------------------
// Code starts here 
//----------------------------------------------------------------------
   assign      clk = rclk;
   
   //--------
   // S Stage
   // Contains mostly random logic to help with decode in D stage
   //--------
   
   // Regfile operations:
   // REMOVED
//   assign ifu_exu_rs1_s = fdp_dtu_inst_s[18:14] ^ 
//			  {{fdp_dtu_inst_s[17] & dcl_imd_oddwin_s},  4'b0000};

//   assign ifu_exu_rs2_s = fdp_dtu_inst_s[4:0] ^ 
//			  {{fdp_dtu_inst_s[3] & dcl_imd_oddwin_s},  4'b0000};

//   assign ifu_exu_rs3_s = fdp_dtu_inst_s[29:25] ^ 
//			  {{fdp_dtu_inst_s[28] & dcl_imd_oddwin_s},  4'b0000};

//   assign imd_dcl_op_s = fdp_dtu_inst_s[31:30];
//   assign imd_dcl_op3_s = fdp_dtu_inst_s[24:19];
   
   //--------
   // D stage
   // Contains the immediate data and branch offset muxes
   //--------
   
   dff_s #(32) inst_d_reg(.din  (fdp_dtu_inst_s),
		      .clk  (clk),
		      .q    (dtu_inst_d),
		      .se   (se), .si(), .so());

   dff_s #(1) ifu_lsu_imm_asi_inst(.din  (fdp_dtu_inst_s[13]),
                      .clk  (clk),
                      .q    (ifu_lsu_imm_asi_vld_f),
                      .se   (se), .si(), .so());

   assign imd_dcl_abit_d = dtu_inst_d[29];

   // imm data select
   // sext12:0 -- add/sub/and/or/xor/taggedOP/jmpl/ld/store/atomic/div/mul/popc
   //             prefetch/return/restore/save/sir/wr/shft/flush
   //  !!!CAS does not use Imm data!!!
   //
   // sext10:0 -- movcc
   // sext9:0  -- movr
   // 21:0,10'b0 -- sethi

   assign simm13 = {{19{dtu_inst_d[12]}},dtu_inst_d[12:0]};
   assign simm11 = {{21{dtu_inst_d[10]}},dtu_inst_d[10:0]};
   assign simm10 = {{22{dtu_inst_d[9]}},dtu_inst_d[9:0]};
   assign imm22  = {dtu_inst_d[21:0], 10'b0};

   dp_mux4ds  #(32) immdata_mux(.dout (imm_data_d),
			  .in0  (simm13),
			  .in1  (simm11),
			  .in2  (simm10),
			  .in3  (imm22),
			  .sel0_l (dcl_imd_immdata_sel_simm13_d_l),
			  .sel1_l (dcl_imd_immdata_sel_movcc_d_l),
			  .sel2_l (dcl_imd_immdata_sel_movr_d_l),
			  .sel3_l (dcl_imd_immdata_sel_sethi_d_l));


   // branch offset select
   assign dbr16 = {{14{dtu_inst_d[21]}}, dtu_inst_d[21:20], 
		   dtu_inst_d[13:0], 2'b0};
   assign dbcc22_nopred = {{8{dtu_inst_d[21]}}, dtu_inst_d[21:0], 2'b0};
   assign dbcc19_pred = {{11{dtu_inst_d[18]}}, dtu_inst_d[18:0], 2'b0};
   assign dcall = {dtu_inst_d[29:0], 2'b0};

   dp_mux4ds  #(32) broffset_mux(.dout   (broffset_d[31:0]),
			   .in0    (dcall[31:0]),          // call
			   .in1    (dbr16[31:0]),          // br on reg
			   .in2    (dbcc22_nopred[31:0]),  // branch w/o pred
			   .in3    (dbcc19_pred[31:0]),    // branch w/ pred
			   .sel0_l (dcl_imd_broff_sel_call_d_l),
			   .sel1_l (dcl_imd_broff_sel_br_d_l),
			   .sel2_l (dcl_imd_broff_sel_bcc_d_l),
			   .sel3_l (dcl_imd_broff_sel_bpcc_d_l));

   dp_mux2es #(32) immbr_mux(.dout (ifu_exu_imm_data_d[31:0]),
			   .in0  (imm_data_d[31:0]),
			   .in1  (broffset_d[31:0]),
			   .sel  (dcl_imd_immbr_sel_br_d));

   // branch/move condition to dcl
   assign imd_dcl_brcond_d = dtu_inst_d[28:25];
   assign imd_dcl_mvcond_d = dtu_inst_d[17:10];

   // if call instruction set rd = 0f (15)
   assign ifu_exu_rd_d[3:0] = dtu_inst_d[28:25] | {4{dcl_imd_call_inst_d}};
   assign ifu_exu_rd_d[4] = (dtu_inst_d[29] & ~dcl_imd_call_inst_d) ^
			      (ifu_exu_rd_d[3] & fcl_imd_oddwin_d);
   
   dff_s #(5) rde_ff(.din (ifu_exu_rd_d[4:0]),
		 .clk (clk),
		 .q   (ifu_lsu_rd_e[4:0]),
		 .se  (se), .si(), .so());

   // read/write pr and read/write sr
   dp_mux2es #(5)  sraddr_mux(.dout (sraddr5[4:0]),
			    .in0  (dtu_inst_d[18:14]),  // rs1 for rdpr
			    .in1  (dtu_inst_d[29:25]),  // rd  for wrpr
			    .sel  (dtu_inst_d[23]));

   assign ifu_tlu_sraddr_d = {dtu_inst_d[19],                     // hpriv
                              {dtu_inst_d[20] & ~dtu_inst_d[19]}, // priv
                              sraddr5[4:0]};
   assign ifu_tlu_sraddr_d_v2 = ifu_tlu_sraddr_d;
   

   // asi fields for stA, ldA
   // same as fpopcode_d

   assign ifu_lsu_imm_asi_d[7:0] = dtu_inst_d[12:5];
   assign ifu_tlu_imm_asi_d[8:0] = dtu_inst_d[13:5];

   assign ifu_lsu_imm_asi_vld_d = ~ifu_lsu_imm_asi_vld_f;
   
   // fp reg fields
   assign ifu_ffu_frd_d = dtu_inst_d[29:25];
   assign ifu_ffu_fcc_num_d = dtu_inst_d[26:25];
   assign ifu_ffu_frs1_d = dtu_inst_d[18:14];
   assign ifu_ffu_fpopcode_d = dtu_inst_d[13:5];
   assign ifu_ffu_frs2_d = dtu_inst_d[4:0];
   
endmodule // sparc_ifu_imd
