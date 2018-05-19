// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: lsu_mon2.v
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
////////////////////////////////////////////////////////;
//
// lsu_mon2.vpal
//
// Description: LSU Monitor for monitoring some coverage conditions
// 		as well as some checkers. Run pal to get .v using:
// 		pal -r -o lsu_mon2.v lsu_mon2.vpal
////////////////////////////////////////////////////////

`include "cross_module.h.tmp"
`include "sys.h"
`include "iop.h"

module lsu_mon2 (clk, rst_l);
input clk;		// the cpu clock
input rst_l;		// reset (active low).


reg 	lsu_mon_msg;
  initial
  begin
    if( $test$plusargs("lsu_mon_msg") )
      lsu_mon_msg = 1'b1;
    else
      lsu_mon_msg= 1'b0;
  end // initial begin


reg forcex_ldst_va;
initial
begin
  if( $test$plusargs("forcex_ldst_va") )
    forcex_ldst_va = 1'b1;
  else
    forcex_ldst_va = 1'b0;
end


// Reset code requested by Rudi
// This is to turn off monitor during reset
reg     lsu_mon_rst_l;
initial lsu_mon_rst_l = 0 ;

always @(posedge clk) begin
  while (rst_l !== 0) @(posedge clk) ;
  lsu_mon_rst_l = 0 ;
  while (rst_l !== 1) @(posedge clk) ;
  lsu_mon_rst_l = 1 ;
end
// End Reset code requested by Rudi

// Enumerate monitors for all 8 cores

`ifdef RTL_SPARC0
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc0_ifu_lsu_pcxreq_d	= `SPARC_CORE0.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc0_ifu_lsu_pcxpkt_e	= `SPARC_CORE0.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc0_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE0.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc0_ifu_lsu_pcxreq_e;
wire		spc0_ifu_lsu_pcxreq_rise_d;
reg		spc0_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc0_ifu_lsu_pcxpkt;
reg		spc0_ifu_lsu_pcxreq_check;
wire		spc0_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc0_ifu_lsu_pcxreq_e <= spc0_ifu_lsu_pcxreq_d;

assign	spc0_ifu_lsu_pcxreq_rise_d = spc0_ifu_lsu_pcxreq_d & ~spc0_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc0_ifu_lsu_pcxreq_rise_e <= spc0_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc0_ifu_lsu_pcxreq_rise_e)
		spc0_ifu_lsu_pcxpkt <= spc0_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc0_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc0_ifu_lsu_pcxreq_rise_d)
		spc0_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc0_lsu_ifu_pcxpkt_ack_d)
		spc0_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc0_ifu_lsu_pcxreq_check_error = spc0_ifu_lsu_pcxreq_check & ~spc0_ifu_lsu_pcxreq_rise_e & (spc0_ifu_lsu_pcxpkt_e != spc0_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc0_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 0 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc0_tlu_lsu_pcxpkt		= `SPARC_CORE0.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc0_lsu_tlu_pcxpkt_ack	= `SPARC_CORE0.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc0_tlu_lsu_pcxpkt_b25_d1;
wire		spc0_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc0_tlu_lsu_pcxpkt_saved;
reg		spc0_tlu_lsu_pcxpkt_check;
wire		spc0_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc0_tlu_lsu_pcxpkt_b25_d1 <= spc0_tlu_lsu_pcxpkt[25];

assign	spc0_tlu_lsu_pcxpkt_rise = spc0_tlu_lsu_pcxpkt[25] & ~spc0_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc0_tlu_lsu_pcxpkt_rise)
		spc0_tlu_lsu_pcxpkt_saved <= spc0_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc0_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc0_tlu_lsu_pcxpkt_rise)
		spc0_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc0_lsu_tlu_pcxpkt_ack)
		spc0_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc0_tlu_lsu_pcxpkt_check_error = spc0_tlu_lsu_pcxpkt_check & (spc0_tlu_lsu_pcxpkt != spc0_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc0_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 0 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc0_spu_lsu_ldst_pckt	= `SPARC_CORE0.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc0_lsu_spu_ldst_ack	= `SPARC_CORE0.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc0_spu_lsu_ldst_pckt_b123_d1;
wire			spc0_spu_lsu_ldst_pckt_rise;
reg			spc0_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc0_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc0_spu_lsu_ldst_pckt_saved;
reg			spc0_spu_lsu_ldst_pckt_check;
wire			spc0_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc0_spu_lsu_ldst_pckt_b123_d1 <= spc0_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc0_spu_lsu_ldst_pckt_rise = spc0_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc0_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc0_spu_lsu_ldst_pckt_rise_d1 <= spc0_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc0_spu_lsu_ldst_pckt_rise)
		spc0_spu_lsu_ldst_pckt_b71b70_saved <= spc0_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc0_spu_lsu_ldst_pckt_rise_d1)
		spc0_spu_lsu_ldst_pckt_saved <= spc0_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc0_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc0_spu_lsu_ldst_pckt_rise)
		spc0_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc0_lsu_spu_ldst_ack)
		spc0_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc0_spu_lsu_ldst_pckt_check_error = spc0_spu_lsu_ldst_pckt_check &
		((!spc0_spu_lsu_ldst_pckt_rise_d1 & (spc0_spu_lsu_ldst_pckt != spc0_spu_lsu_ldst_pckt_saved)) |
		 (spc0_spu_lsu_ldst_pckt[71:70] != spc0_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc0_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 0 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc0_ffu_lsu_fpop_rq_vld	= `SPARC_CORE0.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc0_ffu_lsu_data		= `SPARC_CORE0.sparc0.lsu.ffu_lsu_data;
wire		spc0_lsu_ffu_ack		= `SPARC_CORE0.sparc0.lsu.lsu_ffu_ack;

reg		spc0_ffu_lsu_fpop_rq_vld_d1;
wire		spc0_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc0_ffu_lsu_data_saved;
reg		spc0_ffu_lsu_fpop_rq_vld_check;
wire		spc0_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc0_ffu_lsu_fpop_rq_vld_d1 <= spc0_ffu_lsu_fpop_rq_vld;

assign	spc0_ffu_lsu_fpop_rq_vld_rise = spc0_ffu_lsu_fpop_rq_vld & ~spc0_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc0_ffu_lsu_fpop_rq_vld_rise)
		spc0_ffu_lsu_data_saved <= spc0_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc0_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc0_ffu_lsu_fpop_rq_vld_rise)
		spc0_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc0_lsu_ffu_ack)
		spc0_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc0_ffu_lsu_fpop_rq_vld_check_error = spc0_ffu_lsu_fpop_rq_vld_check & (spc0_ffu_lsu_data != spc0_ffu_lsu_data_saved) | (spc0_ffu_lsu_fpop_rq_vld_rise & !spc0_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc0_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 0 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc0_spc_pcx_req_pq		= `SPARC_CORE0.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc0_spc_pcx_data_pa		= `SPARC_CORE0.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc0_spc_pcx_req_pa;
wire			spc0_spc_pcx_req_fp1;
wire			spc0_spc_pcx_req_fp2;
reg			spc0_spc_pcx_req_fp1_d1;
wire 			spc0_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc0_spc_pcx_req_pa <= spc0_spc_pcx_req_pq;

assign	spc0_spc_pcx_req_fp1 = (|spc0_spc_pcx_req_pa) & (spc0_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc0_spc_pcx_req_fp2 = spc0_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc0_spc_pcx_req_fp1_d1 <= spc0_spc_pcx_req_fp1;

assign	spc0_spc_pcx_req_fp_b2b_error = spc0_spc_pcx_req_fp1_d1 != spc0_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc0_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 0 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc0_ld_sec_hit_l2access_w2 = `SPARC_CORE0.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc0_ld0_pkt_vld_tmp  = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc0_ld0_pkt_vld_tmp_d;

   wire spc0_ld0_inst_vld_w2  = `SPARC_CORE0.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc0_ld0_is_sec_w2 = spc0_ld0_inst_vld_w2 ? spc0_ld_sec_hit_l2access_w2 : 0;


   wire spc0_ld1_pkt_vld_tmp  = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc0_ld1_pkt_vld_tmp_d;

   wire spc0_ld1_inst_vld_w2  = `SPARC_CORE0.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc0_ld1_is_sec_w2 = spc0_ld1_inst_vld_w2 ? spc0_ld_sec_hit_l2access_w2 : 0;


   wire spc0_ld2_pkt_vld_tmp  = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc0_ld2_pkt_vld_tmp_d;

   wire spc0_ld2_inst_vld_w2  = `SPARC_CORE0.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc0_ld2_is_sec_w2 = spc0_ld2_inst_vld_w2 ? spc0_ld_sec_hit_l2access_w2 : 0;


   wire spc0_ld3_pkt_vld_tmp  = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc0_ld3_pkt_vld_tmp_d;

   wire spc0_ld3_inst_vld_w2  = `SPARC_CORE0.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc0_ld3_is_sec_w2 = spc0_ld3_inst_vld_w2 ? spc0_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc0_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc0_ld0_pkt_vld_tmp;
   spc0_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc0_ld1_pkt_vld_tmp;
   spc0_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc0_ld2_pkt_vld_tmp;
   spc0_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc0_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc0_l2      = `SPARC_CORE0.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc0_unc     = `SPARC_CORE0.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc0_fpld    = `SPARC_CORE0.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc0_fpldst  = `SPARC_CORE0.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc0_unflush = `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc0_ldw     = `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc0_byp     = `SPARC_CORE0.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc0_flsh    = `SPARC_CORE0.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc0_chm     = `SPARC_CORE0.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc0_ldxa    = `SPARC_CORE0.sparc0.lsu.dctl.ldxa_internal ;
wire        spc0_ato     = `SPARC_CORE0.sparc0.lsu.dctl.atomic_g ;
wire        spc0_pref    = `SPARC_CORE0.sparc0.lsu.dctl.pref_inst_g ;
wire        spc0_chit    = `SPARC_CORE0.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc0_dcp     = `SPARC_CORE0.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc0_dtp     = `SPARC_CORE0.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc0_mpu     = `SPARC_CORE0.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc0_exu_und;
reg  [ 4:0] spc0_exu;
reg spc0_flsh_g;
always @(posedge clk)
begin
  spc0_flsh_g <= `SPARC_CORE0.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc0_byp_g;
always @(posedge clk)
begin
  spc0_byp_g <= `SPARC_CORE0.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc0_exu_und = {
//spc0_l2,
//  spc0_unc,
  spc0_fpld,
  spc0_fpldst,
  spc0_unflush,
//spc0_ldw,
  spc0_byp_g,
  spc0_flsh_g,
//spc0_chm,
  spc0_ldxa,
  spc0_ato,
  spc0_pref,
  spc0_chit,
//spc0_dcp,
  spc0_dtp,
  spc0_mpu
};

always @(spc0_exu_und)
begin
  case (spc0_exu_und)
    16'h0000 : spc0_exu =  5'h00;
    16'h0101 : spc0_exu =  5'h01;
    16'h0102 : spc0_exu =  5'h02;
    16'h0104 : spc0_exu =  5'h03;
    16'h0008 : spc0_exu =  5'h04;
    16'h0110 : spc0_exu =  5'h05;
    16'h0120 : spc0_exu =  5'h06;
    16'h0040 : spc0_exu =  5'h07;
    16'h0080 : spc0_exu =  5'h08;
    16'h0100 : spc0_exu =  5'h09;
    16'h0200 : spc0_exu =  5'h0a;
    16'h0400 : spc0_exu =  5'h0b;
    //16'h0800 : spc0_exu =  5'h0c;
    default  : spc0_exu =  5'h0c;

//  16'h1000 : spc0_exu =  5'h0d;
//  16'h2000 : spc0_exu =  5'h0e;
//  16'h4000 : spc0_exu =  5'h0f;
//  16'h8000 : spc0_exu =  5'h10;
//  default  : spc0_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc0_exp_wtchpt_trp_g             = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc0_exp_misalign_addr_ldst_atm_m = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc0_exp_priv_violtn_g            = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc0_exp_daccess_prot_g           = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc0_exp_priv_action_g            = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc0_exp_spec_access_epage_g      = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc0_exp_uncache_atomic_g         = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc0_exp_illegal_asi_action_g     = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc0_exp_flt_ld_nfo_pg_g          = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc0_exp_tlb_data_ue              = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc0_exp_tlb_tag_ue               = `SPARC_CORE0.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc0_exp_unc                      = `SPARC_CORE0.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc0_exp_und;
reg  [ 3:0] spc0_exp;

assign spc0_exp_und = {
  spc0_exp_wtchpt_trp_g,
  spc0_exp_misalign_addr_ldst_atm_m,
  spc0_exp_priv_violtn_g,
  spc0_exp_daccess_prot_g,
  spc0_exp_priv_action_g,
  spc0_exp_spec_access_epage_g,
  spc0_exp_uncache_atomic_g,
  spc0_exp_illegal_asi_action_g,
  spc0_exp_flt_ld_nfo_pg_g,
  spc0_exp_tlb_data_ue,
  spc0_exp_tlb_tag_ue,
  spc0_exp_unc
};

always @(spc0_exp_und)
begin
  case (spc0_exp_und)
    12'h000 : spc0_exp =  4'h0;
    12'h001 : spc0_exp =  4'h1;
    12'h002 : spc0_exp =  4'h2;
    12'h004 : spc0_exp =  4'h3;
    12'h008 : spc0_exp =  4'h4;
    12'h010 : spc0_exp =  4'h5;
    12'h020 : spc0_exp =  4'h6;
    12'h040 : spc0_exp =  4'h7;
    12'h080 : spc0_exp =  4'h8;
    12'h100 : spc0_exp =  4'h9;
    12'h200 : spc0_exp =  4'ha;
    12'h400 : spc0_exp =  4'hb;
    12'h800 : spc0_exp =  4'hc;
    default : spc0_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc0_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc0_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE0.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc0_lsu_ld_hit_wb;

assign  spc0_lsu_ld_hit_wb   =
((|`SPARC_CORE0.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE0.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE0.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE0.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE0.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE0.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE0.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE0.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE0.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE0.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE0.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE0.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE0.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc0_lsu_bld_vld_w2;
reg spc0_lsu_bld_hit_w2;
reg spc0_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc0_lsu_bld_vld_w2 <= `SPARC_CORE0.sparc0.lsu.qctl1.bld_g ;
  spc0_lsu_bld_hit_w2 <= spc0_lsu_ld_hit_wb ;
  spc0_lsu_bld_raw_w2 <= `SPARC_CORE0.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE0.sparc0.ifu.ifu.fcl.running_e)
`else
always @(`SPARC_CORE0.sparc0.ifu.fcl.running_e)
`endif
begin
  if (rst_l & forcex_ldst_va) begin
`ifndef RTL_SPU
    if (~`SPARC_CORE0.sparc0.ifu.ifu.fcl.running_e) begin
`else
    if (~`SPARC_CORE0.sparc0.ifu.fcl.running_e) begin
`endif
      force `SPARC_CORE0.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
`ifndef RTL_SPU
    if (`SPARC_CORE0.sparc0.ifu.ifu.fcl.running_e) begin
`else
    if (`SPARC_CORE0.sparc0.ifu.fcl.running_e) begin
`endif
      release `SPARC_CORE0.sparc0.exu_lsu_ldst_va_e;
    end
  end
end

// force hit
// always @(`SPARC_CORE0.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE0.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE0.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE0.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE0.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc0_phy_byp_ec_asi_e;
reg spc0_phy_use_ec_asi_e;
reg spc0_quad_ldd_real_e;
reg spc0_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc0_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE0.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc0_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE0.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc0_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE0.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc0_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE0.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc0_pscxt_ldxa_illgl_va_decode;
wire spc0_lsuctl_illgl_va_decode;
wire spc0_mrgnctl_illgl_va_decode;
wire spc0_asi42_illgl_va_decode;

assign spc0_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE0.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc0_lsuctl_illgl_va_decode     = (`SPARC_CORE0.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc0_mrgnctl_illgl_va_decode    = (`SPARC_CORE0.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc0_asi42_illgl_va_decode      =  `SPARC_CORE0.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc0_l2_ld_return_error = `SPARC_CORE0.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE0.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc0_l2_ld_return_error) begin
//    $display("Error @%d : sparc 0 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc0_io_ld_return_error = `SPARC_CORE0.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE0.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc0_io_ld_return_error) begin
    $display("Error @%d : sparc 0 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc0t0_dec_rptr_pcx_noced;

assign  spc0t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE0.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc0t1_dec_rptr_pcx_noced;

assign  spc0t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE0.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc0t2_dec_rptr_pcx_noced;

assign  spc0t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE0.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc0t3_dec_rptr_pcx_noced;

assign  spc0t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE0.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc0_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc0_stb_cam_cm_tid_d1 <= `SPARC_CORE0.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc0_stb_cam_hit_ptr_dec;
assign spc0_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE0.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc0t0_st_dq1_ld_hit;
assign spc0t0_st_dq1_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl0.dqptr_d1 & spc0_stb_cam_hit_ptr_dec);

wire [7:0] spc0t0_st_dq2_ld_hit;
assign spc0t0_st_dq2_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl0.dqptr_d2 & spc0_stb_cam_hit_ptr_dec);


wire [7:0] spc0t1_st_dq1_ld_hit;
assign spc0t1_st_dq1_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl1.dqptr_d1 & spc0_stb_cam_hit_ptr_dec);

wire [7:0] spc0t1_st_dq2_ld_hit;
assign spc0t1_st_dq2_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl1.dqptr_d2 & spc0_stb_cam_hit_ptr_dec);


wire [7:0] spc0t2_st_dq1_ld_hit;
assign spc0t2_st_dq1_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl2.dqptr_d1 & spc0_stb_cam_hit_ptr_dec);

wire [7:0] spc0t2_st_dq2_ld_hit;
assign spc0t2_st_dq2_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl2.dqptr_d2 & spc0_stb_cam_hit_ptr_dec);


wire [7:0] spc0t3_st_dq1_ld_hit;
assign spc0t3_st_dq1_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl3.dqptr_d1 & spc0_stb_cam_hit_ptr_dec);

wire [7:0] spc0t3_st_dq2_ld_hit;
assign spc0t3_st_dq2_ld_hit =
{8{(`SPARC_CORE0.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE0.sparc0.lsu.stb_cam_hit) &
	(spc0_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE0.sparc0.lsu.stb_ctl3.dqptr_d2 & spc0_stb_cam_hit_ptr_dec);


wire spc0_st_atm_blkst_vld;
assign spc0_st_atm_blkst_vld =
((`SPARC_CORE0.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE0.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE0.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE0.sparc0.lsu.stb_rwctl.blkst_m;

reg spc0_qctl1_casa_w2;
reg spc0_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc0_qctl1_casa_w2 <= `SPARC_CORE0.sparc0.lsu.qctl1.casa_g;
  spc0_stb_cam_vld_w <= `SPARC_CORE0.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc0_bw_r_scm_error;
assign spc0_bw_r_scm_error =
((spc0_stb_cam_vld_w
  &  `SPARC_CORE0.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE0.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE0.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE0.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE0.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE0.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE0.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE0.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE0.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE0.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc0_bw_r_scm_error) begin
		$display("Error @%d : sparc0 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc0_tte_data_perror_unc_wo_vld;
assign spc0_tte_data_perror_unc_wo_vld =
  `SPARC_CORE0.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE0.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE0.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE0.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE0.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc0_tte_data_perror_unc_w_flush;
assign spc0_tte_data_perror_unc_w_flush =
  `SPARC_CORE0.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE0.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE0.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE0.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE0.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE0.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc0_lsu_dcache_tag_perror_g_w_blkasi;
assign spc0_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE0.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE0.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE0.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc0_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc0_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE0.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE0.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE0.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc0_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc0_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE0.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE0.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE0.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE0.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc0_lsu_dcache_tag_perror_g_w_atomic;
assign spc0_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE0.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE0.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE0.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc0_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc0_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE0.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE0.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc0_lsu_dcache_data_perror_g_dtag_perror;
assign spc0_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE0.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE0.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc0_lsu_dcache_data_perror_g_w_altspace;
assign spc0_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE0.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE0.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc0_lsu_dcache_data_perror_g_w_atomic;
assign spc0_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE0.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE0.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE0.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE0.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (0 = 0; 0 < 8; 0++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc0_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc0_lsu_dtagv_wr_vld_e_d1, spc0_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc0_dva_rdaddr_10to6_d1;
wire [15:0] spc0_dva_rd_en_e;
reg  [15:0] spc0_dva_rd_en_e_d1;
wire [15:0] spc0_dva_vld_m_expanded;
reg  [4:0] spc0_dva_wraddr_10to6_d1, spc0_dva_wraddr_10to6_d2;
reg  [15:0] spc0_dva_bit_wr_en_e_d1, spc0_dva_bit_wr_en_e_d2;
reg  spc0_dva_din_e_d1, spc0_dva_din_e_d2;

wire spc0_dva_rdwr_sameline_diffvalue;
wire spc0_dva_rd_wr_sameline_diffvalue;
wire spc0_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc0_dfq_byp_ff_data_d1, spc0_dfq_byp_ff_data_d2;

// lsu_traps
reg spc0_ifu_tlu_inst_vld_w;
reg spc0_ifu_tlu_flush_w;
reg spc0_ifu_mmu_trap_w;
//reg spc0_spu_tlu_rsrv_illgl_w;
reg spc0_exu_lsu_priority_trap_w;
reg spc0_ffu_tlu_ill_inst_w;
reg spc0_ifu_tlu_immu_miss_w;
reg spc0_ifu_tlu_priv_violtn_w;
reg spc0_exu_ifu_va_oor_w;

// lsu_sechit
reg spc0_lsu_way_hit_or_w2, spc0_ncache_pcx_rq_w2;
reg  [7:0] spc0_stb_ld_partial_raw_w2, spc0_stb_ld_partial_raw_w3, spc0_stb_ld_partial_raw_w4;
reg  [7:0] spc0_stb_ld_full_raw_w2, spc0_stb_ld_full_raw_w3, spc0_stb_ld_full_raw_w4;
wire [7:0] spc0_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc0_stb_cam_rw_ptr_decode_w, spc0_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc0_stb_cam_rw_ptr_decode_w3, spc0_stb_cam_rw_ptr_decode_w4;
wire spc0_t0_ld_st_partialraw_hit;
wire spc0_t0_ld_st_fullraw_hit;
wire spc0_t0_st_ld_partialraw_hit;
wire spc0_t0_st_ld_fullraw_hit;
reg  spc0_ld0_inst_vld_w3, spc0_ld0_inst_vld_w4;
wire spc0_t1_ld_st_partialraw_hit;
wire spc0_t1_ld_st_fullraw_hit;
wire spc0_t1_st_ld_partialraw_hit;
wire spc0_t1_st_ld_fullraw_hit;
reg  spc0_ld1_inst_vld_w3, spc0_ld1_inst_vld_w4;
wire spc0_t2_ld_st_partialraw_hit;
wire spc0_t2_ld_st_fullraw_hit;
wire spc0_t2_st_ld_partialraw_hit;
wire spc0_t2_st_ld_fullraw_hit;
reg  spc0_ld2_inst_vld_w3, spc0_ld2_inst_vld_w4;
wire spc0_t3_ld_st_partialraw_hit;
wire spc0_t3_ld_st_fullraw_hit;
wire spc0_t3_st_ld_partialraw_hit;
wire spc0_t3_st_ld_fullraw_hit;
reg  spc0_ld3_inst_vld_w3, spc0_ld3_inst_vld_w4;
reg  spc0_stb_cam_mhit_w3, spc0_stb_cam_mhit_w4;
reg  spc0_io_ld_w3, spc0_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc0_pick_valid_raw, spc0_pick_status, spc0_pick_status_error;
reg  [11:0] spc0_pick_valid_raw_d1, spc0_pick_status_d1;
wire [11:0] spc0_pcx_rq_sel_d2;
reg  [11:0] spc0_pcx_rq_sel_d3;

// lsu_picker2
reg         spc0_fwdpkt_valid_raw;
reg  [3:0]  spc0_st_valid_raw;
wire        spc0_fwdpkt_valid, spc0_pcx_req_squash_d1;
wire [3:0]  spc0_st_valid;
wire [11:0] spc0_pick_valid_raw_h, spc0_pick_valid_h, spc0_pick_valid_h_ext;
reg  [11:0] spc0_pick_valid_h_d1, spc0_pick_valid_h_d2;
wire [4:0]  spc0_pre_qwr, spc0_mcycle_mask_qwr_d1;
wire [11:0] spc0_pick_destbusy_unqual, spc0_pick_atompend_unqual;
wire [11:0] spc0_pick_presented, spc0_pick_destbusy, spc0_pick_atompend;
wire [2:0]  spc0_pick_presented_count, spc0_pick_destbusy_count, spc0_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc0_ldfill_addr_w, spc0_ldinst_addr_m;
reg  [10:4] spc0_lsu_dcache_fill_addr_m, spc0_lsu_dcache_fill_addr_w;
wire        spc0_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc0_strm_stxa_g;
reg  [3:0] spc0_strm_stxa_w2, spc0_lsu_spu_stb_empty_d1;
reg        spc0_strm_stxa_state;
reg  [3:0] spc0_strm_stxa_tid_decode;


`ifdef RTL_SPARC0

    // lsu_dfq_stalls_2ormore_entries

    assign spc0_dfq_2ormore_vld_entries  = |(`SPARC_CORE0.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc0_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc0_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc0_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc0_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc0_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE0.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc0_dva_rdwr_sameline_diffvalue =
        (spc0_dva_rdaddr_10to6_d1 == spc0_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc0_dva_rd_en_e_d1 & spc0_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc0_dva_vld_m_expanded ^ {16{spc0_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc0_dva_rd_wr_sameline_diffvalue =
        (spc0_dva_rdaddr_10to6_d1 == `SPARC_CORE0.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc0_dva_rd_en_e_d1 & `SPARC_CORE0.sparc0.lsu.dva_bit_wr_en_e &
           (spc0_dva_vld_m_expanded ^ {16{`SPARC_CORE0.sparc0.lsu.dva_din_e}}) );

    assign spc0_dva_wr_rd_sameline_diffvalue =
        (spc0_dva_rdaddr_10to6_d1 == spc0_dva_wraddr_10to6_d2) &
        |( spc0_dva_rd_en_e_d1 & spc0_dva_bit_wr_en_e_d2 &
           (spc0_dva_vld_m_expanded ^ {16{spc0_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc0_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc0_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc0_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc0_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc0_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc0_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc0_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc0_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE0.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc0_t0_ld_st_partialraw_hit    = |( spc0_stb_ld_partial_raw_w4 & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t0_ld_st_fullraw_hit       = |( spc0_stb_ld_full_raw_w4    & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t0_st_ld_partialraw_hit    = |( spc0_stb_ld_partial_raw_w2 & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t0_st_ld_fullraw_hit       = |( spc0_stb_ld_full_raw_w2    & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t1_ld_st_partialraw_hit    = |( spc0_stb_ld_partial_raw_w4 & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t1_ld_st_fullraw_hit       = |( spc0_stb_ld_full_raw_w4    & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t1_st_ld_partialraw_hit    = |( spc0_stb_ld_partial_raw_w2 & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t1_st_ld_fullraw_hit       = |( spc0_stb_ld_full_raw_w2    & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t2_ld_st_partialraw_hit    = |( spc0_stb_ld_partial_raw_w4 & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t2_ld_st_fullraw_hit       = |( spc0_stb_ld_full_raw_w4    & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t2_st_ld_partialraw_hit    = |( spc0_stb_ld_partial_raw_w2 & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t2_st_ld_fullraw_hit       = |( spc0_stb_ld_full_raw_w2    & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t3_ld_st_partialraw_hit    = |( spc0_stb_ld_partial_raw_w4 & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t3_ld_st_fullraw_hit       = |( spc0_stb_ld_full_raw_w4    & spc0_stb_cam_rw_ptr_decode_w4 );
    assign spc0_t3_st_ld_partialraw_hit    = |( spc0_stb_ld_partial_raw_w2 & spc0_stb_cam_rw_ptr_decode_w2 );
    assign spc0_t3_st_ld_fullraw_hit       = |( spc0_stb_ld_full_raw_w2    & spc0_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc0_pick_valid_raw[11:0] = {`SPARC_CORE0.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE0.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE0.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc0_pick_status[11:0] = {`SPARC_CORE0.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE0.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE0.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc0_pcx_rq_sel_d2[11:0] = {`SPARC_CORE0.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc0_pick_status_error = ~spc0_pick_valid_raw & spc0_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc0_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc0_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc0_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc0_pcx_req_squash_d1 = `SPARC_CORE0.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc0_fwdpkt_valid_raw  <= 1'b0;
            spc0_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc0_fwdpkt_valid_raw <= (`SPARC_CORE0.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc0_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE0.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc0_pcx_req_squash_d1);

            spc0_st_valid_raw[3]  <= (`SPARC_CORE0.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc0_st_valid_raw[3]) &
                                        ~(`SPARC_CORE0.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc0_pcx_req_squash_d1);
            spc0_st_valid_raw[2]  <= (`SPARC_CORE0.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc0_st_valid_raw[2]) &
                                        ~(`SPARC_CORE0.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc0_pcx_req_squash_d1);
            spc0_st_valid_raw[1]  <= (`SPARC_CORE0.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc0_st_valid_raw[1]) &
                                        ~(`SPARC_CORE0.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc0_pcx_req_squash_d1);
            spc0_st_valid_raw[0]  <= (`SPARC_CORE0.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc0_st_valid_raw[0]) &
                                        ~(`SPARC_CORE0.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc0_pcx_req_squash_d1);

            spc0_pick_valid_h_d1  <= spc0_pick_valid_h;
            spc0_pick_valid_h_d2  <= spc0_pick_valid_h_d1;
        end
    end

    assign spc0_fwdpkt_valid = spc0_fwdpkt_valid_raw & |(`SPARC_CORE0.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE0.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc0_st_valid[3]  = spc0_st_valid_raw[3] & |(`SPARC_CORE0.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE0.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc0_st_valid[2]  = spc0_st_valid_raw[2] & |(`SPARC_CORE0.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE0.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc0_st_valid[1]  = spc0_st_valid_raw[1] & |(`SPARC_CORE0.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE0.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc0_st_valid[0]  = spc0_st_valid_raw[0] & |(`SPARC_CORE0.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE0.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc0_pick_valid_raw_h[11:0] = {`SPARC_CORE0.sparc0.lsu.qctl1.misc_events_raw[3:1], spc0_fwdpkt_valid_raw,
                                             spc0_st_valid_raw[3:0],
                                             `SPARC_CORE0.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc0_pick_valid_h[11:0] = {`SPARC_CORE0.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE0.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE0.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc0_fwdpkt_valid,
                                         spc0_st_valid[3:0],
                                         `SPARC_CORE0.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE0.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE0.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE0.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc0_pick_valid_h_ext[11:0] = spc0_pick_valid_h | spc0_pick_valid_h_d1 | spc0_pick_valid_h_d2;

    assign spc0_pre_qwr[4:0] = `SPARC_CORE0.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc0_pick_destbusy_unqual[11] = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[10] = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[9]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[8]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc0_pick_destbusy_unqual[7]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[6]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[5]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[4]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[3]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[2]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[1]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc0_pick_destbusy_unqual[0]  = ~|(spc0_pre_qwr[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc0_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE0.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc0_pick_atompend_unqual[11] = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[10] = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[9]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[8]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc0_pick_atompend_unqual[7]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[6]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[5]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[4]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[3]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[2]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[1]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc0_pick_atompend_unqual[0]  = ~|(~spc0_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE0.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc0_pick_presented = spc0_pick_valid_raw_h &  spc0_pick_valid_h_ext;
    assign spc0_pick_destbusy  = spc0_pick_valid_raw_h & ~spc0_pick_valid_h_ext & spc0_pick_destbusy_unqual;
    assign spc0_pick_atompend  = spc0_pick_valid_raw_h & ~spc0_pick_valid_h_ext & spc0_pick_atompend_unqual;

    count12bits C0_presented_count(
        .in  (spc0_pick_presented),
        .out (spc0_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C0_destbusy_count(
        .in  (spc0_pick_destbusy),
        .out (spc0_pick_destbusy_count)
    );
    count12bits C0_atompend_count(
        .in  (spc0_pick_atompend),
        .out (spc0_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc0_ldfill_addr_w[39:4]    = {`SPARC_CORE0.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc0_lsu_dcache_fill_addr_w[10:4]};
    assign spc0_ldinst_addr_m[39:4]    = {`SPARC_CORE0.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE0.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc0_filladdrw_eq_ldaddrm   = (spc0_ldfill_addr_w[39:4] == spc0_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc0_strm_stxa_g[3] = `SPARC_CORE0.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE0.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc0_strm_stxa_g[2] = `SPARC_CORE0.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE0.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc0_strm_stxa_g[1] = `SPARC_CORE0.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE0.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc0_strm_stxa_g[0] = `SPARC_CORE0.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE0.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE0.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc0_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE0.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc0_lsu_dtagv_wr_vld_e_d2    <= spc0_lsu_dtagv_wr_vld_e_d1;

        spc0_dva_rdaddr_10to6_d1      <= `SPARC_CORE0.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc0_dva_rd_en_e_d1           <= spc0_dva_rd_en_e;

        spc0_dva_wraddr_10to6_d1      <= `SPARC_CORE0.sparc0.lsu.dva_wr_adr_e[10:6];
        spc0_dva_wraddr_10to6_d2      <= spc0_dva_wraddr_10to6_d1;

        spc0_dva_bit_wr_en_e_d1       <= `SPARC_CORE0.sparc0.lsu.dva_bit_wr_en_e;
        spc0_dva_bit_wr_en_e_d2       <= spc0_dva_bit_wr_en_e_d1;

        spc0_dva_din_e_d1             <= `SPARC_CORE0.sparc0.lsu.dva_din_e;
        spc0_dva_din_e_d2             <= spc0_dva_din_e_d1;

        spc0_dfq_byp_ff_data_d1       <= `SPARC_CORE0.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc0_dfq_byp_ff_data_d2       <= spc0_dfq_byp_ff_data_d1;

        spc0_ifu_tlu_inst_vld_w       <= `SPARC_CORE0.sparc0.ifu_tlu_inst_vld_m;
        spc0_ifu_tlu_flush_w          <= `SPARC_CORE0.sparc0.ifu_tlu_flush_m;
        spc0_ifu_mmu_trap_w           <= `SPARC_CORE0.sparc0.ifu_mmu_trap_m;
//        spc0_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE0.sparc0.spu_tlu_rsrv_illgl_m;
        spc0_exu_lsu_priority_trap_w  <= `SPARC_CORE0.sparc0.exu_lsu_priority_trap_m;
        spc0_ffu_tlu_ill_inst_w       <= `SPARC_CORE0.sparc0.ffu_tlu_ill_inst_m;
        spc0_ifu_tlu_immu_miss_w      <= `SPARC_CORE0.sparc0.ifu_tlu_immu_miss_m;
        spc0_ifu_tlu_priv_violtn_w    <= `SPARC_CORE0.sparc0.ifu_tlu_priv_violtn_m;
        spc0_exu_ifu_va_oor_w         <= `SPARC_CORE0.sparc0.exu_ifu_va_oor_m;

        spc0_lsu_way_hit_or_w2        <= `SPARC_CORE0.sparc0.lsu.dctl.lsu_way_hit_or;
        spc0_ncache_pcx_rq_w2         <= `SPARC_CORE0.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc0_stb_ld_partial_raw_w2    <= `SPARC_CORE0.sparc0.lsu.stb_ld_partial_raw;
        spc0_stb_ld_partial_raw_w3    <= spc0_stb_ld_partial_raw_w2;
        spc0_stb_ld_partial_raw_w4    <= spc0_stb_ld_partial_raw_w3;
        spc0_stb_ld_full_raw_w2       <= `SPARC_CORE0.sparc0.lsu.stb_ld_full_raw;
        spc0_stb_ld_full_raw_w3       <= spc0_stb_ld_full_raw_w2;
        spc0_stb_ld_full_raw_w4       <= spc0_stb_ld_full_raw_w3;
        spc0_stb_cam_rw_ptr_decode_w  <= spc0_stb_cam_rw_ptr_decode_m;
        spc0_stb_cam_rw_ptr_decode_w2 <= spc0_stb_cam_rw_ptr_decode_w;
        spc0_stb_cam_rw_ptr_decode_w3 <= spc0_stb_cam_rw_ptr_decode_w2;
        spc0_stb_cam_rw_ptr_decode_w4 <= spc0_stb_cam_rw_ptr_decode_w3;
        spc0_ld0_inst_vld_w3       <= `SPARC_CORE0.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc0_ld0_inst_vld_w4       <= spc0_ld0_inst_vld_w3;
        spc0_ld1_inst_vld_w3       <= `SPARC_CORE0.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc0_ld1_inst_vld_w4       <= spc0_ld1_inst_vld_w3;
        spc0_ld2_inst_vld_w3       <= `SPARC_CORE0.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc0_ld2_inst_vld_w4       <= spc0_ld2_inst_vld_w3;
        spc0_ld3_inst_vld_w3       <= `SPARC_CORE0.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc0_ld3_inst_vld_w4       <= spc0_ld3_inst_vld_w3;
        spc0_stb_cam_mhit_w3          <= `SPARC_CORE0.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc0_stb_cam_mhit_w4          <= spc0_stb_cam_mhit_w3;
        spc0_io_ld_w3                 <= `SPARC_CORE0.sparc0.lsu.qctl1.io_ld_w2;
        spc0_io_ld_w4                 <= spc0_io_ld_w3;

        spc0_pick_valid_raw_d1        <= spc0_pick_valid_raw;
        spc0_pick_status_d1           <= spc0_pick_status;
        spc0_pcx_rq_sel_d3            <= spc0_pcx_rq_sel_d2;

        spc0_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE0.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc0_lsu_dcache_fill_addr_w[10:4] <= spc0_lsu_dcache_fill_addr_m[10:4];

        spc0_strm_stxa_w2             <= spc0_strm_stxa_g;
        spc0_lsu_spu_stb_empty_d1     <= `SPARC_CORE0.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc0_pick_status_error ) begin
          $display("Error @%d : sparc 0 pick_status not set properly: %b", $time, spc0_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc0_pick_valid_raw_d1 & ~spc0_pick_status_d1) & |spc0_pick_status ) begin
          $display("Error @%d : sparc 0 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc0_pick_status & spc0_pick_status_d1) & |spc0_pick_status ) begin
          $display("Error @%d : sparc 0 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc0_strm_stxa_state      <= 1'b0;
            spc0_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc0_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc0_strm_stxa_w2 & ~spc0_lsu_spu_stb_empty_d1) ) begin
                    spc0_strm_stxa_state      <= 1'b1;
                    spc0_strm_stxa_tid_decode <= spc0_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE0.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc0_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE0.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc0_strm_stxa_tid_decode[3] | spc0_strm_stxa_tid_decode[2]),
                             (spc0_strm_stxa_tid_decode[3] | spc0_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 0 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc0_strm_stxa_tid_decode = spc0_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc0_strm_stxa_tid_decode & ~spc0_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 0 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE0.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc0_strm_stxa_tid_decode[3] | spc0_strm_stxa_tid_decode[2]),
                             (spc0_strm_stxa_tid_decode[3] | spc0_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 0 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc0_strm_stxa_state      = 1'b0;
                        spc0_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C0 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C0 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C0 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C0 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C0 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE0.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C0 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE0.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C0 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C0 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C0 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C0 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C0 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE0.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C0 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C0 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C0 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C0 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE0.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C0 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc0_i, spc0_j;
    wire [7:0] spc0_stb0_valid, spc0_stb1_valid, spc0_stb2_valid, spc0_stb3_valid;

    assign spc0_stb0_valid[7:0] = `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc0_stb1_valid[7:0] = `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc0_stb2_valid[7:0] = `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc0_stb3_valid[7:0] = `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc0_st0_rd_advance, spc0_st1_rd_advance, spc0_st2_rd_advance, spc0_st3_rd_advance;
    reg spc0_flshinst0_rst_d1, spc0_flshinst1_rst_d1, spc0_flshinst2_rst_d1, spc0_flshinst3_rst_d1;
    reg spc0_st0_rd_advance_d1, spc0_st1_rd_advance_d1, spc0_st2_rd_advance_d1, spc0_st3_rd_advance_d1;
    reg spc0_st0_rd_advance_d2, spc0_st1_rd_advance_d2, spc0_st2_rd_advance_d2, spc0_st3_rd_advance_d2;
    reg spc0_st0_rd_advance_d3, spc0_st1_rd_advance_d3, spc0_st2_rd_advance_d3, spc0_st3_rd_advance_d3;
    reg spc0_st0_rd_advance_d4, spc0_st1_rd_advance_d4, spc0_st2_rd_advance_d4, spc0_st3_rd_advance_d4;

/***************************
    assign spc0_st0_rd_advance =  `SPARC_CORE0.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE0.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc0_st1_rd_advance =  `SPARC_CORE0.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE0.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc0_st2_rd_advance =  `SPARC_CORE0.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE0.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc0_st3_rd_advance =  `SPARC_CORE0.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE0.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE0.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE0.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc0_st0_rd_advance =  `SPARC_CORE0.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc0_st1_rd_advance =  `SPARC_CORE0.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc0_st2_rd_advance =  `SPARC_CORE0.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc0_st3_rd_advance =  `SPARC_CORE0.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc0_flshinst0_rst_d1  <= 1'b0;
            spc0_st0_rd_advance_d1 <= 1'b0;
            spc0_st0_rd_advance_d2 <= 1'b0;
            spc0_st0_rd_advance_d3 <= 1'b0;
            spc0_st0_rd_advance_d4 <= 1'b0;

            spc0_flshinst1_rst_d1  <= 1'b0;
            spc0_st1_rd_advance_d1 <= 1'b0;
            spc0_st1_rd_advance_d2 <= 1'b0;
            spc0_st1_rd_advance_d3 <= 1'b0;
            spc0_st1_rd_advance_d4 <= 1'b0;

            spc0_flshinst2_rst_d1  <= 1'b0;
            spc0_st2_rd_advance_d1 <= 1'b0;
            spc0_st2_rd_advance_d2 <= 1'b0;
            spc0_st2_rd_advance_d3 <= 1'b0;
            spc0_st2_rd_advance_d4 <= 1'b0;

            spc0_flshinst3_rst_d1  <= 1'b0;
            spc0_st3_rd_advance_d1 <= 1'b0;
            spc0_st3_rd_advance_d2 <= 1'b0;
            spc0_st3_rd_advance_d3 <= 1'b0;
            spc0_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc0_flshinst0_rst_d1  <= `SPARC_CORE0.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc0_st0_rd_advance_d1 <= spc0_st0_rd_advance;
            spc0_st0_rd_advance_d2 <= spc0_st0_rd_advance_d1;
            spc0_st0_rd_advance_d3 <= spc0_st0_rd_advance_d2;
            spc0_st0_rd_advance_d4 <= spc0_st0_rd_advance_d3;

            spc0_flshinst1_rst_d1  <= `SPARC_CORE0.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc0_st1_rd_advance_d1 <= spc0_st1_rd_advance;
            spc0_st1_rd_advance_d2 <= spc0_st1_rd_advance_d1;
            spc0_st1_rd_advance_d3 <= spc0_st1_rd_advance_d2;
            spc0_st1_rd_advance_d4 <= spc0_st1_rd_advance_d3;

            spc0_flshinst2_rst_d1  <= `SPARC_CORE0.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc0_st2_rd_advance_d1 <= spc0_st2_rd_advance;
            spc0_st2_rd_advance_d2 <= spc0_st2_rd_advance_d1;
            spc0_st2_rd_advance_d3 <= spc0_st2_rd_advance_d2;
            spc0_st2_rd_advance_d4 <= spc0_st2_rd_advance_d3;

            spc0_flshinst3_rst_d1  <= `SPARC_CORE0.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc0_st3_rd_advance_d1 <= spc0_st3_rd_advance;
            spc0_st3_rd_advance_d2 <= spc0_st3_rd_advance_d1;
            spc0_st3_rd_advance_d3 <= spc0_st3_rd_advance_d2;
            spc0_st3_rd_advance_d4 <= spc0_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc0_j = 0;
            for(spc0_i=0; spc0_i<7; spc0_i=spc0_i+1) begin
                if(spc0_stb0_valid[spc0_i+1] != spc0_stb0_valid[spc0_i]) begin
                    spc0_j = spc0_j + 1;
                end
            end
            if(spc0_j > 2) begin
                $display("@%d Bug 7117: Error: C0 STB0 valid bits not contiguous: %b", $time, spc0_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C0 STB0 valid bits not contiguous");
            end

            spc0_j = 0;
            for(spc0_i=0; spc0_i<7; spc0_i=spc0_i+1) begin
                if(spc0_stb1_valid[spc0_i+1] != spc0_stb1_valid[spc0_i]) begin
                    spc0_j = spc0_j + 1;
                end
            end
            if(spc0_j > 2) begin
                $display("@%d Bug 7117: Error: C0 STB1 valid bits not contiguous: %b", $time, spc0_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C0 STB1 valid bits not contiguous");
            end

            spc0_j = 0;
            for(spc0_i=0; spc0_i<7; spc0_i=spc0_i+1) begin
                if(spc0_stb2_valid[spc0_i+1] != spc0_stb2_valid[spc0_i]) begin
                    spc0_j = spc0_j + 1;
                end
            end
            if(spc0_j > 2) begin
                $display("@%d Bug 7117: Error: C0 STB2 valid bits not contiguous: %b", $time, spc0_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C0 STB2 valid bits not contiguous");
            end

            spc0_j = 0;
            for(spc0_i=0; spc0_i<7; spc0_i=spc0_i+1) begin
                if(spc0_stb3_valid[spc0_i+1] != spc0_stb3_valid[spc0_i]) begin
                    spc0_j = spc0_j + 1;
                end
            end
            if(spc0_j > 2) begin
                $display("@%d Bug 7117: Error: C0 STB3 valid bits not contiguous: %b", $time, spc0_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C0 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE0.sparc0.lsu.stb_ctl0.rst_l &
                ~spc0_flshinst0_rst_d1 &
                ~(`SPARC_CORE0.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc0_stb0_valid & `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C0 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc0_stb0_valid, `SPARC_CORE0.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C0 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE0.sparc0.lsu.stb_ctl1.rst_l &
                ~spc0_flshinst1_rst_d1 &
                ~(`SPARC_CORE0.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc0_stb1_valid & `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C0 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc0_stb1_valid, `SPARC_CORE0.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C0 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE0.sparc0.lsu.stb_ctl2.rst_l &
                ~spc0_flshinst2_rst_d1 &
                ~(`SPARC_CORE0.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc0_stb2_valid & `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C0 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc0_stb2_valid, `SPARC_CORE0.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C0 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE0.sparc0.lsu.stb_ctl3.rst_l &
                ~spc0_flshinst3_rst_d1 &
                ~(`SPARC_CORE0.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc0_stb3_valid & `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C0 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc0_stb3_valid, `SPARC_CORE0.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C0 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc0_st0_rd_advance_d1 & spc0_st0_rd_advance) begin
                $display("@%d Bug 7117: C0T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc0_st0_rd_advance_d2 & spc0_st0_rd_advance) begin
                $display("@%d Bug 7117: C0T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc0_st0_rd_advance_d3 & spc0_st0_rd_advance) begin
                $display("@%d Bug 7117: C0T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc0_st0_rd_advance_d4 & spc0_st0_rd_advance) begin
                $display("@%d Bug 7117: C0T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc0_st1_rd_advance_d1 & spc0_st1_rd_advance) begin
                $display("@%d Bug 7117: C0T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc0_st1_rd_advance_d2 & spc0_st1_rd_advance) begin
                $display("@%d Bug 7117: C0T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc0_st1_rd_advance_d3 & spc0_st1_rd_advance) begin
                $display("@%d Bug 7117: C0T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc0_st1_rd_advance_d4 & spc0_st1_rd_advance) begin
                $display("@%d Bug 7117: C0T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc0_st2_rd_advance_d1 & spc0_st2_rd_advance) begin
                $display("@%d Bug 7117: C0T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc0_st2_rd_advance_d2 & spc0_st2_rd_advance) begin
                $display("@%d Bug 7117: C0T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc0_st2_rd_advance_d3 & spc0_st2_rd_advance) begin
                $display("@%d Bug 7117: C0T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc0_st2_rd_advance_d4 & spc0_st2_rd_advance) begin
                $display("@%d Bug 7117: C0T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc0_st3_rd_advance_d1 & spc0_st3_rd_advance) begin
                $display("@%d Bug 7117: C0T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc0_st3_rd_advance_d2 & spc0_st3_rd_advance) begin
                $display("@%d Bug 7117: C0T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc0_st3_rd_advance_d3 & spc0_st3_rd_advance) begin
                $display("@%d Bug 7117: C0T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc0_st3_rd_advance_d4 & spc0_st3_rd_advance) begin
                $display("@%d Bug 7117: C0T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (0 = 0; 0 < 8; 0++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC1
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc1_ifu_lsu_pcxreq_d	= `SPARC_CORE1.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc1_ifu_lsu_pcxpkt_e	= `SPARC_CORE1.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc1_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE1.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc1_ifu_lsu_pcxreq_e;
wire		spc1_ifu_lsu_pcxreq_rise_d;
reg		spc1_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc1_ifu_lsu_pcxpkt;
reg		spc1_ifu_lsu_pcxreq_check;
wire		spc1_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc1_ifu_lsu_pcxreq_e <= spc1_ifu_lsu_pcxreq_d;

assign	spc1_ifu_lsu_pcxreq_rise_d = spc1_ifu_lsu_pcxreq_d & ~spc1_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc1_ifu_lsu_pcxreq_rise_e <= spc1_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc1_ifu_lsu_pcxreq_rise_e)
		spc1_ifu_lsu_pcxpkt <= spc1_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc1_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc1_ifu_lsu_pcxreq_rise_d)
		spc1_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc1_lsu_ifu_pcxpkt_ack_d)
		spc1_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc1_ifu_lsu_pcxreq_check_error = spc1_ifu_lsu_pcxreq_check & ~spc1_ifu_lsu_pcxreq_rise_e & (spc1_ifu_lsu_pcxpkt_e != spc1_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc1_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 1 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc1_tlu_lsu_pcxpkt		= `SPARC_CORE1.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc1_lsu_tlu_pcxpkt_ack	= `SPARC_CORE1.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc1_tlu_lsu_pcxpkt_b25_d1;
wire		spc1_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc1_tlu_lsu_pcxpkt_saved;
reg		spc1_tlu_lsu_pcxpkt_check;
wire		spc1_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc1_tlu_lsu_pcxpkt_b25_d1 <= spc1_tlu_lsu_pcxpkt[25];

assign	spc1_tlu_lsu_pcxpkt_rise = spc1_tlu_lsu_pcxpkt[25] & ~spc1_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc1_tlu_lsu_pcxpkt_rise)
		spc1_tlu_lsu_pcxpkt_saved <= spc1_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc1_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc1_tlu_lsu_pcxpkt_rise)
		spc1_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc1_lsu_tlu_pcxpkt_ack)
		spc1_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc1_tlu_lsu_pcxpkt_check_error = spc1_tlu_lsu_pcxpkt_check & (spc1_tlu_lsu_pcxpkt != spc1_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc1_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 1 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc1_spu_lsu_ldst_pckt	= `SPARC_CORE1.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc1_lsu_spu_ldst_ack	= `SPARC_CORE1.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc1_spu_lsu_ldst_pckt_b123_d1;
wire			spc1_spu_lsu_ldst_pckt_rise;
reg			spc1_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc1_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc1_spu_lsu_ldst_pckt_saved;
reg			spc1_spu_lsu_ldst_pckt_check;
wire			spc1_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc1_spu_lsu_ldst_pckt_b123_d1 <= spc1_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc1_spu_lsu_ldst_pckt_rise = spc1_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc1_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc1_spu_lsu_ldst_pckt_rise_d1 <= spc1_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc1_spu_lsu_ldst_pckt_rise)
		spc1_spu_lsu_ldst_pckt_b71b70_saved <= spc1_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc1_spu_lsu_ldst_pckt_rise_d1)
		spc1_spu_lsu_ldst_pckt_saved <= spc1_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc1_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc1_spu_lsu_ldst_pckt_rise)
		spc1_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc1_lsu_spu_ldst_ack)
		spc1_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc1_spu_lsu_ldst_pckt_check_error = spc1_spu_lsu_ldst_pckt_check &
		((!spc1_spu_lsu_ldst_pckt_rise_d1 & (spc1_spu_lsu_ldst_pckt != spc1_spu_lsu_ldst_pckt_saved)) |
		 (spc1_spu_lsu_ldst_pckt[71:70] != spc1_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc1_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 1 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc1_ffu_lsu_fpop_rq_vld	= `SPARC_CORE1.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc1_ffu_lsu_data		= `SPARC_CORE1.sparc0.lsu.ffu_lsu_data;
wire		spc1_lsu_ffu_ack		= `SPARC_CORE1.sparc0.lsu.lsu_ffu_ack;

reg		spc1_ffu_lsu_fpop_rq_vld_d1;
wire		spc1_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc1_ffu_lsu_data_saved;
reg		spc1_ffu_lsu_fpop_rq_vld_check;
wire		spc1_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc1_ffu_lsu_fpop_rq_vld_d1 <= spc1_ffu_lsu_fpop_rq_vld;

assign	spc1_ffu_lsu_fpop_rq_vld_rise = spc1_ffu_lsu_fpop_rq_vld & ~spc1_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc1_ffu_lsu_fpop_rq_vld_rise)
		spc1_ffu_lsu_data_saved <= spc1_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc1_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc1_ffu_lsu_fpop_rq_vld_rise)
		spc1_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc1_lsu_ffu_ack)
		spc1_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc1_ffu_lsu_fpop_rq_vld_check_error = spc1_ffu_lsu_fpop_rq_vld_check & (spc1_ffu_lsu_data != spc1_ffu_lsu_data_saved) | (spc1_ffu_lsu_fpop_rq_vld_rise & !spc1_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc1_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 1 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc1_spc_pcx_req_pq		= `SPARC_CORE1.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc1_spc_pcx_data_pa		= `SPARC_CORE1.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc1_spc_pcx_req_pa;
wire			spc1_spc_pcx_req_fp1;
wire			spc1_spc_pcx_req_fp2;
reg			spc1_spc_pcx_req_fp1_d1;
wire 			spc1_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc1_spc_pcx_req_pa <= spc1_spc_pcx_req_pq;

assign	spc1_spc_pcx_req_fp1 = (|spc1_spc_pcx_req_pa) & (spc1_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc1_spc_pcx_req_fp2 = spc1_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc1_spc_pcx_req_fp1_d1 <= spc1_spc_pcx_req_fp1;

assign	spc1_spc_pcx_req_fp_b2b_error = spc1_spc_pcx_req_fp1_d1 != spc1_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc1_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 1 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc1_ld_sec_hit_l2access_w2 = `SPARC_CORE1.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc1_ld0_pkt_vld_tmp  = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc1_ld0_pkt_vld_tmp_d;

   wire spc1_ld0_inst_vld_w2  = `SPARC_CORE1.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc1_ld0_is_sec_w2 = spc1_ld0_inst_vld_w2 ? spc1_ld_sec_hit_l2access_w2 : 0;


   wire spc1_ld1_pkt_vld_tmp  = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc1_ld1_pkt_vld_tmp_d;

   wire spc1_ld1_inst_vld_w2  = `SPARC_CORE1.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc1_ld1_is_sec_w2 = spc1_ld1_inst_vld_w2 ? spc1_ld_sec_hit_l2access_w2 : 0;


   wire spc1_ld2_pkt_vld_tmp  = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc1_ld2_pkt_vld_tmp_d;

   wire spc1_ld2_inst_vld_w2  = `SPARC_CORE1.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc1_ld2_is_sec_w2 = spc1_ld2_inst_vld_w2 ? spc1_ld_sec_hit_l2access_w2 : 0;


   wire spc1_ld3_pkt_vld_tmp  = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc1_ld3_pkt_vld_tmp_d;

   wire spc1_ld3_inst_vld_w2  = `SPARC_CORE1.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc1_ld3_is_sec_w2 = spc1_ld3_inst_vld_w2 ? spc1_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc1_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc1_ld0_pkt_vld_tmp;
   spc1_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc1_ld1_pkt_vld_tmp;
   spc1_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc1_ld2_pkt_vld_tmp;
   spc1_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc1_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc1_l2      = `SPARC_CORE1.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc1_unc     = `SPARC_CORE1.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc1_fpld    = `SPARC_CORE1.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc1_fpldst  = `SPARC_CORE1.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc1_unflush = `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc1_ldw     = `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc1_byp     = `SPARC_CORE1.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc1_flsh    = `SPARC_CORE1.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc1_chm     = `SPARC_CORE1.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc1_ldxa    = `SPARC_CORE1.sparc0.lsu.dctl.ldxa_internal ;
wire        spc1_ato     = `SPARC_CORE1.sparc0.lsu.dctl.atomic_g ;
wire        spc1_pref    = `SPARC_CORE1.sparc0.lsu.dctl.pref_inst_g ;
wire        spc1_chit    = `SPARC_CORE1.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc1_dcp     = `SPARC_CORE1.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc1_dtp     = `SPARC_CORE1.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc1_mpu     = `SPARC_CORE1.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc1_exu_und;
reg  [ 4:0] spc1_exu;
reg spc1_flsh_g;
always @(posedge clk)
begin
  spc1_flsh_g <= `SPARC_CORE1.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc1_byp_g;
always @(posedge clk)
begin
  spc1_byp_g <= `SPARC_CORE1.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc1_exu_und = {
//spc1_l2,
//  spc1_unc,
  spc1_fpld,
  spc1_fpldst,
  spc1_unflush,
//spc1_ldw,
  spc1_byp_g,
  spc1_flsh_g,
//spc1_chm,
  spc1_ldxa,
  spc1_ato,
  spc1_pref,
  spc1_chit,
//spc1_dcp,
  spc1_dtp,
  spc1_mpu
};

always @(spc1_exu_und)
begin
  case (spc1_exu_und)
    16'h0000 : spc1_exu =  5'h00;
    16'h0101 : spc1_exu =  5'h01;
    16'h0102 : spc1_exu =  5'h02;
    16'h0104 : spc1_exu =  5'h03;
    16'h0008 : spc1_exu =  5'h04;
    16'h0110 : spc1_exu =  5'h05;
    16'h0120 : spc1_exu =  5'h06;
    16'h0040 : spc1_exu =  5'h07;
    16'h0080 : spc1_exu =  5'h08;
    16'h0100 : spc1_exu =  5'h09;
    16'h0200 : spc1_exu =  5'h0a;
    16'h0400 : spc1_exu =  5'h0b;
    //16'h0800 : spc1_exu =  5'h0c;
    default  : spc1_exu =  5'h0c;

//  16'h1000 : spc1_exu =  5'h0d;
//  16'h2000 : spc1_exu =  5'h0e;
//  16'h4000 : spc1_exu =  5'h0f;
//  16'h8000 : spc1_exu =  5'h10;
//  default  : spc1_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc1_exp_wtchpt_trp_g             = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc1_exp_misalign_addr_ldst_atm_m = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc1_exp_priv_violtn_g            = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc1_exp_daccess_prot_g           = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc1_exp_priv_action_g            = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc1_exp_spec_access_epage_g      = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc1_exp_uncache_atomic_g         = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc1_exp_illegal_asi_action_g     = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc1_exp_flt_ld_nfo_pg_g          = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc1_exp_tlb_data_ue              = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc1_exp_tlb_tag_ue               = `SPARC_CORE1.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc1_exp_unc                      = `SPARC_CORE1.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc1_exp_und;
reg  [ 3:0] spc1_exp;

assign spc1_exp_und = {
  spc1_exp_wtchpt_trp_g,
  spc1_exp_misalign_addr_ldst_atm_m,
  spc1_exp_priv_violtn_g,
  spc1_exp_daccess_prot_g,
  spc1_exp_priv_action_g,
  spc1_exp_spec_access_epage_g,
  spc1_exp_uncache_atomic_g,
  spc1_exp_illegal_asi_action_g,
  spc1_exp_flt_ld_nfo_pg_g,
  spc1_exp_tlb_data_ue,
  spc1_exp_tlb_tag_ue,
  spc1_exp_unc
};

always @(spc1_exp_und)
begin
  case (spc1_exp_und)
    12'h000 : spc1_exp =  4'h0;
    12'h001 : spc1_exp =  4'h1;
    12'h002 : spc1_exp =  4'h2;
    12'h004 : spc1_exp =  4'h3;
    12'h008 : spc1_exp =  4'h4;
    12'h010 : spc1_exp =  4'h5;
    12'h020 : spc1_exp =  4'h6;
    12'h040 : spc1_exp =  4'h7;
    12'h080 : spc1_exp =  4'h8;
    12'h100 : spc1_exp =  4'h9;
    12'h200 : spc1_exp =  4'ha;
    12'h400 : spc1_exp =  4'hb;
    12'h800 : spc1_exp =  4'hc;
    default : spc1_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc1_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc1_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE1.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc1_lsu_ld_hit_wb;

assign  spc1_lsu_ld_hit_wb   =
((|`SPARC_CORE1.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE1.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE1.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE1.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE1.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE1.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE1.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE1.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE1.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE1.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE1.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE1.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE1.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc1_lsu_bld_vld_w2;
reg spc1_lsu_bld_hit_w2;
reg spc1_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc1_lsu_bld_vld_w2 <= `SPARC_CORE1.sparc0.lsu.qctl1.bld_g ;
  spc1_lsu_bld_hit_w2 <= spc1_lsu_ld_hit_wb ;
  spc1_lsu_bld_raw_w2 <= `SPARC_CORE1.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE1.sparc0.ifu.ifu.fcl.running_e)
`else
always @(`SPARC_CORE1.sparc0.ifu.fcl.running_e)
`endif
begin
  if (rst_l & forcex_ldst_va) begin
`ifndef RTL_SPU
    if (~`SPARC_CORE1.sparc0.ifu.ifu.fcl.running_e) begin
`else
    if (~`SPARC_CORE1.sparc0.ifu.fcl.running_e) begin
`endif        
      force `SPARC_CORE1.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
`ifndef RTL_SPU
    if (`SPARC_CORE1.sparc0.ifu.ifu.fcl.running_e) begin 
`else
    if (`SPARC_CORE1.sparc0.ifu.fcl.running_e) begin
`endif        
      release `SPARC_CORE1.sparc0.exu_lsu_ldst_va_e;
    end
  end
end

// force hit
// always @(`SPARC_CORE1.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE1.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE1.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE1.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE1.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc1_phy_byp_ec_asi_e;
reg spc1_phy_use_ec_asi_e;
reg spc1_quad_ldd_real_e;
reg spc1_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc1_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE1.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc1_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE1.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc1_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE1.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc1_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE1.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc1_pscxt_ldxa_illgl_va_decode;
wire spc1_lsuctl_illgl_va_decode;
wire spc1_mrgnctl_illgl_va_decode;
wire spc1_asi42_illgl_va_decode;

assign spc1_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE1.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc1_lsuctl_illgl_va_decode     = (`SPARC_CORE1.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc1_mrgnctl_illgl_va_decode    = (`SPARC_CORE1.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc1_asi42_illgl_va_decode      =  `SPARC_CORE1.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc1_l2_ld_return_error = `SPARC_CORE1.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE1.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc1_l2_ld_return_error) begin
//    $display("Error @%d : sparc 1 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc1_io_ld_return_error = `SPARC_CORE1.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE1.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc1_io_ld_return_error) begin
    $display("Error @%d : sparc 1 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc1t0_dec_rptr_pcx_noced;

assign  spc1t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE1.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc1t1_dec_rptr_pcx_noced;

assign  spc1t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE1.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc1t2_dec_rptr_pcx_noced;

assign  spc1t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE1.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc1t3_dec_rptr_pcx_noced;

assign  spc1t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE1.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc1_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc1_stb_cam_cm_tid_d1 <= `SPARC_CORE1.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc1_stb_cam_hit_ptr_dec;
assign spc1_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE1.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc1t0_st_dq1_ld_hit;
assign spc1t0_st_dq1_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl0.dqptr_d1 & spc1_stb_cam_hit_ptr_dec);

wire [7:0] spc1t0_st_dq2_ld_hit;
assign spc1t0_st_dq2_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl0.dqptr_d2 & spc1_stb_cam_hit_ptr_dec);


wire [7:0] spc1t1_st_dq1_ld_hit;
assign spc1t1_st_dq1_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl1.dqptr_d1 & spc1_stb_cam_hit_ptr_dec);

wire [7:0] spc1t1_st_dq2_ld_hit;
assign spc1t1_st_dq2_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl1.dqptr_d2 & spc1_stb_cam_hit_ptr_dec);


wire [7:0] spc1t2_st_dq1_ld_hit;
assign spc1t2_st_dq1_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl2.dqptr_d1 & spc1_stb_cam_hit_ptr_dec);

wire [7:0] spc1t2_st_dq2_ld_hit;
assign spc1t2_st_dq2_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl2.dqptr_d2 & spc1_stb_cam_hit_ptr_dec);


wire [7:0] spc1t3_st_dq1_ld_hit;
assign spc1t3_st_dq1_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl3.dqptr_d1 & spc1_stb_cam_hit_ptr_dec);

wire [7:0] spc1t3_st_dq2_ld_hit;
assign spc1t3_st_dq2_ld_hit =
{8{(`SPARC_CORE1.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE1.sparc0.lsu.stb_cam_hit) &
	(spc1_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE1.sparc0.lsu.stb_ctl3.dqptr_d2 & spc1_stb_cam_hit_ptr_dec);


wire spc1_st_atm_blkst_vld;
assign spc1_st_atm_blkst_vld =
((`SPARC_CORE1.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE1.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE1.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE1.sparc0.lsu.stb_rwctl.blkst_m;

reg spc1_qctl1_casa_w2;
reg spc1_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc1_qctl1_casa_w2 <= `SPARC_CORE1.sparc0.lsu.qctl1.casa_g;
  spc1_stb_cam_vld_w <= `SPARC_CORE1.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc1_bw_r_scm_error;
assign spc1_bw_r_scm_error =
((spc1_stb_cam_vld_w
  &  `SPARC_CORE1.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE1.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE1.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE1.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE1.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE1.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE1.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE1.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE1.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE1.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc1_bw_r_scm_error) begin
		$display("Error @%d : sparc1 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc1_tte_data_perror_unc_wo_vld;
assign spc1_tte_data_perror_unc_wo_vld =
  `SPARC_CORE1.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE1.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE1.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE1.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE1.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc1_tte_data_perror_unc_w_flush;
assign spc1_tte_data_perror_unc_w_flush =
  `SPARC_CORE1.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE1.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE1.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE1.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE1.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE1.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc1_lsu_dcache_tag_perror_g_w_blkasi;
assign spc1_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE1.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE1.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE1.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc1_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc1_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE1.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE1.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE1.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc1_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc1_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE1.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE1.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE1.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE1.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc1_lsu_dcache_tag_perror_g_w_atomic;
assign spc1_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE1.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE1.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE1.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc1_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc1_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE1.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE1.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc1_lsu_dcache_data_perror_g_dtag_perror;
assign spc1_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE1.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE1.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc1_lsu_dcache_data_perror_g_w_altspace;
assign spc1_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE1.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE1.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc1_lsu_dcache_data_perror_g_w_atomic;
assign spc1_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE1.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE1.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE1.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE1.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (1 = 0; 1 < 8; 1++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc1_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc1_lsu_dtagv_wr_vld_e_d1, spc1_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc1_dva_rdaddr_10to6_d1;
wire [15:0] spc1_dva_rd_en_e;
reg  [15:0] spc1_dva_rd_en_e_d1;
wire [15:0] spc1_dva_vld_m_expanded;
reg  [4:0] spc1_dva_wraddr_10to6_d1, spc1_dva_wraddr_10to6_d2;
reg  [15:0] spc1_dva_bit_wr_en_e_d1, spc1_dva_bit_wr_en_e_d2;
reg  spc1_dva_din_e_d1, spc1_dva_din_e_d2;

wire spc1_dva_rdwr_sameline_diffvalue;
wire spc1_dva_rd_wr_sameline_diffvalue;
wire spc1_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc1_dfq_byp_ff_data_d1, spc1_dfq_byp_ff_data_d2;

// lsu_traps
reg spc1_ifu_tlu_inst_vld_w;
reg spc1_ifu_tlu_flush_w;
reg spc1_ifu_mmu_trap_w;
//reg spc1_spu_tlu_rsrv_illgl_w;
reg spc1_exu_lsu_priority_trap_w;
reg spc1_ffu_tlu_ill_inst_w;
reg spc1_ifu_tlu_immu_miss_w;
reg spc1_ifu_tlu_priv_violtn_w;
reg spc1_exu_ifu_va_oor_w;

// lsu_sechit
reg spc1_lsu_way_hit_or_w2, spc1_ncache_pcx_rq_w2;
reg  [7:0] spc1_stb_ld_partial_raw_w2, spc1_stb_ld_partial_raw_w3, spc1_stb_ld_partial_raw_w4;
reg  [7:0] spc1_stb_ld_full_raw_w2, spc1_stb_ld_full_raw_w3, spc1_stb_ld_full_raw_w4;
wire [7:0] spc1_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc1_stb_cam_rw_ptr_decode_w, spc1_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc1_stb_cam_rw_ptr_decode_w3, spc1_stb_cam_rw_ptr_decode_w4;
wire spc1_t0_ld_st_partialraw_hit;
wire spc1_t0_ld_st_fullraw_hit;
wire spc1_t0_st_ld_partialraw_hit;
wire spc1_t0_st_ld_fullraw_hit;
reg  spc1_ld0_inst_vld_w3, spc1_ld0_inst_vld_w4;
wire spc1_t1_ld_st_partialraw_hit;
wire spc1_t1_ld_st_fullraw_hit;
wire spc1_t1_st_ld_partialraw_hit;
wire spc1_t1_st_ld_fullraw_hit;
reg  spc1_ld1_inst_vld_w3, spc1_ld1_inst_vld_w4;
wire spc1_t2_ld_st_partialraw_hit;
wire spc1_t2_ld_st_fullraw_hit;
wire spc1_t2_st_ld_partialraw_hit;
wire spc1_t2_st_ld_fullraw_hit;
reg  spc1_ld2_inst_vld_w3, spc1_ld2_inst_vld_w4;
wire spc1_t3_ld_st_partialraw_hit;
wire spc1_t3_ld_st_fullraw_hit;
wire spc1_t3_st_ld_partialraw_hit;
wire spc1_t3_st_ld_fullraw_hit;
reg  spc1_ld3_inst_vld_w3, spc1_ld3_inst_vld_w4;
reg  spc1_stb_cam_mhit_w3, spc1_stb_cam_mhit_w4;
reg  spc1_io_ld_w3, spc1_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc1_pick_valid_raw, spc1_pick_status, spc1_pick_status_error;
reg  [11:0] spc1_pick_valid_raw_d1, spc1_pick_status_d1;
wire [11:0] spc1_pcx_rq_sel_d2;
reg  [11:0] spc1_pcx_rq_sel_d3;

// lsu_picker2
reg         spc1_fwdpkt_valid_raw;
reg  [3:0]  spc1_st_valid_raw;
wire        spc1_fwdpkt_valid, spc1_pcx_req_squash_d1;
wire [3:0]  spc1_st_valid;
wire [11:0] spc1_pick_valid_raw_h, spc1_pick_valid_h, spc1_pick_valid_h_ext;
reg  [11:0] spc1_pick_valid_h_d1, spc1_pick_valid_h_d2;
wire [4:0]  spc1_pre_qwr, spc1_mcycle_mask_qwr_d1;
wire [11:0] spc1_pick_destbusy_unqual, spc1_pick_atompend_unqual;
wire [11:0] spc1_pick_presented, spc1_pick_destbusy, spc1_pick_atompend;
wire [2:0]  spc1_pick_presented_count, spc1_pick_destbusy_count, spc1_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc1_ldfill_addr_w, spc1_ldinst_addr_m;
reg  [10:4] spc1_lsu_dcache_fill_addr_m, spc1_lsu_dcache_fill_addr_w;
wire        spc1_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc1_strm_stxa_g;
reg  [3:0] spc1_strm_stxa_w2, spc1_lsu_spu_stb_empty_d1;
reg        spc1_strm_stxa_state;
reg  [3:0] spc1_strm_stxa_tid_decode;


`ifdef RTL_SPARC1

    // lsu_dfq_stalls_2ormore_entries

    assign spc1_dfq_2ormore_vld_entries  = |(`SPARC_CORE1.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc1_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc1_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc1_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc1_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc1_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE1.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc1_dva_rdwr_sameline_diffvalue =
        (spc1_dva_rdaddr_10to6_d1 == spc1_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc1_dva_rd_en_e_d1 & spc1_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc1_dva_vld_m_expanded ^ {16{spc1_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc1_dva_rd_wr_sameline_diffvalue =
        (spc1_dva_rdaddr_10to6_d1 == `SPARC_CORE1.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc1_dva_rd_en_e_d1 & `SPARC_CORE1.sparc0.lsu.dva_bit_wr_en_e &
           (spc1_dva_vld_m_expanded ^ {16{`SPARC_CORE1.sparc0.lsu.dva_din_e}}) );

    assign spc1_dva_wr_rd_sameline_diffvalue =
        (spc1_dva_rdaddr_10to6_d1 == spc1_dva_wraddr_10to6_d2) &
        |( spc1_dva_rd_en_e_d1 & spc1_dva_bit_wr_en_e_d2 &
           (spc1_dva_vld_m_expanded ^ {16{spc1_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc1_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc1_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc1_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc1_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc1_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc1_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc1_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc1_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE1.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc1_t0_ld_st_partialraw_hit    = |( spc1_stb_ld_partial_raw_w4 & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t0_ld_st_fullraw_hit       = |( spc1_stb_ld_full_raw_w4    & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t0_st_ld_partialraw_hit    = |( spc1_stb_ld_partial_raw_w2 & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t0_st_ld_fullraw_hit       = |( spc1_stb_ld_full_raw_w2    & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t1_ld_st_partialraw_hit    = |( spc1_stb_ld_partial_raw_w4 & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t1_ld_st_fullraw_hit       = |( spc1_stb_ld_full_raw_w4    & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t1_st_ld_partialraw_hit    = |( spc1_stb_ld_partial_raw_w2 & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t1_st_ld_fullraw_hit       = |( spc1_stb_ld_full_raw_w2    & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t2_ld_st_partialraw_hit    = |( spc1_stb_ld_partial_raw_w4 & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t2_ld_st_fullraw_hit       = |( spc1_stb_ld_full_raw_w4    & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t2_st_ld_partialraw_hit    = |( spc1_stb_ld_partial_raw_w2 & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t2_st_ld_fullraw_hit       = |( spc1_stb_ld_full_raw_w2    & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t3_ld_st_partialraw_hit    = |( spc1_stb_ld_partial_raw_w4 & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t3_ld_st_fullraw_hit       = |( spc1_stb_ld_full_raw_w4    & spc1_stb_cam_rw_ptr_decode_w4 );
    assign spc1_t3_st_ld_partialraw_hit    = |( spc1_stb_ld_partial_raw_w2 & spc1_stb_cam_rw_ptr_decode_w2 );
    assign spc1_t3_st_ld_fullraw_hit       = |( spc1_stb_ld_full_raw_w2    & spc1_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc1_pick_valid_raw[11:0] = {`SPARC_CORE1.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE1.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE1.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc1_pick_status[11:0] = {`SPARC_CORE1.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE1.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE1.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc1_pcx_rq_sel_d2[11:0] = {`SPARC_CORE1.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc1_pick_status_error = ~spc1_pick_valid_raw & spc1_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc1_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc1_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc1_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc1_pcx_req_squash_d1 = `SPARC_CORE1.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc1_fwdpkt_valid_raw  <= 1'b0;
            spc1_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc1_fwdpkt_valid_raw <= (`SPARC_CORE1.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc1_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE1.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc1_pcx_req_squash_d1);

            spc1_st_valid_raw[3]  <= (`SPARC_CORE1.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc1_st_valid_raw[3]) &
                                        ~(`SPARC_CORE1.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc1_pcx_req_squash_d1);
            spc1_st_valid_raw[2]  <= (`SPARC_CORE1.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc1_st_valid_raw[2]) &
                                        ~(`SPARC_CORE1.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc1_pcx_req_squash_d1);
            spc1_st_valid_raw[1]  <= (`SPARC_CORE1.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc1_st_valid_raw[1]) &
                                        ~(`SPARC_CORE1.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc1_pcx_req_squash_d1);
            spc1_st_valid_raw[0]  <= (`SPARC_CORE1.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc1_st_valid_raw[0]) &
                                        ~(`SPARC_CORE1.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc1_pcx_req_squash_d1);

            spc1_pick_valid_h_d1  <= spc1_pick_valid_h;
            spc1_pick_valid_h_d2  <= spc1_pick_valid_h_d1;
        end
    end

    assign spc1_fwdpkt_valid = spc1_fwdpkt_valid_raw & |(`SPARC_CORE1.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE1.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc1_st_valid[3]  = spc1_st_valid_raw[3] & |(`SPARC_CORE1.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE1.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc1_st_valid[2]  = spc1_st_valid_raw[2] & |(`SPARC_CORE1.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE1.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc1_st_valid[1]  = spc1_st_valid_raw[1] & |(`SPARC_CORE1.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE1.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc1_st_valid[0]  = spc1_st_valid_raw[0] & |(`SPARC_CORE1.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE1.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc1_pick_valid_raw_h[11:0] = {`SPARC_CORE1.sparc0.lsu.qctl1.misc_events_raw[3:1], spc1_fwdpkt_valid_raw,
                                             spc1_st_valid_raw[3:0],
                                             `SPARC_CORE1.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc1_pick_valid_h[11:0] = {`SPARC_CORE1.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE1.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE1.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc1_fwdpkt_valid,
                                         spc1_st_valid[3:0],
                                         `SPARC_CORE1.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE1.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE1.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE1.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc1_pick_valid_h_ext[11:0] = spc1_pick_valid_h | spc1_pick_valid_h_d1 | spc1_pick_valid_h_d2;

    assign spc1_pre_qwr[4:0] = `SPARC_CORE1.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc1_pick_destbusy_unqual[11] = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[10] = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[9]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[8]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc1_pick_destbusy_unqual[7]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[6]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[5]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[4]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[3]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[2]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[1]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc1_pick_destbusy_unqual[0]  = ~|(spc1_pre_qwr[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc1_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE1.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc1_pick_atompend_unqual[11] = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[10] = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[9]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[8]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc1_pick_atompend_unqual[7]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[6]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[5]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[4]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[3]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[2]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[1]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc1_pick_atompend_unqual[0]  = ~|(~spc1_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE1.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc1_pick_presented = spc1_pick_valid_raw_h &  spc1_pick_valid_h_ext;
    assign spc1_pick_destbusy  = spc1_pick_valid_raw_h & ~spc1_pick_valid_h_ext & spc1_pick_destbusy_unqual;
    assign spc1_pick_atompend  = spc1_pick_valid_raw_h & ~spc1_pick_valid_h_ext & spc1_pick_atompend_unqual;

    count12bits C1_presented_count(
        .in  (spc1_pick_presented),
        .out (spc1_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C1_destbusy_count(
        .in  (spc1_pick_destbusy),
        .out (spc1_pick_destbusy_count)
    );
    count12bits C1_atompend_count(
        .in  (spc1_pick_atompend),
        .out (spc1_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc1_ldfill_addr_w[39:4]    = {`SPARC_CORE1.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc1_lsu_dcache_fill_addr_w[10:4]};
    assign spc1_ldinst_addr_m[39:4]    = {`SPARC_CORE1.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE1.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc1_filladdrw_eq_ldaddrm   = (spc1_ldfill_addr_w[39:4] == spc1_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc1_strm_stxa_g[3] = `SPARC_CORE1.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE1.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc1_strm_stxa_g[2] = `SPARC_CORE1.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE1.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc1_strm_stxa_g[1] = `SPARC_CORE1.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE1.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc1_strm_stxa_g[0] = `SPARC_CORE1.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE1.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE1.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc1_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE1.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc1_lsu_dtagv_wr_vld_e_d2    <= spc1_lsu_dtagv_wr_vld_e_d1;

        spc1_dva_rdaddr_10to6_d1      <= `SPARC_CORE1.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc1_dva_rd_en_e_d1           <= spc1_dva_rd_en_e;

        spc1_dva_wraddr_10to6_d1      <= `SPARC_CORE1.sparc0.lsu.dva_wr_adr_e[10:6];
        spc1_dva_wraddr_10to6_d2      <= spc1_dva_wraddr_10to6_d1;

        spc1_dva_bit_wr_en_e_d1       <= `SPARC_CORE1.sparc0.lsu.dva_bit_wr_en_e;
        spc1_dva_bit_wr_en_e_d2       <= spc1_dva_bit_wr_en_e_d1;

        spc1_dva_din_e_d1             <= `SPARC_CORE1.sparc0.lsu.dva_din_e;
        spc1_dva_din_e_d2             <= spc1_dva_din_e_d1;

        spc1_dfq_byp_ff_data_d1       <= `SPARC_CORE1.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc1_dfq_byp_ff_data_d2       <= spc1_dfq_byp_ff_data_d1;

        spc1_ifu_tlu_inst_vld_w       <= `SPARC_CORE1.sparc0.ifu_tlu_inst_vld_m;
        spc1_ifu_tlu_flush_w          <= `SPARC_CORE1.sparc0.ifu_tlu_flush_m;
        spc1_ifu_mmu_trap_w           <= `SPARC_CORE1.sparc0.ifu_mmu_trap_m;
//        spc1_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE1.sparc0.spu_tlu_rsrv_illgl_m;
        spc1_exu_lsu_priority_trap_w  <= `SPARC_CORE1.sparc0.exu_lsu_priority_trap_m;
        spc1_ffu_tlu_ill_inst_w       <= `SPARC_CORE1.sparc0.ffu_tlu_ill_inst_m;
        spc1_ifu_tlu_immu_miss_w      <= `SPARC_CORE1.sparc0.ifu_tlu_immu_miss_m;
        spc1_ifu_tlu_priv_violtn_w    <= `SPARC_CORE1.sparc0.ifu_tlu_priv_violtn_m;
        spc1_exu_ifu_va_oor_w         <= `SPARC_CORE1.sparc0.exu_ifu_va_oor_m;

        spc1_lsu_way_hit_or_w2        <= `SPARC_CORE1.sparc0.lsu.dctl.lsu_way_hit_or;
        spc1_ncache_pcx_rq_w2         <= `SPARC_CORE1.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc1_stb_ld_partial_raw_w2    <= `SPARC_CORE1.sparc0.lsu.stb_ld_partial_raw;
        spc1_stb_ld_partial_raw_w3    <= spc1_stb_ld_partial_raw_w2;
        spc1_stb_ld_partial_raw_w4    <= spc1_stb_ld_partial_raw_w3;
        spc1_stb_ld_full_raw_w2       <= `SPARC_CORE1.sparc0.lsu.stb_ld_full_raw;
        spc1_stb_ld_full_raw_w3       <= spc1_stb_ld_full_raw_w2;
        spc1_stb_ld_full_raw_w4       <= spc1_stb_ld_full_raw_w3;
        spc1_stb_cam_rw_ptr_decode_w  <= spc1_stb_cam_rw_ptr_decode_m;
        spc1_stb_cam_rw_ptr_decode_w2 <= spc1_stb_cam_rw_ptr_decode_w;
        spc1_stb_cam_rw_ptr_decode_w3 <= spc1_stb_cam_rw_ptr_decode_w2;
        spc1_stb_cam_rw_ptr_decode_w4 <= spc1_stb_cam_rw_ptr_decode_w3;
        spc1_ld0_inst_vld_w3       <= `SPARC_CORE1.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc1_ld0_inst_vld_w4       <= spc1_ld0_inst_vld_w3;
        spc1_ld1_inst_vld_w3       <= `SPARC_CORE1.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc1_ld1_inst_vld_w4       <= spc1_ld1_inst_vld_w3;
        spc1_ld2_inst_vld_w3       <= `SPARC_CORE1.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc1_ld2_inst_vld_w4       <= spc1_ld2_inst_vld_w3;
        spc1_ld3_inst_vld_w3       <= `SPARC_CORE1.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc1_ld3_inst_vld_w4       <= spc1_ld3_inst_vld_w3;
        spc1_stb_cam_mhit_w3          <= `SPARC_CORE1.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc1_stb_cam_mhit_w4          <= spc1_stb_cam_mhit_w3;
        spc1_io_ld_w3                 <= `SPARC_CORE1.sparc0.lsu.qctl1.io_ld_w2;
        spc1_io_ld_w4                 <= spc1_io_ld_w3;

        spc1_pick_valid_raw_d1        <= spc1_pick_valid_raw;
        spc1_pick_status_d1           <= spc1_pick_status;
        spc1_pcx_rq_sel_d3            <= spc1_pcx_rq_sel_d2;

        spc1_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE1.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc1_lsu_dcache_fill_addr_w[10:4] <= spc1_lsu_dcache_fill_addr_m[10:4];

        spc1_strm_stxa_w2             <= spc1_strm_stxa_g;
        spc1_lsu_spu_stb_empty_d1     <= `SPARC_CORE1.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc1_pick_status_error ) begin
          $display("Error @%d : sparc 1 pick_status not set properly: %b", $time, spc1_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc1_pick_valid_raw_d1 & ~spc1_pick_status_d1) & |spc1_pick_status ) begin
          $display("Error @%d : sparc 1 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc1_pick_status & spc1_pick_status_d1) & |spc1_pick_status ) begin
          $display("Error @%d : sparc 1 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc1_strm_stxa_state      <= 1'b0;
            spc1_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc1_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc1_strm_stxa_w2 & ~spc1_lsu_spu_stb_empty_d1) ) begin
                    spc1_strm_stxa_state      <= 1'b1;
                    spc1_strm_stxa_tid_decode <= spc1_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE1.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc1_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE1.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc1_strm_stxa_tid_decode[3] | spc1_strm_stxa_tid_decode[2]),
                             (spc1_strm_stxa_tid_decode[3] | spc1_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 1 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc1_strm_stxa_tid_decode = spc1_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc1_strm_stxa_tid_decode & ~spc1_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 1 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE1.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc1_strm_stxa_tid_decode[3] | spc1_strm_stxa_tid_decode[2]),
                             (spc1_strm_stxa_tid_decode[3] | spc1_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 1 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc1_strm_stxa_state      = 1'b0;
                        spc1_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C1 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C1 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C1 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C1 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C1 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE1.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C1 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE1.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C1 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C1 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C1 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C1 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C1 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE1.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C1 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C1 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C1 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C1 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE1.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C1 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc1_i, spc1_j;
    wire [7:0] spc1_stb0_valid, spc1_stb1_valid, spc1_stb2_valid, spc1_stb3_valid;

    assign spc1_stb0_valid[7:0] = `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc1_stb1_valid[7:0] = `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc1_stb2_valid[7:0] = `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc1_stb3_valid[7:0] = `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc1_st0_rd_advance, spc1_st1_rd_advance, spc1_st2_rd_advance, spc1_st3_rd_advance;
    reg spc1_flshinst0_rst_d1, spc1_flshinst1_rst_d1, spc1_flshinst2_rst_d1, spc1_flshinst3_rst_d1;
    reg spc1_st0_rd_advance_d1, spc1_st1_rd_advance_d1, spc1_st2_rd_advance_d1, spc1_st3_rd_advance_d1;
    reg spc1_st0_rd_advance_d2, spc1_st1_rd_advance_d2, spc1_st2_rd_advance_d2, spc1_st3_rd_advance_d2;
    reg spc1_st0_rd_advance_d3, spc1_st1_rd_advance_d3, spc1_st2_rd_advance_d3, spc1_st3_rd_advance_d3;
    reg spc1_st0_rd_advance_d4, spc1_st1_rd_advance_d4, spc1_st2_rd_advance_d4, spc1_st3_rd_advance_d4;

/***************************
    assign spc1_st0_rd_advance =  `SPARC_CORE1.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE1.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc1_st1_rd_advance =  `SPARC_CORE1.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE1.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc1_st2_rd_advance =  `SPARC_CORE1.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE1.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc1_st3_rd_advance =  `SPARC_CORE1.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE1.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE1.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE1.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc1_st0_rd_advance =  `SPARC_CORE1.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc1_st1_rd_advance =  `SPARC_CORE1.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc1_st2_rd_advance =  `SPARC_CORE1.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc1_st3_rd_advance =  `SPARC_CORE1.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc1_flshinst0_rst_d1  <= 1'b0;
            spc1_st0_rd_advance_d1 <= 1'b0;
            spc1_st0_rd_advance_d2 <= 1'b0;
            spc1_st0_rd_advance_d3 <= 1'b0;
            spc1_st0_rd_advance_d4 <= 1'b0;

            spc1_flshinst1_rst_d1  <= 1'b0;
            spc1_st1_rd_advance_d1 <= 1'b0;
            spc1_st1_rd_advance_d2 <= 1'b0;
            spc1_st1_rd_advance_d3 <= 1'b0;
            spc1_st1_rd_advance_d4 <= 1'b0;

            spc1_flshinst2_rst_d1  <= 1'b0;
            spc1_st2_rd_advance_d1 <= 1'b0;
            spc1_st2_rd_advance_d2 <= 1'b0;
            spc1_st2_rd_advance_d3 <= 1'b0;
            spc1_st2_rd_advance_d4 <= 1'b0;

            spc1_flshinst3_rst_d1  <= 1'b0;
            spc1_st3_rd_advance_d1 <= 1'b0;
            spc1_st3_rd_advance_d2 <= 1'b0;
            spc1_st3_rd_advance_d3 <= 1'b0;
            spc1_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc1_flshinst0_rst_d1  <= `SPARC_CORE1.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc1_st0_rd_advance_d1 <= spc1_st0_rd_advance;
            spc1_st0_rd_advance_d2 <= spc1_st0_rd_advance_d1;
            spc1_st0_rd_advance_d3 <= spc1_st0_rd_advance_d2;
            spc1_st0_rd_advance_d4 <= spc1_st0_rd_advance_d3;

            spc1_flshinst1_rst_d1  <= `SPARC_CORE1.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc1_st1_rd_advance_d1 <= spc1_st1_rd_advance;
            spc1_st1_rd_advance_d2 <= spc1_st1_rd_advance_d1;
            spc1_st1_rd_advance_d3 <= spc1_st1_rd_advance_d2;
            spc1_st1_rd_advance_d4 <= spc1_st1_rd_advance_d3;

            spc1_flshinst2_rst_d1  <= `SPARC_CORE1.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc1_st2_rd_advance_d1 <= spc1_st2_rd_advance;
            spc1_st2_rd_advance_d2 <= spc1_st2_rd_advance_d1;
            spc1_st2_rd_advance_d3 <= spc1_st2_rd_advance_d2;
            spc1_st2_rd_advance_d4 <= spc1_st2_rd_advance_d3;

            spc1_flshinst3_rst_d1  <= `SPARC_CORE1.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc1_st3_rd_advance_d1 <= spc1_st3_rd_advance;
            spc1_st3_rd_advance_d2 <= spc1_st3_rd_advance_d1;
            spc1_st3_rd_advance_d3 <= spc1_st3_rd_advance_d2;
            spc1_st3_rd_advance_d4 <= spc1_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc1_j = 0;
            for(spc1_i=0; spc1_i<7; spc1_i=spc1_i+1) begin
                if(spc1_stb0_valid[spc1_i+1] != spc1_stb0_valid[spc1_i]) begin
                    spc1_j = spc1_j + 1;
                end
            end
            if(spc1_j > 2) begin
                $display("@%d Bug 7117: Error: C1 STB0 valid bits not contiguous: %b", $time, spc1_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C1 STB0 valid bits not contiguous");
            end

            spc1_j = 0;
            for(spc1_i=0; spc1_i<7; spc1_i=spc1_i+1) begin
                if(spc1_stb1_valid[spc1_i+1] != spc1_stb1_valid[spc1_i]) begin
                    spc1_j = spc1_j + 1;
                end
            end
            if(spc1_j > 2) begin
                $display("@%d Bug 7117: Error: C1 STB1 valid bits not contiguous: %b", $time, spc1_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C1 STB1 valid bits not contiguous");
            end

            spc1_j = 0;
            for(spc1_i=0; spc1_i<7; spc1_i=spc1_i+1) begin
                if(spc1_stb2_valid[spc1_i+1] != spc1_stb2_valid[spc1_i]) begin
                    spc1_j = spc1_j + 1;
                end
            end
            if(spc1_j > 2) begin
                $display("@%d Bug 7117: Error: C1 STB2 valid bits not contiguous: %b", $time, spc1_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C1 STB2 valid bits not contiguous");
            end

            spc1_j = 0;
            for(spc1_i=0; spc1_i<7; spc1_i=spc1_i+1) begin
                if(spc1_stb3_valid[spc1_i+1] != spc1_stb3_valid[spc1_i]) begin
                    spc1_j = spc1_j + 1;
                end
            end
            if(spc1_j > 2) begin
                $display("@%d Bug 7117: Error: C1 STB3 valid bits not contiguous: %b", $time, spc1_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C1 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE1.sparc0.lsu.stb_ctl0.rst_l &
                ~spc1_flshinst0_rst_d1 &
                ~(`SPARC_CORE1.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc1_stb0_valid & `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C1 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc1_stb0_valid, `SPARC_CORE1.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C1 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE1.sparc0.lsu.stb_ctl1.rst_l &
                ~spc1_flshinst1_rst_d1 &
                ~(`SPARC_CORE1.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc1_stb1_valid & `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C1 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc1_stb1_valid, `SPARC_CORE1.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C1 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE1.sparc0.lsu.stb_ctl2.rst_l &
                ~spc1_flshinst2_rst_d1 &
                ~(`SPARC_CORE1.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc1_stb2_valid & `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C1 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc1_stb2_valid, `SPARC_CORE1.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C1 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE1.sparc0.lsu.stb_ctl3.rst_l &
                ~spc1_flshinst3_rst_d1 &
                ~(`SPARC_CORE1.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc1_stb3_valid & `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C1 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc1_stb3_valid, `SPARC_CORE1.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C1 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc1_st0_rd_advance_d1 & spc1_st0_rd_advance) begin
                $display("@%d Bug 7117: C1T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc1_st0_rd_advance_d2 & spc1_st0_rd_advance) begin
                $display("@%d Bug 7117: C1T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc1_st0_rd_advance_d3 & spc1_st0_rd_advance) begin
                $display("@%d Bug 7117: C1T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc1_st0_rd_advance_d4 & spc1_st0_rd_advance) begin
                $display("@%d Bug 7117: C1T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc1_st1_rd_advance_d1 & spc1_st1_rd_advance) begin
                $display("@%d Bug 7117: C1T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc1_st1_rd_advance_d2 & spc1_st1_rd_advance) begin
                $display("@%d Bug 7117: C1T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc1_st1_rd_advance_d3 & spc1_st1_rd_advance) begin
                $display("@%d Bug 7117: C1T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc1_st1_rd_advance_d4 & spc1_st1_rd_advance) begin
                $display("@%d Bug 7117: C1T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc1_st2_rd_advance_d1 & spc1_st2_rd_advance) begin
                $display("@%d Bug 7117: C1T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc1_st2_rd_advance_d2 & spc1_st2_rd_advance) begin
                $display("@%d Bug 7117: C1T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc1_st2_rd_advance_d3 & spc1_st2_rd_advance) begin
                $display("@%d Bug 7117: C1T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc1_st2_rd_advance_d4 & spc1_st2_rd_advance) begin
                $display("@%d Bug 7117: C1T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc1_st3_rd_advance_d1 & spc1_st3_rd_advance) begin
                $display("@%d Bug 7117: C1T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc1_st3_rd_advance_d2 & spc1_st3_rd_advance) begin
                $display("@%d Bug 7117: C1T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc1_st3_rd_advance_d3 & spc1_st3_rd_advance) begin
                $display("@%d Bug 7117: C1T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc1_st3_rd_advance_d4 & spc1_st3_rd_advance) begin
                $display("@%d Bug 7117: C1T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (1 = 0; 1 < 8; 1++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC2
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc2_ifu_lsu_pcxreq_d	= `SPARC_CORE2.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc2_ifu_lsu_pcxpkt_e	= `SPARC_CORE2.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc2_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE2.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc2_ifu_lsu_pcxreq_e;
wire		spc2_ifu_lsu_pcxreq_rise_d;
reg		spc2_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc2_ifu_lsu_pcxpkt;
reg		spc2_ifu_lsu_pcxreq_check;
wire		spc2_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc2_ifu_lsu_pcxreq_e <= spc2_ifu_lsu_pcxreq_d;

assign	spc2_ifu_lsu_pcxreq_rise_d = spc2_ifu_lsu_pcxreq_d & ~spc2_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc2_ifu_lsu_pcxreq_rise_e <= spc2_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc2_ifu_lsu_pcxreq_rise_e)
		spc2_ifu_lsu_pcxpkt <= spc2_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc2_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc2_ifu_lsu_pcxreq_rise_d)
		spc2_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc2_lsu_ifu_pcxpkt_ack_d)
		spc2_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc2_ifu_lsu_pcxreq_check_error = spc2_ifu_lsu_pcxreq_check & ~spc2_ifu_lsu_pcxreq_rise_e & (spc2_ifu_lsu_pcxpkt_e != spc2_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc2_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 2 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc2_tlu_lsu_pcxpkt		= `SPARC_CORE2.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc2_lsu_tlu_pcxpkt_ack	= `SPARC_CORE2.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc2_tlu_lsu_pcxpkt_b25_d1;
wire		spc2_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc2_tlu_lsu_pcxpkt_saved;
reg		spc2_tlu_lsu_pcxpkt_check;
wire		spc2_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc2_tlu_lsu_pcxpkt_b25_d1 <= spc2_tlu_lsu_pcxpkt[25];

assign	spc2_tlu_lsu_pcxpkt_rise = spc2_tlu_lsu_pcxpkt[25] & ~spc2_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc2_tlu_lsu_pcxpkt_rise)
		spc2_tlu_lsu_pcxpkt_saved <= spc2_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc2_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc2_tlu_lsu_pcxpkt_rise)
		spc2_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc2_lsu_tlu_pcxpkt_ack)
		spc2_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc2_tlu_lsu_pcxpkt_check_error = spc2_tlu_lsu_pcxpkt_check & (spc2_tlu_lsu_pcxpkt != spc2_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc2_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 2 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc2_spu_lsu_ldst_pckt	= `SPARC_CORE2.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc2_lsu_spu_ldst_ack	= `SPARC_CORE2.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc2_spu_lsu_ldst_pckt_b123_d1;
wire			spc2_spu_lsu_ldst_pckt_rise;
reg			spc2_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc2_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc2_spu_lsu_ldst_pckt_saved;
reg			spc2_spu_lsu_ldst_pckt_check;
wire			spc2_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc2_spu_lsu_ldst_pckt_b123_d1 <= spc2_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc2_spu_lsu_ldst_pckt_rise = spc2_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc2_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc2_spu_lsu_ldst_pckt_rise_d1 <= spc2_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc2_spu_lsu_ldst_pckt_rise)
		spc2_spu_lsu_ldst_pckt_b71b70_saved <= spc2_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc2_spu_lsu_ldst_pckt_rise_d1)
		spc2_spu_lsu_ldst_pckt_saved <= spc2_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc2_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc2_spu_lsu_ldst_pckt_rise)
		spc2_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc2_lsu_spu_ldst_ack)
		spc2_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc2_spu_lsu_ldst_pckt_check_error = spc2_spu_lsu_ldst_pckt_check &
		((!spc2_spu_lsu_ldst_pckt_rise_d1 & (spc2_spu_lsu_ldst_pckt != spc2_spu_lsu_ldst_pckt_saved)) |
		 (spc2_spu_lsu_ldst_pckt[71:70] != spc2_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc2_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 2 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc2_ffu_lsu_fpop_rq_vld	= `SPARC_CORE2.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc2_ffu_lsu_data		= `SPARC_CORE2.sparc0.lsu.ffu_lsu_data;
wire		spc2_lsu_ffu_ack		= `SPARC_CORE2.sparc0.lsu.lsu_ffu_ack;

reg		spc2_ffu_lsu_fpop_rq_vld_d1;
wire		spc2_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc2_ffu_lsu_data_saved;
reg		spc2_ffu_lsu_fpop_rq_vld_check;
wire		spc2_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc2_ffu_lsu_fpop_rq_vld_d1 <= spc2_ffu_lsu_fpop_rq_vld;

assign	spc2_ffu_lsu_fpop_rq_vld_rise = spc2_ffu_lsu_fpop_rq_vld & ~spc2_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc2_ffu_lsu_fpop_rq_vld_rise)
		spc2_ffu_lsu_data_saved <= spc2_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc2_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc2_ffu_lsu_fpop_rq_vld_rise)
		spc2_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc2_lsu_ffu_ack)
		spc2_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc2_ffu_lsu_fpop_rq_vld_check_error = spc2_ffu_lsu_fpop_rq_vld_check & (spc2_ffu_lsu_data != spc2_ffu_lsu_data_saved) | (spc2_ffu_lsu_fpop_rq_vld_rise & !spc2_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc2_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 2 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc2_spc_pcx_req_pq		= `SPARC_CORE2.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc2_spc_pcx_data_pa		= `SPARC_CORE2.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc2_spc_pcx_req_pa;
wire			spc2_spc_pcx_req_fp1;
wire			spc2_spc_pcx_req_fp2;
reg			spc2_spc_pcx_req_fp1_d1;
wire 			spc2_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc2_spc_pcx_req_pa <= spc2_spc_pcx_req_pq;

assign	spc2_spc_pcx_req_fp1 = (|spc2_spc_pcx_req_pa) & (spc2_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc2_spc_pcx_req_fp2 = spc2_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc2_spc_pcx_req_fp1_d1 <= spc2_spc_pcx_req_fp1;

assign	spc2_spc_pcx_req_fp_b2b_error = spc2_spc_pcx_req_fp1_d1 != spc2_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc2_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 2 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc2_ld_sec_hit_l2access_w2 = `SPARC_CORE2.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc2_ld0_pkt_vld_tmp  = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc2_ld0_pkt_vld_tmp_d;

   wire spc2_ld0_inst_vld_w2  = `SPARC_CORE2.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc2_ld0_is_sec_w2 = spc2_ld0_inst_vld_w2 ? spc2_ld_sec_hit_l2access_w2 : 0;


   wire spc2_ld1_pkt_vld_tmp  = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc2_ld1_pkt_vld_tmp_d;

   wire spc2_ld1_inst_vld_w2  = `SPARC_CORE2.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc2_ld1_is_sec_w2 = spc2_ld1_inst_vld_w2 ? spc2_ld_sec_hit_l2access_w2 : 0;


   wire spc2_ld2_pkt_vld_tmp  = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc2_ld2_pkt_vld_tmp_d;

   wire spc2_ld2_inst_vld_w2  = `SPARC_CORE2.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc2_ld2_is_sec_w2 = spc2_ld2_inst_vld_w2 ? spc2_ld_sec_hit_l2access_w2 : 0;


   wire spc2_ld3_pkt_vld_tmp  = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc2_ld3_pkt_vld_tmp_d;

   wire spc2_ld3_inst_vld_w2  = `SPARC_CORE2.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc2_ld3_is_sec_w2 = spc2_ld3_inst_vld_w2 ? spc2_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc2_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc2_ld0_pkt_vld_tmp;
   spc2_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc2_ld1_pkt_vld_tmp;
   spc2_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc2_ld2_pkt_vld_tmp;
   spc2_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc2_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc2_l2      = `SPARC_CORE2.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc2_unc     = `SPARC_CORE2.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc2_fpld    = `SPARC_CORE2.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc2_fpldst  = `SPARC_CORE2.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc2_unflush = `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc2_ldw     = `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc2_byp     = `SPARC_CORE2.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc2_flsh    = `SPARC_CORE2.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc2_chm     = `SPARC_CORE2.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc2_ldxa    = `SPARC_CORE2.sparc0.lsu.dctl.ldxa_internal ;
wire        spc2_ato     = `SPARC_CORE2.sparc0.lsu.dctl.atomic_g ;
wire        spc2_pref    = `SPARC_CORE2.sparc0.lsu.dctl.pref_inst_g ;
wire        spc2_chit    = `SPARC_CORE2.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc2_dcp     = `SPARC_CORE2.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc2_dtp     = `SPARC_CORE2.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc2_mpu     = `SPARC_CORE2.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc2_exu_und;
reg  [ 4:0] spc2_exu;
reg spc2_flsh_g;
always @(posedge clk)
begin
  spc2_flsh_g <= `SPARC_CORE2.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc2_byp_g;
always @(posedge clk)
begin
  spc2_byp_g <= `SPARC_CORE2.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc2_exu_und = {
//spc2_l2,
//  spc2_unc,
  spc2_fpld,
  spc2_fpldst,
  spc2_unflush,
//spc2_ldw,
  spc2_byp_g,
  spc2_flsh_g,
//spc2_chm,
  spc2_ldxa,
  spc2_ato,
  spc2_pref,
  spc2_chit,
//spc2_dcp,
  spc2_dtp,
  spc2_mpu
};

always @(spc2_exu_und)
begin
  case (spc2_exu_und)
    16'h0000 : spc2_exu =  5'h00;
    16'h0101 : spc2_exu =  5'h01;
    16'h0102 : spc2_exu =  5'h02;
    16'h0104 : spc2_exu =  5'h03;
    16'h0008 : spc2_exu =  5'h04;
    16'h0110 : spc2_exu =  5'h05;
    16'h0120 : spc2_exu =  5'h06;
    16'h0040 : spc2_exu =  5'h07;
    16'h0080 : spc2_exu =  5'h08;
    16'h0100 : spc2_exu =  5'h09;
    16'h0200 : spc2_exu =  5'h0a;
    16'h0400 : spc2_exu =  5'h0b;
    //16'h0800 : spc2_exu =  5'h0c;
    default  : spc2_exu =  5'h0c;

//  16'h1000 : spc2_exu =  5'h0d;
//  16'h2000 : spc2_exu =  5'h0e;
//  16'h4000 : spc2_exu =  5'h0f;
//  16'h8000 : spc2_exu =  5'h10;
//  default  : spc2_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc2_exp_wtchpt_trp_g             = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc2_exp_misalign_addr_ldst_atm_m = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc2_exp_priv_violtn_g            = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc2_exp_daccess_prot_g           = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc2_exp_priv_action_g            = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc2_exp_spec_access_epage_g      = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc2_exp_uncache_atomic_g         = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc2_exp_illegal_asi_action_g     = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc2_exp_flt_ld_nfo_pg_g          = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc2_exp_tlb_data_ue              = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc2_exp_tlb_tag_ue               = `SPARC_CORE2.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc2_exp_unc                      = `SPARC_CORE2.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc2_exp_und;
reg  [ 3:0] spc2_exp;

assign spc2_exp_und = {
  spc2_exp_wtchpt_trp_g,
  spc2_exp_misalign_addr_ldst_atm_m,
  spc2_exp_priv_violtn_g,
  spc2_exp_daccess_prot_g,
  spc2_exp_priv_action_g,
  spc2_exp_spec_access_epage_g,
  spc2_exp_uncache_atomic_g,
  spc2_exp_illegal_asi_action_g,
  spc2_exp_flt_ld_nfo_pg_g,
  spc2_exp_tlb_data_ue,
  spc2_exp_tlb_tag_ue,
  spc2_exp_unc
};

always @(spc2_exp_und)
begin
  case (spc2_exp_und)
    12'h000 : spc2_exp =  4'h0;
    12'h001 : spc2_exp =  4'h1;
    12'h002 : spc2_exp =  4'h2;
    12'h004 : spc2_exp =  4'h3;
    12'h008 : spc2_exp =  4'h4;
    12'h010 : spc2_exp =  4'h5;
    12'h020 : spc2_exp =  4'h6;
    12'h040 : spc2_exp =  4'h7;
    12'h080 : spc2_exp =  4'h8;
    12'h100 : spc2_exp =  4'h9;
    12'h200 : spc2_exp =  4'ha;
    12'h400 : spc2_exp =  4'hb;
    12'h800 : spc2_exp =  4'hc;
    default : spc2_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc2_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc2_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE2.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc2_lsu_ld_hit_wb;

assign  spc2_lsu_ld_hit_wb   =
((|`SPARC_CORE2.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE2.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE2.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE2.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE2.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE2.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE2.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE2.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE2.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE2.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE2.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE2.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE2.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc2_lsu_bld_vld_w2;
reg spc2_lsu_bld_hit_w2;
reg spc2_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc2_lsu_bld_vld_w2 <= `SPARC_CORE2.sparc0.lsu.qctl1.bld_g ;
  spc2_lsu_bld_hit_w2 <= spc2_lsu_ld_hit_wb ;
  spc2_lsu_bld_raw_w2 <= `SPARC_CORE2.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE2.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE2.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE2.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE2.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE2.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE2.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE2.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE2.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE2.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE2.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc2_phy_byp_ec_asi_e;
reg spc2_phy_use_ec_asi_e;
reg spc2_quad_ldd_real_e;
reg spc2_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc2_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE2.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc2_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE2.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc2_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE2.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc2_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE2.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc2_pscxt_ldxa_illgl_va_decode;
wire spc2_lsuctl_illgl_va_decode;
wire spc2_mrgnctl_illgl_va_decode;
wire spc2_asi42_illgl_va_decode;

assign spc2_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE2.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc2_lsuctl_illgl_va_decode     = (`SPARC_CORE2.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc2_mrgnctl_illgl_va_decode    = (`SPARC_CORE2.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc2_asi42_illgl_va_decode      =  `SPARC_CORE2.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc2_l2_ld_return_error = `SPARC_CORE2.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE2.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc2_l2_ld_return_error) begin
//    $display("Error @%d : sparc 2 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc2_io_ld_return_error = `SPARC_CORE2.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE2.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc2_io_ld_return_error) begin
    $display("Error @%d : sparc 2 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc2t0_dec_rptr_pcx_noced;

assign  spc2t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE2.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc2t1_dec_rptr_pcx_noced;

assign  spc2t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE2.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc2t2_dec_rptr_pcx_noced;

assign  spc2t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE2.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc2t3_dec_rptr_pcx_noced;

assign  spc2t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE2.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc2_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc2_stb_cam_cm_tid_d1 <= `SPARC_CORE2.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc2_stb_cam_hit_ptr_dec;
assign spc2_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE2.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc2t0_st_dq1_ld_hit;
assign spc2t0_st_dq1_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl0.dqptr_d1 & spc2_stb_cam_hit_ptr_dec);

wire [7:0] spc2t0_st_dq2_ld_hit;
assign spc2t0_st_dq2_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl0.dqptr_d2 & spc2_stb_cam_hit_ptr_dec);


wire [7:0] spc2t1_st_dq1_ld_hit;
assign spc2t1_st_dq1_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl1.dqptr_d1 & spc2_stb_cam_hit_ptr_dec);

wire [7:0] spc2t1_st_dq2_ld_hit;
assign spc2t1_st_dq2_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl1.dqptr_d2 & spc2_stb_cam_hit_ptr_dec);


wire [7:0] spc2t2_st_dq1_ld_hit;
assign spc2t2_st_dq1_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl2.dqptr_d1 & spc2_stb_cam_hit_ptr_dec);

wire [7:0] spc2t2_st_dq2_ld_hit;
assign spc2t2_st_dq2_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl2.dqptr_d2 & spc2_stb_cam_hit_ptr_dec);


wire [7:0] spc2t3_st_dq1_ld_hit;
assign spc2t3_st_dq1_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl3.dqptr_d1 & spc2_stb_cam_hit_ptr_dec);

wire [7:0] spc2t3_st_dq2_ld_hit;
assign spc2t3_st_dq2_ld_hit =
{8{(`SPARC_CORE2.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE2.sparc0.lsu.stb_cam_hit) &
	(spc2_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE2.sparc0.lsu.stb_ctl3.dqptr_d2 & spc2_stb_cam_hit_ptr_dec);


wire spc2_st_atm_blkst_vld;
assign spc2_st_atm_blkst_vld =
((`SPARC_CORE2.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE2.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE2.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE2.sparc0.lsu.stb_rwctl.blkst_m;

reg spc2_qctl1_casa_w2;
reg spc2_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc2_qctl1_casa_w2 <= `SPARC_CORE2.sparc0.lsu.qctl1.casa_g;
  spc2_stb_cam_vld_w <= `SPARC_CORE2.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc2_bw_r_scm_error;
assign spc2_bw_r_scm_error =
((spc2_stb_cam_vld_w
  &  `SPARC_CORE2.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE2.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE2.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE2.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE2.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE2.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE2.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE2.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE2.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE2.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc2_bw_r_scm_error) begin
		$display("Error @%d : sparc2 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc2_tte_data_perror_unc_wo_vld;
assign spc2_tte_data_perror_unc_wo_vld =
  `SPARC_CORE2.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE2.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE2.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE2.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE2.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc2_tte_data_perror_unc_w_flush;
assign spc2_tte_data_perror_unc_w_flush =
  `SPARC_CORE2.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE2.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE2.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE2.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE2.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE2.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc2_lsu_dcache_tag_perror_g_w_blkasi;
assign spc2_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE2.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE2.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE2.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc2_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc2_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE2.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE2.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE2.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc2_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc2_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE2.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE2.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE2.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE2.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc2_lsu_dcache_tag_perror_g_w_atomic;
assign spc2_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE2.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE2.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE2.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc2_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc2_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE2.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE2.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc2_lsu_dcache_data_perror_g_dtag_perror;
assign spc2_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE2.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE2.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc2_lsu_dcache_data_perror_g_w_altspace;
assign spc2_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE2.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE2.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc2_lsu_dcache_data_perror_g_w_atomic;
assign spc2_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE2.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE2.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE2.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE2.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (2 = 0; 2 < 8; 2++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc2_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc2_lsu_dtagv_wr_vld_e_d1, spc2_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc2_dva_rdaddr_10to6_d1;
wire [15:0] spc2_dva_rd_en_e;
reg  [15:0] spc2_dva_rd_en_e_d1;
wire [15:0] spc2_dva_vld_m_expanded;
reg  [4:0] spc2_dva_wraddr_10to6_d1, spc2_dva_wraddr_10to6_d2;
reg  [15:0] spc2_dva_bit_wr_en_e_d1, spc2_dva_bit_wr_en_e_d2;
reg  spc2_dva_din_e_d1, spc2_dva_din_e_d2;

wire spc2_dva_rdwr_sameline_diffvalue;
wire spc2_dva_rd_wr_sameline_diffvalue;
wire spc2_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc2_dfq_byp_ff_data_d1, spc2_dfq_byp_ff_data_d2;

// lsu_traps
reg spc2_ifu_tlu_inst_vld_w;
reg spc2_ifu_tlu_flush_w;
reg spc2_ifu_mmu_trap_w;
//reg spc2_spu_tlu_rsrv_illgl_w;
reg spc2_exu_lsu_priority_trap_w;
reg spc2_ffu_tlu_ill_inst_w;
reg spc2_ifu_tlu_immu_miss_w;
reg spc2_ifu_tlu_priv_violtn_w;
reg spc2_exu_ifu_va_oor_w;

// lsu_sechit
reg spc2_lsu_way_hit_or_w2, spc2_ncache_pcx_rq_w2;
reg  [7:0] spc2_stb_ld_partial_raw_w2, spc2_stb_ld_partial_raw_w3, spc2_stb_ld_partial_raw_w4;
reg  [7:0] spc2_stb_ld_full_raw_w2, spc2_stb_ld_full_raw_w3, spc2_stb_ld_full_raw_w4;
wire [7:0] spc2_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc2_stb_cam_rw_ptr_decode_w, spc2_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc2_stb_cam_rw_ptr_decode_w3, spc2_stb_cam_rw_ptr_decode_w4;
wire spc2_t0_ld_st_partialraw_hit;
wire spc2_t0_ld_st_fullraw_hit;
wire spc2_t0_st_ld_partialraw_hit;
wire spc2_t0_st_ld_fullraw_hit;
reg  spc2_ld0_inst_vld_w3, spc2_ld0_inst_vld_w4;
wire spc2_t1_ld_st_partialraw_hit;
wire spc2_t1_ld_st_fullraw_hit;
wire spc2_t1_st_ld_partialraw_hit;
wire spc2_t1_st_ld_fullraw_hit;
reg  spc2_ld1_inst_vld_w3, spc2_ld1_inst_vld_w4;
wire spc2_t2_ld_st_partialraw_hit;
wire spc2_t2_ld_st_fullraw_hit;
wire spc2_t2_st_ld_partialraw_hit;
wire spc2_t2_st_ld_fullraw_hit;
reg  spc2_ld2_inst_vld_w3, spc2_ld2_inst_vld_w4;
wire spc2_t3_ld_st_partialraw_hit;
wire spc2_t3_ld_st_fullraw_hit;
wire spc2_t3_st_ld_partialraw_hit;
wire spc2_t3_st_ld_fullraw_hit;
reg  spc2_ld3_inst_vld_w3, spc2_ld3_inst_vld_w4;
reg  spc2_stb_cam_mhit_w3, spc2_stb_cam_mhit_w4;
reg  spc2_io_ld_w3, spc2_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc2_pick_valid_raw, spc2_pick_status, spc2_pick_status_error;
reg  [11:0] spc2_pick_valid_raw_d1, spc2_pick_status_d1;
wire [11:0] spc2_pcx_rq_sel_d2;
reg  [11:0] spc2_pcx_rq_sel_d3;

// lsu_picker2
reg         spc2_fwdpkt_valid_raw;
reg  [3:0]  spc2_st_valid_raw;
wire        spc2_fwdpkt_valid, spc2_pcx_req_squash_d1;
wire [3:0]  spc2_st_valid;
wire [11:0] spc2_pick_valid_raw_h, spc2_pick_valid_h, spc2_pick_valid_h_ext;
reg  [11:0] spc2_pick_valid_h_d1, spc2_pick_valid_h_d2;
wire [4:0]  spc2_pre_qwr, spc2_mcycle_mask_qwr_d1;
wire [11:0] spc2_pick_destbusy_unqual, spc2_pick_atompend_unqual;
wire [11:0] spc2_pick_presented, spc2_pick_destbusy, spc2_pick_atompend;
wire [2:0]  spc2_pick_presented_count, spc2_pick_destbusy_count, spc2_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc2_ldfill_addr_w, spc2_ldinst_addr_m;
reg  [10:4] spc2_lsu_dcache_fill_addr_m, spc2_lsu_dcache_fill_addr_w;
wire        spc2_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc2_strm_stxa_g;
reg  [3:0] spc2_strm_stxa_w2, spc2_lsu_spu_stb_empty_d1;
reg        spc2_strm_stxa_state;
reg  [3:0] spc2_strm_stxa_tid_decode;


`ifdef RTL_SPARC2

    // lsu_dfq_stalls_2ormore_entries

    assign spc2_dfq_2ormore_vld_entries  = |(`SPARC_CORE2.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc2_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc2_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc2_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc2_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc2_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE2.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc2_dva_rdwr_sameline_diffvalue =
        (spc2_dva_rdaddr_10to6_d1 == spc2_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc2_dva_rd_en_e_d1 & spc2_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc2_dva_vld_m_expanded ^ {16{spc2_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc2_dva_rd_wr_sameline_diffvalue =
        (spc2_dva_rdaddr_10to6_d1 == `SPARC_CORE2.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc2_dva_rd_en_e_d1 & `SPARC_CORE2.sparc0.lsu.dva_bit_wr_en_e &
           (spc2_dva_vld_m_expanded ^ {16{`SPARC_CORE2.sparc0.lsu.dva_din_e}}) );

    assign spc2_dva_wr_rd_sameline_diffvalue =
        (spc2_dva_rdaddr_10to6_d1 == spc2_dva_wraddr_10to6_d2) &
        |( spc2_dva_rd_en_e_d1 & spc2_dva_bit_wr_en_e_d2 &
           (spc2_dva_vld_m_expanded ^ {16{spc2_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc2_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc2_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc2_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc2_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc2_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc2_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc2_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc2_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE2.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc2_t0_ld_st_partialraw_hit    = |( spc2_stb_ld_partial_raw_w4 & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t0_ld_st_fullraw_hit       = |( spc2_stb_ld_full_raw_w4    & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t0_st_ld_partialraw_hit    = |( spc2_stb_ld_partial_raw_w2 & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t0_st_ld_fullraw_hit       = |( spc2_stb_ld_full_raw_w2    & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t1_ld_st_partialraw_hit    = |( spc2_stb_ld_partial_raw_w4 & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t1_ld_st_fullraw_hit       = |( spc2_stb_ld_full_raw_w4    & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t1_st_ld_partialraw_hit    = |( spc2_stb_ld_partial_raw_w2 & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t1_st_ld_fullraw_hit       = |( spc2_stb_ld_full_raw_w2    & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t2_ld_st_partialraw_hit    = |( spc2_stb_ld_partial_raw_w4 & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t2_ld_st_fullraw_hit       = |( spc2_stb_ld_full_raw_w4    & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t2_st_ld_partialraw_hit    = |( spc2_stb_ld_partial_raw_w2 & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t2_st_ld_fullraw_hit       = |( spc2_stb_ld_full_raw_w2    & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t3_ld_st_partialraw_hit    = |( spc2_stb_ld_partial_raw_w4 & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t3_ld_st_fullraw_hit       = |( spc2_stb_ld_full_raw_w4    & spc2_stb_cam_rw_ptr_decode_w4 );
    assign spc2_t3_st_ld_partialraw_hit    = |( spc2_stb_ld_partial_raw_w2 & spc2_stb_cam_rw_ptr_decode_w2 );
    assign spc2_t3_st_ld_fullraw_hit       = |( spc2_stb_ld_full_raw_w2    & spc2_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc2_pick_valid_raw[11:0] = {`SPARC_CORE2.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE2.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE2.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc2_pick_status[11:0] = {`SPARC_CORE2.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE2.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE2.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc2_pcx_rq_sel_d2[11:0] = {`SPARC_CORE2.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc2_pick_status_error = ~spc2_pick_valid_raw & spc2_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc2_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc2_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc2_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc2_pcx_req_squash_d1 = `SPARC_CORE2.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc2_fwdpkt_valid_raw  <= 1'b0;
            spc2_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc2_fwdpkt_valid_raw <= (`SPARC_CORE2.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc2_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE2.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc2_pcx_req_squash_d1);

            spc2_st_valid_raw[3]  <= (`SPARC_CORE2.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc2_st_valid_raw[3]) &
                                        ~(`SPARC_CORE2.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc2_pcx_req_squash_d1);
            spc2_st_valid_raw[2]  <= (`SPARC_CORE2.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc2_st_valid_raw[2]) &
                                        ~(`SPARC_CORE2.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc2_pcx_req_squash_d1);
            spc2_st_valid_raw[1]  <= (`SPARC_CORE2.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc2_st_valid_raw[1]) &
                                        ~(`SPARC_CORE2.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc2_pcx_req_squash_d1);
            spc2_st_valid_raw[0]  <= (`SPARC_CORE2.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc2_st_valid_raw[0]) &
                                        ~(`SPARC_CORE2.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc2_pcx_req_squash_d1);

            spc2_pick_valid_h_d1  <= spc2_pick_valid_h;
            spc2_pick_valid_h_d2  <= spc2_pick_valid_h_d1;
        end
    end

    assign spc2_fwdpkt_valid = spc2_fwdpkt_valid_raw & |(`SPARC_CORE2.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE2.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc2_st_valid[3]  = spc2_st_valid_raw[3] & |(`SPARC_CORE2.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE2.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc2_st_valid[2]  = spc2_st_valid_raw[2] & |(`SPARC_CORE2.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE2.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc2_st_valid[1]  = spc2_st_valid_raw[1] & |(`SPARC_CORE2.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE2.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc2_st_valid[0]  = spc2_st_valid_raw[0] & |(`SPARC_CORE2.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE2.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc2_pick_valid_raw_h[11:0] = {`SPARC_CORE2.sparc0.lsu.qctl1.misc_events_raw[3:1], spc2_fwdpkt_valid_raw,
                                             spc2_st_valid_raw[3:0],
                                             `SPARC_CORE2.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc2_pick_valid_h[11:0] = {`SPARC_CORE2.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE2.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE2.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc2_fwdpkt_valid,
                                         spc2_st_valid[3:0],
                                         `SPARC_CORE2.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE2.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE2.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE2.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc2_pick_valid_h_ext[11:0] = spc2_pick_valid_h | spc2_pick_valid_h_d1 | spc2_pick_valid_h_d2;

    assign spc2_pre_qwr[4:0] = `SPARC_CORE2.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc2_pick_destbusy_unqual[11] = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[10] = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[9]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[8]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc2_pick_destbusy_unqual[7]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[6]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[5]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[4]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[3]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[2]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[1]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc2_pick_destbusy_unqual[0]  = ~|(spc2_pre_qwr[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc2_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE2.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc2_pick_atompend_unqual[11] = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[10] = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[9]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[8]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc2_pick_atompend_unqual[7]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[6]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[5]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[4]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[3]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[2]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[1]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc2_pick_atompend_unqual[0]  = ~|(~spc2_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE2.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc2_pick_presented = spc2_pick_valid_raw_h &  spc2_pick_valid_h_ext;
    assign spc2_pick_destbusy  = spc2_pick_valid_raw_h & ~spc2_pick_valid_h_ext & spc2_pick_destbusy_unqual;
    assign spc2_pick_atompend  = spc2_pick_valid_raw_h & ~spc2_pick_valid_h_ext & spc2_pick_atompend_unqual;

    count12bits C2_presented_count(
        .in  (spc2_pick_presented),
        .out (spc2_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C2_destbusy_count(
        .in  (spc2_pick_destbusy),
        .out (spc2_pick_destbusy_count)
    );
    count12bits C2_atompend_count(
        .in  (spc2_pick_atompend),
        .out (spc2_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc2_ldfill_addr_w[39:4]    = {`SPARC_CORE2.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc2_lsu_dcache_fill_addr_w[10:4]};
    assign spc2_ldinst_addr_m[39:4]    = {`SPARC_CORE2.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE2.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc2_filladdrw_eq_ldaddrm   = (spc2_ldfill_addr_w[39:4] == spc2_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc2_strm_stxa_g[3] = `SPARC_CORE2.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE2.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc2_strm_stxa_g[2] = `SPARC_CORE2.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE2.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc2_strm_stxa_g[1] = `SPARC_CORE2.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE2.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc2_strm_stxa_g[0] = `SPARC_CORE2.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE2.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE2.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc2_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE2.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc2_lsu_dtagv_wr_vld_e_d2    <= spc2_lsu_dtagv_wr_vld_e_d1;

        spc2_dva_rdaddr_10to6_d1      <= `SPARC_CORE2.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc2_dva_rd_en_e_d1           <= spc2_dva_rd_en_e;

        spc2_dva_wraddr_10to6_d1      <= `SPARC_CORE2.sparc0.lsu.dva_wr_adr_e[10:6];
        spc2_dva_wraddr_10to6_d2      <= spc2_dva_wraddr_10to6_d1;

        spc2_dva_bit_wr_en_e_d1       <= `SPARC_CORE2.sparc0.lsu.dva_bit_wr_en_e;
        spc2_dva_bit_wr_en_e_d2       <= spc2_dva_bit_wr_en_e_d1;

        spc2_dva_din_e_d1             <= `SPARC_CORE2.sparc0.lsu.dva_din_e;
        spc2_dva_din_e_d2             <= spc2_dva_din_e_d1;

        spc2_dfq_byp_ff_data_d1       <= `SPARC_CORE2.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc2_dfq_byp_ff_data_d2       <= spc2_dfq_byp_ff_data_d1;

        spc2_ifu_tlu_inst_vld_w       <= `SPARC_CORE2.sparc0.ifu_tlu_inst_vld_m;
        spc2_ifu_tlu_flush_w          <= `SPARC_CORE2.sparc0.ifu_tlu_flush_m;
        spc2_ifu_mmu_trap_w           <= `SPARC_CORE2.sparc0.ifu_mmu_trap_m;
//        spc2_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE2.sparc0.spu_tlu_rsrv_illgl_m;
        spc2_exu_lsu_priority_trap_w  <= `SPARC_CORE2.sparc0.exu_lsu_priority_trap_m;
        spc2_ffu_tlu_ill_inst_w       <= `SPARC_CORE2.sparc0.ffu_tlu_ill_inst_m;
        spc2_ifu_tlu_immu_miss_w      <= `SPARC_CORE2.sparc0.ifu_tlu_immu_miss_m;
        spc2_ifu_tlu_priv_violtn_w    <= `SPARC_CORE2.sparc0.ifu_tlu_priv_violtn_m;
        spc2_exu_ifu_va_oor_w         <= `SPARC_CORE2.sparc0.exu_ifu_va_oor_m;

        spc2_lsu_way_hit_or_w2        <= `SPARC_CORE2.sparc0.lsu.dctl.lsu_way_hit_or;
        spc2_ncache_pcx_rq_w2         <= `SPARC_CORE2.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc2_stb_ld_partial_raw_w2    <= `SPARC_CORE2.sparc0.lsu.stb_ld_partial_raw;
        spc2_stb_ld_partial_raw_w3    <= spc2_stb_ld_partial_raw_w2;
        spc2_stb_ld_partial_raw_w4    <= spc2_stb_ld_partial_raw_w3;
        spc2_stb_ld_full_raw_w2       <= `SPARC_CORE2.sparc0.lsu.stb_ld_full_raw;
        spc2_stb_ld_full_raw_w3       <= spc2_stb_ld_full_raw_w2;
        spc2_stb_ld_full_raw_w4       <= spc2_stb_ld_full_raw_w3;
        spc2_stb_cam_rw_ptr_decode_w  <= spc2_stb_cam_rw_ptr_decode_m;
        spc2_stb_cam_rw_ptr_decode_w2 <= spc2_stb_cam_rw_ptr_decode_w;
        spc2_stb_cam_rw_ptr_decode_w3 <= spc2_stb_cam_rw_ptr_decode_w2;
        spc2_stb_cam_rw_ptr_decode_w4 <= spc2_stb_cam_rw_ptr_decode_w3;
        spc2_ld0_inst_vld_w3       <= `SPARC_CORE2.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc2_ld0_inst_vld_w4       <= spc2_ld0_inst_vld_w3;
        spc2_ld1_inst_vld_w3       <= `SPARC_CORE2.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc2_ld1_inst_vld_w4       <= spc2_ld1_inst_vld_w3;
        spc2_ld2_inst_vld_w3       <= `SPARC_CORE2.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc2_ld2_inst_vld_w4       <= spc2_ld2_inst_vld_w3;
        spc2_ld3_inst_vld_w3       <= `SPARC_CORE2.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc2_ld3_inst_vld_w4       <= spc2_ld3_inst_vld_w3;
        spc2_stb_cam_mhit_w3          <= `SPARC_CORE2.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc2_stb_cam_mhit_w4          <= spc2_stb_cam_mhit_w3;
        spc2_io_ld_w3                 <= `SPARC_CORE2.sparc0.lsu.qctl1.io_ld_w2;
        spc2_io_ld_w4                 <= spc2_io_ld_w3;

        spc2_pick_valid_raw_d1        <= spc2_pick_valid_raw;
        spc2_pick_status_d1           <= spc2_pick_status;
        spc2_pcx_rq_sel_d3            <= spc2_pcx_rq_sel_d2;

        spc2_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE2.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc2_lsu_dcache_fill_addr_w[10:4] <= spc2_lsu_dcache_fill_addr_m[10:4];

        spc2_strm_stxa_w2             <= spc2_strm_stxa_g;
        spc2_lsu_spu_stb_empty_d1     <= `SPARC_CORE2.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc2_pick_status_error ) begin
          $display("Error @%d : sparc 2 pick_status not set properly: %b", $time, spc2_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc2_pick_valid_raw_d1 & ~spc2_pick_status_d1) & |spc2_pick_status ) begin
          $display("Error @%d : sparc 2 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc2_pick_status & spc2_pick_status_d1) & |spc2_pick_status ) begin
          $display("Error @%d : sparc 2 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc2_strm_stxa_state      <= 1'b0;
            spc2_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc2_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc2_strm_stxa_w2 & ~spc2_lsu_spu_stb_empty_d1) ) begin
                    spc2_strm_stxa_state      <= 1'b1;
                    spc2_strm_stxa_tid_decode <= spc2_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE2.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc2_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE2.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc2_strm_stxa_tid_decode[3] | spc2_strm_stxa_tid_decode[2]),
                             (spc2_strm_stxa_tid_decode[3] | spc2_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 2 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc2_strm_stxa_tid_decode = spc2_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc2_strm_stxa_tid_decode & ~spc2_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 2 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE2.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc2_strm_stxa_tid_decode[3] | spc2_strm_stxa_tid_decode[2]),
                             (spc2_strm_stxa_tid_decode[3] | spc2_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 2 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc2_strm_stxa_state      = 1'b0;
                        spc2_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C2 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C2 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C2 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C2 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C2 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE2.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C2 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE2.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C2 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C2 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C2 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C2 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C2 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE2.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C2 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C2 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C2 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C2 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE2.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C2 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc2_i, spc2_j;
    wire [7:0] spc2_stb0_valid, spc2_stb1_valid, spc2_stb2_valid, spc2_stb3_valid;

    assign spc2_stb0_valid[7:0] = `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc2_stb1_valid[7:0] = `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc2_stb2_valid[7:0] = `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc2_stb3_valid[7:0] = `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc2_st0_rd_advance, spc2_st1_rd_advance, spc2_st2_rd_advance, spc2_st3_rd_advance;
    reg spc2_flshinst0_rst_d1, spc2_flshinst1_rst_d1, spc2_flshinst2_rst_d1, spc2_flshinst3_rst_d1;
    reg spc2_st0_rd_advance_d1, spc2_st1_rd_advance_d1, spc2_st2_rd_advance_d1, spc2_st3_rd_advance_d1;
    reg spc2_st0_rd_advance_d2, spc2_st1_rd_advance_d2, spc2_st2_rd_advance_d2, spc2_st3_rd_advance_d2;
    reg spc2_st0_rd_advance_d3, spc2_st1_rd_advance_d3, spc2_st2_rd_advance_d3, spc2_st3_rd_advance_d3;
    reg spc2_st0_rd_advance_d4, spc2_st1_rd_advance_d4, spc2_st2_rd_advance_d4, spc2_st3_rd_advance_d4;

/***************************
    assign spc2_st0_rd_advance =  `SPARC_CORE2.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE2.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc2_st1_rd_advance =  `SPARC_CORE2.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE2.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc2_st2_rd_advance =  `SPARC_CORE2.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE2.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc2_st3_rd_advance =  `SPARC_CORE2.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE2.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE2.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE2.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc2_st0_rd_advance =  `SPARC_CORE2.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc2_st1_rd_advance =  `SPARC_CORE2.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc2_st2_rd_advance =  `SPARC_CORE2.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc2_st3_rd_advance =  `SPARC_CORE2.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc2_flshinst0_rst_d1  <= 1'b0;
            spc2_st0_rd_advance_d1 <= 1'b0;
            spc2_st0_rd_advance_d2 <= 1'b0;
            spc2_st0_rd_advance_d3 <= 1'b0;
            spc2_st0_rd_advance_d4 <= 1'b0;

            spc2_flshinst1_rst_d1  <= 1'b0;
            spc2_st1_rd_advance_d1 <= 1'b0;
            spc2_st1_rd_advance_d2 <= 1'b0;
            spc2_st1_rd_advance_d3 <= 1'b0;
            spc2_st1_rd_advance_d4 <= 1'b0;

            spc2_flshinst2_rst_d1  <= 1'b0;
            spc2_st2_rd_advance_d1 <= 1'b0;
            spc2_st2_rd_advance_d2 <= 1'b0;
            spc2_st2_rd_advance_d3 <= 1'b0;
            spc2_st2_rd_advance_d4 <= 1'b0;

            spc2_flshinst3_rst_d1  <= 1'b0;
            spc2_st3_rd_advance_d1 <= 1'b0;
            spc2_st3_rd_advance_d2 <= 1'b0;
            spc2_st3_rd_advance_d3 <= 1'b0;
            spc2_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc2_flshinst0_rst_d1  <= `SPARC_CORE2.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc2_st0_rd_advance_d1 <= spc2_st0_rd_advance;
            spc2_st0_rd_advance_d2 <= spc2_st0_rd_advance_d1;
            spc2_st0_rd_advance_d3 <= spc2_st0_rd_advance_d2;
            spc2_st0_rd_advance_d4 <= spc2_st0_rd_advance_d3;

            spc2_flshinst1_rst_d1  <= `SPARC_CORE2.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc2_st1_rd_advance_d1 <= spc2_st1_rd_advance;
            spc2_st1_rd_advance_d2 <= spc2_st1_rd_advance_d1;
            spc2_st1_rd_advance_d3 <= spc2_st1_rd_advance_d2;
            spc2_st1_rd_advance_d4 <= spc2_st1_rd_advance_d3;

            spc2_flshinst2_rst_d1  <= `SPARC_CORE2.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc2_st2_rd_advance_d1 <= spc2_st2_rd_advance;
            spc2_st2_rd_advance_d2 <= spc2_st2_rd_advance_d1;
            spc2_st2_rd_advance_d3 <= spc2_st2_rd_advance_d2;
            spc2_st2_rd_advance_d4 <= spc2_st2_rd_advance_d3;

            spc2_flshinst3_rst_d1  <= `SPARC_CORE2.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc2_st3_rd_advance_d1 <= spc2_st3_rd_advance;
            spc2_st3_rd_advance_d2 <= spc2_st3_rd_advance_d1;
            spc2_st3_rd_advance_d3 <= spc2_st3_rd_advance_d2;
            spc2_st3_rd_advance_d4 <= spc2_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc2_j = 0;
            for(spc2_i=0; spc2_i<7; spc2_i=spc2_i+1) begin
                if(spc2_stb0_valid[spc2_i+1] != spc2_stb0_valid[spc2_i]) begin
                    spc2_j = spc2_j + 1;
                end
            end
            if(spc2_j > 2) begin
                $display("@%d Bug 7117: Error: C2 STB0 valid bits not contiguous: %b", $time, spc2_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C2 STB0 valid bits not contiguous");
            end

            spc2_j = 0;
            for(spc2_i=0; spc2_i<7; spc2_i=spc2_i+1) begin
                if(spc2_stb1_valid[spc2_i+1] != spc2_stb1_valid[spc2_i]) begin
                    spc2_j = spc2_j + 1;
                end
            end
            if(spc2_j > 2) begin
                $display("@%d Bug 7117: Error: C2 STB1 valid bits not contiguous: %b", $time, spc2_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C2 STB1 valid bits not contiguous");
            end

            spc2_j = 0;
            for(spc2_i=0; spc2_i<7; spc2_i=spc2_i+1) begin
                if(spc2_stb2_valid[spc2_i+1] != spc2_stb2_valid[spc2_i]) begin
                    spc2_j = spc2_j + 1;
                end
            end
            if(spc2_j > 2) begin
                $display("@%d Bug 7117: Error: C2 STB2 valid bits not contiguous: %b", $time, spc2_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C2 STB2 valid bits not contiguous");
            end

            spc2_j = 0;
            for(spc2_i=0; spc2_i<7; spc2_i=spc2_i+1) begin
                if(spc2_stb3_valid[spc2_i+1] != spc2_stb3_valid[spc2_i]) begin
                    spc2_j = spc2_j + 1;
                end
            end
            if(spc2_j > 2) begin
                $display("@%d Bug 7117: Error: C2 STB3 valid bits not contiguous: %b", $time, spc2_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C2 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE2.sparc0.lsu.stb_ctl0.rst_l &
                ~spc2_flshinst0_rst_d1 &
                ~(`SPARC_CORE2.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc2_stb0_valid & `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C2 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc2_stb0_valid, `SPARC_CORE2.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C2 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE2.sparc0.lsu.stb_ctl1.rst_l &
                ~spc2_flshinst1_rst_d1 &
                ~(`SPARC_CORE2.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc2_stb1_valid & `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C2 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc2_stb1_valid, `SPARC_CORE2.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C2 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE2.sparc0.lsu.stb_ctl2.rst_l &
                ~spc2_flshinst2_rst_d1 &
                ~(`SPARC_CORE2.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc2_stb2_valid & `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C2 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc2_stb2_valid, `SPARC_CORE2.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C2 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE2.sparc0.lsu.stb_ctl3.rst_l &
                ~spc2_flshinst3_rst_d1 &
                ~(`SPARC_CORE2.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc2_stb3_valid & `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C2 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc2_stb3_valid, `SPARC_CORE2.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C2 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc2_st0_rd_advance_d1 & spc2_st0_rd_advance) begin
                $display("@%d Bug 7117: C2T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc2_st0_rd_advance_d2 & spc2_st0_rd_advance) begin
                $display("@%d Bug 7117: C2T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc2_st0_rd_advance_d3 & spc2_st0_rd_advance) begin
                $display("@%d Bug 7117: C2T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc2_st0_rd_advance_d4 & spc2_st0_rd_advance) begin
                $display("@%d Bug 7117: C2T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc2_st1_rd_advance_d1 & spc2_st1_rd_advance) begin
                $display("@%d Bug 7117: C2T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc2_st1_rd_advance_d2 & spc2_st1_rd_advance) begin
                $display("@%d Bug 7117: C2T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc2_st1_rd_advance_d3 & spc2_st1_rd_advance) begin
                $display("@%d Bug 7117: C2T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc2_st1_rd_advance_d4 & spc2_st1_rd_advance) begin
                $display("@%d Bug 7117: C2T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc2_st2_rd_advance_d1 & spc2_st2_rd_advance) begin
                $display("@%d Bug 7117: C2T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc2_st2_rd_advance_d2 & spc2_st2_rd_advance) begin
                $display("@%d Bug 7117: C2T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc2_st2_rd_advance_d3 & spc2_st2_rd_advance) begin
                $display("@%d Bug 7117: C2T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc2_st2_rd_advance_d4 & spc2_st2_rd_advance) begin
                $display("@%d Bug 7117: C2T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc2_st3_rd_advance_d1 & spc2_st3_rd_advance) begin
                $display("@%d Bug 7117: C2T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc2_st3_rd_advance_d2 & spc2_st3_rd_advance) begin
                $display("@%d Bug 7117: C2T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc2_st3_rd_advance_d3 & spc2_st3_rd_advance) begin
                $display("@%d Bug 7117: C2T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc2_st3_rd_advance_d4 & spc2_st3_rd_advance) begin
                $display("@%d Bug 7117: C2T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (2 = 0; 2 < 8; 2++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC3
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc3_ifu_lsu_pcxreq_d	= `SPARC_CORE3.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc3_ifu_lsu_pcxpkt_e	= `SPARC_CORE3.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc3_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE3.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc3_ifu_lsu_pcxreq_e;
wire		spc3_ifu_lsu_pcxreq_rise_d;
reg		spc3_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc3_ifu_lsu_pcxpkt;
reg		spc3_ifu_lsu_pcxreq_check;
wire		spc3_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc3_ifu_lsu_pcxreq_e <= spc3_ifu_lsu_pcxreq_d;

assign	spc3_ifu_lsu_pcxreq_rise_d = spc3_ifu_lsu_pcxreq_d & ~spc3_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc3_ifu_lsu_pcxreq_rise_e <= spc3_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc3_ifu_lsu_pcxreq_rise_e)
		spc3_ifu_lsu_pcxpkt <= spc3_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc3_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc3_ifu_lsu_pcxreq_rise_d)
		spc3_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc3_lsu_ifu_pcxpkt_ack_d)
		spc3_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc3_ifu_lsu_pcxreq_check_error = spc3_ifu_lsu_pcxreq_check & ~spc3_ifu_lsu_pcxreq_rise_e & (spc3_ifu_lsu_pcxpkt_e != spc3_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc3_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 3 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc3_tlu_lsu_pcxpkt		= `SPARC_CORE3.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc3_lsu_tlu_pcxpkt_ack	= `SPARC_CORE3.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc3_tlu_lsu_pcxpkt_b25_d1;
wire		spc3_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc3_tlu_lsu_pcxpkt_saved;
reg		spc3_tlu_lsu_pcxpkt_check;
wire		spc3_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc3_tlu_lsu_pcxpkt_b25_d1 <= spc3_tlu_lsu_pcxpkt[25];

assign	spc3_tlu_lsu_pcxpkt_rise = spc3_tlu_lsu_pcxpkt[25] & ~spc3_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc3_tlu_lsu_pcxpkt_rise)
		spc3_tlu_lsu_pcxpkt_saved <= spc3_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc3_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc3_tlu_lsu_pcxpkt_rise)
		spc3_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc3_lsu_tlu_pcxpkt_ack)
		spc3_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc3_tlu_lsu_pcxpkt_check_error = spc3_tlu_lsu_pcxpkt_check & (spc3_tlu_lsu_pcxpkt != spc3_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc3_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 3 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc3_spu_lsu_ldst_pckt	= `SPARC_CORE3.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc3_lsu_spu_ldst_ack	= `SPARC_CORE3.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc3_spu_lsu_ldst_pckt_b123_d1;
wire			spc3_spu_lsu_ldst_pckt_rise;
reg			spc3_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc3_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc3_spu_lsu_ldst_pckt_saved;
reg			spc3_spu_lsu_ldst_pckt_check;
wire			spc3_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc3_spu_lsu_ldst_pckt_b123_d1 <= spc3_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc3_spu_lsu_ldst_pckt_rise = spc3_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc3_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc3_spu_lsu_ldst_pckt_rise_d1 <= spc3_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc3_spu_lsu_ldst_pckt_rise)
		spc3_spu_lsu_ldst_pckt_b71b70_saved <= spc3_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc3_spu_lsu_ldst_pckt_rise_d1)
		spc3_spu_lsu_ldst_pckt_saved <= spc3_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc3_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc3_spu_lsu_ldst_pckt_rise)
		spc3_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc3_lsu_spu_ldst_ack)
		spc3_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc3_spu_lsu_ldst_pckt_check_error = spc3_spu_lsu_ldst_pckt_check &
		((!spc3_spu_lsu_ldst_pckt_rise_d1 & (spc3_spu_lsu_ldst_pckt != spc3_spu_lsu_ldst_pckt_saved)) |
		 (spc3_spu_lsu_ldst_pckt[71:70] != spc3_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc3_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 3 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc3_ffu_lsu_fpop_rq_vld	= `SPARC_CORE3.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc3_ffu_lsu_data		= `SPARC_CORE3.sparc0.lsu.ffu_lsu_data;
wire		spc3_lsu_ffu_ack		= `SPARC_CORE3.sparc0.lsu.lsu_ffu_ack;

reg		spc3_ffu_lsu_fpop_rq_vld_d1;
wire		spc3_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc3_ffu_lsu_data_saved;
reg		spc3_ffu_lsu_fpop_rq_vld_check;
wire		spc3_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc3_ffu_lsu_fpop_rq_vld_d1 <= spc3_ffu_lsu_fpop_rq_vld;

assign	spc3_ffu_lsu_fpop_rq_vld_rise = spc3_ffu_lsu_fpop_rq_vld & ~spc3_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc3_ffu_lsu_fpop_rq_vld_rise)
		spc3_ffu_lsu_data_saved <= spc3_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc3_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc3_ffu_lsu_fpop_rq_vld_rise)
		spc3_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc3_lsu_ffu_ack)
		spc3_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc3_ffu_lsu_fpop_rq_vld_check_error = spc3_ffu_lsu_fpop_rq_vld_check & (spc3_ffu_lsu_data != spc3_ffu_lsu_data_saved) | (spc3_ffu_lsu_fpop_rq_vld_rise & !spc3_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc3_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 3 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc3_spc_pcx_req_pq		= `SPARC_CORE3.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc3_spc_pcx_data_pa		= `SPARC_CORE3.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc3_spc_pcx_req_pa;
wire			spc3_spc_pcx_req_fp1;
wire			spc3_spc_pcx_req_fp2;
reg			spc3_spc_pcx_req_fp1_d1;
wire 			spc3_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc3_spc_pcx_req_pa <= spc3_spc_pcx_req_pq;

assign	spc3_spc_pcx_req_fp1 = (|spc3_spc_pcx_req_pa) & (spc3_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc3_spc_pcx_req_fp2 = spc3_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc3_spc_pcx_req_fp1_d1 <= spc3_spc_pcx_req_fp1;

assign	spc3_spc_pcx_req_fp_b2b_error = spc3_spc_pcx_req_fp1_d1 != spc3_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc3_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 3 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc3_ld_sec_hit_l2access_w2 = `SPARC_CORE3.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc3_ld0_pkt_vld_tmp  = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc3_ld0_pkt_vld_tmp_d;

   wire spc3_ld0_inst_vld_w2  = `SPARC_CORE3.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc3_ld0_is_sec_w2 = spc3_ld0_inst_vld_w2 ? spc3_ld_sec_hit_l2access_w2 : 0;


   wire spc3_ld1_pkt_vld_tmp  = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc3_ld1_pkt_vld_tmp_d;

   wire spc3_ld1_inst_vld_w2  = `SPARC_CORE3.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc3_ld1_is_sec_w2 = spc3_ld1_inst_vld_w2 ? spc3_ld_sec_hit_l2access_w2 : 0;


   wire spc3_ld2_pkt_vld_tmp  = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc3_ld2_pkt_vld_tmp_d;

   wire spc3_ld2_inst_vld_w2  = `SPARC_CORE3.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc3_ld2_is_sec_w2 = spc3_ld2_inst_vld_w2 ? spc3_ld_sec_hit_l2access_w2 : 0;


   wire spc3_ld3_pkt_vld_tmp  = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc3_ld3_pkt_vld_tmp_d;

   wire spc3_ld3_inst_vld_w2  = `SPARC_CORE3.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc3_ld3_is_sec_w2 = spc3_ld3_inst_vld_w2 ? spc3_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc3_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc3_ld0_pkt_vld_tmp;
   spc3_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc3_ld1_pkt_vld_tmp;
   spc3_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc3_ld2_pkt_vld_tmp;
   spc3_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc3_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc3_l2      = `SPARC_CORE3.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc3_unc     = `SPARC_CORE3.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc3_fpld    = `SPARC_CORE3.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc3_fpldst  = `SPARC_CORE3.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc3_unflush = `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc3_ldw     = `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc3_byp     = `SPARC_CORE3.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc3_flsh    = `SPARC_CORE3.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc3_chm     = `SPARC_CORE3.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc3_ldxa    = `SPARC_CORE3.sparc0.lsu.dctl.ldxa_internal ;
wire        spc3_ato     = `SPARC_CORE3.sparc0.lsu.dctl.atomic_g ;
wire        spc3_pref    = `SPARC_CORE3.sparc0.lsu.dctl.pref_inst_g ;
wire        spc3_chit    = `SPARC_CORE3.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc3_dcp     = `SPARC_CORE3.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc3_dtp     = `SPARC_CORE3.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc3_mpu     = `SPARC_CORE3.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc3_exu_und;
reg  [ 4:0] spc3_exu;
reg spc3_flsh_g;
always @(posedge clk)
begin
  spc3_flsh_g <= `SPARC_CORE3.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc3_byp_g;
always @(posedge clk)
begin
  spc3_byp_g <= `SPARC_CORE3.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc3_exu_und = {
//spc3_l2,
//  spc3_unc,
  spc3_fpld,
  spc3_fpldst,
  spc3_unflush,
//spc3_ldw,
  spc3_byp_g,
  spc3_flsh_g,
//spc3_chm,
  spc3_ldxa,
  spc3_ato,
  spc3_pref,
  spc3_chit,
//spc3_dcp,
  spc3_dtp,
  spc3_mpu
};

always @(spc3_exu_und)
begin
  case (spc3_exu_und)
    16'h0000 : spc3_exu =  5'h00;
    16'h0101 : spc3_exu =  5'h01;
    16'h0102 : spc3_exu =  5'h02;
    16'h0104 : spc3_exu =  5'h03;
    16'h0008 : spc3_exu =  5'h04;
    16'h0110 : spc3_exu =  5'h05;
    16'h0120 : spc3_exu =  5'h06;
    16'h0040 : spc3_exu =  5'h07;
    16'h0080 : spc3_exu =  5'h08;
    16'h0100 : spc3_exu =  5'h09;
    16'h0200 : spc3_exu =  5'h0a;
    16'h0400 : spc3_exu =  5'h0b;
    //16'h0800 : spc3_exu =  5'h0c;
    default  : spc3_exu =  5'h0c;

//  16'h1000 : spc3_exu =  5'h0d;
//  16'h2000 : spc3_exu =  5'h0e;
//  16'h4000 : spc3_exu =  5'h0f;
//  16'h8000 : spc3_exu =  5'h10;
//  default  : spc3_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc3_exp_wtchpt_trp_g             = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc3_exp_misalign_addr_ldst_atm_m = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc3_exp_priv_violtn_g            = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc3_exp_daccess_prot_g           = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc3_exp_priv_action_g            = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc3_exp_spec_access_epage_g      = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc3_exp_uncache_atomic_g         = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc3_exp_illegal_asi_action_g     = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc3_exp_flt_ld_nfo_pg_g          = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc3_exp_tlb_data_ue              = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc3_exp_tlb_tag_ue               = `SPARC_CORE3.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc3_exp_unc                      = `SPARC_CORE3.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc3_exp_und;
reg  [ 3:0] spc3_exp;

assign spc3_exp_und = {
  spc3_exp_wtchpt_trp_g,
  spc3_exp_misalign_addr_ldst_atm_m,
  spc3_exp_priv_violtn_g,
  spc3_exp_daccess_prot_g,
  spc3_exp_priv_action_g,
  spc3_exp_spec_access_epage_g,
  spc3_exp_uncache_atomic_g,
  spc3_exp_illegal_asi_action_g,
  spc3_exp_flt_ld_nfo_pg_g,
  spc3_exp_tlb_data_ue,
  spc3_exp_tlb_tag_ue,
  spc3_exp_unc
};

always @(spc3_exp_und)
begin
  case (spc3_exp_und)
    12'h000 : spc3_exp =  4'h0;
    12'h001 : spc3_exp =  4'h1;
    12'h002 : spc3_exp =  4'h2;
    12'h004 : spc3_exp =  4'h3;
    12'h008 : spc3_exp =  4'h4;
    12'h010 : spc3_exp =  4'h5;
    12'h020 : spc3_exp =  4'h6;
    12'h040 : spc3_exp =  4'h7;
    12'h080 : spc3_exp =  4'h8;
    12'h100 : spc3_exp =  4'h9;
    12'h200 : spc3_exp =  4'ha;
    12'h400 : spc3_exp =  4'hb;
    12'h800 : spc3_exp =  4'hc;
    default : spc3_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc3_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc3_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE3.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc3_lsu_ld_hit_wb;

assign  spc3_lsu_ld_hit_wb   =
((|`SPARC_CORE3.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE3.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE3.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE3.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE3.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE3.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE3.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE3.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE3.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE3.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE3.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE3.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE3.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc3_lsu_bld_vld_w2;
reg spc3_lsu_bld_hit_w2;
reg spc3_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc3_lsu_bld_vld_w2 <= `SPARC_CORE3.sparc0.lsu.qctl1.bld_g ;
  spc3_lsu_bld_hit_w2 <= spc3_lsu_ld_hit_wb ;
  spc3_lsu_bld_raw_w2 <= `SPARC_CORE3.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE3.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE3.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE3.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE3.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE3.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE3.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE3.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE3.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE3.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE3.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc3_phy_byp_ec_asi_e;
reg spc3_phy_use_ec_asi_e;
reg spc3_quad_ldd_real_e;
reg spc3_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc3_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE3.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc3_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE3.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc3_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE3.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc3_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE3.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc3_pscxt_ldxa_illgl_va_decode;
wire spc3_lsuctl_illgl_va_decode;
wire spc3_mrgnctl_illgl_va_decode;
wire spc3_asi42_illgl_va_decode;

assign spc3_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE3.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc3_lsuctl_illgl_va_decode     = (`SPARC_CORE3.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc3_mrgnctl_illgl_va_decode    = (`SPARC_CORE3.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc3_asi42_illgl_va_decode      =  `SPARC_CORE3.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc3_l2_ld_return_error = `SPARC_CORE3.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE3.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc3_l2_ld_return_error) begin
//    $display("Error @%d : sparc 3 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc3_io_ld_return_error = `SPARC_CORE3.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE3.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc3_io_ld_return_error) begin
    $display("Error @%d : sparc 3 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc3t0_dec_rptr_pcx_noced;

assign  spc3t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE3.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc3t1_dec_rptr_pcx_noced;

assign  spc3t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE3.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc3t2_dec_rptr_pcx_noced;

assign  spc3t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE3.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc3t3_dec_rptr_pcx_noced;

assign  spc3t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE3.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc3_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc3_stb_cam_cm_tid_d1 <= `SPARC_CORE3.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc3_stb_cam_hit_ptr_dec;
assign spc3_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE3.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc3t0_st_dq1_ld_hit;
assign spc3t0_st_dq1_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl0.dqptr_d1 & spc3_stb_cam_hit_ptr_dec);

wire [7:0] spc3t0_st_dq2_ld_hit;
assign spc3t0_st_dq2_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl0.dqptr_d2 & spc3_stb_cam_hit_ptr_dec);


wire [7:0] spc3t1_st_dq1_ld_hit;
assign spc3t1_st_dq1_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl1.dqptr_d1 & spc3_stb_cam_hit_ptr_dec);

wire [7:0] spc3t1_st_dq2_ld_hit;
assign spc3t1_st_dq2_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl1.dqptr_d2 & spc3_stb_cam_hit_ptr_dec);


wire [7:0] spc3t2_st_dq1_ld_hit;
assign spc3t2_st_dq1_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl2.dqptr_d1 & spc3_stb_cam_hit_ptr_dec);

wire [7:0] spc3t2_st_dq2_ld_hit;
assign spc3t2_st_dq2_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl2.dqptr_d2 & spc3_stb_cam_hit_ptr_dec);


wire [7:0] spc3t3_st_dq1_ld_hit;
assign spc3t3_st_dq1_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl3.dqptr_d1 & spc3_stb_cam_hit_ptr_dec);

wire [7:0] spc3t3_st_dq2_ld_hit;
assign spc3t3_st_dq2_ld_hit =
{8{(`SPARC_CORE3.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE3.sparc0.lsu.stb_cam_hit) &
	(spc3_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE3.sparc0.lsu.stb_ctl3.dqptr_d2 & spc3_stb_cam_hit_ptr_dec);


wire spc3_st_atm_blkst_vld;
assign spc3_st_atm_blkst_vld =
((`SPARC_CORE3.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE3.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE3.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE3.sparc0.lsu.stb_rwctl.blkst_m;

reg spc3_qctl1_casa_w2;
reg spc3_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc3_qctl1_casa_w2 <= `SPARC_CORE3.sparc0.lsu.qctl1.casa_g;
  spc3_stb_cam_vld_w <= `SPARC_CORE3.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc3_bw_r_scm_error;
assign spc3_bw_r_scm_error =
((spc3_stb_cam_vld_w
  &  `SPARC_CORE3.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE3.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE3.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE3.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE3.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE3.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE3.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE3.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE3.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE3.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc3_bw_r_scm_error) begin
		$display("Error @%d : sparc3 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc3_tte_data_perror_unc_wo_vld;
assign spc3_tte_data_perror_unc_wo_vld =
  `SPARC_CORE3.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE3.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE3.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE3.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE3.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc3_tte_data_perror_unc_w_flush;
assign spc3_tte_data_perror_unc_w_flush =
  `SPARC_CORE3.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE3.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE3.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE3.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE3.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE3.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc3_lsu_dcache_tag_perror_g_w_blkasi;
assign spc3_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE3.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE3.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE3.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc3_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc3_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE3.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE3.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE3.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc3_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc3_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE3.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE3.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE3.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE3.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc3_lsu_dcache_tag_perror_g_w_atomic;
assign spc3_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE3.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE3.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE3.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc3_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc3_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE3.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE3.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc3_lsu_dcache_data_perror_g_dtag_perror;
assign spc3_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE3.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE3.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc3_lsu_dcache_data_perror_g_w_altspace;
assign spc3_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE3.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE3.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc3_lsu_dcache_data_perror_g_w_atomic;
assign spc3_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE3.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE3.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE3.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE3.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (3 = 0; 3 < 8; 3++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc3_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc3_lsu_dtagv_wr_vld_e_d1, spc3_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc3_dva_rdaddr_10to6_d1;
wire [15:0] spc3_dva_rd_en_e;
reg  [15:0] spc3_dva_rd_en_e_d1;
wire [15:0] spc3_dva_vld_m_expanded;
reg  [4:0] spc3_dva_wraddr_10to6_d1, spc3_dva_wraddr_10to6_d2;
reg  [15:0] spc3_dva_bit_wr_en_e_d1, spc3_dva_bit_wr_en_e_d2;
reg  spc3_dva_din_e_d1, spc3_dva_din_e_d2;

wire spc3_dva_rdwr_sameline_diffvalue;
wire spc3_dva_rd_wr_sameline_diffvalue;
wire spc3_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc3_dfq_byp_ff_data_d1, spc3_dfq_byp_ff_data_d2;

// lsu_traps
reg spc3_ifu_tlu_inst_vld_w;
reg spc3_ifu_tlu_flush_w;
reg spc3_ifu_mmu_trap_w;
//reg spc3_spu_tlu_rsrv_illgl_w;
reg spc3_exu_lsu_priority_trap_w;
reg spc3_ffu_tlu_ill_inst_w;
reg spc3_ifu_tlu_immu_miss_w;
reg spc3_ifu_tlu_priv_violtn_w;
reg spc3_exu_ifu_va_oor_w;

// lsu_sechit
reg spc3_lsu_way_hit_or_w2, spc3_ncache_pcx_rq_w2;
reg  [7:0] spc3_stb_ld_partial_raw_w2, spc3_stb_ld_partial_raw_w3, spc3_stb_ld_partial_raw_w4;
reg  [7:0] spc3_stb_ld_full_raw_w2, spc3_stb_ld_full_raw_w3, spc3_stb_ld_full_raw_w4;
wire [7:0] spc3_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc3_stb_cam_rw_ptr_decode_w, spc3_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc3_stb_cam_rw_ptr_decode_w3, spc3_stb_cam_rw_ptr_decode_w4;
wire spc3_t0_ld_st_partialraw_hit;
wire spc3_t0_ld_st_fullraw_hit;
wire spc3_t0_st_ld_partialraw_hit;
wire spc3_t0_st_ld_fullraw_hit;
reg  spc3_ld0_inst_vld_w3, spc3_ld0_inst_vld_w4;
wire spc3_t1_ld_st_partialraw_hit;
wire spc3_t1_ld_st_fullraw_hit;
wire spc3_t1_st_ld_partialraw_hit;
wire spc3_t1_st_ld_fullraw_hit;
reg  spc3_ld1_inst_vld_w3, spc3_ld1_inst_vld_w4;
wire spc3_t2_ld_st_partialraw_hit;
wire spc3_t2_ld_st_fullraw_hit;
wire spc3_t2_st_ld_partialraw_hit;
wire spc3_t2_st_ld_fullraw_hit;
reg  spc3_ld2_inst_vld_w3, spc3_ld2_inst_vld_w4;
wire spc3_t3_ld_st_partialraw_hit;
wire spc3_t3_ld_st_fullraw_hit;
wire spc3_t3_st_ld_partialraw_hit;
wire spc3_t3_st_ld_fullraw_hit;
reg  spc3_ld3_inst_vld_w3, spc3_ld3_inst_vld_w4;
reg  spc3_stb_cam_mhit_w3, spc3_stb_cam_mhit_w4;
reg  spc3_io_ld_w3, spc3_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc3_pick_valid_raw, spc3_pick_status, spc3_pick_status_error;
reg  [11:0] spc3_pick_valid_raw_d1, spc3_pick_status_d1;
wire [11:0] spc3_pcx_rq_sel_d2;
reg  [11:0] spc3_pcx_rq_sel_d3;

// lsu_picker2
reg         spc3_fwdpkt_valid_raw;
reg  [3:0]  spc3_st_valid_raw;
wire        spc3_fwdpkt_valid, spc3_pcx_req_squash_d1;
wire [3:0]  spc3_st_valid;
wire [11:0] spc3_pick_valid_raw_h, spc3_pick_valid_h, spc3_pick_valid_h_ext;
reg  [11:0] spc3_pick_valid_h_d1, spc3_pick_valid_h_d2;
wire [4:0]  spc3_pre_qwr, spc3_mcycle_mask_qwr_d1;
wire [11:0] spc3_pick_destbusy_unqual, spc3_pick_atompend_unqual;
wire [11:0] spc3_pick_presented, spc3_pick_destbusy, spc3_pick_atompend;
wire [2:0]  spc3_pick_presented_count, spc3_pick_destbusy_count, spc3_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc3_ldfill_addr_w, spc3_ldinst_addr_m;
reg  [10:4] spc3_lsu_dcache_fill_addr_m, spc3_lsu_dcache_fill_addr_w;
wire        spc3_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc3_strm_stxa_g;
reg  [3:0] spc3_strm_stxa_w2, spc3_lsu_spu_stb_empty_d1;
reg        spc3_strm_stxa_state;
reg  [3:0] spc3_strm_stxa_tid_decode;


`ifdef RTL_SPARC3

    // lsu_dfq_stalls_2ormore_entries

    assign spc3_dfq_2ormore_vld_entries  = |(`SPARC_CORE3.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc3_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc3_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc3_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc3_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc3_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE3.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc3_dva_rdwr_sameline_diffvalue =
        (spc3_dva_rdaddr_10to6_d1 == spc3_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc3_dva_rd_en_e_d1 & spc3_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc3_dva_vld_m_expanded ^ {16{spc3_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc3_dva_rd_wr_sameline_diffvalue =
        (spc3_dva_rdaddr_10to6_d1 == `SPARC_CORE3.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc3_dva_rd_en_e_d1 & `SPARC_CORE3.sparc0.lsu.dva_bit_wr_en_e &
           (spc3_dva_vld_m_expanded ^ {16{`SPARC_CORE3.sparc0.lsu.dva_din_e}}) );

    assign spc3_dva_wr_rd_sameline_diffvalue =
        (spc3_dva_rdaddr_10to6_d1 == spc3_dva_wraddr_10to6_d2) &
        |( spc3_dva_rd_en_e_d1 & spc3_dva_bit_wr_en_e_d2 &
           (spc3_dva_vld_m_expanded ^ {16{spc3_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc3_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc3_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc3_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc3_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc3_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc3_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc3_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc3_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE3.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc3_t0_ld_st_partialraw_hit    = |( spc3_stb_ld_partial_raw_w4 & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t0_ld_st_fullraw_hit       = |( spc3_stb_ld_full_raw_w4    & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t0_st_ld_partialraw_hit    = |( spc3_stb_ld_partial_raw_w2 & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t0_st_ld_fullraw_hit       = |( spc3_stb_ld_full_raw_w2    & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t1_ld_st_partialraw_hit    = |( spc3_stb_ld_partial_raw_w4 & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t1_ld_st_fullraw_hit       = |( spc3_stb_ld_full_raw_w4    & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t1_st_ld_partialraw_hit    = |( spc3_stb_ld_partial_raw_w2 & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t1_st_ld_fullraw_hit       = |( spc3_stb_ld_full_raw_w2    & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t2_ld_st_partialraw_hit    = |( spc3_stb_ld_partial_raw_w4 & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t2_ld_st_fullraw_hit       = |( spc3_stb_ld_full_raw_w4    & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t2_st_ld_partialraw_hit    = |( spc3_stb_ld_partial_raw_w2 & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t2_st_ld_fullraw_hit       = |( spc3_stb_ld_full_raw_w2    & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t3_ld_st_partialraw_hit    = |( spc3_stb_ld_partial_raw_w4 & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t3_ld_st_fullraw_hit       = |( spc3_stb_ld_full_raw_w4    & spc3_stb_cam_rw_ptr_decode_w4 );
    assign spc3_t3_st_ld_partialraw_hit    = |( spc3_stb_ld_partial_raw_w2 & spc3_stb_cam_rw_ptr_decode_w2 );
    assign spc3_t3_st_ld_fullraw_hit       = |( spc3_stb_ld_full_raw_w2    & spc3_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc3_pick_valid_raw[11:0] = {`SPARC_CORE3.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE3.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE3.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc3_pick_status[11:0] = {`SPARC_CORE3.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE3.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE3.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc3_pcx_rq_sel_d2[11:0] = {`SPARC_CORE3.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc3_pick_status_error = ~spc3_pick_valid_raw & spc3_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc3_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc3_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc3_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc3_pcx_req_squash_d1 = `SPARC_CORE3.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc3_fwdpkt_valid_raw  <= 1'b0;
            spc3_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc3_fwdpkt_valid_raw <= (`SPARC_CORE3.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc3_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE3.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc3_pcx_req_squash_d1);

            spc3_st_valid_raw[3]  <= (`SPARC_CORE3.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc3_st_valid_raw[3]) &
                                        ~(`SPARC_CORE3.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc3_pcx_req_squash_d1);
            spc3_st_valid_raw[2]  <= (`SPARC_CORE3.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc3_st_valid_raw[2]) &
                                        ~(`SPARC_CORE3.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc3_pcx_req_squash_d1);
            spc3_st_valid_raw[1]  <= (`SPARC_CORE3.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc3_st_valid_raw[1]) &
                                        ~(`SPARC_CORE3.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc3_pcx_req_squash_d1);
            spc3_st_valid_raw[0]  <= (`SPARC_CORE3.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc3_st_valid_raw[0]) &
                                        ~(`SPARC_CORE3.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc3_pcx_req_squash_d1);

            spc3_pick_valid_h_d1  <= spc3_pick_valid_h;
            spc3_pick_valid_h_d2  <= spc3_pick_valid_h_d1;
        end
    end

    assign spc3_fwdpkt_valid = spc3_fwdpkt_valid_raw & |(`SPARC_CORE3.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE3.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc3_st_valid[3]  = spc3_st_valid_raw[3] & |(`SPARC_CORE3.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE3.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc3_st_valid[2]  = spc3_st_valid_raw[2] & |(`SPARC_CORE3.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE3.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc3_st_valid[1]  = spc3_st_valid_raw[1] & |(`SPARC_CORE3.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE3.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc3_st_valid[0]  = spc3_st_valid_raw[0] & |(`SPARC_CORE3.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE3.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc3_pick_valid_raw_h[11:0] = {`SPARC_CORE3.sparc0.lsu.qctl1.misc_events_raw[3:1], spc3_fwdpkt_valid_raw,
                                             spc3_st_valid_raw[3:0],
                                             `SPARC_CORE3.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc3_pick_valid_h[11:0] = {`SPARC_CORE3.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE3.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE3.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc3_fwdpkt_valid,
                                         spc3_st_valid[3:0],
                                         `SPARC_CORE3.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE3.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE3.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE3.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc3_pick_valid_h_ext[11:0] = spc3_pick_valid_h | spc3_pick_valid_h_d1 | spc3_pick_valid_h_d2;

    assign spc3_pre_qwr[4:0] = `SPARC_CORE3.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc3_pick_destbusy_unqual[11] = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[10] = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[9]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[8]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc3_pick_destbusy_unqual[7]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[6]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[5]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[4]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[3]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[2]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[1]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc3_pick_destbusy_unqual[0]  = ~|(spc3_pre_qwr[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc3_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE3.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc3_pick_atompend_unqual[11] = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[10] = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[9]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[8]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc3_pick_atompend_unqual[7]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[6]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[5]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[4]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[3]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[2]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[1]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc3_pick_atompend_unqual[0]  = ~|(~spc3_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE3.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc3_pick_presented = spc3_pick_valid_raw_h &  spc3_pick_valid_h_ext;
    assign spc3_pick_destbusy  = spc3_pick_valid_raw_h & ~spc3_pick_valid_h_ext & spc3_pick_destbusy_unqual;
    assign spc3_pick_atompend  = spc3_pick_valid_raw_h & ~spc3_pick_valid_h_ext & spc3_pick_atompend_unqual;

    count12bits C3_presented_count(
        .in  (spc3_pick_presented),
        .out (spc3_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C3_destbusy_count(
        .in  (spc3_pick_destbusy),
        .out (spc3_pick_destbusy_count)
    );
    count12bits C3_atompend_count(
        .in  (spc3_pick_atompend),
        .out (spc3_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc3_ldfill_addr_w[39:4]    = {`SPARC_CORE3.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc3_lsu_dcache_fill_addr_w[10:4]};
    assign spc3_ldinst_addr_m[39:4]    = {`SPARC_CORE3.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE3.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc3_filladdrw_eq_ldaddrm   = (spc3_ldfill_addr_w[39:4] == spc3_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc3_strm_stxa_g[3] = `SPARC_CORE3.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE3.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc3_strm_stxa_g[2] = `SPARC_CORE3.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE3.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc3_strm_stxa_g[1] = `SPARC_CORE3.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE3.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc3_strm_stxa_g[0] = `SPARC_CORE3.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE3.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE3.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc3_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE3.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc3_lsu_dtagv_wr_vld_e_d2    <= spc3_lsu_dtagv_wr_vld_e_d1;

        spc3_dva_rdaddr_10to6_d1      <= `SPARC_CORE3.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc3_dva_rd_en_e_d1           <= spc3_dva_rd_en_e;

        spc3_dva_wraddr_10to6_d1      <= `SPARC_CORE3.sparc0.lsu.dva_wr_adr_e[10:6];
        spc3_dva_wraddr_10to6_d2      <= spc3_dva_wraddr_10to6_d1;

        spc3_dva_bit_wr_en_e_d1       <= `SPARC_CORE3.sparc0.lsu.dva_bit_wr_en_e;
        spc3_dva_bit_wr_en_e_d2       <= spc3_dva_bit_wr_en_e_d1;

        spc3_dva_din_e_d1             <= `SPARC_CORE3.sparc0.lsu.dva_din_e;
        spc3_dva_din_e_d2             <= spc3_dva_din_e_d1;

        spc3_dfq_byp_ff_data_d1       <= `SPARC_CORE3.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc3_dfq_byp_ff_data_d2       <= spc3_dfq_byp_ff_data_d1;

        spc3_ifu_tlu_inst_vld_w       <= `SPARC_CORE3.sparc0.ifu_tlu_inst_vld_m;
        spc3_ifu_tlu_flush_w          <= `SPARC_CORE3.sparc0.ifu_tlu_flush_m;
        spc3_ifu_mmu_trap_w           <= `SPARC_CORE3.sparc0.ifu_mmu_trap_m;
//        spc3_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE3.sparc0.spu_tlu_rsrv_illgl_m;
        spc3_exu_lsu_priority_trap_w  <= `SPARC_CORE3.sparc0.exu_lsu_priority_trap_m;
        spc3_ffu_tlu_ill_inst_w       <= `SPARC_CORE3.sparc0.ffu_tlu_ill_inst_m;
        spc3_ifu_tlu_immu_miss_w      <= `SPARC_CORE3.sparc0.ifu_tlu_immu_miss_m;
        spc3_ifu_tlu_priv_violtn_w    <= `SPARC_CORE3.sparc0.ifu_tlu_priv_violtn_m;
        spc3_exu_ifu_va_oor_w         <= `SPARC_CORE3.sparc0.exu_ifu_va_oor_m;

        spc3_lsu_way_hit_or_w2        <= `SPARC_CORE3.sparc0.lsu.dctl.lsu_way_hit_or;
        spc3_ncache_pcx_rq_w2         <= `SPARC_CORE3.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc3_stb_ld_partial_raw_w2    <= `SPARC_CORE3.sparc0.lsu.stb_ld_partial_raw;
        spc3_stb_ld_partial_raw_w3    <= spc3_stb_ld_partial_raw_w2;
        spc3_stb_ld_partial_raw_w4    <= spc3_stb_ld_partial_raw_w3;
        spc3_stb_ld_full_raw_w2       <= `SPARC_CORE3.sparc0.lsu.stb_ld_full_raw;
        spc3_stb_ld_full_raw_w3       <= spc3_stb_ld_full_raw_w2;
        spc3_stb_ld_full_raw_w4       <= spc3_stb_ld_full_raw_w3;
        spc3_stb_cam_rw_ptr_decode_w  <= spc3_stb_cam_rw_ptr_decode_m;
        spc3_stb_cam_rw_ptr_decode_w2 <= spc3_stb_cam_rw_ptr_decode_w;
        spc3_stb_cam_rw_ptr_decode_w3 <= spc3_stb_cam_rw_ptr_decode_w2;
        spc3_stb_cam_rw_ptr_decode_w4 <= spc3_stb_cam_rw_ptr_decode_w3;
        spc3_ld0_inst_vld_w3       <= `SPARC_CORE3.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc3_ld0_inst_vld_w4       <= spc3_ld0_inst_vld_w3;
        spc3_ld1_inst_vld_w3       <= `SPARC_CORE3.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc3_ld1_inst_vld_w4       <= spc3_ld1_inst_vld_w3;
        spc3_ld2_inst_vld_w3       <= `SPARC_CORE3.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc3_ld2_inst_vld_w4       <= spc3_ld2_inst_vld_w3;
        spc3_ld3_inst_vld_w3       <= `SPARC_CORE3.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc3_ld3_inst_vld_w4       <= spc3_ld3_inst_vld_w3;
        spc3_stb_cam_mhit_w3          <= `SPARC_CORE3.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc3_stb_cam_mhit_w4          <= spc3_stb_cam_mhit_w3;
        spc3_io_ld_w3                 <= `SPARC_CORE3.sparc0.lsu.qctl1.io_ld_w2;
        spc3_io_ld_w4                 <= spc3_io_ld_w3;

        spc3_pick_valid_raw_d1        <= spc3_pick_valid_raw;
        spc3_pick_status_d1           <= spc3_pick_status;
        spc3_pcx_rq_sel_d3            <= spc3_pcx_rq_sel_d2;

        spc3_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE3.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc3_lsu_dcache_fill_addr_w[10:4] <= spc3_lsu_dcache_fill_addr_m[10:4];

        spc3_strm_stxa_w2             <= spc3_strm_stxa_g;
        spc3_lsu_spu_stb_empty_d1     <= `SPARC_CORE3.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc3_pick_status_error ) begin
          $display("Error @%d : sparc 3 pick_status not set properly: %b", $time, spc3_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc3_pick_valid_raw_d1 & ~spc3_pick_status_d1) & |spc3_pick_status ) begin
          $display("Error @%d : sparc 3 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc3_pick_status & spc3_pick_status_d1) & |spc3_pick_status ) begin
          $display("Error @%d : sparc 3 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc3_strm_stxa_state      <= 1'b0;
            spc3_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc3_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc3_strm_stxa_w2 & ~spc3_lsu_spu_stb_empty_d1) ) begin
                    spc3_strm_stxa_state      <= 1'b1;
                    spc3_strm_stxa_tid_decode <= spc3_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE3.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc3_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE3.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc3_strm_stxa_tid_decode[3] | spc3_strm_stxa_tid_decode[2]),
                             (spc3_strm_stxa_tid_decode[3] | spc3_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 3 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc3_strm_stxa_tid_decode = spc3_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc3_strm_stxa_tid_decode & ~spc3_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 3 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE3.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc3_strm_stxa_tid_decode[3] | spc3_strm_stxa_tid_decode[2]),
                             (spc3_strm_stxa_tid_decode[3] | spc3_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 3 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc3_strm_stxa_state      = 1'b0;
                        spc3_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C3 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C3 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C3 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C3 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C3 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE3.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C3 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE3.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C3 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C3 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C3 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C3 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C3 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE3.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C3 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C3 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C3 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C3 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE3.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C3 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc3_i, spc3_j;
    wire [7:0] spc3_stb0_valid, spc3_stb1_valid, spc3_stb2_valid, spc3_stb3_valid;

    assign spc3_stb0_valid[7:0] = `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc3_stb1_valid[7:0] = `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc3_stb2_valid[7:0] = `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc3_stb3_valid[7:0] = `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc3_st0_rd_advance, spc3_st1_rd_advance, spc3_st2_rd_advance, spc3_st3_rd_advance;
    reg spc3_flshinst0_rst_d1, spc3_flshinst1_rst_d1, spc3_flshinst2_rst_d1, spc3_flshinst3_rst_d1;
    reg spc3_st0_rd_advance_d1, spc3_st1_rd_advance_d1, spc3_st2_rd_advance_d1, spc3_st3_rd_advance_d1;
    reg spc3_st0_rd_advance_d2, spc3_st1_rd_advance_d2, spc3_st2_rd_advance_d2, spc3_st3_rd_advance_d2;
    reg spc3_st0_rd_advance_d3, spc3_st1_rd_advance_d3, spc3_st2_rd_advance_d3, spc3_st3_rd_advance_d3;
    reg spc3_st0_rd_advance_d4, spc3_st1_rd_advance_d4, spc3_st2_rd_advance_d4, spc3_st3_rd_advance_d4;

/***************************
    assign spc3_st0_rd_advance =  `SPARC_CORE3.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE3.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc3_st1_rd_advance =  `SPARC_CORE3.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE3.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc3_st2_rd_advance =  `SPARC_CORE3.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE3.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc3_st3_rd_advance =  `SPARC_CORE3.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE3.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE3.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE3.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc3_st0_rd_advance =  `SPARC_CORE3.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc3_st1_rd_advance =  `SPARC_CORE3.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc3_st2_rd_advance =  `SPARC_CORE3.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc3_st3_rd_advance =  `SPARC_CORE3.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc3_flshinst0_rst_d1  <= 1'b0;
            spc3_st0_rd_advance_d1 <= 1'b0;
            spc3_st0_rd_advance_d2 <= 1'b0;
            spc3_st0_rd_advance_d3 <= 1'b0;
            spc3_st0_rd_advance_d4 <= 1'b0;

            spc3_flshinst1_rst_d1  <= 1'b0;
            spc3_st1_rd_advance_d1 <= 1'b0;
            spc3_st1_rd_advance_d2 <= 1'b0;
            spc3_st1_rd_advance_d3 <= 1'b0;
            spc3_st1_rd_advance_d4 <= 1'b0;

            spc3_flshinst2_rst_d1  <= 1'b0;
            spc3_st2_rd_advance_d1 <= 1'b0;
            spc3_st2_rd_advance_d2 <= 1'b0;
            spc3_st2_rd_advance_d3 <= 1'b0;
            spc3_st2_rd_advance_d4 <= 1'b0;

            spc3_flshinst3_rst_d1  <= 1'b0;
            spc3_st3_rd_advance_d1 <= 1'b0;
            spc3_st3_rd_advance_d2 <= 1'b0;
            spc3_st3_rd_advance_d3 <= 1'b0;
            spc3_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc3_flshinst0_rst_d1  <= `SPARC_CORE3.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc3_st0_rd_advance_d1 <= spc3_st0_rd_advance;
            spc3_st0_rd_advance_d2 <= spc3_st0_rd_advance_d1;
            spc3_st0_rd_advance_d3 <= spc3_st0_rd_advance_d2;
            spc3_st0_rd_advance_d4 <= spc3_st0_rd_advance_d3;

            spc3_flshinst1_rst_d1  <= `SPARC_CORE3.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc3_st1_rd_advance_d1 <= spc3_st1_rd_advance;
            spc3_st1_rd_advance_d2 <= spc3_st1_rd_advance_d1;
            spc3_st1_rd_advance_d3 <= spc3_st1_rd_advance_d2;
            spc3_st1_rd_advance_d4 <= spc3_st1_rd_advance_d3;

            spc3_flshinst2_rst_d1  <= `SPARC_CORE3.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc3_st2_rd_advance_d1 <= spc3_st2_rd_advance;
            spc3_st2_rd_advance_d2 <= spc3_st2_rd_advance_d1;
            spc3_st2_rd_advance_d3 <= spc3_st2_rd_advance_d2;
            spc3_st2_rd_advance_d4 <= spc3_st2_rd_advance_d3;

            spc3_flshinst3_rst_d1  <= `SPARC_CORE3.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc3_st3_rd_advance_d1 <= spc3_st3_rd_advance;
            spc3_st3_rd_advance_d2 <= spc3_st3_rd_advance_d1;
            spc3_st3_rd_advance_d3 <= spc3_st3_rd_advance_d2;
            spc3_st3_rd_advance_d4 <= spc3_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc3_j = 0;
            for(spc3_i=0; spc3_i<7; spc3_i=spc3_i+1) begin
                if(spc3_stb0_valid[spc3_i+1] != spc3_stb0_valid[spc3_i]) begin
                    spc3_j = spc3_j + 1;
                end
            end
            if(spc3_j > 2) begin
                $display("@%d Bug 7117: Error: C3 STB0 valid bits not contiguous: %b", $time, spc3_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C3 STB0 valid bits not contiguous");
            end

            spc3_j = 0;
            for(spc3_i=0; spc3_i<7; spc3_i=spc3_i+1) begin
                if(spc3_stb1_valid[spc3_i+1] != spc3_stb1_valid[spc3_i]) begin
                    spc3_j = spc3_j + 1;
                end
            end
            if(spc3_j > 2) begin
                $display("@%d Bug 7117: Error: C3 STB1 valid bits not contiguous: %b", $time, spc3_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C3 STB1 valid bits not contiguous");
            end

            spc3_j = 0;
            for(spc3_i=0; spc3_i<7; spc3_i=spc3_i+1) begin
                if(spc3_stb2_valid[spc3_i+1] != spc3_stb2_valid[spc3_i]) begin
                    spc3_j = spc3_j + 1;
                end
            end
            if(spc3_j > 2) begin
                $display("@%d Bug 7117: Error: C3 STB2 valid bits not contiguous: %b", $time, spc3_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C3 STB2 valid bits not contiguous");
            end

            spc3_j = 0;
            for(spc3_i=0; spc3_i<7; spc3_i=spc3_i+1) begin
                if(spc3_stb3_valid[spc3_i+1] != spc3_stb3_valid[spc3_i]) begin
                    spc3_j = spc3_j + 1;
                end
            end
            if(spc3_j > 2) begin
                $display("@%d Bug 7117: Error: C3 STB3 valid bits not contiguous: %b", $time, spc3_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C3 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE3.sparc0.lsu.stb_ctl0.rst_l &
                ~spc3_flshinst0_rst_d1 &
                ~(`SPARC_CORE3.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc3_stb0_valid & `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C3 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc3_stb0_valid, `SPARC_CORE3.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C3 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE3.sparc0.lsu.stb_ctl1.rst_l &
                ~spc3_flshinst1_rst_d1 &
                ~(`SPARC_CORE3.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc3_stb1_valid & `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C3 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc3_stb1_valid, `SPARC_CORE3.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C3 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE3.sparc0.lsu.stb_ctl2.rst_l &
                ~spc3_flshinst2_rst_d1 &
                ~(`SPARC_CORE3.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc3_stb2_valid & `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C3 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc3_stb2_valid, `SPARC_CORE3.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C3 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE3.sparc0.lsu.stb_ctl3.rst_l &
                ~spc3_flshinst3_rst_d1 &
                ~(`SPARC_CORE3.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc3_stb3_valid & `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C3 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc3_stb3_valid, `SPARC_CORE3.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C3 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc3_st0_rd_advance_d1 & spc3_st0_rd_advance) begin
                $display("@%d Bug 7117: C3T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc3_st0_rd_advance_d2 & spc3_st0_rd_advance) begin
                $display("@%d Bug 7117: C3T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc3_st0_rd_advance_d3 & spc3_st0_rd_advance) begin
                $display("@%d Bug 7117: C3T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc3_st0_rd_advance_d4 & spc3_st0_rd_advance) begin
                $display("@%d Bug 7117: C3T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc3_st1_rd_advance_d1 & spc3_st1_rd_advance) begin
                $display("@%d Bug 7117: C3T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc3_st1_rd_advance_d2 & spc3_st1_rd_advance) begin
                $display("@%d Bug 7117: C3T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc3_st1_rd_advance_d3 & spc3_st1_rd_advance) begin
                $display("@%d Bug 7117: C3T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc3_st1_rd_advance_d4 & spc3_st1_rd_advance) begin
                $display("@%d Bug 7117: C3T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc3_st2_rd_advance_d1 & spc3_st2_rd_advance) begin
                $display("@%d Bug 7117: C3T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc3_st2_rd_advance_d2 & spc3_st2_rd_advance) begin
                $display("@%d Bug 7117: C3T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc3_st2_rd_advance_d3 & spc3_st2_rd_advance) begin
                $display("@%d Bug 7117: C3T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc3_st2_rd_advance_d4 & spc3_st2_rd_advance) begin
                $display("@%d Bug 7117: C3T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc3_st3_rd_advance_d1 & spc3_st3_rd_advance) begin
                $display("@%d Bug 7117: C3T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc3_st3_rd_advance_d2 & spc3_st3_rd_advance) begin
                $display("@%d Bug 7117: C3T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc3_st3_rd_advance_d3 & spc3_st3_rd_advance) begin
                $display("@%d Bug 7117: C3T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc3_st3_rd_advance_d4 & spc3_st3_rd_advance) begin
                $display("@%d Bug 7117: C3T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (3 = 0; 3 < 8; 3++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC4
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc4_ifu_lsu_pcxreq_d	= `SPARC_CORE4.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc4_ifu_lsu_pcxpkt_e	= `SPARC_CORE4.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc4_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE4.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc4_ifu_lsu_pcxreq_e;
wire		spc4_ifu_lsu_pcxreq_rise_d;
reg		spc4_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc4_ifu_lsu_pcxpkt;
reg		spc4_ifu_lsu_pcxreq_check;
wire		spc4_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc4_ifu_lsu_pcxreq_e <= spc4_ifu_lsu_pcxreq_d;

assign	spc4_ifu_lsu_pcxreq_rise_d = spc4_ifu_lsu_pcxreq_d & ~spc4_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc4_ifu_lsu_pcxreq_rise_e <= spc4_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc4_ifu_lsu_pcxreq_rise_e)
		spc4_ifu_lsu_pcxpkt <= spc4_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc4_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc4_ifu_lsu_pcxreq_rise_d)
		spc4_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc4_lsu_ifu_pcxpkt_ack_d)
		spc4_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc4_ifu_lsu_pcxreq_check_error = spc4_ifu_lsu_pcxreq_check & ~spc4_ifu_lsu_pcxreq_rise_e & (spc4_ifu_lsu_pcxpkt_e != spc4_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc4_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 4 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc4_tlu_lsu_pcxpkt		= `SPARC_CORE4.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc4_lsu_tlu_pcxpkt_ack	= `SPARC_CORE4.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc4_tlu_lsu_pcxpkt_b25_d1;
wire		spc4_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc4_tlu_lsu_pcxpkt_saved;
reg		spc4_tlu_lsu_pcxpkt_check;
wire		spc4_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc4_tlu_lsu_pcxpkt_b25_d1 <= spc4_tlu_lsu_pcxpkt[25];

assign	spc4_tlu_lsu_pcxpkt_rise = spc4_tlu_lsu_pcxpkt[25] & ~spc4_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc4_tlu_lsu_pcxpkt_rise)
		spc4_tlu_lsu_pcxpkt_saved <= spc4_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc4_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc4_tlu_lsu_pcxpkt_rise)
		spc4_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc4_lsu_tlu_pcxpkt_ack)
		spc4_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc4_tlu_lsu_pcxpkt_check_error = spc4_tlu_lsu_pcxpkt_check & (spc4_tlu_lsu_pcxpkt != spc4_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc4_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 4 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc4_spu_lsu_ldst_pckt	= `SPARC_CORE4.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc4_lsu_spu_ldst_ack	= `SPARC_CORE4.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc4_spu_lsu_ldst_pckt_b123_d1;
wire			spc4_spu_lsu_ldst_pckt_rise;
reg			spc4_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc4_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc4_spu_lsu_ldst_pckt_saved;
reg			spc4_spu_lsu_ldst_pckt_check;
wire			spc4_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc4_spu_lsu_ldst_pckt_b123_d1 <= spc4_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc4_spu_lsu_ldst_pckt_rise = spc4_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc4_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc4_spu_lsu_ldst_pckt_rise_d1 <= spc4_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc4_spu_lsu_ldst_pckt_rise)
		spc4_spu_lsu_ldst_pckt_b71b70_saved <= spc4_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc4_spu_lsu_ldst_pckt_rise_d1)
		spc4_spu_lsu_ldst_pckt_saved <= spc4_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc4_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc4_spu_lsu_ldst_pckt_rise)
		spc4_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc4_lsu_spu_ldst_ack)
		spc4_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc4_spu_lsu_ldst_pckt_check_error = spc4_spu_lsu_ldst_pckt_check &
		((!spc4_spu_lsu_ldst_pckt_rise_d1 & (spc4_spu_lsu_ldst_pckt != spc4_spu_lsu_ldst_pckt_saved)) |
		 (spc4_spu_lsu_ldst_pckt[71:70] != spc4_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc4_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 4 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc4_ffu_lsu_fpop_rq_vld	= `SPARC_CORE4.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc4_ffu_lsu_data		= `SPARC_CORE4.sparc0.lsu.ffu_lsu_data;
wire		spc4_lsu_ffu_ack		= `SPARC_CORE4.sparc0.lsu.lsu_ffu_ack;

reg		spc4_ffu_lsu_fpop_rq_vld_d1;
wire		spc4_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc4_ffu_lsu_data_saved;
reg		spc4_ffu_lsu_fpop_rq_vld_check;
wire		spc4_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc4_ffu_lsu_fpop_rq_vld_d1 <= spc4_ffu_lsu_fpop_rq_vld;

assign	spc4_ffu_lsu_fpop_rq_vld_rise = spc4_ffu_lsu_fpop_rq_vld & ~spc4_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc4_ffu_lsu_fpop_rq_vld_rise)
		spc4_ffu_lsu_data_saved <= spc4_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc4_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc4_ffu_lsu_fpop_rq_vld_rise)
		spc4_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc4_lsu_ffu_ack)
		spc4_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc4_ffu_lsu_fpop_rq_vld_check_error = spc4_ffu_lsu_fpop_rq_vld_check & (spc4_ffu_lsu_data != spc4_ffu_lsu_data_saved) | (spc4_ffu_lsu_fpop_rq_vld_rise & !spc4_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc4_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 4 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc4_spc_pcx_req_pq		= `SPARC_CORE4.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc4_spc_pcx_data_pa		= `SPARC_CORE4.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc4_spc_pcx_req_pa;
wire			spc4_spc_pcx_req_fp1;
wire			spc4_spc_pcx_req_fp2;
reg			spc4_spc_pcx_req_fp1_d1;
wire 			spc4_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc4_spc_pcx_req_pa <= spc4_spc_pcx_req_pq;

assign	spc4_spc_pcx_req_fp1 = (|spc4_spc_pcx_req_pa) & (spc4_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc4_spc_pcx_req_fp2 = spc4_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc4_spc_pcx_req_fp1_d1 <= spc4_spc_pcx_req_fp1;

assign	spc4_spc_pcx_req_fp_b2b_error = spc4_spc_pcx_req_fp1_d1 != spc4_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc4_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 4 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc4_ld_sec_hit_l2access_w2 = `SPARC_CORE4.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc4_ld0_pkt_vld_tmp  = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc4_ld0_pkt_vld_tmp_d;

   wire spc4_ld0_inst_vld_w2  = `SPARC_CORE4.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc4_ld0_is_sec_w2 = spc4_ld0_inst_vld_w2 ? spc4_ld_sec_hit_l2access_w2 : 0;


   wire spc4_ld1_pkt_vld_tmp  = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc4_ld1_pkt_vld_tmp_d;

   wire spc4_ld1_inst_vld_w2  = `SPARC_CORE4.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc4_ld1_is_sec_w2 = spc4_ld1_inst_vld_w2 ? spc4_ld_sec_hit_l2access_w2 : 0;


   wire spc4_ld2_pkt_vld_tmp  = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc4_ld2_pkt_vld_tmp_d;

   wire spc4_ld2_inst_vld_w2  = `SPARC_CORE4.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc4_ld2_is_sec_w2 = spc4_ld2_inst_vld_w2 ? spc4_ld_sec_hit_l2access_w2 : 0;


   wire spc4_ld3_pkt_vld_tmp  = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc4_ld3_pkt_vld_tmp_d;

   wire spc4_ld3_inst_vld_w2  = `SPARC_CORE4.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc4_ld3_is_sec_w2 = spc4_ld3_inst_vld_w2 ? spc4_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc4_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc4_ld0_pkt_vld_tmp;
   spc4_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc4_ld1_pkt_vld_tmp;
   spc4_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc4_ld2_pkt_vld_tmp;
   spc4_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc4_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc4_l2      = `SPARC_CORE4.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc4_unc     = `SPARC_CORE4.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc4_fpld    = `SPARC_CORE4.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc4_fpldst  = `SPARC_CORE4.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc4_unflush = `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc4_ldw     = `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc4_byp     = `SPARC_CORE4.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc4_flsh    = `SPARC_CORE4.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc4_chm     = `SPARC_CORE4.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc4_ldxa    = `SPARC_CORE4.sparc0.lsu.dctl.ldxa_internal ;
wire        spc4_ato     = `SPARC_CORE4.sparc0.lsu.dctl.atomic_g ;
wire        spc4_pref    = `SPARC_CORE4.sparc0.lsu.dctl.pref_inst_g ;
wire        spc4_chit    = `SPARC_CORE4.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc4_dcp     = `SPARC_CORE4.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc4_dtp     = `SPARC_CORE4.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc4_mpu     = `SPARC_CORE4.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc4_exu_und;
reg  [ 4:0] spc4_exu;
reg spc4_flsh_g;
always @(posedge clk)
begin
  spc4_flsh_g <= `SPARC_CORE4.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc4_byp_g;
always @(posedge clk)
begin
  spc4_byp_g <= `SPARC_CORE4.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc4_exu_und = {
//spc4_l2,
//  spc4_unc,
  spc4_fpld,
  spc4_fpldst,
  spc4_unflush,
//spc4_ldw,
  spc4_byp_g,
  spc4_flsh_g,
//spc4_chm,
  spc4_ldxa,
  spc4_ato,
  spc4_pref,
  spc4_chit,
//spc4_dcp,
  spc4_dtp,
  spc4_mpu
};

always @(spc4_exu_und)
begin
  case (spc4_exu_und)
    16'h0000 : spc4_exu =  5'h00;
    16'h0101 : spc4_exu =  5'h01;
    16'h0102 : spc4_exu =  5'h02;
    16'h0104 : spc4_exu =  5'h03;
    16'h0008 : spc4_exu =  5'h04;
    16'h0110 : spc4_exu =  5'h05;
    16'h0120 : spc4_exu =  5'h06;
    16'h0040 : spc4_exu =  5'h07;
    16'h0080 : spc4_exu =  5'h08;
    16'h0100 : spc4_exu =  5'h09;
    16'h0200 : spc4_exu =  5'h0a;
    16'h0400 : spc4_exu =  5'h0b;
    //16'h0800 : spc4_exu =  5'h0c;
    default  : spc4_exu =  5'h0c;

//  16'h1000 : spc4_exu =  5'h0d;
//  16'h2000 : spc4_exu =  5'h0e;
//  16'h4000 : spc4_exu =  5'h0f;
//  16'h8000 : spc4_exu =  5'h10;
//  default  : spc4_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc4_exp_wtchpt_trp_g             = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc4_exp_misalign_addr_ldst_atm_m = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc4_exp_priv_violtn_g            = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc4_exp_daccess_prot_g           = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc4_exp_priv_action_g            = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc4_exp_spec_access_epage_g      = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc4_exp_uncache_atomic_g         = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc4_exp_illegal_asi_action_g     = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc4_exp_flt_ld_nfo_pg_g          = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc4_exp_tlb_data_ue              = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc4_exp_tlb_tag_ue               = `SPARC_CORE4.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc4_exp_unc                      = `SPARC_CORE4.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc4_exp_und;
reg  [ 3:0] spc4_exp;

assign spc4_exp_und = {
  spc4_exp_wtchpt_trp_g,
  spc4_exp_misalign_addr_ldst_atm_m,
  spc4_exp_priv_violtn_g,
  spc4_exp_daccess_prot_g,
  spc4_exp_priv_action_g,
  spc4_exp_spec_access_epage_g,
  spc4_exp_uncache_atomic_g,
  spc4_exp_illegal_asi_action_g,
  spc4_exp_flt_ld_nfo_pg_g,
  spc4_exp_tlb_data_ue,
  spc4_exp_tlb_tag_ue,
  spc4_exp_unc
};

always @(spc4_exp_und)
begin
  case (spc4_exp_und)
    12'h000 : spc4_exp =  4'h0;
    12'h001 : spc4_exp =  4'h1;
    12'h002 : spc4_exp =  4'h2;
    12'h004 : spc4_exp =  4'h3;
    12'h008 : spc4_exp =  4'h4;
    12'h010 : spc4_exp =  4'h5;
    12'h020 : spc4_exp =  4'h6;
    12'h040 : spc4_exp =  4'h7;
    12'h080 : spc4_exp =  4'h8;
    12'h100 : spc4_exp =  4'h9;
    12'h200 : spc4_exp =  4'ha;
    12'h400 : spc4_exp =  4'hb;
    12'h800 : spc4_exp =  4'hc;
    default : spc4_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc4_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc4_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE4.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc4_lsu_ld_hit_wb;

assign  spc4_lsu_ld_hit_wb   =
((|`SPARC_CORE4.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE4.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE4.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE4.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE4.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE4.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE4.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE4.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE4.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE4.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE4.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE4.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE4.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc4_lsu_bld_vld_w2;
reg spc4_lsu_bld_hit_w2;
reg spc4_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc4_lsu_bld_vld_w2 <= `SPARC_CORE4.sparc0.lsu.qctl1.bld_g ;
  spc4_lsu_bld_hit_w2 <= spc4_lsu_ld_hit_wb ;
  spc4_lsu_bld_raw_w2 <= `SPARC_CORE4.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE4.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE4.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE4.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE4.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE4.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE4.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE4.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE4.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE4.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE4.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc4_phy_byp_ec_asi_e;
reg spc4_phy_use_ec_asi_e;
reg spc4_quad_ldd_real_e;
reg spc4_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc4_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE4.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc4_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE4.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc4_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE4.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc4_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE4.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc4_pscxt_ldxa_illgl_va_decode;
wire spc4_lsuctl_illgl_va_decode;
wire spc4_mrgnctl_illgl_va_decode;
wire spc4_asi42_illgl_va_decode;

assign spc4_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE4.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc4_lsuctl_illgl_va_decode     = (`SPARC_CORE4.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc4_mrgnctl_illgl_va_decode    = (`SPARC_CORE4.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc4_asi42_illgl_va_decode      =  `SPARC_CORE4.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc4_l2_ld_return_error = `SPARC_CORE4.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE4.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc4_l2_ld_return_error) begin
//    $display("Error @%d : sparc 4 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc4_io_ld_return_error = `SPARC_CORE4.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE4.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc4_io_ld_return_error) begin
    $display("Error @%d : sparc 4 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc4t0_dec_rptr_pcx_noced;

assign  spc4t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE4.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc4t1_dec_rptr_pcx_noced;

assign  spc4t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE4.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc4t2_dec_rptr_pcx_noced;

assign  spc4t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE4.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc4t3_dec_rptr_pcx_noced;

assign  spc4t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE4.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc4_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc4_stb_cam_cm_tid_d1 <= `SPARC_CORE4.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc4_stb_cam_hit_ptr_dec;
assign spc4_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE4.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc4t0_st_dq1_ld_hit;
assign spc4t0_st_dq1_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl0.dqptr_d1 & spc4_stb_cam_hit_ptr_dec);

wire [7:0] spc4t0_st_dq2_ld_hit;
assign spc4t0_st_dq2_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl0.dqptr_d2 & spc4_stb_cam_hit_ptr_dec);


wire [7:0] spc4t1_st_dq1_ld_hit;
assign spc4t1_st_dq1_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl1.dqptr_d1 & spc4_stb_cam_hit_ptr_dec);

wire [7:0] spc4t1_st_dq2_ld_hit;
assign spc4t1_st_dq2_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl1.dqptr_d2 & spc4_stb_cam_hit_ptr_dec);


wire [7:0] spc4t2_st_dq1_ld_hit;
assign spc4t2_st_dq1_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl2.dqptr_d1 & spc4_stb_cam_hit_ptr_dec);

wire [7:0] spc4t2_st_dq2_ld_hit;
assign spc4t2_st_dq2_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl2.dqptr_d2 & spc4_stb_cam_hit_ptr_dec);


wire [7:0] spc4t3_st_dq1_ld_hit;
assign spc4t3_st_dq1_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl3.dqptr_d1 & spc4_stb_cam_hit_ptr_dec);

wire [7:0] spc4t3_st_dq2_ld_hit;
assign spc4t3_st_dq2_ld_hit =
{8{(`SPARC_CORE4.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE4.sparc0.lsu.stb_cam_hit) &
	(spc4_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE4.sparc0.lsu.stb_ctl3.dqptr_d2 & spc4_stb_cam_hit_ptr_dec);


wire spc4_st_atm_blkst_vld;
assign spc4_st_atm_blkst_vld =
((`SPARC_CORE4.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE4.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE4.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE4.sparc0.lsu.stb_rwctl.blkst_m;

reg spc4_qctl1_casa_w2;
reg spc4_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc4_qctl1_casa_w2 <= `SPARC_CORE4.sparc0.lsu.qctl1.casa_g;
  spc4_stb_cam_vld_w <= `SPARC_CORE4.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc4_bw_r_scm_error;
assign spc4_bw_r_scm_error =
((spc4_stb_cam_vld_w
  &  `SPARC_CORE4.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE4.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE4.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE4.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE4.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE4.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE4.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE4.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE4.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE4.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc4_bw_r_scm_error) begin
		$display("Error @%d : sparc4 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc4_tte_data_perror_unc_wo_vld;
assign spc4_tte_data_perror_unc_wo_vld =
  `SPARC_CORE4.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE4.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE4.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE4.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE4.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc4_tte_data_perror_unc_w_flush;
assign spc4_tte_data_perror_unc_w_flush =
  `SPARC_CORE4.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE4.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE4.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE4.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE4.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE4.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc4_lsu_dcache_tag_perror_g_w_blkasi;
assign spc4_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE4.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE4.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE4.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc4_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc4_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE4.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE4.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE4.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc4_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc4_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE4.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE4.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE4.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE4.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc4_lsu_dcache_tag_perror_g_w_atomic;
assign spc4_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE4.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE4.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE4.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc4_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc4_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE4.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE4.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc4_lsu_dcache_data_perror_g_dtag_perror;
assign spc4_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE4.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE4.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc4_lsu_dcache_data_perror_g_w_altspace;
assign spc4_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE4.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE4.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc4_lsu_dcache_data_perror_g_w_atomic;
assign spc4_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE4.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE4.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE4.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE4.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (4 = 0; 4 < 8; 4++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc4_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc4_lsu_dtagv_wr_vld_e_d1, spc4_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc4_dva_rdaddr_10to6_d1;
wire [15:0] spc4_dva_rd_en_e;
reg  [15:0] spc4_dva_rd_en_e_d1;
wire [15:0] spc4_dva_vld_m_expanded;
reg  [4:0] spc4_dva_wraddr_10to6_d1, spc4_dva_wraddr_10to6_d2;
reg  [15:0] spc4_dva_bit_wr_en_e_d1, spc4_dva_bit_wr_en_e_d2;
reg  spc4_dva_din_e_d1, spc4_dva_din_e_d2;

wire spc4_dva_rdwr_sameline_diffvalue;
wire spc4_dva_rd_wr_sameline_diffvalue;
wire spc4_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc4_dfq_byp_ff_data_d1, spc4_dfq_byp_ff_data_d2;

// lsu_traps
reg spc4_ifu_tlu_inst_vld_w;
reg spc4_ifu_tlu_flush_w;
reg spc4_ifu_mmu_trap_w;
//reg spc4_spu_tlu_rsrv_illgl_w;
reg spc4_exu_lsu_priority_trap_w;
reg spc4_ffu_tlu_ill_inst_w;
reg spc4_ifu_tlu_immu_miss_w;
reg spc4_ifu_tlu_priv_violtn_w;
reg spc4_exu_ifu_va_oor_w;

// lsu_sechit
reg spc4_lsu_way_hit_or_w2, spc4_ncache_pcx_rq_w2;
reg  [7:0] spc4_stb_ld_partial_raw_w2, spc4_stb_ld_partial_raw_w3, spc4_stb_ld_partial_raw_w4;
reg  [7:0] spc4_stb_ld_full_raw_w2, spc4_stb_ld_full_raw_w3, spc4_stb_ld_full_raw_w4;
wire [7:0] spc4_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc4_stb_cam_rw_ptr_decode_w, spc4_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc4_stb_cam_rw_ptr_decode_w3, spc4_stb_cam_rw_ptr_decode_w4;
wire spc4_t0_ld_st_partialraw_hit;
wire spc4_t0_ld_st_fullraw_hit;
wire spc4_t0_st_ld_partialraw_hit;
wire spc4_t0_st_ld_fullraw_hit;
reg  spc4_ld0_inst_vld_w3, spc4_ld0_inst_vld_w4;
wire spc4_t1_ld_st_partialraw_hit;
wire spc4_t1_ld_st_fullraw_hit;
wire spc4_t1_st_ld_partialraw_hit;
wire spc4_t1_st_ld_fullraw_hit;
reg  spc4_ld1_inst_vld_w3, spc4_ld1_inst_vld_w4;
wire spc4_t2_ld_st_partialraw_hit;
wire spc4_t2_ld_st_fullraw_hit;
wire spc4_t2_st_ld_partialraw_hit;
wire spc4_t2_st_ld_fullraw_hit;
reg  spc4_ld2_inst_vld_w3, spc4_ld2_inst_vld_w4;
wire spc4_t3_ld_st_partialraw_hit;
wire spc4_t3_ld_st_fullraw_hit;
wire spc4_t3_st_ld_partialraw_hit;
wire spc4_t3_st_ld_fullraw_hit;
reg  spc4_ld3_inst_vld_w3, spc4_ld3_inst_vld_w4;
reg  spc4_stb_cam_mhit_w3, spc4_stb_cam_mhit_w4;
reg  spc4_io_ld_w3, spc4_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc4_pick_valid_raw, spc4_pick_status, spc4_pick_status_error;
reg  [11:0] spc4_pick_valid_raw_d1, spc4_pick_status_d1;
wire [11:0] spc4_pcx_rq_sel_d2;
reg  [11:0] spc4_pcx_rq_sel_d3;

// lsu_picker2
reg         spc4_fwdpkt_valid_raw;
reg  [3:0]  spc4_st_valid_raw;
wire        spc4_fwdpkt_valid, spc4_pcx_req_squash_d1;
wire [3:0]  spc4_st_valid;
wire [11:0] spc4_pick_valid_raw_h, spc4_pick_valid_h, spc4_pick_valid_h_ext;
reg  [11:0] spc4_pick_valid_h_d1, spc4_pick_valid_h_d2;
wire [4:0]  spc4_pre_qwr, spc4_mcycle_mask_qwr_d1;
wire [11:0] spc4_pick_destbusy_unqual, spc4_pick_atompend_unqual;
wire [11:0] spc4_pick_presented, spc4_pick_destbusy, spc4_pick_atompend;
wire [2:0]  spc4_pick_presented_count, spc4_pick_destbusy_count, spc4_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc4_ldfill_addr_w, spc4_ldinst_addr_m;
reg  [10:4] spc4_lsu_dcache_fill_addr_m, spc4_lsu_dcache_fill_addr_w;
wire        spc4_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc4_strm_stxa_g;
reg  [3:0] spc4_strm_stxa_w2, spc4_lsu_spu_stb_empty_d1;
reg        spc4_strm_stxa_state;
reg  [3:0] spc4_strm_stxa_tid_decode;


`ifdef RTL_SPARC4

    // lsu_dfq_stalls_2ormore_entries

    assign spc4_dfq_2ormore_vld_entries  = |(`SPARC_CORE4.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc4_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc4_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc4_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc4_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc4_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE4.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc4_dva_rdwr_sameline_diffvalue =
        (spc4_dva_rdaddr_10to6_d1 == spc4_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc4_dva_rd_en_e_d1 & spc4_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc4_dva_vld_m_expanded ^ {16{spc4_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc4_dva_rd_wr_sameline_diffvalue =
        (spc4_dva_rdaddr_10to6_d1 == `SPARC_CORE4.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc4_dva_rd_en_e_d1 & `SPARC_CORE4.sparc0.lsu.dva_bit_wr_en_e &
           (spc4_dva_vld_m_expanded ^ {16{`SPARC_CORE4.sparc0.lsu.dva_din_e}}) );

    assign spc4_dva_wr_rd_sameline_diffvalue =
        (spc4_dva_rdaddr_10to6_d1 == spc4_dva_wraddr_10to6_d2) &
        |( spc4_dva_rd_en_e_d1 & spc4_dva_bit_wr_en_e_d2 &
           (spc4_dva_vld_m_expanded ^ {16{spc4_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc4_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc4_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc4_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc4_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc4_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc4_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc4_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc4_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE4.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc4_t0_ld_st_partialraw_hit    = |( spc4_stb_ld_partial_raw_w4 & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t0_ld_st_fullraw_hit       = |( spc4_stb_ld_full_raw_w4    & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t0_st_ld_partialraw_hit    = |( spc4_stb_ld_partial_raw_w2 & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t0_st_ld_fullraw_hit       = |( spc4_stb_ld_full_raw_w2    & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t1_ld_st_partialraw_hit    = |( spc4_stb_ld_partial_raw_w4 & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t1_ld_st_fullraw_hit       = |( spc4_stb_ld_full_raw_w4    & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t1_st_ld_partialraw_hit    = |( spc4_stb_ld_partial_raw_w2 & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t1_st_ld_fullraw_hit       = |( spc4_stb_ld_full_raw_w2    & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t2_ld_st_partialraw_hit    = |( spc4_stb_ld_partial_raw_w4 & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t2_ld_st_fullraw_hit       = |( spc4_stb_ld_full_raw_w4    & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t2_st_ld_partialraw_hit    = |( spc4_stb_ld_partial_raw_w2 & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t2_st_ld_fullraw_hit       = |( spc4_stb_ld_full_raw_w2    & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t3_ld_st_partialraw_hit    = |( spc4_stb_ld_partial_raw_w4 & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t3_ld_st_fullraw_hit       = |( spc4_stb_ld_full_raw_w4    & spc4_stb_cam_rw_ptr_decode_w4 );
    assign spc4_t3_st_ld_partialraw_hit    = |( spc4_stb_ld_partial_raw_w2 & spc4_stb_cam_rw_ptr_decode_w2 );
    assign spc4_t3_st_ld_fullraw_hit       = |( spc4_stb_ld_full_raw_w2    & spc4_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc4_pick_valid_raw[11:0] = {`SPARC_CORE4.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE4.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE4.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc4_pick_status[11:0] = {`SPARC_CORE4.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE4.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE4.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc4_pcx_rq_sel_d2[11:0] = {`SPARC_CORE4.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc4_pick_status_error = ~spc4_pick_valid_raw & spc4_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc4_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc4_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc4_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc4_pcx_req_squash_d1 = `SPARC_CORE4.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc4_fwdpkt_valid_raw  <= 1'b0;
            spc4_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc4_fwdpkt_valid_raw <= (`SPARC_CORE4.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc4_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE4.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc4_pcx_req_squash_d1);

            spc4_st_valid_raw[3]  <= (`SPARC_CORE4.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc4_st_valid_raw[3]) &
                                        ~(`SPARC_CORE4.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc4_pcx_req_squash_d1);
            spc4_st_valid_raw[2]  <= (`SPARC_CORE4.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc4_st_valid_raw[2]) &
                                        ~(`SPARC_CORE4.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc4_pcx_req_squash_d1);
            spc4_st_valid_raw[1]  <= (`SPARC_CORE4.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc4_st_valid_raw[1]) &
                                        ~(`SPARC_CORE4.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc4_pcx_req_squash_d1);
            spc4_st_valid_raw[0]  <= (`SPARC_CORE4.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc4_st_valid_raw[0]) &
                                        ~(`SPARC_CORE4.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc4_pcx_req_squash_d1);

            spc4_pick_valid_h_d1  <= spc4_pick_valid_h;
            spc4_pick_valid_h_d2  <= spc4_pick_valid_h_d1;
        end
    end

    assign spc4_fwdpkt_valid = spc4_fwdpkt_valid_raw & |(`SPARC_CORE4.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE4.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc4_st_valid[3]  = spc4_st_valid_raw[3] & |(`SPARC_CORE4.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE4.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc4_st_valid[2]  = spc4_st_valid_raw[2] & |(`SPARC_CORE4.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE4.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc4_st_valid[1]  = spc4_st_valid_raw[1] & |(`SPARC_CORE4.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE4.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc4_st_valid[0]  = spc4_st_valid_raw[0] & |(`SPARC_CORE4.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE4.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc4_pick_valid_raw_h[11:0] = {`SPARC_CORE4.sparc0.lsu.qctl1.misc_events_raw[3:1], spc4_fwdpkt_valid_raw,
                                             spc4_st_valid_raw[3:0],
                                             `SPARC_CORE4.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc4_pick_valid_h[11:0] = {`SPARC_CORE4.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE4.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE4.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc4_fwdpkt_valid,
                                         spc4_st_valid[3:0],
                                         `SPARC_CORE4.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE4.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE4.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE4.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc4_pick_valid_h_ext[11:0] = spc4_pick_valid_h | spc4_pick_valid_h_d1 | spc4_pick_valid_h_d2;

    assign spc4_pre_qwr[4:0] = `SPARC_CORE4.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc4_pick_destbusy_unqual[11] = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[10] = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[9]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[8]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc4_pick_destbusy_unqual[7]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[6]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[5]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[4]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[3]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[2]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[1]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc4_pick_destbusy_unqual[0]  = ~|(spc4_pre_qwr[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc4_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE4.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc4_pick_atompend_unqual[11] = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[10] = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[9]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[8]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc4_pick_atompend_unqual[7]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[6]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[5]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[4]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[3]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[2]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[1]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc4_pick_atompend_unqual[0]  = ~|(~spc4_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE4.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc4_pick_presented = spc4_pick_valid_raw_h &  spc4_pick_valid_h_ext;
    assign spc4_pick_destbusy  = spc4_pick_valid_raw_h & ~spc4_pick_valid_h_ext & spc4_pick_destbusy_unqual;
    assign spc4_pick_atompend  = spc4_pick_valid_raw_h & ~spc4_pick_valid_h_ext & spc4_pick_atompend_unqual;

    count12bits C4_presented_count(
        .in  (spc4_pick_presented),
        .out (spc4_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C4_destbusy_count(
        .in  (spc4_pick_destbusy),
        .out (spc4_pick_destbusy_count)
    );
    count12bits C4_atompend_count(
        .in  (spc4_pick_atompend),
        .out (spc4_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc4_ldfill_addr_w[39:4]    = {`SPARC_CORE4.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc4_lsu_dcache_fill_addr_w[10:4]};
    assign spc4_ldinst_addr_m[39:4]    = {`SPARC_CORE4.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE4.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc4_filladdrw_eq_ldaddrm   = (spc4_ldfill_addr_w[39:4] == spc4_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc4_strm_stxa_g[3] = `SPARC_CORE4.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE4.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc4_strm_stxa_g[2] = `SPARC_CORE4.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE4.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc4_strm_stxa_g[1] = `SPARC_CORE4.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE4.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc4_strm_stxa_g[0] = `SPARC_CORE4.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE4.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE4.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc4_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE4.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc4_lsu_dtagv_wr_vld_e_d2    <= spc4_lsu_dtagv_wr_vld_e_d1;

        spc4_dva_rdaddr_10to6_d1      <= `SPARC_CORE4.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc4_dva_rd_en_e_d1           <= spc4_dva_rd_en_e;

        spc4_dva_wraddr_10to6_d1      <= `SPARC_CORE4.sparc0.lsu.dva_wr_adr_e[10:6];
        spc4_dva_wraddr_10to6_d2      <= spc4_dva_wraddr_10to6_d1;

        spc4_dva_bit_wr_en_e_d1       <= `SPARC_CORE4.sparc0.lsu.dva_bit_wr_en_e;
        spc4_dva_bit_wr_en_e_d2       <= spc4_dva_bit_wr_en_e_d1;

        spc4_dva_din_e_d1             <= `SPARC_CORE4.sparc0.lsu.dva_din_e;
        spc4_dva_din_e_d2             <= spc4_dva_din_e_d1;

        spc4_dfq_byp_ff_data_d1       <= `SPARC_CORE4.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc4_dfq_byp_ff_data_d2       <= spc4_dfq_byp_ff_data_d1;

        spc4_ifu_tlu_inst_vld_w       <= `SPARC_CORE4.sparc0.ifu_tlu_inst_vld_m;
        spc4_ifu_tlu_flush_w          <= `SPARC_CORE4.sparc0.ifu_tlu_flush_m;
        spc4_ifu_mmu_trap_w           <= `SPARC_CORE4.sparc0.ifu_mmu_trap_m;
//        spc4_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE4.sparc0.spu_tlu_rsrv_illgl_m;
        spc4_exu_lsu_priority_trap_w  <= `SPARC_CORE4.sparc0.exu_lsu_priority_trap_m;
        spc4_ffu_tlu_ill_inst_w       <= `SPARC_CORE4.sparc0.ffu_tlu_ill_inst_m;
        spc4_ifu_tlu_immu_miss_w      <= `SPARC_CORE4.sparc0.ifu_tlu_immu_miss_m;
        spc4_ifu_tlu_priv_violtn_w    <= `SPARC_CORE4.sparc0.ifu_tlu_priv_violtn_m;
        spc4_exu_ifu_va_oor_w         <= `SPARC_CORE4.sparc0.exu_ifu_va_oor_m;

        spc4_lsu_way_hit_or_w2        <= `SPARC_CORE4.sparc0.lsu.dctl.lsu_way_hit_or;
        spc4_ncache_pcx_rq_w2         <= `SPARC_CORE4.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc4_stb_ld_partial_raw_w2    <= `SPARC_CORE4.sparc0.lsu.stb_ld_partial_raw;
        spc4_stb_ld_partial_raw_w3    <= spc4_stb_ld_partial_raw_w2;
        spc4_stb_ld_partial_raw_w4    <= spc4_stb_ld_partial_raw_w3;
        spc4_stb_ld_full_raw_w2       <= `SPARC_CORE4.sparc0.lsu.stb_ld_full_raw;
        spc4_stb_ld_full_raw_w3       <= spc4_stb_ld_full_raw_w2;
        spc4_stb_ld_full_raw_w4       <= spc4_stb_ld_full_raw_w3;
        spc4_stb_cam_rw_ptr_decode_w  <= spc4_stb_cam_rw_ptr_decode_m;
        spc4_stb_cam_rw_ptr_decode_w2 <= spc4_stb_cam_rw_ptr_decode_w;
        spc4_stb_cam_rw_ptr_decode_w3 <= spc4_stb_cam_rw_ptr_decode_w2;
        spc4_stb_cam_rw_ptr_decode_w4 <= spc4_stb_cam_rw_ptr_decode_w3;
        spc4_ld0_inst_vld_w3       <= `SPARC_CORE4.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc4_ld0_inst_vld_w4       <= spc4_ld0_inst_vld_w3;
        spc4_ld1_inst_vld_w3       <= `SPARC_CORE4.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc4_ld1_inst_vld_w4       <= spc4_ld1_inst_vld_w3;
        spc4_ld2_inst_vld_w3       <= `SPARC_CORE4.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc4_ld2_inst_vld_w4       <= spc4_ld2_inst_vld_w3;
        spc4_ld3_inst_vld_w3       <= `SPARC_CORE4.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc4_ld3_inst_vld_w4       <= spc4_ld3_inst_vld_w3;
        spc4_stb_cam_mhit_w3          <= `SPARC_CORE4.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc4_stb_cam_mhit_w4          <= spc4_stb_cam_mhit_w3;
        spc4_io_ld_w3                 <= `SPARC_CORE4.sparc0.lsu.qctl1.io_ld_w2;
        spc4_io_ld_w4                 <= spc4_io_ld_w3;

        spc4_pick_valid_raw_d1        <= spc4_pick_valid_raw;
        spc4_pick_status_d1           <= spc4_pick_status;
        spc4_pcx_rq_sel_d3            <= spc4_pcx_rq_sel_d2;

        spc4_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE4.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc4_lsu_dcache_fill_addr_w[10:4] <= spc4_lsu_dcache_fill_addr_m[10:4];

        spc4_strm_stxa_w2             <= spc4_strm_stxa_g;
        spc4_lsu_spu_stb_empty_d1     <= `SPARC_CORE4.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc4_pick_status_error ) begin
          $display("Error @%d : sparc 4 pick_status not set properly: %b", $time, spc4_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc4_pick_valid_raw_d1 & ~spc4_pick_status_d1) & |spc4_pick_status ) begin
          $display("Error @%d : sparc 4 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc4_pick_status & spc4_pick_status_d1) & |spc4_pick_status ) begin
          $display("Error @%d : sparc 4 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc4_strm_stxa_state      <= 1'b0;
            spc4_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc4_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc4_strm_stxa_w2 & ~spc4_lsu_spu_stb_empty_d1) ) begin
                    spc4_strm_stxa_state      <= 1'b1;
                    spc4_strm_stxa_tid_decode <= spc4_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE4.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc4_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE4.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc4_strm_stxa_tid_decode[3] | spc4_strm_stxa_tid_decode[2]),
                             (spc4_strm_stxa_tid_decode[3] | spc4_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 4 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc4_strm_stxa_tid_decode = spc4_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc4_strm_stxa_tid_decode & ~spc4_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 4 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE4.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc4_strm_stxa_tid_decode[3] | spc4_strm_stxa_tid_decode[2]),
                             (spc4_strm_stxa_tid_decode[3] | spc4_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 4 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc4_strm_stxa_state      = 1'b0;
                        spc4_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C4 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C4 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C4 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C4 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C4 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE4.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C4 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE4.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C4 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C4 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C4 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C4 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C4 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE4.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C4 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C4 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C4 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C4 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE4.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C4 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc4_i, spc4_j;
    wire [7:0] spc4_stb0_valid, spc4_stb1_valid, spc4_stb2_valid, spc4_stb3_valid;

    assign spc4_stb0_valid[7:0] = `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc4_stb1_valid[7:0] = `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc4_stb2_valid[7:0] = `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc4_stb3_valid[7:0] = `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc4_st0_rd_advance, spc4_st1_rd_advance, spc4_st2_rd_advance, spc4_st3_rd_advance;
    reg spc4_flshinst0_rst_d1, spc4_flshinst1_rst_d1, spc4_flshinst2_rst_d1, spc4_flshinst3_rst_d1;
    reg spc4_st0_rd_advance_d1, spc4_st1_rd_advance_d1, spc4_st2_rd_advance_d1, spc4_st3_rd_advance_d1;
    reg spc4_st0_rd_advance_d2, spc4_st1_rd_advance_d2, spc4_st2_rd_advance_d2, spc4_st3_rd_advance_d2;
    reg spc4_st0_rd_advance_d3, spc4_st1_rd_advance_d3, spc4_st2_rd_advance_d3, spc4_st3_rd_advance_d3;
    reg spc4_st0_rd_advance_d4, spc4_st1_rd_advance_d4, spc4_st2_rd_advance_d4, spc4_st3_rd_advance_d4;

/***************************
    assign spc4_st0_rd_advance =  `SPARC_CORE4.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE4.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc4_st1_rd_advance =  `SPARC_CORE4.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE4.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc4_st2_rd_advance =  `SPARC_CORE4.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE4.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc4_st3_rd_advance =  `SPARC_CORE4.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE4.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE4.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE4.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc4_st0_rd_advance =  `SPARC_CORE4.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc4_st1_rd_advance =  `SPARC_CORE4.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc4_st2_rd_advance =  `SPARC_CORE4.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc4_st3_rd_advance =  `SPARC_CORE4.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc4_flshinst0_rst_d1  <= 1'b0;
            spc4_st0_rd_advance_d1 <= 1'b0;
            spc4_st0_rd_advance_d2 <= 1'b0;
            spc4_st0_rd_advance_d3 <= 1'b0;
            spc4_st0_rd_advance_d4 <= 1'b0;

            spc4_flshinst1_rst_d1  <= 1'b0;
            spc4_st1_rd_advance_d1 <= 1'b0;
            spc4_st1_rd_advance_d2 <= 1'b0;
            spc4_st1_rd_advance_d3 <= 1'b0;
            spc4_st1_rd_advance_d4 <= 1'b0;

            spc4_flshinst2_rst_d1  <= 1'b0;
            spc4_st2_rd_advance_d1 <= 1'b0;
            spc4_st2_rd_advance_d2 <= 1'b0;
            spc4_st2_rd_advance_d3 <= 1'b0;
            spc4_st2_rd_advance_d4 <= 1'b0;

            spc4_flshinst3_rst_d1  <= 1'b0;
            spc4_st3_rd_advance_d1 <= 1'b0;
            spc4_st3_rd_advance_d2 <= 1'b0;
            spc4_st3_rd_advance_d3 <= 1'b0;
            spc4_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc4_flshinst0_rst_d1  <= `SPARC_CORE4.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc4_st0_rd_advance_d1 <= spc4_st0_rd_advance;
            spc4_st0_rd_advance_d2 <= spc4_st0_rd_advance_d1;
            spc4_st0_rd_advance_d3 <= spc4_st0_rd_advance_d2;
            spc4_st0_rd_advance_d4 <= spc4_st0_rd_advance_d3;

            spc4_flshinst1_rst_d1  <= `SPARC_CORE4.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc4_st1_rd_advance_d1 <= spc4_st1_rd_advance;
            spc4_st1_rd_advance_d2 <= spc4_st1_rd_advance_d1;
            spc4_st1_rd_advance_d3 <= spc4_st1_rd_advance_d2;
            spc4_st1_rd_advance_d4 <= spc4_st1_rd_advance_d3;

            spc4_flshinst2_rst_d1  <= `SPARC_CORE4.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc4_st2_rd_advance_d1 <= spc4_st2_rd_advance;
            spc4_st2_rd_advance_d2 <= spc4_st2_rd_advance_d1;
            spc4_st2_rd_advance_d3 <= spc4_st2_rd_advance_d2;
            spc4_st2_rd_advance_d4 <= spc4_st2_rd_advance_d3;

            spc4_flshinst3_rst_d1  <= `SPARC_CORE4.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc4_st3_rd_advance_d1 <= spc4_st3_rd_advance;
            spc4_st3_rd_advance_d2 <= spc4_st3_rd_advance_d1;
            spc4_st3_rd_advance_d3 <= spc4_st3_rd_advance_d2;
            spc4_st3_rd_advance_d4 <= spc4_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc4_j = 0;
            for(spc4_i=0; spc4_i<7; spc4_i=spc4_i+1) begin
                if(spc4_stb0_valid[spc4_i+1] != spc4_stb0_valid[spc4_i]) begin
                    spc4_j = spc4_j + 1;
                end
            end
            if(spc4_j > 2) begin
                $display("@%d Bug 7117: Error: C4 STB0 valid bits not contiguous: %b", $time, spc4_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C4 STB0 valid bits not contiguous");
            end

            spc4_j = 0;
            for(spc4_i=0; spc4_i<7; spc4_i=spc4_i+1) begin
                if(spc4_stb1_valid[spc4_i+1] != spc4_stb1_valid[spc4_i]) begin
                    spc4_j = spc4_j + 1;
                end
            end
            if(spc4_j > 2) begin
                $display("@%d Bug 7117: Error: C4 STB1 valid bits not contiguous: %b", $time, spc4_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C4 STB1 valid bits not contiguous");
            end

            spc4_j = 0;
            for(spc4_i=0; spc4_i<7; spc4_i=spc4_i+1) begin
                if(spc4_stb2_valid[spc4_i+1] != spc4_stb2_valid[spc4_i]) begin
                    spc4_j = spc4_j + 1;
                end
            end
            if(spc4_j > 2) begin
                $display("@%d Bug 7117: Error: C4 STB2 valid bits not contiguous: %b", $time, spc4_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C4 STB2 valid bits not contiguous");
            end

            spc4_j = 0;
            for(spc4_i=0; spc4_i<7; spc4_i=spc4_i+1) begin
                if(spc4_stb3_valid[spc4_i+1] != spc4_stb3_valid[spc4_i]) begin
                    spc4_j = spc4_j + 1;
                end
            end
            if(spc4_j > 2) begin
                $display("@%d Bug 7117: Error: C4 STB3 valid bits not contiguous: %b", $time, spc4_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C4 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE4.sparc0.lsu.stb_ctl0.rst_l &
                ~spc4_flshinst0_rst_d1 &
                ~(`SPARC_CORE4.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc4_stb0_valid & `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C4 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc4_stb0_valid, `SPARC_CORE4.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C4 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE4.sparc0.lsu.stb_ctl1.rst_l &
                ~spc4_flshinst1_rst_d1 &
                ~(`SPARC_CORE4.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc4_stb1_valid & `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C4 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc4_stb1_valid, `SPARC_CORE4.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C4 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE4.sparc0.lsu.stb_ctl2.rst_l &
                ~spc4_flshinst2_rst_d1 &
                ~(`SPARC_CORE4.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc4_stb2_valid & `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C4 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc4_stb2_valid, `SPARC_CORE4.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C4 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE4.sparc0.lsu.stb_ctl3.rst_l &
                ~spc4_flshinst3_rst_d1 &
                ~(`SPARC_CORE4.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc4_stb3_valid & `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C4 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc4_stb3_valid, `SPARC_CORE4.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C4 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc4_st0_rd_advance_d1 & spc4_st0_rd_advance) begin
                $display("@%d Bug 7117: C4T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc4_st0_rd_advance_d2 & spc4_st0_rd_advance) begin
                $display("@%d Bug 7117: C4T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc4_st0_rd_advance_d3 & spc4_st0_rd_advance) begin
                $display("@%d Bug 7117: C4T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc4_st0_rd_advance_d4 & spc4_st0_rd_advance) begin
                $display("@%d Bug 7117: C4T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc4_st1_rd_advance_d1 & spc4_st1_rd_advance) begin
                $display("@%d Bug 7117: C4T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc4_st1_rd_advance_d2 & spc4_st1_rd_advance) begin
                $display("@%d Bug 7117: C4T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc4_st1_rd_advance_d3 & spc4_st1_rd_advance) begin
                $display("@%d Bug 7117: C4T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc4_st1_rd_advance_d4 & spc4_st1_rd_advance) begin
                $display("@%d Bug 7117: C4T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc4_st2_rd_advance_d1 & spc4_st2_rd_advance) begin
                $display("@%d Bug 7117: C4T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc4_st2_rd_advance_d2 & spc4_st2_rd_advance) begin
                $display("@%d Bug 7117: C4T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc4_st2_rd_advance_d3 & spc4_st2_rd_advance) begin
                $display("@%d Bug 7117: C4T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc4_st2_rd_advance_d4 & spc4_st2_rd_advance) begin
                $display("@%d Bug 7117: C4T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc4_st3_rd_advance_d1 & spc4_st3_rd_advance) begin
                $display("@%d Bug 7117: C4T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc4_st3_rd_advance_d2 & spc4_st3_rd_advance) begin
                $display("@%d Bug 7117: C4T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc4_st3_rd_advance_d3 & spc4_st3_rd_advance) begin
                $display("@%d Bug 7117: C4T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc4_st3_rd_advance_d4 & spc4_st3_rd_advance) begin
                $display("@%d Bug 7117: C4T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (4 = 0; 4 < 8; 4++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC5
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc5_ifu_lsu_pcxreq_d	= `SPARC_CORE5.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc5_ifu_lsu_pcxpkt_e	= `SPARC_CORE5.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc5_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE5.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc5_ifu_lsu_pcxreq_e;
wire		spc5_ifu_lsu_pcxreq_rise_d;
reg		spc5_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc5_ifu_lsu_pcxpkt;
reg		spc5_ifu_lsu_pcxreq_check;
wire		spc5_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc5_ifu_lsu_pcxreq_e <= spc5_ifu_lsu_pcxreq_d;

assign	spc5_ifu_lsu_pcxreq_rise_d = spc5_ifu_lsu_pcxreq_d & ~spc5_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc5_ifu_lsu_pcxreq_rise_e <= spc5_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc5_ifu_lsu_pcxreq_rise_e)
		spc5_ifu_lsu_pcxpkt <= spc5_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc5_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc5_ifu_lsu_pcxreq_rise_d)
		spc5_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc5_lsu_ifu_pcxpkt_ack_d)
		spc5_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc5_ifu_lsu_pcxreq_check_error = spc5_ifu_lsu_pcxreq_check & ~spc5_ifu_lsu_pcxreq_rise_e & (spc5_ifu_lsu_pcxpkt_e != spc5_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc5_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 5 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc5_tlu_lsu_pcxpkt		= `SPARC_CORE5.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc5_lsu_tlu_pcxpkt_ack	= `SPARC_CORE5.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc5_tlu_lsu_pcxpkt_b25_d1;
wire		spc5_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc5_tlu_lsu_pcxpkt_saved;
reg		spc5_tlu_lsu_pcxpkt_check;
wire		spc5_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc5_tlu_lsu_pcxpkt_b25_d1 <= spc5_tlu_lsu_pcxpkt[25];

assign	spc5_tlu_lsu_pcxpkt_rise = spc5_tlu_lsu_pcxpkt[25] & ~spc5_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc5_tlu_lsu_pcxpkt_rise)
		spc5_tlu_lsu_pcxpkt_saved <= spc5_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc5_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc5_tlu_lsu_pcxpkt_rise)
		spc5_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc5_lsu_tlu_pcxpkt_ack)
		spc5_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc5_tlu_lsu_pcxpkt_check_error = spc5_tlu_lsu_pcxpkt_check & (spc5_tlu_lsu_pcxpkt != spc5_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc5_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 5 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc5_spu_lsu_ldst_pckt	= `SPARC_CORE5.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc5_lsu_spu_ldst_ack	= `SPARC_CORE5.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc5_spu_lsu_ldst_pckt_b123_d1;
wire			spc5_spu_lsu_ldst_pckt_rise;
reg			spc5_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc5_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc5_spu_lsu_ldst_pckt_saved;
reg			spc5_spu_lsu_ldst_pckt_check;
wire			spc5_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc5_spu_lsu_ldst_pckt_b123_d1 <= spc5_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc5_spu_lsu_ldst_pckt_rise = spc5_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc5_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc5_spu_lsu_ldst_pckt_rise_d1 <= spc5_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc5_spu_lsu_ldst_pckt_rise)
		spc5_spu_lsu_ldst_pckt_b71b70_saved <= spc5_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc5_spu_lsu_ldst_pckt_rise_d1)
		spc5_spu_lsu_ldst_pckt_saved <= spc5_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc5_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc5_spu_lsu_ldst_pckt_rise)
		spc5_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc5_lsu_spu_ldst_ack)
		spc5_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc5_spu_lsu_ldst_pckt_check_error = spc5_spu_lsu_ldst_pckt_check &
		((!spc5_spu_lsu_ldst_pckt_rise_d1 & (spc5_spu_lsu_ldst_pckt != spc5_spu_lsu_ldst_pckt_saved)) |
		 (spc5_spu_lsu_ldst_pckt[71:70] != spc5_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc5_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 5 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc5_ffu_lsu_fpop_rq_vld	= `SPARC_CORE5.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc5_ffu_lsu_data		= `SPARC_CORE5.sparc0.lsu.ffu_lsu_data;
wire		spc5_lsu_ffu_ack		= `SPARC_CORE5.sparc0.lsu.lsu_ffu_ack;

reg		spc5_ffu_lsu_fpop_rq_vld_d1;
wire		spc5_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc5_ffu_lsu_data_saved;
reg		spc5_ffu_lsu_fpop_rq_vld_check;
wire		spc5_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc5_ffu_lsu_fpop_rq_vld_d1 <= spc5_ffu_lsu_fpop_rq_vld;

assign	spc5_ffu_lsu_fpop_rq_vld_rise = spc5_ffu_lsu_fpop_rq_vld & ~spc5_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc5_ffu_lsu_fpop_rq_vld_rise)
		spc5_ffu_lsu_data_saved <= spc5_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc5_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc5_ffu_lsu_fpop_rq_vld_rise)
		spc5_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc5_lsu_ffu_ack)
		spc5_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc5_ffu_lsu_fpop_rq_vld_check_error = spc5_ffu_lsu_fpop_rq_vld_check & (spc5_ffu_lsu_data != spc5_ffu_lsu_data_saved) | (spc5_ffu_lsu_fpop_rq_vld_rise & !spc5_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc5_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 5 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc5_spc_pcx_req_pq		= `SPARC_CORE5.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc5_spc_pcx_data_pa		= `SPARC_CORE5.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc5_spc_pcx_req_pa;
wire			spc5_spc_pcx_req_fp1;
wire			spc5_spc_pcx_req_fp2;
reg			spc5_spc_pcx_req_fp1_d1;
wire 			spc5_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc5_spc_pcx_req_pa <= spc5_spc_pcx_req_pq;

assign	spc5_spc_pcx_req_fp1 = (|spc5_spc_pcx_req_pa) & (spc5_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc5_spc_pcx_req_fp2 = spc5_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc5_spc_pcx_req_fp1_d1 <= spc5_spc_pcx_req_fp1;

assign	spc5_spc_pcx_req_fp_b2b_error = spc5_spc_pcx_req_fp1_d1 != spc5_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc5_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 5 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc5_ld_sec_hit_l2access_w2 = `SPARC_CORE5.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc5_ld0_pkt_vld_tmp  = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc5_ld0_pkt_vld_tmp_d;

   wire spc5_ld0_inst_vld_w2  = `SPARC_CORE5.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc5_ld0_is_sec_w2 = spc5_ld0_inst_vld_w2 ? spc5_ld_sec_hit_l2access_w2 : 0;


   wire spc5_ld1_pkt_vld_tmp  = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc5_ld1_pkt_vld_tmp_d;

   wire spc5_ld1_inst_vld_w2  = `SPARC_CORE5.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc5_ld1_is_sec_w2 = spc5_ld1_inst_vld_w2 ? spc5_ld_sec_hit_l2access_w2 : 0;


   wire spc5_ld2_pkt_vld_tmp  = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc5_ld2_pkt_vld_tmp_d;

   wire spc5_ld2_inst_vld_w2  = `SPARC_CORE5.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc5_ld2_is_sec_w2 = spc5_ld2_inst_vld_w2 ? spc5_ld_sec_hit_l2access_w2 : 0;


   wire spc5_ld3_pkt_vld_tmp  = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc5_ld3_pkt_vld_tmp_d;

   wire spc5_ld3_inst_vld_w2  = `SPARC_CORE5.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc5_ld3_is_sec_w2 = spc5_ld3_inst_vld_w2 ? spc5_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc5_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc5_ld0_pkt_vld_tmp;
   spc5_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc5_ld1_pkt_vld_tmp;
   spc5_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc5_ld2_pkt_vld_tmp;
   spc5_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc5_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc5_l2      = `SPARC_CORE5.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc5_unc     = `SPARC_CORE5.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc5_fpld    = `SPARC_CORE5.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc5_fpldst  = `SPARC_CORE5.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc5_unflush = `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc5_ldw     = `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc5_byp     = `SPARC_CORE5.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc5_flsh    = `SPARC_CORE5.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc5_chm     = `SPARC_CORE5.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc5_ldxa    = `SPARC_CORE5.sparc0.lsu.dctl.ldxa_internal ;
wire        spc5_ato     = `SPARC_CORE5.sparc0.lsu.dctl.atomic_g ;
wire        spc5_pref    = `SPARC_CORE5.sparc0.lsu.dctl.pref_inst_g ;
wire        spc5_chit    = `SPARC_CORE5.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc5_dcp     = `SPARC_CORE5.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc5_dtp     = `SPARC_CORE5.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc5_mpu     = `SPARC_CORE5.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc5_exu_und;
reg  [ 4:0] spc5_exu;
reg spc5_flsh_g;
always @(posedge clk)
begin
  spc5_flsh_g <= `SPARC_CORE5.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc5_byp_g;
always @(posedge clk)
begin
  spc5_byp_g <= `SPARC_CORE5.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc5_exu_und = {
//spc5_l2,
//  spc5_unc,
  spc5_fpld,
  spc5_fpldst,
  spc5_unflush,
//spc5_ldw,
  spc5_byp_g,
  spc5_flsh_g,
//spc5_chm,
  spc5_ldxa,
  spc5_ato,
  spc5_pref,
  spc5_chit,
//spc5_dcp,
  spc5_dtp,
  spc5_mpu
};

always @(spc5_exu_und)
begin
  case (spc5_exu_und)
    16'h0000 : spc5_exu =  5'h00;
    16'h0101 : spc5_exu =  5'h01;
    16'h0102 : spc5_exu =  5'h02;
    16'h0104 : spc5_exu =  5'h03;
    16'h0008 : spc5_exu =  5'h04;
    16'h0110 : spc5_exu =  5'h05;
    16'h0120 : spc5_exu =  5'h06;
    16'h0040 : spc5_exu =  5'h07;
    16'h0080 : spc5_exu =  5'h08;
    16'h0100 : spc5_exu =  5'h09;
    16'h0200 : spc5_exu =  5'h0a;
    16'h0400 : spc5_exu =  5'h0b;
    //16'h0800 : spc5_exu =  5'h0c;
    default  : spc5_exu =  5'h0c;

//  16'h1000 : spc5_exu =  5'h0d;
//  16'h2000 : spc5_exu =  5'h0e;
//  16'h4000 : spc5_exu =  5'h0f;
//  16'h8000 : spc5_exu =  5'h10;
//  default  : spc5_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc5_exp_wtchpt_trp_g             = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc5_exp_misalign_addr_ldst_atm_m = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc5_exp_priv_violtn_g            = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc5_exp_daccess_prot_g           = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc5_exp_priv_action_g            = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc5_exp_spec_access_epage_g      = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc5_exp_uncache_atomic_g         = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc5_exp_illegal_asi_action_g     = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc5_exp_flt_ld_nfo_pg_g          = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc5_exp_tlb_data_ue              = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc5_exp_tlb_tag_ue               = `SPARC_CORE5.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc5_exp_unc                      = `SPARC_CORE5.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc5_exp_und;
reg  [ 3:0] spc5_exp;

assign spc5_exp_und = {
  spc5_exp_wtchpt_trp_g,
  spc5_exp_misalign_addr_ldst_atm_m,
  spc5_exp_priv_violtn_g,
  spc5_exp_daccess_prot_g,
  spc5_exp_priv_action_g,
  spc5_exp_spec_access_epage_g,
  spc5_exp_uncache_atomic_g,
  spc5_exp_illegal_asi_action_g,
  spc5_exp_flt_ld_nfo_pg_g,
  spc5_exp_tlb_data_ue,
  spc5_exp_tlb_tag_ue,
  spc5_exp_unc
};

always @(spc5_exp_und)
begin
  case (spc5_exp_und)
    12'h000 : spc5_exp =  4'h0;
    12'h001 : spc5_exp =  4'h1;
    12'h002 : spc5_exp =  4'h2;
    12'h004 : spc5_exp =  4'h3;
    12'h008 : spc5_exp =  4'h4;
    12'h010 : spc5_exp =  4'h5;
    12'h020 : spc5_exp =  4'h6;
    12'h040 : spc5_exp =  4'h7;
    12'h080 : spc5_exp =  4'h8;
    12'h100 : spc5_exp =  4'h9;
    12'h200 : spc5_exp =  4'ha;
    12'h400 : spc5_exp =  4'hb;
    12'h800 : spc5_exp =  4'hc;
    default : spc5_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc5_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc5_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE5.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc5_lsu_ld_hit_wb;

assign  spc5_lsu_ld_hit_wb   =
((|`SPARC_CORE5.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE5.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE5.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE5.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE5.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE5.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE5.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE5.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE5.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE5.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE5.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE5.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE5.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc5_lsu_bld_vld_w2;
reg spc5_lsu_bld_hit_w2;
reg spc5_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc5_lsu_bld_vld_w2 <= `SPARC_CORE5.sparc0.lsu.qctl1.bld_g ;
  spc5_lsu_bld_hit_w2 <= spc5_lsu_ld_hit_wb ;
  spc5_lsu_bld_raw_w2 <= `SPARC_CORE5.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE5.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE5.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE5.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE5.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE5.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE5.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE5.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE5.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE5.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE5.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc5_phy_byp_ec_asi_e;
reg spc5_phy_use_ec_asi_e;
reg spc5_quad_ldd_real_e;
reg spc5_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc5_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE5.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc5_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE5.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc5_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE5.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc5_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE5.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc5_pscxt_ldxa_illgl_va_decode;
wire spc5_lsuctl_illgl_va_decode;
wire spc5_mrgnctl_illgl_va_decode;
wire spc5_asi42_illgl_va_decode;

assign spc5_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE5.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc5_lsuctl_illgl_va_decode     = (`SPARC_CORE5.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc5_mrgnctl_illgl_va_decode    = (`SPARC_CORE5.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc5_asi42_illgl_va_decode      =  `SPARC_CORE5.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc5_l2_ld_return_error = `SPARC_CORE5.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE5.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc5_l2_ld_return_error) begin
//    $display("Error @%d : sparc 5 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc5_io_ld_return_error = `SPARC_CORE5.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE5.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc5_io_ld_return_error) begin
    $display("Error @%d : sparc 5 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc5t0_dec_rptr_pcx_noced;

assign  spc5t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE5.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc5t1_dec_rptr_pcx_noced;

assign  spc5t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE5.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc5t2_dec_rptr_pcx_noced;

assign  spc5t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE5.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc5t3_dec_rptr_pcx_noced;

assign  spc5t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE5.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc5_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc5_stb_cam_cm_tid_d1 <= `SPARC_CORE5.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc5_stb_cam_hit_ptr_dec;
assign spc5_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE5.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc5t0_st_dq1_ld_hit;
assign spc5t0_st_dq1_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl0.dqptr_d1 & spc5_stb_cam_hit_ptr_dec);

wire [7:0] spc5t0_st_dq2_ld_hit;
assign spc5t0_st_dq2_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl0.dqptr_d2 & spc5_stb_cam_hit_ptr_dec);


wire [7:0] spc5t1_st_dq1_ld_hit;
assign spc5t1_st_dq1_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl1.dqptr_d1 & spc5_stb_cam_hit_ptr_dec);

wire [7:0] spc5t1_st_dq2_ld_hit;
assign spc5t1_st_dq2_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl1.dqptr_d2 & spc5_stb_cam_hit_ptr_dec);


wire [7:0] spc5t2_st_dq1_ld_hit;
assign spc5t2_st_dq1_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl2.dqptr_d1 & spc5_stb_cam_hit_ptr_dec);

wire [7:0] spc5t2_st_dq2_ld_hit;
assign spc5t2_st_dq2_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl2.dqptr_d2 & spc5_stb_cam_hit_ptr_dec);


wire [7:0] spc5t3_st_dq1_ld_hit;
assign spc5t3_st_dq1_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl3.dqptr_d1 & spc5_stb_cam_hit_ptr_dec);

wire [7:0] spc5t3_st_dq2_ld_hit;
assign spc5t3_st_dq2_ld_hit =
{8{(`SPARC_CORE5.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE5.sparc0.lsu.stb_cam_hit) &
	(spc5_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE5.sparc0.lsu.stb_ctl3.dqptr_d2 & spc5_stb_cam_hit_ptr_dec);


wire spc5_st_atm_blkst_vld;
assign spc5_st_atm_blkst_vld =
((`SPARC_CORE5.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE5.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE5.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE5.sparc0.lsu.stb_rwctl.blkst_m;

reg spc5_qctl1_casa_w2;
reg spc5_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc5_qctl1_casa_w2 <= `SPARC_CORE5.sparc0.lsu.qctl1.casa_g;
  spc5_stb_cam_vld_w <= `SPARC_CORE5.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc5_bw_r_scm_error;
assign spc5_bw_r_scm_error =
((spc5_stb_cam_vld_w
  &  `SPARC_CORE5.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE5.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE5.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE5.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE5.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE5.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE5.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE5.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE5.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE5.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc5_bw_r_scm_error) begin
		$display("Error @%d : sparc5 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc5_tte_data_perror_unc_wo_vld;
assign spc5_tte_data_perror_unc_wo_vld =
  `SPARC_CORE5.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE5.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE5.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE5.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE5.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc5_tte_data_perror_unc_w_flush;
assign spc5_tte_data_perror_unc_w_flush =
  `SPARC_CORE5.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE5.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE5.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE5.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE5.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE5.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc5_lsu_dcache_tag_perror_g_w_blkasi;
assign spc5_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE5.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE5.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE5.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc5_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc5_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE5.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE5.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE5.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc5_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc5_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE5.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE5.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE5.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE5.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc5_lsu_dcache_tag_perror_g_w_atomic;
assign spc5_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE5.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE5.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE5.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc5_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc5_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE5.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE5.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc5_lsu_dcache_data_perror_g_dtag_perror;
assign spc5_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE5.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE5.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc5_lsu_dcache_data_perror_g_w_altspace;
assign spc5_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE5.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE5.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc5_lsu_dcache_data_perror_g_w_atomic;
assign spc5_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE5.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE5.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE5.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE5.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (5 = 0; 5 < 8; 5++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc5_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc5_lsu_dtagv_wr_vld_e_d1, spc5_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc5_dva_rdaddr_10to6_d1;
wire [15:0] spc5_dva_rd_en_e;
reg  [15:0] spc5_dva_rd_en_e_d1;
wire [15:0] spc5_dva_vld_m_expanded;
reg  [4:0] spc5_dva_wraddr_10to6_d1, spc5_dva_wraddr_10to6_d2;
reg  [15:0] spc5_dva_bit_wr_en_e_d1, spc5_dva_bit_wr_en_e_d2;
reg  spc5_dva_din_e_d1, spc5_dva_din_e_d2;

wire spc5_dva_rdwr_sameline_diffvalue;
wire spc5_dva_rd_wr_sameline_diffvalue;
wire spc5_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc5_dfq_byp_ff_data_d1, spc5_dfq_byp_ff_data_d2;

// lsu_traps
reg spc5_ifu_tlu_inst_vld_w;
reg spc5_ifu_tlu_flush_w;
reg spc5_ifu_mmu_trap_w;
//reg spc5_spu_tlu_rsrv_illgl_w;
reg spc5_exu_lsu_priority_trap_w;
reg spc5_ffu_tlu_ill_inst_w;
reg spc5_ifu_tlu_immu_miss_w;
reg spc5_ifu_tlu_priv_violtn_w;
reg spc5_exu_ifu_va_oor_w;

// lsu_sechit
reg spc5_lsu_way_hit_or_w2, spc5_ncache_pcx_rq_w2;
reg  [7:0] spc5_stb_ld_partial_raw_w2, spc5_stb_ld_partial_raw_w3, spc5_stb_ld_partial_raw_w4;
reg  [7:0] spc5_stb_ld_full_raw_w2, spc5_stb_ld_full_raw_w3, spc5_stb_ld_full_raw_w4;
wire [7:0] spc5_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc5_stb_cam_rw_ptr_decode_w, spc5_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc5_stb_cam_rw_ptr_decode_w3, spc5_stb_cam_rw_ptr_decode_w4;
wire spc5_t0_ld_st_partialraw_hit;
wire spc5_t0_ld_st_fullraw_hit;
wire spc5_t0_st_ld_partialraw_hit;
wire spc5_t0_st_ld_fullraw_hit;
reg  spc5_ld0_inst_vld_w3, spc5_ld0_inst_vld_w4;
wire spc5_t1_ld_st_partialraw_hit;
wire spc5_t1_ld_st_fullraw_hit;
wire spc5_t1_st_ld_partialraw_hit;
wire spc5_t1_st_ld_fullraw_hit;
reg  spc5_ld1_inst_vld_w3, spc5_ld1_inst_vld_w4;
wire spc5_t2_ld_st_partialraw_hit;
wire spc5_t2_ld_st_fullraw_hit;
wire spc5_t2_st_ld_partialraw_hit;
wire spc5_t2_st_ld_fullraw_hit;
reg  spc5_ld2_inst_vld_w3, spc5_ld2_inst_vld_w4;
wire spc5_t3_ld_st_partialraw_hit;
wire spc5_t3_ld_st_fullraw_hit;
wire spc5_t3_st_ld_partialraw_hit;
wire spc5_t3_st_ld_fullraw_hit;
reg  spc5_ld3_inst_vld_w3, spc5_ld3_inst_vld_w4;
reg  spc5_stb_cam_mhit_w3, spc5_stb_cam_mhit_w4;
reg  spc5_io_ld_w3, spc5_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc5_pick_valid_raw, spc5_pick_status, spc5_pick_status_error;
reg  [11:0] spc5_pick_valid_raw_d1, spc5_pick_status_d1;
wire [11:0] spc5_pcx_rq_sel_d2;
reg  [11:0] spc5_pcx_rq_sel_d3;

// lsu_picker2
reg         spc5_fwdpkt_valid_raw;
reg  [3:0]  spc5_st_valid_raw;
wire        spc5_fwdpkt_valid, spc5_pcx_req_squash_d1;
wire [3:0]  spc5_st_valid;
wire [11:0] spc5_pick_valid_raw_h, spc5_pick_valid_h, spc5_pick_valid_h_ext;
reg  [11:0] spc5_pick_valid_h_d1, spc5_pick_valid_h_d2;
wire [4:0]  spc5_pre_qwr, spc5_mcycle_mask_qwr_d1;
wire [11:0] spc5_pick_destbusy_unqual, spc5_pick_atompend_unqual;
wire [11:0] spc5_pick_presented, spc5_pick_destbusy, spc5_pick_atompend;
wire [2:0]  spc5_pick_presented_count, spc5_pick_destbusy_count, spc5_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc5_ldfill_addr_w, spc5_ldinst_addr_m;
reg  [10:4] spc5_lsu_dcache_fill_addr_m, spc5_lsu_dcache_fill_addr_w;
wire        spc5_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc5_strm_stxa_g;
reg  [3:0] spc5_strm_stxa_w2, spc5_lsu_spu_stb_empty_d1;
reg        spc5_strm_stxa_state;
reg  [3:0] spc5_strm_stxa_tid_decode;


`ifdef RTL_SPARC5

    // lsu_dfq_stalls_2ormore_entries

    assign spc5_dfq_2ormore_vld_entries  = |(`SPARC_CORE5.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc5_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc5_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc5_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc5_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc5_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE5.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc5_dva_rdwr_sameline_diffvalue =
        (spc5_dva_rdaddr_10to6_d1 == spc5_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc5_dva_rd_en_e_d1 & spc5_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc5_dva_vld_m_expanded ^ {16{spc5_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc5_dva_rd_wr_sameline_diffvalue =
        (spc5_dva_rdaddr_10to6_d1 == `SPARC_CORE5.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc5_dva_rd_en_e_d1 & `SPARC_CORE5.sparc0.lsu.dva_bit_wr_en_e &
           (spc5_dva_vld_m_expanded ^ {16{`SPARC_CORE5.sparc0.lsu.dva_din_e}}) );

    assign spc5_dva_wr_rd_sameline_diffvalue =
        (spc5_dva_rdaddr_10to6_d1 == spc5_dva_wraddr_10to6_d2) &
        |( spc5_dva_rd_en_e_d1 & spc5_dva_bit_wr_en_e_d2 &
           (spc5_dva_vld_m_expanded ^ {16{spc5_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc5_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc5_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc5_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc5_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc5_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc5_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc5_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc5_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE5.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc5_t0_ld_st_partialraw_hit    = |( spc5_stb_ld_partial_raw_w4 & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t0_ld_st_fullraw_hit       = |( spc5_stb_ld_full_raw_w4    & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t0_st_ld_partialraw_hit    = |( spc5_stb_ld_partial_raw_w2 & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t0_st_ld_fullraw_hit       = |( spc5_stb_ld_full_raw_w2    & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t1_ld_st_partialraw_hit    = |( spc5_stb_ld_partial_raw_w4 & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t1_ld_st_fullraw_hit       = |( spc5_stb_ld_full_raw_w4    & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t1_st_ld_partialraw_hit    = |( spc5_stb_ld_partial_raw_w2 & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t1_st_ld_fullraw_hit       = |( spc5_stb_ld_full_raw_w2    & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t2_ld_st_partialraw_hit    = |( spc5_stb_ld_partial_raw_w4 & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t2_ld_st_fullraw_hit       = |( spc5_stb_ld_full_raw_w4    & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t2_st_ld_partialraw_hit    = |( spc5_stb_ld_partial_raw_w2 & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t2_st_ld_fullraw_hit       = |( spc5_stb_ld_full_raw_w2    & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t3_ld_st_partialraw_hit    = |( spc5_stb_ld_partial_raw_w4 & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t3_ld_st_fullraw_hit       = |( spc5_stb_ld_full_raw_w4    & spc5_stb_cam_rw_ptr_decode_w4 );
    assign spc5_t3_st_ld_partialraw_hit    = |( spc5_stb_ld_partial_raw_w2 & spc5_stb_cam_rw_ptr_decode_w2 );
    assign spc5_t3_st_ld_fullraw_hit       = |( spc5_stb_ld_full_raw_w2    & spc5_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc5_pick_valid_raw[11:0] = {`SPARC_CORE5.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE5.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE5.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc5_pick_status[11:0] = {`SPARC_CORE5.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE5.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE5.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc5_pcx_rq_sel_d2[11:0] = {`SPARC_CORE5.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc5_pick_status_error = ~spc5_pick_valid_raw & spc5_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc5_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc5_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc5_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc5_pcx_req_squash_d1 = `SPARC_CORE5.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc5_fwdpkt_valid_raw  <= 1'b0;
            spc5_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc5_fwdpkt_valid_raw <= (`SPARC_CORE5.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc5_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE5.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc5_pcx_req_squash_d1);

            spc5_st_valid_raw[3]  <= (`SPARC_CORE5.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc5_st_valid_raw[3]) &
                                        ~(`SPARC_CORE5.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc5_pcx_req_squash_d1);
            spc5_st_valid_raw[2]  <= (`SPARC_CORE5.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc5_st_valid_raw[2]) &
                                        ~(`SPARC_CORE5.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc5_pcx_req_squash_d1);
            spc5_st_valid_raw[1]  <= (`SPARC_CORE5.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc5_st_valid_raw[1]) &
                                        ~(`SPARC_CORE5.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc5_pcx_req_squash_d1);
            spc5_st_valid_raw[0]  <= (`SPARC_CORE5.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc5_st_valid_raw[0]) &
                                        ~(`SPARC_CORE5.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc5_pcx_req_squash_d1);

            spc5_pick_valid_h_d1  <= spc5_pick_valid_h;
            spc5_pick_valid_h_d2  <= spc5_pick_valid_h_d1;
        end
    end

    assign spc5_fwdpkt_valid = spc5_fwdpkt_valid_raw & |(`SPARC_CORE5.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE5.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc5_st_valid[3]  = spc5_st_valid_raw[3] & |(`SPARC_CORE5.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE5.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc5_st_valid[2]  = spc5_st_valid_raw[2] & |(`SPARC_CORE5.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE5.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc5_st_valid[1]  = spc5_st_valid_raw[1] & |(`SPARC_CORE5.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE5.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc5_st_valid[0]  = spc5_st_valid_raw[0] & |(`SPARC_CORE5.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE5.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc5_pick_valid_raw_h[11:0] = {`SPARC_CORE5.sparc0.lsu.qctl1.misc_events_raw[3:1], spc5_fwdpkt_valid_raw,
                                             spc5_st_valid_raw[3:0],
                                             `SPARC_CORE5.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc5_pick_valid_h[11:0] = {`SPARC_CORE5.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE5.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE5.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc5_fwdpkt_valid,
                                         spc5_st_valid[3:0],
                                         `SPARC_CORE5.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE5.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE5.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE5.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc5_pick_valid_h_ext[11:0] = spc5_pick_valid_h | spc5_pick_valid_h_d1 | spc5_pick_valid_h_d2;

    assign spc5_pre_qwr[4:0] = `SPARC_CORE5.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc5_pick_destbusy_unqual[11] = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[10] = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[9]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[8]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc5_pick_destbusy_unqual[7]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[6]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[5]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[4]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[3]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[2]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[1]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc5_pick_destbusy_unqual[0]  = ~|(spc5_pre_qwr[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc5_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE5.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc5_pick_atompend_unqual[11] = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[10] = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[9]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[8]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc5_pick_atompend_unqual[7]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[6]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[5]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[4]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[3]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[2]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[1]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc5_pick_atompend_unqual[0]  = ~|(~spc5_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE5.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc5_pick_presented = spc5_pick_valid_raw_h &  spc5_pick_valid_h_ext;
    assign spc5_pick_destbusy  = spc5_pick_valid_raw_h & ~spc5_pick_valid_h_ext & spc5_pick_destbusy_unqual;
    assign spc5_pick_atompend  = spc5_pick_valid_raw_h & ~spc5_pick_valid_h_ext & spc5_pick_atompend_unqual;

    count12bits C5_presented_count(
        .in  (spc5_pick_presented),
        .out (spc5_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C5_destbusy_count(
        .in  (spc5_pick_destbusy),
        .out (spc5_pick_destbusy_count)
    );
    count12bits C5_atompend_count(
        .in  (spc5_pick_atompend),
        .out (spc5_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc5_ldfill_addr_w[39:4]    = {`SPARC_CORE5.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc5_lsu_dcache_fill_addr_w[10:4]};
    assign spc5_ldinst_addr_m[39:4]    = {`SPARC_CORE5.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE5.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc5_filladdrw_eq_ldaddrm   = (spc5_ldfill_addr_w[39:4] == spc5_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc5_strm_stxa_g[3] = `SPARC_CORE5.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE5.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc5_strm_stxa_g[2] = `SPARC_CORE5.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE5.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc5_strm_stxa_g[1] = `SPARC_CORE5.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE5.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc5_strm_stxa_g[0] = `SPARC_CORE5.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE5.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE5.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc5_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE5.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc5_lsu_dtagv_wr_vld_e_d2    <= spc5_lsu_dtagv_wr_vld_e_d1;

        spc5_dva_rdaddr_10to6_d1      <= `SPARC_CORE5.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc5_dva_rd_en_e_d1           <= spc5_dva_rd_en_e;

        spc5_dva_wraddr_10to6_d1      <= `SPARC_CORE5.sparc0.lsu.dva_wr_adr_e[10:6];
        spc5_dva_wraddr_10to6_d2      <= spc5_dva_wraddr_10to6_d1;

        spc5_dva_bit_wr_en_e_d1       <= `SPARC_CORE5.sparc0.lsu.dva_bit_wr_en_e;
        spc5_dva_bit_wr_en_e_d2       <= spc5_dva_bit_wr_en_e_d1;

        spc5_dva_din_e_d1             <= `SPARC_CORE5.sparc0.lsu.dva_din_e;
        spc5_dva_din_e_d2             <= spc5_dva_din_e_d1;

        spc5_dfq_byp_ff_data_d1       <= `SPARC_CORE5.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc5_dfq_byp_ff_data_d2       <= spc5_dfq_byp_ff_data_d1;

        spc5_ifu_tlu_inst_vld_w       <= `SPARC_CORE5.sparc0.ifu_tlu_inst_vld_m;
        spc5_ifu_tlu_flush_w          <= `SPARC_CORE5.sparc0.ifu_tlu_flush_m;
        spc5_ifu_mmu_trap_w           <= `SPARC_CORE5.sparc0.ifu_mmu_trap_m;
//        spc5_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE5.sparc0.spu_tlu_rsrv_illgl_m;
        spc5_exu_lsu_priority_trap_w  <= `SPARC_CORE5.sparc0.exu_lsu_priority_trap_m;
        spc5_ffu_tlu_ill_inst_w       <= `SPARC_CORE5.sparc0.ffu_tlu_ill_inst_m;
        spc5_ifu_tlu_immu_miss_w      <= `SPARC_CORE5.sparc0.ifu_tlu_immu_miss_m;
        spc5_ifu_tlu_priv_violtn_w    <= `SPARC_CORE5.sparc0.ifu_tlu_priv_violtn_m;
        spc5_exu_ifu_va_oor_w         <= `SPARC_CORE5.sparc0.exu_ifu_va_oor_m;

        spc5_lsu_way_hit_or_w2        <= `SPARC_CORE5.sparc0.lsu.dctl.lsu_way_hit_or;
        spc5_ncache_pcx_rq_w2         <= `SPARC_CORE5.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc5_stb_ld_partial_raw_w2    <= `SPARC_CORE5.sparc0.lsu.stb_ld_partial_raw;
        spc5_stb_ld_partial_raw_w3    <= spc5_stb_ld_partial_raw_w2;
        spc5_stb_ld_partial_raw_w4    <= spc5_stb_ld_partial_raw_w3;
        spc5_stb_ld_full_raw_w2       <= `SPARC_CORE5.sparc0.lsu.stb_ld_full_raw;
        spc5_stb_ld_full_raw_w3       <= spc5_stb_ld_full_raw_w2;
        spc5_stb_ld_full_raw_w4       <= spc5_stb_ld_full_raw_w3;
        spc5_stb_cam_rw_ptr_decode_w  <= spc5_stb_cam_rw_ptr_decode_m;
        spc5_stb_cam_rw_ptr_decode_w2 <= spc5_stb_cam_rw_ptr_decode_w;
        spc5_stb_cam_rw_ptr_decode_w3 <= spc5_stb_cam_rw_ptr_decode_w2;
        spc5_stb_cam_rw_ptr_decode_w4 <= spc5_stb_cam_rw_ptr_decode_w3;
        spc5_ld0_inst_vld_w3       <= `SPARC_CORE5.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc5_ld0_inst_vld_w4       <= spc5_ld0_inst_vld_w3;
        spc5_ld1_inst_vld_w3       <= `SPARC_CORE5.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc5_ld1_inst_vld_w4       <= spc5_ld1_inst_vld_w3;
        spc5_ld2_inst_vld_w3       <= `SPARC_CORE5.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc5_ld2_inst_vld_w4       <= spc5_ld2_inst_vld_w3;
        spc5_ld3_inst_vld_w3       <= `SPARC_CORE5.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc5_ld3_inst_vld_w4       <= spc5_ld3_inst_vld_w3;
        spc5_stb_cam_mhit_w3          <= `SPARC_CORE5.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc5_stb_cam_mhit_w4          <= spc5_stb_cam_mhit_w3;
        spc5_io_ld_w3                 <= `SPARC_CORE5.sparc0.lsu.qctl1.io_ld_w2;
        spc5_io_ld_w4                 <= spc5_io_ld_w3;

        spc5_pick_valid_raw_d1        <= spc5_pick_valid_raw;
        spc5_pick_status_d1           <= spc5_pick_status;
        spc5_pcx_rq_sel_d3            <= spc5_pcx_rq_sel_d2;

        spc5_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE5.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc5_lsu_dcache_fill_addr_w[10:4] <= spc5_lsu_dcache_fill_addr_m[10:4];

        spc5_strm_stxa_w2             <= spc5_strm_stxa_g;
        spc5_lsu_spu_stb_empty_d1     <= `SPARC_CORE5.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc5_pick_status_error ) begin
          $display("Error @%d : sparc 5 pick_status not set properly: %b", $time, spc5_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc5_pick_valid_raw_d1 & ~spc5_pick_status_d1) & |spc5_pick_status ) begin
          $display("Error @%d : sparc 5 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc5_pick_status & spc5_pick_status_d1) & |spc5_pick_status ) begin
          $display("Error @%d : sparc 5 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc5_strm_stxa_state      <= 1'b0;
            spc5_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc5_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc5_strm_stxa_w2 & ~spc5_lsu_spu_stb_empty_d1) ) begin
                    spc5_strm_stxa_state      <= 1'b1;
                    spc5_strm_stxa_tid_decode <= spc5_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE5.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc5_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE5.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc5_strm_stxa_tid_decode[3] | spc5_strm_stxa_tid_decode[2]),
                             (spc5_strm_stxa_tid_decode[3] | spc5_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 5 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc5_strm_stxa_tid_decode = spc5_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc5_strm_stxa_tid_decode & ~spc5_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 5 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE5.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc5_strm_stxa_tid_decode[3] | spc5_strm_stxa_tid_decode[2]),
                             (spc5_strm_stxa_tid_decode[3] | spc5_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 5 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc5_strm_stxa_state      = 1'b0;
                        spc5_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C5 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C5 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C5 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C5 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C5 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE5.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C5 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE5.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C5 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C5 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C5 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C5 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C5 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE5.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C5 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C5 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C5 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C5 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE5.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C5 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc5_i, spc5_j;
    wire [7:0] spc5_stb0_valid, spc5_stb1_valid, spc5_stb2_valid, spc5_stb3_valid;

    assign spc5_stb0_valid[7:0] = `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc5_stb1_valid[7:0] = `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc5_stb2_valid[7:0] = `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc5_stb3_valid[7:0] = `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc5_st0_rd_advance, spc5_st1_rd_advance, spc5_st2_rd_advance, spc5_st3_rd_advance;
    reg spc5_flshinst0_rst_d1, spc5_flshinst1_rst_d1, spc5_flshinst2_rst_d1, spc5_flshinst3_rst_d1;
    reg spc5_st0_rd_advance_d1, spc5_st1_rd_advance_d1, spc5_st2_rd_advance_d1, spc5_st3_rd_advance_d1;
    reg spc5_st0_rd_advance_d2, spc5_st1_rd_advance_d2, spc5_st2_rd_advance_d2, spc5_st3_rd_advance_d2;
    reg spc5_st0_rd_advance_d3, spc5_st1_rd_advance_d3, spc5_st2_rd_advance_d3, spc5_st3_rd_advance_d3;
    reg spc5_st0_rd_advance_d4, spc5_st1_rd_advance_d4, spc5_st2_rd_advance_d4, spc5_st3_rd_advance_d4;

/***************************
    assign spc5_st0_rd_advance =  `SPARC_CORE5.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE5.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc5_st1_rd_advance =  `SPARC_CORE5.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE5.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc5_st2_rd_advance =  `SPARC_CORE5.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE5.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc5_st3_rd_advance =  `SPARC_CORE5.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE5.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE5.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE5.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc5_st0_rd_advance =  `SPARC_CORE5.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc5_st1_rd_advance =  `SPARC_CORE5.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc5_st2_rd_advance =  `SPARC_CORE5.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc5_st3_rd_advance =  `SPARC_CORE5.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc5_flshinst0_rst_d1  <= 1'b0;
            spc5_st0_rd_advance_d1 <= 1'b0;
            spc5_st0_rd_advance_d2 <= 1'b0;
            spc5_st0_rd_advance_d3 <= 1'b0;
            spc5_st0_rd_advance_d4 <= 1'b0;

            spc5_flshinst1_rst_d1  <= 1'b0;
            spc5_st1_rd_advance_d1 <= 1'b0;
            spc5_st1_rd_advance_d2 <= 1'b0;
            spc5_st1_rd_advance_d3 <= 1'b0;
            spc5_st1_rd_advance_d4 <= 1'b0;

            spc5_flshinst2_rst_d1  <= 1'b0;
            spc5_st2_rd_advance_d1 <= 1'b0;
            spc5_st2_rd_advance_d2 <= 1'b0;
            spc5_st2_rd_advance_d3 <= 1'b0;
            spc5_st2_rd_advance_d4 <= 1'b0;

            spc5_flshinst3_rst_d1  <= 1'b0;
            spc5_st3_rd_advance_d1 <= 1'b0;
            spc5_st3_rd_advance_d2 <= 1'b0;
            spc5_st3_rd_advance_d3 <= 1'b0;
            spc5_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc5_flshinst0_rst_d1  <= `SPARC_CORE5.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc5_st0_rd_advance_d1 <= spc5_st0_rd_advance;
            spc5_st0_rd_advance_d2 <= spc5_st0_rd_advance_d1;
            spc5_st0_rd_advance_d3 <= spc5_st0_rd_advance_d2;
            spc5_st0_rd_advance_d4 <= spc5_st0_rd_advance_d3;

            spc5_flshinst1_rst_d1  <= `SPARC_CORE5.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc5_st1_rd_advance_d1 <= spc5_st1_rd_advance;
            spc5_st1_rd_advance_d2 <= spc5_st1_rd_advance_d1;
            spc5_st1_rd_advance_d3 <= spc5_st1_rd_advance_d2;
            spc5_st1_rd_advance_d4 <= spc5_st1_rd_advance_d3;

            spc5_flshinst2_rst_d1  <= `SPARC_CORE5.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc5_st2_rd_advance_d1 <= spc5_st2_rd_advance;
            spc5_st2_rd_advance_d2 <= spc5_st2_rd_advance_d1;
            spc5_st2_rd_advance_d3 <= spc5_st2_rd_advance_d2;
            spc5_st2_rd_advance_d4 <= spc5_st2_rd_advance_d3;

            spc5_flshinst3_rst_d1  <= `SPARC_CORE5.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc5_st3_rd_advance_d1 <= spc5_st3_rd_advance;
            spc5_st3_rd_advance_d2 <= spc5_st3_rd_advance_d1;
            spc5_st3_rd_advance_d3 <= spc5_st3_rd_advance_d2;
            spc5_st3_rd_advance_d4 <= spc5_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc5_j = 0;
            for(spc5_i=0; spc5_i<7; spc5_i=spc5_i+1) begin
                if(spc5_stb0_valid[spc5_i+1] != spc5_stb0_valid[spc5_i]) begin
                    spc5_j = spc5_j + 1;
                end
            end
            if(spc5_j > 2) begin
                $display("@%d Bug 7117: Error: C5 STB0 valid bits not contiguous: %b", $time, spc5_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C5 STB0 valid bits not contiguous");
            end

            spc5_j = 0;
            for(spc5_i=0; spc5_i<7; spc5_i=spc5_i+1) begin
                if(spc5_stb1_valid[spc5_i+1] != spc5_stb1_valid[spc5_i]) begin
                    spc5_j = spc5_j + 1;
                end
            end
            if(spc5_j > 2) begin
                $display("@%d Bug 7117: Error: C5 STB1 valid bits not contiguous: %b", $time, spc5_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C5 STB1 valid bits not contiguous");
            end

            spc5_j = 0;
            for(spc5_i=0; spc5_i<7; spc5_i=spc5_i+1) begin
                if(spc5_stb2_valid[spc5_i+1] != spc5_stb2_valid[spc5_i]) begin
                    spc5_j = spc5_j + 1;
                end
            end
            if(spc5_j > 2) begin
                $display("@%d Bug 7117: Error: C5 STB2 valid bits not contiguous: %b", $time, spc5_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C5 STB2 valid bits not contiguous");
            end

            spc5_j = 0;
            for(spc5_i=0; spc5_i<7; spc5_i=spc5_i+1) begin
                if(spc5_stb3_valid[spc5_i+1] != spc5_stb3_valid[spc5_i]) begin
                    spc5_j = spc5_j + 1;
                end
            end
            if(spc5_j > 2) begin
                $display("@%d Bug 7117: Error: C5 STB3 valid bits not contiguous: %b", $time, spc5_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C5 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE5.sparc0.lsu.stb_ctl0.rst_l &
                ~spc5_flshinst0_rst_d1 &
                ~(`SPARC_CORE5.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc5_stb0_valid & `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C5 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc5_stb0_valid, `SPARC_CORE5.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C5 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE5.sparc0.lsu.stb_ctl1.rst_l &
                ~spc5_flshinst1_rst_d1 &
                ~(`SPARC_CORE5.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc5_stb1_valid & `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C5 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc5_stb1_valid, `SPARC_CORE5.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C5 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE5.sparc0.lsu.stb_ctl2.rst_l &
                ~spc5_flshinst2_rst_d1 &
                ~(`SPARC_CORE5.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc5_stb2_valid & `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C5 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc5_stb2_valid, `SPARC_CORE5.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C5 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE5.sparc0.lsu.stb_ctl3.rst_l &
                ~spc5_flshinst3_rst_d1 &
                ~(`SPARC_CORE5.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc5_stb3_valid & `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C5 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc5_stb3_valid, `SPARC_CORE5.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C5 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc5_st0_rd_advance_d1 & spc5_st0_rd_advance) begin
                $display("@%d Bug 7117: C5T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc5_st0_rd_advance_d2 & spc5_st0_rd_advance) begin
                $display("@%d Bug 7117: C5T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc5_st0_rd_advance_d3 & spc5_st0_rd_advance) begin
                $display("@%d Bug 7117: C5T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc5_st0_rd_advance_d4 & spc5_st0_rd_advance) begin
                $display("@%d Bug 7117: C5T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc5_st1_rd_advance_d1 & spc5_st1_rd_advance) begin
                $display("@%d Bug 7117: C5T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc5_st1_rd_advance_d2 & spc5_st1_rd_advance) begin
                $display("@%d Bug 7117: C5T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc5_st1_rd_advance_d3 & spc5_st1_rd_advance) begin
                $display("@%d Bug 7117: C5T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc5_st1_rd_advance_d4 & spc5_st1_rd_advance) begin
                $display("@%d Bug 7117: C5T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc5_st2_rd_advance_d1 & spc5_st2_rd_advance) begin
                $display("@%d Bug 7117: C5T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc5_st2_rd_advance_d2 & spc5_st2_rd_advance) begin
                $display("@%d Bug 7117: C5T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc5_st2_rd_advance_d3 & spc5_st2_rd_advance) begin
                $display("@%d Bug 7117: C5T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc5_st2_rd_advance_d4 & spc5_st2_rd_advance) begin
                $display("@%d Bug 7117: C5T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc5_st3_rd_advance_d1 & spc5_st3_rd_advance) begin
                $display("@%d Bug 7117: C5T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc5_st3_rd_advance_d2 & spc5_st3_rd_advance) begin
                $display("@%d Bug 7117: C5T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc5_st3_rd_advance_d3 & spc5_st3_rd_advance) begin
                $display("@%d Bug 7117: C5T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc5_st3_rd_advance_d4 & spc5_st3_rd_advance) begin
                $display("@%d Bug 7117: C5T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (5 = 0; 5 < 8; 5++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC6
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc6_ifu_lsu_pcxreq_d	= `SPARC_CORE6.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc6_ifu_lsu_pcxpkt_e	= `SPARC_CORE6.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc6_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE6.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc6_ifu_lsu_pcxreq_e;
wire		spc6_ifu_lsu_pcxreq_rise_d;
reg		spc6_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc6_ifu_lsu_pcxpkt;
reg		spc6_ifu_lsu_pcxreq_check;
wire		spc6_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc6_ifu_lsu_pcxreq_e <= spc6_ifu_lsu_pcxreq_d;

assign	spc6_ifu_lsu_pcxreq_rise_d = spc6_ifu_lsu_pcxreq_d & ~spc6_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc6_ifu_lsu_pcxreq_rise_e <= spc6_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc6_ifu_lsu_pcxreq_rise_e)
		spc6_ifu_lsu_pcxpkt <= spc6_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc6_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc6_ifu_lsu_pcxreq_rise_d)
		spc6_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc6_lsu_ifu_pcxpkt_ack_d)
		spc6_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc6_ifu_lsu_pcxreq_check_error = spc6_ifu_lsu_pcxreq_check & ~spc6_ifu_lsu_pcxreq_rise_e & (spc6_ifu_lsu_pcxpkt_e != spc6_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc6_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 6 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc6_tlu_lsu_pcxpkt		= `SPARC_CORE6.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc6_lsu_tlu_pcxpkt_ack	= `SPARC_CORE6.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc6_tlu_lsu_pcxpkt_b25_d1;
wire		spc6_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc6_tlu_lsu_pcxpkt_saved;
reg		spc6_tlu_lsu_pcxpkt_check;
wire		spc6_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc6_tlu_lsu_pcxpkt_b25_d1 <= spc6_tlu_lsu_pcxpkt[25];

assign	spc6_tlu_lsu_pcxpkt_rise = spc6_tlu_lsu_pcxpkt[25] & ~spc6_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc6_tlu_lsu_pcxpkt_rise)
		spc6_tlu_lsu_pcxpkt_saved <= spc6_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc6_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc6_tlu_lsu_pcxpkt_rise)
		spc6_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc6_lsu_tlu_pcxpkt_ack)
		spc6_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc6_tlu_lsu_pcxpkt_check_error = spc6_tlu_lsu_pcxpkt_check & (spc6_tlu_lsu_pcxpkt != spc6_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc6_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 6 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc6_spu_lsu_ldst_pckt	= `SPARC_CORE6.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc6_lsu_spu_ldst_ack	= `SPARC_CORE6.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc6_spu_lsu_ldst_pckt_b123_d1;
wire			spc6_spu_lsu_ldst_pckt_rise;
reg			spc6_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc6_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc6_spu_lsu_ldst_pckt_saved;
reg			spc6_spu_lsu_ldst_pckt_check;
wire			spc6_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc6_spu_lsu_ldst_pckt_b123_d1 <= spc6_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc6_spu_lsu_ldst_pckt_rise = spc6_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc6_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc6_spu_lsu_ldst_pckt_rise_d1 <= spc6_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc6_spu_lsu_ldst_pckt_rise)
		spc6_spu_lsu_ldst_pckt_b71b70_saved <= spc6_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc6_spu_lsu_ldst_pckt_rise_d1)
		spc6_spu_lsu_ldst_pckt_saved <= spc6_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc6_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc6_spu_lsu_ldst_pckt_rise)
		spc6_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc6_lsu_spu_ldst_ack)
		spc6_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc6_spu_lsu_ldst_pckt_check_error = spc6_spu_lsu_ldst_pckt_check &
		((!spc6_spu_lsu_ldst_pckt_rise_d1 & (spc6_spu_lsu_ldst_pckt != spc6_spu_lsu_ldst_pckt_saved)) |
		 (spc6_spu_lsu_ldst_pckt[71:70] != spc6_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc6_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 6 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc6_ffu_lsu_fpop_rq_vld	= `SPARC_CORE6.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc6_ffu_lsu_data		= `SPARC_CORE6.sparc0.lsu.ffu_lsu_data;
wire		spc6_lsu_ffu_ack		= `SPARC_CORE6.sparc0.lsu.lsu_ffu_ack;

reg		spc6_ffu_lsu_fpop_rq_vld_d1;
wire		spc6_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc6_ffu_lsu_data_saved;
reg		spc6_ffu_lsu_fpop_rq_vld_check;
wire		spc6_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc6_ffu_lsu_fpop_rq_vld_d1 <= spc6_ffu_lsu_fpop_rq_vld;

assign	spc6_ffu_lsu_fpop_rq_vld_rise = spc6_ffu_lsu_fpop_rq_vld & ~spc6_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc6_ffu_lsu_fpop_rq_vld_rise)
		spc6_ffu_lsu_data_saved <= spc6_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc6_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc6_ffu_lsu_fpop_rq_vld_rise)
		spc6_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc6_lsu_ffu_ack)
		spc6_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc6_ffu_lsu_fpop_rq_vld_check_error = spc6_ffu_lsu_fpop_rq_vld_check & (spc6_ffu_lsu_data != spc6_ffu_lsu_data_saved) | (spc6_ffu_lsu_fpop_rq_vld_rise & !spc6_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc6_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 6 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc6_spc_pcx_req_pq		= `SPARC_CORE6.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc6_spc_pcx_data_pa		= `SPARC_CORE6.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc6_spc_pcx_req_pa;
wire			spc6_spc_pcx_req_fp1;
wire			spc6_spc_pcx_req_fp2;
reg			spc6_spc_pcx_req_fp1_d1;
wire 			spc6_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc6_spc_pcx_req_pa <= spc6_spc_pcx_req_pq;

assign	spc6_spc_pcx_req_fp1 = (|spc6_spc_pcx_req_pa) & (spc6_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc6_spc_pcx_req_fp2 = spc6_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc6_spc_pcx_req_fp1_d1 <= spc6_spc_pcx_req_fp1;

assign	spc6_spc_pcx_req_fp_b2b_error = spc6_spc_pcx_req_fp1_d1 != spc6_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc6_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 6 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc6_ld_sec_hit_l2access_w2 = `SPARC_CORE6.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc6_ld0_pkt_vld_tmp  = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc6_ld0_pkt_vld_tmp_d;

   wire spc6_ld0_inst_vld_w2  = `SPARC_CORE6.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc6_ld0_is_sec_w2 = spc6_ld0_inst_vld_w2 ? spc6_ld_sec_hit_l2access_w2 : 0;


   wire spc6_ld1_pkt_vld_tmp  = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc6_ld1_pkt_vld_tmp_d;

   wire spc6_ld1_inst_vld_w2  = `SPARC_CORE6.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc6_ld1_is_sec_w2 = spc6_ld1_inst_vld_w2 ? spc6_ld_sec_hit_l2access_w2 : 0;


   wire spc6_ld2_pkt_vld_tmp  = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc6_ld2_pkt_vld_tmp_d;

   wire spc6_ld2_inst_vld_w2  = `SPARC_CORE6.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc6_ld2_is_sec_w2 = spc6_ld2_inst_vld_w2 ? spc6_ld_sec_hit_l2access_w2 : 0;


   wire spc6_ld3_pkt_vld_tmp  = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc6_ld3_pkt_vld_tmp_d;

   wire spc6_ld3_inst_vld_w2  = `SPARC_CORE6.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc6_ld3_is_sec_w2 = spc6_ld3_inst_vld_w2 ? spc6_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc6_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc6_ld0_pkt_vld_tmp;
   spc6_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc6_ld1_pkt_vld_tmp;
   spc6_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc6_ld2_pkt_vld_tmp;
   spc6_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc6_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc6_l2      = `SPARC_CORE6.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc6_unc     = `SPARC_CORE6.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc6_fpld    = `SPARC_CORE6.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc6_fpldst  = `SPARC_CORE6.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc6_unflush = `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc6_ldw     = `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc6_byp     = `SPARC_CORE6.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc6_flsh    = `SPARC_CORE6.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc6_chm     = `SPARC_CORE6.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc6_ldxa    = `SPARC_CORE6.sparc0.lsu.dctl.ldxa_internal ;
wire        spc6_ato     = `SPARC_CORE6.sparc0.lsu.dctl.atomic_g ;
wire        spc6_pref    = `SPARC_CORE6.sparc0.lsu.dctl.pref_inst_g ;
wire        spc6_chit    = `SPARC_CORE6.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc6_dcp     = `SPARC_CORE6.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc6_dtp     = `SPARC_CORE6.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc6_mpu     = `SPARC_CORE6.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc6_exu_und;
reg  [ 4:0] spc6_exu;
reg spc6_flsh_g;
always @(posedge clk)
begin
  spc6_flsh_g <= `SPARC_CORE6.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc6_byp_g;
always @(posedge clk)
begin
  spc6_byp_g <= `SPARC_CORE6.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc6_exu_und = {
//spc6_l2,
//  spc6_unc,
  spc6_fpld,
  spc6_fpldst,
  spc6_unflush,
//spc6_ldw,
  spc6_byp_g,
  spc6_flsh_g,
//spc6_chm,
  spc6_ldxa,
  spc6_ato,
  spc6_pref,
  spc6_chit,
//spc6_dcp,
  spc6_dtp,
  spc6_mpu
};

always @(spc6_exu_und)
begin
  case (spc6_exu_und)
    16'h0000 : spc6_exu =  5'h00;
    16'h0101 : spc6_exu =  5'h01;
    16'h0102 : spc6_exu =  5'h02;
    16'h0104 : spc6_exu =  5'h03;
    16'h0008 : spc6_exu =  5'h04;
    16'h0110 : spc6_exu =  5'h05;
    16'h0120 : spc6_exu =  5'h06;
    16'h0040 : spc6_exu =  5'h07;
    16'h0080 : spc6_exu =  5'h08;
    16'h0100 : spc6_exu =  5'h09;
    16'h0200 : spc6_exu =  5'h0a;
    16'h0400 : spc6_exu =  5'h0b;
    //16'h0800 : spc6_exu =  5'h0c;
    default  : spc6_exu =  5'h0c;

//  16'h1000 : spc6_exu =  5'h0d;
//  16'h2000 : spc6_exu =  5'h0e;
//  16'h4000 : spc6_exu =  5'h0f;
//  16'h8000 : spc6_exu =  5'h10;
//  default  : spc6_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc6_exp_wtchpt_trp_g             = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc6_exp_misalign_addr_ldst_atm_m = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc6_exp_priv_violtn_g            = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc6_exp_daccess_prot_g           = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc6_exp_priv_action_g            = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc6_exp_spec_access_epage_g      = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc6_exp_uncache_atomic_g         = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc6_exp_illegal_asi_action_g     = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc6_exp_flt_ld_nfo_pg_g          = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc6_exp_tlb_data_ue              = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc6_exp_tlb_tag_ue               = `SPARC_CORE6.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc6_exp_unc                      = `SPARC_CORE6.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc6_exp_und;
reg  [ 3:0] spc6_exp;

assign spc6_exp_und = {
  spc6_exp_wtchpt_trp_g,
  spc6_exp_misalign_addr_ldst_atm_m,
  spc6_exp_priv_violtn_g,
  spc6_exp_daccess_prot_g,
  spc6_exp_priv_action_g,
  spc6_exp_spec_access_epage_g,
  spc6_exp_uncache_atomic_g,
  spc6_exp_illegal_asi_action_g,
  spc6_exp_flt_ld_nfo_pg_g,
  spc6_exp_tlb_data_ue,
  spc6_exp_tlb_tag_ue,
  spc6_exp_unc
};

always @(spc6_exp_und)
begin
  case (spc6_exp_und)
    12'h000 : spc6_exp =  4'h0;
    12'h001 : spc6_exp =  4'h1;
    12'h002 : spc6_exp =  4'h2;
    12'h004 : spc6_exp =  4'h3;
    12'h008 : spc6_exp =  4'h4;
    12'h010 : spc6_exp =  4'h5;
    12'h020 : spc6_exp =  4'h6;
    12'h040 : spc6_exp =  4'h7;
    12'h080 : spc6_exp =  4'h8;
    12'h100 : spc6_exp =  4'h9;
    12'h200 : spc6_exp =  4'ha;
    12'h400 : spc6_exp =  4'hb;
    12'h800 : spc6_exp =  4'hc;
    default : spc6_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc6_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc6_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE6.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc6_lsu_ld_hit_wb;

assign  spc6_lsu_ld_hit_wb   =
((|`SPARC_CORE6.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE6.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE6.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE6.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE6.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE6.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE6.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE6.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE6.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE6.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE6.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE6.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE6.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc6_lsu_bld_vld_w2;
reg spc6_lsu_bld_hit_w2;
reg spc6_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc6_lsu_bld_vld_w2 <= `SPARC_CORE6.sparc0.lsu.qctl1.bld_g ;
  spc6_lsu_bld_hit_w2 <= spc6_lsu_ld_hit_wb ;
  spc6_lsu_bld_raw_w2 <= `SPARC_CORE6.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE6.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE6.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE6.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE6.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE6.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE6.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE6.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE6.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE6.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE6.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc6_phy_byp_ec_asi_e;
reg spc6_phy_use_ec_asi_e;
reg spc6_quad_ldd_real_e;
reg spc6_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc6_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE6.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc6_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE6.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc6_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE6.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc6_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE6.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc6_pscxt_ldxa_illgl_va_decode;
wire spc6_lsuctl_illgl_va_decode;
wire spc6_mrgnctl_illgl_va_decode;
wire spc6_asi42_illgl_va_decode;

assign spc6_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE6.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc6_lsuctl_illgl_va_decode     = (`SPARC_CORE6.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc6_mrgnctl_illgl_va_decode    = (`SPARC_CORE6.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc6_asi42_illgl_va_decode      =  `SPARC_CORE6.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc6_l2_ld_return_error = `SPARC_CORE6.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE6.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc6_l2_ld_return_error) begin
//    $display("Error @%d : sparc 6 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc6_io_ld_return_error = `SPARC_CORE6.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE6.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc6_io_ld_return_error) begin
    $display("Error @%d : sparc 6 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc6t0_dec_rptr_pcx_noced;

assign  spc6t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE6.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc6t1_dec_rptr_pcx_noced;

assign  spc6t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE6.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc6t2_dec_rptr_pcx_noced;

assign  spc6t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE6.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc6t3_dec_rptr_pcx_noced;

assign  spc6t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE6.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc6_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc6_stb_cam_cm_tid_d1 <= `SPARC_CORE6.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc6_stb_cam_hit_ptr_dec;
assign spc6_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE6.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc6t0_st_dq1_ld_hit;
assign spc6t0_st_dq1_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl0.dqptr_d1 & spc6_stb_cam_hit_ptr_dec);

wire [7:0] spc6t0_st_dq2_ld_hit;
assign spc6t0_st_dq2_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl0.dqptr_d2 & spc6_stb_cam_hit_ptr_dec);


wire [7:0] spc6t1_st_dq1_ld_hit;
assign spc6t1_st_dq1_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl1.dqptr_d1 & spc6_stb_cam_hit_ptr_dec);

wire [7:0] spc6t1_st_dq2_ld_hit;
assign spc6t1_st_dq2_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl1.dqptr_d2 & spc6_stb_cam_hit_ptr_dec);


wire [7:0] spc6t2_st_dq1_ld_hit;
assign spc6t2_st_dq1_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl2.dqptr_d1 & spc6_stb_cam_hit_ptr_dec);

wire [7:0] spc6t2_st_dq2_ld_hit;
assign spc6t2_st_dq2_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl2.dqptr_d2 & spc6_stb_cam_hit_ptr_dec);


wire [7:0] spc6t3_st_dq1_ld_hit;
assign spc6t3_st_dq1_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl3.dqptr_d1 & spc6_stb_cam_hit_ptr_dec);

wire [7:0] spc6t3_st_dq2_ld_hit;
assign spc6t3_st_dq2_ld_hit =
{8{(`SPARC_CORE6.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE6.sparc0.lsu.stb_cam_hit) &
	(spc6_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE6.sparc0.lsu.stb_ctl3.dqptr_d2 & spc6_stb_cam_hit_ptr_dec);


wire spc6_st_atm_blkst_vld;
assign spc6_st_atm_blkst_vld =
((`SPARC_CORE6.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE6.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE6.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE6.sparc0.lsu.stb_rwctl.blkst_m;

reg spc6_qctl1_casa_w2;
reg spc6_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc6_qctl1_casa_w2 <= `SPARC_CORE6.sparc0.lsu.qctl1.casa_g;
  spc6_stb_cam_vld_w <= `SPARC_CORE6.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc6_bw_r_scm_error;
assign spc6_bw_r_scm_error =
((spc6_stb_cam_vld_w
  &  `SPARC_CORE6.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE6.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE6.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE6.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE6.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE6.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE6.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE6.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE6.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE6.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc6_bw_r_scm_error) begin
		$display("Error @%d : sparc6 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc6_tte_data_perror_unc_wo_vld;
assign spc6_tte_data_perror_unc_wo_vld =
  `SPARC_CORE6.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE6.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE6.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE6.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE6.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc6_tte_data_perror_unc_w_flush;
assign spc6_tte_data_perror_unc_w_flush =
  `SPARC_CORE6.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE6.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE6.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE6.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE6.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE6.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc6_lsu_dcache_tag_perror_g_w_blkasi;
assign spc6_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE6.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE6.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE6.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc6_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc6_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE6.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE6.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE6.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc6_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc6_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE6.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE6.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE6.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE6.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc6_lsu_dcache_tag_perror_g_w_atomic;
assign spc6_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE6.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE6.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE6.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc6_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc6_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE6.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE6.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc6_lsu_dcache_data_perror_g_dtag_perror;
assign spc6_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE6.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE6.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc6_lsu_dcache_data_perror_g_w_altspace;
assign spc6_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE6.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE6.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc6_lsu_dcache_data_perror_g_w_atomic;
assign spc6_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE6.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE6.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE6.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE6.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (6 = 0; 6 < 8; 6++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc6_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc6_lsu_dtagv_wr_vld_e_d1, spc6_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc6_dva_rdaddr_10to6_d1;
wire [15:0] spc6_dva_rd_en_e;
reg  [15:0] spc6_dva_rd_en_e_d1;
wire [15:0] spc6_dva_vld_m_expanded;
reg  [4:0] spc6_dva_wraddr_10to6_d1, spc6_dva_wraddr_10to6_d2;
reg  [15:0] spc6_dva_bit_wr_en_e_d1, spc6_dva_bit_wr_en_e_d2;
reg  spc6_dva_din_e_d1, spc6_dva_din_e_d2;

wire spc6_dva_rdwr_sameline_diffvalue;
wire spc6_dva_rd_wr_sameline_diffvalue;
wire spc6_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc6_dfq_byp_ff_data_d1, spc6_dfq_byp_ff_data_d2;

// lsu_traps
reg spc6_ifu_tlu_inst_vld_w;
reg spc6_ifu_tlu_flush_w;
reg spc6_ifu_mmu_trap_w;
//reg spc6_spu_tlu_rsrv_illgl_w;
reg spc6_exu_lsu_priority_trap_w;
reg spc6_ffu_tlu_ill_inst_w;
reg spc6_ifu_tlu_immu_miss_w;
reg spc6_ifu_tlu_priv_violtn_w;
reg spc6_exu_ifu_va_oor_w;

// lsu_sechit
reg spc6_lsu_way_hit_or_w2, spc6_ncache_pcx_rq_w2;
reg  [7:0] spc6_stb_ld_partial_raw_w2, spc6_stb_ld_partial_raw_w3, spc6_stb_ld_partial_raw_w4;
reg  [7:0] spc6_stb_ld_full_raw_w2, spc6_stb_ld_full_raw_w3, spc6_stb_ld_full_raw_w4;
wire [7:0] spc6_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc6_stb_cam_rw_ptr_decode_w, spc6_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc6_stb_cam_rw_ptr_decode_w3, spc6_stb_cam_rw_ptr_decode_w4;
wire spc6_t0_ld_st_partialraw_hit;
wire spc6_t0_ld_st_fullraw_hit;
wire spc6_t0_st_ld_partialraw_hit;
wire spc6_t0_st_ld_fullraw_hit;
reg  spc6_ld0_inst_vld_w3, spc6_ld0_inst_vld_w4;
wire spc6_t1_ld_st_partialraw_hit;
wire spc6_t1_ld_st_fullraw_hit;
wire spc6_t1_st_ld_partialraw_hit;
wire spc6_t1_st_ld_fullraw_hit;
reg  spc6_ld1_inst_vld_w3, spc6_ld1_inst_vld_w4;
wire spc6_t2_ld_st_partialraw_hit;
wire spc6_t2_ld_st_fullraw_hit;
wire spc6_t2_st_ld_partialraw_hit;
wire spc6_t2_st_ld_fullraw_hit;
reg  spc6_ld2_inst_vld_w3, spc6_ld2_inst_vld_w4;
wire spc6_t3_ld_st_partialraw_hit;
wire spc6_t3_ld_st_fullraw_hit;
wire spc6_t3_st_ld_partialraw_hit;
wire spc6_t3_st_ld_fullraw_hit;
reg  spc6_ld3_inst_vld_w3, spc6_ld3_inst_vld_w4;
reg  spc6_stb_cam_mhit_w3, spc6_stb_cam_mhit_w4;
reg  spc6_io_ld_w3, spc6_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc6_pick_valid_raw, spc6_pick_status, spc6_pick_status_error;
reg  [11:0] spc6_pick_valid_raw_d1, spc6_pick_status_d1;
wire [11:0] spc6_pcx_rq_sel_d2;
reg  [11:0] spc6_pcx_rq_sel_d3;

// lsu_picker2
reg         spc6_fwdpkt_valid_raw;
reg  [3:0]  spc6_st_valid_raw;
wire        spc6_fwdpkt_valid, spc6_pcx_req_squash_d1;
wire [3:0]  spc6_st_valid;
wire [11:0] spc6_pick_valid_raw_h, spc6_pick_valid_h, spc6_pick_valid_h_ext;
reg  [11:0] spc6_pick_valid_h_d1, spc6_pick_valid_h_d2;
wire [4:0]  spc6_pre_qwr, spc6_mcycle_mask_qwr_d1;
wire [11:0] spc6_pick_destbusy_unqual, spc6_pick_atompend_unqual;
wire [11:0] spc6_pick_presented, spc6_pick_destbusy, spc6_pick_atompend;
wire [2:0]  spc6_pick_presented_count, spc6_pick_destbusy_count, spc6_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc6_ldfill_addr_w, spc6_ldinst_addr_m;
reg  [10:4] spc6_lsu_dcache_fill_addr_m, spc6_lsu_dcache_fill_addr_w;
wire        spc6_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc6_strm_stxa_g;
reg  [3:0] spc6_strm_stxa_w2, spc6_lsu_spu_stb_empty_d1;
reg        spc6_strm_stxa_state;
reg  [3:0] spc6_strm_stxa_tid_decode;


`ifdef RTL_SPARC6

    // lsu_dfq_stalls_2ormore_entries

    assign spc6_dfq_2ormore_vld_entries  = |(`SPARC_CORE6.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc6_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc6_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc6_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc6_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc6_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE6.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc6_dva_rdwr_sameline_diffvalue =
        (spc6_dva_rdaddr_10to6_d1 == spc6_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc6_dva_rd_en_e_d1 & spc6_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc6_dva_vld_m_expanded ^ {16{spc6_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc6_dva_rd_wr_sameline_diffvalue =
        (spc6_dva_rdaddr_10to6_d1 == `SPARC_CORE6.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc6_dva_rd_en_e_d1 & `SPARC_CORE6.sparc0.lsu.dva_bit_wr_en_e &
           (spc6_dva_vld_m_expanded ^ {16{`SPARC_CORE6.sparc0.lsu.dva_din_e}}) );

    assign spc6_dva_wr_rd_sameline_diffvalue =
        (spc6_dva_rdaddr_10to6_d1 == spc6_dva_wraddr_10to6_d2) &
        |( spc6_dva_rd_en_e_d1 & spc6_dva_bit_wr_en_e_d2 &
           (spc6_dva_vld_m_expanded ^ {16{spc6_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc6_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc6_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc6_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc6_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc6_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc6_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc6_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc6_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE6.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc6_t0_ld_st_partialraw_hit    = |( spc6_stb_ld_partial_raw_w4 & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t0_ld_st_fullraw_hit       = |( spc6_stb_ld_full_raw_w4    & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t0_st_ld_partialraw_hit    = |( spc6_stb_ld_partial_raw_w2 & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t0_st_ld_fullraw_hit       = |( spc6_stb_ld_full_raw_w2    & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t1_ld_st_partialraw_hit    = |( spc6_stb_ld_partial_raw_w4 & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t1_ld_st_fullraw_hit       = |( spc6_stb_ld_full_raw_w4    & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t1_st_ld_partialraw_hit    = |( spc6_stb_ld_partial_raw_w2 & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t1_st_ld_fullraw_hit       = |( spc6_stb_ld_full_raw_w2    & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t2_ld_st_partialraw_hit    = |( spc6_stb_ld_partial_raw_w4 & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t2_ld_st_fullraw_hit       = |( spc6_stb_ld_full_raw_w4    & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t2_st_ld_partialraw_hit    = |( spc6_stb_ld_partial_raw_w2 & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t2_st_ld_fullraw_hit       = |( spc6_stb_ld_full_raw_w2    & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t3_ld_st_partialraw_hit    = |( spc6_stb_ld_partial_raw_w4 & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t3_ld_st_fullraw_hit       = |( spc6_stb_ld_full_raw_w4    & spc6_stb_cam_rw_ptr_decode_w4 );
    assign spc6_t3_st_ld_partialraw_hit    = |( spc6_stb_ld_partial_raw_w2 & spc6_stb_cam_rw_ptr_decode_w2 );
    assign spc6_t3_st_ld_fullraw_hit       = |( spc6_stb_ld_full_raw_w2    & spc6_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc6_pick_valid_raw[11:0] = {`SPARC_CORE6.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE6.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE6.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc6_pick_status[11:0] = {`SPARC_CORE6.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE6.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE6.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc6_pcx_rq_sel_d2[11:0] = {`SPARC_CORE6.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc6_pick_status_error = ~spc6_pick_valid_raw & spc6_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc6_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc6_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc6_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc6_pcx_req_squash_d1 = `SPARC_CORE6.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc6_fwdpkt_valid_raw  <= 1'b0;
            spc6_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc6_fwdpkt_valid_raw <= (`SPARC_CORE6.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc6_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE6.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc6_pcx_req_squash_d1);

            spc6_st_valid_raw[3]  <= (`SPARC_CORE6.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc6_st_valid_raw[3]) &
                                        ~(`SPARC_CORE6.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc6_pcx_req_squash_d1);
            spc6_st_valid_raw[2]  <= (`SPARC_CORE6.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc6_st_valid_raw[2]) &
                                        ~(`SPARC_CORE6.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc6_pcx_req_squash_d1);
            spc6_st_valid_raw[1]  <= (`SPARC_CORE6.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc6_st_valid_raw[1]) &
                                        ~(`SPARC_CORE6.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc6_pcx_req_squash_d1);
            spc6_st_valid_raw[0]  <= (`SPARC_CORE6.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc6_st_valid_raw[0]) &
                                        ~(`SPARC_CORE6.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc6_pcx_req_squash_d1);

            spc6_pick_valid_h_d1  <= spc6_pick_valid_h;
            spc6_pick_valid_h_d2  <= spc6_pick_valid_h_d1;
        end
    end

    assign spc6_fwdpkt_valid = spc6_fwdpkt_valid_raw & |(`SPARC_CORE6.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE6.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc6_st_valid[3]  = spc6_st_valid_raw[3] & |(`SPARC_CORE6.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE6.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc6_st_valid[2]  = spc6_st_valid_raw[2] & |(`SPARC_CORE6.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE6.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc6_st_valid[1]  = spc6_st_valid_raw[1] & |(`SPARC_CORE6.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE6.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc6_st_valid[0]  = spc6_st_valid_raw[0] & |(`SPARC_CORE6.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE6.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc6_pick_valid_raw_h[11:0] = {`SPARC_CORE6.sparc0.lsu.qctl1.misc_events_raw[3:1], spc6_fwdpkt_valid_raw,
                                             spc6_st_valid_raw[3:0],
                                             `SPARC_CORE6.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc6_pick_valid_h[11:0] = {`SPARC_CORE6.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE6.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE6.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc6_fwdpkt_valid,
                                         spc6_st_valid[3:0],
                                         `SPARC_CORE6.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE6.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE6.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE6.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc6_pick_valid_h_ext[11:0] = spc6_pick_valid_h | spc6_pick_valid_h_d1 | spc6_pick_valid_h_d2;

    assign spc6_pre_qwr[4:0] = `SPARC_CORE6.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc6_pick_destbusy_unqual[11] = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[10] = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[9]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[8]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc6_pick_destbusy_unqual[7]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[6]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[5]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[4]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[3]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[2]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[1]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc6_pick_destbusy_unqual[0]  = ~|(spc6_pre_qwr[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc6_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE6.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc6_pick_atompend_unqual[11] = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[10] = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[9]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[8]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc6_pick_atompend_unqual[7]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[6]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[5]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[4]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[3]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[2]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[1]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc6_pick_atompend_unqual[0]  = ~|(~spc6_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE6.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc6_pick_presented = spc6_pick_valid_raw_h &  spc6_pick_valid_h_ext;
    assign spc6_pick_destbusy  = spc6_pick_valid_raw_h & ~spc6_pick_valid_h_ext & spc6_pick_destbusy_unqual;
    assign spc6_pick_atompend  = spc6_pick_valid_raw_h & ~spc6_pick_valid_h_ext & spc6_pick_atompend_unqual;

    count12bits C6_presented_count(
        .in  (spc6_pick_presented),
        .out (spc6_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C6_destbusy_count(
        .in  (spc6_pick_destbusy),
        .out (spc6_pick_destbusy_count)
    );
    count12bits C6_atompend_count(
        .in  (spc6_pick_atompend),
        .out (spc6_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc6_ldfill_addr_w[39:4]    = {`SPARC_CORE6.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc6_lsu_dcache_fill_addr_w[10:4]};
    assign spc6_ldinst_addr_m[39:4]    = {`SPARC_CORE6.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE6.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc6_filladdrw_eq_ldaddrm   = (spc6_ldfill_addr_w[39:4] == spc6_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc6_strm_stxa_g[3] = `SPARC_CORE6.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE6.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc6_strm_stxa_g[2] = `SPARC_CORE6.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE6.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc6_strm_stxa_g[1] = `SPARC_CORE6.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE6.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc6_strm_stxa_g[0] = `SPARC_CORE6.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE6.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE6.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc6_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE6.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc6_lsu_dtagv_wr_vld_e_d2    <= spc6_lsu_dtagv_wr_vld_e_d1;

        spc6_dva_rdaddr_10to6_d1      <= `SPARC_CORE6.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc6_dva_rd_en_e_d1           <= spc6_dva_rd_en_e;

        spc6_dva_wraddr_10to6_d1      <= `SPARC_CORE6.sparc0.lsu.dva_wr_adr_e[10:6];
        spc6_dva_wraddr_10to6_d2      <= spc6_dva_wraddr_10to6_d1;

        spc6_dva_bit_wr_en_e_d1       <= `SPARC_CORE6.sparc0.lsu.dva_bit_wr_en_e;
        spc6_dva_bit_wr_en_e_d2       <= spc6_dva_bit_wr_en_e_d1;

        spc6_dva_din_e_d1             <= `SPARC_CORE6.sparc0.lsu.dva_din_e;
        spc6_dva_din_e_d2             <= spc6_dva_din_e_d1;

        spc6_dfq_byp_ff_data_d1       <= `SPARC_CORE6.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc6_dfq_byp_ff_data_d2       <= spc6_dfq_byp_ff_data_d1;

        spc6_ifu_tlu_inst_vld_w       <= `SPARC_CORE6.sparc0.ifu_tlu_inst_vld_m;
        spc6_ifu_tlu_flush_w          <= `SPARC_CORE6.sparc0.ifu_tlu_flush_m;
        spc6_ifu_mmu_trap_w           <= `SPARC_CORE6.sparc0.ifu_mmu_trap_m;
//        spc6_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE6.sparc0.spu_tlu_rsrv_illgl_m;
        spc6_exu_lsu_priority_trap_w  <= `SPARC_CORE6.sparc0.exu_lsu_priority_trap_m;
        spc6_ffu_tlu_ill_inst_w       <= `SPARC_CORE6.sparc0.ffu_tlu_ill_inst_m;
        spc6_ifu_tlu_immu_miss_w      <= `SPARC_CORE6.sparc0.ifu_tlu_immu_miss_m;
        spc6_ifu_tlu_priv_violtn_w    <= `SPARC_CORE6.sparc0.ifu_tlu_priv_violtn_m;
        spc6_exu_ifu_va_oor_w         <= `SPARC_CORE6.sparc0.exu_ifu_va_oor_m;

        spc6_lsu_way_hit_or_w2        <= `SPARC_CORE6.sparc0.lsu.dctl.lsu_way_hit_or;
        spc6_ncache_pcx_rq_w2         <= `SPARC_CORE6.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc6_stb_ld_partial_raw_w2    <= `SPARC_CORE6.sparc0.lsu.stb_ld_partial_raw;
        spc6_stb_ld_partial_raw_w3    <= spc6_stb_ld_partial_raw_w2;
        spc6_stb_ld_partial_raw_w4    <= spc6_stb_ld_partial_raw_w3;
        spc6_stb_ld_full_raw_w2       <= `SPARC_CORE6.sparc0.lsu.stb_ld_full_raw;
        spc6_stb_ld_full_raw_w3       <= spc6_stb_ld_full_raw_w2;
        spc6_stb_ld_full_raw_w4       <= spc6_stb_ld_full_raw_w3;
        spc6_stb_cam_rw_ptr_decode_w  <= spc6_stb_cam_rw_ptr_decode_m;
        spc6_stb_cam_rw_ptr_decode_w2 <= spc6_stb_cam_rw_ptr_decode_w;
        spc6_stb_cam_rw_ptr_decode_w3 <= spc6_stb_cam_rw_ptr_decode_w2;
        spc6_stb_cam_rw_ptr_decode_w4 <= spc6_stb_cam_rw_ptr_decode_w3;
        spc6_ld0_inst_vld_w3       <= `SPARC_CORE6.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc6_ld0_inst_vld_w4       <= spc6_ld0_inst_vld_w3;
        spc6_ld1_inst_vld_w3       <= `SPARC_CORE6.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc6_ld1_inst_vld_w4       <= spc6_ld1_inst_vld_w3;
        spc6_ld2_inst_vld_w3       <= `SPARC_CORE6.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc6_ld2_inst_vld_w4       <= spc6_ld2_inst_vld_w3;
        spc6_ld3_inst_vld_w3       <= `SPARC_CORE6.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc6_ld3_inst_vld_w4       <= spc6_ld3_inst_vld_w3;
        spc6_stb_cam_mhit_w3          <= `SPARC_CORE6.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc6_stb_cam_mhit_w4          <= spc6_stb_cam_mhit_w3;
        spc6_io_ld_w3                 <= `SPARC_CORE6.sparc0.lsu.qctl1.io_ld_w2;
        spc6_io_ld_w4                 <= spc6_io_ld_w3;

        spc6_pick_valid_raw_d1        <= spc6_pick_valid_raw;
        spc6_pick_status_d1           <= spc6_pick_status;
        spc6_pcx_rq_sel_d3            <= spc6_pcx_rq_sel_d2;

        spc6_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE6.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc6_lsu_dcache_fill_addr_w[10:4] <= spc6_lsu_dcache_fill_addr_m[10:4];

        spc6_strm_stxa_w2             <= spc6_strm_stxa_g;
        spc6_lsu_spu_stb_empty_d1     <= `SPARC_CORE6.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc6_pick_status_error ) begin
          $display("Error @%d : sparc 6 pick_status not set properly: %b", $time, spc6_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc6_pick_valid_raw_d1 & ~spc6_pick_status_d1) & |spc6_pick_status ) begin
          $display("Error @%d : sparc 6 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc6_pick_status & spc6_pick_status_d1) & |spc6_pick_status ) begin
          $display("Error @%d : sparc 6 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc6_strm_stxa_state      <= 1'b0;
            spc6_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc6_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc6_strm_stxa_w2 & ~spc6_lsu_spu_stb_empty_d1) ) begin
                    spc6_strm_stxa_state      <= 1'b1;
                    spc6_strm_stxa_tid_decode <= spc6_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE6.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc6_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE6.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc6_strm_stxa_tid_decode[3] | spc6_strm_stxa_tid_decode[2]),
                             (spc6_strm_stxa_tid_decode[3] | spc6_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 6 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc6_strm_stxa_tid_decode = spc6_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc6_strm_stxa_tid_decode & ~spc6_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 6 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE6.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc6_strm_stxa_tid_decode[3] | spc6_strm_stxa_tid_decode[2]),
                             (spc6_strm_stxa_tid_decode[3] | spc6_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 6 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc6_strm_stxa_state      = 1'b0;
                        spc6_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C6 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C6 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C6 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C6 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C6 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE6.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C6 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE6.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C6 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C6 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C6 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C6 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C6 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE6.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C6 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C6 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C6 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C6 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE6.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C6 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc6_i, spc6_j;
    wire [7:0] spc6_stb0_valid, spc6_stb1_valid, spc6_stb2_valid, spc6_stb3_valid;

    assign spc6_stb0_valid[7:0] = `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc6_stb1_valid[7:0] = `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc6_stb2_valid[7:0] = `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc6_stb3_valid[7:0] = `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc6_st0_rd_advance, spc6_st1_rd_advance, spc6_st2_rd_advance, spc6_st3_rd_advance;
    reg spc6_flshinst0_rst_d1, spc6_flshinst1_rst_d1, spc6_flshinst2_rst_d1, spc6_flshinst3_rst_d1;
    reg spc6_st0_rd_advance_d1, spc6_st1_rd_advance_d1, spc6_st2_rd_advance_d1, spc6_st3_rd_advance_d1;
    reg spc6_st0_rd_advance_d2, spc6_st1_rd_advance_d2, spc6_st2_rd_advance_d2, spc6_st3_rd_advance_d2;
    reg spc6_st0_rd_advance_d3, spc6_st1_rd_advance_d3, spc6_st2_rd_advance_d3, spc6_st3_rd_advance_d3;
    reg spc6_st0_rd_advance_d4, spc6_st1_rd_advance_d4, spc6_st2_rd_advance_d4, spc6_st3_rd_advance_d4;

/***************************
    assign spc6_st0_rd_advance =  `SPARC_CORE6.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE6.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc6_st1_rd_advance =  `SPARC_CORE6.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE6.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc6_st2_rd_advance =  `SPARC_CORE6.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE6.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc6_st3_rd_advance =  `SPARC_CORE6.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE6.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE6.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE6.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc6_st0_rd_advance =  `SPARC_CORE6.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc6_st1_rd_advance =  `SPARC_CORE6.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc6_st2_rd_advance =  `SPARC_CORE6.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc6_st3_rd_advance =  `SPARC_CORE6.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc6_flshinst0_rst_d1  <= 1'b0;
            spc6_st0_rd_advance_d1 <= 1'b0;
            spc6_st0_rd_advance_d2 <= 1'b0;
            spc6_st0_rd_advance_d3 <= 1'b0;
            spc6_st0_rd_advance_d4 <= 1'b0;

            spc6_flshinst1_rst_d1  <= 1'b0;
            spc6_st1_rd_advance_d1 <= 1'b0;
            spc6_st1_rd_advance_d2 <= 1'b0;
            spc6_st1_rd_advance_d3 <= 1'b0;
            spc6_st1_rd_advance_d4 <= 1'b0;

            spc6_flshinst2_rst_d1  <= 1'b0;
            spc6_st2_rd_advance_d1 <= 1'b0;
            spc6_st2_rd_advance_d2 <= 1'b0;
            spc6_st2_rd_advance_d3 <= 1'b0;
            spc6_st2_rd_advance_d4 <= 1'b0;

            spc6_flshinst3_rst_d1  <= 1'b0;
            spc6_st3_rd_advance_d1 <= 1'b0;
            spc6_st3_rd_advance_d2 <= 1'b0;
            spc6_st3_rd_advance_d3 <= 1'b0;
            spc6_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc6_flshinst0_rst_d1  <= `SPARC_CORE6.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc6_st0_rd_advance_d1 <= spc6_st0_rd_advance;
            spc6_st0_rd_advance_d2 <= spc6_st0_rd_advance_d1;
            spc6_st0_rd_advance_d3 <= spc6_st0_rd_advance_d2;
            spc6_st0_rd_advance_d4 <= spc6_st0_rd_advance_d3;

            spc6_flshinst1_rst_d1  <= `SPARC_CORE6.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc6_st1_rd_advance_d1 <= spc6_st1_rd_advance;
            spc6_st1_rd_advance_d2 <= spc6_st1_rd_advance_d1;
            spc6_st1_rd_advance_d3 <= spc6_st1_rd_advance_d2;
            spc6_st1_rd_advance_d4 <= spc6_st1_rd_advance_d3;

            spc6_flshinst2_rst_d1  <= `SPARC_CORE6.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc6_st2_rd_advance_d1 <= spc6_st2_rd_advance;
            spc6_st2_rd_advance_d2 <= spc6_st2_rd_advance_d1;
            spc6_st2_rd_advance_d3 <= spc6_st2_rd_advance_d2;
            spc6_st2_rd_advance_d4 <= spc6_st2_rd_advance_d3;

            spc6_flshinst3_rst_d1  <= `SPARC_CORE6.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc6_st3_rd_advance_d1 <= spc6_st3_rd_advance;
            spc6_st3_rd_advance_d2 <= spc6_st3_rd_advance_d1;
            spc6_st3_rd_advance_d3 <= spc6_st3_rd_advance_d2;
            spc6_st3_rd_advance_d4 <= spc6_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc6_j = 0;
            for(spc6_i=0; spc6_i<7; spc6_i=spc6_i+1) begin
                if(spc6_stb0_valid[spc6_i+1] != spc6_stb0_valid[spc6_i]) begin
                    spc6_j = spc6_j + 1;
                end
            end
            if(spc6_j > 2) begin
                $display("@%d Bug 7117: Error: C6 STB0 valid bits not contiguous: %b", $time, spc6_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C6 STB0 valid bits not contiguous");
            end

            spc6_j = 0;
            for(spc6_i=0; spc6_i<7; spc6_i=spc6_i+1) begin
                if(spc6_stb1_valid[spc6_i+1] != spc6_stb1_valid[spc6_i]) begin
                    spc6_j = spc6_j + 1;
                end
            end
            if(spc6_j > 2) begin
                $display("@%d Bug 7117: Error: C6 STB1 valid bits not contiguous: %b", $time, spc6_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C6 STB1 valid bits not contiguous");
            end

            spc6_j = 0;
            for(spc6_i=0; spc6_i<7; spc6_i=spc6_i+1) begin
                if(spc6_stb2_valid[spc6_i+1] != spc6_stb2_valid[spc6_i]) begin
                    spc6_j = spc6_j + 1;
                end
            end
            if(spc6_j > 2) begin
                $display("@%d Bug 7117: Error: C6 STB2 valid bits not contiguous: %b", $time, spc6_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C6 STB2 valid bits not contiguous");
            end

            spc6_j = 0;
            for(spc6_i=0; spc6_i<7; spc6_i=spc6_i+1) begin
                if(spc6_stb3_valid[spc6_i+1] != spc6_stb3_valid[spc6_i]) begin
                    spc6_j = spc6_j + 1;
                end
            end
            if(spc6_j > 2) begin
                $display("@%d Bug 7117: Error: C6 STB3 valid bits not contiguous: %b", $time, spc6_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C6 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE6.sparc0.lsu.stb_ctl0.rst_l &
                ~spc6_flshinst0_rst_d1 &
                ~(`SPARC_CORE6.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc6_stb0_valid & `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C6 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc6_stb0_valid, `SPARC_CORE6.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C6 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE6.sparc0.lsu.stb_ctl1.rst_l &
                ~spc6_flshinst1_rst_d1 &
                ~(`SPARC_CORE6.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc6_stb1_valid & `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C6 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc6_stb1_valid, `SPARC_CORE6.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C6 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE6.sparc0.lsu.stb_ctl2.rst_l &
                ~spc6_flshinst2_rst_d1 &
                ~(`SPARC_CORE6.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc6_stb2_valid & `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C6 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc6_stb2_valid, `SPARC_CORE6.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C6 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE6.sparc0.lsu.stb_ctl3.rst_l &
                ~spc6_flshinst3_rst_d1 &
                ~(`SPARC_CORE6.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc6_stb3_valid & `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C6 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc6_stb3_valid, `SPARC_CORE6.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C6 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc6_st0_rd_advance_d1 & spc6_st0_rd_advance) begin
                $display("@%d Bug 7117: C6T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc6_st0_rd_advance_d2 & spc6_st0_rd_advance) begin
                $display("@%d Bug 7117: C6T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc6_st0_rd_advance_d3 & spc6_st0_rd_advance) begin
                $display("@%d Bug 7117: C6T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc6_st0_rd_advance_d4 & spc6_st0_rd_advance) begin
                $display("@%d Bug 7117: C6T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc6_st1_rd_advance_d1 & spc6_st1_rd_advance) begin
                $display("@%d Bug 7117: C6T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc6_st1_rd_advance_d2 & spc6_st1_rd_advance) begin
                $display("@%d Bug 7117: C6T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc6_st1_rd_advance_d3 & spc6_st1_rd_advance) begin
                $display("@%d Bug 7117: C6T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc6_st1_rd_advance_d4 & spc6_st1_rd_advance) begin
                $display("@%d Bug 7117: C6T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc6_st2_rd_advance_d1 & spc6_st2_rd_advance) begin
                $display("@%d Bug 7117: C6T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc6_st2_rd_advance_d2 & spc6_st2_rd_advance) begin
                $display("@%d Bug 7117: C6T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc6_st2_rd_advance_d3 & spc6_st2_rd_advance) begin
                $display("@%d Bug 7117: C6T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc6_st2_rd_advance_d4 & spc6_st2_rd_advance) begin
                $display("@%d Bug 7117: C6T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc6_st3_rd_advance_d1 & spc6_st3_rd_advance) begin
                $display("@%d Bug 7117: C6T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc6_st3_rd_advance_d2 & spc6_st3_rd_advance) begin
                $display("@%d Bug 7117: C6T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc6_st3_rd_advance_d3 & spc6_st3_rd_advance) begin
                $display("@%d Bug 7117: C6T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc6_st3_rd_advance_d4 & spc6_st3_rd_advance) begin
                $display("@%d Bug 7117: C6T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (6 = 0; 6 < 8; 6++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////


`ifdef RTL_SPARC7
// Assertion for ifu_lsu_pcx_req ==============================================================
wire		spc7_ifu_lsu_pcxreq_d	= `SPARC_CORE7.sparc0.lsu.ifu_lsu_pcxreq_d;
wire [51:0]	spc7_ifu_lsu_pcxpkt_e	= `SPARC_CORE7.sparc0.lsu.ifu_lsu_pcxpkt_e;
wire		spc7_lsu_ifu_pcxpkt_ack_d	= `SPARC_CORE7.sparc0.lsu.lsu_ifu_pcxpkt_ack_d;

reg		spc7_ifu_lsu_pcxreq_e;
wire		spc7_ifu_lsu_pcxreq_rise_d;
reg		spc7_ifu_lsu_pcxreq_rise_e;
reg [51:0] 	spc7_ifu_lsu_pcxpkt;
reg		spc7_ifu_lsu_pcxreq_check;
wire		spc7_ifu_lsu_pcxreq_check_error;


always @ (posedge clk)
	spc7_ifu_lsu_pcxreq_e <= spc7_ifu_lsu_pcxreq_d;

assign	spc7_ifu_lsu_pcxreq_rise_d = spc7_ifu_lsu_pcxreq_d & ~spc7_ifu_lsu_pcxreq_e;

always @ (posedge clk)
	spc7_ifu_lsu_pcxreq_rise_e <= spc7_ifu_lsu_pcxreq_rise_d;

always @ (posedge clk)
	if (spc7_ifu_lsu_pcxreq_rise_e)
		spc7_ifu_lsu_pcxpkt <= spc7_ifu_lsu_pcxpkt_e;

always @ (posedge clk)
	if (~rst_l)
		spc7_ifu_lsu_pcxreq_check <= 1'b0;
	else if (spc7_ifu_lsu_pcxreq_rise_d)
		spc7_ifu_lsu_pcxreq_check <= 1'b1;
	else if (spc7_lsu_ifu_pcxpkt_ack_d)
		spc7_ifu_lsu_pcxreq_check <= 1'b0;

assign	spc7_ifu_lsu_pcxreq_check_error = spc7_ifu_lsu_pcxreq_check & ~spc7_ifu_lsu_pcxreq_rise_e & (spc7_ifu_lsu_pcxpkt_e != spc7_ifu_lsu_pcxpkt);

always @ (posedge clk)
	if (spc7_ifu_lsu_pcxreq_check_error) begin
		$display("Error @%d : sparc 7 ifu_lsu_pcxreq_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ifu_lsu_pcxreq_check_error");
	end


// Assertion for tlu_lsu_pcxpkt ==============================================================
wire [25:0]	spc7_tlu_lsu_pcxpkt		= `SPARC_CORE7.sparc0.lsu.tlu_lsu_pcxpkt;
wire		spc7_lsu_tlu_pcxpkt_ack	= `SPARC_CORE7.sparc0.lsu.lsu_tlu_pcxpkt_ack;

reg		spc7_tlu_lsu_pcxpkt_b25_d1;
wire		spc7_tlu_lsu_pcxpkt_rise;
reg [25:0]	spc7_tlu_lsu_pcxpkt_saved;
reg		spc7_tlu_lsu_pcxpkt_check;
wire		spc7_tlu_lsu_pcxpkt_check_error;

always @ (posedge clk)
	spc7_tlu_lsu_pcxpkt_b25_d1 <= spc7_tlu_lsu_pcxpkt[25];

assign	spc7_tlu_lsu_pcxpkt_rise = spc7_tlu_lsu_pcxpkt[25] & ~spc7_tlu_lsu_pcxpkt_b25_d1;

always @(posedge clk)
	if (spc7_tlu_lsu_pcxpkt_rise)
		spc7_tlu_lsu_pcxpkt_saved <= spc7_tlu_lsu_pcxpkt;

always @ (posedge clk)
	if (~rst_l)
		spc7_tlu_lsu_pcxpkt_check <= 1'b0;
	else if (spc7_tlu_lsu_pcxpkt_rise)
		spc7_tlu_lsu_pcxpkt_check <= 1'b1;
	else if (spc7_lsu_tlu_pcxpkt_ack)
		spc7_tlu_lsu_pcxpkt_check <= 1'b0;

assign	spc7_tlu_lsu_pcxpkt_check_error = spc7_tlu_lsu_pcxpkt_check & (spc7_tlu_lsu_pcxpkt != spc7_tlu_lsu_pcxpkt_saved);

always @ (posedge clk)
	if (spc7_tlu_lsu_pcxpkt_check_error) begin
		$display("Error @%d : sparc 7 tlu_lsu_pcxpkt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: tlu_lsu_pcxpkt_check_error");
	end


// Assertion for spu_lsu_ldst_pckt ===========================================================
wire [`PCX_WIDTH-1:0]	spc7_spu_lsu_ldst_pckt	= `SPARC_CORE7.sparc0.lsu.spu_lsu_ldst_pckt;
wire			spc7_lsu_spu_ldst_ack	= `SPARC_CORE7.sparc0.lsu.lsu_spu_ldst_ack;

reg			spc7_spu_lsu_ldst_pckt_b123_d1;
wire			spc7_spu_lsu_ldst_pckt_rise;
reg			spc7_spu_lsu_ldst_pckt_rise_d1;
reg [1:0]		spc7_spu_lsu_ldst_pckt_b71b70_saved;
reg [`PCX_WIDTH-1:0]	spc7_spu_lsu_ldst_pckt_saved;
reg			spc7_spu_lsu_ldst_pckt_check;
wire			spc7_spu_lsu_ldst_pckt_check_error;

always @ (posedge clk)
	spc7_spu_lsu_ldst_pckt_b123_d1 <= spc7_spu_lsu_ldst_pckt[`PCX_WIDTH-1];

assign	spc7_spu_lsu_ldst_pckt_rise = spc7_spu_lsu_ldst_pckt[`PCX_WIDTH-1] & ~spc7_spu_lsu_ldst_pckt_b123_d1;

always @ (posedge clk)
	spc7_spu_lsu_ldst_pckt_rise_d1 <= spc7_spu_lsu_ldst_pckt_rise;

// bank address bits are sent in first cycle
always @(posedge clk)
	if (spc7_spu_lsu_ldst_pckt_rise)
		spc7_spu_lsu_ldst_pckt_b71b70_saved <= spc7_spu_lsu_ldst_pckt[71:70];

// rest of the bits are sent in second cycle
always @(posedge clk)
	if (spc7_spu_lsu_ldst_pckt_rise_d1)
		spc7_spu_lsu_ldst_pckt_saved <= spc7_spu_lsu_ldst_pckt;

always @ (posedge clk)
	if (~rst_l)
		spc7_spu_lsu_ldst_pckt_check <= 1'b0;
	else if (spc7_spu_lsu_ldst_pckt_rise)
		spc7_spu_lsu_ldst_pckt_check <= 1'b1;
	else if (spc7_lsu_spu_ldst_ack)
		spc7_spu_lsu_ldst_pckt_check <= 1'b0;

assign	spc7_spu_lsu_ldst_pckt_check_error = spc7_spu_lsu_ldst_pckt_check &
		((!spc7_spu_lsu_ldst_pckt_rise_d1 & (spc7_spu_lsu_ldst_pckt != spc7_spu_lsu_ldst_pckt_saved)) |
		 (spc7_spu_lsu_ldst_pckt[71:70] != spc7_spu_lsu_ldst_pckt_b71b70_saved));

always @ (posedge clk)
	if (spc7_spu_lsu_ldst_pckt_check_error) begin
		$display("Error @%d : sparc 7 spu_lsu_ldst_pckt_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spu_lsu_ldst_pckt_check_error");
	end


// Assertion for ffu_lsu_fpop_rq_vld  ===========================================================
wire		spc7_ffu_lsu_fpop_rq_vld	= `SPARC_CORE7.sparc0.lsu.ffu_lsu_fpop_rq_vld;
wire [80:0]	spc7_ffu_lsu_data		= `SPARC_CORE7.sparc0.lsu.ffu_lsu_data;
wire		spc7_lsu_ffu_ack		= `SPARC_CORE7.sparc0.lsu.lsu_ffu_ack;

reg		spc7_ffu_lsu_fpop_rq_vld_d1;
wire		spc7_ffu_lsu_fpop_rq_vld_rise;
reg [80:0]	spc7_ffu_lsu_data_saved;
reg		spc7_ffu_lsu_fpop_rq_vld_check;
wire		spc7_ffu_lsu_fpop_rq_vld_check_error;

always @ (posedge clk)
	 spc7_ffu_lsu_fpop_rq_vld_d1 <= spc7_ffu_lsu_fpop_rq_vld;

assign	spc7_ffu_lsu_fpop_rq_vld_rise = spc7_ffu_lsu_fpop_rq_vld & ~spc7_ffu_lsu_fpop_rq_vld_d1;

always @ (posedge clk)
	if (spc7_ffu_lsu_fpop_rq_vld_rise)
		spc7_ffu_lsu_data_saved <= spc7_ffu_lsu_data;

always @ (posedge clk)
	if (~rst_l)
		spc7_ffu_lsu_fpop_rq_vld_check <= 1'b0;
	else if (spc7_ffu_lsu_fpop_rq_vld_rise)
		spc7_ffu_lsu_fpop_rq_vld_check <= 1'b1;
	else if (spc7_lsu_ffu_ack)
		spc7_ffu_lsu_fpop_rq_vld_check <= 1'b0;

assign	spc7_ffu_lsu_fpop_rq_vld_check_error = spc7_ffu_lsu_fpop_rq_vld_check & (spc7_ffu_lsu_data != spc7_ffu_lsu_data_saved) | (spc7_ffu_lsu_fpop_rq_vld_rise & !spc7_ffu_lsu_data[80]);  // make sure bit[80] is set when req_vld asserts

always @ (posedge clk)
	if (spc7_ffu_lsu_fpop_rq_vld_check_error) begin
		$display("Error @%d : sparc 7 ffu_lsu_fpop_rq_vld_check_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: ffu_lsu_fpop_rq_vld_check_error");
	end

// Assertion for fp packets going to pcx b2b ===========================================================
wire [4:0]		spc7_spc_pcx_req_pq		= `SPARC_CORE7.sparc0.lsu.spc_pcx_req_pq;
wire [`PCX_WIDTH-1:0]	spc7_spc_pcx_data_pa		= `SPARC_CORE7.sparc0.lsu.spc_pcx_data_pa;

reg [4:0]		spc7_spc_pcx_req_pa;
wire			spc7_spc_pcx_req_fp1;
wire			spc7_spc_pcx_req_fp2;
reg			spc7_spc_pcx_req_fp1_d1;
wire 			spc7_spc_pcx_req_fp_b2b_error;

always @ (posedge clk)
	spc7_spc_pcx_req_pa <= spc7_spc_pcx_req_pq;

assign	spc7_spc_pcx_req_fp1 = (|spc7_spc_pcx_req_pa) & (spc7_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01010);
assign	spc7_spc_pcx_req_fp2 = spc7_spc_pcx_data_pa[`PCX_RQ_HI:`PCX_RQ_LO] == 5'b01011;

always @ (posedge clk)
	spc7_spc_pcx_req_fp1_d1 <= spc7_spc_pcx_req_fp1;

assign	spc7_spc_pcx_req_fp_b2b_error = spc7_spc_pcx_req_fp1_d1 != spc7_spc_pcx_req_fp2;

always @ (posedge clk)
	if (spc7_spc_pcx_req_fp_b2b_error) begin
		$display("Error @%d : sparc 7 spc_pcx_req_fp_b2b_error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: spc_pcx_req_fp_b2b_error");
	end


// Signal for lsu_load_qctl ============================================================================
wire spc7_ld_sec_hit_l2access_w2 = `SPARC_CORE7.sparc0.lsu.qctl1.lsu_ld_sec_hit_l2access_w2;


   wire spc7_ld0_pkt_vld_tmp  = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pkt_vld_tmp;
   reg  spc7_ld0_pkt_vld_tmp_d;

   wire spc7_ld0_inst_vld_w2  = `SPARC_CORE7.sparc0.lsu.qctl1.ld0_inst_vld_w2;
   wire spc7_ld0_is_sec_w2 = spc7_ld0_inst_vld_w2 ? spc7_ld_sec_hit_l2access_w2 : 0;


   wire spc7_ld1_pkt_vld_tmp  = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pkt_vld_tmp;
   reg  spc7_ld1_pkt_vld_tmp_d;

   wire spc7_ld1_inst_vld_w2  = `SPARC_CORE7.sparc0.lsu.qctl1.ld1_inst_vld_w2;
   wire spc7_ld1_is_sec_w2 = spc7_ld1_inst_vld_w2 ? spc7_ld_sec_hit_l2access_w2 : 0;


   wire spc7_ld2_pkt_vld_tmp  = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pkt_vld_tmp;
   reg  spc7_ld2_pkt_vld_tmp_d;

   wire spc7_ld2_inst_vld_w2  = `SPARC_CORE7.sparc0.lsu.qctl1.ld2_inst_vld_w2;
   wire spc7_ld2_is_sec_w2 = spc7_ld2_inst_vld_w2 ? spc7_ld_sec_hit_l2access_w2 : 0;


   wire spc7_ld3_pkt_vld_tmp  = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pkt_vld_tmp;
   reg  spc7_ld3_pkt_vld_tmp_d;

   wire spc7_ld3_inst_vld_w2  = `SPARC_CORE7.sparc0.lsu.qctl1.ld3_inst_vld_w2;
   wire spc7_ld3_is_sec_w2 = spc7_ld3_inst_vld_w2 ? spc7_ld_sec_hit_l2access_w2 : 0;


always @(posedge clk)
begin
   spc7_ld0_pkt_vld_tmp_d <= ~rst_l ? 0 : spc7_ld0_pkt_vld_tmp;
   spc7_ld1_pkt_vld_tmp_d <= ~rst_l ? 0 : spc7_ld1_pkt_vld_tmp;
   spc7_ld2_pkt_vld_tmp_d <= ~rst_l ? 0 : spc7_ld2_pkt_vld_tmp;
   spc7_ld3_pkt_vld_tmp_d <= ~rst_l ? 0 : spc7_ld3_pkt_vld_tmp;
end


// Signals for lsu_exu ================================================================================
// wire     spc7_l2      = `SPARC_CORE7.sparc0.lsu.dctl.l2fill_vld_g ;
wire        spc7_unc     = `SPARC_CORE7.sparc0.lsu.dctl.unc_err_trap_g ;
wire        spc7_fpld    = `SPARC_CORE7.sparc0.lsu.dctl.l2fill_fpld_g ;
wire        spc7_fpldst  = `SPARC_CORE7.sparc0.lsu.dctl.fp_ldst_g ;
wire        spc7_unflush = `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed ;
// wire     spc7_ldw     = `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w ;
wire        spc7_byp     = `SPARC_CORE7.sparc0.lsu.dctl.intld_byp_data_vld ;
wire        spc7_flsh    = `SPARC_CORE7.sparc0.lsu.lsu_exu_flush_pipe_w ;
// wire     spc7_chm     = `SPARC_CORE7.sparc0.lsu.dctl.common_ldst_miss_w ;
wire        spc7_ldxa    = `SPARC_CORE7.sparc0.lsu.dctl.ldxa_internal ;
wire        spc7_ato     = `SPARC_CORE7.sparc0.lsu.dctl.atomic_g ;
wire        spc7_pref    = `SPARC_CORE7.sparc0.lsu.dctl.pref_inst_g ;
wire        spc7_chit    = `SPARC_CORE7.sparc0.lsu.dctl.stb_cam_hit ;
// wire     spc7_dcp     = `SPARC_CORE7.sparc0.lsu.dctl.dcache_rd_parity_error ;
wire        spc7_dtp     = `SPARC_CORE7.sparc0.lsu.dctl.dtag_perror_g ;
wire        spc7_mpu     = `SPARC_CORE7.sparc0.lsu.dctl.tte_data_perror_unc_en ;

wire [15:0] spc7_exu_und;
reg  [ 4:0] spc7_exu;
reg spc7_flsh_g;
always @(posedge clk)
begin
  spc7_flsh_g <= `SPARC_CORE7.sparc0.lsu.lsu_exu_flush_pipe_w;
end

reg spc7_byp_g;
always @(posedge clk)
begin
  spc7_byp_g <= `SPARC_CORE7.sparc0.lsu.dctl.intld_byp_data_vld_m;
end


assign spc7_exu_und = {
//spc7_l2,
//  spc7_unc,
  spc7_fpld,
  spc7_fpldst,
  spc7_unflush,
//spc7_ldw,
  spc7_byp_g,
  spc7_flsh_g,
//spc7_chm,
  spc7_ldxa,
  spc7_ato,
  spc7_pref,
  spc7_chit,
//spc7_dcp,
  spc7_dtp,
  spc7_mpu
};

always @(spc7_exu_und)
begin
  case (spc7_exu_und)
    16'h0000 : spc7_exu =  5'h00;
    16'h0101 : spc7_exu =  5'h01;
    16'h0102 : spc7_exu =  5'h02;
    16'h0104 : spc7_exu =  5'h03;
    16'h0008 : spc7_exu =  5'h04;
    16'h0110 : spc7_exu =  5'h05;
    16'h0120 : spc7_exu =  5'h06;
    16'h0040 : spc7_exu =  5'h07;
    16'h0080 : spc7_exu =  5'h08;
    16'h0100 : spc7_exu =  5'h09;
    16'h0200 : spc7_exu =  5'h0a;
    16'h0400 : spc7_exu =  5'h0b;
    //16'h0800 : spc7_exu =  5'h0c;
    default  : spc7_exu =  5'h0c;

//  16'h1000 : spc7_exu =  5'h0d;
//  16'h2000 : spc7_exu =  5'h0e;
//  16'h4000 : spc7_exu =  5'h0f;
//  16'h8000 : spc7_exu =  5'h10;
//  default  : spc7_exu =  5'h11;

  endcase
end


// Signals for lsu_exp ================================================================================
wire        spc7_exp_wtchpt_trp_g             = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_wtchpt_trp_g;
wire        spc7_exp_misalign_addr_ldst_atm_m = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_misalign_addr_ldst_atm_m;
wire        spc7_exp_priv_violtn_g            = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_priv_violtn_g;
wire        spc7_exp_daccess_prot_g           = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_daccess_prot_g;
wire        spc7_exp_priv_action_g            = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_priv_action_g;
wire        spc7_exp_spec_access_epage_g      = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_spec_access_epage_g;
wire        spc7_exp_uncache_atomic_g         = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_uncache_atomic_g;
wire        spc7_exp_illegal_asi_action_g     = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_illegal_asi_action_g;
wire        spc7_exp_flt_ld_nfo_pg_g          = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_tlu_flt_ld_nfo_pg_g;
wire        spc7_exp_tlb_data_ue              = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_ifu_tlb_data_ue;
wire        spc7_exp_tlb_tag_ue               = `SPARC_CORE7.sparc0.lsu.excpctl.lsu_ifu_tlb_tag_ue;
wire        spc7_exp_unc                      = `SPARC_CORE7.sparc0.lsu.excpctl.tte_data_perror_unc;

wire [11:0] spc7_exp_und;
reg  [ 3:0] spc7_exp;

assign spc7_exp_und = {
  spc7_exp_wtchpt_trp_g,
  spc7_exp_misalign_addr_ldst_atm_m,
  spc7_exp_priv_violtn_g,
  spc7_exp_daccess_prot_g,
  spc7_exp_priv_action_g,
  spc7_exp_spec_access_epage_g,
  spc7_exp_uncache_atomic_g,
  spc7_exp_illegal_asi_action_g,
  spc7_exp_flt_ld_nfo_pg_g,
  spc7_exp_tlb_data_ue,
  spc7_exp_tlb_tag_ue,
  spc7_exp_unc
};

always @(spc7_exp_und)
begin
  case (spc7_exp_und)
    12'h000 : spc7_exp =  4'h0;
    12'h001 : spc7_exp =  4'h1;
    12'h002 : spc7_exp =  4'h2;
    12'h004 : spc7_exp =  4'h3;
    12'h008 : spc7_exp =  4'h4;
    12'h010 : spc7_exp =  4'h5;
    12'h020 : spc7_exp =  4'h6;
    12'h040 : spc7_exp =  4'h7;
    12'h080 : spc7_exp =  4'h8;
    12'h100 : spc7_exp =  4'h9;
    12'h200 : spc7_exp =  4'ha;
    12'h400 : spc7_exp =  4'hb;
    12'h800 : spc7_exp =  4'hc;
    default : spc7_exp =  4'hd;
  endcase
end


// Signals for lsu_ld_inf2 ============================================================================
reg spc7_lsu_ifu_ldst_miss_w2;

always @(posedge clk)
begin
  spc7_lsu_ifu_ldst_miss_w2 <= ~rst_l ? 0 : `SPARC_CORE7.sparc0.lsu.lsu_ifu_ldst_miss_w;
end

// Signals for lsu_bld ================================================================================
wire	spc7_lsu_ld_hit_wb;

assign  spc7_lsu_ld_hit_wb   =
((|`SPARC_CORE7.sparc0.lsu.dctl.lsu_way_hit[3:0])  & `SPARC_CORE7.sparc0.lsu.dctl.dcache_enable_g & (`SPARC_CORE7.sparc0.lsu.dctl.tlb_cam_hit_g | `SPARC_CORE7.sparc0.lsu.dctl.lsu_dtlb_bypass_g) &  //bug3702
  ~`SPARC_CORE7.sparc0.lsu.dctl.ldxa_internal & ~`SPARC_CORE7.sparc0.lsu.dctl.dcache_rd_parity_error & ~`SPARC_CORE7.sparc0.lsu.dctl.dtag_perror_g & ~`SPARC_CORE7.sparc0.lsu.dctl.endian_mispred_g &
  ~`SPARC_CORE7.sparc0.lsu.dctl.atomic_g &  ~`SPARC_CORE7.sparc0.lsu.dctl.ncache_asild_rq_g) &  // remove stb_cam_hit
~((`SPARC_CORE7.sparc0.lsu.dctl.dc_diagnstc_asi_g & `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g)) &
  `SPARC_CORE7.sparc0.lsu.dctl.ld_vld & (~`SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g | (`SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE7.sparc0.lsu.dctl.recognized_asi_g)) ;

// Pipe signals to w2 stage so that they can be lined up with
// .qctl1.ld4_sec_hit_w2
reg spc7_lsu_bld_vld_w2;
reg spc7_lsu_bld_hit_w2;
reg spc7_lsu_bld_raw_w2;

always @(posedge clk)
begin
  spc7_lsu_bld_vld_w2 <= `SPARC_CORE7.sparc0.lsu.qctl1.bld_g ;
  spc7_lsu_bld_hit_w2 <= spc7_lsu_ld_hit_wb ;
  spc7_lsu_bld_raw_w2 <= `SPARC_CORE7.sparc0.lsu.stb_cam_hit ;
end


// exu_lsu_ldst_va_e ==================================================================================
// force x's
`ifndef RTL_SPU
always @(`SPARC_CORE7.sparc0.ifu.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE7.sparc0.ifu.ifu.fcl.running_e) begin
      force `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE7.sparc0.ifu.ifu.fcl.running_e) begin
      release `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`else
always @(`SPARC_CORE7.sparc0.ifu.fcl.running_e)
begin
  if (rst_l & forcex_ldst_va) begin
    if (~`SPARC_CORE7.sparc0.ifu.fcl.running_e) begin
      force `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e = 48'bx;
    end
    if (`SPARC_CORE7.sparc0.ifu.fcl.running_e) begin
      release `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e;
    end
  end
end
`endif

// force hit
// always @(`SPARC_CORE7.sparc0.ifu.fcl.running_e)
// begin
//   if (~`SPARC_CORE7.sparc0.ifu.fcl.running_e) begin
//     force `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e = 48'h6000_0000;
//   end
//   if (`SPARC_CORE7.sparc0.ifu.fcl.running_e) begin
//     release `SPARC_CORE7.sparc0.exu_lsu_ldst_va_e;
//   end
// end

////////////////////////////////////////////////////////////////////////////////
// Begin dctl section
////////////////////////////////////////////////////////////////////////////////

// Signals for lsu_dctl_tlbr2p ========================================================================
reg spc7_phy_byp_ec_asi_e;
reg spc7_phy_use_ec_asi_e;
reg spc7_quad_ldd_real_e;
reg spc7_quad_ldd_real_little_e;

always @(posedge clk)
begin
  spc7_phy_byp_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE7.sparc0.lsu.dctl.asi_decode.phy_byp_ec_asi;
  spc7_phy_use_ec_asi_e       <= ~rst_l ? 0 : `SPARC_CORE7.sparc0.lsu.dctl.asi_decode.phy_use_ec_asi;
  spc7_quad_ldd_real_e        <= ~rst_l ? 0 : `SPARC_CORE7.sparc0.lsu.dctl.asi_decode.quad_ldd_real;
  spc7_quad_ldd_real_little_e <= ~rst_l ? 0 : `SPARC_CORE7.sparc0.lsu.dctl.asi_decode.quad_ldd_real_little;
end

// Signals for lsu_dctl_illva =========================================================================
wire spc7_pscxt_ldxa_illgl_va_decode;
wire spc7_lsuctl_illgl_va_decode;
wire spc7_mrgnctl_illgl_va_decode;
wire spc7_asi42_illgl_va_decode;

assign spc7_pscxt_ldxa_illgl_va_decode = (`SPARC_CORE7.sparc0.lsu.dctl.lsu_asi_state == 8'h21) &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc7_lsuctl_illgl_va_decode     = (`SPARC_CORE7.sparc0.lsu.dctl.lsu_asi_state == 8'h45) &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc7_mrgnctl_illgl_va_decode    = (`SPARC_CORE7.sparc0.lsu.dctl.lsu_asi_state == 8'h44) &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w;

assign spc7_asi42_illgl_va_decode      =  `SPARC_CORE7.sparc0.lsu.dctl.asi42_g &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
					     `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w;

// L2 LD Return Errors Monitor =======================================================================
//wire spc7_l2_ld_return_error = `SPARC_CORE7.sparc0.lsu.dctl.l2_unc_error_e &
//                                  `SPARC_CORE7.sparc0.lsu.dctl.l2_corr_error_e;
//always @ (posedge clk)
//begin
//  if (spc7_l2_ld_return_error) begin
//    $display("Error @%d : sparc 7 l2_ld_return_error", $time);
//    if (lsu_mon_rst_l)
//    `MONITOR_PATH.fail("lsu_mon2: l2_ld_return_error");
//  end
//end

//// I commented the above monitor out because it is actually legal for the L2 to set both UE and CE bits in
//// CPX (e.g. LOAD_RET) packets.     -- melvyn, 11/20/03


// IO LD Return Errors Monitor =======================================================================
wire spc7_io_ld_return_error = `SPARC_CORE7.sparc0.lsu.dctl.l2_corr_error_w2 &
                                  `SPARC_CORE7.sparc0.lsu.dctl.lsu_ifu_err_addr_b39;
always @ (posedge clk)
begin
  if (spc7_io_ld_return_error) begin
    $display("Error @%d : sparc 7 io_ld_return_error", $time);
    if (lsu_mon_rst_l)
    `MONITOR_PATH.fail("lsu_mon2: io_ld_return_error");
  end
end

////////////////////////////////////////////////////////////////////////////////
// End of dctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin stb_ctl section
////////////////////////////////////////////////////////////////////////////////
wire [7:0] spc7t0_dec_rptr_pcx_noced;

assign  spc7t0_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[7:0]) &
(({`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[7]} &
  {`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_ack[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_ack[7]})
| ~{`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[7]}
 | `SPARC_CORE7.sparc0.lsu.stb_ctl0.dec_rptr_dfq[7:0]) ;

wire [7:0] spc7t1_dec_rptr_pcx_noced;

assign  spc7t1_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[7:0]) &
(({`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[7]} &
  {`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_ack[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_ack[7]})
| ~{`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[7]}
 | `SPARC_CORE7.sparc0.lsu.stb_ctl1.dec_rptr_dfq[7:0]) ;

wire [7:0] spc7t2_dec_rptr_pcx_noced;

assign  spc7t2_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[7:0]) &
(({`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[7]} &
  {`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_ack[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_ack[7]})
| ~{`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[7]}
 | `SPARC_CORE7.sparc0.lsu.stb_ctl2.dec_rptr_dfq[7:0]) ;

wire [7:0] spc7t3_dec_rptr_pcx_noced;

assign  spc7t3_dec_rptr_pcx_noced[7:0] =
(`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[7:0]) &
(({`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[7]} &
  {`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_ack[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_ack[7]})
| ~{`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[6:0],`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[7]}
 | `SPARC_CORE7.sparc0.lsu.stb_ctl3.dec_rptr_dfq[7:0]) ;


reg [1:0] spc7_stb_cam_cm_tid_d1;
always @ (posedge clk)
begin
  spc7_stb_cam_cm_tid_d1 <= `SPARC_CORE7.sparc0.lsu.stb_cam_cm_tid;
end

wire [7:0] spc7_stb_cam_hit_ptr_dec;
assign spc7_stb_cam_hit_ptr_dec = 1'b1 << `SPARC_CORE7.sparc0.lsu.stb_cam_hit_ptr;


wire [7:0] spc7t0_st_dq1_ld_hit;
assign spc7t0_st_dq1_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl0.dq_vld_d1 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl0.dqptr_d1 & spc7_stb_cam_hit_ptr_dec);

wire [7:0] spc7t0_st_dq2_ld_hit;
assign spc7t0_st_dq2_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl0.dq_vld_d2 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd0)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl0.dqptr_d2 & spc7_stb_cam_hit_ptr_dec);


wire [7:0] spc7t1_st_dq1_ld_hit;
assign spc7t1_st_dq1_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl1.dq_vld_d1 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl1.dqptr_d1 & spc7_stb_cam_hit_ptr_dec);

wire [7:0] spc7t1_st_dq2_ld_hit;
assign spc7t1_st_dq2_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl1.dq_vld_d2 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd1)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl1.dqptr_d2 & spc7_stb_cam_hit_ptr_dec);


wire [7:0] spc7t2_st_dq1_ld_hit;
assign spc7t2_st_dq1_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl2.dq_vld_d1 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl2.dqptr_d1 & spc7_stb_cam_hit_ptr_dec);

wire [7:0] spc7t2_st_dq2_ld_hit;
assign spc7t2_st_dq2_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl2.dq_vld_d2 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd2)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl2.dqptr_d2 & spc7_stb_cam_hit_ptr_dec);


wire [7:0] spc7t3_st_dq1_ld_hit;
assign spc7t3_st_dq1_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl3.dq_vld_d1 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl3.dqptr_d1 & spc7_stb_cam_hit_ptr_dec);

wire [7:0] spc7t3_st_dq2_ld_hit;
assign spc7t3_st_dq2_ld_hit =
{8{(`SPARC_CORE7.sparc0.lsu.stb_ctl3.dq_vld_d2 & `SPARC_CORE7.sparc0.lsu.stb_cam_hit) &
	(spc7_stb_cam_cm_tid_d1 == 2'd3)}} &
(`SPARC_CORE7.sparc0.lsu.stb_ctl3.dqptr_d2 & spc7_stb_cam_hit_ptr_dec);


wire spc7_st_atm_blkst_vld;
assign spc7_st_atm_blkst_vld =
((`SPARC_CORE7.sparc0.lsu.stb_rwctl.st_inst_vld_m | `SPARC_CORE7.sparc0.lsu.stb_rwctl.atomic_m) & `SPARC_CORE7.sparc0.lsu.stb_rwctl.ifu_tlu_inst_vld_m_bf0) | `SPARC_CORE7.sparc0.lsu.stb_rwctl.blkst_m;

reg spc7_qctl1_casa_w2;
reg spc7_stb_cam_vld_w;
always @ (posedge clk)
begin
  spc7_qctl1_casa_w2 <= `SPARC_CORE7.sparc0.lsu.qctl1.casa_g;
  spc7_stb_cam_vld_w <= `SPARC_CORE7.sparc0.lsu.stb_cam.stb_cam_vld;
end


wire spc7_bw_r_scm_error;
assign spc7_bw_r_scm_error =
((spc7_stb_cam_vld_w
  &  `SPARC_CORE7.sparc0.lsu.excpctl.lsu_inst_vld_w
  & ~`SPARC_CORE7.sparc0.lsu.dctl.atomic_g
  & ~`SPARC_CORE7.sparc0.lsu.lsu_exu_flush_pipe_w
  &  `SPARC_CORE7.sparc0.lsu.stb_rwctl.cam_wptr_vld_g) |

 ((|({`SPARC_CORE7.sparc0.lsu.qctl1.st3_pcx_rq_vld,
      `SPARC_CORE7.sparc0.lsu.qctl1.st2_pcx_rq_vld,
      `SPARC_CORE7.sparc0.lsu.qctl1.st1_pcx_rq_vld,
      `SPARC_CORE7.sparc0.lsu.qctl1.st0_pcx_rq_vld} &
      `SPARC_CORE7.sparc0.lsu.qctl1.pcx_rq_for_stb[3:0])) &
  `SPARC_CORE7.sparc0.lsu.stb_cam.stb_cam_wptr_vld));

always @ (posedge clk)
	if (spc7_bw_r_scm_error) begin
		$display("Error @%d : sparc7 LSU bw_r_scm error", $time);
		if (lsu_mon_rst_l)
		`MONITOR_PATH.fail("lsu_mon2: bw_r_scm_error");
	end


////////////////////////////////////////////////////////////////////////////////
// End stb_ctl section
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Begin errors  section
////////////////////////////////////////////////////////////////////////////////
// tlb data perror without instruction vld
wire spc7_tte_data_perror_unc_wo_vld;
assign spc7_tte_data_perror_unc_wo_vld =
  `SPARC_CORE7.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE7.sparc0.lsu.excpctl.tlb_tte_vld_g &
~((`SPARC_CORE7.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE7.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE7.sparc0.lsu.excpctl.lsu_inst_vld_w);

// tlb data perror with flush
wire spc7_tte_data_perror_unc_w_flush;
assign spc7_tte_data_perror_unc_w_flush =
  `SPARC_CORE7.sparc0.lsu.excpctl.tte_data_parity_error & `SPARC_CORE7.sparc0.lsu.excpctl.tlb_tte_vld_g &
(`SPARC_CORE7.sparc0.lsu.excpctl.ld_inst_vld_unflushed | `SPARC_CORE7.sparc0.lsu.excpctl.st_inst_vld_unflushed) & `SPARC_CORE7.sparc0.lsu.excpctl.lsu_inst_vld_w & `SPARC_CORE7.sparc0.lsu.excpctl.lsu_flush_pipe_w;

// dcache tag perror w blk asi
wire spc7_lsu_dcache_tag_perror_g_w_blkasi;
assign spc7_lsu_dcache_tag_perror_g_w_blkasi =
  (|(`SPARC_CORE7.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE7.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g & `SPARC_CORE7.sparc0.lsu.dctl.blk_asi_g);

// dcache tag perror w pgnum39_w_bypass
wire spc7_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass;
assign spc7_lsu_dcache_tag_perror_g_w_pgnum39_w_bypass =
  (|`SPARC_CORE7.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE7.sparc0.lsu.dctl.tlb_pgnum[39] & `SPARC_CORE7.sparc0.lsu.dctl.lsu_dtlb_bypass_g);

// dcache tag perror w pgnum39_wo_bypass
wire spc7_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass;
assign spc7_lsu_dcache_tag_perror_g_w_pgnum39_wo_bypass =
  (|`SPARC_CORE7.sparc0.lsu.dctl.dtag_parity_error[3:0]) & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE7.sparc0.lsu.dctl.tlb_pgnum[39] & (~`SPARC_CORE7.sparc0.lsu.dctl.lsu_dtlb_bypass_g & `SPARC_CORE7.sparc0.lsu.dctl.tlb_cam_hit_g));

// dcache tag perror w atomic
wire spc7_lsu_dcache_tag_perror_g_w_atomic;
assign spc7_lsu_dcache_tag_perror_g_w_atomic =
  (|(`SPARC_CORE7.sparc0.lsu.dctl.dtag_parity_error[3:0] & `SPARC_CORE7.sparc0.lsu.dctl.dva_vld_g[3:0])) & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
   `SPARC_CORE7.sparc0.lsu.dctl.atomic_g;


// dcache data perror wo cacheenable
wire spc7_lsu_dcache_data_perror_g_wo_cacheenable;
assign spc7_lsu_dcache_data_perror_g_wo_cacheenable =
  `SPARC_CORE7.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  ~`SPARC_CORE7.sparc0.lsu.dctl.dcache_enable_g;

// dcache data perror w dtagperror
wire spc7_lsu_dcache_data_perror_g_dtag_perror;
assign spc7_lsu_dcache_data_perror_g_dtag_perror =
  `SPARC_CORE7.sparc0.lsu.dctl.dcache_rd_parity_error & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE7.sparc0.lsu.dctl.dtag_perror_g;

// dcache data perror w altspace
wire spc7_lsu_dcache_data_perror_g_w_altspace;
assign spc7_lsu_dcache_data_perror_g_w_altspace =
  `SPARC_CORE7.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  (`SPARC_CORE7.sparc0.lsu.dctl.asi_internal_g & `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g);

// dcache data perror w atomic
wire spc7_lsu_dcache_data_perror_g_w_atomic;
assign spc7_lsu_dcache_data_perror_g_w_atomic =
  `SPARC_CORE7.sparc0.lsu.dctl.dcache_rparity_err_wb & `SPARC_CORE7.sparc0.lsu.dctl.ld_inst_vld_unflushed & `SPARC_CORE7.sparc0.lsu.dctl.lsu_inst_vld_w &
  `SPARC_CORE7.sparc0.lsu.dctl.atomic_g;

////////////////////////////////////////////////////////////////////////////////
// End errors section
////////////////////////////////////////////////////////////////////////////////

`endif

////////////////////////////////////////////////////////////////////////////////
// begin mlim section 1
// (This is intended to be within the "for (7 = 0; 7 < 8; 7++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

// lsu_dfq_stalls_2ormore_entries
wire spc7_dfq_2ormore_vld_entries;

// lsu_dva_rdwr_sameaddr
reg  spc7_lsu_dtagv_wr_vld_e_d1, spc7_lsu_dtagv_wr_vld_e_d2;

reg  [4:0] spc7_dva_rdaddr_10to6_d1;
wire [15:0] spc7_dva_rd_en_e;
reg  [15:0] spc7_dva_rd_en_e_d1;
wire [15:0] spc7_dva_vld_m_expanded;
reg  [4:0] spc7_dva_wraddr_10to6_d1, spc7_dva_wraddr_10to6_d2;
reg  [15:0] spc7_dva_bit_wr_en_e_d1, spc7_dva_bit_wr_en_e_d2;
reg  spc7_dva_din_e_d1, spc7_dva_din_e_d2;

wire spc7_dva_rdwr_sameline_diffvalue;
wire spc7_dva_rd_wr_sameline_diffvalue;
wire spc7_dva_wr_rd_sameline_diffvalue;

reg [144:0] spc7_dfq_byp_ff_data_d1, spc7_dfq_byp_ff_data_d2;

// lsu_traps
reg spc7_ifu_tlu_inst_vld_w;
reg spc7_ifu_tlu_flush_w;
reg spc7_ifu_mmu_trap_w;
//reg spc7_spu_tlu_rsrv_illgl_w;
reg spc7_exu_lsu_priority_trap_w;
reg spc7_ffu_tlu_ill_inst_w;
reg spc7_ifu_tlu_immu_miss_w;
reg spc7_ifu_tlu_priv_violtn_w;
reg spc7_exu_ifu_va_oor_w;

// lsu_sechit
reg spc7_lsu_way_hit_or_w2, spc7_ncache_pcx_rq_w2;
reg  [7:0] spc7_stb_ld_partial_raw_w2, spc7_stb_ld_partial_raw_w3, spc7_stb_ld_partial_raw_w4;
reg  [7:0] spc7_stb_ld_full_raw_w2, spc7_stb_ld_full_raw_w3, spc7_stb_ld_full_raw_w4;
wire [7:0] spc7_stb_cam_rw_ptr_decode_m;
reg  [7:0] spc7_stb_cam_rw_ptr_decode_w, spc7_stb_cam_rw_ptr_decode_w2;
reg  [7:0] spc7_stb_cam_rw_ptr_decode_w3, spc7_stb_cam_rw_ptr_decode_w4;
wire spc7_t0_ld_st_partialraw_hit;
wire spc7_t0_ld_st_fullraw_hit;
wire spc7_t0_st_ld_partialraw_hit;
wire spc7_t0_st_ld_fullraw_hit;
reg  spc7_ld0_inst_vld_w3, spc7_ld0_inst_vld_w4;
wire spc7_t1_ld_st_partialraw_hit;
wire spc7_t1_ld_st_fullraw_hit;
wire spc7_t1_st_ld_partialraw_hit;
wire spc7_t1_st_ld_fullraw_hit;
reg  spc7_ld1_inst_vld_w3, spc7_ld1_inst_vld_w4;
wire spc7_t2_ld_st_partialraw_hit;
wire spc7_t2_ld_st_fullraw_hit;
wire spc7_t2_st_ld_partialraw_hit;
wire spc7_t2_st_ld_fullraw_hit;
reg  spc7_ld2_inst_vld_w3, spc7_ld2_inst_vld_w4;
wire spc7_t3_ld_st_partialraw_hit;
wire spc7_t3_ld_st_fullraw_hit;
wire spc7_t3_st_ld_partialraw_hit;
wire spc7_t3_st_ld_fullraw_hit;
reg  spc7_ld3_inst_vld_w3, spc7_ld3_inst_vld_w4;
reg  spc7_stb_cam_mhit_w3, spc7_stb_cam_mhit_w4;
reg  spc7_io_ld_w3, spc7_io_ld_w4;

// lsu_picker1, lsu_pick_status; pick status monitor
wire [11:0] spc7_pick_valid_raw, spc7_pick_status, spc7_pick_status_error;
reg  [11:0] spc7_pick_valid_raw_d1, spc7_pick_status_d1;
wire [11:0] spc7_pcx_rq_sel_d2;
reg  [11:0] spc7_pcx_rq_sel_d3;

// lsu_picker2
reg         spc7_fwdpkt_valid_raw;
reg  [3:0]  spc7_st_valid_raw;
wire        spc7_fwdpkt_valid, spc7_pcx_req_squash_d1;
wire [3:0]  spc7_st_valid;
wire [11:0] spc7_pick_valid_raw_h, spc7_pick_valid_h, spc7_pick_valid_h_ext;
reg  [11:0] spc7_pick_valid_h_d1, spc7_pick_valid_h_d2;
wire [4:0]  spc7_pre_qwr, spc7_mcycle_mask_qwr_d1;
wire [11:0] spc7_pick_destbusy_unqual, spc7_pick_atompend_unqual;
wire [11:0] spc7_pick_presented, spc7_pick_destbusy, spc7_pick_atompend;
wire [2:0]  spc7_pick_presented_count, spc7_pick_destbusy_count, spc7_pick_atompend_count;

// lsu_fill_ld_b2b_sameaddr
wire [39:4] spc7_ldfill_addr_w, spc7_ldinst_addr_m;
reg  [10:4] spc7_lsu_dcache_fill_addr_m, spc7_lsu_dcache_fill_addr_w;
wire        spc7_filladdrw_eq_ldaddrm;

// lsu_spu_stxa_ack; stream stxa ack monitor
wire [3:0] spc7_strm_stxa_g;
reg  [3:0] spc7_strm_stxa_w2, spc7_lsu_spu_stb_empty_d1;
reg        spc7_strm_stxa_state;
reg  [3:0] spc7_strm_stxa_tid_decode;


`ifdef RTL_SPARC7

    // lsu_dfq_stalls_2ormore_entries

    assign spc7_dfq_2ormore_vld_entries  = |(`SPARC_CORE7.sparc0.lsu.qctl2.dfq_vld_entries[5:1]);

    // lsu_dva_rdwr_sameaddr

    assign spc7_dva_rd_en_e[15:12]       = {4{(`SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b11)}};
    assign spc7_dva_rd_en_e[11:8]        = {4{(`SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b10)}};
    assign spc7_dva_rd_en_e[7:4]         = {4{(`SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b01)}};
    assign spc7_dva_rd_en_e[3:0]         = {4{(`SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[5:4] == 2'b00)}};

    assign spc7_dva_vld_m_expanded[15:0] = {4{`SPARC_CORE7.sparc0.lsu.dva_vld_m[3:0]}};

    assign spc7_dva_rdwr_sameline_diffvalue =
        (spc7_dva_rdaddr_10to6_d1 == spc7_dva_wraddr_10to6_d1) &    // same addr[10:6]
        |( spc7_dva_rd_en_e_d1 & spc7_dva_bit_wr_en_e_d1 &          // same addr[5:4], wrway(s) only
           (spc7_dva_vld_m_expanded ^ {16{spc7_dva_din_e_d1}}) );   // opposite rd and wr value(s)

    assign spc7_dva_rd_wr_sameline_diffvalue =
        (spc7_dva_rdaddr_10to6_d1 == `SPARC_CORE7.sparc0.lsu.dva_wr_adr_e[10:6]) &
        |( spc7_dva_rd_en_e_d1 & `SPARC_CORE7.sparc0.lsu.dva_bit_wr_en_e &
           (spc7_dva_vld_m_expanded ^ {16{`SPARC_CORE7.sparc0.lsu.dva_din_e}}) );

    assign spc7_dva_wr_rd_sameline_diffvalue =
        (spc7_dva_rdaddr_10to6_d1 == spc7_dva_wraddr_10to6_d2) &
        |( spc7_dva_rd_en_e_d1 & spc7_dva_bit_wr_en_e_d2 &
           (spc7_dva_vld_m_expanded ^ {16{spc7_dva_din_e_d2}}) );

    // lsu_sechit

    assign spc7_stb_cam_rw_ptr_decode_m[7] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b111);
    assign spc7_stb_cam_rw_ptr_decode_m[6] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b110);
    assign spc7_stb_cam_rw_ptr_decode_m[5] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b101);
    assign spc7_stb_cam_rw_ptr_decode_m[4] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b100);
    assign spc7_stb_cam_rw_ptr_decode_m[3] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b011);
    assign spc7_stb_cam_rw_ptr_decode_m[2] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b010);
    assign spc7_stb_cam_rw_ptr_decode_m[1] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b001);
    assign spc7_stb_cam_rw_ptr_decode_m[0] = (`SPARC_CORE7.sparc0.lsu.stb_cam_rw_ptr[2:0] == 3'b000);

    assign spc7_t0_ld_st_partialraw_hit    = |( spc7_stb_ld_partial_raw_w4 & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t0_ld_st_fullraw_hit       = |( spc7_stb_ld_full_raw_w4    & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t0_st_ld_partialraw_hit    = |( spc7_stb_ld_partial_raw_w2 & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t0_st_ld_fullraw_hit       = |( spc7_stb_ld_full_raw_w2    & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t1_ld_st_partialraw_hit    = |( spc7_stb_ld_partial_raw_w4 & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t1_ld_st_fullraw_hit       = |( spc7_stb_ld_full_raw_w4    & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t1_st_ld_partialraw_hit    = |( spc7_stb_ld_partial_raw_w2 & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t1_st_ld_fullraw_hit       = |( spc7_stb_ld_full_raw_w2    & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t2_ld_st_partialraw_hit    = |( spc7_stb_ld_partial_raw_w4 & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t2_ld_st_fullraw_hit       = |( spc7_stb_ld_full_raw_w4    & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t2_st_ld_partialraw_hit    = |( spc7_stb_ld_partial_raw_w2 & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t2_st_ld_fullraw_hit       = |( spc7_stb_ld_full_raw_w2    & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t3_ld_st_partialraw_hit    = |( spc7_stb_ld_partial_raw_w4 & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t3_ld_st_fullraw_hit       = |( spc7_stb_ld_full_raw_w4    & spc7_stb_cam_rw_ptr_decode_w4 );
    assign spc7_t3_st_ld_partialraw_hit    = |( spc7_stb_ld_partial_raw_w2 & spc7_stb_cam_rw_ptr_decode_w2 );
    assign spc7_t3_st_ld_fullraw_hit       = |( spc7_stb_ld_full_raw_w2    & spc7_stb_cam_rw_ptr_decode_w2 );

    // lsu_picker1 coverage object, lsu_pick_status coverage object; pick status monitor

    assign spc7_pick_valid_raw[11:0] = {`SPARC_CORE7.sparc0.lsu.qctl1.misc_events_raw[3:0],
                                           `SPARC_CORE7.sparc0.lsu.qctl1.st_events_raw[3:0],
                                           `SPARC_CORE7.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc7_pick_status[11:0] = {`SPARC_CORE7.sparc0.lsu.qctl1.misc_thrd_pick_status[3:0],
                                        `SPARC_CORE7.sparc0.lsu.qctl1.st_thrd_pick_status[3:0],
                                        `SPARC_CORE7.sparc0.lsu.qctl1.ld_thrd_pick_status[3:0]};

    assign spc7_pcx_rq_sel_d2[11:0] = {`SPARC_CORE7.sparc0.lsu.qctl1.strm_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.fpop_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.intrpt_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pcx_rq_sel_d2,
                                          `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pcx_rq_sel_d2};

    assign spc7_pick_status_error = ~spc7_pick_valid_raw & spc7_pick_valid_raw_d1 &  // valid_raw negedge
                                       spc7_pcx_rq_sel_d3 &                                // request was picked
                                       ~( spc7_pick_status |                               // pick_status = 1 or -> 1
                                          {12{~|spc7_pick_status}} );                      // pick_status[11:0] -> 0

    // lsu_picker2 coverage object

    assign spc7_pcx_req_squash_d1 = `SPARC_CORE7.sparc0.lsu.qctl1.pcx_req_squash_d1;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc7_fwdpkt_valid_raw  <= 1'b0;
            spc7_st_valid_raw[3:0] <= 4'b0;
        end
        else begin
            spc7_fwdpkt_valid_raw <= (`SPARC_CORE7.sparc0.lsu.qctl1.lsu_fwdpkt_vld | spc7_fwdpkt_valid_raw) &
                                        ~(`SPARC_CORE7.sparc0.lsu.qctl1.fwdpkt_pcx_rq_sel_d2 & ~spc7_pcx_req_squash_d1);

            spc7_st_valid_raw[3]  <= (`SPARC_CORE7.sparc0.lsu.qctl1.stb_rd_for_pcx[3] | spc7_st_valid_raw[3]) &
                                        ~(`SPARC_CORE7.sparc0.lsu.qctl1.st3_pcx_rq_sel_d2 & ~spc7_pcx_req_squash_d1);
            spc7_st_valid_raw[2]  <= (`SPARC_CORE7.sparc0.lsu.qctl1.stb_rd_for_pcx[2] | spc7_st_valid_raw[2]) &
                                        ~(`SPARC_CORE7.sparc0.lsu.qctl1.st2_pcx_rq_sel_d2 & ~spc7_pcx_req_squash_d1);
            spc7_st_valid_raw[1]  <= (`SPARC_CORE7.sparc0.lsu.qctl1.stb_rd_for_pcx[1] | spc7_st_valid_raw[1]) &
                                        ~(`SPARC_CORE7.sparc0.lsu.qctl1.st1_pcx_rq_sel_d2 & ~spc7_pcx_req_squash_d1);
            spc7_st_valid_raw[0]  <= (`SPARC_CORE7.sparc0.lsu.qctl1.stb_rd_for_pcx[0] | spc7_st_valid_raw[0]) &
                                        ~(`SPARC_CORE7.sparc0.lsu.qctl1.st0_pcx_rq_sel_d2 & ~spc7_pcx_req_squash_d1);

            spc7_pick_valid_h_d1  <= spc7_pick_valid_h;
            spc7_pick_valid_h_d2  <= spc7_pick_valid_h_d1;
        end
    end

    assign spc7_fwdpkt_valid = spc7_fwdpkt_valid_raw & |(`SPARC_CORE7.sparc0.lsu.qctl1.queue_write[4:0] &
                                                               `SPARC_CORE7.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);

    assign spc7_st_valid[3]  = spc7_st_valid_raw[3] & |(`SPARC_CORE7.sparc0.lsu.qctl1.st3_q_wr[4:0] &
                                                              `SPARC_CORE7.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc7_st_valid[2]  = spc7_st_valid_raw[2] & |(`SPARC_CORE7.sparc0.lsu.qctl1.st2_q_wr[4:0] &
                                                              `SPARC_CORE7.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc7_st_valid[1]  = spc7_st_valid_raw[1] & |(`SPARC_CORE7.sparc0.lsu.qctl1.st1_q_wr[4:0] &
                                                              `SPARC_CORE7.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc7_st_valid[0]  = spc7_st_valid_raw[0] & |(`SPARC_CORE7.sparc0.lsu.qctl1.st0_q_wr[4:0] &
                                                              `SPARC_CORE7.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);

    assign spc7_pick_valid_raw_h[11:0] = {`SPARC_CORE7.sparc0.lsu.qctl1.misc_events_raw[3:1], spc7_fwdpkt_valid_raw,
                                             spc7_st_valid_raw[3:0],
                                             `SPARC_CORE7.sparc0.lsu.qctl1.ld_events_raw[3:0]};

    assign spc7_pick_valid_h[11:0] = {`SPARC_CORE7.sparc0.lsu.qctl1.strm_pcx_rq_vld,
                                         `SPARC_CORE7.sparc0.lsu.qctl1.fpop_pcx_rq_vld,
                                         `SPARC_CORE7.sparc0.lsu.qctl1.intrpt_pcx_rq_vld,
                                         spc7_fwdpkt_valid,
                                         spc7_st_valid[3:0],
                                         `SPARC_CORE7.sparc0.lsu.qctl1.ld3_pcx_rq_vld,
                                         `SPARC_CORE7.sparc0.lsu.qctl1.ld2_pcx_rq_vld,
                                         `SPARC_CORE7.sparc0.lsu.qctl1.ld1_pcx_rq_vld,
                                         `SPARC_CORE7.sparc0.lsu.qctl1.ld0_pcx_rq_vld};

    assign spc7_pick_valid_h_ext[11:0] = spc7_pick_valid_h | spc7_pick_valid_h_d1 | spc7_pick_valid_h_d2;

    assign spc7_pre_qwr[4:0] = `SPARC_CORE7.sparc0.lsu.qctl1.pre_qwr[4:0];

    assign spc7_pick_destbusy_unqual[11] = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[10] = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[9]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[8]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc7_pick_destbusy_unqual[7]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[6]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[5]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[4]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[3]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[2]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[1]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc7_pick_destbusy_unqual[0]  = ~|(spc7_pre_qwr[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc7_mcycle_mask_qwr_d1[4:0] = `SPARC_CORE7.sparc0.lsu.qctl1.mcycle_mask_qwr_d1[4:0];

    assign spc7_pick_atompend_unqual[11] = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.strm_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[10] = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.fpop_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[9]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.intrpt_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[8]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.fwdpkt_dest_d1[4:0]);
    assign spc7_pick_atompend_unqual[7]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st3_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[6]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st2_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[5]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st1_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[4]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.st0_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[3]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld3_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[2]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld2_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[1]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld1_l2bnk_dest[4:0]);
    assign spc7_pick_atompend_unqual[0]  = ~|(~spc7_mcycle_mask_qwr_d1[4:0] & `SPARC_CORE7.sparc0.lsu.qctl1.ld0_l2bnk_dest[4:0]);

    assign spc7_pick_presented = spc7_pick_valid_raw_h &  spc7_pick_valid_h_ext;
    assign spc7_pick_destbusy  = spc7_pick_valid_raw_h & ~spc7_pick_valid_h_ext & spc7_pick_destbusy_unqual;
    assign spc7_pick_atompend  = spc7_pick_valid_raw_h & ~spc7_pick_valid_h_ext & spc7_pick_atompend_unqual;

    count12bits C7_presented_count(
        .in  (spc7_pick_presented),
        .out (spc7_pick_presented_count)  // {numbits>2, numbits>1, numbits>0}
    );
    count12bits C7_destbusy_count(
        .in  (spc7_pick_destbusy),
        .out (spc7_pick_destbusy_count)
    );
    count12bits C7_atompend_count(
        .in  (spc7_pick_atompend),
        .out (spc7_pick_atompend_count)
    );

    // lsu_fill_ld_b2b_sameaddr

    assign spc7_ldfill_addr_w[39:4]    = {`SPARC_CORE7.sparc0.lsu.dctldp.error_pa_g[28:0],
                                             spc7_lsu_dcache_fill_addr_w[10:4]};
    assign spc7_ldinst_addr_m[39:4]    = {`SPARC_CORE7.sparc0.lsu.tlb_pgnum_crit[39:10],
                                             `SPARC_CORE7.sparc0.lsu.dctldp.ldst_va_m[9:4]};
    assign spc7_filladdrw_eq_ldaddrm   = (spc7_ldfill_addr_w[39:4] == spc7_ldinst_addr_m[39:4]);

    // lsu_spu_stxa_ack; stream stxa ack monitor

    assign spc7_strm_stxa_g[3] = `SPARC_CORE7.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE7.sparc0.lsu.qctl1.thrid_g == 2'b11);
    assign spc7_strm_stxa_g[2] = `SPARC_CORE7.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE7.sparc0.lsu.qctl1.thrid_g == 2'b10);
    assign spc7_strm_stxa_g[1] = `SPARC_CORE7.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE7.sparc0.lsu.qctl1.thrid_g == 2'b01);
    assign spc7_strm_stxa_g[0] = `SPARC_CORE7.sparc0.lsu.dctl.st_inst_vld_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.lsu_alt_space_g &
                                    `SPARC_CORE7.sparc0.lsu.dctl.stxa_stall_asi_g &
                                    (`SPARC_CORE7.sparc0.lsu.qctl1.thrid_g == 2'b00);

    // flop signals

    always @(posedge clk) begin
        spc7_lsu_dtagv_wr_vld_e_d1    <= `SPARC_CORE7.sparc0.lsu.lsu_dtagv_wr_vld_e;
        spc7_lsu_dtagv_wr_vld_e_d2    <= spc7_lsu_dtagv_wr_vld_e_d1;

        spc7_dva_rdaddr_10to6_d1      <= `SPARC_CORE7.sparc0.lsu.exu_lsu_early_va_e[10:6];

        spc7_dva_rd_en_e_d1           <= spc7_dva_rd_en_e;

        spc7_dva_wraddr_10to6_d1      <= `SPARC_CORE7.sparc0.lsu.dva_wr_adr_e[10:6];
        spc7_dva_wraddr_10to6_d2      <= spc7_dva_wraddr_10to6_d1;

        spc7_dva_bit_wr_en_e_d1       <= `SPARC_CORE7.sparc0.lsu.dva_bit_wr_en_e;
        spc7_dva_bit_wr_en_e_d2       <= spc7_dva_bit_wr_en_e_d1;

        spc7_dva_din_e_d1             <= `SPARC_CORE7.sparc0.lsu.dva_din_e;
        spc7_dva_din_e_d2             <= spc7_dva_din_e_d1;

        spc7_dfq_byp_ff_data_d1       <= `SPARC_CORE7.sparc0.lsu.qdp2.dfq_byp_ff_data[144:0];
        spc7_dfq_byp_ff_data_d2       <= spc7_dfq_byp_ff_data_d1;

        spc7_ifu_tlu_inst_vld_w       <= `SPARC_CORE7.sparc0.ifu_tlu_inst_vld_m;
        spc7_ifu_tlu_flush_w          <= `SPARC_CORE7.sparc0.ifu_tlu_flush_m;
        spc7_ifu_mmu_trap_w           <= `SPARC_CORE7.sparc0.ifu_mmu_trap_m;
//        spc7_spu_tlu_rsrv_illgl_w     <= `SPARC_CORE7.sparc0.spu_tlu_rsrv_illgl_m;
        spc7_exu_lsu_priority_trap_w  <= `SPARC_CORE7.sparc0.exu_lsu_priority_trap_m;
        spc7_ffu_tlu_ill_inst_w       <= `SPARC_CORE7.sparc0.ffu_tlu_ill_inst_m;
        spc7_ifu_tlu_immu_miss_w      <= `SPARC_CORE7.sparc0.ifu_tlu_immu_miss_m;
        spc7_ifu_tlu_priv_violtn_w    <= `SPARC_CORE7.sparc0.ifu_tlu_priv_violtn_m;
        spc7_exu_ifu_va_oor_w         <= `SPARC_CORE7.sparc0.exu_ifu_va_oor_m;

        spc7_lsu_way_hit_or_w2        <= `SPARC_CORE7.sparc0.lsu.dctl.lsu_way_hit_or;
        spc7_ncache_pcx_rq_w2         <= `SPARC_CORE7.sparc0.lsu.dctl.ncache_pcx_rq_g;

        spc7_stb_ld_partial_raw_w2    <= `SPARC_CORE7.sparc0.lsu.stb_ld_partial_raw;
        spc7_stb_ld_partial_raw_w3    <= spc7_stb_ld_partial_raw_w2;
        spc7_stb_ld_partial_raw_w4    <= spc7_stb_ld_partial_raw_w3;
        spc7_stb_ld_full_raw_w2       <= `SPARC_CORE7.sparc0.lsu.stb_ld_full_raw;
        spc7_stb_ld_full_raw_w3       <= spc7_stb_ld_full_raw_w2;
        spc7_stb_ld_full_raw_w4       <= spc7_stb_ld_full_raw_w3;
        spc7_stb_cam_rw_ptr_decode_w  <= spc7_stb_cam_rw_ptr_decode_m;
        spc7_stb_cam_rw_ptr_decode_w2 <= spc7_stb_cam_rw_ptr_decode_w;
        spc7_stb_cam_rw_ptr_decode_w3 <= spc7_stb_cam_rw_ptr_decode_w2;
        spc7_stb_cam_rw_ptr_decode_w4 <= spc7_stb_cam_rw_ptr_decode_w3;
        spc7_ld0_inst_vld_w3       <= `SPARC_CORE7.sparc0.lsu.qctl1.ld0_inst_vld_w2;
        spc7_ld0_inst_vld_w4       <= spc7_ld0_inst_vld_w3;
        spc7_ld1_inst_vld_w3       <= `SPARC_CORE7.sparc0.lsu.qctl1.ld1_inst_vld_w2;
        spc7_ld1_inst_vld_w4       <= spc7_ld1_inst_vld_w3;
        spc7_ld2_inst_vld_w3       <= `SPARC_CORE7.sparc0.lsu.qctl1.ld2_inst_vld_w2;
        spc7_ld2_inst_vld_w4       <= spc7_ld2_inst_vld_w3;
        spc7_ld3_inst_vld_w3       <= `SPARC_CORE7.sparc0.lsu.qctl1.ld3_inst_vld_w2;
        spc7_ld3_inst_vld_w4       <= spc7_ld3_inst_vld_w3;
        spc7_stb_cam_mhit_w3          <= `SPARC_CORE7.sparc0.lsu.qctl1.stb_cam_mhit_w2;
        spc7_stb_cam_mhit_w4          <= spc7_stb_cam_mhit_w3;
        spc7_io_ld_w3                 <= `SPARC_CORE7.sparc0.lsu.qctl1.io_ld_w2;
        spc7_io_ld_w4                 <= spc7_io_ld_w3;

        spc7_pick_valid_raw_d1        <= spc7_pick_valid_raw;
        spc7_pick_status_d1           <= spc7_pick_status;
        spc7_pcx_rq_sel_d3            <= spc7_pcx_rq_sel_d2;

        spc7_lsu_dcache_fill_addr_m[10:4] <= `SPARC_CORE7.sparc0.lsu.lsu_dcache_fill_addr_e[10:4];
        spc7_lsu_dcache_fill_addr_w[10:4] <= spc7_lsu_dcache_fill_addr_m[10:4];

        spc7_strm_stxa_w2             <= spc7_strm_stxa_g;
        spc7_lsu_spu_stb_empty_d1     <= `SPARC_CORE7.sparc0.lsu.lsu_spu_stb_empty;
    end


    // pick status monitor

    always @(posedge clk) begin
        // if negedge valid_raw[N] 2 cycles after source N is picked, then either
        // pick_status[N] must be already high or pick_status[N] becomes high or
        // pick_status[11:0] must be reset
        if( |spc7_pick_status_error ) begin
          $display("Error @%d : sparc 7 pick_status not set properly: %b", $time, spc7_pick_status_error);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not set properly");
        end

        // if (valid_raw & ~pick_status) == 0, pick_status should be reset
        if( ~|(spc7_pick_valid_raw_d1 & ~spc7_pick_status_d1) & |spc7_pick_status ) begin
          $display("Error @%d : sparc 7 pick_status not reset properly", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status not reset properly");
        end

        // all bits of pick_status should be reset simultaneously
        if( |(~spc7_pick_status & spc7_pick_status_d1) & |spc7_pick_status ) begin
          $display("Error @%d : sparc 7 pick_status bits not reset simultaneously", $time);
          if(lsu_mon_rst_l)
              `MONITOR_PATH.fail("lsu_mon2: pick_status bits not reset simultaneously");
        end
    end


    // stream stxa ack monitor

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc7_strm_stxa_state      <= 1'b0;
            spc7_strm_stxa_tid_decode <= 4'b0;
        end
        else begin
            // IDLE state (1'b0)
            if(spc7_strm_stxa_state == 1'b0) begin
                // Stream stxa from thread whose STB is not empty
                if( |(spc7_strm_stxa_w2 & ~spc7_lsu_spu_stb_empty_d1) ) begin
                    spc7_strm_stxa_state      <= 1'b1;
                    spc7_strm_stxa_tid_decode <= spc7_strm_stxa_w2;
                end
            end

            // ACK_WAIT state (1'b1)
            else begin
`ifndef RTL_SPU
`else
                // stxa ack received from SPU (in g2/w2)
                if(`SPARC_CORE7.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_g2) begin
                    // stream operation aborted
                    if(|spc7_strm_stxa_w2) begin
                        // check that the correct thread is being acked
                        if( `SPARC_CORE7.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc7_strm_stxa_tid_decode[3] | spc7_strm_stxa_tid_decode[2]),
                             (spc7_strm_stxa_tid_decode[3] | spc7_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 7 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc7_strm_stxa_tid_decode = spc7_strm_stxa_w2;
                    end
                    // stream operation not aborted
                    else begin
                        // check that the STB of the thread being acked is empty
                        if( |(spc7_strm_stxa_tid_decode & ~spc7_lsu_spu_stb_empty_d1) ) begin
                            $display("Error @%d : sparc 7 spu_lsu_stxa_ack=1 when STB is not empty", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack=1 when STB is not empty");
                        end
                        // check that the correct thread is being acked
                        if( `SPARC_CORE7.sparc0.spu.spu_ctl.spu_mactl.spu_lsu_stxa_ack_tid !=
                            {(spc7_strm_stxa_tid_decode[3] | spc7_strm_stxa_tid_decode[2]),
                             (spc7_strm_stxa_tid_decode[3] | spc7_strm_stxa_tid_decode[1])} ) begin
                            $display("Error @%d : sparc 7 spu_lsu_stxa_ack_tid is wrong", $time);
                            if(lsu_mon_rst_l)
                                `MONITOR_PATH.fail("lsu_mon2: spu_lsu_stxa_ack_tid is wrong");
                        end
                        spc7_strm_stxa_state      = 1'b0;
                        spc7_strm_stxa_tid_decode = 4'b0;
                    end
                end
`endif
            end
        end
    end


    // coverage cases for logic related to Bug 6372 (lsu_ifill_pkt_vld)
    always @(posedge clk) begin
        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_invwy_vld &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.dfq_byp_ff_en ) begin
            $display("@%d Error: C7 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0", $time);
            if(lsu_mon_rst_l)
                `MONITOR_PATH.fail("lsu_mon2: C7 lsu_ifill_pkt_vld=1 for IFILL with dinv while dfq_byp_ff_en=0");
        end
/*
        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~(`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_rdata_st_ack_type &
             `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_rdata_stack_dcfill_vld) ) begin
            $display("@%d bug6372_1a: C7 dfq_rptr_vld_d1 & ~(lsu_dfq_rdata_st_ack_type & lsu_dfq_rdata_stack_dcfill_vld)", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.ifill_dinv_head_of_dfq_pend ) begin
            $display("@%d bug6372_1b: C7 dfq_rptr_vld_d1 & ~ifill_dinv_head_of_dfq_pend", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_1c: C7 dfq_rptr_vld_d1 & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_ifill_pkt_vld &
            `SPARC_CORE7.sparc0.lsu.qctl2.ifill_pkt_fwd_done &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.ifill_pkt_fwd_done_d1 ) begin
            $display("@%d bug6372_2: C7 lsu_ifill_pkt_vld & ifill_pkt_fwd_done & ~ifill_pkt_fwd_done_d1", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE7.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3a: C7 Local store in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_3b: C7 Local store in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_3c: C7 Local store in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3d: C7 Local store in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_st_vld & // local store in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_3e: C7 Local store in dfq_byp_ff, Flush at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
            `SPARC_CORE7.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4a: C7 Invalidate in dfq_byp_ff, Local store at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[2] &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.local_pkt ) begin
            $display("@%d bug6372_4b: C7 Invalidate in dfq_byp_ff, foreign store at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[4] &
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_invwy_vld ) begin
            $display("@%d bug6372_4c: C7 Invalidate in dfq_byp_ff, Ifill_dinv at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
           ~`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4d: C7 Invalidate in dfq_byp_ff, Int at head of DFQ", $time);
        end

        if( `SPARC_CORE7.sparc0.lsu.qctl2.dfq_inv_vld & // ifill_dinv,evict,foreign st,strst_inv in dfq_byp_ff
            `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rd_vld_d1 &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_type[0] &
            `SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_flush ) begin
            $display("@%d bug6372_4e: C7 Invalidate in dfq_byp_ff, Flush at head of DFQ", $time);
        end
*/
    end


    // checks for Bugs 7018, 7117 (RMO store pended by TSO store but RMO store clears STB valid bit first)
    reg [3:0] spc7_i, spc7_j;
    wire [7:0] spc7_stb0_valid, spc7_stb1_valid, spc7_stb2_valid, spc7_stb3_valid;

    assign spc7_stb0_valid[7:0] = `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_vld[7:0];
    assign spc7_stb1_valid[7:0] = `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_vld[7:0];
    assign spc7_stb2_valid[7:0] = `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_vld[7:0];
    assign spc7_stb3_valid[7:0] = `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_vld[7:0];


    wire spc7_st0_rd_advance, spc7_st1_rd_advance, spc7_st2_rd_advance, spc7_st3_rd_advance;
    reg spc7_flshinst0_rst_d1, spc7_flshinst1_rst_d1, spc7_flshinst2_rst_d1, spc7_flshinst3_rst_d1;
    reg spc7_st0_rd_advance_d1, spc7_st1_rd_advance_d1, spc7_st2_rd_advance_d1, spc7_st3_rd_advance_d1;
    reg spc7_st0_rd_advance_d2, spc7_st1_rd_advance_d2, spc7_st2_rd_advance_d2, spc7_st3_rd_advance_d2;
    reg spc7_st0_rd_advance_d3, spc7_st1_rd_advance_d3, spc7_st2_rd_advance_d3, spc7_st3_rd_advance_d3;
    reg spc7_st0_rd_advance_d4, spc7_st1_rd_advance_d4, spc7_st2_rd_advance_d4, spc7_st3_rd_advance_d4;

/***************************
    assign spc7_st0_rd_advance =  `SPARC_CORE7.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE7.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 0);
    assign spc7_st1_rd_advance =  `SPARC_CORE7.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE7.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 1);
    assign spc7_st2_rd_advance =  `SPARC_CORE7.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE7.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 2);
    assign spc7_st3_rd_advance =  `SPARC_CORE7.sparc0.lsu.qctl2.st_rd_advance &
                                     `SPARC_CORE7.sparc0.lsu.qctl2.dfq_rptr_vld_d1 &
                                   ~(`SPARC_CORE7.sparc0.lsu.qctl2.reset) &
                                    (`SPARC_CORE7.sparc0.lsu.qctl2.lsu_dfq_byp_tid[1:0] == 3);

***************************/

    assign spc7_st0_rd_advance =  `SPARC_CORE7.sparc0.lsu.stb_ctl0.st_ack_dq_stb;
    assign spc7_st1_rd_advance =  `SPARC_CORE7.sparc0.lsu.stb_ctl1.st_ack_dq_stb;
    assign spc7_st2_rd_advance =  `SPARC_CORE7.sparc0.lsu.stb_ctl2.st_ack_dq_stb;
    assign spc7_st3_rd_advance =  `SPARC_CORE7.sparc0.lsu.stb_ctl3.st_ack_dq_stb;

    always @(posedge clk) begin
        if(~lsu_mon_rst_l) begin
            spc7_flshinst0_rst_d1  <= 1'b0;
            spc7_st0_rd_advance_d1 <= 1'b0;
            spc7_st0_rd_advance_d2 <= 1'b0;
            spc7_st0_rd_advance_d3 <= 1'b0;
            spc7_st0_rd_advance_d4 <= 1'b0;

            spc7_flshinst1_rst_d1  <= 1'b0;
            spc7_st1_rd_advance_d1 <= 1'b0;
            spc7_st1_rd_advance_d2 <= 1'b0;
            spc7_st1_rd_advance_d3 <= 1'b0;
            spc7_st1_rd_advance_d4 <= 1'b0;

            spc7_flshinst2_rst_d1  <= 1'b0;
            spc7_st2_rd_advance_d1 <= 1'b0;
            spc7_st2_rd_advance_d2 <= 1'b0;
            spc7_st2_rd_advance_d3 <= 1'b0;
            spc7_st2_rd_advance_d4 <= 1'b0;

            spc7_flshinst3_rst_d1  <= 1'b0;
            spc7_st3_rd_advance_d1 <= 1'b0;
            spc7_st3_rd_advance_d2 <= 1'b0;
            spc7_st3_rd_advance_d3 <= 1'b0;
            spc7_st3_rd_advance_d4 <= 1'b0;

        end
        else begin
            spc7_flshinst0_rst_d1  <= `SPARC_CORE7.sparc0.lsu.stb_ctl0.flshinst_rst;
            spc7_st0_rd_advance_d1 <= spc7_st0_rd_advance;
            spc7_st0_rd_advance_d2 <= spc7_st0_rd_advance_d1;
            spc7_st0_rd_advance_d3 <= spc7_st0_rd_advance_d2;
            spc7_st0_rd_advance_d4 <= spc7_st0_rd_advance_d3;

            spc7_flshinst1_rst_d1  <= `SPARC_CORE7.sparc0.lsu.stb_ctl1.flshinst_rst;
            spc7_st1_rd_advance_d1 <= spc7_st1_rd_advance;
            spc7_st1_rd_advance_d2 <= spc7_st1_rd_advance_d1;
            spc7_st1_rd_advance_d3 <= spc7_st1_rd_advance_d2;
            spc7_st1_rd_advance_d4 <= spc7_st1_rd_advance_d3;

            spc7_flshinst2_rst_d1  <= `SPARC_CORE7.sparc0.lsu.stb_ctl2.flshinst_rst;
            spc7_st2_rd_advance_d1 <= spc7_st2_rd_advance;
            spc7_st2_rd_advance_d2 <= spc7_st2_rd_advance_d1;
            spc7_st2_rd_advance_d3 <= spc7_st2_rd_advance_d2;
            spc7_st2_rd_advance_d4 <= spc7_st2_rd_advance_d3;

            spc7_flshinst3_rst_d1  <= `SPARC_CORE7.sparc0.lsu.stb_ctl3.flshinst_rst;
            spc7_st3_rd_advance_d1 <= spc7_st3_rd_advance;
            spc7_st3_rd_advance_d2 <= spc7_st3_rd_advance_d1;
            spc7_st3_rd_advance_d3 <= spc7_st3_rd_advance_d2;
            spc7_st3_rd_advance_d4 <= spc7_st3_rd_advance_d3;


            // check that STB valid bits are contiguous
            spc7_j = 0;
            for(spc7_i=0; spc7_i<7; spc7_i=spc7_i+1) begin
                if(spc7_stb0_valid[spc7_i+1] != spc7_stb0_valid[spc7_i]) begin
                    spc7_j = spc7_j + 1;
                end
            end
            if(spc7_j > 2) begin
                $display("@%d Bug 7117: Error: C7 STB0 valid bits not contiguous: %b", $time, spc7_stb0_valid);
                `MONITOR_PATH.fail("Bug 7117: C7 STB0 valid bits not contiguous");
            end

            spc7_j = 0;
            for(spc7_i=0; spc7_i<7; spc7_i=spc7_i+1) begin
                if(spc7_stb1_valid[spc7_i+1] != spc7_stb1_valid[spc7_i]) begin
                    spc7_j = spc7_j + 1;
                end
            end
            if(spc7_j > 2) begin
                $display("@%d Bug 7117: Error: C7 STB1 valid bits not contiguous: %b", $time, spc7_stb1_valid);
                `MONITOR_PATH.fail("Bug 7117: C7 STB1 valid bits not contiguous");
            end

            spc7_j = 0;
            for(spc7_i=0; spc7_i<7; spc7_i=spc7_i+1) begin
                if(spc7_stb2_valid[spc7_i+1] != spc7_stb2_valid[spc7_i]) begin
                    spc7_j = spc7_j + 1;
                end
            end
            if(spc7_j > 2) begin
                $display("@%d Bug 7117: Error: C7 STB2 valid bits not contiguous: %b", $time, spc7_stb2_valid);
                `MONITOR_PATH.fail("Bug 7117: C7 STB2 valid bits not contiguous");
            end

            spc7_j = 0;
            for(spc7_i=0; spc7_i<7; spc7_i=spc7_i+1) begin
                if(spc7_stb3_valid[spc7_i+1] != spc7_stb3_valid[spc7_i]) begin
                    spc7_j = spc7_j + 1;
                end
            end
            if(spc7_j > 2) begin
                $display("@%d Bug 7117: Error: C7 STB3 valid bits not contiguous: %b", $time, spc7_stb3_valid);
                `MONITOR_PATH.fail("Bug 7117: C7 STB3 valid bits not contiguous");
            end


            // check that the STB valid bit being reset is equal to 1
            if( `SPARC_CORE7.sparc0.lsu.stb_ctl0.rst_l &
                ~spc7_flshinst0_rst_d1 &
                ~(`SPARC_CORE7.sparc0.lsu.stb_ctl0.st_vld_squash_w2) &
                |(`SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_rst) &
               ~|(spc7_stb0_valid & `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C7 STB0 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc7_stb0_valid, `SPARC_CORE7.sparc0.lsu.stb_ctl0.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C7 STB0 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE7.sparc0.lsu.stb_ctl1.rst_l &
                ~spc7_flshinst1_rst_d1 &
                ~(`SPARC_CORE7.sparc0.lsu.stb_ctl1.st_vld_squash_w2) &
                |(`SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_rst) &
               ~|(spc7_stb1_valid & `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C7 STB1 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc7_stb1_valid, `SPARC_CORE7.sparc0.lsu.stb_ctl1.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C7 STB1 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE7.sparc0.lsu.stb_ctl2.rst_l &
                ~spc7_flshinst2_rst_d1 &
                ~(`SPARC_CORE7.sparc0.lsu.stb_ctl2.st_vld_squash_w2) &
                |(`SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_rst) &
               ~|(spc7_stb2_valid & `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C7 STB2 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc7_stb2_valid, `SPARC_CORE7.sparc0.lsu.stb_ctl2.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C7 STB2 resetting valid bit that is not 1");
            end

            if( `SPARC_CORE7.sparc0.lsu.stb_ctl3.rst_l &
                ~spc7_flshinst3_rst_d1 &
                ~(`SPARC_CORE7.sparc0.lsu.stb_ctl3.st_vld_squash_w2) &
                |(`SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_rst) &
               ~|(spc7_stb3_valid & `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_rst) ) begin
                $display("@%d Bug 7117: Error: C7 STB3 resetting valid bit that is not 1: valid=%b, reset=%b",
                          $time, spc7_stb3_valid, `SPARC_CORE7.sparc0.lsu.stb_ctl3.stb_state_rst);
                `MONITOR_PATH.fail("Bug 7117: C7 STB3 resetting valid bit that is not 1");
            end


            // detect local store acks from the same thread popping off the DFQ 0, 1, 2, or 3 cycles apart
            if(spc7_st0_rd_advance_d1 & spc7_st0_rd_advance) begin
                $display("@%d Bug 7117: C7T0 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc7_st0_rd_advance_d2 & spc7_st0_rd_advance) begin
                $display("@%d Bug 7117: C7T0 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc7_st0_rd_advance_d3 & spc7_st0_rd_advance) begin
                $display("@%d Bug 7117: C7T0 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc7_st0_rd_advance_d4 & spc7_st0_rd_advance) begin
                $display("@%d Bug 7117: C7T0 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc7_st1_rd_advance_d1 & spc7_st1_rd_advance) begin
                $display("@%d Bug 7117: C7T1 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc7_st1_rd_advance_d2 & spc7_st1_rd_advance) begin
                $display("@%d Bug 7117: C7T1 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc7_st1_rd_advance_d3 & spc7_st1_rd_advance) begin
                $display("@%d Bug 7117: C7T1 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc7_st1_rd_advance_d4 & spc7_st1_rd_advance) begin
                $display("@%d Bug 7117: C7T1 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc7_st2_rd_advance_d1 & spc7_st2_rd_advance) begin
                $display("@%d Bug 7117: C7T2 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc7_st2_rd_advance_d2 & spc7_st2_rd_advance) begin
                $display("@%d Bug 7117: C7T2 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc7_st2_rd_advance_d3 & spc7_st2_rd_advance) begin
                $display("@%d Bug 7117: C7T2 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc7_st2_rd_advance_d4 & spc7_st2_rd_advance) begin
                $display("@%d Bug 7117: C7T2 store acks exit DFQ 3 cycles apart", $time);
            end

            if(spc7_st3_rd_advance_d1 & spc7_st3_rd_advance) begin
                $display("@%d Bug 7117: C7T3 store acks exit DFQ 0 cycles apart", $time);
            end
            if(spc7_st3_rd_advance_d2 & spc7_st3_rd_advance) begin
                $display("@%d Bug 7117: C7T3 store acks exit DFQ 1 cycle apart", $time);
            end
            if(spc7_st3_rd_advance_d3 & spc7_st3_rd_advance) begin
                $display("@%d Bug 7117: C7T3 store acks exit DFQ 2 cycles apart", $time);
            end
            if(spc7_st3_rd_advance_d4 & spc7_st3_rd_advance) begin
                $display("@%d Bug 7117: C7T3 store acks exit DFQ 3 cycles apart", $time);
            end

        end
    end

`endif

////////////////////////////////////////////////////////////////////////////////
// end mlim section 1
// (This is intended to be within the "for (7 = 0; 7 < 8; 7++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////
// begin mlim section 2
// (DO NOT place within the "for (8 = 0; 8 < 8; 8++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

wire [7:0] cpx_spc_data_cx2_local;
wire [7:0] cpx_spc_data_cx2_Dinv;
wire [7:0] cpx_spc_data_cx2_Iinv;

ack_evict_decode cpx_spc_data_cx2_decode(
    `ifdef RTL_SPARC0
        .in0   (`SPARC_CORE0.cpx_spc0_data_cx2[127:0]),
    `else
        .in0   (128'b0),
    `endif
    `ifdef RTL_SPARC1
        .in1   (`SPARC_CORE1.cpx_spc0_data_cx2[127:0]),
    `else
        .in1   (128'b0),
    `endif
    `ifdef RTL_SPARC2
        .in2   (`SPARC_CORE2.cpx_spc0_data_cx2[127:0]),
    `else
        .in2   (128'b0),
    `endif
    `ifdef RTL_SPARC3
        .in3   (`SPARC_CORE3.cpx_spc0_data_cx2[127:0]),
    `else
        .in3   (128'b0),
    `endif
    `ifdef RTL_SPARC4
        .in4   (`SPARC_CORE4.cpx_spc0_data_cx2[127:0]),
    `else
        .in4   (128'b0),
    `endif
    `ifdef RTL_SPARC5
        .in5   (`SPARC_CORE5.cpx_spc0_data_cx2[127:0]),
    `else
        .in5   (128'b0),
    `endif
    `ifdef RTL_SPARC6
        .in6   (`SPARC_CORE6.cpx_spc0_data_cx2[127:0]),
    `else
        .in6   (128'b0),
    `endif
    `ifdef RTL_SPARC7
        .in7   (`SPARC_CORE7.cpx_spc0_data_cx2[127:0]),
    `else
        .in7   (128'b0),
    `endif
    .local (cpx_spc_data_cx2_local),
    .Dinv  (cpx_spc_data_cx2_Dinv),
    .Iinv  (cpx_spc_data_cx2_Iinv)
);



wire [7:0] dfq_byp_mx_data_local;
wire [7:0] dfq_byp_mx_data_Dinv;
wire [7:0] dfq_byp_mx_data_Iinv;

ack_evict_decode dfq_byp_mx_data_decode(
`ifdef RTL_SPARC0
    .in0   (`SPARC_CORE0.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in0   (128'b0),
`endif
`ifdef RTL_SPARC1
    .in1   (`SPARC_CORE1.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in1   (128'b0),
`endif
`ifdef RTL_SPARC2
    .in2   (`SPARC_CORE2.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in2   (128'b0),
`endif
`ifdef RTL_SPARC3
    .in3   (`SPARC_CORE3.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in3   (128'b0),
`endif
`ifdef RTL_SPARC4
    .in4   (`SPARC_CORE4.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in4   (128'b0),
`endif
`ifdef RTL_SPARC5
    .in5   (`SPARC_CORE5.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in5   (128'b0),
`endif
`ifdef RTL_SPARC6
    .in6   (`SPARC_CORE6.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in6   (128'b0),
`endif
`ifdef RTL_SPARC7
    .in7   (`SPARC_CORE7.sparc0.lsu.qdp2.dfq_byp_mx_data[127:0]),
`else
    .in7   (128'b0),
`endif
    .local (dfq_byp_mx_data_local),
    .Dinv  (dfq_byp_mx_data_Dinv),
    .Iinv  (dfq_byp_mx_data_Iinv)
);



wire [7:0] dfq_cpx_raw_wdata_local;
wire [7:0] dfq_cpx_raw_wdata_Dinv;
wire [7:0] dfq_cpx_raw_wdata_Iinv;

ack_evict_decode dfq_cpx_raw_wdata_decode(
`ifdef RTL_SPARC0
    .in0   (`SPARC_CORE0.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in0   (128'b0),
`endif
`ifdef RTL_SPARC1
    .in1   (`SPARC_CORE1.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in1   (128'b0),
`endif
`ifdef RTL_SPARC2
    .in2   (`SPARC_CORE2.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in2   (128'b0),
`endif
`ifdef RTL_SPARC3
    .in3   (`SPARC_CORE3.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in3   (128'b0),
`endif
`ifdef RTL_SPARC4
    .in4   (`SPARC_CORE4.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in4   (128'b0),
`endif
`ifdef RTL_SPARC5
    .in5   (`SPARC_CORE5.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in5   (128'b0),
`endif
`ifdef RTL_SPARC6
    .in6   (`SPARC_CORE6.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in6   (128'b0),
`endif
`ifdef RTL_SPARC7
    .in7   (`SPARC_CORE7.sparc0.lsu.qdp2.dfq_cpx_raw_wdata[127:0]),
`else
    .in7   (128'b0),
`endif
    .local (dfq_cpx_raw_wdata_local),
    .Dinv  (dfq_cpx_raw_wdata_Dinv),
    .Iinv  (dfq_cpx_raw_wdata_Iinv)
);



wire [7:0] dfq_byp_ff_data_local;
reg  [7:0] dfq_byp_ff_data_local_d1, dfq_byp_ff_data_local_d2;
wire [7:0] dfq_byp_ff_data_Dinv;
reg  [7:0] dfq_byp_ff_data_Dinv_d1, dfq_byp_ff_data_Dinv_d2;
wire [7:0] dfq_byp_ff_data_Iinv;
reg  [7:0] dfq_byp_ff_data_Iinv_d1, dfq_byp_ff_data_Iinv_d2;

always @(posedge clk) begin
    dfq_byp_ff_data_local_d1 <= dfq_byp_ff_data_local;
    dfq_byp_ff_data_local_d2 <= dfq_byp_ff_data_local_d1;
    dfq_byp_ff_data_Dinv_d1  <= dfq_byp_ff_data_Dinv;
    dfq_byp_ff_data_Dinv_d2  <= dfq_byp_ff_data_Dinv_d1;
    dfq_byp_ff_data_Iinv_d1  <= dfq_byp_ff_data_Iinv;
    dfq_byp_ff_data_Iinv_d2  <= dfq_byp_ff_data_Iinv_d1;
end

ack_evict_decode dfq_byp_ff_data_decode(
`ifdef RTL_SPARC0
    .in0   (`SPARC_CORE0.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in0   (128'b0),
`endif
`ifdef RTL_SPARC1
    .in1   (`SPARC_CORE1.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in1   (128'b0),
`endif
`ifdef RTL_SPARC2
    .in2   (`SPARC_CORE2.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in2   (128'b0),
`endif
`ifdef RTL_SPARC3
    .in3   (`SPARC_CORE3.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in3   (128'b0),
`endif
`ifdef RTL_SPARC4
    .in4   (`SPARC_CORE4.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in4   (128'b0),
`endif
`ifdef RTL_SPARC5
    .in5   (`SPARC_CORE5.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in5   (128'b0),
`endif
`ifdef RTL_SPARC6
    .in6   (`SPARC_CORE6.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in6   (128'b0),
`endif
`ifdef RTL_SPARC7
    .in7   (`SPARC_CORE7.sparc0.lsu.qdp2.dfq_byp_ff_data[127:0]),
`else
    .in7   (128'b0),
`endif
    .local (dfq_byp_ff_data_local),
    .Dinv  (dfq_byp_ff_data_Dinv),
    .Iinv  (dfq_byp_ff_data_Iinv)
);

////////////////////////////////////////////////////////////////////////////////
// end mlim section 2
// (DO NOT place within the "for (8 = 0; 8 < 8; 8++) { ... }" section.)
////////////////////////////////////////////////////////////////////////////////

endmodule



module ack_evict_decode(in0, in1, in2, in3, in4, in5, in6, in7, local, Dinv, Iinv);

input [127:0] in0;
input [127:0] in1;
input [127:0] in2;
input [127:0] in3;
input [127:0] in4;
input [127:0] in5;
input [127:0] in6;
input [127:0] in7;
output [7:0]  local;
output [7:0]  Dinv;
output [7:0]  Iinv;

    assign local[0] = (in0[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[0]  = in0[0]  | in0[32] | in0[56] | in0[88] ;
    assign Iinv[0]  = in0[1]  | in0[57] ;

    assign local[1] = (in1[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[1]  = in1[0]  | in1[32] | in1[56] | in1[88] ;
    assign Iinv[1]  = in1[1]  | in1[57] ;

    assign local[2] = (in2[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[2]  = in2[0]  | in2[32] | in2[56] | in2[88] ;
    assign Iinv[2]  = in2[1]  | in2[57] ;

    assign local[3] = (in3[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[3]  = in3[0]  | in3[32] | in3[56] | in3[88] ;
    assign Iinv[3]  = in3[1]  | in3[57] ;

    assign local[4] = (in4[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[4]  = in4[0]  | in4[32] | in4[56] | in4[88] ;
    assign Iinv[4]  = in4[1]  | in4[57] ;

    assign local[5] = (in5[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[5]  = in5[0]  | in5[32] | in5[56] | in5[88] ;
    assign Iinv[5]  = in5[1]  | in5[57] ;

    assign local[6] = (in6[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[6]  = in6[0]  | in6[32] | in6[56] | in6[88] ;
    assign Iinv[6]  = in6[1]  | in6[57] ;

    assign local[7] = (in7[`CPX_CPUID_HI:`CPX_CPUID_LO] == 3'h0);
    assign Dinv[7]  = in7[0]  | in7[32] | in7[56] | in7[88] ;
    assign Iinv[7]  = in7[1]  | in7[57] ;

endmodule



module count12bits(in, out);

input  [11:0] in;
output [2:0]  out;
wire   [3:0]  count;

    assign count = ( in[0] + in[1] + in[2] + in[3] + in[4]  + in[5] +
                     in[6] + in[7] + in[8] + in[9] + in[10] + in[11] );

    assign out[0] = (count > 4'h0);
    assign out[1] = (count > 4'h1);
    assign out[2] = (count > 4'h2);

endmodule


