// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_stb_rwdp.v
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
///////////////////////////////////////////////////////////////////
/*
//	Description:	Datapath for STB
//				- Mainly for formatting stb data 
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////
`include	"sys.h" // system level definition file which contains the 
					// time scale definition

`include "iop.h"

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

module lsu_stb_rwdp (/*AUTOARG*/
   // Outputs
   so, stb_rdata_ramd_buf, stb_rdata_ramd_b74_buf, lsu_stb_st_data_g, 
   // Inputs
   rclk, si, se, rst_tri_en, exu_lsu_rs3_data_e, 
   lsu_stb_data_early_sel_e, lsu_stb_data_final_sel_m, 
   exu_lsu_rs2_data_e, lsu_st_sz_bhww_m, lsu_st_sz_dw_m, 
   lsu_st_sz_bhw_m, lsu_st_sz_wdw_m, lsu_st_sz_b_m, lsu_st_sz_w_m, 
   lsu_st_sz_hw_m, lsu_st_sz_hww_m, ffu_lsu_data, lsu_st_hw_le_g, 
   lsu_st_w_or_dbl_le_g, lsu_st_x_le_g, lsu_swap_sel_default_g, 
   lsu_swap_sel_default_byte_7_2_g, stb_rdata_ramd, 
   stb_rdata_ramd_b74
   ) ;	

   input  rclk ;
   input  si;
   output so;
   input  se;
   input  rst_tri_en;
   
input   [63:0]          exu_lsu_rs3_data_e ;    // data for store.
input	[3:0]		lsu_stb_data_early_sel_e ;// early source of data for stb
input			lsu_stb_data_final_sel_m ;// early source of data for stb
input   [63:0]          exu_lsu_rs2_data_e ;    // rs2 data for cas.
input			lsu_st_sz_bhww_m ;	// byte or hword or word
input			lsu_st_sz_dw_m ;	// double word
input			lsu_st_sz_bhw_m ;	// byte or hword
input			lsu_st_sz_wdw_m ;	// word or dword
input			lsu_st_sz_b_m ;		// byte
input			lsu_st_sz_w_m ;		// word
input			lsu_st_sz_hw_m ;	// hword
input			lsu_st_sz_hww_m ;	// hword or word
input	[63:0]		ffu_lsu_data ;	// fp store data - m stage
//input			lsu_bendian_access_g ;	// bendian st
//input			lsu_stdbl_inst_m ;	// stdbl

   input        lsu_st_hw_le_g;
   input        lsu_st_w_or_dbl_le_g;
   input        lsu_st_x_le_g;
   input        lsu_swap_sel_default_g;
   input        lsu_swap_sel_default_byte_7_2_g;
   
   input [69:0] stb_rdata_ramd;
   input        stb_rdata_ramd_b74;
   
   output [69:0] stb_rdata_ramd_buf;
   output        stb_rdata_ramd_b74_buf;
   
output	[63:0]		lsu_stb_st_data_g ;	// data to be written to stb

wire	[7:0]	byte0, byte1, byte2, byte3 ;
wire	[7:0]	byte4, byte5, byte6, byte7 ;
wire	[7:0]	swap_byte0, swap_byte1, swap_byte2, swap_byte3 ;
wire	[7:0]	swap_byte4, swap_byte5, swap_byte6, swap_byte7 ;

wire	[63:0]	stb_st_data_g ;
wire	[63:0]	stb_st_data_early_e ;
wire	[63:0]	stb_st_data_early_m ;
wire	[63:0]	stb_st_data_final_m ;
wire		st_sz_bhww_g ;
wire		st_sz_dw_g ;
wire		st_sz_bhw_g ;
wire		st_sz_wdw_g ;
wire		st_sz_b_g ;
wire		st_sz_w_g ;
wire		st_sz_hw_g ;
wire		st_sz_hww_g ;
//wire		bendian ;
//wire		stdbl_g ;

   wire clk;
   assign clk = rclk;
   
//assign  stb_st_data_early_e[63:0] =       //@@ bw_u1_muxi41d_2x   
//        lsu_stb_data_early_sel_e[0] ? 64'hffff_ffff_ffff_ffff :            		// ldstub writes all ones
//                lsu_stb_data_early_sel_e[1] ? exu_lsu_rs2_data_e[63:0] :        	// cas pkt1 uses rs2
//                	lsu_stb_data_early_sel_e[2] ? exu_lsu_rs3_data_e[63:0] :   	// use rs3/rd data.
//                		lsu_stb_data_early_sel_e[3] ? {exu_lsu_rs2_data_e[31:0],exu_lsu_rs3_data_e[31:0]} :  
											// else std non-alt
//						64'hxxxx_xxxx_xxxx_xxxx ;				

mux4ds #(64) stb_st_data_early_e_mx (
 .in0 (64'hffff_ffff_ffff_ffff), 
 .in1 (exu_lsu_rs2_data_e[63:0]),
 .in2 (exu_lsu_rs3_data_e[63:0]),
 .in3 ({exu_lsu_rs2_data_e[31:0],exu_lsu_rs3_data_e[31:0]}),
 .sel0(lsu_stb_data_early_sel_e[0]),
 .sel1(lsu_stb_data_early_sel_e[1]),
 .sel2(lsu_stb_data_early_sel_e[2]),
 .sel3(lsu_stb_data_early_sel_e[3]),
 .dout(stb_st_data_early_e[63:0]));
                                    

// Stage early data to m
dff_s #(64)  stgm_rs2     (             //@@ bw_u1_soffi_2x
        .din            (stb_st_data_early_e[63:0]),
        .q              (stb_st_data_early_m[63:0]),
        .clk            (clk),
        .se             (se), .si     (), .so ()
        );

assign  stb_st_data_final_m[63:0] =    //@@ bw_u1_muxi21_2x
        lsu_stb_data_final_sel_m ? stb_st_data_early_m[63:0] : ffu_lsu_data[63:0] ; 	// mux in fpst data

// Precursor of data to be stored in stb
// For ldstub, all one's need to be written to stb.
// For cas/swap, data remains unmodified.
// Stage final data to g
dff_s #(64)  stgg_rs2     (             //@@ bw_u1_soffi_2x
        .din            (stb_st_data_final_m[63:0]),
        .q              (stb_st_data_g[63:0]),
        .clk            (clk),
        .se             (se), .si     (), .so ()
        );

dff_s #(8)  stgm_sel     (             //@@ bw_u1_soff_8x
	.din		({lsu_st_sz_bhww_m,lsu_st_sz_dw_m,lsu_st_sz_bhw_m,lsu_st_sz_wdw_m,
			lsu_st_sz_b_m,lsu_st_sz_w_m,lsu_st_sz_hw_m,lsu_st_sz_hww_m}),
	.q		({st_sz_bhww_g,st_sz_dw_g,st_sz_bhw_g,st_sz_wdw_g,
			st_sz_b_g,st_sz_w_g,st_sz_hw_g,st_sz_hww_g}),
        .clk            (clk),
        .se             (se), .si     (), .so ()
        );

// Now format data for st data.
assign	byte0[7:0] = stb_st_data_g[7:0] ; //@@ PASS
assign	byte1[7:0] = stb_st_data_g[15:8] ; //@@ PASS
assign	byte2[7:0] = stb_st_data_g[23:16] ; //@@ PASS
assign	byte3[7:0] = stb_st_data_g[31:24] ; //@@ PASS
assign	byte4[7:0] = stb_st_data_g[39:32] ; //@@ PASS
assign	byte5[7:0] = stb_st_data_g[47:40] ; //@@ PASS
assign	byte6[7:0] = stb_st_data_g[55:48] ; //@@ PASS
assign	byte7[7:0] = stb_st_data_g[63:56] ; //@@ PASS


//assign	bendian = lsu_bendian_access_g ;	// bendian store

// Control needs to move to lsu_stb_rwctl once this is fully tested.

// First do swap for big-endian vs little-endian case.

//wire	swap_sel_default ;

//assign	swap_sel_default = bendian | (~bendian & st_sz_b_g) ;
 
// swap byte0
//assign	swap_byte0[7:0] =               //@@ bw_u1_muxi41d_4x
//	lsu_swap_sel_default_g ? byte0[7:0] : 
//		lsu_st_hw_le_g ? byte1[7:0] :
//			lsu_st_w_or_dbl_le_g ? byte3[7:0] :
//				lsu_st_x_le_g ? byte7[7:0] : 8'bxxxx_xxxx ; 

mux4ds #(8) swap_byte0_mx (
  .in0 (byte0[7:0]), .sel0(lsu_swap_sel_default_g),
  .in1 (byte1[7:0]), .sel1(lsu_st_hw_le_g),
  .in2 (byte3[7:0]), .sel2(lsu_st_w_or_dbl_le_g),
  .in3 (byte7[7:0]), .sel3(lsu_st_x_le_g),
  .dout(swap_byte0[7:0]));
                         
// swap byte1
//assign	swap_byte1[7:0] =               //@@ bw_u1_muxi41d_4x
//	lsu_swap_sel_default_g ? byte1[7:0] : 
//		lsu_st_hw_le_g ? byte0[7:0] :	
//			 lsu_st_w_or_dbl_le_g ? byte2[7:0] :
//				 lsu_st_x_le_g ? byte6[7:0] : 8'bxxxx_xxxx ; 

mux4ds #(8) swap_byte1_mx (
 .in0 (byte1[7:0]), .sel0(lsu_swap_sel_default_g),
 .in1 (byte0[7:0]), .sel1(lsu_st_hw_le_g),
 .in2 (byte2[7:0]), .sel2(lsu_st_w_or_dbl_le_g),
 .in3 (byte6[7:0]), .sel3(lsu_st_x_le_g),
 .dout (swap_byte1[7:0]));
    
// swap byte2
//assign	swap_byte2[7:0] =                //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte2[7:0] : 
//		lsu_st_w_or_dbl_le_g ? byte1[7:0] :
//			lsu_st_x_le_g ? byte5[7:0] : 8'bxxxx_xxxx ; 
   
mux3ds #(8) swap_byte2_mx (
  .in0 (byte2[7:0]), .sel0(lsu_swap_sel_default_byte_7_2_g),
  .in1 (byte1[7:0]), .sel1(lsu_st_w_or_dbl_le_g),
  .in2 (byte5[7:0]), .sel2(lsu_st_x_le_g),
  .dout (swap_byte2[7:0]));
      
// swap byte3
//assign	swap_byte3[7:0] =                 //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte3[7:0] : 
//		lsu_st_w_or_dbl_le_g ? byte0[7:0] :
//			lsu_st_x_le_g ? byte4[7:0] : 8'bxxxx_xxxx ; 

mux3ds #(8) swap_byte3_mx (
 .in0 (byte3[7:0]), .sel0(lsu_swap_sel_default_byte_7_2_g),
 .in1 (byte0[7:0]), .sel1(lsu_st_w_or_dbl_le_g),
 .in2 (byte4[7:0]), .sel2(lsu_st_x_le_g),
 .dout(swap_byte3[7:0]));
                          
// swap byte4
//assign	swap_byte4[7:0] =                 //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte4[7:0] : 
//		 lsu_st_w_or_dbl_le_g ? byte7[7:0] :
//			 lsu_st_x_le_g ? byte3[7:0] : 8'bxxxx_xxxx ; 

mux3ds #(8) swap_byte4_mx (
.in0 (byte4[7:0]), .sel0(lsu_swap_sel_default_byte_7_2_g),
.in1 (byte7[7:0]), .sel1(lsu_st_w_or_dbl_le_g),
.in2 (byte3[7:0]), .sel2(lsu_st_x_le_g),
.dout(swap_byte4[7:0]));
  
// swap byte5
//assign	swap_byte5[7:0] =                 //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte5[7:0] : 
//		 lsu_st_w_or_dbl_le_g ? byte6[7:0] :
//			  lsu_st_x_le_g ? byte2[7:0] : 8'bxxxx_xxxx ; 

mux3ds #(8) swap_byte5_mx (
 .in0 (byte5[7:0]), .sel0(lsu_swap_sel_default_byte_7_2_g),
 .in1 (byte6[7:0]), .sel1(lsu_st_w_or_dbl_le_g),
 .in2 (byte2[7:0]), .sel2(lsu_st_x_le_g),
 .dout(swap_byte5[7:0]));
 
// swap byte6
//assign	swap_byte6[7:0] =                 //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte6[7:0] : 
//		 lsu_st_w_or_dbl_le_g ? byte5[7:0] :
//			  lsu_st_x_le_g ? byte1[7:0] : 8'bxxxx_xxxx ; 

mux3ds #(8) swap_byte6_mx (
 .in0 (byte6[7:0]), .sel0 (lsu_swap_sel_default_byte_7_2_g),
 .in1 (byte5[7:0]), .sel1 (lsu_st_w_or_dbl_le_g),
 .in2 (byte1[7:0]), .sel2 (lsu_st_x_le_g),
 .dout(swap_byte6[7:0]));
  
// swap byte7
//assign	swap_byte7[7:0] =                 //@@ bw_u1_muxi31d_4x
//	lsu_swap_sel_default_g ? byte7[7:0] : 
//		 lsu_st_w_or_dbl_le_g ? byte4[7:0] :
//		    lsu_st_x_le_g ? byte0[7:0] : 8'bxxxx_xxxx ; 

mux3ds #(8) swap_byte7_mx (
 .in0 (byte7[7:0]), .sel0 (lsu_swap_sel_default_byte_7_2_g),
 .in1 (byte4[7:0]), .sel1 (lsu_st_w_or_dbl_le_g),
 .in2 (byte0[7:0]), .sel2 (lsu_st_x_le_g),
 .dout (swap_byte7[7:0]));
   
// Now replicate date across 8 bytes.

// replicated byte0
assign	lsu_stb_st_data_g[7:0] = swap_byte0[7:0] ;	// all data sizes //@@ bw_u1_inv_8x

// replicated byte1
assign	lsu_stb_st_data_g[15:8] =                 //@@ bw_u1_muxi21_6x
		st_sz_b_g ? swap_byte0[7:0] : swap_byte1[7:0] ;

// replicated byte2
assign	lsu_stb_st_data_g[23:16] =                //@@ bw_u1_muxi21_6x
		st_sz_bhw_g ? swap_byte0[7:0] : swap_byte2[7:0] ;

// replicated byte3
//assign	lsu_stb_st_data_g[31:24] =                 //@@ bw_u1_muxi31d_6x
//		st_sz_b_g ? swap_byte0 :			// swap_byte
//			st_sz_hw_g ? swap_byte1 :	// hword
//				st_sz_wdw_g ? swap_byte3 : // dword or word
//					8'bxxxx_xxxx ;

   wire st_sz_b_g_sel, st_sz_hw_g_sel, st_sz_wdw_g_sel;
   assign st_sz_b_g_sel = st_sz_b_g & ~rst_tri_en;
   assign st_sz_hw_g_sel = st_sz_hw_g & ~rst_tri_en;
   assign st_sz_wdw_g_sel = st_sz_wdw_g | rst_tri_en;
   
mux3ds #(8) rpl_byte3_mx (
  .in0 (swap_byte0[7:0]), .sel0 (st_sz_b_g_sel),
  .in1 (swap_byte1[7:0]), .sel1 (st_sz_hw_g_sel),
  .in2 (swap_byte3[7:0]), .sel2 (st_sz_wdw_g_sel),
  .dout (lsu_stb_st_data_g[31:24]));
                             
// replicated byte4
assign	lsu_stb_st_data_g[39:32] =                 //@@ bw_u1_muxi21_6x
	st_sz_bhww_g ? swap_byte0[7:0] : swap_byte4[7:0] ;	// dword


// replicated byte5
//assign	lsu_stb_st_data_g[47:40] =                 //@@ bw_u1_muxi31d_6x
//		st_sz_b_g ? swap_byte0 :			// swap_byte 
//			st_sz_hww_g ? swap_byte1 :	// hword or word
//				st_sz_dw_g ? swap_byte5 : // dword
//					8'bxxxx_xxxx ;

    wire  st_sz_hww_g_sel, st_sz_dw_g_sel;
   assign st_sz_hww_g_sel = st_sz_hww_g & ~rst_tri_en;
   assign st_sz_dw_g_sel = st_sz_dw_g | rst_tri_en;
  
mux3ds #(8) rpl_byte5_mx (
  .in0 (swap_byte0[7:0]), .sel0(st_sz_b_g_sel),
  .in1 (swap_byte1[7:0]), .sel1(st_sz_hww_g_sel),
  .in2 (swap_byte5[7:0]), .sel2(st_sz_dw_g_sel),
  .dout(lsu_stb_st_data_g[47:40]));
                           
// replicated byte6
//assign	lsu_stb_st_data_g[55:48] =                 //@@ bw_u1_muxi31d_6x
//		st_sz_bhw_g ? swap_byte0 :		// swap_byte or hword
//			st_sz_w_g ? swap_byte2 :		// word
//				st_sz_wdw_g ? swap_byte6 : // dword
//					8'bxxxx_xxxx ;

   wire   st_sz_bhw_g_sel, st_sz_w_g_sel;
   assign st_sz_bhw_g_sel = st_sz_bhw_g & ~rst_tri_en;
   assign st_sz_w_g_sel = st_sz_w_g & ~rst_tri_en;
   
  
mux3ds #(8) rpl_byte6_mx (
  .in0 (swap_byte0[7:0]),
  .in1 (swap_byte2[7:0]),
  .in2 (swap_byte6[7:0]),
  .sel0(st_sz_bhw_g_sel),
  .sel1(st_sz_w_g_sel),
  .sel2(st_sz_dw_g_sel),
  .dout(lsu_stb_st_data_g[55:48]));
 
// replicated byte7
//assign	lsu_stb_st_data_g[63:56] =                //@@ bw_u1_muxi41d_6x
//		st_sz_b_g ? swap_byte0 :			// swap_byte
//			st_sz_hw_g ? swap_byte1 :	// hword
//				st_sz_w_g ? swap_byte3 :	// word
//					st_sz_dw_g ? swap_byte7 : // dword
//						8'bxxxx_xxxx ;

mux4ds #(8) rpl_byte7_mx (
  .in0(swap_byte0[7:0]), .sel0(st_sz_b_g_sel),
  .in1(swap_byte1[7:0]), .sel1(st_sz_hw_g_sel),
  .in2(swap_byte3[7:0]), .sel2(st_sz_w_g_sel),
  .in3(swap_byte7[7:0]), .sel3(st_sz_dw_g_sel),
  .dout (lsu_stb_st_data_g[63:56]));
    
//=========================================================
//stb rdata buffer
   assign stb_rdata_ramd_buf[69:0] = stb_rdata_ramd[69:0];
   assign stb_rdata_ramd_b74_buf = stb_rdata_ramd_b74;
      
endmodule
