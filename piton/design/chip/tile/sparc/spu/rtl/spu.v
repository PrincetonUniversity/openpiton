// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
//
// OpenSPARC T1 Processor File: spu.v
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


module spu (///*AUTOARG*/
short_si0,short_so0,short_si1,short_so1,si1,so1,


/*outputs*/

spu_ifu_err_addr_w2,
spu_ifu_mamem_err_w1,
spu_ifu_int_w2,
spu_lsu_ldxa_illgl_va_w2,

spu_ifu_ttype_w2,
spu_ifu_ttype_vld_w2,
spu_ifu_ttype_tid_w2,

spu_lsu_ldst_pckt,

spu_mul_req_vld,
spu_mul_areg_shf,
spu_mul_areg_rst,
spu_mul_acc,
spu_mul_op1_data,
spu_mul_op2_data,

spu_lsu_ldxa_data_w2,
spu_lsu_ldxa_data_vld_w2,
spu_lsu_ldxa_tid_w2,

spu_lsu_stxa_ack,
spu_lsu_stxa_ack_tid,

spu_mul_mulres_lshft,

spu_tlu_rsrv_illgl_m,

spu_ifu_corr_err_w2,
spu_ifu_unc_err_w1,
spu_lsu_unc_error_w2,


/*inputs*/
const_cpuid,
cpx_spu_data_cx,
lsu_spu_ldst_ack,

mul_spu_ack,
mul_spu_shf_ack,
mul_data_out,

lsu_spu_asi_state_e,
ifu_spu_inst_vld_w,
ifu_lsu_ld_inst_e,
ifu_lsu_st_inst_e,
ifu_lsu_alt_space_e,
ifu_tlu_thrid_e,
exu_lsu_ldst_va_e,
exu_lsu_rs3_data_e,

ifu_spu_trap_ack,

lsu_spu_stb_empty,
lsu_spu_strm_ack_cmplt,

lsu_spu_early_flush_g,
tlu_spu_flush_w,
ifu_spu_flush_w,

exu_spu_rsrv_data_e,
ifu_spu_nceen,

lsu_mamem_mrgn,
mem_write_disable,
mux_drive_disable,
mem_bypass,

se,
sehold,
grst_l,
arst_l,
rclk) ;


// ------------------------------------------------------------------
///*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input si1,short_si0,short_si1,se;
input                   rclk ;
input                   grst_l ;
input                   arst_l ;
input                   mem_write_disable ;
input                   mux_drive_disable ;
input                   sehold ;

input tlu_spu_flush_w;
input ifu_spu_flush_w;

input [2:0]     const_cpuid;

input [134:0] cpx_spu_data_cx;
input  lsu_spu_ldst_ack;

input mul_spu_ack;
input mul_spu_shf_ack;
input [63:0] mul_data_out;

input [7:0] lsu_spu_asi_state_e;
input ifu_spu_inst_vld_w;
input ifu_lsu_ld_inst_e;
input ifu_lsu_st_inst_e;
input ifu_lsu_alt_space_e;
input [1:0] ifu_tlu_thrid_e;
input [7:0] exu_lsu_ldst_va_e;
input [63:0] exu_lsu_rs3_data_e;

input  ifu_spu_trap_ack;

input [3:0] lsu_spu_stb_empty;
input [1:0] lsu_spu_strm_ack_cmplt;

input lsu_spu_early_flush_g;

input [2:0] exu_spu_rsrv_data_e;

input [3:0] ifu_spu_nceen;
input [3:0] lsu_mamem_mrgn;

input mem_bypass;

// End of automatics
// ------------------------------------------------------------------
///*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)

output so1,short_so1,short_so0;
output spu_ifu_ttype_w2;
output spu_ifu_ttype_vld_w2;
output [1:0] spu_ifu_ttype_tid_w2;

// ------------------------------

output [123:0] spu_lsu_ldst_pckt;

output spu_mul_req_vld;
output spu_mul_areg_shf;
output spu_mul_areg_rst;
output spu_mul_acc;
output [63:0] spu_mul_op1_data;
output [63:0] spu_mul_op2_data;
output [63:0] spu_lsu_ldxa_data_w2;
output spu_lsu_ldxa_data_vld_w2;
output [1:0] spu_lsu_ldxa_tid_w2;

output spu_lsu_stxa_ack;
output [1:0] spu_lsu_stxa_ack_tid;

output spu_mul_mulres_lshft;

output spu_tlu_rsrv_illgl_m;

output spu_ifu_corr_err_w2;
output spu_ifu_unc_err_w1;
output spu_lsu_unc_error_w2;

output [39:4] spu_ifu_err_addr_w2;
output spu_ifu_mamem_err_w1;
output spu_ifu_int_w2;
output spu_lsu_ldxa_illgl_va_w2;


// End of automatics
// ------------------------------------------------------------------


// ------------------------------------------------------------------
// ------------------------------------------------------------------

wire [123:0] spu_lsu_ldst_pckt;
wire [65:0] spu_madp_evedata;
wire [65:0] spu_madp_odddata;
wire [7:1] spu_maaddr_memindx;
wire [3:0] spu_maaddr_mamem_eveodd_sel_l;
wire [2:0] spu_mactl_memmxsel_l;
wire [38:3] spu_madp_mpa_addr_out;

wire [63:0] spu_mul_op1_data;
wire [63:0] spu_mul_op2_data;

wire [3:0] spu_mared_data_sel_l;
wire [63:0] spu_madp_store_data;


// ------------------------------------

wire [4:0] spu_maaddr_mpa_incr_val;

// --------------------------------------------------------------

wire spu_madp_perr;

wire [2:0]			spu_mamul_oprnd1_mxsel_l;	// From spu_ctl of spu_ctl.v

wire [1:0]		spu_ctl_ldxa_tid_w2;


wire [3:0] spu_lsurpt1_stb_empty;


   wire spu_ctl_ldxa_data_vld_w2,
        spu_mactl_madp_parflop_wen,
        spu_mactl_force_perr,
        spu_mactl_memeve_wen,
        spu_mactl_memodd_wen,
        spu_mactl_mamem_ren,
        spu_mactl_mamem_wen,
        spu_mamul_oprnd1_wen,
        spu_mactl_mem_reset_l,
        spu_madp_m_eq_n,
        spu_madp_m_lt_n,
        spu_madp_cout_oprnd_sub_mod,
        spu_madp_e_eq_one,
        spu_mamul_oprnd2_wen,
        spu_mamul_oprnd2_bypass,
        spu_mared_rdn_wen,
        spu_mared_cin_oprnd_sub_mod,
        spu_maexp_e_data_wen,
        spu_maexp_shift_e,
        spu_maaddr_mpa_addrinc,
        spu_maaddr_mpa_wen,
        spu_mactl_mpa_sel,
        spu_mactl_ldop,
        spu_ctl_ldxa_illgl_va_w;

wire [63:0] spu_lsurpt1_rs3_data_g2;

wire [134:0] spu_lsurpt1_cpx_data;
wire [134:0] spu_lsurpt2_cpx_data;

wire [122:0] spu_lsurpt1_ldst_pckt;

wire [63:0] spu_lsurpt1_ldxa_data;

wire spu_wen_pcx_wen, spu_wen_pcx_7170_sel;


wire [1:0] spu_ifu_ttype_tid_w;
wire spu_lsu_unc_error_w;

wire [65:0] spu_mamem_rd_eve_data;
wire [65:0] spu_mamem_rd_odd_data;
wire [122:104] spu_wen_pckt_req;

wire [63:0] spu_madp_ldxa_data;
wire [1:0] spu_lsu_stxa_ack_tid_ctl;

wire [3:0] spu_mactl_ldxa_data_w_sel_l;
wire  spu_mactl_ldxa_data_w_select;
wire  spu_mactl_mpa_wen;
wire  spu_mactl_maaddr_wen;
wire  spu_mactl_manp_wen;
wire  spu_wen_maln_wen;
wire  [13:0] spu_mactl_mactl_reg;
wire  [47:0] spu_madp_maaddr_reg;

   wire    scan1_1;
// End of automatics


/****************************************************************************/
spu_lsurpt spu_lsurpt2 (///*AUTOINST*/

             // Outputs
		.spu_lsurpt_ldxa_data_out	(spu_lsu_ldxa_data_w2[63:0]),
		.spu_lsurpt_ldst_pckt_out	(spu_lsu_ldst_pckt[122:0]),
                .spu_lsurpt_cpx_data_out	(spu_lsurpt2_cpx_data[134:0]),
             // Inputs
		.spu_lsurpt_ldxa_data_in	(spu_lsurpt1_ldxa_data[63:0]),
		.spu_lsurpt_ldst_pckt_in	(spu_lsurpt1_ldst_pckt[122:0]),
                .spu_lsurpt_cpx_data_in  	(cpx_spu_data_cx[134:0]));


/****************************************************************************/


spu_lsurpt1 spu_lsurpt1 (///*AUTOINST*/

             // Outputs
                .so                          	(scan1_1),
		.spu_lsu_ldst_pckt		(spu_lsurpt1_ldst_pckt[122:0]),

		.spu_lsu_ldxa_data_w2		(spu_lsurpt1_ldxa_data[63:0]),
		.spu_lsu_ldxa_data_vld_w2	(spu_lsu_ldxa_data_vld_w2),
		.spu_lsu_ldxa_tid_w2		(spu_lsu_ldxa_tid_w2[1:0]),


		.spu_lsu_ldxa_illgl_va_w2	(spu_lsu_ldxa_illgl_va_w2),

		.spu_lsurpt1_rs3_data_g2		(spu_lsurpt1_rs3_data_g2[63:0]),

		.spu_lsurpt1_stb_empty 		(spu_lsurpt1_stb_empty[3:0]),

		.spu_lsurpt_cpx_data_out 	(spu_lsurpt1_cpx_data[134:0]),

		.spu_ifu_ttype_tid_w2		(spu_ifu_ttype_tid_w2[1:0]),

		.spu_ifu_err_addr_w2 		(spu_ifu_err_addr_w2[39:4]),

		 .spu_lsu_unc_error_w2		(spu_lsu_unc_error_w2),

		 .spu_lsu_stxa_ack_tid		(spu_lsu_stxa_ack_tid[1:0]),
             // Inputs
		.spu_ifu_ttype_tid_w		(spu_ifu_ttype_tid_w[1:0]),
		 .spu_lsu_unc_error_w		(spu_lsu_unc_error_w),

		.exu_lsu_rs3_data_e		(exu_lsu_rs3_data_e[63:0]),

		.spu_ctl_ldxa_illgl_va_w	(spu_ctl_ldxa_illgl_va_w),

		.spu_ldstreq_pcx		({spu_wen_pckt_req[122:104],1'b0,spu_madp_mpa_addr_out[38:3],
							3'b000,spu_madp_store_data[63:0]}),

		.spu_madp_ldxa_data		(spu_madp_ldxa_data[63:0]),

		.spu_ctl_ldxa_data_vld_w2	(spu_ctl_ldxa_data_vld_w2),
		.spu_ctl_ldxa_tid_w2		(spu_ctl_ldxa_tid_w2[1:0]),

		.lsu_spu_stb_empty 		(lsu_spu_stb_empty[3:0]),

		.spu_lsurpt_cpx_data_in 	(spu_lsurpt2_cpx_data[134:0]),

		.spu_wen_pcx_wen		(spu_wen_pcx_wen),
		.spu_wen_pcx_7170_sel		(spu_wen_pcx_7170_sel),

		 .spu_lsu_stxa_ack_tid_ctl		(spu_lsu_stxa_ack_tid_ctl[1:0]),

                //.tmb_l  			(testmode_l),
                .se                          	(se),
                .si                          	(si1),
		.reset_l			(spu_mactl_mem_reset_l),
                .rclk                       	(rclk));

/****************************************************************************/

// -------------------------------------------------------------------------
// ------------------------ MA STUFF ---------------------------------------
bw_r_idct spu_mamem (
                 .rdtag_w3_y    ({spu_mamem_rd_eve_data[65],spu_mamem_rd_eve_data[63:32]}),
                 .rdtag_w2_y    ({spu_mamem_rd_eve_data[64],spu_mamem_rd_eve_data[31:0]}),
                 .rdtag_w1_y    ({spu_mamem_rd_odd_data[65],spu_mamem_rd_odd_data[63:32]}),
                 .rdtag_w0_y    ({spu_mamem_rd_odd_data[64],spu_mamem_rd_odd_data[31:0]}),

                 .wrtag_w3_y       ({spu_madp_evedata[65],spu_madp_evedata[63:32]}),
                 .wrtag_w2_y       ({spu_madp_evedata[64],spu_madp_evedata[31:0]}),
                 .wrtag_w1_y       ({spu_madp_odddata[65],spu_madp_odddata[63:32]}),
                 .wrtag_w0_y       ({spu_madp_odddata[64],spu_madp_odddata[31:0]}),

                 .wrtag_w3_x       (),
                 .wrtag_w2_x       (),
                 .wrtag_w1_x       (),
                 .wrtag_w0_x       (),

                 /*AUTOINST*/
                 // Outputs
                 .so                    (short_so0),
                 // Inputs
		 .rst_tri_en			(mem_write_disable),
                 .rclk                  (rclk),
                 .se                    (se),
                 .si                    (short_si0),
                 .reset_l               (arst_l),
                 .sehold                (sehold),
                 .index0_x              (spu_maaddr_memindx[7:1]),
                 .index1_x              (7'b0000000),
                 .index_sel_x           (1'b0),
                 .dec_wrway_x               ({spu_mactl_memeve_wen,spu_mactl_memeve_wen,
                                                spu_mactl_memodd_wen,spu_mactl_memodd_wen}),
                 .rdreq_x               (spu_mactl_mamem_ren),
                 .wrreq_x               (spu_mactl_mamem_wen),
                 .adj                   (lsu_mamem_mrgn[3:0]));


// -------------------------------------------------------------------------
spu_madp spu_madp (///*AUTOINST*/
             // Outputs
		.spu_madp_evedata		(spu_madp_evedata[65:0]),
		.spu_madp_odddata		(spu_madp_odddata[65:0]),


		.spu_mul_op2_data		(spu_mul_op2_data[63:0]),

		.spu_madp_m_eq_n		(spu_madp_m_eq_n),
		.spu_madp_m_lt_n		(spu_madp_m_lt_n),

		.spu_madp_store_data		(spu_madp_store_data[63:0]),

		.spu_madp_cout_oprnd_sub_mod	(spu_madp_cout_oprnd_sub_mod),

		.spu_madp_e_eq_one		(spu_madp_e_eq_one),

		.spu_madp_mpa_addr_out		(spu_madp_mpa_addr_out[38:3]),

		.spu_madp_perr			(spu_madp_perr),

                .spu_mul_op1_data               (spu_mul_op1_data[63:0]),

		.spu_madp_ldxa_data		(spu_madp_ldxa_data[63:0]),

		.spu_madp_maaddr_reg		(spu_madp_maaddr_reg[47:0]),

		.so				(short_so1),

             // Inputs
                .spu_mamul_oprnd1_mxsel_l       (spu_mamul_oprnd1_mxsel_l[2:0]),
                .spu_mamul_oprnd1_wen           (spu_mamul_oprnd1_wen),
                .spu_maaddr_mamem_eveodd_sel_l                   (spu_maaddr_mamem_eveodd_sel_l[3:0]),

                .spu_mamem_rd_eve_data                  (spu_mamem_rd_eve_data[65:0]),
                .spu_mamem_rd_odd_data                  (spu_mamem_rd_odd_data[65:0]),


		.mul_data_out			(mul_data_out[63:0]),



		.spu_mamul_oprnd2_wen		(spu_mamul_oprnd2_wen),
		.spu_mamul_oprnd2_bypass	(spu_mamul_oprnd2_bypass),

		.spu_mared_data_sel_l		(spu_mared_data_sel_l[3:0]),
		.spu_mared_rdn_wen		(spu_mared_rdn_wen),
		.spu_mared_cin_oprnd_sub_mod	(spu_mared_cin_oprnd_sub_mod),

		.spu_maexp_e_data_wen		(spu_maexp_e_data_wen),
		.spu_maexp_shift_e		(spu_maexp_shift_e),

		.spu_maaddr_mpa_addrinc		(spu_maaddr_mpa_addrinc),
		.spu_maaddr_mpa_incr_val	(spu_maaddr_mpa_incr_val[4:0]),
		.spu_mactl_mpa_sel		(spu_mactl_mpa_sel),

		.spu_mactl_ldop			(spu_mactl_ldop),

		.spu_mactl_madp_parflop_wen	(spu_mactl_madp_parflop_wen),

		.spu_mactl_memmxsel_l		(spu_mactl_memmxsel_l[2:0]),

                .spu_mactl_force_perr     	(spu_mactl_force_perr),

		.spu_maaddr_mpa_wen		(spu_maaddr_mpa_wen),

                .spu_mactl_mactl_reg            (spu_mactl_mactl_reg[13:0]),

                .spu_mactl_ldxa_data_w_sel_l    (spu_mactl_ldxa_data_w_sel_l[3:0]),
                .spu_mactl_ldxa_data_w_select   (spu_mactl_ldxa_data_w_select),

                .spu_mactl_mpa_wen              (spu_mactl_mpa_wen),
                .spu_mactl_maaddr_wen           (spu_mactl_maaddr_wen),
                .spu_mactl_manp_wen             (spu_mactl_manp_wen),
                .exu_spu_st_rs3_data_g2          (spu_lsurpt1_rs3_data_g2[63:0]),
                .spu_wen_maln_wen          (spu_wen_maln_wen),
                .lsu_spu_vload_data          (spu_lsurpt1_cpx_data[127:0]),


                .se     			(se),
                .si     			(short_si1),
                .sehold     			(sehold),


                .rclk                       (rclk));

//---------------------------------------------------
//--------------SPU CONTROL BLOCK--------------------
spu_ctl spu_ctl (
		     /*AUTOINST*/
		 // Outputs

		 .spu_wen_ldst_pcx_vld		(spu_lsu_ldst_pckt[123]),
		 .spu_mul_mulres_lshft		(spu_mul_mulres_lshft),
		.spu_maaddr_mpa_wen		(spu_maaddr_mpa_wen),
		 .spu_mamul_oprnd2_bypass	(spu_mamul_oprnd2_bypass),
		 .spu_mactl_ldop		(spu_mactl_ldop),
		 .so				(so1),
		 .spu_ifu_ttype_tid_w		(spu_ifu_ttype_tid_w[1:0]),
		 .spu_ifu_ttype_vld_w2		(spu_ifu_ttype_vld_w2),
		 .spu_ifu_ttype_w2		(spu_ifu_ttype_w2),
		 .spu_lsu_ldxa_data_vld_w2	(spu_ctl_ldxa_data_vld_w2),
		 .spu_lsu_ldxa_tid_w2		(spu_ctl_ldxa_tid_w2[1:0]),
		 .spu_lsu_stxa_ack		(spu_lsu_stxa_ack),
		 .spu_lsu_stxa_ack_tid		(spu_lsu_stxa_ack_tid_ctl[1:0]),
		 .spu_maaddr_memindx		(spu_maaddr_memindx[7:1]),
                .spu_maaddr_mamem_eveodd_sel_l                   (spu_maaddr_mamem_eveodd_sel_l[3:0]),

		 .spu_maaddr_mpa_addrinc	(spu_maaddr_mpa_addrinc),
		 .spu_maaddr_mpa_incr_val	(spu_maaddr_mpa_incr_val[4:0]),
		 .spu_mactl_force_perr		(spu_mactl_force_perr),
		 .spu_mactl_madp_parflop_wen	(spu_mactl_madp_parflop_wen),
		 .spu_mactl_mamem_ren		(spu_mactl_mamem_ren),
		 .spu_mactl_mamem_wen		(spu_mactl_mamem_wen),
		 .spu_mactl_memeve_wen		(spu_mactl_memeve_wen),
		 .spu_mactl_memmxsel_l		(spu_mactl_memmxsel_l[2:0]),
		 .spu_mactl_memodd_wen		(spu_mactl_memodd_wen),
		 .spu_mactl_mpa_sel		(spu_mactl_mpa_sel),
		 .spu_maexp_e_data_wen		(spu_maexp_e_data_wen),
		 .spu_maexp_shift_e		(spu_maexp_shift_e),
		.spu_mamul_oprnd1_mxsel_l	(spu_mamul_oprnd1_mxsel_l[2:0]),
		.spu_mamul_oprnd1_wen		(spu_mamul_oprnd1_wen),
		 .spu_mamul_oprnd2_wen		(spu_mamul_oprnd2_wen),
		 .spu_mared_cin_oprnd_sub_mod	(spu_mared_cin_oprnd_sub_mod),
		 .spu_mared_data_sel_l		(spu_mared_data_sel_l[3:0]),
		 .spu_mared_rdn_wen		(spu_mared_rdn_wen),
		 .spu_mul_acc			(spu_mul_acc),
		 .spu_mul_areg_rst		(spu_mul_areg_rst),
		 .spu_mul_areg_shf		(spu_mul_areg_shf),
		 .spu_mul_req_vld		(spu_mul_req_vld),
		 .spu_tlu_rsrv_illgl_m		(spu_tlu_rsrv_illgl_m),

		 .spu_ifu_corr_err_w2		(spu_ifu_corr_err_w2),
		 .spu_ifu_unc_err_w		(spu_ifu_unc_err_w1),
		 .spu_lsu_unc_error_w		(spu_lsu_unc_error_w),

		 .spu_ifu_mamem_err_w		(spu_ifu_mamem_err_w1),
		 .spu_ifu_int_w2		(spu_ifu_int_w2),
		 .spu_lsu_ldxa_illgl_va_w2	(spu_ctl_ldxa_illgl_va_w),

		 .spu_mactl_mem_reset_l		(spu_mactl_mem_reset_l),

		 .spu_mactl_ldxa_data_w_sel_l		(spu_mactl_ldxa_data_w_sel_l[3:0]),
		 .spu_mactl_ldxa_data_w_select		(spu_mactl_ldxa_data_w_select),
		 .spu_mactl_mpa_wen		(spu_mactl_mpa_wen),
		 .spu_mactl_maaddr_wen		(spu_mactl_maaddr_wen),
		 .spu_mactl_manp_wen		(spu_mactl_manp_wen),
		 .spu_wen_maln_wen		(spu_wen_maln_wen),
		 .spu_mactl_mactl_reg		(spu_mactl_mactl_reg[13:0]),
		 // Inputs
		.spu_madp_maaddr_reg		(spu_madp_maaddr_reg[47:0]),


		 .sehold			(sehold),

		 .mem_bypass			(mem_bypass),
		 .mux_drive_disable		(mux_drive_disable),
		 .tlu_spu_flush_w		(tlu_spu_flush_w),
		 .ifu_spu_flush_w		(ifu_spu_flush_w),

		.lsu_spu_stb_empty		(spu_lsurpt1_stb_empty[3:0]),

		 .lsu_spu_strm_ack_cmplt	(lsu_spu_strm_ack_cmplt[1:0]),

		 .cpx_spu_data_cx		(spu_lsurpt1_cpx_data[134:128]),
		 .spu_wen_pckt_req		(spu_wen_pckt_req[122:104]),
		 .lsu_spu_ldst_ack		(lsu_spu_ldst_ack),
		 .ifu_spu_trap_ack		(ifu_spu_trap_ack),
		 .lsu_tlu_st_rs3_data_g		(spu_lsurpt1_rs3_data_g2[13:0]),
		 .spu_lsurpt1_rsrv_data_e	(exu_spu_rsrv_data_e[2:0]),
		 .spu_madp_mpa_addr		(spu_madp_mpa_addr_out[3:3]),
		 .mul_data_out			(mul_data_out[0:0]),
		 .rclk				(rclk),
		 .exu_lsu_ldst_va_e		(exu_lsu_ldst_va_e[7:0]),
		 .ifu_lsu_alt_space_e		(ifu_lsu_alt_space_e),
		 .ifu_lsu_ld_inst_e		(ifu_lsu_ld_inst_e),
		 .ifu_lsu_st_inst_e		(ifu_lsu_st_inst_e),
		 .ifu_spu_inst_vld_w		(ifu_spu_inst_vld_w),
		 .ifu_tlu_thrid_e		(ifu_tlu_thrid_e[1:0]),
		 .lsu_spu_asi_state_e		(lsu_spu_asi_state_e[7:0]),
		 .mul_spu_ack			(mul_spu_ack),
		 .mul_spu_shf_ack		(mul_spu_shf_ack),
		 .grst_l			(grst_l),
		 .arst_l			(arst_l),
		 .se				(se),
		 .si				(scan1_1),
		.spu_wen_pcx_wen		(spu_wen_pcx_wen),
		.spu_wen_pcx_7170_sel		(spu_wen_pcx_7170_sel),
		.cpuid				(const_cpuid[2:0]),
		.ifu_spu_nceen			(ifu_spu_nceen[3:0]),

		 .spu_madp_cout_oprnd_sub_mod	(spu_madp_cout_oprnd_sub_mod),
		 .spu_madp_e_eq_one		(spu_madp_e_eq_one),
		 .spu_madp_m_eq_n		(spu_madp_m_eq_n),
		 .spu_madp_m_lt_n		(spu_madp_m_lt_n),
		 .spu_madp_perr		(spu_madp_perr),
		 .lsu_spu_early_flush_g		(lsu_spu_early_flush_g));

endmodule
