// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: lsu_qdp1.v
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
//  Description:  LSU PCX Datapath - QDP1
*/
////////////////////////////////////////////////////////////////////////
// header file includes
////////////////////////////////////////////////////////////////////////
`include  "sys.h" // system level definition file which contains the
          // time scale definition
`include  "iop.h"
`include  "lsu.tmp.h"
`include "ifu.tmp.h"

////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module lsu_qdp1 ( /*AUTOARG*/
   // Outputs
  `ifndef NO_RTL_CSM
  spc_pcx_csm_pa,
  `endif

   so, lsu_va_match_b47_b32_m, lsu_va_match_b31_b3_m, lsu_va_wtchpt_addr, spc_pcx_data_pa,
   dtag_wdata_m, dtag_wdata_e, lmq0_byp_misc_sz, lmq1_byp_misc_sz,
   lmq2_byp_misc_sz, lmq3_byp_misc_sz, lsu_byp_misc_sz_e,
   lsu_l2fill_sign_extend_m, lsu_l2fill_bendian_m, lmq0_l2fill_fpld,
   lmq1_l2fill_fpld, lmq2_l2fill_fpld, lmq3_l2fill_fpld, lmq_ld_rd1,
   lmq0_ncache_ld, lmq1_ncache_ld, lmq2_ncache_ld, lmq3_ncache_ld,
   lmq0_ld_rq_type, lmq1_ld_rq_type, lmq2_ld_rq_type,
   lmq3_ld_rq_type, lmq0_ldd_vld, lmq1_ldd_vld, lmq2_ldd_vld,
   lmq3_ldd_vld, ld_sec_hit_thrd0, ld_sec_hit_thrd1,
   ld_sec_hit_thrd2, ld_sec_hit_thrd3, lmq0_pcx_pkt_addr,
   lmq1_pcx_pkt_addr, lmq2_pcx_pkt_addr, lmq3_pcx_pkt_addr,
   lsu_mmu_rs3_data_g, lsu_tlu_rs3_data_g, lsu_diagnstc_wr_data_b0,
   lsu_diagnstc_wr_data_e, lsu_ifu_stxa_data,
   lsu_ifu_ld_icache_index, lsu_ifu_ld_pcxpkt_tid, lsu_error_pa_m,
   lsu_pref_pcx_req, st_rs3_data_g, lsu_ldst_va_way_g,
   dcache_alt_data_w0_m,
   // Inputs
  `ifndef NO_RTL_CSM
  tlb_rd_tte_csm, stb_rcsm_ramc, ifu_pcx_csm,
  `endif

   rclk, si, se, lsu_dcache_iob_rd_w, lsu_ramtest_rd_w,
   lsu_pcx_rq_sz_b3, lsu_diagnstc_data_sel, pcx_pkt_src_sel,
   lsu_stb_pcx_rvld_d1, imiss_pcx_mx_sel, fwd_int_fp_pcx_mx_sel,
   spu_lsu_ldst_pckt, tlu_lsu_pcxpkt, const_cpuid, ifu_pcx_pkt,
   lmq_byp_data_en_w2, lmq_byp_data_sel0, lmq_byp_data_sel1,
   lmq_byp_data_sel2, lmq_byp_data_sel3, lmq_byp_ldxa_sel0,
   lmq_byp_ldxa_sel1, lmq_byp_ldxa_sel2, lmq_byp_ldxa_sel3,
   lmq_byp_data_fmx_sel, exu_lsu_rs3_data_e, ifu_lsu_ldxa_data_w2,
   tlu_lsu_int_ldxa_data_w2, spu_lsu_ldxa_data_w2, stb_rdata_ramd,
   stb_rdata_ramc, lmq_byp_misc_sel, dfq_byp_sel, ld_pcx_rq_sel,
   ld_pcx_thrd, lmq_enable, ld_pcx_pkt_g, ffu_lsu_data,
   lsu_tlb_st_sel_m, lsu_pcx_fwd_pkt, lsu_pcx_fwd_reply,
   lsu_diagnstc_dtagv_prty_invrt_e, lsu_misc_rdata_w2,
   lsu_stb_rd_tid, lsu_iobrdge_rply_data_sel, lsu_iobrdge_rd_data,
   lsu_atomic_pkt2_bsel_g, lsu_pcx_ld_dtag_perror_w2,
   lsu_dcache_rdata_w, lsu_va_wtchpt0_wr_en_l,
   lsu_va_wtchpt1_wr_en_l, lsu_va_wtchpt2_wr_en_l,
   lsu_va_wtchpt3_wr_en_l, thread0_m, thread1_m, thread2_m,
   thread3_m, lsu_thread_g, lsu_ldst_va_m, tlb_pgnum, lsu_bld_pcx_rq,
   lsu_bld_rq_addr, lmq0_pcx_pkt_way, lmq1_pcx_pkt_way,
   lmq2_pcx_pkt_way, lmq3_pcx_pkt_way, lsu_dfq_ld_vld,
   lsu_ifu_asi_data_en_l, lsu_ld0_spec_vld_kill_w2,
   lsu_ld1_spec_vld_kill_w2, lsu_ld2_spec_vld_kill_w2,
   lsu_ld3_spec_vld_kill_w2, lsu_fwd_rply_sz1_unc, rst_tri_en,
   lsu_l2fill_data, l2fill_vld_m, ld_thrd_byp_sel_m, sehold,
   cfg_asi_lsu_ldxa_vld_w2, cfg_asi_lsu_ldxa_data_w2
   ) ;

input                     rclk ;
input                     si;
input                     se;
input       sehold;
//input       tmb_l;

output                    so;
input         lsu_dcache_iob_rd_w ;
input         lsu_ramtest_rd_w ;

input      lsu_pcx_rq_sz_b3 ;

input  [3:0]        lsu_diagnstc_data_sel ;

input   [3:0]             pcx_pkt_src_sel ;       // sel 1/4 pkt src for pcx.
input                     lsu_stb_pcx_rvld_d1 ;   // stb has been read-delayby1cycle
input                     imiss_pcx_mx_sel ;      // select imiss over spu.
input   [2:0]             fwd_int_fp_pcx_mx_sel ; // select fwd/intrpt/fpop

input   [`PCX_WIDTH-1:0]  spu_lsu_ldst_pckt ;     // stream ld/st pkt for pcx.
input   [25:0]            tlu_lsu_pcxpkt ;        // truncated pcx interrupt pkt.
input   [2:0]             const_cpuid ;           // cpu id
input   [51:0]            ifu_pcx_pkt ;           // ifu imiss request.
input   [3:0]             lmq_byp_data_en_w2 ;
input   [3:0]             lmq_byp_data_sel0 ;     // ldxa/stb/cas bypass data sel.
input   [3:0]             lmq_byp_data_sel1 ;     // ldxa/stb/cas bypass data sel.
input   [3:0]             lmq_byp_data_sel2 ;     // ldxa/stb/cas bypass data sel.
input   [3:0]             lmq_byp_data_sel3 ;     // ldxa/stb/cas bypass data sel.
input   [2:0]             lmq_byp_ldxa_sel0 ;     // ldxa data sel - thread0
input   [2:0]             lmq_byp_ldxa_sel1 ;     // ldxa data sel - thread1
input   [2:0]             lmq_byp_ldxa_sel2 ;     // ldxa data sel - thread2
input   [2:0]             lmq_byp_ldxa_sel3 ;     // ldxa data sel - thread3
input [3:0]     lmq_byp_data_fmx_sel ;  // final sel for lmq data.
input   [63:0]            exu_lsu_rs3_data_e ;    // rs3_data for cas pkt 2.
input   [63:0]            ifu_lsu_ldxa_data_w2 ;  // ldxa data from ifu.
//input   [63:0]            tlu_lsu_ldxa_data_w2 ;  // ldxa data from tlu (mmu)
input   [63:0]            tlu_lsu_int_ldxa_data_w2 ;  // ldxa data from tlu (intrpt/scpd)
input   [63:0]            spu_lsu_ldxa_data_w2 ;  // ldxa data from spu
input   [76:0]            stb_rdata_ramd ;        // stb0 data ram output.
input   [44:9]            stb_rdata_ramc ;        // stb0 tag ram output.
input   [3:0]             lmq_byp_misc_sel ;      // select g-stage lmq source
input   [3:0]             dfq_byp_sel ;
input   [3:0]             ld_pcx_rq_sel ;
input   [1:0]             ld_pcx_thrd ;

input   [3:0]             lmq_enable ;             // 4 enables for lmq.
input   [`LMQ_WIDTH-1:40]  ld_pcx_pkt_g ;           // ld miss pkt for thread.
input   [80:0]            ffu_lsu_data ;
input   [3:0]             lsu_tlb_st_sel_m ;
//input   [3:0]             lsu_tlb_st_sel_g ;
//input                     lsu_tlb_st_vld_g ;
input   [107:0]           lsu_pcx_fwd_pkt ;         // local fwd reply/req
input                     lsu_pcx_fwd_reply ;       // fwd reply on pcx pkt
input                     lsu_diagnstc_dtagv_prty_invrt_e ;
//input                     lsu_diagnstc_wr_src_sel_e ;// dcache/dtag/v write - diag
//input   [47:0]            lsu_local_ldxa_data_w2 ;   // local ldxa data
input   [63:0]            lsu_misc_rdata_w2 ;   // local ldxa data
input   [1:0]             lsu_stb_rd_tid ;           // thread for which stb rd occurs
input   [2:0]             lsu_iobrdge_rply_data_sel ;
input   [43:0]            lsu_iobrdge_rd_data ;
input   [2:0]             lsu_atomic_pkt2_bsel_g ;
input                     lsu_pcx_ld_dtag_perror_w2 ;
input [63:0]      lsu_dcache_rdata_w ;
//input   [47:0]            tlu_lsu_iobrdge_pc_data ;  // NOTE: unused: remove this in sync w/ tlu

input         lsu_va_wtchpt0_wr_en_l;
input         lsu_va_wtchpt1_wr_en_l;
input         lsu_va_wtchpt2_wr_en_l;
input         lsu_va_wtchpt3_wr_en_l;
input         thread0_m;
input         thread1_m;
input         thread2_m;
input         thread3_m;

   input [3:0] lsu_thread_g;


//input         lsu_pa_wtchpt_wr_en_l;
input [47:0]  lsu_ldst_va_m;
input [39:13] tlb_pgnum;
input         lsu_bld_pcx_rq ;        // cycle after request
input [1:0]   lsu_bld_rq_addr ;       // cycle after request

//input  [1:0]           lsu_lmq_pkt_way_g;
input  [`L1D_WAY_MASK]           lmq0_pcx_pkt_way;
input  [`L1D_WAY_MASK]           lmq1_pcx_pkt_way;
input  [`L1D_WAY_MASK]           lmq2_pcx_pkt_way;
input  [`L1D_WAY_MASK]           lmq3_pcx_pkt_way;

input           lsu_dfq_ld_vld ;
input   lsu_ifu_asi_data_en_l ;

input           lsu_ld0_spec_vld_kill_w2 ;
input           lsu_ld1_spec_vld_kill_w2 ;
input           lsu_ld2_spec_vld_kill_w2 ;
input           lsu_ld3_spec_vld_kill_w2 ;

input   lsu_fwd_rply_sz1_unc ;

input           rst_tri_en ;


`ifndef NO_RTL_CSM
input  [`TLB_CSM]   tlb_rd_tte_csm;
input  [`TLB_CSM]   stb_rcsm_ramc;
input  [`TLB_CSM]   ifu_pcx_csm;

output [`TLB_CSM]   spc_pcx_csm_pa;
`endif

//extra asi
input         cfg_asi_lsu_ldxa_vld_w2;
input [63:0]  cfg_asi_lsu_ldxa_data_w2;

output        lsu_va_match_b47_b32_m;
output        lsu_va_match_b31_b3_m;

//output        lsu_pa_match_b39_13_g;
//output        lsu_pa_match_b12_3_m;
output [47:3] lsu_va_wtchpt_addr;
//output [39:3] lsu_pa_wtchpt_addr;

//output  [63:0]            ld_stb_bypass_data ;  // st to load bypass data.

output  [`PCX_WIDTH-1:0]  spc_pcx_data_pa ;
output  [29:0]            dtag_wdata_m ;            // tag to write to dtag.
output  [29:0]            dtag_wdata_e ;            // tag to write to dtag.
//output  [3:0]             lsu_byp_misc_addr_m ;     // lower 3bits of addr for ldxa/raw etc
//output  [1:0]             lsu_byp_misc_sz_m ;       // size for ldxa/raw etc
output  [1:0]             lmq0_byp_misc_sz ;
output  [1:0]             lmq1_byp_misc_sz ;
output  [1:0]             lmq2_byp_misc_sz ;
output  [1:0]             lmq3_byp_misc_sz ;

output  [1:0]             lsu_byp_misc_sz_e ;       // size for ldxa/raw etc
output                    lsu_l2fill_sign_extend_m ;// requires sign-extend else zero extend
output                    lsu_l2fill_bendian_m ;    // big endian fill/bypass.
//output                    lsu_l2fill_fpld_e ;       // fp load
output                    lmq0_l2fill_fpld ;       // fp load
output                    lmq1_l2fill_fpld ;       // fp load
output                    lmq2_l2fill_fpld ;       // fp load
output                    lmq3_l2fill_fpld ;       // fp load

output  [4:0]             lmq_ld_rd1 ;              // rd for all loads
//output                    lsu_ncache_ld_e ;         // non-cacheable ld from dfq
output                    lmq0_ncache_ld ;         // non-cacheable ld from dfq
output                    lmq1_ncache_ld ;         // non-cacheable ld from dfq
output                    lmq2_ncache_ld ;         // non-cacheable ld from dfq
output                    lmq3_ncache_ld ;         // non-cacheable ld from dfq
//output  [2:0]             lsu_ld_rq_type_e ;        // for identifying atomic ld.

output  [2:0]             lmq0_ld_rq_type ;        // for identifying atomic ld.
output  [2:0]             lmq1_ld_rq_type ;        // for identifying atomic ld.
output  [2:0]             lmq2_ld_rq_type ;        // for identifying atomic ld.
output  [2:0]             lmq3_ld_rq_type ;        // for identifying atomic ld.

output                    lmq0_ldd_vld ;             // ld double
output                    lmq1_ldd_vld ;             // ld double
output                    lmq2_ldd_vld ;             // ld double
output                    lmq3_ldd_vld ;             // ld double

output                    ld_sec_hit_thrd0 ;        // ld has sec. hit against th0
output                    ld_sec_hit_thrd1 ;        // ld has sec. hit against th1
output                    ld_sec_hit_thrd2 ;        // ld has sec. hit against th2
output                    ld_sec_hit_thrd3 ;        // ld has sec. hit against th3
//output  [1:0]             lmq_pcx_pkt_sz ;
//output  [39:0]            lmq_pcx_pkt_addr ;
output  [`L1D_ADDRESS_HI:0]            lmq0_pcx_pkt_addr;
output  [`L1D_ADDRESS_HI:0]            lmq1_pcx_pkt_addr;
output  [`L1D_ADDRESS_HI:0]            lmq2_pcx_pkt_addr;
output  [`L1D_ADDRESS_HI:0]            lmq3_pcx_pkt_addr;

//output  [63:0]            lsu_tlu_st_rs3_data_g ;
output  [63:0]            lsu_mmu_rs3_data_g ;
output  [63:0]            lsu_tlu_rs3_data_g ;

output                    lsu_diagnstc_wr_data_b0 ; // diagnostic wr data - bit 0
output  [63:0]            lsu_diagnstc_wr_data_e ;

output  [47:0]            lsu_ifu_stxa_data ;       // stxa related data

output  [`IC_IDX_HI:5]            lsu_ifu_ld_icache_index ;
output  [1:0]             lsu_ifu_ld_pcxpkt_tid ;

//output  [1:0]             lmq_ld_way ;              // cache set way for ld fill

output  [28:0]            lsu_error_pa_m ;          // error phy addr
//output  [13:0]            lsu_spu_rsrv_data_m ;     // rs3 data for reserved fields.
output                    lsu_pref_pcx_req ;        // pref sent to pcx

   output [63:0]          st_rs3_data_g;

output  [1:0]             lsu_ldst_va_way_g ;          // 12:11 for direct map
//====================================================================
//dc_fill CP

   input [63:0]           lsu_l2fill_data; //from qdp2
   input                  l2fill_vld_m;    //from dctl
   input   [3:0]          ld_thrd_byp_sel_m;//from dctl

   output [63:0]          dcache_alt_data_w0_m;  //to d$
//   output [7:0]           lsu_l2fill_or_byp_msb_m;   //to dctl
//====================================================================


wire  [`STB_PCX_WIDTH-1:0]  store_pcx_pkt ;
wire  [`PCX_WIDTH-1:0]  pcx_pkt_data ;
wire  [`STB_PCX_WIDTH-1:0]  stb_pcx_pkt ;
wire  [`PCX_WIDTH-1:0]  imiss_strm_pcx_pkt ;
wire  [`PCX_WIDTH-1:0]  intrpt_full_pcxpkt ;
wire  [`PCX_WIDTH-1:0]  ifu_full_pcx_pkt_e ;
wire  [51:0]      ifu_pcx_pkt_e ;
wire  [63:0]      cas_pkt2_data ;
wire  [63:0]      lmq0_bypass_data_in,lmq1_bypass_data_in ;
wire  [63:0]      lmq2_bypass_data_in,lmq3_bypass_data_in ;
wire  [63:0]      lmq0_bypass_data, lmq1_bypass_data ;
wire  [63:0]      lmq2_bypass_data, lmq3_bypass_data ;
wire  [39:0]      lmq_ld_addr ;
wire  [`LMQ_WIDTH:0]    load_pcx_pkt ;
wire  [`LMQ_WIDTH-1:0]  lmq0_pcx_pkt, lmq1_pcx_pkt ;
wire  [`LMQ_WIDTH-1:0]  lmq2_pcx_pkt, lmq3_pcx_pkt ;
wire  [`PCX_WIDTH-1:0]  fpop_full_pcxpkt ;
wire  [63:0]      tlb_st_data ;
//wire    [63:0]      formatted_tte_tag ;
//wire    [63:0]      formatted_tte_data ;
wire  [63:0]      lmq0_bypass_ldxa_data ;
wire  [63:0]      lmq1_bypass_ldxa_data ;
wire  [63:0]      lmq2_bypass_ldxa_data ;
wire  [63:0]      lmq3_bypass_ldxa_data ;
wire  [`PCX_WIDTH-1:0]  fwd_full_pcxpkt ;
wire  [47:3]            lsu_tlu_st_rs3_data_g ;


`ifndef NO_RTL_CSM
wire [`TLB_CSM] lmq0_pcx_csm;
wire [`TLB_CSM] lmq1_pcx_csm;
wire [`TLB_CSM] lmq2_pcx_csm;
wire [`TLB_CSM] lmq3_pcx_csm;
wire [`TLB_CSM] load_pcx_csm;
wire [`TLB_CSM] stb_pcx_csm;
wire [`TLB_CSM] pcx_pkt_csm;
`endif

//===================================================
//  clock buffer
//===================================================
//wire   lsu_qdp1_clk ;
wire   clk;
assign  clk = rclk;

wire         thread0_g;
wire         thread1_g;
wire         thread2_g;
wire         thread3_g;

   assign    thread0_g = lsu_thread_g[0];
   assign    thread1_g = lsu_thread_g[1];
   assign    thread2_g = lsu_thread_g[2];
   assign    thread3_g = lsu_thread_g[3];

//=================================================================================================
//    LMQ DP
//=================================================================================================

wire  [12:0]  ldst_va_g;

dff_s  #(13) ff_ldst_va_g (
        .din    (lsu_ldst_va_m[12:0]),
        .q      (ldst_va_g[12:0]),
        .clk    (clk),
        .se     (1'b0),       .si (),          .so ()
        );

assign  lsu_ldst_va_way_g[1:0] =  ldst_va_g[12:11];

`ifndef NO_RTL_CSM
wire [`TLB_CSM] ld_pcx_csm_g_tmp;
assign ld_pcx_csm_g_tmp = tlb_rd_tte_csm;

`endif

wire  [`LMQ_VLD:0]  ld_pcx_pkt_g_tmp;

assign ld_pcx_pkt_g_tmp[`LMQ_VLD:0] =  {ld_pcx_pkt_g[`LMQ_WIDTH-1:44],
                                        2'b00,      // done after the flop
                                        //lsu_lmq_pkt_way_g[1:0],
                                        ld_pcx_pkt_g[41:40],
                                        tlb_pgnum[39:13],ldst_va_g[12:0]};

// Unfortunately ld_pcx_pkt_g is now 65 bits wide. Grape-mapper needs to give feedback.
// THREAD 0.
/*
dffe_s  #(`LMQ_WIDTH) lmq0 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq0_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[0]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq0_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq0_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[0]),
                .tmb_l  (~se),
                .clk    (lmq0_clk)
                ) ;
`endif
wire  [`LMQ_VLD:0]  lmq0_pcx_pkt_tmp ;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq0 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq0_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm0 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq0_pcx_csm),
        .en (~(~lmq_enable[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif

`else
dff_s  #(`LMQ_WIDTH) lmq0 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq0_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq0_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm0 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq0_pcx_csm),
        .clk    (lmq0_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif



`endif



//bug2705 - speculative pick in w-cycle
wire    lmq0_pcx_pkt_vld ;
assign  lmq0_pcx_pkt_vld  =  lmq0_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld0_spec_vld_kill_w2 ;

wire [1:0] lmq0_pcx_pkt_way_trin = lmq0_pcx_pkt_way; // trin reconfig: this format prevents way > 4

assign  lmq0_pcx_pkt[`LMQ_VLD:0]  = {lmq0_pcx_pkt_vld,
                                     lmq0_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                     lmq0_pcx_pkt_way_trin, 
                                     lmq0_pcx_pkt_tmp[41:0]};

// Needs to be multi-threaded.
//assign lmq_pcx_pkt_sz[1:0] = lmq0_pcx_pkt[`LMQ_SZ_HI:`LMQ_SZ_LO]  ;

assign  ld_sec_hit_thrd0 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

 // THREAD 1.
/*
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq1_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq1_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[1]),
                .tmb_l  (~se),
                .clk    (lmq1_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq1_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif

`else
dff_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`endif

//bug2705 - speculative pick in w-cycle
wire    lmq1_pcx_pkt_vld ;
assign  lmq1_pcx_pkt_vld  =  lmq1_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld1_spec_vld_kill_w2 ;

wire [1:0] lmq1_pcx_pkt_way_trin = lmq1_pcx_pkt_way; // trin reconfig: this format prevents way > 4

assign  lmq1_pcx_pkt[`LMQ_VLD:0]  =  {lmq1_pcx_pkt_vld,
                                      lmq1_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq1_pcx_pkt_way_trin[1:0],
                                      lmq1_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd1 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// Select 1 of 2 LMQ Contents.
// selection is based on which thread's load is chosen for pcx.
mux2ds  #(`LMQ_WIDTH) lmq_pthrd_sel (
  .in0  (lmq0_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in1  (lmq1_pcx_pkt[`LMQ_WIDTH-1:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (load_pcx_pkt[`LMQ_WIDTH-1:0])
);

`ifndef NO_RTL_CSM
mux2ds  #(`TLB_CSM_WIDTH) lmq_csm_pthrd_sel (
  .in0  (lmq0_pcx_csm),
  .in1  (lmq1_pcx_csm),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (load_pcx_csm)
);
`endif
  

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
  assign load_pcx_pkt[`LMQ_WIDTH-1:0] = lmq0_pcx_pkt[`LMQ_WIDTH-1:0];

`ifndef NO_RTL_CSM
  assign load_pcx_csm = lmq0_pcx_csm;
`endif

`elsif THREADS_1

  assign load_pcx_pkt[`LMQ_WIDTH-1:0] = lmq0_pcx_pkt[`LMQ_WIDTH-1:0];

`ifndef NO_RTL_CSM
  assign load_pcx_csm = lmq0_pcx_csm;
`endif

`elsif THREADS_2

// THREAD 1.
/*
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq1_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq1_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[1]),
                .tmb_l  (~se),
                .clk    (lmq1_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq1_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif

`else
dff_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`endif

//bug2705 - speculative pick in w-cycle
wire    lmq1_pcx_pkt_vld ;
assign  lmq1_pcx_pkt_vld  =  lmq1_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld1_spec_vld_kill_w2 ;

assign  lmq1_pcx_pkt[`LMQ_VLD:0]  =  {lmq1_pcx_pkt_vld,
                                      lmq1_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq1_pcx_pkt_way[1:0],
                                      lmq1_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd1 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// Select 1 of 2 LMQ Contents.
// selection is based on which thread's load is chosen for pcx.
mux2ds  #(`LMQ_WIDTH) lmq_pthrd_sel (
  .in0  (lmq0_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in1  (lmq1_pcx_pkt[`LMQ_WIDTH-1:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (load_pcx_pkt[`LMQ_WIDTH-1:0])
);

`ifndef NO_RTL_CSM
mux2ds  #(`TLB_CSM_WIDTH) lmq_csm_pthrd_sel (
  .in0  (lmq0_pcx_csm),
  .in1  (lmq1_pcx_csm),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (load_pcx_csm)
);
`endif

`elsif THREADS_3

// THREAD 1.
/*
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq1_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq1_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[1]),
                .tmb_l  (~se),
                .clk    (lmq1_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq1_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif

`else
dff_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`endif

//bug2705 - speculative pick in w-cycle
wire    lmq1_pcx_pkt_vld ;
assign  lmq1_pcx_pkt_vld  =  lmq1_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld1_spec_vld_kill_w2 ;

assign  lmq1_pcx_pkt[`LMQ_VLD:0]  =  {lmq1_pcx_pkt_vld,
                                      lmq1_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq1_pcx_pkt_way[1:0],
                                      lmq1_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd1 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// THREAD 2.
/*
dffe_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[2]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq2_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq2_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[2]),
                .tmb_l  (~se),
                .clk    (lmq2_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq2_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`LMQ_WIDTH) lmq_csm2 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq2_pcx_csm),
        .en (~(~lmq_enable[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`else
dff_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq2_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dff_s  #(`LMQ_WIDTH) lmq_csm2 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq2_pcx_csm),
        .clk    (lmq2_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`endif

//bug2705 - speculative pick in w-cycle
wire    lmq2_pcx_pkt_vld ;
assign  lmq2_pcx_pkt_vld  =  lmq2_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld2_spec_vld_kill_w2 ;


assign  lmq2_pcx_pkt[`LMQ_VLD:0]  =  {lmq2_pcx_pkt_vld,
                                      lmq2_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq2_pcx_pkt_way[1:0],
                                      lmq2_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd2 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq2_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// Select 1 of 3 LMQ Contents.
// selection is based on which thread's load is chosen for pcx.
mux3ds  #(`LMQ_WIDTH) lmq_pthrd_sel (
  .in0  (lmq0_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in1  (lmq1_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in2  (lmq2_pcx_pkt[`LMQ_WIDTH-1:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .dout (load_pcx_pkt[`LMQ_WIDTH-1:0])
);
`ifndef NO_RTL_CSM
mux3ds  #(`TLB_CSM_WIDTH) lmq_csm_pthrd_sel (
  .in0  (lmq0_pcx_csm),
  .in1  (lmq1_pcx_csm),
  .in2  (lmq2_pcx_csm),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .dout (load_pcx_csm)
);

`endif

`else
// THREAD 1.
/*
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq1_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq1_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[1]),
                .tmb_l  (~se),
                .clk    (lmq1_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq1_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .en (~(~lmq_enable[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`else
dff_s  #(`LMQ_WIDTH) lmq1 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq1_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm1 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq1_pcx_csm),
        .clk    (lmq1_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`endif

//bug2705 - speculative pick in w-cycle
wire    lmq1_pcx_pkt_vld ;
assign  lmq1_pcx_pkt_vld  =  lmq1_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld1_spec_vld_kill_w2 ;

assign  lmq1_pcx_pkt[`LMQ_VLD:0]  =  {lmq1_pcx_pkt_vld,
                                      lmq1_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq1_pcx_pkt_way[1:0],
                                      lmq1_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd1 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// THREAD 2.
/*
dffe_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[2]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq2_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq2_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[2]),
                .tmb_l  (~se),
                .clk    (lmq2_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq2_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm2 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq2_pcx_csm),
        .en (~(~lmq_enable[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`else
dff_s  #(`LMQ_WIDTH) lmq2 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq2_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq2_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm2 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq2_pcx_csm),
        .clk    (lmq2_clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`endif

//bug2705 - speculative pick in w-cycle
wire    lmq2_pcx_pkt_vld ;
assign  lmq2_pcx_pkt_vld  =  lmq2_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld2_spec_vld_kill_w2 ;


assign  lmq2_pcx_pkt[`LMQ_VLD:0]  =  {lmq2_pcx_pkt_vld,
                                      lmq2_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq2_pcx_pkt_way[1:0],
                                      lmq2_pcx_pkt_tmp[41:0]};

assign  ld_sec_hit_thrd2 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq2_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// THREAD 3.
/*
dffe_s  #(`LMQ_WIDTH) lmq3 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq3_pcx_pkt[`LMQ_VLD:0]),
        .en     (lmq_enable[3]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire lmq3_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf lmq3_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_enable[3]),
                .tmb_l  (~se),
                .clk    (lmq3_clk)
                ) ;
`endif

wire  [`LMQ_VLD:0]  lmq3_pcx_pkt_tmp;

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(`LMQ_WIDTH) lmq3 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq3_pcx_pkt_tmp[`LMQ_VLD:0]),
        .en (~(~lmq_enable[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dffe_s  #(`TLB_CSM_WIDTH) lmq_csm3 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq3_pcx_csm),
        .en (~(~lmq_enable[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );

`endif
`else
dff_s  #(`LMQ_WIDTH) lmq3 (
        .din    (ld_pcx_pkt_g_tmp[`LMQ_VLD:0]),
        .q      (lmq3_pcx_pkt_tmp[`LMQ_VLD:0]),
        .clk    (lmq3_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`ifndef NO_RTL_CSM
dff_s  #(`TLB_CSM_WIDTH) lmq_csm3 (
        .din    (ld_pcx_csm_g_tmp),
        .q      (lmq3_pcx_csm),
        .clk    (lmq3_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif
`endif

//bug2705 - speculative pick in w-cycle
wire    lmq3_pcx_pkt_vld ;
assign  lmq3_pcx_pkt_vld  =  lmq3_pcx_pkt_tmp[`LMQ_VLD] & ~lsu_ld3_spec_vld_kill_w2 ;


assign  lmq3_pcx_pkt[`LMQ_VLD:0]  =  {lmq3_pcx_pkt_vld,
                                      lmq3_pcx_pkt_tmp[`LMQ_VLD-1:44],
                                      lmq3_pcx_pkt_way[1:0],
                                      lmq3_pcx_pkt_tmp[41:0]};


assign  ld_sec_hit_thrd3 =
(ld_pcx_pkt_g_tmp[`LMQ_AD_HI:`LMQ_AD_LO+4] == lmq3_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO+4]) ;

// Select 1 of 4 LMQ Contents.
// selection is based on which thread's load is chosen for pcx.
mux4ds  #(`LMQ_WIDTH) lmq_pthrd_sel (
  .in0  (lmq0_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in1  (lmq1_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in2  (lmq2_pcx_pkt[`LMQ_WIDTH-1:0]),
  .in3  (lmq3_pcx_pkt[`LMQ_WIDTH-1:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .sel3   (ld_pcx_rq_sel[3]),
  .dout (load_pcx_pkt[`LMQ_WIDTH-1:0])
);
`ifndef NO_RTL_CSM
mux4ds  #(`TLB_CSM_WIDTH) lmq_csm_pthrd_sel (
  .in0  (lmq0_pcx_csm),
  .in1  (lmq1_pcx_csm),
  .in2  (lmq2_pcx_csm),
  .in3  (lmq3_pcx_csm),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .sel3   (ld_pcx_rq_sel[3]),
  .dout (load_pcx_csm)
);

`endif // `ifndef CONFIG_NUM_THREADS


`endif

`endif

assign  lsu_pref_pcx_req = load_pcx_pkt[`LMQ_PREF] ;

// Choose data to src for fill/bypass.
// E-stage muxing : required for fills specifically.

   assign lmq0_ldd_vld =   lmq0_pcx_pkt[`LMQ_RD2_VLD];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign lmq1_ldd_vld =   lmq1_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq2_ldd_vld =   1'b0;
   assign lmq3_ldd_vld =   1'b0;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign lmq1_ldd_vld =   1'b0;
   assign lmq2_ldd_vld =   1'b0;
   assign lmq3_ldd_vld =   1'b0;

`elsif THREADS_1

   assign lmq1_ldd_vld =   1'b0;
   assign lmq2_ldd_vld =   1'b0;
   assign lmq3_ldd_vld =   1'b0;

`elsif THREADS_2

   assign lmq1_ldd_vld =   lmq1_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq2_ldd_vld =   1'b0;
   assign lmq3_ldd_vld =   1'b0;

`elsif THREADS_3

   assign lmq1_ldd_vld =   lmq1_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq2_ldd_vld =   lmq2_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq3_ldd_vld =   1'b0;

`else
   assign lmq1_ldd_vld =   lmq1_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq2_ldd_vld =   lmq2_pcx_pkt[`LMQ_RD2_VLD];
   assign lmq3_ldd_vld =   lmq3_pcx_pkt[`LMQ_RD2_VLD];
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   assign lmq0_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq0_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq1_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};

`elsif THREADS_1

   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};

`elsif THREADS_2

   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq1_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};

`elsif THREADS_3

   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq1_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq2_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  {`L1D_ADDRESS_HI+1{1'b0}};

`else
   assign lmq1_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq1_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq2_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq2_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
   assign lmq3_pcx_pkt_addr[`L1D_ADDRESS_HI:0] =  lmq3_pcx_pkt[`LMQ_AD_LO + `L1D_ADDRESS_HI :`LMQ_AD_LO];
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   assign lmq0_ld_rq_type[2:0] = lmq0_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign lmq1_ld_rq_type[2:0] = lmq1_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq2_ld_rq_type[2:0] = 3'b0;
   assign lmq3_ld_rq_type[2:0] = 3'b0;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign lmq1_ld_rq_type[2:0] = 3'b0;
   assign lmq2_ld_rq_type[2:0] = 3'b0;
   assign lmq3_ld_rq_type[2:0] = 3'b0;

`elsif THREADS_1

   assign lmq1_ld_rq_type[2:0] = 3'b0;
   assign lmq2_ld_rq_type[2:0] = 3'b0;
   assign lmq3_ld_rq_type[2:0] = 3'b0;

`elsif THREADS_2

   assign lmq1_ld_rq_type[2:0] = lmq1_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq2_ld_rq_type[2:0] = 3'b0;
   assign lmq3_ld_rq_type[2:0] = 3'b0;

`elsif THREADS_3

   assign lmq1_ld_rq_type[2:0] = lmq1_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq2_ld_rq_type[2:0] = lmq2_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq3_ld_rq_type[2:0] = 3'b0;

`else
   assign lmq1_ld_rq_type[2:0] = lmq1_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq2_ld_rq_type[2:0] = lmq2_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
   assign lmq3_ld_rq_type[2:0] = lmq3_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];
`endif

`endif // `ifndef CONFIG_NUM_THREADS

    assign lmq0_l2fill_fpld =  lmq0_pcx_pkt[`LMQ_FPLD];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

    assign lmq1_l2fill_fpld =  lmq1_pcx_pkt[`LMQ_FPLD];
    assign lmq2_l2fill_fpld =  1'b0;
    assign lmq3_l2fill_fpld =  1'b0;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
    assign lmq1_l2fill_fpld =  1'b0;
    assign lmq2_l2fill_fpld =  1'b0;
    assign lmq3_l2fill_fpld =  1'b0;

`elsif THREADS_1

    assign lmq1_l2fill_fpld =  1'b0;
    assign lmq2_l2fill_fpld =  1'b0;
    assign lmq3_l2fill_fpld =  1'b0;

`elsif THREADS_2

    assign lmq1_l2fill_fpld =  lmq1_pcx_pkt[`LMQ_FPLD];
    assign lmq2_l2fill_fpld =  1'b0;
    assign lmq3_l2fill_fpld =  1'b0;

`elsif THREADS_3

    assign lmq1_l2fill_fpld =  lmq1_pcx_pkt[`LMQ_FPLD];
    assign lmq2_l2fill_fpld =  lmq2_pcx_pkt[`LMQ_FPLD];
    assign lmq3_l2fill_fpld =  1'b0;

`else
    assign lmq1_l2fill_fpld =  lmq1_pcx_pkt[`LMQ_FPLD];
    assign lmq2_l2fill_fpld =  lmq2_pcx_pkt[`LMQ_FPLD];
    assign lmq3_l2fill_fpld =  lmq3_pcx_pkt[`LMQ_FPLD];
`endif

`endif // `ifndef CONFIG_NUM_THREADS
/*
   wire    lsu_l2fill_fpld_e;

mux4ds  #(44) lmq_dthrd_sel1 (
  .in0  ({lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO], lmq0_pcx_pkt[`LMQ_NC],
          lmq0_pcx_pkt[`LMQ_FPLD],lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO], lmq1_pcx_pkt[`LMQ_NC],
          lmq1_pcx_pkt[`LMQ_FPLD],lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in2  ({lmq2_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO], lmq2_pcx_pkt[`LMQ_NC],
          lmq2_pcx_pkt[`LMQ_FPLD],lmq2_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in3  ({lmq3_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO], lmq3_pcx_pkt[`LMQ_NC],
          lmq3_pcx_pkt[`LMQ_FPLD],lmq3_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .sel0 (dfq_byp_sel[0]),
  .sel1 (dfq_byp_sel[1]),
  .sel2 (dfq_byp_sel[2]),
  .sel3 (dfq_byp_sel[3]),
  .dout ({lmq_ld_addr[39:0], lsu_ncache_ld_e,
          lsu_l2fill_fpld_e, lsu_byp_misc_sz_e[1:0]})
);
*/

   assign  lmq0_ncache_ld =   lmq0_pcx_pkt[`LMQ_NC];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign  lmq1_ncache_ld =   lmq1_pcx_pkt[`LMQ_NC];
   assign  lmq2_ncache_ld =   1'b0;
   assign  lmq3_ncache_ld =   1'b0;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign  lmq1_ncache_ld =   1'b0;
   assign  lmq2_ncache_ld =   1'b0;
   assign  lmq3_ncache_ld =   1'b0;

`elsif THREADS_1

   assign  lmq1_ncache_ld =   1'b0;
   assign  lmq2_ncache_ld =   1'b0;
   assign  lmq3_ncache_ld =   1'b0;

`elsif THREADS_2

   assign  lmq1_ncache_ld =   lmq1_pcx_pkt[`LMQ_NC];
   assign  lmq2_ncache_ld =   1'b0;
   assign  lmq3_ncache_ld =   1'b0;

`elsif THREADS_3

   assign  lmq1_ncache_ld =   lmq1_pcx_pkt[`LMQ_NC];
   assign  lmq2_ncache_ld =   lmq2_pcx_pkt[`LMQ_NC];
   assign  lmq3_ncache_ld =   1'b0;

`else
   assign  lmq1_ncache_ld =   lmq1_pcx_pkt[`LMQ_NC];
   assign  lmq2_ncache_ld =   lmq2_pcx_pkt[`LMQ_NC];
   assign  lmq3_ncache_ld =   lmq3_pcx_pkt[`LMQ_NC];
`endif

`endif // `ifndef CONFIG_NUM_THREADS

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

mux2ds  #(42) lmq_dthrd_sel1 (
  .in0  ({lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .sel0 (dfq_byp_sel[0]),
  .sel1 (dfq_byp_sel[1]),
  .dout ({lmq_ld_addr[39:0], lsu_byp_misc_sz_e[1:0]})
);

// POR
// M-stage muxing : require for alignment and bypassing to exu.
// flopped then used in qctl/dctl G-stage
// lmq_ld_rd1 to lsu_qctl
// others to lsu_dctl

// M-Stage Muxing

mux2ds  #(7) lmq_dthrd_sel2 (
  .in0  ({lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq0_pcx_pkt[`LMQ_BIGEND],
    lmq0_pcx_pkt[`LMQ_SIGNEXT]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq1_pcx_pkt[`LMQ_BIGEND],
    lmq1_pcx_pkt[`LMQ_SIGNEXT]}),
  .sel0 (lmq_byp_misc_sel[0]),
  .sel1 (lmq_byp_misc_sel[1]),
  .dout ({lmq_ld_rd1[4:0],lsu_l2fill_bendian_m,lsu_l2fill_sign_extend_m})
);

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign lmq_ld_addr[39:0] =  lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO];
   assign lsu_byp_misc_sz_e[1:0] = lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign lmq_ld_rd1[4:0] = lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO];
   assign lsu_l2fill_bendian_m = lmq0_pcx_pkt[`LMQ_BIGEND];
   assign lsu_l2fill_sign_extend_m = lmq0_pcx_pkt[`LMQ_SIGNEXT];

`elsif THREADS_1

   assign lmq_ld_addr[39:0] =  lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO];
   assign lsu_byp_misc_sz_e[1:0] = lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign lmq_ld_rd1[4:0] = lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO];
   assign lsu_l2fill_bendian_m = lmq0_pcx_pkt[`LMQ_BIGEND];
   assign lsu_l2fill_sign_extend_m = lmq0_pcx_pkt[`LMQ_SIGNEXT];

`elsif THREADS_2

mux2ds  #(42) lmq_dthrd_sel1 (
  .in0  ({lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .sel0 (dfq_byp_sel[0]),
  .sel1 (dfq_byp_sel[1]),
  .dout ({lmq_ld_addr[39:0], lsu_byp_misc_sz_e[1:0]})
);

// POR
// M-stage muxing : require for alignment and bypassing to exu.
// flopped then used in qctl/dctl G-stage
// lmq_ld_rd1 to lsu_qctl
// others to lsu_dctl

// M-Stage Muxing

mux2ds  #(7) lmq_dthrd_sel2 (
  .in0  ({lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq0_pcx_pkt[`LMQ_BIGEND],
    lmq0_pcx_pkt[`LMQ_SIGNEXT]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq1_pcx_pkt[`LMQ_BIGEND],
    lmq1_pcx_pkt[`LMQ_SIGNEXT]}),
  .sel0 (lmq_byp_misc_sel[0]),
  .sel1 (lmq_byp_misc_sel[1]),
  .dout ({lmq_ld_rd1[4:0],lsu_l2fill_bendian_m,lsu_l2fill_sign_extend_m})
);

`elsif THREADS_3

mux3ds  #(42) lmq_dthrd_sel1 (
  .in0  ({lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in2  ({lmq2_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq2_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .sel0 (dfq_byp_sel[0]),
  .sel1 (dfq_byp_sel[1]),
  .sel2 (dfq_byp_sel[2]),
  .dout ({lmq_ld_addr[39:0], lsu_byp_misc_sz_e[1:0]})
);

// POR
// M-stage muxing : require for alignment and bypassing to exu.
// flopped then used in qctl/dctl G-stage
// lmq_ld_rd1 to lsu_qctl
// others to lsu_dctl

// M-Stage Muxing

mux3ds  #(7) lmq_dthrd_sel2 (
  .in0  ({lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq0_pcx_pkt[`LMQ_BIGEND],
    lmq0_pcx_pkt[`LMQ_SIGNEXT]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq1_pcx_pkt[`LMQ_BIGEND],
    lmq1_pcx_pkt[`LMQ_SIGNEXT]}),
  .in2  ({lmq2_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq2_pcx_pkt[`LMQ_BIGEND],
    lmq2_pcx_pkt[`LMQ_SIGNEXT]}),
  .sel0 (lmq_byp_misc_sel[0]),
  .sel1 (lmq_byp_misc_sel[1]),
  .sel2 (lmq_byp_misc_sel[2]),
  .dout ({lmq_ld_rd1[4:0],lsu_l2fill_bendian_m,lsu_l2fill_sign_extend_m})
);

`else
mux4ds  #(42) lmq_dthrd_sel1 (
  .in0  ({lmq0_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in2  ({lmq2_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq2_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .in3  ({lmq3_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO],
          lmq3_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO]}),
  .sel0 (dfq_byp_sel[0]),
  .sel1 (dfq_byp_sel[1]),
  .sel2 (dfq_byp_sel[2]),
  .sel3 (dfq_byp_sel[3]),
  .dout ({lmq_ld_addr[39:0], lsu_byp_misc_sz_e[1:0]})
);

// POR
// M-stage muxing : require for alignment and bypassing to exu.
// flopped then used in qctl/dctl G-stage
// lmq_ld_rd1 to lsu_qctl
// others to lsu_dctl

// M-Stage Muxing

mux4ds  #(7) lmq_dthrd_sel2 (
  .in0  ({lmq0_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq0_pcx_pkt[`LMQ_BIGEND],
    lmq0_pcx_pkt[`LMQ_SIGNEXT]}),
  .in1  ({lmq1_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq1_pcx_pkt[`LMQ_BIGEND],
    lmq1_pcx_pkt[`LMQ_SIGNEXT]}),
  .in2  ({lmq2_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq2_pcx_pkt[`LMQ_BIGEND],
    lmq2_pcx_pkt[`LMQ_SIGNEXT]}),
  .in3  ({lmq3_pcx_pkt[`LMQ_RD1_HI: `LMQ_RD1_LO],lmq3_pcx_pkt[`LMQ_BIGEND],
    lmq3_pcx_pkt[`LMQ_SIGNEXT]}),
  .sel0 (lmq_byp_misc_sel[0]),
  .sel1 (lmq_byp_misc_sel[1]),
  .sel2 (lmq_byp_misc_sel[2]),
  .sel3 (lmq_byp_misc_sel[3]),
  .dout ({lmq_ld_rd1[4:0],lsu_l2fill_bendian_m,lsu_l2fill_sign_extend_m})
);
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   assign  lmq0_byp_misc_sz[1:0] = lmq0_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign  lmq1_byp_misc_sz[1:0] = lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq2_byp_misc_sz[1:0] = 2'b0;
   assign  lmq3_byp_misc_sz[1:0] = 2'b0;

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign  lmq1_byp_misc_sz[1:0] = 2'b0;
   assign  lmq2_byp_misc_sz[1:0] = 2'b0;
   assign  lmq3_byp_misc_sz[1:0] = 2'b0;

`elsif THREADS_1

   assign  lmq1_byp_misc_sz[1:0] = 2'b0;
   assign  lmq2_byp_misc_sz[1:0] = 2'b0;
   assign  lmq3_byp_misc_sz[1:0] = 2'b0;

`elsif THREADS_2

   assign  lmq1_byp_misc_sz[1:0] = lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq2_byp_misc_sz[1:0] = 2'b0;
   assign  lmq3_byp_misc_sz[1:0] = 2'b0;

`elsif THREADS_3

   assign  lmq1_byp_misc_sz[1:0] = lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq2_byp_misc_sz[1:0] = lmq2_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq3_byp_misc_sz[1:0] = 2'b0;

`else
   assign  lmq1_byp_misc_sz[1:0] = lmq1_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq2_byp_misc_sz[1:0] = lmq2_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
   assign  lmq3_byp_misc_sz[1:0] = lmq3_pcx_pkt[`LMQ_SZ_HI: `LMQ_SZ_LO];
`endif

`endif // `ifndef CONFIG_NUM_THREADS

//assign  lmq_pcx_pkt_addr[`L1D_ADDRESS_HI:0] = lmq_ld_addr[`L1D_ADDRESS_HI:0] ;


   wire [29:0] dtag_wdata_e;

assign  dtag_wdata_e[28:0] =
        ~lsu_dfq_ld_vld ?
        lsu_diagnstc_wr_data_e[29:1] : lmq_ld_addr[39:11] ;

// Parity Generation for Tag. Match with macro.
wire    dtag_wr_parity ;
wire    dtag_wr_parity_e;
assign  dtag_wr_parity_e = ^dtag_wdata_e[28:0] ;
assign  dtag_wdata_e[29] =
       ~lsu_dfq_ld_vld ?
       lsu_diagnstc_dtagv_prty_invrt_e^dtag_wr_parity_e : dtag_wr_parity_e ;

   wire dtag_wr_parity_7_0, dtag_wr_parity_15_8,
        dtag_wr_parity_23_16,  dtag_wr_parity_28_24;

   assign dtag_wr_parity_7_0  =  ^dtag_wdata_e[7:0];   //zzpar8
   assign dtag_wr_parity_15_8 =  ^dtag_wdata_e[15:8];  //zzpar8
   assign dtag_wr_parity_23_16 = ^dtag_wdata_e[23:16]; //zzpar8
   assign dtag_wr_parity_28_24 = ^dtag_wdata_e[28:24]; //zzpar8

   wire   dtag_wr_parity_28_24_with_invrt;

   assign dtag_wr_parity_28_24_with_invrt =
           (^dtag_wdata_e[28:24]) ^ lsu_diagnstc_dtagv_prty_invrt_e; //zzpar8


   wire dtag_wr_parity_7_0_m, dtag_wr_parity_15_8_m,
        dtag_wr_parity_23_16_m,  dtag_wr_parity_28_24_m;
   wire lsu_dfq_ld_vld_m;
   wire dtag_wr_parity_28_24_with_invrt_m;


// 12/12/03 : Change for Macrotest. I didn't mention
// these 4 bits ! Pls check for a max time violation.
wire  dtag_wr_parity_7_0_din, dtag_wr_parity_15_8_din ;
wire  dtag_wr_parity_23_16_din, dtag_wr_parity_28_24_din ;
assign  dtag_wr_parity_7_0_din =
sehold ? dtag_wr_parity_7_0_m : dtag_wr_parity_7_0 ;
assign  dtag_wr_parity_15_8_din =
sehold ? dtag_wr_parity_15_8_m : dtag_wr_parity_15_8 ;
assign  dtag_wr_parity_23_16_din =
sehold ? dtag_wr_parity_23_16_m : dtag_wr_parity_23_16 ;
assign  dtag_wr_parity_28_24_din =
sehold ? dtag_wr_parity_28_24_m : dtag_wr_parity_28_24 ;

dff_s #(6) tag_parity_m (
     .din ({dtag_wr_parity_7_0_din, dtag_wr_parity_15_8_din,
            dtag_wr_parity_23_16_din, dtag_wr_parity_28_24_din,
            lsu_dfq_ld_vld,   dtag_wr_parity_28_24_with_invrt}),
     .q   ({dtag_wr_parity_7_0_m, dtag_wr_parity_15_8_m,
            dtag_wr_parity_23_16_m, dtag_wr_parity_28_24_m,
            lsu_dfq_ld_vld_m, dtag_wr_parity_28_24_with_invrt_m}),
     .clk  (clk),
     .se   (1'b0),     .si (),          .so ()
);

assign dtag_wr_parity = dtag_wr_parity_7_0_m ^ dtag_wr_parity_15_8_m ^
                        dtag_wr_parity_23_16_m ^ dtag_wr_parity_28_24_m;

   wire dtag_wr_parity_with_invrt;

assign dtag_wr_parity_with_invrt =
       dtag_wr_parity_7_0_m ^ dtag_wr_parity_15_8_m ^
       dtag_wr_parity_23_16_m ^ dtag_wr_parity_28_24_with_invrt_m;

wire [29:0] dtag_wdata_m;

// 12/12/03 : Change for Macrotest.
assign dtag_wdata_m[29] =
        ~(lsu_dfq_ld_vld_m | sehold) ?
        dtag_wr_parity_with_invrt : dtag_wr_parity ;

// 12/12/03 : Change for Macrotest.
wire [28:0] dtag_wdata_e_din ;
assign  dtag_wdata_e_din[28:0] =
sehold ? dtag_wdata_m[28:0] : dtag_wdata_e[28:0] ;

dff_s  #(29) tag_stgm (
        .din  (dtag_wdata_e_din[28:0]),
        .q    (dtag_wdata_m[28:0]),
        .clk  (clk),
        .se   (1'b0),     .si (),          .so ()
        );

   assign      lsu_error_pa_m[28:0] =  dtag_wdata_m[28:0];


//=================================================================================================
//    RS3 DATA ALIGNMENT FOR CAS
//=================================================================================================

wire  [7:0] rs3_byte0, rs3_byte1, rs3_byte2, rs3_byte3 ;
wire  [7:0] rs3_byte4, rs3_byte5, rs3_byte6, rs3_byte7 ;
wire  [63:0]  atm_byte_g ;
wire  [63:0]  st_rs3_data_m,st_rs3_data_g ;

dff_s  #(64) rs3_stgm (
        .din  (exu_lsu_rs3_data_e[63:0]),
        .q    (st_rs3_data_m[63:0]),
        .clk  (clk),
        .se   (1'b0),     .si (),          .so ()
        );

// rm (along with spu).
//assign  lsu_spu_rsrv_data_m[13:0] =
//  {st_rs3_data_m[27:23],st_rs3_data_m[21:16],st_rs3_data_m[8:6]} ;

dff_s  #(64) rs3_stgg (
        .din  (st_rs3_data_m[63:0]),
        .q    (st_rs3_data_g[63:0]),
        .clk  (clk),
        .se   (1'b0),     .si (),          .so ()
        );

assign  rs3_byte0[7:0] = st_rs3_data_g[7:0] ;
assign  rs3_byte1[7:0] = st_rs3_data_g[15:8] ;
assign  rs3_byte2[7:0] = st_rs3_data_g[23:16] ;
assign  rs3_byte3[7:0] = st_rs3_data_g[31:24] ;
assign  rs3_byte4[7:0] = st_rs3_data_g[39:32] ;
assign  rs3_byte5[7:0] = st_rs3_data_g[47:40] ;
assign  rs3_byte6[7:0] = st_rs3_data_g[55:48] ;
assign  rs3_byte7[7:0] = st_rs3_data_g[63:56] ;

//assign  atm_byte_g[7:0] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte0[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte3[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte7[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_7_0 (
    .in0 (rs3_byte0[7:0]),
    .in1 (rs3_byte3[7:0]),
    .in2 (rs3_byte7[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[7:0]));


//assign  atm_byte_g[15:8] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte1[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte2[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte6[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_15_8 (
    .in0 (rs3_byte1[7:0]),
    .in1 (rs3_byte2[7:0]),
    .in2 (rs3_byte6[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[15:8]));

//assign  atm_byte_g[23:16] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte2[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte1[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte5[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_23_16 (
    .in0 (rs3_byte2[7:0]),
    .in1 (rs3_byte1[7:0]),
    .in2 (rs3_byte5[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[23:16]));

//assign  atm_byte_g[31:24] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte3[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte0[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte4[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_31_24 (
    .in0 (rs3_byte3[7:0]),
    .in1 (rs3_byte0[7:0]),
    .in2 (rs3_byte4[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[31:24]));

//assign  atm_byte_g[39:32] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte4[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte0[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte3[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_39_32 (
    .in0 (rs3_byte4[7:0]),
    .in1 (rs3_byte0[7:0]),
    .in2 (rs3_byte3[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[39:32]));

//assign  atm_byte_g[47:40] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte5[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte1[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte2[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_47_40(
    .in0 (rs3_byte5[7:0]),
    .in1 (rs3_byte1[7:0]),
    .in2 (rs3_byte2[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[47:40]));

//assign  atm_byte_g[55:48] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte6[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte2[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte1[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_55_48(
    .in0 (rs3_byte6[7:0]),
    .in1 (rs3_byte2[7:0]),
    .in2 (rs3_byte1[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[55:48]));

//assign  atm_byte_g[63:56] =
//lsu_atomic_pkt2_bsel_g[2] ? rs3_byte7[7:0] :
//  lsu_atomic_pkt2_bsel_g[1] ? rs3_byte3[7:0] :
//    lsu_atomic_pkt2_bsel_g[0] ? rs3_byte0[7:0] : 8'bxxxx_xxxx ;

mux3ds #(8) mx_atm_byte_g_63_56 (
    .in0 (rs3_byte7[7:0]),
    .in1 (rs3_byte3[7:0]),
    .in2 (rs3_byte0[7:0]),
    .sel0(lsu_atomic_pkt2_bsel_g[2]),
    .sel1(lsu_atomic_pkt2_bsel_g[1]),
    .sel2(lsu_atomic_pkt2_bsel_g[0]),
    .dout(atm_byte_g[63:56]));

//=================================================================================================
//    STB/LDXA DATA BYPASSING
//=================================================================================================

// Add STB to load bypass data flops.
// Attempt is made to bypass data in G-stage for load. If not
// possible then flop data and wait for next available bubble.
// Once bypass occurs then load can be considered resolved.
// Load Full Raw bypassing does not have to use DFQ.

// ldxa data will reside in bypass flops until an opportunity
// is available to write to irf. ldxa's must write to lmq
// in order to provide information such as rd to irf.

// ** The two conditions are mutually exclusive. **

// lsu_local_ldxa_data_w2 w/ lsu_misc_rdata_w2 for all 4 threads

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel0_1hot ;
assign  lmq_byp_ldxa_sel0_1hot[0]  =  lmq_byp_ldxa_sel0[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel0_1hot[1]  =  lmq_byp_ldxa_sel0[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel0_1hot[2]  =  lmq_byp_ldxa_sel0[2] |  rst_tri_en;


// THREAD 0
mux3ds  #(64) ldbyp0_ldxa_mx (
  .in0  (ifu_lsu_ldxa_data_w2[63:0]), // ifu-ldxa bypass data
  //.in1  (tlu_lsu_ldxa_data_w2[63:0]), // tlu-ldxa bypass data
  .in1  (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
  .in2  (lsu_misc_rdata_w2[63:0]),    // local asi bypass data
  .sel0 (lmq_byp_ldxa_sel0_1hot[0]),
  //.sel1 (lmq_byp_ldxa_sel0[1]),
  .sel1 (lmq_byp_ldxa_sel0_1hot[1]),
  .sel2 (lmq_byp_ldxa_sel0_1hot[2]),
  .dout (lmq0_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel0_1hot ;
assign  lmq_byp_data_sel0_1hot[0]  =  lmq_byp_data_sel0[0] ;
assign  lmq_byp_data_sel0_1hot[1]  =  lmq_byp_data_sel0[1] ;
assign  lmq_byp_data_sel0_1hot[2]  =  lmq_byp_data_sel0[2] ;
assign  lmq_byp_data_sel0_1hot[3]  =  lmq_byp_data_sel0[3] ;

wire  [63:0]  lmq0_bypass_misc_data ;
mux4ds  #(64) ldbyp0_data_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq0_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel0_1hot[0]),
  .sel1 (lmq_byp_data_sel0_1hot[1]),
  .sel2 (lmq_byp_data_sel0_1hot[2]),
  .sel3 (lmq_byp_data_sel0_1hot[3]),
  .dout (lmq0_bypass_misc_data[63:0])
);


//Addition as per OpenSPARC T1 Internals
wire [63:0] ldxa_data_w2;

assign ldxa_data_w2 = cfg_asi_lsu_ldxa_vld_w2 ?
                      cfg_asi_lsu_ldxa_data_w2[63:0] :
                      tlu_lsu_int_ldxa_data_w2[63:0];

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp0_fmx (
  .in0  (lmq0_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[0]),
  .sel1 (lmq_byp_data_fmx_sel[0]),
  .dout (lmq0_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp0_data_ff (
        .din    (lmq0_bypass_data_in[63:0]),
        .q      (lmq0_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[0]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp0_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp0_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[0]),
                .tmb_l  (~se),
                .clk    (ldbyp0_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp0_data_ff (
        .din    (lmq0_bypass_data_in[63:0]),
        .q      (lmq0_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[0])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp0_data_ff (
        .din    (lmq0_bypass_data_in[63:0]),
        .q      (lmq0_bypass_data[63:0]),
        .clk    (ldbyp0_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

// THREAD 1
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel1_1hot ;
assign  lmq_byp_ldxa_sel1_1hot[0]  =  lmq_byp_ldxa_sel1[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[1]  =  lmq_byp_ldxa_sel1[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[2]  =  lmq_byp_ldxa_sel1[2] |  rst_tri_en;


mux3ds  #(64) ldbyp1_ldxa_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel1_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel1[1]),
    .sel1   (lmq_byp_ldxa_sel1_1hot[1]),
    .sel2   (lmq_byp_ldxa_sel1_1hot[2]),
        .dout   (lmq1_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel1_1hot ;
assign  lmq_byp_data_sel1_1hot[0]  =  lmq_byp_data_sel1[0] ;
assign  lmq_byp_data_sel1_1hot[1]  =  lmq_byp_data_sel1[1] ;
assign  lmq_byp_data_sel1_1hot[2]  =  lmq_byp_data_sel1[2] ;
assign  lmq_byp_data_sel1_1hot[3]  =  lmq_byp_data_sel1[3] ;


wire    [63:0]  lmq1_bypass_misc_data ;
mux4ds  #(64) ldbyp1_data_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq1_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel1_1hot[0]),
  .sel1 (lmq_byp_data_sel1_1hot[1]),
  .sel2 (lmq_byp_data_sel1_1hot[2]),
  .sel3 (lmq_byp_data_sel1_1hot[3]),
  .dout (lmq1_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp1_fmx (
  .in0  (lmq1_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[1]),
  .sel1 (lmq_byp_data_fmx_sel[1]),
  .dout (lmq1_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp1_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp1_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[1]),
                .tmb_l  (~se),
                .clk    (ldbyp1_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .clk    (ldbyp1_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif


`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

// THREAD 1
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel1_1hot ;
assign  lmq_byp_ldxa_sel1_1hot[0]  =  lmq_byp_ldxa_sel1[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[1]  =  lmq_byp_ldxa_sel1[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[2]  =  lmq_byp_ldxa_sel1[2] |  rst_tri_en;


mux3ds  #(64) ldbyp1_ldxa_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel1_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel1[1]),
    .sel1   (lmq_byp_ldxa_sel1_1hot[1]),
    .sel2   (lmq_byp_ldxa_sel1_1hot[2]),
        .dout   (lmq1_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel1_1hot ;
assign  lmq_byp_data_sel1_1hot[0]  =  lmq_byp_data_sel1[0] ;
assign  lmq_byp_data_sel1_1hot[1]  =  lmq_byp_data_sel1[1] ;
assign  lmq_byp_data_sel1_1hot[2]  =  lmq_byp_data_sel1[2] ;
assign  lmq_byp_data_sel1_1hot[3]  =  lmq_byp_data_sel1[3] ;


wire    [63:0]  lmq1_bypass_misc_data ;
mux4ds  #(64) ldbyp1_data_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq1_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel1_1hot[0]),
  .sel1 (lmq_byp_data_sel1_1hot[1]),
  .sel2 (lmq_byp_data_sel1_1hot[2]),
  .sel3 (lmq_byp_data_sel1_1hot[3]),
  .dout (lmq1_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp1_fmx (
  .in0  (lmq1_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[1]),
  .sel1 (lmq_byp_data_fmx_sel[1]),
  .dout (lmq1_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp1_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp1_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[1]),
                .tmb_l  (~se),
                .clk    (ldbyp1_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .clk    (ldbyp1_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`elsif THREADS_3

// THREAD 1
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel1_1hot ;
assign  lmq_byp_ldxa_sel1_1hot[0]  =  lmq_byp_ldxa_sel1[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[1]  =  lmq_byp_ldxa_sel1[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[2]  =  lmq_byp_ldxa_sel1[2] |  rst_tri_en;


mux3ds  #(64) ldbyp1_ldxa_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel1_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel1[1]),
    .sel1   (lmq_byp_ldxa_sel1_1hot[1]),
    .sel2   (lmq_byp_ldxa_sel1_1hot[2]),
        .dout   (lmq1_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel1_1hot ;
assign  lmq_byp_data_sel1_1hot[0]  =  lmq_byp_data_sel1[0] ;
assign  lmq_byp_data_sel1_1hot[1]  =  lmq_byp_data_sel1[1] ;
assign  lmq_byp_data_sel1_1hot[2]  =  lmq_byp_data_sel1[2] ;
assign  lmq_byp_data_sel1_1hot[3]  =  lmq_byp_data_sel1[3] ;


wire    [63:0]  lmq1_bypass_misc_data ;
mux4ds  #(64) ldbyp1_data_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq1_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel1_1hot[0]),
  .sel1 (lmq_byp_data_sel1_1hot[1]),
  .sel2 (lmq_byp_data_sel1_1hot[2]),
  .sel3 (lmq_byp_data_sel1_1hot[3]),
  .dout (lmq1_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp1_fmx (
  .in0  (lmq1_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[1]),
  .sel1 (lmq_byp_data_fmx_sel[1]),
  .dout (lmq1_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp1_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp1_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[1]),
                .tmb_l  (~se),
                .clk    (ldbyp1_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .clk    (ldbyp1_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

// THREAD 2
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel2_1hot ;
assign  lmq_byp_ldxa_sel2_1hot[0]  =  lmq_byp_ldxa_sel2[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel2_1hot[1]  =  lmq_byp_ldxa_sel2[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel2_1hot[2]  =  lmq_byp_ldxa_sel2[2] |  rst_tri_en;


mux3ds  #(64) ldbyp2_data_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel2_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel2[1]),
    .sel1 (lmq_byp_ldxa_sel2_1hot[1]),
    .sel2 (lmq_byp_ldxa_sel2_1hot[2]),
        .dout   (lmq2_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel2_1hot ;
assign  lmq_byp_data_sel2_1hot[0]  =  lmq_byp_data_sel2[0] ;
assign  lmq_byp_data_sel2_1hot[1]  =  lmq_byp_data_sel2[1] ;
assign  lmq_byp_data_sel2_1hot[2]  =  lmq_byp_data_sel2[2] ;
assign  lmq_byp_data_sel2_1hot[3]  =  lmq_byp_data_sel2[3] ;


wire    [63:0]  lmq2_bypass_misc_data ;
mux4ds  #(64) ldbyp2_ldxa_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq2_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel2_1hot[0]),
  .sel1 (lmq_byp_data_sel2_1hot[1]),
  .sel2 (lmq_byp_data_sel2_1hot[2]),
  .sel3 (lmq_byp_data_sel2_1hot[3]),
  .dout (lmq2_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp2_fmx (
  .in0  (lmq2_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[2]),
  .sel1 (lmq_byp_data_fmx_sel[2]),
  .dout (lmq2_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[2]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp2_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp2_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[2]),
                .tmb_l  (~se),
                .clk    (ldbyp2_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .clk    (ldbyp2_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`else

// THREAD 1
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel1_1hot ;
assign  lmq_byp_ldxa_sel1_1hot[0]  =  lmq_byp_ldxa_sel1[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[1]  =  lmq_byp_ldxa_sel1[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel1_1hot[2]  =  lmq_byp_ldxa_sel1[2] |  rst_tri_en;


mux3ds  #(64) ldbyp1_ldxa_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel1_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel1[1]),
    .sel1   (lmq_byp_ldxa_sel1_1hot[1]),
    .sel2   (lmq_byp_ldxa_sel1_1hot[2]),
        .dout   (lmq1_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel1_1hot ;
assign  lmq_byp_data_sel1_1hot[0]  =  lmq_byp_data_sel1[0] ;
assign  lmq_byp_data_sel1_1hot[1]  =  lmq_byp_data_sel1[1] ;
assign  lmq_byp_data_sel1_1hot[2]  =  lmq_byp_data_sel1[2] ;
assign  lmq_byp_data_sel1_1hot[3]  =  lmq_byp_data_sel1[3] ;


wire  [63:0]  lmq1_bypass_misc_data ;
mux4ds  #(64) ldbyp1_data_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq1_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel1_1hot[0]),
  .sel1 (lmq_byp_data_sel1_1hot[1]),
  .sel2 (lmq_byp_data_sel1_1hot[2]),
  .sel3 (lmq_byp_data_sel1_1hot[3]),
  .dout (lmq1_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp1_fmx (
  .in0  (lmq1_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[1]),
  .sel1 (lmq_byp_data_fmx_sel[1]),
  .dout (lmq1_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[1]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp1_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp1_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[1]),
                .tmb_l  (~se),
                .clk    (ldbyp1_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[1])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp1_data_ff (
        .din    (lmq1_bypass_data_in[63:0]),
        .q      (lmq1_bypass_data[63:0]),
        .clk    (ldbyp1_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

// THREAD 2
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel2_1hot ;
assign  lmq_byp_ldxa_sel2_1hot[0]  =  lmq_byp_ldxa_sel2[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel2_1hot[1]  =  lmq_byp_ldxa_sel2[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel2_1hot[2]  =  lmq_byp_ldxa_sel2[2] |  rst_tri_en;


mux3ds  #(64) ldbyp2_data_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel2_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel2[1]),
    .sel1 (lmq_byp_ldxa_sel2_1hot[1]),
    .sel2 (lmq_byp_ldxa_sel2_1hot[2]),
        .dout   (lmq2_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel2_1hot ;
assign  lmq_byp_data_sel2_1hot[0]  =  lmq_byp_data_sel2[0] ;
assign  lmq_byp_data_sel2_1hot[1]  =  lmq_byp_data_sel2[1] ;
assign  lmq_byp_data_sel2_1hot[2]  =  lmq_byp_data_sel2[2] ;
assign  lmq_byp_data_sel2_1hot[3]  =  lmq_byp_data_sel2[3] ;


wire  [63:0]  lmq2_bypass_misc_data ;
mux4ds  #(64) ldbyp2_ldxa_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq2_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel2_1hot[0]),
  .sel1 (lmq_byp_data_sel2_1hot[1]),
  .sel2 (lmq_byp_data_sel2_1hot[2]),
  .sel3 (lmq_byp_data_sel2_1hot[3]),
  .dout (lmq2_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp2_fmx (
  .in0  (lmq2_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[2]),
  .sel1 (lmq_byp_data_fmx_sel[2]),
  .dout (lmq2_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[2]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp2_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp2_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[2]),
                .tmb_l  (~se),
                .clk    (ldbyp2_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[2])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp2_data_ff (
        .din    (lmq2_bypass_data_in[63:0]),
        .q      (lmq2_bypass_data[63:0]),
        .clk    (ldbyp2_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

// THREAD 3
// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [2:0]  lmq_byp_ldxa_sel3_1hot ;
assign  lmq_byp_ldxa_sel3_1hot[0]  =  lmq_byp_ldxa_sel3[0] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel3_1hot[1]  =  lmq_byp_ldxa_sel3[1] & ~rst_tri_en;
assign  lmq_byp_ldxa_sel3_1hot[2]  =  lmq_byp_ldxa_sel3[2] |  rst_tri_en;


mux3ds  #(64) ldbyp3_data_mx (
        .in0    (ifu_lsu_ldxa_data_w2[63:0]),   // ifu-ldxa bypass data
        //.in1    (tlu_lsu_ldxa_data_w2[63:0]),   // tlu-ldxa bypass data
    .in1    (spu_lsu_ldxa_data_w2[63:0]), // spu-ldxa bypass data
    .in2    (lsu_misc_rdata_w2[63:0]),// local asi bypass data
        .sel0   (lmq_byp_ldxa_sel3_1hot[0]),
        //.sel1   (lmq_byp_ldxa_sel3[1]),
    .sel1   (lmq_byp_ldxa_sel3_1hot[1]),
    .sel2   (lmq_byp_ldxa_sel3_1hot[2]),
        .dout   (lmq3_bypass_ldxa_data[63:0])
);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lmq_byp_data_sel3_1hot ;
assign  lmq_byp_data_sel3_1hot[0]  =  lmq_byp_data_sel3[0] ;
assign  lmq_byp_data_sel3_1hot[1]  =  lmq_byp_data_sel3[1] ;
assign  lmq_byp_data_sel3_1hot[2]  =  lmq_byp_data_sel3[2] ;
assign  lmq_byp_data_sel3_1hot[3]  =  lmq_byp_data_sel3[3] ;


wire  [63:0]  lmq3_bypass_misc_data ;
mux4ds  #(64) ldbyp3_ldxa_mx (
  .in0  (stb_rdata_ramd[63:0]),   // stb bypass data
  .in1  (exu_lsu_rs3_data_e[63:0]), // rs3 data
  .in2  (atm_byte_g[63:0]),   // cas formatted data
  .in3  (lmq3_bypass_ldxa_data[63:0]),  // ldxa bypass data
  .sel0 (lmq_byp_data_sel3_1hot[0]),
  .sel1 (lmq_byp_data_sel3_1hot[1]),
  .sel2 (lmq_byp_data_sel3_1hot[2]),
  .sel3 (lmq_byp_data_sel3_1hot[3]),
  .dout (lmq3_bypass_misc_data[63:0])
);

// 2:1 mux for additional data bus from tlu.
// Grape : merge into mux-flop.
mux2ds  #(64) ldbyp3_fmx (
  .in0  (lmq3_bypass_misc_data[63:0]),
  .in1  (ldxa_data_w2[63:0]),   // Changed input from (tlu_lsu_int_ldxa_data_w2[63:0]),
  .sel0 (~lmq_byp_data_fmx_sel[3]),
  .sel1 (lmq_byp_data_fmx_sel[3]),
  .dout (lmq3_bypass_data_in[63:0])
);

/*
dffe_s  #(64) ldbyp3_data_ff (
        .din    (lmq3_bypass_data_in[63:0]),
        .q      (lmq3_bypass_data[63:0]),
        .en     (lmq_byp_data_en_w2[3]), .clk (clk),
        .se     (1'b0),       .si (),          .so ()
        );
*/
wire ldbyp3_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldbyp3_data_clkbuf (
                .rclk   (clk),
                .enb_l  (~lmq_byp_data_en_w2[3]),
                .tmb_l  (~se),
                .clk    (ldbyp3_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) ldbyp3_data_ff (
        .din    (lmq3_bypass_data_in[63:0]),
        .q      (lmq3_bypass_data[63:0]),
        .en (~(~lmq_byp_data_en_w2[3])), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) ldbyp3_data_ff (
        .din    (lmq3_bypass_data_in[63:0]),
        .q      (lmq3_bypass_data[63:0]),
        .clk    (ldbyp3_data_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

`endif

`endif // `ifndef CONFIG_NUM_THREADS

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

// This can be merged with above mux !!!!
mux2ds  #(64) ld_byp_cas_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (cas_pkt2_data[63:0])
);

// Can this be merged with above muxes ?
mux2ds  #(64) tlb_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (lsu_tlb_st_sel_m[0]),
  .sel1   (lsu_tlb_st_sel_m[1]),
  .dout (tlb_st_data[63:0])
);

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
  assign cas_pkt2_data[63:0] = lmq0_bypass_data[63:0];
  assign tlb_st_data[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_1

  assign cas_pkt2_data[63:0] = lmq0_bypass_data[63:0];
  assign tlb_st_data[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_2

// This can be merged with above mux !!!!
mux2ds  #(64) ld_byp_cas_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .dout (cas_pkt2_data[63:0])
);

// Can this be merged with above muxes ?
mux2ds  #(64) tlb_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (lsu_tlb_st_sel_m[0]),
  .sel1   (lsu_tlb_st_sel_m[1]),
  .dout (tlb_st_data[63:0])
);

`elsif THREADS_3

// This can be merged with above mux !!!!
mux3ds  #(64) ld_byp_cas_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .dout (cas_pkt2_data[63:0])
);

// Can this be merged with above muxes ?
mux3ds  #(64) tlb_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .sel0 (lsu_tlb_st_sel_m[0]),
  .sel1   (lsu_tlb_st_sel_m[1]),
  .sel2 (lsu_tlb_st_sel_m[2]),
  .dout (tlb_st_data[63:0])
);

`else
// This can be merged with above mux !!!!
mux4ds  #(64) ld_byp_cas_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .in3  (lmq3_bypass_data[63:0]),
  .sel0 (ld_pcx_rq_sel[0]),
  .sel1   (ld_pcx_rq_sel[1]),
  .sel2 (ld_pcx_rq_sel[2]),
  .sel3   (ld_pcx_rq_sel[3]),
  .dout (cas_pkt2_data[63:0])
);

// Can this be merged with above muxes ?
mux4ds  #(64) tlb_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .in3  (lmq3_bypass_data[63:0]),
  .sel0 (lsu_tlb_st_sel_m[0]),
  .sel1   (lsu_tlb_st_sel_m[1]),
  .sel2 (lsu_tlb_st_sel_m[2]),
  .sel3   (lsu_tlb_st_sel_m[3]),
  .dout (tlb_st_data[63:0])
);
`endif

`endif // `ifndef CONFIG_NUM_THREADS

/*mux4ds  #(64) tlb_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .in3  (lmq3_bypass_data[63:0]),
  .sel0 (lsu_tlb_st_sel_g[0]),
  .sel1   (lsu_tlb_st_sel_g[1]),
  .sel2 (lsu_tlb_st_sel_g[2]),
  .sel3   (lsu_tlb_st_sel_g[3]),
  .dout (tlb_st_data[63:0])
);*/

wire  [63:0] tlb_st_data_d1 ;
dff_s  #(64) std_d1 (
        .din    (tlb_st_data[63:0]),
        .q      (tlb_st_data_d1[63:0]),
        .clk    (clk),
        .se     (1'b0),     .si (),          .so ()
        );

// Begin - Bug3487.


wire asi_data_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf asid_clkbuf (
                .rclk   (clk),
                .enb_l  (lsu_ifu_asi_data_en_l),
                .tmb_l  (~se),
                .clk    (asi_data_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(48) ifu_std_d1 (
        .din    (tlb_st_data[47:0]),
        .q      (lsu_ifu_stxa_data[47:0]),
        .en (~(lsu_ifu_asi_data_en_l)), .clk(clk),
        .se     (1'b0),     .si (),          .so ()
        );
`else
dff_s  #(48) ifu_std_d1 (
        .din    (tlb_st_data[47:0]),
        .q      (lsu_ifu_stxa_data[47:0]),
        .clk    (asi_data_clk),
        .se     (1'b0),     .si (),          .so ()
        );
`endif

// select is now a stage earlier, which should be
// fine as selects stay constant.
//assign  lsu_ifu_stxa_data[47:0] = tlb_st_data_d1[47:0] ;

// End - Bug3487.


//wire    [3:0]   lsu_diag_access_sel_d1 ;

//dff #(4)  diagsel_stgd1 (
//        .din    (lsu_diag_access_sel[3:0]),
//        .q      (lsu_diag_access_sel_d1[3:0]),
//        .clk    (clk),
//        .se     (1'b0),       .si (),          .so ()
//        );

//mux4ds  #(64) diag_st_mx (
//  .in0  (lmq0_bypass_data[63:0]),
//  .in1  (lmq1_bypass_data[63:0]),
//  .in2  (lmq2_bypass_data[63:0]),
//  .in3  (lmq3_bypass_data[63:0]),
//  .sel0 (lsu_diag_access_sel_d1[0]),
//  .sel1 (lsu_diag_access_sel_d1[1]),
//  .sel2 (lsu_diag_access_sel_d1[2]),
//  .sel3 (lsu_diag_access_sel_d1[3]),
//  .dout (lsu_diagnstc_wr_data_e[63:0])
//);

// 1-hot fix: 8/1/03 - can be multihot during scan
// grape mapper convert the 1 of the inverter used for the select to the logic below
wire  [3:0]  lsu_diagnstc_data_sel_1hot ;
assign  lsu_diagnstc_data_sel_1hot[0]  =  lsu_diagnstc_data_sel[0] & ~rst_tri_en;
assign  lsu_diagnstc_data_sel_1hot[1]  =  lsu_diagnstc_data_sel[1] & ~rst_tri_en;
assign  lsu_diagnstc_data_sel_1hot[2]  =  lsu_diagnstc_data_sel[2] & ~rst_tri_en;
assign  lsu_diagnstc_data_sel_1hot[3]  =  lsu_diagnstc_data_sel[3] |  rst_tri_en;


`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

mux2ds  #(64) diag_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (lsu_diagnstc_data_sel_1hot[0]),
  .sel1 (lsu_diagnstc_data_sel_1hot[1]),
  .dout (lsu_diagnstc_wr_data_e[63:0])
);

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
  assign lsu_diagnstc_wr_data_e[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_1

  assign lsu_diagnstc_wr_data_e[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_2

mux2ds  #(64) diag_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (lsu_diagnstc_data_sel_1hot[0]),
  .sel1 (lsu_diagnstc_data_sel_1hot[1]),
  .dout (lsu_diagnstc_wr_data_e[63:0])
);

`elsif THREADS_3

mux3ds  #(64) diag_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .sel0 (lsu_diagnstc_data_sel_1hot[0]),
  .sel1 (lsu_diagnstc_data_sel_1hot[1]),
  .sel2 (lsu_diagnstc_data_sel_1hot[2]),
  .dout (lsu_diagnstc_wr_data_e[63:0])
);

`else
mux4ds  #(64) diag_st_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .in3  (lmq3_bypass_data[63:0]),
  .sel0 (lsu_diagnstc_data_sel_1hot[0]),
  .sel1 (lsu_diagnstc_data_sel_1hot[1]),
  .sel2 (lsu_diagnstc_data_sel_1hot[2]),
  .sel3 (lsu_diagnstc_data_sel_1hot[3]),
  .dout (lsu_diagnstc_wr_data_e[63:0])
);
`endif

`endif // `ifndef CONFIG_NUM_THREADS

// Remove flops
/*dff  #(64) dgndt_d1 (
        .din    (tlb_st_data[63:0]),
        .q      (lsu_diagnstc_wr_data_e[63:0]),
        .clk    (clk),
        .se     (1'b0),     .si (),          .so ()
        ); */

assign lsu_diagnstc_wr_data_b0 = lsu_diagnstc_wr_data_e[0] ;

// Move tte format and parity calc to tlbdp

//assign lsu_tlu_st_rs3_data_g[63:0] = tlb_st_data_d1[63:0];
assign lsu_tlu_st_rs3_data_g[47:3] = tlb_st_data_d1[47:3];
assign lsu_mmu_rs3_data_g[63:0] = tlb_st_data_d1[63:0];
assign lsu_tlu_rs3_data_g[63:0] = tlb_st_data_d1[63:0];

// Removed Fast bypass as penalty is negligible.

//=================================================================================================
//    STQ PKT2 DATA
//=================================================================================================

//** stquad support removed **

//=================================================================================================
//    IMISS/SPU DP
//=================================================================================================

// Format of IFU pcx packet (50b) :
//  b49 - valid
//  b48:44 - req type
//  b43:42 - rep way (for "eviction" - maintains directory consistency )
//  b41:40 - mil id
//  b39:0  - imiss address


// Align ifu pkt with ldst pkt - temporary !
// Does this need to be enabled ?!!!! No.
assign  ifu_pcx_pkt_e[51:0] = ifu_pcx_pkt[51:0] ;

// Form pcx-wide ifu request packet.
assign  ifu_full_pcx_pkt_e[`PCX_VLD] = ifu_pcx_pkt_e[51] ;
assign  ifu_full_pcx_pkt_e[`PCX_RQ_HI:`PCX_RQ_LO] = ifu_pcx_pkt_e[48:44];
assign  ifu_full_pcx_pkt_e[`PCX_NC] = ifu_pcx_pkt_e[49] ;
assign  ifu_full_pcx_pkt_e[`PCX_CP_HI:`PCX_CP_LO] = const_cpuid[2:0] ;
// thread-id unused - use mil id instead.
assign  ifu_full_pcx_pkt_e[`PCX_TH_HI:`PCX_TH_LO] = ifu_pcx_pkt_e[41:40] ;
assign  ifu_full_pcx_pkt_e[`PCX_BF_HI] =  ifu_pcx_pkt_e[50] ;
assign  ifu_full_pcx_pkt_e[`PCX_BF_HI-1:`PCX_BF_LO] =  2'b00;
assign  ifu_full_pcx_pkt_e[`PCX_WY_HI:`PCX_WY_LO] =  ifu_pcx_pkt_e[43:42] ;
// unused - always infer 32b
assign  ifu_full_pcx_pkt_e[`PCX_SZ_HI:`PCX_SZ_LO] =  3'b000 ;
assign  ifu_full_pcx_pkt_e[`PCX_AD_HI:`PCX_AD_LO] =  ifu_pcx_pkt_e[39:0] ;
// no data
assign  ifu_full_pcx_pkt_e[`PCX_DA_HI:`PCX_DA_LO] =  64'd0 ;

// Form pcx-wide interrupt request packet.
assign  intrpt_full_pcxpkt[`PCX_VLD] = tlu_lsu_pcxpkt[25] ;
assign  intrpt_full_pcxpkt[`PCX_RQ_HI:`PCX_RQ_LO] = tlu_lsu_pcxpkt[24:20];
assign  intrpt_full_pcxpkt[`PCX_NC] = 1'b0 ;

//tlu_lsu_pcxpkt[12:8] is the 5 bit interrupt destination thread id,
//so [12:10] is the cpu id, and [9:8] is the thread id.
assign  intrpt_full_pcxpkt[`PCX_CP_HI:`PCX_CP_LO] = tlu_lsu_pcxpkt[12:10];

// or should thread-id be 19:18 ?
assign  intrpt_full_pcxpkt[`PCX_TH_HI:`PCX_TH_LO] = tlu_lsu_pcxpkt[19:18] ;
// May actually make undriven fields x.
assign  intrpt_full_pcxpkt[`PCX_BF_HI:`PCX_BF_LO] =  3'b000;
assign  intrpt_full_pcxpkt[`PCX_WY_HI:`PCX_WY_LO] =  2'b00 ;
assign  intrpt_full_pcxpkt[`PCX_SZ_HI:`PCX_SZ_LO] =  3'b000 ;
assign  intrpt_full_pcxpkt[`PCX_AD_HI:`PCX_AD_LO] =  40'd0 ;
assign  intrpt_full_pcxpkt[`PCX_DA_HI:`PCX_DA_LO] =  {46'd0,tlu_lsu_pcxpkt[17:0]} ;

// Format fpop_full_pcxpkt.

assign  fpop_full_pcxpkt[`PCX_VLD] = ffu_lsu_data[80] ;
assign  fpop_full_pcxpkt[`PCX_RQ_HI:`PCX_RQ_LO] = {4'b0101,ffu_lsu_data[78]} ;
assign  fpop_full_pcxpkt[`PCX_NC] = 1'b0 ;
assign  fpop_full_pcxpkt[`PCX_CP_HI:`PCX_CP_LO] = const_cpuid[2:0] ;
assign  fpop_full_pcxpkt[`PCX_TH_HI:`PCX_TH_LO] = ffu_lsu_data[77:76] ;
assign  fpop_full_pcxpkt[`PCX_BF_HI:`PCX_SZ_LO] = 8'd0 ;
assign  fpop_full_pcxpkt[`PCX_AD_HI:`PCX_AD_LO+16] = 24'd0 ;
assign  fpop_full_pcxpkt[`PCX_AD_LO+15:`PCX_AD_LO+8] = ffu_lsu_data[75:68]; // 79:72
assign  fpop_full_pcxpkt[`PCX_AD_LO+7:`PCX_AD_LO+4] = 4'b0000;      // 71:68
assign  fpop_full_pcxpkt[`PCX_AD_LO+3:`PCX_AD_LO] = ffu_lsu_data[67:64] ; // 67:64
assign  fpop_full_pcxpkt[`PCX_DA_HI:`PCX_DA_LO] = ffu_lsu_data[63:0] ;


// RAMTest Data Merging.
wire cacherd_clk;
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf cacherd_clkbuf (
                .rclk   (clk),
                .enb_l  (~lsu_ramtest_rd_w),
                .tmb_l  (~se),
                .clk    (cacherd_clk)
                ) ;
`endif

wire  [63:0]  cache_rdata_w,cache_rdata_w2 ;

mux2ds  #(64) cacherd_sel (
  .in0  (ifu_lsu_ldxa_data_w2[63:0]),
  .in1  (lsu_dcache_rdata_w[63:0]),
  .sel0 (~lsu_dcache_iob_rd_w),
  .sel1 (lsu_dcache_iob_rd_w),
  .dout (cache_rdata_w[63:0])
);

`ifdef FPGA_SYN_CLK_DFF
dffe_s  #(64) cachedata (
        .din    (cache_rdata_w[63:0]),
        .q      (cache_rdata_w2[63:0]), // references dcache rd staging
        .en (~(~lsu_ramtest_rd_w)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s  #(64) cachedata (
        .din    (cache_rdata_w[63:0]),
        .q      (cache_rdata_w2[63:0]), // references dcache rd staging
        .clk    (cacherd_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

assign  fwd_full_pcxpkt[`PCX_VLD] = 1'b1 ;
assign  fwd_full_pcxpkt[`PCX_RQ_HI:`PCX_RQ_LO] = {3'b011,lsu_pcx_fwd_reply,~lsu_pcx_fwd_reply} ;
assign  fwd_full_pcxpkt[`PCX_NC] = lsu_pcx_fwd_pkt[107] ;
assign  fwd_full_pcxpkt[`PCX_CP_HI:`PCX_CP_LO] = lsu_pcx_fwd_pkt[106:104] ;
assign  fwd_full_pcxpkt[`PCX_TH_HI:`PCX_TH_LO] = 2'b00 ;
assign  fwd_full_pcxpkt[`PCX_BF_HI:`PCX_SZ_LO] =
      {6'b000000,lsu_fwd_rply_sz1_unc,1'b1} ;
// All address bits should not be required !!!
assign  fwd_full_pcxpkt[`PCX_AD_HI:`PCX_AD_LO] = lsu_pcx_fwd_pkt[103:64] ;

//  Mux sources of TAP request data - margin,pc,defeature/debug/bist.
// Be careful about pc - could be a critical path.
// ** Assume read-data stays constant at output latches of dcache **
//assign  fwd_full_pcxpkt[`PCX_DA_HI:`PCX_DA_LO] =
//lsu_iobrdge_rply_data_sel[0] ?  {20'd0,lsu_iobrdge_rd_data[43:0]} :
//  lsu_iobrdge_rply_data_sel[1] ?  cache_rdata_w2[63:0] :
//            lsu_iobrdge_rply_data_sel[2] ?  lsu_pcx_fwd_pkt[63:0] :
//                                    64'hxxxx_xxxx_xxxx_xxxx ;

mux3ds #(64) mx_fwd_full_pcxpkt (
    .in0 ({20'd0,lsu_iobrdge_rd_data[43:0]}),
    .in1 (cache_rdata_w2[63:0]),
    .in2 (lsu_pcx_fwd_pkt[63:0]),
    .sel0(lsu_iobrdge_rply_data_sel[0]),
    .sel1(lsu_iobrdge_rply_data_sel[1]),
    .sel2(lsu_iobrdge_rply_data_sel[2]),
    .dout(fwd_full_pcxpkt[`PCX_DA_HI:`PCX_DA_LO]));


wire  [`PCX_WIDTH-1:0]  spu_lsu_ldst_pckt_d1 ;
dff_s  #(`PCX_WIDTH) ff_spu_lsu_ldst_pckt_d1 (
        .din  (spu_lsu_ldst_pckt[`PCX_WIDTH-1:0]),
        .q    (spu_lsu_ldst_pckt_d1[`PCX_WIDTH-1:0]),
        .clk  (clk),
        .se   (1'b0),     .si (),          .so ()
        );

assign  imiss_strm_pcx_pkt[`PCX_WIDTH-1:0] = imiss_pcx_mx_sel ?
          ifu_full_pcx_pkt_e[`PCX_WIDTH-1:0] : spu_lsu_ldst_pckt_d1[`PCX_WIDTH-1:0] ;

wire  [`PCX_WIDTH-1:0]  fwd_int_fp_pcx_pkt ;
mux3ds #(`PCX_WIDTH) mux_fwd_int_fp_pcx_pkt (
     .in0  (fwd_full_pcxpkt[`PCX_WIDTH-1:0]),
     .in1  (intrpt_full_pcxpkt[`PCX_WIDTH-1:0]),
     .in2  (fpop_full_pcxpkt[`PCX_WIDTH-1:0]),
     .sel0 (fwd_int_fp_pcx_mx_sel[0]),
     .sel1 (fwd_int_fp_pcx_mx_sel[1]),
     .sel2 (fwd_int_fp_pcx_mx_sel[2]),
     .dout (fwd_int_fp_pcx_pkt [`PCX_WIDTH-1:0])
);

//=================================================================================================
//    PCX PKT SELECTION
//=================================================================================================

assign stb_pcx_pkt[`STB_PCX_VLD] = lsu_stb_pcx_rvld_d1 ;                // Valid
// Support stores for now.
assign stb_pcx_pkt[`STB_PCX_RQ_HI:`STB_PCX_RQ_LO] = stb_rdata_ramd[74:72] ;     // Rq-type
assign stb_pcx_pkt[`STB_PCX_NC] =
  // Mina the OR gate has been extended to a 3 input gate
  stb_rdata_ramd[74] | stb_rdata_ramd[73] |   // atomics
  stb_rdata_ramd[71] |  // flush inst
  stb_rdata_ramd[76];  // non-cacheable conditions from stb_ncache_pcx_rq_g 
// cpu-id will be inserted on way out of core.
assign  stb_pcx_pkt[`STB_PCX_TH_HI:`STB_PCX_TH_LO] = lsu_stb_rd_tid[1:0] ;    // TID
// bf-id is not required.
// mux will have to be placed elsewhere. (grape)
assign  stb_pcx_pkt[`STB_PCX_FLSH] = stb_rdata_ramd[71] ; // flush
assign  stb_pcx_pkt[`STB_PCX_FLSH-1] = 1'b0 ;
//assign  stb_pcx_pkt[`STB_PCX_WY_HI:`STB_PCX_WY_LO] = 2'b00 ;

//bug 2511
assign  stb_pcx_pkt[`STB_PCX_SZ_HI:`STB_PCX_SZ_LO] =
                        stb_rdata_ramd[69:68];                          // Size

//assign  stb_pcx_pkt[`STB_PCX_AD_HI:`STB_PCX_AD_LO] = stb_pcx_pkt[`STB_PCX_FLSH] ? 40'b0 :
//                        {stb_rdata_ramc[44:9],stb_rdata_ramd[67:64]} ;// Addr

assign  stb_pcx_pkt[`STB_PCX_AD_HI:`STB_PCX_AD_LO] =
                        {stb_rdata_ramc[44:9],stb_rdata_ramd[67:64]} ;// Addr


assign  stb_pcx_pkt[`STB_PCX_DA_HI:`STB_PCX_DA_LO] =
                        stb_rdata_ramd[63:0];                           // Data

assign  store_pcx_pkt[`STB_PCX_WIDTH-1:0] = stb_pcx_pkt[`STB_PCX_WIDTH-1:0] ;

`ifndef NO_RTL_CSM
assign stb_pcx_csm = stb_rcsm_ramc;
`endif

// bld addr select.
wire [1:0] bld_addr_b54 ;
assign  bld_addr_b54[1:0] =
  lsu_bld_pcx_rq ? lsu_bld_rq_addr[1:0] : load_pcx_pkt[`LMQ_AD_LO+5:`LMQ_AD_LO+4] ;

// Select between load and store outbound pkt.
// *** cpu-id currently hardwired in pkt
// *** Thrd id currently hardwired.
mux4ds  #(124) pcx_pkt_src (
  .in0  ({load_pcx_pkt[`LMQ_VLD],2'b00,
    load_pcx_pkt[`LMQ_RQ_HI: `LMQ_RQ_LO],
    load_pcx_pkt[`LMQ_NC],const_cpuid[2:0],
    ld_pcx_thrd[1:0],lsu_pcx_ld_dtag_perror_w2,
    load_pcx_pkt[`LMQ_PREF],load_pcx_pkt[`LMQ_DFLUSH],
    load_pcx_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lsu_pcx_rq_sz_b3,
    //load_pcx_pkt[`LMQ_WY_HI:`LMQ_WY_LO],1'b0,
    //load_pcx_pkt[`LMQ_SZ_HI:0],cas_pkt2_data[63:0]}), // load
    load_pcx_pkt[`LMQ_SZ_HI:`LMQ_AD_LO+6], bld_addr_b54[1:0],
    load_pcx_pkt[`LMQ_AD_LO+3:`LMQ_AD_LO],cas_pkt2_data[63:0]}), // load
  .in1  ({store_pcx_pkt[`STB_PCX_VLD],1'b0,
  store_pcx_pkt[`STB_PCX_FLSH], // turn into interrupt request.
    store_pcx_pkt[`STB_PCX_RQ_HI:`STB_PCX_RQ_LO],
    store_pcx_pkt[`STB_PCX_NC], const_cpuid[2:0],
    store_pcx_pkt[`STB_PCX_TH_HI:`STB_PCX_TH_LO],
    1'b0,
    stb_rdata_ramd[70], // blk-st : Bug 3395
    stb_rdata_ramd[75],
    2'b00,
    //store_pcx_pkt[`STB_PCX_WY_HI:`STB_PCX_WY_LO],
    1'b0,store_pcx_pkt[`STB_PCX_SZ_HI:0]}),     // store
  .in2  (imiss_strm_pcx_pkt[`PCX_WIDTH-1:0]),   // alt src : imiss,stream.
  .in3  (fwd_int_fp_pcx_pkt[`PCX_WIDTH-1:0]),   // fwd, interrupt, fpop
  .sel0 (pcx_pkt_src_sel[0]),
  .sel1 (pcx_pkt_src_sel[1]),
  .sel2 (pcx_pkt_src_sel[2]),
  .sel3 (pcx_pkt_src_sel[3]),
  .dout (pcx_pkt_data[`PCX_WIDTH-1:0])
);

dff_s  #(124) pcx_xmit_ff (
        .din  (pcx_pkt_data[`PCX_WIDTH-1:0]),
        .q    (spc_pcx_data_pa[`PCX_WIDTH-1:0]),
        .clk  (clk),
        .se     (1'b0),     .si (),          .so ()
        );

`ifndef NO_RTL_CSM
mux4ds  #(`TLB_CSM_WIDTH) pcx_csm_src (
  .in0  (load_pcx_csm), // load
  .in1  (stb_pcx_csm),     // store
  .in2  (ifu_pcx_csm),   // alt src : imiss,stream.
  .in3  ({`TLB_CSM_WIDTH{1'b1}}),   // fwd, interrupt, fpop
  .sel0 (pcx_pkt_src_sel[0]),
  .sel1 (pcx_pkt_src_sel[1]),
  .sel2 (pcx_pkt_src_sel[2]),
  .sel3 (pcx_pkt_src_sel[3]),
  .dout (pcx_pkt_csm)
);

dff_s  #(`TLB_CSM_WIDTH) pcx_csm_xmit_ff (
        .din  (pcx_pkt_csm),
        .q    (spc_pcx_csm_pa),
        .clk  (clk),
        .se     (1'b0),     .si (),          .so ()
        );


`endif
//  Stage to avoid critical path
/*assign  lsu_ifu_ld_icache_index[11:5] = pcx_pkt_data[`PCX_AD_LO+11:`PCX_AD_LO+5] ;
assign  lsu_ifu_ld_pcxpkt_tid[1:0] = pcx_pkt_data[`PCX_TH_HI:`PCX_TH_LO] ;*/

dff_s  #(`IC_SET_IDX_HI+3) stg_icindx (
        .din  ({pcx_pkt_data[`PCX_AD_LO+`IC_IDX_HI:`PCX_AD_LO+5],pcx_pkt_data[`PCX_TH_HI:`PCX_TH_LO]}),
        .q    ({lsu_ifu_ld_icache_index[`IC_IDX_HI:5],lsu_ifu_ld_pcxpkt_tid[1:0]}),
        .clk  (clk),
        .se     (1'b0),     .si (),          .so ()
        );

//=========================================================================================
//  VA Watchpt Reg per thread
//=========================================================================================

//VA_watchpoint_thread0
   wire        va_wtchpt0_clk ;
   wire [47:3] va_wtchpt0_addr;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_va_wtchpt0 (
                .rclk   (clk),
                .enb_l  (lsu_va_wtchpt0_wr_en_l),
                .tmb_l  (~se),
                .clk    (va_wtchpt0_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s #(45) va_wtchpt0_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt0_addr[47:3]),
        .en (~(lsu_va_wtchpt0_wr_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s #(45) va_wtchpt0_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt0_addr[47:3]),
        .clk    (va_wtchpt0_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

//VA_watchpoint_thread1
   wire        va_wtchpt1_clk ;
   wire [47:3] va_wtchpt1_addr;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_va_wtchpt1 (
                .rclk   (clk),
                .enb_l  (lsu_va_wtchpt1_wr_en_l),
                .tmb_l  (~se),
                .clk    (va_wtchpt1_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s #(45) va_wtchpt1_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt1_addr[47:3]),
        .en (~(lsu_va_wtchpt1_wr_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s #(45) va_wtchpt1_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt1_addr[47:3]),
        .clk    (va_wtchpt1_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

//VA_watchpoint_thread2
   wire        va_wtchpt2_clk ;
   wire [47:3] va_wtchpt2_addr;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_va_wtchpt2 (
                .rclk   (clk),
                .enb_l  (lsu_va_wtchpt2_wr_en_l),
                .tmb_l  (~se),
                .clk    (va_wtchpt2_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s #(45) va_wtchpt2_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt2_addr[47:3]),
        .en (~(lsu_va_wtchpt2_wr_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s #(45) va_wtchpt2_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt2_addr[47:3]),
        .clk    (va_wtchpt2_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

//VA_watchpoint_thread3
   wire        va_wtchpt3_clk ;
   wire [47:3] va_wtchpt3_addr;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf clkbf_va_wtchpt3 (
                .rclk   (clk),
                .enb_l  (lsu_va_wtchpt3_wr_en_l),
                .tmb_l  (~se),
                .clk    (va_wtchpt3_clk)
                ) ;
`endif

`ifdef FPGA_SYN_CLK_DFF
dffe_s #(45) va_wtchpt3_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt3_addr[47:3]),
        .en (~(lsu_va_wtchpt3_wr_en_l)), .clk(clk),
        .se     (1'b0),       .si (),          .so ()
        );
`else
dff_s #(45) va_wtchpt3_ff (
        .din    (lsu_tlu_st_rs3_data_g[47:3]),
        .q      (va_wtchpt3_addr[47:3]),
        .clk    (va_wtchpt3_clk),
        .se     (1'b0),       .si (),          .so ()
        );
`endif

   wire [47:3] va_wtchpt_addr;

mux4ds #(45)     va_wtchpt_mx_m (
        .in0    (va_wtchpt0_addr[47:3]),
        .in1    (va_wtchpt1_addr[47:3]),
        .in2    (va_wtchpt2_addr[47:3]),
        .in3    (va_wtchpt3_addr[47:3]),
        .sel0   (thread0_m),
        .sel1   (thread1_m),
        .sel2   (thread2_m),
        .sel3   (thread3_m),
        .dout   (va_wtchpt_addr[47:3])
        );

mux4ds #(45)     va_wtchpt_mx_g (
        .in0    (va_wtchpt0_addr[47:3]),
        .in1    (va_wtchpt1_addr[47:3]),
        .in2    (va_wtchpt2_addr[47:3]),
        .in3    (va_wtchpt3_addr[47:3]),
        .sel0   (thread0_g),
        .sel1   (thread1_g),
        .sel2   (thread2_g),
        .sel3   (thread3_g),
        .dout   (lsu_va_wtchpt_addr[47:3])
        );

//VA wtchpt comparison at M stage
//assign lsu_va_match_m = (lsu_ldst_va_m[47:3] == va_wtchpt_addr[47:3]);
//bug6480/eco6623
assign lsu_va_match_b47_b32_m = (lsu_ldst_va_m[47:32] == va_wtchpt_addr[47:32]);
assign lsu_va_match_b31_b3_m =  (lsu_ldst_va_m[31:3 ] == va_wtchpt_addr[31:3 ]);

//====================================================================
//dc_fill CP
   wire [63:0] l2fill_data_m;

//dff #(64) stgm_l2fd (
//        .din    (lsu_l2fill_data[63:0]),
//        .q      (l2fill_data_m[63:0]),
//        .clk    (clk),
//        .se     (se),       .si (),          .so ()
//        );
   assign      l2fill_data_m[63:0] = lsu_l2fill_data[63:0];


   wire [63:0] ld_byp_data_m;

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

mux2ds  #(64) ld_byp_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (ld_thrd_byp_sel_m[0]),
  .sel1 (ld_thrd_byp_sel_m[1]),
  .dout (ld_byp_data_m[63:0])
);

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
  assign ld_byp_data_m[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_1

  assign ld_byp_data_m[63:0] = lmq0_bypass_data[63:0];

`elsif THREADS_2

mux2ds  #(64) ld_byp_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .sel0 (ld_thrd_byp_sel_m[0]),
  .sel1 (ld_thrd_byp_sel_m[1]),
  .dout (ld_byp_data_m[63:0])
);

`elsif THREADS_3

mux3ds  #(64) ld_byp_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .sel0 (ld_thrd_byp_sel_m[0]),
  .sel1 (ld_thrd_byp_sel_m[1]),
  .sel2 (ld_thrd_byp_sel_m[2]),
  .dout (ld_byp_data_m[63:0])
);

`else
mux4ds  #(64) ld_byp_mx (
  .in0  (lmq0_bypass_data[63:0]),
  .in1  (lmq1_bypass_data[63:0]),
  .in2  (lmq2_bypass_data[63:0]),
  .in3  (lmq3_bypass_data[63:0]),
  .sel0 (ld_thrd_byp_sel_m[0]),
  .sel1 (ld_thrd_byp_sel_m[1]),
  .sel2 (ld_thrd_byp_sel_m[2]),
  .sel3 (ld_thrd_byp_sel_m[3]),
  .dout (ld_byp_data_m[63:0])
);
`endif

`endif // `ifndef CONFIG_NUM_THREADS

assign dcache_alt_data_w0_m[63:0] =
       l2fill_vld_m ? l2fill_data_m[63:0] :
                      ld_byp_data_m[63:0];

//assign  lsu_l2fill_or_byp_msb_m[7:0]
//  = {lsu_l2fill_or_byp_data_m[63],
//     lsu_l2fill_or_byp_data_m[55],
//     lsu_l2fill_or_byp_data_m[47],
//     lsu_l2fill_or_byp_data_m[39],
//     lsu_l2fill_or_byp_data_m[31],
//     lsu_l2fill_or_byp_data_m[23],
//     lsu_l2fill_or_byp_data_m[15],
//     lsu_l2fill_or_byp_data_m[07]} ;
//====================================================================

endmodule
