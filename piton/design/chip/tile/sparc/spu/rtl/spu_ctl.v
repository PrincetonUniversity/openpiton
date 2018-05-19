// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_ctl.v
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
//      Description:    Stream Processing Unit for Sparc Core   
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////


module spu_ctl (
  //Inputs
   cpx_spu_data_cx,spu_wen_pckt_req,lsu_spu_ldst_ack,lsu_tlu_st_rs3_data_g,
   spu_lsurpt1_rsrv_data_e,  spu_madp_mpa_addr, 
   ifu_spu_trap_ack,mul_data_out,spu_mul_mulres_lshft,
   //output
   spu_mamul_oprnd2_bypass, 
   spu_mactl_ldop, 
/*AUTOARG*/
   // Outputs

   spu_wen_ldst_pcx_vld, 

   spu_wen_pcx_wen, 
   spu_wen_pcx_7170_sel, 

   spu_ifu_corr_err_w2, 
   spu_ifu_unc_err_w, 
   spu_lsu_unc_error_w, 

   spu_ifu_mamem_err_w, 
   spu_ifu_int_w2, 
   spu_lsu_ldxa_illgl_va_w2, 
   cpuid, 
   ifu_spu_nceen, 

   spu_tlu_rsrv_illgl_m, 
   spu_mul_req_vld, 
   spu_mul_areg_shf, spu_mul_areg_rst, spu_mul_acc, 
   spu_mared_rdn_wen, spu_mared_data_sel_l, 
   spu_mared_cin_oprnd_sub_mod, spu_mamul_oprnd2_wen, 
   spu_mamul_oprnd1_mxsel_l,spu_mamul_oprnd1_wen, spu_maexp_shift_e, 
   spu_maexp_e_data_wen, spu_mactl_mpa_sel, 
   spu_mactl_memodd_wen, spu_mactl_memmxsel_l, spu_mactl_memeve_wen, 
   spu_mactl_mamem_ren, spu_mactl_mamem_wen,
   spu_mactl_madp_parflop_wen, spu_mactl_force_perr, 
   spu_maaddr_mpa_wen, spu_maaddr_mpa_incr_val, 
   spu_maaddr_mpa_addrinc, spu_maaddr_memindx,  spu_maaddr_mamem_eveodd_sel_l,
   spu_lsu_stxa_ack_tid, spu_lsu_stxa_ack, spu_lsu_ldxa_tid_w2, 
   spu_lsu_ldxa_data_vld_w2, spu_ifu_ttype_w2, spu_ifu_ttype_vld_w2, 
   spu_ifu_ttype_tid_w,   
   so, 

   spu_mactl_mem_reset_l,
   mux_drive_disable,
   mem_bypass,
   sehold,

spu_mactl_ldxa_data_w_sel_l,
spu_mactl_ldxa_data_w_select,
spu_mactl_mpa_wen,
spu_mactl_maaddr_wen,
spu_mactl_manp_wen,
spu_wen_maln_wen,
spu_mactl_mactl_reg,
spu_madp_maaddr_reg,

   // Inputs


   lsu_spu_stb_empty, 

   lsu_spu_strm_ack_cmplt, 
   lsu_spu_early_flush_g, 
   tlu_spu_flush_w, 
   ifu_spu_flush_w, 
   spu_madp_perr, spu_madp_m_lt_n, spu_madp_m_eq_n, spu_madp_e_eq_one, 
   spu_madp_cout_oprnd_sub_mod, si, se, grst_l, arst_l, mul_spu_shf_ack, 
   mul_spu_ack, lsu_spu_asi_state_e, ifu_tlu_thrid_e, 
   ifu_spu_inst_vld_w, ifu_lsu_st_inst_e, ifu_lsu_ld_inst_e, 
   ifu_lsu_alt_space_e, exu_lsu_ldst_va_e, rclk
   ) ;  

input [3:0] lsu_spu_stb_empty;

input [134:128]         cpx_spu_data_cx;
input 		        lsu_spu_ldst_ack;
input              ifu_spu_trap_ack;
input [13:0]            lsu_tlu_st_rs3_data_g;
input [2:0]            spu_lsurpt1_rsrv_data_e;
input [3:3]             spu_madp_mpa_addr;
input [0:0]             mul_data_out;
output                  spu_mul_mulres_lshft;
output			spu_mamul_oprnd2_bypass;// From spu_mamul of spu_mamul.v
output			spu_mactl_ldop;		// From spu_mactl of spu_mactl.v

output 	spu_ifu_corr_err_w2;
output 	spu_ifu_unc_err_w;
output 	spu_lsu_unc_error_w;

output spu_ifu_mamem_err_w;
output spu_ifu_int_w2;
output spu_lsu_ldxa_illgl_va_w2;


output spu_mactl_mem_reset_l;

output spu_wen_pcx_7170_sel;
output spu_wen_pcx_wen;

output [122:104]         spu_wen_pckt_req;
// ------------------------------------------------------------------
/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)


input			rclk;			// To spu_wen of spu_wen.v, ...
input [7:0]		exu_lsu_ldst_va_e;	// To spu_mactl of spu_mactl.v
input			ifu_lsu_alt_space_e;	// To spu_mactl of spu_mactl.v
input			ifu_lsu_ld_inst_e;	// To spu_mactl of spu_mactl.v
input			ifu_lsu_st_inst_e;	// To spu_mactl of spu_mactl.v
input			ifu_spu_inst_vld_w;	// To spu_mactl of spu_mactl.v
input [1:0]		ifu_tlu_thrid_e;	// To spu_mactl of spu_mactl.v
input [7:0]		lsu_spu_asi_state_e;	// To spu_mactl of spu_mactl.v
input			mul_spu_ack;		// To spu_mamul of spu_mamul.v, ...
input			mul_spu_shf_ack;	// To spu_mamul of spu_mamul.v, ...
input			grst_l;			// To spu_wen of spu_wen.v, ...
input			arst_l;			// To spu_wen of spu_wen.v, ...
input			se;			// To spu_shactl of spu_shactl.v, ...
input			si;			// To spu_shactl of spu_shactl.v, ...
input			spu_madp_cout_oprnd_sub_mod;// To spu_mared of spu_mared.v
input			spu_madp_e_eq_one;	// To spu_maexp of spu_maexp.v
input			spu_madp_m_eq_n;	// To spu_mared of spu_mared.v
input			spu_madp_m_lt_n;	// To spu_mared of spu_mared.v
input      		spu_madp_perr;	// To spu_mactl of spu_mactl.v
input			lsu_spu_early_flush_g;	
input			tlu_spu_flush_w;	
input			ifu_spu_flush_w;	
input [2:0] 		cpuid;	
input [3:0] 		ifu_spu_nceen;	


input [1:0] lsu_spu_strm_ack_cmplt;

input mux_drive_disable;
input mem_bypass;
input sehold;


// End of automatics

// ------------------------------------------------------------------
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output			so;			// From spu_shactl of spu_shactl.v, ...
output [1:0]		spu_ifu_ttype_tid_w;	// From spu_mactl of spu_mactl.v
output			spu_ifu_ttype_vld_w2;	// From spu_mactl of spu_mactl.v
output			spu_ifu_ttype_w2;	// From spu_mactl of spu_mactl.v
output			spu_lsu_ldxa_data_vld_w2;// From spu_mactl of spu_mactl.v
output [1:0]		spu_lsu_ldxa_tid_w2;	// From spu_mactl of spu_mactl.v
output			spu_lsu_stxa_ack;	// From spu_mactl of spu_mactl.v
output [1:0]		spu_lsu_stxa_ack_tid;	// From spu_mactl of spu_mactl.v
output [7:1]		spu_maaddr_memindx;	// From spu_maaddr of spu_maaddr.v
output [3:0]		spu_maaddr_mamem_eveodd_sel_l;	// From spu_maaddr of spu_maaddr.v
output			spu_maaddr_mpa_addrinc;	// From spu_maaddr of spu_maaddr.v
output [4:0]		spu_maaddr_mpa_incr_val;// From spu_maaddr of spu_maaddr.v
output			spu_maaddr_mpa_wen;	// From spu_maaddr of spu_maaddr.v
output			spu_mactl_force_perr;	// From spu_mactl of spu_mactl.v
output			spu_mactl_madp_parflop_wen;// From spu_mactl of spu_mactl.v
output			spu_mactl_mamem_ren;	// From spu_mactl of spu_mactl.v
output			spu_mactl_mamem_wen;	// From spu_mactl of spu_mactl.v
output			spu_mactl_memeve_wen;	// From spu_mactl of spu_mactl.v
output [2:0]		spu_mactl_memmxsel_l;	// From spu_mactl of spu_mactl.v
output			spu_mactl_memodd_wen;	// From spu_mactl of spu_mactl.v
output			spu_mactl_mpa_sel;	// From spu_mactl of spu_mactl.v
output			spu_maexp_e_data_wen;	// From spu_maexp of spu_maexp.v
output			spu_maexp_shift_e;	// From spu_maexp of spu_maexp.v
output [2:0]			spu_mamul_oprnd1_mxsel_l;	// From spu_mamul of spu_mamul.v
output			spu_mamul_oprnd1_wen;	// From spu_mamul of spu_mamul.v
output			spu_mamul_oprnd2_wen;	// From spu_mamul of spu_mamul.v
output			spu_mared_cin_oprnd_sub_mod;// From spu_mared of spu_mared.v
output [3:0]		spu_mared_data_sel_l;	// From spu_mared of spu_mared.v
output			spu_mared_rdn_wen;	// From spu_mared of spu_mared.v
output			spu_mul_acc;		// From spu_mamul of spu_mamul.v
output			spu_mul_areg_rst;	// From spu_mamul of spu_mamul.v
output			spu_mul_areg_shf;	// From spu_mamul of spu_mamul.v
output			spu_mul_req_vld;	// From spu_mamul of spu_mamul.v
output			spu_tlu_rsrv_illgl_m;	// From spu_mactl of spu_mactl.v

output spu_wen_ldst_pcx_vld;

output [3:0] spu_mactl_ldxa_data_w_sel_l;
output spu_mactl_ldxa_data_w_select;
output spu_mactl_mpa_wen;
output spu_mactl_maaddr_wen;
output spu_mactl_manp_wen;
output spu_wen_maln_wen;
output [13:0] spu_mactl_mactl_reg;
input [47:0] spu_madp_maaddr_reg;

// End of automatics
// ------------------------------------------------------------------

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire [1:0]			spu_maaeqb_oprnd1_mxsel;	// From spu_maaeqb of spu_maaeqb.v
wire [5:0] spu_maaddr_len_cntr;
wire [5:0]		spu_mactl_mactl_len;	// From spu_mactl of spu_mactl.v

// End of automatics

// ------------------------------------------------------------------


// ------------------------------------------------------------------


/****************************************************************************/

// -------------------------------------------------------------------------
spu_wen spu_wen (//in
		.spu_mald_done	        	(spu_mald_ld_done),

		//.lsu_spu_vload_rtntyp		(cpx_spu_data_cx[138:135]),	//cpx_spc_data_cx[143:140]
		.lsu_spu_vload_rtntyp		(cpx_spu_data_cx[133:130]),	//cpx_spc_data_cx[143:140]
		//.lsu_spu_vload_asop		(cpx_spu_data_cx[129]),		//cpx_spc_data_cx[130]
		//.lsu_spu_vload_vld		(cpx_spu_data_cx[139]),		//cpx_spc_data_cx[144]
		.lsu_spu_vload_vld		(cpx_spu_data_cx[134]),		//cpx_spc_data_cx[144]
		//.lsu_spu_vload_data_tid	(cpx_spu_data_cx[131:130]),	//cpx_spc_data_cx[135:134]
		//.lsu_spu_vload_bid		(cpx_spu_data_cx[128]),		//cpx_spc_data_cx[129]
		//.l2_miss 			(cpx_spu_data_cx[134]),		//cpx_spc_data_cx[139]
		//.l2_err 			(cpx_spu_data_cx[133:132]),	//cpx_spc_data_cx[138:137]
		.l2_err 			(cpx_spu_data_cx[129:128]),	//cpx_spc_data_cx[138:137]
 
		.lsu_spu_st_ack_tid		(spu_wen_pckt_req[113:112]),
		.lsu_spu_st_asop		(spu_wen_pckt_req[108]),
		.lsu_spu_st_ackvld		(lsu_spu_ldst_ack),
		.lsu_spu_ld_ack_tid		(spu_wen_pckt_req[113:112]),
		.lsu_spu_ld_asop		(spu_wen_pckt_req[106]),
		.lsu_spu_ld_ackvld		(lsu_spu_ldst_ack),

		.cpuid		(cpuid[2:0]),

		 /*AUTOINST*/
		 // Outputs
		 .spu_wen_pckt_req	(spu_wen_pckt_req[122:104]),

		 .spu_wen_mast_ack	(spu_wen_mast_ack),
		 .spu_wen_maln_wen	(spu_wen_maln_wen),
		 .spu_wen_mald_ack	(spu_wen_mald_ack),
		 .spu_wen_vld_maln	(spu_wen_vld_maln),

		 .spu_wen_ldst_pcx_vld	(spu_wen_ldst_pcx_vld),
		.spu_mactl_streq		(spu_mactl_streq),
		.spu_mald_ldreq		(spu_mald_ldreq),

		.spu_wen_allma_stacks_ok		(spu_wen_allma_stacks_ok),


                .spu_wen_ma_unc_err_pulse             (spu_wen_ma_unc_err_pulse),
		.spu_wen_ma_unc_err		(spu_wen_ma_unc_err),
		.spu_wen_ma_cor_err		(spu_wen_ma_cor_err),

		 // Inputs
		.spu_mactl_uncerr_rst 			(spu_mactl_uncerr_rst),


		 .lsu_spu_strm_ack_cmplt		(lsu_spu_strm_ack_cmplt[1:0]),
		 .reset			(spu_mactl_ctl_reset),
		 .rclk			(rclk),
		 .se			(se),
		 .spu_mald_rstln	(spu_mald_rstln));


// -------------------------------------------------------------------------

// -------------------------------------------------------------------------

// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// ------------------------ MA STUFF ---------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
// -------------------------------------------------------------------------
spu_mast spu_mast (//in
		.mactl_stop			(spu_mactl_stop),
		.streq_ack			(spu_wen_mast_ack),
		.len_neqz			(spu_maaddr_len_neqz),
		   
		   /*AUTOINST*/
		   // Outputs
		   .spu_mast_maaddr_addrinc(spu_mast_maaddr_addrinc),
		   .spu_mast_memren	(spu_mast_memren),
		   .spu_mast_stbuf_wen	(spu_mast_stbuf_wen),
		   .spu_mast_mpa_addrinc(spu_mast_mpa_addrinc),
		   .spu_mast_streq	(spu_mast_streq),
		   .spu_mast_done_set	(spu_mast_done_set),

			.spu_wen_allma_stacks_ok		(spu_wen_allma_stacks_ok),
		   // Inputs

		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
			.spu_mactl_perr_set		(spu_mactl_perr_set),

		   .reset		(spu_mactl_ctl_reset),
		   .rclk			(rclk),
		 .se			(se),
		   .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly));
// -------------------------------------------------------------------------
spu_mald spu_mald (//in
		.ld_inprog			(spu_mactl_ldop),
		.ldreq_ack			(spu_wen_mald_ack),
		.ln_received			(spu_wen_vld_maln),
		.len_neqz			(spu_maaddr_len_neqz),
		.mactl_ldop			(spu_mactl_ldop),
		   //out
		.spu_mald_done			(spu_mald_ld_done),		   
		   /*AUTOINST*/
		   // Outputs
		   .spu_mald_rstln	(spu_mald_rstln),
		   .spu_mald_maaddr_addrinc(spu_mald_maaddr_addrinc),
		   .spu_mald_memwen	(spu_mald_memwen),
		   .spu_mald_mpa_addrinc(spu_mald_mpa_addrinc),
		   .spu_mald_ldreq	(spu_mald_ldreq),
		   .spu_mald_force_mpa_add16(spu_mald_force_mpa_add16),
		   .spu_mald_done_set	(spu_mald_done_set),
		   // Inputs
		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
                .spu_wen_ma_unc_err_pulse             (spu_wen_ma_unc_err_pulse),

		   .reset		(spu_mactl_ctl_reset),
		   .rclk			(rclk),
		 .se			(se),
		   .spu_maaddr_mpa1maddr0(spu_maaddr_mpa1maddr0),
		   .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly));

// -------------------------------------------------------------------------
spu_mactl spu_mactl (//in
		.spu_maaddr_maaddr_0		(spu_maaddr_wrindx_0),
		.spu_maaddr_mpa_3		(spu_madp_mpa_addr[3]),
                .ma_ctl_reg_data            	(lsu_tlu_st_rs3_data_g[13:0]),

		.ifu_spu_trap_ack 			(ifu_spu_trap_ack),
                .spu_mactl_rsrv_data_e		(spu_lsurpt1_rsrv_data_e[2:0]),
		     
		.spu_ifu_corr_err_w2 			(spu_ifu_corr_err_w2),
		.spu_ifu_unc_err_w 			(spu_ifu_unc_err_w),
		.spu_lsu_unc_error_w 			(spu_lsu_unc_error_w),

		.spu_ifu_mamem_err_w 			(spu_ifu_mamem_err_w),
		.spu_ifu_int_w2 			(spu_ifu_int_w2),
		.spu_lsu_ldxa_illgl_va_w2 			(spu_lsu_ldxa_illgl_va_w2),

		.spu_mactl_uncerr_rst 			(spu_mactl_uncerr_rst),

		.spu_mactl_pcx_wen		(spu_wen_pcx_wen),
		.spu_mactl_pcx_7170_sel		(spu_wen_pcx_7170_sel),
			.spu_mactl_perr_set		(spu_mactl_perr_set),
		     /*AUTOINST*/
		     // Outputs
		     //.so		(so),

		     .spu_mactl_iss_pulse_pre(spu_mactl_iss_pulse_pre),
		     .spu_mactl_iss_pulse(spu_mactl_iss_pulse),
		     .spu_mactl_mpa_wen	(spu_mactl_mpa_wen),
		     .spu_mactl_maaddr_wen(spu_mactl_maaddr_wen),
		     .spu_mactl_manp_wen(spu_mactl_manp_wen),
		     .spu_mactl_ldop	(spu_mactl_ldop),
		     .spu_mactl_stop	(spu_mactl_stop),
		     .spu_mactl_mulop	(spu_mactl_mulop),
		     .spu_mactl_redop	(spu_mactl_redop),
		     .spu_mactl_expop	(spu_mactl_expop),
		     .spu_mactl_memmxsel_l(spu_mactl_memmxsel_l[2:0]),
		     .spu_mactl_memeve_wen(spu_mactl_memeve_wen),
		     .spu_mactl_memodd_wen(spu_mactl_memodd_wen),
		     .spu_mactl_mamem_ren(spu_mactl_mamem_ren),
		     .spu_mactl_mamem_wen(spu_mactl_mamem_wen),
		     .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly),
		     .spu_mactl_ldxa_data_w_sel_l(spu_mactl_ldxa_data_w_sel_l[3:0]),
		     .spu_mactl_ldxa_data_w_select(spu_mactl_ldxa_data_w_select),
		     .spu_mactl_mpa_sel	(spu_mactl_mpa_sel),
		     .spu_mactl_madp_parflop_wen(spu_mactl_madp_parflop_wen),
		     .spu_lsu_ldxa_data_vld_w2(spu_lsu_ldxa_data_vld_w2),
		     .spu_lsu_ldxa_tid_w2(spu_lsu_ldxa_tid_w2[1:0]),
		     .spu_lsu_stxa_ack	(spu_lsu_stxa_ack),
		     .spu_lsu_stxa_ack_tid(spu_lsu_stxa_ack_tid[1:0]),
		     .spu_mactl_ldxa_mactl_reg(spu_mactl_mactl_reg[13:0]),
		     .spu_mactl_mactl_len(spu_mactl_mactl_len[5:0]),
		     .spu_mactl_force_perr(spu_mactl_force_perr),
		     .spu_ifu_ttype_w2	(spu_ifu_ttype_w2),
		     .spu_ifu_ttype_vld_w2(spu_ifu_ttype_vld_w2),
		     .spu_ifu_ttype_tid_w(spu_ifu_ttype_tid_w[1:0]),
		     .spu_tlu_rsrv_illgl_m(spu_tlu_rsrv_illgl_m),

		   .spu_mactl_streq	(spu_mactl_streq),

		   .spu_mactl_ctl_reset	(spu_mactl_ctl_reset),
		   .spu_mactl_mem_reset_l	(spu_mactl_mem_reset_l),

			.spu_mactl_ma_kill_op		(spu_mactl_ma_kill_op),
		     // Inputs
		.mux_drive_disable		(mux_drive_disable),
		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
		.lsu_spu_ldst_ack		(lsu_spu_ldst_ack),

		.spu_wen_ma_unc_err		(spu_wen_ma_unc_err),
		.spu_wen_ma_cor_err		(spu_wen_ma_cor_err),



		     .spu_maaddr_len_cntr		(spu_maaddr_len_cntr[5:0]),
		     .ifu_spu_nceen		(ifu_spu_nceen[3:0]),

		   .spu_mast_streq	(spu_mast_streq),

			.lsu_spu_stb_empty		(lsu_spu_stb_empty[3:0]),

		     .grst_l		(grst_l),
		     .arst_l		(arst_l),
		     .rclk		(rclk),
		 .se			(se),
		     //.si		(si),
		     //.se		(se),


		     .spu_mald_memwen	(spu_mald_memwen),
		     .spu_mamul_memwen	(spu_mamul_memwen),
		     .spu_mamul_memren	(spu_mamul_memren),
		     .spu_maaeqb_memwen	(spu_maaeqb_memwen),
		     .spu_maaeqb_memren	(spu_maaeqb_memren),
		     .spu_mared_memren	(spu_mared_memren),
		     .spu_mared_memwen	(spu_mared_memwen),
		     .spu_mast_memren	(spu_mast_memren),
		     .lsu_spu_early_flush_g(lsu_spu_early_flush_g),
		     .tlu_spu_flush_w(tlu_spu_flush_w),
		     .ifu_spu_flush_w(ifu_spu_flush_w),
		     .ifu_spu_inst_vld_w(ifu_spu_inst_vld_w),
		     .lsu_spu_asi_state_e(lsu_spu_asi_state_e[7:0]),
		     .ifu_lsu_ld_inst_e	(ifu_lsu_ld_inst_e),
		     .ifu_lsu_st_inst_e	(ifu_lsu_st_inst_e),
		     .ifu_lsu_alt_space_e(ifu_lsu_alt_space_e),
		     .ifu_tlu_thrid_e	(ifu_tlu_thrid_e[1:0]),
		     .exu_lsu_ldst_va_e	(exu_lsu_ldst_va_e[7:0]),
		     .spu_mald_done_set	(spu_mald_done_set),
		     .spu_mast_done_set	(spu_mast_done_set),
		     .spu_mared_done_set(spu_mared_done_set),
		     .spu_maexp_done_set(spu_maexp_done_set),
		     .spu_maexp_memren	(spu_maexp_memren),
		     .spu_maaddr_nooddwr_on_leneq1(spu_maaddr_nooddwr_on_leneq1),
		     .spu_mared_not_idle(spu_mared_not_idle),
		     .spu_mamul_oprnd2_bypass(spu_mamul_oprnd2_bypass),
		     .spu_madp_perr(spu_madp_perr));

// -------------------------------------------------------------------------
spu_maaddr spu_maaddr (//in
		//.lsu_spu_stxa_data		(lsu_tlu_st_rs3_data_g[5:0]),
		.spu_madp_mactl_reg		(spu_mactl_mactl_len[5:0]),
		.spu_madp_mpa_addr_3		(spu_madp_mpa_addr[3]),

		       
		       /*AUTOINST*/
		       // Outputs
		       .spu_maaddr_len_neqz(spu_maaddr_len_neqz),
		       .spu_maaddr_mpa1maddr0(spu_maaddr_mpa1maddr0),
		       .spu_maaddr_memindx(spu_maaddr_memindx[7:1]),
		       .spu_maaddr_mamem_eveodd_sel_l(spu_maaddr_mamem_eveodd_sel_l[3:0]),
		       .spu_maaddr_iequtwolenplus2(spu_maaddr_iequtwolenplus2),
		       .spu_maaddr_iequtwolenplus1(spu_maaddr_iequtwolenplus1),
		       .spu_maaddr_jequiminus1(spu_maaddr_jequiminus1),
		       .spu_maaddr_jequlen(spu_maaddr_jequlen),
		       .spu_maaddr_halfpnt_set(spu_maaddr_halfpnt_set),
		       .spu_maaddr_len_eqmax(spu_maaddr_len_eqmax),
		       .spu_maaddr_esmod64(spu_maaddr_esmod64),
		       .spu_maaddr_esmax(spu_maaddr_esmax),
		       .spu_maaddr_nooddwr_on_leneq1(spu_maaddr_nooddwr_on_leneq1),
		       .spu_maaddr_mpa_addrinc(spu_maaddr_mpa_addrinc),
		       .spu_maaddr_mpa_wen(spu_maaddr_mpa_wen),
		       .spu_maaddr_mpa_incr_val(spu_maaddr_mpa_incr_val[4:0]),
		       .spu_maaddr_jequiminus1rshft(spu_maaddr_jequiminus1rshft),
		       .spu_maaddr_iequtwolen(spu_maaddr_iequtwolen),
		       .spu_maaddr_ieven(spu_maaddr_ieven),
		       .spu_maaddr_ieq0	(spu_maaddr_ieq0),
		       .spu_maaddr_aequb(spu_maaddr_aequb),
			.spu_maaddr_jptr_eqz_mared		(spu_maaddr_jptr_eqz_mared),
		       // Inputs

		     .spu_mamul_rst	(spu_mamul_rst),
		     .mem_bypass(mem_bypass),
		     .sehold(sehold),

		     .spu_mamul_jjptr_sel(spu_mamul_jjptr_sel),

		     .spu_maaddr_len_cntr(spu_maaddr_len_cntr[5:0]),

		.spu_maaddr_wrindx_0		(spu_maaddr_wrindx_0),

		       .reset		(spu_mactl_ctl_reset),
		       .rclk		(rclk),
		 .se			(se),
		       .spu_mald_force_mpa_add16(spu_mald_force_mpa_add16),
		       .spu_mactl_ldop	(spu_mactl_ldop),
		       .spu_madp_maaddr_reg_in(spu_madp_maaddr_reg[47:0]),
		       .spu_mald_maaddr_addrinc(spu_mald_maaddr_addrinc),
		       .spu_mald_mpa_addrinc(spu_mald_mpa_addrinc),
		       .spu_mast_maaddr_addrinc(spu_mast_maaddr_addrinc),
		       .spu_mast_mpa_addrinc(spu_mast_mpa_addrinc),
		       .spu_mamul_memwen(spu_mamul_memwen),
		       .spu_mamul_rst_iptr(spu_mamul_rst_iptr),
		       .spu_mamul_rst_jptr(spu_mamul_rst_jptr),
		       .spu_mamul_incr_iptr(spu_mamul_incr_iptr),
		       .spu_mamul_incr_jptr(spu_mamul_incr_jptr),
		       .spu_mamul_a_rd_oprnd_sel(spu_mamul_a_rd_oprnd_sel),
		       .spu_mamul_ax_rd_oprnd_sel(spu_mamul_ax_rd_oprnd_sel),
		       .spu_mamul_b_rd_oprnd_sel(spu_mamul_b_rd_oprnd_sel),
		       .spu_mamul_ba_rd_oprnd_sel(spu_mamul_ba_rd_oprnd_sel),
		       .spu_mamul_m_rd_oprnd_sel(spu_mamul_m_rd_oprnd_sel),
		       .spu_mamul_n_rd_oprnd_sel(spu_mamul_n_rd_oprnd_sel),
		       .spu_mamul_m_wr_oprnd_sel(spu_mamul_m_wr_oprnd_sel),
		       .spu_mared_me_rd_oprnd_sel(spu_mared_me_rd_oprnd_sel),
		       .spu_mared_xe_wr_oprnd_sel(spu_mared_xe_wr_oprnd_sel),
		       .spu_mamul_me_rd_oprnd_sel(spu_mamul_me_rd_oprnd_sel),
		       .spu_mamul_me_wr_oprnd_sel(spu_mamul_me_wr_oprnd_sel),
		       .spu_mamul_i_ptr_sel(spu_mamul_i_ptr_sel),
		       .spu_mamul_iminus1_ptr_sel(spu_mamul_iminus1_ptr_sel),
		       .spu_mamul_j_ptr_sel(spu_mamul_j_ptr_sel),
		       .spu_mamul_iminusj_ptr_sel(spu_mamul_iminusj_ptr_sel),
		       .spu_mamul_iminuslenminus1_sel(spu_mamul_iminuslenminus1_sel),
		       .spu_mamul_jjptr_wen(spu_mamul_jjptr_wen),
		       .spu_mactl_iss_pulse(spu_mactl_iss_pulse),
		     .spu_mactl_iss_pulse_pre(spu_mactl_iss_pulse_pre),
		       .spu_mared_m_rd_oprnd_sel(spu_mared_m_rd_oprnd_sel),
		       .spu_mared_nm_rd_oprnd_sel(spu_mared_nm_rd_oprnd_sel),
		       .spu_mared_x_wr_oprnd_sel(spu_mared_x_wr_oprnd_sel),
		       .spu_mared_a_rd_oprnd_sel(spu_mared_a_rd_oprnd_sel),
		       .spu_mared_nr_rd_oprnd_sel(spu_mared_nr_rd_oprnd_sel),
		       .spu_mared_r_wr_oprnd_sel(spu_mared_r_wr_oprnd_sel),
		       .spu_mared_memwen(spu_mared_memwen),
		       .spu_mared_j_ptr_sel(spu_mared_j_ptr_sel),
		       .spu_mared_update_jptr(spu_mared_update_jptr),
		       .spu_mared_rst_jptr(spu_mared_rst_jptr),
		       .spu_mared_maxlen_wen(spu_mared_maxlen_wen),
		       .spu_mared_cin_set_4sub(spu_mared_cin_set_4sub),
		       .spu_mast_memren	(spu_mast_memren),
		       .spu_mared_start_wen(spu_mared_start_wen),
		       .spu_mared_start_sel(spu_mared_start_sel),
		       .spu_maexp_incr_es_ptr(spu_maexp_incr_es_ptr),
		       .spu_maexp_e_rd_oprnd_sel(spu_maexp_e_rd_oprnd_sel),
		       .spu_maexp_es_max_init(spu_maexp_es_max_init),
		       .spu_maexp_es_e_ptr_rst(spu_maexp_es_e_ptr_rst),
		       .spu_maaeqb_memwen(spu_maaeqb_memwen),
		       .spu_maaeqb_irshft_sel(spu_maaeqb_irshft_sel),
		       .spu_mared_update_redwr_jptr(spu_mared_update_redwr_jptr),
		       .spu_mared_jjptr_wen(spu_mared_jjptr_wen));

// -------------------------------------------------------------------------
//spu_mamem spu_mamem (/*AUTOINST*/);

// -------------------------------------------------------------------------
//spu_madp spu_madp (/*AUTOINST*/);

// -------------------------------------------------------------------------

spu_mamul spu_mamul (//in
		     
		     /*AUTOINST*/
		     // Outputs
		     //.so		(so),
		     .spu_mamul_memwen	(spu_mamul_memwen),
		     .spu_mamul_memren	(spu_mamul_memren),
		     .spu_mamul_rst_iptr(spu_mamul_rst_iptr),
		     .spu_mamul_rst_jptr(spu_mamul_rst_jptr),
		     .spu_mamul_incr_iptr(spu_mamul_incr_iptr),
		     .spu_mamul_incr_jptr(spu_mamul_incr_jptr),
		     .spu_mamul_a_rd_oprnd_sel(spu_mamul_a_rd_oprnd_sel),
		     .spu_mamul_ax_rd_oprnd_sel(spu_mamul_ax_rd_oprnd_sel),
		     .spu_mamul_b_rd_oprnd_sel(spu_mamul_b_rd_oprnd_sel),
		     .spu_mamul_ba_rd_oprnd_sel(spu_mamul_ba_rd_oprnd_sel),
		     .spu_mamul_m_rd_oprnd_sel(spu_mamul_m_rd_oprnd_sel),
		     .spu_mamul_me_rd_oprnd_sel(spu_mamul_me_rd_oprnd_sel),
		     .spu_mamul_n_rd_oprnd_sel(spu_mamul_n_rd_oprnd_sel),
		     .spu_mamul_m_wr_oprnd_sel(spu_mamul_m_wr_oprnd_sel),
		     .spu_mamul_me_wr_oprnd_sel(spu_mamul_me_wr_oprnd_sel),
		     .spu_mamul_i_ptr_sel(spu_mamul_i_ptr_sel),
		     .spu_mamul_iminus1_ptr_sel(spu_mamul_iminus1_ptr_sel),
		     .spu_mamul_j_ptr_sel(spu_mamul_j_ptr_sel),
		     .spu_mamul_iminusj_ptr_sel(spu_mamul_iminusj_ptr_sel),
		     .spu_mamul_iminuslenminus1_sel(spu_mamul_iminuslenminus1_sel),
		     .spu_mamul_jjptr_wen(spu_mamul_jjptr_wen),
		     .spu_mamul_oprnd2_wen(spu_mamul_oprnd2_wen),
		     .spu_mamul_oprnd2_bypass(spu_mamul_oprnd2_bypass),
		     .spu_mamul_oprnd1_mxsel_l(spu_mamul_oprnd1_mxsel_l[2:0]),
		     .spu_mamul_oprnd1_wen	(spu_mamul_oprnd1_wen),
		     .spu_mul_req_vld	(spu_mul_req_vld),
		     .spu_mul_areg_shf	(spu_mul_areg_shf),
		     .spu_mul_acc	(spu_mul_acc),
		     .spu_mul_areg_rst	(spu_mul_areg_rst),
		     .spu_mamul_rst	(spu_mamul_rst),
		     .spu_mamul_mul_done(spu_mamul_mul_done),

		     .spu_mamul_jjptr_sel(spu_mamul_jjptr_sel),
		     // Inputs

		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
			.spu_mactl_kill_op		(spu_mactl_ma_kill_op),

		     .spu_maaeqb_jjptr_sel(spu_maaeqb_jjptr_sel),

		     .reset		(spu_mactl_ctl_reset),
		     .rclk		(rclk),
		 .se			(se),
		     //.si		(si),
		     //.se		(se),
		     .spu_maaddr_iequtwolenplus2(spu_maaddr_iequtwolenplus2),
		     .spu_maaddr_iequtwolenplus1(spu_maaddr_iequtwolenplus1),
		     .spu_maaddr_jequiminus1(spu_maaddr_jequiminus1),
		     .spu_maaddr_jequlen(spu_maaddr_jequlen),
		     .spu_maaddr_halfpnt_set(spu_maaddr_halfpnt_set),
		     .mul_spu_ack	(mul_spu_ack),
		     .mul_spu_shf_ack	(mul_spu_shf_ack),
		     .spu_mactl_mulop	(spu_mactl_mulop),
		     .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly),
		     .spu_mared_oprnd2_wen(spu_mared_oprnd2_wen),
		     .spu_maexp_start_mulred_anoteqb(spu_maexp_start_mulred_anoteqb),
		     .spu_mactl_expop	(spu_mactl_expop),
		     .spu_maaddr_aequb	(spu_maaddr_aequb),
		     .spu_maaeqb_rst_iptr(spu_maaeqb_rst_iptr),
		     .spu_maaeqb_rst_jptr(spu_maaeqb_rst_jptr),
		     .spu_maaeqb_incr_iptr(spu_maaeqb_incr_iptr),
		     .spu_maaeqb_incr_jptr(spu_maaeqb_incr_jptr),
		     .spu_maaeqb_a_rd_oprnd_sel(spu_maaeqb_a_rd_oprnd_sel),
		     .spu_maaeqb_ax_rd_oprnd_sel(spu_maaeqb_ax_rd_oprnd_sel),
		     .spu_maaeqb_m_rd_oprnd_sel(spu_maaeqb_m_rd_oprnd_sel),
		     .spu_maaeqb_me_rd_oprnd_sel(spu_maaeqb_me_rd_oprnd_sel),
		     .spu_maaeqb_n_rd_oprnd_sel(spu_maaeqb_n_rd_oprnd_sel),
		     .spu_maaeqb_m_wr_oprnd_sel(spu_maaeqb_m_wr_oprnd_sel),
		     .spu_maaeqb_me_wr_oprnd_sel(spu_maaeqb_me_wr_oprnd_sel),
		     .spu_maaeqb_iminus1_ptr_sel(spu_maaeqb_iminus1_ptr_sel),
		     .spu_maaeqb_j_ptr_sel(spu_maaeqb_j_ptr_sel),
		     .spu_maaeqb_iminusj_ptr_sel(spu_maaeqb_iminusj_ptr_sel),
		     .spu_maaeqb_iminuslenminus1_sel(spu_maaeqb_iminuslenminus1_sel),
		     .spu_maaeqb_jjptr_wen(spu_maaeqb_jjptr_wen),
		     .spu_maaeqb_oprnd2_wen(spu_maaeqb_oprnd2_wen),
		     .spu_maaeqb_oprnd2_bypass(spu_maaeqb_oprnd2_bypass),
		     .spu_maaeqb_oprnd1_mxsel(spu_maaeqb_oprnd1_mxsel[1:0]),
		     .spu_maaeqb_oprnd1_wen(spu_maaeqb_oprnd1_wen),
		     .spu_maaeqb_mul_req_vld(spu_maaeqb_mul_req_vld),
		     .spu_maaeqb_mul_areg_shf(spu_maaeqb_mul_areg_shf),
		     .spu_maaeqb_mul_acc(spu_maaeqb_mul_acc),
		     .spu_maaeqb_mul_areg_rst(spu_maaeqb_mul_areg_rst),
		     .spu_maaeqb_mul_done(spu_maaeqb_mul_done));

// -------------------------------------------------------------------------

spu_mared spu_mared (//in
		.mul_data_out_0			(mul_data_out[0]),		      
		     
		     /*AUTOINST*/
		     // Outputs
		     .spu_mared_data_sel_l(spu_mared_data_sel_l[3:0]),
		     .spu_mared_j_ptr_sel(spu_mared_j_ptr_sel),
		     .spu_mared_nm_rd_oprnd_sel(spu_mared_nm_rd_oprnd_sel),
		     .spu_mared_m_rd_oprnd_sel(spu_mared_m_rd_oprnd_sel),
		     .spu_mared_me_rd_oprnd_sel(spu_mared_me_rd_oprnd_sel),
		     .spu_mared_x_wr_oprnd_sel(spu_mared_x_wr_oprnd_sel),
		     .spu_mared_xe_wr_oprnd_sel(spu_mared_xe_wr_oprnd_sel),
		     .spu_mared_nr_rd_oprnd_sel(spu_mared_nr_rd_oprnd_sel),
		     .spu_mared_a_rd_oprnd_sel(spu_mared_a_rd_oprnd_sel),
		     .spu_mared_r_wr_oprnd_sel(spu_mared_r_wr_oprnd_sel),
		     .spu_mared_update_jptr(spu_mared_update_jptr),
		     .spu_mared_rst_jptr(spu_mared_rst_jptr),
		     .spu_mared_maxlen_wen(spu_mared_maxlen_wen),
		     .spu_mared_rdn_wen	(spu_mared_rdn_wen),
		     .spu_mared_oprnd2_wen(spu_mared_oprnd2_wen),
		     .spu_mared_memren	(spu_mared_memren),
		     .spu_mared_memwen	(spu_mared_memwen),
		     .spu_mared_cin_set_4sub(spu_mared_cin_set_4sub),
		     .spu_mared_cin_oprnd_sub_mod(spu_mared_cin_oprnd_sub_mod),
		     .spu_mared_done_set(spu_mared_done_set),
		     .spu_mared_start_wen(spu_mared_start_wen),
		     .spu_mared_start_sel(spu_mared_start_sel),
		     .spu_mared_red_done(spu_mared_red_done),
		     .spu_mared_update_redwr_jptr(spu_mared_update_redwr_jptr),
		     .spu_mared_jjptr_wen(spu_mared_jjptr_wen),
		     .spu_mared_not_idle(spu_mared_not_idle),
		     // Inputs

		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
			.spu_mactl_kill_op		(spu_mactl_ma_kill_op),

		     .reset		(spu_mactl_ctl_reset),
		     .rclk		(rclk),
		 .se			(se),
		     .spu_madp_m_eq_n	(spu_madp_m_eq_n),
		     .spu_madp_m_lt_n	(spu_madp_m_lt_n),
		     .spu_mactl_expop	(spu_mactl_expop),
		     .spu_mactl_mulop	(spu_mactl_mulop),
		     .spu_mactl_redop	(spu_mactl_redop),
		     .spu_mamul_mul_done(spu_mamul_mul_done),
		     .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly),
		     .spu_maaddr_jptr_eqz(spu_maaddr_jptr_eqz_mared),
		     .spu_maaddr_len_eqmax(spu_maaddr_len_eqmax),
		     .spu_mast_stbuf_wen(spu_mast_stbuf_wen),
		     .spu_madp_cout_oprnd_sub_mod(spu_madp_cout_oprnd_sub_mod));
// -------------------------------------------------------------------------

spu_maexp spu_maexp (//in
		     
		     /*AUTOINST*/
		     // Outputs
		     .spu_maexp_e_rd_oprnd_sel(spu_maexp_e_rd_oprnd_sel),
		     .spu_maexp_shift_e	(spu_maexp_shift_e),
		     .spu_maexp_e_data_wen(spu_maexp_e_data_wen),
		     .spu_maexp_incr_es_ptr(spu_maexp_incr_es_ptr),
		     .spu_maexp_es_max_init(spu_maexp_es_max_init),
		     .spu_maexp_es_e_ptr_rst(spu_maexp_es_e_ptr_rst),
		     .spu_maexp_done_set(spu_maexp_done_set),
		     .spu_maexp_memren	(spu_maexp_memren),
		     .spu_maexp_start_mulred_aequb(spu_maexp_start_mulred_aequb),
		     .spu_maexp_start_mulred_anoteqb(spu_maexp_start_mulred_anoteqb),
		     // Inputs

		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
			.spu_mactl_kill_op		(spu_mactl_ma_kill_op),

		     .reset		(spu_mactl_ctl_reset),
		     .rclk		(rclk),
		 .se			(se),
		     .spu_maaddr_esmax	(spu_maaddr_esmax),
		     .spu_maaddr_esmod64(spu_maaddr_esmod64),
		     .spu_madp_e_eq_one	(spu_madp_e_eq_one),
		     .spu_mared_red_done(spu_mared_red_done),
		     .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly),
		     .spu_mactl_expop	(spu_mactl_expop));

// -------------------------------------------------------------------------


spu_maaeqb spu_maaeqb (//out
                .spu_maaeqb_a_leftshft        	(spu_mul_mulres_lshft),
		       
		       /*AUTOINST*/
		       // Outputs
		       .spu_maaeqb_memwen(spu_maaeqb_memwen),
		       .spu_maaeqb_memren(spu_maaeqb_memren),
		       .spu_maaeqb_rst_iptr(spu_maaeqb_rst_iptr),
		       .spu_maaeqb_rst_jptr(spu_maaeqb_rst_jptr),
		       .spu_maaeqb_incr_iptr(spu_maaeqb_incr_iptr),
		       .spu_maaeqb_incr_jptr(spu_maaeqb_incr_jptr),
		       .spu_maaeqb_a_rd_oprnd_sel(spu_maaeqb_a_rd_oprnd_sel),
		       .spu_maaeqb_ax_rd_oprnd_sel(spu_maaeqb_ax_rd_oprnd_sel),
		       .spu_maaeqb_m_rd_oprnd_sel(spu_maaeqb_m_rd_oprnd_sel),
		       .spu_maaeqb_me_rd_oprnd_sel(spu_maaeqb_me_rd_oprnd_sel),
		       .spu_maaeqb_n_rd_oprnd_sel(spu_maaeqb_n_rd_oprnd_sel),
		       .spu_maaeqb_m_wr_oprnd_sel(spu_maaeqb_m_wr_oprnd_sel),
		       .spu_maaeqb_me_wr_oprnd_sel(spu_maaeqb_me_wr_oprnd_sel),
		       .spu_maaeqb_iminus1_ptr_sel(spu_maaeqb_iminus1_ptr_sel),
		       .spu_maaeqb_j_ptr_sel(spu_maaeqb_j_ptr_sel),
		       .spu_maaeqb_iminusj_ptr_sel(spu_maaeqb_iminusj_ptr_sel),
		       .spu_maaeqb_iminuslenminus1_sel(spu_maaeqb_iminuslenminus1_sel),
		       .spu_maaeqb_irshft_sel(spu_maaeqb_irshft_sel),
		       .spu_maaeqb_jjptr_wen(spu_maaeqb_jjptr_wen),
		       .spu_maaeqb_oprnd2_wen(spu_maaeqb_oprnd2_wen),
		       .spu_maaeqb_oprnd2_bypass(spu_maaeqb_oprnd2_bypass),
		     .spu_maaeqb_oprnd1_mxsel(spu_maaeqb_oprnd1_mxsel[1:0]),
		     .spu_maaeqb_oprnd1_wen(spu_maaeqb_oprnd1_wen),
		       .spu_maaeqb_mul_req_vld(spu_maaeqb_mul_req_vld),
		       .spu_maaeqb_mul_areg_shf(spu_maaeqb_mul_areg_shf),
		       .spu_maaeqb_mul_acc(spu_maaeqb_mul_acc),
		       .spu_maaeqb_mul_areg_rst(spu_maaeqb_mul_areg_rst),
		       .spu_maaeqb_mul_done(spu_maaeqb_mul_done),

		     .spu_maaeqb_jjptr_sel(spu_maaeqb_jjptr_sel),

		       // Inputs

		.spu_mactl_stxa_force_abort		(spu_mactl_stxa_force_abort),
			.spu_mactl_kill_op		(spu_mactl_ma_kill_op),

		       .reset		(spu_mactl_ctl_reset),
		       .rclk		(rclk),
		 .se			(se),
		       .spu_maaddr_iequtwolenplus2(spu_maaddr_iequtwolenplus2),
		       .spu_maaddr_iequtwolenplus1(spu_maaddr_iequtwolenplus1),
		       .spu_maaddr_jequiminus1(spu_maaddr_jequiminus1),
		       .spu_maaddr_jequlen(spu_maaddr_jequlen),
		       .spu_maaddr_halfpnt_set(spu_maaddr_halfpnt_set),
		       .mul_spu_ack	(mul_spu_ack),
		       .mul_spu_shf_ack	(mul_spu_shf_ack),
		       .spu_mactl_mulop	(spu_mactl_mulop),
		       .spu_mactl_iss_pulse_dly(spu_mactl_iss_pulse_dly),
		       .spu_maexp_start_mulred_aequb(spu_maexp_start_mulred_aequb),
		       .spu_mactl_expop	(spu_mactl_expop),
		       .spu_maaddr_jequiminus1rshft(spu_maaddr_jequiminus1rshft),
		       .spu_maaddr_iequtwolen(spu_maaddr_iequtwolen),
		       .spu_maaddr_ieven(spu_maaddr_ieven),
		       .spu_maaddr_ieq0	(spu_maaddr_ieq0),
		       .spu_maaddr_aequb(spu_maaddr_aequb));



endmodule
