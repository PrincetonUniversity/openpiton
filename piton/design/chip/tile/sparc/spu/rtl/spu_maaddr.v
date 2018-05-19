// Modified by Princeton University on June 9th, 2015
// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T1 Processor File: spu_maaddr.v
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
//      Description:    adderss generator for MA.
// 			MPA,MA_ADDR,LENGTH,I_PTR,J_PTR...
*/
////////////////////////////////////////////////////////////////////////
// Global header file includes
////////////////////////////////////////////////////////////////////////

module spu_maaddr (

/*outputs*/
spu_maaddr_len_neqz,
spu_maaddr_mpa1maddr0,
spu_maaddr_memindx,
spu_maaddr_mamem_eveodd_sel_l,
spu_maaddr_iequtwolenplus2,
spu_maaddr_iequtwolenplus1,
spu_maaddr_jequiminus1,
spu_maaddr_jequlen,

spu_maaddr_halfpnt_set,

spu_maaddr_len_eqmax,

spu_maaddr_esmax,
spu_maaddr_esmod64,

spu_maaddr_nooddwr_on_leneq1,

spu_maaddr_mpa_addrinc,
spu_maaddr_mpa_wen,
spu_maaddr_mpa_incr_val,

spu_maaddr_len_cntr,

spu_maaddr_wrindx_0,
spu_maaddr_jptr_eqz_mared,

/*inputs*/

spu_mald_force_mpa_add16,

spu_mactl_iss_pulse_pre,
spu_mactl_iss_pulse,


//spu_mactl_mulop,
spu_mactl_ldop,
spu_madp_maaddr_reg_in,
spu_madp_mactl_reg,

spu_mald_maaddr_addrinc,
spu_mald_mpa_addrinc,
spu_mast_maaddr_addrinc,
spu_mast_mpa_addrinc,

spu_mamul_memwen,

spu_mamul_rst_iptr,
spu_mamul_rst_jptr,
spu_mamul_incr_iptr,
spu_mamul_incr_jptr,

spu_mamul_a_rd_oprnd_sel,
spu_mamul_ax_rd_oprnd_sel,
spu_mamul_b_rd_oprnd_sel,
spu_mamul_ba_rd_oprnd_sel,
spu_mamul_m_rd_oprnd_sel,
spu_mamul_n_rd_oprnd_sel,
spu_mamul_m_wr_oprnd_sel,

spu_mared_me_rd_oprnd_sel,
spu_mared_xe_wr_oprnd_sel,
spu_mamul_me_rd_oprnd_sel,
spu_mamul_me_wr_oprnd_sel,

spu_mamul_i_ptr_sel,
spu_mamul_iminus1_ptr_sel,
spu_mamul_j_ptr_sel,
spu_mamul_iminusj_ptr_sel,
spu_mamul_iminuslenminus1_sel,

spu_mamul_jjptr_wen,

spu_mared_m_rd_oprnd_sel,
spu_mared_nm_rd_oprnd_sel,
spu_mared_x_wr_oprnd_sel,
spu_mared_a_rd_oprnd_sel,
spu_mared_nr_rd_oprnd_sel,
spu_mared_r_wr_oprnd_sel,
spu_mared_memwen,
spu_mared_j_ptr_sel,
spu_mared_update_jptr,
spu_mared_rst_jptr,
spu_mared_maxlen_wen,
spu_mared_cin_set_4sub,

spu_mast_memren,
spu_mared_start_wen,
spu_mared_start_sel,

spu_maexp_incr_es_ptr,
spu_maexp_e_rd_oprnd_sel,
spu_maexp_es_max_init,
spu_maexp_es_e_ptr_rst,

spu_madp_mpa_addr_3,



spu_maaddr_jequiminus1rshft,
spu_maaddr_iequtwolen,
spu_maaddr_ieven,
spu_maaddr_ieq0,

spu_maaddr_aequb,

spu_maaeqb_memwen,
spu_maaeqb_irshft_sel,

spu_mared_update_redwr_jptr,
spu_mared_jjptr_wen,

spu_mamul_jjptr_sel,

mem_bypass,
sehold,

spu_mamul_rst,

se,
reset,
rclk);

// ---------------------------------------------------------------
input reset;
input rclk;
input se;


input spu_mald_force_mpa_add16;

input spu_mactl_ldop;
//input spu_mactl_mulop;
input [47:0] spu_madp_maaddr_reg_in;
input [5:0] spu_madp_mactl_reg;

input spu_mald_maaddr_addrinc;
input spu_mald_mpa_addrinc;
input spu_mast_maaddr_addrinc;
input spu_mast_mpa_addrinc;

input spu_mamul_memwen;
input spu_mamul_rst_iptr;
input spu_mamul_rst_jptr;
input spu_mamul_incr_iptr;
input spu_mamul_incr_jptr;

input spu_mamul_a_rd_oprnd_sel;
input spu_mamul_ax_rd_oprnd_sel;
input spu_mamul_b_rd_oprnd_sel;
input spu_mamul_ba_rd_oprnd_sel;
input spu_mamul_m_rd_oprnd_sel;
input spu_mamul_n_rd_oprnd_sel;
input spu_mamul_m_wr_oprnd_sel;

input spu_mared_me_rd_oprnd_sel;
input spu_mared_xe_wr_oprnd_sel;
input spu_mamul_me_rd_oprnd_sel;
input spu_mamul_me_wr_oprnd_sel;

input spu_mamul_i_ptr_sel;
input spu_mamul_iminus1_ptr_sel;
input spu_mamul_j_ptr_sel;
input spu_mamul_iminusj_ptr_sel;
input spu_mamul_iminuslenminus1_sel;

input spu_mamul_jjptr_wen;

input spu_mactl_iss_pulse_pre;
input spu_mactl_iss_pulse;

input spu_mared_m_rd_oprnd_sel;
input spu_mared_nm_rd_oprnd_sel;
input spu_mared_x_wr_oprnd_sel;
input spu_mared_a_rd_oprnd_sel;
input spu_mared_nr_rd_oprnd_sel;
input spu_mared_r_wr_oprnd_sel;
input spu_mared_memwen;
input spu_mared_j_ptr_sel;
input spu_mared_update_jptr;
input spu_mared_rst_jptr;
input spu_mared_maxlen_wen;
input spu_mared_cin_set_4sub;

input spu_mast_memren;
input spu_mared_start_wen;
input spu_mared_start_sel;

input spu_maexp_incr_es_ptr;
input spu_maexp_e_rd_oprnd_sel;
input spu_maexp_es_max_init;
input spu_maexp_es_e_ptr_rst;


input spu_madp_mpa_addr_3;
input spu_maaeqb_memwen;
input spu_maaeqb_irshft_sel;

input spu_mared_update_redwr_jptr;
input spu_mared_jjptr_wen;

input spu_mamul_jjptr_sel;

input mem_bypass;
input sehold;

input spu_mamul_rst;
// ---------------------------------------------------------------
output spu_maaddr_len_neqz;

output spu_maaddr_mpa1maddr0;

output [7:1] spu_maaddr_memindx;
output [3:0] spu_maaddr_mamem_eveodd_sel_l;

output spu_maaddr_iequtwolenplus2;
output spu_maaddr_iequtwolenplus1;
output spu_maaddr_jequiminus1;
output spu_maaddr_jequlen;

output spu_maaddr_halfpnt_set;

output spu_maaddr_len_eqmax;

output spu_maaddr_esmod64;
output spu_maaddr_esmax;

output spu_maaddr_nooddwr_on_leneq1;

output spu_maaddr_mpa_addrinc;
output spu_maaddr_mpa_wen;
output [4:0] spu_maaddr_mpa_incr_val;




output spu_maaddr_jequiminus1rshft;
output spu_maaddr_iequtwolen;
output spu_maaddr_ieven;
output spu_maaddr_ieq0;

output spu_maaddr_aequb;

output [5:0] spu_maaddr_len_cntr;

output spu_maaddr_wrindx_0;
output spu_maaddr_jptr_eqz_mared;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

wire reset_local = reset | spu_mactl_iss_pulse_pre;

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

wire [47:0] spu_madp_maaddr_reg;
wire [6:0] len_decr_val,len_ptr_sub_q,len_ptr_mx,len_ptr_sub;
wire incr_2wd;
wire [1:0] len_1or2_dec;

wire [7:0] maaddr_mx,maaddr_incr_val,spu_maaddr_maaddr_add,spu_maaddr_maaddr_q;
wire maaddr_wen;

wire [6:0] j_ptr_data;
// ---------------------------------------------------------------
// ---------------------------------------------------------------

dffe_s  #(48) maaddr_reg_ff  (
        .din(spu_madp_maaddr_reg_in[47:0]) ,
        .q(spu_madp_maaddr_reg[47:0]),
        .en(spu_mactl_iss_pulse_pre),
        .clk (rclk), .se(se), .si(), .so());


// ---------------------------------------------------------------
wire spu_maaddr_maaddr_addrinc = spu_mald_maaddr_addrinc | spu_mast_maaddr_addrinc;
assign spu_maaddr_mpa_addrinc = spu_mald_mpa_addrinc | spu_mast_mpa_addrinc;
// ---------------------------------------------------------------
// ***************** LEN *******************
// --------------------------------------------------------------

wire len_wen = spu_maaddr_maaddr_addrinc | spu_mactl_iss_pulse;

mux2ds  #(7) len_issorex_mx (
        .in0    (len_ptr_sub_q[6:0]), 
        .in1    ({1'b0,spu_madp_mactl_reg[5:0]}), 
        .sel0   (spu_maaddr_maaddr_addrinc),  
        .sel1   (~spu_maaddr_maaddr_addrinc),
        .dout   (len_ptr_mx[6:0])
);

// for memload decr by 16bytes(2words) and for memstore & mulop decr by
// 8bytes(1word) or when transferring one word rather than two from 
// ld buf to mamem.


mux2ds  #(2) len_1or2_mx (
        .in0    (2'b01), // already inverted
        .in1    (2'b10), 
        .sel0   (incr_2wd),
        .sel1   (~incr_2wd),
        .dout   (len_1or2_dec[1:0])
);


mux2ds  #(7) len_ptr_iss_mx (
        .in0    (7'b0000000), 
        .in1    ({5'b11111,len_1or2_dec[1:0]}), 
        .sel0   (spu_mactl_iss_pulse),  
        .sel1   (~spu_mactl_iss_pulse),
        .dout   (len_decr_val[6:0])
);

assign len_ptr_sub[6:0] = len_ptr_mx[6:0] + len_decr_val[6:0] + 
						7'b0000001; 

dffre_s  #(7) len_ptr_ff  (
        .din(len_ptr_sub[6:0]) ,
        .q(len_ptr_sub_q[6:0]),
        .en(len_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

assign spu_maaddr_len_neqz = |len_ptr_sub_q[6:0];

// his for the case when the len has been decremented to 1 and there
// is possibilty the next decr will be -2 which makes the len be a
// neg number.

wire allow_incr_2wd = (|len_ptr_sub_q[6:1]) & spu_mactl_ldop;



// when mpa0maddr0 make sure the last write does not happen to 
// odd side when len has reached one. mpa=0 and maddr=0 are checked in
// spu_mactl.v.

assign spu_maaddr_nooddwr_on_leneq1 = ~(~allow_incr_2wd & len_ptr_sub_q[0]); 


wire [5:0] spu_maaddr_len_cntr_l;
assign spu_maaddr_len_cntr_l[5:0] = ~len_ptr_sub_q[5:0];
assign spu_maaddr_len_cntr[5:0] = ~spu_maaddr_len_cntr_l[5:0];

// --------------------------------------------------------------
// ***************** MPA *******************
// --------------------------------------------------------------

wire mpa_incr_2wd = incr_2wd | spu_mald_force_mpa_add16;


mux2ds  #(5) mpa_iss_mx (
        .in0    (5'b10000),
        .in1    (5'b01000),
        .sel0   (mpa_incr_2wd),  
        .sel1   (~mpa_incr_2wd),
        .dout   (spu_maaddr_mpa_incr_val[4:0])
);


assign spu_maaddr_mpa_wen = spu_maaddr_mpa_addrinc | spu_mactl_iss_pulse;

// --------------------------------------------------------------
// ***************** MA_ADDR *******************
// --------------------------------------------------------------

mux2ds  #(8) maaddr_issorex_mx (
        .in0    (spu_maaddr_maaddr_add[7:0]), 
        .in1    (spu_madp_maaddr_reg[7:0]), 
        .sel0   (spu_maaddr_maaddr_addrinc),  
        .sel1   (~spu_maaddr_maaddr_addrinc),
        .dout   (maaddr_mx[7:0])
);


mux2ds  #(8) maaddr_iss_mx (
        .in0    (8'b00000010),
        .in1    (8'b00000001), 
        .sel0   (incr_2wd),  
        .sel1   (~incr_2wd),
        .dout   (maaddr_incr_val[7:0])
);

assign spu_maaddr_maaddr_add[7:0] = spu_maaddr_maaddr_q[7:0] + maaddr_incr_val[7:0];

assign maaddr_wen = spu_maaddr_maaddr_addrinc | spu_mactl_iss_pulse;

dffre_s  #(8) maaadr_pa_mx  (
        .din(maaddr_mx[7:0]) ,
        .q(spu_maaddr_maaddr_q[7:0]),
	.en(maaddr_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());


// --------------------------------------------------------------
// ***************** INCR VALUE DECODE *******************
// --------------------------------------------------------------

// 16byte increments for load from L2 and 8byte increment for
// store to L2 or if its 8byte transfer from ld buff to mamem.


assign incr_2wd = ~spu_madp_mpa_addr_3 & ~spu_maaddr_maaddr_q[0] & spu_mactl_ldop &
				allow_incr_2wd;



assign spu_maaddr_mpa1maddr0 = spu_madp_mpa_addr_3 & ~spu_maaddr_maaddr_q[0] & 
					spu_mactl_ldop;


// --------------------------------------------------------------
// --------------------------------------------------------------
// ******************* A == B ******************
// --------------------------------------------------------------
// --------------------------------------------------------------

assign spu_maaddr_aequb = (spu_madp_maaddr_reg[7:0] == spu_madp_maaddr_reg[15:8]);

// --------------------------------------------------------------
// --------------------------------------------------------------
// ***************** MEMINDEX *******************
// --------------------------------------------------------------
// --------------------------------------------------------------

wire [7:0] memld_wroffset,x_mul_wroffset,m_mul_wroffset,r_red_wroffset,
		x_exp_wroffset,memst_rdoffset,mmx_mulredexp_rdoffset,nrn_mulredexp_rdoffset,
		bnm_mulredexp_rdoffset,aaa_mulredexp_rdoffset,e_exp_rdoffset;


assign memld_wroffset = spu_maaddr_maaddr_q[7:0];

assign x_mul_wroffset = spu_madp_maaddr_reg[39:32];
assign m_mul_wroffset = spu_madp_maaddr_reg[31:24];
assign r_red_wroffset = spu_madp_maaddr_reg[23:16];
assign x_exp_wroffset = spu_madp_maaddr_reg[31:24];

assign memst_rdoffset = spu_maaddr_maaddr_q[7:0];

assign mmx_mulredexp_rdoffset = spu_madp_maaddr_reg[31:24];
assign nrn_mulredexp_rdoffset = spu_madp_maaddr_reg[23:16];
assign bnm_mulredexp_rdoffset = spu_madp_maaddr_reg[15:8];
assign aaa_mulredexp_rdoffset = spu_madp_maaddr_reg[7:0];
assign e_exp_rdoffset = spu_madp_maaddr_reg[39:32];

// --------------- WR INDEX -------------------------------------

wire [7:0] wroffset_a,wroffset_b,wr_offset;
wire [7:0] rdoffset_a,rdoffset_b,rd_offset;

wire wr_a_sel = spu_mactl_ldop | spu_mamul_m_wr_oprnd_sel |
		spu_mared_x_wr_oprnd_sel;

/******
// converting muxes to AO logic to fix 0in problems.
mux3ds  #(8) wroffset_a_mx (
        .in0    (memld_wroffset[7:0]), 
        .in1    (x_mul_wroffset[7:0]), 
        .in2    (m_mul_wroffset[7:0]), 
        .sel0   (spu_mactl_ldop),  
        .sel1   (spu_mared_x_wr_oprnd_sel),
        .sel2   (spu_mamul_m_wr_oprnd_sel),
        .dout   (wroffset_a[7:0])
);

mux3ds  #(8) wroffset_b_mx (
        .in0    (r_red_wroffset[7:0]),
        .in1    (x_exp_wroffset[7:0]), 
        .in2    (spu_madp_maaddr_reg[15:8]), 
        .sel0   (spu_mared_r_wr_oprnd_sel),  
        .sel1   (spu_mared_xe_wr_oprnd_sel),
        .sel2   (spu_mamul_me_wr_oprnd_sel),
        .dout   (wroffset_b[7:0])
);

******/

assign wroffset_a[7:0] = 
			(memld_wroffset[7:0] & {8{spu_mactl_ldop}}) |
			(x_mul_wroffset[7:0] & {8{spu_mared_x_wr_oprnd_sel}}) |
			(m_mul_wroffset[7:0] & {8{spu_mamul_m_wr_oprnd_sel}}) ;

assign wroffset_b[7:0] =
			(r_red_wroffset[7:0] & {8{spu_mared_r_wr_oprnd_sel}}) |
			(x_exp_wroffset[7:0] & {8{spu_mared_xe_wr_oprnd_sel}}) |
			(spu_madp_maaddr_reg[15:8] & {8{spu_mamul_me_wr_oprnd_sel}}) ;




mux2ds  #(8) wroffset_mx (
        .in0    (wroffset_a[7:0]),
        .in1    (wroffset_b[7:0]), 
        .sel0   (wr_a_sel),  
        .sel1   (~wr_a_sel),
        .dout   (wr_offset[7:0])
);

// --------------- RD INDEX -------------------------------------
wire [2:0] rd_a_sel;
wire [2:0] rd_b_sel;

// sel for store needs to be added
wire rd_a_select = spu_mamul_m_rd_oprnd_sel | spu_mamul_n_rd_oprnd_sel |
		spu_mared_m_rd_oprnd_sel | spu_mared_nm_rd_oprnd_sel |
		spu_mamul_ax_rd_oprnd_sel | 
			spu_mast_memren; 

assign rd_a_sel[0] = spu_mast_memren;
assign rd_a_sel[1] = spu_mamul_m_rd_oprnd_sel | spu_mared_m_rd_oprnd_sel |
			spu_mamul_ax_rd_oprnd_sel ;
assign rd_a_sel[2] = spu_mamul_n_rd_oprnd_sel | spu_mared_nm_rd_oprnd_sel;

assign rd_b_sel[0] = spu_mamul_b_rd_oprnd_sel | spu_mared_nr_rd_oprnd_sel |
			spu_mared_me_rd_oprnd_sel | spu_mamul_me_rd_oprnd_sel;
assign rd_b_sel[1] = spu_mamul_a_rd_oprnd_sel | spu_mared_a_rd_oprnd_sel |
			spu_mamul_ba_rd_oprnd_sel;
assign rd_b_sel[2] = spu_maexp_e_rd_oprnd_sel;


/***************
mux3ds  #(8) rdoffset_a_mx (
        .in0    (memst_rdoffset[7:0]),
        .in1    (mmx_mulredexp_rdoffset[7:0]), 
        .in2    (nrn_mulredexp_rdoffset[7:0]), 
        .sel0   (rd_a_sel[0]),  
        .sel1   (rd_a_sel[1]),
        .sel2   (rd_a_sel[2]),
        .dout   (rdoffset_a[7:0])
);

mux3ds  #(8) rdoffset_b_mx (
        .in0    (bnm_mulredexp_rdoffset[7:0]),
        .in1    (aaa_mulredexp_rdoffset[7:0]), 
        .in2    (e_exp_rdoffset[7:0]), 
        .sel0   (rd_b_sel[0]),  
        .sel1   (rd_b_sel[1]),
        .sel2   (rd_b_sel[2]),
        .dout   (rdoffset_b[7:0])
);
****************/

assign rdoffset_a[7:0] =
			(memst_rdoffset[7:0] & {8{rd_a_sel[0]}}) |
			(mmx_mulredexp_rdoffset[7:0] & {8{rd_a_sel[1]}}) |
			(nrn_mulredexp_rdoffset[7:0] & {8{rd_a_sel[2]}}) ;

assign rdoffset_b[7:0] =
                        (bnm_mulredexp_rdoffset[7:0] & {8{rd_b_sel[0]}}) |
                        (aaa_mulredexp_rdoffset[7:0] & {8{rd_b_sel[1]}}) |
                        (e_exp_rdoffset[7:0] & {8{rd_b_sel[2]}}) ;




mux2ds  #(8) rdoffset_mx (
        .in0    (rdoffset_a[7:0]),
        .in1    (rdoffset_b[7:0]), 
        .sel0   (rd_a_select),  
        .sel1   (~rd_a_select),
        .dout   (rd_offset[7:0])
);


// --------------------------------------------------------------

// spu_mamul_memwen is true when m[i] operand is updated.
wire mem_wr_op = spu_mactl_ldop | spu_mamul_memwen | spu_mared_memwen |
				spu_maaeqb_memwen;

wire [7:0] memoffset;

mux2ds  #(8) memoffset_rd_wr (
        .in0    (wr_offset[7:0]),
        .in1    (rd_offset[7:0]), 
        .sel0   (mem_wr_op),  
        .sel1   (~mem_wr_op),
        .dout   (memoffset[7:0])
);


// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------

wire [6:0] j_ptr,j_ptr_add;
wire [5:0] len;
wire [6:0] twolen,lenplus1,twolenplus2,iminus1_rshft,i_rshft,
		twolenplus1,iminus1_ptr,iminus_len,i_ptr_add,i_ptr;

wire i_equ_lenplus1,j_equ_iminus1rshft,
		j_equ_iminus1,
		i_ptr_rst;

//wire i_equ_zero;
		

// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
// ------------ FINAL ADDER & ADDVAL MUX FOR MEMINDEX -----------
// --------------------------------------------------------------
// --------------------------------------------------------------
// --------------------------------------------------------------
wire [6:0] jj_ptr;
wire [6:0] e_ptr;
wire [6:0] j_ptr_redwr_val;

wire [6:0] add_val,addval_a,addval_b;
wire [6:0] iminusj_ptr,iminus1_lenminus1;

wire add_a_sel = spu_mamul_iminuslenminus1_sel |
			spu_mamul_iminus1_ptr_sel | 
			spu_mamul_i_ptr_sel | spu_maaeqb_irshft_sel; 

wire mulred_j_ptr_sel = spu_mamul_j_ptr_sel | spu_mared_j_ptr_sel;
wire add_b_sel = mulred_j_ptr_sel | spu_mamul_iminusj_ptr_sel |
				spu_maexp_e_rd_oprnd_sel | spu_mared_memwen;

//wire add_c_sel = ~(add_a_sel | add_b_sel);

/*****
mux4ds  #(7) addval_a_mux (
        .in0    (iminus1_lenminus1[6:0]),
        .in1    (iminus1_ptr[6:0]), 
        .in2    (i_rshft[6:0]), 
        .in3    (i_ptr[6:0]), 
        .sel0   (spu_mamul_iminuslenminus1_sel),  
        .sel1   (spu_mamul_iminus1_ptr_sel),
        .sel2   (spu_maaeqb_irshft_sel),
        .sel3   (spu_mamul_i_ptr_sel),
        .dout   (addval_a[6:0])
);

*******/

assign addval_a[6:0] = 
			(iminus1_lenminus1[6:0] & {7{spu_mamul_iminuslenminus1_sel}}) |
			(iminus1_ptr[6:0] & {7{spu_mamul_iminus1_ptr_sel}}) |
			(i_rshft[6:0] & {7{spu_maaeqb_irshft_sel}}) |
			(i_ptr[6:0] & {7{spu_mamul_i_ptr_sel}}) ;

/****** 
mux4ds  #(7) addval_b_mux (
        .in0    (jj_ptr[6:0]),
        .in1    (iminusj_ptr[6:0]),
        .in2    (e_ptr[6:0]),
        .in3    (j_ptr_redwr_val[6:0]),
        .sel0   (mulred_j_ptr_sel),
        .sel1   (spu_mamul_iminusj_ptr_sel),
        .sel2   (spu_maexp_e_rd_oprnd_sel),
        .sel3   (spu_mared_memwen),
        .dout   (addval_b[6:0])
);
**********/

assign addval_b[6:0] = 
			(jj_ptr[6:0] & {7{mulred_j_ptr_sel}}) |
			(iminusj_ptr[6:0] & {7{spu_mamul_iminusj_ptr_sel}}) |
			(e_ptr[6:0] & {7{spu_maexp_e_rd_oprnd_sel}}) |
			(j_ptr_redwr_val[6:0] & {7{spu_mared_memwen}}) ;
			

/*******
mux3ds  #(7) addval_mux (
        .in0    (addval_a[6:0]), 
        .in1    (addval_b[6:0]), 
        .in2    (7'b0000000),
        .sel0   (add_a_sel),  
        .sel1   (add_b_sel),
        .sel2   (add_c_sel),
        .dout   (add_val[6:0])
);

********/

assign add_val[6:0] =
			(addval_a[6:0] & {7{add_a_sel}}) |
			(addval_b[6:0] & {7{add_b_sel}}) ;

wire spu_maaddr_memindx_0;
assign {spu_maaddr_memindx[7:1],spu_maaddr_memindx_0} = {1'b0,add_val[6:0]} + memoffset[7:0];


assign spu_maaddr_wrindx_0 = wr_offset[0] + add_val[0];


// ----------------------
// check for out of range
// ----------------------
wire spu_maaddr_memindx_outofrange_q;

wire spu_maaddr_memindx_outofrange = (spu_maaddr_memindx[7] & spu_maaddr_memindx[6]) | 
					(spu_maaddr_memindx[7] & spu_maaddr_memindx[5]) ;


wire spu_maaddr_memindx_outofrange_sehold = sehold ? spu_maaddr_memindx_outofrange_q :
							spu_maaddr_memindx_outofrange;

dff_s #(1) spu_maaddr_memindx_outofrange_ff (
        .din(spu_maaddr_memindx_outofrange_sehold) ,
        .q(spu_maaddr_memindx_outofrange_q),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

// ----------------------
wire spu_maaddr_memindx_0_q;

wire spu_maaddr_memindx_0_sehold = sehold ? spu_maaddr_memindx_0_q :
						spu_maaddr_memindx_0;

dff_s #(1) mem_indx_0_ff (
        .din(spu_maaddr_memindx_0_sehold) ,
        .q(spu_maaddr_memindx_0_q),
        .clk (rclk), .se(1'b0),.si (),.so ()
        );

wire [3:0] spu_maaddr_mamem_eveodd_sel;
assign spu_maaddr_mamem_eveodd_sel[0] = ~(mem_bypass | spu_maaddr_memindx_outofrange_q) & ~spu_maaddr_memindx_0_q;
assign spu_maaddr_mamem_eveodd_sel[1] = ~(mem_bypass | spu_maaddr_memindx_outofrange_q) & spu_maaddr_memindx_0_q;
assign spu_maaddr_mamem_eveodd_sel[2] = ~mem_bypass & spu_maaddr_memindx_outofrange_q;
assign spu_maaddr_mamem_eveodd_sel[3] =  mem_bypass;

assign spu_maaddr_mamem_eveodd_sel_l = ~spu_maaddr_mamem_eveodd_sel;

// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// ---------------- POINTERS ------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------
// --------------------------------------------------------


// ---------------------------------------------------------------

assign len[5:0] = spu_madp_mactl_reg[5:0];
assign twolen[6:0] = {spu_madp_mactl_reg[5],spu_madp_mactl_reg[4],
		    spu_madp_mactl_reg[3],spu_madp_mactl_reg[2],
		    spu_madp_mactl_reg[1],spu_madp_mactl_reg[0],1'b0};
assign lenplus1[6:0] = {1'b0,spu_madp_mactl_reg[5:0]} + 7'b0000001;
//assign lenminus1[5:0] = spu_madp_mactl_reg[5:0] - 1'b1;
assign twolenplus1[6:0] = twolen[6:0] + 7'b0000001;
assign twolenplus2[6:0] = twolen[6:0] + 7'b0000010;



assign iminus1_rshft[6:0] = {1'b0,iminus1_ptr[6],iminus1_ptr[5],
				iminus1_ptr[4],iminus1_ptr[3],
				iminus1_ptr[2],iminus1_ptr[1]};

assign i_rshft[6:0] = {1'b0,i_ptr[6],i_ptr[5],i_ptr[4],i_ptr[3],
				i_ptr[2],i_ptr[1]};

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// start pointer comparisons.
// ---------------------------------------------------------------

//assign i_equ_len = (i_ptr_add[6:0] == {1'b0,len[5:0]}); 
assign i_equ_lenplus1 = (i_ptr[6:0] == lenplus1[6:0]); 

wire i_equ_twolenplus2_pre = (i_ptr_add[6:0] == twolenplus2[6:0]); 
wire i_equ_twolenplus1_pre = (i_ptr_add[6:0] == twolenplus1[6:0]); 

wire i_equ_twolen_pre = (i_ptr_add[6:0] == twolen[6:0]); 
wire i_equ_zero_pre = (i_ptr[6:0] == 7'b0000000); 

assign j_equ_iminus1rshft = (j_ptr[6:0] == iminus1_rshft[6:0]); 
//assign j_equ_iminuslen = (j_ptr[6:0] == iminus_len[6:0]); 
assign j_equ_iminus1 = (j_ptr[6:0] == iminus1_ptr[6:0]); 
//wire j_equ_iminus1_pre = (j_ptr_data[6:0] == i_ptr[6:0]); 
wire j_equ_len_pre = (j_ptr_data[6:0] == {1'b0,len[5:0]}); 

//assign spu_maaddr_iequtwolenplus2 = i_equ_twolenplus2;
//assign spu_maaddr_iequtwolenplus1 = i_equ_twolenplus1;
//assign spu_maaddr_iequtwolen = i_equ_twolen_pre;

//assign spu_maaddr_jequiminus1 = j_equ_iminus1;
//assign spu_maaddr_jequlen = j_equ_len;
//assign spu_maaddr_jequiminus1rshft = j_equ_iminus1rshft;

assign spu_maaddr_ieq0 = i_equ_zero_pre;
assign spu_maaddr_ieven = ~i_ptr[0];

// ***************************************************************
// start of pointers
// ***************************************************************
// ---------------------------------------------------------------

wire rst_halfpnt,halfpnt_set;

//assign rst_halfpnt = reset_local | spu_mamul_rst_iptr | ~spu_mactl_mulop;
assign rst_halfpnt = reset_local | spu_mamul_rst_iptr | spu_mamul_rst ;

dffre_s  #(1) halfpnt_ff (
        .din(1'b1) ,
        .q(halfpnt_set),
        .en(i_equ_lenplus1),
        .rst(rst_halfpnt), .clk (rclk), .se(se), .si(), .so());

assign spu_maaddr_halfpnt_set = halfpnt_set ;


// --------------------
  
wire halfpnt_set_pulse,halfpnt_set_q;

dff_s  #(1) halfpnt_set_pulse_ff (
        .din(halfpnt_set) ,
        .q(halfpnt_set_q),
        .clk (rclk), .se(se), .si(), .so());

assign halfpnt_set_pulse = ~halfpnt_set_q & halfpnt_set;
  
// ---------------------------------------------------------------
// J pointer (used for mamul and mared)
// ---------------------------------------------------------------

wire [6:0] jj_ptr_val;
wire [2:0] jptr_rst_sel;

wire j_ptr_wen = (spu_mamul_incr_jptr | spu_mamul_rst_jptr | halfpnt_set_pulse) |
		 (spu_mared_update_jptr | spu_mared_rst_jptr) |
			 spu_mared_start_wen;


// in the case of mamul we need to incr and for mared we
// need to start from msw and decr, and if we find that M is
// greater than N then we need to start from 0 and incr.

wire carryin = spu_mared_cin_set_4sub; 

wire [6:0] incr_decr_val;
mux2ds  #(7) incr_decr_val_mx2 (
        .in0    (7'b1111110),
        .in1    (7'b0000001), 
        .sel0   (carryin),  
        .sel1   (~carryin),
        .dout   (incr_decr_val[6:0])
);


assign j_ptr_add[6:0] = j_ptr[6:0] + incr_decr_val[6:0] + {6'b000000,carryin};

wire jptr_eqz_pre = ~(|j_ptr_data[6:0]);

wire jptr_eqz_q;
wire spu_maaddr_jequlen_q;

dffre_s  #(7) j_ptr_ff (
        .din(j_ptr_data[6:0]) ,
        .q(j_ptr[6:0]),
        .en(j_ptr_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

dffre_s  #(2) j_ptr_b_ff (
        .din({jptr_eqz_pre, j_equ_len_pre}) ,
        .q({jptr_eqz_q, spu_maaddr_jequlen_q}),
        .en(j_ptr_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

assign spu_maaddr_jequlen = spu_maaddr_jequlen_q;

assign spu_maaddr_jptr_eqz_mared = jptr_eqz_q;

//assign spu_maaddr_jptr_eqz = ~(|j_ptr[6:0]);

/*
assign jptr_rst_sel[0] = (spu_mamul_rst_jptr & spu_maaddr_halfpnt_set) | halfpnt_set_pulse ;
assign jptr_rst_sel[1] = (spu_mamul_rst_jptr & ~spu_maaddr_halfpnt_set) | spu_mared_rst_jptr;
assign jptr_rst_sel[2] = ~(halfpnt_set_pulse | spu_mamul_rst_jptr | spu_mared_rst_jptr |
				spu_mared_start_sel);
assign jptr_rst_sel[3] =  spu_mared_start_sel;
*/

assign jptr_rst_sel[0] = (spu_mamul_rst_jptr & spu_maaddr_halfpnt_set) | halfpnt_set_pulse ;
assign jptr_rst_sel[1] = ~(halfpnt_set_pulse | spu_mamul_rst_jptr | spu_mared_rst_jptr |
				spu_mared_start_sel);
assign jptr_rst_sel[2] =  spu_mared_start_sel;

/*
mux3ds  #(7) jptr_rst_mux (
        .in0    (iminus_len[6:0]), 
        .in1    (7'b0000000), 
        .in2    (j_ptr_add[6:0]), 
        .sel0   (jptr_rst_sel[0]),
        .sel1   (jptr_rst_sel[1]),
        .sel2   (jptr_rst_sel[2]),
        .dout   (j_ptr_data[6:0])
);*/

/*********
mux4ds  #(7) jptr_rst_mux (
        .in0    (iminus_len[6:0]),
        .in1    (7'b0000000),
        .in2    (j_ptr_add[6:0]),
        .in3    ({1'b0,spu_madp_mactl_reg[5:0]}),//when mared op starts,load the LEN into jptr.
        .sel0   (jptr_rst_sel[0]),
        .sel1   (jptr_rst_sel[1]),
        .sel2   (jptr_rst_sel[2]),
        .sel3   (jptr_rst_sel[3]),
        .dout   (j_ptr_data[6:0])
);
************/

assign j_ptr_data[6:0] =
			(iminus_len[6:0] & {7{jptr_rst_sel[0]}}) |
			(j_ptr_add[6:0] & {7{jptr_rst_sel[1]}}) |
			({1'b0,spu_madp_mactl_reg[5:0]} & {7{jptr_rst_sel[2]}}) ;
 
wire jj_ptr_update = spu_mamul_jjptr_wen | spu_mared_jjptr_wen;
dffre_s  #(7) jj_ptr_ff (
        .din(j_ptr_add[6:0]) ,
        .q(jj_ptr_val[6:0]),
        .en(jj_ptr_update),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

//wire jptr_oldnew_sel = spu_mamul_incr_jptr | spu_mared_update_jptr;
wire jptr_oldnew_sel = spu_mamul_jjptr_sel | spu_mared_update_jptr;
mux2ds  #(7) jptr_oldnew_mx2 (
        .in0    (jj_ptr_val[6:0]), 
        .in1    (j_ptr[6:0]),
        .sel0   (jptr_oldnew_sel),  
        .sel1   (~jptr_oldnew_sel),
        .dout   (jj_ptr[6:0])
);


dffre_s  #(7) j_ptr_redwr_ff (
        .din(j_ptr[6:0]) ,
        .q(j_ptr_redwr_val[6:0]),
        .en(spu_mared_update_redwr_jptr),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

// ----------------------
//saving the jptr this will be the maxlen
// for the mared subtract count.
wire [6:0] maxlen;
dffre_s  #(7) maxlen_ff (
        .din(j_ptr[6:0]) ,
        .q(maxlen[6:0]),
        .en(spu_mared_maxlen_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

//assign spu_maaddr_len_eqmax = (j_ptr[6:0] == maxlen[6:0]);
wire spu_maaddr_len_eqmax_pre = (j_ptr_data[6:0] == maxlen[6:0]);


dffre_s  #(1) len_eqmax_ff (
        .din(spu_maaddr_len_eqmax_pre) ,
        .q(spu_maaddr_len_eqmax),
        .en(j_ptr_wen),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());


// ---------------------------------------------------------------
// I pointer 
// ---------------------------------------------------------------

assign i_ptr_rst = reset_local | spu_mamul_rst_iptr;

assign i_ptr_add[6:0] = i_ptr[6:0] + 7'b0000001;

dffre_s  #(7) i_ptr_ff (
        .din(i_ptr_add[6:0]) ,
        .q(i_ptr[6:0]),
        .en(spu_mamul_incr_iptr),
        .rst(i_ptr_rst), .clk (rclk), .se(se), .si(), .so());

dffre_s  #(7) iminus1_ptr_ff (
        .din(i_ptr[6:0]) ,
        .q(iminus1_ptr[6:0]),
        .en(spu_mamul_incr_iptr),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());


wire spu_maaddr_jequiminus1_q;
wire spu_maaddr_jequiminus1rshft_q;
dffre_s  #(2) j_equ_iminus1_ff (
        .din({j_equ_iminus1, j_equ_iminus1rshft}) ,
        .q({spu_maaddr_jequiminus1_q, spu_maaddr_jequiminus1rshft_q}),
        .en(1'b1),
        .rst(reset_local), .clk (rclk), .se(se), .si(), .so());

assign spu_maaddr_jequiminus1 = spu_maaddr_jequiminus1_q;
assign spu_maaddr_jequiminus1rshft = spu_maaddr_jequiminus1rshft_q;


	// added this to fix timing path.
dffre_s  #(3) i_equ_stuff_pre_ff (
        .din({i_equ_twolenplus2_pre,i_equ_twolenplus1_pre,i_equ_twolen_pre}) ,
        .q({spu_maaddr_iequtwolenplus2,spu_maaddr_iequtwolenplus1,spu_maaddr_iequtwolen}),
        .en(spu_mamul_incr_iptr),
        .rst(i_ptr_rst), .clk (rclk), .se(se), .si(), .so());

// ---------------------------------------------------------------
// I-J pointer 
// ---------------------------------------------------------------

wire [6:0] iminusj_ptr_pre;
assign iminusj_ptr_pre[6:0] = i_ptr[6:0] + ~jj_ptr[6:0] + 7'b0000001;

dff_s  #(7) iminusj_ff (
        .din(iminusj_ptr_pre[6:0]) ,
        .q(iminusj_ptr[6:0]),
        .clk (rclk), .se(se), .si(), .so());

// assign iminusj_ptr = iminusj_ptr_pre;

// ---------------------------------------------------------------
// I-LEN-1 pointer 
// ---------------------------------------------------------------

// assign iminus_lenminus1 = i_ptr[6:0] + {1'b1,~lenminus1[5:0]} + 1'b1;
//assign iminus_lenminus1[6:0] = (i_ptr[6:0] + {1'b1,~len[5:0]} + 1'b1) - 1'b1;
assign iminus1_lenminus1[6:0] = (iminus1_ptr[6:0] + {1'b1,~len[5:0]} + 7'b0000001) - 
							7'b0000001;

// ---------------------------------------------------------------
// I-LEN pointer
// ---------------------------------------------------------------

assign iminus_len[6:0] = i_ptr[6:0] + {1'b1,~len[5:0]} + 7'b0000001;

// ---------------------------------------------------------------

/*
always @(posedge clk) begin

$display ("%t iminus1_ptr",$time);
end
*/

// ---------------------------------------------------------------
// ---------------------------------------------------------------
// --------------------- MA EXP ----------------------------------
// ---------------------------------------------------------------
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// ^^^^^^^^^^^^^^ ES COUNTER ^^^^^^^^^^^
// ---------------------------------------------------------------

wire [10:0] es_add,es_ptr;

assign es_add = es_ptr  + 11'b00000000001;

dffre_s  #(11) es_ptr_ff (
        .din(es_add[10:0]) ,
        .q(es_ptr[10:0]),
        .en(spu_maexp_incr_es_ptr),
        .rst(spu_maexp_es_e_ptr_rst), .clk (rclk), .se(se), .si(), .so());

// ---------------------------------------------------------------
// ^^^^^^^^^ ES_MAX_MINUS1 & COMPARE ^^^^^^^^^
// ---------------------------------------------------------------
wire [10:0] es_max_minus1_q,es_max_minus1;
//wire [8:0] es_max_plus1;
wire [7:0] es_max_plus1;

//assign es_max_plus1[8:0] = {1'b0,spu_madp_maaddr_reg[47:40]} + 9'b000000001;
assign es_max_plus1[7:0] = spu_madp_maaddr_reg[47:40] + 8'b00000001;

// vlint error:left size: 11,  right size: 12
//assign es_max_minus1[10:0] = {es_max_plus1[8:0],3'b000} - 11'b00000000001;
assign es_max_minus1[10:0] = {es_max_plus1[7:0],3'b000} - 11'b00000000001;

dffre_s  #(11) esmax_minus1_ptr_ff (
        .din(es_max_minus1[10:0]) ,
        .q(es_max_minus1_q[10:0]),
        .en(spu_maexp_es_max_init),//save es_max at start of maexp_op
        .rst(spu_maexp_es_e_ptr_rst), .clk (rclk), .se(se), .si(), .so());

assign spu_maaddr_esmax = (es_max_minus1_q[10:0] == es_ptr[10:0]);


// ---------------------------------------------------------------
// ^^^^^^^^^^^^^^ MOD64 CHECK ^^^^^^^^^^^
// ---------------------------------------------------------------

wire max_mod64_reached;
wire max_mod64_reached_q;
wire max_mod64_reached_pulse;


assign max_mod64_reached = &es_ptr[5:0];

assign spu_maaddr_esmod64 = max_mod64_reached;

dff_s  #(1) mod64_pulse_ff (
        .din(max_mod64_reached) ,
        .q(max_mod64_reached_q),
        .clk (rclk), .se(se), .si(), .so());

assign max_mod64_reached_pulse = ~max_mod64_reached_q & max_mod64_reached;

// ---------------------------------------------------------------
// ^^^^^^^^^^^^^^ E PTR ^^^^^^^^^^^
// ---------------------------------------------------------------
// E ptr 
wire [6:0] e_add;

assign e_add = e_ptr + 7'b0000001;

dffre_s  #(7) e_ptr_ff (
        .din(e_add[6:0]) ,
        .q(e_ptr[6:0]),
        .en(max_mod64_reached_pulse),
        .rst(spu_maexp_es_e_ptr_rst), .clk (rclk), .se(se), .si(), .so());


endmodule

