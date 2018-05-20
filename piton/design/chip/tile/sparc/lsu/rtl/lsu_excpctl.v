// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_excpctl.v
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
/////////////////////////////////////////////////////////////////

`include "sys.h"
`include "lsu.tmp.h"

module lsu_excpctl ( /*AUTOARG*/
   // Outputs
   so, lsu_exu_st_dtlb_perr_g, lsu_ffu_st_dtlb_perr_g, 
   lsu_defr_trp_taken_g, lsu_tlu_defr_trp_taken_g, 
   lsu_mmu_defr_trp_taken_g, lsu_st_dtlb_perr_g, 
   lsu_dmmu_sfsr_trp_wr, lsu_dsfsr_din_g, lsu_tlb_perr_ld_rq_kill_w, 
   lsu_spu_early_flush_g, lsu_local_early_flush_g, 
   lsu_tlu_early_flush_w, lsu_tlu_early_flush2_w, lsu_ttype_vld_m2, 
   lsu_ttype_vld_m2_bf1, lsu_ifu_flush_pipe_w, lsu_exu_flush_pipe_w, 
   lsu_mmu_flush_pipe_w, lsu_ffu_flush_pipe_w, lsu_tlu_wtchpt_trp_g, 
   lsu_tlu_dmmu_miss_g, lsu_tlu_misalign_addr_ldst_atm_m, 
   lsu_tlu_daccess_excptn_g, lsu_tlu_daccess_prot_g, 
   lsu_tlu_priv_action_g, lsu_ifu_tlb_data_su, lsu_ifu_tlb_data_ue, 
   lsu_ifu_tlb_tag_ue, lsu_tlu_ttype_m2, lsu_tlu_ttype_vld_m2, 
   stb_cam_sqsh_msk, stb_cam_hit_bf, stb_cam_hit_bf1, 
   tte_data_perror_unc, asi_tte_data_perror, asi_tte_tag_perror, 
   // Inputs
   rclk, si, se, grst_l, arst_l, tlb_rd_tte_data_ebit, 
   tlb_rd_tte_data_pbit, tlb_rd_tte_data_nfobit, 
   tlb_rd_tte_data_wbit, tlb_cam_hit, tlb_pgnum_b39, 
   lsu_ldst_va_b39_m, lsu_sun4r_va_m_l, lsu_sun4r_pgsz_b2t0_e, 
   lsu_sun4v_pgsz_b2t0_e, tlu_early_flush_pipe_w, ifu_lsu_flush_w, 
   ifu_lsu_nceen, lsu_tlb_asi_data_perr_g, lsu_tlb_asi_tag_perr_g, 
   stb_state_vld0, stb_state_vld1, stb_state_vld2, stb_state_vld3, 
   ifu_tlu_thrid_e, tlu_lsu_priv_trap_m, tlu_lsu_pstate_priv, 
   st_inst_vld_e, ld_inst_vld_e, ifu_lsu_alt_space_e, lsu_ldst_va_m, 
   hpv_priv_m, hpstate_en_m, stb_cam_hit, dtlb_bypass_m, 
   lsu_alt_space_m, atomic_m, ldst_dbl_m, fp_ldst_m, lda_internal_m, 
   sta_internal_m, cam_real_m, data_rd_vld_g, tag_rd_vld_g, 
   ldst_sz_m, asi_internal_m, rd_only_ltlb_asi_e, wr_only_ltlb_asi_e, 
   dfill_tlb_asi_e, ifill_tlb_asi_e, nofault_asi_m, as_if_user_asi_m, 
   atomic_asi_m, phy_use_ec_asi_m, phy_byp_ec_asi_m, quad_asi_m, 
   binit_quad_asi_m, blk_asi_m, recognized_asi_m, strm_asi_m, 
   mmu_rd_only_asi_m, rd_only_asi_m, wr_only_asi_m, unimp_asi_m, 
   lsu_nonalt_nucl_access_m, va_wtchpt_cmp_en_m, 
   lsu_va_match_b47_b32_m, lsu_va_match_b31_b3_m, 
   va_wtchpt_msk_match_m, ifu_tlu_inst_vld_m, 
   exu_tlu_misalign_addr_jmpl_rtn_m, exu_tlu_va_oor_m, 
   tlu_dsfsr_flt_vld, tlu_lsu_pstate_cle, tlu_lsu_pstate_am, 
   lsu_excpctl_asi_state_m, lsu_tlu_nonalt_ldst_m, 
   lsu_squash_va_oor_m, lsu_tlu_xslating_ldst_m, lsu_tlu_ctxt_sel_m, 
   lsu_tlu_write_op_m, lsu_memref_m, lsu_flsh_inst_m, 
   tte_data_parity_error, tte_tag_parity_error
   );

   
   input rclk;   
   input si;
   input se;
   input grst_l;
   input arst_l;
   output so;

   //=================================================================
   // input from tlb
//   input [`STLB_DATA_NFO:`STLB_DATA_W] tlb_rd_tte_data ; // tte data from tlb
   input  tlb_rd_tte_data_ebit;
   input  tlb_rd_tte_data_pbit;
   input  tlb_rd_tte_data_nfobit;
   input  tlb_rd_tte_data_wbit;


   input                               tlb_cam_hit;
   input                               tlb_pgnum_b39;
//   input                               tlb_rd_tte_data_locked ;    // lock bit from tte
   //=================================================================

   input	lsu_ldst_va_b39_m ;
   input	lsu_sun4r_va_m_l ; 
   input [2:0]	lsu_sun4r_pgsz_b2t0_e ;
   input [2:0]	lsu_sun4v_pgsz_b2t0_e ;

   input         tlu_early_flush_pipe_w;
   input         ifu_lsu_flush_w;
   input [3:0]   ifu_lsu_nceen ;             // uncorrectible error enable 

   input       	lsu_tlb_asi_data_perr_g ;
   input       	lsu_tlb_asi_tag_perr_g ;

   input [7:0]  stb_state_vld0 ;  // valid bits - stb0
   input [7:0]	stb_state_vld1 ;  // valid bits - stb1
   input [7:0]  stb_state_vld2 ;  // valid bits - stb2
   input [7:0]  stb_state_vld3 ;  // valid bits - stb3

   input [1:0]  ifu_tlu_thrid_e ; // thread-id.

   input	tlu_lsu_priv_trap_m ;	// daccess-excp in tlu

   output 	lsu_exu_st_dtlb_perr_g ;
   output 	lsu_ffu_st_dtlb_perr_g ;

   output	lsu_defr_trp_taken_g ;
   output	lsu_tlu_defr_trp_taken_g ;
   output	lsu_mmu_defr_trp_taken_g ;

   output [3:0]	lsu_st_dtlb_perr_g ;

   output [3:0]  lsu_dmmu_sfsr_trp_wr;	   // sfsr wr based on trap.
   output [23:0] lsu_dsfsr_din_g;


   output lsu_tlb_perr_ld_rq_kill_w ;
   output lsu_spu_early_flush_g;
   output lsu_local_early_flush_g;   //to lsu
   
//   output lsu_dctl_early_flush_w;
   output lsu_tlu_early_flush_w;
   output lsu_tlu_early_flush2_w;

   output lsu_ttype_vld_m2;
   output lsu_ttype_vld_m2_bf1;
   

//   output 	lsu_stbctl_flush_pipe_w ;
//   output 	lsu_stbrwctl_flush_pipe_w ;
   //output lsu_flush_pipe_w;
   output lsu_ifu_flush_pipe_w;
   output lsu_exu_flush_pipe_w;
   output lsu_mmu_flush_pipe_w;
   output lsu_ffu_flush_pipe_w;

   output lsu_tlu_wtchpt_trp_g ;        // watchpt trap has occurred.
   output lsu_tlu_dmmu_miss_g;
   output lsu_tlu_misalign_addr_ldst_atm_m ; // mem_addr unaligned
//   output lsu_tlu_priv_violtn_g;
   wire   lsu_tlu_priv_violtn_g;
   output lsu_tlu_daccess_excptn_g;
   output lsu_tlu_daccess_prot_g;
   output lsu_tlu_priv_action_g;
//   output lsu_tlu_tte_ebit_g;
//   output lsu_tlu_spec_access_epage_g;
//   output lsu_tlu_uncache_atomic_g;
//   output lsu_tlu_illegal_asi_action_g;
//   output lsu_tlu_flt_ld_nfo_pg_g;

   //output lsu_tlu_asi_rd_unc;

   output lsu_ifu_tlb_data_su ;	  // specific to st ue
   output lsu_ifu_tlb_data_ue ;   // dtlb data asi rd parity error ; now ld ue
   output lsu_ifu_tlb_tag_ue ;    // dtlb tag asi rd parity error
  
output [8:0]            lsu_tlu_ttype_m2;
output                  lsu_tlu_ttype_vld_m2;

   output  [7:0]   stb_cam_sqsh_msk ;  // squash spurious hits

   output	stb_cam_hit_bf;		  // buffered stb_cam_hit for qctl1.
   output	stb_cam_hit_bf1;		// buffered stb_cam_hit for stb_rwctl, dctl.

   input [3:0]          tlu_lsu_pstate_priv ;   
//   input [3:0]          tlu_lsu_hpv_priv;
//   input [3:0]          tlu_lsu_hpstate_en;
   
   
   input                st_inst_vld_e;
   input                ld_inst_vld_e;
   input                ifu_lsu_alt_space_e;        // alternate space ld/st

   //interface between lsu_dctldp
   input [7:0]          lsu_ldst_va_m;
   
   //interface between lsu_excpctl and lsu_dctl

   output               tte_data_perror_unc;
   //output               tte_data_perror_corr;
   output		asi_tte_data_perror ;
   output		asi_tte_tag_perror ;


   input hpv_priv_m;
   input hpstate_en_m;
   
   input		stb_cam_hit ;
   
   input                dtlb_bypass_m;
   
   input                lsu_alt_space_m;
   input                atomic_m;
//   input                atomic_g;
   input                ldst_dbl_m;
   input                fp_ldst_m;
//   input                lsu_inst_vld_w;
   input                lda_internal_m;
   input                sta_internal_m;
   input                cam_real_m;
//   input                va_wtchpt_match;

   input                data_rd_vld_g;
   input                tag_rd_vld_g;
   input [1:0]          ldst_sz_m;
   input                asi_internal_m;

//   input                dfill_thread0;
//   input                dfill_thread1;
//   input                dfill_thread2;
//   input                dfill_thread3;

   wire                ld_inst_vld_unflushed;
   wire                st_inst_vld_unflushed;
//   input                flsh_inst_g;
//   input                unc_err_trap_g;
   
   //asi decode
   input                rd_only_ltlb_asi_e;
   input                wr_only_ltlb_asi_e;
   input                dfill_tlb_asi_e;
   input                ifill_tlb_asi_e;

   input                nofault_asi_m;
   input                as_if_user_asi_m;

   input                atomic_asi_m;
   input                phy_use_ec_asi_m;
   input                phy_byp_ec_asi_m;
//   input                tlb_byp_asi_m;
   input                quad_asi_m;
   input                binit_quad_asi_m;
   input                blk_asi_m;
//   input                blk_cmt_asi_m;
   input                recognized_asi_m;
   input                strm_asi_m;
   input                mmu_rd_only_asi_m;
   input                rd_only_asi_m;
   input                wr_only_asi_m;
   input                unimp_asi_m;
   input		lsu_nonalt_nucl_access_m ;

   input    va_wtchpt_cmp_en_m;    //from dctl
   input    lsu_va_match_b47_b32_m;        //from qdp1
   input    lsu_va_match_b31_b3_m;         //from qdp1

   input    va_wtchpt_msk_match_m; //from dctldp

   input		ifu_tlu_inst_vld_m ;

input           exu_tlu_misalign_addr_jmpl_rtn_m;// misaligned addr - jmpl or return addr
input           exu_tlu_va_oor_m;       	// ??? - to be used in sfsr
input [3:0]     tlu_dsfsr_flt_vld;
input [3:0]   	tlu_lsu_pstate_cle ;       // current little endian
input [3:0]   	tlu_lsu_pstate_am ;        // address mask
input  [7:0]    lsu_excpctl_asi_state_m ;   // ASI State + imm asi
input          	lsu_tlu_nonalt_ldst_m ; // non-alternate load or store // FORCE
input      	lsu_squash_va_oor_m ;   // squash va_oor for mem-op. // FORCE
input           lsu_tlu_xslating_ldst_m ;// xslating ldst,atomic etc // FORCE
input   [2:0]   lsu_tlu_ctxt_sel_m;           // context selected:0-p,1-s,2-n // FORCE
input           lsu_tlu_write_op_m; // FORCE
input		lsu_memref_m ;
input           lsu_flsh_inst_m ;
   

input    tte_data_parity_error ;
input    tte_tag_parity_error ;

wire	other_flush_pipe_w ;
wire	defr_trp_taken ;
wire 	defr_trp_taken_m, defr_trp_taken_byp, defr_trp_taken_m_din ;   
wire  	tlb_tte_vld_m, tlb_tte_vld_g ;
wire 	priv_pg_usr_mode_m, priv_pg_usr_mode_g, priv_pg_usr_mode;
wire 	nfo_pg_nonnfo_asi_m, nfo_pg_nonnfo_asi_g, nfo_pg_nonnfo_asi;
wire  	spec_access_epage_m, spec_access_epage_g, spec_access_epage ;
wire   	nonwr_pg_st_access;
   
//=========================================================================================
// MISCELLANEOUS
//=========================================================================================

   wire       clk;
   assign     clk = rclk;
   wire       reset;

   wire       dbb_reset_l;

    dffrl_async rstff(.din (grst_l),
                        .q   (dbb_reset_l),
                        .clk (clk), .se(se), .si(), .so(),
                        .rst_l (arst_l));

   assign reset = ~dbb_reset_l ;

bw_u1_buf_30x UZsize_stb_cam_hit_bf1  (.a(stb_cam_hit),   .z(stb_cam_hit_bf1));  //to dctl, stb_rwctl
bw_u1_buf_30x UZsize_stb_cam_hit_bf   (.a(stb_cam_hit),   .z(stb_cam_hit_bf ));  //to qctl1

wire                ld_inst_vld_m;
wire                st_inst_vld_m;

dff_s #(2) inst_vld_stgm (
   .din ({ld_inst_vld_e, st_inst_vld_e}),
   .q   ({ld_inst_vld_m, st_inst_vld_m}),
   .clk    (clk),
   .se     (se),       .si (),          .so ()
);

dff_s #(2) inst_vld_stgg (
   .din ({ld_inst_vld_m, st_inst_vld_m}),
   .q   ({ld_inst_vld_unflushed, st_inst_vld_unflushed}),
   .clk    (clk),
   .se     (se),       .si (),          .so ()
);

wire	tlu_priv_trap_g ;
dff_s #(1) tprivtrp_g (
   .din (tlu_lsu_priv_trap_m),
   .q   (tlu_priv_trap_g),
   .clk    (clk),
   .se     (se),       .si (),          .so ()
);
   
  
//=========================================================================================
//  Thread Staging
//=========================================================================================

wire [1:0] thrid_m, thrid_g ;
dff_s #(2)  tid_stgm (
        .din    (ifu_tlu_thrid_e[1:0]),
        .q      (thrid_m[1:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire	thread0_m, thread1_m, thread2_m, thread3_m;

assign	thread0_m = ~thrid_m[1] & ~thrid_m[0] ;
assign	thread1_m = ~thrid_m[1] &  thrid_m[0] ;
assign	thread2_m =  thrid_m[1] & ~thrid_m[0] ;
assign	thread3_m =  thrid_m[1] &  thrid_m[0] ;

wire thread0_g, thread1_g, thread2_g, thread3_g ;
dff_s #(4)  tid_stgg (
        .din    ({thread0_m, thread1_m, thread2_m, thread3_m}),
        .q      ({thread0_g, thread1_g, thread2_g, thread3_g}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

//=========================================================================================
//  INST_VLD_W GENERATION
//=========================================================================================


assign	thrid_g[0] = thread1_g | thread3_g ;
assign	thrid_g[1] = thread2_g | thread3_g ;
   
wire    flush_w_inst_vld_m ;
wire    lsu_inst_vld_w ;
wire	lsu_flush_pipe_w;
assign  flush_w_inst_vld_m =
        ifu_tlu_inst_vld_m &
        ~(lsu_flush_pipe_w & (thrid_m[1:0] == thrid_g[1:0])) ; // really lsu_flush_pipe_w

dff_s  stgw_ivld (
        .din    (flush_w_inst_vld_m),
        .q      (lsu_inst_vld_w),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

//========================================================================
//	Miscellaneous
//========================================================================


// Moved to excpctl from stb_rwctl as excpctl is closer to stb-cam.
mux4ds  #(8) stbvld_mx (
  .in0  (~stb_state_vld0[7:0]),
  .in1  (~stb_state_vld1[7:0]),
  .in2  (~stb_state_vld2[7:0]),
  .in3  (~stb_state_vld3[7:0]),
  .sel0 (thread0_g),
  .sel1 (thread1_g),
  .sel2 (thread2_g),
  .sel3 (thread3_g),
  .dout (stb_cam_sqsh_msk[7:0])
);
   
//========================================================================
//  Exception Handling Begin
//========================================================================

//va watch point
   wire va_match_g;
   wire va_wtchpt_msk_match_g;


wire	va_wtchpt_en_m ;

assign	va_wtchpt_en_m = 
va_wtchpt_cmp_en_m & 
(((~asi_internal_m & recognized_asi_m) & lsu_alt_space_m) | ~lsu_alt_space_m) // Bug5226
& (ld_inst_vld_m | st_inst_vld_m) & //bug 3681
 ~(hpv_priv_m & hpstate_en_m)  // ECO 4178
& ~cam_real_m ;                // ECO 5470 (TO_2_0)

//bug6480   
   wire lsu_va_match_m;
   wire	pstate_am_m ;

assign lsu_va_match_m = ((lsu_va_match_b47_b32_m & lsu_va_match_b31_b3_m) & ~pstate_am_m) |
                          (lsu_va_match_b31_b3_m & pstate_am_m);

wire va_wtchpt_en_g; 
dff_s #(3)  stgwtch_g (
        .din    ({va_wtchpt_en_m,
                  lsu_va_match_m,
                  va_wtchpt_msk_match_m}), 
        .q      ({va_wtchpt_en_g,
                  va_match_g,
                  va_wtchpt_msk_match_g}), 
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );


// These signals will eventually generate exceptions.
   wire va_wtchpt_match;
   
assign  va_wtchpt_match = 
        va_match_g &  va_wtchpt_msk_match_g & lsu_inst_vld_w & va_wtchpt_en_g;

assign  lsu_tlu_wtchpt_trp_g = va_wtchpt_match ;


// tlb related exceptions/errors
wire  tlb_daccess_excptn_e, tlb_daccess_excptn_m ; 
wire  tlb_daccess_excptn_e_d1;
wire	tlb_illgl_pgsz_m ;

assign  tlb_daccess_excptn_e  =
  ((rd_only_ltlb_asi_e &  st_inst_vld_e)  |
   (wr_only_ltlb_asi_e &  ld_inst_vld_e)) & ifu_lsu_alt_space_e   ;
  
dff_s  #(1) tlbex_stgm (
        .din    ({tlb_daccess_excptn_e}),
        .q      ({tlb_daccess_excptn_e_d1}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign tlb_daccess_excptn_m = tlb_daccess_excptn_e_d1 | tlb_illgl_pgsz_m;
      
wire pstate_priv_m;
//wire pstate_priv;

mux4ds  #(1) pstate_priv_m_mux (
        .in0    (tlu_lsu_pstate_priv[0]),
        .in1    (tlu_lsu_pstate_priv[1]),
        .in2    (tlu_lsu_pstate_priv[2]),
        .in3    (tlu_lsu_pstate_priv[3]),
        .sel0   (thread0_m),  
        .sel1   (thread1_m),
        .sel2   (thread2_m),  
        .sel3   (thread3_m),
        .dout   (pstate_priv_m)
);
   
//dff #(1)  priv_stgg (
//        .din    (pstate_priv_m),
//        .q      (pstate_priv),
//        .clk    (clk),
//        .se     (se),       .si (),          .so ()
//        );

// privilege violation - priv page accessed in user mode
//timing 
//assign  priv_pg_usr_mode =  // data access exception; TT=h30
//  (ld_inst_vld_unflushed | st_inst_vld_unflushed) & ~(pstate_priv | hpv_priv) & tlb_rd_tte_data_pbit ;

//SC2   wire hpv_priv_m;
     
   assign priv_pg_usr_mode_m = (ld_inst_vld_m | st_inst_vld_m) & ~(pstate_priv_m | hpv_priv_m);

dff_s #(1) priv_pg_usr_mode_stgg  (
        .din    (priv_pg_usr_mode_m),
        .q      (priv_pg_usr_mode_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   
   assign priv_pg_usr_mode = priv_pg_usr_mode_g & tlb_rd_tte_data_pbit ;
   
// protection violation - store to a page that does not have write permission
//timing
//assign  nonwr_pg_st_access =  // data access protection; TT=h33
//  st_inst_vld_unflushed   & 
//  ~tlb_rd_tte_data_wbit & ~lsu_dtlb_bypass_g & tlb_cam_hit_g ;
//   //lsu_dtlb_bypass_g) ; // W=1 in bypass mode - In bypass mode this trap will never happen !!!

   assign nonwr_pg_st_access = ~tlb_rd_tte_data_wbit & st_inst_vld_unflushed & tlb_tte_vld_g;
   
wire  daccess_prot ;
assign  daccess_prot = nonwr_pg_st_access  ;
    //((~lsu_dtlb_bypass_g & tlb_cam_hit_g) | (tlb_byp_asi_g & lsu_alt_space_g)) ;

// access to a page marked with the nfo with an asi other than nfo asi.
//timing
//assign  nfo_pg_nonnfo_asi  =  // data access exception; TT=h30
//  (ld_inst_vld_unflushed | st_inst_vld_unflushed) &   // any access
//  ((~nofault_asi_g & lsu_alt_space_g) | ~lsu_alt_space_g) // in alternate space or not
//  & tlb_rd_tte_data_nfobit ;

assign nfo_pg_nonnfo_asi_m = (ld_inst_vld_m | st_inst_vld_m) &
                             ((~nofault_asi_m & lsu_alt_space_m) | ~lsu_alt_space_m) ;
   
dff_s #(1) nfo_pg_nonnfo_asi_stgg   (
        .din    (nfo_pg_nonnfo_asi_m),
        .q      (nfo_pg_nonnfo_asi_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
assign    nfo_pg_nonnfo_asi = nfo_pg_nonnfo_asi_g & tlb_rd_tte_data_nfobit ;
   
// as_if_usr asi accesses priv page.
//timing
//assign  as_if_usr_priv_pg  =  // data access exception; TT=h30
//  (ld_inst_vld_unflushed | st_inst_vld_unflushed) & as_if_user_asi_g & lsu_alt_space_g & 
//      tlb_rd_tte_data_pbit ;

   wire   as_if_usr_priv_pg_m, as_if_usr_priv_pg_g, as_if_usr_priv_pg;
   assign as_if_usr_priv_pg_m = (ld_inst_vld_m | st_inst_vld_m) & as_if_user_asi_m & lsu_alt_space_m;
 
dff_s #(1) as_if_usr_priv_pg_stgg   (
        .din    (as_if_usr_priv_pg_m),
        .q      (as_if_usr_priv_pg_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   assign  as_if_usr_priv_pg =  as_if_usr_priv_pg_g & tlb_rd_tte_data_pbit ; 
 
// non-cacheable address - iospace PA[39] = 1 
// atomic access to non-cacheable space.
   wire    atm_access_w_nc, atomic_g;

dff_s #(1) atm_stgg (
        .din    (atomic_m),
        .q      (atomic_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

   
assign  atm_access_w_nc = atomic_g & tlb_pgnum_b39 ; // io space 

// atomic inst with unsupported asi.
//timing
//assign  atm_access_unsup_asi = atomic_g & ~atomic_asi_g & lsu_alt_space_g ;
   wire atm_access_unsup_asi_m, atm_access_unsup_asi;
   
assign  atm_access_unsup_asi_m = atomic_m & ~atomic_asi_m & lsu_alt_space_m;

dff_s #(1) atm_access_unsup_asi_stgg   (
        .din    (atm_access_unsup_asi_m),
        .q      (atm_access_unsup_asi),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

   
//timing
//assign  tlb_tte_vld_g = ~lsu_dtlb_bypass_g & tlb_cam_hit_g ;

wire	dmmu_va_oor_m ;
assign  tlb_tte_vld_m = ~dtlb_bypass_m & tlb_cam_hit & 
			~((unimp_asi_m | asi_internal_m | ~recognized_asi_m) & 
				lsu_alt_space_m) & // Bug 3541,5186
			~dmmu_va_oor_m ; // Bug 5070
	
dff_s #(1) tlb_tte_vld_stgg   (
        .din    (tlb_tte_vld_m),
        .q      (tlb_tte_vld_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   
wire  pg_with_ebit_m, pg_with_ebit_g, pg_with_ebit  ;
//timing   
//assign	pg_with_ebit = 
//	(tlb_rd_tte_data_ebit & tlb_tte_vld_g)  | // tte
//        (lsu_dtlb_bypass_g & ~(phy_use_ec_asi_g & lsu_alt_space_g)) | // regular bypass 
//        (tlb_byp_asi_g & ~phy_use_ec_asi_g & lsu_alt_space_g) ; // phy_byp

assign	pg_with_ebit_m = 
        (dtlb_bypass_m & ~(phy_use_ec_asi_m & lsu_alt_space_m) & 
	(lsu_ldst_va_b39_m & ~pstate_am_m)) |
	// regular bypass // Bug 4296,5050 related.
        (dtlb_bypass_m & (phy_byp_ec_asi_m & lsu_alt_space_m)) ; // phy_byp

dff_s #(1) pg_with_ebit_stgg   (
        .din    (pg_with_ebit_m),
        .q      (pg_with_ebit_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
assign  pg_with_ebit = (tlb_rd_tte_data_ebit & tlb_tte_vld_g)  | // tte  
	                      pg_with_ebit_g;
   
//timing
//assign  spec_access_epage = 
//  ((ld_inst_vld_unflushed & nofault_asi_g & lsu_alt_space_g) |  // spec load
//  flsh_inst_g) & // flush inst
//  pg_with_ebit ; // page with side effects
////  tlb_rd_tte_data_ebit ; // page with side effects

assign  spec_access_epage_m = 
// Bug 5166
((ld_inst_vld_m & ~atomic_m) & nofault_asi_m & lsu_alt_space_m);   // spec load
dff_s #(1) spec_access_epage_stgg   (
        .din    (spec_access_epage_m),
        .q      (spec_access_epage_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
// remove flsh_inst_g ??   
//assign spec_access_epage = (spec_access_epage_g  | flsh_inst_g) & pg_with_ebit;
assign spec_access_epage = (spec_access_epage_g) & pg_with_ebit;
   

   wire quad_asi_non_ldstda_m;
   // covers regular quad asi AND binit. 
   assign quad_asi_non_ldstda_m = 
	quad_asi_m & lsu_alt_space_m & 
		((~ldst_dbl_m & ld_inst_vld_m) | // only lddbl should use
		(fp_ldst_m & (ld_inst_vld_m | st_inst_vld_m))) ; // float should not use

   wire	true_quad_non_ldda_m ; 
   // catches case where st or non-ldd uses asi
   assign true_quad_non_ldda_m =
	(quad_asi_m & ~binit_quad_asi_m) & lsu_alt_space_m & 
  ((~ldst_dbl_m & ld_inst_vld_m) | st_inst_vld_m) ;
   
wire  blk_asi_non_ldstdfa_m ;

assign  blk_asi_non_ldstdfa_m = blk_asi_m & lsu_alt_space_m & 
     ~(ldst_dbl_m & fp_ldst_m) & (ld_inst_vld_m | st_inst_vld_m) ;

// trap on illegal asi
wire  illegal_asi_trap_m, illegal_asi_trap_g, illegal_asi_trap_m_d1 ;

assign  illegal_asi_trap_m = 
((ld_inst_vld_m | st_inst_vld_m) & lsu_alt_space_m & ~recognized_asi_m) | 
((ld_inst_vld_m | st_inst_vld_m) & asi_internal_m & fp_ldst_m & lsu_alt_space_m) | // Bug 4382
blk_asi_non_ldstdfa_m |
quad_asi_non_ldstda_m |
true_quad_non_ldda_m  ; 
   
dff_s #(1) illegal_asi_trap_stgg   (
        .din    (illegal_asi_trap_m),
        .q      (illegal_asi_trap_m_d1),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   //need lsu_inst_vld_w ??
//   assign illegal_asi_trap_g = illegal_asi_trap_m_d1 & lsu_inst_vld_w;
   assign illegal_asi_trap_g = illegal_asi_trap_m_d1;
         
wire wr_to_strm_sync_m ;
//timing
//assign	wr_to_strm_sync =  	
//  strm_asi & ((ldst_va_g[7:0] == 8'hA0) | (ldst_va_g[7:0] == 8'h68)) &
//  st_inst_vld_unflushed & lsu_alt_space_g ;

assign	wr_to_strm_sync_m =  	// Bug 5742
  strm_asi_m & (lsu_ldst_va_m[7:0] == 8'hA0) & st_inst_vld_m & lsu_alt_space_m ;

/*dff #(1) wr_to_strm_sync_stgg   (
        .din    (wr_to_strm_sync_m),
        .q      (wr_to_strm_sync),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );*/
   

// HPV Changes 
// Push back into previous stage.
// qualification with hpv_priv and hpstate_en required to ensure hypervisor
// is not trying to access.
//SC2   wire hpv_priv_e;
   
//SC2 mux4ds  #(1) hpv_priv_e_mux (
//SC2        .in0    (tlu_lsu_hpv_priv[0]),
//SC2        .in1    (tlu_lsu_hpv_priv[1]),
//SC2        .in2    (tlu_lsu_hpv_priv[2]),
//SC2        .in3    (tlu_lsu_hpv_priv[3]),
//SC2        .sel0   (thread0_e),  
//SC2        .sel1   (thread1_e),
//SC2        .sel2   (thread2_e),  
//SC2        .sel3   (thread3_e),
//SC2       .dout   (hpv_priv_e)
//SC2);

//SC2   wire hpstate_en_e;
   
//SC2 mux4ds  #(1) hpstate_en_e_mux (
//SC2        .in0    (tlu_lsu_hpstate_en[0]),
//SC2        .in1    (tlu_lsu_hpstate_en[1]),
//SC2        .in2    (tlu_lsu_hpstate_en[2]),
//SC2        .in3    (tlu_lsu_hpstate_en[3]),
//SC2        .sel0   (thread0_e),  
//SC2        .sel1   (thread1_e),
//SC2        .sel2   (thread2_e),  
//SC2        .sel3   (thread3_e),
//SC2        .dout   (hpstate_en_e)
//SC2);
//SC2   wire hpstate_en_m;
   
//SC2 dff #(2) hpv_stgm (
//SC2        .din    ({hpv_priv_e, hpstate_en_e}),
//SC2        .q    	({hpv_priv_m, hpstate_en_m}),
//SC2        .clk    (clk),
//SC2        .se     (se),       .si (),          .so ()
//SC2        );
//SC2   wire hpv_priv, hpstate_en;

   
//SC2 dff #(2) hpv_stgg (
//SC2        .din    ({hpv_priv_m, hpstate_en_m}),
//SC2        .q     	({hpv_priv,   hpstate_en}),
//SC2        .clk    (clk),
//SC2        .se     (se),       .si (),          .so ()
//SC2        );

/*assign  priv_action = (ld_inst_vld_unflushed | st_inst_vld_unflushed) & ~lsu_asi_state[7] & 
      ~pstate_priv & ~(hpv_priv & hpstate_en) & lsu_alt_space_g ;*/
// Generate a stage earlier
   wire priv_action_m, priv_action;
   
assign  priv_action_m = (ld_inst_vld_m | st_inst_vld_m) & 
	((~lsu_excpctl_asi_state_m[7] & lsu_alt_space_m) |	// alt_space
	lsu_nonalt_nucl_access_m) &		// non-alt space - nucleus ctxt
      ~pstate_priv_m & ~(hpv_priv_m & hpstate_en_m) ;

/*assign  priv_action_m = (ld_inst_vld_m | st_inst_vld_m) & ~lsu_excpctl_asi_state_m[7] & 
      ~pstate_priv_m & ~(hpv_priv_m & hpstate_en_m) & lsu_alt_space_m ;*/

dff_s  pact_stgg (
        .din    (priv_action_m),
        .q    	(priv_action),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

// Take data_access exception if supervisor uses hypervisor asi  
   wire hpv_asi_range_m;
   wire spv_use_hpv_m ;
//timing
//assign  hpv_asi_range =
//                    ~lsu_asi_state[7] & (
//                         (~lsu_asi_state[6] & lsu_asi_state[5] & lsu_asi_state[4]) | // 0x3?
//                         ( lsu_asi_state[6]));  
    
assign  hpv_asi_range_m =
                         ~lsu_excpctl_asi_state_m[7] & (
                         (~lsu_excpctl_asi_state_m[6] & lsu_excpctl_asi_state_m[5] & lsu_excpctl_asi_state_m[4]) | // 0x3?
                         ( lsu_excpctl_asi_state_m[6]));                                   // 0x4?,5?,6?,7?

// Take data_access exception if supervisor uses hypervisor asi

assign  spv_use_hpv_m = (ld_inst_vld_m | st_inst_vld_m) &
                         hpv_asi_range_m &
                         pstate_priv_m & ~hpv_priv_m & lsu_alt_space_m ;

// EARLY TRAPS

// memory address not aligned
wire  qw_align_addr,blk_align_addr ;
wire  hw_align_addr,wd_align_addr,dw_align_addr;

assign  hw_align_addr = ~lsu_ldst_va_m[0] ;         // half-word addr
assign  wd_align_addr = ~lsu_ldst_va_m[1] & ~lsu_ldst_va_m[0] ;     // word addr
assign  dw_align_addr = ~lsu_ldst_va_m[2] & ~lsu_ldst_va_m[1] & ~lsu_ldst_va_m[0] ; // dw addr
assign  qw_align_addr = ~lsu_ldst_va_m[3] & ~lsu_ldst_va_m[2] & ~lsu_ldst_va_m[1] & ~lsu_ldst_va_m[0] ; // qw addr
assign  blk_align_addr = 
~lsu_ldst_va_m[5] & ~lsu_ldst_va_m[4] & ~lsu_ldst_va_m[3] & 
~lsu_ldst_va_m[2] & ~lsu_ldst_va_m[1] & ~lsu_ldst_va_m[0] ; // 64B aligned addr for block ld/st

wire  hw_size,wd_size,dw_size;

//assign  byte_size = ~ldst_sz_m[1] &  ~ldst_sz_m[0] ; // byte size    
assign  hw_size = ~ldst_sz_m[1] &  ldst_sz_m[0] ; // half-word size 
assign  wd_size =  ldst_sz_m[1] & ~ldst_sz_m[0] ; // word size
assign  dw_size =  ldst_sz_m[1] &  ldst_sz_m[0] ; // double-word size

wire  mem_addr_not_align ;
   
assign  mem_addr_not_align
  = (((hw_size & ~hw_align_addr) | // half-word check
    (wd_size & ~wd_align_addr)  | // word check
    (dw_size & ~dw_align_addr)  | // double word check
    //((quad_asi_m | binit_quad_asi_m) & lsu_alt_space_m & ldst_dbl_m & ~qw_align_addr) | // quad word check
    (blk_asi_m & lsu_alt_space_m & fp_ldst_m & ldst_dbl_m & ~blk_align_addr)) & // 64B blk ld/st check
    //(blk_asi_m & lsu_alt_space_m & blk_asi_m & ~blk_align_addr)) & // 64B blk ld/st check
    (ld_inst_vld_m | st_inst_vld_m)) |
    // check only for loads 
    (((quad_asi_m | binit_quad_asi_m) & lsu_alt_space_m & ldst_dbl_m & ~qw_align_addr) & ld_inst_vld_m) ; // quad word check

// To be removed !! Now supported for both ld and st thru unimp_asi.
//wire	blkst_cmt_daccess_excp_m ;
//assign	blkst_cmt_daccess_excp_m =
//    (blk_cmt_asi_m & lsu_alt_space_m & fp_ldst_m & ldst_dbl_m & st_inst_vld_m) ;

   wire    stdf_maddr_not_align, lddf_maddr_not_align ;

assign  stdf_maddr_not_align
    = st_inst_vld_m & fp_ldst_m & ldst_dbl_m & wd_align_addr & ~dw_align_addr 
      & ~((blk_asi_m | quad_asi_m) & lsu_alt_space_m);

assign  lddf_maddr_not_align
    = ld_inst_vld_m & fp_ldst_m & ldst_dbl_m & wd_align_addr & ~dw_align_addr 
      & ~((blk_asi_m | quad_asi_m) & lsu_alt_space_m);

// internal asi access by ld/st other than ldxa/stxa/lddfa/stdfa.
wire  asi_internal_non_xdw ;

assign  asi_internal_non_xdw 
    = (st_inst_vld_m | ld_inst_vld_m) & lsu_alt_space_m & asi_internal_m  & 
      ~(dw_size & (~ldst_dbl_m | fp_ldst_m)) ; //bug4149;


// asi related
// rd-only mmu asi requiring va decode.
wire	mmu_rd_only_asi_wva_m ;
assign	mmu_rd_only_asi_wva_m =
	((lsu_excpctl_asi_state_m[7:0]==8'h58) & (
		(lsu_ldst_va_m[7:0] == 8'h00) | 	// dtag_target
		(lsu_ldst_va_m[7:0] == 8'h20))) | 	// dsync_far
	((lsu_excpctl_asi_state_m[7:0]==8'h50) & 
		(lsu_ldst_va_m[7:0] == 8'h00)) ; 	// itag_target

wire  wr_to_rd_only_asi, rd_of_wr_only_asi, unimp_asi_used;   

assign  wr_to_rd_only_asi = 
	((mmu_rd_only_asi_wva_m |// mmu with non-unique asi
	mmu_rd_only_asi_m |	// mmu with unique asi
	rd_only_asi_m)		// non mmu
	 &  st_inst_vld_m & lsu_alt_space_m) |
	wr_to_strm_sync_m ;	// Bug 5399

assign  rd_of_wr_only_asi = wr_only_asi_m &  ld_inst_vld_m & lsu_alt_space_m ;
assign  unimp_asi_used = unimp_asi_m &  (ld_inst_vld_m | st_inst_vld_m) & lsu_alt_space_m ;

   wire asi_related_trap_m ; // asi_related_trap_g;

assign  asi_related_trap_m = wr_to_rd_only_asi | rd_of_wr_only_asi | unimp_asi_used | asi_internal_non_xdw ;

// Illegal page size for tlb fill

wire	[2:0]	pgszr_m,pgszv_m ;
dff_s #(6)   pgsz_stgm (
        .din    ({lsu_sun4r_pgsz_b2t0_e[2:0],lsu_sun4v_pgsz_b2t0_e[2:0]}),
        .q      ({pgszr_m[2:0],pgszv_m[2:0]}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire	[2:0]	pgsz_m ;

assign	pgsz_m[2:0] = lsu_sun4r_va_m_l ? pgszv_m[2:0] : pgszr_m[2:0] ;

wire	illgl_pgsz_m ;
assign	illgl_pgsz_m = 
	(~pgsz_m[2] &  pgsz_m[1] & ~pgsz_m[0]) | // 010 ; 512K
	( pgsz_m[2] & ~pgsz_m[1] & ~pgsz_m[0]) | // 100 ; 32M
	( pgsz_m[2] &  pgsz_m[1] & ~pgsz_m[0]) | // 110 ; 2G
	( pgsz_m[2] &  pgsz_m[1] &  pgsz_m[0]) ; // 111 ; 16G

wire	ifill_tlb_asi_m,dfill_tlb_asi_m ;
dff_s #(2)   idfill_stgm (
        .din    ({ifill_tlb_asi_e,dfill_tlb_asi_e}),
        .q      ({ifill_tlb_asi_m,dfill_tlb_asi_m}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign	tlb_illgl_pgsz_m = 
	(ifill_tlb_asi_m | dfill_tlb_asi_m) & st_inst_vld_m & lsu_alt_space_m & illgl_pgsz_m ;

wire  [8:0] early_ttype_m,early_ttype_g ; 
wire    early_trap_vld_m, early_trap_vld_g ;  
assign  early_trap_vld_m =  
			stdf_maddr_not_align | lddf_maddr_not_align | 
			mem_addr_not_align ;
     
wire	lsu_tlu_misalign_addr_ldst_atm_m ; 
assign  lsu_tlu_misalign_addr_ldst_atm_m = early_trap_vld_m ;

// mux select order must be maintained
assign  early_ttype_m[8:0] = 
      stdf_maddr_not_align ? 9'h036 :
        lddf_maddr_not_align ? 9'h035 : 
           mem_addr_not_align ?  9'h034 : 9'hxxx ; 
   
dff_s #(10)   etrp_stgg (
        .din    ({early_ttype_m[8:0],early_trap_vld_m}),
        .q      ({early_ttype_g[8:0],early_trap_vld_g}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire daccess_excptn_early_m, daccess_excptn_early_g ;

wire atm_access_w_nc_byp_m,atm_access_w_nc_byp_g ;
assign atm_access_w_nc_byp_m = 
atomic_m & dtlb_bypass_m & (lsu_ldst_va_b39_m & ~pstate_am_m) ; 
						//Bug 5050

dff_s   atmbyp_stgg (
        .din    (atm_access_w_nc_byp_m),
        .q      (atm_access_w_nc_byp_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign daccess_excptn_early_m =
    asi_related_trap_m | tlb_daccess_excptn_m |
    spv_use_hpv_m |  
    atm_access_w_nc_byp_m ; // Bug 4281.

dff_s  #(1) dearly_stgg (
        .din    (daccess_excptn_early_m),
        .q      (daccess_excptn_early_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

   wire daccess_excptn;
   
assign  daccess_excptn =  
    (priv_pg_usr_mode | as_if_usr_priv_pg | nfo_pg_nonnfo_asi | 
      atm_access_w_nc ) & tlb_tte_vld_g | 
      illegal_asi_trap_g | daccess_excptn_early_g | atm_access_unsup_asi | //bug4622
    	spec_access_epage ; 
 
   wire [3:0] lsu_nceen_d1;  
dff_s #(4)  nceen_d1_ff (
        .din    (ifu_lsu_nceen[3:0]),
        .q      (lsu_nceen_d1[3:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   
wire nceen_pipe_g ;
assign  nceen_pipe_g = 
  (thread0_g & lsu_nceen_d1[0]) | (thread1_g & lsu_nceen_d1[1]) |
  (thread2_g & lsu_nceen_d1[2]) | (thread3_g & lsu_nceen_d1[3]) ;

 // correctible dtlb data parity error on cam will cause dmmu miss.
// prefetch will rely on the ld_inst_vld/st_inst_vld not being asserted
// to prevent mmu_miss from being signalled if prefetch does not translate.
// Timing Change : Remove data perror from dmmu_miss ; to be treated as disrupting trap.
   wire dmmu_miss_m, dmmu_miss_m_d1;
   
assign dmmu_miss_m = 
  ~tlb_cam_hit & ~dtlb_bypass_m & 
  (ld_inst_vld_m | st_inst_vld_m) & 
  ~(lda_internal_m | sta_internal_m | early_trap_vld_m) ;

dff_s #(1)  dmmu_miss_stgg (
        .din    (dmmu_miss_m),
        .q      (dmmu_miss_m_d1),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
//need lsu_inst_vld_w ??
   wire dmmu_miss_g;
   
   assign dmmu_miss_g = dmmu_miss_m_d1 & lsu_inst_vld_w;
   

wire [8:0] dmiss_type ;
   wire    cam_real_g;
   
dff_s #(1) cam_real_stgg (
   .din (cam_real_m),
   .q   (cam_real_g),
   .clk    (clk),
   .se     (se),       .si (),          .so ()
   );  
 assign        dmiss_type[8:0] = cam_real_g ? 9'h03f : 9'h068 ;

// two wtchpt matches
//assign  lsu_tlu_ttype_m2[8:0] = 
//  early_trap_vld_g ? early_ttype_g[8:0] : 
//    priv_action ? 9'h037 : 
//      va_wtchpt_match ? 9'h062 :
//        daccess_excptn ? 9'h030 : 
//          dmmu_miss_g ? dmiss_type[8:0] :  // dmmu_miss
//            daccess_error ? 9'h032 : 
//              daccess_prot ? 9'h06c :
//	              spubyp_trap_active_g ? {3'b000,spubyp_ttype[5:0]} : // should be no other tttype to compare to. 
//                  9'bx_xxxx_xxxx ;

wire early_trap_vld_sel, priv_action_sel, va_wtchpt_match_sel, daccess_excptn_sel, dmmu_miss_sel,
     daccess_prot_sel ;

// Need to maintain this order in selects. Based on priority of traps    
   assign early_trap_vld_sel = early_trap_vld_g;
   assign priv_action_sel = ~early_trap_vld_sel & priv_action;
   assign va_wtchpt_match_sel = ~early_trap_vld_sel & ~priv_action_sel & va_wtchpt_match;
   assign daccess_excptn_sel = ~early_trap_vld_sel & ~priv_action_sel & ~va_wtchpt_match_sel &
                               daccess_excptn;
   assign dmmu_miss_sel = ~early_trap_vld_sel & ~priv_action_sel & ~va_wtchpt_match_sel &
                          ~daccess_excptn_sel & dmmu_miss_g;

   assign daccess_prot_sel = ~early_trap_vld_sel & ~priv_action_sel & ~va_wtchpt_match_sel &
                             ~daccess_excptn_sel & ~dmmu_miss_sel & daccess_prot;
   
assign  lsu_tlu_ttype_m2[8:0] =
          ({9{early_trap_vld_sel}}     &  early_ttype_g[8:0]) | 
          ({9{priv_action_sel}}        &  9'h037            ) |
          ({9{va_wtchpt_match_sel}}    &  9'h062            ) |
          ({9{daccess_excptn_sel}}     &  9'h030            ) |
          ({9{dmmu_miss_sel}}          &  dmiss_type[8:0]   ) |
          ({9{daccess_prot_sel}}       &  9'h06c            ) ;
      
assign  lsu_tlu_ttype_vld_m2 =  dmmu_miss_g | daccess_excptn | daccess_prot |
        priv_action | early_trap_vld_g  | 
	      va_wtchpt_match ;

assign lsu_ttype_vld_m2 = lsu_tlu_ttype_vld_m2 | defr_trp_taken ;  //to stb_rwctl

assign lsu_ttype_vld_m2_bf1 =    lsu_ttype_vld_m2; //to dctl, qctl1

wire	squash_priority_g ; // Bug 4678
assign	squash_priority_g = priv_action | early_trap_vld_g | va_wtchpt_match ;
   
assign  lsu_tlu_dmmu_miss_g = dmmu_miss_g & ~squash_priority_g ;
assign  lsu_tlu_priv_violtn_g = (priv_pg_usr_mode | as_if_usr_priv_pg) & tlb_tte_vld_g ; 
wire	dmmu_va_oor_g ;
assign  lsu_tlu_daccess_excptn_g = 
(daccess_excptn | dmmu_va_oor_g  // Bug 5036
| tlu_priv_trap_g) & ~squash_priority_g ;

// prioritize daccess_excptn higher than daccess_prot. This may
// be a critical path which needs to be resolved -> qual. now
// in mmu.
//assign  lsu_tlu_daccess_prot_g = daccess_prot ;
   wire daccess_prot_g;
assign  daccess_prot_g = daccess_prot & 
	~(tlu_priv_trap_g | daccess_excptn | squash_priority_g) ;   
assign  lsu_tlu_daccess_prot_g = daccess_prot & ~squash_priority_g ; // Bug 5336.
assign  lsu_tlu_priv_action_g = priv_action ; 
//assign  lsu_tlu_tte_ebit_g = tlb_rd_tte_data_ebit & tlb_tte_vld_g ;
wire	lsu_tlu_tte_ebit_g;
assign  lsu_tlu_tte_ebit_g = pg_with_ebit ;
//assign  lsu_tlu_spec_access_epage_g = spec_access_epage & tlb_tte_vld_g ; // page with side effects
wire	lsu_tlu_spec_access_epage_g ;
assign  lsu_tlu_spec_access_epage_g = spec_access_epage ; // page with side effects
wire	lsu_tlu_uncache_atomic_g;
assign  lsu_tlu_uncache_atomic_g = 
	(atm_access_w_nc & tlb_tte_vld_g) |
	(atm_access_w_nc_byp_g) ;
// Define illegal asi actions
// see sfsr description - excludes cases where 02 and 04 are set for ftype !!!
wire lsu_tlu_flt_ld_nfo_pg_g;
assign  lsu_tlu_flt_ld_nfo_pg_g = nfo_pg_nonnfo_asi & tlb_tte_vld_g ; 

wire illgl_asi_action_pre_m,illgl_asi_action_pre_g ;
assign	illgl_asi_action_pre_m = asi_related_trap_m | tlb_daccess_excptn_m | illegal_asi_trap_m | spv_use_hpv_m ; // bug 4181; //bug3660	

dff_s  illglasi_g (
        .din    (illgl_asi_action_pre_m),
        .q      (illgl_asi_action_pre_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire lsu_tlu_illegal_asi_action_g;
assign  lsu_tlu_illegal_asi_action_g = 
atm_access_unsup_asi | (illgl_asi_action_pre_g) & // Bug 4825
~(lsu_tlu_spec_access_epage_g | lsu_tlu_uncache_atomic_g) ;
//(illgl_asi_action_pre_g | (atm_access_unsup_asi)) & 
//~(lsu_tlu_spec_access_epage_g | lsu_tlu_uncache_atomic_g) ;

//=========================================================================================
//  Generate Flush Pipe
//=========================================================================================


assign	other_flush_pipe_w = 
tlu_early_flush_pipe_w | (lsu_tlu_ttype_vld_m2 & lsu_inst_vld_w) |
defr_trp_taken ;	// deferred trap.
assign	lsu_ifu_flush_pipe_w = other_flush_pipe_w ;
assign	lsu_exu_flush_pipe_w = other_flush_pipe_w ;
assign	lsu_mmu_flush_pipe_w = other_flush_pipe_w ;
assign	lsu_ffu_flush_pipe_w = other_flush_pipe_w ;


assign	lsu_flush_pipe_w = other_flush_pipe_w | ifu_lsu_flush_w ;

//assign 	lsu_qctl1_flush_pipe_w = lsu_flush_pipe_w ;
//assign 	lsu_stbctl_flush_pipe_w = lsu_flush_pipe_w ;
//assign 	lsu_stbrwctl_flush_pipe_w = lsu_flush_pipe_w ;

//=========================================================================================
//  Early Traps to SPU
//=========================================================================================

// detect st to ma/strm sync - data-access exception.
//wire	st_to_sync_dexcp_m ;
// qual with alt_space not required - spu will do it.
//assign	st_to_sync_dexcp_m = // Bug 5704
//strm_asi_m & ((lsu_ldst_va_m[7:0] == 8'ha0) | (lsu_ldst_va_m[7:0] == 8'h68)) & st_inst_vld_m ;  

wire	early_flush_m ;

assign  early_flush_m =
        (atomic_m & lsu_alt_space_m) |  // Bug 4650 - alt-space atomics should flush.
        priv_action_m           |
        early_trap_vld_m        |       // mem-addr-not-aligned.
        illegal_asi_trap_m      |       // for fp non use of internal asi.
        //st_to_sync_dexcp_m    |       // Bug 5742
        //wr_to_strm_sync_m     |       // Bug 5890 - redundant - make room.
        defr_trp_taken_m_din    |       // Bug 5890
        daccess_excptn_early_m  ;
        /*asi_related_trap_m    |       // Bug 2592
        spv_use_hpv_m       |
        wr_to_strm_sync_m;*/


dff_s  eflushspu_g (
        .din    (early_flush_m),
        .q      (lsu_spu_early_flush_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

dff_s  eflushspu2_g (
        .din    (early_flush_m),
        .q      (lsu_local_early_flush_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

dff_s  eflushtlu_g (
        .din    (early_flush_m),
        .q      (lsu_tlu_early_flush_w),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

dff_s  eflushtlu2_g (
        .din    (early_flush_m),
        .q      (lsu_tlu_early_flush2_w),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   

//=========================================================================================
//  Parity Error Checking
//=========================================================================================

// DTLB Parity Errors. 
// ASI read of Tag/Data :
//  - uncorrectible error
//  - logging occurs on read.
//  - precise trap is taken when ldxa completes if nceen set.
//  - if not set then ldxa is allowed to complete.
// CAM Read of Tag/Data :
//  - correctible if locked bit not set.
//    - takes disrupting trap later.
//  - uncorrectible if locked bit set.
//  - both are treated as precise traps.
//  - if errors not enabled, then load completes as if hit in L1.
// ** TLB error will cause a trap which will preclude concurrent dcache,dtag  **
// ** parity errors.                **

// cam related tte data parity error - error assumed correctible if locked
// bit is not set. Will cause a dmmu_miss for correction.
// qualify with cam_hit ??
wire  tte_data_perror_unc ;

assign	lsu_tlb_perr_ld_rq_kill_w =
	//tte_data_perror_corr | (tte_data_perror_unc & nceen_pipe_g) ;
	(tte_data_perror_unc & nceen_pipe_g) ;

// correctible dtlb errors no longer supported.
/*assign  tte_data_perror_corr = 
  tte_data_parity_error & ~tlb_rd_tte_data_locked & tlb_tte_vld_g & 
  (ld_inst_vld_unflushed | st_inst_vld_unflushed) & lsu_inst_vld_w ;*/

// caused for both locked and unlocked entries.
assign  tte_data_perror_unc  = 
  //tte_data_parity_error &  tlb_rd_tte_data_locked & tlb_tte_vld_g & 
  tte_data_parity_error &  tlb_tte_vld_g & 
  (ld_inst_vld_unflushed | st_inst_vld_unflushed) & lsu_inst_vld_w &
  ~lsu_flush_pipe_w ;

// Asi rd parity error detection
wire  asi_tte_data_perror,asi_tte_tag_perror ;

assign  asi_tte_data_perror =
  tte_data_parity_error & data_rd_vld_g ;
// For data tte read, both tag and data arrays are read.
// Parity error on asi read of tag should not be reported.
assign  asi_tte_tag_perror =
  tte_tag_parity_error & tag_rd_vld_g & ~data_rd_vld_g ;

wire	st_dtlb_perror ;
assign	st_dtlb_perror =   tte_data_parity_error &  tlb_tte_vld_g & 
   st_inst_vld_unflushed & lsu_inst_vld_w ;
 // ~lsu_flush_pipe_w ;

wire	cancel_err_flush ;
assign	cancel_err_flush = // Bug 5165
((priv_pg_usr_mode | nfo_pg_nonnfo_asi |
atm_access_w_nc) & tlb_tte_vld_g) | // bug6052/eco6620
spec_access_epage | 
nonwr_pg_st_access ;

// Bug 6877
wire squash_err ;
assign squash_err = 
// assume always higher priority. BE - share common terms elsewhere.
tlu_early_flush_pipe_w | defr_trp_taken | ifu_lsu_flush_w |
// isolate to daccess_excptn/daccess_prot as per Bug 5165.
(lsu_tlu_ttype_vld_m2 & ~(daccess_excptn_sel | daccess_prot_sel)) | 
((daccess_excptn_sel | daccess_prot_sel) & ~cancel_err_flush) ;
   
wire	tlb_data_su_g ;
assign	tlb_data_su_g =   st_dtlb_perror & ~atomic_g &
  ~squash_err ;
  //~(lsu_flush_pipe_w & ~cancel_err_flush) ; // Bug 6877
   
wire	ld_dtlb_perror ;
assign	ld_dtlb_perror =   tte_data_parity_error &  tlb_tte_vld_g & 
  ld_inst_vld_unflushed  & lsu_inst_vld_w &
  ~squash_err ;
   
wire  tlb_data_ue_g ;
assign  tlb_data_ue_g = 
	ld_dtlb_perror |	// synchronous to pipe - xslate ; ue is for ld now.
	lsu_tlb_asi_data_perr_g ; // asychronous to pipe - asi rd

/* Simplify for Bug 5888.
wire	st_noatom_dtlb_perr ; // atomics not represented.
assign	st_noatom_dtlb_perr = st_dtlb_perror & ~lsu_flush_pipe_w & ~atomic_g ;
wire	st_noatom_dtlb_perr_en ; 
assign	st_noatom_dtlb_perr_en = st_noatom_dtlb_perr & nceen_pipe_g ; */
wire	st_noatom_dtlb_perr_en ; 
wire	st_dtlb_perr_en ;
assign	st_noatom_dtlb_perr_en = st_dtlb_perr_en & ~atomic_g ;

// rm corr err. reporting
dff_s  #(3) terr_stgd1 (
        .din    ({tlb_data_su_g,tlb_data_ue_g,lsu_tlb_asi_tag_perr_g}),
        //.din    ({st_noatom_dtlb_perr,tlb_data_ue_g,lsu_tlb_asi_tag_perr_g}),
        .q      ({lsu_ifu_tlb_data_su,lsu_ifu_tlb_data_ue,lsu_ifu_tlb_tag_ue}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

// If st dtlb parity error detected, then need to invalidate st in stb.
// Considered unrecoverable for the thread itself.

assign	st_dtlb_perr_en = st_dtlb_perror & ~lsu_flush_pipe_w & nceen_pipe_g ;

// Kill will happen for atomics also.
//assign	lsu_exu_st_dtlb_perr_g = st_dtlb_perr_en ;
assign	lsu_exu_st_dtlb_perr_g = st_noatom_dtlb_perr_en ; // Bug 5888

assign	lsu_ffu_st_dtlb_perr_g = st_noatom_dtlb_perr_en ; // Bug 5910/ECO 6529
   
assign	lsu_st_dtlb_perr_g[0] = st_dtlb_perr_en & thread0_g ;
assign	lsu_st_dtlb_perr_g[1] = st_dtlb_perr_en & thread1_g ;
assign	lsu_st_dtlb_perr_g[2] = st_dtlb_perr_en & thread2_g ;
assign	lsu_st_dtlb_perr_g[3] = st_dtlb_perr_en & thread3_g ;

//==========================================================================
// DEFERRED TRAP DUE TO STORE 
//==========================================================================

// Cases :
// defr_trp_m=1,ifu_flush_w=0. 
//	- defr_trp is generated.
//	- next inst will not take redundant deferred trap as
//	its inst_vld will be annulled by trap flush.
// defr_trp_m=1,ifu_flush_w=1. 
//	- defr_trp is generated. TLU annuls.
//	- Other units see redundant defr_trp flush ORed with ifu_flush_w.
//	- next inst will not take redundant deferred trap as
//	its inst_vld will be annulled by ifu_flush_w .


// Log Deferred trap. Take on next available inst from thread.
// Inst vld must be qualified with flush.

wire    st_defr_trp_en0,st_defr_trp_en1,st_defr_trp_en2,st_defr_trp_en3 ;
wire    st_defr_trp0,st_defr_trp1,st_defr_trp2,st_defr_trp3 ;

assign  st_defr_trp_en0 = st_noatom_dtlb_perr_en & thread0_g ;
assign  st_defr_trp_en1 = st_noatom_dtlb_perr_en & thread1_g ;
assign  st_defr_trp_en2 = st_noatom_dtlb_perr_en & thread2_g ;
assign  st_defr_trp_en3 = st_noatom_dtlb_perr_en & thread3_g ;

wire    stpend_rst0_m,stpend_rst1_m,stpend_rst2_m,stpend_rst3_m;
wire    stpend_rst0_w,stpend_rst1_w,stpend_rst2_w,stpend_rst3_w;
wire    stpend_rst0,stpend_rst1,stpend_rst2,stpend_rst3;
assign  stpend_rst0_m = reset | 
((st_defr_trp0 | st_defr_trp_en0) & thread0_m & flush_w_inst_vld_m);
assign  stpend_rst1_m = reset | 
((st_defr_trp1 | st_defr_trp_en1) & thread1_m & flush_w_inst_vld_m);
assign  stpend_rst2_m = reset | 
((st_defr_trp2 | st_defr_trp_en2) & thread2_m & flush_w_inst_vld_m);
assign  stpend_rst3_m = reset | 
((st_defr_trp3 | st_defr_trp_en3) & thread3_m & flush_w_inst_vld_m);

// Postphone reset by a cycle - 4916
dff_s #(4)  stpend_d1 (
           .din    ({stpend_rst3_m,stpend_rst2_m,stpend_rst1_m,stpend_rst0_m}),
           .q      ({stpend_rst3_w,stpend_rst2_w,stpend_rst1_w,stpend_rst0_w}),
           .clk    (clk),
           .se     (se),       .si (),          .so ()
           );

// Prevent reset if inst is flushed by ifu.
assign	stpend_rst3 = stpend_rst3_w & ~ifu_lsu_flush_w ;
assign	stpend_rst2 = stpend_rst2_w & ~ifu_lsu_flush_w ;
assign	stpend_rst1 = stpend_rst1_w & ~ifu_lsu_flush_w ;
assign	stpend_rst0 = stpend_rst0_w & ~ifu_lsu_flush_w ;

dffre_s #(1)  deftrp_t0 (
           .din    (st_defr_trp_en0),
           .q      (st_defr_trp0),
           .rst    (stpend_rst0),
           .en     (st_defr_trp_en0),
           .clk    (clk),
           .se     (se),       .si (),          .so ()
           );

dffre_s #(1)  deftrp_t1 (
           .din    (st_defr_trp_en1),
           .q      (st_defr_trp1),
           .rst    (stpend_rst1),
           .en     (st_defr_trp_en1),
           .clk    (clk),
           .se     (se),       .si (),          .so ()
           );

dffre_s #(1)  deftrp_t2 (
           .din    (st_defr_trp_en2),
           .q      (st_defr_trp2),
           .rst    (stpend_rst2),
           .en     (st_defr_trp_en2),
           .clk    (clk),
           .se     (se),       .si (),          .so ()
           );

dffre_s #(1)  deftrp_t3 (
           .din    (st_defr_trp_en3),
           .q      (st_defr_trp3),
           .rst    (stpend_rst3),
           .en     (st_defr_trp_en3),
           .clk    (clk),
           .se     (se),       .si (),          .so ()
           );

// Deferred trap can be taken on any instruction.
// Selection is based on next thread available.

//instruction n+2, and the following...

assign  defr_trp_taken_m =
        //ifu_tlu_inst_vld_m & (
        flush_w_inst_vld_m & ( 	// <= rely of flush by defr-trp to clear
				// pended defr-trp
        (st_defr_trp0 & thread0_m) |
        (st_defr_trp1 & thread1_m) |
        (st_defr_trp2 & thread2_m) |
        (st_defr_trp3 & thread3_m)) ;

assign defr_trp_taken_byp = 
        //ifu_tlu_inst_vld_m & (
        flush_w_inst_vld_m & (
        (st_defr_trp_en0 & thread0_m) |
        (st_defr_trp_en1 & thread1_m) |
        (st_defr_trp_en2 & thread2_m) |
        (st_defr_trp_en3 & thread3_m) );
 
 
assign defr_trp_taken_m_din = defr_trp_taken_m |  defr_trp_taken_byp;
 
dff_s #(1) defr_trp_taken_stgg (
     .din (defr_trp_taken_m_din),
     .q   (defr_trp_taken),
     .clk    (clk),
     .se     (se),       .si (),          .so ()
    );
  
assign	lsu_defr_trp_taken_g = defr_trp_taken ;
assign	lsu_tlu_defr_trp_taken_g = defr_trp_taken ;
assign	lsu_mmu_defr_trp_taken_g = defr_trp_taken ;

//==========================================================================
// DSFSR/SFAR WR 
//==========================================================================



wire	[3:0]	pstate_cle,pstate_am ;
// flop'n use to prevent timing path.
dff_s #(8)  cle_stg (
        .din    ({tlu_lsu_pstate_cle[3:0],tlu_lsu_pstate_am[3:0]}),
        .q      ({pstate_cle[3:0],pstate_am[3:0]}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire	pstate_cle_m ;
assign  pstate_cle_m = 
        (thread0_m & pstate_cle[0]) |
        (thread1_m & pstate_cle[1]) |
        (thread2_m & pstate_cle[2]) |
        (thread3_m & pstate_cle[3]);

wire	[3:0]	dsfsr_asi_sel_m ;
wire	prim_asi_sel ;
assign	prim_asi_sel = 
exu_tlu_misalign_addr_jmpl_rtn_m | (lsu_tlu_nonalt_ldst_m & ~lsu_nonalt_nucl_access_m) ;
assign  dsfsr_asi_sel_m[0] =  // ASI_PRIMARY
		 prim_asi_sel & ~pstate_cle_m;
// Does asi_primary_little make sense for jmpl/return ?
assign  dsfsr_asi_sel_m[1] =  // ASI_PRIMARY_LITTLE
        	prim_asi_sel  &  pstate_cle_m;
assign  dsfsr_asi_sel_m[2] =  // ASI_NUCLEUS
        	lsu_nonalt_nucl_access_m &  ~pstate_cle_m;
assign  dsfsr_asi_sel_m[3] =  // ASI_NUCLEUS_LITTLE
        	lsu_nonalt_nucl_access_m &   pstate_cle_m;
/*assign  dsfsr_asi_sel_m[4] =  // assigned asi
        ~(exu_tlu_misalign_addr_jmpl_rtn_m | lsu_tlu_nonalt_ldst_m);*/

wire	[7:0]	asi_state_g ;
// flop'n use to prevent timing path.
dff_s #(8)  asistate_stgg (
        .din    (lsu_excpctl_asi_state_m[7:0]),
        .q      (asi_state_g[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire	[7:0]	dsfsr_asi_g ;
wire	[3:0]	dsfsr_asi_sel_g ;

/*assign dsfsr_asi_g[7:0] =(dsfsr_asi_sel_g[0] ? 8'h80 : 8'h00) |
                         (dsfsr_asi_sel_g[1] ? 8'h88 : 8'h00) |
                         (dsfsr_asi_sel_g[2] ? asi_state_g[7:0] : 8'h00);*/
// Bug 4212 - spec problem
assign dsfsr_asi_g[7:0] =(dsfsr_asi_sel_g[0] ? 8'h80 :
                         	(dsfsr_asi_sel_g[1] ? 8'h88 : 
                         		(dsfsr_asi_sel_g[2] ? 8'h04 :
                         			(dsfsr_asi_sel_g[3] ?  8'h0C : asi_state_g[7:0]))));
 
assign  pstate_am_m = 
        (thread0_m & pstate_am[0]) |
        (thread1_m & pstate_am[1]) |
        (thread2_m & pstate_am[2]) |
        (thread3_m & pstate_am[3]);

assign  dmmu_va_oor_m = exu_tlu_va_oor_m & ~pstate_am_m & lsu_memref_m & ~lsu_squash_va_oor_m;

wire	[3:0]     dsfsr_flt_vld;
dff_s #(4)  fltvld_stgd1 (
        .din    (tlu_dsfsr_flt_vld[3:0]),
        .q      (dsfsr_flt_vld[3:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

wire	dsfsr_flt_vld_m ;
assign  dsfsr_flt_vld_m = 
        (thread0_m & dsfsr_flt_vld[0]) |
        (thread1_m & dsfsr_flt_vld[1]) |
        (thread2_m & dsfsr_flt_vld[2]) |
        (thread3_m & dsfsr_flt_vld[3]);

wire	ldst_xslate_g,flsh_inst_g,dsfsr_flt_vld_g,dsfsr_wr_op_g ;
wire	misalign_addr_jmpl_rtn_g,misalign_addr_ldst_atm_g ;
wire	[2:0]	dsfsr_ctxt_sel ;

// flop flt_vld and use
dff_s #(14)  dsfsr_stgg (
        .din    ({dsfsr_asi_sel_m[3:0],dmmu_va_oor_m,// memref_m,
                lsu_tlu_xslating_ldst_m,lsu_flsh_inst_m,lsu_tlu_ctxt_sel_m[2:0],
                dsfsr_flt_vld_m,lsu_tlu_write_op_m,exu_tlu_misalign_addr_jmpl_rtn_m,
                lsu_tlu_misalign_addr_ldst_atm_m}),
        .q      ({dsfsr_asi_sel_g[3:0],dmmu_va_oor_g,ldst_xslate_g,// memref_g,
                flsh_inst_g,dsfsr_ctxt_sel[2:0],dsfsr_flt_vld_g, dsfsr_wr_op_g,
                misalign_addr_jmpl_rtn_g,misalign_addr_ldst_atm_g}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

// To be set only for data_access_exception traps - only one can be
// reported at any time.        

wire	[6:0]	dsfsr_ftype_g ;
assign  dsfsr_ftype_g[6] = 1'b0;
assign  dsfsr_ftype_g[5] = dmmu_va_oor_g | lsu_tlu_wtchpt_trp_g;
assign  dsfsr_ftype_g[4] = lsu_tlu_flt_ld_nfo_pg_g;
assign  dsfsr_ftype_g[3] = lsu_tlu_illegal_asi_action_g 
			| tlu_priv_trap_g ; // Bug 4799
//assign  dsfsr_ftype_g[3] = lsu_tlu_illegal_asi_action_g | tlu_mmu_sync_data_excp_g;
assign  dsfsr_ftype_g[2] = (lsu_tlu_uncache_atomic_g & ~atm_access_unsup_asi);
assign  dsfsr_ftype_g[1] = lsu_tlu_spec_access_epage_g;
assign  dsfsr_ftype_g[0] = lsu_tlu_priv_violtn_g;

wire	dsfsr_side_effect_g ;
assign  dsfsr_side_effect_g = lsu_tlu_tte_ebit_g & (ldst_xslate_g | flsh_inst_g);

// Fault Type based on Priority Encoding of Traps
wire	[6:0]	dsfsr_pe_ftype_g ;
wire	dsfsr_ftype_zero ;
// Is this needed ? Doesn't it default to zero ?
assign  dsfsr_pe_ftype_g[6:0] = dsfsr_ftype_zero ? 7'h00 : dsfsr_ftype_g[6:0]; 

// set to 11 when the access does not have a translating asi.
wire	[1:0]	dsfsr_ctxt_g ;
assign  dsfsr_ctxt_g[1:0] =
        dsfsr_ctxt_sel[0] ? 2'b00 :     
                dsfsr_ctxt_sel[1] ? 2'b01 :     
                        dsfsr_ctxt_sel[2] ? 2'b10 : 2'b11;      


assign  lsu_dsfsr_din_g[23:0] =
        {dsfsr_asi_g[7:0],
        2'b0,
        dsfsr_pe_ftype_g[6:0],
        dsfsr_side_effect_g,
        dsfsr_ctxt_g[1:0],
	1'b0, // Bug 3323 - Arch change
        //pstate_priv,  
        dsfsr_wr_op_g,  // pipe
        dsfsr_flt_vld_g,
        1'b1};

// This is going to be a critical path !!!
// Assume that traps in front-end cause instructions to be no`oped
// further down the pipeline. Thus there is no need to qualify writes
// to dsfsr with writes to isfsr
wire	dsfsr_trp_wr_g ;
wire	dsfsr_trp_wr_pre_m,dsfsr_trp_wr_pre_g ;


assign	dsfsr_trp_wr_pre_m =
	spv_use_hpv_m	| // Bug 3254 ; add new data-access-excp
	// spec_access_epage_m | // Bug 3515
	priv_action_m | 
	exu_tlu_misalign_addr_jmpl_rtn_m |
	lsu_tlu_misalign_addr_ldst_atm_m ;

dff_s   dsfsrtrg_stgg (
        .din    (dsfsr_trp_wr_pre_m),
        .q      (dsfsr_trp_wr_pre_g),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign  dsfsr_trp_wr_g = 
        ((lsu_tlu_priv_violtn_g  | 
	lsu_tlu_spec_access_epage_g |	// Bug 3515 - uncomment out.
        lsu_tlu_uncache_atomic_g | lsu_tlu_illegal_asi_action_g |
        lsu_tlu_flt_ld_nfo_pg_g  | dmmu_va_oor_g) |     // data access exceptions                       
        daccess_prot |	// daccess_excptn not excluded.
        lsu_tlu_wtchpt_trp_g     |      // watchpoint trap      
	dsfsr_trp_wr_pre_g |
	tlu_priv_trap_g 		// scratchpad/queue daccess;Bug 4799
        ) &
        lsu_inst_vld_w & ~(ifu_lsu_flush_w | defr_trp_taken) ; // Bug 4444,5196

assign  dsfsr_ftype_zero = 
        daccess_prot_g | lsu_tlu_priv_action_g | lsu_tlu_wtchpt_trp_g |
        misalign_addr_jmpl_rtn_g | misalign_addr_ldst_atm_g;

// terms below can be made common. (grape)
assign  lsu_dmmu_sfsr_trp_wr[0] = dsfsr_trp_wr_g & thread0_g;
assign  lsu_dmmu_sfsr_trp_wr[1] = dsfsr_trp_wr_g & thread1_g;
assign  lsu_dmmu_sfsr_trp_wr[2] = dsfsr_trp_wr_g & thread2_g;
assign  lsu_dmmu_sfsr_trp_wr[3] = dsfsr_trp_wr_g & thread3_g; 

//==========================================================================
// Exception Handling End
//==========================================================================

endmodule // lsu_dctl1

