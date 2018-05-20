// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_tlbdp.v
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

`include        "lsu.tmp.h"

module lsu_tlbdp(/*AUTOARG*/
   // Outputs
   so, lsu_tlb_rd_data, tlb_pgnum_buf, tlb_pgnum_buf2, 
   tlb_rd_tte_data_ie_buf, stb_cam_vld, tte_data_parity_error, 
   tte_tag_parity_error, cache_way_hit_buf1, cache_way_hit_buf2, 
   lsu_tlu_tte_pg_sz_g, 
   // Inputs
   `ifndef NO_RTL_CSM
   tlb_rd_tte_csm, lsu_tlb_csm_rd_vld_g,
   `endif
   rclk, si, se, tlb_rd_tte_tag, tlb_rd_tte_data, 
   lsu_tlb_data_rd_vld_g, tlb_pgnum, asi_internal_m, lsu_alt_space_m, 
   tlb_cam_hit, ifu_lsu_ld_inst_e, lsu_dtlb_bypass_e, 
   tlb_rd_tte_data_parity, tlb_rd_tte_tag_parity, cache_way_hit
   );

   input  rclk;
   input  si;
   input  se;
   output so;
   
input   [58:0]         	tlb_rd_tte_tag ;         // tte tag from tlb
input   [42:0]          tlb_rd_tte_data ;        // tte data from tlb
input			lsu_tlb_data_rd_vld_g ;	 // select between tte tag/data rd.		

`ifndef NO_RTL_CSM
input   [`TLB_CSM]      tlb_rd_tte_csm ;        // tte csm from tlb
input          lsu_tlb_csm_rd_vld_g;
`endif

input [39:10]           tlb_pgnum;
input                   asi_internal_m;
   input                lsu_alt_space_m;
   
// **new**
output	[63:0]		lsu_tlb_rd_data ;	// tag or data rd from tlb



   output [39:10]        tlb_pgnum_buf;
   output [39:37]        tlb_pgnum_buf2;
//   output [42:0]         tlb_rd_tte_data_buf;
   output             tlb_rd_tte_data_ie_buf;

//======================================================
//stb cam vld mved from stb_rwctl    
input     tlb_cam_hit ;
input     ifu_lsu_ld_inst_e;
input     lsu_dtlb_bypass_e;
output    stb_cam_vld;


input    tlb_rd_tte_data_parity ; // data parity bit from tte data
input    tlb_rd_tte_tag_parity ;  // data parity bit from tte tag
output   tte_data_parity_error ;
output   tte_tag_parity_error ;

   input [`L1D_WAY_COUNT-1:0] cache_way_hit;
   output [`L1D_WAY_COUNT-1:0] cache_way_hit_buf1;
   output [`L1D_WAY_COUNT-1:0] cache_way_hit_buf2;

output  [2:0]           lsu_tlu_tte_pg_sz_g ;   // page-size of tte 

wire   tlb_rd_tte_data_27_22_sel_buf;
wire   tlb_rd_tte_data_21_16_sel_buf;
wire   tlb_rd_tte_data_15_13_sel_buf;
wire   lsu_tte_pg_sz_b2, lsu_tte_pg_sz_b1, lsu_tte_pg_sz_b0;
wire   pg_sz_b0, pg_sz_b1, pg_sz_b2;

//===============================================================
   wire   tlb_tte_data_mx_sel2, tlb_tte_data_mx_sel1, tlb_tte_data_mx_sel0;
//tlb_tte_data_mx_sel2 ;  // select for bits 21-19
//tlb_tte_data_mx_sel1 ;  // select for bits 18-16
//tlb_tte_data_mx_sel0 ;  // select for bits 15-13

   assign tlb_tte_data_mx_sel2 = tlb_rd_tte_data_27_22_sel_buf;
   assign tlb_tte_data_mx_sel1 = tlb_rd_tte_data_21_16_sel_buf;
   assign tlb_tte_data_mx_sel0 = tlb_rd_tte_data_15_13_sel_buf;
      
// assign  pg_sz_b0 = 
//  (~tlb_tte_data_mx_sel1 & tlb_tte_data_mx_sel0) | // 64K
//  ( tlb_tte_data_mx_sel1 & tlb_tte_data_mx_sel0) ; // 4M/256M

assign  pg_sz_b0 =  tlb_tte_data_mx_sel0;
   
assign  pg_sz_b1 = 
  (~tlb_tte_data_mx_sel2 & tlb_tte_data_mx_sel1 &  tlb_tte_data_mx_sel0) ; // 4M
assign  pg_sz_b2 = 
  ( tlb_tte_data_mx_sel2 & tlb_tte_data_mx_sel1 &  tlb_tte_data_mx_sel0) ; // 256M
   
assign  lsu_tte_pg_sz_b2 = pg_sz_b2 ;
assign  lsu_tte_pg_sz_b1 = pg_sz_b1 ;
assign  lsu_tte_pg_sz_b0 = pg_sz_b0 ;

assign lsu_tlu_tte_pg_sz_g[2:0] = {pg_sz_b2,pg_sz_b1,pg_sz_b0} ;
   
// CAM VLD GENERATION

// Unfortunately because of timing considerations, this cannot be qualified with
// flush and inst_vld. Must exclude other conditions though such as internal asi
// atomics etc !!! (NOTE : earlier version of inst_vld may be obtained.   
   wire   clk;

   assign   clk =rclk;
   
wire  dtlb_bypass_m ;
dff_s #(1) dtlb_bypass_stgm  (
  .din    (lsu_dtlb_bypass_e), .q (dtlb_bypass_m),
  .clk    (clk), 
  .se     (se), .si (), .so ()
  );

wire ld_inst_vld_m;
dff_s #(1) ld_inst_vld_stgm  (
  .din    (ifu_lsu_ld_inst_e), .q (ld_inst_vld_m),
  .clk    (clk), 
  .se     (se), .si (), .so ()
  );

assign  stb_cam_vld = ld_inst_vld_m & (tlb_cam_hit | dtlb_bypass_m) & 
                      ~(asi_internal_m  & lsu_alt_space_m); //bug 4635, revisit
//======================================================================   

//buffer all inputs first
wire   [58:0]         tlb_rd_tte_tag_buf ;       
wire   [42:0]         tlb_rd_tte_data_buf ;      
wire			            lsu_tte_pg_sz_b1_buf;
wire			            lsu_tte_pg_sz_b0_buf;
wire			            lsu_tte_pg_sz_b2_buf;
wire   [39:10]        tlb_pgnum_l;
wire   [39:10]        tlb_pgnum_buf;  
wire   [39:37]        tlb_pgnum_buf2;  

//BUFFERS
   assign             tlb_rd_tte_tag_buf[58:0] = tlb_rd_tte_tag[58:0];
   assign             lsu_tte_pg_sz_b1_buf = lsu_tte_pg_sz_b1;
   assign             lsu_tte_pg_sz_b0_buf = lsu_tte_pg_sz_b0;
   assign             lsu_tte_pg_sz_b2_buf = lsu_tte_pg_sz_b2;

   //tlb_pgnum buffer
   assign             tlb_pgnum_l [39:10] = ~ tlb_pgnum[39:10];
   assign             tlb_pgnum_buf[39:10] = ~ tlb_pgnum_l[39:10];
   assign             tlb_pgnum_buf2[39:37] = ~ tlb_pgnum_l[39:37];

   assign             tlb_rd_tte_data_buf[42:0] = tlb_rd_tte_data[42:0];
   
   assign tlb_rd_tte_data_ie_buf =  tlb_rd_tte_data_buf [`STLB_DATA_IE];
   assign tlb_rd_tte_data_27_22_sel_buf = tlb_rd_tte_data_buf [`STLB_DATA_27_22_SEL];
   assign tlb_rd_tte_data_21_16_sel_buf = tlb_rd_tte_data_buf [`STLB_DATA_21_16_SEL];
   assign tlb_rd_tte_data_15_13_sel_buf = tlb_rd_tte_data_buf [`STLB_DATA_15_13_SEL];
   
   
wire	[63:0]	formatted_tte_tag, formatted_tte_data;

//=================================================================================================
//      Format TLB Tag 
//=================================================================================================

assign  formatted_tte_tag[63:0] =
        {
	tlb_rd_tte_tag_buf[58:56],
	tlb_rd_tte_tag_buf[55],
	// ECO 4265 begin
	tlb_rd_tte_tag_buf[`STLB_TAG_PARITY], 	  // Parity
	tlb_rd_tte_tag_buf[`STLB_TAG_VA_27_22_V], // mxsel2 - b27:22 vld 
	tlb_rd_tte_tag_buf[`STLB_TAG_VA_21_16_V], // mxsel1 - b21:16 vld
	tlb_rd_tte_tag_buf[`STLB_TAG_VA_15_13_V], // mxsel0 - b15:13 vld
        {8{tlb_rd_tte_tag_buf[53]}},                                        // (8b)
	// ECO 4265 end
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_47_28_HI:`STLB_TAG_VA_47_28_LO],    // (20b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_27_22_HI:`STLB_TAG_VA_27_22_LO],    // (6b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_21_16_HI:`STLB_TAG_VA_21_16_LO],    // (6b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_15_13_HI:`STLB_TAG_VA_15_13_LO],    // (3b)
        tlb_rd_tte_tag_buf[`STLB_TAG_CTXT_12_0_HI:`STLB_TAG_CTXT_12_0_LO] // (13b)
        } ;
/*
assign  formatted_tte_tag[63:0] =
        {
        {16{tlb_rd_tte_tag_buf[54]}},                                       // (16b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_47_22_HI:`STLB_TAG_VA_47_22_LO],    // (26b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_21_20_HI:`STLB_TAG_VA_21_20_LO],    // (3b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_19],
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_18_17_HI:`STLB_TAG_VA_18_17_LO],    // (3b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_16],
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_15_14_HI:`STLB_TAG_VA_15_14_LO],    // (3b)
        tlb_rd_tte_tag_buf[`STLB_TAG_VA_13],
        tlb_rd_tte_tag_buf[`STLB_TAG_CTXT_12_7_HI:`STLB_TAG_CTXT_12_7_LO],  // (13b)
        tlb_rd_tte_tag_buf[`STLB_TAG_CTXT_6_0_HI:`STLB_TAG_CTXT_6_0_LO]
        } ;
*/


//=================================================================================================
//      Format TLB Data 
//=================================================================================================

assign  formatted_tte_data[63:0] =
        {
        tlb_rd_tte_tag_buf[`STLB_TAG_V],            // V    (1b)
        lsu_tte_pg_sz_b1_buf,                       // SZ   (2b)
        lsu_tte_pg_sz_b0_buf,
        tlb_rd_tte_data_buf[`STLB_DATA_NFO],        // NFO  (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_IE],         // IE   (1b)
        9'd0,         				    // Soft2
        1'b0,
        lsu_tte_pg_sz_b2_buf,                       // SZ   (1b)
        tlb_rd_tte_tag_buf[`STLB_TAG_U],            // U    (1b)
	// ECO 4265 - begin
        tlb_rd_tte_data_buf[`STLB_DATA_PARITY],      // Parity   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_27_22_SEL],   // mxsel2_l (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_21_16_SEL],   // mxsel1_l (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_15_13_SEL],   // mxsel0_l (1b)
        2'd0,                                        // Unused Diag bits
	// ECO 4265 - end 
        1'b0,                                        // PA   (28b)
        tlb_rd_tte_data_buf[`STLB_DATA_PA_39_28_HI:`STLB_DATA_PA_39_28_LO],
        tlb_rd_tte_data_buf[`STLB_DATA_PA_27_22_HI:`STLB_DATA_PA_27_22_LO],
        tlb_rd_tte_data_buf[`STLB_DATA_PA_21_16_HI:`STLB_DATA_PA_21_16_LO],
        tlb_rd_tte_data_buf[`STLB_DATA_PA_15_13_HI:`STLB_DATA_PA_15_13_LO],
        6'd0,                                   // ?? 12-7 (6b)
        tlb_rd_tte_data_buf[`STLB_DATA_L],          // L    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_CP],         // CP   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_CV],         // CV   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_E],          // E    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_P],          // P    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_W],          // W    (1b)
        1'b0
        } ;


`ifndef NO_RTL_CSM
wire [63:0] formatted_tte_csm;

assign formatted_tte_csm = 
        {
        32'b0,
        tlb_rd_tte_csm[`TLB_CSM_HDID], 
        tlb_rd_tte_csm[`TLB_CSM_HD_SIZE], 
        tlb_rd_tte_csm[`TLB_CSM_SDID], 
        tlb_rd_tte_csm[`TLB_CSM_LSID]
        };
        
/*
assign formatted_tte_csm = 
        {
        tlb_rd_tte_tag_buf[`STLB_TAG_V],            // V    (1b)
        lsu_tte_pg_sz_b1_buf,                       // SZ   (2b)
        lsu_tte_pg_sz_b0_buf,
        tlb_rd_tte_data_buf[`STLB_DATA_NFO],        // NFO  (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_IE],         // IE   (1b)
        9'd0,         				    // Soft2
        1'b0,
        lsu_tte_pg_sz_b2_buf,                       // SZ   (1b)
        tlb_rd_tte_tag_buf[`STLB_TAG_U],            // U    (1b)
	// ECO 4265 - begin
        tlb_rd_tte_data_buf[`STLB_DATA_PARITY],      // Parity   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_27_22_SEL],   // mxsel2_l (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_21_16_SEL],   // mxsel1_l (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_15_13_SEL],   // mxsel0_l (1b)
        2'd0,                                        // Unused Diag bits
	// ECO 4265 - end 
        1'b0,                                      
        1'b0,                                       //TTE_CSM_RES1 
        tlb_rd_tte_csm[`TLB_CSM_SDID], 
        tlb_rd_tte_csm[`TLB_CSM_HDID], 
        tlb_rd_tte_csm[`TLB_CSM_LSID], 
        6'd0,                                   // ?? 12-7 (6b)
        tlb_rd_tte_data_buf[`STLB_DATA_L],          // L    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_CP],         // CP   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_CV],         // CV   (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_E],          // E    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_P],          // P    (1b)
        tlb_rd_tte_data_buf[`STLB_DATA_W],          // W    (1b)
        1'b0
        };
*/
//CSM_CHANGE
`endif
//=================================================================================================
//      Select TLB Read data / TLB Read tag
//=================================================================================================

`ifndef NO_RTL_CSM
assign lsu_tlb_rd_data[63:0] =
                lsu_tlb_data_rd_vld_g ? formatted_tte_data[63:0] : 
                lsu_tlb_csm_rd_vld_g  ? formatted_tte_csm[63:0]  : formatted_tte_tag[63:0];
`else
assign lsu_tlb_rd_data[63:0] =
                lsu_tlb_data_rd_vld_g ? formatted_tte_data[63:0] : formatted_tte_tag[63:0];
`endif

//=================================================================================================
//      Calculate parity for TLB Tag and Data
//=================================================================================================
   wire lsu_rd_tte_data_parity, lsu_rd_tte_tag_parity;
   
assign  lsu_rd_tte_data_parity = ^tlb_rd_tte_data_buf[41:0] ;
assign  lsu_rd_tte_tag_parity =  ^{tlb_rd_tte_tag_buf[58:55],tlb_rd_tte_tag_buf[53:27],
				tlb_rd_tte_tag_buf[25],tlb_rd_tte_tag_buf[23:0]} ;
 
assign  tte_data_parity_error = 
  tlb_rd_tte_data_parity ^ lsu_rd_tte_data_parity ;
assign  tte_tag_parity_error  = 
  tlb_rd_tte_tag_parity ^ lsu_rd_tte_tag_parity ;

   assign cache_way_hit_buf1[`L1D_WAY_COUNT-1:0] = cache_way_hit[`L1D_WAY_COUNT-1:0];
   assign cache_way_hit_buf2[`L1D_WAY_COUNT-1:0] = cache_way_hit[`L1D_WAY_COUNT-1:0];

   
endmodule
