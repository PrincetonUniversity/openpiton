// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sparc_ifu_invctl.v
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
//  Module Name: sparc_ifu_invctl
//  Description:
//  Control logic for handling invalidations to the icache
//
*/

////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

`include "iop.h"
`include "ifu.h"

module sparc_ifu_invctl(/*AUTOARG*/
   // Outputs
   so, inv_ifc_inv_pending, ifq_icv_wrindex_bf, ifq_icv_wren_bf,
   ifq_ict_dec_wrway_bf, ifq_fcl_invreq_bf, ifq_erb_asiway_f,
   // Inputs
   rclk, se, si, const_cpuid, mbist_icache_write,
   lsu_ifu_ld_icache_index, lsu_ifu_ld_pcxpkt_vld,
   lsu_ifu_ld_pcxpkt_tid, ifc_inv_ifqadv_i2, ifc_inv_asireq_i2,
   ifq_icd_index_bf, ifd_inv_ifqop_i2, ifd_inv_wrway_i2
   );

   input        rclk,
                se,
                si;


   input [2:0]  const_cpuid;
   input        mbist_icache_write;

   input [`IC_IDX_HI:5]   lsu_ifu_ld_icache_index;
   input                  lsu_ifu_ld_pcxpkt_vld;
   input [1:0]            lsu_ifu_ld_pcxpkt_tid;

   input                  ifc_inv_ifqadv_i2;
   input                  ifc_inv_asireq_i2;

   input [`IC_IDX_HI:5]   ifq_icd_index_bf;
   input [`CPX_WIDTH-1:0] ifd_inv_ifqop_i2;
   input [1:0]            ifd_inv_wrway_i2;


   output                 so;

   output                 inv_ifc_inv_pending;

   output [`IC_IDX_HI:5]  ifq_icv_wrindex_bf;
   output [15:0]          ifq_icv_wren_bf;
   output [3:0]           ifq_ict_dec_wrway_bf;
   output                 ifq_fcl_invreq_bf;
   output [1:0]           ifq_erb_asiway_f;


//----------------------------------------------------------------------
//  Local Signals
//----------------------------------------------------------------------

   wire [3:0]  cpu_sel,
               invcpu21_sel_i2;
   wire        invcpu0_sel_i2;

   wire [1:0]  inv_vec0,
		           inv_vec1;
   wire [1:0]  inv_way0_p1_i2,
		           inv_way0_p0_i2,
		           inv_way1_p1_i2,
		           inv_way1_p0_i2,
               invwd0_way_i2,
               invwd1_way_i2,
               inv0_way_i2,
               inv1_way_i2;

   wire [1:0]  asi_way_f;

   wire        word0_inv_i2,
               word1_inv_i2;

   wire        ldinv_i2,
               ldpkt_i2,
               evpkt_i2,
               stpkt_i2,
               strmack_i2,
               imissrtn_i2;

   wire        invreq_i2,
               invalidate_i2,
               invalidate_f;

   wire        invall_i2,
               invpa5_i2;
   wire         invall_evict_i2;

   wire [1:0]  cpxthrid_i2;
   wire [3:0]  dcpxthr_i2;

   wire [1:0]  ldinv_way_i2;
   wire [1:0]  w0_way_i2,
               w1_way_i2,
               w0_way_f,
               w1_way_f;

   wire        pick_wr;
   wire        icv_wrreq_i2;

   wire [3:0]  wrt_en_wd_i2,
               wrt_en_wd_bf,
               wrt_en_wd_f;

   wire [3:0]  w0_dec_way_i2,
               w1_dec_way_i2;

   wire [3:0]  dec_wrway;

   wire        icvidx_sel_wr_i2,
               icvidx_sel_ld_i2,
               icvidx_sel_inv_i2;

   wire [15:0] wren_i2;


   wire [`IC_IDX_HI:6] inv_addr_i2;
   wire [`IC_IDX_HI:5] icaddr_i2;

   wire                missaddr5_i2;
   wire                missaddr6_i2;


   wire [3:0]          ldthr,
                       ldidx_sel_new;

   wire [`IC_IDX_HI:5] ldinv_addr_i2,
                       ldindex0,
                       ldindex1,
                       ldindex2,
                       ldindex3,
                       ldindex0_nxt,
                       ldindex1_nxt,
                       ldindex2_nxt,
                       ldindex3_nxt;

   wire                clk;


//
// Code Begins Here
//
   assign              clk = rclk;

   //----------------------------------------------------------------------
   // Extract Invalidate Packet For This Core
   //----------------------------------------------------------------------

   // mux the invalidate vector down to get this processors inv vector

   // First ecode cpu id
   assign cpu_sel[0] = ~const_cpuid[2] & ~const_cpuid[1];
   assign cpu_sel[1] = ~const_cpuid[2] &  const_cpuid[1];
   assign cpu_sel[2] =  const_cpuid[2] & ~const_cpuid[1];
   assign cpu_sel[3] =  const_cpuid[2] &  const_cpuid[1];

   // 4:1 follwed by 2:1 to get 8:1, to get invalidate way selects
   assign invcpu21_sel_i2 = cpu_sel;
   assign invcpu0_sel_i2 = const_cpuid[0];

   // First do word 0 for even processors
   mux4ds #(1)  v0p0_mux(.dout  (inv_vec0[0]),
			                   .in0   (ifd_inv_ifqop_i2[1]),
			                   .in1   (ifd_inv_ifqop_i2[9]),
			                   .in2   (ifd_inv_ifqop_i2[17]),
			                   .in3   (ifd_inv_ifqop_i2[25]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   mux4ds #(2)  w0p0_mux(.dout (inv_way0_p0_i2[1:0]),
			                   .in0  (ifd_inv_ifqop_i2[3:2]),
			                   .in1  (ifd_inv_ifqop_i2[11:10]),
			                   .in2  (ifd_inv_ifqop_i2[19:18]),
			                   .in3  (ifd_inv_ifqop_i2[27:26]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   // word 0 for odd processors
   mux4ds #(1)  v0p1_mux(.dout  (inv_vec0[1]),
			                   .in0   (ifd_inv_ifqop_i2[5]),
			                   .in1   (ifd_inv_ifqop_i2[13]),
			                   .in2   (ifd_inv_ifqop_i2[21]),
			                   .in3   (ifd_inv_ifqop_i2[29]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   mux4ds #(2)  w0p1_mux(.dout (inv_way0_p1_i2[1:0]),
			                   .in0  (ifd_inv_ifqop_i2[7:6]),
			                   .in1  (ifd_inv_ifqop_i2[15:14]),
			                   .in2  (ifd_inv_ifqop_i2[23:22]),
			                   .in3  (ifd_inv_ifqop_i2[31:30]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));


   // Word 1
   // word 1 for even processors
   mux4ds #(1)  v1p0_mux(.dout  (inv_vec1[0]),
			                   .in0   (ifd_inv_ifqop_i2[57]),
			                   .in1   (ifd_inv_ifqop_i2[65]),
			                   .in2   (ifd_inv_ifqop_i2[73]),
			                   .in3   (ifd_inv_ifqop_i2[81]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   mux4ds #(2)  w1p0_mux(.dout (inv_way1_p0_i2[1:0]),
			                   .in0  (ifd_inv_ifqop_i2[59:58]),
			                   .in1  (ifd_inv_ifqop_i2[67:66]),
			                   .in2  (ifd_inv_ifqop_i2[75:74]),
			                   .in3  (ifd_inv_ifqop_i2[83:82]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   // word 1 for odd processors
   mux4ds #(1)  inv_v1p1_mux(.dout  (inv_vec1[1]),
			                       .in0   (ifd_inv_ifqop_i2[61]),
			                       .in1   (ifd_inv_ifqop_i2[69]),
			                       .in2   (ifd_inv_ifqop_i2[77]),
			                       .in3   (ifd_inv_ifqop_i2[85]),
			                       .sel0 (invcpu21_sel_i2[0]),
			                       .sel1 (invcpu21_sel_i2[1]),
			                       .sel2 (invcpu21_sel_i2[2]),
			                       .sel3 (invcpu21_sel_i2[3]));

   mux4ds #(2)  w1p1_mux(.dout (inv_way1_p1_i2[1:0]),
			                   .in0  (ifd_inv_ifqop_i2[63:62]),
			                   .in1  (ifd_inv_ifqop_i2[71:70]),
			                   .in2  (ifd_inv_ifqop_i2[79:78]),
			                   .in3  (ifd_inv_ifqop_i2[87:86]),
			                   .sel0 (invcpu21_sel_i2[0]),
			                   .sel1 (invcpu21_sel_i2[1]),
			                   .sel2 (invcpu21_sel_i2[2]),
			                   .sel3 (invcpu21_sel_i2[3]));

   // Mux odd and even values down to a single value for word0 and word1
//   dp_mux2es #(1) v0_mux (.dout (word0_inv_i2),
//			                    .in0  (inv_vec0[0]),
//			                    .in1  (inv_vec0[1]),
//			                    .sel  (invcpu0_sel_i2));
   assign word0_inv_i2 = invcpu0_sel_i2 ? inv_vec0[1] : inv_vec0[0];

//   dp_mux2es #(2) w0_mux (.dout (invwd0_way_i2[1:0]),
//			                    .in0  (inv_way0_p0_i2[1:0]),
//			                    .in1  (inv_way0_p1_i2[1:0]),
//			                    .sel  (invcpu0_sel_i2));
   assign invwd0_way_i2 = invcpu0_sel_i2 ? inv_way0_p1_i2[1:0] :
                                           inv_way0_p0_i2[1:0];

   // word1
//   dp_mux2es #(1) v1_mux (.dout (word1_inv_i2),
//			                    .in0  (inv_vec1[0]),
//			                    .in1  (inv_vec1[1]),
//			                    .sel  (invcpu0_sel_i2));
   assign word1_inv_i2 = invcpu0_sel_i2 ? inv_vec1[1] : inv_vec1[0];

//   dp_mux2es #(2) w1_mux (.dout (invwd1_way_i2[1:0]),
//			                    .in0  (inv_way1_p0_i2[1:0]),
//			                    .in1  (inv_way1_p1_i2[1:0]),
//			                    .sel  (invcpu0_sel_i2));
   assign invwd1_way_i2 = invcpu0_sel_i2 ? inv_way1_p1_i2[1:0] :
                                           inv_way1_p0_i2[1:0];

   //-----------------------------
   // Decode CPX Packet
   //-----------------------------
   // load
   assign ldpkt_i2 = ({ifd_inv_ifqop_i2[`CPX_VLD],
                       ifd_inv_ifqop_i2[`CPX_REQFIELD]} == `CPX_LDPKT) ?
                       1'b1 : 1'b0;
   assign ldinv_i2 = ldpkt_i2 & ifd_inv_ifqop_i2[`CPX_WYVLD];
   assign ldinv_way_i2= ifd_inv_ifqop_i2[`CPX_WY_HI:`CPX_WY_LO];

   // ifill
   assign imissrtn_i2 = ({ifd_inv_ifqop_i2[`CPX_VLD],
                          ifd_inv_ifqop_i2[`CPX_REQFIELD]} == `CPX_IFILLPKT) ?
                          1'b1 : 1'b0;

   // store ack
   assign stpkt_i2 = ({ifd_inv_ifqop_i2[`CPX_VLD],
                       ifd_inv_ifqop_i2[`CPX_REQFIELD]} == `CPX_STRPKT) ?
                       1'b1 : 1'b0;
   assign strmack_i2 = ({ifd_inv_ifqop_i2[`CPX_VLD],
                         ifd_inv_ifqop_i2[`CPX_REQFIELD]} == `CPX_STRMACK) ?
                         1'b1 : 1'b0;
   assign invall_i2 = stpkt_i2 & ifd_inv_ifqop_i2[`CPX_IINV] &
                      ifc_inv_ifqadv_i2;
   assign invpa5_i2 = ifd_inv_ifqop_i2[`CPX_INVPA5];

   // evict
   assign evpkt_i2 = ({ifd_inv_ifqop_i2[`CPX_VLD],
                       ifd_inv_ifqop_i2[`CPX_REQFIELD]} == `CPX_EVPKT) ?
                       1'b1 : 1'b0;
   assign invall_evict_i2 = evpkt_i2 & ifd_inv_ifqop_i2[`CPX_IINV] &
                      ifc_inv_ifqadv_i2;

   // get thread id and decode
   assign  cpxthrid_i2 = ifd_inv_ifqop_i2[`CPX_THRFIELD];

   assign  dcpxthr_i2[0] = ~cpxthrid_i2[1] & ~cpxthrid_i2[0];
   assign  dcpxthr_i2[1] = ~cpxthrid_i2[1] &  cpxthrid_i2[0];
   assign  dcpxthr_i2[2] =  cpxthrid_i2[1] & ~cpxthrid_i2[0];
   assign  dcpxthr_i2[3] =  cpxthrid_i2[1] &  cpxthrid_i2[0];

   //-----------------------------------------------
   // Generate Write Way and Write Enables
   //-----------------------------------------------

   // decode way for tags
   assign  dec_wrway[0] = ~ifd_inv_wrway_i2[1] & ~ifd_inv_wrway_i2[0];
   assign  dec_wrway[1] = ~ifd_inv_wrway_i2[1] & ifd_inv_wrway_i2[0];
   assign  dec_wrway[2] = ifd_inv_wrway_i2[1] & ~ifd_inv_wrway_i2[0];
   assign  dec_wrway[3] = ifd_inv_wrway_i2[1] & ifd_inv_wrway_i2[0];

   assign  ifq_ict_dec_wrway_bf = dec_wrway;

   // way for asi
   dff_s #(2) asiwayf_reg(.din (ifd_inv_wrway_i2),
		                    .q   (asi_way_f),
		                    .clk (clk), .se(se), .si(), .so());

   assign  ifq_erb_asiway_f = asi_way_f;


   // Select which index/way to invalidate
   assign icv_wrreq_i2 = imissrtn_i2 | ifc_inv_asireq_i2 | mbist_icache_write;

   assign inv0_way_i2 = ~ifc_inv_ifqadv_i2 ? w0_way_f :
                        ldinv_i2           ? ldinv_way_i2 :
                                             invwd0_way_i2;
   assign inv1_way_i2 = ~ifc_inv_ifqadv_i2 ? w1_way_f :
                        ldinv_i2           ? ldinv_way_i2 :
                                             invwd1_way_i2;

   assign pick_wr = (imissrtn_i2 | ifc_inv_asireq_i2) & ifc_inv_ifqadv_i2 |
                     mbist_icache_write;
   assign w0_way_i2 = pick_wr ? ifd_inv_wrway_i2 :
                                inv0_way_i2;
   assign w1_way_i2 = pick_wr ? ifd_inv_wrway_i2 :
                                inv1_way_i2;

   dff_s #(4) wrway_reg(.din ({w0_way_i2, w1_way_i2}),
                      .q   ({w0_way_f, w1_way_f}),
                      .clk (clk), .se(se), .si(), .so());

   // determine the way in the ICV we are writing to
//   mux3ds #(2) w0_waymux(.dout  (w0_way_i2),
//		                     .in0   (ifd_inv_wrway_i2[1:0]),
//		                     .in1   (invwd0_way_i2[1:0]),
//		                     .in2   (ldinv_way_i2[1:0]),
//		                     .sel0  (icvidx_sel_wr_i2),
//		                     .sel1  (icvidx_sel_inv_i2),
//		                     .sel2  (icvidx_sel_ld_i2));

//   mux3ds #(2) w1_waymux(.dout  (w1_way_i2),
//		                     .in0   (ifd_inv_wrway_i2[1:0]),
//		                     .in1   (invwd1_way_i2[1:0]),
//		                     .in2   (ldinv_way_i2[1:0]),
//		                     .sel0  (icvidx_sel_wr_i2),
//		                     .sel1  (icvidx_sel_inv_i2),
//		                     .sel2  (icvidx_sel_ld_i2));

   // decode write way
   assign w0_dec_way_i2[0] = ~w0_way_i2[1] & ~w0_way_i2[0];
   assign w0_dec_way_i2[1] = ~w0_way_i2[1] &  w0_way_i2[0];
   assign w0_dec_way_i2[2] =  w0_way_i2[1] & ~w0_way_i2[0];
   assign w0_dec_way_i2[3] =  w0_way_i2[1] &  w0_way_i2[0];

   assign w1_dec_way_i2[0] = ~w1_way_i2[1] & ~w1_way_i2[0];
   assign w1_dec_way_i2[1] = ~w1_way_i2[1] &  w1_way_i2[0];
   assign w1_dec_way_i2[2] =  w1_way_i2[1] & ~w1_way_i2[0];
   assign w1_dec_way_i2[3] =  w1_way_i2[1] &  w1_way_i2[0];


   // determine if valid bit write to top 32B, bot 32B or both
   assign wrt_en_wd_i2[0] = word0_inv_i2 & (stpkt_i2 | evpkt_i2 |strmack_i2) &
                                           ~inv_addr_i2[6] |
                          ldinv_i2 & ~ldinv_addr_i2[5] & ~ldinv_addr_i2[6] |
		                      icv_wrreq_i2 & ~missaddr5_i2 & ~missaddr6_i2;

   assign wrt_en_wd_i2[1] = word1_inv_i2 & (stpkt_i2 | evpkt_i2 |strmack_i2) &
                                           ~inv_addr_i2[6] |
			                      ldinv_i2 & ldinv_addr_i2[5] & ~ldinv_addr_i2[6] |
		                        icv_wrreq_i2 & missaddr5_i2 & ~missaddr6_i2;

   assign wrt_en_wd_i2[2] = word0_inv_i2 & (stpkt_i2 | evpkt_i2 |strmack_i2) &
                                           inv_addr_i2[6] |
                          ldinv_i2 & ~ldinv_addr_i2[5] & ldinv_addr_i2[6] |
		                      icv_wrreq_i2 & ~missaddr5_i2 & missaddr6_i2;

   assign wrt_en_wd_i2[3] = word1_inv_i2 & (stpkt_i2 | evpkt_i2 |strmack_i2) &
                                           inv_addr_i2[6] |
			                      ldinv_i2 & ldinv_addr_i2[5] & ldinv_addr_i2[6] |
		                        icv_wrreq_i2 & missaddr5_i2 & missaddr6_i2;

   assign wrt_en_wd_bf = ifc_inv_ifqadv_i2 ? wrt_en_wd_i2 :
                                              wrt_en_wd_f;
   dff_s #(4) wrten_reg(.din (wrt_en_wd_bf),
                      .q   (wrt_en_wd_f),
                      .clk (clk), .se(se), .si(), .so());


   // Final Write Enable to ICV
   assign wren_i2[3:0] = (w0_dec_way_i2 & {4{wrt_en_wd_bf[0]}}) |
                           {4{(invall_i2 | invall_evict_i2) & ~invpa5_i2 & ~inv_addr_i2[6]}};

   assign wren_i2[7:4] = (w1_dec_way_i2 & {4{wrt_en_wd_bf[1]}}) |
                           {4{(invall_i2 | invall_evict_i2) & invpa5_i2 & ~inv_addr_i2[6]}};

   assign wren_i2[11:8] = (w0_dec_way_i2 & {4{wrt_en_wd_bf[2]}}) |
                            {4{(invall_i2 | invall_evict_i2) & ~invpa5_i2 & inv_addr_i2[6]}};

   assign wren_i2[15:12] = (w1_dec_way_i2 & {4{wrt_en_wd_bf[3]}}) |
                             {4{(invall_i2 | invall_evict_i2) & invpa5_i2 & inv_addr_i2[6]}};

   assign ifq_icv_wren_bf = wren_i2;

   // advance the wr way for the ICV array
//   mux2ds #(8) wren_mux(.dout  (next_wren_i2),
//		                    .in0   (wren_f),
//		                    .in1   (wren_i2),
//		                    .sel0  (~ifc_ifd_ifqadv_i2),
//		                    .sel1  (ifc_ifd_ifqadv_i2));

//   assign wren_bf = ifc_inv_ifqadv_i2 ? wren_i2 : wren_f;
//   dff #(8) icv_weff(.din  (wren_bf),
//		                 .q    (wren_f),
//		                 .clk  (clk),
//		                 .se   (se), .si(), .so());

//   assign ifq_icv_wren_bf[7:0] = wren_bf[7:0] & {8{~icvaddr6_i2}};
//   assign ifq_icv_wren_bf[15:8] = wren_bf[7:0] & {8{icvaddr6_i2}};


   //--------------------------
   // Invalidates
   //--------------------------
   assign invalidate_i2 = (stpkt_i2 | evpkt_i2 | strmack_i2) &
			                      (word0_inv_i2 |
                             word1_inv_i2 |
			                       ifd_inv_ifqop_i2[`CPX_IINV]) |  // all ways
			                     ldinv_i2;

   mux2ds #(1) invf_mux(.dout (invreq_i2),
		                    .in0  (invalidate_f),
		                    .in1  (invalidate_i2),
		                    .sel0  (~ifc_inv_ifqadv_i2),
		                    .sel1  (ifc_inv_ifqadv_i2));

   dff_s #(1) invf_ff(.din  (invreq_i2),
		                .q    (invalidate_f),
		                .clk  (clk),
		                .se   (se), .si(), .so());

   // auto invalidate is done during bist
   // no need to qualify bist_write with ifqadv_i2 since bist is done
   // before anything else.
   assign ifq_fcl_invreq_bf = invreq_i2 | mbist_icache_write;

   // don't really need to OR with invalidate_f, since this will be
   // gone in a cycle
//   assign inv_ifc_inv_pending = invalidate_i2 | invalidate_f;
   assign inv_ifc_inv_pending = invalidate_i2;

   //---------------------------------
   // Get the ifill/invalidation index
   //---------------------------------

   // ifill index
   assign icaddr_i2[`IC_IDX_HI:5] = ifq_icd_index_bf[`IC_IDX_HI:5];
   assign missaddr5_i2 = ifq_icd_index_bf[5];
   assign missaddr6_i2 = ifq_icd_index_bf[6];

   // evict invalidate index
   //   assign    inv_addr_i2 = ifqop_i2[117:112];
   assign inv_addr_i2 = ifd_inv_ifqop_i2[`CPX_INV_IDX_HI:`CPX_INV_IDX_LO];

   // index for invalidates caused by a load
   // store dcache index when a load req is made

   assign ldthr[0] = ~lsu_ifu_ld_pcxpkt_tid[1] & ~lsu_ifu_ld_pcxpkt_tid[0];
   assign ldthr[1] = ~lsu_ifu_ld_pcxpkt_tid[1] &  lsu_ifu_ld_pcxpkt_tid[0];
   assign ldthr[2] =  lsu_ifu_ld_pcxpkt_tid[1] & ~lsu_ifu_ld_pcxpkt_tid[0];
   assign ldthr[3] =  lsu_ifu_ld_pcxpkt_tid[1] &  lsu_ifu_ld_pcxpkt_tid[0];

   assign ldidx_sel_new = ldthr & {4{lsu_ifu_ld_pcxpkt_vld}};

//   dp_mux2es  #(`IC_IDX_SZ) t0_ldidx_mux(.dout (ldindex0_nxt),
//			                                   .in0  (ldindex0),
//			                                   .in1  (lsu_ifu_ld_icache_index),
//			                                   .sel  (ldidx_sel_new[0]));
   assign ldindex0_nxt = ldidx_sel_new[0] ? lsu_ifu_ld_icache_index :
                                            ldindex0;

//   dp_mux2es  #(`IC_IDX_SZ) t1_ldidx_mux(.dout (ldindex1_nxt),
//			                                   .in0  (ldindex1),
//			                                   .in1  (lsu_ifu_ld_icache_index),
//			                                   .sel  (ldidx_sel_new[1]));
   assign ldindex1_nxt = ldidx_sel_new[1] ? lsu_ifu_ld_icache_index :
                                            ldindex1;

//   dp_mux2es  #(`IC_IDX_SZ) t2_ldidx_mux(.dout (ldindex2_nxt),
//			                                   .in0  (ldindex2),
//			                                   .in1  (lsu_ifu_ld_icache_index),
//			                                   .sel  (ldidx_sel_new[2]));
   assign ldindex2_nxt = ldidx_sel_new[2] ? lsu_ifu_ld_icache_index :
                                            ldindex2;

//   dp_mux2es  #(`IC_IDX_SZ) t3_ldidx_mux(.dout (ldindex3_nxt),
//			                                   .in0  (ldindex3),
//			                                   .in1  (lsu_ifu_ld_icache_index),
//			                                   .sel  (ldidx_sel_new[3]));
   assign ldindex3_nxt = ldidx_sel_new[3] ? lsu_ifu_ld_icache_index :
                                            ldindex3;


   dff_s #(`IC_IDX_SZ)  ldix0_reg(.din (ldindex0_nxt),
		                            .q   (ldindex0),
		                            .clk (clk), .se(se), .si(), .so());
   dff_s #(`IC_IDX_SZ)  ldix1_reg(.din (ldindex1_nxt),
		                            .q   (ldindex1),
		                            .clk (clk), .se(se), .si(), .so());
   dff_s #(`IC_IDX_SZ)  ldix2_reg(.din (ldindex2_nxt),
		                            .q   (ldindex2),
		                            .clk (clk), .se(se), .si(), .so());
   dff_s #(`IC_IDX_SZ)  ldix3_reg(.din (ldindex3_nxt),
		                            .q   (ldindex3),
		                            .clk (clk), .se(se), .si(), .so());

   // Pick dcache index corresponding to current thread
   mux4ds #(`IC_IDX_SZ) ldinv_mux(.dout (ldinv_addr_i2),
			                            .in0  (ldindex0),
			                            .in1  (ldindex1),
			                            .in2  (ldindex2),
			                            .in3  (ldindex3),
			                            .sel0 (dcpxthr_i2[0]),
			                            .sel1 (dcpxthr_i2[1]),
			                            .sel2 (dcpxthr_i2[2]),
			                            .sel3 (dcpxthr_i2[3]));

   // Final Mux for Index
   assign icvidx_sel_wr_i2 = imissrtn_i2 | ifc_inv_asireq_i2 |
                             mbist_icache_write | ~ifc_inv_ifqadv_i2;
   assign icvidx_sel_ld_i2 = ldinv_i2 & ifc_inv_ifqadv_i2;
   assign icvidx_sel_inv_i2 = ~imissrtn_i2 & ~ldinv_i2 &
                              ~ifc_inv_asireq_i2 & ifc_inv_ifqadv_i2 &
                              ~mbist_icache_write;

   mux3ds #(`IC_IDX_SZ) icv_idx_mux(
                            .dout  (ifq_icv_wrindex_bf[`IC_IDX_HI:5]),
			                      .in0   (icaddr_i2[`IC_IDX_HI:5]),
			                      .in1   ({inv_addr_i2[`IC_IDX_HI:6], 1'b0}),
			                      .in2   (ldinv_addr_i2[`IC_IDX_HI:5]),
			                      .sel0  (icvidx_sel_wr_i2),
			                      .sel1  (icvidx_sel_inv_i2),
			                      .sel2  (icvidx_sel_ld_i2));

   sink #(`CPX_WIDTH) s0(.in (ifd_inv_ifqop_i2));


endmodule // sparc_ifu_invctl
