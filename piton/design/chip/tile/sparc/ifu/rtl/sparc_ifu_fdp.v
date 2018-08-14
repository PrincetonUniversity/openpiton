// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: sparc_ifu_fdp.v
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
//  Module Name:  sparc_ifu_fdp
//  Description:
//    The fdp contains the pc's for all four threads and the PC and
//    nPC for all pipestages register.  The fetcher also contains two
//    adders for doing PC + br_offset and PC + 4.
//    The fdp also holds the last fetched icache data for each thread
//    and the next instruction register, which has the top half of the
//    double instruction bundle which is fetched from the icache.
*/
////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////
`include "sys.h"
`include "ifu.tmp.h"

`define NOP            32'h01000000
`define PO_RESET_PC    48'hfffff0000020

//`define VER_MAXTL      {5'b0, fcl_fdp_hprivmode_e, 2'b10}
//`define VER_IMPL_MASK  24'h002301

//`define VERSION_REG_HPV  {`VER_MANUF, `VER_IMPL_MASK, `VER_MAXGL, 5'b0, fcl_fdp_hprivmode_e, 2'b10, `VER_MAXWIN}

//`define VERSION_REG      {`VER_MANUF, `VER_IMPL_MASK, `VER_MAXGL, 8'h06, `VER_MAXWIN}

//PITON_PROTO enables all FPGA related modifications
`ifdef PITON_PROTO
`define FPGA_SYN_CLK_EN
`define FPGA_SYN_CLK_DFF
`endif

module sparc_ifu_fdp(/*AUTOARG*/
   // Outputs
   so, fdp_itlb_ctxt_bf, fdp_icd_vaddr_bf, fdp_icv_index_bf,
   fdp_erb_pc_f, fdp_dtu_inst_s, ifu_exu_pc_d, ifu_exu_rs1_s,
   ifu_exu_rs2_s, ifu_exu_rs3_s, ifu_tlu_pc_m, ifu_tlu_npc_m,
   ifu_tlu_pc_oor_e, ifu_exu_pcver_e, fdp_fcl_swc_s2,
   fdp_fcl_pc_oor_vec_f, fdp_fcl_pc_oor_e, fdp_fcl_op_s,
   fdp_fcl_op3_s, fdp_fcl_ibit_s,
   fdp_esl_t0inst_next_s2,
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1inst_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1inst_next_s2,
`elsif THREADS_3
   fdp_esl_t1inst_next_s2,
   fdp_esl_t2inst_next_s2,
`else
   fdp_esl_t1inst_next_s2,
   fdp_esl_t2inst_next_s2,
   fdp_esl_t3inst_next_s2,
`endif
`endif
   fdp_esl_t0inst_paddr_next_s2,
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1inst_paddr_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1inst_paddr_next_s2,
`elsif THREADS_3
   fdp_esl_t1inst_paddr_next_s2,
   fdp_esl_t2inst_paddr_next_s2,
`else
   fdp_esl_t1inst_paddr_next_s2,
   fdp_esl_t2inst_paddr_next_s2,
   fdp_esl_t3inst_paddr_next_s2,
`endif
`endif
   fdp_esl_t0pc_next_s2,
`ifndef CONFIG_NUM_THREADS
   fdp_esl_t1pc_next_s2,
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   fdp_esl_t1pc_next_s2,
`elsif THREADS_3
   fdp_esl_t1pc_next_s2,
   fdp_esl_t2pc_next_s2,
`else
   fdp_esl_t1pc_next_s2,
   fdp_esl_t2pc_next_s2,
   fdp_esl_t3pc_next_s2,
`endif
`endif
   fdp_esl_brtrp_target_pc_bf_f,
   // Inputs
   rclk, se, si, const_maskid, lsu_t0_pctxt_state,
   lsu_t1_pctxt_state, lsu_t2_pctxt_state, lsu_t3_pctxt_state,
   exu_ifu_brpc_e, tlu_ifu_trappc_w2, tlu_ifu_trapnpc_w2,
   tlu_itlb_dmp_nctxt_g, tlu_itlb_dmp_actxt_g, tlu_itlb_tte_tag_w2,
   dtu_fdp_thrconf_e, icd_fdp_fetdata_s1, icd_fdp_topdata_s1,
   ifq_fdp_fill_inst, fcl_fdp_oddwin_s, fcl_fdp_pcoor_vec_f,
   fcl_fdp_pcoor_f, fcl_fdp_mask32b_f, fcl_fdp_addr_mask_d,
   fcl_fdp_tctxt_sel_prim, fcl_fdp_usenir_sel_nir_s1,
   fcl_fdp_rbinst_sel_inste_s, fcl_fdp_thrtnpc_sel_tnpc_l,
   fcl_fdp_thrtnpc_sel_npcw_l, fcl_fdp_thrtnpc_sel_pcf_l,
   fcl_fdp_thrtnpc_sel_old_l, fcl_fdp_thr_s1_l,
   fcl_fdp_next_thr_bf_l, fcl_fdp_next_ctxt_bf_l, fcl_fdp_thr_s2_l,
   fcl_fdp_nirthr_s1_l, fcl_fdp_tpcbf_sel_pcp4_bf_l,
   fcl_fdp_tpcbf_sel_brpc_bf_l, fcl_fdp_tpcbf_sel_trap_bf_l,
   fcl_fdp_tpcbf_sel_old_bf_l, fcl_fdp_pcbf_sel_swpc_bf_l,
   fcl_fdp_pcbf_sel_nosw_bf_l, fcl_fdp_pcbf_sel_br_bf_l,
   fcl_fdp_trrbpc_sel_trap_bf_l, fcl_fdp_trrbpc_sel_rb_bf_l,
   fcl_fdp_trrbpc_sel_err_bf_l, fcl_fdp_trrbpc_sel_pcs_bf_l,
   fcl_fdp_noswpc_sel_tnpc_l_bf, fcl_fdp_noswpc_sel_old_l_bf,
   fcl_fdp_noswpc_sel_inc_l_bf, fcl_fdp_nextpcs_sel_pce_f_l,
   fcl_fdp_nextpcs_sel_pcd_f_l, fcl_fdp_nextpcs_sel_pcs_f_l,
   fcl_fdp_nextpcs_sel_pcf_f_l, fcl_fdp_rdsr_sel_pc_e_l,
   fcl_fdp_rdsr_sel_ver_e_l, fcl_fdp_rdsr_sel_thr_e_l,
   fcl_fdp_inst_sel_curr_s_l, fcl_fdp_inst_sel_switch_s_l,
   fcl_fdp_inst_sel_nir_s_l, fcl_fdp_inst_sel_nop_s_l,
   fcl_fdp_tinst_sel_curr_s_l, fcl_fdp_tinst_sel_rb_s_l,
   fcl_fdp_tinst_sel_old_s_l, fcl_fdp_tinst_sel_ifq_s_l,
   fcl_fdp_dmpthr_l, fcl_fdp_ctxt_sel_dmp_bf_l,
   fcl_fdp_ctxt_sel_sw_bf_l, fcl_fdp_ctxt_sel_curr_bf_l,
   itlb_fdp_paddr_s, fcl_fdp_tlbmiss_s1, ifq_fdp_fill_paddr,
   config_dtu_esl_en, esl_fdp_sync_pcs_bf, esl_fdp_issue_prev_inst_s,

   // trin
   // core_rtap_data,
   rtap_core_val,
   rtap_core_threadid,
   rtap_core_id,
   rtap_core_data,

   fdp_fcl_jtag_breakpoint_hit
   );

   input       rclk,
	             se,
	             si;

   input [7:0] const_maskid;

   input [12:0] lsu_t0_pctxt_state,   // primary context
		            lsu_t1_pctxt_state,
		            lsu_t2_pctxt_state,
		            lsu_t3_pctxt_state;

   //   input 	 exu_ifu_va_oor_e;
   input [47:0] exu_ifu_brpc_e;        // br address for dir branch

   input [48:0] tlu_ifu_trappc_w2,     // trap/exception PC
		            tlu_ifu_trapnpc_w2;    // next trap PC

   input        tlu_itlb_dmp_nctxt_g,
		            tlu_itlb_dmp_actxt_g;

   input [12:0] tlu_itlb_tte_tag_w2;

//   input [`IC_IDX_HI:4] ifq_fdp_icindex_bf;   // index + 1 bit for 16B write

   input [40:0]         dtu_fdp_thrconf_e;

   input [32:0]         icd_fdp_fetdata_s1,    // 4 inst + 4 sw bits
		                    icd_fdp_topdata_s1;    // next instruction

   input [32:0]         ifq_fdp_fill_inst;    // icache miss return

   input                fcl_fdp_oddwin_s;
   input [3:0]          fcl_fdp_pcoor_vec_f;
   input                fcl_fdp_pcoor_f;
   input                fcl_fdp_mask32b_f;
   input                fcl_fdp_addr_mask_d;
   input [3:0]          fcl_fdp_tctxt_sel_prim;

   // 2:1 mux selects
   input                fcl_fdp_usenir_sel_nir_s1;   // same as usenir_d2
   input [3:0]          fcl_fdp_rbinst_sel_inste_s;  // rollback 1 or 2

   input [3:0]          fcl_fdp_thrtnpc_sel_tnpc_l,  // load npc
	                      fcl_fdp_thrtnpc_sel_npcw_l,
		                    fcl_fdp_thrtnpc_sel_pcf_l,
	                      fcl_fdp_thrtnpc_sel_old_l;

   input [3:0]          fcl_fdp_thr_s1_l;            // s2 thr (64*5 muxes)

   // other mux selects
   input [3:0]          fcl_fdp_next_thr_bf_l;  // for thrpc output mux
   input [3:0]          fcl_fdp_next_ctxt_bf_l; // for ctxt output mux

   input [3:0]          fcl_fdp_thr_s2_l;       // s2 thr (64*5 muxes)
   input [3:0]          fcl_fdp_nirthr_s1_l;        // same as thr_s1, but protected

   input [3:0]          fcl_fdp_tpcbf_sel_pcp4_bf_l, // selects for thread PC muxes
	                      fcl_fdp_tpcbf_sel_brpc_bf_l,
	                      fcl_fdp_tpcbf_sel_trap_bf_l,
	                      fcl_fdp_tpcbf_sel_old_bf_l;

   input                fcl_fdp_pcbf_sel_swpc_bf_l,
	                      fcl_fdp_pcbf_sel_nosw_bf_l,
	                      fcl_fdp_pcbf_sel_br_bf_l;

   input [3:0]          fcl_fdp_trrbpc_sel_trap_bf_l,
	                      fcl_fdp_trrbpc_sel_rb_bf_l,
	                      fcl_fdp_trrbpc_sel_err_bf_l,
	                      fcl_fdp_trrbpc_sel_pcs_bf_l;

   input                fcl_fdp_noswpc_sel_tnpc_l_bf,    // next pc select from trap,
	                      fcl_fdp_noswpc_sel_old_l_bf,
	                      fcl_fdp_noswpc_sel_inc_l_bf;

   input [3:0]          fcl_fdp_nextpcs_sel_pce_f_l,
	                      fcl_fdp_nextpcs_sel_pcd_f_l,
	                      fcl_fdp_nextpcs_sel_pcs_f_l,
	                      fcl_fdp_nextpcs_sel_pcf_f_l;

   input                fcl_fdp_rdsr_sel_pc_e_l,
	                      fcl_fdp_rdsr_sel_ver_e_l,
	                      fcl_fdp_rdsr_sel_thr_e_l;

   input                fcl_fdp_inst_sel_curr_s_l,       // selects for inst_s2
	                      fcl_fdp_inst_sel_switch_s_l,
	                      fcl_fdp_inst_sel_nir_s_l,
	                      fcl_fdp_inst_sel_nop_s_l;

   input [3:0]          fcl_fdp_tinst_sel_curr_s_l, // selects for tinst regs
	                      fcl_fdp_tinst_sel_rb_s_l,
	                      fcl_fdp_tinst_sel_old_s_l,
	                      fcl_fdp_tinst_sel_ifq_s_l;

   input [3:0]          fcl_fdp_dmpthr_l;

   input                fcl_fdp_ctxt_sel_dmp_bf_l,
	                      fcl_fdp_ctxt_sel_sw_bf_l,
	                      fcl_fdp_ctxt_sel_curr_bf_l;

   input [39:10]        itlb_fdp_paddr_s;
   input                fcl_fdp_tlbmiss_s1;
   input [39:2]         ifq_fdp_fill_paddr;

   input                config_dtu_esl_en;
   input                esl_fdp_issue_prev_inst_s;
   input                esl_fdp_sync_pcs_bf;

   // jtag
   // output wire [`CORE_JTAG_BUS_WIDTH-1:0] core_rtap_data;
   input wire rtap_core_val;
   input wire [1:0] rtap_core_threadid;
   input wire [`JTAG_CORE_ID_WIDTH-1:0]  rtap_core_id;
   input wire [`CORE_JTAG_BUS_WIDTH-1:0] rtap_core_data;

   output wire fdp_fcl_jtag_breakpoint_hit;

   output               so;
   output [12:0]        fdp_itlb_ctxt_bf;
   output [47:2]        fdp_icd_vaddr_bf;   // 11:2 is index to ic
   output [`IC_IDX_HI:5]        fdp_icv_index_bf;
   output [47:0]        fdp_erb_pc_f;
   output [31:0]        fdp_dtu_inst_s;     // 32b inst + switch bit

   output [47:0]        ifu_exu_pc_d;       // PC for rel branch
   output [4:0]         ifu_exu_rs1_s,      // reg file read address
		                    ifu_exu_rs2_s,
		                    ifu_exu_rs3_s;

   output [48:0]        ifu_tlu_pc_m,
		                    ifu_tlu_npc_m;

   output               ifu_tlu_pc_oor_e;

   output [63:0]        ifu_exu_pcver_e;    // PCs to different dests.

   output               fdp_fcl_swc_s2;       // tells whether to switch or not
   output [3:0]         fdp_fcl_pc_oor_vec_f; // PC va hole check
   output               fdp_fcl_pc_oor_e;

   output [1:0]         fdp_fcl_op_s;
   output [5:2]         fdp_fcl_op3_s;
   output               fdp_fcl_ibit_s;

   output [32:0]        fdp_esl_t0inst_next_s2;
`ifndef CONFIG_NUM_THREADS
   output [32:0]        fdp_esl_t1inst_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   output [32:0]        fdp_esl_t1inst_next_s2;
`elsif THREADS_3
   output [32:0]        fdp_esl_t1inst_next_s2;
   output [32:0]        fdp_esl_t2inst_next_s2;
`else
   output [32:0]        fdp_esl_t1inst_next_s2;
   output [32:0]        fdp_esl_t2inst_next_s2;
   output [32:0]        fdp_esl_t3inst_next_s2;
`endif
`endif

   output [39:2]        fdp_esl_t0inst_paddr_next_s2;
`ifndef CONFIG_NUM_THREADS
   output [39:2]        fdp_esl_t1inst_paddr_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   output [39:2]        fdp_esl_t1inst_paddr_next_s2;
`elsif THREADS_3
   output [39:2]        fdp_esl_t1inst_paddr_next_s2;
   output [39:2]        fdp_esl_t2inst_paddr_next_s2;
`else
   output [39:2]        fdp_esl_t1inst_paddr_next_s2;
   output [39:2]        fdp_esl_t2inst_paddr_next_s2;
   output [39:2]        fdp_esl_t3inst_paddr_next_s2;
`endif
`endif

   output [48:0]        fdp_esl_t0pc_next_s2;
`ifndef CONFIG_NUM_THREADS
   output [48:0]        fdp_esl_t1pc_next_s2;
`else
`ifdef FPGA_SYN_1THREAD
`elsif THREADS_1
`elsif THREADS_2
   output [48:0]        fdp_esl_t1pc_next_s2;
`elsif THREADS_3
   output [48:0]        fdp_esl_t1pc_next_s2;
   output [48:0]        fdp_esl_t2pc_next_s2;
`else
   output [48:0]        fdp_esl_t1pc_next_s2;
   output [48:0]        fdp_esl_t2pc_next_s2;
   output [48:0]        fdp_esl_t3pc_next_s2;
`endif
`endif

   output [3:0]         fdp_esl_brtrp_target_pc_bf_f;

//----------------------------------------------------------------------
// Declarations
//----------------------------------------------------------------------

   // local signals

   // Contexts
   wire [12:0] 	curr_ctxt,
		            sw_ctxt,
		            dmp_ctxt,
		            dmp_ctxt_unq,
		            dmp_ctxt1,
		            dmp_ctxt2,
		            t0_ctxt_bf,
		            t1_ctxt_bf,
		            t2_ctxt_bf,
		            t3_ctxt_bf;

   // PCs
   // wire [48:0]  t0pc_f, t1pc_f, t2pc_f, t3pc_f,         // F stage thread PC
   reg  [48:0]  t0pc_f, t1pc_f, t2pc_f, t3pc_f;         // F stage thread PC
		            // t0pc_s, t1pc_s, t2pc_s, t3pc_s,         // S stage thr pc
   wire [48:0]    t0pc_s, t1pc_s, t2pc_s, t3pc_s,         // S stage thr pc
		            t0_next_pcs_f, t1_next_pcs_f, t2_next_pcs_f, t3_next_pcs_f,
                    t1_next_pcs_bf_execdraft_f, t2_next_pcs_bf_execdraft_f,
                    t3_next_pcs_bf_execdraft_f,
		            t0npc_bf, t1npc_bf, t2npc_bf, t3npc_bf, // Next PC in
							                                          // BF stage
                    t1npc_bf_execdraft_bf,
                    t2npc_bf_execdraft_bf,
                    t3npc_bf_execdraft_bf,
		            pc_s, pc_d, pc_e, pc_m, pc_w,
		            npc_s, npc_d, npc_e, npc_m, npc_w,
		            pc_d_adj, npc_d_adj;

   wire [47:0]  pc_bf,
		            swpc_bf,                // PC of next thread if not branch
                pc_f;

   wire [48:0]  nextpc_nosw_bf,         // next pc if no switch
		            am_mask;

   // trap PCs and rollback PCs
   wire [48:0]  t0_trap_rb_pc_bf,
		            t1_trap_rb_pc_bf,
		            t2_trap_rb_pc_bf,
		            t3_trap_rb_pc_bf;

   wire [48:0]  thr_trappc_bf,
		            t0_trapnpc_f,
		            t1_trapnpc_f,
		            t2_trapnpc_f,
		            t3_trapnpc_f,
		            trapnpc0_bf,
		            trapnpc1_bf,
		            trapnpc2_bf,
		            trapnpc3_bf;

   // Branch PCs
   wire [48:0]  pcinc_f;                // incr output
   wire [9:2]   pcinc_s;                // Piped forward incremented PC

   // Instruction Words
   wire [32:0]  inst_s2,                // instruction to switch to in S
                    fdp_inst_bf_execdraft_s,
		            fdp_inst_s,             // instruction to be sent to D
                    fdp_inst_s_prev,
		            t0inst_s1,              // input to thr inst reg in S
		            t1inst_s1,
		            t2inst_s1,
		            t3inst_s1,
		            t0inst_s2,              // thr inst reg output
		            t1inst_s2,
		            t2inst_s2,
		            t3inst_s2;

   // Instruction words paddr
   wire [39:2]  inst_paddr_s2,
                fdp_inst_paddr_s,
                t0inst_paddr_s1,
                t1inst_paddr_s1,
                t2inst_paddr_s1,
                t3inst_paddr_s1,
                t0inst_paddr_s2,
                t1inst_paddr_s2,
                t2inst_paddr_s2,
                t3inst_paddr_s2;

   wire [32:0]  inst_s1;                // fetched instruction in S
   wire [32:0]  inst_s1_bf1;            // buf version of inst_s1

   wire [9:2]   pc_offset_s;            // Pipe forwarded version of pc_f
   wire [39:2]  fetpaddr_s1;            // The physical address of fetched instruction
   wire [39:2]  inst_paddr_s1;          // fetched instruction in S paddr
   wire [39:2]  inst_paddr_s1_bf1;      // buf version of inst_paddr_s1

   wire [32:0]  rb_inst0_s,             // instruction to rollback to
		            rb_inst1_s,             // instruction to rollback to
		            rb_inst2_s,             // instruction to rollback to
		            rb_inst3_s,             // instruction to rollback to
		            inst_d,                 //   rollback 1
		            inst_e;                 //   rollback 2

   // Rollback instructions paddr
   wire [39:2]  rb_inst0_paddr_s,
                rb_inst1_paddr_s,
                rb_inst2_paddr_s,
                rb_inst3_paddr_s,
                inst_paddr_d,
                inst_paddr_e;


   // Next instruction word
   wire [32:0]  nirdata_s1,             // next inst reg contents
		            t0nir,                  // thread NIR reg output
		            t1nir,
		            t2nir,
		            t3nir;

   // NIR physical addresses
   wire [39:2]  toppaddr_s1,
                nirpaddr_s1,
                t0nir_paddr,
                t1nir_paddr,
                t2nir_paddr,
                t3nir_paddr;

   wire         clk;


   //
   // Code start here
   //
   assign       clk = rclk;

//----------------------------------------------------------------------
// Context Reg
//----------------------------------------------------------------------
   assign t0_ctxt_bf = lsu_t0_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[0]}};

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   assign t1_ctxt_bf = lsu_t1_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[1]}};

   dp_mux2ds #(13) sw_ctxt_mux(.dout (sw_ctxt),
                   .in0  (t0_ctxt_bf),
                   .in1  (t1_ctxt_bf),
                   .sel0_l (fcl_fdp_next_ctxt_bf_l[0]),
                   .sel1_l (fcl_fdp_next_ctxt_bf_l[1]));

   dp_mux2ds #(13) curr_ctxt_mux(.dout (curr_ctxt),
                 .in0  (t0_ctxt_bf),
                 .in1  (t1_ctxt_bf),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]));

   dp_mux2ds #(13) dmp_ctxt_mux(.dout (dmp_ctxt_unq),
                  .in0  (lsu_t0_pctxt_state),
                  .in1  (lsu_t1_pctxt_state),
                  .sel0_l (fcl_fdp_dmpthr_l[0]),
                  .sel1_l (fcl_fdp_dmpthr_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

   assign sw_ctxt = t0_ctxt_bf;
   assign curr_ctxt = t0_ctxt_bf;
   assign dmp_ctxt_unq = lsu_t0_pctxt_state;

`elsif THREADS_1

   assign sw_ctxt = t0_ctxt_bf;
   assign curr_ctxt = t0_ctxt_bf;
   assign dmp_ctxt_unq = lsu_t0_pctxt_state;

`elsif THREADS_2

   assign t1_ctxt_bf = lsu_t1_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[1]}};

   dp_mux2ds #(13) sw_ctxt_mux(.dout (sw_ctxt),
                   .in0  (t0_ctxt_bf),
                   .in1  (t1_ctxt_bf),
                   .sel0_l (fcl_fdp_next_ctxt_bf_l[0]),
                   .sel1_l (fcl_fdp_next_ctxt_bf_l[1]));

   dp_mux2ds #(13) curr_ctxt_mux(.dout (curr_ctxt),
                 .in0  (t0_ctxt_bf),
                 .in1  (t1_ctxt_bf),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]));

   dp_mux2ds #(13) dmp_ctxt_mux(.dout (dmp_ctxt_unq),
                  .in0  (lsu_t0_pctxt_state),
                  .in1  (lsu_t1_pctxt_state),
                  .sel0_l (fcl_fdp_dmpthr_l[0]),
                  .sel1_l (fcl_fdp_dmpthr_l[1]));

`elsif THREADS_3

   assign t1_ctxt_bf = lsu_t1_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[1]}};
   assign t2_ctxt_bf = lsu_t2_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[2]}};

   dp_mux3ds #(13) sw_ctxt_mux(.dout (sw_ctxt),
                   .in0  (t0_ctxt_bf),
                   .in1  (t1_ctxt_bf),
                   .in2  (t2_ctxt_bf),
                   .sel0_l (fcl_fdp_next_ctxt_bf_l[0]),
                   .sel1_l (fcl_fdp_next_ctxt_bf_l[1]),
                   .sel2_l (fcl_fdp_next_ctxt_bf_l[2]));

   dp_mux3ds #(13) curr_ctxt_mux(.dout (curr_ctxt),
                 .in0  (t0_ctxt_bf),
                 .in1  (t1_ctxt_bf),
                 .in2  (t2_ctxt_bf),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]),
                 .sel2_l (fcl_fdp_thr_s2_l[2]));

   dp_mux3ds #(13) dmp_ctxt_mux(.dout (dmp_ctxt_unq),
                  .in0  (lsu_t0_pctxt_state),
                  .in1  (lsu_t1_pctxt_state),
                  .in2  (lsu_t2_pctxt_state),
                  .sel0_l (fcl_fdp_dmpthr_l[0]),
                  .sel1_l (fcl_fdp_dmpthr_l[1]),
                  .sel2_l (fcl_fdp_dmpthr_l[2]));

`else

   assign t1_ctxt_bf = lsu_t1_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[1]}};
   assign t2_ctxt_bf = lsu_t2_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[2]}};
   assign t3_ctxt_bf = lsu_t3_pctxt_state & {13{fcl_fdp_tctxt_sel_prim[3]}};

   dp_mux4ds #(13) sw_ctxt_mux(.dout (sw_ctxt),
			       .in0  (t0_ctxt_bf),
			       .in1  (t1_ctxt_bf),
			       .in2  (t2_ctxt_bf),
			       .in3  (t3_ctxt_bf),
			       .sel0_l (fcl_fdp_next_ctxt_bf_l[0]),
			       .sel1_l (fcl_fdp_next_ctxt_bf_l[1]),
			       .sel2_l (fcl_fdp_next_ctxt_bf_l[2]),
			       .sel3_l (fcl_fdp_next_ctxt_bf_l[3]));

   dp_mux4ds #(13) curr_ctxt_mux(.dout (curr_ctxt),
			     .in0  (t0_ctxt_bf),
			     .in1  (t1_ctxt_bf),
			     .in2  (t2_ctxt_bf),
			     .in3  (t3_ctxt_bf),
			     .sel0_l (fcl_fdp_thr_s2_l[0]),
			     .sel1_l (fcl_fdp_thr_s2_l[1]),
			     .sel2_l (fcl_fdp_thr_s2_l[2]),
			     .sel3_l (fcl_fdp_thr_s2_l[3]));

   dp_mux4ds #(13) dmp_ctxt_mux(.dout (dmp_ctxt_unq),
			      .in0  (lsu_t0_pctxt_state),
			      .in1  (lsu_t1_pctxt_state),
			      .in2  (lsu_t2_pctxt_state),
			      .in3  (lsu_t3_pctxt_state),
			      .sel0_l (fcl_fdp_dmpthr_l[0]),
			      .sel1_l (fcl_fdp_dmpthr_l[1]),
			      .sel2_l (fcl_fdp_dmpthr_l[2]),
			      .sel3_l (fcl_fdp_dmpthr_l[3]));
`endif // !`ifdef FPGA_SYN_1THREAD

`endif // `ifndef CONFIG_NUM_THREADS

   assign dmp_ctxt1 = dmp_ctxt_unq & {13{~(tlu_itlb_dmp_nctxt_g |
					                                 tlu_itlb_dmp_actxt_g)}};
//`ifdef SPARC_HPV_EN
   assign dmp_ctxt2 = {tlu_itlb_tte_tag_w2[12:7],tlu_itlb_tte_tag_w2[6:0]} &
	                    {13{tlu_itlb_dmp_actxt_g}};
//`else
//  assign dmp_ctxt2 = {tlu_itlb_tte_tag_w2[13:8],tlu_itlb_tte_tag_w2[6:0]} &
//	                    {13{tlu_itlb_dmp_actxt_g}};
//`endif

   assign dmp_ctxt = dmp_ctxt1 | dmp_ctxt2;

   dp_mux3ds #(13) ctxt_mux (.dout (fdp_itlb_ctxt_bf),
			                     .in0  (curr_ctxt),
			                     .in1  (sw_ctxt),
			                     .in2  (dmp_ctxt),
			                     .sel0_l  (fcl_fdp_ctxt_sel_curr_bf_l),
			                     .sel1_l  (fcl_fdp_ctxt_sel_sw_bf_l),
			                     .sel2_l  (fcl_fdp_ctxt_sel_dmp_bf_l));


// ----------------------------------------------------------------------
// PC datapath
// ----------------------------------------------------------------------

   // pc/thr to exu for rdsr instruction
   // this is the only 64 bit cell in the IFU
   dp_mux3ds #(64) ver_mux(.dout (ifu_exu_pcver_e[63:0]),
			                   .in0  ({{16{pc_e[47]}}, pc_e[47:0]}),
			                   .in1  ({`VER_MANUF,
                                 `VER_IMPL,
                                 const_maskid[7:0],
                                 `VER_MAXGL,
                                 `VER_MAXTL,
                                 `VER_MAXWIN}),
			                   .in2  ({12'b0,
                                 dtu_fdp_thrconf_e[40:29],
                                 4'b0,
                                 dtu_fdp_thrconf_e[28:9],
                                 2'b0,
                                 dtu_fdp_thrconf_e[8:3],
                                 5'b0,
                                 dtu_fdp_thrconf_e[2:0]}),
			                   .sel0_l  (fcl_fdp_rdsr_sel_pc_e_l),
			                   .sel1_l  (fcl_fdp_rdsr_sel_ver_e_l),
			                   .sel2_l  (fcl_fdp_rdsr_sel_thr_e_l));

    // mmckeown: track if there is a branch
    // target PC in the F stage for ExecD
    reg [3:0] brtrp_target_pc_bf, brtrp_target_pc_f;
    reg [3:0]          rtap_ifu_pc_wr_en; // moved from below
    assign fdp_esl_brtrp_target_pc_bf_f = brtrp_target_pc_bf | brtrp_target_pc_f;

   // Select the next thread pc (for F stage)
   dp_mux4ds #(49) t0_pcbf_mux(.dout (t0npc_bf),
			                       .in0 ({fcl_fdp_pcoor_vec_f[0], t0pc_f[47:0]}),
			                       .in1 (nextpc_nosw_bf),
			                       .in2 (t0_trap_rb_pc_bf),
			                       .in3 ({1'b0, exu_ifu_brpc_e}),
			                       .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[0]),
			                       .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[0]),
			                       .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[0]),
			                       .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[0]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[0] | ~fcl_fdp_tpcbf_sel_trap_bf_l[0])
            brtrp_target_pc_bf[0] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[0])
            brtrp_target_pc_bf[0] = brtrp_target_pc_f[0];
        else
            brtrp_target_pc_bf[0] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[0])
            brtrp_target_pc_f[0] <= 1'b1;
        else
            brtrp_target_pc_f[0] <= brtrp_target_pc_bf[0];
    end
   

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcf_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcf_sync_mux1 (.dout (t1npc_bf),
                                               .in0 (t1npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux4ds #(49) t1_pcbf_mux(.dout (t1npc_bf_execdraft_bf),
                                   .in0 ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
                                   .in1 (nextpc_nosw_bf),
                                   .in2 (t1_trap_rb_pc_bf),
                                   .in3 ({1'b0, exu_ifu_brpc_e}),
                                   .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[1]),
                                   .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[1]),
                                   .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[1]),
                                   .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[1]));   
    
    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[1] | ~fcl_fdp_tpcbf_sel_trap_bf_l[1])
            brtrp_target_pc_bf[1] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[1])
            brtrp_target_pc_bf[1] = brtrp_target_pc_f[1];
        else
            brtrp_target_pc_bf[1] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[1])
            brtrp_target_pc_f[1] <= 1'b1;
        else
            brtrp_target_pc_f[1] <= brtrp_target_pc_bf[1];
    end

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcf_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcf_sync_mux1 (.dout (t1npc_bf),
                                               .in0 (t1npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux4ds #(49) t1_pcbf_mux(.dout (t1npc_bf_execdraft_bf),
                                   .in0 ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
                                   .in1 (nextpc_nosw_bf),
                                   .in2 (t1_trap_rb_pc_bf),
                                   .in3 ({1'b0, exu_ifu_brpc_e}),
                                   .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[1]),
                                   .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[1]),
                                   .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[1]),
                                   .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[1]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[1] | ~fcl_fdp_tpcbf_sel_trap_bf_l[1])
            brtrp_target_pc_bf[1] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[1])
            brtrp_target_pc_bf[1] = brtrp_target_pc_f[1];
        else
            brtrp_target_pc_bf[1] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[1])
            brtrp_target_pc_f[1] <= 1'b1;
        else
            brtrp_target_pc_f[1] <= brtrp_target_pc_bf[1];
    end

`elsif THREADS_3

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcf_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcf_sync_mux1 (.dout (t1npc_bf),
                                               .in0 (t1npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcf_sync_mux2 (.dout (t2npc_bf),
                                               .in0 (t2npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux4ds #(49) t1_pcbf_mux(.dout (t1npc_bf_execdraft_bf),
                                   .in0 ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
                                   .in1 (nextpc_nosw_bf),
                                   .in2 (t1_trap_rb_pc_bf),
                                   .in3 ({1'b0, exu_ifu_brpc_e}),
                                   .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[1]),
                                   .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[1]),
                                   .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[1]),
                                   .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[1]));

   always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[1] | ~fcl_fdp_tpcbf_sel_trap_bf_l[1])
            brtrp_target_pc_bf[1] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[1])
            brtrp_target_pc_bf[1] = brtrp_target_pc_f[1];
        else
            brtrp_target_pc_bf[1] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[1])
            brtrp_target_pc_f[1] <= 1'b1;
        else
            brtrp_target_pc_f[1] <= brtrp_target_pc_bf[1];
    end

   dp_mux4ds #(49) t2_pcbf_mux(.dout (t2npc_bf_execdraft_bf),
                                   .in0 ({fcl_fdp_pcoor_vec_f[2], t2pc_f[47:0]}),
                                   .in1 (nextpc_nosw_bf),
                                   .in2 (t2_trap_rb_pc_bf),
                                   .in3 ({1'b0, exu_ifu_brpc_e}),
                                   .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[2]),
                                   .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[2]),
                                   .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[2]),
                                   .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[2]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[2] | ~fcl_fdp_tpcbf_sel_trap_bf_l[2])
            brtrp_target_pc_bf[2] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[2])
            brtrp_target_pc_bf[2] = brtrp_target_pc_f[2];
        else
            brtrp_target_pc_bf[2] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[2])
            brtrp_target_pc_f[2] <= 1'b1;
        else
            brtrp_target_pc_f[2] <= brtrp_target_pc_bf[2];
    end

`else
   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcf_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcf_sync_mux1 (.dout (t1npc_bf),
                                               .in0 (t1npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcf_sync_mux2 (.dout (t2npc_bf),
                                               .in0 (t2npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcf_sync_mux3 (.dout (t3npc_bf),
                                               .in0 (t3npc_bf_execdraft_bf),
                                               .in1 (t0pc_f),
                                               .sel (exec_draft_pcf_sync_mux_sel));

   dp_mux4ds #(49) t1_pcbf_mux(.dout (t1npc_bf_execdraft_bf),
			                       .in0 ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
			                       .in1 (nextpc_nosw_bf),
			                       .in2 (t1_trap_rb_pc_bf),
			                       .in3 ({1'b0, exu_ifu_brpc_e}),
			                       .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[1]),
			                       .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[1]),
			                       .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[1]),
			                       .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[1]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[1] | ~fcl_fdp_tpcbf_sel_trap_bf_l[1])
            brtrp_target_pc_bf[1] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[1])
            brtrp_target_pc_bf[1] = brtrp_target_pc_f[1];
        else
            brtrp_target_pc_bf[1] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[1])
            brtrp_target_pc_f[1] <= 1'b1;
        else
            brtrp_target_pc_f[1] <= brtrp_target_pc_bf[1];
    end

   dp_mux4ds #(49) t2_pcbf_mux(.dout (t2npc_bf_execdraft_bf),
			                       .in0 ({fcl_fdp_pcoor_vec_f[2], t2pc_f[47:0]}),
			                       .in1 (nextpc_nosw_bf),
			                       .in2 (t2_trap_rb_pc_bf),
			                       .in3 ({1'b0, exu_ifu_brpc_e}),
			                       .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[2]),
			                       .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[2]),
			                       .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[2]),
			                       .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[2]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[2] | ~fcl_fdp_tpcbf_sel_trap_bf_l[2])
            brtrp_target_pc_bf[2] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[2])
            brtrp_target_pc_bf[2] = brtrp_target_pc_f[2];
        else
            brtrp_target_pc_bf[2] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[2])
            brtrp_target_pc_f[2] <= 1'b1;
        else
            brtrp_target_pc_f[2] <= brtrp_target_pc_bf[2];
    end

   dp_mux4ds #(49) t3_pcbf_mux(.dout (t3npc_bf_execdraft_bf),
			                       .in0 ({fcl_fdp_pcoor_vec_f[3], t3pc_f[47:0]}),
			                       .in1 (nextpc_nosw_bf),
			                       .in2 (t3_trap_rb_pc_bf),
			                       .in3 ({1'b0, exu_ifu_brpc_e}),
			                       .sel0_l (fcl_fdp_tpcbf_sel_old_bf_l[3]),
			                       .sel1_l (fcl_fdp_tpcbf_sel_pcp4_bf_l[3]),
			                       .sel2_l (fcl_fdp_tpcbf_sel_trap_bf_l[3]),
			                       .sel3_l (fcl_fdp_tpcbf_sel_brpc_bf_l[3]));

    always @ *
    begin
        if (~fcl_fdp_tpcbf_sel_brpc_bf_l[3] | ~fcl_fdp_tpcbf_sel_trap_bf_l[3])
            brtrp_target_pc_bf[3] = 1'b1;
        else if (~fcl_fdp_tpcbf_sel_old_bf_l[3])
            brtrp_target_pc_bf[3] = brtrp_target_pc_f[3];
        else
            brtrp_target_pc_bf[3] = 1'b0;
    end
    always @ (posedge rclk)
    begin
        if (rtap_ifu_pc_wr_en[3])
            brtrp_target_pc_f[3] <= 1'b1;
        else
            brtrp_target_pc_f[3] <= brtrp_target_pc_bf[3];
    end
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // // F stage thread PC regs;  use low power thr flop
   // dff_s  #(49)  t0_pcf_reg(.din (t0npc_bf),
			//                   .clk (clk),
			//                   .q   (t0pc_f),
			//                   .se  (se), .si(), .so());

  // trin: modified t0pc_f for jtag overwrites

// reg [3:0]          rtap_ifu_pc_wr_en; mmckeown: moved this up as it is used
// above
reg [47:0]         rtap_ifu_pc_data;
always @ *
begin
  rtap_ifu_pc_wr_en = 0;
  if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_PC)
  begin
     if (rtap_core_threadid == 2'd0)
        rtap_ifu_pc_wr_en = 4'b0001;
     else if (rtap_core_threadid == 2'd1)
        rtap_ifu_pc_wr_en = 4'b0010;
     else if (rtap_core_threadid == 2'd2)
        rtap_ifu_pc_wr_en = 4'b0100;
     else if (rtap_core_threadid == 2'd3)
        rtap_ifu_pc_wr_en = 4'b1000;
  end
  rtap_ifu_pc_data = rtap_core_data[47:0];
end

  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[0])
      t0pc_f <= rtap_ifu_pc_data;
    else
      t0pc_f <= t0npc_bf;
  end


`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   // dff_s  #(49)  t1_pcf_reg(.din (t1npc_bf),
   //                            .clk (clk),
   //                            .q   (t1pc_f),
   //                            .se  (se), .si(), .so());

  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[1])
      t1pc_f <= rtap_ifu_pc_data;
    else
      t1pc_f <= t1npc_bf;
  end

   assign fdp_fcl_pc_oor_vec_f = {2'b0, t1pc_f[48], t0pc_f[48]};

   // select the pc to be used on a switch -- need to protect
   dp_mux2ds #(48) swpc_mux(.dout (swpc_bf),
                                .in0 (t0pc_f[47:0]),
                                .in1 (t1pc_f[47:0]),
                                .sel0_l (fcl_fdp_next_thr_bf_l[0]),
                                .sel1_l (fcl_fdp_next_thr_bf_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign fdp_fcl_pc_oor_vec_f = {3'b0, t0pc_f[48]};
   assign swpc_bf = t0pc_f[47:0];

`elsif THREADS_1

   assign fdp_fcl_pc_oor_vec_f = {3'b0, t0pc_f[48]};
   assign swpc_bf = t0pc_f[47:0];

`elsif THREADS_2


   // dff_s  #(49)  t1_pcf_reg(.din (t1npc_bf),
   //                            .clk (clk),
   //                            .q   (t1pc_f),
   //                            .se  (se), .si(), .so());

  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[1])
      t1pc_f <= rtap_ifu_pc_data;
    else
      t1pc_f <= t1npc_bf;
  end
   assign fdp_fcl_pc_oor_vec_f = {2'b0, t1pc_f[48], t0pc_f[48]};

   // select the pc to be used on a switch -- need to protect
   dp_mux2ds #(48) swpc_mux(.dout (swpc_bf),
                                .in0 (t0pc_f[47:0]),
                                .in1 (t1pc_f[47:0]),
                                .sel0_l (fcl_fdp_next_thr_bf_l[0]),
                                .sel1_l (fcl_fdp_next_thr_bf_l[1]));

`elsif THREADS_3

   // dff_s  #(49)  t1_pcf_reg(.din (t1npc_bf),
   //                            .clk (clk),
   //                            .q   (t1pc_f),
   //                            .se  (se), .si(), .so());
   // dff_s  #(49)  t2_pcf_reg(.din (t2npc_bf),
   //                            .clk (clk),
   //                            .q   (t2pc_f),
   //                            .se  (se), .si(), .so());

  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[1])
      t1pc_f <= rtap_ifu_pc_data;
    else
      t1pc_f <= t1npc_bf;
  end
  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[2])
      t2pc_f <= rtap_ifu_pc_data;
    else
      t2pc_f <= t2npc_bf;
  end

   assign fdp_fcl_pc_oor_vec_f = {1'b0, t2pc_f[48],
                                          t1pc_f[48], t0pc_f[48]};

   // select the pc to be used on a switch -- need to protect
   dp_mux3ds #(48) swpc_mux(.dout (swpc_bf),
                                .in0 (t0pc_f[47:0]),
                                .in1 (t1pc_f[47:0]),
                                .in2 (t2pc_f[47:0]),
                                .sel0_l (fcl_fdp_next_thr_bf_l[0]),
                                .sel1_l (fcl_fdp_next_thr_bf_l[1]),
                                .sel2_l (fcl_fdp_next_thr_bf_l[2]));

`else
   // dff_s  #(49)  t1_pcf_reg(.din (t1npc_bf),
			//                   .clk (clk),
			//                   .q   (t1pc_f),
			//                   .se  (se), .si(), .so());
   // dff_s  #(49)  t2_pcf_reg(.din (t2npc_bf),
			//                   .clk (clk),
			//                   .q   (t2pc_f),
			//                   .se  (se), .si(), .so());
   // dff_s  #(49)  t3_pcf_reg(.din (t3npc_bf),
			//                   .clk (clk),
			//                   .q   (t3pc_f),
			//                   .se  (se), .si(), .so());
  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[1])
      t1pc_f <= rtap_ifu_pc_data;
    else
      t1pc_f <= t1npc_bf;
  end
  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[2])
      t2pc_f <= rtap_ifu_pc_data;
    else
      t2pc_f <= t2npc_bf;
  end
  always @ (posedge clk)
  begin
    if (rtap_ifu_pc_wr_en[3])
      t3pc_f <= rtap_ifu_pc_data;
    else
      t3pc_f <= t3npc_bf;
  end

   assign fdp_fcl_pc_oor_vec_f = {t3pc_f[48], t2pc_f[48],
				                          t1pc_f[48], t0pc_f[48]};


   // select the pc to be used on a switch -- need to protect
   dp_mux4ds #(48) swpc_mux(.dout (swpc_bf),
			                    .in0 (t0pc_f[47:0]),
			                    .in1 (t1pc_f[47:0]),
			                    .in2 (t2pc_f[47:0]),
			                    .in3 (t3pc_f[47:0]),
			                    .sel0_l (fcl_fdp_next_thr_bf_l[0]),
			                    .sel1_l (fcl_fdp_next_thr_bf_l[1]),
			                    .sel2_l (fcl_fdp_next_thr_bf_l[2]),
			                    .sel3_l (fcl_fdp_next_thr_bf_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // choose between I$ write address and read address
   // need mux only for lower 11 bits (2+3 + ICINDEX_SIZE)
//   dp_mux2es #(48) ifqfdp_mux(.dout (icaddr_nosw_bf[47:0]),
//	     .in0  (nextpc_nosw_bf[47:0]),
//	     .in1  ({{37{1'b0}}, ifq_fdp_icindex_bf, 4'b0}),
//	     .sel  (fcl_fdp_ifqfdp_sel_ifq_bf));  // 1=ifq

   // implements switch and branch
   // can we cut this down to 11 bits? No! tlb needs all 48

//   dp_mux4ds #(48) nxt_icaddr_mux(.dout  (icaddr_bf),
//				                        .in0   (swpc_bf[47:0]),
//				                        .in1   (nextpc_nosw_bf[47:0]),
//				                        .in2   ({8'b0, {`IC_TAG_SZ{1'b0}},
//                                         ifq_fdp_icindex_bf, 4'b0}),
//				                        .in3   (exu_ifu_brpc_e[47:0]),
//				                        .sel0_l (fcl_fdp_icaddr_sel_swpc_bf_l),
//				                        .sel1_l (fcl_fdp_icaddr_sel_curr_bf_l),
//				                        .sel2_l (fcl_fdp_icaddr_sel_ifq_bf_l),
//				                        .sel3_l (fcl_fdp_icaddr_sel_br_bf_l));

//   assign fdp_icd_vaddr_bf = icaddr_bf[47:0];
   // this goes to the itlb, icd and ict on top of fdp
   // this is !!very critical!!
   assign fdp_icd_vaddr_bf = pc_bf[47:2];

   // create separate output for the icv to the left
   assign fdp_icv_index_bf = pc_bf[`IC_IDX_HI:5];

   // Place this mux as close to the top (itlb) as possible
   dp_mux3ds #(48) pcbf_mux(.dout  (pc_bf[47:0]),
			  .in0   (swpc_bf[47:0]),
			  .in1   (nextpc_nosw_bf[47:0]),
			  .in2   (exu_ifu_brpc_e[47:0]),
			  .sel0_l (fcl_fdp_pcbf_sel_swpc_bf_l),
			  .sel1_l (fcl_fdp_pcbf_sel_nosw_bf_l),
			  .sel2_l (fcl_fdp_pcbf_sel_br_bf_l));

   dff_s #(48)  pcf_reg(.din  (pc_bf),
		    .clk  (clk),
		    .q    (pc_f),
		    .se   (se), .si(), .so());


// trin: adding basic breakpointing capability on the VA pc
reg [47:0] jtag_breakpoint_pc;

always @ (posedge rclk)
begin
   if (rtap_core_val && rtap_core_id == `JTAG_CORE_ID_IFU_BREAKPOINT_PC)
   begin
      jtag_breakpoint_pc <= rtap_core_data[47:0];
   end
end


assign fdp_fcl_jtag_breakpoint_hit = (pc_bf[47:0] == jtag_breakpoint_pc[47:0]);

   assign fdp_erb_pc_f = pc_f[47:0];

    // trappc mux (choose trap pc vs rollback/uTrap pc)
   dp_mux4ds #(49) trap_pc0_mux(.dout (t0_trap_rb_pc_bf),
			      .in0  (tlu_ifu_trappc_w2),
			      .in1  (pc_d_adj),
			      .in2  (t0pc_s),
			      .in3  (pc_w),
			      .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[0]),
			      .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[0]),
			      .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[0]),
			      .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[0]));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dp_mux4ds #(49) trap_pc1_mux(.dout (t1_trap_rb_pc_bf),
                  .in0  (tlu_ifu_trappc_w2),
                  .in1  (pc_d_adj),
                  .in2  (t1pc_s),
                  .in3  (pc_w),
                  .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[1]),
                  .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[1]),
                  .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[1]),
                  .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   dp_mux4ds #(49) trap_pc1_mux(.dout (t1_trap_rb_pc_bf),
                  .in0  (tlu_ifu_trappc_w2),
                  .in1  (pc_d_adj),
                  .in2  (t1pc_s),
                  .in3  (pc_w),
                  .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[1]),
                  .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[1]),
                  .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[1]),
                  .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[1]));

`elsif THREADS_3

   dp_mux4ds #(49) trap_pc1_mux(.dout (t1_trap_rb_pc_bf),
                  .in0  (tlu_ifu_trappc_w2),
                  .in1  (pc_d_adj),
                  .in2  (t1pc_s),
                  .in3  (pc_w),
                  .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[1]),
                  .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[1]),
                  .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[1]),
                  .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[1]));

   dp_mux4ds #(49) trap_pc2_mux(.dout (t2_trap_rb_pc_bf),
                  .in0  (tlu_ifu_trappc_w2),
                  .in1  (pc_d_adj),
                  .in2  (t2pc_s),
                  .in3  (pc_w),
                  .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[2]),
                  .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[2]),
                  .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[2]),
                  .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[2]));

`else
   dp_mux4ds #(49) trap_pc1_mux(.dout (t1_trap_rb_pc_bf),
			      .in0  (tlu_ifu_trappc_w2),
			      .in1  (pc_d_adj),
			      .in2  (t1pc_s),
			      .in3  (pc_w),
			      .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[1]),
			      .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[1]),
			      .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[1]),
			      .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[1]));

   dp_mux4ds #(49) trap_pc2_mux(.dout (t2_trap_rb_pc_bf),
			      .in0  (tlu_ifu_trappc_w2),
			      .in1  (pc_d_adj),
			      .in2  (t2pc_s),
			      .in3  (pc_w),
			      .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[2]),
			      .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[2]),
			      .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[2]),
			      .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[2]));

   dp_mux4ds #(49) trap_pc3_mux(.dout (t3_trap_rb_pc_bf),
			      .in0  (tlu_ifu_trappc_w2),
			      .in1  (pc_d_adj),
			      .in2  (t3pc_s),
			      .in3  (pc_w),
			      .sel0_l  (fcl_fdp_trrbpc_sel_trap_bf_l[3]),
			      .sel1_l  (fcl_fdp_trrbpc_sel_rb_bf_l[3]),
			      .sel2_l  (fcl_fdp_trrbpc_sel_pcs_bf_l[3]),
			      .sel3_l  (fcl_fdp_trrbpc_sel_err_bf_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // can reduce this to a 2:1 mux since reset pc is not used any more and
   // pc_f is not needed.
   dp_mux3ds #(49) pcp4_mux(.dout  (nextpc_nosw_bf),
			  .in0   (pcinc_f),
			  .in1   (thr_trappc_bf),
			  .in2   ({fcl_fdp_pcoor_f, pc_f[47:0]}),
			  .sel0_l (fcl_fdp_noswpc_sel_inc_l_bf),
			  .sel1_l (fcl_fdp_noswpc_sel_tnpc_l_bf),
			  .sel2_l (fcl_fdp_noswpc_sel_old_l_bf));


   // next S stage thread pc mux per thread
   // Use advtpcs signal which works for stall (Aug '01)
   // Merged pc_e/pc_d into the eqn to allow for rollback
   dp_mux4ds #(49) t0pcf_mux(.dout (t0_next_pcs_f),
			   .in0  (t0pc_s),
			   .in1  ({fcl_fdp_pcoor_vec_f[0], t0pc_f[47:0]}),
			   .in2  (pc_d_adj),
			   .in3  (pc_e),
			   .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[0]),
			   .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[0]),
			   .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[0]),
			   .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[0]));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcs_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcs_sync_mux1 (.dout (t1_next_pcs_f),
                                               .in0 (t1_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux4ds #(49) t1pcf_mux(.dout (t1_next_pcs_bf_execdraft_f),
               .in0  (t1pc_s),
               .in1  ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
               .in2  (pc_d_adj),
               .in3  (pc_e),
               .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[1]),
               .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[1]),
               .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[1]),
               .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcs_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcs_sync_mux1 (.dout (t1_next_pcs_f),
                                               .in0 (t1_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux4ds #(49) t1pcf_mux(.dout (t1_next_pcs_bf_execdraft_f),
               .in0  (t1pc_s),
               .in1  ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
               .in2  (pc_d_adj),
               .in3  (pc_e),
               .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[1]),
               .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[1]),
               .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[1]),
               .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[1]));

`elsif THREADS_3

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcs_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcs_sync_mux1 (.dout (t1_next_pcs_f),
                                               .in0 (t1_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcs_sync_mux2 (.dout (t2_next_pcs_f),
                                               .in0 (t2_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux4ds #(49) t1pcf_mux(.dout (t1_next_pcs_bf_execdraft_f),
               .in0  (t1pc_s),
               .in1  ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
               .in2  (pc_d_adj),
               .in3  (pc_e),
               .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[1]),
               .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[1]),
               .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[1]),
               .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[1]));

   dp_mux4ds #(49) t2pcf_mux(.dout (t2_next_pcs_bf_execdraft_f),
               .in0  (t2pc_s),
               .in1  ({fcl_fdp_pcoor_vec_f[2], t2pc_f[47:0]}),
//             .in1  ({fcl_fdp_pcoor_f, pc_f[47:0]}),
               .in2  (pc_d_adj),
               .in3  (pc_e),
               .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[2]),
               .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[2]),
               .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[2]),
               .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[2]));

`else

   // mmckeown: adding an extra mux here to synchronize leader and follower pcs
   wire exec_draft_pcs_sync_mux_sel = config_dtu_esl_en ? esl_fdp_sync_pcs_bf : 1'b0;
   dp_mux2es  #(49)  exec_draft_pcs_sync_mux1 (.dout (t1_next_pcs_f),
                                               .in0 (t1_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcs_sync_mux2 (.dout (t2_next_pcs_f),
                                               .in0 (t2_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux2es  #(49)  exec_draft_pcs_sync_mux3 (.dout (t3_next_pcs_f),
                                               .in0 (t3_next_pcs_bf_execdraft_f),
                                               .in1 (t0pc_s),
                                               .sel (exec_draft_pcs_sync_mux_sel));

   dp_mux4ds #(49) t1pcf_mux(.dout (t1_next_pcs_bf_execdraft_f),
			   .in0  (t1pc_s),
			   .in1  ({fcl_fdp_pcoor_vec_f[1], t1pc_f[47:0]}),
			   .in2  (pc_d_adj),
			   .in3  (pc_e),
			   .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[1]),
			   .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[1]),
			   .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[1]),
			   .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[1]));

   dp_mux4ds #(49) t2pcf_mux(.dout (t2_next_pcs_bf_execdraft_f),
			   .in0  (t2pc_s),
			   .in1  ({fcl_fdp_pcoor_vec_f[2], t2pc_f[47:0]}),
//			   .in1  ({fcl_fdp_pcoor_f, pc_f[47:0]}),
			   .in2  (pc_d_adj),
			   .in3  (pc_e),
			   .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[2]),
			   .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[2]),
			   .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[2]),
			   .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[2]));

   dp_mux4ds #(49) t3pcf_mux(.dout (t3_next_pcs_bf_execdraft_f),
			   .in0  (t3pc_s),
			   .in1  ({fcl_fdp_pcoor_vec_f[3], t3pc_f[47:0]}),
//			   .in1  ({fcl_fdp_pcoor_f, pc_f[47:0]}),
			   .in2  (pc_d_adj),
			   .in3  (pc_e),
			   .sel0_l (fcl_fdp_nextpcs_sel_pcs_f_l[3]),
			   .sel1_l (fcl_fdp_nextpcs_sel_pcf_f_l[3]),
			   .sel2_l (fcl_fdp_nextpcs_sel_pcd_f_l[3]),
			   .sel3_l (fcl_fdp_nextpcs_sel_pce_f_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // S stage thread PC regs;  use low power thr flop
   dff_s  #(49)  t0pcs_reg(.din  (t0_next_pcs_f),
		                   .q    (t0pc_s),
		                   .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t0pc_next_s2 = t0_next_pcs_f;

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dff_s  #(49)  t1pcs_reg(.din  (t1_next_pcs_f),
                           .q    (t1pc_s),
                           .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t1pc_next_s2 = t1_next_pcs_bf_execdraft_f;

   // S stage PC mux -- need to protect
   dp_mux2ds #(49) pcs_mux(.dout (pc_s),
             .in0  (t0pc_s),
             .in1  (t1pc_s),
             .sel0_l (fcl_fdp_thr_s2_l[0]),
             .sel1_l (fcl_fdp_thr_s2_l[1]));

   // S stage next PC mux -- need to protect
   dp_mux2ds #(49) npcs_mux(.dout (npc_s),
              .in0  (t0_next_pcs_f),
              .in1  (t1_next_pcs_f),
              .sel0_l (fcl_fdp_thr_s2_l[0]),
              .sel1_l (fcl_fdp_thr_s2_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign pc_s = t0pc_s;
   assign npc_s = t0_next_pcs_f;

`elsif THREADS_1

   assign pc_s = t0pc_s;
   assign npc_s = t0_next_pcs_f;

`elsif THREADS_2

   dff_s  #(49)  t1pcs_reg(.din  (t1_next_pcs_f),
                           .q    (t1pc_s),
                           .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t1pc_next_s2 = t1_next_pcs_bf_execdraft_f;

   // S stage PC mux -- need to protect
   dp_mux2ds #(49) pcs_mux(.dout (pc_s),
             .in0  (t0pc_s),
             .in1  (t1pc_s),
             .sel0_l (fcl_fdp_thr_s2_l[0]),
             .sel1_l (fcl_fdp_thr_s2_l[1]));

   // S stage next PC mux -- need to protect
   dp_mux2ds #(49) npcs_mux(.dout (npc_s),
              .in0  (t0_next_pcs_f),
              .in1  (t1_next_pcs_f),
              .sel0_l (fcl_fdp_thr_s2_l[0]),
              .sel1_l (fcl_fdp_thr_s2_l[1]));

`elsif THREADS_3

   dff_s  #(49)  t1pcs_reg(.din  (t1_next_pcs_f),
                           .q    (t1pc_s),
                           .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t1pc_next_s2 = t1_next_pcs_bf_execdraft_f;
   dff_s  #(49)  t2pcs_reg(.din  (t2_next_pcs_f),
                           .q    (t2pc_s),
                           .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t2pc_next_s2 = t2_next_pcs_bf_execdraft_f;

   // S stage PC mux -- need to protect
   dp_mux3ds #(49) pcs_mux(.dout (pc_s),
             .in0  (t0pc_s),
             .in1  (t1pc_s),
             .in2  (t2pc_s),
             .sel0_l (fcl_fdp_thr_s2_l[0]),
             .sel1_l (fcl_fdp_thr_s2_l[1]),
             .sel2_l (fcl_fdp_thr_s2_l[2]));

   // S stage next PC mux -- need to protect
   dp_mux3ds #(49) npcs_mux(.dout (npc_s),
              .in0  (t0_next_pcs_f),
              .in1  (t1_next_pcs_f),
              .in2  (t2_next_pcs_f),
              .sel0_l (fcl_fdp_thr_s2_l[0]),
              .sel1_l (fcl_fdp_thr_s2_l[1]),
              .sel2_l (fcl_fdp_thr_s2_l[2]));

`else
   dff_s  #(49)  t1pcs_reg(.din  (t1_next_pcs_f),
		                   .q    (t1pc_s),
		                   .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t1pc_next_s2 = t1_next_pcs_bf_execdraft_f;
   dff_s  #(49)  t2pcs_reg(.din  (t2_next_pcs_f),
		                   .q    (t2pc_s),
		                   .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t2pc_next_s2 = t2_next_pcs_bf_execdraft_f;
   dff_s  #(49)  t3pcs_reg(.din  (t3_next_pcs_f),
		                   .q    (t3pc_s),
		                   .clk  (clk),  .se(se), .si(), .so());
   assign fdp_esl_t3pc_next_s2 = t3_next_pcs_bf_execdraft_f;

   // S stage PC mux -- need to protect
   dp_mux4ds #(49) pcs_mux(.dout (pc_s),
			 .in0  (t0pc_s),
			 .in1  (t1pc_s),
			 .in2  (t2pc_s),
			 .in3  (t3pc_s),
			 .sel0_l (fcl_fdp_thr_s2_l[0]),
			 .sel1_l (fcl_fdp_thr_s2_l[1]),
			 .sel2_l (fcl_fdp_thr_s2_l[2]),
			 .sel3_l (fcl_fdp_thr_s2_l[3]));

   // S stage next PC mux -- need to protect
   dp_mux4ds #(49) npcs_mux(.dout (npc_s),
			  .in0  (t0_next_pcs_f),
			  .in1  (t1_next_pcs_f),
			  .in2  (t2_next_pcs_f),
			  .in3  (t3_next_pcs_f),
			  .sel0_l (fcl_fdp_thr_s2_l[0]),
			  .sel1_l (fcl_fdp_thr_s2_l[1]),
			  .sel2_l (fcl_fdp_thr_s2_l[2]),
			  .sel3_l (fcl_fdp_thr_s2_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // D stage PC and nPC
   dff_s  #(49)  pcd_reg(.din (pc_s),
		                 .q   (pc_d),
		                 .clk (clk),  .se(se), .si(), .so());
   dff_s  #(49)  npcd_reg(.din  (npc_s),
		                  .q    (npc_d),
		                  .clk  (clk), .se(se), .si(), .so());

   assign am_mask = {{17{~fcl_fdp_addr_mask_d}}, 32'hffffffff};

   // nand2
   assign pc_d_adj = pc_d & am_mask;
   assign npc_d_adj = npc_d & am_mask;

   assign ifu_exu_pc_d = pc_d_adj[47:0];

   // E stage PC and nPC
   dff_s  #(49)  pce_reg(.din (pc_d_adj),
		                 .q   (pc_e),
		                 .clk (clk), .se(se), .si(), .so());
   dff_s  #(49)  npce_reg(.din  (npc_d_adj),
		                  .q    (npc_e),
		                  .clk (clk), .se(se), .si(), .so());

   assign fdp_fcl_pc_oor_e = pc_e[48];
   assign ifu_tlu_pc_oor_e = pc_e[48];

   // M stage PC and nPC
   dff_s  #(49)  pcm_reg(.din  (pc_e),
		                 .q    (pc_m),
		                 .clk  (clk),  .se(se), .si(), .so());
   dff_s  #(49)  npcm_reg(.din (npc_e),
		                  .q   (npc_m),
		                  .clk (clk), .se(se), .si(), .so());
   assign ifu_tlu_pc_m = pc_m[48:0];
   assign ifu_tlu_npc_m = npc_m[48:0];

   // W stage PC and nPC
   dff_s  #(49)  pcw_reg(.din  (pc_m),
		                 .q    (pc_w),
		                 .clk  (clk),  .se(se), .si(), .so());
   dff_s  #(49)  npcw_reg(.din (npc_m),
		                  .q   (npc_w),
		                  .clk (clk), .se(se), .si(), .so());

//   assign ifu_tlu_pc_w = pc_w;
//   assign ifu_tlu_npc_w = npc_w;

   // PC incrementer
   // can we fit the ofl logic on the side of the incrementer?
   assign pcinc_f[1:0] = pc_f[1:0];
   sparc_ifu_incr46 pc_inc(.a     (pc_f[47:2]),
			                     .a_inc (pcinc_f[47:2]),
			                     .ofl   ());   // ofl output not needed

//   assign pcinc_f[48] = inc_ofl & ~fcl_fdp_mask32b_f | fcl_fdp_pcoor_f;
   assign pcinc_f[48] = ~pc_f[47] & pcinc_f[47] & ~fcl_fdp_mask32b_f |
                        fcl_fdp_pcoor_f;

   // Enable for thr trapnpc reg
   dp_mux4ds #(49) t0tnpc_mux(.dout (trapnpc0_bf),
			                        .in0  (tlu_ifu_trapnpc_w2),
			                        .in1  (npc_w),
                              .in2  (t0pc_f),
			                        .in3  (t0_trapnpc_f),
			                        .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[0]),
			                        .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[0]),
			                        .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[0]),
			                        .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[0]));
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dp_mux4ds #(49) t1tnpc_mux(.dout (trapnpc1_bf),
                .in0  (tlu_ifu_trapnpc_w2),
                .in1  (npc_w),
          .in2  (t1pc_f),
                .in3  (t1_trapnpc_f),
                .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[1]),
                .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[1]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[1]),
                .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   dp_mux4ds #(49) t1tnpc_mux(.dout (trapnpc1_bf),
                .in0  (tlu_ifu_trapnpc_w2),
                .in1  (npc_w),
          .in2  (t1pc_f),
                .in3  (t1_trapnpc_f),
                .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[1]),
                .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[1]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[1]),
                .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[1]));

`elsif THREADS_3

   dp_mux4ds #(49) t1tnpc_mux(.dout (trapnpc1_bf),
                .in0  (tlu_ifu_trapnpc_w2),
                .in1  (npc_w),
          .in2  (t1pc_f),
                .in3  (t1_trapnpc_f),
                .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[1]),
                .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[1]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[1]),
                .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[1]));

   dp_mux4ds #(49) t2tnpc_mux(.dout (trapnpc2_bf),
                .in0  (tlu_ifu_trapnpc_w2),
                .in1  (npc_w),
          .in2  (t2pc_f),
                .in3  (t2_trapnpc_f),
                .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[2]),
                .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[2]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[2]),
                .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[2]));

`else
   dp_mux4ds #(49) t1tnpc_mux(.dout (trapnpc1_bf),
			    .in0  (tlu_ifu_trapnpc_w2),
			    .in1  (npc_w),
          .in2  (t1pc_f),
			    .in3  (t1_trapnpc_f),
			    .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[1]),
			    .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[1]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[1]),
			    .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[1]));

   dp_mux4ds #(49) t2tnpc_mux(.dout (trapnpc2_bf),
			    .in0  (tlu_ifu_trapnpc_w2),
			    .in1  (npc_w),
          .in2  (t2pc_f),
			    .in3  (t2_trapnpc_f),
			    .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[2]),
			    .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[2]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[2]),
			    .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[2]));

   dp_mux4ds #(49) t3tnpc_mux(.dout (trapnpc3_bf),
			    .in0  (tlu_ifu_trapnpc_w2),
			    .in1  (npc_w),
          .in2  (t3pc_f),
			    .in3  (t3_trapnpc_f),
			    .sel0_l  (fcl_fdp_thrtnpc_sel_tnpc_l[3]),
			    .sel1_l  (fcl_fdp_thrtnpc_sel_npcw_l[3]),
          .sel2_l  (fcl_fdp_thrtnpc_sel_pcf_l[3]),
			    .sel3_l  (fcl_fdp_thrtnpc_sel_old_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // thread next trap pc reg
   dff_s #(49) t0tnpcf_reg(.din  (trapnpc0_bf),
		                   .q    (t0_trapnpc_f),
		                   .clk  (clk),  .se(se), .si(), .so());
`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dff_s #(49) t1tnpcf_reg(.din  (trapnpc1_bf),
                           .q    (t1_trapnpc_f),
                           .clk  (clk),  .se(se), .si(), .so());

   dp_mux2ds #(49) nxttpc_mux(.dout (thr_trappc_bf),
                .in0  (t0_trapnpc_f),
                .in1  (t1_trapnpc_f),
                .sel0_l (fcl_fdp_thr_s2_l[0]), // thr_s2 = thr_f
                .sel1_l (fcl_fdp_thr_s2_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign thr_trappc_bf = t0_trapnpc_f;

`elsif THREADS_1

   assign thr_trappc_bf = t0_trapnpc_f;

`elsif THREADS_2

   dff_s #(49) t1tnpcf_reg(.din  (trapnpc1_bf),
                           .q    (t1_trapnpc_f),
                           .clk  (clk),  .se(se), .si(), .so());

   dp_mux2ds #(49) nxttpc_mux(.dout (thr_trappc_bf),
                .in0  (t0_trapnpc_f),
                .in1  (t1_trapnpc_f),
                .sel0_l (fcl_fdp_thr_s2_l[0]), // thr_s2 = thr_f
                .sel1_l (fcl_fdp_thr_s2_l[1]));

`elsif THREADS_3

   dff_s #(49) t1tnpcf_reg(.din  (trapnpc1_bf),
                           .q    (t1_trapnpc_f),
                           .clk  (clk),  .se(se), .si(), .so());
   dff_s #(49) t2tnpcf_reg(.din  (trapnpc2_bf),
                           .q    (t2_trapnpc_f),
                           .clk  (clk),  .se(se), .si(), .so());

   dp_mux3ds #(49) nxttpc_mux(.dout (thr_trappc_bf),
                .in0  (t0_trapnpc_f),
                .in1  (t1_trapnpc_f),
                .in2  (t2_trapnpc_f),
                .sel0_l (fcl_fdp_thr_s2_l[0]), // thr_s2 = thr_f
                .sel1_l (fcl_fdp_thr_s2_l[1]),
                .sel2_l (fcl_fdp_thr_s2_l[2]));

`else
   dff_s #(49) t1tnpcf_reg(.din  (trapnpc1_bf),
		                   .q    (t1_trapnpc_f),
		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(49) t2tnpcf_reg(.din  (trapnpc2_bf),
		                   .q    (t2_trapnpc_f),
		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(49) t3tnpcf_reg(.din  (trapnpc3_bf),
		                   .q    (t3_trapnpc_f),
		                   .clk  (clk),  .se(se), .si(), .so());

   dp_mux4ds #(49) nxttpc_mux(.dout (thr_trappc_bf),
			    .in0  (t0_trapnpc_f),
			    .in1  (t1_trapnpc_f),
			    .in2  (t2_trapnpc_f),
			    .in3  (t3_trapnpc_f),
			    .sel0_l (fcl_fdp_thr_s2_l[0]), // thr_s2 = thr_f
			    .sel1_l (fcl_fdp_thr_s2_l[1]),
			    .sel2_l (fcl_fdp_thr_s2_l[2]),
			    .sel3_l (fcl_fdp_thr_s2_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // During rst nextpc_nosw_bf = PO_RESET_PC.  All thread PC_f registers,
   // the icaddr_f register and the nextpc register should be loaded
   // with nextpc_nosw_bf during reset.
   // Eventually, we will load the reset_pc from the trap logic unit,
   // which will arrive on the trap_pc bus.


   // TBD in PC datapath:
   // 1.  Add useNIR bit to PCs  -- DONE
   // 2.  Add support for ifq request grant -- DONE
   // 3.  Generate icache read signal (from fcl?) -- DONE
   // 4.  Rollback functionality -- DONE
   // 5.  PC range checks -- DONE
   // 6.  Change PC to 48 bit value -- DONE


//----------------------------------------------------------------------
// Fetched Instruction Datapath
//----------------------------------------------------------------------

// This is logically 33 bits wide.  The NIR and IR datapaths are laid
// side by side, making this a 66bit datapath.  The NIR path is
// potentially a little longer.

// mmckeown
// Added datapath for physical address

   // Pipe forward the PC in F
   dff_s #(8) pc_paddr_s_reg(.din (pc_f[9:2]),
                             .q (pc_offset_s[9:2]),
                             .clk (clk), .se(se), .si(), .so());

   // Physical address of fetched instruction. pgnum comes from itlb, the offset
   // comes from the offset in the PC, and the bottom 2 bits are always 0
   assign fetpaddr_s1[39:2] = {itlb_fdp_paddr_s[39:10] & {30{~fcl_fdp_tlbmiss_s1}},
                               pc_offset_s[9:2]};

   // choose between NIR data and fetched data
   dp_mux2es #(33)  usenir_mux(.dout (inst_s1),
			                       .in0  (icd_fdp_fetdata_s1[32:0]),
			                       .in1  (nirdata_s1),
			                       .sel  (fcl_fdp_usenir_sel_nir_s1));  // 1=nir

   dp_mux2es #(38)  usenir_paddr_mux (.dout(inst_paddr_s1[39:2]),
                                      .in0 (fetpaddr_s1[39:2]),
                                      .in1 (nirpaddr_s1[39:2]),
                                      .sel (fcl_fdp_usenir_sel_nir_s1));

   // mmckeown: latch previous issued instruction in case of
   //           replay for execution drafting
   dff_s #(33) fdp_inst_s_prev_reg (.din (fdp_inst_s),
                                    .q (fdp_inst_s_prev),
                                    .clk (clk), .se (se), .si(), .so());

   // mmckeown: adding an extra mux here to be able to execute the
   //           previous instruction for execution drafting
   wire exec_draft_replay_mux_sel = config_dtu_esl_en ? esl_fdp_issue_prev_inst_s : 1'b0;
   dp_mux2es  #(33)  exec_draft_replay_mux (.dout (fdp_inst_s),
                                            .in0 (fdp_inst_bf_execdraft_s),
                                            .in1 (fdp_inst_s_prev),
                                            .sel(exec_draft_replay_mux_sel));
   // Instruction Output Mux
   // CHANGE: now 4:1
   dp_mux4ds  #(33)  instout_mux(.dout (fdp_inst_bf_execdraft_s),
			                         .in0 (icd_fdp_fetdata_s1[32:0]),
			                         .in1 (inst_s2),
			                         .in2 ({`NOP, 1'b0}),
			                         .in3 (nirdata_s1[32:0]),
			                         .sel0_l (fcl_fdp_inst_sel_curr_s_l),
			                         .sel1_l (fcl_fdp_inst_sel_switch_s_l),
			                         .sel2_l (fcl_fdp_inst_sel_nop_s_l),
			                         .sel3_l (fcl_fdp_inst_sel_nir_s_l));

   dp_mux4ds  #(38)  instout_paddr_mux (.dout (fdp_inst_paddr_s[39:2]),
                                        .in0 (fetpaddr_s1[39:2]),
                                        .in1 (inst_paddr_s2[39:2]),
                                        .in2 (38'b0),
                                        .in3 (nirpaddr_s1[39:2]),
                                        .sel0_l (fcl_fdp_inst_sel_curr_s_l),
                                        .sel1_l (fcl_fdp_inst_sel_switch_s_l),
                                        .sel2_l (fcl_fdp_inst_sel_nop_s_l),
                                        .sel3_l (fcl_fdp_inst_sel_nir_s_l));

   assign fdp_fcl_swc_s2 = fdp_inst_s[0];

   assign fdp_fcl_op_s = fdp_inst_s[32:31];
   assign fdp_fcl_op3_s = fdp_inst_s[25:22];
   assign fdp_fcl_ibit_s = fdp_inst_s[14];

   assign fdp_dtu_inst_s = fdp_inst_s[32:1];

   // CHANGE: Random logic to fix timing paths
   // output pin on RHS, as close to IRF as possible
   // 16x drivers
   // nand2-xor-invert
   assign ifu_exu_rs1_s[4] = fdp_inst_s[19] ^
			                       (fdp_inst_s[18] & fcl_fdp_oddwin_s);
   assign ifu_exu_rs1_s[3:0] = fdp_inst_s[18:15];

   assign ifu_exu_rs2_s[4] = (fdp_inst_s[5] ^
			                        (fdp_inst_s[4] & fcl_fdp_oddwin_s));
   assign ifu_exu_rs2_s[3:0] = fdp_inst_s[4:1];

   assign ifu_exu_rs3_s[4] = (fdp_inst_s[30] ^
			                        (fdp_inst_s[29] & fcl_fdp_oddwin_s));
   assign ifu_exu_rs3_s[3:0] = fdp_inst_s[29:26];


   dp_buffer #(33) insts1_buf(inst_s1_bf1, inst_s1[32:0]);

   dp_buffer #(38) inst_paddrs1_buf(inst_paddr_s1_bf1[39:2], inst_paddr_s1[39:2]);

   // Thread instruction muxes
   dp_mux4ds #(33)  t0inst_mux(.dout (t0inst_s1),
			     .in0 (ifq_fdp_fill_inst),
			     .in1 (inst_s1_bf1),
			     .in2 (t0inst_s2),
			     .in3 (rb_inst0_s),
			     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[0]),
			     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[0]),
			     .sel2_l (fcl_fdp_tinst_sel_old_s_l[0]),
			     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[0]));

   dp_mux4ds #(38) t0inst_paddr_mux (.dout (t0inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t0inst_paddr_s2[39:2]),
                                     .in3 (rb_inst0_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[0]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[0]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[0]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[0]));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dp_mux4ds #(33)  t1inst_mux(.dout (t1inst_s1),
                 .in0 (ifq_fdp_fill_inst),
                 .in1 (inst_s1_bf1),
                 .in2 (t1inst_s2),
                 .in3 (rb_inst1_s),
                 .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                 .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                 .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                 .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(38) t1inst_paddr_mux (.dout (t1inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t1inst_paddr_s2[39:2]),
                                     .in3 (rb_inst1_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   dp_mux4ds #(33)  t1inst_mux(.dout (t1inst_s1),
                 .in0 (ifq_fdp_fill_inst),
                 .in1 (inst_s1_bf1),
                 .in2 (t1inst_s2),
                 .in3 (rb_inst1_s),
                 .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                 .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                 .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                 .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(38) t1inst_paddr_mux (.dout (t1inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t1inst_paddr_s2[39:2]),
                                     .in3 (rb_inst1_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

`elsif THREADS_3

   dp_mux4ds #(33)  t1inst_mux(.dout (t1inst_s1),
                 .in0 (ifq_fdp_fill_inst),
                 .in1 (inst_s1_bf1),
                 .in2 (t1inst_s2),
                 .in3 (rb_inst1_s),
                 .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                 .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                 .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                 .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(38) t1inst_paddr_mux (.dout (t1inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t1inst_paddr_s2[39:2]),
                                     .in3 (rb_inst1_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(33)  t2inst_mux(.dout (t2inst_s1),
                 .in0 (ifq_fdp_fill_inst),
                 .in1 (inst_s1_bf1),
                 .in2 (t2inst_s2),
                 .in3 (rb_inst2_s),
                 .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[2]),
                 .sel1_l (fcl_fdp_tinst_sel_curr_s_l[2]),
                 .sel2_l (fcl_fdp_tinst_sel_old_s_l[2]),
                 .sel3_l (fcl_fdp_tinst_sel_rb_s_l[2]));

   dp_mux4ds #(38) t2inst_paddr_mux (.dout (t2inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t2inst_paddr_s2[39:2]),
                                     .in3 (rb_inst2_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[2]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[2]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[2]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[2]));

`else
   dp_mux4ds #(33)  t1inst_mux(.dout (t1inst_s1),
			     .in0 (ifq_fdp_fill_inst),
			     .in1 (inst_s1_bf1),
			     .in2 (t1inst_s2),
			     .in3 (rb_inst1_s),
			     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
			     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
			     .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
			     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(38) t1inst_paddr_mux (.dout (t1inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t1inst_paddr_s2[39:2]),
                                     .in3 (rb_inst1_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[1]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[1]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[1]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[1]));

   dp_mux4ds #(33)  t2inst_mux(.dout (t2inst_s1),
			     .in0 (ifq_fdp_fill_inst),
			     .in1 (inst_s1_bf1),
			     .in2 (t2inst_s2),
			     .in3 (rb_inst2_s),
			     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[2]),
			     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[2]),
			     .sel2_l (fcl_fdp_tinst_sel_old_s_l[2]),
			     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[2]));

   dp_mux4ds #(38) t2inst_paddr_mux (.dout (t2inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t2inst_paddr_s2[39:2]),
                                     .in3 (rb_inst2_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[2]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[2]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[2]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[2]));

   dp_mux4ds #(33)  t3inst_mux(.dout (t3inst_s1),
			     .in0 (ifq_fdp_fill_inst),
			     .in1 (inst_s1_bf1),
			     .in2 (t3inst_s2),
			     .in3 (rb_inst3_s),
			     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[3]),
			     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[3]),
			     .sel2_l (fcl_fdp_tinst_sel_old_s_l[3]),
			     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[3]));

   dp_mux4ds #(38) t3inst_paddr_mux (.dout (t3inst_paddr_s1[39:2]),
                                     .in0 (ifq_fdp_fill_paddr[39:2]),
                                     .in1 (inst_paddr_s1_bf1[39:2]),
                                     .in2 (t3inst_paddr_s2[39:2]),
                                     .in3 (rb_inst3_paddr_s[39:2]),
                                     .sel0_l (fcl_fdp_tinst_sel_ifq_s_l[3]),
                                     .sel1_l (fcl_fdp_tinst_sel_curr_s_l[3]),
                                     .sel2_l (fcl_fdp_tinst_sel_old_s_l[3]),
                                     .sel3_l (fcl_fdp_tinst_sel_rb_s_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // Thread Instruction Register
   dff_s #(33) t0_inst_reg(.din  (t0inst_s1),
		                   .q    (t0inst_s2),
		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t0_inst_paddr_reg (.din (t0inst_paddr_s1[39:2]),
                                  .q (t0inst_paddr_s2[39:2]),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t0inst_next_s2 = t0inst_s1;
   assign fdp_esl_t0inst_paddr_next_s2 = t0inst_paddr_s1;

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dff_s #(33) t1_inst_reg(.din  (t1inst_s1),
                           .q    (t1inst_s2),
                           .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t1_inst_paddr_reg (.din (t1inst_paddr_s1),
                                  .q (t1inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t1inst_next_s2 = t1inst_s1;
   assign fdp_esl_t1inst_paddr_next_s2 = t1inst_paddr_s1;

   // switch instruction mux -- choose the instruction to switch to
   // fcl keep track of which t*inst_s2 is valid
   dp_mux2ds  #(33) swinst_mux(.dout (inst_s2),
                 .in0  (t0inst_s2),
                 .in1  (t1inst_s2),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]));

   dp_mux2ds #(38) swinst_paddr_mux (.dout (inst_paddr_s2),
                                     .in0 (t0inst_paddr_s2),
                                     .in1 (t1inst_paddr_s2),
                                     .sel0_l (fcl_fdp_thr_s2_l[0]),
                                     .sel1_l (fcl_fdp_thr_s2_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign inst_s2 = t0inst_s2;
   assign inst_paddr_s2 = t0inst_paddr_s2;

`elsif THREADS_1

   assign inst_s2 = t0inst_s2;
   assign inst_paddr_s2 = t0inst_paddr_s2;

`elsif THREADS_2

   dff_s #(33) t1_inst_reg(.din  (t1inst_s1),
                           .q    (t1inst_s2),
                           .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t1_inst_paddr_reg (.din (t1inst_paddr_s1),
                                  .q (t1inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t1inst_next_s2 = t1inst_s1;
   assign fdp_esl_t1inst_paddr_next_s2 = t1inst_paddr_s1;

   // switch instruction mux -- choose the instruction to switch to
   // fcl keep track of which t*inst_s2 is valid
   dp_mux2ds  #(33) swinst_mux(.dout (inst_s2),
                 .in0  (t0inst_s2),
                 .in1  (t1inst_s2),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]));

   dp_mux2ds #(38) swinst_paddr_mux (.dout (inst_paddr_s2),
                                     .in0 (t0inst_paddr_s2),
                                     .in1 (t1inst_paddr_s2),
                                     .sel0_l (fcl_fdp_thr_s2_l[0]),
                                     .sel1_l (fcl_fdp_thr_s2_l[1]));

`elsif THREADS_3

   dff_s #(33) t1_inst_reg(.din  (t1inst_s1),
                           .q    (t1inst_s2),
                           .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t1_inst_paddr_reg (.din (t1inst_paddr_s1),
                                  .q (t1inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t1inst_next_s2 = t1inst_s1;
   assign fdp_esl_t1inst_paddr_next_s2 = t1inst_paddr_s1;

   dff_s #(33) t2_inst_reg(.din  (t2inst_s1),
                           .q    (t2inst_s2),
                           .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t2_inst_paddr_reg (.din (t2inst_paddr_s1),
                                  .q (t2inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t2inst_next_s2 = t2inst_s1;
   assign fdp_esl_t2inst_paddr_next_s2 = t2inst_paddr_s1;

   // switch instruction mux -- choose the instruction to switch to
   // fcl keep track of which t*inst_s2 is valid
   dp_mux3ds  #(33) swinst_mux(.dout (inst_s2),
                 .in0  (t0inst_s2),
                 .in1  (t1inst_s2),
                 .in2  (t2inst_s2),
                 .sel0_l (fcl_fdp_thr_s2_l[0]),
                 .sel1_l (fcl_fdp_thr_s2_l[1]),
                 .sel2_l (fcl_fdp_thr_s2_l[2]));
   dp_mux3ds  #(38) swinst_paddr_mux (.dout (inst_paddr_s2),
                                      .in0 (t0inst_paddr_s2),
                                      .in1 (t1inst_paddr_s2),
                                      .in2 (t2inst_paddr_s2),
                                      .sel0_l (fcl_fdp_thr_s2_l[0]),
                                      .sel1_l (fcl_fdp_thr_s2_l[1]),
                                      .sel2_l (fcl_fdp_thr_s2_l[2]));

`else
   dff_s #(33) t1_inst_reg(.din  (t1inst_s1),
		                   .q    (t1inst_s2),
   		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t1_inst_paddr_reg (.din (t1inst_paddr_s1),
                                  .q (t1inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t1inst_next_s2 = t1inst_s1;
   assign fdp_esl_t1inst_paddr_next_s2 = t1inst_paddr_s1;

   dff_s #(33) t2_inst_reg(.din  (t2inst_s1),
		                   .q    (t2inst_s2),
		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t2_inst_paddr_reg (.din (t2inst_paddr_s1),
                                  .q (t2inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t2inst_next_s2 = t2inst_s1;
   assign fdp_esl_t2inst_paddr_next_s2 = t2inst_paddr_s1;

   dff_s #(33) t3_inst_reg(.din  (t3inst_s1),
		                   .q    (t3inst_s2),
		                   .clk  (clk),  .se(se), .si(), .so());
   dff_s #(38) t3_inst_paddr_reg (.din (t3inst_paddr_s1),
                                  .q (t3inst_paddr_s2),
                                  .clk (clk), .se(se), .si(), .so());
   assign fdp_esl_t3inst_next_s2 = t3inst_s1;
   assign fdp_esl_t3inst_paddr_next_s2 = t3inst_paddr_s1;

   // switch instruction mux -- choose the instruction to switch to
   // fcl keep track of which t*inst_s2 is valid
   dp_mux4ds  #(33) swinst_mux(.dout (inst_s2),
			     .in0  (t0inst_s2),
			     .in1  (t1inst_s2),
			     .in2  (t2inst_s2),
			     .in3  (t3inst_s2),
			     .sel0_l (fcl_fdp_thr_s2_l[0]),
			     .sel1_l (fcl_fdp_thr_s2_l[1]),
			     .sel2_l (fcl_fdp_thr_s2_l[2]),
			     .sel3_l (fcl_fdp_thr_s2_l[3]));
   dp_mux4ds  #(38) swinst_paddr_mux (.dout (inst_paddr_s2),
                                      .in0 (t0inst_paddr_s2),
                                      .in1 (t1inst_paddr_s2),
                                      .in2 (t2inst_paddr_s2),
                                      .in3 (t3inst_paddr_s2),
                                      .sel0_l (fcl_fdp_thr_s2_l[0]),
                                      .sel1_l (fcl_fdp_thr_s2_l[1]),
                                      .sel2_l (fcl_fdp_thr_s2_l[2]),
                                      .sel3_l (fcl_fdp_thr_s2_l[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // Rollback instruction
   dff_s #(33) rbinst_d_reg(.din (fdp_inst_s[32:0]),
			                  .q   (inst_d),
			                  .clk (clk),
			                  .se  (se), .si(), .so());
   dff_s #(38) rbinst_paddr_d_reg (.din (fdp_inst_paddr_s[39:2]),
                                   .q (inst_paddr_d),
                                   .clk (clk),
                                   .se (se), .si(), .so());

   dff_s #(33) rbinst_e_reg(.din (inst_d),
			                  .q   (inst_e),
			                  .clk (clk),
			                  .se  (se), .si(), .so());
   dff_s #(38) rbinst_paddr_e_reg (.din (inst_paddr_d),
                                   .q (inst_paddr_e),
                                   .clk (clk),
                                   .se (se), .si(), .so());

   dp_mux2es #(33) rbinst0_mux(.dout (rb_inst0_s),
			                       .in0  (inst_d),
			                       .in1  (inst_e),
			                       .sel  (fcl_fdp_rbinst_sel_inste_s[0]));
   dp_mux2es #(38) rbinst0_paddr_mux (.dout (rb_inst0_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[0]));

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   dp_mux2es #(33) rbinst1_mux(.dout (rb_inst1_s),
                                   .in0  (inst_d),
                                   .in1  (inst_e),
                                   .sel  (fcl_fdp_rbinst_sel_inste_s[1]));
   dp_mux2es #(38) rbinst1_paddr_mux (.dout (rb_inst1_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD

`elsif THREADS_1

`elsif THREADS_2

   dp_mux2es #(33) rbinst1_mux(.dout (rb_inst1_s),
                                   .in0  (inst_d),
                                   .in1  (inst_e),
                                   .sel  (fcl_fdp_rbinst_sel_inste_s[1]));
   dp_mux2es #(38) rbinst1_paddr_mux (.dout (rb_inst1_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[1]));

`elsif THREADS_3

   dp_mux2es #(33) rbinst1_mux(.dout (rb_inst1_s),
                                   .in0  (inst_d),
                                   .in1  (inst_e),
                                   .sel  (fcl_fdp_rbinst_sel_inste_s[1]));
   dp_mux2es #(38) rbinst1_paddr_mux (.dout (rb_inst1_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[1]));

   dp_mux2es #(33) rbinst2_mux(.dout (rb_inst2_s),
                                   .in0  (inst_d),
                                   .in1  (inst_e),
                                   .sel  (fcl_fdp_rbinst_sel_inste_s[2]));
   dp_mux2es #(38) rbinst2_paddr_mux (.dout (rb_inst2_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[2]));

`else
   dp_mux2es #(33) rbinst1_mux(.dout (rb_inst1_s),
			                       .in0  (inst_d),
			                       .in1  (inst_e),
			                       .sel  (fcl_fdp_rbinst_sel_inste_s[1]));
   dp_mux2es #(38) rbinst1_paddr_mux (.dout (rb_inst1_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[1]));

   dp_mux2es #(33) rbinst2_mux(.dout (rb_inst2_s),
			                       .in0  (inst_d),
			                       .in1  (inst_e),
			                       .sel  (fcl_fdp_rbinst_sel_inste_s[2]));
   dp_mux2es #(38) rbinst2_paddr_mux (.dout (rb_inst2_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[2]));

   dp_mux2es #(33) rbinst3_mux(.dout (rb_inst3_s),
			                       .in0  (inst_d),
			                       .in1  (inst_e),
			                       .sel  (fcl_fdp_rbinst_sel_inste_s[3]));
   dp_mux2es #(38) rbinst3_paddr_mux (.dout (rb_inst3_paddr_s),
                                      .in0 (inst_paddr_d),
                                      .in1 (inst_paddr_e),
                                      .sel  (fcl_fdp_rbinst_sel_inste_s[3]));
`endif

`endif // `ifndef CONFIG_NUM_THREADS

//----------------------------------------------------------------------
// Next Instruction Datapath
//----------------------------------------------------------------------

   // Thread next instruction muxes
//   dp_mux2es #(33) t0nir_mux(.dout (t0nir_in),
//			                     .in0 (icd_fdp_topdata_s1[32:0]),
//			                     .in1 (t0nir),
//			                     .sel (fcl_fdp_thr_s1_l[0]));  // 0=new
//   dp_mux2es #(33) t1nir_mux(.dout (t1nir_in),
//			                     .in0 (icd_fdp_topdata_s1[32:0]),
//			                     .in1 (t1nir),
//			                     .sel (fcl_fdp_thr_s1_l[1]));
//   dp_mux2es #(33) t2nir_mux(.dout (t2nir_in),
//			                     .in0 (icd_fdp_topdata_s1[32:0]),
//			                     .in1 (t2nir),
//			                     .sel (fcl_fdp_thr_s1_l[2]));
//   dp_mux2es #(33) t3nir_mux(.dout (t3nir_in),
//			                     .in0 (icd_fdp_topdata_s1[32:0]),
//			                     .in1 (t3nir),
//			                     .sel (fcl_fdp_thr_s1_l[3]));

   // mmckeown
   // Added datapath for physical address to NIRs

   // Pipe forward the offset of the incremented PC in F
   // (incremented PC because this is the second instruction
   // fetched)
   dff_s #(8) pcinc_s_reg (.din(pcinc_f[9:2]),
                           .q(pcinc_s[9:2]),
                           .clk(clk), .se(se), .si(), .so());

   // Physical address for NIR. pgnum comes from itlb, the offset
   // comes from the offset in the incremented PC (as this is the instruction
   // following the one that was fetched), and the bottom 2 bits are always 0
   assign toppaddr_s1 = {itlb_fdp_paddr_s[39:10] & {30{~fcl_fdp_tlbmiss_s1}}, pcinc_s[9:2]};

   // Thread Next Instruction Register
   wire   clk_nir0;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir0(.rclk (rclk),
                              .clk  (clk_nir0),
                              .en_l (fcl_fdp_thr_s1_l[0]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33) t0nir_reg(.din (icd_fdp_topdata_s1[32:0]),
		                   .q    (t0nir),
		                   .en  (~(fcl_fdp_thr_s1_l[0])), .clk(rclk), .se(se), .si(), .so());
   dffe_s #(38) t0nir_paddr_reg (.din(toppaddr_s1[39:2]),
                                 .q(t0nir_paddr[39:2]),
                                 .en(~(fcl_fdp_thr_s1_l[0])), .clk(rclk), .se(se), .si(), .so());
`else

   dff_s #(33) t0nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t0nir),
		                   .clk  (clk_nir0), .se(se), .si(), .so());
   dff_s #(38) t0nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t0nir_paddr[39:2]),
                                .clk (clk_nir0), .se(se), .si(), .so ());
`endif

`ifndef CONFIG_NUM_THREADS // Use two threads unless this is defined

   wire   clk_nir1;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir1(.rclk (rclk),
                              .clk  (clk_nir1),
                              .en_l (fcl_fdp_thr_s1_l[1]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33)  t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .en (~(fcl_fdp_thr_s1_l[1])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38)  t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                  .q (t1nir_paddr[39:2]),
                                  .en (~(fcl_fdp_thr_s1_l[1])), .clk (rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .clk  (clk_nir1), .se(se), .si(), .so());
   dff_s #(38) t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t1nir_paddr[39:2]),
                                .clk (clk_nir1), .se(se), .si(), .so());
`endif

   // Next thread NIR mux  (nir output mux)
   dp_mux2ds  #(33) nextnir_mux(.dout (nirdata_s1),
                                  .in0 (t0nir),
                              .in1 (t1nir),
                                  .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                  .sel1_l (fcl_fdp_nirthr_s1_l[1]));

   dp_mux2ds  #(38) nextnir_paddr_mux (.dout (nirpaddr_s1),
                                       .in0 (t0nir_paddr),
                                       .in1 (t1nir_paddr),
                                       .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                       .sel1_l (fcl_fdp_nirthr_s1_l[1]));

`else // `ifndef CONFIG_NUM_THREADS

`ifdef FPGA_SYN_1THREAD
   assign nirdata_s1 = t0nir;
   assign nirpaddr_s1 = t0nir_paddr;

`elsif THREADS_1
   assign nirdata_s1 = t0nir;
   assign nirpaddr_s1 = t0nir_paddr;

`elsif THREADS_2

   wire   clk_nir1;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir1(.rclk (rclk),
                              .clk  (clk_nir1),
                              .en_l (fcl_fdp_thr_s1_l[1]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33)  t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .en (~(fcl_fdp_thr_s1_l[1])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38)  t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                  .q (t1nir_paddr[39:2]),
                                  .en (~(fcl_fdp_thr_s1_l[1])), .clk (rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .clk  (clk_nir1), .se(se), .si(), .so());
   dff_s #(38) t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t1nir_paddr[39:2]),
                                .clk (clk_nir1), .se(se), .si(), .so());
`endif

   // Next thread NIR mux  (nir output mux)
   dp_mux2ds  #(33) nextnir_mux(.dout (nirdata_s1),
                                  .in0 (t0nir),
                              .in1 (t1nir),
                                  .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                  .sel1_l (fcl_fdp_nirthr_s1_l[1]));

   dp_mux2ds  #(38) nextnir_paddr_mux (.dout (nirpaddr_s1),
                                       .in0 (t0nir_paddr),
                                       .in1 (t1nir_paddr),
                                       .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                       .sel1_l (fcl_fdp_nirthr_s1_l[1]));

`elsif THREADS_3

   wire   clk_nir1;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir1(.rclk (rclk),
                              .clk  (clk_nir1),
                              .en_l (fcl_fdp_thr_s1_l[1]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33)  t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .en (~(fcl_fdp_thr_s1_l[1])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38)  t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                  .q (t1nir_paddr[39:2]),
                                  .en (~(fcl_fdp_thr_s1_l[1])), .clk (rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t1nir),
                           .clk  (clk_nir1), .se(se), .si(), .so());
   dff_s #(38) t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t1nir_paddr[39:2]),
                                .clk (clk_nir1), .se(se), .si(), .so());
`endif

   wire   clk_nir2;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir2(.rclk (rclk),
                              .clk  (clk_nir2),
                              .en_l (fcl_fdp_thr_s1_l[2]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33) t2nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t2nir),
                           .en (~(fcl_fdp_thr_s1_l[2])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38) t2nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                 .q (t2nir_paddr[39:2]),
                                 .en (~(fcl_fdp_thr_s1_l[2])), .clk(rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t2nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
                           .q    (t2nir),
                           .clk  (clk_nir2), .se(se), .si(), .so());
   dff_s #(38) t2nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t2nir_paddr[39:2]),
                                .clk (clk_nir2), .se(se), .si(), .so());
`endif

   // Next thread NIR mux  (nir output mux)
   dp_mux3ds  #(33) nextnir_mux(.dout (nirdata_s1),
                                  .in0 (t0nir),
                              .in1 (t1nir),
                              .in2 (t2nir),
                                  .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                  .sel1_l (fcl_fdp_nirthr_s1_l[1]),
                                  .sel2_l (fcl_fdp_nirthr_s1_l[2]));

   dp_mux3ds #(38) nextnir_paddr_mux (.dout (nirpaddr_s1),
                                      .in0 (t0nir_paddr),
                                      .in1 (t1nir_paddr),
                                      .in2 (t2nir_paddr),
                                      .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                      .sel1_l (fcl_fdp_nirthr_s1_l[1]),
                                      .sel2_l (fcl_fdp_nirthr_s1_l[2]));

`else
   wire   clk_nir1;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir1(.rclk (rclk),
                              .clk  (clk_nir1),
                              .en_l (fcl_fdp_thr_s1_l[1]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33)  t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t1nir),
		                   .en (~(fcl_fdp_thr_s1_l[1])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38)  t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                  .q (t1nir_paddr[39:2]),
                                  .en (~(fcl_fdp_thr_s1_l[1])), .clk (rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t1nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t1nir),
		                   .clk  (clk_nir1), .se(se), .si(), .so());
   dff_s #(38) t1nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t1nir_paddr[39:2]),
                                .clk (clk_nir1), .se(se), .si(), .so());
`endif

   wire   clk_nir2;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir2(.rclk (rclk),
                              .clk  (clk_nir2),
                              .en_l (fcl_fdp_thr_s1_l[2]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33) t2nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t2nir),
		                   .en (~(fcl_fdp_thr_s1_l[2])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38) t2nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                 .q (t2nir_paddr[39:2]),
                                 .en (~(fcl_fdp_thr_s1_l[2])), .clk(rclk), .se(se), .si(), .so());
`else
   dff_s #(33) t2nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t2nir),
		                   .clk  (clk_nir2), .se(se), .si(), .so());
   dff_s #(38) t2nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t2nir_paddr[39:2]),
                                .clk (clk_nir2), .se(se), .si(), .so());
`endif
   wire   clk_nir3;
`ifdef FPGA_SYN_CLK_EN
`else

   bw_u1_ckenbuf_6x  ckennir3(.rclk (rclk),
                              .clk  (clk_nir3),
                              .en_l (fcl_fdp_thr_s1_l[3]),
                              .tm_l (~se));
`endif
`ifdef FPGA_SYN_CLK_DFF
   dffe_s #(33) t3nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t3nir),
		                   .en (~(fcl_fdp_thr_s1_l[3])), .clk  (rclk), .se(se), .si(), .so());
   dffe_s #(38) t3nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                 .q (t3nir_paddr[39:2]),
                                 .en (~(fcl_fdp_thr_s1_l[3])), .clk (rclk), .se(se), .si (), .so());
`else

   dff_s #(33) t3nir_reg(.din  (icd_fdp_topdata_s1[32:0]),
		                   .q    (t3nir),
		                   .clk  (clk_nir3), .se(se), .si(), .so());
   dff_s #(38) t3nir_paddr_reg (.din (toppaddr_s1[39:2]),
                                .q (t3nir_paddr[39:2]),
                                .clk (clk_nir3), .se(se), .si(), .so());
`endif

   // Next thread NIR mux  (nir output mux)
   dp_mux4ds  #(33) nextnir_mux(.dout (nirdata_s1),
		                          .in0 (t0nir),
                              .in1 (t1nir),
                              .in2 (t2nir),
                              .in3 (t3nir),
		                          .sel0_l (fcl_fdp_nirthr_s1_l[0]),
		                          .sel1_l (fcl_fdp_nirthr_s1_l[1]),
		                          .sel2_l (fcl_fdp_nirthr_s1_l[2]),
		                          .sel3_l (fcl_fdp_nirthr_s1_l[3]));
   dp_mux4ds  #(38) nextnir_paddr_mux (.dout (nirpaddr_s1),
                                       .in0 (t0nir_paddr),
                                       .in1 (t1nir_paddr),
                                       .in2 (t2nir_paddr),
                                       .in3 (t3nir_paddr),
                                       .sel0_l (fcl_fdp_nirthr_s1_l[0]),
                                       .sel1_l (fcl_fdp_nirthr_s1_l[1]),
                                       .sel2_l (fcl_fdp_nirthr_s1_l[2]),
                                       .sel3_l (fcl_fdp_nirthr_s1_l[3]));

`endif

`endif // `ifndef CONFIG_NUM_THREADS

   // TBD in fetched instruction DP:
   // 1. Rollback -- DONE
   // 2. Icache parity check (increase fet data and top data to 34 bits)

endmodule // sparc_ifu_fdp

