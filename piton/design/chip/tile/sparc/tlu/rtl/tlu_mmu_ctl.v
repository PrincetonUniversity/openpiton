// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_mmu_ctl.v
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
//	Description:	MMU Control - I & D.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the 
					// time scale definition
`ifndef NO_RTL_CSM
`include "define.tmp.h"
`endif

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module tlu_mmu_ctl ( /*AUTOARG*/
   // Outputs
   dmmu_any_sfsr_wr, dmmu_sfsr_wr_en_l, dmmu_sfar_wr_en_l, 
   immu_any_sfsr_wr, immu_sfsr_wr_en_l, immu_tsb_rd_en, tlu_tte_tag_g, 
   tlu_dtlb_rw_index_vld_g,  tlu_dtlb_rw_index_g, 
   tlu_dtlb_data_rd_g, tlu_dtlb_tag_rd_g, tlu_itlb_rw_index_vld_g, 
   tlu_itlb_wr_vld_g, itlb_wr_vld_g, tlu_itlb_rw_index_g, 
   tlu_itlb_data_rd_g, tlu_itlb_tag_rd_g, tlu_idtsb_8k_ptr, 
   tlu_dtlb_invalidate_all_g, tlu_itlb_invalidate_all_g, tlu_slxa_thrd_sel, 
   tlu_lsu_ldxa_tid_w2, tlu_itlb_dmp_vld_g, 
   tlu_itlb_dmp_all_g, tlu_itlb_dmp_pctxt_g, tlu_itlb_dmp_actxt_g, 
   tlu_itlb_dmp_nctxt_g, tlu_dtlb_dmp_vld_g, tlu_dtlb_dmp_all_g, 
   tlu_dtlb_dmp_pctxt_g, tlu_dtlb_dmp_sctxt_g, tlu_dtlb_dmp_nctxt_g, 
   tlu_dtlb_dmp_actxt_g, tlu_idtlb_dmp_thrid_g, tlu_dmp_key_vld_g, 
   tlu_int_asi_load, tlu_int_asi_store, tlu_int_asi_thrid, 
   tlu_int_asi_vld, tlb_access_rst_l, 
   tlu_lsu_stxa_ack, tlu_lsu_stxa_ack_tid, mra_wr_ptr, mra_rd_ptr, 
   mra_wr_vld, mra_rd_vld, tag_access_wdata_sel, 
   tlu_admp_key_sel, mra_byte_wen,
   tlu_tte_wr_pid_g, tlu_lsu_ldxa_async_data_vld, tlu_tte_real_g, 
   tlu_ldxa_l1mx1_sel, tlu_ldxa_l1mx2_sel, tlu_ldxa_l2mx1_sel, 
   lsu_ifu_inj_ack, tlu_tlb_tag_invrt_parity,  tlu_tlb_data_invrt_parity, 
   tlu_sun4r_tte_g, so, lsu_exu_ldxa_m, tlu_lng_ltncy_en_l, 
   tlu_tag_access_ctxt_sel_m, tlu_tsb_rd_ps0_sel, tlu_tlb_access_en_l_d1,
`ifndef NO_RTL_CSM
   tlu_dtlb_csm_rd_g,tlu_itlb_csm_rd_g, 
   tlu_itlb_wr_csm_sel_g, tlu_dtlb_wr_csm_sel_g,
`endif
   // Inputs
   ifu_lsu_ld_inst_e, ifu_lsu_st_inst_e, spu_tlu_rsrv_illgl_m,
   lsu_tlu_dmmu_miss_g, 
   tlu_dtsb_split_w2, tlu_dtsb_size_w2, tlu_dtag_access_w2, tlu_itsb_split_w2, 
   tlu_itsb_size_w2, tlu_ctxt_cfg_w2, lsu_tlu_st_rs3_data_g, 
   lsu_tlu_st_rs3_data_b48_g, lsu_tlu_st_rs3_data_b12t0_g, 
   ifu_tlu_immu_miss_m, ifu_lsu_thrid_s, 
   ifu_lsu_alt_space_e, lsu_tlu_dtlb_done, 
   ifu_tlu_itlb_done, lsu_tlu_tlb_asi_state_m, lsu_tlu_tlb_ldst_va_m, 
   lsu_tlu_tlb_ld_inst_m, lsu_tlu_tlb_st_inst_m, 
   lsu_tlu_tlb_access_tid_m, dmmu_sfsr_trp_wr, 
   immu_sfsr_trp_wr, lsu_tlu_daccess_excptn_g, 
   lsu_tlu_daccess_prot_g, 
   lsu_pid_state0, lsu_pid_state1, lsu_pid_state2, lsu_pid_state3, 
   lsu_tlu_nucleus_ctxt_m, lsu_tlu_tte_pg_sz_g, ifu_lsu_error_inj, 
   ifu_tlu_alt_space_d, ifu_lsu_imm_asi_d, 
   ifu_lsu_memref_d, lsu_asi_reg0, lsu_asi_reg1, lsu_asi_reg2, 
   lsu_asi_reg3, exu_mmu_early_va_e, rclk, arst_l, grst_l,
   si,se,ifu_tlu_flush_m,tlu_mmu_early_flush_pipe_w,lsu_mmu_early_flush_w,
   tlu_tag_access_ctxt_g, tlu_lsu_tl_zero, 
   exu_tlu_va_oor_jl_ret_m, exu_tlu_va_oor_m, tlu_lsu_pstate_am, tlu_tsb_base_w2_d1,
   lsu_mmu_flush_pipe_w, ifu_tlu_inst_vld_m, ifu_mmu_trap_m, ffu_tlu_ill_inst_m,
   exu_lsu_priority_trap_m, sehold, rst_tri_en, tlu_itag_acc_sel_g, lsu_mmu_defr_trp_taken_g,
   ifu_tlu_priv_violtn_m 
   ) ;	


/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
// End of automatics

input                   ifu_lsu_ld_inst_e;      // inst_is_load (src-decode)
input                   ifu_lsu_st_inst_e;      // inst is store (src-decode)
input                   lsu_tlu_dmmu_miss_g ;   // ld/st misses in dtlb.
input			spu_tlu_rsrv_illgl_m ; 

input			tlu_itag_acc_sel_g ;
input			lsu_mmu_defr_trp_taken_g ;

// The timing on these signals can be changed to any earlier stage.
// For both SPARC_HPV_EN and non-SPARC_HPV_EN - tsb,tag-access 
// dtsb maps to ps0. itsb maps to ps1.
input  [47:13]         	tlu_tsb_base_w2_d1 ;
//input  [47:13]         	tlu_dtsb_base_w2 ;
input                  	tlu_dtsb_split_w2 ;
input  [3:0]           	tlu_dtsb_size_w2 ;       
input  [47:13]         	tlu_dtag_access_w2 ;  	// used to represent both i/d.
//input  [47:13]         	tlu_itsb_base_w2 ;
input                  	tlu_itsb_split_w2 ;
input  [3:0]           	tlu_itsb_size_w2 ;       

// For SPARC_HPV_EN - BEGIN
input  [5:0] 		tlu_ctxt_cfg_w2 ;	// i/d context zero/non-zero config.
//input  			tlu_tag_access_nctxt_g ;// tag-access contains nucleus context.
// For SPARC_HPV_EN - END

input   [62:61]         lsu_tlu_st_rs3_data_g ;	    // Page Size (1,0) bits of TTE
input            	lsu_tlu_st_rs3_data_b48_g ; // Page Size (2)   bits of TTE
//input   [2:0]           lsu_tlu_st_rs3_data_b10t8_g ; // ps1 of ctxt-cfg
input   [12:0]          lsu_tlu_st_rs3_data_b12t0_g ; 
//input   [2:0]           lsu_tlu_st_rs3_data_b2t0_g ; // sun4v tte size
input			ifu_tlu_immu_miss_m ;
input   [1:0]           ifu_lsu_thrid_s ;   	// Thread id.
input			ifu_lsu_alt_space_e ;	// alt-space access
input                   lsu_tlu_dtlb_done ; // dtlb rd/wr/dmp complete
input            	ifu_tlu_itlb_done ; // itlb rd/wr/dmp complete
//input			int_tlu_asi_data_vld ;	// asi return vld for int blk
//input			int_tlu_ldxa_illgl_va ;	// int asi has illgl va
input  [7:0]           	lsu_tlu_tlb_asi_state_m ;
input  [`L1D_ADDRESS_HI:0]           lsu_tlu_tlb_ldst_va_m ;
input                  	lsu_tlu_tlb_ld_inst_m ;
input                  	lsu_tlu_tlb_st_inst_m ;
input  [1:0]           	lsu_tlu_tlb_access_tid_m ;
input		   	ifu_tlu_flush_m ;
input		   	tlu_mmu_early_flush_pipe_w ;
input		   	lsu_mmu_early_flush_w ;
input  	[3:0]   	dmmu_sfsr_trp_wr ;
input  	[3:0]   	immu_sfsr_trp_wr ;  
//input          		tlu_inst_vld_m ;        // qualified inst vld
input			lsu_tlu_daccess_excptn_g ; // data access exception 
input			lsu_tlu_daccess_prot_g ;// data access protection
						// obsolete with SPARC_HPV_EN !!!
//input           	lsu_tlu_asi_rd_unc ;    // uncorrectable error for tlb rd
input  	[2:0]   	lsu_pid_state0 ;        // pid thread0 ; global use
input  	[2:0]   	lsu_pid_state1 ;        // pid thread1 ; global use
input  	[2:0]   	lsu_pid_state2 ;        // pid thread2 ; global use
input  	[2:0]   	lsu_pid_state3 ;        // pid thread3 ; global use

input			lsu_tlu_nucleus_ctxt_m ;// access is nucleus context
input 	[2:0] 		lsu_tlu_tte_pg_sz_g ;	// page-size of tte 

input   [3:0]           ifu_lsu_error_inj ;     // inject parity error into tlb

// BEGIN - MMU_ASI_RD_CHANGE
// !! early va required.
input			ifu_tlu_alt_space_d ;	// alt space access - new;_e exists
//input			ifu_lsu_imm_asi_vld_d ; // imm asi is vld - current
input	[8:0]		ifu_lsu_imm_asi_d ;	// imm asi - current
input                   ifu_lsu_memref_d;	// ld/st - prefer ld_inst_e;
input   [7:0]   	lsu_asi_reg0 ;          // asi state - thread0
input   [7:0]   	lsu_asi_reg1 ;          // asi state - thread1
input   [7:0]   	lsu_asi_reg2 ;          // asi state - thread2
input   [7:0]   	lsu_asi_reg3 ;          // asi state - thread3
//input	[1:0]		ifu_tlu_thrid_d ;       // thread id
input 	[7:0]  		exu_mmu_early_va_e;	// early va from exu
// END - MMU_ASI_RD_CHANGE

input [12:0]          tlu_tag_access_ctxt_g ;

input [3:0] tlu_lsu_tl_zero;   // trap level is zero.
//input           exu_tlu_ttype_vld_m;    // exu src ttype vld
input           exu_tlu_va_oor_jl_ret_m;
input           exu_tlu_va_oor_m;
input [3:0] tlu_lsu_pstate_am; 

input		lsu_mmu_flush_pipe_w ;
input		ifu_tlu_inst_vld_m ;
input		ifu_mmu_trap_m ; 
input		ffu_tlu_ill_inst_m ;
input		exu_lsu_priority_trap_m ; // fill/ue
input		ifu_tlu_priv_violtn_m ;

input		rclk ;
input		arst_l, grst_l;
input		si,se;
input		sehold ;
input		rst_tri_en ;

/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
// End of automatics

output			dmmu_any_sfsr_wr ;
output	[3:0]		dmmu_sfsr_wr_en_l ; 
output	[3:0]		dmmu_sfar_wr_en_l ;
//output	[3:0]		dmmu_tsb_wr_en ;
//output	[3:0]		dmmu_tsb_rd_en ;
//output	[3:0]		dmmu_tag_access_wr_en ;
//output	[3:0]		dmmu_tag_access_rd_en ;
//output			dmmu_tag_read_en ; 

output			immu_any_sfsr_wr ; 
output	[3:0]		immu_sfsr_wr_en_l ; 
//output	[3:0]		immu_tsb_wr_en ;
output	[3:0]		immu_tsb_rd_en ;
//output	[3:0]		immu_tag_access_wr_en ;
//output	[3:0]		immu_tag_access_rd_en ;
//output			immu_tag_read_en ; 

// tlb/itlb related control can potentially be
// made g-stage.
output  [2:0]          	tlu_tte_tag_g ;
output			tlu_dtlb_rw_index_vld_g ;
output	[5:0]		tlu_dtlb_rw_index_g ;
output			tlu_dtlb_data_rd_g ;
output			tlu_dtlb_tag_rd_g ;
output			tlu_itlb_rw_index_vld_g ;
output			tlu_itlb_wr_vld_g ;
output			itlb_wr_vld_g ;
output	[5:0]		tlu_itlb_rw_index_g ;
output			tlu_itlb_data_rd_g ;
output			tlu_itlb_tag_rd_g ;
output	[47:0]		tlu_idtsb_8k_ptr ;	// maps to ps0/ps1 ptr. require only 1.
`ifndef NO_RTL_CSM
output			tlu_dtlb_csm_rd_g ;
output			tlu_itlb_csm_rd_g ;
output      	tlu_itlb_wr_csm_sel_g; 
output      	tlu_dtlb_wr_csm_sel_g; 
`endif

output			tlu_dtlb_invalidate_all_g ;
output			tlu_itlb_invalidate_all_g ;

output  [3:0]           tlu_slxa_thrd_sel ;

output	[1:0]		tlu_lsu_ldxa_tid_w2 ;

output			tlu_itlb_dmp_vld_g ;
output			tlu_itlb_dmp_all_g ;
output			tlu_itlb_dmp_pctxt_g ;
output			tlu_itlb_dmp_actxt_g ;
output			tlu_itlb_dmp_nctxt_g ;
output			tlu_dtlb_dmp_vld_g ;
output			tlu_dtlb_dmp_all_g ;
output			tlu_dtlb_dmp_pctxt_g ;
output			tlu_dtlb_dmp_sctxt_g ;
output			tlu_dtlb_dmp_nctxt_g ;
output			tlu_dtlb_dmp_actxt_g ;
output	[1:0]		tlu_idtlb_dmp_thrid_g ;
output  [4:0]           tlu_dmp_key_vld_g ;
output                	tlu_int_asi_load; 
output                	tlu_int_asi_store; 
output 	[1:0]          	tlu_int_asi_thrid;
output                	tlu_int_asi_vld; 
//output			tlb_access_en_l ;
output			tlb_access_rst_l ;
output			tlu_lsu_stxa_ack ;	   // write to tlb is complete.
output	 [1:0]		tlu_lsu_stxa_ack_tid ;
output   [3:0]          mra_wr_ptr ;    // wr ptr for mra
output   [3:0]          mra_rd_ptr ;    // thrd id for rd.
output                  mra_wr_vld ;    // write pointer vld
output                  mra_rd_vld ;    // read vld
output	 [19:0]		mra_byte_wen ;
output	 [2:0]		tag_access_wdata_sel ;
output			tlu_admp_key_sel ;
//output			tlu_mmu_sync_data_excp_g ;	// sync asi related data excp
//output			tlu_lsu_dtlb_rd_unc ;		// unc error for tlb rd

//output   [3:0]          tlu_dldxa_mx2_sel ;		// obsolete for SPARC_HPV_EN
//output   [2:0]          tlu_dldxa_mx3_sel ;		// obsolete for SPARC_HPV_EN
//output   [2:0]          tlu_dldxa_fmx_sel ;		// obsolete for SPARC_HPV_EN
//output   [3:0]          tlu_ildxa_mx1_sel ;		// obsolete for SPARC_HPV_EN
//output   [2:0]          tlu_ildxa_fmx_sel ;		// obsolete for SPARC_HPV_EN

output	 [2:0]		tlu_tte_wr_pid_g ;	// thread selected pid
output                  tlu_lsu_ldxa_async_data_vld ;   // tlu_lsu_ldxa_data_vld is for async op.

output   		tlu_tte_real_g ;                // tte is real

output  [3:0]   	tlu_ldxa_l1mx1_sel ;    // mmu ldxa level1 mx1 sel
output  [3:0]   	tlu_ldxa_l1mx2_sel ;    // mmu ldxa level1 mx2 sel
output  [2:0]   	tlu_ldxa_l2mx1_sel ;    // mmu ldxa level2 mx1 sel

output  [3:0]           lsu_ifu_inj_ack ;       // ack for tlb error injection.
output			tlu_tlb_tag_invrt_parity ;	// invert parity on write tag.
output			tlu_tlb_data_invrt_parity ;	// invert parity on write data.

output			tlu_sun4r_tte_g ;	// sun4r vs. sun4v tte.

output			lsu_exu_ldxa_m ;

output			tlu_lng_ltncy_en_l ;

output	[2:0]		tlu_tag_access_ctxt_sel_m ;

output			tlu_tsb_rd_ps0_sel ;

output			tlu_tlb_access_en_l_d1 ;

output			so ;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics

reg			dmmu_invalidate_all_en_m ;
reg			immu_invalidate_all_en_m ;
reg 	dmmu_decode_asi58_e ;
reg 	immu_decode_asi50_e ;
reg	dmmu_8k_ptr_e,dmmu_64k_ptr_e,dmmu_direct_ptr_e ;
reg	immu_8k_ptr_e,immu_64k_ptr_e;
reg	dmmu_zctxt_ps0_tsb_e, dmmu_zctxt_ps1_tsb_e ;
reg	dmmu_nzctxt_ps0_tsb_e, dmmu_nzctxt_ps1_tsb_e ;
reg	dmmu_zctxt_cfg_e, dmmu_nzctxt_cfg_e ;
reg	immu_zctxt_ps0_tsb_e, immu_zctxt_ps1_tsb_e ;
reg	immu_nzctxt_ps0_tsb_e, immu_nzctxt_ps1_tsb_e ;
reg	immu_zctxt_cfg_e, immu_nzctxt_cfg_e ;

`ifndef NO_RTL_CSM
reg			dmmu_csm_in_en_m,dmmu_csm_access_en_m;
wire		dmmu_csm_in_wr_en, dmmu_csm_access_wr_en ; 
wire		dmmu_csm_access_rd_en ;
wire		immu_csm_in_wr_en, immu_csm_access_wr_en ;
wire	    itlb_csm_rd_pend;
wire	    dtlb_csm_rd_pend;
wire		dmmu_csm_in_en, dmmu_csm_access_en ; 
wire	    immu_csm_in_en, immu_csm_access_en ; 
`endif
reg			dmmu_data_in_en_m,dmmu_data_access_en_m;
reg			dmmu_tag_read_en_m,dmmu_demap_en_m;

wire			sehold_d1 ;
wire			tlb_access_en_l ;
wire			dmmu_sync_illgl_va_g ;
wire			dmmu_async_supported_asi,dmmu_async_illgl_va_g ; 	
wire			immu_sync_illgl_va_g ;
wire			immu_async_supported_asi,immu_async_illgl_va_g ;
wire			ld_inst_m,st_inst_m ;
wire			ld_inst_g,st_inst_g ;
wire [3:0] 		tsb_size ;
wire			tsb_split ;
//wire [47:13]		tsb_base ;
wire [47:13]		tag_access ;
/*wire 	tsb_sz_8k_b0_mx1_out,tsb_sz_8k_b1_mx1_out,tsb_sz_8k_b2_mx1_out,tsb_sz_8k_b3_mx1_out;
wire 	tsb_sz_8k_b4_mx1_out,tsb_sz_8k_b5_mx1_out,tsb_sz_8k_b6_mx1_out,tsb_sz_8k_b7_mx1_out;
wire 	tsb_sz_8k_b0_mx2_out,tsb_sz_8k_b1_mx2_out,tsb_sz_8k_b2_mx2_out,tsb_sz_8k_b3_mx2_out;
wire 	tsb_sz_8k_b4_mx2_out,tsb_sz_8k_b5_mx2_out,tsb_sz_8k_b6_mx2_out,tsb_sz_8k_b7_mx2_out;
wire 	tsb_sz_8k_b0_mx3_out,tsb_sz_8k_b1_mx3_out,tsb_sz_8k_b2_mx3_out,tsb_sz_8k_b3_mx3_out;
wire 	tsb_sz_8k_b4_mx3_out,tsb_sz_8k_b5_mx3_out,tsb_sz_8k_b6_mx3_out,tsb_sz_8k_b7_mx3_out;
wire 	tsb_sz_64k_b0_mx1_out,tsb_sz_64k_b1_mx1_out,tsb_sz_64k_b2_mx1_out,tsb_sz_64k_b3_mx1_out;
wire 	tsb_sz_64k_b4_mx1_out,tsb_sz_64k_b5_mx1_out,tsb_sz_64k_b6_mx1_out,tsb_sz_64k_b7_mx1_out;
wire 	tsb_sz_64k_b0_mx2_out,tsb_sz_64k_b1_mx2_out,tsb_sz_64k_b2_mx2_out,tsb_sz_64k_b3_mx2_out;
wire 	tsb_sz_64k_b4_mx2_out,tsb_sz_64k_b5_mx2_out,tsb_sz_64k_b6_mx2_out ;
wire 	tsb_sz_64k_b0_mx3_out,tsb_sz_64k_b1_mx3_out,tsb_sz_64k_b2_mx3_out,tsb_sz_64k_b3_mx3_out;
wire 	tsb_sz_64k_b4_mx3_out ;*/
wire	dtlb_rw_index_vld_g,dtlb_wr_vld_g ;
wire		dmmu_data_in_wr_en, dmmu_data_access_wr_en ; 
wire		dmmu_tag_read_rd_en, dmmu_data_access_rd_en ;
wire		immu_data_in_wr_en, immu_data_access_wr_en ;
wire		immu_data_access_rd_en, immu_tag_read_rd_en ;
wire		itlb_rw_index_vld_g,itlb_wr_vld_g;
wire		tlu_ldxa_data_vld ;
wire	tlu_dldxa_data_vld ;
wire	[1:0]	thrid_d,thrid_e,thrid_m,thrid_g ;
wire		thread0_sel_g, thread1_sel_g ;
wire		thread2_sel_g, thread3_sel_g ;
wire		alt_space_m, alt_space_g ;
wire		immu_miss_g;
wire		ddemap_by_page,ddemap_by_ctxt,ddemap_all;
wire		idemap_by_page,idemap_by_ctxt,idemap_all;
wire		demap_pctxt,demap_sctxt,demap_nctxt ;
//wire		lsu_tlu_page_ebit_g ;
wire		ddemap_vld, idemap_vld ;
wire	[2:0]   tlu_tte_tag_g ;
wire		demap_resrv ;
wire	itlb_wr_pend,itlb_data_rd_pend,itlb_tag_rd_pend ;
wire	dtlb_wr_pend,dtlb_data_rd_pend,dtlb_tag_rd_pend ;
wire	tlb_access_en ;
wire	tlb_access_rst ;
wire	dmra_wr_g, imra_wr_g ;
wire			dmmu_data_in_en, dmmu_data_access_en, dmmu_tag_read_en, dmmu_demap_en ; 
wire			immu_data_in_en, immu_data_access_en, immu_tag_read_en, immu_demap_en ; 
wire	immu_invalidate_all_en,dmmu_invalidate_all_en ;
wire	tlb_wr_vld_g ;
wire	tlb_admp_en, tlb_admp_rst, tlb_wr_rst ;
wire	tlb_admp_mode,tlb_write_mode ;
wire	tlb_ldst_inst_m ;
wire 	tlb_admp_mode_d1 ;
wire	itlb_wr_vld_unmsked,dtlb_wr_vld_unmsked;
wire	idemap_pend, ddemap_pend ;
wire	itlb_tag_rd_en, dtlb_tag_rd_en ;
wire	[3:0]	dsfsr_asi_wr_en ;
wire	[3:0]	isfsr_asi_wr_en ;
wire	[`L1D_ADDRESS_HI:3]	tlb_ldst_va_g ;
wire		tlb_ld_inst_g,tlb_st_inst_g ;
wire		tlb_ld_inst_unflushed,tlb_st_inst_unflushed ;
wire	[1:0]	tlb_access_tid_g ;
wire		inst_vld_g ;
wire	st_inst_unflushed, ld_inst_unflushed ;
wire	imra_lng_lat_rd,dmra_lng_lat_rd ;
wire	iside_mra_access_rd, iside_mra_access_wr ;
wire	[1:0]	mra_raccess_tid ;
//wire	dmmu_sync_rd_only_asi_g ;
//wire	immu_sync_rd_only_asi_g ;
wire	dptr0_pg64k_en,dptr1_pg64k_en,dptr2_pg64k_en,dptr3_pg64k_en;
wire	dptr0_pg64k_vld,dptr1_pg64k_vld,dptr2_pg64k_vld,dptr3_pg64k_vld;
//wire 	dmmu_direct_ptr_rd_en ;
wire    tlu_dtlb_rd_done ;
wire	dmmu_ctxt_cfg_en, immu_ctxt_cfg_en ;
//wire	dmmu_ctxt_cfg_rd_en ;
wire	dacc_prot_ps1_match ;
wire	tacc_nctxt, itacc_nctxt, dtacc_nctxt ;	// for in-pipe access
wire	tacc_anctxt, itacc_anctxt, dtacc_anctxt ;// for async access
wire	thread0_async_g,thread1_async_g,thread2_async_g ;
wire	sun4r_tte_g ;
wire	dmmu_decode_asi58_m, immu_decode_asi50_m ;
wire	dmmu_zctxt_ps0_tsb_m, dmmu_zctxt_ps1_tsb_m,
	dmmu_nzctxt_ps0_tsb_m, dmmu_nzctxt_ps1_tsb_m,
	dmmu_zctxt_cfg_m, dmmu_nzctxt_cfg_m,
	immu_zctxt_ps0_tsb_m, immu_zctxt_ps1_tsb_m,
	immu_nzctxt_ps0_tsb_m, immu_nzctxt_ps1_tsb_m,
	immu_zctxt_cfg_m, immu_nzctxt_cfg_m ;
wire	dmmu_sync_fsr_en, dmmu_sync_far_en,
	dmmu_zctxt_ps0_tsb_en, dmmu_zctxt_ps1_tsb_en,
	dmmu_nzctxt_ps0_tsb_en, dmmu_nzctxt_ps1_tsb_en,
	dmmu_zctxt_cfg_en, dmmu_nzctxt_cfg_en,
	immu_sync_fsr_en,
	immu_zctxt_ps0_tsb_en, immu_zctxt_ps1_tsb_en,
	immu_nzctxt_ps0_tsb_en, immu_nzctxt_ps1_tsb_en,
	immu_zctxt_cfg_en, immu_nzctxt_cfg_en ;
wire	dmmu_tag_target_en_m,dmmu_tag_access_en_m;
wire	immu_tag_target_en_m,immu_tag_access_en_m;
wire	dmmu_tag_access_en;
wire	immu_tag_access_en;
wire	dmmu_8k_ptr_en_m,dmmu_64k_ptr_en_m,dmmu_direct_ptr_en_m ;
wire	immu_8k_ptr_en_m,immu_64k_ptr_en_m ;
wire	dmmu_sync_fsr_en_m, dmmu_sync_far_en_m,
	dmmu_zctxt_ps0_tsb_en_m, dmmu_zctxt_ps1_tsb_en_m,
	dmmu_nzctxt_ps0_tsb_en_m, dmmu_nzctxt_ps1_tsb_en_m,
	dmmu_zctxt_cfg_en_m, dmmu_nzctxt_cfg_en_m,
	immu_sync_fsr_en_m,
	immu_zctxt_ps0_tsb_en_m, immu_zctxt_ps1_tsb_en_m,
	immu_nzctxt_ps0_tsb_en_m, immu_nzctxt_ps1_tsb_en_m,
	immu_zctxt_cfg_en_m, immu_nzctxt_cfg_en_m ;
wire	thread0_d,thread1_d,thread2_d,thread3_d;
wire 	thread0_e, thread1_e, thread2_e, thread3_e ;
wire [7:0]	asi_state_d, asi_state_e ;
wire	memref_e,memref_m ;
wire [7:0] early_va_m ;
wire	idmra_rd_d ;
wire idmra_nzctxt_rd_d ;
wire idmra_fault_rd_d ;
wire	dmmu_tsb_en_m, dmmu_ctxt_cfg_en_m ; 
wire	immu_tsb_en_m, immu_ctxt_cfg_en_m ; 
wire	tlu_ildxa_data_vld ;
wire	dmmu_direct_8kptr_sel_g ;	// direct ptr should select 8k ptr

	wire	dmmu_tsb_en ;
	wire	immu_tsb_en ;

wire	mra_field1_en, mra_field2_en ; 
wire	mra_field3_en, mra_field4_en ; 


//=========================================================================================
//      RESET/CLK
//=========================================================================================
 
    wire       clk;
    assign     clk = rclk;
 
    wire       rst_l;
    
    dffrl_async rstff(.din (grst_l),
                      .q   (rst_l),
                      .clk (clk), .se(se), .si(), .so(),
                      .rst_l (arst_l));


//=========================================================================================
//	Early Flush Generation
//=========================================================================================




wire	ifu_tlu_flush_w ;
dff_s  #(1) stg_w (
        .din    (ifu_tlu_flush_m),
        .q      (ifu_tlu_flush_w),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

wire	local_flush_w ;

assign	local_flush_w = 
	ifu_tlu_flush_w 		|	// ifu flush 
	lsu_mmu_defr_trp_taken_g	|	// defr trp 
	tlu_mmu_early_flush_pipe_w 	| 	// tlu flush
	lsu_mmu_early_flush_w 		;	// lsu early flush

wire    flush_w_inst_vld_m ;
assign  flush_w_inst_vld_m =
        ifu_tlu_inst_vld_m &
        ~(lsu_mmu_flush_pipe_w & (thrid_m[1:0] == thrid_g[1:0])) ; // really lsu_flush_pipe_w

dff_s  stgw_ivld (
        .din    (flush_w_inst_vld_m),
        .q      (inst_vld_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Bug 4183
wire	priority_squash_m, priority_squash_g ;
assign	priority_squash_m = 
ifu_mmu_trap_m | ffu_tlu_ill_inst_m | exu_lsu_priority_trap_m |  spu_tlu_rsrv_illgl_m ; 

wire	trp_vld_m,trp_vld_g ;
assign	trp_vld_m = flush_w_inst_vld_m & ~priority_squash_m ;

dff_s  #(2) sqshstgw (
        .din    ({priority_squash_m,trp_vld_m}),
        .q      ({priority_squash_g,trp_vld_g}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

//=========================================================================================
//	Staging
//=========================================================================================

dff_s  #(2) stg_d (
        .din    (ifu_lsu_thrid_s[1:0]),
        .q      (thrid_d[1:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dff_s  #(2) stg_e (
        .din    (thrid_d[1:0]),
        .q      (thrid_e[1:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dff_s  #(5) stg_m (
        .din    ({ifu_lsu_ld_inst_e,ifu_lsu_st_inst_e,
		thrid_e[1:0],ifu_lsu_alt_space_e}),
        .q      ({ld_inst_m,st_inst_m,thrid_m[1:0],alt_space_m}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dff_s  #(6) stg_g (
        .din    ({ld_inst_m,st_inst_m,thrid_m[1:0],alt_space_m,ifu_tlu_immu_miss_m}),
        .q      ({ld_inst_unflushed,st_inst_unflushed,thrid_g[1:0],alt_space_g,immu_miss_g}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

// reads are terminated for illegal va case.
assign	ld_inst_g = ld_inst_unflushed & inst_vld_g & ~local_flush_w ;
//assign	ld_inst_g = ld_inst_unflushed & inst_vld_g & ~(dmmu_sync_illgl_va_g | immu_sync_illgl_va_g) & ;
// writes are terminated for illegal va case.
assign	st_inst_g = st_inst_unflushed & inst_vld_g & ~local_flush_w & 
			~(dmmu_sync_illgl_va_g | immu_sync_illgl_va_g) ;
//assign	st_inst_g = st_inst_unflushed & inst_vld_g & ~(dmmu_sync_illgl_va_g | immu_sync_illgl_va_g);

assign	thread0_sel_g =  ~thrid_g[1] & ~thrid_g[0] ;
assign	thread1_sel_g =  ~thrid_g[1] &  thrid_g[0] ;
assign	thread2_sel_g =   thrid_g[1] & ~thrid_g[0] ;
assign	thread3_sel_g =   thrid_g[1] &  thrid_g[0] ;

assign tlu_slxa_thrd_sel[0] = ~thrid_m[1] & ~thrid_m[0] ;
assign tlu_slxa_thrd_sel[1] = ~thrid_m[1] &  thrid_m[0] ;
assign tlu_slxa_thrd_sel[2] =  thrid_m[1] & ~thrid_m[0] ;
assign tlu_slxa_thrd_sel[3] =  thrid_m[1] &  thrid_m[0] ;

/*dff stgivld_g (
        .din    (tlu_inst_vld_m),
        .q      (inst_vld_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        ); */

//=========================================================================================
//	ASI RD DP MUX SELECT
//=========================================================================================

// qualification with vld not required as this dp is used by synchronous ops only
// Need to be made non zero-hot in functional mode

// Decode of bits va[5:4] to distinguish reads.  
wire va_54_eq_0,va_54_eq_1,va_54_eq_2,va_54_eq_3 ;
wire	[2:0]	ldxa_l1mx1_sel_d1 ;
assign va_54_eq_0 = (~early_va_m[5] & ~early_va_m[4]) ;
assign va_54_eq_1 = (~early_va_m[5] &  early_va_m[4]) ;
assign va_54_eq_2 = ( early_va_m[5] & ~early_va_m[4]) ;
assign va_54_eq_3 = ( early_va_m[5] &  early_va_m[4]) ;

// i/d tag-target
// Extend for MacroTest Control.
assign	tlu_ldxa_l1mx1_sel[0] = 
((((dmmu_decode_asi58_m | immu_decode_asi50_m) & va_54_eq_0) & ~sehold_d1) | rst_tri_en) |  
(ldxa_l1mx1_sel_d1[0] & sehold_d1) ;
assign	tlu_ldxa_l1mx1_sel[1] = 
((dmmu_zctxt_ps0_tsb_e | dmmu_nzctxt_ps0_tsb_e | 
immu_zctxt_ps0_tsb_e | immu_nzctxt_ps0_tsb_e) & ~sehold_d1 & ~rst_tri_en) | 
(ldxa_l1mx1_sel_d1[1] & sehold_d1) ;
assign	tlu_ldxa_l1mx1_sel[2] = 
((dmmu_zctxt_ps1_tsb_e | dmmu_nzctxt_ps1_tsb_e |
immu_zctxt_ps1_tsb_e | immu_nzctxt_ps1_tsb_e) & ~sehold_d1 & ~rst_tri_en) |
(ldxa_l1mx1_sel_d1[2] & sehold_d1) ;



// Extend flops to hold selects for MacroTest of MRA.
wire [2:0] ldxa_l1mx1_sel_out ;
dff_s #(3)   l1mx1s_stgd1(
        .din    (tlu_ldxa_l1mx1_sel[2:0]), 
	.q  	(ldxa_l1mx1_sel_out[2:0]),
        .clk 	(clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// scan protection.
assign	ldxa_l1mx1_sel_d1[0] = ldxa_l1mx1_sel_out[0] ;
assign	ldxa_l1mx1_sel_d1[1] = ldxa_l1mx1_sel_out[1] & ~rst_tri_en ;
assign	ldxa_l1mx1_sel_d1[2] = ldxa_l1mx1_sel_out[2] & ~rst_tri_en ;

wire	sehold_out ;
dff_s #(1)   seh_d1 (
        .din    (sehold), 
	.q  	(sehold_out),
        .clk 	(clk),
        .se     (1'b0),       	.si (),          .so ()
        );

assign	sehold_d1 = sehold_out & ~rst_tri_en ;

// i/d tag-access
assign	tlu_ldxa_l1mx1_sel[3] =  ~|tlu_ldxa_l1mx1_sel[2:1];
wire    ldxa_l1mx1_sel3;
// * read timing change.
assign	ldxa_l1mx1_sel3 = 
(dmmu_decode_asi58_m | immu_decode_asi50_m) & va_54_eq_3 & ~rst_tri_en ;

// d sync-fsr
// * read timing change.
wire	dmmu_sync_fsr_m_sel,dmmu_sync_far_m_sel,immu_sync_fsr_m_sel;
assign	dmmu_sync_fsr_m_sel	= (dmmu_decode_asi58_m & va_54_eq_1) | rst_tri_en ;
assign	dmmu_sync_far_m_sel	= (dmmu_decode_asi58_m & va_54_eq_2) & ~rst_tri_en ;
assign	immu_sync_fsr_m_sel	= (immu_decode_asi50_m & va_54_eq_1) & ~rst_tri_en ;
assign	tlu_ldxa_l1mx2_sel[0] = dmmu_sync_fsr_m_sel ;
// d sync-far
// * read timing change.
assign	tlu_ldxa_l1mx2_sel[1] = dmmu_sync_far_m_sel ;
// i sync-fsr
assign	tlu_ldxa_l1mx2_sel[2] = immu_sync_fsr_m_sel ;
assign	tlu_ldxa_l1mx2_sel[3] = ~|tlu_ldxa_l1mx2_sel[2:0];
wire    ldxa_l1mx2_sel3;
assign	ldxa_l1mx2_sel3 = (dmmu_zctxt_cfg_m | dmmu_nzctxt_cfg_m |
			  immu_zctxt_cfg_m | immu_nzctxt_cfg_m) & ~rst_tri_en ;

assign	tlu_ldxa_l2mx1_sel[0] = 
|{ldxa_l1mx1_sel3,ldxa_l1mx1_sel_d1[2:1],(tlu_ldxa_l1mx1_sel[0] & ~rst_tri_en)} ;
assign	tlu_ldxa_l2mx1_sel[1] = |{ldxa_l1mx2_sel3,tlu_ldxa_l1mx2_sel[2:0]} ;
assign	tlu_ldxa_l2mx1_sel[2] = ~|tlu_ldxa_l2mx1_sel[1:0];

//=========================================================================================
//	MRA RD/WRITE
//=========================================================================================

wire	[3:0]	isfsr_trp_wr ;
wire	flush_mmuasi_wr ;
assign	flush_mmuasi_wr = ifu_tlu_flush_w | lsu_mmu_defr_trp_taken_g ; // Bug 5196
assign	isfsr_trp_wr[0] = immu_sfsr_trp_wr[0] & ~flush_mmuasi_wr ;
assign	isfsr_trp_wr[1] = immu_sfsr_trp_wr[1] & ~flush_mmuasi_wr ;
assign	isfsr_trp_wr[2] = immu_sfsr_trp_wr[2] & ~flush_mmuasi_wr ;
assign	isfsr_trp_wr[3] = immu_sfsr_trp_wr[3] & ~flush_mmuasi_wr ;

wire  tag_access_nctxt_g ;

wire immu_miss_vld_g ;
assign immu_miss_vld_g = immu_miss_g & inst_vld_g ;

// fast-asi read takes precedence over long-latency rd. Can long-latency read get
// starved out ?? Assume memref_d is never x.
`ifndef NO_RTL_CSM
assign	dmra_lng_lat_rd = ((dmmu_data_in_en | dmmu_data_access_en | dmmu_csm_in_en | dmmu_csm_access_en) 
                        & tlb_st_inst_g & ~ifu_lsu_memref_d) ;
assign	imra_lng_lat_rd = ((immu_data_in_en | immu_data_access_en | immu_csm_in_en | immu_csm_access_en) 
                        & tlb_st_inst_g & ~ifu_lsu_memref_d) ;
`else
assign	dmra_lng_lat_rd = ((dmmu_data_in_en | dmmu_data_access_en) & tlb_st_inst_g & ~ifu_lsu_memref_d) ;
assign	imra_lng_lat_rd = ((immu_data_in_en | immu_data_access_en) & tlb_st_inst_g & ~ifu_lsu_memref_d) ;
`endif
//assign	dmra_lng_lat_rd = ((dmmu_data_in_en | dmmu_data_access_en) & tlb_st_inst_g) ;
//assign	imra_lng_lat_rd = ((immu_data_in_en | immu_data_access_en) & tlb_st_inst_g) ;

wire  dmra_ldst,imra_ldst ;
assign        dmra_ldst = dmmu_tag_access_en | dmmu_tsb_en | dmmu_ctxt_cfg_en ; 
assign        imra_ldst = immu_tag_access_en | immu_tsb_en | immu_ctxt_cfg_en ; 

// sync_far_en no longer written/read
assign	dmra_wr_g = 
	(dmra_ldst & st_inst_g) |
	(lsu_tlu_dmmu_miss_g | lsu_tlu_daccess_excptn_g | lsu_tlu_daccess_prot_g) 
	& trp_vld_g & ~flush_mmuasi_wr ;
	//(lsu_tlu_dmmu_miss_g | lsu_tlu_daccess_excptn_g | lsu_tlu_daccess_prot_g) & inst_vld_g ;
	// Bug 4183
wire	isfsr_trap ;
assign	isfsr_trap = |isfsr_trp_wr[3:0] ;
assign	imra_wr_g = 
	(imra_ldst & st_inst_g) |
	//((immu_tag_access_en | immu_tsb_en | immu_ctxt_cfg_en) & st_inst_g) | 
	(immu_miss_vld_g & ~flush_mmuasi_wr) | isfsr_trap ;

wire	dmra_rw_d ;
assign	iside_mra_access_rd = ((~dmra_rw_d) & ~(imra_lng_lat_rd | dmra_lng_lat_rd))  | imra_lng_lat_rd ;
assign	iside_mra_access_wr = imra_wr_g ;

assign	mra_raccess_tid[1:0] = (dmra_lng_lat_rd | imra_lng_lat_rd) ? tlb_access_tid_g[1:0] : thrid_d[1:0] ;

wire idside_nzctxt_accwr_early_m,idside_nzctxt_accwr_early_g  ;
assign	idside_nzctxt_accwr_early_m =
	((dmmu_nzctxt_cfg_en_m 	 | immu_nzctxt_cfg_en_m     |
	dmmu_nzctxt_ps0_tsb_en_m | immu_nzctxt_ps0_tsb_en_m |
	dmmu_nzctxt_ps1_tsb_en_m | immu_nzctxt_ps1_tsb_en_m) & st_inst_m) ; // tsb/cfg asi wr

dff_s ctacc_stgg (
        .din    (idside_nzctxt_accwr_early_m),
        .q      (idside_nzctxt_accwr_early_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
	
//wire	idside_nzctxt_access ;
wire	idside_nzctxt_access_rd,idside_nzctxt_access_wr ;
wire	st_wr_g ;

assign	idside_nzctxt_access_wr = 
	((dmmu_tag_access_en	| immu_tag_access_en) 	// tag-access asi write
		& st_inst_unflushed & ~tag_access_nctxt_g)	 |
	((lsu_tlu_daccess_excptn_g | lsu_tlu_daccess_prot_g | lsu_tlu_dmmu_miss_g |
	immu_miss_g | (isfsr_trap))		// tag-access exception write 
		& inst_vld_g & ~tag_access_nctxt_g)	 |
	(idside_nzctxt_accwr_early_g & st_wr_g) ; // Bug 4828
	//((dmmu_nzctxt_cfg_en 	| immu_nzctxt_cfg_en 	 |
	//dmmu_nzctxt_ps0_tsb_en 	| immu_nzctxt_ps0_tsb_en |
	//dmmu_nzctxt_ps1_tsb_en 	| immu_nzctxt_ps1_tsb_en) & st_inst_unflushed) ; // tsb/cfg asi wr
assign	idside_nzctxt_access_rd = 
	(idmra_nzctxt_rd_d) 		 |  // => nzctxt rd with decode
	(idmra_fault_rd_d & ~tacc_nctxt) |  // => fault-based rd
	((dmra_lng_lat_rd | imra_lng_lat_rd) & ~tacc_anctxt) ;
// access non zero context levels
		
assign	mra_wr_ptr[3:0]	= {thrid_g[1:0],idside_nzctxt_access_wr,iside_mra_access_wr};	
assign	mra_rd_ptr[3:0]	= {mra_raccess_tid[1:0],idside_nzctxt_access_rd,iside_mra_access_rd};	

assign	mra_wr_vld = dmra_wr_g | imra_wr_g ;
assign	mra_rd_vld = idmra_rd_d | dmra_lng_lat_rd | imra_lng_lat_rd ;

assign	dmmu_ctxt_cfg_en = dmmu_zctxt_cfg_en | dmmu_nzctxt_cfg_en ;
assign	immu_ctxt_cfg_en = immu_zctxt_cfg_en | immu_nzctxt_cfg_en ;
//assign	dmmu_ctxt_cfg_rd_en = (dmmu_zctxt_cfg_en | dmmu_nzctxt_cfg_en) & ld_inst_g ;
//assign	immu_ctxt_cfg_rd_en = (immu_zctxt_cfg_en | immu_nzctxt_cfg_en) & ld_inst_g ;

// Change - with 8 tsbs per thread, tsb can be in any of the 3 fields
// of a line in the mra.
wire	mra_itag_acc_en,mra_dtag_acc_en ;
// Be careful about loading on trap conditions.
assign st_wr_g = st_inst_unflushed & ~local_flush_w ;
assign	mra_itag_acc_en = 
	(immu_tag_access_en & st_wr_g) | immu_miss_g | (isfsr_trap) ;
assign	mra_dtag_acc_en = 
	(dmmu_tag_access_en & st_wr_g) | lsu_tlu_dmmu_miss_g | lsu_tlu_daccess_excptn_g | 
	lsu_tlu_daccess_prot_g ;
assign	mra_field1_en 	= (dmmu_zctxt_ps0_tsb_en  | immu_zctxt_ps0_tsb_en |
			  dmmu_nzctxt_ps0_tsb_en | immu_nzctxt_ps0_tsb_en) & st_wr_g ;
			  // dmmu_nzctxt_ps0_tsb_en | immu_nzctxt_ps0_tsb_en) & st_inst_unflushed ; Bug 3378
assign	mra_field2_en 	= (dmmu_zctxt_ps1_tsb_en  | immu_zctxt_ps1_tsb_en |
			  dmmu_nzctxt_ps1_tsb_en | immu_nzctxt_ps1_tsb_en) & st_wr_g ;
assign	mra_field3_en	= mra_itag_acc_en | mra_dtag_acc_en ;
assign	mra_field4_en 	= (dmmu_ctxt_cfg_en | immu_ctxt_cfg_en) & st_wr_g ;
			  
// for use of rf16x160
assign	mra_byte_wen[19:14] = {6{mra_field1_en}} ;
assign	mra_byte_wen[13:8]  = {6{mra_field2_en}} ;
assign	mra_byte_wen[7:2]  =  {6{mra_field3_en}} ;
assign	mra_byte_wen[1:0]  =  {2{mra_field4_en}} ;

// active-low selects
// Need to add inst_access_excp to the sel !!!
// Prioritized between the two sels.
assign        tag_access_wdata_sel[0] = 
      ~(tag_access_wdata_sel[1] | tag_access_wdata_sel[2]) | rst_tri_en ;
//assign        tag_access_wdata_sel[1] = (immu_miss_g | isfsr_trap) & ~rst_tri_en ; // Timing
assign        tag_access_wdata_sel[1] = tlu_itag_acc_sel_g & ~rst_tri_en ;
assign        tag_access_wdata_sel[2] = (dmra_ldst | imra_ldst) & st_wr_g & ~rst_tri_en ; 
					// Bug 4728

wire  [12:0]  tag_access_wdata_ctxt ;
assign        tag_access_wdata_ctxt[12:0] = 
       tag_access_wdata_sel[2] ? lsu_tlu_st_rs3_data_b12t0_g[12:0] : tlu_tag_access_ctxt_g[12:0] ;

assign  tag_access_nctxt_g = (tag_access_wdata_ctxt[12:0] == 13'd0) ;
 
//=========================================================================================
//	Tag-Access Context Per thread
//=========================================================================================

// Mark ctxt field in tag-access register as being nucleus or non-nucleus.
// State will not be ~rst_l as use is expected to be preceeded by write.

wire	[3:0]	itacc_ctxt_en, dtacc_ctxt_en ;
wire		itacc_nctxt0,itacc_nctxt1,itacc_nctxt2,itacc_nctxt3;
wire		dtacc_nctxt0,dtacc_nctxt1,dtacc_nctxt2,dtacc_nctxt3;
assign	itacc_ctxt_en[0] = thread0_sel_g & mra_itag_acc_en & mra_wr_vld ;
assign	itacc_ctxt_en[1] = thread1_sel_g & mra_itag_acc_en & mra_wr_vld ;
assign	itacc_ctxt_en[2] = thread2_sel_g & mra_itag_acc_en & mra_wr_vld ;
assign	itacc_ctxt_en[3] = thread3_sel_g & mra_itag_acc_en & mra_wr_vld ;
assign	dtacc_ctxt_en[0] = thread0_sel_g & mra_dtag_acc_en & mra_wr_vld ;
assign	dtacc_ctxt_en[1] = thread1_sel_g & mra_dtag_acc_en & mra_wr_vld ;
assign	dtacc_ctxt_en[2] = thread2_sel_g & mra_dtag_acc_en & mra_wr_vld ;
assign	dtacc_ctxt_en[3] = thread3_sel_g & mra_dtag_acc_en & mra_wr_vld ;

// Thread0
dffe_s   itacc_ctxt0 (
        .din    (tag_access_nctxt_g), .q  (itacc_nctxt0),
        .en 	(itacc_ctxt_en[0]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

dffe_s   dtacc_ctxt0 (
        .din    (tag_access_nctxt_g), .q  (dtacc_nctxt0),
        .en 	(dtacc_ctxt_en[0]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread1
dffe_s   itacc_ctxt1 (
        .din    (tag_access_nctxt_g), .q  (itacc_nctxt1),
        .en 	(itacc_ctxt_en[1]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

dffe_s   dtacc_ctxt1 (
        .din    (tag_access_nctxt_g), .q  (dtacc_nctxt1),
        .en 	(dtacc_ctxt_en[1]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread2
dffe_s   itacc_ctxt2 (
        .din    (tag_access_nctxt_g), .q  (itacc_nctxt2),
        .en 	(itacc_ctxt_en[2]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

dffe_s   dtacc_ctxt2 (
        .din    (tag_access_nctxt_g), .q  (dtacc_nctxt2),
        .en 	(dtacc_ctxt_en[2]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread3
dffe_s   itacc_ctxt3 (
        .din    (tag_access_nctxt_g), .q  (itacc_nctxt3),
        .en 	(itacc_ctxt_en[3]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

dffe_s   dtacc_ctxt3 (
        .din    (tag_access_nctxt_g), .q  (dtacc_nctxt3),
        .en 	(dtacc_ctxt_en[3]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// In-pipe Access
assign	itacc_nctxt =
	thread0_d ? itacc_nctxt0 :
		thread1_d ? itacc_nctxt1 :
			thread2_d ? itacc_nctxt2 : itacc_nctxt3 ;
assign	dtacc_nctxt =
	thread0_d ? dtacc_nctxt0 :
		thread1_d ? dtacc_nctxt1 :
			thread2_d ? dtacc_nctxt2 : dtacc_nctxt3 ;
assign	tacc_nctxt =
	iside_mra_access_rd ? itacc_nctxt : dtacc_nctxt ;

// Asynchronous Access
assign	itacc_anctxt =
	thread0_async_g ? itacc_nctxt0 :
		thread1_async_g ? itacc_nctxt1 :
			thread2_async_g ? itacc_nctxt2 : itacc_nctxt3 ;
assign	dtacc_anctxt =
	thread0_async_g ? dtacc_nctxt0 :
		thread1_async_g ? dtacc_nctxt1 :
			thread2_async_g ? dtacc_nctxt2 : dtacc_nctxt3 ;

assign	tacc_anctxt =
	imra_lng_lat_rd ? itacc_anctxt : dtacc_anctxt ;

//=========================================================================================
//	Interrupt Control
//=========================================================================================

assign	tlu_int_asi_load =  ld_inst_g & alt_space_g ;
assign	tlu_int_asi_store =  st_inst_g & alt_space_g ;
assign	tlu_int_asi_thrid[1:0] = thrid_g[1:0] ;
assign	tlu_int_asi_vld = alt_space_g ;

//=========================================================================================
//	ASI Error Condition
//=========================================================================================

// Supported asi but illegal_va. ldxa must signal this occurrence when returning data
// to LSU.
// The decode can be shared with the statement below (grape)
// SPARC_HPV_EN - Needs to change once asi assignments are available !!!
// Bug 2201 : pid and va_wtchpt decoded in lsu (asi 58)
/*wire lsu_asi58_g ;
assign lsu_asi58_g = 
	((tlu_ldst_va_g[8:0] == 9'h080) |	// pid
	(tlu_ldst_va_g[8:0] == 9'h038)) ;	// va-wtchpt
assign	dmmu_sync_supported_asi = 
	(((lsu_asi_state[7:0] == 8'h58) & ~lsu_asi58_g) |
	(lsu_asi_state[7:0] == 8'h59) |
	(lsu_asi_state[7:0] == 8'h5A) |
	(lsu_asi_state[7:0] == 8'h5B)) & alt_space_g  ;*/


wire    dmmu_inv_all_asi ;
assign dmmu_inv_all_asi = 
({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h60,8'h08}) ;

wire	dmmu_async_supported_asi_m ;
assign	dmmu_async_supported_asi_m = 
	((lsu_tlu_tlb_asi_state_m[7:0] == 8'h5C) |
	//dmmu_inv_all_asi |
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h60) | // Bug 4901
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h5D) |
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h5E) |
`ifndef NO_RTL_CSM
    (lsu_tlu_tlb_asi_state_m[7:0] == `ASI_DMMU_CSM_IN_REG) |
    (lsu_tlu_tlb_asi_state_m[7:0] == `ASI_DMMU_CSM_ACCESS_REG) |
`endif
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h5F)) & tlb_ldst_inst_m ;

dff_s stgg_dasi (
        .din    (dmmu_async_supported_asi_m),
        .q      (dmmu_async_supported_asi),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	dmmu_async_illgl_va_g =
	dmmu_async_supported_asi & 
	~(dmmu_data_in_en | 
	dmmu_invalidate_all_en | immu_invalidate_all_en | // Bug 4901
	dmmu_data_access_en |
`ifndef NO_RTL_CSM
    dmmu_csm_in_en | dmmu_csm_access_en | 
`endif 
	dmmu_tag_read_en | dmmu_demap_en) ;

/*assign	immu_sync_supported_asi = 
	((lsu_asi_state[7:0] == 8'h50) |
	(lsu_asi_state[7:0] == 8'h51) |
	(lsu_asi_state[7:0] == 8'h52)) & alt_space_g ;

assign	immu_sync_illgl_va_g =
	immu_sync_supported_asi & ~(immu_tag_target_en | immu_sync_fsr_en | immu_tsb_en | 
	immu_tag_access_en | immu_8k_ptr_en | immu_64k_ptr_en | immu_ctxt_cfg_en) ;*/

wire    immu_inv_all_asi ;
assign immu_inv_all_asi = 
({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h60,8'h00}) ;

wire	immu_async_supported_asi_m ;
assign	immu_async_supported_asi_m = 
	((lsu_tlu_tlb_asi_state_m[7:0] == 8'h54) |
	//immu_inv_all_asi |
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h60) | // Bug 4901
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h55) |
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h56) |
`ifndef NO_RTL_CSM
    (lsu_tlu_tlb_asi_state_m[7:0] == `ASI_IMMU_CSM_IN_REG) |
    (lsu_tlu_tlb_asi_state_m[7:0] == `ASI_IMMU_CSM_ACCESS_REG) |
`endif
	(lsu_tlu_tlb_asi_state_m[7:0] == 8'h57)) & tlb_ldst_inst_m  ;

dff_s stgg_iasi (
        .din    (immu_async_supported_asi_m),
        .q      (immu_async_supported_asi),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	immu_async_illgl_va_g =
	immu_async_supported_asi & 
	~(immu_data_in_en |
`ifndef NO_RTL_CSM
    immu_csm_in_en | immu_csm_access_en | 
`endif 
	immu_data_access_en | immu_tag_read_en | immu_demap_en | 
	immu_invalidate_all_en | dmmu_invalidate_all_en) ; // Bug 4901

//=========================================================================================
//	IN-PIPE ASI RD SUPPORT
//=========================================================================================


assign  thread0_d = ~thrid_d[1] & ~thrid_d[0] ;
assign  thread1_d = ~thrid_d[1] &  thrid_d[0] ;
assign  thread2_d =  thrid_d[1] & ~thrid_d[0] ;
assign  thread3_d =  thrid_d[1] &  thrid_d[0] ;

wire    [7:0]   asi_reg0_d1 ;
dff_s #(8) stgd1_asi0 (
        .din    (lsu_asi_reg0[7:0]),
        .q      (asi_reg0_d1[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire    [7:0]   asi_reg1_d1 ;
dff_s #(8) stgd1_asi1 (
        .din    (lsu_asi_reg1[7:0]),
        .q      (asi_reg1_d1[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire    [7:0]   asi_reg2_d1 ;
dff_s #(8) stgd1_asi2 (
        .din    (lsu_asi_reg2[7:0]),
        .q      (asi_reg2_d1[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire    [7:0]   asi_reg3_d1 ;
dff_s #(8) stgd1_asi3 (
        .din    (lsu_asi_reg3[7:0]),
        .q      (asi_reg3_d1[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire    [7:0]   asi_reg_state ;
assign  asi_reg_state[7:0] =
        (thread0_d ? asi_reg0_d1[7:0] : 
          (thread1_d ? asi_reg1_d1[7:0] : 
            (thread2_d ? asi_reg2_d1[7:0] : 
              asi_reg3_d1[7:0]))) ;

wire    imm_asi_vld_d ;
assign  imm_asi_vld_d = ~ifu_lsu_imm_asi_d[8] ;

// Use of asi delayed by a cycle.
assign  asi_state_d[7:0] = imm_asi_vld_d ? 
      ifu_lsu_imm_asi_d[7:0] : asi_reg_state[7:0] ;

dff_s #(8) stgd1_asi (
        .din    (asi_state_d[7:0]),
        .q      (asi_state_e[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// bit8 is unused.
dff_s #(8) stgd1_eva (
        .din    (exu_mmu_early_va_e[7:0]),
        .q      (early_va_m[7:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire alt_space_e;
dff_s #(6) stgd1_mref (
        .din    ({ifu_lsu_memref_d,thread0_d,thread1_d,thread2_d,thread3_d,ifu_tlu_alt_space_d}),
        .q      ({memref_e,thread0_e, thread1_e, thread2_e, thread3_e,alt_space_e}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s #(1) stgm_mref (
        .din    (memref_e),
        .q      (memref_m),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


// qualification with memref_d to cut down on number of speculative reads
// decode can be shared with corresponding enables
// gates can be shared.

// Establish that mra *could* be read by sync events. full decode would
// cause critical path.
assign	idmra_rd_d =
	//((asi_state_d[6:4] == 3'h6)  | // specifically tag-access.
	((asi_state_d[6:4] == 3'h5)  |
	 (asi_state_d[6:4] == 3'h3)) & ifu_tlu_alt_space_d & ifu_lsu_memref_d ;

// need to decode 58,59,5a,5B,31,32,39,3A,33,3B
// use lower hex. need to distinguish 1 & 2 between both accesses.
assign	dmra_rw_d =
	(asi_state_d[3:0] == 4'b1000)   | // 8	
	(((asi_state_d[3:0] == 4'b0001)  | // 1	
	(asi_state_d[3:0] == 4'b0010)) & asi_state_d[5])  | // 2 ;1 & 2 need distinction between I&D	
	(asi_state_d[3:0] == 4'b1001)   | // 9	
	(asi_state_d[3:0] == 4'b1010)   | // A	
	(asi_state_d[2:0] == 3'b011)   ; // partial B	
	

// Read requires that ctxt of access be chosen.
// ctxt_cfg,ps0_tsb,ps1_tsb require decode for ctxt.
// tag_access,ps0-ptr,ps1-ptr,direct-ptr,tag-target require lookup of logged ctxt. 
// ** Solution here is to exclude zctxt asi rds from equation.

assign idmra_nzctxt_rd_d =
	(asi_state_d[7:4] == 4'h3) &	// common
		((asi_state_d[3:0] == 4'h9) |	// dmmu_nzctxt_ps0_tsb
		(asi_state_d[3:0] == 4'hA) |	// dmmu_nzctxt_ps1_tsb
		(asi_state_d[3:0] == 4'hB) |	// dmmu_nzctxt_cfg
		(asi_state_d[3:0] == 4'hD) |	// immu_nzctxt_ps0_tsb
		(asi_state_d[3:0] == 4'hE) |	// immu_nzctxt_ps1_tsb
		(asi_state_d[3:0] == 4'hF)) & 	// immu_nzctxt_cfg
		ifu_tlu_alt_space_d & ifu_lsu_memref_d ;

// Fault based reads
assign	idmra_fault_rd_d =
	(asi_state_d[7:4] == 4'h5) &	// common
		((asi_state_d[3:0] == 4'h8) |	// dmmu_tag_access/target; va ignored
		(asi_state_d[3:0] == 4'h9) |	// dmmu_ps0_ptr
		(asi_state_d[3:0] == 4'hA) |	// dmmu_ps1_ptr
		(asi_state_d[3:0] == 4'hB) |	// direct_ptr
		(asi_state_d[3:0] == 4'h0) |	// immu_tag_access/target ; va ignored
		(asi_state_d[3:0] == 4'h1) |	// immu_ps0_ptr
		(asi_state_d[3:0] == 4'h2)) & 	// immu_ps1_ptr
		ifu_tlu_alt_space_d & ifu_lsu_memref_d ;


// Note - tag_access needs to be included.
always	@ (/*AUTOSENSE*/alt_space_e or asi_state_e or memref_e)
	begin	
		// DMMU
		dmmu_decode_asi58_e =
		 ({asi_state_e[7:0]} == {8'h58}) & alt_space_e & memref_e ; 	
		dmmu_8k_ptr_e =
		 ({asi_state_e[7:0]} == {8'h59}) & alt_space_e & memref_e ; 	
		dmmu_64k_ptr_e =
		 ({asi_state_e[7:0]} == {8'h5A}) & alt_space_e & memref_e ; 	
		dmmu_direct_ptr_e =
		 ({asi_state_e[7:0]} == {8'h5B}) & alt_space_e & memref_e ; 	
		dmmu_zctxt_ps0_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h31}) & alt_space_e & memref_e ; 	
		dmmu_zctxt_ps1_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h32}) & alt_space_e & memref_e ; 	
		dmmu_nzctxt_ps0_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h39}) & alt_space_e & memref_e ; 	
		dmmu_nzctxt_ps1_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h3A}) & alt_space_e & memref_e ; 	
		dmmu_zctxt_cfg_e = 
		 ({asi_state_e[7:0]} == {8'h33}) & alt_space_e & memref_e ; 	
		dmmu_nzctxt_cfg_e = 
		 ({asi_state_e[7:0]} == {8'h3B}) & alt_space_e & memref_e ; 	
		// IMMU
		immu_decode_asi50_e =
		 ({asi_state_e[7:0]} == {8'h50}) & alt_space_e & memref_e ; 	
		immu_8k_ptr_e =
		 ({asi_state_e[7:0]} == {8'h51}) & alt_space_e & memref_e ; 	
		immu_64k_ptr_e =
		 ({asi_state_e[7:0]} == {8'h52}) & alt_space_e & memref_e ; 	
		immu_zctxt_ps0_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h35}) & alt_space_e & memref_e ; 	
		immu_zctxt_ps1_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h36}) & alt_space_e & memref_e ; 	
		immu_nzctxt_ps0_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h3D}) & alt_space_e & memref_e ; 	
		immu_nzctxt_ps1_tsb_e = 
		 ({asi_state_e[7:0]} == {8'h3E}) & alt_space_e & memref_e ; 	
		immu_zctxt_cfg_e = 
		 ({asi_state_e[7:0]} == {8'h37}) & alt_space_e & memref_e ; 	
		immu_nzctxt_cfg_e = 
		 ({asi_state_e[7:0]} == {8'h3F}) & alt_space_e & memref_e ; 	
	end

wire immu_64k_ptr_m,immu_8k_ptr_m,dmmu_direct_ptr_m,dmmu_64k_ptr_m,
dmmu_8k_ptr_m ;
dff_s  #(19) fastasi_m (
        .din    ({dmmu_8k_ptr_e,dmmu_64k_ptr_e,dmmu_direct_ptr_e,
		dmmu_decode_asi58_e, immu_decode_asi50_e,
		dmmu_zctxt_ps0_tsb_e, dmmu_zctxt_ps1_tsb_e,
		dmmu_nzctxt_ps0_tsb_e, dmmu_nzctxt_ps1_tsb_e,
		dmmu_zctxt_cfg_e, dmmu_nzctxt_cfg_e,
		immu_zctxt_ps0_tsb_e, immu_zctxt_ps1_tsb_e,
		immu_nzctxt_ps0_tsb_e, immu_nzctxt_ps1_tsb_e,
		immu_zctxt_cfg_e, immu_nzctxt_cfg_e,
		immu_8k_ptr_e,immu_64k_ptr_e}),
        .q      ({dmmu_8k_ptr_m,dmmu_64k_ptr_m,dmmu_direct_ptr_m,
		dmmu_decode_asi58_m, immu_decode_asi50_m,
		dmmu_zctxt_ps0_tsb_m, dmmu_zctxt_ps1_tsb_m,
		dmmu_nzctxt_ps0_tsb_m, dmmu_nzctxt_ps1_tsb_m,
		dmmu_zctxt_cfg_m, dmmu_nzctxt_cfg_m,
		immu_zctxt_ps0_tsb_m, immu_zctxt_ps1_tsb_m,
		immu_nzctxt_ps0_tsb_m, immu_nzctxt_ps1_tsb_m,
		immu_zctxt_cfg_m, immu_nzctxt_cfg_m,
		immu_8k_ptr_m,immu_64k_ptr_m}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

assign	dmmu_tag_target_en_m = dmmu_decode_asi58_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_tag_access_en_m = dmmu_decode_asi58_m & (early_va_m[7:0] == 8'h30) ;
assign	dmmu_sync_fsr_en_m = dmmu_decode_asi58_m & (early_va_m[7:0] == 8'h18) ;
assign	dmmu_sync_far_en_m = dmmu_decode_asi58_m & (early_va_m[7:0] == 8'h20) ;
assign	dmmu_zctxt_ps0_tsb_en_m = dmmu_zctxt_ps0_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_zctxt_ps1_tsb_en_m = dmmu_zctxt_ps1_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_nzctxt_ps0_tsb_en_m = dmmu_nzctxt_ps0_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_nzctxt_ps1_tsb_en_m = dmmu_nzctxt_ps1_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_zctxt_cfg_en_m = dmmu_zctxt_cfg_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_nzctxt_cfg_en_m = dmmu_nzctxt_cfg_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_8k_ptr_en_m = dmmu_8k_ptr_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_64k_ptr_en_m = dmmu_64k_ptr_m & (early_va_m[7:0] == 8'h00) ;
assign	dmmu_direct_ptr_en_m = dmmu_direct_ptr_m & (early_va_m[7:0] == 8'h00) ;



// Calculation of dmmu illgl-va

wire	dmmu_sync_supported_asi_e ;
wire	dmmu_sync_supported_asi_m ;
assign	dmmu_sync_supported_asi_e =
	(dmmu_decode_asi58_e | dmmu_zctxt_ps0_tsb_e | dmmu_zctxt_ps1_tsb_e |
	dmmu_nzctxt_ps0_tsb_e | dmmu_nzctxt_ps1_tsb_e | dmmu_zctxt_cfg_e |
	dmmu_nzctxt_cfg_e | dmmu_8k_ptr_e | dmmu_64k_ptr_e | dmmu_direct_ptr_e);

dff_s stgm_dsynca (
        .din    (dmmu_sync_supported_asi_e),
        .q      (dmmu_sync_supported_asi_m),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	dmmu_sync_illgl_va_m ;
assign	dmmu_sync_illgl_va_m = dmmu_sync_supported_asi_m & ~(dmmu_tag_target_en_m |
	dmmu_tag_access_en_m | dmmu_sync_fsr_en_m | dmmu_sync_far_en_m | dmmu_tsb_en_m |
	dmmu_ctxt_cfg_en_m | dmmu_8k_ptr_en_m | dmmu_64k_ptr_en_m | dmmu_direct_ptr_en_m);

assign	dmmu_tsb_en_m = 
	dmmu_zctxt_ps0_tsb_en_m  | dmmu_zctxt_ps1_tsb_en_m |
	dmmu_nzctxt_ps0_tsb_en_m | dmmu_nzctxt_ps1_tsb_en_m ;
assign	dmmu_ctxt_cfg_en_m = dmmu_zctxt_cfg_en_m | dmmu_nzctxt_cfg_en_m ;

assign	immu_tag_target_en_m = immu_decode_asi50_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_tag_access_en_m = immu_decode_asi50_m & (early_va_m[7:0] == 8'h30) ;
assign	immu_sync_fsr_en_m = immu_decode_asi50_m & (early_va_m[7:0] == 8'h18) ;
assign	immu_zctxt_ps0_tsb_en_m = immu_zctxt_ps0_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_zctxt_ps1_tsb_en_m = immu_zctxt_ps1_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_nzctxt_ps0_tsb_en_m = immu_nzctxt_ps0_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_nzctxt_ps1_tsb_en_m = immu_nzctxt_ps1_tsb_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_zctxt_cfg_en_m = immu_zctxt_cfg_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_nzctxt_cfg_en_m = immu_nzctxt_cfg_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_8k_ptr_en_m = immu_8k_ptr_m & (early_va_m[7:0] == 8'h00) ;
assign	immu_64k_ptr_en_m = immu_64k_ptr_m & (early_va_m[7:0] == 8'h00) ;


assign	immu_tsb_en_m = 
	immu_zctxt_ps0_tsb_en_m  | immu_zctxt_ps1_tsb_en_m |
	immu_nzctxt_ps0_tsb_en_m | immu_nzctxt_ps1_tsb_en_m ;
assign	immu_ctxt_cfg_en_m = immu_zctxt_cfg_en_m | immu_nzctxt_cfg_en_m ;


// Calculation of immu illgl-va

wire	immu_sync_supported_asi_e ;
wire	immu_sync_supported_asi_m ;
assign	immu_sync_supported_asi_e =
	(immu_decode_asi50_e | immu_zctxt_ps0_tsb_e | immu_zctxt_ps1_tsb_e |
	immu_nzctxt_ps0_tsb_e | immu_nzctxt_ps1_tsb_e | immu_zctxt_cfg_e |
	immu_nzctxt_cfg_e | immu_8k_ptr_e | immu_64k_ptr_e);

dff_s stgm_isynca (
        .din    (immu_sync_supported_asi_e),
        .q      (immu_sync_supported_asi_m),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	immu_sync_illgl_va_m ;
assign	immu_sync_illgl_va_m = immu_sync_supported_asi_m & ~(immu_tag_target_en_m |
	immu_tag_access_en_m | immu_sync_fsr_en_m | immu_tsb_en_m | immu_ctxt_cfg_en_m |
	immu_8k_ptr_en_m | immu_64k_ptr_en_m);

dff_s #(2) stgg_illgl (
        .din    ({immu_sync_illgl_va_m,dmmu_sync_illgl_va_m}),
        .q      ({immu_sync_illgl_va_g,dmmu_sync_illgl_va_g}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Staged to g for writes
dff_s  #(17) fastasi_g (
        .din    ({dmmu_tag_access_en_m,
		dmmu_sync_fsr_en_m, dmmu_sync_far_en_m,
		dmmu_zctxt_ps0_tsb_en_m, dmmu_zctxt_ps1_tsb_en_m,
		dmmu_nzctxt_ps0_tsb_en_m, dmmu_nzctxt_ps1_tsb_en_m,
		dmmu_zctxt_cfg_en_m, dmmu_nzctxt_cfg_en_m,
        	immu_tag_access_en_m,
		immu_sync_fsr_en_m,
		immu_zctxt_ps0_tsb_en_m, immu_zctxt_ps1_tsb_en_m,
		immu_nzctxt_ps0_tsb_en_m, immu_nzctxt_ps1_tsb_en_m,
		immu_zctxt_cfg_en_m, immu_nzctxt_cfg_en_m}),
        .q      ({dmmu_tag_access_en,
		dmmu_sync_fsr_en, dmmu_sync_far_en,
		dmmu_zctxt_ps0_tsb_en, dmmu_zctxt_ps1_tsb_en,
		dmmu_nzctxt_ps0_tsb_en, dmmu_nzctxt_ps1_tsb_en,
		dmmu_zctxt_cfg_en, dmmu_nzctxt_cfg_en,
        	immu_tag_access_en,
		immu_sync_fsr_en,
		immu_zctxt_ps0_tsb_en, immu_zctxt_ps1_tsb_en,
		immu_nzctxt_ps0_tsb_en, immu_nzctxt_ps1_tsb_en,
		immu_zctxt_cfg_en, immu_nzctxt_cfg_en}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  


//=========================================================================================
//	MMU ASI Decode - D-Side
//=========================================================================================


// Assumption is that only 9 bits of VA are required.
// Comparison for asi-state and va is to be done uniformly in w2.

// This will have to change because of tsb mapping to mra.
	assign	dmmu_tsb_en = 
			dmmu_zctxt_ps0_tsb_en  | dmmu_zctxt_ps1_tsb_en |
			dmmu_nzctxt_ps0_tsb_en | dmmu_nzctxt_ps1_tsb_en ;

assign	tlb_ldst_inst_m = lsu_tlu_tlb_ld_inst_m | lsu_tlu_tlb_st_inst_m ;

// M-stage decoding for long-latency tlb accesses
always	@ (/*AUTOSENSE*/dmmu_inv_all_asi or lsu_tlu_tlb_asi_state_m
           or lsu_tlu_tlb_ldst_va_m[7:0] or tlb_ldst_inst_m)
	begin
		dmmu_data_in_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h5C,8'h00}) & tlb_ldst_inst_m ;
		dmmu_invalidate_all_en_m =
		 dmmu_inv_all_asi & tlb_ldst_inst_m ;
		 //({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h60,8'h08}) & tlb_ldst_inst_m ;
		// Address specifies tlb entry.
		dmmu_data_access_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h5D}) & 	tlb_ldst_inst_m ;
		// Address specifies tlb entry.
		dmmu_tag_read_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h5E}) & 	tlb_ldst_inst_m ;
		dmmu_demap_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h5F}) &  tlb_ldst_inst_m ;

        `ifndef NO_RTL_CSM
        dmmu_csm_in_en_m = 
		 ({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {`ASI_DMMU_CSM_IN_REG,8'h00}) & tlb_ldst_inst_m ;
        dmmu_csm_access_en_m = 
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {`ASI_DMMU_CSM_ACCESS_REG}) & 	tlb_ldst_inst_m ;
        `endif
	end

// Stage to g.
// Make dff->dffre. This required to avoid conflict between fast-asi and lng-latency
// rds of mra. Specifically, data-in/data_access need to be staged, along with
// support information.

wire lng_ltncy_en_d1 ;
assign	tlu_lng_ltncy_en_l = ~lng_ltncy_en_d1 | sehold ;
wire	lng_ltncy_en ;
dff_s stgd1_lltncyen (
        .din    (lng_ltncy_en),
        .q      (lng_ltncy_en_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	lng_ltncy_en = (lsu_tlu_tlb_st_inst_m | lsu_tlu_tlb_ld_inst_m) ;
wire	lng_ltncy_rst ;

`ifndef NO_RTL_CSM
assign	lng_ltncy_rst = 
	tlb_ld_inst_unflushed |		// all reads processed immediately
	(tlb_st_inst_unflushed & 	// all writes not requiring mra processed immediately
		~(dmmu_data_in_en | dmmu_data_access_en | immu_data_in_en | immu_data_access_en |
          dmmu_csm_in_en  | dmmu_csm_access_en | immu_csm_in_en | immu_csm_access_en)) |
	dmra_lng_lat_rd | imra_lng_lat_rd | // lng-ltncy rds - delay until bubble available.
	((tlb_ld_inst_unflushed | tlb_st_inst_unflushed) &  // rst w/o use if illgl-va
			(dmmu_async_illgl_va_g | immu_async_illgl_va_g)) |
	~rst_l ;

`else
assign	lng_ltncy_rst = 
	tlb_ld_inst_unflushed |		// all reads processed immediately
	(tlb_st_inst_unflushed & 	// all writes not requiring mra processed immediately
		~(dmmu_data_in_en | dmmu_data_access_en | immu_data_in_en | immu_data_access_en)) |
	dmra_lng_lat_rd | imra_lng_lat_rd | // lng-ltncy rds - delay until bubble available.
	((tlb_ld_inst_unflushed | tlb_st_inst_unflushed) &  // rst w/o use if illgl-va
			(dmmu_async_illgl_va_g | immu_async_illgl_va_g)) |
	~rst_l ;
`endif

dffe_s  #(`L1D_ADDRESS_HI) dtlbacc_stgg (
        .din    ({lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:3], lsu_tlu_tlb_access_tid_m[1:0]}),
        .q      ({tlb_ldst_va_g[`L1D_ADDRESS_HI:3],tlb_access_tid_g[1:0]}),
        .clk    (clk),
	.en	(lng_ltncy_en),
        .se     (1'b0),       .si (),          .so ()
        );  

`ifndef NO_RTL_CSM
dffre_s  #(9) dtlbaccr_stgg (
        .din    ({dmmu_csm_in_en_m,dmmu_csm_access_en_m,dmmu_data_in_en_m,dmmu_data_access_en_m,
        dmmu_tag_read_en_m,dmmu_demap_en_m,dmmu_invalidate_all_en_m,
		lsu_tlu_tlb_ld_inst_m,lsu_tlu_tlb_st_inst_m}),
        .q      ({dmmu_csm_in_en, dmmu_csm_access_en,dmmu_data_in_en,dmmu_data_access_en,dmmu_tag_read_en,
		dmmu_demap_en,dmmu_invalidate_all_en,
		tlb_ld_inst_unflushed,tlb_st_inst_unflushed}),
        .clk    (clk),
	.rst	(lng_ltncy_rst),	.en	(lng_ltncy_en),
        .se     (1'b0),       .si (),          .so ()
        );  

`else
dffre_s  #(7) dtlbaccr_stgg (
        .din    ({dmmu_data_in_en_m,dmmu_data_access_en_m,dmmu_tag_read_en_m,
 		dmmu_demap_en_m,dmmu_invalidate_all_en_m,
		lsu_tlu_tlb_ld_inst_m,lsu_tlu_tlb_st_inst_m}),
        .q      ({dmmu_data_in_en,dmmu_data_access_en,dmmu_tag_read_en,
		dmmu_demap_en,dmmu_invalidate_all_en,
		tlb_ld_inst_unflushed,tlb_st_inst_unflushed}),
        .clk    (clk),
	.rst	(lng_ltncy_rst),	.en	(lng_ltncy_en),
        .se     (1'b0),       .si (),          .so ()
        );  
`endif

assign	tlb_st_inst_g = tlb_st_inst_unflushed & ~(dmmu_async_illgl_va_g | immu_async_illgl_va_g) ;
assign	tlb_ld_inst_g = tlb_ld_inst_unflushed & ~(dmmu_async_illgl_va_g | immu_async_illgl_va_g) ;

assign	dsfsr_asi_wr_en[0] = dmmu_sync_fsr_en & st_inst_g & thread0_sel_g ;
assign	dsfsr_asi_wr_en[1] = dmmu_sync_fsr_en & st_inst_g & thread1_sel_g ;
assign	dsfsr_asi_wr_en[2] = dmmu_sync_fsr_en & st_inst_g & thread2_sel_g ;
assign	dsfsr_asi_wr_en[3] = dmmu_sync_fsr_en & st_inst_g & thread3_sel_g ;

assign	dmmu_any_sfsr_wr = dmmu_sync_fsr_en & st_inst_g ; //|(dsfsr_asi_wr_en[3:0]);

assign	dmmu_sfsr_wr_en_l[3:0] = 
~(dsfsr_asi_wr_en[3:0] | (dmmu_sfsr_trp_wr[3:0] & {4{~priority_squash_g}})) ; // Bug 4183

assign	dmmu_sfar_wr_en_l[0] = 
~((dmmu_sync_far_en & st_inst_g & thread0_sel_g) | 
(dmmu_sfsr_trp_wr[0] & ~priority_squash_g)) ; // Bug 4183
assign	dmmu_sfar_wr_en_l[1] = 
~((dmmu_sync_far_en & st_inst_g & thread1_sel_g) | 
(dmmu_sfsr_trp_wr[1] & ~priority_squash_g)) ; 
assign	dmmu_sfar_wr_en_l[2] = 
~((dmmu_sync_far_en & st_inst_g & thread2_sel_g) | 
(dmmu_sfsr_trp_wr[2] & ~priority_squash_g)) ; 
assign	dmmu_sfar_wr_en_l[3] = 
~((dmmu_sync_far_en & st_inst_g & thread3_sel_g) | 
(dmmu_sfsr_trp_wr[3] & ~priority_squash_g)) ; 


`ifndef NO_RTL_CSM
assign	dmmu_csm_in_wr_en = dmmu_csm_in_en & tlb_st_inst_g ;	// Write-Only.
assign	dmmu_csm_access_wr_en = dmmu_csm_access_en & tlb_st_inst_g ;
// non-threaded as shared resource
assign	dmmu_csm_access_rd_en = dmmu_csm_access_en & tlb_ld_inst_g ;
`endif
assign	dmmu_data_in_wr_en = dmmu_data_in_en & tlb_st_inst_g ;	// Write-Only.
assign	dmmu_data_access_wr_en = dmmu_data_access_en & tlb_st_inst_g ;
// non-threaded as shared resource
assign	dmmu_data_access_rd_en = dmmu_data_access_en & tlb_ld_inst_g ;

// take exception for write case.
assign	dmmu_tag_read_rd_en = dmmu_tag_read_en & tlb_ld_inst_g ;


`ifndef NO_RTL_CSM
assign	dtlb_rw_index_vld_g = dmmu_data_access_rd_en | dmmu_data_access_wr_en | dmmu_tag_read_rd_en |
                              dmmu_csm_access_rd_en | dmmu_csm_access_wr_en;
// terminate write if tlb full and signal exception.
assign	dtlb_wr_vld_g = (dmmu_data_in_wr_en | dmmu_data_access_wr_en | dmmu_csm_in_wr_en | dmmu_csm_access_wr_en) 
                        & ~ifu_lsu_memref_d ;
`else
assign	dtlb_rw_index_vld_g = dmmu_data_access_rd_en | dmmu_data_access_wr_en | dmmu_tag_read_rd_en ;
// terminate write if tlb full and signal exception.
assign	dtlb_wr_vld_g = (dmmu_data_in_wr_en | dmmu_data_access_wr_en) & ~ifu_lsu_memref_d ;
`endif

`ifndef NO_RTL_CSM
wire dtlb_wr_csm_sel_g;
wire dtlb_wr_csm_sel_pend;
assign dtlb_wr_csm_sel_g = dmmu_csm_in_wr_en | dmmu_csm_access_wr_en;
dffre_s  #(1) stgw2_dtlbcsm (
        .din    (dtlb_wr_csm_sel_g),
        .q    	(dtlb_wr_csm_sel_pend),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  
`endif

wire		dtlb_rw_index_vld_pend ;
wire [5:0]	dtlb_rw_index_pend ;

dffre_s  #(1) stgw2_dtlbctl (
        .din    (dtlb_rw_index_vld_g),
        .q    	(dtlb_rw_index_vld_pend),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dffre_s  #(6) stgw2_dtlbidx (
        .din    (tlb_ldst_va_g[8:3]),
        .q    	(dtlb_rw_index_pend[5:0]),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

wire	tlb_rd_mode, tlb_rd_mode_d1 ;
assign	tlb_rd_mode = 
		tlu_itlb_tag_rd_g | tlu_itlb_data_rd_g |	// i-side read
		tlu_dtlb_tag_rd_g | tlu_dtlb_data_rd_g ;	// d-side read

dff_s stgd1_rmode (
        .din    (tlb_rd_mode),
        .q      (tlb_rd_mode_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	dtlb_done_d1 ;	
dff_s stgd1_ddone (
        .din    (lsu_tlu_dtlb_done),
        .q      (dtlb_done_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	itlb_done_d1 ;	
dff_s stgd1_idone (
        .din    (ifu_tlu_itlb_done),
        .q      (itlb_done_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Advanced by a cycle.
assign	tlu_dtlb_rw_index_vld_g  = dtlb_rw_index_vld_g | dtlb_rw_index_vld_pend ;
//assign	tlu_dtlb_rw_index_vld_g  = dtlb_rw_index_vld_g | (dtlb_rw_index_vld_pend & ~dtlb_done_d1) ; //Bug3974
//assign	tlu_dtlb_rw_index_vld_g  = dtlb_rw_index_vld_g | (dtlb_rw_index_vld_pend & ~lsu_tlu_dtlb_done) ;
assign	tlu_dtlb_rw_index_g[5:0] = (tlb_ldst_va_g[8:3] & {6{~(tlb_admp_mode | tlb_write_mode | tlb_rd_mode_d1)}})  | 
					dtlb_rw_index_pend[5:0]  ;
`ifndef NO_RTL_CSM
assign	tlu_dtlb_wr_csm_sel_g = (dtlb_wr_csm_sel_g & {~(tlb_admp_mode | tlb_write_mode | tlb_rd_mode_d1)})  | 
					dtlb_wr_csm_sel_pend ;
`endif

// Exception on reserved field.
assign	demap_pctxt = ~tlb_ldst_va_g[5] & ~tlb_ldst_va_g[4] ;
assign	demap_sctxt = ~tlb_ldst_va_g[5] &  tlb_ldst_va_g[4] ;
assign	demap_nctxt =  tlb_ldst_va_g[5] & ~tlb_ldst_va_g[4] ;
// reserved ctxt causes demap to be ignored.
// reserved dmp type causes demap to be ignored.
assign	demap_resrv =  	(tlb_ldst_va_g[5] &  tlb_ldst_va_g[4]) 		// ctxt
			| (tlb_ldst_va_g[7] &  tlb_ldst_va_g[6]) ;	// type

assign	ddemap_by_page  = dmmu_demap_en & ~tlb_ldst_va_g[7] & ~tlb_ldst_va_g[6] ;
assign	ddemap_by_ctxt  = dmmu_demap_en & ~tlb_ldst_va_g[7] &  tlb_ldst_va_g[6] ;
assign	ddemap_all      = dmmu_demap_en &  tlb_ldst_va_g[7] & ~tlb_ldst_va_g[6] ;

// assumption is that demap_all is unaffected by presence of reserved ctxt as it
// does not use ctxt.
assign	ddemap_vld  	= ((ddemap_by_page | ddemap_by_ctxt) & ~demap_resrv) | 
				ddemap_all ;

//wire		dtlb_dmp_by_ctxt_pend ;
wire		dtlb_dmp_all_pend ;
wire		dtlb_dmp_pctxt_pend ;
wire		dtlb_dmp_sctxt_pend ;
wire		dtlb_dmp_nctxt_pend ;
wire	[1:0]	idtlb_dmp_thrid_pend ;
wire	[1:0]	ldst_asi_tid ;
wire		dmmu_inv_all_g, dmmu_inv_all_pend ;

assign	dmmu_inv_all_g = dmmu_invalidate_all_en & tlb_st_inst_g ;

// Demap/Invalidate
dffre_s  #(5) stgw2_dtlbdmp (
        .din    ({ddemap_all,demap_pctxt,demap_sctxt,demap_nctxt,dmmu_inv_all_g}),
        .q    	({dtlb_dmp_all_pend,dtlb_dmp_pctxt_pend,dtlb_dmp_sctxt_pend, 
		dtlb_dmp_nctxt_pend,dmmu_inv_all_pend }),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

// Bug 3905 - rm from above flop.
assign	idtlb_dmp_thrid_pend[1:0] = tlb_access_tid_g[1:0] ;

assign	ldst_asi_tid[1:0] = 
	(lsu_tlu_dtlb_done | dmmu_async_illgl_va_g | immu_async_illgl_va_g)  ?  
	idtlb_dmp_thrid_pend[1:0] : thrid_g[1:0] ;

// Thread for tlb
dff_s  #(4) stg_w2 (
        .din    ({ldst_asi_tid[1:0],idtlb_dmp_thrid_pend[1:0]}),
        .q      ({tlu_lsu_ldxa_tid_w2[1:0],tlu_lsu_stxa_ack_tid[1:0]}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

assign	tlu_dtlb_invalidate_all_g = dmmu_inv_all_g | (dmmu_inv_all_pend & ~dtlb_done_d1) ;
//assign	tlu_dtlb_invalidate_all_g = dmmu_inv_all_g | (dmmu_inv_all_pend & ~lsu_tlu_dtlb_done) ;

// Timing Change : Delay by a cycle to match vlds.
wire  pre_dtlb_dmp_all, pre_dtlb_dmp_pctxt ;
wire pre_dtlb_dmp_sctxt, pre_dtlb_dmp_nctxt, pre_dtlb_dmp_actxt ;
//assign	pre_dtlb_dmp_by_ctxt = (ddemap_by_ctxt | dtlb_dmp_by_ctxt_pend) & ~tlu_admp_key_sel  ;
assign	pre_dtlb_dmp_all = (ddemap_all | dtlb_dmp_all_pend) & ~tlu_admp_key_sel ;
assign	pre_dtlb_dmp_pctxt = (dtlb_dmp_pctxt_pend) & ~tlu_admp_key_sel ;
assign	pre_dtlb_dmp_sctxt = (dtlb_dmp_sctxt_pend) & ~tlu_admp_key_sel ;
assign	pre_dtlb_dmp_nctxt = (dtlb_dmp_nctxt_pend) & ~tlu_admp_key_sel ;
assign	pre_dtlb_dmp_actxt = tlu_admp_key_sel ;

dff_s  #(5) dmp_stgd1 (
        .din    ({pre_dtlb_dmp_all, pre_dtlb_dmp_pctxt,
		pre_dtlb_dmp_sctxt, pre_dtlb_dmp_nctxt, pre_dtlb_dmp_actxt}),
        .q      ({tlu_dtlb_dmp_all_g,tlu_dtlb_dmp_pctxt_g,
		tlu_dtlb_dmp_sctxt_g,tlu_dtlb_dmp_nctxt_g,tlu_dtlb_dmp_actxt_g}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

assign	tlu_idtlb_dmp_thrid_g = tlb_access_tid_g[1:0] | idtlb_dmp_thrid_pend[1:0] ;


//=========================================================================================
//	MMU ASI Decode - I-Side
//=========================================================================================

// Assumption is that only 9 bits of VA are required.
// Comparison for asi-state and va is to be done uniformly in w2.

	assign	immu_tsb_en =
			immu_zctxt_ps0_tsb_en  | immu_zctxt_ps1_tsb_en |
			immu_nzctxt_ps0_tsb_en | immu_nzctxt_ps1_tsb_en ;
`ifndef NO_RTL_CSM
reg immu_csm_in_en_m, immu_csm_access_en_m;
`endif
reg	immu_data_in_en_m,immu_data_access_en_m,immu_tag_read_en_m,immu_demap_en_m;

// M-stage decoding for long-latency tlb accesses
always	@ (/*AUTOSENSE*/immu_inv_all_asi or lsu_tlu_tlb_asi_state_m
           or lsu_tlu_tlb_ldst_va_m[7:0] or tlb_ldst_inst_m)
	begin
		immu_data_in_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h54,8'h00}) & tlb_ldst_inst_m ;  	
		// Address specifies tlb entry.
		immu_invalidate_all_en_m =
		 immu_inv_all_asi & tlb_ldst_inst_m ;
		 //({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {8'h60,8'h00}) & tlb_ldst_inst_m ;
		immu_data_access_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h55}) & tlb_ldst_inst_m ; 	
		// Address specifies tlb entry.
		immu_tag_read_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h56}) & tlb_ldst_inst_m ; 	
		immu_demap_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {8'h57}) & tlb_ldst_inst_m ; 
        `ifndef NO_RTL_CSM
		immu_csm_in_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0],lsu_tlu_tlb_ldst_va_m[7:0]} == {`ASI_IMMU_CSM_IN_REG,8'h00}) & tlb_ldst_inst_m ;  	
		immu_csm_access_en_m =
		 ({lsu_tlu_tlb_asi_state_m[7:0]} == {`ASI_IMMU_CSM_ACCESS_REG}) & tlb_ldst_inst_m ; 	
        `endif	
	end

// Stage to g.
// Convert to dffre to resolve conflict between fast-asi and lng-ltncy reads.

`ifndef NO_RTL_CSM
dffre_s #(7) itlbacc_stgg (
        .din    ({immu_csm_in_en_m,immu_csm_access_en_m,immu_data_in_en_m,immu_data_access_en_m,
                  immu_tag_read_en_m,immu_demap_en_m,immu_invalidate_all_en_m}),
        .q      ({immu_csm_in_en, immu_csm_access_en,immu_data_in_en,immu_data_access_en,
                  immu_tag_read_en,immu_demap_en,immu_invalidate_all_en}),
        .clk    (clk),
	.rst	(lng_ltncy_rst), 	.en	(lng_ltncy_en),
        .se     (1'b0),       .si (),          .so ()
        );  
`else
dffre_s #(5) itlbacc_stgg (
        .din    ({immu_data_in_en_m,immu_data_access_en_m,immu_tag_read_en_m,immu_demap_en_m,immu_invalidate_all_en_m}),
        .q      ({immu_data_in_en,immu_data_access_en,immu_tag_read_en,immu_demap_en,immu_invalidate_all_en}),
        .clk    (clk),
	.rst	(lng_ltncy_rst), 	.en	(lng_ltncy_en),
        .se     (1'b0),       .si (),          .so ()
        );  
`endif

assign	isfsr_asi_wr_en[0] = immu_sync_fsr_en & st_inst_g & thread0_sel_g ;
assign	isfsr_asi_wr_en[1] = immu_sync_fsr_en & st_inst_g & thread1_sel_g ;
assign	isfsr_asi_wr_en[2] = immu_sync_fsr_en & st_inst_g & thread2_sel_g ;
assign	isfsr_asi_wr_en[3] = immu_sync_fsr_en & st_inst_g & thread3_sel_g ;

assign	immu_any_sfsr_wr = immu_sync_fsr_en & st_inst_g ; //|(isfsr_asi_wr_en[3:0]);

assign	immu_sfsr_wr_en_l[3:0] = ~(isfsr_trp_wr[3:0] | isfsr_asi_wr_en[3:0]) ;

assign	immu_tsb_rd_en[0] = immu_tsb_en & ld_inst_g & thread0_sel_g ;
assign	immu_tsb_rd_en[1] = immu_tsb_en & ld_inst_g & thread1_sel_g ;
assign	immu_tsb_rd_en[2] = immu_tsb_en & ld_inst_g & thread2_sel_g ;
assign	immu_tsb_rd_en[3] = immu_tsb_en & ld_inst_g & thread3_sel_g ;

assign	immu_data_in_wr_en = immu_data_in_en & tlb_st_inst_g ;	// Write-Only.
assign	immu_data_access_wr_en = immu_data_access_en & tlb_st_inst_g ;
assign	immu_data_access_rd_en = immu_data_access_en & tlb_ld_inst_g ;

`ifndef NO_RTL_CSM
wire immu_csm_access_rd_en;
assign	immu_csm_in_wr_en = immu_csm_in_en & tlb_st_inst_g ;	// Write-Only.
assign	immu_csm_access_wr_en = immu_csm_access_en & tlb_st_inst_g ;
assign	immu_csm_access_rd_en = immu_csm_access_en & tlb_ld_inst_g ;
`endif

assign	immu_tag_read_rd_en = immu_tag_read_en & tlb_ld_inst_g ;

`ifndef NO_RTL_CSM
assign	itlb_rw_index_vld_g = immu_csm_access_rd_en | immu_csm_access_wr_en | 
                              immu_data_access_rd_en | immu_data_access_wr_en | immu_tag_read_rd_en ;
// terminate write if tlb full and signal exception.
assign	itlb_wr_vld_g = (immu_csm_in_wr_en | immu_csm_access_wr_en |
                         immu_data_in_wr_en | immu_data_access_wr_en) & ~ifu_lsu_memref_d ;
`else
assign	itlb_rw_index_vld_g = immu_data_access_rd_en | immu_data_access_wr_en | immu_tag_read_rd_en ;
// terminate write if tlb full and signal exception.
assign	itlb_wr_vld_g = (immu_data_in_wr_en | immu_data_access_wr_en) & ~ifu_lsu_memref_d ;
`endif

`ifndef NO_RTL_CSM
wire itlb_wr_csm_sel_g;
wire itlb_wr_csm_sel_pend;
assign itlb_wr_csm_sel_g = immu_csm_in_wr_en | immu_csm_access_wr_en;
dffre_s  #(1) stgw2_itlbcsm (
        .din    (itlb_wr_csm_sel_g),
        .q    	(itlb_wr_csm_sel_pend),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  
`endif



wire	itlb_rw_index_vld_pend ;

dffre_s #(1)  stgw2_itlbctl (
        .din    (itlb_rw_index_vld_g),
        .q    	(itlb_rw_index_vld_pend),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	tlu_itlb_rw_index_vld_g  = itlb_rw_index_vld_g | (itlb_rw_index_vld_pend & ~itlb_done_d1) ;
assign	tlu_itlb_rw_index_g[5:0] = tlu_dtlb_rw_index_g[5:0] ;

`ifndef NO_RTL_CSM
assign	tlu_itlb_wr_csm_sel_g = (itlb_wr_csm_sel_g & {~(tlb_admp_mode | tlb_write_mode | tlb_rd_mode_d1)})  | 
					itlb_wr_csm_sel_pend ;
`endif

assign	idemap_by_page  = immu_demap_en & ~tlb_ldst_va_g[7] & ~tlb_ldst_va_g[6] ;
assign	idemap_by_ctxt  = immu_demap_en & ~tlb_ldst_va_g[7] &  tlb_ldst_va_g[6] ;
assign	idemap_all      = immu_demap_en &  tlb_ldst_va_g[7] & ~tlb_ldst_va_g[6] ;

// assumption is that demap_all is unaffected by presence of reserved ctxt as it
// does not use ctxt.
assign	idemap_vld  	= ((idemap_by_page | idemap_by_ctxt) & ~(demap_resrv | demap_sctxt)) | 
				idemap_all ;

wire	itlb_dmp_by_ctxt_pend ;
wire	itlb_dmp_all_pend ;
wire	immu_inv_all_g, immu_inv_all_pend ;

assign	immu_inv_all_g = immu_invalidate_all_en & tlb_st_inst_g ;

// Demap
dffre_s  #(3) stgw2_itlbdmp (
        .din    ({idemap_by_ctxt,idemap_all,immu_inv_all_g}),
        .q    	({itlb_dmp_by_ctxt_pend, itlb_dmp_all_pend,immu_inv_all_pend}),
	.rst	(tlb_access_rst),	.en	(tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	tlu_itlb_dmp_all_g = (idemap_all | itlb_dmp_all_pend) & ~tlu_admp_key_sel ;

assign	tlu_itlb_invalidate_all_g = immu_inv_all_g | (immu_inv_all_pend & ~itlb_done_d1) ;
assign	tlu_itlb_dmp_pctxt_g = tlu_dtlb_dmp_pctxt_g ;  

// Timing Change - delay by 1-cycle to match vld.
wire	pre_itlb_dmp_actxt ;
assign	pre_itlb_dmp_actxt = tlu_admp_key_sel ;
dff_s  #(1) preidmp_d1 (
        .din    (pre_itlb_dmp_actxt),
        .q    	(tlu_itlb_dmp_actxt_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	tlu_itlb_dmp_nctxt_g = tlu_dtlb_dmp_nctxt_g ;  


// Adapt key vlds to autodemap.
// Note that sense of global bit has changed. Otherwise vlds remain same.
assign	tlu_dmp_key_vld_g[4:0] = 
	(ddemap_by_ctxt | idemap_by_ctxt) ? 5'b00000 : 			// demap-ctxt - include only ctxt 
			(ddemap_all | idemap_all) ? 5'b00001 : 		// demap-all - do not include va or ctxt
			// Bug 3129		5'b11110 ;	        // else include both va and ctxt
				tlb_ldst_va_g[9] ? 5'b11111 :           // include va and NO ctxt;dmp-pg-real
                                                       5'b11110 ;       // include both va and ctxt; dmp-pg

// real tte for demap and write. both are indicated in bit 9 of va.
// demap_by_ctxt will not effect real translations.
assign	tlu_tte_real_g = tlb_ldst_va_g[9] & ~(ddemap_by_ctxt | idemap_by_ctxt) ;

//=========================================================================================
//	EXCEPTIONS
//=========================================================================================

// Now generated in LSU.

// These are all related to asi use.
/*assign	tlu_mmu_sync_data_excp_g = 
	(immu_sync_rd_only_asi_g | dmmu_sync_rd_only_asi_g) & st_inst_unflushed & inst_vld_g  ;*/

//=========================================================================================
//	TAG/DATA RD/WR/DMP HANDSHAKE
//=========================================================================================

// RD/WR HANDSHAKE
// Need to add autodemap capability.

// Assume mutually exclusive by construction.

`ifndef NO_RTL_CSM
assign	tlb_access_en = itlb_wr_vld_g | immu_data_access_rd_en | immu_tag_read_rd_en | immu_csm_access_rd_en |
			dtlb_wr_vld_g | dmmu_data_access_rd_en | dmmu_tag_read_rd_en | dmmu_csm_access_rd_en |
			idemap_vld    | ddemap_vld | immu_inv_all_g | dmmu_inv_all_g ;
`else
assign	tlb_access_en = itlb_wr_vld_g | immu_data_access_rd_en | immu_tag_read_rd_en |
			dtlb_wr_vld_g | dmmu_data_access_rd_en | dmmu_tag_read_rd_en |
			idemap_vld    | ddemap_vld | immu_inv_all_g | dmmu_inv_all_g ;
`endif
assign	tlb_access_en_l = ~tlb_access_en ;
assign	tlb_access_rst = ~rst_l | ((lsu_tlu_dtlb_done | ifu_tlu_itlb_done) & ~(tlb_admp_mode | tlb_admp_mode_d1)) ; 
assign 	tlb_access_rst_l = ~tlb_access_rst ;	

wire	tlb_access_en_l_d1 ;
dff_s  #(1) stgd1_tlbacc (
        .din    (tlb_access_en_l),
        .q      (tlb_access_en_l_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign	tlu_tlb_access_en_l_d1 = tlb_access_en_l_d1 | sehold ;

`ifndef NO_RTL_CSM
assign	itlb_tag_rd_en = immu_tag_read_rd_en | immu_data_access_rd_en | immu_csm_access_rd_en;	
assign	dtlb_tag_rd_en = dmmu_tag_read_rd_en | dmmu_data_access_rd_en | dmmu_csm_access_rd_en;	
`else
assign	itlb_tag_rd_en = immu_tag_read_rd_en | immu_data_access_rd_en ;	
assign	dtlb_tag_rd_en = dmmu_tag_read_rd_en | dmmu_data_access_rd_en ;	
`endif


`ifndef NO_RTL_CSM
dffre_s #(10)  tlb_access (
        .din    ({immu_csm_access_rd_en, dmmu_csm_access_rd_en,itlb_wr_vld_g,immu_data_access_rd_en,itlb_tag_rd_en,
        	dtlb_wr_vld_g,dmmu_data_access_rd_en,dtlb_tag_rd_en,
		idemap_vld, ddemap_vld}),
        .q    	({itlb_csm_rd_pend,dtlb_csm_rd_pend,itlb_wr_pend,itlb_data_rd_pend,itlb_tag_rd_pend,
        	dtlb_wr_pend,dtlb_data_rd_pend,dtlb_tag_rd_pend,
		idemap_pend, ddemap_pend}),
        .rst    (tlb_access_rst),	.en     (tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dffre_s #(8)  tlb_access (
        .din    ({itlb_wr_vld_g,immu_data_access_rd_en,itlb_tag_rd_en,
        	dtlb_wr_vld_g,dmmu_data_access_rd_en,dtlb_tag_rd_en,
		idemap_vld, ddemap_vld}),
        .q    	({itlb_wr_pend,itlb_data_rd_pend,itlb_tag_rd_pend,
        	dtlb_wr_pend,dtlb_data_rd_pend,dtlb_tag_rd_pend,
		idemap_pend, ddemap_pend}),
        .rst    (tlb_access_rst),	.en     (tlb_access_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`ifndef NO_RTL_CSM
assign  tlu_dtlb_rd_done  = lsu_tlu_dtlb_done & (dtlb_data_rd_pend | dtlb_csm_rd_pend | dtlb_tag_rd_pend) ;
`else
assign  tlu_dtlb_rd_done  = lsu_tlu_dtlb_done & (dtlb_data_rd_pend | dtlb_tag_rd_pend) ;
`endif
//assign  itlb_rd_done  = ifu_tlu_itlb_done & (itlb_data_rd_pend | itlb_tag_rd_pend) ;


// w2 should be renamed to g at some time !!!
// Write may take one extra cycle to get initiated !!!
assign	itlb_wr_vld_unmsked = (itlb_wr_vld_g | (itlb_wr_pend & ~itlb_done_d1)) ;
wire    pre_itlb_wr_vld_g ;
assign pre_itlb_wr_vld_g = (itlb_wr_pend & ~itlb_done_d1) & tlb_write_mode ;
//assign pre_itlb_wr_vld_g = itlb_wr_vld_unmsked & tlb_write_mode ;
// name kept as _g for now to avoid interface change.

assign	tlu_itlb_wr_vld_g = pre_itlb_wr_vld_g ;
/*dff  #(1) iwvld_d1 (
        .din    (pre_itlb_wr_vld_g),
        .q    	(tlu_itlb_wr_vld_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        ); */

`ifndef NO_RTL_CSM
assign	tlu_itlb_csm_rd_g = immu_csm_access_rd_en | (itlb_csm_rd_pend & ~itlb_done_d1) ;
`endif
assign	tlu_itlb_data_rd_g = immu_data_access_rd_en | (itlb_data_rd_pend & ~itlb_done_d1) ;
assign	tlu_itlb_tag_rd_g = (immu_tag_read_rd_en | immu_data_access_rd_en) | (itlb_tag_rd_pend & ~itlb_done_d1) ;

assign	dtlb_wr_vld_unmsked = (dtlb_wr_vld_g | (dtlb_wr_pend & ~dtlb_done_d1)) ;
wire    pre_dtlb_wr_vld_g ;
assign pre_dtlb_wr_vld_g = (dtlb_wr_pend & ~dtlb_done_d1) & tlb_write_mode ;
// name kept as _g for now to avoid interface change.

//assign	tlu_dtlb_wr_vld_g = pre_dtlb_wr_vld_g ;
`ifndef NO_RTL_CSM
assign	tlu_dtlb_csm_rd_g = dmmu_csm_access_rd_en | (dtlb_csm_rd_pend & ~dtlb_done_d1) ;
`endif
assign	tlu_dtlb_data_rd_g = dmmu_data_access_rd_en | (dtlb_data_rd_pend & ~dtlb_done_d1) ;
assign	tlu_dtlb_tag_rd_g = (dmmu_tag_read_rd_en | dmmu_data_access_rd_en) | (dtlb_tag_rd_pend & ~dtlb_done_d1) ;

// Delay by a cycle - rd for long-latency matches fast-asi.
// Both occur on a posedge.

wire	dtlb_dmp_vld_g,itlb_dmp_vld_g;
assign	dtlb_dmp_vld_g = 
		// qual with dtlb-done may not be needed. Taken into account in ddemap_pend.
		(ddemap_pend & ~dtlb_done_d1) | 
		(dtlb_wr_vld_unmsked & tlb_admp_mode) ;
assign	itlb_dmp_vld_g = 
		(idemap_pend & ~itlb_done_d1) |
		(itlb_wr_vld_unmsked & tlb_admp_mode) ; 
// dmp_vld should be w2. kept as _g for now to avoid
// interface change.
wire	dtlb_dmp_vld_d1,itlb_dmp_vld_d1 ;
dff_s  #(2) dmpvld_d1 (
        .din    ({dtlb_dmp_vld_g,itlb_dmp_vld_g}),
        .q    	({dtlb_dmp_vld_d1,itlb_dmp_vld_d1}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );
assign	tlu_dtlb_dmp_vld_g = dtlb_dmp_vld_d1 & ~dtlb_done_d1 ;
assign	tlu_itlb_dmp_vld_g = itlb_dmp_vld_d1 & ~itlb_done_d1 ;

wire	stxa_ack ;

// Assume mutually exclusive.
// Third term is meant to complete demap with reserved ctxt.
assign	stxa_ack = 
	(((itlb_wr_pend | dtlb_wr_pend) & ~(tlb_admp_mode | tlb_admp_mode_d1)) 	| 
	idemap_pend | ddemap_pend | immu_inv_all_pend | dmmu_inv_all_pend) & (lsu_tlu_dtlb_done | ifu_tlu_itlb_done) 	|
	(demap_resrv & tlb_st_inst_g & 
		((immu_demap_en & ~idemap_all)  | (dmmu_demap_en & ~ddemap_all))) | //5053
	(demap_sctxt & tlb_st_inst_g & (immu_demap_en & ~idemap_all)) | // Bug5053				  
						// iside should not use sctxt
	// lng-latency store needs to signal cmplt to lsu even with illegal va
	(tlb_st_inst_unflushed & (dmmu_async_illgl_va_g | immu_async_illgl_va_g)) ;

dff_s  #(1) stack_d1 (
        .din    (stxa_ack),
        .q    	(tlu_lsu_stxa_ack),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//=========================================================================================
//	AUTODEMAP
//=========================================================================================


assign	tlb_wr_vld_g = itlb_wr_vld_unmsked | dtlb_wr_vld_unmsked ;

assign	tlb_admp_en   = tlb_wr_vld_g & ~tlb_admp_mode & ~tlb_write_mode ;
assign	tlb_admp_rst  = ~rst_l | 
	(((itlb_wr_pend | dtlb_wr_pend) & (lsu_tlu_dtlb_done | ifu_tlu_itlb_done)) & tlb_admp_mode) ;
assign	tlb_wr_rst  = ~rst_l | 
	(((itlb_wr_pend | dtlb_wr_pend) & (lsu_tlu_dtlb_done | ifu_tlu_itlb_done)) 
			& tlb_write_mode & ~tlb_admp_mode_d1) ;

assign	tlu_admp_key_sel = (dtlb_wr_vld_g | itlb_wr_vld_g) | tlb_admp_mode ;

// 1st Phase - Autodemap
dffre_s  #(1) dmp1_ff (
        .din    (tlb_wr_vld_g),
        .q    	(tlb_admp_mode),
	.rst	(tlb_admp_rst),	.en	(tlb_admp_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );


// this is temporary - IFU is spuriously sourcing extra done signal.
dff_s  #(1) admp_d1 (
        .din    (tlb_admp_mode),
        .q    	(tlb_admp_mode_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// 2nd Phase - Follow-up with Write
dffre_s  #(1) dmp2_ff (
        .din    (tlb_admp_rst),
        .q    	(tlb_write_mode),
	.rst	(tlb_wr_rst),	.en	(tlb_admp_rst),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//=========================================================================================

wire    tlu_ldxa_async_data_vld ;
assign  tlu_ldxa_async_data_vld =
        tlu_dtlb_rd_done                |
        (tlb_ld_inst_unflushed & (dmmu_async_illgl_va_g | immu_async_illgl_va_g)) ;

assign	tlu_dldxa_data_vld = 
// ** need to qualify with inst_vld in LSU
	((dmmu_tag_target_en_m 	|
	 dmmu_8k_ptr_en_m 	| 
	 dmmu_64k_ptr_en_m 	|
	 dmmu_direct_ptr_en_m   |
	 dmmu_tsb_en_m		|
	 dmmu_tag_access_en_m   |
         dmmu_sync_fsr_en_m     |
         dmmu_sync_far_en_m     |
         dmmu_ctxt_cfg_en_m) & ld_inst_m) ;
	//tlu_dtlb_rd_done		| // complete thru lsu
	// for sync/async lng-latency ldxa with illegal va
	// MMU_ASI
	//(ld_inst_g & dmmu_sync_illgl_va_g) |
	//(tlb_ld_inst_unflushed & dmmu_async_illgl_va_g) ;

assign	tlu_ildxa_data_vld = 
// ** need to qualify with inst_vld in LSU
	((immu_tag_target_en_m  	| 
	 immu_8k_ptr_en_m  	 	| 
	 immu_64k_ptr_en_m 		|
 	 immu_tsb_en_m                  |
         immu_tag_access_en_m           |
         immu_sync_fsr_en_m             |
         immu_ctxt_cfg_en_m) & ld_inst_m)  ;
	// for sync/async lng-latency ldxa with illegal va
 	// MMU_ASI
	//(ld_inst_g & immu_sync_illgl_va_g) |
	//(tlb_ld_inst_unflushed & immu_async_illgl_va_g) ;

assign  tlu_ldxa_data_vld = tlu_ildxa_data_vld | tlu_dldxa_data_vld ;

 	// Flush needs to be removed.
	assign	lsu_exu_ldxa_m = tlu_ldxa_data_vld & ~(dmmu_sync_illgl_va_m | immu_sync_illgl_va_m);

dff_s #(1) stg_asyncdvld (
        .din    (tlu_ldxa_async_data_vld),
        .q    	(tlu_lsu_ldxa_async_data_vld),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//=========================================================================================
//	SFSR/SFAR Control
//=========================================================================================

// In tcl

//=========================================================================================
//	PS0 and PS1 Ptr Registers (NEW !!!!)
//=========================================================================================

// If N=TSB_Size, P=Page_Size, then
// Ptr = TSB_Base<63:13+N> | VA<21+N+3xP:13+3xP> | 0000	if TSB not split
// Ptr = TSB_Base<63:14+N> | 0 | VA<21+N+3xP:13+3xP> | 0000 if TSB split
// Assume P=0(8K),1(64K),3(4M),5(256M).
// Note that Nmax=11 even though N=0..15, for 256M page. This is because VA cannot exceed 47 for ms bit.
// Otherwise entire range of N can be covered by all 3 remaining page-size.

// Timing :
//
//	|   D-stage  |	E-stage	| M-stage | W-stage    |	
//	| Read setup | Read +	| Logic + | Latched in |
//	| to mra     | Logic	| xmit	  | LSU. Select|	
//	|	     |		|	  | for wr-back|	
//

// TSB Size Logic - Form 8 bits for 8k and 64k Ptr regs respectively.

// Macrotest support for logic in shadow of mra scan collar.
// Scan only. Scan value valid in 2nd cycle of macrotest.
wire	mtest_rdps0_sel ;
dff_s  #(1) rps0d_d1 (
        .din    (1'b0),
        .q      (mtest_rdps0_sel),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

wire	tsb_rd_ps0_sel ;
assign	tlu_tsb_rd_ps0_sel = tsb_rd_ps0_sel ;
assign	tsb_rd_ps0_sel = 
			((dmmu_8k_ptr_e | immu_8k_ptr_e | 
			// really _m stage.
			dmmu_direct_8kptr_sel_g) & ~sehold_d1) | // direct-ptr selects ps0
			(mtest_rdps0_sel & sehold_d1) ;

// Choose between zero and non-zero context
assign	tsb_size[3:0]	=  
	tsb_rd_ps0_sel ? tlu_dtsb_size_w2[3:0] : tlu_itsb_size_w2[3:0] ;
assign	tsb_split	= 
	tsb_rd_ps0_sel ? tlu_dtsb_split_w2 : tlu_itsb_split_w2 ;
// Mux'ed and staged in mmu_dp.
assign	tag_access[47:13] = tlu_dtag_access_w2[47:13] ;
wire	[2:0]	page_size,tsb_page_size_g ;
assign	page_size[2:0] = tsb_page_size_g[2:0] ;

// Currently, all the logic is done in one stage. This will have to
// be rearranged once the read of the mra is advanced. 

wire	pg8k,pg64k,pg4M;
assign	pg8k  	= ~page_size[2] & ~page_size[1] & ~page_size[0] ; // 000
assign	pg64k 	= ~page_size[2] & ~page_size[1] &  page_size[0] ; // 001
assign	pg4M    = ~page_size[2] &  page_size[1] &  page_size[0] ; // 011
//assign	pg256M  =  page_size[2] & ~page_size[1] &  page_size[0] ; // 101

// Mux tag-access <36:13>,<39:13>,<45:22>,<51:28> based on page-size.
// Notebook contains greater detail of mapping of base,tag-access to ptr.
wire	[23:0]	va ; 
assign	va[23:0] = pg8k ? tag_access[36:13] : 
			pg64k ? tag_access[39:16] :	
				pg4M ? tag_access[45:22] :	
					 	{{5{tag_access[47]}},tag_access[46:28]} ;// 256M	
					 	//{4'b0000,tag_access[47:28]} ;	// 256M	// Bug3727

// The ptr address is broken up into 3 regions :
// ptr<3:0>=4'b0000,		     : constant
// ptr<12:4>=va<8:0>		     : va from tag-access only 	
// ptr<27:13>=va<23:9>/base<27:13>/0/1 : va from tag-access OR tsb base address OR '0/1' (split).
// ptr<28>=base<28>/0/1		     : tsb base address OR '0' (split).
// ptr<47:29>=base<47:29>	     : tsb base address. 

// Assuming N=0..15. Could be reduced to N=11.
// Need to take exception for unused page size and value of N not compatible with selected page-size.

wire [28:13] ptr ;
wire	ps1;
assign ps1 = ~tsb_rd_ps0_sel ;
 
// This is an obvious flop boundary break. 

wire	[3:0] tsb_size_d1 ;
wire	tsb_split_d1 ;
wire	[47:13] tsb_base_d1 ;
wire	ps1_d1 ;
wire	[23:0] 	va_d1 ;

dff_s  #(4) tsbsize_stgd1 (
        .din    (tsb_size[3:0]),
        .q      (tsb_size_d1[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

dff_s  #(1) tsbsplit_stgd1 (
        .din    (tsb_split),
        .q      (tsb_split_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

assign	tsb_base_d1[47:13] = tlu_tsb_base_w2_d1[47:13] ;

dff_s  #(1) ps1_stgd1 (
        .din    (ps1),
        .q      (ps1_d1),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

dff_s  #(24) va_stgd1 (
        .din    (va[23:0]),
        .q      (va_d1[23:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
) ;

// These equations have to be optimized.
assign	ptr[28] = ((tsb_size_d1==4'd15) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[28] ;
assign	ptr[27] = (tsb_size_d1==4'd15) ? va_d1[23] : ((tsb_size_d1==4'd14) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[27] ;
assign	ptr[26] = (tsb_size_d1>=4'd14) ? va_d1[22] : ((tsb_size_d1==4'd13) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[26] ;
assign	ptr[25] = (tsb_size_d1>=4'd13) ? va_d1[21] : ((tsb_size_d1==4'd12) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[25] ;
assign	ptr[24] = (tsb_size_d1>=4'd12) ? va_d1[20] : ((tsb_size_d1==4'd11) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[24] ;
assign	ptr[23] = (tsb_size_d1>=4'd11) ? va_d1[19] : ((tsb_size_d1==4'd10) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[23] ;
assign	ptr[22] = (tsb_size_d1>=4'd10) ? va_d1[18] : ((tsb_size_d1==4'd9) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[22] ;
assign	ptr[21] = (tsb_size_d1>=4'd9) ? va_d1[17] : ((tsb_size_d1==4'd8) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[21] ;
assign	ptr[20] = (tsb_size_d1>=4'd8) ? va_d1[16] : ((tsb_size_d1==4'd7) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[20] ;
assign	ptr[19] = (tsb_size_d1>=4'd7) ? va_d1[15] : ((tsb_size_d1==4'd6) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[19] ;
assign	ptr[18] = (tsb_size_d1>=4'd6) ? va_d1[14] : ((tsb_size_d1==4'd5) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[18] ;
assign	ptr[17] = (tsb_size_d1>=4'd5) ? va_d1[13] : ((tsb_size_d1==4'd4) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[17] ;
assign	ptr[16] = (tsb_size_d1>=4'd4) ? va_d1[12] : ((tsb_size_d1==4'd3) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[16] ;
assign	ptr[15] = (tsb_size_d1>=4'd3) ? va_d1[11] : ((tsb_size_d1==4'd2) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[15] ;
assign	ptr[14] = (tsb_size_d1>=4'd2) ? va_d1[10] : ((tsb_size_d1==4'd1) & tsb_split_d1) ? ps1_d1 : tsb_base_d1[14] ;
assign	ptr[13] = (tsb_size_d1>=4'd1) ? va_d1[9] :  tsb_split_d1 ? ps1_d1 : tsb_base_d1[13] ;

// TSB 8K Ptr. This maps to tsb ps0 ptr !!!
// This is mapped to either PS0 or PS1 ptr. Do not need to send
// 8k and 64K ptrs to mmu_dp.
// Direct ptr needs to be accounted for.
assign	tlu_idtsb_8k_ptr[47:0] = 
	{tsb_base_d1[47:29],
	ptr[28:13],
	va_d1[8:0],
	4'b0000};

//=========================================================================================
//	Establishing Context for Ptr Read
//=========================================================================================

// Context of Ptr Read determined by context within d/i tag-access register. 
// Markers per thread will be maintained to determine whether any subsequent 
// ptr access is made in nucleus or non-nucleus context.
// Note i and d tag-access can be merged within tlu_mmu_dp.v

// write of tag-access ctxt needs to be setup in M for subsequent read of MRA in M.

assign	tsb_page_size_g[2:0] = tsb_rd_ps0_sel ? tlu_ctxt_cfg_w2[2:0] : tlu_ctxt_cfg_w2[5:3] ; 

// Listening Flops for Macrotest of mra.
dff_s #(6) ctxtcfg_listen (
        .din    (tlu_ctxt_cfg_w2[5:0]),
        .q      (),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );



//=========================================================================================
//	Direct Ptr State
//=========================================================================================

// For new ptr support, if page-size of tte matches that of ps1 then
// direct-ptr maps to ps1-ptr else ps0-ptr.

wire	daccess_prot_qual ;
assign	daccess_prot_qual = 
lsu_tlu_daccess_prot_g & ~lsu_tlu_daccess_excptn_g & 
inst_vld_g & ~(priority_squash_g | flush_mmuasi_wr) ;

// For SPARC_HPV_EN, 64k represents ps1 ptr.
assign	dptr0_pg64k_en = daccess_prot_qual & thread0_sel_g ;
assign	dptr1_pg64k_en = daccess_prot_qual & thread1_sel_g ;
assign	dptr2_pg64k_en = daccess_prot_qual & thread2_sel_g ;
assign	dptr3_pg64k_en = daccess_prot_qual & thread3_sel_g ;

// For SPARC_HPV_EN this means ps0 sel. This should be an internal
// wire with SPARC_HPV_EN
assign	dmmu_direct_8kptr_sel_g  = 
	dmmu_direct_ptr_e & ((thread0_e & ~dptr0_pg64k_vld) |
				(thread1_e & ~dptr1_pg64k_vld) |
				(thread2_e & ~dptr2_pg64k_vld) |
				(thread3_e & ~dptr3_pg64k_vld));
wire	dptr_state_din ;
	assign dptr_state_din = dacc_prot_ps1_match ;

dffre_s  #(1) dptrstate_0 (
        .din    (dptr_state_din),
        .q    	(dptr0_pg64k_vld),
	.rst	(~rst_l),	.en	(dptr0_pg64k_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dffre_s  #(1) dptrstate_1 (
        .din    (dptr_state_din),
        .q    	(dptr1_pg64k_vld),
	.rst	(~rst_l),	.en	(dptr1_pg64k_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dffre_s  #(1) dptrstate_2 (
        .din    (dptr_state_din),
        .q    	(dptr2_pg64k_vld),
	.rst	(~rst_l),	.en	(dptr2_pg64k_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

dffre_s  #(1) dptrstate_3 (
        .din    (dptr_state_din),
        .q    	(dptr3_pg64k_vld),
	.rst	(~rst_l),	.en	(dptr3_pg64k_en),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );  

//=========================================================================================
//	PS1 PAGE SIZE FOR DMMU
//=========================================================================================

// Maintain ps1 page-size for dmmu zero/non-zero ctxt. This is required to compare
// against the page-size of the tte on a data-access-protection to set-up the
// direct-pointer. Note that the real copy is in the mra.

wire [2:0] zctxt_cfg0_ps1,zctxt_cfg1_ps1,zctxt_cfg2_ps1,zctxt_cfg3_ps1;
wire [2:0] nzctxt_cfg0_ps1,nzctxt_cfg1_ps1,nzctxt_cfg2_ps1,nzctxt_cfg3_ps1;
wire [3:0] dzctxt_cfg_wr_en ;
wire [3:0] dnzctxt_cfg_wr_en ;

assign	dzctxt_cfg_wr_en[3] = dmmu_zctxt_cfg_en & st_inst_g & thread3_sel_g ;
assign	dzctxt_cfg_wr_en[2] = dmmu_zctxt_cfg_en & st_inst_g & thread2_sel_g ;
assign	dzctxt_cfg_wr_en[1] = dmmu_zctxt_cfg_en & st_inst_g & thread1_sel_g ;
assign	dzctxt_cfg_wr_en[0] = dmmu_zctxt_cfg_en & st_inst_g & thread0_sel_g ;

assign	dnzctxt_cfg_wr_en[3] = dmmu_nzctxt_cfg_en & st_inst_g & thread3_sel_g ;
assign	dnzctxt_cfg_wr_en[2] = dmmu_nzctxt_cfg_en & st_inst_g & thread2_sel_g ;
assign	dnzctxt_cfg_wr_en[1] = dmmu_nzctxt_cfg_en & st_inst_g & thread1_sel_g ;
assign	dnzctxt_cfg_wr_en[0] = dmmu_nzctxt_cfg_en & st_inst_g & thread0_sel_g ;

// Thread0
// Zero-Ctxt Cfg PS1
dffe_s #(3)   zctxtps1_0 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(zctxt_cfg0_ps1[2:0]),
        .en 	(dzctxt_cfg_wr_en[0]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Non-Zero-Ctxt Cfg PS1
dffe_s #(3)   nzctxtps1_0 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(nzctxt_cfg0_ps1[2:0]),
        .en 	(dnzctxt_cfg_wr_en[0]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread1
// Zero-Ctxt Cfg PS1
dffe_s #(3)   zctxtps1_1 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(zctxt_cfg1_ps1[2:0]),
        .en 	(dzctxt_cfg_wr_en[1]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Non-Zero-Ctxt Cfg PS1
dffe_s #(3)   nzctxtps1_1 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(nzctxt_cfg1_ps1[2:0]),
        .en 	(dnzctxt_cfg_wr_en[1]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread2
// Zero-Ctxt Cfg PS1
dffe_s #(3)   zctxtps1_2 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(zctxt_cfg2_ps1[2:0]),
        .en 	(dzctxt_cfg_wr_en[2]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Non-Zero-Ctxt Cfg PS1
dffe_s #(3)   nzctxtps1_2 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(nzctxt_cfg2_ps1[2:0]),
        .en 	(dnzctxt_cfg_wr_en[2]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Thread3
// Zero-Ctxt Cfg PS1
dffe_s #(3)   zctxtps1_3 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(zctxt_cfg3_ps1[2:0]),
        .en 	(dzctxt_cfg_wr_en[3]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );

// Non-Zero-Ctxt Cfg PS1
dffe_s #(3)   nzctxtps1_3 (
        .din    (lsu_tlu_st_rs3_data_b12t0_g[10:8]), 
	.q  	(nzctxt_cfg3_ps1[2:0]),
        .en 	(dnzctxt_cfg_wr_en[3]), 	.clk (clk),
        .se     (1'b0),       	.si (),          .so ()
        );


wire [2:0] zctxt_cfg_ps1,nzctxt_cfg_ps1 ;

assign	zctxt_cfg_ps1[2:0] =
	thread0_sel_g ? zctxt_cfg0_ps1[2:0] :
		thread1_sel_g ? zctxt_cfg1_ps1[2:0] :
			thread2_sel_g ? zctxt_cfg2_ps1[2:0] :
						zctxt_cfg3_ps1[2:0] ;

assign	nzctxt_cfg_ps1[2:0] =
	thread0_sel_g ? nzctxt_cfg0_ps1[2:0] :
		thread1_sel_g ? nzctxt_cfg1_ps1[2:0] :
			thread2_sel_g ? nzctxt_cfg2_ps1[2:0] :
						nzctxt_cfg3_ps1[2:0] ;
wire	nucleus_ctxt_g ;
dff_s nctxt_stgg(
        .din    (lsu_tlu_nucleus_ctxt_m),
        .q      (nucleus_ctxt_g),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	[2:0]	ctxt_cfg_ps1 ;
assign	ctxt_cfg_ps1[2:0] = 
	nucleus_ctxt_g ? zctxt_cfg_ps1[2:0] : nzctxt_cfg_ps1[2:0] ;

assign	dacc_prot_ps1_match
	= (lsu_tlu_tte_pg_sz_g[2:0] == ctxt_cfg_ps1[2:0]) ;

//=========================================================================================
//	CTXT SEL
//=========================================================================================

wire	thread_tl_zero_e,thread_tl_zero_m ;
assign thread_tl_zero_e =
        thread0_e ? tlu_lsu_tl_zero[0] :
                thread1_e ? tlu_lsu_tl_zero[1] :
                        thread2_e ? tlu_lsu_tl_zero[2] : tlu_lsu_tl_zero[3];

dff_s tlz_stgm(
        .din    (thread_tl_zero_e),
        .q      (thread_tl_zero_m),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

// Generate selects for ctxt to be written to tag_access
// iside trap meant to cover immu_miss and inst_access_excp
// modified for hypervisor support
// assign       iside_trap = exu_tlu_ttype_vld_m | immu_va_oor_brnchetc_m | exu_tlu_va_oor_jl_ret_m;

wire	pstate_am_e,pstate_am_m;
assign  pstate_am_e =
        (thread0_e & tlu_lsu_pstate_am[0]) |
        (thread1_e & tlu_lsu_pstate_am[1]) |
        (thread2_e & tlu_lsu_pstate_am[2]) |
        (thread3_e & tlu_lsu_pstate_am[3]);

dff_s pam_stgm(
        .din    (pstate_am_e),
        .q      (pstate_am_m),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	immu_va_oor_brnchetc_m ;
assign  immu_va_oor_brnchetc_m
        = exu_tlu_va_oor_m & ~pstate_am_m & ~memref_m;

wire iside_trap ;
assign  iside_trap =
            ifu_tlu_immu_miss_m | // exu_tlu_ttype_vld_m : Rm along with Bug 5346
            immu_va_oor_brnchetc_m | exu_tlu_va_oor_jl_ret_m |
	    ifu_tlu_priv_violtn_m ; // Bug 5346.
assign  tlu_tag_access_ctxt_sel_m[0] = iside_trap &  thread_tl_zero_m;
assign  tlu_tag_access_ctxt_sel_m[1] = iside_trap & ~thread_tl_zero_m;
assign  tlu_tag_access_ctxt_sel_m[2] = ~iside_trap;


//=========================================================================================
//	TLB Write Data
//=========================================================================================

wire	[2:0]	pg_size ;
wire		page_8k, page_64k, page_4m ;
wire		va_15_13_vld, va_21_16_vld, va_27_22_vld ;

assign sun4r_tte_g = ~tlb_ldst_va_g[10] ; // trin todo; might be the top bit? ask yaosheng

assign tlu_sun4r_tte_g = sun4r_tte_g ;

assign 	pg_size[2:0] 	=  
	sun4r_tte_g ? {lsu_tlu_st_rs3_data_b48_g,lsu_tlu_st_rs3_data_g[62:61]} :
			{lsu_tlu_st_rs3_data_b12t0_g[2:0]} ;

assign	page_8k		= ~pg_size[2] & ~pg_size[1] & ~pg_size[0] ;	
assign	page_64k	= ~pg_size[2] & ~pg_size[1] &  pg_size[0] ;	
assign	page_4m		= ~pg_size[2] &  pg_size[1] &  pg_size[0] ;	
//assign	page_256m	=  pg_size[2] & ~pg_size[1] &  pg_size[0] ;	

assign	va_15_13_vld 	= page_8k ; 
assign	va_21_16_vld 	= page_8k | page_64k  ; 
assign	va_27_22_vld 	= page_8k | page_64k | page_4m ; 

assign	tlu_tte_tag_g[2:0] = {va_27_22_vld,va_21_16_vld,va_15_13_vld} ;
	
assign	thread0_async_g = ~tlb_access_tid_g[1] & ~tlb_access_tid_g[0] ;
assign	thread1_async_g = ~tlb_access_tid_g[1] &  tlb_access_tid_g[0] ;
assign	thread2_async_g =  tlb_access_tid_g[1] & ~tlb_access_tid_g[0] ;
//assign	thread3_async_g =  tlb_access_tid_g[1] &  tlb_access_tid_g[0] ; // to be used in instanced mux

assign	tlu_tte_wr_pid_g[2:0] =
	thread0_async_g ? lsu_pid_state0[2:0] : 
		thread1_async_g ? lsu_pid_state1[2:0] : 
			thread2_async_g ? lsu_pid_state2[2:0] : lsu_pid_state3[2:0] ;

// Error Injection :
// Error injection is one-shot. It will occur for either dmmu or immu. The ifu
// is informed once the error injection is accomplished.

wire	i_tag_invrt_par,d_tag_invrt_par ;
wire	i_data_invrt_par,d_data_invrt_par ;
assign tlu_tlb_tag_invrt_parity = i_tag_invrt_par | d_tag_invrt_par ;
assign i_tag_invrt_par = (ifu_lsu_error_inj[2] & (immu_data_in_en | immu_data_access_en)) ;
assign d_tag_invrt_par = (ifu_lsu_error_inj[0] & (dmmu_data_in_en | dmmu_data_access_en)) ;
assign tlu_tlb_data_invrt_parity = i_data_invrt_par | d_data_invrt_par ;
assign i_data_invrt_par = (ifu_lsu_error_inj[3] & (immu_data_in_en | immu_data_access_en)) ;
assign d_data_invrt_par = (ifu_lsu_error_inj[1] & (dmmu_data_in_en | dmmu_data_access_en)) ;

wire tlb_wr_vld ;
assign tlb_wr_vld = dtlb_wr_vld_g | itlb_wr_vld_g ;
wire [3:0] err_inj_ack ;
assign	err_inj_ack[0] = tlb_wr_vld & d_tag_invrt_par ;
assign	err_inj_ack[1] = tlb_wr_vld & d_data_invrt_par ;
assign	err_inj_ack[2] = tlb_wr_vld & i_tag_invrt_par ;
assign	err_inj_ack[3] = tlb_wr_vld & i_data_invrt_par ;

dff_s #(4) err_inj (
        .din    (err_inj_ack[3:0]),
        .q      (lsu_ifu_inj_ack[3:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

endmodule
