// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: tlu_mmu_dp.v
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
//	Description:	MMU Datapath - I & D.
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the 
					// time scale definition

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

`include "tlu.h"

`ifndef NO_RTL_CSM
`include "define.tmp.h"
`endif
//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module tlu_mmu_dp ( /*AUTOARG*/
   // Outputs

   `ifndef NO_RTL_CSM
   tlu_itlb_tte_csm_w2, tlu_dtlb_tte_csm_w2, 
   `endif
   tlu_dtsb_split_w2, tlu_dtsb_size_w2, tlu_dtag_access_w2,
   tlu_itsb_split_w2, tlu_itsb_size_w2,
   tlu_itlb_tte_tag_w2, tlu_itlb_tte_data_w2, tlu_dtlb_tte_tag_w2, 
   tlu_dtlb_tte_data_w2, tlu_idtlb_dmp_key_g, tlu_dsfsr_flt_vld, 
   tlu_isfsr_flt_vld, mra_wdata, tlu_ctxt_cfg_w2, tlu_tag_access_ctxt_g, 
   lsu_exu_ldxa_data_g, so, tlu_tsb_base_w2_d1,
   // Inputs

   `ifndef NO_RTL_CSM
   lsu_tlu_st_rs3_data_g, 
   `endif
   tlu_addr_msk_g, dmmu_any_sfsr_wr, dmmu_sfsr_wr_en_l, dmmu_sfar_wr_en_l, 
   immu_any_sfsr_wr, immu_sfsr_wr_en_l, tlu_lng_ltncy_en_l,
   lsu_tlu_dside_ctxt_m, lsu_tlu_pctxt_m, tlu_tag_access_ctxt_sel_m, 
   lsu_tlu_st_rs3_data_b63t59_g, lsu_tlu_st_rs3_data_b47t0_g,
   exu_lsu_ldst_va_e, tlu_idtsb_8k_ptr,lsu_tlu_tlb_dmp_va_m, ifu_tlu_pc_m, 
   tlu_slxa_thrd_sel, 
   tlu_tte_tag_g, tlu_dmp_key_vld_g, tlb_access_rst_l, 
   tag_access_wdata_sel, mra_rdata, tlu_admp_key_sel, 
   tlu_isfsr_din_g, tlu_dsfsr_din_g, 
   tlu_tte_wr_pid_g, tlu_tte_real_g, tlu_ldxa_l1mx1_sel, 
   tlu_ldxa_l1mx2_sel, tlu_ldxa_l2mx1_sel, rclk, grst_l, arst_l,
   tlu_tlb_tag_invrt_parity, tlu_tlb_data_invrt_parity, tlu_sun4r_tte_g,
   tlu_tsb_rd_ps0_sel, si, se, tlu_tlb_access_en_l_d1
   ) ;	

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
// End of automatics

input			tlu_addr_msk_g ;	// address masking active for thread in pipe.
input			dmmu_any_sfsr_wr ; 
input	[3:0]		dmmu_sfsr_wr_en_l ; 
input	[3:0]		dmmu_sfar_wr_en_l ; 
input                   immu_any_sfsr_wr ;
input   [3:0]           immu_sfsr_wr_en_l ;
input  	[12:0]          lsu_tlu_dside_ctxt_m ;
input  	[12:0]          lsu_tlu_pctxt_m ;
input	[2:0]		tlu_tag_access_ctxt_sel_m ;	
// rs3_data split for vlint purposes.
input	[63:59]		lsu_tlu_st_rs3_data_b63t59_g ;
input	[47:0]		lsu_tlu_st_rs3_data_b47t0_g ;
`ifndef NO_RTL_CSM
input	[63:0]		lsu_tlu_st_rs3_data_g ;
`endif
input	[47:0]		exu_lsu_ldst_va_e ;
input   [47:0]          tlu_idtsb_8k_ptr ;
input   [47:13]         lsu_tlu_tlb_dmp_va_m ;
input	[47:13]		ifu_tlu_pc_m ;
input	[3:0]		tlu_slxa_thrd_sel ;
//input 	[63:0]        	int_tlu_asi_data;
//input			int_tlu_asi_data_vld;
input	[2:0]		tlu_tte_tag_g ;
input	[4:0]		tlu_dmp_key_vld_g ;
//input			tlb_access_en_l ;
input			tlu_tlb_access_en_l_d1 ;
input			tlb_access_rst_l ;

input	[2:0]		tag_access_wdata_sel ;
input	[155:6]		mra_rdata ;

input			tlu_admp_key_sel ;

input 	[23:0]   	tlu_isfsr_din_g ;
input 	[23:0]   	tlu_dsfsr_din_g ;

input   [2:0]          	tlu_tte_wr_pid_g ;      // thread selected pid
input			tlu_tte_real_g ;	// tte is real		

input	[3:0]		tlu_ldxa_l1mx1_sel ;	// mmu ldxa level1 mx1 sel
input	[3:0]		tlu_ldxa_l1mx2_sel ;	// mmu ldxa level1 mx2 sel
input	[2:0]		tlu_ldxa_l2mx1_sel ;	// mmu ldxa level2 mx1 sel
input			tlu_tlb_tag_invrt_parity ;	// invert parity for tag write
input			tlu_tlb_data_invrt_parity ;	// invert parity for data write
input                  	tlu_sun4r_tte_g ;       // sun4r vs. sun4v tte.

input                  tlu_lng_ltncy_en_l ;

input                  tlu_tsb_rd_ps0_sel ;

input                 rclk ;
input                 arst_l ;
input                 grst_l ;
input                 si ;
input                 se ;

output                        so ;

//output  [47:13]         tlu_dtsb_base_w2 ;	// represents ps0
output                  tlu_dtsb_split_w2 ;
output  [3:0]           tlu_dtsb_size_w2 ;
output  [47:13]        	tlu_dtag_access_w2 ;	// used to represent both i/d.
//output  [47:13]         tlu_itsb_base_w2 ;	// represents ps1
output                  tlu_itsb_split_w2 ;
output  [3:0]           tlu_itsb_size_w2 ;
//output  [32:13]        	tlu_itag_access_w2 ;	// to be obsoleted.
output	[58:0]		tlu_itlb_tte_tag_w2 ;
output	[42:0]		tlu_itlb_tte_data_w2 ;
output	[58:0]		tlu_dtlb_tte_tag_w2 ;
output	[42:0]		tlu_dtlb_tte_data_w2 ;

`ifndef NO_RTL_CSM
output [`TLB_CSM]  tlu_itlb_tte_csm_w2;
output [`TLB_CSM]  tlu_dtlb_tte_csm_w2;
`endif
//output	[63:0]		tlu_lsu_ldxa_data_w2 ;
output  [5:0]           tlu_ctxt_cfg_w2 ;       // i/d context zero/non-zero config.
output	[40:0]		tlu_idtlb_dmp_key_g ;


output	[3:0]		tlu_dsfsr_flt_vld ;
output	[3:0]		tlu_isfsr_flt_vld ;

output	[12:0]		tlu_tag_access_ctxt_g ;
output	[63:0]		lsu_exu_ldxa_data_g ;

output	[47:13]		tlu_tsb_base_w2_d1 ;

///output	tlu_tag_access_nctxt_g ;		// tag-access contains nucleus context.

output	[155:0]		mra_wdata ;

wire    [47:0] 		ldst_va_m,ldst_va_g ;
// st_rs3_data partitioned for vlint.
//wire	[63:0]		st_rs3_data_g ;
wire	[63:59]		st_rs3_data_b63t59_g ;
wire	[39:8]		st_rs3_data_b39t8_g ;
wire	[6:1]		st_rs3_data_b6t1_g ;
wire	[63:0]		tag_target ;
wire   	[47:13]        	dtag_access_w2 ;
wire	[23:0]		dsfsr,isfsr ;
wire	[23:0]		dsfsr0,isfsr0 ;
wire	[23:0]		dsfsr1,isfsr1 ;
wire	[23:0]		dsfsr2,isfsr2 ;
wire	[23:0]		dsfsr3,isfsr3 ;
wire	[47:0]		dsfar ;
wire	[47:0]		dsfar0,dsfar1 ;
wire	[47:0]		dsfar2,dsfar3 ;
wire	[23:0]		dsfsr_din ;
wire	[23:0]		isfsr_din ;
//wire	[39:22] 	tte_relocated_pa ;
wire	[40:0]		dmp_key ;
wire	[47:0] 		tag_access_w2 ;
wire	[41:0]		idtte_data_w2 ;	
wire			tlb_access0_clk, tlb_access1_clk ;
wire	[40:0]		idtlb_dmp_key_pend ; 
wire	[47:0]		tag_access_wdata ;
wire	[12:0]		tag_access_ctxt_m,tag_access_ctxt_g ;
// buses split for vlint purposes.
wire 	[58:55] 	idtte_tag_b58t55_g ;
wire 	[53:0] 		idtte_tag_b53t0_g ;
wire 	[58:55] 	idtte_tag_b58t55_w2 ;
wire 	[53:0] 		idtte_tag_b53t0_w2 ;
wire 	[41:0] 		idtte_data_g ;
wire    [47:13]         tlb_dmp_va_g ;
wire	[47:0]	ldxa_l1mx1_dout_e ;
wire	[47:0]	ldxa_l1mx1_dout_m ;


`ifndef NO_RTL_CSM
wire	[`TLB_CSM]		idtte_csm_g ;
wire	[`TLB_CSM]		idtte_csm_w2 ;
`endif
 //=========================================================================================
 //    RESET/CLK
 //=========================================================================================
 
    wire       clk;
    assign     clk = rclk;
 
    wire       rst_l;
    
    dffrl_async rstff(.din (grst_l),
                      .q   (rst_l),
                      .clk (clk), .se(se), .si(), .so(),
                      .rst_l (arst_l));


//=========================================================================================
//	Staging
//=========================================================================================

// Stage
wire [47:13] pc_g ;	
dff_s  #(35) stg_w (
        .din    (ifu_tlu_pc_m[47:13]),
        .q      (pc_g[47:13]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//assign	pc_g[47:13] = ifu_tlu_pc_w[47:13] ;

// Stage va
dff_s  #(48) stg_m (
        .din    (exu_lsu_ldst_va_e[47:0]),
        .q      (ldst_va_m[47:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s  #(48) stg_g (
        .din    (ldst_va_m[47:0]),
        .q      (ldst_va_g[47:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

dff_s  #(35) dstg_g (
        .din    (lsu_tlu_tlb_dmp_va_m[47:13]),
        .q      (tlb_dmp_va_g[47:13]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

//=========================================================================================

wire [4:0] tlu_dmp_key_vld_d1 ;
wire [47:13] tlb_dmp_va_d1 ;
dff_s  #(40) dstg_d1 (
        .din    ({tlb_dmp_va_g[47:13],tlu_dmp_key_vld_g[4:0]}),
        .q      ({tlb_dmp_va_d1[47:13],tlu_dmp_key_vld_d1[4:0]}),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

wire	[2:0]	tlu_tte_tag_d1,tlu_tte_wr_pid_d1 ;
wire		tlu_tte_real_d1,tlu_tlb_tag_invrt_parity_d1 ;
wire	[47:13] dmp_va_d1 ;
wire	[5:0]	dmp_key_vld_d1 ;
dp_mux2es #(41)	dmp_key_sel (
     		.in0	({tlb_dmp_va_d1[47:13],tlu_dmp_key_vld_d1[4:0],tlu_tte_real_d1}),
    		.in1	({tag_access_w2[47:13],1'b1,tlu_tte_tag_d1[2:0],tlu_tte_real_d1,tlu_tte_real_d1}),
    		//.in1	({tag_access_w2[47:13],1'b1,tlu_tte_tag_d1[2:0],1'b0,tlu_tte_real_d1}), // Bug 3754
		.sel	(tlu_admp_key_sel),
	      	.dout	({dmp_va_d1[47:13],dmp_key_vld_d1[5:0]})
	);

assign  dmp_key[40:0] =
        {
        dmp_va_d1[47:28],        // (20b)
        dmp_key_vld_d1[5],       // (1b)
        dmp_va_d1[27:22],        // (6b)
        dmp_key_vld_d1[4],       // (1b)
        dmp_va_d1[21:16],        // (6b)
        dmp_key_vld_d1[3],       // (1b)
        dmp_va_d1[15:13],        // (3b)
        dmp_key_vld_d1[2],       // (1b)
        dmp_key_vld_d1[1],       // (1b)
        dmp_key_vld_d1[0]        // (1b)
        } ;


//wire	tlb_access_en_l_d1 ;
wire    tlb_access2_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dmpky (
                .rclk   (clk),
                .enb_l  (tlu_tlb_access_en_l_d1),
                .tmb_l  (~se),
                .clk    (tlb_access2_clk)
                ) ;
`endif
`endif

// Advance by a cycle. Do not have to reset state.
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(41) stg_w2 (
        .din    (dmp_key[40:0]),
        .q      (idtlb_dmp_key_pend[40:0]),
        .rst_l  (tlb_access_rst_l),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(41) stg_w2 (
        .din    (dmp_key[40:0]),
        .q      (idtlb_dmp_key_pend[40:0]),
        .rst_l  (tlb_access_rst_l),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dffrl_s  #(41) stg_w2 (
        .din    (dmp_key[40:0]),
        .q      (idtlb_dmp_key_pend[40:0]),
        .rst_l  (tlb_access_rst_l),
        .clk    (tlb_access2_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif
`endif

assign  tlu_idtlb_dmp_key_g[40:0] = idtlb_dmp_key_pend[40:0] ;


//=========================================================================================
//	WR DATA FOR MRA
//=========================================================================================

// Format for each entry of MRA on a per thread basis.
// Current :
//	| 	dtsb(48b)	|	dtag_access(48b)	|	dsfar(48b)	|	
//	| 	itsb(48b)	|	itag_access(48b)	|			|	
// New(Hyp,Legacy) : 8 tsb per thread instead of 2. dsfar removed.
// -This allows tag-access to be lined up with simultaneous reads of tsb
// -zero-ctxt and non-zero-ctxt tag-access will have to be distinguished either
// by doing a zero-detect on the lower 13b of the write-data or using a disinct asi.
//	| 	zcps0_dtsb(48b)	|	zcps1_dtsb(48b)	| 	zctxt_dtag_acc(48b) | dzctxt_cfg(6b) |
//	| 	zcps0_itsb(48b)	|	zcps1_itsb(48b)	| 	zctxt_itag_acc(48b) | izctxt_cfg(6b) |
//	|       nzcps0_dtsb(48b)|	nzcps1_dtsb(48b)| 	nzctxt_dtag_acc(48b)| dnzctxt_cfg(6b)|
//	| 	nzcps0_itsb(48b)|	nzcps1_itsb(48b)| 	nzctxt_itag_acc(48b)| inzctxt_cfg(6b)|

mux3ds #(13)	tag_acc_ctxtmx(
    		.in0	(lsu_tlu_pctxt_m[12:0]), // iside selects primary ctxt
    		.in1	(13'd0),		 // iside selects nucleus ctxt
     		.in2	(lsu_tlu_dside_ctxt_m[12:0]), // otherwise select dside ctxt
		.sel0	(tlu_tag_access_ctxt_sel_m[0]),
		.sel1	(tlu_tag_access_ctxt_sel_m[1]),
		.sel2	(tlu_tag_access_ctxt_sel_m[2]),
	      	.dout	(tag_access_ctxt_m[12:0])
	);

/*assign	tag_access_ctxt_m[12:0] =
	tlu_tag_access_ctxt_sel_m[0] ?	lsu_tlu_pctxt_m[12:0] :		// iside selects primary ctxt
		tlu_tag_access_ctxt_sel_m[1] ?	13'd0  : 		// iside selects nucleus ctxt
			tlu_tag_access_ctxt_sel_m[2] ? lsu_tlu_dside_ctxt_m[12:0] : 13'bx_xxxx_xxxx_xxxx ; 			// otherwise select dside ctxt
*/

dff_s  #(13) ctxt_stgg (
        .din    (tag_access_ctxt_m[12:0]),
        .q    	(tag_access_ctxt_g[12:0]),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

// pstate.am masking
wire	[15:0]	ldst_va_masked_g ;
assign	ldst_va_masked_g[15:0] = ldst_va_g[47:32] & {16{~tlu_addr_msk_g}} ;

mux3ds #(48)	dtag_access_dsel(
    		.in0	({ldst_va_masked_g[15:0],ldst_va_g[31:13],tag_access_ctxt_g[12:0]}), // dside hardware
    		.in1	({pc_g[47:13],tag_access_ctxt_g[12:0]}), // iside hardware
     		.in2	(lsu_tlu_st_rs3_data_b47t0_g[47:0]),	// stxa,tsb write as an example.
		.sel0	(tag_access_wdata_sel[0]),
		.sel1	(tag_access_wdata_sel[1]),
		.sel2	(tag_access_wdata_sel[2]),
	      	.dout	(tag_access_wdata[47:0])
	);

// Determine whether context is nucleus or not.
//assign tlu_tag_access_nctxt_g = (tag_access_wdata[12:0] == 13'd0) ;
assign        tlu_tag_access_ctxt_g[12:0] = tag_access_ctxt_g[12:0] ;

wire	[47:0]	dsfar_wdata ;
dp_mux2es #(48)	dsfar_dsel(
    		.in0	({ldst_va_masked_g[15:0],ldst_va_g[31:0]}), // dsfar;trap
    		.in1	(lsu_tlu_st_rs3_data_b47t0_g[47:0]), // asi write
		.sel	(dmmu_any_sfsr_wr),
	      	.dout	(dsfar_wdata[47:0])
	);

// Warning for Grape Mapper - the number of bits may have to be changed to
// map implementation.
assign	mra_wdata[155:0] = 
	// Bug 4676 - tsb rsrved field
	{lsu_tlu_st_rs3_data_b47t0_g[47:12],8'd0,	
		lsu_tlu_st_rs3_data_b47t0_g[3:0],	//ps0 zctxt,nzctxt tsb
	 lsu_tlu_st_rs3_data_b47t0_g[47:12],8'd0, 	
	 	lsu_tlu_st_rs3_data_b47t0_g[3:0], 	//ps1 zctxt,nzctxt tsb
	 tag_access_wdata[47:0],		//i/d tag-access
	 lsu_tlu_st_rs3_data_b47t0_g[10:8], 	//ps1 page size
	 lsu_tlu_st_rs3_data_b47t0_g[2:0], 	//ps0 page size
	 6'd0};


//=========================================================================================
//	D-TAG ACCESS
//=========================================================================================

// 4 registers for the 4 threads.
// 35b of VA || 13b Ctxt.
// ** Ctxt is to be read as zero if there is no context associated with the access **
// VA will be sing-extended based on bit 47. 

// Update in w2.
assign	dtag_access_w2[47:13] = mra_rdata[`MRA_TACCESS_HI:`MRA_TACCESS_LO+13] ;

// Can this be shared with the i-side ?
assign	tlu_dtag_access_w2[47:13] = dtag_access_w2[47:13] ;


//=========================================================================================
//	I-TAG ACCESS
//=========================================================================================

// 4 registers for the 4 threads.
// 35b of VA || 13b Ctxt.
// ** Ctxt is to be read as zero if there is no context associated with the access **
// VA will be sing-extended based on bit 47. 

// Update in w2.
// SPARC_HPV_EN - This needs to be obsoleted. Common tag-access will be superimposed
// on dta_access bus.

//assign	itag_access_w2[32:13] = mra_rdata[`MRA_TACCESS_HI-15:`MRA_TACCESS_LO+13] ;
//assign	itag_access_w2[47:0] = mra_rdata[`MRA_TACCESS_HI:`MRA_TACCESS_LO] ;

//assign	tlu_itag_access_w2[32:13] = itag_access_w2[32:13] ;


//=========================================================================================
//	D-TAG TARGET
//=========================================================================================

// Tag Target is based on currently selected thread.

// Thread0,1,2,3
assign tag_target[63:0] =
	{3'b000,
	ldxa_l1mx1_dout_m[12:0],	// Context
	//tag_access_w2[12:0],		// Context
	6'b000000,
	{16{ldxa_l1mx1_dout_m[47]}},	// Sign-extend VA[47]
	//{16{tag_access_w2[47]}},	// Sign-extend VA[47]
	ldxa_l1mx1_dout_m[47:22]};	// VA // Bug 3975.
	//tag_access_w2[47:22]};	// VA

//=========================================================================================
//	D-TSB
//=========================================================================================

// Note : on interface, dtsb represents ps0 tsbs, itsb represents ps1 tsbs. 

wire 	[47:0] 	tsb_ps0, tsb_ps1 ;
assign	tsb_ps0[47:0] = mra_rdata[`MRA_TSB_PS0_HI:`MRA_TSB_PS0_LO] ;
assign	tsb_ps1[47:0] = mra_rdata[`MRA_TSB_PS1_HI:`MRA_TSB_PS1_LO] ;

assign	tlu_dtsb_split_w2 = tsb_ps0[12] ;
// SPARC_HPV_EN - extend tsb_size by 1b.
assign	tlu_dtsb_size_w2[3:0] = tsb_ps0[3:0] ;

//=========================================================================================
//	CTXT CONFIG
//=========================================================================================

wire	[5:0]	ptr_ctxt_cfg ;
assign	tlu_ctxt_cfg_w2[5:0] =	mra_rdata[`MRA_CTXTCFG_HI:`MRA_CTXTCFG_LO] ;

dff_s  #(6) pctxt_stgm (
        .din    (mra_rdata[`MRA_CTXTCFG_HI:`MRA_CTXTCFG_LO]),
        .q    	(ptr_ctxt_cfg[5:0]),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//=========================================================================================
//	I-TSB
//=========================================================================================

assign	tlu_itsb_split_w2 = tsb_ps1[12] ;
assign	tlu_itsb_size_w2[3:0] = tsb_ps1[3:0] ;

//=========================================================================================
//	STAGE TSB BASE FOR USE IN PTR CALCULATION
//=========================================================================================

wire	[47:13]	tsb_base ;
assign  tsb_base[47:13] =
        tlu_tsb_rd_ps0_sel ? tsb_ps0[47:13] : tsb_ps1[47:13] ;
        //tlu_tsb_rd_ps0_sel ? dtsb[47:13] : itsb[47:13] ;

dff_s  #(35) tsbbase_stgm (
        .din    (tsb_base[47:13]),
        .q    	(tlu_tsb_base_w2_d1[47:13]),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//=========================================================================================
//	8K and 64K Ptr
//=========================================================================================

// In MMU Control.

//=========================================================================================
//	Direct Ptr
//=========================================================================================

//=========================================================================================
//	I-/D TLB Fill : TTE Tag and Data.
//=========================================================================================


// TTE Tag is formed from Tag Access.
// TTE Data is formed from rs3_data for store.

// Timing needs to be fixed !!! Partition mode will add one more cycle
// to path. tlb write will occur in w3.

// partitioned for vlint purposes.
//assign	st_rs3_data_g[63:0] = lsu_tlu_st_rs3_data_g[63:0] ; 
assign	st_rs3_data_b63t59_g[63:59] = lsu_tlu_st_rs3_data_b63t59_g[63:59] ; 
assign	st_rs3_data_b39t8_g[39:8] = lsu_tlu_st_rs3_data_b47t0_g[39:8] ; 
assign	st_rs3_data_b6t1_g[6:1] = lsu_tlu_st_rs3_data_b47t0_g[6:1] ; 

assign	tag_access_w2[47:0] = mra_rdata[`MRA_TACCESS_HI:`MRA_TACCESS_LO] ;

wire idtte_tag_vld_g,idtte_tag_vld_d1 ;
assign	idtte_tag_vld_g =
	st_rs3_data_b63t59_g[63] ;
wire idtte_tag_lock_g,idtte_tag_lock_d1 ;
assign	idtte_tag_lock_g =
	tlu_sun4r_tte_g ? st_rs3_data_b6t1_g[6] : st_rs3_data_b63t59_g[61] ;

`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
wire tlb_access3_clk;
clken_buf clkbf_idttetg (
                .rclk   (clk),
                .enb_l  (tlu_lng_ltncy_en_l),
                .tmb_l  (~se),
                .clk    (tlb_access3_clk)
                ) ;    
`endif
`endif

// Stage some bits to match posedge rd for lng-lat reads of mra.
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(10) stgd1_idttetg (
        .din    ({idtte_tag_vld_g,idtte_tag_lock_g,tlu_tte_tag_g[2:0],
		tlu_tte_wr_pid_g[2:0],tlu_tte_real_g,tlu_tlb_tag_invrt_parity}),
        .q      ({idtte_tag_vld_d1,idtte_tag_lock_d1,tlu_tte_tag_d1[2:0],
		tlu_tte_wr_pid_d1[2:0],tlu_tte_real_d1,tlu_tlb_tag_invrt_parity_d1}),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(10) stgd1_idttetg (
        .din    ({idtte_tag_vld_g,idtte_tag_lock_g,tlu_tte_tag_g[2:0],
		tlu_tte_wr_pid_g[2:0],tlu_tte_real_g,tlu_tlb_tag_invrt_parity}),
        .q      ({idtte_tag_vld_d1,idtte_tag_lock_d1,tlu_tte_tag_d1[2:0],
		tlu_tte_wr_pid_d1[2:0],tlu_tte_real_d1,tlu_tlb_tag_invrt_parity_d1}),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(10) stgd1_idttetg (
        .din    ({idtte_tag_vld_g,idtte_tag_lock_g,tlu_tte_tag_g[2:0],
		tlu_tte_wr_pid_g[2:0],tlu_tte_real_g,tlu_tlb_tag_invrt_parity}),
        .q      ({idtte_tag_vld_d1,idtte_tag_lock_d1,tlu_tte_tag_d1[2:0],
		tlu_tte_wr_pid_d1[2:0],tlu_tte_real_d1,tlu_tlb_tag_invrt_parity_d1}),
        .clk 	(tlb_access3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

// assumption is that tag_access_w2 gets delayed by a cycle because
// the rd is now posedge.
assign idtte_tag_b53t0_g[53:0] =
	{tag_access_w2[47:22],		// VA_tag	(26b)
	tlu_tte_tag_d1[2],		// 27:22 are valid (1b)
	idtte_tag_vld_d1,		// V 		(1b) can be 0 or 1
	idtte_tag_lock_d1,		// L 		(1b) 
	1'b1,				// U		(1b) : must be set on write
	tag_access_w2[21:16],		// VA_tag	(6b)
	tlu_tte_tag_d1[1],		// 21:16 are valid (1b)
	tag_access_w2[15:13],		// VA_tag	(3b)
	tlu_tte_tag_d1[0],		// 15:13 are valid (1b)
	tag_access_w2[12:0] 		// Ctxt b12:0 	(13b)
			};		

assign	idtte_tag_b58t55_g[58:55] = {tlu_tte_wr_pid_d1[2:0],tlu_tte_real_d1};
// V and U bit omitted from tag as it can change once in tlb
// assign	idtte_tag_g[54] = 
// tlu_tlb_tag_invrt_parity_d1^(^{idtte_tag_g[58:55],idtte_tag_g[53:27],idtte_tag_g[25],idtte_tag_g[23:0]}) ;

// Additional page size bit does not have to be included. EP ? 
// SUN4R TTE
wire	[41:0]	idtte_data_sun4r_g ;
assign idtte_data_sun4r_g[41:0] =
	{st_rs3_data_b39t8_g[39:22],	// PA		(18b)
	~tlu_tte_tag_g[2],		// 27:20 - mx sel (1b) : active-low
	st_rs3_data_b39t8_g[21:16],	// PA 		(6b)
	~tlu_tte_tag_g[1],		// 21:16 - mx sel (1b) : active-low
	st_rs3_data_b39t8_g[15:13],	// PA 		(3b)
	~tlu_tte_tag_g[0],		// 15:13 - mx sel (1b) : active-low
	st_rs3_data_b63t59_g[63],	// V		(1b)
	st_rs3_data_b63t59_g[60],	// NFO 		(1b)
	st_rs3_data_b63t59_g[59],	// IE 		(1b)
	st_rs3_data_b6t1_g[6],		// L		(1b)
	st_rs3_data_b6t1_g[5:4],	// CP/CV	(2b)
	st_rs3_data_b6t1_g[3],		// E		(1b)
	st_rs3_data_b6t1_g[2],		// P		(1b)
	st_rs3_data_b6t1_g[1],		// W		(1b)
	3'b000};			// Spare	(3b)
// SUN4V TTE
wire	[41:0]	idtte_data_sun4v_g ;
assign idtte_data_sun4v_g[41:0] =
	{st_rs3_data_b39t8_g[39:22],	// PA		(18b)
	~tlu_tte_tag_g[2],		// 27:20 - mx sel (1b) : active-low
	st_rs3_data_b39t8_g[21:16],	// PA 		(6b)
	~tlu_tte_tag_g[1],		// 21:16 - mx sel (1b) : active-low
	st_rs3_data_b39t8_g[15:13],	// PA 		(3b)
	~tlu_tte_tag_g[0],		// 15:13 - mx sel (1b) : active-low
	st_rs3_data_b63t59_g[63],	// V		(1b) // 4->63. Bug 2977
	st_rs3_data_b63t59_g[62],	// NFO 		(1b) // 10->62
	st_rs3_data_b39t8_g[12],	// IE 		(1b)
	st_rs3_data_b63t59_g[61],	// L 		(1b)
	//1'b0,				//// L(none)	(1b)
	st_rs3_data_b39t8_g[10:9],	// CP/CV	(2b) // 9:8 -> 10:9
	st_rs3_data_b39t8_g[11],	// E		(1b)
	st_rs3_data_b39t8_g[8],		// P		(1b) // 7->8
	st_rs3_data_b6t1_g[6],		// W		(1b) // 5->6
	3'b000};			// Spare	(3b)
assign	idtte_data_g[41:0] =
	tlu_sun4r_tte_g ? idtte_data_sun4r_g[41:0] : idtte_data_sun4v_g[41:0];

`ifndef NO_RTL_CSM
//CSM_CHANGE
assign idtte_csm_g[`TLB_CSM] = {lsu_tlu_st_rs3_data_g[`TTE_CSM_HDID],
                                lsu_tlu_st_rs3_data_g[`TTE_CSM_HD_SIZE],
                                lsu_tlu_st_rs3_data_g[`TTE_CSM_SDID],
                                lsu_tlu_st_rs3_data_g[`TTE_CSM_LSID]};
`endif

// Generate Parity for tte data. Match to DP Macro.
//assign idtte_data_g[42] = tlu_tlb_data_invrt_parity^(^idtte_data_g[41:0]) ;

/*dff  #(1) stgd1_tlbacc (
        .din    (tlb_access_en_l),
        .q    	(tlb_access_en_l_d1),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        );*/

// flopping of tte-tag is delayed by a cycle,tte-data
// is not. wr-vld will match tte-tag.
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_ttetg (
                .rclk   (clk),
                .enb_l  (tlu_tlb_access_en_l_d1),
                .tmb_l  (~se),
                .clk    (tlb_access0_clk)
                ) ;    
`endif
`endif

// Ship for write to TLB. Doesn't have to be resettable.
// Shorten by a bit, as parity will be generated based on output.
// Instead of removing the bit, use it for parity-invrt bit
// in section below.
/*dff  #(59) stgw2_ttetg (
        .din    (idtte_tag_g[58:0]),
        .q      (idtte_tag_w2[58:0]),
        .clk 	(tlb_access0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); */

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(58) stgw2_ttetg (
        .din    ({idtte_tag_b58t55_g[58:55],idtte_tag_b53t0_g[53:0]}),
        .q      ({idtte_tag_b58t55_w2[58:55],idtte_tag_b53t0_w2[53:0]}),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(58) stgw2_ttetg (
        .din    ({idtte_tag_b58t55_g[58:55],idtte_tag_b53t0_g[53:0]}),
        .q      ({idtte_tag_b58t55_w2[58:55],idtte_tag_b53t0_w2[53:0]}),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(58) stgw2_ttetg (
        .din    ({idtte_tag_b58t55_g[58:55],idtte_tag_b53t0_g[53:0]}),
        .q      ({idtte_tag_b58t55_w2[58:55],idtte_tag_b53t0_w2[53:0]}),
        .clk 	(tlb_access0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_ttedt (
                .rclk   (clk),
                .enb_l  (tlu_lng_ltncy_en_l),
                //.enb_l  (tlb_access_en_l),
                .tmb_l  (~se),
                .clk    (tlb_access1_clk)
                ) ;    
`endif
`endif

// Shorten by a bit, as parity will be generated based on output.
// Instead of removing the bit, use it for parity-invrt bit
// in section below.
/*dff  #(43) stgw2_ttedt (
        .din    (idtte_data_g[42:0]),
        .q    	(idtte_data_w2[42:0]),
        .clk 	(tlb_access1_clk),
        .se     (1'b0),       .si (),          .so ()
        );*/ 

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(42) stgw2_ttedt (
        .din    (idtte_data_g[41:0]),
        .q    	(idtte_data_w2[41:0]),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(42) stgw2_ttedt (
        .din    (idtte_data_g[41:0]),
        .q    	(idtte_data_w2[41:0]),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(42) stgw2_ttedt (
        .din    (idtte_data_g[41:0]),
        .q    	(idtte_data_w2[41:0]),
        .clk 	(tlb_access1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif
`endif

`ifndef NO_RTL_CSM
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`TLB_CSM_WIDTH) stgw2_csm_ttedt (
        .din    (idtte_csm_g),
        .q    	(idtte_csm_w2),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`TLB_CSM_WIDTH) stgw2_csm_ttedt (
        .din    (idtte_csm_g),
        .q    	(idtte_csm_w2),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(`TLB_CSM_WIDTH) stgw2_csm_ttedt (
        .din    (idtte_csm_g),
        .q    	(idtte_csm_w2),
        .clk 	(tlb_access1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif
`endif
`endif


wire	parity_tag,parity_data ;
wire	parity_tag_d1,parity_data_d1 ;
assign tlu_dtlb_tte_tag_w2[58:0] = {idtte_tag_b58t55_w2[58:55],parity_tag_d1,idtte_tag_b53t0_w2[53:0]} ;
assign tlu_itlb_tte_tag_w2[58:0] = {idtte_tag_b58t55_w2[58:55],parity_tag_d1,idtte_tag_b53t0_w2[53:0]} ;
assign tlu_dtlb_tte_data_w2[42:0] = {parity_data_d1,idtte_data_w2[41:0]} ;
assign tlu_itlb_tte_data_w2[42:0] = {parity_data_d1,idtte_data_w2[41:0]} ;

`ifndef NO_RTL_CSM
assign tlu_itlb_tte_csm_w2[`TLB_CSM] = idtte_csm_w2;
assign tlu_dtlb_tte_csm_w2[`TLB_CSM] = idtte_csm_w2;
`endif

//=========================================================================================
//	PARITY GEN FOR TTE TAG & DATA
//=========================================================================================

// Timing Change : Since parity is not required until the write, and the write
// is preceeded by a auto-demap, the parity generation can be hidden in the
// cycle of auto-demap.

wire	tlu_tlb_tag_invrt_parity_d2,tlu_tlb_data_invrt_parity_d1 ;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(1) stgw2_ttetgpar (
        .din    (tlu_tlb_tag_invrt_parity_d1),
        .q      (tlu_tlb_tag_invrt_parity_d2),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(1) stgw2_ttetgpar (
        .din    (tlu_tlb_tag_invrt_parity_d1),
        .q      (tlu_tlb_tag_invrt_parity_d2),
        .en (~(tlu_tlb_access_en_l_d1)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(1) stgw2_ttetgpar (
        .din    (tlu_tlb_tag_invrt_parity_d1),
        .q      (tlu_tlb_tag_invrt_parity_d2),
        .clk 	(tlb_access0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(1) stgw2_ttedtpar (
        .din    (tlu_tlb_data_invrt_parity),
        .q    	(tlu_tlb_data_invrt_parity_d1),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(1) stgw2_ttedtpar (
        .din    (tlu_tlb_data_invrt_parity),
        .q    	(tlu_tlb_data_invrt_parity_d1),
        .en (~(tlu_lng_ltncy_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(1) stgw2_ttedtpar (
        .din    (tlu_tlb_data_invrt_parity),
        .q    	(tlu_tlb_data_invrt_parity_d1),
        .clk 	(tlb_access1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	parity_tag =
tlu_tlb_tag_invrt_parity_d2^(^{idtte_tag_b58t55_w2[58:55],
	idtte_tag_b53t0_w2[53:27],idtte_tag_b53t0_w2[25],idtte_tag_b53t0_w2[23:0]}) ;
assign parity_data = tlu_tlb_data_invrt_parity_d1^(^idtte_data_w2[41:0]) ;
//assign	idtte_tag_w2[54] = 
//tlu_tlb_tag_invrt_parity_d2^(^{idtte_tag_w2[58:55],idtte_tag_w2[53:27],idtte_tag_w2[25],idtte_tag_w2[23:0]}) ;
//assign idtte_data_w2[42] = tlu_tlb_data_invrt_parity_d1^(^idtte_data_w2[41:0]) ;

dff_s  #(2) stg_partd (
        .din    ({parity_tag,parity_data}),
        .q      ({parity_tag_d1,parity_data_d1}),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

//=========================================================================================
//	D-SFAR
//=========================================================================================

// dsfar is written into mra for pre SPARC_HPV_EN changes. It will be written into flops
// for SPARC_HPV_EN. 

wire	[47:0]		dsfar_din ;
    
assign	dsfar_din[47:0] = dsfar_wdata[47:0] ;

wire	dsfar0_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfar0 (
                .rclk   (clk),
                .enb_l  (dmmu_sfar_wr_en_l[0]),
                .tmb_l  (~se),
                .clk    (dsfar0_clk)
                ) ;    
`endif
`endif

// Thread0
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar0_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar0[47:0]),
        .en (~(dmmu_sfar_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar0_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar0[47:0]),
        .en (~(dmmu_sfar_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(48) dsfar0_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar0[47:0]),
        .clk 	(dsfar0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif


wire	dsfar1_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfar1 (
                .rclk   (clk),
                .enb_l  (dmmu_sfar_wr_en_l[1]),
                .tmb_l  (~se),
                .clk    (dsfar1_clk)
                ) ;    
`endif
`endif

// Thread1
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar1_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar1[47:0]),
        .en (~(dmmu_sfar_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar1_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar1[47:0]),
        .en (~(dmmu_sfar_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(48) dsfar1_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar1[47:0]),
        .clk 	(dsfar1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

wire	dsfar2_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfar2 (
                .rclk   (clk),
                .enb_l  (dmmu_sfar_wr_en_l[2]),
                .tmb_l  (~se),
                .clk    (dsfar2_clk)
                ) ;    
`endif
`endif

// Thread2
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar2_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar2[47:0]),
        .en (~(dmmu_sfar_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar2_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar2[47:0]),
        .en (~(dmmu_sfar_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(48) dsfar2_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar2[47:0]),
        .clk 	(dsfar2_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif


wire	dsfar3_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfar3 (
                .rclk   (clk),
                .enb_l  (dmmu_sfar_wr_en_l[3]),
                .tmb_l  (~se),
                .clk    (dsfar3_clk)
                ) ;    
`endif
`endif

// Thread3
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar3_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar3[47:0]),
        .en (~(dmmu_sfar_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) dsfar3_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar3[47:0]),
        .en (~(dmmu_sfar_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(48) dsfar3_ff (
        .din    (dsfar_din[47:0]),
        .q      (dsfar3[47:0]),
        .clk 	(dsfar3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

mux4ds #(48) dsfar_mx(
        .in0(dsfar0[47:0]),
        .in1(dsfar1[47:0]),
        .in2(dsfar2[47:0]),
        .in3(dsfar3[47:0]),
	.sel0 (tlu_slxa_thrd_sel[0]),
	.sel1 (tlu_slxa_thrd_sel[1]),
	.sel2 (tlu_slxa_thrd_sel[2]),
	.sel3 (tlu_slxa_thrd_sel[3]),
        .dout(dsfar[47:0])
);


//=========================================================================================
//	D-SFSR
//=========================================================================================


dp_mux2es #(24)	dsfsr_wdsel(
        	.in0    (tlu_dsfsr_din_g[23:0]),
     		.in1	({lsu_tlu_st_rs3_data_b47t0_g[23:16],	// stxa
     			 2'b00,lsu_tlu_st_rs3_data_b47t0_g[13:0]}),
     		// .in1	(lsu_tlu_st_rs3_data_b47t0_g[23:0]),	// Bug 4283
		.sel	(dmmu_any_sfsr_wr),
	      	.dout	(dsfsr_din[23:0])
	);

wire	dsfsr0_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfsr0 (
                .rclk   (clk),
                .enb_l  (dmmu_sfsr_wr_en_l[0]),
                .tmb_l  (~se),
                .clk    (dsfsr0_clk)
                ) ;    
`endif
`endif

// Thread0
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr0_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr0[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr0_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr0[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) dsfsr0_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr0[23:1]),
        .clk 	(dsfsr0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr0vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr0[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr0vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr0[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) dsfsr0vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr0[0]),
        .rst_l	(rst_l),
	.clk 	(dsfsr0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_dsfsr_flt_vld[0] = dsfsr0[0] ;

wire	dsfsr1_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfsr1 (
                .rclk   (clk),
                .enb_l  (dmmu_sfsr_wr_en_l[1]),
                .tmb_l  (~se),
                .clk    (dsfsr1_clk)
                ) ;    
`endif
`endif

// Thread1
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr1_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr1[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr1_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr1[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) dsfsr1_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr1[23:1]),
        .clk 	(dsfsr1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr1vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr1[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr1vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr1[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) dsfsr1vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr1[0]),
        .rst_l	(rst_l),
	.clk 	(dsfsr1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_dsfsr_flt_vld[1] = dsfsr1[0] ;

wire	dsfsr2_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfsr2 (
                .rclk   (clk),
                .enb_l  (dmmu_sfsr_wr_en_l[2]),
                .tmb_l  (~se),
                .clk    (dsfsr2_clk)
                ) ;    
`endif
`endif

// Thread2
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr2_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr2[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr2_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr2[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) dsfsr2_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr2[23:1]),
        .clk 	(dsfsr2_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr2vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr2[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr2vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr2[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) dsfsr2vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr2[0]),
        .rst_l	(rst_l),
	.clk 	(dsfsr2_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_dsfsr_flt_vld[2] = dsfsr2[0] ;

wire	dsfsr3_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_dsfsr3 (
                .rclk   (clk),
                .enb_l  (dmmu_sfsr_wr_en_l[3]),
                .tmb_l  (~se),
                .clk    (dsfsr3_clk)
                ) ;    
`endif
`endif

// Thread3
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr3_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr3[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) dsfsr3_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr3[23:1]),
        .en (~(dmmu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) dsfsr3_ff (
        .din    (dsfsr_din[23:1]),
        .q      (dsfsr3[23:1]),
        .clk 	(dsfsr3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr3vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr3[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) dsfsr3vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr3[0]),
        .rst_l	(rst_l),
	.en (~(dmmu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) dsfsr3vld_ff (
        .din    (dsfsr_din[0]),
        .q      (dsfsr3[0]),
        .rst_l	(rst_l),
	.clk 	(dsfsr3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_dsfsr_flt_vld[3] = dsfsr3[0] ;

dp_mux4ds #(24)	dsfsr_msel(
     		.in0	(dsfsr0[23:0]),
     		.in1	(dsfsr1[23:0]),
     		.in2	(dsfsr2[23:0]),
     		.in3	(dsfsr3[23:0]),
		.sel0_l	(~tlu_slxa_thrd_sel[0]),
		.sel1_l	(~tlu_slxa_thrd_sel[1]),
		.sel2_l	(~tlu_slxa_thrd_sel[2]),
		.sel3_l	(~tlu_slxa_thrd_sel[3]),
	      	.dout	(dsfsr[23:0])
	);

//=========================================================================================
//	I-SFSR
//=========================================================================================

// Should be able to reduce the width of these regs !!!


dp_mux2es #(24)	isfsr_wdsel(
        	.in0    (tlu_isfsr_din_g[23:0]),
     		.in1	({lsu_tlu_st_rs3_data_b47t0_g[23:16],	// stxa
     			 2'b00,lsu_tlu_st_rs3_data_b47t0_g[13:0]}),	
     		//.in1	(lsu_tlu_st_rs3_data_b47t0_g[23:0]),	// Bug 4283
		.sel	(immu_any_sfsr_wr),
	      	.dout	(isfsr_din[23:0])
	);

wire	isfsr0_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_isfsr0 (
                .rclk   (clk),
                .enb_l  (immu_sfsr_wr_en_l[0]),
                .tmb_l  (~se),
                .clk    (isfsr0_clk)
                ) ;    
`endif
`endif

// Thread0
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr0_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr0[23:1]),
        .en (~(immu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr0_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr0[23:1]),
        .en (~(immu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) isfsr0_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr0[23:1]),
        .clk 	(isfsr0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

// Chandra - This has changed.
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld0_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr0[0]),
        .rst_l	(rst_l),      .en (~(immu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld0_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr0[0]),
        .rst_l	(rst_l),      .en (~(immu_sfsr_wr_en_l[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) isfsrvld0_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr0[0]),
        .rst_l	(rst_l),      .clk 	(isfsr0_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_isfsr_flt_vld[0] = isfsr0[0] ;

wire	isfsr1_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_isfsr1 (
                .rclk   (clk),
                .enb_l  (immu_sfsr_wr_en_l[1]),
                .tmb_l  (~se),
                .clk    (isfsr1_clk)
                ) ;    
`endif
`endif

// Thread1
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr1_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr1[23:1]),
        .en (~(immu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr1_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr1[23:1]),
        .en (~(immu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) isfsr1_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr1[23:1]),
        .clk 	(isfsr1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

// Chandra - This has changed.
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld1_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr1[0]),
        .rst_l	(rst_l),		.en (~(immu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld1_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr1[0]),
        .rst_l	(rst_l),		.en (~(immu_sfsr_wr_en_l[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) isfsrvld1_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr1[0]),
        .rst_l	(rst_l),		.clk 	(isfsr1_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_isfsr_flt_vld[1] = isfsr1[0] ;

wire	isfsr2_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_isfsr2 (
                .rclk   (clk),
                .enb_l  (immu_sfsr_wr_en_l[2]),
                .tmb_l  (~se),
                .clk    (isfsr2_clk)
                ) ;    
`endif
`endif

// Thread2
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr2_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr2[23:1]),
        .en (~(immu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr2_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr2[23:1]),
        .en (~(immu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) isfsr2_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr2[23:1]),
        .clk 	(isfsr2_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

// Chandra - This has changed.
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld2_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr2[0]),
        .rst_l	(rst_l),	.en (~(immu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld2_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr2[0]),
        .rst_l	(rst_l),	.en (~(immu_sfsr_wr_en_l[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) isfsrvld2_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr2[0]),
        .rst_l	(rst_l),	.clk 	(isfsr2_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_isfsr_flt_vld[2] = isfsr2[0] ;

wire	isfsr3_clk ;
`ifdef FPGA_SYN_CLK_EN
`else
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_isfsr3 (
                .rclk   (clk),
                .enb_l  (immu_sfsr_wr_en_l[3]),
                .tmb_l  (~se),
                .clk    (isfsr3_clk)
                ) ;    
`endif
`endif

// Thread3
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr3_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr3[23:1]),
        .en (~(immu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(23) isfsr3_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr3[23:1]),
        .en (~(immu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dff_s  #(23) isfsr3_ff (
        .din    (isfsr_din[23:1]),
        .q      (isfsr3[23:1]),
        .clk 	(isfsr3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

// Chandra - This has changed.
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld3_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr3[0]),
        .rst_l	(rst_l),	.en (~(immu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
`ifdef FPGA_SYN_CLK_DFF
dffrle_s  #(1) isfsrvld3_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr3[0]),
        .rst_l	(rst_l),	.en (~(immu_sfsr_wr_en_l[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`else
dffrl_s  #(1) isfsrvld3_ff (
        .din    (isfsr_din[0]),
        .q      (isfsr3[0]),
        .rst_l	(rst_l),	.clk 	(isfsr3_clk),
        .se     (1'b0),       .si (),          .so ()
        ); 
`endif
`endif

assign	tlu_isfsr_flt_vld[3] = isfsr3[0] ;

dp_mux4ds #(24)	isfsr_msel(
     		.in0	(isfsr0[23:0]),
     		.in1	(isfsr1[23:0]),
     		.in2	(isfsr2[23:0]),
     		.in3	(isfsr3[23:0]),
		.sel0_l	(~tlu_slxa_thrd_sel[0]),
		.sel1_l	(~tlu_slxa_thrd_sel[1]),
		.sel2_l	(~tlu_slxa_thrd_sel[2]),
		.sel3_l	(~tlu_slxa_thrd_sel[3]),
	      	.dout	(isfsr[23:0])
	);

//=========================================================================================
//	D-SFAR
//=========================================================================================
/*
`ifdef SPARC_HPV_EN
`else
assign	dsfar[47:0] = mra_rdata[`MRA_DSFAR_HI:`MRA_DSFAR_LO];
`endif
*/

//=========================================================================================
//	Muxing for ldxa read
//=========================================================================================

// Note - collapse dtsb/itsb into one leg of the mux. Similar for
// dtag_access/itag_access.
// read of zcps1_itsb,zcps1_dtsb collapsed into read of dtsb.
// read of nzcps0_dtsb,nzcps0_itsb collapsed into read of dtag_access.
// read of nzcps1_dtsb,nzcps1_itsb collapsed into read of dsfar.

// use rs3 to return data.

//*****************************************************************
//	SPARC_HPV_EN 
//*****************************************************************

// Warning for Grape Mapper : Be careful about loading on replicated
// msb.

// First Level, Mux 1
// This is done in Estage to save on flops.
// !!! The sels except b0 are also Estage !!! b0 is delayed by a cycle.
mux3ds #(48) ldxa_l1mx1_e(
        	.in0(tsb_ps0[47:0]), // becomes ps0 tsb with SPARC_HPV_EN
        	.in1(tsb_ps1[47:0]), // becomes ps1 tsb with SPARC_HPV_EN
        	.in2(tag_access_w2[47:0]),
		.sel0(tlu_ldxa_l1mx1_sel[1]),
		.sel1(tlu_ldxa_l1mx1_sel[2]),
		.sel2(tlu_ldxa_l1mx1_sel[3]),
		.dout(ldxa_l1mx1_dout_e[47:0])
);

// New
dff_s  #(48) l1mx1_ff (
        .din    (ldxa_l1mx1_dout_e[47:0]),
        .q      (ldxa_l1mx1_dout_m[47:0]),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

wire [63:0] ldxa_l1mx1_dout_final ;

// New
assign	ldxa_l1mx1_dout_final[63:0] =
		// Note : this bit of the mx sel is stage delayed relative to the others.
		tlu_ldxa_l1mx1_sel[0] ? 
		tag_target[63:0] : // tag_target.
		{{16{ldxa_l1mx1_dout_m[47]}},ldxa_l1mx1_dout_m[47:0]} ; // tsb_ps0/ps1,tag_access

/*mux4ds #(64) ldxa_l1mx1(
     		.in0(tag_target[63:0]),
        	.in1({{16{tsb_ps0[47]}},tsb_ps0[47:0]}), // becomes ps0 tsb with SPARC_HPV_EN
        	.in2({{16{tsb_ps1[47]}},tsb_ps1[47:0]}), // becomes ps1 tsb with SPARC_HPV_EN
        	.in3({{16{tag_access_w2[47]}},tag_access_w2[47:0]}),
		.sel0(tlu_ldxa_l1mx1_sel[0]),
		.sel1(tlu_ldxa_l1mx1_sel[1]),
		.sel2(tlu_ldxa_l1mx1_sel[2]),
		.sel3(tlu_ldxa_l1mx1_sel[3]),
		.dout(ldxa_l1mx1_dout[63:0])
);*/

wire	[47:0]	ldxa_l1mx2_dout ;
// First Level, Mux 2 - This is done in M stage.
mux4ds #(48) ldxa_l1mx2(
        	.in0({24'd0,dsfsr[23:0]}),
        	.in1(dsfar[47:0]),
        	.in2({24'd0,isfsr[23:0]}),
     		.in3({37'd0,ptr_ctxt_cfg[5:3],5'd0,ptr_ctxt_cfg[2:0]}),
		.sel0(tlu_ldxa_l1mx2_sel[0]),
		.sel1(tlu_ldxa_l1mx2_sel[1]),
		.sel2(tlu_ldxa_l1mx2_sel[2]),
		.sel3(tlu_ldxa_l1mx2_sel[3]),
		.dout(ldxa_l1mx2_dout[47:0])
);

wire	[63:0]	tlu_ldxa_data_m ;
mux3ds #(64)	ldxa_fmx (
    		.in0	(ldxa_l1mx1_dout_final[63:0]),
    		//.in0	(ldxa_l1mx1_dout[63:0]),
    		.in1	({{16{ldxa_l1mx2_dout[47]}},ldxa_l1mx2_dout[47:0]}),
     		.in2	({{16{tlu_idtsb_8k_ptr[47]}},tlu_idtsb_8k_ptr[47:0]}),
		.sel0	(tlu_ldxa_l2mx1_sel[0]),
		.sel1	(tlu_ldxa_l2mx1_sel[1]),
		.sel2	(tlu_ldxa_l2mx1_sel[2]),
	      	.dout	(tlu_ldxa_data_m[63:0])
	      	//.dout	(tlu_ldxa_data_e[63:0])
	);

dff_s  #(64) stgg_eldxa (
        .din    (tlu_ldxa_data_m[63:0]),
        .q    	(lsu_exu_ldxa_data_g[63:0]),
        .clk 	(clk),
        .se     (1'b0),       .si (),          .so ()
        ); 

endmodule


