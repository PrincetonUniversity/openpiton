// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: lsu_dctldp.v
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

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO 
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module lsu_dctldp (/*AUTOARG*/
   // Outputs
   so, asi_d, lsu_excpctl_asi_state_m, lsu_dctl_asi_state_m, 
   lsu_spu_asi_state_e, lsu_tlu_rsr_data_e, lsu_asi_state, 
   lsu_asi_reg0, lsu_asi_reg1, lsu_asi_reg2, lsu_asi_reg3, 
   lsu_t0_pctxt_state, lsu_t1_pctxt_state, lsu_t2_pctxt_state, 
   lsu_t3_pctxt_state, lsu_tlu_dside_ctxt_m, lsu_tlu_pctxt_m, 
   tlb_ctxt, lsu_pid_state0, lsu_pid_state1, lsu_pid_state2, 
   lsu_pid_state3, lsu_dtlb_cam_pid_e, bist_ctl_reg_in, 
   lsu_ifu_direct_map_l1, dc_direct_map, lsu_iobrdge_rd_data, 
   lsu_ictag_mrgn, lsu_dctag_mrgn, lsu_mamem_mrgn, lsu_dtlb_mrgn, 
   lsu_itlb_mrgn, lsu_local_ldxa_data_g, lsu_ldst_va_m, 
   lsu_ldst_va_m_buf, lsu_tlu_ldst_va_m, lsu_tlu_tlb_asi_state_m, 
   lsu_ifu_asi_state, lsu_tlu_tlb_ldst_va_m, lsu_tlu_tlb_dmp_va_m, 
   lsu_ifu_asi_addr, lsu_diagnstc_wr_addr_e, 
   lsu_diagnstc_dc_prty_invrt_e, lsu_ifu_err_addr, 
   va_wtchpt_msk_match_m, lsu_ldst_va_g, lsu_dp_ctl_reg0, 
   lsu_dp_ctl_reg1, lsu_dp_ctl_reg2, lsu_dp_ctl_reg3, 
   lsu_diagnstc_wr_way_e, lsu_diag_va_prty_invrt, 
   // Inputs
   rclk, rst_l, si, se, async_tlb_index, lsu_dtlb_dmp_vld_e, 
   tlu_lsu_asi_m, exu_tlu_wsr_data_m, tlu_lsu_asi_update_g, 
   asi_state_wr_thrd, ifu_lsu_imm_asi_d, thread0_d, thread1_d, 
   thread2_d, thread3_d, ifu_lsu_imm_asi_vld_d, lsu_err_addr_sel, 
   pctxt_state_wr_thrd, sctxt_state_wr_thrd, st_rs3_data_g, 
   thread0_ctxt, thread1_ctxt, thread2_ctxt, thread3_ctxt, 
   thread_pctxt, thread_sctxt, thread_actxt, thread_default, 
   tlu_dtlb_tte_tag_w2, tlu_dtlb_tte_tag_b58t56, thread0_g, 
   thread1_g, thread2_g, thread3_g, pid_state_wr_en, thread0_e, 
   thread1_e, thread2_e, thread3_e, thread0_m, thread1_m, thread2_m, 
   thread3_m, lsu_iobrdge_wr_data, dfture_tap_wr_mx_sel, lctl_rst, 
   lsu_ctl_state_wr_en, lsuctl_ctlbits_wr_en, dfture_tap_rd_en, 
   bist_tap_wr_en, bist_ctl_reg_out, mrgn_tap_wr_en, ldiagctl_wr_en, 
   misc_ctl_sel_din, lsu_asi_sel_fmx1, lsu_asi_sel_fmx2, 
   exu_lsu_ldst_va_e, tlb_access_en0_g, tlb_access_en1_g, 
   tlb_access_en2_g, tlb_access_en3_g, tlb_access_sel_thrd0, 
   tlb_access_sel_thrd1, tlb_access_sel_thrd2, 
   tlb_access_sel_default, mrgnctl_wr_en, lsu_dcfill_addr_e, 
   lsu_error_pa_m, stb_ldst_byte_msk, lsu_diagnstc_va_sel, 
   rst_tri_en,

   // trin
   // core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data
   );

   input rclk;
   input rst_l;
   input si;
   input se;
//   input tmb_l ;

   output so;

//   input	async_error_sel ;
   input [5:0]	async_tlb_index ;

   input	lsu_dtlb_dmp_vld_e ;
   
   input [7:0] tlu_lsu_asi_m;
   input [7:0] exu_tlu_wsr_data_m;
   input       tlu_lsu_asi_update_g;
   input [3:0] asi_state_wr_thrd;
   input [7:0] ifu_lsu_imm_asi_d;
   input       thread0_d;
   input       thread1_d;
   input       thread2_d;
   input       thread3_d;
   input       ifu_lsu_imm_asi_vld_d;

   input [2:0]	lsu_err_addr_sel ;
   
   output [7:0] asi_d;
   output [7:0] lsu_excpctl_asi_state_m;
   output [7:0] lsu_dctl_asi_state_m;
     
   output [7:0] lsu_spu_asi_state_e;
   output [7:0] lsu_tlu_rsr_data_e;

   output  [7:0]   lsu_asi_state ;   // ASI State + imm asi
   output  [7:0]   lsu_asi_reg0 ;    // ASI State Register.
   output  [7:0]   lsu_asi_reg1 ;    // ASI State Register.
   output  [7:0]   lsu_asi_reg2 ;    // ASI State Register.
   output  [7:0]   lsu_asi_reg3 ;    // ASI State Register.

input  [3:0] pctxt_state_wr_thrd ;
input  [3:0] sctxt_state_wr_thrd ;   
//input [63:0] st_rs3_data_g;
//input [59:56] st_rs3_data_g_59_56;
//input [51:48] st_rs3_data_g_51_48;
//input [43:40] st_rs3_data_g_43_40;
input [32:0]  st_rs3_data_g;

   input     thread0_ctxt;  //should be one hot, force default
   input     thread1_ctxt;
   input     thread2_ctxt;
   input     thread3_ctxt;

   input     thread_pctxt;
   input     thread_sctxt;
//   input     thread_nctxt;	
   input     thread_actxt;
   input     thread_default;
   
input [12:0]  tlu_dtlb_tte_tag_w2 ;
input [2:0]	tlu_dtlb_tte_tag_b58t56 ;

   input       thread0_g;
   input       thread1_g;
   input       thread2_g;
   input       thread3_g;
 
output  [12:0]    lsu_t0_pctxt_state ;  // primary ctxt - thread0
output  [12:0]    lsu_t1_pctxt_state ;  // primary ctxt - thread1
output  [12:0]    lsu_t2_pctxt_state ;  // primary ctxt - thread2
output  [12:0]    lsu_t3_pctxt_state ;  // primary ctxt - thread3

output  [12:0]    lsu_tlu_dside_ctxt_m ;
output  [12:0]    lsu_tlu_pctxt_m ;
output  [12:0]    tlb_ctxt ;    // ctxt for xslate or demap.

   input [3:0]    pid_state_wr_en;
   input          thread0_e;
   input          thread1_e;
   input          thread2_e;
   input          thread3_e;

   input          thread0_m;
   input          thread1_m;
   input          thread2_m;
   input          thread3_m;
   
output	[2:0]	lsu_pid_state0 ;	// pid thread0 ; global use
output	[2:0]	lsu_pid_state1 ;	// pid thread1 ; global use
output	[2:0]	lsu_pid_state2 ;	// pid thread2 ; global use
output	[2:0]	lsu_pid_state3 ;	// pid thread3 ; global use
output	[2:0] lsu_dtlb_cam_pid_e ;

input [27:0]  lsu_iobrdge_wr_data ;
   input      dfture_tap_wr_mx_sel;
   input [3:0] lctl_rst;
   input [3:0] lsu_ctl_state_wr_en;
   input [3:0] lsuctl_ctlbits_wr_en;
   input [3:0] dfture_tap_rd_en;

   input      bist_tap_wr_en;
//  input      bistctl_wr_en;
   output [6:0] bist_ctl_reg_in;
   
   input [`L1D_ADDRESS_HI:0] bist_ctl_reg_out;
   
   input      mrgn_tap_wr_en;

   output		lsu_ifu_direct_map_l1 ;	// l1 icache set to direct map.
   output   dc_direct_map;
   input    ldiagctl_wr_en;

   output [43:0] lsu_iobrdge_rd_data ;

   input [3:0]  misc_ctl_sel_din ;  //should force default

output	[3:0]	lsu_ictag_mrgn ;	// icache tag self-timed margin control
output	[`L1D_WAY_ARRAY_MASK]	lsu_dctag_mrgn ;	// dcache tag self-timed margin control

output	[3:0]	lsu_mamem_mrgn ;	// mamem self-timed margin control
output	[7:0]	lsu_dtlb_mrgn ;	  // dtlb self-timed margin control
output	[7:0]	lsu_itlb_mrgn ;	  // itlb self-timed margin control

output  [47:0]    lsu_local_ldxa_data_g ;  // local ldxa data

//   input          misc_asi_rd_en;
//input [47:3]  lsu_va_wtchpt_addr ;
   input [2:0] lsu_asi_sel_fmx1;
   input [2:0] lsu_asi_sel_fmx2;

input  [47:0]  exu_lsu_ldst_va_e;      // sub VA for mem-ref (src-execute)

output [12:0]  lsu_ldst_va_m;  
output [47:0]  lsu_ldst_va_m_buf;  
output [9:0]  lsu_tlu_ldst_va_m;  

   input       tlb_access_en0_g;
   input       tlb_access_en1_g;
   input       tlb_access_en2_g;
   input       tlb_access_en3_g;

output  [7:0]   lsu_tlu_tlb_asi_state_m ;
output  [7:0]   lsu_ifu_asi_state;  

   input tlb_access_sel_thrd0;
   input tlb_access_sel_thrd1;
   input tlb_access_sel_thrd2;
   input tlb_access_sel_default;

output  [`L1D_ADDRESS_HI:0]   lsu_tlu_tlb_ldst_va_m ;
output  [47:13]         lsu_tlu_tlb_dmp_va_m ;
output  [17:0]    lsu_ifu_asi_addr ;

   output [`L1D_ADDRESS_HI:0]  lsu_diagnstc_wr_addr_e ;
   output [7:0]   lsu_diagnstc_dc_prty_invrt_e ;

///  output [13:11] lsu_lngltncy_ldst_va;
   
   input mrgnctl_wr_en;
input [`L1D_ADDRESS_HI:4]  lsu_dcfill_addr_e ;         // data cache fill addr
input [28:0]  lsu_error_pa_m ;            // error phy addr
//   input      sync_error_sel;
   output  [47:4]    lsu_ifu_err_addr ;    // error address

input [7:0]   stb_ldst_byte_msk ;
   output va_wtchpt_msk_match_m;

   output [7:0]  lsu_ldst_va_g;

   output [5:0] lsu_dp_ctl_reg0;
   output [5:0] lsu_dp_ctl_reg1;
   output [5:0] lsu_dp_ctl_reg2;
   output [5:0] lsu_dp_ctl_reg3;

   input   [3:0] lsu_diagnstc_va_sel ;
   output  [`L1D_WAY_MASK] lsu_diagnstc_wr_way_e ;
   output	 lsu_diag_va_prty_invrt ;
   input   rst_tri_en;

// trin
   // output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;

   
wire  [12:0]  pctxt_state;
wire  [12:0]  sctxt_state;
wire  [2:0]   pid_state;

reg   [13:0] lsu_ctl_reg0;
reg   [13:0] lsu_ctl_reg1;
reg   [13:0] lsu_ctl_reg2;
reg   [13:0] lsu_ctl_reg3;

wire   [13:0] lsu_ctl_reg;
   
   wire       clk;
   assign     clk = rclk;

/********************* ASI state ***********************/   
   wire [7:0]  tlu_lsu_asi_g;
   
dff_s #(8) asi_stgw (
        .din    (tlu_lsu_asi_m[7:0]),
        .q      (tlu_lsu_asi_g[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );
   
   wire [7:0]  exu_tlu_wsr_data_w;
   
dff_s #(8) ff_wsr_data_w (
        .din    (exu_tlu_wsr_data_m[7:0]),
        .q      (exu_tlu_wsr_data_w[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

   wire [7:0]  asi_wr_din;
   
assign  asi_wr_din[7:0] = tlu_lsu_asi_update_g ? tlu_lsu_asi_g[7:0] : exu_tlu_wsr_data_w[7:0] ;   

// ASI - Thread0
   wire [7:0] asi_state0;
   wire [7:0] lsu_asi_reg0;

   wire       asi0_state_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf asi0_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~asi_state_wr_thrd[0]),
                .tmb_l  (~se),
                .clk    (asi0_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(8) asi0_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state0[7:0]),
        .en (~(~asi_state_wr_thrd[0])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(8) asi0_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state0[7:0]),
        .clk    (asi0_state_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

assign  lsu_asi_reg0[7:0] = asi_state0[7:0] ; 

// ASI - Thread1
   wire [7:0] asi_state1;
   wire [7:0] lsu_asi_reg1;

   wire       asi1_state_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf asi1_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~asi_state_wr_thrd[1]),
                .tmb_l  (~se),
                .clk    (asi1_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(8) asi1_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state1[7:0]),
        .en (~(~asi_state_wr_thrd[1])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(8) asi1_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state1[7:0]),
        .clk    (asi1_state_clk),
        .se     (se),       .si (),          .so ()
        );
`endif
   
assign  lsu_asi_reg1[7:0] = asi_state1[7:0] ; 

// ASI - Thread2
   wire [7:0] asi_state2;
   wire [7:0] lsu_asi_reg2;

   wire       asi2_state_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf asi2_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~asi_state_wr_thrd[2]),
                .tmb_l  (~se),
                .clk    (asi2_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(8) asi2_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state2[7:0]),
        .en (~(~asi_state_wr_thrd[2])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(8) asi2_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state2[7:0]),
        .clk    (asi2_state_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

assign  lsu_asi_reg2[7:0] = asi_state2[7:0] ; 

// ASI - Thread3
   wire [7:0] asi_state3;
   wire [7:0] lsu_asi_reg3;
   
   wire       asi3_state_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf asi3_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~asi_state_wr_thrd[3]),
                .tmb_l  (~se),
                .clk    (asi3_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(8) asi3_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state3[7:0]),
        .en (~(~asi_state_wr_thrd[3])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(8) asi3_state_ff (
        .din    (asi_wr_din[7:0]),
        .q      (asi_state3[7:0]),
        .clk    (asi3_state_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

assign  lsu_asi_reg3[7:0] = asi_state3[7:0] ; 

   wire [7:0] asi_state;
   
mux4ds #(8) lsu_asi_mux_d (
   .in0 (asi_state0[7:0]),                        
   .in1 (asi_state1[7:0]),                        
   .in2 (asi_state2[7:0]),                        
   .in3 (asi_state3[7:0]),                        
   .sel0(thread0_d),
   .sel1(thread1_d),
   .sel2(thread2_d),
   .sel3(thread3_d),
   .dout(asi_state[7:0])                        
   );

assign  asi_d[7:0] = ifu_lsu_imm_asi_vld_d ? 
                     ifu_lsu_imm_asi_d[7:0] : asi_state[7:0];

wire  [7:0] asi_state_e, asi_state_m ;
   
dff_s #(8) asistate_stge (
        .din    (asi_d[7:0]),
        .q      (asi_state_e[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

// Make rsr_data independent of imm_asi.
dff_s #(8) rdasi_stge (
        .din    (asi_state[7:0]),
        .q      (lsu_tlu_rsr_data_e[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

//assign lsu_tlu_rsr_data_e[7:0] =  asi_state_e[7:0] ;

assign  lsu_spu_asi_state_e[7:0] = asi_state_e[7:0] ;

dff_s #(8) asistate_stgm (
        .din    (asi_state_e[7:0]),
        .q      (asi_state_m[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign  lsu_excpctl_asi_state_m[7:0] = asi_state_m[7:0] ;
assign  lsu_dctl_asi_state_m[7:0]    = asi_state_m[7:0] ;

   wire [7:0] lsu_asi_state;
dff_s #(8) asistate_stgg (
        .din    (asi_state_m[7:0]),
        .q      (lsu_asi_state[7:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );


/*********************context************************/
wire  [12:0]  pctxt_state0,pctxt_state1;
wire  [12:0]  pctxt_state2,pctxt_state3;
wire  [12:0]  sctxt_state0,sctxt_state1;
wire  [12:0]  sctxt_state2,sctxt_state3;

// PRIMARY CONTEXT - Thread0
   wire       pctxt0_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pctxt0_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~pctxt_state_wr_thrd[0]),
                .tmb_l  (~se),
                .clk    (pctxt0_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) pctxt_state0_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state0[12:0]),
        .en (~(~pctxt_state_wr_thrd[0])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) pctxt_state0_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state0[12:0]),
        .clk    (pctxt0_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign  lsu_t0_pctxt_state[12:0] = pctxt_state0[12:0] ;

// PRIMARY CONTEXT - Thread1
   wire       pctxt1_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pctxt1_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~pctxt_state_wr_thrd[1]),
                .tmb_l  (~se),
                .clk    (pctxt1_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) pctxt_state1_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state1[12:0]),
        .en (~(~pctxt_state_wr_thrd[1])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) pctxt_state1_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state1[12:0]),
        .clk    (pctxt1_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign  lsu_t1_pctxt_state[12:0] = pctxt_state1[12:0] ;

// PRIMARY CONTEXT - Thread2
   wire       pctxt2_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pctxt2_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~pctxt_state_wr_thrd[2]),
                .tmb_l  (~se),
                .clk    (pctxt2_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) pctxt_state2_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state2[12:0]),
        .en (~(~pctxt_state_wr_thrd[2])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) pctxt_state2_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state2[12:0]),
        .clk    (pctxt2_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign  lsu_t2_pctxt_state[12:0] = pctxt_state2[12:0] ;

// PRIMARY CONTEXT - Thread3
   wire       pctxt3_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pctxt3_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~pctxt_state_wr_thrd[3]),
                .tmb_l  (~se),
                .clk    (pctxt3_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) pctxt_state3_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state3[12:0]),
        .en (~(~pctxt_state_wr_thrd[3])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) pctxt_state3_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (pctxt_state3[12:0]),
        .clk    (pctxt3_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign  lsu_t3_pctxt_state[12:0] = pctxt_state3[12:0] ;
   
// SECONDARY CONTEXT - Thread0
   wire       sctxt0_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf sctxt0_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~sctxt_state_wr_thrd[0]),
                .tmb_l  (~se),
                .clk    (sctxt0_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) sctxt_state0_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state0[12:0]),
        .en (~(~sctxt_state_wr_thrd[0])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) sctxt_state0_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state0[12:0]),
        .clk    (sctxt0_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

// SECONDARY CONTEXT - Thread1
   wire       sctxt1_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf sctxt1_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~sctxt_state_wr_thrd[1]),
                .tmb_l  (~se),
                .clk    (sctxt1_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) sctxt_state1_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state1[12:0]),
        .en (~(~sctxt_state_wr_thrd[1])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) sctxt_state1_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state1[12:0]),
        .clk    (sctxt1_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

// SECONDARY CONTEXT - Thread2
   wire       sctxt2_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf sctxt2_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~sctxt_state_wr_thrd[2]),
                .tmb_l  (~se),
                .clk    (sctxt2_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) sctxt_state2_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state2[12:0]),
        .en (~(~sctxt_state_wr_thrd[2])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) sctxt_state2_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state2[12:0]),
        .clk    (sctxt2_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

// SECONDARY CONTEXT - Thread3
   wire       sctxt3_state_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf sctxt3_state_clkbuf (
                .rclk   (clk),
                .enb_l  (~sctxt_state_wr_thrd[3]),
                .tmb_l  (~se),
                .clk    (sctxt3_state_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(13) sctxt_state3_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state3[12:0]),
        .en (~(~sctxt_state_wr_thrd[3])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(13) sctxt_state3_ff (
        .din    (st_rs3_data_g[12:0]),
        .q      (sctxt_state3[12:0]),
        .clk    (sctxt3_state_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

wire  [12:0]  current_pctxt_e,current_sctxt_e ;
wire  [12:0]  current_pctxt_m ;

wire  [12:0]  current_ctxt_e,current_ctxt_m ;

mux4ds #(13) current_pctxt_e_mux (
   .in0 (pctxt_state0[12:0]),                        
   .in1 (pctxt_state1[12:0]),                        
   .in2 (pctxt_state2[12:0]),                        
   .in3 (pctxt_state3[12:0]),                        
   .sel0(thread0_ctxt),
   .sel1(thread1_ctxt),
   .sel2(thread2_ctxt),
   .sel3(thread3_ctxt),
   .dout(current_pctxt_e[12:0])                        
   );

mux4ds #(13) current_sctxt_e_mux (
   .in0 (sctxt_state0[12:0]),                        
   .in1 (sctxt_state1[12:0]),                        
   .in2 (sctxt_state2[12:0]),                        
   .in3 (sctxt_state3[12:0]),                        
   .sel0(thread0_ctxt),
   .sel1(thread1_ctxt),
   .sel2(thread2_ctxt),
   .sel3(thread3_ctxt),
   .dout(current_sctxt_e[12:0])                        
   );
 
   wire [12:0] tlb_actxt;
  
assign tlb_actxt[12:0] =
       {tlu_dtlb_tte_tag_w2[12:0]} ; 

   wire [3:0] thread_sel;
   assign     thread_sel[0]= thread_pctxt   & ~rst_tri_en;
   assign     thread_sel[1]= thread_sctxt   & ~rst_tri_en;
   assign     thread_sel[2]= thread_actxt   & ~rst_tri_en;
   assign     thread_sel[3]= thread_default |  rst_tri_en;

// change buffer to nand /nor
   
mux4ds #(13) tlb_ctxt_mux (
   .in0 (current_pctxt_e[12:0]),                        
   .in1 (current_sctxt_e[12:0]),                        
   .in2 (tlb_actxt[12:0]),                        
   .in3 ({13'b0}),
   .sel0(thread_sel[0]),
   .sel1(thread_sel[1]),
   .sel2(thread_sel[2]),
   .sel3(thread_sel[3]),
   .dout(tlb_ctxt[12:0])                        
   );

assign  current_ctxt_e[12:0] = tlb_ctxt[12:0] ;

//Bug 3094
wire	[12:0]	itrap_pctxt_e ;
mux4ds #(13) itrap_pctxt_e_mux (
   .in0 (pctxt_state0[12:0]),                        
   .in1 (pctxt_state1[12:0]),                        
   .in2 (pctxt_state2[12:0]),                        
   .in3 (pctxt_state3[12:0]),                        
   .sel0(thread0_e),
   .sel1(thread1_e),
   .sel2(thread2_e),
   .sel3(thread3_e),
   .dout(itrap_pctxt_e[12:0])                        
   );

// Create current ctxt for tlu purpose.
dff_s #(26) cctxt_stgm (
        .din    ({current_ctxt_e[12:0],itrap_pctxt_e[12:0]}),
        .q      ({current_ctxt_m[12:0],current_pctxt_m[12:0]}),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        );

assign  lsu_tlu_dside_ctxt_m[12:0] = current_ctxt_m[12:0] ;
assign  lsu_tlu_pctxt_m[12:0] = current_pctxt_m[12:0] ;

   // Primary Context 
mux4ds #(13)     pctxt_mx (
        .in0    (pctxt_state0[12:0]),
        .in1    (pctxt_state1[12:0]),
        .in2    (pctxt_state2[12:0]),
        .in3    (pctxt_state3[12:0]),
        .sel0   (thread0_g),
        .sel1   (thread1_g),
        .sel2   (thread2_g),
        .sel3   (thread3_g),
        .dout   (pctxt_state[12:0])
        );

// Secondary Context 
mux4ds #(13)     sctxt_mx (
        .in0    (sctxt_state0[12:0]),
        .in1    (sctxt_state1[12:0]),
        .in2    (sctxt_state2[12:0]),
        .in3    (sctxt_state3[12:0]),
        .sel0   (thread0_g),
        .sel1   (thread1_g),
        .sel2   (thread2_g),
        .sel3   (thread3_g),
        .dout   (sctxt_state[12:0])
        );

/********************partition id********************/
 // ** Reset put in temporarily to ensure pid is correctly initialized **
// ** Env/diags should be set-up to initialize pid correctly **
wire	[2:0]	pid_state0, pid_state1, pid_state2, pid_state3;

// Thread0
   wire [2:0] pid_state_din;
   assign     pid_state_din[2:0] = {3{rst_l}} & st_rs3_data_g[2:0];

   wire       pid_state0_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pid_state0_clkbuf (
                .rclk   (clk),
                .enb_l  (~pid_state_wr_en[0]),
                .tmb_l  (~se),
                .clk    (pid_state0_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(3) pid0_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state0[2:0]),
        .en (~(~pid_state_wr_en[0])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(3) pid0_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state0[2:0]),
        .clk    (pid_state0_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign	lsu_pid_state0[2:0] = pid_state0[2:0] ;

// Thread1
   wire       pid_state1_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pid_state1_clkbuf (
                .rclk   (clk),
                .enb_l  (~pid_state_wr_en[1]),
                .tmb_l  (~se),
                .clk    (pid_state1_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(3) pid1_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state1[2:0]),
        .en (~(~pid_state_wr_en[1])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(3) pid1_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state1[2:0]),
        .clk    (pid_state1_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign	lsu_pid_state1[2:0] = pid_state1[2:0] ;

// Thread2
   wire       pid_state2_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pid_state2_clkbuf (
                .rclk   (clk),
                .enb_l  (~pid_state_wr_en[2]),
                .tmb_l  (~se),
                .clk    (pid_state2_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(3) pid2_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state2[2:0]),
        .en (~(~pid_state_wr_en[2])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(3) pid2_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state2[2:0]),
        .clk    (pid_state2_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign	lsu_pid_state2[2:0] = pid_state2[2:0] ;

// Thread3
   wire       pid_state3_clk;

`ifdef FPGA_SYN_CLK_EN
`else
clken_buf pid_state3_clkbuf (
                .rclk   (clk),
                .enb_l  (~pid_state_wr_en[3]),
                .tmb_l  (~se),
                .clk    (pid_state3_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(3) pid3_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state3[2:0]),
        .en (~(~pid_state_wr_en[3])), .clk(clk),
        .se     (se),       .si (),          .so ()
        );  
`else
dff_s #(3) pid3_state (
        .din    (pid_state_din[2:0]),
        .q      (pid_state3[2:0]),
        .clk    (pid_state3_clk),
        .se     (se),       .si (),          .so ()
        );  
`endif

assign	lsu_pid_state3[2:0] = pid_state3[2:0] ;

wire [2:0] cam_pid_e ;
// Hypervisor related cam inputs
mux4ds #(3)     cam_pid_mx (
        .in0    (pid_state0[2:0]),
        .in1    (pid_state1[2:0]),
        .in2    (pid_state2[2:0]),
        .in3    (pid_state3[2:0]),
        .sel0   (thread0_e),
        .sel1   (thread1_e),
        .sel2   (thread2_e),
        .sel3   (thread3_e),
        .dout   (cam_pid_e[2:0])
        );

assign  lsu_dtlb_cam_pid_e[2:0] =
  lsu_dtlb_dmp_vld_e ? tlu_dtlb_tte_tag_b58t56[2:0] : cam_pid_e[2:0] ;
  //thread_actxt ? tlu_dtlb_tte_tag_b58t56[2:0] : cam_pid_e[2:0] ;
   
mux4ds #(3)     pid_mx (
        .in0    (pid_state0[2:0]),
        .in1    (pid_state1[2:0]),
        .in2    (pid_state2[2:0]),
        .in3    (pid_state3[2:0]),
        .sel0   (thread0_g),
        .sel1   (thread1_g),
        .sel2   (thread2_g),
        .sel3   (thread3_g),
        .dout   (pid_state[2:0])
        );

  
/***********************lsu ctl reg********************/
// Contents of lsu_ctl_reg
/*
  IC. I-Cache Enable. b0           b0
  DC. D-Cache Enable. b1           b1
  IM. I-MMU Enable.   b2           b2
  DM. D-MMU Enable.   b3           b3
  FM. Parity Mask.(delete) b4-19   --    
  Reserved    b20                  --
  VW. VA Wtchpt Wr  b21            b4
  VR. VA Wtchpt Rd  b22            b5
  PW. PA Wtchpt Wr  b23            --
  PR. PA Wtchpt Rd  b24            --
  VM. VA Wtchpt BMask   b25-32     b6-13
  PM. PA Wtchpt BMask   b33-40     --
*/

   assign lsu_dp_ctl_reg0[5:0] = lsu_ctl_reg0[5:0];
   assign lsu_dp_ctl_reg1[5:0] = lsu_ctl_reg1[5:0];
   assign lsu_dp_ctl_reg2[5:0] = lsu_ctl_reg2[5:0];
   assign lsu_dp_ctl_reg3[5:0] = lsu_ctl_reg3[5:0];
   
wire  [9:0]  lsu_ctl_reg_din ;

//assign  lsu_ctl_reg_din[19:0] = st_rs3_data_g[40:21] ;
   wire   lsu_ctl_reg_vw_din, lsu_ctl_reg_vr_din;
   wire [7:0] lsu_ctl_reg_vm_din;
   
assign  lsu_ctl_reg_vw_din = st_rs3_data_g[21] ;
assign  lsu_ctl_reg_vr_din = st_rs3_data_g[22] ;
assign  lsu_ctl_reg_vm_din[7:0] = st_rs3_data_g[32:25];

assign lsu_ctl_reg_din[9:0] = {lsu_ctl_reg_vm_din[7:0],
                               lsu_ctl_reg_vr_din,
                               lsu_ctl_reg_vw_din};
   
   
wire [3:0]  lsuctl_ctlbits_wr_data ;  

assign  lsuctl_ctlbits_wr_data[3:0] =
          dfture_tap_wr_mx_sel ? lsu_iobrdge_wr_data[3:0] : st_rs3_data_g[3:0] ;

// Thread0
   wire [9:0] lsu_ctl_reg0_din;
   assign      lsu_ctl_reg0_din[9:0] = {10{~lctl_rst[0]}} & lsu_ctl_reg_din[9:0];
   wire [3:0]  lsuctl_ctlbits0_wr_data_din;
   assign      lsuctl_ctlbits0_wr_data_din[3:0] = {4{~lctl_rst[0]}} & lsuctl_ctlbits_wr_data[3:0];
// Thread1
   wire [9:0] lsu_ctl_reg1_din;
   assign      lsu_ctl_reg1_din[9:0] = {10{~lctl_rst[1]}} & lsu_ctl_reg_din[9:0];
   wire [3:0]  lsuctl_ctlbits1_wr_data_din;
   assign      lsuctl_ctlbits1_wr_data_din[3:0] = {4{~lctl_rst[1]}} & lsuctl_ctlbits_wr_data[3:0];
// Thread2
   wire [9:0] lsu_ctl_reg2_din;
   assign      lsu_ctl_reg2_din[9:0] = {10{~lctl_rst[2]}} & lsu_ctl_reg_din[9:0];
   wire [3:0]  lsuctl_ctlbits2_wr_data_din;
   assign      lsuctl_ctlbits2_wr_data_din[3:0] = {4{~lctl_rst[2]}} & lsuctl_ctlbits_wr_data[3:0];
// Thread3
   wire [9:0] lsu_ctl_reg3_din;
   assign      lsu_ctl_reg3_din[9:0] = {10{~lctl_rst[3]}} & lsu_ctl_reg_din[9:0];
   wire [3:0]  lsuctl_ctlbits3_wr_data_din;
   assign      lsuctl_ctlbits3_wr_data_din[3:0] = {4{~lctl_rst[3]}} & lsuctl_ctlbits_wr_data[3:0];

// trin jtag input flops
reg [3:0] rtap_lsu_ctlbits_wr_en;
reg [13:0] rtap_lsu_ctlbits_data;
always @ *
begin
   rtap_lsu_ctlbits_wr_en = 0;
   if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_LSU_CONTROL_BITS)
   begin
      if (rtap_core_threadid == 2'd0)
         rtap_lsu_ctlbits_wr_en = 4'b0001;
      else if (rtap_core_threadid == 2'd1)
         rtap_lsu_ctlbits_wr_en = 4'b0010;
      else if (rtap_core_threadid == 2'd2)
         rtap_lsu_ctlbits_wr_en = 4'b0100;
      else if (rtap_core_threadid == 2'd3)
         rtap_lsu_ctlbits_wr_en = 4'b1000;
   end
   rtap_lsu_ctlbits_data = rtap_core_data[13:0];
end

always @ (posedge clk)
begin
  // if (!rst_l)
  // begin
  //   lsu_ctl_reg0 <= 0;
  // end
  // else
  begin
    if (rtap_lsu_ctlbits_wr_en[0])
      lsu_ctl_reg0[13:0] <= rtap_lsu_ctlbits_data[13:0];
    if (lsuctl_ctlbits_wr_en[0])
      lsu_ctl_reg0[3:0] <= lsuctl_ctlbits0_wr_data_din[3:0];
    if (lsu_ctl_state_wr_en[0])
      lsu_ctl_reg0[13:4] <= lsu_ctl_reg0_din[9:0];

    if (rtap_lsu_ctlbits_wr_en[1])
      lsu_ctl_reg1[13:0] <= rtap_lsu_ctlbits_data[13:0];
    if (lsuctl_ctlbits_wr_en[1])
      lsu_ctl_reg1[3:0] <= lsuctl_ctlbits1_wr_data_din[3:0];
    if (lsu_ctl_state_wr_en[1])
      lsu_ctl_reg1[13:4] <= lsu_ctl_reg1_din[9:0];

    if (rtap_lsu_ctlbits_wr_en[2])
      lsu_ctl_reg2[13:0] <= rtap_lsu_ctlbits_data[13:0];
    if (lsuctl_ctlbits_wr_en[2])
      lsu_ctl_reg2[3:0] <= lsuctl_ctlbits2_wr_data_din[3:0];
    if (lsu_ctl_state_wr_en[2])
      lsu_ctl_reg2[13:4] <= lsu_ctl_reg2_din[9:0];

    if (rtap_lsu_ctlbits_wr_en[3])
      lsu_ctl_reg3[13:0] <= rtap_lsu_ctlbits_data[13:0];
    if (lsuctl_ctlbits_wr_en[3])
      lsu_ctl_reg3[3:0] <= lsuctl_ctlbits3_wr_data_din[3:0];
    if (lsu_ctl_state_wr_en[3])
      lsu_ctl_reg3[13:4] <= lsu_ctl_reg3_din[9:0];
  end
end



// LSU Ctl Reg
mux4ds #(14)     lctlrg_mx (
        .in0    (lsu_ctl_reg0[13:0]),
        .in1    (lsu_ctl_reg1[13:0]),
        .in2    (lsu_ctl_reg2[13:0]),
        .in3    (lsu_ctl_reg3[13:0]),
        .sel0   (thread0_g),
        .sel1   (thread1_g),
        .sel2   (thread2_g),
        .sel3   (thread3_g),
        .dout   (lsu_ctl_reg[13:0])
        );

   wire [3:0] dfture_tap_rd_data;

mux4ds #(4)     dfture_tap_rd_data_mx (
        .in0    (lsu_ctl_reg0[3:0]),
        .in1    (lsu_ctl_reg1[3:0]),
        .in2    (lsu_ctl_reg2[3:0]),
        .in3    (lsu_ctl_reg3[3:0]),
        .sel0   (dfture_tap_rd_en[0]),
        .sel1   (dfture_tap_rd_en[1]),
        .sel2   (dfture_tap_rd_en[2]),
        .sel3   (dfture_tap_rd_en[3]),
        .dout   (dfture_tap_rd_data[3:0])
        );
   
   wire [7:0] va_wtchpt_mask;

mux4ds #(8)     va_wtchpt_mask_mx (
        .in0    (lsu_ctl_reg0[13:6]),
        .in1    (lsu_ctl_reg1[13:6]),
        .in2    (lsu_ctl_reg2[13:6]),
        .in3    (lsu_ctl_reg3[13:6]),
        .sel0   (thread0_m),
        .sel1   (thread1_m),
        .sel2   (thread2_m),
        .sel3   (thread3_m),
        .dout   (va_wtchpt_mask[7:0])
        );  

// Bug 1671 fix
//assign va_wtchpt_msk_match_m  =   (stb_ldst_byte_msk[7:0] == va_wtchpt_mask[7:0]);
//assign va_wtchpt_msk_match_m  =   |(stb_ldst_byte_msk[7:0] & va_wtchpt_mask[7:0]);

assign va_wtchpt_msk_match_m  =   
       stb_ldst_byte_msk[0] & va_wtchpt_mask[7] |
       stb_ldst_byte_msk[1] & va_wtchpt_mask[6] |
       stb_ldst_byte_msk[2] & va_wtchpt_mask[5] |
       stb_ldst_byte_msk[3] & va_wtchpt_mask[4] |
       stb_ldst_byte_msk[4] & va_wtchpt_mask[3] |
       stb_ldst_byte_msk[5] & va_wtchpt_mask[2] |
       stb_ldst_byte_msk[6] & va_wtchpt_mask[1] |
       stb_ldst_byte_msk[7] & va_wtchpt_mask[0] ;
 
       
   
/***********************ldxa****************************/   
// BIST_Controller ASI
// tap wr takes precedence
//wire  [`L1D_ADDRESS_HI:0]  bistctl_data_in;
//wire  [`L1D_ADDRESS_HI:0]  bist_ctl_reg ;

//assign  bistctl_data_in[13:0] =
//  bist_tap_wr_en ? lsu_iobrdge_wr_data[13:0] : st_rs3_data_g[13:0] ;

//assign  bistctl_data_in[10:7] = lsu_iobrdge_wr_data[10:7];
//assign  bistctl_data_in[6:0] =
//  bist_tap_wr_en ? lsu_iobrdge_wr_data[6:0] : st_rs3_data_g[6:0] ;
   
assign  bist_ctl_reg_in[6:0] =  
bist_tap_wr_en ? lsu_iobrdge_wr_data[6:0] : st_rs3_data_g[6:0];

/*   wire bistctl_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf bistctl_clkbuf (
                .rclk   (clk),
                .enb_l  (~bistctl_wr_en),
                .tmb_l  (tmb_l),
                .clk    (bistctl_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(11) bistctl_ff (
        .din    (bistctl_data_in[`L1D_ADDRESS_HI:0]),
        .q      (bist_ctl_reg[`L1D_ADDRESS_HI:0]),
        .en (~(~bistctl_wr_en)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(11) bistctl_ff (
        .din    (bistctl_data_in[`L1D_ADDRESS_HI:0]),
        .q      (bist_ctl_reg[`L1D_ADDRESS_HI:0]),
        .clk    (bistctl_clk),
        .se     (se),       .si (),          .so ()
        );
`endif
*/
   
// Self-Timed Margin Control ASI
// tap wr takes precedence
wire  [27:0]  mrgnctl_data_in;   
wire  [27:0]  spc_mrgnctl_data_in;
   
wire  [27:0]  mrgn_ctl_reg ;

//itlb         [27:20]
//dtlb         [19:12]
//idct (i)     [11: 8]
//idct (d)     [ 7: 4]
//idct (mamem) [ 3: 0]

assign mrgnctl_data_in[27:0] =
mrgn_tap_wr_en ? lsu_iobrdge_wr_data[27:0] :
                 spc_mrgnctl_data_in[27:0];
          
assign spc_mrgnctl_data_in[27:0] =        
(~rst_l) ?  {8'b01011011, 8'b01011011, 4'b0101,4'b0101,4'b0101} :
             st_rs3_data_g[27:0];
                               
   wire mrgnctl_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf mrgnctl_clkbuf (
                .rclk   (clk),
                .enb_l  (~mrgnctl_wr_en),
                .tmb_l  (~se),
                .clk    (mrgnctl_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(28) mrgnctl_ff (
        .din    (mrgnctl_data_in[27:0]),
        .q      (mrgn_ctl_reg[27:0]),
        .en (~(~mrgnctl_wr_en)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(28) mrgnctl_ff (
        .din    (mrgnctl_data_in[27:0]),
        .q      (mrgn_ctl_reg[27:0]),
        .clk    (mrgnctl_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

assign	lsu_itlb_mrgn[7:0] = mrgn_ctl_reg[27:20] ;
assign	lsu_dtlb_mrgn[7:0] = mrgn_ctl_reg[19:12] ;
assign	lsu_ictag_mrgn[3:0] = mrgn_ctl_reg[11:8] ;
assign	lsu_dctag_mrgn[`L1D_WAY_ARRAY_MASK] = mrgn_ctl_reg[7:4] ;
assign	lsu_mamem_mrgn[3:0] = mrgn_ctl_reg[3:0] ;

// LSU Diag Reg ASI
wire  [1:0] ldiagctl_data_in ;

wire  [1:0] ldiag_ctl_reg ;

assign  ldiagctl_data_in[1:0] = {2{rst_l}} & st_rs3_data_g[1:0] ;

   wire ldiagctl_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf ldiagctl_clkbuf (
                .rclk   (clk),
                .enb_l  (~ldiagctl_wr_en),
                .tmb_l  (~se),
                .clk    (ldiagctl_clk)
                ) ;   
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(2) ldiagctl_ff (
        .din    (ldiagctl_data_in[1:0]),
        .q      (ldiag_ctl_reg[1:0]),
        .en (~(~ldiagctl_wr_en)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(2) ldiagctl_ff (
        .din    (ldiagctl_data_in[1:0]),
        .q      (ldiag_ctl_reg[1:0]),
        .clk    (ldiagctl_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

assign	lsu_ifu_direct_map_l1 = ldiag_ctl_reg[0] ;
assign	dc_direct_map = ldiag_ctl_reg[1] ;

   wire [43:0] misc_ctl_reg;

   wire [3:0] misc_ctl_sel_q;
   
dff_s #(4) misc_ctl_sel_stgg (
    .din ( misc_ctl_sel_din[3:0] ),
    .q   ( misc_ctl_sel_q[3:0]   ),       
    .clk (clk),
    .se  (se),       .si (),          .so ()
);
   wire [3:0] misc_ctl_sel;
 
   assign     misc_ctl_sel[0] =  misc_ctl_sel_q [0] & ~rst_tri_en;
   assign     misc_ctl_sel[1] =  misc_ctl_sel_q [1] & ~rst_tri_en;
   assign     misc_ctl_sel[2] =  misc_ctl_sel_q [2] |  rst_tri_en;
   assign     misc_ctl_sel[3] =  misc_ctl_sel_q [3] & ~rst_tri_en;
      
// Misc Ctl Registers
mux4ds #(44)     miscrg_mx (
        .in0    ({{43-`L1D_ADDRESS_HI{1'b0}},bist_ctl_reg_out[`L1D_ADDRESS_HI:0]}),
        .in1    ({16'b0,mrgn_ctl_reg[27:0]}),
        .in2    ({42'd0,ldiag_ctl_reg[1:0]}),
        .in3    ({40'd0,dfture_tap_rd_data[3:0]}),
        .sel0   (misc_ctl_sel[0]),
        .sel1   (misc_ctl_sel[1]),
        .sel2   (misc_ctl_sel[2]),
        .sel3   (misc_ctl_sel[3]),
        .dout   (misc_ctl_reg[43:0])
        );

assign	lsu_iobrdge_rd_data[43:0] = misc_ctl_reg[43:0] ;

wire	[12:0]	ldxa_data_fmx1 ;
   
mux3ds #(13)     lsuasi_fmx1 (
        .in0    (pctxt_state[12:0]),
        .in1    (sctxt_state[12:0]),
        .in2    ({10'd0,pid_state[2:0]}),
        .sel0   (lsu_asi_sel_fmx1[0]),
        .sel1   (lsu_asi_sel_fmx1[1]),
        .sel2   (lsu_asi_sel_fmx1[2]),
        .dout   (ldxa_data_fmx1[12:0])
        );

wire  [47:0]  final_ldxa_data_g ;
   
//mux3ds #(48)     lsuasi_fmx2 (
//        .in0    ({35'd0,ldxa_data_fmx1[12:0]}),
//        .in1    ({15'd0,lsu_ctl_reg[15:8],2'b00,lsu_ctl_reg[5:4],17'd0,lsu_ctl_reg[3:0]}),
//        .in2    ({lsu_va_wtchpt_addr[47:3],3'b000}),
//        .sel0   (lsu_asi_sel_fmx2[0]),
//        .sel1   (lsu_asi_sel_fmx2[1]),
//        .sel2   (lsu_asi_sel_fmx2[2]),
//        .dout   (local_ldxa_data_g[47:0])
//        );

//mux2ds #(48)     lsuasi_final (
//        .in0    (local_ldxa_data_g[47:0]),
//        .in1    ({4'd0,misc_ctl_reg[43:0]}),
//        .sel0   (~misc_asi_rd_en),
//        .sel1   (misc_asi_rd_en),
//        .dout   (final_ldxa_data_g[47:0])
//        );

mux3ds #(48)     lsuasi_fmx2 (
        .in0    ({35'd0,ldxa_data_fmx1[12:0]}),
        .in1    ({15'd0,lsu_ctl_reg[13:6],2'b00,lsu_ctl_reg[5:4],17'd0,lsu_ctl_reg[3:0]}),
        .in2    ({4'd0,misc_ctl_reg[43:0]}),
        .sel0   (lsu_asi_sel_fmx2[0]),
        .sel1   (lsu_asi_sel_fmx2[1]),
        .sel2   (lsu_asi_sel_fmx2[2]),
        .dout   (final_ldxa_data_g[47:0])
        );   

assign        lsu_local_ldxa_data_g[47:0] =  final_ldxa_data_g[47:0];


/****************va staging*******************/
 wire [47:0] ldst_va_m;   
dff_s  #(48) va_stgm (
        .din    (exu_lsu_ldst_va_e[47:0]),
        .q      (ldst_va_m[47:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 

assign lsu_ldst_va_m[12:0] = ldst_va_m[12:0];   

assign lsu_ldst_va_m_buf[47:0] = ldst_va_m[47:0];
   
       
assign lsu_tlu_ldst_va_m[9:0] = ldst_va_m[9:0];   
   
wire [47:0] ldst_va_g;   
dff_s  #(48) va_stgg (
        .din    (ldst_va_m[47:0]),
        .q      (ldst_va_g[47:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 

assign  lsu_ldst_va_g[7:0] = ldst_va_g[7:0] ;


wire  [7:0] asi_state_g ;
assign  asi_state_g[7:0] = lsu_asi_state[7:0] ; 

wire  [7:0] tlb_asi_state0,tlb_asi_state1,tlb_asi_state2,tlb_asi_state3 ;
wire  [47:13] lngltncy_dmp_va ;
   
// Thread 0
   wire [47:0] ldst_va0;

   wire        tlb_access0_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf tlb_access0_clkbuf (
                .rclk   (clk),
                .enb_l  (~tlb_access_en0_g),
                .tmb_l  (~se),
                .clk    (tlb_access0_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(56)  asi_thrd0 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state0[7:0],ldst_va0[47:0]}),
        .en (~(~tlb_access_en0_g)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(56)  asi_thrd0 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state0[7:0],ldst_va0[47:0]}),
        .clk    (tlb_access0_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

// Thread 1
   wire [47:0] ldst_va1;

   wire        tlb_access1_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf tlb_access1_clkbuf (
                .rclk   (clk),
                .enb_l  (~tlb_access_en1_g),
                .tmb_l  (~se),
                .clk    (tlb_access1_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(56)  asi_thrd1 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state1[7:0],ldst_va1[47:0]}),
        .en (~(~tlb_access_en1_g)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(56)  asi_thrd1 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state1[7:0],ldst_va1[47:0]}),
        .clk    (tlb_access1_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

// Thread 2
   wire [47:0] ldst_va2;

   wire        tlb_access2_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf tlb_access2_clkbuf (
                .rclk   (clk),
                .enb_l  (~tlb_access_en2_g),
                .tmb_l  (~se),
                .clk    (tlb_access2_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(56)  asi_thrd2 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state2[7:0],ldst_va2[47:0]}),
        .en (~(~tlb_access_en2_g)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(56)  asi_thrd2 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state2[7:0],ldst_va2[47:0]}),
        .clk    (tlb_access2_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

// Thread 3
   wire [47:0] ldst_va3;

   wire        tlb_access3_clk;
   
`ifdef FPGA_SYN_CLK_EN
`else
clken_buf tlb_access3_clkbuf (
                .rclk   (clk),
                .enb_l  (~tlb_access_en3_g),
                .tmb_l  (~se),
                .clk    (tlb_access3_clk)
                ) ;
`endif
   
`ifdef FPGA_SYN_CLK_DFF
dffe_s #(56)  asi_thrd3 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state3[7:0],ldst_va3[47:0]}),
        .en (~(~tlb_access_en3_g)), .clk(clk),
        .se     (se),       .si (),          .so ()
        );
`else
dff_s #(56)  asi_thrd3 (
        .din    ({asi_state_g[7:0],   ldst_va_g[47:0]}),
        .q      ({tlb_asi_state3[7:0],ldst_va3[47:0]}),
        .clk    (tlb_access3_clk),
        .se     (se),       .si (),          .so ()
        );
`endif

   wire [47:0] ldst_va_dout;
   
mux4ds #(56)     ldst_va_mx (
        .in0    ({tlb_asi_state0[7:0],ldst_va0[47:0]}),
        .in1    ({tlb_asi_state1[7:0],ldst_va1[47:0]}),
        .in2    ({tlb_asi_state2[7:0],ldst_va2[47:0]}),
        .in3    ({tlb_asi_state3[7:0],ldst_va3[47:0]}),
        .sel0   (tlb_access_sel_thrd0),
        .sel1   (tlb_access_sel_thrd1),
        .sel2   (tlb_access_sel_thrd2),
        .sel3   (tlb_access_sel_default),
        .dout   ({lsu_tlu_tlb_asi_state_m[7:0], ldst_va_dout[47:0]})
        );

assign  lsu_ifu_asi_state[7:0] = lsu_tlu_tlb_asi_state_m[7:0] ;

wire [17:0] lngltncy_ldst_va ;

assign  lngltncy_ldst_va[17:0] = ldst_va_dout[17:0];
assign  lngltncy_dmp_va[47:13] = ldst_va_dout[47:13];   
assign  lsu_tlu_tlb_ldst_va_m[`L1D_ADDRESS_HI:0] = lngltncy_ldst_va[`L1D_ADDRESS_HI:0] ;
assign  lsu_tlu_tlb_dmp_va_m[47:13] = lngltncy_dmp_va[47:13] ;
assign  lsu_ifu_asi_addr[17:0] = lngltncy_ldst_va[17:0] ;

// Diagnostics

//wire	[3:0]	lsu_diag_access_sel_d1 ;

//dff #(4)  diagsel_stgd1 (
//        .din    (lsu_diag_access_sel[3:0]),
//        .q      (lsu_diag_access_sel_d1[3:0]),
//        .clk    (clk),
//        .se     (se),       .si (),          .so ()
//        ); 
  wire [3:0] diagnstc_va_sel;
//change buffer to nand / nor 
assign     diagnstc_va_sel[0] =   lsu_diagnstc_va_sel[0] & ~rst_tri_en;
assign     diagnstc_va_sel[1] =   lsu_diagnstc_va_sel[1] & ~rst_tri_en;
assign     diagnstc_va_sel[2] =   lsu_diagnstc_va_sel[2] & ~rst_tri_en;
assign     diagnstc_va_sel[3] =   lsu_diagnstc_va_sel[3] |  rst_tri_en;
   
wire	[20:0] diag_va ;
mux4ds #(21)     diag_va_mx (
        .in0    (ldst_va0[20:0]),
        .in1    (ldst_va1[20:0]),
        .in2    (ldst_va2[20:0]),
        .in3    (ldst_va3[20:0]),
        .sel0   (diagnstc_va_sel[0]),
        .sel1   (diagnstc_va_sel[1]),
        .sel2   (diagnstc_va_sel[2]),
        .sel3   (diagnstc_va_sel[3]),
        .dout   (diag_va[20:0])
        );

assign  lsu_diagnstc_wr_addr_e[`L1D_ADDRESS_HI:0] = diag_va[`L1D_ADDRESS_HI:0] ;
assign  lsu_diagnstc_dc_prty_invrt_e[7:0] = diag_va[20:13] ;   

//assign  lsu_lngltncy_ldst_va[13:11]= lngltncy_ldst_va[13:11] ;

//assign  lsu_diagnstc_wr_way_e[0] = ~diag_va[12] & ~diag_va[11] ;
//assign  lsu_diagnstc_wr_way_e[1] = ~diag_va[12] &  diag_va[11] ;
//assign  lsu_diagnstc_wr_way_e[2] =  diag_va[12] & ~diag_va[11] ;
//assign  lsu_diagnstc_wr_way_e[3] =  diag_va[12] &  diag_va[11] ;

assign  lsu_diagnstc_wr_way_e[`L1D_WAY_MASK] =  {diag_va[12],  diag_va[11]};
   
   
assign	lsu_diag_va_prty_invrt = diag_va[13] ;

/***************error addr***************/
wire  [`L1D_ADDRESS_HI:4] dcfill_addr_m,dcfill_addr_g ;

dff_s #(`L1D_SET_IDX_WIDTH)  filla_stgm (
        .din    (lsu_dcfill_addr_e[`L1D_ADDRESS_HI:4]),
        .q      (dcfill_addr_m[`L1D_ADDRESS_HI:4]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 

dff_s #(`L1D_SET_IDX_WIDTH)  filla_stgg (
        .din    (dcfill_addr_m[`L1D_ADDRESS_HI:4]),
        .q      (dcfill_addr_g[`L1D_ADDRESS_HI:4]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 

wire  [28:0]  error_pa_g ;
dff_s #(29)  epa_stgg (
        .din    (lsu_error_pa_m[28:0]),
        .q      (error_pa_g[28:0]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 

wire  [47:4]  err_addr_g ;

mux3ds #(44)     erra_mx (
        .in0    (ldst_va_g[47:4]),
        .in1    ({38'd0,async_tlb_index[5:0]}),
        .in2    ({8'd0,error_pa_g[28:0],dcfill_addr_g[10:4]}), // trin todo; might not be right
        // .in2    ({8'd0,error_pa_g[28:0],dcfill_addr_g[`L1D_ADDRESS_HI:4]}), // trin todo; might not be right
        .sel0   (lsu_err_addr_sel[0]),
        .sel1   (lsu_err_addr_sel[1]),
        .sel2   (lsu_err_addr_sel[2]),
        .dout   (err_addr_g[47:4])
        );

/*assign  err_addr_g[47:4] =
  sync_error_sel ?  ldst_va_g[47:4] : 
	async_error_sel ? {38'd0,async_tlb_index[5:0]} :
			{8'd0,error_pa_g[28:0],dcfill_addr_g[`L1D_ADDRESS_HI:4]} ;*/

dff_s #(44)  errad_stgg (
        .din    (err_addr_g[47:4]),
        .q      (lsu_ifu_err_addr[47:4]),
        .clk    (clk),
        .se     (se),       .si (),          .so ()
        ); 
     
endmodule // lsu_dctldp
