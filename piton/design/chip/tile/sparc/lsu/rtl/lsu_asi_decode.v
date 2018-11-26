// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_asi_decode.v
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
//      Description:    ASI Decode for LSU
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include        "sys.h" // system level definition file which contains the
                                        // time scale definition

`ifndef NO_RTL_CSM
`include "define.tmp.h"
`endif

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////    

module lsu_asi_decode (/*AUTOARG*/
   // Outputs
   asi_internal_d, nucleus_asi_d, primary_asi_d, secondary_asi_d, 
   lendian_asi_d, nofault_asi_d, quad_asi_d, binit_quad_asi_d, 
   dcache_byp_asi_d, tlb_lng_ltncy_asi_d, tlb_byp_asi_d, 
   as_if_user_asi_d, atomic_asi_d, blk_asi_d, dc_diagnstc_asi_d, 
   dtagv_diagnstc_asi_d, wr_only_asi_d, rd_only_asi_d, unimp_asi_d, 
   ifu_nontlb_asi_d, recognized_asi_d, ifill_tlb_asi_d, 
   dfill_tlb_asi_d, rd_only_ltlb_asi_d, wr_only_ltlb_asi_d, 
   phy_use_ec_asi_d, phy_byp_ec_asi_d, mmu_rd_only_asi_d, 
   intrpt_disp_asi_d, dmmu_asi58_d, immu_asi50_d, 
   // Inputs
   asi_d
   );

input 	[7:0]	asi_d ;
output		asi_internal_d ;
output		nucleus_asi_d ;
output		primary_asi_d ;
output		secondary_asi_d ;
output		lendian_asi_d ;
output		nofault_asi_d ;
output		quad_asi_d ;
output		binit_quad_asi_d ;
output		dcache_byp_asi_d ;
output		tlb_lng_ltncy_asi_d ;
output		tlb_byp_asi_d ;
output		as_if_user_asi_d ;
output		atomic_asi_d ;
output		blk_asi_d ;
//output		blk_cmt_asi_d ;
output		dc_diagnstc_asi_d;
output		dtagv_diagnstc_asi_d;
output		wr_only_asi_d ;
output		rd_only_asi_d ;
output		unimp_asi_d ;
output		ifu_nontlb_asi_d ;	// non-tlb asi's in ifu
output		recognized_asi_d ;
output		ifill_tlb_asi_d ;	// itlb fill asi
output		dfill_tlb_asi_d ;	// dtlb fill asi
output		rd_only_ltlb_asi_d ;	// read-only long-latency asi
output		wr_only_ltlb_asi_d ;	// write-only long-latency asi
output		phy_use_ec_asi_d ;
output		phy_byp_ec_asi_d ;

output		mmu_rd_only_asi_d ;	// does not include asi with va
output		intrpt_disp_asi_d ;
output		dmmu_asi58_d ;
output    immu_asi50_d;
   
wire	quad_ldd_real, quad_ldd_real_little ;
wire	asi_if_user_prim_all_d,asi_if_user_sec_all_d ;
wire	asi_if_user_prim_d,asi_if_user_sec_d ;
wire	nucleus_asi_exact_d ;
wire	prim_asi_exact_d ;
wire	phy_use_ec_asi ;
wire	phy_byp_ec_asi ;
wire	sec_asi_exact_d ;
wire	idemap,ddemap,ddata_in,ddaccess ;
wire	dtag_read,idata_in,idaccess,invld_all,itag_read ;
wire	blk_asif_usr_plittle, blk_asif_usr_slittle ;
wire	blk_plittle, blk_slittle ;
wire	blk_asif_usr_p, blk_asif_usr_s ;
wire	blk_cmt_p, blk_cmt_s; 
wire	blk_p, blk_s ;
wire	binit_nucleus_d, binit_nucleus_little_d ;
wire	real_mem_little,real_io_little ;
   wire unimp_CD_prm;
   wire unimp_CD_sec;

`ifndef NO_RTL_CSM
wire    dcsm_in,icsm_in, dcsm_access, icsm_access; 
`endif
// Start decode in d-stage. Required late e-stage. The logic could
// be moved to the e-stage to save staging flops.

wire	dtsb_8k_ptr, dtsb_64k_ptr, dtsb_dir_ptr;
wire	itsb_8k_ptr, itsb_64k_ptr;
assign	dtsb_8k_ptr = (asi_d[7:0] == 8'h59) ;
assign	dtsb_64k_ptr = (asi_d[7:0] == 8'h5A) ;
assign	dtsb_dir_ptr = (asi_d[7:0] == 8'h5B) ;
assign	itsb_8k_ptr = (asi_d[7:0] == 8'h51) ;
assign	itsb_64k_ptr = (asi_d[7:0] == 8'h52) ;

assign	mmu_rd_only_asi_d =
	dtsb_8k_ptr | dtsb_64k_ptr | dtsb_dir_ptr | itsb_8k_ptr | itsb_64k_ptr ;

assign intrpt_disp_asi_d = (asi_d[7:0] == 8'h73) ; // INTR_W 

assign	dmmu_asi58_d =	(asi_d[7:0] == 8'h58) ; 
assign  immu_asi50_d =  (asi_d[7:0] == 8'h50) ;
   
// ASI Internal Registers - switches out thread among other things
assign	asi_internal_d =
    (asi_d[7:0] == 8'h1A) | // EPS configuration
	(asi_d[7:0] == 8'h40) |	// streaming/ma
	(asi_d[7:0] == 8'h45) |	// LSU Control 
	(asi_d[7:0] == 8'h50) | // I-TSB Tag Target/SFSR/TSB/Tag-Access
	itsb_8k_ptr	      | // I-TSB 8K Ptr 
	itsb_64k_ptr	      | // I-TSB 64K Ptr
	dmmu_asi58_d |
	//(asi_d[7:0] == 8'h58) | // D-TSB Tag Target/SFSR/SFAR/TSB/Tag-Access/VA-PA-Watchpt
	(asi_d[7:0] == 8'h21) | // Primary/Secondary Context
	(asi_d[7:0] == 8'h20) | // Scratchpad.
	(asi_d[7:0] == 8'h25) | // Queue
	(asi_d[7:0] == 8'h4F) | // Hyp Scratchpad
	dtsb_8k_ptr 	      | // D-TSB 8K Ptr
	dtsb_64k_ptr	      | // D-TSB 64K Ptr
	dtsb_dir_ptr	      | // D-TSB Direct Ptr
	(asi_d[7:0] == 8'h72) | // INTR_RECEIVE
	intrpt_disp_asi_d     | // INTR_W
	(asi_d[7:0] == 8'h74) | // INTR_R
	(asi_d[7:0] == 8'h44) | // Self-Timed Margin Ctl
	(asi_d[7:0] == 8'h31) | // dmmu_zctxt_ps0_tsb
	(asi_d[7:0] == 8'h32) | // dmmu_zctxt_ps1_tsb
	(asi_d[7:0] == 8'h39) | // dmmu_nzctxt_ps0_tsb
	(asi_d[7:0] == 8'h3A) | // dmmu_nzctxt_ps1_tsb
	(asi_d[7:0] == 8'h33) | // dmmu_zctxt_cfg_tsb
	(asi_d[7:0] == 8'h3B) | // dmmu_nzctxt_cfg_tsb
	(asi_d[7:0] == 8'h35) | // immu_zctxt_ps0_tsb
	(asi_d[7:0] == 8'h36) | // immu_zctxt_ps1_tsb
	(asi_d[7:0] == 8'h3D) | // immu_nzctxt_ps0_tsb
	(asi_d[7:0] == 8'h3E) | // immu_nzctxt_ps1_tsb
	(asi_d[7:0] == 8'h37) | // immu_zctxt_cfg_tsb
	(asi_d[7:0] == 8'h3F) | // immu_nzctxt_cfg_tsb
	dc_diagnstc_asi_d     | // Dcache Diagnostic
	dtagv_diagnstc_asi_d  | // Dcache Diagnostic
	tlb_lng_ltncy_asi_d   |
	ifu_nontlb_asi_d      ;	

assign	ifu_nontlb_asi_d = 
	(asi_d[7:0] == 8'h42) | // instruction-mask
	(asi_d[7:0] == 8'h43) | // error-inj
	(asi_d[7:0] == 8'h4B) | // sparc-error-enable
	(asi_d[7:0] == 8'h4C) | // sparc-error-status
	(asi_d[7:0] == 8'h4D) | // sparc-error-address
	(asi_d[7:0] == 8'h66) | // icache-instr
	(asi_d[7:0] == 8'h67) ; // icache-tag

assign	dc_diagnstc_asi_d = (asi_d[7:0] == 8'h46) ;
assign	dtagv_diagnstc_asi_d = (asi_d[7:0] == 8'h47) ;

assign	idemap = (asi_d[7:0] == 8'h57) ; // I-MMU Demap Operation
assign	ddemap = (asi_d[7:0] == 8'h5F) ; // D-MMU Demap Operation
assign	ddata_in = (asi_d[7:0] == 8'h5C) ; // D-TLB Data-In
assign	ddaccess = (asi_d[7:0] == 8'h5D) ; // D-TLB Data-Access
assign	dtag_read = (asi_d[7:0] == 8'h5E) ; // D-TLB Tag Read
assign	idata_in = (asi_d[7:0] == 8'h54) ; // I-TLB Data-In
assign	idaccess = (asi_d[7:0] == 8'h55) ; // I-TLB Data-Access
assign	invld_all = (asi_d[7:0] == 8'h60) ; // I/D Invalidate All
assign	itag_read = (asi_d[7:0] == 8'h56) ; // I-TLB Tag Read

`ifndef NO_RTL_CSM
assign dcsm_in = (asi_d[7:0] == `ASI_DMMU_CSM_IN_REG);
assign icsm_in = (asi_d[7:0] == `ASI_IMMU_CSM_IN_REG);
assign dcsm_access = (asi_d[7:0] == `ASI_DMMU_CSM_ACCESS_REG);
assign icsm_access = (asi_d[7:0] == `ASI_IMMU_CSM_ACCESS_REG);
`endif


`ifndef NO_RTL_CSM
assign	tlb_lng_ltncy_asi_d = 
	idemap 		| ddemap 	| ddata_in 	| 
	ddaccess 	| dtag_read 	| idata_in 	| 
	idaccess 	| invld_all 	| itag_read |	
    dcsm_in     | dcsm_access   | icsm_in   |
    icsm_access ;

assign	wr_only_ltlb_asi_d = 
	ddata_in 	|	idata_in 	|
	idemap		|	ddemap		|
    dcsm_in     |   icsm_in     |
	invld_all ;

`else
assign	tlb_lng_ltncy_asi_d = 
	idemap 		| ddemap 	| ddata_in 	| 
	ddaccess 	| dtag_read 	| idata_in 	| 
	idaccess 	| invld_all 	| itag_read 	;

assign	wr_only_ltlb_asi_d = 
	ddata_in 	|	idata_in 	|
	idemap		|	ddemap		|
	invld_all ;
`endif

assign	rd_only_ltlb_asi_d =
	dtag_read	|	itag_read	;


`ifndef NO_RTL_CSM
assign	ifill_tlb_asi_d =	// itlb fill asi
	idata_in	| 	idaccess  |	
    icsm_in     |   icsm_access ;

assign	dfill_tlb_asi_d =	// i/d tlb fill asi
	ddata_in	|	ddaccess  |	
    dcsm_in     |   dcsm_access ;

`else
assign	ifill_tlb_asi_d =	// itlb fill asi
	idata_in	| 	idaccess	;

assign	dfill_tlb_asi_d =	// i/d tlb fill asi
	ddata_in	|	ddaccess	;
`endif
assign	nucleus_asi_exact_d =
	(asi_d[7:0] == 8'h04) |	// asi_nucleus
	(asi_d[7:0] == 8'h0C) ; // asi_nucleus_little

// Nucleus Ctxt
assign	nucleus_asi_d =
	 nucleus_asi_exact_d |
	(asi_d[7:0] == 8'h24) | // asi_nucleus_quad_ldd
	(asi_d[7:0] == 8'h2C) ; // asi_nucleus_quad_ldd_little

assign	asi_if_user_prim_d =
	(asi_d[7:0] == 8'h10) |	// asi_as_if_user_primary
	(asi_d[7:0] == 8'h18) ;	// asi_as_if_user_primary_little

// asi_if_user primary asi
assign	asi_if_user_prim_all_d =
	 asi_if_user_prim_d   |		
	(asi_d[7:0] == 8'h22) |	// asi_as_if_user_primary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'h2A) ;	// asi_as_if_user_primary_quad_ldd_little (blk-init)

assign	prim_asi_exact_d =
	(asi_d[7:0] == 8'h80) |	// asi_primary
	(asi_d[7:0] == 8'h88) ;	// asi_primary_little

// Primary Ctxt
assign	primary_asi_d =
	 asi_if_user_prim_all_d   |	
	 prim_asi_exact_d     |	
	(asi_d[7:0] == 8'h82) |	// asi_primary_no_fault
	(asi_d[7:0] == 8'h8A) |	// asi_primary_no_fault_little
	(asi_d[7:0] == 8'hE2) |	// asi_primary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'hEA) |	// asi_primary_quad_ldd_little (blk-init)
	blk_asif_usr_p | blk_asif_usr_plittle | 
	blk_plittle | blk_p | // block primary asi
	blk_cmt_p |	// Bug 4051
  unimp_CD_prm ;  // Bug 4532
   
assign	asi_if_user_sec_d =
	(asi_d[7:0] == 8'h11) | // asi_as_if_user_secondary
	(asi_d[7:0] == 8'h19) ; // asi_as_if_user_secondary_little

// asi_if_user secondary asi
assign	asi_if_user_sec_all_d =
	 asi_if_user_sec_d   |		
	(asi_d[7:0] == 8'h23) |	// asi_as_if_user_secondary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'h2B) ;	// asi_as_if_user_secondary_quad_ldd_little (blk-init)

assign	as_if_user_asi_d = asi_if_user_prim_all_d | asi_if_user_sec_all_d |
blk_asif_usr_p | blk_asif_usr_plittle | blk_asif_usr_s | blk_asif_usr_slittle ;

assign	sec_asi_exact_d =
	(asi_d[7:0] == 8'h81) | // asi_secondary
	(asi_d[7:0] == 8'h89) ; // asi_secondary_little

// Secondary Ctxt
assign	secondary_asi_d =
	 asi_if_user_sec_all_d    |
	 sec_asi_exact_d      |		
	(asi_d[7:0] == 8'h83) | // asi_secondary_no_fault
	(asi_d[7:0] == 8'h8B) | // asi_secondary_no_fault_little
	(asi_d[7:0] == 8'hE3) |	// asi_secondary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'hEB) |	// asi_secondary_quad_ldd_little (blk-init)
	blk_asif_usr_s | blk_asif_usr_slittle | 
	blk_slittle |  blk_s | // block secondary asi
	blk_cmt_s |  // Bug 4051
  unimp_CD_sec; // Bug 4532

// Little Endian
assign	lendian_asi_d =
	(asi_d[7:0] == 8'h0C) | // asi_nucleus_little
	(asi_d[7:0] == 8'h2C) | // asi_nucleus_quad_ldd_little 
	(asi_d[7:0] == 8'h18) |	// asi_as_if_user_primary_little
	(asi_d[7:0] == 8'h8A) |	// asi_primary_no_fault_little
	(asi_d[7:0] == 8'h8B) | // asi_secondary_no_fault_little
	(asi_d[7:0] == 8'h2A) |	// asi_as_if_user_primary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'hEA) |	// asi_primary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'h19) | // asi_as_if_user_secondary_little
	(asi_d[7:0] == 8'h89) | // asi_secondary_little
	(asi_d[7:0] == 8'h88) |	// asi_primary_little
	(asi_d[7:0] == 8'h2B) |	// asi_as_if_user_secondary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'hEB) |	// asi_secondary_quad_ldd_little (blk-init)
	real_mem_little |
	real_io_little	|
	//(asi_d[7:0] == 8'h1D) |	// asi_phys_bypass_ec_with_ebit_littl
	//(asi_d[7:0] == 8'h1C) |	// asi_phys_bypass_ec_with_ebit_littl
	blk_asif_usr_plittle  | blk_asif_usr_slittle |	// little
	blk_plittle	      | blk_slittle |		// little
	quad_ldd_real_little  | // asi_quad_ldd_real_little
	binit_nucleus_little_d ;// asi_nucleus_blk_init_st_quad_ldd_little

// No Fault
assign	nofault_asi_d =
	(asi_d[7:0] == 8'h82) |	// asi_primary_no_fault
	(asi_d[7:0] == 8'h8A) |	// asi_primary_no_fault_little
	(asi_d[7:0] == 8'h83) | // asi_secondary_no_fault
	(asi_d[7:0] == 8'h8B) ; // asi_secondary_no_fault_little

assign	binit_nucleus_d =
	(asi_d[7:0] == 8'h27) ;	// asi_nucleus_blk_init_st_quad_ldd
assign	binit_nucleus_little_d =
	(asi_d[7:0] == 8'h2F) ;	// asi_nucleus_blk_init_st_quad_ldd_little

// Quad (These are duplicated - they can be shared)
assign	binit_quad_asi_d =
   	binit_nucleus_d |	// asi_nucleus_blk_init_st_quad_ldd
	binit_nucleus_little_d |// asi_nucleus_blk_init_st_quad_ldd_little
	(asi_d[7:0] == 8'h22) |	// asi_as_if_user_primary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'h2A) |	// asi_as_if_user_primary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'h23) |	// asi_as_if_user_secondary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'h2B) |	// asi_as_if_user_secondary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'hE2) |	// asi_primary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'hEA) |	// asi_primary_quad_ldd_little (blk-init)
	(asi_d[7:0] == 8'hE3) |	// asi_secondary_quad_ldd (blk-init)
	(asi_d[7:0] == 8'hEB) ;	// asi_secondary_quad_ldd_little (blk-init)

assign	quad_ldd_real = 
	(asi_d[7:0] == 8'h26) ; // asi_quad_ldd_real
assign	quad_ldd_real_little = 
	(asi_d[7:0] == 8'h2E) ; // asi_quad_ldd_real_little

assign	quad_asi_d =
	binit_quad_asi_d      | // blk-init quad asi
	quad_ldd_real 	      | // asi_quad_ldd_real
	quad_ldd_real_little  | // asi_quad_ldd_real_little
	(asi_d[7:0] == 8'h24) | // asi_nucleus_quad_ldd 
	(asi_d[7:0] == 8'h2C) ; // asi_nucleus_quad_ldd_little 
	
// EC
assign	real_io_little = (asi_d[7:0] == 8'h1D) ;
assign	real_mem_little = (asi_d[7:0] == 8'h1C) ;
	
assign	phy_byp_ec_asi =
	(asi_d[7:0] == 8'h15) |	// asi_phys_bypass_ec_with_ebit(real_io)
	real_io_little ;	// asi_phys_bypass_ec_with_ebit_little(real_io_little)
	//(asi_d[7:0] == 8'h1D) ;	// asi_phys_bypass_ec_with_ebit_little(real_io_little)
				// asi assumed for io address specifically !!
				// asi assumed for io address specifically !!

assign	phy_use_ec_asi =
	(asi_d[7:0] == 8'h14) |	// asi_phys_use_ec(real_mem)
	real_mem_little ;	// asi_phys_use_ec_little(real_mem_little)
	//(asi_d[7:0] == 8'h1C) ;	// asi_phys_use_ec_little(real_mem_little)

assign	phy_use_ec_asi_d = phy_use_ec_asi ;
assign	phy_byp_ec_asi_d = phy_byp_ec_asi ;

// Physical Use - Always results in R->P xslation.
assign	tlb_byp_asi_d = 
		phy_byp_ec_asi | phy_use_ec_asi | 
		quad_ldd_real  | quad_ldd_real_little ;

// Atomic asi
assign	atomic_asi_d = nucleus_asi_exact_d | prim_asi_exact_d | sec_asi_exact_d | 
		asi_if_user_prim_d | asi_if_user_sec_d | phy_use_ec_asi ;

assign	dcache_byp_asi_d = tlb_byp_asi_d ;

// ASI causing Data Access Exceptions - (TBD)

assign	rd_only_asi_d =
	(asi_d[7:0] == 8'h82) |	// asi_primary_no_fault
	(asi_d[7:0] == 8'h8A) |	// asi_primary_no_fault_little
	(asi_d[7:0] == 8'h83) | // asi_secondary_no_fault
	(asi_d[7:0] == 8'h8B) | // asi_secondary_no_fault_little
	(asi_d[7:0] == 8'h74) ; // asi_swrvr_udb_intr_r !! Does not have to be done by intrpt blk !!

assign	wr_only_asi_d =
	(asi_d[7:0] == 8'h73) ; // asi_swrvr_udb_intr_w

// Block Asi
assign	blk_asif_usr_p = (asi_d[7:0] == 8'h16) ; // asi_block_as_if_user_primary
assign	blk_asif_usr_plittle = (asi_d[7:0] == 8'h1E) ; // asi_block_as_if_user_primary_little
assign	blk_asif_usr_s = (asi_d[7:0] == 8'h17) ; // asi_block_as_if_user_secondary
assign	blk_asif_usr_slittle = (asi_d[7:0] == 8'h1F) ; // asi_block_as_if_user_secondary_little
assign	blk_plittle = (asi_d[7:0] == 8'hF8) ; // asi_block_primary_little 
assign	blk_slittle = (asi_d[7:0] == 8'hF9) ; // asi_block_secondary_little 
assign	blk_cmt_p = (asi_d[7:0] == 8'hE0) ; // asi_block_commit_primary ?? behaviour 
assign	blk_cmt_s = (asi_d[7:0] == 8'hE1) ; // asi_block_commit_secondary ?? behaviour 
assign	blk_p = (asi_d[7:0] == 8'hF0) ; // asi_block_primary
assign	blk_s = (asi_d[7:0] == 8'hF1) ; // asi_block_secondary

//assign	blk_cmt_asi_d = blk_cmt_p | blk_cmt_s ;

assign	blk_asi_d = 
	blk_asif_usr_p 	| blk_asif_usr_s |
	blk_plittle	| blk_slittle	 |
	//blk_cmt_p	| blk_cmt_s	 |
	blk_p		| blk_s		 |
	blk_asif_usr_plittle  | blk_asif_usr_slittle |	// little
	blk_plittle	      | blk_slittle ;		// little

// add to little-endian decode
// add to use_real ...
//assign      as_if_supv = 
//    (asi_d[7:0] == 8'h??) | // asi_if_supv_real 
//    (asi_d[7:0] == 8'h??) ; // asi_if_supv_real_little 

wire	unimp_C ;
assign	unimp_C =
	((asi_d[7:4]==4'hC) & 
		~((asi_d[3:0]==4'h6) |
		  (asi_d[3:0]==4'h7) |
		  (asi_d[3:0]==4'hE) |
		  (asi_d[3:0]==4'hF))) ;

wire	unimp_D ;
assign	unimp_D =
	((asi_d[7:4]==4'hD) & 
		~((asi_d[3:0]==4'h4) |
		  (asi_d[3:0]==4'h5) |
		  (asi_d[3:0]==4'h6) |
		  (asi_d[3:0]==4'h7) |
		  (asi_d[3:0]==4'hC) |
		  (asi_d[3:0]==4'hD) |
		  (asi_d[3:0]==4'hE) |
		  (asi_d[3:0]==4'hF))) ;

assign  unimp_CD_prm =
(asi_d[7:0] == 8'hC0) |
(asi_d[7:0] == 8'hC2) |
(asi_d[7:0] == 8'hC4) |
(asi_d[7:0] == 8'hC8) |
(asi_d[7:0] == 8'hCA) |
(asi_d[7:0] == 8'hCC) |
(asi_d[7:0] == 8'hD0) |
(asi_d[7:0] == 8'hD2) |
(asi_d[7:0] == 8'hD8) |
(asi_d[7:0] == 8'hDA) ;
   
assign  unimp_CD_sec = 
(asi_d[7:0] == 8'hC1) |
(asi_d[7:0] == 8'hC3) |
(asi_d[7:0] == 8'hC5) |
(asi_d[7:0] == 8'hC9) |
(asi_d[7:0] == 8'hCB) |
(asi_d[7:0] == 8'hCD) |
(asi_d[7:0] == 8'hD1) |
(asi_d[7:0] == 8'hD3) |
(asi_d[7:0] == 8'hD9) |
(asi_d[7:0] == 8'hDB) ;
   
   
// Unimplemented asi
assign	unimp_asi_d =
// Bug 4692 - all unimplemented internal asi are now
// illegal.
//	(asi_d[7:0] == 8'h6E) | // asi_icache_pre_decode
//	(asi_d[7:0] == 8'h6F) | // asi_icache_next_field
//	(asi_d[7:0] == 8'h48) | // asi_intr_dispatch_status
//	(asi_d[7:0] == 8'h49) | // asi_intr_receive
//	(asi_d[7:0] == 8'h4A) | // asi_upa_config_register
//	(asi_d[7:0] == 8'h4E) | // asi_ecache_tag_data
//  	dflush_asi_d |      //Bug 4580
 	unimp_C | unimp_D | // Bug 4438	
	blk_cmt_p | blk_cmt_s ;
	
// Set of recognized asi's
assign	recognized_asi_d = 
	asi_internal_d | nucleus_asi_d |  primary_asi_d | secondary_asi_d | lendian_asi_d |
	nofault_asi_d | quad_asi_d | tlb_byp_asi_d | unimp_asi_d | blk_asi_d ;

// Displacement Flush for L2
//assign	dflush_asi_d =
//	(asi_d[7:0] == 8'h30) ; // asi_direct_map_ecache

endmodule
